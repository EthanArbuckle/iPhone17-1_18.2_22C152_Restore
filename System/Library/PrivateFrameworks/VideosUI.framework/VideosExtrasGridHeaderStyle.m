@interface VideosExtrasGridHeaderStyle
- (BOOL)showsImage;
- (NSDictionary)subtitleDefaultFontAttributes;
- (NSDictionary)titleDefaultFontAttributes;
- (NSString)subtitleTextStyle;
- (NSString)titleTextStyle;
- (UIColor)subtitleColor;
- (UIColor)titleColor;
- (UIEdgeInsets)insets;
- (double)bottomLabelDescender;
- (double)subtitleLineHeight;
- (double)titleLineHeight;
- (void)setBottomLabelDescender:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setShowsImage:(BOOL)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setSubtitleDefaultFontAttributes:(id)a3;
- (void)setSubtitleLineHeight:(double)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleDefaultFontAttributes:(id)a3;
- (void)setTitleLineHeight:(double)a3;
- (void)setTitleTextStyle:(id)a3;
@end

@implementation VideosExtrasGridHeaderStyle

- (BOOL)showsImage
{
  return self->_showsImage;
}

- (void)setShowsImage:(BOOL)a3
{
  self->_showsImage = a3;
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

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
}

- (double)titleLineHeight
{
  return self->_titleLineHeight;
}

- (void)setTitleLineHeight:(double)a3
{
  self->_titleLineHeight = a3;
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
}

- (double)subtitleLineHeight
{
  return self->_subtitleLineHeight;
}

- (void)setSubtitleLineHeight:(double)a3
{
  self->_subtitleLineHeight = a3;
}

- (double)bottomLabelDescender
{
  return self->_bottomLabelDescender;
}

- (void)setBottomLabelDescender:(double)a3
{
  self->_bottomLabelDescender = a3;
}

- (NSDictionary)titleDefaultFontAttributes
{
  return self->_titleDefaultFontAttributes;
}

- (void)setTitleDefaultFontAttributes:(id)a3
{
}

- (NSDictionary)subtitleDefaultFontAttributes
{
  return self->_subtitleDefaultFontAttributes;
}

- (void)setSubtitleDefaultFontAttributes:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_subtitleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end