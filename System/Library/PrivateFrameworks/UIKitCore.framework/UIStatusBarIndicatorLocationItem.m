@interface UIStatusBarIndicatorLocationItem
@end

@implementation UIStatusBarIndicatorLocationItem

void __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2;
  v15[3] = &unk_1E52D9F70;
  id v16 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3;
  v10[3] = &unk_1E52EA120;
  id v11 = *(id *)(a1 + 32);
  id v12 = v16;
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v7;
  id v8 = v7;
  id v9 = v16;
  +[UIView animateWithDuration:v15 animations:v10 completion:0.166666667];
}

uint64_t __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.66, 0.66);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.25];
}

void __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v9.receiver = *(id *)(a1 + 48);
    v9.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    id v5 = objc_msgSendSuper2(&v9, sel_applyUpdate_toDisplayItem_, v4, v3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4;
    v7[3] = &unk_1E52D9F70;
    id v8 = *(id *)(a1 + 40);
    +[UIView animateWithDuration:v7 animations:*(void *)(a1 + 56) completion:0.166666667];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end