@interface PUIStyleVariationSlider
+ (CGColor)defaultTrackBorderColor;
+ (double)defaultHeight;
+ (double)defaultTrackHeight;
+ (double)defaultTrackInnerShadowBorderWidth;
+ (double)defaultTrackMultiplier;
- ($B5991C4CE9FA8B35561AD36CC4E88915)_metricsForBounds:(SEL)a3;
- (BOOL)isPressed;
- (CALayer)thumbSoftShadowLayer;
- (CAShapeLayer)thumbBorderLayer;
- (CAShapeLayer)thumbClippingLayer;
- (NSString)contextIdentifier;
- (PUIStyleUICoordinator)styleCoordinator;
- (PUIStyleVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4;
- (UIGestureRecognizer)sliderGestureRecognizer;
- (UIPanGestureRecognizer)panGesture;
- (UIView)thumbContainerView;
- (UIView)thumbContentView;
- (UIView)trackView;
- (double)startPanOffset;
- (double)value;
- (double)variation;
- (void)_applyMetrics:(id *)a3;
- (void)_layoutDirectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_setSliderValue:(double)a3 layout:(BOOL)a4 fireActions:(BOOL)a5;
- (void)_setupViewsIfNeeded;
- (void)_updateThumbContentViewAnimated:(BOOL)a3;
- (void)_updateTrackAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setContextIdentifier:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setStartPanOffset:(double)a3;
- (void)setStyleCoordinator:(id)a3;
- (void)setStyleCoordinator:(id)a3 animated:(BOOL)a4;
- (void)setThumbBorderLayer:(id)a3;
- (void)setThumbClippingLayer:(id)a3;
- (void)setThumbContainerView:(id)a3;
- (void)setThumbContentView:(id)a3;
- (void)setThumbSoftShadowLayer:(id)a3;
- (void)setTrackView:(id)a3;
- (void)setValue:(double)a3;
- (void)setVariation:(double)a3;
- (void)thumbViewDidPan:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PUIStyleVariationSlider

+ (double)defaultHeight
{
  return 34.0;
}

+ (double)defaultTrackMultiplier
{
  return 0.444444444;
}

+ (double)defaultTrackInnerShadowBorderWidth
{
  return 2.0;
}

+ (double)defaultTrackHeight
{
  [a1 defaultHeight];
  double v3 = v2;
  [(id)objc_opt_class() defaultTrackMultiplier];
  return v3 * v4;
}

+ (CGColor)defaultTrackBorderColor
{
  id v2 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.1];
  double v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (PUIStyleVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUIStyleVariationSlider;
  v8 = -[PUIStyleVariationSlider initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contextIdentifier, a4);
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C838]) initWithTarget:v9 action:sel_thumbViewDidPan_];
    panGesture = v9->_panGesture;
    v9->_panGesture = (UIPanGestureRecognizer *)v10;

    [(UIPanGestureRecognizer *)v9->_panGesture setCancelsTouchesInView:0];
    [(PUIStyleVariationSlider *)v9 addGestureRecognizer:v9->_panGesture];
    [(PUIStyleVariationSlider *)v9 setClipsToBounds:0];
    [(PUIStyleVariationSlider *)v9 setStyleCoordinator:v6];
  }

  return v9;
}

- (UIGestureRecognizer)sliderGestureRecognizer
{
  return (UIGestureRecognizer *)self->_panGesture;
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isPressed != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isPressed = a3;
    double v6 = 0.9;
    uint64_t v9 = 3221225472;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v10 = __47__PUIStyleVariationSlider_setPressed_animated___block_invoke;
    v11 = &unk_265471A10;
    if (!a3) {
      double v6 = 1.0;
    }
    v12 = self;
    double v13 = v6;
    id v7 = (void *)MEMORY[0x25A2F6090](&v8, a2);
    if (v4) {
      objc_msgSend(MEMORY[0x263F1CB60], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v5, v7, 0, 1.0, 0.1, 0.0, 0.0, 0.0, 0.0, v8, v9, v10, v11);
    }
    else {
      objc_msgSend(MEMORY[0x263F1CB60], "performWithoutAnimation:", v7, v8, v9, v10, v11);
    }
  }
}

