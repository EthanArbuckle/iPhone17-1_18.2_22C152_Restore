@interface VideosExtrasCarouselCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)_contentOffsetForItemAtIndex:(int64_t)a3 collectionViewBounds:(CGRect)a4;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)cachedCollectionViewContentSize;
- (NSDictionary)cachedLayoutAttributes;
- (VideosExtrasCarouselCollectionViewLayout)init;
- (double)_neighboringItemVisibleWidth;
- (double)_spaceBetweenItems;
- (double)_spaceBetweenItemsForCollectionViewBounds:(CGRect)a3;
- (double)itemWidth;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)_indexOfVisibleItemForContentOffset:(CGPoint)a3 collectionViewBounds:(CGRect)a4;
- (int64_t)indexOfVisibleItemForBoundsChange;
- (unint64_t)indexOfVisibleItem;
- (void)finalizeAnimatedBoundsChange;
- (void)prepareForAnimatedBoundsChange:(CGRect)a3;
- (void)prepareLayout;
- (void)setCachedCollectionViewContentSize:(CGSize)a3;
- (void)setCachedLayoutAttributes:(id)a3;
- (void)setIndexOfVisibleItem:(unint64_t)a3;
- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4;
- (void)setIndexOfVisibleItemForBoundsChange:(int64_t)a3;
@end

@implementation VideosExtrasCarouselCollectionViewLayout

- (VideosExtrasCarouselCollectionViewLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  result = [(VideosExtrasCarouselCollectionViewLayout *)&v3 init];
  if (result) {
    result->_indexOfVisibleItemForBoundsChange = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)prepareLayout
{
  v22.receiver = self;
  v22.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  [(VideosExtrasCarouselCollectionViewLayout *)&v22 prepareLayout];
  objc_super v3 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v3 bounds];
  double Height = CGRectGetHeight(v23);
  [(VideosExtrasCarouselCollectionViewLayout *)self itemWidth];
  double v6 = v5;
  [(VideosExtrasCarouselCollectionViewLayout *)self _spaceBetweenItems];
  double v8 = v7;
  [(VideosExtrasCarouselCollectionViewLayout *)self _neighboringItemVisibleWidth];
  double v10 = v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v12 = v8 + v10;
  double v13 = v6 + v8;
  uint64_t v21 = [v3 numberOfSections];
  if (v21 < 1)
  {
    double v20 = 0.0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = [v3 numberOfItemsInSection:v14];
      if (v16 >= 1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v18 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v14];
          v19 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v18];
          objc_msgSend(v19, "setFrame:", v12 + (double)(v15 + i) * v13, 0.0, v6, Height);
          [v11 setObject:v19 forKey:v18];
        }
      }
      v15 += v16;
      ++v14;
    }
    while (v14 != v21);
    double v20 = (double)v15;
  }
  [(VideosExtrasCarouselCollectionViewLayout *)self setCachedLayoutAttributes:v11];
  -[VideosExtrasCarouselCollectionViewLayout setCachedCollectionViewContentSize:](self, "setCachedCollectionViewContentSize:", v13 * v20 + v12 * 2.0 - v8, Height);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v9 = [(VideosExtrasCarouselCollectionViewLayout *)self cachedLayoutAttributes];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__VideosExtrasCarouselCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_1E6DF66B8;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v10 = v8;
  id v13 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

