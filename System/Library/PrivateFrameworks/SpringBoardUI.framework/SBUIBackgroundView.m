@interface SBUIBackgroundView
- (BOOL)_shouldApplyReducedTransparencyTintForBackgroundStyle:(int64_t)a3;
- (BOOL)isTransitioningBackgroundStyle;
- (NSString)groupName;
- (SBUIBackgroundView)initWithFrame:(CGRect)a3;
- (double)_darkenValueForBackgroundStyle:(int64_t)a3;
- (double)_lightenSourceOverValueForBackgroundStyle:(int64_t)a3;
- (double)_luminanceValueForBackgroundStyle:(int64_t)a3;
- (double)_reducedTransparencyValueForBackgroundStyle:(int64_t)a3;
- (double)_tintColorAlphaForBackgroundStyle:(int64_t)a3;
- (double)_tintValueForBackgroundStyle:(int64_t)a3;
- (double)_valueFromStart:(double)a3 toEnd:(double)a4 withFraction:(double)a5;
- (id)_backgroundColorForDarkenAlpha:(double)a3 andProgress:(double)a4;
- (id)backdropView;
- (int64_t)backgroundStyle;
- (void)_darkenWithProgress:(double)a3;
- (void)_lightenSourceOverWithProgress:(double)a3;
- (void)_luminanceWithProgress:(double)a3;
- (void)_reduceTransparencyEnabledStateDidChange:(id)a3;
- (void)_reduceTransparencyWithProgress:(double)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_tintWithProgress:(double)a3 backgroundColorAlpha:(double)a4;
- (void)_updateAppearanceForBackgroundStyle:(int64_t)a3 transitionToSettings:(BOOL)a4;
- (void)_updateAppearanceForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 withProgress:(double)a5;
- (void)_updateReduceTransparencyTinting;
- (void)_updateReduceTransparencyTintingWithProgressWeighting:(double)a3;
- (void)beginTransitionToBackgroundStyle:(int64_t)a3;
- (void)completeTransitionToBackgroundStyle:(int64_t)a3;
- (void)layoutSubviews;
- (void)modifyAllViewsWithChanges:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setReduceTransparencyBackingColor:(id)a3;
- (void)updateBackgroundStyleTransitionProgress:(double)a3;
@end

@implementation SBUIBackgroundView

