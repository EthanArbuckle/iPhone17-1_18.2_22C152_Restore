@interface VUIGradientMaskProperties
+ (id)defaultGradientMaskProperties;
- (CGSize)minLengths;
- (UIEdgeInsets)minPadding;
- (void)setMinLengths:(CGSize)a3;
- (void)setMinPadding:(UIEdgeInsets)a3;
@end

@implementation VUIGradientMaskProperties

+ (id)defaultGradientMaskProperties
{
  v2 = objc_alloc_init(VUIGradientMaskProperties);
  -[VUIGradientMaskProperties setMinPadding:](v2, "setMinPadding:", 100.0, 100.0, 150.0, 100.0);
  -[VUIGradientMaskProperties setMinLengths:](v2, "setMinLengths:", 90.0, 90.0);
  return v2;
}

- (UIEdgeInsets)minPadding
{
  double top = self->_minPadding.top;
  double left = self->_minPadding.left;
  double bottom = self->_minPadding.bottom;
  double right = self->_minPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMinPadding:(UIEdgeInsets)a3
{
  self->_minPadding = a3;
}

- (CGSize)minLengths
{
  double width = self->_minLengths.width;
  double height = self->_minLengths.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinLengths:(CGSize)a3
{
  self->_minLengths = a3;
}

@end