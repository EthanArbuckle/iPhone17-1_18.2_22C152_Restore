@interface UIScrollViewGradientMaskView
@end

@implementation UIScrollViewGradientMaskView

void __107___UIScrollViewGradientMaskView_updateWithFrame_gradientStartInsets_gradientEndInsets_gradientIntensities___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) gradientDirection];
  v3 = [*(id *)(a1 + 32) gradientLayer];
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setStartPoint:", 0.0, 0.5);

    v5 = [*(id *)(a1 + 32) gradientLayer];
    v6 = v5;
    double v7 = 1.0;
    double v8 = 0.5;
  }
  else
  {
    objc_msgSend(v3, "setStartPoint:", 0.5, 0.0);

    v5 = [*(id *)(a1 + 32) gradientLayer];
    v6 = v5;
    double v7 = 0.5;
    double v8 = 1.0;
  }
  objc_msgSend(v5, "setEndPoint:", v7, v8);

  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [*(id *)(a1 + 32) gradientLayer];
  [v10 setColors:v9];

  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 32) gradientLayer];
  [v12 setLocations:v11];
}

@end