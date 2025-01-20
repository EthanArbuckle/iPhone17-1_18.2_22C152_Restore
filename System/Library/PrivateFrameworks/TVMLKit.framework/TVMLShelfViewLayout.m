@interface TVMLShelfViewLayout
@end

@implementation TVMLShelfViewLayout

void __74___TVMLShelfViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = (void *)MEMORY[0x263F08D40];
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    [v5 cellMetrics];
    double v8 = *((double *)&v24 + 1);
    double v7 = *(double *)&v24;
    double v10 = *((double *)&v25 + 1);
    double v9 = *(double *)&v25;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
    v23[8] = 0u;
  }
  v11 = objc_msgSend(v4, "valueWithUIEdgeInsets:", v7, v8, v9, v10);
  [v6 setValue:v11 forTVViewStyle:@"padding"];

  uint64_t v12 = *(void *)(a1 + 32);
  [*(id *)(a1 + 48) size];
  +[_TVLockupFactory updateViewLayoutForCell:forSize:](_TVLockupFactory, "updateViewLayoutForCell:forSize:", v12);
  v13 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) center];
  objc_msgSend(v13, "setCenter:");
  [*(id *)(a1 + 32) bounds];
  double v15 = v14;
  double v17 = v16;
  [*(id *)(a1 + 48) size];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v15, v17, v18, v19);
  v20 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) alpha];
  objc_msgSend(v20, "setAlpha:");
  v21 = [*(id *)(a1 + 32) layer];
  v22 = *(void **)(a1 + 48);
  if (v22) {
    [v22 transform3D];
  }
  else {
    memset(v23, 0, 128);
  }
  [v21 setTransform:v23];

  if (v3) {
    v3[2](v3, 1);
  }
}

@end