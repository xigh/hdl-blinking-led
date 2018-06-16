`timescale 1ns / 1ps

module top(
    input CLK100MHZ,
    output reg [3:0] led,
    input [3:0] sw,
    input [3:0] btn
    );
    
    reg [27:0] counter;
    reg [27:0] speed;
    reg on;
    
    always @ (posedge CLK100MHZ)
    begin
        if (btn[0] == 1)
        begin
            counter <= 8'b00000000;
            speed <= 100000000;
            on <= 1'b0;
        end
        else if (btn[1] == 1)
        begin
            counter <= 8'b00000000;
            speed <= 50000000;
            on <= 1'b0;
        end
        else if (btn[2] == 1)
        begin
            counter <= 8'b00000000;
            speed <= 25000000;
            on <= 1'b0;
        end
        else if (btn[3] == 1)
        begin
            counter <= 8'b00000000;
            speed <= 12500000;
            on <= 1'b0;
        end
        else begin
            // increase counter
            counter <= counter + 8'b00000001;
        end
        
        // reset counter
        if (counter == speed)
        begin
            counter <= 8'b0000000;
            on <= !on;
        end
    
        // led/sw 0
        if (sw[0] == 0)
        begin
            led[0] <= 1'b0;
        end
        else
        begin
            led[0] <= on;
        end
        
        // led/sw 1
        if (sw[1] == 0)
        begin
            led[1] <= 1'b0;
        end
        else
        begin
            led[1] <= 1'b1;
        end
        
        // led/sw 2
        if (sw[2] == 0)
        begin
            led[2] <= 1'b0;
        end
        else
        begin
            led[2] <= 1'b1;
        end
        
        // led/sw 3
        if (sw[3] == 0)
        begin
            led[3] <= 1'b0;
        end
        else
        begin
            led[3] <= 1'b1;
        end
    end
endmodule
