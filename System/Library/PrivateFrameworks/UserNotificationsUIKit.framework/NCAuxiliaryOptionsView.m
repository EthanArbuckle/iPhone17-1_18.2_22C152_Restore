@interface NCAuxiliaryOptionsView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)auxiliaryOptionsVisible;
- (BSUIFontProvider)fontProvider;
- (CGRect)_optionsSummaryMeasuringFrameForBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCAuxiliaryOptionsView)init;
- (NCAuxiliaryOptionsView)initWithFrame:(CGRect)a3;
- (NSArray)auxiliaryOptionActions;
- (NSArray)auxiliaryOptionButtons;
- (NSString)auxiliaryOptionsBackgroundCompositingFilter;
- (NSString)auxiliaryOptionsSummaryText;
- (NSString)materialGroupNameBase;
- (UIColor)auxiliaryOptionsBackgroundColor;
- (UIColor)auxiliaryOptionsTextColor;
- (UIColor)materialTintColor;
- (double)_optionsButtonWidthForBounds:(CGRect)a3 auxiliaryOptionButtonsCount:(unint64_t)a4;
- (double)_optionsSummaryWidthForBounds:(CGRect)a3;
- (id)_defaultTextColor;
- (id)_newOptionsButton;
- (id)_preferredFontForAuxiliaryOptionsSummaryTextLabel;
- (id)_preferredFontForOptionButton;
- (int64_t)materialRecipe;
- (unint64_t)_summaryLabelNumberOfLinesForBoundsSize:(CGSize)a3;
- (void)_calculateOptionsSummaryLabelLayoutInfoForBoundsSize:(CGSize)a3;
- (void)_configureAuxiliaryOptionsSummaryTextLabelIfNecessary;
- (void)_configureOverlayIfNecessary;
- (void)_layoutOptionsButtons;
- (void)_layoutOptionsSummaryLabel;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setDefaultAttributes;
- (void)_updateTextAttributesForOptionsSummaryLabel;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAuxiliaryOptionActions:(id)a3;
- (void)setAuxiliaryOptionsBackgroundColor:(id)a3;
- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3;
- (void)setAuxiliaryOptionsSummaryText:(id)a3;
- (void)setAuxiliaryOptionsTextColor:(id)a3;
- (void)setAuxiliaryOptionsVisible:(BOOL)a3;
- (void)setFontProvider:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setMaterialTintColor:(id)a3;
@end

@implementation NCAuxiliaryOptionsView

- (NCAuxiliaryOptionsView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCAuxiliaryOptionsView;
  v2 = [(NCAuxiliaryOptionsView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCAuxiliaryOptionsView *)v2 _setDefaultAttributes];
  }
  return v3;
}

- (NCAuxiliaryOptionsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCAuxiliaryOptionsView;
  v3 = -[NCAuxiliaryOptionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NCAuxiliaryOptionsView *)v3 _setDefaultAttributes];
  }
  return v4;
}

- (BSUIFontProvider)fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCAuxiliaryOptionsView *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  objc_super v5 = self->_fontProvider;

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  if (a3.width > 0.0)
  {
    if (self->_optionsSummaryLabel)
    {
      BSRectWithSize();
      -[NCAuxiliaryOptionsView _optionsSummaryWidthForBounds:](self, "_optionsSummaryWidthForBounds:");
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:"));
      double v7 = v6 + 14.0;
    }
    else
    {
      double v7 = 14.0;
    }
    auxiliaryOptionButtons = self->_auxiliaryOptionButtons;
    if (auxiliaryOptionButtons)
    {
      v9 = [(NSArray *)auxiliaryOptionButtons firstObject];
      v10 = [v9 titleLabel];
      v11 = [v10 font];
      [v11 _scaledValueForValue:44.0];
      double v13 = v12;

      BSRectWithSize();
      -[NCAuxiliaryOptionsView _optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:](self, "_optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:", [(NSArray *)self->_auxiliaryOptionButtons count], v14, v15, v16, v17);
      double v19 = v18;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v20 = self->_auxiliaryOptionButtons;
      uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v24), "sizeThatFits:", v19, 1.79769313e308, (void)v28);
            if (v13 < v25) {
              double v13 = v25;
            }
            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v22);
      }

      double v26 = 18.0;
      if (!self->_optionsSummaryLabel) {
        double v26 = 0.0;
      }
      double v7 = v7 + v13 + v26;
    }
    double v4 = v7 + 14.0;
  }
  double v27 = width;
  result.height = v4;
  result.CGFloat width = v27;
  return result;
}

