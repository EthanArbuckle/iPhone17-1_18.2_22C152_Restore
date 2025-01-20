@interface PBUIPosterWallpaperViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)homeScreenReflectsLockScreen;
- (BOOL)posterHandlesWakeAnimation;
- (BOOL)posterHidesDimmingLayer;
- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4;
- (BOOL)userTapEventsRequested;
- (BOOL)wakeSourceIsSwipeToUnlock;
- (NSString)description;
- (PBUIHomeVariantStyleState)currentHomeVariantStyleState;
- (PBUIPosterComponentDelegate)delegate;
- (PBUIPosterWallpaperViewController)init;
- (UIColor)averageColor;
- (_UILegibilitySettings)legibilitySettings;
- (double)averageContrast;
- (double)averageContrastForVariant:(int64_t)a3;
- (double)unlockProgress;
- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3;
- (id)averageColorForVariant:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)portalProviderForFloatingLayer;
- (id)portalSourceProviderForActiveVariant;
- (id)posterComponentExternalDisplayConfiguration:(id)a3;
- (id)replicaProviderForVariant:(int64_t)a3;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)requireWallpaperWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)snapshotSourceProviderForActiveVariant;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)activeStyleForVariant:(int64_t)a3;
- (int64_t)activeVariant;
- (int64_t)variant;
- (unint64_t)posterSignificantEventsCounter;
- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3;
- (void)_posterConfigsDidChange:(id)a3 withTransition:(id)a4;
- (void)_posterControllerDidChange;
- (void)_updateStyleForVariant:(int64_t)a3;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)finishUnlockWithAnimationParameters:(CGSize)a3;
- (void)init;
- (void)invalidate;
- (void)noteHomeVariantStyleStateMayHaveUpdated;
- (void)noteUserTapOccurred;
- (void)noteUserTapOccurredWithLocation:(CGPoint)a3;
- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4;
- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4;
- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4;
- (void)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4;
- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)setActiveVariant:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setUnlockProgress:(double)a3;
- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3;
- (void)setWallpaperObscured:(BOOL)a3;
- (void)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5;
- (void)triggerSceneUpdate;
- (void)updateAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (void)updateConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (void)updateLegacyPoster;
- (void)viewDidLoad;
@end

@implementation PBUIPosterWallpaperViewController

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke(uint64_t a1, void *a2)
{
  return BSDispatchMain();
}

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  v4 = [(PBUIPosterWallpaperViewController *)self delegate];
  v5 = [v4 posterComponentExternalDisplayConfiguration:self];

  return v5;
}

- (PBUIPosterComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIPosterComponentDelegate *)WeakRetained;
}

- (int64_t)activeStyleForVariant:(int64_t)a3
{
  return [(PBUIPosterViewController *)self->_posterController activeStyleForVariant:a3];
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return [(PBUIPosterViewController *)self->_posterController requireWallpaperRasterizationWithReason:a3];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProviderForActiveVariant];
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_67(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "No longer requiring wallpaper for reason: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invalidate];
}

- (void)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v9 = PBUILogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = PBUIStringForWallpaperVariant(a5);
    v11 = PBUIWallpaperStyleDescription(a3);
    v12 = PBUIStringForWallpaperStylePriority(a4);
    int v13 = 138412802;
    v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_DEFAULT, "Setting %@ override style \"%@\" for %@", (uint8_t *)&v13, 0x20u);
  }
  self->_activeStyles[a5][a4] = a3;
  [(PBUIPosterWallpaperViewController *)self _updateStyleForVariant:a5];
}

- (id)requireWallpaperWithReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = v4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperViewController requireWallpaperWithReason:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4BB0A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperViewController requireWallpaperWithReason:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4BB104);
  }

  if (!self->_wallpaperRequiredAssertion)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke;
    v20[3] = &unk_1E62B3CD8;
    v20[4] = self;
    uint64_t v6 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"WallpaperRequired" stateDidChangeHandler:v20];
    wallpaperRequiredAssertion = self->_wallpaperRequiredAssertion;
    self->_wallpaperRequiredAssertion = v6;
  }
  v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Requiring wallpaper for reason: %@", buf, 0xCu);
  }

  v9 = [(BSCompoundAssertion *)self->_wallpaperRequiredAssertion acquireForReason:v5];
  id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_67;
  v17[3] = &unk_1E62B3D00;
  id v18 = v5;
  id v19 = v9;
  id v11 = v9;
  id v12 = v5;
  int v13 = (void *)[v10 initWithIdentifier:@"WallpaperRequired" forReason:v12 invalidationBlock:v17];

  return v13;
}

