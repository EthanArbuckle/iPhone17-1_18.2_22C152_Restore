@interface VKImageAnalysisButton
- (BOOL)didManuallySetBackgroundDiameter;
- (BOOL)prefersDarkGlyphWhenSelected;
- (BOOL)supportsDynamicType;
- (CABasicAnimation)_highlightedGlyphAnimation;
- (CGAffineTransform)_glyphTransformForRotation:(SEL)a3 highlighted:(double)a4;
- (CGRect)_selectedIndicatorBounds;
- (CGSize)intrinsicContentSize;
- (UIColor)cameraModeBackgroundColor;
- (UIFont)customSymbolFont;
- (UIView)_backgroundView;
- (UIView)_selectedBackgroundColorView;
- (UIView)_selectedBackgroundView;
- (UIVisualEffectView)_backgroundVisualEffectView;
- (UIVisualEffectView)_selectedBackgroundVisualEffectView;
- (VKImageAnalysisButton)initWithCoder:(id)a3;
- (VKImageAnalysisButton)initWithFrame:(CGRect)a3;
- (double)_highlightedGlyphScaleFactor;
- (double)_selectedIndicatorAlpha;
- (double)backgroundDiameter;
- (double)glyphRotation;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)traitChangeObserver;
- (unint64_t)function;
- (unint64_t)glyphConfiguration;
- (unint64_t)mode;
- (void)_commonVKImageAnalysisButtonInitialization;
- (void)_updateBackgroundColors;
- (void)_updateForTraitCollection;
- (void)_updateGlyph;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundDiameter:(double)a3;
- (void)setCameraModeBackgroundColor:(id)a3;
- (void)setCustomSymbolFont:(id)a3;
- (void)setDidManuallySetBackgroundDiameter:(BOOL)a3;
- (void)setFunction:(unint64_t)a3;
- (void)setGlyphConfiguration:(unint64_t)a3;
- (void)setGlyphRotation:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedGlyphScaleFactor:(double)a3 animation:(id)a4;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPrefersDarkGlyphWhenSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSupportsDynamicType:(BOOL)a3;
- (void)setTraitChangeObserver:(id)a3;
- (void)set_backgroundVisualEffectView:(id)a3;
- (void)set_highlightedGlyphAnimation:(id)a3;
- (void)set_highlightedGlyphScaleFactor:(double)a3;
- (void)set_selectedBackgroundColorView:(id)a3;
- (void)set_selectedBackgroundVisualEffectView:(id)a3;
- (void)setupForFunction:(unint64_t)a3;
@end

@implementation VKImageAnalysisButton

- (void)setHighlightedGlyphScaleFactor:(double)a3 animation:(id)a4
{
  id v6 = a4;
  [(VKImageAnalysisButton *)self set_highlightedGlyphScaleFactor:a3];
  [(VKImageAnalysisButton *)self set_highlightedGlyphAnimation:v6];
}

- (void)set_highlightedGlyphScaleFactor:(double)a3
{
  self->__highlightedGlyphScaleFactor = a3;
}

- (void)set_highlightedGlyphAnimation:(id)a3
{
}

- (VKImageAnalysisButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKImageAnalysisButton;
  v3 = -[VKImageAnalysisButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VKImageAnalysisButton *)v3 _commonVKImageAnalysisButtonInitialization];
  }
  return v4;
}

