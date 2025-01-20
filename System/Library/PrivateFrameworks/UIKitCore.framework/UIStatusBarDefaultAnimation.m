@interface UIStatusBarDefaultAnimation
@end

@implementation UIStatusBarDefaultAnimation

void ___UIStatusBarDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    double v14 = *(double *)(a1 + 104);
LABEL_7:
    double v17 = *(double *)(a1 + 112);
    goto LABEL_8;
  }
  [v7 setAlpha:0.0];
  long long v15 = *(_OWORD *)(a1 + 64);
  v26[0] = *(_OWORD *)(a1 + 48);
  v26[1] = v15;
  v26[2] = *(_OWORD *)(a1 + 80);
  [v7 setTransform:v26];
  uint64_t v16 = 104;
  if (v9 == 1) {
    uint64_t v16 = 96;
  }
  double v14 = *(double *)(a1 + v16);
  if (v9 != 1) {
    goto LABEL_7;
  }
  double v17 = 0.3;
LABEL_8:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___UIStatusBarDefaultAnimation_block_invoke_2;
  v20[3] = &unk_1E5304658;
  id v21 = v7;
  uint64_t v22 = v9;
  long long v18 = *(_OWORD *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 48);
  long long v24 = v18;
  long long v25 = *(_OWORD *)(a1 + 80);
  id v19 = v7;
  +[UIView animateWithDuration:0 delay:v20 options:v8 animations:v14 completion:v17];
}

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  double v4 = 0.0;
  if (*(void *)(v3 + 8) == 1) {
    double v4 = 1.0;
  }
  [v2 setAlpha:v4];
  v5 = (_OWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40) == 1) {
    v5 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  }
  long long v7 = v5[1];
  v9[0] = *v5;
  v9[1] = v7;
  v9[2] = v5[2];
  return [v6 setTransform:v9];
}

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_3(uint64_t a1, void *a2, void *a3)
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

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 region];
  double v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

@end