@interface _UIBridgedPresentationWindow
- (BOOL)isInternalWindow;
- (BOOL)shouldDisableRootPresentationAppearanceCallbacks;
- (void)_didCreateRootPresentationController;
- (void)setShouldDisableRootPresentationAppearanceCallbacks:(BOOL)a3;
@end

@implementation _UIBridgedPresentationWindow

- (BOOL)isInternalWindow
{
  return 0;
}

- (void)_didCreateRootPresentationController
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBridgedPresentationWindow;
  [(UIWindow *)&v5 _didCreateRootPresentationController];
  BOOL v3 = [(_UIBridgedPresentationWindow *)self shouldDisableRootPresentationAppearanceCallbacks];
  v4 = [(UIWindow *)self _rootPresentationController];
  objc_msgSend(v4, "set_shouldDisableAppearanceCallbacksForPresentedViewController:", v3);
}

- (BOOL)shouldDisableRootPresentationAppearanceCallbacks
{
  return self->_shouldDisableRootPresentationAppearanceCallbacks;
}

- (void)setShouldDisableRootPresentationAppearanceCallbacks:(BOOL)a3
{
  self->_shouldDisableRootPresentationAppearanceCallbacks = a3;
}

@end