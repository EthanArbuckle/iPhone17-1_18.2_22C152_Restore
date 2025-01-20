@interface PUPhotosSharingCollectionViewLayout
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (NSIndexPath)zoomingCellIndexPath;
- (UIOffset)sharingBadgesOffset;
- (double)_floatingBadgeOffsetForBadgesContainerFrame:(CGFloat)a3 ItemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5;
- (id)_sublayoutForItemLayoutAttributes:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (unint64_t)sharingBadgesCorner;
- (void)_floatingBadgeContainerFrameForBadgeContainerFrame:(CGFloat)a3 itemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5;
- (void)invalidateCachedLayout;
- (void)setSharingBadgesCorner:(unint64_t)a3;
- (void)setSharingBadgesOffset:(UIOffset)a3;
- (void)setZoomingCellIndexPath:(id)a3;
@end

@implementation PUPhotosSharingCollectionViewLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingCellIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedItemSublayouts, 0);
}

- (NSIndexPath)zoomingCellIndexPath
{
  return self->_zoomingCellIndexPath;
}

- (void)setSharingBadgesCorner:(unint64_t)a3
{
  self->_sharingBadgesCorner = a3;
}

- (unint64_t)sharingBadgesCorner
{
  return self->_sharingBadgesCorner;
}

- (void)setSharingBadgesOffset:(UIOffset)a3
{
  self->_sharingBadgesOffset = a3;
}

