@interface UIScrollViewScrollIndicator
@end

@implementation UIScrollViewScrollIndicator

void __56___UIScrollViewScrollIndicator__layoutFillViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if ([*(id *)(a1 + 32) expandedForDirectManipulation])
  {
    v10 = [*(id *)(a1 + 32) _visualStyle];
    int v11 = [v10 doesExpand];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) type];
      v13 = [*(id *)(a1 + 32) _visualStyle];
      [v13 staticDimensionExpandedSize];
      double v15 = v14;

      if (v12 == 1) {
        double v16 = v9;
      }
      else {
        double v16 = v15;
      }
      if (v12 == 1) {
        double v17 = v15;
      }
      else {
        double v17 = v7;
      }
      objc_msgSend(*(id *)(a1 + 32), "_offsetFillViewRectForExpandedState:", v3, v5, v17, v16);
      double v3 = v18;
      double v5 = v19;
      double v7 = v20;
      double v9 = v21;
    }
  }
  if ([*(id *)(a1 + 32) type] == 1) {
    double v22 = v7;
  }
  else {
    double v22 = v9;
  }
  v23 = *(void **)(a1 + 32);
  v24 = [v23 roundedFillView];
  [v24 frame];
  double v26 = v25;
  double v28 = v27;
  if ([v23 type] != 1) {
    double v26 = v28;
  }

  if (v22 != v26)
  {
    if ([*(id *)(a1 + 32) type] == 1) {
      double v29 = v7;
    }
    else {
      double v29 = v9;
    }
    v30 = [*(id *)(a1 + 32) _visualStyle];
    [v30 fillViewCornerRadiusForStaticDimensionSize:v29];
    double v32 = v31;

    v33 = [*(id *)(a1 + 32) roundedFillView];
    v34 = [v33 layer];
    [v34 setCornerRadius:v32];
  }
  id v35 = [*(id *)(a1 + 32) roundedFillView];
  objc_msgSend(v35, "setFrame:", v3, v5, v7, v9);
}

@end