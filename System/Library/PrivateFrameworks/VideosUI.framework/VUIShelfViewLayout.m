@interface VUIShelfViewLayout
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
- (VUIShelfLayoutHelper)layoutHelper;
- (VUIShelfViewLayout)init;
- (VUIShelfViewLayoutDelegate)delegate;
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
- (void)setDelegate:(id)a3;
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

@implementation VUIShelfViewLayout

- (VUIShelfViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIShelfViewLayout;
  v2 = [(VUIShelfViewLayout *)&v5 init];
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
    [(VUIShelfViewLayout *)v2 _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
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
      [(VUIShelfViewLayout *)self snapContent];
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
  v79.receiver = self;
  v79.super_class = (Class)VUIShelfViewLayout;
  [(VUIShelfViewLayout *)&v79 prepareLayout];
  v3 = [(VUIShelfViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];
  objc_super v5 = [(VUIShelfViewLayout *)self shelfLayoutSections];

  if (!v5)
  {
    v6 = [(VUIShelfViewLayout *)self layoutHelper];
    if (!v6)
    {
      v6 = [[VUIShelfLayoutHelper alloc] initWithShelfViewLayout:self];
      [(VUIShelfViewLayout *)self setLayoutHelper:v6];
    }
    v70 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    if (v4 >= 1)
    {
      uint64_t v7 = 0;
      double v75 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double rect1 = *MEMORY[0x1E4F1DB28];
      double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double rect = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      do
      {
        v8 = objc_alloc_init(VUIShelfLayoutSection);
        [(VUIShelfLayoutHelper *)v6 frameForHeaderInSection:v7];
        -[VUIShelfLayoutSection setSectionHeaderFrame:](v8, "setSectionHeaderFrame:");
        [(VUIShelfLayoutHelper *)v6 insetForSection:v7];
        -[VUIShelfLayoutSection setSectionInset:](v8, "setSectionInset:");
        v9 = v3;
        uint64_t v10 = [v3 numberOfItemsInSection:v7];
        [(VUIShelfLayoutSection *)v8 setNumberOfItems:v10];
        double y = v75;
        double x = rect1;
        double height = v72;
        double width = rect;
        if (v10 >= 1)
        {
          uint64_t v15 = 0;
          double height = v72;
          double width = rect;
          double y = v75;
          double x = rect1;
          do
          {
            v16 = [MEMORY[0x1E4F28D58] indexPathForItem:v15 inSection:v7];
            [(VUIShelfLayoutHelper *)v6 frameForItemAtIndexPath:v16];
            double v18 = v17;
            double v20 = v19;
            double v22 = v21;
            double v24 = v23;

            -[VUIShelfLayoutSection setItemFrame:atIndex:](v8, "setItemFrame:atIndex:", v15, v18, v20, v22, v24);
            v80.origin.double x = x;
            v80.origin.double y = y;
            v80.size.double width = width;
            v80.size.double height = height;
            v89.origin.double x = v18;
            v89.origin.double y = v20;
            v89.size.double width = v22;
            v89.size.double height = v24;
            CGRect v81 = CGRectUnion(v80, v89);
            double x = v81.origin.x;
            double y = v81.origin.y;
            double width = v81.size.width;
            double height = v81.size.height;
            ++v15;
          }
          while (v10 != v15);
        }
        -[VUIShelfLayoutSection setItemsBoundingFrame:](v8, "setItemsBoundingFrame:", x, y, width, height);
        [v70 addObject:v8];

        ++v7;
        v3 = v9;
      }
      while (v7 != v4);
    }
    v25 = (void *)[v70 copy];
    [(VUIShelfViewLayout *)self setShelfLayoutSections:v25];

    objc_super v5 = 0;
  }
  [v3 vuiContentOffset];
  double v27 = v26;
  [v3 vuiContentInsets];
  if (v4 >= 1)
  {
    uint64_t v29 = 0;
    CGFloat v30 = *MEMORY[0x1E4F1DB28];
    CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat rect1a = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v67 = v27 + v28;
    double v68 = v32;
    double v69 = v31;
    double v71 = *MEMORY[0x1E4F1DB28];
    do
    {
      v33 = [(VUIShelfViewLayout *)self shelfLayoutSections];
      v34 = [v33 objectAtIndex:v29];

      [v34 sectionHeaderFrame];
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      v82.origin.double x = v30;
      v82.origin.double y = v31;
      v82.size.double width = v32;
      v82.size.double height = rect1a;
      v90.origin.double x = v36;
      v90.origin.double y = v38;
      v90.size.double width = v40;
      v90.size.double height = v42;
      if (!CGRectEqualToRect(v82, v90))
      {
        CGFloat v73 = v38;
        CGFloat v76 = v36;
        [v34 firstItemFrame];
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        [v34 lastItemFrame];
        double v52 = v51;
        double v54 = v53;
        CGFloat v56 = v55;
        CGFloat v58 = v57;
        v83.origin.double x = v44;
        v83.origin.double y = v46;
        v83.size.double width = v48;
        CGFloat v59 = v52;
        v83.size.double height = v50;
        CGFloat v60 = v54;
        double v61 = fmax(v67, CGRectGetMinX(v83));
        v84.origin.double x = v59;
        v84.origin.double y = v60;
        v84.size.double width = v56;
        v84.size.double height = v58;
        double v62 = fmin(v61, CGRectGetMinX(v84));
        if (v4 - 1 == v29)
        {
          double v63 = v76;
        }
        else
        {
          v85.origin.double x = v62;
          v85.origin.double y = v73;
          v85.size.double width = v40;
          v85.size.double height = v42;
          double MaxX = CGRectGetMaxX(v85);
          v86.origin.double x = v59;
          v86.origin.double y = v60;
          v86.size.double width = v56;
          v86.size.double height = v58;
          BOOL v65 = MaxX < CGRectGetMaxX(v86);
          double v63 = v76;
          if (!v65)
          {
            v87.origin.double x = v59;
            v87.origin.double y = v60;
            v87.size.double width = v56;
            v87.size.double height = v58;
            double v66 = CGRectGetMaxX(v87);
            v88.origin.double x = v76;
            v88.origin.double y = v73;
            v88.size.double width = v40;
            v88.size.double height = v42;
            double v62 = v66 - CGRectGetWidth(v88);
          }
        }
        [v34 setSectionHeaderHorizontalOffset:v62 - v63];
        CGFloat v31 = v69;
        CGFloat v30 = v71;
        CGFloat v32 = v68;
      }

      ++v29;
    }
    while (v4 != v29);
  }
  if (!v5) {
    [(VUIShelfViewLayout *)self snapContent];
  }
}

- (CGSize)collectionViewContentSize
{
  v3 = [(VUIShelfViewLayout *)self shelfLayoutSections];
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
  [(VUIShelfViewLayout *)self computedContentHeight];
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
    CGFloat v6 = [MEMORY[0x1E4F1CA48] array];
    double v7 = [v5 focusedItemIndexPath];
    CGFloat v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0x7FFFFFFFFFFFFFFFLL];
    }
    CGFloat v10 = v9;

    uint64_t v11 = [v10 item];
    BOOL v12 = v11 % [(VUIShelfViewLayout *)self rowCount] == 0;
    double v13 = [(VUIShelfViewLayout *)self shelfLayoutSections];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__VUIShelfViewLayout_invalidateLayoutWithContext___block_invoke;
    v17[3] = &unk_1E6DF5A40;
    BOOL v21 = v12;
    id v18 = v10;
    double v19 = self;
    id v20 = v6;
    id v14 = v6;
    id v15 = v10;
    [v13 enumerateObjectsUsingBlock:v17];

    [v5 invalidateSupplementaryElementsOfKind:@"VUIShelfLayoutElementKindHeader" atIndexPaths:v14];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 invalidateLayout] & 1) != 0
    || ([v4 invalidateEverything] & 1) != 0
    || [v4 invalidateDataSourceCounts])
  {
    [(VUIShelfViewLayout *)self setLayoutHelper:0];
    [(VUIShelfViewLayout *)self setShelfLayoutSections:0];
  }
  v16.receiver = self;
  v16.super_class = (Class)VUIShelfViewLayout;
  [(VUIShelfViewLayout *)&v16 invalidateLayoutWithContext:v4];
}

