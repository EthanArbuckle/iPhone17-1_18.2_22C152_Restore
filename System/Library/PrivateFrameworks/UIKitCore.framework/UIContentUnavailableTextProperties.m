@interface UIContentUnavailableTextProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)isEqual:(id)a3;
- (CGFloat)minimumScaleFactor;
- (NSInteger)numberOfLines;
- (NSLineBreakMode)lineBreakMode;
- (UIColor)color;
- (UIContentUnavailableTextProperties)init;
- (UIContentUnavailableTextProperties)initWithCoder:(id)a3;
- (UIFont)font;
- (__CFString)_shortDescription;
- (id)attributedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_isEqualToProperties:(int)a3 compareText:;
- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareText:;
- (unint64_t)hash;
- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1;
- (void)_applyToLabel:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation;
- (void)setAttributedText:(uint64_t)a1;
- (void)setColor:(UIColor *)color;
- (void)setFont:(UIFont *)font;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor;
- (void)setNumberOfLines:(NSInteger)numberOfLines;
- (void)setText:(uint64_t)a1;
@end

@implementation UIContentUnavailableTextProperties

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    objc_storeStrong((id *)(v4 + 24), self->_font);
    objc_storeStrong((id *)(v4 + 32), self->_color);
    *(void *)(v4 + 40) = self->_lineBreakMode;
    uint64_t v7 = [(NSAttributedString *)self->_attributedText copy];
    v8 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v7;

    *(void *)(v4 + 56) = self->_numberOfLines;
    *(unsigned char *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 64) = self->_minimumScaleFactor;
    *(unsigned char *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(void *)(v4 + 72) = self->_alignment;
    *($14BB99B994CAB2479A3B1BA6E34B7634 *)(v4 + 8) = self->_textFlags;
  }
  return (id)v4;
}

