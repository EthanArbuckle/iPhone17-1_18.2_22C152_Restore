@interface PBUIWallpaperEffectViewBase
- (BOOL)_needsBlurViewForStyle:(int64_t)a3;
- (BOOL)_shouldEffectivelyMatchWallpaperPosition;
- (BOOL)currentTransitionStateIsOpaque;
- (BOOL)forcesOpaque;
- (BOOL)isFullscreen;
- (BOOL)prepareToAnimateToTransitionState:(id *)a3;
- (BOOL)shouldMatchWallpaperPosition;
- (NSString)description;
- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration;
- (PBUIFakeBluring)blurView;
- (PBUIFakeBluring)transitionBlurView;
- (PBUIWallpaperEffectViewBase)initWithCoder:(id)a3;
- (PBUIWallpaperEffectViewBase)initWithFrame:(CGRect)a3;
- (PBUIWallpaperEffectViewBase)initWithWallpaperPresenter:(id)a3 variant:(int64_t)a4 transformOptions:(unint64_t)a5;
- (PBUIWallpaperPresenting)wallpaperPresenter;
- (UIImageView)maskImageView;
- (UIView)blurMaskingContainer;
- (UIView)colorTintView;
- (UIView)grayscaleTintView;
- (UIView)tintMaskingContainer;
- (UIView)transitionColorTintView;
- (UIView)transitionGrayscaleTintView;
- (double)zoomScale;
- (id)appearanceStorage;
- (int64_t)wallpaperStyle;
- (unint64_t)transformOptions;
- (void)_accessibilityReduceTransparencyChanged:(id)a3;
- (void)_configureForCurrentBlurStyle;
- (void)_configureFromScratch;
- (void)_configureGrayscaleAndColorTintViewForStartStyle:(BOOL)a3;
- (void)_configureViews;
- (void)_configureViewsPositioning;
- (void)_setTransitionFraction:(double)a3;
- (void)_updateWallpaperAverageColor:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)offsetWallpaperBy:(CGPoint)a3;
- (void)setBlurMaskingContainer:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setColorTintView:(id)a3;
- (void)setExternalDisplayConfiguration:(id)a3;
- (void)setForcesOpaque:(BOOL)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setGrayscaleTintView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMaskImage:(id)a3 masksBlur:(BOOL)a4 masksTint:(BOOL)a5;
- (void)setMaskImageView:(id)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintMaskingContainer:(id)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setTransitionBlurView:(id)a3;
- (void)setTransitionColorTintView:(id)a3;
- (void)setTransitionGrayscaleTintView:(id)a3;
- (void)setTransitionState:(id *)a3;
- (void)setWallpaperStyle:(int64_t)a3;
- (void)setZoomScale:(double)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PBUIWallpaperEffectViewBase