void __47__PUIStyleVariationSlider_setPressed_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 736) layer];
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  [v2 setAffineTransform:&v3];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PUIStyleVariationSlider;
  [(PUIStyleVariationSlider *)&v15 layoutSubviews];
  [(PUIStyleVariationSlider *)self _setupViewsIfNeeded];
  [(PUIStyleVariationSlider *)self bounds];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
  v3[8] = v12;
  v3[9] = v13;
  v3[10] = v14;
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  [(PUIStyleVariationSlider *)self _applyMetrics:v3];
}

- (void)setStyleCoordinator:(id)a3
{
}

- (void)setStyleCoordinator:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  long long v8 = v7;
  if (v7)
  {
    long long v9 = [v7 style];
    if ([v9 allowsVariation])
    {
      char v10 = [(PUIStyleUICoordinator *)self->_styleCoordinator isEqual:v8];

      if ((v10 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_styleCoordinator, a3);
        [(PUIStyleVariationSlider *)self _updateTrackAnimated:v4];
        [(PUIStyleVariationSlider *)self _updateThumbContentViewAnimated:v4];
        uint64_t v13 = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        objc_super v15 = __56__PUIStyleVariationSlider_setStyleCoordinator_animated___block_invoke;
        v16 = &unk_265471108;
        v17 = self;
        id v18 = v8;
        uint64_t v11 = MEMORY[0x25A2F6090](&v13);
        long long v12 = (void *)v11;
        if (v4) {
          objc_msgSend(MEMORY[0x263F1CB60], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v11, 0, 0.9, 0.4, 0.0, 0.0, 0.0, 0.0, v13, v14, v15, v16, v17);
        }
        else {
          (*(void (**)(uint64_t))(v11 + 16))(v11);
        }
      }
    }
    else
    {
    }
  }
}

void __56__PUIStyleVariationSlider_setStyleCoordinator_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) variation];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 32) superview];
  [v2 _setSliderValue:v5 != 0 layout:0 fireActions:v4];
}

- (void)_layoutDirectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a4;
  id v7 = [a3 traitCollection];
  uint64_t v8 = [v7 layoutDirection];

  uint64_t v9 = [v6 layoutDirection];
  if (v8 != v9)
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v16.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v16.m33 = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v16.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v16.m43 = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v16.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v16.m13 = v12;
    long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v16.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v16.m23 = v13;
    if (v8 == 1) {
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    }
    uint64_t v14 = [(UIView *)self->_trackView layer];
    CATransform3D v15 = v16;
    [v14 setTransform:&v15];
  }
}

- (void)thumbViewDidPan:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(UIView *)self->_thumbContainerView center];
    self->_startPanOffset = v5;
    [(PUIStyleVariationSlider *)self bringSubviewToFront:self->_thumbContainerView];
    id v6 = self;
    uint64_t v7 = 0x10000;
LABEL_12:
    [(PUIStyleVariationSlider *)v6 sendActionsForControlEvents:v7];
    goto LABEL_13;
  }
  if ([v4 state] == 2 || objc_msgSend(v4, "state") == 3)
  {
    [(PUIStyleVariationSlider *)self bounds];
    double v9 = v8;
    [(UIView *)self->_thumbContainerView bounds];
    double v11 = v10;
    [v4 translationInView:self];
    double v13 = v12 + self->_startPanOffset;
    [(UIView *)self->_thumbContainerView bounds];
    double MidX = CGRectGetMidX(v24);
    uint64_t v19 = 3221225472;
    double v15 = v13 >= MidX ? v13 : MidX;
    double v16 = v9 - MidX;
    uint64_t v18 = MEMORY[0x263EF8330];
    v20 = __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke;
    v21 = &unk_265471A10;
    if (v15 < v16) {
      double v16 = v15;
    }
    v22 = self;
    double v23 = v16;
    [MEMORY[0x263F1CB60] animateWithDuration:&v18 animations:0.0];
    [(UIView *)self->_thumbContainerView frame];
    [(PUIStyleVariationSlider *)self _setSliderValue:0 layout:1 fireActions:v17 / (v9 - v11) - (1.0 - v17 / (v9 - v11))];
    if ([v4 state] == 3)
    {
      id v6 = self;
      uint64_t v7 = 0x40000;
      goto LABEL_12;
    }
  }
LABEL_13:
}

uint64_t __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke_2;
  v4[3] = &unk_265471A10;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = *(void *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2490371, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __43__PUIStyleVariationSlider_thumbViewDidPan___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 728);
  double v2 = *(double *)(a1 + 40);
  [v1 center];
  return [v1 setCenter:v2];
}

