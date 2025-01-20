@interface PBUIWallpaperView
+ (BOOL)_allowsRasterization;
+ (BOOL)_shouldScaleForParallax;
+ (BOOL)allowsParallax;
+ (Class)wallpaperViewClassForConfiguration:(id)a3;
+ (Class)wallpaperViewClassForWallpaperType:(int64_t)a3;
- (BOOL)_dontUseShadow;
- (BOOL)_isParallaxActive;
- (BOOL)_isParallaxEnabled;
- (BOOL)_isParallaxMotionEnabled;
- (BOOL)_isVisible;
- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3;
- (BOOL)continuousColorSamplingEnabled;
- (BOOL)handlesInactiveAppearanceTreatment;
- (BOOL)hasContentOutsideVisibleBounds;
- (BOOL)hasVideo;
- (BOOL)isContentStatic;
- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4;
- (BOOL)isRotating;
- (BOOL)needsImmediateLayoutBeforeRotation;
- (BOOL)needsWallpaperDimmingTreatment;
- (BOOL)parallaxEnabled;
- (BOOL)sharesContentsAcrossVariants;
- (BOOL)supportsCropping;
- (BOOL)wallpaperAnimationEnabled;
- (BOOL)wantsRasterization;
- (CGRect)cropRect;
- (NSString)cacheGroup;
- (NSString)cacheUniqueIdentifier;
- (NSString)variantCacheIdentifier;
- (NSString)wallpaperName;
- (PBUILegibilitySettingsProviderDelegate)delegate;
- (PBUIWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (PBUIWallpaperViewDelegate)wallpaperDelegate;
- (PBUIWallpaperViewInternalObserver)internalObserver;
- (UIImage)untreatedWallpaperImage;
- (UIImage)wallpaperImage;
- (UIView)contentView;
- (_UILegibilitySettings)legibilitySettings;
- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (double)contentScaleFactor;
- (double)contrast;
- (double)contrastInRect:(CGRect)a3;
- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (double)cropZoomScale;
- (double)parallaxFactor;
- (double)zoomFactor;
- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4;
- (id)_backdrop_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6;
- (id)_blurredImage;
- (id)_blurredImageURL;
- (id)_cacheKeyForParameters:(id *)a3 includingTint:(BOOL)a4 downsampleFactor:(double)a5 traitCollection:(id)a6;
- (id)_computeAverageColor;
- (id)_displayedImage;
- (id)_fallbackImageWithOriginalSize:(CGSize)a3;
- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6;
- (id)_imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5;
- (id)_imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5;
- (id)_material_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 traitCollection:(id)a5;
- (id)_primaryColorOverride;
- (id)averageColorInRect:(CGRect)a3 withSmudgeRadius:(double)a4;
- (id)imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5;
- (id)imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5;
- (id)snapshotImage;
- (id)snapshotImageURL;
- (int64_t)variant;
- (int64_t)wallpaperMode;
- (int64_t)wallpaperType;
- (unint64_t)transformOptions;
- (void)_addParallax;
- (void)_applyParallaxSettings;
- (void)_beginDisallowRasterizationBlock;
- (void)_endDisallowRasterizationBlock;
- (void)_notifyBlursInvalidated;
- (void)_removeParallax;
- (void)_setLegibilitySettings:(id)a3 notify:(BOOL)a4;
- (void)_updateContentViewScale;
- (void)_updateGeneratingBlurs;
- (void)_updateLegibilitySettingsForAverageColor:(id)a3 force:(BOOL)a4 notify:(BOOL)a5;
- (void)_updateParallax;
- (void)_updateRasterizationState;
- (void)_updateScaleFactor;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)legibilitySettingsDidChange;
- (void)resetLegibilitySettingsForAverageColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContinuousColorSamplingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGeneratesBlurredImages:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInternalObserver:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)setParallaxFactor:(double)a3;
- (void)setRotating:(BOOL)a3;
- (void)setSharesContentsAcrossVariants:(BOOL)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setUntreatedWallpaperImage:(id)a3;
- (void)setVariant:(int64_t)a3;
- (void)setVariant:(int64_t)a3 withAnimationFactory:(id)a4;
- (void)setWallpaperAnimationEnabled:(BOOL)a3;
- (void)setWallpaperDelegate:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomFactor:(double)a3 withAnimationFactory:(id)a4;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateLegibilitySettingsForAverageColor:(id)a3;
@end

@implementation PBUIWallpaperView

- (void)layoutSubviews
{
  [(PBUIWallpaperView *)self bounds];
  -[UIView setFrame:](self->_parallaxView, "setFrame:");
  UIRectGetCenter();
  -[UIView setCenter:](self->_contentView, "setCenter:");

  [(PBUIWallpaperView *)self _updateScaleFactor];
}

- (void)_updateScaleFactor
{
  [(UIView *)self->_contentView bounds];
  double v5 = v4;
  double v6 = fabs(v4);
  double v7 = fabs(v3);
  if (self->_contentView) {
    BOOL v8 = v6 < 2.22044605e-16;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && v7 >= 2.22044605e-16)
  {
    double v10 = v3;
    double v11 = 0.0;
    if ([(PBUIWallpaperView *)self _isParallaxEnabled])
    {
      double v12 = 0.0;
      if ([(id)objc_opt_class() _shouldScaleForParallax])
      {
        [(PBUIWallpaperParallaxSettings *)self->_parallaxSettings overhangX];
        double v12 = (v13 + v13) * self->_parallaxFactor;
        [(PBUIWallpaperParallaxSettings *)self->_parallaxSettings overhangY];
        double v11 = (v14 + v14) * self->_parallaxFactor;
      }
    }
    else
    {
      double v12 = 0.0;
    }
    [(PBUIWallpaperView *)self bounds];
    double v16 = v12 + v15;
    double v18 = v11 + v17;
    double v19 = 1.0;
    if (v16 > v5 || v18 > v10)
    {
      double v19 = v16 / v5;
      if (v16 / v5 < v18 / v10) {
        double v19 = v18 / v10;
      }
    }
    if (vabdd_f64(self->_contentScaleFactor, v19) >= 2.22044605e-16)
    {
      self->_contentScaleFactor = v19;
      [(PBUIWallpaperView *)self _updateContentViewScale];
    }
  }
}

