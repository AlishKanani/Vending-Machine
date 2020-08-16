module vending_machineTB;
wire ticket;
reg clk, rst;
reg [1:0] coin;

    vending_machine M0(coin, clk, rst, ticket);

initial begin
rst = 1'b0;
clk = 1'b0;
coin = 2'b00;
#4 rst = 1'b1;
#4 rst = 1'b0;

#10 coin = 2'b01;
#10 coin = 2'b10; 
#4
 $finish; 
end

always begin
#10 clk = ~clk;
end
initial
  $monitor( "coin=%b, clk=%b, rst=%b, ticket=%b", coin, clk, rst, ticket);

initial
 begin
    $dumpfile("test.vcd");
    $dumpvars(0,vending_machineTB);
 end
endmodule