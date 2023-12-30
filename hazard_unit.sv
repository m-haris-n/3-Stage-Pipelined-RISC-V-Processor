module hazard_unit (
    input logic rf_en_M, branched,
    input logic [4:0] rd_M, rs1_D, rs2_D,
    output logic sel_rs1_fwd, sel_rs2_fwd, flush
);



//forwarding

always_comb
begin
    sel_rs1_fwd = 0;
    sel_rs2_fwd = 0;
    flush = branched;
    //forwarding
    if (rf_en_M)
    begin
        if((rd_M == rs1_D) & (rs1_D != 5'b0))
        begin
            sel_rs1_fwd = 1;
        end
        if((rd_M == rs2_D) & (rs2_D != 5'b0))
        begin
            sel_rs2_fwd = 1;
        end
    end



end


endmodule