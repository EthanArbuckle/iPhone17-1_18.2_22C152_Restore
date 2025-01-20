@interface TLKButton
+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4;
+ (id)blurColorForColor:(id)a3;
+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6;
- (BOOL)isIndeterminate;
- (BOOL)isToggled;
- (CAShapeLayer)innerProgressLayer;
- (CAShapeLayer)outerProgressLayer;
- (CGSize)fixedSize;
- (CGSize)intrinsicContentSize;
- (TLKButton)init;
- (TLKImageView)imageView;
- (TLKTapContainerButton)button;
- (UIImage)imageOnImageView;
- (UIImage)overlayImage;
- (UIImage)toggledImage;
- (UIImage)untoggledImage;
- (UIView)backgroundView;
- (UIView)containerView;
- (double)progress;
- (id)_innerProgressLayer;
- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4;
- (id)_outerProgressLayer;
- (id)iconColor;
- (void)_beginIndeterminateAnimation;
- (void)_updateInnerProgressLayerStroke;
- (void)addTarget:(id)a3 forAction:(SEL)a4;
- (void)beginIndeterminateAnimation;
- (void)didMoveToWindow;
- (void)endIndeterminateAnimation;
- (void)hideProgressAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonSelectionState:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setFixedSize:(CGSize)a3;
- (void)setImageView:(id)a3;
- (void)setInnerProgressLayer:(id)a3;
- (void)setOuterProgressLayer:(id)a3;
- (void)setOverlayImage:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)setToggled:(BOOL)a3;
- (void)setToggledImage:(id)a3;
- (void)setUntoggledImage:(id)a3;
- (void)showPlayIndicator:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOuterProgressLayerStroke;
@end

@implementation TLKButton

- (TLKButton)init
{
  v10.receiver = self;
  v10.super_class = (Class)TLKButton;
  v2 = [(TLKButton *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKButton *)v2 setBackgroundView:v3];

    v4 = [(TLKButton *)v2 backgroundView];
    [(TLKButton *)v2 addSubview:v4];

    v5 = objc_opt_new();
    [(TLKButton *)v2 setImageView:v5];

    v6 = [(TLKButton *)v2 imageView];
    [(TLKButton *)v2 addSubview:v6];

    v7 = +[TLKTapContainerButton buttonWithType:0];
    [(TLKButton *)v2 setButton:v7];

    v8 = [(TLKButton *)v2 button];
    [(TLKButton *)v2 addSubview:v8];

    [(TLKButton *)v2 setToggled:0];
  }
  return v2;
}