- (SBUIBackgroundView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)SBUIBackgroundView;
  v3 = -[SBUIBackgroundView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_transitionStyle = -1;
    v3->_isReducedTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    v5 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    reduceTransparencyView = v4->_reduceTransparencyView;
    v4->_reduceTransparencyView = v5;

    if (v4->_reduceTransparencyBackingColor)
    {
      -[SBUIBackgroundView setReduceTransparencyBackingColor:](v4, "setReduceTransparencyBackingColor:");
    }
    else
    {
      v7 = [MEMORY[0x263F1C550] whiteColor];
      [(SBUIBackgroundView *)v4 setReduceTransparencyBackingColor:v7];
    }
    [(UIView *)v4->_reduceTransparencyView setHidden:!v4->_isReducedTransparencyEnabled];
    [(SBUIBackgroundView *)v4 addSubview:v4->_reduceTransparencyView];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    reduceTransparencyTintingView = v4->_reduceTransparencyTintingView;
    v4->_reduceTransparencyTintingView = v8;

    [(UIView *)v4->_reduceTransparencyTintingView setHidden:!v4->_isReducedTransparencyEnabled];
    [(SBUIBackgroundView *)v4 addSubview:v4->_reduceTransparencyTintingView];
    id v10 = objc_alloc(MEMORY[0x263F1CB60]);
    [(BSUIBackdropView *)v4->_backdropView bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:");
    sourceOverView = v4->_sourceOverView;
    v4->_sourceOverView = (UIView *)v11;

    v13 = [(UIView *)v4->_sourceOverView layer];
    [v13 setCompositingFilter:*MEMORY[0x263F15D98]];

    [(SBUIBackgroundView *)v4 addSubview:v4->_sourceOverView];
    id v14 = objc_alloc(MEMORY[0x263F1CB60]);
    [(BSUIBackdropView *)v4->_backdropView bounds];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:");
    darkenSourceOverView = v4->_darkenSourceOverView;
    v4->_darkenSourceOverView = (UIView *)v15;

    v17 = [(UIView *)v4->_darkenSourceOverView layer];
    [v17 setCompositingFilter:*MEMORY[0x263F15B78]];

    [(SBUIBackgroundView *)v4 addSubview:v4->_darkenSourceOverView];
    id v18 = objc_alloc(MEMORY[0x263F29D28]);
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:privateStyle:", -2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    backdropView = v4->_backdropView;
    v4->_backdropView = (BSUIBackdropView *)v19;

    [(BSUIBackdropView *)v4->_backdropView setHidden:v4->_isReducedTransparencyEnabled];
    [(SBUIBackgroundView *)v4 addSubview:v4->_backdropView];
    v21 = (void *)MEMORY[0x263F53FE8];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v23 = [v21 materialViewWithRecipeNamed:@"sbuiBackgroundViewLuminance" inBundle:v22 options:0 initialWeighting:0 scaleAdjustment:1.0];
    luminanceView = v4->_luminanceView;
    v4->_luminanceView = (MTMaterialView *)v23;

    [(SBUIBackgroundView *)v4 addSubview:v4->_luminanceView];
    v25 = [(SBUIBackgroundView *)v4 layer];
    [v25 setAllowsGroupBlending:0];

    [(SBUIBackgroundView *)v4 bounds];
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v26, v27, v28, v29);
    lightenSourceOverView = v4->_lightenSourceOverView;
    v4->_lightenSourceOverView = (UIView *)v30;

    [(UIView *)v4->_lightenSourceOverView setAutoresizingMask:18];
    v32 = v4->_lightenSourceOverView;
    v33 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];
    [(UIView *)v32 setBackgroundColor:v33];

    v34 = [(UIView *)v4->_lightenSourceOverView layer];
    v35 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CC0]];
    [v34 setCompositingFilter:v35];

    [(SBUIBackgroundView *)v4 addSubview:v4->_lightenSourceOverView];
    id v36 = objc_alloc(MEMORY[0x263F1CB60]);
    [(BSUIBackdropView *)v4->_backdropView bounds];
    uint64_t v37 = objc_msgSend(v36, "initWithFrame:");
    tintView = v4->_tintView;
    v4->_tintView = (UIView *)v37;

    [(SBUIBackgroundView *)v4 addSubview:v4->_tintView];
    [(SBUIBackgroundView *)v4 setBackgroundStyle:1];
    v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 addObserver:v4 selector:sel__reduceTransparencyEnabledStateDidChange_ name:*MEMORY[0x263F1CE58] object:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SBUIBackgroundView;
  [(SBUIBackgroundView *)&v8 layoutSubviews];
  [(SBUIBackgroundView *)self bounds];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SBUIBackgroundView_layoutSubviews__block_invoke;
  v7[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  v7[4] = v3;
  v7[5] = v4;
  v7[6] = v5;
  v7[7] = v6;
  [(SBUIBackgroundView *)self modifyAllViewsWithChanges:v7];
}

uint64_t __36__SBUIBackgroundView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIBackgroundView__setContinuousCornerRadius___block_invoke;
  v3[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v3[4] = a3;
  [(SBUIBackgroundView *)self modifyAllViewsWithChanges:v3];
}

void __49__SBUIBackgroundView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  id v3 = a2;
  [v3 _setContinuousCornerRadius:v2];
  [v3 setClipsToBounds:1];
}

- (void)modifyAllViewsWithChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void))a3;
  reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
  luminanceView = self->_luminanceView;
  backdropView = self->_backdropView;
  v21[0] = self->_reduceTransparencyView;
  v21[1] = reduceTransparencyTintingView;
  sourceOverView = self->_sourceOverView;
  v21[2] = luminanceView;
  v21[3] = backdropView;
  darkenSourceOverView = self->_darkenSourceOverView;
  v21[4] = sourceOverView;
  v21[5] = darkenSourceOverView;
  tintView = self->_tintView;
  lightenSourceOverView = self->_lightenSourceOverView;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v21[6] = tintView;
  v21[7] = lightenSourceOverView;
  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 8, 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        if (v4) {
          v4[2](v4, *(void *)(*((void *)&v17 + 1) + 8 * v16));
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView beginTransitionToBackgroundStyle:](self, "beginTransitionToBackgroundStyle:");

  [(SBUIBackgroundView *)self completeTransitionToBackgroundStyle:a3];
}

- (void)beginTransitionToBackgroundStyle:(int64_t)a3
{
  if (self->_transitioning)
  {
    if (self->_transitionStyle == a3) {
      return;
    }
    p_style = &self->_style;
    if (self->_style == a3)
    {
      [(SBUIBackgroundView *)self completeTransitionToBackgroundStyle:a3];
      return;
    }
  }
  else
  {
    p_style = &self->_style;
    if (self->_style == a3) {
      return;
    }
  }
  -[SBUIBackgroundView _updateAppearanceForBackgroundStyle:transitionToSettings:](self, "_updateAppearanceForBackgroundStyle:transitionToSettings:");
  self->_transitionStyle = a3;
  self->_transitioning = 1;
  BOOL v6 = !SBUIHasBlurForBackgroundStyle(*p_style) && !SBUIHasBlurForBackgroundStyle(self->_transitionStyle);
  backdropView = self->_backdropView;
  uint64_t v8 = self->_isReducedTransparencyEnabled || v6;

  [(BSUIBackdropView *)backdropView setHidden:v8];
}