- (double)variation
{
  return self->_value;
}

- (void)_setSliderValue:(double)a3 layout:(BOOL)a4 fireActions:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (BSFloatEqualToFloat()) {
    return;
  }
  self->_value = a3;
  [(PUIStyleUICoordinator *)self->_styleCoordinator variation];
  if (BSFloatEqualToFloat())
  {
    if (!v5) {
      goto LABEL_4;
    }
LABEL_9:
    [(PUIStyleVariationSlider *)self sendActionsForControlEvents:4096];
    if (!v6) {
      return;
    }
    goto LABEL_5;
  }
  [(PUIStyleUICoordinator *)self->_styleCoordinator setVariation:a3];
  if (v5) {
    goto LABEL_9;
  }
LABEL_4:
  if (!v6) {
    return;
  }
LABEL_5:
  [(PUIStyleVariationSlider *)self setNeedsLayout];
  [(PUIStyleVariationSlider *)self layoutIfNeeded];
}

- (void)_setupViewsIfNeeded
{
  v25[1] = *MEMORY[0x263EF8340];
  if (!self->_thumbContainerView)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    thumbContainerView = self->_thumbContainerView;
    self->_thumbContainerView = v3;

    [(PUIStyleVariationSlider *)self addSubview:self->_thumbContainerView];
    [(UIView *)self->_thumbContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v5 = self->_thumbContainerView;
    BOOL v6 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)self->_thumbContainerView setContentMode:2];
    [(UIView *)self->_thumbContainerView setClipsToBounds:0];
    [(UIView *)self->_thumbContainerView setUserInteractionEnabled:0];
    uint64_t v7 = [(UIView *)self->_thumbContainerView layer];
    LODWORD(v8) = 1042536202;
    [v7 setShadowOpacity:v8];
    objc_msgSend(v7, "setShadowOffset:", 1.0, 5.5);
    [v7 setShadowRadius:3.5];
  }
  if (!self->_thumbSoftShadowLayer)
  {
    double v9 = [MEMORY[0x263F157E8] layer];
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v9;

    LODWORD(v11) = 1042536202;
    [(CALayer *)self->_thumbSoftShadowLayer setShadowOpacity:v11];
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    [(CALayer *)self->_thumbSoftShadowLayer setShadowRadius:6.5];
    double v12 = [(UIView *)self->_thumbContainerView layer];
    [v12 addSublayer:self->_thumbSoftShadowLayer];
  }
  if (!self->_thumbBorderLayer)
  {
    double v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v13;

    double v15 = self->_thumbBorderLayer;
    id v16 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v15, "setFillColor:", [v16 CGColor]);

    double v17 = self->_thumbBorderLayer;
    id v18 = [MEMORY[0x263F1C550] whiteColor];
    -[CAShapeLayer setStrokeColor:](v17, "setStrokeColor:", [v18 CGColor]);

    uint64_t v19 = [(UIView *)self->_thumbContainerView layer];
    [v19 addSublayer:self->_thumbBorderLayer];
  }
  if (!self->_thumbClippingLayer)
  {
    v20 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v20;

    [(CAShapeLayer *)self->_thumbClippingLayer setFillRule:*MEMORY[0x263F15AC0]];
  }
  if (!self->_traitChangeRegistration)
  {
    v25[0] = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    double v23 = [(PUIStyleVariationSlider *)self registerForTraitChanges:v22 withAction:sel__layoutDirectionDidChange_previousTraitCollection_];
    traitChangeRegistration = self->_traitChangeRegistration;
    self->_traitChangeRegistration = v23;
  }
}