- (UIImage)imageOnImageView
{
  v2 = [(TLKButton *)self imageView];
  v3 = [v2 imageView];
  v4 = [v3 image];

  return (UIImage *)v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKButton;
  [(TLKButton *)&v9 traitCollectionDidChange:v4];
  v5 = [(TLKButton *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(TLKButton *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKButton;
  [(TLKButton *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)TLKButton;
  id v4 = a3;
  [(UIView *)&v35 tlk_updateForAppearance:v4];
  [(TLKButton *)self setButtonSelectionState:[(TLKButton *)self isToggled]];
  if (self->_overlayImage)
  {
    v5 = [(TLKButton *)self backgroundView];
    [v4 disableAppearanceForView:v5];

    [(TLKButton *)self intrinsicContentSize];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    [(UIImage *)self->_overlayImage size];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    v14 = self->_overlayImage;
    v15 = [(TLKButton *)self imageView];
    [v15 setProminence:1];

    v16 = +[TLKAppearance appearanceWithStyle:2];
    v17 = [(TLKButton *)self imageView];
    [v16 overrideAppearanceForView:v17];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __37__TLKButton_tlk_updateForAppearance___block_invoke;
    v29[3] = &unk_1E5FD3350;
    uint64_t v31 = v7;
    uint64_t v32 = v9;
    uint64_t v33 = v11;
    uint64_t v34 = v13;
    v29[4] = self;
    v30 = v14;
    v18 = v14;
    +[TLKUtilities dispatchAsyncIfNecessary:v29];
  }
  else
  {
    v19 = [(TLKButton *)self imageView];
    +[TLKAppearance disableAppearanceOverrideForView:v19];

    v20 = [v4 quaternaryColor];
    v21 = [(TLKButton *)self backgroundView];
    [v21 setBackgroundColor:v20];

    v22 = [(TLKButton *)self backgroundView];
    [v4 enableAppearanceForView:v22];

    uint64_t v23 = [v4 isDark] ^ 1;
    v24 = [(TLKButton *)self imageView];
    [v24 setProminence:v23];

    [(TLKButton *)self _updateInnerProgressLayerStroke];
    [(TLKButton *)self updateOuterProgressLayerStroke];
    v18 = [(TLKButton *)self button];
    [v4 enableAppearanceForContainer:v18];
  }
  [(TLKButton *)self intrinsicContentSize];
  double v26 = v25 * 0.5;
  v27 = [(TLKButton *)self backgroundView];
  v28 = [v27 layer];
  [v28 setCornerRadius:v26];
}

void __37__TLKButton_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  objc_super v3 = [*(id *)(a1 + 32) overlayImage];
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = (*(double *)(a1 + 64) - v4) * 0.5;
  *(float *)&double v6 = v6;
  double v7 = (*(double *)(a1 + 72) - v5) * 0.5;
  *(float *)&double v7 = v7;
  uint64_t v8 = objc_msgSend(v2, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v3, v4, v5, v6, v7);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__TLKButton_tlk_updateForAppearance___block_invoke_2;
  v12[3] = &unk_1E5FD3240;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v8;
  id v11 = v8;
  +[TLKUtilities dispatchMainIfNecessary:v12];
}

void __37__TLKButton_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) overlayImage];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) backgroundView];
    [v5 setBackgroundColor:v4];
  }
}

- (void)setOverlayImage:(id)a3
{
  p_overlayImage = (UIImage **)a3;
  double v6 = (UIImage *)p_overlayImage;
  if (p_overlayImage)
  {
    p_overlayImage = &self->_overlayImage;
    if (self->_overlayImage != v6)
    {
      double v7 = v6;
      objc_storeStrong((id *)p_overlayImage, a3);
      [(UIView *)self tlk_updateWithCurrentAppearance];
      p_overlayImage = (UIImage **)[(TLKButton *)self setButtonSelectionState:[(TLKButton *)self isToggled]];
      double v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](p_overlayImage, v6);
}

- (void)setToggled:(BOOL)a3
{
}

- (void)setContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKButton *)self button];
  [v5 setContainerView:v4];
}

- (UIView)containerView
{
  v2 = [(TLKButton *)self button];
  objc_super v3 = [v2 containerView];

  return (UIView *)v3;
}

