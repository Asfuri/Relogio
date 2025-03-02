module maq_s (
    input maqs_reset,
    maqs_clock,
    maqs_enable,
    output logic [3:0] maqs_lsd,
    output logic [2:0] maqs_msd,
    output logic maqs_incrementaminuto
);

  always_ff @(posedge maqs_clock)
    if (!maqs_reset) begin
      maqs_lsd <= 0;
      maqs_msd <= 0;
      maqs_incrementaminuto <= 0;
    end else if (maqs_enable) begin
      if (maqs_msd == 3'd5 && maqs_lsd == 4'd8) begin
        maqs_incrementaminuto <= 1'd1;
        maqs_lsd <= maqs_lsd + 1'd1;
      end else if (maqs_msd == 3'd5 && maqs_lsd == 4'd9) begin
        maqs_incrementaminuto <= 0;
        maqs_lsd <= 0;
        maqs_msd <= 0;
      end else if (maqs_lsd == 4'd9) begin
        maqs_lsd <= 4'd0;
        maqs_msd <= maqs_msd + 1'd1;
      end else begin
        maqs_lsd <= maqs_lsd + 1'd1;
        maqs_incrementaminuto <= 0;
      end
    end
endmodule
