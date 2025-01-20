@interface PRXTextStyleDefinition
- (PRXTextStyleDefinition)initWithStyle:(int64_t)a3;
- (UIColor)textColor;
- (UIFont)font;
- (int64_t)numberOfLines;
- (int64_t)style;
- (int64_t)textAlignment;
- (unint64_t)accessibilityTraits;
@end

@implementation PRXTextStyleDefinition

- (PRXTextStyleDefinition)initWithStyle:(int64_t)a3
{
  v38.receiver = self;
  v38.super_class = (Class)PRXTextStyleDefinition;
  v4 = [(PRXTextStyleDefinition *)&v38 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    switch(a3)
    {
      case 0:
        uint64_t v6 = [MEMORY[0x263F1C550] labelColor];
        textColor = v5->_textColor;
        v5->_textColor = (UIColor *)v6;

        v8 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F8]];
        v9 = objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v8, "symbolicTraits") | 2);

        v10 = (void *)MEMORY[0x263F1C658];
        [v9 pointSize];
        uint64_t v11 = objc_msgSend(v10, "fontWithDescriptor:size:", v9);
        font = v5->_font;
        v5->_font = (UIFont *)v11;

        unint64_t v13 = *MEMORY[0x263F1CEF8];
        v5->_textAlignment = 1;
        v5->_accessibilityTraits = v13;
        v5->_numberOfLines = 0;

        break;
      case 1:
        uint64_t v14 = [MEMORY[0x263F1C550] labelColor];
        v15 = v5->_textColor;
        v5->_textColor = (UIColor *)v14;

        uint64_t v16 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D2C0] variant:256];
        v17 = v5->_font;
        v5->_font = (UIFont *)v16;

        goto LABEL_7;
      case 2:
        uint64_t v18 = [MEMORY[0x263F1C550] labelColor];
        v19 = v5->_textColor;
        v5->_textColor = (UIColor *)v18;

        uint64_t v20 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        goto LABEL_10;
      case 3:
        uint64_t v21 = [MEMORY[0x263F1C550] secondaryLabelColor];
        v22 = v5->_textColor;
        v5->_textColor = (UIColor *)v21;

        v23 = [MEMORY[0x263F1C668] defaultMetrics];
        v24 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
        uint64_t v25 = [v23 scaledFontForFont:v24];
        v26 = v5->_font;
        v5->_font = (UIFont *)v25;

LABEL_7:
        uint64_t v27 = 1;
        goto LABEL_11;
      case 4:
        uint64_t v28 = [MEMORY[0x263F1C550] labelColor];
        v29 = v5->_textColor;
        v5->_textColor = (UIColor *)v28;

        uint64_t v30 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D308] variant:1280];
        v31 = v5->_font;
        v5->_font = (UIFont *)v30;

        unint64_t v32 = *MEMORY[0x263F1CEF8];
        v5->_textAlignment = 4;
        v5->_accessibilityTraits = v32;
        goto LABEL_12;
      case 5:
        uint64_t v33 = [MEMORY[0x263F1C550] secondaryLabelColor];
        v34 = v5->_textColor;
        v5->_textColor = (UIColor *)v33;

        uint64_t v20 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D260] variant:256];
LABEL_10:
        v35 = v5->_font;
        v5->_font = (UIFont *)v20;

        uint64_t v27 = 4;
LABEL_11:
        v5->_textAlignment = v27;
LABEL_12:
        v5->_numberOfLines = 0;
        break;
      default:
        break;
    }
    v36 = v5;
  }

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (unint64_t)accessibilityTraits
{
  return self->_accessibilityTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end