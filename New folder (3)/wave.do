onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_CF_CARD_V2/clk
add wave -noupdate /tb_CF_CARD_V2/reset
add wave -noupdate /tb_CF_CARD_V2/Address_Bus_A
add wave -noupdate /tb_CF_CARD_V2/Data_Bus_A_In
add wave -noupdate /tb_CF_CARD_V2/Data_Bus_B_In
add wave -noupdate /tb_CF_CARD_V2/CE1_A
add wave -noupdate /tb_CF_CARD_V2/CE2_A
add wave -noupdate /tb_CF_CARD_V2/OE_A
add wave -noupdate /tb_CF_CARD_V2/WE_A
add wave -noupdate /tb_CF_CARD_V2/CS0_A
add wave -noupdate /tb_CF_CARD_V2/CS1_A
add wave -noupdate /tb_CF_CARD_V2/IORD_A
add wave -noupdate /tb_CF_CARD_V2/IOWR_A
add wave -noupdate /tb_CF_CARD_V2/INTRQ_A
add wave -noupdate /tb_CF_CARD_V2/RDY
add wave -noupdate /tb_CF_CARD_V2/Data_RDY
add wave -noupdate /tb_CF_CARD_V2/Address_Ok
add wave -noupdate /tb_CF_CARD_V2/Req
add wave -noupdate /tb_CF_CARD_V2/CE1_B
add wave -noupdate /tb_CF_CARD_V2/CE2_B
add wave -noupdate /tb_CF_CARD_V2/OE_B
add wave -noupdate /tb_CF_CARD_V2/WE_B
add wave -noupdate /tb_CF_CARD_V2/CS0_B
add wave -noupdate /tb_CF_CARD_V2/CS1_B
add wave -noupdate /tb_CF_CARD_V2/IORD_B
add wave -noupdate /tb_CF_CARD_V2/IOWR_B
add wave -noupdate /tb_CF_CARD_V2/INTRQ_B
add wave -noupdate /tb_CF_CARD_V2/Address_Bus_B
add wave -noupdate /tb_CF_CARD_V2/Data_Bus_A_Out
add wave -noupdate /tb_CF_CARD_V2/Data_Bus_B_Out
add wave -noupdate /tb_CF_CARD_V2/ACK
add wave -noupdate /tb_CF_CARD_V2/Set_Reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4950 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 303
configure wave -valuecolwidth 314
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {9152 ps}
