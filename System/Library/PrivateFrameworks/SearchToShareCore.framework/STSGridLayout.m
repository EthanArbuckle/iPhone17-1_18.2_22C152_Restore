@interface STSGridLayout
- (BOOL)_hasOnlyLargeItems;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)_gridFrameForRow:(unint64_t)a3 andColumn:(unint64_t)a4 inSize:(CGSize)a5;
- (CGSize)_availableContentSize;
- (CGSize)collectionViewContentSize;
- (STSGridLayout)init;
- (double)footerHeight;
- (double)headerHeight;
- (double)itemSpacing;
- (id)_gridLayoutDelegate;
- (id)_gridTilesForCurrentDataSource;
- (id)_tileSmallFramesForSize:(CGSize)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)maximumCellsPerRow;
- (unint64_t)_tilesPerRowAndWidth:(double *)a3;
- (void)_gridTilesForCurrentDataSource;
- (void)_redistributeLastRowItemsInTiles:(id)a3 withTilesPerRow:(unint64_t)a4;
- (void)invalidateLayout;
- (void)prepareLayout;
- (void)setFooterHeight:(double)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setItemSpacing:(double)a3;
@end

@implementation STSGridLayout

- (STSGridLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)STSGridLayout;
  v2 = [(STSGridLayout *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_itemSpacing = 6.0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    tileSmallFrameCache = v3->_tileSmallFrameCache;
    v3->_tileSmallFrameCache = (NSMutableDictionary *)v4;

    [(STSGridLayout *)v3 registerClass:objc_opt_class() forDecorationViewOfKind:@"TileOverlay"];
  }
  return v3;
}

- (void)prepareLayout
{
  BOOL v3 = [(STSGridLayout *)self _hasOnlyLargeItems];
  uint64_t v4 = [(STSGridLayout *)self _gridTilesForCurrentDataSource];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v50 = 0;
  v51 = (CGFloat *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  if (self->_headerHeight > 0.0)
  {
    v6 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    objc_super v7 = [MEMORY[0x263F825A0] layoutAttributesForSupplementaryViewOfKind:@"STSGridLayoutElementKindHeader" withIndexPath:v6];
    [(STSGridLayout *)self _availableContentSize];
    CGFloat v9 = v8;
    double headerHeight = self->_headerHeight;
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v8, headerHeight);
    [v7 setZIndex:300];
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.width = v9;
    v54.size.height = headerHeight;
    v51[3] = CGRectGetMaxY(v54) + self->_itemSpacing;
    v11 = [NSDictionary dictionaryWithObject:v7 forKey:v6];
    headerAttributes = self->_headerAttributes;
    self->_headerAttributes = v11;
  }
  double v49 = 0.0;
  unint64_t v13 = [(STSGridLayout *)self _tilesPerRowAndWidth:&v49];
  uint64_t v14 = [v4 count];
  double v15 = v49;
  if (v3)
  {
    v16 = [(STSGridLayout *)self collectionView];
    UICeilToViewScale();
    double v18 = v17;

    double v15 = v49;
  }
  else
  {
    double v18 = v49;
  }
  v19 = 0;
  v46[2] = 0x4010000000;
  v46[3] = &unk_22F411A05;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v20 = *((void *)v51 + 3);
  v46[0] = 0;
  v46[1] = v46;
  *((void *)&v47 + 1) = v20;
  *(double *)&long long v48 = v15;
  *((double *)&v48 + 1) = v18;
  if (!v3)
  {
    v19 = -[STSGridLayout _tileSmallFramesForSize:](self, "_tileSmallFramesForSize:", v15, v18);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __30__STSGridLayout_prepareLayout__block_invoke;
  v35[3] = &unk_264A05540;
  BOOL v45 = v3;
  v39 = v46;
  unint64_t v21 = (v13 + v14 - 1) / v13;
  id v22 = v19;
  id v36 = v22;
  id v23 = v5;
  unint64_t v41 = v13;
  unint64_t v42 = v21;
  v40 = &v50;
  id v37 = v23;
  v38 = self;
  double v43 = v18;
  double v44 = v49;
  [v4 enumerateObjectsUsingBlock:v35];
  if (self->_footerHeight > 0.0)
  {
    v24 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    v25 = [MEMORY[0x263F825A0] layoutAttributesForSupplementaryViewOfKind:@"STSGridLayoutElementKindFooter" withIndexPath:v24];
    double v26 = v51[3];
    [(STSGridLayout *)self _availableContentSize];
    CGFloat v28 = v27;
    double footerHeight = self->_footerHeight;
    -[UICollectionViewLayoutAttributes setFrame:](v25, "setFrame:", 0.0, v26, v27, footerHeight);
    [(UICollectionViewLayoutAttributes *)v25 setZIndex:100];
    v55.origin.x = 0.0;
    v55.origin.y = v26;
    v55.size.width = v28;
    v55.size.height = footerHeight;
    v51[3] = CGRectGetMaxY(v55);
    footerAttributes = self->_footerAttributes;
    self->_footerAttributes = v25;
  }
  self->_contentSizeMaxY = v51[3];
  v31 = (NSDictionary *)[v23 copy];
  cellAttributes = self->_cellAttributes;
  self->_cellAttributes = v31;

  v33 = (NSDictionary *)[0 copy];
  tileAttributes = self->_tileAttributes;
  self->_tileAttributes = v33;

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v50, 8);
}

