@interface UIFloatingTabBarItemView
@end

@implementation UIFloatingTabBarItemView

uint64_t __49___UIFloatingTabBarItemView__createViewHierarchy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateFontAndColors];
}

void __49___UIFloatingTabBarItemView__createViewHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 _wantsBackground] ^ 1;
  id v4 = [v2 backgroundView];

  [v4 setHidden:v3];
}

void __49___UIFloatingTabBarItemView__createViewHierarchy__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 _currentPlatformMetrics];
  [v3 selectionHighlightScale];
  CGFloat v5 = v4;

  v6 = [v2 traitCollection];
  uint64_t v7 = [v6 valueForNSIntegerTrait:objc_opt_class()];

  if (v7)
  {
    CGAffineTransformMakeScale(&v11, v5, v5);
  }
  else
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v8;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v9 = [v2 backgroundView];
  CGAffineTransform v10 = v11;
  [v9 setTransform:&v10];
}

void __49___UIFloatingTabBarItemView__updateFontAndColors__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) imageView];
  [v3 setTintColor:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) titleLabel];
  [v5 setTextColor:v4];
}

@end