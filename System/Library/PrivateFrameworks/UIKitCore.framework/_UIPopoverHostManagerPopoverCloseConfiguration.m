@interface _UIPopoverHostManagerPopoverCloseConfiguration
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (UIWindow)parentWindow;
- (UIWindow)popoverWindow;
- (void)setParentWindow:(id)a3;
- (void)setPopoverWindow:(id)a3;
- (void)setTransitionCoordinator:(id)a3;
@end

@implementation _UIPopoverHostManagerPopoverCloseConfiguration

- (UIWindow)popoverWindow
{
  return self->_popoverWindow;
}

- (void)setPopoverWindow:(id)a3
{
}

- (UIWindow)parentWindow
{
  return self->_parentWindow;
}

- (void)setParentWindow:(id)a3
{
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_parentWindow, 0);
  objc_storeStrong((id *)&self->_popoverWindow, 0);
}

@end