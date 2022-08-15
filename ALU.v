module ALU #(parameter WIDTH = 32)
(
input	wire	[WIDTH-1:0]		SrcA,
input	wire	[WIDTH-1:0]		SrcB,
input	wire	[2:0]			ALUControl,

output	reg		[WIDTH-1:0]		ALUResult,
output	wire					Zero

);

always @(*)
begin
	case (ALUControl)
    3'b000:begin
        ALUResult = SrcA & SrcB;
    end

    3'b001 : begin
		ALUResult = SrcA | SrcB ;
    end

    3'b010 : begin
		ALUResult = SrcA + SrcB ;
	end

	3'b100 : begin
		ALUResult = SrcA - SrcB ;
	end
		
    3'b101 : begin
	    ALUResult = SrcA * SrcB ;
	end
		
	3'b110 : begin
	    if (SrcA < SrcB) begin
            ALUResult = 'b1;
        end else begin
            ALUResult = 'b0;
        end
    end
		
	default : begin
		ALUResult = 'b0 ;
	end
	
	endcase
end

assign Zero = ( ALUResult == 'b0 ) ;

endmodule
