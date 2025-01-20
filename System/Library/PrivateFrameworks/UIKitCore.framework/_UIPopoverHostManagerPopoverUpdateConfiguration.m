@interface _UIPopoverHostManagerPopoverUpdateConfiguration
- (BOOL)isRTL;
- (BOOL)showsArrow;
- (CGRect)sourceRectInParentUIWindow;
- (CGSize)contentSize;
- (int64_t)preferredHorizontalAlignment;
- (void)setContentSize:(CGSize)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setPreferredHorizontalAlignment:(int64_t)a3;
- (void)setShowsArrow:(BOOL)a3;
- (void)setSourceRectInParentUIWindow:(CGRect)a3;
@end

@implementation _UIPopoverHostManagerPopoverUpdateConfiguration

- (CGRect)sourceRectInParentUIWindow
{
  double x = self->_sourceRectInParentUIWindow.origin.x;
  double y = self->_sourceRectInParentUIWindow.origin.y;
  double width = self->_sourceRectInParentUIWindow.size.width;
  double height = self->_sourceRectInParentUIWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRectInParentUIWindow:(CGRect)a3
{
  self->_sourceRectInParentUIWindow = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (int64_t)preferredHorizontalAlignment
{
  return self->_preferredHorizontalAlignment;
}

- (void)setPreferredHorizontalAlignment:(int64_t)a3
{
  self->_preferredHorizontalAlignment = a3;
}

- (BOOL)showsArrow
{
  return self->_showsArrow;
}

- (void)setShowsArrow:(BOOL)a3
{
  self->_showsArrow = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

@end