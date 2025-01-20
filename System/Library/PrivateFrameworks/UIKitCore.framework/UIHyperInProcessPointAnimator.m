@interface UIHyperInProcessPointAnimator
@end

@implementation UIHyperInProcessPointAnimator

void __53___UIHyperInProcessPointAnimator_initWithDimensions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _interactor];
  if (v1)
  {
    v2 = [WeakRetained _animatableProperty];
    uint64_t v3 = [v2 _presentationValue];

    if ([WeakRetained _generatesFeedbackWhenBoundaryIsCrossed])
    {
      if (([WeakRetained _regionChangedDiscontinuouslyOnChange] & 1) != 0
        || ([v1 _region],
            v4 = objc_claimAutoreleasedReturnValue(),
            int IsBoundaryCrossedFromPointToPoint = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v4, [v1 _presentationPoint], v3), v4, IsBoundaryCrossedFromPointToPoint))
      {
        v6 = [WeakRetained _feedbackGenerator];
        [v6 selectionChanged];

        [WeakRetained _setRegionChangedDiscontinuouslyOnChange:0];
      }
    }
    [v1 _copyOverridePresentationPoint:v3];
    v7 = [v1 _delegate];
    [v7 _hyperInteractorApplyPresentationPoint:v1];
  }
}

void __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v2 = MEMORY[0x1F4188790](*(void *)(a1 + 32));
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v5, "_interactor", v2);
  [v6 _closestPoint];
  cblas_dcopy_NEWLAPACK();

  v7 = [*(id *)(a1 + 32) _interactor];
  v8 = [v7 _delegate];
  v9 = [*(id *)(a1 + 32) _interactor];
  [v8 _hyperInteractorApplyPresentationPoint:v9];

  v10 = [*(id *)(a1 + 32) _interactor];
  objc_msgSend(*(id *)(a1 + 32), "_setRegionChangedDiscontinuouslyOnChange:", memcmp(v4, (const void *)objc_msgSend(v10, "_closestPoint"), 8 * *(void *)(*(void *)(a1 + 32) + 16)) != 0);
}

uint64_t __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnimatablePropertyValuesToConstrainedPoint];
}

void __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) _interactor];
  double v2 = [v4 _delegate];
  uint64_t v3 = [*(id *)(a1 + 32) _interactor];
  [v2 _hyperInteractorApplyPresentationPoint:v3];
}

uint64_t __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnimatablePropertyValuesToConstrainedPoint];
}

void __65___UIHyperInProcessPointAnimator__animateWithPrelude_animations___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) _interactor];
    [v3 _setOverridingPresentationPoint:0];
  }
}

@end