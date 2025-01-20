@interface SBAffordancePresenceController
- (BOOL)autoHideAffordance;
- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4;
- (SBAffordancePresenceController)initWithDelegate:(id)a3 windowScene:(id)a4;
- (SBAffordancePresenceControllerDelegate)delegate;
- (id)_animationSettingsForTransitionFromPresence:(int64_t)a3 toPresence:(int64_t)a4;
- (int64_t)_calculatePresence;
- (int64_t)currentPresence;
- (void)_unhideIfAutoHidden;
- (void)_updateIdleTouchAwarenessClient;
- (void)_updatePresence;
- (void)_updatePresence:(int64_t)a3 withAnimationSettings:(id)a4;
- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)setAutoHideAffordance:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation SBAffordancePresenceController

- (void)setAutoHideAffordance:(BOOL)a3
{
  if (self->_autoHideAffordance != a3)
  {
    self->_autoHideAffordance = a3;
    [(SBAffordancePresenceController *)self _updateIdleTouchAwarenessClient];
  }
}

- (SBAffordancePresenceController)initWithDelegate:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBAffordancePresenceController;
  v8 = [(SBAffordancePresenceController *)&v21 init];
  v9 = v8;
  if (v8)
  {
    [(SBAffordancePresenceController *)v8 setDelegate:v6];
    v9->_autoHideAffordance = 0;
    uint64_t v10 = +[SBAppSwitcherDomain rootSettings];
    appSwitcherSettings = v9->_appSwitcherSettings;
    v9->_appSwitcherSettings = (SBAppSwitcherSettings *)v10;

    uint64_t v12 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v9->_homeGrabberSettings;
    v9->_homeGrabberSettings = (SBFHomeGrabberSettings *)v12;

    [(SBFHomeGrabberSettings *)v9->_homeGrabberSettings addKeyPathObserver:v9];
    id v14 = objc_alloc_init(MEMORY[0x1E4F4E708]);
    v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [v15 UUIDString];
    [v14 setIdentifier:v16];

    [v14 setEventMask:8];
    [(SBFHomeGrabberSettings *)v9->_homeGrabberSettings autoHideTime];
    objc_msgSend(v14, "setAttentionLostTimeout:");
    v17 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v9->_idleTouchAwarenessClient;
    v9->_idleTouchAwarenessClient = v17;

    [(SBAttentionAwarenessClient *)v9->_idleTouchAwarenessClient setDelegate:v9];
    [(SBAttentionAwarenessClient *)v9->_idleTouchAwarenessClient setConfiguration:v14];
    objc_storeWeak((id *)&v9->_windowScene, v7);
    v19 = [v7 transientUIInteractionManager];
    [v19 registerParticipantForTapToUnhide:v9];
  }
  return v9;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "affordance=%p stopped observing touch idleness - dealloc", v2, v3, v4, v5, v6);
}

- (int64_t)_calculatePresence
{
  if ([(NSMutableSet *)self->_hiddenOverrides count]) {
    return 2;
  }
  if (![(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled]) {
    return 0;
  }
  int64_t touchState = self->_touchState;
  if (touchState == 2) {
    return 1;
  }
  else {
    return 2 * (touchState == 1);
  }
}

- (id)_animationSettingsForTransitionFromPresence:(int64_t)a3 toPresence:(int64_t)a4
{
  if (a3 && a4)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  if (a3 && !a4 || !a4 || a3)
  {
    uint8_t v6 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings unhideAnimationSettings];
  }
  else
  {
    if ([(NSMutableSet *)self->_hiddenOverrides count])
    {
      id v7 = [(SBAppSwitcherSettings *)self->_appSwitcherSettings animationSettings];
      v9 = [v7 statusBarFadeOutSettings];
      uint64_t v5 = [v9 BSAnimationSettings];

      goto LABEL_8;
    }
    uint8_t v6 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings hideAnimationSettings];
  }
  id v7 = v6;
  uint64_t v5 = [v6 BSAnimationSettings];
LABEL_8:

LABEL_9:
  return v5;
}

- (void)_updatePresence
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SBAffordancePresenceController _updatePresence]"];
    [v4 handleFailureInFunction:v5 file:@"SBAffordancePresenceController.m" lineNumber:136 description:@"this call must be made on the main thread"];
  }
  int64_t v3 = [(SBAffordancePresenceController *)self _calculatePresence];
  id v6 = [(SBAffordancePresenceController *)self _animationSettingsForTransitionFromPresence:self->_presence toPresence:v3];
  [(SBAffordancePresenceController *)self _updatePresence:v3 withAnimationSettings:v6];
}

- (void)_updateIdleTouchAwarenessClient
{
  BOOL autoHideAffordance = self->_autoHideAffordance;
  BOOL v4 = [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled];
  if (autoHideAffordance)
  {
    if (!v4)
    {
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient resetAttentionLostTimeout];
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:1];
      ++self->_lastInitialHideToken;
    }
  }
  else if (v4)
  {
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
    if (self->_touchState == 1)
    {
      self->_int64_t touchState = 0;
      [(SBAffordancePresenceController *)self _updatePresence];
    }
  }
}

