@interface PUVideoHighlightStripView
@end

@implementation PUVideoHighlightStripView

uint64_t __49___PUVideoHighlightStripView__updateBarsExpanded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v3 = *(void *)(a1 + 32) == a3;
  }
  else {
    BOOL v3 = 0;
  }
  return [a2 setExpanded:v3 animated:1];
}

void __44___PUVideoHighlightStripView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setBackgroundColor:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) count] <= a3)
  {
    [v5 setHidden:1];
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0, *(double *)(a1 + 48));
    memset(v23, 0, sizeof(v23));
    long long v22 = 0u;
    v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    v7 = v6;
    if (v6)
    {
      [v6 CMTimeRangeValue];
    }
    else
    {
      memset(v23, 0, sizeof(v23));
      long long v22 = 0u;
    }

    double v8 = *(double *)(a1 + 88);
    *(_OWORD *)&v21.value = v22;
    v21.epoch = *(void *)&v23[0];
    double v9 = v8 * CMTimeGetSeconds(&v21);
    double v10 = *(double *)(a1 + 48);
    double v11 = *(double *)(a1 + 88);
    CMTime v21 = *(CMTime *)((char *)v23 + 8);
    double v12 = v9 / v10;
    double width = v11 * CMTimeGetSeconds(&v21) / *(double *)(a1 + 48);
    double y = CGRectGetMaxY(*(CGRect *)(a1 + 56)) + -2.0;
    if (width >= 2.0)
    {
      double height = 2.0;
    }
    else
    {
      v24.size.double height = 2.0;
      v24.origin.double x = v12;
      v24.origin.double y = y;
      v24.size.double width = width;
      CGRect v25 = CGRectInset(v24, (2.0 - width) * -0.5, 0.0);
      double y = v25.origin.y;
      double width = v25.size.width;
      double height = v25.size.height;
      double v12 = fmax(v25.origin.x, 0.0);
      double v16 = CGRectGetMaxX(*(CGRect *)(a1 + 56)) - v25.size.width;
      if (v16 < v12) {
        double v12 = v16;
      }
    }
    v26.origin.double x = v12;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGRect v27 = CGRectIntersection(v26, *(CGRect *)(a1 + 56));
    double x = v27.origin.x;
    double v18 = v27.origin.y;
    double v19 = v27.size.width;
    double v20 = v27.size.height;
    CGRectGetMinX(v27);
    CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v28.origin.double x = x;
    v28.origin.double y = v18;
    v28.size.double width = v19;
    v28.size.double height = v20;
    CGRectGetMaxX(v28);
    PXEdgeInsetsMake();
    objc_msgSend(v5, "setExpandedOutsets:");
    [v5 setHighlightColor:*(void *)(a1 + 32)];
    objc_msgSend(v5, "setFrame:", x, v18, v19, v20);
  }
}

void __58___PUVideoHighlightStripView__updateCurrentTimeRangeIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = v7;
  memset(&v11, 0, sizeof(v11));
  if (v7) {
    [v7 CMTimeRangeValue];
  }
  CMTimeRange range = v11;
  CMTime v9 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v9))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

@end