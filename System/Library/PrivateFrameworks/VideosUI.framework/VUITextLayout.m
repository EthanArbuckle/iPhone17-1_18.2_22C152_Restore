@interface VUITextLayout
- (BOOL)allowsTextAlignmentOverride;
- (BOOL)alwaysFocusable;
- (BOOL)appliesColorToStringAttachments;
- (BOOL)appliesDirectionalIsolates;
- (BOOL)appliesShadowToContainer;
- (BOOL)avoidsFocusedTextShadow;
- (BOOL)enableAXUnderlineButtonShape;
- (BOOL)fadesOutTextTruncation;
- (BOOL)shouldAllowParagraphHyphenation;
- (BOOL)shouldUpdateTextColor;
- (NSNumber)letterSpacing;
- (NSShadow)shadow;
- (NSString)compositingFilter;
- (NSString)darkCompositingFilter;
- (NSString)fontFamily;
- (UIColor)color;
- (UIColor)darkColor;
- (UIColor)darkHighlightOrSelectedColor;
- (UIColor)darkSeeMoreTextColor;
- (UIColor)disabledColor;
- (UIColor)highContrastTintColor;
- (UIColor)highlightOrSelectedColor;
- (UIColor)seeMoreTextColor;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (VUITextLayout)init;
- (double)focusCornerRadius;
- (double)focusSizeIncrease;
- (double)fontSize;
- (double)minimumScaleFactor;
- (double)seeMoreHorizontalMargin;
- (id)_defaultParagraphStyle;
- (id)attributedStringWithAttributedString:(id)a3 textColor:(id)a4;
- (id)attributedStringWithAttributedString:(id)a3 view:(id)a4 updateTextColor:(BOOL)a5;
- (id)attributedStringWithString:(id)a3;
- (id)attributedStringWithString:(id)a3 isHighlighted:(BOOL)a4 isDisabled:(BOOL)a5;
- (id)attributedStringWithString:(id)a3 view:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultAttributesForLabel:(id)a3;
- (int)blendMode;
- (int64_t)alignment;
- (int64_t)fontFeature;
- (int64_t)fontWeight;
- (int64_t)highlightStyle;
- (int64_t)lineBreakMode;
- (int64_t)preferredVibrancy;
- (int64_t)textStyle;
- (int64_t)textTransform;
- (unint64_t)maximumContentSizeCategory;
- (unint64_t)numberOfLines;
- (unint64_t)numberOfLinesAXLarge;
- (unint64_t)numberOfLinesAXSmall;
- (unint64_t)numberOfLinesForTraitCollection:(id)a3;
- (unsigned)fontTraits;
- (void)setAlignment:(int64_t)a3;
- (void)setAllowsTextAlignmentOverride:(BOOL)a3;
- (void)setAlwaysFocusable:(BOOL)a3;
- (void)setAppliesColorToStringAttachments:(BOOL)a3;
- (void)setAppliesDirectionalIsolates:(BOOL)a3;
- (void)setAppliesShadowToContainer:(BOOL)a3;
- (void)setAvoidsFocusedTextShadow:(BOOL)a3;
- (void)setBlendMode:(int)a3;
- (void)setColor:(id)a3;
- (void)setColorWithOpacityType:(int64_t)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setDarkColor:(id)a3;
- (void)setDarkCompositingFilter:(id)a3;
- (void)setDarkHighlightOrSelectedColor:(id)a3;
- (void)setDarkSeeMoreTextColor:(id)a3;
- (void)setDisabledColor:(id)a3;
- (void)setEnableAXUnderlineButtonShape:(BOOL)a3;
- (void)setFadesOutTextTruncation:(BOOL)a3;
- (void)setFocusCornerRadius:(double)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setFontFamily:(id)a3;
- (void)setFontFeature:(int64_t)a3;
- (void)setFontSize:(double)a3;
- (void)setFontTraits:(unsigned int)a3;
- (void)setFontWeight:(int64_t)a3;
- (void)setHighContrastTintColor:(id)a3;
- (void)setHighlightOrSelectedColor:(id)a3;
- (void)setHighlightStyle:(int64_t)a3;
- (void)setLetterSpacing:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setMaximumContentSizeCategory:(unint64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setNumberOfLinesAXLarge:(unint64_t)a3;
- (void)setNumberOfLinesAXSmall:(unint64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreferredVibrancy:(int64_t)a3;
- (void)setSeeMoreHorizontalMargin:(double)a3;
- (void)setSeeMoreTextColor:(id)a3;
- (void)setShadow:(id)a3;
- (void)setShouldAllowParagraphHyphenation:(BOOL)a3;
- (void)setShouldUpdateTextColor:(BOOL)a3;
- (void)setTextStyle:(int64_t)a3;
- (void)setTextTransform:(int64_t)a3;
@end

@implementation VUITextLayout

- (VUITextLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUITextLayout;
  result = [(VUITextLayout *)&v3 init];
  if (result)
  {
    result->_textStyle = -1;
    result->_fontWeight = 4;
    result->_fontFeature = 0;
    *(_OWORD *)&result->_alignment = xmmword_1E38FDA70;
    result->_numberOfLinesAXSmall = 0;
    result->_numberOfLinesAXLarge = 0;
    result->_alwaysFocusable = 1;
    result->_blendMode = 0;
    result->_seeMoreHorizontalMargin = 10.0;
    result->_maximumContentSizeCategory = 0;
    *(_DWORD *)&result->_shouldUpdateTextColor = 1;
    result->_appliesColorToStringAttachments = 0;
    result->_lineBreakMode = 4;
    *(_WORD *)&result->_fadesOutTextTruncation = 256;
    result->_preferredVibrancy = 0;
  }
  return result;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (void)setColor:(id)a3
{
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setDarkColor:(id)a3
{
}

- (void)setTextTransform:(int64_t)a3
{
  self->_textTransform = a3;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (void)setLetterSpacing:(id)a3
{
}

- (void)setShouldUpdateTextColor:(BOOL)a3
{
  self->_shouldUpdateTextColor = a3;
}

- (void)setShouldAllowParagraphHyphenation:(BOOL)a3
{
  self->_shouldAllowParagraphHyphenation = a3;
}

- (void)setShadow:(id)a3
{
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (void)setNumberOfLinesAXSmall:(unint64_t)a3
{
  self->_numberOfLinesAXSmall = a3;
}

- (void)setNumberOfLinesAXLarge:(unint64_t)a3
{
  self->_numberOfLinesAXLarge = a3;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (void)setMaximumContentSizeCategory:(unint64_t)a3
{
  self->_maximumContentSizeCategory = a3;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void)setHighlightOrSelectedColor:(id)a3
{
}

- (void)setHighContrastTintColor:(id)a3
{
}

- (void)setFontFeature:(int64_t)a3
{
  self->_fontFeature = a3;
}

- (void)setFontFamily:(id)a3
{
}

- (void)setFadesOutTextTruncation:(BOOL)a3
{
  self->_fadesOutTextTruncation = a3;
}

- (void)setDisabledColor:(id)a3
{
}

- (void)setDarkCompositingFilter:(id)a3
{
}

- (void)setCompositingFilter:(id)a3
{
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (void)setAvoidsFocusedTextShadow:(BOOL)a3
{
  self->_avoidsFocusedTextShadow = a3;
}

- (void)setAppliesShadowToContainer:(BOOL)a3
{
  self->_appliesShadowToContainer = a3;
}

- (void)setAppliesDirectionalIsolates:(BOOL)a3
{
  self->_appliesDirectionalIsolates = a3;
}

- (void)setAlwaysFocusable:(BOOL)a3
{
  self->_alwaysFocusable = a3;
}

- (void)setAllowsTextAlignmentOverride:(BOOL)a3
{
  self->_allowsTextAlignmentOverride = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (NSNumber)letterSpacing
{
  return self->_letterSpacing;
}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_highlightStyle = a3;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (void)setFocusCornerRadius:(double)a3
{
  self->_focusCornerRadius = a3;
}

- (void)setEnableAXUnderlineButtonShape:(BOOL)a3
{
  self->_enableAXUnderlineButtonShape = a3;
}

- (void)setAppliesColorToStringAttachments:(BOOL)a3
{
  self->_appliesColorToStringAttachments = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (BOOL)fadesOutTextTruncation
{
  return self->_fadesOutTextTruncation;
}

- (BOOL)alwaysFocusable
{
  return self->_alwaysFocusable;
}

- (int64_t)fontFeature
{
  return self->_fontFeature;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (unint64_t)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (unsigned)fontTraits
{
  return self->_fontTraits;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (UIColor)darkColor
{
  return self->_darkColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[VUITextLayout allocWithZone:a3] init];
  [(VUITextLayout *)v4 setTextStyle:self->_textStyle];
  v5 = (void *)[(NSString *)self->_fontFamily copy];
  [(VUITextLayout *)v4 setFontFamily:v5];

  [(VUITextLayout *)v4 setFontWeight:self->_fontWeight];
  [(VUITextLayout *)v4 setFontSize:self->_fontSize];
  [(VUITextLayout *)v4 setFontTraits:self->_fontTraits];
  [(VUITextLayout *)v4 setFontFeature:self->_fontFeature];
  -[VUITextLayout setMargin:](v4, "setMargin:", self->_margin.top, self->_margin.left, self->_margin.bottom, self->_margin.right);
  v6 = (void *)[(UIColor *)self->_color copy];
  [(VUITextLayout *)v4 setColor:v6];

  v7 = (void *)[(UIColor *)self->_highlightOrSelectedColor copy];
  [(VUITextLayout *)v4 setHighlightOrSelectedColor:v7];

  v8 = (void *)[(UIColor *)self->_disabledColor copy];
  [(VUITextLayout *)v4 setDisabledColor:v8];

  v9 = (void *)[(UIColor *)self->_seeMoreTextColor copy];
  [(VUITextLayout *)v4 setSeeMoreTextColor:v9];

  [(VUITextLayout *)v4 setTextTransform:self->_textTransform];
  [(VUITextLayout *)v4 setAlignment:self->_alignment];
  [(VUITextLayout *)v4 setAllowsTextAlignmentOverride:self->_allowsTextAlignmentOverride];
  [(VUITextLayout *)v4 setAppliesDirectionalIsolates:self->_appliesDirectionalIsolates];
  [(VUITextLayout *)v4 setNumberOfLines:self->_numberOfLines];
  [(VUITextLayout *)v4 setNumberOfLinesAXSmall:self->_numberOfLinesAXSmall];
  [(VUITextLayout *)v4 setNumberOfLinesAXLarge:self->_numberOfLinesAXLarge];
  [(VUITextLayout *)v4 setShadow:self->_shadow];
  [(VUITextLayout *)v4 setAppliesShadowToContainer:self->_appliesShadowToContainer];
  v10 = (void *)[(NSNumber *)self->_letterSpacing copy];
  [(VUITextLayout *)v4 setLetterSpacing:v10];

  [(VUITextLayout *)v4 setLineBreakMode:self->_lineBreakMode];
  [(VUITextLayout *)v4 setFadesOutTextTruncation:self->_fadesOutTextTruncation];
  [(VUITextLayout *)v4 setShouldAllowParagraphHyphenation:self->_shouldAllowParagraphHyphenation];
  [(VUITextLayout *)v4 setHighContrastTintColor:self->_highContrastTintColor];
  [(VUITextLayout *)v4 setBlendMode:self->_blendMode];
  [(VUITextLayout *)v4 setAlwaysFocusable:self->_alwaysFocusable];
  [(VUITextLayout *)v4 setShouldUpdateTextColor:self->_shouldUpdateTextColor];
  [(VUITextLayout *)v4 setMaximumContentSizeCategory:self->_maximumContentSizeCategory];
  v11 = (void *)[(UIColor *)self->_darkColor copy];
  [(VUITextLayout *)v4 setDarkColor:v11];

  [(VUITextLayout *)v4 setSeeMoreHorizontalMargin:self->_seeMoreHorizontalMargin];
  [(VUITextLayout *)v4 setAvoidsFocusedTextShadow:self->_avoidsFocusedTextShadow];
  [(VUITextLayout *)v4 setMinimumScaleFactor:self->_minimumScaleFactor];
  v12 = (void *)[(UIColor *)self->_darkHighlightOrSelectedColor copy];
  [(VUITextLayout *)v4 setDarkHighlightOrSelectedColor:v12];

  v13 = (void *)[(UIColor *)self->_darkSeeMoreTextColor copy];
  [(VUITextLayout *)v4 setDarkSeeMoreTextColor:v13];

  [(VUITextLayout *)v4 setCompositingFilter:self->_compositingFilter];
  [(VUITextLayout *)v4 setDarkCompositingFilter:self->_darkCompositingFilter];
  [(VUITextLayout *)v4 setPreferredVibrancy:self->_preferredVibrancy];
  return v4;
}

- (void)setSeeMoreTextColor:(id)a3
{
}

- (void)setSeeMoreHorizontalMargin:(double)a3
{
  self->_seeMoreHorizontalMargin = a3;
}

- (void)setFontTraits:(unsigned int)a3
{
  self->_fontTraits = a3;
}

- (void)setDarkSeeMoreTextColor:(id)a3
{
}

- (void)setDarkHighlightOrSelectedColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkCompositingFilter, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_darkSeeMoreTextColor, 0);
  objc_storeStrong((id *)&self->_darkHighlightOrSelectedColor, 0);
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_seeMoreTextColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_highlightOrSelectedColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_highContrastTintColor, 0);
  objc_storeStrong((id *)&self->_letterSpacing, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

- (id)attributedStringWithString:(id)a3 isHighlighted:(BOOL)a4 isDisabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8) {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
  }
  else {
    v9 = 0;
  }
  v10 = self->_color;
  if (v5 && (disabledColor = self->_disabledColor) != 0
    || v6 && (disabledColor = self->_highlightOrSelectedColor) != 0)
  {
    v12 = disabledColor;

    v10 = v12;
  }
  v13 = [(VUITextLayout *)self attributedStringWithAttributedString:v9 textColor:v10];

  return v13;
}

- (id)attributedStringWithAttributedString:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length]) {
    goto LABEL_11;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v6];
  uint64_t v9 = [v6 length];
  v10 = [v6 string];
  v11 = v10;
  int64_t textTransform = self->_textTransform;
  switch(textTransform)
  {
    case 3:
      uint64_t v13 = [v10 localizedCapitalizedString];
      break;
    case 2:
      uint64_t v13 = [v10 localizedUppercaseString];
      break;
    case 1:
      uint64_t v13 = [v10 localizedLowercaseString];
      break;
    default:
      goto LABEL_9;
  }
  v14 = (void *)v13;

  v15 = [v8 mutableString];
  [v15 setString:v14];

  v11 = v14;
LABEL_9:
  v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextLayout:", self);
  v17 = [(VUITextLayout *)self _defaultParagraphStyle];
  v18 = (void *)[v17 mutableCopy];

  objc_initWeak(&location, self);
  [v8 beginEditing];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __64__VUITextLayout_attributedStringWithAttributedString_textColor___block_invoke;
  v27 = &unk_1E6DF5A10;
  objc_copyWeak(&v32, &location);
  id v19 = v8;
  id v28 = v19;
  id v20 = v18;
  id v29 = v20;
  id v30 = v7;
  id v21 = v16;
  id v31 = v21;
  objc_msgSend(v19, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, &v24);
  objc_msgSend(v19, "endEditing", v24, v25, v26, v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  if (v19)
  {
    id v22 = (id)[v19 copy];

    goto LABEL_12;
  }
LABEL_11:
  id v22 = v6;
LABEL_12:

  return v22;
}

- (id)_defaultParagraphStyle
{
  objc_super v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v4 = (void *)[v3 mutableCopy];

  [v4 setAlignment:self->_alignment];
  if (self->_fadesOutTextTruncation) {
    int64_t lineBreakMode = 2;
  }
  else {
    int64_t lineBreakMode = self->_lineBreakMode;
  }
  [v4 setLineBreakMode:lineBreakMode];
  if (!self->_lineBreakMode && self->_shouldAllowParagraphHyphenation)
  {
    LODWORD(v6) = 1.0;
    [v4 setHyphenationFactor:v6];
  }
  return v4;
}

void __64__VUITextLayout_attributedStringWithAttributedString_textColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v25 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = [WeakRetained letterSpacing];
  uint64_t v9 = [WeakRetained shadow];
  uint64_t v10 = *MEMORY[0x1E4FB0738];
  v11 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];

  if (!v11) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, *(void *)(a1 + 40), a3, a4);
  }
  uint64_t v12 = *MEMORY[0x1E4FB0710];
  uint64_t v13 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB0710]];

  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v8 == 0;
  }
  if (!v14) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v12, v8, a3, a4);
  }
  uint64_t v15 = *MEMORY[0x1E4FB0758];
  v16 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB0758]];
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v9 == 0;
  }
  if (v17)
  {
  }
  else if ([WeakRetained appliesShadowToContainer])
  {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v15, v9, a3, a4);
  }
  uint64_t v19 = *MEMORY[0x1E4FB0700];
  id v20 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
  if (v20)
  {
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v19, v21, a3, a4);
    }
  }
  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  v23 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v23)
  {
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 56);
    if (v24) {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v22, v24, a3, a4);
    }
  }
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (id)defaultAttributesForLabel:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextLayout:", self);
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v9 = [v5 traitCollection];

  if ([v9 userInterfaceStyle] != 2)
  {

LABEL_5:
    color = self->_color;
    if (!color) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  darkColor = self->_darkColor;

  if (!darkColor) {
    goto LABEL_5;
  }
  color = self->_darkColor;
LABEL_6:
  uint64_t v12 = color;

  id v8 = v12;
LABEL_7:
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  if (!self->_appliesShadowToContainer) {
    [v6 setObject:self->_shadow forKeyedSubscript:*MEMORY[0x1E4FB0758]];
  }
  uint64_t v13 = [(VUITextLayout *)self _defaultParagraphStyle];
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FB0738]];

  BOOL v14 = (void *)[v6 copy];
  return v14;
}

