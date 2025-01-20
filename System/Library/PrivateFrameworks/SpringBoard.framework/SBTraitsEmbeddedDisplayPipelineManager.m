@interface SBTraitsEmbeddedDisplayPipelineManager
- (BOOL)_isBacklightOn;
- (BOOL)supportsLiveDeviceRotation;
- (SBTraitsEmbeddedDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5;
- (TRAArbitrationInputs)inputs;
- (id)_layoutCoordinator;
- (id)_orientationInputsForDeviceOrientation:(int64_t)a3;
- (id)_orientationStateDescription;
- (id)ambientPresentationStageRoles;
- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3;
- (id)orientationStageRoles;
- (id)userInterfaceStyleStageRoles;
- (id)zOrderStageRoles;
- (int64_t)_bootOrientation;
- (void)_addLastNonFlatOverrideInputsValidatorIfNeeded;
- (void)_controlCenterDidDismiss:(id)a3;
- (void)_controlCenterWillDismiss:(id)a3;
- (void)_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:(int64_t)a3;
- (void)_noteCoverSheetDidDismiss;
- (void)_noteCoverSheetDidPresent;
- (void)_noteCoverSheetWillDismiss;
- (void)_noteCoverSheetWillPresent;
- (void)_noteInputsNeedUpdateAnimated:(BOOL)a3 reason:(id)a4;
- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5;
- (void)_systemOrientationLockChanged:(id)a3;
- (void)_updateInputs;
- (void)_updateOrientationEventsEnabledState;
- (void)_updateOrientationInputsDeferralAnimated:(BOOL)a3;
- (void)_userOrientationLockChanged:(id)a3;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)ambientPresentationController:(id)a3 didUpdateAmbientDisplayStyle:(int64_t)a4;
- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4;
- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4;
- (void)arbiter:(id)a3 didCompleteUpdateWithContext:(id)a4;
- (void)arbiter:(id)a3 willBeginUpdateWithContext:(id)a4;
- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)setKeyboardFocusContext:(id)a3;
- (void)setupDefaultPipelineForArbiter:(id)a3;
- (void)startListeningForLockScreenUIPresentations;
- (void)startObservingAmbientPresentation;
- (void)startObservingLayoutStateTransitions;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4;
@end

@implementation SBTraitsEmbeddedDisplayPipelineManager

- (void)arbiter:(id)a3 willBeginUpdateWithContext:(id)a4
{
}

- (TRAArbitrationInputs)inputs
{
  return self->_inputs;
}

- (BOOL)supportsLiveDeviceRotation
{
  return self->_accelerometer != 0;
}

- (void)_updateOrientationInputsDeferralAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn];
  uint64_t v6 = !v5 | [(SBDeviceOrientationUpdateManager *)self->_systemOrientationLockManager isCurrentlyDeferringOrientationUpdates];
  [(SBTraitsInputsOrientationLockValidator *)self->_orientationLockInputsValidator setPrefersDeferringOrientationUpdates:v6];
  if ((v6 & 1) == 0)
  {
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:v3 reason:@"Stop deferring orientation inputs updates."];
  }
}

- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn])
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
    BOOL v5 = [(SBTraitsPipelineManager *)&v7 defaultOrientationAnimationSettingsAnimatable:v3];
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
  }
  return v5;
}

- (BOOL)_isBacklightOn
{
  return self->_backlightIsOn;
}

