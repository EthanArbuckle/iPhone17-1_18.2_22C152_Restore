@interface TVCollectionWrappingView
@end

@implementation TVCollectionWrappingView

uint64_t __50___TVCollectionWrappingView_reevaluateFooterFrame__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v7 = *(void **)(a1 + 32);
  float v8 = *(double *)(a1 + 40) + *(double *)(a1 + 56) * v4;
  double v9 = roundf(v8);
  float v10 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * v6;
  double v11 = roundf(v10);
  return objc_msgSend(v7, "setCenter:", v9, v11);
}

uint64_t __50___TVCollectionWrappingView_reevaluateHeaderFrame__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v7 = *(void **)(a1 + 32);
  float v8 = *(double *)(a1 + 40) + *(double *)(a1 + 56) * v4;
  double v9 = roundf(v8);
  float v10 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * v6;
  double v11 = roundf(v10);
  return objc_msgSend(v7, "setCenter:", v9, v11);
}

uint64_t __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reevaluateHeaderFrame];
}

uint64_t __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reevaluateHeaderFrame];
}

uint64_t __49___TVCollectionWrappingView__updateGradientLayer__block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGColor];
  return [v2 addObject:v3];
}

@end