- (BOOL)_isParallaxEnabled
{
  int v3 = [(id)objc_opt_class() allowsParallax];
  if (v3) {
    LOBYTE(v3) = self->_parallaxEnabled && self->_parallaxSettings != 0;
  }
  return v3;
}

+ (BOOL)allowsParallax
{
  return 1;
}

- (void)setContentView:(id)a3
{
  double v14 = (UIView *)a3;
  double v5 = [(UIView *)v14 superview];
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v14 || v5 != self && v5 != (PBUIWallpaperView *)self->_parallaxView)
  {
    PBUIApplyParallaxSettingsToView(0, contentView);
    BOOL v8 = [(UIView *)*p_contentView superview];
    v9 = v8;
    if (v8 == self || v8 == (PBUIWallpaperView *)self->_parallaxView) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    parallaxView = self->_parallaxView;
    double v12 = *p_contentView;
    if (parallaxView)
    {
      [(UIView *)parallaxView addSubview:v12];
      [(PBUIWallpaperView *)self setNeedsLayout];
    }
    else
    {
      [(PBUIWallpaperView *)self addSubview:v12];
    }
    [(PBUIWallpaperView *)self _updateScaleFactor];
    if (*p_contentView)
    {
      double v13 = [(PBUIWallpaperView *)self _computeAverageColor];
    }
    else
    {
      double v13 = 0;
    }
    [(_UILegibilitySettingsProvider *)self->_legibilitySettingsProvider clearContentColorAccumulator];
    [(PBUIWallpaperView *)self _updateLegibilitySettingsForAverageColor:v13 force:1 notify:1];
  }
}

void __36__PBUIWallpaperView__removeParallax__block_invoke(uint64_t a1)
{
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = [WeakRetained[52] layer];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v8[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v8[5] = v4;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v8[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v8[7] = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v8[0] = *MEMORY[0x1E4F39B10];
    v8[1] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v8[3] = v7;
    [v3 setTransform:v8];

    PBUIApplyParallaxSettingsToView(0, v2[52]);
    PBUIApplyParallaxSettingsToView(0, v2[67]);
  }
}

- (void)_updateLegibilitySettingsForAverageColor:(id)a3 force:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  double v10 = v9;
  if (self->_legibilitySettings) {
    BOOL v11 = !v6;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11 || v9 && ([(UIColor *)self->_lastAverageColor isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastAverageColor, a3);
    double v13 = 0.0;
    [(PBUIWallpaperView *)self bounds];
    -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:", 0, &v13);
    [(_UILegibilitySettingsProvider *)self->_legibilitySettingsProvider accumulateChangesToContentColor:v10 contrast:v13];
    double v12 = [(_UILegibilitySettingsProvider *)self->_legibilitySettingsProvider settings];
    [(PBUIWallpaperView *)self _setLegibilitySettings:v12 notify:v5];
  }
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  contentView = self->_contentView;
  if (contentView)
  {
    -[UIView convertRect:fromView:](contentView, "convertRect:fromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[PBUIWallpaperView _contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "_contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:", a4, a5);
  }
  else
  {
    if (a4) {
      *(void *)a4 = PBUIWallpaperViewUnknownContrast;
    }
    if (a5) {
      *(void *)a5 = PBUIWallpaperViewUnknownContrast;
    }
    return *(double *)&PBUIWallpaperViewUnknownContrast;
  }
  return result;
}

- (void)_setLegibilitySettings:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [(PBUIWallpaperView *)self _primaryColorOverride];
  BOOL v8 = [(PBUIWallpaperView *)self _dontUseShadow];
  id v9 = v6;
  id v18 = v9;
  if (v7 || (double v10 = (_UILegibilitySettings *)v9, v8))
  {
    BOOL v11 = [MEMORY[0x1E4F428B8] blackColor];

    if (v7 == v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F43228]);
    if (v7)
    {
      double v14 = v7;
    }
    else
    {
      uint64_t v12 = [v18 style];
      double v14 = [v18 primaryColor];
    }
    double v15 = [v18 secondaryColor];
    if (v8) {
      [MEMORY[0x1E4F428B8] whiteColor];
    }
    else {
    double v16 = [v18 shadowColor];
    }
    double v10 = (_UILegibilitySettings *)[v13 initWithStyle:v12 primaryColor:v14 secondaryColor:v15 shadowColor:v16];

    if (!v7)
    {

      if (v8) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (!v8)
    {
LABEL_14:
      double v17 = [v18 contentColor];
      [(_UILegibilitySettings *)v10 setContentColor:v17];
    }
  }
LABEL_15:
  if (v10 != self->_legibilitySettings)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, v10);
    if (v4) {
      [(PBUIWallpaperView *)self legibilitySettingsDidChange];
    }
  }
}

- (void)legibilitySettingsDidChange
{
  id v3 = [(PBUIWallpaperView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 providerLegibilitySettingsChanged:self];
  }
}

- (PBUILegibilitySettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PBUILegibilitySettingsProviderDelegate *)WeakRetained;
}

- (id)_primaryColorOverride
{
  v2 = [(PBUIWallpaperView *)self wallpaperName];
  if ([v2 hasSuffix:@".Purple_Dahlia"]
    || [v2 hasSuffix:@".RedSpider"]
    || [v2 hasSuffix:@".Leaf"])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] blackColor];
LABEL_5:
    BOOL v4 = (void *)v3;
    goto LABEL_6;
  }
  if ([v2 hasPrefix:@"1336"]
    || [v2 hasPrefix:@"1337"])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] whiteColor];
    goto LABEL_5;
  }
  BOOL v4 = 0;
LABEL_6:

  return v4;
}

- (BOOL)_dontUseShadow
{
  v2 = [(PBUIWallpaperView *)self wallpaperName];
  if (([v2 hasPrefix:@"1331"] & 1) != 0
    || ([v2 hasPrefix:@"1336"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 hasPrefix:@"1316"];
  }

  return v3;
}

- (NSString)wallpaperName
{
  return self->_wallpaperName;
}

- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4) {
    *(void *)a4 = PBUIWallpaperViewUnknownContrast;
  }
  if (a5) {
    *(void *)a5 = PBUIWallpaperViewUnknownContrast;
  }
  return *(double *)&PBUIWallpaperViewUnknownContrast;
}

