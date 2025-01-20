@interface PXAspectFitLayoutMetrics
- (PXAspectFitLayoutMetrics)init;
- (UIEdgeInsets)contentInsets;
- (double)interTileSpacing;
- (double)minRowAspectRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxTilesPerRow;
- (int64_t)minTilesPerRow;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setInterTileSpacing:(double)a3;
- (void)setMaxTilesPerRow:(int64_t)a3;
- (void)setMinRowAspectRatio:(double)a3;
- (void)setMinTilesPerRow:(int64_t)a3;
@end

@implementation PXAspectFitLayoutMetrics

- (void)setMinRowAspectRatio:(double)a3
{
  self->_minRowAspectRatio = a3;
}

- (double)minRowAspectRatio
{
  return self->_minRowAspectRatio;
}

- (void)setMaxTilesPerRow:(int64_t)a3
{
  self->_maxTilesPerRow = a3;
}

- (int64_t)maxTilesPerRow
{
  return self->_maxTilesPerRow;
}

- (void)setMinTilesPerRow:(int64_t)a3
{
  self->_minTilesPerRow = a3;
}

- (int64_t)minTilesPerRow
{
  return self->_minTilesPerRow;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInterTileSpacing:(double)a3
{
  self->_interTileSpacing = a3;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAspectFitLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 72) = v5;
  *((void *)result + 3) = *(void *)&self->_interTileSpacing;
  *((void *)result + 4) = self->_minTilesPerRow;
  *((void *)result + 5) = self->_maxTilesPerRow;
  *((void *)result + 6) = *(void *)&self->_minRowAspectRatio;
  return result;
}

- (PXAspectFitLayoutMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXAspectFitLayoutMetrics;
  id result = [(PXAspectFitLayoutMetrics *)&v3 init];
  if (result)
  {
    result->_minTilesPerRow = 2;
    result->_maxTilesPerRow = 4;
    result->_minRowAspectRatio = 1.77777778;
  }
  return result;
}

@end