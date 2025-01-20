@interface _TVGridViewFlowLayout
- (TVCellMetrics)cellMetrics;
- (_TVGridViewFlowLayout)init;
- (double)expectedLineSpacing;
- (void)setCellMetrics:(TVCellMetrics *)a3;
@end

@implementation _TVGridViewFlowLayout

- (_TVGridViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVGridViewFlowLayout;
  v2 = [(_TVCollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICollectionViewFlowLayout *)v2 setScrollDirection:0];
    [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v3 setMinimumLineSpacing:0.0];
  }
  return v3;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  self->_cellMetrics.cellSize = a3->cellSize;
  long long v4 = *(_OWORD *)&a3->cellInset.bottom;
  long long v6 = *(_OWORD *)&a3->cellPadding.top;
  long long v5 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v4;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v6;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v5;
  long long v7 = *(_OWORD *)&a3->cellMargin.bottom;
  long long v9 = *(_OWORD *)&a3->cellInsetAlt.top;
  long long v8 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v7;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v9;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v8;
  double width = a3->cellSize.width;
  if (a3->cellSize.width == 0.0) {
    double height = a3->cellSize.height;
  }
  else {
    double height = a3->cellSize.width;
  }
  if (height > 2.22044605e-16 && a3->cellSize.height > 2.22044605e-16) {
    -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:");
  }
  [(_TVCollectionViewFlowLayout *)self setHeterogeneous:width == 0.0];
}

- (double)expectedLineSpacing
{
  v21[2] = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(_TVGridViewFlowLayout *)self cellMetrics];
  TVRowMetricsMakeWithCellMetrics((uint64_t)v15, (uint64_t)&v16);
  if (*((double *)&v16 + 1) <= 0.0) {
    return NAN;
  }
  long long v12 = v18;
  long long v13 = v19;
  long long v14 = v20;
  long long v10 = v16;
  long long v11 = v17;
  v2 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v10);
  v21[0] = v2;
  long long v12 = v18;
  long long v13 = v19;
  long long v14 = v20;
  long long v10 = v16;
  long long v11 = v17;
  v3 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v10);
  v21[1] = v3;
  long long v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v5 = +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v4, 0);
  long long v6 = [v5 firstObject];
  long long v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tv_rowMetricsValue");
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }

  double v8 = *((double *)&v10 + 1);
  return v8;
}

- (TVCellMetrics)cellMetrics
{
  long long v3 = *(_OWORD *)&self[4].cellInsetAlt.bottom;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&self[4].cellInsetAlt.top;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&self[4].cellMargin.top;
  long long v4 = *(_OWORD *)&self[4].cellPadding.bottom;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&self[4].cellPadding.top;
  *(_OWORD *)&retstr->cellInset.top = v4;
  long long v5 = *(_OWORD *)&self[4].cellInset.bottom;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&self[4].cellInset.top;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  CGSize cellSize = self[4].cellSize;
  retstr->CGSize cellSize = *(CGSize *)&self[3].cellMargin.bottom;
  *(CGSize *)&retstr->cellPadding.top = cellSize;
  return self;
}

@end