void __30__STSGridLayout_prepareLayout__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = [v5 layoutStyle];
  if (v6 > 5)
  {
    objc_super v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    objc_super v7 = *(&off_264A05620 + v6);
    uint64_t v8 = qword_22F40E630[v6];
    uint64_t v9 = qword_22F40E660[v6];
  }
  uint64_t v55 = 0;
  v56 = (CGFloat *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v10 = [v5 largeIndex];

  if (v10)
  {
    v11 = (void *)MEMORY[0x263F088C8];
    v12 = [v5 largeIndex];
    unint64_t v13 = objc_msgSend(v11, "indexPathForItem:inSection:", objc_msgSend(v12, "integerValue"), 0);

    uint64_t v14 = [MEMORY[0x263F825A0] layoutAttributesForCellWithIndexPath:v13];
    if (*(unsigned char *)(a1 + 104))
    {
      double v15 = *(double **)(*(void *)(a1 + 56) + 8);
      double v16 = v15[4];
      double v17 = v15[5];
      double v18 = v15[6];
      double v19 = v15[7];
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v9];
      [v20 CGRectValue];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      v29 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
      [v29 CGRectValue];
      v64.origin.CGFloat x = v30;
      v64.origin.CGFloat y = v31;
      v64.size.CGFloat width = v32;
      v64.size.CGFloat height = v33;
      v59.origin.CGFloat x = v22;
      v59.origin.CGFloat y = v24;
      v59.size.CGFloat width = v26;
      v59.size.CGFloat height = v28;
      CGRect v60 = CGRectUnion(v59, v64);
      CGFloat x = v60.origin.x;
      CGFloat y = v60.origin.y;
      CGFloat width = v60.size.width;
      CGFloat height = v60.size.height;

      v61.origin.CGFloat x = x;
      v61.origin.CGFloat y = y;
      v61.size.CGFloat width = width;
      v61.size.CGFloat height = height;
      CGRect v62 = CGRectOffset(v61, *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      double v16 = v62.origin.x;
      double v17 = v62.origin.y;
      double v18 = v62.size.width;
      double v19 = v62.size.height;
    }
    objc_msgSend(v14, "setFrame:", v16, v17, v18, v19);
    [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v13];
    v63.origin.CGFloat x = v16;
    v63.origin.CGFloat y = v17;
    v63.size.CGFloat width = v18;
    v63.size.CGFloat height = v19;
    v56[3] = CGRectGetMaxY(v63);
  }
  v38 = [v5 smallIndexes];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __30__STSGridLayout_prepareLayout__block_invoke_40;
  v49[3] = &unk_264A05518;
  id v50 = v7;
  id v39 = *(id *)(a1 + 32);
  uint64_t v40 = *(void *)(a1 + 56);
  id v51 = v39;
  uint64_t v53 = v40;
  id v52 = *(id *)(a1 + 40);
  CGRect v54 = &v55;
  [v38 enumerateObjectsUsingBlock:v49];

  unint64_t v41 = *(void *)(a1 + 72);
  if (a3 / v41 == *(void *)(a1 + 80) - 1)
  {
    double MaxY = v56[3];
  }
  else
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    unint64_t v41 = *(void *)(a1 + 72);
  }
  uint64_t v43 = *(void *)(*(void *)(a1 + 64) + 8);
  if (MaxY < *(double *)(v43 + 24)) {
    double MaxY = *(double *)(v43 + 24);
  }
  *(double *)(v43 + 24) = MaxY;
  unint64_t v44 = a3 % v41;
  unint64_t v45 = v41 - 1;
  v46 = *(CGRect **)(*(void *)(a1 + 56) + 8);
  if (v44 == v45)
  {
    v46[1].origin.CGFloat x = 0.0;
    v46 = *(CGRect **)(*(void *)(a1 + 56) + 8);
    double v47 = *(double *)(a1 + 88) + *(double *)(*(void *)(a1 + 48) + 344);
    double v48 = 0.0;
  }
  else
  {
    double v48 = *(double *)(a1 + 96) + *(double *)(*(void *)(a1 + 48) + 344);
    double v47 = 0.0;
  }
  *(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = CGRectOffset(v46[1], v48, v47);

  _Block_object_dispose(&v55, 8);
}

