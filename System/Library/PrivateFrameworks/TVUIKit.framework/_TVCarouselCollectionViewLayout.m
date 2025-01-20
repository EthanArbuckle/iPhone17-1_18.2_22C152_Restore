@interface _TVCarouselCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)itemSize;
- (double)minimumInteritemSpacing;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)_expectedNumberOfCells;
- (void)prepareLayout;
- (void)setItemSize:(CGSize)a3;
- (void)setMinimumInteritemSpacing:(double)a3;
@end

@implementation _TVCarouselCollectionViewLayout

- (void)prepareLayout
{
  id v24 = [(_TVCarouselCollectionViewLayout *)self collectionView];
  uint64_t v3 = [v24 numberOfItemsInSection:0];
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v3];
  [(_TVCarouselCollectionViewLayout *)self itemSize];
  double v6 = v5;
  double v8 = v7;
  [(_TVCarouselCollectionViewLayout *)self minimumInteritemSpacing];
  double v10 = v9;
  [v24 center];
  double v12 = v11;
  [v24 contentOffset];
  double v14 = v13;
  [v24 center];
  [v24 contentOffset];
  [(_TVCarouselCollectionViewLayout *)self itemSize];
  if (v3 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = (uint64_t)((v12 + v14) / (v10 + v15));
    double v18 = v6 + v10;
    double v19 = 0.0;
    do
    {
      v20 = [MEMORY[0x263F088C8] indexPathForItem:v16 inSection:0];
      v21 = [MEMORY[0x263F1C520] layoutAttributesForCellWithIndexPath:v20];
      objc_msgSend(v21, "setFrame:", v19, 0.0, v6, v8);
      objc_msgSend(v21, "setZIndex:", objc_msgSend(v20, "item") == v17);
      [v4 setObject:v21 forKeyedSubscript:v20];
      double v19 = v18 + v19;

      ++v16;
    }
    while (v3 != v16);
  }
  v22 = (NSDictionary *)[v4 copy];
  layoutAttributesByIndexPath = self->_layoutAttributesByIndexPath;
  self->_layoutAttributesByIndexPath = v22;
}

- (CGSize)collectionViewContentSize
{
  uint64_t v3 = [(_TVCarouselCollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:0];

  [(_TVCarouselCollectionViewLayout *)self itemSize];
  double v6 = v5;
  [(_TVCarouselCollectionViewLayout *)self minimumInteritemSpacing];
  if (v4)
  {
    double v8 = 0.0;
    if (v4 != 1) {
      double v8 = (v6 + v7) * (double)(unint64_t)(v4 - 1);
    }
    double v9 = v6 + v8;
    [(_TVCarouselCollectionViewLayout *)self itemSize];
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
          double v15 = -[NSDictionary objectForKeyedSubscript:](self->_layoutAttributesByIndexPath, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
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
  return 1;
}

- (int64_t)_expectedNumberOfCells
{
  [(_TVCarouselCollectionViewLayout *)self itemSize];
  double v4 = v3;
  double v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  double Width = CGRectGetWidth(v16);

  double v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  double Height = CGRectGetHeight(v17);

  if (Width < Height) {
    double Width = Height;
  }
  double v9 = (double)(uint64_t)v4;
  [(_TVCarouselCollectionViewLayout *)self minimumInteritemSpacing];
  double v11 = v9 + v10 * 2.0;
  int64_t v12 = 3;
  while (Width > v11)
  {
    [(_TVCarouselCollectionViewLayout *)self minimumInteritemSpacing];
    double v9 = (double)(uint64_t)(v9 + v9 + v13 * 2.0);
    [(_TVCarouselCollectionViewLayout *)self minimumInteritemSpacing];
    double v11 = v9 + v14 * 2.0;
    v12 += 2;
  }
  return v12;
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

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (void).cxx_destruct
{
}

@end