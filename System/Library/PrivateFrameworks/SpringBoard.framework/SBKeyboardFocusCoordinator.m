@interface SBKeyboardFocusCoordinator
+ (id)sharedInstance;
- (BOOL)_isAcceptableVisibilityBasedHostScene:(id)a3 forSBWindowScene:(id)a4;
- (BOOL)_setEnforcedKeyboardFocusPolicy:(id)a3;
- (BOOL)_talkToKeyboardArbiterAdvisor:(id)a3;
- (BOOL)eventDeferringManagerSystemShellBehavior:(id)a3 shouldSuppressRemoteRuleForOwningElement:(id)a4 inEnvironment:(id)a5;
- (BOOL)eventDeferringManagerSystemShellBehaviorWantsLocalCompatibilityRules;
- (BOOL)hasExternalSceneWithFocus;
- (BOOL)isHandlingKeyboardArbiterSuggestion;
- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3;
- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3;
- (BOOL)shouldPreventFocusForSceneWithIdentityTokenStringRepresentation:(id)a3;
- (BSCompoundAssertion)accessibilityKeyboardFocusTargetOverrides;
- (BSCompoundAssertion)appFocusRedirections;
- (BSCompoundAssertion)observers;
- (BSCompoundAssertion)preventFocusForSceneAssertion;
- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion;
- (BSInvalidatable)coalition_suppressKeyboardFocusEvaluationAssertion;
- (FBScene)externalSceneWithFocus;
- (FBScene)overlayUISceneRequestingFocus;
- (FBScene)sceneWithFocusIncludingSpringBoard;
- (NSMutableArray)userFocusRequestRuleUpdateCompletionHandlers;
- (NSMutableDictionary)focusServiceEventDeferralRequests;
- (NSSet)externalSceneIdentities;
- (SBInputUISceneController)inputUISceneController;
- (SBKeyboardFocusCoalition)coalition;
- (SBKeyboardFocusCoordinator)initWithPolicyEnforcer:(id)a3 sceneControllerFactory:(id)a4 coalitionFactory:(id)a5 sceneProvider:(id)a6 uiKitDependencyProvider:(id)a7 visibilityGraphNavigator:(id)a8;
- (SBKeyboardFocusPolicy)enforcedPolicy;
- (SBWindowScene)windowSceneWithFocus;
- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes;
- (id)_fixupFocusSceneRequest:(id)a3;
- (id)_init;
- (id)_sbWindowSceneHostingFBSSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4;
- (id)_sbWindowSceneHostingFBSSceneIdentityTokenString:(id)a3;
- (id)_sceneControllerForSBWindowScene:(id)a3;
- (id)_sceneControllerForScene:(id)a3;
- (id)_sceneControllerHostingSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4;
- (id)accessibilityOverrideTarget;
- (id)addKeyboardFocusObserver:(id)a3;
- (id)additionalEnvironmentDeferralsForFocusTarget:(id)a3;
- (id)appFocusRedirectionForProposedTarget:(id)a3;
- (id)bufferEventsForSpringBoardScene:(id)a3 reason:(id)a4;
- (id)deferAdditionalEnvironments:(id)a3 whenTargetHasKeyboardFocus:(id)a4;
- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4;
- (id)focusLockSpringBoardWindowScene:(id)a3 forAccessibilityReason:(id)a4;
- (id)focusLockSpringBoardWindowScene:(id)a3 forReason:(id)a4;
- (id)preventFocusForSceneWithIdentityToken:(id)a3 reason:(id)a4;
- (id)redirectFocusForReason:(id)a3 fromProcessIdentifier:(int)a4 fromSceneIdentityToken:(id)a5 toProcessIdentifier:(int)a6 toSceneIdentityToken:(id)a7 inContainingWindow:(id)a8;
- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5;
- (id)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(id)a3 forAccessibilityReason:(id)a4;
- (id)suppressKeyboardFocusEvaluationForReason:(id)a3;
- (id)systemUISceneRequestingFocus;
- (int)presentingKeyboardProcessIdentifier;
- (int64_t)eventDeferringManagerSystemShellBehavior:(id)a3 isRemoteRuleOwningElement:(id)a4 andContainingWindow:(id)a5 visibleComparedToLocalTargetWindow:(id)a6;
- (unint64_t)userFocusRequestGeneration;
- (void)_callUserFocusSceneRequestCompletionBlocksIfNeeded;
- (void)_handleFocusSceneChange:(id)a3 fromArbiter:(id)a4 request:(id)a5;
- (void)_notifyObserversExternalSceneDidAcquireFocus:(id)a3;
- (void)_notifyObserversFocusedWindowSceneChangedFrom:(id)a3 to:(id)a4;
- (void)_removeSceneFromRecents:(id)a3 reason:(id)a4;
- (void)_setNeedsArbitrationForKeyWindowNotification;
- (void)_setNeedsArbitrationForReason:(id)a3;
- (void)_updateCoalitionForSceneControllersAddedOrRemoved;
- (void)appendDescriptionToStream:(id)a3;
- (void)keyboardArbiterAdvisor:(id)a3 request:(id)a4 sceneFocusChange:(id)a5;
- (void)keyboardFocusCoalitionDidUpdateEnforcedPolicy:(id)a3;
- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4;
- (void)removeKeyboardFocusFromScene:(id)a3;
- (void)requestArbitrationForSBWindowScene:(id)a3 forReason:(id)a4;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5;
- (void)setAccessibilityKeyboardFocusTargetOverrides:(id)a3;
- (void)setAppFocusRedirections:(id)a3;
- (void)setCoalition:(id)a3;
- (void)setCoalition_suppressKeyboardFocusEvaluationAssertion:(id)a3;
- (void)setEnforcedPolicy:(id)a3;
- (void)setExternalSceneIdentities:(id)a3;
- (void)setExternalSceneWithFocus:(id)a3;
- (void)setFocusServiceEventDeferralRequests:(id)a3;
- (void)setHandlingKeyboardArbiterSuggestion:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setOverlayUISceneRequestingFocus:(id)a3;
- (void)setPreventFocusForSceneAssertion:(id)a3;
- (void)setRecentlyUsedScenes:(id)a3;
- (void)setSceneWithFocusIncludingSpringBoard:(id)a3;
- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3;
- (void)setUserFocusRequestRuleUpdateCompletionHandlers:(id)a3;
- (void)userFocusRequestForScene:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBKeyboardFocusCoordinator

- (BOOL)eventDeferringManagerSystemShellBehaviorWantsLocalCompatibilityRules
{
  return 0;
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v6 = [v5 scene];

  v7 = [v6 identityToken];
  v8 = [v6 clientHandle];
  v9 = [v8 processHandle];
  uint64_t v10 = [v9 pid];

  if ((int)v10 >= 1)
  {
    [(_SBRecentlyUsedSceneIdentityCache *)self->_recentlyUsedScenes addSceneIdentityToken:v7 forPID:v10];
    v11 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      recentlyUsedScenes = self->_recentlyUsedScenes;
      v13[0] = 67109634;
      v13[1] = v10;
      __int16 v14 = 2114;
      v15 = v7;
      __int16 v16 = 2114;
      v17 = recentlyUsedScenes;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[coordinator] didAddExternalForegroundApplicationSceneHandle pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)v13, 0x1Cu);
    }
  }
}

- (BOOL)shouldPreventFocusForSceneWithIdentityTokenStringRepresentation:(id)a3
{
  preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  id v4 = a3;
  id v5 = [(BSCompoundAssertion *)preventFocusForSceneAssertion context];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)systemUISceneRequestingFocus
{
  return self->_overlayUISceneRequestingFocus;
}

- (id)accessibilityOverrideTarget
{
  v2 = [(BSCompoundAssertion *)self->_accessibilityKeyboardFocusTargetOverrides orderedContext];
  v3 = [v2 lastObject];

  return v3;
}

- (id)appFocusRedirectionForProposedTarget:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(BSCompoundAssertion *)self->_appFocusRedirections orderedContext];
  id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v10 = [v9 fromProcessIdentifier];
        if ([v4 pid] == v10)
        {
          v11 = [v9 fromToken];
          uint64_t v12 = [v4 sceneIdentityToken];
          if (v12)
          {
            v13 = (void *)v12;
            __int16 v14 = [v4 sceneIdentityToken];
            char v15 = [v14 isEqual:v11];

            if (v15)
            {
              id v6 = v9;

              goto LABEL_14;
            }
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)_sbWindowSceneHostingFBSSceneIdentityTokenString:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v4 = [(id)SBApp windowSceneManager];
    id v5 = [v4 connectedWindowScenes];

    id obj = v5;
    uint64_t v25 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v8 = [v7 _FBSScene];
          v9 = [v8 identityToken];
          int v10 = [v9 stringRepresentation];
          int v11 = BSEqualObjects();

          if (v11)
          {
            id v21 = v7;
            goto LABEL_24;
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v12 = [v7 sceneManager];
          v13 = [v12 allScenes];

          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
LABEL_10:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = [*(id *)(*((void *)&v26 + 1) + 8 * v17) identityToken];
              long long v19 = [v18 stringRepresentation];
              char v20 = BSEqualObjects();

              if (v20) {
                break;
              }
              if (v15 == ++v17)
              {
                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
                if (v15) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }
            id v21 = v7;

            if (v21) {
              goto LABEL_24;
            }
          }
          else
          {
LABEL_16:
          }
        }
        id v21 = 0;
        uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v21 = 0;
    }
