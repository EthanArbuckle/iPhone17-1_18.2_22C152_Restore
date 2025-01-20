@interface SUUISeparatorView
- (UIColor)color1;
- (UIColor)color2;
- (int64_t)separatorStyle;
- (void)drawRect:(CGRect)a3;
- (void)setColor1:(id)a3;
- (void)setColor2:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation SUUISeparatorView

- (void)setColor1:(id)a3
{
  if (self->_color1 != a3)
  {
    v4 = (UIColor *)[a3 copy];
    color1 = self->_color1;
    self->_color1 = v4;

    [(SUUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)setColor2:(id)a3
{
  if (self->_color2 != a3)
  {
    v4 = (UIColor *)[a3 copy];
    color2 = self->_color2;
    self->_color2 = v4;

    [(SUUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    [(SUUISeparatorView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(SUUISeparatorView *)self bounds];
  CGFloat v6 = v4;
  CGFloat v7 = v5;
  int64_t separatorStyle = self->_separatorStyle;
  if (separatorStyle == 1)
  {
    float v12 = v4 * 0.5;
    double v11 = floorf(v12);
    [(UIColor *)self->_color1 set];
    double v10 = 0.0;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v11;
    v19.size.height = v7;
    UIRectFill(v19);
    [(UIColor *)self->_color2 set];
    CGFloat v6 = v11;
  }
  else
  {
    if (separatorStyle) {
      return;
    }
    float v9 = v5 * 0.5;
    double v10 = floorf(v9);
    [(UIColor *)self->_color1 set];
    double v11 = 0.0;
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v6;
    v18.size.height = v10;
    UIRectFill(v18);
    [(UIColor *)self->_color2 set];
    CGFloat v7 = v10;
  }
  double v13 = v11;
  double v14 = v10;
  CGFloat v15 = v6;
  CGFloat v16 = v7;
  UIRectFill(*(CGRect *)&v13);
}

- (UIColor)color1
{
  return self->_color1;
}

- (UIColor)color2
{
  return self->_color2;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
}

@end