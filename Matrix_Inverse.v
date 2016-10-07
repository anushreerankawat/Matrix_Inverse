`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// 
// NAME :- Anushree Rankawat
// ROLL NO :- 201501007
//
//////////////////////////////////////////////////////////////////////////////////

module Matrix_Inverse(mat0,mat1,mat2,mat3,mat4,mat5,mat6,mat7,mat8,mat9,mat10,mat11,mat12,mat13,mat14,mat15,mat16,mat17,mat18,mat19,mat20,mat21,mat22,mat23,mat24,reset , clk ,
inverse_mat0,inverse_mat1,inverse_mat2,inverse_mat3,inverse_mat4,inverse_mat5,inverse_mat6,inverse_mat7,inverse_mat8,inverse_mat9,inverse_mat10,inverse_mat11,
inverse_mat12,inverse_mat13,inverse_mat14,inverse_mat15,inverse_mat16,inverse_mat17,inverse_mat18,inverse_mat19,inverse_mat20,inverse_mat21,inverse_mat22,inverse_mat23,
inverse_mat24);

	//Input Declarations
	input [7:0] mat0,mat1,mat2,mat3,mat4,mat5,mat6,mat7,mat8,mat9,mat10,mat11,mat12,mat13,mat14,mat15,mat16,mat17,mat18,mat19,mat20,mat21,mat22,mat23,mat24;
	input reset;
	input clk;
	
	//Output Declarations
	output reg [7:0] inverse_mat0, inverse_mat1, inverse_mat2, inverse_mat3, inverse_mat4, inverse_mat5, inverse_mat6, inverse_mat7, inverse_mat8;
	output reg [7:0] inverse_mat9, inverse_mat10, inverse_mat11, inverse_mat12, inverse_mat13, inverse_mat14, inverse_mat15, inverse_mat16, inverse_mat17;
	output reg [7:0] inverse_mat18, inverse_mat19, inverse_mat20, inverse_mat21, inverse_mat22, inverse_mat23, inverse_mat24;
	
	//Temporary Wires and Registers
	wire [7:0] identity_mat[0:24];
	
	wire [7:0] ef1[0:24];
	wire [7:0] ef2[0:24];
	wire [7:0] ef3[0:24];
	wire [7:0] ef4[0:24];
	
	wire [7:0] rref1[0:24];
	wire [7:0] rref2[0:24];
	wire [7:0] rref3[0:24];
	wire [7:0] rref4[0:24];
	
	wire [7:0] identity1[0:24];
	wire [7:0] identity2[0:24];
	wire [7:0] identity3[0:24];
	wire [7:0] identity4[0:24];
	wire [7:0] identity5[0:24];
	wire [7:0] identity6[0:24];
	wire [7:0] identity7[0:24];
	wire [7:0] identity8[0:24];
	
	//Assigning identity matrix
	assign identity_mat[0] = 8'b0000_0001;
	assign identity_mat[1] = 8'b0000_0000;
	assign identity_mat[2] = 8'b0000_0000;
	assign identity_mat[3] = 8'b0000_0000;
	assign identity_mat[4] = 8'b0000_0000;
	assign identity_mat[5] = 8'b0000_0000;
	assign identity_mat[6] = 8'b0000_0001;
	assign identity_mat[7] = 8'b0000_0000;
	assign identity_mat[8] = 8'b0000_0000;
	assign identity_mat[9] = 8'b0000_0000;
	assign identity_mat[10] = 8'b0000_0000;
	assign identity_mat[11] = 8'b0000_0000;
	assign identity_mat[12] = 8'b0000_0001;
	assign identity_mat[13] = 8'b0000_0000;
	assign identity_mat[14] = 8'b0000_0000;
	assign identity_mat[15] = 8'b0000_0000;
	assign identity_mat[16] = 8'b0000_0000;
	assign identity_mat[17] = 8'b0000_0000;
	assign identity_mat[18] = 8'b0000_0001;
	assign identity_mat[19] = 8'b0000_0000;
	assign identity_mat[20] = 8'b0000_0000;
	assign identity_mat[21] = 8'b0000_0000;
	assign identity_mat[22] = 8'b0000_0000;
	assign identity_mat[23] = 8'b0000_0000;
	assign identity_mat[24] = 8'b0000_0001;
	
	//Obtaining the EF Form
	
	//First row transformation matrix for EF
	assign ef1[4:0] = {mat4,mat3,mat2,mat1,mat0};
	
	assign ef1[5] = mat5*mat0 - mat0*mat5;
	assign ef1[6] = mat6*mat0 - mat1*mat5;
	assign ef1[7] = mat7*mat0 - mat2*mat5;
	assign ef1[8] = mat8*mat0 - mat3*mat5;
	assign ef1[9] = mat9*mat0 - mat4*mat5;

	assign ef1[10] = mat10*mat0 - mat0*mat10;
	assign ef1[11] = mat11*mat0 - mat1*mat10;
	assign ef1[12] = mat12*mat0 - mat2*mat10;
	assign ef1[13] = mat13*mat0 - mat3*mat10;
	assign ef1[14] = mat14*mat0 - mat4*mat10;
	
	assign ef1[15] = mat15*mat0 - mat0*mat15;
	assign ef1[16] = mat16*mat0 - mat1*mat15;
	assign ef1[17] = mat17*mat0 - mat2*mat15;
	assign ef1[18] = mat18*mat0 - mat3*mat15;
	assign ef1[19] = mat19*mat0 - mat4*mat15;
	
	assign ef1[20] = mat20*mat0 - mat0*mat20;
	assign ef1[21] = mat21*mat0 - mat1*mat20;
	assign ef1[22] = mat22*mat0 - mat2*mat20;
	assign ef1[23] = mat23*mat0 - mat3*mat20;
	assign ef1[24] = mat24*mat0 - mat4*mat20;
	
	//Applying same operations on an identity matrix to obtain identity1
	assign identity1[4:0] = identity_mat[4:0];
	
	assign identity1[5] = identity_mat[5]*mat0 - identity_mat[0]*mat5;
	assign identity1[6] = identity_mat[6]*mat0 - identity_mat[1]*mat5;
	assign identity1[7] = identity_mat[7]*mat0 - identity_mat[2]*mat5;
	assign identity1[8] = identity_mat[8]*mat0 - identity_mat[3]*mat5;
	assign identity1[9] = identity_mat[9]*mat0 - identity_mat[4]*mat5;

	assign identity1[10] = identity_mat[10]*mat0 - identity_mat[0]*mat10;
	assign identity1[11] = identity_mat[11]*mat0 - identity_mat[1]*mat10;
	assign identity1[12] = identity_mat[12]*mat0 - identity_mat[2]*mat10;
	assign identity1[13] = identity_mat[13]*mat0 - identity_mat[3]*mat10;
	assign identity1[14] = identity_mat[14]*mat0 - identity_mat[4]*mat10;
	
	assign identity1[15] = identity_mat[15]*mat0 - identity_mat[0]*mat15;
	assign identity1[16] = identity_mat[16]*mat0 - identity_mat[1]*mat15;
	assign identity1[17] = identity_mat[17]*mat0 - identity_mat[2]*mat15;
	assign identity1[18] = identity_mat[18]*mat0 - identity_mat[3]*mat15;
	assign identity1[19] = identity_mat[19]*mat0 - identity_mat[4]*mat15;
	
	assign identity1[20] = identity_mat[20]*mat0 - identity_mat[0]*mat20;
	assign identity1[21] = identity_mat[21]*mat0 - identity_mat[1]*mat20;
	assign identity1[22] = identity_mat[22]*mat0 - identity_mat[2]*mat20;
	assign identity1[23] = identity_mat[23]*mat0 - identity_mat[3]*mat20;
	assign identity1[24] = identity_mat[24]*mat0 - identity_mat[4]*mat20;
	
	//Second row transformation matrix for EF
	assign ef2[10:0] = ef1[10:0];
	
	assign ef2[11] = ef1[11]*ef1[6] - ef1[6]*ef1[11];
	assign ef2[12] = ef1[12]*ef1[6] - ef1[7]*ef1[11];
	assign ef2[13] = ef1[13]*ef1[6] - ef1[8]*ef1[11];
	assign ef2[14] = ef1[14]*ef1[6] - ef1[9]*ef1[11];
	
	assign ef2[16] = ef1[16]*ef1[6] - ef1[6]*ef1[16];
	assign ef2[17] = ef1[17]*ef1[6] - ef1[7]*ef1[16];
	assign ef2[18] = ef1[18]*ef1[6] - ef1[8]*ef1[16];
	assign ef2[19] = ef1[19]*ef1[6] - ef1[9]*ef1[16];
	
	assign ef2[21] = ef1[21]*ef1[6] - ef1[6]*ef1[21];
	assign ef2[22] = ef1[22]*ef1[6] - ef1[7]*ef1[21];
	assign ef2[23] = ef1[23]*ef1[6] - ef1[8]*ef1[21];
	assign ef2[24] = ef1[24]*ef1[6] - ef1[9]*ef1[21];
	
	//Applying same operations on identity1 to obtain identity2
	assign identity2[10:0] = identity1[10:0];
	
	assign identity2[11] = identity1[11]*ef1[6] - identity1[6]*ef1[11];
	assign identity2[12] = identity1[12]*ef1[6] - identity1[7]*ef1[11];
	assign identity2[13] = identity1[13]*ef1[6] - identity1[8]*ef1[11];
	assign identity2[14] = identity1[14]*ef1[6] - identity1[9]*ef1[11];
	
	assign identity2[16] = identity1[16]*ef1[6] - identity1[6]*ef1[16];
	assign identity2[17] = identity1[17]*ef1[6] - identity1[7]*ef1[16];
	assign identity2[18] = identity1[18]*ef1[6] - identity1[8]*ef1[16];
	assign identity2[19] = identity1[19]*ef1[6] - identity1[9]*ef1[16];
	
	assign identity2[21] = identity1[21]*ef1[6] - identity1[6]*ef1[21];
	assign identity2[22] = identity1[22]*ef1[6] - identity1[7]*ef1[21];
	assign identity2[23] = identity1[23]*ef1[6] - identity1[8]*ef1[21];
	assign identity2[24] = identity1[24]*ef1[6] - identity1[9]*ef1[21];
	
	//Third row transformation matrix for EF
	assign ef3[16:0] = ef2[16:0];
	
	assign ef3[17] = ef2[17]*ef2[12] - ef2[12]*ef2[17];
	assign ef3[18] = ef2[18]*ef2[12] - ef2[13]*ef2[17];
	assign ef3[19] = ef2[19]*ef2[12] - ef2[14]*ef2[17];
	
	assign ef3[22] = ef2[22]*ef2[12] - ef2[12]*ef2[22];
	assign ef3[23] = ef2[23]*ef2[12] - ef2[13]*ef2[22];
	assign ef3[24] = ef2[24]*ef2[12] - ef2[14]*ef2[22];
	
	//Applying same operations on identity2 to identity3
	assign identity3[16:0] = identity2[16:0];
	
	assign identity3[17] = identity2[17]*ef2[12] - identity2[12]*ef2[17];
	assign identity3[18] = identity2[18]*ef2[12] - identity2[13]*ef2[17];
	assign identity3[19] = identity2[19]*ef2[12] - identity2[14]*ef2[17];
	
	assign identity3[22] = identity2[22]*ef2[12] - identity2[12]*ef2[22];
	assign identity3[23] = identity2[23]*ef2[12] - identity2[13]*ef2[22];
	assign identity3[24] = identity2[24]*ef2[12] - identity2[14]*ef2[22];
	
	//Fourth row transformation matrix for EF
	assign ef4[22:0] = ef3[22:0];
	
	assign ef4[23] = ef3[23]*ef3[18] - ef3[18]*ef3[23];
	assign ef4[24] = ef3[24]*ef3[18] - ef3[19]*ef3[23];
	
	//Applying same operations on identity3 to identity4
	assign identity4[22:0] = identity3[22:0];
	
	assign identity4[23] = identity3[23]*ef3[18] - identity3[18]*ef3[23];
	assign identity4[24] = identity3[24]*ef3[18] - identity3[19]*ef3[23];

	//Obtaining the RREF Form
	
	//First row transformation matrix for RREF
	assign rref1[20:24] = ef4[20:24];
	assign rref1[15:18] = ef4[15:18];
	assign rref1[10:13] = ef4[10:13];
	assign rref1[5:8] = ef4[5:8];
	assign rref1[0:3] = ef4[0:3];
	
	assign rref1[19] = ef4[19]*ef4[24] - ef4[24]*ef4[19];
	assign rref1[14] = ef4[14]*ef4[24] - ef4[24]*ef4[14];
	assign rref1[9] = ef4[9]*ef4[24] - ef4[24]*ef4[9];
	assign rref1[4] = ef4[4]*ef4[24] - ef4[24]*ef4[4];
	
	//Applying same operations on identity4 to obtain identity5
	assign identity5[20:24] = identity4[20:24];
	assign identity5[15:18] = identity4[15:18];
	assign identity5[10:13] = identity4[10:13];
	assign identity5[5:8] = identity4[5:8];
	assign identity5[0:3] = identity4[0:3];
	
	assign identity5[19] = identity4[19]*ef4[24] - identity4[24]*ef4[19];
	assign identity5[14] = identity4[14]*ef4[24] - identity4[24]*ef4[14];
	assign identity5[9] = identity4[9]*ef4[24] - identity4[24]*ef4[9];
	assign identity5[4] = identity4[4]*ef4[24] - identity4[24]*ef4[4];
	
	//Second row transformation for RREF
	assign rref2[14:24] = rref1[14:24];
	assign rref2[10:12] = rref1[10:12];
	assign rref2[5:7] = rref1[5:7];
	assign rref2[0:2] = rref1[0:2];
	assign rref2[4] = rref1[4];
	assign rref2[9] = rref1[9];
	
	assign rref2[13] = rref1[13]*rref1[18] - rref1[18]*rref1[13];
	assign rref2[8] = rref1[8]*rref1[18] - rref1[18]*rref1[8];
	assign rref2[3] = rref1[3]*rref1[18] - rref1[18]*rref1[3];
	
	//Applying same operations on identity5 to obtain identity6
	assign identity6[14:24] = identity5[14:24];
	assign identity6[10:12] = identity5[10:12];
	assign identity6[5:7] = identity5[5:7];
	assign identity6[0:2] = identity5[0:2];
	assign identity6[4] = identity5[4];
	assign identity6[9] = identity5[9];
	
	assign identity6[13] = identity5[13]*rref1[18] - identity5[18]*rref1[13];
	assign identity6[8] = identity5[8]*rref1[18] - identity5[18]*rref1[8];
	assign identity6[3] = identity5[3]*rref1[18] - identity5[18]*rref1[3];
	
	//Third row transformation for RREF
	assign rref3[0:1] = rref2[0:1];
	assign rref3[3:6] = rref2[3:6];
	assign rref3[8:24] = rref2[8:24];
	
	assign rref3[7] = rref2[7]*rref2[12] - rref2[12]*rref2[7];
	assign rref3[2] = rref2[2]*rref2[12] - rref2[12]*rref2[2];
	
	//Applying same operations on identity6 to obtain identity7
	assign identity7[0:1] = identity6[0:1];
	assign identity7[3:6] = identity6[3:6];
	assign identity7[8:24] = identity6[8:24];
	
	assign identity7[7] = identity6[7]*rref2[12] - identity6[12]*rref2[7];
	assign identity7[2] = identity6[2]*rref2[12] - identity6[12]*rref2[2];
	
	//Fourth row transformation for RREF
	assign rref4[0] = rref3[0];
	assign rref4[2:24] = rref3[2:24];
	
	assign rref4[1] = rref3[1]*rref3[6] - rref3[6]*rref3[1];
	
	//Applying same operations on identity7 to obtain identity8
	assign identity8[0] = identity7[0];
	assign identity8[2:24] = identity7[2:24];
	
	assign identity8[1] = identity7[1]*rref3[6] - identity7[6]*rref3[1];

	
	//Assigning values to the output at the positive edge of clock
	always@(posedge clk)
	begin 
		if(reset == 1'b1)
		begin
			identity_mat0 = identity8[0];
			identity_mat1 = identity8[1];
			identity_mat2 = identity8[2];
			identity_mat3 = identity8[3];
			identity_mat4 = identity8[4];
			identity_mat5 = identity8[5];
			identity_mat6 = identity8[6];
			identity_mat7 = identity8[7];
			identity_mat8 = identity8[8];
			identity_mat9 = identity8[9];
			identity_mat10 = identity8[10];
			identity_mat11 = identity8[11];
			identity_mat12 = identity8[12];
			identity_mat13 = identity8[13];
			identity_mat14 = identity8[14];
			identity_mat15 = identity8[15];
			identity_mat16 = identity8[16];
			identity_mat17 = identity8[17];
			identity_mat18 = identity8[18];
			identity_mat19 = identity8[19];
			identity_mat20 = identity8[20];
			identity_mat21 = identity8[21];
			identity_mat22 = identity8[22];
			identity_mat23 = identity8[23];
			identity_mat24 = identity8[24];
		end
		
		else
		begin 
			identity_mat0 = 0;
			identity_mat1 = 0;
			identity_mat2 = 0;
			identity_mat3 = 0;
			identity_mat4 = 0;
			identity_mat5 = 0;
			identity_mat6 = 0;
			identity_mat7 = 0;
			identity_mat8 = 0;
			identity_mat9 = 0;
			identity_mat10 = 0;
			identity_mat11 = 0;
			identity_mat12 = 0;
			identity_mat13 = 0;
			identity_mat14 = 0;
			identity_mat15 = 0;
			identity_mat16 = 0;
			identity_mat17 = 0;
			identity_mat18 = 0;
			identity_mat19 = 0;
			identity_mat20 = 0;
			identity_mat21 = 0;
			identity_mat22 = 0;
			identity_mat23 = 0;
			identity_mat24 = 0;
		end
	end
	
endmodule
