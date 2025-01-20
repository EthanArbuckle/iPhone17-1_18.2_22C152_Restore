@interface SUUIOnboardingProgressView
+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3;
- (CGSize)preferredImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SUUIOnboardingProgressView)initWithFrame:(CGRect)a3;
- (UIColor)fillColor;
- (UIImage)image;
- (double)progress;
- (id)_borderColor;
- (void)layoutSubviews;
- (void)setFillColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SUUIOnboardingProgressView

- (SUUIOnboardingProgressView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SUUIOnboardingProgressView;
  v3 = -[SUUIOnboardingProgressView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUIOnboardingProgressView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = -[SUUIShapeView initWithFrame:]([SUUIShapeView alloc], "initWithFrame:", v5, v7, v9, v11);
    borderView = v4->_borderView;
    v4->_borderView = v13;

    [(SUUIOnboardingProgressView *)v4 addSubview:v4->_borderView];
    v15 = [(SUUIShapeView *)v4->_borderView layer];
    id v16 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

    [v15 setLineWidth:3.0];
    id v17 = [(SUUIOnboardingProgressView *)v4 _borderColor];
    objc_msgSend(v15, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

    v18 = -[SUUIShapeView initWithFrame:]([SUUIShapeView alloc], "initWithFrame:", v6, v8, v10, v12);
    progressView = v4->_progressView;
    v4->_progressView = v18;

    v20 = v4->_progressView;
    v21 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIShapeView *)v20 setBackgroundColor:v21];

    v22 = v4->_progressView;
    CGAffineTransformMakeRotation(&v27, -1.57079633);
    [(SUUIShapeView *)v22 setTransform:&v27];
    [(SUUIOnboardingProgressView *)v4 addSubview:v4->_progressView];
    v23 = [(SUUIShapeView *)v4->_progressView layer];
    id v24 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v23, "setFillColor:", objc_msgSend(v24, "CGColor"));

    [v23 setLineWidth:6.0];
    id v25 = [(SUUIOnboardingProgressView *)v4 tintColor];
    objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v25, "CGColor"));

    [v23 setStrokeEnd:0.0];
    [v23 setStrokeStart:0.0];
  }
  return v4;
}