- (void)arbiter:(id)a3 didCompleteUpdateWithContext:(id)a4
{
  unint64_t v4 = self->_arbiterRunningUpdatesCount - 1;
  self->_arbiterRunningUpdatesCount = v4;
  if (!v4)
  {
    objc_msgSend(a4, "orientationActuationContext", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v5 = [v6 drawingFence];
    [v5 invalidate];
  }
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4 = a4;
  [v4 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_134];
  [v4 updateOrientationPreferencesWithBlock:&__block_literal_global_102];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5 = a4;
  id v25 = [(SBTraitsPipelineManager *)self arbiter];
  id v6 = [v5 fromLayoutState];
  objc_super v7 = [v5 toLayoutState];
  v8 = [v5 applicationTransitionContext];

  v9 = [SBSwitcherLayoutTransitionNotes alloc];
  v10 = [v8 request];
  v11 = [(SBSwitcherLayoutTransitionNotes *)v9 initWithFromPreviousState:v6 currentLayoutState:v7 transitionRequest:v10];

  if (self->_dockFollowsHomeSpecifier)
  {
    v12 = [v25 orientationResolutionStage];
    [v12 removeResolutionPolicySpecifier:self->_dockFollowsHomeSpecifier];

    dockFollowsHomeSpecifier = self->_dockFollowsHomeSpecifier;
    self->_dockFollowsHomeSpecifier = 0;
  }
  if (self->_controlCenterIsolationSpecifier)
  {
    v14 = [v25 orientationResolutionStage];
    [v14 removeResolutionPolicySpecifier:self->_controlCenterIsolationSpecifier];

    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = 0;
  }
  if ([(SBSwitcherLayoutTransitionNotes *)v11 inAnySwitcher]
    || [(SBSwitcherLayoutTransitionNotes *)v11 inApp])
  {
    if (self->_homeIsolationSpecifier)
    {
      v16 = [v25 orientationResolutionStage];
      [v16 removeResolutionPolicySpecifier:self->_homeIsolationSpecifier];

      homeIsolationSpecifier = self->_homeIsolationSpecifier;
      self->_homeIsolationSpecifier = 0;
    }
    if (!self->_homeFollowsSwitcherSpecifier)
    {
      v18 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)[SBTraitsHomeFollowsSwitcherRawPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F20];
      homeFollowsSwitcherSpecifier = self->_homeFollowsSwitcherSpecifier;
      self->_homeFollowsSwitcherSpecifier = v18;

      v20 = [v25 orientationResolutionStage];
      [v20 addResolutionPolicySpecifier:self->_homeFollowsSwitcherSpecifier animate:0];
    }
  }
  else if ([(SBSwitcherLayoutTransitionNotes *)v11 inHomeScreen])
  {
    if (self->_homeFollowsSwitcherSpecifier)
    {
      v21 = [v25 orientationResolutionStage];
      [v21 removeResolutionPolicySpecifier:self->_homeFollowsSwitcherSpecifier];

      v22 = self->_homeFollowsSwitcherSpecifier;
      self->_homeFollowsSwitcherSpecifier = 0;
    }
    if (self->_homeIsolationSpecifier)
    {
      v23 = [v25 orientationResolutionStage];
      [v23 removeResolutionPolicySpecifier:self->_homeIsolationSpecifier];

      v24 = self->_homeIsolationSpecifier;
      self->_homeIsolationSpecifier = 0;
    }
    if ([(SBSwitcherLayoutTransitionNotes *)v11 stableInHomeScreen]) {
      [(SBTraitsEmbeddedDisplayPipelineManager *)self _addLastNonFlatOverrideInputsValidatorIfNeeded];
    }
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5 = a4;
  id v31 = [(SBTraitsPipelineManager *)self arbiter];
  id v6 = [v5 fromLayoutState];
  objc_super v7 = [v5 toLayoutState];
  v8 = [v5 applicationTransitionContext];

  v9 = [SBSwitcherLayoutTransitionNotes alloc];
  v10 = [v8 request];
  v11 = [(SBSwitcherLayoutTransitionNotes *)v9 initWithFromPreviousState:v6 currentLayoutState:v7 transitionRequest:v10];

  BOOL v12 = [(SBSwitcherLayoutTransitionNotes *)v11 fromHomeScreen];
  BOOL v13 = [(SBSwitcherLayoutTransitionNotes *)v11 inApp];
  BOOL v14 = v13;
  if (!v12)
  {
    if (![(SBSwitcherLayoutTransitionNotes *)v11 inHomeScreen]) {
      goto LABEL_20;
    }
    if (self->_homeFollowsSwitcherSpecifier)
    {
      if ([(SBSwitcherLayoutTransitionNotes *)v11 isHomeButtonInitiated])
      {
        v18 = [v31 orientationResolutionStage];
        [v18 removeResolutionPolicySpecifier:self->_homeFollowsSwitcherSpecifier animate:0];

        homeFollowsSwitcherSpecifier = self->_homeFollowsSwitcherSpecifier;
        self->_homeFollowsSwitcherSpecifier = 0;
      }
      else
      {
        if (self->_homeIsolationSpecifier) {
          goto LABEL_18;
        }
        v23 = [(SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier *)[SBTraitsHomeInIsolationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F20];
        homeIsolationSpecifier = self->_homeIsolationSpecifier;
        self->_homeIsolationSpecifier = v23;

        homeFollowsSwitcherSpecifier = [v31 orientationResolutionStage];
        [homeFollowsSwitcherSpecifier addResolutionPolicySpecifier:self->_homeIsolationSpecifier animate:0];
      }
    }
LABEL_18:
    if (!self->_dockFollowsHomeSpecifier)
    {
      id v25 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)[SBTraitsDockFollowsHomePolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F38];
      dockFollowsHomeSpecifier = self->_dockFollowsHomeSpecifier;
      self->_dockFollowsHomeSpecifier = v25;

      v27 = [v31 orientationResolutionStage];
      [v27 addResolutionPolicySpecifier:self->_dockFollowsHomeSpecifier];
    }
LABEL_20:
    if (![(SBSwitcherLayoutTransitionNotes *)v11 fromApp] || !v14) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (v13 && !self->_dockFollowsHomeSpecifier)
  {
    v15 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)[SBTraitsDockFollowsHomePolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F38];
    v16 = self->_dockFollowsHomeSpecifier;
    self->_dockFollowsHomeSpecifier = v15;

    v17 = [v31 orientationResolutionStage];
    [v17 addResolutionPolicySpecifier:self->_dockFollowsHomeSpecifier];
  }
  if ([(SBSwitcherLayoutTransitionNotes *)v11 inAnySwitcher] && !self->_homeFollowsSwitcherSpecifier)
  {
    v20 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)[SBTraitsHomeFollowsSwitcherRawPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F20];
    v21 = self->_homeFollowsSwitcherSpecifier;
    self->_homeFollowsSwitcherSpecifier = v20;

    v22 = [v31 orientationResolutionStage];
    [v22 addResolutionPolicySpecifier:self->_homeFollowsSwitcherSpecifier animate:0];

    if (!v14) {
      goto LABEL_8;
    }
  }
  else if (!v14)
  {
LABEL_8:
    [(SBSwitcherLayoutTransitionNotes *)v11 fromApp];
    goto LABEL_23;
  }
LABEL_21:
  if (!self->_controlCenterIsolationSpecifier)
  {
    v28 = [(SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier *)[SBTraitsControlCenterInIsolationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F68];
    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = v28;

    v30 = [v31 orientationResolutionStage];
    [v30 addResolutionPolicySpecifier:self->_controlCenterIsolationSpecifier update:0];
  }
LABEL_23:
}

- (void)_addLastNonFlatOverrideInputsValidatorIfNeeded
{
  if (!self->_lastNonFlatOverrideInputsValidator)
  {
    BOOL v3 = [(SBTraitsInputsValidator *)[SBTraitsInputsOrientationNonFlatOverrideValidator alloc] initWithValidatorOrder:&unk_1F3349F98];
    lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
    self->_lastNonFlatOverrideInputsValidator = v3;

    [(SBTraitsInputsOrientationNonFlatOverrideValidator *)self->_lastNonFlatOverrideInputsValidator setLastNonFlatOrientationOverride:[(TRAParticipant *)self->_activeOrientationParticipant currentOrientation]];
    id v6 = [(SBTraitsPipelineManager *)self arbiter];
    id v5 = [v6 inputsValidationStage];
    [v5 addInputsValidator:self->_lastNonFlatOverrideInputsValidator];
  }
}

- (void)_systemOrientationLockChanged:(id)a3
{
}

void __98__SBTraitsEmbeddedDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC8]) initWithAnimationSettings:*(void *)(a1 + 32) drawingFence:*(void *)(a1 + 40)];
  [v3 setOrientationActuationContext:v8];
  [v3 setUserInterfaceStyleActuationContext:v8];
  [v3 setReason:*(void *)(a1 + 48)];
}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:30];
}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:1.79769313e308];
}

