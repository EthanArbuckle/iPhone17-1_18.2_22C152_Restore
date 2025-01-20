@interface _UICircleProgressIndicator
+ (id)_borderImage;
+ (id)_fillImage;
+ (id)_indeterminateImage;
- (BOOL)isHighlighted;
- (BOOL)isIndeterminate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)imageInsets;
- (UIImage)borderImage;
- (UIImage)fillImage;
- (UIImage)image;
- (_UICircleProgressIndicator)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)_animateValueOnDisplayLink:(id)a3;
- (void)_setHidesBorderView:(BOOL)a3;
- (void)_startIndeterminateAnimation;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBorderImage:(id)a3;
- (void)setFillImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation _UICircleProgressIndicator

- (_UICircleProgressIndicator)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UICircleProgressIndicator;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 tintColor];
    v6 = [(id)objc_opt_class() _borderImage];
    uint64_t v7 = [v6 imageWithTintColor:v5];
    borderImage = v4->_borderImage;
    v4->_borderImage = (UIImage *)v7;

    v9 = [(id)objc_opt_class() _fillImage];

    uint64_t v10 = [v9 imageWithTintColor:v5];
    fillImage = v4->_fillImage;
    v4->_fillImage = (UIImage *)v10;

    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setClearsContextBeforeDrawing:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(UIView *)self->_indeterminateView layer];
  [v3 removeAllAnimations];

  v4.receiver = self;
  v4.super_class = (Class)_UICircleProgressIndicator;
  [(UIView *)&v4 dealloc];
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
      [(UIView *)self setBackgroundColor:self->_unhighlightedBackgroundColor];
      unhighlightedBackgroundColor = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = 0;
    }
    else
    {
      v6 = [(UIView *)self backgroundColor];
      uint64_t v7 = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = v6;

      unhighlightedBackgroundColor = +[UIColor clearColor];
      [(UIView *)self setBackgroundColor:unhighlightedBackgroundColor];
    }

    self->_highlighted = a3;
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setImage:(id)a3
{
  if (self->_centerImage != a3)
  {
    id v4 = a3;
    v5 = [(UIView *)self tintColor];
    v6 = [v4 imageWithTintColor:v5];

    [(_UICircleProgressIndicator *)self setImage:v6];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (self->_centerImageInsets.left != a3.left
    || self->_centerImageInsets.top != a3.top
    || self->_centerImageInsets.right != a3.right
    || self->_centerImageInsets.bottom != a3.bottom)
  {
    self->_centerImageInsets = a3;
    [(UIView *)self setNeedsDisplay];
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
      v6 = [(UIView *)self tintColor];
      id v11 = [v5 imageWithTintColor:v6];

      uint64_t v7 = [[UIImageView alloc] initWithImage:v11];
      v8 = self->_indeterminateView;
      self->_indeterminateView = v7;

      [(UIView *)self addSubview:self->_indeterminateView];
      [(UIView *)self setNeedsDisplay];
      [(_UICircleProgressIndicator *)self _startIndeterminateAnimation];
    }
  }
  else if (indeterminateView)
  {
    v9 = [(UIView *)indeterminateView layer];
    [v9 removeAllAnimations];

    [(UIView *)self->_indeterminateView removeFromSuperview];
    uint64_t v10 = self->_indeterminateView;
    self->_indeterminateView = 0;

    [(UIView *)self setNeedsDisplay];
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
    v8 = +[UIScreen mainScreen];
    v9 = [v8 displayLinkWithTarget:self selector:sel__animateValueOnDisplayLink_];
    displayLink = self->_displayLink;
    self->_displayLink = v9;

    id v11 = self->_displayLink;
    v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    self->_isAnimating = 0;
    [(CADisplayLink *)self->_displayLink invalidate];
    v12 = self->_displayLink;
    self->_displayLink = 0;
  }

LABEL_10:
  self->_double progress = a3;
  [(UIView *)self setNeedsDisplay];
}