void __30__STSGridLayout_prepareLayout__block_invoke_40(uint64_t a1, void *a2, unint64_t a3)
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(a2, "integerValue"), 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend(MEMORY[0x263F825A0], "layoutAttributesForCellWithIndexPath:");
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    CGFloat v10 = *MEMORY[0x263F001A8];
    CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    unint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v7 = [v6 integerValue];

    uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v7];
    [v8 CGRectValue];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
  }
  v25.origin.CGFloat x = v10;
  v25.origin.CGFloat y = v12;
  v25.size.CGFloat width = v14;
  v25.size.CGFloat height = v16;
  CGRect v26 = CGRectOffset(v25, *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  objc_msgSend(v5, "setFrame:");
  [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v23];
  double v21 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  if (v21 >= MaxY) {
    double MaxY = v21;
  }
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = MaxY;
}

- (void)invalidateLayout
{
  v8.receiver = self;
  v8.super_class = (Class)STSGridLayout;
  [(STSGridLayout *)&v8 invalidateLayout];
  headerAttributes = self->_headerAttributes;
  self->_headerAttributes = 0;

  cellAttributes = self->_cellAttributes;
  self->_cellAttributes = 0;

  tileAttributes = self->_tileAttributes;
  self->_tileAttributes = 0;

  footerAttributes = self->_footerAttributes;
  self->_footerAttributes = 0;

  hasOnlyLargeItems = self->_hasOnlyLargeItems;
  self->_hasOnlyLargeItems = 0;

  self->_contentSizedouble MaxY = 0.0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = [(STSGridLayout *)self collectionView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v18.origin.CGFloat x = v9;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = v13;
  v18.size.CGFloat height = v15;
  double v16 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  return v16 != CGRectGetWidth(v19);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__STSGridLayout_layoutAttributesForElementsInRect___block_invoke;
  v25[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  CGRect v26 = a3;
  double v8 = (void *)MEMORY[0x230FB7F40](v25, a2);
  CGFloat v9 = [MEMORY[0x263EFF980] array];
  if (self->_headerHeight > 0.0)
  {
    double v10 = [(NSDictionary *)self->_headerAttributes allValues];
    CGFloat v11 = [v10 indexesOfObjectsPassingTest:v8];
    double v12 = [v10 objectsAtIndexes:v11];
    [v9 addObjectsFromArray:v12];
  }
  CGFloat v13 = [(NSDictionary *)self->_cellAttributes allValues];
  double v14 = [v13 indexesOfObjectsPassingTest:v8];
  CGFloat v15 = [v13 objectsAtIndexes:v14];
  [v9 addObjectsFromArray:v15];

  double v16 = [(NSDictionary *)self->_tileAttributes allValues];
  double v17 = [v16 indexesOfObjectsPassingTest:v8];
  CGRect v18 = [v16 objectsAtIndexes:v17];
  [v9 addObjectsFromArray:v18];

  footerAttributes = self->_footerAttributes;
  if (footerAttributes)
  {
    [(UICollectionViewLayoutAttributes *)footerAttributes frame];
    v29.origin.CGFloat x = v20;
    v29.origin.CGFloat y = v21;
    v29.size.CGFloat width = v22;
    v29.size.CGFloat height = v23;
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    if (CGRectIntersectsRect(v28, v29)) {
      [v9 addObject:self->_footerAttributes];
    }
  }

  return v9;
}

BOOL __51__STSGridLayout_layoutAttributesForElementsInRect___block_invoke(void *a1, void *a2)
{
  [a2 frame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  uint64_t v14 = a1[7];

  return CGRectIntersectsRect(*(CGRect *)&v11, *(CGRect *)&v4);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSDictionary *)self->_cellAttributes objectForKeyedSubscript:a3];
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"STSGridLayoutElementKindHeader"])
  {
    uint64_t v8 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v7];
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"STSGridLayoutElementKindFooter"])
  {
    uint64_t v8 = self->_footerAttributes;
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return [(NSDictionary *)self->_tileAttributes objectForKeyedSubscript:a4];
}