- (void)_updateStyleForVariant:(int64_t)a3
{
  id v5 = self->_activeStyles[a3];
  uint64_t v6 = 4;
  while (1)
  {
    uint64_t v7 = v5[v6];
    if (PBUIWallpaperStyleIsValid(v7)) {
      break;
    }
    if (--v6 == -1)
    {
      uint64_t v7 = 0;
      break;
    }
  }
  posterController = self->_posterController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PBUIPosterWallpaperViewController__updateStyleForVariant___block_invoke;
  v9[3] = &__block_descriptor_48_e30_v16__0___PBUIPosterUpdating__8l;
  v9[4] = v7;
  v9[5] = a3;
  [(PBUIPosterViewController *)posterController updatePoster:v9];
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = PBUILogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Wallpaper is no longer required.", buf, 2u);
    }

    char v2 = *(unsigned char *)(a1 + 40);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 984);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_64;
  v6[3] = &__block_descriptor_33_e30_v16__0___PBUIPosterUpdating__8l;
  char v7 = v2;
  return [v4 updatePoster:v6];
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_64(uint64_t a1, void *a2)
{
  return [a2 setActivelyRequired:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __60__PBUIPosterWallpaperViewController__updateStyleForVariant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActiveStyle:*(void *)(a1 + 32) forVariant:*(void *)(a1 + 40)];
}

- (id)snapshotSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return [(PBUIPosterViewController *)self->_posterController legibilitySettingsForVariant:a3];
}

- (PBUIPosterWallpaperViewController)init
{
  v31.receiver = self;
  v31.super_class = (Class)PBUIPosterWallpaperViewController;
  char v2 = [(PBUIPosterWallpaperViewController *)&v31 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_activeVariant = -1;
    id v4 = (id *)MEMORY[0x1E4F43630];
    v2->_activeOrientation = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
    v3->_unlockProgress = -1.0;
    int64x2_t v5 = vdupq_lane_s64(-1, 0);
    *(int64x2_t *)&v3->_activeStyles[0][1] = v5;
    *(int64x2_t *)&v3->_activeStyles[1][1] = v5;
    *(int64x2_t *)&v3->_activeStyles[1][3] = v5;
    *(int64x2_t *)&v3->_activeStyles[0][3] = v5;
    objc_initWeak(&location, v3);
    getPRSWallpaperLocationStateObserverClass();
    uint64_t v6 = objc_opt_new();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__PBUIPosterWallpaperViewController_init__block_invoke;
    v28[3] = &unk_1E62B3B58;
    objc_copyWeak(&v29, &location);
    [v6 setHandler:v28];
    [v6 setLocations:12];
    [v6 setNeedsSandboxExtensions:1];
    id v7 = objc_alloc_init((Class)getPRSWallpaperObserverConfigurationClass());
    [v7 setLocationStateObserver:v6];
    v8 = dispatch_get_global_queue(25, 0);
    [v7 setQueue:v8];

    id v9 = objc_alloc((Class)getPRSWallpaperObserverClass());
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIPosterWallpaperViewController-%p", v3);
    uint64_t v11 = [v9 initWithExplanation:v10];
    posterObserver = v3->_posterObserver;
    v3->_posterObserver = (PRSWallpaperObserver *)v11;

    [(PRSWallpaperObserver *)v3->_posterObserver activateWithConfiguration:v7];
    int v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LODWORD(v9) = [v13 BOOLForKey:@"PBKeepWallpaperForegroundRunning"];

    if (v9)
    {
      v14 = PBUILogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PBUIPosterWallpaperViewController init](v14);
      }

      uint64_t v15 = [(PBUIPosterWallpaperViewController *)v3 requireWallpaperWithReason:@"KeepForegroundRunning"];
      keepForegroundRunning = v3->_keepForegroundRunning;
      v3->_keepForegroundRunning = (BSInvalidatable *)v15;
    }
    __int16 v17 = objc_alloc_init(PBUIPosterViewController);
    posterController = v3->_posterController;
    v3->_posterController = v17;

    [(PBUIPosterViewController *)v3->_posterController setDelegate:v3];
    if (+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents])
    {
      -[PBUIPosterWallpaperViewController rotateToInterfaceOrientation:duration:](v3, "rotateToInterfaceOrientation:duration:", [*v4 activeInterfaceOrientation], 0.0);
    }
    id v19 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:v3->_posterController portalProvider:&__block_literal_global_12 snapshotProvider:&__block_literal_global_15];
    lockPosterReplicaProvider = v3->_lockPosterReplicaProvider;
    v3->_lockPosterReplicaProvider = v19;

    v21 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:v3->_posterController portalProvider:&__block_literal_global_17_0 snapshotProvider:&__block_literal_global_19];
    homePosterReplicaProvider = v3->_homePosterReplicaProvider;
    v3->_homePosterReplicaProvider = v21;

    uint64_t v23 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:v3->_posterController portalProvider:&__block_literal_global_21 snapshotProvider:0];
    lockFloatingLayerPosterReplicaProvider = v3->_lockFloatingLayerPosterReplicaProvider;
    v3->_lockFloatingLayerPosterReplicaProvider = v23;

    v25 = [[PBUIDynamicProviderWrapper alloc] initWithRootObject:v3->_posterController portalProvider:&__block_literal_global_23 snapshotProvider:&__block_literal_global_25];
    activeVariantReplicaProvider = v3->_activeVariantReplicaProvider;
    v3->_activeVariantReplicaProvider = v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__PBUIPosterWallpaperViewController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _posterConfigsDidChange:v6 withTransition:v5];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 portalSourceProviderForVariant:0];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProviderForVariant:0];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 portalSourceProviderForVariant:1];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 snapshotSourceProviderForVariant:1];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 portalProviderForFloatingLayer];
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 portalSourceProviderForActiveVariant];
}

