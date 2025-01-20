@interface _PKSimpleFieldView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)labelBlendMode;
- (NSString)valueBlendMode;
- (PKPassField)field;
- (UIColor)labelTextColor;
- (UIColor)valueTextColor;
- (UIFont)labelFont;
- (UIFont)valueFont;
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (_PKSimpleFieldView)initWithField:(id)a3;
- (double)verticalPadding;
- (id)description;
- (void)_evaluateVibrancyEnablement;
- (void)layoutSubviews;
- (void)setLabelBlendMode:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setLabelTextColor:(id)a3;
- (void)setValueBlendMode:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setValueTextColor:(id)a3;
- (void)setVerticalPadding:(double)a3;
@end

@implementation _PKSimpleFieldView

- (_PKSimpleFieldView)initWithField:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_PKSimpleFieldView;
  v6 = [(_PKSimpleFieldView *)&v18 init];
  v7 = v6;
  if (v6)
  {
    p_field = (id *)&v6->_field;
    objc_storeStrong((id *)&v6->_field, a3);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelLabel = v7->_labelLabel;
    v7->_labelLabel = v9;

    [(UILabel *)v7->_labelLabel setNumberOfLines:1];
    [(UILabel *)v7->_labelLabel setLineBreakMode:4];
    [(UILabel *)v7->_labelLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85658]];
    -[UILabel setTextAlignment:](v7->_labelLabel, "setTextAlignment:", [*p_field textAlignment]);
    v11 = v7->_labelLabel;
    v12 = [*p_field label];
    [(UILabel *)v11 setText:v12];

    [(_PKSimpleFieldView *)v7 addSubview:v7->_labelLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v7->_valueLabel;
    v7->_valueLabel = v13;

    [(UILabel *)v7->_valueLabel setNumberOfLines:1];
    [(UILabel *)v7->_valueLabel setLineBreakMode:4];
    [(UILabel *)v7->_valueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85B58]];
    -[UILabel setTextAlignment:](v7->_valueLabel, "setTextAlignment:", [*p_field textAlignment]);
    v15 = v7->_valueLabel;
    v16 = [*p_field value];
    [(UILabel *)v15 setText:v16];

    [(_PKSimpleFieldView *)v7 addSubview:v7->_valueLabel];
    [(_PKSimpleFieldView *)v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85570]];
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(_PKSimpleFieldView *)self frame];
  objc_msgSend(v3, "appendFormat:", @"frame = (%g %g; %g %g); ", v4, v5, v6, v7);
  v8 = [(UILabel *)self->_labelLabel text];
  if ([v8 length])
  {
    v9 = [(_PKSimpleFieldView *)self labelFont];
    [v9 pointSize];
    uint64_t v11 = v10;

    if ((unint64_t)[v8 length] >= 0x1A)
    {
      uint64_t v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      v14 = objc_msgSend(v8, "substringWithRange:", v12, v13);
      uint64_t v15 = [v14 stringByAppendingString:@"..."];

      v8 = (void *)v15;
    }
    [v3 appendFormat:@"<label = '%@'; font-size: %g>; ", v8, v11];
  }
  v16 = [(UILabel *)self->_valueLabel text];
  if ([v16 length])
  {
    v17 = [(_PKSimpleFieldView *)self valueFont];
    [v17 pointSize];
    uint64_t v19 = v18;

    if ((unint64_t)[v16 length] >= 0x1A)
    {
      uint64_t v20 = objc_msgSend(v16, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      v22 = objc_msgSend(v16, "substringWithRange:", v20, v21);
      uint64_t v23 = [v22 stringByAppendingString:@"..."];

      v16 = (void *)v23;
    }
    [v3 appendFormat:@"<value = '%@'; font-size: %g>", v16, v19];
  }
  [v3 appendString:@">"];
  v24 = [NSString stringWithString:v3];

  return v24;
}

- (UIFont)labelFont
{
  return [(UILabel *)self->_labelLabel font];
}

- (void)setLabelFont:(id)a3
{
}

- (UIColor)labelTextColor
{
  return [(UILabel *)self->_labelLabel textColor];
}

- (void)setLabelTextColor:(id)a3
{
}

- (NSString)labelBlendMode
{
  v2 = [(UILabel *)self->_labelLabel layer];
  v3 = [v2 compositingFilter];

  return (NSString *)v3;
}

- (void)setLabelBlendMode:(id)a3
{
  labelLabel = self->_labelLabel;
  id v5 = a3;
  uint64_t v6 = [(UILabel *)labelLabel layer];
  [v6 setCompositingFilter:v5];

  [(_PKSimpleFieldView *)self _evaluateVibrancyEnablement];
}

- (UIFont)valueFont
{
  return [(UILabel *)self->_valueLabel font];
}

- (void)setValueFont:(id)a3
{
}

- (UIColor)valueTextColor
{
  return [(UILabel *)self->_valueLabel textColor];
}

- (void)setValueTextColor:(id)a3
{
}

- (NSString)valueBlendMode
{
  v2 = [(UILabel *)self->_valueLabel layer];
  v3 = [v2 compositingFilter];

  return (NSString *)v3;
}

- (void)setValueBlendMode:(id)a3
{
  valueLabel = self->_valueLabel;
  id v5 = a3;
  uint64_t v6 = [(UILabel *)valueLabel layer];
  [v6 setCompositingFilter:v5];

  [(_PKSimpleFieldView *)self _evaluateVibrancyEnablement];
}

- (void)_evaluateVibrancyEnablement
{
  v3 = [(_PKSimpleFieldView *)self labelBlendMode];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(_PKSimpleFieldView *)self valueBlendMode];
    BOOL v4 = v5 == 0;
  }
  id v6 = [(_PKSimpleFieldView *)self layer];
  [v6 setAllowsGroupBlending:v4];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)_PKSimpleFieldView;
  [(_PKSimpleFieldView *)&v21 layoutSubviews];
  [(_PKSimpleFieldView *)self bounds];
  CGFloat v4 = v3;
  CGFloat rect = v5;
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v6, v8);
  CGFloat v11 = fmax(v9, v10);
  PKSizeAlignedInRect();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = rect;
  v23.size.width = v7;
  v23.size.height = v11;
  CGRectGetMaxY(v23);
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v7, v9);
  PKSizeAlignedInRect();
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
  if (v7 > v10) {
    double v10 = v7;
  }
  double v12 = v9 + v11 + self->_verticalPadding;
  result.double height = v12;
  result.double width = v10;
  return result;
}

- (PKPassField)field
{
  return self->_field;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end