LABEL_24:
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 windowScene];
  id v6 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForScene:v5];
  uint64_t v7 = v6;
  if (v6) {
    char v8 = [v6 shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:v4];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)_sceneControllerForScene:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_sceneControllers;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "controlsScene:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)keyboardArbiterAdvisor:(id)a3 request:(id)a4 sceneFocusChange:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(SBKeyboardFocusCoordinator *)self _handleFocusSceneChange:v10 fromArbiter:v8 request:v9];
  }
  else
  {
    atomic_fetch_add((atomic_ullong *volatile)&self->_eventBufferingRequestGeneration, 1uLL);
    unint64_t v11 = atomic_load(&self->_eventBufferingRequestGeneration);
    long long v12 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = @"background keyboard arbiter request";
      __int16 v26 = 2048;
      unint64_t v27 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[coordinator] buffer all events for reason: %{public}@ <%lu>- begin", buf, 0x16u);
    }

    id v13 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    long long v14 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [v13 setEnvironment:v14];

    uint64_t v15 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager bufferEventsMatchingPredicate:v13 withReason:@"background keyboard arbiter request"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__SBKeyboardFocusCoordinator_keyboardArbiterAdvisor_request_sceneFocusChange___block_invoke;
    block[3] = &unk_1E6B0EEA8;
    block[4] = self;
    id v18 = v10;
    id v19 = v8;
    id v20 = v9;
    id v21 = @"background keyboard arbiter request";
    id v22 = v15;
    unint64_t v23 = v11;
    id v16 = v15;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_setNeedsArbitrationForKeyWindowNotification
{
  id v3 = +[SBKeyboardFocusArbitrationReason keyWindowNotification];
  [(SBKeyboardFocusCoordinator *)self _setNeedsArbitrationForReason:v3];
}

- (void)_setNeedsArbitrationForReason:(id)a3
{
}

uint64_t __78__SBKeyboardFocusCoordinator_keyboardArbiterAdvisor_request_sceneFocusChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _handleFocusSceneChange:*(void *)(a1 + 40) fromArbiter:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
  v2 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 80);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[coordinator] buffer all events for reason: %{public}@ <%lu> - end", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 72) invalidate];
}

- (void)keyboardFocusCoalitionDidUpdateEnforcedPolicy:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 enforcedPolicy];
  [(SBKeyboardFocusPolicyEnforcer *)self->_policyEnforcer enforce:v4];
  id v5 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy sbWindowSceneAncestor];
  int v6 = [v4 sbWindowSceneAncestor];
  BOOL v7 = [(SBKeyboardFocusCoordinator *)self _setEnforcedKeyboardFocusPolicy:v4];
  if (![(SBKeyboardFocusCoordinator *)self isHandlingKeyboardArbiterSuggestion])
  {
    __int16 v8 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy keyboardFocusTarget];
    int v9 = [v8 pid];
    pid_t v10 = getpid();

    if (v9 != v10 || [v4 advicePolicy])
    {
      unint64_t v11 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy keyboardFocusTarget];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76__SBKeyboardFocusCoordinator_keyboardFocusCoalitionDidUpdateEnforcedPolicy___block_invoke;
      v35[3] = &unk_1E6B0EE58;
      id v36 = v11;
      id v12 = v11;
      [(SBKeyboardFocusCoordinator *)self _talkToKeyboardArbiterAdvisor:v35];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = self->_sceneControllers;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    BOOL v29 = v7;
    long long v30 = v6;
    id v16 = v5;
    uint64_t v17 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) sbWindowSceneFocusTarget];
        id v20 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy keyboardFocusTarget];
        char v21 = [v19 isEqual:v20];

        if (v21)
        {
          int v22 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    int v22 = 0;
LABEL_15:
    id v5 = v16;
    int v6 = v30;
    BOOL v7 = v29;
  }
  else
  {
    int v22 = 0;
  }

  if (v7)
  {
    sceneProvider = self->_sceneProvider;
    uint64_t v24 = [v4 keyboardFocusTarget];
    uint64_t v25 = [(SBKeyboardFocusSceneProviding *)sceneProvider sceneForFocusTarget:v24];
    sceneWithFocusIncludingSpringBoard = self->_sceneWithFocusIncludingSpringBoard;
    self->_sceneWithFocusIncludingSpringBoard = v25;

    if ([v4 advicePolicy])
    {
      if (v22) {
        unint64_t v27 = 0;
      }
      else {
        unint64_t v27 = self->_sceneWithFocusIncludingSpringBoard;
      }
      uint64_t v28 = self->_sceneWithFocusIncludingSpringBoard;
      [(SBKeyboardFocusCoordinator *)self setExternalSceneWithFocus:v27];
      [(SBKeyboardFocusCoordinator *)self _notifyObserversExternalSceneDidAcquireFocus:v28];
    }
  }
  [(SBKeyboardFocusCoordinator *)self _callUserFocusSceneRequestCompletionBlocksIfNeeded];
  if (v5 != v6) {
    [(SBKeyboardFocusCoordinator *)self _notifyObserversFocusedWindowSceneChangedFrom:v5 to:v6];
  }
}

- (void)_handleFocusSceneChange:(id)a3 fromArbiter:(id)a4 request:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v11 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 pid];
    id v13 = [v8 sceneIdentity];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = v12;
    *(_WORD *)&v47[4] = 2114;
    *(void *)&v47[6] = v13;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[coordinator] handling new keyboard arbiter request pid: %d sceneIdentity: %{public}@", buf, 0x12u);
  }
  uint64_t v14 = [(SBKeyboardFocusCoordinator *)self _fixupFocusSceneRequest:v8];
  uint64_t v15 = [MEMORY[0x1E4F71DE0] focusNothingChange];
  char v16 = [v14 isEqual:v15];

  if (v16)
  {
    uint64_t v17 = 0;
LABEL_10:
    char v21 = [MEMORY[0x1E4F71DE0] focusNothingChange];
    int v22 = [v14 isEqual:v21];

    if (v22)
    {
      id v23 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy sbWindowSceneAncestor];
      if (v23)
      {
        id v19 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForSBWindowScene:v23];
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      uint64_t v24 = [v14 sceneIdentity];
      id v45 = 0;
      id v19 = [(SBKeyboardFocusCoordinator *)self _sceneControllerHostingSceneIdentityToken:v24 ultimateHostTarget:&v45];
      id v23 = v45;

      if (v23)
      {
        uint64_t v25 = SBLogKeyboardFocus();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)v47 = v17;
          *(_WORD *)&v47[8] = 2114;
          *(void *)&v47[10] = v23;
          _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[coordinator] S33KR3T target %{public}@ has an ultimate host %{public}@", buf, 0x16u);
        }

        id v23 = v23;
        uint64_t v17 = v23;
      }
    }

    if (!v19)
    {
      __int16 v26 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "[coordinator] could not find scene controller, picking one at random", buf, 2u);
      }

      id v19 = [(NSMutableSet *)self->_sceneControllers anyObject];
    }
    v44 = v14;
    id v27 = v8;
    uint64_t v28 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = [v19 debugName];
      *(_DWORD *)buf = 138543618;
      *(void *)v47 = v29;
      *(_WORD *)&v47[8] = 2114;
      *(void *)&v47[10] = v17;
      _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "[coordinator] informing scene controller '%{public}@' of focusTarget: %{public}@", buf, 0x16u);
    }
    long long v30 = v17;
    id v31 = v10;
    long long v32 = v9;

    v43 = v30;
    [v19 keyboardArbiterSuggestedFocusTarget:v30];
    [(SBKeyboardFocusCoordinator *)self setHandlingKeyboardArbiterSuggestion:1];
    long long v33 = +[SBKeyboardFocusArbitrationReason keyboardArbiterSuggestion];
    [v19 requestPolicyReevaluationForReason:v33];

    long long v34 = [(SBKeyboardFocusCoordinator *)self enforcedPolicy];
    v35 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [v34 keyboardFocusTarget];
      *(_DWORD *)buf = 138543618;
      *(void *)v47 = v27;
      *(_WORD *)&v47[8] = 2114;
      *(void *)&v47[10] = v36;
      _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "[coordinator] keyboard arbiter suggested %{public}@ and we replied %{public}@", buf, 0x16u);
    }
    id v37 = objc_alloc(MEMORY[0x1E4F71DE0]);
    uint64_t v38 = [v34 keyboardFocusTarget];
    v39 = [v38 sceneIdentityToken];
    v40 = [v34 keyboardFocusTarget];
    v41 = objc_msgSend(v37, "initWithSceneIdentity:pid:", v39, objc_msgSend(v40, "pid"));

    id v9 = v32;
    id v10 = v31;
    [v32 applySceneFocusChange:v41 forRequest:v31];
    [(SBKeyboardFocusCoordinator *)self setHandlingKeyboardArbiterSuggestion:0];
    [(SBKeyboardFocusCoordinator *)self _callUserFocusSceneRequestCompletionBlocksIfNeeded];

    id v8 = v27;
    uint64_t v17 = v43;
    uint64_t v14 = v44;
    goto LABEL_27;
  }
  id v18 = [v14 sceneIdentity];
  uint64_t v17 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v18, [v14 pid]);

  if (!v17) {
    goto LABEL_10;
  }
  id v19 = [(SBKeyboardFocusSceneProviding *)self->_sceneProvider sceneForFocusTarget:v17];
  if (![(SBKeyboardFocusSceneProviding *)self->_sceneProvider isOverlayUIScene:v19]
    || (overlayUISceneRequestingFocus = self->_overlayUISceneRequestingFocus) != 0
    && ([(FBScene *)overlayUISceneRequestingFocus isEqual:v19] & 1) != 0)
  {

    goto LABEL_10;
  }
  v42 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v47 = v17;
    _os_log_impl(&dword_1D85BA000, v42, OS_LOG_TYPE_DEFAULT, "[coordinator] denying request to focus OverlayUI target %{public}@ because OverlayUI hasn't requested focus!", buf, 0xCu);
  }

  long long v34 = [MEMORY[0x1E4F71DE0] focusNothingChange];
  [v9 applySceneFocusChange:v34 forRequest:v10];
