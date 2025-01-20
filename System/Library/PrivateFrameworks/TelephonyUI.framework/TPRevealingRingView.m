@interface TPRevealingRingView
+ (id)classIdentifier;
- (BOOL)_isSquare:(CGSize)a3;
- (BOOL)_shouldDrawAsCircle:(CGSize)a3 cornerRadius:(double)a4;
- (CGSize)ringSize;
- (TPRevealingRingView)initWithFrame:(CGRect)a3;
- (TPRevealingRingView)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4;
- (UIColor)colorInsideRing;
- (UIColor)colorOutsideRing;
- (UIEdgeInsets)paddingOutsideRing;
- (double)alphaInsideRing;
- (double)alphaOutsideRing;
- (double)cornerRadius;
- (double)defaultRingStrokeWidth;
- (double)revealAnimationDuration;
- (double)unrevealAnimationDuration;
- (id)description;
- (void)_animateForReveal:(BOOL)a3 withDuration:(float)a4 delay:(double)a5;
- (void)_calculateOuter:(CGRect *)a3 inner:(CGRect *)a4 newXOffset:(double *)a5 newYOffset:(double *)a6 withScale:(double)a7;
- (void)_computeInnerViewDrawingPropertiesWithScale:(double)a3;
- (void)_computeOuterViewDrawingPropertiesWithScale:(double)a3;
- (void)_evaluateCircularness;
- (void)layoutSubviews;
- (void)setAlphaInsideRing:(double)a3;
- (void)setColorInsideRing:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDefaultRingStrokeWidth:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPaddingOutsideRing:(UIEdgeInsets)a3;
- (void)setRevealAnimationDuration:(double)a3;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5;
- (void)setUnrevealAnimationDuration:(double)a3;
@end

@implementation TPRevealingRingView

+ (id)classIdentifier
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v5 = [v4 bundleIdentifier];
  v6 = NSStringFromClass((Class)a1);
  v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];

  return v7;
}

- (TPRevealingRingView)initWithFrame:(CGRect)a3
{
  return -[TPRevealingRingView initWithFrame:paddingOutsideRing:](self, "initWithFrame:paddingOutsideRing:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

- (TPRevealingRingView)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  v23.receiver = self;
  v23.super_class = (Class)TPRevealingRingView;
  v8 = -[TPRevealingRingView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    [(TPRevealingRingView *)v8 setOpaque:0];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(TPRevealingRingView *)v9 setBackgroundColor:v10];

    v11 = [(TPRevealingRingView *)v9 layer];
    [v11 setAllowsGroupBlending:0];

    v12 = [(TPRevealingRingView *)v9 layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = objc_alloc_init(_TPTemplatedColoredImageView);
    outerView = v9->_outerView;
    v9->_outerView = v13;

    v15 = v9->_outerView;
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(_TPTemplatedColoredImageView *)v15 setBackgroundColor:v16];

    [(_TPTemplatedColoredImageView *)v9->_outerView setAlpha:1.0];
    [(TPRevealingRingView *)v9 addSubview:v9->_outerView];
    v17 = objc_alloc_init(_TPTemplatedColoredImageView);
    innerView = v9->_innerView;
    v9->_innerView = v17;

    v19 = v9->_innerView;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(_TPTemplatedColoredImageView *)v19 setBackgroundColor:v20];

    [(_TPTemplatedColoredImageView *)v9->_innerView setAlpha:0.0];
    [(TPRevealingRingView *)v9 addSubview:v9->_innerView];
    [(TPRevealingRingView *)v9 setDefaultRingStrokeWidth:TPPixelCGCeiling(1.5)];
    [(TPRevealingRingView *)v9 setRevealAnimationDuration:0.00100000005];
    [(TPRevealingRingView *)v9 setUnrevealAnimationDuration:0.392500013];
    -[TPRevealingRingView setPaddingOutsideRing:](v9, "setPaddingOutsideRing:", top, left, bottom, right);
    v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(TPRevealingRingView *)v9 setColorInsideRing:v21];

    [(TPRevealingRingView *)v9 setCornerRadius:0.0];
    v9->_alphaInsideRing = 1.0;
    v9->_alphaOutsideRing = 1.0;
  }
  return v9;
}

