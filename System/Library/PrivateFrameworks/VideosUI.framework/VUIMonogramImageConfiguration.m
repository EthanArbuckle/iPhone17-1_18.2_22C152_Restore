@interface VUIMonogramImageConfiguration
- (NSString)text;
- (UIColor)bgColor;
- (UIColor)textColor;
- (UIFont)font;
- (VUIMonogramImageConfiguration)initWithStyle:(int64_t)a3;
- (double)diameter;
- (double)focusedSizeIncrease;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)setBgColor:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation VUIMonogramImageConfiguration

- (VUIMonogramImageConfiguration)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VUIMonogramImageConfiguration;
  v4 = [(VUIMonogramImageConfiguration *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    uint64_t v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:106.0 weight:3.0];
    font = v5->_font;
    v5->_font = (UIFont *)v6;

    *(_OWORD *)&v5->_diameter = xmmword_1E38FDF40;
    if (a3 == 2)
    {
      v8 = (void *)MEMORY[0x1E4FB1618];
      double v9 = 0.6;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v8 = (void *)MEMORY[0x1E4FB1618];
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
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 8) = self->_style;
  uint64_t v8 = [(UIFont *)self->_font copyWithZone:a3];
  double v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(double *)(v5 + 40) = self->_diameter;
  *(double *)(v5 + 48) = self->_focusedSizeIncrease;
  uint64_t v10 = [(UIColor *)self->_bgColor copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(UIColor *)self->_textColor copyWithZone:a3];
  objc_super v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  return (id)v5;
}

- (int64_t)style
{
  return self->_style;
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
}

@end