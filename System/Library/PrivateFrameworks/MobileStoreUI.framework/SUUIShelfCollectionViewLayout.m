@interface SUUIShelfCollectionViewLayout
+ (BOOL)collectionViewCanClipToBounds;
+ (Class)layoutAttributesClass;
+ (double)snapToBoundariesDecelerationRate;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (SUUIShelfLayoutData)layoutData;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)setLayoutData:(id)a3;
@end

@implementation SUUIShelfCollectionViewLayout

+ (double)snapToBoundariesDecelerationRate
{
  return 0.8;
}

+ (BOOL)collectionViewCanClipToBounds
{
  return 1;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGSize)collectionViewContentSize
{
  [(SUUIShelfLayoutData *)self->_layoutData totalContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v39 = [MEMORY[0x263EFF980] array];
  [(SUUIShelfLayoutData *)self->_layoutData contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3010000000;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  v55 = "";
  [(SUUIShelfLayoutData *)self->_layoutData columnSpacing];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  double v51 = 0.0;
  double v17 = v10;
  if (ShouldReverseLayoutDirection)
  {
    double v36 = v14;
    double v18 = x;
    uint64_t v19 = v16;
    [(SUUIShelfLayoutData *)self->_layoutData totalContentSize];
    double v17 = v20 - v10;
    uint64_t v16 = v19;
    double x = v18;
    double v14 = v36;
  }
  double v21 = x + v10;
  double v22 = width - (v10 + v14);
  double v51 = v17;
  layoutData = self->_layoutData;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v48[3] = &unk_265406F50;
  char v49 = ShouldReverseLayoutDirection ^ 1;
  *(double *)&v48[6] = v21;
  *(double *)&v48[7] = y + v8;
  *(double *)&v48[8] = v22;
  *(double *)&v48[9] = height - (v8 + v12);
  v48[4] = v50;
  v48[5] = &v52;
  v48[10] = v16;
  [(SUUIShelfLayoutData *)layoutData enumerateColumnsUsingBlock:v48];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3010000000;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  v45 = "";
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  *(double *)&v41[3] = v8;
  v24 = self->_layoutData;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v40[3] = &unk_265406F78;
  *(double *)&v40[6] = v21;
  *(double *)&v40[7] = y + v8;
  *(double *)&v40[8] = v22;
  *(double *)&v40[9] = height - (v8 + v12);
  v40[4] = v41;
  v40[5] = &v42;
  [(SUUIShelfLayoutData *)v24 enumerateRowsUsingBlock:v40];
  v25 = [(SUUIShelfCollectionViewLayout *)self collectionView];
  v26 = [v25 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v26 = 0;
  }
  uint64_t v27 = [v25 numberOfItemsInSection:0];
  int64_t v38 = [(SUUIShelfLayoutData *)self->_layoutData numberOfRows];
  v28 = v53;
  unint64_t v29 = v53[4];
  if (v29 < v53[5] + v29)
  {
    v30 = v43;
    int64_t v31 = v29 * v38;
    do
    {
      unint64_t v32 = v30[4];
      if (v32 < v30[5] + v32)
      {
        do
        {
          if ((uint64_t)(v31 + v32) < v27)
          {
            v33 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:");
            v34 = [(SUUIShelfCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v33];

            [v26 collectionView:v25 layout:self willApplyLayoutAttributes:v34];
            [v39 addObject:v34];

            v30 = v43;
          }
          ++v32;
        }
        while (v32 < v30[5] + v30[4]);
        v28 = v53;
      }
      ++v29;
      v31 += v38;
    }
    while (v29 < v28[5] + v28[4]);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  return v39;
}

double __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  if (*(unsigned char *)(a1 + 88))
  {
    double MaxX = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    double v9 = *(double *)(a1 + 48);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
    double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (MaxX <= v9) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2
                                                              - *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 88)) {
    BOOL v15 = v10 >= CGRectGetMaxX(*(CGRect *)&v11) - a4;
  }
  else {
    BOOL v15 = v10 <= CGRectGetMinX(*(CGRect *)&v11) + a4;
  }
  *a3 = v15;
  double v16 = *(double *)(a1 + 80) + a4;
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(unsigned char *)(a1 + 88)) {
    double v16 = -v16;
  }
  double result = *(double *)(v17 + 24) + v16;
  *(double *)(v17 + 24) = result;
  return result;
}

double __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= *(double *)(a1 + 56)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2
                                                              - *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *a3 = v6 >= CGRectGetMaxY(*(CGRect *)(a1 + 48)) - a4;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v7 + 24) + a4;
  *(double *)(v7 + 24) = result;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  double v6 = [(SUUIShelfCollectionViewLayout *)self collectionView];
  uint64_t v7 = [v6 backgroundColor];
  [v5 setBackgroundColor:v7];

  [(SUUIShelfLayoutData *)self->_layoutData contentInset];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v4 item];
  uint64_t v13 = [(SUUIShelfLayoutData *)self->_layoutData numberOfRows];
  uint64_t v14 = v12 / v13;
  if (storeShouldReverseLayoutDirection())
  {
    for (int64_t i = [(SUUIShelfLayoutData *)self->_layoutData numberOfColumns] - 1; i > v14; --i)
    {
      [(SUUIShelfLayoutData *)self->_layoutData columnWidthForIndex:i];
      double v17 = v16;
      [(SUUIShelfLayoutData *)self->_layoutData columnSpacing];
      double v11 = v11 + v17 + v18;
    }
  }
  else if (v14 >= 1)
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      [(SUUIShelfLayoutData *)self->_layoutData columnWidthForIndex:j];
      double v21 = v20;
      [(SUUIShelfLayoutData *)self->_layoutData columnSpacing];
      double v11 = v11 + v21 + v22;
    }
  }
  uint64_t v23 = v12 % v13;
  if (v23 >= 1)
  {
    for (uint64_t k = 0; k != v23; ++k)
    {
      [(SUUIShelfLayoutData *)self->_layoutData rowHeightForIndex:k];
      double v9 = v9 + v25;
    }
  }
  [(SUUIShelfLayoutData *)self->_layoutData rowHeightForIndex:v23];
  double v27 = v26;
  [(SUUIShelfLayoutData *)self->_layoutData columnWidthForIndex:v14];
  objc_msgSend(v5, "setFrame:", v11, v9, v28, v27);

  return v5;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  double v21 = "";
  v17.receiver = self;
  v17.super_class = (Class)SUUIShelfCollectionViewLayout;
  -[SUUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v17, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x);
  uint64_t v22 = v7;
  uint64_t v23 = v8;
  [(SUUIShelfLayoutData *)self->_layoutData columnSpacing];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  layoutData = self->_layoutData;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__SUUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v15[3] = &unk_265406FA0;
  v15[5] = &v18;
  v15[6] = v16;
  *(CGFloat *)&v15[7] = x;
  *(CGFloat *)&v15[8] = y;
  v15[9] = v10;
  v15[4] = self;
  [(SUUIShelfLayoutData *)layoutData enumerateColumnsUsingBlock:v15];
  double v11 = v19[4];
  double v12 = v19[5];
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  double v13 = v11;
  double v14 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

double __99__SUUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, double a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(double *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  double v9 = *(double *)(v8 + 24);
  double v10 = v9 + a2;
  if (v7 > v9 && v7 < v10)
  {
    double v13 = *(double *)(a1 + 56);
    if (v13 > 0.0 || v13 >= 0.0 && v7 - v9 >= a2 * 0.5) {
      double v9 = v10 + *(double *)(a1 + 72);
    }
    *(double *)(v6 + 32) = v9;
    double v14 = [*(id *)(a1 + 32) collectionView];
    double v15 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    [v14 contentSize];
    double v17 = v16;
    [v14 bounds];
    double v19 = v17 - v18;
    if (v15 < v17 - v18) {
      double v19 = v15;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v19;
    *a4 = 1;

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    double v9 = *(double *)(v8 + 24);
  }
  double result = *(double *)(a1 + 72) + a2 + v9;
  *(double *)(v8 + 24) = result;
  return result;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 1;
}

- (SUUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (void)setLayoutData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end