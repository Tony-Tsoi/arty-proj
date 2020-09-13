module counter (clk, reset, out);

input clk, reset;
output out;

parameter MAX_COUNT = 26'd49999999; // 0.5s for 100MHz clk

reg [25:0] count, count_c;

assign out = (count == 26'd0);

always @(*) begin
	// default
	count_c = count - 26'd1;
	
	if (count == 26'd0)
		count_c = MAX_COUNT;
	
	if (reset == 1'b1)
		count_c = MAX_COUNT;
end

always @(posedge clk)
	count <= count_c;

endmodule