- (void)_noteInputsNeedUpdateAnimated:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBTraitsEmbeddedDisplayPipelineManager *)self defaultOrientationAnimationSettingsAnimatable:v4];
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateWithAnimationSettings:v7 fence:0 reason:v6];
}

- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(SBTraitsPipelineManager *)self arbiter];
  id v13 = objc_alloc(MEMORY[0x1E4FAFF78]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __98__SBTraitsEmbeddedDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
  v21 = &unk_1E6B004E0;
  id v22 = v9;
  id v23 = v10;
  id v24 = v11;
  SEL v25 = a2;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  v17 = (void *)[v13 initWithBuilder:&v18];
  objc_msgSend(v12, "setNeedsUpdateArbitrationWithContext:", v17, v18, v19, v20, v21);
}

- (SBTraitsEmbeddedDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  id v11 = [(SBTraitsPipelineManager *)&v24 initWithArbiter:v8 sceneDelegate:v9 userInterfaceStyleProvider:v10];
  if (v11)
  {
    uint64_t v12 = +[SBOrientationLockManager sharedInstance];
    userOrientationLockManager = v11->_userOrientationLockManager;
    v11->_userOrientationLockManager = (SBOrientationLockManager *)v12;

    uint64_t v14 = objc_msgSend((id)SBApp, "_legacy_deviceOrientationUpdateManager");
    systemOrientationLockManager = v11->_systemOrientationLockManager;
    v11->_systemOrientationLockManager = (SBDeviceOrientationUpdateManager *)v14;

    id v16 = objc_alloc_init(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider);
    rolesAndDefaultPoliciesProvider = v11->_rolesAndDefaultPoliciesProvider;
    v11->_rolesAndDefaultPoliciesProvider = v16;

    objc_initWeak(&location, v11);
    id v18 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v22, &location);
    uint64_t v19 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v11->_stateCaptureInvalidatable;
    v11->_stateCaptureInvalidatable = (BSInvalidatable *)v19;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __99__SBTraitsEmbeddedDisplayPipelineManager_initWithArbiter_sceneDelegate_userInterfaceStyleProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _orientationStateDescription];

  return v2;
}

