@interface SBAnyTopAffordanceInteractionMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (BOOL)hasSentEvent;
- (void)setHasSentEvent:(BOOL)a3;
@end

@implementation SBAnyTopAffordanceInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  BOOL v4 = a3 - 51 < 2 && !self->_hasSentEvent;
  BOOL v5 = v4;
  if (v4)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F50318]) initWithIdentifier:@"com.apple.SpringBoard.multitasking.top-affordance.interaction" bundleID:@"com.apple.SpringBoard" context:0 userInfo:0];
    v8 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
    v9 = [v8 source];

    [v9 sendEvent:v7];
    self->_hasSentEvent = 1;
  }
  return v5;
}

- (BOOL)hasSentEvent
{
  return self->_hasSentEvent;
}

- (void)setHasSentEvent:(BOOL)a3
{
  self->_hasSentEvent = a3;
}

@end