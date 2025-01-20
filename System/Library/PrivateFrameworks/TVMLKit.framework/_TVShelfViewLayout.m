@interface _TVShelfViewLayout
+ (double)defaultHeaderSelectionMargin;
- (BOOL)_bumpHeaderForLayoutSection:(id)a3 forIndexPath:(id)a4;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldSnapContent;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGRect)boundingSelectionFrameForFrame:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)headerReferenceSize;
- (CGSize)itemSize;
- (NSArray)shelfLayoutSections;
- (UIEdgeInsets)sectionInset;
- (_TVShelfLayoutHelper)layoutHelper;
- (_TVShelfViewLayout)init;
- (double)computedContentHeight;
- (double)headerBottomMargin;
- (double)headerSelectionMargin;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (id)_indexPathForItemAtProposedContentOffset:(CGPoint)a3;
- (id)indexPathForSnappedContent;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)computedRowCount;
- (int64_t)prominentSectionIndex;
- (int64_t)rowCount;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setHeaderBottomMargin:(double)a3;
- (void)setHeaderReferenceSize:(CGSize)a3;
- (void)setHeaderSelectionMargin:(double)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setLayoutHelper:(id)a3;
- (void)setMinimumInteritemSpacing:(double)a3;
- (void)setMinimumLineSpacing:(double)a3;
- (void)setProminentSectionIndex:(int64_t)a3;
- (void)setRowCount:(int64_t)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
- (void)setShelfLayoutSections:(id)a3;
- (void)setShouldSnapContent:(BOOL)a3;
- (void)snapContent;
- (void)snapContentToIndexPath:(id)a3;
@end

@implementation _TVShelfViewLayout

