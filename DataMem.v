module DataMem (
    input wire [7:0] addr,
    input wire [31:0] data_in,
    input wire write_enable,
    input wire clk,
    output reg [31:0] data_out,
    output reg wd
);

    reg [31:0] mem [255:0]; // Define memory with 256 entries, each 32 bits wide

    always @(posedge clk) begin
        if (write_enable) begin
            mem[addr] <= data_in;
            wd <= 1; // Assuming wd is a write-done signal
        end else begin
            wd <= 0;
        end

        data_out <= mem[addr];
    end

endmodule
