@interface _TUIPathPoint
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

@implementation _TUIPathPoint

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setDecay:(double)a3
{
  self->_decay = a3;
}

- (double)decay
{
  return self->_decay;
}

- (void)setAbsoluteTime:(double)a3
{
  self->_absoluteTime = a3;
}

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (void)setRelativeTime:(double)a3
{
  self->_relativeTime = a3;
}

- (double)relativeTime
{
  return self->_relativeTime;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSentinelPoint:(BOOL)a3
{
  self->_sentinelPoint = a3;
}

- (BOOL)isSentinelPoint
{
  return self->_sentinelPoint;
}

- (id)description
{
  v3 = NSString;
  [(_TUIPathPoint *)self point];
  v4 = NSStringFromCGPoint(v8);
  v5 = [v3 stringWithFormat:@"<_PathPoint: 0x%p: %@>", self, v4];

  return v5;
}

@end