- (id)_orientationStateDescription
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBTraitsPipelineManager *)self arbiter];

  if (v3)
  {
    BOOL v4 = +[SBBacklightController sharedInstanceIfExists];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Backlight is on (SBBacklightController %p)", v4);
    v14[0] = v5;
    [v4 screenIsOn];
    id v6 = NSStringFromBOOL();
    v15[0] = v6;
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Backlight is on (SBTraitsEmbeddedDisplayPipelineManager %p)", self);
    v14[1] = v7;
    id v8 = NSStringFromBOOL();
    v15[1] = v8;
    v14[2] = @"Inputs";
    inputs = self->_inputs;
    if (inputs)
    {
      id v10 = [(TRAArbitrationInputs *)inputs description];
    }
    else
    {
      id v10 = @"No inputs yet";
    }
    v15[2] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v11 = [v12 description];

    if (inputs) {
  }
    }
  else
  {
    id v11 = @"waiting for an arbiter to become available";
  }
  return v11;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(SBTraitsPipelineManager *)self arbiter];
  [v4 removeObserver:self];

  id v5 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _layoutCoordinator];
  [v5 removeObserver:self];

  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
  id v6 = [(SBTraitsPipelineManager *)self sceneDelegate];
  id v7 = [v6 windowScene];
  id v8 = [v7 ambientPresentationController];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  [(SBTraitsEmbeddedDisplayPipelineManager *)&v9 dealloc];
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v48 = v4;
    id v5 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x1E4F4F218]);
    accelerometer = self->_accelerometer;
    self->_accelerometer = v5;

    [(BKSAccelerometer *)self->_accelerometer setDelegate:self];
    id v7 = (TRAArbitrationKeyboardInputs *)[objc_alloc(MEMORY[0x1E4FAFFA0]) initWithKeyboardFocusedParticipantUniqueIdentifier:0];
    keyboardInputs = self->_keyboardInputs;
    self->_keyboardInputs = v7;

    id v9 = objc_alloc(MEMORY[0x1E4FAFF98]);
    id v10 = [MEMORY[0x1E4F42948] currentDevice];
    id v11 = (TRAArbitrationInterfaceIdiomInputs *)objc_msgSend(v9, "initWithIsPad:", objc_msgSend(v10, "userInterfaceIdiom") == 1);
    deviceIdiomInputs = self->_deviceIdiomInputs;
    self->_deviceIdiomInputs = v11;

    id v13 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _orientationInputsForDeviceOrientation:[(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation]];
    orientationInputs = self->_orientationInputs;
    self->_orientationInputs = v13;

    id v15 = objc_alloc(MEMORY[0x1E4FAFFA8]);
    id v16 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
    v17 = (TRAArbitrationUserInterfaceStyleInputs *)objc_msgSend(v15, "initWithUserInterfaceStyle:", objc_msgSend(v16, "currentStyle"));
    userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
    self->_userInterfaceStyleInputs = v17;

    uint64_t v19 = (TRAArbitrationAmbientPresentationInputs *)[objc_alloc(MEMORY[0x1E4FAFF80]) initWithAmbientPresented:0 ambientDisplayStyle:0];
    ambientPresentationInputs = self->_ambientPresentationInputs;
    self->_ambientPresentationInputs = v19;

    [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateInputs];
    v21 = [v48 inputsValidationStage];
    id v22 = [(SBTraitsInputsValidator *)[SBTraitsInputsAllUnknownOrientationValidator alloc] initWithValidatorOrder:&unk_1F3349F20];
    id v23 = [[SBTraitsInputsOrientationLockValidator alloc] initWithValidatorOrder:&unk_1F3349F38];
    orientationLockInputsValidator = self->_orientationLockInputsValidator;
    self->_orientationLockInputsValidator = v23;

    [v21 addInputsValidator:v22 update:0];
    [v21 addInputsValidator:self->_orientationLockInputsValidator update:0];
    SEL v25 = [v48 zOrderResolutionStage];
    v26 = [(SBTraitsZOrderStageComponent *)[SBTraitsZOrderDefaultResolver alloc] initWithComponentOrder:&unk_1F3349F50];
    [v25 addStageResolver:v26];

    v27 = [v48 orientationResolutionStage];
    v28 = [[SBTraitsOrientationDefaultResolutionPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F50 dataSource:self->_rolesAndDefaultPoliciesProvider];
    [v27 addResolutionPolicySpecifier:v28 update:0];

    v29 = [(SBTraitsOrientationStageComponent *)[SBTraitsOrientationDefaultTreeNodesSpecifier alloc] initWithComponentOrder:&unk_1F3349F50];
    [v27 addNodesSpecificationsSpecifier:v29];

    v30 = [[SBTraitsOrientationDefaultTreeResolver alloc] initWithComponentOrder:&unk_1F3349F50];
    [v27 addStageResolver:v30];

    id v31 = [v48 ambientPresentationResolutionStage];
    v32 = [[SBTraitsAmbientPresentationDefaultResolver alloc] initWithThresholdRole:@"SBTraitsParticipantRoleAmbient" componentOrder:&unk_1F3349F50];
    [v31 addStageResolver:v32];

    v33 = [v48 userInterfaceStyleResolutionStage];
    v34 = [(SBTraitsUserInterfaceStyleStageComponent *)[SBTraitsUserInterfaceStyleDefaultResolver alloc] initWithComponentOrder:&unk_1F3349F50];
    [v33 addStageResolver:v34];

    v35 = [v48 acquireParticipantWithRole:@"SBTraitsParticipantRolePipelineManager" delegate:self];
    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v35;

    v37 = self->_activeOrientationParticipant;
    v38 = NSString;
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v41 = [v38 stringWithFormat:@"%@-Setup", v40];
    [(TRAParticipant *)v37 setNeedsUpdatePreferencesWithReason:v41];

    [(TRAParticipant *)self->_activeOrientationParticipant updatePreferencesIfNeeded];
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateOrientationEventsEnabledState];
    v42 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v43 = [v42 userInterfaceIdiom];

    if ((v43 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      int64_t v44 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _bootOrientation];
      if (v44)
      {
        int64_t v45 = v44;
        [(SBTraitsEmbeddedDisplayPipelineManager *)self _addLastNonFlatOverrideInputsValidatorIfNeeded];
        [(SBTraitsInputsOrientationNonFlatOverrideValidator *)self->_lastNonFlatOverrideInputsValidator setLastNonFlatOrientationOverride:v45];
      }
    }
    v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v46 addObserver:self selector:sel__userOrientationLockChanged_ name:*MEMORY[0x1E4FA7A88] object:0];
    [v46 addObserver:self selector:sel__controlCenterWillDismiss_ name:@"SBControlCenterControllerWillDismissNotification" object:0];
    [v46 addObserver:self selector:sel__controlCenterDidDismiss_ name:@"SBControlCenterControllerDidDismissNotification" object:0];
    [v46 addObserver:self selector:sel__systemOrientationLockChanged_ name:@"SBDeviceOrientationUpdateManager-DeferralAssertionAcquired" object:0];
    [v46 addObserver:self selector:sel__systemOrientationLockChanged_ name:@"SBDeviceOrientationUpdateManager-HasNoActiveDeferralAssertions" object:0];
    v47 = +[SBBacklightController sharedInstanceIfExists];
    self->_backlightIsOn = [v47 screenIsOn];
    [v47 addObserver:self];
    [v48 addObserver:self];

    id v4 = v48;
  }
}

- (void)startObservingLayoutStateTransitions
{
  id v3 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _layoutCoordinator];
  [v3 addObserver:self];
}

