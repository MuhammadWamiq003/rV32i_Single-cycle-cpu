module immediategen (
    input wire [31:0]instr,
    output reg [31:0] i_imme,
    output reg [31:0] s_imme,
    output reg [31:0] sb_imme,
    output reg [31:0] jal_imme
);

    always @(*) begin

            i_imme = {{20{instr[31]}}, instr[31:20]};
            s_imme = {{20{instr[31]}}, instr[31:25], instr[11:7]};
           sb_imme = {{19{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8],1'b0};
           jal_imme = {{19{instr[31]}},instr[31],instr[19:12],instr[20],instr[30:21],1'b0};
    end
endmodule