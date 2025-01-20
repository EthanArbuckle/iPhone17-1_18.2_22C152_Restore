@interface DashedLineView
- (void)drawRect:(CGRect)a3;
@end

@implementation DashedLineView

- (void)drawRect:(CGRect)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.819607843, 1.0, a3.size.width, a3.size.height);
  [v4 set];

  v5 = objc_opt_new();
  [v5 setLineWidth:RoundToPixel(0.5)];
  long long v7 = xmmword_222F29EA0;
  [v5 setLineDash:&v7 count:2 phase:1.0];
  double v6 = RoundToPixel(0.5) * 0.5;
  objc_msgSend(v5, "moveToPoint:", 0.0, v6);
  [(DashedLineView *)self bounds];
  objc_msgSend(v5, "addLineToPoint:", CGRectGetMaxX(v9), v6);
  [v5 stroke];
}

@end