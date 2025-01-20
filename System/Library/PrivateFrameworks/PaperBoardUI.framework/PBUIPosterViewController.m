@interface PBUIPosterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_homeScreenConfigurationRequiresPosterContent;
- (BOOL)activelyRequired;
- (BOOL)handlesWakeAnimation;
- (BOOL)hidesDimmingLayer;
- (BOOL)homeScreenReflectsLockScreen;
- (BOOL)landscapeBlurEnabled;
- (BOOL)updateAssociatedPosterConfiguration:(id)a3;
- (BOOL)updateConfiguration:(id)a3;
- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4;
- (BOOL)updateHomeScene;
- (BOOL)userTapEventsRequested;
- (BOOL)wakeSourceIsSwipeToUnlock;
- (BSPathProviding)storagePath;
- (NSString)description;
- (PBUIHomeVariantStyleState)currentHomeVariantStyleState;
- (PBUIPosterComponentDelegate)delegate;
- (PBUIPosterViewController)init;
- (PRSPosterConfiguration)activeConfiguration;
- (PRSPosterConfiguration)associatedConfiguration;
- (UIColor)averageColor;
- (_UILegibilitySettings)legibilitySettings;
- (double)averageContrast;
- (double)averageContrastForVariant:(int64_t)a3;
- (double)unlockProgress;
- (id)_activeViewController;
- (id)_legacyWallpaperConfigurationManager;
- (id)_replicaProviderForVariant:(int64_t)a3;
- (id)_viewControllerForVariant:(int64_t)a3;
- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3;
- (id)averageColorForVariant:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)portalProviderForFloatingLayer;
- (id)portalSourceProviderForActiveVariant;
- (id)posterComponentExternalDisplayConfiguration:(id)a3;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)snapshotSourceProviderForActiveVariant;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)activeOrientation;
- (int64_t)activeStyle;
- (int64_t)activeStyleForVariant:(int64_t)a3;
- (int64_t)activeVariant;
- (int64_t)deviceOrientation;
- (int64_t)variant;
- (unint64_t)posterSignificantEventsCounter;
- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3;
- (void)_createHomeViewControllerIfNeeded;
- (void)_updateForActiveVariant:(int64_t)a3;
- (void)_updateHomeViewControllerVisibility;
- (void)_updateLandscapeBlur;
- (void)_updateLegibilitySettings:(id)a3;
- (void)_updateLockViewControllerVisibility;
- (void)_updatePosterScenesForReasons:(int64_t)a3 completion:(id)a4;
- (void)_updateRasterization;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)didRotateToInterfaceOrientation:(int64_t)a3;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)finishUnlockWithAnimationParameters:(CGSize)a3;
- (void)invalidate;
- (void)noteHomeVariantStyleStateMayHaveUpdated;
- (void)noteUserTapOccurred;
- (void)noteUserTapOccurredWithLocation:(CGPoint)a3;
- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4;
- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4;
- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setActiveOrientation:(int64_t)a3;
- (void)setActiveStyle:(int64_t)a3;
- (void)setActiveStyle:(int64_t)a3 forVariant:(int64_t)a4;
- (void)setActiveVariant:(int64_t)a3;
- (void)setActivelyRequired:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setLandscapeBlurEnabled:(BOOL)a3;
- (void)setUnlockProgress:(double)a3;
- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3;
- (void)setWallpaperObscured:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateHomeScene;
- (void)updateLegacyPoster;
- (void)updatePoster:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willRotateToInterfaceOrientation:(int64_t)a3;
@end

@implementation PBUIPosterViewController

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__PBUIPosterViewController_requireWallpaperRasterizationWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRasterization];
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v14 clientSettings];
  uint64_t v10 = objc_msgSend(v9, "pui_significantEventOptions");

  if (soft_PUIPosterSignificantEventOptionsContainsEvent(v10, 3))
  {
    uint64_t v11 = objc_msgSend(v7, "pr_adjustedLuminance");
    v12 = [v14 settings];
    uint64_t v13 = objc_msgSend(v12, "pr_adjustedLuminance");

    if (v11 == 2 && v13 != 2)
    {
      objc_msgSend(v7, "pui_setSignificantEventsCounter:", objc_msgSend(v7, "pui_significantEventsCounter") + 1);
      objc_msgSend(v8, "pui_setSignificantEvent:", 3);
    }
  }
}

- (void)_updateRasterization
{
  uint64_t v3 = [(BSCompoundAssertion *)self->_shouldRasterizeWallpaperAssertion isActive];
  id v9 = [(PBUIPosterViewController *)self viewIfLoaded];
  v4 = [v9 layer];
  [v4 setShouldRasterize:v3];
  if (self->_activeVariant != 1
    || (double v5 = 1.0, ![(PBUIPosterHomeViewController *)self->_homeViewController isBlurred]))
  {
    v6 = [v9 window];
    id v7 = [v6 screen];
    [v7 scale];
    if (v8 == 0.0) {
      double v5 = 1.0;
    }
    else {
      double v5 = v8;
    }
  }
  [v4 setRasterizationScale:v5];
}

- (void)_updateForActiveVariant:(int64_t)a3
{
  [(PBUIPosterViewController *)self _updateLandscapeBlur];
  int64_t activeVariant = self->_activeVariant;
  p_homeViewController = (id *)&self->_homeViewController;
  id v7 = [(PBUIPosterHomeViewController *)self->_homeViewController view];
  double v8 = v7;
  if (activeVariant == 1)
  {
    [v7 setHidden:0];
  }
  else
  {
    [v7 setHidden:1];

    p_homeViewController = (id *)&self->_lockViewController;
  }
  id v10 = *p_homeViewController;
  [(PBUIPosterViewController *)self _updateLockViewControllerVisibility];
  [(PBUIDynamicProviderWrapper *)self->_activeVariantReplicaProvider setRootObject:v10];
  [(PBUIPosterViewController *)self _updatePosterScenesForReasons:a3 | 2 completion:0];
  id v9 = [v10 legibilitySettings];
  [(PBUIPosterViewController *)self _updateLegibilitySettings:v9];
}

