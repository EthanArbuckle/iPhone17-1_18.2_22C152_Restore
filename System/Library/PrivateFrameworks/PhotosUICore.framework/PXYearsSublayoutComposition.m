@interface PXYearsSublayoutComposition
- (PXYearsLayoutMetrics)metrics;
- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3;
- (id)configuredLayoutGenerator;
- (int64_t)presentedNumberOfColumns;
- (void)setMetrics:(id)a3;
@end

@implementation PXYearsSublayoutComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
}

- (PXYearsLayoutMetrics)metrics
{
  return self->_metrics;
}

- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3
{
  if (!a3)
  {
    +[PXCursorInteractionSettings sharedInstance];
    [(id)objc_claimAutoreleasedReturnValue() yearsPadding];
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    double v7 = *(double *)off_1E5DAAF10;
    double v8 = *((double *)off_1E5DAAF10 + 1);
    double v9 = *((double *)off_1E5DAAF10 + 2);
    double v10 = *((double *)off_1E5DAAF10 + 3);
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_13:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXYearsSublayoutComposition.m" lineNumber:75 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v5 = +[PXKeyboardSettings sharedInstance];
  uint64_t v6 = [v5 yearsFocusAnimationStyle];
  [v5 yearsFocusPadding];
  if (v6 == 2 || v6 == 1) {
LABEL_10:
  }
    PXEdgeInsetsMake();
  if (v6)
  {

    goto LABEL_13;
  }
  double v7 = *(double *)off_1E5DAAF10;
  double v8 = *((double *)off_1E5DAAF10 + 1);
  double v9 = *((double *)off_1E5DAAF10 + 2);
  double v10 = *((double *)off_1E5DAAF10 + 3);

LABEL_11:
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)presentedNumberOfColumns
{
  return [(PXYearsLayoutGenerator *)self->_layoutGenerator presentedNumberOfColumns];
}

- (id)configuredLayoutGenerator
{
  int64_t v3 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  v4 = [(PXYearsSublayoutComposition *)self metrics];
  v5 = (void *)[v4 copy];

  [(PXGSublayoutComposition *)self referenceSize];
  objc_msgSend(v5, "setReferenceSize:");
  layoutGenerator = self->_layoutGenerator;
  if (layoutGenerator)
  {
    [(PXYearsLayoutGenerator *)layoutGenerator setMetrics:v5];
  }
  else
  {
    double v7 = [[PXYearsLayoutGenerator alloc] initWithMetrics:v5];
    double v8 = self->_layoutGenerator;
    self->_layoutGenerator = v7;
  }
  [(PXYearsLayoutGenerator *)self->_layoutGenerator setItemCount:v3];
  double v9 = self->_layoutGenerator;

  return v9;
}

- (void)setMetrics:(id)a3
{
  double v8 = (PXYearsLayoutMetrics *)a3;
  v4 = self->_metrics;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXYearsLayoutMetrics *)v8 isEqual:v4];

    if (!v5)
    {
      uint64_t v6 = (PXYearsLayoutMetrics *)[(PXYearsLayoutMetrics *)v8 copy];
      metrics = self->_metrics;
      self->_metrics = v6;

      [(PXGGeneratedSublayoutComposition *)self invalidateLayout];
    }
  }
}

@end