@interface UISearchControllerOffscreenSearchBarAnimator
@end

@implementation UISearchControllerOffscreenSearchBarAnimator

void *__67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:1.0];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 40) becomeFirstResponder];
  v3 = [*(id *)(a1 + 40) scopeButtonTitles];
  if ([v3 count])
  {
    char v4 = [*(id *)(a1 + 40) _scopeBarIsVisible];

    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 40) _setShowsScopeBar:1 animateOpacity:1];
      [*(id *)(a1 + 40) _setScopeBarHidden:0];
      [*(id *)(a1 + 40) sizeToFit];
      [*(id *)(a1 + 40) layoutBelowIfNeeded];
    }
  }
  else
  {
  }
  result = *(void **)(a1 + 48);
  if (result)
  {
    result = (void *)[result automaticallyAdjustsScrollViewInsets];
    if (result)
    {
      double v6 = *(double *)(a1 + 96);
      double v7 = *(double *)(a1 + 104);
      v8 = *(void **)(a1 + 56);
      return objc_msgSend(v8, "setContentOffset:", v6, v7);
    }
  }
  return result;
}

uint64_t __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

void __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:0.0];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ([*(id *)(a1 + 40) isFirstResponder]) {
    [*(id *)(a1 + 40) resignFirstResponder];
  }
  v3 = [*(id *)(a1 + 40) scopeButtonTitles];
  if ([v3 count])
  {
    int v4 = [*(id *)(a1 + 40) _scopeBarIsVisible];

    if (v4)
    {
      [*(id *)(a1 + 40) _setShowsScopeBar:0 animateOpacity:1];
      [*(id *)(a1 + 40) sizeToFit];
      [*(id *)(a1 + 40) layoutBelowIfNeeded];
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
  if (fabs(v5) >= 2.22044605e-16)
  {
    double v6 = [*(id *)(a1 + 32) searchResultsController];
    id v12 = [v6 _contentOrObservableScrollViewForEdge:1];

    [v12 contentOffset];
    double v8 = v7;
    double v10 = v9;
    [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
    objc_msgSend(v12, "setContentOffset:", v8, v10 + v11);
  }
}

uint64_t __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setScopeBarHidden:1];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;
  return [v2 completeTransition:v3];
}

@end