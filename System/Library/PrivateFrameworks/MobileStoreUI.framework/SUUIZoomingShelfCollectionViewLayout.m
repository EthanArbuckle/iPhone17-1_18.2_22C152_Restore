@interface SUUIZoomingShelfCollectionViewLayout
+ (BOOL)collectionViewCanClipToBounds;
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
+ (double)snapToBoundariesDecelerationRate;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (SUUIShelfLayoutData)layoutData;
- (double)focusedItemHorizontalCenterOffset;
- (double)interItemSpacing;
- (double)itemWidth;
- (double)scaledItemWidth;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)menuBarFocusedItemIndexPathWithTransitionProgress:(double *)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setFocusedItemHorizontalCenterOffset:(double)a3;
- (void)setInterItemSpacing:(double)a3;
- (void)setItemWidth:(double)a3;
- (void)setLayoutData:(id)a3;
- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4;
- (void)setScaledItemWidth:(double)a3;
@end

@implementation SUUIZoomingShelfCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (void)prepareLayout
{
  v63.receiver = self;
  v63.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  [(SUUIZoomingShelfCollectionViewLayout *)&v63 prepareLayout];
  v3 = [(SUUIZoomingShelfCollectionViewLayout *)self collectionView];
  v50 = [v3 backgroundColor];
  [v3 bounds];
  CGFloat v61 = v5;
  CGFloat v62 = v4;
  CGFloat v59 = v7;
  CGFloat v60 = v6;
  v49 = v3;
  [v3 contentOffset];
  double v9 = v8;
  double focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  double interItemSpacing = self->_interItemSpacing;
  double itemWidth = self->_itemWidth;
  double scaledItemWidth = self->_scaledItemWidth;
  double v14 = scaledItemWidth * 0.5;
  if (self->_cachedLayoutAttributes && self->_invalidateGeometryOnlyOfExistingLayoutAttributes)
  {
    char v55 = 0;
  }
  else
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedLayoutAttributes = self->_cachedLayoutAttributes;
    self->_cachedLayoutAttributes = v15;

    char v55 = 1;
  }
  double v17 = itemWidth * 0.5;
  double v57 = interItemSpacing + itemWidth;
  double v58 = focusedItemHorizontalCenterOffset - v14;
  uint64_t v48 = [v3 numberOfSections];
  if (v48 <= 0)
  {
    double v44 = scaledItemWidth - itemWidth;
    double v43 = -1.0;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    double v46 = scaledItemWidth * 0.5;
    double v47 = focusedItemHorizontalCenterOffset;
    double v20 = v17 + interItemSpacing + v14 + v17 + interItemSpacing + v14;
    double v53 = v20 * 0.5;
    double v54 = v9 + focusedItemHorizontalCenterOffset;
    double v56 = scaledItemWidth - itemWidth;
    double v52 = v20 - (scaledItemWidth - itemWidth);
    double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v51 = *MEMORY[0x263F001A8];
    uint64_t v22 = *MEMORY[0x263F15EB8];
    double v23 = scaledItemWidth / itemWidth;
    double v24 = 1.0 - scaledItemWidth / itemWidth + 1.0 - scaledItemWidth / itemWidth;
    do
    {
      uint64_t v25 = objc_msgSend(v49, "numberOfItemsInSection:", v19, *(void *)&v46, *(void *)&v47);
      if (v25 >= 1)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          v27 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:v19];
          if ((v55 & 1) != 0
            || ([(NSMutableDictionary *)self->_cachedLayoutAttributes objectForKey:v27],
                (v28 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v28 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v27);
            [v28 setBackgroundColor:v50];
          }
          [(SUUIShelfLayoutData *)self->_layoutData sizeForItemAtIndex:v18 + i];
          double v30 = v29;
          double v31 = v17 + v58 + (double)(v18 + i) * v57;
          double v32 = (v53 + v31 - v54) / v52;
          if (v32 < 0.0) {
            double v32 = 0.0;
          }
          double v33 = fmin(v32, 1.0);
          [v28 _setZoomingImageLambda:v33];
          v64.origin.y = v61;
          v64.origin.x = v62;
          v64.size.height = v59;
          v64.size.width = v60;
          objc_msgSend(v28, "setCenter:", v31 + v33 * v56, CGRectGetMinY(v64) + v30 * 0.5);
          objc_msgSend(v28, "setBounds:", v51, v21, itemWidth, v30);
          double v34 = fabs(v33 + -0.5);
          v35 = [MEMORY[0x263F15808] functionWithName:v22];
          *(float *)&double v36 = 1.0 - v34;
          [v35 _solveForInput:v36];
          double v38 = v37;

          [v28 setZoomingImageAlpha:v38];
          [v28 setZoomingImageWidth:itemWidth * (v23 + v24 * v34)];
          v39 = [MEMORY[0x263F15808] functionWithName:v22];
          *(float *)&double v40 = v34 + v34;
          [v39 _solveForInput:v40];
          double v42 = v41;

          [v28 setZoomingImageImposedAlphaOfOtherViews:v42];
          [(NSMutableDictionary *)self->_cachedLayoutAttributes setObject:v28 forKey:v27];
        }
      }
      v18 += v25;
      ++v19;
    }
    while (v19 != v48);
    double v43 = (double)(v18 - 1);
    double v14 = v46;
    double focusedItemHorizontalCenterOffset = v47;
    double v44 = v56;
  }
  [(SUUIShelfLayoutData *)self->_layoutData totalContentSize];
  self->_cachedCollectionViewContentSize.width = v17 + v44 + v17 + v58 + v43 * v57;
  self->_cachedCollectionViewContentSize.height = v45;
  v65.origin.y = v61;
  v65.origin.x = v62;
  v65.size.height = v59;
  v65.size.width = v60;
  self->_cachedCollectionViewContentSize.width = self->_cachedCollectionViewContentSize.width
                                               + CGRectGetWidth(v65)
                                               - focusedItemHorizontalCenterOffset
                                               - v14;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_cachedCollectionViewContentSize.width;
  double height = self->_cachedCollectionViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__SUUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_265401A78;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v10 = v8;
  id v13 = v10;
  [(NSMutableDictionary *)cachedLayoutAttributes enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

void __74__SUUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 frame];
  if (CGRectIntersectsRect(v6, *(CGRect *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedLayoutAttributes objectForKey:a3];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v14.receiver = self;
  v14.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  CGRect v6 = -[SUUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:](&v14, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y);
  double v7 = [(SUUIZoomingShelfCollectionViewLayout *)self collectionView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v9 == width && v11 == height) {
    [v6 setInvalidateGeometryOnlyOfExistingLayoutAttributes:1];
  }
  return v6;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  self->_invalidateGeometryOnlyOfExistingLayoutAttributes = [v4 invalidateGeometryOnlyOfExistingLayoutAttributes];
  v5.receiver = self;
  v5.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  [(SUUIZoomingShelfCollectionViewLayout *)&v5 invalidateLayoutWithContext:v4];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(SUUIZoomingShelfCollectionViewLayout *)self collectionView];
  double focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  double interItemSpacing = self->_interItemSpacing;
  double itemWidth = self->_itemWidth;
  double scaledItemWidth = self->_scaledItemWidth;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__10;
  double v33 = __Block_byref_object_dispose__10;
  id v34 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v28[3] = 0x7FEFFFFFFFFFFFFFLL;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __106__SUUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v27[3] = &unk_265401AA0;
  *(double *)&v27[6] = v7 + focusedItemHorizontalCenterOffset;
  v27[4] = v28;
  v27[5] = &v29;
  [(NSMutableDictionary *)cachedLayoutAttributes enumerateKeysAndObjectsUsingBlock:v27];
  v26.receiver = self;
  v26.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  -[SUUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v26, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  double v17 = v16;
  uint64_t v18 = (void *)v30[5];
  if (v18)
  {
    uint64_t v19 = [v18 section];
    uint64_t v20 = [(id)v30[5] item];
    if (v19 < 1)
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      do
        v22 += [v9 numberOfItemsInSection:v21++];
      while (v19 != v21);
    }
    double v23 = itemWidth * 0.5
        + focusedItemHorizontalCenterOffset
        - scaledItemWidth * 0.5
        + (double)(v22 + v20) * (interItemSpacing + itemWidth)
        + (scaledItemWidth - itemWidth) * 0.5
        - focusedItemHorizontalCenterOffset;
  }
  else
  {
    double v23 = v15;
  }
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);

  double v24 = v23;
  double v25 = v17;
  result.double y = v25;
  result.double x = v24;
  return result;
}