- (void)didMoveToWindow
{
  v3 = [(UIView *)self window];
  if (v3)
  {
    indeterminateView = self->_indeterminateView;

    if (indeterminateView)
    {
      v5 = [(UIView *)self->_indeterminateView layer];
      [v5 removeAllAnimations];

      [(_UICircleProgressIndicator *)self _startIndeterminateAnimation];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  if (!self->_indeterminateView)
  {
    id v22 = +[UIBezierPath bezierPath];
    [(UIView *)self bounds];
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
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    double MidX = CGRectGetMidX(v24);
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    double MidY = CGRectGetMidY(v25);
    float v18 = v11 * 0.5;
    double v19 = ceilf(v18);
    uint64_t v20 = 10;
    if (!self->_isAnimating) {
      uint64_t v20 = 7;
    }
    double v21 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____UICircleProgressIndicator__borderImage[v20]);
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
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(UIView *)self->_indeterminateView frame];
    float v8 = (v4 - v7) * 0.5;
    double v9 = floorf(v8);
    float v11 = (v6 - v10) * 0.5;
    indeterminateView = self->_indeterminateView;
    double v13 = floorf(v11);
    -[UIImageView setFrame:](indeterminateView, "setFrame:", v9, v13);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImage *)self->_fillImage size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)_UICircleProgressIndicator;
  [(UIView *)&v12 tintColorDidChange];
  double v3 = [(UIView *)self tintColor];
  double v4 = [(UIImage *)self->_centerImage imageWithTintColor:v3];
  [(_UICircleProgressIndicator *)self setImage:v4];

  if (self->_borderImage)
  {
    double v5 = [(id)objc_opt_class() _borderImage];
    double v6 = [v5 imageWithTintColor:v3];
    [(_UICircleProgressIndicator *)self setBorderImage:v6];
  }
  double v7 = [(id)objc_opt_class() _fillImage];
  float v8 = [v7 imageWithTintColor:v3];
  [(_UICircleProgressIndicator *)self setFillImage:v8];

  if (self->_indeterminateView)
  {
    double v9 = [(id)objc_opt_class() _indeterminateImage];
    double v10 = [(UIView *)self tintColor];
    uint64_t v11 = [v9 imageWithTintColor:v10];

    [(UIImageView *)self->_indeterminateView setImage:v11];
    double v7 = (void *)v11;
  }
  [(UIView *)self setNeedsDisplay];
}

- (void)_setHidesBorderView:(BOOL)a3
{
  if (a3)
  {
    [(_UICircleProgressIndicator *)self setBorderImage:0];
  }
  else
  {
    double v4 = [(id)objc_opt_class() _borderImage];
    double v5 = [(UIView *)self tintColor];
    double v6 = [v4 imageWithTintColor:v5];
    [(_UICircleProgressIndicator *)self setBorderImage:v6];
  }
  [(UIView *)self setNeedsDisplay];
}

+ (id)_borderImage
{
  v2 = (void *)_borderImage_image;
  if (!_borderImage_image)
  {
    uint64_t v3 = _UIImageWithName(@"UIDownloadProgressBorderThin");
    double v4 = (void *)_borderImage_image;
    _borderImage_image = v3;

    v2 = (void *)_borderImage_image;
  }
  return v2;
}

+ (id)_fillImage
{
  v2 = (void *)_fillImage_image;
  if (!_fillImage_image)
  {
    uint64_t v3 = _UIImageWithName(@"UIDownloadProgressBorderThick");
    double v4 = (void *)_fillImage_image;
    _fillImage_image = v3;

    v2 = (void *)_fillImage_image;
  }
  return v2;
}

+ (id)_indeterminateImage
{
  v2 = (void *)_indeterminateImage_image;
  if (!_indeterminateImage_image)
  {
    uint64_t v3 = _UIImageWithName(@"UIDownloadProgressBorderIndeterminate");
    double v4 = (void *)_indeterminateImage_image;
    _indeterminateImage_image = v3;

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
  [(UIView *)self setNeedsDisplay];
}

- (void)_startIndeterminateAnimation
{
  indeterminateView = self->_indeterminateView;
  CGAffineTransformMakeRotation(&v5, -1.57079633);
  [(UIView *)indeterminateView setTransform:&v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UICircleProgressIndicator__startIndeterminateAnimation__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView animateKeyframesWithDuration:196616 delay:v4 options:0 animations:1.0 completion:0.0];
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

- (UIImage)borderImage
{
  return self->_borderImage;
}

- (void)setBorderImage:(id)a3
{
}

- (UIImage)fillImage
{
  return self->_fillImage;
}

- (void)setFillImage:(id)a3
{
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

@end