- (CGSize)collectionViewContentSize
{
  [(STSGridLayout *)self _availableContentSize];
  contentSizedouble MaxY = self->_contentSizeMaxY;
  result.CGFloat height = contentSizeMaxY;
  result.CGFloat width = v3;
  return result;
}

- (int64_t)maximumCellsPerRow
{
  return 3 * [(STSGridLayout *)self _tilesPerRowAndWidth:0];
}

- (void)setHeaderHeight:(double)a3
{
  if (self->_headerHeight != a3)
  {
    self->_double headerHeight = a3;
    [(STSGridLayout *)self invalidateLayout];
  }
}

- (void)setFooterHeight:(double)a3
{
  if (self->_footerHeight != a3)
  {
    self->_double footerHeight = a3;
    [(STSGridLayout *)self invalidateLayout];
  }
}

- (void)setItemSpacing:(double)a3
{
  if (self->_itemSpacing != a3)
  {
    self->_itemSpacing = a3;
    [(NSMutableDictionary *)self->_tileSmallFrameCache removeAllObjects];
    [(STSGridLayout *)self invalidateLayout];
  }
}

- (id)_gridLayoutDelegate
{
  v2 = [(STSGridLayout *)self collectionView];
  double v3 = [v2 delegate];

  return v3;
}

