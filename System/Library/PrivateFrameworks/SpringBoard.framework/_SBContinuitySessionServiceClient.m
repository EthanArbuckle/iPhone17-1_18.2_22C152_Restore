@interface _SBContinuitySessionServiceClient
- (BSServiceConnection)connection;
- (NSSet)clientExternallyBlockedReasons;
- (NSSet)externallyBlockedReasons;
- (NSSet)stateReasons;
- (NSString)description;
- (NSString)displayHardwareIdentifier;
- (SBContinuitySession)session;
- (_SBContinuitySessionServiceClient)initWithConnection:(id)a3 pid:(int)a4;
- (_SBContinuitySessionServiceClientDelegate)delegate;
- (id)succinctDescription;
- (int)pid;
- (int64_t)interfaceOrientation;
- (unint64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_connectionQueue_clientHasAdoptedScreenCaptureNotifications;
- (void)_connectionQueue_didCaptureScreenshot;
- (void)_connectionQueue_didInvalidate;
- (void)_connectionQueue_didStartScreenRecording;
- (void)_connectionQueue_didStopScreenRecording;
- (void)_connectionQueue_handleActivated;
- (void)_connectionQueue_handleContinuityButtonEvent:(unint64_t)a3;
- (void)_connectionQueue_handleHIDServicesConfigured;
- (void)_connectionQueue_handleLaunchEventOfType:(id)a3 payload:(id)a4;
- (void)_connectionQueue_handleUpdatedExternallyBlockedReasons:(id)a3;
- (void)_connectionQueue_setHostedInterfaceOrientation:(int64_t)a3;
- (void)_connectionQueue_updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5;
- (void)_pushLatestOrientationToClient;
- (void)_pushLatestStateToClient;
- (void)appendDescriptionToStream:(id)a3;
- (void)continuitySession:(id)a3 didUpdateInterfaceOrientation:(int64_t)a4 supportedInterfaceOrientations:(unint64_t)a5;
- (void)continuitySessionDidUpdateState:(id)a3;
- (void)setClientExternallyBlockedReasons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayHardwareIdentifier:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateReasons:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
@end

@implementation _SBContinuitySessionServiceClient

- (_SBContinuitySessionServiceClient)initWithConnection:(id)a3 pid:(int)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SBContinuitySessionServiceClient;
  v8 = [(_SBContinuitySessionServiceClient *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_pid = a4;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    clientExternallyBlockedReasons = v9->_clientExternallyBlockedReasons;
    v9->_clientExternallyBlockedReasons = (NSSet *)v10;

    *(_DWORD *)&v9->_lock_waitingForClientActivation = 16777473;
    v12 = SBLogContinuitySessionService();
    if (os_signpost_enabled(v12))
    {
      v14[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_CONNECTION_NEGOTIATION", (const char *)&unk_1D8FE2CAB, (uint8_t *)v14, 2u);
    }
  }
  return v9;
}

- (void)setSession:(id)a3
{
  v5 = (SBContinuitySession *)a3;
  session = self->_session;
  if (session != v5)
  {
    id v7 = v5;
    [(SBContinuitySession *)session removeStateObserver:self];
    [(SBContinuitySession *)self->_session removeOrientationObserver:self];
    objc_storeStrong((id *)&self->_session, a3);
    [(SBContinuitySession *)self->_session addStateObserver:self];
    [(SBContinuitySession *)self->_session addOrientationObserver:self];
    v5 = v7;
  }
}

- (NSSet)externallyBlockedReasons
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_clientExternallyBlockedReasons];
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation) {
    [v3 addObject:@"block._SBContinuitySessionServiceClient.waiting-for-clientActivation"];
  }
  os_unfair_lock_unlock(&self->_lock);
  return (NSSet *)v3;
}

- (void)_connectionQueue_handleLaunchEventOfType:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

- (void)_connectionQueue_handleContinuityButtonEvent:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionServiceClient.m" lineNumber:125 description:@"Can't process button event before client activation"];
  }
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (void)_connectionQueue_setHostedInterfaceOrientation:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionServiceClient.m" lineNumber:147 description:@"Can't process hosted interface orientation change"];
  }
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (void)_connectionQueue_handleActivated
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
    *(_DWORD *)buf = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received activation message (not handled yet)", buf, 0xCu);
  }
  BSDispatchMain();
}

- (void)_connectionQueue_handleUpdatedExternallyBlockedReasons:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

- (void)_connectionQueue_handleHIDServicesConfigured
{
}

- (void)_connectionQueue_updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  BSDispatchMain();
}

- (void)_connectionQueue_didCaptureScreenshot
{
}

