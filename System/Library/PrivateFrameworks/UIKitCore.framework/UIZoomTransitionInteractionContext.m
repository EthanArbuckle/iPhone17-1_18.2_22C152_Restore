@interface UIZoomTransitionInteractionContext
- (BOOL)willBegin;
- (CGPoint)location;
- (CGVector)velocity;
- (void)setLocation:(CGPoint)a3;
- (void)setVelocity:(CGVector)a3;
- (void)setWillBegin:(BOOL)a3;
@end

@implementation UIZoomTransitionInteractionContext

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (CGVector)velocity
{
  ddouble x = self->_velocity.dx;
  ddouble y = self->_velocity.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)setVelocity:(CGVector)a3
{
  self->_velocitdouble y = a3;
}

- (BOOL)willBegin
{
  return self->_willBegin;
}

- (void)setWillBegin:(BOOL)a3
{
  self->_willBegin = a3;
}

@end