- (id)_computeAverageColor
{
  return 0;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperView;
  [(PBUIWallpaperView *)&v3 didMoveToWindow];
  [(PBUIWallpaperView *)self _handleVisibilityChange];
  [(PBUIWallpaperView *)self _updateParallax];
}

- (void)_updateParallax
{
  [(PBUIWallpaperView *)self _updateRasterizationState];

  [(PBUIWallpaperView *)self _applyParallaxSettings];
}

- (void)_removeParallax
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F42FF0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PBUIWallpaperView__removeParallax__block_invoke;
  v5[3] = &unk_1E62B39F0;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PBUIWallpaperView__removeParallax__block_invoke_2;
  v3[3] = &unk_1E62B3920;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:251658240 delay:v5 options:v3 animations:0.3 completion:0.0];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateGeneratingBlurs
{
  if (self->_shouldGenerateBlurredImagesWhenVisible && [(PBUIWallpaperView *)self _isVisible])
  {
    if (!self->_generatingBlurredImages)
    {
      [(PBUIWallpaperView *)self _startGeneratingBlurredImages];
      self->_generatingBlurredImages = 1;
    }
  }
  else if (self->_generatingBlurredImages)
  {
    [(PBUIWallpaperView *)self _stopGeneratingBlurredImages];
    self->_generatingBlurredImages = 0;
  }
}

uint64_t __36__PBUIWallpaperView__removeParallax__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (([WeakRetained _isParallaxActive] & 1) == 0)
    {
      [v4[52] removeFromSuperview];
      id v2 = v4[52];
      v4[52] = 0;

      [v4 insertSubview:v4[67] atIndex:0];
      [v4 _updateScaleFactor];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_applyParallaxSettings
{
  if ([(PBUIWallpaperView *)self _isParallaxActive])
  {
    [(PBUIWallpaperView *)self _addParallax];
  }
  else
  {
    [(PBUIWallpaperView *)self _removeParallax];
  }
}

- (void)_updateRasterizationState
{
  int wantsRasterization = self->_wantsRasterization;
  int v4 = ![(PBUIWallpaperView *)self _isParallaxActive]
    && [(id)objc_opt_class() _allowsRasterization]
    && !self->_disallowRasterizationBlockCount;
  self->_int wantsRasterization = v4;
  if (v4 != wantsRasterization)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
    [WeakRetained wallpaperViewDidChangeWantsRasterization:self];
  }
}

- (BOOL)_isParallaxActive
{
  int v3 = [(PBUIWallpaperView *)self _isParallaxEnabled];
  if (v3)
  {
    int v3 = [MEMORY[0x1E4F42FF0] _motionEffectsEnabled];
    if (v3) {
      LOBYTE(v3) = self->_wallpaperAnimationEnabled;
    }
  }
  return v3;
}

+ (BOOL)_allowsRasterization
{
  return 0;
}

- (void)setZoomFactor:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  long long v7 = v6;
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    if (v6)
    {
      objc_initWeak(&location, self);
      BOOL v8 = (void *)MEMORY[0x1E4F4F898];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke;
      v11[3] = &unk_1E62B39F0;
      objc_copyWeak(&v12, &location);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke_2;
      v10[3] = &unk_1E62B2A50;
      v10[4] = self;
      [v8 animateWithFactory:v7 actions:v11 completion:v10];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PBUIWallpaperView *)self _updateContentViewScale];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
      [WeakRetained wallpaperView:self didChangeZoomFactor:self->_zoomFactor];
    }
  }
}

- (void)setZoomFactor:(double)a3
{
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  if (self->_parallaxEnabled != a3)
  {
    [(PBUIWallpaperView *)self willChangeValueForKey:@"parallaxEnabled"];
    self->_parallaxEnabled = a3;
    [(PBUIWallpaperView *)self didChangeValueForKey:@"parallaxEnabled"];
    if (self->_parallaxEnabled)
    {
      double v3 = 1.0;
      if (fabs(self->_parallaxFactor) >= 2.22044605e-16) {
        goto LABEL_7;
      }
    }
    else
    {
      double v3 = 0.0;
    }
    self->_parallaxFactor = v3;
  }
LABEL_7:

  [(PBUIWallpaperView *)self _updateParallax];
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (PBUIWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  char v8 = a8;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PBUIWallpaperView;
  v20 = -[PBUIWallpaperView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    v20->_zoomFactor = 1.0;
    v20->_contentScaleFactor = 1.0;
    v20->_variant = a5;
    v20->_sharesContentsAcrossVariants = v8 & 1;
    uint64_t v22 = [v18 copy];
    cacheGroup = v21->_cacheGroup;
    v21->_cacheGroup = (NSString *)v22;

    objc_storeWeak((id *)&v21->_wallpaperDelegate, v19);
    v24 = [v17 wallpaperOptions];
    uint64_t v25 = [v24 name];
    wallpaperName = v21->_wallpaperName;
    v21->_wallpaperName = (NSString *)v25;

    if (v24)
    {
      [v24 parallaxFactor];
      v21->_parallaxFactor = v27;
      char v28 = [v24 parallaxEnabled];
    }
    else
    {
      v21->_parallaxFactor = 1.0;
      char v28 = 1;
    }
    v21->_parallaxEnabled = v28;
    v21->_wallpaperMode = [v24 wallpaperMode];
    v21->_hasVideo = [v24 hasVideo];
    v21->_needsWallpaperDimmingTreatment = [v17 needsWallpaperDimmingTreatment];
    uint64_t v29 = +[PBUIWallpaperDomain rootSettings];
    wallpaperSettings = v21->_wallpaperSettings;
    v21->_wallpaperSettings = (PBUIWallpaperPrototypeSettings *)v29;

    [(PTSettings *)v21->_wallpaperSettings addKeyObserver:v21];
    v21->_wallpaperAnimationEnabled = 1;
    uint64_t v31 = [(PBUIWallpaperPrototypeSettings *)v21->_wallpaperSettings parallaxSettingsForVariant:[(PBUIWallpaperView *)v21 variant]];
    parallaxSettings = v21->_parallaxSettings;
    v21->_parallaxSettings = (PBUIWallpaperParallaxSettings *)v31;

    [(PTSettings *)v21->_parallaxSettings addKeyObserver:v21];
    v33 = (_UILegibilitySettingsProvider *)objc_alloc_init(MEMORY[0x1E4F43230]);
    legibilitySettingsProvider = v21->_legibilitySettingsProvider;
    v21->_legibilitySettingsProvider = v33;

    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v21 selector:sel__updateParallax name:*MEMORY[0x1E4F44100] object:0];

    v36 = [(PBUIWallpaperView *)v21 layer];
    [v36 setOpaque:1];

    v37 = [(PBUIWallpaperView *)v21 layer];
    [v37 setSortsSublayers:0];

    [(PBUIWallpaperView *)v21 _updateRasterizationState];
  }

  return v21;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    [(PBUIWallpaperView *)self _updateContentViewScale];
  }
}

