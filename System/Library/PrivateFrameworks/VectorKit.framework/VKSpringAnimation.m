@interface VKSpringAnimation
- (BOOL)_calculateFractionForTimeElapsed:(double)a3 result:(float *)a4;
- (VKSpringAnimation)initWithTension:(float)a3 friction:(float)a4 name:(id)a5;
- (float)friction;
- (float)tension;
- (id)stepHandler;
- (void)onTimerFired:(double)a3;
- (void)pause;
- (void)resume;
- (void)setStepHandler:(id)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation VKSpringAnimation

- (void).cxx_destruct
{
}

- (void)setStepHandler:(id)a3
{
}

- (id)stepHandler
{
  return self->_stepHandler;
}

- (float)friction
{
  return self->_friction;
}

- (float)tension
{
  return self->_tension;
}

- (void)onTimerFired:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKSpringAnimation;
  -[VKAnimation onTimerFired:](&v9, sel_onTimerFired_);
  if (self->_startTimestampSet)
  {
    double lastTimestamp = self->_lastTimestamp;
  }
  else
  {
    self->_startTimestampSet = 1;
    self->_startTimestamp = a3;
    self->_double lastTimestamp = a3;
    double lastTimestamp = a3;
  }
  if (self->_resuming)
  {
    self->_startTimestamp = a3 - lastTimestamp + self->_startTimestamp;
    self->_resuming = 0;
    double lastTimestamp = a3;
  }
  self->_double lastTimestamp = a3;
  float v8 = 0.0;
  BOOL v6 = [(VKSpringAnimation *)self _calculateFractionForTimeElapsed:&v8 result:a3 - lastTimestamp];
  stepHandler = (void (**)(float))self->_stepHandler;
  if (stepHandler) {
    stepHandler[2](v8);
  }
  if (v6) {
    self->super._state = 3;
  }
}

- (BOOL)_calculateFractionForTimeElapsed:(double)a3 result:(float *)a4
{
  float v6 = self->_lastFraction + -1.0;
  float lastVelocity = self->_lastVelocity;
  float friction = self->_friction;
  float tension = self->_tension;
  if ((float)(fabsf((float)(friction * lastVelocity) / tension) + fabsf(v6)) < 0.001)
  {
    *a4 = 1.0;
    return 1;
  }
  float v12 = sqrtf(tension);
  float v13 = friction * 0.5;
  if ((float)(friction * 0.5) >= v12)
  {
    if ((float)(friction * 0.5) <= v12)
    {
      double v30 = (float)-v13;
      long double v31 = exp(v30 * a3);
      double v32 = (float)(lastVelocity + (float)(v13 * v6));
      double v33 = v6 + v32 * a3;
      double v20 = v33 * v31;
      double v29 = (v32 + v33 * v30) * v31;
      goto LABEL_9;
    }
    double v16 = sqrtf(-(float)(tension - (float)(v13 * v13)));
    double v39 = (float)-v13;
    double v15 = exp(v39 * a3);
    double v23 = v6;
    long double v24 = v16 * a3;
    double v25 = cosh(v24);
    double v37 = v25 * v6;
    double v26 = (float)(lastVelocity + (float)(v13 * v6)) / v16;
    long double v27 = sinh(v24);
    long double v28 = v37 + v27 * v26;
    double v20 = v28 * v15;
    double v21 = v25 * v26 + v27 * v23;
    double v22 = v28 * v39;
  }
  else
  {
    float v14 = sqrtf(tension - (float)(v13 * v13));
    double v38 = (float)-v13;
    double v15 = exp(v38 * a3);
    double v16 = v14;
    __double2 v17 = __sincos_stret(v14 * a3);
    double v18 = (float)((float)(lastVelocity + (float)(v13 * v6)) / v14);
    double v19 = v17.__sinval * v18 + v17.__cosval * v6;
    double v20 = v19 * v15;
    double v21 = -(v17.__sinval * v6 - v17.__cosval * v18);
    double v22 = v19 * v38;
  }
  double v29 = (v22 + v21 * v16) * v15;
LABEL_9:
  float v34 = v20;
  float v35 = v34 + 1.0;
  self->_lastFraction = v35;
  float v36 = v29;
  self->_float lastVelocity = v36;
  *a4 = v35;
  return (float)(fabsf((float)(self->_friction * self->_lastVelocity) / self->_tension)
               + fabsf(self->_lastFraction + -1.0)) < 0.001;
}

- (void)resume
{
  self->_resuming = 1;
  v2.receiver = self;
  v2.super_class = (Class)VKSpringAnimation;
  [(VKAnimation *)&v2 resume];
}

- (void)pause
{
  self->_resuming = 0;
  v2.receiver = self;
  v2.super_class = (Class)VKSpringAnimation;
  [(VKAnimation *)&v2 pause];
}

- (void)stopAnimation:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKSpringAnimation;
  [(VKAnimation *)&v5 stopAnimation:a3];
  id stepHandler = self->_stepHandler;
  self->_id stepHandler = 0;
}

- (VKSpringAnimation)initWithTension:(float)a3 friction:(float)a4 name:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)VKSpringAnimation;
  v7 = [(VKAnimation *)&v11 initWithName:a5];
  float v8 = v7;
  if (v7)
  {
    v7->_float tension = a3;
    v7->_float friction = a4;
    objc_super v9 = v7;
  }

  return v8;
}

@end