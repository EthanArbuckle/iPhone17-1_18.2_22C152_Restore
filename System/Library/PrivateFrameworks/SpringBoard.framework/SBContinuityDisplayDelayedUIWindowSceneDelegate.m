@interface SBContinuityDisplayDelayedUIWindowSceneDelegate
+ (id)_individuallyManagedRoles;
- (BOOL)_shouldManageParticipantWithRole:(id)a3;
- (SBContinuityDisplayDelayedUIWindowSceneDelegate)init;
- (SBContinuitySession)connectedSession;
- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3;
- (id)_pipelineManager;
- (id)_sceneManagerForConnectingWindowScene:(id)a3;
- (id)_traitsDelegateForWindowRole:(id)a3;
- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4;
- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4;
- (void)_initializeUIIfNecessaryForReason:(id)a3;
- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3;
- (void)continuitySession:(id)a3 didUpdateHostedInterfaceOrientation:(int64_t)a4;
- (void)continuitySessionDidUpdateState:(id)a3;
- (void)didConnectToSession:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4;
@end

@implementation SBContinuityDisplayDelayedUIWindowSceneDelegate

- (SBContinuityDisplayDelayedUIWindowSceneDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
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
  if (_individuallyManagedRoles_onceToken_0 != -1) {
    dispatch_once(&_individuallyManagedRoles_onceToken_0, &__block_literal_global_173);
  }
  v2 = (void *)_individuallyManagedRoles__individuallyManagedRoles_0;
  return v2;
}

void __76__SBContinuityDisplayDelayedUIWindowSceneDelegate__individuallyManagedRoles__block_invoke()
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
  v1 = (void *)_individuallyManagedRoles__individuallyManagedRoles_0;
  _individuallyManagedRoles__individuallyManagedRoles_0 = v0;
}

- (id)_pipelineManager
{
  traitsDisplayPipelineManager = self->_traitsDisplayPipelineManager;
  if (!traitsDisplayPipelineManager)
  {
    v4 = [SBTraitsContinuityDisplayPipelineManager alloc];
    v5 = +[SBContinuitySessionManager sharedInstance];
    objc_super v6 = [v5 userInterfaceStyleProvider];
    v7 = [(SBTraitsPipelineManager *)v4 initWithUserInterfaceStyleProvider:v6];
    v8 = self->_traitsDisplayPipelineManager;
    self->_traitsDisplayPipelineManager = v7;

    traitsDisplayPipelineManager = self->_traitsDisplayPipelineManager;
  }
  return traitsDisplayPipelineManager;
}

- (id)_displayLayoutPublisherForConnectingWindowScene:(id)a3
{
  id v5 = a3;
  if (!self->_continuitySession)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:192 description:@"I should have a session by now"];
  }
  objc_super v6 = [v5 _sbDisplayConfiguration];
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:194 description:@"missing display configuration"];
  }
  v7 = [(SBContinuitySession *)self->_continuitySession displayLayoutPublisher];
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:196 description:@"missing continuity display layout publisher"];
  }
  [v7 setDisplayConfiguration:v6];

  return v7;
}

- (id)_sceneManagerForConnectingWindowScene:(id)a3
{
  id v3 = a3;
  v4 = +[SBSceneManagerCoordinator sharedInstance];
  id v5 = [v3 _FBSScene];

  objc_super v6 = [v5 settings];
  v7 = [v6 displayIdentity];
  v8 = [v4 sceneManagerForDisplayIdentity:v7];

  return v8;
}

- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4
{
  id v12 = a4;
  if (!self->_presentationBinderWindow)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:208 description:@"We don't have a presentation binder window"];
  }
  objc_super v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@-%p", v8, self];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F42D78]) initWithIdentifier:v9 priority:0 rootView:self->_presentationBinderWindow appearanceStyle:0];
  [v12 updatePresentationBinder:v10];
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
  v66.receiver = self;
  v66.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
  [(SBAbstractWindowSceneDelegate *)&v66 _configureForConnectingWindowScene:v6 windowSceneContext:v7];
  v8 = [(id)SBApp windowSceneManager];
  v9 = [v8 embeddedDisplayWindowScene];

  v10 = [v9 layoutStateProvider];
  v11 = [v10 layoutState];

  uint64_t v12 = +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:isDisplayExternal:](SBMainDisplayLayoutStateManager, "_initialLayoutStateWithDisplayOrdinal:isDisplayExternal:", [v11 displayOrdinal], objc_msgSend(v11, "isDisplayExternal"));

  v13 = [v6 layoutStateProvider];
  v65 = (void *)v12;
  [v13 setLayoutState:v12];

  v14 = +[SBHIDEventDispatchController sharedInstance];
  v15 = [v6 _sbDisplayConfiguration];
  v16 = [v14 configureDispatchRootsForContinuityDisplay:v15];
  eventRoutingAssertion = self->_eventRoutingAssertion;
  self->_eventRoutingAssertion = v16;

  v18 = (OS_os_transaction *)os_transaction_create();
  increasedMemoryLimitsTransaction = self->_increasedMemoryLimitsTransaction;
  self->_increasedMemoryLimitsTransaction = v18;

  v20 = [SBSystemPointerInteractionManager alloc];
  v21 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  uint64_t v22 = [(SBSystemPointerInteractionManager *)v20 initWithMultiDisplayUserInteractionCoordinator:v21];

  [v7 setSystemPointerInteractionManager:v22];
  v23 = [SBContinuityDisplaySystemGestureManager alloc];
  v24 = [v6 screen];
  v25 = [v24 displayIdentity];
  v26 = [(SBContinuityDisplaySystemGestureManager *)v23 initWithDisplayIdentity:v25];

  v64 = (void *)v22;
  [(SBSystemGestureManager *)v26 setSystemPointerInteractionDelegate:v22];
  [v7 setSystemGestureManager:v26];
  v62 = [[SBHomeAffordanceInteractionManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setHomeAffordanceInteractionManager:");
  v61 = [[SBModalUIFluidDismissGestureManager alloc] initWithWindowScene:v6 systemGestureManager:v26];
  objc_msgSend(v7, "setModalUIFluidDismissGestureManager:");
  v63 = v26;
  v60 = [[SBTransientUIInteractionManager alloc] initWithSystemGestureManager:v26];
  objc_msgSend(v7, "setTransientUIInteractionManager:");
  v59 = [[SBRecordingIndicatorManager alloc] initWithWindowScene:v6];
  objc_msgSend(v7, "setRecordingIndicatorManager:");
  v27 = [[SBHomeScreenController alloc] initWithWindowScene:v6];
  homeScreenController = self->_homeScreenController;
  self->_homeScreenController = v27;

  [v7 setHomeScreenController:self->_homeScreenController];
  [(SBHomeScreenController *)self->_homeScreenController restoreContentAndUnscatterIconsAnimated:0];
  v58 = [(SBHomeScreenController *)self->_homeScreenController createFloatingDockControllerForWindowScene:v6];
  objc_msgSend(v7, "setFloatingDockController:");
  v57 = [(SBHomeScreenController *)self->_homeScreenController createModalLibraryControllerForWindowScene:v6];
  objc_msgSend(v7, "setModalLibraryController:");
  [(SBHomeScreenController *)self->_homeScreenController updateStatusBarLegibilityForWindowScene:v6];
  v29 = [(SBHomeScreenController *)self->_homeScreenController createStatusBarVisibiltyAssertionForWindowScene:v6];
  showStatusBarAssertion = self->_showStatusBarAssertion;
  self->_showStatusBarAssertion = v29;

  [(SBWindowSceneStatusBarSettingsAssertion *)self->_showStatusBarAssertion acquire];
  v31 = [[SBExternalDisplayWallpaperController alloc] initWithWindowScene:v6 requiresTraitsParticipant:0];
  wallpaperController = self->_wallpaperController;
  self->_wallpaperController = v31;

  v33 = objc_alloc_init(SBContinuityLockStateProvider);
  [v7 setUILockStateProvider:v33];

  v34 = objc_alloc_init(SBContinuitySecureDisplayStateProvider);
  [v7 setSecureDisplayStateProvider:v34];

  v35 = [(id)SBApp authenticationController];
  v36 = [v35 authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:1];
  [v7 setAuthenticationStatusProvider:v36];

  v37 = +[SBWorkspace mainWorkspace];
  v38 = [v37 transientOverlayPresentationManager];
  [v38 windowSceneDidConnect:v6];

  if (([MEMORY[0x1E4F73138] inUserSessionLoginUI] & 1) == 0)
  {
    v39 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v39 windowSceneDidConnect:v6];

    v40 = [[SBSwitcherController alloc] initWithWindowScene:v6 debugName:@"Continuity"];
    [v7 setSwitcherController:v40];
    v41 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v41 beginCoordinatingSwitcherController:v40 options:1];
  }
  v42 = [v6 pictureInPictureManager];
  [v42 windowSceneDidConnect:v6];

  v56 = [(id)SBApp pictureInPictureCoordinator];
  v43 = [v56 controllerForType:0];
  [v43 movePIPContentToWindowScene:v6];
  v44 = [SBAlertLayoutPresentationVerifier alloc];
  v45 = [v6 screen];
  v46 = [(SBAlertLayoutPresentationVerifier *)v44 initWithScreen:v45];

  v47 = [SBSharedModalAlertItemPresenter alloc];
  v48 = [(id)SBApp lockOutController];
  v49 = +[SBReachabilityManager sharedInstance];
  v50 = [(SBSharedModalAlertItemPresenter *)v47 initWithLockOutProvider:v48 systemGestureManager:v63 reachabilityManager:v49 alertLayoutPresentationVerifier:v46 windowScene:v6];

  v51 = +[SBAlertItemsController sharedInstance];
  [v51 windowSceneDidConnect:v6 withSharedModalAlertItemPresenter:v50];

  v52 = [(id)SBApp systemApertureControllerForMainDisplay];
  [v7 setSystemApertureController:v52];
  v53 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v53 windowSceneDidConnect:v6];

  v54 = [(id)SBApp multiDisplayUserInteractionCoordinator];
  [v54 windowSceneDidConnect:v6];

  v55 = [v6 statusBarManager];
  [v55 windowSceneDidConnect:v6];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (UISceneSession *)a4;
  v11 = (UISceneConnectionOptions *)a5;
  uint64_t v12 = SBLogContinuitySession();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v35 = v9;
    __int16 v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ willConnectToSession", buf, 0x16u);
  }
  v14 = [(UISceneSession *)v10 role];
  if (([v14 isEqualToString:*MEMORY[0x1E4FA7F70]] & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:329 description:@"unexpected role for SBContinuityDisplayDelayedUIWindowSceneDelegate"];
  }
  uint64_t v15 = objc_opt_class();
  id v16 = v9;
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  if (!v18)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SBContinuityDisplayDelayedUIWindowSceneDelegate.m", 332, @"scene isn't correct type: %@", objc_opt_class() object file lineNumber description];
  }
  v19 = [[SBContinuityDisplayPresentationBinderWindow alloc] initWithWindowScene:v18];
  presentationBinderWindow = self->_presentationBinderWindow;
  self->_presentationBinderWindow = &v19->super.super;

  [(UIWindow *)self->_presentationBinderWindow setWindowLevel:1.79769313e308];
  v21 = self->_presentationBinderWindow;
  uint64_t v22 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIWindow *)v21 setBackgroundColor:v22];

  [(UIWindow *)self->_presentationBinderWindow setHidden:0];
  connectingScene = self->_connectingScene;
  self->_connectingScene = v18;
  v24 = v18;

  connectingSceneSession = self->_connectingSceneSession;
  self->_connectingSceneSession = v10;
  v26 = v10;

  connectingSceneConnectionOptions = self->_connectingSceneConnectionOptions;
  self->_connectingSceneConnectionOptions = v11;
  v28 = v11;

  v29 = +[SBContinuitySessionManager sharedInstance];
  v30 = [v29 registerWindowScene:v24];
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = v30;
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 _sceneIdentifier];
    int v12 = 134218242;
    id v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ didDisconnect", (uint8_t *)&v12, 0x16u);
  }
  [(BSInvalidatable *)self->_continuitySessionManagerRegistration invalidate];
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = 0;

  uint64_t v8 = objc_opt_class();
  id v9 = v4;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  [(SBContinuitySession *)self->_continuitySession noteMainSceneDisconnected:v11];
  [(SBContinuityDisplayDelayedUIWindowSceneDelegate *)self _tearDownUIAndInvalidateIfNecessaryForReason:@"scene disconnected"];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = SBLogContinuitySession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBContinuityDisplayDelayedUIWindowSceneDelegate sceneWillEnterForeground:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (SBContinuitySession)connectedSession
{
  return self->_continuitySession;
}

