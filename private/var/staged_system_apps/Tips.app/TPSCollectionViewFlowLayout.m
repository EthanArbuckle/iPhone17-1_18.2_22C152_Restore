@interface TPSCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result;
- (CGSize)collectionViewContentSize;
- (TPSCollectionViewFlowLayout)init;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)_updateParallaxForLayoutAttributes:(id)a3;
- (void)prepareLayout;
- (void)updateLayoutAttributesCache;
@end

@implementation TPSCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (TPSCollectionViewFlowLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)TPSCollectionViewFlowLayout;
  v2 = [(TPSCollectionViewFlowLayout *)&v8 init];
  v3 = v2;
  if (v2)
  {
    CGSize size = CGRectZero.size;
    v2->_cacheBounds.origin = CGRectZero.origin;
    v2->_cacheBounds.CGSize size = size;
    v5 = objc_alloc_init(TPSParallaxComputer);
    parallaxComputer = v3->_parallaxComputer;
    v3->_parallaxComputer = v5;

    [(TPSParallaxComputer *)v3->_parallaxComputer setAxis:1];
    [(TPSParallaxComputer *)v3->_parallaxComputer setParallaxFactor:0.125];
    [(TPSParallaxComputer *)v3->_parallaxComputer setModel:1];
  }
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)TPSCollectionViewFlowLayout;
  [(TPSCollectionViewFlowLayout *)&v13 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(TPSCollectionViewFlowLayout *)self collectionView];
  uint64_t v8 = (uint64_t)[v7 numberOfItemsInSection:0];

  if (v8 >= 2)
  {
    v9 = [(TPSCollectionViewFlowLayout *)self collectionView];
    [v9 _interpageSpacing];
    double v4 = v4 + v10 * (double)(v8 - 1);
  }
  double v11 = v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)prepareLayout
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCollectionViewFlowLayout;
  [(TPSCollectionViewFlowLayout *)&v5 prepareLayout];
  if (!self->_layoutAttributesCache)
  {
    double v3 = (NSMutableArray *)[&__NSArray0__struct mutableCopy];
    layoutAttributesCache = self->_layoutAttributesCache;
    self->_layoutAttributesCache = v3;
  }
  [(TPSCollectionViewFlowLayout *)self updateLayoutAttributesCache];
}

- (void)updateLayoutAttributesCache
{
  [(NSMutableArray *)self->_layoutAttributesCache removeAllObjects];
  double v3 = [(TPSCollectionViewFlowLayout *)self collectionView];
  uint64_t v4 = (uint64_t)[v3 numberOfItemsInSection:0];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = +[NSIndexPath indexPathForRow:i inSection:0];
      v7 = [(TPSCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v6];
      if (v7) {
        [(NSMutableArray *)self->_layoutAttributesCache addObject:v7];
      }
    }
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TPSCollectionViewFlowLayout;
  unsigned __int8 v8 = [(TPSCollectionViewFlowLayout *)&v17 shouldInvalidateLayoutForBoundsChange:"shouldInvalidateLayoutForBoundsChange:"];
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v18);
  if (v8) {
    goto LABEL_4;
  }
  double v10 = v9;
  double v9 = CGRectGetWidth(self->_cacheBounds);
  if (v9 != v10)
  {
    self->_cacheBounds.size.CGFloat width = v10;
LABEL_4:
    double v11 = [(TPSCollectionViewFlowLayout *)self collectionView];
    double v12 = [v11 indexPathsForVisibleItems];
    objc_super v13 = [v12 firstObject];
    preRotationIndexPath = self->_preRotationIndexPath;
    self->_preRotationIndexPath = v13;

    return 1;
  }
  double MinX = CGRectGetMinX(self->_cacheBounds);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  return MinX != CGRectGetMinX(v19);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v13.receiver = self;
  v13.super_class = (Class)TPSCollectionViewFlowLayout;
  double v6 = -[TPSCollectionViewFlowLayout invalidationContextForBoundsChange:](&v13, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y);
  [v6 setInvalidateFlowLayoutDelegateMetrics:1];
  [v6 setInvalidateFlowLayoutAttributes:1];
  v7 = [(TPSCollectionViewFlowLayout *)self collectionView];
  [v7 bounds];
  if (width == v9 && height == v8)
  {
    double v11 = [v7 indexPathsForVisibleItems];
    [v6 invalidateItemsAtIndexPaths:v11];
  }

  return v6;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = self->_layoutAttributesCache;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v14 frame:v16];
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        if (CGRectIntersectsRect(v22, v23))
        {
          if (!v11) {
            id v11 = [&__NSArray0__struct mutableCopy];
          }
          [(TPSCollectionViewFlowLayout *)self _updateParallaxForLayoutAttributes:v14];
          [v11 addObject:v14];
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  if (self->_preRotationIndexPath)
  {
    uint64_t v4 = -[TPSCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", result.x, result.y);
    [v4 frame];
    CGFloat MinX = CGRectGetMinX(v8);

    preRotationIndexPath = self->_preRotationIndexPath;
    self->_preRotationIndexPath = 0;

    result.CGFloat y = 0.0;
  }
  else
  {
    CGFloat MinX = result.x;
  }
  double v7 = MinX;
  result.CGFloat x = v7;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v5 = [v4 row],
        (uint64_t)v5 >= (uint64_t)[(NSMutableArray *)self->_layoutAttributesCache count])
    || (-[NSMutableArray objectAtIndexedSubscript:](self->_layoutAttributesCache, "objectAtIndexedSubscript:", [v4 row]), (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)TPSCollectionViewFlowLayout;
    double v6 = [(TPSCollectionViewFlowLayout *)&v17 layoutAttributesForItemAtIndexPath:v4];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    objc_super v13 = [(TPSCollectionViewFlowLayout *)self collectionView];
    [v13 _interpageSpacing];
    double v15 = (v10 + v14) * (double)(uint64_t)[v4 row];

    [v6 setFrame:v15, v8, v10, v12];
  }
  [(TPSCollectionViewFlowLayout *)self _updateParallaxForLayoutAttributes:v6];

  return v6;
}

- (void)_updateParallaxForLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSCollectionViewFlowLayout *)self collectionView];
  [v6 bounds];
  [v6 adjustedContentInset];
  [v4 frame];
  parallaxComputer = self->_parallaxComputer;
  [v4 frame];
  -[TPSParallaxComputer contentParallaxOffsetForViewFrame:visibleRect:](parallaxComputer, "contentParallaxOffsetForViewFrame:visibleRect:");
  [v4 setParallaxOffset:];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallaxComputer, 0);
  objc_storeStrong((id *)&self->_preRotationIndexPath, 0);

  objc_storeStrong((id *)&self->_layoutAttributesCache, 0);
}

@end