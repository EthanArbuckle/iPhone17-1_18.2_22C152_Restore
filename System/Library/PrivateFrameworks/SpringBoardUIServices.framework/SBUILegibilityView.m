@interface SBUILegibilityView
- (BOOL)_hideImageView;
- (BOOL)_hideShadowImageViewForStrength:(double *)a3;
- (BOOL)_updateContentImageView:(id)a3;
- (BOOL)_updateFilters;
- (BOOL)_updateOptions:(int64_t)a3;
- (BOOL)_updateSettings:(id)a3;
- (BOOL)_updateShadow;
- (BOOL)_updateStrength:(double)a3;
- (BOOL)backfillTemplateResults;
- (BOOL)hidesImage;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)usesColorFilters;
- (BOOL)usesSecondaryColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableDictionary)userInfo;
- (SBUILegibilityEngine)legibilityEngine;
- (SBUILegibilitySettings)legibilitySettings;
- (SBUILegibilityView)initWithFrame:(CGRect)a3;
- (SBUILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5;
- (UIEdgeInsets)hitTestEdgeInsets;
- (UIImage)image;
- (UIImage)origImage;
- (UIImage)shadowImage;
- (UIImage)strengthenedImage;
- (double)_imageViewAlpha;
- (double)_shadowImageViewAlphaForStrength:(double *)a3;
- (double)strength;
- (id)drawingColor;
- (id)shadowColor;
- (int64_t)options;
- (void)_cancelOperations;
- (void)_clearShadowAndMarkNeedsNew:(BOOL)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutImageView;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setBackfillTemplateResults:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesImage:(BOOL)a3;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3;
- (void)setImage:(id)a3;
- (void)setLegibilityEngine:(id)a3;
- (void)setStrength:(double)a3;
- (void)setUsesColorFilters:(BOOL)a3;
- (void)updateForChangedSettings:(id)a3;
- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4;
- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4 image:(id)a5 strength:(double)a6;
- (void)updateOrigImage:(id)a3 shadowImage:(id)a4 strengthenedShadowImage:(id)a5 settings:(id)a6 engine:(id)a7 isTemplate:(BOOL)a8 withStrength:(double *)a9 context:(id)a10;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBUILegibilityView

- (BOOL)_updateShadow
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBUILegibilityView *)self superview];
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  v5 = [(SBUILegibilityView *)self window];

  if (!v5 || !self->_needsUpdateShadow) {
    return 0;
  }
  v6 = self->_image;
  if (v6 && self->_legibilitySettings)
  {
    if (self->_strength <= 0.0)
    {
      [(SBUILegibilityContainerView *)self->_shadowImageView setImage:0];
    }
    else
    {
      v7 = SBLogLegibility();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

      double Current = 0.0;
      if (v8) {
        double Current = CFAbsoluteTimeGetCurrent();
      }
      char v25 = 0;
      v10 = [(SBUILegibilityView *)self legibilityEngine];
      [v10 executeLegibilityUpdateForContainer:self forImage:v6 settings:self->_legibilitySettings strength:&self->_strength engineResult:&v25];
      v11 = [(SBUILegibilityView *)self _screen];
      if (v11) {
        [(SBUILegibilityView *)self _screen];
      }
      else {
      v13 = [MEMORY[0x1E4F42D90] mainScreen];
      }
      [v13 scale];
      self->_appliedScale = v14;

      if (v25 && self->_backfillTemplateResults)
      {
        v15 = [v10 executeAsyncLegibilityUpdateForContainer:self image:v6 settings:self->_legibilitySettings strength:&self->_strength completion:0];
        runningAsyncOperations = self->_runningAsyncOperations;
        if (!runningAsyncOperations)
        {
          v17 = (NSMutableArray *)objc_opt_new();
          v18 = self->_runningAsyncOperations;
          self->_runningAsyncOperations = v17;

          runningAsyncOperations = self->_runningAsyncOperations;
        }
        [(NSMutableArray *)runningAsyncOperations addObject:v15];
      }
      v19 = SBLogLegibility();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

      if (v20)
      {
        double v21 = CFAbsoluteTimeGetCurrent();
        v22 = SBLogLegibility();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v24 = [(SBUILegibilityView *)self userInfo];
          *(_DWORD *)buf = 138412546;
          v27 = v24;
          __int16 v28 = 2048;
          double v29 = v21 - Current;
          _os_log_debug_impl(&dword_1A7607000, v22, OS_LOG_TYPE_DEBUG, "Legibility generation time (%@): %f", buf, 0x16u);
        }
      }
    }
    self->_needsUpdateShadow = 0;
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4 image:(id)a5 strength:(double)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v10 = (SBUILegibilitySettings *)a3;
  id v11 = a5;
  int v12 = BSEqualObjects();
  p_needsUpdateShadow = &self->_needsUpdateShadow;
  if (self->_needsUpdateShadow || v12 == 0)
  {
    BOOL *p_needsUpdateShadow = 1;
  }
  else
  {
    uint64_t v15 = [(SBUILegibilityContainerView *)self->_shadowImageView image];
    v16 = (void *)v15;
    if (v15)
    {
      v17 = [(SBUILegibilityContainerView *)self->_imageView image];
      if (v17) {
        BOOL v18 = self->_legibilitySettings != v10;
      }
      else {
        BOOL v18 = 1;
      }
      BOOL *p_needsUpdateShadow = v18;
    }
    else
    {
      BOOL *p_needsUpdateShadow = 1;
    }
  }
  BOOL v19 = [(SBUILegibilityView *)self _updateSettings:v10];
  BOOL v20 = [(SBUILegibilityView *)self _updateOptions:a4];
  BOOL v21 = [(SBUILegibilityView *)self _updateContentImageView:v11];

  if (v19 || v20 || v21 || *p_needsUpdateShadow)
  {
    [(SBUILegibilityView *)self _cancelOperations];
    self->_strength = a6;
    self->_appliedScale = 0.0;
    BOOL v22 = [(SBUILegibilityView *)self _updateShadow];
    BOOL v23 = [(SBUILegibilityView *)self _updateStrength:a6];
    BOOL v24 = [(SBUILegibilityView *)self _updateFilters];
    char v25 = SBLogLegibility();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v27 = [(SBUILegibilityView *)self userInfo];
      v28[0] = 67109890;
      v28[1] = v22;
      __int16 v29 = 1024;
      BOOL v30 = v23;
      __int16 v31 = 1024;
      BOOL v32 = v24;
      __int16 v33 = 2112;
      v34 = v27;
      _os_log_debug_impl(&dword_1A7607000, v25, OS_LOG_TYPE_DEBUG, "updateForChangedSettings committed! didUpdateShadow: %{BOOL}u -- didUpdateStrength: %{BOOL}u -- didUpdateFilters: %{BOOL}u -- userInfo: %@", (uint8_t *)v28, 0x1Eu);
    }
    [(SBUILegibilityView *)self setNeedsLayout];
    [(SBUILegibilityView *)self layoutIfNeeded];
    [(SBUILegibilityView *)self updateImage];
  }
  else
  {
    v26 = SBLogLegibility();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[SBUILegibilityView updateForChangedSettings:options:image:strength:]((unsigned __int8 *)&self->_needsUpdateShadow, self, v26);
    }
  }
}

