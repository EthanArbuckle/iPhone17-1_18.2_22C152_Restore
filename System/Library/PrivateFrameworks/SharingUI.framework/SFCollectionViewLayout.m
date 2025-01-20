@interface SFCollectionViewLayout
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldReverseLayoutDirection;
- (CGPoint)firstItemCenterForContainerWidth:(double)a3;
- (CGSize)_evaluatePreferredItemSizeForItemsAtIndexPaths:(id)a3;
- (CGSize)evaluatedContentSize;
- (CGSize)evaluatedItemSize;
- (NSArray)preparedLayoutAttributes;
- (NSArray)preparedUpdateItems;
- (SFCollectionViewDelegateLayout)fallbackDelegate;
- (SFCollectionViewLayout)init;
- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3;
- (UIEdgeInsets)evaluatedInset;
- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 containerWidth:(double)a5 offscreenPeekInFactor:(float)a6;
- (double)evaluatedHorizontalItemOffset;
- (id)_indexPathsForItemsInSection:(int64_t)a3;
- (id)_layoutAttributesForItemAtIndexPath:(id)a3 numberOfItemsInSection:(unint64_t)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)calculateLayoutValuesForIndexPaths:(id)a3 containerWidth:(double)a4;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setEvaluatedContentSize:(CGSize)a3;
- (void)setEvaluatedHorizontalItemOffset:(double)a3;
- (void)setEvaluatedInset:(UIEdgeInsets)a3;
- (void)setEvaluatedItemSize:(CGSize)a3;
- (void)setFallbackDelegate:(id)a3;
- (void)setPreparedLayoutAttributes:(id)a3;
- (void)setPreparedUpdateItems:(id)a3;
@end

@implementation SFCollectionViewLayout

- (SFCollectionViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFCollectionViewLayout;
  v2 = [(SFCollectionViewLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFCollectionViewLayout *)v2 _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
  }
  return v3;
}

- (CGPoint)firstItemCenterForContainerWidth:(double)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v5 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  v14[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [(SFCollectionViewLayout *)self calculateLayoutValuesForIndexPaths:v6 containerWidth:a3];

  v7 = [(SFCollectionViewLayout *)self _layoutAttributesForItemAtIndexPath:v5 numberOfItemsInSection:1];
  [v7 center];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)calculateLayoutValuesForIndexPaths:(id)a3 containerWidth:(double)a4
{
  id v25 = a3;
  -[SFCollectionViewLayout _evaluatePreferredItemSizeForItemsAtIndexPaths:](self, "_evaluatePreferredItemSizeForItemsAtIndexPaths:");
  double v30 = v7;
  double v31 = v6;
  double v26 = *MEMORY[0x263F834E8];
  double v27 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v28 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v29 = *(double *)(MEMORY[0x263F834E8] + 24);
  unint64_t v8 = 15;
  double v9 = 3.40282347e38;
  double v10 = v7;
  do
  {
    float v11 = (double)v8 / 100.0;
    [(SFCollectionViewLayout *)self _evaluateInsetForSectionAtIndex:0];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    *(float *)&double v20 = v11;
    -[SFCollectionViewLayout _evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:", v31, v10, v12, v14, v16, v18, a4, v20);
    if (v21 > 0.0)
    {
      double v19 = 9.0;
      *(float *)&double v22 = (double)v8 / 100.0;
      -[SFCollectionViewLayout _evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:", v31, v10, v13, 9.0, v17, 9.0, a4, v22);
      double v15 = 9.0;
    }
    if (v21 <= v9)
    {
      if (v21 >= 8.0) {
        double v9 = v21;
      }
      else {
        double v9 = 8.0;
      }
      double v28 = v17;
      double v29 = v19;
      double v26 = v13;
      double v27 = v15;
    }
    if (v9 <= 12.0) {
      break;
    }
    BOOL v23 = v8 >= 0x2E;
    v8 += 5;
  }
  while (!v23);
  double v24 = v29 + v27 + (double)(unint64_t)[v25 count] * v31;
  double v32 = v24 + (double)(unint64_t)([v25 count] - 1) * v9;
  [(SFCollectionViewLayout *)self setEvaluatedHorizontalItemOffset:v9];
  -[SFCollectionViewLayout setEvaluatedInset:](self, "setEvaluatedInset:", v26, v27, v28, v29);
  -[SFCollectionViewLayout setEvaluatedItemSize:](self, "setEvaluatedItemSize:", v31, v30);
  -[SFCollectionViewLayout setEvaluatedContentSize:](self, "setEvaluatedContentSize:", v32, v28 + v30 + v26);
}

- (void)prepareLayout
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)SFCollectionViewLayout;
  [(SFCollectionViewLayout *)&v28 prepareLayout];
  v3 = [(SFCollectionViewLayout *)self _indexPathsForItemsInSection:0];
  v4 = [(SFCollectionViewLayout *)self collectionView];
  [v4 frame];
  [(SFCollectionViewLayout *)self calculateLayoutValuesForIndexPaths:v3 containerWidth:CGRectGetWidth(v31)];

  objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        float v11 = -[SFCollectionViewLayout _layoutAttributesForItemAtIndexPath:numberOfItemsInSection:](self, "_layoutAttributesForItemAtIndexPath:numberOfItemsInSection:", *(void *)(*((void *)&v24 + 1) + 8 * i), objc_msgSend(v6, "count", (void)v24));
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  [(SFCollectionViewLayout *)self setPreparedLayoutAttributes:v5];
  if ([(SFCollectionViewLayout *)self shouldReverseLayoutDirection])
  {
    double v12 = [(SFCollectionViewLayout *)self collectionView];
    [v12 frame];
    double Width = CGRectGetWidth(v32);
    [(SFCollectionViewLayout *)self evaluatedContentSize];
    double v15 = Width - v14;

    if (v15 < 0.0) {
      double v15 = 0.0;
    }
    double v16 = [(SFCollectionViewLayout *)self collectionView];
    [v16 contentInset];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    BOOL v23 = [(SFCollectionViewLayout *)self collectionView];
    objc_msgSend(v23, "setContentInset:", v18, v15, v20, v22);
  }
}

