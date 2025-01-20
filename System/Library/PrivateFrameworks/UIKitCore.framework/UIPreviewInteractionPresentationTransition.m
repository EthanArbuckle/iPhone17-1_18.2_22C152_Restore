@interface UIPreviewInteractionPresentationTransition
@end

@implementation UIPreviewInteractionPresentationTransition

uint64_t __65___UIPreviewInteractionPresentationTransition_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2 == 0];
}

uint64_t __74___UIPreviewInteractionPresentationTransition_startInteractiveTransition___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[34]) {
    uint64_t result = [v2 _performCancelTransition];
  }
  else {
    uint64_t result = [v2 _performFinishTransition];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
  return result;
}

void __68___UIPreviewInteractionPresentationTransition__newPushDecayAnimator__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _previewPresentationControllerForTransitionContext:*(void *)(*(void *)(a1 + 32) + 8)];
  v2 = [v4 presentationContainerEffectView];
  v3 = [v2 contentView];

  [*(id *)(a1 + 32) _applyPushDecayEffectTransformToView:v3];
}

@end