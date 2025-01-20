@interface UISearchControllerCarPlaySearchBarAnimator
@end

@implementation UISearchControllerCarPlaySearchBarAnimator

void __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v1 setAlpha:1.0];
}

uint64_t __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsFocusUpdate];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;
  return [v2 completeTransition:v3];
}

void __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) searchBar];
  [v2 _setDisableFocus:0];

  if ([*(id *)(a1 + 32) automaticallyShowsCancelButton])
  {
    uint64_t v3 = [*(id *)(a1 + 32) searchBar];
    objc_msgSend(v3, "setShowsCancelButton:animated:", 0, objc_msgSend(*(id *)(a1 + 40), "isAnimated"));
  }
  v4 = [*(id *)(a1 + 32) searchBar];
  int v5 = [v4 isFirstResponder];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) searchBar];
    [v6 resignFirstResponder];
  }
}

uint64_t __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

void __78___UISearchControllerCarPlaySearchBarAnimator_didFocusSearchBarForController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  id v1 = [v2 superview];
  [v1 layoutIfNeeded];
}

void __80___UISearchControllerCarPlaySearchBarAnimator_didUnfocusSearchBarForController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  id v1 = [v2 superview];
  [v1 layoutIfNeeded];
}

@end