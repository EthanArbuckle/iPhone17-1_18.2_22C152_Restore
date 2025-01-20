@interface UIPreviewInteractionPresentationAssistant
@end

@implementation UIPreviewInteractionPresentationAssistant

void __67___UIPreviewInteractionPresentationAssistant_dismissViewController__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationSourcePortalView];
  [v2 _removePropertyAnimationsForLayerKeyPath:@"transform"];

  v3 = [*(id *)(a1 + 32) presentationSourcePortalView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
}

void __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stashedParentViewController];
  [*(id *)(a1 + 32) setStashedParentViewController:0];
  v3 = [*(id *)(a1 + 32) stashedSuperView];
  [*(id *)(a1 + 32) setStashedSuperView:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2;
  v6[3] = &unk_1E52DCB30;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v3;
  id v4 = v3;
  id v5 = v2;
  +[UIViewController _performWithoutDeferringTransitions:v6];
}

uint64_t __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  v3 = [*(id *)(a1 + 32) view];
  [v2 addSubview:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  return [v4 addChildViewController:v5];
}

uint64_t __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)(a1 + 40);
  id v4 = objc_loadWeakRetained(v3);
  uint64_t v5 = [v4 presentedViewController];
  int v6 = [v5 isBeingPresented];

  if (v6)
  {
    id v7 = [WeakRetained presentationSourcePortalView];
  }
  else
  {
    id v8 = objc_loadWeakRetained(v3);
    id v7 = [v8 presentedView];
  }
  return v7;
}

id __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)(a1 + 40);
  id v4 = objc_loadWeakRetained(v3);
  uint64_t v5 = [v4 presentedViewController];
  int v6 = [v5 isBeingPresented];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 presentedView];
  }
  else
  {
    id v8 = [WeakRetained presentationSourcePortalView];
  }

  return v8;
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sourcePreview];
  v3 = [v2 view];

  if (*(unsigned char *)(a1 + 72))
  {
    id v4 = [*(id *)(a1 + 32) highlighter];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) highlighter];
      int v6 = [v5 customBackgroundEffectView];

      [*(id *)(a1 + 40) bounds];
      objc_msgSend(v6, "setFrame:");
      [v6 setAutoresizingMask:18];
      [*(id *)(a1 + 40) insertSubview:v6 atIndex:0];
    }
    [v3 bounds];
    id v7 = (void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "setBounds:");
    id v8 = *(void **)(a1 + 40);
    [v3 center];
    double v10 = v9;
    double v12 = v11;
    v13 = [v3 superview];
    objc_msgSend(v8, "convertPoint:fromView:", v13, v10, v12);
    objc_msgSend(*(id *)(a1 + 48), "setCenter:");

    v14 = [*(id *)(a1 + 32) sourcePreview];
    v15 = [v14 target];
    v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
    }
    v25 = (void *)*v7;
    v27[0] = v28;
    v27[1] = v29;
    v27[2] = v30;
    [v25 setTransform:v27];
  }
  else
  {
    [v3 bounds];
    id v7 = (void *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 56), "setBounds:");
    v17 = *(void **)(a1 + 40);
    [v3 center];
    double v19 = v18;
    double v21 = v20;
    v22 = [v3 superview];
    objc_msgSend(v17, "convertPoint:fromView:", v22, v19, v21);
    objc_msgSend(*(id *)(a1 + 56), "setCenter:");

    v23 = *(void **)(a1 + 56);
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v26[0] = *MEMORY[0x1E4F1DAB8];
    v26[1] = v24;
    v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v23 setTransform:v26];
  }
  [*(id *)(a1 + 40) addSubview:*v7];
  [*(id *)(a1 + 64) prepareTransitionFromView:*(void *)(a1 + 48) toView:*(void *)(a1 + 56) containerView:*(void *)(a1 + 40)];
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performTransitionFromView:*(void *)(a1 + 40) toView:*(void *)(a1 + 48) containerView:*(void *)(a1 + 56)];
  v2 = [*(id *)(a1 + 64) presentationSourcePortalView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v12[0] = *MEMORY[0x1E4F1DAB8];
  v12[1] = v3;
  v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v12];

  id v4 = [*(id *)(a1 + 64) highlighter];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 64) highlighter];
    int v6 = [v5 customBackgroundEffectView];

    id v7 = [*(id *)(a1 + 64) highlighter];
    id v8 = [v7 backgroundEffectApplyBlock];

    if (v8)
    {
      if (*(unsigned char *)(a1 + 72)) {
        double v9 = 1.0;
      }
      else {
        double v9 = 0.0;
      }
      double v10 = [*(id *)(a1 + 64) highlighter];
      double v11 = [v10 backgroundEffectApplyBlock];
      ((void (**)(void, void *, double))v11)[2](v11, v6, v9);
    }
  }
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      double v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = objc_opt_class();
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "%@: animator completion called while _currentContext is nil", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_12;
    }
  }
  else if (!v5)
  {
    double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_5)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v11 = v12;
      int v13 = 138412290;
      uint64_t v14 = objc_opt_class();
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%@: animator completion called while _currentContext is nil", (uint8_t *)&v13, 0xCu);
LABEL_12:
    }
  }
  id v6 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  [*(id *)(a1 + 40) transitionDidEnd:a2 == 0];
  [v6 completeTransition:a2 == 0];
  if (a2 || !*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _postInteractionCleanup];
  }
}

void __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_16(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentation];
  [v1 setPrivatePresentationCompletionBlock:0];

  if ([WeakRetained isAppearing]
    && [WeakRetained[3] isRunning])
  {
    [WeakRetained dismissViewController];
  }
}

uint64_t __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end