- (void)_connectionQueue_didStartScreenRecording
{
}

- (void)_connectionQueue_clientHasAdoptedScreenCaptureNotifications
{
}

- (void)_connectionQueue_didStopScreenRecording
{
}

- (void)_connectionQueue_didInvalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] connection did invalidate", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_pushLatestStateToClient
{
  v45[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_invalidated || self->_main_suppressClientCallouts)
  {
    int v5 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
      uint64_t v7 = (void *)v6;
      id v8 = &stru_1F3084718;
      id v9 = @"suppressing callouts";
      if (self->_main_suppressClientCallouts)
      {
        BOOL v10 = !lock_invalidated;
      }
      else
      {
        id v9 = &stru_1F3084718;
        BOOL v10 = 1;
      }
      id v11 = @" + ";
      if (v10) {
        id v11 = &stru_1F3084718;
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v6;
      __int16 v37 = 2114;
      if (lock_invalidated) {
        id v8 = @"INVALIDATED";
      }
      v38 = v8;
      __int16 v39 = 2114;
      v40 = v11;
      __int16 v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[%{public}@] - not pushing state to client because it is %{public}@%{public}@%{public}@", buf, 0x2Au);
    }
  }
  else
  {
    id v12 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
      NSStringFromSBContinuitySessionState(self->_state);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_super v15 = [(NSSet *)self->_stateReasons bs_array];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = (uint64_t)v13;
      __int16 v37 = 2114;
      v38 = v14;
      __int16 v39 = 2114;
      v40 = v15;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushing state %{public}@ + reasons %{public}@ to remote client", buf, 0x20u);
    }
    connection = self->_connection;
    v17 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"NonLaunchingAngelIPC"];
    v45[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    int v5 = [(BSServiceConnection *)connection remoteTargetWithAssertionAttributes:v18];

    unint64_t state = self->_state;
    stateReasons = self->_stateReasons;
    id v34 = 0;
    uint64_t v21 = SBContinuitySessionStateTranslateForClient(state, stateReasons, &v34);
    id v22 = v34;
    v23 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
      NSStringFromSBContinuitySessionState(self->_state);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = [(NSSet *)self->_stateReasons bs_array];
      NSStringFromSBUIContinuitySessionStep();
      uint64_t v33 = v21;
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v22, "bs_array");
      *(_DWORD *)buf = 138544386;
      uint64_t v36 = (uint64_t)v24;
      __int16 v37 = 2114;
      v38 = v25;
      __int16 v39 = 2114;
      v40 = v26;
      __int16 v41 = 2114;
      v42 = v27;
      __int16 v43 = 2114;
      v44 = v28;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] translated internal state: %{public}@ + reasons: %{public}@ to client state: %{public}@ + reasons %{public}@ ", buf, 0x34u);

      uint64_t v21 = v33;
    }

    if (!self->_main_sentDisplayUUID)
    {
      unint64_t v29 = self->_state;
      if (v29 >= 5 && v29 != 11)
      {
        if (!self->_displayHardwareIdentifier)
        {
          v32 = [MEMORY[0x1E4F28B00] currentHandler];
          [v32 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionServiceClient.m" lineNumber:364 description:@"don't have a display hardware identifier set"];
        }
        -[NSObject didSetDisplayHardwareIdentifier:](v5, "didSetDisplayHardwareIdentifier:");
        self->_main_sentDisplayUUID = 1;
      }
    }
    if (self->_negotiatingSessionStart && (v21 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      self->_negotiatingSessionStart = 0;
      v30 = SBLogContinuitySessionService();
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_CONNECTION_NEGOTIATION", (const char *)&unk_1D8FE2CAB, buf, 2u);
      }
    }
    v31 = [NSNumber numberWithUnsignedInteger:v21];
    [v5 didUpdateContinuitySessionStep:v31 reasons:v22];
  }
}