void __50__VUIShelfViewLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) section] != a3
    || !*(unsigned char *)(a1 + 56)
    || ![*(id *)(a1 + 40) _bumpHeaderForLayoutSection:v8 forIndexPath:*(void *)(a1 + 32)])
  {
    [v8 sectionHeaderVerticalBump];
    if (v5 == 0.0) {
      goto LABEL_7;
    }
    [v8 setSectionHeaderVerticalBump:0.0];
  }
  CGFloat v6 = *(void **)(a1 + 48);
  double v7 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
  [v6 addObject:v7];

LABEL_7:
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(VUIShelfViewLayout *)self shelfLayoutSections];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = 0;
    double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v38 = *MEMORY[0x1E4F1DB30];
    CGFloat v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v42 = *MEMORY[0x1E4F1DB28];
    CGFloat v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      BOOL v12 = [(VUIShelfViewLayout *)self shelfLayoutSections];
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
          double v24 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v11];
          v25 = [(VUIShelfViewLayout *)self layoutAttributesForSupplementaryViewOfKind:@"VUIShelfLayoutElementKindHeader" atIndexPath:v24];
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
              v33 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v11];
              v34 = [(VUIShelfViewLayout *)self layoutAttributesForItemAtIndexPath:v33];
              [v8 addObject:v34];
            }
          }
        }
      }

      ++v11;
    }
    while (v11 != v10);
  }
  double v35 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];

  return v35;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v4];
  unint64_t v6 = [v4 section];
  double v7 = [(VUIShelfViewLayout *)self shelfLayoutSections];
  unint64_t v8 = [v7 count];

  if (v6 < v8)
  {
    id v9 = [(VUIShelfViewLayout *)self shelfLayoutSections];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "section"));

    uint64_t v11 = [v4 item];
    if (v11 < [v10 numberOfItems])
    {
      objc_msgSend(v10, "itemFrameAtIndex:", objc_msgSend(v4, "item"));
      objc_msgSend(v5, "setFrame:");
    }
  }
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:a3 withIndexPath:v6];
  unint64_t v8 = [v6 section];
  id v9 = [(VUIShelfViewLayout *)self shelfLayoutSections];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    uint64_t v11 = [(VUIShelfViewLayout *)self shelfLayoutSections];
    BOOL v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "section"));

    [v12 sectionHeaderFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 sectionHeaderVerticalBump];
    double v22 = v16 - v21;
    if (![v6 section])
    {
      double v23 = [(VUIShelfViewLayout *)self collectionView];
      [v23 vuiContentOffset];
      double v25 = v24;
      [v23 vuiContentInsets];
      double v27 = 0.0 - v26;
      double v28 = v25 + v26;
      if (v25 < v27) {
        double v14 = v28;
      }
    }
    objc_msgSend(v7, "setFrame:", v14, v22, v18, v20);
    memset(&v32, 0, sizeof(v32));
    [v12 sectionHeaderHorizontalOffset];
    CGAffineTransformMakeTranslation(&v32, v29, 0.0);
    CGAffineTransform v31 = v32;
    [v7 setTransform:&v31];
  }
  return v7;
}