- (void)setActiveVariant:(int64_t)a3
{
  if (PBUIWallpaperVariantIsValid(a3))
  {
    self->_activeVariant = a3;
    posterController = self->_posterController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__PBUIPosterWallpaperViewController_setActiveVariant___block_invoke;
    v7[3] = &unk_1E62B3B80;
    v7[4] = self;
    v7[5] = a3;
    [(PBUIPosterViewController *)posterController updatePoster:v7];
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"invalid variant"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperViewController setActiveVariant:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __54__PBUIPosterWallpaperViewController_setActiveVariant___block_invoke(uint64_t a1, void *a2)
{
  [a2 setActiveVariant:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _updateStyleForVariant:v4];
}

- (void)setUnlockProgress:(double)a3
{
  if (self->_unlockProgress == a3) {
    return;
  }
  self->_unlockProgress = a3;
  int IsZero = BSFloatIsZero();
  int IsOne = BSFloatIsOne();
  if (IsOne)
  {
    id v7 = PBUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Now all the way unlocked.";
LABEL_8:
      _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else
  {
    if (!IsZero)
    {
      if (!self->_transitioningLockState)
      {
        id v10 = [(PBUIPosterWallpaperViewController *)self requireWallpaperWithReason:@"LockUnlock"];
        transitioningLockState = self->_transitioningLockState;
        self->_transitioningLockState = v10;
      }
      int v9 = 0;
      goto LABEL_13;
    }
    id v7 = PBUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Now all the way locked.";
      goto LABEL_8;
    }
  }

  int v9 = IsZero | IsOne;
LABEL_13:
  posterController = self->_posterController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PBUIPosterWallpaperViewController_setUnlockProgress___block_invoke;
  v15[3] = &__block_descriptor_40_e30_v16__0___PBUIPosterUpdating__8l;
  *(double *)&v15[4] = a3;
  [(PBUIPosterViewController *)posterController updatePoster:v15];
  if (v9)
  {
    int v13 = self->_transitioningLockState;
    if (v13)
    {
      [(BSInvalidatable *)v13 invalidate];
      v14 = self->_transitioningLockState;
      self->_transitioningLockState = 0;
    }
  }
}

uint64_t __55__PBUIPosterWallpaperViewController_setUnlockProgress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUnlockProgress:*(double *)(a1 + 32)];
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  posterController = self->_posterController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PBUIPosterWallpaperViewController_setWakeSourceIsSwipeToUnlock___block_invoke;
  v4[3] = &__block_descriptor_33_e30_v16__0___PBUIPosterUpdating__8l;
  BOOL v5 = a3;
  [(PBUIPosterViewController *)posterController updatePoster:v4];
}