- (void)_updatePosterScenesForReasons:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  BOOL v7 = self->_activelyRequired || !PBUIWallpaperStyleIsHidden(self->_activeStyle);
  double unlockProgress = self->_unlockProgress;
  BOOL wakeSourceIsSwipeToUnlock = self->_wakeSourceIsSwipeToUnlock;
  int64_t activeVariant = self->_activeVariant;
  if (self->_scene) {
    BOOL v11 = self->_homeScene == 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL IsHidden = PBUIWallpaperStyleIsHidden(self->_lockWallpaperStyle);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke;
  v28[3] = &unk_1E62B4978;
  BOOL v29 = v11;
  v28[5] = a3;
  v28[6] = activeVariant;
  BOOL v30 = v7;
  *(double *)&v28[7] = unlockProgress;
  BOOL v31 = IsHidden;
  BOOL v32 = wakeSourceIsSwipeToUnlock;
  v28[4] = self;
  uint64_t v13 = (void *)MEMORY[0x1C1872570](v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_59;
  v26[3] = &unk_1E62B49A0;
  id v14 = v13;
  v26[4] = self;
  id v27 = v14;
  v15 = (void *)MEMORY[0x1C1872570](v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_2;
  v24[3] = &unk_1E62B49A0;
  id v16 = v14;
  v24[4] = self;
  id v25 = v16;
  v17 = (void *)MEMORY[0x1C1872570](v24);
  scene = self->_scene;
  if (v7)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_3;
    v22 = &unk_1E62B49C8;
    v23 = v6;
    [(FBScene *)scene pb_activate:v15 withCompletion:&v19];
    -[FBScene pb_activate:](self->_homeScene, "pb_activate:", v17, v19, v20, v21, v22);
  }
  else
  {
    [(FBScene *)scene pb_update:v15];
    [(FBScene *)self->_homeScene pb_update:v17];
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)_updateLockViewControllerVisibility
{
  int v3 = BSFloatLessThanFloat();
  int64_t activeVariant = self->_activeVariant;
  BOOL v5 = [(PBUIPosterViewController *)self _homeScreenConfigurationRequiresPosterContent];
  if (activeVariant != 1) {
    int v3 = 1;
  }
  id v6 = [(PBUIPosterLockViewController *)self->_lockViewController view];
  [v6 setHidden:(v3 | v5) ^ 1u];
}

- (void)_updateLegibilitySettings:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained posterComponent:self didUpdateLegibilitySettings:v6];
  }
}

- (void)_updateLandscapeBlur
{
  if ((soft_PUIDynamicRotationIsActive() & 1) == 0)
  {
    [(PBUIPosterVariantViewController *)self->_lockViewController setBlurEnabled:self->_landscapeBlurEnabled];
    if (![(PBUIPosterViewController *)self homeScreenReflectsLockScreen])
    {
      homeViewController = self->_homeViewController;
      BOOL landscapeBlurEnabled = self->_landscapeBlurEnabled;
      [(PBUIPosterVariantViewController *)homeViewController setBlurEnabled:landscapeBlurEnabled];
    }
  }
}

void __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 64) || objc_msgSend(v8, "pb_activeVariant") == *(void *)(a1 + 48))
  {
    char v11 = 0;
    char v12 = *(unsigned char *)(a1 + 65) ^ 1;
  }
  else
  {
    char v12 = 1;
    char v11 = 1;
  }
  [v8 setJetsamMode:v12];
  if (!objc_msgSend(v8, "pb_activeVariant")) {
    objc_msgSend(v8, "pr_setUnlockProgress:", *(double *)(a1 + 56));
  }
  uint64_t v13 = objc_msgSend(v8, "pr_posterConfiguredProperties");
  id v14 = [v13 renderingConfiguration];
  char v15 = [v14 isDepthEffectDisabled];

  BOOL v16 = (v15 & 1) != 0 || *(unsigned char *)(a1 + 66) != 0;
  objc_msgSend(v8, "pr_setDepthEffectDisallowed:", v16);
  objc_msgSend(v8, "pr_setWakeSourceIsSwipeToUnlock:", *(unsigned __int8 *)(a1 + 67));
  char IsActive = soft_PUIDynamicRotationIsActive();
  uint64_t v18 = *(void *)(a1 + 32);
  if (IsActive)
  {
    uint64_t v19 = *(void *)(v18 + 1136);
    uint64_t v20 = objc_msgSend(v8, "pui_deviceOrientation");
    if (!v20) {
      uint64_t v20 = [v8 interfaceOrientation];
    }
    if (v20 != v19)
    {
      objc_msgSend(v8, "pui_setDeviceOrientation:", v19);
      v10 |= 0x40uLL;
    }
  }
  else
  {
    uint64_t v21 = *(void *)(v18 + 1128);
    if ([v8 interfaceOrientation] != v21)
    {
      [v8 setInterfaceOrientation:v21];
      v10 |= 0x20uLL;
    }
  }
  if ((v10 & 0x61) == 0 || v9 == 0) {
    char v23 = 1;
  }
  else {
    char v23 = v11;
  }
  if ((v23 & 1) != 0 || ![v7 isActive])
  {
    v26 = PBUIRenderingLogFenceReason();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v32 = NSStringFrom_PBUIPosterViewControllerUpdateReasons(v10);
      int v33 = 138543362;
      v34 = v32;
      _os_log_impl(&dword_1BC4B3000, v26, OS_LOG_TYPE_DEFAULT, "Poster scenes un-fenced update for reasons: %{public}@", (uint8_t *)&v33, 0xCu);
    }
  }
  else
  {
    v24 = [*(id *)(a1 + 32) view];
    id v25 = [v24 window];
    v26 = [v25 windowScene];

    [v26 _synchronizeDrawing];
    id v27 = [v26 _synchronizedDrawingFence];
    [v9 setAnimationFence:v27];

    v28 = (void *)MEMORY[0x1E4F4F680];
    [MEMORY[0x1E4F42FF0] inheritedAnimationDuration];
    BOOL v29 = objc_msgSend(v28, "settingsWithDuration:");
    [v9 setAnimationSettings:v29];

    BOOL v30 = PBUIRenderingLogFenceReason();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v31 = NSStringFrom_PBUIPosterViewControllerUpdateReasons(v10);
      int v33 = 138543362;
      v34 = v31;
      _os_log_impl(&dword_1BC4B3000, v30, OS_LOG_TYPE_DEFAULT, "Poster scenes FENCED update for reasons: %{public}@", (uint8_t *)&v33, 0xCu);
    }
  }
}

