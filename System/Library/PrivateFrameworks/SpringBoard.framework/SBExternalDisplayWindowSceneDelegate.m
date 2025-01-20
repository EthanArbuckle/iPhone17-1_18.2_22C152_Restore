@interface SBExternalDisplayWindowSceneDelegate
+ (id)_individuallyManagedRoles;
- (BOOL)_shouldManageParticipantWithRole:(id)a3;
- (SBExternalDisplayWindowSceneDelegate)init;
- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3;
- (id)_pipelineManager;
- (id)_traitsDelegateForWindowRole:(id)a3;
- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation SBExternalDisplayWindowSceneDelegate

- (SBExternalDisplayWindowSceneDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  v2 = [(SBAbstractWindowSceneDelegate *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    traitsWindowParticipantsDelegate = v2->_traitsWindowParticipantsDelegate;
    v2->_traitsWindowParticipantsDelegate = v3;
  }
  return v2;
}

+ (id)_individuallyManagedRoles
{
  if (_individuallyManagedRoles_onceToken != -1) {
    dispatch_once(&_individuallyManagedRoles_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)_individuallyManagedRoles__individuallyManagedRoles;
  return v2;
}

void __65__SBExternalDisplayWindowSceneDelegate__individuallyManagedRoles__block_invoke()
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
  v2[16] = @"SBTraitsParticipantRolePerfPowerHUD";
  v2[17] = @"SBTraitsParticipantRoleOverlayUI";
  v2[18] = @"SBTraitsParticipantRoleSubterraneanOverlayUI";
  v2[19] = @"SBTraitsParticipantRoleSecureApp";
  v2[20] = @"SBTraitsParticipantRoleSwitcherRaw";
  v2[21] = @"SBTraitsParticipantRoleSystemAperture";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:22];
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles;
  _individuallyManagedRoles__individuallyManagedRoles = v0;
}

