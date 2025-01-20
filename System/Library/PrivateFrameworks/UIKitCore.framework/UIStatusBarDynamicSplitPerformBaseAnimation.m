@interface UIStatusBarDynamicSplitPerformBaseAnimation
@end

@implementation UIStatusBarDynamicSplitPerformBaseAnimation

uint64_t ___UIStatusBarDynamicSplitPerformBaseAnimation_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = *(unsigned __int8 *)(a1 + 49);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v3)
    {
      [v4 setDynamicHidingAlpha:0.0];
      CGAffineTransformMakeScale(&v19, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
      v5 = *(void **)(a1 + 32);
      CGAffineTransform v18 = v19;
      v6 = &v18;
      return [v5 setDynamicHidingTransform:v6];
    }
    [v4 setAlpha:0.0];
    CGAffineTransformMakeScale(&v17, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
    v9 = *(void **)(a1 + 32);
    CGAffineTransform v16 = v17;
    v10 = &v16;
  }
  else
  {
    if (v3)
    {
      [v4 setDynamicHidingAlpha:1.0];
      v5 = *(void **)(a1 + 32);
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v15[0] = *MEMORY[0x1E4F1DAB8];
      v15[1] = v7;
      v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v6 = (CGAffineTransform *)v15;
      return [v5 setDynamicHidingTransform:v6];
    }
    [v4 setAlpha:1.0];
    v9 = *(void **)(a1 + 32);
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v12 = *MEMORY[0x1E4F1DAB8];
    long long v13 = v11;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v10 = (CGAffineTransform *)&v12;
  }
  return objc_msgSend(v9, "setTransform:", v10, v12, v13, v14);
}

@end