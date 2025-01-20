@interface UIActionSheetCompactPresentationController
@end

@implementation UIActionSheetCompactPresentationController

void __98___UIActionSheetCompactPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 354) = 0;
  [*(id *)(a1 + 32) _layoutViews];
  id v2 = [*(id *)(a1 + 32) presentedViewController];
  [v2 _updateContentOverlayInsetsFromParentIfNecessary];
}

uint64_t __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setShouldAdoptPresentedAppearance:a2];
  [*(id *)(a1 + 32) _applyVisualAffordancesToViews];
  v3 = *(void **)(a1 + 32);
  return [v3 _layoutViews];
}

uint64_t __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75___UIActionSheetCompactPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyVisualAffordancesToViews];
  id v2 = *(void **)(a1 + 32);
  return [v2 _layoutViews];
}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained presentedViewController];
  id v4 = objc_loadWeakRetained(v2);
  v5 = [v4 animationCoordinator];
  v6 = [v5 transitionContext];
  v7 = [v6 _transitionCoordinator];
  objc_msgSend(v3, "viewWillTransitionToSize:withTransitionCoordinator:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layoutViews];
}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAnimationCoordinator:0];
}

uint64_t __55___UIActionSheetCompactPresentationController__dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionSheetCompactPresentationControllerDidDismiss:*(void *)(a1 + 40)];
}

@end