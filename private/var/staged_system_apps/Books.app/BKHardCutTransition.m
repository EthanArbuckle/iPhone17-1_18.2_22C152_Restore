@interface BKHardCutTransition
+ (id)transition;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BKHardCutTransition

+ (id)transition
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 viewForKey:UITransitionContextFromViewKey];
  v5 = [v3 viewForKey:UITransitionContextToViewKey];
  v6 = [v3 containerView];
  [v5 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v4 frame];
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  if (!CGRectEqualToRect(v26, v27))
  {
    v19 = [v3 viewControllerForKey:UITransitionContextToViewControllerKey];
    id v20 = objc_alloc_init((Class)IMViewControllerNullAnimationTransitionCoordinator);
    [v20 setContainerView:v6];
    [v4 frame];
    [v19 viewWillTransitionToSize:v20 withTransitionCoordinator:v21, v22];
    [v4 frame];
    [v5 setFrame:];
    [v20 _runAlongsideAnimations];
    [v20 _runAlongsideCompletionsAfterCommit];
  }
  [v6 insertSubview:v5 belowSubview:v4];
  [v4 removeFromSuperview];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100150F9C;
  block[3] = &unk_100A43D60;
  id v25 = v3;
  id v23 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end