- (void)_updateContentViewScale
{
  char ShouldIgnoreZoom = PBUIWallpaperTransformOptionsShouldIgnoreZoom(self->_transformOptions);
  double contentScaleFactor = self->_contentScaleFactor;
  if ((ShouldIgnoreZoom & 1) == 0) {
    double contentScaleFactor = contentScaleFactor * self->_zoomFactor;
  }
  contentView = self->_contentView;
  CGAffineTransformMakeScale(&v6, contentScaleFactor, contentScaleFactor);
  [(UIView *)contentView setTransform:&v6];
}

+ (Class)wallpaperViewClassForConfiguration:(id)a3
{
  uint64_t v4 = [a3 wallpaperType];

  return (Class)[a1 wallpaperViewClassForWallpaperType:v4];
}

+ (Class)wallpaperViewClassForWallpaperType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = self;
  }
  return (Class)v4;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F44100] object:0];

  [(PTSettings *)self->_wallpaperSettings removeKeyObserver:self];
  [(PTSettings *)self->_parallaxSettings removeKeyObserver:self];
  [(NSTimer *)self->_colorSampleTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperView;
  [(PBUIWallpaperView *)&v4 dealloc];
}

- (int64_t)wallpaperType
{
  return 0;
}

- (CGRect)cropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)supportsCropping
{
  return 0;
}

- (BOOL)isContentStatic
{
  return 1;
}

- (BOOL)handlesInactiveAppearanceTreatment
{
  return 0;
}

- (double)cropZoomScale
{
  return 1.0;
}

- (_UILegibilitySettings)legibilitySettings
{
  legibilitySettings = self->_legibilitySettings;
  if (!legibilitySettings)
  {
    double v4 = [(PBUIWallpaperView *)self _computeAverageColor];
    [(PBUIWallpaperView *)self _updateLegibilitySettingsForAverageColor:v4 force:0 notify:0];

    legibilitySettings = self->_legibilitySettings;
  }

  return legibilitySettings;
}

void __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained _beginDisallowRasterizationBlock];
    [v3 _updateContentViewScale];
    id v2 = objc_loadWeakRetained(v3 + 74);
    [v2 wallpaperView:v3 didChangeZoomFactor:*((double *)v3 + 53)];

    id WeakRetained = v3;
  }
}

uint64_t __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDisallowRasterizationBlock];
}

- (void)setVariant:(int64_t)a3
{
}

- (void)setVariant:(int64_t)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  if (self->_variant != a3)
  {
    self->_variant = a3;
    long long v7 = [(PBUIWallpaperPrototypeSettings *)self->_wallpaperSettings parallaxSettingsForVariant:[(PBUIWallpaperView *)self variant]];
    parallaxSettings = self->_parallaxSettings;
    if (parallaxSettings != v7)
    {
      [(PTSettings *)parallaxSettings removeKeyObserver:self];
      objc_storeStrong((id *)&self->_parallaxSettings, v7);
      [(PTSettings *)self->_parallaxSettings addKeyObserver:self];
      [(PBUIWallpaperView *)self _beginDisallowRasterizationBlock];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke;
      v10[3] = &unk_1E62B2798;
      v10[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke_2;
      v9[3] = &unk_1E62B2A50;
      v9[4] = self;
      [MEMORY[0x1E4F4F898] animateWithFactory:v6 actions:v10 completion:v9];
    }
  }
}

uint64_t __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateParallax];
}

uint64_t __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDisallowRasterizationBlock];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)updateLegibilitySettingsForAverageColor:(id)a3
{
}

- (void)resetLegibilitySettingsForAverageColor:(id)a3
{
  legibilitySettingsProvider = self->_legibilitySettingsProvider;
  id v5 = a3;
  [(_UILegibilitySettingsProvider *)legibilitySettingsProvider clearContentColorAccumulator];
  [(PBUIWallpaperView *)self _updateLegibilitySettingsForAverageColor:v5 force:1 notify:1];
}

