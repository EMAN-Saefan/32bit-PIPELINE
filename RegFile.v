module RegFile(input clock,
		input clear,
		input[4:0] RA,
		output[31:0] read_data1,
		input[4:0] RB,
		output[31:0] read_data2,
		input write,
		input[4:0] RW,
		input[31:0] write_data);

	reg[31:0] content[31:0];
	integer i;

	always @(posedge clear, negedge clock)
		if (clear) begin

			// Reset all registers
			for (i = 0; i < 32; i = i + 1)
				content[i] = 0;

			// Set initial values
			content[1] = 1;			// $1 = 1
			content[2] = 2;			// $2 = 2
			content[10] = 32'h10010000;	// $10 = 0x10010000
		end else if (write) begin
			content[RW] = write_data;
			$display("\tR[%d] = %x (hex)", RW, write_data);
		end

	// A read to register 0 always returns 0
	assign read_data1 = RA == 0 ? 0 : content[RA];
	assign read_data2 = RB == 0 ? 0 : content[RB];

endmodule
