@interface SBDelayedPressInfo
- (double)timestamp;
- (int64_t)phase;
- (int64_t)type;
- (void)setPhase:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SBDelayedPressInfo

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end