uint64_t __66__PBUIPosterWallpaperViewController_setWakeSourceIsSwipeToUnlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWakeSourceIsSwipeToUnlock:*(unsigned __int8 *)(a1 + 32)];
}

- (void)fetchWallpaperProminentColor:(id)a3
{
}

- (void)finishUnlockWithAnimationParameters:(CGSize)a3
{
}

- (void)updateConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v8)
  {
    id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperViewController updateConfiguration:withAnimationSettings:]();
    }
LABEL_15:
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4F9A14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperViewController updateConfiguration:withAnimationSettings:]();
    }
    goto LABEL_15;
  }

  p_posterController = &self->_posterController;
  if (![(PBUIPosterViewController *)self->_posterController updateConfiguration:v8])
  {
    id v10 = *p_posterController;
    [(PBUIPosterViewController *)v10 setDelegate:0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke;
    v29[3] = &unk_1E62B2C38;
    v29[4] = self;
    uint64_t v11 = v10;
    v30 = v11;
    id v12 = (void *)MEMORY[0x1C1872570](v29);
    int v13 = objc_alloc_init(PBUIPosterViewController);
    v14 = [(PBUIPosterViewController *)v13 view];
    uint64_t v15 = [(PBUIPosterWallpaperViewController *)self view];
    [v15 bounds];
    objc_msgSend(v14, "setFrame:");

    [v14 setAutoresizingMask:18];
    [v14 setAlpha:0.0];
    if (v7)
    {
      v16 = [v14 layer];
      [v16 setAllowsGroupOpacity:1];
    }
    [(PBUIPosterWallpaperViewController *)self bs_addChildViewController:v13];
    objc_storeStrong((id *)&self->_posterController, v13);
    if (+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents])
    {
      -[PBUIPosterWallpaperViewController rotateToInterfaceOrientation:duration:](self, "rotateToInterfaceOrientation:duration:", [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation], 0.0);
    }
    [(PBUIPosterViewController *)*p_posterController setDelegate:self];
    [(PBUIPosterViewController *)*p_posterController updateConfiguration:v8];
    [(PBUIPosterWallpaperViewController *)self _posterControllerDidChange];
    __int16 v17 = *p_posterController;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_2;
    v27[3] = &unk_1E62B3BE8;
    v27[4] = self;
    v28 = v11;
    id v18 = v11;
    [(PBUIPosterViewController *)v17 updatePoster:v27];
    id v19 = *p_posterController;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_3;
    v23[3] = &unk_1E62B3C60;
    v23[4] = self;
    v24 = v13;
    id v25 = v7;
    id v26 = v12;
    id v20 = v12;
    v21 = v13;
    [(PBUIPosterViewController *)v19 activateWithCompletion:v23];
  }
}

uint64_t __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(void *)(a1 + 40));
  char v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))[v3 setLandscapeBlurEnabled:(unint64_t)(*(void *)(*(void *)(a1 + 32) + 1056) - 3) < 2]; {
  [v3 setActiveVariant:*(void *)(*(void *)(a1 + 32) + 1048)];
  }
  [v3 setUnlockProgress:*(double *)(*(void *)(a1 + 32) + 1152)];
  objc_msgSend(v3, "setActiveStyle:forVariant:", objc_msgSend(*(id *)(a1 + 40), "activeStyleForVariant:", objc_msgSend(*(id *)(a1 + 40), "activeVariant")), *(void *)(*(void *)(a1 + 32) + 1048));
  [v3 setActivelyRequired:1];
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  char v2 = *(void **)(*(void *)(a1 + 32) + 984);
  if (v2 == *(void **)(a1 + 40))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F4F898];
    uint64_t v5 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_4;
    v14[3] = &unk_1E62B2798;
    id v15 = v2;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    int v9 = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_5;
    id v10 = &unk_1E62B3C38;
    id v6 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v6;
    id v13 = *(id *)(a1 + 56);
    [v4 animateWithSettings:v5 actions:v14 completion:&v7];
    objc_msgSend(*(id *)(a1 + 32), "_posterControllerDidChange", v7, v8, v9, v10, v11);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = (void *)a1[5];
  uint64_t v4 = *(void **)(v2 + 984);
  if (v4 == v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_6;
    v6[3] = &unk_1E62B3C10;
    void v6[4] = v2;
    [v4 updatePoster:v6];
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  id v3 = a2;
  objc_msgSend(v3, "setActivelyRequired:", objc_msgSend(v2, "isActive"));
}

