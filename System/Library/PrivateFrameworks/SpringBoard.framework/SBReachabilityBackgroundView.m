@interface SBReachabilityBackgroundView
- (BOOL)_invertColorsIsEnabled;
- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3;
- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3;
- (SBReachabilityBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (double)chevronAlpha;
- (double)containerViewYOffset;
- (double)homeGrabberAdditionalOffset;
- (double)homeGrabberAlpha;
- (id)_newWallpaperViewForVariant:(int64_t)a3;
- (int64_t)wallpaperVariant;
- (void)_invertColorsChanged:(id)a3;
- (void)_setupChevron;
- (void)_setupColorInvertObservation;
- (void)_setupCornerContentsImageForWallpaperView:(id)a3;
- (void)_setupHitTestBlockerView;
- (void)_setupHomeGrabberView;
- (void)_updateChevronPathForUpFraction:(double)a3;
- (void)_updateColorMatrixAlpha:(double)a3;
- (void)_updateColorMatrixFilters;
- (void)_updateWallpaperViewAnimated:(BOOL)a3;
- (void)_updateWallpaperViewFilters;
- (void)layoutSubviews;
- (void)setChevronAlpha:(double)a3;
- (void)setContainerViewYOffset:(double)a3;
- (void)setHomeGrabberAdditionalOffset:(double)a3;
- (void)setHomeGrabberAlpha:(double)a3;
- (void)setWallpaperVariant:(int64_t)a3;
@end

@implementation SBReachabilityBackgroundView

- (SBReachabilityBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityBackgroundView;
  v5 = -[SBReachabilityBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperVariant = a4;
    [(SBReachabilityBackgroundView *)v5 _updateWallpaperViewAnimated:0];
    [(SBReachabilityBackgroundView *)v6 _setupChevron];
    [(SBReachabilityBackgroundView *)v6 _setupHomeGrabberView];
    [(SBReachabilityBackgroundView *)v6 _setupHitTestBlockerView];
    [(SBReachabilityBackgroundView *)v6 _setupColorInvertObservation];
    [(SBReachabilityBackgroundView *)v6 setHomeGrabberAlpha:0.0];
    [(SBReachabilityBackgroundView *)v6 setChevronAlpha:0.0];
    [(SBReachabilityBackgroundView *)v6 setAccessibilityIdentifier:@"reachability-window"];
    v7 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__SBReachabilityBackgroundView_initWithFrame_wallpaperVariant___block_invoke;
    v9[3] = &unk_1E6AF4AC0;
    v10 = v6;
    [v7 _performWithoutRetargetingAnimations:v9];
  }
  return v6;
}

uint64_t __63__SBReachabilityBackgroundView_initWithFrame_wallpaperVariant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SBReachabilityBackgroundView;
  [(SBReachabilityBackgroundView *)&v24 layoutSubviews];
  [(SBReachabilityBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_wallpaperContainerView, "setFrame:");
  -[_SBAdaptiveColorMatrixView setFrame:](self->_colorMatrixView, "setFrame:", v4, v6, v8, v10);
  topWallpaperView = self->_topWallpaperView;
  [(SBReachabilityBackgroundView *)self _displayCornerRadius];
  CGFloat v13 = -(v10 - v12 * 2.0);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGRect v26 = CGRectOffset(v25, 0.0, v13);
  -[UIView setFrame:](topWallpaperView, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  bottomWallpaperView = self->_bottomWallpaperView;
  [(SBReachabilityBackgroundView *)self _displayCornerRadius];
  CGFloat v16 = v10 - v15 * 2.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  CGRect v28 = CGRectOffset(v27, 0.0, v16);
  -[UIView setFrame:](bottomWallpaperView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  homeGrabberView = self->_homeGrabberView;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGRect v30 = CGRectOffset(v29, 0.0, -self->_containerViewYOffset);
  -[SBHomeGrabberView setFrame:](homeGrabberView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  -[UIView setFrame:](self->_hitTestBlockerView, "setFrame:", 0.0, -self->_containerViewYOffset, v8);
  -[CAShapeLayer setPosition:](self->_chevronLayer, "setPosition:", v8 * 0.5, -27.0);
  v18 = +[SBReachabilityDomain rootSettings];
  [v18 yOffset];
  double v20 = v19;
  long long v22 = *MEMORY[0x1E4F4F630];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F4F630] + 16);
  BSUIConstrainValueToIntervalWithRubberBand();
  -[UIViewFloatAnimatableProperty setValue:](self->_chevronShapeAnimatableProperty, "setValue:", v22, v23);
  uint64_t v21 = SBFEffectiveArtworkSubtype();
  if (v21 <= 2795)
  {
    if (v21 != 2556 && v21 != 2622) {
      goto LABEL_8;
    }
LABEL_7:
    [(UIViewFloatAnimatableProperty *)self->_colorMatrixOpacityAnimatableProperty setValue:fmax(fmin(self->_containerViewYOffset / v20 + 0.0, v20), 0.0)];
    goto LABEL_8;
  }
  if (v21 == 2868 || v21 == 2796) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setWallpaperVariant:(int64_t)a3
{
  if (self->_wallpaperVariant != a3)
  {
    self->_wallpaperVariant = a3;
    [(SBReachabilityBackgroundView *)self _updateWallpaperViewAnimated:1];
  }
}

- (void)setContainerViewYOffset:(double)a3
{
  if (self->_containerViewYOffset != a3)
  {
    self->_containerViewYOffset = a3;
    [(SBReachabilityBackgroundView *)self setNeedsLayout];
    [(SBReachabilityBackgroundView *)self layoutIfNeeded];
  }
}

- (void)setHomeGrabberAdditionalOffset:(double)a3
{
  if (self->_homeGrabberAdditionalOffset != a3)
  {
    self->_homeGrabberAdditionalOffset = a3;
    [(SBHomeGrabberView *)self->_homeGrabberView setNeedsLayout];
    homeGrabberView = self->_homeGrabberView;
    [(SBHomeGrabberView *)homeGrabberView layoutIfNeeded];
  }
}

- (void)setHomeGrabberAlpha:(double)a3
{
}

- (void)setChevronAlpha:(double)a3
{
  *(float *)&a3 = a3;
  [(CAShapeLayer *)self->_chevronLayer setOpacity:a3];
}

- (double)homeGrabberAlpha
{
  [(SBHomeGrabberView *)self->_homeGrabberView alpha];
  return result;
}

- (double)chevronAlpha
{
  [(CAShapeLayer *)self->_chevronLayer opacity];
  return v2;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  return self->_homeGrabberAdditionalOffset;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (id)_newWallpaperViewForVariant:(int64_t)a3
{
  uint64_t v4 = SBFEffectiveArtworkSubtype();
  if (v4 > 2795)
  {
    if (v4 != 2796 && v4 != 2868) {
      goto LABEL_8;
    }
  }
  else if (v4 != 2556 && v4 != 2622)
  {
LABEL_8:
    double v6 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:self->_wallpaperVariant];
    [(PBUIWallpaperEffectViewBase *)v6 setForcesOpaque:1];
    [(SBReachabilityBackgroundView *)self bounds];
    -[SBWallpaperEffectView setFrame:](v6, "setFrame:");
    [(PBUIWallpaperEffectViewBase *)v6 setStyle:15];
    return v6;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(SBReachabilityBackgroundView *)self bounds];
  double v6 = (SBWallpaperEffectView *)objc_msgSend(v5, "initWithFrame:");
  double v7 = [MEMORY[0x1E4F428B8] blackColor];
  [(SBWallpaperEffectView *)v6 setBackgroundColor:v7];

  return v6;
}

- (void)_updateWallpaperViewAnimated:(BOOL)a3
{
  BOOL v23 = a3;
  v32[1] = *MEMORY[0x1E4F143B8];
  if (!self->_wallpaperContainerView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBReachabilityBackgroundView *)self bounds];
    id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    wallpaperContainerView = self->_wallpaperContainerView;
    self->_wallpaperContainerView = v5;

    [(UIView *)self->_wallpaperContainerView bs_setHitTestingDisabled:1];
    [(SBReachabilityBackgroundView *)self addSubview:self->_wallpaperContainerView];
  }
  double v7 = self->_topWallpaperView;
  double v8 = self->_bottomWallpaperView;
  double v9 = [(SBReachabilityBackgroundView *)self _newWallpaperViewForVariant:self->_wallpaperVariant];
  topWallpaperView = self->_topWallpaperView;
  self->_topWallpaperView = v9;

  objc_super v11 = [(SBReachabilityBackgroundView *)self _newWallpaperViewForVariant:self->_wallpaperVariant];
  bottomWallpaperView = self->_bottomWallpaperView;
  self->_bottomWallpaperView = v11;

  [(UIView *)self->_wallpaperContainerView addSubview:self->_topWallpaperView];
  [(UIView *)self->_wallpaperContainerView addSubview:self->_bottomWallpaperView];
  if (!self->_colorMatrixView)
  {
    uint64_t v13 = SBFEffectiveArtworkSubtype();
    if (v13 <= 2795)
    {
      if (v13 != 2556 && v13 != 2622) {
        goto LABEL_11;
      }
LABEL_10:
      v14 = [_SBAdaptiveColorMatrixView alloc];
      [(SBReachabilityBackgroundView *)self bounds];
      double v15 = -[_SBAdaptiveColorMatrixView initWithFrame:](v14, "initWithFrame:");
      colorMatrixView = self->_colorMatrixView;
      self->_colorMatrixView = v15;

      v17 = self->_colorMatrixView;
      [(SBReachabilityBackgroundView *)self _displayCornerRadius];
      -[_SBAdaptiveColorMatrixView _setCornerRadius:](v17, "_setCornerRadius:");
      [(SBReachabilityBackgroundView *)self _updateColorMatrixFilters];
      [(SBReachabilityBackgroundView *)self _updateColorMatrixAlpha:0.0];
      objc_initWeak(&location, self);
      v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
      colorMatrixOpacityAnimatableProperty = self->_colorMatrixOpacityAnimatableProperty;
      self->_colorMatrixOpacityAnimatableProperty = v18;

      double v20 = (void *)MEMORY[0x1E4F42FF0];
      v32[0] = self->_colorMatrixOpacityAnimatableProperty;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke;
      v29[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v30, &location);
      [v20 _createTransformerWithInputAnimatableProperties:v21 presentationValueChangedCallback:v29];

      [(UIView *)self->_wallpaperContainerView addSubview:self->_colorMatrixView];
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    if (v13 == 2868 || v13 == 2796) {
      goto LABEL_10;
    }
  }
LABEL_11:
  [(SBReachabilityBackgroundView *)self _setupCornerContentsImageForWallpaperView:self->_topWallpaperView];
  [(SBReachabilityBackgroundView *)self _setupCornerContentsImageForWallpaperView:self->_bottomWallpaperView];
  [(SBReachabilityBackgroundView *)self _updateWallpaperViewFilters];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_2;
  v28[3] = &unk_1E6AF4AC0;
  v28[4] = self;
  [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v28];
  if (v7 && v23)
  {
    [(UIView *)self->_topWallpaperView setAlpha:0.0];
    [(UIView *)self->_bottomWallpaperView setAlpha:0.0];
    long long v22 = (void *)MEMORY[0x1E4F42FF0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_3;
    v27[3] = &unk_1E6AF4AC0;
    v27[4] = self;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_4;
    v24[3] = &unk_1E6AF4A98;
    CGRect v25 = v7;
    CGRect v26 = v8;
    [v22 animateWithDuration:v27 animations:v24 completion:0.3];
  }
  else
  {
    [(UIView *)v7 removeFromSuperview];
    [(UIView *)v8 removeFromSuperview];
  }
}

void __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = (void *)*((void *)WeakRetained + 53);
    if (v3)
    {
      id v4 = v2;
      [v3 presentationValue];
      objc_msgSend(v4, "_updateColorMatrixAlpha:");
      float v2 = v4;
    }
  }
}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  float v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  float v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setAlpha:1.0];
}

