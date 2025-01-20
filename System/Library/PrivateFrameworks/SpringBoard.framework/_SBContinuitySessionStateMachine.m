@interface _SBContinuitySessionStateMachine
- (BOOL)isAutomaticBiometricsDisabled;
- (BOOL)isAutomaticBiomtericsDisabled;
- (NSSet)reasons;
- (NSString)description;
- (_SBContinuitySessionServiceClient)client;
- (_SBContinuitySessionStateMachine)initWithBlockedState:(id)a3 preparingForRemoteUnlockState:(id)a4 waitingForRemoteUnlockState:(id)a5 waitingForScenesState:(id)a6 waitingForHIDServicesState:(id)a7 activatingState:(id)a8 updatingActiveDisplayState:(id)a9 launchingState:(id)a10 flushingState:(id)a11 activeState:(id)a12;
- (_SBContinuitySessionStateMachine)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4;
- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider;
- (_SBContinuitySessionStateMachineDelegate)delegate;
- (id)_stateMachineStateForState:(unint64_t)a3;
- (id)clientExternallyBlockedReasons;
- (id)succinctDescription;
- (unint64_t)state;
- (void)_initializeStates;
- (void)_moveToInvalidStateForReasons:(id)a3 postToDelegate:(BOOL)a4;
- (void)_moveToState:(unint64_t)a3;
- (void)_updateCurrentStateReasons:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)didHandleLaunchEvent:(id)a3;
- (void)didReceiveLaunchEvent:(id)a3;
- (void)invalidateForReasons:(id)a3;
- (void)noteActiveDisplayUpdated;
- (void)noteClientConfiguredHIDServices;
- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3;
- (void)noteClientDidUpdateExternallyBlockedReasons;
- (void)noteMainSceneConnected;
- (void)noteSceneHasValidDisplayUUID;
- (void)noteSystemApertureCurtainSceneConnected;
- (void)noteSystemApertureCurtainUIIsReady;
- (void)noteSystemApertureSceneConnected;
- (void)noteSystemApertureUIIsReady;
- (void)noteUIFlushed;
- (void)noteUIIsReady;
- (void)setAutomaticBiometricsDisabled:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setClientExternallyBlockedReasonsProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _SBContinuitySessionStateMachine

- (_SBContinuitySessionStateMachine)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v31 = [[_SBContinuitySessionStateMachineStateBlocked alloc] initWithSystemEventMonitor:v5];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __106___SBContinuitySessionStateMachine_initWithSystemEventMonitor_continuityDisplayAuthenticationCoordinator___block_invoke;
  v32[3] = &unk_1E6B0E0B8;
  id v33 = v5;
  id v34 = v6;
  id v30 = v6;
  id v29 = v5;
  v7 = (void (**)(void, void))MEMORY[0x1D948C7A0](v32);
  uint64_t v8 = objc_opt_class();
  v9 = v7[2](v7, v8);
  uint64_t v10 = objc_opt_class();
  v11 = v7[2](v7, v10);
  uint64_t v12 = objc_opt_class();
  v13 = v7[2](v7, v12);
  uint64_t v14 = objc_opt_class();
  v15 = v7[2](v7, v14);
  uint64_t v16 = objc_opt_class();
  v26 = v7[2](v7, v16);
  uint64_t v17 = objc_opt_class();
  v18 = v7[2](v7, v17);
  uint64_t v19 = objc_opt_class();
  v20 = v7[2](v7, v19);
  uint64_t v21 = objc_opt_class();
  v22 = v7[2](v7, v21);
  uint64_t v23 = objc_opt_class();
  v24 = v7[2](v7, v23);
  v28 = [(_SBContinuitySessionStateMachine *)self initWithBlockedState:v31 preparingForRemoteUnlockState:v9 waitingForRemoteUnlockState:v11 waitingForScenesState:v13 waitingForHIDServicesState:v15 activatingState:v26 updatingActiveDisplayState:v18 launchingState:v20 flushingState:v22 activeState:v24];

  return v28;
}