- (void)updateAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
}

- (void)triggerSceneUpdate
{
}

- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (soft_PUIDynamicRotationIsActive())
  {
    [(PBUIPosterViewController *)self->_posterController willRotateToInterfaceOrientation:a3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke;
    v11[3] = &unk_1E62B3C88;
    v11[4] = self;
    v11[5] = a3;
    uint64_t v7 = (void *)MEMORY[0x1C1872570](v11);
  }
  else
  {
    uint64_t v7 = 0;
  }
  self->_activeOrientation = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F4F898];
  int v9 = [MEMORY[0x1E4F4F680] settingsWithDuration:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_2;
  v10[3] = &unk_1E62B2798;
  v10[4] = self;
  [v8 animateWithSettings:v9 actions:v10 completion:v7];
}

uint64_t __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) didRotateToInterfaceOrientation:*(void *)(a1 + 40)];
}

void __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  id v3 = [v2 backgroundColor];

  if (v3)
  {
    [v2 setBackgroundColor:0];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
    [v2 setBackgroundColor:v4];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 984);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_3;
  v7[3] = &unk_1E62B3C10;
  v7[4] = v5;
  [v6 updatePoster:v7];
}

void __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))[v3 setLandscapeBlurEnabled:(unint64_t)(*(void *)(*(void *)(a1 + 32) + 1056) - 3) < 2]; {
}
  }

- (void)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = PBUIStringForWallpaperVariant(a4);
    int v9 = PBUIStringForWallpaperStylePriority(a3);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Removing %@ override style for %@", (uint8_t *)&v10, 0x16u);
  }
  self->_activeStyles[a4][a3] = -1;
  [(PBUIPosterWallpaperViewController *)self _updateStyleForVariant:a4];
}

- (id)averageColorForVariant:(int64_t)a3
{
  return [(PBUIPosterViewController *)self->_posterController averageColorForVariant:a3];
}

- (double)averageContrastForVariant:(int64_t)a3
{
  [(PBUIPosterViewController *)self->_posterController averageContrastForVariant:a3];
  return result;
}

- (id)portalProviderForFloatingLayer
{
  return self->_lockFloatingLayerPosterReplicaProvider;
}

- (id)replicaProviderForVariant:(int64_t)a3
{
  id v3 = &OBJC_IVAR___PBUIPosterWallpaperViewController__lockPosterReplicaProvider;
  if (a3 == 1) {
    id v3 = &OBJC_IVAR___PBUIPosterWallpaperViewController__homePosterReplicaProvider;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)portalSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (id)scenesForBacklightSession
{
  return [(PBUIPosterViewController *)self->_posterController scenesForBacklightSession];
}

- (void)noteUserTapOccurred
{
}

- (void)noteUserTapOccurredWithLocation:(CGPoint)a3
{
}

- (BOOL)userTapEventsRequested
{
  return [(PBUIPosterViewController *)self->_posterController userTapEventsRequested];
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return [(PBUIPosterViewController *)self->_posterController significantEventsCounterForPosterWithIdentifier:a3];
}

- (unint64_t)posterSignificantEventsCounter
{
  return [(PBUIPosterViewController *)self->_posterController posterSignificantEventsCounter];
}

- (void)updateLegacyPoster
{
}

- (BOOL)homeScreenReflectsLockScreen
{
  return [(PBUIPosterViewController *)self->_posterController homeScreenReflectsLockScreen];
}

- (BOOL)posterHandlesWakeAnimation
{
  return [(PBUIPosterViewController *)self->_posterController handlesWakeAnimation];
}

- (BOOL)posterHidesDimmingLayer
{
  return [(PBUIPosterViewController *)self->_posterController hidesDimmingLayer];
}

- (void)setWallpaperObscured:(BOOL)a3
{
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  return [(PBUIPosterViewController *)self->_posterController currentHomeVariantStyleState];
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  return [(PBUIPosterViewController *)self->_posterController updateCurrentPosterWithUpdates:a3 error:a4];
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  return [(PBUIPosterViewController *)self->_posterController acquireDuckHomeScreenWallpaperDimAssertionWithReason:a3];
}

- (void)invalidate
{
  [(BSCompoundAssertion *)self->_wallpaperRequiredAssertion invalidate];
  [(BSInvalidatable *)self->_transitioningLockState invalidate];
  [(BSInvalidatable *)self->_keepForegroundRunning invalidate];
  [(PBUIPosterViewController *)self->_posterController invalidate];
  posterObserver = self->_posterObserver;
  [(PRSWallpaperObserver *)posterObserver invalidate];
}

- (void)_posterControllerDidChange
{
  [(PBUIDynamicProviderWrapper *)self->_homePosterReplicaProvider setRootObject:self->_posterController];
  [(PBUIDynamicProviderWrapper *)self->_lockPosterReplicaProvider setRootObject:self->_posterController];
  [(PBUIDynamicProviderWrapper *)self->_activeVariantReplicaProvider setRootObject:self->_posterController];
  lockFloatingLayerPosterReplicaProvider = self->_lockFloatingLayerPosterReplicaProvider;
  posterController = self->_posterController;
  [(PBUIDynamicProviderWrapper *)lockFloatingLayerPosterReplicaProvider setRootObject:posterController];
}

- (void)_posterConfigsDidChange:(id)a3 withTransition:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  BSDispatchMain();
}

