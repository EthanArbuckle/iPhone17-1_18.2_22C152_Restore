@interface ICOverlayWindowPresenter
- (ICOverlayWindowPresenter)initWithRootViewController:(id)a3 presentingWindow:(id)a4;
- (ICWindow)window;
- (UIColor)windowBackgroundColor;
- (UIWindow)presentingWindow;
- (unint64_t)presentAnimationType;
- (void)animateWindowFrameReverse:(BOOL)a3 duration:(double)a4 completionBlock:(id)a5;
- (void)dismissWithCompletionBlock:(id)a3;
- (void)presentWithCompletionBlock:(id)a3;
- (void)setPresentAnimationType:(unint64_t)a3;
- (void)setPresentingWindow:(id)a3;
- (void)setWindow:(id)a3;
- (void)setWindowBackgroundColor:(id)a3;
@end

@implementation ICOverlayWindowPresenter

- (ICOverlayWindowPresenter)initWithRootViewController:(id)a3 presentingWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICOverlayWindowPresenter;
  v8 = [(ICOverlayWindowPresenter *)&v17 init];
  if (v8)
  {
    objc_opt_class();
    v9 = ICDynamicCast();
    id v10 = objc_alloc((Class)ICWindow);
    v11 = [v7 windowScene];
    id v12 = [v10 initWithWindowScene:v11 behavior:[v7 ic_behavior]];

    v13 = [v9 viewControllerManager];
    [v12 setViewControllerManager:v13];

    [v12 setRootViewController:v6];
    [v12 setWindowLevel:UIWindowLevelStatusBar + -1.0];
    window = v8->_window;
    v8->_window = (ICWindow *)v12;
    id v15 = v12;

    objc_storeStrong((id *)&v8->_presentingWindow, a4);
  }

  return v8;
}

- (void)animateWindowFrameReverse:(BOOL)a3 duration:(double)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v6)
  {
    v9 = [(ICOverlayWindowPresenter *)self window];
    [v9 bounds];
    double v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = 0x20000;
  }
  else
  {
    v9 = [(ICOverlayWindowPresenter *)self presentingWindow];
    [v9 frame];
    double v11 = v19;
    CGFloat v13 = v20;
    double v15 = v21;
    double v17 = v22;
    uint64_t v18 = 0x10000;
  }

  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  double MaxY = CGRectGetMaxY(v30);
  if (v6) {
    double v24 = v13;
  }
  else {
    double v24 = MaxY;
  }
  if (v6) {
    CGFloat v13 = MaxY;
  }
  v25 = [(ICOverlayWindowPresenter *)self window];
  [v25 setFrame:v11, v24, v15, v17];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000C07D0;
  v29[3] = &unk_100628C78;
  v29[4] = self;
  *(double *)&v29[5] = v11;
  *(CGFloat *)&v29[6] = v13;
  *(double *)&v29[7] = v15;
  *(double *)&v29[8] = v17;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C083C;
  v27[3] = &unk_100626248;
  id v28 = v8;
  id v26 = v8;
  +[UIView animateWithDuration:v18 delay:v29 options:v27 animations:a4 completion:0.0];
}

- (void)presentWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(ICOverlayWindowPresenter *)self window];
  [v5 makeKeyAndVisible];

  unint64_t v6 = [(ICOverlayWindowPresenter *)self presentAnimationType];
  if (v6)
  {
    if (v6 == 2)
    {
      id v7 = [(ICOverlayWindowPresenter *)self windowBackgroundColor];
      id v8 = v7;
      if (!v7)
      {
        id v8 = +[UIColor ic_dynamicWhiteBlackColor];
      }
      v9 = [(ICOverlayWindowPresenter *)self window];
      [v9 setBackgroundColor:v8];

      if (!v7) {
      double v10 = [(ICOverlayWindowPresenter *)self window];
      }
      double v11 = [v10 rootViewController];
      double v12 = [v11 view];
      [v12 setAlpha:0.0];

      CGFloat v13 = [(ICOverlayWindowPresenter *)self window];
      [v13 makeKeyAndVisible];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000C0A70;
      v16[3] = &unk_100625AF0;
      v16[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000C0AE0;
      v14[3] = &unk_100626248;
      id v15 = v4;
      +[UIView animateWithDuration:v16 animations:v14 completion:0.25];
    }
    else if (v6 == 1)
    {
      [(ICOverlayWindowPresenter *)self animateWindowFrameReverse:0 duration:v4 completionBlock:0.3];
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICOverlayWindowPresenter presentWithCompletionBlock:]", 1, 0, @"Undefined presentation type for present overlay window");
  }
}

- (void)dismissWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICOverlayWindowPresenter *)self presentAnimationType];
  double v6 = 0.3;
  if (v5)
  {
    if (v5 == 2) {
      double v6 = 0.0;
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICOverlayWindowPresenter dismissWithCompletionBlock:]", 1, 0, @"Undefined presentation type for dismiss overlay window");
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C0BF0;
  v8[3] = &unk_100625B40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ICOverlayWindowPresenter *)self animateWindowFrameReverse:1 duration:v8 completionBlock:v6];
}

- (unint64_t)presentAnimationType
{
  return self->_presentAnimationType;
}

- (void)setPresentAnimationType:(unint64_t)a3
{
  self->_presentAnimationType = a3;
}

- (UIColor)windowBackgroundColor
{
  return self->_windowBackgroundColor;
}

- (void)setWindowBackgroundColor:(id)a3
{
  self->_windowBackgroundColor = (UIColor *)a3;
}

- (ICWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void)setPresentingWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end