- (_TVShelfViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVShelfViewLayout;
  v2 = [(_TVShelfViewLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_prominentSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_rowCount = 1;
    v2->_minimumInteritemSpacing = 10.0;
    v2->_minimumLineSpacing = 10.0;
    v2->_headerSelectionMargin = 7.0;
    v2->_headerBottomMargin = 12.0;
    v2->_shouldSnapContent = 1;
    [(_TVShelfViewLayout *)v2 _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
  }
  return v3;
}

+ (double)defaultHeaderSelectionMargin
{
  return 7.0;
}

- (void)setShouldSnapContent:(BOOL)a3
{
  if (self->_shouldSnapContent != a3)
  {
    self->_shouldSnapContent = a3;
    if (a3) {
      [(_TVShelfViewLayout *)self snapContent];
    }
  }
}

- (void)setRowCount:(int64_t)a3
{
  if (a3 >= 1) {
    self->_rowCount = a3;
  }
}

- (void)prepareLayout
{
  v89.receiver = self;
  v89.super_class = (Class)_TVShelfViewLayout;
  [(_TVShelfViewLayout *)&v89 prepareLayout];
  v3 = [(_TVShelfViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];
  objc_super v5 = [(_TVShelfViewLayout *)self shelfLayoutSections];

  if (!v5)
  {
    v6 = [(_TVShelfViewLayout *)self layoutHelper];
    if (!v6)
    {
      v6 = [[_TVShelfLayoutHelper alloc] initWithShelfViewLayout:self];
      [(_TVShelfViewLayout *)self setLayoutHelper:v6];
    }
    v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
    v80 = v3;
    if (v4 >= 1)
    {
      uint64_t v8 = 0;
      double v85 = *(double *)(MEMORY[0x263F001A8] + 8);
      double rect1 = *MEMORY[0x263F001A8];
      double v82 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v83 = *(double *)(MEMORY[0x263F001A8] + 16);
      do
      {
        v9 = objc_alloc_init(TVShelfLayoutSection);
        [(_TVShelfLayoutHelper *)v6 frameForHeaderInSection:v8];
        -[TVShelfLayoutSection setSectionHeaderFrame:](v9, "setSectionHeaderFrame:");
        [(_TVShelfLayoutHelper *)v6 insetForSection:v8];
        -[TVShelfLayoutSection setSectionInset:](v9, "setSectionInset:");
        uint64_t v10 = [v3 numberOfItemsInSection:v8];
        [(TVShelfLayoutSection *)v9 setNumberOfItems:v10];
        double height = v82;
        double width = v83;
        double y = v85;
        double x = rect1;
        if (v10 >= 1)
        {
          uint64_t v15 = 0;
          double y = v85;
          double x = rect1;
          double height = v82;
          double width = v83;
          do
          {
            v16 = [MEMORY[0x263F088C8] indexPathForItem:v15 inSection:v8];
            [(_TVShelfLayoutHelper *)v6 frameForItemAtIndexPath:v16];
            double v18 = v17;
            double v20 = v19;
            double v22 = v21;
            double v24 = v23;

            -[TVShelfLayoutSection setItemFrame:atIndex:](v9, "setItemFrame:atIndex:", v15, v18, v20, v22, v24);
            v90.origin.double x = x;
            v90.origin.double y = y;
            v90.size.double width = width;
            v90.size.double height = height;
            v99.origin.double x = v18;
            v99.origin.double y = v20;
            v99.size.double width = v22;
            v99.size.double height = v24;
            CGRect v91 = CGRectUnion(v90, v99);
            double x = v91.origin.x;
            double y = v91.origin.y;
            double width = v91.size.width;
            double height = v91.size.height;
            ++v15;
          }
          while (v10 != v15);
        }
        -[TVShelfLayoutSection setItemsBoundingFrame:](v9, "setItemsBoundingFrame:", x, y, width, height);
        [v7 addObject:v9];

        ++v8;
        v3 = v80;
      }
      while (v8 != v4);
    }
    v25 = (void *)[v7 copy];
    [(_TVShelfViewLayout *)self setShelfLayoutSections:v25];

    v26 = [v3 delegate];
    v27 = [v26 indexPathForPreferredFocusedViewInCollectionView:v3];

    int64_t v28 = [(_TVShelfViewLayout *)self rowCount];
    uint64_t v29 = [v27 item];
    v30 = [MEMORY[0x263F1C920] mainScreen];
    v31 = [v30 focusedView];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [v80 indexPathForCell:v31];
      int v33 = [v32 isEqual:v27];

      if (v33)
      {
        if (!(v29 % v28))
        {
          v34 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
          [(_TVShelfViewLayout *)self _bumpHeaderForLayoutSection:v34 forIndexPath:v27];
        }
      }
    }

    objc_super v5 = 0;
    v3 = v80;
  }
  [v3 contentOffset];
  double v36 = v35;
  [v3 contentInset];
  if (v4 >= 1)
  {
    uint64_t v38 = 0;
    CGFloat v39 = *MEMORY[0x263F001A8];
    CGFloat v40 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v41 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat rect1a = *(double *)(MEMORY[0x263F001A8] + 24);
    double v76 = *MEMORY[0x263F001A8];
    double v77 = v36 + v37;
    double v74 = v41;
    double v75 = v40;
    do
    {
      v42 = [(_TVShelfViewLayout *)self shelfLayoutSections];
      v43 = [v42 objectAtIndex:v38];

      [v43 sectionHeaderFrame];
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      v92.origin.double x = v39;
      v92.origin.double y = v40;
      v92.size.double width = v41;
      v92.size.double height = rect1a;
      v100.origin.double x = v45;
      v100.origin.double y = v47;
      v100.size.double width = v49;
      v100.size.double height = v51;
      if (!CGRectEqualToRect(v92, v100))
      {
        CGFloat v78 = v51;
        CGFloat v79 = v49;
        CGFloat v81 = v47;
        CGFloat v86 = v45;
        [v43 firstItemFrame];
        CGFloat v53 = v52;
        CGFloat v55 = v54;
        CGFloat v57 = v56;
        CGFloat v59 = v58;
        [v43 lastItemFrame];
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        CGFloat v65 = v64;
        CGFloat v67 = v66;
        v93.origin.double x = v53;
        v93.origin.double y = v55;
        v93.size.double width = v57;
        v93.size.double height = v59;
        double v68 = fmax(v77, CGRectGetMinX(v93));
        CGFloat v84 = v61;
        v94.origin.double x = v61;
        v94.origin.double y = v63;
        v94.size.double width = v65;
        v94.size.double height = v67;
        double v69 = fmin(v68, CGRectGetMinX(v94));
        if (v4 - 1 == v38)
        {
          CGFloat v40 = v75;
          CGFloat v39 = v76;
          CGFloat v41 = v74;
          double v70 = v86;
        }
        else
        {
          v95.origin.double x = v69;
          v95.size.double width = v79;
          v95.origin.double y = v81;
          v95.size.double height = v78;
          double MaxX = CGRectGetMaxX(v95);
          v96.origin.double y = v63;
          v96.origin.double x = v61;
          v96.size.double width = v65;
          v96.size.double height = v67;
          BOOL v72 = MaxX < CGRectGetMaxX(v96);
          CGFloat v40 = v75;
          CGFloat v39 = v76;
          CGFloat v41 = v74;
          double v70 = v86;
          if (!v72)
          {
            v97.origin.double y = v63;
            v97.origin.double x = v84;
            v97.size.double width = v65;
            v97.size.double height = v67;
            double v73 = CGRectGetMaxX(v97);
            v98.origin.double x = v86;
            v98.size.double width = v79;
            v98.origin.double y = v81;
            v98.size.double height = v78;
            double v69 = v73 - CGRectGetWidth(v98);
          }
        }
        [v43 setSectionHeaderHorizontalOffset:v69 - v70];
      }

      ++v38;
    }
    while (v4 != v38);
  }
  if (!v5) {
    [(_TVShelfViewLayout *)self snapContent];
  }
}

- (CGSize)collectionViewContentSize
{
  v3 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  uint64_t v4 = [v3 lastObject];

  [v4 lastItemFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 sectionInset];
  double v14 = v13;
  v21.origin.double x = v6;
  v21.origin.double y = v8;
  v21.size.double width = v10;
  v21.size.double height = v12;
  CGFloat v15 = CGRectGetMaxX(v21) + v14;
  [(_TVShelfViewLayout *)self computedContentHeight];
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 invalidateVerticalBumps])
  {
    id v5 = v4;
    CGFloat v6 = [MEMORY[0x263EFF980] array];
    double v7 = [v5 focusedItemIndexPath];
    CGFloat v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0x7FFFFFFFFFFFFFFFLL];
    }
    CGFloat v10 = v9;

    uint64_t v11 = [v10 item];
    BOOL v12 = v11 % [(_TVShelfViewLayout *)self rowCount] == 0;
    double v13 = [(_TVShelfViewLayout *)self shelfLayoutSections];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50___TVShelfViewLayout_invalidateLayoutWithContext___block_invoke;
    v17[3] = &unk_264BA7258;
    BOOL v21 = v12;
    id v18 = v10;
    double v19 = self;
    id v20 = v6;
    id v14 = v6;
    id v15 = v10;
    [v13 enumerateObjectsUsingBlock:v17];

    [v5 invalidateSupplementaryElementsOfKind:@"TVShelfLayoutElementKindHeader" atIndexPaths:v14];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 invalidateLayout] & 1) != 0
    || ([v4 invalidateEverything] & 1) != 0
    || [v4 invalidateDataSourceCounts])
  {
    [(_TVShelfViewLayout *)self setLayoutHelper:0];
    [(_TVShelfViewLayout *)self setShelfLayoutSections:0];
  }
  v16.receiver = self;
  v16.super_class = (Class)_TVShelfViewLayout;
  [(_TVShelfViewLayout *)&v16 invalidateLayoutWithContext:v4];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = [MEMORY[0x263EFF980] array];
  id v9 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = 0;
    double v37 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v38 = *MEMORY[0x263F001B0];
    CGFloat v41 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v42 = *MEMORY[0x263F001A8];
    CGFloat v39 = *(double *)(MEMORY[0x263F001A8] + 24);
    CGFloat v40 = *(double *)(MEMORY[0x263F001A8] + 16);
    do
    {
      BOOL v12 = [(_TVShelfViewLayout *)self shelfLayoutSections];
      double v13 = [v12 objectAtIndex:v11];

      [v13 sectionHeaderFrame];
      double v15 = v14;
      CGFloat v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [v13 sectionHeaderHorizontalOffset];
      if (v19 != v38 || v21 != v37)
      {
        v44.origin.CGFloat x = v22 + v15;
        v44.origin.CGFloat y = v17;
        v44.size.CGFloat width = v19;
        v44.size.CGFloat height = v21;
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        if (CGRectIntersectsRect(v44, v47))
        {
          double v24 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v11];
          v25 = [(_TVShelfViewLayout *)self layoutAttributesForSupplementaryViewOfKind:@"TVShelfLayoutElementKindHeader" atIndexPath:v24];
          [v8 addObject:v25];
        }
      }
      uint64_t v26 = [v13 numberOfItems];
      if (v26)
      {
        uint64_t v27 = v26;
        for (uint64_t i = 0; i != v27; ++i)
        {
          [v13 itemFrameAtIndex:i];
          CGFloat v29 = v45.origin.x;
          CGFloat v30 = v45.origin.y;
          CGFloat v31 = v45.size.width;
          CGFloat v32 = v45.size.height;
          v48.origin.CGFloat x = x;
          v48.origin.CGFloat y = y;
          v48.size.CGFloat width = width;
          v48.size.CGFloat height = height;
          if (CGRectIntersectsRect(v45, v48))
          {
            v46.origin.CGFloat y = v41;
            v46.origin.CGFloat x = v42;
            v46.size.CGFloat height = v39;
            v46.size.CGFloat width = v40;
            v49.origin.CGFloat x = v29;
            v49.origin.CGFloat y = v30;
            v49.size.CGFloat width = v31;
            v49.size.CGFloat height = v32;
            if (!CGRectEqualToRect(v46, v49))
            {
              int v33 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:v11];
              v34 = [(_TVShelfViewLayout *)self layoutAttributesForItemAtIndexPath:v33];
              [v8 addObject:v34];
            }
          }
        }
      }

      ++v11;
    }
    while (v11 != v10);
  }
  double v35 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];

  return v35;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F1C520] layoutAttributesForCellWithIndexPath:v4];
  unint64_t v6 = [v4 section];
  double v7 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  unint64_t v8 = [v7 count];

  if (v6 < v8)
  {
    id v9 = [(_TVShelfViewLayout *)self shelfLayoutSections];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "section"));

    uint64_t v11 = [v4 item];
    if (v11 < [v10 numberOfItems])
    {
      objc_msgSend(v10, "itemFrameAtIndex:", objc_msgSend(v4, "item"));
      if (fabs(v12) == INFINITY
        || fabs(v13) == INFINITY
        || fabs(v14) == INFINITY
        || (double v16 = fabs(v15), v16 >= INFINITY) && v16 <= INFINITY)
      {
        CGFloat v17 = TVMLKitLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v4;
          _os_log_impl(&dword_230B4C000, v17, OS_LOG_TYPE_DEFAULT, "shelf cell frame not finite for %@", (uint8_t *)&v19, 0xCu);
        }
        double v12 = *MEMORY[0x263F001A8];
        double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
      }
      objc_msgSend(v5, "setFrame:", v12, v13, v14, v15);
    }
  }
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [MEMORY[0x263F1C520] layoutAttributesForSupplementaryViewOfKind:a3 withIndexPath:v6];
  unint64_t v8 = [v6 section];
  id v9 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    uint64_t v11 = [(_TVShelfViewLayout *)self shelfLayoutSections];
    double v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "section"));

    [v12 sectionHeaderFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 sectionHeaderVerticalBump];
    objc_msgSend(v7, "setFrame:", v14, v16 - v21, v18, v20);
    memset(&v25, 0, sizeof(v25));
    [v12 sectionHeaderHorizontalOffset];
    CGAffineTransformMakeTranslation(&v25, v22, 0.0);
    CGAffineTransform v24 = v25;
    [v7 setTransform:&v24];
  }
  return v7;
}

