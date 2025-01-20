@interface NTKUtilityComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (id)_alarmImageProviderActive:(BOOL)a3;
+ (id)_preferredAdditionalFontSettings;
+ (id)_stopwatchImageProvider;
+ (id)_timerImageProvider;
+ (id)largeComplicationViewForType:(unint64_t)a3 narrow:(BOOL)a4;
+ (id)smallComplicationViewForType:(unint64_t)a3;
+ (int64_t)layoutOverride;
- (BOOL)alwaysEnforcePlatterInset;
- (BOOL)editing;
- (BOOL)isPlacementForTopBezelComplication;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldScaleAndFadeWhenHighlighting;
- (BOOL)shouldUseBackgroundPlatter;
- (BOOL)shouldUsePlatterInset;
- (BOOL)suppressesInternalColorOverrides;
- (BOOL)useAlternativePunctuation;
- (BOOL)useBlockyHighlightCorners;
- (BOOL)useRoundedFontDesign;
- (BOOL)usesLegibility;
- (CDComplicationDisplayObserver)displayObserver;
- (CGSize)maxSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKComplicationTemplate)complicationTemplate;
- (CLKDevice)device;
- (CLKFont)font;
- (NSDate)timeTravelDate;
- (NTKFaceColorScheme)colorScheme;
- (NTKUtilityComplicationView)initWithFrame:(CGRect)a3;
- (UIColor)accentColor;
- (UIColor)foregroundColor;
- (UIColor)overrideColor;
- (UIColor)platterColor;
- (UIColor)shadowColor;
- (UIEdgeInsets)touchEdgeInsets;
- (UIImageView)backgroundPlatter;
- (UIView)highlightView;
- (double)_imageViewOriginYWithBaseImageSize:(CGSize)a3 labelFrame:(CGRect)a4;
- (double)_widthThatFits;
- (double)editingRotationAngle;
- (double)fontSize;
- (double)fontWeight;
- (double)foregroundAlpha;
- (double)foregroundImageAlpha;
- (double)minimumWidth;
- (id)_backgroundPlatterImage;
- (id)_computedForegroundColor;
- (id)_computedPlatterColor;
- (id)_newCurvedCircularHighlightView;
- (id)_newCurvedPathHighlightView;
- (id)_newDigitalTimeLabelSubviewWithOptions:(unint64_t)a3;
- (id)_newHighlightView;
- (id)_newHighlightViewVariant:(unint64_t)a3;
- (id)_newImageViewSubview;
- (id)_newImageViewSubviewWithAlpha:(double)a3;
- (id)_newLabelSubviewWithFont:(id)a3 variant:(unint64_t)a4;
- (id)_newStandardCurvedLabelSubview;
- (id)_newStandardLabelSubview;
- (id)_newStandardLabelSubviewVariant:(unint64_t)a3;
- (id)_smallCapsFont;
- (id)_standardFont;
- (unint64_t)placement;
- (unint64_t)textLayoutStyle;
- (void)_applyColorScheme:(id)a3;
- (void)_computeForegroundAlpha;
- (void)_computeForegroundColor;
- (void)_computeForegroundImageAlpha;
- (void)_computePlatterColor;
- (void)_updateForTemplateChange;
- (void)_updateForegroundAlpha;
- (void)_updateForegroundColor;
- (void)_updateForegroundImageAlpha;
- (void)_updateImageViewAlpha:(id)a3;
- (void)_updateImageViewColor:(id)a3;
- (void)_updateLabelsForFontChange;
- (void)_updatePlatterColor;
- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4;
- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7;
- (void)layoutLabelVertically:(id)a3;
- (void)layoutSubviews;
- (void)setAccentColor:(id)a3;
- (void)setAlwaysEnforcePlatterInset:(BOOL)a3;
- (void)setBackgroundPlatter:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setDevice:(id)a3;
- (void)setDisplayObserver:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditingRotationAngle:(double)a3;
- (void)setFont:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setFontWeight:(double)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundImageAlpha:(double)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setOverrideColor:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setPlatterColor:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setShouldScaleAndFadeWhenHighlighting:(BOOL)a3;
- (void)setShouldUseBackgroundPlatter:(BOOL)a3;
- (void)setSuppressesInternalColorOverrides:(BOOL)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
- (void)setUseAlternativePunctuation:(BOOL)a3;
- (void)setUseBlockyHighlightCorners:(BOOL)a3;
- (void)setUseRoundedFontDesign:(BOOL)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKUtilityComplicationView

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v4 traitCollectionDidChange:a3];
  [(NTKUtilityComplicationView *)self setNeedsLayout];
}

