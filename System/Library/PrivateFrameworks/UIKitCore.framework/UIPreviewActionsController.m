@interface UIPreviewActionsController
@end

@implementation UIPreviewActionsController

void __88___UIPreviewActionsController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained _presentSubactionsForActionGroup:v4];
  }
  else {
    [WeakRetained _dismissWithAction:v4];
  }
}

uint64_t __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  v7 = *(void **)(a1 + 40);
  return objc_msgSend(v7, "setCenter:", v5, v6);
}

void __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 150000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_3;
  v4[3] = &unk_1E52D9F98;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

void __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideChromeAndSetAffordanceHidden:1];
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) quickAction];
  [v4 previewActionsController:v2 didCompleteWithSelectedAction:v3];
}

uint64_t __50___UIPreviewActionsController__dismissWithAction___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  v7 = [*(id *)(a1 + 32) previewActionsView];
  objc_msgSend(v7, "setCenter:", v5, v6);

  v8 = *(void **)(a1 + 32);
  return [v8 _setAffordanceAlpha:1 withDuration:0.0 hideOnCompletion:0.1];
}

void __50___UIPreviewActionsController__dismissWithAction___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideChromeAndSetAffordanceHidden:1];
  double v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "previewActionsController:didCompleteWithSelectedAction:", v3);
  }
  else {
    [v2 didDismissPreviewActionsController:v3];
  }
}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPreviewActionsView:*(void *)(a1 + 32)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_5;
  v3[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 40);
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) _configurePlatterDynamicsController];
  double v2 = [*(id *)(a1 + 40) platterDynamicsController];
  [v2 _beginInYLockedStatePresented];

  id v4 = [*(id *)(a1 + 40) previewActionsView];
  id v3 = [v4 window];
  [v3 setUserInteractionEnabled:1];
}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_6(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_7;
  v3[3] = &unk_1E52DB220;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  +[UIView animateKeyframesWithDuration:0 delay:v3 options:0 animations:v2 completion:0.0];
}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_7(void *a1)
{
  +[UIView addKeyframeWithRelativeStartTime:a1[4] relativeDuration:0.0 animations:1.0];
  +[UIView addKeyframeWithRelativeStartTime:a1[5] relativeDuration:0.0 animations:0.5];
  uint64_t v2 = a1[6];
  return +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.5 animations:0.5];
}

void __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) affordanceView];
  [v2 setAlpha:v1];
}

void __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) affordanceView];
    [v1 setHidden:1];
  }
}

@end