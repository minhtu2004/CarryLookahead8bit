module testbench;
  reg [7:0] A, B;
  reg Cin;
  wire [7:0] Sum;
  wire Cout, Overflow;

  lookahead_adder_8bit uut (.A(A), .B(B), .Cin(Cin), .S(Sum), .Cout(Cout), .Overflow(Overflow));

  initial begin
    A = 8'd53;  
    B = 8'd77;  
    Cin = 0;  

    $monitor("Time = %0t | A = %d | B = %d | Cin = %b | Sum = %d | Cout = %b | Overflow = %b", 
             $time, A, B, Cin, Sum, Cout, Overflow);
  end

  always #10 begin
    A = A + 8'b00000001;
    B = B + 8'b00000010;
  end
endmodule

