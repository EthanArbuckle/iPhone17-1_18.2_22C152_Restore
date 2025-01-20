@interface PUHorizontalTiledCollectionViewLayout
+ (Class)invalidationContextClass;
- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3;
- (BOOL)_updateLayoutData:(id)a3 inDirection:(int64_t)a4 outDeltaOriginX:(double *)a5;
- (BOOL)hasReferenceIndexPath;
- (CGSize)collectionViewContentSize;
- (PUHorizontalTiledCollectionViewLayout)init;
- (PUHorizontalTiledCollectionViewLayoutDelegate)delegate;
- (UIEdgeInsets)itemsContentInset;
- (double)interitemSpacing;
- (id)_layoutAttributesForItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForItemsInRect:(CGRect)a3;
- (void)_ensureIndexPath:(id)a3 inData:(id)a4;
- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginX:(double *)a5;
- (void)invalidateCachedLayout;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setDelegate:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setItemsContentInset:(UIEdgeInsets)a3;
@end

@implementation PUHorizontalTiledCollectionViewLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dummyAttrs, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUHorizontalTiledCollectionViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUHorizontalTiledCollectionViewLayoutDelegate *)WeakRetained;
}

- (UIEdgeInsets)itemsContentInset
{
  double top = self->_itemsContentInset.top;
  double left = self->_itemsContentInset.left;
  double bottom = self->_itemsContentInset.bottom;
  double right = self->_itemsContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [(PUHorizontalTiledCollectionViewLayout *)self _ensureIndexPath:v5 inData:data];
  v6 = [(PUHorizontalTiledCollectionViewLayout *)self _layoutAttributesForItemAtIndexPath:v5];

  return v6;
}

- (CGSize)collectionViewContentSize
{
  [(PUCollectionViewData *)self->_data currentContentBounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MaxX = CGRectGetMaxX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v14);
  [(PUHorizontalTiledCollectionViewLayout *)self itemsContentInset];
  double v10 = MaxX + v9;
  double v11 = MaxY;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)prepareLayout
{
  id v3 = [(PUHorizontalTiledCollectionViewLayout *)self collectionView];
  [v3 bounds];
  -[PUHorizontalTiledCollectionViewLayout _ensureRect:inData:outDeltaOriginX:](self, "_ensureRect:inData:outDeltaOriginX:", self->_data, 0);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  [(PUHorizontalTiledCollectionViewLayout *)&v5 invalidateLayoutWithContext:v4];
  if (([v4 invalidateCachedLayout] & 1) != 0
    || ([v4 invalidateDataSourceCounts] & 1) != 0
    || [v4 invalidateEverything])
  {
    [(PUHorizontalTiledCollectionViewLayout *)self invalidateCachedLayout];
  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  v8 = -[PUHorizontalTiledCollectionViewLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_);
  BOOL v9 = ([v8 invalidateDataSourceCounts] & 1) != 0
    || ([v8 invalidateEverything] & 1) != 0
    || -[PUHorizontalTiledCollectionViewLayout _shouldInvalidateCachedLayoutForBoundsChange:](self, "_shouldInvalidateCachedLayoutForBoundsChange:", x, y, width, height);
  [v8 _setInvalidateCachedLayout:v9];
  return v8;
}

- (id)layoutAttributesForItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v15 = 0.0;
  -[PUHorizontalTiledCollectionViewLayout _ensureRect:inData:outDeltaOriginX:](self, "_ensureRect:inData:outDeltaOriginX:", self->_data, &v15);
  -[UICollectionViewLayoutAttributes setFrame:](self->_dummyAttrs, "setFrame:", x + v15, y, width, height);
  v8 = [(PUCollectionViewData *)self->_data itemLayoutAttributes];
  uint64_t v9 = [v8 count];
  uint64_t v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", self->_dummyAttrs, 0, v9, 256, &__block_literal_global_29746);
  objc_super v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v10;
    uint64_t v13 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", self->_dummyAttrs, v10, v9 - v10, 512, &__block_literal_global_29746);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v11 = 0;
    }
    else
    {
      objc_super v11 = objc_msgSend(v8, "subarrayWithRange:", v12, v13 - v12 + 1);
    }
  }

  return v11;
}

uint64_t __72__PUHorizontalTiledCollectionViewLayout_layoutAttributesForItemsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  CGFloat rect = v6;
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.double x = v14;
  v26.origin.double y = v16;
  v26.size.double width = v18;
  v26.size.double height = v20;
  if (MaxX < CGRectGetMinX(v26)) {
    return -1;
  }
  v27.origin.double x = rect;
  v27.origin.double y = v8;
  v27.size.double width = v10;
  v27.size.double height = v12;
  double MinX = CGRectGetMinX(v27);
  v28.origin.double x = v14;
  v28.origin.double y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  return MinX > CGRectGetMaxX(v28);
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  id v4 = [(PUHorizontalTiledCollectionViewLayout *)self collectionView];
  [v4 bounds];
  double v6 = v5;

  return v6 != height;
}