- (void)startListeningForLockScreenUIPresentations
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = [(SBTraitsPipelineManager *)self sceneDelegate];
  id v4 = [v3 windowScene];

  [v5 addObserver:self selector:sel__noteCoverSheetWillPresent name:@"SBLockScreenUIWillPresentNotification" object:v4];
  [v5 addObserver:self selector:sel__noteCoverSheetDidPresent name:@"SBLockScreenUIDidPresentNotification" object:v4];
  [v5 addObserver:self selector:sel__noteCoverSheetWillDismiss name:@"SBLockScreenUIWillDismissNotification" object:v4];
  [v5 addObserver:self selector:sel__noteCoverSheetDidDismiss name:@"SBLockScreenUIDidDismissNotification" object:v4];
}

- (void)startObservingAmbientPresentation
{
  id v3 = [(SBTraitsPipelineManager *)self sceneDelegate];
  id v4 = [v3 windowScene];
  id v5 = [v4 ambientPresentationController];

  -[SBTraitsEmbeddedDisplayPipelineManager ambientPresentationController:didUpdatePresented:](self, "ambientPresentationController:didUpdatePresented:", v5, [v5 isPresented]);
  [v5 addObserver:self];
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FAFFA8];
  id v7 = a4;
  id v12 = a3;
  id v8 = [v6 alloc];
  id v9 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
  id v10 = (TRAArbitrationUserInterfaceStyleInputs *)objc_msgSend(v8, "initWithUserInterfaceStyle:", objc_msgSend(v9, "currentStyle"));
  userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
  self->_userInterfaceStyleInputs = v10;

  [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateInputs];
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateWithAnimationSettings:v12 fence:v7 reason:@"User Interface Style changed"];
}

- (void)setKeyboardFocusContext:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  [(SBTraitsPipelineManager *)&v14 setKeyboardFocusContext:v4];
  keyboardFocusInputsValidator = self->_keyboardFocusInputsValidator;
  if (!keyboardFocusInputsValidator
    || ([(SBTraitsInputsKeyboardFocusValidator *)keyboardFocusInputsValidator focusContext],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqual:v4],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [(SBTraitsPipelineManager *)self arbiter];
    id v9 = v8;
    if (self->_keyboardFocusInputsValidator)
    {
      if (!v4)
      {
        id v10 = [v8 inputsValidationStage];
        [v10 removeInputsValidator:self->_keyboardFocusInputsValidator];

        id v11 = self->_keyboardFocusInputsValidator;
        self->_keyboardFocusInputsValidator = 0;
LABEL_8:
      }
    }
    else if (v4)
    {
      id v12 = objc_alloc_init(SBTraitsInputsKeyboardFocusValidator);
      id v13 = self->_keyboardFocusInputsValidator;
      self->_keyboardFocusInputsValidator = v12;

      id v11 = [v9 inputsValidationStage];
      [v11 addInputsValidator:self->_keyboardFocusInputsValidator];
      goto LABEL_8;
    }
    [(SBTraitsInputsKeyboardFocusValidator *)self->_keyboardFocusInputsValidator setFocusContext:v4];
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:1 reason:@"keyboard focus context changed"];
  }
}

- (id)_layoutCoordinator
{
  v2 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v3 = [v2 _layoutStateTransitionCoordinator];

  return v3;
}

- (void)_userOrientationLockChanged:(id)a3
{
  int64_t v4 = [(SBOrientationLockManager *)self->_userOrientationLockManager effectiveLockedOrientation];
  if ([(SBOrientationLockManager *)self->_userOrientationLockManager isEffectivelyLocked]) {
    BOOL v5 = (unint64_t)(v4 - 1) >= 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    int64_t v4 = [(SBOrientationLockManager *)self->_userOrientationLockManager userLockOrientation];
  }
  [(SBTraitsInputsOrientationLockValidator *)self->_orientationLockInputsValidator setLockOrientation:v4];
  BOOL v6 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn];
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:v6 reason:@"User orientation lock changed."];
}

- (void)_updateInputs
{
  id v3 = (TRAArbitrationInputs *)[objc_alloc(MEMORY[0x1E4FAFF90]) initWithInterfaceIdiomInputs:self->_deviceIdiomInputs userInterfaceStyleInputs:self->_userInterfaceStyleInputs deviceOrientationInputs:self->_orientationInputs keyboardInputs:self->_keyboardInputs ambientPresentationInputs:self->_ambientPresentationInputs];
  inputs = self->_inputs;
  self->_inputs = v3;
}

- (void)_controlCenterWillDismiss:(id)a3
{
  if (!self->_controlCenterIsolationSpecifier)
  {
    int64_t v4 = [(SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier *)[SBTraitsControlCenterInIsolationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F68];
    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = v4;

    id v7 = [(SBTraitsPipelineManager *)self arbiter];
    BOOL v6 = [v7 orientationResolutionStage];
    [v6 addResolutionPolicySpecifier:self->_controlCenterIsolationSpecifier update:0];
  }
}

- (void)_controlCenterDidDismiss:(id)a3
{
  if (self->_controlCenterIsolationSpecifier)
  {
    int64_t v4 = [(SBTraitsPipelineManager *)self arbiter];
    BOOL v5 = [v4 orientationResolutionStage];
    [v5 removeResolutionPolicySpecifier:self->_controlCenterIsolationSpecifier];

    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = 0;
  }
}

- (id)zOrderStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider zOrderStageRoles];
}

- (id)orientationStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider orientationStageRoles];
}

