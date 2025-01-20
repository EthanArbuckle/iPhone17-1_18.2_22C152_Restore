@interface UIAnimatedTextSpacer
@end

@implementation UIAnimatedTextSpacer

void __63___UIAnimatedTextSpacer_initWithSpringBehavior_delay_duration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 56) presentationValue];
  objc_msgSend(WeakRetained, "_updateAnimationWithPresentationValue:");
}

uint64_t __40___UIAnimatedTextSpacer__startAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setValue:*(double *)(*(void *)(a1 + 32) + 32)];
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __40___UIAnimatedTextSpacer__startAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizeAnimation];
}

uint64_t __40___UIAnimatedTextSpacer__startAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___UIAnimatedTextSpacer_beginExplicitHeightAnimationFromSource_toDestination___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAnimationWithPresentationValue:a2];
}

void __78___UIAnimatedTextSpacer_beginExplicitHeightAnimationFromSource_toDestination___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizeAnimation];
}

@end