- (void)layoutSubviews
{
  [(NCAuxiliaryOptionsView *)self _configureOverlayIfNecessary];
  [(NCAuxiliaryOptionsView *)self _layoutOptionsSummaryLabel];

  [(NCAuxiliaryOptionsView *)self _layoutOptionsButtons];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  [(NCAuxiliaryOptionsView *)self _configureOverlayIfNecessary];
  objc_super v5 = [(UIView *)self->_overlayView layer];
  [v5 setMaskedCorners:12];

  overlayView = self->_overlayView;

  [(UIView *)overlayView _setContinuousCornerRadius:a3];
}

- (NSString)auxiliaryOptionsSummaryText
{
  return [(UILabel *)self->_optionsSummaryLabel text];
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  id v7 = a3;
  double v4 = [(NCAuxiliaryOptionsView *)self auxiliaryOptionsSummaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      [(NCAuxiliaryOptionsView *)self _configureAuxiliaryOptionsSummaryTextLabelIfNecessary];
      [(UILabel *)self->_optionsSummaryLabel setText:v7];
    }
    else
    {
      [(UILabel *)self->_optionsSummaryLabel removeFromSuperview];
      optionsSummaryLabel = self->_optionsSummaryLabel;
      self->_optionsSummaryLabel = 0;
    }
    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  if (self->_auxiliaryOptionsVisible != a3)
  {
    self->_auxiliaryOptionsVisible = a3;
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(NCAuxiliaryOptionsView *)self setAlpha:v4];
    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionActions:(id)a3
{
  id v19 = a3;
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, a3);
  unint64_t v5 = [v19 count];
  NSUInteger v6 = [(NSArray *)self->_auxiliaryOptionButtons count];
  location = &self->_auxiliaryOptionButtons;
  auxiliaryOptionButtons = self->_auxiliaryOptionButtons;
  if (auxiliaryOptionButtons) {
    id v8 = (id)[(NSArray *)auxiliaryOptionButtons mutableCopy];
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v9 = v8;
  if (v6 <= v5) {
    unint64_t v10 = v5;
  }
  else {
    unint64_t v10 = v6;
  }
  if (v10)
  {
    NSUInteger v11 = 0;
    while (v11 >= v5 || v6 > v11)
    {
      if (v11 < v5 || v6 <= v11)
      {
        objc_msgSend(v9, "objectAtIndex:", v11, location);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12) {
          goto LABEL_17;
        }
      }
      else
      {
        double v13 = [v9 lastObject];
        [v13 removeFromSuperview];

        [v9 removeLastObject];
      }
LABEL_18:
      if (v10 == ++v11) {
        goto LABEL_19;
      }
    }
    id v12 = [(NCAuxiliaryOptionsView *)self _newOptionsButton];
    [v9 addObject:v12];
    if (!v12) {
      goto LABEL_18;
    }
LABEL_17:
    double v14 = objc_msgSend(v19, "objectAtIndex:", v11, location);
    [v12 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
    [v12 addAction:v14 forControlEvents:64];
    double v15 = [v14 title];
    [v12 setTitle:v15];

    [v12 setTextColor:self->_auxiliaryOptionsTextColor];
    [v12 setBackgroundTintColor:self->_materialTintColor];
    [v12 setBackgroundMaterialRecipe:self->_materialRecipe];
    [v12 setMaterialGroupNameBase:self->_materialGroupNameBase];

    goto LABEL_18;
  }
LABEL_19:
  if (objc_msgSend(v19, "count", location)) {
    double v16 = v9;
  }
  else {
    double v16 = 0;
  }
  objc_storeStrong(locationa, v16);
  [(NCAuxiliaryOptionsView *)self setNeedsLayout];
}

- (void)setAuxiliaryOptionsTextColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v4)
    {
      unint64_t v5 = (UIColor *)v4;
    }
    else
    {
      unint64_t v5 = [(NCAuxiliaryOptionsView *)self _defaultTextColor];
    }
    auxiliaryOptionsTextColor = self->_auxiliaryOptionsTextColor;
    self->_auxiliaryOptionsTextColor = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_auxiliaryOptionButtons;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setTextColor:", self->_auxiliaryOptionsTextColor, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(UILabel *)self->_optionsSummaryLabel setTextColor:self->_auxiliaryOptionsTextColor];
    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionsBackgroundColor:(id)a3
{
  p_auxiliaryOptionsBackgroundColor = &self->_auxiliaryOptionsBackgroundColor;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, a3);
    [(UIView *)self->_overlayView setBackgroundColor:*p_auxiliaryOptionsBackgroundColor];
    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, a3);
    unint64_t v5 = [(UIView *)self->_overlayView layer];
    [v5 setCompositingFilter:v6];

    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setMaterialTintColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialTintColor, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_auxiliaryOptionButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setBackgroundTintColor:", self->_materialTintColor, (void)v11);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setMaterialRecipe:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_auxiliaryOptionButtons;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setBackgroundMaterialRecipe:", a3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_auxiliaryOptionButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setMaterialGroupNameBase:", self->_materialGroupNameBase, (void)v11);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NCAuxiliaryOptionsView *)self _updateTextAttributesForOptionsSummaryLabel];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_auxiliaryOptionButtons;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(NCAuxiliaryOptionsView *)self _preferredFontForOptionButton];
        [v8 setFont:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  self->_widthForCachedLayoutInfo = 0.0;
  [(NCAuxiliaryOptionsView *)self setNeedsLayout];
  return 1;
}