- (id)ambientPresentationStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider ambientPresentationStageRoles];
}

- (id)userInterfaceStyleStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider userInterfaceStyleStageRoles];
}

- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = SBSBacklightChangeSourceDescription(a5);
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline] Backlight is animating with source: %{public}@ to factor: %.1f", (uint8_t *)&v12, 0x16u);
  }
  int v10 = BSFloatGreaterThanFloat();
  int v11 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn];
  self->_backlightIsOn = v10;
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateOrientationEventsEnabledState];
  if (v10 != v11) {
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateOrientationInputsDeferralAnimated:0];
  }
}

- (void)_updateOrientationEventsEnabledState
{
  BOOL v3 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn];
  int64_t v4 = +[SBPlatformController sharedInstance];
  unsigned int v5 = [v4 prefersAlwaysOnOrientation];

  uint64_t v6 = v3 | v5;
  if (v6 != [(BKSAccelerometer *)self->_accelerometer orientationEventsEnabled])
  {
    accelerometer = self->_accelerometer;
    [(BKSAccelerometer *)accelerometer setOrientationEventsEnabled:v6];
  }
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = SBFStringForBSDeviceOrientation();
    int v10 = 138543362;
    int v11 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline][Accelerometer] did change device orientation to: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:a4];
  id v8 = [(SBTraitsEmbeddedDisplayPipelineManager *)self _orientationInputsForDeviceOrientation:a4];
  orientationInputs = self->_orientationInputs;
  self->_orientationInputs = v8;

  [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateInputs];
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:[(SBTraitsEmbeddedDisplayPipelineManager *)self _isBacklightOn] reason:@"Device orientation change"];
}

- (id)_orientationInputsForDeviceOrientation:(int64_t)a3
{
  int64_t NonFlatDeviceOrientation = a3;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (self->_lastNonFlatOrientation) {
      goto LABEL_5;
    }
    int64_t NonFlatDeviceOrientation = BKHIDServicesGetNonFlatDeviceOrientation();
  }
  self->_lastNonFlatOrientation = NonFlatDeviceOrientation;
LABEL_5:
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:a3 nonFlatDeviceOrientation:self->_lastNonFlatOrientation];
  return v6;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v25 = a3;
  unsigned int v5 = [v25 role];
  int v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  id v7 = v25;
  if (v6)
  {
    id v8 = [(TRAParticipant *)self->_activeOrientationParticipant currentSettings];
    id v9 = [v8 orientationSettings];
    int v10 = [v9 validatedOrientationInputs];
    uint64_t v11 = [v10 currentDeviceOrientation];

    uint64_t v12 = [(TRAParticipant *)self->_activeOrientationParticipant previousSettings];
    id v13 = [v12 orientationSettings];
    __int16 v14 = [v13 validatedOrientationInputs];
    uint64_t v15 = [v14 currentDeviceOrientation];

    if (v11 != v15) {
      [(SBDeviceOrientationUpdateManager *)self->_systemOrientationLockManager _legacy_enqueueOrientationUpdateToDeviceOrientation:v11 source:@"pipeline manager"];
    }
    uint64_t v16 = objc_msgSend(v25, "sbf_currentOrientation");
    uint64_t v17 = objc_msgSend(v25, "sbf_previousOrientation");
    id v7 = v25;
    if (v16 != v17)
    {
      kdebug_trace();
      objc_msgSend(MEMORY[0x1E4F39CF8], "bs_performAfterCommit:", &__block_literal_global_109);
      lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
      if (lastNonFlatOverrideInputsValidator) {
        [(SBTraitsInputsOrientationNonFlatOverrideValidator *)lastNonFlatOverrideInputsValidator setLastNonFlatOrientationOverride:v16];
      }
      uint64_t v19 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:v17 toInterfaceOrientation:v16];
      if (SBFIsIRDCResetAvailable())
      {
        [v19 duration];
        if (v20 > 0.0) {
          CARenderServerFlushIRDC();
        }
      }
      v21 = (void *)SBApp;
      [v19 duration];
      objc_msgSend(v21, "_legacy_noteInterfaceOrientationChanged:duration:updateMirroredDisplays:force:logMessage:", v16, 1, 1, @"SBTraitArbiterPipelineManager");
      id v22 = [(SBTraitsPipelineManager *)self sceneDelegate];
      id v23 = [v22 windowScene];
      objc_super v24 = [v23 displayLayoutPublisher];
      [v24 setInterfaceOrientation:v16];

      id v7 = v25;
    }
  }
}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_didChangeSettingsForParticipant_context___block_invoke()
{
  return kdebug_trace();
}

- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(SBTraitsPipelineManager *)self arbiter];
  ambientFollowsRawDeviceOrientationSpecifier = self->_ambientFollowsRawDeviceOrientationSpecifier;
  if (v4)
  {
    if (ambientFollowsRawDeviceOrientationSpecifier) {
      goto LABEL_7;
    }
    id v12 = v6;
    id v8 = [(SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *)[SBAmbientFollowsRawDeviceOrientationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349F80];
    id v9 = self->_ambientFollowsRawDeviceOrientationSpecifier;
    self->_ambientFollowsRawDeviceOrientationSpecifier = v8;

    [(SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *)self->_ambientFollowsRawDeviceOrientationSpecifier setDeviceOrientationStateTypes:&unk_1F3347D00];
    int v10 = [v12 orientationResolutionStage];
    [v10 addResolutionPolicySpecifier:self->_ambientFollowsRawDeviceOrientationSpecifier];
  }
  else
  {
    if (!ambientFollowsRawDeviceOrientationSpecifier) {
      goto LABEL_7;
    }
    id v12 = v6;
    uint64_t v11 = [v6 orientationResolutionStage];
    [v11 removeResolutionPolicySpecifier:self->_ambientFollowsRawDeviceOrientationSpecifier];

    int v10 = self->_ambientFollowsRawDeviceOrientationSpecifier;
    self->_ambientFollowsRawDeviceOrientationSpecifier = 0;
  }

  int v6 = v12;
LABEL_7:
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FAFF80]), "initWithAmbientPresented:ambientDisplayStyle:", a4, SBTraitsAmbientDisplayStyleForAmbientDisplayStyle(objc_msgSend(a3, "ambientDisplayStyle")));
  if (([obj isEqual:self->_ambientPresentationInputs] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ambientPresentationInputs, obj);
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateInputs];
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:1 reason:@"ambient presentation state changed"];
  }
}

- (void)ambientPresentationController:(id)a3 didUpdateAmbientDisplayStyle:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = SBTraitsAmbientDisplayStyleForAmbientDisplayStyle(a4);
  id v8 = objc_alloc(MEMORY[0x1E4FAFF80]);
  uint64_t v9 = [v6 isPresented];

  id obj = (id)[v8 initWithAmbientPresented:v9 ambientDisplayStyle:v7];
  if (([obj isEqual:self->_ambientPresentationInputs] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ambientPresentationInputs, obj);
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _updateInputs];
    [(SBTraitsEmbeddedDisplayPipelineManager *)self _noteInputsNeedUpdateAnimated:1 reason:@"ambient display style changed"];
  }
}

