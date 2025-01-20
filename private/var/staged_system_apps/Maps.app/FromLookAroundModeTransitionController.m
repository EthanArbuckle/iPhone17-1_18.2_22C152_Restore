@interface FromLookAroundModeTransitionController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FromLookAroundModeTransitionController

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
  [v5 insertSubview:v16 belowSubview:v17];
  [v16 setFrame:v9, v11, v13, v15];
  [v16 layoutIfNeeded];
  [v6 lookAroundButtonFrame];
  [v7 setLookAroundButtonFrame:];
  [v7 animateFromModeTransition:v4];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1009919FC;
  v31[3] = &unk_1012E5D58;
  id v18 = v7;
  id v32 = v18;
  id v19 = v6;
  id v33 = v19;
  v20 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100991A40;
  v29[3] = &unk_1012E5D08;
  id v21 = v4;
  id v30 = v21;
  v22 = objc_retainBlock(v29);
  if ([v21 isAnimated])
  {
    [v19 applyTransitionWithProgress:0.0];
    [(FromLookAroundModeTransitionController *)self transitionDuration:v21];
    double v24 = v23;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100991A4C;
    v27[3] = &unk_1012E6EA8;
    v28 = v20;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100991A5C;
    v25[3] = &unk_1012EAFC0;
    v26 = v22;
    +[UIView animateWithDuration:v27 animations:v25 completion:v24];
  }
  else
  {
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *))v22[2])(v22);
  }
}

@end