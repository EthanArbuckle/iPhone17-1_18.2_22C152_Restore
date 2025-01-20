@interface VKQuickDynamicAnimation
- (double)lastTimestamp;
- (void)onTimerFired:(double)a3;
- (void)setLastTimestamp:(double)a3;
@end

@implementation VKQuickDynamicAnimation

- (void)onTimerFired:(double)a3
{
  int64_t state = self->super.super._state;
  if (state == 3)
  {
LABEL_10:
    [(VKDynamicAnimation *)self stopAnimation:1];
    return;
  }
  if (state == 1)
  {
    if (self->super._resuming)
    {
      self->super._resuming = 0;
      double lastTimestamp = a3;
    }
    else
    {
      double lastTimestamp = self->super._lastTimestamp;
    }
    self->super._double lastTimestamp = a3;
    dynamicStepHandler = (unsigned int (**)(id, SEL))self->super._dynamicStepHandler;
    if (dynamicStepHandler)
    {
      if (fmax(lastTimestamp, a3) - lastTimestamp > 0.0 && dynamicStepHandler[2](dynamicStepHandler, a2))
      {
        self->super.super._int64_t state = 3;
        goto LABEL_10;
      }
    }
  }
}

- (void)setLastTimestamp:(double)a3
{
  self->super._double lastTimestamp = a3;
  self->super._resuming = 0;
}

- (double)lastTimestamp
{
  return self->super._lastTimestamp;
}

@end