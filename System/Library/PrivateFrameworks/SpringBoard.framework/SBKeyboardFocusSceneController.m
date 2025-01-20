@interface SBKeyboardFocusSceneController
- (BOOL)_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:(id)a3 reason:(id)a4;
- (BOOL)_updateKeyboardFocusTargetFromPreviouslyFocusedSceneIdentity:(id)a3 pid:(int)a4;
- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder;
- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus;
- (BOOL)controlsScene:(id)a3;
- (BOOL)hasActiveTransientOverlayPresentation;
- (BOOL)isActiveTransientOverlayPresentationFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3;
- (BOOL)isCoverSheetHostingAnApp;
- (BOOL)isSpolightPresentedAsTransientOverlay;
- (BOOL)removeKeyboardFocusFromScene:(id)a3;
- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3;
- (BOOL)shouldPreventFocusForSceneWithIdentityToken:(id)a3;
- (BSCompoundAssertion)springBoardFocusLockAssertions;
- (BSCompoundAssertion)springBoardFocusRedirections;
- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion;
- (FBScene)systemUISceneRequestingFocus;
- (NSSet)previousDependencyReasonsSpringShouldHaveFocus;
- (NSSet)springBoardFocusLockReasons;
- (NSString)debugDescription;
- (NSString)debugName;
- (NSString)description;
- (SBKeyboardFocusCoalition)coalition;
- (SBKeyboardFocusPolicy)enforcedPolicy;
- (SBKeyboardFocusPolicy)preferredPolicy;
- (SBKeyboardFocusPolicyEnforcer)policyEnforcer;
- (SBKeyboardFocusResolutionPipeline)pipeline;
- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 dependencies:(id)a4;
- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 policyEnforcer:(id)a4 pipelineFactory:(id)a5 dependencies:(id)a6;
- (SBKeyboardFocusSceneControllerDelegate)delegate;
- (SBKeyboardFocusTarget)lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
- (SBKeyboardFocusTarget)sbWindowSceneFocusTarget;
- (SBKeyboardFocusTarget)springBoardSceneFocusTarget;
- (SBWindowScene)sbWindowScene;
- (_SBKeyboardFocusSceneControllerDependencyProviding)dependencies;
- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes;
- (id)_focusLockSpringBoardWindow:(id)a3 forReason:(id)a4;
- (id)_updatePolicyForReason:(id)a3;
- (id)accessibilityKeyboardFocusOverrideTarget;
- (id)bufferEventsForReason:(id)a3 generation:(unint64_t)a4;
- (id)focusLockSpringBoardForReason:(id)a3;
- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4;
- (id)focusTargetForActiveTransientOverlayPresentation;
- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3;
- (id)generateUpdatedPreferencesForCoalitionMember:(id)a3 reason:(id)a4;
- (id)keyboardFocusRedirectionForTarget:(id)a3;
- (id)mostRecentKeyboardArbiterSuggestedTarget;
- (id)newPipeline;
- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5;
- (id)sceneForFocusTarget:(id)a3;
- (int64_t)coalitionAffinity;
- (void)_bootDidComplete:(id)a3;
- (void)_requestPolicyReevaluationForReason:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)coalitionMemberFocusDidChange:(id)a3;
- (void)displayDidBecomeActive;
- (void)invalidate;
- (void)keyboardArbiterSuggestedFocusTarget:(id)a3;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5;
- (void)setCoalition:(id)a3;
- (void)setCoalitionAffinity:(int64_t)a3;
- (void)setDebugName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDependencies:(id)a3;
- (void)setEnforcedPolicy:(id)a3;
- (void)setLastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks:(id)a3;
- (void)setPipeline:(id)a3;
- (void)setPolicyEnforcer:(id)a3;
- (void)setPreferredPolicy:(id)a3;
- (void)setPreviousDependencyReasonsSpringShouldHaveFocus:(id)a3;
- (void)setRecentlyUsedScenes:(id)a3;
- (void)setSpringBoardFocusLockAssertions:(id)a3;
- (void)setSpringBoardFocusRedirections:(id)a3;
- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3;
- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5;
@end

@implementation SBKeyboardFocusSceneController

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      debugName = self->_debugName;
      recentlyUsedScenes = self->_recentlyUsedScenes;
      int v14 = 138544130;
      v15 = debugName;
      __int16 v16 = 1024;
      int v17 = v10;
      __int16 v18 = 2114;
      v19 = v7;
      __int16 v20 = 2114;
      v21 = recentlyUsedScenes;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] didAddExternalForegroundApplicationSceneHandle pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)&v14, 0x26u);
    }
  }
}

- (id)keyboardFocusRedirectionForTarget:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 isEqual:self->_sbWindowSceneFocusTarget])
  {
    WeakRetained = [(BSCompoundAssertion *)self->_springBoardFocusRedirections orderedContext];
    uint64_t v7 = [WeakRetained lastObject];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [WeakRetained appFocusRedirectionForProposedTarget:v5];
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)shouldPreventFocusForSceneWithIdentityToken:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = [v4 stringRepresentation];

  LOBYTE(v4) = [WeakRetained shouldPreventFocusForSceneWithIdentityTokenStringRepresentation:v6];
  return (char)v4;
}