- (void)_setDefaultAttributes
{
  v3 = [(NCAuxiliaryOptionsView *)self _defaultTextColor];
  auxiliaryOptionsTextColor = self->_auxiliaryOptionsTextColor;
  self->_auxiliaryOptionsTextColor = v3;

  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  auxiliaryOptionsBackgroundColor = self->_auxiliaryOptionsBackgroundColor;
  self->_auxiliaryOptionsBackgroundColor = v5;

  uint64_t v7 = (void *)*MEMORY[0x1E4F3A2E0];

  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, v7);
}

- (id)_preferredFontForAuxiliaryOptionsSummaryTextLabel
{
  v2 = [(NCAuxiliaryOptionsView *)self fontProvider];
  v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:8];

  return v3;
}

- (void)_updateTextAttributesForOptionsSummaryLabel
{
  optionsSummaryLabel = self->_optionsSummaryLabel;
  if (optionsSummaryLabel)
  {
    id v3 = [(NCAuxiliaryOptionsView *)self _preferredFontForAuxiliaryOptionsSummaryTextLabel];
    [(UILabel *)optionsSummaryLabel setFont:v3];
  }
}

- (void)_configureAuxiliaryOptionsSummaryTextLabelIfNecessary
{
  if (!self->_optionsSummaryLabel)
  {
    id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    optionsSummaryLabel = self->_optionsSummaryLabel;
    self->_optionsSummaryLabel = v3;

    [(UILabel *)self->_optionsSummaryLabel setTextColor:self->_auxiliaryOptionsTextColor];
    [(UILabel *)self->_optionsSummaryLabel setNumberOfLines:0];
    [(UILabel *)self->_optionsSummaryLabel setTextAlignment:1];
    [(NCAuxiliaryOptionsView *)self _updateTextAttributesForOptionsSummaryLabel];
    uint64_t v5 = self->_optionsSummaryLabel;
    [(NCAuxiliaryOptionsView *)self addSubview:v5];
  }
}

- (id)_preferredFontForOptionButton
{
  v2 = [(NCAuxiliaryOptionsView *)self fontProvider];
  id v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:8];

  return v3;
}

- (id)_newOptionsButton
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F91458]);
  uint64_t v4 = [(NCAuxiliaryOptionsView *)self _preferredFontForOptionButton];
  [v3 setFont:v4];

  [v3 _setContinuousCornerRadius:9.5];
  [(NCAuxiliaryOptionsView *)self addSubview:v3];
  return v3;
}

- (void)_configureOverlayIfNecessary
{
  if (!self->_overlayView)
  {
    id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    uint64_t v5 = self->_overlayView;
    [(NCAuxiliaryOptionsView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_overlayView setAutoresizingMask:18];
    [(UIView *)self->_overlayView setBackgroundColor:self->_auxiliaryOptionsBackgroundColor];
    uint64_t v6 = [(UIView *)self->_overlayView layer];
    [v6 setCompositingFilter:self->_auxiliaryOptionsBackgroundCompositingFilter];

    uint64_t v7 = self->_overlayView;
    [(NCAuxiliaryOptionsView *)self insertSubview:v7 atIndex:0];
  }
}

- (void)_calculateOptionsSummaryLabelLayoutInfoForBoundsSize:(CGSize)a3
{
  if (self->_optionsSummaryLabel)
  {
    if (a3.width != self->_widthForCachedLayoutInfo)
    {
      self->_widthForCachedLayoutInfo = a3.width;
      optionsSummaryLabel = self->_optionsSummaryLabel;
      BSRectWithSize();
      self->_cachedSummaryLabelNumberOfLines = -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](optionsSummaryLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext);
    }
  }
}

- (unint64_t)_summaryLabelNumberOfLinesForBoundsSize:(CGSize)a3
{
  return self->_cachedSummaryLabelNumberOfLines;
}

- (double)_optionsSummaryWidthForBounds:(CGRect)a3
{
  return CGRectGetWidth(a3) + -28.0;
}