+ (int64_t)layoutOverride
{
  return 1;
}

+ (id)smallComplicationViewForType:(unint64_t)a3
{
  if (a3)
  {
    v3 = (NTKUtilityComplicationView *)objc_alloc_init(0);
  }
  else
  {
    v3 = objc_alloc_init(NTKUtilityComplicationView);
    objc_super v4 = [(NTKUtilityComplicationView *)v3 device];
    _LayoutConstants_49(v4, v6);
    [(NTKUtilityComplicationView *)v3 setMinimumWidth:v7];

    [(NTKUtilityComplicationView *)v3 setHidden:1];
  }

  return v3;
}

+ (id)largeComplicationViewForType:(unint64_t)a3 narrow:(BOOL)a4
{
  if (a3)
  {
    if (!a4 || (objc_super v4 = (NTKUtilityComplicationView *)objc_alloc_init(0)) == 0) {
      objc_super v4 = (NTKUtilityComplicationView *)objc_alloc_init(0);
    }
  }
  else
  {
    objc_super v4 = objc_alloc_init(NTKUtilityComplicationView);
    v5 = [(NTKUtilityComplicationView *)v4 device];
    _LayoutConstants_49(v5, v7);
    [(NTKUtilityComplicationView *)v4 setMinimumWidth:v8];

    [(NTKUtilityComplicationView *)v4 setHidden:1];
  }

  return v4;
}

- (NTKUtilityComplicationView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)NTKUtilityComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = +[CLKRenderingContext sharedRenderingContext];
    v5 = [v4 device];
    [(NTKUtilityComplicationView *)v3 setDevice:v5];

    v6 = [(NTKUtilityComplicationView *)v3 device];
    v3->_foregroundAlpha = 0.7;

    double v7 = [(NTKUtilityComplicationView *)v3 device];
    v3->_foregroundImageAlpha = 0.7;

    double v8 = [(NTKUtilityComplicationView *)v3 device];
    _LayoutConstants_49(v8, v22);
    v3->_minimumWidth = v23;

    v3->_maxSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    uint64_t v9 = [(NTKUtilityComplicationView *)v3 _standardFont];
    font = v3->_font;
    v3->_font = (CLKFont *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:*(double *)off_1E62BD1C0];
    shadowColor = v3->_shadowColor;
    v3->_shadowColor = (UIColor *)v11;

    uint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
    foregroundColor = v3->_foregroundColor;
    v3->_foregroundColor = (UIColor *)v13;

    uint64_t v15 = NTKUtilityComplicationPlatterColor();
    platterColor = v3->_platterColor;
    v3->_platterColor = (UIColor *)v15;

    v3->_fontWeight = *(double *)MEMORY[0x1E4FB09D8];
    v17 = [(NTKUtilityComplicationView *)v3 device];
    _LayoutConstants_49(v17, v21);
    v3->_fontSize = v21[0];

    uint64_t v18 = [(NTKUtilityComplicationView *)v3 _newHighlightView];
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIView *)v18;

    v3->_useAlternativePunctuation = 1;
    [(NTKUtilityComplicationView *)v3 _computeForegroundColor];
    [(NTKUtilityComplicationView *)v3 _computePlatterColor];
    [(NTKUtilityComplicationView *)v3 _computeForegroundAlpha];
    [(NTKUtilityComplicationView *)v3 _computeForegroundImageAlpha];
  }
  return v3;
}

- (void)_updateForegroundColor
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__NTKUtilityComplicationView__updateForegroundColor__block_invoke;
  v7[3] = &unk_1E62C5068;
  v7[4] = self;
  [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v7];
  computedForegroundColor = self->_computedForegroundColor;
  objc_super v4 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v4, v6);
  v5 = [(UIColor *)computedForegroundColor colorWithAlphaComponent:v6[17]];

  if ([(NTKUtilityComplicationView *)self textLayoutStyle] == 1
    || [(NTKUtilityComplicationView *)self textLayoutStyle] == 2)
  {
    [(UIView *)self->_highlightView setTintColor:v5];
  }
  else
  {
    [(UIView *)self->_highlightView setBackgroundColor:v5];
  }
}

uint64_t __52__NTKUtilityComplicationView__updateForegroundColor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(*(void *)(a1 + 32) + 440)];
}

- (void)_computeForegroundColor
{
}

- (id)_computedForegroundColor
{
  return self->_computedForegroundColor;
}

- (void)_updatePlatterColor
{
}

- (void)_computePlatterColor
{
}

- (id)_computedPlatterColor
{
  return self->_computedPlatterColor;
}

