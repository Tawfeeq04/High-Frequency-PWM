module pcm(
input wire [7:0] msg_signal,
input wire clk,
output reg out);
	
	reg [7:0] count;
	reg [7:0] code;
	reg [7:0] data;

	always @(posedge clk) begin
		if(count > 255) begin
			count <= 0;
			code <= msg_signal;
		end
		else begin
			if(count <= code) begin
				data [count] <= 1;
			end
			else begin
				data [count] <= 0;
			end
		end
		count <= count + 1;
		out <= data [count];
	end
endmodule