- (void)_commonVKImageAnalysisButtonInitialization
{
  v19[1] = *MEMORY[0x1E4F143B8];
  [(VKImageAnalysisButton *)self setPreferredBehavioralStyle:1];
  v3 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.3];
  cameraModeBackgroundColor = self->_cameraModeBackgroundColor;
  self->_cameraModeBackgroundColor = v3;

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v5;

  [(UIView *)self->__backgroundView setUserInteractionEnabled:0];
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  selectedBackgroundView = self->__selectedBackgroundView;
  self->__selectedBackgroundView = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F43028]);
  [v9 setAutoresizingMask:18];
  objc_storeStrong((id *)&self->__selectedBackgroundVisualEffectView, v9);
  [(UIView *)self->__selectedBackgroundView addSubview:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v10 setAutoresizingMask:18];
  v11 = [v9 contentView];
  [v11 addSubview:v10];

  [(VKImageAnalysisButton *)self set_selectedBackgroundColorView:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F43028]);
  [v12 setAutoresizingMask:18];
  objc_storeStrong((id *)&self->__backgroundVisualEffectView, v12);
  [(UIView *)self->__backgroundView addSubview:v12];
  [(UIView *)self->__selectedBackgroundView setUserInteractionEnabled:0];
  [(UIView *)self->__selectedBackgroundView setAlpha:0.0];
  self->_function = 0;
  self->_glyphConfiguration = 0;
  [(VKImageAnalysisButton *)self _updateForTraitCollection];
  self->__highlightedGlyphScaleFactor = 1.0;
  [(UIView *)self->__selectedBackgroundView setClipsToBounds:1];
  [(UIView *)self->__backgroundView setClipsToBounds:1];
  [(VKImageAnalysisButton *)self setClipsToBounds:1];
  [(VKImageAnalysisButton *)self addSubview:self->__backgroundView];
  [(VKImageAnalysisButton *)self addSubview:self->__selectedBackgroundView];
  [(VKImageAnalysisButton *)self _updateBackgroundColors];
  [(VKImageAnalysisButton *)self _updateGlyph];
  v19[0] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v14 = (id)[(VKImageAnalysisButton *)self registerForTraitChanges:v13 withTarget:self action:sel__updateForTraitCollection];

  [(VKImageAnalysisButton *)self setPointerInteractionEnabled:1];
  [(VKImageAnalysisButton *)self setMaximumContentSizeCategory:*MEMORY[0x1E4F43780]];
  [(VKImageAnalysisButton *)self setShowsLargeContentViewer:1];
  id v15 = objc_alloc_init(MEMORY[0x1E4F42B40]);
  [(VKImageAnalysisButton *)self addInteraction:v15];

  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v17 = (id)-[VKImageAnalysisButton registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v16, sel__updateForTraitCollection, v18[0]);
}

- (void)set_selectedBackgroundColorView:(id)a3
{
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKImageAnalysisButton;
  [(VKImageAnalysisButton *)&v4 setMaximumContentSizeCategory:a3];
  [(VKImageAnalysisButton *)self _updateForTraitCollection];
  [(VKImageAnalysisButton *)self _updateGlyph];
}

- (void)setGlyphRotation:(double)a3
{
  if (self->_glyphRotation != a3)
  {
    self->_glyphRotation = a3;
    [(VKImageAnalysisButton *)self _glyphTransformForRotation:[(VKImageAnalysisButton *)self isHighlighted] highlighted:a3];
    objc_super v4 = [(VKImageAnalysisButton *)self imageView];
    v5[0] = v5[3];
    v5[1] = v5[4];
    v5[2] = v5[5];
    [v4 setTransform:v5];
  }
}

- (void)layoutSubviews
{
  v3 = [(VKImageAnalysisButton *)self imageView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v27[0] = *MEMORY[0x1E4F1DAB8];
  v27[1] = v4;
  v27[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v27];
  v26.receiver = self;
  v26.super_class = (Class)VKImageAnalysisButton;
  [(VKImageAnalysisButton *)&v26 layoutSubviews];
  v5 = [(VKImageAnalysisButton *)self _backgroundView];
  objc_super v6 = [(VKImageAnalysisButton *)self _selectedBackgroundView];
  [v3 frame];
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v8, v10);
  [(VKImageAnalysisButton *)self glyphRotation];
  [(VKImageAnalysisButton *)self _glyphTransformForRotation:[(VKImageAnalysisButton *)self isHighlighted] highlighted:v11];
  v25[0] = v25[3];
  v25[1] = v25[4];
  v25[2] = v25[5];
  [v3 setTransform:v25];
  [(VKImageAnalysisButton *)self _selectedIndicatorBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v6, "setFrame:", v13, v15, v17, v19);
  v20 = [v5 layer];
  [v20 setCornerRadius:v17 * 0.5];

  v21 = [v6 layer];
  [v21 setCornerRadius:v17 * 0.5];

  v22 = [(VKImageAnalysisButton *)self layer];
  [v22 setCornerRadius:v17 * 0.5];

  v23 = [(VKImageAnalysisButton *)self _selectedBackgroundView];
  [(VKImageAnalysisButton *)self bringSubviewToFront:v23];

  v24 = [(VKImageAnalysisButton *)self imageView];
  [(VKImageAnalysisButton *)self bringSubviewToFront:v24];
}