- (id)generateUpdatedPreferencesForCoalitionMember:(id)a3 reason:(id)a4
{
  id v5 = [(SBKeyboardFocusSceneController *)self _updatePolicyForReason:a4];
  preferredPolicy = self->_preferredPolicy;
  self->_preferredPolicy = v5;

  uint64_t v7 = self->_preferredPolicy;
  v8 = [(SBKeyboardFocusSceneController *)self springBoardFocusLockReasons];
  v9 = +[SBKeyboardFocusCoalitionMemberPreferences preferencesWithPolicy:v7 lockReasons:v8];

  return v9;
}

- (id)_updatePolicyForReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = objc_alloc_init(SBMutableKeyboardFocusPolicy);
  [(SBMutableKeyboardFocusPolicy *)v5 setKeyboardFocusTarget:self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks];
  [(SBMutableKeyboardFocusPolicy *)v5 setAdvicePolicy:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  [(SBMutableKeyboardFocusPolicy *)v5 setWindowSceneAncestor:WeakRetained];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__SBKeyboardFocusSceneController__updatePolicyForReason___block_invoke;
  v16[3] = &unk_1E6B0AB68;
  v16[4] = self;
  uint64_t v7 = +[SBKeyboardFocusResolutionContext build:v16];
  v8 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    *(_DWORD *)buf = 138543874;
    __int16 v18 = debugName;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    uint64_t v22 = lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] - generating new policy for reason: %{public}@ - last non-SB keyboard arbiter suggestion: %{public}@]", buf, 0x20u);
  }

  [(SBKeyboardFocusResolutionPipeline *)self->_pipeline generateKeyboardFocusPolicy:v5 resolutionContext:v7];
  v9 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = self->_debugName;
    v15 = [(SBKeyboardFocusPolicy *)v5 auditHistory];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v14;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    uint64_t v22 = v5;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] - generated policy for reason: %{public}@ - %{public}@ : %{public}@]", buf, 0x2Au);
  }
  uint64_t v10 = v5;

  return v10;
}

- (NSSet)springBoardFocusLockReasons
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke;
  __int16 v19 = &unk_1E6B0AB90;
  id v20 = self;
  id v4 = v3;
  id v21 = v4;
  id v5 = (void (**)(void, void))MEMORY[0x1D948C7A0](&v16);
  if ([(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isShowingSystemModalAlert])
  {
    v6 = +[SBKeyboardFocusLockReason systemModalAlert];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  if ([(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isPresentingModalBannerInLongLook])
  {
    uint64_t v7 = +[SBKeyboardFocusLockReason modalBannerInLongLook];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
  if ([(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isScreenDim])
  {
    v8 = +[SBKeyboardFocusLockReason screenIsDim];
    ((void (**)(void, void *))v5)[2](v5, v8);
  }
  if ([(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isCoverSheetHostingAnApp])
  {
    v9 = +[SBKeyboardFocusLockReason coverSheetHostingApp];
    ((void (**)(void, void *))v5)[2](v5, v9);
  }
  uint64_t v10 = (NSSet *)[v4 copy];
  previousDependencyReasonsSpringShouldHaveFocus = self->_previousDependencyReasonsSpringShouldHaveFocus;
  self->_previousDependencyReasonsSpringShouldHaveFocus = v10;

  v12 = [(BSCompoundAssertion *)self->_springBoardFocusLockAssertions context];
  v13 = objc_msgSend(v12, "bs_map:", &__block_literal_global_126);

  [v4 unionSet:v13];
  int v14 = (NSSet *)v4;

  return v14;
}

- (FBScene)systemUISceneRequestingFocus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained systemUISceneRequestingFocus];

  return (FBScene *)v3;
}

- (id)sceneForFocusTarget:(id)a3
{
  dependencies = self->_dependencies;
  id v4 = a3;
  id v5 = [(_SBKeyboardFocusSceneControllerDependencyProviding *)dependencies sceneProvider];
  v6 = [v4 sceneIdentityToken];

  uint64_t v7 = [v5 sceneForIdentityToken:v6];

  return v7;
}

- (BOOL)isCoverSheetHostingAnApp
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isCoverSheetHostingAnApp];
}

- (id)accessibilityKeyboardFocusOverrideTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained accessibilityOverrideTarget];

  return v3;
}