uint64_t __61__SBReachabilityBackgroundView__updateWallpaperViewAnimated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  float v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)_setupCornerContentsImageForWallpaperView:(id)a3
{
  id v4 = a3;
  [(SBReachabilityBackgroundView *)self _displayCornerRadius];
  uint64_t v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    [v4 bounds];
    double v8 = v7;
    BSRectWithSize();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = objc_alloc(MEMORY[0x1E4F42A58]);
    v18 = [MEMORY[0x1E4F42A60] preferredFormat];
    double v19 = objc_msgSend(v17, "initWithBounds:format:", v18, v10, v12, v14, v16);

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__SBReachabilityBackgroundView__setupCornerContentsImageForWallpaperView___block_invoke;
    v25[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v25[4] = v10;
    *(double *)&v25[5] = v12;
    *(double *)&v25[6] = v14;
    *(double *)&v25[7] = v16;
    v25[8] = v6;
    double v20 = [v19 imageWithActions:v25];
    uint64_t v21 = [v4 layer];
    [v21 setCornerRadius:v8 * 0.5];

    long long v22 = [v4 layer];
    id v23 = v20;
    objc_msgSend(v22, "setCornerContents:", objc_msgSend(v23, "CGImage"));

    objc_super v24 = [v4 layer];
    [v24 setCornerCurve:*MEMORY[0x1E4F39EA0]];
  }
}

