@interface TYHandwritingDimensions
- (BOOL)requiresExtension;
- (CGRect)rect;
- (double)boundingBoxScale;
- (double)cumulativeWidth;
- (double)fixedScaleHeight;
- (double)offsetY;
- (double)perLatexScale;
- (double)rotationBias;
- (double)segmentWidth;
- (double)totalWidth;
- (double)writingOriginOffsetX;
- (double)writingOriginOffsetY;
- (unint64_t)primaryWritingDirection;
- (unint64_t)segmentWritingDirection;
- (void)setBoundingBoxScale:(double)a3;
- (void)setCumulativeWidth:(double)a3;
- (void)setFixedScaleHeight:(double)a3;
- (void)setOffsetY:(double)a3;
- (void)setPerLatexScale:(double)a3;
- (void)setPrimaryWritingDirection:(unint64_t)a3;
- (void)setRect:(CGRect)a3;
- (void)setRequiresExtension:(BOOL)a3;
- (void)setRotationBias:(double)a3;
- (void)setSegmentWidth:(double)a3;
- (void)setSegmentWritingDirection:(unint64_t)a3;
- (void)setTotalWidth:(double)a3;
- (void)setWritingOriginOffsetX:(double)a3;
- (void)setWritingOriginOffsetY:(double)a3;
@end

@implementation TYHandwritingDimensions

- (double)writingOriginOffsetX
{
  return self->_writingOriginOffsetX;
}

- (void)setWritingOriginOffsetX:(double)a3
{
  self->_writingOriginOffsetX = a3;
}

- (double)writingOriginOffsetY
{
  return self->_writingOriginOffsetY;
}

- (void)setWritingOriginOffsetY:(double)a3
{
  self->_writingOriginOffsetY = a3;
}

- (double)totalWidth
{
  return self->_totalWidth;
}

- (void)setTotalWidth:(double)a3
{
  self->_totalWidth = a3;
}

- (double)cumulativeWidth
{
  return self->_cumulativeWidth;
}

- (void)setCumulativeWidth:(double)a3
{
  self->_cumulativeWidth = a3;
}

- (double)segmentWidth
{
  return self->_segmentWidth;
}

- (void)setSegmentWidth:(double)a3
{
  self->_segmentWidth = a3;
}

- (double)fixedScaleHeight
{
  return self->_fixedScaleHeight;
}

- (void)setFixedScaleHeight:(double)a3
{
  self->_fixedScaleHeight = a3;
}

- (double)rotationBias
{
  return self->_rotationBias;
}

- (void)setRotationBias:(double)a3
{
  self->_rotationBias = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (double)offsetY
{
  return self->_offsetY;
}

- (void)setOffsetY:(double)a3
{
  self->_offsetY = a3;
}

- (double)perLatexScale
{
  return self->_perLatexScale;
}

- (void)setPerLatexScale:(double)a3
{
  self->_perLatexScale = a3;
}

- (double)boundingBoxScale
{
  return self->_boundingBoxScale;
}

- (void)setBoundingBoxScale:(double)a3
{
  self->_boundingBoxScale = a3;
}

- (unint64_t)primaryWritingDirection
{
  return self->_primaryWritingDirection;
}

- (void)setPrimaryWritingDirection:(unint64_t)a3
{
  self->_primaryWritingDirection = a3;
}

- (unint64_t)segmentWritingDirection
{
  return self->_segmentWritingDirection;
}

- (void)setSegmentWritingDirection:(unint64_t)a3
{
  self->_segmentWritingDirection = a3;
}

- (BOOL)requiresExtension
{
  return self->_requiresExtension;
}

- (void)setRequiresExtension:(BOOL)a3
{
  self->_requiresExtension = a3;
}

@end