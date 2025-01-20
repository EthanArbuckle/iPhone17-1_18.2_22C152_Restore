@interface SBWindowSceneContext
- (BNBannerController)bannerController;
- (CSCoverSheetViewController)coverSheetViewController;
- (FBSDisplayLayoutPublishing)displayLayoutPublisher;
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
- (SBWindowSceneContext)initWithScene:(id)a3;
- (SBWindowScenePIPManager)pictureInPictureManager;
- (TRAArbiter)traitsArbiter;
- (UIScene)_scene;
- (void)_setScene:(id)a3;
- (void)setAmbientPresentationController:(id)a3;
- (void)setAssistantController:(id)a3;
- (void)setAuthenticationStatusProvider:(id)a3;
- (void)setCommandValidator:(id)a3;
- (void)setDisplayLayoutPublisher:(id)a3;
- (void)setFloatingDockController:(id)a3;
- (void)setHardwareButtonBezelEffectsCoordinator:(id)a3;
- (void)setHomeAffordanceInteractionManager:(id)a3;
- (void)setHomeScreenController:(id)a3;
- (void)setLayoutStateManager:(id)a3;
- (void)setLayoutStateProvider:(id)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setLockedPointerManager:(id)a3;
- (void)setModalLibraryController:(id)a3;
- (void)setModalUIFluidDismissGestureManager:(id)a3;
- (void)setPictureInPictureManager:(id)a3;
- (void)setReachabilitySceneOffsetProvider:(id)a3;
- (void)setRecordingIndicatorManager:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setSecureDisplayStateProvider:(id)a3;
- (void)setSwitcherController:(id)a3;
- (void)setSystemApertureController:(id)a3;
- (void)setSystemGestureManager:(id)a3;
- (void)setSystemPointerInteractionManager:(id)a3;
- (void)setTraitsArbiter:(id)a3;
- (void)setTraitsPipelineManager:(id)a3;
- (void)setTransientUIInteractionManager:(id)a3;
- (void)setUILockStateProvider:(id)a3;
- (void)setWindowHidingManager:(id)a3;
- (void)setZStackResolver:(id)a3;
@end

@implementation SBWindowSceneContext

- (SBWindowScenePIPManager)pictureInPictureManager
{
  return self->_pictureInPictureManager;
}

- (SBFloatingDockController)floatingDockController
{
  return self->_floatingDockController;
}

- (SBSceneManager)sceneManager
{
  sceneManager = self->_sceneManager;
  if (!sceneManager)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBWindowSceneContext.m", 165, @"Invalid parameter not satisfying: %@", @"_sceneManager" object file lineNumber description];

    sceneManager = self->_sceneManager;
  }
  return sceneManager;
}

- (SBHomeScreenController)homeScreenController
{
  return self->_homeScreenController;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  return self->_layoutStateProvider;
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  v3 = +[SBWorkspace mainWorkspace];
  v4 = [v3 transientOverlayPresentationManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  v6 = [v4 transientOverlayPresenterForWindowScene:WeakRetained];

  return (SBTransientOverlayPresenting *)v6;
}

- (SBLockStateProviding)uiLockStateProvider
{
  uiLockStateProvider = self->_uiLockStateProvider;
  if (!uiLockStateProvider)
  {
    v4 = +[SBLockScreenManager sharedInstance];
    v5 = self->_uiLockStateProvider;
    self->_uiLockStateProvider = v4;

    uiLockStateProvider = self->_uiLockStateProvider;
  }
  return uiLockStateProvider;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  medusaHostedKeyboardWindowController = self->_medusaHostedKeyboardWindowController;
  if (!medusaHostedKeyboardWindowController)
  {
    v4 = [SBMedusaHostedKeyboardWindowController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    v6 = [(SBMedusaHostedKeyboardWindowController *)v4 initWithWindowScene:WeakRetained];
    v7 = self->_medusaHostedKeyboardWindowController;
    self->_medusaHostedKeyboardWindowController = v6;

    medusaHostedKeyboardWindowController = self->_medusaHostedKeyboardWindowController;
  }
  return medusaHostedKeyboardWindowController;
}

- (SBAssistantSceneControlling)assistantController
{
  return self->_assistantController;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  return self->_recordingIndicatorManager;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  return self->_traitsPipelineManager;
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  return self->_hardwareButtonBezelEffectsCoordinator;
}

- (SBModalLibraryController)modalLibraryController
{
  return self->_modalLibraryController;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  return self->_layoutStateManager;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (SBLockScreenManager)lockScreenManager
{
  return +[SBLockScreenManager sharedInstance];
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  secureDisplayStateProvider = self->_secureDisplayStateProvider;
  if (!secureDisplayStateProvider)
  {
    v4 = [(id)SBApp authenticationController];
    v5 = self->_secureDisplayStateProvider;
    self->_secureDisplayStateProvider = v4;

    secureDisplayStateProvider = self->_secureDisplayStateProvider;
  }
  return secureDisplayStateProvider;
}

- (SBSystemApertureController)systemApertureController
{
  return self->_systemApertureController;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  authenticationStatusProvider = self->_authenticationStatusProvider;
  if (!authenticationStatusProvider)
  {
    v4 = [(id)SBApp authenticationController];
    v5 = self->_authenticationStatusProvider;
    self->_authenticationStatusProvider = v4;

    authenticationStatusProvider = self->_authenticationStatusProvider;
  }
  return authenticationStatusProvider;
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  return self->_homeAffordanceInteractionManager;
}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  return self->_systemPointerInteractionManager;
}

- (SBWindowSceneContext)initWithScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBWindowSceneContext.m", 58, @"Invalid parameter not satisfying: %@", @"[scene isKindOfClass:[SBWindowScene class]]" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBWindowSceneContext;
  v6 = [(SBWindowSceneContext *)&v11 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v8 = SBSafeCast(v7, v5);
    objc_storeWeak((id *)&v6->_sbWindowScene, v8);
  }
  return v6;
}

- (void)_setScene:(id)a3
{
  id v8 = a3;
  p_sbWindowScene = &self->_sbWindowScene;
  id WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);

  if (WeakRetained != v8)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = SBSafeCast(v6, v8);
    objc_storeWeak((id *)p_sbWindowScene, v7);
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (UIScene *)WeakRetained;
}

