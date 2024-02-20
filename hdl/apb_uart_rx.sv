module apb_uart_rx (
  input                   clk,
  input                   reset_n,
  input                   rx_i,
  input        [15:0]     cfg_div_i,
  input                   cfg_en_i,
  input                   cfg_parity_en_i,
  input        [1:0]      cfg_bits_i,
  // input  logic            cfg_stop_bits_i,
  output logic            busy_o,
  output logic            err_o,
  input  logic            err_clr_i,
  output logic [7:0]      rx_data_o,
  output logic            rx_valid_o,
  input  logic            rx_ready_i
  );

  enum logic [2:0] {
    ST_IDLE,
    ST_START_BIT,
    ST_DATA,
    ST_SAVE_DATA,
    ST_PARITY,
    ST_STOP_BIT} current_state, next_state;

  logic [7:0]  reg_data;
  logic [7:0]  reg_data_next;

  logic [2:0]  reg_rx_sync;


  logic [2:0]  reg_bit_count;
  logic [2:0]  reg_bit_count_next;

  logic [2:0]  s_target_bits;

  logic        parity_bit;
  logic        parity_bit_next;

  logic        sampleData;

  logic [15:0] baud_cnt;
  logic        baudgen_en;
  logic        bit_done;

  logic        start_bit;
  logic        set_error;
  logic        s_rx_fall;

  assign busy_o = (current_state != ST_IDLE);

  always_comb begin
    case(cfg_bits_i)
      2'b00: s_target_bits = 3'h4;
      2'b01: s_target_bits = 3'h5;
      2'b10: s_target_bits = 3'h6;
      2'b11: s_target_bits = 3'h7;
    endcase
  end

  always_comb begin
    sampleData = 1'b0;
    reg_bit_count_next  = reg_bit_count;
    reg_data_next = reg_data;
    rx_valid_o = 1'b0;
    baudgen_en = 1'b0;
    start_bit  = 1'b0;
    parity_bit_next = parity_bit;
    set_error  = 1'b0;

    case(current_state)
      ST_IDLE: begin
        if (s_rx_fall) begin
          next_state = ST_START_BIT;
          baudgen_en = 1'b1;
          start_bit  = 1'b1;
        end
        else begin
          next_state = ST_IDLE;
        end
      end
      ST_START_BIT:
      begin
        parity_bit_next = 1'b0;
        baudgen_en = 1'b1;
        start_bit  = 1'b1;
        if (bit_done) begin
          next_state = ST_DATA;
        end
        else begin
          next_state = ST_START_BIT;
        end
      end
      ST_DATA: begin
        baudgen_en = 1'b1;
        parity_bit_next = parity_bit ^ reg_rx_sync[2];
        case(cfg_bits_i)
          2'b00: reg_data_next = {3'b000,reg_rx_sync[2],reg_data[4:1]};
          2'b01: reg_data_next = {2'b00,reg_rx_sync[2],reg_data[5:1]};
          2'b10: reg_data_next = {1'b0,reg_rx_sync[2],reg_data[6:1]};
          2'b11: reg_data_next = {reg_rx_sync[2],reg_data[7:1]};
        endcase
        if (bit_done) begin
          sampleData = 1'b1;
          if (reg_bit_count == s_target_bits) begin
            reg_bit_count_next = 'h0;
            next_state = ST_SAVE_DATA;
          end
          else begin
            reg_bit_count_next = reg_bit_count + 1;
            next_state = ST_DATA;
          end
        end
        else begin
          next_state = ST_DATA;
        end
      end
      ST_SAVE_DATA: begin
        baudgen_en = 1'b1;
        rx_valid_o = 1'b1;
        if(rx_ready_i) begin
          if (cfg_parity_en_i) begin
            next_state = ST_PARITY;
          end
          else begin
            next_state = ST_STOP_BIT;
          end
        end
        else begin
          next_state = ST_SAVE_DATA;
        end
      end
      ST_PARITY: begin
        baudgen_en = 1'b1;
        if (bit_done) begin
          if(parity_bit != reg_rx_sync[2]) begin
            set_error = 1'b1;
          end
          next_state = ST_STOP_BIT;
        end
        else begin
          next_state = ST_PARITY;
        end
      end
      ST_STOP_BIT: begin
        baudgen_en = 1'b1;
        if (bit_done) begin
          next_state = ST_IDLE;
        end
        else begin
          next_state = ST_STOP_BIT;
        end
      end
      default: next_state = ST_IDLE;
    endcase
  end

  always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
      current_state  <= ST_IDLE;
      reg_data       <= 8'hFF;
      reg_bit_count  <=  'h0;
      parity_bit     <= 1'b0;
    end
    else begin
      if(bit_done) begin
        parity_bit <= parity_bit_next;
      end
      if(sampleData) begin
        reg_data <= reg_data_next;
      end

      reg_bit_count  <= reg_bit_count_next;
      if(cfg_en_i) begin
        current_state <= next_state;
      end
      else begin
        current_state <= ST_IDLE;
      end
    end
  end

  assign s_rx_fall = ~reg_rx_sync[1] & reg_rx_sync[2];
  always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n)
      reg_rx_sync <= 3'b111;
    else begin
      if (cfg_en_i) begin
        reg_rx_sync <= {reg_rx_sync[1:0],rx_i};
      end
      else begin
        reg_rx_sync <= 3'b111;
      end
    end
  end

  always_ff @(posedge clk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
      baud_cnt <= 'h0;
      bit_done <= 1'b0;
    end
    else begin
      if(baudgen_en) begin
        if(!start_bit && (baud_cnt == cfg_div_i)) begin
          baud_cnt <= 'h0;
          bit_done <= 1'b1;
        end
        else if(start_bit && (baud_cnt == {1'b0,cfg_div_i[15:1]})) begin
          baud_cnt <= 'h0;
          bit_done <= 1'b1;
        end
        else begin
          baud_cnt <= baud_cnt + 1;
          bit_done <= 1'b0;
        end
      end
      else begin
        baud_cnt <= 'h0;
        bit_done <= 1'b0;
      end
    end
  end

  always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
      err_o <= 1'b0;
    end
    else begin
      if(err_clr_i) begin
        err_o <= 1'b0;
      end
      else begin
        if(set_error) begin
          err_o <= 1'b1;
        end
      end
    end
  end

  assign rx_data_o = reg_data;

endmodule