- (int64_t)computedRowCount
{
  v3 = [(_TVShelfViewLayout *)self layoutHelper];
  id v4 = [(_TVShelfViewLayout *)self layoutHelper];

  if (!v4)
  {
    id v5 = [[_TVShelfLayoutHelper alloc] initWithShelfViewLayout:self];

    [(_TVShelfViewLayout *)self setLayoutHelper:v5];
    v3 = v5;
  }
  int64_t v6 = [v3 actualRowCount];

  return v6;
}

- (double)computedContentHeight
{
  v3 = [(_TVShelfViewLayout *)self layoutHelper];
  id v4 = [(_TVShelfViewLayout *)self layoutHelper];

  if (!v4)
  {
    id v5 = [[_TVShelfLayoutHelper alloc] initWithShelfViewLayout:self];

    [(_TVShelfViewLayout *)self setLayoutHelper:v5];
    v3 = v5;
  }
  [v3 tallestHeaderHeight];
  double v6 = 0.0;
  if (v7 > 0.0)
  {
    [(_TVShelfViewLayout *)self headerBottomMargin];
    double v6 = v8;
  }
  [v3 tallestInsetTop];
  double v10 = v9;
  [v3 tallestHeaderHeight];
  double v12 = v6 + v10 + v11;
  [v3 tallestColumnHeight];
  double v14 = v13 + v12;
  [v3 tallestInsetBottom];
  double v16 = v15 + v14;

  return v16;
}

