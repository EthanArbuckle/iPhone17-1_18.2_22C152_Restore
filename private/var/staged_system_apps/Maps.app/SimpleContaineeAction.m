@interface SimpleContaineeAction
- (NSString)accessibilityIdentifier;
- (NSString)footer;
- (NSString)glyph;
- (NSString)labelAccessibilityIdentifier;
- (NSString)title;
- (UIImage)symbol;
- (id)action;
- (int64_t)style;
- (unint64_t)glyphStyle;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAction:(id)a3;
- (void)setFooter:(id)a3;
- (void)setGlyph:(id)a3;
- (void)setGlyphStyle:(unint64_t)a3;
- (void)setLabelAccessibilityIdentifier:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSymbol:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SimpleContaineeAction

- (void)setTitle:(id)a3
{
  v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  accessibilityIdentifier = self->_accessibilityIdentifier;
  self->_accessibilityIdentifier = 0;

  labelAccessibilityIdentifier = self->_labelAccessibilityIdentifier;
  self->_labelAccessibilityIdentifier = 0;
}

- (NSString)accessibilityIdentifier
{
  if (!self->_accessibilityIdentifier)
  {
    v3 = [(SimpleContaineeAction *)self title];
    id v4 = [v3 length];

    if (v4)
    {
      v5 = [(SimpleContaineeAction *)self title];
      v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_101324E70];

      v7 = +[NSString stringWithFormat:@"%@Action", v6];
      accessibilityIdentifier = self->_accessibilityIdentifier;
      self->_accessibilityIdentifier = v7;
    }
  }
  v9 = self->_accessibilityIdentifier;

  return v9;
}

- (NSString)labelAccessibilityIdentifier
{
  if (!self->_labelAccessibilityIdentifier)
  {
    v3 = [(SimpleContaineeAction *)self title];
    id v4 = [v3 length];

    if (v4)
    {
      v5 = [(SimpleContaineeAction *)self title];
      labelAccessibilityIdentifier = self->_labelAccessibilityIdentifier;
      self->_labelAccessibilityIdentifier = v5;
    }
  }
  v7 = self->_labelAccessibilityIdentifier;

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (UIImage)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (unint64_t)glyphStyle
{
  return self->_glyphStyle;
}

- (void)setGlyphStyle:(unint64_t)a3
{
  self->_glyphStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void)setLabelAccessibilityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end