@interface _SBContinuitySessionStateMachineStateActivating
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStateActivating)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
- (id)invalidStateHandler;
- (id)stateTransitionHandler;
- (id)stateUpdateHandler;
- (void)_evaluateClientExternallyBlockedReasons;
- (void)_evaluateLockState;
- (void)_evaluateSystemEvents;
- (void)_reevaluateStateForReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)enteredStateFrom:(unint64_t)a3;
- (void)exitedStateTo:(unint64_t)a3;
- (void)invalidate;
- (void)noteSystemApertureCurtainUIIsReady;
- (void)noteSystemApertureUIIsReady;
- (void)noteUIIsReady;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStateActivating

- (_SBContinuitySessionStateMachineStateActivating)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStateActivating;
  v9 = [(_SBContinuitySessionStateMachineStateActivating *)&v12 init];
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

- (void)noteUIIsReady
{
  self->_uiReady = 1;
  [(_SBContinuitySessionStateMachineStateActivating *)self _reevaluateStateForReason:@"ui ready"];
}

- (void)noteSystemApertureUIIsReady
{
  self->_systemApertureReady = 1;
  [(_SBContinuitySessionStateMachineStateActivating *)self _reevaluateStateForReason:@"system aperture ready"];
}

- (void)noteSystemApertureCurtainUIIsReady
{
  self->_systemApertureCurtainReady = 1;
  [(_SBContinuitySessionStateMachineStateActivating *)self _reevaluateStateForReason:@"system aperture curtain ready"];
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  [(_SBContinuitySessionStateMachineStateActivating *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateActivating *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateActivating *)self _evaluateSystemEvents];
  v5 = NSString;
  NSStringFromSBContinuitySessionState(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v5 stringWithFormat:@"entered state from: %@", v7];
  [(_SBContinuitySessionStateMachineStateActivating *)self _reevaluateStateForReason:v6];
}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
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
  v5 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77___SBContinuitySessionStateMachineStateActivating_appendDescriptionToStream___block_invoke;
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
    [v9 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateActivating.m" lineNumber:122 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];
  }
  v5 = [WeakRetained clientExternallyBlockedReasons];
  id v6 = v5;
  if (self->_isCurrentState && [v5 count])
  {
    id v7 = SBLogContinuitySession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(v6, "bs_array");
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    (*((void (**)(void))self->_invalidStateHandler + 2))();
  }
}

- (void)_evaluateSystemEvents
{
  if (!self->_isCurrentState) {
    return;
  }
  BOOL v3 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUIBlocked];
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUILocked];
  BOOL v5 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isInCall];
  BOOL v6 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isSOSActive];
  BOOL v7 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isLockScreenSearchPresented];
  BOOL v8 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUsingSecureApp];
  BOOL v9 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isAirplayMirroring];
  BOOL v10 = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUserInitiatedRemoteTransientOverlayPresented];
  BOOL v31 = v3;
  if (!v3)
  {
    uint64_t v12 = 0;
    if (v4) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v11 = SBLogContinuitySession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because UI blocked", buf, 2u);
  }

  uint64_t v12 = @"block.embedded-display.uiBlocked";
  if (!v4)
  {
LABEL_8:
    v13 = SBLogContinuitySession();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because UI unlocked", buf, 2u);
    }

    v14 = @"block.embedded-display.uiUnlocked";
    uint64_t v12 = v14;
  }
LABEL_11:
  if (v5)
  {
    v15 = SBLogContinuitySession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because in call", buf, 2u);
    }

    v16 = @"block.inCall";
    uint64_t v12 = v16;
    if (!v6)
    {
LABEL_13:
      if (!v7) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
  }
  else if (!v6)
  {
    goto LABEL_13;
  }
  v17 = SBLogContinuitySession();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because SOS active", buf, 2u);
  }

  v18 = @"block.sos.active";
  uint64_t v12 = v18;
  if (!v7)
  {
LABEL_14:
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_24:
  v19 = SBLogContinuitySession();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because lock screen search presented", buf, 2u);
  }

  v20 = @"block.lockScreen.searchPresented";
  uint64_t v12 = v20;
  if (!v8)
  {
LABEL_15:
    if (!v9) {
      goto LABEL_16;
    }
LABEL_30:
    v23 = SBLogContinuitySession();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because airplay mirroring", buf, 2u);
    }

    v24 = @"block.airplayMirroring";
    uint64_t v12 = v24;
    if (!v10) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
LABEL_27:
  v21 = SBLogContinuitySession();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because using secure app", buf, 2u);
  }

  v22 = @"block.embedded-display.secureAppUsage";
  uint64_t v12 = v22;
  if (v9) {
    goto LABEL_30;
  }
LABEL_16:
  if (v10)
  {
LABEL_33:
    v25 = SBLogContinuitySession();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because user-initiated remote transient overlay is presented", buf, 2u);
    }

    v26 = @"block.userInitiatedRemoteTransientOverlayPresented";
    uint64_t v12 = v26;
  }
LABEL_36:
  if (v31 || v5 || !v4 || v6 || v7 || v8 || v9 || v10)
  {
    if (!v12)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateActivating.m" lineNumber:192 description:@"Must have invalid reason"];
    }
    id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
    v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    invalidStateHandler[2](invalidStateHandler, v28);
  }
}

- (void)_evaluateLockState
{
  if (self->_isCurrentState)
  {
    unint64_t v3 = [(SBContinuityDisplayAuthenticationCoordinator *)self->_authenticationCoordinator lockState];
    if (v3 == 2)
    {
      if (!self->_isCurrentState) {
        return;
      }
      BOOL v8 = SBLogContinuitySession();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
      BOOL v7 = SBContinuityBlockKeybagUnlocked;
      goto LABEL_12;
    }
    if (!v3 && self->_isCurrentState)
    {
      BOOL v4 = SBLogContinuitySession();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid keybag has been unexpectedly  locked", buf, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
      BOOL v7 = SBContinuityBlockKeybagLocked;
LABEL_12:
      BOOL v9 = [v6 setWithObject:*v7];
      invalidStateHandler[2](invalidStateHandler, v9);
    }
  }
}

- (void)_reevaluateStateForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isCurrentState) {
    goto LABEL_24;
  }
  BOOL v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.Activating] Re-evaluating state for reason: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v6 = [MEMORY[0x1E4F1CA80] set];
  BOOL v7 = v6;
  if (!self->_uiReady) {
    [v6 addObject:@"checkpoint.waiting-for-ui-ready"];
  }
  uint64_t v8 = SBFEffectiveArtworkSubtype();
  if (v8 > 2795)
  {
    if (v8 != 2868 && v8 != 2796) {
      goto LABEL_16;
    }
LABEL_12:
    if (!self->_systemApertureReady) {
      [v7 addObject:@"checkpoint.waiting-for-system-aperture-ui-ready"];
    }
    if (!self->_systemApertureCurtainReady) {
      [v7 addObject:@"checkpoint.waiting-for-system-aperture-curtain-ui-ready"];
    }
    goto LABEL_16;
  }
  if (v8 == 2556 || v8 == 2622) {
    goto LABEL_12;
  }
LABEL_16:
  uint64_t v9 = [v7 count];
  BOOL v10 = SBLogContinuitySession();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = objc_msgSend(v7, "bs_array");
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.Activating] still blocked by %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v13 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
  }
  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .updatingActiveDisplay", (uint8_t *)&v14, 2u);
    }

    v13 = (void (*)(void))*((void *)self->_stateTransitionHandler + 2);
  }
  v13();

LABEL_24:
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