+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3
{
  double v3 = a3.width + -12.0 + -8.0;
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIColor)fillColor
{
  v2 = [(SUUIShapeView *)self->_borderView layer];
  uint64_t v3 = [v2 fillColor];

  if (v3)
  {
    double v4 = [MEMORY[0x263F825C8] colorWithCGColor:v3];
  }
  else
  {
    double v4 = 0;
  }
  return (UIColor *)v4;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (CGSize)preferredImageSize
{
  uint64_t v3 = objc_opt_class();
  [(SUUIOnboardingProgressView *)self frame];
  objc_msgSend(v3, "preferredImageSizeForViewSize:", v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setFillColor:(id)a3
{
  borderView = self->_borderView;
  id v4 = a3;
  id v7 = [(SUUIShapeView *)borderView layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  id v11 = v4;
  if (v4)
  {
    if (!imageView)
    {
      uint64_t v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      id v7 = self->_imageView;
      self->_imageView = v6;

      double v8 = self->_imageView;
      double v9 = [MEMORY[0x263F825C8] clearColor];
      [(UIImageView *)v8 setBackgroundColor:v9];

      [(SUUIOnboardingProgressView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setImage:v11];
    [(SUUIOnboardingProgressView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)imageView removeFromSuperview];
    double v10 = self->_imageView;
    self->_imageView = 0;
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress = self->_progress;
  if (progress != a3)
  {
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    double v7 = fmax(a3, 0.0);
    self->_double progress = v7;
    id v11 = [(SUUIShapeView *)self->_progressView layer];
    if (a4)
    {
      double v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      objc_msgSend(v8, "setDuration:", vabdd_f64(progress, v7) * 0.6);
      [v8 setFillMode:*MEMORY[0x263F15AB0]];
      [v8 setRemovedOnCompletion:0];
      double v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
      [v8 setTimingFunction:v9];

      double v10 = [NSNumber numberWithDouble:self->_progress];
      [v8 setToValue:v10];

      [v11 addAnimation:v8 forKey:0];
    }
    else
    {
      [v11 removeAllAnimations];
      [v11 setStrokeEnd:self->_progress];
    }
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 length];
  titleLabel = self->_titleLabel;
  if (v4)
  {
    if (!titleLabel)
    {
      uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      double v7 = self->_titleLabel;
      self->_titleLabel = v6;

      double v8 = self->_titleLabel;
      double v9 = [MEMORY[0x263F825C8] clearColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      double v10 = self->_titleLabel;
      id v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
      [(UILabel *)v10 setFont:v11];

      [(UILabel *)self->_titleLabel setNumberOfLines:2];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      double v12 = self->_titleLabel;
      v13 = [(SUUIOnboardingProgressView *)self tintColor];
      [(UILabel *)v12 setTextColor:v13];

      [(SUUIOnboardingProgressView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v15];
    [(SUUIOnboardingProgressView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)titleLabel removeFromSuperview];
    v14 = self->_titleLabel;
    self->_titleLabel = 0;
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIOnboardingProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SUUIShapeView setFrame:](self->_borderView, "setFrame:");
  -[SUUIShapeView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
  id v29 = [(SUUIShapeView *)self->_borderView layer];
  [v29 lineWidth];
  CGFloat v12 = v11 * 0.5;
  v13 = (void *)MEMORY[0x263F824C0];
  [(SUUIShapeView *)self->_borderView bounds];
  CGRect v32 = CGRectInset(v31, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPath:", objc_msgSend(v14, "CGPath"));

  id v15 = [(SUUIShapeView *)self->_progressView layer];
  [v15 lineWidth];
  CGFloat v17 = v16 * 0.5;
  v18 = (void *)MEMORY[0x263F824C0];
  [(SUUIShapeView *)self->_progressView bounds];
  CGRect v34 = CGRectInset(v33, v17, v17);
  objc_msgSend(v18, "bezierPathWithOvalInRect:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  id v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", objc_msgSend(v19, "CGPath"));

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v8, v10);
    double v22 = v21;
    double v24 = v23;
    *(float *)&double v21 = (v8 - v21) * 0.5;
    *(float *)&double v23 = (v10 - v23) * 0.5;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", floorf(*(float *)&v21), floorf(*(float *)&v23), v22, v24);
    p_titleLabel = (id *)&self->_titleLabel;
  }
  else
  {
    p_titleLabel = (id *)&self->_titleLabel;
    if (!*p_titleLabel) {
      goto LABEL_6;
    }
    double v26 = *MEMORY[0x263F001A8];
    objc_msgSend(*p_titleLabel, "sizeThatFits:", v8, v10);
    float v28 = (v10 - v27) * 0.5;
    objc_msgSend(*p_titleLabel, "setFrame:", v26, floorf(v28), v8, v27);
  }
  [*p_titleLabel setHidden:imageView != 0];
LABEL_6:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(SUUIOnboardingProgressView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  double v5 = 78.0;
  if (v4 == 2) {
    double v5 = 120.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)tintColorDidChange
{
  double v3 = [(SUUIOnboardingProgressView *)self tintColor];
  uint64_t v4 = [(SUUIShapeView *)self->_borderView layer];
  id v5 = [(SUUIOnboardingProgressView *)self _borderColor];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  double v6 = [(SUUIShapeView *)self->_progressView layer];
  id v7 = v3;
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  [(UILabel *)self->_titleLabel setTextColor:v7];
  v8.receiver = self;
  v8.super_class = (Class)SUUIOnboardingProgressView;
  [(SUUIOnboardingProgressView *)&v8 tintColorDidChange];
}

- (id)_borderColor
{
  v2 = [(SUUIOnboardingProgressView *)self tintColor];
  double v3 = [v2 colorWithAlphaComponent:0.5];

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end