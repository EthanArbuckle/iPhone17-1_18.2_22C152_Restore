@interface UIApplicationRotationFollowingController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)sizesWindowToScene;
- (UIApplicationRotationFollowingController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4;
- (id)_topMostWindow;
- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)setSizesWindowToScene:(BOOL)a3;
- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4;
@end

@implementation UIApplicationRotationFollowingController

- (BOOL)shouldAutorotate
{
  v3 = [(UIViewController *)self _window];
  if ([v3 _isHostedInAnotherProcess])
  {
    v4 = [(UIViewController *)self _window];
    char v5 = [v4 _isTextEffectsWindowHosting];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationRotationFollowingController;
  [(UIViewController *)&v17 window:v6 setupWithInterfaceOrientation:a4];
  if ([(UIApplicationRotationFollowingController *)self sizesWindowToScene])
  {
    v7 = [v6 windowScene];
    [v7 _referenceBounds];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v7 = [v6 screen];
    v12 = [v7 fixedCoordinateSpace];
    [v12 bounds];
    double v9 = v13;
    double v11 = v14;
  }
  if ((unint64_t)(a4 - 3) <= 1)
  {
    int v15 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
    if (v15) {
      double v16 = v9;
    }
    else {
      double v16 = v11;
    }
    if (v15) {
      double v9 = v11;
    }
    double v11 = v16;
  }
  objc_msgSend(v6, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v9, v11);
}

- (UIApplicationRotationFollowingController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIApplicationRotationFollowingController;
  v4 = [(UIViewController *)&v7 initWithNibName:a3 bundle:a4];
  char v5 = v4;
  if (v4) {
    [(UIViewController *)v4 _setIgnoreAppSupportedOrientations:1];
  }
  return v5;
}

- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3
{
  char v5 = [(UIApplicationRotationFollowingController *)self _topMostWindow];
  id v6 = [(UIViewController *)self _safeWindowForAutorotationBelowWindow:v5];
  objc_super v7 = [v6 rootViewController];
  double v8 = [v7 _safeViewControllerForSupportedInterfaceOrientationsWithDismissCheck:1];

  if (!v8)
  {
    id v14 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](&v16, sel__preferredInterfaceOrientationGivenCurrentOrientation_, a3, self, UIApplicationRotationFollowingController, v17.receiver, v17.super_class);
LABEL_10:
    int64_t v11 = (int64_t)v14;
    goto LABEL_11;
  }
  double v9 = [(UIViewController *)self _window];
  char v10 = [v9 _isTextEffectsWindowHosting];

  if ((v10 & 1) != 0 || (int64_t v11 = [v8 _overrideInterfaceOrientationMechanics]) == 0)
  {
    if (([v8 shouldAutorotate] & 1) != 0
      || ([(UIViewController *)self _window],
          v12 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v12,
          (isKindOfClass & 1) == 0))
    {
      id v14 = (id)[v8 _preferredInterfaceOrientationGivenCurrentOrientation:a3];
    }
    else
    {
      id v14 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](&v17, sel__preferredInterfaceOrientationGivenCurrentOrientation_, a3, v16.receiver, v16.super_class, self, UIApplicationRotationFollowingController);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(UIApplicationRotationFollowingController *)self _topMostWindow];
  v4 = [(UIViewController *)self _safePrimaryViewControllerForAutorotationBelowWindow:v3];
  uint64_t v5 = [v4 _overrideInterfaceOrientationMechanics];
  if (v5)
  {
    int v6 = 1 << v5;
LABEL_13:
    unint64_t v7 = v6;
    goto LABEL_14;
  }
  if (![v4 shouldAutorotate]
    || (unint64_t v7 = objc_msgSend(v4, "__supportedInterfaceOrientations")) == 0)
  {
    if (([(id)UIApp isFrontBoard] & 1) != 0
      || ([v3 windowScene],
          double v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) == 0))
    {
      unint64_t v11 = [(id)UIApp _frontMostAppOrientation];
    }
    else
    {
      char v10 = [v3 windowScene];
      unint64_t v11 = [v10 interfaceOrientation];
    }
    if (v11 <= 1) {
      char v12 = 1;
    }
    else {
      char v12 = v11;
    }
    int v6 = 1 << v12;
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)_topMostWindow
{
  v2 = [(UIViewController *)self _window];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 _topMostWindow];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  char v3 = a3;
  BOOL v5 = [(UIApplicationRotationFollowingController *)self shouldAutorotate];
  if (v5) {
    LOBYTE(v5) = ([(UIViewController *)self __supportedInterfaceOrientations] & (1 << v3)) != 0;
  }
  return v5;
}

- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  unint64_t v7 = NSStringFromSelector(a4);
  NSLog(&cfstr_RotationErrorR.isa, v6, v7, self);

  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)sizesWindowToScene
{
  return self->_sizesWindowToScene;
}

- (void)setSizesWindowToScene:(BOOL)a3
{
  self->_sizesWindowToScene = a3;
}

@end