@interface ULSleepWakeEvent
- (int)sleepWakeState;
- (void)setSleepWakeState:(int)a3;
@end

@implementation ULSleepWakeEvent

- (int)sleepWakeState
{
  return self->_sleepWakeState;
}

- (void)setSleepWakeState:(int)a3
{
  self->_sleepWakeState = a3;
}

@end