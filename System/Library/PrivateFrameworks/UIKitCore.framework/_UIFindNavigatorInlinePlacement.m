@interface _UIFindNavigatorInlinePlacement
- (CGSize)intrinsicContentSize;
- (UIView)hostView;
- (void)setHostView:(id)a3;
- (void)setIntrinsicContentSize:(CGSize)a3;
@end

@implementation _UIFindNavigatorInlinePlacement

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

- (UIView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end