- (UIView)_selectedBackgroundView
{
  return self->__selectedBackgroundView;
}

- (double)glyphRotation
{
  return self->_glyphRotation;
}

- (CGRect)_selectedIndicatorBounds
{
  [(VKImageAnalysisButton *)self intrinsicContentSize];
  [(VKImageAnalysisButton *)self bounds];
  v3 = [(VKImageAnalysisButton *)self window];
  long long v4 = [v3 screen];
  [v4 scale];
  UIRectCenteredIntegralRectScale();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_updateBackgroundColors
{
  unint64_t v3 = [(VKImageAnalysisButton *)self function];
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      id v8 = 0;
      double v5 = 0;
    }
    else
    {
      double v5 = [(VKImageAnalysisButton *)self tintColor];
      id v8 = [(VKImageAnalysisButton *)self cameraModeBackgroundColor];
    }
  }
  else
  {
    long long v4 = [(VKImageAnalysisButton *)self tintColor];
    double v5 = [v4 colorWithAlphaComponent:0.85];

    id v8 = 0;
  }
  double v6 = [(VKImageAnalysisButton *)self _selectedBackgroundColorView];
  [v6 setBackgroundColor:v5];

  double v7 = [(VKImageAnalysisButton *)self _backgroundView];
  [v7 setBackgroundColor:v8];
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (unint64_t)function
{
  return self->_function;
}

- (UIColor)cameraModeBackgroundColor
{
  return self->_cameraModeBackgroundColor;
}

- (UIView)_selectedBackgroundColorView
{
  return self->__selectedBackgroundColorView;
}

- (void)_updateForTraitCollection
{
  if ([(VKImageAnalysisButton *)self supportsDynamicType]) {
    [(VKImageAnalysisButton *)self _updateGlyph];
  }
  if (![(VKImageAnalysisButton *)self didManuallySetBackgroundDiameter])
  {
    id v5 = [(VKImageAnalysisButton *)self traitCollection];
    if (objc_msgSend(v5, "vk_shouldUseLargeButtons"))
    {
      double v3 = 50.0;
    }
    else if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad"))
    {
      int v4 = objc_msgSend(v5, "vk_hasCompactWidth");
      double v3 = 40.0;
      if (v4) {
        double v3 = 37.0;
      }
    }
    else
    {
      double v3 = 37.0;
    }
    if (self->_backgroundDiameter != v3)
    {
      self->_backgroundDiameter = v3;
      [(VKImageAnalysisButton *)self setNeedsLayout];
    }
  }
}

