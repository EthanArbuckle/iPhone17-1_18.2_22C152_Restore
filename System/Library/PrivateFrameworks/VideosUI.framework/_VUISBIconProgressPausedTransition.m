@interface _VUISBIconProgressPausedTransition
+ (id)newTransitionToPaused:(BOOL)a3;
- (BOOL)isCompleteWithView:(id)a3;
- (id)_initToPaused:(BOOL)a3;
- (void)_updateElapsedTimeFromFraction;
- (void)_updateTimingFunction;
- (void)_updateView:(id)a3;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)dealloc;
- (void)updateToPaused:(BOOL)a3;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _VUISBIconProgressPausedTransition

+ (id)newTransitionToPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)a1);
  return (id)[v4 _initToPaused:v3];
}

- (id)_initToPaused:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_VUISBIconProgressPausedTransition;
  id v4 = [(_VUISBIconProgressPausedTransition *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_toPaused = a3;
    v4->_duration = 0.5;
    [(_VUISBIconProgressPausedTransition *)v4 _updateTimingFunction];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_VUISBIconProgressPausedTransition;
  [(_VUISBIconProgressPausedTransition *)&v3 dealloc];
}

- (void)updateToPaused:(BOOL)a3
{
  if (self->_toPaused != a3)
  {
    self->_toPaused = a3;
    self->_fraction = 1.0 - self->_fraction;
    [(_VUISBIconProgressPausedTransition *)self _updateTimingFunction];
    [(_VUISBIconProgressPausedTransition *)self _updateElapsedTimeFromFraction];
  }
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
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
  [(_VUISBIconProgressPausedTransition *)self _updateView:a3];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  [(_VUISBIconProgressPausedTransition *)self _updateView:a3];
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  double fraction = self->_fraction;
  if (!self->_toPaused) {
    double fraction = 1.0 - fraction;
  }
  [a3 setPauseRadiusFraction:fraction];
  if ([(_VUISBIconProgressPausedTransition *)self isCompleteWithView:a3]) {
    [a3 setDisplayingPaused:self->_toPaused];
  }
  [a3 circleBoundingRect];
  objc_msgSend(a3, "setNeedsDisplayInRect:");
}

- (void)_updateTimingFunction
{
  if (self->_toPaused) {
    objc_super v3 = (void *)MEMORY[0x1E4F3A498];
  }
  else {
    objc_super v3 = (void *)MEMORY[0x1E4F3A488];
  }
  self->_timingFunction = (CAMediaTimingFunction *)(id)[MEMORY[0x1E4F39C10] functionWithName:*v3];
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

@end