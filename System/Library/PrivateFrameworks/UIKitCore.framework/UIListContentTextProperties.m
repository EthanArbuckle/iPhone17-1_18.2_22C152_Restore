@interface UIListContentTextProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)_enablesMarqueeWhenAncestorFocused;
- (BOOL)_hasNonEmptyPlainTextOnly;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsExpansionTextWhenTruncated;
- (CGFloat)minimumScaleFactor;
- (NSInteger)numberOfLines;
- (NSLineBreakMode)lineBreakMode;
- (UIColor)color;
- (UIColor)resolvedColor;
- (UIConfigurationColorTransformer)colorTransformer;
- (UIFont)font;
- (UIListContentTextAlignment)alignment;
- (UIListContentTextProperties)init;
- (UIListContentTextProperties)initWithCoder:(id)a3;
- (UIListContentTextTransform)transform;
- (__CFString)_shortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)_effectiveTextAlignment;
- (uint64_t)_isEqualToProperties:(int)a3 compareText:;
- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareText:;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1;
- (void)_applyToLabel:(uint64_t)a1;
- (void)_configureWithConstants:(void *)a3 traitCollection:(uint64_t)a4 forSidebar:;
- (void)_setColorTransformer:(uint64_t)a1;
- (void)_setColorTransformerIdentifier:(uint64_t)a1;
- (void)_setEnablesMarqueeWhenAncestorFocused:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
- (void)setAlignment:(UIListContentTextAlignment)alignment;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation;
- (void)setAttributedText:(void *)a1;
- (void)setColor:(UIColor *)color;
- (void)setColorTransformer:(UIConfigurationColorTransformer)colorTransformer;
- (void)setFont:(UIFont *)font;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor;
- (void)setNumberOfLines:(NSInteger)numberOfLines;
- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated;
- (void)setText:(void *)a1;
- (void)setTransform:(UIListContentTextTransform)transform;
@end

@implementation UIListContentTextProperties

- (UIListContentTextTransform)transform
{
  return self->_transform;
}

- (UIFont)font
{
  return self->_font;
}

- (UIListContentTextProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIListContentTextProperties;
  v2 = [(UIListContentTextProperties *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[UILabel defaultFont];
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    uint64_t v5 = +[UILabel _defaultColor];
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    *(_OWORD *)(v2 + 56) = xmmword_186B9D620;
    *((void *)v2 + 10) = 1;
    *((void *)v2 + 12) = 0;
  }
  return (UIListContentTextProperties *)v2;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong(&self->_colorTransformer, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)_applyToLabel:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (!a1) {
    goto LABEL_24;
  }
  v15 = v3;
  if (!*(void *)(a1 + 72))
  {
    uint64_t v5 = [v3 _content];
    int v6 = [v5 isAttributed];

    v4 = v15;
    if (v6)
    {
      [v15 setAttributedText:0];
      v4 = v15;
    }
  }
  uint64_t v7 = *(void *)(a1 + 96);
  switch(v7)
  {
    case 3:
      uint64_t v8 = [*(id *)(a1 + 24) localizedCapitalizedString];
      goto LABEL_11;
    case 2:
      uint64_t v8 = [*(id *)(a1 + 24) localizedLowercaseString];
      goto LABEL_11;
    case 1:
      uint64_t v8 = [*(id *)(a1 + 24) localizedUppercaseString];
LABEL_11:
      v9 = (void *)v8;
      [v15 setText:v8];

      goto LABEL_13;
  }
  [v4 setText:*(void *)(a1 + 24)];
LABEL_13:
  id v10 = *(id *)(a1 + 32);
  if (*(unsigned char *)(a1 + 14) && [v15 adjustsFontForContentSizeCategory])
  {
    v11 = [v15 traitCollection];
    uint64_t v12 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v11];

    id v10 = (id)v12;
  }
  [v15 setFont:v10];
  v13 = [(id)a1 resolvedColor];
  [v15 setTextColor:v13];

  objc_msgSend(v15, "setTextAlignment:", objc_msgSend((id)a1, "_effectiveTextAlignment"));
  if (*(void *)(a1 + 56))
  {
    uint64_t v14 = 5;
  }
  else if ([v15 _shouldReverseLayoutDirection])
  {
    uint64_t v14 = 10;
  }
  else
  {
    uint64_t v14 = 9;
  }
  [v15 setContentMode:v14];
  [v15 setLineBreakMode:*(void *)(a1 + 64)];
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v15, "setAttributedText:");
  }
  [v15 setNumberOfLines:*(void *)(a1 + 80)];
  [v15 setAdjustsFontSizeToFitWidth:*(unsigned __int8 *)(a1 + 12)];
  [v15 setMinimumScaleFactor:*(double *)(a1 + 88)];
  [v15 setAllowsDefaultTighteningForTruncation:*(unsigned __int8 *)(a1 + 13)];
  [v15 setAdjustsFontForContentSizeCategory:*(unsigned __int8 *)(a1 + 14)];
  [v15 setShowsExpansionTextWhenTruncated:*(unsigned __int8 *)(a1 + 15)];

  v4 = v15;
