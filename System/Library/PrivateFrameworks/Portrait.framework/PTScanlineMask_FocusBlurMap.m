@interface PTScanlineMask_FocusBlurMap
- (CGSize)normalizedTileSize;
- (CGSize)placementTileSize;
- (NSIndexSet)region;
- (PTFocusBlurMap)map;
- (PTScanlineMask_FocusBlurMap)initWithFocusBlurMap:(id)a3 region:(id)a4;
- (_NSRange)pixelRangeForTileRangeX:(_NSRange)a3;
- (_NSRange)pixelRangeForTileRangeY:(_NSRange)a3;
- (id)scanlineIter;
- (void)_recalculatePlacementTileSize;
- (void)setNormalizedTileSize:(CGSize)a3;
- (void)setPlacement:(CGRect)a3;
- (void)setPlacementTileSize:(CGSize)a3;
@end

@implementation PTScanlineMask_FocusBlurMap

- (PTScanlineMask_FocusBlurMap)initWithFocusBlurMap:(id)a3 region:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PTScanlineMask_FocusBlurMap;
  v9 = [(PTScanlineMask_FocusBlurMap *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_map, a3);
    objc_storeStrong((id *)&v10->_region, a4);
  }

  return v10;
}

- (id)scanlineIter
{
  v2 = [[PTScanlineIter_FocusBlurMap alloc] initWithMask:self];

  return v2;
}

- (void)setPlacement:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PTScanlineMask_FocusBlurMap;
  -[PTScanlineMask setPlacement:](&v4, sel_setPlacement_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PTScanlineMask_FocusBlurMap *)self _recalculatePlacementTileSize];
}

- (void)_recalculatePlacementTileSize
{
  [(PTScanlineMask *)self placement];
  double v4 = v3;
  double v5 = (double)[(PTFocusBlurMap *)self->_map tileWidth];
  self->_placementTileSize.width = v4 * (v5 / (double)[(PTFocusBlurMap *)self->_map inputWidth]);
  [(PTScanlineMask *)self placement];
  double v7 = v6;
  double v8 = (double)[(PTFocusBlurMap *)self->_map tileHeight];
  self->_placementTileSize.height = v7 * (v8 / (double)[(PTFocusBlurMap *)self->_map inputHeight]);
}

- (_NSRange)pixelRangeForTileRangeX:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double width = self->_placementTileSize.width;
  [(PTScanlineMask *)self placement];
  double MinX = CGRectGetMinX(v13);
  [(PTScanlineMask *)self placement];
  double MaxX = CGRectGetMaxX(v14);
  double v9 = MinX + (double)location * width;
  if (MaxX < v9) {
    double v9 = MaxX;
  }
  NSUInteger v10 = (unint64_t)v9;
  if (MaxX >= v9 + (double)length * width) {
    double MaxX = v9 + (double)length * width;
  }
  NSUInteger v11 = (unint64_t)(MaxX - v9);
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)pixelRangeForTileRangeY:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double height = self->_placementTileSize.height;
  [(PTScanlineMask *)self placement];
  double MinY = CGRectGetMinY(v13);
  [(PTScanlineMask *)self placement];
  double MaxY = CGRectGetMaxY(v14);
  double v9 = MinY + (double)location * height;
  if (MaxY < v9) {
    double v9 = MaxY;
  }
  NSUInteger v10 = (unint64_t)v9;
  if (MaxY >= v9 + (double)length * height) {
    double MaxY = v9 + (double)length * height;
  }
  NSUInteger v11 = (unint64_t)(MaxY - v9);
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (PTFocusBlurMap)map
{
  return (PTFocusBlurMap *)objc_getProperty(self, a2, 40, 1);
}

- (NSIndexSet)region
{
  return (NSIndexSet *)objc_getProperty(self, a2, 48, 1);
}

- (CGSize)normalizedTileSize
{
  objc_copyStruct(v4, &self->_normalizedTileSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setNormalizedTileSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_normalizedTileSize, &v3, 16, 1, 0);
}

- (CGSize)placementTileSize
{
  objc_copyStruct(v4, &self->_placementTileSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setPlacementTileSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_placementTileSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_map, 0);
}

@end