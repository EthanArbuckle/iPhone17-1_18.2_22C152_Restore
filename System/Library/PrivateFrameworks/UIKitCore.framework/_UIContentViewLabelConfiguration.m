@interface _UIContentViewLabelConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasNonEmptyPlainTextOnly;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)highlightedTextColor;
- (UIColor)textColor;
- (UIFont)font;
- (_UIContentViewLabelConfiguration)init;
- (_UIContentViewLabelConfiguration)initWithCoder:(id)a3;
- (__CFString)_shortDescription;
- (double)minimumScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_effectiveTextAlignment;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (uint64_t)_isEqualToConfiguration:(uint64_t)a1;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1;
- (void)_applyToTextField:(uint64_t)a1;
- (void)_configureWithConstants:(void *)a3 traitCollection:(uint64_t)a4 forSidebar:;
- (void)applyToLabel:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _UIContentViewLabelConfiguration

- (_UIContentViewLabelConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContentViewLabelConfiguration;
  v2 = [(_UIContentViewLabelConfiguration *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[UILabel defaultFont];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    uint64_t v5 = +[UILabel _defaultColor];
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(4uLL);
    *((void *)v2 + 8) = 1;
  }
  return (_UIContentViewLabelConfiguration *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIContentViewLabelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UIContentViewLabelConfiguration;
  uint64_t v5 = [(_UIContentViewLabelConfiguration *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
    font = v5->_font;
    v5->_font = (UIFont *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
    textColor = v5->_textColor;
    v5->_textColor = (UIColor *)v10;

    v5->_textAlignment = [v4 decodeIntegerForKey:@"textAlignment"];
    v5->_lineBreakMode = [v4 decodeIntegerForKey:@"lineBreakMode"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedText"];
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highlightedTextColor"];
    highlightedTextColor = v5->_highlightedTextColor;
    v5->_highlightedTextColor = (UIColor *)v14;

    v5->_numberOfLines = [v4 decodeIntegerForKey:@"numberOfLines"];
    v5->_adjustsFontSizeToFitWidth = [v4 decodeBoolForKey:@"adjustsFontSizeToFitWidth"];
    [v4 decodeDoubleForKey:@"minimumScaleFactor"];
    v5->_minimumScaleFactor = v16;
    v5->_allowsDefaultTighteningForTruncation = [v4 decodeBoolForKey:@"allowsDefaultTighteningForTruncation"];
    v5->_adjustsFontForContentSizeCategory = [v4 decodeBoolForKey:@"adjustsFontForContentSizeCategory"];
    v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | [v4 decodeBoolForKey:v17];

    v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"textColor"];
    if ([v4 decodeBoolForKey:v18]) {
      __int16 v19 = 2;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v19;

    v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"textAlignment"];
    if ([v4 decodeBoolForKey:v20]) {
      __int16 v21 = 4;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v21;

    v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
    if ([v4 decodeBoolForKey:v22]) {
      __int16 v23 = 8;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v23;

    v24 = [NSString stringWithFormat:@"hasCustomized-%@", @"numberOfLines"];
    if ([v4 decodeBoolForKey:v24]) {
      __int16 v25 = 16;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v25;

    v26 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontSizeToFitWidth"];
    if ([v4 decodeBoolForKey:v26]) {
      __int16 v27 = 32;
    }
    else {
      __int16 v27 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v27;

    v28 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumScaleFactor"];
    if ([v4 decodeBoolForKey:v28]) {
      __int16 v29 = 64;
    }
    else {
      __int16 v29 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v29;

    v30 = [NSString stringWithFormat:@"hasCustomized-%@", @"allowsDefaultTighteningForTruncation"];
    if ([v4 decodeBoolForKey:v30]) {
      __int16 v31 = 128;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v31;

    v32 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontForContentSizeCategory"];
    if ([v4 decodeBoolForKey:v32]) {
      __int16 v33 = 256;
    }
    else {
      __int16 v33 = 0;
    }
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_font forKey:@"font"];
  [v5 encodeObject:self->_textColor forKey:@"textColor"];
  [v5 encodeInteger:self->_textAlignment forKey:@"textAlignment"];
  [v5 encodeInteger:self->_lineBreakMode forKey:@"lineBreakMode"];
  [v5 encodeObject:self->_attributedText forKey:@"attributedText"];
  [v5 encodeObject:self->_highlightedTextColor forKey:@"highlightedTextColor"];
  [v5 encodeInteger:self->_numberOfLines forKey:@"numberOfLines"];
  [v5 encodeBool:self->_adjustsFontSizeToFitWidth forKey:@"adjustsFontSizeToFitWidth"];
  [v5 encodeDouble:@"minimumScaleFactor" forKey:self->_minimumScaleFactor];
  [v5 encodeBool:self->_allowsDefaultTighteningForTruncation forKey:@"allowsDefaultTighteningForTruncation"];
  [v5 encodeBool:self->_adjustsFontForContentSizeCategory forKey:@"adjustsFontForContentSizeCategory"];
  uint64_t v6 = *(_WORD *)&self->_configurationFlags & 1;
  v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"textColor"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"textAlignment"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"numberOfLines"];
  [v5 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontSizeToFitWidth"];
  [v5 encodeBool:v16 forKey:v17];

  uint64_t v18 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  __int16 v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"minimumScaleFactor"];
  [v5 encodeBool:v18 forKey:v19];

  uint64_t v20 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  __int16 v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"allowsDefaultTighteningForTruncation"];
  [v5 encodeBool:v20 forKey:v21];

  uint64_t v22 = HIBYTE(*(_WORD *)&self->_configurationFlags) & 1;
  id v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"adjustsFontForContentSizeCategory"];
  [v5 encodeBool:v22 forKey:v23];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    uint64_t v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    objc_storeStrong((id *)(v4 + 24), self->_font);
    objc_storeStrong((id *)(v4 + 32), self->_textColor);
    *(void *)(v4 + 40) = self->_textAlignment;
    *(void *)(v4 + 48) = self->_lineBreakMode;
    uint64_t v7 = [(NSAttributedString *)self->_attributedText copy];
    uint64_t v8 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v7;

    objc_storeStrong((id *)(v4 + 80), self->_highlightedTextColor);
    *(void *)(v4 + 64) = self->_numberOfLines;
    *(unsigned char *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 72) = self->_minimumScaleFactor;
    *(unsigned char *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(unsigned char *)(v4 + 14) = self->_adjustsFontForContentSizeCategory;
    *($2BEF3EB2D24F442B8EABED39D3219975 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIContentViewLabelConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToConfiguration:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if (-[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](a1, v3))
    {
LABEL_3:
      a1 = 1;
      goto LABEL_17;
    }
    uint64_t v4 = (void *)v3[3];
    id v5 = *(id *)(a1 + 24);
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      uint64_t v7 = v6;
      if (!v5 || !v6) {
        goto LABEL_15;
      }
      int v8 = [v5 isEqual:v6];

      if (!v8) {
        goto LABEL_16;
      }
    }
    v9 = (void *)v3[4];
    id v5 = *(id *)(a1 + 32);
    id v10 = v9;
    if (v5 == v10)
    {

LABEL_19:
      v13 = (void *)v3[10];
      id v14 = *(id *)(a1 + 80);
      id v15 = v13;
      if (v14 == v15)
      {

        goto LABEL_3;
      }
      uint64_t v16 = v15;
      if (v14 && v15)
      {
        int v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_3;
        }
      }
      else
      {
      }
LABEL_16:
      a1 = 0;
      goto LABEL_17;
    }
    uint64_t v7 = v10;
    if (v5 && v10)
    {
      int v11 = [v5 isEqual:v10];

      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_19;
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

  return a1;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  uint64_t v3 = a2;
  uint64_t v4 = (unsigned __int8 *)v3;
  if (a1)
  {
    if (v3 == (void *)a1)
    {
      a1 = 1;
    }
    else
    {
      id v5 = (void *)v3[2];
      id v6 = *(id *)(a1 + 16);
      id v7 = v5;
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = v7;
        if (!v6 || !v7)
        {

LABEL_22:
          a1 = 0;
          goto LABEL_23;
        }
        int v9 = [v6 isEqual:v7];

        if (!v9) {
          goto LABEL_22;
        }
      }
      if (*(void *)(a1 + 24) != *((void *)v4 + 3)
        || *(void *)(a1 + 32) != *((void *)v4 + 4)
        || *(void *)(a1 + 40) != *((void *)v4 + 5)
        || *(void *)(a1 + 48) != *((void *)v4 + 6)
        || !UIEqual(*(void **)(a1 + 56), *((void **)v4 + 7))
        || *(void *)(a1 + 80) != *((void *)v4 + 10)
        || *(void *)(a1 + 64) != *((void *)v4 + 8)
        || *(unsigned __int8 *)(a1 + 12) != v4[12]
        || *(double *)(a1 + 72) != *((double *)v4 + 9)
        || *(unsigned __int8 *)(a1 + 13) != v4[13])
      {
        goto LABEL_22;
      }
      a1 = *(unsigned __int8 *)(a1 + 14) == v4[14];
    }
  }
LABEL_23:

  return a1;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  uint64_t v4 = [(UIFont *)self->_font hash] ^ v3;
  unint64_t v5 = [(UIColor *)self->_textColor hash];
  return v4 ^ v5 ^ [(NSAttributedString *)self->_attributedText hash];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_attributedText)
  {
    [NSString stringWithFormat:@"attributedText = %@", self->_attributedText];
  }
  else
  {
    if (self->_text)
    {
      uint64_t v4 = [NSString stringWithFormat:@"text = %@", self->_text];
      [v3 addObject:v4];
    }
    unint64_t v5 = [NSString stringWithFormat:@"font = %@", self->_font];
    [v3 addObject:v5];

    [NSString stringWithFormat:@"textColor = %@", self->_textColor];
  id v6 = };
  [v3 addObject:v6];

  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfLines = %ld", self->_numberOfLines);
  [v3 addObject:v7];

  if (self->_adjustsFontSizeToFitWidth) {
    [v3 addObject:@"adjustsFontSizeToFitWidth = YES"];
  }
  if (self->_minimumScaleFactor != 0.0)
  {
    int v8 = objc_msgSend(NSString, "stringWithFormat:", @"minimumScaleFactor = %g", *(void *)&self->_minimumScaleFactor);
    [v3 addObject:v8];
  }
  if (self->_allowsDefaultTighteningForTruncation) {
    [v3 addObject:@"allowsDefaultTighteningForTruncation = YES"];
  }
  if (self->_adjustsFontForContentSizeCategory) {
    [v3 addObject:@"adjustsFontForContentSizeCategory = YES"];
  }
  int v9 = NSString;
  id v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  uint64_t v12 = [v3 componentsJoinedByString:@"; "];
  v13 = [v9 stringWithFormat:@"<%@: %p; %@>", v11, self, v12];

  return v13;
}

- (__CFString)_shortDescription
{
  if (a1)
  {
    data = a1->data;
    length = (void *)a1[1].length;
    if (data)
    {
      if (!length)
      {
        a1 = [NSString stringWithFormat:@"\"%@\"", data];
LABEL_7:
        uint64_t v1 = vars8;
        goto LABEL_8;
      }
    }
    else if (!length)
    {
      a1 = @"none";
      goto LABEL_7;
    }
    a1 = [length description];
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (BOOL)_hasNonEmptyPlainTextOnly
{
  return !self->_attributedText && [(NSString *)self->_text length] != 0;
}

- (int64_t)_effectiveTextAlignment
{
  return self->_textAlignment;
}

- (void)applyToLabel:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (!self->_attributedText)
  {
    unint64_t v5 = [v4 _content];
    int v6 = [v5 isAttributed];

    id v4 = v12;
    if (v6)
    {
      [v12 setAttributedText:0];
      id v4 = v12;
    }
  }
  [v4 setText:self->_text];
  id v7 = self->_font;
  if (self->_adjustsFontForContentSizeCategory && [v12 adjustsFontForContentSizeCategory])
  {
    int v8 = [v12 traitCollection];
    uint64_t v9 = [(UIFont *)v7 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v8];

    id v7 = (UIFont *)v9;
  }
  [v12 setFont:v7];
  [v12 setTextColor:self->_textColor];
  [v12 setTextAlignment:self->_textAlignment];
  unint64_t textAlignment = self->_textAlignment;
  if (textAlignment >= 4)
  {
    if ([v12 _shouldReverseLayoutDirection]) {
      uint64_t v11 = 10;
    }
    else {
      uint64_t v11 = 9;
    }
  }
  else
  {
    uint64_t v11 = qword_186B94918[textAlignment];
  }
  [v12 setContentMode:v11];
  [v12 setLineBreakMode:self->_lineBreakMode];
  if (self->_attributedText) {
    objc_msgSend(v12, "setAttributedText:");
  }
  [v12 setHighlightedTextColor:self->_highlightedTextColor];
  [v12 setNumberOfLines:self->_numberOfLines];
  [v12 setAdjustsFontSizeToFitWidth:self->_adjustsFontSizeToFitWidth];
  [v12 setMinimumScaleFactor:self->_minimumScaleFactor];
  [v12 setAllowsDefaultTighteningForTruncation:self->_allowsDefaultTighteningForTruncation];
  [v12 setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
}

- (void)_applyToTextField:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v9 = v3;
    if (*(void *)(a1 + 56))
    {
      [v3 setAttributedText:0];
      id v3 = v9;
    }
    [v3 setText:*(void *)(a1 + 16)];
    id v4 = *(id *)(a1 + 24);
    if (*(unsigned char *)(a1 + 14) && [v9 adjustsFontForContentSizeCategory])
    {
      unint64_t v5 = [v9 traitCollection];
      uint64_t v6 = [v4 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

      id v4 = (id)v6;
    }
    [v9 setFont:v4];
    [v9 setTextColor:*(void *)(a1 + 32)];
    [v9 setTextAlignment:*(void *)(a1 + 40)];
    unint64_t v7 = *(void *)(a1 + 40);
    if (v7 >= 4)
    {
      if ([v9 _shouldReverseLayoutDirection]) {
        uint64_t v8 = 10;
      }
      else {
        uint64_t v8 = 9;
      }
    }
    else
    {
      uint64_t v8 = qword_186B94918[v7];
    }
    [v9 setContentMode:v8];
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v9, "setAttributedText:");
    }
    [v9 setAdjustsFontSizeToFitWidth:0];
    [v9 setAdjustsFontForContentSizeCategory:*(unsigned __int8 *)(a1 + 14)];

    id v3 = v9;
  }
}

- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    __int16 v4 = *(_WORD *)(a1 + 8);
    id v14 = v3;
    if (v4)
    {
      if ((v4 & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        unint64_t v5 = (void *)*((void *)v3 + 3);
      }
      else {
        unint64_t v5 = 0;
      }
      objc_storeStrong((id *)(a1 + 24), v5);
      __int16 v4 = *(_WORD *)(a1 + 8);
      id v3 = v14;
      if ((v4 & 2) != 0)
      {
LABEL_4:
        if ((v4 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    if (v3) {
      uint64_t v6 = (void *)*((void *)v3 + 4);
    }
    else {
      uint64_t v6 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v6);
    __int16 v4 = *(_WORD *)(a1 + 8);
    id v3 = v14;
    if ((v4 & 4) != 0)
    {
LABEL_5:
      if ((v4 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
LABEL_18:
    if (v3) {
      uint64_t v7 = *((void *)v3 + 5);
    }
    else {
      uint64_t v7 = 0;
    }
    *(void *)(a1 + 40) = v7;
    if ((v4 & 8) != 0)
    {
LABEL_6:
      if ((v4 & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_24;
    }
LABEL_21:
    if (v3) {
      uint64_t v8 = *((void *)v3 + 6);
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)(a1 + 48) = v8;
    if ((v4 & 0x10) != 0)
    {
LABEL_7:
      if ((v4 & 0x20) != 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
LABEL_24:
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
      goto LABEL_30;
    }
LABEL_27:
    if (v3) {
      BOOL v10 = *((unsigned char *)v3 + 12) != 0;
    }
    else {
      BOOL v10 = 0;
    }
    *(unsigned char *)(a1 + 12) = v10;
    if ((v4 & 0x40) != 0)
    {
LABEL_9:
      if ((v4 & 0x80) != 0) {
        goto LABEL_10;
      }
      goto LABEL_33;
    }
LABEL_30:
    if (v3) {
      uint64_t v11 = *((void *)v3 + 9);
    }
    else {
      uint64_t v11 = 0;
    }
    *(void *)(a1 + 72) = v11;
    if ((v4 & 0x80) != 0)
    {
LABEL_10:
      if ((v4 & 0x100) != 0) {
        goto LABEL_39;
      }
LABEL_36:
      if (v3) {
        BOOL v13 = *((unsigned char *)v3 + 14) != 0;
      }
      else {
        BOOL v13 = 0;
      }
      *(unsigned char *)(a1 + 14) = v13;
      goto LABEL_39;
    }
LABEL_33:
    if (v3) {
      BOOL v12 = *((unsigned char *)v3 + 13) != 0;
    }
    else {
      BOOL v12 = 0;
    }
    *(unsigned char *)(a1 + 13) = v12;
    if ((v4 & 0x100) != 0) {
      goto LABEL_39;
    }
    goto LABEL_36;
  }
LABEL_39:
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id newValue = v4;
  if (v4)
  {
    attributedText = self->_attributedText;
    self->_attributedText = 0;
  }
  else if (!self)
  {
    goto LABEL_5;
  }
  objc_setProperty_nonatomic_copy(self, v5, newValue, 16);
  id v4 = newValue;
LABEL_5:
}

- (NSString)text
{
  return self->_text;
}

- (void)setFont:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)self, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setTextColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextAlignment:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_unint64_t textAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setLineBreakMode:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_lineBreakMode = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id newValue = v4;
  if (v4)
  {
    text = self->_text;
    self->_text = 0;
  }
  else if (!self)
  {
    goto LABEL_5;
  }
  objc_setProperty_nonatomic_copy(self, v5, newValue, 56);
  id v4 = newValue;
LABEL_5:
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setNumberOfLines:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_numberOfLines = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  self->_adjustsFontSizeToFitWidth = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setMinimumScaleFactor:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_minimumScaleFactor = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_allowsDefaultTighteningForTruncation = a3;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return self->_allowsDefaultTighteningForTruncation;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)_configureWithConstants:(void *)a3 traitCollection:(uint64_t)a4 forSidebar:
{
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    *(void *)(a1 + 64) = [v8 defaultLabelNumberOfLinesForSidebar:a4 traitCollection:v7];
    *(unsigned char *)(a1 + 13) = [v8 defaultLabelAllowsTighteningForTruncationForSidebar:a4 traitCollection:v7];
    [v8 defaultLabelMinimumScaleFactorForSidebar:a4 traitCollection:v7];
    double v10 = v9;

    *(unsigned char *)(a1 + 12) = v10 > 0.0;
    *(double *)(a1 + 72) = v10;
    *(unsigned char *)(a1 + 14) = 1;
  }
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end