- (CGAffineTransform)_glyphTransformForRotation:(SEL)a3 highlighted:(double)a4
{
  BOOL v5 = a5;
  [(VKImageAnalysisButton *)self _highlightedGlyphScaleFactor];
  double v10 = v9;
  if (v5) {
    double v11 = v9;
  }
  else {
    double v11 = 1.0;
  }
  if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad"))
  {
    [(VKImageAnalysisButton *)self backgroundDiameter];
    if (v10 == 1.0 && v12 != 37.0) {
      double v11 = v11 * 1.08108108;
    }
  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeRotation(&v18, a4);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v11, v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v18;
  CGAffineTransform v15 = v17;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (double)_highlightedGlyphScaleFactor
{
  return self->__highlightedGlyphScaleFactor;
}

- (BOOL)didManuallySetBackgroundDiameter
{
  return self->_didManuallySetBackgroundDiameter;
}

- (void)_updateGlyph
{
  double v3 = [MEMORY[0x1E4F428B8] whiteColor];
  if ([(VKImageAnalysisButton *)self prefersDarkGlyphWhenSelected])
  {
    id v4 = [MEMORY[0x1E4F428B8] blackColor];
  }
  else
  {
    id v4 = v3;
  }
  BOOL v5 = v4;
  unint64_t v6 = [(VKImageAnalysisButton *)self glyphConfiguration];
  if (v6 == 1)
  {
    double v7 = (void *)MEMORY[0x1E4F438C8];
    goto LABEL_8;
  }
  if (!v6)
  {
    double v7 = (void *)MEMORY[0x1E4F43870];
LABEL_8:
    id v8 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*v7 scale:3];
    goto LABEL_10;
  }
  id v8 = 0;
LABEL_10:
  double v9 = [(VKImageAnalysisButton *)self customSymbolFont];

  if (v9)
  {
    double v10 = [(VKImageAnalysisButton *)self customSymbolFont];
    [MEMORY[0x1E4F42A30] defaultFontSize];
    double v11 = objc_msgSend(v10, "fontWithSize:");

    uint64_t v12 = [MEMORY[0x1E4F42A98] configurationWithFont:v11];

    id v8 = (void *)v12;
  }
  unint64_t v13 = [(VKImageAnalysisButton *)self mode];
  if (v13 == 2)
  {
    CGAffineTransform v15 = @"appclip";
    int v14 = 1;
  }
  else if (v13 == 1)
  {
    int v14 = 0;
    CGAffineTransform v15 = @"qrcode.viewfinder";
  }
  else
  {
    int v14 = 0;
    if (v13) {
      CGAffineTransform v15 = 0;
    }
    else {
      CGAffineTransform v15 = @"text.viewfinder";
    }
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__20;
  v43 = __Block_byref_object_dispose__20;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__20;
  v37 = __Block_byref_object_dispose__20;
  id v38 = 0;
  if (![(VKImageAnalysisButton *)self supportsDynamicType])
  {
    v25 = [(VKImageAnalysisButton *)self traitCollection];
    double v16 = objc_msgSend(v25, "vk_traitCollectionWithContentSize:", *MEMORY[0x1E4F437B0]);

    if (v14) {
      goto LABEL_21;
    }
LABEL_23:
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __37__VKImageAnalysisButton__updateGlyph__block_invoke;
    v26[3] = &unk_1E6BF3E20;
    v27 = v15;
    id v18 = v8;
    id v28 = v18;
    v31 = &v39;
    id v29 = v3;
    v32 = &v33;
    id v30 = v5;
    objc_msgSend(v16, "vk_performAsCurrent:", v26);

    v22 = v27;
    goto LABEL_24;
  }
  double v16 = [(VKImageAnalysisButton *)self traitCollection];
  if (!v14) {
    goto LABEL_23;
  }
LABEL_21:
  CGAffineTransform v17 = [MEMORY[0x1E4F42A98] configurationWithHierarchicalColor:v3];
  id v18 = [v8 configurationByApplyingConfiguration:v17];

  uint64_t v19 = [MEMORY[0x1E4F42A80] systemImageNamed:v15 withConfiguration:v18];
  v20 = (void *)v40[5];
  v40[5] = v19;

  v21 = [MEMORY[0x1E4F42A98] configurationWithHierarchicalColor:v5];
  v22 = [v18 configurationByApplyingConfiguration:v21];

  uint64_t v23 = [MEMORY[0x1E4F42A80] systemImageNamed:v15 withConfiguration:v22];
  v24 = (void *)v34[5];
  v34[5] = v23;

LABEL_24:
  [(VKImageAnalysisButton *)self setImage:v40[5] forState:0];
  [(VKImageAnalysisButton *)self setImage:v34[5] forState:4];
  [(VKImageAnalysisButton *)self setImage:v34[5] forState:5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
}

- (CGSize)intrinsicContentSize
{
  [(VKImageAnalysisButton *)self backgroundDiameter];
  double v4 = v3;
  [(VKImageAnalysisButton *)self backgroundDiameter];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)backgroundDiameter
{
  double backgroundDiameter = self->_backgroundDiameter;
  if (vk_isSeedBuild())
  {
    double v4 = [(VKImageAnalysisButton *)self traitCollection];
    int v5 = objc_msgSend(v4, "vk_isOptimizedForMac");

    if (v5) {
      return 26.0;
    }
  }
  if ([(VKImageAnalysisButton *)self supportsDynamicType])
  {
    double v6 = [(VKImageAnalysisButton *)self imageView];
    [v6 intrinsicContentSize];
    double v8 = v7;
    double v10 = v9;

    if (v8 >= v10) {
      double v11 = v8;
    }
    else {
      double v11 = v10;
    }
    return v11 + 12.0;
  }
  return backgroundDiameter;
}

- (BOOL)supportsDynamicType
{
  return self->_supportsDynamicType;
}

- (BOOL)prefersDarkGlyphWhenSelected
{
  return self->_prefersDarkGlyphWhenSelected;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)glyphConfiguration
{
  return self->_glyphConfiguration;
}

- (UIFont)customSymbolFont
{
  return self->_customSymbolFont;
}

- (void)setCameraModeBackgroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_cameraModeBackgroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cameraModeBackgroundColor, a3);
    [(VKImageAnalysisButton *)self _updateBackgroundColors];
  }
}

