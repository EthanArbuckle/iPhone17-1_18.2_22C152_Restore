@interface SKUIOnboardingProgressView
+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3;
- (CGSize)preferredImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SKUIOnboardingProgressView)initWithFrame:(CGRect)a3;
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

@implementation SKUIOnboardingProgressView

- (SKUIOnboardingProgressView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOnboardingProgressView initWithFrame:]();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIOnboardingProgressView;
  v8 = -[SKUIOnboardingProgressView initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUIOnboardingProgressView *)v8 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = -[SKUIShapeView initWithFrame:]([SKUIShapeView alloc], "initWithFrame:", v10, v12, v14, v16);
    borderView = v9->_borderView;
    v9->_borderView = v18;

    [(SKUIOnboardingProgressView *)v9 addSubview:v9->_borderView];
    v20 = [(SKUIShapeView *)v9->_borderView layer];
    id v21 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v20, "setFillColor:", objc_msgSend(v21, "CGColor"));

    [v20 setLineWidth:3.0];
    id v22 = [(SKUIOnboardingProgressView *)v9 _borderColor];
    objc_msgSend(v20, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

    v23 = -[SKUIShapeView initWithFrame:]([SKUIShapeView alloc], "initWithFrame:", v11, v13, v15, v17);
    progressView = v9->_progressView;
    v9->_progressView = v23;

    v25 = v9->_progressView;
    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIShapeView *)v25 setBackgroundColor:v26];

    v27 = v9->_progressView;
    CGAffineTransformMakeRotation(&v32, -1.57079633);
    [(SKUIShapeView *)v27 setTransform:&v32];
    [(SKUIOnboardingProgressView *)v9 addSubview:v9->_progressView];
    v28 = [(SKUIShapeView *)v9->_progressView layer];
    id v29 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v28, "setFillColor:", objc_msgSend(v29, "CGColor"));

    [v28 setLineWidth:6.0];
    id v30 = [(SKUIOnboardingProgressView *)v9 tintColor];
    objc_msgSend(v28, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    [v28 setStrokeEnd:0.0];
    [v28 setStrokeStart:0.0];
  }
  return v9;
}

+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3
{
  double width = a3.width;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIOnboardingProgressView preferredImageSizeForViewSize:]();
  }
  double v4 = width + -12.0 + -8.0;
  double v5 = v4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (UIColor)fillColor
{
  v2 = [(SKUIShapeView *)self->_borderView layer];
  uint64_t v3 = [v2 fillColor];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1618] colorWithCGColor:v3];
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
  [(SKUIOnboardingProgressView *)self frame];

  objc_msgSend(v3, "preferredImageSizeForViewSize:", v4, v5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)setFillColor:(id)a3
{
  borderView = self->_borderView;
  id v4 = a3;
  id v7 = [(SKUIShapeView *)borderView layer];
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
      uint64_t v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      id v7 = self->_imageView;
      self->_imageView = v6;

      v8 = self->_imageView;
      v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIImageView *)v8 setBackgroundColor:v9];

      [(SKUIOnboardingProgressView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setImage:v11];
    [(SKUIOnboardingProgressView *)self setNeedsLayout];
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
    id v11 = [(SKUIShapeView *)self->_progressView layer];
    if (a4)
    {
      v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      objc_msgSend(v8, "setDuration:", vabdd_f64(progress, v7) * 0.6);
      [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v8 setRemovedOnCompletion:0];
      v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
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
      uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      double v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      double v10 = self->_titleLabel;
      id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
      [(UILabel *)v10 setFont:v11];

      [(UILabel *)self->_titleLabel setNumberOfLines:2];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      double v12 = self->_titleLabel;
      double v13 = [(SKUIOnboardingProgressView *)self tintColor];
      [(UILabel *)v12 setTextColor:v13];

      [(SKUIOnboardingProgressView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v15];
    [(SKUIOnboardingProgressView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)titleLabel removeFromSuperview];
    double v14 = self->_titleLabel;
    self->_titleLabel = 0;
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SKUIOnboardingProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SKUIShapeView setFrame:](self->_borderView, "setFrame:");
  -[SKUIShapeView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
  id v29 = [(SKUIShapeView *)self->_borderView layer];
  [v29 lineWidth];
  CGFloat v12 = v11 * 0.5;
  double v13 = (void *)MEMORY[0x1E4FB14C0];
  [(SKUIShapeView *)self->_borderView bounds];
  CGRect v32 = CGRectInset(v31, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPath:", objc_msgSend(v14, "CGPath"));

  id v15 = [(SKUIShapeView *)self->_progressView layer];
  [v15 lineWidth];
  CGFloat v17 = v16 * 0.5;
  v18 = (void *)MEMORY[0x1E4FB14C0];
  [(SKUIShapeView *)self->_progressView bounds];
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
    double v26 = *MEMORY[0x1E4F1DB28];
    objc_msgSend(*p_titleLabel, "sizeThatFits:", v8, v10);
    float v28 = (v10 - v27) * 0.5;
    objc_msgSend(*p_titleLabel, "setFrame:", v26, floorf(v28), v8, v27);
  }
  [*p_titleLabel setHidden:imageView != 0];
LABEL_6:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(SKUIOnboardingProgressView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  double v5 = 78.0;
  if (v4 == 2) {
    double v5 = 120.0;
  }
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)tintColorDidChange
{
  double v3 = [(SKUIOnboardingProgressView *)self tintColor];
  uint64_t v4 = [(SKUIShapeView *)self->_borderView layer];
  id v5 = [(SKUIOnboardingProgressView *)self _borderColor];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  double v6 = [(SKUIShapeView *)self->_progressView layer];
  id v7 = v3;
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  [(UILabel *)self->_titleLabel setTextColor:v7];
  v8.receiver = self;
  v8.super_class = (Class)SKUIOnboardingProgressView;
  [(SKUIOnboardingProgressView *)&v8 tintColorDidChange];
}

- (id)_borderColor
{
  v2 = [(SKUIOnboardingProgressView *)self tintColor];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIOnboardingProgressView initWithFrame:]";
}

+ (void)preferredImageSizeForViewSize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIOnboardingProgressView preferredImageSizeForViewSize:]";
}

@end