- (BOOL)homeScreenReflectsLockScreen
{
  return !self->_homeScene && [(PBUIPosterHomeViewController *)self->_homeViewController reflectsLock];
}

- (BOOL)_homeScreenConfigurationRequiresPosterContent
{
  int v3 = [(FBScene *)self->_scene settings];
  v4 = objc_msgSend(v3, "pr_posterConfiguredProperties");
  BOOL v5 = [v4 homeScreenConfiguration];

  if (v5 || ![(FBScene *)self->_scene pui_isLegacyProvider])
  {
    switch([v5 selectedAppearanceType])
    {
      case 0:
        id v8 = [v5 lockPosterAppearance];
        goto LABEL_11;
      case 1:
        id v9 = [v5 solidColorAppearance];
        uint64_t v10 = [v9 effectiveColor];

        if (!v10) {
          goto LABEL_12;
        }
        goto LABEL_9;
      case 2:
        char v11 = [v5 gradientAppearance];

        if (!v11) {
          goto LABEL_12;
        }
LABEL_9:
        char v7 = 0;
        break;
      case 3:
        id v8 = [v5 homePosterAppearance];
LABEL_11:
        char v12 = v8;
        [v8 isLegibilityBlurEnabled];

        goto LABEL_12;
      default:
LABEL_12:
        char v7 = 1;
        break;
    }
  }
  else
  {
    id v6 = [(PBUIPosterViewController *)self _legacyWallpaperConfigurationManager];
    char v7 = [v6 variantsShareWallpaperConfiguration];
  }
  return v7;
}

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  v4 = [(PBUIPosterViewController *)self delegate];
  BOOL v5 = [v4 posterComponentExternalDisplayConfiguration:self];

  return v5;
}

- (PBUIPosterComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIPosterComponentDelegate *)WeakRetained;
}

- (int64_t)activeStyleForVariant:(int64_t)a3
{
  int v3 = [(PBUIPosterViewController *)self _viewControllerForVariant:a3];
  int64_t v4 = [v3 activeStyle];

  return v4;
}

- (id)_viewControllerForVariant:(int64_t)a3
{
  int v3 = &OBJC_IVAR___PBUIPosterViewController__homeViewController;
  if (!a3) {
    int v3 = &OBJC_IVAR___PBUIPosterViewController__lockViewController;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_59(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 1008), a2, a3);
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProvider];
}

- (id)snapshotSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  id v4 = a3;
  shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  if (!shouldRasterizeWallpaperAssertion)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __68__PBUIPosterViewController_requireWallpaperRasterizationWithReason___block_invoke;
    id v14 = &unk_1E62B2800;
    objc_copyWeak(&v15, &location);
    char v7 = [v6 assertionWithIdentifier:@"requireWallpaperRasterization" stateDidChangeHandler:&v11];
    id v8 = self->_shouldRasterizeWallpaperAssertion;
    self->_shouldRasterizeWallpaperAssertion = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  }
  id v9 = -[BSCompoundAssertion acquireForReason:](shouldRasterizeWallpaperAssertion, "acquireForReason:", v4, v11, v12, v13, v14);

  return v9;
}

- (void)updatePoster:(id)a3
{
  (*((void (**)(id, PBUIPosterViewController *))a3 + 2))(a3, self);
  [(PBUIPosterViewController *)self _updateForActiveVariant:0];
}

- (void)setActivelyRequired:(BOOL)a3
{
  self->_activelyRequired = a3;
}

- (void)setActiveStyle:(int64_t)a3 forVariant:(int64_t)a4
{
  if (!a4) {
    self->_lockWallpaperStyle = a3;
  }
  id v6 = [(PBUIPosterViewController *)self _viewControllerForVariant:a4];
  [v6 setActiveStyle:a3];

  [(PBUIPosterViewController *)self _updateForActiveVariant:2];
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  int v3 = [(PBUIPosterViewController *)self _viewControllerForVariant:a3];
  id v4 = [v3 legibilitySettings];

  return v4;
}

- (PBUIPosterViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PBUIPosterViewController;
  v2 = [(PBUIPosterViewController *)&v15 init];
  int v3 = v2;
  if (v2)
  {
    v2->_activelyRequired = 0;
    v2->_activeStyle = 0;
    v2->_int64_t activeVariant = -1;
    v2->_activeOrientation = 1;
    v2->_deviceOrientation = 0;
    id v4 = objc_alloc_init(PBUIDefaultSessionReconnectPolicy);
    reconnectPolicy = v3->_reconnectPolicy;
    v3->_reconnectPolicy = (PBUISessionReconnectPolicy *)v4;

    v3->_double unlockProgress = -1.0;
    v3->_BOOL landscapeBlurEnabled = 0;
    v3->_lockWallpaperStyle = 0;
    v3->_homeScreenUpdateLock._os_unfair_lock_opaque = 0;
    id v6 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:0 portalProvider:&__block_literal_global_22 snapshotProvider:&__block_literal_global_5_0];
    lockReplicaProvider = v3->_lockReplicaProvider;
    v3->_lockReplicaProvider = v6;

    id v8 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:0 portalProvider:&__block_literal_global_8_0 snapshotProvider:&__block_literal_global_11_0];
    homeReplicaProvider = v3->_homeReplicaProvider;
    v3->_homeReplicaProvider = v8;

    uint64_t v10 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:0 portalProvider:&__block_literal_global_13 snapshotProvider:0];
    lockFloatingLayerReplicaProvider = v3->_lockFloatingLayerReplicaProvider;
    v3->_lockFloatingLayerReplicaProvider = v10;

    uint64_t v12 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:0 portalProvider:&__block_literal_global_16_0 snapshotProvider:&__block_literal_global_19_0];
    activeVariantReplicaProvider = v3->_activeVariantReplicaProvider;
    v3->_activeVariantReplicaProvider = v12;
  }
  return v3;
}

