@interface UIHyperInProcessViewAnimator
@end

@implementation UIHyperInProcessViewAnimator

void __52___UIHyperInProcessViewAnimator__interactionChanged__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _interactor];
  v2 = [v4 _delegate];
  v3 = [*(id *)(a1 + 32) _interactor];
  [v2 _hyperInteractorApplyPresentationPoint:v3];
}

void __64___UIHyperInProcessViewAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _interactor];
  v2 = [v4 _delegate];
  v3 = [*(id *)(a1 + 32) _interactor];
  [v2 _hyperInteractorApplyPresentationPoint:v3];
}

@end