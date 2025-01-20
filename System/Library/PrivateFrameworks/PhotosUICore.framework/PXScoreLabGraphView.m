@interface PXScoreLabGraphView
@end

@implementation PXScoreLabGraphView

void __43___PXScoreLabGraphView_loadCorrelationData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 640);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 648) + 16))();

  if (v20) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    ++*(void *)(*(void *)(a1 + 32) + 624);
  }
  else
  {
    [v20 doubleValue];
    double v9 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = *(double *)(v10 + 456);
    if (v11 >= v9) {
      double v11 = v9;
    }
    *(double *)(v10 + 456) = v11;
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = *(double *)(v12 + 464);
    if (v13 < v9) {
      double v13 = v9;
    }
    *(double *)(v12 + 464) = v13;
    [*(id *)(a1 + 40) addObject:v20];
    [v6 doubleValue];
    double v15 = v14;
    uint64_t v16 = *(void *)(a1 + 32);
    double v17 = *(double *)(v16 + 472);
    if (v17 >= v15) {
      double v17 = v15;
    }
    *(double *)(v16 + 472) = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    double v19 = *(double *)(v18 + 480);
    if (v19 < v15) {
      double v19 = v15;
    }
    *(double *)(v18 + 480) = v19;
    [*(id *)(a1 + 48) addObject:v6];
    *(double *)(*(void *)(a1 + 32) + 584) = v9 + *(double *)(*(void *)(a1 + 32) + 584);
    *(double *)(*(void *)(a1 + 32) + 592) = *(double *)(*(void *)(a1 + 32) + 592) + v9 * v9;
    *(double *)(*(void *)(a1 + 32) + 600) = v15 + *(double *)(*(void *)(a1 + 32) + 600);
    *(double *)(*(void *)(a1 + 32) + 608) = *(double *)(*(void *)(a1 + 32) + 608) + v15 * v15;
    *(double *)(*(void *)(a1 + 32) + 616) = *(double *)(*(void *)(a1 + 32) + 616) + v9 * v15;
  }
}

void __44___PXScoreLabGraphView_loadDistributionData__block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v2)
  {
    double v8 = v2;
    [v2 doubleValue];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(double *)(v4 + 456);
    if (v5 >= v3) {
      double v5 = v3;
    }
    *(double *)(v4 + 456) = v5;
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(double *)(v6 + 464);
    if (v7 < v3) {
      double v7 = v3;
    }
    *(double *)(v6 + 464) = v7;
    *(double *)(*(void *)(a1 + 32) + 584) = v3 + *(double *)(*(void *)(a1 + 32) + 584);
    *(double *)(*(void *)(a1 + 32) + 592) = *(double *)(*(void *)(a1 + 32) + 592) + v3 * v3;
    [*(id *)(a1 + 40) addObject:v8];
    v2 = v8;
  }
  else
  {
    ++*(void *)(*(void *)(a1 + 32) + 624);
  }
}

void __34___PXScoreLabGraphView_reloadData__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = WeakRetained[82];
    if (v3 >= 2)
    {
      if (v3 == 2) {
        [WeakRetained loadCorrelationData];
      }
    }
    else
    {
      [WeakRetained loadDistributionData];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34___PXScoreLabGraphView_reloadData__block_invoke_2;
    block[3] = &unk_1E5DD36F8;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __34___PXScoreLabGraphView_reloadData__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsDisplay];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 672));
  [WeakRetained scoreLabGraphViewDidFinishReloading:*(void *)(a1 + 32)];
}

@end