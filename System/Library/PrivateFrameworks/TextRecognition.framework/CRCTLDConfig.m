@interface CRCTLDConfig
- (BOOL)flatMergeJumps;
- (float)allowedOverlap;
- (float)angleThresholdForRotationCorrection;
- (float)minQuadrilateralRotation;
- (float)minSubRectangleSize;
- (float)minWhitespaceHeight;
- (float)minWhitespaceHeightForReadingOrder;
- (float)minWhitespaceWidth;
- (float)qualityHeightFactor;
- (float)qualityWidthFactor;
- (int)maxQueueCapacity;
- (int)maxRegions;
- (int)numLookupElements;
- (int)numPointsForSegmentsIntersection;
- (void)setAllowedOverlap:(float)a3;
- (void)setAngleThresholdForRotationCorrection:(float)a3;
- (void)setFlatMergeJumps:(BOOL)a3;
- (void)setMaxQueueCapacity:(int)a3;
- (void)setMaxRegions:(int)a3;
- (void)setMinQuadrilateralRotation:(float)a3;
- (void)setMinSubRectangleSize:(float)a3;
- (void)setMinWhitespaceHeight:(float)a3;
- (void)setMinWhitespaceHeightForReadingOrder:(float)a3;
- (void)setMinWhitespaceWidth:(float)a3;
- (void)setNumLookupElements:(int)a3;
- (void)setNumPointsForSegmentsIntersection:(int)a3;
- (void)setQualityHeightFactor:(float)a3;
- (void)setQualityWidthFactor:(float)a3;
@end

@implementation CRCTLDConfig

- (float)allowedOverlap
{
  return self->_allowedOverlap;
}

- (void)setAllowedOverlap:(float)a3
{
  self->_allowedOverlap = a3;
}

- (float)minWhitespaceWidth
{
  return self->_minWhitespaceWidth;
}

- (void)setMinWhitespaceWidth:(float)a3
{
  self->_minWhitespaceWidth = a3;
}

- (float)minWhitespaceHeight
{
  return self->_minWhitespaceHeight;
}

- (void)setMinWhitespaceHeight:(float)a3
{
  self->_minWhitespaceHeight = a3;
}

- (float)qualityHeightFactor
{
  return self->_qualityHeightFactor;
}

- (void)setQualityHeightFactor:(float)a3
{
  self->_qualityHeightFactor = a3;
}

- (float)qualityWidthFactor
{
  return self->_qualityWidthFactor;
}

- (void)setQualityWidthFactor:(float)a3
{
  self->_qualityWidthFactor = a3;
}

- (float)minSubRectangleSize
{
  return self->_minSubRectangleSize;
}

- (void)setMinSubRectangleSize:(float)a3
{
  self->_minSubRectangleSize = a3;
}

- (float)minQuadrilateralRotation
{
  return self->_minQuadrilateralRotation;
}

- (void)setMinQuadrilateralRotation:(float)a3
{
  self->_minQuadrilateralRotation = a3;
}

- (float)minWhitespaceHeightForReadingOrder
{
  return self->_minWhitespaceHeightForReadingOrder;
}

- (void)setMinWhitespaceHeightForReadingOrder:(float)a3
{
  self->_minWhitespaceHeightForReadingOrder = a3;
}

- (int)maxRegions
{
  return self->_maxRegions;
}

- (void)setMaxRegions:(int)a3
{
  self->_maxRegions = a3;
}

- (int)maxQueueCapacity
{
  return self->_maxQueueCapacity;
}

- (void)setMaxQueueCapacity:(int)a3
{
  self->_maxQueueCapacity = a3;
}

- (int)numLookupElements
{
  return self->_numLookupElements;
}

- (void)setNumLookupElements:(int)a3
{
  self->_numLookupElements = a3;
}

- (int)numPointsForSegmentsIntersection
{
  return self->_numPointsForSegmentsIntersection;
}

- (void)setNumPointsForSegmentsIntersection:(int)a3
{
  self->_numPointsForSegmentsIntersection = a3;
}

- (BOOL)flatMergeJumps
{
  return self->_flatMergeJumps;
}

- (void)setFlatMergeJumps:(BOOL)a3
{
  self->_flatMergeJumps = a3;
}

- (float)angleThresholdForRotationCorrection
{
  return self->_angleThresholdForRotationCorrection;
}

- (void)setAngleThresholdForRotationCorrection:(float)a3
{
  self->_angleThresholdForRotationCorrection = a3;
}

@end