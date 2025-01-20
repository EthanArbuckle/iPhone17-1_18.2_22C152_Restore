@interface SBAbstractWindowSceneDelegate
- (BNBannerController)bannerController;
- (BOOL)_isWindowContentVisible:(id)a3;
- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3;
- (BOOL)_shouldManageParticipantWithRole:(id)a3;
- (BOOL)isInvalidated;
- (CSCoverSheetViewController)coverSheetViewController;
- (FBSDisplayLayoutPublishing)displayLayoutPublisher;
- (SBAbstractWindowSceneDelegate)init;
- (SBAlertItemsController)alertItemsController;
- (SBAmbientPresentationController)ambientPresentationController;
- (SBAssistantSceneControlling)assistantController;
- (SBControlCenterController)controlCenterController;
- (SBCoverSheetPresentationManager)coverSheetPresentationManager;
- (SBDisplayAppInteractionEventSource)appInteractionEventSource;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBFSecureDisplayStateProviding)secureDisplayStateProvider;
- (SBFZStackResolver)zStackResolver;
- (SBFloatingDockController)floatingDockController;
- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator;
- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager;
- (SBHomeScreenController)homeScreenController;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (SBLockScreenManager)lockScreenManager;
- (SBLockStateProviding)uiLockStateProvider;
- (SBLockedPointerManager)lockedPointerManager;
- (SBMainDisplayLayoutStateManager)layoutStateManager;
- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController;
- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator;
- (SBModalLibraryController)modalLibraryController;
- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager;
- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider;
- (SBRecordingIndicatorManager)recordingIndicatorManager;
- (SBSceneLayoutStateProvider)layoutStateProvider;
- (SBSceneManager)sceneManager;
- (SBSwitcherController)switcherController;
- (SBSystemApertureController)systemApertureController;
- (SBSystemGestureManager)systemGestureManager;
- (SBSystemPointerInteractionManager)systemPointerInteractionManager;
- (SBTraitsPipelineManager)traitsPipelineManager;
- (SBTransientOverlayPresenting)transientOverlayPresenter;
- (SBTransientUIInteractionManager)transientUIInteractionManager;
- (SBUICommandValidating)commandValidator;
- (SBWallpaperController)wallpaperController;
- (SBWindowHidingManager)windowHidingManager;
- (SBWindowScene)windowScene;
- (SBWindowScenePIPManager)pictureInPictureManager;
- (TRAArbiter)traitsArbiter;
- (double)_windowScene:(id)a3 levelForWindow:(id)a4 preferredLevel:(double)a5;
- (id)_acquireParticipantForWindow:(id)a3 reason:(id)a4;
- (id)_createTraitsArbiterWithPipelineManager:(id)a3;
- (id)_displayLayoutPublisherForWindowScene:(id)a3;
- (id)_participantForWindow:(id)a3;
- (id)_pipelineManager;
- (id)_sbWindowSceneContext;
- (id)_sceneManagerForConnectingWindowScene:(id)a3;
- (id)_traitsDelegateForWindowRole:(id)a3;
- (void)_commonSceneSetupForScene:(id)a3;
- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4;
- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4;
- (void)_handleKeyShortcutHUDVisibilityDidDismiss;
- (void)_handleKeyShortcutHUDVisibilityDidPresent;
- (void)_setParticipant:(id)a3 forWindow:(id)a4;
- (void)_windowScene:(id)a3 window:(id)a4 didUpdateSupportedInterfaceOrientations:(unint64_t)a5 preferredOrientation:(int64_t)a6;
- (void)_windowScene:(id)a3 windowDidBecomeVisible:(id)a4;
- (void)_windowScene:(id)a3 windowWillAttach:(id)a4;
- (void)_windowScene:(id)a3 windowWillBecomeHidden:(id)a4;
- (void)_windowScene:(id)a3 windowWillBecomeVisible:(id)a4;
- (void)_windowScene:(id)a3 windowWillDetach:(id)a4;
- (void)displayEndpointDidUpdateRootWindow:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBAbstractWindowSceneDelegate

- (SBWindowScenePIPManager)pictureInPictureManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 pictureInPictureManager];

  return (SBWindowScenePIPManager *)v3;
}

