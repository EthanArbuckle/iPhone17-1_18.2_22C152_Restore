@interface SBWindowScene
- (BNBannerController)bannerController;
- (BOOL)_windowsIgnoreSceneClientOrientation;
- (BOOL)isContinuityDisplayWindowScene;
- (BOOL)isContinuityScene;
- (BOOL)isEmbeddedScene;
- (BOOL)isExtendedDisplayWindowScene;
- (BOOL)isExternalDisplayScene;
- (BOOL)isExternalDisplayWindowScene;
- (BOOL)isInvalidated;
- (BOOL)isInvalidating;
- (BOOL)isMainDisplayWindowScene;
- (CGPoint)convertPoint:(CGPoint)a3 toNeighboringDisplayWindowScene:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toNeighboringDisplayWindowScene:(id)a4;
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
- (SBWindowScenePIPManager)pictureInPictureManager;
- (TRAArbiter)traitsArbiter;
- (id)_abstractWindowSceneDelegate;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_displayWindowingMode;
- (int64_t)keyboardFocusCoalitionAffinity;
- (void)invalidate;
- (void)setInvalidating:(BOOL)a3;
@end

@implementation SBWindowScene

- (SBWindowScenePIPManager)pictureInPictureManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 pictureInPictureManager];

  return (SBWindowScenePIPManager *)v3;
}

- (SBFloatingDockController)floatingDockController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 floatingDockController];

  return (SBFloatingDockController *)v3;
}

- (SBSceneManager)sceneManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 sceneManager];

  return (SBSceneManager *)v3;
}

- (SBHomeScreenController)homeScreenController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 homeScreenController];

  return (SBHomeScreenController *)v3;
}

- (SBSwitcherController)switcherController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 switcherController];

  return (SBSwitcherController *)v3;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 layoutStateProvider];

  return (SBSceneLayoutStateProvider *)v3;
}

- (id)_abstractWindowSceneDelegate
{
  v4 = [(SBWindowScene *)self delegate];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBWindowScene.m", 116, @"Delegate is nil or not the right type %@", 0 object file lineNumber description];
  }
  return v8;
}

- (BOOL)isInvalidating
{
  return self->_isInvalidating && !self->_isInvalidated;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (SBLockStateProviding)uiLockStateProvider
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 uiLockStateProvider];

  return (SBLockStateProviding *)v3;
}

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 transientOverlayPresenter];

  return (SBTransientOverlayPresenting *)v3;
}

- (SBModalLibraryController)modalLibraryController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 modalLibraryController];

  return (SBModalLibraryController *)v3;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 medusaHostedKeyboardWindowController];

  return (SBMedusaHostedKeyboardWindowController *)v3;
}

- (SBAssistantSceneControlling)assistantController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 assistantController];

  return (SBAssistantSceneControlling *)v3;
}

- (BOOL)isContinuityDisplayWindowScene
{
  v3 = [(SBWindowScene *)self session];
  v4 = [v3 role];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4FA7F70]];

  int64_t v6 = [(SBWindowScene *)self _displayWindowingMode];
  BOOL v7 = [(SBWindowScene *)self isExternalDisplayWindowScene];
  if (v7)
  {
    if (v6 == 1) {
      LOBYTE(v7) = v5;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (int64_t)_displayWindowingMode
{
  v2 = (void *)SBApp;
  v3 = [(SBWindowScene *)self _FBSScene];
  v4 = [v3 settings];
  char v5 = [v4 displayIdentity];
  int64_t v6 = [v2 windowingModeForDisplay:v5];

  return v6;
}

- (BOOL)isExternalDisplayWindowScene
{
  v2 = [(SBWindowScene *)self _FBSScene];
  v3 = [v2 settings];
  v4 = [v3 displayIdentity];
  char v5 = [v4 isExternal];

  return v5;
}

- (BOOL)isMainDisplayWindowScene
{
  v2 = [(SBWindowScene *)self _FBSScene];
  v3 = [v2 settings];
  v4 = [v3 displayIdentity];
  char v5 = [v4 isMainDisplay];

  return v5;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 recordingIndicatorManager];

  return (SBRecordingIndicatorManager *)v3;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 traitsPipelineManager];

  return (SBTraitsPipelineManager *)v3;
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 displayLayoutPublisher];

  return (FBSDisplayLayoutPublishing *)v3;
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 hardwareButtonBezelEffectsCoordinator];

  return (SBHardwareButtonBezelEffectsCoordinator *)v3;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 layoutStateManager];

  return (SBMainDisplayLayoutStateManager *)v3;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 layoutStateTransitionCoordinator];

  return (SBLayoutStateTransitionCoordinator *)v3;
}

