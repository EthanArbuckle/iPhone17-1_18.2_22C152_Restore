@interface UIPreviewTransitionDelegate
@end

@implementation UIPreviewTransitionDelegate

void __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _layoutForRevealTransition];
}

void __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _revealTransitionDidComplete:a2];
}

void __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_3(uint64_t a1)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _layoutForPreviewTransition];
}

void __112___UIPreviewTransitionDelegate_animationControllerForPresentedController_presentingController_sourceController___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _previewTransitionDidComplete:a2];
}

void __74___UIPreviewTransitionDelegate_animationControllerForDismissedController___block_invoke(uint64_t a1)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _layoutForDismissTransition];
}

void __74___UIPreviewTransitionDelegate_animationControllerForDismissedController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _UIGetPreviewPresentationController(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _dismissTransitionDidComplete:a2];
}

@end