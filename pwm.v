module pcm(
input wire [7:0] msg_signal,
input wire clk,
output reg out);
	
	reg [7:0] count = 0;
	reg [7:0] code = 0;

	always @(posedge clk) begin
		count <= count + 1;
		if(count < code) begin
			out <= 1;
		end
		else if(count >= code) begin
			out <= 0;
		end
		if(count == 256) begin
			count <= 0;
			code <= msg_signal;
		end
	end
endmodule