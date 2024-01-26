#1 clock creation 50% duty cycle 10ns period name clk
create_clock [get_ports clk] -name clk -period 10 -waveform {0 5} 

#2 latency of clock to 400ps
set_clock_latency 0.4 clk

#3 clock uncertainty 50ps
set_clock_uncertainty 0.05 clk

#4 transition time to 1% of period of clock
set_clock_transition 0.1  clk

#5 output delay for all outputs for setup analysis at 1ns combined with the clock delay 
set_output_delay -clock clk -network_latency_included -max 1 [all_outputs]

#6 output delay for all outputs for hold analysis at 0.4ns combined with the clock delay 
set_output_delay -clock clk -network_latency_included -min 0.4 [all_outputs]

#7 output load for setup time analysis at 0.5pf
set_load 0.5 -max [all_outputs]

#8 output load for hold time analysis at 0.01pf
set_load 0.01 -min [all_outputs]

#9 input delay for all inputs for setup analysis at 1ns combined with the clock delay 
set_input_delay -clock clk -network_latency_included -max 1 [all_inputs]

#10 input delay for all inputs for hold analysis at 0.4ns combined with the clock delay 
set_input_delay -clock clk -network_latency_included -min 0.4 [all_inputs]

#11 cell to drive the inputs for setup analysis
set_driving_cell -lib_cell BUFX2 -max [all_inputs]

#11 cell to drive the inputs for hold analysis
set_driving_cell -lib_cell BUFX16 -min [all_inputs]