- (id)averageColorInRect:(CGRect)a3 withSmudgeRadius:(double)a4
{
  contentView = self->_contentView;
  if (contentView)
  {
    objc_msgSend(contentView, "convertRect:fromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    contentView = -[PBUIWallpaperView _averageColorInContentViewRect:smudgeRadius:](self, "_averageColorInContentViewRect:smudgeRadius:");
  }

  return contentView;
}

- (double)contrast
{
  -[PBUIWallpaperView contrastInRect:](self, "contrastInRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return result;
}

- (double)contrastInRect:(CGRect)a3
{
  -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)setWallpaperAnimationEnabled:(BOOL)a3
{
  self->_wallpaperAnimationEnabled = a3;
  [(PBUIWallpaperView *)self _updateParallax];
}

- (void)setGeneratesBlurredImages:(BOOL)a3
{
  if (self->_shouldGenerateBlurredImagesWhenVisible != a3)
  {
    self->_shouldGenerateBlurredImagesWhenVisible = a3;
    [(PBUIWallpaperView *)self _updateGeneratingBlurs];
  }
}

- (id)snapshotImage
{
  [(PBUIWallpaperView *)self bounds];

  return (id)-[PBUIWallpaperView _imageFromRect:](self, "_imageFromRect:");
}

- (id)imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  long long v5 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  long long v6 = *(_OWORD *)&a3->var6;
  v9[2] = *(_OWORD *)&a3->var4;
  v9[3] = v6;
  long long v7 = [(PBUIWallpaperView *)self _imageForBackdropParameters:v9 includeTint:a4 overrideTraitCollection:a5];

  return v7;
}

- (id)snapshotImageURL
{
  return 0;
}

- (id)imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  long long v5 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  long long v6 = *(_OWORD *)&a3->var6;
  v9[2] = *(_OWORD *)&a3->var4;
  v9[3] = v6;
  long long v7 = [(PBUIWallpaperView *)self _imageURLForBackdropParameters:v9 includeTint:a4 overrideTraitCollection:a5];

  return v7;
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperView;
  [(PBUIWallpaperView *)&v4 setHidden:a3];
  [(PBUIWallpaperView *)self _handleVisibilityChange];
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  return 0;
}

+ (BOOL)_shouldScaleForParallax
{
  return 1;
}

- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4
{
  return 0;
}

- (id)_blurredImage
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  PBUIWallpaperBackdropParametersMake(2020, 0, 0, (uint64_t)&v6);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  double v3 = [(PBUIWallpaperView *)self _imageForBackdropParameters:v5 includeTint:0 overrideTraitCollection:0];

  return v3;
}

- (id)_blurredImageURL
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  PBUIWallpaperBackdropParametersMake(2020, 0, 0, (uint64_t)&v6);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  double v3 = [(PBUIWallpaperView *)self _imageURLForBackdropParameters:v5 includeTint:0 overrideTraitCollection:0];

  return v3;
}

- (id)_imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(PBUIWallpaperView *)self traitCollection];
  }
  BOOL v11 = v10;
  long long v12 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v12;
  long long v13 = *(_OWORD *)&a3->var6;
  v18[2] = *(_OWORD *)&a3->var4;
  v18[3] = v13;
  double v14 = [(PBUIWallpaperView *)self _cacheKeyForParameters:v18 includingTint:v5 downsampleFactor:v10 traitCollection:1.0];
  double v15 = +[PBUIWallpaperCache wallpaperCache];
  double v16 = [v15 imageURLForKey:v14];

  return v16;
}

- (id)_imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(PBUIWallpaperView *)self traitCollection];
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke;
  v37[3] = &unk_1E62B3A18;
  v37[4] = self;
  long long v11 = *(_OWORD *)&a3->var2;
  long long v39 = *(_OWORD *)&a3->var0;
  long long v40 = v11;
  long long v12 = *(_OWORD *)&a3->var6;
  long long v41 = *(_OWORD *)&a3->var4;
  long long v42 = v12;
  BOOL v43 = v5;
  id v13 = v10;
  id v38 = v13;
  double v14 = (void (**)(void))MEMORY[0x1C1872570](v37);
  long long v15 = *(_OWORD *)&a3->var2;
  v36[0] = *(_OWORD *)&a3->var0;
  v36[1] = v15;
  long long v16 = *(_OWORD *)&a3->var6;
  v36[2] = *(_OWORD *)&a3->var4;
  v36[3] = v16;
  id v17 = [(PBUIWallpaperView *)self _cacheKeyForParameters:v36 includingTint:v5 downsampleFactor:v13 traitCollection:1.0];
  if (v17)
  {
    id v18 = +[PBUIWallpaperCache wallpaperCache];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke_2;
    v34[3] = &unk_1E62B3A40;
    v35 = v14;
    id v19 = [v18 imageForKey:v17 generatingIfNecessaryWithBlock:v34];

    if (!v19) {
      goto LABEL_16;
    }
  }
  else
  {
    id v19 = v14[2](v14);
    if (!v19) {
      goto LABEL_16;
    }
  }
  v20 = [(PBUIWallpaperView *)self snapshotImage];
  [v20 size];
  double v22 = v21;

  [v19 size];
  double v24 = v23;
  double v25 = fabs(v22);
  if (vabdd_f64(v22, v23) >= 2.22044605e-16 && v25 >= 2.22044605e-16)
  {
    objc_msgSend(v19, "scale", 2.22044605e-16, v25);
    double v28 = v24 / v22 * v27;
    uint64_t v29 = [v19 ioSurface];
    v30 = (void *)MEMORY[0x1E4F42A80];
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E4F42A80], "pui_imageWithIOSurface:scale:orientation:", v29, objc_msgSend(v19, "imageOrientation"), v28);
    }
    else
    {
      id v31 = v19;
      objc_msgSend(v30, "imageWithCGImage:scale:orientation:", objc_msgSend(v31, "CGImage"), objc_msgSend(v31, "imageOrientation"), v28);
    uint64_t v32 = };

    id v19 = (void *)v32;
  }
LABEL_16:

  return v19;
}

id __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) snapshotImage];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 112);
  objc_super v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 64);
  v10[0] = *(_OWORD *)(a1 + 48);
  v10[1] = v6;
  long long v7 = *(_OWORD *)(a1 + 96);
  v10[2] = *(_OWORD *)(a1 + 80);
  v10[3] = v7;
  id v8 = [v4 _generateImageFromImage:v2 forBackdropParameters:v10 includeTint:v3 traitCollection:v5];

  return v8;
}

