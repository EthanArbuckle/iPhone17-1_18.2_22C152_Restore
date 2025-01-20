@interface UIRapidClickPresentationAssistant
@end

@implementation UIRapidClickPresentationAssistant

void __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke_2;
  v3[3] = &unk_1E52DC3D0;
  char v5 = *(unsigned char *)(a1 + 56);
  v3[4] = *(void *)(a1 + 48);
  id v4 = v1;
  [v4 presentViewController:v2 animated:0 completion:v3];
}

uint64_t __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) _performPresentationAnimationsFromViewController:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareToPresent];
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) present];
}

uint64_t __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) transitionDidEnd:1];
  }
  return result;
}

uint64_t __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke_2;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:v3];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) presentation];
  id v5 = [v1 viewController];

  uint64_t v2 = [v5 presentedViewController];

  if (v2)
  {
    uint64_t v3 = [v5 presentingViewController];

    id v4 = (void *)v3;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [v4 dismissViewControllerAnimated:0 completion:0];
}

uint64_t __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareToDismiss];
}

uint64_t __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (a2)
  {
    id v10 = WeakRetained;
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v6 = [WeakRetained animationWatchdogTimer];
      [v6 invalidate];

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _unlockEnvironment:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _unlockEnvironment:*(void *)(a1 + 40)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
    [*(id *)(a1 + 48) transitionDidEnd:1];
    uint64_t v9 = *(void *)(a1 + 56);
    id v5 = v10;
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
      id v5 = v10;
    }
  }
}

uint64_t __89___UIRapidClickPresentationAssistant__nonAnimatedDismissalWithReason_actions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareToDismiss];
}

void __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke_2;
  v5[3] = &unk_1E52D9F98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _animateDismissalWithReason:9 actions:v5 completion:0];
}

void __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  uint64_t v3 = [*(id *)(a1 + 40) lifecycleCompletion];
  [*(id *)(a1 + 40) setLifecycleCompletion:0];
  uint64_t v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    uint64_t v2 = (void *)v3;
  }
}

uint64_t __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  --*(_DWORD *)(a1[4] + 8);
  id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICMILifecycle", &_UIRapidClickPresentationAssistantKeyboardSuppressionAssertionReason_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSNumber;
    uint64_t v8 = a1[6];
    uint64_t v9 = v6;
    id v10 = [v7 numberWithUnsignedInteger:v8];
    v11 = [NSNumber numberWithBool:a2];
    v12 = [NSNumber numberWithBool:a3];
    int v13 = *(_DWORD *)(a1[4] + 8);
    int v15 = 138413058;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 1024;
    int v22 = v13;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "_animateUsingFluidSpringWithType %@ completion: finished %@, retargeted %@, count: %d", (uint8_t *)&v15, 0x26u);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

@end