@interface SBIconLabelImageParametersBuilder
+ (UIEdgeInsets)insetsForFont:(id)a3;
+ (double)_normalFontSizeForSizeParameter:(int64_t)a3;
+ (id)defaultFontForContentSizeCategory:(id)a3 languageInsets:(UIEdgeInsets *)a4;
+ (int64_t)_fontSizeParameterForContentSizeCategory:(id)a3;
- (BOOL)_canTightenLabel;
- (BOOL)_canTruncateLabel;
- (BOOL)_hasValidInputs;
- (BOOL)isAccessibilityReduceTransparencyEnabled;
- (CGSize)_maxSize;
- (CGSize)iconImageSize;
- (Class)iconViewClass;
- (NSString)contentSizeCategory;
- (NSString)iconLocation;
- (NSString)overrideText;
- (NSString)text;
- (SBIcon)icon;
- (SBIconLabelImageParametersBuilder)init;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconView)iconView;
- (UIColor)fallbackTextColor;
- (UIColor)focusHighlightColor;
- (UIColor)textColor;
- (UIEdgeInsets)textInsets;
- (UIFont)font;
- (UITraitCollection)overrideTraitCollection;
- (_UILegibilitySettings)legibilitySettings;
- (double)scale;
- (id)_fontWithLanguageInsets:(UIEdgeInsets *)a3;
- (id)buildParameters;
- (id)listLayout;
- (int64_t)labelAccessoryType;
- (void)setAccessibilityReduceTransparencyEnabled:(BOOL)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setFallbackTextColor:(id)a3;
- (void)setFocusHighlightColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIcon:(id)a3 forLocation:(id)a4;
- (void)setIconView:(id)a3;
- (void)setIconViewClass:(Class)a3;
- (void)setLabelAccessoryType:(int64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setOverrideText:(id)a3;
- (void)setOverrideTraitCollection:(id)a3;
- (void)setScale:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextInsets:(UIEdgeInsets)a3;
@end

@implementation SBIconLabelImageParametersBuilder

+ (id)defaultFontForContentSizeCategory:(id)a3 languageInsets:(UIEdgeInsets *)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SBIconLabelImageParametersBuilder_defaultFontForContentSizeCategory_languageInsets___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultFontForContentSizeCategory_languageInsets__onceToken != -1) {
    dispatch_once(&defaultFontForContentSizeCategory_languageInsets__onceToken, block);
  }
  id v7 = (id)defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[[a1 _fontSizeParameterForContentSizeCategory:v6]];
  if (a4)
  {
    [a1 insetsForFont:v7];
    a4->top = v8;
    a4->left = v9;
    a4->bottom = v10;
    a4->right = v11;
  }

  return v7;
}

