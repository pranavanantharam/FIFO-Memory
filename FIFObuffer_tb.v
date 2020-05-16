`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2018 14:07:23
// Design Name: 
// Module Name: FIFObuffer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFObuffer_tb;

 // Inputs

 reg Clk;

 reg [3:0] dataIn;

 reg RD;

 reg WR;

 reg EN;

 reg Rst;

 // Outputs

 wire [3:0] dataOut;

 wire EMPTY;

 wire FULL;

 // Instantiate the Unit Under Test (UUT)

 FIFObuffer uut (

                  .Clk(Clk), 

                  .dataIn(dataIn), 

                  .RD(RD), 

                  .WR(WR), 

                  .EN(EN), 

                  .dataOut(dataOut), 

                  .Rst(Rst), 

                  .EMPTY(EMPTY), 

                  .FULL(FULL)

                  );

 initial begin

  // Initialize Inputs

  Clk  = 1'b0;

  dataIn  = 4'b0000;

  RD  = 1'b0;

  WR  = 1'b0;

  EN  = 1'b0;

  Rst  = 1'b1;

  // Wait 100 ns for global reset to finish

  #100;        

  // Add stimulus here

  EN  = 1'b1;

  Rst  = 1'b1;

  #10;// 110

  Rst  = 1'b0;


  WR  = 1'b1;
  dataIn  = 4'b0000;
  
    
  #20;//130
  WR=1'b0;
  RD=1'b1;

  #20;// 150
  RD=1'b0;
  WR=1'b1;
  dataIn  = 4'b0001;
  
  
  #20;//170    
  WR=1'b0;
  RD=1'b1;

  #20;//190
  RD=1'b0;
  WR=1'b1;
  dataIn=4'b0010;
 
  #20;//210
  WR=1'b0;
  RD=1'b1;

  
  #20;//230
  RD=1'b0;
  WR=1'b1;
  dataIn=4'b0011;

  #20;//250
  WR=1'b0;
  RD=1'b1;
  
  
  #20;//270
  RD=1'b0;
  WR=1'b1;
  dataIn=4'b0100;
  dataIn=4'b1111;
  
  #20;//290
  WR=1'b0;
  RD=1'b1;
  
  #20
  $stop;
 end 

   always #10 Clk = ~Clk;    

endmodule
