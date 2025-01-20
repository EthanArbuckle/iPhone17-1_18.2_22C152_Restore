@interface PKDiscoveryLayout
- (BOOL)isScrollable;
- (CGSize)collectionViewContentSize;
- (PKDiscoveryLayout)init;
- (double)interimSpacing;
- (double)lineSpacing;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)_adjustItems:(id)a3 withLateralMove:(double)a4;
- (void)prepareLayout;
- (void)setInterimSpacing:(double)a3;
- (void)setIsScrollable:(BOOL)a3;
- (void)setLineSpacing:(double)a3;
@end

@implementation PKDiscoveryLayout

- (PKDiscoveryLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryLayout;
  v2 = [(PKDiscoveryLayout *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributesPerIndexPath = v2->_attributesPerIndexPath;
    v2->_attributesPerIndexPath = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    headersPerIndexPath = v2->_headersPerIndexPath;
    v2->_headersPerIndexPath = v5;
  }
  return v2;
}

- (CGSize)collectionViewContentSize
{
  p_currentSize = &self->_currentSize;
  CGFloat width = self->_currentSize.width;
  double height = self->_currentSize.height;
  unint64_t v6 = PKUIGetMinScreenType();
  v7 = (double *)((char *)&unk_1A0444AF0 + 8 * v6);
  if (v6 >= 0x14) {
    v7 = (double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = *v7;
  double v9 = p_currentSize->height;
  BOOL v10 = v9 < *v7;
  BOOL v11 = v9 >= *v7;
  double v12 = v8 + 5.0;
  if (v10) {
    double v13 = v12;
  }
  else {
    double v13 = height;
  }
  self->_isScrollable = v11;
  double v14 = width;
  result.double height = v13;
  result.CGFloat width = v14;
  return result;
}

- (void)prepareLayout
{
  v3 = [(PKDiscoveryLayout *)self collectionView];
  uint64_t v4 = [v3 delegate];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    [(NSMutableDictionary *)self->_attributesPerIndexPath removeAllObjects];
    [v3 bounds];
    double v7 = v6;
    p_currentSize = &self->_currentSize;
    self->_currentSize.CGFloat width = v6;
    self->_currentSize.double height = 0.0;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v3 numberOfSections] >= 1)
    {
      uint64_t v10 = 0;
      double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v38 = *MEMORY[0x1E4F1DB30];
      uint64_t v37 = *MEMORY[0x1E4FB2770];
      do
      {
        double height = p_currentSize->height;
        [v5 collectionView:v3 layout:self referenceSizeForHeaderInSection:v10];
        double v15 = v14;
        BOOL v16 = v14 == v38 && v13 == v11;
        double v17 = v11;
        double v18 = 0.0;
        if (!v16)
        {
          double v19 = v13;
          v20 = (void *)MEMORY[0x1E4FB15E0];
          v21 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          v22 = [v20 layoutAttributesForSupplementaryViewOfKind:v37 withIndexPath:v21];

          objc_msgSend(v22, "setSize:", v15, v19);
          objc_msgSend(v22, "setFrame:", 0.0, height, v15, v19);
          headersPerIndexPath = self->_headersPerIndexPath;
          v24 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          [(NSMutableDictionary *)headersPerIndexPath setObject:v22 forKey:v24];

          [v9 addObject:v22];
          double v18 = v15 + 0.0;

          double v17 = v19;
        }
        uint64_t v25 = [v3 numberOfItemsInSection:v10];
        if (v25)
        {
          uint64_t v26 = v25;
          for (uint64_t i = 0; i != v26; ++i)
          {
            v28 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v10];
            [v5 collectionView:v3 layout:self sizeForItemAtIndexPath:v28];
            double v30 = v29;
            double v32 = v31;
            if (v7 - v18 >= v29)
            {
              if (v18 != 0.0) {
                double v18 = v18 + self->_interimSpacing;
              }
            }
            else
            {
              double height = height + v17 + self->_lineSpacing;
              PKFloatRoundToPixel();
              -[PKDiscoveryLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v9);
              [v9 removeAllObjects];
              double v18 = 0.0;
            }
            v33 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v28];
            objc_msgSend(v33, "setSize:", v30, v32);
            objc_msgSend(v33, "setFrame:", v18, height, v30, v32);
            [(NSMutableDictionary *)self->_attributesPerIndexPath setObject:v33 forKey:v28];
            [v9 addObject:v33];
            double v18 = v30 + v18;

            double v17 = v32;
          }
        }
        else
        {
          double v32 = v17;
        }
        if ([v9 count])
        {
          PKFloatRoundToPixel();
          double v35 = v34;
          v36 = (void *)[v9 copy];
          [(PKDiscoveryLayout *)self _adjustItems:v36 withLateralMove:v35];

          [v9 removeAllObjects];
        }
        p_currentSize = &self->_currentSize;
        self->_currentSize.double height = v32 + height;
        ++v10;
      }
      while (v10 < [v3 numberOfSections]);
    }
    p_currentSize->double height = p_currentSize->height + 16.0;
    v39.receiver = self;
    v39.super_class = (Class)PKDiscoveryLayout;
    [(PKDiscoveryLayout *)&v39 prepareLayout];
  }
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 frame];
        [v10 setFrame:v11 + a4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_attributesPerIndexPath;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[NSMutableDictionary objectForKey:](self->_attributesPerIndexPath, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (double)interimSpacing
{
  return self->_interimSpacing;
}

- (void)setInterimSpacing:(double)a3
{
  self->_interimSpacing = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (BOOL)isScrollable
{
  return self->_isScrollable;
}

- (void)setIsScrollable:(BOOL)a3
{
  self->_isScrollable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headersPerIndexPath, 0);

  objc_storeStrong((id *)&self->_attributesPerIndexPath, 0);
}

@end