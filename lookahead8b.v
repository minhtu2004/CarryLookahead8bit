module lookahead_adder_8bit(
  output [7:0] S, 
  output Cout, 
  output Overflow,  
  input [7:0] A, B, 
  input Cin
);
  wire [7:0] G, P;
  wire [8:0] C;  

  assign G = A & B;  
  assign P = A ^ B;  
  assign C[0] = Cin;  

  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign C[7] = G[6] | (P[6] & C[6]);
  assign C[8] = G[7] | (P[7] & C[7]); 

  assign Cout = C[8];  

  assign S = P ^ C[7:0];

  assign Overflow = (A[7] == B[7]) && (S[7] != A[7]); 

endmodule