- (BOOL)_updateOptions:(int64_t)a3
{
  unint64_t options = self->_options;
  if (options == a3) {
    return 0;
  }
  int v4 = a3;
  self->_unint64_t options = a3;
  BOOL v6 = [(SBUILegibilityView *)self usesColorFilters];
  char v7 = options ^ v4;
  if (((options ^ v4) & 1) == 0 && ((options >> 1) & 1) == v6) {
    return 0;
  }
  BOOL v8 = [(SBUILegibilityView *)self _updateFilters];
  if (v7) {
    [(SBUILegibilityView *)self updateImage];
  }
  return v8;
}

- (BOOL)_updateContentImageView:(id)a3
{
  id v5 = a3;
  [(SBUILegibilityContainerView *)self->_imageView setHidden:[(SBUILegibilityView *)self _hideImageView]];
  imageView = self->_imageView;
  [(SBUILegibilityView *)self _imageViewAlpha];
  -[SBUILegibilityContainerView setAlpha:](imageView, "setAlpha:");
  if (!v5)
  {
    [(SBUILegibilityContainerView *)self->_imageView setImage:0];
    [(SBUILegibilityContainerView *)self->_shadowImageView setImage:0];
    self->_appliedScale = 0.0;
    image = self->_image;
    self->_image = 0;

LABEL_11:
    BOOL v8 = 1;
    goto LABEL_12;
  }
  p_image = &self->_image;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImage *)*p_image size];
    double v11 = v10;
    double v13 = v12;
    [(SBUILegibilityContainerView *)self->_imageView setImage:*p_image];
    double v14 = [(SBUILegibilityContainerView *)self->_imageView image];
    [v14 size];
    double v16 = v15;
    double v18 = v17;

    if (v16 != v11 || v18 != v13) {
      [(SBUILegibilityView *)self layoutImageView];
    }
    [(SBUILegibilityView *)self setNeedsLayout];
    goto LABEL_11;
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (void)layoutImageView
{
  uint64_t v3 = [(SBUILegibilityView *)self traitCollection];
  [v3 displayScale];

  [(SBUILegibilityView *)self bounds];
  id v20 = [(SBUILegibilityView *)self image];
  [(SBUILegibilityContainerView *)self->_imageView frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (v20)
  {
    [v20 size];
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  if (!CGRectEqualToRect(v22, v23)) {
    -[SBUILegibilityContainerView setFrame:](self->_imageView, "setFrame:", v13, v15, v17, v19);
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v27 layoutSubviews];
  uint64_t v3 = [(SBUILegibilityView *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;

  [(SBUILegibilityView *)self bounds];
  double v6 = [(SBUILegibilityView *)self image];
  [(SBUILegibilityView *)self layoutImageView];
  if (([(SBUILegibilityShadowView *)self->_shadowImageView isHidden] & 1) == 0)
  {
    CGFloat v7 = [(SBUILegibilityContainerView *)self->_shadowImageView image];
    if (v7) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
    }
    else
    {
      legibilitySettings = self->_legibilitySettings;

      if (legibilitySettings)
      {
        [(SBUILegibilityShadowView *)self->_shadowImageView frame];
        CGFloat v25 = v11;
        CGFloat v26 = v10;
        CGFloat v13 = v12;
        CGFloat rect2 = v14;
        double v15 = [(SBUILegibilityView *)self legibilityEngine];
        double v16 = [(SBUILegibilityContainerView *)self->_shadowImageView image];
        [v15 calculateShadowImageViewSizeForOriginalImage:v6 shadowImage:v16 settings:self->_legibilitySettings];

        uint64_t v23 = v5;
        UIRectCenteredIntegralRectScale();
        double x = v28.origin.x;
        double y = v28.origin.y;
        double width = v28.size.width;
        double height = v28.size.height;
        v29.origin.double y = v25;
        v29.origin.double x = v26;
        v29.size.double width = v13;
        v29.size.double height = rect2;
        if (!CGRectEqualToRect(v28, v29)) {
          -[SBUILegibilityShadowView setFrame:](self->_shadowImageView, "setFrame:", x, y, width, height, v23);
        }
      }
    }
  }
  [(SBUILegibilityContainerView *)self->_imageView setHidden:[(SBUILegibilityView *)self _hideImageView]];
  imageView = self->_imageView;
  [(SBUILegibilityView *)self _imageViewAlpha];
  -[SBUILegibilityContainerView setAlpha:](imageView, "setAlpha:");
  [(SBUILegibilityShadowView *)self->_shadowImageView setHidden:[(SBUILegibilityView *)self _hideShadowImageViewForStrength:0]];
  shadowImageView = self->_shadowImageView;
  [(SBUILegibilityView *)self _shadowImageViewAlphaForStrength:0];
  -[SBUILegibilityShadowView setAlpha:](shadowImageView, "setAlpha:");
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)_hideShadowImageViewForStrength:(double *)a3
{
  p_strength = &self->_strength;
  if (a3) {
    p_strength = a3;
  }
  double v5 = *p_strength;
  char v6 = [(SBUILegibilityView *)self isHidden];
  BOOL result = 1;
  if ((v6 & 1) == 0 && v5 > 0.0)
  {
    [(SBUILegibilityView *)self alpha];
    return v8 <= 0.0;
  }
  return result;
}

- (BOOL)_hideImageView
{
  if (([(SBUILegibilityView *)self isHidden] & 1) != 0 || self->_hidesImage) {
    return 1;
  }
  [(SBUILegibilityView *)self alpha];
  return v4 <= 0.0;
}

- (double)_imageViewAlpha
{
  return (double)([(SBUILegibilityView *)self _hideImageView] ^ 1);
}

- (double)_shadowImageViewAlphaForStrength:(double *)a3
{
  return (double)([(SBUILegibilityView *)self _hideShadowImageViewForStrength:a3] ^ 1);
}

- (SBUILegibilityEngine)legibilityEngine
{
  legibilityEngine = self->_legibilityEngine;
  if (!legibilityEngine)
  {
    double v4 = +[SBUILegibilityDefaultEngine defaultEngine];
    double v5 = self->_legibilityEngine;
    self->_legibilityEngine = v4;

    [(SBUILegibilityView *)self _cancelOperations];
    legibilityEngine = self->_legibilityEngine;
  }
  return legibilityEngine;
}

- (BOOL)_updateSettings:(id)a3
{
  id v5 = a3;
  char v6 = SBUILegibilitySettingsAreEqual(v5, self->_legibilitySettings);
  if ((v6 & 1) == 0) {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
  }
  CGFloat v7 = [(SBUILegibilityContainerView *)self->_imageView legibilitySettings];
  char v8 = SBUILegibilitySettingsAreEqual(v5, v7);

  if (v8)
  {
    char v9 = v6 ^ 1;
  }
  else
  {
    [(SBUILegibilityContainerView *)self->_imageView setLegibilitySettings:v5];
    char v9 = 1;
  }
  double v10 = [(SBUILegibilityContainerView *)self->_shadowImageView legibilitySettings];
  char v11 = SBUILegibilitySettingsAreEqual(v5, v10);

  if ((v11 & 1) == 0)
  {
    [(SBUILegibilityContainerView *)self->_shadowImageView setLegibilitySettings:v5];
    char v9 = 1;
  }

  return v9;
}

- (void)updateOrigImage:(id)a3 shadowImage:(id)a4 strengthenedShadowImage:(id)a5 settings:(id)a6 engine:(id)a7 isTemplate:(BOOL)a8 withStrength:(double *)a9 context:(id)a10
{
  objc_super v27 = (UIImage *)a3;
  id v15 = a4;
  id v16 = a5;
  double v17 = (SBUILegibilitySettings *)a6;
  id v18 = a7;
  id v19 = a10;
  if (v19)
  {
    if ([(NSMutableArray *)self->_runningAsyncOperations containsObject:v19])
    {
      [(NSMutableArray *)self->_runningAsyncOperations removeObject:v19];
      if (![(NSMutableArray *)self->_runningAsyncOperations count])
      {
        runningAsyncOperations = self->_runningAsyncOperations;
        self->_runningAsyncOperations = 0;
      }
    }
  }
  image = self->_image;
  legibilitySettings = self->_legibilitySettings;
  id v23 = [(SBUILegibilityView *)self legibilityEngine];

  if (image == v27 && legibilitySettings == v17 && v23 == v18)
  {
    [(SBUILegibilityContainerView *)self->_shadowImageView setLegibilitySettings:v17];
    [(SBUILegibilityContainerView *)self->_shadowImageView setLegibilityEngine:v18];
    shadowImageView = self->_shadowImageView;
    if (v16 && a9)
    {
      [(SBUILegibilityShadowView *)shadowImageView setImage:v15 strengthenedImage:v16 strength:*a9];
    }
    else
    {
      [(SBUILegibilityContainerView *)shadowImageView setImage:v15];
      [(SBUILegibilityContainerView *)self->_shadowImageView setStrength:self->_strength];
    }
    [(SBUILegibilityView *)self setNeedsLayout];
    [(SBUILegibilityView *)self layoutIfNeeded];
  }
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v4 setHidden:a3];
  [(SBUILegibilityView *)self setNeedsLayout];
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v4 setAlpha:a3];
  [(SBUILegibilityView *)self setNeedsLayout];
}

- (BOOL)_updateStrength:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(SBUILegibilityContainerView *)self->_shadowImageView strength];
  double v6 = v5;
  if (self->_strength == v5) {
    return 0;
  }
  self->_strength = a3;
  char v8 = SBLogLegibility();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  double Current = 0.0;
  if (v9) {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  [(SBUILegibilityContainerView *)self->_shadowImageView setStrength:self->_strength];
  [(SBUILegibilityShadowView *)self->_shadowImageView setHidden:[(SBUILegibilityView *)self _hideShadowImageViewForStrength:0]];
  shadowImageView = self->_shadowImageView;
  [(SBUILegibilityView *)self _shadowImageViewAlphaForStrength:0];
  -[SBUILegibilityShadowView setAlpha:](shadowImageView, "setAlpha:");
  double v12 = SBLogLegibility();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    double v14 = CFAbsoluteTimeGetCurrent();
    id v15 = SBLogLegibility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(SBUILegibilityView *)self userInfo];
      int v17 = 138412546;
      id v18 = v16;
      __int16 v19 = 2048;
      double v20 = v14 - Current;
      _os_log_debug_impl(&dword_1A7607000, v15, OS_LOG_TYPE_DEBUG, "(%@) legibility strength application time: %f", (uint8_t *)&v17, 0x16u);
    }
  }
  return v6 != a3;
}

