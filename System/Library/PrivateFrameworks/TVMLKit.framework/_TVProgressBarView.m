@interface _TVProgressBarView
- (BOOL)shouldProgressBarUseRoundCorner;
- (BOOL)useMaterial;
- (UIColor)completeTintColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)progressTintColor;
- (UIEdgeInsets)padding;
- (_TVProgressBarView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)progress;
- (void)drawRect:(CGRect)a3;
- (void)setCompleteTintColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setProgress:(double)a3;
- (void)setProgressTintColor:(id)a3;
- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3;
- (void)setUseMaterial:(BOOL)a3;
- (void)setgradientEndColor:(id)a3;
@end

@implementation _TVProgressBarView

- (_TVProgressBarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVProgressBarView;
  v3 = -[_TVProgressBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVProgressBarView *)v3 setContentMode:3];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v43);
  [(_TVProgressBarView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (!self->_useMaterial)
  {
    v17 = [(_TVProgressBarView *)self completeTintColor];
    [v17 setFill];
    v18 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, self->_cornerRadius);
    [v18 fill];
  }
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double v22 = v14 - left - self->_padding.right;
  [(_TVProgressBarView *)self progress];
  double v23 = 0.0;
  if (v24 > 0.0)
  {
    [(_TVProgressBarView *)self progress];
    double v23 = 0.02;
    if (v25 >= 0.02) {
      double v23 = v25;
    }
  }
  double v26 = v10 + left;
  double v27 = v12 + top;
  double v28 = v14 - (left + ceil(v22 * (1.0 - v23)));
  double v29 = v16 - (top + bottom);
  if (self->_shouldProgressBarUseRoundCorner) {
    uint64_t v30 = -1;
  }
  else {
    uint64_t v30 = 5;
  }
  v31 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v30, v26, v27, v28, v29, self->_cornerRadius, self->_cornerRadius);
  if (self->_gradientStartColor && self->_gradientEndColor)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_230C37E80;
    *(void *)&v38[1] = [(UIColor *)self->_gradientEndColor CGColor];
    CFArrayRef v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    CGGradientRef v34 = CGGradientCreateWithColors(DeviceRGB, v33, locations);
    if (v34)
    {
      v35 = v34;
      v44.origin.CGFloat x = v26;
      v44.origin.CGFloat y = v27;
      v44.size.CGFloat width = v28;
      v44.size.CGFloat height = v29;
      CGFloat MaxX = CGRectGetMaxX(v44);
      CGContextAddPath(CurrentContext, (CGPathRef)[v31 CGPath]);
      CGContextClip(CurrentContext);
      v41.CGFloat x = 0.0;
      v41.CGFloat y = 0.0;
      v42.CGFloat y = 0.0;
      v42.CGFloat x = MaxX;
      CGContextDrawLinearGradient(CurrentContext, v35, v41, v42, 3u);
      CGGradientRelease(v35);
    }
    CFRelease(DeviceRGB);
  }
  else
  {
    v37 = [(_TVProgressBarView *)self progressTintColor];
    [v37 setFill];

    [v31 fill];
  }
}

- (void)setCompleteTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setGradientStartColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setgradientEndColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setUseMaterial:(BOOL)a3
{
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_padding.left
    || a3.top != self->_padding.top
    || a3.right != self->_padding.right
    || a3.bottom != self->_padding.bottom)
  {
    self->_padding = a3;
    -[_TVProgressBarView setPadding:](self, "setPadding:");
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[_TVProgressBarView setShouldProgressBarUseRoundCorner:](self, "setShouldProgressBarUseRoundCorner:");
    [(_TVProgressBarView *)self setNeedsDisplay];
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
}

- (UIColor)completeTintColor
{
  return self->_completeTintColor;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

@end