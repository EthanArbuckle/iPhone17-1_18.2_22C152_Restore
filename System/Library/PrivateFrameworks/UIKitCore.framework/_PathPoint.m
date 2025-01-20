@interface _PathPoint
- (BOOL)isSentinelPoint;
- (CGPoint)point;
- (double)absoluteTime;
- (double)decay;
- (double)force;
- (double)length;
- (double)relativeTime;
- (id)description;
- (void)setAbsoluteTime:(double)a3;
- (void)setDecay:(double)a3;
- (void)setForce:(double)a3;
- (void)setLength:(double)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setRelativeTime:(double)a3;
- (void)setSentinelPoint:(BOOL)a3;
@end

@implementation _PathPoint

- (id)description
{
  v3 = NSString;
  [(_PathPoint *)self point];
  v4 = NSStringFromCGPoint(v8);
  v5 = [v3 stringWithFormat:@"<_PathPoint: 0x%p: %@>", self, v4];

  return v5;
}

- (BOOL)isSentinelPoint
{
  return self->_sentinelPoint;
}

- (void)setSentinelPoint:(BOOL)a3
{
  self->_sentinelPoint = a3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)relativeTime
{
  return self->_relativeTime;
}

- (void)setRelativeTime:(double)a3
{
  self->_relativeTime = a3;
}

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (void)setAbsoluteTime:(double)a3
{
  self->_absoluteTime = a3;
}

- (double)decay
{
  return self->_decay;
}

- (void)setDecay:(double)a3
{
  self->_decadouble y = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end