- (int64_t)computedRowCount
{
  v3 = [(VUIShelfViewLayout *)self layoutHelper];
  id v4 = [(VUIShelfViewLayout *)self layoutHelper];

  if (!v4)
  {
    double v5 = [[VUIShelfLayoutHelper alloc] initWithShelfViewLayout:self];

    [(VUIShelfViewLayout *)self setLayoutHelper:v5];
    v3 = v5;
  }
  int64_t v6 = [v3 actualRowCount];

  return v6;
}

- (double)computedContentHeight
{
  v3 = [(VUIShelfViewLayout *)self layoutHelper];
  id v4 = [(VUIShelfViewLayout *)self layoutHelper];

  if (!v4)
  {
    double v5 = [[VUIShelfLayoutHelper alloc] initWithShelfViewLayout:self];

    [(VUIShelfViewLayout *)self setLayoutHelper:v5];
    v3 = v5;
  }
  [v3 tallestHeaderHeight];
  double v6 = 0.0;
  if (v7 > 0.0)
  {
    [(VUIShelfViewLayout *)self headerBottomMargin];
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  CGFloat MidX = CGRectGetMidX(a3);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  CGFloat v43 = width;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v51);
  CGFloat v10 = *MEMORY[0x1E4F1DB28];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  double v13 = [(VUIShelfViewLayout *)self shelfLayoutSections];
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
  v3 = [(VUIShelfViewLayout *)self layoutHelper];
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
    LOBYTE(v22) = 0;
  }
  else
  {
    double v10 = v8;
    CGFloat v11 = [(VUIShelfViewLayout *)self collectionView];
    [v11 vuiContentInsets];
    double v13 = v12;
    uint64_t v14 = [(VUIShelfViewLayout *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v11 collectionViewLayout];
      [v14 collectionView:v11 layout:v15 selectionMarginsForItemAtIndexPath:v7];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
    }
    else
    {
      double v17 = *MEMORY[0x1E4FB2848];
      double v19 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v21 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    [v11 vuiContentOffset];
    double v24 = v23;
    objc_msgSend(v6, "itemFrameAtIndex:", objc_msgSend(v7, "item"));
    double v26 = v25;
    double v28 = v27;
    [v6 sectionInset];
    double v30 = fmax(v10 - v24, v29);
    [v6 sectionHeaderFrame];
    if (v26 - v19 - v24 >= v13) {
      double v33 = v26 - v19 - v24;
    }
    else {
      double v33 = v13;
    }
    uint64_t v34 = 0;
    double v35 = 1.0;
    uint64_t v36 = 0;
    double v37 = 1.0;
    double v38 = v30;
    double v32 = v21 + v19 + v28;
    BOOL v22 = CGRectIntersectsRect(*(CGRect *)(&v31 - 2), *(CGRect *)&v33);
    if (v22)
    {
      [(VUIShelfViewLayout *)self headerSelectionMargin];
      double v40 = v39;
      [(VUIShelfViewLayout *)self headerBottomMargin];
      objc_msgSend(v6, "setSectionHeaderVerticalBump:", fmax(v40 - (v41 - v17), 0.0));
    }
  }
  return v22;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(VUIShelfViewLayout *)self shouldSnapContent])
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", x, y, v6, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VUIShelfViewLayout;
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:](&v10, sel_targetContentOffsetForProposedContentOffset_, x, y);
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
  if ([(VUIShelfViewLayout *)self shouldSnapContent])
  {
    double v9 = [(VUIShelfViewLayout *)self collectionView];
    [v9 vuiBounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v9 vuiContentSize];
    double v19 = v18;
    [v9 vuiContentInsets];
    double v21 = v20;
    double v23 = v22 + v19 + v20;
    v51.origin.double x = v11;
    v51.origin.double y = v13;
    v51.size.CGFloat width = v15;
    v51.size.CGFloat height = v17;
    if (v23 <= CGRectGetWidth(v51))
    {
      double v7 = -v21;
    }
    else
    {
      double v24 = [(VUIShelfViewLayout *)self shelfLayoutSections];
      double v25 = (void *)[v24 copy];

      double v48 = v7 + v21;
      v52.origin.double x = v11;
      v52.origin.double y = v13;
      v52.size.CGFloat width = v15;
      v52.size.CGFloat height = v17;
      if (v23 - (v7 + v21) <= CGRectGetWidth(v52))
      {
        v54.origin.double x = v11;
        v54.origin.double y = v13;
        v54.size.CGFloat width = v15;
        v54.size.CGFloat height = v17;
        double v7 = v23 - CGRectGetWidth(v54) - v21;
      }
      else
      {
        double v26 = -[VUIShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:", v7, v6);
        double v27 = v26;
        if (v26)
        {
          double v28 = objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v26, "section"));
          objc_msgSend(v28, "itemFrameAtIndex:", objc_msgSend(v27, "item"));
          CGFloat v29 = v53.origin.x;
          CGFloat v30 = v53.origin.y;
          CGFloat width = v53.size.width;
          CGFloat height = v53.size.height;
          if (v48 > CGRectGetMidX(v53))
          {
            uint64_t v33 = [v27 item] + 1;
            if (v33 >= [v28 numberOfItems])
            {
              unint64_t v40 = [v25 indexOfObject:v28] + 1;
              if (v40 < [v25 count])
              {
                double v41 = [v25 objectAtIndex:v40];

                [v41 firstItemFrame];
                CGFloat v29 = v42;
                CGFloat v30 = v43;
                CGFloat width = v44;
                CGFloat height = v45;
                double v28 = v41;
              }
            }
            else
            {
              objc_msgSend(v28, "itemFrameAtIndex:", objc_msgSend(v27, "item") + 1);
              CGFloat v29 = v34;
              CGFloat v30 = v35;
              CGFloat width = v36;
              CGFloat height = v37;
            }
          }
          v55.origin.double x = v29;
          v55.origin.double y = v30;
          v55.size.CGFloat width = width;
          v55.size.CGFloat height = height;
          double v7 = CGRectGetMinX(v55) - v21;
        }
      }
    }
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VUIShelfViewLayout;
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v49, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
    double v7 = v38;
    double v6 = v39;
  }
  double v46 = v7;
  double v47 = v6;
  result.double y = v47;
  result.double x = v46;
  return result;
}

