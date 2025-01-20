@interface PUHorizontalCollectionViewLayout
+ (Class)invalidationContextClass;
- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3;
- (CGRect)collectionViewBounds;
- (CGSize)collectionViewContentSize;
- (CGSize)itemSize;
- (PUHorizontalCollectionViewLayout)init;
- (PUHorizontalCollectionViewLayoutDelegate)delegate;
- (UIEdgeInsets)itemsContentInset;
- (double)interitemSpacing;
- (id)_layoutAttributesForItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setDelegate:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setItemsContentInset:(UIEdgeInsets)a3;
@end

@implementation PUHorizontalCollectionViewLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastRequestedLayoutAttributesInRect, 0);
  objc_storeStrong((id *)&self->_cachedSectionFrames, 0);
  objc_storeStrong((id *)&self->_cachedItemLayoutAttributes, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUHorizontalCollectionViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUHorizontalCollectionViewLayoutDelegate *)WeakRetained;
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

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)collectionViewBounds
{
  v2 = [(PUHorizontalCollectionViewLayout *)self collectionView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_lastRequestedRect = &self->_lastRequestedRect;
  if (CGRectEqualToRect(a3, self->_lastRequestedRect)
    && (lastRequestedLayoutAttributesInRect = self->_lastRequestedLayoutAttributesInRect) != 0)
  {
    double v10 = lastRequestedLayoutAttributesInRect;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB15E0]);
    objc_msgSend(v11, "setFrame:", x, y, width, height);
    NSUInteger v12 = [(NSArray *)self->_cachedSectionFrames count];
    NSUInteger v13 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_cachedSectionFrames, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, v12, 256, &__block_literal_global_29580);
    NSUInteger v14 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_cachedSectionFrames, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, v12, 512, &__block_literal_global_29580);
    v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v17 = v14;
      v18 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v14];
      uint64_t v19 = objc_msgSend(v18, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v18, "count"), 512, &__block_literal_global_29580);
      v15 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v13];

      uint64_t v20 = objc_msgSend(v15, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v15, "count"), 256, &__block_literal_global_29580);
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = v20;
        if (v13 == v17)
        {
          uint64_t v23 = v19 - v20 + 1;
          v24 = v10;
          v25 = v15;
          uint64_t v26 = v22;
        }
        else
        {
          PUInsertObjectsInRange(v10, v15, v20, [v15 count] - v20);
          int64_t v27 = v13 + 1;
          if (v27 >= v17)
          {
            v28 = v15;
          }
          else
          {
            do
            {
              v28 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v27];

              [(NSArray *)v10 addObjectsFromArray:v28];
              ++v27;
              v15 = v28;
            }
            while (v17 != v27);
          }
          v15 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v17];

          uint64_t v23 = v19 + 1;
          v24 = v10;
          v25 = v15;
          uint64_t v26 = 0;
        }
        PUInsertObjectsInRange(v24, v25, v26, v23);
      }
    }
    p_lastRequestedRect->origin.double x = x;
    p_lastRequestedRect->origin.double y = y;
    p_lastRequestedRect->size.double width = width;
    p_lastRequestedRect->size.double height = height;
    objc_storeStrong((id *)&self->_lastRequestedLayoutAttributesInRect, v10);
  }
  return v10;
}