- (void)layoutSubviews
{
  [(PBUIWallpaperEffectViewBase *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_blurMaskingContainer, "setFrame:");
  -[UIView setFrame:](self->_tintMaskingContainer, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_maskImageView, "setFrame:", v4, v6, v8, v10);
  if (!self->_shouldMatchWallpaperPosition) {
    goto LABEL_6;
  }
  v11 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  if ([v11 deviceClass] == 2)
  {

    goto LABEL_7;
  }
  [(PBUIFakeBluring *)self->_blurView bounds];
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  BOOL v12 = CGRectEqualToRect(v15, v16);

  if (!v12)
  {
LABEL_6:
    -[PBUIFakeBluring setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
    -[PBUIFakeBluring setFrame:](self->_transitionBlurView, "setFrame:", v4, v6, v8, v10);
  }
LABEL_7:
  -[UIView setFrame:](self->_grayscaleTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_colorTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_transitionGrayscaleTintView, "setFrame:", v4, v6, v8, v10);
  transitionColorTintView = self->_transitionColorTintView;
  -[UIView setFrame:](transitionColorTintView, "setFrame:", v4, v6, v8, v10);
}

- (void)_configureForCurrentBlurStyle
{
  BOOL shouldMaskBlur = self->_shouldMaskBlur;
  BOOL v4 = !self->_shouldMaskTint;
  if (self->_shouldMaskBlur)
  {
    BOOL shouldMaskTint = self->_shouldMaskTint;
  }
  else
  {
    if (!self->_shouldMaskTint)
    {
      [(UIImageView *)self->_maskImageView removeFromSuperview];
      [(PBUIWallpaperEffectViewBase *)self setMaskImageView:0];
      LOBYTE(v4) = 0;
      BOOL shouldMaskTint = 0;
      goto LABEL_14;
    }
    BOOL shouldMaskTint = 0;
    BOOL v4 = 0;
  }
  maskImageView = self->_maskImageView;
  if (!maskImageView)
  {
    double v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    double v8 = self->_maskImageView;
    self->_maskImageView = v7;

    maskImageView = self->_maskImageView;
  }
  [(UIImageView *)maskImageView setImage:self->_maskImage];
  if (shouldMaskBlur)
  {
LABEL_14:
    [(UIView *)self->_tintMaskingContainer removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setTintMaskingContainer:0];
    if (!v4) {
      goto LABEL_11;
    }
LABEL_15:
    blurMaskingContainer = self->_blurMaskingContainer;
    if (!blurMaskingContainer)
    {
      CGRect v16 = objc_alloc_init(_SBMaskingContainerView);
      v17 = self->_blurMaskingContainer;
      self->_blurMaskingContainer = &v16->super;

      blurMaskingContainer = self->_blurMaskingContainer;
    }
    [(PBUIWallpaperEffectViewBase *)self insertSubview:blurMaskingContainer atIndex:0];
    v18 = [(UIView *)self->_blurMaskingContainer layer];
    v19 = [(UIImageView *)self->_maskImageView layer];
    [v18 setMask:v19];

    if (!shouldMaskTint) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  tintMaskingContainer = self->_tintMaskingContainer;
  if (!tintMaskingContainer)
  {
    double v10 = objc_alloc_init(_SBMaskingContainerView);
    v11 = self->_tintMaskingContainer;
    self->_tintMaskingContainer = &v10->super;

    tintMaskingContainer = self->_tintMaskingContainer;
  }
  [(PBUIWallpaperEffectViewBase *)self insertSubview:tintMaskingContainer atIndex:0];
  BOOL v12 = [(UIView *)self->_tintMaskingContainer layer];
  v13 = [(UIImageView *)self->_maskImageView layer];
  [v12 setMask:v13];

  if (v4) {
    goto LABEL_15;
  }
LABEL_11:
  [(UIView *)self->_blurMaskingContainer removeFromSuperview];
  [(PBUIWallpaperEffectViewBase *)self setBlurMaskingContainer:0];
  if (!shouldMaskTint)
  {
LABEL_12:
    v14 = [(PBUIWallpaperEffectViewBase *)self layer];
    [v14 setMask:0];
    goto LABEL_19;
  }
LABEL_18:
  v14 = [(PBUIWallpaperEffectViewBase *)self layer];
  v20 = [(UIImageView *)self->_maskImageView layer];
  [v14 setMask:v20];

LABEL_19:
  [(PBUIWallpaperEffectViewBase *)self _configureViews];
  double transitionFraction = self->_transitionFraction;
  [(PBUIWallpaperEffectViewBase *)self _setTransitionFraction:transitionFraction];
}

- (void)setTintMaskingContainer:(id)a3
{
}

- (void)setMaskImageView:(id)a3
{
}

- (void)setBlurMaskingContainer:(id)a3
{
}

- (void)_configureViews
{
  blurMaskingContainer = (PBUIWallpaperEffectViewBase *)self->_blurMaskingContainer;
  if (!blurMaskingContainer) {
    blurMaskingContainer = self;
  }
  double v7 = blurMaskingContainer;
  transitionBlurView = self->_transitionBlurView;
  if (transitionBlurView) {
    [(PBUIWallpaperEffectViewBase *)v7 insertSubview:transitionBlurView atIndex:0];
  }
  blurView = self->_blurView;
  if (blurView) {
    [(PBUIWallpaperEffectViewBase *)v7 insertSubview:blurView atIndex:0];
  }
  if (_WallpaperStyleHasTint(self->_startStyle)
    && (_WallpaperStyleHasTint([(PBUIFakeBluring *)self->_blurView effectiveStyle]) & 1) == 0)
  {
    [(PBUIWallpaperEffectViewBase *)self _configureGrayscaleAndColorTintViewForStartStyle:1];
  }
  else
  {
    [(UIView *)self->_grayscaleTintView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setGrayscaleTintView:0];
    [(UIView *)self->_colorTintView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setColorTintView:0];
  }
  unint64_t endStyle = self->_endStyle;
  if (self->_startStyle == endStyle
    || !_WallpaperStyleHasTint(endStyle)
    || _WallpaperStyleHasTint([(PBUIFakeBluring *)self->_transitionBlurView effectiveStyle])
    && self->_endStyle != 2)
  {
    [(UIView *)self->_transitionGrayscaleTintView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setTransitionGrayscaleTintView:0];
    [(UIView *)self->_transitionColorTintView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setTransitionColorTintView:0];
  }
  else
  {
    [(PBUIWallpaperEffectViewBase *)self _configureGrayscaleAndColorTintViewForStartStyle:0];
  }
}

- (void)setTransitionGrayscaleTintView:(id)a3
{
}

- (void)setTransitionColorTintView:(id)a3
{
}

- (void)setGrayscaleTintView:(id)a3
{
}

- (void)setColorTintView:(id)a3
{
}

- (void)willMoveToWindow:(id)a3
{
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[PBUIFakeBluring offsetWallpaperBy:](self->_blurView, "offsetWallpaperBy:");
  transitionBlurView = self->_transitionBlurView;
  -[PBUIFakeBluring offsetWallpaperBy:](transitionBlurView, "offsetWallpaperBy:", x, y);
}

- (void)setFullscreen:(BOOL)a3
{
}

- (void)setWallpaperStyle:(int64_t)a3
{
  if (a3 == 1) {
    a3 = 2;
  }
  [(PBUIWallpaperEffectViewBase *)self setStyle:a3];
}

- (void)_configureFromScratch
{
  BOOL v3 = [(PBUIWallpaperEffectViewBase *)self _shouldEffectivelyMatchWallpaperPosition];
  if ([(PBUIWallpaperEffectViewBase *)self _needsBlurViewForStyle:self->_startStyle]
    && ([(PBUIWallpaperEffectViewBase *)self wallpaperPresenter],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    if (!self->_blurView)
    {
      double v6 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
      double v7 = (PBUIFakeBluring *)[v6 newFakeBlurViewForVariant:self->_variant style:self->_startStyle transformOptions:self->_transformOptions];
      blurView = self->_blurView;
      self->_blurView = v7;

      [(PBUIFakeBluring *)self->_blurView setObserver:self];
      [(PBUIFakeBluring *)self->_blurView setShouldMatchWallpaperPosition:v3];
    }
    unint64_t startStyle = self->_startStyle;
    if (_WallpaperStyleHasTint(startStyle) && self->_shouldMaskTint != self->_shouldMaskBlur) {
      unint64_t startStyle = _WallpaperStyleByRemovingTintFromStyle(self->_startStyle);
    }
    [(PBUIFakeBluring *)self->_blurView requestStyle:startStyle];
  }
  else
  {
    [(PBUIFakeBluring *)self->_blurView setObserver:0];
    [(PBUIFakeBluring *)self->_blurView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setBlurView:0];
  }
  if (self->_startStyle != self->_endStyle
    && -[PBUIWallpaperEffectViewBase _needsBlurViewForStyle:](self, "_needsBlurViewForStyle:")
    && ([(PBUIWallpaperEffectViewBase *)self wallpaperPresenter],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    if (!self->_transitionBlurView)
    {
      BOOL v12 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
      v13 = (PBUIFakeBluring *)[v12 newFakeBlurViewForVariant:self->_variant style:self->_endStyle transformOptions:self->_transformOptions];
      transitionBlurView = self->_transitionBlurView;
      self->_transitionBlurView = v13;

      [(PBUIFakeBluring *)self->_transitionBlurView setObserver:self];
      [(PBUIFakeBluring *)self->_transitionBlurView setShouldMatchWallpaperPosition:v3];
    }
    unint64_t endStyle = self->_endStyle;
    if (_WallpaperStyleHasTint(endStyle) && self->_shouldMaskTint != self->_shouldMaskBlur) {
      unint64_t endStyle = _WallpaperStyleByRemovingTintFromStyle(self->_endStyle);
    }
    [(PBUIFakeBluring *)self->_transitionBlurView requestStyle:endStyle];
  }
  else
  {
    [(PBUIFakeBluring *)self->_transitionBlurView setObserver:0];
    [(PBUIFakeBluring *)self->_transitionBlurView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setTransitionBlurView:0];
  }
  [(PBUIWallpaperEffectViewBase *)self _configureForCurrentBlurStyle];
}

- (PBUIWallpaperPresenting)wallpaperPresenter
{
  return self->_wallpaperPresenter;
}

- (void)setTransitionBlurView:(id)a3
{
}

- (BOOL)_shouldEffectivelyMatchWallpaperPosition
{
  return ([(PBUIWallpaperEffectViewBase *)self isHidden] & 1) == 0 && self->_shouldMatchWallpaperPosition;
}

- (BOOL)_needsBlurViewForStyle:(int64_t)a3
{
  if (self->_forcesOpaque) {
    return 1;
  }
  else {
    return _WallpaperStyleHasBlur(a3);
  }
}

- (void)_setTransitionFraction:(double)a3
{
  self->_double transitionFraction = a3;
  if (self->_startStyle == self->_endStyle) {
    double v4 = 0.0;
  }
  else {
    double v4 = a3;
  }
  blurView = self->_blurView;
  if (blurView && self->_transitionBlurView)
  {
    [(PBUIFakeBluring *)blurView setAlpha:1.0];
    [(PBUIFakeBluring *)self->_transitionBlurView setAlpha:v4];
    double v6 = 1.0 - v4;
  }
  else
  {
    double v6 = 1.0 - v4;
    [(PBUIFakeBluring *)blurView setAlpha:1.0 - v4];
    [(PBUIFakeBluring *)self->_transitionBlurView setAlpha:v4];
  }
  [(UIView *)self->_grayscaleTintView setAlpha:v6];
  [(UIView *)self->_colorTintView setAlpha:v6];
  [(UIView *)self->_transitionGrayscaleTintView setAlpha:v4];
  transitionColorTintView = self->_transitionColorTintView;
  [(UIView *)transitionColorTintView setAlpha:v4];
}

- (PBUIWallpaperEffectViewBase)initWithWallpaperPresenter:(id)a3 variant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PBUIWallpaperEffectViewBase;
  double v10 = -[PBUIWallpaperEffectViewBase initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wallpaperPresenter, a3);
    v11->_unint64_t startStyle = -1;
    v11->_variant = a4;
    v11->_transformOptions = a5;
    [(PBUIWallpaperEffectViewBase *)v11 setClipsToBounds:1];
    BOOL v12 = [(PBUIWallpaperEffectViewBase *)v11 layer];
    [v12 setAllowsEdgeAntialiasing:0];

    v13 = [(PBUIWallpaperEffectViewBase *)v11 layer];
    [v13 setAllowsGroupOpacity:1];

    v14 = [v9 legibilitySettingsForVariant:a4];
    uint64_t v15 = [v14 contentColor];
    wallpaperAverageColor = v11->_wallpaperAverageColor;
    v11->_wallpaperAverageColor = (UIColor *)v15;

    [v9 addObserver:v11 forVariant:v11->_variant];
    [(PBUIWallpaperEffectViewBase *)v11 setShouldMatchWallpaperPosition:1];
    v11->_accessibilityReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v11 selector:sel__accessibilityReduceTransparencyChanged_ name:*MEMORY[0x1E4F43480] object:0];
  }
  return v11;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  if (self->_shouldMatchWallpaperPosition != a3)
  {
    self->_shouldMatchWallpaperPosition = a3;
    [(PBUIWallpaperEffectViewBase *)self _configureViewsPositioning];
  }
}

- (void)_configureViewsPositioning
{
  BOOL v3 = [(PBUIWallpaperEffectViewBase *)self shouldMatchWallpaperPosition];
  [(PBUIFakeBluring *)self->_blurView setShouldMatchWallpaperPosition:v3];
  [(PBUIFakeBluring *)self->_transitionBlurView setShouldMatchWallpaperPosition:v3];
  if (!v3)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[PBUIWallpaperEffectViewBase offsetWallpaperBy:](self, "offsetWallpaperBy:", v4, v5);
  }
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)setForcesOpaque:(BOOL)a3
{
  if (self->_forcesOpaque != a3)
  {
    self->_forcesOpaque = a3;
    [(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PBUIWallpaperEffectViewBase.m" lineNumber:144 description:@"PBUIWallpaperEffectView does not support style Hidden"];
  }
  if (self->_startStyle != a3 || self->_endStyle != a3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      int64_t startStyle = self->_startStyle;
      if (startStyle != a3 && (!a3 || !startStyle))
      {
        [(PBUIFakeBluring *)self->_blurView setObserver:0];
        [(PBUIFakeBluring *)self->_blurView removeFromSuperview];
        [(PBUIWallpaperEffectViewBase *)self setBlurView:0];
      }
      int64_t endStyle = self->_endStyle;
      if (endStyle != a3 && (!a3 || !endStyle))
      {
        [(PBUIFakeBluring *)self->_transitionBlurView setObserver:0];
        [(PBUIFakeBluring *)self->_transitionBlurView removeFromSuperview];
        [(PBUIWallpaperEffectViewBase *)self setTransitionBlurView:0];
      }
    }
    self->_int64_t startStyle = a3;
    self->_int64_t endStyle = a3;
    [(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
  }
}

- (PBUIWallpaperEffectViewBase)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"-initWithFrame: unavailable", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PBUIWallpaperEffectViewBase)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This class does not support unarchiving from a nib" userInfo:0];
  objc_exception_throw(v4);
}

- (void)dealloc
{
  [(PBUIWallpaperPresenting *)self->_wallpaperPresenter removeObserver:self forVariant:self->_variant];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
  [(PBUIFakeBluring *)self->_blurView setObserver:0];
  [(PBUIFakeBluring *)self->_transitionBlurView setObserver:0];

  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperEffectViewBase;
  [(PBUIWallpaperEffectViewBase *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v4 = PBUIStringForWallpaperVariant(self->_variant);
  id v5 = (id)[v3 appendObject:v4 withName:@"variant"];

  id v6 = (id)[v3 appendBool:self->_shouldMatchWallpaperPosition withName:@"shouldMatchWallpaperPosition"];
  unint64_t startStyle = self->_startStyle;
  int64_t endStyle = self->_endStyle;
  id v9 = PBUIWallpaperStyleDescription(startStyle);
  if (startStyle == endStyle)
  {
    id v10 = (id)[v3 appendObject:v9 withName:@"style"];
  }
  else
  {
    id v11 = (id)[v3 appendObject:v9 withName:@"startStyle"];

    BOOL v12 = PBUIWallpaperStyleDescription(self->_endStyle);
    id v13 = (id)[v3 appendObject:v12 withName:@"endStyle"];

    id v14 = (id)[v3 appendFloat:@"transitionFraction" withName:2 decimalPrecision:self->_transitionFraction];
  }
  id v15 = (id)[v3 appendSuper];
  CGRect v16 = [v3 build];

  return (NSString *)v16;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PBUIWallpaperEffectViewBase *)self isHidden];
  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperEffectViewBase;
  [(PBUIWallpaperEffectViewBase *)&v6 setHidden:v3];
  if (v5 != [(PBUIWallpaperEffectViewBase *)self isHidden]) {
    [(PBUIWallpaperEffectViewBase *)self _configureViewsPositioning];
  }
}

- (BOOL)isFullscreen
{
  return ![(PBUIWallpaperEffectViewBase *)self shouldMatchWallpaperPosition];
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    -[PBUIFakeBluring setTransformOptions:](self->_blurView, "setTransformOptions:");
    transitionBlurView = self->_transitionBlurView;
    [(PBUIFakeBluring *)transitionBlurView setTransformOptions:a3];
  }
}

- (void)setExternalDisplayConfiguration:(id)a3
{
  id v8 = a3;
  if (!-[PBUIExternalDisplayConfiguration isEqual:](self->_externalDisplayConfiguration, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_externalDisplayConfiguration, a3);
    int v5 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
      [v7 setExternalDisplayConfiguration:v8];
    }
  }
}

