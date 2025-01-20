@interface VFXRenderOptions
- (BOOL)waitUntilCompleted;
- (MTLCommandBuffer)commandBuffer;
- (MTLRasterizationRateMap)rasterizationRateMap;
- (NSArray)viewpoints;
- (unint64_t)coordinateSpace;
- (void)setCommandBuffer:(id)a3;
- (void)setCoordinateSpace:(unint64_t)a3;
- (void)setRasterizationRateMap:(id)a3;
- (void)setViewpoints:(id)a3;
- (void)setWaitUntilCompleted:(BOOL)a3;
@end

@implementation VFXRenderOptions

- (MTLRasterizationRateMap)rasterizationRateMap
{
  return self->_rasterizationRateMap;
}

- (void)setRasterizationRateMap:(id)a3
{
}

- (NSArray)viewpoints
{
  return self->_viewpoints;
}

- (void)setViewpoints:(id)a3
{
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (unint64_t)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void)setCoordinateSpace:(unint64_t)a3
{
  self->_coordinateSpace = a3;
}

- (BOOL)waitUntilCompleted
{
  return self->_waitUntilCompleted;
}

- (void)setWaitUntilCompleted:(BOOL)a3
{
  self->_waitUntilCompleted = a3;
}

@end