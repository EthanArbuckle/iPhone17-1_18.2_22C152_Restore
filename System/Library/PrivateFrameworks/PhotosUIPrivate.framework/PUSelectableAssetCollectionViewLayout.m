@interface PUSelectableAssetCollectionViewLayout
- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)_floatingSelectionBadgeFrameForItemFrame:(CGRect)a3 visibleItemFrame:(CGRect)a4 atIndexPath:(id)a5;
- (CGRect)collectionViewBounds;
- (CGSize)layoutReferenceSize;
- (NSSet)floatingCellIndexPaths;
- (UIOffset)sharingBadgeOffset;
- (id)_badgeLayoutAttributesForItemLayoutAttributes:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)setFloatingCellIndexPaths:(id)a3;
- (void)setLayoutReferenceSize:(CGSize)a3;
- (void)setSharingBadgeOffset:(UIOffset)a3;
@end

@implementation PUSelectableAssetCollectionViewLayout

- (void).cxx_destruct
{
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSSet)floatingCellIndexPaths
{
  return self->_floatingCellIndexPaths;
}

- (void)setSharingBadgeOffset:(UIOffset)a3
{
  self->_sharingBadgeOffset = a3;
}

- (UIOffset)sharingBadgeOffset
{
  double horizontal = self->_sharingBadgeOffset.horizontal;
  double vertical = self->_sharingBadgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (CGRect)collectionViewBounds
{
  [(PUSelectableAssetCollectionViewLayout *)self layoutReferenceSize];
  double v4 = v3;
  double v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  [(PUHorizontalCollectionViewLayout *)&v11 collectionViewBounds];
  if (v4 != *MEMORY[0x1E4F1DB30] || v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v9 = v4;
    double v10 = v6;
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  p_layoutReferenceSize = &self->_layoutReferenceSize;
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  if (width == a3.width && height == a3.height) {
    return;
  }
  p_layoutReferenceSize->double width = a3.width;
  self->_layoutReferenceSize.double height = a3.height;
  double v8 = [(PUSelectableAssetCollectionViewLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = p_layoutReferenceSize->height;
  if (p_layoutReferenceSize->width == *MEMORY[0x1E4F1DB30] && v13 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (width != v10 || height != v12) {
      goto LABEL_13;
    }
  }
  else if (p_layoutReferenceSize->width != v10 || v13 != v12)
  {
LABEL_13:
    [(PUSelectableAssetCollectionViewLayout *)self invalidateLayout];
  }
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  double v8 = [(PUSelectableAssetCollectionViewLayout *)&v11 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
  if (!v8)
  {
    if ([v6 isEqualToString:@"PUSelectableAssetBadgeKind"])
    {
      double v9 = [(PUSelectableAssetCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v7];
      double v8 = [(PUSelectableAssetCollectionViewLayout *)self _badgeLayoutAttributesForItemLayoutAttributes:v9];
    }
    else
    {
      double v8 = 0;
    }
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  id v4 = a3;
  double v5 = [(PUHorizontalCollectionViewLayout *)&v10 layoutAttributesForItemAtIndexPath:v4];
  id v6 = [(PUSelectableAssetCollectionViewLayout *)self floatingCellIndexPaths];
  id v7 = [v6 member:v4];

  double v8 = 0.0;
  if (!v7) {
    double v8 = 1.0;
  }
  [v5 setAlpha:v8];
  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  id v4 = -[PUHorizontalCollectionViewLayout layoutAttributesForElementsInRect:](&v16, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      double v9 = [v5 objectAtIndexedSubscript:i];
      objc_super v10 = [(PUSelectableAssetCollectionViewLayout *)self floatingCellIndexPaths];
      objc_super v11 = [v9 indexPath];
      double v12 = [v10 member:v11];

      if (v12) {
        double v13 = 0.0;
      }
      else {
        double v13 = 1.0;
      }
      [v9 setAlpha:v13];
      v14 = [(PUSelectableAssetCollectionViewLayout *)self _badgeLayoutAttributesForItemLayoutAttributes:v9];
      [v5 addObject:v14];
    }
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(PUSelectableAssetCollectionViewLayout *)self collectionViewBounds];
  return v6 != height || v5 != width;
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (id)_badgeLayoutAttributesForItemLayoutAttributes:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 indexPath];
    uint64_t v7 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:@"PUSelectableAssetBadgeKind" withIndexPath:v6];
    [(PUSelectableAssetCollectionViewLayout *)self collectionViewBounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v5 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v41.origin.double x = v9;
    v41.origin.double y = v11;
    v41.size.double width = v13;
    v41.size.double height = v15;
    v43.origin.double x = v17;
    v43.origin.double y = v19;
    v43.size.double width = v21;
    v43.size.double height = v23;
    CGRect v42 = CGRectIntersection(v41, v43);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    BOOL IsNull = CGRectIsNull(v42);
    if (IsNull) {
      double v29 = v23;
    }
    else {
      double v29 = height;
    }
    if (IsNull)
    {
      double width = v21;
      double y = v19;
      double v30 = v17;
    }
    else
    {
      double v30 = x;
    }
    double v31 = v30;
    double v32 = y;
    double v33 = width;
    double v39 = v29;
    double v34 = 0.0;
    if (!CGRectIsEmpty(*(CGRect *)(&v29 - 3)))
    {
      v35 = [(PUSelectableAssetCollectionViewLayout *)self floatingCellIndexPaths];
      v36 = [v7 indexPath];
      v37 = [v35 member:v36];
      if (v37) {
        double v34 = 0.0;
      }
      else {
        double v34 = 1.0;
      }
    }
    [v7 setAlpha:v34];
    -[PUSelectableAssetCollectionViewLayout _floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:](self, "_floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:", v6, v17, v19, v21, v23, v30, y, width, v39);
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setZIndex:", objc_msgSend(v5, "zIndex") + 1);
    [v7 setAlpha:1.0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (CGRect)_floatingSelectionBadgeFrameForItemFrame:(CGRect)a3 visibleItemFrame:(CGRect)a4 atIndexPath:(id)a5
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat v42 = a3.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  CGFloat v41 = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  id v11 = a5;
  [(PUSelectableAssetCollectionViewLayout *)self sharingBadgeOffset];
  double v13 = v12;
  double v14 = [(PUSelectableAssetCollectionViewLayout *)self collectionView];
  CGFloat v15 = [(PUHorizontalCollectionViewLayout *)self delegate];
  CGFloat v39 = v9;
  objc_msgSend(v15, "layout:collectionView:selectionBadgeFrameForItemFrame:atIndexPath:", self, v14, v11, v9, v8, v7, v6);
  double v17 = v16;
  double v19 = v18;
  CGFloat v40 = v20;
  CGFloat rect = v21;

  double v22 = v9 + v17;
  double v23 = v8 + v19;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v38 = v13;
  double v24 = v13 + CGRectGetMinX(v47);
  if (v9 + v17 >= v24) {
    double v25 = v9 + v17;
  }
  else {
    double v25 = v24;
  }
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v48);
  v49.origin.CGFloat x = v22;
  v49.origin.CGFloat y = v23;
  v49.size.CGFloat width = v40;
  v49.size.CGFloat height = rect;
  double v27 = MaxX - CGRectGetWidth(v49) - v13;
  if (v25 >= v27) {
    double v28 = v27;
  }
  else {
    double v28 = v25;
  }
  v50.origin.CGFloat x = v39;
  v50.origin.CGFloat y = v8;
  v50.size.CGFloat width = v41;
  v50.size.CGFloat height = v42;
  double v29 = v13 + CGRectGetMinX(v50);
  if (v28 >= v29) {
    double v30 = v28;
  }
  else {
    double v30 = v29;
  }
  v51.origin.CGFloat x = v39;
  v51.origin.CGFloat y = v8;
  v51.size.CGFloat width = v41;
  v51.size.CGFloat height = v42;
  double v31 = CGRectGetMaxX(v51);
  v52.origin.CGFloat x = v28;
  v52.origin.CGFloat y = v23;
  v52.size.CGFloat width = v40;
  v52.size.CGFloat height = rect;
  double v32 = v31 - CGRectGetWidth(v52) - v38;
  if (v30 >= v32) {
    double v33 = v32;
  }
  else {
    double v33 = v30;
  }

  double v34 = v33;
  double v35 = v23;
  double v36 = v40;
  double v37 = rect;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (void)setFloatingCellIndexPaths:(id)a3
{
  double v8 = (NSSet *)a3;
  double v5 = self->_floatingCellIndexPaths;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_floatingCellIndexPaths, a3);
      [(PUSelectableAssetCollectionViewLayout *)self invalidateLayout];
    }
  }
}

@end