- (double)foregroundAlpha
{
  if (!self->_highlighted) {
    return self->_foregroundAlpha;
  }
  [(NTKUtilityComplicationView *)self device];

  return 1.0;
}

- (void)setForegroundAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_foregroundAlpha = a3;
    [(NTKUtilityComplicationView *)self _computeForegroundAlpha];
    [(NTKUtilityComplicationView *)self _updateForegroundAlpha];
  }
}

- (void)_updateForegroundAlpha
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__NTKUtilityComplicationView__updateForegroundAlpha__block_invoke;
  v3[3] = &unk_1E62C5068;
  v3[4] = self;
  [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v3];
  [(NTKUtilityComplicationView *)self _applyForegroundAlpha];
}

void __52__NTKUtilityComplicationView__updateForegroundAlpha__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_1FCDEE418] & 1) == 0) {
    [v3 setAlpha:*(double *)(*(void *)(a1 + 32) + 456)];
  }
}

- (void)_computeForegroundAlpha
{
  self->_computedForegroundAlpha = self->_foregroundAlpha;
}

- (void)setPlatterColor:(id)a3
{
  id v5 = a3;
  if ((NTKEqualObjects(v5, self->_platterColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_platterColor, a3);
    [(NTKUtilityComplicationView *)self _computePlatterColor];
    [(NTKUtilityComplicationView *)self _updatePlatterColor];
  }
}

- (void)setForegroundImageAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_foregroundImageAlpha = a3;
    [(NTKUtilityComplicationView *)self _computeForegroundImageAlpha];
  }
}

- (void)_computeForegroundImageAlpha
{
  self->_computedForegroundImageAlpha = self->_foregroundImageAlpha;
}

- (void)_updateForegroundImageAlpha
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__NTKUtilityComplicationView__updateForegroundImageAlpha__block_invoke;
  v2[3] = &unk_1E62C9320;
  v2[4] = self;
  [(NTKUtilityComplicationView *)self _enumerateColoringStackedImagesViewsWithBlock:v2];
}

uint64_t __57__NTKUtilityComplicationView__updateForegroundImageAlpha__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(*(void *)(a1 + 32) + 464)];
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_foregroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    [(NTKUtilityComplicationView *)self _computeForegroundColor];
    [(NTKUtilityComplicationView *)self _updateForegroundColor];
  }
}

- (void)setShadowColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_shadowColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowColor, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__NTKUtilityComplicationView_setShadowColor___block_invoke;
    v6[3] = &unk_1E62C5068;
    id v7 = v5;
    [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v6];
  }
}

void __45__NTKUtilityComplicationView_setShadowColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1FCE01D28]) {
    [v3 setShadowColor:*(void *)(a1 + 32)];
  }
}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NTKUtilityComplicationView *)self device];
  double v8 = +[NTKFaceColorScheme colorSchemeForDevice:v7 withFaceColorPalette:v6 units:a4];

  [(NTKUtilityComplicationView *)self _applyColorScheme:v8];
  char v9 = [v6 isMulticolor];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NTKUtilityComplicationView_applyFaceColorPalette_units___block_invoke;
  v10[3] = &__block_descriptor_33_e35_v16__0__UIView_CLKUIColoringView__8l;
  char v11 = v9;
  [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v10];
}

void __58__NTKUtilityComplicationView_applyFaceColorPalette_units___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    double v3 = 0.0;
    if (!*(unsigned char *)(a1 + 32)) {
      double v3 = 1.0;
    }
    [v4 transitionToMonochromeWithFraction:v3];
  }
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  v14 = [(NTKUtilityComplicationView *)self device];
  LOBYTE(v17) = 0;
  uint64_t v15 = +[NTKFaceColorScheme interpolationForDevice:v14 fromFaceColorPalette:v13 toFaceColorPalette:v12 fraction:a6 units:a7 brightenUnits:0 overrideColor:a3 alternateHighlight:v17];
  [(NTKUtilityComplicationView *)self _applyColorScheme:v15];

  [v13 isMulticolor];
  [v12 isMulticolor];

  CLKInterpolateBetweenFloatsClipped();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__NTKUtilityComplicationView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke;
  v18[3] = &__block_descriptor_40_e35_v16__0__UIView_CLKUIColoringView__8l;
  v18[4] = v16;
  [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v18];
}

void __116__NTKUtilityComplicationView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    [v3 transitionToMonochromeWithFraction:*(double *)(a1 + 32)];
  }
}

