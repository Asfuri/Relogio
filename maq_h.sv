module maq_h (
    input maqh_reset,
    maqh_clock,
    maqh_enable,
    maqh_incremento,
    output logic [3:0] maqh_lsd,
    output logic [1:0] maqh_msd
)

  always_ff @(posedge maqh_clock) begin
    if (!maqh_reset) begin
      maqh_lsd <= 0;
      maqh_msd <= 0;
    end else begin
      if (maqh_incremento) begin
        if (maqh_msd == 2'd2 && maqh_lsd == 4'd3) begin
          maqh_lsd <= 0;
          maqh_msd <= 0;
        end else if (maqh_lsd == 4'd9) begin
          maqh_lsd <= 4'd0;
          maqh_msd <= maqh_msd + 1'd1;
        end else begin
          maqh_lsd <= maqh_lsd + 1'd1;
        end
      end
    end
  end
endmodule