- (UIContentUnavailableTextProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIContentUnavailableTextProperties;
  v2 = [(UIContentUnavailableTextProperties *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[UILabel defaultFont];
    font = v2->_font;
    v2->_font = (UIFont *)v3;

    uint64_t v5 = +[UILabel _defaultColor];
    color = v2->_color;
    v2->_color = (UIColor *)v5;

    v2->_lineBreakMode = 4;
    v2->_numberOfLines = 0;
    v2->_alignment = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)_applyToLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    if (!*(void *)(a1 + 48))
    {
      uint64_t v4 = [v3 _content];
      int v5 = [v4 isAttributed];

      id v3 = v7;
      if (v5)
      {
        [v7 setAttributedText:0];
        id v3 = v7;
      }
    }
    [v3 setText:*(void *)(a1 + 16)];
    [v7 setFont:*(void *)(a1 + 24)];
    [v7 setTextColor:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 72)) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 1;
    }
    [v7 setTextAlignment:v6];
    [v7 setContentMode:5];
    [v7 setLineBreakMode:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 48)) {
      objc_msgSend(v7, "setAttributedText:");
    }
    [v7 setNumberOfLines:*(void *)(a1 + 56)];
    [v7 setAdjustsFontSizeToFitWidth:*(unsigned __int8 *)(a1 + 12)];
    [v7 setMinimumScaleFactor:*(double *)(a1 + 64)];
    [v7 setAllowsDefaultTighteningForTruncation:*(unsigned __int8 *)(a1 + 13)];
    [v7 setAdjustsFontForContentSizeCategory:1];
    id v3 = v7;
  }
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v15 = v3;
    if (v5)
    {
      if ((v5 & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v3) {
        uint64_t v6 = (void *)*((void *)v3 + 2);
      }
      else {
        uint64_t v6 = 0;
      }
      objc_setProperty_nonatomic_copy((id)a1, v4, v6, 16);
      __int16 v5 = *(_WORD *)(a1 + 8);
      id v3 = v15;
      if ((v5 & 2) != 0)
      {
LABEL_4:
        if ((v5 & 4) != 0) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    if (v3) {
      id v7 = (void *)*((void *)v3 + 3);
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)(a1 + 24), v7);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v15;
    if ((v5 & 4) != 0)
    {
LABEL_5:
      if ((v5 & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
LABEL_18:
    if (v3) {
      objc_super v8 = (void *)*((void *)v3 + 4);
    }
    else {
      objc_super v8 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v8);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v15;
    if ((v5 & 8) != 0)
    {
LABEL_6:
      if ((v5 & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_24;
    }
LABEL_21:
    if (v3) {
      uint64_t v9 = *((void *)v3 + 5);
    }
    else {
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 40) = v9;
    if ((v5 & 0x10) != 0)
    {
LABEL_7:
      if ((v5 & 0x20) != 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (v3) {
      v10 = (void *)*((void *)v3 + 6);
    }
    else {
      v10 = 0;
    }
    objc_setProperty_nonatomic_copy((id)a1, v4, v10, 48);
    __int16 v5 = *(_WORD *)(a1 + 8);
    id v3 = v15;
    if ((v5 & 0x20) != 0)
    {
LABEL_8:
      if ((v5 & 0x40) != 0) {
        goto LABEL_9;
      }
      goto LABEL_30;
    }
LABEL_27:
    if (v3) {
      uint64_t v11 = *((void *)v3 + 7);
    }
    else {
      uint64_t v11 = 0;
    }
    *(void *)(a1 + 56) = v11;
    if ((v5 & 0x40) != 0)
    {
LABEL_9:
      if ((v5 & 0x80) != 0) {
        goto LABEL_10;
      }
      goto LABEL_33;
    }
LABEL_30:
    if (v3) {
      BOOL v12 = *((unsigned char *)v3 + 12) != 0;
    }
    else {
      BOOL v12 = 0;
    }
    *(unsigned char *)(a1 + 12) = v12;
    if ((v5 & 0x80) != 0)
    {
LABEL_10:
      if ((v5 & 0x100) != 0) {
        goto LABEL_39;
      }
LABEL_36:
      if (v3) {
        BOOL v14 = *((unsigned char *)v3 + 13) != 0;
      }
      else {
        BOOL v14 = 0;
      }
      *(unsigned char *)(a1 + 13) = v14;
      goto LABEL_39;
    }
LABEL_33:
    if (v3) {
      uint64_t v13 = *((void *)v3 + 8);
    }
    else {
      uint64_t v13 = 0;
    }
    *(void *)(a1 + 64) = v13;
    if ((v5 & 0x100) != 0) {
      goto LABEL_39;
    }
    goto LABEL_36;
  }
LABEL_39:
}

- (void)setText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 8) |= 1u;
    id newValue = v3;
    if (v3)
    {
      __int16 v5 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
    objc_setProperty_nonatomic_copy((id)a1, v4, newValue, 16);
    id v3 = newValue;
  }
}

- (uint64_t)_isEqualToProperties:(int)a3 compareText:
{
  __int16 v5 = a2;
  if (a1)
  {
    if (-[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](a1, v5, a3))
    {
      a1 = 1;
      goto LABEL_30;
    }
    if (a3)
    {
      uint64_t v6 = (void *)*((void *)v5 + 2);
      id v7 = *(id *)(a1 + 16);
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
      uint64_t v11 = (void *)*((void *)v5 + 6);
      id v7 = *(id *)(a1 + 48);
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
    BOOL v14 = (void *)*((void *)v5 + 3);
    id v7 = *(id *)(a1 + 24);
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
    v17 = (void *)*((void *)v5 + 4);
    id v7 = *(id *)(a1 + 32);
    id v18 = v17;
    if (v7 == v18)
    {

LABEL_32:
      if (*(void *)(a1 + 40) == *((void *)v5 + 5)
        && *(void *)(a1 + 56) == *((void *)v5 + 7)
        && *(unsigned __int8 *)(a1 + 12) == v5[12]
        && *(double *)(a1 + 64) == *((double *)v5 + 8)
        && *(unsigned __int8 *)(a1 + 13) == v5[13])
      {
        a1 = *(void *)(a1 + 72) == *((void *)v5 + 9);
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    uint64_t v9 = v18;
    if (v7 && v18)
    {
      int v19 = [v7 isEqual:v18];

      if (v19) {
        goto LABEL_32;
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

- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareText:
{
  __int16 v5 = a2;
  uint64_t v6 = (double *)v5;
  if (!a1) {
    goto LABEL_27;
  }
  if (v5 == (void *)a1)
  {
    a1 = 1;
    goto LABEL_27;
  }
  if (a3)
  {
    id v7 = (void *)v5[2];
    id v8 = *(id *)(a1 + 16);
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      int v10 = v9;
      if (!v8 || !v9) {
        goto LABEL_16;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_26;
      }
    }
    id v12 = (void *)*((void *)v6 + 6);
    id v8 = *(id *)(a1 + 48);
    id v13 = v12;
    if (v8 != v13)
    {
      int v10 = v13;
      if (v8 && v13)
      {
        int v14 = [v8 isEqual:v13];

        if (!v14) {
          goto LABEL_26;
        }
        goto LABEL_18;
      }
LABEL_16:

LABEL_26:
      a1 = 0;
      goto LABEL_27;
    }
  }
LABEL_18:
  if (*(void *)(a1 + 24) != *((void *)v6 + 3)
    || *(void *)(a1 + 32) != *((void *)v6 + 4)
    || *(void *)(a1 + 40) != *((void *)v6 + 5)
    || *(void *)(a1 + 56) != *((void *)v6 + 7)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12)
    || *(double *)(a1 + 64) != v6[8]
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v6 + 13))
  {
    goto LABEL_26;
  }
  a1 = *(void *)(a1 + 72) == *((void *)v6 + 9);
LABEL_27:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableTextProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIContentUnavailableTextProperties;
  __int16 v5 = [(UIContentUnavailableTextProperties *)&v33 init];
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

    v5->_lineBreakMode = [v4 decodeIntegerForKey:@"lineBreakMode"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedText"];
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v12;

    v5->_numberOfLines = [v4 decodeIntegerForKey:@"numberOfLines"];
    v5->_adjustsFontSizeToFitWidth = [v4 decodeBoolForKey:@"adjustsFontSizeToFitWidth"];
    [v4 decodeDoubleForKey:@"minimumScaleFactor"];
    v5->_minimumScaleFactor = v14;
    v5->_allowsDefaultTighteningForTruncation = [v4 decodeBoolForKey:@"allowsDefaultTighteningForTruncation"];
    v5->_alignment = [v4 decodeIntegerForKey:@"alignment"];
    id v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"text"];
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFE | [v4 decodeBoolForKey:v15];

    int v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
    if ([v4 decodeBoolForKey:v16]) {
      __int16 v17 = 2;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFD | v17;

    id v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"color"];
    if ([v4 decodeBoolForKey:v18]) {
      __int16 v19 = 4;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFB | v19;

    v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
    if ([v4 decodeBoolForKey:v20]) {
      __int16 v21 = 8;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFF7 | v21;

    v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"attributedText"];
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
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_font forKey:@"font"];
  [v5 encodeObject:self->_color forKey:@"color"];
  [v5 encodeInteger:self->_lineBreakMode forKey:@"lineBreakMode"];
  [v5 encodeObject:self->_attributedText forKey:@"attributedText"];
  [v5 encodeInteger:self->_numberOfLines forKey:@"numberOfLines"];
  [v5 encodeBool:self->_adjustsFontSizeToFitWidth forKey:@"adjustsFontSizeToFitWidth"];
  [v5 encodeDouble:@"minimumScaleFactor" forKey:self->_minimumScaleFactor];
  [v5 encodeBool:self->_allowsDefaultTighteningForTruncation forKey:@"allowsDefaultTighteningForTruncation"];
  [v5 encodeInteger:self->_alignment forKey:@"alignment"];
  uint64_t v6 = *(_WORD *)&self->_textFlags & 1;
  id v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"text"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(_WORD *)&self->_textFlags >> 1) & 1;
  id v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"font"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_textFlags >> 2) & 1;
  int v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"color"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_textFlags >> 3) & 1;
  id v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"lineBreakMode"];
  [v5 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_textFlags >> 4) & 1;
  id v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"attributedText"];
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
  id v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"allowsDefaultTighteningForTruncation"];
  [v5 encodeBool:v22 forKey:v23];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIContentUnavailableTextProperties *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self, v5, 0);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
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
    [NSString stringWithFormat:@"attributedText = %@", self->_attributedText];
  }
  else
  {
    if (self->_text)
    {
      id v4 = [NSString stringWithFormat:@"text = %@", self->_text];
      [v3 addObject:v4];
    }
    id v5 = [NSString stringWithFormat:@"font = %@", self->_font];
    [v3 addObject:v5];

    [NSString stringWithFormat:@"color = %@", self->_color];
  char v6 = };
  [v3 addObject:v6];

  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfLines = %ld", self->_numberOfLines);
  [v3 addObject:v7];

  if (self->_adjustsFontSizeToFitWidth) {
    [v3 addObject:@"adjustsFontSizeToFitWidth = YES"];
  }
  if (self->_minimumScaleFactor != 0.0)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"minimumScaleFactor = %g", *(void *)&self->_minimumScaleFactor);
    [v3 addObject:v8];
  }
  if (self->_allowsDefaultTighteningForTruncation) {
    [v3 addObject:@"allowsDefaultTighteningForTruncation = YES"];
  }
  if (self->_alignment) {
    id v9 = @"natural";
  }
  else {
    id v9 = @"center";
  }
  uint64_t v10 = [NSString stringWithFormat:@"alignment = %@", v9];
  [v3 addObject:v10];

  int v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  uint64_t v14 = [v3 componentsJoinedByString:@"; "];
  id v15 = [v11 stringWithFormat:@"<%@: %p; %@>", v13, self, v14];

  return v15;
}