uint64_t __32__PBUIPosterViewController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 portalSourceProvider];
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProvider];
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 portalSourceProvider];
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProvider];
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 portalProviderForFloatingLayer];
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 portalSourceProvider];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_shouldRasterizeWallpaperAssertion invalidate];
  shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  self->_shouldRasterizeWallpaperAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterViewController;
  [(PBUIPosterViewController *)&v4 dealloc];
}

- (BOOL)updateConfiguration:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  configuration = self->_configuration;
  if (configuration)
  {
    id v6 = [(PRSPosterConfiguration *)configuration _path];
    char v7 = [v26 _path];
    id v8 = [v6 serverIdentity];
    id v9 = [v7 serverIdentity];
    uint64_t v10 = [v8 posterUUID];
    uint64_t v11 = [v9 posterUUID];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      uint64_t v13 = [v9 version];
      LOBYTE(v13) = v13 == [v8 version];
      id v14 = PBUILogCommon();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          BOOL v16 = [(FBScene *)self->_scene pui_shortDescription];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v16;
          _os_log_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_DEFAULT, "Refreshing lock poster %{public}@.", buf, 0xCu);
        }
      }
      else if (v15)
      {
        v22 = [(FBScene *)self->_scene pui_shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v8 version];
        *(_WORD *)&buf[22] = 2048;
        uint64_t v34 = [v9 version];
        _os_log_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_DEFAULT, "Updating lock poster %{public}@ from version %llu to %llu.", buf, 0x20u);
      }
      scene = self->_scene;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke_27;
      v27[3] = &unk_1E62B48C0;
      v27[4] = self;
      id v28 = v7;
      [(FBScene *)scene pb_update:v27];
    }
    else
    {
      uint64_t v21 = PBUILogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, "Cannot update to proposed poster configuration.", buf, 2u);
      }
    }
    if (!v12)
    {
      BOOL v24 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke;
    v30[3] = &unk_1E62B4898;
    objc_copyWeak(&v31, &location);
    v30[4] = buf;
    v17 = (void (**)(void))MEMORY[0x1C1872570](v30);
    v17[2]();
    if (!self->_scene)
    {
      uint64_t v18 = PBUILogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v29 = 0;
        _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_DEFAULT, "Failed to create new poster scene. Trying again.", v29, 2u);
      }

      *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
      ((void (*)(void (**)(void)))v17[2])(v17);
    }
    uint64_t v19 = [(PBUIPosterVariantViewController *)[PBUIPosterLockViewController alloc] initWithScene:self->_scene counterpart:0];
    lockViewController = self->_lockViewController;
    self->_lockViewController = v19;

    [(PBUIPosterVariantViewController *)self->_lockViewController setDelegate:self];
    [(PBUIPosterViewController *)self setActiveStyle:self->_lockWallpaperStyle forVariant:0];
    [(PBUIPosterViewController *)self bs_addChildViewController:self->_lockViewController];
    [(PBUIPosterViewController *)self _createHomeViewControllerIfNeeded];
    [(PBUIPosterViewController *)self _updateLockViewControllerVisibility];
    [(PBUIDynamicProviderWrapper *)self->_lockReplicaProvider setRootObject:self->_lockViewController];
    [(PBUIDynamicProviderWrapper *)self->_lockFloatingLayerReplicaProvider setRootObject:self->_lockViewController];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  [(PBUIPosterViewController *)self _updateForActiveVariant:1];
  BOOL v24 = 1;
LABEL_20:

  return v24;
}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = (void *)MEMORY[0x1E4F62488];
    objc_super v4 = getPUISceneRoleRendering();
    BOOL v5 = [WeakRetained[122] _path];
    id v6 = objc_msgSend(v3, "pr_createPosterSceneWithRole:path:", v4, v5);

    [v6 setDelegate:WeakRetained];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke_2;
    v9[3] = &unk_1E62B3598;
    v9[4] = WeakRetained;
    objc_msgSend(v6, "pb_update:", v9);
    objc_storeStrong(WeakRetained + 126, v6);
    if (v6)
    {
      char v7 = PBUILogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_msgSend(v6, "pui_shortDescription");
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v8;
        _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Created new poster scene: %@", buf, 0xCu);
      }
    }
    else
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
LABEL_9:

        goto LABEL_10;
      }
      char v7 = PBUILogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create new poster scene again.", buf, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [MEMORY[0x1E4F62420] mainConfiguration];
  uint64_t v4 = 1;
  [v7 setForeground:1];
  [v3 bounds];
  objc_msgSend(v7, "setFrame:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1128);
  if (soft_PUIDynamicRotationIsActive()) {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1136);
  }
  [v7 setInterfaceOrientation:v5];
  objc_msgSend(v7, "pui_setDeviceOrientation:", v4);
  [v7 setDisplayConfiguration:v3];
  id v6 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  [v7 setActivityMode:4294967293];
  objc_msgSend(v7, "pb_setActiveVariant:", 0);
  objc_msgSend(v7, "pb_applyLegacySettings");
}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(v6, "pr_posterConfiguredProperties");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1008), "pr_updateWithPath:inSettings:", *(void *)(a1 + 40), v6);
  objc_msgSend(v6, "pb_applyLegacySettings");
  id v8 = objc_msgSend(v6, "pr_posterConfiguredProperties");

  id v9 = [v7 homeScreenConfiguration];
  uint64_t v10 = [v8 homeScreenConfiguration];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = PBUILogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1008), "pui_shortDescription");
      int v14 = 138543362;
      BOOL v15 = v13;
      _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_DEFAULT, "Home appearance changed for %{public}@.", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(v5, "pb_setHomeAppearanceChanged:", 1);
    [*(id *)(a1 + 32) _updateLockViewControllerVisibility];
  }
}

- (BOOL)updateAssociatedPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_associatedConfiguration, a3);
  return [(PBUIPosterViewController *)self updateHomeScene];
}

