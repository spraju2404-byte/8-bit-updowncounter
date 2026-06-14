timescale 1ns / 1ps

Wmodule up_down_counter_8bit (
    input clk,           // 100MHz onboard clock (Pin Y9)
    input reset,         // Center Button (Pin P16)
    input mode,          // Switch 0 (Pin F22)
    output reg [7:0] count // 8 LEDs (Pins T22 to U14)
);

    // Internal 27-bit register to slow down the 100MHz clock
    reg [26:0] clk_div; 
    wire slow_clk;

    // 1. Clock Divider Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            clk_div <= 0;
        else
            clk_div <= clk_div + 1;
    end

    // Use bit 25 to create a visible pulse (~1.5Hz toggle)
    assign slow_clk = clk_div[25]; 

    // 2. Counter Logic (The Brain)
    always @(posedge slow_clk or posedge reset) begin
        if (reset) begin
            // Reset to zero when button is pressed
            count <= 8'b00000000;
        end 
        else begin
            // Check the mode switch to decide direction
            if (mode)
                count <= count + 1; // Mode = 1 (Up)
            else
                count <= count - 1; // Mode = 0 (Down)
        end
    end

endmodule
