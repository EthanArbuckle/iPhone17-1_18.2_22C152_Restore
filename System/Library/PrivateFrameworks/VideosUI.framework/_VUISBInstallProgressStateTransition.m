@interface _VUISBInstallProgressStateTransition
+ (Class)_classForTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
+ (id)newTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)isCompleteWithView:(id)a3;
- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)_updateView:(id)a3;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)dealloc;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _VUISBInstallProgressStateTransition

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
      return 0;
    }
  }
  else if (a3 == 1)
  {
    if (a4 && a4 != 2) {
      return 0;
    }
  }
  else if (a3 || a4 != 1 && a4 != 2)
  {
    return 0;
  }
  return (Class)objc_opt_class();
}

- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_VUISBInstallProgressStateTransition;
  id v6 = [(_VUISBInstallProgressStateTransition *)&v10 init];
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
    v6->_timingFunction = (CAMediaTimingFunction *)(id)[MEMORY[0x1E4F39C10] functionWithName:*v8];
    v7->_duration = 0.5;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_VUISBInstallProgressStateTransition;
  [(_VUISBInstallProgressStateTransition *)&v3 dealloc];
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
  [(_VUISBInstallProgressStateTransition *)self _updateView:a3];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  [(_VUISBInstallProgressStateTransition *)self _updateView:a3];
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  [a3 setDisplayedState:self->_toState];
  if ([(_VUISBInstallProgressStateTransition *)self isCompleteWithView:a3]
    && self->_toState != 2)
  {
    [a3 setDisplayedFraction:0.0];
  }
}

@end