- (void)_applyColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
  id v5 = a3;
  id v6 = [v5 foregroundColor];
  [(NTKUtilityComplicationView *)self setForegroundColor:v6];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NTKUtilityComplicationView__applyColorScheme___block_invoke;
  v7[3] = &unk_1E62C9320;
  v7[4] = self;
  [(NTKUtilityComplicationView *)self _enumerateColoringStackedImagesViewsWithBlock:v7];
}

uint64_t __48__NTKUtilityComplicationView__applyColorScheme___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateImageViewColor:a2];
}

- (void)setUsesLegibility:(BOOL)a3
{
  if (self->_usesLegibility != a3)
  {
    self->_usesLegibility = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__NTKUtilityComplicationView_setUsesLegibility___block_invoke;
    v3[3] = &__block_descriptor_33_e35_v16__0__UIView_CLKUIColoringView__8l;
    BOOL v4 = a3;
    [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v3];
  }
}

uint64_t __48__NTKUtilityComplicationView_setUsesLegibility___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUsesLegibility:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  p_font = &self->_font;
  if ((NTKEqualObjects(v5, self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    id v7 = [(id)objc_opt_class() _preferredAdditionalFontSettings];
    if (v7)
    {
      uint64_t v8 = [(CLKFont *)*p_font CLKFontByApplyingFeatureSettings:v7];
      char v9 = *p_font;
      *p_font = (CLKFont *)v8;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__NTKUtilityComplicationView_setFont___block_invoke;
    v10[3] = &unk_1E62C5068;
    void v10[4] = self;
    [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v10];
  }
}

void __38__NTKUtilityComplicationView_setFont___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setFont:*(void *)(*(void *)(a1 + 32) + 424)];
  }
}

- (void)setPlacement:(unint64_t)a3
{
  char v3 = a3;
  self->_placement = a3;
  p_touchEdgeInsets = &self->_touchEdgeInsets;
  id v6 = [(NTKUtilityComplicationView *)self device];
  p_touchEdgeInsets->top = NTKUtilityTouchEdgeInsetsForPlacementAndDevice(v3, v6);
  p_touchEdgeInsets->left = v7;
  p_touchEdgeInsets->bottom = v8;
  p_touchEdgeInsets->right = v9;

  [(NTKUtilityComplicationView *)self setNeedsLayout];
}

- (BOOL)isPlacementForTopBezelComplication
{
  return self->_placement < 2;
}

- (void)setShouldUseBackgroundPlatter:(BOOL)a3
{
  if (self->_shouldUseBackgroundPlatter != a3)
  {
    self->_BOOL shouldUseBackgroundPlatter = a3;
    BOOL v4 = [(UIView *)self->_highlightView layer];
    BOOL shouldUseBackgroundPlatter = self->_shouldUseBackgroundPlatter;
    id v6 = [(NTKUtilityComplicationView *)self device];
    CGFloat v7 = v6;
    if (shouldUseBackgroundPlatter)
    {
      _LayoutConstants_49(v6, v11);
      CGFloat v8 = (double *)&v12;
    }
    else
    {
      _LayoutConstants_49(v6, &v9);
      CGFloat v8 = (double *)&v10;
    }
    [v4 setCornerRadius:*v8];

    [(NTKUtilityComplicationView *)self setNeedsLayout];
  }
}

- (void)setAlwaysEnforcePlatterInset:(BOOL)a3
{
  if (self->_alwaysEnforcePlatterInset != a3)
  {
    self->_alwaysEnforcePlatterInset = a3;
    [(NTKUtilityComplicationView *)self setNeedsLayout];
  }
}