- (void)didConnectToSession:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_continuitySession = &self->_continuitySession;
  if (self->_continuitySession)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:375 description:@"Already have a session!!"];
  }
  uint64_t v8 = SBLogContinuitySession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    connectingScene = self->_connectingScene;
    uint64_t v10 = [(SBWindowScene *)connectingScene _sceneIdentifier];
    int v20 = 134218498;
    v21 = connectingScene;
    __int16 v22 = 2114;
    v23 = v10;
    __int16 v24 = 2048;
    id v25 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ connected to session <%p>", (uint8_t *)&v20, 0x20u);
  }
  objc_storeStrong((id *)&self->_continuitySession, a3);
  [v6 addStateObserver:self];
  [(SBContinuitySession *)*p_continuitySession setOrientationDelegate:self];
  id v11 = self->_connectingScene;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBContinuityDisplayDelayedUIWindowSceneDelegate.m", 384, @"_connectingScene is nil, this means we already setup the UI but we just got the scene!" object file lineNumber description];

    id v11 = self->_connectingScene;
  }
  int v12 = [(SBWindowScene *)v11 _FBSScene];
  id v13 = [v12 continuitySessionParticipantClientComponent];

  if (!v13)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:388 description:@"No SBUIContinuitySessionPartipantClientComponent"];
  }
  [v13 setContinuitySession:v6];
  __int16 v14 = [(SBWindowScene *)self->_connectingScene _FBSScene];
  uint64_t v15 = [v14 continuityHostProxyClientComponent];

  if (!v15)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:392 description:@"No SBContinuityHostProxyClientComponent"];
  }
  [v6 addScreenRecordingObserver:v15];
  [v15 continuitySessionDidUpdateScreenRecordingState:v6];
  [(SBContinuitySession *)*p_continuitySession noteMainSceneConnected:self->_connectingScene];
  [v6 noteSceneHasValidDisplayUUID:self->_connectingScene];
  [(SBContinuityDisplayDelayedUIWindowSceneDelegate *)self continuitySessionDidUpdateState:v6];
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  v17 = (SBContinuitySession *)a3;
  connectingScene = self->_connectingScene;
  if (connectingScene)
  {
    id v6 = connectingScene;
  }
  else
  {
    id v6 = [(SBAbstractWindowSceneDelegate *)self windowScene];
  }
  uint64_t v7 = v6;
  uint64_t v8 = v17;
  if (self->_continuitySession != v17)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [(SBWindowScene *)v7 _sceneIdentifier];
    [v15 handleFailureInMethod:a2, self, @"SBContinuityDisplayDelayedUIWindowSceneDelegate.m", 411, @"Main scene <%p>:%@ state update for session <%p> is not the one i'm tracking <%p>", v7, v16, v17, self->_continuitySession object file lineNumber description];

    uint64_t v8 = v17;
  }
  switch([(SBContinuitySession *)v8 state])
  {
    case 1uLL:
      if (self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State is blocked but we already created UI";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 418;
        goto LABEL_26;
      }
      break;
    case 2uLL:
      if (self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State is preparingForRemoteUnlock but we already created UI";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 421;
        goto LABEL_26;
      }
      break;
    case 3uLL:
      if (self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State is waitingForRemoteUnlock but we already created UI";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 424;
        goto LABEL_26;
      }
      break;
    case 4uLL:
      if (self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State is waitingForScenes but we already created UI";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 427;
        goto LABEL_26;
      }
      break;
    case 5uLL:
      if (self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State is waitingForHIDServices but we already created UI";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 430;
        goto LABEL_26;
      }
      break;
    case 6uLL:
      [(SBContinuityDisplayDelayedUIWindowSceneDelegate *)self _initializeUIIfNecessaryForReason:@"session state .activating"];
      break;
    case 7uLL:
      if (!self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State moved to updating active display but we haven't initialized the UI yet";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 437;
        goto LABEL_26;
      }
      break;
    case 8uLL:
      if (!self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State moved to launching but we haven't initialized the UI yet";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 440;
        goto LABEL_26;
      }
      break;
    case 9uLL:
      if (!self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State moved to flushing but we haven't initialized the UI yet";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 443;
        goto LABEL_26;
      }
      break;
    case 10uLL:
      if (!self->_initializedUI)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = v9;
        id v11 = @"State moved to active but we haven't initialized the UI yet";
        SEL v12 = a2;
        id v13 = self;
        uint64_t v14 = 446;
LABEL_26:
        [v9 handleFailureInMethod:v12 object:v13 file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:v14 description:v11];
      }
      break;
    case 11uLL:
      [(SBContinuityDisplayDelayedUIWindowSceneDelegate *)self _tearDownUIAndInvalidateIfNecessaryForReason:@"session state is .invalid"];
      break;
    default:
      break;
  }
}