- (SBFloatingDockController)floatingDockController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 floatingDockController];

  return (SBFloatingDockController *)v3;
}

- (SBSceneManager)sceneManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 sceneManager];

  return (SBSceneManager *)v3;
}

- (SBHomeScreenController)homeScreenController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 homeScreenController];

  return (SBHomeScreenController *)v3;
}

- (SBSwitcherController)switcherController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 switcherController];

  return (SBSwitcherController *)v3;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 layoutStateProvider];

  return (SBSceneLayoutStateProvider *)v3;
}

- (id)_sbWindowSceneContext
{
  return self->_windowSceneContext;
}

- (SBLockStateProviding)uiLockStateProvider
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 uiLockStateProvider];

  return (SBLockStateProviding *)v3;
}

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 transientOverlayPresenter];

  return (SBTransientOverlayPresenting *)v3;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 medusaHostedKeyboardWindowController];

  return (SBMedusaHostedKeyboardWindowController *)v3;
}

- (SBAssistantSceneControlling)assistantController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 assistantController];

  return (SBAssistantSceneControlling *)v3;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 recordingIndicatorManager];

  return (SBRecordingIndicatorManager *)v3;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  v3 = [v2 traitsPipelineManager];

  return (SBTraitsPipelineManager *)v3;
}

- (void)_windowScene:(id)a3 window:(id)a4 didUpdateSupportedInterfaceOrientations:(unint64_t)a5 preferredOrientation:(int64_t)a6
{
  id v8 = a4;
  v9 = NSString;
  v10 = [v8 _roleHint];
  v11 = BSInterfaceOrientationMaskDescription();
  v12 = [v9 stringWithFormat:@"Window(%p) with role(%@) did update supportedInterfaceOrientations(%@)"], v8, v10, v11);

  v13 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:]();
  }

  v14 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v8];
  if (v14)
  {
    int v15 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
    v16 = [v14 role];
    v17 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v16];
    [v17 windowDidUpdateSupportedOrientations:a5 ownedParticipant:v14];

    objc_msgSend(v14, "setNeedsUpdatePreferencesWithReason:animate:", v12, -[SBAbstractWindowSceneDelegate _isWindowContentVisible:](self, "_isWindowContentVisible:", v8) & v15);
    [v14 updatePreferencesIfNeeded];
  }
}

- (id)_participantForWindow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = SBSafeCast(v4, v3);
  v6 = v5;
  if (v5) {
    [v5 traitsParticipant];
  }
  else {
  v7 = objc_msgSend(v3, "sb_traitsParticipant");
  }

  return v7;
}

- (BOOL)_isWindowContentVisible:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  v5 = SBSafeCast((uint64_t)v4, v3);

  if (v5) {
    char v6 = [v5 isContentHidden];
  }
  else {
    char v6 = [v3 isHidden];
  }
  char v7 = v6 ^ 1;

  return v7;
}

- (void)_windowScene:(id)a3 windowWillBecomeVisible:(id)a4
{
  id v5 = a4;
  char v6 = NSString;
  char v7 = [v5 _roleHint];
  id v8 = [v6 stringWithFormat:@"Window(%p) with role(%@) will become visible.", v5, v7];

  v9 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:]();
  }

  v10 = [v5 _roleHint];
  v11 = v10;
  if (v10 && SBTraitsArbiterOrientationActuationEnabledForRole(v10))
  {
    if ([v5 autorotates]) {
      [v5 setAutorotates:0 forceUpdateInterfaceOrientation:1];
    }
    if (([v5 isInterfaceAutorotationDisabled] & 1) == 0) {
      [v5 beginDisablingInterfaceAutorotation];
    }
  }
  if ([(SBAbstractWindowSceneDelegate *)self _shouldManageParticipantWithRole:v11])
  {
    v12 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v5];
    if (v12
      || ([(SBAbstractWindowSceneDelegate *)self _acquireParticipantForWindow:v5 reason:v8], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v11];
      [v13 windowWillBecomeVisible:v5 ownedParticipant:v12];

      [v12 setNeedsUpdatePreferencesWithReason:v8 force:1 animate:0];
    }
  }
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 displayLayoutPublisher];

  return (FBSDisplayLayoutPublishing *)v3;
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 hardwareButtonBezelEffectsCoordinator];

  return (SBHardwareButtonBezelEffectsCoordinator *)v3;
}