void __57__SBKeyboardFocusSceneController__updatePolicyForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 88);
  id v4 = a2;
  objc_msgSend(v4, "setScreenDim:", objc_msgSend(v3, "isScreenDim"));
  objc_msgSend(v4, "setSiriVisible:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "isSiriVisible"));
  objc_msgSend(v4, "setSpotlightVisible:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "isSpotlightVisible"));
}

- (SBKeyboardFocusTarget)springBoardSceneFocusTarget
{
  return self->_sbWindowSceneFocusTarget;
}

- (id)mostRecentKeyboardArbiterSuggestedTarget
{
  return -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
}

- (void)coalitionMemberFocusDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 hasFocus])
  {
    id v4 = [(SBKeyboardFocusCoalition *)self->_coalition enforcedPolicy];
    char v5 = BSEqualObjects();
    v6 = SBLogKeyboardFocus();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(SBKeyboardFocusSceneController *)(uint64_t)self coalitionMemberFocusDidChange:v7];
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        debugName = self->_debugName;
        int v10 = 138543618;
        v11 = debugName;
        __int16 v12 = 2114;
        v13 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] coalition says I have focus; enforcing policy: %{public}@",
          (uint8_t *)&v10,
          0x16u);
      }

      objc_storeStrong((id *)&self->_enforcedPolicy, v4);
      [(SBKeyboardFocusPolicyEnforcer *)self->_policyEnforcer enforce:self->_enforcedPolicy];
    }
  }
  else
  {
    [(SBKeyboardFocusPolicyEnforcer *)self->_policyEnforcer stopEnforcing];
    enforcedPolicy = self->_enforcedPolicy;
    self->_enforcedPolicy = 0;
  }
}

- (BOOL)controlsScene:(id)a3
{
  if (!a3) {
    return 0;
  }
  p_sbWindowScene = &self->_sbWindowScene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);
  char v6 = BSEqualObjects();

  return v6;
}

- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(BSCompoundAssertion *)self->_springBoardFocusLockAssertions context];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__SBKeyboardFocusSceneController_shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow___block_invoke;
    v8[3] = &unk_1E6B0AAF8;
    id v9 = v4;
    char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v8);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)keyboardArbiterSuggestedFocusTarget:(id)a3
{
  id v9 = (SBKeyboardFocusTarget *)a3;
  if (![(SBKeyboardFocusTarget *)v9 isEqual:self->_sbWindowSceneFocusTarget])
  {
    char v6 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v4 = [(BSCompoundAssertion *)self->_springBoardFocusLockAssertions context];
  char v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_334);

  char v6 = v9;
  if ((v5 & 1) == 0)
  {
LABEL_5:
    uint64_t v7 = v9;
    lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = v9;

    char v6 = v9;
  }
LABEL_6:
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)_requestPolicyReevaluationForReason:(id)a3
{
  id v4 = a3;
  coalitionMember = self->_coalitionMember;
  if (coalitionMember)
  {
    id v7 = v4;
    [(SBKeyboardFocusCoalitionMember *)coalitionMember requestArbitration:v4];
  }
  else
  {
    char v6 = [NSString stringWithFormat:@"Can't function without a coalition"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusSceneController _requestPolicyReevaluationForReason:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (SBWindowScene)sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBKeyboardFocusTarget)sbWindowSceneFocusTarget
{
  return self->_sbWindowSceneFocusTarget;
}

- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 dependencies:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  char v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 _FBSScene];
  int v10 = [v9 identifier];
  v11 = [v6 stringWithFormat:@"Scene-%@", v10];

  __int16 v12 = NSString;
  v13 = [v8 _FBSScene];
  uint64_t v14 = [v13 identifier];
  v15 = [v12 stringWithFormat:@"SBSystemKeyCommandPolicyEnforcer-Scene-%@", v14];

  uint64_t v16 = [SBKeyboardFocusScenePolicyEnforcer alloc];
  uint64_t v17 = [v7 deliveryManager];
  __int16 v18 = [v7 eventDeferringSystemShellBehaviorDelegate];
  __int16 v19 = [(SBKeyboardFocusScenePolicyEnforcer *)v16 initWithDeliveryManager:v17 debugName:v11 systemShellDelegate:v18];

  id v20 = [SBSystemKeyCommandScenePolicyEnforcer alloc];
  id v21 = [v7 sceneProvider];
  uint64_t v22 = [v7 deliveryManager];
  __int16 v23 = [(SBSystemKeyCommandScenePolicyEnforcer *)v20 initWithSceneProvider:v21 debugName:v15 deliveryManager:v22];

  v24 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
  v29[0] = v19;
  v29[1] = v23;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v26 = [(SBKeyboardFocusPolicyEnforcerPipeline *)v24 initWithEnforcers:v25];

  v27 = [(SBKeyboardFocusSceneController *)self initWithWindowScene:v8 policyEnforcer:v26 pipelineFactory:0 dependencies:v7];
  return v27;
}

- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 policyEnforcer:(id)a4 pipelineFactory:(id)a5 dependencies:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = (SBKeyboardFocusSceneController *)a5;
  id v13 = a6;
  v54.receiver = self;
  v54.super_class = (Class)SBKeyboardFocusSceneController;
  uint64_t v14 = [(SBKeyboardFocusSceneController *)&v54 init];
  v15 = v14;
  if (v14)
  {
    id v51 = v11;
    if (v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v17 = v16;

    objc_storeWeak((id *)&v15->_sbWindowScene, v10);
    __int16 v18 = [v10 _FBSScene];
    __int16 v19 = [v18 identityToken];
    uint64_t v20 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:v19 pid:getpid()];
    sbWindowSceneFocusTarget = v15->_sbWindowSceneFocusTarget;
    v15->_sbWindowSceneFocusTarget = (SBKeyboardFocusTarget *)v20;

    objc_storeStrong((id *)&v15->_dependencies, a6);
    objc_storeStrong((id *)&v15->_policyEnforcer, a4);
    uint64_t v22 = [v10 _FBSScene];
    uint64_t v23 = [v22 identifier];
    debugName = v15->_debugName;
    v15->_debugName = (NSString *)v23;

    uint64_t v25 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
    recentlyUsedScenes = v15->_recentlyUsedScenes;
    v15->_recentlyUsedScenes = v25;

    uint64_t v27 = [(SBKeyboardFocusSceneController *)v17 newPipeline];
    pipeline = v15->_pipeline;
    v15->_pipeline = (SBKeyboardFocusResolutionPipeline *)v27;

    v15->_coalitionAffinity = [v10 keyboardFocusCoalitionAffinity];
    id v29 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    v30 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [v29 setEnvironment:v30];

    v31 = [v10 _FBSScene];
    v32 = [v31 settings];
    v33 = objc_msgSend(v32, "sb_displayConfigurationForSceneManagers");
    char v34 = [v33 isExternal];
    v35 = (void *)MEMORY[0x1E4F4F2D0];
    if (v34)
    {
      v36 = [v33 hardwareIdentifier];
      v37 = [v35 displayWithHardwareIdentifier:v36];
    }
    else
    {
      v37 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    }

    [v29 setDisplay:v37];
    v38 = [(SBKeyboardFocusTarget *)v15->_sbWindowSceneFocusTarget sceneIdentityToken];
    v39 = [v38 stringRepresentation];

    v40 = [MEMORY[0x1E4F4F290] tokenForString:v39];
    [v29 setToken:v40];

    uint64_t v41 = [v29 copy];
    bufferingPredicate = v15->_bufferingPredicate;
    v15->_bufferingPredicate = (BKSHIDEventDeferringPredicate *)v41;

    v43 = [v10 sceneManager];
    [v43 addObserver:v15];

    if (SBWorkspaceIsSystemBootComplete())
    {
      v44 = [v10 transientOverlayPresenter];
      [v44 addObserver:v15];
    }
    else
    {
      v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v44 addObserver:v15 selector:sel__bootDidComplete_ name:@"SBBootCompleteNotification" object:0];
    }

    v45 = [NSString stringWithFormat:@"SpringBoard - KeyboardFocus - SceneController - %@", v15->_debugName];
    objc_initWeak(&location, v15);
    id v46 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v52, &location);
    uint64_t v47 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v15->_stateCaptureAssertion;
    v15->_stateCaptureAssertion = (BSInvalidatable *)v47;

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    __int16 v12 = v17;
    id v11 = v51;
  }
  v49 = v15;

  return v49;
}

id __98__SBKeyboardFocusSceneController_initWithWindowScene_policyEnforcer_pipelineFactory_dependencies___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];

  return v2;
}

- (void)setCoalition:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_coalitionMember)
  {
    char v6 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      id v8 = [(SBKeyboardFocusCoalitionMember *)self->_coalitionMember uniqueIdentifier];
      int v17 = 138543618;
      __int16 v18 = debugName;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating current participant: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    [(SBKeyboardFocusCoalitionMember *)self->_coalitionMember invalidate];
    coalitionMember = self->_coalitionMember;
    self->_coalitionMember = 0;
  }
  objc_storeStrong((id *)&self->_coalition, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v11 = [v5 acquireMemberForWindowScene:WeakRetained delegate:self];
  __int16 v12 = self->_coalitionMember;
  self->_coalitionMember = v11;

  id v13 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = self->_debugName;
    v15 = [v5 debugName];
    uint64_t v16 = [(SBKeyboardFocusCoalitionMember *)self->_coalitionMember uniqueIdentifier];
    int v17 = 138543874;
    __int16 v18 = v14;
    __int16 v19 = 2114;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] participating in coalition %{public}@ - participant: %{public}@", (uint8_t *)&v17, 0x20u);
  }
}

- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = objc_alloc_init(SBKeyboardFocusRedirection);
    [(SBKeyboardFocusRedirection *)v10 setReason:v8];
    [(SBKeyboardFocusRedirection *)v10 setFromProcessIdentifier:[(SBKeyboardFocusTarget *)self->_sbWindowSceneFocusTarget pid]];
    id v11 = [(SBKeyboardFocusTarget *)self->_sbWindowSceneFocusTarget sceneIdentityToken];
    [(SBKeyboardFocusRedirection *)v10 setFromToken:v11];

    [(SBKeyboardFocusRedirection *)v10 setToProcessIdentifier:v6];
    [(SBKeyboardFocusRedirection *)v10 setToToken:v9];
    if (!self->_springBoardFocusRedirections)
    {
      objc_initWeak((id *)location, self);
      __int16 v12 = [NSString stringWithFormat:@"%@-springBoardFocusRedirections", self->_debugName];
      id v13 = (void *)MEMORY[0x1E4F4F6E8];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __113__SBKeyboardFocusSceneController_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke;
      v23[3] = &unk_1E6AF92D8;
      objc_copyWeak(&v24, (id *)location);
      uint64_t v14 = [v13 assertionWithIdentifier:v12 stateDidChangeHandler:v23];
      springBoardFocusRedirections = self->_springBoardFocusRedirections;
      self->_springBoardFocusRedirections = v14;

      uint64_t v16 = self->_springBoardFocusRedirections;
      int v17 = SBLogKeyboardFocus();
      [(BSCompoundAssertion *)v16 setLog:v17];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)location);
    }
    __int16 v18 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = debugName;
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = v6;
      *(_WORD *)&v27[4] = 2114;
      *(void *)&v27[6] = v8;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] redirectSpringBoardLockFocusForReason: deferring focus to pid %d for reason: %{public}@ ", location, 0x1Cu);
    }

    uint64_t v20 = [(BSCompoundAssertion *)self->_springBoardFocusRedirections acquireForReason:v8 withContext:v10];
  }
  else
  {
    SBLogKeyboardFocus();
    id v10 = (SBKeyboardFocusRedirection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = self->_debugName;
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v21;
      __int16 v26 = 2114;
      *(void *)uint64_t v27 = v8;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v6;
      _os_log_impl(&dword_1D85BA000, &v10->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] error: redirectSpringBoardLockFocusForReason %{public}@ request with pid %d and no token; PID-only "
        "rules are not valid",
        location,
        0x1Cu);
    }
    uint64_t v20 = 0;
  }

  return v20;
}

void __113__SBKeyboardFocusSceneController_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[SBKeyboardFocusArbitrationReason focusRedirectAssertionsDidChange];
  [WeakRetained _requestPolicyReevaluationForReason:v1];
}

- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 _sbWindowScene];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);

    if (v8 != WeakRetained)
    {
      uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[window _sbWindowScene] == _sbWindowScene"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBKeyboardFocusSceneController focusLockSpringBoardWindow:forReason:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8D29840);
    }
    id v10 = [(SBKeyboardFocusSceneController *)self _focusLockSpringBoardWindow:v6 forReason:v7];
  }
  else
  {
    id v11 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = debugName;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] error: focusLockSpringBoardWindow for reason %{public}@ with nil window", buf, 0x16u);
    }

    id v10 = 0;
  }

  return v10;
}

- (id)focusLockSpringBoardForReason:(id)a3
{
  return [(SBKeyboardFocusSceneController *)self _focusLockSpringBoardWindow:0 forReason:a3];
}

BOOL __93__SBKeyboardFocusSceneController_shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 == *(void *)(a1 + 32);
}

BOOL __70__SBKeyboardFocusSceneController_keyboardArbiterSuggestedFocusTarget___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 != 0;
}

- (id)bufferEventsForReason:(id)a3 generation:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = NSString;
  objc_opt_class();
  id v8 = (objc_class *)objc_opt_class();
  if (!v6)
  {
    uint64_t v19 = NSStringFromClass(v8);
    uint64_t v20 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusSceneController bufferEventsForReason:generation:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8D29B14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v21 = NSString;
    uint64_t v22 = (objc_class *)[v6 classForCoder];
    if (!v22) {
      uint64_t v22 = (objc_class *)objc_opt_class();
    }
    uint64_t v23 = NSStringFromClass(v22);
    objc_opt_class();
    id v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    __int16 v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v23, v25];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusSceneController bufferEventsForReason:generation:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8D29BBCLL);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v9 = [NSString stringWithFormat:@"BufferingRequest (%ld) - %@", a4, v6];
  id v10 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    debugName = self->_debugName;
    *(_DWORD *)buf = 138543874;
    v32 = debugName;
    __int16 v33 = 2114;
    id v34 = v6;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "[%{public}@] bufferEventsForReason: %{public}@ <%lu>- begin", buf, 0x20u);
  }

  __int16 v12 = [MEMORY[0x1E4F4F2A0] sharedInstance];
  id v13 = [v12 bufferEventsMatchingPredicate:self->_bufferingPredicate withReason:v6];

  id v14 = objc_alloc(MEMORY[0x1E4F4F838]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__SBKeyboardFocusSceneController_bufferEventsForReason_generation___block_invoke;
  v27[3] = &unk_1E6B0AB40;
  v27[4] = self;
  id v28 = v6;
  id v29 = v13;
  unint64_t v30 = a4;
  id v15 = v13;
  id v16 = v6;
  __int16 v17 = (void *)[v14 initWithIdentifier:v9 forReason:v16 invalidationBlock:v27];

  return v17;
}