void __106__SUUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  [a3 center];
  double v7 = vabdd_f64(v6, *(double *)(a1 + 48));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 < *(double *)(v8 + 24))
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)menuBarFocusedItemIndexPathWithTransitionProgress:(double *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v4 = [(SUUIZoomingShelfCollectionViewLayout *)self collectionView];
  [v4 layoutIfNeeded];
  objc_super v5 = [v4 indexPathsForVisibleItems];
  if (![v5 count])
  {
    [v4 contentOffset];
    if (v6 <= 0.0)
    {
      id v9 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
      v32[0] = v9;
      double v10 = (void **)v32;
    }
    else
    {
      uint64_t v7 = [v4 numberOfSections] - 1;
      uint64_t v8 = [v4 numberOfItemsInSection:v7];
      id v9 = [MEMORY[0x263F088C8] indexPathForItem:v8 - 1 inSection:v7];
      uint64_t v31 = v9;
      double v10 = &v31;
    }
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

    objc_super v5 = (void *)v11;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = 0;
    uint64_t v16 = *(void *)v27;
    double v17 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v20 = [(NSMutableDictionary *)self->_cachedLayoutAttributes objectForKey:v19];
        [v20 _zoomingImageLambda];
        double v22 = v21;
        if (fabs(v21 + -0.5) < fabs(v17 + -0.5))
        {
          id v23 = v19;

          double v17 = v22;
          double v15 = v23;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
  else
  {
    double v15 = 0;
    double v17 = 1.79769313e308;
  }

  if (a3) {
    *a3 = v17 * 2.0 + -1.0;
  }

  return v15;
}

- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4
{
  id v16 = a3;
  double v6 = [(SUUIZoomingShelfCollectionViewLayout *)self collectionView];
  double interItemSpacing = self->_interItemSpacing;
  double itemWidth = self->_itemWidth;
  double scaledItemWidth = self->_scaledItemWidth;
  uint64_t v10 = [v16 section];
  if (v10 < 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
      v13 += [v6 numberOfItemsInSection:v12++];
    while (v11 != v12);
  }
  double v14 = itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5
      + itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5;
  uint64_t v15 = [v16 item] + v13;
  [v6 contentOffset];
  [v6 setContentOffset:v14 * 0.5+ itemWidth * 0.5+ scaledItemWidth * -0.5+ (double)v15 * (interItemSpacing + itemWidth)+ (a4 + 1.0) * -0.5 * (v14 - (scaledItemWidth - itemWidth))];
}

- (void)setFocusedItemHorizontalCenterOffset:(double)a3
{
  if (self->_focusedItemHorizontalCenterOffset != a3)
  {
    self->_double focusedItemHorizontalCenterOffset = a3;
    [(SUUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setLayoutData:(id)a3
{
  objc_super v5 = (SUUIShelfLayoutData *)a3;
  p_layoutData = &self->_layoutData;
  if (self->_layoutData != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_layoutData, a3);
    p_layoutData = (SUUIShelfLayoutData **)[(SUUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
    objc_super v5 = v7;
  }
  MEMORY[0x270F9A758](p_layoutData, v5);
}

- (void)setInterItemSpacing:(double)a3
{
  if (self->_interItemSpacing != a3)
  {
    self->_double interItemSpacing = a3;
    [(SUUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setItemWidth:(double)a3
{
  if (self->_itemWidth != a3)
  {
    self->_double itemWidth = a3;
    [(SUUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setScaledItemWidth:(double)a3
{
  if (self->_scaledItemWidth != a3)
  {
    self->_double scaledItemWidth = a3;
    [(SUUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

+ (double)snapToBoundariesDecelerationRate
{
  return 0.98;
}

+ (BOOL)collectionViewCanClipToBounds
{
  return 0;
}

- (SUUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (double)focusedItemHorizontalCenterOffset
{
  return self->_focusedItemHorizontalCenterOffset;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)itemWidth
{
  return self->_itemWidth;
}

- (double)scaledItemWidth
{
  return self->_scaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutData, 0);
  objc_storeStrong((id *)&self->_cachedLayoutAttributes, 0);
}

@end