- (SBModalLibraryController)modalLibraryController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 modalLibraryController];

  return (SBModalLibraryController *)v3;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 layoutStateManager];

  return (SBMainDisplayLayoutStateManager *)v3;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 layoutStateTransitionCoordinator];

  return (SBLayoutStateTransitionCoordinator *)v3;
}

- (void)_windowScene:(id)a3 windowDidBecomeVisible:(id)a4
{
  id v4 = a4;
  id v5 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowDidBecomeVisible:](v4);
  }
}

- (SBLockScreenManager)lockScreenManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 lockScreenManager];

  return (SBLockScreenManager *)v3;
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 secureDisplayStateProvider];

  return (SBFSecureDisplayStateProviding *)v3;
}

- (SBSystemApertureController)systemApertureController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 systemApertureController];

  return (SBSystemApertureController *)v3;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 authenticationStatusProvider];

  return (SBFAuthenticationStatusProvider *)v3;
}

- (SBSystemGestureManager)systemGestureManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 systemGestureManager];

  return (SBSystemGestureManager *)v3;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 homeAffordanceInteractionManager];

  return (SBHomeAffordanceInteractionManager *)v3;
}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 systemPointerInteractionManager];

  return (SBSystemPointerInteractionManager *)v3;
}

- (SBAlertItemsController)alertItemsController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 alertItemsController];

  return (SBAlertItemsController *)v3;
}

- (SBAmbientPresentationController)ambientPresentationController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 ambientPresentationController];

  return (SBAmbientPresentationController *)v3;
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 appInteractionEventSource];

  return (SBDisplayAppInteractionEventSource *)v3;
}

- (BNBannerController)bannerController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 bannerController];

  return (BNBannerController *)v3;
}

- (SBControlCenterController)controlCenterController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 controlCenterController];

  return (SBControlCenterController *)v3;
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 coverSheetPresentationManager];

  return (SBCoverSheetPresentationManager *)v3;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 coverSheetViewController];

  return (CSCoverSheetViewController *)v3;
}

- (SBLockedPointerManager)lockedPointerManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 lockedPointerManager];

  return (SBLockedPointerManager *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 modalAlertPresentationCoordinator];

  return (SBModalAlertPresentationCoordinator *)v3;
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 modalUIFluidDismissGestureManager];

  return (SBModalUIFluidDismissGestureManager *)v3;
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 reachabilitySceneOffsetProvider];

  return (SBReachabilitySceneOffsetProviding *)v3;
}

- (TRAArbiter)traitsArbiter
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 traitsArbiter];

  return (TRAArbiter *)v3;
}

- (SBWallpaperController)wallpaperController
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 wallpaperController];

  return (SBWallpaperController *)v3;
}

- (SBWindowHidingManager)windowHidingManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 windowHidingManager];

  return (SBWindowHidingManager *)v3;
}

- (SBFZStackResolver)zStackResolver
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 zStackResolver];

  return (SBFZStackResolver *)v3;
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 transientUIInteractionManager];

  return (SBTransientUIInteractionManager *)v3;
}

- (SBUICommandValidating)commandValidator
{
  v2 = [(SBAbstractWindowSceneDelegate *)self _sbWindowSceneContext];
  id v3 = [v2 commandValidator];

  return (SBUICommandValidating *)v3;
}

