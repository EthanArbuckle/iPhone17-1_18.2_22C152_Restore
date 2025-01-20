@interface _TVCarouselCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)_expectedNumberOfCells;
- (void)prepareLayout;
@end

@implementation _TVCarouselCollectionViewLayout

- (void)prepareLayout
{
  v3 = [(_TVCarouselCollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:0];

  id v17 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v4];
  [(UICollectionViewFlowLayout *)self itemSize];
  double v6 = v5;
  double v8 = v7;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  if (v4 >= 1)
  {
    uint64_t v10 = 0;
    double v11 = v6 + v9;
    double v12 = 0.0;
    do
    {
      v13 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:0];
      v14 = [MEMORY[0x263F1C520] layoutAttributesForCellWithIndexPath:v13];
      objc_msgSend(v14, "setFrame:", v12, 0.0, v6, v8);
      [v17 setObject:v14 forKeyedSubscript:v13];

      double v12 = v11 + v12;
      ++v10;
    }
    while (v4 != v10);
  }
  v15 = (NSDictionary *)[v17 copy];
  layoutAttributesByIndexPath = self->_layoutAttributesByIndexPath;
  self->_layoutAttributesByIndexPath = v15;
}

- (CGSize)collectionViewContentSize
{
  v3 = [(_TVCarouselCollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:0];

  [(UICollectionViewFlowLayout *)self itemSize];
  double v6 = v5;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  if (v4)
  {
    double v8 = 0.0;
    if (v4 != 1) {
      double v8 = (v6 + v7) * (double)(unint64_t)(v4 - 1);
    }
    double v9 = v6 + v8;
    [(UICollectionViewFlowLayout *)self itemSize];
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v8 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  id v9 = 0;
  if (!CGRectIsEmpty(v24))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v10 = self->_layoutAttributesByIndexPath;
    uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = -[NSDictionary objectForKeyedSubscript:](self->_layoutAttributesByIndexPath, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          [v15 frame];
          v26.origin.CGFloat x = x;
          v26.origin.CGFloat y = y;
          v26.size.CGFloat width = width;
          v26.size.CGFloat height = height;
          if (CGRectIntersectsRect(v25, v26)) {
            [v8 addObject:v15];
          }
        }
        uint64_t v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    id v9 = v8;
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSDictionary *)self->_layoutAttributesByIndexPath objectForKeyedSubscript:a3];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 0;
}

- (int64_t)_expectedNumberOfCells
{
  [(UICollectionViewFlowLayout *)self itemSize];
  double v4 = v3;
  double v5 = [(_TVCarouselCollectionViewLayout *)self collectionView];
  [v5 bounds];
  if (CGRectGetWidth(v15) > 0.0) {
    [(_TVCarouselCollectionViewLayout *)self collectionView];
  }
  else {
  double v6 = [MEMORY[0x263F1C920] mainScreen];
  }
  [v6 bounds];
  double Width = CGRectGetWidth(v16);

  double v8 = (double)(uint64_t)v4;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v10 = v8 + v9 * 2.0;
  int64_t v11 = 3;
  while (Width > v10)
  {
    [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
    double v8 = (double)(uint64_t)(v8 + v8 + v12 * 2.0);
    [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
    double v10 = v8 + v13 * 2.0;
    v11 += 2;
  }
  return v11;
}

- (void).cxx_destruct
{
}

@end