- (CGSize)ringSize
{
  [(TPRevealingRingView *)self bounds];
  double v4 = v3 - (self->_paddingOutsideRing.left + self->_paddingOutsideRing.right);
  double v6 = v5 - (self->_paddingOutsideRing.top + self->_paddingOutsideRing.bottom);
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setPaddingOutsideRing:(UIEdgeInsets)a3
{
  if (self->_paddingOutsideRing.left != a3.left
    || self->_paddingOutsideRing.top != a3.top
    || self->_paddingOutsideRing.right != a3.right
    || self->_paddingOutsideRing.bottom != a3.bottom)
  {
    self->_paddingOutsideRing = a3;
    [(TPRevealingRingView *)self setNeedsLayout];
  }
}

- (void)setColorInsideRing:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_colorInsideRing != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_colorInsideRing, a3);
    [(_TPTemplatedColoredImageView *)self->_innerView setTemplateImageColor:self->_colorInsideRing];
    double v5 = v6;
  }
}

- (void)setAlphaInsideRing:(double)a3
{
  self->_alphaInsideRing = a3;
  if (!self->_revealed) {
    [(_TPTemplatedColoredImageView *)self->_innerView setAlpha:0.0];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(TPRevealingRingView *)self _evaluateCircularness];
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPRevealingRingView;
  -[TPRevealingRingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TPRevealingRingView *)self _evaluateCircularness];
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    double v6 = &OBJC_IVAR___TPRevealingRingView__unrevealAnimationDuration;
    if (a3) {
      double v6 = &OBJC_IVAR___TPRevealingRingView__revealAnimationDuration;
    }
    double v7 = *(double *)((char *)&self->super.super.super.isa + *v6);
    *(float *)&double v7 = v7;
    -[TPRevealingRingView _animateForReveal:withDuration:delay:](self, "_animateForReveal:withDuration:delay:", v7, a5);
  }
}

- (id)description
{
  double v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  colorOutsideRing = self->_colorOutsideRing;
  colorInsideRing = self->_colorInsideRing;
  v8 = NSStringFromUIEdgeInsets(self->_paddingOutsideRing);
  v9 = [v3 stringWithFormat:@"<%@:%p - colorOutsideRing: %@, colorInsideRing: %@, paddingOutsideRing: %@, strokeWidth: %.2f, _cornerRadius: %.2f, circularRing: %d, _revealed: %d>", v5, self, colorOutsideRing, colorInsideRing, v8, *(void *)&self->_defaultRingStrokeWidth, *(void *)&self->_cornerRadius, self->_isCircularRing, self->_revealed];

  return v9;
}

- (void)layoutSubviews
{
  [(TPRevealingRingView *)self bounds];
  double top = self->_paddingOutsideRing.top;
  double left = self->_paddingOutsideRing.left;
  v22.origin.CGFloat x = v9 + left;
  CGFloat x = v22.origin.x;
  v22.origin.CGFloat y = v10 + top;
  CGFloat y = v22.origin.y;
  v22.size.CGFloat width = v11 - (left + self->_paddingOutsideRing.right);
  CGFloat width = v22.size.width;
  v22.size.CGFloat height = v12 - (top + self->_paddingOutsideRing.bottom);
  CGFloat height = v22.size.height;
  CGRect v23 = CGRectInset(v22, self->_defaultRingStrokeWidth, self->_defaultRingStrokeWidth);
  double v13 = v23.origin.x;
  double v14 = v23.origin.y;
  double v15 = v23.size.width;
  double v16 = v23.size.height;
  -[_TPTemplatedColoredImageView setFrame:](self->_outerView, "setFrame:", x, y, width, height);
  [(TPRevealingRingView *)self _computeOuterViewDrawingPropertiesWithScale:1.0];
  outerView = self->_outerView;
  v18 = __imageForRoundedRectProperties((uint64_t)&self->_outerViewDrawingProperties);
  [(_TPTemplatedColoredImageView *)outerView setImage:v18];

  -[_TPTemplatedColoredImageView setFrame:](self->_innerView, "setFrame:", v13, v14, v15, v16);
  [(TPRevealingRingView *)self _computeInnerViewDrawingPropertiesWithScale:1.0];
  innerView = self->_innerView;
  v20 = __imageForRoundedRectProperties((uint64_t)&self->_innerViewDrawingProperties);
  [(_TPTemplatedColoredImageView *)innerView setImage:v20];

  v21.receiver = self;
  v21.super_class = (Class)TPRevealingRingView;
  [(TPRevealingRingView *)&v21 layoutSubviews];
}

