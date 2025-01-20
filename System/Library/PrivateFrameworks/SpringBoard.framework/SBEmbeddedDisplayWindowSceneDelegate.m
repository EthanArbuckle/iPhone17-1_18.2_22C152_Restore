@interface SBEmbeddedDisplayWindowSceneDelegate
+ (id)_individuallyManagedRoles;
+ (id)_windowWillBecomeHiddenExemptRoles;
- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3;
- (BOOL)_shouldManageParticipantWithRole:(id)a3;
- (SBEmbeddedDisplayWindowSceneDelegate)init;
- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3;
- (id)_pipelineManager;
- (id)_traitsDelegateForWindowRole:(id)a3;
- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4;
- (void)initializeProductivityGestureControllerIfNecessary;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation SBEmbeddedDisplayWindowSceneDelegate

- (id)_traitsDelegateForWindowRole:(id)a3
{
  return self->_traitsWindowParticipantsDelegate;
}

- (BOOL)_shouldManageParticipantWithRole:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _individuallyManagedRoles];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

+ (id)_individuallyManagedRoles
{
  if (_individuallyManagedRoles_onceToken_1 != -1) {
    dispatch_once(&_individuallyManagedRoles_onceToken_1, &__block_literal_global_320);
  }
  v2 = (void *)_individuallyManagedRoles__individuallyManagedRoles_1;
  return v2;
}

- (SBEmbeddedDisplayWindowSceneDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  v2 = [(SBAbstractWindowSceneDelegate *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    traitsWindowParticipantsDelegate = v2->_traitsWindowParticipantsDelegate;
    v2->_traitsWindowParticipantsDelegate = v3;
  }
  return v2;
}

void __65__SBEmbeddedDisplayWindowSceneDelegate__individuallyManagedRoles__block_invoke()
{
  v2[22] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SBTraitsParticipantRoleAXAssistiveTouchUI";
  v2[1] = @"SBTraitsParticipantRoleAXFullKeyboardUI";
  v2[2] = @"SBTraitsParticipantRoleAXVoiceControlUI";
  v2[3] = @"SBTraitsParticipantRoleAXUIServer";
  v2[4] = @"SBTraitsParticipantRoleBanner";
  v2[5] = @"SBTraitsParticipantRoleCoverSheetCamera";
  v2[6] = @"SBTraitsParticipantRoleCoverSheetPosterSwitcher";
  v2[7] = @"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay";
  v2[8] = @"SBTraitsParticipantRoleDruid";
  v2[9] = @"SBTraitsParticipantRoleEnsembleUI";
  v2[10] = @"SBTraitsParticipantRoleEyedropperUI";
  v2[11] = @"SBTraitsParticipantRoleInputUI";
  v2[12] = @"SBTraitsParticipantRoleInternalPerfPowerHUD";
  v2[13] = @"SBTraitsParticipantRoleLiveTranscriptionUI";
  v2[14] = @"SBTraitsParticipantRoleMedusaDrag";
  v2[15] = @"SBTraitsParticipantRoleMomentsUI";
  v2[16] = @"SBTraitsParticipantRoleOverlayUI";
  v2[17] = @"SBTraitsParticipantRoleSubterraneanOverlayUI";
  v2[18] = @"SBTraitsParticipantRolePerfPowerHUD";
  v2[19] = @"SBTraitsParticipantRoleSecureApp";
  v2[20] = @"SBTraitsParticipantRoleSwitcherRaw";
  v2[21] = @"SBTraitsParticipantRoleSystemAperture";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:22];
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles_1;
  _individuallyManagedRoles__individuallyManagedRoles_1 = v0;
}

+ (id)_windowWillBecomeHiddenExemptRoles
{
  if (_windowWillBecomeHiddenExemptRoles_onceToken != -1) {
    dispatch_once(&_windowWillBecomeHiddenExemptRoles_onceToken, &__block_literal_global_10_2);
  }
  v2 = (void *)_windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles;
  return v2;
}

void __74__SBEmbeddedDisplayWindowSceneDelegate__windowWillBecomeHiddenExemptRoles__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SBTraitsParticipantRoleHomeScreen";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)_windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles;
  _windowWillBecomeHiddenExemptRoles__windowWillBecomeHiddenExemptRoles = v0;
}

