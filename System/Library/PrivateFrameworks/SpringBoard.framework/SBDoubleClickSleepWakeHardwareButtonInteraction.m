@interface SBDoubleClickSleepWakeHardwareButtonInteraction
- (BOOL)consumeInitialPressDown;
- (BOOL)consumeInitialPressUp;
- (BOOL)consumeSecondPressDown;
- (BSInvalidatable)proxLockAssertion;
- (SBDoubleClickSleepWakeHardwareButtonInteraction)initWithProximitySensorManager:(id)a3;
- (SBProximitySensorManager)proximitySensorManager;
- (void)_cancelPreviousResumeProxRequests;
- (void)_performSleep;
- (void)_performWake;
- (void)_resumeProxAfterMultiplePressIntervalForReason:(id)a3;
- (void)_resumeProxForReason:(id)a3;
- (void)_suspendProx;
- (void)observeFinalPressUp;
- (void)observeSinglePressDidFail;
- (void)setProxLockAssertion:(id)a3;
- (void)setProximitySensorManager:(id)a3;
@end

@implementation SBDoubleClickSleepWakeHardwareButtonInteraction

- (SBDoubleClickSleepWakeHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  v6 = [(SBSleepWakeHardwareButtonInteraction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proximitySensorManager, a3);
  }

  return v7;
}

- (BOOL)consumeInitialPressDown
{
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _resumeProxForReason:@"Initial press down - stuck request?"];
  v4.receiver = self;
  v4.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  return [(SBSleepWakeHardwareButtonInteraction *)&v4 consumeInitialPressDown];
}

- (BOOL)consumeInitialPressUp
{
  BOOL v3 = [(SBSleepWakeHardwareButtonInteraction *)self inhibitNextSinglePressUp];
  if (v3)
  {
    objc_super v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v5 = "wake/sleep x2 inital press up inhibited";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    if (![(SBProximitySensorManager *)self->_proximitySensorManager isObjectInProximity])
    {
      [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _suspendProx];
      [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _resumeProxAfterMultiplePressIntervalForReason:@"Multiple press timeout"];
      return v3;
    }
    objc_super v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v5 = "wake/sleep x2 not suspending prox because objectInProximity";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }

  return v3;
}

- (BOOL)consumeSecondPressDown
{
  return 0;
}

- (void)observeFinalPressUp
{
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _resumeProxForReason:@"final press up"];
  [(SBSleepWakeHardwareButtonInteraction *)self setInhibitNextSinglePressUp:1];
}

- (void)observeSinglePressDidFail
{
}

- (void)_performSleep
{
  v3.receiver = self;
  v3.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  [(SBSleepWakeHardwareButtonInteraction *)&v3 _performSleep];
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _resumeProxForReason:@"sleeping"];
}

- (void)_performWake
{
  v3.receiver = self;
  v3.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  [(SBSleepWakeHardwareButtonInteraction *)&v3 _performWake];
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _resumeProxForReason:@"waking"];
}

- (void)_suspendProx
{
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _cancelPreviousResumeProxRequests];
  if (!self->_proxLockAssertion)
  {
    objc_super v3 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "wake/sleep x2 suspend prox", v7, 2u);
    }

    objc_super v4 = [(SBSleepWakeHardwareButtonInteraction *)self sensorModeController];
    id v5 = [v4 suspendProximityDetectionForSource:0 reason:@"double-click interval"];
    proxLockAssertion = self->_proxLockAssertion;
    self->_proxLockAssertion = v5;
  }
}

- (void)_resumeProxForReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBDoubleClickSleepWakeHardwareButtonInteraction *)self _cancelPreviousResumeProxRequests];
  if (self->_proxLockAssertion)
  {
    id v5 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "wake/sleep x2 resume prox: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(BSInvalidatable *)self->_proxLockAssertion invalidate];
    proxLockAssertion = self->_proxLockAssertion;
    self->_proxLockAssertion = 0;
  }
}

- (void)_resumeProxAfterMultiplePressIntervalForReason:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self];
  [(SBSleepWakeHardwareButtonInteraction *)self multiplePressTimeInterval];
  -[SBDoubleClickSleepWakeHardwareButtonInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resumeProxForReason_, v5);
}

- (void)_cancelPreviousResumeProxRequests
{
}

- (BSInvalidatable)proxLockAssertion
{
  return self->_proxLockAssertion;
}

- (void)setProxLockAssertion:(id)a3
{
}

- (SBProximitySensorManager)proximitySensorManager
{
  return self->_proximitySensorManager;
}

- (void)setProximitySensorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_proxLockAssertion, 0);
}

@end