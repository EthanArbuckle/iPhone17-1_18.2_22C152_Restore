@interface UIAnimatedImageTransitionButtonConfigurationVisualProvider
@end

@implementation UIAnimatedImageTransitionButtonConfigurationVisualProvider

uint64_t __103___UIAnimatedImageTransitionButtonConfigurationVisualProvider__transitioningImageViewForConfiguration___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 88);
  double v3 = *(double *)(a1 + 96);
  double v4 = *(double *)(a1 + 104);
  double v5 = *(double *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, v4, v5);
  v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setCenter:", v2 + v4 * 0.5, v3 + v5 * 0.5);
}

uint64_t __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v8];
  [*(id *)(a1 + 32) setAlpha:1.0];
  CGAffineTransformMakeScale(&v7, 0.3, 0.3);
  double v4 = *(void **)(a1 + 40);
  CGAffineTransform v6 = v7;
  [v4 setTransform:&v6];
  return [*(id *)(a1 + 40) setAlpha:0.0];
}

uint64_t __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    long long v3 = *(void **)(*(void *)(v2 + 40) + 256);
    return [v3 setHidden:0];
  }
  return result;
}

@end