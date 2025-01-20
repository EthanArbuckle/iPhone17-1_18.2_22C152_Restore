@interface BKTransitioningViewController
- (BKTransitioningViewController)initWithContentViewController:(id)a3;
- (BKTransitioningViewControllerDelegate)delegate;
- (BOOL)gettingTransitionCoordinator;
- (BOOL)isTransitioning;
- (BUAssertion)wallpaperAssertion;
- (UINavigationController)navController;
- (UIViewController)contentViewController;
- (UIViewController)sourceViewController;
- (UIViewControllerAnimatedTransitioning)transition;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)completion;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)transitionCoordinator;
- (void)_delegate_didTransitionFromViewController:(id)a3 toViewController:(id)a4;
- (void)_delegate_willTransitionFromViewController:(id)a3 toViewController:(id)a4;
- (void)_performTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransition:(id)a5 completion:(id)a6;
- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGettingTransitionCoordinator:(BOOL)a3;
- (void)setNavController:(id)a3;
- (void)setSourceViewController:(id)a3;
- (void)setTransition:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setWallpaperAssertion:(id)a3;
- (void)transitionToContentViewController:(id)a3 withTransition:(id)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation BKTransitioningViewController

- (BKTransitioningViewController)initWithContentViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKTransitioningViewController;
  v5 = [(BKTransitioningViewController *)&v10 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)UINavigationController);
    if (v4) {
      id v7 = [v6 initWithRootViewController:v4];
    }
    else {
      id v7 = [v6 initWithNibName:0 bundle:0];
    }
    v8 = v7;
    objc_storeStrong((id *)&v5->_navController, v7);
  }
  return v5;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)BKTransitioningViewController;
  [(BKTransitioningViewController *)&v22 viewDidLoad];
  v3 = [(BKTransitioningViewController *)self navController];
  [v3 setDelegate:self];

  id v4 = [(BKTransitioningViewController *)self navController];
  [v4 setToolbarHidden:1];

  v5 = [(BKTransitioningViewController *)self navController];
  [v5 setNavigationBarHidden:1];

  id v6 = [(BKTransitioningViewController *)self navController];
  [(BKTransitioningViewController *)self addChildViewController:v6];

  id v7 = [(BKTransitioningViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(BKTransitioningViewController *)self navController];
  v17 = [v16 view];
  [v17 setFrame:v9, v11, v13, v15];

  v18 = [(BKTransitioningViewController *)self view];
  v19 = [(BKTransitioningViewController *)self navController];
  v20 = [v19 view];
  [v18 addSubview:v20];

  v21 = [(BKTransitioningViewController *)self navController];
  [v21 didMoveToParentViewController:self];
}

- (id)childViewControllerForStatusBarStyle
{
  v2 = [(BKTransitioningViewController *)self navController];
  v3 = [v2 childViewControllerForStatusBarStyle];

  return v3;
}

