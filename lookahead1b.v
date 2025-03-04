module lookahead_adder_1bit(output S, output Cout, input A, input B, input Cin);
  wire G, P;
  assign G = A & B;       
  assign P = A ^ B;   
  assign Cout = G | (P & Cin); 
  assign S = A ^ B ^ Cin; 
endmodule

