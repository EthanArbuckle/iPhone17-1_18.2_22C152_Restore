@interface _SBContinuitySessionStateMachineStateLaunching
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStateLaunching)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
- (id)invalidStateHandler;
- (id)stateTransitionHandler;
- (id)stateUpdateHandler;
- (void)_evaluateClientExternallyBlockedReasons;
- (void)_evaluateLockState;
- (void)_evaluateSystemEvents;
- (void)_reevaluateStateForReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)didHandleLaunchEvent:(id)a3;
- (void)didReceiveLaunchEvent:(id)a3;
- (void)enteredStateFrom:(unint64_t)a3;
- (void)exitedStateTo:(unint64_t)a3;
- (void)invalidate;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStateLaunching

- (_SBContinuitySessionStateMachineStateLaunching)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBContinuitySessionStateMachineStateLaunching;
  v9 = [(_SBContinuitySessionStateMachineStateLaunching *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemEventMonitor, a3);
    [v7 addObserver:v10];
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    handlingLaunchEvents = v10->_handlingLaunchEvents;
    v10->_handlingLaunchEvents = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_authenticationCoordinator, a4);
    [(SBContinuityDisplayAuthenticationCoordinator *)v10->_authenticationCoordinator addObserver:v10];
  }

  return v10;
}

- (void)didReceiveLaunchEvent:(id)a3
{
  handlingLaunchEvents = self->_handlingLaunchEvents;
  id v5 = a3;
  [(NSMutableArray *)handlingLaunchEvents addObject:v5];
  id v6 = [NSString stringWithFormat:@"did receive launch event %@", v5];

  [(_SBContinuitySessionStateMachineStateLaunching *)self _reevaluateStateForReason:v6];
}

- (void)didHandleLaunchEvent:(id)a3
{
  handlingLaunchEvents = self->_handlingLaunchEvents;
  id v5 = a3;
  [(NSMutableArray *)handlingLaunchEvents removeObject:v5];
  id v6 = [NSString stringWithFormat:@"did handle launch event %@", v5];

  [(_SBContinuitySessionStateMachineStateLaunching *)self _reevaluateStateForReason:v6];
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  self->_radar124642623 = [(NSMutableArray *)self->_handlingLaunchEvents count] == 0;
  [(_SBContinuitySessionStateMachineStateLaunching *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateLaunching *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateLaunching *)self _evaluateSystemEvents];
  id v5 = NSString;
  id v6 = NSStringFromSBContinuitySessionState(a3);
  id v7 = [v5 stringWithFormat:@"entered state from: %@", v6];
  [(_SBContinuitySessionStateMachineStateLaunching *)self _reevaluateStateForReason:v7];

  if (self->_radar124642623)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67___SBContinuitySessionStateMachineStateLaunching_enteredStateFrom___block_invoke;
    block[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
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
  id v5 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v6 overlayStyle:v5 block:v7];
}

- (void)_evaluateClientExternallyBlockedReasons
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
  if (!WeakRetained)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateLaunching.m" lineNumber:132 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];
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
      uint64_t v11 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);
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
  uint64_t v11 = SBLogContinuitySession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because UI blocked", buf, 2u);
  }

  uint64_t v12 = @"block.embedded-display.uiBlocked";
  if (!v4)
  {
LABEL_8:
    v13 = SBLogContinuitySession();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because UI unlocked", buf, 2u);
    }

    objc_super v14 = @"block.embedded-display.uiUnlocked";
    uint64_t v12 = v14;
  }
LABEL_11:
  if (v5)
  {
    v15 = SBLogContinuitySession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because in call", buf, 2u);
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
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because SOS active", buf, 2u);
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
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because lock screen search presented", buf, 2u);
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
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because airplay mirroring", buf, 2u);
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
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because using secure app", buf, 2u);
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
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because user-initiated remote transient overlay is presented", buf, 2u);
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
      [v29 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateLaunching.m" lineNumber:202 description:@"Must have invalid reason"];
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
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
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
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid keybag has been unexpectedly  locked", buf, 2u);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSMutableArray *)a3;
  if (self->_isCurrentState)
  {
    BOOL v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.Launching] Re-evaluating state for reason: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    BOOL v6 = [MEMORY[0x1E4F1CA80] set];
    if (self->_radar124642623)
    {
      BOOL v7 = SBLogContinuitySession();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.Launching] waiting on rdar://124642623", (uint8_t *)&v15, 2u);
      }

      [v6 addObject:@"rdar://124642623"];
    }
    if ([(NSMutableArray *)self->_handlingLaunchEvents count])
    {
      BOOL v8 = SBLogContinuitySession();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        handlingLaunchEvents = self->_handlingLaunchEvents;
        int v15 = 138543362;
        v16 = handlingLaunchEvents;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.Launching] still waiting on launch events: %{public}@", (uint8_t *)&v15, 0xCu);
      }

      [v6 addObject:@"checkpoint.handling-launch-event"];
    }
    uint64_t v10 = [v6 count];
    uint64_t v11 = SBLogContinuitySession();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v6, "bs_array");
        v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        int v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] still blocked by %{public}@", (uint8_t *)&v15, 0xCu);
      }
      objc_super v14 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .active", (uint8_t *)&v15, 2u);
      }

      objc_super v14 = (void (*)(void))*((void *)self->_stateTransitionHandler + 2);
    }
    v14();
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientExternallyBlockedReasonsProvider);
  objc_storeStrong(&self->_invalidStateHandler, 0);
  objc_storeStrong(&self->_stateTransitionHandler, 0);
  objc_storeStrong(&self->_stateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_handlingLaunchEvents, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end