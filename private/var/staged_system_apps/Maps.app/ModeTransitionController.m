@interface ModeTransitionController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ModeTransitionController

- (double)transitionDuration:(id)a3
{
  return 0.449999988;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v7 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  [v4 finalFrameForViewController:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v6 view];
  v17 = [v7 view];
  [v5 addSubview:v16];
  [v5 addSubview:v17];
  [v16 setFrame:v9, v11, v13, v15];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100991264;
  v28[3] = &unk_1012E5D58;
  id v18 = v7;
  id v29 = v18;
  id v19 = v6;
  id v30 = v19;
  v20 = objc_retainBlock(v28);
  if ([v4 isAnimated])
  {
    [v19 applyTransitionWithProgress:0.0];
    [(ModeTransitionController *)self transitionDuration:v4];
    double v22 = v21;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1009912A8;
    v26[3] = &unk_1012E6EA8;
    v27 = v20;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1009912B8;
    v23[3] = &unk_1012E6160;
    id v24 = v4;
    id v25 = v18;
    +[UIView animateWithDuration:v26 animations:v23 completion:v22];
  }
  else
  {
    ((void (*)(void *))v20[2])(v20);
    [v4 completeTransition:1];
  }
}

@end