- (SBLockScreenManager)lockScreenManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 lockScreenManager];

  return (SBLockScreenManager *)v3;
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 secureDisplayStateProvider];

  return (SBFSecureDisplayStateProviding *)v3;
}

- (BOOL)isExtendedDisplayWindowScene
{
  v3 = [(SBWindowScene *)self session];
  v4 = [v3 role];
  char v5 = [v4 isEqualToString:@"SBWindowSceneSessionRoleExternalDisplay"];

  int64_t v6 = [(SBWindowScene *)self _displayWindowingMode];
  BOOL v7 = [(SBWindowScene *)self isExternalDisplayWindowScene];
  if (v6 == 1) {
    BOOL v8 = v5;
  }
  else {
    BOOL v8 = 0;
  }
  return v7 && v8;
}

- (SBSystemApertureController)systemApertureController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 systemApertureController];

  return (SBSystemApertureController *)v3;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 authenticationStatusProvider];

  return (SBFAuthenticationStatusProvider *)v3;
}

- (SBSystemGestureManager)systemGestureManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 systemGestureManager];

  return (SBSystemGestureManager *)v3;
}

void __58__SBWindowScene_DebuggingOnly__succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) build];
  [v2 appendString:v3 withName:@"scene" skipIfEmpty:1];

  v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 48) session];
  char v5 = [v6 persistentIdentifier];
  [v4 appendString:v5 withName:@"persistentIdentifier" skipIfEmpty:1];
}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 systemPointerInteractionManager];

  return (SBSystemPointerInteractionManager *)v3;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 homeAffordanceInteractionManager];

  return (SBHomeAffordanceInteractionManager *)v3;
}

- (id)succinctDescription
{
  v2 = [(SBWindowScene *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [(SBWindowScene *)self _FBSScene];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F4F718] builderWithObject:v3];
    char v5 = [v3 identifier];
    [v4 appendString:v5 withName:@"identifier" skipIfEmpty:1];
  }
  else
  {
    v4 = 0;
  }
  id v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SBWindowScene_DebuggingOnly__succinctDescriptionBuilder__block_invoke;
  v12[3] = &unk_1E6AF4E00;
  id v7 = v6;
  id v13 = v7;
  id v14 = v4;
  v15 = self;
  id v8 = v4;
  id v9 = (id)[v7 modifyProem:v12];
  id v10 = v7;

  return v10;
}

- (void)setInvalidating:(BOOL)a3
{
  if (self->_isInvalidating && !a3)
  {
    v3 = [NSString stringWithFormat:@"Can't unvalidate an invalidating scene!"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBWindowScene *)a2 setInvalidating:(uint64_t)v3];
    }
    [v3 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_isInvalidating = a3;
  }
}

- (CGPoint)convertPoint:(CGPoint)a3 toNeighboringDisplayWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(UIWindowScene *)self _fbsDisplayConfiguration];
  id v7 = [(SBWindowScene *)self screen];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  CGRectGetWidth(v33);
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  CGRectGetHeight(v34);
  v16 = [v5 _fbsDisplayConfiguration];
  v17 = [v5 screen];

  [v17 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v35.origin.x = v19;
  v35.origin.y = v21;
  v35.size.width = v23;
  v35.size.height = v25;
  CGRectGetWidth(v35);
  v36.origin.x = v19;
  v36.origin.y = v21;
  v36.size.width = v23;
  v36.size.height = v25;
  CGRectGetHeight(v36);
  SBSConvertPointFromDisplayToNeighboringDisplay();
  double v27 = v26;
  double v29 = v28;

  double v30 = v27;
  double v31 = v29;
  result.y = v31;
  result.x = v30;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toNeighboringDisplayWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(UIWindowScene *)self _fbsDisplayConfiguration];
  id v7 = [(SBWindowScene *)self screen];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  CGRectGetWidth(v38);
  v39.origin.x = v9;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  CGRectGetHeight(v39);
  v16 = [v5 _fbsDisplayConfiguration];
  v17 = [v5 screen];

  [v17 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v40.origin.x = v19;
  v40.origin.y = v21;
  v40.size.width = v23;
  v40.size.height = v25;
  CGRectGetWidth(v40);
  v41.origin.x = v19;
  v41.origin.y = v21;
  v41.size.width = v23;
  v41.size.height = v25;
  CGRectGetHeight(v41);
  SBSConvertRectFromDisplayToNeighboringDisplay();
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  double v34 = v27;
  double v35 = v29;
  double v36 = v31;
  double v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (SBAlertItemsController)alertItemsController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 alertItemsController];

  return (SBAlertItemsController *)v3;
}