LABEL_27:
}

- (void)setHandlingKeyboardArbiterSuggestion:(BOOL)a3
{
  self->_handlingKeyboardArbiterSuggestion = a3;
}

- (void)_callUserFocusSceneRequestCompletionBlocksIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_userFocusRequestRuleUpdateCompletionHandlers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_userFocusRequestRuleUpdateCompletionHandlers removeAllObjects];
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (id)_sceneControllerHostingSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    char v21 = a4;
    int v22 = self;
    uint64_t v7 = (void *)[(NSMutableSet *)self->_sceneControllers copy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v14 = [v13 sbWindowScene];
          uint64_t v15 = [v14 _FBSScene];
          char v16 = [v15 identityToken];
          char v17 = [v16 isEqual:v6];

          if (v17)
          {
            id v19 = v13;
            id v18 = v8;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v18 = [(SBKeyboardFocusCoordinator *)v22 _sbWindowSceneHostingFBSSceneIdentityToken:v6 ultimateHostTarget:v21];
    id v19 = [(SBKeyboardFocusCoordinator *)v22 _sceneControllerForSBWindowScene:v18];
LABEL_12:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_sceneControllerForSBWindowScene:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = self->_sceneControllers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
      if ([v10 controlsScene:v4]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_9:
  }
  int v12 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:]();
  }

  uint64_t v13 = [v4 keyboardFocusCoalitionAffinity];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = self->_sceneControllers;
  uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
LABEL_15:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
      if (v13 == objc_msgSend(v19, "coalitionAffinity", (void)v22)) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
    id v11 = v19;

    if (v11) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_21:
  }
  id v20 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardFocusCoordinator _sceneControllerForSBWindowScene:]();
  }

  id v11 = [(NSMutableSet *)self->_sceneControllers anyObject];
LABEL_26:

  return v11;
}

- (id)_sbWindowSceneHostingFBSSceneIdentityToken:(id)a3 ultimateHostTarget:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = [v6 stringRepresentation];
  id v9 = [(SBKeyboardFocusCoordinator *)self _sbWindowSceneHostingFBSSceneIdentityTokenString:v8];

  if (!v9)
  {
    uint64_t v10 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 stringRepresentation];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Searching the visibility graph for hosting information for %{public}@", (uint8_t *)&buf, 0xCu);
    }
    visibilityGraphNavigator = self->_visibilityGraphNavigator;
    if (!visibilityGraphNavigator)
    {
      uint64_t v13 = objc_alloc_init(SBKeyboardFocusVisibilityGraphNavigator);
      uint64_t v14 = self->_visibilityGraphNavigator;
      self->_visibilityGraphNavigator = v13;

      visibilityGraphNavigator = self->_visibilityGraphNavigator;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__131;
    id v37 = __Block_byref_object_dispose__131;
    id v38 = 0;
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__131;
    long long v28 = __Block_byref_object_dispose__131;
    id v29 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__SBKeyboardFocusCoordinator__sbWindowSceneHostingFBSSceneIdentityToken_ultimateHostTarget___block_invoke;
    v23[3] = &unk_1E6B0EE30;
    v23[4] = self;
    v23[5] = &buf;
    v23[6] = &v24;
    [(SBKeyboardFocusVisibilityGraphNavigator *)visibilityGraphNavigator reverseEnumerateChainContainingSceneIdentityToken:v7 block:v23];
    id v9 = *(id *)(*((void *)&buf + 1) + 40);
    *a4 = (id) v25[5];
    uint64_t v15 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v9 _FBSScene];
      uint64_t v17 = [v16 identityToken];
      uint64_t v18 = [v17 stringRepresentation];
      id v19 = (void *)v18;
      id v20 = (__CFString *)v25[5];
      if (!v20) {
        id v20 = @"<none>";
      }
      *(_DWORD *)long long v30 = 138543618;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      long long v33 = v20;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Visibility graph search found root scene %{public}@ and ultimate host %{public}@", v30, 0x16u);
    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&buf, 8);
    if (!v9)
    {
      char v21 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator _sbWindowSceneHostingFBSSceneIdentityToken:ultimateHostTarget:](v7, v21);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

  return v9;
}

- (id)_fixupFocusSceneRequest:(id)a3
{
  *(void *)&v28[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v4 pid];
  id v6 = [MEMORY[0x1E4F71DE0] focusNothingChange];
  char v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested nothing", (uint8_t *)&v27, 2u);
    }

    id v9 = -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
    uint64_t v10 = SBLogKeyboardFocus();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v27 = 138543362;
        *(void *)long long v28 = v9;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[coordinator] using MRU target %{public}@", (uint8_t *)&v27, 0xCu);
      }

LABEL_22:
      id v18 = objc_alloc(MEMORY[0x1E4F71DE0]);
      id v19 = [v9 sceneIdentityToken];
      id v15 = (id)objc_msgSend(v18, "initWithSceneIdentity:pid:", v19, objc_msgSend(v9, "pid"));

LABEL_23:
      goto LABEL_34;
    }
    if (v11)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[coordinator] no MRU scenes to fallback", (uint8_t *)&v27, 2u);
    }
    goto LABEL_31;
  }
  id v9 = [v4 sceneIdentity];
  int v12 = SBLogKeyboardFocus();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      int v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(void *)((char *)&v28[1] + 2) = v9;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested pid %d / %{public}@", (uint8_t *)&v27, 0x12u);
    }

    uint64_t v14 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(void *)((char *)&v28[1] + 2) = v9;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[coordinator] using arbiter suggested pid %d + scene: %{public}@", (uint8_t *)&v27, 0x12u);
    }

    id v15 = v4;
    goto LABEL_23;
  }
  if (v13)
  {
    int v27 = 67109120;
    v28[0] = v5;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "arbiter: arbiter requested pid %d / nil scene", (uint8_t *)&v27, 8u);
  }

  uint64_t v16 = -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForPID:]((uint64_t)self->_recentlyUsedScenes, v5);
  if (v16)
  {
    id v9 = (void *)v16;
    uint64_t v17 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138543362;
      *(void *)long long v28 = v9;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[coordinator] using arbiter requested MRU target: %{public}@", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_22;
  }
  uint64_t v10 = -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
  id v20 = SBLogKeyboardFocus();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v21)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "[coordinator] uh oh... no MRU scenes!", (uint8_t *)&v27, 2u);
    }

LABEL_31:
    uint64_t v24 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v4 sceneIdentity];
      int v27 = 67109378;
      v28[0] = v5;
      LOWORD(v28[1]) = 2114;
      *(void *)((char *)&v28[1] + 2) = v25;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[coordinator] failed to fixup arbiter requested pid %d / %{public}@", (uint8_t *)&v27, 0x12u);
    }
    id v15 = [MEMORY[0x1E4F71DE0] focusNothingChange];
    goto LABEL_34;
  }
  if (v21)
  {
    int v27 = 138543362;
    *(void *)long long v28 = v10;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "[coordinator] using MRU target %{public}@", (uint8_t *)&v27, 0xCu);
  }

  id v22 = objc_alloc(MEMORY[0x1E4F71DE0]);
  long long v23 = [v10 sceneIdentityToken];
  id v15 = (id)objc_msgSend(v22, "initWithSceneIdentity:pid:", v23, -[NSObject pid](v10, "pid"));

