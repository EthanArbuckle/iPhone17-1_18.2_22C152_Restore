@interface UIDatePickerOverlayPresentation
@end

@implementation UIDatePickerOverlayPresentation

uint64_t __64___UIDatePickerOverlayPresentation_presentDatePicker_onDismiss___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_overlayPresentation:", *(void *)(a1 + 40));
    v3 = [*(id *)(a1 + 40) platterView];

    uint64_t v5 = *(void *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    if (v3) {
      [v4 _transitionToDatePicker:v5];
    }
    else {
      [v4 _presentNewDatePicker:v5];
    }
    uint64_t v8 = [*(id *)(a1 + 32) datePickerMode];
    uint64_t v9 = 3;
    if (!v8) {
      uint64_t v9 = 1;
    }
    if (v8 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9;
    }
    [*(id *)(a1 + 40) setActiveMode:v10];
    v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    return [v11 setDismissHandler:v12];
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) overlayPlatterInitialScale];
  double v3 = v2;
  CGAffineTransformMakeScale(&v19, v2, v2);
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CGAffineTransform v18 = v19;
  [v4 setTransform:&v18];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) overlayPlatterInitialHeight];
  double v14 = v13;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  double Height = CGRectGetHeight(v20);
  if (Height >= v14 / v3) {
    double v16 = v14 / v3;
  }
  else {
    double v16 = Height;
  }
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setBounds:", 0.0, 0.0, CGRectGetWidth(v21), v16);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:0.0];
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layoutIfNeeded];
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) removeFromSuperview];
  }
  return result;
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:0.0];
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81___UIDatePickerOverlayPresentation__prepareDatePickerPresentationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentingContainerViewController:0];
  [*(id *)(a1 + 32) activeDatePicker];

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:1.0];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 128);
  long long v6 = *(_OWORD *)(a1 + 112);
  long long v7 = v2;
  long long v8 = *(_OWORD *)(a1 + 144);
  long long v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) contentView];
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setTransform:v5];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) datePickerTransitionAnimation];
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layoutIfNeeded];
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) datePickerTransitionCompletion];
  }
  return result;
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:0.0];
}

void __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_4(uint64_t a1)
{
  +[UIView performWithoutAnimation:*(void *)(a1 + 40)];
  long long v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_5;
  _OWORD v5[3] = &unk_1E52D9900;
  v5[4] = *(void *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_6;
  v3[3] = &unk_1E52D9FE8;
  id v4 = *(id *)(a1 + 48);
  [v2 animateReducedMotionTransitionWithAnimations:v5 completion:v3];
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:1.0];
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIDatePickerOverlayPresentation_animatePresentWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __79___UIDatePickerOverlayPresentation_animateTransitionWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __78___UIDatePickerOverlayPresentation_animateDismissalWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end