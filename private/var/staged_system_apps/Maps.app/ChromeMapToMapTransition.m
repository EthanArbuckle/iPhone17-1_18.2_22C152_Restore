@interface ChromeMapToMapTransition
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ChromeMapToMapTransition

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 containerView];
  v5 = [v3 viewControllerForKey:UITransitionContextToViewControllerKey];
  [v3 finalFrameForViewController:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  v14 = [v5 view];
  [v4 addSubview:v14];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100108C40;
  v16[3] = &unk_1012E9418;
  id v17 = v5;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  uint64_t v21 = v13;
  id v15 = v5;
  +[UIView performWithoutAnimation:v16];
  [v3 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end