LABEL_34:
  return v15;
}

- (void)setExternalSceneWithFocus:(id)a3
{
}

- (BOOL)isHandlingKeyboardArbiterSuggestion
{
  return self->_handlingKeyboardArbiterSuggestion;
}

- (BOOL)_setEnforcedKeyboardFocusPolicy:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_enforcedPolicy = &self->_enforcedPolicy;
  char v7 = BSEqualObjects();
  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)p_enforcedPolicy, a3);
    uint64_t v8 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[coordinator] new enforced policy: %{public}@ ", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7 ^ 1;
}

- (void)_notifyObserversExternalSceneDidAcquireFocus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BSCompoundAssertion *)self->_observers context];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) keyboardFocusController:self externalSceneDidAcquireFocus:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)additionalEnvironmentDeferralsForFocusTarget:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_focusServiceEventDeferralRequests, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (FBScene)externalSceneWithFocus
{
  return self->_externalSceneWithFocus;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBKeyboardFocusCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_59 != -1) {
    dispatch_once(&sharedInstance_onceToken_59, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_9;
  return v2;
}

void __44__SBKeyboardFocusCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)sharedInstance_sharedInstance_9;
  sharedInstance_sharedInstance_9 = v1;
}

- (SBKeyboardFocusCoordinator)initWithPolicyEnforcer:(id)a3 sceneControllerFactory:(id)a4 coalitionFactory:(id)a5 sceneProvider:(id)a6 uiKitDependencyProvider:(id)a7 visibilityGraphNavigator:(id)a8
{
  id v39 = a3;
  id v38 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v45.receiver = self;
  v45.super_class = (Class)SBKeyboardFocusCoordinator;
  id v19 = [(SBKeyboardFocusCoordinator *)&v45 init];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    deliveryManager = v19->_deliveryManager;
    v19->_deliveryManager = (BKSHIDEventDeliveryManager *)v20;

    id v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sceneControllers = v19->_sceneControllers;
    v19->_sceneControllers = v22;

    objc_storeStrong((id *)&v19->_policyEnforcer, a3);
    objc_storeStrong((id *)&v19->_keyboardFocusSceneControllerFactory, a4);
    objc_storeStrong((id *)&v19->_keyboardFocusCoalitionFactory, a5);
    objc_storeStrong((id *)&v19->_sceneProvider, a6);
    uint64_t v24 = [v17 keyboardArbiterManager];
    keyboardArbiterManager = v19->_keyboardArbiterManager;
    v19->_keyboardArbiterManager = (UIKeyboardArbiterManager *)v24;

    objc_storeStrong((id *)&v19->_visibilityGraphNavigator, a8);
    uint64_t v26 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
    recentlyUsedScenes = v19->_recentlyUsedScenes;
    v19->_recentlyUsedScenes = v26;

    uint64_t v28 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"keyboardFocusObservers"];
    observers = v19->_observers;
    v19->_observers = (BSCompoundAssertion *)v28;

    long long v30 = v19->_observers;
    uint64_t v31 = SBLogKeyboardFocus();
    [(BSCompoundAssertion *)v30 setLog:v31];

    [v17 setSystemShellBehaviorDelegate:v19];
    __int16 v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v19 selector:sel__setNeedsArbitrationForKeyWindowNotification name:*MEMORY[0x1E4F43EF0] object:0];

    long long v33 = [(id)SBApp multiDisplayUserInteractionCoordinator];
    [v33 addActiveDisplayWindowSceneObserver:v19];

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke;
    v42[3] = &unk_1E6AF5290;
    v43 = v19;
    id v34 = v17;
    id v44 = v34;
    uint64_t v35 = (void (**)(void))MEMORY[0x1D948C7A0](v42);
    if ([v34 shouldInitAsync])
    {
      id v36 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke_2;
      block[3] = &unk_1E6AF5300;
      v41 = v35;
      dispatch_async(v36, block);
    }
    else
    {
      v35[2](v35);
    }
  }
  return v19;
}

void __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) inputUISceneController];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) launchAdvisorWithOmniscientDelegate:*(void *)(a1 + 32) sceneDelegate:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 96));
}

uint64_t __156__SBKeyboardFocusCoordinator_initWithPolicyEnforcer_sceneControllerFactory_coalitionFactory_sceneProvider_uiKitDependencyProvider_visibilityGraphNavigator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_init
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(SBKeyboardFocusSceneProvider);
  id v4 = [[SBKeyboardFocusSceneSettingPolicyEnforcer alloc] initWithSceneProvider:v3];
  uint64_t v5 = objc_alloc_init(SBAdditionalEnvironmentDeferralsPolicyEnforcer);
  uint64_t v6 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
  v14[0] = v4;
  v14[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = [(SBKeyboardFocusPolicyEnforcerPipeline *)v6 initWithEnforcers:v7];

  uint64_t v9 = objc_alloc_init(_SBKeyboardFocusSceneControllerFactory);
  long long v10 = objc_alloc_init(_SBKeyboardFocusCoalitionFactory);
  long long v11 = objc_alloc_init(_SBKeyboardFocusUIKitDependency);
  long long v12 = [(SBKeyboardFocusCoordinator *)self initWithPolicyEnforcer:v8 sceneControllerFactory:v9 coalitionFactory:v10 sceneProvider:v3 uiKitDependencyProvider:v11 visibilityGraphNavigator:0];

  [(SBAdditionalEnvironmentDeferralsPolicyEnforcer *)v5 setDelegate:v12];
  return v12;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v11 = v5;
  long long v12 = self;
  [v5 appendProem:self block:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke_2;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  [v6 appendBodySectionWithName:0 block:v7];
}

void __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 200) keyboardFocusTarget];
  id v2 = (id)[v1 appendObject:v3 withName:@"target"];
}

id __56__SBKeyboardFocusCoordinator_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 200) withName:@"enforcedPolicy"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 192) withName:@"coalition"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:@"externalSceneWithFocus"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 120) withName:@"sceneWithFocusIncludingSpringBoard"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 224) withName:@"overlayUISceneRequestingFocus"];
}

- (BOOL)hasExternalSceneWithFocus
{
  return self->_externalSceneWithFocus != 0;
}

- (SBWindowScene)windowSceneWithFocus
{
  return [(SBKeyboardFocusPolicy *)self->_enforcedPolicy sbWindowSceneAncestor];
}

- (SBInputUISceneController)inputUISceneController
{
  return self->_inputUISceneController;
}

- (unint64_t)userFocusRequestGeneration
{
  return self->_userFocusRequestGeneration;
}

- (void)windowSceneDidConnect:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[coordinator] scene connected: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(_SBKeyboardFocusSceneControllerFactory *)self->_keyboardFocusSceneControllerFactory newKeyboardFocusSceneControllerForScene:v4 deliveryManager:self->_deliveryManager sceneProvider:self->_sceneProvider];
  [v6 setDelegate:self];
  if (!v6)
  {
    id v8 = [NSString stringWithFormat:@"We need a keyboard focus scene controller"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator windowSceneDidConnect:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB87ECLL);
  }
  [(NSMutableSet *)self->_sceneControllers addObject:v6];
  uint64_t v7 = [v4 sceneManager];
  [v7 addObserver:self];

  [(SBKeyboardFocusCoordinator *)self _updateCoalitionForSceneControllersAddedOrRemoved];
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[coordinator] scene disconnected: %@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_sceneControllers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v17;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v17 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
    long long v12 = [v11 sbWindowScene];
    char v13 = [v4 isEqual:v12];

    if (v13) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v8) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }
  id v15 = v11;

  if (!v15)
  {
LABEL_12:
    uint64_t v14 = [NSString stringWithFormat:@"no such scene <%@: %p>", objc_opt_class(), v4, (void)v16];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator windowSceneDidDisconnect:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB899CLL);
  }
  [v15 invalidate];
  [(NSMutableSet *)self->_sceneControllers removeObject:v15];
  [(SBKeyboardFocusCoordinator *)self _updateCoalitionForSceneControllersAddedOrRemoved];
}

- (id)addKeyboardFocusObserver:(id)a3
{
  observers = self->_observers;
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"%@-%p", objc_opt_class(), v5];
  uint64_t v7 = [(BSCompoundAssertion *)observers acquireForReason:v6 withContext:v5];

  return v7;
}

- (id)bufferEventsForSpringBoardScene:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:]();
    }
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v6)
  {
    uint64_t v9 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForScene:v6];
    if (v9)
    {
      uint64_t v10 = v9;
      atomic_fetch_add((atomic_ullong *volatile)&self->_eventBufferingRequestGeneration, 1uLL);
      unint64_t v11 = atomic_load(&self->_eventBufferingRequestGeneration);
      long long v12 = [v9 bufferEventsForReason:v8 generation:v11];

      goto LABEL_8;
    }
    long long v16 = NSString;
    long long v17 = [v6 _sceneIdentifier];
    id v15 = [v16 stringWithFormat:@"[coordinator] buffer events requested but we don't have a matching sceneController for its windowScene %@", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:]();
    }
