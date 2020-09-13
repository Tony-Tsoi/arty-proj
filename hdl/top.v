module top(CLK100MHZ, sw, btn, led, led0_b, led0_g, led0_r, led1_b, led1_g, led1_r, 
	led2_b, led2_g, led2_r, led3_b, led3_g, led3_r );

// board inputs
input CLK100MHZ;
input [3:0] sw; // SW3 to SW0
input [3:0] btn; // BTN3 to BTN0

// board outputs
output [3:0] led; // LD7 to LD4
output led0_b, led0_g, led0_r; // LD0
output led1_b, led1_g, led1_r; // LD1
output led2_b, led2_g, led2_r; // LD2
output led3_b, led3_g, led3_r; // LD3

// submodule declarations
wire cntrout;
counter CNTR (.clk(CLK100MHZ), .reset(sw[0]), .out(cntrout));

// rgb led counter regs
reg [11:0] rgbcount, rgbcount_c;

// assign rgb led counter bits to the leds
assign led3_r = rgbcount[11];
assign led3_g = rgbcount[10];
assign led3_b = rgbcount[9];

assign led2_r = rgbcount[8];
assign led2_g = rgbcount[7];
assign led2_b = rgbcount[6];

assign led1_r = rgbcount[5];
assign led1_g = rgbcount[4];
assign led1_b = rgbcount[3];

assign led0_r = rgbcount[2];
assign led0_g = rgbcount[1];
assign led0_b = rgbcount[0];


// light up either button or switch is on
assign led = btn ^ sw;

// 12 bit counter for rgb leds
always @(*) begin
	// default
	rgbcount_c = rgbcount;

	if (cntrout == 1'b1)
		rgbcount_c = rgbcount + 12'd1;
	
	if (rgbcount == 12'hfff)
		rgbcount_c = 12'd0;
	
	if (sw[0] == 1'b0) // rgb count up only when switch 0 on
		rgbcount_c = 12'd0;
end

// FF
always @(posedge CLK100MHZ) begin
	rgbcount <= rgbcount_c;
end

endmodule