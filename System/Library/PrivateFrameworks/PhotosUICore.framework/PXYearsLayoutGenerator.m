@interface PXYearsLayoutGenerator
- (int64_t)presentedNumberOfColumns;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4;
@end

@implementation PXYearsLayoutGenerator

- (int64_t)presentedNumberOfColumns
{
  return self->_presentedNumberOfColumns;
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4
{
  uint64_t v7 = [(PXYearsLayoutGenerator *)self itemCount];
  id v41 = +[PXCuratedLibrarySettings sharedInstance];
  v8 = [(PXYearsLayoutGenerator *)self metrics];
  [v8 referenceSize];
  double v10 = v9;
  [v8 padding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v8 defaultItemAspectRatio];
  double v20 = v19;
  [v8 interitemSpacing];
  double v22 = v21;
  BOOL v23 = [v8 sizeClass] == 1 && objc_msgSend(v8, "orientation") == 2;
  int64_t v24 = 1;
  if (objc_msgSend(v41, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 1, objc_msgSend(v8, "sizeClass"), objc_msgSend(v8, "orientation"), objc_msgSend(v8, "layoutStyle")))
  {
    if ([v8 orientation] == 2)
    {
      int v25 = [v41 useWideModularLayoutInYears];
      int v26 = v7 < 9 || v23;
      uint64_t v27 = 1;
      if (v7 > 3) {
        uint64_t v27 = 2;
      }
      if (v26 == 1) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 3;
      }
      uint64_t v29 = 4;
      uint64_t v30 = 3;
      uint64_t v31 = 1;
      if (v7 > 1) {
        uint64_t v31 = 2;
      }
      if (v7 <= 7) {
        uint64_t v30 = v31;
      }
      if (v7 <= 11) {
        uint64_t v29 = v30;
      }
      if (v25) {
        int64_t v24 = v29;
      }
      else {
        int64_t v24 = v28;
      }
    }
    else if (v7 <= 5)
    {
      int64_t v24 = 1;
    }
    else
    {
      int64_t v24 = 2;
    }
  }
  if ([v41 forcedNumberOfYearsColumn] >= 1) {
    int64_t v24 = [v41 forcedNumberOfYearsColumn];
  }
  if (v24 <= 1)
  {
    [v8 referenceSize];
    double v34 = fmax((v10 - v14 - v18 + v20 * v33 * -0.8) * 0.5, 0.0);
    double v14 = v14 + v34;
    double v18 = v18 + v34;
  }
  else
  {
    [v8 multiColumnAspectRatio];
    double v20 = v32;
  }
  double v35 = (v22 + v10 - (v18 + v14)) / (double)v24 - v22;
  double v36 = v35 / v20;
  if (v7 <= 0)
  {
    double v38 = v22 + v36;
  }
  else
  {
    uint64_t v37 = (v24 + v7 / v24 * v24 - v7) % v24;
    double v38 = v22 + v36;
    p_size = &a4->size;
    uint64_t v40 = v7;
    do
    {
      p_size[-1].width = v14 + (double)(v37 % v24) * (v22 + v35);
      p_size[-1].height = v12 + (double)(v37 / v24) * v38;
      p_size->width = v35;
      p_size->height = v36;
      p_size += 2;
      ++v37;
      --v40;
    }
    while (v40);
  }
  a3->width = v10;
  a3->height = v16 + v12 + (double)((v7 + v24 - 1) / v24) * v38 - v22;
  self->_presentedNumberOfColumns = v24;
}

@end