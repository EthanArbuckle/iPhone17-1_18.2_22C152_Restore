@interface BCCardSetContractingState
- (int64_t)contractedPosition;
- (int64_t)expandedPosition;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)setFractionComplete:(double)a3 cardData:(id)a4;
@end

@implementation BCCardSetContractingState

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetContractingState;
  id v7 = a5;
  [(BCCardSetTransitioningState *)&v9 didBecomeCurrentStateCardViewController:a3 previousState:a4 cardData:v7];
  v8 = [v7 cardSetData];

  [v8 goContractedInteractive:1];
}

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  double v4 = fmax(1.0 - a3, 0.0);
  id v5 = [a4 animator];
  [v5 setFractionComplete:v4];
}

- (int64_t)expandedPosition
{
  return 1;
}

- (int64_t)contractedPosition
{
  return 0;
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 cardNavigationController];
  v13 = [v12 viewControllers];
  id v14 = [v13 count];

  if ((unint64_t)v14 <= 1)
  {
    v15 = [v21 animator];

    if (v15)
    {
      [(BCCardSetTransitioningState *)self _resetInteractiveAnimationWithScrollView:v10 cardData:v21];
      v19 = [v11 delegate];
      [v19 scrollViewWillBeginDragging:v11];
    }
    else
    {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cards/BCCardSetState.m", 1108, (uint64_t)"-[BCCardSetContractingState cardViewController:cardData:scrollViewWillBeginDragging:contentScrollView:]", (uint64_t)"data.animator != nil", @"Got begin dragging in Contracting state but we didn't have an animator.", v16, v17, v18, v20);
    }
  }
}

@end