- (CGRect)_optionsSummaryMeasuringFrameForBounds:(CGRect)a3
{
  -[NCAuxiliaryOptionsView _optionsSummaryWidthForBounds:](self, "_optionsSummaryWidthForBounds:");
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:"));
  BSRectWithSize();
  UIRectCenteredXInRectScale();
  result.size.height = v7;
  result.size.CGFloat width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_layoutOptionsSummaryLabel
{
  if (self->_optionsSummaryLabel)
  {
    [(NCAuxiliaryOptionsView *)self bounds];
    -[NCAuxiliaryOptionsView _optionsSummaryMeasuringFrameForBounds:](self, "_optionsSummaryMeasuringFrameForBounds:");
    CGFloat x = v9.origin.x;
    CGFloat y = v9.origin.y;
    CGFloat width = v9.size.width;
    CGFloat height = v9.size.height;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_optionsSummaryLabel, "unui_drawingHeightWithNumberOfLines:", -[NCAuxiliaryOptionsView _summaryLabelNumberOfLinesForBoundsSize:](self, "_summaryLabelNumberOfLinesForBoundsSize:", CGRectGetWidth(v9), 1.79769313e308));
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    CGRectGetWidth(v10);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    optionsSummaryLabel = self->_optionsSummaryLabel;
    -[UILabel setFrame:](optionsSummaryLabel, "setFrame:");
  }
}

- (double)_optionsButtonWidthForBounds:(CGRect)a3 auxiliaryOptionButtonsCount:(unint64_t)a4
{
  if (a4) {
    return (CGRectGetWidth(a3) + -28.0 + (double)(a4 - 1) * -10.0) / (double)a4;
  }
  else {
    return 0.0;
  }
}

- (void)_layoutOptionsButtons
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_auxiliaryOptionButtons count])
  {
    [(NCAuxiliaryOptionsView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[NCAuxiliaryOptionsView _optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:](self, "_optionsButtonWidthForBounds:auxiliaryOptionButtonsCount:", [(NSArray *)self->_auxiliaryOptionButtons count], v3, v5, v7, v9);
    uint64_t v12 = v11;
    if (self->_optionsSummaryLabel)
    {
      -[NCAuxiliaryOptionsView _optionsSummaryMeasuringFrameForBounds:](self, "_optionsSummaryMeasuringFrameForBounds:", v4, v6, v8, v10);
      double v13 = CGRectGetMaxY(v35) + 18.0;
    }
    else
    {
      double v13 = 18.0;
    }
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x4010000000;
    v30[3] = &unk_1D7DBF3F7;
    long long v31 = 0u;
    long long v32 = 0u;
    v36.origin.CGFloat x = v4;
    v36.origin.CGFloat y = v6;
    v36.size.CGFloat width = v8;
    v36.size.CGFloat height = v10;
    CGFloat MaxY = CGRectGetMaxY(v36);
    *(void *)&long long v31 = 0x402C000000000000;
    *((double *)&v31 + 1) = v13;
    *(void *)&long long v32 = v12;
    *((double *)&v32 + 1) = MaxY - v13 + -14.0;
    double v15 = _NCMainScreenScale();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__NCAuxiliaryOptionsView__layoutOptionsButtons__block_invoke;
    aBlock[3] = &unk_1E6A93298;
    aBlock[4] = v30;
    *(double *)&aBlock[5] = v15;
    uint64_t v16 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v17 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v18 = [v17 userInterfaceLayoutDirection] == 1;

    if (v18)
    {
      uint64_t v19 = [(NSArray *)self->_auxiliaryOptionButtons count];
      if (v19 - 1 >= 0)
      {
        do
        {
          v20 = [(NSArray *)self->_auxiliaryOptionButtons objectAtIndex:--v19];
          v16[2](v16, v20);
        }
        while (v19 > 0);
      }
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v21 = self->_auxiliaryOptionButtons;
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v26;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v26 != v23) {
              objc_enumerationMutation(v21);
            }
            v16[2](v16, *(void **)(*((void *)&v25 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v22);
      }
    }
    _Block_object_dispose(v30, 8);
  }
}

CGFloat __47__NCAuxiliaryOptionsView__layoutOptionsButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  UIRectIntegralWithScale();
  objc_msgSend(v3, "setFrame:");

  CGFloat result = CGRectGetMaxX(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)) + 10.0;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (id)_defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (NSArray)auxiliaryOptionButtons
{
  return self->_auxiliaryOptionButtons;
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
}

- (NSArray)auxiliaryOptionActions
{
  return self->_auxiliaryOptionActions;
}

- (UIColor)auxiliaryOptionsTextColor
{
  return self->_auxiliaryOptionsTextColor;
}

- (UIColor)auxiliaryOptionsBackgroundColor
{
  return self->_auxiliaryOptionsBackgroundColor;
}

- (NSString)auxiliaryOptionsBackgroundCompositingFilter
{
  return self->_auxiliaryOptionsBackgroundCompositingFilter;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategorCGFloat y = a3;
}

- (void)setFontProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionButtons, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);

  objc_storeStrong((id *)&self->_optionsSummaryLabel, 0);
}

@end