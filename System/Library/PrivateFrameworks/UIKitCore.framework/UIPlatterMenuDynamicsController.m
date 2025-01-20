@interface UIPlatterMenuDynamicsController
@end

@implementation UIPlatterMenuDynamicsController

void __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  v4 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) menuView];
  objc_msgSend(v7, "setCenter:", v5, v6);
}

uint64_t __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addBehaviorIfNotPresent:a2];
}

void __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopObservingBehavior];
  objc_msgSend(WeakRetained, "performActionsAndEnterState:velocity:underDirectManipulation:", *(void *)(a1 + 40), objc_msgSend(WeakRetained, "isCurrentlyUnderDirectManipulation"), 0.0, 0.0);
  if ([WeakRetained isCurrentlyUnderDirectManipulation])
  {
    double v2 = [WeakRetained platterView];
    [v2 center];
    double v4 = v3;
    double v6 = v5;
    id v7 = [WeakRetained gestureAttachmentBehavior];
    objc_msgSend(v7, "setAnchorPoint:", v4, v6);

    v8 = [WeakRetained gestureAttachmentBehavior];
    [WeakRetained addBehaviorIfNotPresent:v8];
  }
}

void __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isDefaultAnimatorBehavior:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 animator];
  [v4 removeBehavior:v3];
}

@end