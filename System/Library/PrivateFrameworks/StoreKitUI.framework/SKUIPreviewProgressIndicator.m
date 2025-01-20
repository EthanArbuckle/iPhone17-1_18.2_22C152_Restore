@interface SKUIPreviewProgressIndicator
- (BOOL)isIndeterminate;
- (SKUIPreviewProgressIndicator)initWithFrame:(CGRect)a3;
- (float)progress;
- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4;
- (void)_beginIndeterminateAnimation;
- (void)beginIndeterminateAnimation;
- (void)endIndeterminateAnimation;
- (void)reloadWithPlayerStatus:(id)a3 animated:(BOOL)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation SKUIPreviewProgressIndicator

- (SKUIPreviewProgressIndicator)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewProgressIndicator initWithFrame:]();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIPreviewProgressIndicator;
  v8 = -[SKUIPreviewProgressIndicator initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUIPreviewProgressIndicator *)v8 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = -[SKUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v9, "_newShapeViewWithBounds:lineWidth:");
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (SKUIShapeView *)v18;

    [(SKUIShapeView *)v9->_backgroundView setUserInteractionEnabled:0];
    [(SKUIPreviewProgressIndicator *)v9 addSubview:v9->_backgroundView];
    uint64_t v20 = -[SKUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v9, "_newShapeViewWithBounds:lineWidth:", v11, v13, v15, v17, 4.0);
    foregroundView = v9->_foregroundView;
    v9->_foregroundView = (SKUIShapeView *)v20;

    v22 = v9->_foregroundView;
    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIShapeView *)v22 setBackgroundColor:v23];

    [(SKUIShapeView *)v9->_foregroundView setUserInteractionEnabled:0];
    v24 = [(SKUIShapeView *)v9->_foregroundView layer];
    id v25 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v24, "setFillColor:", objc_msgSend(v25, "CGColor"));

    [v24 setStrokeEnd:0.0];
    [(SKUIPreviewProgressIndicator *)v9 addSubview:v9->_foregroundView];
    v26 = (void *)MEMORY[0x1E4FB1818];
    v27 = SKUIBundle();
    v28 = [v26 imageNamed:@"DownloadProgressButtonConnecting" inBundle:v27];
    v29 = [v28 imageWithRenderingMode:2];

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v29];
    cancelImageView = v9->_cancelImageView;
    v9->_cancelImageView = (UIImageView *)v30;

    [(UIImageView *)v9->_cancelImageView setAutoresizingMask:18];
    [(UIImageView *)v9->_cancelImageView setContentMode:4];
    -[UIImageView setFrame:](v9->_cancelImageView, "setFrame:", v11, v13, v15, v17);
    [(SKUIPreviewProgressIndicator *)v9 addSubview:v9->_cancelImageView];
  }
  return v9;
}

- (void)beginIndeterminateAnimation
{
  BOOL isIndeterminate = self->_isIndeterminate;
  v4 = [(SKUIShapeView *)self->_backgroundView layer];
  v5 = v4;
  if (isIndeterminate)
  {
    v6 = [v4 animationKeys];
    uint64_t v7 = [v6 count];

    if (v7) {
      return;
    }
  }
  else
  {
    [v4 setStrokeStart:0.119999997];
    self->_BOOL isIndeterminate = 1;
  }
  v8 = [(SKUIPreviewProgressIndicator *)self window];

  if (v8)
  {
    [(SKUIPreviewProgressIndicator *)self _beginIndeterminateAnimation];
  }
}

- (void)endIndeterminateAnimation
{
  if (self->_isIndeterminate)
  {
    v3 = [(SKUIShapeView *)self->_backgroundView layer];
    [v3 setStrokeStart:0.0];
    [v3 removeAllAnimations];
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    [(SKUIShapeView *)backgroundView setTransform:&v5];
    self->_BOOL isIndeterminate = 0;
  }
}

- (void)reloadWithPlayerStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if ([v10 playerState] == 1)
  {
    [(SKUIPreviewProgressIndicator *)self beginIndeterminateAnimation];
  }
  else
  {
    [v10 duration];
    double v7 = v6;
    if (v6 >= 2.22044605e-16)
    {
      [v10 currentTime];
      double v8 = v9 / v7;
      *(float *)&double v8 = v8;
    }
    else
    {
      double v8 = 0.0;
    }
    [(SKUIPreviewProgressIndicator *)self setProgress:v4 animated:v8];
  }
}

- (void)setProgress:(float)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921) {
      [(SKUIPreviewProgressIndicator *)self endIndeterminateAnimation];
    }
    float v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    id v11 = [(SKUIShapeView *)self->_foregroundView layer];
    if (a4)
    {
      double v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      [v8 setDuration:0.2];
      [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v8 setRemovedOnCompletion:0];
      *(float *)&double v9 = self->_progress;
      id v10 = [NSNumber numberWithFloat:v9];
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

- (void)setBackgroundColor:(id)a3
{
  backgroundView = self->_backgroundView;
  id v5 = a3;
  [(SKUIShapeView *)backgroundView setBackgroundColor:v5];
  double v6 = [(SKUIShapeView *)self->_backgroundView layer];
  id v7 = v5;
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  v8.receiver = self;
  v8.super_class = (Class)SKUIPreviewProgressIndicator;
  [(SKUIPreviewProgressIndicator *)&v8 setBackgroundColor:v7];
}

- (void)tintColorDidChange
{
  id v3 = [(SKUIPreviewProgressIndicator *)self tintColor];
  uint64_t v4 = [v3 CGColor];

  id v5 = [(SKUIShapeView *)self->_backgroundView layer];
  [v5 setStrokeColor:v4];

  double v6 = [(SKUIShapeView *)self->_foregroundView layer];
  [v6 setStrokeColor:v4];

  v7.receiver = self;
  v7.super_class = (Class)SKUIPreviewProgressIndicator;
  [(SKUIPreviewProgressIndicator *)&v7 tintColorDidChange];
}

- (void)_beginIndeterminateAnimation
{
  id v3 = [(SKUIShapeView *)self->_backgroundView layer];
  [v3 removeAllAnimations];

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  [(SKUIShapeView *)backgroundView setTransform:&v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke;
  v5[3] = &unk_1E6422020;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:197228 delay:v5 options:0 animations:1.0 completion:0.0];
}

uint64_t __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E6426868;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = v2;
    uint64_t result = [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v5 relativeDuration:(double)v2++ * 0.25 animations:0.25];
  }
  while (v2 != 4);
  return result;
}

uint64_t __60__SKUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 456);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return [v1 setTransform:&v3];
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = [SKUIShapeView alloc];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v18 = CGRectInset(v17, a4 * 0.5, a4 * 0.5);
  id v11 = -[SKUIShapeView initWithFrame:](v10, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  CGAffineTransformMakeRotation(&v16, -1.57079633);
  [(SKUIShapeView *)v11 setTransform:&v16];
  double v12 = [(SKUIShapeView *)v11 layer];
  [v12 setLineWidth:a4];
  id v13 = [(SKUIPreviewProgressIndicator *)self tintColor];
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [(SKUIShapeView *)v11 bounds];
  double v14 = CGPathCreateWithEllipseInRect(v19, 0);
  [v12 setPath:v14];
  CGPathRelease(v14);

  return v11;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_cancelImageView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPreviewProgressIndicator initWithFrame:]";
}

@end