- (BOOL)updateHomeScene
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v3 = [(FBScene *)self->_homeScene settings];
  uint64_t v4 = objc_msgSend(v3, "pui_posterContents");

  id v5 = [(PRSPosterConfiguration *)self->_configuration pr_loadHomeScreenConfigurationWithError:0];
  if ([v5 selectedAppearanceType] == 3
    && ([(PRSPosterConfiguration *)self->_associatedConfiguration _path],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = v6;
    BOOL v8 = 1;
  }
  else
  {
    if ([(FBScene *)self->_scene pui_isLegacyProvider])
    {
      id v9 = [(PBUIPosterViewController *)self _legacyWallpaperConfigurationManager];
      if ([v9 variantsShareWallpaperConfiguration])
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = [(PRSPosterConfiguration *)self->_configuration _path];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    BOOL v8 = v7 != 0;
    if (!(v4 | v7))
    {
      BOOL v51 = 0;
      goto LABEL_29;
    }
  }
  uint64_t v10 = [(id)v4 serverIdentity];
  char v11 = [(id)v7 serverIdentity];
  v63 = v10;
  v64 = v11;
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v12 = [v10 posterUUID];
  uint64_t v13 = [v11 posterUUID];
  int v14 = [v12 isEqual:v13];

  char v11 = v64;
  if (!v14)
  {
LABEL_20:
    homeScene = self->_homeScene;
LABEL_21:
    [(FBScene *)homeScene pui_invalidateWithCompletion:0];
    uint64_t v34 = self->_homeScene;
    self->_homeScene = 0;

    [(PBUIPosterVariantViewController *)self->_homeViewController invalidate];
    [(PBUIPosterViewController *)self bs_removeChildViewController:self->_homeViewController];
    homeViewController = self->_homeViewController;
    self->_homeViewController = 0;

    [(PBUIPosterVariantViewController *)self->_lockViewController setCounterpart:0];
    if (v8)
    {
      v36 = (void *)MEMORY[0x1E4F62488];
      v37 = getPUISceneRoleRendering();
      objc_msgSend(v36, "pr_createPosterSceneWithRole:path:", v37, v7);
      v38 = (FBScene *)objc_claimAutoreleasedReturnValue();
      v39 = self->_homeScene;
      self->_homeScene = v38;

      [(FBScene *)self->_homeScene setDelegate:self];
      v40 = [PBUIPosterVariantPathProvider alloc];
      v41 = [(id)v7 instanceURL];
      v42 = [(PBUIPosterVariantPathProvider *)v40 initWithInstanceURL:v41 variant:1];

      v43 = [PBUIURLBackedSnapshotSource alloc];
      v44 = +[PBUIPosterVariantViewController snapshotFormat];
      v45 = [(PBUIURLBackedSnapshotSource *)v43 initWithPathProvider:v42 format:v44];

      v46 = [(PBUIURLBackedSnapshotSource *)v45 posterPreferredProminentColor];
      if (v46
        || ([(PRSPosterConfiguration *)self->_configuration pr_suggestedTintColor],
            (v46 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v47 = self->_homeScene;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_2;
        v66[3] = &unk_1E62B3628;
        id v48 = v46;
        id v67 = v48;
        [(FBScene *)v47 configureParameters:v66];
      }
      else
      {
        id v48 = 0;
      }
      v49 = self->_homeScene;
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_4;
      v65[3] = &unk_1E62B3598;
      v65[4] = self;
      [(FBScene *)v49 pb_update:v65];

      char v11 = v64;
    }
    [(PBUIPosterViewController *)self _updateLockViewControllerVisibility];
    [(PBUIPosterViewController *)self _createHomeViewControllerIfNeeded];
    v50 = v63;
    goto LABEL_27;
  }
  v62 = v5;
  uint64_t v15 = [v64 version];
  uint64_t v16 = [v10 version];
  v17 = [(id)v4 contentsURL];
  uint64_t v18 = [(id)v7 contentsURL];
  int v19 = [v17 isEqual:v18];

  if (v15 == v16)
  {
    id v5 = v62;
    if ((v19 & 1) == 0)
    {
      uint64_t v20 = PBUILogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(PBUIPosterViewController *)v20 updateHomeScene];
      }
    }
    id v28 = PBUILogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = [(FBScene *)self->_scene pui_shortDescription];
      *(_DWORD *)buf = 138543362;
      v71 = v29;
      BOOL v30 = "Refreshing home poster %{public}@.";
      id v31 = v28;
      uint32_t v32 = 12;
LABEL_36:
      _os_log_impl(&dword_1BC4B3000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
  }
  else
  {
    id v5 = v62;
    if (v19)
    {
      v53 = PBUILogCommon();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        [(PBUIPosterViewController *)v53 updateHomeScene];
      }
    }
    id v28 = PBUILogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = [(FBScene *)self->_scene pui_shortDescription];
      *(_DWORD *)buf = 138543874;
      v71 = v29;
      __int16 v72 = 2048;
      uint64_t v73 = [v63 version];
      __int16 v74 = 2048;
      uint64_t v75 = [v64 version];
      BOOL v30 = "Updating home poster %{public}@ from version %llu to %llu.";
      id v31 = v28;
      uint32_t v32 = 32;
      goto LABEL_36;
    }
  }

  v61 = self->_homeScene;
  if (!v61)
  {
    homeScene = 0;
    char v11 = v64;
    goto LABEL_21;
  }
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke;
  v68[3] = &unk_1E62B48C0;
  v68[4] = self;
  id v69 = (id)v7;
  [(FBScene *)v61 pb_update:v68];

  v50 = v63;
  char v11 = v64;
LABEL_27:

  BOOL v51 = 1;
LABEL_29:

  return v51;
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 1016);
  id v7 = a3;
  id v6 = a2;
  objc_msgSend(v5, "pr_updateWithPath:inSettings:", v4, v6);
  objc_msgSend(v6, "pb_applyLegacySettings");

  objc_msgSend(v7, "pb_setHomeAppearanceChanged:", 1);
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_3;
  v3[3] = &unk_1E62B48E8;
  id v4 = *(id *)(a1 + 32);
  [a2 updateClientSettingsWithBlock:v3];
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 BSColor];
  objc_msgSend(v3, "pr_setPreferredProminentColor:", v4);
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [MEMORY[0x1E4F62420] mainConfiguration];
  uint64_t v4 = 1;
  [v6 setForeground:1];
  [v3 bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setInterfaceOrientation:*(void *)(*(void *)(a1 + 32) + 1128)];
  if (soft_PUIDynamicRotationIsActive()) {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1136);
  }
  objc_msgSend(v6, "pui_setDeviceOrientation:", v4);
  [v6 setDisplayConfiguration:v3];
  id v5 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v6, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  [v6 setActivityMode:4294967293];
  objc_msgSend(v6, "pb_setActiveVariant:", 1);
  objc_msgSend(v6, "pb_applyLegacySettings");
}

