@interface SKUIZoomingShelfCollectionViewLayout
+ (BOOL)collectionViewCanClipToBounds;
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
+ (double)snapToBoundariesDecelerationRate;
+ (void)collectionViewCanClipToBounds;
+ (void)invalidationContextClass;
+ (void)layoutAttributesClass;
+ (void)snapToBoundariesDecelerationRate;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (SKUIShelfLayoutData)layoutData;
- (double)focusedItemHorizontalCenterOffset;
- (double)interItemSpacing;
- (double)itemWidth;
- (double)scaledItemWidth;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)menuBarFocusedItemIndexPathWithTransitionProgress:(double *)a3;
- (void)collectionViewContentSize;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setFocusedItemHorizontalCenterOffset:(double)a3;
- (void)setInterItemSpacing:(double)a3;
- (void)setItemWidth:(double)a3;
- (void)setLayoutData:(id)a3;
- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4;
- (void)setScaledItemWidth:(double)a3;
@end

@implementation SKUIZoomingShelfCollectionViewLayout

+ (Class)layoutAttributesClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIZoomingShelfCollectionViewLayout layoutAttributesClass];
      }
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)prepareLayout
{
}

- (CGSize)collectionViewContentSize
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIZoomingShelfCollectionViewLayout *)v3 collectionViewContentSize];
      }
    }
  }
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIZoomingShelfCollectionViewLayout layoutAttributesForElementsInRect:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__SKUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v20[3] = &unk_1E6428408;
  CGFloat v22 = x;
  CGFloat v23 = y;
  CGFloat v24 = width;
  CGFloat v25 = height;
  id v18 = v16;
  id v21 = v18;
  [(NSMutableDictionary *)cachedLayoutAttributes enumerateKeysAndObjectsUsingBlock:v20];

  return v18;
}

void __74__SKUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 frame];
  if (CGRectIntersectsRect(v6, *(CGRect *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v4];
  }
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
        -[SKUIZoomingShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_cachedLayoutAttributes objectForKey:v4];

  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIZoomingShelfCollectionViewLayout invalidationContextClass];
      }
    }
  }
  uint64_t v10 = objc_opt_class();

  return (Class)v10;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
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
        -[SKUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  id v16 = -[SKUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:](&v24, sel_invalidationContextForBoundsChange_, x, y, width, height);
  v17 = [(SKUIZoomingShelfCollectionViewLayout *)self collectionView];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;

  if (v19 == width && v21 == height) {
    [v16 setInvalidateGeometryOnlyOfExistingLayoutAttributes:1];
  }

  return v16;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIZoomingShelfCollectionViewLayout invalidateLayoutWithContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = v4;
  self->_invalidateGeometryOnlyOfExistingLayoutAttributes = [v13 invalidateGeometryOnlyOfExistingLayoutAttributes];
  v14.receiver = self;
  v14.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  [(SKUIZoomingShelfCollectionViewLayout *)&v14 invalidateLayoutWithContext:v13];
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
        -[SKUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [(SKUIZoomingShelfCollectionViewLayout *)self collectionView];
  double focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  double interItemSpacing = self->_interItemSpacing;
  double itemWidth = self->_itemWidth;
  double scaledItemWidth = self->_scaledItemWidth;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__62;
  v41 = __Block_byref_object_dispose__62;
  id v42 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v36[3] = 0x7FEFFFFFFFFFFFFFLL;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __106__SKUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v35[3] = &unk_1E6428430;
  *(double *)&v35[6] = v7 + focusedItemHorizontalCenterOffset;
  v35[4] = v36;
  v35[5] = &v37;
  [(NSMutableDictionary *)cachedLayoutAttributes enumerateKeysAndObjectsUsingBlock:v35];
  v34.receiver = self;
  v34.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  -[SKUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v34, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  double v25 = v24;
  v26 = (void *)v38[5];
  if (v26)
  {
    uint64_t v27 = [v26 section];
    uint64_t v28 = [(id)v38[5] item];
    if (v27 < 1)
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      do
        v30 += [v17 numberOfItemsInSection:v29++];
      while (v27 != v29);
    }
    double v31 = itemWidth * 0.5
        + focusedItemHorizontalCenterOffset
        - scaledItemWidth * 0.5
        + (double)(v30 + v28) * (interItemSpacing + itemWidth)
        + (scaledItemWidth - itemWidth) * 0.5
        - focusedItemHorizontalCenterOffset;
  }
  else
  {
    double v31 = v23;
  }
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);

  double v32 = v31;
  double v33 = v25;
  result.double y = v33;
  result.double x = v32;
  return result;
}

