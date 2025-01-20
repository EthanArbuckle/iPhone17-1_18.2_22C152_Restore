@interface UIStatusBarDualIndicatorItem
@end

@implementation UIStatusBarDualIndicatorItem

void __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (a1[4])
  {
    objc_msgSend(a1[5], "setImage:");
    [a1[6] itemSpacing];
    double v7 = v6;
    v8 = [a1[6] itemSpacingConstraint];
    [v8 setConstant:v7];

    [a1[6] additionRemovalScale];
    CGFloat v10 = v9;
    [a1[6] additionRemovalScale];
    CGAffineTransformMakeScale(&v30, v10, v11);
    id v12 = a1[5];
    CGAffineTransform v29 = v30;
    [v12 setTransform:&v29];
    [a1[5] setAlpha:0.0];
  }
  [a1[6] additionRemovalDuration];
  double v14 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2;
  v25[3] = &unk_1E52DCB30;
  id v26 = a1[4];
  id v15 = a1[5];
  id v16 = a1[6];
  id v27 = v15;
  id v28 = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3;
  v20[3] = &unk_1E52EA120;
  id v21 = a1[5];
  id v17 = a1[4];
  id v18 = a1[6];
  id v22 = v17;
  id v23 = v18;
  id v24 = v5;
  id v19 = v5;
  +[UIView animateWithDuration:v25 animations:v20 completion:v14];
}

uint64_t __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v3 = (id *)(a1 + 40);
    v2 = *(void **)(a1 + 40);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v4;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v2 setTransform:v13];
    double v5 = 1.0;
  }
  else
  {
    [*(id *)(a1 + 48) additionRemovalScale];
    CGFloat v7 = v6;
    [*(id *)(a1 + 48) additionRemovalScale];
    CGAffineTransformMakeScale(&v12, v7, v8);
    double v9 = *(void **)(a1 + 40);
    v3 = (id *)(a1 + 40);
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];
    double v5 = 0.0;
  }
  return [*v3 setAlpha:v5];
}

uint64_t __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
    if (!*(void *)(a1 + 40))
    {
      v3 = [*(id *)(a1 + 48) itemSpacingConstraint];
      [v3 setConstant:0.0];
    }
    long long v4 = *(void **)(a1 + 32);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v7];
    [*(id *)(a1 + 32) setAlpha:1.0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end