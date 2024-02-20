onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group top /test_top/CLK
add wave -noupdate -expand -group top /test_top/RESETN
add wave -noupdate -expand -group top /test_top/PADDR
add wave -noupdate -expand -group top /test_top/PWDATA
add wave -noupdate -expand -group top /test_top/PWRITE
add wave -noupdate -expand -group top /test_top/PSEL
add wave -noupdate -expand -group top /test_top/PENABLE
add wave -noupdate -expand -group top /test_top/PRDATA
add wave -noupdate -expand -group top /test_top/PREADY
add wave -noupdate -expand -group top /test_top/PSLVERR
add wave -noupdate -expand -group top /test_top/rx_i
add wave -noupdate -expand -group top /test_top/tx_o
add wave -noupdate -expand -group top /test_top/event_o
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/clk
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/reset_n
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/clr_i
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/ready_i
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/valid_i
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/data_i
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/ready_o
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/valid_o
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/elements_o
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/data_o
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/empty
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/full
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/error
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/pointer_in
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/pointer_out
add wave -noupdate -expand -group tx_fifo /test_top/apb_uart/uart_tx_fifo/elements
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/clk
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/reset_n
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/cfg_en_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/cfg_div_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/cfg_parity_en_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/cfg_bits_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/cfg_stop_bits_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/tx_data_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/tx_valid_i
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/tx_ready_o
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/tx_o
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/busy_o
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/current_state
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/next_state
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/reg_data
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/reg_data_next
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/reg_bit_count
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/reg_bit_count_next
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/s_target_bits
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/parity_bit
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/parity_bit_next
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/sampleData
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/baud_cnt
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/baudgen_en
add wave -noupdate -expand -group tx /test_top/apb_uart/uart_tx/bit_done
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/clk
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/reset_n
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/clr_i
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/ready_i
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/valid_i
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/data_i
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/ready_o
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/valid_o
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/elements_o
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/data_o
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/empty
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/full
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/error
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/pointer_in
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/pointer_out
add wave -noupdate -expand -group rx_fifo /test_top/apb_uart/uart_rx_fifo/elements
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/clk
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reset_n
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_tx/tx_o
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/rx_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/cfg_div_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/cfg_en_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/cfg_parity_en_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/cfg_bits_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/busy_o
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/err_o
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/err_clr_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/rx_data_o
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/rx_valid_o
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/rx_ready_i
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/current_state
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/next_state
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reg_data
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reg_data_next
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reg_rx_sync
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reg_bit_count
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/reg_bit_count_next
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/s_target_bits
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/parity_bit
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/parity_bit_next
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/sampleData
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/baud_cnt
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/baudgen_en
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/bit_done
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/start_bit
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/set_error
add wave -noupdate -expand -group rx /test_top/apb_uart/uart_rx/s_rx_fall
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12909 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {22337 ns}
