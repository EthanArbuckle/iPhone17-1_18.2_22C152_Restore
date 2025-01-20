@interface REUpNextCollectionViewSingleItemFlowLayout
- (NSIndexPath)preferedIndexPath;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
- (void)setPreferedIndexPath:(id)a3;
@end

@implementation REUpNextCollectionViewSingleItemFlowLayout

- (void)prepareLayout
{
  v22.receiver = self;
  v22.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
  [(UICollectionViewFlowLayout *)&v22 prepareLayout];
  v3 = [(REUpNextCollectionViewSingleItemFlowLayout *)self collectionView];
  [v3 bounds];

  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  v8 = (NSDictionary *)objc_opt_new();
  v9 = [(REUpNextCollectionViewSingleItemFlowLayout *)self collectionView];
  uint64_t v10 = [v9 numberOfSections];

  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      v12 = [(REUpNextCollectionViewSingleItemFlowLayout *)self collectionView];
      uint64_t v13 = [v12 numberOfItemsInSection:i];

      if (v13 >= 1)
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          v15 = [MEMORY[0x263F088C8] indexPathForItem:j inSection:i];
          v21.receiver = self;
          v21.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
          v16 = [(REUpNextCollectionViewFlowLayout *)&v21 layoutAttributesForItemAtIndexPath:v15];
          v17 = (void *)[v16 copy];

          int v18 = [(NSIndexPath *)self->_preferedIndexPath isEqual:v15];
          double v19 = 0.0;
          if (v18)
          {
            objc_storeStrong((id *)&self->_preferedCellAttributes, v17);
            objc_msgSend(v17, "setCenter:", v5, v7);
            double v19 = 1.0;
          }
          [v17 setAlpha:v19];
          [(NSDictionary *)v8 setObject:v17 forKeyedSubscript:v15];
        }
      }
    }
  }
  allAttributes = self->_allAttributes;
  self->_allAttributes = v8;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  if (self->_preferedCellAttributes)
  {
    v5[0] = self->_preferedCellAttributes;
    v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }

  return v3;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSDictionary *)self->_allAttributes objectForKeyedSubscript:a3];
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
  double v4 = [(UICollectionViewFlowLayout *)&v7 layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:a4];
  double v5 = (void *)[v4 copy];

  [v5 setAlpha:0.0];

  return v5;
}

- (NSIndexPath)preferedIndexPath
{
  return self->_preferedIndexPath;
}

- (void)setPreferedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferedIndexPath, 0);
  objc_storeStrong((id *)&self->_allAttributes, 0);

  objc_storeStrong((id *)&self->_preferedCellAttributes, 0);
}

@end