- (void)_updateTrackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUIStyleUICoordinator *)self->_styleCoordinator variationSliderTrackView];
  if (v5 != self->_trackView)
  {
    [(PUIStyleVariationSlider *)self _setupViewsIfNeeded];
    BOOL v6 = self->_trackView;
    uint64_t v7 = [(UIView *)v5 layer];
    [(id)objc_opt_class() defaultTrackInnerShadowBorderWidth];
    objc_msgSend(v7, "setBorderWidth:");

    double v8 = [(UIView *)v5 layer];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend((id)objc_opt_class(), "defaultTrackBorderColor"));

    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v3) {
      [(UIView *)v5 setAlpha:0.0];
    }
    if (v6) {
      [(PUIStyleVariationSlider *)self insertSubview:v5 aboveSubview:v6];
    }
    else {
      [(PUIStyleVariationSlider *)self insertSubview:v5 atIndex:0];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    [(PUIStyleVariationSlider *)self bounds];
    -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
    -[UIView setFrame:](v5, "setFrame:", v24, v25);
    [(UIView *)v5 _setContinuousCornerRadius:*(double *)&v30];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke;
    v18[3] = &unk_265470EC8;
    uint64_t v19 = v5;
    double v9 = (void (**)(void))MEMORY[0x25A2F6090](v18);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_2;
    v16[3] = &unk_265470EC8;
    double v10 = v6;
    double v17 = v10;
    double v11 = (void (**)(void))MEMORY[0x25A2F6090](v16);
    double v12 = v11;
    if (v3)
    {
      double v13 = (void *)MEMORY[0x263F1CB60];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_3;
      v14[3] = &unk_265471A38;
      double v15 = v11;
      [v13 _animateUsingSpringWithDampingRatio:0 response:v9 tracking:v14 dampingRatioSmoothing:0.9 responseSmoothing:0.4 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    }
    else
    {
      v9[2](v9);
      v12[2](v12);
    }
    objc_storeStrong((id *)&self->_trackView, v5);
    [(PUIStyleVariationSlider *)self setNeedsLayout];
  }
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 removeFromSuperview];
}

