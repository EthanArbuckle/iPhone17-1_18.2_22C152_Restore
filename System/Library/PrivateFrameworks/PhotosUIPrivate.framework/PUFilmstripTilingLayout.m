@interface PUFilmstripTilingLayout
- (CGRect)contentBounds;
- (CGSize)contentSize;
- (PUFilmstripTilingLayout)initWithDataSource:(id)a3 contentSize:(CGSize)a4;
- (id)_layoutInfoForIndicatorInfo:(id)a3 withIndex:(int64_t)a4;
- (id)_layoutInfoForTileWithIndex:(int64_t)a3 kind:(id)a4;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)layoutInfosForTilesInRect:(CGRect)a3;
- (id)preferredScrollInfo;
- (void)prepareLayout;
@end

@implementation PUFilmstripTilingLayout

- (void).cxx_destruct
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_layoutInfoForIndicatorInfo:(id)a3 withIndex:(int64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a3;
  v8 = [v6 indexPathWithIndex:a4];
  v9 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v8 kind:@"PUTileKindItemContentFilmStripIndicator"];

  [(PUFilmstripTilingLayout *)self contentBounds];
  double v11 = v10;
  [v7 normalizedLocation];
  double v13 = v12 * v11;
  [(PUFilmstripTilingLayout *)self contentBounds];
  double MidY = CGRectGetMidY(v24);
  [(PUFilmstripTilingLayout *)self contentBounds];
  double Height = CGRectGetHeight(v25);
  v16 = [PUFilmstripIndicatorLayoutInfo alloc];
  v17 = [(PUTilingLayout *)self coordinateSystem];
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v23[0] = *MEMORY[0x1E4F1DAB8];
  v23[1] = v18;
  v23[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v19 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v16, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v9, v23, v17, v13, MidY, 3.0, Height, 1.0, 1.0);

  v20 = [v7 preferredColor];

  [(PUFilmstripIndicatorLayoutInfo *)v19 setHighlightColor:v20];
  v21 = v19;

  return v21;
}

- (id)_layoutInfoForTileWithIndex:(int64_t)a3 kind:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_numberOfItems > a3 && [v6 isEqualToString:@"PUTileKindItemContent"])
  {
    layoutInfoCache = self->_layoutInfoCache;
    v9 = [NSNumber numberWithInteger:a3];
    double v10 = [(NSCache *)layoutInfoCache objectForKey:v9];

    if (!v10)
    {
      CGFloat v11 = self->_itemSize.width * 0.5 + (double)a3 * self->_itemSize.width;
      CGFloat v12 = self->_itemSize.height * 0.5;
      double v13 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
      v14 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v13 kind:v7];

      v15 = [PUTileLayoutInfo alloc];
      v16 = [(PUTilingLayout *)self coordinateSystem];
      double width = self->_itemSize.width;
      double height = self->_itemSize.height;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v23[0] = *MEMORY[0x1E4F1DAB8];
      v23[1] = v19;
      v23[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v10 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v15, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v14, v23, v16, v11, v12, width, height, 1.0, 0.0);

      v20 = self->_layoutInfoCache;
      v21 = [NSNumber numberWithInteger:a3];
      [(NSCache *)v20 setObject:v10 forKey:v21];
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:2];
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a4;
  id v7 = -[PUFilmstripTilingLayout _layoutInfoForTileWithIndex:kind:](self, "_layoutInfoForTileWithIndex:kind:", [a3 indexAtPosition:0], v6);

  return v7;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  NSUInteger v8 = (uint64_t)(CGRectGetMinX(a3) / self->_itemSize.width);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  v30.NSUInteger length = vcvtpd_s64_f64(CGRectGetMaxX(v32) / self->_itemSize.width) - v8 + 1;
  v31.NSUInteger length = self->_numberOfItems;
  v30.NSUInteger location = v8;
  v31.NSUInteger location = 0;
  NSRange v9 = NSIntersectionRange(v30, v31);
  NSUInteger location = v9.location;
  NSUInteger length = v9.length;
  CGFloat v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9.length];
  if (location < location + v9.length)
  {
    do
    {
      double v13 = [(PUFilmstripTilingLayout *)self _layoutInfoForTileWithIndex:location kind:@"PUTileKindItemContent"];
      [v12 addObject:v13];

      ++location;
      --length;
    }
    while (length);
  }
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v33);
  [(PUFilmstripTilingLayout *)self contentSize];
  double v16 = MinX / v15;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v17 = CGRectGetWidth(v34);
  [(PUFilmstripTilingLayout *)self contentSize];
  double v19 = v17 / v18;
  v20 = [(PUTilingLayout *)self dataSource];
  v21 = [v20 indicatorInfos];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __53__PUFilmstripTilingLayout_layoutInfosForTilesInRect___block_invoke;
  v26[3] = &unk_1E5F25648;
  double v28 = v16;
  double v29 = v19;
  v26[4] = self;
  id v22 = v12;
  id v27 = v22;
  [v21 enumerateObjectsUsingBlock:v26];

  v23 = v27;
  id v24 = v22;

  return v24;
}

void __53__PUFilmstripTilingLayout_layoutInfosForTilesInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [v7 normalizedLocation];
  if (v5 >= *(double *)(a1 + 48) && v5 <= v5 + *(double *)(a1 + 56))
  {
    id v6 = [*(id *)(a1 + 32) _layoutInfoForIndicatorInfo:v7 withIndex:a3];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripTilingLayout;
  [(PUTilingLayout *)&v7 prepareLayout];
  v3 = [(PUTilingLayout *)self dataSource];
  v4 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
  self->_numberOfItems = [v3 numberOfSubItemsAtIndexPath:v4];

  [(PUFilmstripTilingLayout *)self contentBounds];
  self->_itemSize.CGFloat width = v5 / (double)self->_numberOfItems;
  self->_itemSize.CGFloat height = v6;
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

- (PUFilmstripTilingLayout)initWithDataSource:(id)a3 contentSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmstripTilingLayout;
  CGFloat v6 = [(PUTilingLayout *)&v11 initWithDataSource:a3];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_contentSize.CGFloat width = width;
    v6->_contentSize.CGFloat height = height;
    v6->_contentBounds.origin.double x = 0.0;
    v6->_contentBounds.origin.double y = 0.0;
    v6->_contentBounds.size.CGFloat width = width;
    v6->_contentBounds.size.CGFloat height = height;
    NSUInteger v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    layoutInfoCache = v7->_layoutInfoCache;
    v7->_layoutInfoCache = v8;
  }
  return v7;
}

@end