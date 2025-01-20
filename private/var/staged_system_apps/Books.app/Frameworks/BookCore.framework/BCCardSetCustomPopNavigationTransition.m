@interface BCCardSetCustomPopNavigationTransition
- (void)animationEnded:(BOOL)a3;
- (void)setup;
- (void)updateAnimator;
@end

@implementation BCCardSetCustomPopNavigationTransition

- (void)setup
{
  v3 = [(BCCardSetCustomNavigationTransition *)self fromView];
  [(BCCardSetCustomNavigationTransition *)self setViewToSlide:v3];

  [(BCCardSetCustomNavigationTransition *)self onScreen];
  -[BCCardSetCustomNavigationTransition setStartingRect:](self, "setStartingRect:");
  [(BCCardSetCustomNavigationTransition *)self offScreen];
  -[BCCardSetCustomNavigationTransition setEndingRect:](self, "setEndingRect:");
  v4 = [(BCCardSetCustomNavigationTransition *)self toViewController];
  v5 = [v4 contentScrollViewForEdge:1];

  if (v5)
  {
    [(BCCardSetCustomNavigationTransition *)self setViewToSnapshot:v5];
  }
  else
  {
    v6 = [(BCCardSetCustomNavigationTransition *)self toView];
    [(BCCardSetCustomNavigationTransition *)self setViewToSnapshot:v6];
  }
  v7 = [(BCCardSetCustomNavigationTransition *)self toView];
  [(BCCardSetCustomNavigationTransition *)self setViewToHide:v7];

  [(BCCardSetCustomNavigationTransition *)self setGripperStartingAlpha:0.0];
  [(BCCardSetCustomNavigationTransition *)self setGripperEndingAlpha:1.0];
  [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGRectMakeWithSize();
  CGRectGetCenter();
  double v17 = v16;
  double v19 = v18;
  v20 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v21 = [v20 configuration];
  [v21 cardExpandedTopOffset];
  double v23 = v15 - v22;

  v24 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v25 = [v24 configuration];
  [v25 cardCornerRadius];
  CGFloat v27 = v23 + v26;

  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:", v9, v11, v13, v27);
  v47.origin.x = v9;
  v47.origin.y = v11;
  v47.size.width = v13;
  v47.size.height = v27;
  double v28 = v17 / CGRectGetWidth(v47);
  v48.origin.x = v9;
  v48.origin.y = v11;
  v48.size.width = v13;
  v48.size.height = v27;
  -[BCCardSetCustomNavigationTransition setSnapshotAnchorPoint:](self, "setSnapshotAnchorPoint:", v28, v19 / CGRectGetHeight(v48));
  memset(&v46, 0, sizeof(v46));
  v29 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v30 = [v29 currentCardViewController];
  v31 = [v30 configuration];
  [v31 cardExpandedTopOffset];
  CGAffineTransformMakeTranslation(&v46, 0.0, v32);

  v33 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v34 = v33;
  if (v33) {
    [v33 expandedTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransform t2 = v46;
  CGAffineTransformConcat(&v45, &t1, &t2);
  CGAffineTransform v42 = v45;
  [(BCCardSetCustomNavigationTransition *)self setStartingTransform:&v42];

  v35 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v36 = v35;
  if (v35) {
    [v35 contractedTransform];
  }
  else {
    memset(&v40, 0, sizeof(v40));
  }
  v37 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v37 scaledContractedOffset];
  CGAffineTransformTranslate(&v41, &v40, 0.0, v38);
  CGAffineTransform v39 = v41;
  [(BCCardSetCustomNavigationTransition *)self setTargetTransform:&v39];

  [(BCCardSetCustomNavigationTransition *)self setAfterScreenUpdates:1];
}

- (void)updateAnimator
{
  v3 = [(BCCardSetCustomNavigationTransition *)self animator];
  v4 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v5 = [v4 delegate];
  v6 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v5 cardSetViewController:v6 animatorForUnexpanding:v3];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9E874;
  v7[3] = &unk_2C3C50;
  v7[4] = self;
  [v3 addAnimations:v7];
}

- (void)animationEnded:(BOOL)a3
{
  if (a3)
  {
    v4 = [(BCCardSetCustomNavigationTransition *)self toView];
    [v4 setAlpha:1.0];

    v5 = [(BCCardSetCustomNavigationTransition *)self transitioningContext];
    v6 = [v5 containerView];
    v7 = [(BCCardSetCustomNavigationTransition *)self toView];
    [v6 addSubview:v7];

    double v8 = [(BCCardSetCustomNavigationTransition *)self fromView];
    [v8 removeFromSuperview];

    [(BCCardSetCustomNavigationTransition *)self targetTransform];
    double v9 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v10 = [v9 scrollView];
    v32[0] = v32[3];
    v32[1] = v32[4];
    v32[2] = v32[5];
    [v10 setTransform:v32];

    double v11 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v12 = [v11 scrollView];
    [v12 setScrollEnabled:1];

    double v13 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v14 = [v13 tapToDismissGestureRecognizer];
    [v14 setEnabled:1];

    double v15 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v16 = [v15 edgePanGestureRecognizer];
    double v17 = [v16 view];
    double v18 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v19 = [v18 edgePanGestureRecognizer];
    [v17 removeGestureRecognizer:v19];

    v20 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    [v20 setEdgePanGestureRecognizer:0];

    v21 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v22 = [v21 navigationSkrimView];
    [v22 removeFromSuperview];

    double v23 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    [v23 setNavigationSkrimView:0];

    v24 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    v25 = [v24 currentCardViewController];
    double v26 = [v25 contentContainerView];
    [v26 setClipsToBounds:1];

    CGFloat v27 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    double v28 = [v27 currentCardViewController];
    [v28 goContracted];
  }
  else
  {
    v29 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    v30 = [v29 currentCardViewController];
    id v31 = [v30 cardNavigationController];

    [v31 bc_updateNavBarVisibleWithTransitionCoordinator:0 duration:0.0];
  }
}

@end