LABEL_16:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB8BF4);
  }
  char v13 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardFocusCoordinator bufferEventsForSpringBoardScene:reason:]();
  }

  long long v12 = 0;
LABEL_8:

  return v12;
}

- (id)deferAdditionalEnvironments:(id)a3 whenTargetHasKeyboardFocus:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  focusServiceEventDeferralRequests = self->_focusServiceEventDeferralRequests;
  if (!focusServiceEventDeferralRequests)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = self->_focusServiceEventDeferralRequests;
    self->_focusServiceEventDeferralRequests = v9;

    focusServiceEventDeferralRequests = self->_focusServiceEventDeferralRequests;
  }
  [(NSMutableDictionary *)focusServiceEventDeferralRequests setObject:v6 forKey:v7];
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  long long v12 = [MEMORY[0x1E4F29128] UUID];
  char v13 = [v12 UUIDString];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke;
  long long v25 = &unk_1E6B0EDE0;
  objc_copyWeak(&v28, &location);
  id v14 = v6;
  id v26 = v14;
  id v15 = v7;
  id v27 = v15;
  long long v16 = (void *)[v11 initWithIdentifier:v13 forReason:@"focus service requesting deferral" invalidationBlock:&v22];

  long long v17 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v31 = v14;
    __int16 v32 = 2114;
    id v33 = v15;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[coordinator] deferKeyboardEventsForEnvironment: adding requested deferrals for environments: %{public}@ when target %{public}@ has focus", buf, 0x16u);
  }

  long long v18 = +[SBKeyboardFocusArbitrationReason deferAdditionalEnvironments];
  [(SBKeyboardFocusCoordinator *)self _setNeedsArbitrationForReason:v18];

  policyEnforcer = self->_policyEnforcer;
  uint64_t v20 = [(SBKeyboardFocusCoalition *)self->_coalition enforcedPolicy];
  [(SBKeyboardFocusPolicyEnforcer *)policyEnforcer enforce:v20];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v16;
}

void __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, a1 + 6);
  id v4 = a1[4];
  id v5 = a1[5];
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __85__SBKeyboardFocusCoordinator_deferAdditionalEnvironments_whenTargetHasKeyboardFocus___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[coordinator] deferKeyboardEventsForEnvironment: removing requested deferrals for environments: %{public}@ when target %{public}@ has focus", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [WeakRetained focusServiceEventDeferralRequests];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];

  id v7 = +[SBKeyboardFocusArbitrationReason deferAdditionalEnvironments];
  [WeakRetained _setNeedsArbitrationForReason:v7];

  id v8 = WeakRetained[6];
  uint64_t v9 = [WeakRetained[24] enforcedPolicy];
  [v8 enforce:v9];
}

- (void)removeKeyboardFocusFromScene:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = v4;
  NSClassFromString(&cfstr_Fbscene.isa);
  if (!v5)
  {
    uint64_t v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator removeKeyboardFocusFromScene:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB9430);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator removeKeyboardFocusFromScene:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB9494);
  }

  id v6 = +[SBKeyboardFocusTarget targetForFBScene:v5];
  id v7 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    long long v30 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[coordinator] removeKeyboardFocusFromScene: target %{public}@", buf, 0xCu);
  }

  [(SBKeyboardFocusCoordinator *)self _removeSceneFromRecents:v5 reason:@"removeKeyboardFocusFromScene"];
  overlayUISceneRequestingFocus = self->_overlayUISceneRequestingFocus;
  if (overlayUISceneRequestingFocus)
  {
    uint64_t v9 = [(FBScene *)overlayUISceneRequestingFocus identityToken];
    int v10 = [v5 identityToken];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      __int16 v12 = self->_overlayUISceneRequestingFocus;
      self->_overlayUISceneRequestingFocus = 0;
    }
  }
  uint64_t v13 = (void *)[(NSMutableSet *)self->_sceneControllers copy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  long long v16 = v14;
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v17 = v15;
  LOBYTE(v18) = 0;
  uint64_t v19 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v25 != v19) {
        objc_enumerationMutation(v14);
      }
      if (v18) {
        int v18 = 1;
      }
      else {
        int v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) removeKeyboardFocusFromScene:v5];
      }
    }
    uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v17);

  if (v18)
  {
    BOOL v21 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v30 = v6;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[coordinator] removeKeyboardFocusFromScene: target %{public}@ was focus target, requesting full arbitration", buf, 0xCu);
    }

    long long v16 = +[SBKeyboardFocusArbitrationReason didRemoveKeyboardFocusFromScene];
    [(SBKeyboardFocusCoordinator *)self _setNeedsArbitrationForReason:v16];
LABEL_22:
  }
}

- (void)userFocusRequestForScene:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v12 = v9;
  NSClassFromString(&cfstr_Fbscene.isa);
  if (!v12)
  {
    id v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB9814);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB9878);
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    long long v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB98DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EB9940);
  }

  id v14 = [v12 clientHandle];
  uint64_t v15 = [v14 processHandle];
  uint64_t v16 = [v15 pid];

  if ((int)v16 <= 0)
  {
    uint64_t v17 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator userFocusRequestForScene:reason:completion:]();
    }
  }
  else
  {
    uint64_t v17 = [v12 identityToken];
    int v18 = +[SBKeyboardFocusTarget targetForFBScene:v12];
    uint64_t v19 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v33 = v18;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[coordinator] userFocusRequestForScene: requesting target %{public}@ for reason:%{public}@", buf, 0x16u);
    }

    ++self->_userFocusRequestGeneration;
    int v20 = [(SBKeyboardFocusSceneProviding *)self->_sceneProvider isOverlayUIScene:v12];
    if (v20)
    {
      BOOL v21 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[coordinator] userFocusRequestForScene: high priority scene!", buf, 2u);
      }

      objc_storeStrong((id *)&self->_overlayUISceneRequestingFocus, a3);
    }
    [(UIKeyboardArbiterManager *)self->_keyboardArbiterManager userSelectedProcessIdentifier:v16 withSceneIdentity:v17 onCompletion:&__block_literal_global_423];
    if (v11)
    {
      if ((([(SBKeyboardFocusPolicy *)self->_enforcedPolicy advicePolicy] == 0) & ~v20) != 0
        || ([(SBKeyboardFocusPolicy *)self->_enforcedPolicy keyboardFocusTarget],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v18 isEqual:v22],
            v22,
            v23))
      {
        v11[2](v11, 1);
      }
      else
      {
        userFocusRequestRuleUpdateCompletionHandlers = self->_userFocusRequestRuleUpdateCompletionHandlers;
        if (!userFocusRequestRuleUpdateCompletionHandlers)
        {
          long long v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v26 = self->_userFocusRequestRuleUpdateCompletionHandlers;
          self->_userFocusRequestRuleUpdateCompletionHandlers = v25;

          userFocusRequestRuleUpdateCompletionHandlers = self->_userFocusRequestRuleUpdateCompletionHandlers;
        }
        long long v27 = (void *)MEMORY[0x1D948C7A0](v11);
        [(NSMutableArray *)userFocusRequestRuleUpdateCompletionHandlers addObject:v27];
      }
    }
  }
}

- (id)suppressKeyboardFocusEvaluationForReason:(id)a3
{
  id v4 = a3;
  suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  if (!suppressKeyboardFocusEvaluationAssertion)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __71__SBKeyboardFocusCoordinator_suppressKeyboardFocusEvaluationForReason___block_invoke;
    int v18 = &unk_1E6AF92D8;
    objc_copyWeak(&v19, &location);
    id v7 = [v6 assertionWithIdentifier:@"SBKeyboardFocusCoordinator-keyboardFocusEvaluationSuppression" stateDidChangeHandler:&v15];
    id v8 = self->_suppressKeyboardFocusEvaluationAssertion;
    self->_suppressKeyboardFocusEvaluationAssertion = v7;

    id v9 = self->_suppressKeyboardFocusEvaluationAssertion;
    id v10 = SBLogKeyboardFocus();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v15, v16, v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  }
  int v11 = [(BSCompoundAssertion *)suppressKeyboardFocusEvaluationAssertion acquireForReason:v4];
  if (!self->_coalition_suppressKeyboardFocusEvaluationAssertion)
  {
    id v12 = [(SBKeyboardFocusCoalition *)self->_coalition suppressKeyboardFocusEvaluationForReason:@"SBKeyboardFocusCoordinatorRequested"];
    coalition_suppressKeyboardFocusEvaluationAssertion = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
    self->_coalition_suppressKeyboardFocusEvaluationAssertion = v12;
  }
  return v11;
}

