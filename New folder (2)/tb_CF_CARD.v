`timescale 1ns / 1ps

module tb_CF_CARD;

    // Testbench signals
    reg clk;
    reg reset;
    reg [2:0] Address_bus_A;
    reg [15:0] Data_bus_A_in;
    reg [15:0] Data_bus_B_in;
    reg REQ;
    reg CE1_A;
    reg CE2_A;
    reg OE_A;
    reg WE_A;
    reg CS0_A;
    reg CS1_A;
    reg IORD_A;
    reg IOWR_A;
    reg INTRQ_A;
    
    wire CE1_B;
    wire CE2_B;
    wire OE_B;
    wire WE_B;
    wire CS0_B;
    wire CS1_B;
    wire IORD_B;
    wire IOWR_B;
    wire INTRQ_B;
    wire [2:0] Address_bus_B;
    wire [15:0] Data_bus_A_out;
    wire [15:0] Data_bus_B_out;
    wire ACK;

    // Instantiate the CF_CARD module
    CF_CARD uut (
        .clk(clk),
        .reset(reset),
        .Address_bus_A(Address_bus_A),
        .Data_bus_A_in(Data_bus_A_in),
        .Data_bus_A_out(Data_bus_A_out),
        .Data_bus_B_in(Data_bus_B_in),
        .Data_bus_B_out(Data_bus_B_out),
        .REQ(REQ),
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
        .Address_bus_B(Address_bus_B),
        .ACK(ACK)
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
        Address_bus_A = 3'b000;
        Data_bus_A_in = 16'h0000;
        Data_bus_B_in = 16'h0000;
        REQ = 1;
        CE1_A = 1;
        CE2_A = 1;
        OE_A = 1;
        WE_A = 1;
        CS0_A = 1;
        CS1_A = 1;
        IORD_A = 1;
        IOWR_A = 1;
        INTRQ_A = 1;

        // Apply reset
        #5;
        reset = 0;

        
        // Apply chip select signal
        #10;
        CS0_A = 0;

        // Apply read signal
        #20;
        IORD_A = 0;

        // Provide address and data
        #30;
        Address_bus_A = 3'b101;
		#35;
        Data_bus_B_in = 16'h1234; // Data to read
        
        // Wait for data to be read
        #40;
        IORD_A = 1;

      
        // Apply chip select signal
        #45;
        CS0_A = 0;

        // Apply write signal
        #50;
        IOWR_A = 0;

        // Provide address and data
        #55;
        Address_bus_A = 3'b110;
        Data_bus_A_in = 16'h5678; // Data to write

        // Wait for data to be written
        #60;
        IOWR_A = 1;

        // End of simulation
        #65;
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t | Address_bus_A: %b | Data_bus_A_out: %h | Data_bus_B_out: %h | ACK: %b | CE1_B: %b | CE2_B: %b | OE_B: %b | WE_B: %b | CS0_B: %b | CS1_B: %b | IORD_B: %b | IOWR_B: %b | INTRQ_B: %b | Address_bus_B: %b | Data_bus_B_in: %h",
                 $time, Address_bus_A, Data_bus_A_out, Data_bus_B_out, ACK, CE1_B, CE2_B, OE_B, WE_B, CS0_B, CS1_B, IORD_B, IOWR_B, INTRQ_B, Address_bus_B, Data_bus_B_in);
    end

endmodule
