@interface BEHairlineDividerView
- (BEHairlineDividerView)initWithCoder:(id)a3;
- (BEHairlineDividerView)initWithFrame:(CGRect)a3;
- (BOOL)isHorizontal;
- (CALayer)dividerLayer;
- (CGSize)intrinsicContentSize;
- (UIColor)dividerColor;
- (void)layoutSubviews;
- (void)p_init;
- (void)setDividerColor:(id)a3;
- (void)setDividerLayer:(id)a3;
- (void)setHorizontal:(BOOL)a3;
@end

@implementation BEHairlineDividerView

- (BEHairlineDividerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BEHairlineDividerView;
  v3 = -[BEHairlineDividerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BEHairlineDividerView *)v3 p_init];
  }
  return v4;
}

- (BEHairlineDividerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BEHairlineDividerView;
  v3 = [(BEHairlineDividerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BEHairlineDividerView *)v3 p_init];
  }
  return v4;
}

- (void)p_init
{
  [(BEHairlineDividerView *)self setUserInteractionEnabled:0];

  [(BEHairlineDividerView *)self setOpaque:0];
}

- (void)setHorizontal:(BOOL)a3
{
  if (self->_horizontal != a3)
  {
    self->_horizontal = a3;
    [(BEHairlineDividerView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setDividerColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_dividerColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_dividerColor, a3);
    [(CALayer *)self->_dividerLayer setBackgroundColor:[(UIColor *)self->_dividerColor CGColor]];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  if (!self->_dividerLayer)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    dividerLayer = self->_dividerLayer;
    self->_dividerLayer = v3;

    [(CALayer *)self->_dividerLayer setBackgroundColor:[(UIColor *)self->_dividerColor CGColor]];
    v5 = [(BEHairlineDividerView *)self layer];
    [v5 addSublayer:self->_dividerLayer];
  }
  [(BEHairlineDividerView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14 = +[UIScreen mainScreen];
  [v14 scale];
  double v16 = 1.0 / v15;

  unsigned int v17 = [(BEHairlineDividerView *)self isHorizontal];
  CGFloat v18 = v7;
  CGFloat v19 = v9;
  CGFloat v20 = v11;
  CGFloat v21 = v13;
  if (v17)
  {
    double Width = CGRectGetWidth(*(CGRect *)&v18);
  }
  else
  {
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v18);
    double Width = v16;
    double v16 = Height;
  }
  -[CALayer setBounds:](self->_dividerLayer, "setBounds:", 0.0, 0.0, Width, v16);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  double v24 = CGRectGetWidth(v28) * 0.5;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double v25 = CGRectGetHeight(v29) * 0.5;
  v26 = self->_dividerLayer;

  -[CALayer setPosition:](v26, "setPosition:", v24, v25);
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)BEHairlineDividerView;
  [(BEHairlineDividerView *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  unsigned int v10 = [(BEHairlineDividerView *)self isHorizontal];
  if (v10) {
    double v11 = v9;
  }
  else {
    double v11 = v6;
  }
  if (v10) {
    double v12 = v4;
  }
  else {
    double v12 = v9;
  }
  result.height = v11;
  result.width = v12;
  return result;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (CALayer)dividerLayer
{
  return self->_dividerLayer;
}

- (void)setDividerLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerLayer, 0);

  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end