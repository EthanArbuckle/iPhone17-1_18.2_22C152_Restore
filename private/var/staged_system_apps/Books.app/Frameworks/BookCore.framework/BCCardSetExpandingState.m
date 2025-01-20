@interface BCCardSetExpandingState
- (int64_t)contractedPosition;
- (int64_t)expandedPosition;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)setFractionComplete:(double)a3 cardData:(id)a4;
@end

@implementation BCCardSetExpandingState

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  id v5 = [a4 animator];
  [v5 setFractionComplete:a3];
}

- (int64_t)expandedPosition
{
  return 0;
}

- (int64_t)contractedPosition
{
  return 1;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetExpandingState;
  id v7 = a5;
  [(BCCardSetTransitioningState *)&v9 didBecomeCurrentStateCardViewController:a3 previousState:a4 cardData:v7];
  v8 = [v7 cardSetData];

  [v8 goExpandedInteractive:1];
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v17 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [v17 animator];

  if (v11)
  {
    [(BCCardSetTransitioningState *)self _resetInteractiveAnimationWithScrollView:v9 cardData:v17];
    v15 = [v10 delegate];
    [v15 scrollViewWillBeginDragging:v10];
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cards/BCCardSetState.m", 1066, (uint64_t)"-[BCCardSetExpandingState cardViewController:cardData:scrollViewWillBeginDragging:contentScrollView:]", (uint64_t)"data.animator != nil", @"Got begin dragging in Expanding state but we didn't have an animator.", v12, v13, v14, v16);
  }
}

@end