- (CGSize)intrinsicContentSize
{
  [(TLKButton *)self fixedSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v8 = [(TLKButton *)self toggledImage];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    id v13 = [(TLKButton *)self untoggledImage];
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    if (v10 >= v12) {
      double v18 = v10;
    }
    else {
      double v18 = v12;
    }
    if (v15 >= v17) {
      double v19 = v15;
    }
    else {
      double v19 = v17;
    }
    if (v18 < v19) {
      double v18 = v19;
    }
    double v20 = ceil(v18);
    double v7 = v20 + v20;
    double v6 = v20 + v20;
  }
  else
  {
    [(TLKButton *)self fixedSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TLKButton;
  [(TLKButton *)&v21 layoutSubviews];
  [(TLKButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TLKButton *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(TLKButton *)self button];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  id v13 = [(TLKButton *)self imageView];
  [v13 intrinsicContentSize];
  double v15 = v14;
  double v17 = v16;

  [(TLKButton *)self bounds];
  CGFloat v18 = CGRectGetMidX(v22) - v15 * 0.5;
  [(TLKButton *)self bounds];
  CGFloat v19 = CGRectGetMidY(v23) - v17 * 0.5;
  double v20 = [(TLKButton *)self imageView];
  objc_msgSend(v20, "setFrame:", v18, v19, v15, v17);
}

- (void)hideProgressAnimated:(BOOL)a3
{
  double v4 = [(TLKButton *)self _outerProgressLayer];
  [v4 setHidden:1];

  double v5 = [(TLKButton *)self _innerProgressLayer];
  [v5 setHidden:1];

  if (self->_indeterminate)
  {
    [(TLKButton *)self endIndeterminateAnimation];
    [(TLKButton *)self setButtonSelectionState:0];
  }
}

- (void)setButtonSelectionState:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [TLKImage alloc];
  double v6 = &OBJC_IVAR___TLKButton__untoggledImage;
  if (v3) {
    double v6 = &OBJC_IVAR___TLKButton__toggledImage;
  }
  double v8 = [(TLKImage *)v5 initWithImage:*(Class *)((char *)&self->super.super.super.isa + *v6)];
  self->_toggled = v3;
  double v7 = [(TLKButton *)self imageView];
  [v7 setTlkImage:v8];

  [(TLKButton *)self invalidateIntrinsicContentSize];
  [(TLKButton *)self setNeedsLayout];
}

- (void)showPlayIndicator:(BOOL)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  [(TLKButton *)self showPlayIndicator:0];
  double v7 = [(TLKButton *)self _outerProgressLayer];
  [v7 setHidden:1];

  double v8 = [(TLKButton *)self _innerProgressLayer];
  [v8 setHidden:0];

  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate) {
      [(TLKButton *)self endIndeterminateAnimation];
    }
    self->_progress = fmax(fmin(a3, 1.0), 0.0);
    id v12 = [(TLKButton *)self _innerProgressLayer];
    double v9 = [(TLKButton *)self outerProgressLayer];
    [v9 removeAllAnimations];

    if (a4)
    {
      double v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      [v10 setDuration:0.2];
      [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v10 setRemovedOnCompletion:0];
      double v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_progress];
      [v10 setToValue:v11];

      [v12 addAnimation:v10 forKey:0];
    }
    else
    {
      [v12 removeAllAnimations];
      [v12 setStrokeEnd:self->_progress];
    }
  }
}

- (void)beginIndeterminateAnimation
{
  [(TLKButton *)self setProgress:0 animated:0.0];
  outerProgressLayer = self->_outerProgressLayer;
  if (self->_indeterminate)
  {
    double v4 = [(CAShapeLayer *)outerProgressLayer animationKeys];
    uint64_t v5 = [v4 count];

    if (v5) {
      return;
    }
  }
  else
  {
    [(CAShapeLayer *)outerProgressLayer setStrokeStart:0.119999997];
    self->_indeterminate = 1;
  }
  double v6 = [(TLKButton *)self window];

  if (v6)
  {
    [(TLKButton *)self _beginIndeterminateAnimation];
  }
}

- (void)endIndeterminateAnimation
{
  if (self->_indeterminate)
  {
    BOOL v3 = [(TLKButton *)self _outerProgressLayer];
    [v3 setStrokeStart:0.0];
    [v3 removeAllAnimations];
    double v4 = [(TLKButton *)self _outerProgressLayer];
    CGAffineTransformMakeRotation(&v7, -1.57079633);
    [v4 setAffineTransform:&v7];

    self->_indeterminate = 0;
    [(TLKButton *)self updateOuterProgressLayerStroke];
    uint64_t v5 = [(TLKButton *)self _outerProgressLayer];
    [v5 setHidden:1];

    double v6 = [(TLKButton *)self _innerProgressLayer];
    [v6 setHidden:1];
  }
}

