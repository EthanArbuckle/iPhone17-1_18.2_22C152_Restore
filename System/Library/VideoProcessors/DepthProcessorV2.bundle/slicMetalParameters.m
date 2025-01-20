@interface slicMetalParameters
- (CGSize)inputImageSize;
- (CGSize)mapSize;
- (float)defaultsSlicoSpatialBias;
- (float)slicoInverseWeight;
- (float)superPixelSize;
- (unsigned)no_iters;
- (void)setDefaultsSlicoSpatialBias:(float)a3;
- (void)setInputImageSize:(CGSize)a3;
- (void)setMapSize:(CGSize)a3;
- (void)setNo_iters:(unsigned int)a3;
- (void)setSlicoInverseWeight:(float)a3;
- (void)setSuperPixelSize:(float)a3;
@end

@implementation slicMetalParameters

- (CGSize)inputImageSize
{
  double width = self->_inputImageSize.width;
  double height = self->_inputImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInputImageSize:(CGSize)a3
{
  self->_inputImageSize = a3;
}

- (CGSize)mapSize
{
  double width = self->_mapSize.width;
  double height = self->_mapSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMapSize:(CGSize)a3
{
  self->_mapSize = a3;
}

- (float)superPixelSize
{
  return self->_superPixelSize;
}

- (void)setSuperPixelSize:(float)a3
{
  self->_superPixelSize = a3;
}

- (unsigned)no_iters
{
  return self->_no_iters;
}

- (void)setNo_iters:(unsigned int)a3
{
  self->_no_iters = a3;
}

- (float)defaultsSlicoSpatialBias
{
  return self->_defaultsSlicoSpatialBias;
}

- (void)setDefaultsSlicoSpatialBias:(float)a3
{
  self->_defaultsSlicoSpatialBias = a3;
}

- (float)slicoInverseWeight
{
  return self->_slicoInverseWeight;
}

- (void)setSlicoInverseWeight:(float)a3
{
  self->_slicoInverseWeight = a3;
}

@end