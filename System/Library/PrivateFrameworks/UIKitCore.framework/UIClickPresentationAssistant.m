@interface UIClickPresentationAssistant
@end

@implementation UIClickPresentationAssistant

uint64_t __79___UIClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __53___UIClickPresentationAssistant__animatePresentation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sourcePreview];
  v3 = [v2 view];

  [v3 bounds];
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  v4 = *(void **)(a1 + 48);
  [v3 center];
  double v6 = v5;
  double v8 = v7;
  v9 = [v3 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");

  v10 = [*(id *)(a1 + 32) sourcePreview];
  v11 = [v10 target];
  v12 = v11;
  if (v11)
  {
    [v11 transform];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }
  v13 = *(void **)(a1 + 40);
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  [v13 setTransform:v14];

  [*(id *)(a1 + 48) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) prepareTransitionFromView:*(void *)(a1 + 40) toView:*(void *)(a1 + 64) containerView:*(void *)(a1 + 48)];
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationSourcePortalView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  return [*(id *)(a1 + 40) performTransitionFromView:*(void *)(a1 + 48) toView:*(void *)(a1 + 56) containerView:*(void *)(a1 + 64)];
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_3(uint64_t a1)
{
  return handleEvent(stateMachineSpec_4, *(void *)(*(void *)(a1 + 32) + 16), 1, *(void *)(a1 + 32), (uint64_t *)(*(void *)(a1 + 32) + 16));
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_4(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentationSourcePortalView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setPresentationSourcePortalView:0];
  long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sourcePreview];
  long long v3 = [v2 view];

  [v3 bounds];
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  v4 = *(void **)(a1 + 48);
  [v3 center];
  double v6 = v5;
  double v8 = v7;
  v9 = [v3 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");

  v10 = *(void **)(a1 + 40);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v12[0] = *MEMORY[0x1E4F1DAB8];
  v12[1] = v11;
  v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v10 setTransform:v12];
  [*(id *)(a1 + 48) addSubview:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 56) prepareTransitionFromView:*(void *)(a1 + 64) toView:*(void *)(a1 + 40) containerView:*(void *)(a1 + 48)];
  }
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentationSourcePortalView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  return [*(id *)(a1 + 40) performTransitionFromView:*(void *)(a1 + 48) toView:*(void *)(a1 + 56) containerView:*(void *)(a1 + 64)];
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return handleEvent(stateMachineSpec_4, *(void *)(v2 + 16), 3, (uint64_t)&v2, (uint64_t *)(v2 + 16));
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stashedParentViewController];
  [*(id *)(a1 + 32) setStashedParentViewController:0];
  char v3 = [*(id *)(a1 + 32) stashedSuperView];
  [*(id *)(a1 + 32) setStashedSuperView:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2;
  v6[3] = &unk_1E52DCB30;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v3;
  id v4 = v3;
  id v5 = v2;
  +[UIViewController _performWithoutDeferringTransitions:v6];
}

uint64_t __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
  char v3 = [*(id *)(a1 + 32) view];
  [v2 addSubview:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  return [v4 addChildViewController:v5];
}

uint64_t __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained presentation];
  char v3 = [v2 customContainerView];

  return v3;
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained presentedViewController];
  int v5 = [v4 isBeingPresented];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 presentationSourcePortalView];
  }
  else
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 presentedView];
  id v7 = };

  return v7;
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained presentedViewController];
  int v5 = [v4 isBeingPresented];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 presentedView];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 presentationSourcePortalView];
  id v7 = };

  return v7;
}

void __51___UIClickPresentationAssistant_animateTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
  id v9 = v7;

  v10 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  [v6 transitionDidEnd:a3];
  [*(id *)(a1 + 32) completeTransition:a3];
}

@end