- (void)_beginIndeterminateAnimation
{
  BOOL v3 = [(TLKButton *)self _outerProgressLayer];
  [v3 setHidden:0];

  double v4 = [(TLKButton *)self _innerProgressLayer];
  [v4 setHidden:1];

  [(TLKButton *)self updateOuterProgressLayerStroke];
  uint64_t v5 = [(TLKButton *)self _outerProgressLayer];
  [v5 removeAllAnimations];

  double v6 = [(TLKButton *)self _outerProgressLayer];
  CGAffineTransformMakeRotation(&v22, -1.57079633);
  [v6 setAffineTransform:&v22];

  CGAffineTransform v7 = objc_opt_new();
  double v8 = 0.0;
  int v9 = 4;
  do
  {
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeRotation(&m, v8 * 3.14159265 * 0.5);
    CATransform3DMakeAffineTransform(&v21, &m);
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeRotation(&v18, (v8 + -1.0) * 3.14159265 * 0.5);
    CATransform3DMakeAffineTransform(&v19, &v18);
    double v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    CATransform3D v17 = v19;
    double v11 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v17];
    [v10 setFromValue:v11];

    CATransform3D v17 = v21;
    id v12 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v17];
    [v10 setToValue:v12];

    [v10 setDuration:0.25];
    [v10 setBeginTime:v8 * 0.25];
    [v7 addObject:v10];

    double v8 = v8 + 1.0;
    --v9;
  }
  while (v9);
  id v13 = [MEMORY[0x1E4F39B38] animation];
  [v13 setDuration:1.0];
  LODWORD(v14) = 2139095039;
  [v13 setRepeatCount:v14];
  double v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v13 setTimingFunction:v15];

  [v13 setAnimations:v7];
  double v16 = [(TLKButton *)self outerProgressLayer];
  [v16 addAnimation:v13 forKey:0];
}

- (id)_outerProgressLayer
{
  outerProgressLayer = self->_outerProgressLayer;
  if (!outerProgressLayer)
  {
    [(TLKButton *)self intrinsicContentSize];
    double v6 = -[TLKButton _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 1.5);
    CGAffineTransform v7 = self->_outerProgressLayer;
    self->_outerProgressLayer = v6;

    double v8 = self->_outerProgressLayer;
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setBackgroundColor:](v8, "setBackgroundColor:", [v9 CGColor]);

    double v10 = self->_outerProgressLayer;
    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v10, "setFillColor:", [v11 CGColor]);

    innerProgressLayer = self->_innerProgressLayer;
    id v13 = [(TLKButton *)self button];
    double v14 = [v13 layer];
    double v15 = v14;
    double v16 = self->_outerProgressLayer;
    if (innerProgressLayer) {
      [v14 insertSublayer:v16 below:self->_innerProgressLayer];
    }
    else {
      [v14 addSublayer:v16];
    }

    [(TLKButton *)self updateOuterProgressLayerStroke];
    outerProgressLayer = self->_outerProgressLayer;
  }
  return outerProgressLayer;
}

- (id)_innerProgressLayer
{
  innerProgressLayer = self->_innerProgressLayer;
  if (!innerProgressLayer)
  {
    [(TLKButton *)self intrinsicContentSize];
    double v6 = -[TLKButton _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 2.0);
    CGAffineTransform v7 = self->_innerProgressLayer;
    self->_innerProgressLayer = v6;

    double v8 = self->_innerProgressLayer;
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setBackgroundColor:](v8, "setBackgroundColor:", [v9 CGColor]);

    double v10 = (void *)MEMORY[0x1E4FB1618];
    id v11 = self->_innerProgressLayer;
    id v12 = [v10 clearColor];
    -[CAShapeLayer setFillColor:](v11, "setFillColor:", [v12 CGColor]);

    [(CAShapeLayer *)v11 setStrokeEnd:0.0];
    id v13 = [(TLKButton *)self button];
    double v14 = [v13 layer];
    [v14 addSublayer:self->_innerProgressLayer];

    [(TLKButton *)self _updateInnerProgressLayerStroke];
    innerProgressLayer = self->_innerProgressLayer;
  }
  return innerProgressLayer;
}

