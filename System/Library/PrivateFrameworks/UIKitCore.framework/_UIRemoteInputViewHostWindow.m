@interface _UIRemoteInputViewHostWindow
+ (BOOL)_isSecure;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_isHostedInAnotherProcess;
- (BOOL)_isRemoteInputHostWindow;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)_wantsSceneAssociation;
- (BOOL)canBecomeKeyWindow;
- (BOOL)inhibitSetupOrientation;
- (BOOL)isInternalWindow;
- (_UIRemoteInputViewHostWindow)initWithWindowScene:(id)a3;
- (_UIRemoteInputViewHostWindowDelegate)hostWindowDelegate;
- (id)firstResponder;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForSceneTransform;
- (int64_t)_orientationForViewTransform;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)setHostWindowDelegate:(id)a3;
@end

@implementation _UIRemoteInputViewHostWindow

- (_UIRemoteInputViewHostWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteInputViewHostWindow;
  v3 = [(UIApplicationRotationFollowingWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(UIWindow *)v3 setWindowLevel:-1.79769313e308];
    [(UIView *)v4 setBackgroundColor:0];
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v3 = [(_UIRemoteInputViewHostWindow *)self hostWindowDelegate];
  [v3 updateInputViewsIfNecessary];
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (id)firstResponder
{
  v2 = [(id)UIApp keyWindow];
  id v3 = [v2 firstResponder];

  return v3;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_isHostedInAnotherProcess
{
  return 0;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_isRemoteInputHostWindow
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (BOOL)inhibitSetupOrientation
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v3 = [v2 containerRootController];
  char v4 = [v3 shouldAutorotate];

  return v4;
}

- (_UIRemoteInputViewHostWindowDelegate)hostWindowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostWindowDelegate);
  return (_UIRemoteInputViewHostWindowDelegate *)WeakRetained;
}

- (void)setHostWindowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end