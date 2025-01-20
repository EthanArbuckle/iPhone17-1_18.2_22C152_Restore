@interface UIPreviewInteractionCommitTransition
@end

@implementation UIPreviewInteractionCommitTransition

void __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _preferredTransitionAnimatorForReducedMotion];
  }
  else {
  v4 = [v3 _preferredTransitionAnimator];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_2;
  v16[3] = &unk_1E52DC3F8;
  char v20 = *(unsigned char *)(a1 + 72);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v17 = v5;
  uint64_t v18 = v6;
  id v19 = *(id *)(a1 + 48);
  [v4 addAnimations:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_3;
  v12[3] = &unk_1E5300388;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = *(id *)(a1 + 64);
  [v4 addCompletion:v12];
  [v4 startAnimation];
  if (!*(unsigned char *)(a1 + 72))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_4;
    v10[3] = &unk_1E52D9F70;
    id v11 = *(id *)(a1 + 40);
    id v9 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0x10000 delay:v10 options:0 animations:0.15 completion:0.0];
  }
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    int v2 = *(void **)(a1 + 32);
    return [v2 setAlpha:0.0];
  }
  else
  {
    [*(id *)(a1 + 40) _applyCommitEffectTransformToView:*(void *)(a1 + 32)];
    v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v4 _applyCommitEffectTransformToView:v5];
  }
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 40) setCurrentCommitEffectWindow:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  int v2 = *(void **)(a1 + 32);
  return [v2 setBlurRadius:96.0];
}

void __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_5(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_6;
  v5[3] = &unk_1E52DB330;
  id v7 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:v5];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2, v3, v4);
}

uint64_t __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _endDisablingAnimations];
}

@end