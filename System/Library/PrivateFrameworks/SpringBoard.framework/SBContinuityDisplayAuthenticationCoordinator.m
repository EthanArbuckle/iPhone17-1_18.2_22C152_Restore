@interface SBContinuityDisplayAuthenticationCoordinator
+ (SBContinuityDisplayAuthenticationCoordinator)sharedInstance;
- (BOOL)_isSessionActive;
- (SBContinuityDisplayAuthenticationCoordinator)init;
- (SBContinuityDisplayAuthenticationCoordinator)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4;
- (double)heartbeatInterval;
- (id)acquireContinuityDisplayActiveAssertionForReason:(id)a3;
- (unint64_t)lockState;
- (void)_handleAuthenticationHeartbeatTimer;
- (void)_handleKeyBagStateChange;
- (void)_setSessionActive:(BOOL)a3;
- (void)_updateSessionState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setHeartbeatInterval:(double)a3;
@end

@implementation SBContinuityDisplayAuthenticationCoordinator

+ (SBContinuityDisplayAuthenticationCoordinator)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return (SBContinuityDisplayAuthenticationCoordinator *)v2;
}

void __62__SBContinuityDisplayAuthenticationCoordinator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBContinuityDisplayAuthenticationCoordinator);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
}

- (SBContinuityDisplayAuthenticationCoordinator)init
{
  v3 = +[SBLockScreenManager sharedInstance];
  v4 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v5 = [(SBContinuityDisplayAuthenticationCoordinator *)self initWithLockScreenManager:v3 mobileKeyBag:v4];

  return v5;
}

- (SBContinuityDisplayAuthenticationCoordinator)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBContinuityDisplayAuthenticationCoordinator;
  v9 = [(SBContinuityDisplayAuthenticationCoordinator *)&v26 init];
  if (v9)
  {
    objc_initWeak(&location, v9);
    objc_storeStrong((id *)&v9->_mobileKeyBag, a4);
    [(SBFMobileKeyBag *)v9->_mobileKeyBag addObserver:v9];
    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    v9->_invalidated = 0;
    v9->_sessionActive = 0;
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    v9->_previousLockState = [(SBContinuityDisplayAuthenticationCoordinator *)v9 lockState];
    v12 = (void *)MEMORY[0x1E4F4F6E8];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __87__SBContinuityDisplayAuthenticationCoordinator_initWithLockScreenManager_mobileKeyBag___block_invoke;
    v23 = &unk_1E6AF92D8;
    objc_copyWeak(&v24, &location);
    uint64_t v15 = [v12 assertionWithIdentifier:v14 stateDidChangeHandler:&v20];
    continuityDisplaySessionAssertions = v9->_continuityDisplaySessionAssertions;
    v9->_continuityDisplaySessionAssertions = (BSCompoundAssertion *)v15;

    v17 = v9->_continuityDisplaySessionAssertions;
    v18 = SBLogContinuityDisplay();
    -[BSCompoundAssertion setLog:](v17, "setLog:", v18, v20, v21, v22, v23);

    [(SBContinuityDisplayAuthenticationCoordinator *)v9 setHeartbeatInterval:30.0];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __87__SBContinuityDisplayAuthenticationCoordinator_initWithLockScreenManager_mobileKeyBag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSessionState];
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayAuthenticationCoordinator.m" lineNumber:72 description:@"Must be invalidated before -dealloc"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBContinuityDisplayAuthenticationCoordinator;
  [(SBContinuityDisplayAuthenticationCoordinator *)&v5 dealloc];
}

- (id)acquireContinuityDisplayActiveAssertionForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_continuityDisplaySessionAssertions acquireForReason:a3];
}

- (unint64_t)lockState
{
  int v3 = [(SBFMobileKeyBag *)self->_mobileKeyBag isContinuityUnlocked];
  v4 = [(SBFMobileKeyBag *)self->_mobileKeyBag extendedState];
  int v5 = [v4 isEffectivelyLocked];

  unint64_t v6 = 2;
  if (v5) {
    unint64_t v6 = 0;
  }
  if (v3) {
    return 1;
  }
  else {
    return v6;
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBContinuityDisplayAuthenticationCoordinator.m", 96, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = self->_observers;
    self->_observers = v7;

    id v5 = v10;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v5];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBContinuityDisplayAuthenticationCoordinator.m", 104, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_observers removeObject:v5];
}