- (BOOL)shouldUsePlatterInset
{
  if ([(NTKUtilityComplicationView *)self shouldUseBackgroundPlatter]) {
    return 1;
  }

  return [(NTKUtilityComplicationView *)self alwaysEnforcePlatterInset];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(NTKUtilityComplicationView *)self _widthThatFits];
  double v5 = v4;
  id v6 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v6, v12);
  double v7 = v13;

  if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
  {
    CGFloat v8 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v8, v11);
    double v5 = v5 + v11[22] * 2.0;
  }
  double minimumWidth = self->_minimumWidth;
  if (v5 >= minimumWidth) {
    double minimumWidth = v5;
  }
  double v10 = v7;
  result.height = v10;
  result.width = minimumWidth;
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)NTKUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v41 layoutSubviews];
  [(NTKUtilityComplicationView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  backgroundPlatter = self->_backgroundPlatter;
  if (self->_shouldUseBackgroundPlatter)
  {
    if (!backgroundPlatter)
    {
      uint64_t v12 = [(NTKUtilityComplicationView *)self _backgroundPlatterImage];
      double v13 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
      v14 = self->_backgroundPlatter;
      self->_backgroundPlatter = v13;

      uint64_t v15 = self->_backgroundPlatter;
      uint64_t v16 = [(NTKUtilityComplicationView *)self _computedPlatterColor];
      [(UIImageView *)v15 setTintColor:v16];

      backgroundPlatter = self->_backgroundPlatter;
    }
    uint64_t v17 = [(UIImageView *)backgroundPlatter superview];

    if (!v17) {
      [(NTKUtilityComplicationView *)self insertSubview:self->_backgroundPlatter atIndex:0];
    }
    uint64_t v18 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v18, v39);
    v44.origin.double x = v4;
    v44.origin.double y = v6;
    v44.size.double width = v8;
    v44.size.double height = v10;
    CGRect v45 = CGRectInset(v44, 0.0, -v40);
    double x = v45.origin.x;
    double y = v45.origin.y;
    double width = v45.size.width;

    v22 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v22, v42);
    double v23 = v43;
    objc_super v24 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v24, v37);
    double v25 = v23 + v38 * 2.0;

    -[UIImageView setFrame:](self->_backgroundPlatter, "setFrame:", x, y, width, v25);
  }
  else
  {
    [(UIImageView *)backgroundPlatter removeFromSuperview];
  }
  v26 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v26, v35);
  CGFloat v27 = -v36;
  v28 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v28, v33);
  v46.origin.double x = v4;
  v46.origin.double y = v6;
  v46.size.double width = v8;
  v46.size.double height = v10;
  CGRect v47 = CGRectInset(v46, v27, -v34);
  double v29 = v47.origin.x;
  double v30 = v47.origin.y;
  double v31 = v47.size.width;
  double height = v47.size.height;

  -[UIView setFrame:](self->_highlightView, "setFrame:", v29, v30, v31, height);
}

- (id)_backgroundPlatterImage
{
  v2 = [(NTKUtilityComplicationView *)self device];
  double v3 = _UtilityPlatterBackgroundTemplateImage(v2);

  return v3;
}

- (void)layoutLabelVertically:(id)a3
{
  id v21 = a3;
  [(NTKUtilityComplicationView *)self bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v21 sizeToFit];
  [v21 frame];
  double v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.double width = v9;
  v23.size.double height = v11;
  double Height = CGRectGetHeight(v23);
  v24.origin.double x = v13;
  v24.origin.double y = v15;
  v24.size.double width = v17;
  v24.size.double height = v19;
  objc_msgSend(v21, "setFrame:", v13, v7 + (Height - CGRectGetHeight(v24)) * 0.5, v17, v19);
}

- (double)_imageViewOriginYWithBaseImageSize:(CGSize)a3 labelFrame:(CGRect)a4
{
  return CGRectGetMidY(a4) + a3.height * -0.5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKUtilityComplicationView *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)_updateImageViewAlpha:(id)a3
{
  usesLegibilitCGFloat y = self->_usesLegibility;
  id v5 = a3;
  [v5 setUsesLegibility:usesLegibility];
  [v5 setAlpha:self->_foregroundImageAlpha];
}

- (void)_updateImageViewColor:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NTKFaceColorScheme *)self->_colorScheme multicolorAlpha];
    objc_msgSend(v10, "setMulticolorAlpha:");
  }
  BOOL v4 = [(NTKFaceColorScheme *)self->_colorScheme containsOverrideFaceColor];
  id v5 = [v10 overrideColor];
  overrideColor = v5;
  if (!v5) {
    overrideColor = self->_overrideColor;
  }
  double v7 = overrideColor;

  if (v7) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [v10 setColor:v7];
  }
  else
  {
    double v9 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
    [v10 setColor:v9];
  }
}

- (void)setUseRoundedFontDesign:(BOOL)a3
{
  if (self->_useRoundedFontDesign != a3)
  {
    self->_useRoundedFontDesign = a3;
    [(NTKUtilityComplicationView *)self _updateLabelsForFontChange];
  }
}

- (void)setFontWeight:(double)a3
{
  if (self->_fontWeight != a3)
  {
    self->_fontWeight = a3;
    [(NTKUtilityComplicationView *)self _updateLabelsForFontChange];
  }
}

- (void)setFontSize:(double)a3
{
  if (self->_fontSize != a3)
  {
    self->_fontSize = a3;
    [(NTKUtilityComplicationView *)self _updateLabelsForFontChange];
  }
}

- (void)_updateLabelsForFontChange
{
  id v3 = [(NTKUtilityComplicationView *)self _standardFont];
  [(NTKUtilityComplicationView *)self setFont:v3];
}

