@interface UISearchControllerTransplantSearchBarAnimator
@end

@implementation UISearchControllerTransplantSearchBarAnimator

void __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:1.0];

  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 40) _driveTransitionToSearchLayoutState:3];
  }
  else if ([*(id *)(a1 + 32) automaticallyShowsCancelButton])
  {
    [*(id *)(a1 + 40) setShowsCancelButton:1 animated:*(unsigned __int8 *)(a1 + 73)];
  }
  v3 = *(void **)(a1 + 48);
  if (v3 && [v3 automaticallyAdjustsScrollViewInsets] && *(unsigned char *)(a1 + 74))
  {
    [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 40);
    objc_msgSend(*(id *)(a1 + 56), "setContentOffset:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    id v7 = [*(id *)(a1 + 40) scopeButtonTitles];
    if ([v7 count])
    {
      char v5 = [*(id *)(a1 + 40) _scopeBarIsVisible];

      if ((v5 & 1) == 0)
      {
        [*(id *)(a1 + 40) _setShowsScopeBar:1 animateOpacity:1];
        [*(id *)(a1 + 40) _setScopeBarHidden:0];
        [*(id *)(a1 + 40) sizeToFit];
        v6 = *(void **)(a1 + 40);
        [v6 layoutBelowIfNeeded];
      }
    }
    else
    {
    }
  }
}

uint64_t __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setMaskActive:0];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;
  return [v2 completeTransition:v3];
}

void __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:0.0];

  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 40) _driveTransitionToSearchLayoutState:2];
  }
  else if ([*(id *)(a1 + 32) automaticallyShowsCancelButton])
  {
    uint64_t v3 = [*(id *)(a1 + 32) searchBar];
    [v3 setShowsCancelButton:0 animated:*(unsigned __int8 *)(a1 + 49)];
  }
  if ([*(id *)(a1 + 40) isFirstResponder]) {
    [*(id *)(a1 + 40) resignFirstResponder];
  }
  [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
  if (fabs(v4) >= 2.22044605e-16)
  {
    char v5 = [*(id *)(a1 + 32) searchResultsController];
    v6 = [v5 _contentOrObservableScrollViewForEdge:1];

    [v6 contentOffset];
    double v8 = v7;
    double v10 = v9;
    [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
    objc_msgSend(v6, "setContentOffset:", v8, v10 - v11);
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v14 = [*(id *)(a1 + 40) scopeButtonTitles];
    if ([v14 count])
    {
      int v12 = [*(id *)(a1 + 40) _scopeBarIsVisible];

      if (v12)
      {
        [*(id *)(a1 + 40) _setShowsScopeBar:0 animateOpacity:1];
        [*(id *)(a1 + 40) sizeToFit];
        v13 = *(void **)(a1 + 40);
        [v13 layoutBelowIfNeeded];
      }
    }
    else
    {
    }
  }
}

uint64_t __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _previousSearchBarPosition] != -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setBarPosition:", objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition"));
    v2 = *(void **)(a1 + 40);
    BOOL v3 = [v2 barPosition] == 3 && objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition") != 3;
    [v2 _setMaskActive:v3];
    objc_msgSend(*(id *)(a1 + 32), "set_previousSearchBarPosition:", -1);
  }
  [*(id *)(a1 + 40) _setScopeBarHidden:1];
  double v4 = *(void **)(a1 + 48);
  uint64_t v5 = [v4 transitionWasCancelled] ^ 1;
  return [v4 completeTransition:v5];
}

@end