- (SBAbstractWindowSceneDelegate)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBAbstractWindowSceneDelegate;
  v2 = [(SBAbstractWindowSceneDelegate *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(SBAbstractWindowSceneDelegate *)v2 _pipelineManager];
    pipelineManager = v3->_pipelineManager;
    v3->_pipelineManager = (SBTraitsPipelineManager *)v4;

    uint64_t v6 = [(SBAbstractWindowSceneDelegate *)v3 _createTraitsArbiterWithPipelineManager:v3->_pipelineManager];
    traitsArbiter = v3->_traitsArbiter;
    v3->_traitsArbiter = (TRAArbiter *)v6;
  }
  return v3;
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  p_windowScene = &self->_windowScene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained != obj) {
    objc_storeWeak((id *)p_windowScene, obj);
  }
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (id)_sceneManagerForConnectingWindowScene:(id)a3
{
  id v3 = a3;
  if (SBFIsShellSceneKitAvailable())
  {
    uint64_t v4 = +[SBSceneManagerCoordinator sharedInstance];
    id v5 = [v3 _FBSScene];
    uint64_t v6 = [v5 settings];
    char v7 = [v6 displayIdentity];
    id v8 = [v4 sceneManagerForDisplayIdentity:v7];
  }
  else
  {
    uint64_t v4 = [v3 _FBSScene];
    id v5 = [v4 settings];
    uint64_t v6 = [v5 transientLocalSettings];
    id v8 = [v6 objectForSetting:4444];
  }

  return v8;
}

- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (SBFIsShellSceneKitAvailable())
  {
    char v7 = [v16 _FBSScene];
    id v8 = [v7 SSKDisplayEndpoint];

    objc_super v9 = [SBRootWindowScenePresentationBinder alloc];
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"%@-%p", v12, self];
    v14 = [v8 rootWindow];
    int v15 = [(SBRootWindowScenePresentationBinder *)v9 initWithIdentifier:v13 priority:-10 appearanceStyle:0 rootWindow:v14];

    [v6 updatePresentationBinder:v15];
  }
}

- (id)_displayLayoutPublisherForWindowScene:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBAbstractWindowSceneDelegate.m" lineNumber:150 description:@"For subclasses to implement"];

  return 0;
}

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  [v6 setTraitsArbiter:self->_traitsArbiter];
  [v6 setTraitsPipelineManager:self->_pipelineManager];
  if (SBFIsShellSceneKitAvailable())
  {
    char v7 = [v40 _FBSScene];
    id v8 = [v7 SSKDisplayEndpoint];

    [v8 setDelegate:self];
  }
  objc_super v9 = [(SBAbstractWindowSceneDelegate *)self _sceneManagerForConnectingWindowScene:v40];
  [v6 setSceneManager:v9];
  [(SBAbstractWindowSceneDelegate *)self _configureNewPresentationBinderForWindowScene:v40 sceneManager:v9];
  v10 = [(SBAbstractWindowSceneDelegate *)self _displayLayoutPublisherForConnectingWindowScene:v40];
  [v6 setDisplayLayoutPublisher:v10];

  v11 = [[SBAssistantSceneController alloc] initWithWindowScene:v40];
  [v6 setAssistantController:v11];

  if (SBFIsShellSceneKitAvailable())
  {
    v12 = [MEMORY[0x1E4F62420] sharedInstance];
    v13 = [v12 connectedIdentities];
    v14 = [v13 allObjects];
  }
  else
  {
    v12 = [(id)SBApp displayManager];
    v14 = [v12 connectedIdentities];
  }

  int v15 = objc_msgSend(v14, "bs_filter:", &__block_literal_global_66);
  uint64_t v16 = [v15 count] - 1;

  uint64_t v17 = [v40 isExternalDisplayWindowScene];
  v18 = [SBSceneLayoutStateProvider alloc];
  v19 = +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:v16 isDisplayExternal:v17];
  v20 = [(SBSceneLayoutStateProvider *)v18 initWithLayoutState:v19];
  [v6 setLayoutStateProvider:v20];

  v21 = objc_alloc_init(SBMainDisplayLayoutStateManager);
  [v6 setLayoutStateManager:v21];

  v22 = [[SBLayoutStateTransitionCoordinator alloc] initWithWindowScene:v40];
  [v6 setLayoutStateTransitionCoordinator:v22];

  v23 = [SBWindowScenePIPManager alloc];
  v24 = [(id)SBApp pictureInPictureCoordinator];
  v25 = [(SBWindowScenePIPManager *)v23 initWithGlobalCoordinator:v24];

  [v6 setPictureInPictureManager:v25];
  id v26 = objc_alloc_init(MEMORY[0x1E4FA6098]);
  [v6 setZStackResolver:v26];
  v27 = [[SBWindowHidingManager alloc] initWithWindowScene:v40];
  [v6 setWindowHidingManager:v27];

  v28 = objc_alloc_init(SBReachabilityUnsupportedSceneOffsetProvider);
  [v6 setReachabilitySceneOffsetProvider:v28];

  v29 = objc_alloc_init(SBPassthroughUICommandValidator);
  [v6 setCommandValidator:v29];

  v30 = [(id)SBApp mousePointerManager];
  v31 = [v30 requestPointerActivationForScene:v40];
  pointerAssertion = self->_pointerAssertion;
  self->_pointerAssertion = v31;

  v33 = [SBHardwareButtonZStackClient alloc];
  v34 = +[SBHardwareButtonService sharedInstance];
  v35 = [(SBHardwareButtonZStackClient *)v33 initWithZStackResolver:v26 hardwareButtonService:v34];
  hardwareButtonZStackClient = self->_hardwareButtonZStackClient;
  self->_hardwareButtonZStackClient = v35;

  v37 = [(id)SBApp systemUIScenesCoordinator];
  [v37 windowSceneDidConnect:v40];

  v38 = +[SBKeyboardFocusCoordinator sharedInstance];
  [v38 windowSceneDidConnect:v40];

  v39 = [[SBLockedPointerManager alloc] initWithWindowScene:v40];
  [v6 setLockedPointerManager:v39];
  [v9 windowSceneDidConnect:v40];
}

