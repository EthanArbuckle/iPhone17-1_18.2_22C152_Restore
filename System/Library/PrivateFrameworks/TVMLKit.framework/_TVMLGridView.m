@interface _TVMLGridView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)configureForListTemplate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)headerView;
- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4;
- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5;
- (void)setConfigureForListTemplate:(BOOL)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation _TVMLGridView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)_TVMLGridView;
  -[_TVGridView sizeThatFits:](&v14, sel_sizeThatFits_);
  double v7 = v6;
  double v9 = v8;
  v10 = [(_TVMLGridView *)self headerView];

  if (v10)
  {
    -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
    double v9 = v9 + v11;
  }
  double v12 = v7;
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  [(_TVMLGridView *)self contentInset];
  return -[_TVMLGridView rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:](self, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", a4, a3, v7, v8, v9, v10);
}

- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v11 = [(_TVMLGridView *)self collectionViewLayout];
  uint64_t v12 = [(_TVMLGridView *)self numberOfSections];
  double v13 = [(_TVMLGridView *)self delegate];
  objc_super v14 = [v13 indexPathForPreferredFocusedViewInCollectionView:self];

  if (v11)
  {
    [v11 cellMetrics];
    double v15 = *(double *)&v66;
  }
  else
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    double v15 = 0.0;
    long long v66 = 0u;
  }
  [v11 minimumInteritemSpacing];
  double v17 = v16;
  [v11 minimumLineSpacing];
  uint64_t v19 = v18;
  double v20 = a3 - (left + right);
  v51 = a5;
  if (([v11 isHeterogeneous] & 1) != 0 || v15 <= 0.0)
  {
    v25 = [(_TVMLGridView *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    uint64_t v22 = 0;
    uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v26 & 1) != 0 && v12 >= 1)
    {
      uint64_t v27 = 0;
      uint64_t v22 = 0;
      uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v52 = v12;
      do
      {
        uint64_t v28 = [(_TVMLGridView *)self numberOfItemsInSection:v27];
        if (v28 >= 1)
        {
          uint64_t v29 = v28;
          uint64_t v30 = 0;
          double v31 = v20;
          do
          {
            v32 = [MEMORY[0x263F088C8] indexPathForItem:v30 inSection:v27];
            v33 = [(_TVMLGridView *)self delegate];
            [v33 collectionView:self layout:v11 sizeForItemAtIndexPath:v32];
            double v35 = v34;

            if (v31 < fmin(v35, v20))
            {
              ++v22;
              double v31 = v20;
            }
            if (v14 && [v14 section] == v27)
            {
              uint64_t v36 = [v14 item];
              uint64_t v37 = v55;
              if (v30 == v36) {
                uint64_t v37 = v22;
              }
              uint64_t v55 = v37;
            }
            double v31 = v31 - (v17 + v35);

            ++v30;
          }
          while (v29 != v30);
          ++v22;
          uint64_t v12 = v52;
        }
        ++v27;
      }
      while (v27 != v12);
    }
  }
  else if (v12 < 1)
  {
    uint64_t v22 = 0;
    uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = (uint64_t)((v20 + v17) / (fmin(v15, v20) + v17));
    uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v24 = [(_TVMLGridView *)self numberOfItemsInSection:v21];
      if (v14 && v21 == [v14 section] && objc_msgSend(v14, "item") < v24) {
        uint64_t v55 = v22 + ([v14 item] + v23) / v23 - 1;
      }
      v22 += (v23 - 1 + v24) / v23;
      ++v21;
    }
    while (v12 != v21);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  memset(v62, 0, sizeof(v62));
  if (v11) {
    [v11 cellMetrics];
  }
  else {
    memset(v61, 0, sizeof(v61));
  }
  double v38 = TVRowMetricsMakeWithCellMetrics((uint64_t)v61, (uint64_t)v62);
  uint64_t v39 = v22 - 1;
  if (v22 < 1)
  {
    v40 = 0;
  }
  else
  {
    v40 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 2 * v22 - 1, v38);
    uint64_t v41 = 0;
    float64x2_t v53 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&top, 0);
    do
    {
      float64x2_t v42 = *(float64x2_t *)((char *)v62 + 8);
      double v43 = v62[1].f64[1];
      double v45 = *((double *)&v65 + 1);
      double v44 = *(double *)&v65;
      if (v41)
      {
        if (v39 == v41)
        {
          double v43 = bottom + v62[1].f64[1];
          double v45 = fmax(*((double *)&v65 + 1) - bottom, 0.0);
          v42.f64[0] = bottom + v62[0].f64[1];
        }
      }
      else
      {
        float64x2_t v42 = vaddq_f64(v53, *(float64x2_t *)((char *)v62 + 8));
        double v44 = fmax(*(double *)&v65 - top, 0.0);
      }
      uint64_t v56 = *(void *)&v62[0].f64[0];
      *(float64x2_t *)v57 = v42;
      long long v58 = v63;
      long long v59 = v64;
      *(double *)&v57[16] = v43;
      *(double *)&long long v60 = v44;
      *((double *)&v60 + 1) = v45;
      v46 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v56);
      [v40 addObject:v46];

      if (v41 < v39)
      {
        uint64_t v56 = 1;
        *(void *)v57 = v19;
        *(_OWORD *)&v57[8] = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v47 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v56);
        [v40 addObject:v47];
      }
      ++v41;
    }
    while (v22 != v41);
  }
  if (v51)
  {
    if (v55 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = v55;
    }
    int64_t *v51 = v48 + v55;
  }
  v49 = (void *)[v40 copy];

  return v49;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (BOOL)configureForListTemplate
{
  return self->_configureForListTemplate;
}

- (void)setConfigureForListTemplate:(BOOL)a3
{
  self->_configureForListTemplate = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end