- (void)updateBackgroundStyleTransitionProgress:(double)a3
{
  if (self->_transitioning)
  {
    self->_progress = a3;
    if (([(BSUIBackdropView *)self->_backdropView isHidden] & 1) == 0)
    {
      backdropView = self->_backdropView;
      BOOL v6 = SBUIGetBackdropSettingsForBackgroundStyle(self->_transitionStyle);
      [(BSUIBackdropView *)backdropView transitionIncrementallyToSettings:v6 weighting:self->_progress];
    }
    [(SBUIBackgroundView *)self _updateReduceTransparencyTintingWithProgressWeighting:self->_progress];
    int64_t style = self->_style;
    int64_t transitionStyle = self->_transitionStyle;
    [(SBUIBackgroundView *)self _updateAppearanceForTransitionFromStyle:style toStyle:transitionStyle withProgress:a3];
  }
}

- (void)completeTransitionToBackgroundStyle:(int64_t)a3
{
  if (self->_transitioning)
  {
    self->_progress = 0.0;
    self->_transitioning = 0;
    self->_int64_t style = a3;
    self->_int64_t transitionStyle = -1;
    -[SBUIBackgroundView _updateAppearanceForBackgroundStyle:transitionToSettings:](self, "_updateAppearanceForBackgroundStyle:transitionToSettings:");
  }
}

- (NSString)groupName
{
  return (NSString *)[(BSUIBackdropView *)self->_backdropView groupName];
}

- (void)setGroupName:(id)a3
{
}

- (id)backdropView
{
  return self->_backdropView;
}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
  if (self->_reduceTransparencyBackingColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
    reduceTransparencyView = self->_reduceTransparencyView;
    if (*p_reduceTransparencyBackingColor)
    {
      -[UIView setBackgroundColor:](reduceTransparencyView, "setBackgroundColor:");
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F1C550] whiteColor];
      [(UIView *)reduceTransparencyView setBackgroundColor:v8];
    }
    uint64_t v5 = v9;
  }
}

- (void)_updateReduceTransparencyTintingWithProgressWeighting:(double)a3
{
  uint64_t v4 = SBUIGetBackdropSettingsForBackgroundStyle(self->_transitionStyle);
  uint64_t v5 = SBUIGetBackdropSettingsForBackgroundStyle(self->_style);
  BOOL v6 = [(SBUIBackgroundView *)self _shouldApplyReducedTransparencyTintForBackgroundStyle:self->_style];
  if (v6 == [(SBUIBackgroundView *)self _shouldApplyReducedTransparencyTintForBackgroundStyle:self->_transitionStyle])
  {
    if (!v6)
    {
      [(UIView *)self->_reduceTransparencyTintingView setBackgroundColor:0];
      goto LABEL_10;
    }
    [v5 grayscaleTintLevel];
    [v4 grayscaleTintLevel];
    [v5 grayscaleTintAlpha];
    uint64_t v13 = v12;
    [v4 grayscaleTintAlpha];
    uint64_t v15 = v14;
    reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
    long long v17 = (void *)MEMORY[0x263F1C550];
    BSIntervalValueForFraction();
    double v19 = v18;
    BSIntervalValueForFraction();
    v21 = objc_msgSend(v17, "colorWithWhite:alpha:", v19, v20, v13, 1, v15, 1);
    v22 = reduceTransparencyTintingView;
  }
  else
  {
    if (v6)
    {
      [v5 grayscaleTintAlpha];
      uint64_t v8 = v7;
      v9 = (void *)MEMORY[0x263F1C550];
      [v5 grayscaleTintLevel];
    }
    else
    {
      [v4 grayscaleTintAlpha];
      uint64_t v8 = v23;
      v9 = (void *)MEMORY[0x263F1C550];
      [v4 grayscaleTintLevel];
    }
    double v11 = v10;
    LOBYTE(v25) = 1;
    *(void *)((char *)&v25 + 1) = 0;
    LOBYTE(v26) = 1;
    *(_DWORD *)((char *)&v26 + 1) = 0;
    DWORD1(v26) = 0;
    BSIntervalValueForFraction();
    v21 = objc_msgSend(v9, "colorWithWhite:alpha:", v11, v24, v8, (void)v25, 0, (void)v26);
    v22 = self->_reduceTransparencyTintingView;
  }
  [(UIView *)v22 setBackgroundColor:v21];

LABEL_10:
}

