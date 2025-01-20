@interface TVMonogramImageConfiguration
- (NSString)firstName;
- (NSString)lastName;
- (NSString)text;
- (TVMonogramImageConfiguration)initWithStyle:(int64_t)a3;
- (UIColor)bgColor;
- (UIColor)textColor;
- (UIFont)font;
- (double)diameter;
- (double)focusedSizeIncrease;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)setBgColor:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setFirstName:(id)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setFont:(id)a3;
- (void)setLastName:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation TVMonogramImageConfiguration

- (TVMonogramImageConfiguration)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TVMonogramImageConfiguration;
  v4 = [(TVMonogramImageConfiguration *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    uint64_t v6 = [MEMORY[0x263F1C658] systemFontOfSize:106.0 weight:*MEMORY[0x263F1D328]];
    font = v5->_font;
    v5->_font = (UIFont *)v6;

    *(_OWORD *)&v5->_diameter = xmmword_230C37FB0;
    if (a3 == 2)
    {
      v8 = (void *)MEMORY[0x263F1C550];
      double v9 = 0.6;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v8 = (void *)MEMORY[0x263F1C550];
      double v9 = 0.9;
LABEL_6:
      uint64_t v10 = [v8 colorWithWhite:1.0 alpha:v9];
      bgColor = v5->_bgColor;
      v5->_bgColor = (UIColor *)v10;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_firstName copyWithZone:a3];
  double v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_lastName copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(void *)(v5 + 8) = self->_style;
  uint64_t v12 = [(UIFont *)self->_font copyWithZone:a3];
  objc_super v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(double *)(v5 + 56) = self->_diameter;
  *(double *)(v5 + 64) = self->_focusedSizeIncrease;
  uint64_t v14 = [(UIColor *)self->_bgColor copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(UIColor *)self->_textColor copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  return (id)v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (void)setBgColor:(id)a3
{
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end