@interface SBMotionDetectionWakeController
- (BOOL)_isEnabled;
- (BOOL)_isRequested;
- (BOOL)isMotionDetected;
- (BOOL)requireScreenOff;
- (SBMotionDetectionWakeControllerDelegate)delegate;
- (id)acquireMotionDetectionWakeAssertionForReason:(id)a3;
- (void)_evaluateEnablement;
- (void)_setEnabled:(BOOL)a3;
- (void)_setMotionDetected:(BOOL)a3;
- (void)_setRequested:(BOOL)a3;
- (void)dealloc;
- (void)motionDetectionManager:(id)a3 didUpdateMotionDetectionTriggerState:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setRequireScreenOff:(BOOL)a3;
@end

@implementation SBMotionDetectionWakeController

- (void)dealloc
{
  [(SBBacklightController *)self->_backlightController removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBMotionDetectionWakeController;
  [(SBMotionDetectionWakeController *)&v3 dealloc];
}

- (id)acquireMotionDetectionWakeAssertionForReason:(id)a3
{
  id v4 = a3;
  enablementAssertions = self->_enablementAssertions;
  if (!enablementAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __80__SBMotionDetectionWakeController_acquireMotionDetectionWakeAssertionForReason___block_invoke;
    v14 = &unk_1E6AF92D8;
    objc_copyWeak(&v15, &location);
    v7 = [v6 assertionWithIdentifier:@"Motion Detection Wake Enablement" stateDidChangeHandler:&v11];
    v8 = self->_enablementAssertions;
    self->_enablementAssertions = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    enablementAssertions = self->_enablementAssertions;
  }
  v9 = -[BSCompoundAssertion acquireForReason:](enablementAssertions, "acquireForReason:", v4, v11, v12, v13, v14);

  return v9;
}

void __80__SBMotionDetectionWakeController_acquireMotionDetectionWakeAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 isActive];

  [WeakRetained _setRequested:v4];
}

- (void)setRequireScreenOff:(BOOL)a3
{
  if (self->_requireScreenOff != a3)
  {
    self->_requireScreenOff = a3;
    [(SBMotionDetectionWakeController *)self _evaluateEnablement];
  }
}

- (void)_setRequested:(BOOL)a3
{
  if (self->_requested != a3)
  {
    self->_requested = a3;
    backlightController = self->_backlightController;
    if (a3)
    {
      if (!backlightController)
      {
        v5 = +[SBBacklightController sharedInstance];
        v6 = self->_backlightController;
        self->_backlightController = v5;

        backlightController = self->_backlightController;
      }
      [(SBBacklightController *)backlightController addObserver:self];
    }
    else
    {
      [(SBBacklightController *)backlightController removeObserver:self];
    }
    [(SBMotionDetectionWakeController *)self _evaluateEnablement];
  }
}

- (void)_evaluateEnablement
{
  BOOL v3 = [(SBMotionDetectionWakeController *)self _isRequested];
  BOOL v4 = [(SBBacklightController *)self->_backlightController screenIsOn];
  if (v3) {
    uint64_t v5 = !self->_requireScreenOff || !v4;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SBMotionDetectionWakeController *)self _setEnabled:v5];
}

- (void)_setEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    if (a3 && !self->_triggerManager)
    {
      BOOL v4 = (AMMotionDetectionTriggerManager *)objc_alloc_init(MEMORY[0x1E4F4A470]);
      triggerManager = self->_triggerManager;
      self->_triggerManager = v4;

      [(AMMotionDetectionTriggerManager *)self->_triggerManager addObserver:self queue:MEMORY[0x1E4F14428]];
    }
    v6 = SBLogBacklight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enabled = self->_enabled;
      v9[0] = 67109120;
      v9[1] = enabled;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "setting motion detection trigger BOOL enabled = %{BOOL}u", (uint8_t *)v9, 8u);
    }

    [(AMMotionDetectionTriggerManager *)self->_triggerManager setMotionDetectionEnabled:self->_enabled];
    if (self->_enabled)
    {
      BOOL v8 = 1;
    }
    else
    {
      [(SBMotionDetectionWakeController *)self _setMotionDetected:0];
      BOOL v8 = self->_enabled;
    }
    SBWorkspaceSetPreventIdleSleepForReason(v8, @"motion-to-wake");
  }
}

- (void)_setMotionDetected:(BOOL)a3
{
  if (self->_motionDetected != a3)
  {
    self->_motionDetected = a3;
    id v4 = [(SBMotionDetectionWakeController *)self delegate];
    [v4 motionDetectionWakeController:self motionDetectStateChanged:self->_motionDetected];
  }
}

- (void)motionDetectionManager:(id)a3 didUpdateMotionDetectionTriggerState:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = SBLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "didUpdateMotionDetectionTriggerState: 0x%llx", (uint8_t *)&v8, 0xCu);
  }

  if ([(SBMotionDetectionWakeController *)self _isEnabled])
  {
    if ((a4 & 0xFFFFFFFFFFFFFE31) != 0)
    {
      v7 = SBLogBacklight();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SBMotionDetectionWakeController motionDetectionManager:didUpdateMotionDetectionTriggerState:](a4, v7);
      }
    }
    else
    {
      [(SBMotionDetectionWakeController *)self _setMotionDetected:a4 != 0];
    }
  }
}

- (BOOL)isMotionDetected
{
  return self->_motionDetected;
}

- (BOOL)requireScreenOff
{
  return self->_requireScreenOff;
}

- (BOOL)_isRequested
{
  return self->_requested;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (SBMotionDetectionWakeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBMotionDetectionWakeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_enablementAssertions, 0);
}

- (void)motionDetectionManager:(uint64_t)a1 didUpdateMotionDetectionTriggerState:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "received invalid motion detection trigger state 0x%llx", (uint8_t *)&v2, 0xCu);
}

@end