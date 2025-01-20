@interface SBSystemApertureController
- (BOOL)containsHostSceneWithIdentityToken:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4;
- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3;
- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3;
- (CGRect)defaultIslandFrameInCoordinateSpace:(id)a3;
- (SBSystemApertureController)initWithWindowScene:(id)a3;
- (SBSystemApertureWindowScene)activeWindowScene;
- (id)_createHighLevelSystemApertureSceneWithIdentifier:(id)a3 sceneSpecification:(id)a4 displayConfiguration:(id)a5 continuitySession:(id)a6 atLevel:(float)a7;
- (id)_currentFirstElement;
- (id)_traParticipantForWindowScene:(id)a3;
- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4;
- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4;
- (id)animationFrameRecordings;
- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4;
- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3;
- (id)participantAssociatedWindows:(id)a3;
- (id)registerElement:(id)a3;
- (id)requireHeavyShadowAssertionForTransition;
- (id)requireKeyLineAssertionForTransition;
- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3;
- (id)restrictSystemApertureToInertWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)stateDump;
- (id)suppressHidingOfEmptySystemApertureOnClonedDisplaysWithReason:(id)a3;
- (id)suppressSystemApertureCompletelyWithReason:(id)a3;
- (id)systemApertureModelStateDump;
- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility;
- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility;
- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility;
- (void)_configureBacklightEnvironmentSceneProviderIfNecessary;
- (void)_configureLegacyStatusBarPillElementProviderIfNecessary;
- (void)_configureNoticeManagerIfNecessary;
- (void)_ensureSystemAperturesOnCorrectDisplays;
- (void)_reevaluateSystemApertureCompleteSuppression;
- (void)_updateActiveWindowSceneWithSpringBoardWindowScene:(id)a3;
- (void)_updateOrientationFromOldWindowScene:(id)a3 activeWindowScene:(id)a4;
- (void)_updateSuppressionForDefaults;
- (void)_updateVisibilityForCloningAndSnapshots;
- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4;
- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4;
- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)createHighLevelSystemApertureWindowWithWindowScene:(id)a3;
- (void)createHighLevelWindowSceneWithDisplayConfiguration:(id)a3;
- (void)createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:(id)a3;
- (void)createSuperHighLevelCurtainWithWindowScene:(id)a3;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)highLevelContinuitySystemApertureWindowSceneDidConnect:(id)a3;
- (void)highLevelContinuitySystemApertureWindowSceneDidDisconnect:(id)a3;
- (void)hostedScenesDidChange;
- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4;
- (void)setActiveWindowScene:(id)a3;
- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3;
- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)superHighLevelContinuityCurtainWindowSceneDidConnect:(id)a3;
- (void)superHighLevelContinuityCurtainWindowSceneDidDisconnect:(id)a3;
- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5;
- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5;
- (void)systemApertureViewController:(id)a3 containsAnyContent:(BOOL)a4;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
@end

@implementation SBSystemApertureController

- (id)registerElement:(id)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController registerElement:a3];
}

- (void)systemApertureViewController:(id)a3 containsAnyContent:(BOOL)a4
{
  if (self->_containsAnyContent != a4)
  {
    self->_containsAnyContent = a4;
    [(SBSystemApertureController *)self _updateVisibilityForCloningAndSnapshots];
  }
}

uint64_t __70__SBSystemApertureController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:30];
}

uint64_t __70__SBSystemApertureController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:10000001.5];
}