- (SBAlertItemsController)alertItemsController
{
  return +[SBAlertItemsController sharedInstance];
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  v3 = +[SBAppInteractionEventSourceManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v5 = [v3 eventSourceForWindowScene:WeakRetained];

  return (SBDisplayAppInteractionEventSource *)v5;
}

- (BNBannerController)bannerController
{
  bannerController = self->_bannerController;
  if (!bannerController)
  {
    v4 = [(id)SBApp bannerManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    uint64_t v6 = (BNBannerController *)[v4 newBannerControllerForWindowScene:WeakRetained];
    uint64_t v7 = self->_bannerController;
    self->_bannerController = v6;

    bannerController = self->_bannerController;
  }
  return bannerController;
}

- (SBControlCenterController)controlCenterController
{
  return +[SBControlCenterController sharedInstance];
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return +[SBCoverSheetPresentationManager sharedInstance];
}

- (CSCoverSheetViewController)coverSheetViewController
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 coverSheetViewController];

  return (CSCoverSheetViewController *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return (SBModalAlertPresentationCoordinator *)[(id)SBApp modalAlertPresentationCoordinator];
}

- (SBWallpaperController)wallpaperController
{
  return +[SBWallpaperController sharedInstance];
}

- (void)setAssistantController:(id)a3
{
}

- (void)setAuthenticationStatusProvider:(id)a3
{
}

- (void)setDisplayLayoutPublisher:(id)a3
{
}

- (void)setFloatingDockController:(id)a3
{
}

- (void)setHomeAffordanceInteractionManager:(id)a3
{
}

- (void)setHomeScreenController:(id)a3
{
}

- (void)setLayoutStateProvider:(id)a3
{
}

- (void)setLayoutStateManager:(id)a3
{
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (SBLockedPointerManager)lockedPointerManager
{
  return self->_lockedPointerManager;
}

- (void)setLockedPointerManager:(id)a3
{
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  return self->_modalUIFluidDismissGestureManager;
}

- (void)setModalUIFluidDismissGestureManager:(id)a3
{
}

- (void)setPictureInPictureManager:(id)a3
{
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  return self->_reachabilitySceneOffsetProvider;
}

- (void)setReachabilitySceneOffsetProvider:(id)a3
{
}

- (void)setRecordingIndicatorManager:(id)a3
{
}

- (void)setSceneManager:(id)a3
{
}

- (void)setSecureDisplayStateProvider:(id)a3
{
}

- (void)setSystemApertureController:(id)a3
{
}

- (void)setSwitcherController:(id)a3
{
}

- (void)setSystemGestureManager:(id)a3
{
}

- (TRAArbiter)traitsArbiter
{
  return self->_traitsArbiter;
}

- (void)setTraitsArbiter:(id)a3
{
}

- (void)setTraitsPipelineManager:(id)a3
{
}

- (SBWindowHidingManager)windowHidingManager
{
  return self->_windowHidingManager;
}

- (void)setWindowHidingManager:(id)a3
{
}

- (SBFZStackResolver)zStackResolver
{
  return self->_zStackResolver;
}

- (void)setZStackResolver:(id)a3
{
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  return self->_transientUIInteractionManager;
}

- (void)setTransientUIInteractionManager:(id)a3
{
}

- (void)setHardwareButtonBezelEffectsCoordinator:(id)a3
{
}

- (void)setUILockStateProvider:(id)a3
{
}

- (SBAmbientPresentationController)ambientPresentationController
{
  return self->_ambientPresentationController;
}

- (void)setAmbientPresentationController:(id)a3
{
}

- (void)setModalLibraryController:(id)a3
{
}

- (void)setSystemPointerInteractionManager:(id)a3
{
}

- (SBUICommandValidating)commandValidator
{
  return self->_commandValidator;
}

- (void)setCommandValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandValidator, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_modalLibraryController, 0);
  objc_storeStrong((id *)&self->_ambientPresentationController, 0);
  objc_storeStrong((id *)&self->_uiLockStateProvider, 0);
  objc_storeStrong((id *)&self->_hardwareButtonBezelEffectsCoordinator, 0);
  objc_storeStrong((id *)&self->_transientUIInteractionManager, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_windowHidingManager, 0);
  objc_storeStrong((id *)&self->_traitsPipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_systemApertureController, 0);
  objc_storeStrong((id *)&self->_secureDisplayStateProvider, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorManager, 0);
  objc_storeStrong((id *)&self->_reachabilitySceneOffsetProvider, 0);
  objc_storeStrong((id *)&self->_pictureInPictureManager, 0);
  objc_storeStrong((id *)&self->_modalUIFluidDismissGestureManager, 0);
  objc_storeStrong((id *)&self->_lockedPointerManager, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_layoutStateProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteractionManager, 0);
  objc_storeStrong((id *)&self->_floatingDockController, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_bannerController, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowController, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end