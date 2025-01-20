@interface _TUISearchScopeBarContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)setIntrinsicContentSize:(CGSize)a3;
@end

@implementation _TUISearchScopeBarContainerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL IsAlmostEqualFloat = TUICGFloatIsAlmostEqualFloat(a3.width, 0.0);
  if (width == 1.79769313e308 || IsAlmostEqualFloat) {
    double width = self->_intrinsicContentSize.width;
  }
  if (TUICGFloatIsAlmostEqualFloat(height, 0.0) || height == 1.79769313e308) {
    double height = self->_intrinsicContentSize.height;
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  self->_intrinsicContentSize = a3;
}

@end