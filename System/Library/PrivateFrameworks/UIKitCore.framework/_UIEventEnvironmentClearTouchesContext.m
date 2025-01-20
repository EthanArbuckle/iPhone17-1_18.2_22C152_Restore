@interface _UIEventEnvironmentClearTouchesContext
- (UIView)view;
- (UIWindow)window;
@end

@implementation _UIEventEnvironmentClearTouchesContext

- (UIView)view
{
  return self->_view;
}

- (UIWindow)window
{
  return self->_window;
}

@end