- (id)_gridTilesForCurrentDataSource
{
  id v25 = [MEMORY[0x263EFF980] array];
  double v3 = [(STSGridLayout *)self collectionView];
  unint64_t v4 = [(STSGridLayout *)self _tilesPerRowAndWidth:0];
  BOOL v5 = [(STSGridLayout *)self _hasOnlyLargeItems];
  CGFloat v22 = v3;
  if ([v3 numberOfSections])
  {
    unint64_t v21 = v4;
    if (v5)
    {
      id v6 = &unk_26E2BA9A8;
    }
    else if (v4 > 2)
    {
      id v6 = &unk_26E2BA9F0;
    }
    else
    {
      id v6 = (void *)qword_264A05650[v4];
    }
    CGFloat v24 = v6;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy_;
    id v37 = __Block_byref_object_dispose_;
    id v38 = 0;
    id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
    uint64_t v8 = [v3 numberOfItemsInSection:0];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 - 1;
      CGFloat v23 = self;
      do
      {
        uint64_t v12 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:0];
        if (v5
          || ([(STSGridLayout *)self _gridLayoutDelegate],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v14 = [v13 collectionView:v22 layout:self sizeForItemAtIndexPath:v12],
              v13,
              !v14))
        {
          uint64_t v14 = 0;
          if (v34[5]) {
            BOOL v15 = 0;
          }
          else {
            BOOL v15 = (unint64_t)[v7 count] < 6;
          }
        }
        else
        {
          if (v14 != 1) {
            goto LABEL_15;
          }
          if (!v34[5]) {
            goto LABEL_21;
          }
          if ((unint64_t)[v7 count] < 5)
          {
            uint64_t v14 = 1;
LABEL_15:
            BOOL v15 = 1;
            goto LABEL_23;
          }
          if (v34[5]) {
            BOOL v15 = 0;
          }
          else {
LABEL_21:
          }
            BOOL v15 = (unint64_t)[v7 count] < 9;
          uint64_t v14 = 1;
        }
LABEL_23:
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __47__STSGridLayout__gridTilesForCurrentDataSource__block_invoke;
        v28[3] = &unk_264A05588;
        id v16 = v7;
        CGFloat v32 = &v33;
        id v29 = v16;
        id v30 = v24;
        id v31 = v25;
        double v17 = (void (**)(void))MEMORY[0x230FB7F40](v28);
        if (!v15)
        {
          if (v11 != v10
            && (!v34[5] && (unint64_t)[v16 count] < 9
             || !v5 && v34[5] && (unint64_t)[v16 count] <= 4)
            && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            [(STSGridLayout *)&buf _gridTilesForCurrentDataSource];
          }
          v17[2](v17);
        }
        if (!v14)
        {
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v10];
          CGRect v18 = (void *)v34[5];
          v34[5] = v19;
          goto LABEL_37;
        }
        if (v14 == 1)
        {
          CGRect v18 = [NSNumber numberWithUnsignedInteger:v10];
          [v16 addObject:v18];
LABEL_37:
        }
        if (v11 == v10) {
          v17[2](v17);
        }

        ++v10;
        self = v23;
      }
      while (v9 != v10);
    }
    if (!v5) {
      [(STSGridLayout *)self _redistributeLastRowItemsInTiles:v25 withTilesPerRow:v21];
    }

    _Block_object_dispose(&v33, 8);
  }

  return v25;
}

