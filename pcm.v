module pcm(
input wire [7:0] msg_signal,
input wire clk,
output reg out);
	
	reg [2:0] count;
	reg [2:0] code;
	reg [7:0] data;

	always @(posedge clk) begin
		if(count > 7) begin
			count <= 0;
			code <= msg_signal*5;
		end
		else begin
			if(count <= code) begin
				data [count] <= 1;
				count <= count+1;
			end
			else begin
				data [count] <= 0;
				count <= count+1;
			end
		end
		out <= data [count];
	end
endmodule
