@interface CarSmallWidgetChromeTransitionAnimator
- (CarSmallWidgetChromeTransitionAnimator)initWithOperation:(int64_t)a3;
- (double)transitionDuration:(id)a3;
- (void)_animateOperation:(int64_t)a3 withTransitionContext:(id)a4;
- (void)animateTransition:(id)a3;
@end

@implementation CarSmallWidgetChromeTransitionAnimator

- (CarSmallWidgetChromeTransitionAnimator)initWithOperation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarSmallWidgetChromeTransitionAnimator;
  result = [(CarSmallWidgetChromeTransitionAnimator *)&v5 init];
  if (result) {
    result->_operation = a3;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  return 0.449999988;
}

- (void)animateTransition:(id)a3
{
  if ((unint64_t)(self->_operation - 1) <= 1) {
    -[CarSmallWidgetChromeTransitionAnimator _animateOperation:withTransitionContext:](self, "_animateOperation:withTransitionContext:");
  }
}

- (void)_animateOperation:(int64_t)a3 withTransitionContext:(id)a4
{
  id v6 = a4;
  v7 = [v6 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v8 = [v6 viewControllerForKey:UITransitionContextToViewControllerKey];
  v9 = [v6 containerView];
  v10 = [v8 view];
  if (a3 == 1)
  {
    [v9 addSubview:v10];
  }
  else
  {
    v11 = [v7 view];
    [v9 insertSubview:v10 belowSubview:v11];
  }
  v12 = [v8 view];
  [v12 setAlpha:0.0];

  [(CarSmallWidgetChromeTransitionAnimator *)self transitionDuration:v6];
  double v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1006C3C80;
  v21[3] = &unk_1012E5D58;
  id v22 = v7;
  id v23 = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1006C3CF0;
  v18[3] = &unk_1012E6160;
  id v19 = v6;
  id v20 = v22;
  id v15 = v22;
  id v16 = v6;
  id v17 = v8;
  +[UIView animateWithDuration:0x20000 delay:v21 options:v18 animations:v14 completion:0.0];
}

@end