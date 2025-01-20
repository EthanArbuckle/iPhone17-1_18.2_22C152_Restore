@interface CLWaterSubmersionState
- (double)startAt;
- (int64_t)state;
- (void)setStartAt:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CLWaterSubmersionState

- (double)startAt
{
  return self->_startAt;
}

- (void)setStartAt:(double)a3
{
  self->_startAt = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end