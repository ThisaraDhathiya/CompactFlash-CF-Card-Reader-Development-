`timescale 1ps / 1ps

module tb_CF_CARD_V2;

    // Testbench signals
    reg clk;
    reg reset;
    reg [2:0] Address_Bus_A;
    reg [15:0] Data_Bus_A_In;
    reg [15:0] Data_Bus_B_In;
    reg CE1_A;
    reg CE2_A;
    reg OE_A;
    reg WE_A;
    reg CS0_A;
    reg CS1_A;
    reg IORD_A;
    reg IOWR_A;
    reg INTRQ_A;
    reg RDY;                  // Changed to reg
    reg Data_RDY;             // Changed to reg
    reg Address_Ok;           // Changed to reg
    wire Req;                 // Changed to wire
    reg ACK;                  // Changed to reg
    reg Set_Reg;              // Changed to reg
    wire CE1_B;
    wire CE2_B;
    wire OE_B;
    wire WE_B;
    wire CS0_B;
    wire CS1_B;
    wire IORD_B;
    wire IOWR_B;
    wire INTRQ_B;
    wire [2:0] Address_Bus_B;
    wire [15:0] Data_Bus_A_Out;
    wire [15:0] Data_Bus_B_Out;

    // Instantiate the CF_CARD_V2 module
    CF_CARD_V2 uut (
        .clk(clk),
        .reset(reset),
        .Address_Bus_A(Address_Bus_A),
        .Data_Bus_A_In(Data_Bus_A_In),   
        .Data_Bus_A_Out(Data_Bus_A_Out), 
        .Data_Bus_B_In(Data_Bus_B_In),  
        .Data_Bus_B_Out(Data_Bus_B_Out), 
        .Req(Req),                        // Added Req connection
        .CE1_A(CE1_A),
        .CE2_A(CE2_A),
        .OE_A(OE_A),
        .WE_A(WE_A),
        .CS0_A(CS0_A),
        .CS1_A(CS1_A),
        .IORD_A(IORD_A),
        .IOWR_A(IOWR_A),
        .INTRQ_A(INTRQ_A),
        .CE1_B(CE1_B),
        .CE2_B(CE2_B),
        .OE_B(OE_B),
        .WE_B(WE_B),
        .CS0_B(CS0_B),
        .CS1_B(CS1_B),
        .IORD_B(IORD_B),
        .IOWR_B(IOWR_B),
        .INTRQ_B(INTRQ_B),
        .Address_Bus_B(Address_Bus_B),
        .ACK(ACK),
        .Address_Ok(Address_Ok),
        .Data_RDY(Data_RDY),
        .Set_Reg(Set_Reg),
        .RDY(RDY)  
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        Address_Bus_A = 3'b000;
        Data_Bus_A_In = 16'h0000;
        Data_Bus_B_In = 16'h0000;
        CE1_A = 1;
        CE2_A = 1;
        OE_A = 1;
        WE_A = 1;
        CS0_A = 1;
        CS1_A = 1;
        IORD_A = 1;
        IOWR_A = 1;
        INTRQ_A = 1;
        RDY = 1;
        Data_RDY = 1;
        Address_Ok = 1;
        ACK = 1;
        Set_Reg = 1;

        // Apply reset
        #50;
        reset = 0;

        // Apply chip select signal
        #50;
        CS0_A = 0;

        // Apply read signal
        #50;
        IORD_A = 0;

        // Provide address and data
        #50;
        Address_Bus_A = 3'b101;
        
        #50;
        Data_Bus_B_In = 16'h1234; // Data to read.
        
        #50;
        Address_Ok = 0;
        
        #50;
        ACK = 0;
        
        #50;
        Address_Ok = 1;
        
        #50;
        RDY = 0;
        
        #50;
        ACK = 1;
        
        #50;
        Set_Reg = 1;
        
        #50;
        Address_Bus_A = 3'b111;
        
        #50;
        Address_Ok = 0;
        
        #50;
        Data_Bus_A_In = 16'h1234; // Data to read.
        
        #50;
        Data_RDY = 0;
        
        #50;
        IOWR_A = 0;
        
        #50;
        IOWR_A = 1;
        
        #50;
        ACK = 1;

        // End of simulation
        //#50;
       // $finish;
    end

endmodule