uint64_t __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  int v4 = MGGetBoolAnswer();
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  *a2 |= v5;
  if (MGGetBoolAnswer()) {
    *a2 |= 2uLL;
  }
  long long v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  int64_t var7 = a4->var7;
  if ((unint64_t)(var7 - 1) < 2)
  {
    long long v15 = *(_OWORD *)&a4->var2;
    long long v21 = *(_OWORD *)&a4->var0;
    long long v22 = v15;
    long long v16 = *(_OWORD *)&a4->var6;
    long long v23 = *(_OWORD *)&a4->var4;
    long long v24 = v16;
    uint64_t v17 = [(PBUIWallpaperView *)self _material_generateImageFromImage:v11 forBackdropParameters:&v21 traitCollection:v12];
LABEL_7:
    double v14 = (void *)v17;
    goto LABEL_8;
  }
  if (!var7)
  {
    long long v18 = *(_OWORD *)&a4->var2;
    long long v21 = *(_OWORD *)&a4->var0;
    long long v22 = v18;
    long long v19 = *(_OWORD *)&a4->var6;
    long long v23 = *(_OWORD *)&a4->var4;
    long long v24 = v19;
    uint64_t v17 = [(PBUIWallpaperView *)self _backdrop_generateImageFromImage:v11 forBackdropParameters:&v21 includeTint:v7 traitCollection:v12];
    goto LABEL_7;
  }
  if (var7 != 3)
  {
    double v14 = 0;
LABEL_8:

    return v14;
  }
  id result = (id)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (result) {
    -[PBUIWallpaperView _generateImageFromImage:forBackdropParameters:includeTint:traitCollection:](a2);
  }
  __break(0);
  return result;
}

- (id)_backdrop_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  BOOL v6 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = PBUILogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v29 = *(_OWORD *)&a4->var2;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_OWORD *)&buf[16] = v29;
    long long v30 = *(_OWORD *)&a4->var6;
    long long v43 = *(_OWORD *)&a4->var4;
    long long v44 = v30;
    id v31 = PBUIStringForWallpaperBackdropParameters((double *)buf);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v6;
    _os_log_debug_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_DEBUG, "Generating new image via backdrop view for view: %{public}@, backdrop parameters: %{public}@, tint: %{BOOL}u", buf, 0x1Cu);
  }
  id v11 = objc_msgSend(v9, "pui_CGImageBackedImage");

  id v12 = v11;
  uint64_t v13 = [v12 CGImage];
  long long v14 = *(_OWORD *)&a4->var2;
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_OWORD *)&buf[16] = v14;
  long long v15 = *(_OWORD *)&a4->var6;
  long long v43 = *(_OWORD *)&a4->var4;
  long long v44 = v15;
  long long v16 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)buf);
  uint64_t v17 = v16;
  if (v13)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    long long v18 = *(_OWORD *)&a4->var2;
    long long v37 = *(_OWORD *)&a4->var0;
    long long v38 = v18;
    long long v19 = *(_OWORD *)&a4->var6;
    long long v39 = *(_OWORD *)&a4->var4;
    v35[2] = __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke;
    v35[3] = &unk_1E62B3A68;
    BOOL v41 = v6;
    long long v40 = v19;
    id v36 = v16;
    objc_msgSend(v12, "pui_imageByManipulatingInDeviceColorSpaceWithBlock:", v35);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (![(PBUIWallpaperView *)self _needsFallbackImageForBackdropGeneratedImage:v20])goto LABEL_13; {
    if (v20)
    }
    {
      [v20 size];
      double v22 = v21;
      double v24 = v23;

      goto LABEL_9;
    }
  }
  else
  {
    id v20 = 0;
    if (![(PBUIWallpaperView *)self _needsFallbackImageForBackdropGeneratedImage:0])goto LABEL_13; {
  }
    }
  double v22 = *MEMORY[0x1E4F1DB30];
  double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_9:
  -[PBUIWallpaperView _fallbackImageWithOriginalSize:](self, "_fallbackImageWithOriginalSize:", v22, v24);
  id v20 = objc_claimAutoreleasedReturnValue();
  if ([v20 CGImage])
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke_2;
    v32[3] = &unk_1E62B3A90;
    id v33 = v17;
    BOOL v34 = v6;
    double v25 = objc_msgSend(v20, "pui_imageByManipulatingInDeviceColorSpaceWithBlock:", v32);
    v26 = v25;
    if (v25)
    {
      id v27 = v25;

      id v20 = v27;
    }
  }
LABEL_13:

  return v20;
}

id __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 104))
  {
    long long v3 = *(_OWORD *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 40);
    long long v13 = v3;
    long long v4 = *(_OWORD *)(a1 + 88);
    long long v14 = *(_OWORD *)(a1 + 72);
    long long v15 = v4;
    id v5 = a2;
    BOOL v6 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v12);
    BOOL v7 = objc_msgSend(v5, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v6, 0, 1, 1, v12, v13, v14, v15);

    id v8 = [v7 _applyBackdropViewSettings:*(void *)(a1 + 32) includeTints:1 includeBlur:0];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = a2;
    id v8 = [v10 _applyBackdropViewSettings:v9 includeTints:0 includeBlur:1 allowImageResizing:1];
  }

  return v8;
}

uint64_t __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _applyBackdropViewSettings:*(void *)(a1 + 32) includeTints:*(unsigned __int8 *)(a1 + 40) includeBlur:0 allowImageResizing:0];
}

- (id)_material_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 traitCollection:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = PBUILogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v26 = *(_OWORD *)&a4->var2;
    *(_OWORD *)long long v29 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v29[16] = v26;
    long long v27 = *(_OWORD *)&a4->var6;
    long long v30 = *(_OWORD *)&a4->var4;
    long long v31 = v27;
    double v28 = PBUIStringForWallpaperBackdropParameters((double *)v29);
    *(_DWORD *)long long v29 = 138543618;
    *(void *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2114;
    *(void *)&v29[14] = v28;
    _os_log_debug_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEBUG, "Generating new image via material view for view: %{public}@, backdrop parameters: %{public}@", v29, 0x16u);
  }
  int64_t var7 = a4->var7;
  if ((unint64_t)(var7 - 1) < 2)
  {
    uint64_t v15 = [v10 userInterfaceStyle];
    double v13 = 8.0;
LABEL_9:
    long long v14 = soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_0(v15);
    goto LABEL_10;
  }
  double v13 = 1.0;
  if (!var7)
  {
    uint64_t v15 = 1;
    goto LABEL_9;
  }
  if (var7 != 3)
  {
    long long v14 = 0;
LABEL_10:
    long long v16 = [[PBUIMaterialTreatment alloc] initWithRecipeName:v14 fromBundle:0];
    uint64_t v17 = [[PBUICodableImage alloc] initWithUIImage:v9 error:0];
    long long v18 = [[PBUITreatImageRequest alloc] initWithImage:v17 downscaleFactor:v16 treatment:v13];
    long long v19 = +[PBUICARemoteRenderer remoteRendererIfPossible];
    id v20 = [v19 renderRequest:v18 error:0];

    double v21 = (void *)MEMORY[0x1E4F42A80];
    [v9 scale];
    double v23 = objc_msgSend(v21, "pui_imageWithIOSurface:scale:orientation:", v20, objc_msgSend(v9, "imageOrientation"), v22);
    double v24 = objc_msgSend(v23, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 1);

    return v24;
  }
  id result = (id)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (result) {
    -[PBUIWallpaperView _material_generateImageFromImage:forBackdropParameters:traitCollection:](a2);
  }
  __break(0);
  return result;
}

