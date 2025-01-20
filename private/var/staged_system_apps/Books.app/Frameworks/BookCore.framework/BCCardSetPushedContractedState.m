@interface BCCardSetPushedContractedState
- (BOOL)ignoreContentOffsetForCardViewController:(id)a3;
- (BOOL)popping;
- (BOOL)useContentInsetForContentForScrollIndicatorInsets;
- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)setPopping:(BOOL)a3;
- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5;
@end

@implementation BCCardSetPushedContractedState

- (BOOL)useContentInsetForContentForScrollIndicatorInsets
{
  return ![(BCCardSetPushedContractedState *)self popping];
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 contentContainerView];
  [v11 setClipsToBounds:1];

  id v12 = +[BCCardSetState contractedState];

  if (v12 == v9)
  {
    double y = CGPointZero.y;
    v14 = [v8 scrollView];
    [v14 setContentOffset:CGPointZero.x, y];

    v15 = [v8 cardView];
    long long v24 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v31[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v23 = v31[0];
    v31[1] = v24;
    long long v32 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v22 = v32;
    [v15 setTransform:v31];

    v16 = [v8 cardNavigationController];
    v17 = [v16 view];
    v30[0] = v23;
    v30[1] = v24;
    v30[2] = v22;
    [v17 setTransform:v30];

    v18 = [v8 cardNavigationController];
    v19 = [v18 view];
    v20 = v19;
    if (v19)
    {
      [v19 transform];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
    }
    v21 = [v8 auxiliaryNavigationBarView];
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    [v21 setTransform:v26];
  }
  [v10 _updateScrollViewContentInset];
  v25.receiver = self;
  v25.super_class = (Class)BCCardSetPushedContractedState;
  [(BCCardSetContractedState *)&v25 didBecomeCurrentStateCardViewController:v8 previousState:v9 cardData:v10];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(BCCardSetContractedState *)self cardViewController:v10 cardScrollViewOffsetForContentScrollView:v9 cardData:v8];
  double v12 = v11;
  v13 = [v10 scrollView];
  [v13 contentOffset];
  double v15 = v14;

  v16 = [v10 scrollView];
  [v16 setContentOffset:v15, v12];

  [(BCCardSetContractedState *)self cardViewController:v10 repositionOffsetsWithContentScrollView:v9 cardData:v8];
  id v19 = [v8 configuration];

  uint64_t v17 = [v19 cardsCanExpand] ^ 1;
  v18 = [v10 scrollView];

  [v18 setShowsVerticalScrollIndicator:v17];
}

- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (([v10 transitioning] & 1) == 0)
  {
    double v11 = [v8 contentScrollView];
    [(BCCardSetContractedState *)self cardViewController:v8 repositionOffsetsWithContentScrollView:v11 cardData:v9];
  }
  [(BCCardSetPushedContractedState *)self setPopping:1];
  [v9 _updateScrollViewContentInset];
  [(BCCardSetPushedContractedState *)self setPopping:0];
  v12.receiver = self;
  v12.super_class = (Class)BCCardSetPushedContractedState;
  [(BCCardSetState *)&v12 willStopBeingCurrentStateCardViewController:v8 newState:v10 cardDate:v9];
}

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return 1;
}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  BOOL v5 = a4;
  id v7 = [a3 scrollView];
  [(BCCardSetState *)self _scrollScrollViewToTopForCardViewController:v7 animated:v5];
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 0.0;
}

- (BOOL)popping
{
  return *(&self->super.super._contentOffsetUpdatesSuspended + 1);
}

- (void)setPopping:(BOOL)a3
{
  *(&self->super.super._contentOffsetUpdatesSuspended + 1) = a3;
}

@end