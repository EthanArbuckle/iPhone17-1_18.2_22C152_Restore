@interface NTKModuleView
+ (double)_defaultCornerRadiusForDevice:(id)a3;
+ (double)cornerRadiusForComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (BOOL)shouldCancelTouchesInScrollview;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKFaceColorScheme)colorScheme;
- (NTKModuleView)initWithFrame:(CGRect)a3;
- (UIColor)foregroundColor;
- (UIColor)highlightBackgroundColor;
- (UIColor)overrideColor;
- (UIColor)secondaryForegroundColor;
- (UIView)contentView;
- (double)contentHeight;
- (double)contentHeightOffset;
- (double)highlightAlpha;
- (double)highlightCornerRadius;
- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4;
- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4 space:(double)a5 view:(id)a6;
- (void)_applyMonochromeTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5;
- (void)_enumerateAllForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateColors;
- (void)applyColorScheme:(id)a3;
- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4;
- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7;
- (void)layoutContainerView:(id)a3;
- (void)layoutSubviews;
- (void)naturalHorizontalLayoutForViewsAndSpacing:(id)a3 columnAlignmentSpacing:(BOOL)a4;
- (void)setColorScheme:(id)a3;
- (void)setContentHeight:(double)a3;
- (void)setContentHeightOffset:(double)a3;
- (void)setDevice:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHighlightAlpha:(double)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setHighlightCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverrideColor:(id)a3;
- (void)setSecondaryForegroundColor:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKModuleView

+ (double)_defaultCornerRadiusForDevice:(id)a3
{
  CLKValueForDeviceMetrics();
  return result;
}

+ (double)cornerRadiusForComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 12 || a3 == 7 || !a3) {
    CLKValueForDeviceMetrics();
  }
  else {
    [a1 _defaultCornerRadiusForDevice:v6];
  }
  double v8 = v7;

  return v8;
}

- (NTKModuleView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKModuleView;
  v3 = -[NTKModuleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CLKRenderingContext sharedRenderingContext];
    v5 = [v4 device];
    [(NTKModuleView *)v3 setDevice:v5];

    id v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v6;

    [(UIView *)v3->_highlightView setUserInteractionEnabled:0];
    [(UIView *)v3->_highlightView setHidden:1];
    if ([(CLKDevice *)v3->_device deviceCategory] != 1)
    {
      double v8 = [(UIView *)v3->_highlightView layer];
      [v8 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    }
    [(NTKModuleView *)v3 addSubview:v3->_highlightView];
    v9 = objc_alloc_init(NTKContainerView);
    contentView = v3->_contentView;
    v3->_contentView = v9;

    [(NTKContainerView *)v3->_contentView setUserInteractionEnabled:0];
    [(NTKContainerView *)v3->_contentView setLayoutDelegate:v3];
    [(NTKModuleView *)v3 addSubview:v3->_contentView];
    [(id)objc_opt_class() _defaultCornerRadiusForDevice:v3->_device];
    [(NTKModuleView *)v3 setHighlightCornerRadius:v11 + 3.0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKModuleView;
  [(NTKModuleView *)&v14 layoutSubviews];
  uint64_t v3 = [(NTKModuleView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = MEMORY[0x1C1874A70](v3);
  double v12 = v11 + self->_contentHeightOffset;
  -[NTKContainerView setBounds:](self->_contentView, "setBounds:", v5, v7, v9, self->_contentHeight);
  -[NTKContainerView setCenter:](self->_contentView, "setCenter:", v10, v12);
  highlightView = self->_highlightView;
  [(NTKModuleView *)self bounds];
  -[UIView setFrame:](highlightView, "setFrame:");
}

- (void)setHighlightAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_highlightAlpha = a3;
    [(UIView *)self->_highlightView setHidden:a3 <= 0.0];
    id v5 = [(UIColor *)self->_highlightBackgroundColor colorWithAlphaComponent:a3];
    [(UIView *)self->_highlightView setBackgroundColor:v5];
  }
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  char v12 = [v5 isEqual:self->_foregroundColor] ^ 1;
  if (*((unsigned char *)v10 + 24)
    || (v8[0] = MEMORY[0x1E4F143A8],
        v8[1] = 3221225472,
        v8[2] = __36__NTKModuleView_setForegroundColor___block_invoke,
        v8[3] = &unk_1E62C5040,
        v8[4] = self,
        v8[5] = &v9,
        [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v8], *((unsigned char *)v10 + 24)))
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__NTKModuleView_setForegroundColor___block_invoke_2;
    v6[3] = &unk_1E62C5068;
    id v7 = v5;
    [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v6];
  }
  _Block_object_dispose(&v9, 8);
}

void __36__NTKModuleView_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 color];
  if (v3)
  {
    double v4 = [v6 color];
    char v5 = [v4 isEqual:*(void *)(*(void *)(a1 + 32) + 488)];

    if ((v5 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

uint64_t __36__NTKModuleView_setForegroundColor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

- (void)setSecondaryForegroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_secondaryForegroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryForegroundColor, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__NTKModuleView_setSecondaryForegroundColor___block_invoke;
    v6[3] = &unk_1E62C5068;
    id v7 = v5;
    [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v6];
  }
}

uint64_t __45__NTKModuleView_setSecondaryForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

- (void)setHighlightCornerRadius:(double)a3
{
  if (self->_highlightCornerRadius != a3)
  {
    self->_highlightCornerRadius = a3;
    id v4 = [(UIView *)self->_highlightView layer];
    [v4 setCornerRadius:self->_highlightCornerRadius];
  }
}

- (void)_updateColors
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__NTKModuleView__updateColors__block_invoke;
  v4[3] = &unk_1E62C5068;
  v4[4] = self;
  [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__NTKModuleView__updateColors__block_invoke_2;
  v3[3] = &unk_1E62C5068;
  v3[4] = self;
  [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v3];
}

void __30__NTKModuleView__updateColors__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 foregroundColor];
  [v3 setColor:v4];
}