- (BOOL)shouldReverseLayoutDirection
{
  v3 = [(SFCollectionViewLayout *)self collectionView];
  if ([v3 _shouldReverseLayoutDirection]) {
    int v4 = [(SFCollectionViewLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);
  [(SFCollectionViewLayout *)self collectionViewContentSize];
  return Width != v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(SFCollectionViewLayout *)self preparedLayoutAttributes];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SFCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_264472468;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v10 = v8;
  id v13 = v10;
  [v9 enumerateObjectsUsingBlock:v12];

  return v10;
}

void __60__SFCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  CGRect v5 = [(SFCollectionViewLayout *)self preparedLayoutAttributes];
  uint64_t v6 = [v4 item];

  uint64_t v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFCollectionViewLayout;
  CGRect v5 = [(SFCollectionViewLayout *)&v21 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(SFCollectionViewLayout *)self preparedUpdateItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        float v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![v11 updateAction])
        {
          double v12 = [v11 indexPathAfterUpdate];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            [v5 setAlpha:0.0];
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            CGAffineTransform v15 = v16;
            [v5 setTransform:&v15];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [v5 setAlpha:1.0];
LABEL_12:

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFCollectionViewLayout;
  CGRect v5 = [(SFCollectionViewLayout *)&v21 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(SFCollectionViewLayout *)self preparedUpdateItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        float v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 updateAction] == 1)
        {
          double v12 = [v11 indexPathBeforeUpdate];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            [v5 setAlpha:0.0];
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            CGAffineTransform v15 = v16;
            [v5 setTransform:&v15];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [v5 setAlpha:1.0];
LABEL_12:

  return v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCollectionViewLayout;
  id v4 = a3;
  [(SFCollectionViewLayout *)&v5 prepareForCollectionViewUpdates:v4];
  -[SFCollectionViewLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", v4, v5.receiver, v5.super_class);
}

- (void)finalizeCollectionViewUpdates
{
  [(SFCollectionViewLayout *)self setPreparedUpdateItems:0];
  v3.receiver = self;
  v3.super_class = (Class)SFCollectionViewLayout;
  [(SFCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
}

- (CGSize)_evaluatePreferredItemSizeForItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SFCollectionViewLayout *)self collectionView];
  uint64_t v6 = [v5 delegate];
  if (!v6)
  {
    uint64_t v6 = [(SFCollectionViewLayout *)self fallbackDelegate];
  }
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  objc_super v21 = "";
  long long v22 = *MEMORY[0x263F001B0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__SFCollectionViewLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke;
  v13[3] = &unk_264472490;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  CGAffineTransform v16 = self;
  long long v17 = &v18;
  [v4 enumerateObjectsUsingBlock:v13];
  double v9 = v19[4];
  double v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v11 = v9;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

uint64_t __73__SFCollectionViewLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) collectionView:*(void *)(a1 + 40) layout:*(void *)(a1 + 48) preferredSizeForItemAtIndexPath:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v6 + 40) >= v5) {
    double v5 = *(double *)(v6 + 40);
  }
  *(double *)(v6 + 40) = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v7 + 32) >= v4) {
    double v4 = *(double *)(v7 + 32);
  }
  *(double *)(v7 + 32) = v4;
  return result;
}

- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 2.0;
  double v5 = 0.0;
  double v6 = 2.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_indexPathsForItemsInSection:(int64_t)a3
{
  double v4 = [(SFCollectionViewLayout *)self collectionView];
  if ([v4 numberOfSections] <= a3)
  {
    double v6 = 0;
  }
  else
  {
    uint64_t v5 = [v4 numberOfItemsInSection:a3];
    double v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v8 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:a3];
        [v6 addObject:v8];
      }
    }
  }

  return v6;
}

- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 containerWidth:(double)a5 offscreenPeekInFactor:(float)a6
{
  double v6 = a5 - a3.width * a6 - a4.left;
  unint64_t v7 = vcvtmd_u64_f64(v6 / a3.width);
  if (v7) {
    return floor((v6 - (double)v7 * a3.width) / (double)v7);
  }
  else {
    return 0.0;
  }
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  double v6 = (void *)MEMORY[0x263F825A0];
  id v7 = a3;
  id v8 = [v6 layoutAttributesForCellWithIndexPath:v7];
  uint64_t v9 = [v7 item];

  if ([(SFCollectionViewLayout *)self shouldReverseLayoutDirection]) {
    int64_t v10 = ~v9 + a4;
  }
  else {
    int64_t v10 = v9;
  }
  [(SFCollectionViewLayout *)self evaluatedItemSize];
  double v12 = v11;
  double v14 = v13;
  [(SFCollectionViewLayout *)self evaluatedHorizontalItemOffset];
  double v16 = v12 * 0.5 + v12 * (double)v10 + v15 * (double)v10;
  [(SFCollectionViewLayout *)self evaluatedInset];
  double v18 = v17 + v16;
  [(SFCollectionViewLayout *)self evaluatedInset];
  double v20 = v14 * 0.5 + v19;
  objc_msgSend(v8, "setSize:", v12, v14);
  objc_msgSend(v8, "setCenter:", v18, v20);
  return v8;
}

- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(SFCollectionViewLayout *)self collectionView];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__SFCollectionViewLayout_invalidateGroupViewLayoutAnimated___block_invoke;
    v5[3] = &unk_264471EE0;
    v5[4] = self;
    [v4 performBatchUpdates:v5 completion:0];
  }
  else
  {
    [(SFCollectionViewLayout *)self invalidateLayout];
  }
}

uint64_t __60__SFCollectionViewLayout_invalidateGroupViewLayoutAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateLayout];
}

- (SFCollectionViewDelegateLayout)fallbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackDelegate);
  return (SFCollectionViewDelegateLayout *)WeakRetained;
}

- (void)setFallbackDelegate:(id)a3
{
}

- (UIEdgeInsets)evaluatedInset
{
  double top = self->_evaluatedInset.top;
  double left = self->_evaluatedInset.left;
  double bottom = self->_evaluatedInset.bottom;
  double right = self->_evaluatedInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEvaluatedInset:(UIEdgeInsets)a3
{
  self->_evaluatedInset = a3;
}

- (CGSize)evaluatedItemSize
{
  double width = self->_evaluatedItemSize.width;
  double height = self->_evaluatedItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEvaluatedItemSize:(CGSize)a3
{
  self->_evaluatedItemSize = a3;
}

- (CGSize)evaluatedContentSize
{
  double width = self->_evaluatedContentSize.width;
  double height = self->_evaluatedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEvaluatedContentSize:(CGSize)a3
{
  self->_evaluatedContentSize = a3;
}

- (double)evaluatedHorizontalItemOffset
{
  return self->_evaluatedHorizontalItemOffset;
}

- (void)setEvaluatedHorizontalItemOffset:(double)a3
{
  self->_evaluatedHorizontalItemOffset = a3;
}

- (NSArray)preparedLayoutAttributes
{
  return self->_preparedLayoutAttributes;
}

- (void)setPreparedLayoutAttributes:(id)a3
{
}

- (NSArray)preparedUpdateItems
{
  return self->_preparedUpdateItems;
}

- (void)setPreparedUpdateItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedUpdateItems, 0);
  objc_storeStrong((id *)&self->_preparedLayoutAttributes, 0);
  objc_destroyWeak((id *)&self->_fallbackDelegate);
}

@end