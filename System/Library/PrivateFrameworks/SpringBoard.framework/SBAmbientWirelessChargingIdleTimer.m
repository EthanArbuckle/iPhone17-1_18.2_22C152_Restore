@interface SBAmbientWirelessChargingIdleTimer
- (BOOL)_ambientPresented;
- (BOOL)_isAttentionClientActive;
- (BOOL)isEnabled;
- (SBAmbientWirelessChargingIdleTimer)initWithAmbientPresentationController:(id)a3 screenSleepCoordinator:(id)a4 uiController:(id)a5;
- (id)_backlightController;
- (id)succinctDescription;
- (void)_handleAttentionLost:(id)a3;
- (void)_noteQiPowerStatusChanged;
- (void)_noteSpringBoardBootComplete;
- (void)_reconfigureAttentionClient;
- (void)_setAmbientPresented:(BOOL)a3;
- (void)_setAttentionClientActive:(BOOL)a3;
- (void)_updateIdleTimerEnablement;
- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SBAmbientWirelessChargingIdleTimer

- (SBAmbientWirelessChargingIdleTimer)initWithAmbientPresentationController:(id)a3 screenSleepCoordinator:(id)a4 uiController:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SBAmbientWirelessChargingIdleTimer;
  v11 = [(SBAmbientWirelessChargingIdleTimer *)&v30 init];
  if (v11)
  {
    v12 = +[SBDefaults localDefaults];
    uint64_t v13 = [v12 ambientDefaults];
    ambientTestingDefaults = v11->_ambientTestingDefaults;
    v11->_ambientTestingDefaults = (SBAmbientDefaults *)v13;

    [v8 addObserver:v11];
    -[SBAmbientWirelessChargingIdleTimer _setAmbientPresented:](v11, "_setAmbientPresented:", [v8 isPresented]);
    objc_storeStrong((id *)&v11->_screenSleepCoordinator, a4);
    objc_storeStrong((id *)&v11->_uiController, a5);
    v15 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x1E4F4E700]);
    attentionClient = v11->_attentionClient;
    v11->_attentionClient = v15;

    [(SBAmbientWirelessChargingIdleTimer *)v11 _reconfigureAttentionClient];
    objc_initWeak(&location, v11);
    v17 = v11->_ambientTestingDefaults;
    v18 = [NSString stringWithUTF8String:"qiChargingIdleTimerDuration"];
    v31[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v20 = MEMORY[0x1E4F14428];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke;
    v27[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v28, &location);
    id v21 = (id)[(SBAmbientDefaults *)v17 observeDefaults:v19 onQueue:MEMORY[0x1E4F14428] withBlock:v27];

    v22 = v11->_attentionClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke_2;
    v25[3] = &unk_1E6AF9328;
    objc_copyWeak(&v26, &location);
    [(AWAttentionAwarenessClient *)v22 setEventHandlerWithQueue:MEMORY[0x1E4F14428] block:v25];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v11 selector:sel__noteSpringBoardBootComplete name:@"SBBootCompleteNotification" object:0];
    [v23 addObserver:v11 selector:sel__noteQiPowerStatusChanged name:@"SBUIQiPowerStatusChangedNotification" object:0];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reconfigureAttentionClient];
}

void __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 eventMask])
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v8;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _handleAttentionLost:v6];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(SBAmbientWirelessChargingIdleTimer *)self _updateIdleTimerEnablement];
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    id v9 = SBBacklightStateDescription(a4);
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: backlight state changed to %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(SBAmbientWirelessChargingIdleTimer *)self _updateIdleTimerEnablement];
}

- (void)_noteSpringBoardBootComplete
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: got notification that SpringBoard boot completed", (uint8_t *)&v5, 0xCu);
  }
  [(SBAmbientWirelessChargingIdleTimer *)self _updateIdleTimerEnablement];
}

- (void)_noteQiPowerStatusChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: got notification that Qi power status changed", (uint8_t *)&v5, 0xCu);
  }
  [(SBAmbientWirelessChargingIdleTimer *)self _updateIdleTimerEnablement];
}

