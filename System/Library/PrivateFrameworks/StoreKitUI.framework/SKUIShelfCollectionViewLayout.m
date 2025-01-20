@interface SKUIShelfCollectionViewLayout
+ (BOOL)collectionViewCanClipToBounds;
+ (Class)layoutAttributesClass;
+ (double)snapToBoundariesDecelerationRate;
+ (void)collectionViewCanClipToBounds;
+ (void)layoutAttributesClass;
+ (void)snapToBoundariesDecelerationRate;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (SKUIShelfLayoutData)layoutData;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)collectionViewContentSize;
- (void)setLayoutData:(id)a3;
@end

@implementation SKUIShelfCollectionViewLayout

+ (double)snapToBoundariesDecelerationRate
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIShelfCollectionViewLayout snapToBoundariesDecelerationRate];
      }
    }
  }
  return 0.8;
}

+ (BOOL)collectionViewCanClipToBounds
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIShelfCollectionViewLayout collectionViewCanClipToBounds];
      }
    }
  }
  return 1;
}

+ (Class)layoutAttributesClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIShelfCollectionViewLayout layoutAttributesClass];
      }
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (CGSize)collectionViewContentSize
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIShelfCollectionViewLayout *)v3 collectionViewContentSize];
      }
    }
  }
  [(SKUIShelfLayoutData *)self->_layoutData totalContentSize];
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIShelfCollectionViewLayout layoutAttributesForElementsInRect:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v49 = [MEMORY[0x1E4F1CA48] array];
  [(SKUIShelfLayoutData *)self->_layoutData contentInset];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3010000000;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  v65 = &unk_1C1D0F257;
  [(SKUIShelfLayoutData *)self->_layoutData columnSpacing];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  double v61 = 0.0;
  double v26 = v19;
  if (ShouldReverseLayoutDirection)
  {
    double v47 = v23;
    double v27 = x;
    double v28 = y;
    uint64_t v29 = v25;
    [(SKUIShelfLayoutData *)self->_layoutData totalContentSize];
    double v26 = v30 - v19;
    uint64_t v25 = v29;
    double y = v28;
    double x = v27;
    double v23 = v47;
  }
  double v31 = x + v19;
  double v32 = y + v17;
  double v33 = width - (v19 + v23);
  double v61 = v26;
  layoutData = self->_layoutData;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v58[3] = &unk_1E6425FB8;
  char v59 = ShouldReverseLayoutDirection ^ 1;
  *(double *)&v58[6] = v31;
  *(double *)&v58[7] = v32;
  *(double *)&v58[8] = v33;
  *(double *)&v58[9] = height - (v17 + v21);
  v58[4] = v60;
  v58[5] = &v62;
  v58[10] = v25;
  [(SKUIShelfLayoutData *)layoutData enumerateColumnsUsingBlock:v58];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3010000000;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  v55 = &unk_1C1D0F257;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  *(double *)&v51[3] = v17;
  v35 = self->_layoutData;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v50[3] = &unk_1E6425FE0;
  *(double *)&v50[6] = v31;
  *(double *)&v50[7] = v32;
  *(double *)&v50[8] = v33;
  *(double *)&v50[9] = height - (v17 + v21);
  v50[4] = v51;
  v50[5] = &v52;
  [(SKUIShelfLayoutData *)v35 enumerateRowsUsingBlock:v50];
  v36 = [(SKUIShelfCollectionViewLayout *)self collectionView];
  v37 = [v36 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v37 = 0;
  }
  uint64_t v38 = [v36 numberOfItemsInSection:0];
  int64_t v48 = [(SKUIShelfLayoutData *)self->_layoutData numberOfRows];
  v39 = v63;
  unint64_t v40 = v63[4];
  if (v40 < v63[5] + v40)
  {
    v41 = v53;
    int64_t v42 = v40 * v48;
    do
    {
      unint64_t v43 = v41[4];
      if (v43 < v41[5] + v43)
      {
        do
        {
          if ((uint64_t)(v42 + v43) < v38)
          {
            v44 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
            v45 = [(SKUIShelfCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v44];

            [v37 collectionView:v36 layout:self willApplyLayoutAttributes:v45];
            [v49 addObject:v45];

            v41 = v53;
          }
          ++v43;
        }
        while (v43 < v41[5] + v41[4]);
        v39 = v63;
      }
      ++v40;
      v42 += v48;
    }
    while (v40 < v39[5] + v39[4]);
  }

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v62, 8);

  return v49;
}

double __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
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

double __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  uint64_t v14 = [(SKUIShelfCollectionViewLayout *)self collectionView];
  BOOL v15 = [v14 backgroundColor];
  [v13 setBackgroundColor:v15];

  [(SKUIShelfLayoutData *)self->_layoutData contentInset];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v4 item];
  uint64_t v21 = [(SKUIShelfLayoutData *)self->_layoutData numberOfRows];
  uint64_t v22 = v20 / v21;
  if (storeShouldReverseLayoutDirection())
  {
    for (int64_t i = [(SKUIShelfLayoutData *)self->_layoutData numberOfColumns] - 1; i > v22; --i)
    {
      [(SKUIShelfLayoutData *)self->_layoutData columnWidthForIndex:i];
      double v25 = v24;
      [(SKUIShelfLayoutData *)self->_layoutData columnSpacing];
      double v19 = v19 + v25 + v26;
    }
  }
  else if (v22 >= 1)
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      [(SKUIShelfLayoutData *)self->_layoutData columnWidthForIndex:j];
      double v29 = v28;
      [(SKUIShelfLayoutData *)self->_layoutData columnSpacing];
      double v19 = v19 + v29 + v30;
    }
  }
  uint64_t v31 = v20 % v21;
  if (v31 >= 1)
  {
    for (uint64_t k = 0; k != v31; ++k)
    {
      [(SKUIShelfLayoutData *)self->_layoutData rowHeightForIndex:k];
      double v17 = v17 + v33;
    }
  }
  [(SKUIShelfLayoutData *)self->_layoutData rowHeightForIndex:v31];
  double v35 = v34;
  [(SKUIShelfLayoutData *)self->_layoutData columnWidthForIndex:v22];
  objc_msgSend(v13, "setFrame:", v19, v17, v36, v35);

  return v13;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v28 = 0;
  double v29 = (double *)&v28;
  uint64_t v30 = 0x3010000000;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = &unk_1C1D0F257;
  v27.receiver = self;
  v27.super_class = (Class)SKUIShelfCollectionViewLayout;
  -[SKUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v27, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  [(SKUIShelfLayoutData *)self->_layoutData columnSpacing];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  layoutData = self->_layoutData;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __99__SKUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v25[3] = &unk_1E6426008;
  v25[5] = &v28;
  v25[6] = v26;
  *(double *)&v25[7] = x;
  *(double *)&v25[8] = y;
  v25[9] = v20;
  v25[4] = self;
  [(SKUIShelfLayoutData *)layoutData enumerateColumnsUsingBlock:v25];
  double v21 = v29[4];
  double v22 = v29[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  double v23 = v21;
  double v24 = v22;
  result.double y = v24;
  result.double x = v23;
  return result;
}

double __99__SKUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, double a2, uint64_t a3, unsigned char *a4)
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
    uint64_t v14 = [*(id *)(a1 + 32) collectionView];
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

- (SKUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (void)setLayoutData:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)snapToBoundariesDecelerationRate
{
}

+ (void)collectionViewCanClipToBounds
{
}

+ (void)layoutAttributesClass
{
}

- (void)collectionViewContentSize
{
}

- (void)layoutAttributesForElementsInRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)layoutAttributesForItemAtIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end