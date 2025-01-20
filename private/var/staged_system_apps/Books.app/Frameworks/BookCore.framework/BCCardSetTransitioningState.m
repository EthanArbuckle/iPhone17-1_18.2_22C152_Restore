@interface BCCardSetTransitioningState
- (BOOL)transitioning;
- (UIScrollView)scrollView;
- (double)_extraGripperOffsetForViewController:(id)a3;
- (double)leftOver;
- (int64_t)contractedPosition;
- (int64_t)expandedPosition;
- (void)_resetInteractiveAnimationWithScrollView:(id)a3 cardData:(id)a4;
- (void)cardViewController:(id)a3 animationCompletedAtPosition:(int64_t)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)setFractionComplete:(double)a3 cardData:(id)a4;
- (void)setLeftOver:(double)a3;
- (void)setScrollView:(id)a3;
@end

@implementation BCCardSetTransitioningState

- (BOOL)transitioning
{
  return 1;
}

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  id v4 = a4;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetTransitioningState setFractionComplete:cardData:]");
  id v6 = +[NSException exceptionWithName:@"abstract base class" reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BCCardSetTransitioningState;
  id v8 = a5;
  id v9 = a3;
  [(BCCardSetState *)&v11 didBecomeCurrentStateCardViewController:v9 previousState:a4 cardData:v8];
  v10 = [v9 contentScrollView];
  [(BCCardSetTransitioningState *)self cardViewController:v9 contentScrollViewDidChange:v10 cardData:v8];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 contentScrollView];
  v10 = [v8 scrollView];
  [(BCCardSetState *)self updateCardViewController:v8 contentScrollView:v9 basedOnCardScrollView:v10 cardData:v7];

  id v11 = [v8 scrollView];

  [v11 setShowsVerticalScrollIndicator:0];
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v35 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 animator];

  if (v13)
  {
    [(BCCardSetState *)self yInScrollView:v11 cardViewController:v35];
    -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v35, v10);
    double v15 = v14;
    [(BCCardSetState *)self updateCardViewController:v35 contentScrollView:v12 basedOnCardScrollView:v11 cardData:v10];
    [v10 distanceToExpand];
    double v17 = v16;
    v18 = +[UIScreen mainScreen];
    [v18 scale];
    double v20 = v19;

    v21 = [v10 configuration];
    [v21 cardExpandedTopOffset];
    if (v15 < v22)
    {

LABEL_5:
      [(BCCardSetTransitioningState *)self setFractionComplete:v10 cardData:1.0];
      v25 = [v10 animator];
      [v25 stopAnimation:0];

      v26 = [v10 animator];
      int64_t v27 = [(BCCardSetTransitioningState *)self expandedPosition];
LABEL_10:
      [v26 finishAnimationAtPosition:v27];

      goto LABEL_11;
    }
    double v23 = vabdd_f64(v15, v22);
    double v24 = 1.0 / v20;

    if (v23 < v24) {
      goto LABEL_5;
    }
    v28 = [v10 configuration];
    [v28 cardUnexpandedTopOffset];
    if (v15 > v29)
    {

LABEL_9:
      [(BCCardSetTransitioningState *)self setFractionComplete:v10 cardData:0.0];
      v31 = [v10 animator];
      [v31 stopAnimation:0];

      v26 = [v10 animator];
      int64_t v27 = [(BCCardSetTransitioningState *)self contractedPosition];
      goto LABEL_10;
    }
    double v30 = vabdd_f64(v15, v29);

    if (v30 < v24) {
      goto LABEL_9;
    }
    v32 = [v10 configuration];
    [v32 cardUnexpandedTopOffset];
    double v34 = v33 - v15;

    [(BCCardSetTransitioningState *)self setFractionComplete:v10 cardData:v34 / v17];
  }
LABEL_11:
}

- (void)cardViewController:(id)a3 animationCompletedAtPosition:(int64_t)a4 cardData:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int64_t v10 = [(BCCardSetTransitioningState *)self expandedPosition];
  id v11 = [v9 cardNavigationController];

  id v12 = [v11 viewControllers];
  id v13 = [v12 count];

  if (v10 == a4)
  {
    if ((unint64_t)v13 > 1) {
      +[BCCardSetState pushedState];
    }
    else {
      +[BCCardSetState expandedState];
    }
  }
  else if ((unint64_t)v13 > 1)
  {
    +[BCCardSetState pushedContractedState];
  }
  else
  {
    +[BCCardSetState contractedState];
  uint64_t v14 = };
  double v15 = (void *)v14;
  [v8 setCurrentState:v14];

  id v16 = [v8 cardSetData];

  [v16 animationCompletedExpanded:v10 == a4];
}

- (int64_t)expandedPosition
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetTransitioningState expandedPosition]");
  id v3 = +[NSException exceptionWithName:@"abstract base class" reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (int64_t)contractedPosition
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetTransitioningState contractedPosition]");
  id v3 = +[NSException exceptionWithName:@"abstract base class" reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (void)_resetInteractiveAnimationWithScrollView:(id)a3 cardData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 animator];
  [v8 pauseAnimation];

  id v16 = v6;
  [v16 contentOffset];
  double v10 = v9;
  [v16 adjustedContentInset];
  double v12 = v10 + v11;

  [v7 distanceToExpand];
  double v14 = v12 / v13;
  [v7 setRawCurrentCardOffset:0.0];
  [(BCCardSetTransitioningState *)self setFractionComplete:v7 cardData:v14];
  double v15 = [v7 animator];

  [v15 setReversed:0];
}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BCCardSetTransitioningState;
  id v5 = a4;
  [(BCCardSetState *)&v7 cardViewController:a3 willDismissWithCardData:v5];
  id v6 = [v5 animator];

  [v6 stopAnimation:1];
}

- (double)_extraGripperOffsetForViewController:(id)a3
{
  id v3 = [a3 view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];

  id v6 = [v5 statusBarManager];
  [v6 statusBarHeight];
  double v8 = v7;

  return v8;
}

- (double)leftOver
{
  return self->_leftOver;
}

- (void)setLeftOver:(double)a3
{
  self->_leftOver = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end