- (CGRect)boundingSelectionFrameForFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x263EF8340];
  CGFloat MidX = CGRectGetMidX(a3);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  CGFloat v43 = width;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v51);
  CGFloat v10 = *MEMORY[0x263F001A8];
  CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v42 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  double v13 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v40 = v10;
    CGFloat r2 = height;
    double v38 = v12;
    double v39 = v11;
    uint64_t v16 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v18, "numberOfItems", *(void *)&v38, *(void *)&v39, *(void *)&v40))
        {
          [v18 sectionHeaderFrame];
          CGFloat v20 = v19;
          double v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          [v18 sectionHeaderVerticalBump];
          double v28 = v22 - v27;
          [v18 itemsBoundingFrame];
          v57.origin.CGFloat x = v29;
          v57.origin.CGFloat y = v30;
          v57.size.CGFloat width = v31;
          v57.size.CGFloat height = v32;
          v52.origin.CGFloat x = v20;
          v52.origin.CGFloat y = v28;
          v52.size.CGFloat width = v24;
          v52.size.CGFloat height = v26;
          CGRect v53 = CGRectUnion(v52, v57);
          v50.CGFloat x = MidX;
          v50.CGFloat y = MidY;
          if (CGRectContainsPoint(v53, v50))
          {
            v54.origin.CGFloat x = v20;
            v54.origin.CGFloat y = v28;
            v54.size.CGFloat width = v24;
            v54.size.CGFloat height = v26;
            v58.origin.CGFloat x = x;
            v58.origin.CGFloat y = y;
            v58.size.CGFloat width = v43;
            v58.size.CGFloat height = r2;
            CGRect v55 = CGRectUnion(v54, v58);
            CGFloat v10 = v55.origin.x;
            CGFloat v11 = v55.origin.y;
            CGFloat v12 = v55.size.width;
            CGFloat v33 = v55.size.height;
            goto LABEL_13;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    CGFloat v11 = v39;
    CGFloat v10 = v40;
    CGFloat v12 = v38;
  }
  CGFloat v33 = v42;
LABEL_13:

  double v34 = v10;
  double v35 = v11;
  double v36 = v12;
  double v37 = v33;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  v3 = [(_TVShelfViewLayout *)self layoutHelper];
  [v3 tallestHeaderHeight];
  BOOL v5 = v4 > 0.0;

  return v5;
}

