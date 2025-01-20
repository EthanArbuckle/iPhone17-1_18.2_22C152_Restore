@interface UISearchControllerInPlaceSearchBarAnimator
@end

@implementation UISearchControllerInPlaceSearchBarAnimator

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
}

void __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:1.0];

  if ([*(id *)(a1 + 32) _previousSearchBarPosition] != -1) {
    [*(id *)(a1 + 40) _setBarPosition:3];
  }
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_24;
  }
  if (([*(id *)(a1 + 40) _isHostedByNavigationBar] & 1) == 0)
  {
    [*(id *)(a1 + 40) _driveTransitionToSearchLayoutState:3];
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
LABEL_24:
    if ([*(id *)(a1 + 32) automaticallyShowsCancelButton]) {
      [*(id *)(a1 + 40) setShowsCancelButton:1 animated:*(unsigned __int8 *)(a1 + 65)];
    }
  }
LABEL_9:
  v3 = *(void **)(a1 + 48);
  if (v3 && [v3 _compatibleContentInsetAdjustmentBehavior] == 101 && *(unsigned char *)(a1 + 66))
  {
    [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 40);
    objc_msgSend(*(id *)(a1 + 48), "setContentOffset:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  v5 = [*(id *)(a1 + 32) _managedPalette];
  if (v5)
  {
    id v16 = v5;
    v6 = [*(id *)(a1 + 40) scopeButtonTitles];
    if ([v6 count])
    {
      char v7 = [*(id *)(a1 + 40) _scopeBarIsVisible];

      if ((v7 & 1) == 0)
      {
        [*(id *)(a1 + 40) _setShowsScopeBar:1 animateOpacity:*(unsigned __int8 *)(a1 + 65)];
        [*(id *)(a1 + 40) _setScopeBarHidden:0];
      }
    }
    else
    {
    }
    [*(id *)(a1 + 40) sizeToFit];
    [*(id *)(a1 + 40) frame];
    CGFloat v9 = v8;
    [v16 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    objc_msgSend(v16, "setFrame:isAnimating:", *(unsigned __int8 *)(a1 + 65));
    v18.origin.x = v11;
    v18.origin.y = v13;
    v18.size.width = v15;
    v18.size.height = v9;
    [v16 _setTopConstraintConstant:CGRectGetMinY(v18)];
    [*(id *)(a1 + 40) layoutBelowIfNeeded];
    v5 = v16;
  }
}

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

void __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v2 setAlpha:0.0];

  if ([*(id *)(a1 + 40) barPosition] == 3
    && [*(id *)(a1 + 32) _previousSearchBarPosition] != -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setBarPosition:", objc_msgSend(*(id *)(a1 + 32), "_previousSearchBarPosition"));
    objc_msgSend(*(id *)(a1 + 32), "set_previousSearchBarPosition:", -1);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (([*(id *)(a1 + 40) _isHostedByNavigationBar] & 1) == 0)
    {
      [*(id *)(a1 + 40) _driveTransitionToSearchLayoutState:2];
      goto LABEL_10;
    }
    if (*(unsigned char *)(a1 + 48)) {
      goto LABEL_10;
    }
  }
  if ([*(id *)(a1 + 32) automaticallyShowsCancelButton])
  {
    v3 = [*(id *)(a1 + 32) searchBar];
    [v3 setShowsCancelButton:0 animated:*(unsigned __int8 *)(a1 + 49)];
  }
LABEL_10:
  double v4 = [*(id *)(a1 + 32) searchBar];
  int v5 = [v4 isFirstResponder];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) searchBar];
    [v6 resignFirstResponder];
  }
  [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
  if (fabs(v7) >= 2.22044605e-16)
  {
    double v8 = [*(id *)(a1 + 32) searchResultsController];
    id v14 = [v8 _contentOrObservableScrollViewForEdge:1];

    if (v14 && [v14 _compatibleContentInsetAdjustmentBehavior] == 101)
    {
      [v14 contentOffset];
      double v10 = v9;
      double v12 = v11;
      [*(id *)(a1 + 32) _resultsContentScrollViewPresentationOffset];
      objc_msgSend(v14, "setContentOffset:", v10, v12 - v13);
    }
  }
}

uint64_t __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

@end