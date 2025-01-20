@interface UISheetAnimationController
@end

@implementation UISheetAnimationController

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutTransitionViews];
  id v2 = [*(id *)(a1 + 32) forwardView];
  [v2 layoutIfNeeded];
}

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) containerView];
  id v2 = [v5 backgroundColor];
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[UIColor clearColor];
  }
  v4 = [*(id *)(a1 + 32) containerView];
  [v4 setBackgroundColor:v3];

  if (!v2) {
}
  }

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v8[3] = &unk_1E52DC308;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, v8, v5, v6, v7);
  objc_destroyWeak(&v9);
}

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutTransitionViews];
  [WeakRetained runNoninteractiveAnimationsIfPossible];
  v1 = [WeakRetained forwardView];
  [v1 layoutIfNeeded];
}

uint64_t __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

@end