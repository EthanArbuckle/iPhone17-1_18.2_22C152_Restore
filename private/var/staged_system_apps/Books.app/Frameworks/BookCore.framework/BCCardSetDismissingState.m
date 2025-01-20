@interface BCCardSetDismissingState
- (BOOL)transitioning;
- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3;
- (void)_finishAnimationWithScrollView:(id)a3 cardViewController:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDecelerating:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDragging:(id)a5 willDecelerate:(BOOL)a6 contentScrollView:(id)a7;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
@end

@implementation BCCardSetDismissingState

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  return 0.0;
}

- (BOOL)transitioning
{
  return 1;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BCCardSetDismissingState;
  id v8 = a5;
  id v9 = a3;
  [(BCCardSetState *)&v11 didBecomeCurrentStateCardViewController:v9 previousState:a4 cardData:v8];
  v10 = [v9 contentScrollView];
  [(BCCardSetDismissingState *)self cardViewController:v9 contentScrollViewDidChange:v10 cardData:v8];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v5 = [a3 scrollView];
  [v5 setShowsVerticalScrollIndicator:0];
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v7 = a6;
  id v8 = a4;
  objc_opt_class();
  id v9 = [v8 animator];
  v10 = BUDynamicCast();
  [v10 pauseDismissCancellationAndReset];
  [v8 setRawCurrentCardOffset];

  id v11 = [v7 delegate];
  [v11 scrollViewWillBeginDragging:v7];
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v28 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 contentOffset];
  double v12 = v11;
  [v10 adjustedContentInset];
  double v14 = v12 + v13;
  [v9 rawCurrentCardOffset];
  [v9 setRawCurrentCardOffset:v15 - v14];
  [v9 rawCurrentCardOffset];
  if (v16 <= 0.0)
  {
    [v9 setRawCurrentCardOffset:0.0];
    [v9 rawCurrentCardOffset];
    double v22 = v23;
    v24 = [v9 animator];
    [v24 setFractionComplete:0.0];

    v25 = [v9 animator];
    [v25 stopAnimation:0];

    v26 = [v9 animator];
    [v26 finishAnimationAtPosition:1];

    [v9 setAnimator:0];
    if ([v28 itemPushedOnCard]) {
      +[BCCardSetState pushedContractedState];
    }
    else {
    v20 = +[BCCardSetState contractedState];
    }
    [v9 setCurrentState:v20];
  }
  else
  {
    v17 = [v9 animator];

    if (!v17)
    {
      v18 = [v9 cardSetData];
      v19 = [v18 animatorForInteractiveDismiss];
      [v9 setAnimator:v19];
    }
    objc_opt_class();
    v20 = [v9 animator];
    v21 = BUDynamicCast();
    [v9 rawCurrentCardOffset];
    [v21 updateDismissFractionCompleteWithCardOffset:];

    double v22 = 0.0;
  }

  [v10 adjustedContentInset];
  [(BCCardSetState *)self adjustScrollView:v10 newContentOffset:v9 cardData:-v22 - v27];
}

- (void)_finishAnimationWithScrollView:(id)a3 cardViewController:(id)a4 cardData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 scrollViewVerticalVelocityWhenDraggingEnded];
  double v11 = v10 * -1000.0;
  objc_opt_class();
  double v12 = [v9 animator];
  double v13 = BUDynamicCast();

  double v14 = 0.0;
  [v9 setScrollViewVerticalVelocityWhenDraggingEnded:0.0];
  if (v11 < 0.0
    || v11 < 3000.0
    && ([v9 rawCurrentCardOffset],
        double v16 = v15,
        [v9 cardSetData],
        v17 = objc_claimAutoreleasedReturnValue(),
        [v17 cutoffToDismissScrollView:v7],
        double v19 = v18,
        v17,
        v16 <= v19))
  {
    [v9 rawCurrentCardOffset];
    if (fabs(v21) >= 2.22044605e-16) {
      double v14 = -v11 / v21;
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_159AF4;
    v22[3] = &unk_2C40E8;
    id v23 = v9;
    id v24 = v8;
    [v13 animateDismissCancellationWithVelocity:v22 completion:v14];
  }
  else
  {
    [v13 stopAnimation:1];
    [v9 setAnimator:0];
    [v9 setRawCurrentCardOffset:0.0];
    v20 = [v9 cardSetData];
    [v20 _didCommitDismissWithVelocity:v13 interactiveAnimator:v11];
  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDragging:(id)a5 willDecelerate:(BOOL)a6 contentScrollView:(id)a7
{
  id v14 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [v11 animator];

  if (v13 && !a6) {
    [(BCCardSetDismissingState *)self _finishAnimationWithScrollView:v12 cardViewController:v14 cardData:v11];
  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDecelerating:(id)a5 contentScrollView:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 animator];

  if (v11) {
    [(BCCardSetDismissingState *)self _finishAnimationWithScrollView:v10 cardViewController:v12 cardData:v9];
  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BCCardSetDismissingState;
  id v5 = a4;
  [(BCCardSetState *)&v8 cardViewController:a3 willDismissWithCardData:v5];
  objc_opt_class();
  v6 = [v5 animator];

  id v7 = BUDynamicCast();

  [v7 stopAnimation:1];
}

- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (char *)[v8 state];
  if ((unint64_t)(v10 - 3) >= 3)
  {
    if (v10 != (unsigned char *)&def_7D91C + 2) {
      goto LABEL_8;
    }
    double v15 = [v21 cardView];
    [v8 translationInView:v15];
    [v9 setRawCurrentCardOffset:v16];

    v17 = [v9 animator];

    if (!v17)
    {
      double v18 = [v9 cardSetData];
      double v19 = [v18 animatorForInteractiveDismiss];
      [v9 setAnimator:v19];
    }
    objc_opt_class();
    id v14 = [v9 animator];
    v20 = BUDynamicCast();
    [v9 rawCurrentCardOffset];
    [v20 updateDismissFractionCompleteWithCardOffset:];
  }
  else
  {
    id v11 = [v21 scrollView];
    [v11 setScrollEnabled:1];

    id v12 = [v21 cardView];
    [v8 velocityInView:v12];
    [v9 setScrollViewVerticalVelocityWhenDraggingEnded:v13 / -1000.0];

    id v14 = [v21 scrollView];
    [(BCCardSetDismissingState *)self _finishAnimationWithScrollView:v14 cardViewController:v21 cardData:v9];
  }

LABEL_8:
}

@end