uint64_t __70__PUHorizontalCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (CGSize)collectionViewContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)prepareLayout
{
  if (!self->_cachedItemLayoutAttributes || !self->_cachedSectionFrames)
  {
    id v70 = [(PUHorizontalCollectionViewLayout *)self collectionView];
    double v3 = [(PUHorizontalCollectionViewLayout *)self delegate];
    uint64_t v4 = [v70 numberOfSections];
    v56 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    v57 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    [(PUHorizontalCollectionViewLayout *)self interitemSpacing];
    [(PUHorizontalCollectionViewLayout *)self itemsContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v54 = v11;
    [(PUHorizontalCollectionViewLayout *)self collectionViewBounds];
    double v71 = v12 - (v6 + v10);
    double v13 = self;
    [(PUHorizontalCollectionViewLayout *)self itemSize];
    uint64_t v55 = v4;
    if (v4 >= 1)
    {
      uint64_t v14 = 0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      do
      {
        uint64_t v18 = [v70 numberOfItemsInSection:v14];
        double v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
        if (v18 >= 1)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            v21 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v14];
            v73.origin.double x = v8;
            v73.origin.double y = v15;
            v73.size.double width = v16;
            v73.size.double height = v17;
            CGRectGetMaxX(v73);
            if (v3) {
              [v3 layout:self collectionView:v70 sizeForItemAtIndexPath:v21];
            }
            uint64_t v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
            [v22 scale];
            UIRectIntegralWithScale();
            double v8 = v23;
            double v15 = v24;
            double v16 = v25;
            double v17 = v26;

            CGRect v27 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v21];
            objc_msgSend(v27, "setFrame:", v8, v15, v16, v17);
            [v19 addObject:v27];
          }
        }
        [(NSArray *)v56 addObject:v19];
        CGRect v28 = [v19 firstObject];
        [v28 frame];
        CGFloat v66 = v30;
        CGFloat v68 = v29;
        CGFloat v62 = v32;
        CGFloat v64 = v31;

        v33 = [v19 lastObject];
        [v33 frame];
        CGFloat v60 = v35;
        CGFloat v61 = v34;
        CGFloat v58 = v37;
        CGFloat v59 = v36;

        v74.origin.double y = v66;
        v74.origin.double x = v68;
        v74.size.double height = v62;
        v74.size.double width = v64;
        v77.origin.double y = v60;
        v77.origin.double x = v61;
        v77.size.double height = v58;
        v77.size.double width = v59;
        CGRect v75 = CGRectUnion(v74, v77);
        double y = v75.origin.y;
        double x = v75.origin.x;
        double height = v75.size.height;
        double width = v75.size.width;
        id v38 = objc_alloc_init(MEMORY[0x1E4FB15E0]);
        objc_msgSend(v38, "setFrame:", x, y, width, height);
        [(NSArray *)v57 addObject:v38];

        ++v14;
      }
      while (v14 != v55);
    }
    v39 = self;
    cachedItemLayoutAttributes = self->_cachedItemLayoutAttributes;
    v13->_cachedItemLayoutAttributes = v56;
    v41 = v56;

    cachedSectionFrames = v13->_cachedSectionFrames;
    v13->_cachedSectionFrames = v57;
    v43 = v57;

    v44 = [(NSArray *)v13->_cachedItemLayoutAttributes lastObject];

    v45 = [v44 lastObject];
    [v45 frame];
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;

    v76.origin.double x = v47;
    v76.origin.double y = v49;
    v76.size.double width = v51;
    v76.size.double height = v53;
    v39->_contentSize.double width = v54 + CGRectGetMaxX(v76);
    v39->_contentSize.double height = v71;
  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUHorizontalCollectionViewLayout;
  [(PUHorizontalCollectionViewLayout *)&v9 invalidateLayoutWithContext:v4];
  if (([v4 invalidateCachedLayout] & 1) != 0
    || ([v4 invalidateDataSourceCounts] & 1) != 0
    || [v4 invalidateEverything])
  {
    cachedItemLayoutAttributes = self->_cachedItemLayoutAttributes;
    self->_cachedItemLayoutAttributes = 0;

    cachedSectionFrames = self->_cachedSectionFrames;
    self->_cachedSectionFrames = 0;

    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_lastRequestedRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_lastRequestedRect.size = v7;
    lastRequestedLayoutAttributesInRect = self->_lastRequestedLayoutAttributesInRect;
    self->_lastRequestedLayoutAttributesInRect = 0;
  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PUHorizontalCollectionViewLayout;
  double v8 = -[PUHorizontalCollectionViewLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_);
  BOOL v9 = ([v8 invalidateDataSourceCounts] & 1) != 0
    || ([v8 invalidateEverything] & 1) != 0
    || -[PUHorizontalCollectionViewLayout _shouldInvalidateCachedLayoutForBoundsChange:](self, "_shouldInvalidateCachedLayoutForBoundsChange:", x, y, width, height);
  [v8 _setInvalidateCachedLayout:v9];
  return v8;
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  [(PUHorizontalCollectionViewLayout *)self collectionViewBounds];
  return v4 != height;
}

- (void)setItemsContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PUHorizontalCollectionViewLayout *)self itemsContentInset];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_itemsContentInset.double top = top;
    self->_itemsContentInset.double left = left;
    self->_itemsContentInset.double bottom = bottom;
    self->_itemsContentInset.double right = right;
    double v15 = objc_alloc_init(PUHorizontalCollectionViewLayoutInvalidationContext);
    [(PUHorizontalCollectionViewLayoutInvalidationContext *)v15 _setInvalidateCachedLayout:1];
    [(PUHorizontalCollectionViewLayout *)self invalidateLayoutWithContext:v15];
  }
}

- (void)setInteritemSpacing:(double)a3
{
  [(PUHorizontalCollectionViewLayout *)self interitemSpacing];
  if (v5 != a3)
  {
    self->_interitemSpacing = a3;
    [(PUHorizontalCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setItemSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUHorizontalCollectionViewLayout *)self itemSize];
  if (v7 != width || v6 != height)
  {
    self->_itemSize.double width = width;
    self->_itemSize.double height = height;
    [(PUHorizontalCollectionViewLayout *)self invalidateLayout];
  }
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  unint64_t v6 = [v4 item];

  if (v5 >= [(NSArray *)self->_cachedItemLayoutAttributes count])
  {
    double v9 = 0;
  }
  else
  {
    double v7 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v5];
    if (v6 >= [v7 count])
    {
      double v9 = 0;
    }
    else
    {
      double v8 = [(NSArray *)self->_cachedItemLayoutAttributes objectAtIndexedSubscript:v5];
      double v9 = [v8 objectAtIndexedSubscript:v6];
    }
  }
  return v9;
}

- (PUHorizontalCollectionViewLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUHorizontalCollectionViewLayout;
  v2 = [(PUHorizontalCollectionViewLayout *)&v6 init];
  double v3 = v2;
  if (v2)
  {
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->_lastRequestedRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->_lastRequestedRect.size = v4;
    -[PUHorizontalCollectionViewLayout setItemSize:](v2, "setItemSize:", 50.0, 50.0);
  }
  return v3;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end