- (void)activateWithCompletion:(id)a3
{
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3
{
  -[PBUIPosterHomeViewController noteWillRotateToInterfaceOrientation:](self->_homeViewController, "noteWillRotateToInterfaceOrientation:");
  [(PBUIPosterVariantViewController *)self->_lockViewController noteWillRotateToInterfaceOrientation:a3];
  self->_deviceOrientation = a3;
  scene = self->_scene;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PBUIPosterViewController_willRotateToInterfaceOrientation___block_invoke;
  v6[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
  v6[4] = a3;
  [(FBScene *)scene pb_update:v6];
}

void __61__PBUIPosterViewController_willRotateToInterfaceOrientation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (soft_PUIDynamicRotationIsActive()) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 1;
  }
  objc_msgSend(v5, "pui_setDeviceOrientation:", v4);
}

- (void)didRotateToInterfaceOrientation:(int64_t)a3
{
  -[PBUIPosterHomeViewController noteDidRotateToInterfaceOrientation:](self->_homeViewController, "noteDidRotateToInterfaceOrientation:");
  lockViewController = self->_lockViewController;
  [(PBUIPosterVariantViewController *)lockViewController noteDidRotateToInterfaceOrientation:a3];
}

- (void)finishUnlockWithAnimationParameters:(CGSize)a3
{
  scene = self->_scene;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PBUIPosterViewController_finishUnlockWithAnimationParameters___block_invoke;
  v4[3] = &unk_1E62B4930;
  CGSize v5 = a3;
  v4[4] = self;
  [(FBScene *)scene pb_update:v4];
}

uint64_t __64__PBUIPosterViewController_finishUnlockWithAnimationParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3) {
    return objc_msgSend(a3, "pr_setFinishUnlockParameters:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  *(void *)(*(void *)(a1 + 32) + 1144) = 0x3FF0000000000000;
  return objc_msgSend(a2, "pr_setUnlockProgress:", 1.0);
}

- (id)averageColorForVariant:(int64_t)a3
{
  id v3 = [(PBUIPosterViewController *)self _viewControllerForVariant:a3];
  uint64_t v4 = [v3 averageColor];

  return v4;
}

- (double)averageContrastForVariant:(int64_t)a3
{
  id v3 = [(PBUIPosterViewController *)self _viewControllerForVariant:a3];
  [v3 averageContrast];
  double v5 = v4;

  return v5;
}

- (id)scenesForBacklightSession
{
  if (self->_scene)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)noteUserTapOccurred
{
}

- (void)noteUserTapOccurredWithLocation:(CGPoint)a3
{
}

- (BOOL)userTapEventsRequested
{
  id v3 = [(FBScene *)self->_scene clientSettings];
  uint64_t v4 = objc_msgSend(v3, "pui_significantEventOptions");

  if (soft_PUIPosterSignificantEventOptionsContainsEvent(v4, 2)) {
    return 1;
  }
  id v6 = [(FBScene *)self->_scene clientSettings];
  char v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  return v7;
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  scene = self->_scene;
  id v5 = a3;
  id v6 = [(FBScene *)scene pui_posterPath];
  char v7 = [v6 serverIdentity];

  BOOL v8 = [v7 posterUUID];
  int v9 = [v8 isEqual:v5];

  if (v9)
  {
    uint64_t v10 = [(FBScene *)self->_scene settings];
    unint64_t v11 = objc_msgSend(v10, "pb_significantEventsCounter");
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)posterSignificantEventsCounter
{
  v2 = [(FBScene *)self->_scene settings];
  unint64_t v3 = objc_msgSend(v2, "pb_significantEventsCounter");

  return v3;
}

- (void)updateLegacyPoster
{
}

- (BOOL)handlesWakeAnimation
{
  v2 = [(FBScene *)self->_scene clientSettings];
  char v3 = objc_msgSend(v2, "pr_handlesWakeAnimation");

  return v3;
}

- (BOOL)hidesDimmingLayer
{
  v2 = [(FBScene *)self->_scene clientSettings];
  char v3 = objc_msgSend(v2, "pr_hideDimmingLayer");

  return v3;
}

- (void)setWallpaperObscured:(BOOL)a3
{
  scene = self->_scene;
  if (scene)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__PBUIPosterViewController_setWallpaperObscured___block_invoke;
    v4[3] = &__block_descriptor_33_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    BOOL v5 = a3;
    [(FBScene *)scene pb_update:v4];
  }
}

uint64_t __49__PBUIPosterViewController_setWallpaperObscured___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setWallpaperObscured:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setUnlockProgress:(double)a3
{
  if (self->_unlockProgress != a3)
  {
    int IsOne = BSFloatIsOne();
    int v6 = BSFloatIsOne();
    self->_double unlockProgress = a3;
    if (IsOne != v6) {
      [(PBUIPosterViewController *)self _updateLockViewControllerVisibility];
    }
    [(PBUIPosterViewController *)self _updateHomeViewControllerVisibility];
  }
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(FBScene *)self->_scene pui_invalidateWithCompletion:0];
  [(FBScene *)self->_homeScene pui_invalidateWithCompletion:0];
  [(PBUIPosterLockViewController *)self->_lockViewController invalidate];
  [(PBUIPosterVariantViewController *)self->_homeViewController invalidate];
  [(PBUIDynamicProviderWrapper *)self->_lockReplicaProvider invalidate];
  [(PBUIDynamicProviderWrapper *)self->_homeReplicaProvider invalidate];
  [(PBUIDynamicProviderWrapper *)self->_lockFloatingLayerReplicaProvider invalidate];
  activeVariantReplicaProvider = self->_activeVariantReplicaProvider;
  [(PBUIDynamicProviderWrapper *)activeVariantReplicaProvider invalidate];
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  id v5 = a3;
  homeViewController = self->_homeViewController;
  if (homeViewController || (homeViewController = self->_lockViewController) != 0)
  {
    id v8 = v5;
    [homeViewController fetchWallpaperProminentColor:v5];
  }
  else
  {
    char v7 = [NSString stringWithFormat:@"lockViewController/homeViewController is nil!"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(PBUIPosterViewController *)a2 fetchWallpaperProminentColor:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_homeViewController)
  {
    v2 = [(PBUIPosterHomeViewController *)self->_homeViewController currentHomeVariantStyleState];
  }
  else
  {
    configuration = self->_configuration;
    if (configuration)
    {
      id v8 = 0;
      uint64_t v4 = [(PRSPosterConfiguration *)configuration pr_loadHomeScreenConfigurationWithError:&v8];
      id v5 = v8;
      if (v5)
      {
        int v6 = PBUILogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v10 = v5;
          _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Error loading home screen configuration: %{public}@", buf, 0xCu);
        }

        v2 = 0;
      }
      else
      {
        v2 = PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(v4);
      }
    }
    else
    {
      v2 = 0;
    }
  }
  return (PBUIHomeVariantStyleState *)v2;
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = self->_configuration;
  if (v7)
  {
    id PRSPosterUpdaterClass = getPRSPosterUpdaterClass();
    int v9 = [(PRSPosterConfiguration *)v7 _path];
    id v10 = [PRSPosterUpdaterClass updaterForPath:v9];

    LODWORD(a4) = [v10 applyUpdatesLocally:v6 error:a4];
    if (a4) {
      [(PBUIPosterHomeViewController *)self->_homeViewController noteHomeVariantStyleStateMayHaveUpdated];
    }
  }
  else if (a4)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28588];
    v15[0] = @"No poster set; cannot updateCurrentPosterWithUpdates:error:";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v11 errorWithDomain:@"com.apple.PaperBoardUI" code:-1 userInfo:v12];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  homeViewController = self->_homeViewController;
  if (homeViewController)
  {
    homeViewController = [homeViewController acquireDuckHomeScreenWallpaperDimAssertionWithReason:a3];
  }
  return homeViewController;
}

