@interface SBBacklightIdleTimer
- (BOOL)isActivated;
- (BOOL)isDisabled;
- (BOOL)requiresManualReset;
- (NSString)description;
- (SBBacklightIdleTimer)init;
- (SBBacklightIdleTimer)initWithConfigurationIdentifier:(id)a3;
- (SBIdleTimerDescriptor)descriptor;
- (double)_effectiveExpireTimeoutDuration;
- (double)_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:(double)a3;
- (double)_effectiveTimeoutForBaseTimeout:(double)a3;
- (double)_effectiveWarnTimeoutDuration;
- (double)timeMultiplier;
- (id)_initWithAttentionAwareTimer:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateCaptureDescriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)expectation;
- (void)_reconfigureAttentionClientAndReset:(BOOL)a3;
- (void)_resetExpectation;
- (void)_stopIfManual;
- (void)idleTimer:(id)a3 attentionLostTimeoutDidExpire:(id)a4;
- (void)idleTimerDidReset:(id)a3 forUserAttention:(unint64_t)a4 at:(double)a5;
- (void)reset;
- (void)setActivated:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setExpectation:(unint64_t)a3;
- (void)setRequiresManualReset:(BOOL)a3;
- (void)setTimeMultiplier:(double)a3;
@end

@implementation SBBacklightIdleTimer

- (SBBacklightIdleTimer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBBacklightIdleTimer.m" lineNumber:70 description:@"Use initWithConfigurationIdentifier:"];

  return 0;
}

- (SBBacklightIdleTimer)initWithConfigurationIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F6F2C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithConfigurationIdentifier:v5 delegate:self calloutQueue:MEMORY[0x1E4F14428]];

  v8 = [(SBBacklightIdleTimer *)self _initWithAttentionAwareTimer:v7];
  return v8;
}

- (id)_initWithAttentionAwareTimer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBacklightIdleTimer;
  id v6 = [(SBBacklightIdleTimer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_timeMultiplier = 1.0;
    objc_storeStrong((id *)&v6->_attentionAwareTimer, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(SBBacklightIdleTimer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBBacklightIdleTimer *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBBacklightIdleTimer *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBBacklightIdleTimer *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_descriptor withName:@"descriptor"];
  unint64_t expectation = self->_expectation;
  if (expectation > 3) {
    v7 = 0;
  }
  else {
    v7 = off_1E6B01C40[expectation];
  }
  [v4 appendString:v7 withName:@"expectation"];
  id v8 = (id)[v4 appendBool:self->_requiresManualReset withName:@"requiresManualReset"];
  return v4;
}

- (BOOL)isDisabled
{
  return 0;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBBacklightIdleTimer;
  [(SBIdleTimerBase *)&v3 reset];
  if (([(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer isEnabled] & 1) == 0) {
    [(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer setEnabled:1];
  }
  [(SBBacklightIdleTimer *)self _resetExpectation];
  [(SBBacklightIdleTimer *)self _reconfigureAttentionClientAndReset:1];
  [(SBIdleTimerBase *)self _makeObserversPerformSelector:sel_idleTimerDidRefresh_];
}

- (id)stateCaptureDescriptionWithMultilinePrefix:(id)a3
{
  v4 = [(SBBacklightIdleTimer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [(SBIdleTimerDescriptor *)self->_descriptor auditReasonsForStateCapture];
  [v4 appendArraySection:v5 withName:@"auditReasons" skipIfEmpty:0];

  id v6 = [v4 build];

  return v6;
}

- (void)idleTimer:(id)a3 attentionLostTimeoutDidExpire:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 descriptor];
  id v8 = SBLogIdleTimer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138543618;
    id v33 = v6;
    __int16 v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "attention event with timeout: %{public}@ for descriptor: %{public}@", (uint8_t *)&v32, 0x16u);
  }

  [(SBBacklightIdleTimer *)self _effectiveWarnTimeoutDuration];
  v10 = v9;
  [(SBBacklightIdleTimer *)self _effectiveQuickUnwarnTimeoutDurationForWarnTimeout:"_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:"];
  v12 = v11;
  [(SBBacklightIdleTimer *)self _effectiveExpireTimeoutDuration];
  v14 = v13;
  if (BSFloatIsZero())
  {
    unint64_t v15 = 3;
  }
  else if (BSFloatEqualToFloat())
  {
    unint64_t v15 = 3;
  }
  else
  {
    unint64_t v15 = 1;
  }
  if (BSFloatIsZero()) {
    int v16 = 0;
  }
  else {
    int v16 = BSFloatEqualToFloat() ^ 1;
  }
  if (BSFloatIsZero()) {
    int v17 = 0;
  }
  else {
    int v17 = BSFloatEqualToFloat() ^ 1;
  }
  unint64_t expectation = self->_expectation;
  uint64_t v19 = [v6 identifier];
  switch(v19)
  {
    case 3:
      v23 = SBLogIdleTimer();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [v6 duration];
        int v32 = 134218240;
        id v33 = v24;
        __int16 v34 = 2048;
        v35 = v14;
        _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "attention event: expire @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      self->_unint64_t expectation = v15;
      [(SBIdleTimerBase *)self _makeObserversPerformSelector:sel_idleTimerDidExpire_];
      [(SBBacklightIdleTimer *)self _stopIfManual];
      break;
    case 2:
      v25 = SBLogIdleTimer();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        [v6 duration];
        int v32 = 134218240;
        id v33 = v26;
        __int16 v34 = 2048;
        v35 = v12;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "attention event: quickWarn @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      if (v17) {
        unint64_t v27 = 3;
      }
      else {
        unint64_t v27 = 1;
      }
      self->_unint64_t expectation = v27;
      break;
    case 1:
      v20 = SBLogIdleTimer();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        [v6 duration];
        int v32 = 134218240;
        id v33 = v21;
        __int16 v34 = 2048;
        v35 = v10;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "attention event: warn @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      unint64_t v22 = 3;
      if (!v17) {
        unint64_t v22 = 1;
      }
      if (v16) {
        unint64_t v22 = 2;
      }
      self->_unint64_t expectation = v22;
      [(SBIdleTimerBase *)self _makeObserversPerformSelector:sel_idleTimerDidWarn_];
      break;
  }
  v28 = SBLogIdleTimer();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (expectation > 3) {
      v29 = 0;
    }
    else {
      v29 = off_1E6B01C40[expectation];
    }
    unint64_t v30 = self->_expectation;
    if (v30 > 3) {
      v31 = 0;
    }
    else {
      v31 = off_1E6B01C40[v30];
    }
    int v32 = 134219010;
    id v33 = v12;
    __int16 v34 = 2048;
    v35 = v10;
    __int16 v36 = 2048;
    v37 = v14;
    __int16 v38 = 2114;
    v39 = v29;
    __int16 v40 = 2114;
    v41 = v31;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "attention event: looking for quickWarn:%g warn:%g total:%g expecting:%{public}@ -> %{public}@", (uint8_t *)&v32, 0x34u);
  }
}