void __106__SKUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v40[1] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIZoomingShelfCollectionViewLayout menuBarFocusedItemIndexPathWithTransitionProgress:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [(SKUIZoomingShelfCollectionViewLayout *)self collectionView];
  [v12 layoutIfNeeded];
  uint64_t v13 = [v12 indexPathsForVisibleItems];
  if (![v13 count])
  {
    [v12 contentOffset];
    if (v14 <= 0.0)
    {
      v17 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      v40[0] = v17;
      double v18 = (void **)v40;
    }
    else
    {
      uint64_t v15 = [v12 numberOfSections] - 1;
      uint64_t v16 = [v12 numberOfItemsInSection:v15];
      v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 - 1 inSection:v15];
      uint64_t v39 = v17;
      double v18 = &v39;
    }
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

    uint64_t v13 = (void *)v19;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v13;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    double v23 = 0;
    uint64_t v24 = *(void *)v35;
    double v25 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v28 = [(NSMutableDictionary *)self->_cachedLayoutAttributes objectForKey:v27];
        [v28 _zoomingImageLambda];
        double v30 = v29;
        if (fabs(v29 + -0.5) < fabs(v25 + -0.5))
        {
          id v31 = v27;

          double v25 = v30;
          double v23 = v31;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }
  else
  {
    double v23 = 0;
    double v25 = 1.79769313e308;
  }

  if (a3) {
    *a3 = v25 * 2.0 + -1.0;
  }

  return v23;
}

- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIZoomingShelfCollectionViewLayout setMenuBarFocusedItemIndexPath:withTransitionProgress:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [(SKUIZoomingShelfCollectionViewLayout *)self collectionView];
  double interItemSpacing = self->_interItemSpacing;
  double itemWidth = self->_itemWidth;
  double scaledItemWidth = self->_scaledItemWidth;
  uint64_t v19 = [v6 section];
  if (v19 < 1)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    do
      v22 += [v15 numberOfItemsInSection:v21++];
    while (v20 != v21);
  }
  double v23 = itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5
      + itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5;
  uint64_t v24 = [v6 item] + v22;
  [v15 contentOffset];
  [v15 setContentOffset:v23 * 0.5+ itemWidth * 0.5+ scaledItemWidth * -0.5+ (double)v24 * (interItemSpacing + itemWidth)+ (a4 + 1.0) * -0.5 * (v23 - (scaledItemWidth - itemWidth))];
}

- (void)setFocusedItemHorizontalCenterOffset:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIZoomingShelfCollectionViewLayout setFocusedItemHorizontalCenterOffset:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_focusedItemHorizontalCenterOffset != a3)
  {
    self->_double focusedItemHorizontalCenterOffset = a3;
    [(SKUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setLayoutData:(id)a3
{
  BOOL v5 = (SKUIShelfLayoutData *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIZoomingShelfCollectionViewLayout setLayoutData:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_layoutData != v5)
  {
    objc_storeStrong((id *)&self->_layoutData, a3);
    [(SKUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setInterItemSpacing:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIZoomingShelfCollectionViewLayout setInterItemSpacing:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_interItemSpacing != a3)
  {
    self->_double interItemSpacing = a3;
    [(SKUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setItemWidth:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIZoomingShelfCollectionViewLayout setItemWidth:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_itemWidth != a3)
  {
    self->_double itemWidth = a3;
    [(SKUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setScaledItemWidth:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIZoomingShelfCollectionViewLayout setScaledItemWidth:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_scaledItemWidth != a3)
  {
    self->_double scaledItemWidth = a3;
    [(SKUIZoomingShelfCollectionViewLayout *)self invalidateLayout];
  }
}

+ (double)snapToBoundariesDecelerationRate
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIZoomingShelfCollectionViewLayout snapToBoundariesDecelerationRate];
      }
    }
  }
  return 0.98;
}

+ (BOOL)collectionViewCanClipToBounds
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIZoomingShelfCollectionViewLayout collectionViewCanClipToBounds];
      }
    }
  }
  return 0;
}

- (SKUIShelfLayoutData)layoutData
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

+ (void)invalidationContextClass
{
}

- (void)invalidationContextForBoundsChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)invalidateLayoutWithContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)menuBarFocusedItemIndexPathWithTransitionProgress:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMenuBarFocusedItemIndexPath:(uint64_t)a3 withTransitionProgress:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFocusedItemHorizontalCenterOffset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLayoutData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setInterItemSpacing:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemWidth:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setScaledItemWidth:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)snapToBoundariesDecelerationRate
{
}

+ (void)collectionViewCanClipToBounds
{
}

@end