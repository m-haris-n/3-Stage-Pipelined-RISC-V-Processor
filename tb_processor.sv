module tb_processor();

    // add x3, x4, x2
    // 00000000001000100000000110110011

    logic clk;
    logic rst;
    logic iter;

    processor dut
    (
        .clk ( clk ),
        .rst ( rst )
    );

    // clock generator
    initial
    begin
        clk = 0;
        iter = 1;
        forever
        begin
            #5 clk = 1;
            #5 clk = 0;
            iter += 1;
        $display("CYCLE %b\n", iter);
        $display("x8: %b", dut.reg_file_i.reg_mem[8]);
        $display("x9: %b", dut.reg_file_i.reg_mem[9]);
        // $display("x7: %b", dut.reg_file_i.reg_mem[7]);
        // $display("x10: %b", dut.reg_file_i.reg_mem[10]);
        // $display("x11: %b\n", dut.reg_file_i.reg_mem[11]);

            // $display("pc_in: %b", dut.pc_in);
            // $display("pc_d: %b", dut.pc_out_d);


            $display("oprA:%b", dut.alu_i.opr_a);
		    $display("oprB:%b", dut.alu_i.opr_b);
		    $display("alu_out:%b", dut.BUFFER_EM_i.alu_out_M);
		    $display("wdata:%b", dut.reg_file_i.wdata);
		    $display("waddr:%b\n", dut.reg_file_i.waddr);
		    // $display("datamem:%b", dut.data_mem_i.data_mem[0]);
		    // $display("datamem:%b", dut.data_mem_i.data_mem[1]);
		    // $display("datamem:%b", dut.data_mem_i.data_mem[2]);
		    // $display("datamem:%b", dut.data_mem_i.data_mem[3]);
		    // $display("datamemout:%b", dut.data_mem_i.out_data);
		    $display("wb_selected:%b", dut.sel_wb_mux.sel);
		    // $display("\n");
            $display("br:%b", dut.br_taken);
		    $display("j:%b\n", dut.jump);

        //        $display("x1: %b", dut.reg_file_i.reg_mem[1]);
        // $display("x2: %b\n", dut.reg_file_i.reg_mem[2]);
        end
    end

    // reset generator
    initial
    begin
        $display("Processor is running");
        rst = 1;
        #10;
        rst = 0;
        #900;
		$display("datamem:%b\n", dut.data_mem_i.data_mem[0]);
        $display("x8: %b", dut.reg_file_i.reg_mem[8]);
        $display("x9: %b", dut.reg_file_i.reg_mem[9]);
        $display("x3: %b", dut.reg_file_i.reg_mem[3]);
        $display("x4: %b", dut.reg_file_i.reg_mem[4]);
        $display("x5: %b", dut.reg_file_i.reg_mem[5]);
        $display("x6: %b", dut.reg_file_i.reg_mem[6]);
        // $display("loaded in x4: %b", dut.reg_file_i.reg_mem[4]);
        // $display("JAL return address x5: %b", dut.reg_file_i.reg_mem[5]);
        // $display("loaded UI in x6: %b", dut.reg_file_i.reg_mem[6]);
        // $display("loaded UI+PC in x7: %b", dut.reg_file_i.reg_mem[7]);
        $finish;
    end

    // initialize memory
    initial
    begin
        $readmemh("inst.mem", dut.inst_mem_i.mem);
        $readmemh("data.mem", dut.data_mem_i.data_mem);
        $readmemb("rf.mem", dut.reg_file_i.reg_mem);
    end

    // dumping the waveform
    initial
    begin
        $dumpfile("processor.vcd");
        $dumpvars(0, dut);
    end

endmodule