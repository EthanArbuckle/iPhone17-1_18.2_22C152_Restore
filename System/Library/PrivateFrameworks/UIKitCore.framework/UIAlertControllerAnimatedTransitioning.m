@interface UIAlertControllerAnimatedTransitioning
@end

@implementation UIAlertControllerAnimatedTransitioning

void __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) transitionWasCancelled])
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) _didEndSystemProvidedPresentationOfAlertController:*(void *)(a1 + 48) wasSuccessful:0];
    }
    v2 = *(void **)(a1 + 32);
    [v2 completeTransition:0];
  }
  else
  {
    v3 = +[UIDevice currentDevice];
    v4 = [v3 _tapticEngine];
    [v4 actuateFeedback:1];

    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) _didBeginSystemProvidedPresentationOfAlertController:*(void *)(a1 + 48)];
    }
    v5 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_2;
    v7[3] = &unk_1E52DAF68;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    [v5 _animateTransition:v6 completionBlock:v7];
  }
}

uint64_t __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) _didEndSystemProvidedPresentationOfAlertController:*(void *)(a1 + 40) wasSuccessful:a2];
  }
  v4 = *(void **)(a1 + 48);
  return [v4 completeTransition:a2];
}

uint64_t __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) _didEndSystemProvidedPresentationOfAlertController:*(void *)(a1 + 40) wasSuccessful:a2];
  }
  v4 = *(void **)(a1 + 48);
  return [v4 completeTransition:a2];
}

@end