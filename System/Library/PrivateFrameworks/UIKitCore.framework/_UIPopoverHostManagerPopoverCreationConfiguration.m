@interface _UIPopoverHostManagerPopoverCreationConfiguration
- (BOOL)showsArrow;
- (CGRect)sourceRectInParentUIWindow;
- (CGSize)contentSize;
- (UIView)sourceView;
- (UIViewController)contentViewController;
- (id)completionBlock;
- (int64_t)userInterfaceStyle;
- (unint64_t)permittedArrowDirections;
- (void)setCompletionBlock:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentViewController:(id)a3;
- (void)setPermittedArrowDirections:(unint64_t)a3;
- (void)setShowsArrow:(BOOL)a3;
- (void)setSourceRectInParentUIWindow:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation _UIPopoverHostManagerPopoverCreationConfiguration

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

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

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (BOOL)showsArrow
{
  return self->_showsArrow;
}

- (void)setShowsArrow:(BOOL)a3
{
  self->_showsArrow = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end