void __78__VideosExtrasCarouselCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  double v5 = [(VideosExtrasCarouselCollectionViewLayout *)self cachedLayoutAttributes];
  CGRect v6 = [v5 objectForKey:v4];

  return v6;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  int64_t v16 = -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:", x, y, v9, v11, v13, v15);
  -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", v16, v9, v11, v13, v15);
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v5 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  return v9 != height || v7 != width;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  -[VideosExtrasCarouselCollectionViewLayout prepareForAnimatedBoundsChange:](&v6, sel_prepareForAnimatedBoundsChange_);
  id v4 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v4 contentOffset];
  int64_t v5 = -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:");

  [(VideosExtrasCarouselCollectionViewLayout *)self setIndexOfVisibleItemForBoundsChange:v5];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  int64_t v6 = [(VideosExtrasCarouselCollectionViewLayout *)self indexOfVisibleItemForBoundsChange];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = v6;
    double v8 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
    [v8 bounds];
    -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", v7);
    CGFloat x = v9;
    CGFloat y = v10;
  }
  double v11 = x;
  double v12 = y;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)finalizeAnimatedBoundsChange
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  [(VideosExtrasCarouselCollectionViewLayout *)&v3 finalizeAnimatedBoundsChange];
  [(VideosExtrasCarouselCollectionViewLayout *)self setIndexOfVisibleItemForBoundsChange:0x7FFFFFFFFFFFFFFFLL];
}

- (unint64_t)indexOfVisibleItem
{
  objc_super v3 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  [v3 bounds];
  unint64_t v12 = -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:", v5, v7, v8, v9, v10, v11);

  return v12;
}

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(VideosExtrasCarouselCollectionViewLayout *)self indexOfVisibleItem] != a3)
  {
    id v7 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
    [v7 bounds];
    -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", a3);
    objc_msgSend(v7, "setContentOffset:animated:", v4);
  }
}

- (double)itemWidth
{
  MPULayoutLinearRelationMake();
  objc_super v3 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  BOOL v4 = [v3 window];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v15.origin.CGFloat x = v6;
  v15.origin.CGFloat y = v8;
  v15.size.double width = v10;
  v15.size.double height = v12;
  CGRectGetWidth(v15);
  v16.origin.CGFloat x = v6;
  v16.origin.CGFloat y = v8;
  v16.size.double width = v10;
  v16.size.double height = v12;
  CGRectGetHeight(v16);
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (CGPoint)_contentOffsetForItemAtIndex:(int64_t)a3 collectionViewBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(VideosExtrasCarouselCollectionViewLayout *)self itemWidth];
  double v11 = v10;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:", x, y, width, height);
  double v13 = (v11 + v12) * (double)a3;
  double v14 = 0.0;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (int64_t)_indexOfVisibleItemForContentOffset:(CGPoint)a3 collectionViewBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.x;
  [(VideosExtrasCarouselCollectionViewLayout *)self itemWidth];
  double v11 = v10;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:", x, y, width, height);
  return llround(v8 / (v11 + v12));
}

- (double)_neighboringItemVisibleWidth
{
  objc_super v3 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v9);

  [(VideosExtrasCarouselCollectionViewLayout *)self itemWidth];
  double v6 = (Width - v5) * 0.5;
  [(VideosExtrasCarouselCollectionViewLayout *)self _spaceBetweenItems];
  return v6 - v7;
}

- (double)_spaceBetweenItems
{
  objc_super v3 = [(VideosExtrasCarouselCollectionViewLayout *)self collectionView];
  [v3 bounds];
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:");
  double v5 = v4;

  return v5;
}

- (double)_spaceBetweenItemsForCollectionViewBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  MPULayoutLinearRelationMake();
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetWidth(v9);
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (NSDictionary)cachedLayoutAttributes
{
  return self->_cachedLayoutAttributes;
}

- (void)setCachedLayoutAttributes:(id)a3
{
}

- (CGSize)cachedCollectionViewContentSize
{
  double width = self->_cachedCollectionViewContentSize.width;
  double height = self->_cachedCollectionViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedCollectionViewContentSize:(CGSize)a3
{
  self->_cachedCollectionViewContentSize = a3;
}

- (int64_t)indexOfVisibleItemForBoundsChange
{
  return self->_indexOfVisibleItemForBoundsChange;
}

- (void)setIndexOfVisibleItemForBoundsChange:(int64_t)a3
{
  self->_indexOfVisibleItemForBoundsChange = a3;
}

- (void).cxx_destruct
{
}

@end