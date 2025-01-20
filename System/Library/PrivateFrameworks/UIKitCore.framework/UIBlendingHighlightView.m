@interface UIBlendingHighlightView
@end

@implementation UIBlendingHighlightView

uint64_t __42___UIBlendingHighlightView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void __42___UIBlendingHighlightView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _currentScreenScale];
  UIRoundToViewScale(*(void **)(a1 + 32));
  double v6 = v5;
  id v7 = [v4 layer];

  [v7 setBorderWidth:v6];
}

void __44___UIBlendingHighlightView_setCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 layer];
  [v3 setCornerRadius:*(double *)(a1 + 32)];
}

uint64_t __55___UIBlendingHighlightView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setContinuousCornerRadius:*(double *)(a1 + 32)];
}

void __53___UIBlendingHighlightView_setRoundedCornerPosition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 layer];
  [v3 setMaskedCorners:*(void *)(a1 + 32)];
}

@end