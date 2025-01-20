@interface _TVMLShelfViewLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (TVCellMetrics)cellMetrics;
- (_TVMLShelfViewLayout)init;
- (double)cachedTallestHeaderHeight;
- (double)expectedLineSpacing;
- (double)headerAllowance;
- (double)showcaseFactor;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)contentRowMetricsForShowcase:(BOOL)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)setCachedTallestHeaderHeight:(double)a3;
- (void)setCellMetrics:(TVCellMetrics *)a3;
- (void)setShowcaseFactor:(double)a3;
@end

@implementation _TVMLShelfViewLayout

- (_TVMLShelfViewLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVMLShelfViewLayout;
  result = [(_TVShelfViewLayout *)&v3 init];
  if (result) {
    result->_cachedTallestHeaderHeight = -1.0;
  }
  return result;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  self->_cellMetrics.cellSize = a3->cellSize;
  long long v3 = *(_OWORD *)&a3->cellInset.bottom;
  long long v5 = *(_OWORD *)&a3->cellPadding.top;
  long long v4 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v3;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v5;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v4;
  long long v6 = *(_OWORD *)&a3->cellMargin.bottom;
  long long v8 = *(_OWORD *)&a3->cellInsetAlt.top;
  long long v7 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v6;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v8;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v7;
  if (a3->cellSize.width > 2.22044605e-16 && a3->cellSize.height > 2.22044605e-16) {
    [(_TVShelfViewLayout *)self setItemSize:a3->cellSize.width];
  }
}

- (void)setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
  long long v4 = objc_alloc_init(_TVMLShelfViewLayoutInvalidationContext);
  [(_TVMLShelfViewLayoutInvalidationContext *)v4 setInvalidateShowcase:1];
  [(_TVMLShelfViewLayout *)self invalidateLayoutWithContext:v4];
}

- (double)expectedLineSpacing
{
  v21[2] = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(_TVMLShelfViewLayout *)self cellMetrics];
  TVRowMetricsMakeWithCellMetrics((uint64_t)v15, (uint64_t)&v16);
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
  long long v3 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v10);
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

- (double)headerAllowance
{
  [(_TVMLShelfViewLayout *)self cachedTallestHeaderHeight];
  double v4 = v3;
  if (v3 == -1.0)
  {
    long long v7 = [(_TVMLShelfViewLayout *)self collectionView];
    double v8 = [v7 delegate];

    char v9 = objc_opt_respondsToSelector();
    double v10 = 0.0;
    if ((v9 & 1) == 0)
    {
      [(_TVShelfViewLayout *)self headerReferenceSize];
      double v10 = v11;
    }
    long long v12 = [(_TVMLShelfViewLayout *)self collectionView];
    uint64_t v13 = [v12 numberOfSections];

    if (v13 >= 1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (v9)
        {
          v15 = [(_TVMLShelfViewLayout *)self collectionView];
          [v8 collectionView:v15 layout:self referenceSizeForHeaderInSection:i];
          double v17 = v16;

          if (v17 > v10) {
            double v10 = v17;
          }
        }
      }
    }
    [(_TVMLShelfViewLayout *)self setCachedTallestHeaderHeight:v10];
    double v5 = 0.0;
    if (v10 > 0.0)
    {
      [(_TVShelfViewLayout *)self headerBottomMargin];
      double v5 = v10 + v18;
    }
  }
  else
  {
    double v5 = 0.0;
    if (v3 > 0.0)
    {
      [(_TVShelfViewLayout *)self headerBottomMargin];
      return v4 + v6;
    }
  }
  return v5;
}

