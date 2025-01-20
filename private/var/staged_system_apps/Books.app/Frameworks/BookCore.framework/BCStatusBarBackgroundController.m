@interface BCStatusBarBackgroundController
+ (id)backgroundControllerForViewController:(id)a3;
+ (id)backgroundControllerForWindow:(id)a3;
- (BCStatusBarBackgroundController)initWithWindow:(id)a3;
- (BOOL)useCardStack;
- (CGRect)_statusBarFrame;
- (NSString)groupName;
- (UIView)cardStackBackgroundView;
- (UIWindow)window;
- (double)opacity;
- (id)windowScene;
- (void)_updateParentViewOfCardStackBackgroundView;
- (void)setGroupName:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setOpacity:(double)a3 animated:(BOOL)a4;
- (void)setUseCardStack:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)setup;
- (void)updateParentViewOfCardStackBackgroundViewWithParentViewController:(id)a3;
@end

@implementation BCStatusBarBackgroundController

- (id)windowScene
{
  v2 = [(BCStatusBarBackgroundController *)self window];
  v3 = [v2 windowScene];

  return v3;
}

- (CGRect)_statusBarFrame
{
  v3 = [(BCStatusBarBackgroundController *)self windowScene];
  v4 = [v3 statusBarManager];
  [v4 statusBarFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [(BCStatusBarBackgroundController *)self window];
  [v11 safeAreaInsets];
  double v13 = v12;

  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_updateParentViewOfCardStackBackgroundView
{
  v3 = [(BCStatusBarBackgroundController *)self window];
  id v5 = [v3 rootViewController];

  v4 = [v5 bc_firstVisibleChildViewControllerOfClass:objc_opt_class() includePresented:1];
  [(BCStatusBarBackgroundController *)self updateParentViewOfCardStackBackgroundViewWithParentViewController:v4];
}

- (UIView)cardStackBackgroundView
{
  cardStackBackgroundView = self->_cardStackBackgroundView;
  if (!cardStackBackgroundView)
  {
    id v4 = objc_alloc((Class)UIVisualEffectView);
    [(BCStatusBarBackgroundController *)self _statusBarFrame];
    id v5 = [v4 initWithFrame:];
    double v6 = +[UIBlurEffect effectWithStyle:1100];
    double v10 = v6;
    double v7 = +[NSArray arrayWithObjects:&v10 count:1];
    [(UIView *)v5 setBackgroundEffects:v7];

    double v8 = self->_cardStackBackgroundView;
    self->_cardStackBackgroundView = v5;

    cardStackBackgroundView = self->_cardStackBackgroundView;
  }

  return cardStackBackgroundView;
}

+ (id)backgroundControllerForViewController:(id)a3
{
  v3 = [a3 im_ancestorConformingToProtocol:&OBJC_PROTOCOL___BCStatusBarBackgroundControllerProviding];
  id v4 = [v3 statusBarBackgroundController];

  return v4;
}

+ (id)backgroundControllerForWindow:(id)a3
{
  v3 = [a3 im_ancestorConformingToProtocol:&OBJC_PROTOCOL___BCStatusBarBackgroundControllerProviding];
  id v4 = [v3 statusBarBackgroundController];

  return v4;
}

- (BCStatusBarBackgroundController)initWithWindow:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCStatusBarBackgroundController;
  id v5 = [(BCStatusBarBackgroundController *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_window, v4);
  }

  return v6;
}

- (double)opacity
{
  v2 = [(BCStatusBarBackgroundController *)self effectiveBackgroundView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setOpacity:(double)a3
{
}

- (void)setOpacity:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(BCStatusBarBackgroundController *)self _updateParentViewOfCardStackBackgroundView];
  [(BCStatusBarBackgroundController *)self effectiveBackgroundView];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_BE318;
  v10[3] = &unk_2C4CB8;
  double v13 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v7;
  double v12 = self;
  objc_super v8 = objc_retainBlock(v10);
  double v9 = v8;
  if (v4) {
    +[UIView animateWithDuration:v8 animations:0.2];
  }
  else {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)setup
{
}

- (void)updateParentViewOfCardStackBackgroundViewWithParentViewController:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(BCStatusBarBackgroundController *)self cardStackBackgroundView];
  id v5 = [v4 superview];
  double v6 = [v8 view];

  if (v5 != v6)
  {
    id v7 = [v8 view];
    [v7 addSubview:v4];
  }
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)useCardStack
{
  return self->_useCardStack;
}

- (void)setUseCardStack:(BOOL)a3
{
  self->_useCardStack = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_window);

  objc_storeStrong((id *)&self->_cardStackBackgroundView, 0);
}

@end