void __71__SBKeyboardFocusCoordinator_suppressKeyboardFocusEvaluationForReason___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isActive] & 1) == 0)
  {
    id v3 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "finished suppressing keyboard focus evaluation, time to re-evaluate", v7, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      [*((id *)WeakRetained + 18) invalidate];
      id v6 = (void *)v5[18];
      v5[18] = 0;
    }
  }
}

- (id)preventFocusForSceneWithIdentityToken:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  if (!preventFocusForSceneAssertion)
  {
    objc_initWeak(&location, self);
    id v9 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __75__SBKeyboardFocusCoordinator_preventFocusForSceneWithIdentityToken_reason___block_invoke;
    int v20 = &unk_1E6AF92D8;
    objc_copyWeak(&v21, &location);
    id v10 = [v9 assertionWithIdentifier:@"SBWorkspaceKeyboardFocusPreventFocusForPID" stateDidChangeHandler:&v17];
    int v11 = self->_preventFocusForSceneAssertion;
    self->_preventFocusForSceneAssertion = v10;

    id v12 = self->_preventFocusForSceneAssertion;
    id v13 = SBLogKeyboardFocus();
    -[BSCompoundAssertion setLog:](v12, "setLog:", v13, v17, v18, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    preventFocusForSceneAssertion = self->_preventFocusForSceneAssertion;
  }
  id v14 = [v6 stringRepresentation];
  uint64_t v15 = [(BSCompoundAssertion *)preventFocusForSceneAssertion acquireForReason:v7 withContext:v14];

  return v15;
}

void __75__SBKeyboardFocusCoordinator_preventFocusForSceneWithIdentityToken_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = +[SBKeyboardFocusArbitrationReason preventFocusForPID];
  [WeakRetained _setNeedsArbitrationForReason:v1];
}

- (id)redirectFocusForReason:(id)a3 fromProcessIdentifier:(int)a4 fromSceneIdentityToken:(id)a5 toProcessIdentifier:(int)a6 toSceneIdentityToken:(id)a7 inContainingWindow:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (!v15)
  {
    uint64_t v18 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator redirectFocusForReason:fromProcessIdentifier:fromSceneIdentityToken:toProcessIdentifier:toSceneIdentityToken:inContainingWindow:](v12, v18);
    }
  }
  id v19 = objc_alloc_init(SBKeyboardFocusRedirection);
  [(SBKeyboardFocusRedirection *)v19 setReason:v14];
  [(SBKeyboardFocusRedirection *)v19 setFromProcessIdentifier:v12];
  [(SBKeyboardFocusRedirection *)v19 setFromToken:v15];
  [(SBKeyboardFocusRedirection *)v19 setToProcessIdentifier:v10];
  [(SBKeyboardFocusRedirection *)v19 setToToken:v16];
  [(SBKeyboardFocusRedirection *)v19 setContainingWindow:v17];
  appFocusRedirections = self->_appFocusRedirections;
  if (!appFocusRedirections)
  {
    objc_initWeak(&location, self);
    id v21 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    long long v30 = __158__SBKeyboardFocusCoordinator_redirectFocusForReason_fromProcessIdentifier_fromSceneIdentityToken_toProcessIdentifier_toSceneIdentityToken_inContainingWindow___block_invoke;
    uint64_t v31 = &unk_1E6AF92D8;
    objc_copyWeak(&v32, &location);
    uint64_t v22 = [v21 assertionWithIdentifier:@"appFocusRedirections" stateDidChangeHandler:&v28];
    int v23 = self->_appFocusRedirections;
    self->_appFocusRedirections = v22;

    long long v24 = self->_appFocusRedirections;
    long long v25 = SBLogKeyboardFocus();
    -[BSCompoundAssertion setLog:](v24, "setLog:", v25, v28, v29, v30, v31);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    appFocusRedirections = self->_appFocusRedirections;
  }
  long long v26 = [(BSCompoundAssertion *)appFocusRedirections acquireForReason:v14 withContext:v19];

  return v26;
}

void __158__SBKeyboardFocusCoordinator_redirectFocusForReason_fromProcessIdentifier_fromSceneIdentityToken_toProcessIdentifier_toSceneIdentityToken_inContainingWindow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = +[SBKeyboardFocusArbitrationReason appFocusRedirections];
  [WeakRetained _setNeedsArbitrationForReason:v1];
}

- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    int v11 = (void *)[(NSMutableSet *)self->_sceneControllers copy];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) redirectSpringBoardLockFocusForReason:v8 toProcessidentifier:v6 toSceneIdentityToken:v9];
          [v10 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v19 = [NSString stringWithFormat:@"Coordinator:redirectSpringBoardLockFocusForReason: %@", v8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __109__SBKeyboardFocusCoordinator_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke;
    v23[3] = &unk_1E6AF4940;
    id v24 = v10;
    id v20 = v10;
    id v21 = (void *)[v18 initWithIdentifier:v19 forReason:v8 invalidationBlock:v23];
  }
  else
  {
    uint64_t v12 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v31 = v8;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[coordinator] error: redirectSpringBoardLockFocusForReason for reason %{public}@ with no token. PID-only rules are not valid", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

void __109__SBKeyboardFocusCoordinator_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v8 = [v6 windowScene];
    uint64_t v9 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForScene:v8];
    if (!v9)
    {
      id v16 = [NSString stringWithFormat:@"[coordinator] request focus lock for SB window %@ but we don't have a matching sceneController for it's windowScene %@", v6, v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8EBA4FCLL);
    }
    uint64_t v10 = (void *)v9;
    id v11 = v7;
    if (!v11)
    {
      id v17 = NSString;
      objc_opt_class();
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      id v20 = [v17 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v19];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8EBA584);
    }
    uint64_t v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = NSString;
      uint64_t v22 = (objc_class *)[v12 classForCoder];
      if (!v22) {
        uint64_t v22 = (objc_class *)objc_opt_class();
      }
      int v23 = NSStringFromClass(v22);
      objc_opt_class();
      id v24 = (objc_class *)objc_opt_class();
      long long v25 = NSStringFromClass(v24);
      long long v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v23, v25];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindow:forReason:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8EBA630);
    }

    uint64_t v13 = [v10 focusLockSpringBoardWindow:v6 forReason:v12];
  }
  else
  {
    uint64_t v14 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v28 = v7;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[coordinator] error: focusLockSpringBoardWindow for reason %{public}@ with nil window", buf, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (id)focusLockSpringBoardWindowScene:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForScene:v6];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = v7;
      if (!v10)
      {
        id v16 = NSString;
        objc_opt_class();
        id v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        id v19 = [v16 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v18];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:]();
        }
        [v19 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D8EBA824);
      }
      id v11 = v10;
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        uint64_t v12 = [v9 focusLockSpringBoardForReason:v11];

        goto LABEL_9;
      }
      id v20 = NSString;
      id v21 = (objc_class *)[v11 classForCoder];
      if (!v21) {
        id v21 = (objc_class *)objc_opt_class();
      }
      uint64_t v22 = NSStringFromClass(v21);
      objc_opt_class();
      int v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      uint64_t v15 = [v20 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v22, v24];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:]();
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"[coordinator] request focus lock for SB window scene %@ but we don't have a matching sceneController for its windowScene", v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:]();
      }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EBA79CLL);
  }
  uint64_t v13 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardFocusCoordinator focusLockSpringBoardWindowScene:forReason:]();
  }

  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

- (void)requestArbitrationForSBWindowScene:(id)a3 forReason:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v10 = v6;
    id v7 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForScene:a3];
    uint64_t v8 = [v7 description];
    uint64_t v9 = [v10 annotatedWithSourceName:v8];

    id v6 = (id)v9;
  }
  id v11 = v6;
  [(SBKeyboardFocusCoordinator *)self _setNeedsArbitrationForReason:v6];
}

- (int)presentingKeyboardProcessIdentifier
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__SBKeyboardFocusCoordinator_presentingKeyboardProcessIdentifier__block_invoke;
  v4[3] = &unk_1E6B0EE08;
  v4[4] = &v5;
  [(SBKeyboardFocusCoordinator *)self _talkToKeyboardArbiterAdvisor:v4];
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __65__SBKeyboardFocusCoordinator_presentingKeyboardProcessIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 presentingKeyboardProcessIdentifier];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)focusLockSpringBoardWindowScene:(id)a3 forAccessibilityReason:(id)a4
{
  id v6 = a3;
  uint64_t v7 = +[SBKeyboardFocusLockReason accessibility:a4];
  int v8 = [(SBKeyboardFocusCoordinator *)self focusLockSpringBoardWindowScene:v6 forReason:v7];

  return v8;
}

- (id)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(id)a3 forAccessibilityReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = NSString;
  objc_opt_class();
  id v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    uint64_t v22 = NSStringFromClass(v11);
    int v23 = [v10 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"tokenString", v22];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:](a2);
    }