- (id)_cacheKeyForParameters:(id *)a3 includingTint:(BOOL)a4 downsampleFactor:(double)a5 traitCollection:(id)a6
{
  BOOL v7 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  long long v12 = [(PBUIWallpaperView *)self cacheGroup];
  double v13 = [(PBUIWallpaperView *)self cacheUniqueIdentifier];
  if ([v12 length])
  {
    switch(a3->var7)
    {
      case 0:
        if (!v7)
        {
          a3->var1 = 0;
          a3->var2 = 0;
        }
        double var3 = a3->var3;
        if (var3 == 1.79769313e308)
        {
          a3->double var3 = 0.0;
          double var3 = 0.0;
        }
        double var4 = a3->var4;
        if (var4 == 1.79769313e308)
        {
          a3->double var4 = 0.0;
          double var4 = 0.0;
        }
        double var5 = a3->var5;
        if (var5 == 1.79769313e308)
        {
          a3->double var5 = 0.0;
          double var5 = 0.0;
        }
        double var6 = a3->var6;
        if (var6 == 1.79769313e308)
        {
          a3->double var6 = 0.0;
          double var6 = 0.0;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%d:%d:%d:%1.1f:%d:%1.1f:%1.1f", a3->var0, a3->var1, a3->var2, *(void *)&var4, (int)var3, *(void *)&var5, *(void *)&var6);
        goto LABEL_22;
      case 1:
        uint64_t v20 = [v11 userInterfaceStyle];
        double v21 = @"light";
        if (v20 == 2) {
          double v21 = @"dark";
        }
        [NSString stringWithFormat:@"material_dock_%@", v21, v36, v37, v38, v39, v40, v41];
        goto LABEL_22;
      case 2:
        uint64_t v22 = [v11 userInterfaceStyle];
        double v23 = @"light";
        if (v22 == 2) {
          double v23 = @"dark";
        }
        [NSString stringWithFormat:@"icon_component_%@", v23, v36, v37, v38, v39, v40, v41];
        long long v19 = LABEL_22:;
        break;
      case 3:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](a2);
        }
        __break(0);
        JUMPOUT(0x1BC4F642CLL);
      default:
        long long v19 = 0;
        break;
    }
    if (self->_wallpaperMode <= 1uLL) {
      unint64_t wallpaperMode = 1;
    }
    else {
      unint64_t wallpaperMode = self->_wallpaperMode;
    }
    double v25 = PBUIStringForWallpaperMode(wallpaperMode);
    CC_SHA1("Nov 14 2024 22:52:13", 0x14u, md);
    long long v26 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:md length:20 freeWhenDone:0];
    long long v27 = objc_msgSend(v26, "pf_hexadecimalEncodedString");

    if ((unint64_t)[v27 length] >= 9)
    {
      uint64_t v28 = [v27 substringToIndex:8];

      long long v27 = (void *)v28;
    }
    long long v29 = NSString;
    uint64_t v30 = [(PBUIWallpaperView *)self variantCacheIdentifier];
    long long v31 = (void *)v30;
    uint64_t v32 = @"untinted";
    if (v7) {
      uint64_t v32 = @"tinted";
    }
    id v33 = @"#";
    if (v13) {
      id v33 = v13;
    }
    if (self->_needsWallpaperDimmingTreatment) {
      BOOL v34 = @"dimmed";
    }
    else {
      BOOL v34 = @"undimmed";
    }
    long long v18 = [v29 stringWithFormat:@"%@-%@-(%@)-%@-%.0f-%@-%@-%@-%@", v30, v12, v19, v32, *(void *)&a5, v33, v25, v34, v27];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (NSString)variantCacheIdentifier
{
  if ([(PBUIWallpaperView *)self sharesContentsAcrossVariants])
  {
    long long v3 = @"shared";
  }
  else
  {
    PBUIStringForWallpaperVariant([(PBUIWallpaperView *)self variant]);
    long long v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)cacheUniqueIdentifier
{
  return (NSString *)@"#";
}

- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3
{
  if (!a3) {
    return 1;
  }
  [a3 size];
  return v4 < 40.0 || v3 < 40.0;
}

- (id)_fallbackImageWithOriginalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(PBUIWallpaperView *)self legibilitySettings];
  BOOL v6 = [v5 contentColor];

  if (!v6)
  {
    BOOL v6 = [MEMORY[0x1E4F428B8] blackColor];
  }
  double v7 = height / width;
  if (width == 0.0) {
    double v7 = 1.0;
  }
  if (v7 <= 0.0) {
    double v8 = 40.0;
  }
  else {
    double v8 = v7 * 40.0;
  }
  id v9 = [MEMORY[0x1E4F42A60] defaultFormat];
  [v9 setOpaque:1];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v9, v8, 40.0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PBUIWallpaperView__fallbackImageWithOriginalSize___block_invoke;
  v14[3] = &unk_1E62B3AB8;
  id v15 = v6;
  double v16 = v8;
  uint64_t v17 = 0x4044000000000000;
  id v11 = v6;
  long long v12 = [v10 imageWithActions:v14];

  return v12;
}

void __52__PBUIWallpaperView__fallbackImageWithOriginalSize___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) set];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = 0;
  uint64_t v5 = 0;

  UIRectFill(*(CGRect *)&v4);
}