- (void)idleTimerDidReset:(id)a3 forUserAttention:(unint64_t)a4 at:(double)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = SBLogIdleTimer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    unint64_t v12 = a4;
    __int16 v13 = 2048;
    double v14 = a5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "attention event: user event: %lu reset timer at: %g", (uint8_t *)&v11, 0x16u);
  }

  if (self->_expectation == 2)
  {
    objc_super v9 = SBLogIdleTimer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "attention event: reconfigure for extended timeout", (uint8_t *)&v11, 2u);
    }

    self->_unint64_t expectation = 1;
    self->_timeMultiplier = 2.0;
    [(SBBacklightIdleTimer *)self _reconfigureAttentionClientAndReset:0];
  }
  else
  {
    [(SBBacklightIdleTimer *)self _resetExpectation];
  }
  v10 = SBLogIdleTimer();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "attention event: refresh", (uint8_t *)&v11, 2u);
  }

  [(SBIdleTimerBase *)self _makeObserversPerformSelector:sel_idleTimerDidResetForUserAttention_];
}

- (void)setDescriptor:(id)a3
{
  id v5 = (SBIdleTimerDescriptor *)a3;
  if (self->_descriptor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_descriptor, a3);
    uint64_t v6 = [(SBIdleTimerDescriptor *)v7 timerMode];
    id v5 = v7;
    self->_requiresManualReset = v6 == 2;
    if (!self->_expectation)
    {
      [(SBBacklightIdleTimer *)self _reconfigureAttentionClientAndReset:0];
      [(SBBacklightIdleTimer *)self _resetExpectation];
      id v5 = v7;
    }
  }
}

- (BOOL)isActivated
{
  return [(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer isEnabled];
}

- (void)setActivated:(BOOL)a3
{
}

- (void)_stopIfManual
{
  if ([(SBBacklightIdleTimer *)self requiresManualReset])
  {
    attentionAwareTimer = self->_attentionAwareTimer;
    [(ITAttentionAwareIdleTimer *)attentionAwareTimer setEnabled:0];
  }
}

- (double)_effectiveWarnTimeoutDuration
{
  [(SBIdleTimerDescriptor *)self->_descriptor warnInterval];
  [(SBBacklightIdleTimer *)self _effectiveTimeoutForBaseTimeout:"_effectiveTimeoutForBaseTimeout:"];
  return result;
}

- (double)_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:(double)a3
{
  [(SBIdleTimerDescriptor *)self->_descriptor quickUnwarnInterval];
  [(SBBacklightIdleTimer *)self _effectiveTimeoutForBaseTimeout:"_effectiveTimeoutForBaseTimeout:"];
  double v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    int v7 = BSFloatEqualToFloat();
    if (v6 - a3 <= 2.0) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
    if (!v8) {
      return a3 + 2.0;
    }
  }
  return v6;
}