void __30__NTKModuleView__updateColors__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 secondaryForegroundColor];
  [v3 setColor:v4];
}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [v6 isMulticolor];
  double v8 = [(NTKModuleView *)self device];
  if (v7)
  {
    uint64_t v9 = [(NTKModuleView *)self overrideColor];
    id v10 = +[NTKFaceColorScheme colorSchemeForDevice:v8 withFaceColorPalette:v6 foregroundColor:v9 units:a4 alternateHighlight:0];

    id v6 = (id)v9;
  }
  else
  {
    id v10 = +[NTKFaceColorScheme colorSchemeForDevice:v8 withFaceColorPalette:v6 units:a4];
  }

  [(NTKModuleView *)self setColorScheme:v10];
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12 = a5;
  id v17 = a4;
  objc_super v13 = [(NTKModuleView *)self device];
  objc_super v14 = [(NTKModuleView *)self overrideColor];
  LOBYTE(v16) = 0;
  v15 = +[NTKFaceColorScheme interpolationForDevice:v13 fromFaceColorPalette:v17 toFaceColorPalette:v12 fraction:a6 units:a7 brightenUnits:v14 overrideColor:a3 alternateHighlight:v16];
  [(NTKModuleView *)self setColorScheme:v15];

  [(NTKModuleView *)self _applyMonochromeTransitionFraction:v17 fromFaceColorPalette:v12 toFaceColorPalette:a3];
}

- (void)_applyMonochromeTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (([v8 isMulticolor] & 1) != 0 || objc_msgSend(v9, "isMulticolor"))
  {
    if ([v9 isMulticolor] && !objc_msgSend(v8, "isMulticolor")) {
      a3 = 1.0 - a3;
    }
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__NTKModuleView__applyMonochromeTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke;
  v11[3] = &__block_descriptor_41_e35_v16__0__UIView_CLKUIColoringView__8l;
  char v12 = v10;
  *(double *)&v11[4] = a3;
  [(NTKModuleView *)self _enumerateAllForegroundColoringViewsWithBlock:v11];
}

void __92__NTKModuleView__applyMonochromeTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (*(unsigned char *)(a1 + 40)) {
      [v3 transitionToMonochromeWithFraction:*(double *)(a1 + 32)];
    }
    else {
      [v3 updateMonochromeColor];
    }
  }
}

- (void)setColorScheme:(id)a3
{
  id v5 = (NTKFaceColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    [(NTKModuleView *)self applyColorScheme:self->_colorScheme];
    id v5 = v6;
  }
}

- (void)applyColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [v4 foregroundColor];
  [(NTKModuleView *)self setForegroundColor:v5];

  id v6 = [v4 secondaryForegroundColor];
  [(NTKModuleView *)self setSecondaryForegroundColor:v6];

  int v7 = [v4 backgroundColor];
  [(NTKModuleView *)self setHighlightBackgroundColor:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NTKModuleView_applyColorScheme___block_invoke;
  v9[3] = &unk_1E62C5068;
  id v10 = v4;
  id v8 = v4;
  [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v9];
  [(NTKModuleView *)self _updateColors];
}

