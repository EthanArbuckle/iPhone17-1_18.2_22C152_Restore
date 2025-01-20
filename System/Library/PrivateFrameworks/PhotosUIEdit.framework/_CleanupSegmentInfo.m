@interface _CleanupSegmentInfo
- (BOOL)isWire;
- (BOOL)usingTargetPoints;
- (NUBrushStrokeMaskIntersector)intersector;
- (PIInpaintMask)mask;
- (int64_t)segmentIndex;
- (void)setIntersector:(id)a3;
- (void)setIsWire:(BOOL)a3;
- (void)setMask:(id)a3;
- (void)setSegmentIndex:(int64_t)a3;
- (void)setUsingTargetPoints:(BOOL)a3;
@end

@implementation _CleanupSegmentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_intersector, 0);
}

- (void)setIsWire:(BOOL)a3
{
  self->_isWire = a3;
}

- (BOOL)isWire
{
  return self->_isWire;
}

- (void)setUsingTargetPoints:(BOOL)a3
{
  self->_usingTargetPoints = a3;
}

- (BOOL)usingTargetPoints
{
  return self->_usingTargetPoints;
}

- (void)setMask:(id)a3
{
}

- (PIInpaintMask)mask
{
  return self->_mask;
}

- (void)setIntersector:(id)a3
{
}

- (NUBrushStrokeMaskIntersector)intersector
{
  return self->_intersector;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

@end