- (UIOffset)sharingBadgesOffset
{
  double horizontal = self->_sharingBadgesOffset.horizontal;
  double vertical = self->_sharingBadgesOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  v8 = [(PUPhotosSharingCollectionViewLayout *)&v13 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
  if (!v8)
  {
    v9 = [(PUPhotosSharingCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v7];
    v10 = [(PUPhotosSharingCollectionViewLayout *)self _sublayoutForItemLayoutAttributes:v9];
    if ([v6 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"])
    {
      uint64_t v11 = [v10 selectionBadgeLayoutAttributes];
    }
    else
    {
      if (![v6 isEqualToString:@"PUPhotosSharingOptionBadgeKind"])
      {
        v8 = 0;
        goto LABEL_8;
      }
      uint64_t v11 = [v10 optionBadgeLayoutAttributes];
    }
    v8 = (void *)v11;
LABEL_8:
  }
  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  id v4 = a3;
  v5 = [(PUHorizontalTiledCollectionViewLayout *)&v9 layoutAttributesForItemAtIndexPath:v4];
  id v6 = [(PUPhotosSharingCollectionViewLayout *)self zoomingCellIndexPath];
  uint64_t v7 = [v4 isEqual:v6];

  [v5 setHidden:v7];
  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  id v4 = -[PUHorizontalTiledCollectionViewLayout layoutAttributesForElementsInRect:](&v16, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      objc_super v9 = [v5 objectAtIndexedSubscript:i];
      v10 = [v9 indexPath];
      uint64_t v11 = [(PUPhotosSharingCollectionViewLayout *)self zoomingCellIndexPath];
      objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "isEqual:", v11));

      v12 = [(PUPhotosSharingCollectionViewLayout *)self _sublayoutForItemLayoutAttributes:v9];
      objc_super v13 = [v12 selectionBadgeLayoutAttributes];
      [v5 addObject:v13];

      v14 = [v12 optionBadgeLayoutAttributes];
      [v5 addObject:v14];
    }
  }
  return v5;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  v8 = -[PUHorizontalTiledCollectionViewLayout invalidationContextForBoundsChange:](&v45, sel_invalidationContextForBoundsChange_);
  objc_super v9 = [(PUPhotosSharingCollectionViewLayout *)self collectionView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v49.origin.CGFloat x = v11;
  v49.origin.CGFloat y = v13;
  v49.size.CGFloat width = v15;
  v49.size.CGFloat height = v17;
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  if (CGRectIntersectsRect(v49, v53) && ([v8 invalidateCachedLayout] & 1) == 0)
  {
    v50.origin.CGFloat x = v11;
    v50.origin.CGFloat y = v13;
    v50.size.CGFloat width = v15;
    v50.size.CGFloat height = v17;
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    CGRect v51 = CGRectUnion(v50, v54);
    v18 = -[PUHorizontalTiledCollectionViewLayout layoutAttributesForItemsInRect:](self, "layoutAttributesForItemsInRect:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
    if ([v18 count])
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            v26 = objc_msgSend(v25, "indexPath", (void)v41);
            v27 = [(PUPhotosSharingCollectionViewLayout *)self _sublayoutForItemLayoutAttributes:v25];
            [v27 badgesContainerFrame];
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            [v27 floatingBadgesContainerFrame];
            v55.origin.CGFloat x = v36;
            v55.origin.CGFloat y = v37;
            v55.size.CGFloat width = v38;
            v55.size.CGFloat height = v39;
            v52.origin.CGFloat x = v29;
            v52.origin.CGFloat y = v31;
            v52.size.CGFloat width = v33;
            v52.size.CGFloat height = v35;
            if (!CGRectEqualToRect(v52, v55)) {
              [v19 addObject:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v22);
      }

      if ([v19 count])
      {
        [v8 invalidateSupplementaryElementsOfKind:@"PUPhotosSharingSelectionBadgeKind" atIndexPaths:v19];
        [v8 invalidateSupplementaryElementsOfKind:@"PUPhotosSharingOptionBadgeKind" atIndexPaths:v19];
      }
    }
  }
  return v8;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (void)invalidateCachedLayout
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  [(PUHorizontalTiledCollectionViewLayout *)&v4 invalidateCachedLayout];
  cachedItemSublayouts = self->_cachedItemSublayouts;
  self->_cachedItemSublayouts = 0;
}

- (id)_sublayoutForItemLayoutAttributes:(id)a3
{
  id v4 = a3;
  if (!self->_cachedItemSublayouts)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedItemSublayouts = self->_cachedItemSublayouts;
    self->_cachedItemSublayouts = v5;
  }
  [v4 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  CGFloat v15 = [v4 indexPath];
  double v16 = [(NSMutableDictionary *)self->_cachedItemSublayouts objectForKey:v15];
  CGFloat v17 = v16;
  if (v16)
  {
    [(PUPhotosSharingCollectionViewItemSublayout *)v16 itemFrame];
    v75.origin.double x = v18;
    v75.origin.double y = v19;
    v75.size.double width = v20;
    v75.size.double height = v21;
    v67.origin.double x = v8;
    v67.origin.double y = v10;
    v67.size.double width = v12;
    v67.size.double height = v14;
    if (!CGRectEqualToRect(v67, v75))
    {
      [(NSMutableDictionary *)self->_cachedItemSublayouts removeObjectForKey:v15];

      CGFloat v17 = 0;
    }
  }
  uint64_t v22 = [(PUPhotosSharingCollectionViewLayout *)self collectionView];
  uint64_t v23 = [(PUHorizontalTiledCollectionViewLayout *)self delegate];
  if (!v17)
  {
    CGFloat v17 = -[PUPhotosSharingCollectionViewItemSublayout initWithIndexPath:itemFrame:]([PUPhotosSharingCollectionViewItemSublayout alloc], "initWithIndexPath:itemFrame:", v15, v8, v10, v12, v14);
    [v23 layout:self collectionView:v22 sizeForBadgeViewOfKind:@"PUPhotosSharingSelectionBadgeKind" forItemAtIndexPath:v15];
    -[PUPhotosSharingCollectionViewItemSublayout setSelectionBadgeSize:](v17, "setSelectionBadgeSize:");
    [v23 layout:self collectionView:v22 sizeForBadgeViewOfKind:@"PUPhotosSharingOptionBadgeKind" forItemAtIndexPath:v15];
    -[PUPhotosSharingCollectionViewItemSublayout setOptionBadgeSize:](v17, "setOptionBadgeSize:");
    [v23 layout:self collectionView:v22 bottomBadgeInsetforItemAtIndexPath:v15];
    -[PUPhotosSharingCollectionViewItemSublayout setBottomBadgeInset:](v17, "setBottomBadgeInset:");
    [(PUPhotosSharingCollectionViewItemSublayout *)v17 setBadgesCorner:[(PUPhotosSharingCollectionViewLayout *)self sharingBadgesCorner]];
    [(PUPhotosSharingCollectionViewLayout *)self sharingBadgesOffset];
    -[PUPhotosSharingCollectionViewItemSublayout setBadgesOffset:](v17, "setBadgesOffset:");
    [(PUPhotosSharingCollectionViewItemSublayout *)v17 prepareSublayout];
    [(NSMutableDictionary *)self->_cachedItemSublayouts setObject:v17 forKey:v15];
  }
  v24 = [(PUPhotosSharingCollectionViewLayout *)self collectionView];
  [v24 bounds];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v68.origin.double x = v26;
  v68.origin.double y = v28;
  v68.size.double width = v30;
  v68.size.double height = v32;
  v76.origin.double x = v8;
  v76.origin.double y = v10;
  v76.size.double width = v12;
  v76.size.double height = v14;
  CGRect v69 = CGRectIntersection(v68, v76);
  double x = v69.origin.x;
  double y = v69.origin.y;
  double width = v69.size.width;
  double height = v69.size.height;
  [(PUPhotosSharingCollectionViewItemSublayout *)v17 visibleItemFrame];
  v77.origin.double x = v37;
  v77.origin.double y = v38;
  v77.size.double width = v39;
  v77.size.double height = v40;
  v70.origin.double x = x;
  v70.origin.double y = y;
  v70.size.double width = width;
  v70.size.double height = height;
  if (!CGRectEqualToRect(v70, v77))
  {
    -[PUPhotosSharingCollectionViewItemSublayout setVisibleItemFrame:](v17, "setVisibleItemFrame:", x, y, width, height);
    objc_msgSend(v23, "layout:collectionView:itemAtIndexPath:didChangeToVisibleFrame:", self, v22, v15, x, y, width, height);
  }
  v71.origin.double x = x;
  v71.origin.double y = y;
  v71.size.double width = width;
  v71.size.double height = height;
  BOOL IsNull = CGRectIsNull(v71);
  if (IsNull)
  {
    double x = v8;
    double y = v10;
  }
  CGFloat v63 = x;
  CGFloat v64 = y;
  if (IsNull) {
    double width = v12;
  }
  CGFloat rect = width;
  if (IsNull) {
    double height = v14;
  }
  [(PUPhotosSharingCollectionViewItemSublayout *)v17 badgesContainerFrame];
  -[PUPhotosSharingCollectionViewLayout _floatingBadgeOffsetForBadgesContainerFrame:ItemFrame:visibleItemFrame:](self, "_floatingBadgeOffsetForBadgesContainerFrame:ItemFrame:visibleItemFrame:", *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  -[PUPhotosSharingCollectionViewItemSublayout setFloatingOffset:](v17, "setFloatingOffset:");
  long long v42 = [(PUPhotosSharingCollectionViewItemSublayout *)v17 optionBadgeLayoutAttributes];
  [v42 frame];
  double v44 = v43;
  double v46 = v45;

  v72.origin.double x = v8;
  v72.origin.double y = v10;
  v72.size.double width = v12;
  v72.size.double height = v14;
  CGFloat v47 = v14;
  CGFloat v48 = v12;
  double MinX = CGRectGetMinX(v72);
  [(PUPhotosSharingCollectionViewItemSublayout *)v17 badgesOffset];
  double v51 = MinX + v50;
  v73.origin.double x = v8;
  v73.origin.double y = v10;
  v73.size.double width = v48;
  v73.size.double height = v47;
  double MinY = CGRectGetMinY(v73);
  [(PUPhotosSharingCollectionViewItemSublayout *)v17 badgesOffset];
  double v54 = MinY + v53;
  CGRect v55 = [(PUPhotosSharingCollectionViewItemSublayout *)v17 optionBadgeLayoutAttributes];
  objc_msgSend(v55, "setFrame:", v51, v54, v44, v46);

  v56 = [(PUPhotosSharingCollectionViewItemSublayout *)v17 selectionBadgeLayoutAttributes];
  v57 = [(PUPhotosSharingCollectionViewItemSublayout *)v17 optionBadgeLayoutAttributes];
  v74.origin.double x = v63;
  v74.origin.double y = v64;
  v74.size.double width = rect;
  v74.size.double height = height;
  if (CGRectIsEmpty(v74))
  {
    uint64_t v58 = 1;
  }
  else
  {
    v59 = [v4 indexPath];
    v60 = [(PUPhotosSharingCollectionViewLayout *)self zoomingCellIndexPath];
    uint64_t v58 = [v59 isEqual:v60];
  }
  [v56 setHidden:v58];
  [v57 setHidden:v58];
  uint64_t v61 = [v4 zIndex] + 1;
  [v56 setZIndex:v61];
  [v57 setZIndex:v61];
  [v56 setAlpha:1.0];
  [v57 setAlpha:1.0];

  return v17;
}

- (double)_floatingBadgeOffsetForBadgesContainerFrame:(CGFloat)a3 ItemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5
{
  CGFloat v21 = [a1 collectionView];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  CGFloat v30 = [a1 collectionView];
  [v30 safeAreaInsets];
  PXEdgeInsetsForEdges();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  objc_msgSend(a1, "_floatingBadgeContainerFrameForBadgeContainerFrame:itemFrame:visibleItemFrame:", a2, a3, a4, a5, a6, a7, a8, a9, v23 + v34, v25 + v32, v27 - (v34 + v38), v29 - (v32 + v36));
  CGFloat x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  if (CGRectIsEmpty(v58))
  {
    objc_msgSend(a1, "_floatingBadgeContainerFrameForBadgeContainerFrame:itemFrame:visibleItemFrame:", a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19, a20);
    CGFloat x = v43;
    CGFloat y = v44;
    CGFloat width = v45;
    CGFloat height = v46;
  }
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v59);
  v60.origin.CGFloat x = a2;
  v60.origin.CGFloat y = a3;
  v60.size.CGFloat width = a4;
  v60.size.CGFloat height = a5;
  double v48 = MinX - CGRectGetMinX(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  CGRectGetMinY(v61);
  v62.origin.CGFloat y = a3;
  v62.origin.CGFloat x = a2;
  v62.size.CGFloat width = a4;
  v62.size.CGFloat height = a5;
  CGRectGetMinY(v62);
  return v48;
}

- (void)_floatingBadgeContainerFrameForBadgeContainerFrame:(CGFloat)a3 itemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5
{
  *(double *)&v31[16] = a8;
  *(double *)&v31[24] = a9;
  *(double *)double v31 = a6;
  *(double *)&v31[8] = a7;
  [a1 sharingBadgesOffset];
  double v23 = v22;
  v33.origin.CGFloat x = a10;
  v33.origin.CGFloat y = a11;
  v33.size.CGFloat width = a12;
  v33.size.CGFloat height = a13;
  double v24 = CGRectGetMinX(v33) + v23;
  if (a2 >= v24) {
    double v25 = a2;
  }
  else {
    double v25 = v24;
  }
  v34.origin.CGFloat x = a10;
  v34.origin.CGFloat y = a11;
  v34.size.CGFloat width = a12;
  v34.size.CGFloat height = a13;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.CGFloat x = a2;
  v35.origin.CGFloat y = a3;
  v35.size.CGFloat width = a4;
  v35.size.CGFloat height = a5;
  double v27 = MaxX - CGRectGetWidth(v35) - v23;
  if (v25 >= v27) {
    CGFloat v28 = v27;
  }
  else {
    CGFloat v28 = v25;
  }
  CGRectGetMinX(*(CGRect *)v31);
  CGRectGetMaxX(*(CGRect *)v31);
  v36.origin.CGFloat x = v28;
  v36.origin.CGFloat y = a3;
  v36.size.CGFloat width = a4;
  v36.size.CGFloat height = a5;
  CGRectGetWidth(v36);
}

- (void)setZoomingCellIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  if (self->_zoomingCellIndexPath != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_zoomingCellIndexPath, a3);
    [(PUPhotosSharingCollectionViewLayout *)self invalidateLayout];
    v5 = v6;
  }
}

@end