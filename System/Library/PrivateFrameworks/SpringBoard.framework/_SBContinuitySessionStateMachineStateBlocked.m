@interface _SBContinuitySessionStateMachineStateBlocked
- (BOOL)isClientConnected;
- (NSString)description;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineStateBlocked)initWithSystemEventMonitor:(id)a3;
- (id)invalidStateHandler;
- (id)stateTransitionHandler;
- (id)stateUpdateHandler;
- (void)_evaluateClientExternallyBlockedReasons;
- (void)_evaluateSystemEvents;
- (void)_reevaluateStateForReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)continuitySessionSystemEventMonitor:(id)a3 eventOccurred:(id)a4;
- (void)enteredStateFrom:(unint64_t)a3;
- (void)exitedStateTo:(unint64_t)a3;
- (void)invalidate;
- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3;
- (void)noteClientDidUpdateExternallyBlockedReasons;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setInvalidStateHandler:(id)a3;
- (void)setStateTransitionHandler:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
@end

@implementation _SBContinuitySessionStateMachineStateBlocked

- (_SBContinuitySessionStateMachineStateBlocked)initWithSystemEventMonitor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBContinuitySessionStateMachineStateBlocked;
  v6 = [(_SBContinuitySessionStateMachineStateBlocked *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemEventMonitor, a3);
    [(SBContinuitySessionSystemEventMonitor *)v7->_systemEventMonitor addObserver:v7];
  }

  return v7;
}

- (BOOL)isClientConnected
{
  return self->_clientConnected;
}

- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3
{
  self->_clientConnected = 1;
  objc_storeStrong((id *)&self->_blockedReasons_client, a3);
  [(_SBContinuitySessionStateMachineStateBlocked *)self _reevaluateStateForReason:@"client connected"];
}

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  [(_SBContinuitySessionStateMachineStateBlocked *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateBlocked *)self _evaluateSystemEvents];
  id v5 = NSString;
  NSStringFromSBContinuitySessionState(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v5 stringWithFormat:@"entered state from: %@", v7];
  [(_SBContinuitySessionStateMachineStateBlocked *)self _reevaluateStateForReason:v6];
}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
}

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  [(_SBContinuitySessionStateMachineStateBlocked *)self _evaluateClientExternallyBlockedReasons];
  [(_SBContinuitySessionStateMachineStateBlocked *)self _reevaluateStateForReason:@"client updated externally blocked reasons"];
}

- (void)continuitySessionSystemEventMonitor:(id)a3 eventOccurred:(id)a4
{
  id v5 = a4;
  [(_SBContinuitySessionStateMachineStateBlocked *)self _evaluateSystemEvents];
  id v6 = [NSString stringWithFormat:@"system monitor event occurred: %@", v5];

  [(_SBContinuitySessionStateMachineStateBlocked *)self _reevaluateStateForReason:v6];
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
  v7[2] = __74___SBContinuitySessionStateMachineStateBlocked_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  [v6 overlayStyle:v5 block:v7];
}

- (void)_evaluateClientExternallyBlockedReasons
{
  if (self->_isCurrentState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
    id v8 = WeakRetained;
    if (!WeakRetained)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachineStateBlocked.m" lineNumber:133 description:@"Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"];

      id WeakRetained = 0;
    }
    id v5 = [WeakRetained clientExternallyBlockedReasons];
    blockedReasons_client = self->_blockedReasons_client;
    self->_blockedReasons_client = v5;
  }
}

- (void)_evaluateSystemEvents
{
  if (self->_isCurrentState)
  {
    self->_uiLocked = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUILocked];
    self->_uiBlocked = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUIBlocked];
    self->_inCall = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isInCall];
    self->_sosActive = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isSOSActive];
    self->_lockScreenSearchPresented = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isLockScreenSearchPresented];
    self->_usingSecureApp = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUsingSecureApp];
    self->_isAirplayMirroring = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isAirplayMirroring];
    self->_isUserInitiatedRemoteTransientOverlayPresented = [(SBContinuitySessionSystemEventMonitor *)self->_systemEventMonitor isUserInitiatedRemoteTransientOverlayPresented];
  }
}

- (void)_reevaluateStateForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isCurrentState)
  {
    id v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State.Blocked] Re-evaluating state for reason: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    id v6 = (void *)[(NSSet *)self->_blockedReasons_client mutableCopy];
    id v7 = v6;
    if (!self->_clientConnected) {
      [v6 addObject:@"block.session.client-connected"];
    }
    if (self->_uiBlocked) {
      [v7 addObject:@"block.embedded-display.uiBlocked"];
    }
    if (!self->_uiLocked) {
      [v7 addObject:@"block.embedded-display.uiUnlocked"];
    }
    if (self->_inCall) {
      [v7 addObject:@"block.inCall"];
    }
    if (self->_sosActive) {
      [v7 addObject:@"block.sos.active"];
    }
    if (self->_lockScreenSearchPresented) {
      [v7 addObject:@"block.lockScreen.searchPresented"];
    }
    if (self->_usingSecureApp) {
      [v7 addObject:@"block.embedded-display.secureAppUsage"];
    }
    if (self->_isAirplayMirroring) {
      [v7 addObject:@"block.airplayMirroring"];
    }
    if (self->_isUserInitiatedRemoteTransientOverlayPresented) {
      [v7 addObject:@"block.userInitiatedRemoteTransientOverlayPresented"];
    }
    uint64_t v8 = [v7 count];
    objc_super v9 = SBLogContinuitySession();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = objc_msgSend(v7, "bs_array");
        int v13 = 138543362;
        id v14 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.Blocked] still blocked by %{public}@", (uint8_t *)&v13, 0xCu);
      }
      v12 = (void (*)(void))*((void *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State.Blocked] --> moving to .preparing", (uint8_t *)&v13, 2u);
      }

      v12 = (void (*)(void))*((void *)self->_stateTransitionHandler + 2);
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
  objc_storeStrong((id *)&self->_blockedReasons_client, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end