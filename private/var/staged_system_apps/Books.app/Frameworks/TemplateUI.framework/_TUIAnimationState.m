@interface _TUIAnimationState
+ (id)animationForLayer:(id)a3 forKey:(id)a4;
+ (id)currentState;
+ (void)popState;
+ (void)pushState:(id)a3;
- (BOOL)shouldCaptureCALayerAnimations;
- (UITimingCurveProvider)timingParameters;
- (_TUIAnimationState)initWithDuration:(double)a3 timingParameters:(id)a4;
- (double)duration;
- (id)animationForKeyPath:(id)a3;
- (id)customAnimationForContentOffset;
@end

@implementation _TUIAnimationState

+ (id)currentState
{
  os_unfair_lock_lock_with_options();
  id v2 = (id)qword_2DF548;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF558);

  return v2;
}

+ (void)pushState:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock_with_options();
  if (qword_2DF548)
  {
    v4 = (void *)qword_2DF550;
    if (!qword_2DF550)
    {
      uint64_t v5 = objc_opt_new();
      v6 = (void *)qword_2DF550;
      qword_2DF550 = v5;

      v4 = (void *)qword_2DF550;
    }
    [v4 addObject:];
  }
  v7 = (void *)qword_2DF548;
  qword_2DF548 = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF558);
}

+ (void)popState
{
  os_unfair_lock_lock_with_options();
  if ([(id)qword_2DF550 count])
  {
    id v2 = &qword_2DF550;
    uint64_t v3 = [(id)qword_2DF550 lastObject];
    v4 = (void *)qword_2DF548;
    qword_2DF548 = v3;

    [(id)qword_2DF550 removeLastObject];
    if ([(id)qword_2DF550 count]) {
      goto LABEL_6;
    }
  }
  else
  {
    id v2 = &qword_2DF548;
  }
  uint64_t v5 = (void *)*v2;
  *id v2 = 0;

LABEL_6:

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF558);
}

- (_TUIAnimationState)initWithDuration:(double)a3 timingParameters:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_TUIAnimationState;
  v8 = [(_TUIAnimationState *)&v11 init];
  if (v8)
  {
    UIAnimationDragCoefficient();
    v8->_duration = v9 * a3;
    objc_storeStrong((id *)&v8->_timingParameters, a4);
  }

  return v8;
}

- (id)animationForKeyPath:(id)a3
{
  timingParameters = self->_timingParameters;
  id v5 = a3;
  v6 = [(UITimingCurveProvider *)timingParameters springTimingParameters];
  if (v6)
  {
    id v7 = +[CASpringAnimation animationWithKeyPath:v5];

    [v6 mass];
    [v7 setMass:];
    [v6 stiffness];
    [v7 setStiffness:];
    [v6 damping];
    [v7 setDamping:];
    [v7 setDuration:self->_duration];
    v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [v7 setTimingFunction:v8];

    [v6 initialVelocity];
    [v7 setInitialVelocity:];
  }
  else
  {
    id v7 = +[CABasicAnimation animationWithKeyPath:v5];

    [v7 setDuration:self->_duration];
    float v9 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v7 setTimingFunction:v9];
  }

  return v7;
}

- (id)customAnimationForContentOffset
{
  uint64_t v3 = [(UITimingCurveProvider *)self->_timingParameters springTimingParameters];
  if (v3)
  {
    v4 = +[CASpringAnimation animationWithKeyPath:@"bounds.origin"];
    [v3 mass];
    [v4 setMass:];
    [v3 stiffness];
    [v4 setStiffness:];
    [v3 damping];
    [v4 setDamping:];
    [v4 setDuration:self->_duration];
    id v5 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [v4 setTimingFunction:v5];

    [v3 initialVelocity];
    [v4 setInitialVelocity:];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)animationForLayer:(id)a3 forKey:(id)a4
{
  if (qword_2DF548) {
    [(id)qword_2DF548 animationForKeyPath:a4];
  }
  else {
  v4 = +[NSNull null];
  }

  return v4;
}

- (BOOL)shouldCaptureCALayerAnimations
{
  if (self->_duration <= 0.0) {
    return 0;
  }
  else {
    return +[UIView areAnimationsEnabled];
  }
}

- (double)duration
{
  return self->_duration;
}

- (UITimingCurveProvider)timingParameters
{
  return self->_timingParameters;
}

- (void).cxx_destruct
{
}

@end