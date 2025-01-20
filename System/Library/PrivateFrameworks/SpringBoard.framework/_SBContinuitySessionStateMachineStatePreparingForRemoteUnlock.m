@interface _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock
- (BOOL)isAutomaticBiomtericsDisabled;
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
- (id)invalidStateHandler;
- (id)stateTransitionHandler;
- (id)stateUpdateHandler;
- (void)_evaluateClientExternallyBlockedReasons;
- (void)_evaluateLockState;
- (void)_evaluateSystemEvents;
- (void)_reevaluateStateForReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(id)a3;
- (void)enteredStateFrom:(unint64_t)a3;
- (void)exitedStateTo:(unint64_t)a3;
- (void)invalidate;
- (void)setAutomaticBiometricsDisabled:(BOOL)a3;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock

- (_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock;
  v9 = [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemEventMonitor, a3);
    [v7 addObserver:v10];
    objc_storeStrong((id *)&v10->_authenticationCoordinator, a4);
    [(SBContinuityDisplayAuthenticationCoordinator *)v10->_authenticationCoordinator addObserver:v10];
  }

  return v10;
}

- (void)setAutomaticBiometricsDisabled:(BOOL)a3
{
  if (self->_automaticBiometricsDisabled != a3)
  {
    self->_automaticBiometricsDisabled = a3;
    v4 = @"enabled";
    if (a3) {
      v4 = @"disabled";
    }
    id v5 = [NSString stringWithFormat:@"automatic biometrics %@", v4];
    [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _reevaluateStateForReason:v5];
  }
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _evaluateSystemEvents];
  id v5 = NSString;
  NSStringFromSBContinuitySessionState(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v5 stringWithFormat:@"entered state from: %@", v7];
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _reevaluateStateForReason:v6];
}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
}

- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(id)a3
{
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self _reevaluateStateForReason:@"lock state change"];
}

- (void)invalidate
{
  id stateTransitionHandler = self->_stateTransitionHandler;
  self->_id stateTransitionHandler = 0;

  id stateUpdateHandler = self->_stateUpdateHandler;
  self->_id stateUpdateHandler = 0;

  id invalidStateHandler = self->_invalidStateHandler;
  self->_id invalidStateHandler = 0;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91___SBContinuitySessionStateMachineStatePreparingForRemoteUnlock_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v6 overlayStyle:v5 block:v7];
}

- (void)_evaluateClientExternallyBlockedReasons
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
  if (!WeakRetained)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock.m" lineNumber:116 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];
  }
  id v5 = [WeakRetained clientExternallyBlockedReasons];
  id v6 = v5;
  if (self->_isCurrentState && [v5 count])
  {
    id v7 = SBLogContinuitySession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(v6, "bs_array");
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    (*((void (**)(void))self->_stateTransitionHandler + 2))();
  }
}

- (void)_evaluateSystemEvents
{
  if (self->_isCurrentState)
  {
    BOOL v3 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUIBlocked];
    BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUILocked];
    BOOL v5 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isInCall];
    BOOL v6 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isSOSActive];
    BOOL v7 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isLockScreenSearchPresented];
    BOOL v8 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUsingSecureApp];
    BOOL v9 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isAirplayMirroring];
    BOOL v10 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUserInitiatedRemoteTransientOverlayPresented];
    if (v3)
    {
      v11 = SBLogContinuitySession();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because UI blocked", v19, 2u);
      }

      if (v4)
      {
LABEL_4:
        if (!v5) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    else if (v4)
    {
      goto LABEL_4;
    }
    uint64_t v12 = SBLogContinuitySession();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because UI unlocked", v19, 2u);
    }

    if (!v5)
    {
LABEL_5:
      if (!v6) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
LABEL_17:
    v13 = SBLogContinuitySession();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because in call", v19, 2u);
    }

    if (!v6)
    {
LABEL_6:
      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
LABEL_20:
    v14 = SBLogContinuitySession();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because sos active", v19, 2u);
    }

    if (!v7)
    {
LABEL_7:
      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
LABEL_23:
    v15 = SBLogContinuitySession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because lock screen search presented", v19, 2u);
    }

    if (!v8)
    {
LABEL_8:
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_29;
    }
LABEL_26:
    v16 = SBLogContinuitySession();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because using secure app", v19, 2u);
    }

    if (!v9)
    {
LABEL_9:
      if (!v10)
      {
LABEL_35:
        if (v3 || v5 || !v4 || v6 || v7 || v8 || v9 || v10) {
          (*((void (**)(void))self->_stateTransitionHandler + 2))();
        }
        return;
      }
LABEL_32:
      v18 = SBLogContinuitySession();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because user-initiated remote alert is presented", v19, 2u);
      }

      goto LABEL_35;
    }
LABEL_29:
    v17 = SBLogContinuitySession();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because AirPlay mirroring", v19, 2u);
    }

    if (!v10) {
      goto LABEL_35;
    }
    goto LABEL_32;
  }
}

- (void)_evaluateLockState
{
  if (self->_isCurrentState)
  {
    unint64_t v3 = [(SBContinuityDisplayAuthenticationCoordinator *)self->_authenticationCoordinator lockState];
    switch(v3)
    {
      case 2uLL:
        self->_keybagLocked = 0;
        break;
      case 1uLL:
        BOOL v4 = SBLogContinuitySession();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v7 = 0;
          _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .invalid keybag has been unexpectedly remote unlocked", v7, 2u);
        }

        id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
        BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@".preparing + remote unlocked"];
        invalidStateHandler[2](invalidStateHandler, v6);

        break;
      case 0uLL:
        self->_keybagLocked = 1;
        break;
    }
  }
}

- (void)_reevaluateStateForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isCurrentState)
  {
    BOOL v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] Re-evaluating state for reason: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    BOOL v6 = [MEMORY[0x1E4F1CA80] set];
    BOOL v7 = v6;
    if (!self->_keybagLocked) {
      [v6 addObject:@"checkpoint.waiting-for-keybag-locked"];
    }
    if (!self->_automaticBiometricsDisabled) {
      [v7 addObject:@"checkpoint.waiting-for-automatic-biometrics-to-be-disabled"];
    }
    uint64_t v8 = [v7 count];
    BOOL v9 = SBLogContinuitySession();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = objc_msgSend(v7, "bs_array");
        int v13 = 138543362;
        id v14 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] still blocked by %{public}@", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v12 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .ready", (uint8_t *)&v13, 2u);
      }

      uint64_t v12 = (void (*)(void))*((void *)self->_stateTransitionHandler + 2);
    }
    v12();
  }
}

- (id)stateUpdateHandler
{
  return self->_stateUpdateHandler;
}

- (void)setStateUpdateHandler:(id)a3
{
}

- (id)stateTransitionHandler
{
  return self->_stateTransitionHandler;
}

- (void)setStateTransitionHandler:(id)a3
{
}

- (id)invalidStateHandler
{
  return self->_invalidStateHandler;
}

- (void)setInvalidStateHandler:(id)a3
{
}

- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
  return (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider *)WeakRetained;
}

- (void)setClientExternallyBlockedReasonsProvider:(id)a3
{
}

- (BOOL)isAutomaticBiomtericsDisabled
{
  return self->_automaticBiometricsDisabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientExternallyBlockedReasonsProvider);
  objc_storeStrong(&self->_invalidStateHandler, 0);
  objc_storeStrong(&self->_stateTransitionHandler, 0);
  objc_storeStrong(&self->_stateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end