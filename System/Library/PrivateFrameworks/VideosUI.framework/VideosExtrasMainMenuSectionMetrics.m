@interface VideosExtrasMainMenuSectionMetrics
- (CGSize)_horizontalFittingSizeForFontDescriptor:(id)a3 gutterSize:(double)a4 itemCount:(int64_t)a5 itemSizes:(CGSize *)a6;
- (CGSize)sizeForCellAtIndex:(int64_t)a3;
- (CGSize)totalFittingSize;
- (UIFontDescriptor)desiredFontDescriptor;
- (UIFontDescriptor)fittingFontDescriptor;
- (UIFontDescriptor)minimumFontDescriptor;
- (VideosExtrasMainMenuSectionMetricsDataSource)dataSource;
- (double)desiredCellSpacing;
- (double)desiredWidth;
- (double)fittingCellSpacing;
- (double)minimumCellSpacing;
- (void)_recalculateSizes;
- (void)_setNeedsUpdate;
- (void)_updateAllMetrics;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setDesiredCellSpacing:(double)a3;
- (void)setDesiredFontDescriptor:(id)a3;
- (void)setDesiredWidth:(double)a3;
- (void)setFittingWidth:(double)a3;
- (void)setMinimumCellSpacing:(double)a3;
- (void)setMinimumFontDescriptor:(id)a3;
- (void)updateSizes;
@end

@implementation VideosExtrasMainMenuSectionMetrics

- (void)dealloc
{
  calculatedSizes = self->_calculatedSizes;
  if (calculatedSizes) {
    free(calculatedSizes);
  }
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasMainMenuSectionMetrics;
  [(VideosExtrasMainMenuSectionMetrics *)&v4 dealloc];
}

- (void)_recalculateSizes
{
  calculatedSizes = self->_calculatedSizes;
  if (calculatedSizes) {
    free(calculatedSizes);
  }
  objc_super v4 = [(VideosExtrasMainMenuSectionMetrics *)self dataSource];
  self->_itemCount = [v4 numberOfItemsForSectionMetrics:self];

  self->_calculatedSizes = (CGSize *)malloc_type_malloc(16 * self->_itemCount, 0x1000040451B5BE8uLL);
  [(VideosExtrasMainMenuSectionMetrics *)self _updateAllMetrics];
}

- (void)_setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
    v5 = obj;
  }
}

- (void)setDesiredFontDescriptor:(id)a3
{
  v5 = (UIFontDescriptor *)a3;
  if (self->_desiredFontDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_desiredFontDescriptor, a3);
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
    v5 = v6;
  }
}

- (void)setMinimumFontDescriptor:(id)a3
{
  v5 = (UIFontDescriptor *)a3;
  if (self->_minimumFontDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_minimumFontDescriptor, a3);
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
    v5 = v6;
  }
}

- (void)setDesiredCellSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_desiredCellSpacing) >= 0.00000011920929)
  {
    self->_desiredCellSpacing = a3;
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
  }
}

- (void)setMinimumCellSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_minimumCellSpacing) >= 0.00000011920929)
  {
    self->_minimumCellSpacing = a3;
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
  }
}