- (void)_noteCoverSheetWillPresent
{
  self->_isCoversheetPresented = 1;
  [(SBDeviceOrientationUpdateDeferralAssertion *)self->_deviceUpdateDeferralAssertion invalidate];
  BOOL v3 = [(SBDeviceOrientationUpdateManager *)self->_systemOrientationLockManager deviceOrientationUpdateDeferralAssertionWithReason:@"Coversheet presentation"];
  deviceUpdateDeferralAssertion = self->_deviceUpdateDeferralAssertion;
  self->_deviceUpdateDeferralAssertion = v3;

  if (!self->_coverSheetIsolationSpecifier)
  {
    unsigned int v5 = [(SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier *)[SBTraitsCoverSheetInIsolationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349FB0];
    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = v5;

    id v8 = [(SBTraitsPipelineManager *)self arbiter];
    BOOL v7 = [v8 orientationResolutionStage];
    [v7 addResolutionPolicySpecifier:self->_coverSheetIsolationSpecifier update:0];
  }
}

- (void)_noteCoverSheetDidPresent
{
  self->_isCoversheetPresented = 1;
  [(SBDeviceOrientationUpdateDeferralAssertion *)self->_deviceUpdateDeferralAssertion invalidate];
  id v16 = [(SBTraitsPipelineManager *)self arbiter];
  if (self->_coverSheetIsolationSpecifier)
  {
    BOOL v3 = [v16 orientationResolutionStage];
    [v3 removeResolutionPolicySpecifier:self->_coverSheetIsolationSpecifier update:0];

    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = 0;
  }
  if (!self->_coverSheetFollowsDeviceOrientationSpecifier)
  {
    unsigned int v5 = [(SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *)[SBTraitsCoverSheetFollowsDeviceOrientationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349FC8];
    coverSheetFollowsDeviceOrientationSpecifier = self->_coverSheetFollowsDeviceOrientationSpecifier;
    self->_coverSheetFollowsDeviceOrientationSpecifier = v5;

    BOOL v7 = [(SBTraitsOrientationStageComponent *)[SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349FE0];
    coverSheetFollowsSecureAppOrientationSpecifier = self->_coverSheetFollowsSecureAppOrientationSpecifier;
    self->_coverSheetFollowsSecureAppOrientationSpecifier = v7;

    uint64_t v9 = [v16 orientationResolutionStage];
    [v9 addResolutionPolicySpecifier:self->_coverSheetFollowsDeviceOrientationSpecifier];

    int v10 = [v16 orientationResolutionStage];
    [v10 addResolutionPolicySpecifier:self->_coverSheetFollowsSecureAppOrientationSpecifier update:0];
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12) {
      goto LABEL_12;
    }
  }
  if (!self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation)
  {
    id v13 = [(SBTraitsOrientationStageComponent *)[SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation alloc] initWithComponentOrder:&unk_1F3349FF8];
    unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
    self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = v13;

    uint64_t v15 = [v16 orientationResolutionStage];
    [v15 addResolutionPolicySpecifier:self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation];
  }
LABEL_12:
}

- (void)_noteCoverSheetWillDismiss
{
  self->_isCoversheetPresented = 0;
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:[(TRAArbitrationDeviceOrientationInputs *)self->_orientationInputs currentDeviceOrientation]];
  [(SBDeviceOrientationUpdateDeferralAssertion *)self->_deviceUpdateDeferralAssertion invalidate];
  BOOL v3 = [(SBDeviceOrientationUpdateManager *)self->_systemOrientationLockManager deviceOrientationUpdateDeferralAssertionWithReason:@"Coversheet dismissal"];
  deviceUpdateDeferralAssertion = self->_deviceUpdateDeferralAssertion;
  self->_deviceUpdateDeferralAssertion = v3;

  if (!self->_coverSheetIsolationSpecifier)
  {
    unsigned int v5 = [(SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier *)[SBTraitsCoverSheetInIsolationPolicySpecifier alloc] initWithComponentOrder:&unk_1F3349FB0];
    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = v5;

    id v8 = [(SBTraitsPipelineManager *)self arbiter];
    BOOL v7 = [v8 orientationResolutionStage];
    [v7 addResolutionPolicySpecifier:self->_coverSheetIsolationSpecifier update:0];
  }
}

- (void)_noteCoverSheetDidDismiss
{
  self->_isCoversheetPresented = 0;
  [(SBDeviceOrientationUpdateDeferralAssertion *)self->_deviceUpdateDeferralAssertion invalidate];
  id v11 = [(SBTraitsPipelineManager *)self arbiter];
  if (self->_coverSheetIsolationSpecifier)
  {
    BOOL v3 = [v11 orientationResolutionStage];
    [v3 removeResolutionPolicySpecifier:self->_coverSheetIsolationSpecifier update:0];

    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = 0;
  }
  if (self->_coverSheetFollowsDeviceOrientationSpecifier)
  {
    unsigned int v5 = [v11 orientationResolutionStage];
    [v5 removeResolutionPolicySpecifier:self->_coverSheetFollowsDeviceOrientationSpecifier];

    coverSheetFollowsDeviceOrientationSpecifier = self->_coverSheetFollowsDeviceOrientationSpecifier;
    self->_coverSheetFollowsDeviceOrientationSpecifier = 0;
  }
  if (self->_coverSheetFollowsSecureAppOrientationSpecifier)
  {
    BOOL v7 = [v11 orientationResolutionStage];
    [v7 removeResolutionPolicySpecifier:self->_coverSheetFollowsSecureAppOrientationSpecifier];

    coverSheetFollowsSecureAppOrientationSpecifier = self->_coverSheetFollowsSecureAppOrientationSpecifier;
    self->_coverSheetFollowsSecureAppOrientationSpecifier = 0;
  }
  if (self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation)
  {
    uint64_t v9 = [v11 orientationResolutionStage];
    [v9 removeResolutionPolicySpecifier:self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation];

    unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
    self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = 0;
  }
  [(SBTraitsEmbeddedDisplayPipelineManager *)self _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:[(TRAArbitrationDeviceOrientationInputs *)self->_orientationInputs currentDeviceOrientation]];
}

- (void)_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:(int64_t)a3
{
  unsigned int v5 = [(SBTraitsPipelineManager *)self arbiter];
  if (self->_isCoversheetPresented)
  {
    if (!self->_lastNonFlatOverrideInputsValidator) {
      goto LABEL_12;
    }
    id v15 = v5;
    id v6 = [v5 inputsValidationStage];
    [v6 removeInputsValidator:self->_lastNonFlatOverrideInputsValidator update:0];

    lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
    self->_lastNonFlatOverrideInputsValidator = 0;
  }
  else
  {
    id v15 = v5;
    id v8 = [(SBTraitsPipelineManager *)self sceneDelegate];
    uint64_t v9 = [v8 windowScene];
    int v10 = [v9 layoutStateProvider];
    lastNonFlatOverrideInputsValidator = [v10 layoutState];

    uint64_t v11 = [lastNonFlatOverrideInputsValidator unlockedEnvironmentMode];
    if ((unint64_t)(a3 - 1) > 3)
    {
      [(SBTraitsEmbeddedDisplayPipelineManager *)self _addLastNonFlatOverrideInputsValidatorIfNeeded];
    }
    else
    {
      if (self->_lastNonFlatOverrideInputsValidator) {
        BOOL v12 = v11 == 1;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        id v13 = [v15 inputsValidationStage];
        [v13 removeInputsValidator:self->_lastNonFlatOverrideInputsValidator update:0];

        __int16 v14 = self->_lastNonFlatOverrideInputsValidator;
        self->_lastNonFlatOverrideInputsValidator = 0;
      }
    }
  }

  unsigned int v5 = v15;
LABEL_12:
}

- (int64_t)_bootOrientation
{
  int v2 = MGGetSInt32Answer();
  int64_t v3 = 2;
  uint64_t v4 = 4;
  if (v2 != 270) {
    uint64_t v4 = 0;
  }
  if (v2 != 180) {
    int64_t v3 = v4;
  }
  int64_t v5 = 1;
  uint64_t v6 = 3;
  if (v2 != 90) {
    uint64_t v6 = 0;
  }
  if (v2) {
    int64_t v5 = v6;
  }
  if (v2 <= 179) {
    return v5;
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_ambientFollowsRawDeviceOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation, 0);
  objc_storeStrong((id *)&self->_coverSheetFollowsSecureAppOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_coverSheetFollowsDeviceOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_coverSheetIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_controlCenterIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_dockFollowsHomeSpecifier, 0);
  objc_storeStrong((id *)&self->_homeIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_homeFollowsSwitcherSpecifier, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_deviceUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_systemOrientationLockManager, 0);
  objc_storeStrong((id *)&self->_userOrientationLockManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusInputsValidator, 0);
  objc_storeStrong((id *)&self->_ambientPresentationInputs, 0);
  objc_storeStrong((id *)&self->_lastNonFlatOverrideInputsValidator, 0);
  objc_storeStrong((id *)&self->_orientationLockInputsValidator, 0);
  objc_storeStrong((id *)&self->_orientationInputs, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleInputs, 0);
  objc_storeStrong((id *)&self->_deviceIdiomInputs, 0);
  objc_storeStrong((id *)&self->_keyboardInputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
}

@end