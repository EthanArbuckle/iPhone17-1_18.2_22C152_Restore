@interface SBWakeEvent
- (SBWakeEvent)initWithTimestamp:(unint64_t)a3;
- (unint64_t)eventAbsTimestamp;
- (unint64_t)eventRecvContTimestamp;
- (void)setEventAbsTimestamp:(unint64_t)a3;
- (void)setEventRecvContTimestamp:(unint64_t)a3;
@end

@implementation SBWakeEvent

- (SBWakeEvent)initWithTimestamp:(unint64_t)a3
{
  return self;
}

- (unint64_t)eventAbsTimestamp
{
  return self->_eventAbsTimestamp;
}

- (void)setEventAbsTimestamp:(unint64_t)a3
{
  self->_eventAbsTimestamp = a3;
}

- (unint64_t)eventRecvContTimestamp
{
  return self->_eventRecvContTimestamp;
}

- (void)setEventRecvContTimestamp:(unint64_t)a3
{
  self->_eventRecvContTimestamp = a3;
}

@end