void __47__STSGridLayout__gridTilesForCurrentDataSource__block_invoke(uint64_t a1)
{
  BOOL v5 = objc_alloc_init(STSGridTile);
  [(STSGridTile *)v5 setSmallIndexes:*(void *)(a1 + 32)];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "count") % (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"));
    -[STSGridTile setLayoutStyle:](v5, "setLayoutStyle:", [v2 integerValue]);

    [(STSGridTile *)v5 setLargeIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  else
  {
    [(STSGridTile *)v5 setLayoutStyle:0];
  }
  [*(id *)(a1 + 48) addObject:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  [*(id *)(a1 + 32) removeAllObjects];
}

- (void)_redistributeLastRowItemsInTiles:(id)a3 withTilesPerRow:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [v6 lastObject];
    if (!([v6 count] % a4))
    {
      CGRect v26 = [v7 largeIndex];
      if (!v26
        || ([v7 smallIndexes],
            unint64_t v4 = objc_claimAutoreleasedReturnValue(),
            (unint64_t)[v4 count] > 4))
      {
        CGRect v27 = [v7 largeIndex];
        if (v27)
        {

          if (v26)
          {
          }
          goto LABEL_23;
        }
        CGRect v28 = [v7 smallIndexes];
        unint64_t v29 = [v28 count];

        if (v26)
        {

          if (v29 < 9) {
            goto LABEL_3;
          }
        }
        else if (v29 <= 8)
        {
          goto LABEL_3;
        }
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_3:
    CGFloat v32 = v7;
    uint64_t v8 = [v6 count];
    unint64_t v33 = v8 - 1 - (a4 + v8 - 1) % a4;
    uint64_t v9 = objc_msgSend(v6, "subarrayWithRange:", v33, objc_msgSend(v6, "count") - v33);
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 9 * objc_msgSend(v9, "count"));
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke;
    v36[3] = &unk_264A055B0;
    id v12 = v10;
    id v37 = v12;
    id v30 = v11;
    id v31 = v9;
    id v38 = v30;
    [v9 enumerateObjectsUsingBlock:v36];
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a4];
    if ([v12 count])
    {
      unint64_t v14 = 0;
      unint64_t v15 = v33;
      do
      {
        if (v15 >= [v6 count]
          || ([v6 objectAtIndexedSubscript:v15],
              (id v16 = (STSGridTile *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v16 = objc_alloc_init(STSGridTile);
          [(STSGridTile *)v16 setLayoutStyle:0];
          [v6 addObject:v16];
        }
        double v17 = [NSNumber numberWithInteger:v15];
        CGRect v18 = [v13 objectForKeyedSubscript:v17];

        if (!v18)
        {
          CGRect v18 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
          uint64_t v19 = [NSNumber numberWithInteger:v15];
          [v13 setObject:v18 forKeyedSubscript:v19];
        }
        CGFloat v20 = [(STSGridTile *)v16 largeIndex];
        if (v20) {
          BOOL v21 = (unint64_t)[v18 count] < 2;
        }
        else {
          BOOL v21 = 0;
        }

        uint64_t v22 = [v12 count];
        unint64_t v23 = 3;
        if (v21) {
          unint64_t v23 = 1;
        }
        if (v23 >= v22 - v14) {
          unint64_t v24 = v22 - v14;
        }
        else {
          unint64_t v24 = v23;
        }
        id v25 = objc_msgSend(v12, "subarrayWithRange:", v14, v24);
        [v18 addObjectsFromArray:v25];
        v14 += v24;
        if ((v15 + 1) % a4) {
          ++v15;
        }
        else {
          unint64_t v15 = v33;
        }
      }
      while (v14 < [v12 count]);
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke_2;
    v34[3] = &unk_264A055D8;
    id v35 = v6;
    [v13 enumerateKeysAndObjectsUsingBlock:v34];

    id v7 = v32;
    goto LABEL_23;
  }
LABEL_24:
}

void __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 smallIndexes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [v12 smallIndexes];
    [v5 addObjectsFromArray:v6];
  }
  id v7 = [v12 largeIndex];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v12 largeIndex];
    [v8 addObject:v9];

    if ([v12 layoutStyle] == 4)
    {
      uint64_t v10 = v12;
      uint64_t v11 = 2;
    }
    else
    {
      if ([v12 layoutStyle] != 5) {
        goto LABEL_9;
      }
      uint64_t v10 = v12;
      uint64_t v11 = 3;
    }
    [v10 setLayoutStyle:v11];
  }
LABEL_9:
}

void __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a2, "integerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v5 copy];

  [v7 setSmallIndexes:v6];
}