- (double)zoomScale
{
  [(PBUIFakeBluring *)self->_blurView zoomScale];
  return result;
}

- (void)setZoomScale:(double)a3
{
}

- (BOOL)prepareToAnimateToTransitionState:(id *)a3
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t startStyle = self->_startStyle;
  int64_t endStyle = self->_endStyle;
  if (startStyle != endStyle && var0 != var1)
  {
    if (startStyle == var0 && endStyle == var1) {
      return 1;
    }
    if (startStyle != var1 || endStyle != var0) {
      return 0;
    }
    double v12 = 1.0 - a3->var2;
    int64_t v13 = a3->var1;
    goto LABEL_25;
  }
  if (startStyle == endStyle)
  {
    if (var0 == var1)
    {
      PBUIWallpaperStyleTransitionStateMake(self->_startStyle, a3->var0, (uint64_t)v16, 0.0);
      [(PBUIWallpaperEffectViewBase *)self setTransitionState:v16];
LABEL_24:
      double v12 = 1.0;
      int64_t v13 = startStyle;
LABEL_25:
      int64_t endStyle = var0;
      goto LABEL_26;
    }
    if (startStyle == var0)
    {
      PBUIWallpaperStyleTransitionStateMake(a3->var0, a3->var1, (uint64_t)v18, 0.0);
      id v14 = v18;
LABEL_31:
      [(PBUIWallpaperEffectViewBase *)self setTransitionState:v14];
      return 1;
    }
    if (startStyle == var1)
    {
      PBUIWallpaperStyleTransitionStateMake(a3->var0, a3->var1, (uint64_t)v17, 1.0);
      id v14 = v17;
      goto LABEL_31;
    }
  }
  else
  {
    if (startStyle == var0 && self->_transitionFraction < 1.0)
    {
      double v12 = 0.0;
      int64_t v13 = a3->var0;
LABEL_26:
      PBUIWallpaperStyleTransitionStateMake(v13, endStyle, (uint64_t)&v19, v12);
      *(_OWORD *)&a3->int64_t var0 = v19;
      a3->var2 = v20;
      return 1;
    }
    if (endStyle == var0 && self->_transitionFraction > 0.0) {
      goto LABEL_24;
    }
  }
  return 0;
}