- (id)childViewControllerForStatusBarHidden
{
  v2 = [(BKTransitioningViewController *)self navController];
  v3 = [v2 childViewControllerForStatusBarHidden];

  return v3;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(BKTransitioningViewController *)self navController];
  v3 = [v2 childViewControllerForHomeIndicatorAutoHidden];

  return v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKTransitioningViewController;
  id v4 = a3;
  [(BKTransitioningViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  -[BKTransitioningViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)transitionToContentViewController:(id)a3 withTransition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B8A38;
  v12[3] = &unk_100A49268;
  v12[4] = self;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  id v9 = v8;
  id v10 = v15;
  id v11 = v13;
  [(BKTransitioningViewController *)self im_finishOngoingModalTransitionAnimations:v12];
}

- (UIViewController)contentViewController
{
  v2 = [(BKTransitioningViewController *)self navController];
  v3 = [v2 topViewController];

  return (UIViewController *)v3;
}

- (void)setContentViewController:(id)a3
{
  id v4 = a3;
  [(BKTransitioningViewController *)self willChangeValueForKey:@"contentViewController"];
  double v5 = [(BKTransitioningViewController *)self contentViewController];
  [(BKTransitioningViewController *)self setSourceViewController:v5];

  double v6 = [(BKTransitioningViewController *)self navController];
  id v8 = v4;
  double v7 = +[NSArray arrayWithObjects:&v8 count:1];

  [v6 setViewControllers:v7 animated:0];
  [(BKTransitioningViewController *)self didChangeValueForKey:@"contentViewController"];
}

- (id)transitionCoordinator
{
  if ([(BKTransitioningViewController *)self gettingTransitionCoordinator])
  {
    v3 = [(BKTransitioningViewController *)self parentViewController];
    id v4 = [v3 transitionCoordinator];
  }
  else
  {
    [(BKTransitioningViewController *)self setGettingTransitionCoordinator:1];
    double v5 = [(BKTransitioningViewController *)self navController];
    id v4 = [v5 transitionCoordinator];

    [(BKTransitioningViewController *)self setGettingTransitionCoordinator:0];
  }

  return v4;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return [(BKTransitioningViewController *)self transition];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(BKTransitioningViewController *)self sourceViewController];
  [(BKTransitioningViewController *)self _delegate_willTransitionFromViewController:v7 toViewController:v6];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(BKTransitioningViewController *)self sourceViewController];
  [(BKTransitioningViewController *)self _delegate_didTransitionFromViewController:v7 toViewController:v6];

  id v8 = [(BKTransitioningViewController *)self completion];

  if (v8)
  {
    id v9 = [(BKTransitioningViewController *)self completion];
    v9[2](v9, 1);
  }
  [(BKTransitioningViewController *)self setCompletion:0];
  [(BKTransitioningViewController *)self setTransition:0];
  [(BKTransitioningViewController *)self setSourceViewController:0];
  id v10 = [(BKTransitioningViewController *)self wallpaperAssertion];
  [v10 invalidate];

  [(BKTransitioningViewController *)self setWallpaperAssertion:0];
  [(BKTransitioningViewController *)self setTransitioning:0];
  id v12 = [(BKTransitioningViewController *)self tabBarController];
  id v11 = [(BKTransitioningViewController *)self transitionCoordinator];
  [v12 im_updateTabBarVisibleWithTransitionCoordinator:v11];
}

- (void)_performTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransition:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)IMViewControllerOneToOneTransitionContext);
  id v15 = [(BKTransitioningViewController *)self view];
  [v14 setBk_containerView:v15];

  [v14 _setFromViewController:v13];
  [v14 _setToViewController:v12];

  [v14 _setIsAnimated:1];
  [v11 transitionDuration:v14];
  [v14 _setDuration:];
  [v14 _setAnimator:v11];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001B90B4;
  v17[3] = &unk_100A4A0F0;
  id v18 = v10;
  id v16 = v10;
  [v14 _setCompletionHandler:v17];
  [v11 animateTransition:v14];
}

- (void)_delegate_willTransitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(BKTransitioningViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(BKTransitioningViewController *)self delegate];
    [v9 transitionController:self willTransitionFromViewController:v10 toViewController:v6];
  }
}

- (void)_delegate_didTransitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(BKTransitioningViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(BKTransitioningViewController *)self delegate];
    [v9 transitionController:self didTransitionFromViewController:v10 toViewController:v6];
  }
}

- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5
{
}

- (BKTransitioningViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKTransitioningViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (UIViewControllerAnimatedTransitioning)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BUAssertion)wallpaperAssertion
{
  return self->_wallpaperAssertion;
}

- (void)setWallpaperAssertion:(id)a3
{
}

- (BOOL)gettingTransitionCoordinator
{
  return self->_gettingTransitionCoordinator;
}

- (void)setGettingTransitionCoordinator:(BOOL)a3
{
  self->_gettingTransitionCoordinator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperAssertion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end