- (void)_updatePresence:(int64_t)a3 withAnimationSettings:(id)a4
{
  id v6 = a4;
  int64_t presence = self->_presence;
  if ((a3 != 0) != (presence == 0))
  {
    if (a3 && presence != a3)
    {
      self->_int64_t presence = a3;
      if (a3 == 1)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_3;
        v16[3] = &unk_1E6AF4AC0;
        v16[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v16];
      }
      else if (a3 == 2)
      {
        [(NSMutableSet *)self->_outstandingVisibilityTransitionTokens count];
      }
    }
  }
  else
  {
    self->_int64_t presence = a3;
    v8 = NSNumber;
    ++self->_lastVisibilityTransitionToken;
    v9 = objc_msgSend(v8, "numberWithUnsignedInteger:");
    outstandingVisibilityTransitionTokens = self->_outstandingVisibilityTransitionTokens;
    if (outstandingVisibilityTransitionTokens)
    {
      [(NSMutableSet *)outstandingVisibilityTransitionTokens addObject:v9];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA80] setWithObject:v9];
      uint64_t v12 = self->_outstandingVisibilityTransitionTokens;
      self->_outstandingVisibilityTransitionTokens = v11;
    }
    v13 = [MEMORY[0x1E4F4F898] factoryWithSettings:v6];
    [v13 setAllowsAdditiveAnimations:1];
    id v14 = (void *)MEMORY[0x1E4F4F898];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke;
    v19[3] = &unk_1E6AF4A70;
    v19[4] = self;
    v19[5] = a3;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_2;
    v17[3] = &unk_1E6AF4A98;
    v17[4] = self;
    id v18 = v9;
    id v15 = v9;
    [v14 animateWithFactory:v13 options:4 actions:v19 completion:v17];
  }
}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 affordancePresenceController:*(void *)(a1 + 32) didChangeToPresence:*(void *)(a1 + 40)];
}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int64_t v3 = *(void **)(v2 + 72);
    *(void *)(v2 + 72) = 0;
  }
}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 affordancePresenceController:*(void *)(a1 + 32) didChangeToPresence:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)_unhideIfAutoHidden
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "affordance=%p touch idleness changed - preparing to stop asserting hidden after %fs", (uint8_t *)&v3, 0x16u);
}

uint64_t __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke(uint64_t result)
{
  id v2 = (void *)(result + 32);
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 16) == 2)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 40) == *(void *)(v1 + 32))
    {
      *(void *)(v1 + 16) = 0;
      [*(id *)(*v2 + 8) resetAttentionLostTimeout];
      uint64_t v4 = SBLogAffordancePresenceController();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke_cold_1(v2, v3, v4);
      }

      return [(id)*v2 _updatePresence];
    }
  }
  return result;
}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v21 = [NSString stringWithUTF8String:"-[SBAffordancePresenceController setHidden:forReason:animated:]"];
    [v20 handleFailureInFunction:v21 file:@"SBAffordancePresenceController.m" lineNumber:236 description:@"this call must be made on the main thread"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBAffordancePresenceController.m", 237, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [(NSMutableSet *)self->_hiddenOverrides count];
  hiddenOverrides = self->_hiddenOverrides;
  if (v6)
  {
    if (hiddenOverrides)
    {
      uint64_t v12 = (void *)[v9 copy];
      [(NSMutableSet *)hiddenOverrides addObject:v12];
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F1CA80];
      id v14 = (void *)[v9 copy];
      id v15 = [v13 setWithObject:v14];
      v16 = self->_hiddenOverrides;
      self->_hiddenOverrides = v15;
    }
  }
  else
  {
    [(NSMutableSet *)self->_hiddenOverrides removeObject:v9];
  }
  if ((v10 == 0) == ([(NSMutableSet *)self->_hiddenOverrides count] != 0))
  {
    v17 = SBLogAffordancePresenceController();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SBAffordancePresenceController setHidden:forReason:animated:]();
    }

    int64_t v18 = [(SBAffordancePresenceController *)self _calculatePresence];
    if (v5)
    {
      v19 = [(SBAffordancePresenceController *)self _animationSettingsForTransitionFromPresence:self->_presence toPresence:v18];
    }
    else
    {
      v19 = 0;
    }
    [(SBAffordancePresenceController *)self _updatePresence:v18 withAnimationSettings:v19];
  }
}

- (int64_t)currentPresence
{
  return self->_presence;
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a5, a6, a4) & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[SBAffordancePresenceController client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:]"];
    [v8 handleFailureInFunction:v9 file:@"SBAffordancePresenceController.m" lineNumber:265 description:@"this call must be made on the main thread"];
  }
  if ([(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled] && self->_touchState != 1)
  {
    self->_int64_t touchState = 1;
    uint64_t v7 = SBLogAffordancePresenceController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBAffordancePresenceController client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:]();
    }

    [(SBAffordancePresenceController *)self _updatePresence];
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4) & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SBAffordancePresenceController clientDidResetForUserAttention:withEvent:]"];
    [v5 handleFailureInFunction:v4 file:@"SBAffordancePresenceController.m" lineNumber:274 description:@"this call must be made on the main thread"];
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  [(SBAffordancePresenceController *)self _updatePresence];
  [(SBAffordancePresenceController *)self _updateIdleTouchAwarenessClient];
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  return 0;
}

- (SBAffordancePresenceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAffordancePresenceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)autoHideAffordance
{
  return self->_autoHideAffordance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_outstandingVisibilityTransitionTokens, 0);
  objc_storeStrong((id *)&self->_hiddenOverrides, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
}

void __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *(void *)(a2 + 48);
  OUTLINED_FUNCTION_2(&dword_1D85BA000, a2, a3, "affordance=%p touch idleness changed - stopped asserting hidden after %fs", *(const void **)v3, *(double *)&v3[8]);
}

- (void)setHidden:forReason:animated:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "affordance=%p local override - %{public}@ asserting hidden");
}

- (void)client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "affordance=%p touch idleness changed - started asserting hidden", v2, v3, v4, v5, v6);
}

@end