void __74__SBReachabilityBackgroundView__setupCornerContentsImageForWallpaperView___block_invoke(double *a1)
{
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", a1[4], a1[5], a1[6], a1[7]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  float v2 = (void *)MEMORY[0x1E4F427D0];
  CGRect v11 = *(CGRect *)((unsigned char *)a1 + 1);
  CGRect v12 = CGRectOffset(v11, 0.0, v11.size.height - a1[8] * 2.0);
  double v3 = objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height, a1[8]);
  id v4 = [v3 bezierPathByReversingPath];
  [v9 appendPath:v4];

  uint64_t v5 = (void *)MEMORY[0x1E4F427D0];
  CGRect v13 = *(CGRect *)((unsigned char *)a1 + 1);
  CGRect v14 = CGRectOffset(v13, 0.0, -(v13.size.height - a1[8] * 2.0));
  uint64_t v6 = objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height, a1[8]);
  double v7 = [v6 bezierPathByReversingPath];
  [v9 appendPath:v7];

  double v8 = [MEMORY[0x1E4F428B8] blackColor];
  [v8 setFill];

  [v9 fill];
}

- (void)_setupChevron
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  chevronLayer = self->_chevronLayer;
  self->_chevronLayer = v3;

  -[CAShapeLayer setAnchorPoint:](self->_chevronLayer, "setAnchorPoint:", 0.5, 1.0);
  [(CAShapeLayer *)self->_chevronLayer setCompositingFilter:*MEMORY[0x1E4F3A2E8]];
  uint64_t v5 = self->_chevronLayer;
  id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
  -[CAShapeLayer setStrokeColor:](v5, "setStrokeColor:", [v6 CGColor]);

  double v7 = self->_chevronLayer;
  id v8 = [MEMORY[0x1E4F428B8] clearColor];
  -[CAShapeLayer setFillColor:](v7, "setFillColor:", [v8 CGColor]);

  [(CAShapeLayer *)self->_chevronLayer setLineWidth:5.0];
  [(CAShapeLayer *)self->_chevronLayer setLineCap:*MEMORY[0x1E4F3A458]];
  [(CAShapeLayer *)self->_chevronLayer setLineJoin:*MEMORY[0x1E4F3A478]];
  [(CAShapeLayer *)self->_chevronLayer setAllowsGroupBlending:0];
  id v9 = [(SBReachabilityBackgroundView *)self layer];
  [v9 setAllowsGroupBlending:0];

  double v10 = [(SBReachabilityBackgroundView *)self layer];
  [v10 addSublayer:self->_chevronLayer];

  objc_initWeak(&location, self);
  CGRect v11 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  p_chevronShapeAnimatableProperty = &self->_chevronShapeAnimatableProperty;
  chevronShapeAnimatableProperty = self->_chevronShapeAnimatableProperty;
  self->_chevronShapeAnimatableProperty = v11;

  CGRect v14 = (void *)MEMORY[0x1E4F42FF0];
  v19[0] = *p_chevronShapeAnimatableProperty;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__SBReachabilityBackgroundView__setupChevron__block_invoke;
  v16[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v17, &location);
  [v14 _createTransformerWithInputAnimatableProperties:v15 presentationValueChangedCallback:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __45__SBReachabilityBackgroundView__setupChevron__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = (void *)*((void *)WeakRetained + 60);
    if (v3)
    {
      id v4 = v2;
      [v3 presentationValue];
      objc_msgSend(v4, "_updateChevronPathForUpFraction:");
      float v2 = v4;
    }
  }
}