void __34__NTKModuleView_applyColorScheme___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) multicolorAlpha];
    objc_msgSend(v3, "setMulticolorAlpha:");
  }
}

- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v5 = NSNumber;
  id v6 = a4;
  int v7 = [v5 numberWithDouble:a3];
  v10[0] = v7;
  v10[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

- (id)viewsAndSpacingArrayForSpace:(double)a3 view:(id)a4 space:(double)a5 view:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  char v12 = [NSNumber numberWithDouble:a3];
  objc_super v13 = [v11 arrayWithObject:v12];

  if (v9 && ([v9 isHidden] & 1) == 0)
  {
    [v13 addObject:v9];
    objc_super v14 = [NSNumber numberWithDouble:a5];
    [v13 addObject:v14];
  }
  [v13 addObject:v10];

  return v13;
}

- (void)naturalHorizontalLayoutForViewsAndSpacing:(id)a3 columnAlignmentSpacing:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CGFloat Width = 0.0;
  if (CLKLayoutIsRTL())
  {
    [(NTKModuleView *)self bounds];
    CGFloat Width = CGRectGetWidth(v30);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    double v12 = Width;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v14 floatValue];
          double v16 = v15;
          int IsRTL = CLKLayoutIsRTL();
          double v18 = -v16;
          if (!IsRTL) {
            double v18 = v16;
          }
          double v12 = v12 + v18;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v14, "frame", (void)v24);
            double v19 = CGRectGetWidth(v31);
            double v20 = CLKLayoutIsRTL() ? v19 : 0.0;
            double v21 = v12 - v20;
            [v14 frame];
            [v14 setFrame:v21];
            double v12 = Width;
            if (!a4)
            {
              int v22 = CLKLayoutIsRTL();
              double v23 = -0.0;
              if (!v22) {
                double v23 = v19;
              }
              double v12 = v21 + v23;
            }
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)_enumerateAllForegroundColoringViewsWithBlock:(id)a3
{
  id v4 = a3;
  [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v4];
  [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NTKModuleView *)self isHighlighted];
  v11.receiver = self;
  v11.super_class = (Class)NTKModuleView;
  [(NTKModuleView *)&v11 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3) {
      double v6 = 0.0;
    }
    else {
      double v6 = 0.2;
    }
    if (v3) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    if (v3) {
      [(UIView *)self->_highlightView setHidden:0];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__NTKModuleView_setHighlighted___block_invoke;
    void v10[3] = &unk_1E62C2950;
    v10[4] = self;
    *(double *)&v10[5] = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__NTKModuleView_setHighlighted___block_invoke_2;
    v8[3] = &unk_1E62C50B0;
    BOOL v9 = v3;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v8 completion:v6];
  }
}

void __32__NTKModuleView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 464);
  id v3 = [*(id *)(v1 + 504) colorWithAlphaComponent:*(double *)(a1 + 40)];
  [v2 setBackgroundColor:v3];
}

uint64_t __32__NTKModuleView_setHighlighted___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(result + 40)) {
      return [*(id *)(*(void *)(result + 32) + 464) setHidden:1];
    }
  }
  return result;
}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (void)layoutContainerView:(id)a3
{
  kdebug_trace();
  [(NTKModuleView *)self _layoutContentView];
  kdebug_trace();
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__NTKModuleView_transitionToMonochromeWithFraction___block_invoke;
  v3[3] = &__block_descriptor_40_e35_v16__0__UIView_CLKUIColoringView__8l;
  *(double *)&v3[4] = a3;
  [(NTKModuleView *)self _enumerateAllForegroundColoringViewsWithBlock:v3];
}

void __52__NTKModuleView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transitionToMonochromeWithFraction:*(double *)(a1 + 32)];
  }
}

- (void)updateMonochromeColor
{
}

void __38__NTKModuleView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 updateMonochromeColor];
  }
}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)secondaryForegroundColor
{
  return self->_secondaryForegroundColor;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (double)contentHeightOffset
{
  return self->_contentHeightOffset;
}

- (void)setContentHeightOffset:(double)a3
{
  self->_contentHeightOffset = a3;
}

- (double)highlightAlpha
{
  return self->_highlightAlpha;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryForegroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->filterProvider);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end