- (id)_activeViewController
{
  p_homeViewController = (id *)&self->_homeViewController;
  if ([(PBUIPosterHomeViewController *)self->_homeViewController reflectsLock]) {
    goto LABEL_4;
  }
  int64_t activeVariant = self->_activeVariant;
  if (activeVariant == 1)
  {
LABEL_5:
    id v5 = *p_homeViewController;
    goto LABEL_6;
  }
  if (!activeVariant)
  {
LABEL_4:
    p_homeViewController = (id *)&self->_lockViewController;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_6:
  return v5;
}

- (id)_replicaProviderForVariant:(int64_t)a3
{
  char v3 = &OBJC_IVAR___PBUIPosterViewController__homeReplicaProvider;
  if (!a3) {
    char v3 = &OBJC_IVAR___PBUIPosterViewController__lockReplicaProvider;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_updateHomeViewControllerVisibility
{
}

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 1016), a2, a3);
}

- (void)_createHomeViewControllerIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_homeViewController)
  {
    char v3 = [(PBUIPosterVariantViewController *)[PBUIPosterHomeViewController alloc] initWithScene:self->_homeScene counterpart:self->_lockViewController];
    homeViewController = self->_homeViewController;
    self->_homeViewController = v3;

    [(PBUIPosterVariantViewController *)self->_lockViewController setCounterpart:self->_homeViewController];
    [(PBUIPosterViewController *)self bs_addChildViewController:self->_homeViewController];
    [(PBUIPosterVariantViewController *)self->_homeViewController setDelegate:self];
    [(PBUIDynamicProviderWrapper *)self->_homeReplicaProvider setRootObject:self->_homeViewController];
    id v5 = PBUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FBScene *)self->_homeScene pui_shortDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Created new home poster scene: %@", (uint8_t *)&v7, 0xCu);
    }
    [(PBUIPosterViewController *)self _updateForActiveVariant:16];
  }
}

- (id)_legacyWallpaperConfigurationManager
{
  lazy_legacyWallpaperConfigurationManager = self->_lazy_legacyWallpaperConfigurationManager;
  if (!lazy_legacyWallpaperConfigurationManager)
  {
    uint64_t v4 = objc_alloc_init(PBUIWallpaperConfigurationManager);
    id v5 = self->_lazy_legacyWallpaperConfigurationManager;
    self->_lazy_legacyWallpaperConfigurationManager = v4;

    lazy_legacyWallpaperConfigurationManager = self->_lazy_legacyWallpaperConfigurationManager;
  }
  return lazy_legacyWallpaperConfigurationManager;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterViewController;
  [(PBUIPosterViewController *)&v4 viewDidLoad];
  char v3 = [(PBUIPosterViewController *)self view];
  [v3 setAutoresizingMask:18];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PBUIPosterViewController;
  [(PBUIPosterViewController *)&v7 viewWillLayoutSubviews];
  char v3 = [(PBUIPosterViewController *)self view];
  objc_super v4 = [(PBUIPosterLockViewController *)self->_lockViewController view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");

  id v5 = [(PBUIPosterHomeViewController *)self->_homeViewController view];
  [v3 bounds];
  objc_msgSend(v5, "setFrame:");

  id v6 = [(PBUIPosterHomeViewController *)self->_homeViewController view];
  [v3 bringSubviewToFront:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterViewController;
  [(PBUIPosterViewController *)&v6 traitCollectionDidChange:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PBUIPosterViewController_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E62B3598;
  v5[4] = self;
  objc_super v4 = (void *)MEMORY[0x1C1872570](v5);
  [(FBScene *)self->_scene pb_update:v4];
  [(FBScene *)self->_homeScene pb_update:v4];
}

void __53__PBUIPosterViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [a4 processHandle];
  objc_super v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(v5, "pui_shortDescription");
    uint64_t v9 = objc_msgSend(v6, "pb_shortDesc");
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ now connected to %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Poster received actions: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend(v6, "pui_shortDescription");
    int v10 = [v7 descriptionWithMultilinePrefix:0];
    *(_DWORD *)buf = 138543618;
    double v18 = *(double *)&v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Poster %{public}@ deactivated with error: %{public}@", buf, 0x16u);
  }
  [(PBUISessionReconnectPolicy *)self->_reconnectPolicy sessionDidDisconnect];
  if ([(PBUIPosterViewController *)self _appearState])
  {
    [(PBUISessionReconnectPolicy *)self->_reconnectPolicy sessionReconnectDelay];
    double v12 = v11;
    uint64_t v13 = PBUILogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v18 = v12;
      _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_DEFAULT, "Will attempt reactivation of wallpaper scene in %0.3f seconds.", buf, 0xCu);
    }

    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PBUIPosterViewController_sceneDidDeactivate_withError___block_invoke;
    block[3] = &unk_1E62B2798;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v15 = PBUILogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "Not attempting reactivation of wallpaper scene at this time.", buf, 2u);
    }
  }
}