void __37__VKImageAnalysisButton__updateGlyph__block_invoke(void *a1)
{
  id v8 = [MEMORY[0x1E4F42A80] systemImageNamed:a1[4] withConfiguration:a1[5]];
  uint64_t v2 = [v8 imageWithTintColor:a1[6] renderingMode:1];
  uint64_t v3 = *(void *)(a1[8] + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [v8 imageWithTintColor:a1[7] renderingMode:1];
  uint64_t v6 = *(void *)(a1[9] + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setBackgroundDiameter:(double)a3
{
  if (self->_backgroundDiameter != a3)
  {
    self->_double backgroundDiameter = a3;
    [(VKImageAnalysisButton *)self setDidManuallySetBackgroundDiameter:1];
    [(VKImageAnalysisButton *)self setNeedsLayout];
  }
}

- (void)setPrefersDarkGlyphWhenSelected:(BOOL)a3
{
  if (self->_prefersDarkGlyphWhenSelected != a3)
  {
    self->_prefersDarkGlyphWhenSelected = a3;
    [(VKImageAnalysisButton *)self _updateGlyph];
  }
}

- (void)dealloc
{
  if (self->_traitChangeObserver) {
    -[VKImageAnalysisButton unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  }
  v3.receiver = self;
  v3.super_class = (Class)VKImageAnalysisButton;
  [(VKImageAnalysisButton *)&v3 dealloc];
}

- (VKImageAnalysisButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKImageAnalysisButton;
  objc_super v3 = [(VKImageAnalysisButton *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(VKImageAnalysisButton *)v3 _commonVKImageAnalysisButtonInitialization];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(VKImageAnalysisButton *)self isSelected];
  v7.receiver = self;
  v7.super_class = (Class)VKImageAnalysisButton;
  [(VKImageAnalysisButton *)&v7 setSelected:v3];
  if (v5 != v3)
  {
    objc_super v6 = [(VKImageAnalysisButton *)self _selectedBackgroundView];
    [v6 setAlpha:(double)v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(VKImageAnalysisButton *)self isHighlighted];
  if ([(VKImageAnalysisButton *)self function] != 2
    || [(VKImageAnalysisButton *)self mode] != 1 && [(VKImageAnalysisButton *)self mode] != 2)
  {
    v19.receiver = self;
    v19.super_class = (Class)VKImageAnalysisButton;
    [(VKImageAnalysisButton *)&v19 setHighlighted:v3];
  }
  [(VKImageAnalysisButton *)self _highlightedGlyphScaleFactor];
  if (v5 != v3)
  {
    double v7 = v6;
    if (v6 != 1.0)
    {
      id v8 = [(VKImageAnalysisButton *)self imageView];
      double v9 = [v8 layer];

      double v10 = [(VKImageAnalysisButton *)self _highlightedGlyphAnimation];
      double v11 = (void *)[v10 copy];

      if (v3) {
        double v12 = v7;
      }
      else {
        double v12 = 1.0;
      }
      unint64_t v13 = [NSNumber numberWithDouble:v12];
      if (v11)
      {
        uint64_t v14 = [v9 presentationLayer];
        CGAffineTransform v15 = (void *)v14;
        if (v14) {
          double v16 = (void *)v14;
        }
        else {
          double v16 = v9;
        }
        id v17 = v16;

        [v11 setKeyPath:@"transform.scale.xy"];
        id v18 = [v17 valueForKeyPath:@"transform.scale.xy"];
        [v11 setFromValue:v18];

        [v11 setToValue:v13];
        [v9 addAnimation:v11 forKey:@"VKImageAnalysisButtonHighlightScale"];
      }
      [v9 setValue:v13 forKeyPath:@"transform.scale.xy"];
    }
  }
}

- (double)_selectedIndicatorAlpha
{
  return 1.0;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(VKImageAnalysisButton *)self _updateGlyph];
    [(VKImageAnalysisButton *)self _updateBackgroundColors];
  }
}

- (void)setFunction:(unint64_t)a3
{
  self->_function = a3;
  -[VKImageAnalysisButton setupForFunction:](self, "setupForFunction:");
}

- (void)setupForFunction:(unint64_t)a3
{
  [(VKImageAnalysisButton *)self _updateGlyph];
  if (a3 - 1 > 1)
  {
    id v8 = 0;
    int v5 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F427D8] effectWithStyle:17];
    int v5 = [MEMORY[0x1E4F427D8] effectWithStyle:12];
  }
  double v6 = [(VKImageAnalysisButton *)self _backgroundVisualEffectView];
  [v6 setEffect:v8];

  double v7 = [(VKImageAnalysisButton *)self _selectedBackgroundVisualEffectView];
  [v7 setEffect:v5];

  [(VKImageAnalysisButton *)self _updateBackgroundColors];
  [(VKImageAnalysisButton *)self setNeedsLayout];
}

- (void)setCustomSymbolFont:(id)a3
{
  objc_storeStrong((id *)&self->_customSymbolFont, a3);
  [(VKImageAnalysisButton *)self _updateGlyph];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  double v6 = (void *)MEMORY[0x1E4F427D0];
  [(VKImageAnalysisButton *)self _selectedIndicatorBounds];
  double v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v5];
  double v9 = [MEMORY[0x1E4F42CA8] effectWithPreview:v8];
  double v10 = [MEMORY[0x1E4F42CC0] styleWithEffect:v9 shape:0];

  return v10;
}

