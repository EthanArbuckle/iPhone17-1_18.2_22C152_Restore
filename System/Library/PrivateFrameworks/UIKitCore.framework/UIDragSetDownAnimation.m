@interface UIDragSetDownAnimation
@end

@implementation UIDragSetDownAnimation

void __53___UIDragSetDownAnimation_updateVisibleDroppedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v7 = [*(id *)(*(void *)(a1 + 40) + 32) _window];
  if (*(void **)(*(void *)(a1 + 40) + 56) != v7)
  {
    [v6 center];
    objc_msgSend(v7, "convertPoint:fromWindow:", *(void *)(*(void *)(a1 + 40) + 56));
    objc_msgSend(v6, "setCenter:");
    objc_msgSend(v7, "convertPoint:fromWindow:", *(void *)(*(void *)(a1 + 40) + 56), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v9 = v8;
    double v11 = v10;
    long long v24 = 0u;
    long long v25 = 0u;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    if (v6)
    {
      objc_msgSend(v6, "velocity3D", 0.0, 0.0);
      double v13 = *((double *)&v24 + 1);
      double v14 = *(double *)&v24;
    }
    objc_msgSend(v7, "convertPoint:fromWindow:", *(void *)(*(void *)(a1 + 40) + 56), v14, v13);
    v23[2] = 0.0;
    v23[3] = 0.0;
    v23[0] = v15 - v9;
    v23[1] = v16 - v11;
    [v6 setVelocity3D:v23];
    long long v21 = 0u;
    long long v22 = 0u;
    double v17 = 0.0;
    if (v6)
    {
      objc_msgSend(v6, "targetVelocity3D", 0.0);
      double v12 = *((double *)&v21 + 1);
      double v17 = *(double *)&v21;
    }
    objc_msgSend(v7, "convertPoint:fromWindow:", *(void *)(*(void *)(a1 + 40) + 56), v17, v12);
    v20[2] = 0.0;
    v20[3] = 0.0;
    v20[0] = v18 - v9;
    v20[1] = v19 - v11;
    [v6 setTargetVelocity3D:v20];
  }
  [v5 updateDroppedItem:v6];
}

void __32___UIDragSetDownAnimation_begin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _allItemAnimationsCompleted];
}

uint64_t __68___UIDragSetDownAnimation_defaultSingleItemAnimationForPlatterView___block_invoke(uint64_t a1)
{
  memset(&v25, 0, sizeof(v25));
  v2 = [*(id *)(a1 + 32) layer];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  v7 = *(void **)(a1 + 32);
  if (v4 == 0.5 && v6 == 0.5)
  {
    if (v7) {
      [v7 transform3D];
    }
    else {
      memset(&a, 0, sizeof(a));
    }
    CATransform3DMakeScale(&b, 1.5, 1.5, 1.5);
    CATransform3DConcat(&v25, &a, &b);
  }
  else
  {
    double v9 = [v7 layer];
    [v9 anchorPoint];
    double v11 = v10 + -0.5;
    [*(id *)(a1 + 32) frame];
    double v12 = v11 * CGRectGetWidth(v26);

    double v13 = [*(id *)(a1 + 32) layer];
    [v13 anchorPoint];
    double v15 = v14 + -0.5;
    [*(id *)(a1 + 32) frame];
    double v16 = v15 * CGRectGetHeight(v27);

    double v17 = *(void **)(a1 + 32);
    if (v17) {
      [v17 transform3D];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    CATransform3DTranslate(&v25, &v24, -v12, -v16, 0.0);
    CATransform3D v22 = v25;
    CATransform3DScale(&v23, &v22, 1.5, 1.5, 1.5);
    CATransform3D v25 = v23;
    CATransform3D v22 = v23;
    CATransform3DTranslate(&v23, &v22, v12, v16, 0.0);
    CATransform3D v25 = v23;
  }
  [*(id *)(a1 + 32) setAlpha:0.0];
  CATransform3D v19 = v25;
  return [*(id *)(a1 + 32) setTransform3D:&v19];
}

uint64_t __67___UIDragSetDownAnimation_defaultMultiItemAnimationForPlatterView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint32_t v2 = arc4random();
  double v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 transform3D];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  CATransform3DMakeScale(&b, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5);
  CATransform3DConcat(&v15, &a, &b);
  double v4 = *(void **)(a1 + 32);
  CATransform3D v12 = v15;
  [v4 setTransform3D:&v12];
  uint32_t v5 = arc4random();
  double v6 = (double)v5 / 4294967300.0 * 30.0 - (1.0 - (double)v5 / 4294967300.0) * 30.0;
  uint32_t v7 = arc4random();
  double v8 = (double)v7 / 4294967300.0 * 30.0 - (1.0 - (double)v7 / 4294967300.0) * 30.0;
  [*(id *)(a1 + 32) center];
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v9 + v6, v10 + v8);
}

uint64_t __62___UIDragSetDownAnimation_defaultDropAnimationForPlatterView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  CATransform3DMakeScale(&v5, 0.33, 0.33, 0.33);
  uint32_t v2 = *(void **)(a1 + 32);
  CATransform3D v4 = v5;
  return [v2 setTransform3D:&v4];
}

@end