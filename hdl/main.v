module main( sw, btn, led, led0_b, led0_g, led0_r, led1_b, led1_g, led1_r, 
	led2_b, led2_g, led2_r, led3_b, led3_g, led3_r );

// board inputs
input [3:0] sw; // SW3 to SW0
input [3:0] btn; // BTN3 to BTN0

// board outputs
output [3:0] led; // LD7 to LD4
output led0_b, led0_g, led0_r; // LD0
output led1_b, led1_g, led1_r; // LD1
output led2_b, led2_g, led2_r; // LD2
output led3_b, led3_g, led3_r; // LD3

// LD0 = white
assign led0_r = 1'b1;
assign led0_g = 1'b1;
assign led0_b = 1'b1;

// LD1 = off
assign led1_r = 1'b0;
assign led1_g = 1'b0;
assign led1_b = 1'b0;

// LD2 = magenta
assign led2_r = 1'b1;
assign led2_g = 1'b0;
assign led2_b = 1'b1;

// LD3 = green
assign led3_r = 1'b0;
assign led3_g = 1'b1;
assign led3_b = 1'b0;

// light up either button or switch is on
assign led = btn ^ sw;

endmodule