- (void)setColorWithOpacityType:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_opacityColorWithType:userInterfaceStyle:", a3, 1);
  [(VUITextLayout *)self setColor:v5];

  objc_msgSend(MEMORY[0x1E4FB1618], "vui_opacityColorWithType:userInterfaceStyle:", a3, 2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(VUITextLayout *)self setDarkColor:v6];
}

- (unint64_t)numberOfLinesForTraitCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VUITextLayout *)self numberOfLines];
  if (v4)
  {
    if ([v4 isAXSmallEnabled])
    {
      unint64_t v6 = [(VUITextLayout *)self numberOfLinesAXSmall];
LABEL_6:
      unint64_t v5 = v6;
      goto LABEL_7;
    }
    if ([v4 isAXLargeEnabled])
    {
      unint64_t v6 = [(VUITextLayout *)self numberOfLinesAXLarge];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (id)attributedStringWithString:(id)a3
{
  return [(VUITextLayout *)self attributedStringWithString:a3 view:0];
}

- (id)attributedStringWithString:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6]) != 0)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(VUITextLayout *)self attributedStringWithAttributedString:v8 view:v7 updateTextColor:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)attributedStringWithAttributedString:(id)a3 view:(id)a4 updateTextColor:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_shouldUpdateTextColor = a5;
  uint64_t v10 = self->_color;
  BOOL v11 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v9 && v11)
  {
    highContrastTintColor = self->_highContrastTintColor;
    if (highContrastTintColor)
    {
      uint64_t v13 = highContrastTintColor;
    }
    else
    {
      uint64_t v13 = [v9 _accessibilityHigherContrastTintColorForColor:v10];
    }
    BOOL v14 = v13;

    uint64_t v10 = v14;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v15 = [(UIColor *)v10 colorByRemovingTransparency];

    uint64_t v10 = (UIColor *)v15;
  }
  if (v9 && self->_darkColor)
  {
    if ([v9 vuiUserInterfaceStyle] == 2)
    {
      v16 = self->_darkColor;

      uint64_t v10 = v16;
    }
  }
  else if (!v9)
  {
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v9 isEnabled] & 1) == 0)
  {
    disabledColor = self->_disabledColor;
    if (!disabledColor) {
      goto LABEL_27;
    }
  }
  else
  {
    if (((objc_opt_respondsToSelector() & 1) == 0 || ([v9 isHighlighted] & 1) == 0)
      && ((objc_opt_respondsToSelector() & 1) == 0 || ![v9 isSelected]))
    {
      goto LABEL_27;
    }
    highlightOrSelectedColor = self->_highlightOrSelectedColor;
    if (highlightOrSelectedColor)
    {
      v18 = highlightOrSelectedColor;

      uint64_t v10 = v18;
    }
    if (!self->_darkHighlightOrSelectedColor || [v9 vuiUserInterfaceStyle] != 2) {
      goto LABEL_27;
    }
    disabledColor = self->_darkHighlightOrSelectedColor;
  }
  id v20 = disabledColor;

  uint64_t v10 = v20;
