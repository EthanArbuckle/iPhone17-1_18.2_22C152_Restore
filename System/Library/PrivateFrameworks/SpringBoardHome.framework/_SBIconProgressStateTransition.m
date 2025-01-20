@interface _SBIconProgressStateTransition
+ (Class)_classForTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
+ (id)newTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)isCompleteWithView:(id)a3;
- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)_updateView:(id)a3;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _SBIconProgressStateTransition

+ (id)newTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v6 = objc_alloc((Class)objc_msgSend(a1, "_classForTransitionFromState:toState:"));
  return (id)[v6 _initWithFromState:a3 toState:a4];
}

+ (Class)_classForTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (a3 == 2)
  {
    if ((unint64_t)a4 > 1) {
      goto LABEL_11;
    }
  }
  else if (a3 == 1)
  {
    if (a4 && a4 != 2)
    {
LABEL_11:
      v5 = 0;
      return (Class)v5;
    }
  }
  else if (a3 || a4 != 1 && a4 != 2)
  {
    goto LABEL_11;
  }
  v5 = objc_opt_class();
  return (Class)v5;
}

- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_SBIconProgressStateTransition;
  id v6 = [(_SBIconProgressStateTransition *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_fromState = a3;
    v6->_toState = a4;
    if (v6->_fromState >= a4) {
      v8 = (void *)MEMORY[0x1E4F3A488];
    }
    else {
      v8 = (void *)MEMORY[0x1E4F3A498];
    }
    uint64_t v9 = [MEMORY[0x1E4F39C10] functionWithName:*v8];
    timingFunction = v7->_timingFunction;
    v7->_timingFunction = (CAMediaTimingFunction *)v9;

    v7->_duration = 0.5;
  }
  return v7;
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
  id v11 = a3;
  double v6 = self->_totalElapsedTime + a4;
  self->_totalElapsedTime = v6;
  double duration = self->_duration;
  double v8 = 1.0;
  if (v6 < duration)
  {
    double v9 = v6 / duration;
    *(float *)&double v9 = v9;
    -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v9, 1.0);
    double v8 = v10;
  }
  self->_fraction = v8;
  [(_SBIconProgressStateTransition *)self _updateView:v11];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  [(_SBIconProgressStateTransition *)self _updateView:a3];
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  id v4 = a3;
  [v4 setDisplayedState:self->_toState];
  if ([(_SBIconProgressStateTransition *)self isCompleteWithView:v4] && self->_toState != 2) {
    [v4 setDisplayedFraction:0.0];
  }
}

- (void).cxx_destruct
{
}

@end