BOOL __87__SBAbstractWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_displayWindowingMode") == 1;
}

- (id)_pipelineManager
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBAbstractWindowSceneDelegate.m" lineNumber:215 description:@"For subclasses to define"];

  return 0;
}

- (id)_traitsDelegateForWindowRole:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBAbstractWindowSceneDelegate.m" lineNumber:220 description:@"For subclasses to define"];

  return 0;
}

- (BOOL)_shouldManageParticipantWithRole:(id)a3
{
  return 1;
}

- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3
{
  return 1;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = SBLogStartup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = _SBFLoggingMethodProem();
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    v20 = self;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connecting for: %{public}@; %{public}@",
      (uint8_t *)&v15,
      0x20u);
  }
  objc_super v9 = [(id)SBApp windowSceneManager];
  [v9 _sceneWillConnect:v6];

  uint64_t v10 = objc_opt_class();
  id v11 = v6;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [(SBAbstractWindowSceneDelegate *)self setWindowScene:v13];
    [(SBAbstractWindowSceneDelegate *)self _commonSceneSetupForScene:v13];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__handleKeyShortcutHUDVisibilityDidPresent name:*MEMORY[0x1E4F43A90] object:0];
    [v14 addObserver:self selector:sel__handleKeyShortcutHUDVisibilityDidDismiss name:*MEMORY[0x1E4F43A88] object:0];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v28 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v28;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = +[SBMainWorkspace sharedInstanceIfExists];
  objc_super v9 = [v8 keyboardFocusController];
  uint64_t v10 = NSString;
  id v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  id v13 = [v7 screen];
  v14 = [v13 displayIdentity];
  int v15 = [v10 stringWithFormat:@"%@ - %@", v12, v14];
  uint64_t v16 = [v9 suppressKeyboardFocusEvaluationForReason:v15];

  __int16 v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 removeObserver:self];

  [(BSInvalidatable *)self->_pointerAssertion invalidate];
  id v18 = [(id)SBApp windowSceneManager];
  [v18 _sceneDidDisconnect:v28];

  __int16 v19 = [v7 pictureInPictureManager];
  [v19 windowSceneDidDisconnect:v7];

  v20 = [v7 assistantController];
  [v20 dismissAssistantViewIfNecessary];

  uint64_t v21 = [v8 transientOverlayPresentationManager];
  [v21 windowSceneDidDisconnect:v7];

  v22 = [v8 keyboardFocusController];
  [v22 windowSceneDidDisconnect:v7];

  v23 = [(id)SBApp bannerManager];
  [v23 dismissAllBannersInWindowScene:v7 animated:0 reason:@"sceneDidDisconnect"];

  v24 = [(id)SBApp systemUIScenesCoordinator];
  [v24 windowSceneDidDisconnect:v7];

  v25 = +[SBIconController sharedInstanceIfExists];
  [v25 windowSceneDidDisconnect:v7];

  id v26 = [v7 lockedPointerManager];
  [v26 invalidate];

  v27 = [v7 medusaHostedKeyboardWindowController];

  [v27 invalidate];
  [v16 invalidate];
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 interfaceOrientation];
  id v11 = [v8 coordinateSpace];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  if ((unint64_t)(v10 - 3) <= 1)
  {
    BSSizeSwap();
    double v13 = v16;
    double v15 = v17;
  }

  [v9 bounds];
  double v19 = v18;
  double v21 = v20;

  if ((unint64_t)(a5 - 3) <= 1)
  {
    BSSizeSwap();
    double v19 = v22;
    double v21 = v23;
  }
  if (v13 != v19 || v15 != v21)
  {
    v24 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v8 _sbDisplayConfiguration];
      id v26 = [v25 identity];
      v37.width = v19;
      v37.height = v21;
      v27 = NSStringFromCGSize(v37);
      v38.width = v13;
      v38.height = v15;
      id v28 = NSStringFromCGSize(v38);
      int v30 = 138543874;
      v31 = v26;
      __int16 v32 = 2112;
      v33 = v27;
      __int16 v34 = 2112;
      v35 = v28;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ changed from %@ to %@", (uint8_t *)&v30, 0x20u);
    }
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 postNotificationName:@"SBWindowSceneSessionRoleExternalDisplay" object:v8];
  }
}

