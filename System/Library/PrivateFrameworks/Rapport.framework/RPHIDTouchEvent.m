@interface RPHIDTouchEvent
- (CGPoint)location;
- (double)timestampSeconds;
- (int)finger;
- (int)phase;
- (void)setFinger:(int)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setPhase:(int)a3;
- (void)setTimestampSeconds:(double)a3;
@end

@implementation RPHIDTouchEvent

- (int)finger
{
  return self->_finger;
}

- (void)setFinger:(int)a3
{
  self->_finger = a3;
}

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

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_phase = a3;
}

- (double)timestampSeconds
{
  return self->_timestampSeconds;
}

- (void)setTimestampSeconds:(double)a3
{
  self->_timestampSeconds = a3;
}

@end