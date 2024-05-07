module alu(a,b,result,select);
input [31:0] a, b;
input [2:0] select;
output [31:0] result;
reg [31:0] result;
always @(a or b or select)
begin
case (select)
0: result = a & b;
1: result = a | b;
2: result = a + b;
6: result = a - b;
7: result = (a-b)>>31;
default: result = 0;
endcase
end
endmodule
