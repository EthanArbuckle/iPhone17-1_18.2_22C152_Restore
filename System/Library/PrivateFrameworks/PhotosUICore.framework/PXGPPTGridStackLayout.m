@interface PXGPPTGridStackLayout
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (BOOL)hidesTopLeadingBadgesInLayout:(id)a3;
- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3;
- (BOOL)wantsFileSizeBadgesInLayout:(id)a3;
- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3;
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result;
- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5;
- (PXGPPTGridStackLayout)initWithSettings:(id)a3;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
- (void)_initializeBadgeInfos;
- (void)_initializeSelectedItems;
@end

@implementation PXGPPTGridStackLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedItemsPerSection, 0);
  objc_storeStrong((id *)&self->_spriteColor, 0);
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4 = *(float *)off_1E5DAAF58;
  float v5 = *((float *)off_1E5DAAF58 + 1);
  float v6 = *((float *)off_1E5DAAF58 + 2);
  float v7 = *((float *)off_1E5DAAF58 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  return self->_selectedItemsPerSection;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return self->_selectionDecorationStyle;
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  float v6 = &self[a5 % 0xC + 36];
  double var1 = v6->var1;
  retstr->var0 = v6->var0;
  retstr->double var1 = var1;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&v6->var2;
  return self;
}

- (BOOL)hidesTopLeadingBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return self->_useAssetBadgeDecoration;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return self->_useAssetBadgeDecoration;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_spriteColor;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  float v5 = objc_alloc_init(PXGGridLayout);
  [(PXGLayout *)v5 setContentSource:self];
  [(PXGGridLayout *)v5 setNumberOfColumns:self->_numberOfColumns];
  [(PXGItemsLayout *)v5 setNumberOfItems:self->_numberOfItemsPerSection];
  [(PXGGridLayout *)v5 setMediaKind:5];
  [(PXGItemsLayout *)v5 setLazy:1];
  float v6 = v5;
  BOOL decorated = self->_decorated;
  v8 = (PXGDecoratingLayout *)v6;
  if (decorated)
  {
    v8 = [[PXGDecoratingLayout alloc] initWithDecoratedLayout:v6];
  }
  return v8;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5 = result.width / (double)self->_numberOfColumns * (double)self->_estimatedNumberOfRowsPerSection;
  result.height = v5;
  return result;
}

- (void)_initializeBadgeInfos
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)off_1E5DAAEC8;
  double v4 = *((double *)off_1E5DAAEC8 + 1);
  p_count = &self->_assetBadgeInfos[0].count;
  long long v6 = *((_OWORD *)off_1E5DAAEC8 + 1);
  do
  {
    int64_t v7 = v3 | ((v2 & 1) == 0);
    int v8 = 3 * ((1431655766 * (unint64_t)v2) >> 32);
    if (v2 == v8) {
      v7 |= 2uLL;
    }
    double v9 = 42.0;
    if (v2 - v8 != 1) {
      double v9 = v4;
    }
    if ((v2 & 3) == 0) {
      v7 |= 0x20uLL;
    }
    *(p_count - 2) = v7;
    *((double *)p_count - 1) = v9;
    *(_OWORD *)p_count = v6;
    p_count += 4;
    ++v2;
  }
  while (v2 != 12);
}

- (void)_initializeSelectedItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v7 = v3;
  if (self->_numberOfItemsPerSection >= 1)
  {
    int64_t v4 = 0;
    do
    {
      objc_msgSend(v7, "addIndexesInRange:", v4, 4);
      id v3 = v7;
      v4 += 5;
    }
    while (v4 < self->_numberOfItemsPerSection);
  }
  double v5 = (NSIndexSet *)[v3 copy];
  selectedItemsPerSection = self->_selectedItemsPerSection;
  self->_selectedItemsPerSection = v5;
}

- (PXGPPTGridStackLayout)initWithSettings:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGStackLayout *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 numberOfSections];
    v5->_numberOfItemsPerSection = (v6 + [v4 numberOfItems] - 1) / v6;
    v5->_numberOfColumns = [v4 numberOfColumns];
    v5->_useAssetBadgeDecoration = [v4 useAssetBadgeDecoration];
    uint64_t v7 = [v4 selectionDecorationStlye];
    v5->_selectionDecorationStyle = v7;
    BOOL v8 = !v5->_useAssetBadgeDecoration && v7 == 0;
    char v9 = !v8;
    v5->_BOOL decorated = v9;
    v5->_estimatedNumberOfRowsPerSection = (v5->_numberOfItemsPerSection + v5->_numberOfColumns - 1)
                                         / v5->_numberOfColumns;
    uint64_t v10 = [MEMORY[0x1E4FB1618] blueColor];
    spriteColor = v5->_spriteColor;
    v5->_spriteColor = (UIColor *)v10;

    [(PXGPPTGridStackLayout *)v5 _initializeSelectedItems];
    [(PXGPPTGridStackLayout *)v5 _initializeBadgeInfos];
    [(PXGStackLayout *)v5 setAxis:1];
    [(PXGStackLayout *)v5 setInterlayoutSpacing:50.0];
    -[PXGStackLayout insertSublayoutProvider:inRange:](v5, "insertSublayoutProvider:inRange:", v5, 0, v6);
  }

  return v5;
}

@end