LABEL_27:
  if (v10)
  {
    uint64_t v21 = [v9 _accessibilityHigherContrastTintColorForColor:v10];

    uint64_t v10 = (UIColor *)v21;
  }
LABEL_29:
  uint64_t v22 = [(VUITextLayout *)self attributedStringWithAttributedString:v8 textColor:v10];

  return v22;
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (BOOL)shouldUpdateTextColor
{
  return self->_shouldUpdateTextColor;
}

- (int64_t)textTransform
{
  return self->_textTransform;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)allowsTextAlignmentOverride
{
  return self->_allowsTextAlignmentOverride;
}

- (BOOL)appliesDirectionalIsolates
{
  return self->_appliesDirectionalIsolates;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (unint64_t)numberOfLinesAXSmall
{
  return self->_numberOfLinesAXSmall;
}

- (unint64_t)numberOfLinesAXLarge
{
  return self->_numberOfLinesAXLarge;
}

- (BOOL)appliesShadowToContainer
{
  return self->_appliesShadowToContainer;
}

- (BOOL)shouldAllowParagraphHyphenation
{
  return self->_shouldAllowParagraphHyphenation;
}

- (UIColor)highContrastTintColor
{
  return self->_highContrastTintColor;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (double)focusCornerRadius
{
  return self->_focusCornerRadius;
}

- (UIColor)highlightOrSelectedColor
{
  return self->_highlightOrSelectedColor;
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (UIColor)seeMoreTextColor
{
  return self->_seeMoreTextColor;
}

- (double)seeMoreHorizontalMargin
{
  return self->_seeMoreHorizontalMargin;
}

- (BOOL)avoidsFocusedTextShadow
{
  return self->_avoidsFocusedTextShadow;
}

- (BOOL)appliesColorToStringAttachments
{
  return self->_appliesColorToStringAttachments;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (UIColor)darkHighlightOrSelectedColor
{
  return self->_darkHighlightOrSelectedColor;
}

- (UIColor)darkSeeMoreTextColor
{
  return self->_darkSeeMoreTextColor;
}

- (BOOL)enableAXUnderlineButtonShape
{
  return self->_enableAXUnderlineButtonShape;
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (NSString)darkCompositingFilter
{
  return self->_darkCompositingFilter;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

@end