@interface ASToastPresentationWindow
- (ASToastPresentationWindow)init;
- (BOOL)isInternalWindow;
- (id)_presentationViewController;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ASToastPresentationWindow

- (ASToastPresentationWindow)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASToastPresentationWindow;
  v2 = [(ASToastPresentationWindow *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(ASToastPresentationWindow *)v2 setOpaque:0];
    v4 = +[UIColor clearColor];
    [(ASToastPresentationWindow *)v3 setBackgroundColor:v4];

    v5 = +[UIScreen mainScreen];
    [(ASToastPresentationWindow *)v3 setScreen:v5];

    [(ASToastPresentationWindow *)v3 setWindowLevel:UIWindowLevelAlert];
    [(ASToastPresentationWindow *)v3 setHidden:1];
  }
  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(ASToastPresentationWindow *)self _presentationViewController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009D570;
  v12[3] = &unk_1008B8DA0;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = (void (**)(id, BOOL))a5;
  id v9 = [(ASToastPresentationWindow *)self _presentationViewController];
  id v10 = [v9 presentedViewController];
  if (v10)
  {
    if (v8) {
      v8[2](v8, v10 == v11);
    }
  }
  else
  {
    [(ASToastPresentationWindow *)self presentViewController:v11 animated:v6 completion:v8];
  }
}

- (id)_presentationViewController
{
  v3 = [(ASToastPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)UIApplicationRotationFollowingController);
    [v4 setSizesWindowToScene:1];
    [(ASToastPresentationWindow *)self setRootViewController:v4];
  }

  return [(ASToastPresentationWindow *)self rootViewController];
}

@end