- (void)_pushLatestOrientationToClient
{
  v27[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (!lock_invalidated && !self->_main_suppressClientCallouts)
  {
    id v11 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
      BSInterfaceOrientationDescription();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationMaskDescription();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v19 = 138543874;
      uint64_t v20 = (uint64_t)v12;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushing interface orientation %{public}@ + supported interface orientations %{public}@ to remote client", (uint8_t *)&v19, 0x20u);
    }
    connection = self->_connection;
    v16 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"NonLaunchingAngelIPC"];
    v27[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v4 = [(BSServiceConnection *)connection remoteTargetWithAssertionAttributes:v17];

    uint64_t v6 = [NSNumber numberWithInteger:self->_interfaceOrientation];
    v18 = [NSNumber numberWithUnsignedInteger:self->_supportedInterfaceOrientations];
    [v4 didUpdateCurrentInterfaceOrientation:v6 supportedInterfaceOrientations:v18];

    goto LABEL_15;
  }
  id v4 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
    uint64_t v6 = (void *)v5;
    uint64_t v7 = &stru_1F3084718;
    id v8 = @"suppressing callouts";
    if (self->_main_suppressClientCallouts)
    {
      BOOL v9 = !lock_invalidated;
    }
    else
    {
      id v8 = &stru_1F3084718;
      BOOL v9 = 1;
    }
    BOOL v10 = @" + ";
    if (v9) {
      BOOL v10 = &stru_1F3084718;
    }
    int v19 = 138544130;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    if (lock_invalidated) {
      uint64_t v7 = @"INVALIDATED";
    }
    id v22 = v7;
    __int16 v23 = 2114;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[%{public}@] - not pushing interface orientation to client because it is %{public}@%{public}@%{public}@", (uint8_t *)&v19, 0x2Au);
LABEL_15:
  }
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SBContinuitySession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_session != v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_SBContinuitySessionServiceClient.m", 406, @"session updated orientation: %@ is not the one i'm tracking: %@", v5, self->_session object file lineNumber description];
  }
  self->_unint64_t state = [(SBContinuitySession *)v5 state];
  uint64_t v6 = [(SBContinuitySession *)v5 reasons];
  stateReasons = self->_stateReasons;
  self->_stateReasons = v6;

  id v8 = [(SBContinuitySession *)v5 displayHardwareIdentifier];
  BOOL v9 = (NSString *)[v8 copy];
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  self->_displayHardwareIdentifier = v9;

  id v11 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(_SBContinuitySessionServiceClient *)self succinctDescription];
    objc_super v15 = NSStringFromSBContinuitySessionState(self->_state);
    v16 = self->_stateReasons;
    *(_DWORD *)buf = 138543874;
    int v19 = v14;
    __int16 v20 = 2114;
    __int16 v21 = v15;
    __int16 v22 = 2114;
    __int16 v23 = v16;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] session did update state %{public}@ + reasons %{public}@", buf, 0x20u);
  }
  if (self->_main_suppressClientCallouts
    && ((unint64_t state = self->_state, state > 1)
     || state == 1
     && ![(NSSet *)self->_stateReasons containsObject:@"block._SBContinuitySessionServiceClient.waiting-for-clientActivation"]&& ![(NSSet *)self->_stateReasons containsObject:@"block.session.client-connected"]))
  {
    v13 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_SBContinuitySessionServiceClient continuitySessionDidUpdateState:](self, v13);
    }

    self->_main_suppressClientCallouts = 0;
    [(_SBContinuitySessionServiceClient *)self _pushLatestStateToClient];
    [(_SBContinuitySessionServiceClient *)self _pushLatestOrientationToClient];
  }
  else
  {
    [(_SBContinuitySessionServiceClient *)self _pushLatestStateToClient];
  }
}

- (void)continuitySession:(id)a3 didUpdateInterfaceOrientation:(int64_t)a4 supportedInterfaceOrientations:(unint64_t)a5
{
  BOOL v10 = (SBContinuitySession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_session != v10)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_SBContinuitySessionServiceClient.m", 430, @"session updated orientation: %@ is not the one i'm tracking: %@", v10, self->_session object file lineNumber description];
  }
  [(_SBContinuitySessionServiceClient *)self setInterfaceOrientation:a4];
  [(_SBContinuitySessionServiceClient *)self setSupportedInterfaceOrientations:a5];
  [(_SBContinuitySessionServiceClient *)self _pushLatestOrientationToClient];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v11 = v5;
  id v12 = self;
  [v5 appendProem:self block:v10];
  if (([v5 hasSuccinctStyle] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E6AF5290;
    id v8 = v5;
    BOOL v9 = self;
    [v8 overlayStyle:v6 block:v7];
  }
}

- (_SBContinuitySessionServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBContinuitySessionServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBContinuitySession)session
{
  return self->_session;
}

- (int)pid
{
  return self->_pid;
}

- (NSSet)clientExternallyBlockedReasons
{
  return self->_clientExternallyBlockedReasons;
}

- (void)setClientExternallyBlockedReasons:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSSet)stateReasons
{
  return self->_stateReasons;
}

- (void)setStateReasons:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (void)setDisplayHardwareIdentifier:(id)a3
{
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_stateReasons, 0);
  objc_storeStrong((id *)&self->_clientExternallyBlockedReasons, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)continuitySessionDidUpdateState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 succinctDescription];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] got first update after handling client activation, ending client update suppression and pushing latest state + orientation", v4, 0xCu);
}

@end