- (SBAmbientPresentationController)ambientPresentationController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 ambientPresentationController];

  return (SBAmbientPresentationController *)v3;
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 appInteractionEventSource];

  return (SBDisplayAppInteractionEventSource *)v3;
}

- (BNBannerController)bannerController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 bannerController];

  return (BNBannerController *)v3;
}

- (SBControlCenterController)controlCenterController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 controlCenterController];

  return (SBControlCenterController *)v3;
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 coverSheetPresentationManager];

  return (SBCoverSheetPresentationManager *)v3;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 coverSheetViewController];

  return (CSCoverSheetViewController *)v3;
}

- (SBLockedPointerManager)lockedPointerManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 lockedPointerManager];

  return (SBLockedPointerManager *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 modalAlertPresentationCoordinator];

  return (SBModalAlertPresentationCoordinator *)v3;
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 modalUIFluidDismissGestureManager];

  return (SBModalUIFluidDismissGestureManager *)v3;
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 reachabilitySceneOffsetProvider];

  return (SBReachabilitySceneOffsetProviding *)v3;
}

- (TRAArbiter)traitsArbiter
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 traitsArbiter];

  return (TRAArbiter *)v3;
}

- (SBWallpaperController)wallpaperController
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 wallpaperController];

  return (SBWallpaperController *)v3;
}

- (SBWindowHidingManager)windowHidingManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 windowHidingManager];

  return (SBWindowHidingManager *)v3;
}

- (SBFZStackResolver)zStackResolver
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 zStackResolver];

  return (SBFZStackResolver *)v3;
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 transientUIInteractionManager];

  return (SBTransientUIInteractionManager *)v3;
}

- (SBUICommandValidating)commandValidator
{
  v2 = [(SBWindowScene *)self _abstractWindowSceneDelegate];
  v3 = [v2 commandValidator];

  return (SBUICommandValidating *)v3;
}

- (void)invalidate
{
  self->_isInvalidated = 1;
}

- (BOOL)_windowsIgnoreSceneClientOrientation
{
  return 1;
}

- (int64_t)keyboardFocusCoalitionAffinity
{
  v3 = [(UIWindowScene *)self _sbDisplayConfiguration];
  v4 = [v3 identity];
  char v5 = [v4 isMainDisplay];

  if (v5) {
    return 0;
  }
  id v7 = [(UIWindowScene *)self _sbDisplayConfiguration];
  double v8 = [v7 identity];
  char v9 = [v8 isExternal];

  if (v9) {
    return 1;
  }
  double v10 = [(UIWindowScene *)self _sbDisplayConfiguration];
  CGFloat v11 = [v10 identity];
  int v12 = [v11 isContinuityDisplay];

  if (v12) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)isEmbeddedScene
{
  v2 = [(UIWindowScene *)self _sbDisplayConfiguration];
  v3 = [v2 identity];
  char v4 = [v3 isMainDisplay];

  return v4;
}

- (BOOL)isContinuityScene
{
  v2 = [(UIWindowScene *)self _sbDisplayConfiguration];
  v3 = [v2 identity];
  char v4 = [v3 isContinuityDisplay];

  return v4;
}

- (BOOL)isExternalDisplayScene
{
  v2 = [(UIWindowScene *)self _sbDisplayConfiguration];
  v3 = [v2 identity];
  char v4 = [v3 isExternal];

  return v4;
}

- (void)setInvalidating:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  char v9 = v5;
  __int16 v10 = 2114;
  CGFloat v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CGFloat v15 = @"SBWindowScene.m";
  __int16 v16 = 1024;
  int v17 = 56;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end