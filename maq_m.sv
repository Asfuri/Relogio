module maq_m (
    input maqm_reset,
    maqm_clock,
    maqm_enable,
    maqm_incremento,
    output logic [3:0] maqm_lsd,
    output logic [2:0] maqm_msd,
    output logic maqm_incrementahora
);

  always_ff @(posedge maqm_clock) begin
    if (!maqm_reset) begin
      maqm_lsd <= 4'd0;
      maqm_msd <= 3'd0;
      maqm_incrementahora <= 1'd0;
    end else if (maqm_enable && maqm_incremento) begin
      if (maqm_msd == 3'd5 && maqm_lsd == 4'd9) begin
        maqm_incrementahora <= 1'd1;
        maqm_lsd <= 4'd0;
        maqm_msd <= 3'd0;
      end else if (maqm_lsd == 4'd9) begin
        maqm_lsd <= 4'd0;
        maqm_msd <= maqm_msd + 1'd1;
        maqm_incrementahora <= 1'd0;
      end else begin
        maqm_lsd <= maqm_lsd + 1'd1;
        maqm_incrementahora <= 1'd0;
      end
    end else begin
      maqm_incrementahora <= 1'd0;
    end
  end
endmodule