- (void)setTransitionState:(id *)a3
{
  if (a3->var0 != self->_startStyle || a3->var1 != self->_endStyle)
  {
    self->_int64_t startStyle = a3->var0;
    self->_int64_t endStyle = a3->var1;
    [(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
  }
  double var2 = a3->var2;
  [(PBUIWallpaperEffectViewBase *)self _setTransitionFraction:var2];
}

- (BOOL)currentTransitionStateIsOpaque
{
  if (BSFloatEqualToFloat())
  {
    uint64_t v3 = 424;
    goto LABEL_5;
  }
  if (BSFloatEqualToFloat())
  {
    uint64_t v3 = 432;
LABEL_5:
    if ((_WallpaperStyleHasBlur(*(unint64_t *)((char *)&self->super.super.super.isa + v3)) & 1) == 0)
    {
      LOBYTE(HasBlur) = self->_forcesOpaque;
      return HasBlur;
    }
LABEL_8:
    LOBYTE(HasBlur) = 1;
    return HasBlur;
  }
  if (self->_forcesOpaque) {
    goto LABEL_8;
  }
  int HasBlur = _WallpaperStyleHasBlur(self->_startStyle);
  if (HasBlur)
  {
    unint64_t endStyle = self->_endStyle;
    LOBYTE(HasBlur) = _WallpaperStyleHasBlur(endStyle);
  }
  return HasBlur;
}

- (void)setMaskImage:(id)a3 masksBlur:(BOOL)a4 masksTint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = (UIImage *)a3;
  id v9 = v8;
  maskImage = self->_maskImage;
  if (maskImage != v8 || self->_shouldMaskBlur != v6 || self->_shouldMaskTint != v5)
  {
    BOOL v11 = 0;
    double v12 = 0;
    id v14 = v9;
    BOOL v13 = 0;
    if (v9 && (v6 || v5))
    {
      double v12 = v9;
      maskImage = self->_maskImage;
      BOOL v11 = v6;
      BOOL v13 = v5;
    }
    self->_maskImage = v12;

    self->_BOOL shouldMaskBlur = v11;
    self->_BOOL shouldMaskTint = v13;
    id v8 = (UIImage *)[(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
    id v9 = v14;
  }
  MEMORY[0x1F41817F8](v8, v9);
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (self->_variant == a4)
  {
    id v5 = [a3 contentColor];
    [(PBUIWallpaperEffectViewBase *)self _updateWallpaperAverageColor:v5];
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (self->_variant == a3)
  {
    objc_super v4 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
    id v5 = [v4 legibilitySettingsForVariant:self->_variant];
    id v6 = [v5 contentColor];

    [(PBUIWallpaperEffectViewBase *)self _updateWallpaperAverageColor:v6];
  }
}

- (void)_updateWallpaperAverageColor:(id)a3
{
  objc_super v4 = (UIColor *)a3;
  id v5 = _BackdropRenderingHintForWallpaperAverageColor(self->_wallpaperAverageColor);
  wallpaperAverageColor = self->_wallpaperAverageColor;
  self->_wallpaperAverageColor = v4;
  double v7 = v4;

  id v8 = _BackdropRenderingHintForWallpaperAverageColor(self->_wallpaperAverageColor);
  if (v8 != v5)
  {
    [(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
  }
}

- (int64_t)wallpaperStyle
{
  return self->_startStyle;
}

- (void)_configureGrayscaleAndColorTintViewForStartStyle:(BOOL)a3
{
  BOOL v3 = a3;
  tintMaskingContainer = (PBUIWallpaperEffectViewBase *)self->_tintMaskingContainer;
  if (!tintMaskingContainer) {
    tintMaskingContainer = self;
  }
  id v6 = tintMaskingContainer;
  double v7 = &OBJC_IVAR___PBUIWallpaperEffectViewBase__endStyle;
  if (v3) {
    double v7 = &OBJC_IVAR___PBUIWallpaperEffectViewBase__startStyle;
  }
  unint64_t v8 = *(unint64_t *)((char *)&self->super.super.super.isa + *v7);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  _WallpaperBackdropParametersForStyleAndAverageColor(v8, self->_wallpaperAverageColor, (uint64_t)&v43);
  v42[0] = v43;
  v42[1] = v44;
  v42[2] = v45;
  v42[3] = v46;
  id v9 = PBUIBackdropOutputSettingsForWallpaperBackdropParameters(v42);
  id v10 = v9;
  if (v8 == 2)
  {
    uint64_t v11 = [MEMORY[0x1E4F428B8] blackColor];
  }
  else
  {
    [v9 grayscaleTintAlpha];
    if (v12 <= 0.00000011920929)
    {
LABEL_12:
      if (v3)
      {
        id v15 = [(PBUIWallpaperEffectViewBase *)self grayscaleTintView];
        [v15 removeFromSuperview];

        [(PBUIWallpaperEffectViewBase *)self setGrayscaleTintView:0];
      }
      else
      {
        CGRect v16 = [(PBUIWallpaperEffectViewBase *)self transitionGrayscaleTintView];
        [v16 removeFromSuperview];

        [(PBUIWallpaperEffectViewBase *)self setTransitionGrayscaleTintView:0];
      }
      id v17 = 0;
      goto LABEL_22;
    }
    BOOL v13 = (void *)MEMORY[0x1E4F428B8];
    [v10 grayscaleTintLevel];
    uint64_t v11 = objc_msgSend(v13, "colorWithWhite:alpha:");
  }
  id v14 = (void *)v11;
  if (!v11) {
    goto LABEL_12;
  }
  if (v3) {
    [(PBUIWallpaperEffectViewBase *)self grayscaleTintView];
  }
  else {
  v18 = [(PBUIWallpaperEffectViewBase *)self transitionGrayscaleTintView];
  }
  if (!v18)
  {
    long long v19 = [_SBTintView alloc];
    [(PBUIWallpaperEffectViewBase *)self bounds];
    v18 = -[_SBTintView initWithFrame:](v19, "initWithFrame:");
    if (v3) {
      [(PBUIWallpaperEffectViewBase *)self setGrayscaleTintView:v18];
    }
    else {
      [(PBUIWallpaperEffectViewBase *)self setTransitionGrayscaleTintView:v18];
    }
  }
  double v20 = (void *)MEMORY[0x1E4F42FF0];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke;
  v39[3] = &unk_1E62B2C38;
  v40 = v18;
  id v17 = v14;
  id v41 = v17;
  v21 = v18;
  [v20 performWithoutAnimation:v39];
  [(PBUIWallpaperEffectViewBase *)v6 addSubview:v21];

LABEL_22:
  [v10 colorTintAlpha];
  double v23 = v22;
  if (v22 > 0.00000011920929
    && ([v10 colorTint],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v24 colorWithAlphaComponent:v23],
        v25 = objc_claimAutoreleasedReturnValue(),
        v24,
        v25))
  {
    if (v3) {
      [(PBUIWallpaperEffectViewBase *)self colorTintView];
    }
    else {
    v28 = [(PBUIWallpaperEffectViewBase *)self transitionColorTintView];
    }
    if (!v28)
    {
      v29 = [_SBTintView alloc];
      [(PBUIWallpaperEffectViewBase *)self bounds];
      v28 = -[_SBTintView initWithFrame:](v29, "initWithFrame:");
      if (v3) {
        [(PBUIWallpaperEffectViewBase *)self setColorTintView:v28];
      }
      else {
        [(PBUIWallpaperEffectViewBase *)self setTransitionColorTintView:v28];
      }
    }
    v30 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke_2;
    v36 = &unk_1E62B2C38;
    v37 = v28;
    id v38 = v25;
    id v31 = v25;
    v32 = v28;
    [v30 performWithoutAnimation:&v33];
    -[PBUIWallpaperEffectViewBase addSubview:](v6, "addSubview:", v32, v33, v34, v35, v36);
  }
  else if (v3)
  {
    v26 = [(PBUIWallpaperEffectViewBase *)self colorTintView];
    [v26 removeFromSuperview];

    [(PBUIWallpaperEffectViewBase *)self setColorTintView:0];
  }
  else
  {
    v27 = [(PBUIWallpaperEffectViewBase *)self transitionColorTintView];
    [v27 removeFromSuperview];

    [(PBUIWallpaperEffectViewBase *)self setTransitionColorTintView:0];
  }
}

uint64_t __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setBackgroundColor:v3];
}

uint64_t __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setBackgroundColor:v3];
}

- (void)_accessibilityReduceTransparencyChanged:(id)a3
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (self->_accessibilityReduceTransparencyEnabled != IsReduceTransparencyEnabled)
  {
    self->_accessibilityReduceTransparencyEnabled = IsReduceTransparencyEnabled;
    [(PBUIFakeBluring *)self->_blurView setObserver:0];
    [(PBUIFakeBluring *)self->_blurView removeFromSuperview];
    [(PBUIWallpaperEffectViewBase *)self setBlurView:0];
    [(PBUIWallpaperEffectViewBase *)self _configureFromScratch];
  }
}

