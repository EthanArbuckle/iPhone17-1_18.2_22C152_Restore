@interface SBRoundedRectBorderView
- (SBRoundedRectBorderView)initWithFrame:(CGRect)a3;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation SBRoundedRectBorderView

- (SBRoundedRectBorderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRoundedRectBorderView;
  v3 = -[SBRoundedRectBorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBRoundedRectBorderView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (double)cornerRadius
{
  v2 = [(SBRoundedRectBorderView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(SBRoundedRectBorderView *)self layer];
  [v4 setCornerRadius:a3];
}

- (double)borderWidth
{
  v2 = [(SBRoundedRectBorderView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(SBRoundedRectBorderView *)self layer];
  [v4 setBorderWidth:a3];
}

- (UIColor)borderColor
{
  v2 = (void *)MEMORY[0x1E4F428B8];
  double v3 = [(SBRoundedRectBorderView *)self layer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));

  return (UIColor *)v4;
}

- (void)setBorderColor:(id)a3
{
  id v4 = a3;
  id v7 = [(SBRoundedRectBorderView *)self layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setBorderColor:v6];
}

@end