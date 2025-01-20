@interface VideosExtrasGridSectionHeaderStyle
- (NSDictionary)defaultFontAttributes;
- (NSString)textStyle;
- (UIColor)textColor;
- (UIEdgeInsets)insets;
- (double)textBaselineDescender;
- (double)textBaselineHeight;
- (void)setDefaultFontAttributes:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setTextBaselineDescender:(double)a3;
- (void)setTextBaselineHeight:(double)a3;
- (void)setTextColor:(id)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation VideosExtrasGridSectionHeaderStyle

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
}

- (NSDictionary)defaultFontAttributes
{
  return self->_defaultFontAttributes;
}

- (void)setDefaultFontAttributes:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)textBaselineHeight
{
  return self->_textBaselineHeight;
}

- (void)setTextBaselineHeight:(double)a3
{
  self->_textBaselineHeight = a3;
}

- (double)textBaselineDescender
{
  return self->_textBaselineDescender;
}

- (void)setTextBaselineDescender:(double)a3
{
  self->_textBaselineDescender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_defaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
}

@end