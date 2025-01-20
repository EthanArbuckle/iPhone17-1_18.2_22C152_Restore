@interface _SBContinuitySessionStateMachineStateWaitingForRemoteUnlock
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
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
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStateWaitingForRemoteUnlock

- (_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock;
  v9 = [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)&v12 init];
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

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _reevaluateStateForReason:@"client updated externally blocked reasons"];
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  v5 = SBLogContinuitySession();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_WAITING_FOR_REMOTE_UNLOCK", (const char *)&unk_1D8FE2CAB, buf, 2u);
  }

  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _evaluateSystemEvents];
  v6 = NSString;
  id v7 = NSStringFromSBContinuitySessionState(a3);
  id v8 = [v6 stringWithFormat:@"entered state from: %@", v7];
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _reevaluateStateForReason:v8];
}

- (void)exitedStateTo:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_isCurrentState = 0;
  v4 = SBLogContinuitySession();
  if (os_signpost_enabled(v4))
  {
    BOOL remoteUnlocked = self->_remoteUnlocked;
    v6[0] = 67109120;
    v6[1] = remoteUnlocked;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_WAITING_FOR_REMOTE_UNLOCK", "remoteUnlocked: %{BOOL}u", (uint8_t *)v6, 8u);
  }
}

- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(id)a3
{
  id v4 = a3;
  v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock continuityDisplayAuthenticationCoordinatorDidUpdateLockState:](v4, v5);
  }

  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _evaluateLockState];
  [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self _reevaluateStateForReason:@"lock state change"];
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
  v7[2] = __89___SBContinuitySessionStateMachineStateWaitingForRemoteUnlock_appendDescriptionToStream___block_invoke;
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
    [v9 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock.m" lineNumber:113 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];
  }
  v5 = [WeakRetained clientExternallyBlockedReasons];
  id v6 = v5;
  if (self->_isCurrentState && [v5 count])
  {
    uint64_t v7 = SBLogContinuitySession();
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
  if (self->_isCurrentState)
  {
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUIBlocked])
    {
      v3 = SBLogContinuitySession();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because UI blocked", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because UI unlocked", v15, 2u);
      }

      id invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = SBContinuityBlockUIUnlocked;
      goto LABEL_14;
    }
    if ([(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isInCall])
    {
      uint64_t v7 = SBLogContinuitySession();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because in call", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because SOS active", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because lock screen search presented", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because using secure app", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because airplay mirroring", v15, 2u);
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
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .invalid because user-initiated remote transient overlay is presented", v15, 2u);
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
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[State.WaitingForRemoteUnlock] Lock state is .remoteUnlocked", v1, 2u);
}

- (void)_reevaluateStateForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isCurrentState)
  {
    v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] Re-evaluating state for reason: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    id v6 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = v6;
    if (!self->_remoteUnlocked) {
      [v6 addObject:@"checkpoint.waiting-for-assertDelay"];
    }
    uint64_t v8 = [v7 count];
    v9 = SBLogContinuitySession();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = objc_msgSend(v7, "bs_array");
        int v13 = 138543362;
        id v14 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] still blocked by %{public}@", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v12 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.WaitingForRemoteUnlock] --> moving to .waitingForScenes", (uint8_t *)&v13, 2u);
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
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[State.WaitingForRemoteUnlock] lock state changed %ld", (uint8_t *)&v3, 0xCu);
}

@end