LABEL_24:
}

- (UIColor)resolvedColor
{
  colorTransformer = (void (**)(id, UIColor *))self->_colorTransformer;
  if (colorTransformer)
  {
    colorTransformer[2](colorTransformer, self->_color);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_color;
  }
  return v4;
}

- (int64_t)_effectiveTextAlignment
{
  int64_t alignment = self->_alignment;
  int64_t v3 = 3;
  if (alignment != 2) {
    int64_t v3 = 4;
  }
  if (alignment == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareText:
{
  uint64_t v5 = a2;
  int v6 = (double *)v5;
  if (!a1) {
    goto LABEL_34;
  }
  if (v5 == (void *)a1)
  {
    a1 = 1;
    goto LABEL_34;
  }
  if (a3)
  {
    uint64_t v7 = (void *)v5[3];
    id v8 = *(id *)(a1 + 24);
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if (!v8 || !v9) {
        goto LABEL_16;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_33;
      }
    }
    uint64_t v12 = (void *)*((void *)v6 + 9);
    id v8 = *(id *)(a1 + 72);
    id v13 = v12;
    if (v8 != v13)
    {
      id v10 = v13;
      if (v8 && v13)
      {
        int v14 = [v8 isEqual:v13];

        if (!v14) {
          goto LABEL_33;
        }
        goto LABEL_18;
      }
LABEL_16:

LABEL_33:
      a1 = 0;
      goto LABEL_34;
    }
  }
LABEL_18:
  if (*(void *)(a1 + 32) != *((void *)v6 + 4)) {
    goto LABEL_33;
  }
  if (*(void *)(a1 + 40) != *((void *)v6 + 5)) {
    goto LABEL_33;
  }
  uint64_t v15 = *(void *)(a1 + 104);
  if (v15 != *((void *)v6 + 13) || v15 == 1 && *(void *)(a1 + 48) != *((void *)v6 + 6)) {
    goto LABEL_33;
  }
  if (*(void *)(a1 + 56) != *((void *)v6 + 7)
    || *(void *)(a1 + 64) != *((void *)v6 + 8)
    || *(void *)(a1 + 80) != *((void *)v6 + 10)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12)
    || *(double *)(a1 + 88) != v6[11]
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v6 + 13)
    || *(unsigned __int8 *)(a1 + 14) != *((unsigned __int8 *)v6 + 14)
    || *(unsigned __int8 *)(a1 + 15) != *((unsigned __int8 *)v6 + 15)
    || *(void *)(a1 + 96) != *((void *)v6 + 12))
  {
    goto LABEL_33;
  }
  a1 = *(unsigned __int8 *)(a1 + 16) == *((unsigned __int8 *)v6 + 16);
