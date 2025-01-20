@interface SBKeyboardDismissalManager
- (BOOL)_shouldPreventDismissalForTouch:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (SBKeyboardDismissalManager)initWithTouchDeliveryService:(id)a3 systemGestureManager:(id)a4 keyboardArbiterManager:(id)a5 focusController:(id)a6;
- (id)registerKeyboardDismissalParticipant:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (void)_didTap:(id)a3;
- (void)_reset;
- (void)dealloc;
- (void)gestureRecognizerTransitionedToFailed:(id)a3;
- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6;
@end

@implementation SBKeyboardDismissalManager

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (UIGestureRecognizer *)a3;
  id v7 = a4;
  if ([(BSCompoundAssertion *)self->_participantsAssertion isActive]
    && !self->_trackedTouchIdentifier)
  {
    if (self->_dismissGestureRecognizer == v6)
    {
      v10 = SBLogKeyboardDismissal();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[SBKeyboardDismissalManager gestureRecognizer:shouldReceiveTouch:]();
      }

      BOOL v11 = [(SBKeyboardDismissalManager *)self _shouldPreventDismissalForTouch:v7];
      if (!v11)
      {
        v12 = SBLogKeyboardDismissal();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = _SBFLoggingMethodProem();
          int v15 = 138543618;
          v16 = v13;
          __int16 v17 = 2114;
          id v18 = v7;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ tracking touch for keyboard dismiss: %{public}@", (uint8_t *)&v15, 0x16u);
        }
        uint64_t v14 = [v7 _touchIdentifier];
        self->_trackedTouchIdentifier = v14;
        [(BKSTouchDeliveryObservationService *)self->_touchService addObserver:self forTouchIdentifier:v14];
      }
      char v8 = !v11;
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (SBKeyboardDismissalManager)initWithTouchDeliveryService:(id)a3 systemGestureManager:(id)a4 keyboardArbiterManager:(id)a5 focusController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBKeyboardDismissalManager;
  int v15 = [(SBKeyboardDismissalManager *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keyboardArbiterManager, a5);
    objc_storeStrong((id *)&v16->_systemGestureManager, a4);
    objc_storeStrong((id *)&v16->_keyboardFocusCoordinator, a6);
    objc_storeStrong((id *)&v16->_touchService, a3);
    uint64_t v17 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SBKeyboardDismissalManager"];
    participantsAssertion = v16->_participantsAssertion;
    v16->_participantsAssertion = (BSCompoundAssertion *)v17;

    uint64_t v19 = v16->_participantsAssertion;
    v20 = SBLogKeyboardDismissal();
    [(BSCompoundAssertion *)v19 setLog:v20];

    v21 = [[SBFailureNotifyingTapGestureRecognizer alloc] initWithTarget:v16 action:sel__didTap_];
    dismissGestureRecognizer = v16->_dismissGestureRecognizer;
    v16->_dismissGestureRecognizer = &v21->super.super;

    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setName:@"keyboardDismissal"];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setAllowedTouchTypes:&unk_1F3348198];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setDelegate:v16];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v16->_dismissGestureRecognizer setDelaysTouchesEnded:0];
    [(SBSystemGestureManager *)v16->_systemGestureManager addGestureRecognizer:v16->_dismissGestureRecognizer withType:126];
  }

  return v16;
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_participantsAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBKeyboardDismissalManager;
  [(SBKeyboardDismissalManager *)&v3 dealloc];
}

- (id)registerKeyboardDismissalParticipant:(id)a3
{
  participantsAssertion = self->_participantsAssertion;
  v4 = NSString;
  id v5 = a3;
  v6 = [v4 stringWithFormat:@"%@-%p", objc_opt_class(), v5];
  id v7 = [(BSCompoundAssertion *)participantsAssertion acquireForReason:v6 withContext:v5];

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_didTap:(id)a3
{
  id v5 = a3;
  unsigned int trackedTouchIdentifier = self->_trackedTouchIdentifier;
  if (trackedTouchIdentifier)
  {
    touchExpiryTimer = self->_touchExpiryTimer;
    if (!touchExpiryTimer)
    {
      char v8 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBKeyboardDismissalManager.touchExpiry"];
      v9 = self->_touchExpiryTimer;
      self->_touchExpiryTimer = v8;

      unsigned int trackedTouchIdentifier = self->_trackedTouchIdentifier;
      touchExpiryTimer = self->_touchExpiryTimer;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__SBKeyboardDismissalManager__didTap___block_invoke;
    v11[3] = &unk_1E6B06EB0;
    unsigned int v12 = trackedTouchIdentifier;
    v11[4] = self;
    v11[5] = a2;
    [(BSAbsoluteMachTimer *)touchExpiryTimer scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v11 queue:0.02 handler:0.05];
    v10 = SBLogKeyboardDismissal();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBKeyboardDismissalManager _didTap:]();
    }
  }
}

