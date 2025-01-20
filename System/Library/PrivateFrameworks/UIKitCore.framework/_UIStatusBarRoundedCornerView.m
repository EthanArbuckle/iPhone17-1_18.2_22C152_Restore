@interface _UIStatusBarRoundedCornerView
- (_UIStatusBarRoundedCornerView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
@end

@implementation _UIStatusBarRoundedCornerView

- (_UIStatusBarRoundedCornerView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarRoundedCornerView;
  result = -[UIView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_cornerRadius = -1.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarRoundedCornerView;
  [(UIView *)&v13 layoutSubviews];
  double cornerRadius = self->_cornerRadius;
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = fmin(v4, v6) * 0.5;
  if (cornerRadius == -1.0) {
    double cornerRadius = v8;
  }
  v9 = [(UIView *)self layer];
  [v9 setCornerRadius:cornerRadius];

  if (vabdd_f64(v5, v7) <= 1.0) {
    v10 = (uint64_t *)MEMORY[0x1E4F39EA0];
  }
  else {
    v10 = (uint64_t *)MEMORY[0x1E4F39EA8];
  }
  uint64_t v11 = *v10;
  v12 = [(UIView *)self layer];
  [v12 setCornerCurve:v11];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_double cornerRadius = a3;
}

@end