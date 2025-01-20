@interface PFSlowMotionTimeRangeMapperScaledRegion
- (float)rampInEndTime;
- (float)rampInStartTime;
- (float)rampOutEndTime;
- (float)rampOutStartTime;
- (float)rate;
- (void)setRampInEndTime:(float)a3;
- (void)setRampInStartTime:(float)a3;
- (void)setRampOutEndTime:(float)a3;
- (void)setRampOutStartTime:(float)a3;
- (void)setRate:(float)a3;
@end

@implementation PFSlowMotionTimeRangeMapperScaledRegion

- (void)setRampOutEndTime:(float)a3
{
  self->_rampOutEndTime = a3;
}

- (float)rampOutEndTime
{
  return self->_rampOutEndTime;
}

- (void)setRampOutStartTime:(float)a3
{
  self->_rampOutStartTime = a3;
}

- (float)rampOutStartTime
{
  return self->_rampOutStartTime;
}

- (void)setRampInEndTime:(float)a3
{
  self->_rampInEndTime = a3;
}

- (float)rampInEndTime
{
  return self->_rampInEndTime;
}

- (void)setRampInStartTime:(float)a3
{
  self->_rampInStartTime = a3;
}

- (float)rampInStartTime
{
  return self->_rampInStartTime;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

@end