- (void)_windowScene:(id)a3 windowWillAttach:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillAttach:]();
  }

  uint64_t v8 = objc_opt_class();
  id v9 = v5;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    double v12 = [v11 windowHidingManager];
    [v12 _window:v6 willAttachToScene:v9];
  }
}

- (void)_windowScene:(id)a3 windowWillDetach:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillDetach:](v7);
  }

  id v9 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 invalidate];
    [(SBAbstractWindowSceneDelegate *)self _setParticipant:0 forWindow:v7];
  }
  uint64_t v11 = objc_opt_class();
  id v12 = v6;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    double v15 = [v14 windowHidingManager];
    [v15 _window:v7 willDetachFromScene:v12];
  }
}

- (void)_windowScene:(id)a3 windowWillBecomeHidden:(id)a4
{
  id v5 = a4;
  id v6 = NSString;
  id v7 = [v5 _roleHint];
  uint64_t v8 = [v6 stringWithFormat:@"Window(%p) with role(%@) will become hidden.", v5, v7];

  id v9 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:]();
  }

  uint64_t v10 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v5];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 role];
    BOOL v13 = [(SBAbstractWindowSceneDelegate *)self _shouldHandleWindowWillBecomeHiddenForRole:v12];

    if (v13)
    {
      id v14 = [v11 role];
      double v15 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v14];
      [v15 windowWillBecomeHidden:v5 ownedParticipant:v11];

      [v11 setNeedsUpdatePreferencesWithReason:v8];
    }
  }
}

- (double)_windowScene:(id)a3 levelForWindow:(id)a4 preferredLevel:(double)a5
{
  id v7 = a4;
  uint64_t v8 = NSString;
  id v9 = [v7 _roleHint];
  uint64_t v10 = [v8 stringWithFormat:@"Window(%p) with role(%@) did update windowLevel(%.1f)", v7, v9, *(void *)&a5];

  uint64_t v11 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:]();
  }

  id v12 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v7];
  BOOL v13 = v12;
  if (v12)
  {
    id v14 = [v12 role];
    double v15 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v14];
    [v15 windowDidUpdatePreferredWindowLevel:v13 ownedParticipant:a5];

    [v13 setNeedsUpdatePreferencesWithReason:v10];
    [v13 updatePreferencesIfNeeded];
    [v13 currentZOrderLevel];
    a5 = v16;
  }

  return a5;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:1];
  [v4 setHomeGestureConsumption:2];
}