- (id)appearanceStorage
{
  return 0;
}

- (BOOL)forcesOpaque
{
  return self->_forcesOpaque;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration
{
  return self->_externalDisplayConfiguration;
}

- (PBUIFakeBluring)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIView)grayscaleTintView
{
  return self->_grayscaleTintView;
}

- (UIView)colorTintView
{
  return self->_colorTintView;
}

- (PBUIFakeBluring)transitionBlurView
{
  return self->_transitionBlurView;
}

- (UIView)transitionGrayscaleTintView
{
  return self->_transitionGrayscaleTintView;
}

- (UIView)transitionColorTintView
{
  return self->_transitionColorTintView;
}

- (UIImageView)maskImageView
{
  return self->_maskImageView;
}

- (UIView)blurMaskingContainer
{
  return self->_blurMaskingContainer;
}

- (UIView)tintMaskingContainer
{
  return self->_tintMaskingContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_tintMaskingContainer, 0);
  objc_storeStrong((id *)&self->_blurMaskingContainer, 0);
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_transitionColorTintView, 0);
  objc_storeStrong((id *)&self->_transitionGrayscaleTintView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_colorTintView, 0);
  objc_storeStrong((id *)&self->_grayscaleTintView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_wallpaperAverageColor, 0);
}

@end