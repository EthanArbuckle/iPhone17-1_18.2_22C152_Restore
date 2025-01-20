@interface MNTraceAnnotatedUserBehaviorRow
- (double)timestamp;
- (int64_t)event;
- (void)setEvent:(int64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MNTraceAnnotatedUserBehaviorRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

@end