uint64_t __48__PUIStyleVariationSlider__updateTrackAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateThumbContentViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUIStyleUICoordinator *)self->_styleCoordinator variationSliderThumbView];
  thumbContentView = self->_thumbContentView;
  if (v5 != thumbContentView)
  {
    uint64_t v7 = thumbContentView;
    [(PUIStyleVariationSlider *)self _setupViewsIfNeeded];
    objc_storeStrong((id *)&self->_thumbContentView, v5);
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(UIView *)v5 setContentMode:2];
    [(UIView *)v5 setClipsToBounds:0];
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    thumbContainerView = self->_thumbContainerView;
    if (v7) {
      [(UIView *)thumbContainerView insertSubview:v5 belowSubview:v7];
    }
    else {
      [(UIView *)thumbContainerView addSubview:v5];
    }
    double v9 = [(UIView *)v5 layer];
    [v9 setMask:self->_thumbClippingLayer];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    [(PUIStyleVariationSlider *)self bounds];
    -[PUIStyleVariationSlider _metricsForBounds:](self, "_metricsForBounds:");
    -[UIView setFrame:](v5, "setFrame:", (unsigned __int128)0, 0.0, 0.0);
    if (v7 && v3)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F15880]);
      [v10 setFillRule:*MEMORY[0x263F15AC0]];
      objc_msgSend(v10, "setFrame:", v25, v26);
      objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v31, v32);
      id v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
      double v12 = [(UIView *)v7 layer];
      [v12 setMask:v10];
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke;
    v23[3] = &unk_265470EC8;
    double v13 = v7;
    long long v24 = v13;
    uint64_t v14 = (void (**)(void))MEMORY[0x25A2F6090](v23);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_2;
    v21[3] = &unk_265470EC8;
    double v15 = v13;
    long long v22 = v15;
    id v16 = (void (**)(void))MEMORY[0x25A2F6090](v21);
    double v17 = v16;
    if (v3)
    {
      id v18 = (void *)MEMORY[0x263F1CB60];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_3;
      v19[3] = &unk_265471A38;
      long long v20 = v16;
      [v18 _animateUsingSpringWithDampingRatio:0 response:v14 tracking:v19 dampingRatioSmoothing:0.9 responseSmoothing:0.4 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    }
    else
    {
      v14[2](v14);
      v17[2](v17);
    }
    [(PUIStyleVariationSlider *)self setNeedsLayout];
  }
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __59__PUIStyleVariationSlider__updateThumbContentViewAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  [(PUIStyleVariationSlider *)&v5 touchesBegan:a3 withEvent:a4];
  [(PUIStyleVariationSlider *)self setPressed:1 animated:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  [(PUIStyleVariationSlider *)&v5 touchesCancelled:a3 withEvent:a4];
  [(PUIStyleVariationSlider *)self setPressed:0 animated:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUIStyleVariationSlider;
  [(PUIStyleVariationSlider *)&v5 touchesEnded:a3 withEvent:a4];
  [(PUIStyleVariationSlider *)self setPressed:0 animated:1];
}

- ($B5991C4CE9FA8B35561AD36CC4E88915)_metricsForBounds:(SEL)a3
{
  double height = a4.size.height;
  BOOL v6 = [(PUIStyleVariationSlider *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  [(id)objc_opt_class() defaultTrackMultiplier];
  double v29 = height * v9 * 0.5;
  UIRectCenteredYInRectScale();
  CGFloat v27 = v11;
  CGFloat v28 = v10;
  CGFloat v26 = v12;
  CGFloat v14 = v13;
  UIRectCenteredYInRectScale();
  CGFloat v24 = v16;
  CGFloat v25 = v15;
  CGFloat width = v30.size.width;
  CGFloat v18 = v30.size.height;
  v30.origin.CGFloat x = 0.0;
  v30.origin.CGFloat y = 0.0;
  CGRect v31 = CGRectInset(v30, 3.0, 3.0);
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat v21 = v31.size.width;
  CGFloat v22 = v31.size.height;
  CGRect v32 = CGRectInset(v31, v8 * -4.0, v8 * -4.0);
  retstr->var0.origin.CGFloat x = 0.0;
  retstr->var0.origin.CGFloat y = 0.0;
  retstr->var0.size.CGFloat width = width;
  retstr->var0.size.double height = v18;
  retstr->var1.origin.CGFloat x = v25;
  retstr->var1.origin.CGFloat y = v24;
  retstr->var1.size.CGFloat width = width;
  retstr->var1.size.double height = v18;
  retstr->var2.origin.CGFloat x = v28;
  retstr->var2.origin.CGFloat y = v27;
  retstr->var2.size.CGFloat width = v26;
  retstr->var2.size.double height = v14;
  retstr->var3.origin.CGFloat x = x;
  retstr->var3.origin.CGFloat y = y;
  retstr->var3.size.CGFloat width = v21;
  retstr->var3.size.double height = v22;
  retstr->var4 = v32;
  retstr->var5 = v29;
  retstr->var6 = 6.0;
  return result;
}

- (void)_applyMetrics:(id *)a3
{
  [(CAShapeLayer *)self->_thumbBorderLayer setLineWidth:a3->var6];
  -[UIView setFrame:](self->_trackView, "setFrame:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);
  [(UIView *)self->_trackView _setContinuousCornerRadius:a3->var5];
  -[UIView setFrame:](self->_thumbContainerView, "setFrame:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);
  -[CAShapeLayer setFrame:](self->_thumbBorderLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[CAShapeLayer setFrame:](self->_thumbClippingLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[CALayer setFrame:](self->_thumbSoftShadowLayer, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  -[UIView setFrame:](self->_thumbContentView, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  objc_super v5 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", a3->var3.origin.x, a3->var3.origin.y, a3->var3.size.width, a3->var3.size.height);
  thumbBorderLayer = self->_thumbBorderLayer;
  id v7 = v5;
  -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", [v7 CGPath]);
  thumbClippingLayer = self->_thumbClippingLayer;
  id v9 = v7;
  -[CAShapeLayer setPath:](thumbClippingLayer, "setPath:", [v9 CGPath]);
  double v10 = [(UIView *)self->_thumbContainerView layer];
  id v11 = v9;
  objc_msgSend(v10, "setShadowPath:", objc_msgSend(v11, "CGPath"));

  thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
  id v13 = v11;
  -[CALayer setShadowPath:](thumbSoftShadowLayer, "setShadowPath:", [v13 CGPath]);
}

- (void)setVariation:(double)a3
{
  self->_variation = a3;
}

- (PUIStyleUICoordinator)styleCoordinator
{
  return self->_styleCoordinator;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (double)startPanOffset
{
  return self->_startPanOffset;
}

- (void)setStartPanOffset:(double)a3
{
  self->_startPanOffset = a3;
}

- (UIView)trackView
{
  return self->_trackView;
}

- (void)setTrackView:(id)a3
{
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
}

- (UIView)thumbContainerView
{
  return self->_thumbContainerView;
}

- (void)setThumbContainerView:(id)a3
{
}

- (UIView)thumbContentView
{
  return self->_thumbContentView;
}

- (void)setThumbContentView:(id)a3
{
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbContentView, 0);
  objc_storeStrong((id *)&self->_thumbContainerView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_styleCoordinator, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
}

@end