- (void)setMaxSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_maxSize = &self->_maxSize;
  if ((CLKSizeEqualsSize() & 1) == 0)
  {
    p_maxSize->CGFloat width = width;
    p_maxSize->CGFloat height = height;
    [(NTKUtilityComplicationView *)self _updateContentForMaxSizeChange];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(NTKUtilityComplicationView *)self _updateContentForEditingChange];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    if ([(NTKUtilityComplicationView *)self shouldScaleAndFadeWhenHighlighting])
    {
      double v5 = 0.95;
      double v6 = 1.0;
      if (v3) {
        double v6 = 0.6;
      }
      else {
        double v5 = 1.0;
      }
      double v7 = v12;
      v12[1] = 3221225472;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[2] = __45__NTKUtilityComplicationView_setHighlighted___block_invoke;
      v12[3] = &unk_1E62C9390;
      if (v3) {
        double v8 = 0.1;
      }
      else {
        double v8 = 0.2;
      }
      v12[4] = self;
      *(double *)&v12[5] = v5;
      *(double *)&v12[6] = v6;
    }
    else
    {
      double v9 = 1.0;
      if (!v3) {
        double v9 = 0.0;
      }
      double v7 = aBlock;
      aBlock[1] = 3221225472;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[2] = __45__NTKUtilityComplicationView_setHighlighted___block_invoke_2;
      aBlock[3] = &unk_1E62C2950;
      if (v3) {
        double v8 = 0.0;
      }
      else {
        double v8 = 0.2;
      }
      aBlock[4] = self;
      *(double *)&aBlock[5] = v9;
    }
    id v10 = _Block_copy(v7);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v8];
  }
}

uint64_t __45__NTKUtilityComplicationView_setHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
}

uint64_t __45__NTKUtilityComplicationView_setHighlighted___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:*(double *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _applyForegroundAlpha];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  double v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    double v7 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    [(NTKUtilityComplicationView *)self _updateForTemplateChange];
    double v6 = v7;
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  p_timeTravelDate = &self->_timeTravelDate;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ([v6 isEqual:timeTravelDate]) {
      goto LABEL_17;
    }
    id v10 = *p_timeTravelDate;
    BOOL v12 = [(CLKComplicationTemplate *)self->_complicationTemplate timeTravelUpdateFrequency] == 2
       || v10 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0) {
      goto LABEL_17;
    }
    BOOL v12 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  if (*p_timeTravelDate
    && [(CLKComplicationTemplate *)self->_complicationTemplate timeTravelUpdateFrequency] == 2)
  {
    BOOL v12 = 1;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__NTKUtilityComplicationView_setTimeTravelDate_animated___block_invoke;
  v13[3] = &unk_1E62C5068;
  v13[4] = self;
  [(NTKUtilityComplicationView *)self _enumerateColoringViewsWithBlock:v13];
  if (v12) {
    [(NTKUtilityComplicationView *)self _updateForTemplateChange];
  }
LABEL_17:
}

void __57__NTKUtilityComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setInTimeTravel:*(void *)(*(void *)(a1 + 32) + 432) != 0];
  }
}

- (id)_newDigitalTimeLabelSubviewWithOptions:(unint64_t)a3
{
  CGAffineTransform v4 = +[CLKUITimeLabel labelWithOptions:a3 forDevice:self->_device];
  CGAffineTransform v5 = [v4 timeFormatter];
  [v5 setSuppressesDesignatorWhitespace:1];

  id v6 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
  [v4 setColor:v6];

  [(NTKUtilityComplicationView *)self foregroundAlpha];
  objc_msgSend(v4, "setAlpha:");
  double v7 = [(NTKUtilityComplicationView *)self _standardFont];
  double v8 = [(NTKUtilityComplicationView *)self _smallCapsFont];
  [v4 setTimeFont:v7 designatorFont:v8];

  [v4 setUserInteractionEnabled:0];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __69__NTKUtilityComplicationView__newDigitalTimeLabelSubviewWithOptions___block_invoke;
  double v13 = &unk_1E62C0068;
  objc_copyWeak(&v14, &location);
  [v4 setDidResizeHandler:&v10];
  -[NTKUtilityComplicationView addSubview:](self, "addSubview:", v4, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v4;
}

void __69__NTKUtilityComplicationView__newDigitalTimeLabelSubviewWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (id)_newLabelSubviewWithFont:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 2) {
    objc_opt_class();
  }
  double v7 = objc_opt_new();
  [v7 setFont:v6];
  [v7 setUsesLegibility:self->_usesLegibility];
  double v8 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
  [v7 setColor:v8];

  [v7 setShadowColor:self->_shadowColor];
  [(NTKUtilityComplicationView *)self foregroundAlpha];
  objc_msgSend(v7, "setAlpha:");
  [v7 setUppercase:1];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke;
  v12[3] = &unk_1E62C0040;
  objc_copyWeak(&v13, &location);
  [v7 setNowProvider:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke_2;
  v10[3] = &unk_1E62C0068;
  objc_copyWeak(&v11, &location);
  [v7 setNeedsResizeHandler:v10];
  [(NTKUtilityComplicationView *)self addSubview:v7];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

id __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  CGAffineTransform v5 = v4;

  return v5;
}