- (void)invalidate
{
  self->_invalidated = 1;
  [(BSCompoundAssertion *)self->_continuityDisplaySessionAssertions invalidate];
  [(SBContinuityDisplayAuthenticationCoordinator *)self _setSessionActive:0];
  mobileKeyBag = self->_mobileKeyBag;
  [(SBFMobileKeyBag *)mobileKeyBag removeObserver:self];
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
}

uint64_t __78__SBContinuityDisplayAuthenticationCoordinator_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyBagStateChange];
}

- (void)_updateSessionState
{
  if ([(BSCompoundAssertion *)self->_continuityDisplaySessionAssertions isActive]) {
    BOOL v3 = !self->_invalidated;
  }
  else {
    BOOL v3 = 0;
  }
  [(SBContinuityDisplayAuthenticationCoordinator *)self _setSessionActive:v3];
}

- (void)_handleAuthenticationHeartbeatTimer
{
}

- (void)_setSessionActive:(BOOL)a3
{
  if (self->_sessionActive != a3)
  {
    self->_sessionActive = a3;
    if (a3)
    {
      objc_initWeak(location, self);
      [(SBContinuityDisplayAuthenticationCoordinator *)self heartbeatInterval];
      double v5 = v4;
      [(BSContinuousMachTimer *)self->_heartbeatTimer invalidate];
      id v6 = objc_alloc(MEMORY[0x1E4F4F6F0]);
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = (BSContinuousMachTimer *)[v6 initWithIdentifier:v8];
      heartbeatTimer = self->_heartbeatTimer;
      self->_heartbeatTimer = v9;

      v11 = self->_heartbeatTimer;
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__SBContinuityDisplayAuthenticationCoordinator__setSessionActive___block_invoke;
      v20[3] = &unk_1E6AF4990;
      objc_copyWeak(&v21, location);
      [(BSContinuousMachTimer *)v11 scheduleRepeatingWithFireInterval:v12 repeatInterval:v20 leewayInterval:v5 queue:v5 handler:v5 * 0.25];

      [(SBLockScreenManager *)self->_lockScreenManager setBiometricAutoUnlockingDisabled:1 forReason:@"SBContinuityDisplayAuthenticationCoordinator"];
      v14 = [(SBFMobileKeyBag *)self->_mobileKeyBag extendedState];
      uint64_t v15 = [v14 lockState];

      if (v15 != 2)
      {
        v16 = SBLogContinuityDisplay();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Session changed to active but we're not fully locked. Locking key bag", v19, 2u);
        }

        [(SBFMobileKeyBag *)self->_mobileKeyBag lockSkippingGracePeriod:1 endingContinuityUnlock:1];
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    else
    {
      [(BSContinuousMachTimer *)self->_heartbeatTimer invalidate];
      v17 = self->_heartbeatTimer;
      self->_heartbeatTimer = 0;

      [(SBLockScreenManager *)self->_lockScreenManager setBiometricAutoUnlockingDisabled:0 forReason:@"SBContinuityDisplayAuthenticationCoordinator"];
      if ([(SBContinuityDisplayAuthenticationCoordinator *)self lockState] == 1)
      {
        v18 = SBLogContinuityDisplay();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Session changed to inactive while in continuity unlock. Locking key bag", (uint8_t *)location, 2u);
        }

        [(SBFMobileKeyBag *)self->_mobileKeyBag lockSkippingGracePeriod:0 endingContinuityUnlock:1];
      }
    }
  }
}

void __66__SBContinuityDisplayAuthenticationCoordinator__setSessionActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAuthenticationHeartbeatTimer];
}

- (void)_handleKeyBagStateChange
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Key bag continuity unlocked but we don't have an active session, relocking immediately!!", v1, 2u);
}

- (BOOL)_isSessionActive
{
  return self->_sessionActive;
}

- (double)heartbeatInterval
{
  return self->_heartbeatInterval;
}

- (void)setHeartbeatInterval:(double)a3
{
  self->_heartbeatInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_continuityDisplaySessionAssertions, 0);
}

@end