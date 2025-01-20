@interface UIBarCustomizationItemReservoirView
@end

@implementation UIBarCustomizationItemReservoirView

void __54___UIBarCustomizationItemReservoirView_initWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 _minimumLineSpacing];
  double v3 = v2;
  v4 = [v5 flowLayout];
  [v4 setMinimumLineSpacing:v3];

  [v5 invalidateLayoutAndForceUpdate:0];
}

uint64_t __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    double v2 = *(void **)(a1 + 32);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v24[0] = *MEMORY[0x1E4F1DAB8];
    long long v13 = v24[0];
    v24[1] = v14;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v12 = v25;
    [v2 setTransform:v24];
    double v3 = [*(id *)(a1 + 32) containerView];
    v23[0] = v13;
    v23[1] = v14;
    v23[2] = v12;
    [v3 setTransform:v23];

    v4 = [*(id *)(a1 + 32) containerView];
    id v5 = v4;
    double v6 = 13.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v22, 0.6, 0.6);
    v7 = *(void **)(a1 + 32);
    CGAffineTransform v21 = v22;
    [v7 setTransform:&v21];
    CGAffineTransformMakeScale(&v20, 0.2, 0.2);
    v8 = [*(id *)(a1 + 32) containerView];
    CGAffineTransform v19 = v20;
    [v8 setTransform:&v19];

    v4 = [*(id *)(a1 + 32) containerView];
    id v5 = v4;
    double v6 = 21.6666667;
  }
  [v4 _setContinuousCornerRadius:v6];

  v9 = [*(id *)(a1 + 32) containerView];
  v10 = v9;
  if (v9)
  {
    [v9 transform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  v11 = [*(id *)(a1 + 32) shadowView];
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  [v11 setTransform:v15];
}

void __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_3(uint64_t a1)
{
  id v2 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
  +[UIView _animateUsingSpringBehavior:v2 tracking:0 animations:*(void *)(a1 + 32) completion:0];
}

uint64_t __48___UIBarCustomizationItemReservoirView_addItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLabelVisible:1];
}

@end