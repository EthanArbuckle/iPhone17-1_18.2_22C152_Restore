@interface PUGridTilingLayout
- (CGRect)_frameForItemAtIndexPath:(id)a3;
- (CGSize)estimatedSectionSize;
- (CGSize)interItemSpacing;
- (CGSize)itemSize;
- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4;
- (PUGridTilingLayout)init;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)preferredScrollInfo;
- (int64_t)_numberOfColumns;
- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5;
- (void)prepareLayout;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUGridTilingLayout

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_numberOfColumns
{
  int64_t result = self->_numberOfColumns;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUGridTilingLayout.m", 129, @"Invalid parameter not satisfying: %@", @"_numberOfColumns != NSNotFound" object file lineNumber description];

    return self->_numberOfColumns;
  }
  return result;
}

- (CGRect)_frameForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", [v4 section]);
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(PUGridTilingLayout *)self _numberOfColumns];
  uint64_t v10 = [v4 item];

  [(PUGridTilingLayout *)self itemSize];
  double v12 = v11;
  double v14 = v13;
  [(PUGridTilingLayout *)self interItemSpacing];
  double v16 = v6 + (double)(v10 % v9) * (v12 + v15);
  double v18 = v8 + (double)(v10 / v9) * (v14 + v17);
  double v19 = v12;
  double v20 = v14;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  [(PUGridTilingLayout *)self itemSize];
  double v7 = v6;
  double v9 = v8;
  [(PUGridTilingLayout *)self interItemSpacing];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(PUGridTilingLayout *)self _numberOfColumns];
  if (a4 < 1) {
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else {
    double v15 = -(v13 - (double)((a4 + v14 - 1) / v14) * (v9 + v13));
  }
  double v16 = -(v11 - (double)v14 * (v7 + v11));
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"PUTileKindItemContent"])
  {
    [(PUGridTilingLayout *)self _frameForItemAtIndexPath:v6];
    double v9 = v8;
    double v11 = v10;
    double v12 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
    double v13 = [PUTileLayoutInfo alloc];
    UIRectGetCenter();
    double v15 = v14;
    double v17 = v16;
    double v18 = [(PUTilingLayout *)self coordinateSystem];
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v22[0] = *MEMORY[0x1E4F1DAB8];
    v22[1] = v19;
    v22[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v20 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v13, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v12, v22, v18, v15, v17, v9, v11, 1.0, 0.0);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUGridTilingLayout;
  -[PUSectionedTilingLayout addLayoutInfosForTilesInRect:section:toSet:](&v17, sel_addLayoutInfosForTilesInRect_section_toSet_, a4, v11, x, y, width, height);
  uint64_t v12 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:a4];
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    for (uint64_t i = 0; i != v13; ++i)
    {
      double v15 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:a4];
      [(PUGridTilingLayout *)self _frameForItemAtIndexPath:v15];
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      if (CGRectIntersectsRect(v18, v19))
      {
        double v16 = [(PUGridTilingLayout *)self layoutInfoForTileWithIndexPath:v15 kind:@"PUTileKindItemContent"];
        [v11 addObject:v16];
      }
    }
  }
}

- (CGSize)estimatedSectionSize
{
  double v3 = *MEMORY[0x1E4F1DB30];
  [(PUGridTilingLayout *)self itemSize];
  double v5 = v4;
  [(PUGridTilingLayout *)self interItemSpacing];
  double v7 = -(v6 - (v5 + v6) * 3.0);
  double v8 = v3;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:4];
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)PUGridTilingLayout;
  [(PUSectionedTilingLayout *)&v7 prepareLayout];
  [(PUGridTilingLayout *)self itemSize];
  double v4 = v3;
  [(PUGridTilingLayout *)self interItemSpacing];
  double v6 = v5;
  [(PUTilingLayout *)self visibleRect];
  self->_numberOfColumns = vcvtmd_s64_f64((v6 + CGRectGetWidth(v8)) / (v4 + v6));
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingLayout *)self visibleRect];
  double v9 = v8;
  double v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)PUGridTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v14, sel_setVisibleRect_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    self->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    [(PUTilingLayout *)self invalidateLayoutWithContext:v13];
  }
}

- (PUGridTilingLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUGridTilingLayout;
  CGSize result = [(PUTilingLayout *)&v8 init];
  if (result)
  {
    result->_itemSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    __asm { FMOV            V0.2D, #10.0 }
    result->_interItemSpacing = _Q0;
    result->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end