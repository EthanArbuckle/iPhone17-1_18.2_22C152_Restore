@interface VUITextBadgeLayout
- (BOOL)isUppercased;
- (NSArray)gradientBgColors;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (UIEdgeInsets)padding;
- (VUITextLayout)textLayout;
- (double)layerCornerRadius;
- (double)minHeight;
- (int)blendMode;
- (unint64_t)badgeKind;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeKind:(unint64_t)a3;
- (void)setBlendMode:(int)a3;
- (void)setGradientBgColors:(id)a3;
- (void)setIsUppercased:(BOOL)a3;
- (void)setLayerCornerRadius:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setTextLayout:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation VUITextBadgeLayout

- (unint64_t)badgeKind
{
  return self->_badgeKind;
}

- (void)setBadgeKind:(unint64_t)a3
{
  self->_badgeKind = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)isUppercased
{
  return self->_isUppercased;
}

- (void)setIsUppercased:(BOOL)a3
{
  self->_isUppercased = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (void)setLayerCornerRadius:(double)a3
{
  self->_layerCornerRadius = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSArray)gradientBgColors
{
  return self->_gradientBgColors;
}

- (void)setGradientBgColors:(id)a3
{
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_gradientBgColors, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end