- (id)_indexPathForItemAtProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v6 = [(VUIShelfViewLayout *)self collectionView];
  [v6 vuiContentInsets];
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = [(VUIShelfViewLayout *)self shelfLayoutSections];
  double v12 = (void *)[v11 copy];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = x + v10;
    double v17 = y + v8;
    uint64_t v18 = *(void *)v39;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v13);
      }
      double v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
      objc_msgSend(v20, "itemsBoundingFrame", (void)v38);
      v45.double x = v16;
      v45.double y = v17;
      if (CGRectContainsPoint(v46, v45)) {
        break;
      }
      if (v15 == ++v19)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v20;

    if (!v21 || [v21 numberOfItems] < 1) {
      goto LABEL_19;
    }
    uint64_t v22 = 0;
    while (1)
    {
      [v21 itemFrameAtIndex:v22];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      CGFloat v30 = v29;
      [(VUIShelfViewLayout *)self minimumInteritemSpacing];
      CGFloat v32 = v31 + v28;
      v47.origin.double x = v24;
      v47.origin.double y = v26;
      v47.size.CGFloat width = v32;
      v47.size.CGFloat height = v30;
      double MinX = CGRectGetMinX(v47);
      v48.origin.double x = v24;
      v48.origin.double y = v26;
      v48.size.CGFloat width = v32;
      v48.size.CGFloat height = v30;
      double MaxX = CGRectGetMaxX(v48);
      if (v16 >= MinX && v16 <= MaxX) {
        break;
      }
      if (++v22 >= objc_msgSend(v21, "numberOfItems", MaxX)) {
        goto LABEL_19;
      }
    }
    double v37 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v22, objc_msgSend(v13, "indexOfObject:", v21, MaxX));
  }
  else
  {
LABEL_9:

    id v21 = 0;
LABEL_19:
    double v37 = 0;
  }

  return v37;
}

