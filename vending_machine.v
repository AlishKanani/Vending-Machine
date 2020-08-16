module vending_machine(coin, clk, rst, ticket);
input [1:0] coin;
input clk,rst;
output reg ticket;

reg [1:0] c_state, n_state;
parameter [1:0] s0c = 2'b00, s5c = 2'b01, s10c = 2'b10;

always @(posedge clk, rst)
begin
    if (rst==1) c_state <= s0c;
    else c_state <= n_state;
end

always @(c_state, coin)
begin
    case (c_state)
    s0c:
    begin
        if (coin == 2'b00) n_state = s0c;
        else if (coin == 2'b01) n_state = s5c;
        else n_state = s10c;
        // else if (coin == 2'b10) n_state = s10c;
    end
    s5c:
    begin
       if (coin==2'b00) n_state=s5c;
       else if (coin==2'b01) n_state=s10c;
       else n_state=s0c;
    //    else if (coin==2'b10) n_state=s0c;
    end
    s10c:
    begin
        if (coin==2'b00) n_state=s10c;
        else n_state=s0c;
        // else if (coin==2'b01) n_state=s0c;
        // else if (coin==2'b10) n_state=s0c;  
    end
    endcase
end

always @(c_state,coin)
begin
    case (c_state)
    s0c: ticket <= 1'b0;
    s5c:
    begin
        if (coin == 2'b10) ticket <= 1'b1;
        else ticket <= 1'b0;
    end 
    s10c:
    begin
        if (coin == 2'b00) ticket <= 1'b0;
        else ticket <= 1'b1;
    end
    endcase
end
endmodule