void __63__NTKUtilityComplicationView__newLabelSubviewWithFont_variant___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (id)_newStandardLabelSubviewVariant:(unint64_t)a3
{
  CGAffineTransform v5 = [(NTKUtilityComplicationView *)self _standardFont];
  id v6 = [(NTKUtilityComplicationView *)self _newLabelSubviewWithFont:v5 variant:a3];

  [v6 setInTimeTravel:self->_timeTravelDate != 0];
  return v6;
}

- (id)_newStandardLabelSubview
{
  return [(NTKUtilityComplicationView *)self _newStandardLabelSubviewVariant:0];
}

- (id)_newHighlightViewVariant:(unint64_t)a3
{
  CGAffineTransform v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v6, v14);
  double v7 = [v5 colorWithWhite:1.0 alpha:v15];

  if (a3)
  {
    double v8 = objc_opt_new();
    [v8 setTintColor:v7];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v8 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v10 = [v8 layer];
    id v11 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v11, v13);
    [v10 setCornerRadius:v13[19]];

    [v8 setBackgroundColor:v7];
  }
  [v8 setAlpha:0.0];
  [(NTKUtilityComplicationView *)self addSubview:v8];

  return v8;
}

- (id)_newHighlightView
{
  return [(NTKUtilityComplicationView *)self _newHighlightViewVariant:0];
}

- (id)_newStandardCurvedLabelSubview
{
  return [(NTKUtilityComplicationView *)self _newStandardLabelSubviewVariant:2];
}

- (id)_newCurvedCircularHighlightView
{
  return [(NTKUtilityComplicationView *)self _newHighlightViewVariant:1];
}

- (id)_newCurvedPathHighlightView
{
  return [(NTKUtilityComplicationView *)self _newHighlightViewVariant:2];
}

- (id)_newImageViewSubviewWithAlpha:(double)a3
{
  id v5 = objc_alloc_init((Class)off_1E62BDB50);
  id v6 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
  [v5 setColor:v6];

  [v5 setAlpha:a3];
  [(NTKUtilityComplicationView *)self addSubview:v5];
  return v5;
}

- (id)_newImageViewSubview
{
  [(NTKUtilityComplicationView *)self foregroundAlpha];

  return -[NTKUtilityComplicationView _newImageViewSubviewWithAlpha:](self, "_newImageViewSubviewWithAlpha:");
}

- (id)_standardFont
{
  double fontSize = self->_fontSize;
  double fontWeight = self->_fontWeight;
  if (self->_useRoundedFontDesign) {
    [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:fontSize design:fontWeight];
  }
  else {
  id v5 = [MEMORY[0x1E4F19A50] systemFontOfSize:fontSize weight:fontWeight];
  }
  id v6 = v5;
  if (self->_useAlternativePunctuation)
  {
    uint64_t v7 = [v5 CLKFontWithAlternativePunctuation];

    id v6 = (void *)v7;
  }

  return v6;
}

- (id)_smallCapsFont
{
  v2 = [(NTKUtilityComplicationView *)self _standardFont];
  id v3 = [v2 CLKFontWithLocalizedSmallCaps];

  return v3;
}

- (double)_widthThatFits
{
  return 0.0;
}

- (void)_updateForTemplateChange
{
  id v4 = [(NTKUtilityComplicationView *)self complicationTemplate];
  id v3 = [v4 tintColor];
  [(NTKUtilityComplicationView *)self setOverrideColor:v3];
}

+ (id)_preferredAdditionalFontSettings
{
  return 0;
}

+ (id)_timerImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_timerImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v5 = [v4 device];
  id v6 = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
  if (v5 != v6)
  {

    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  double v8 = [v7 device];
  uint64_t v9 = [v8 version];
  uint64_t v10 = _timerImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
  {
LABEL_5:
    id v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    BOOL v12 = [v11 device];
    objc_storeWeak(&_timerImageProvider___cachedDevice, v12);

    id v13 = objc_loadWeakRetained(&_timerImageProvider___cachedDevice);
    _timerImageProvider___previousCLKDeviceVersion = [v13 version];

    [MEMORY[0x1E4F19A90] sharedRenderingContext];
    [(id)objc_claimAutoreleasedReturnValue() device];
    objc_claimAutoreleasedReturnValue();
    __49__NTKUtilityComplicationView__timerImageProvider__block_invoke();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_timerImageProvider___lock);
  id v14 = (void *)_timerImageProvider_imageProvider;

  return v14;
}