- (_SBContinuitySessionStateMachine)initWithBlockedState:(id)a3 preparingForRemoteUnlockState:(id)a4 waitingForRemoteUnlockState:(id)a5 waitingForScenesState:(id)a6 waitingForHIDServicesState:(id)a7 activatingState:(id)a8 updatingActiveDisplayState:(id)a9 launchingState:(id)a10 flushingState:(id)a11 activeState:(id)a12
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v27 = a6;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  v35.receiver = self;
  v35.super_class = (Class)_SBContinuitySessionStateMachine;
  uint64_t v21 = [(_SBContinuitySessionStateMachine *)&v35 init];
  v22 = v21;
  if (v21)
  {
    v21->_internalState = 0;
    v21->_observerState = 0;
    uint64_t v23 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    internalReasons = v22->_internalReasons;
    v22->_internalReasons = v23;

    objc_storeStrong((id *)&v22->_observerReasons, v22->_internalReasons);
    objc_storeStrong((id *)&v22->_blockedState, a3);
    objc_storeStrong((id *)&v22->_preparingForRemoteUnlockState, a4);
    objc_storeStrong((id *)&v22->_waitingForRemoteUnlockState, a5);
    objc_storeStrong((id *)&v22->_waitingForScenesState, v27);
    objc_storeStrong((id *)&v22->_waitingForHIDServicesState, a7);
    objc_storeStrong((id *)&v22->_activatingState, a8);
    objc_storeStrong((id *)&v22->_updatingActiveDisplayState, a9);
    objc_storeStrong((id *)&v22->_launchingState, a10);
    objc_storeStrong((id *)&v22->_flushingState, a11);
    objc_storeStrong((id *)&v22->_activeState, a12);
    [(_SBContinuitySessionStateMachine *)v22 _initializeStates];
    [(_SBContinuitySessionStateMachine *)v22 _moveToState:1];
  }

  return v22;
}

- (unint64_t)state
{
  return self->_observerState;
}

- (NSSet)reasons
{
  return self->_observerReasons;
}

- (void)setAutomaticBiometricsDisabled:(BOOL)a3
{
}

- (BOOL)isAutomaticBiometricsDisabled
{
  return [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self->_preparingForRemoteUnlockState isAutomaticBiomtericsDisabled];
}

- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3
{
}

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  id v2 = [(_SBContinuitySessionStateMachine *)self _stateMachineStateForState:self->_internalState];
  [v2 noteClientDidUpdateExternallyBlockedReasons];
}

- (void)noteClientConfiguredHIDServices
{
}

- (void)noteMainSceneConnected
{
}

- (void)noteSceneHasValidDisplayUUID
{
}

- (void)noteUIIsReady
{
}

- (void)noteSystemApertureSceneConnected
{
}

- (void)noteSystemApertureUIIsReady
{
}

- (void)noteSystemApertureCurtainSceneConnected
{
}

- (void)noteSystemApertureCurtainUIIsReady
{
}

- (void)noteActiveDisplayUpdated
{
}

- (void)noteUIFlushed
{
}

- (void)invalidateForReasons:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id v5 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[State Machine] invalidated for reasons: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    [(_SBContinuitySessionStateMachine *)self _moveToInvalidStateForReasons:v4 postToDelegate:0];
    [(_SBContinuitySessionStateMachineStateBlocked *)self->_blockedState invalidate];
    blockedState = self->_blockedState;
    self->_blockedState = 0;

    [(_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *)self->_preparingForRemoteUnlockState invalidate];
    preparingForRemoteUnlockState = self->_preparingForRemoteUnlockState;
    self->_preparingForRemoteUnlockState = 0;

    [(_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *)self->_waitingForRemoteUnlockState invalidate];
    waitingForRemoteUnlockState = self->_waitingForRemoteUnlockState;
    self->_waitingForRemoteUnlockState = 0;

    [(_SBContinuitySessionStateMachineStateWaitingForScenes *)self->_waitingForScenesState invalidate];
    waitingForScenesState = self->_waitingForScenesState;
    self->_waitingForScenesState = 0;

    [(_SBContinuitySessionStateMachineStateWaitingForHIDServices *)self->_waitingForHIDServicesState invalidate];
    waitingForHIDServicesState = self->_waitingForHIDServicesState;
    self->_waitingForHIDServicesState = 0;

    [(_SBContinuitySessionStateMachineStateActivating *)self->_activatingState invalidate];
    activatingState = self->_activatingState;
    self->_activatingState = 0;

    [(_SBContinuitySessionStateMachineStateUpdatingActiveDisplay *)self->_updatingActiveDisplayState invalidate];
    updatingActiveDisplayState = self->_updatingActiveDisplayState;
    self->_updatingActiveDisplayState = 0;

    [(_SBContinuitySessionStateMachineStateLaunching *)self->_launchingState invalidate];
    launchingState = self->_launchingState;
    self->_launchingState = 0;

    [(_SBContinuitySessionStateMachineStateFlushing *)self->_flushingState invalidate];
    flushingState = self->_flushingState;
    self->_flushingState = 0;

    [(_SBContinuitySessionStateMachineStateActive *)self->_activeState invalidate];
    activeState = self->_activeState;
    self->_activeState = 0;
  }
}

- (void)didReceiveLaunchEvent:(id)a3
{
}

- (void)didHandleLaunchEvent:(id)a3
{
}