- (double)_effectiveExpireTimeoutDuration
{
  [(SBIdleTimerDescriptor *)self->_descriptor totalInterval];
  [(SBBacklightIdleTimer *)self _effectiveTimeoutForBaseTimeout:"_effectiveTimeoutForBaseTimeout:"];
  return result;
}

- (double)_effectiveTimeoutForBaseTimeout:(double)a3
{
  if (self->_timeMultiplier != 1.0 && (BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0) {
    return self->_timeMultiplier * a3;
  }
  return a3;
}

- (void)_resetExpectation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t expectation = self->_expectation;
  if (self->_timeMultiplier > 1.0)
  {
    v4 = SBLogIdleTimer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "attention reset expectation: removing extended timeout", (uint8_t *)&v11, 2u);
    }

    self->_timeMultiplier = 1.0;
    [(SBBacklightIdleTimer *)self _reconfigureAttentionClientAndReset:0];
  }
  [(SBIdleTimerDescriptor *)self->_descriptor warnInterval];
  if (BSFloatIsZero())
  {
    unint64_t v5 = 3;
  }
  else
  {
    int v6 = BSFloatEqualToFloat();
    unint64_t v5 = 3;
    if (!v6) {
      unint64_t v5 = 1;
    }
  }
  self->_unint64_t expectation = v5;
  if (v5 != expectation)
  {
    int v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (expectation > 3) {
        int v8 = 0;
      }
      else {
        int v8 = off_1E6B01C40[expectation];
      }
      unint64_t v9 = self->_expectation;
      if (v9 > 3) {
        v10 = 0;
      }
      else {
        v10 = off_1E6B01C40[v9];
      }
      int v11 = 138543618;
      unint64_t v12 = v8;
      __int16 v13 = 2114;
      double v14 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "attention expectation: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_reconfigureAttentionClientAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F6F2D8]);
  [(SBIdleTimerDescriptor *)self->_descriptor sampleInterval];
  double v7 = v6;
  if (BSFloatIsZero()) {
    int v8 = 0;
  }
  else {
    int v8 = BSFloatEqualToFloat() ^ 1;
  }
  if ([(SBIdleTimerDescriptor *)self->_descriptor timerMode] == 1) {
    uint64_t v9 = 2654;
  }
  else {
    uint64_t v9 = 2134;
  }
  if (v8) {
    uint64_t v10 = v9 | 0x80;
  }
  else {
    uint64_t v10 = v9;
  }
  objc_msgSend(v5, "setAttentionEventMaintenanceMask:recoveryMask:", v10);
  [(SBBacklightIdleTimer *)self _effectiveWarnTimeoutDuration];
  double v12 = v11;
  [(SBBacklightIdleTimer *)self _effectiveQuickUnwarnTimeoutDurationForWarnTimeout:"_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:"];
  double v14 = v13;
  [(SBBacklightIdleTimer *)self _effectiveExpireTimeoutDuration];
  double v16 = v15;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F6F2D0]) initWithDuration:1 identifier:v12];
    [v17 addObject:v18];
    if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
    {
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F6F2D0]) initWithDuration:2 identifier:v14];
      [v17 addObject:v19];
    }
  }
  if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F6F2D0]) initWithDuration:3 identifier:v16];
    [v17 addObject:v20];
  }
  v21 = SBLogIdleTimer();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = _SBIdleTimeoutsDescriptionForLogging(v17);
    int v23 = 134218242;
    v24 = self;
    __int16 v25 = 2114;
    v26 = v22;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "%p reconfigured attention timeouts:%{public}@", (uint8_t *)&v23, 0x16u);
  }
  if ([v17 count])
  {
    [v5 setTimeouts:v17];
    if (v8)
    {
      [v5 setAttentionSamplingPeriod:v7];
      [v5 setAttentionSamplingStartBeforeFirstTimeout:16.0];
    }
    [(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer setEnabled:1];
    [(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer setDescriptor:v5 resettingTimer:v3];
    [(SBBacklightIdleTimer *)self _effectiveExpireTimeoutDuration];
    [(SBIdleTimerBase *)self _logExpirationTimeout:"_logExpirationTimeout:"];
  }
  else
  {
    [(ITAttentionAwareIdleTimer *)self->_attentionAwareTimer setEnabled:0];
  }
}

- (SBIdleTimerDescriptor)descriptor
{
  return self->_descriptor;
}

- (double)timeMultiplier
{
  return self->_timeMultiplier;
}

- (void)setTimeMultiplier:(double)a3
{
  self->_timeMultiplier = a3;
}

- (unint64_t)expectation
{
  return self->_expectation;
}

- (void)setExpectation:(unint64_t)a3
{
  self->_unint64_t expectation = a3;
}

- (BOOL)requiresManualReset
{
  return self->_requiresManualReset;
}

- (void)setRequiresManualReset:(BOOL)a3
{
  self->_requiresManualReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_attentionAwareTimer, 0);
}

@end