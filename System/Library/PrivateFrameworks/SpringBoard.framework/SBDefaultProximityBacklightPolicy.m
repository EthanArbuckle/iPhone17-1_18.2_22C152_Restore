@interface SBDefaultProximityBacklightPolicy
- (SBDefaultProximityBacklightPolicy)initWithConfiguration:(id)a3;
- (SBIdleTimerGlobalCoordinator)idleTimerGlobalCoordinator;
- (void)_backlightWillUndim:(id)a3;
- (void)_cancelScheduledBacklightFactorToZero;
- (void)_restoreBacklightFactor;
- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3;
- (void)_scheduleBacklightFactorToZeroAfterDefaultDuration;
- (void)_turnBacklightOff;
- (void)dealloc;
- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4;
- (void)setIdleTimerGlobalCoordinator:(id)a3;
@end

@implementation SBDefaultProximityBacklightPolicy

- (SBDefaultProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDefaultProximityBacklightPolicy;
  v5 = [(SBDefaultProximityBacklightPolicy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 backlightController];
    backlightController = v5->_backlightController;
    v5->_backlightController = (SBBacklightController *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__backlightWillUndim_ name:*MEMORY[0x1E4FA7A00] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBDefaultProximityBacklightPolicy;
  [(SBDefaultProximityBacklightPolicy *)&v4 dealloc];
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  if (a4) {
    [(SBDefaultProximityBacklightPolicy *)self _scheduleBacklightFactorToZeroAfterDefaultDuration];
  }
  else {
    [(SBDefaultProximityBacklightPolicy *)self _restoreBacklightFactor];
  }
}

- (void)_scheduleBacklightFactorToZeroAfterDefaultDuration
{
}

- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(SBDefaultProximityBacklightPolicy *)self _cancelScheduledBacklightFactorToZero];
  v5 = SBLogProximitySensor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling backlight to turn off in %{public}@s.", (uint8_t *)&v8, 0xCu);
  }
  self->_scheduled = 1;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
  [(SBDefaultProximityBacklightPolicy *)self performSelector:sel__turnBacklightOff withObject:0 afterDelay:v7 inModes:a3];
}

- (void)_cancelScheduledBacklightFactorToZero
{
  [(BSInvalidatable *)self->_idleTimerDisableAssertion invalidate];
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = 0;

  if (self->_scheduled)
  {
    objc_super v4 = SBLogProximitySensor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling scheduled backlight change.", v5, 2u);
    }

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__turnBacklightOff object:0];
  }
}

- (void)_restoreBacklightFactor
{
  [(BSInvalidatable *)self->_captureButtonSuppressionAssertion invalidate];
  captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
  self->_captureButtonSuppressionAssertion = 0;

  [(SBDefaultProximityBacklightPolicy *)self _cancelScheduledBacklightFactorToZero];
  int64_t v4 = [(SBBacklightController *)self->_backlightController lastBacklightChangeSource];
  v5 = SBLogProximitySensor();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 13)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Restoring original backlight factor.", buf, 2u);
    }

    [(SBBacklightController *)self->_backlightController _undimFromSource:13];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Not restoring original backlight factor, because someone else modified the backlight since we last turned it off.", v7, 2u);
    }
  }
}

- (void)_backlightWillUndim:(id)a3
{
  [(BSInvalidatable *)self->_captureButtonSuppressionAssertion invalidate];
  captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
  self->_captureButtonSuppressionAssertion = 0;

  if (self->_scheduled)
  {
    v5 = SBLogProximitySensor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Backlight will undim outside of our control - cancelling any scheduled changes.", v6, 2u);
    }

    [(SBDefaultProximityBacklightPolicy *)self _cancelScheduledBacklightFactorToZero];
  }
}

- (void)_turnBacklightOff
{
  int64_t v4 = SBLogProximitySensor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Turning off the backlight.", v12, 2u);
  }

  self->_scheduled = 0;
  idleTimerGlobalCoordinator = self->_idleTimerGlobalCoordinator;
  if (!idleTimerGlobalCoordinator)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBDefaultProximityBacklightPolicy.m" lineNumber:132 description:@"-_turnBacklightOff called without idle timer global coordinator"];

    idleTimerGlobalCoordinator = self->_idleTimerGlobalCoordinator;
  }
  BOOL v6 = [(SBIdleTimerGlobalCoordinator *)idleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:@"ObjectInProximity"];
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = v6;

  if (!self->_captureButtonSuppressionAssertion)
  {
    int v8 = [(id)SBApp captureButtonRestrictionCoordinator];
    v9 = [v8 inhibitCaptureButtonActionAssertionWithReason:@"Object Within Proximity Turned Off Screen"];
    captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
    self->_captureButtonSuppressionAssertion = v9;
  }
  [(SBBacklightController *)self->_backlightController setBacklightState:4 source:13];
}

- (SBIdleTimerGlobalCoordinator)idleTimerGlobalCoordinator
{
  return self->_idleTimerGlobalCoordinator;
}

- (void)setIdleTimerGlobalCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerGlobalCoordinator, 0);
  objc_storeStrong((id *)&self->_captureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end