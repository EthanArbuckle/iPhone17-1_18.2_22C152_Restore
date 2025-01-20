@interface UIViewControllerTransitionConductor
@end

@implementation UIViewControllerTransitionConductor

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained transitionConductor:*(void *)(a1 + 32) didEndCustomTransitionWithContext:v6 didComplete:a3];
}

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained transitionConductor:*(void *)(a1 + 32) interactiveTransitionDidUpdateProgress:a2 finish:a3 transitionCompleted:v10 transitionContext:a5];

  if (a2 && ([v10 isInterruptible] & 1) == 0)
  {
    [*(id *)(a1 + 32) setCustomNavigationTransitionDuration:0.0];
    [*(id *)(a1 + 32) setInteractiveTransition:0];
  }
}

void __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained transitionConductor:*(void *)(a1 + 32) beginPinningInputViewsForTransitionFromViewController:*(void *)(a1 + 40) toViewController:*(void *)(a1 + 48) forTransitionType:*(unsigned int *)(a1 + 56)];
}

@end