@interface UIStatusBarAnimationParameters
+ (id)fencingAnimation;
+ (void)animateWithParameters:(id)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 animations:(id)a5 completion:(id)a6;
+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 frameInterval:(double)a5 animations:(id)a6 completion:(id)a7;
- (BOOL)shouldAnimate;
- (BOOL)skipFencing;
- (BSAnimationSettings)bsAnimationSettings;
- (UIStatusBarAnimationParameters)initWithDefaultParameters;
- (UIStatusBarAnimationParameters)initWithEmptyParameters;
- (_UIBasicAnimationFactory)animationFactory;
- (double)delay;
- (double)duration;
- (double)startTime;
- (int64_t)curve;
- (void)setAnimationFactory:(id)a3;
- (void)setCurve:(int64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setSkipFencing:(BOOL)a3;
- (void)setStartTime:(double)a3;
@end

@implementation UIStatusBarAnimationParameters

uint64_t __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void).cxx_destruct
{
}

+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 frameInterval:(double)a5 animations:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  v12 = (void (**)(void))a6;
  id v13 = a7;
  if (v11)
  {
    if ([v11 shouldAnimate])
    {
      [v11 duration];
      double v15 = v14;
      [v11 delay];
      double v17 = v16;
      uint64_t v18 = [v11 curve];
      uint64_t v19 = 0;
      uint64_t v20 = 4;
      if (!v10) {
        uint64_t v20 = 0;
      }
      uint64_t v21 = v20 | (v18 << 16);
      if (a5 != 0.0) {
        uint64_t v19 = ((uint64_t)(240.0 / round(1.0 / a5)) << 24) - 0x1000000;
      }
      uint64_t v22 = v19 | v21;
      v23 = [v11 animationFactory];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke;
      v27[3] = &unk_1E52DA040;
      v28 = v12;
      +[UIView _animateWithDuration:v22 delay:v23 options:v27 factory:v13 animations:v15 completion:v17];
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke_2;
      v24[3] = &unk_1E52DE9A0;
      v25 = v12;
      id v26 = v13;
      +[UIView performWithoutAnimation:v24];
    }
  }
  else
  {
    if (v12) {
      v12[2](v12);
    }
    if (v13) {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
}

+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
}

- (BOOL)shouldAnimate
{
  [(UIStatusBarAnimationParameters *)self duration];
  return v2 > 0.0;
}

- (double)duration
{
  return self->_duration;
}

- (double)delay
{
  return self->_delay;
}

- (int64_t)curve
{
  return self->_curve;
}

- (_UIBasicAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (UIStatusBarAnimationParameters)initWithDefaultParameters
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarAnimationParameters;
  uint64_t result = [(UIStatusBarAnimationParameters *)&v3 init];
  if (result) {
    result->_curve = 0;
  }
  return result;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (id)fencingAnimation
{
  double v2 = (void *)[objc_alloc((Class)a1) initWithEmptyParameters];
  return v2;
}

- (UIStatusBarAnimationParameters)initWithEmptyParameters
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarAnimationParameters;
  return [(UIStatusBarAnimationParameters *)&v3 init];
}

- (BOOL)skipFencing
{
  return self->_skipFencing;
}

- (BSAnimationSettings)bsAnimationSettings
{
  if ([(UIStatusBarAnimationParameters *)self shouldAnimate])
  {
    v7 = (void *)MEMORY[0x1E4F4F680];
    double duration = self->_duration;
    double delay = self->_delay;
    BOOL v10 = _UIGetAnimationCurveSpline(self->_curve, v3, v4, v5, v6);
    id v11 = [v7 settingsWithDuration:v10 delay:duration timingFunction:delay];
  }
  else
  {
    id v11 = 0;
  }
  return (BSAnimationSettings *)v11;
}

- (void)setDelay:(double)a3
{
  self->_double delay = a3;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

+ (void)animateWithParameters:(id)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)setStartTime:(double)a3
{
  if (a3 == 0.0) {
    double v4 = 0.0;
  }
  else {
    double v4 = fmax(CACurrentMediaTime() - a3, 0.0);
  }
  self->_double delay = v4;
}

- (void)setSkipFencing:(BOOL)a3
{
  self->_skipFencing = a3;
}

- (void)setAnimationFactory:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

@end