- (void)setGlyphConfiguration:(unint64_t)a3
{
  self->_glyphConfiguration = a3;
}

- (void)setSupportsDynamicType:(BOOL)a3
{
  self->_supportsDynamicType = a3;
}

- (UIVisualEffectView)_selectedBackgroundVisualEffectView
{
  return self->__selectedBackgroundVisualEffectView;
}

- (void)set_selectedBackgroundVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)_backgroundVisualEffectView
{
  return self->__backgroundVisualEffectView;
}

- (void)set_backgroundVisualEffectView:(id)a3
{
}

- (CABasicAnimation)_highlightedGlyphAnimation
{
  return self->__highlightedGlyphAnimation;
}

- (void)setDidManuallySetBackgroundDiameter:(BOOL)a3
{
  self->_didManuallySetBackgroundDiameter = a3;
}

- (id)traitChangeObserver
{
  return self->_traitChangeObserver;
}

- (void)setTraitChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraModeBackgroundColor, 0);
  objc_storeStrong(&self->_traitChangeObserver, 0);
  objc_storeStrong((id *)&self->__highlightedGlyphAnimation, 0);
  objc_storeStrong((id *)&self->__backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundColorView, 0);
  objc_storeStrong((id *)&self->__selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_customSymbolFont, 0);
}

@end