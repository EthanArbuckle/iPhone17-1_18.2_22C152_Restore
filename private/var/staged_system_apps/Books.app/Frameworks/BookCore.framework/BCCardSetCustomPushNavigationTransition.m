@interface BCCardSetCustomPushNavigationTransition
- (void)animationEnded:(BOOL)a3;
- (void)setup;
- (void)updateAnimator;
@end

@implementation BCCardSetCustomPushNavigationTransition

- (void)setup
{
  v3 = [(BCCardSetCustomNavigationTransition *)self toView];
  [(BCCardSetCustomNavigationTransition *)self setViewToSlide:v3];

  [(BCCardSetCustomNavigationTransition *)self offScreen];
  -[BCCardSetCustomNavigationTransition setStartingRect:](self, "setStartingRect:");
  [(BCCardSetCustomNavigationTransition *)self onScreen];
  -[BCCardSetCustomNavigationTransition setEndingRect:](self, "setEndingRect:");
  v4 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v5 = [v4 currentCardViewController];
  v6 = [v5 cardView];
  [(BCCardSetCustomNavigationTransition *)self setViewToSnapshot:v6];

  v7 = [(BCCardSetCustomNavigationTransition *)self fromView];
  [(BCCardSetCustomNavigationTransition *)self setViewToHide:v7];

  v8 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  [v8 bounds];
  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:");

  [(BCCardSetCustomNavigationTransition *)self setGripperEndingAlpha:0.0];
  [(BCCardSetCustomNavigationTransition *)self setGripperStartingAlpha:0.0];
  v9 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v10 = v9;
  if (v9) {
    [v9 contractedTransform];
  }
  else {
    memset(&v30, 0, sizeof(v30));
  }
  v11 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v11 scaledContractedOffset];
  CGAffineTransformTranslate(&v31, &v30, 0.0, v12);
  CGAffineTransform v29 = v31;
  [(BCCardSetCustomNavigationTransition *)self setStartingTransform:&v29];

  v13 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v14 = v13;
  if (v13) {
    [v13 expandedTransform];
  }
  else {
    memset(&v27, 0, sizeof(v27));
  }
  v15 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v16 = [v15 currentCardViewController];
  v17 = [v16 configuration];
  [v17 cardExpandedTopOffset];
  CGAffineTransformTranslate(&v28, &v27, 0.0, v18);
  CGAffineTransform v26 = v28;
  [(BCCardSetCustomNavigationTransition *)self setTargetTransform:&v26];

  id v19 = objc_alloc((Class)UIView);
  [(BCCardSetCustomNavigationTransition *)self onScreen];
  id v20 = [v19 initWithFrame:];
  [v20 setAlpha:0.0];
  v21 = +[UIColor blackColor];
  [v20 setBackgroundColor:v21];

  v22 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v22 setNavigationSkrimView:v20];

  v23 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v24 = [v23 currentCardViewController];
  v25 = [v24 contentContainerView];
  [v25 setClipsToBounds:0];

  [(BCCardSetCustomNavigationTransition *)self setAfterScreenUpdates:0];
}

- (void)updateAnimator
{
  v3 = [(BCCardSetCustomNavigationTransition *)self animator];
  v4 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v5 = v4;
  if (v4)
  {
    [v4 expandedTransform];
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
  }
  v6 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v7 = [v6 scrollView];
  v35[0] = v36;
  v35[1] = v37;
  v35[2] = v38;
  [v7 setTransform:v35];

  v8 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v9 = [v8 scrollView];
  [v9 setScrollEnabled:0];

  v10 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v11 = [v10 tapToDismissGestureRecognizer];
  [v11 setEnabled:0];

  id v12 = objc_alloc((Class)UIScreenEdgePanGestureRecognizer);
  v13 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  id v14 = [v12 initWithTarget:v13 action:"edgePanGesture:"];
  v15 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v15 setEdgePanGestureRecognizer:v14];

  v16 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v17 = [v16 edgePanGestureRecognizer];
  [v17 setEdges:2];

  CGFloat v18 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  id v19 = [v18 currentCardViewController];
  id v20 = [v19 cardNavigationController];
  v21 = [v20 view];
  v22 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v23 = [v22 edgePanGestureRecognizer];
  [v21 addGestureRecognizer:v23];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_9E364;
  v34[3] = &unk_2C3C50;
  v34[4] = self;
  [v3 addAnimations:v34];
  v24 = [(BCCardSetCustomNavigationTransition *)self fromView];
  [v24 removeFromSuperview];

  v25 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  CGAffineTransform v26 = [v25 delegate];
  CGAffineTransform v27 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v26 cardSetViewController:v27 animatorForExpanding:v3];

  CGAffineTransform v28 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v28 scaledContractedOffset];
  double v30 = v29;
  CGAffineTransform v31 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v32 = [v31 currentCardViewController];
  v33 = [v32 scrollView];
  [v33 setContentOffset:0.0 v30];
}

- (void)animationEnded:(BOOL)a3
{
  if (a3)
  {
    id v6 = +[BCCardSetState pushedState];
    v4 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    v5 = [v4 currentCardViewController];
    [v5 setCurrentState:v6];
  }
}

@end