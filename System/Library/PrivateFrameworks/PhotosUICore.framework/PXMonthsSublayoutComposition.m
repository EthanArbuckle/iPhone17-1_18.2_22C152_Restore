@interface PXMonthsSublayoutComposition
- (BOOL)presentedSingleColumn;
- (PXMonthsLayoutMetrics)metrics;
- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3;
- (id)configuredLayoutGenerator;
- (void)setMetrics:(id)a3;
- (void)updateSublayoutAttributes;
@end

@implementation PXMonthsSublayoutComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_indexesOfHeroes, 0);
  objc_storeStrong((id *)&self->_indexesOfChapterHeaders, 0);
}

- (PXMonthsLayoutMetrics)metrics
{
  return self->_metrics;
}

- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3
{
  if (!a3)
  {
    +[PXCursorInteractionSettings sharedInstance];
    [(id)objc_claimAutoreleasedReturnValue() monthsPadding];
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
    [v15 handleFailureInMethod:a2 object:self file:@"PXMonthsSublayoutComposition.m" lineNumber:103 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v5 = +[PXKeyboardSettings sharedInstance];
  uint64_t v6 = [v5 monthsFocusAnimationStyle];
  [v5 monthsFocusPadding];
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

- (BOOL)presentedSingleColumn
{
  return [(PXMonthsLayoutGenerator *)self->_layoutGenerator presentedSingleColumn];
}

- (id)configuredLayoutGenerator
{
  v3 = [(PXMonthsSublayoutComposition *)self metrics];
  v4 = (void *)[v3 copy];

  [(PXGSublayoutComposition *)self referenceSize];
  objc_msgSend(v4, "setReferenceSize:");
  layoutGenerator = self->_layoutGenerator;
  if (layoutGenerator)
  {
    [(PXMonthsLayoutGenerator *)layoutGenerator setMetrics:v4];
  }
  else
  {
    uint64_t v6 = [[PXMonthsLayoutGenerator alloc] initWithMetrics:v4];
    double v7 = self->_layoutGenerator;
    self->_layoutGenerator = v6;
  }
  [(PXMonthsLayoutGenerator *)self->_layoutGenerator setItemCount:[(PXGSublayoutComposition *)self numberOfSublayouts]];
  double v8 = (void *)[(NSIndexSet *)self->_indexesOfChapterHeaders copy];
  double v9 = (void *)[(NSIndexSet *)self->_indexesOfHeroes copy];
  id v10 = objc_alloc((Class)off_1E5DA6FF0);
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v13 = objc_msgSend(v10, "initWithSize:weight:", *MEMORY[0x1E4F1DB30], v12, 0.0);
  double v14 = objc_msgSend(objc_alloc((Class)off_1E5DA6FF0), "initWithSize:weight:", v11, v12, -1.0);
  v15 = objc_msgSend(objc_alloc((Class)off_1E5DA6FF0), "initWithSize:weight:", v11, v12, 1.0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__PXMonthsSublayoutComposition_configuredLayoutGenerator__block_invoke;
  v24[3] = &unk_1E5DC92D0;
  id v25 = v8;
  id v26 = v14;
  id v27 = v9;
  id v28 = v15;
  id v29 = v13;
  v16 = self->_layoutGenerator;
  id v17 = v13;
  id v18 = v15;
  id v19 = v9;
  id v20 = v14;
  id v21 = v8;
  [(PXMonthsLayoutGenerator *)v16 setItemLayoutInfoBlock:v24];
  v22 = self->_layoutGenerator;

  return v22;
}

id __57__PXMonthsSublayoutComposition_configuredLayoutGenerator__block_invoke(id *a1, uint64_t a2)
{
  if ([a1[4] containsIndex:a2])
  {
    v4 = a1 + 5;
  }
  else
  {
    int v5 = [a1[6] containsIndex:a2];
    v4 = a1 + 8;
    if (v5) {
      v4 = a1 + 7;
    }
  }
  uint64_t v6 = *v4;
  return v6;
}

- (void)updateSublayoutAttributes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int v5 = [(PXGSublayoutComposition *)self layout];
  int64_t v6 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PXMonthsSublayoutComposition_updateSublayoutAttributes__block_invoke;
  v14[3] = &unk_1E5DC92A8;
  id v15 = v5;
  id v16 = v3;
  id v17 = v4;
  id v7 = v4;
  id v8 = v3;
  id v9 = v5;
  -[PXGSublayoutComposition enumerateSublayoutProvidersForRange:usingBlock:](self, "enumerateSublayoutProvidersForRange:usingBlock:", 0, v6, v14);
  id v10 = (NSIndexSet *)[v8 copy];
  indexesOfChapterHeaders = self->_indexesOfChapterHeaders;
  self->_indexesOfChapterHeaders = v10;

  double v12 = (NSIndexSet *)[v7 copy];
  indexesOfHeroes = self->_indexesOfHeroes;
  self->_indexesOfHeroes = v12;
}

uint64_t __57__PXMonthsSublayoutComposition_updateSublayoutAttributes__block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "layout:collectIndexesOfChapterHeaderSublayouts:heroSublayouts:inRange:", a1[4], a1[5], a1[6], a3, a4);
}

- (void)setMetrics:(id)a3
{
  id v8 = (PXMonthsLayoutMetrics *)a3;
  id v4 = self->_metrics;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXMonthsLayoutMetrics *)v8 isEqual:v4];

    if (!v5)
    {
      int64_t v6 = (PXMonthsLayoutMetrics *)[(PXMonthsLayoutMetrics *)v8 copy];
      metrics = self->_metrics;
      self->_metrics = v6;

      [(PXGGeneratedSublayoutComposition *)self invalidateLayout];
    }
  }
}

@end