- (void)updateOuterProgressLayerStroke
{
  BOOL v3 = [(TLKButton *)self iconColor];
  outerProgressLayer = self->_outerProgressLayer;
  id v9 = v3;
  -[CAShapeLayer setStrokeColor:](outerProgressLayer, "setStrokeColor:", [v9 CGColor]);
  double v5 = self->_outerProgressLayer;
  double v6 = [(TLKButton *)self backgroundView];
  CGAffineTransform v7 = [v6 layer];
  double v8 = [v7 compositingFilter];
  [(CAShapeLayer *)v5 setCompositingFilter:v8];
}

- (void)_updateInnerProgressLayerStroke
{
  BOOL v3 = [(TLKButton *)self iconColor];
  innerProgressLayer = self->_innerProgressLayer;
  id v9 = v3;
  -[CAShapeLayer setStrokeColor:](innerProgressLayer, "setStrokeColor:", [v9 CGColor]);
  double v5 = self->_innerProgressLayer;
  double v6 = [(TLKButton *)self backgroundView];
  CGAffineTransform v7 = [v6 layer];
  double v8 = [v7 compositingFilter];
  [(CAShapeLayer *)v5 setCompositingFilter:v8];
}

- (id)iconColor
{
  v2 = +[TLKAppearance bestAppearanceForView:self];
  BOOL v3 = [v2 colorForProminence:1];

  return v3;
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGRect v14 = CGRectInset(a3, a4 * 0.5, a4 * 0.5);
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  id v9 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  CGAffineTransformMakeRotation(&v13, -1.57079633);
  [v9 setAffineTransform:&v13];
  id v10 = v9;
  [v10 setLineWidth:a4];
  [v10 bounds];
  id v11 = CGPathCreateWithEllipseInRect(v15, 0);
  [v10 setPath:v11];
  [v10 setLineCap:@"round"];
  CGPathRelease(v11);

  return v10;
}

- (void)addTarget:(id)a3 forAction:(SEL)a4
{
  id v6 = a3;
  id v7 = [(TLKButton *)self button];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6
{
  double width = a4.width;
  id v10 = a3;
  id v11 = (CGImage *)[v10 CGImage];
  [v10 scale];
  double v13 = v12;
  [v10 size];
  double v15 = v13 * v14;
  [v10 size];
  double v17 = v16;

  double v18 = width * v13;
  v26.origin.double x = v15 - a5 * v13 - v18;
  v26.origin.double y = v13 * v17 - a6 * v13 - v18;
  v26.size.double width = v18;
  v26.size.double height = v18;
  CGRect v27 = CGRectIntegral(v26);
  CATransform3D v19 = CGImageCreateWithImageInRect(v11, v27);
  long long v24 = 0u;
  double v20 = objc_opt_class();
  if (v20) {
    objc_msgSend(v20, "_calculateStatistics:withSize:", v19, v18, v18);
  }
  else {
    long long v24 = 0u;
  }
  CGImageRelease(v19);
  CATransform3D v21 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", v24, 0.0, 0.0);
  CGAffineTransform v22 = [a1 blurColorForColor:v21];

  return v22;
}

+ (id)blurColorForColor:(id)a3
{
  id v3 = a3;
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  double v4 = v3;
  if ([v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8])
  {
    double v10 = v10 * 1.8;
    double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", v11);
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.980392157 alpha:0.78];
    double v4 = [v5 _colorBlendedWithColor:v6 compositingFilter:*MEMORY[0x1E4F3A320]];
  }
  return v4;
}