- (void)_updateReduceTransparencyTinting
{
  SBUIGetBackdropSettingsForBackgroundStyle(self->_style);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(SBUIBackgroundView *)self _shouldApplyReducedTransparencyTintForBackgroundStyle:self->_style];
  reduceTransparencyTintingView = self->_reduceTransparencyTintingView;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F1C550];
    [v10 grayscaleTintLevel];
    double v7 = v6;
    [v10 grayscaleTintAlpha];
    v9 = [v5 colorWithWhite:v7 alpha:v8];
    [(UIView *)reduceTransparencyTintingView setBackgroundColor:v9];
  }
  else
  {
    [(UIView *)reduceTransparencyTintingView setBackgroundColor:0];
  }
}

- (void)_reduceTransparencyEnabledStateDidChange:(id)a3
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  self->_isReducedTransparencyEnabled = IsReduceTransparencyEnabled;
  [(UIView *)self->_reduceTransparencyView setHidden:!IsReduceTransparencyEnabled];
  [(UIView *)self->_reduceTransparencyTintingView setHidden:!self->_isReducedTransparencyEnabled];
  [(SBUIBackgroundView *)self _reducedTransparencyValueForBackgroundStyle:self->_style];
  double v6 = v5;
  -[UIView setAlpha:](self->_reduceTransparencyView, "setAlpha:");
  [(UIView *)self->_reduceTransparencyTintingView setAlpha:v6];
  backdropView = self->_backdropView;
  double v8 = 0.0;
  if (!self->_isReducedTransparencyEnabled) {
    double v8 = 1.0;
  }

  [(BSUIBackdropView *)backdropView setAlpha:v8];
}

- (void)_updateAppearanceForBackgroundStyle:(int64_t)a3 transitionToSettings:(BOOL)a4
{
  if (a4)
  {
    backdropView = self->_backdropView;
    double v7 = SBUIGetBackdropSettingsForBackgroundStyle(a3);
    [(BSUIBackdropView *)backdropView transitionToSettings:v7];
  }
  [(SBUIBackgroundView *)self _darkenValueForBackgroundStyle:a3];
  -[SBUIBackgroundView _darkenWithProgress:](self, "_darkenWithProgress:");
  [(SBUIBackgroundView *)self _tintValueForBackgroundStyle:a3];
  double v9 = v8;
  [(SBUIBackgroundView *)self _tintColorAlphaForBackgroundStyle:a3];
  [(SBUIBackgroundView *)self _tintWithProgress:v9 backgroundColorAlpha:v10];
  [(SBUIBackgroundView *)self _reducedTransparencyValueForBackgroundStyle:a3];
  -[SBUIBackgroundView _reduceTransparencyWithProgress:](self, "_reduceTransparencyWithProgress:");
  [(SBUIBackgroundView *)self _updateReduceTransparencyTinting];
  [(SBUIBackgroundView *)self _luminanceValueForBackgroundStyle:a3];
  -[SBUIBackgroundView _luminanceWithProgress:](self, "_luminanceWithProgress:");
  [(SBUIBackgroundView *)self _lightenSourceOverValueForBackgroundStyle:a3];

  -[SBUIBackgroundView _lightenSourceOverWithProgress:](self, "_lightenSourceOverWithProgress:");
}