- (id)contentRowMetricsForShowcase:(BOOL)a3
{
  double v5 = [(_TVMLShelfViewLayout *)self collectionView];
  double v6 = [v5 delegate];

  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();
  double v9 = 0.0;
  if (!a3 && (v7 & 1) == 0)
  {
    [(_TVShelfViewLayout *)self headerReferenceSize];
    double v9 = v10;
  }
  double v11 = *MEMORY[0x263F1D1C0];
  double v55 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  long long v12 = [(_TVMLShelfViewLayout *)self collectionView];
  uint64_t v13 = [v12 numberOfSections];

  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    char v15 = a3 | v7 ^ 1;
    do
    {
      if ((v15 & 1) == 0)
      {
        double v16 = [(_TVMLShelfViewLayout *)self collectionView];
        [v6 collectionView:v16 layout:self referenceSizeForHeaderInSection:v14];
        double v18 = v17;

        if (v18 > v9) {
          double v9 = v18;
        }
      }
      if (v8)
      {
        long long v19 = [(_TVMLShelfViewLayout *)self collectionView];
        [v6 collectionView:v19 layout:self insetForSectionAtIndex:v14];
        double v21 = v20;
        double v23 = v22;

        if (v21 > v11) {
          double v11 = v21;
        }
        double v24 = v55;
        if (v23 > v55) {
          double v24 = v23;
        }
        double v55 = v24;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  double v54 = v9;
  uint64_t v25 = [(_TVShelfViewLayout *)self computedRowCount];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  [(_TVMLShelfViewLayout *)self cellMetrics];
  v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", v25, TVRowMetricsMakeWithCellMetrics((uint64_t)v57, (uint64_t)&v58));
  if (v25 >= 1)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      double v29 = *((double *)&v58 + 1);
      uint64_t v28 = v58;
      uint64_t v31 = *((void *)&v59 + 1);
      double v30 = *(double *)&v59;
      uint64_t v33 = *((void *)&v60 + 1);
      uint64_t v32 = v60;
      uint64_t v35 = *((void *)&v61 + 1);
      uint64_t v34 = v61;
      double v36 = *((double *)&v62 + 1);
      double v37 = *(double *)&v62;
      if (!i)
      {
        if (v54 > 0.0)
        {
          uint64_t v53 = *((void *)&v61 + 1);
          [(_TVShelfViewLayout *)self headerSelectionMargin];
          double v39 = v38;
          [(_TVShelfViewLayout *)self headerBottomMargin];
          double v41 = v40;
          [(_TVMLShelfViewLayout *)self cellMetrics];
          double v42 = v39 - (v41 - *(double *)&v56[24]);
          uint64_t v32 = 0;
          double v37 = fmax(v42, 0.0);
          [(_TVShelfViewLayout *)self headerBottomMargin];
          uint64_t v35 = v53;
          double v44 = v54 + v43;
          double v29 = v29 + v44;
          double v30 = v30 + v44;
          uint64_t v34 = 0;
        }
        double v45 = fmax(v37 - v11, 0.0);
        if (v11 > 0.0)
        {
          double v29 = v11 + v29;
          double v30 = v11 + v30;
          double v37 = v45;
        }
      }
      BOOL v46 = v55 > 0.0;
      BOOL v47 = v25 - 1 == i;
      double v48 = -0.0;
      if (v47 && v46) {
        double v48 = v55;
      }
      v56[0] = v28;
      *(double *)&v56[1] = v48 + v29;
      *(double *)&v56[2] = v48 + v30;
      double v49 = fmax(v36 - v55, 0.0);
      v56[3] = v31;
      v56[4] = v32;
      if (!v47 || !v46) {
        double v49 = v37;
      }
      v56[5] = v33;
      v56[6] = v34;
      v56[7] = v35;
      *(double *)&v56[8] = v49;
      *(double *)&v56[9] = v36;
      v50 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", v56);
      [v26 addObject:v50];
    }
  }
  v51 = (void *)[v26 copy];

  return v51;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 invalidateShowcase])
  {
    id v17 = v4;
    double v5 = [(_TVMLShelfViewLayout *)self collectionView];
    double v6 = [v5 delegate];
    if ([v6 conformsToProtocol:&unk_26E5D4D38])
    {
      char v7 = [v5 delegate];
    }
    else
    {
      char v7 = 0;
    }

    char v8 = objc_opt_respondsToSelector();
    double v9 = [MEMORY[0x263EFF980] array];
    double v10 = [(_TVMLShelfViewLayout *)self collectionView];
    uint64_t v11 = [v10 numberOfSections];

    if (v11 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        if (v8) {
          [v7 collectionView:v5 layout:self referenceSizeForHeaderInSection:v12];
        }
        else {
          [(_TVShelfViewLayout *)self headerReferenceSize];
        }
        if (v13 > 0.0)
        {
          uint64_t v14 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v12];
          [v9 addObject:v14];
        }
        ++v12;
        char v15 = [(_TVMLShelfViewLayout *)self collectionView];
        uint64_t v16 = [v15 numberOfSections];
      }
      while (v12 < v16);
    }
    [(_TVMLShelfViewLayout *)self setCachedTallestHeaderHeight:-1.0];
    [v17 invalidateSupplementaryElementsOfKind:@"TVShelfLayoutElementKindHeader" atIndexPaths:v9];
  }
  v18.receiver = self;
  v18.super_class = (Class)_TVMLShelfViewLayout;
  [(_TVShelfViewLayout *)&v18 invalidateLayoutWithContext:v4];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)_TVMLShelfViewLayout;
  id v4 = -[_TVShelfViewLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 representedElementCategory] == 1)
        {
          double v10 = [v9 representedElementKind];
          int v11 = [v10 isEqualToString:@"TVShelfLayoutElementKindHeader"];

          if (v11)
          {
            [(_TVMLShelfViewLayout *)self showcaseFactor];
            +[TVMLUtilities _headerFadeForShowcaseFactor:](TVMLUtilities, "_headerFadeForShowcaseFactor:");
            objc_msgSend(v9, "setAlpha:");
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_TVMLShelfViewLayout;
  id v6 = a3;
  uint64_t v7 = [(_TVShelfViewLayout *)&v10 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:a4];
  int v8 = objc_msgSend(v6, "isEqualToString:", @"TVShelfLayoutElementKindHeader", v10.receiver, v10.super_class);

  if (v8)
  {
    [(_TVMLShelfViewLayout *)self showcaseFactor];
    +[TVMLUtilities _headerFadeForShowcaseFactor:](TVMLUtilities, "_headerFadeForShowcaseFactor:");
    objc_msgSend(v7, "setAlpha:");
  }
  return v7;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  v35.receiver = self;
  v35.super_class = (Class)_TVMLShelfViewLayout;
  -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](&v35, sel_targetContentOffsetForProposedContentOffset_, a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  int v8 = [(_TVMLShelfViewLayout *)self collectionView];
  double v9 = [v8 delegate];
  objc_super v10 = [v9 indexPathForPreferredFocusedViewInCollectionView:v8];

  if (v10)
  {
    int v11 = [v8 layoutAttributesForItemAtIndexPath:v10];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;

    long long v16 = [(_TVShelfViewLayout *)self layoutAttributesForItemAtIndexPath:v10];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;

    [v8 contentOffset];
    double v22 = v18 + v20 * 0.5 - (v13 - v21 + v15 * 0.5);
    [v8 contentInset];
    double v25 = v24;
    double v26 = 0.0;
    if (v18 - v22 < v23) {
      double v26 = v23 - (v18 - v22);
    }
    double v27 = v22 - v26;
    [v8 bounds];
    double v29 = v28 - (v18 + v20 - v27);
    double v30 = v25 - v29;
    BOOL v31 = v29 < v25;
    double v32 = -0.0;
    if (v31) {
      double v32 = v30;
    }
    double v5 = v27 + v32;
  }

  double v33 = v5;
  double v34 = v7;
  result.y = v34;
  result.x = v33;
  return result;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 1)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74___TVMLShelfViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
    v12[3] = &unk_264BA7138;
    id v13 = v8;
    double v14 = self;
    id v15 = v9;
    objc_super v10 = (void *)[v12 copy];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (TVCellMetrics)cellMetrics
{
  long long v3 = *(_OWORD *)&self[3].cellInsetAlt.right;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&self[3].cellInsetAlt.left;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&self[3].cellMargin.left;
  long long v4 = *(_OWORD *)&self[3].cellPadding.right;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&self[3].cellPadding.left;
  *(_OWORD *)&retstr->cellInset.top = v4;
  long long v5 = *(_OWORD *)&self[3].cellInset.right;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&self[3].cellInset.left;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  long long v6 = *(_OWORD *)&self[3].cellSize.height;
  retstr->cellSize = *(CGSize *)&self[2].cellMargin.right;
  *(_OWORD *)&retstr->cellPadding.top = v6;
  return self;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (double)cachedTallestHeaderHeight
{
  return self->_cachedTallestHeaderHeight;
}

- (void)setCachedTallestHeaderHeight:(double)a3
{
  self->_cachedTallestHeaderHeight = a3;
}

@end