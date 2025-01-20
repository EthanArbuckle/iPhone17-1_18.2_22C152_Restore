@interface SUUIPreviewProgressIndicator
- (BOOL)isIndeterminate;
- (SUUIPreviewProgressIndicator)initWithFrame:(CGRect)a3;
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

@implementation SUUIPreviewProgressIndicator

- (SUUIPreviewProgressIndicator)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SUUIPreviewProgressIndicator;
  v3 = -[SUUIPreviewProgressIndicator initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUIPreviewProgressIndicator *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = -[SUUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v4, "_newShapeViewWithBounds:lineWidth:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SUUIShapeView *)v13;

    [(SUUIShapeView *)v4->_backgroundView setUserInteractionEnabled:0];
    [(SUUIPreviewProgressIndicator *)v4 addSubview:v4->_backgroundView];
    uint64_t v15 = -[SUUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v4, "_newShapeViewWithBounds:lineWidth:", v6, v8, v10, v12, 4.0);
    foregroundView = v4->_foregroundView;
    v4->_foregroundView = (SUUIShapeView *)v15;

    v17 = v4->_foregroundView;
    v18 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIShapeView *)v17 setBackgroundColor:v18];

    [(SUUIShapeView *)v4->_foregroundView setUserInteractionEnabled:0];
    v19 = [(SUUIShapeView *)v4->_foregroundView layer];
    id v20 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v19, "setFillColor:", objc_msgSend(v20, "CGColor"));

    [v19 setStrokeEnd:0.0];
    [(SUUIPreviewProgressIndicator *)v4 addSubview:v4->_foregroundView];
    v21 = (void *)MEMORY[0x263F827E8];
    v22 = SUUIBundle();
    v23 = [v21 imageNamed:@"DownloadProgressButtonConnecting" inBundle:v22];
    v24 = [v23 imageWithRenderingMode:2];

    uint64_t v25 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v24];
    cancelImageView = v4->_cancelImageView;
    v4->_cancelImageView = (UIImageView *)v25;

    [(UIImageView *)v4->_cancelImageView setAutoresizingMask:18];
    [(UIImageView *)v4->_cancelImageView setContentMode:4];
    -[UIImageView setFrame:](v4->_cancelImageView, "setFrame:", v6, v8, v10, v12);
    [(SUUIPreviewProgressIndicator *)v4 addSubview:v4->_cancelImageView];
  }
  return v4;
}

- (void)beginIndeterminateAnimation
{
  BOOL isIndeterminate = self->_isIndeterminate;
  v4 = [(SUUIShapeView *)self->_backgroundView layer];
  double v5 = v4;
  if (isIndeterminate)
  {
    double v6 = [v4 animationKeys];
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
  double v8 = [(SUUIPreviewProgressIndicator *)self window];

  if (v8)
  {
    [(SUUIPreviewProgressIndicator *)self _beginIndeterminateAnimation];
  }
}

- (void)endIndeterminateAnimation
{
  if (self->_isIndeterminate)
  {
    v3 = [(SUUIShapeView *)self->_backgroundView layer];
    [v3 setStrokeStart:0.0];
    [v3 removeAllAnimations];
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    [(SUUIShapeView *)backgroundView setTransform:&v5];
    self->_BOOL isIndeterminate = 0;
  }
}

- (void)reloadWithPlayerStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if ([v10 playerState] == 1)
  {
    [(SUUIPreviewProgressIndicator *)self beginIndeterminateAnimation];
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
    [(SUUIPreviewProgressIndicator *)self setProgress:v4 animated:v8];
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
      [(SUUIPreviewProgressIndicator *)self endIndeterminateAnimation];
    }
    float v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    id v11 = [(SUUIShapeView *)self->_foregroundView layer];
    if (a4)
    {
      double v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      [v8 setDuration:0.2];
      [v8 setFillMode:*MEMORY[0x263F15AB0]];
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
  [(SUUIShapeView *)backgroundView setBackgroundColor:v5];
  double v6 = [(SUUIShapeView *)self->_backgroundView layer];
  id v7 = v5;
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  v8.receiver = self;
  v8.super_class = (Class)SUUIPreviewProgressIndicator;
  [(SUUIPreviewProgressIndicator *)&v8 setBackgroundColor:v7];
}

- (void)tintColorDidChange
{
  id v3 = [(SUUIPreviewProgressIndicator *)self tintColor];
  uint64_t v4 = [v3 CGColor];

  id v5 = [(SUUIShapeView *)self->_backgroundView layer];
  [v5 setStrokeColor:v4];

  double v6 = [(SUUIShapeView *)self->_foregroundView layer];
  [v6 setStrokeColor:v4];

  v7.receiver = self;
  v7.super_class = (Class)SUUIPreviewProgressIndicator;
  [(SUUIPreviewProgressIndicator *)&v7 tintColorDidChange];
}

- (void)_beginIndeterminateAnimation
{
  id v3 = [(SUUIShapeView *)self->_backgroundView layer];
  [v3 removeAllAnimations];

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  [(SUUIShapeView *)backgroundView setTransform:&v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke;
  v5[3] = &unk_265400980;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateKeyframesWithDuration:197228 delay:v5 options:0 animations:1.0 completion:0.0];
}

uint64_t __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = MEMORY[0x263EF8330];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_2654019B0;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = v2;
    uint64_t result = [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v5 relativeDuration:(double)v2++ * 0.25 animations:0.25];
  }
  while (v2 != 4);
  return result;
}

uint64_t __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
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
  id v10 = [SUUIShapeView alloc];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v18 = CGRectInset(v17, a4 * 0.5, a4 * 0.5);
  id v11 = -[SUUIShapeView initWithFrame:](v10, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  CGAffineTransformMakeRotation(&v16, -1.57079633);
  [(SUUIShapeView *)v11 setTransform:&v16];
  double v12 = [(SUUIShapeView *)v11 layer];
  [v12 setLineWidth:a4];
  id v13 = [(SUUIPreviewProgressIndicator *)self tintColor];
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [(SUUIShapeView *)v11 bounds];
  v14 = CGPathCreateWithEllipseInRect(v19, 0);
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

@end