module alu32_tb;
// to do 32 bits alu
reg [2:0] t_aluop;
reg [31:0] t_a;
reg [31:0] t_b;
reg [31:0] t_r;
wire t_V;
wire t_c31;

alu32 my_gate( .a(t_a), .b(t_b), 
				.aluop(t_aluop), .r(t_r), .V(t_V) , .c31(t_c31) );
					
initial begin
	/******************** test cases ********************/
	
	//with 000 - AND
	#5
	t_aluop = 3'b000;
	t_a = 32'b01011011100111001101010101010100;
	t_b = 32'b10101010111000011010101010110101;
	
	#5
	t_a = 32'b10111101000101010100101010101111;
	t_b = 32'b01000111101011101011010010100101;

	//with 001 - OR
	#5
	t_aluop = 3'b001;
	t_a = 32'b01011011101010100111010101100100;
	t_b = 32'b01011101011100001101010110100101;
	
	#5
	t_a = 32'b01010101011010101111010011010001;
	t_b = 32'b10010101111101010101010101100000;
	
	//with 010 - ADD
	#5
	t_aluop = 3'b010;
	t_a = 32'b01001011010101010101010101100111;
	t_b = 32'b11101010001000101101010100011101;
	
	#5
	t_a = 32'b00011001001101010110111101000001;
	t_b = 32'b01010111100101110110101101001011;
	
	//with 110 - SUBTRACT
	#5
	t_aluop = 3'b110;
	t_a = 32'b01001011010101010101010101100111;
	t_b = 32'b11101010001000101101010100011101;
	
	#5
	t_a = 32'b10101001001101010101010010110101;
	t_b = 32'b00101011110010111011010110100101;
		
	// with 111 - SET-ON-LESS-THAN
	#5
	t_aluop = 3'b111;
	t_a = 32'b00000000000000000000000000000000;
	t_b = 32'b10101010111000011010101010110101;

	#5
	t_b = 32'b00000000000000000000000000000000;
	t_a = 32'b10101010111000011010101010110101;
	
end
endmodule 