uint64_t __67__SBKeyboardFocusSceneController_bufferEventsForReason_generation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v5 = *(void *)(a1 + 56);
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "[%{public}@] bufferEventsForReason: %{public}@ <%lu> - end", (uint8_t *)&v7, 0x20u);
  }

  return [*(id *)(a1 + 48) invalidate];
}

- (BOOL)removeKeyboardFocusFromScene:(id)a3
{
  return [(SBKeyboardFocusSceneController *)self _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:a3 reason:@"removeKeyboardFocusFromScene"];
}

- (void)displayDidBecomeActive
{
  if ([(BSCompoundAssertion *)self->_springBoardFocusLockAssertions isActive])
  {
    id v3 = +[SBKeyboardFocusArbitrationReason displayDidBecomeActive];
    [(SBKeyboardFocusSceneController *)self _requestPolicyReevaluationForReason:v3];
  }
}

- (id)_focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_springBoardFocusLockAssertions)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-springBoardFocusLockAssertions", self->_debugName];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__SBKeyboardFocusSceneController__focusLockSpringBoardWindow_forReason___block_invoke;
    v21[3] = &unk_1E6B05A08;
    v21[4] = self;
    __int16 v9 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:v8 stateDidChangeHandler:v21];
    springBoardFocusLockAssertions = self->_springBoardFocusLockAssertions;
    self->_springBoardFocusLockAssertions = v9;

    __int16 v11 = self->_springBoardFocusLockAssertions;
    uint64_t v12 = SBLogKeyboardFocus();
    [(BSCompoundAssertion *)v11 setLog:v12];
  }
  uint64_t v13 = objc_alloc_init(_SBKeyboardFocusAssertionContext);
  -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v13, v7);
  -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v13, v6);
  id v14 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    id v16 = [v6 _debugName];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = debugName;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] focusLockSpringBoardWindow: %{public}@ for reason: %{public}@", buf, 0x20u);
  }
  __int16 v17 = self->_springBoardFocusLockAssertions;
  id v18 = [v7 name];
  uint64_t v19 = [(BSCompoundAssertion *)v17 acquireForReason:v18 withContext:v13];

  return v19;
}

void __72__SBKeyboardFocusSceneController__focusLockSpringBoardWindow_forReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 80);
  id v2 = +[SBKeyboardFocusArbitrationReason focusLockAssertionsDidChange];
  [v1 setNeedsArbitrationForReason:v2];
}

- (void)_bootDidComplete:(id)a3
{
  uint64_t v4 = [(SBKeyboardFocusSceneController *)self sbWindowScene];
  uint64_t v5 = [v4 transientOverlayPresenter];
  [v5 addObserver:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"SBBootCompleteNotification" object:0];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  [v5 appendProem:self block:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke_2;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  __int16 v9 = self;
  id v6 = v5;
  [v6 appendBodySectionWithName:0 block:v7];
}

id __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "hasFocus"), @"hasFocus");
}

void __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 160) withName:@"lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:@"springBoardFocusLockAssertions"];
  int v4 = [*(id *)(a1 + 32) hasDebugStyle];
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v5 + 144) withName:@"preferredPolicy"];
    id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 152) withName:@"enforcedPolicy"];
  }
  else
  {
    __int16 v9 = [*(id *)(v5 + 144) keyboardFocusTarget];
    id v10 = (id)[v6 appendObject:v9 withName:@"preferredKeyboardFocusTarget"];

    id v11 = *(void **)(a1 + 32);
    id v13 = [*(id *)(*(void *)(a1 + 40) + 152) keyboardFocusTarget];
    id v12 = (id)[v11 appendObject:v13 withName:@"enforcedKeyboardFocusTarget"];
  }
}

- (void)invalidate
{
  [(BSCompoundAssertion *)self->_springBoardFocusRedirections invalidate];
  [(BSCompoundAssertion *)self->_springBoardFocusLockAssertions invalidate];
  [(BSCompoundAssertion *)self->_suppressKeyboardFocusEvaluationAssertion invalidate];
  [(SBKeyboardFocusPolicyEnforcer *)self->_policyEnforcer invalidate];
  [(SBKeyboardFocusCoalitionMember *)self->_coalitionMember invalidate];
  stateCaptureAssertion = self->_stateCaptureAssertion;
  [(BSInvalidatable *)stateCaptureAssertion invalidate];
}

- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = [v6 scene];

  LODWORD(v6) = [(SBKeyboardFocusSceneController *)self _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:v7 reason:@"willRemoveExternalForegroundApplicationSceneHandle"];
  if (v6)
  {
    id v8 = +[SBKeyboardFocusArbitrationReason removedKeyboardArbiterSceneWillRemove];
    [(SBKeyboardFocusSceneController *)self _requestPolicyReevaluationForReason:v8];
  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v9 scene];
  if ([v5 isValid])
  {
    id v6 = [v9 scene];
    BOOL v7 = [(SBKeyboardFocusSceneController *)self _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:v6 reason:@"didRemoveExternalForegroundApplicationSceneHandle"];

    if (v7)
    {
      id v8 = +[SBKeyboardFocusArbitrationReason removedKeyboardArbiterSceneDidRemove];
      [(SBKeyboardFocusSceneController *)self _requestPolicyReevaluationForReason:v8];
    }
  }
}

- (BOOL)_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:(id)a3 reason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identityToken];
  id v9 = [v7 clientHandle];

  id v10 = [v9 processHandle];
  uint64_t v11 = [v10 pid];

  id v12 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    int v16 = 138544130;
    __int16 v17 = debugName;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing scene: %{public}@ pid: %d for reason: %{public}@", (uint8_t *)&v16, 0x26u);
  }

  [(_SBRecentlyUsedSceneIdentityCache *)self->_recentlyUsedScenes removeSceneIdentityToken:v8 forPID:v11];
  BOOL v14 = [(SBKeyboardFocusSceneController *)self _updateKeyboardFocusTargetFromPreviouslyFocusedSceneIdentity:v8 pid:v11];

  return v14;
}

- (BOOL)_updateKeyboardFocusTargetFromPreviouslyFocusedSceneIdentity:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = &self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
  uint64_t v8 = [(SBKeyboardFocusTarget *)self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks sceneIdentityToken];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(SBKeyboardFocusTarget *)*p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks sceneIdentityToken];
    int v11 = BSEqualObjects();

    if (v11)
    {
      id v12 = -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForPID:]((uint64_t)self->_recentlyUsedScenes, v4);
      if (v12)
      {
        id v13 = v12;
        objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, v12);
        BOOL v14 = SBLogKeyboardFocus();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          debugName = self->_debugName;
          int v16 = [(SBKeyboardFocusTarget *)self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks sceneIdentityToken];
          int v17 = [(SBKeyboardFocusTarget *)self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks pid];
          int v26 = 138543874;
          id v27 = debugName;
          __int16 v28 = 2114;
          id v29 = v16;
          __int16 v30 = 1024;
          int v31 = v17;
          __int16 v18 = "[%{public}@] setting keyboard arbiter suggested scene to %{public}@ in same pid %d";
LABEL_10:
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v26, 0x1Cu);
        }
      }
      else
      {
        __int16 v20 = -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
        if (!v20)
        {
          uint64_t v24 = *p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
          *p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = 0;

          id v13 = SBLogKeyboardFocus();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = self->_debugName;
            int v26 = 138543362;
            id v27 = v25;
            _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] no available fallbacks for keyboard arbiter suggested scene", (uint8_t *)&v26, 0xCu);
          }
          goto LABEL_12;
        }
        id v13 = v20;
        objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, v20);
        BOOL v14 = SBLogKeyboardFocus();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = self->_debugName;
          int v16 = [(SBKeyboardFocusTarget *)self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks sceneIdentityToken];
          int v22 = [(SBKeyboardFocusTarget *)self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks pid];
          int v26 = 138543874;
          id v27 = v21;
          __int16 v28 = 2114;
          id v29 = v16;
          __int16 v30 = 1024;
          int v31 = v22;
          __int16 v18 = "[%{public}@] setting keyboard arbiter suggested scene to %{public}@ in MRU pid %d";
          goto LABEL_10;
        }
      }

LABEL_12:
      BOOL v19 = 1;
      goto LABEL_13;
    }
  }
  BOOL v19 = 0;
LABEL_13:

  return v19;
}

- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(a4, "hostedSceneIdentityTokens", a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    LOBYTE(v9) = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        BOOL v9 = v9
          || [(SBKeyboardFocusSceneController *)self _updateKeyboardFocusTargetFromPreviouslyFocusedSceneIdentity:*(void *)(*((void *)&v13 + 1) + 8 * i) pid:0];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
    if (v9)
    {
      id v12 = +[SBKeyboardFocusArbitrationReason didDismissTransientOverlayScene];
      [(SBKeyboardFocusSceneController *)self _requestPolicyReevaluationForReason:v12];
    }
  }
}

