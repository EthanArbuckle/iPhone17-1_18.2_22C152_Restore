@interface ToLookAroundModeTransitionController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ToLookAroundModeTransitionController

- (double)transitionDuration:(id)a3
{
  return 0.449999988;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v7 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  [v4 finalFrameForViewController:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 view];
  [v5 addSubview:v16];
  [v16 setFrame:v9, v11, v13, v15];
  [v7 animateToModeTransition:v4];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100991620;
  v34[3] = &unk_1012E5D58;
  id v17 = v6;
  id v35 = v17;
  id v18 = v7;
  id v36 = v18;
  v19 = objc_retainBlock(v34);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100991664;
  v30[3] = &unk_1012E66E0;
  id v20 = v4;
  id v31 = v20;
  id v21 = v17;
  id v32 = v21;
  id v22 = v18;
  id v33 = v22;
  v23 = objc_retainBlock(v30);
  if ([v20 isAnimated])
  {
    [v22 applyTransitionWithProgress:0.0];
    [(ToLookAroundModeTransitionController *)self transitionDuration:v20];
    double v25 = v24;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1009916B0;
    v28[3] = &unk_1012E6EA8;
    v29 = v19;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1009916C0;
    v26[3] = &unk_1012EAFC0;
    v27 = v23;
    +[UIView animateWithDuration:v28 animations:v26 completion:v25];
  }
  else
  {
    ((void (*)(void *))v19[2])(v19);
    ((void (*)(void *))v23[2])(v23);
  }
}

@end