- (void)displayEndpointDidUpdateRootWindow:(id)a3
{
  id v5 = [(SBWindowSceneContext *)self->_windowSceneContext sceneManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [(SBAbstractWindowSceneDelegate *)self _configureNewPresentationBinderForWindowScene:WeakRetained sceneManager:v5];
}

- (void)_commonSceneSetupForScene:(id)a3
{
  id v7 = a3;
  id v4 = [[SBWindowSceneContext alloc] initWithScene:v7];
  windowSceneContext = self->_windowSceneContext;
  self->_windowSceneContext = v4;
  id v6 = v4;

  [(SBAbstractWindowSceneDelegate *)self _configureForConnectingWindowScene:v7 windowSceneContext:v6];
}

- (void)_setParticipant:(id)a3 forWindow:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = SBSafeCast(v6, v9);
  uint64_t v8 = v7;
  if (v7) {
    [v7 _setTraitsParticipant:v5];
  }
  else {
    objc_msgSend(v9, "sb_setTraitsParticipant:", v5);
  }
}

- (id)_acquireParticipantForWindow:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBAbstractWindowSceneDelegate *)self _participantForWindow:v6];
  id v9 = [v6 _roleHint];
  if (v9 && !v8)
  {
    uint64_t v10 = [v6 _sbWindowScene];
    uint64_t v11 = [v10 traitsArbiter];
    id v12 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v9];
    BOOL v13 = [v11 acquireParticipantWithRole:v9 delegate:v12];

    [(SBAbstractWindowSceneDelegate *)self _setParticipant:v13 forWindow:v6];
    id v14 = [v13 role];
    double v15 = [(SBAbstractWindowSceneDelegate *)self _traitsDelegateForWindowRole:v14];
    [v15 setParticipant:v13 ownedByWindow:v6];

    uint64_t v8 = v13;
  }

  return v8;
}

- (void)_handleKeyShortcutHUDVisibilityDidPresent
{
  if (!self->_keyShortcutHUDZStackParticipant)
  {
    id v5 = [(SBWindowSceneContext *)self->_windowSceneContext zStackResolver];
    id v3 = [v5 acquireParticipantWithIdentifier:25 delegate:self];
    keyShortcutHUDZStackParticipant = self->_keyShortcutHUDZStackParticipant;
    self->_keyShortcutHUDZStackParticipant = v3;
  }
}

- (void)_handleKeyShortcutHUDVisibilityDidDismiss
{
  keyShortcutHUDZStackParticipant = self->_keyShortcutHUDZStackParticipant;
  if (keyShortcutHUDZStackParticipant)
  {
    [(SBFZStackParticipant *)keyShortcutHUDZStackParticipant invalidate];
    id v4 = self->_keyShortcutHUDZStackParticipant;
    self->_keyShortcutHUDZStackParticipant = 0;
  }
}

- (id)_createTraitsArbiterWithPipelineManager:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FAFF70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithRolesProvider:v5 inputsDataSource:v5 drawingDataSource:v5];
  [v5 setSceneDelegate:self];
  [v5 setArbiter:v6];
  [v5 setupDefaultPipelineForArbiter:v6];

  return v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerAssertion, 0);
  objc_storeStrong((id *)&self->_windowSceneContext, 0);
  objc_storeStrong((id *)&self->_keyShortcutHUDZStackParticipant, 0);
  objc_storeStrong((id *)&self->_hardwareButtonZStackClient, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_pipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
}

- (void)_windowScene:windowWillAttach:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "Window(%p)(%{public}@) will attach.", v4, v5, v6, v7, v8);
}

- (void)_windowScene:(void *)a1 windowWillDetach:.cold.1(void *a1)
{
  v1 = [a1 _roleHint];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "Window(%p) with role(%{public}@) will detach.", v4, v5, v6, v7, v8);
}

- (void)_windowScene:windowWillBecomeVisible:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

- (void)_windowScene:(void *)a1 windowDidBecomeVisible:.cold.1(void *a1)
{
  uint64_t v1 = [a1 _roleHint];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "Window(%p) with role(%{public}@) did become visible.", v4, v5, v6, v7, v8);
}

- (void)_acquireParticipantForWindow:reason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_FAULT, "Role %{public}@ needs SpringBoard TraitsArbiter adoption", v1, 0xCu);
}

@end