void __49__NTKUtilityComplicationView__timerImageProvider__block_invoke()
{
}

+ (id)_alarmImageProviderActive:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_alarmImageProviderActive____lock);
  id WeakRetained = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
    if (v6 == v7)
    {
      double v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _alarmImageProviderActive____previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  BOOL v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v13 = [v12 device];
  objc_storeWeak(&_alarmImageProviderActive____cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_alarmImageProviderActive____cachedDevice);
  _alarmImageProviderActive____previousCLKDeviceVersion = [v14 version];

  double v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  double v16 = [v15 device];
  __56__NTKUtilityComplicationView__alarmImageProviderActive___block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_alarmImageProviderActive____lock);
  CGFloat v17 = (void *)_alarmImageProviderActive___imageProvider;

  return v17;
}

void __56__NTKUtilityComplicationView__alarmImageProviderActive___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
  v1 = (void *)_alarmImageProviderActive___imageProvider;
  _alarmImageProviderActive___imageProvider = v0;

  v2 = (void *)_alarmImageProviderActive___imageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

+ (id)_stopwatchImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_stopwatchImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
    if (v5 == v6)
    {
      id v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      double v8 = [v7 device];
      uint64_t v9 = [v8 version];
      uint64_t v10 = _stopwatchImageProvider___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  BOOL v12 = [v11 device];
  objc_storeWeak(&_stopwatchImageProvider___cachedDevice, v12);

  id v13 = objc_loadWeakRetained(&_stopwatchImageProvider___cachedDevice);
  _stopwatchImageProvider___previousCLKDeviceVersion = [v13 version];

  id v14 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  double v15 = [v14 device];
  __53__NTKUtilityComplicationView__stopwatchImageProvider__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_stopwatchImageProvider___lock);
  double v16 = (void *)_stopwatchImageProvider_imageProvider;

  return v16;
}

void __53__NTKUtilityComplicationView__stopwatchImageProvider__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"stopwatch"];
  v1 = (void *)_stopwatchImageProvider_imageProvider;
  _stopwatchImageProvider_imageProvider = v0;

  v2 = (void *)_stopwatchImageProvider_imageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);

  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->_textLayoutStyle = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)useAlternativePunctuation
{
  return self->_useAlternativePunctuation;
}

- (void)setUseAlternativePunctuation:(BOOL)a3
{
  self->_useAlternativePunctuation = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (double)foregroundImageAlpha
{
  return self->_foregroundImageAlpha;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (BOOL)shouldUseBackgroundPlatter
{
  return self->_shouldUseBackgroundPlatter;
}

- (BOOL)alwaysEnforcePlatterInset
{
  return self->_alwaysEnforcePlatterInset;
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (BOOL)useRoundedFontDesign
{
  return self->_useRoundedFontDesign;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (BOOL)useBlockyHighlightCorners
{
  return self->_useBlockyHighlightCorners;
}

- (void)setUseBlockyHighlightCorners:(BOOL)a3
{
  self->_useBlockyHighlightCorners = a3;
}

- (BOOL)shouldScaleAndFadeWhenHighlighting
{
  return self->_shouldScaleAndFadeWhenHighlighting;
}

- (void)setShouldScaleAndFadeWhenHighlighting:(BOOL)a3
{
  self->_shouldScaleAndFadeWhenHighlighting = a3;
}

- (double)editingRotationAngle
{
  return self->_editingRotationAngle;
}

- (void)setEditingRotationAngle:(double)a3
{
  self->_editingRotationAngle = a3;
}

- (BOOL)suppressesInternalColorOverrides
{
  return self->_suppressesInternalColorOverrides;
}

- (void)setSuppressesInternalColorOverrides:(BOOL)a3
{
  self->_suppressesInternalColorOverrides = a3;
}

- (UIImageView)backgroundPlatter
{
  return self->_backgroundPlatter;
}

- (void)setBackgroundPlatter:(id)a3
{
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->_double minimumWidth = a3;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (CLKFont)font
{
  return self->_font;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)editing
{
  return self->_editing;
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatter, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedPlatterColor, 0);
  objc_storeStrong((id *)&self->_computedForegroundColor, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end