+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4
{
  double height = a5.height;
  double width = a5.width;
  size_t v9 = (unint64_t)a5.width;
  size_t v10 = (unint64_t)a5.height;
  size_t v11 = 4 * (unint64_t)a5.width;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  double v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0xB4BEC89DuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v14 = CGBitmapContextCreate(v12, v9, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v57.size.double width = (double)(unint64_t)width;
  v57.size.double height = (double)(unint64_t)height;
  v57.origin.double x = 0.0;
  v57.origin.double y = 0.0;
  CGContextDrawImage(v14, v57, a4);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  char v24 = 1;
  do
  {
    char v25 = v24;
    size_t v26 = qword_1B08D3A40[v15];
    if (v26 < v10)
    {
      uint64_t v27 = (uint64_t)v12 + (v11 + 4) * v26 + 3;
      size_t v28 = v26;
      do
      {
        v29 = (unsigned __int8 *)v27;
        for (size_t i = v26; i < v9; v29 += 4 * v26)
        {
          uint64_t v31 = *(v29 - 3);
          v23 += v31;
          uint64_t v32 = *(v29 - 2);
          v22 += v32;
          uint64_t v33 = *(v29 - 1);
          v21 += v33;
          v20 += *v29;
          v19 += (v31 * v31);
          v18 += (v32 * v32);
          v17 += (v33 * v33);
          ++v16;
          i += v26;
        }
        v28 += v26;
        v27 += v11 * v26;
      }
      while (v28 < v10);
    }
    char v24 = 0;
    uint64_t v15 = 1;
  }
  while ((v25 & 1) != 0);
  if (v16 <= 1) {
    unint64_t v16 = 1;
  }
  double v34 = 1.0 / (double)v16;
  unint64_t v35 = (unint64_t)(v34 * (double)v23);
  unint64_t v36 = (unint64_t)(v34 * (double)v22);
  unint64_t v37 = (unint64_t)(v34 * (double)v21);
  float v38 = fmax(-((double)(v35 * v35) - (double)v19 * v34), 0.0);
  double v39 = sqrtf(v38);
  float v40 = fmax(-((double)(v36 * v36) - (double)v18 * v34), 0.0);
  double v41 = sqrtf(v40);
  float v42 = fmax(-((double)(v37 * v37) - (double)v17 * v34), 0.0);
  double v43 = sqrtf(v42);
  double v55 = 0.0;
  double v56 = 0.0;
  double v54 = 0.0;
  double v51 = 0.0;
  double v52 = 0.0;
  double v44 = (double)v35 * 0.00392156863;
  double v45 = (double)v36 * 0.00392156863;
  double v46 = (double)v37 * 0.00392156863;
  __SK_RGBtoHSV(&v56, &v55, &v54, v44, v45, v46);
  __SK_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  free(v12);
  retstr->var0 = v44;
  retstr->var1 = v45;
  retstr->var2 = v46;
  retstr->var3 = v56;
  double v48 = v54;
  retstr->var4 = v55;
  retstr->var5 = v48;
  double v49 = v52;
  double v50 = v51;
  retstr->var6 = (double)(unint64_t)(v34 * (double)v20) * 0.00392156863;
  retstr->var7 = v50;
  retstr->var8 = v49;
  return result;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (UIImage)untoggledImage
{
  return self->_untoggledImage;
}

- (void)setUntoggledImage:(id)a3
{
}

- (UIImage)toggledImage
{
  return self->_toggledImage;
}

- (void)setToggledImage:(id)a3
{
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (CGSize)fixedSize
{
  double width = self->_fixedSize.width;
  double height = self->_fixedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFixedSize:(CGSize)a3
{
  self->_fixedSize = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (TLKTapContainerButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (CAShapeLayer)outerProgressLayer
{
  return self->_outerProgressLayer;
}

- (void)setOuterProgressLayer:(id)a3
{
}

- (CAShapeLayer)innerProgressLayer
{
  return self->_innerProgressLayer;
}

- (void)setInnerProgressLayer:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_toggledImage, 0);
  objc_storeStrong((id *)&self->_untoggledImage, 0);
}

@end