- (void)_updateVisibilityForCloningAndSnapshots
{
  if (self->_containsAnyContent)
  {
    BOOL v3 = 1;
LABEL_9:
    uint64_t v4 = 1;
    goto LABEL_10;
  }
  BOOL v3 = [(SBSystemApertureSettings *)self->_settings suppressHidingOnClonedDisplayWhileEmpty]|| ([(SBSystemApertureDefaults *)self->_systemApertureDefaults alwaysShowSystemApertureOnClonedDisplays] & 1) != 0|| [(NSMutableArray *)self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions count] != 0;
  if (self->_containsAnyContent
    || [(SBSystemApertureSettings *)self->_settings suppressHidingInSnapshotsWhileEmpty])
  {
    goto LABEL_9;
  }
  uint64_t v4 = [(SBSystemApertureDefaults *)self->_systemApertureDefaults alwaysShowSystemApertureInSnapshots];
LABEL_10:
  p_mainCloningShimViewController = &self->_mainCloningShimViewController;
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController setVisibleInSnapshots:v4];
  p_curtainCloningShimViewController = &self->_curtainCloningShimViewController;
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController setVisibleInSnapshots:v4];
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController setContentsDifferOnClonedDisplay:0];
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController setContentsDifferOnClonedDisplay:0];
  id v7 = [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController newDefaultVisibilityAnimator];
  v8 = v7;
  if (v3)
  {
    if (!v7)
    {
      [(SBSystemApertureCaptureVisibilityShimViewController *)*p_mainCloningShimViewController setVisibleOnClonedDisplay:1];
      uint64_t v9 = 2;
      p_mainCloningShimViewController = &self->_curtainCloningShimViewController;
LABEL_18:
      [(SBSystemApertureCaptureVisibilityShimViewController *)*p_mainCloningShimViewController setVisibleOnClonedDisplay:v3];
      [(SBSystemApertureViewController *)self->_systemApertureViewController setCloningStyle:v9];
      goto LABEL_19;
    }
  }
  else
  {
    if ([(SBSystemApertureCaptureVisibilityShimViewController *)*p_curtainCloningShimViewController isVisibleOnClonedDisplay])
    {
      [(SBSystemApertureCaptureVisibilityShimViewController *)*p_curtainCloningShimViewController setVisibleOnClonedDisplay:0];
    }
    if (!v8)
    {
      uint64_t v9 = 0;
      goto LABEL_18;
    }
  }
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController setContentsDifferOnClonedDisplay:1];
  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController setContentsDifferOnClonedDisplay:1];
  [(SBSystemApertureViewController *)self->_systemApertureViewController setCloningStyle:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke;
  v12[3] = &unk_1E6AF5D38;
  v12[4] = self;
  BOOL v13 = v3;
  [v8 addAnimations:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke_2;
  v10[3] = &unk_1E6B0CC80;
  BOOL v11 = v3;
  v10[4] = self;
  [v8 addCompletion:v10];
  [v8 startAnimation];
LABEL_19:
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSystemApertureController.m", 633, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"SBSystemApertureController.m", 634, @"Invalid parameter not satisfying: %@", @"updater != nil" object file lineNumber description];

LABEL_3:
  [v7 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_185_0];
  [v7 updateOrientationPreferencesWithBlock:&__block_literal_global_188_1];
}

- (SBSystemApertureController)initWithWindowScene:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBSystemApertureController;
  v5 = [(SBSystemApertureController *)&v36 init];
  if (v5)
  {
    uint64_t v6 = +[SBSystemApertureDomain rootSettings];
    settings = v5->_settings;
    v5->_settings = (SBSystemApertureSettings *)v6;

    [(PTSettings *)v5->_settings addKeyObserver:v5];
    v8 = +[SBDefaults localDefaults];
    uint64_t v9 = [v8 systemApertureDefaults];
    systemApertureDefaults = v5->_systemApertureDefaults;
    v5->_systemApertureDefaults = (SBSystemApertureDefaults *)v9;

    objc_initWeak(&location, v5);
    BOOL v11 = v5->_systemApertureDefaults;
    v12 = [NSString stringWithUTF8String:"alwaysShowSystemApertureOnClonedDisplays"];
    v38[0] = v12;
    BOOL v13 = [NSString stringWithUTF8String:"alwaysShowSystemApertureInSnapshots"];
    v38[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v15 = MEMORY[0x1E4F14428];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __50__SBSystemApertureController_initWithWindowScene___block_invoke;
    v33[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v34, &location);
    id v16 = (id)[(SBSystemApertureDefaults *)v11 observeDefaults:v14 onQueue:MEMORY[0x1E4F14428] withBlock:v33];

    v17 = v5->_systemApertureDefaults;
    v18 = [NSString stringWithUTF8String:"suppressDynamicIslandCompletely"];
    v37 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __50__SBSystemApertureController_initWithWindowScene___block_invoke_2;
    v31 = &unk_1E6AF4B10;
    objc_copyWeak(&v32, &location);
    id v20 = (id)[(SBSystemApertureDefaults *)v17 observeDefaults:v19 onQueue:MEMORY[0x1E4F14428] withBlock:&v28];

    v21 = objc_alloc_init(SBSystemApertureStateDumpService);
    systemApertureStateDumpService = v5->_systemApertureStateDumpService;
    v5->_systemApertureStateDumpService = v21;

    v23 = objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator", v28, v29, v30, v31);
    [v23 addActiveDisplayWindowSceneObserver:v5];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  uint64_t v24 = SBFEffectiveArtworkSubtype();
  if (v24 == 2868) {
    v25 = v5;
  }
  else {
    v25 = 0;
  }
  if (v24 == 2796) {
    v25 = v5;
  }
  if (v24 == 2622) {
    v25 = v5;
  }
  if (v24 == 2556) {
    v25 = v5;
  }
  v26 = v25;

  return v26;
}

void __50__SBSystemApertureController_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVisibilityForCloningAndSnapshots];
}

void __50__SBSystemApertureController_initWithWindowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSuppressionForDefaults];
}

- (void)dealloc
{
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureController;
  [(SBSystemApertureController *)&v4 dealloc];
}

- (void)setActiveWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (obj && WeakRetained != obj)
  {
    substituteSystemApertureViewController = self->_substituteSystemApertureViewController;
    if (!substituteSystemApertureViewController && WeakRetained)
    {
      uint64_t v6 = [SBSubstituteSystemApertureViewController alloc];
      [(SBSystemApertureViewController *)self->_systemApertureViewController minimumSensorRegionFrame];
      id v7 = -[SBSubstituteSystemApertureViewController initWithSensorRegionFrame:](v6, "initWithSensorRegionFrame:");
      v8 = self->_substituteSystemApertureViewController;
      self->_substituteSystemApertureViewController = v7;

      substituteSystemApertureViewController = self->_substituteSystemApertureViewController;
    }
    [(SBSubstituteSystemApertureViewController *)substituteSystemApertureViewController setActiveWindowScene:WeakRetained];
    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    [(SBSystemApertureViewController *)self->_systemApertureViewController setActiveWindowScene:obj];
    [(SBSystemApertureController *)self _ensureSystemAperturesOnCorrectDisplays];
    if (WeakRetained) {
      [(SBSystemApertureController *)self _updateOrientationFromOldWindowScene:WeakRetained activeWindowScene:obj];
    }
    [(SBSystemApertureController *)self hostedScenesDidChange];
  }
}

- (BOOL)containsHostSceneWithIdentityToken:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
    v8 = [WeakRetained _FBSScene];
    uint64_t v9 = [v8 identityToken];
    char v10 = [v9 isEqual:v6];

    return v10;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"token != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBSystemApertureController *)a2 containsHostSceneWithIdentityToken:(uint64_t)v12];
    }
    [v12 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_ensureSystemAperturesOnCorrectDisplays
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "removing root view controller from embedded super high level window", v2, v3, v4, v5, v6);
}

