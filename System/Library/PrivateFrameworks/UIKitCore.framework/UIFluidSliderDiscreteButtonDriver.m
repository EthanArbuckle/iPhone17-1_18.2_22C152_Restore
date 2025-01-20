@interface UIFluidSliderDiscreteButtonDriver
@end

@implementation UIFluidSliderDiscreteButtonDriver

void __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _pressedButton])
  {
    [WeakRetained _incrementValue];
    objc_msgSend(WeakRetained, "set_isRepeating:", 1);
  }
}

void __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _releaseCurrentlyPressedButton];
}

uint64_t __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke_2;
  v2[3] = &unk_1E53058A0;
  v2[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048627, v2, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) drivable];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  uint64_t v6 = *(void *)(a1 + 72);
  [v2 fluidSliderDriver:v3 didGenerateUpdate:v5];
}

@end