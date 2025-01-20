@interface UIContextMenuPresentationAnimation
@end

@implementation UIContextMenuPresentationAnimation

id __72___UIContextMenuPresentationAnimation_initWithUIController_asDismissal___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!a3)
  {
    uint64_t v11 = [WeakRetained _dismissalPreviewForSecondaryItemPreview:v5];
    goto LABEL_5;
  }
  v8 = [WeakRetained stashedDismissalPreview];
  v9 = [v8 view];
  v10 = [v7 _platterView];

  if (v9 != v10)
  {
    uint64_t v11 = [v7 stashedDismissalPreview];
LABEL_5:
    v12 = (void *)v11;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _targetedPreviewForDismissalAnimation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) target];
  uint64_t v3 = [v2 container];
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    if (([*(id *)(a1 + 40) _isDismissingToDrag] & 1) == 0)
    {
      if ([*(id *)(a1 + 40) isSingleItemMenu])
      {
        id v5 = [*(id *)(a1 + 40) expandedLayout];
        uint64_t v6 = [v5 type];

        if (v6 != 3) {
          [*(id *)(a1 + 40) _prepareReparentingAnimationWithDismissalTarget:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        }
      }
      [*(id *)(a1 + 40) _anchorTransitionViewToTargetedPreview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
    [*(id *)(a1 + 48) setCollapsedPreview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  [*(id *)(a1 + 48) setNeedsLayout];
  v7 = *(void **)(a1 + 48);
  return [v7 layoutIfNeeded];
}

uint64_t __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) scrollToFirstSignificantAction];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_4(uint64_t a1, double a2)
{
  double v2 = 0.1;
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.5;
  }
  if (v2 < a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setAccessoryAnimationBlock:0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_5;
    v5[3] = &unk_1E52D9FC0;
    v5[4] = WeakRetained;
    char v6 = *(unsigned char *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_5(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_accessoryViews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setVisible:*(unsigned __int8 *)(a1 + 40) animated:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __56___UIContextMenuPresentationAnimation_performTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actuallyPerformTransition];
}

uint64_t __79___UIContextMenuPresentationAnimation__performReduceMotionAppearanceTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id __82___UIContextMenuPresentationAnimation__performReduceMotionDisappearanceTransition__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _targetedPreviewForDismissalAnimation];
}

uint64_t __73___UIContextMenuPresentationAnimation__prepareOverallAnimationCompletion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  double v2 = *(void **)(a1 + 56);
  return [v2 removeFromSuperview];
}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained animationProgress];
  [v1 presentationValue];
  double v3 = v2;

  uint64_t v4 = [WeakRetained reparentingAnimationBlock];

  if (v4)
  {
    uint64_t v5 = [WeakRetained reparentingAnimationBlock];
    v5[2](v3);
  }
  uint64_t v6 = [WeakRetained accessoryAnimationBlock];

  if (v6)
  {
    long long v7 = [WeakRetained accessoryAnimationBlock];
    v7[2](v3);
  }
}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _shouldAnimateBackgroundEffects]) {
    objc_msgSend(WeakRetained, "_setBackgroundVisible:", objc_msgSend(WeakRetained, "isDismissTransition") ^ 1);
  }
}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained uiController];
  double v2 = [v1 backgroundViewAnimationProgress];
  [v2 presentationValue];
  double v4 = v3;

  objc_msgSend(WeakRetained, "_presentation_applyBackgroundEffectWithProgress:", v4);
}

void __87___UIContextMenuPresentationAnimation__prepareReparentingAnimationWithDismissalTarget___block_invoke(id *a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  double v4 = [WeakRetained reparentingPortalView];
  if (a2 >= 0.5)
  {
    double v5 = fmax(fmin(a2 + -0.5 + a2 + -0.5, 1.0), 0.0);
    uint64_t v6 = [NSNumber numberWithDouble:1.0 - v5 + v5 * 0.0];
    [v4 _setPresentationValue:v6 forKey:@"opacity"];
    [a1[4] _setPresentationValue:v6 forKey:@"filters.opacityPair.inputAmount"];
  }
  long long v7 = [a1[5] overridePositionTrackingView];
  if (v7)
  {
    long long v8 = [a1[6] superview];
    [a1[6] center];
    objc_msgSend(v8, "convertPoint:toView:", v7);
    double v10 = v9;
    double v12 = v11;

    v13 = [a1[6] superview];
    objc_msgSend(v7, "convertPoint:toView:", v13, v10, v12);
    double v15 = v14;
    double v17 = v16;

    id v18 = a1[6];
    v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v17);
    [v18 _setPresentationValue:v19 forKey:@"position"];
  }
}

@end