+ (int64_t)_fontSizeParameterForContentSizeCategory:(id)a3
{
  v3 = (NSString *)a3;
  v4 = v3;
  if (!v3
    || (NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]),
        NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27B8]),
        NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]),
        v5 == NSOrderedAscending))
  {
    int64_t v8 = 0;
  }
  else if (v5)
  {
    if (v6)
    {
      if (v7) {
        int64_t v8 = 4;
      }
      else {
        int64_t v8 = 3;
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (SBIconLabelImageParametersBuilder)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBIconLabelImageParametersBuilder;
  v2 = [(SBIconLabelImageParametersBuilder *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    v2->_scale = v4;

    v2->_accessibilityReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    uint64_t v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    contentSizeCategory = v2->_contentSizeCategory;
    v2->_contentSizeCategory = (NSString *)v5;
  }
  return v2;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setLabelAccessoryType:(int64_t)a3
{
  self->_labelAccessoryType = a3;
}

- (void)setIconView:(id)a3
{
  uint64_t v5 = (SBIconView *)a3;
  if (self->_iconView != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)&self->_iconView, a3);
    [(SBIconLabelImageParametersBuilder *)self setIconViewClass:objc_opt_class()];
    BOOL v6 = [(SBIconView *)v8 displaysIconStatusInLabel];
    uint64_t v5 = v8;
    if (v6)
    {
      NSComparisonResult v7 = [(SBIcon *)self->_icon statusDescriptionForLocation:self->_iconLocation];
      if (v7) {
        [(SBIconLabelImageParametersBuilder *)self setText:v7];
      }

      uint64_t v5 = v8;
    }
  }
}

- (void)setIconViewClass:(Class)a3
{
}

- (void)setIcon:(id)a3 forLocation:(id)a4
{
  self->_iconLocation = (NSString *)a4;
  [(SBIconLabelImageParametersBuilder *)self setIcon:a3];
}

- (void)setIcon:(id)a3
{
  uint64_t v5 = (SBIcon *)a3;
  if (self->_icon != v5)
  {
    CGFloat v9 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    BOOL v6 = [(SBIconLabelImageParametersBuilder *)self iconView];
    int v7 = [v6 displaysIconStatusInLabel];

    if (!v7
      || ([(SBIcon *)v9 statusDescriptionForLocation:self->_iconLocation],
          (objc_super v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v8 = [(SBIcon *)self->_icon displayNameForLocation:self->_iconLocation];
    }
    [(SBIconLabelImageParametersBuilder *)self setText:v8];

    uint64_t v5 = v9;
  }
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (void)setText:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (void)setContentSizeCategory:(id)a3
{
}

- (id)_fontWithLanguageInsets:(UIEdgeInsets *)a3
{
  font = self->_font;
  if (font)
  {
    BOOL v6 = font;
LABEL_3:
    int v7 = v6;
    goto LABEL_6;
  }
  if (!self->_listLayoutProvider)
  {
    BOOL v6 = [(id)objc_opt_class() defaultFontForContentSizeCategory:self->_contentSizeCategory languageInsets:0];
    goto LABEL_3;
  }
  objc_super v8 = [(SBIconLabelImageParametersBuilder *)self iconLocation];
  CGFloat v9 = [(SBIconLabelImageParametersBuilder *)self contentSizeCategory];
  CGFloat v10 = [(SBIconListLayoutProvider *)self->_listLayoutProvider layoutForIconLocation:v8];
  int v7 = [v10 labelFontForContentSizeCategory:v9 options:UIAccessibilityIsBoldTextEnabled()];

LABEL_6:
  CGFloat v11 = [(SBIconLabelImageParametersBuilder *)self text];
  v12 = [v11 _adjustedFontForScripts:3 forFont:v7];

  if (v7 != v12)
  {
    id v13 = v12;

    int v7 = v13;
  }
  if (a3)
  {
    [(id)objc_opt_class() insetsForFont:v12];
    a3->top = v14;
    a3->left = v15;
    a3->bottom = v16;
    a3->right = v17;
  }

  return v7;
}

- (id)buildParameters
{
  if (![(SBIconLabelImageParametersBuilder *)self _hasValidInputs])
  {
    v3 = 0;
    goto LABEL_18;
  }
  v3 = objc_alloc_init(SBMutableIconLabelImageParameters);
  double v4 = [(SBIconLabelImageParametersBuilder *)self overrideText];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(SBIconLabelImageParametersBuilder *)self text];
  }
  int v7 = v6;

  objc_super v8 = (double *)MEMORY[0x1E4FB2848];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v28 = *MEMORY[0x1E4FB2848];
  long long v29 = v9;
  CGFloat v10 = [(SBIconLabelImageParametersBuilder *)self _fontWithLanguageInsets:&v28];
  [(SBMutableIconLabelImageParameters *)v3 setText:v7];
  uint64_t v11 = objc_msgSend(v7, "sb_containsEmoji");
  [(SBMutableIconLabelImageParameters *)v3 setContainsEmoji:v11];
  BOOL v12 = [(SBIconLabelImageParametersBuilder *)self _canTruncateLabel];
  [(SBMutableIconLabelImageParameters *)v3 setCanTruncate:v12];
  BOOL v13 = [(SBIconLabelImageParametersBuilder *)self _canTightenLabel];
  [(SBMutableIconLabelImageParameters *)v3 setCanTighten:v13];
  [(SBIconLabelImageParametersBuilder *)self _maxSize];
  -[SBMutableIconLabelImageParameters setMaxSize:](v3, "setMaxSize:");
  [(SBMutableIconLabelImageParameters *)v3 setFont:v10];
  [(SBMutableIconLabelImageParameters *)v3 setLegibilityStyle:[(_UILegibilitySettings *)self->_legibilitySettings style]];
  [(SBIconLabelImageParametersBuilder *)self scale];
  -[SBMutableIconLabelImageParameters setScale:](v3, "setScale:");
  [(SBMutableIconLabelImageParameters *)v3 setAccessibilityReduceTransparencyEnabled:[(SBIconLabelImageParametersBuilder *)self isAccessibilityReduceTransparencyEnabled]];
  CGFloat v14 = [(SBIconLabelImageParametersBuilder *)self contentSizeCategory];
  [(SBMutableIconLabelImageParameters *)v3 setContentSizeCategory:v14];

  CGFloat v15 = [(SBIconLabelImageParametersBuilder *)self focusHighlightColor];
  [(SBMutableIconLabelImageParameters *)v3 setFocusHighlightColor:v15];

  CGFloat v16 = [(SBIconLabelImageParametersBuilder *)self overrideTraitCollection];
  [(SBIconLabelImageParameters *)v3 setOverrideTraitCollection:v16];

  if (self->_hasSetTextInsets) {
    [(SBIconLabelImageParametersBuilder *)self textInsets];
  }
  else {
    [(id)objc_opt_class() insetsForFont:v10];
  }
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  v25 = [(SBIconLabelImageParametersBuilder *)self textColor];
  if (!v25)
  {
    if (v12 || v13)
    {
      double v22 = 6.0;
      double v21 = 0.0;
      double v23 = 0.0;
      double v24 = 6.0;
      if (!v11)
      {
LABEL_12:
        uint64_t v26 = [(SBIconLabelImageParametersBuilder *)self fallbackTextColor];
        goto LABEL_15;
      }
    }
    else
    {
      double v21 = *v8;
      double v22 = v8[1];
      double v23 = v8[2];
      double v24 = v8[3];
      if (!v11) {
        goto LABEL_12;
      }
    }
    uint64_t v26 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
LABEL_15:
    v25 = (void *)v26;
    if (!v26)
    {
      v25 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  [(SBMutableIconLabelImageParameters *)v3 setTextColor:v25];
  -[SBMutableIconLabelImageParameters setFontLanguageInsets:](v3, "setFontLanguageInsets:", v28, v29);
  -[SBMutableIconLabelImageParameters setTextInsets:](v3, "setTextInsets:", v21, v22, v23, v24);

LABEL_18:
  return v3;
}

+ (UIEdgeInsets)insetsForFont:(id)a3
{
  id v3 = a3;
  if (insetsForFont__onceToken != -1) {
    dispatch_once(&insetsForFont__onceToken, &__block_literal_global_15);
  }
  double v4 = [(id)insetsForFont__cachedInsets objectForKey:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 UIEdgeInsetsValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if (v3)
    {
      if (CTFontGetLanguageAwareOutsets())
      {
        double v9 = -0.0;
        double v7 = -0.0;
        double v13 = -0.0;
        double v11 = -0.0;
      }
      CGFloat v14 = (void *)insetsForFont__cachedInsets;
      CGFloat v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", v7, v9, v11, v13, 0, 0, 0, 0);
      [v14 setObject:v15 forKey:v3];
    }
  }

  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)scale
{
  return self->_scale;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (NSString)overrideText
{
  return self->_overrideText;
}

- (BOOL)isAccessibilityReduceTransparencyEnabled
{
  return self->_accessibilityReduceTransparencyEnabled;
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (CGSize)_maxSize
{
  id v3 = [(SBIconLabelImageParametersBuilder *)self iconView];
  double v4 = v3;
  if (v3)
  {
    [v3 maxLabelSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v9 = [(SBIconLabelImageParametersBuilder *)self listLayout];
    double v10 = [(SBIconLabelImageParametersBuilder *)self contentSizeCategory];
    [(objc_class *)self->_iconViewClass maxLabelSizeForListLayout:v9 contentSizeCategory:v10 options:UIAccessibilityIsBoldTextEnabled()];
    double v6 = v11;
    double v8 = v12;
  }
  if ([(SBIconView *)self->_iconView shouldShowLabelAccessoryView])
  {
    [v4 labelAccessoryTotalWidth];
    double v14 = v13 + v13;
    if (v6 <= v14) {
      double v6 = 0.0;
    }
    else {
      double v6 = v6 - v14;
    }
  }

  double v15 = v6;
  double v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_hasValidInputs
{
  return self->_icon && [(NSString *)self->_text length] != 0;
}

- (BOOL)_canTruncateLabel
{
  return [(SBIcon *)self->_icon canTruncateLabel]
      || [(SBIconLabelImageParametersBuilder *)self labelAccessoryType] != 0;
}

- (BOOL)_canTightenLabel
{
  if ([(SBIcon *)self->_icon canTightenLabel]) {
    return 1;
  }
  return [(SBIconLabelImageParametersBuilder *)self _canTruncateLabel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_overrideText, 0);
  objc_storeStrong((id *)&self->_fallbackTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconViewClass, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  id v3 = self->_listLayoutProvider;
  if (!v3)
  {
    id v3 = [(SBIconView *)self->_iconView listLayoutProvider];
  }
  return v3;
}

- (id)listLayout
{
  id v3 = [(SBIconLabelImageParametersBuilder *)self iconView];
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 listLayout];
  }
  else
  {
    double v6 = [(SBIconLabelImageParametersBuilder *)self listLayoutProvider];
    uint64_t v7 = [(SBIconLabelImageParametersBuilder *)self iconLocation];
    double v8 = (void *)v7;
    double v5 = 0;
    if (v6 && v7)
    {
      double v5 = [v6 layoutForIconLocation:v7];
    }
  }
  return v5;
}

- (CGSize)iconImageSize
{
  id v3 = [(SBIconLabelImageParametersBuilder *)self iconView];
  double v4 = v3;
  if (!v3)
  {
    double v9 = [(SBIconLabelImageParametersBuilder *)self listLayout];
    double v10 = v9;
    if (v9)
    {
      [v9 iconImageInfo];
    }
    else
    {
      double v13 = [(SBIconLabelImageParametersBuilder *)self iconViewClass];
      if (!v13)
      {
        uint64_t v6 = 0x4059000000000000;
        uint64_t v8 = 0x4059000000000000;
        goto LABEL_8;
      }
      [(objc_class *)v13 defaultIconImageSize];
    }
    uint64_t v6 = v11;
    uint64_t v8 = v12;
LABEL_8:

    goto LABEL_9;
  }
  [v3 iconImageSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
LABEL_9:

  double v14 = *(double *)&v6;
  double v15 = *(double *)&v8;
  result.height = v15;
  result.width = v14;
  return result;
}

void __51__SBIconLabelImageParametersBuilder_insetsForFont___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)insetsForFont__cachedInsets;
  insetsForFont__cachedInsets = v0;
}

void __86__SBIconLabelImageParametersBuilder_defaultFontForContentSizeCategory_languageInsets___block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    id v3 = (void *)MEMORY[0x1E4FB08E0];
    [*(id *)(a1 + 32) _normalFontSizeForSizeParameter:i];
    uint64_t v4 = objc_msgSend(v3, "systemFontOfSize:weight:");
    uint64_t v5 = (void *)defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[i];
    defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[i] = v4;
  }
}

- (UIFont)font
{
  id v3 = self->_font;
  if (!v3)
  {
    id v3 = [(SBIconLabelImageParametersBuilder *)self _fontWithLanguageInsets:0];
  }
  return v3;
}

- (void)setTextInsets:(UIEdgeInsets)a3
{
  self->_textInsets = a3;
  self->_hasSetTextInsets = 1;
}

+ (double)_normalFontSizeForSizeParameter:(int64_t)a3
{
  if (!__sb__runningInSpringBoard())
  {
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = (void *)[v3 userInterfaceIdiom];

    if (v4 != (void *)1) {
      goto LABEL_3;
    }
LABEL_6:
    int v9 = __sb__runningInSpringBoard();
    char v10 = v9;
    if (v9)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v4 userInterfaceIdiom] != 1)
      {

        goto LABEL_21;
      }
    }
    int v11 = __sb__runningInSpringBoard();
    char v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v6 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v14 = v13;
    double v15 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
    if ((v12 & 1) == 0) {

    }
    if ((v10 & 1) == 0) {
    if (v14 >= v15)
    }
    {
      int64_t v16 = a3 - 1;
      double v8 = 14.0;
      if ((unint64_t)(a3 - 1) >= 4) {
        return v8;
      }
      double v17 = (double *)&unk_1D81E4F98;
      return v17[v16];
    }
LABEL_21:
    int64_t v16 = a3 - 1;
    double v8 = 13.0;
    if ((unint64_t)(a3 - 1) >= 4) {
      return v8;
    }
    double v17 = (double *)&unk_1D81E4FB8;
    return v17[v16];
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_6;
  }
LABEL_3:
  switch(a3)
  {
    case 1:
      return 13.0;
    case 2:
      return 14.0;
    case 3:
      int v18 = __sb__runningInSpringBoard();
      char v19 = v18;
      if (v18)
      {
        if (SBFEffectiveDeviceClass())
        {
          double v8 = 14.0;
          if (SBFEffectiveDeviceClass() != 1) {
            return v8;
          }
        }
      }
      else
      {
        id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
        double v8 = 14.0;
        if ([v3 userInterfaceIdiom]) {
          goto LABEL_52;
        }
      }
      int v21 = __sb__runningInSpringBoard();
      char v22 = v21;
      if (v21)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v5 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v24 = v23 < *(double *)(MEMORY[0x1E4FA6E50] + 56);
      double v25 = 14.0;
      double v26 = 15.0;
      goto LABEL_46;
    case 4:
      int v20 = __sb__runningInSpringBoard();
      char v19 = v20;
      if (v20)
      {
        if (SBFEffectiveDeviceClass())
        {
          double v8 = 14.0;
          if (SBFEffectiveDeviceClass() != 1) {
            return v8;
          }
        }
      }
      else
      {
        id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
        double v8 = 14.0;
        if ([v3 userInterfaceIdiom])
        {
LABEL_52:

          return v8;
        }
      }
      int v27 = __sb__runningInSpringBoard();
      char v22 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v5 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v24 = v28 < *(double *)(MEMORY[0x1E4FA6E50] + 56);
      double v25 = 14.0;
      double v26 = 16.0;
LABEL_46:
      if (v24) {
        double v8 = v25;
      }
      else {
        double v8 = v26;
      }
      if ((v22 & 1) == 0) {

      }
      if ((v19 & 1) == 0) {
        goto LABEL_52;
      }
      return v8;
    default:
      return 12.0;
  }
}

- (SBIcon)icon
{
  return self->_icon;
}

- (Class)iconViewClass
{
  return self->_iconViewClass;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setAccessibilityReduceTransparencyEnabled:(BOOL)a3
{
  self->_accessibilityReduceTransparencyEnabled = a3;
}

- (void)setFocusHighlightColor:(id)a3
{
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)labelAccessoryType
{
  return self->_labelAccessoryType;
}

- (void)setOverrideTraitCollection:(id)a3
{
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)fallbackTextColor
{
  return self->_fallbackTextColor;
}

- (void)setFallbackTextColor:(id)a3
{
}

- (UIEdgeInsets)textInsets
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double bottom = self->_textInsets.bottom;
  double right = self->_textInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOverrideText:(id)a3
{
}

@end