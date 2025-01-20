@interface TVOrganizerView
@end

@implementation TVOrganizerView

double __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectAtIndexedSubscript:0];
  v9 = [MEMORY[0x263EFF9D0] null];
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = [v6 objectAtIndexedSubscript:0];
  }

  v11 = [v6 objectAtIndexedSubscript:1];
  v12 = [MEMORY[0x263EFF9D0] null];
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = [v6 objectAtIndexedSubscript:1];
  }

  v14 = [v6 objectAtIndexedSubscript:2];
  v15 = [MEMORY[0x263EFF9D0] null];
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    v16 = [v6 objectAtIndexedSubscript:2];
  }

  v17 = [v7 objectAtIndexedSubscript:0];
  [v17 doubleValue];
  double v19 = v18;

  v20 = [v7 objectAtIndexedSubscript:1];
  [v20 doubleValue];
  double v22 = v21;

  v23 = [v7 objectAtIndexedSubscript:2];

  [v23 doubleValue];
  double v25 = v24;

  if (v13 && a1 + fmax(v19, v25) * -2.0 >= v22)
  {
    double v28 = floor((a1 - v22) * 0.5);
    v29 = [v13 components];
    v27 = [v29 firstObject];

    v30 = [v13 components];
    v26 = [v30 lastObject];
  }
  else
  {
    v26 = 0;
    v27 = 0;
    if (v19 <= v25) {
      double v28 = a1 - (v22 + v25);
    }
    else {
      double v28 = v19;
    }
  }
  if (v10)
  {
    v31 = [v10 components];
    uint64_t v32 = [v31 firstObject];

    double v28 = 0.0;
    if (!v26)
    {
      v33 = [v10 components];
      v26 = [v33 lastObject];
    }
    v27 = (void *)v32;
  }
  if (v16)
  {
    if (!v27)
    {
      v34 = [v16 components];
      v27 = [v34 firstObject];
    }
    v35 = [v16 components];
    uint64_t v36 = [v35 lastObject];

    v26 = (void *)v36;
  }
  objc_msgSend(v27, "tv_margin");
  double v38 = v28 + v37;
  objc_msgSend(v27, "tv_alignmentInsetsForExpectedWidth:", 0.0);
  double v40 = v38 + v39;
  objc_msgSend(v26, "tv_margin");
  objc_msgSend(v26, "tv_alignmentInsetsForExpectedWidth:", 0.0);

  return v40;
}

void __34___TVOrganizerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = a2;
    [v6 addSubview:v7];
    v9.origin.x = 0.0;
    v9.origin.y = 0.0;
    v9.size.width = a3;
    v9.size.height = a4;
    CGRect v10 = CGRectIntegral(v9);
    objc_msgSend(v7, "setBounds:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  }
}

void __34___TVOrganizerView_layoutSubviews__block_invoke_2(double *a1, void *a2, void *a3, void *a4)
{
  id v25 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v25)
  {
    [v25 center];
    double v10 = v9;
    double v11 = a1[5] + a1[8];
    [v25 bounds];
    objc_msgSend(v25, "setCenter:", v10, v11 + v12 * 0.5);
  }
  if (v7)
  {
    [v7 center];
    double v14 = v13;
    [v25 bounds];
    double v16 = v15;
    [v7 bounds];
    double v18 = v17;
    [v8 bounds];
    double v20 = 0.0;
    if (v18 > a1[13] + fmax(v16, v19) * -2.0) {
      double v20 = (v16 - v19) * 0.5;
    }
    objc_msgSend(v7, "setCenter:", v14, a1[15] + a1[5] + a1[7] * 0.5 + v20);
  }
  if (v8)
  {
    [v8 center];
    double v22 = v21;
    double v23 = a1[5] + a1[7] - a1[10];
    [v8 bounds];
    objc_msgSend(v8, "setCenter:", v22, v23 + v24 * -0.5);
  }
}

void __34___TVOrganizerView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v24 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v24)
  {
    [v24 center];
    double v10 = v9;
    double v11 = *(double *)(a1 + 48) + *(double *)(a1 + 88);
    [v24 bounds];
    objc_msgSend(v24, "setCenter:", v11 + v12 * 0.5, v10);
  }
  if (v7)
  {
    [v7 center];
    double v14 = v13;
    [v7 bounds];
    double v15 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    double v16 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v17 = *(double *)(a1 + 112) + fmax(v15, v16) * -2.0;
    double v18 = (v15 - v16) * 0.5;
    if (v19 <= v17) {
      double v18 = 0.0;
    }
    objc_msgSend(v7, "setCenter:", *(double *)(a1 + 128) + *(double *)(a1 + 48) + *(double *)(a1 + 64) * 0.5 + v18, v14);
  }
  if (v8)
  {
    [v8 center];
    double v21 = v20;
    double v22 = *(double *)(a1 + 48) + *(double *)(a1 + 64) - *(double *)(a1 + 104);
    [v8 bounds];
    objc_msgSend(v8, "setCenter:", v22 + v23 * -0.5, v21);
  }
}

void __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5 && *(unsigned char *)(a1 + 40))
  {
    BOOL v6 = *(unsigned char *)(a1 + 41) == 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke_2;
    v8[3] = &unk_264BA6878;
    id v9 = v3;
    char v10 = *(unsigned char *)(a1 + 41);
    [v5 addCoordinatedAnimationsForAnimation:v6 animations:v8 completion:0];
  }
  else
  {
    double v7 = 1.0;
    if (!*(unsigned char *)(a1 + 41)) {
      double v7 = 0.0;
    }
    [v3 setAlpha:v7];
  }
}

uint64_t __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

@end