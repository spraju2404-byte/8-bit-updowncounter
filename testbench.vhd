timescale 1ns / 1ps

module tb_up_down_counter;

    // Inputs
    reg clk;
    reg reset;
    reg mode;

    // Outputs
    wire [7:0] count;

    // Instantiate the Unit Under Test (UUT)
    up_down_counter_8bit uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .count(count)
    );

    // Clock generation: 100MHz (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        mode = 1; // Start in UP mode

        // Wait 100ns for global reset to finish
        #100;
        reset = 0;
        
        // --- Test Up Counting ---
        // Note: In simulation, you may need to wait a long time 
        // to see 'count' change because of the clk_div[25] logic.
        #200;
        
        // --- Test Down Counting ---
        mode = 0;
        #200;

        // --- Test Reset during operation ---
        reset = 1;
        #50;
        reset = 0;
        mode = 1;

        // Finish simulation
        #1000;
        $stop;
    end
      
    // Monitor changes in the console
    initial begin
        $monitor("Time=%0t | Reset=%b | Mode=%b | Count=%d", $time, reset, mode, count);
    end

endmodule