- (BOOL)_bumpHeaderForLayoutSection:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 sectionHeaderFrame];
  if (v9 <= 0.0)
  {
    LOBYTE(v20) = 0;
  }
  else
  {
    double v10 = v8;
    CGFloat v11 = [(_TVShelfViewLayout *)self collectionView];
    [v11 contentInset];
    double v13 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 selectionMarginsForCellAtIndexPath:v7];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      double v15 = *MEMORY[0x263F1D1C0];
      double v17 = *(double *)(MEMORY[0x263F1D1C0] + 8);
      double v19 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    }
    [v11 contentOffset];
    double v22 = v21;
    objc_msgSend(v6, "itemFrameAtIndex:", objc_msgSend(v7, "item"));
    double v24 = v23;
    double v26 = v25;
    [v6 sectionInset];
    double v28 = fmax(v10 - v22, v27);
    [v6 sectionHeaderFrame];
    if (v24 - v17 - v22 >= v13) {
      double v31 = v24 - v17 - v22;
    }
    else {
      double v31 = v13;
    }
    uint64_t v32 = 0;
    double v33 = 1.0;
    uint64_t v34 = 0;
    double v35 = 1.0;
    double v36 = v28;
    double v30 = v19 + v17 + v26;
    BOOL v20 = CGRectIntersectsRect(*(CGRect *)(&v29 - 2), *(CGRect *)&v31);
    if (v20)
    {
      [(_TVShelfViewLayout *)self headerSelectionMargin];
      double v38 = v37;
      [(_TVShelfViewLayout *)self headerBottomMargin];
      objc_msgSend(v6, "setSectionHeaderVerticalBump:", fmax(v38 - (v39 - v15), 0.0));
    }
  }
  return v20;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(_TVShelfViewLayout *)self shouldSnapContent])
  {
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", x, y, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVShelfViewLayout;
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](&v10, sel_targetContentOffsetForProposedContentOffset_, x, y);
  }
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if ([(_TVShelfViewLayout *)self shouldSnapContent])
  {
    double v53 = v6;
    double v9 = [(_TVShelfViewLayout *)self collectionView];
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    double v18 = [(_TVShelfViewLayout *)self collectionView];
    [v18 contentSize];
    double v20 = v19;

    double v21 = [(_TVShelfViewLayout *)self collectionView];
    [v21 contentInset];
    double v23 = v22;
    double v25 = v24;

    double v26 = v25 + v20 + v23;
    v56.origin.double x = v11;
    v56.origin.double y = v13;
    v56.size.CGFloat width = v15;
    v56.size.CGFloat height = v17;
    if (v26 <= CGRectGetWidth(v56))
    {
      double v7 = -v23;
      double v29 = v53;
    }
    else
    {
      double v27 = [(_TVShelfViewLayout *)self shelfLayoutSections];
      double v28 = (void *)[v27 copy];

      double v52 = v7 + v23;
      v57.origin.double x = v11;
      v57.origin.double y = v13;
      v57.size.CGFloat width = v15;
      v57.size.CGFloat height = v17;
      if (v26 - (v7 + v23) <= CGRectGetWidth(v57))
      {
        v59.origin.double x = v11;
        v59.origin.double y = v13;
        v59.size.CGFloat width = v15;
        v59.size.CGFloat height = v17;
        double v7 = v26 - CGRectGetWidth(v59) - v23;
        double v29 = v53;
      }
      else
      {
        double v29 = v53;
        double v30 = -[_TVShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:", v7, v53);
        double v31 = v30;
        if (v30)
        {
          uint64_t v32 = objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v30, "section"));
          objc_msgSend(v32, "itemFrameAtIndex:", objc_msgSend(v31, "item"));
          CGFloat v33 = v58.origin.x;
          CGFloat v34 = v58.origin.y;
          CGFloat width = v58.size.width;
          CGFloat height = v58.size.height;
          if (v52 > CGRectGetMidX(v58))
          {
            uint64_t v37 = [v31 item];
            if (v37 >= [v32 numberOfItems])
            {
              unint64_t v44 = [v28 indexOfObject:v32] + 1;
              if (v44 < [v28 count])
              {
                long long v45 = [v28 objectAtIndex:v44];

                [v45 firstItemFrame];
                CGFloat v33 = v46;
                CGFloat v34 = v47;
                CGFloat width = v48;
                CGFloat height = v49;
                uint64_t v32 = v45;
              }
            }
            else
            {
              objc_msgSend(v32, "itemFrameAtIndex:", objc_msgSend(v31, "item") + 1);
              CGFloat v33 = v38;
              CGFloat v34 = v39;
              CGFloat width = v40;
              CGFloat height = v41;
            }
          }
          v60.origin.double x = v33;
          v60.origin.double y = v34;
          v60.size.CGFloat width = width;
          v60.size.CGFloat height = height;
          double v7 = CGRectGetMinX(v60) - v23;
        }
      }
    }
  }
  else
  {
    v54.receiver = self;
    v54.super_class = (Class)_TVShelfViewLayout;
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v54, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
    double v7 = v42;
    double v29 = v43;
  }
  double v50 = v7;
  double v51 = v29;
  result.double y = v51;
  result.double x = v50;
  return result;
}