void __76__PBUIPosterWallpaperViewController__posterConfigsDidChange_withTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 984) activeConfiguration];
  id v3 = [v2 _path];
  id v15 = [v3 serverIdentity];

  id v4 = [*(id *)(a1 + 40) activeLock];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 984) associatedConfiguration];
  id v6 = [v5 _path];
  uint64_t v7 = [v6 serverIdentity];

  uint64_t v8 = [*(id *)(a1 + 40) activeHome];
  int v9 = [v4 _path];
  int v10 = [v9 serverIdentity];
  char v11 = [v15 isEqual:v10];

  if ((v11 & 1) == 0) {
    [*(id *)(a1 + 32) updateConfiguration:v4 withAnimationSettings:0];
  }
  __int16 v12 = [v8 _path];
  id v13 = [v12 serverIdentity];
  char v14 = [v7 isEqual:v13];

  if ((v14 & 1) == 0) {
    [*(id *)(a1 + 32) updateAssociatedPosterConfiguration:v8 withAnimationSettings:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperViewController;
  [(PBUIPosterWallpaperViewController *)&v5 viewDidLoad];
  id v3 = [(PBUIPosterWallpaperViewController *)self view];
  id v4 = [(PBUIPosterViewController *)self->_posterController view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [(PBUIPosterWallpaperViewController *)self bs_addChildViewController:self->_posterController withSuperview:v3];
}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (UIColor)averageColor
{
  return [(PBUIPosterViewController *)self->_posterController averageColor];
}

- (double)averageContrast
{
  [(PBUIPosterViewController *)self->_posterController averageContrast];
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return [(PBUIPosterViewController *)self->_posterController legibilitySettings];
}

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  id v5 = a4;
  id v6 = [(PBUIPosterWallpaperViewController *)self delegate];
  [v6 posterComponent:self didUpdateLegibilitySettings:v5];
}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PBUIPosterWallpaperViewController *)self delegate];
  [v6 posterComponent:self didUpdateHideDimmingLayer:v4];
}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  id v5 = a4;
  id v6 = [(PBUIPosterWallpaperViewController *)self delegate];
  [v6 posterComponent:self didUpdatePreferredProminentColor:v5];
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterWallpaperViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(PBUIPosterWallpaperViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PBUIPosterWallpaperViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIPosterWallpaperViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PBUIPosterWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E62B2C38;
  id v6 = v5;
  id v10 = v6;
  char v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __75__PBUIPosterWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"posterController"];
  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 1024) orderedReasons];
  id v4 = [v5 array];
  [v3 appendArraySection:v4 withName:@"requiredReasons" skipIfEmpty:1];
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitioningLockState, 0);
  objc_storeStrong((id *)&self->_keepForegroundRunning, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredAssertion, 0);
  objc_storeStrong((id *)&self->_lockFloatingLayerPosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockPosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_homePosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_activeVariantReplicaProvider, 0);
  objc_storeStrong((id *)&self->_posterController, 0);
  objc_storeStrong((id *)&self->_posterObserver, 0);
}

- (void)init
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1BC4B3000, log, OS_LOG_TYPE_ERROR, "User default set to keep the active wallpaper always foreground running!", v1, 2u);
}

- (void)setActiveVariant:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateConfiguration:withAnimationSettings:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)requireWallpaperWithReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end