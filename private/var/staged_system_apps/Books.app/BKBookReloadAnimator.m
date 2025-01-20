@interface BKBookReloadAnimator
- (BOOL)contentLoaded;
- (BOOL)waitingForContentLoaded;
- (UIView)containerView;
- (UIView)spinnerView;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (double)aspectRatio;
- (double)transitionDuration:(id)a3;
- (void)_loadStateFromContext:(id)a3;
- (void)_performCrossFade;
- (void)_setupSpinner;
- (void)_showSpinner:(BOOL)a3 completion:(id)a4;
- (void)_startSpinner;
- (void)animateTransition:(id)a3;
- (void)bookContentDidLoad;
- (void)setContainerView:(id)a3;
- (void)setContentLoaded:(BOOL)a3;
- (void)setFromViewController:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setToViewController:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setWaitingForContentLoaded:(BOOL)a3;
@end

@implementation BKBookReloadAnimator

- (void)bookContentDidLoad
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001DD75C;
  v6[3] = &unk_100A43F68;
  objc_copyWeak(&v7, &location);
  v2 = objc_retainBlock(v6);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v2[2])(v2, v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_loadStateFromContext:(id)a3
{
  id v4 = a3;
  [(BKBookReloadAnimator *)self setTransitionContext:v4];
  uint64_t v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  [(BKBookReloadAnimator *)self setFromViewController:v5];

  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  [(BKBookReloadAnimator *)self setToViewController:v6];

  id v7 = [v4 containerView];

  [(BKBookReloadAnimator *)self setContainerView:v7];
}

- (double)transitionDuration:(id)a3
{
  return 0.85;
}

- (void)animateTransition:(id)a3
{
  [(BKBookReloadAnimator *)self _loadStateFromContext:a3];
  id v4 = [(BKBookReloadAnimator *)self containerView];
  uint64_t v5 = [(BKBookReloadAnimator *)self toViewController];
  v6 = [v5 view];
  [v4 insertSubview:v6 atIndex:0];

  id v7 = [(BKBookReloadAnimator *)self toViewController];
  v8 = [v7 view];
  [v8 layoutIfNeeded];

  [(BKBookReloadAnimator *)self _setupSpinner];

  [(BKBookReloadAnimator *)self _performCrossFade];
}

- (void)_performCrossFade
{
  if ([(BKBookReloadAnimator *)self contentLoaded])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_startSpinner" object:0];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"bookContentDidLoad" object:0];
    uint64_t v3 = [(BKBookReloadAnimator *)self fromViewController];
    id v4 = [v3 view];
    [v4 setAlpha:1.0];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001DDAD8;
    v5[3] = &unk_100A44268;
    v5[4] = self;
    [(BKBookReloadAnimator *)self _showSpinner:0 completion:v5];
  }
  else
  {
    [(BKBookReloadAnimator *)self setWaitingForContentLoaded:1];
    [(BKBookReloadAnimator *)self performSelector:"_startSpinner" withObject:0 afterDelay:0.4];
    [(BKBookReloadAnimator *)self performSelector:"bookContentDidLoad" withObject:0 afterDelay:5.0];
  }
}

- (void)_startSpinner
{
}

- (double)aspectRatio
{
  v2 = [(BKBookReloadAnimator *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 > 0.0 && v6 > 0.0) {
    return v4 / v6;
  }
  v9.width = v4;
  v9.height = v6;
  v8 = NSStringFromCGSize(v9);
  BCReportAssertionFailureWithMessage();

  return 1.0;
}

- (void)_setupSpinner
{
  double v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 112.0, 112.0];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  double v5 = [(BKBookReloadAnimator *)self containerView];
  [v5 bounds];
  CGRectGetCenterNoRounding();
  -[UIView setCenter:](self->_spinnerView, "setCenter:");

  [(UIView *)self->_spinnerView frame];
  CGRect v13 = CGRectIntegral(v12);
  -[UIView setFrame:](self->_spinnerView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  double v6 = [(UIView *)self->_spinnerView layer];
  [v6 setCornerRadius:8.0];

  id v7 = +[UIColor colorWithWhite:0.0 alpha:0.8];
  [(UIView *)self->_spinnerView setBackgroundColor:v7];

  id v10 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  v8 = +[UIColor whiteColor];
  [v10 setColor:v8];

  [(UIView *)self->_spinnerView bounds];
  CGRectGetCenterNoRounding();
  [v10 setCenter:];
  [v10 frame];
  CGRect v15 = CGRectIntegral(v14);
  [v10 setFrame:v15.origin.x, v15.origin.y, v15.size.width, v15.size.height];
  [v10 startAnimating];
  [(UIView *)self->_spinnerView addSubview:v10];
  [(UIView *)self->_spinnerView setAlpha:0.0];
  CGSize v9 = [(BKBookReloadAnimator *)self containerView];
  [v9 addSubview:self->_spinnerView];
}

- (void)_showSpinner:(BOOL)a3 completion:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001DDF18;
  v4[3] = &unk_100A44E60;
  v4[4] = self;
  BOOL v5 = a3;
  +[UIView animateWithDuration:v4 animations:a4 completion:0.3];
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (UIView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);

  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end