- (void)initializeProductivityGestureControllerIfNecessary
{
  id v3 = [SBProductivityGestureController alloc];
  id v11 = +[SBSystemGestureManager mainDisplayManager];
  v4 = +[SBWorkspace mainWorkspace];
  char v5 = [v4 keyboardFocusController];
  objc_super v6 = +[SBDefaults localDefaults];
  v7 = [v6 gestureDefaults];
  v8 = [(id)SBApp productivityGestureEducationController];
  v9 = [(SBProductivityGestureController *)v3 initWithSystemGestureManager:v11 focusController:v5 gestureDefaults:v7 gestureEducationController:v8];
  productivityGestureController = self->_productivityGestureController;
  self->_productivityGestureController = v9;
}

- (id)_pipelineManager
{
  traitsEmbeddedPipelineManager = self->_traitsEmbeddedPipelineManager;
  if (!traitsEmbeddedPipelineManager)
  {
    v4 = [SBTraitsEmbeddedDisplayPipelineManager alloc];
    char v5 = [(id)SBApp userInterfaceStyleProviderForDisplay:0];
    objc_super v6 = [(SBTraitsPipelineManager *)v4 initWithUserInterfaceStyleProvider:v5];
    v7 = self->_traitsEmbeddedPipelineManager;
    self->_traitsEmbeddedPipelineManager = v6;

    traitsEmbeddedPipelineManager = self->_traitsEmbeddedPipelineManager;
  }
  return traitsEmbeddedPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F62438], "sharedInstance", a3);
}

- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _windowWillBecomeHiddenExemptRoles];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogStartup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543874;
    v72 = v9;
    __int16 v73 = 2114;
    id v74 = v6;
    __int16 v75 = 2114;
    v76 = self;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] : %{public}@; %{public}@", buf, 0x20u);
  }
  v70.receiver = self;
  v70.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v70 _configureForConnectingWindowScene:v6 windowSceneContext:v7];
  v10 = [v6 _FBSScene];
  id v11 = [v10 SSKDisplayEndpoint];
  [v11 setWantsControlOfDisplay:1];

  v12 = SBLogStartup();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    v72 = v13;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting SBMainWindowScene", buf, 0xCu);
  }
  SBSetMainWindowScene(v6);
  [(SBTraitsEmbeddedDisplayPipelineManager *)self->_traitsEmbeddedPipelineManager startListeningForLockScreenUIPresentations];
  v14 = [SBSystemPointerInteractionManager alloc];
  v15 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  uint64_t v16 = [(SBSystemPointerInteractionManager *)v14 initWithMultiDisplayUserInteractionCoordinator:v15];

  [v7 setSystemPointerInteractionManager:v16];
  v17 = +[SBMainDisplaySystemGestureManager sharedInstance];
  v69 = (void *)v16;
  [v17 setSystemPointerInteractionDelegate:v16];
  [v7 setSystemGestureManager:v17];
  v68 = [[SBHomeAffordanceInteractionManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v67 = [[SBModalUIFluidDismissGestureManager alloc] initWithWindowScene:v6 systemGestureManager:v17];
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v66 = [[SBTransientUIInteractionManager alloc] initWithSystemGestureManager:v17];
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v18 = [[SBSystemApertureController alloc] initWithWindowScene:v6];
  [v7 setSystemApertureController:v18];
  v19 = [v6 _FBSScene];
  v20 = [v19 settings];
  v21 = [v20 displayConfiguration];

  [(SBSystemApertureController *)v18 createHighLevelWindowSceneWithDisplayConfiguration:v21];
  v65 = v18;
  [(SBSystemApertureController *)v18 createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:v21];
  v64 = [(id)SBApp _completeStartupAfterMainSceneConnect:v6];
  v22 = +[SBUIController sharedInstance];
  [v22 setWindowScene:v6];

  v63 = [[SBRecordingIndicatorManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
  {
    v23 = [[SBHomeScreenController alloc] initWithWindowScene:v6];
    homeScreenController = self->_homeScreenController;
    self->_homeScreenController = v23;

    [v7 setHomeScreenController:self->_homeScreenController];
    v25 = [(SBHomeScreenController *)self->_homeScreenController createFloatingDockControllerForWindowScene:v6];
    [v7 setFloatingDockController:v25];
    v26 = [(SBHomeScreenController *)self->_homeScreenController createModalLibraryControllerForWindowScene:v6];
    [v7 setModalLibraryController:v26];
    v27 = [(SBHomeScreenController *)self->_homeScreenController createStatusBarVisibiltyAssertionForWindowScene:v6];
    showStatusBarAssertion = self->_showStatusBarAssertion;
    self->_showStatusBarAssertion = v27;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_showStatusBarAssertion acquire];
  }
  else
  {
    v25 = +[SBIconController sharedInstance];
    v26 = [v25 createFloatingDockControllerForWindowScene:v6];
    [v7 setFloatingDockController:v26];
    v29 = [v25 createModalLibraryControllerForWindowScene:v6];
    [v7 setModalLibraryController:v29];
  }
  v30 = [v7 lockScreenManager];
  [v7 setUILockStateProvider:v30];

  v31 = [v6 pictureInPictureManager];
  [v31 windowSceneDidConnect:v6];

  v32 = +[SBReachabilityManager sharedInstance];
  [v7 setReachabilitySceneOffsetProvider:v32];

  v33 = [SBEmbeddedDisplayUICommandValidator alloc];
  v34 = [v7 layoutStateProvider];
  v35 = [(SBEmbeddedDisplayUICommandValidator *)v33 initWithLayoutStateProvider:v34];
  [v7 setCommandValidator:v35];

  v62 = [[SBAmbientPresentationController alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setAmbientPresentationController:");
  [(SBTraitsEmbeddedDisplayPipelineManager *)self->_traitsEmbeddedPipelineManager startObservingAmbientPresentation];
  [(SBTraitsEmbeddedDisplayPipelineManager *)self->_traitsEmbeddedPipelineManager startObservingLayoutStateTransitions];
  v36 = +[SBPrototypeController sharedInstance];
  [v36 setWindowScene:v6];

  v37 = +[SBReachabilityManager sharedInstance];
  [v37 setWindowScene:v6];

  v38 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v38 setWindowScene:v6];

  v39 = +[SBWorkspace mainWorkspace];
  v40 = [v39 transientOverlayPresentationManager];
  [v40 windowSceneDidConnect:v6];

  if (([MEMORY[0x1E4F73138] inUserSessionLoginUI] & 1) == 0)
  {
    v41 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v41 windowSceneDidConnect:v6];

    v42 = [[SBSwitcherController alloc] initWithWindowScene:v6 debugName:@"EmbeddedDisplay"];
    [v7 setSwitcherController:v42];
    v43 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v43 beginCoordinatingSwitcherController:v42];
  }
  v44 = +[SBWorkspace mainWorkspace];
  v45 = [v44 createRequestWithOptions:0];

  [v45 finalize];
  v46 = +[SBControlCenterController sharedInstance];
  [v46 windowSceneDidConnect:v6];

  v47 = [v7 pictureInPictureManager];
  v48 = +[SBIconController sharedInstance];
  [v47 configureInsetsForIconController:v48];

  [(SBEmbeddedDisplayWindowSceneDelegate *)self initializeProductivityGestureControllerIfNecessary];
  v49 = [(id)SBApp proximityBacklightPolicy];
  [v49 windowSceneDidConnect:v6];

  v50 = [(id)SBApp HUDController];
  [v50 windowSceneDidConnect:v6];

  v51 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v51 windowSceneDidConnect:v6];

  v52 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  [v52 windowSceneDidConnect:v6];

  v53 = +[SBPlatformController sharedInstance];
  if ([v53 deviceSupportsHWButtonBezelEffects])
  {
    int v54 = 1;
  }
  else
  {
    v55 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v54 = [v55 BOOLForKey:@"SBHardwareButtonHintDropletsEnabled"];
  }
  if ((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
    || +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]())
  {
    v56 = [SBCaptureButtonDispatchingDeferrer alloc];
    v57 = [v6 zStackResolver];
    v58 = [(id)SBApp captureButtonRestrictionCoordinator];
    v59 = [(SBCaptureButtonDispatchingDeferrer *)v56 initWithZStackResolver:v57 restrictionCoordinator:v58];
    captureButtonDispatchingDeferrer = self->_captureButtonDispatchingDeferrer;
    self->_captureButtonDispatchingDeferrer = v59;
  }
  if (!CAMIsCameraOverlayEnabled())
  {
    if (!v54) {
      goto LABEL_22;
    }
LABEL_21:
    v61 = [[SBHardwareButtonBezelEffectsCoordinator alloc] initWithWindowScene:v6];
    [v7 setHardwareButtonBezelEffectsCoordinator:v61];

    goto LABEL_22;
  }
  if ((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
    || ((+[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]() | v54) & 1) != 0)
  {
    goto LABEL_21;
  }
LABEL_22:
  v64[2](v64);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 role];
  if (([v12 isEqualToString:*MEMORY[0x1E4F43F38]] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBEmbeddedDisplayWindowSceneDelegate.m" lineNumber:306 description:@"unexpected role for SBMainWindowSceneDelegate"];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBEmbeddedDisplayWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v14 scene:v9 willConnectToSession:v10 options:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_captureButtonDispatchingDeferrer, 0);
  objc_storeStrong((id *)&self->_productivityGestureController, 0);
  objc_storeStrong((id *)&self->_traitsEmbeddedPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
}

@end