- (void)_calculateOuter:(CGRect *)a3 inner:(CGRect *)a4 newXOffset:(double *)a5 newYOffset:(double *)a6 withScale:(double)a7
{
  [(TPRevealingRingView *)self bounds];
  double top = self->_paddingOutsideRing.top;
  double left = self->_paddingOutsideRing.left;
  double v16 = v15 + left;
  double v18 = v17 + top;
  double v20 = v19 - (left + self->_paddingOutsideRing.right);
  double v22 = v21 - (top + self->_paddingOutsideRing.bottom);
  v23.origin.CGFloat x = v15 + left;
  v23.origin.CGFloat y = v17 + top;
  v23.size.CGFloat width = v20;
  v23.size.CGFloat height = v22;
  CGRect v24 = CGRectInset(v23, self->_defaultRingStrokeWidth, self->_defaultRingStrokeWidth);
  if (a3)
  {
    a3->origin.CGFloat x = v16;
    a3->origin.CGFloat y = v18;
    a3->size.CGFloat width = v20;
    a3->size.CGFloat height = v22;
  }
  if (a4) {
    *a4 = v24;
  }
  if (a5) {
    *a5 = v24.size.width * 0.5 - v24.size.width * 0.5 * a7;
  }
  if (a6) {
    *a6 = v24.size.height * 0.5 - v24.size.height * 0.5 * a7;
  }
}

- (void)_computeInnerViewDrawingPropertiesWithScale:(double)a3
{
  memset(v15, 0, sizeof(v15));
  long long v13 = 0u;
  float64x2_t v14 = 0u;
  double v11 = 0.0;
  double v12 = 0.0;
  -[TPRevealingRingView _calculateOuter:inner:newXOffset:newYOffset:withScale:](self, "_calculateOuter:inner:newXOffset:newYOffset:withScale:", v15, &v13, &v12, &v11);
  CGFloat v5 = v11;
  CGFloat v4 = v12;
  double v6 = (self->_cornerRadius - self->_defaultRingStrokeWidth) * a3;
  CGSize v10 = (CGSize)vmulq_n_f64(v14, a3);
  [(_TPTemplatedColoredImageView *)self->_innerView size];
  self->_innerViewDrawingProperties.size.CGFloat width = v7;
  self->_innerViewDrawingProperties.size.CGFloat height = v8;
  self->_innerViewDrawingProperties.outerPath.rect.origin.CGFloat x = v4;
  self->_innerViewDrawingProperties.outerPath.rect.origin.CGFloat y = v5;
  self->_innerViewDrawingProperties.outerPath.rect.size = v10;
  self->_innerViewDrawingProperties.outerPath.cornerRadius = v6;
}