- (id)_indexPathForItemAtProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v6 = [(_TVShelfViewLayout *)self collectionView];
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = [(_TVShelfViewLayout *)self shelfLayoutSections];
  double v12 = (void *)[v11 copy];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = y + v8;
    double v17 = x + v10;
    uint64_t v18 = *(void *)v35;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v35 != v18) {
        objc_enumerationMutation(v13);
      }
      double v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
      objc_msgSend(v20, "itemsBoundingFrame", (void)v34);
      v41.double x = v17;
      v41.double y = v16;
      if (CGRectContainsPoint(v43, v41)) {
        break;
      }
      if (v15 == ++v19)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v20;

    if (!v21 || [v21 numberOfItems] < 1) {
      goto LABEL_15;
    }
    uint64_t v22 = 0;
    while (1)
    {
      [v21 itemFrameAtIndex:v22];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      CGFloat v30 = v29;
      [(_TVShelfViewLayout *)self minimumInteritemSpacing];
      v44.size.CGFloat width = v31 + v28;
      v44.origin.double x = v24;
      v44.origin.double y = v26;
      v44.size.CGFloat height = v30;
      v42.double x = v17;
      v42.double y = v16;
      if (CGRectContainsPoint(v44, v42)) {
        break;
      }
      if (++v22 >= [v21 numberOfItems]) {
        goto LABEL_15;
      }
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v22, objc_msgSend(v13, "indexOfObject:", v21));
  }
  else
  {
LABEL_9:

    id v21 = 0;
LABEL_15:
    uint64_t v32 = 0;
  }

  return v32;
}