- (void)_initializeStates
{
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke;
  v19[3] = &unk_1E6B0E108;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a2;
  v19[4] = self;
  id v4 = (void *)MEMORY[0x1D948C7A0](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_3;
  v17[3] = &unk_1E6B0E158;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a2;
  v17[4] = self;
  id v5 = (void *)MEMORY[0x1D948C7A0](v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_5;
  v15[3] = &unk_1E6B0E108;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  v15[4] = self;
  id v6 = (void *)MEMORY[0x1D948C7A0](v15);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_7;
  v11[3] = &unk_1E6B0E180;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  v11[4] = self;
  uint64_t v10 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v11);
  ((void (**)(void, _SBContinuitySessionStateMachineStateBlocked *, uint64_t))v10)[2](v10, self->_blockedState, 1);
  ((void (**)(void, _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *, uint64_t))v10)[2](v10, self->_preparingForRemoteUnlockState, 2);
  ((void (**)(void, _SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *, uint64_t))v10)[2](v10, self->_waitingForRemoteUnlockState, 3);
  ((void (**)(void, _SBContinuitySessionStateMachineStateWaitingForScenes *, uint64_t))v10)[2](v10, self->_waitingForScenesState, 4);
  ((void (**)(void, _SBContinuitySessionStateMachineStateWaitingForHIDServices *, uint64_t))v10)[2](v10, self->_waitingForHIDServicesState, 5);
  ((void (**)(void, _SBContinuitySessionStateMachineStateActivating *, uint64_t))v10)[2](v10, self->_activatingState, 6);
  ((void (**)(void, _SBContinuitySessionStateMachineStateUpdatingActiveDisplay *, uint64_t))v10)[2](v10, self->_updatingActiveDisplayState, 7);
  ((void (**)(void, _SBContinuitySessionStateMachineStateLaunching *, uint64_t))v10)[2](v10, self->_launchingState, 8);
  ((void (**)(void, _SBContinuitySessionStateMachineStateFlushing *, uint64_t))v10)[2](v10, self->_flushingState, 9);
  ((void (**)(void, _SBContinuitySessionStateMachineStateActive *, uint64_t))v10)[2](v10, self->_activeState, 10);

  objc_destroyWeak(v16);
  objc_destroyWeak(v18);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (id)_stateMachineStateForState:(unint64_t)a3
{
  if (a3 - 1 > 9)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *((id *)&self->_authenticationCoordinator + a3);
  }
  return v4;
}

- (void)_moveToInvalidStateForReasons:(id)a3 postToDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t internalState = self->_internalState;
  id v9 = SBLogContinuityDisplay();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v10)
    {
      v11 = objc_msgSend(v7, "bs_array");
      int v19 = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call to move to invalid for reasons %{public}@ because we are already in .invalid", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      id v12 = NSStringFromSBContinuitySessionState(self->_internalState);
      id v13 = objc_msgSend(v7, "bs_array");
      int v19 = 138543618;
      id v20 = v12;
      __int16 v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ -> INVALID reasons: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    id v14 = SBLogContinuitySession();
    if (os_signpost_enabled(v14))
    {
      v15 = NSStringFromSBContinuitySessionState(11);
      int v19 = 138543362;
      id v20 = v15;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_STATE_UPDATE", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
    unint64_t observerState = self->_observerState;
    unint64_t v17 = self->_internalState;
    self->_unint64_t internalState = 11;
    objc_storeStrong((id *)&self->_internalReasons, a3);
    id v9 = [(_SBContinuitySessionStateMachine *)self _stateMachineStateForState:v17];
    [v9 exitedStateTo:11];
    if (self->_observerState != 11)
    {
      self->_unint64_t observerState = 11;
      objc_storeStrong((id *)&self->_observerReasons, a3);
      if (v4)
      {
        uint64_t v18 = [(_SBContinuitySessionStateMachine *)self delegate];
        [v18 continuitySessionStateMachineDidUpdateState:self oldState:observerState];
      }
    }
  }
}

