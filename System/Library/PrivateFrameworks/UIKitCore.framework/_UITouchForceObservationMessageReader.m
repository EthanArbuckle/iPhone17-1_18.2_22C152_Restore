@interface _UITouchForceObservationMessageReader
- (BOOL)shouldFilterDueToSystemGestures;
- (CGPoint)centroid;
- (double)timestamp;
- (double)touchForce;
- (void)setCentroid:(CGPoint)a3;
- (void)setShouldFilterDueToSystemGestures:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setTouchForce:(double)a3;
@end

@implementation _UITouchForceObservationMessageReader

- (double)touchForce
{
  return self->_touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->_touchForce = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGPoint)centroid
{
  double x = self->_centroid.x;
  double y = self->_centroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (BOOL)shouldFilterDueToSystemGestures
{
  return self->_shouldFilterDueToSystemGestures;
}

- (void)setShouldFilterDueToSystemGestures:(BOOL)a3
{
  self->_shouldFilterDueToSystemGestures = a3;
}

@end