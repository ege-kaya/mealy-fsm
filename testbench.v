`timescale 1ns/1ns
module testbench();

wire [1:0] y;
wire [1:0] stateReg;
wire [1:0] nextStateReg;
reg x;
reg rst;
reg clk;

source s(y, stateReg, nextStateReg, x, rst, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, y, stateReg, nextStateReg, x, rst, clk);
    
    rst = 1;
    x = 0;
    #20;
    rst = 0;
	x = 0;
    #20;
	x = 1;
    #20;
	x = 1;
    #20;
	x = 1;
    #20;
	x = 0;
    #20;
	x = 1;
    #20;
	x = 0;
    #20;
	#80;
	
    $finish;
end

always begin	
	clk = 0;
	#20;
	clk = 1;
	#20;
    end

endmodule

