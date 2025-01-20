@interface BCCardSetPushedState
- (BOOL)ignoreContentOffsetForCardViewController:(id)a3;
- (BOOL)popping;
- (BOOL)prefersStatusBarBackgroundHidden;
- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4;
- (void)cardViewControllerUpdateCardSize:(id)a3;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)setPopping:(BOOL)a3;
- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5;
@end

@implementation BCCardSetPushedState

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BCCardSetPushedState;
  id v9 = a5;
  [(BCCardSetState *)&v41 didBecomeCurrentStateCardViewController:v8 previousState:a4 cardData:v9];
  v10 = [v8 cardNavigationController];
  v11 = [v10 view];
  long long v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v34 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[1] = v33;
  long long v32 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v40[2] = v32;
  [v11 setTransform:v40];

  v12 = [v8 cardNavigationController];
  v13 = [v12 view];
  v14 = v13;
  if (v13)
  {
    [v13 transform];
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
  }
  v15 = [v8 auxiliaryNavigationBarView];
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  [v15 setTransform:v36];

  v16 = [v8 cardView];
  v35[0] = v34;
  v35[1] = v33;
  v35[2] = v32;
  [v16 setTransform:v35];

  v17 = [v8 contentScrollView];
  [(BCCardSetPushedState *)self cardViewController:v8 contentScrollViewDidChange:v17 cardData:v9];

  double y = CGPointZero.y;
  v19 = [v8 scrollView];
  [v19 setContentOffset:CGPointZero.x, y];

  v20 = [v8 scrollView];
  [v20 setShowsVerticalScrollIndicator:0];

  v21 = [v8 scrollView];
  [v21 setScrollEnabled:0];

  v22 = [v8 view];
  [v22 bounds];
  CGRectMakeWithSize();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  v31 = [v8 cardView];
  [v31 setFrame:v24, v26, v28, v30];
}

- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = a4;
  [(BCCardSetPushedState *)self setPopping:1];
  [v8 _updateCardFrames];
  [v8 _updateScrollViewContentInset];

  v10 = [v13 scrollView];
  [v10 setScrollEnabled:1];

  LODWORD(v10) = [v9 transitioning];
  if (v10)
  {
    v11 = [v13 contentScrollView];
    [v11 setScrollEnabled:0];

    v12 = [v13 contentScrollView];
    [v12 setShowsVerticalScrollIndicator:0];
  }
  [(BCCardSetPushedState *)self setPopping:0];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v5 = a4;
  [v5 setShowsVerticalScrollIndicator:1];
  [v5 setScrollEnabled:1];
}

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return 1;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  return 1;
}

- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  -[BCCardSetState _adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:](self, "_adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:", v7, 0, width, height);
  double v9 = v8;
  double v11 = v10;
  id v12 = [v7 scrollView];

  [v12 setContentSize:v9, v11];
}

- (void)cardViewControllerUpdateCardSize:(id)a3
{
  id v5 = a3;
  if ([(BCCardSetPushedState *)self popping])
  {
    [(BCCardSetState *)self updateCardSize:v5 addExtra:1];
  }
  else
  {
    v4 = [v5 configuration];
    -[BCCardSetState updateCardSize:addExtra:](self, "updateCardSize:addExtra:", v5, [v4 cardsCanExpand] ^ 1);
  }
}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  BOOL v5 = a4;
  id v7 = [a3 contentScrollView];
  [(BCCardSetState *)self _scrollScrollViewToTopForCardViewController:v7 animated:v5];
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 0.0;
}

- (BOOL)popping
{
  return *(&self->super._contentOffsetUpdatesSuspended + 1);
}

- (void)setPopping:(BOOL)a3
{
  *(&self->super._contentOffsetUpdatesSuspended + 1) = a3;
}

@end