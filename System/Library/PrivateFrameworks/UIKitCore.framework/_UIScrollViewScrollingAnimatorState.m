@interface _UIScrollViewScrollingAnimatorState
- (CGPoint)force;
- (CGPoint)maximumVelocity;
- (CGPoint)offset;
- (unint64_t)direction;
- (unint64_t)granularity;
- (void)setDirection:(unint64_t)a3;
- (void)setForce:(CGPoint)a3;
- (void)setGranularity:(unint64_t)a3;
- (void)setMaximumVelocity:(CGPoint)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation _UIScrollViewScrollingAnimatorState

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGPoint)maximumVelocity
{
  double x = self->_maximumVelocity.x;
  double y = self->_maximumVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMaximumVelocity:(CGPoint)a3
{
  self->_maximumVelocitdouble y = a3;
}

- (CGPoint)force
{
  double x = self->_force.x;
  double y = self->_force.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setForce:(CGPoint)a3
{
  self->_force = a3;
}

- (unint64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(unint64_t)a3
{
  self->_granularitdouble y = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

@end