- (id)_displayedImage
{
  return 0;
}

- (UIImage)wallpaperImage
{
  return 0;
}

- (BOOL)wantsRasterization
{
  return self->_wantsRasterization;
}

- (BOOL)needsImmediateLayoutBeforeRotation
{
  return 1;
}

- (BOOL)hasContentOutsideVisibleBounds
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  double v7 = (PBUIWallpaperPrototypeSettings *)a3;
  id v6 = a4;
  if ((PBUIWallpaperPrototypeSettings *)self->_parallaxSettings == v7)
  {
    [(PBUIWallpaperView *)self _applyParallaxSettings];
  }
  else if (self->_wallpaperSettings == v7 {
         && (([v6 isEqualToString:@"replaceBlurs"] & 1) != 0
  }
          || [v6 isEqualToString:@"blurReplacementMode"]))
  {
    [(PBUIWallpaperView *)self _notifyBlursInvalidated];
  }
}

- (BOOL)_isVisible
{
  if ([(PBUIWallpaperView *)self isHidden]) {
    return 0;
  }
  uint64_t v4 = [(PBUIWallpaperView *)self window];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_notifyBlursInvalidated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
  [WeakRetained wallpaperViewDidInvalidateBlurs:self];
}

- (void)_beginDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  self->_int64_t disallowRasterizationBlockCount = disallowRasterizationBlockCount + 1;
  if (!disallowRasterizationBlockCount) {
    [(PBUIWallpaperView *)self _updateRasterizationState];
  }
}

- (void)_endDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  if (disallowRasterizationBlockCount <= 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PBUIWallpaperView.m" lineNumber:893 description:@"unpaired disallowRastrizationBlock decrement"];

    int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  }
  int64_t v4 = disallowRasterizationBlockCount - 1;
  self->_int64_t disallowRasterizationBlockCount = v4;
  if (!v4)
  {
    [(PBUIWallpaperView *)self _updateRasterizationState];
  }
}

- (BOOL)_isParallaxMotionEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  BOOL v3 = [v2 deviceClass] == 2;

  return v3;
}

- (void)_addParallax
{
  if (!self->_parallaxView)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    parallaxView = self->_parallaxView;
    self->_parallaxView = v3;

    [(PBUIWallpaperView *)self insertSubview:self->_parallaxView atIndex:0];
  }
  uint64_t v5 = [(UIView *)self->_contentView superview];
  id v6 = self->_parallaxView;

  if (v5 != v6) {
    [(UIView *)self->_parallaxView insertSubview:self->_contentView atIndex:0];
  }
  if ([(PBUIWallpaperView *)self _isParallaxMotionEnabled])
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v19 = v7;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    uint64_t v21 = *(void *)(MEMORY[0x1E4F39B10] + 80);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)id location = *MEMORY[0x1E4F39B10];
    long long v17 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v24 = v9;
    [(PBUIWallpaperParallaxSettings *)self->_parallaxSettings perspectiveTransform];
    double v11 = v10 * -0.01;
    long long v12 = [(UIView *)self->_parallaxView layer];
    double v22 = v11;
    [v12 setTransform:location];

    objc_initWeak(location, self);
    double v13 = (void *)MEMORY[0x1E4F42FF0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__PBUIWallpaperView__addParallax__block_invoke;
    v14[3] = &unk_1E62B39F0;
    objc_copyWeak(&v15, location);
    [v13 animateWithDuration:251658240 delay:v14 options:0 animations:0.3 completion:0.0];
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  [(PBUIWallpaperView *)self _updateScaleFactor];
}

uint64_t __33__PBUIWallpaperView__addParallax__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    PBUIApplyParallaxSettingsToViewWithFactor(*((void **)WeakRetained + 62), *((void **)WeakRetained + 52), *((double *)WeakRetained + 71));
  }

  return MEMORY[0x1F4181820]();
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (BOOL)needsWallpaperDimmingTreatment
{
  return self->_needsWallpaperDimmingTreatment;
}

- (PBUIWallpaperViewDelegate)wallpaperDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperDelegate);

  return (PBUIWallpaperViewDelegate *)WeakRetained;
}

- (void)setWallpaperDelegate:(id)a3
{
}

- (UIImage)untreatedWallpaperImage
{
  return self->_untreatedWallpaperImage;
}

- (void)setUntreatedWallpaperImage:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (BOOL)continuousColorSamplingEnabled
{
  return self->_continuousColorSamplingEnabled;
}

- (void)setContinuousColorSamplingEnabled:(BOOL)a3
{
  self->_continuousColorSamplingEnabled = a3;
}

- (BOOL)wallpaperAnimationEnabled
{
  return self->_wallpaperAnimationEnabled;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (BOOL)sharesContentsAcrossVariants
{
  return self->_sharesContentsAcrossVariants;
}

- (void)setSharesContentsAcrossVariants:(BOOL)a3
{
  self->_sharesContentsAcrossVariants = a3;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (NSString)cacheGroup
{
  return self->_cacheGroup;
}

- (PBUIWallpaperViewInternalObserver)internalObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);

  return (PBUIWallpaperViewInternalObserver *)WeakRetained;
}

- (void)setInternalObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalObserver);
  objc_storeStrong((id *)&self->_cacheGroup, 0);
  objc_storeStrong((id *)&self->_wallpaperName, 0);
  objc_storeStrong((id *)&self->_untreatedWallpaperImage, 0);
  objc_destroyWeak((id *)&self->_wallpaperDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_colorSampleTimer, 0);
  objc_storeStrong((id *)&self->_lastAverageColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettingsProvider, 0);
  objc_storeStrong((id *)&self->_parallaxView, 0);

  objc_storeStrong((id *)&self->_wallpaperSettings, 0);
}

- (void)_generateImageFromImage:(const char *)a1 forBackdropParameters:includeTint:traitCollection:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);
}

- (void)_material_generateImageFromImage:(const char *)a1 forBackdropParameters:traitCollection:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);
}

- (void)_cacheKeyForParameters:(const char *)a1 includingTint:downsampleFactor:traitCollection:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);
}

@end