- (void)_updateOrientationFromOldWindowScene:(id)a3 activeWindowScene:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSystemApertureController *)self _traParticipantForWindowScene:a3];
  uint64_t v8 = objc_msgSend(v7, "sbf_currentOrientation");

  uint64_t v9 = [(SBSystemApertureController *)self _traParticipantForWindowScene:v6];

  uint64_t v10 = objc_msgSend(v9, "sbf_currentOrientation");
  if (v8 != v10)
  {
    systemApertureViewController = self->_systemApertureViewController;
    [(SBSystemApertureViewController *)systemApertureViewController hostOrientationDidChangeTo:v10 withPreviousOrientation:v8 context:0];
  }
}

- (id)_traParticipantForWindowScene:(id)a3
{
  uint64_t v4 = [a3 associatedWindowScene];
  int v5 = [v4 isContinuityDisplayWindowScene];
  uint64_t v6 = 104;
  if (v5) {
    uint64_t v6 = 112;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)createHighLevelWindowSceneWithDisplayConfiguration:(id)a3
{
  id v9 = a3;
  uint64_t v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622) {
      goto LABEL_8;
    }
LABEL_7:
    int v5 = +[FBSSceneSpecification specification];
    LODWORD(v6) = 1259902594;
    id v7 = [(SBSystemApertureController *)self _createHighLevelSystemApertureSceneWithIdentifier:@"SystemAperture" sceneSpecification:v5 displayConfiguration:v9 continuitySession:0 atLevel:v6];
    highLevelWindowScene = self->_highLevelWindowScene;
    self->_highLevelWindowScene = v7;

    goto LABEL_8;
  }
  if (v4 == 2868 || v4 == 2796) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:(id)a3
{
  id v9 = a3;
  uint64_t v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622) {
      goto LABEL_8;
    }
LABEL_7:
    int v5 = +[FBSSceneSpecification specification];
    LODWORD(v6) = 1260902594;
    id v7 = [(SBSystemApertureController *)self _createHighLevelSystemApertureSceneWithIdentifier:@"SuperHighLevelSystemAperture" sceneSpecification:v5 displayConfiguration:v9 continuitySession:0 atLevel:v6];
    superHighLevelWindowScene = self->_superHighLevelWindowScene;
    self->_superHighLevelWindowScene = v7;

    goto LABEL_8;
  }
  if (v4 == 2868 || v4 == 2796) {
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_createHighLevelSystemApertureSceneWithIdentifier:(id)a3 sceneSpecification:(id)a4 displayConfiguration:(id)a5 continuitySession:(id)a6 atLevel:(float)a7
{
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (void *)MEMORY[0x1E4F629B0];
  id v14 = a4;
  id v15 = a3;
  id v16 = [v13 definition];
  v17 = (void *)MEMORY[0x1E4F62A60];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 bundleIdentifier];
  id v20 = [v17 identityForIdentifier:v15 workspaceIdentifier:v19];

  [v16 setIdentity:v20];
  v21 = [FBSSceneClientIdentity localIdentity];
  [v16 setClientIdentity:v21];

  [v16 setSpecification:v14];
  v22 = (void *)MEMORY[0x1E4F629B8];
  v23 = [v16 specification];
  uint64_t v24 = [v22 parametersForSpecification:v23];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke;
  v32[3] = &unk_1E6B0EF78;
  float v35 = a7;
  id v33 = v11;
  id v34 = v12;
  id v25 = v12;
  id v26 = v11;
  [v24 updateSettingsWithBlock:v32];
  [v24 updateClientSettingsWithBlock:&__block_literal_global_425];
  v27 = [MEMORY[0x1E4F62490] sharedInstance];
  uint64_t v28 = [v27 createSceneWithDefinition:v16 initialParameters:v24];

  uint64_t v29 = [v28 systemShellHostingEnvironment];
  v30 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
  [v29 setSystemShellHostingSpaceIdentifier:v30];

  return v28;
}

void __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v9, "setFrame:");
  [v9 setLevel:*(float *)(a1 + 48)];
  [v9 setForeground:1];
  [v9 setInterfaceOrientation:1];
  if ([v9 isUISubclass])
  {
    id v3 = v9;
    [v3 setInterfaceOrientationMode:100];
    [v3 setTargetOfEventDeferringEnvironments:0];
    uint64_t v4 = (void *)SBApp;
    int v5 = [*(id *)(a1 + 32) identity];
    double v6 = [v4 userInterfaceStyleProviderForDisplay:v5];
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

    id v7 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    objc_msgSend(v7, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
  }
  uint64_t v8 = [v9 ignoreOcclusionReasons];
  [v8 addObject:@"SystemApp"];

  if (*(void *)(a1 + 40) && [v9 conformsToProtocol:&unk_1F35B16E0]) {
    [v9 setContinuitySession:*(void *)(a1 + 40)];
  }
}

void __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUISubclass])
  {
    id v2 = v3;
    [v2 setStatusBarStyle:0];
    [v2 setInterfaceOrientation:1];
  }
}

