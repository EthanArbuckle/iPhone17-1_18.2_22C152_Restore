@interface SKUICircleProgressIndicator
+ (id)_borderImage;
+ (id)_fillImage;
+ (id)_indeterminateImage;
- (BOOL)isHighlighted;
- (BOOL)isIndeterminate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUICircleProgressIndicator)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)imageInsets;
- (UIImage)image;
- (double)progress;
- (void)_animateValueOnDisplayLink:(id)a3;
- (void)_setHidesBorderView:(BOOL)a3;
- (void)_startIndeterminateAnimation;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation SKUICircleProgressIndicator

- (SKUICircleProgressIndicator)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICircleProgressIndicator initWithFrame:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICircleProgressIndicator;
  v8 = -[SKUICircleProgressIndicator initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v10 = [(SKUICircleProgressIndicator *)v8 tintColor];
    v11 = [(id)objc_opt_class() _borderImage];
    uint64_t v12 = [v11 _flatImageWithColor:v10];
    borderImage = v9->_borderImage;
    v9->_borderImage = (UIImage *)v12;

    v14 = [(id)objc_opt_class() _fillImage];

    uint64_t v15 = [v14 _flatImageWithColor:v10];
    fillImage = v9->_fillImage;
    v9->_fillImage = (UIImage *)v15;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(UIImageView *)self->_indeterminateView layer];
  [v3 removeAllAnimations];

  v4.receiver = self;
  v4.super_class = (Class)SKUICircleProgressIndicator;
  [(SKUICircleProgressIndicator *)&v4 dealloc];
}

