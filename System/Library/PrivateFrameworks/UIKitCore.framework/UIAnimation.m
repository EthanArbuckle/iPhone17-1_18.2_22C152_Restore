@interface UIAnimation
- (SEL)action;
- (UIAnimation)initWithTarget:(id)a3;
- (float)fractionForTime:(double)a3;
- (float)progressForFraction:(float)result;
- (id)_screen;
- (id)_screenIdentifier;
- (id)completion;
- (id)delegate;
- (id)target;
- (int)state;
- (void)markStart:(double)a3;
- (void)markStop;
- (void)setAction:(SEL)a3;
- (void)setAnimationCurve:(int)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)stopAnimation;
@end

@implementation UIAnimation

- (UIAnimation)initWithTarget:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIAnimation;
  v6 = [(UIAnimation *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_target, a3);
    v8 = [(UIAnimation *)v7 target];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v10 = [(UIAnimation *)v7 target];
      v11 = [v10 window];
      uint64_t v12 = [v11 screen];
      screen = v7->_screen;
      v7->_screen = (UIScreen *)v12;
    }
    uint64_t v14 = [(UIScreen *)v7->_screen _displayID];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = @"mainDisplay";
    }
    objc_storeStrong((id *)&v7->_screenIdentifier, v16);
  }
  return v7;
}

- (void)stopAnimation
{
  id v3 = +[UIAnimator sharedAnimator];
  [v3 stopAnimation:self];
}

- (id)_screen
{
  return self->_screen;
}

- (id)_screenIdentifier
{
  return self->_screenIdentifier;
}

- (id)target
{
  return self->_target;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_action = v3;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  id completion = self->_completion;
  self->_id completion = v4;
}

- (id)completion
{
  v2 = _Block_copy(self->_completion);
  return v2;
}

- (void)setAnimationCurve:(int)a3
{
  *(unsigned char *)&self->_animationFlags = *(unsigned char *)&self->_animationFlags & 0xF0 | a3 & 0xF;
}

- (float)progressForFraction:(float)result
{
  int v3 = *(unsigned char *)&self->_animationFlags & 0xF;
  if (v3 == 2)
  {
    float v5 = sin(result * 0.785398163);
    return (float)(v5 + v5) * v5;
  }
  else if (v3 == 1)
  {
    float v6 = sin((1.0 - result) * 0.785398163);
    return 1.0 - (float)((float)(v6 + v6) * v6);
  }
  else if ((*(unsigned char *)&self->_animationFlags & 0xF) == 0)
  {
    float v4 = sin(result * 1.57079633);
    return v4 * v4;
  }
  return result;
}

- (int)state
{
  return self->_state;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  self->_state = 0;
}

- (float)fractionForTime:(double)a3
{
  double startTime = self->_startTime;
  if (self->_state == 1)
  {
    float result = fmax((a3 - startTime) / self->_duration, 0.0);
    if (result > 1.0 || 1.0 - result < 0.00100000005) {
      return 1.0;
    }
  }
  else
  {
    BOOL v5 = startTime < a3;
    double v6 = 0.0;
    if (v5) {
      return 1.0;
    }
    return v6;
  }
  return result;
}

- (void)markStart:(double)a3
{
  self->_state = 1;
  self->_double startTime = a3;
}

- (void)markStop
{
  self->_state = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenIdentifier, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong(&self->_target, 0);
}

@end