- (void)_computeOuterViewDrawingPropertiesWithScale:(double)a3
{
  memset(v20, 0, sizeof(v20));
  long long v18 = 0u;
  float64x2_t v19 = 0u;
  double v16 = 0.0;
  double v17 = 0.0;
  -[TPRevealingRingView _calculateOuter:inner:newXOffset:newYOffset:withScale:](self, "_calculateOuter:inner:newXOffset:newYOffset:withScale:", v20, &v18, &v17, &v16);
  double v4 = (self->_cornerRadius - self->_defaultRingStrokeWidth) * a3;
  [(_TPTemplatedColoredImageView *)self->_outerView bounds];
  double v6 = v5;
  [(_TPTemplatedColoredImageView *)self->_outerView bounds];
  double v8 = v7;
  double defaultRingStrokeWidth = self->_defaultRingStrokeWidth;
  CGFloat v10 = v6 * 0.5 - (v6 * 0.5 - defaultRingStrokeWidth) * a3;
  CGFloat v11 = v8 * 0.5 - (v8 * 0.5 - defaultRingStrokeWidth) * a3;
  double v16 = v11;
  double v17 = v10;
  CGSize v15 = (CGSize)vmulq_n_f64(v19, a3);
  [(_TPTemplatedColoredImageView *)self->_outerView size];
  self->_outerViewDrawingProperties.size.CGFloat width = v12;
  self->_outerViewDrawingProperties.size.CGFloat height = v13;
  self->_outerViewDrawingProperties.outerPath.rect.origin.CGFloat x = 0.0;
  self->_outerViewDrawingProperties.outerPath.rect.origin.CGFloat y = 0.0;
  self->_outerViewDrawingProperties.outerPath.rect.size.CGFloat width = v6;
  self->_outerViewDrawingProperties.outerPath.rect.size.CGFloat height = v8;
  self->_outerViewDrawingProperties.outerPath.cornerRadius = self->_cornerRadius;
  self->_outerViewDrawingProperties.innerPath.rect.origin.CGFloat x = v10;
  self->_outerViewDrawingProperties.innerPath.rect.origin.CGFloat y = v11;
  self->_outerViewDrawingProperties.innerPath.rect.size = v15;
  self->_outerViewDrawingProperties.innerPath.cornerRadius = v4;
}

- (void)_evaluateCircularness
{
  self->_isCircularRing = -[TPRevealingRingView _shouldDrawAsCircle:cornerRadius:](self, "_shouldDrawAsCircle:cornerRadius:");
}

- (BOOL)_isSquare:(CGSize)a3
{
  return vabdd_f64(a3.height, a3.width) < 0.1;
}

- (BOOL)_shouldDrawAsCircle:(CGSize)a3 cornerRadius:(double)a4
{
  double width = a3.width;
  BOOL v6 = -[TPRevealingRingView _isSquare:](self, "_isSquare:", a3.width, a3.height);
  if (v6) {
    LOBYTE(v6) = vabdd_f64(width * 0.5, fabs(a4)) < 0.1;
  }
  return v6;
}

- (void)_animateForReveal:(BOOL)a3 withDuration:(float)a4 delay:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__TPRevealingRingView__animateForReveal_withDuration_delay___block_invoke;
  v5[3] = &unk_1E647BF70;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:a4];
}

uint64_t __60__TPRevealingRingView__animateForReveal_withDuration_delay___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 624) setAlpha:v1];
}

- (double)alphaInsideRing
{
  return self->_alphaInsideRing;
}

- (double)alphaOutsideRing
{
  return self->_alphaOutsideRing;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIEdgeInsets)paddingOutsideRing
{
  double top = self->_paddingOutsideRing.top;
  double left = self->_paddingOutsideRing.left;
  double bottom = self->_paddingOutsideRing.bottom;
  double right = self->_paddingOutsideRing.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)defaultRingStrokeWidth
{
  return self->_defaultRingStrokeWidth;
}

- (void)setDefaultRingStrokeWidth:(double)a3
{
  self->_double defaultRingStrokeWidth = a3;
}

- (double)revealAnimationDuration
{
  return self->_revealAnimationDuration;
}

- (void)setRevealAnimationDuration:(double)a3
{
  self->_revealAnimationDuration = a3;
}

- (double)unrevealAnimationDuration
{
  return self->_unrevealAnimationDuration;
}

- (void)setUnrevealAnimationDuration:(double)a3
{
  self->_unrevealAnimationDuration = a3;
}

- (UIColor)colorOutsideRing
{
  return self->_colorOutsideRing;
}

- (UIColor)colorInsideRing
{
  return self->_colorInsidegamRing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorInsidegamRing, 0);
  objc_storeStrong((id *)&self->_colorInsideRing, 0);
  objc_storeStrong((id *)&self->_colorOutsideRing, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
  objc_storeStrong((id *)&self->_outerView, 0);
}

@end