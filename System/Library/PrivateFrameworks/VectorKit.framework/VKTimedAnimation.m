@interface VKTimedAnimation
+ (void)setDragCoefficientGetter:(id)a3;
- (BOOL)timed;
- (VKTimedAnimation)init;
- (VKTimedAnimation)initWithDuration:(double)a3;
- (VKTimedAnimation)initWithDuration:(double)a3 name:(id)a4;
- (VKTimedAnimation)initWithDuration:(double)a3 priority:(int64_t)a4 name:(id)a5;
- (VKTimedAnimation)initWithName:(id)a3;
- (double)duration;
- (id)stepHandler;
- (id)timingFunction;
- (void)onTimerFired:(double)a3;
- (void)pause;
- (void)resume;
- (void)setDuration:(double)a3;
- (void)setStepHandler:(id)a3;
- (void)setTimingFunction:(id)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation VKTimedAnimation

- (void)setTimingFunction:(id)a3
{
  id v6 = a3;
  v4 = (void *)[v6 copy];
  id timingFunction = self->_timingFunction;
  self->_id timingFunction = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timingFunction, 0);
  objc_storeStrong(&self->_stepHandler, 0);
}

- (void)setStepHandler:(id)a3
{
}

- (VKTimedAnimation)initWithDuration:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VKTimedAnimation;
  v4 = [(VKTimedAnimation *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(VKTimedAnimation *)v4 setDuration:a3];
    uint64_t v6 = [VKAnimationCurveEaseInOut copy];
    id timingFunction = v5->_timingFunction;
    v5->_id timingFunction = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)setDuration:(double)a3
{
  id v8 = +[VKDebugSettings sharedSettings];
  [v8 animationTimeMultiplier];
  float v6 = v5;
  if (sDragCoefficientGetter) {
    double v7 = (*(float (**)(void))(sDragCoefficientGetter + 16))();
  }
  else {
    double v7 = 1.0;
  }
  self->_duration = v6 * (a3 * v7);
}

- (VKTimedAnimation)init
{
  return [(VKTimedAnimation *)self initWithDuration:0.2];
}

- (void)onTimerFired:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VKTimedAnimation;
  -[VKAnimation onTimerFired:](&v10, sel_onTimerFired_);
  if (!self->_startTimestampSet)
  {
    self->_startTimestampSet = 1;
    self->_startTimestamp = a3;
    self->_lastTimestamp = a3;
  }
  if (self->_resuming)
  {
    self->_startTimestamp = a3 - self->_lastTimestamp + self->_startTimestamp;
    self->_resuming = 0;
  }
  self->_lastTimestamp = a3;
  double duration = self->_duration;
  float v6 = 1.0;
  float v7 = 1.0;
  if (duration > 0.0)
  {
    float v7 = (a3 - self->_startTimestamp) / duration;
    float v6 = modff(v7, &v9);
    if (v7 >= 1.0 && ![(VKAnimation *)self runsForever]) {
      float v6 = 1.0;
    }
  }
  (*((void (**)(float))self->_timingFunction + 2))(fminf(fmaxf(v6, 0.0), 1.0));
  stepHandler = (void (**)(void))self->_stepHandler;
  if (stepHandler) {
    stepHandler[2]();
  }
  if (v7 >= 1.0 && ![(VKAnimation *)self runsForever]) {
    self->super._state = 3;
  }
}

- (void)stopAnimation:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKTimedAnimation;
  [(VKAnimation *)&v5 stopAnimation:a3];
  id stepHandler = self->_stepHandler;
  self->_id stepHandler = 0;

  self->_startTimestampSet = 0;
  self->_resuming = 0;
}

- (BOOL)timed
{
  return 1;
}

- (double)duration
{
  return self->_duration;
}

+ (void)setDragCoefficientGetter:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 copy];
  v4 = (void *)sDragCoefficientGetter;
  sDragCoefficientGetter = v3;
}

- (id)stepHandler
{
  return self->_stepHandler;
}

- (id)timingFunction
{
  return self->_timingFunction;
}

- (void)resume
{
  self->_resuming = 1;
  v2.receiver = self;
  v2.super_class = (Class)VKTimedAnimation;
  [(VKAnimation *)&v2 resume];
}

- (void)pause
{
  self->_resuming = 0;
  v2.receiver = self;
  v2.super_class = (Class)VKTimedAnimation;
  [(VKAnimation *)&v2 pause];
}

- (VKTimedAnimation)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(VKTimedAnimation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->super._name;
    v5->super._name = (NSString *)v6;
  }
  return v5;
}

- (VKTimedAnimation)initWithDuration:(double)a3 name:(id)a4
{
  id v6 = a4;
  float v7 = [(VKTimedAnimation *)self initWithDuration:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->super._name;
    v7->super._name = (NSString *)v8;
  }
  return v7;
}

- (VKTimedAnimation)initWithDuration:(double)a3 priority:(int64_t)a4 name:(id)a5
{
  result = [(VKTimedAnimation *)self initWithDuration:a5 name:a3];
  if (result) {
    result->super._priority = a4;
  }
  return result;
}

@end