- (void)continuitySession:(id)a3 didUpdateHostedInterfaceOrientation:(int64_t)a4
{
  if (BSInterfaceOrientationIsValid())
  {
    traitsDisplayPipelineManager = self->_traitsDisplayPipelineManager;
    [(SBTraitsContinuityDisplayPipelineManager *)traitsDisplayPipelineManager setDeviceOrientation:a4];
  }
}

- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  continuitySession = self->_continuitySession;
  [(SBContinuitySession *)continuitySession setInterfaceOrientation:a3 supportedInterfaceOrientations:a4];
}

- (void)_initializeUIIfNecessaryForReason:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_initializedUI)
  {
    uint64_t v5 = [(SBAbstractWindowSceneDelegate *)self windowScene];
    id v6 = SBLogContinuitySession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 _sceneIdentifier];
      *(_DWORD *)buf = 134218498;
      v41 = (SBWindowScene *)v5;
      __int16 v42 = 2114;
      v43 = v7;
      __int16 v44 = 2114;
      id v45 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ initializing UI if necessary - %{public}@ --> already initialized UI", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = SBLogContinuitySession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      connectingScene = self->_connectingScene;
      uint64_t v10 = [(SBWindowScene *)connectingScene _sceneIdentifier];
      *(_DWORD *)buf = 134218498;
      v41 = connectingScene;
      __int16 v42 = 2114;
      v43 = v10;
      __int16 v44 = 2114;
      id v45 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ initializing UI if necessary - %{public}@", buf, 0x20u);
    }
    uint64_t v11 = [(SBContinuitySession *)self->_continuitySession state];
    SEL v12 = SBLogContinuitySession();
    uint64_t v5 = v12;
    if (v11 == 6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBContinuityDisplayDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](v5, v13, v14, v15, v16, v17, v18, v19);
      }

      int v20 = SBLogContinuitySession();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SBContinuityDisplayDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      v28 = self->_connectingScene;
      connectingSceneSession = self->_connectingSceneSession;
      connectingSceneConnectionOptions = self->_connectingSceneConnectionOptions;
      v39.receiver = self;
      v39.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
      [(SBAbstractWindowSceneDelegate *)&v39 scene:v28 willConnectToSession:connectingSceneSession options:connectingSceneConnectionOptions];
      v31 = self->_connectingScene;
      self->_connectingScene = 0;

      v32 = self->_connectingSceneSession;
      self->_connectingSceneSession = 0;

      v33 = self->_connectingSceneConnectionOptions;
      self->_connectingSceneConnectionOptions = 0;

      self->_initializedUI = 1;
      continuitySession = self->_continuitySession;
      id v35 = [(SBAbstractWindowSceneDelegate *)self windowScene];
      [(SBContinuitySession *)continuitySession noteUIIsReady:v35];

      uint64_t v5 = +[SBLockScreenManager sharedInstance];
      [v5 noteContinuityDisplayWindowSceneConnectionDidChange];
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = [(SBWindowScene *)self->_connectingScene _sceneIdentifier];
      v37 = self->_continuitySession;
      if (v37)
      {
        NSStringFromSBContinuitySessionState(v11);
        uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v38 = @".unknown because we don't have a session yet!";
      }
      *(_DWORD *)buf = 138543618;
      v41 = v36;
      __int16 v42 = 2114;
      v43 = v38;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "scene %{public}@ refuses to initialize UI because the session state is %{public}@", buf, 0x16u);
      if (v37) {
    }
      }
  }
}

- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SBAbstractWindowSceneDelegate *)self windowScene];
  connectingScene = v6;
  if (!v6) {
    connectingScene = self->_connectingScene;
  }
  uint64_t v8 = connectingScene;

  uint64_t v9 = SBLogContinuitySession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(SBWindowScene *)v8 _sceneIdentifier];
    *(_DWORD *)buf = 134218498;
    __int16 v44 = v8;
    __int16 v45 = 2114;
    uint64_t v46 = v10;
    __int16 v47 = 2114;
    id v48 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Main scene <%p>:%{public}@ tear down UI and invalidate if necessary - %{public}@", buf, 0x20u);
  }
  if ([(SBAbstractWindowSceneDelegate *)self isInvalidated])
  {
    uint64_t v11 = SBLogContinuitySession();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "--> already invalidated", buf, 2u);
    }
  }
  else
  {
    SEL v12 = [(SBWindowScene *)v8 _FBSScene];
    uint64_t v11 = [v12 continuityHostProxyClientComponent];

    if (!v11)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayDelayedUIWindowSceneDelegate.m" lineNumber:510 description:@"No SBContinuityHostProxyClientComponent"];
    }
    [(SBContinuitySession *)self->_continuitySession removeScreenRecordingObserver:v11];
    [(SBContinuitySession *)self->_continuitySession setOrientationDelegate:0];
    [(SBContinuitySession *)self->_continuitySession removeStateObserver:self];
    continuitySession = self->_continuitySession;
    self->_continuitySession = 0;

    BOOL initializedUI = self->_initializedUI;
    uint64_t v15 = SBLogContinuitySession();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (initializedUI)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "--> tearing down UI now...", buf, 2u);
      }

      [(BSDefaultObserver *)self->_displayModeSettingsToken invalidate];
      [(BSInvalidatable *)self->_eventRoutingAssertion invalidate];
      eventRoutingAssertion = self->_eventRoutingAssertion;
      self->_eventRoutingAssertion = 0;

      increasedMemoryLimitsTransaction = self->_increasedMemoryLimitsTransaction;
      self->_increasedMemoryLimitsTransaction = 0;

      uint64_t v19 = +[SBMainWorkspace sharedInstanceIfExists];
      int v20 = [v19 keyboardFocusController];
      uint64_t v21 = NSString;
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      uint64_t v24 = [(SBWindowScene *)v8 screen];
      uint64_t v25 = [v24 displayIdentity];
      uint64_t v26 = [v21 stringWithFormat:@"%@ - %@", v23, v25];
      v41 = [v20 suppressKeyboardFocusEvaluationForReason:v26];

      [(SBWindowScene *)v8 setInvalidating:1];
      uint64_t v27 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      v28 = [(SBWindowScene *)v8 switcherController];
      [v27 endCoordinatingSwitcherController:v28 options:1];

      v29 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      [v29 windowSceneDidDisconnect:v8];

      [(SBWindowSceneStatusBarSettingsAssertion *)self->_showStatusBarAssertion invalidate];
      showStatusBarAssertion = self->_showStatusBarAssertion;
      self->_showStatusBarAssertion = 0;

      v31 = [(SBAbstractWindowSceneDelegate *)self floatingDockController];
      [v31 invalidate];

      v32 = [(SBAbstractWindowSceneDelegate *)self modalLibraryController];
      [v32 invalidate];

      v33 = [(SBAbstractWindowSceneDelegate *)self homeScreenController];
      [v33 invalidate];

      v34 = [(SBWindowScene *)v8 systemGestureManager];
      [v34 invalidate];

      id v35 = +[SBAlertItemsController sharedInstance];
      [v35 windowSceneDidDisconnect:v8];

      __int16 v36 = +[SBAppInteractionEventSourceManager sharedInstance];
      [v36 windowSceneDidDisconnect:v8];

      v37 = [(id)SBApp multiDisplayUserInteractionCoordinator];
      [v37 windowSceneDidDisconnect:v8];

      v42.receiver = self;
      v42.super_class = (Class)SBContinuityDisplayDelayedUIWindowSceneDelegate;
      [(SBAbstractWindowSceneDelegate *)&v42 sceneDidDisconnect:v8];
      [v41 invalidate];
      uint64_t v38 = +[SBLockScreenManager sharedInstance];
      [v38 noteContinuityDisplayWindowSceneConnectionDidChange];

      objc_super v39 = [(SBAbstractWindowSceneDelegate *)self sceneManager];
      [v39 invalidate];

      [(SBWindowScene *)v8 invalidate];
      [(SBAbstractWindowSceneDelegate *)self setInvalidated:1];
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "--> never initialized UI", buf, 2u);
      }

      [(SBWindowScene *)v8 invalidate];
      [(SBAbstractWindowSceneDelegate *)self setInvalidated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuitySessionManagerRegistration, 0);
  objc_storeStrong((id *)&self->_continuitySession, 0);
  objc_storeStrong((id *)&self->_connectingSceneConnectionOptions, 0);
  objc_storeStrong((id *)&self->_connectingSceneSession, 0);
  objc_storeStrong((id *)&self->_connectingScene, 0);
  objc_storeStrong((id *)&self->_presentationBinderWindow, 0);
  objc_storeStrong((id *)&self->_increasedMemoryLimitsTransaction, 0);
  objc_storeStrong((id *)&self->_eventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_showStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_traitsDisplayPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsWindowParticipantsDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)sceneWillEnterForeground:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end