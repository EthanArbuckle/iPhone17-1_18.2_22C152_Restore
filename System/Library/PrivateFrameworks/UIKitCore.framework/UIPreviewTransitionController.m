@interface UIPreviewTransitionController
@end

@implementation UIPreviewTransitionController

uint64_t __59___UIPreviewTransitionController__animateRevealTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForPresentationPhase:1];
}

uint64_t __59___UIPreviewTransitionController__animateRevealTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _completeAnimationWithPresentationPhase:1 finished:a2];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 transitionWasCancelled] ^ 1;
  return [v3 completeTransition:v4];
}

uint64_t __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForPresentationPhase:2];
}

uint64_t __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeAnimationWithPresentationPhase:2 finished:a2];
}

uint64_t __60___UIPreviewTransitionController__animateDismissTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForPresentationPhase:5];
}

uint64_t __60___UIPreviewTransitionController__animateDismissTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _completeAnimationWithPresentationPhase:5 finished:a2];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 transitionWasCancelled] ^ 1;
  return [v3 completeTransition:v4];
}

uint64_t __59___UIPreviewTransitionController__animateCommitTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _computeAndApplyScrollContentInsetDeltaForViewController:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    int v4 = [v2 _viewControllerUnderlapsStatusBar];
    if (v3)
    {
      uint64_t v5 = 0x8000000000;
      if (!v4) {
        uint64_t v5 = 0;
      }
      v3[47] = v3[47] & 0xFFFFFF7FFFFFFFFFLL | v5;
    }
    v6 = [v3 topViewController];
    [v3 _computeAndApplyScrollContentInsetDeltaForViewController:v6];
  }
  v7 = [*(id *)(a1 + 48) layer];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v15[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v15[5] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v15[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v15[7] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v15[0] = *MEMORY[0x1E4F39B10];
  v15[1] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v15[3] = v11;
  [v7 setSublayerTransform:v15];

  [*(id *)(a1 + 48) setShouldLayoutForCommitPhase:1];
  [*(id *)(a1 + 48) setNeedsLayout];
  [*(id *)(a1 + 48) layoutIfNeeded];
  [*(id *)(a1 + 56) setEffect:0];
  v12 = *(void **)(a1 + 64);
  [*(id *)(a1 + 72) bounds];
  objc_msgSend(v12, "setFrame:");
  v13 = *(void **)(a1 + 80);
  [*(id *)(a1 + 72) bounds];
  return objc_msgSend(v13, "setFrame:");
}

uint64_t __59___UIPreviewTransitionController__animateCommitTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  [*(id *)(a1 + 72) addSubview:*(void *)(a1 + 80)];
  objc_msgSend(*(id *)(a1 + 80), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  [*(id *)(a1 + 88) addSubview:*(void *)(a1 + 96)];
  [*(id *)(a1 + 104) addSubview:*(void *)(a1 + 112)];
  [*(id *)(a1 + 120) _completeAnimationWithPresentationPhase:4 finished:a2];
  int v4 = *(void **)(a1 + 128);
  return [v4 completeTransition:1];
}

void __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2(id *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3;
  v3[3] = &unk_1E52DD450;
  id v2 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v7 = a1[4];
  [v2 dismissViewControllerAnimated:0 completion:v3];
}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  if (v2)
  {
    uint64_t v5 = a1[6];
    return [v3 previewInteractionController:v4 performCommitToViewController:v5];
  }
  else
  {
    uint64_t v8 = a1[6];
    uint64_t v7 = a1[7];
    return [v3 previewInteractionController:v4 performCommitForPreviewViewController:v7 committedViewController:v8];
  }
}

void __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_48(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v7 = v4;
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = v7;
    if (isKindOfClass)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      uint64_t v5 = v7;
    }
  }
}

id __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2_54(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 40) previewInteractionController:*(void *)(a1 + 48) committedViewControllerForPreviewViewController:*(void *)(a1 + 32)];

    id v2 = (id)v3;
  }
  return v2;
}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewInteractionController:*(void *)(a1 + 40) performCommitForPreviewViewController:*(void *)(a1 + 48) committedViewController:*(void *)(a1 + 48)];
}

@end