@interface SBCaptureHardwareButtonScanningPowerLinkedTimer
- (BOOL)isScheduled;
- (SBCaptureHardwareButtonScanningPowerLinkedTimer)initWithIdentifier:(id)a3 timeout:(double)a4 existingRequest:(id)a5 scanModeResource:(id)a6 handler:(id)a7;
- (void)_didTimeoutWithHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBCaptureHardwareButtonScanningPowerLinkedTimer

- (SBCaptureHardwareButtonScanningPowerLinkedTimer)initWithIdentifier:(id)a3 timeout:(double)a4 existingRequest:(id)a5 scanModeResource:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SBCaptureHardwareButtonScanningPowerLinkedTimer;
  v16 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)&v29 init];
  if (v16)
  {
    if (v13)
    {
      v17 = (BSInvalidatable *)v13;
    }
    else
    {
      v17 = [v14 requestActiveScanningModeForReason:v12];
    }
    buttonPowerRequest = v16->_buttonPowerRequest;
    v16->_buttonPowerRequest = v17;

    objc_initWeak(&location, v16);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:v12];
    timer = v16->_timer;
    v16->_timer = (BSAbsoluteMachTimer *)v19;

    v21 = v16->_timer;
    uint64_t v22 = MEMORY[0x1E4F14428];
    id v23 = MEMORY[0x1E4F14428];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __119__SBCaptureHardwareButtonScanningPowerLinkedTimer_initWithIdentifier_timeout_existingRequest_scanModeResource_handler___block_invoke;
    v25[3] = &unk_1E6B073B8;
    objc_copyWeak(&v27, &location);
    id v26 = v15;
    [(BSAbsoluteMachTimer *)v21 scheduleWithFireInterval:v22 leewayInterval:v25 queue:a4 handler:0.0];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __119__SBCaptureHardwareButtonScanningPowerLinkedTimer_initWithIdentifier_timeout_existingRequest_scanModeResource_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didTimeoutWithHandler:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"SBCaptureHardwareButtonAppActivator.m";
  __int16 v16 = 1024;
  int v17 = 126;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)invalidate
{
  if (!self->_invalid)
  {
    self->_invalid = 1;
    [(BSAbsoluteMachTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;

    [(BSInvalidatable *)self->_buttonPowerRequest invalidate];
    buttonPowerRequest = self->_buttonPowerRequest;
    self->_buttonPowerRequest = 0;
  }
}

- (BOOL)isScheduled
{
  return self->_timer != 0;
}

- (void)_didTimeoutWithHandler:(id)a3
{
  timer = self->_timer;
  v5 = (void (**)(id, SBCaptureHardwareButtonScanningPowerLinkedTimer *))a3;
  [(BSAbsoluteMachTimer *)timer invalidate];
  v6 = self->_timer;
  self->_timer = 0;

  v5[2](v5, self);
  [(BSInvalidatable *)self->_buttonPowerRequest invalidate];
  buttonPowerRequest = self->_buttonPowerRequest;
  self->_buttonPowerRequest = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonPowerRequest, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end