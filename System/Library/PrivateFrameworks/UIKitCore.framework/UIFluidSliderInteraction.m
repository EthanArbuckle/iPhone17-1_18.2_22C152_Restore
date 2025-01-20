@interface UIFluidSliderInteraction
@end

@implementation UIFluidSliderInteraction

void __59___UIFluidSliderInteraction_initWithConfiguration_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _issueUpdate];
}

uint64_t __46___UIFluidSliderInteraction_setConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _normalizedTrackSize];
  double v3 = v2;
  v4 = [*(id *)(a1 + 32) _trackWidth];
  [v4 setValue:v3];

  [*(id *)(a1 + 32) _normalizedTrackSize];
  double v6 = v5;
  v7 = [*(id *)(a1 + 32) _trackLength];
  [v7 setValue:v6];

  v8 = *(void **)(a1 + 32);
  [v8 value];
  return objc_msgSend(v8, "_targetNewValue:");
}

uint64_t __38___UIFluidSliderInteraction_setValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _targetNewValue:*(double *)(a1 + 40)];
}

void __45___UIFluidSliderInteraction__targetNewValue___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _animatedValue];
  [v2 setValue:v1];
}

void __45___UIFluidSliderInteraction__targetNewScale___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _trackScale];
  [v2 setValue:v1];
}

void __59___UIFluidSliderInteraction__cancelDriversExcludingDriver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_drivers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (v7 != *(void **)(a1 + 40)) {
          [v7 cancel];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __49___UIFluidSliderInteraction__animate_withSpring___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  CAFrameRateRange v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048627, v1, *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

@end