- (id)_pipelineManager
{
  traitsExternalPipelineManager = self->_traitsExternalPipelineManager;
  if (!traitsExternalPipelineManager)
  {
    v4 = [SBTraitsExternalDisplayPipelineManager alloc];
    v5 = [(id)SBApp userInterfaceStyleProviderForDisplay:0];
    objc_super v6 = [(SBTraitsPipelineManager *)v4 initWithUserInterfaceStyleProvider:v5];
    v7 = self->_traitsExternalPipelineManager;
    self->_traitsExternalPipelineManager = v6;

    traitsExternalPipelineManager = self->_traitsExternalPipelineManager;
  }
  return traitsExternalPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  id v5 = a3;
  if (SBFIsShellSceneKitAvailable())
  {
    displayLayoutPublisher = self->_displayLayoutPublisher;
    if (!displayLayoutPublisher)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F62968]);
      [v7 setDomainIdentifier:@"com.apple.frontboard"];
      v8 = [v5 _sbDisplayConfiguration];
      v9 = [v8 identity];
      v10 = SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay();
      [v7 setInstanceIdentifier:v10];

      v11 = [MEMORY[0x1E4F62960] publisherWithConfiguration:v7];
      v12 = self->_displayLayoutPublisher;
      self->_displayLayoutPublisher = v11;

      [(FBSDisplayLayoutPublisher *)self->_displayLayoutPublisher activate];
      displayLayoutPublisher = self->_displayLayoutPublisher;
    }
    v13 = displayLayoutPublisher;
  }
  else
  {
    v14 = [v5 _FBSScene];
    v15 = [v14 settings];
    v16 = [v15 displayIdentity];
    v17 = [v16 rootIdentity];

    v13 = [(id)SBApp layoutPublisherForPhysicalDisplay:v17];
    if (!v13)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"SBExternalDisplayWindowSceneDelegate.m", 161, @"failed to retrieve publisher for display: %@", v17 object file lineNumber description];
    }
  }

  return v13;
}

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

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v65 _configureForConnectingWindowScene:v6 windowSceneContext:v7];
  if (SBFIsShellSceneKitAvailable())
  {
    v8 = [v6 _FBSScene];
    v9 = [v8 SSKDisplayEndpoint];

    [v9 setWantsControlOfDisplay:1];
    v10 = +[SBDefaults localDefaults];
    v11 = [v10 externalDisplayDefaults];

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __94__SBExternalDisplayWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke;
    v61[3] = &unk_1E6AF4E00;
    id v62 = v6;
    id v63 = v11;
    id v64 = v9;
    id v12 = v9;
    id v13 = v11;
    v14 = [v13 observeDisplayModeSettingsOnQueue:MEMORY[0x1E4F14428] withBlock:v61];
    displayModeSettingsToken = self->_displayModeSettingsToken;
    self->_displayModeSettingsToken = v14;
  }
  v16 = +[SBHIDEventDispatchController sharedInstance];
  v17 = [v6 _sbDisplayConfiguration];
  v18 = [v16 configureDispatchRootsForChamoisDisplay:v17];
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = v18;

  v20 = (OS_os_transaction *)os_transaction_create();
  increasedMemoryLimitsTransaction = self->_increasedMemoryLimitsTransaction;
  self->_increasedMemoryLimitsTransaction = v20;

  v22 = [SBSystemPointerInteractionManager alloc];
  v23 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  v24 = [(SBSystemPointerInteractionManager *)v22 initWithMultiDisplayUserInteractionCoordinator:v23];

  [v7 setSystemPointerInteractionManager:v24];
  v25 = [SBExternalDisplaySystemGestureManager alloc];
  v26 = [v6 screen];
  v27 = [v26 displayIdentity];
  v28 = [(SBExternalDisplaySystemGestureManager *)v25 initWithDisplayIdentity:v27];

  [(SBSystemGestureManager *)v28 setSystemPointerInteractionDelegate:v24];
  [v7 setSystemGestureManager:v28];
  v60 = [[SBHomeAffordanceInteractionManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v59 = [[SBModalUIFluidDismissGestureManager alloc] initWithWindowScene:v6 systemGestureManager:v28];
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v58 = [[SBTransientUIInteractionManager alloc] initWithSystemGestureManager:v28];
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v57 = [[SBRecordingIndicatorManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  v29 = +[SBUIController sharedInstance];
  [v29 updateStatusBarLegibilityForWindowScene:v6];
  v30 = [v29 iconController];
  v56 = [v30 createFloatingDockControllerForWindowScene:v6];
  objc_msgSend(v7, "setFloatingDockController:");
  v55 = [v30 createModalLibraryControllerForWindowScene:v6];
  objc_msgSend(v7, "setModalLibraryController:");
  v31 = [v30 createStatusBarVisibiltyAssertionForWindowScene:v6];
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = v31;

  [(SBWindowSceneStatusBarSettingsAssertion *)self->_showStatusBarAssertion acquire];
  v33 = [[SBExternalDisplayWallpaperController alloc] initWithWindowScene:v6 requiresTraitsParticipant:1];
  wallpaperController = self->_wallpaperController;
  self->_wallpaperController = v33;

  v35 = [[SBExternalDisplayCoverSheetController alloc] initWithWindowScene:v6];
  coverSheetController = self->_coverSheetController;
  self->_coverSheetController = v35;

  [v7 setUILockStateProvider:self->_coverSheetController];
  v37 = objc_alloc_init(SBExternalChamoisUICommandValidator);
  [v7 setCommandValidator:v37];

  v38 = +[SBWorkspace mainWorkspace];
  v39 = [v38 transientOverlayPresentationManager];
  [v39 windowSceneDidConnect:v6];

  v40 = [v6 pictureInPictureManager];
  [v40 windowSceneDidConnect:v6];

  if (([MEMORY[0x1E4F73138] inUserSessionLoginUI] & 1) == 0)
  {
    v41 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v41 windowSceneDidConnect:v6];

    v42 = [[SBSwitcherController alloc] initWithWindowScene:v6 debugName:@"ExternalDisplay"];
    [v7 setSwitcherController:v42];
    v43 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v43 beginCoordinatingSwitcherController:v42];
  }
  v44 = [SBAlertLayoutPresentationVerifier alloc];
  v45 = [v6 screen];
  v46 = [(SBAlertLayoutPresentationVerifier *)v44 initWithScreen:v45];

  v47 = [SBSharedModalAlertItemPresenter alloc];
  v48 = [(id)SBApp lockOutController];
  v49 = +[SBReachabilityManager sharedInstance];
  v50 = [(SBSharedModalAlertItemPresenter *)v47 initWithLockOutProvider:v48 systemGestureManager:v28 reachabilityManager:v49 alertLayoutPresentationVerifier:v46 windowScene:v6];

  v51 = +[SBAlertItemsController sharedInstance];
  [v51 windowSceneDidConnect:v6 withSharedModalAlertItemPresenter:v50];

  v52 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v52 windowSceneDidConnect:v6];

  v53 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  [v53 windowSceneDidConnect:v6];

  v54 = [v6 statusBarManager];
  [v54 windowSceneDidConnect:v6];
}