- (void)_updateCurrentStateReasons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t internalState = self->_internalState;
  id v7 = SBLogContinuityDisplay();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v8)
    {
      id v9 = objc_msgSend(v5, "bs_array");
      *(_DWORD *)buf = 138543362;
      unint64_t v17 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call update reasons %{public}@ because we are already in .invalid", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      BOOL v10 = NSStringFromSBContinuitySessionState(self->_internalState);
      v11 = objc_msgSend(v5, "bs_array");
      *(_DWORD *)buf = 138543618;
      unint64_t v17 = v10;
      __int16 v18 = 2114;
      int v19 = v11;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ updated reasons: %{public}@", buf, 0x16u);
    }
    id v12 = (void *)self->_internalState;
    objc_storeStrong((id *)&self->_internalReasons, a3);
    if (!self->_suppressReasonUpdateCallout)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63___SBContinuitySessionStateMachine__updateCurrentStateReasons___block_invoke;
      block[3] = &unk_1E6AF7178;
      objc_copyWeak(v15, (id *)buf);
      id v14 = v5;
      v15[1] = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_moveToState:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 == 11)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionStateMachine.m" lineNumber:386 description:@"must call _moveToInvalidStateForReasons:"];
  }
  unint64_t internalState = self->_internalState;
  id v6 = SBLogContinuityDisplay();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v7)
    {
      BOOL v8 = NSStringFromSBContinuitySessionState(a3);
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call to move to %{public}@ because we are already in .invalid", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = NSStringFromSBContinuitySessionState(self->_internalState);
      BOOL v10 = NSStringFromSBContinuitySessionState(a3);
      *(_DWORD *)buf = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ -> %{public}@", buf, 0x16u);
    }
    v11 = SBLogContinuitySession();
    if (os_signpost_enabled(v11))
    {
      id v12 = NSStringFromSBContinuitySessionState(a3);
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_STATE_UPDATE", "%{public}@", buf, 0xCu);
    }
    id v13 = (void *)self->_internalState;
    self->_unint64_t internalState = a3;
    id v14 = [MEMORY[0x1E4F1CAD0] set];
    internalReasons = self->_internalReasons;
    self->_internalReasons = v14;

    self->_suppressReasonUpdateCallout = 1;
    id v6 = [(_SBContinuitySessionStateMachine *)self _stateMachineStateForState:v13];
    int v16 = [(_SBContinuitySessionStateMachine *)self _stateMachineStateForState:a3];
    [v6 exitedStateTo:a3];
    [v16 enteredStateFrom:v13];
    self->_suppressReasonUpdateCallout = 0;
    unint64_t v17 = (void *)[(NSSet *)self->_internalReasons copy];
    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49___SBContinuitySessionStateMachine__moveToState___block_invoke;
    v21[3] = &unk_1E6B0E1A8;
    objc_copyWeak(v23, (id *)buf);
    v23[1] = (id)a3;
    v23[2] = v13;
    id v22 = v17;
    id v18 = v17;
    dispatch_async(MEMORY[0x1E4F14428], v21);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);
  }
}

- (id)clientExternallyBlockedReasons
{
  id v2 = [(_SBContinuitySessionStateMachine *)self clientExternallyBlockedReasonsProvider];
  uint64_t v3 = [v2 clientExternallyBlockedReasons];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"stateMachine.missingClientExternallyBlockedReasonsProvider"];
  }
  id v6 = v5;

  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4F720];
  BOOL v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke;
  v24[3] = &unk_1E6AF5290;
  id v6 = v4;
  id v25 = v6;
  __int16 v26 = self;
  [v6 appendProem:self block:v24];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  id v20[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_2;
  v20[3] = &unk_1E6AF4E00;
  id v7 = v6;
  id v21 = v7;
  id v22 = self;
  id v8 = v5;
  id v23 = v8;
  [v7 appendBodySectionWithName:@"observerState" block:v20];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_4;
  int v16 = &unk_1E6AF4E00;
  id v9 = v7;
  id v17 = v9;
  id v18 = self;
  id v19 = v8;
  id v10 = v8;
  [v9 appendBodySectionWithName:@"internalState" block:&v13];
  if ((objc_msgSend(v9, "hasSuccinctStyle", v13, v14, v15, v16) & 1) == 0)
  {
    v11 = [(_SBContinuitySessionStateMachine *)self _stateMachineStateForState:self->_internalState];
    id v12 = (id)[v9 appendObject:v11 withName:@"currentState"];
  }
}

- (_SBContinuitySessionStateMachineDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_SBContinuitySessionStateMachineDelegate *)a3;
}

- (BOOL)isAutomaticBiomtericsDisabled
{
  return self->_automaticBiometricsDisabled;
}

- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
  return (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider *)WeakRetained;
}

- (void)setClientExternallyBlockedReasonsProvider:(id)a3
{
}

- (_SBContinuitySessionServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_clientExternallyBlockedReasonsProvider);
  objc_storeStrong((id *)&self->_observerReasons, 0);
  objc_storeStrong((id *)&self->_internalReasons, 0);
  objc_storeStrong((id *)&self->_activeState, 0);
  objc_storeStrong((id *)&self->_flushingState, 0);
  objc_storeStrong((id *)&self->_launchingState, 0);
  objc_storeStrong((id *)&self->_updatingActiveDisplayState, 0);
  objc_storeStrong((id *)&self->_activatingState, 0);
  objc_storeStrong((id *)&self->_waitingForHIDServicesState, 0);
  objc_storeStrong((id *)&self->_waitingForScenesState, 0);
  objc_storeStrong((id *)&self->_waitingForRemoteUnlockState, 0);
  objc_storeStrong((id *)&self->_preparingForRemoteUnlockState, 0);
  objc_storeStrong((id *)&self->_blockedState, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end