- (void)invalidateCachedLayout
{
}

- (BOOL)hasReferenceIndexPath
{
  return [(PUCollectionViewData *)self->_data hasReferenceIndexPath];
}

- (void)setItemsContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PUHorizontalTiledCollectionViewLayout *)self itemsContentInset];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_itemsContentInset.double top = top;
    self->_itemsContentInset.double left = left;
    self->_itemsContentInset.double bottom = bottom;
    self->_itemsContentInset.double right = right;
    [(PUHorizontalTiledCollectionViewLayout *)self invalidateCachedLayout];
    [(PUHorizontalTiledCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setInteritemSpacing:(double)a3
{
  [(PUHorizontalTiledCollectionViewLayout *)self interitemSpacing];
  if (v5 != a3)
  {
    self->_interitemSpacing = a3;
    [(PUHorizontalTiledCollectionViewLayout *)self invalidateCachedLayout];
    [(PUHorizontalTiledCollectionViewLayout *)self invalidateLayout];
  }
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  data = self->_data;
  id v4 = a3;
  double v5 = [(PUCollectionViewData *)data itemLayoutAttributesByIndexPath];
  double v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_ensureIndexPath:(id)a3 inData:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  double v7 = [v6 itemLayoutAttributes];
  uint64_t v8 = [v7 count];

  if (!v8) {
    [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v6 inDirection:1 outDeltaOriginX:0];
  }
  double v9 = [v6 itemLayoutAttributes];
  double v10 = [v9 firstObject];
  double v11 = [v10 indexPath];

  while ([v23 compare:v11] == -1)
  {
    BOOL v12 = [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v6 inDirection:-1 outDeltaOriginX:0];
    double v13 = [v6 itemLayoutAttributes];
    CGFloat v14 = [v13 firstObject];
    double v15 = [v14 indexPath];

    double v11 = v15;
    if (!v12) {
      goto LABEL_8;
    }
  }
  double v15 = v11;
LABEL_8:
  CGFloat v16 = [v6 itemLayoutAttributes];
  double v17 = [v16 lastObject];
  CGFloat v18 = [v17 indexPath];

  while ([v23 compare:v18] == 1)
  {
    BOOL v19 = [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v6 inDirection:1 outDeltaOriginX:0];
    CGFloat v20 = [v6 itemLayoutAttributes];
    v21 = [v20 lastObject];
    v22 = [v21 indexPath];

    CGFloat v18 = v22;
    if (!v19) {
      goto LABEL_13;
    }
  }
  v22 = v18;
LABEL_13:
}

- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginX:(double *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat rect = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  double v11 = v10;
  if (width < 0.0 || height < 0.0)
  {
    if (a5) {
      *a5 = 0.0;
    }
  }
  else
  {
    double v35 = 0.0;
    [v10 currentContentBounds];
    CGFloat v12 = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat v14 = v36.size.width;
    CGFloat v15 = v36.size.height;
    if (CGRectIsEmpty(v36))
    {
      [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v11 inDirection:1 outDeltaOriginX:&v35];
      [v11 currentContentBounds];
      CGFloat v12 = v16;
      CGFloat y = v17;
      CGFloat v14 = v18;
      CGFloat v15 = v19;
      double v20 = v35;
    }
    else
    {
      double v20 = 0.0;
    }
    double v21 = x + v20;
    do
    {
      v37.origin.double x = v21;
      v37.origin.CGFloat y = rect;
      v37.size.double width = width;
      v37.size.double height = height;
      double MinX = CGRectGetMinX(v37);
      v38.origin.double x = v12;
      v38.origin.CGFloat y = y;
      v38.size.double width = v14;
      v38.size.double height = v15;
      if (MinX >= CGRectGetMinX(v38)) {
        break;
      }
      BOOL v23 = [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v11 inDirection:-1 outDeltaOriginX:&v35];
      double v21 = v21 + v35;
      [v11 currentContentBounds];
      CGFloat v12 = v24;
      CGFloat y = v25;
      CGFloat v14 = v26;
      CGFloat v15 = v27;
    }
    while (v23);
    do
    {
      v39.origin.double x = v21;
      v39.origin.CGFloat y = rect;
      v39.size.double width = width;
      v39.size.double height = height;
      double MaxX = CGRectGetMaxX(v39);
      v40.origin.double x = v12;
      v40.origin.CGFloat y = y;
      v40.size.double width = v14;
      v40.size.double height = v15;
      if (MaxX <= CGRectGetMaxX(v40)) {
        break;
      }
      BOOL v28 = [(PUHorizontalTiledCollectionViewLayout *)self _updateLayoutData:v11 inDirection:1 outDeltaOriginX:&v35];
      double v21 = v21 + v35;
      [v11 currentContentBounds];
      CGFloat v12 = v29;
      CGFloat y = v30;
      CGFloat v14 = v31;
      CGFloat v15 = v32;
    }
    while (v28);
  }
}

- (BOOL)_updateLayoutData:(id)a3 inDirection:(int64_t)a4 outDeltaOriginX:(double *)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  double v9 = (PUCollectionViewData *)a3;
  v97 = [(PUHorizontalTiledCollectionViewLayout *)self delegate];
  v95 = self;
  id v10 = [(PUHorizontalTiledCollectionViewLayout *)self collectionView];
  [v10 bounds];
  double v85 = v11;
  CGFloat v13 = v12;
  double v89 = v15;
  double v90 = v14;
  uint64_t v16 = [(PUCollectionViewData *)v9 cachedPageCount];
  [(PUCollectionViewData *)v9 currentContentBounds];
  double MidX = v17;
  double MidY = v19;
  double width = v21;
  double height = v23;
  double v25 = [(PUCollectionViewData *)v9 itemLayoutAttributes];
  v96 = [(PUCollectionViewData *)v9 itemLayoutAttributesByIndexPath];
  if (a4 == 1) {
    [v25 lastObject];
  }
  else {
  double v26 = [v25 firstObject];
  }
  double v27 = [v26 indexPath];
  [v26 frame];
  CGFloat v98 = v29;
  CGFloat v99 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  double v107 = 0.0;
  BOOL v34 = v26 == 0;
  if (!v26)
  {
    if ([v25 count]
      || [v96 count]
      || (v110.origin.double x = MidX,
          v110.origin.CGFloat y = MidY,
          v110.size.double width = width,
          v110.size.double height = height,
          !CGRectIsEmpty(v110)))
    {
      v102 = [MEMORY[0x1E4F28B00] currentHandler];
      [v102 handleFailureInMethod:a2 object:v95 file:@"PUHorizontalTiledCollectionViewLayout.m" lineNumber:114 description:0];
    }
    double v35 = [v97 layout:v95 collectionView:v10 referenceIndexPathWithOffsetX:&v107];

    v111.origin.double x = v85;
    v111.origin.CGFloat y = v13;
    v111.size.double width = v90;
    v111.size.double height = v89;
    double MidX = CGRectGetMidX(v111);
    v112.origin.double x = v85;
    v112.origin.CGFloat y = v13;
    v112.size.double width = v90;
    v112.size.double height = v89;
    double MidY = CGRectGetMidY(v112);
    double height = 0.0;
    double width = 0.0;
    if (v35) {
      goto LABEL_6;
    }
LABEL_12:
    char v51 = 0;
    double v52 = 0.0;
    if (!a5) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  double v35 = [v10 next:a4 indexPathFromIndexPath:v27];

  if (!v35) {
    goto LABEL_12;
  }
LABEL_6:
  double v84 = v13;
  v88 = a5;
  [(PUHorizontalTiledCollectionViewLayout *)v95 interitemSpacing];
  double v93 = v36;
  [(PUHorizontalTiledCollectionViewLayout *)v95 itemsContentInset];
  double v82 = v37;
  double v94 = v38;
  double v40 = v38 + v39;
  [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v87 = v9;
  v42 = uint64_t v41 = v16;
  v43 = [v25 firstObject];
  v44 = [v43 indexPath];
  v86 = (void *)v42;
  int v83 = [v44 isEqual:v42];

  double v45 = v90 * (double)v41;
  double v46 = MidX;
  double v47 = MidY;
  double v48 = width;
  double v49 = height;
  if (a4 == 1) {
    double v50 = v45 + CGRectGetMaxX(*(CGRect *)&v46);
  }
  else {
    double v50 = CGRectGetMinX(*(CGRect *)&v46) - v45;
  }
  char v51 = 0;
  double v91 = v89 - v40;
  double v92 = v50;
  while (1)
  {
    v113.origin.double x = MidX;
    v113.origin.CGFloat y = MidY;
    v113.size.double width = width;
    v113.size.double height = height;
    if (v50 >= CGRectGetMinX(v113))
    {
      v114.origin.double x = MidX;
      v114.origin.CGFloat y = MidY;
      v114.size.double width = width;
      v114.size.double height = height;
      if (v50 <= CGRectGetMaxX(v114)) {
        break;
      }
    }
    CGFloat v100 = MidY;
    CGFloat v101 = width;
    CGFloat v53 = height;
    [v97 layout:v95 collectionView:v10 sizeForItemAtIndexPath:v35];
    double v55 = v54;
    double v57 = v56;
    if (v54 <= 0.0) {
      double v58 = 0.0;
    }
    else {
      double v58 = v93;
    }
    if (v34)
    {
      double v59 = MidX + v54 * -0.5 + v107;
    }
    else if (a4 == 1)
    {
      v115.origin.CGFloat y = v98;
      v115.origin.double x = v99;
      v115.size.double width = v31;
      v115.size.double height = v33;
      double v59 = v58 + CGRectGetMaxX(v115);
    }
    else
    {
      v116.origin.double x = v99;
      v116.origin.CGFloat y = v98;
      v116.size.double width = v31;
      v116.size.double height = v33;
      CGFloat v60 = CGRectGetMinX(v116) - v58;
      v117.origin.double x = v99;
      v117.origin.CGFloat y = v98;
      v117.size.double width = v55;
      v117.size.double height = v57;
      double v59 = v60 - CGRectGetWidth(v117);
    }
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v61 = round(*(double *)&PUMainScreenScale_screenScale * v59) / *(double *)&PUMainScreenScale_screenScale;
    double v62 = round(*(double *)&PUMainScreenScale_screenScale * (v94 + (v91 - v57) * 0.5))
        / *(double *)&PUMainScreenScale_screenScale;
    v63 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v35];

    objc_msgSend(v63, "setFrame:", v61, v62, v55, v57);
    v118.origin.double x = v61;
    v118.origin.CGFloat y = v62;
    v118.size.double width = v55;
    v118.size.double height = v57;
    IsEmptCGFloat y = CGRectIsEmpty(v118);
    [v63 setHidden:IsEmpty];
    [v63 setAlpha:(double)(IsEmpty ^ 1)];
    if (a4 == 1) {
      uint64_t v65 = [v25 count];
    }
    else {
      uint64_t v65 = 0;
    }
    [v25 insertObject:v63 atIndex:v65];
    [v96 setObject:v63 forKey:v35];
    v119.origin.double x = MidX;
    v119.origin.CGFloat y = v100;
    v119.size.double width = v101;
    v119.size.double height = v53;
    CGFloat v98 = v62;
    CGFloat v99 = v61;
    v121.origin.double x = v61;
    v121.origin.CGFloat y = v62;
    v121.size.double width = v55;
    v121.size.double height = v57;
    CGRect v120 = CGRectUnion(v119, v121);
    double MidX = v120.origin.x;
    double MidY = v120.origin.y;
    double width = v120.size.width;
    double height = v120.size.height;
    uint64_t v66 = [v10 next:a4 indexPathFromIndexPath:v35];

    BOOL v34 = 0;
    char v51 = 1;
    double v26 = v63;
    CGFloat v33 = v57;
    CGFloat v31 = v55;
    double v35 = (void *)v66;
    double v50 = v92;
    if (!v66)
    {
      double v26 = v63;
      break;
    }
  }
  v67 = [v25 firstObject];
  v68 = [v67 indexPath];
  v69 = v86;
  int v70 = [v68 isEqual:v86];

  double v9 = v87;
  if (MidX <= 0.0 || (double v52 = 0.0, v70))
  {
    double v71 = -MidX;
    double v107 = -MidX;
    a5 = v88;
    if (((v83 | v70 ^ 1) & 1) == 0)
    {
      double v71 = v82 - MidX;
      double v107 = v82 - MidX;
      double width = v82 + width;
    }
    if (v71 != 0.0)
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v72 = v25;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v103 objects:v108 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v104 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*((void *)&v103 + 1) + 8 * i);
            [v77 frame];
            [v77 setFrame:v107 + v78];
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v103 objects:v108 count:16];
        }
        while (v74);
      }

      double v9 = v87;
      a5 = v88;
      v69 = v86;
      if (v95->_data == v87)
      {
        [(PUHorizontalTiledCollectionViewLayout *)v95 invalidateLayout];
        v79 = [v10 collectionViewLayout];

        BOOL v80 = v79 == v95;
        a5 = v88;
        if (v80) {
          objc_msgSend(v10, "setBounds:", v85 + v107, v84, v90, v89);
        }
      }
    }
    double MidX = 0.0;
    double v52 = v107;
  }
  else
  {
    a5 = v88;
  }
  -[PUCollectionViewData setCurrentContentBounds:](v9, "setCurrentContentBounds:", MidX, MidY, width, height);

  if (a5) {
LABEL_52:
  }
    *a5 = v52;
LABEL_53:

  return v51 & 1;
}

- (PUHorizontalTiledCollectionViewLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  v2 = [(PUHorizontalTiledCollectionViewLayout *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PUCollectionViewData);
    data = v2->_data;
    v2->_data = v3;

    double v5 = (UICollectionViewLayoutAttributes *)objc_alloc_init(MEMORY[0x1E4FB15E0]);
    dummyAttrs = v2->_dummyAttrs;
    v2->_dummyAttrs = v5;
  }
  return v2;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end