void __94__SBExternalDisplayWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke(id *a1)
{
  if ([a1[4] activationState] != -1)
  {
    v2 = [a1[4] _FBSScene];
    id v3 = [v2 settings];
    id v8 = [v3 displayConfiguration];

    v4 = [a1[5] displayModeSettingsForDisplay:v8];
    char v5 = objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v8, objc_msgSend(a1[5], "chamois"));
    id v6 = objc_alloc_init(MEMORY[0x1E4F629A0]);
    [v4 overscanCompensation];
    [v6 setOverscanCompensation:FBSDisplayOverscanCompensationForDisplayValue()];
    objc_msgSend(v5, "logicalScaleForDisplayScale:", objc_msgSend(v4, "scale"));
    objc_msgSend(v6, "setLogicalScale:", v7, v7);
    [a1[5] contentsScale];
    objc_msgSend(v6, "setPointScale:");
    [a1[6] setDisplayConfigurationRequest:v6];
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 role];
  if (([v12 isEqualToString:@"SBWindowSceneSessionRoleExternalDisplay"] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBExternalDisplayWindowSceneDelegate.m" lineNumber:274 description:@"unexpected role for SBSystemShellExternalDisplayWindowSceneDelegate"];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v14 scene:v9 willConnectToSession:v10 options:v11];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  [(BSDefaultObserver *)self->_displayModeSettingsToken invalidate];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  id v9 = +[SBMainWorkspace sharedInstanceIfExists];
  id v10 = [v9 keyboardFocusController];
  id v11 = NSString;
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  objc_super v14 = [v8 screen];
  v15 = [v14 displayIdentity];
  v16 = [v11 stringWithFormat:@"%@ - %@", v13, v15];
  v17 = [v10 suppressKeyboardFocusEvaluationForReason:v16];

  [v8 setInvalidating:1];
  v18 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  v19 = [v8 switcherController];
  [v18 endCoordinatingSwitcherController:v19];

  v20 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v20 windowSceneDidDisconnect:v8];

  v21 = [(SBAbstractWindowSceneDelegate *)self floatingDockController];
  [v21 invalidate];

  [(SBWindowSceneStatusBarSettingsAssertion *)self->_showStatusBarAssertion invalidate];
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = 0;

  v23 = [(SBAbstractWindowSceneDelegate *)self modalLibraryController];
  [v23 invalidate];

  [(BSInvalidatable *)self->_eventRoutingAssertion invalidate];
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = 0;

  increasedMemoryLimitsTransaction = self->_increasedMemoryLimitsTransaction;
  self->_increasedMemoryLimitsTransaction = 0;

  v26 = [v8 systemGestureManager];
  [v26 invalidate];

  v27 = +[SBAlertItemsController sharedInstance];
  [v27 windowSceneDidDisconnect:v8];

  v28 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v28 windowSceneDidDisconnect:v8];

  v29 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  [v29 windowSceneDidDisconnect:v8];

  [(SBExternalDisplayCoverSheetController *)self->_coverSheetController invalidate];
  coverSheetController = self->_coverSheetController;
  self->_coverSheetController = 0;

  [(FBSDisplayLayoutPublisher *)self->_displayLayoutPublisher invalidate];
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = 0;

  v32.receiver = self;
  v32.super_class = (Class)SBExternalDisplayWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v32 sceneDidDisconnect:v6];
  [v17 invalidate];
  [v8 invalidate];

  [(SBAbstractWindowSceneDelegate *)self setInvalidated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_increasedMemoryLimitsTransaction, 0);
  objc_storeStrong((id *)&self->_eventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_coverSheetController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_traitsExternalPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end