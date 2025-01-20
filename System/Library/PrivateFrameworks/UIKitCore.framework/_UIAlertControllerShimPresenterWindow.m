@interface _UIAlertControllerShimPresenterWindow
- (UIAlertController)alertController;
- (_UIAlertControllerShimPresenterWindow)init;
- (_UIAlertControllerShimPresenterWindow)initWithWindowScene:(id)a3;
- (id)_presentationViewController;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation _UIAlertControllerShimPresenterWindow

- (_UIAlertControllerShimPresenterWindow)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerShimPresenterWindow;
  v2 = [(UIApplicationRotationFollowingWindow *)&v7 init];
  if (v2)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      v3 = +[UIScreen mainScreen];
      [v3 bounds];
      -[UIWindow setFrame:](v2, "setFrame:");
    }
    [(UIView *)v2 setOpaque:0];
    v4 = +[UIColor clearColor];
    [(UIView *)v2 setBackgroundColor:v4];

    v5 = +[UIScreen mainScreen];
    [(UIWindow *)v2 setScreen:v5];

    [(UIWindow *)v2 setWindowLevel:2000.0];
    [(UIWindow *)v2 setHidden:1];
  }
  return v2;
}

- (_UIAlertControllerShimPresenterWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerShimPresenterWindow;
  v3 = [(UIApplicationRotationFollowingWindow *)&v7 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    v5 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIWindow *)v4 setWindowLevel:2000.0];
    [(UIWindow *)v4 setHidden:1];
  }
  return v4;
}

- (id)_presentationViewController
{
  v3 = [(UIWindow *)self rootViewController];

  if (!v3)
  {
    v4 = objc_alloc_init(UIApplicationRotationFollowingController);
    [(UIApplicationRotationFollowingController *)v4 setSizesWindowToScene:1];
    [(UIWindow *)self setRootViewController:v4];
  }
  return [(UIWindow *)self rootViewController];
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = (void (**)(id, BOOL))a5;
  v11 = [(_UIAlertControllerShimPresenterWindow *)self _presentationViewController];
  v12 = [v11 presentedViewController];

  if (v12)
  {
    id v13 = [v11 presentedViewController];

    if (v13 != v9)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"_UIAlertControllerShimPresenter.m", 363, @"Multiple alert controllers assigned to the same window %@", self object file lineNumber description];

      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_4;
    }
    if (v10)
    {
LABEL_4:
      id v14 = [v11 presentedViewController];
      v10[2](v10, v14 == v9);
    }
  }
  else
  {
    v15 = +[UIWindow _applicationKeyWindow];
    [v15 windowLevel];
    double v17 = v16 + 1.0;

    [(UIWindow *)self windowLevel];
    if (v17 >= v18) {
      double v18 = v17;
    }
    [(UIWindow *)self setWindowLevel:v18];
    [(UIWindow *)self makeKeyWindow];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __89___UIAlertControllerShimPresenterWindow_presentAlertController_animated_completionBlock___block_invoke;
    v20[3] = &unk_1E52DA040;
    v21 = v10;
    [v11 presentViewController:v9 animated:v6 completion:v20];
  }
LABEL_8:
}

- (UIAlertController)alertController
{
  v2 = [(_UIAlertControllerShimPresenterWindow *)self _presentationViewController];
  v3 = [v2 presentedViewController];

  return (UIAlertController *)v3;
}

- (void).cxx_destruct
{
}

@end