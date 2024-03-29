module alu (
    input wire [31:0]a_i,
    input wire [31:0]b_i,
    input wire [3:0]op_i,
    output reg [31:0] res_o
);

always @(*) begin
    if(op_i==4'b0000)begin //add
        res_o = a_i + b_i; 
    end
    else if(op_i==4'b0001)begin
        res_o = a_i - b_i; //sub
    end
    else if(op_i==4'b0010)begin
        res_o = a_i << b_i; //shift left logical
    end
    else if(op_i==4'b0011)begin
        res_o = ($signed(a_i) < $signed(b_i))? 1: 0; //shift less then
    end
    else if(op_i==4'b0100)begin
        res_o = (a_i < b_i)? 1 : 0; //set less then unsigned
    end
    else if(op_i==0101)begin
        res_o = a_i ^ b_i; //xor
    end
    else if(op_i==0110)begin
        res_o = a_i >> b_i; //shift right logical
    end
    else if(op_i==0111)begin
        res_o = a_i >>> b_i; //shift right airthmatic
    end
    else if(op_i==1000)begin
        res_o = a_i | b_i; //or
    end
    else if(op_i==1001)begin
        res_o = a_i & b_i; //and
    end
    else begin
        res_o = 0;
    end
end
endmodule