- (void)createHighLevelSystemApertureWindowWithWindowScene:(id)a3
{
  id v35 = a3;
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796) {
      goto LABEL_17;
    }
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_17;
  }
  if (self->_window)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:346 description:@"Can't create second system aperture window."];
  }
  uint64_t v6 = objc_opt_class();
  id v7 = v35;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [(SBFTouchPassThroughWindow *)[SBSystemApertureWindow alloc] initWithWindowScene:v7 role:@"SBTraitsParticipantRoleSystemAperture" debugName:@"Jindo Window"];
  window = self->_window;
  self->_window = &v10->super.super.super;

  id v12 = [[SBSystemApertureViewController alloc] initWithActiveWindowScene:v9];
  systemApertureViewController = self->_systemApertureViewController;
  self->_systemApertureViewController = v12;

  [(SBSystemApertureViewController *)self->_systemApertureViewController setVisibilityDelegate:self];
  [(SBSystemApertureViewController *)self->_systemApertureViewController setBacklightSessionAggregator:self];
  id v14 = [[SBSystemApertureCaptureVisibilityShimViewController alloc] initWithContentViewController:self->_systemApertureViewController];
  mainCloningShimViewController = self->_mainCloningShimViewController;
  self->_mainCloningShimViewController = v14;

  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController setContentsDifferOnClonedDisplay:1];
  [(UIWindow *)self->_window setRootViewController:self->_mainCloningShimViewController];
  [(UIWindow *)self->_window _legacySetRotatableViewOrientation:1 updateStatusBar:0 duration:0 force:0.0];
  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_window, v7);
  id v16 = [v9 associatedWindowScene];
  v17 = [v16 traitsArbiter];

  if (!v17)
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:359 description:@"Arbiter is unexpectedly nil for System Aperture"];
  }
  v18 = [v17 acquireParticipantWithRole:@"SBTraitsParticipantRoleSystemAperture" delegate:self];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = v18;

  [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"init"];
  [(TRAParticipant *)self->_traitsParticipant updatePreferencesIfNeeded];
  [(UIWindow *)self->_window setHidden:[(NSMutableArray *)self->_systemApertureSuppressionAssertions count] != 0];
  [(SBSystemApertureController *)self _configureBacklightEnvironmentSceneProviderIfNecessary];
  [(SBSystemApertureController *)self _configureNoticeManagerIfNecessary];
  [(SBSystemApertureController *)self _configureLegacyStatusBarPillElementProviderIfNecessary];
  id v20 = objc_alloc_init(SBSystemApertureSceneHoster);
  sceneHoster = self->_sceneHoster;
  self->_sceneHoster = v20;

  [(SBSystemApertureSceneHoster *)self->_sceneHoster activateWithSystemApertureController:self];
  v22 = objc_alloc_init(SBSystemApertureLayoutMonitorServer);
  systemApertureLayoutMonitorServer = self->_systemApertureLayoutMonitorServer;
  self->_systemApertureLayoutMonitorServer = v22;

  uint64_t v24 = [[SBSystemApertureRestrictionServer alloc] initWithDelegate:self];
  systemApertureRestrictionServer = self->_systemApertureRestrictionServer;
  self->_systemApertureRestrictionServer = v24;

  id v26 = objc_alloc(MEMORY[0x1E4FA6B68]);
  uint64_t v27 = [(UIWindow *)self->_window _contextId];
  uint64_t v28 = [(UIWindow *)self->_window layer];
  uint64_t v29 = (void *)[v26 initWithSourceContextID:v27 sourceLayerRenderID:CALayerGetRenderId()];

  v30 = [[SBSystemAperturePortalSourceInfoRequestServer alloc] initWithPortalSource:v29];
  systemAperturePortalSourceRequestServer = self->_systemAperturePortalSourceRequestServer;
  self->_systemAperturePortalSourceRequestServer = v30;

  [(SBSystemAperturePortalSourceInfoRequestServer *)self->_systemAperturePortalSourceRequestServer startListener];
  id v32 = +[SBBacklightController sharedInstance];
  [v32 addObserver:self];
  [(SBSystemApertureController *)self setActiveWindowScene:v7];

LABEL_17:
}

- (void)highLevelContinuitySystemApertureWindowSceneDidConnect:(id)a3
{
  id v14 = a3;
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796) {
      goto LABEL_12;
    }
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_12;
  }
  if (self->_continuityWindow)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:383 description:@"Can't create second system aperture continuity window."];
  }
  uint64_t v6 = [(SBFTouchPassThroughWindow *)[SBSystemApertureWindow alloc] initWithWindowScene:v14 role:@"SBTraitsParticipantRoleSystemAperture" debugName:@"Jindo Continuity Window"];
  continuityWindow = self->_continuityWindow;
  self->_continuityWindow = &v6->super.super.super;

  [(UIWindow *)self->_continuityWindow _legacySetRotatableViewOrientation:1 updateStatusBar:0 duration:0 force:0.0];
  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_continuityWindow, v14);
  [(UIWindow *)self->_continuityWindow setHidden:[(NSMutableArray *)self->_systemApertureSuppressionAssertions count] != 0];
  uint64_t v8 = [v14 associatedWindowScene];
  id v9 = [v8 traitsArbiter];

  if (!v9)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:389 description:@"Arbiter is unexpectedly nil for System Aperture"];
  }
  uint64_t v10 = [v9 acquireParticipantWithRole:@"SBTraitsParticipantRoleSystemAperture" delegate:self];
  continuityTraitsParticipant = self->_continuityTraitsParticipant;
  self->_continuityTraitsParticipant = v10;

  [(TRAParticipant *)self->_continuityTraitsParticipant setNeedsUpdatePreferencesWithReason:@"init"];
  [(TRAParticipant *)self->_continuityTraitsParticipant updatePreferencesIfNeeded];

LABEL_12:
}

