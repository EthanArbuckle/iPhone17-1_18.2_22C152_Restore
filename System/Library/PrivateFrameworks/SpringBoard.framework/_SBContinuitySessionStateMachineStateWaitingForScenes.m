@interface _SBContinuitySessionStateMachineStateWaitingForScenes
- (BOOL)isMainSceneConnected;
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStateWaitingForScenes)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
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
- (void)noteClientDidUpdateExternallyBlockedReasons;
- (void)noteMainSceneConnected;
- (void)noteSceneHasValidDisplayUUID;
- (void)noteSystemApertureCurtainSceneConnected;
- (void)noteSystemApertureSceneConnected;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStateWaitingForScenes

- (_SBContinuitySessionStateMachineStateWaitingForScenes)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStateWaitingForScenes;
  v9 = [(_SBContinuitySessionStateMachineStateWaitingForScenes *)&v12 init];
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

- (BOOL)isMainSceneConnected
{
  return self->_mainSceneConnected;
}

- (void)noteMainSceneConnected
{
  self->_mainSceneConnected = 1;
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"main scene connected"];
}

- (void)noteSystemApertureSceneConnected
{
  self->_systemApertureSceneConnected = 1;
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"system aperture scene connected"];
}

- (void)noteSystemApertureCurtainSceneConnected
{
  self->_systemApertureCurtainSceneConnected = 1;
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"system aperture curtain scene connected"];
}

- (void)noteSceneHasValidDisplayUUID
{
  self->_validDisplayUUID = 1;
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"valid display UUID"];
}

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"client updated externally blocked reasons"];
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _evaluateSystemEvents];
  v5 = NSString;
  NSStringFromSBContinuitySessionState(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v5 stringWithFormat:@"entered state from: %@", v7];
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:v6];
}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
}

- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(id)a3
{
  id v4 = a3;
  v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SBContinuitySessionStateMachineStateWaitingForScenes continuityDisplayAuthenticationCoordinatorDidUpdateLockState:](v4, v5);
  }

  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self _reevaluateStateForReason:@"lock state change"];
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
  v7[2] = __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke;
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
    [v9 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateWaitingForScenes.m" lineNumber:144 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];
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
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    (*((void (**)(void))self->_invalidStateHandler + 2))();
  }
}

- (void)_evaluateSystemEvents
{
  if (self->_isCurrentState)
  {
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUIBlocked])
    {
      v3 = SBLogContinuitySession();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because UI blocked ", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockUIBlocked;
LABEL_14:
      v9 = [v5 setWithObject:*v6];
      invalidStateHandler[2](invalidStateHandler, v9);

      return;
    }
    if (![(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUILocked])
    {
      id v8 = SBLogContinuitySession();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because UI unlocked", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockUIUnlocked;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isInCall])
    {
      id v7 = SBLogContinuitySession();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because in call", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockInCall;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isSOSActive])
    {
      int v10 = SBLogContinuitySession();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because SOS active", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockSOSActive;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isLockScreenSearchPresented])
    {
      v11 = SBLogContinuitySession();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because lock screen search presented", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockLockScreenSearchPresented;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUsingSecureApp])
    {
      uint64_t v12 = SBLogContinuitySession();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because using secure app", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockSecureAppUsage;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isAirplayMirroring])
    {
      v13 = SBLogContinuitySession();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because airplay mirroring", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockAirplayMirroring;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUserInitiatedRemoteTransientOverlayPresented])
    {
      v14 = SBLogContinuitySession();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid because user-initiated remote transient overlay is presented", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockUserInitiatedRemoteTransientOverlayPresented;
      goto LABEL_14;
    }
  }
}

- (void)_evaluateLockState
{
  if (self->_isCurrentState)
  {
    unint64_t v3 = [(SBContinuityDisplayAuthenticationCoordinator *)self->_authenticationCoordinator lockState];
    if (v3 == 2)
    {
      id v8 = SBLogContinuitySession();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      id v6 = (void *)MEMORY[0x1E4F1CAD0];
      id v7 = SBContinuityBlockKeybagUnlocked;
    }
    else
    {
      if (v3) {
        return;
      }
      id v4 = SBLogContinuitySession();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .invalid keybag has been unexpectedly locked", buf, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      id v6 = (void *)MEMORY[0x1E4F1CAD0];
      id v7 = SBContinuityBlockKeybagLocked;
    }
    v9 = [v6 setWithObject:*v7];
    invalidStateHandler[2](invalidStateHandler, v9);
  }
}

- (void)_reevaluateStateForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isCurrentState) {
    goto LABEL_26;
  }
  v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] Re-evaluating state for reason: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = v6;
  if (!self->_mainSceneConnected) {
    [v6 addObject:@"checkpoint.waiting-for-main-scene-connected"];
  }
  uint64_t v8 = SBFEffectiveArtworkSubtype();
  if (v8 > 2795)
  {
    if (v8 != 2868 && v8 != 2796) {
      goto LABEL_16;
    }
LABEL_12:
    if (!self->_systemApertureSceneConnected) {
      [v7 addObject:@"checkpoint.waiting-for-system-aperture-scene-connected"];
    }
    if (!self->_systemApertureCurtainSceneConnected) {
      [v7 addObject:@"checkpoint.waiting-for-system-aperture-curtain-scene-connected"];
    }
    goto LABEL_16;
  }
  if (v8 == 2556 || v8 == 2622) {
    goto LABEL_12;
  }
LABEL_16:
  if (!self->_validDisplayUUID) {
    [v7 addObject:@"checkpoint.waiting-for-display-hardware-Identifier"];
  }
  uint64_t v9 = [v7 count];
  int v10 = SBLogContinuitySession();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = objc_msgSend(v7, "bs_array");
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] still blocked by %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v13 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
  }
  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.WaitingForScenes] --> moving to .waitingForHIDServices", (uint8_t *)&v14, 2u);
    }

    v13 = (void (*)(void))*((void *)self->_stateTransitionHandler + 2);
  }
  v13();

LABEL_26:
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

- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 lockState];
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[State.WaitingForScenes] lock state changed %ld", (uint8_t *)&v3, 0xCu);
}

@end