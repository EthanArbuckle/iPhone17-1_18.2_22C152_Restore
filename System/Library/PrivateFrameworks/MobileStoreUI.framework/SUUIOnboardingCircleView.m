@interface SUUIOnboardingCircleView
- (SUUIOnboardingCircleView)initWithFrame:(CGRect)a3;
- (UIColor)fillColor;
- (UIEdgeInsets)edgeInsets;
- (UILabel)titleLabel;
- (double)minimumDiameter;
- (id)description;
- (int64_t)titlePosition;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageAlpha:(double)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFillColor:(id)a3;
- (void)setMinimumDiameter:(double)a3;
- (void)setTitlePosition:(int64_t)a3;
@end

@implementation SUUIOnboardingCircleView

- (SUUIOnboardingCircleView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIOnboardingCircleView;
  v3 = -[SUUIOnboardingCircleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v4;

    [(UIImageView *)v3->_backgroundImageView setAlpha:0.0];
    v6 = v3->_backgroundImageView;
    v7 = [MEMORY[0x263F825C8] clearColor];
    [(UIImageView *)v6 setBackgroundColor:v7];

    [(SUUIOnboardingCircleView *)v3 addSubview:v3->_backgroundImageView];
  }
  return v3;
}

- (void)setBackgroundImage:(id)a3
{
  id v6 = a3;
  v4 = [(UIImageView *)self->_backgroundImageView image];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(UIImageView *)self->_backgroundImageView setImage:v6];
    [(SUUIOnboardingCircleView *)self setNeedsLayout];
  }
}

- (void)setBackgroundImageAlpha:(double)a3
{
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    [(SUUIOnboardingCircleView *)self setNeedsDisplay];
    [(SUUIOnboardingCircleView *)self setNeedsLayout];
  }
}

- (void)setFillColor:(id)a3
{
  if (self->_fillColor != a3)
  {
    v4 = (UIColor *)[a3 copy];
    fillColor = self->_fillColor;
    self->_fillColor = v4;

    [(SUUIOnboardingCircleView *)self setNeedsDisplay];
  }
}

- (void)setTitlePosition:(int64_t)a3
{
  if (self->_titlePosition != a3)
  {
    self->_titlePosition = a3;
    [(SUUIOnboardingCircleView *)self setNeedsLayout];
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    char v5 = self->_titleLabel;
    self->_titleLabel = v4;

    id v6 = self->_titleLabel;
    v7 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v6 setBackgroundColor:v7];

    v8 = self->_titleLabel;
    objc_super v9 = [MEMORY[0x263F81708] boldSystemFontOfSize:10.0];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_titleLabel setNumberOfLines:3];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    v10 = self->_titleLabel;
    v11 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v10 setTextColor:v11];

    [(SUUIOnboardingCircleView *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUUIOnboardingCircleView;
  v4 = [(SUUIOnboardingCircleView *)&v8 description];
  char v5 = [(UILabel *)self->_titleLabel text];
  id v6 = [v3 stringWithFormat:@"%@: [%@]", v4, v5];

  return v6;
}

- (void)drawRect:(CGRect)a3
{
  v4 = (void *)MEMORY[0x263F824C0];
  [(SUUIOnboardingCircleView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SUUIOnboardingCircleView *)self edgeInsets];
  objc_msgSend(v4, "bezierPathWithOvalInRect:", v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = [(SUUIOnboardingCircleView *)self fillColor];
  [v17 set];

  [v18 fill];
}

- (void)layoutSubviews
{
  [(SUUIOnboardingCircleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SUUIOnboardingCircleView *)self edgeInsets];
  double v14 = v13;
  double v15 = v11;
  double v17 = v16;
  double v18 = v12;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    double minimumDiameter = self->_minimumDiameter;
    if (minimumDiameter < 0.00000011920929) {
      double minimumDiameter = v8;
    }
    double rect_24 = v4;
    double v21 = minimumDiameter - v11 - v12 + -6.0;
    double rect_8 = *(double *)(MEMORY[0x263F001A8] + 8);
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v21, 1.79769313e308);
    double rect_16 = v6;
    double v24 = v23;
    if (v22 < v21) {
      double v21 = v22;
    }
    float v25 = (v8 - v21) * 0.5;
    int64_t titlePosition = self->_titlePosition;
    v27 = [(UIImageView *)self->_backgroundImageView image];

    if (v27) {
      int64_t v28 = titlePosition;
    }
    else {
      int64_t v28 = 0;
    }
    float v29 = (v10 - v24) * 0.5;
    double v30 = floorf(v29);
    float v31 = v10 - v17 + -15.0 - v24;
    double v32 = floorf(v31);
    if (v28 != 1) {
      double v32 = rect_8;
    }
    if (!v28) {
      double v32 = v30;
    }
    v33 = self->_titleLabel;
    uint64_t v34 = rect;
    double v35 = v21;
    double v36 = v24;
    double v6 = rect_16;
    double v4 = rect_24;
    CGRect v43 = CGRectIntegral(*(CGRect *)(&v32 - 1));
    -[UILabel setFrame:](v33, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  }
  backgroundImageView = self->_backgroundImageView;
  -[UIImageView setFrame:](backgroundImageView, "setFrame:", v4 + v15, v6 + v14, v8 - (v15 + v18), v10 - (v14 + v17));
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)minimumDiameter
{
  return self->_minimumDiameter;
}

- (void)setMinimumDiameter:(double)a3
{
  self->_double minimumDiameter = a3;
}

- (int64_t)titlePosition
{
  return self->_titlePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end