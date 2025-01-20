@interface SBSOSEventHandler
+ (SBSOSEventHandler)sharedInstance;
- (BOOL)_isRunning;
- (BOOL)isSOSActive;
- (SBBacklightController)_backlightController;
- (SBFUserAuthenticationController)_authenticationController;
- (SBLockScreenManager)_lockScreenManager;
- (SBSOSEventHandler)init;
- (SOSManager)_sosManager;
- (id)addObserver:(id)a3;
- (void)_forceBioAuthenticationLockoutIfAvailableWithSource:(int)a3 showingPasscode:(BOOL)a4;
- (void)_setRunning:(BOOL)a3;
- (void)dealloc;
- (void)didDismissSOSBeforeSOSCall:(int64_t)a3;
- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3;
- (void)invalidate;
- (void)run;
@end

@implementation SBSOSEventHandler

- (BOOL)isSOSActive
{
  v3 = [(SBSOSEventHandler *)self _sosManager];

  if (!v3) {
    return 0;
  }
  v4 = [(SBSOSEventHandler *)self _sosManager];
  uint64_t v5 = [v4 currentSOSInitiationState];

  return v5 == 1;
}

- (SOSManager)_sosManager
{
  override_sosManager = self->_override_sosManager;
  if (override_sosManager)
  {
    v3 = override_sosManager;
  }
  else
  {
    v3 = [MEMORY[0x1E4F97B88] sharedInstance];
  }
  return v3;
}

+ (SBSOSEventHandler)sharedInstance
{
  if (sharedInstance_onceToken_43 != -1) {
    dispatch_once(&sharedInstance_onceToken_43, &__block_literal_global_291);
  }
  v2 = (void *)sharedInstance_eventHandler;
  return (SBSOSEventHandler *)v2;
}

void __35__SBSOSEventHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBSOSEventHandler);
  v1 = (void *)sharedInstance_eventHandler;
  sharedInstance_eventHandler = (uint64_t)v0;
}

- (SBSOSEventHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSOSEventHandler;
  result = [(SBSOSEventHandler *)&v3 init];
  if (result) {
    *(_WORD *)&result->_isValid = 1;
  }
  return result;
}

- (void)invalidate
{
  if (self->_isValid)
  {
    self->_isValid = 0;
    [(BSCompoundAssertion *)self->_observers invalidate];
    id v3 = [(SBSOSEventHandler *)self _sosManager];
    [v3 removeObserver:self];
  }
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSOSEventHandler.m";
  __int16 v16 = 1024;
  int v17 = 73;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)run
{
  if (![(SBSOSEventHandler *)self _isRunning])
  {
    id v3 = [(SBSOSEventHandler *)self _sosManager];
    [v3 addObserver:self queue:MEMORY[0x1E4F14428]];

    [(SBSOSEventHandler *)self _setRunning:1];
  }
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SOSEventObservers"];
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  int v8 = [(id)objc_opt_class() description];
  v9 = [(BSCompoundAssertion *)observers acquireForReason:v8 withContext:v4];

  return v9;
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
}

void __56__SBSOSEventHandler_didUpdateCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isSOSActive];
  id v3 = SBLogButtonsCombo();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v6;
    v7 = "%{public}@ - SOS UI initiation state changed. SOS active";
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    int v8 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v6;
    v7 = "%{public}@ - SOS UI initiation state changed. SOS inactive";
  }
  _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

LABEL_7:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "orderedContext", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) SOSEventHandlerStateDidChange:*(void *)(a1 + 32)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
}

void __48__SBSOSEventHandler_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = SBLogButtonsCombo();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    BOOL v4 = NSStringFromClass(v3);
    int v10 = 138543362;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS dismissed", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    if (v5 != 1) {
      return;
    }
    v6 = [*(id *)(a1 + 32) _backlightController];
    [v6 setBacklightState:3 source:3];

    v7 = *(void **)(a1 + 32);
    uint64_t v8 = 1;
    uint64_t v9 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = 22;
    uint64_t v9 = 1;
  }
  [v7 _forceBioAuthenticationLockoutIfAvailableWithSource:v8 showingPasscode:v9];
}

- (void)_forceBioAuthenticationLockoutIfAvailableWithSource:(int)a3 showingPasscode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v13[3] = *MEMORY[0x1E4F143B8];
  v6 = [(id)SBApp authenticationController];
  int v7 = [v6 hasPasscodeSet];

  if ((v7 & v4) != 0) {
    uint64_t v8 = &__block_literal_global_14_2;
  }
  else {
    uint64_t v8 = 0;
  }
  v12[0] = @"SBUILockOptionsForceBioLockoutKey";
  v12[1] = @"SBUILockOptionsForceLockKey";
  v13[0] = MEMORY[0x1E4F1CC38];
  v13[1] = MEMORY[0x1E4F1CC38];
  v12[2] = @"SBUILockOptionsUseScreenOffModeKey";
  uint64_t v9 = [NSNumber numberWithInt:!v4];
  v13[2] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  uint64_t v11 = +[SBLockScreenManager sharedInstance];
  [v11 lockUIFromSource:v5 withOptions:v10 completion:v8];
}

void __89__SBSOSEventHandler__forceBioAuthenticationLockoutIfAvailableWithSource_showingPasscode___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_16_1);
  }
}

void __89__SBSOSEventHandler__forceBioAuthenticationLockoutIfAvailableWithSource_showingPasscode___block_invoke_2()
{
  id v0 = +[SBLockScreenManager sharedInstance];
  [v0 setPasscodeVisible:1 animated:1];
}

- (SBFUserAuthenticationController)_authenticationController
{
  override_authenticationController = self->_override_authenticationController;
  if (override_authenticationController)
  {
    id v3 = override_authenticationController;
  }
  else
  {
    id v3 = [(id)SBApp authenticationController];
  }
  return v3;
}

- (SBBacklightController)_backlightController
{
  override_backlightController = self->_override_backlightController;
  if (override_backlightController)
  {
    id v3 = override_backlightController;
  }
  else
  {
    id v3 = +[SBBacklightController sharedInstance];
  }
  return v3;
}

- (SBLockScreenManager)_lockScreenManager
{
  override_lockscreenManager = self->_override_lockscreenManager;
  if (override_lockscreenManager)
  {
    id v3 = override_lockscreenManager;
  }
  else
  {
    id v3 = +[SBLockScreenManager sharedInstance];
  }
  return v3;
}

- (BOOL)_isRunning
{
  return self->_running;
}

- (void)_setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_override_sosManager, 0);
  objc_storeStrong((id *)&self->_override_lockscreenManager, 0);
  objc_storeStrong((id *)&self->_override_backlightController, 0);
  objc_storeStrong((id *)&self->_override_authenticationController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_coversheetObserverToken, 0);
}

@end