@interface SBMutableHardwareButtonGestureParameters
- (double)longPressTimeInterval;
- (double)multiplePressTimeInterval;
- (int64_t)maximumPressCount;
- (void)setLongPressTimeInterval:(double)a3;
- (void)setMaximumPressCount:(int64_t)a3;
- (void)setMultiplePressTimeInterval:(double)a3;
@end

@implementation SBMutableHardwareButtonGestureParameters

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  self->_maximumPressCount = a3;
}

- (double)longPressTimeInterval
{
  return self->_longPressTimeInterval;
}

- (void)setLongPressTimeInterval:(double)a3
{
  self->_longPressTimeInterval = a3;
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

- (void)setMultiplePressTimeInterval:(double)a3
{
  self->_multiplePressTimeInterval = a3;
}

@end