- (BOOL)_updateFilters
{
  BOOL v3 = [(SBUILegibilityContainerView *)self->_imageView updateOptions:self->_options];
  return v3 | [(SBUILegibilityContainerView *)self->_shadowImageView updateOptions:self->_options];
}

- (void)_cancelOperations
{
  if ([(NSMutableArray *)self->_runningAsyncOperations count])
  {
    [(NSMutableArray *)self->_runningAsyncOperations makeObjectsPerformSelector:sel_cancel];
    [(NSMutableArray *)self->_runningAsyncOperations removeAllObjects];
    runningAsyncOperations = self->_runningAsyncOperations;
    self->_runningAsyncOperations = 0;
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v3 didMoveToWindow];
  [(SBUILegibilityView *)self _redrawShadowForNewContainer];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v9 willMoveToWindow:v4];
  if (v4)
  {
    double v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;
    double appliedScale = self->_appliedScale;

    if (v7 != appliedScale) {
      [(SBUILegibilityView *)self _clearShadowAndMarkNeedsNew:0];
    }
  }
}

- (SBUILegibilityView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBUILegibilityView;
  objc_super v3 = -[SBUILegibilityView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    double v5 = [(SBUILegibilityView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v4->_unint64_t options = 2;
    uint64_t v6 = objc_opt_new();
    imageView = v4->_imageView;
    v4->_imageView = (SBUILegibilityContainerView *)v6;

    [(SBUILegibilityContainerView *)v4->_imageView updateOptions:v4->_options];
    uint64_t v8 = objc_opt_new();
    shadowImageView = v4->_shadowImageView;
    v4->_shadowImageView = (SBUILegibilityShadowView *)v8;

    [(SBUILegibilityContainerView *)v4->_shadowImageView updateOptions:v4->_options];
    [(SBUILegibilityView *)v4 addSubview:v4->_shadowImageView];
    [(SBUILegibilityView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (SBUILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 size];
  double v12 = -[SBUILegibilityView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v10, v11);
  BOOL v13 = v12;
  if (v12) {
    [(SBUILegibilityView *)v12 updateForChangedSettings:v8 options:2 image:v9 strength:a4];
  }

  return v13;
}

- (void)dealloc
{
  [(SBUILegibilityView *)self _cancelOperations];
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v3 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(SBUILegibilityView *)self hitTestEdgeInsets];
  if (v11 == *(double *)(MEMORY[0x1E4F437F8] + 8)
    && v8 == *MEMORY[0x1E4F437F8]
    && v10 == *(double *)(MEMORY[0x1E4F437F8] + 24)
    && v9 == *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)SBUILegibilityView;
    BOOL v29 = -[SBUILegibilityView pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    [(SBUILegibilityView *)self bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(SBUILegibilityView *)self hitTestEdgeInsets];
    CGFloat v24 = v18 + v23;
    CGFloat v27 = v20 - (v25 + v26);
    v34.size.double height = v22 - (v23 + v28);
    v34.origin.double x = v16 + v25;
    v34.origin.double y = v24;
    v34.size.double width = v27;
    v33.double x = x;
    v33.double y = y;
    BOOL v29 = CGRectContainsPoint(v34, v33);
  }
  BOOL v30 = v29;

  return v30;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = [(SBUILegibilityView *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v10 willMoveToSuperview:v4];
  if (v4)
  {
    double v5 = [v4 window];
    double v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
    double appliedScale = self->_appliedScale;

    if (v8 != appliedScale) {
      [(SBUILegibilityView *)self _clearShadowAndMarkNeedsNew:0];
    }
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  [(SBUILegibilityView *)&v3 didMoveToSuperview];
  [(SBUILegibilityView *)self _redrawShadowForNewContainer];
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    double v5 = self->_userInfo;
    self->_userInfo = v4;

    double v6 = self->_userInfo;
    double v7 = [MEMORY[0x1E4F29128] UUID];
    [(NSMutableDictionary *)v6 setObject:v7 forKey:@"UUID"];

    userInfo = self->_userInfo;
  }
  double v8 = userInfo;
  return v8;
}

- (void)setImage:(id)a3
{
}

- (void)setStrength:(double)a3
{
}

- (void)updateForChangedSettings:(id)a3
{
}

- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4
{
}

- (void)setHidesImage:(BOOL)a3
{
  self->_hidesImage = a3;
  [(SBUILegibilityView *)self _updateContentImageView:self->_image];
}

- (BOOL)usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return self->_options & 1;
}

- (id)drawingColor
{
  BOOL v3 = [(SBUILegibilityView *)self usesSecondaryColor];
  legibilitySettings = self->_legibilitySettings;
  if (v3) {
    [(SBUILegibilitySettings *)legibilitySettings secondaryColor];
  }
  else {
  double v5 = [(SBUILegibilitySettings *)legibilitySettings primaryColor];
  }
  return v5;
}

- (id)shadowColor
{
  return [(SBUILegibilitySettings *)self->_legibilitySettings shadowColor];
}

- (UIImage)shadowImage
{
  return [(SBUILegibilityContainerView *)self->_shadowImageView image];
}

- (UIImage)strengthenedImage
{
  return [(SBUILegibilityContainerView *)self->_shadowImageView strengthenedImage];
}

- (UIImage)origImage
{
  return self->_image;
}

- (void)setLegibilityEngine:(id)a3
{
  id v6 = a3;
  double v5 = self->_legibilityEngine;
  if (([(SBUILegibilityEngine *)v5 isEqual:v6] & 1) == 0)
  {
    if (v5)
    {
      [(SBUILegibilityView *)self _cancelOperations];
      objc_storeStrong((id *)&self->_legibilityEngine, a3);
      [(SBUILegibilityView *)self _clearShadowAndMarkNeedsNew:0];
      [(SBUILegibilityView *)self _updateShadow];
    }
    else
    {
      objc_storeStrong((id *)&self->_legibilityEngine, a3);
    }
  }
}

- (void)_clearShadowAndMarkNeedsNew:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SBUILegibilityContainerView *)self->_shadowImageView image];

  if (v5)
  {
    [(SBUILegibilityContainerView *)self->_shadowImageView setImage:0];
  }
  else if (!v3)
  {
    return;
  }
  self->_needsUpdateShadow = 1;
}

- (int64_t)options
{
  return self->_options;
}

- (double)strength
{
  return self->_strength;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void)setUsesColorFilters:(BOOL)a3
{
  self->_usesColorFilters = a3;
}

- (BOOL)backfillTemplateResults
{
  return self->_backfillTemplateResults;
}

- (void)setBackfillTemplateResults:(BOOL)a3
{
  self->_backfillTemplateResults = a3;
}

- (SBUILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_legibilityEngine, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_runningAsyncOperations, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

- (void)updateForChangedSettings:(NSObject *)a3 options:image:strength:.cold.1(unsigned __int8 *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = *a1;
  double v5 = [a2 userInfo];
  v6[0] = 67110146;
  v6[1] = 0;
  __int16 v7 = 1024;
  int v8 = 0;
  __int16 v9 = 1024;
  int v10 = 0;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2112;
  double v14 = v5;
  _os_log_debug_impl(&dword_1A7607000, a3, OS_LOG_TYPE_DEBUG, "updateForChangedSettings abandoned! settingsWereUpdated: %{BOOL}u -- optionsWereUpdated: %{BOOL}u -- contentWasUpdated: %{BOOL}u -- _needsUpdateShadow: %{BOOL}u -- userInfo: %@", (uint8_t *)v6, 0x24u);
}

@end