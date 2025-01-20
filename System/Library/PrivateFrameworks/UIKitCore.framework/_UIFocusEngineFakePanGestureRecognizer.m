@interface _UIFocusEngineFakePanGestureRecognizer
- (CGPoint)digitizerLocation;
- (CGPoint)velocity;
- (int64_t)state;
- (void)setDigitizerLocation:(CGPoint)a3;
- (void)setState:(int64_t)a3;
- (void)setVelocity:(CGPoint)a3;
@end

@implementation _UIFocusEngineFakePanGestureRecognizer

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)digitizerLocation
{
  double x = self->_digitizerLocation.x;
  double y = self->_digitizerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDigitizerLocation:(CGPoint)a3
{
  self->_digitizerLocation = a3;
}

- (CGPoint)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocitdouble y = a3;
}

@end