LABEL_20:
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8EBAD6CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = NSString;
    long long v25 = (objc_class *)[v9 classForCoder];
    if (!v25) {
      long long v25 = (objc_class *)objc_opt_class();
    }
    long long v26 = NSStringFromClass(v25);
    objc_opt_class();
    long long v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    int v23 = [v24 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"tokenString", v26, v28];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:](a2);
    }
    goto LABEL_20;
  }

  uint64_t v12 = [(SBKeyboardFocusSceneProviding *)self->_sceneProvider sceneForIdentityTokenStringRepresentation:v9];
  if (v12)
  {
    accessibilityKeyboardFocusTargetOverrides = self->_accessibilityKeyboardFocusTargetOverrides;
    if (!accessibilityKeyboardFocusTargetOverrides)
    {
      objc_initWeak(&location, self);
      uint64_t v14 = (void *)MEMORY[0x1E4F4F6E8];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __120__SBKeyboardFocusCoordinator_requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation_forAccessibilityReason___block_invoke;
      v29[3] = &unk_1E6B0CF28;
      objc_copyWeak(&v31, &location);
      id v30 = v8;
      uint64_t v15 = [v14 assertionWithIdentifier:@"accessibilityKeyboardArbiterOverrides" stateDidChangeHandler:v29];
      id v16 = self->_accessibilityKeyboardFocusTargetOverrides;
      self->_accessibilityKeyboardFocusTargetOverrides = v15;

      id v17 = self->_accessibilityKeyboardFocusTargetOverrides;
      id v18 = SBLogKeyboardFocus();
      [(BSCompoundAssertion *)v17 setLog:v18];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      accessibilityKeyboardFocusTargetOverrides = self->_accessibilityKeyboardFocusTargetOverrides;
    }
    id v19 = +[SBKeyboardFocusTarget targetForFBScene:v12];
    id v20 = [(BSCompoundAssertion *)accessibilityKeyboardFocusTargetOverrides acquireForReason:v8 withContext:v19];
  }
  else
  {
    id v19 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinator requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:]();
    }
    id v20 = 0;
  }

  return v20;
}

void __120__SBKeyboardFocusCoordinator_requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation_forAccessibilityReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = +[SBKeyboardFocusArbitrationReason accessibility:*(void *)(a1 + 32)];
  [WeakRetained _setNeedsArbitrationForReason:v2];
}

- (BOOL)_isAcceptableVisibilityBasedHostScene:(id)a3 forSBWindowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 identityToken];
  id v8 = [v6 _FBSScene];

  id v9 = [v8 identityToken];
  char v10 = [v9 isEqual:v7];

  if ((v10 & 1) == 0
    && ((-[SBKeyboardFocusSceneProviding anyConnectedSBWindowSceneContainsSceneIdentity:](self->_sceneProvider, "anyConnectedSBWindowSceneContainsSceneIdentity:", v7) & 1) != 0|| (-[SBKeyboardFocusSceneProviding isSystemUISceneIdentityToken:](self->_sceneProvider, "isSystemUISceneIdentityToken:", v7) & 1) != 0|| (externalSceneIdentities = self->_externalSceneIdentities, [v7 stringRepresentation], uint64_t v14 = objc_claimAutoreleasedReturnValue(), LOBYTE(externalSceneIdentities) = -[NSSet containsObject:](externalSceneIdentities, "containsObject:", v14), v14, (externalSceneIdentities & 1) != 0)))
  {
    BOOL v12 = 1;
  }
  else
  {
    id v11 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "unacceptable host scene: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __92__SBKeyboardFocusCoordinator__sbWindowSceneHostingFBSSceneIdentityToken_ultimateHostTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _sbWindowSceneHostingFBSSceneIdentityTokenString:v14];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 32) sceneForIdentityTokenStringRepresentation:v14];
    if (v9
      && [*(id *)(a1 + 32) _isAcceptableVisibilityBasedHostScene:v9 forSBWindowScene:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
    {
      uint64_t v10 = +[SBKeyboardFocusTarget targetForFBScene:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    *a4 = 1;
  }
  return MEMORY[0x1F4181820]();
}

- (void)_updateCoalitionForSceneControllersAddedOrRemoved
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager transactionAssertionWithReason:@"Updating Coalition"];
  uint64_t v4 = self->_coalition;
  uint64_t v5 = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
  uint64_t v6 = (void *)[(NSMutableSet *)self->_sceneControllers copy];
  uint64_t v7 = [(_SBKeyboardFocusCoalitionFactory *)self->_keyboardFocusCoalitionFactory newCoalitionForSceneControllers:v6];
  coalition = self->_coalition;
  self->_coalition = v7;

  if ([(BSCompoundAssertion *)self->_suppressKeyboardFocusEvaluationAssertion isActive])
  {
    id v9 = [(SBKeyboardFocusCoalition *)self->_coalition suppressKeyboardFocusEvaluationForReason:@"SBKeyboardFocusCoordinatorRequested"];
    coalition_suppressKeyboardFocusEvaluationAssertion = self->_coalition_suppressKeyboardFocusEvaluationAssertion;
    self->_coalition_suppressKeyboardFocusEvaluationAssertion = v9;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "setCoalition:", self->_coalition, (void)v17);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  [(SBKeyboardFocusCoalition *)self->_coalition setDelegate:self];
  [(SBKeyboardFocusCoalition *)v4 invalidate];
  [(BSInvalidatable *)v5 invalidate];
  int v16 = +[SBKeyboardFocusArbitrationReason didResetCoalition];
  [(SBKeyboardFocusCoordinator *)self _setNeedsArbitrationForReason:v16];

  [v3 invalidate];
}

- (void)_notifyObserversFocusedWindowSceneChangedFrom:(id)a3 to:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSCompoundAssertion *)self->_observers context];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 keyboardFocusController:self didUpdateWindowSceneWithFocusFrom:v6 to:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)_talkToKeyboardArbiterAdvisor:(id)a3
{
  uint64_t v4 = (void (**)(id, _UIKeyboardArbiterAdvisor *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_arbiterDidInitialize);
  if (v5) {
    v4[2](v4, self->_keyboardArbiterAdvisor);
  }

  return v5 & 1;
}

- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5
{
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!a5)
  {
    id v7 = [v8 scene];
    [(SBKeyboardFocusCoordinator *)self _removeSceneFromRecents:v7 reason:@"willRemoveExternalForegroundApplicationSceneHandle"];
  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unsigned __int8 v5 = [v7 scene];
  if ([v5 isValid])
  {
    id v6 = [v7 scene];
    [(SBKeyboardFocusCoordinator *)self _removeSceneFromRecents:v6 reason:@"didRemoveExternalForegroundApplicationSceneHandle"];
  }
}

- (void)_removeSceneFromRecents:(id)a3 reason:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identityToken];
  uint64_t v9 = [v7 clientHandle];

  uint64_t v10 = [v9 processHandle];
  uint64_t v11 = [v10 pid];

  [(_SBRecentlyUsedSceneIdentityCache *)self->_recentlyUsedScenes removeSceneIdentityToken:v8 forPID:v11];
  uint64_t v12 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    recentlyUsedScenes = self->_recentlyUsedScenes;
    int v14 = 138413058;
    id v15 = v6;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    id v21 = recentlyUsedScenes;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[coordinator] _removeSceneFromRecents %@ pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)&v14, 0x26u);
  }
}

- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4
{
  id v4 = [(SBKeyboardFocusCoordinator *)self _sceneControllerForSBWindowScene:a4];
  [v4 displayDidBecomeActive];
}

void __76__SBKeyboardFocusCoordinator_keyboardFocusCoalitionDidUpdateEnforcedPolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 pid];
  id v6 = [*(id *)(a1 + 32) sceneIdentityToken];
  [v4 keyboardFocusDidChangeWithoutAdvisorInputToPid:v5 sceneIdentity:v6];
}

- (BOOL)eventDeferringManagerSystemShellBehavior:(id)a3 shouldSuppressRemoteRuleForOwningElement:(id)a4 inEnvironment:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v11 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
  char v12 = [v10 isEqual:v11];

  if (v12)
  {
    uint64_t v13 = [v8 eventDeferringManager];
    int v14 = [v13 windowHostingScene];
    id v15 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy sbWindowSceneAncestor];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v9;
      if (v17)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0;
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
      id v21 = v19;

      if (v21)
      {
        uint64_t v22 = [(BSCompoundAssertion *)self->_appFocusRedirections context];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __126__SBKeyboardFocusCoordinator_eventDeferringManagerSystemShellBehavior_shouldSuppressRemoteRuleForOwningElement_inEnvironment___block_invoke;
        v27[3] = &unk_1E6B0EE80;
        id v28 = v21;
        char v23 = objc_msgSend(v22, "bs_containsObjectPassingTest:", v27);

        BOOL v20 = (v23 & 1) == 0
           && [(SBKeyboardFocusPolicy *)self->_enforcedPolicy shouldSuppressRemoteDeferring];
      }
      else
      {
        BOOL v20 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy shouldSuppressRemoteDeferring];
      }

      goto LABEL_17;
    }
  }
  else
  {
  }
  BOOL v20 = 0;
