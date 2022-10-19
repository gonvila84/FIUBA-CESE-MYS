#!/bin/bash
ghdl -a ./TP_FINAL_UP_DOWN_COUNTER.srcs/sources_1/imports/hdl/contador.vhd  ./TP_FINAL_UP_DOWN_COUNTER.srcs/sources_1/imports/hdl/contadorTestBench.vhd
ghdl -s ./TP_FINAL_UP_DOWN_COUNTER.srcs/sources_1/imports/hdl/contador.vhd  ./TP_FINAL_UP_DOWN_COUNTER.srcs/sources_1/imports/hdl/contadorTestBench.vhd 
ghdl -e incDecCounter_tb
ghdl -r incDecCounter_tb --vcd=contadorTestBench.vcd --stop-time=10000ns
gtkwave contadorTestBench.vcd