- (BOOL)_hasOnlyLargeItems
{
  p_hasOnlyLargeItems = &self->_hasOnlyLargeItems;
  hasOnlyLargeItems = self->_hasOnlyLargeItems;
  if (!hasOnlyLargeItems)
  {
    id v5 = [(STSGridLayout *)self collectionView];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    unint64_t v15 = __Block_byref_object_copy_;
    id v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__STSGridLayout__hasOnlyLargeItems__block_invoke;
    v9[3] = &unk_264A05600;
    uint64_t v11 = &v12;
    v9[4] = self;
    id v6 = v5;
    id v10 = v6;
    objc_msgSend(v6, "sts_enumerateAllIndexPathsUsingBlock:", v9);
    if (v13[5]) {
      id v7 = (void *)v13[5];
    }
    else {
      id v7 = (void *)MEMORY[0x263EFFA80];
    }
    objc_storeStrong((id *)p_hasOnlyLargeItems, v7);

    _Block_object_dispose(&v12, 8);
    hasOnlyLargeItems = *p_hasOnlyLargeItems;
  }
  return [(NSNumber *)hasOnlyLargeItems BOOLValue];
}

void __35__STSGridLayout__hasOnlyLargeItems__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v5 + 40))
  {
    *(void *)(v5 + 40) = MEMORY[0x263EFFA88];
  }
  id v6 = [*(id *)(a1 + 32) _gridLayoutDelegate];
  uint64_t v7 = [v6 collectionView:*(void *)(a1 + 40) layout:*(void *)(a1 + 32) sizeForItemAtIndexPath:v10];

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = MEMORY[0x263EFFA80];

    *a3 = 1;
  }
}

- (id)_tileSmallFramesForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
  uint64_t v7 = [(NSMutableDictionary *)self->_tileSmallFrameCache objectForKey:v6];
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        id v10 = (void *)MEMORY[0x263F08D40];
        -[STSGridLayout _gridFrameForRow:andColumn:inSize:](self, "_gridFrameForRow:andColumn:inSize:", v7, i, width, height);
        uint64_t v11 = objc_msgSend(v10, "valueWithCGRect:");
        [v8 addObject:v11];
      }
      ++v7;
    }
    while (v7 != (char *)3);
    uint64_t v7 = (char *)[v8 copy];
    [(NSMutableDictionary *)self->_tileSmallFrameCache setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (CGRect)_gridFrameForRow:(unint64_t)a3 andColumn:(unint64_t)a4 inSize:(CGSize)a5
{
  id v6 = [(STSGridLayout *)self collectionView];
  UIFloorToViewScale();
  double v8 = v7;

  uint64_t v9 = [(STSGridLayout *)self collectionView];
  UIFloorToViewScale();
  double v11 = v10;

  uint64_t v12 = [(STSGridLayout *)self collectionView];
  UIFloorToViewScale();
  double v14 = v13;

  double v15 = v8;
  double v16 = v11;
  double v17 = v14;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (unint64_t)_tilesPerRowAndWidth:(double *)a3
{
  [(STSGridLayout *)self _availableContentSize];
  if (v5 >= 550.0)
  {
    if (v5 <= v6 || v5 / 3.0 <= 440.0) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = 3;
    }
    if (a3)
    {
      uint64_t v9 = [(STSGridLayout *)self collectionView];
      UIFloorToViewScale();
      *(void *)a3 = v10;
    }
  }
  else
  {
    if (a3) {
      *a3 = v5;
    }
    return 1;
  }
  return v7;
}

- (CGSize)_availableContentSize
{
  uint64_t v3 = [(STSGridLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(STSGridLayout *)self collectionView];
  [v8 contentInset];
  double v11 = v5 - (v9 + v10);
  double v14 = v7 - (v12 + v13);

  double v15 = v11;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasOnlyLargeItems, 0);
  objc_storeStrong((id *)&self->_tileSmallFrameCache, 0);
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_tileAttributes, 0);
  objc_storeStrong((id *)&self->_cellAttributes, 0);

  objc_storeStrong((id *)&self->_headerAttributes, 0);
}

- (void)_gridTilesForCurrentDataSource
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unexpected partially filled tile in the middle of results", buf, 2u);
}

@end