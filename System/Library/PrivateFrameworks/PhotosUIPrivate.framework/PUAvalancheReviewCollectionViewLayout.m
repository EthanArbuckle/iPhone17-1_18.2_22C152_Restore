@interface PUAvalancheReviewCollectionViewLayout
- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)_floatingSelectionBadgeFrameForItemFrame:(CGRect)a3 visibleItemFrame:(CGRect)a4 atIndexPath:(id)a5;
- (NSIndexPath)zoomingCellIndexPath;
- (UIOffset)sharingBadgeOffset;
- (id)_badgeLayoutAttributesForItemLayoutAttributes:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)setSharingBadgeOffset:(UIOffset)a3;
- (void)setZoomingCellIndexPath:(id)a3;
@end

@implementation PUAvalancheReviewCollectionViewLayout

- (void).cxx_destruct
{
}

- (NSIndexPath)zoomingCellIndexPath
{
  return self->_zoomingCellIndexPath;
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

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  v8 = [(PUAvalancheReviewCollectionViewLayout *)&v11 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
  if (!v8)
  {
    if ([v6 isEqualToString:@"PUAvalancheReviewBadgeKind"])
    {
      v9 = [(PUAvalancheReviewCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v7];
      v8 = [(PUAvalancheReviewCollectionViewLayout *)self _badgeLayoutAttributesForItemLayoutAttributes:v9];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  id v4 = a3;
  v5 = [(PUHorizontalCollectionViewLayout *)&v9 layoutAttributesForItemAtIndexPath:v4];
  id v6 = [(PUAvalancheReviewCollectionViewLayout *)self zoomingCellIndexPath];
  uint64_t v7 = [v4 isEqual:v6];

  [v5 setHidden:v7];
  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  id v4 = -[PUHorizontalCollectionViewLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      objc_super v9 = [v5 objectAtIndexedSubscript:i];
      v10 = [v9 indexPath];
      objc_super v11 = [(PUAvalancheReviewCollectionViewLayout *)self zoomingCellIndexPath];
      objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "isEqual:", v11));

      v12 = [(PUAvalancheReviewCollectionViewLayout *)self _badgeLayoutAttributesForItemLayoutAttributes:v9];
      [v5 addObject:v12];
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
  v5 = [(PUAvalancheReviewCollectionViewLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  return v9 != height || v7 != width;
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (id)_badgeLayoutAttributesForItemLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 indexPath];
  double v6 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:@"PUAvalancheReviewBadgeKind" withIndexPath:v5];
  double v7 = [(PUAvalancheReviewCollectionViewLayout *)self collectionView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [v4 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v33.origin.double x = v9;
  v33.origin.double y = v11;
  v33.size.double width = v13;
  v33.size.double height = v15;
  v36.origin.double x = v17;
  v36.origin.double y = v19;
  v36.size.double width = v21;
  v36.size.double height = v23;
  CGRect v34 = CGRectIntersection(v33, v36);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  if (CGRectIsNull(v34))
  {
    double height = v23;
    double width = v21;
    double y = v19;
    double x = v17;
  }
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  if (CGRectIsEmpty(v35))
  {
    uint64_t v28 = 1;
  }
  else
  {
    v29 = [v6 indexPath];
    v30 = [(PUAvalancheReviewCollectionViewLayout *)self zoomingCellIndexPath];
    uint64_t v28 = [v29 isEqual:v30];
  }
  [v6 setHidden:v28];
  -[PUAvalancheReviewCollectionViewLayout _floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:](self, "_floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:", v5, v17, v19, v21, v23, x, y, width, height);
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setZIndex:", objc_msgSend(v4, "zIndex") + 1);
  [v6 setAlpha:1.0];

  return v6;
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
  [(PUAvalancheReviewCollectionViewLayout *)self sharingBadgeOffset];
  double v13 = v12;
  double v14 = [(PUAvalancheReviewCollectionViewLayout *)self collectionView];
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

- (void)setZoomingCellIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  if (self->_zoomingCellIndexPath != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_zoomingCellIndexPath, a3);
    [(PUAvalancheReviewCollectionViewLayout *)self invalidateLayout];
    v5 = v6;
  }
}

@end