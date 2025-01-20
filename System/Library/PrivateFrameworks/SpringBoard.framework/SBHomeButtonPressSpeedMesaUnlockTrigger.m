@interface SBHomeButtonPressSpeedMesaUnlockTrigger
- (BOOL)_isPrimed;
- (BOOL)_isTimerRunning;
- (BOOL)bioUnlock;
- (SBHomeButtonPressSpeedMesaUnlockTrigger)init;
- (double)slowPressDuration;
- (id)description;
- (id)succinctDescriptionBuilder;
- (void)_evaluateUnlock;
- (void)_invalidateTimer;
- (void)_startTimer;
- (void)_timerFired;
- (void)dealloc;
- (void)fingerOff;
- (void)menuButtonDown;
- (void)menuButtonUp;
- (void)screenOff;
- (void)setSlowPressDuration:(double)a3;
@end

@implementation SBHomeButtonPressSpeedMesaUnlockTrigger

- (SBHomeButtonPressSpeedMesaUnlockTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  v2 = [(SBHomeButtonPressSpeedMesaUnlockTrigger *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F5E408] rootSettings];
    v4 = [v3 mesaSettings];
    [v4 slowPressDuration];
    v2->_slowPressDuration = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_slowPressTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)&v3 dealloc];
}

- (id)description
{
  return [(SBMesaUnlockTrigger *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  objc_super v3 = [(SBMesaUnlockTrigger *)&v11 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendTimeInterval:@"slowPressDuration" withName:0 decomposeUnits:self->_slowPressDuration];
  id v5 = (id)[v3 appendBool:self->_buttonIsDown withName:@"buttonIsDown"];
  id v6 = (id)[v3 appendBool:self->_fingerIsOn withName:@"fingerIsOn"];
  id v7 = (id)[v3 appendBool:self->_bioUnlockOccurred withName:@"bioUnlockOccurred"];
  id v8 = (id)[v3 appendBool:self->_timerFired withName:@"timerFired"];
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHomeButtonPressSpeedMesaUnlockTrigger _isTimerRunning](self, "_isTimerRunning"), @"isTimerRunning");
  return v3;
}

- (BOOL)bioUnlock
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_bioUnlockOccurred = 1;
  if ([(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _isTimerRunning])
  {
    objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] not unlocking because the timer is running", (uint8_t *)v8, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _isPrimed];
    objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL buttonIsDown = self->_buttonIsDown;
      BOOL fingerIsOn = self->_fingerIsOn;
      v8[0] = 67109632;
      v8[1] = v4;
      __int16 v9 = 1024;
      BOOL v10 = buttonIsDown;
      __int16 v11 = 1024;
      BOOL v12 = fingerIsOn;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] timer isn't running, unlocking: %d (button is down: %d finger is on: %d)", (uint8_t *)v8, 0x14u);
    }
  }

  return v4;
}

- (void)screenOff
{
  objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] screen off - resetting state", v4, 2u);
  }

  self->_bioUnlockOccurred = 0;
  self->_BOOL buttonIsDown = 0;
  self->_BOOL fingerIsOn = 0;
  self->_timerFired = 0;
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _invalidateTimer];
}

- (void)menuButtonDown
{
  objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] menu button down - starting timer for unlock and priming", v4, 2u);
  }

  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _startTimer];
  self->_BOOL buttonIsDown = 1;
  self->_BOOL fingerIsOn = 1;
}

- (void)menuButtonUp
{
  objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] menu button up - priming", v4, 2u);
  }

  self->_BOOL buttonIsDown = 0;
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _evaluateUnlock];
}

- (void)fingerOff
{
  objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] finger off - no longer primed", v4, 2u);
  }

  self->_BOOL fingerIsOn = 0;
}

- (void)_startTimer
{
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _invalidateTimer];
  objc_initWeak(&location, self);
  objc_super v3 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBHomeButtonPressSpeedMesaUnlockTrigger.slowPressTimer"];
  slowPressTimer = self->_slowPressTimer;
  self->_slowPressTimer = v3;

  id v5 = self->_slowPressTimer;
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self slowPressDuration];
  double v7 = v6;
  uint64_t v8 = MEMORY[0x1E4F14428];
  id v9 = MEMORY[0x1E4F14428];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SBHomeButtonPressSpeedMesaUnlockTrigger__startTimer__block_invoke;
  v10[3] = &unk_1E6AF5838;
  objc_copyWeak(&v11, &location);
  [(BSAbsoluteMachTimer *)v5 scheduleWithFireInterval:v8 leewayInterval:v10 queue:v7 handler:0.0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__SBHomeButtonPressSpeedMesaUnlockTrigger__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (void)_invalidateTimer
{
  [(BSAbsoluteMachTimer *)self->_slowPressTimer invalidate];
  slowPressTimer = self->_slowPressTimer;
  self->_slowPressTimer = 0;
}

- (void)_timerFired
{
  self->_timerFired = 1;
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _evaluateUnlock];
  [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _invalidateTimer];
}

- (BOOL)_isTimerRunning
{
  return self->_slowPressTimer != 0;
}

- (void)_evaluateUnlock
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_bioUnlockOccurred
    && self->_timerFired
    && [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _isPrimed])
  {
    objc_super v3 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] unlocking | match occurred, timer fired, button is up, and finger is still on", (uint8_t *)v10, 2u);
    }

    BOOL v4 = [(SBMesaUnlockTrigger *)self delegate];
    [v4 mesaUnlockTriggerFired:self];

    [(SBHomeButtonPressSpeedMesaUnlockTrigger *)self _invalidateTimer];
  }
  else
  {
    id v5 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL bioUnlockOccurred = self->_bioUnlockOccurred;
      BOOL timerFired = self->_timerFired;
      BOOL buttonIsDown = self->_buttonIsDown;
      BOOL fingerIsOn = self->_fingerIsOn;
      v10[0] = 67109888;
      v10[1] = bioUnlockOccurred;
      __int16 v11 = 1024;
      BOOL v12 = timerFired;
      __int16 v13 = 1024;
      BOOL v14 = buttonIsDown;
      __int16 v15 = 1024;
      BOOL v16 = fingerIsOn;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] not unlocking | match occurred: %d timer fired: %d button is still down: %d finger is still on: %d", (uint8_t *)v10, 0x1Au);
    }
  }
}

- (BOOL)_isPrimed
{
  return !self->_buttonIsDown && self->_fingerIsOn;
}

- (double)slowPressDuration
{
  return self->_slowPressDuration;
}

- (void)setSlowPressDuration:(double)a3
{
  self->_slowPressDuration = a3;
}

- (void).cxx_destruct
{
}

@end