LABEL_17:
  id v24 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [v9 interfaceElementCategory];
    *(_DWORD *)long long buf = 67109376;
    BOOL v30 = v20;
    __int16 v31 = 1024;
    int v32 = v25;
    _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[coordinator] shouldSuppressRemoteRuleForOwningElement: %{BOOL}u element: %d", buf, 0xEu);
  }

  return v20;
}

BOOL __126__SBKeyboardFocusCoordinator_eventDeferringManagerSystemShellBehavior_shouldSuppressRemoteRuleForOwningElement_inEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(a1) = [*(id *)(a1 + 32) serviceProcessIdentifier];
  if (a1 == [v3 toProcessIdentifier])
  {
    id v4 = [v3 toToken];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)eventDeferringManagerSystemShellBehavior:(id)a3 isRemoteRuleOwningElement:(id)a4 andContainingWindow:(id)a5 visibleComparedToLocalTargetWindow:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = objc_opt_class();
  id v15 = v10;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
  }
  else
  {
    int v16 = 0;
  }
  id v17 = v16;

  id v18 = [v13 eventDeferringManager];

  uint64_t v19 = [v18 windowHostingScene];
  BOOL v20 = [(SBKeyboardFocusPolicy *)self->_enforcedPolicy sbWindowSceneAncestor];
  int v21 = [v19 isEqual:v20];

  int64_t v22 = 0;
  if (v21 && v17)
  {
    char v23 = [(BSCompoundAssertion *)self->_appFocusRedirections context];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __152__SBKeyboardFocusCoordinator_eventDeferringManagerSystemShellBehavior_isRemoteRuleOwningElement_andContainingWindow_visibleComparedToLocalTargetWindow___block_invoke;
    v28[3] = &unk_1E6B0EE80;
    id v29 = v17;
    id v24 = objc_msgSend(v23, "bs_firstObjectPassingTest:", v28);

    if (v24)
    {
      int v25 = [v24 containingWindow];
      [v25 windowLevel];
      [v12 windowLevel];
      if (BSFloatGreaterThanOrEqualToFloat()) {
        int64_t v22 = 1;
      }
      else {
        int64_t v22 = -1;
      }
    }
    else
    {
      int64_t v22 = 0;
    }
  }
  long long v26 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    int64_t v31 = v22;
    __int16 v32 = 2114;
    id v33 = v11;
    __int16 v34 = 2114;
    id v35 = v12;
    _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "[coordinator] isRemoteRuleOwningElement:andContainingWindow:visibleComparedToLocalTargetWindow: %ld remoteRuleWindow: %{public}@ localTargetWindow: %{public}@", buf, 0x20u);
  }

  return v22;
}

BOOL __152__SBKeyboardFocusCoordinator_eventDeferringManagerSystemShellBehavior_isRemoteRuleOwningElement_andContainingWindow_visibleComparedToLocalTargetWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 toToken];
  if (v4
    || (int v5 = [*(id *)(a1 + 32) serviceProcessIdentifier],
        v5 != [v3 toProcessIdentifier]))
  {
    BOOL v7 = 0;
  }
  else
  {
    id v6 = [v3 containingWindow];
    BOOL v7 = v6 != 0;
  }
  return v7;
}

- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNotMain();
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SBKeyboardFocusCoordinator_shouldKeyboardBeWindowSizedForHostWithIdentity___block_invoke;
  block[3] = &unk_1E6AF6380;
  id v8 = v4;
  id v9 = &v10;
  void block[4] = self;
  id v5 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __77__SBKeyboardFocusCoordinator_shouldKeyboardBeWindowSizedForHostWithIdentity___block_invoke(void *a1)
{
  id v4 = [*(id *)(a1[4] + 192) enforcedPolicy];
  int v2 = [v4 sbWindowSceneAncestor];
  id v3 = [v2 medusaHostedKeyboardWindowController];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 shouldKeyboardBeWindowSizedForHostWithIdentity:a1[5]];
}

- (NSSet)externalSceneIdentities
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExternalSceneIdentities:(id)a3
{
}

- (FBScene)sceneWithFocusIncludingSpringBoard
{
  return self->_sceneWithFocusIncludingSpringBoard;
}

- (void)setSceneWithFocusIncludingSpringBoard:(id)a3
{
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
}

- (BSInvalidatable)coalition_suppressKeyboardFocusEvaluationAssertion
{
  return self->_coalition_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setCoalition_suppressKeyboardFocusEvaluationAssertion:(id)a3
{
}

- (BSCompoundAssertion)preventFocusForSceneAssertion
{
  return self->_preventFocusForSceneAssertion;
}

- (void)setPreventFocusForSceneAssertion:(id)a3
{
}

- (BSCompoundAssertion)appFocusRedirections
{
  return self->_appFocusRedirections;
}

- (void)setAppFocusRedirections:(id)a3
{
}

- (BSCompoundAssertion)accessibilityKeyboardFocusTargetOverrides
{
  return self->_accessibilityKeyboardFocusTargetOverrides;
}

- (void)setAccessibilityKeyboardFocusTargetOverrides:(id)a3
{
}

- (NSMutableDictionary)focusServiceEventDeferralRequests
{
  return self->_focusServiceEventDeferralRequests;
}

- (void)setFocusServiceEventDeferralRequests:(id)a3
{
}

- (BSCompoundAssertion)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (SBKeyboardFocusCoalition)coalition
{
  return self->_coalition;
}

- (void)setCoalition:(id)a3
{
}

- (void)setEnforcedPolicy:(id)a3
{
}

- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes
{
  return self->_recentlyUsedScenes;
}

- (void)setRecentlyUsedScenes:(id)a3
{
}

- (NSMutableArray)userFocusRequestRuleUpdateCompletionHandlers
{
  return self->_userFocusRequestRuleUpdateCompletionHandlers;
}

- (void)setUserFocusRequestRuleUpdateCompletionHandlers:(id)a3
{
}

- (FBScene)overlayUISceneRequestingFocus
{
  return self->_overlayUISceneRequestingFocus;
}

- (void)setOverlayUISceneRequestingFocus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayUISceneRequestingFocus, 0);
  objc_storeStrong((id *)&self->_userFocusRequestRuleUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_recentlyUsedScenes, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_coalition, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_focusServiceEventDeferralRequests, 0);
  objc_storeStrong((id *)&self->_accessibilityKeyboardFocusTargetOverrides, 0);
  objc_storeStrong((id *)&self->_appFocusRedirections, 0);
  objc_storeStrong((id *)&self->_preventFocusForSceneAssertion, 0);
  objc_storeStrong((id *)&self->_coalition_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_sceneWithFocusIncludingSpringBoard, 0);
  objc_storeStrong((id *)&self->_externalSceneWithFocus, 0);
  objc_storeStrong((id *)&self->_externalSceneIdentities, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterAdvisor, 0);
  objc_storeStrong((id *)&self->_visibilityGraphNavigator, 0);
  objc_storeStrong((id *)&self->_inputUISceneController, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoalitionFactory, 0);
  objc_storeStrong((id *)&self->_keyboardFocusSceneControllerFactory, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

- (void)windowSceneDidConnect:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)windowSceneDidDisconnect:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[coordinator] error: bufferEventsForSpringBoardScene for reason %{public}@ with nil scene", v2, v3, v4, v5, v6);
}

- (void)bufferEventsForSpringBoardScene:reason:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeKeyboardFocusFromScene:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)userFocusRequestForScene:reason:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)userFocusRequestForScene:reason:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)userFocusRequestForScene:reason:completion:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "[coordinator] userFocusRequestForScene(%{public}@): process doesn't exist for scene:%{public}@", v2, 0x16u);
}

- (void)redirectFocusForReason:(int)a1 fromProcessIdentifier:(NSObject *)a2 fromSceneIdentityToken:toProcessIdentifier:toSceneIdentityToken:inContainingWindow:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Focus rule set with from pid %d and no token; PID-only rules are not valid",
    (uint8_t *)v2,
    8u);
}

- (void)focusLockSpringBoardWindow:forReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)focusLockSpringBoardWindow:forReason:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[coordinator] error: focusLockSpringBoardWindowScene for reason %{public}@ with nil scene", v2, v3, v4, v5, v6);
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)focusLockSpringBoardWindowScene:forReason:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(const char *)a1 forAccessibilityReason:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "could not find scene for %{public}@", v2, v3, v4, v5, v6);
}

- (void)requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:(const char *)a1 forAccessibilityReason:.cold.3(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_sbWindowSceneHostingFBSSceneIdentityToken:(void *)a1 ultimateHostTarget:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 stringRepresentation];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Couldn't find the SB window scene hosting scene identity token: %{public}@", v4, 0xCu);
}

- (void)_sceneControllerForSBWindowScene:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[coordinator] couldn't find scene controller for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sceneControllerForSBWindowScene:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[coordinator] could not find %{public}@", v2, v3, v4, v5, v6);
}

@end