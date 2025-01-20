@interface SBAlwaysOnCoverGestureRecognizer
- (SBAlwaysOnCoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumCoverDuration;
- (float)minimumScreenCoverage;
- (void)_gestureBeganWithEvent:(__IOHIDEvent *)a3;
- (void)_gestureCanceledWithEvent:(__IOHIDEvent *)a3;
- (void)_gestureEndedWithEvent:(__IOHIDEvent *)a3;
- (void)_setState:(int64_t)a3;
- (void)dealloc;
- (void)processHIDEvent:(__IOHIDEvent *)a3;
- (void)setMaximumCoverDuration:(double)a3;
- (void)setMinimumScreenCoverage:(float)a3;
@end

@implementation SBAlwaysOnCoverGestureRecognizer

- (SBAlwaysOnCoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAlwaysOnCoverGestureRecognizer;
  v7 = [(SBAlwaysOnCoverGestureRecognizer *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_maximumCoverDuration = 10.0;
    v8->_minimumScreenCoverage = 0.0;
    v8->_action = v9;
    v8->_state = 0;
  }

  return v8;
}

- (void)dealloc
{
  [(BSContinuousMachTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnCoverGestureRecognizer;
  [(SBAlwaysOnCoverGestureRecognizer *)&v3 dealloc];
}

- (void)processHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetType() != 1
    || IOHIDEventGetIntegerValue() != 65280
    || IOHIDEventGetIntegerValue() != 89)
  {
    return;
  }
  char Phase = IOHIDEventGetPhase();
  char v6 = Phase;
  if (Phase)
  {
    float v7 = 1.0;
    if ((unint64_t)IOHIDEventGetIntegerValue() >= 4) {
      float v7 = *(float *)IOHIDEventGetDataValue();
    }
    float minimumScreenCoverage = self->_minimumScreenCoverage;
    SEL v9 = SBLogCoverGesture();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 >= minimumScreenCoverage)
    {
      if (v10)
      {
        int v13 = 134217984;
        double v14 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Cover gesture began with coverage %f", (uint8_t *)&v13, 0xCu);
      }

      [(SBAlwaysOnCoverGestureRecognizer *)self _gestureBeganWithEvent:a3];
      if ((v6 & 4) != 0) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v10)
      {
        int v13 = 134217984;
        double v14 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Cover gesture rejected. Coverage %f below threshold.", (uint8_t *)&v13, 0xCu);
      }

      if ((v6 & 4) != 0) {
        goto LABEL_18;
      }
    }
LABEL_6:
    if ((v6 & 8) == 0) {
      return;
    }
    goto LABEL_21;
  }
  if ((Phase & 4) == 0) {
    goto LABEL_6;
  }
LABEL_18:
  objc_super v11 = SBLogCoverGesture();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Cover gesture ended.", (uint8_t *)&v13, 2u);
  }

  [(SBAlwaysOnCoverGestureRecognizer *)self _gestureEndedWithEvent:a3];
  if ((v6 & 8) != 0)
  {
LABEL_21:
    v12 = SBLogCoverGesture();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Cover gesture canceled.", (uint8_t *)&v13, 2u);
    }

    [(SBAlwaysOnCoverGestureRecognizer *)self _gestureCanceledWithEvent:a3];
  }
}

- (void)_gestureBeganWithEvent:(__IOHIDEvent *)a3
{
  IOHIDEventGetTimeStampOfType();
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  double v5 = self->_maximumCoverDuration - v4;
  if (v5 <= 0.0)
  {
    double v14 = SBLogCoverGesture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Cover gesture failed because event too old.", v15, 2u);
    }

    v12 = self;
    uint64_t v13 = 3;
  }
  else
  {
    [(BSContinuousMachTimer *)self->_timer invalidate];
    id v6 = objc_alloc(MEMORY[0x1E4F4F6F0]);
    float v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    SEL v9 = (BSContinuousMachTimer *)[v6 initWithIdentifier:v8];
    timer = self->_timer;
    self->_timer = v9;

    objc_super v11 = self->_timer;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SBAlwaysOnCoverGestureRecognizer__gestureBeganWithEvent___block_invoke;
    v16[3] = &unk_1E6AF8170;
    v16[4] = self;
    [(BSContinuousMachTimer *)v11 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v16 queue:v5 handler:0.1];
    v12 = self;
    uint64_t v13 = 1;
  }
  [(SBAlwaysOnCoverGestureRecognizer *)v12 _setState:v13];
}

uint64_t __59__SBAlwaysOnCoverGestureRecognizer__gestureBeganWithEvent___block_invoke(uint64_t a1)
{
  v2 = SBLogCoverGesture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Cover gesture timed out.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _setState:3];
}

- (void)_gestureEndedWithEvent:(__IOHIDEvent *)a3
{
}

- (void)_gestureCanceledWithEvent:(__IOHIDEvent *)a3
{
}

- (void)_setState:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 3)
    {
      [(BSContinuousMachTimer *)self->_timer invalidate];
      timer = self->_timer;
      self->_timer = 0;
    }
    else if (a3 == 2)
    {
      [(BSContinuousMachTimer *)self->_timer invalidate];
      double v4 = self->_timer;
      self->_timer = 0;

      double v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      if (self->_action) {
        SEL action = self->_action;
      }
      else {
        SEL action = 0;
      }
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      v10[0] = *MEMORY[0x1E4F1C4B0];
      SEL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [v5 performSelector:action target:WeakRetained argument:self order:0 modes:v9];
    }
    if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 2) {
      self->_state = 0;
    }
  }
}

- (double)maximumCoverDuration
{
  return self->_maximumCoverDuration;
}

- (void)setMaximumCoverDuration:(double)a3
{
  self->_maximumCoverDuration = a3;
}

- (float)minimumScreenCoverage
{
  return self->_minimumScreenCoverage;
}

- (void)setMinimumScreenCoverage:(float)a3
{
  self->_float minimumScreenCoverage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end