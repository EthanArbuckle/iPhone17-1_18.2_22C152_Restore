@interface VKDynamicAnimation
- (BOOL)runsForever;
- (VKDynamicAnimation)init;
- (id)dynamicStepHandler;
- (void)onTimerFired:(double)a3;
- (void)pause;
- (void)resume;
- (void)setDynamicStepHandler:(id)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation VKDynamicAnimation

- (void).cxx_destruct
{
}

- (void)setDynamicStepHandler:(id)a3
{
}

- (id)dynamicStepHandler
{
  return self->_dynamicStepHandler;
}

- (void)onTimerFired:(double)a3
{
  int64_t state = self->super._state;
  if (state == 1)
  {
    if (self->_resuming)
    {
      self->_resuming = 0;
      double lastTimestamp = a3;
    }
    else
    {
      double lastTimestamp = self->_lastTimestamp;
    }
    self->_double lastTimestamp = a3;
    dynamicStepHandler = (unsigned int (**)(id, SEL))self->_dynamicStepHandler;
    if (dynamicStepHandler
      && fmax(lastTimestamp, a3) - lastTimestamp > 0.0
      && dynamicStepHandler[2](dynamicStepHandler, a2))
    {
      self->super._int64_t state = 3;
    }
  }
  else if (state == 3)
  {
    -[VKDynamicAnimation stopAnimation:](self, "stopAnimation:", 1, a3);
  }
}

- (void)resume
{
  self->_resuming = 1;
}

- (void)pause
{
  self->_resuming = 0;
}

- (void)stopAnimation:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKDynamicAnimation;
  [(VKAnimation *)&v4 stopAnimation:a3];
  self->_resuming = 0;
}

- (VKDynamicAnimation)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKDynamicAnimation;
  result = [(VKDynamicAnimation *)&v3 init];
  if (result)
  {
    result->_resuming = 1;
    result->super._int64_t state = 0;
  }
  return result;
}

- (BOOL)runsForever
{
  return 0;
}

@end