- (void)_updateChevronPathForUpFraction:(double)a3
{
  double v4 = a3 * 9.0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  objc_msgSend(v5, "moveToPoint:", -20.0, v4 * 0.5);
  objc_msgSend(v5, "addCurveToPoint:controlPoint1:controlPoint2:", 20.0, v4 * 0.5, 6.66666667, v4 * -0.5, -6.66666667, v4 * -0.5);
  chevronLayer = self->_chevronLayer;
  id v7 = v5;
  -[CAShapeLayer setPath:](chevronLayer, "setPath:", [v7 CGPath]);
}

- (void)_setupHomeGrabberView
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    double v3 = [SBHomeGrabberView alloc];
    [(SBReachabilityBackgroundView *)self bounds];
    double v4 = -[SBHomeGrabberView initWithFrame:](v3, "initWithFrame:");
    homeGrabberView = self->_homeGrabberView;
    self->_homeGrabberView = v4;

    [(SBHomeGrabberView *)self->_homeGrabberView setDelegate:self];
    [(SBHomeGrabberView *)self->_homeGrabberView setHomeAffordanceInteractionEnabled:0];
    id v6 = self->_homeGrabberView;
    [(SBReachabilityBackgroundView *)self addSubview:v6];
  }
}

- (void)_setupHitTestBlockerView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(SBReachabilityBackgroundView *)self bounds];
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  hitTestBlockerView = self->_hitTestBlockerView;
  self->_hitTestBlockerView = v4;

  id v6 = self->_hitTestBlockerView;
  id v7 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v6 setBackgroundColor:v7];

  id v8 = [(UIView *)self->_hitTestBlockerView layer];
  [v8 setHitTestsAsOpaque:1];

  id v9 = [(UIView *)self->_hitTestBlockerView layer];
  [v9 setAllowsHitTesting:1];

  double v10 = self->_hitTestBlockerView;
  [(SBReachabilityBackgroundView *)self addSubview:v10];
}

