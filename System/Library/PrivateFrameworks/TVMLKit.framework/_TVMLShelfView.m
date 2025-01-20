@interface _TVMLShelfView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)shouldBindRowsTogether;
- (UIEdgeInsets)_selectionMarginsForCell:(id)a3;
- (_TVMLShelfView)init;
- (_TVMLShelfView)initWithCoder:(id)a3;
- (_TVMLShelfView)initWithFrame:(CGRect)a3;
- (_TVMLShelfView)initWithFrame:(CGRect)a3 _shelfViewLayout:(id)a4;
- (_TVMLShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4;
- (id)_rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5 forShowcase:(BOOL)a6;
- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4;
- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5;
- (id)showcaseRowMetricsForExpectedWidth:(double)a3;
- (id)showcaseRowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4;
- (void)layoutSubviews;
- (void)tv_setShowcaseFactor:(double)a3;
@end

@implementation _TVMLShelfView

- (_TVMLShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4
{
  return 0;
}

- (_TVMLShelfView)initWithFrame:(CGRect)a3 _shelfViewLayout:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMLShelfView;
  return -[_TVShelfView initWithFrame:shelfViewLayout:](&v5, sel_initWithFrame_shelfViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TVMLShelfView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVMLShelfView;
  return [(_TVShelfView *)&v4 initWithCoder:a3];
}

- (_TVMLShelfView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_alloc_init(_TVMLShelfViewLayout);
  v9 = -[_TVMLShelfView initWithFrame:_shelfViewLayout:](self, "initWithFrame:_shelfViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVMLShelfView)init
{
  return -[_TVMLShelfView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)tv_setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
  objc_super v5 = [(_TVMLShelfView *)self collectionViewLayout];
  [v5 setShowcaseFactor:a3];

  [(_TVMLShelfView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(_TVMLShelfView *)self contentInset];
  double v4 = v3;
  [(_TVMLShelfView *)self contentOffset];
  if (v5 != -v4) {
    -[_TVMLShelfView setContentOffset:](self, "setContentOffset:");
  }
  v12.receiver = self;
  v12.super_class = (Class)_TVMLShelfView;
  [(_TVMLShelfView *)&v12 layoutSubviews];
  v6 = [(_TVMLShelfView *)self collectionViewLayout];
  [v6 headerAllowance];
  double v8 = v7;

  CGFloat v9 = -(v8 * self->_showcaseFactor);
  v10 = [(_TVMLShelfView *)self layer];
  CATransform3DMakeTranslation(&v11, 0.0, v9, 0.0);
  [v10 setSublayerTransform:&v11];
}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  [(_TVMLShelfView *)self contentInset];
  return -[_TVMLShelfView rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:](self, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", a4, a3, v7, v8, v9, v10);
}

- (id)rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5
{
  return -[_TVMLShelfView _rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:](self, "_rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:", a5, 0, a3, a4.top, a4.left, a4.bottom, a4.right);
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3
{
  [(_TVMLShelfView *)self contentInset];
  return -[_TVMLShelfView showcaseRowMetricsForExpectedWidth:withContentInset:](self, "showcaseRowMetricsForExpectedWidth:withContentInset:", a3, v5, v6, v7, v8);
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4
{
  return -[_TVMLShelfView _rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:](self, "_rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:forShowcase:", 0, 1, a3, a4.top, a4.left, a4.bottom, a4.right);
}

- (id)_rowMetricsForExpectedWidth:(double)a3 withContentInset:(UIEdgeInsets)a4 firstItemRowIndex:(int64_t *)a5 forShowcase:(BOOL)a6
{
  BOOL v6 = a6;
  double bottom = a4.bottom;
  double top = a4.top;
  double v10 = [(_TVShelfView *)self shelfFlowLayout];
  CATransform3D v11 = [v10 contentRowMetricsForShowcase:v6];
  [v10 minimumLineSpacing];
  uint64_t v13 = v12;
  uint64_t v14 = [v10 computedRowCount];
  if (v14 < 1)
  {
    v16 = 0;
  }
  else
  {
    v16 = [MEMORY[0x263EFF980] arrayWithCapacity:2 * v14 - 1];
    uint64_t v17 = 0;
    float64x2_t v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&top, 0);
    long long v15 = 0uLL;
    do
    {
      if (v17)
      {
        *(void *)&v29[0] = 1;
        *((void *)&v29[0] + 1) = v13;
        v29[1] = v15;
        long long v30 = v15;
        long long v31 = v15;
        *(_OWORD *)v32 = v15;
        v18 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", v29);
        [v16 addObject:v18];

        long long v15 = 0uLL;
      }
      long long v31 = v15;
      *(_OWORD *)v32 = v15;
      v29[1] = v15;
      long long v30 = v15;
      v29[0] = v15;
      v19 = [v11 objectAtIndex:v17];
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "tv_rowMetricsValue");
      }
      else
      {
        long long v31 = 0u;
        *(_OWORD *)v32 = 0u;
        long long v30 = 0u;
        memset(v29, 0, sizeof(v29));
      }

      if (!v17)
      {
        *(float64x2_t *)((char *)v29 + 8) = vaddq_f64(v26, *(float64x2_t *)((char *)v29 + 8));
        v32[0] = fmax(v32[0] - top, 0.0);
      }
      if (v14 - 1 == v17)
      {
        *((double *)v29 + 1) = bottom + *((double *)v29 + 1);
        *((double *)&v29[1] + 1) = bottom + *((double *)&v29[1] + 1);
        v32[1] = fmax(v32[1] - bottom, 0.0);
      }
      v28[2] = v30;
      v28[3] = v31;
      v28[4] = *(_OWORD *)v32;
      v28[0] = v29[0];
      v28[1] = v29[1];
      v21 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", v28);
      [v16 addObject:v21];

      ++v17;
      long long v15 = 0uLL;
    }
    while (v14 != v17);
  }
  v22 = [(_TVMLShelfView *)self delegate];
  v23 = [v22 indexPathForPreferredFocusedViewInCollectionView:self];

  if (a5) {
    *a5 = 2 * ([v23 item] % v14);
  }
  v24 = (void *)[v16 copy];

  return v24;
}

- (BOOL)shouldBindRowsTogether
{
  return 1;
}

- (UIEdgeInsets)_selectionMarginsForCell:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_TVMLShelfView;
  [(_TVShelfView *)&v24 _selectionMarginsForCell:v4];
  double v8 = v5;
  double v10 = v9;
  double v11 = v6;
  double v12 = v7;
  if (v9 == *(double *)(MEMORY[0x263F1D1C0] + 8)
    && v5 == *MEMORY[0x263F1D1C0]
    && v7 == *(double *)(MEMORY[0x263F1D1C0] + 24)
    && v6 == *(double *)(MEMORY[0x263F1D1C0] + 16))
  {
    objc_msgSend(v4, "tv_focusMargin");
    double v8 = v16;
    double v10 = v17;
    double v11 = v18;
    double v12 = v19;
  }

  double v20 = v8;
  double v21 = v10;
  double v22 = v11;
  double v23 = v12;
  result.right = v23;
  result.double bottom = v22;
  result.left = v21;
  result.double top = v20;
  return result;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

@end