- (BOOL)isIndeterminate
{
  return self->_indeterminateView != 0;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    if (self->_highlighted)
    {
      [(SKUICircleProgressIndicator *)self setBackgroundColor:self->_unhighlightedBackgroundColor];
      unhighlightedBackgroundColor = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = 0;
    }
    else
    {
      v6 = [(SKUICircleProgressIndicator *)self backgroundColor];
      v7 = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = v6;

      unhighlightedBackgroundColor = [MEMORY[0x1E4FB1618] clearColor];
      [(SKUICircleProgressIndicator *)self setBackgroundColor:unhighlightedBackgroundColor];
    }

    self->_highlighted = a3;
    [(SKUICircleProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)setImage:(id)a3
{
  if (self->_centerImage != a3)
  {
    id v4 = a3;
    v5 = [(SKUICircleProgressIndicator *)self tintColor];
    v6 = [v4 _flatImageWithColor:v5];

    centerImage = self->_centerImage;
    self->_centerImage = v6;

    v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__SKUICircleProgressIndicator_setImage___block_invoke;
    v9[3] = &unk_1E6422020;
    v9[4] = self;
    [v8 _performBlockAfterCATransactionCommits:v9];
  }
}

uint64_t __40__SKUICircleProgressIndicator_setImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (self->_centerImageInsets.left != a3.left
    || self->_centerImageInsets.top != a3.top
    || self->_centerImageInsets.right != a3.right
    || self->_centerImageInsets.bottom != a3.bottom)
  {
    self->_centerImageInsets = a3;
    [(SKUICircleProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)setIndeterminate:(BOOL)a3
{
  indeterminateView = self->_indeterminateView;
  if (a3)
  {
    if (!indeterminateView)
    {
      v5 = [(id)objc_opt_class() _indeterminateImage];
      v6 = [(SKUICircleProgressIndicator *)self tintColor];
      id v13 = [v5 _flatImageWithColor:v6];

      v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
      v8 = self->_indeterminateView;
      self->_indeterminateView = v7;

      v9 = self->_indeterminateView;
      v10 = [(SKUICircleProgressIndicator *)self backgroundColor];
      [(UIImageView *)v9 setBackgroundColor:v10];

      [(SKUICircleProgressIndicator *)self addSubview:self->_indeterminateView];
      [(SKUICircleProgressIndicator *)self setNeedsDisplay];
      [(SKUICircleProgressIndicator *)self _startIndeterminateAnimation];
    }
  }
  else if (indeterminateView)
  {
    v11 = [(UIImageView *)indeterminateView layer];
    [v11 removeAllAnimations];

    [(UIImageView *)self->_indeterminateView removeFromSuperview];
    uint64_t v12 = self->_indeterminateView;
    self->_indeterminateView = 0;

    [(SKUICircleProgressIndicator *)self setNeedsDisplay];
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress = self->_progress;
  if (progress == a3) {
    return;
  }
  if (a4)
  {
    if (self->_isAnimating) {
      double progress = self->_animatedValue;
    }
    self->_animationStartValue = progress;
    self->_isAnimating = 1;
    self->_animatedValue = self->_progress;
    double v7 = CACurrentMediaTime();
    self->_animationStartTime = v7;
    self->_animationEndTime = v7 + 0.2;
    if (self->_displayLink) {
      goto LABEL_10;
    }
    v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v9 = [v8 displayLinkWithTarget:self selector:sel__animateValueOnDisplayLink_];
    displayLink = self->_displayLink;
    self->_displayLink = v9;

    v11 = self->_displayLink;
    uint64_t v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    self->_isAnimating = 0;
    [(CADisplayLink *)self->_displayLink invalidate];
    uint64_t v12 = self->_displayLink;
    self->_displayLink = 0;
  }

LABEL_10:
  self->_double progress = a3;

  [(SKUICircleProgressIndicator *)self setNeedsDisplay];
}

- (void)didMoveToWindow
{
  v3 = [(SKUICircleProgressIndicator *)self window];
  if (v3)
  {
    indeterminateView = self->_indeterminateView;

    if (indeterminateView)
    {
      v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__SKUICircleProgressIndicator_didMoveToWindow__block_invoke;
      v7[3] = &unk_1E6422020;
      v7[4] = self;
      [v5 _performBlockAfterCATransactionCommits:v7];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUICircleProgressIndicator;
  [(SKUICircleProgressIndicator *)&v6 didMoveToWindow];
}

uint64_t __46__SKUICircleProgressIndicator_didMoveToWindow__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 512) layer];
  [v2 removeAllAnimations];

  v3 = *(void **)(a1 + 32);

  return [v3 _startIndeterminateAnimation];
}

- (void)drawRect:(CGRect)a3
{
  if (!self->_indeterminateView)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [(SKUICircleProgressIndicator *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    -[UIImage drawInRect:](self->_borderImage, "drawInRect:");
    centerImage = self->_centerImage;
    if (centerImage)
    {
      [(UIImage *)centerImage size];
      double v14 = v13;
      *(float *)&double v13 = (v9 - v13) * 0.5;
      *(float *)&double v15 = (v11 - v15) * 0.5;
      -[UIImage drawInRect:](self->_centerImage, "drawInRect:", self->_centerImageInsets.left + floorf(*(float *)&v13), self->_centerImageInsets.top + floorf(*(float *)&v15), v14);
    }
    v24.origin.double x = v5;
    v24.origin.double y = v7;
    v24.size.double width = v9;
    v24.size.double height = v11;
    double MidX = CGRectGetMidX(v24);
    v25.origin.double x = v5;
    v25.origin.double y = v7;
    v25.size.double width = v9;
    v25.size.double height = v11;
    double MidY = CGRectGetMidY(v25);
    float v18 = v11 * 0.5;
    double v19 = ceilf(v18);
    if (self->_isAnimating) {
      v20 = &OBJC_IVAR___SKUICircleProgressIndicator__animatedValue;
    }
    else {
      v20 = &OBJC_IVAR___SKUICircleProgressIndicator__progress;
    }
    double v21 = *(double *)((char *)&self->super.super.super.isa + *v20);
    objc_msgSend(v22, "moveToPoint:", MidX, MidY);
    objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v19, -1.57079633, v21 * 6.28318531 + -1.57079633);
    objc_msgSend(v22, "addLineToPoint:", MidX, MidY);
    [v22 clip];
    -[UIImage drawInRect:](self->_fillImage, "drawInRect:", v5, v7, v9, v11);
  }
}

- (void)layoutSubviews
{
  if (self->_indeterminateView)
  {
    [(SKUICircleProgressIndicator *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(UIImageView *)self->_indeterminateView frame];
    float v8 = (v4 - v7) * 0.5;
    double v9 = roundf(v8);
    float v11 = (v6 - v10) * 0.5;
    indeterminateView = self->_indeterminateView;
    double v13 = roundf(v11);
    -[UIImageView setFrame:](indeterminateView, "setFrame:", v9, v13);
  }
}

- (void)setBackgroundColor:(id)a3
{
  indeterminateView = self->_indeterminateView;
  id v5 = a3;
  [(UIImageView *)indeterminateView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUICircleProgressIndicator;
  [(SKUICircleProgressIndicator *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImage *)self->_fillImage size];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)tintColorDidChange
{
  v15.receiver = self;
  v15.super_class = (Class)SKUICircleProgressIndicator;
  [(SKUICircleProgressIndicator *)&v15 tintColorDidChange];
  double v3 = [(SKUICircleProgressIndicator *)self tintColor];
  double v4 = [(UIImage *)self->_centerImage _flatImageWithColor:v3];
  centerImage = self->_centerImage;
  self->_centerImage = v4;

  if (self->_borderImage)
  {
    objc_super v6 = [(id)objc_opt_class() _borderImage];
    double v7 = [v6 _flatImageWithColor:v3];
    borderImage = self->_borderImage;
    self->_borderImage = v7;
  }
  double v9 = [(id)objc_opt_class() _fillImage];
  double v10 = [v9 _flatImageWithColor:v3];
  fillImage = self->_fillImage;
  self->_fillImage = v10;

  if (self->_indeterminateView)
  {
    uint64_t v12 = [(id)objc_opt_class() _indeterminateImage];
    double v13 = [(SKUICircleProgressIndicator *)self tintColor];
    uint64_t v14 = [v12 _flatImageWithColor:v13];

    [(UIImageView *)self->_indeterminateView setImage:v14];
    double v9 = (void *)v14;
  }
  [(SKUICircleProgressIndicator *)self setNeedsDisplay];
}

- (void)_setHidesBorderView:(BOOL)a3
{
  if (a3)
  {
    borderImage = self->_borderImage;
    self->_borderImage = 0;
  }
  else
  {
    borderImage = [(id)objc_opt_class() _borderImage];
    id v5 = [(SKUICircleProgressIndicator *)self tintColor];
    objc_super v6 = [borderImage _flatImageWithColor:v5];
    double v7 = self->_borderImage;
    self->_borderImage = v6;
  }

  [(SKUICircleProgressIndicator *)self setNeedsDisplay];
}

+ (id)_borderImage
{
  v2 = (void *)_borderImage_image;
  if (!_borderImage_image)
  {
    double v3 = (void *)MEMORY[0x1E4FB1818];
    double v4 = SKUIBundle();
    uint64_t v5 = [v3 imageNamed:@"DownloadProgressBorderThin" inBundle:v4];
    objc_super v6 = (void *)_borderImage_image;
    _borderImage_image = v5;

    v2 = (void *)_borderImage_image;
  }

  return v2;
}

+ (id)_fillImage
{
  v2 = (void *)_fillImage_image;
  if (!_fillImage_image)
  {
    double v3 = (void *)MEMORY[0x1E4FB1818];
    double v4 = SKUIBundle();
    uint64_t v5 = [v3 imageNamed:@"DownloadProgressBorderThick" inBundle:v4];
    objc_super v6 = (void *)_fillImage_image;
    _fillImage_image = v5;

    v2 = (void *)_fillImage_image;
  }

  return v2;
}

+ (id)_indeterminateImage
{
  v2 = (void *)_indeterminateImage_image;
  if (!_indeterminateImage_image)
  {
    double v3 = (void *)MEMORY[0x1E4FB1818];
    double v4 = SKUIBundle();
    uint64_t v5 = [v3 imageNamed:@"DownloadProgressBorderIndeterminate" inBundle:v4];
    objc_super v6 = (void *)_indeterminateImage_image;
    _indeterminateImage_image = v5;

    v2 = (void *)_indeterminateImage_image;
  }

  return v2;
}

- (void)_animateValueOnDisplayLink:(id)a3
{
  [a3 timestamp];
  float v5 = (v4 - self->_animationStartTime) / (self->_animationEndTime - self->_animationStartTime);
  if (v5 >= 0.99)
  {
    self->_isAnimating = 0;
    self->_animatedValue = self->_progress;
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }
  else
  {
    self->_animatedValue = self->_animationStartValue + (self->_progress - self->_animationStartValue) * v5;
  }

  [(SKUICircleProgressIndicator *)self setNeedsDisplay];
}

- (void)_startIndeterminateAnimation
{
  indeterminateView = self->_indeterminateView;
  CGAffineTransformMakeRotation(&v5, -1.57079633);
  [(UIImageView *)indeterminateView setTransform:&v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke;
  v4[3] = &unk_1E6422020;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:196616 delay:v4 options:0 animations:1.0 completion:0.0];
}

uint64_t __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E6426868;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v2;
    uint64_t result = [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v5 relativeDuration:(double)v2++ * 0.25 animations:0.25];
  }
  while (v2 != 4);
  return result;
}

uint64_t __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 512);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return [v1 setTransform:&v3];
}

- (UIImage)image
{
  return self->_centerImage;
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_centerImageInsets.top;
  double left = self->_centerImageInsets.left;
  double bottom = self->_centerImageInsets.bottom;
  double right = self->_centerImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhighlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indeterminateView, 0);
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);

  objc_storeStrong((id *)&self->_borderImage, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICircleProgressIndicator initWithFrame:]";
}

@end