- (__CFString)_shortDescription
{
  if (a1)
  {
    data = a1->data;
    id v3 = a1[1].data;
    if (data)
    {
      if (!v3)
      {
        a1 = [NSString stringWithFormat:@"\"%@\"", data];
LABEL_7:
        uint64_t v1 = vars8;
        goto LABEL_8;
      }
    }
    else if (!v3)
    {
      a1 = @"none";
      goto LABEL_7;
    }
    a1 = [v3 description];
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (void)setFont:(UIFont *)font
{
  *(_WORD *)&self->_textFlags |= 2u;
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)self, font);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setColor:(UIColor *)color
{
  *(_WORD *)&self->_textFlags |= 4u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, color);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  *(_WORD *)&self->_textFlags |= 8u;
  self->_lineBreakMode = lineBreakMode;
}

- (NSLineBreakMode)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setAttributedText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 8) |= 0x10u;
    id newValue = v3;
    if (v3)
    {
      id v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
    objc_setProperty_nonatomic_copy((id)a1, v4, newValue, 48);
    id v3 = newValue;
  }
}

- (id)attributedText
{
  if (a1)
  {
    a1 = (id *)a1[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  *(_WORD *)&self->_textFlags |= 0x20u;
  self->_numberOfLines = numberOfLines;
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

@end