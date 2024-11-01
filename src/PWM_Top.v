`include "pwm_gen.v"

module tt_um_pwm_gen(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    //List all unused inputs to prevent warnings
    wire _unused = &{ena, uo_out[7:1], uio_in[7:0], uio_out[7:0], uio_oe[7:0], 1'b0};

    pwm_gen PWM_Generador(
        .increase_duty (ui_in[0]),
        .decrease_duty (ui_in[1]),
        .divisor       (ui_in[7:2]),
        .pwm_out       (uo_out[0]),
        .clk           (clk),
        .rst_n         (rst_n),
        .ena           (ena)
    );
    
endmodule