- (void)_setupColorInvertObservation
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__invertColorsChanged_ name:*MEMORY[0x1E4F43440] object:0];
}

- (void)_updateColorMatrixAlpha:(double)a3
{
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796) {
      return;
    }
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    return;
  }
  colorMatrixView = self->_colorMatrixView;
  [(_SBAdaptiveColorMatrixView *)colorMatrixView setAlpha:a3];
}

- (BOOL)_invertColorsIsEnabled
{
  return _AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled() != 0;
}

- (void)_updateColorMatrixFilters
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2868 && v3 != 2796) {
      return;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return;
  }
  double v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v5 = +[SBReachabilityDomain rootSettings];
  id v6 = [v5 jindoTintColorMatrixSettings];
  id v7 = v6;
  if (v6)
  {
    [v6 colorMatrix];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }

  v15[2] = v18;
  v15[3] = v19;
  v15[4] = v20;
  v15[0] = v16;
  v15[1] = v17;
  id v8 = [MEMORY[0x1E4F29238] valueWithBytes:v15 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  [v4 setValue:v8 forKey:@"inputColorMatrix"];

  v22[0] = v4;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  if ([(SBReachabilityBackgroundView *)self _invertColorsIsEnabled])
  {
    double v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A028]];
    uint64_t v21 = v10;
    CGRect v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v9];

    id v9 = (void *)v12;
  }
  CGRect v13 = [(_SBAdaptiveColorMatrixView *)self->_colorMatrixView backdropLayer];
  [v13 setAllowsInPlaceFiltering:1];

  CGRect v14 = [(_SBAdaptiveColorMatrixView *)self->_colorMatrixView layer];
  [v14 setFilters:v9];
}

- (void)_updateWallpaperViewFilters
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2868 && v3 != 2796) {
      return;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return;
  }
  BOOL v4 = [(SBReachabilityBackgroundView *)self _invertColorsIsEnabled];
  uint64_t v5 = [(UIView *)self->_topWallpaperView layer];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = *MEMORY[0x1E4F3A028];
    id v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A028]];
    v16[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v6 setFilters:v9];

    double v10 = [(UIView *)self->_bottomWallpaperView layer];
    CGRect v11 = [MEMORY[0x1E4F39BC0] filterWithType:v7];
    double v15 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v10 setFilters:v12];
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    [v5 setFilters:MEMORY[0x1E4F1CBF0]];

    id v14 = [(UIView *)self->_bottomWallpaperView layer];
    [v14 setFilters:v13];
  }
}

- (void)_invertColorsChanged:(id)a3
{
  [(SBReachabilityBackgroundView *)self _updateColorMatrixFilters];
  [(SBReachabilityBackgroundView *)self _updateWallpaperViewFilters];
}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (double)containerViewYOffset
{
  return self->_containerViewYOffset;
}

- (double)homeGrabberAdditionalOffset
{
  return self->_homeGrabberAdditionalOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronShapeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_chevronLayer, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerView, 0);
  objc_storeStrong((id *)&self->_bottomWallpaperView, 0);
  objc_storeStrong((id *)&self->_topWallpaperView, 0);
  objc_storeStrong((id *)&self->_colorMatrixOpacityAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_colorMatrixView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end