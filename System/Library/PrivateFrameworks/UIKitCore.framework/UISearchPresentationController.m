@interface UISearchPresentationController
@end

@implementation UISearchPresentationController

uint64_t __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showBackgroundObscuringView];
}

uint64_t __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) edgeForHidingNavigationBar];
  [a2 transitionDuration];
  uint64_t result = objc_msgSend(v4, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 1, v5);
  if (*(unsigned char *)(a1 + 88))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "searchBarContainerView"), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v7 = *(void **)(a1 + 48);
    return [v7 endRefreshing];
  }
  return result;
}

uint64_t __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideBackgroundObscuringView];
}

unsigned char *__94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) edgeForHidingNavigationBar];
  [a2 transitionDuration];
  objc_msgSend(v4, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 0, v5);
  uint64_t result = *(unsigned char **)(a1 + 40);
  if ((result[416] & 2) != 0)
  {
    double v7 = *(double *)(a1 + 48);
    double v8 = *(double *)(a1 + 56);
    double v9 = *(double *)(a1 + 64);
    double v10 = *(double *)(a1 + 72);
    v11 = (void *)[result searchBarContainerView];
    return (unsigned char *)objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);
  }
  return result;
}

uint64_t __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setNavigationBarHidesCompletelyOffscreen:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _setSearchHidNavigationBar:0];
}

uint64_t __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showBackgroundObscuringView];
}

uint64_t __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTopViewController];
}

uint64_t __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideBackgroundObscuringView];
}

uint64_t __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTopViewController];
}

uint64_t __69___UISearchPresentationController__exciseSearchBarFromCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void **)(a1 + 32) != a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = objc_msgSend(a2, "constraints", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
          if (v9)
          {
            uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v8), "firstItem"), "_referenceView");
            uint64_t v11 = *(void *)(a1 + 32);
            uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "secondItem"), "_referenceView");
            if (v10 != v11)
            {
              uint64_t v13 = *(void *)(a1 + 32);
              goto LABEL_10;
            }
          }
          else
          {
            uint64_t v13 = *(void *)(a1 + 32);
            if (v13)
            {
              uint64_t v12 = 0;
LABEL_10:
              if (v12 != v13) {
                goto LABEL_14;
              }
            }
          }
          v14 = (void *)[*(id *)(*(void *)(a1 + 40) + 368) objectForKey:a2];
          if (!v14)
          {
            v14 = (void *)[MEMORY[0x1E4F1CA48] array];
            [*(id *)(*(void *)(a1 + 40) + 368) setObject:v14 forKey:a2];
          }
          objc_msgSend(v14, "addObject:", objc_msgSend(*(id *)(a1 + 40), "_constraintCopyOfConstraint:replaceItem:withItem:", v9, *(void *)(*(void *)(a1 + 40) + 360), *(void *)(a1 + 32)));
LABEL_14:
          ++v8;
        }
        while (v6 != v8);
        uint64_t v15 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v6 = v15;
      }
      while (v15);
    }
  }
  return 1;
}

uint64_t __117___UISearchPresentationController__updatePresentingViewControllerContentScrollViewWithOffsets_transitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) contentInset];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) contentOffset];
  double v11 = v10;
  double v12 = *(double *)(a1 + 48);
  double v13 = v3 + v12;
  double v15 = v14 - v12;
  objc_msgSend(*(id *)(a1 + 32), "setContentInset:", v13, v5, v7, v9);
  v16 = *(void **)(a1 + 32);
  return objc_msgSend(v16, "setContentOffset:", v11, v15);
}

@end