- (void)_updateAppearanceForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 withProgress:(double)a5
{
  -[SBUIBackgroundView _tintValueForBackgroundStyle:](self, "_tintValueForBackgroundStyle:");
  double v10 = v9;
  [(SBUIBackgroundView *)self _tintValueForBackgroundStyle:a4];
  [(SBUIBackgroundView *)self _valueFromStart:v10 toEnd:v11 withFraction:a5];
  double v13 = v12;
  [(SBUIBackgroundView *)self _tintColorAlphaForBackgroundStyle:a3];
  double v15 = v14;
  [(SBUIBackgroundView *)self _tintColorAlphaForBackgroundStyle:a4];
  if (v15 >= v16) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  [(SBUIBackgroundView *)self _tintWithProgress:v13 backgroundColorAlpha:v17];
  [(SBUIBackgroundView *)self _darkenValueForBackgroundStyle:a3];
  double v19 = v18;
  [(SBUIBackgroundView *)self _darkenValueForBackgroundStyle:a4];
  [(SBUIBackgroundView *)self _valueFromStart:v19 toEnd:v20 withFraction:a5];
  -[SBUIBackgroundView _darkenWithProgress:](self, "_darkenWithProgress:");
  [(SBUIBackgroundView *)self _reducedTransparencyValueForBackgroundStyle:a3];
  double v22 = v21;
  [(SBUIBackgroundView *)self _reducedTransparencyValueForBackgroundStyle:a4];
  [(SBUIBackgroundView *)self _valueFromStart:v22 toEnd:v23 withFraction:a5];
  -[SBUIBackgroundView _reduceTransparencyWithProgress:](self, "_reduceTransparencyWithProgress:");
  [(SBUIBackgroundView *)self _luminanceValueForBackgroundStyle:a3];
  double v25 = v24;
  [(SBUIBackgroundView *)self _luminanceValueForBackgroundStyle:a4];
  [(SBUIBackgroundView *)self _valueFromStart:v25 toEnd:v26 withFraction:a5];
  -[SBUIBackgroundView _luminanceWithProgress:](self, "_luminanceWithProgress:");
  [(SBUIBackgroundView *)self _lightenSourceOverValueForBackgroundStyle:a3];
  double v28 = v27;
  [(SBUIBackgroundView *)self _lightenSourceOverValueForBackgroundStyle:a4];
  [(SBUIBackgroundView *)self _valueFromStart:v28 toEnd:v29 withFraction:a5];

  -[SBUIBackgroundView _lightenSourceOverWithProgress:](self, "_lightenSourceOverWithProgress:");
}

- (double)_darkenValueForBackgroundStyle:(int64_t)a3
{
  BOOL v3 = a3 == 5 || a3 == 2;
  double result = 0.0;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_tintColorAlphaForBackgroundStyle:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 8) {
    double result = 0.0;
  }
  if (a3 == 5) {
    return 0.35;
  }
  return result;
}

- (double)_tintValueForBackgroundStyle:(int64_t)a3
{
  BOOL v3 = a3 == 8 || a3 == 5;
  double result = 0.0;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_luminanceValueForBackgroundStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 9) {
    return 1.0;
  }
  return result;
}

- (double)_lightenSourceOverValueForBackgroundStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 8) {
    return 1.0;
  }
  return result;
}

- (BOOL)_shouldApplyReducedTransparencyTintForBackgroundStyle:(int64_t)a3
{
  return a3 == 7;
}

- (double)_reducedTransparencyValueForBackgroundStyle:(int64_t)a3
{
  double result = 0.0;
  double v4 = 1.0;
  if ((unint64_t)(a3 - 2) >= 7) {
    double v4 = 0.0;
  }
  if (self->_isReducedTransparencyEnabled) {
    return v4;
  }
  return result;
}

- (void)_darkenWithProgress:(double)a3
{
  id v4 = [(SBUIBackgroundView *)self _backgroundColorForDarkenAlpha:0.07 andProgress:a3];
  [(UIView *)self->_sourceOverView setBackgroundColor:v4];
  [(UIView *)self->_darkenSourceOverView setBackgroundColor:v4];
}

- (void)_tintWithProgress:(double)a3 backgroundColorAlpha:(double)a4
{
  id v5 = [(SBUIBackgroundView *)self _backgroundColorForDarkenAlpha:a4 andProgress:a3];
  [(UIView *)self->_tintView setBackgroundColor:v5];
}

- (void)_reduceTransparencyWithProgress:(double)a3
{
  -[UIView setAlpha:](self->_reduceTransparencyView, "setAlpha:");
  reduceTransparencyTintingView = self->_reduceTransparencyTintingView;

  [(UIView *)reduceTransparencyTintingView setAlpha:a3];
}

- (void)_lightenSourceOverWithProgress:(double)a3
{
}

- (void)_luminanceWithProgress:(double)a3
{
}

- (id)_backgroundColorForDarkenAlpha:(double)a3 andProgress:(double)a4
{
  [(SBUIBackgroundView *)self _valueFromStart:0.0 toEnd:a3 withFraction:a4];
  double v5 = v4;
  double v6 = [MEMORY[0x263F1C550] blackColor];
  double v7 = [v6 colorWithAlphaComponent:v5];

  return v7;
}

- (double)_valueFromStart:(double)a3 toEnd:(double)a4 withFraction:(double)a5
{
  BSIntervalValueForFraction();
  return result;
}

- (int64_t)backgroundStyle
{
  return self->_style;
}

- (BOOL)isTransitioningBackgroundStyle
{
  return self->_transitioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_darkenSourceOverView, 0);
  objc_storeStrong((id *)&self->_sourceOverView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyTintingView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end