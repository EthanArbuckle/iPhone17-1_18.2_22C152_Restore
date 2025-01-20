@interface UIInteractivePageControlVisualProvider
@end

@implementation UIInteractivePageControlVisualProvider

void __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke_2(uint64_t a1)
{
}

void __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke(uint64_t a1)
{
}

uint64_t __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke(uint64_t a1)
{
  double v2 = (double)*(uint64_t *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) continuousDisplayedPage];
  [v3 setValue:v2];

  v4 = [*(id *)(a1 + 32) indicatorFeed];
  id v17 = [v4 activeIndicatorForPage:*(void *)(a1 + 48)];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) indicatorFeed];
  v6 = [v5 activeIndicatorForPage:*(void *)(a1 + 40)];

  v7 = *(id **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9 <= v8) {
    uint64_t v10 = 2 * (v9 < v8);
  }
  else {
    uint64_t v10 = 1;
  }
  if (v7) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  objc_msgSend(v17, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v7, v9), v11);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v14 = *(id **)(a1 + 32);
  if (v12 <= v13) {
    uint64_t v15 = 2 * (v12 < v13);
  }
  else {
    uint64_t v15 = 1;
  }
  if (v14) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  objc_msgSend(v6, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v14, v12), v16);
}

void __50___UIInteractivePageControlVisualProvider_prepare__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)WeakRetained);
    [WeakRetained[1] setNeedsLayout];
  }
}

uint64_t __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_3(uint64_t result, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setContentTransform:v3];
}

uint64_t __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __68___UIInteractivePageControlVisualProvider_setPage_interactionState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) currentPage];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t result = [*(id *)(a1 + 32) interactionState];
    if (result == *(void *)(a1 + 48))
    {
      v3 = *(void **)(a1 + 32);
      return [v3 setInteractionState:0];
    }
  }
  return result;
}

id *__56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "contentView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v2 setTransform:&v6];

  if (*(unsigned char *)(a1 + 88)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = [*(id *)(a1 + 32) scrubProgress];
  [v4 setValue:v3];

  return -[_UIInteractivePageControlVisualProvider _updateIndicatorMode](*(id **)(a1 + 32));
}

uint64_t __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdatePageIndicatorTintColor];
}

@end