- (void)highLevelContinuitySystemApertureWindowSceneDidDisconnect:(id)a3
{
  [(TRAParticipant *)self->_continuityTraitsParticipant invalidate];
  continuityTraitsParticipant = self->_continuityTraitsParticipant;
  self->_continuityTraitsParticipant = 0;

  [(UIWindow *)self->_continuityWindow removeFromSuperview];
  continuityWindow = self->_continuityWindow;
  self->_continuityWindow = 0;

  id v6 = [(UIWindow *)self->_window _sbWindowScene];
  [(SBSystemApertureController *)self _updateActiveWindowSceneWithSpringBoardWindowScene:v6];
}

- (void)createSuperHighLevelCurtainWithWindowScene:(id)a3
{
  id v14 = a3;
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796) {
      goto LABEL_10;
    }
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_10;
  }
  if (self->_auxillarySuperHighLevelWindow)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:408 description:@"Can't create second curtain window."];
  }
  id v6 = [(SBFTouchPassThroughWindow *)[SBSystemApertureWindow alloc] initWithWindowScene:v14 role:@"SBTraitsParticipantRoleSystemAperture" debugName:@"Jindo Super High Level Window"];
  auxillarySuperHighLevelWindow = self->_auxillarySuperHighLevelWindow;
  self->_auxillarySuperHighLevelWindow = &v6->super.super.super;

  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_auxillarySuperHighLevelWindow, v14);
  [(UIWindow *)self->_auxillarySuperHighLevelWindow setUserInteractionEnabled:0];
  uint64_t v8 = objc_alloc_init(SBSystemApertureCurtainViewController);
  systemApertureCurtainViewController = self->_systemApertureCurtainViewController;
  self->_systemApertureCurtainViewController = v8;

  uint64_t v10 = [[SBSystemApertureCaptureVisibilityShimViewController alloc] initWithContentViewController:self->_systemApertureCurtainViewController];
  curtainCloningShimViewController = self->_curtainCloningShimViewController;
  self->_curtainCloningShimViewController = v10;

  [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController setContentsDifferOnClonedDisplay:1];
  [(UIWindow *)self->_auxillarySuperHighLevelWindow setRootViewController:self->_curtainCloningShimViewController];
  [(SBSystemApertureViewController *)self->_systemApertureViewController setCurtainViewHoster:self->_systemApertureCurtainViewController];
  [(UIWindow *)self->_auxillarySuperHighLevelWindow setHidden:[(NSMutableArray *)self->_systemApertureSuppressionAssertions count] != 0];
  id v12 = +[SBReachabilityManager sharedInstance];
  [v12 ignoreWindowForReachability:self->_auxillarySuperHighLevelWindow];

  [(SBSystemApertureController *)self _updateSuppressionForDefaults];
LABEL_10:
}

- (void)superHighLevelContinuityCurtainWindowSceneDidConnect:(id)a3
{
  id v10 = a3;
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796) {
      goto LABEL_10;
    }
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_10;
  }
  if (self->_auxillarySuperHighLevelContinuityWindow)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:426 description:@"Can't create second curtain continuity window."];
  }
  id v6 = [(SBFTouchPassThroughWindow *)[SBSystemApertureWindow alloc] initWithWindowScene:v10 role:@"SBTraitsParticipantRoleSystemAperture" debugName:@"Jindo Super High Level Continuity Window"];
  auxillarySuperHighLevelContinuityWindow = self->_auxillarySuperHighLevelContinuityWindow;
  self->_auxillarySuperHighLevelContinuityWindow = &v6->super.super.super;

  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_auxillarySuperHighLevelContinuityWindow, v10);
  [(UIWindow *)self->_auxillarySuperHighLevelContinuityWindow _legacySetRotatableViewOrientation:1 updateStatusBar:0 duration:0 force:0.0];
  [(UIWindow *)self->_auxillarySuperHighLevelContinuityWindow setUserInteractionEnabled:0];
  [(UIWindow *)self->_auxillarySuperHighLevelContinuityWindow setHidden:[(NSMutableArray *)self->_systemApertureSuppressionAssertions count] != 0];
  uint64_t v8 = +[SBReachabilityManager sharedInstance];
  [v8 ignoreWindowForReachability:self->_auxillarySuperHighLevelContinuityWindow];

  [(SBSystemApertureController *)self _updateSuppressionForDefaults];
LABEL_10:
}

- (void)superHighLevelContinuityCurtainWindowSceneDidDisconnect:(id)a3
{
  [(UIWindow *)self->_auxillarySuperHighLevelContinuityWindow removeFromSuperview];
  auxillarySuperHighLevelContinuityWindow = self->_auxillarySuperHighLevelContinuityWindow;
  self->_auxillarySuperHighLevelContinuityWindow = 0;
}

- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController isTransitionTargetForSceneIdentifier:a3 bundleIdentifier:a4];
}

- (CGRect)defaultIslandFrameInCoordinateSpace:(id)a3
{
  systemApertureViewController = self->_systemApertureViewController;
  id v5 = a3;
  [(SBSystemApertureViewController *)systemApertureViewController minimumSensorRegionFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(SBSystemApertureViewController *)self->_systemApertureViewController view];
  objc_msgSend(v14, "convertRect:toCoordinateSpace:", v5, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4
{
}

- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3
{
}

- (id)requireHeavyShadowAssertionForTransition
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController requireHeavyShadowAssertionForTransition];
}

- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4
{
}

- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController applyPersistentAnimationStyle:a3 toElement:a4];
}

- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController systemApertureRepresentationSuppressionAssertionForCoversheetVisibility];
}

- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility];
}

- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility];
}

- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController restrictSystemApertureToDefaultLayoutWithReason:a3];
}

- (id)restrictSystemApertureToInertWithReason:(id)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController restrictSystemApertureToInertWithReason:a3];
}

- (id)requireKeyLineAssertionForTransition
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController requireKeyLineAssertionForTransition];
}

- (id)suppressSystemApertureCompletelyWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBSystemApertureController_suppressSystemApertureCompletelyWithReason___block_invoke;
  v10[3] = &unk_1E6B0EFC0;
  v10[4] = self;
  [v4 addInvalidationBlock:v10];
  systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  if (!systemApertureSuppressionAssertions)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    double v7 = self->_systemApertureSuppressionAssertions;
    self->_systemApertureSuppressionAssertions = v6;

    systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  }
  [(NSMutableArray *)systemApertureSuppressionAssertions addObject:v4];
  double v8 = SBLogSystemApertureController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "System Aperture Complete Suppression Assertion Acquired: %{public}@", buf, 0xCu);
  }

  [(SBSystemApertureController *)self _reevaluateSystemApertureCompleteSuppression];
  return v4;
}

void __73__SBSystemApertureController_suppressSystemApertureCompletelyWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogSystemApertureController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "System Aperture Complete Suppression Assertion Invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 168) removeObject:v3];
  [*(id *)(a1 + 32) _reevaluateSystemApertureCompleteSuppression];
}

- (id)suppressHidingOfEmptySystemApertureOnClonedDisplaysWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__SBSystemApertureController_suppressHidingOfEmptySystemApertureOnClonedDisplaysWithReason___block_invoke;
  v10[3] = &unk_1E6B0EFC0;
  v10[4] = self;
  [v4 addInvalidationBlock:v10];
  systemApertureSuppressEmptyHidingOnClonedDisplayAssertions = self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions;
  if (!systemApertureSuppressEmptyHidingOnClonedDisplayAssertions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions;
    self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions = v6;

    systemApertureSuppressEmptyHidingOnClonedDisplayAssertions = self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions;
  }
  [(NSMutableArray *)systemApertureSuppressEmptyHidingOnClonedDisplayAssertions addObject:v4];
  double v8 = SBLogSystemApertureController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "System Aperture Hiding of Empty Element on Cloned Display Assertion Acquired: %{public}@", buf, 0xCu);
  }

  [(SBSystemApertureController *)self _updateVisibilityForCloningAndSnapshots];
  return v4;
}

void __92__SBSystemApertureController_suppressHidingOfEmptySystemApertureOnClonedDisplaysWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogSystemApertureController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "System Aperture Hiding of Empty Element on Cloned Display Assertion Invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 176) removeObject:v3];
  [*(id *)(a1 + 32) _updateVisibilityForCloningAndSnapshots];
}

- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController overrideContainerRenderingStyleAssertion:a3];
}

- (id)_currentFirstElement
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController _currentFirstElement];
}

- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4
{
  return [(SBSystemApertureStatusBarPillElementProvider *)self->_legacyStatusBarPillElementProvider acquireSuppressionAssertionForBackgroundActivities:a3 reason:a4];
}

- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4
{
  return [(SBSystemApertureStatusBarPillElementProvider *)self->_legacyStatusBarPillElementProvider acquireActiveElementAssertionForApplication:a3 reason:a4];
}

uint64_t __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setVisibleOnClonedDisplay:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v9 = v2;
    uint64_t v6 = result;
    if (*(unsigned char *)(result + 40))
    {
      [*(id *)(*(void *)(result + 32) + 64) setVisibleOnClonedDisplay:1];
      uint64_t v7 = 2 * (*(unsigned char *)(v6 + 40) != 0);
    }
    else
    {
      uint64_t v7 = 0;
    }
    objc_msgSend(*(id *)(*(void *)(v6 + 32) + 40), "setCloningStyle:", v7, v3, v9, v4);
    [*(id *)(*(void *)(v6 + 32) + 48) setContentsDifferOnClonedDisplay:0];
    double v8 = *(void **)(*(void *)(v6 + 32) + 64);
    return [v8 setContentsDifferOnClonedDisplay:0];
  }
  return result;
}

- (void)_reevaluateSystemApertureCompleteSuppression
{
  uint64_t v3 = [(NSMutableArray *)self->_systemApertureSuppressionAssertions count];
  overrideRenderingStyleAssertion = self->_overrideRenderingStyleAssertion;
  if (v3)
  {
    if (!overrideRenderingStyleAssertion)
    {
      uint64_t v5 = [(SBSystemApertureViewController *)self->_systemApertureViewController overrideContainerRenderingStyleAssertion:3];
      uint64_t v6 = self->_overrideRenderingStyleAssertion;
      self->_overrideRenderingStyleAssertion = v5;
    }
    uint64_t v7 = [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController view];
    [v7 setHidden:1];

    double v8 = [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController view];
    [v8 setHidden:1];

    prototypingDefaultGainMapDefeatingLayer = self->_prototypingDefaultGainMapDefeatingLayer;
    if (!prototypingDefaultGainMapDefeatingLayer)
    {
      double v10 = (CAGainMapLayer *)objc_alloc_init(MEMORY[0x1E4F39BC8]);
      double v11 = self->_prototypingDefaultGainMapDefeatingLayer;
      self->_prototypingDefaultGainMapDefeatingLayer = v10;

      id v12 = [(UIWindow *)self->_auxillarySuperHighLevelWindow layer];
      [v12 addSublayer:self->_prototypingDefaultGainMapDefeatingLayer];

      prototypingDefaultGainMapDefeatingLayer = self->_prototypingDefaultGainMapDefeatingLayer;
    }
    -[CAGainMapLayer setFrame:](prototypingDefaultGainMapDefeatingLayer, "setFrame:", 0.0, 0.0, 1.0, 1.0);
  }
  else
  {
    [(SAInvalidatable *)overrideRenderingStyleAssertion invalidateWithReason:@"No longer completely suppressing System Aperture"];
    uint64_t v13 = self->_overrideRenderingStyleAssertion;
    self->_overrideRenderingStyleAssertion = 0;

    id v14 = [(SBSystemApertureCaptureVisibilityShimViewController *)self->_mainCloningShimViewController view];
    [v14 setHidden:0];

    double v15 = [(SBSystemApertureCaptureVisibilityShimViewController *)self->_curtainCloningShimViewController view];
    [v15 setHidden:0];

    [(CAGainMapLayer *)self->_prototypingDefaultGainMapDefeatingLayer removeFromSuperlayer];
    double v16 = self->_prototypingDefaultGainMapDefeatingLayer;
    self->_prototypingDefaultGainMapDefeatingLayer = 0;
  }
}

