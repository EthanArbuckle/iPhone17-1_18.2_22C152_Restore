@interface _Badge
- (CGSize)sizeThatFits:(CGSize)a3;
- (_Badge)initWithText:(id)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)setText:(id)a3;
@end

@implementation _Badge

- (_Badge)initWithText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_Badge;
  v5 = -[_Badge initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(_Badge *)v5 setTextColor:v6];

    v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [(_Badge *)v5 setFont:v7];

    [(_Badge *)v5 setTextAlignment:1];
    [(_Badge *)v5 setText:v4];
  }

  return v5;
}

- (void)setText:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_Badge;
  [(_Badge *)&v10 setText:a3];
  [(_Badge *)self frame];
  double v5 = v4;
  double v7 = v6;
  -[_Badge sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[_Badge setFrame:](self, "setFrame:", v5, v7, v8, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_Badge;
  -[_Badge sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v6 = [(_Badge *)self text];
  unint64_t v7 = [v6 length];

  double v8 = 18.0;
  if (v7 >= 2)
  {
    double v9 = v5 + 10.0;
    if (v5 + 10.0 < 24.0) {
      double v9 = 24.0;
    }
    double v8 = fmin(v9, 44.0);
  }
  double v10 = 18.0;
  result.height = v10;
  result.width = v8;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v9 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  [v9 set];

  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  double v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, CGRectGetHeight(v12) * 0.5);
  [v10 fill];

  CGContextRestoreGState(CurrentContext);
  v11.receiver = self;
  v11.super_class = (Class)_Badge;
  -[_Badge drawTextInRect:](&v11, sel_drawTextInRect_, x + 5.0, y + 0.0, width + -10.0, height);
}

@end