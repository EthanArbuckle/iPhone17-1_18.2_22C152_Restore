@interface UIStatusBarDynamicSplitDefaultAnimation
@end

@implementation UIStatusBarDynamicSplitDefaultAnimation

void ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 type];
  v10 = [v7 region];
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (v9 == 2)
  {
    objc_msgSend(v7, "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  }
  else
  {
    [v7 setAlpha:0.0];
    CGAffineTransformMakeScale(&v16, 0.85, 0.85);
    CGAffineTransform v15 = v16;
    [v7 setTransform:&v15];
  }
  if (v9 == 1) {
    double v14 = 0.3;
  }
  else {
    double v14 = 0.0;
  }
  _UIStatusBarDynamicSplitPerformBaseAnimation(v7, v9 == 2, 0, 0, v8, 0.85, 0.25, v14);
}

uint64_t ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 type] == 2)
  {
    v6 = [v5 region];
    int v7 = [v6 isEnabled];

    if (v7)
    {
      [v5 absoluteFrame];
      id v8 = *(void **)(*(void *)(a1 + 32) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      uint64_t v13 = 1;
      [v5 setFloating:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

uint64_t ___UIStatusBarDynamicSplitDefaultAnimation_block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 region];
  v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

@end