- (void)snapContent
{
}

- (void)snapContentToIndexPath:(id)a3
{
  id v18 = a3;
  if ([(_TVShelfViewLayout *)self shouldSnapContent])
  {
    double v4 = [(_TVShelfViewLayout *)self collectionView];
    [v4 contentOffset];
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    double v6 = v5;
    double v8 = v7;
    if (v18)
    {
      unint64_t v9 = [v18 section];
      double v10 = [(_TVShelfViewLayout *)self shelfLayoutSections];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        double v12 = [(_TVShelfViewLayout *)self collectionView];
        [v12 contentInset];
        double v14 = v13;

        uint64_t v15 = [(_TVShelfViewLayout *)self shelfLayoutSections];
        double v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v18, "section"));

        uint64_t v17 = [v18 item];
        if (v17 < [v16 numberOfItems])
        {
          objc_msgSend(v16, "itemFrameAtIndex:", objc_msgSend(v18, "item"));
          double v6 = CGRectGetMinX(v20) - v14;
        }
      }
    }
    objc_msgSend(v4, "setContentOffset:animated:", 0, v6, v8);
  }
}

- (id)indexPathForSnappedContent
{
  if ([(_TVShelfViewLayout *)self shouldSnapContent])
  {
    v3 = [(_TVShelfViewLayout *)self collectionView];
    [v3 contentOffset];
    double v4 = -[_TVShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:");
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (BOOL)shouldSnapContent
{
  return self->_shouldSnapContent;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (void)setMinimumLineSpacing:(double)a3
{
  self->_minimumLineSpacing = a3;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

- (int64_t)prominentSectionIndex
{
  return self->_prominentSectionIndex;
}

- (void)setProminentSectionIndex:(int64_t)a3
{
  self->_prominentSectionIndedouble x = a3;
}

- (CGSize)headerReferenceSize
{
  double width = self->_headerReferenceSize.width;
  double height = self->_headerReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderReferenceSize:(CGSize)a3
{
  self->_headerReferenceSize = a3;
}

- (double)headerSelectionMargin
{
  return self->_headerSelectionMargin;
}

- (void)setHeaderSelectionMargin:(double)a3
{
  self->_headerSelectionMargin = a3;
}

- (double)headerBottomMargin
{
  return self->_headerBottomMargin;
}

- (void)setHeaderBottomMargin:(double)a3
{
  self->_headerBottomMargin = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (_TVShelfLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
}

- (NSArray)shelfLayoutSections
{
  return self->_shelfLayoutSections;
}

- (void)setShelfLayoutSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfLayoutSections, 0);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
}

@end