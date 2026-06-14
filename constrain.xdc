# ----------------------------------------------------------------------------
# Clock Signal - 100MHz Oscillator
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports {clk}];
set_property IOSTANDARD LVCMOS33 [get_ports {clk}];
create_clock -period 10.000 -name clk_100 [get_ports clk]

# ----------------------------------------------------------------------------
# Reset - Center Push Button (BTNC)
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN P16 [get_ports {reset}];
set_property IOSTANDARD LVCMOS33 [get_ports {reset}];

# -----------------------------------------------------------------------------
# Mode - Slide Switch 0 (SW0)
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN F22 [get_ports {mode}];
set_property IOSTANDARD LVCMOS25 [get_ports {mode}];

# ----------------------------------------------------------------------------
# 8-bit Count Output - Onboard LEDs (LD0 to LD7)
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports {count[0]}]; # LD0
set_property PACKAGE_PIN T21 [get_ports {count[1]}]; # LD1
set_property PACKAGE_PIN U22 [get_ports {count[2]}]; # LD2
set_property PACKAGE_PIN U21 [get_ports {count[3]}]; # LD3
set_property PACKAGE_PIN V22 [get_ports {count[4]}]; # LD4
set_property PACKAGE_PIN W22 [get_ports {count[5]}]; # LD5
set_property PACKAGE_PIN U19 [get_ports {count[6]}]; # LD6
set_property PACKAGE_PIN U14 [get_ports {count[7]}]; # LD7

# Set I/O voltage for all LEDs
set_property IOSTANDARD LVCMOS33 [get_ports {count[*]}];
