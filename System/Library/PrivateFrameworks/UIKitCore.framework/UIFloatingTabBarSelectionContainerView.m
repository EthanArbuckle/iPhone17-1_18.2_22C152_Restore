@interface UIFloatingTabBarSelectionContainerView
@end

@implementation UIFloatingTabBarSelectionContainerView

void __57___UIFloatingTabBarSelectionContainerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  uint64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  id v5 = [v2 selectionView];

  [v5 setHidden:v4 != 1];
}

void __57___UIFloatingTabBarSelectionContainerView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  uint64_t v4 = _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);
  [v4 selectionHighlightScale];
  CGFloat v6 = v5;

  v7 = [v2 traitCollection];
  uint64_t v8 = [v7 valueForNSIntegerTrait:objc_opt_class()];

  if (v8)
  {
    CGAffineTransformMakeScale(&v12, v6, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v12.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v12.c = v9;
    *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v10 = [v2 selectionView];
  CGAffineTransform v11 = v12;
  [v10 setTransform:&v11];
}

@end