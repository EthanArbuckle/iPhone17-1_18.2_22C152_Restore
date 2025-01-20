@interface _SBIconProgressPausedTransition
+ (id)newTransitionToPaused:(BOOL)a3;
- (BOOL)isCompleteWithView:(id)a3;
- (id)_initToPaused:(BOOL)a3;
- (void)_updateElapsedTimeFromFraction;
- (void)_updateTimingFunction;
- (void)_updateView:(id)a3;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)updateToPaused:(BOOL)a3;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _SBIconProgressPausedTransition

+ (id)newTransitionToPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)a1);
  return (id)[v4 _initToPaused:v3];
}

- (id)_initToPaused:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SBIconProgressPausedTransition;
  id v4 = [(_SBIconProgressPausedTransition *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_toPaused = a3;
    v4->_duration = 0.5;
    [(_SBIconProgressPausedTransition *)v4 _updateTimingFunction];
  }
  return v5;
}

- (void)updateToPaused:(BOOL)a3
{
  if (self->_toPaused != a3)
  {
    self->_toPaused = a3;
    self->_fraction = 1.0 - self->_fraction;
    [(_SBIconProgressPausedTransition *)self _updateTimingFunction];
    [(_SBIconProgressPausedTransition *)self _updateElapsedTimeFromFraction];
  }
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
  [(_SBIconProgressPausedTransition *)self _updateView:v11];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  [(_SBIconProgressPausedTransition *)self _updateView:a3];
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  double fraction = self->_fraction;
  if (!self->_toPaused) {
    double fraction = 1.0 - fraction;
  }
  [v4 setPauseRadiusFraction:fraction];
  if ([(_SBIconProgressPausedTransition *)self isCompleteWithView:v6]) {
    [v6 setDisplayingPaused:self->_toPaused];
  }
  [v6 circleBoundingRect];
  objc_msgSend(v6, "setNeedsDisplayInRect:");
}

- (void)_updateTimingFunction
{
  if (self->_toPaused) {
    BOOL v3 = (void *)MEMORY[0x1E4F3A498];
  }
  else {
    BOOL v3 = (void *)MEMORY[0x1E4F3A488];
  }
  id v4 = [MEMORY[0x1E4F39C10] functionWithName:*v3];
  timingFunction = self->_timingFunction;
  self->_timingFunction = v4;
}

- (void)_updateElapsedTimeFromFraction
{
  double v3 = 1.0;
  double v4 = 0.0;
  while (1)
  {
    double v5 = v3 + v4;
    double v6 = (v3 + v4) * 0.5;
    *(float *)&double v5 = v6;
    [(CAMediaTimingFunction *)self->_timingFunction _solveForInput:v5];
    double v8 = v7;
    double fraction = self->_fraction;
    if (vabdd_f64(v8, fraction) < 0.01) {
      break;
    }
    if (fraction > v8) {
      double v4 = (v3 + v4) * 0.5;
    }
    else {
      double v3 = (v3 + v4) * 0.5;
    }
    if (v3 - v4 <= 0.01)
    {
      double v6 = 0.0;
      break;
    }
  }
  self->_totalElapsedTime = v6 * self->_duration;
}

- (void).cxx_destruct
{
}

@end