- (void)setFittingWidth:(double)a3
{
  if (vabdd_f64(a3, self->_fittingWidth) >= 0.00000011920929)
  {
    self->_fittingWidth = a3;
    [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
  }
}

- (CGSize)sizeForCellAtIndex:(int64_t)a3
{
  if (a3 < 0 || self->_itemCount <= a3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8] format:&stru_1F3E921E0];
    v3 = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  else
  {
    v3 = &self->_calculatedSizes[a3];
  }
  double width = v3->width;
  double height = v3->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updateSizes
{
  [(VideosExtrasMainMenuSectionMetrics *)self _setNeedsUpdate];
  [(VideosExtrasMainMenuSectionMetrics *)self _recalculateSizes];
}

- (void)_updateAllMetrics
{
  [(VideosExtrasMainMenuSectionMetrics *)self desiredCellSpacing];
  double minimumCellSpacing = v3;
  double desiredWidth = self->_desiredWidth;
  v6 = [(VideosExtrasMainMenuSectionMetrics *)self desiredFontDescriptor];
  int64_t itemCount = self->_itemCount;
  calculatedSizes = self->_calculatedSizes;
  [(VideosExtrasMainMenuSectionMetrics *)self _horizontalFittingSizeForFontDescriptor:v6 gutterSize:itemCount itemCount:calculatedSizes itemSizes:minimumCellSpacing];
  if (v9 <= desiredWidth
    || (double minimumCellSpacing = self->_minimumCellSpacing,
        [(VideosExtrasMainMenuSectionMetrics *)self _horizontalFittingSizeForFontDescriptor:v6 gutterSize:itemCount itemCount:calculatedSizes itemSizes:minimumCellSpacing], v9 <= desiredWidth))
  {
    self->_totalFittingSize.double width = v9;
    self->_totalFittingSize.double height = v10;
    self->_fittingCellSpacing = minimumCellSpacing;
    v14 = v6;
  }
  else
  {
    v11 = self->_minimumFontDescriptor;

    [(VideosExtrasMainMenuSectionMetrics *)self _horizontalFittingSizeForFontDescriptor:v11 gutterSize:itemCount itemCount:calculatedSizes itemSizes:minimumCellSpacing];
    self->_totalFittingSize.double width = v12;
    self->_totalFittingSize.double height = v13;
    self->_fittingCellSpacing = minimumCellSpacing;
    v14 = v11;
  }
  fittingFontDescriptor = self->_fittingFontDescriptor;
  v16 = v14;
  self->_fittingFontDescriptor = v14;
}

- (CGSize)_horizontalFittingSizeForFontDescriptor:(id)a3 gutterSize:(double)a4 itemCount:(int64_t)a5 itemSizes:(CGSize *)a6
{
  id v10 = a3;
  double v12 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  CGFloat v13 = [(VideosExtrasMainMenuSectionMetrics *)self dataSource];
  if (a5 >= 1)
  {
    uint64_t v14 = 0;
    p_double height = &a6->height;
    do
    {
      [v13 sectionMetrics:self sizeForItemAtIndex:v14 withFontDescriptor:v10];
      if (v17 > v11) {
        double v11 = v17;
      }
      double v12 = v12 + v16;
      *(p_height - 1) = v16;
      *p_double height = v17;
      ++v14;
      p_height += 2;
    }
    while (a5 != v14);
  }
  if (a5 <= 0) {
    double v18 = v12;
  }
  else {
    double v18 = v12 + a4 * (double)(a5 - 1);
  }

  double v19 = v18;
  double v20 = v11;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (VideosExtrasMainMenuSectionMetricsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (VideosExtrasMainMenuSectionMetricsDataSource *)WeakRetained;
}

- (UIFontDescriptor)desiredFontDescriptor
{
  return self->_desiredFontDescriptor;
}

- (UIFontDescriptor)minimumFontDescriptor
{
  return self->_minimumFontDescriptor;
}

- (double)desiredCellSpacing
{
  return self->_desiredCellSpacing;
}

- (double)minimumCellSpacing
{
  return self->_minimumCellSpacing;
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_double desiredWidth = a3;
}

- (UIFontDescriptor)fittingFontDescriptor
{
  return self->_fittingFontDescriptor;
}

- (double)fittingCellSpacing
{
  return self->_fittingCellSpacing;
}

- (CGSize)totalFittingSize
{
  double width = self->_totalFittingSize.width;
  double height = self->_totalFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fittingFontDescriptor, 0);
  objc_storeStrong((id *)&self->_minimumFontDescriptor, 0);
  objc_storeStrong((id *)&self->_desiredFontDescriptor, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end