- (id)_backlightController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  lazy_backlightController = self->_lazy_backlightController;
  if (!lazy_backlightController)
  {
    id v4 = +[SBBacklightController sharedInstanceIfExists];
    int v5 = self->_lazy_backlightController;
    self->_lazy_backlightController = v4;

    [(SBBacklightController *)self->_lazy_backlightController addObserver:self];
    if (self->_lazy_backlightController)
    {
      id v6 = SBLogAmbientDeviceState();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
        int v9 = 138543362;
        int v10 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: got backlight controller instance", (uint8_t *)&v9, 0xCu);
      }
      lazy_backlightController = self->_lazy_backlightController;
    }
    else
    {
      lazy_backlightController = 0;
    }
  }
  return lazy_backlightController;
}

- (void)_setAmbientPresented:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_ambientPresented != a3)
  {
    BOOL v3 = a3;
    self->_ambientPresented = a3;
    int v5 = SBLogAmbientDeviceState();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
      int v7 = 138543618;
      id v8 = v6;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: ambientPresented=%{BOOL}u", (uint8_t *)&v7, 0x12u);
    }
    [(SBAmbientWirelessChargingIdleTimer *)self _updateIdleTimerEnablement];
  }
}

- (void)_updateIdleTimerEnablement
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBUIController *)self->_uiController isConnectedToQiPower];
  id v4 = [(SBAmbientWirelessChargingIdleTimer *)self _backlightController];
  int v5 = [v4 screenIsOn];

  BOOL v8 = self->_ambientPresented && v5 != 0 && v3 && self->_enabled;
  __int16 v9 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    BOOL enabled = self->_enabled;
    BOOL ambientPresented = self->_ambientPresented;
    int v13 = 138544642;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    BOOL v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = enabled;
    __int16 v19 = 1024;
    BOOL v20 = v3;
    __int16 v21 = 1024;
    int v22 = v5;
    __int16 v23 = 1024;
    BOOL v24 = ambientPresented;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Wireless charging idle timer requested = %{BOOL}d [ enabled:%{BOOL}d ; isOnQiPower:%{BOOL}d ; screenIs"
      "On:%{BOOL}d ; ambientPresented:%{BOOL}d ]",
      (uint8_t *)&v13,
      0x2Au);
  }
  [(SBAmbientWirelessChargingIdleTimer *)self _setAttentionClientActive:v8];
}

- (void)_setAttentionClientActive:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_attentionClientActive != a3)
  {
    BOOL v3 = a3;
    self->_attentionClientActive = a3;
    int v5 = SBLogAmbientDeviceState();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        int v7 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
        int v9 = 138543362;
        BOOL v10 = v7;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resuming attention client", (uint8_t *)&v9, 0xCu);
      }
      [(AWAttentionAwarenessClient *)self->_attentionClient resumeWithError:0];
    }
    else
    {
      if (v6)
      {
        BOOL v8 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
        int v9 = 138543362;
        BOOL v10 = v8;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Suspending attention client", (uint8_t *)&v9, 0xCu);
      }
      [(AWAttentionAwarenessClient *)self->_attentionClient suspendWithError:0];
    }
  }
}

- (id)succinctDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (void)_reconfigureAttentionClient
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F4E708]);
  [v3 setIdentifier:@"com.apple.SpringBoard.AmbientWirelessCharging"];
  [v3 setEventMask:3967];
  [v3 setAttentionLostEventMask:0];
  [(SBAmbientDefaults *)self->_ambientTestingDefaults qiChargingIdleTimerDuration];
  objc_msgSend(v3, "setAttentionLostTimeout:");
  id v4 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    int v6 = 138543618;
    int v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating attention client with configuration %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(AWAttentionAwarenessClient *)self->_attentionClient setConfiguration:v3];
}

- (void)_handleAttentionLost:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogAmbientDeviceState();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
    BOOL attentionClientActive = self->_attentionClientActive;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = attentionClientActive;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Attention lost. _BOOL attentionClientActive = %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }
  if (self->_attentionClientActive)
  {
    int v7 = SBLogAmbientDeviceState();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [(SBAmbientWirelessChargingIdleTimer *)self succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Turning screen off for inactivity while on Qi charger", (uint8_t *)&v9, 0xCu);
    }
    [(SBScreenSleepCoordinator *)self->_screenSleepCoordinator sleepAndLockUIFromSource:13 completion:0];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)_ambientPresented
{
  return self->_ambientPresented;
}

- (BOOL)_isAttentionClientActive
{
  return self->_attentionClientActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientTestingDefaults, 0);
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_lazy_backlightController, 0);
  objc_storeStrong((id *)&self->_screenSleepCoordinator, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
}

@end