- (void)_updateSuppressionForDefaults
{
  int v3 = [(SBSystemApertureDefaults *)self->_systemApertureDefaults suppressDynamicIslandCompletely];
  jindoDefaultsSuppressionAssertion = self->_jindoDefaultsSuppressionAssertion;
  if (v3)
  {
    if (jindoDefaultsSuppressionAssertion) {
      return;
    }
    uint64_t v5 = [(SBSystemApertureController *)self suppressSystemApertureCompletelyWithReason:@"NSUserDefault SBSuppressDynamicIslandCompletely is set."];
  }
  else
  {
    [(SAInvalidatable *)jindoDefaultsSuppressionAssertion invalidateWithReason:@"NSUserDefault SBSuppressDynamicIslandCompletely is not set."];
    uint64_t v5 = 0;
  }
  uint64_t v6 = self->_jindoDefaultsSuppressionAssertion;
  self->_jindoDefaultsSuppressionAssertion = v5;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  double v19 = (TRAParticipant *)a3;
  id v7 = a4;
  double v8 = v19;
  if (v19)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSystemApertureController.m", 644, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    double v8 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  double v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBSystemApertureController.m", 645, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];

  double v8 = v19;
LABEL_3:
  uint64_t v9 = [(TRAParticipant *)v8 role];
  int v10 = SBTraitsArbiterOrientationActuationEnabledForRole(v9);

  if (v10)
  {
    uint64_t v11 = [(TRAParticipant *)v19 sbf_currentOrientation];
    uint64_t v12 = [(TRAParticipant *)v19 sbf_previousOrientation];
    uint64_t v13 = [(SBSystemApertureViewController *)self->_systemApertureViewController activeWindowScene];
    id v14 = [v13 associatedWindowScene];

    if (self->_traitsParticipant == v19 && ([v14 isMainDisplayWindowScene] & 1) != 0
      || self->_continuityTraitsParticipant == v19 && [v14 isExtendedDisplayWindowScene])
    {
      systemApertureViewController = self->_systemApertureViewController;
      double v16 = [v7 orientationActuationContext];
      [(SBSystemApertureViewController *)systemApertureViewController hostOrientationDidChangeTo:v11 withPreviousOrientation:v12 context:v16];
    }
  }
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__SBSystemApertureController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E6AF4E00;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v10 appendBodySectionWithName:@"Associated Windows" multilinePrefix:a5 block:v12];
}

void __90__SBSystemApertureController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) participantAssociatedWindows:*(void *)(a1 + 40)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v17 + 1) + 8 * v3);
        uint64_t v5 = *(void **)(a1 + 48);
        uint64_t v6 = NSString;
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        id v9 = [v4 _debugName];
        if ([v4 isHidden]) {
          id v10 = @"NO";
        }
        else {
          id v10 = @"YES";
        }
        [v4 interfaceOrientation];
        id v11 = BSInterfaceOrientationDescription();
        uint64_t v12 = [v4 rootViewController];
        objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@",
          v8,
          v4,
          v9,
          v10,
          v11,
        id v13 = v12);
        [v5 appendString:v13 withName:0];

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v2);
  }
}

- (id)participantAssociatedWindows:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (TRAParticipant *)a3;
  uint64_t v6 = v5;
  traitsParticipant = self->_traitsParticipant;
  if (traitsParticipant == v5) {
    goto LABEL_7;
  }
  if (self->_continuityTraitsParticipant != v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSystemApertureController.m", 670, @"Invalid parameter not satisfying: %@", @"participant == _traitsParticipant || participant == _continuityTraitsParticipant" object file lineNumber description];

    traitsParticipant = self->_traitsParticipant;
  }
  if (traitsParticipant == v6)
  {
LABEL_7:
    v13[0] = self->_window;
    p_continuityWindow = (UIWindow **)v13;
  }
  else
  {
    if (self->_continuityTraitsParticipant != v6)
    {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    continuityWindow = self->_continuityWindow;
    p_continuityWindow = &continuityWindow;
  }
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_continuityWindow count:1];
LABEL_9:

  return v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_settings == a3)
  {
    id v9 = v6;
    if (([v6 isEqual:@"suppressHidingOnClonedDisplayWhileEmpty"] & 1) != 0
      || (v8 = [v9 isEqual:@"suppressHidingInSnapshotsWhileEmpty"], id v7 = v9, v8))
    {
      [(SBSystemApertureController *)self _updateVisibilityForCloningAndSnapshots];
      id v7 = v9;
    }
  }
}

- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:a3];
}

- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4
{
  return -[SBSystemApertureViewController systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:](self->_systemApertureViewController, "systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:", a3, a4.x, a4.y);
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
}

- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3
{
  uint64_t v3 = objc_msgSend((id)SBApp, "proximitySensorManager", a3);
  char v4 = [v3 isGracePeriodDisabled];

  return v4;
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (SBBacklightStateIsActive([a3 backlightState]))
  {
    BOOL IsActive = SBBacklightStateIsActive(a4);
    if (a5 != 13 && !IsActive)
    {
      id v9 = [(SBSystemApertureController *)self restrictSystemApertureToDefaultLayoutWithReason:@"Backlight no longer active"];
      [v9 invalidateWithReason:@"transient transition to default layout"];
    }
  }
}

- (id)scenesForBacklightSession
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  char v4 = v3;
  if (self->_highLevelWindowScene) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_superHighLevelWindowScene) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = [(SBSystemApertureViewController *)self->_systemApertureViewController scenesForBacklightSession];
  [v4 unionSet:v5];

  return v4;
}

- (void)hostedScenesDidChange
{
  if (self->_registeredBacklightSceneProvider)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SBSystemApertureController_hostedScenesDidChange__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __51__SBSystemApertureController_hostedScenesDidChange__block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v2 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleHeadsetButtonPress:a3];
}

- (BOOL)handleHomeButtonPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleHomeButtonPress];
}

- (BOOL)handleHomeButtonDoublePress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleHomeButtonDoublePress];
}

- (BOOL)handleHomeButtonLongPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleHomeButtonLongPress];
}

- (BOOL)handleLockButtonPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleLockButtonPress];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleVoiceCommandButtonPress];
}

- (BOOL)handleVolumeUpButtonPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController handleVolumeDownButtonPress];
}

- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4
{
}

- (void)_updateActiveWindowSceneWithSpringBoardWindowScene:(id)a3
{
  if ([a3 isMainDisplayWindowScene]) {
    window = self->_window;
  }
  else {
    window = self->_continuityWindow;
  }
  id v6 = [(UIWindow *)window windowScene];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v12 = v9;

  id v10 = v12;
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBSystemApertureController.m" lineNumber:801 description:@"There is no system aperture window scene for the new active springboard window scene"];

    id v10 = 0;
  }
  [(SBSystemApertureController *)self setActiveWindowScene:v10];
}

- (void)_configureNoticeManagerIfNecessary
{
  if (!self->_systemAperturePresentableManager)
  {
    uint64_t v3 = [[SBSystemAperturePresentableManager alloc] initWithElementRegistrar:self];
    systemAperturePresentableManager = self->_systemAperturePresentableManager;
    self->_systemAperturePresentableManager = v3;

    id v5 = [(id)SBApp bannerManager];
    [v5 setPresentableInterceptor:self->_systemAperturePresentableManager];
  }
}

- (void)_configureLegacyStatusBarPillElementProviderIfNecessary
{
  uint64_t v3 = objc_alloc_init(SBSystemApertureStatusBarPillElementProvider);
  legacyStatusBarPillElementProvider = self->_legacyStatusBarPillElementProvider;
  self->_legacyStatusBarPillElementProvider = v3;

  [(SBSystemApertureStatusBarPillElementProvider *)self->_legacyStatusBarPillElementProvider addObserver:self->_systemApertureViewController];
  id v5 = self->_legacyStatusBarPillElementProvider;
  [(SBSystemApertureStatusBarPillElementProvider *)v5 activateWithRegistrar:self];
}

- (void)_configureBacklightEnvironmentSceneProviderIfNecessary
{
  if (!self->_registeredBacklightSceneProvider)
  {
    uint64_t v3 = [(id)SBApp backlightEnvironmentSessionProvider];
    [v3 registerBacklightEnvironmentSceneProvider:self];

    self->_registeredBacklightSceneProvider = 1;
  }
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  return (SBSystemApertureWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_prototypingDefaultGainMapDefeatingLayer, 0);
  objc_storeStrong((id *)&self->_jindoDefaultsSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_superHighLevelWindowScene, 0);
  objc_storeStrong((id *)&self->_highLevelWindowScene, 0);
  objc_storeStrong((id *)&self->_overrideRenderingStyleAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureSuppressEmptyHidingOnClonedDisplayAssertions, 0);
  objc_storeStrong((id *)&self->_systemApertureSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_systemApertureStateDumpService, 0);
  objc_storeStrong((id *)&self->_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_systemAperturePortalSourceRequestServer, 0);
  objc_storeStrong((id *)&self->_systemApertureRestrictionServer, 0);
  objc_storeStrong((id *)&self->_systemApertureLayoutMonitorServer, 0);
  objc_storeStrong((id *)&self->_continuityTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_sceneHoster, 0);
  objc_storeStrong((id *)&self->_legacyStatusBarPillElementProvider, 0);
  objc_storeStrong((id *)&self->_systemAperturePresentableManager, 0);
  objc_storeStrong((id *)&self->_substituteSystemApertureViewController, 0);
  objc_storeStrong((id *)&self->_curtainCloningShimViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureCurtainViewController, 0);
  objc_storeStrong((id *)&self->_mainCloningShimViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureViewController, 0);
  objc_storeStrong((id *)&self->_continuityWindow, 0);
  objc_storeStrong((id *)&self->_auxillarySuperHighLevelContinuityWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_auxillarySuperHighLevelWindow, 0);
}

- (id)stateDump
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController stateDump];
}

- (id)systemApertureModelStateDump
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController systemApertureModelStateDump];
}

- (id)animationFrameRecordings
{
  return [(SBSystemApertureViewController *)self->_systemApertureViewController animationFrameRecordings];
}

- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3
{
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
}

- (void)containsHostSceneWithIdentityToken:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBSystemApertureController.m";
  __int16 v16 = 1024;
  int v17 = 211;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end