- (id)newPipeline
{
  v13[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(SBKeyboardFocusAccessibilityResolutionStage);
  [(SBKeyboardFocusAccessibilityResolutionStage *)v3 setDelegate:self];
  [(SBKeyboardFocusAccessibilityResolutionStage *)v3 setSceneProvider:self];
  uint64_t v4 = objc_alloc_init(SBKeyboardArbiterResolutionStage);
  [(SBKeyboardArbiterResolutionStage *)v4 setDelegate:self];
  [(SBKeyboardArbiterResolutionStage *)v4 setSceneProvider:self];
  uint64_t v5 = objc_alloc_init(SBSystemUISceneResolutionStage);
  [(SBSystemUISceneResolutionStage *)v5 setDelegate:self];
  [(SBSystemUISceneResolutionStage *)v5 setSceneProvider:self];
  id v6 = objc_alloc_init(SBSpringBoardFocusLockResolutionStage);
  [(SBSpringBoardFocusLockResolutionStage *)v6 setDelegate:self];
  [(SBSpringBoardFocusLockResolutionStage *)v6 setSceneProvider:self];
  uint64_t v7 = objc_alloc_init(SBFocusRedirectResolutionStage);
  [(SBFocusRedirectResolutionStage *)v7 setDelegate:self];
  [(SBFocusRedirectResolutionStage *)v7 setSceneProvider:self];
  uint64_t v8 = objc_alloc_init(SBSpringBoardOutboundFocusResolutionStage);
  [(SBSpringBoardOutboundFocusResolutionStage *)v8 setSceneProvider:self];
  BOOL v9 = [SBKeyboardFocusResolutionPipeline alloc];
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
  int v11 = [(SBKeyboardFocusResolutionPipeline *)v9 initWithResolutionStages:v10];

  return v11;
}

void __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "member:");
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;

    id v6 = v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [*(id *)(a1 + 40) addObject:v6];
}

id __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 8);
  }
  else {
    return 0;
  }
}

- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isBannerKitHostingSceneWithIdentityTokenString:a3];
}

- (BOOL)hasActiveTransientOverlayPresentation
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies hasActiveTransientOverlayPresentation];
}

- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus];
}

- (BOOL)isActiveTransientOverlayPresentationFromSceneWithIdentityTokenString:(id)a3
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:a3];
}

- (id)focusTargetForActiveTransientOverlayPresentation
{
  return (id)[(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies focusTargetForActiveTransientOverlayPresentation];
}

- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3
{
  return (id)[(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies focusTargetForCoverSheetHostedAppGetCameraIsHosted:a3];
}

- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies activeTransientOverlayPresentationCanBecomeFirstResponder];
}

- (BOOL)isSpolightPresentedAsTransientOverlay
{
  return [(_SBKeyboardFocusSceneControllerDependencyProviding *)self->_dependencies isSpolightPresentedAsTransientOverlay];
}

- (void)setDebugName:(id)a3
{
}

- (int64_t)coalitionAffinity
{
  return self->_coalitionAffinity;
}

- (void)setCoalitionAffinity:(int64_t)a3
{
  self->_coalitionAffinity = a3;
}

- (SBKeyboardFocusSceneControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKeyboardFocusSceneControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBKeyboardFocusCoalition)coalition
{
  return self->_coalition;
}

- (_SBKeyboardFocusSceneControllerDependencyProviding)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
}

- (SBKeyboardFocusResolutionPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
}

- (BSCompoundAssertion)springBoardFocusRedirections
{
  return self->_springBoardFocusRedirections;
}

- (void)setSpringBoardFocusRedirections:(id)a3
{
}

- (BSCompoundAssertion)springBoardFocusLockAssertions
{
  return self->_springBoardFocusLockAssertions;
}

- (void)setSpringBoardFocusLockAssertions:(id)a3
{
}

- (NSSet)previousDependencyReasonsSpringShouldHaveFocus
{
  return self->_previousDependencyReasonsSpringShouldHaveFocus;
}

- (void)setPreviousDependencyReasonsSpringShouldHaveFocus:(id)a3
{
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
}

- (SBKeyboardFocusPolicyEnforcer)policyEnforcer
{
  return self->_policyEnforcer;
}

- (void)setPolicyEnforcer:(id)a3
{
}

- (SBKeyboardFocusPolicy)preferredPolicy
{
  return self->_preferredPolicy;
}

- (void)setPreferredPolicy:(id)a3
{
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
}

- (SBKeyboardFocusTarget)lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks
{
  return self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
}

- (void)setLastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks:(id)a3
{
}

- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes
{
  return self->_recentlyUsedScenes;
}

- (void)setRecentlyUsedScenes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedScenes, 0);
  objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_preferredPolicy, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_previousDependencyReasonsSpringShouldHaveFocus, 0);
  objc_storeStrong((id *)&self->_springBoardFocusLockAssertions, 0);
  objc_storeStrong((id *)&self->_springBoardFocusRedirections, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_coalition, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_coalitionMember, 0);
  objc_storeStrong((id *)&self->_bufferingPredicate, 0);
  objc_storeStrong((id *)&self->_sbWindowSceneFocusTarget, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

- (void)focusLockSpringBoardWindow:forReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)bufferEventsForReason:generation:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_requestPolicyReevaluationForReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)coalitionMemberFocusDidChange:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[%{public}@] coalition says I have focus, but enforced policy is the same so not updating anything: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end