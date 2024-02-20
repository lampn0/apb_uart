`timescale 1ns/1ns
module test_top #(
  parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
  )();
logic                           CLK;
logic                           RESETN;
logic [APB_ADDR_WIDTH-1:0]      PADDR;
logic [31:0]                    PWDATA;
logic                           PWRITE;
logic                           PSEL;
logic                           PENABLE;
logic [31:0]                    PRDATA;
logic                           PREADY;
logic                           PSLVERR;
logic                           rx_i;
logic                           tx_o;
logic                           event_o;

apb_uart #(
  .APB_ADDR_WIDTH(APB_ADDR_WIDTH)
  ) apb_uart (
  .CLK    (CLK),
  .RESETN (RESETN),
  .PADDR  (PADDR),
  .PWDATA (PWDATA),
  .PWRITE (PWRITE),
  .PSEL   (PSEL),
  .PENABLE(PENABLE),
  .PRDATA (PRDATA),
  .PREADY (PREADY),
  .PSLVERR(PSLVERR),
  .rx_i   (rx_i),
  .tx_o   (tx_o),
  .event_o(event_o)
  );

always #10 CLK = ~CLK;

task Write_IER();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h004;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_IER

task Write_FCR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h008;
  PWDATA  = 8'h01;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_FCR

task Write_LCR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h00C;
  PWDATA  = 8'b1_0_11;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_LCR

task Write_MCR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h010;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_MCR

task Write_SCR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h01C;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_SCR

task Write_DLL();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h020;
  PWDATA  = 8'h0F;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_DLL

task Write_DLH();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h024;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_DLH

task Write_MDR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h028;
  PWDATA  = 8'h00;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_MDR

task Write_THR(logic [7:0] tx_data_in);
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 1;
  PADDR   = 12'h000;
  PWDATA  = tx_data_in;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 1;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
endtask : Write_THR

task Send_rx(logic [7:0] rx_data_out);
  int baud_clk;
  baud_clk = {apb_uart.reg_dlh_dlh,apb_uart.reg_dll_dll} + 1;
  @(posedge CLK);
  rx_i = 1'b0;
  for (int i = 0; i < 8; i++) begin
    repeat (baud_clk) @(posedge CLK);
    rx_i = rx_data_out[i];
  end
  repeat (baud_clk) @(posedge CLK);
  rx_i = ^rx_data_out;
  repeat (baud_clk) @(posedge CLK);
  rx_i = 1'b1;
  repeat (baud_clk) @(posedge CLK);
  repeat (baud_clk) @(posedge CLK);
  repeat (baud_clk) @(posedge CLK);
endtask : Send_rx

task Read_RBR();
  @(posedge CLK);
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
  PWDATA  = '0;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = 12'h000;
  @(posedge CLK);
  PSEL    = 1;
  PENABLE = 1;
  PWRITE  = 0;
  @(posedge CLK);
  while (PREADY == 0) begin
    @(posedge CLK);
  end
  PSEL    = 0;
  PENABLE = 0;
  PWRITE  = 0;
  PADDR   = '0;
endtask : Read_RBR


initial begin
  CLK     = 0;
  RESETN  = 1;
  PADDR   = '0;
  PWDATA  = '0;
  PWRITE  = 0;
  PSEL    = 0;
  PENABLE = 0;
  rx_i    = 1;
  #27ns;
  RESETN  = 0;
  #29ns;
  RESETN  = 1;
  @(posedge CLK);
  Write_IER();
  Write_FCR();
  Write_LCR();
  Write_MCR();
  Write_SCR();
  Write_DLL();
  Write_DLH();
  Write_MDR();
  fork
    begin
      Write_THR(8'h81); // 1000_0001
      Write_THR(8'hFF); // 1010_1010
      Write_THR(8'hF0);
      Write_THR(8'h0F);
      Write_THR(8'h3A);
      Write_THR(8'h77);
    end
    begin
      Send_rx(8'h81);
      Send_rx(8'hFF);
      Send_rx(8'hF0);
      Send_rx(8'h0F);
    end
  join
  Read_RBR();
  #2000ns;
  $finish;
end

endmodule : test_top