LABEL_34:

  return a1;
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    __int16 v4 = *(_WORD *)(a1 + 8);
    id v18 = v3;
    if (v4)
    {
      if ((v4 & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        uint64_t v5 = (void *)*((void *)v3 + 4);
      }
      else {
        uint64_t v5 = 0;
      }
      objc_storeStrong((id *)(a1 + 32), v5);
      __int16 v4 = *(_WORD *)(a1 + 8);
      id v3 = v18;
      if ((v4 & 2) != 0)
      {
LABEL_4:
        if ((v4 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_22;
      }
    }
    if (v3) {
      int v6 = (void *)*((void *)v3 + 5);
    }
    else {
      int v6 = 0;
    }
    objc_storeStrong((id *)(a1 + 40), v6);
    __int16 v4 = *(_WORD *)(a1 + 8);
    id v3 = v18;
    if ((v4 & 4) != 0)
    {
LABEL_5:
      if ((v4 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
LABEL_22:
    if (v3) {
      uint64_t v7 = (void *)*((void *)v3 + 6);
    }
    else {
      uint64_t v7 = 0;
    }
    -[UIListContentTextProperties _setColorTransformer:](a1, v7);
    __int16 v4 = *(_WORD *)(a1 + 8);
    id v3 = v18;
    if ((v4 & 8) != 0)
    {
LABEL_6:
      if ((v4 & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_28;
    }
LABEL_25:
    if (v3) {
      uint64_t v8 = *((void *)v3 + 7);
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)(a1 + 56) = v8;
    if ((v4 & 0x10) != 0)
    {
LABEL_7:
      if ((v4 & 0x20) != 0) {
        goto LABEL_8;
      }
      goto LABEL_31;
    }
LABEL_28:
    if (v3) {
      uint64_t v9 = *((void *)v3 + 8);
    }
    else {
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 64) = v9;
    if ((v4 & 0x20) != 0)
    {
LABEL_8:
      if ((v4 & 0x40) != 0) {
        goto LABEL_9;
      }
      goto LABEL_34;
    }
LABEL_31:
    if (v3) {
      uint64_t v10 = *((void *)v3 + 10);
    }
    else {
      uint64_t v10 = 0;
    }
    *(void *)(a1 + 80) = v10;
    if ((v4 & 0x40) != 0)
    {
LABEL_9:
      if ((v4 & 0x80) != 0) {
        goto LABEL_10;
      }
      goto LABEL_37;
    }
LABEL_34:
    if (v3) {
      BOOL v11 = *((unsigned char *)v3 + 12) != 0;
    }
    else {
      BOOL v11 = 0;
    }
    *(unsigned char *)(a1 + 12) = v11;
    if ((v4 & 0x80) != 0)
    {
LABEL_10:
      if ((v4 & 0x100) != 0) {
        goto LABEL_11;
      }
      goto LABEL_40;
    }
LABEL_37:
    if (v3) {
      uint64_t v12 = *((void *)v3 + 11);
    }
    else {
      uint64_t v12 = 0;
    }
    *(void *)(a1 + 88) = v12;
    if ((v4 & 0x100) != 0)
    {
LABEL_11:
      if ((v4 & 0x200) != 0) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
LABEL_40:
    if (v3) {
      BOOL v13 = *((unsigned char *)v3 + 13) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    *(unsigned char *)(a1 + 13) = v13;
    if ((v4 & 0x200) != 0)
    {
LABEL_12:
      if ((v4 & 0x400) != 0) {
        goto LABEL_13;
      }
      goto LABEL_46;
    }
LABEL_43:
    if (v3) {
      BOOL v14 = *((unsigned char *)v3 + 14) != 0;
    }
    else {
      BOOL v14 = 0;
    }
    *(unsigned char *)(a1 + 14) = v14;
    if ((v4 & 0x400) != 0)
    {
LABEL_13:
      if ((v4 & 0x800) != 0) {
        goto LABEL_14;
      }
      goto LABEL_49;
    }
LABEL_46:
    if (v3) {
      BOOL v15 = *((unsigned char *)v3 + 15) != 0;
    }
    else {
      BOOL v15 = 0;
    }
    *(unsigned char *)(a1 + 15) = v15;
    if ((v4 & 0x800) != 0)
    {
LABEL_14:
      if ((v4 & 0x1000) != 0) {
        goto LABEL_55;
      }
LABEL_52:
      if (v3) {
        BOOL v17 = *((unsigned char *)v3 + 16) != 0;
      }
      else {
        BOOL v17 = 0;
      }
      *(unsigned char *)(a1 + 16) = v17;
      goto LABEL_55;
    }
LABEL_49:
    if (v3) {
      uint64_t v16 = *((void *)v3 + 12);
    }
    else {
      uint64_t v16 = 0;
    }
    *(void *)(a1 + 96) = v16;
    if ((v4 & 0x1000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_52;
  }
LABEL_55:
}

- (void)_setColorTransformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    *(void *)(a1 + 104) = _UIConfigurationIdentifierForColorTransformer(v3);
    uint64_t v4 = [v3 copy];

    uint64_t v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;
  }
}

- (void)_configureWithConstants:(void *)a3 traitCollection:(uint64_t)a4 forSidebar:
{
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    *(void *)(a1 + 80) = [v8 defaultLabelNumberOfLinesForSidebar:a4 traitCollection:v7];
    *(unsigned char *)(a1 + 13) = [v8 defaultLabelAllowsTighteningForTruncationForSidebar:a4 traitCollection:v7];
    [v8 defaultLabelMinimumScaleFactorForSidebar:a4 traitCollection:v7];
    double v10 = v9;

    *(unsigned char *)(a1 + 12) = v10 > 0.0;
    *(double *)(a1 + 88) = v10;
    *(_WORD *)(a1 + 14) = 257;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    int v6 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v5;

    objc_storeStrong((id *)(v4 + 32), self->_font);
    objc_storeStrong((id *)(v4 + 40), self->_color);
    uint64_t v7 = [self->_colorTransformer copy];
    id v8 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v7;

    *(void *)(v4 + 104) = self->_colorTransformerIdentifier;
    *(void *)(v4 + 56) = self->_alignment;
    *(void *)(v4 + 64) = self->_lineBreakMode;
    uint64_t v9 = [(NSAttributedString *)self->_attributedText copy];
    double v10 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v9;

    *(void *)(v4 + 80) = self->_numberOfLines;
    *(unsigned char *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 88) = self->_minimumScaleFactor;
    *(unsigned char *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(unsigned char *)(v4 + 14) = self->_adjustsFontForContentSizeCategory;
    *(unsigned char *)(v4 + 15) = self->_showsExpansionTextWhenTruncated;
    *(void *)(v4 + 96) = self->_transform;
    *(unsigned char *)(v4 + 16) = self->__enablesMarqueeWhenAncestorFocused;
    *($AD363B418D562FE576C628EB910A463B *)(v4 + 8) = self->_textFlags;
  }
  return (id)v4;
}

- (UIListContentTextAlignment)alignment
{
  return self->_alignment;
}

- (BOOL)_hasNonEmptyPlainTextOnly
{
  return !self->_attributedText && [(NSString *)self->_text length] != 0;
}

- (void)setAttributedText:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id newValue = v3;
    if (v3)
    {
      uint64_t v5 = (void *)a1[3];
      a1[3] = 0;
    }
    objc_setProperty_nonatomic_copy(a1, v4, newValue, 72);
    id v3 = newValue;
  }
}

- (void)setText:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id newValue = v3;
    if (v3)
    {
      uint64_t v5 = (void *)a1[9];
      a1[9] = 0;
    }
    objc_setProperty_nonatomic_copy(a1, v4, newValue, 24);
    id v3 = newValue;
  }
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  *(_WORD *)&self->_textFlags |= 0x20u;
  self->_numberOfLines = numberOfLines;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentTextProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UIListContentTextProperties;
  uint64_t v5 = [(UIListContentTextProperties *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
    font = v5->_font;
    v5->_font = (UIFont *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v5->_color;
    v5->_color = (UIColor *)v10;

    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v5, [v4 decodeIntegerForKey:@"colorTransformerIdentifier"]);
    v5->_int64_t alignment = [v4 decodeIntegerForKey:@"alignment"];
    v5->_lineBreakMode = [v4 decodeIntegerForKey:@"lineBreakMode"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedText"];
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v12;

    v5->_numberOfLines = [v4 decodeIntegerForKey:@"numberOfLines"];
    v5->_adjustsFontSizeToFitWidth = [v4 decodeBoolForKey:@"adjustsFontSizeToFitWidth"];
    [v4 decodeDoubleForKey:@"minimumScaleFactor"];
    v5->_minimumScaleFactor = v14;
    v5->_allowsDefaultTighteningForTruncation = [v4 decodeBoolForKey:@"allowsDefaultTighteningForTruncation"];
    v5->_adjustsFontForContentSizeCategory = [v4 decodeBoolForKey:@"adjustsFontForContentSizeCategory"];
    v5->_showsExpansionTextWhenTruncated = [v4 decodeBoolForKey:@"showsExpansionTextWhenTruncated"];
    v5->_transform = [v4 decodeIntegerForKey:@"transform"];
    v5->__enablesMarqueeWhenAncestorFocused = [v4 decodeBoolForKey:@"marqueeWhenAncestorFocused"];
    BOOL v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFE | [v4 decodeBoolForKey:v15];

    uint64_t v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"color"];
    if ([v4 decodeBoolForKey:v16]) {
      __int16 v17 = 2;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFD | v17;

    id v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"colorTransformerIdentifier"];
    if ([v4 decodeBoolForKey:v18]) {
      __int16 v19 = 4;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFB | v19;

    v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"alignment"];
    if ([v4 decodeBoolForKey:v20]) {
      __int16 v21 = 8;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFF7 | v21;

    v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
    if ([v4 decodeBoolForKey:v22]) {
      __int16 v23 = 16;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFEF | v23;

    v24 = [NSString stringWithFormat:@"hasCustomized-%@", @"numberOfLines"];
    if ([v4 decodeBoolForKey:v24]) {
      __int16 v25 = 32;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFDF | v25;

    v26 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontSizeToFitWidth"];
    if ([v4 decodeBoolForKey:v26]) {
      __int16 v27 = 64;
    }
    else {
      __int16 v27 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFBF | v27;

    v28 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumScaleFactor"];
    if ([v4 decodeBoolForKey:v28]) {
      __int16 v29 = 128;
    }
    else {
      __int16 v29 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFF7F | v29;

    v30 = [NSString stringWithFormat:@"hasCustomized-%@", @"allowsDefaultTighteningForTruncation"];
    if ([v4 decodeBoolForKey:v30]) {
      __int16 v31 = 256;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFEFF | v31;

    v32 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontForContentSizeCategory"];
    if ([v4 decodeBoolForKey:v32]) {
      __int16 v33 = 512;
    }
    else {
      __int16 v33 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFDFF | v33;

    v34 = [NSString stringWithFormat:@"hasCustomized-%@", @"showsExpansionTextWhenTruncated"];
    if ([v4 decodeBoolForKey:v34]) {
      __int16 v35 = 1024;
    }
    else {
      __int16 v35 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFBFF | v35;

    v36 = [NSString stringWithFormat:@"hasCustomized-%@", @"transform"];
    if ([v4 decodeBoolForKey:v36]) {
      __int16 v37 = 2048;
    }
    else {
      __int16 v37 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xF7FF | v37;

    v38 = [NSString stringWithFormat:@"hasCustomized-%@", @"marqueeWhenAncestorFocused"];
    if ([v4 decodeBoolForKey:v38]) {
      __int16 v39 = 4096;
    }
    else {
      __int16 v39 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xEFFF | v39;
  }
  return v5;
}

- (void)_setColorTransformerIdentifier:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = _UIConfigurationColorTransformerForIdentifier(a2);
    uint64_t v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;

    if (*(void *)(a1 + 48)) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = 0;
    }
    *(void *)(a1 + 104) = v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_font forKey:@"font"];
  [v5 encodeObject:self->_color forKey:@"color"];
  [v5 encodeInteger:self->_colorTransformerIdentifier forKey:@"colorTransformerIdentifier"];
  [v5 encodeInteger:self->_alignment forKey:@"alignment"];
  [v5 encodeInteger:self->_lineBreakMode forKey:@"lineBreakMode"];
  [v5 encodeObject:self->_attributedText forKey:@"attributedText"];
  [v5 encodeInteger:self->_numberOfLines forKey:@"numberOfLines"];
  [v5 encodeBool:self->_adjustsFontSizeToFitWidth forKey:@"adjustsFontSizeToFitWidth"];
  [v5 encodeDouble:@"minimumScaleFactor" forKey:self->_minimumScaleFactor];
  [v5 encodeBool:self->_allowsDefaultTighteningForTruncation forKey:@"allowsDefaultTighteningForTruncation"];
  [v5 encodeBool:self->_adjustsFontForContentSizeCategory forKey:@"adjustsFontForContentSizeCategory"];
  [v5 encodeBool:self->_showsExpansionTextWhenTruncated forKey:@"showsExpansionTextWhenTruncated"];
  [v5 encodeInteger:self->_transform forKey:@"transform"];
  [v5 encodeBool:self->__enablesMarqueeWhenAncestorFocused forKey:@"marqueeWhenAncestorFocused"];
  uint64_t v6 = *(_WORD *)&self->_textFlags & 1;
  uint64_t v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(_WORD *)&self->_textFlags >> 1) & 1;
  uint64_t v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"color"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_textFlags >> 2) & 1;
  BOOL v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"colorTransformerIdentifier"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_textFlags >> 3) & 1;
  BOOL v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"alignment"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_textFlags >> 4) & 1;
  BOOL v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
  [v5 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(_WORD *)&self->_textFlags >> 5) & 1;
  __int16 v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"numberOfLines"];
  [v5 encodeBool:v16 forKey:v17];

  uint64_t v18 = (*(_WORD *)&self->_textFlags >> 6) & 1;
  __int16 v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontSizeToFitWidth"];
  [v5 encodeBool:v18 forKey:v19];

  uint64_t v20 = (*(_WORD *)&self->_textFlags >> 7) & 1;
  __int16 v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumScaleFactor"];
  [v5 encodeBool:v20 forKey:v21];

  uint64_t v22 = HIBYTE(*(_WORD *)&self->_textFlags) & 1;
  __int16 v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"allowsDefaultTighteningForTruncation"];
  [v5 encodeBool:v22 forKey:v23];

  uint64_t v24 = (*(_WORD *)&self->_textFlags >> 9) & 1;
  __int16 v25 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontForContentSizeCategory"];
  [v5 encodeBool:v24 forKey:v25];

  uint64_t v26 = (*(_WORD *)&self->_textFlags >> 10) & 1;
  __int16 v27 = [NSString stringWithFormat:@"hasCustomized-%@", @"showsExpansionTextWhenTruncated"];
  [v5 encodeBool:v26 forKey:v27];

  uint64_t v28 = (*(_WORD *)&self->_textFlags >> 11) & 1;
  __int16 v29 = [NSString stringWithFormat:@"hasCustomized-%@", @"transform"];
  [v5 encodeBool:v28 forKey:v29];

  uint64_t v30 = (*(_WORD *)&self->_textFlags >> 12) & 1;
  id v31 = [NSString stringWithFormat:@"hasCustomized-%@", @"marqueeWhenAncestorFocused"];
  [v5 encodeBool:v30 forKey:v31];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UIListContentTextProperties *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self, v5, 0);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToProperties:(int)a3 compareText:
{
  id v5 = a2;
  if (a1)
  {
    if (-[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](a1, v5, a3))
    {
      a1 = 1;
      goto LABEL_30;
    }
    if (a3)
    {
      char v6 = (void *)*((void *)v5 + 3);
      id v7 = *(id *)(a1 + 24);
      id v8 = v6;
      if (v7 == v8)
      {
      }
      else
      {
        uint64_t v9 = v8;
        if (!v7 || !v8) {
          goto LABEL_28;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10) {
          goto LABEL_29;
        }
      }
      BOOL v11 = (void *)*((void *)v5 + 9);
      id v7 = *(id *)(a1 + 72);
      id v12 = v11;
      if (v7 == v12)
      {
      }
      else
      {
        uint64_t v9 = v12;
        if (!v7 || !v12) {
          goto LABEL_28;
        }
        int v13 = [v7 isEqual:v12];

        if (!v13) {
          goto LABEL_29;
        }
      }
    }
    uint64_t v14 = (void *)*((void *)v5 + 4);
    id v7 = *(id *)(a1 + 32);
    id v15 = v14;
    if (v7 == v15)
    {
    }
    else
    {
      uint64_t v9 = v15;
      if (!v7 || !v15) {
        goto LABEL_28;
      }
      int v16 = [v7 isEqual:v15];

      if (!v16) {
        goto LABEL_29;
      }
    }
    __int16 v17 = (void *)*((void *)v5 + 5);
    id v7 = *(id *)(a1 + 40);
    id v18 = v17;
    if (v7 == v18)
    {

      goto LABEL_32;
    }
    uint64_t v9 = v18;
    if (v7 && v18)
    {
      int v19 = [v7 isEqual:v18];

      if (v19)
      {
LABEL_32:
        uint64_t v21 = *(void *)(a1 + 104);
        if (v21 == *((void *)v5 + 13)
          && (v21 != 1 || *(void *)(a1 + 48) == *((void *)v5 + 6))
          && *(void *)(a1 + 56) == *((void *)v5 + 7)
          && *(void *)(a1 + 64) == *((void *)v5 + 8)
          && *(void *)(a1 + 80) == *((void *)v5 + 10)
          && *(unsigned __int8 *)(a1 + 12) == v5[12]
          && *(double *)(a1 + 88) == *((double *)v5 + 11)
          && *(unsigned __int8 *)(a1 + 13) == v5[13]
          && *(unsigned __int8 *)(a1 + 14) == v5[14]
          && *(unsigned __int8 *)(a1 + 15) == v5[15]
          && *(void *)(a1 + 96) == *((void *)v5 + 12))
        {
          a1 = *(unsigned __int8 *)(a1 + 16) == v5[16];
          goto LABEL_30;
        }
      }
LABEL_29:
      a1 = 0;
      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:

  return a1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIFont *)self->_font hash];
  return [(UIColor *)self->_color hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_attributedText)
  {
    BOOL v4 = +[UIView _shouldRedactTextInDescription];
    id v5 = NSString;
    if (v4)
    {
      char v6 = [(NSAttributedString *)self->_attributedText string];
      id v7 = _UIViewTextRedactedIfNecessaryForDescription(v6);
      id v8 = [v5 stringWithFormat:@"attributedText = %@", v7];
      [v3 addObject:v8];

LABEL_15:
      goto LABEL_16;
    }
    [NSString stringWithFormat:@"attributedText = %@", self->_attributedText];
    char v6 = LABEL_14:;
    [v3 addObject:v6];
    goto LABEL_15;
  }
  text = self->_text;
  if (text)
  {
    int v10 = NSString;
    BOOL v11 = _UIViewTextRedactedIfNecessaryForDescription(text);
    id v12 = [v10 stringWithFormat:@"text = %@", v11];
    [v3 addObject:v12];
  }
  int v13 = [NSString stringWithFormat:@"font = %@", self->_font];
  [v3 addObject:v13];

  uint64_t v14 = [NSString stringWithFormat:@"color = %@", self->_color];
  [v3 addObject:v14];

  unint64_t colorTransformerIdentifier = self->_colorTransformerIdentifier;
  if (colorTransformerIdentifier)
  {
    int v16 = NSString;
    __int16 v17 = _UIConfigurationColorTransformerIdentifierToString(colorTransformerIdentifier);
    id v18 = [v16 stringWithFormat:@"colorTransformer = %@", v17];
    [v3 addObject:v18];
  }
  int64_t alignment = self->_alignment;
  if (alignment)
  {
    if (alignment == 1) {
      uint64_t v20 = @"center";
    }
    else {
      uint64_t v20 = @"justified";
    }
    [NSString stringWithFormat:@"int64_t alignment = %@", v20];
    goto LABEL_14;
  }
LABEL_16:
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfLines = %ld", self->_numberOfLines);
  [v3 addObject:v21];

  if (self->_adjustsFontSizeToFitWidth) {
    [v3 addObject:@"adjustsFontSizeToFitWidth = YES"];
  }
  if (self->_minimumScaleFactor != 0.0)
  {
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"minimumScaleFactor = %g", *(void *)&self->_minimumScaleFactor);
    [v3 addObject:v22];
  }
  if (self->_allowsDefaultTighteningForTruncation) {
    [v3 addObject:@"allowsDefaultTighteningForTruncation = YES"];
  }
  if (self->_adjustsFontForContentSizeCategory) {
    [v3 addObject:@"adjustsFontForContentSizeCategory = YES"];
  }
  if (self->_showsExpansionTextWhenTruncated) {
    [v3 addObject:@"showsExpansionTextWhenTruncated = YES"];
  }
  unint64_t v23 = self->_transform - 1;
  if (v23 <= 2) {
    [v3 addObject:off_1E53093A8[v23]];
  }
  if (self->__enablesMarqueeWhenAncestorFocused) {
    [v3 addObject:@"enablesMarqueeWhenAncestorFocused = YES"];
  }
  uint64_t v24 = NSString;
  __int16 v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  __int16 v27 = [v3 componentsJoinedByString:@"; "];
  uint64_t v28 = [v24 stringWithFormat:@"<%@: %p; %@>", v26, self, v27];

  return v28;
}

- (id)debugDescription
{
  return +[UIView _descriptionWithoutTextRedactionForObject:self];
}

- (__CFString)_shortDescription
{
  v1 = a1;
  if (a1)
  {
    length = (void *)a1->length;
    uint64_t info = v1[2].info;
    if (length)
    {
      if (!info)
      {
        uint64_t v4 = _UIViewTextRedactedIfNecessaryForDescription(length);
LABEL_9:
        v1 = (__CFString *)v4;
        goto LABEL_11;
      }
LABEL_6:
      BOOL v5 = +[UIView _shouldRedactTextInDescription];
      char v6 = (void *)v1[2].info;
      if (v5)
      {
        id v7 = [v6 string];
        _UIViewTextRedactedIfNecessaryForDescription(v7);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      uint64_t v4 = [v6 description];
      goto LABEL_9;
    }
    if (info) {
      goto LABEL_6;
    }
    v1 = @"none";
  }
LABEL_11:
  return v1;
}

- (void)setFont:(UIFont *)font
{
  *(_WORD *)&self->_textFlags |= 1u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, font);
}

- (void)setColor:(UIColor *)color
{
  *(_WORD *)&self->_textFlags |= 2u;
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, color);
}

- (void)setColorTransformer:(UIConfigurationColorTransformer)colorTransformer
{
  *(_WORD *)&self->_textFlags |= 4u;
  -[UIListContentTextProperties _setColorTransformer:]((uint64_t)self, colorTransformer);
}

- (UIConfigurationColorTransformer)colorTransformer
{
  v2 = _Block_copy(self->_colorTransformer);
  return v2;
}

- (void)setAlignment:(UIListContentTextAlignment)alignment
{
  *(_WORD *)&self->_textFlags |= 8u;
  self->_int64_t alignment = alignment;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  *(_WORD *)&self->_textFlags |= 0x10u;
  self->_lineBreakMode = lineBreakMode;
}

- (NSLineBreakMode)lineBreakMode
{
  return self->_lineBreakMode;
}

- (NSInteger)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  *(_WORD *)&self->_textFlags |= 0x40u;
  self->_adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  *(_WORD *)&self->_textFlags |= 0x80u;
  self->_minimumScaleFactor = minimumScaleFactor;
}

- (CGFloat)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
  *(_WORD *)&self->_textFlags |= 0x100u;
  self->_allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return self->_allowsDefaultTighteningForTruncation;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory
{
  *(_WORD *)&self->_textFlags |= 0x200u;
  self->_adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated
{
  *(_WORD *)&self->_textFlags |= 0x400u;
  self->_showsExpansionTextWhenTruncated = showsExpansionTextWhenTruncated;
}

- (BOOL)showsExpansionTextWhenTruncated
{
  return self->_showsExpansionTextWhenTruncated;
}

- (void)setTransform:(UIListContentTextTransform)transform
{
  *(_WORD *)&self->_textFlags |= 0x800u;
  self->_transform = transform;
}

- (void)_setEnablesMarqueeWhenAncestorFocused:(BOOL)a3
{
  *(_WORD *)&self->_textFlags |= 0x1000u;
  self->__enablesMarqueeWhenAncestorFocused = a3;
}

- (BOOL)_enablesMarqueeWhenAncestorFocused
{
  return self->__enablesMarqueeWhenAncestorFocused;
}

@end