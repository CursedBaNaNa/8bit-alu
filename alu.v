`timescale 1ns / 1ps

module alu (
    input  [7:0] A,          
    input  [7:0] B,          
    input  [2:0] ALU_Sel,    
    output reg [7:0] Result, 
    output reg Zero          
);

    
    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam AND = 3'b010;
    localparam OR  = 3'b011;
    localparam XOR = 3'b100;

    always @(*) begin
       
        case(ALU_Sel)
            ADD: Result = A + B;
            SUB: Result = A - B;
            AND: Result = A & B;
            OR:  Result = A | B;
            XOR: Result = A ^ B;
            default: Result = 8'h00; // Default case
        endcase
        
       
        Zero = (Result == 8'h00) ? 1'b1 : 1'b0;
    end

endmodule