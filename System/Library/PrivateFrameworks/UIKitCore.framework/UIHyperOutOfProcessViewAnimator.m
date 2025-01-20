@interface UIHyperOutOfProcessViewAnimator
@end

@implementation UIHyperOutOfProcessViewAnimator

void __55___UIHyperOutOfProcessViewAnimator__interactionChanged__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _interactor];
  v2 = [v4 _delegate];
  v3 = [*(id *)(a1 + 32) _interactor];
  [v2 _hyperInteractorApplyPresentationPoint:v3];
}

double __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40) + *(double *)(a2 + 8 * v2);
  *(double *)(a2 + 8 * v2) = result;
  return result;
}

void __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _interactor];
  *(void *)(a2 + 8 * *(void *)(a1 + 40)) = *(void *)([v4 _constrainedPoint]
                                                           + 8 * *(void *)(a1 + 40));
}

void __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _interactor];
  uint64_t v2 = [v4 _delegate];
  v3 = [*(id *)(a1 + 32) _interactor];
  [v2 _hyperInteractorApplyPresentationPoint:v3];
}

uint64_t __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _preferredFrameRateRange];
  int v3 = v2;
  int v5 = v4;
  int v7 = v6;
  uint64_t v8 = [*(id *)(a1 + 32) _updateReason];
  uint64_t v9 = *(void *)(a1 + 40);
  LODWORD(v10) = v3;
  LODWORD(v11) = v5;
  LODWORD(v12) = v7;
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v8, v9, v10, v11, v12);
}

void __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    int v3 = [WeakRetained _propertyAnimators];
    [v3 removeObject:v2];
  }
}

@end