- (void)snapContent
{
}

- (void)snapContentToIndexPath:(id)a3
{
  id v17 = a3;
  if ([(VUIShelfViewLayout *)self shouldSnapContent])
  {
    double v4 = [(VUIShelfViewLayout *)self collectionView];
    [v4 vuiContentOffset];
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    double v6 = v5;
    double v8 = v7;
    if (v17)
    {
      unint64_t v9 = [v17 section];
      double v10 = [(VUIShelfViewLayout *)self shelfLayoutSections];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        [v4 vuiContentInsets];
        double v13 = v12;
        uint64_t v14 = [(VUIShelfViewLayout *)self shelfLayoutSections];
        uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v17, "section"));

        uint64_t v16 = [v17 item];
        if (v16 < [v15 numberOfItems])
        {
          objc_msgSend(v15, "itemFrameAtIndex:", objc_msgSend(v17, "item"));
          double v6 = CGRectGetMinX(v19) - v13;
        }
      }
    }
    objc_msgSend(v4, "setVuiContentOffset:", v6, v8);
  }
}

- (id)indexPathForSnappedContent
{
  if ([(VUIShelfViewLayout *)self shouldSnapContent])
  {
    v3 = [(VUIShelfViewLayout *)self collectionView];
    [v3 vuiContentOffset];
    double v4 = -[VUIShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:");
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (VUIShelfViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIShelfViewLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (VUIShelfLayoutHelper)layoutHelper
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end