@interface PRSidebarWidgetSuggestionsCollectionViewLayout
- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForCircularItemAtIndex:(int64_t)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForDescriptor:(id)a3 atIndex:(int64_t)a4;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForRectangularItemAtIndex:(int64_t)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForSystemSmallItemAtIndex:(int64_t)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)_originForGridCoordinate:(id)a3;
- (CGRect)contentBounds;
- (CGSize)collectionViewContentSize;
- (NSDictionary)computedAttributesByIndexPath;
- (PRSidebarWidgetSuggestionsCollectionViewLayout)initWithDisplayScale:(double)a3;
- (PRSidebarWidgetSuggestionsCollectionViewLayoutDelegate)layoutDelegate;
- (double)displayScale;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setComputedAttributesByIndexPath:(id)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setDisplayScale:(double)a3;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation PRSidebarWidgetSuggestionsCollectionViewLayout

- (PRSidebarWidgetSuggestionsCollectionViewLayout)initWithDisplayScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRSidebarWidgetSuggestionsCollectionViewLayout;
  result = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)&v5 init];
  if (result) {
    result->_displayScale = a3;
  }
  return result;
}

- (void)prepareLayout
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_contentBounds.size = v3;
  p_contentBounds = &self->_contentBounds;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self collectionView];
  uint64_t v8 = [v7 numberOfItemsInSection:0];

  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      v10 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
      [v4 addObject:v10];
      v11 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self layoutDelegate];
      v12 = [v11 complicationDescriptorForItemAtIndexPath:v10];

      [v5 addObject:v12];
      [v6 setObject:v10 forKeyedSubscript:v12];
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke;
  v35[3] = &unk_1E54DBDB0;
  v35[4] = self;
  id v36 = v6;
  id v37 = v13;
  id v14 = v13;
  id v30 = v6;
  v15 = (void *)MEMORY[0x192F91830](v35);
  v16 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_23);
  [v16 enumerateObjectsUsingBlock:v15];
  v17 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_7_0);
  [v17 enumerateObjectsUsingBlock:v15];
  v18 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_9);
  [v18 enumerateObjectsUsingBlock:v15];
  v19 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self collectionView];
  [v19 bounds];
  double v21 = v20;

  CGFloat v22 = (v21 - p_contentBounds->size.width) * 0.5;
  v23 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self collectionView];
  [v23 bounds];
  double v25 = v24;

  CGFloat v26 = (v25 - p_contentBounds->size.height) * 0.5;
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, v22, v26);
  v27 = [v14 allValues];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_5;
  v32[3] = &__block_descriptor_80_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  CGAffineTransform v33 = v34;
  [v27 enumerateObjectsUsingBlock:v32];

  v28 = (NSDictionary *)[v14 copy];
  computedAttributesByIndexPath = self->_computedAttributesByIndexPath;
  self->_computedAttributesByIndexPath = v28;
}

void __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a1[4];
  id v6 = a2;
  uint64_t v7 = [v5 _gridCoordinateForDescriptor:v6 atIndex:a3];
  objc_msgSend(a1[4], "_originForGridCoordinate:", v7, v8);
  double v10 = v9;
  double v12 = v11;
  id v13 = +[PRWidgetMetricsProvider sharedInstance];
  id v14 = [v6 widget];
  id v22 = [v13 systemMetricsForWidget:v14];

  [a1[4] displayScale];
  objc_msgSend(v22, "_effectiveSizePixelAlignedForDisplayScale:");
  double v16 = v15;
  double v18 = v17;
  v19 = [a1[5] objectForKeyedSubscript:v6];

  double v20 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v19];
  objc_msgSend(v20, "setFrame:", v10, v12, v16, v18);
  [a1[6] setObject:v20 forKeyedSubscript:v19];
  double v21 = (CGRect *)((char *)a1[4] + 296);
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v16;
  v24.size.height = v18;
  *double v21 = CGRectUnion(*v21, v24);
}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 widget];
  BOOL v3 = [v2 family] == 1;

  return v3;
}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 widget];
  BOOL v3 = [v2 family] == 11;

  return v3;
}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 widget];
  BOOL v3 = [v2 family] == 10;

  return v3;
}

void __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_5(_OWORD *a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  long long v4 = a1[3];
  *(_OWORD *)&v5.a = a1[2];
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = a1[4];
  CGRect v7 = CGRectApplyAffineTransform(v6, &v5);
  objc_msgSend(v3, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (CGSize)collectionViewContentSize
{
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGAffineTransform v5 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self collectionView];
  [v5 bounds];
  BOOL v8 = height != v7 || width != v6;

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSDictionary *)self->_computedAttributesByIndexPath objectForKeyedSubscript:a3];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(NSDictionary *)self->_computedAttributesByIndexPath allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PRSidebarWidgetSuggestionsCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &__block_descriptor_64_e42_B16__0__UICollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  BOOL v8 = objc_msgSend(v7, "bs_filter:", v10);

  return v8;
}

BOOL __84__PRSidebarWidgetSuggestionsCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(void *a1, void *a2)
{
  [a2 frame];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  return CGRectIntersectsRect(*(CGRect *)&v3, *(CGRect *)&v7);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForDescriptor:(id)a3 atIndex:(int64_t)a4
{
  double v6 = [a3 widget];
  uint64_t v7 = [v6 family];

  if (v7 == 11)
  {
    int64_t v8 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self _gridCoordinateForRectangularItemAtIndex:a4];
  }
  else if (v7 == 1)
  {
    int64_t v8 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self _gridCoordinateForSystemSmallItemAtIndex:a4];
  }
  else
  {
    int64_t v8 = [(PRSidebarWidgetSuggestionsCollectionViewLayout *)self _gridCoordinateForCircularItemAtIndex:a4];
  }
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForSystemSmallItemAtIndex:(int64_t)a3
{
  int64_t v3 = 2 * a3;
  int64_t v4 = (2 * a3) & 2;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForRectangularItemAtIndex:(int64_t)a3
{
  int64_t v3 = 2 * a3;
  int64_t v4 = ~(2 * (int)a3) & 2;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForCircularItemAtIndex:(int64_t)a3
{
  if (a3 + 2 <= 0) {
    int64_t v3 = -(-(a3 + 2) & 3);
  }
  else {
    int64_t v3 = (a3 + 2) & 3;
  }
  if (a3 >= 0) {
    int64_t v4 = a3;
  }
  else {
    int64_t v4 = a3 + 1;
  }
  int64_t v5 = v4 | 1;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (CGPoint)_originForGridCoordinate:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  [MEMORY[0x1E4F5E4A8] gridUnitSize];
  double v6 = v5;
  [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
  double v8 = v6 + v7 * 2.0;
  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  double v10 = v8 * (double)var1 + v9 * (double)var1;
  double v11 = v8 * (double)var0 + v9 * (double)var0;
  result.CGFloat y = v10;
  result.CGFloat x = v11;
  return result;
}

- (PRSidebarWidgetSuggestionsCollectionViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (PRSidebarWidgetSuggestionsCollectionViewLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (NSDictionary)computedAttributesByIndexPath
{
  return self->_computedAttributesByIndexPath;
}

- (void)setComputedAttributesByIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedAttributesByIndexPath, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end