uint64_t __38__SBKeyboardDismissalManager__didTap___block_invoke(uint64_t result)
{
  v1 = (id *)(result + 32);
  if (*(_DWORD *)(result + 48) == *(_DWORD *)(*(void *)(result + 32) + 56))
  {
    uint64_t v2 = result;
    objc_super v3 = SBLogKeyboardDismissal();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__SBKeyboardDismissalManager__didTap___block_invoke_cold_1((uint64_t)v1, v2, v3);
    }

    return [*v1 _reset];
  }
  return result;
}

- (void)gestureRecognizerTransitionedToFailed:(id)a3
{
  v4 = SBLogKeyboardDismissal();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBKeyboardDismissalManager gestureRecognizerTransitionedToFailed:]();
  }

  [(SBKeyboardDismissalManager *)self _reset];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
}

uint64_t __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke(uint64_t result)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(result + 32);
  uint64_t v1 = *(void *)(result + 32);
  int v3 = *(_DWORD *)(result + 48);
  if (v3) {
    BOOL v4 = v3 == *(_DWORD *)(v1 + 56);
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4) {
    return result;
  }
  uint64_t v5 = result;
  if ([*(id *)(v1 + 40) isActive])
  {
    int v6 = *(_DWORD *)(v5 + 52);
    int v7 = [*(id *)(*(void *)(v5 + 32) + 24) presentingKeyboardProcessIdentifier];
    char v8 = SBLogKeyboardDismissal();
    v9 = v8;
    if (v6 != v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = _SBFLoggingMethodProem();
        int v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing keyboard", (uint8_t *)&v15, 0xCu);
      }
      [*((id *)*v2 + 1) forceKeyboardAway];
      goto LABEL_16;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = _SBFLoggingMethodProem();
      int v12 = *(_DWORD *)(v5 + 52);
      int v11 = *(_DWORD *)(v5 + 56);
      int v15 = 138543874;
      v16 = v10;
      __int16 v17 = 1024;
      int v18 = v11;
      __int16 v19 = 1024;
      int v20 = v12;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ hittest keyboard; preventing dismiss; context: %x; pid: %u",
        (uint8_t *)&v15,
        0x18u);
    }
  }
  else
  {
    v9 = SBLogKeyboardDismissal();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_2((uint64_t)v2);
    }
  }

LABEL_16:
  id v14 = SBLogKeyboardDismissal();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_1((uint64_t)v2);
  }

  return [*v2 _reset];
}

- (BOOL)_shouldPreventDismissalForTouch:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(BSCompoundAssertion *)self->_participantsAssertion isActive] & 1) == 0)
  {
    uint64_t v5 = SBLogKeyboardDismissal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBKeyboardDismissalManager _shouldPreventDismissalForTouch:]();
    }
LABEL_16:
    BOOL v14 = 1;
    goto LABEL_17;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(BSCompoundAssertion *)self->_participantsAssertion context];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      if (objc_opt_respondsToSelector())
      {
        int v11 = [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
        int v12 = [v10 keyboardDismissalManager:self shouldPreventDismissalForTouch:v4 inWindow:v11];

        id v13 = SBLogKeyboardDismissal();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v16 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543874;
          v22 = v16;
          __int16 v23 = 2114;
          objc_super v24 = v10;
          __int16 v25 = 1024;
          int v26 = v12;
          _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ participantWantsPreventDismiss?: %{BOOL}u", buf, 0x1Cu);
        }
        if (v12) {
          goto LABEL_16;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

- (void)_reset
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_5();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ resetting touch tracking", v3, v4, v5, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchExpiryTimer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_participantsAssertion, 0);
  objc_storeStrong((id *)&self->_touchService, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
}

- (void)gestureRecognizer:shouldReceiveTouch:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_5();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ first check for preventDismissal", v3, v4, v5, v6, v7);
}

- (void)_didTap:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_5();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ starting expiry timer for successful tap", v3, v4, v5, v6, v7);
}

void __38__SBKeyboardDismissalManager__didTap___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  OUTLINED_FUNCTION_2_13(a1);
  uint64_t v4 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to receive touchUp; resetting",
    v5,
    0xCu);
}

- (void)gestureRecognizerTransitionedToFailed:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_5();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ resetting after failed tap", v3, v4, v5, v6, v7);
}

void __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_2_13(a1);
  uint64_t v1 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ resetting after touchUp", v4, v5, v6, v7, v8);
}

void __79__SBKeyboardDismissalManager_touchUpOccuredForIdentifier_detached_context_pid___block_invoke_cold_2(uint64_t a1)
{
  OUTLINED_FUNCTION_2_13(a1);
  uint64_t v1 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ no longer active; preventing dismiss", v4, v5, v6, v7, v8);
}

- (void)_shouldPreventDismissalForTouch:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_5();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ preventing dismiss as we're not active", v3, v4, v5, v6, v7);
}

@end