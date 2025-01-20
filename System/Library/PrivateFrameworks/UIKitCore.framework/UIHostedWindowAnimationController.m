@interface UIHostedWindowAnimationController
@end

@implementation UIHostedWindowAnimationController

uint64_t __56___UIHostedWindowAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = [*(id *)(a1 + 40) transitionActions];

  if (v2)
  {
    v3 = [*(id *)(a1 + 40) transitionActions];
    v3[2]();
  }
  v4 = *(void **)(a1 + 48);
  return objc_msgSend(v4, "__runAlongsideAnimations");
}

uint64_t __56___UIHostedWindowAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitionActions:0];
  [*(id *)(a1 + 40) completeTransition:1];
  [*(id *)(a1 + 40) _setAnimator:0];
  v2 = *(void **)(a1 + 48);
  return [v2 _setAnimationController:0];
}

@end