uint64_t __57__PBUIPosterViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePosterScenesForReasons:4 completion:0];
}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (UIColor)averageColor
{
  v2 = [(PBUIPosterViewController *)self _activeViewController];
  id v3 = [v2 averageColor];

  return (UIColor *)v3;
}

- (double)averageContrast
{
  v2 = [(PBUIPosterViewController *)self _activeViewController];
  [v2 averageContrast];
  double v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings)
  {
    double v3 = legibilitySettings;
  }
  else
  {
    double v4 = [(PBUIPosterViewController *)self _activeViewController];
    double v3 = [v4 legibilitySettings];
  }
  return v3;
}

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  id v7 = a4;
  int64_t activeVariant = self->_activeVariant;
  if (activeVariant == [a3 variant]) {
    [(PBUIPosterViewController *)self _updateLegibilitySettings:v7];
  }
}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PBUIPosterViewController *)self delegate];
  [v6 posterComponent:self didUpdateHideDimmingLayer:v4];
}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  id v5 = a4;
  id v6 = [(PBUIPosterViewController *)self delegate];
  [v6 posterComponent:self didUpdatePreferredProminentColor:v5];
}

- (id)portalProviderForFloatingLayer
{
  return self->_lockFloatingLayerReplicaProvider;
}

- (id)portalSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PBUIPosterViewController *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(PBUIPosterViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIPosterViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PBUIPosterViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E62B2C38;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __66__PBUIPosterViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1112) withName:@"activelyRequired"];
  double v3 = *(void **)(a1 + 32);
  id v4 = PBUIWallpaperStyleDescription(*(void *)(*(void *)(a1 + 40) + 1168));
  id v5 = (id)[v3 appendObject:v4 withName:@"activeStyle"];

  id v6 = *(void **)(a1 + 32);
  id v7 = PBUIStringForWallpaperVariant(*(void *)(*(void *)(a1 + 40) + 1120));
  id v8 = (id)[v6 appendObject:v7 withName:@"activeVariant"];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 1128);
  id v10 = @"UIInterfaceOrientationLandscapeRight";
  double v11 = @"UIInterfaceOrientationLandscapeLeft";
  double v12 = @"UIInterfaceOrientationPortraitUpsideDown";
  if (v9 != 2) {
    double v12 = 0;
  }
  if (v9 != 4) {
    double v11 = v12;
  }
  if (v9 != 3) {
    id v10 = v11;
  }
  if (v9 == 1) {
    uint64_t v13 = @"UIInterfaceOrientationPortrait";
  }
  else {
    uint64_t v13 = v10;
  }
  id v14 = (id)[*(id *)(a1 + 32) appendObject:v13 withName:@"activeOrientation"];
  id v15 = (id)[*(id *)(a1 + 32) appendFloat:@"unlockProgress" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 1144)];
  id v16 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1114) withName:@"landscapeBlurEnabled"];
  id v17 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 976) withName:@"configuration"];
  id v18 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"associatedConfiguration"];
  id v19 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1024) withName:@"lockController"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1064) withName:@"homeController"];
}

- (PRSPosterConfiguration)activeConfiguration
{
  return self->_configuration;
}

- (PRSPosterConfiguration)associatedConfiguration
{
  return self->_associatedConfiguration;
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (void)setActiveVariant:(int64_t)a3
{
  self->_int64_t activeVariant = a3;
}

- (int64_t)activeOrientation
{
  return self->_activeOrientation;
}

- (void)setActiveOrientation:(int64_t)a3
{
  self->_activeOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (BOOL)activelyRequired
{
  return self->_activelyRequired;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_BOOL wakeSourceIsSwipeToUnlock = a3;
}

- (BOOL)landscapeBlurEnabled
{
  return self->_landscapeBlurEnabled;
}

- (void)setLandscapeBlurEnabled:(BOOL)a3
{
  self->_BOOL landscapeBlurEnabled = a3;
}

- (void)setDelegate:(id)a3
{
}

- (BSPathProviding)storagePath
{
  return self->_storagePath;
}

- (int64_t)activeStyle
{
  return self->_activeStyle;
}

- (void)setActiveStyle:(int64_t)a3
{
  self->_activeStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeScreenUpdateLock_service, 0);
  objc_storeStrong((id *)&self->_lazy_legacyWallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_shouldRasterizeWallpaperAssertion, 0);
  objc_storeStrong((id *)&self->_homeReplicaProvider, 0);
  objc_storeStrong((id *)&self->_homeViewController, 0);
  objc_storeStrong((id *)&self->_lockFloatingLayerReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockReplicaProvider, 0);
  objc_storeStrong((id *)&self->_activeVariantReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockViewController, 0);
  objc_storeStrong((id *)&self->_homeScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_associatedConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)updateHomeScene
{
}

- (void)fetchWallpaperProminentColor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"PBUIPosterViewController.m";
  __int16 v16 = 1024;
  int v17 = 605;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end