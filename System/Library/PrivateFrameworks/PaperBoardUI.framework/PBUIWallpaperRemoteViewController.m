@interface PBUIWallpaperRemoteViewController
- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState;
- (BOOL)_canShowWhileLocked;
- (BOOL)parallaxEnabledForVariant:(int64_t)a3;
- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5;
- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)shouldAutorotate;
- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4;
- (BOOL)updateIrisWallpaperForStaticMode;
- (NSString)cachingIdentifier;
- (NSString)description;
- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager;
- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate;
- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator;
- (PBUIWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_wallpaperScaleForVariant:(int64_t)a3;
- (double)contrastForVariant:(int64_t)a3;
- (double)homescreenWallpaperScale;
- (double)lockscreenWallpaperScale;
- (double)minimumHomescreenWallpaperScale;
- (double)minimumLockscreenWallpaperScale;
- (double)parallaxFactorForVariant:(int64_t)a3;
- (double)zoomFactorForVariant:(int64_t)a3;
- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4;
- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4 completion:(id)a5;
- (id)_blurImageFromURL:(id)a3;
- (id)_blurViewsForVariant:(int64_t)a3;
- (id)_cachedBlurAssetForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 traitCollection:(id)a5;
- (id)_disallowRasterizationReasonsForVariant:(int64_t)a3;
- (id)_hideWallpaperReasonsForVariant:(int64_t)a3;
- (id)_observersForVariant:(int64_t)a3;
- (id)_sceneClientSettings;
- (id)_sceneSettings;
- (id)_simpleAssertionWithReasonsSet:(id)a3 identifier:(id)a4 reason:(id)a5 updater:(id)a6;
- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4;
- (id)averageColorForVariant:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5;
- (id)irisWallpaperPlayer;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5;
- (id)newImageProviderView;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)requireWallpaperWithReason:(id)a3;
- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)suspendWallpaperAnimationForReason:(id)a3;
- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4;
- (int64_t)_effectiveSceneMode;
- (int64_t)activeVariant;
- (int64_t)variant;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addStateCaptureHandlers;
- (void)_cacheBlurImageForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 actualStyle:(int64_t)a5 traitCollection:(id)a6 image:(id)a7 imageURL:(id)a8;
- (void)_cancelSceneDeactivation;
- (void)_invalidateBlurCacheForVariant:(int64_t)a3;
- (void)_modifySceneSettings:(id)a3 forSceneMode:(int64_t)a4;
- (void)_notifyAllObserversOfNewWallpaperScene;
- (void)_performWithLiveScene:(id)a3;
- (void)_reconfigureBlurViewsForVariant:(int64_t)a3;
- (void)_registerFakeBlurView:(id)a3;
- (void)_scheduleSceneDeactivation;
- (void)_setupScene;
- (void)_setupSceneWithCompletion:(id)a3;
- (void)_unregisterFakeBlurView:(id)a3;
- (void)_updateBlurViewsForVariant:(int64_t)a3;
- (void)_updateFallbackView;
- (void)_updateSceneMode;
- (void)_updateSceneModeWithCompletion:(id)a3;
- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3;
- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3;
- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3 postUpdateBlock:(id)a4;
- (void)_updateWallpaperSceneSettingsWithTransitionBlock:(id)a3;
- (void)addObserver:(id)a3 forVariant:(int64_t)a4;
- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3;
- (void)cancelInProcessAnimations;
- (void)dealloc;
- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4;
- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)preheatWallpaperForVariant:(int64_t)a3;
- (void)remoteIrisWallpaperPlayer:(id)a3 touchActiveChanged:(BOOL)a4;
- (void)removeObserver:(id)a3 forVariant:(int64_t)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setActiveVariant:(int64_t)a3;
- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6;
- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4;
- (void)setCachingIdentifier:(id)a3;
- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5;
- (void)setLockscreenOnlyWallpaperAlpha:(double)a3;
- (void)setLockscreenWallpaperContentsRect:(CGRect)a3;
- (void)setLockscreenWallpaperScale:(double)a3;
- (void)setReachabilityCoordinator:(id)a3;
- (void)setWallpaperConfigurationManager:(id)a3;
- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5;
- (void)setWallpaperPresentingDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIrisWallpaperForInteractiveMode;
- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5;
- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4;
@end

@implementation PBUIWallpaperRemoteViewController

- (PBUIWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v45.receiver = self;
  v45.super_class = (Class)PBUIWallpaperRemoteViewController;
  v4 = [(PBUIWallpaperRemoteViewController *)&v45 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    stateCaptureHandles = v4->_stateCaptureHandles;
    v4->_stateCaptureHandles = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lockscreenObservers = v4->_lockscreenObservers;
    v4->_lockscreenObservers = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    homescreenObservers = v4->_homescreenObservers;
    v4->_homescreenObservers = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lockscreenBlurViews = v4->_lockscreenBlurViews;
    v4->_lockscreenBlurViews = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    homescreenBlurViews = v4->_homescreenBlurViews;
    v4->_homescreenBlurViews = (NSHashTable *)v13;

    v15 = objc_alloc_init(PBUIDefaultSessionReconnectPolicy);
    reconnectPolicy = v4->_reconnectPolicy;
    v4->_reconnectPolicy = (PBUISessionReconnectPolicy *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disallowRasterizationReasonsHomeVariant = v4->_disallowRasterizationReasonsHomeVariant;
    v4->_disallowRasterizationReasonsHomeVariant = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disallowRasterizationReasonsLockVariant = v4->_disallowRasterizationReasonsLockVariant;
    v4->_disallowRasterizationReasonsLockVariant = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hideWallpaperReasonsHomeVariant = v4->_hideWallpaperReasonsHomeVariant;
    v4->_hideWallpaperReasonsHomeVariant = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hideWallpaperReasonsLockVariant = v4->_hideWallpaperReasonsLockVariant;
    v4->_hideWallpaperReasonsLockVariant = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    wallpaperAnimationSuspendedReasons = v4->_wallpaperAnimationSuspendedReasons;
    v4->_wallpaperAnimationSuspendedReasons = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    wallpaperRequiredReasons = v4->_wallpaperRequiredReasons;
    v4->_wallpaperRequiredReasons = v27;

    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    homescreenChangesDelayedReasons = v4->_homescreenChangesDelayedReasons;
    v4->_homescreenChangesDelayedReasons = v29;

    uint64_t v31 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    wallpaperScaleAssertions = v4->_wallpaperScaleAssertions;
    v4->_wallpaperScaleAssertions = (NSHashTable *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
    externalSceneModeAssertionActions = v4->_externalSceneModeAssertionActions;
    v4->_externalSceneModeAssertionActions = (NSMutableSet *)v33;

    id v35 = objc_alloc(MEMORY[0x1E4F4F740]);
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    uint64_t v38 = [v35 initWithName:v37 onQueue:MEMORY[0x1E4F14428]];
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = (BSEventQueue *)v38;

    v40 = objc_alloc_init(PBUIRemoteIrisWallpaperPlayer);
    remoteIrisWallpaperPlayer = v4->_remoteIrisWallpaperPlayer;
    v4->_remoteIrisWallpaperPlayer = v40;

    [(PBUIRemoteIrisWallpaperPlayer *)v4->_remoteIrisWallpaperPlayer setDelegate:v4];
    uint64_t v42 = [MEMORY[0x1E4F1CA80] set];
    pendingEffectViewImageSlots = v4->_pendingEffectViewImageSlots;
    v4->_pendingEffectViewImageSlots = (NSMutableSet *)v42;

    [(PBUIWallpaperRemoteViewController *)v4 _addStateCaptureHandlers];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_stateCaptureHandles;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperRemoteViewController;
  [(PBUIWallpaperRemoteViewController *)&v8 dealloc];
}

- (void)setCachingIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_cachingIdentifier] & 1) == 0)
  {
    uint64_t v5 = (NSString *)[v4 copy];
    cachingIdentifier = self->_cachingIdentifier;
    self->_cachingIdentifier = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PBUIWallpaperRemoteViewController_setCachingIdentifier___block_invoke;
    v7[3] = &unk_1E62B3198;
    v7[4] = self;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v7];
  }
}

uint64_t __58__PBUIWallpaperRemoteViewController_setCachingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCachingIdentifier:*(void *)(*(void *)(a1 + 32) + 1184)];
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  uint64_t v5 = (PBUIWallpaperConfigurationManager *)a3;
  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (wallpaperConfigurationManager != v5)
  {
    uint64_t v7 = v5;
    [(PBUIWallpaperConfigurationManager *)wallpaperConfigurationManager setDelegate:0];
    objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
    wallpaperConfigurationManager = (PBUIWallpaperConfigurationManager *)[(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager setDelegate:self];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](wallpaperConfigurationManager, v5);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperRemoteViewController;
  [(PBUIWallpaperRemoteViewController *)&v3 viewDidLoad];
  [(PBUIWallpaperRemoteViewController *)self _setupScene];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperRemoteViewController;
  [(PBUIWallpaperRemoteViewController *)&v6 viewWillAppear:a3];
  if (!self->_sceneModeAssertionForViewAppeared)
  {
    id v4 = [(PBUIWallpaperRemoteViewController *)self _acquireSceneModeAssertionForReason:@"View Appeared" sceneMode:3];
    sceneModeAssertionForViewAppeared = self->_sceneModeAssertionForViewAppeared;
    self->_sceneModeAssertionForViewAppeared = v4;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperRemoteViewController;
  [(PBUIWallpaperRemoteViewController *)&v5 viewDidDisappear:a3];
  [(BSInvalidatable *)self->_sceneModeAssertionForViewAppeared invalidate];
  sceneModeAssertionForViewAppeared = self->_sceneModeAssertionForViewAppeared;
  self->_sceneModeAssertionForViewAppeared = 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PBUIWallpaperRemoteViewController;
  id v7 = a4;
  -[PBUIWallpaperRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(PBUIWallpaperRemoteViewController *)self view];
  long long v9 = [v8 window];
  uint64_t v10 = [v9 _toWindowOrientation];
  [v7 transitionDuration];
  double v12 = v11;

  [(PBUIWallpaperRemoteViewController *)self noteWillAnimateToInterfaceOrientation:v10 duration:v12];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperRemoteViewController;
  id v4 = a3;
  [(PBUIWallpaperRemoteViewController *)&v15 traitCollectionDidChange:v4];
  objc_super v5 = [(PBUIWallpaperRemoteViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];
  uint64_t v7 = [v4 _backlightLuminance];

  uint64_t v8 = [v5 _backlightLuminance];
  if (v6 || (v7 != 1) == (v8 == 1))
  {
    uint64_t v9 = [v5 userInterfaceStyle];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke;
    v14[3] = &unk_1E62B31E0;
    v14[4] = self;
    v14[5] = v9;
    [(PBUIWallpaperRemoteViewController *)self _performWithLiveScene:v14];
    uint64_t v10 = v9 == 1;
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    if (v8 == 1) {
      unint64_t v11 = 3;
    }
    else {
      unint64_t v11 = v10;
    }
    double v12 = PBUILogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = PBUIStringForWallpaperMode(v11);
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_DEFAULT, "Setting wallpaper mode to %@", buf, 0xCu);
    }
    if (v11) {
      [(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager setWallpaperMode:v11];
    }
  }
}

uint64_t __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke_2;
  v3[3] = &__block_descriptor_40_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _updateWallpaperSceneSettingsWithBlock:v3];
}

uint64_t __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PBUIWallpaperRemoteViewController;
  [(PBUIWallpaperRemoteViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(PBUIWallpaperRemoteViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIScenePresentation setBounds:](self->_scenePresentationView, "setBounds:", v5, v7, v9, v11);
  scenePresentationView = self->_scenePresentationView;
  UIRectGetCenter();
  -[UIScenePresentation setCenter:](scenePresentationView, "setCenter:");
}

- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = PBUIStringForWallpaperLocations(a4);
    *(_DWORD *)buf = 138543362;
    double v10 = v7;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Wallpaper did change for variants: %{public}@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke;
  v8[3] = &unk_1E62B31E0;
  v8[4] = self;
  v8[5] = a4;
  [(PBUIWallpaperRemoteViewController *)self _performWithLiveScene:v8];
}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke(uint64_t a1)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  dispatch_group_t v2 = dispatch_group_create();
  objc_super v3 = (void *)MEMORY[0x1E4F1CAD0];
  double v4 = [PBUIWallpaperUpdateLocationsAction alloc];
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = (void *)MEMORY[0x1E4F4F670];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_2;
  v26[3] = &unk_1E62B3208;
  double v7 = v2;
  v27 = v7;
  double v8 = [v6 responderWithHandler:v26];
  double v9 = [(PBUIWallpaperUpdateLocationsAction *)v4 initWithLocations:v5 wallpaperMode:0 responder:v8];
  v28[0] = v9;
  double v10 = [PBUIWallpaperUpdateAndPrewarmAction alloc];
  uint64_t v11 = (void *)MEMORY[0x1E4F4F670];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_3;
  v24[3] = &unk_1E62B3208;
  double v12 = v7;
  v25 = v12;
  objc_super v13 = [v11 responderWithHandler:v24];
  uint64_t v14 = [(PBUIWallpaperUpdateAndPrewarmAction *)v10 initWithResponder:v13];
  v28[1] = v14;
  objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v16 = [v3 setWithArray:v15];

  if ([v16 count])
  {
    unint64_t v17 = 0;
    do
    {
      dispatch_group_enter(v12);
      ++v17;
    }
    while (v17 < [v16 count]);
  }
  uint64_t v18 = PBUILogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring foreground support scene mode assertion for wallpaper change", buf, 2u);
  }

  v19 = [*(id *)(a1 + 32) _acquireSceneModeAssertionForReason:@"DidChangeWallpaperConfiguration" sceneMode:2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_36;
  block[3] = &unk_1E62B2798;
  id v22 = v19;
  id v20 = v19;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
  [*(id *)(*(void *)(a1 + 32) + 976) sendActions:v16];
}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_2(uint64_t a1)
{
}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_3(uint64_t a1)
{
}

uint64_t __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_36(uint64_t a1)
{
  dispatch_group_t v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Releasing foreground support scene mode assertion for wallpaper change", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (void)_registerFakeBlurView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 variant];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenBlurViews;
  }
  else
  {
    uint64_t v5 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenBlurViews;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v5) addObject:v6];
LABEL_6:
}

- (void)_unregisterFakeBlurView:(id)a3
{
  lockscreenBlurViews = self->_lockscreenBlurViews;
  id v5 = a3;
  [(NSHashTable *)lockscreenBlurViews removeObject:v5];
  [(NSHashTable *)self->_homescreenBlurViews removeObject:v5];
}

- (id)newImageProviderView
{
  return objc_alloc_init(PBUIImageSlotView);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = objc_opt_class();
  id v12 = v6;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v13 = v12;
    }
    else {
      objc_super v13 = 0;
    }
  }
  else
  {
    objc_super v13 = 0;
  }
  id v14 = v13;

  BOOL v15 = 0;
  if (v10 && v14)
  {
    id v16 = [v10 imageSlot];
    BOOL v15 = v14 != v16;
    if (v14 != v16) {
      [v10 setImageSlot:v14];
    }
  }
  return v15;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int64_t v34 = *a3;
  double v9 = PBUILogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = PBUIWallpaperStyleDescription(*a3);
    uint64_t v11 = PBUIStringForWallpaperVariant(a4);
    id v12 = _UIUserInterfaceStyleDescription([v8 userInterfaceStyle]);
    *(_DWORD *)buf = 138543874;
    id v48 = v10;
    __int16 v49 = 2114;
    v50 = v11;
    __int16 v51 = 2114;
    v52 = v12;
    _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_DEFAULT, "Fetching image for wallpaper style:%{public}@ variant:%{public}@ traitCollection.userInterfaceStyle:%{public}@", buf, 0x20u);
  }
  uint64_t v13 = [(PBUIWallpaperRemoteViewController *)self _cachedBlurAssetForVariant:a4 requestedStyle:v34 traitCollection:v8];
  id v14 = (id *)v13;
  if (v13)
  {
    *a3 = *(void *)(v13 + 8);
    id v15 = *(id *)(v13 + 16);
    id v16 = v14[3];
    if (v16)
    {
      unint64_t v17 = PBUILogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v16;
        _os_log_impl(&dword_1BC4B3000, v17, OS_LOG_TYPE_DEFAULT, "Satisfied image request from cache with image %{public}@", buf, 0xCu);
      }

      uint64_t v18 = [[PBUIImageSlot alloc] initWithImage:v16 lifetimeToken:0];
      goto LABEL_17;
    }
    if (v15)
    {
      v19 = [PBUIImageSlot alloc];
      id v20 = [(PBUIWallpaperRemoteViewController *)self _blurImageFromURL:v15];
      uint64_t v18 = [(PBUIImageSlot *)v19 initWithImage:v20 lifetimeToken:0];

      v21 = PBUILogCommon();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138543362;
          id v48 = v15;
          _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, "Satisfied image request from cache with image URL %{public}@", buf, 0xCu);
        }

LABEL_17:
        if (v18) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }
      if (v22)
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v15;
        _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, "Received cached image URL %{public}@ but could not load image.", buf, 0xCu);
      }
    }
    uint64_t v18 = 0;
    goto LABEL_17;
  }
LABEL_18:
  v23 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v34);
  v24 = [v23 UUIDString];

  [(NSMutableSet *)self->_pendingEffectViewImageSlots addObject:v24];
  objc_initWeak((id *)buf, self);
  v25 = [PBUIWallpaperImageSlotRequestAction alloc];
  id v26 = MEMORY[0x1E4F14428];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke;
  v44[3] = &unk_1E62B3230;
  objc_copyWeak(&v46, (id *)buf);
  id v27 = v24;
  id v45 = v27;
  v28 = [(PBUIWallpaperImageSlotRequestAction *)v25 initWithVariant:a4 desiredStyle:v35 traitCollection:v8 slotIdentifier:v27 forResponseOnQueue:MEMORY[0x1E4F14428] withHandler:v44];

  v29 = [[PBUIDeferredImageSlot alloc] initWithLifetimeToken:v28];
  v30 = [(PBUIWallpaperRemoteViewController *)self averageColorForVariant:a4];
  [(PBUIDeferredImageSlot *)v29 setFallbackColor:v30];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_48;
  v36[3] = &unk_1E62B32A8;
  id v31 = v27;
  id v37 = v31;
  uint64_t v38 = self;
  v32 = v28;
  v39 = v32;
  uint64_t v18 = v29;
  v40 = v18;
  int64_t v42 = a4;
  uint64_t v43 = v35;
  id v41 = v8;
  [(PBUIWallpaperRemoteViewController *)self _performWithLiveScene:v36];

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

  if (!v18) {
    self->_missingEffectViewImages = 1;
  }
LABEL_20:

  return v18;
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = [WeakRetained[144] containsObject:v4];
    id v6 = @"fulfilled";
    if (v5) {
      id v6 = @"unfulfilled";
    }
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Image slot invalidated: %{public}@ (%{public}@)", (uint8_t *)&v7, 0x16u);
  }
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_48(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_group_t v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v3;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Acquiring foreground scene mode assertion for image request %{public}@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) _acquireSceneModeAssertionForReason:@"ImageForWallpaperStyle" sceneMode:3];
  int v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Sending image slot request action for image slot request %{public}@", buf, 0xCu);
  }

  int v7 = *(void **)(*(void *)(a1 + 40) + 976);
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
  [v7 sendActions:v8];

  __int16 v9 = [PBUIWallpaperEffectImageRequestAction alloc];
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = dispatch_get_global_queue(25, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_53;
  v19[3] = &unk_1E62B3280;
  id v20 = v10;
  id v12 = v4;
  uint64_t v13 = *(void *)(a1 + 40);
  id v21 = v12;
  uint64_t v22 = v13;
  id v23 = *(id *)(a1 + 56);
  long long v25 = *(_OWORD *)(a1 + 72);
  id v24 = *(id *)(a1 + 64);
  id v14 = [(PBUIWallpaperEffectImageRequestAction *)v9 initWithSlotIdentifier:v20 forResponseOnQueue:v11 withHandler:v19];

  id v15 = PBUILogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v16;
    _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "Sending image request action for image slot request %{public}@", buf, 0xCu);
  }

  unint64_t v17 = *(void **)(*(void *)(a1 + 40) + 976);
  uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
  [v17 sendActions:v18];
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_2;
  block[3] = &unk_1E62B2C38;
  uint64_t v8 = (uint64_t *)(a1 + 32);
  id v38 = *(id *)(a1 + 32);
  id v39 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (v7)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_55;
    v35[3] = &unk_1E62B2C38;
    v35[4] = *(void *)(a1 + 48);
    id v36 = *(id *)(a1 + 32);
    __int16 v9 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v35);

    uint64_t v10 = [v7 actualStyle];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = v7;
      id v12 = [v11 imageURL];
      uint64_t v13 = [*(id *)(a1 + 48) _blurImageFromURL:v12];
      id v14 = PBUILogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *v8;
        *(_DWORD *)buf = 138543874;
        id v41 = v12;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v13;
        __int16 v44 = 2114;
        uint64_t v45 = v15;
        _os_log_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_DEFAULT, "Received image URL %{public}@ resulting in image %{public}@ for image request %{public}@", buf, 0x20u);
      }

      if (v13)
      {
        [*(id *)(a1 + 56) updateWithImage:v13];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_57;
        v29[3] = &unk_1E62B3258;
        v29[4] = *(void *)(a1 + 48);
        long long v33 = *(_OWORD *)(a1 + 72);
        uint64_t v34 = v10;
        id v30 = *(id *)(a1 + 64);
        id v31 = v13;
        id v32 = v12;
        uint64_t v16 = (void *)MEMORY[0x1E4F14428];
        dispatch_async(MEMORY[0x1E4F14428], v29);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v11 = PBUILogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *v8;
          *(_DWORD *)buf = 138543618;
          id v41 = v7;
          __int16 v42 = 2114;
          uint64_t v43 = v27;
          _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected response %{public}@ for image request %{public}@", buf, 0x16u);
        }
        goto LABEL_14;
      }
      uint64_t v11 = v7;
      id v12 = [v11 ioSurface];
      [v11 size];
      double v21 = v20;
      uint64_t v22 = PBUILogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        [v11 size];
        id v23 = BSStringFromCGSize();
        uint64_t v24 = *v8;
        *(_DWORD *)buf = 138543874;
        id v41 = v12;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v23;
        __int16 v44 = 2114;
        uint64_t v45 = v24;
        _os_log_impl(&dword_1BC4B3000, v22, OS_LOG_TYPE_DEFAULT, "Received IOSurface %{public}@ size %{public}@ for image request %{public}@", buf, 0x20u);
      }
      if ((BSFloatIsZero() & 1) == 0)
      {
        uint64_t v25 = [v12 width];
        id v26 = objc_msgSend(MEMORY[0x1E4F42A80], "pbui_imageWithIOSurface:scale:orientation:", v12, 0, (double)v25 / v21);
        if (v26) {
          [*(id *)(a1 + 56) updateWithImage:v26];
        }
      }
    }

LABEL_14:
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_60;
    void v28[3] = &unk_1E62B31E0;
    uint64_t v17 = *(void *)(a1 + 72);
    v28[4] = *(void *)(a1 + 48);
    v28[5] = v17;
    uint64_t v18 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v28);

    goto LABEL_18;
  }
  v19 = PBUILogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_53_cold_1(v8, v19);
  }

LABEL_18:
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_group_t v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Releasing foreground scene mode assertion for image request %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invalidate];
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_55(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1152) removeObject:*(void *)(a1 + 40)];
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cacheBlurImageForVariant:*(void *)(a1 + 64) requestedStyle:*(void *)(a1 + 72) actualStyle:*(void *)(a1 + 80) traitCollection:*(void *)(a1 + 40) image:*(void *)(a1 + 48) imageURL:*(void *)(a1 + 56)];
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_60(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "_blurViewsForVariant:", *(void *)(a1 + 40), 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setNeedsLayout];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    [v4 lockscreenParallaxFactor];
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (a3 == 1)
  {
    uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    [v4 homescreenParallaxFactor];
LABEL_5:
    double v3 = v5;
  }
  return v3;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return 0;
    }
    double v3 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    char v4 = [v3 homescreenParallaxEnabled];
  }
  else
  {
    double v3 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    char v4 = [v3 lockscreenParallaxEnabled];
  }
  BOOL v5 = v4;

  return v5;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  if (!a3)
  {
    char v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    [v4 lockscreenZoomFactor];
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (a3 == 1)
  {
    char v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
    [v4 homescreenZoomFactor];
LABEL_5:
    double v3 = v5;
  }
  return v3;
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  double v5 = [(PBUIWallpaperRemoteViewController *)self wallpaperConfigurationManager];
  long long v6 = [v5 wallpaperConfigurationForVariant:1 includingValuesForTypes:a4];

  return v6;
}

- (void)setActiveVariant:(int64_t)a3
{
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  uint64_t v13 = objc_alloc_init(PBUIWallpaperWindowSceneTwoCurveTransitionContext);
  if ([(FBScene *)self->_scene isActive])
  {
    id v14 = [v11 settings];
    [(PBUIWallpaperWindowSceneTwoCurveTransitionContext *)v13 setInAnimationSettings:v14];

    uint64_t v15 = [v10 settings];
    [(PBUIWallpaperWindowSceneTwoCurveTransitionContext *)v13 setOutAnimationSettings:v15];

    uint64_t v16 = [(PBUIWallpaperRemoteViewController *)self view];
    uint64_t v17 = [v16 window];
    uint64_t v18 = [v17 windowScene];

    [v18 _synchronizeDrawing];
    v19 = [v18 _synchronizedDrawingFence];
    [(PBUIWallpaperWindowSceneTwoCurveTransitionContext *)v13 setAnimationFence:v19];
  }
  double v20 = [(FBScene *)self->_scene settings];
  double v21 = (void *)[v20 mutableCopy];
  uint64_t v22 = objc_opt_class();
  id v23 = v21;
  if (v22)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v25 = v24;

  int64_t activeVariant = self->_activeVariant;
  self->_int64_t activeVariant = a3;
  uint64_t v27 = PBUILogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a3);
    uint64_t v34 = v13;
    uint64_t v28 = v12;
    int64_t v29 = a3;
    id v30 = v11;
    v32 = id v31 = v10;
    long long v33 = PBUIStringForWallpaperVariant(activeVariant);
    *(_DWORD *)buf = 138543618;
    id v36 = v32;
    __int16 v37 = 2114;
    id v38 = v33;
    _os_log_impl(&dword_1BC4B3000, v27, OS_LOG_TYPE_DEFAULT, "Setting wallpaper variant to %{public}@ from %{public}@", buf, 0x16u);

    id v10 = v31;
    id v11 = v30;
    a3 = v29;
    id v12 = v28;
    uint64_t v13 = v34;
  }

  [v25 setWallpaperVariant:a3];
  [(FBScene *)self->_scene updateSettings:v25 withTransitionContext:v13];
  [(PBUIWallpaperRemoteViewController *)self _updateFallbackView];
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:0];
  if (v12) {
    v12[2](v12);
  }
}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _observersForVariant:a4];
  [v7 addObject:v6];
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _observersForVariant:a4];
  [v7 removeObject:v6];
}

- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = PBUIStringForWallpaperVariant(a4);
    *(_DWORD *)buf = 134218242;
    double v11 = a3;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Setting alpha %f for variant %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PBUIWallpaperRemoteViewController_setAlpha_forWallpaperVariant___block_invoke;
  v9[3] = &__block_descriptor_48_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  v9[4] = a4;
  *(double *)&v9[5] = a3;
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v9];
}

void __66__PBUIWallpaperRemoteViewController_setAlpha_forWallpaperVariant___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 setHomescreenWallpaperAlpha:*(double *)(a1 + 40)];
  }
  else
  {
    id v5 = v3;
    [v3 setLockscreenWallpaperAlpha:*(double *)(a1 + 40)];
  }
  id v3 = v5;
LABEL_6:
}

- (void)setLockscreenWallpaperContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = BSStringFromCGRect();
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v9;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Setting lockscreen wallpaper contents rect %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PBUIWallpaperRemoteViewController_setLockscreenWallpaperContentsRect___block_invoke;
  v10[3] = &__block_descriptor_64_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v10];
}

uint64_t __72__PBUIWallpaperRemoteViewController_setLockscreenWallpaperContentsRect___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenWallpaperContentsRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Setting lockscreen-only wallpaper alpha %f", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PBUIWallpaperRemoteViewController_setLockscreenOnlyWallpaperAlpha___block_invoke;
  v6[3] = &__block_descriptor_40_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  *(double *)&v6[4] = a3;
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v6];
}

uint64_t __69__PBUIWallpaperRemoteViewController_setLockscreenOnlyWallpaperAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenOnlyWallpaperAlpha:*(double *)(a1 + 32)];
}

- (double)homescreenWallpaperScale
{
  [(PBUIWallpaperRemoteViewController *)self _wallpaperScaleForVariant:1];
  return result;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _wallpaperScaleAssertionForVariant:1 scale:a3];
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (double)minimumHomescreenWallpaperScale
{
  uint64_t v2 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  [v2 homescreenMinimumWallpaperScale];
  double v4 = v3;

  return v4;
}

- (double)lockscreenWallpaperScale
{
  [(PBUIWallpaperRemoteViewController *)self _wallpaperScaleForVariant:0];
  return result;
}

- (void)setLockscreenWallpaperScale:(double)a3
{
  id v3 = [(PBUIWallpaperRemoteViewController *)self setLockscreenWallpaperScale:0 withAnimationFactory:a3];
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _wallpaperScaleAssertionForVariant:0 scale:a3];
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (double)minimumLockscreenWallpaperScale
{
  uint64_t v2 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  [v2 lockscreenMinimumWallpaperScale];
  double v4 = v3;

  return v4;
}

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v7 = [PBUIWallpaperScaleAssertion alloc];
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper scale %f", *(void *)&a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PBUIWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v13[3] = &unk_1E62B3310;
  objc_copyWeak(&v14, &location);
  uint64_t v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v13, a4);

  id v10 = PBUILogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [v9 description];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring wallpaper scale assertion %@", buf, 0xCu);
  }
  [(NSHashTable *)self->_wallpaperScaleAssertions addObject:v9];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

void __78__PBUIWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v8 = PBUILogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 description];
      int v10 = 138412290;
      double v11 = v9;
      _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Removing wallpaper scale assertion %@", (uint8_t *)&v10, 0xCu);
    }
    [WeakRetained[137] removeObject:v5];
    [WeakRetained _updateWallpaperScaleWithAnimationFactory:v6];
  }
}

- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(PBUIWallpaperRemoteViewController *)self _disallowRasterizationReasonsForVariant:a4];
  uint64_t v10 = [v9 count];
  if (v6) {
    [v9 addObject:v8];
  }
  else {
    [v9 removeObject:v8];
  }
  uint64_t v11 = [v9 count];
  BOOL v12 = v11 != 0;
  uint64_t v13 = PBUILogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = PBUIStringForWallpaperVariant(a4);
    *(_DWORD *)buf = 67109890;
    BOOL v18 = v11 != 0;
    __int16 v19 = 2114;
    double v20 = v14;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 1024;
    BOOL v24 = v10 != 0;
    _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_DEFAULT, "Setting rasterization disabled:%{BOOL}u for variant %{public}@ with reason %{public}@ (was disabled: %{BOOL}u)", buf, 0x22u);

    BOOL v12 = v11 != 0;
  }

  if ((v10 != 0) != (v11 != 0))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__PBUIWallpaperRemoteViewController_setDisallowsRasterization_forVariant_withReason___block_invoke;
    v15[3] = &__block_descriptor_41_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v15[4] = a4;
    BOOL v16 = v12;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v15];
  }
}

void __85__PBUIWallpaperRemoteViewController_setDisallowsRasterization_forVariant_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 setDisallowHomescreenRasterization:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    id v5 = v3;
    [v3 setDisallowLockscreenRasterization:*(unsigned __int8 *)(a1 + 40)];
  }
  id v3 = v5;
LABEL_6:
}

- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(PBUIWallpaperRemoteViewController *)self _hideWallpaperReasonsForVariant:a4];
  uint64_t v10 = [v9 count];
  if (v6) {
    [v9 addObject:v8];
  }
  else {
    [v9 removeObject:v8];
  }
  uint64_t v11 = [v9 count];
  BOOL v12 = v11 != 0;
  uint64_t v13 = PBUILogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = PBUIStringForWallpaperVariant(a4);
    *(_DWORD *)buf = 67109890;
    BOOL v18 = v11 != 0;
    __int16 v19 = 2114;
    double v20 = v14;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 1024;
    BOOL v24 = v10 != 0;
    _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_DEFAULT, "Setting wallpaper hidden:%{BOOL}u for variant %{public}@ with reason %{public}@ (was hidden: %{BOOL}u)", buf, 0x22u);

    BOOL v12 = v11 != 0;
  }

  if ((v10 != 0) != (v11 != 0))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__PBUIWallpaperRemoteViewController_setWallpaperHidden_variant_reason___block_invoke;
    v15[3] = &__block_descriptor_41_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v15[4] = a4;
    BOOL v16 = v12;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v15];
  }
}

void __71__PBUIWallpaperRemoteViewController_setWallpaperHidden_variant_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 setHomescreenWallpaperHidden:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    id v5 = v3;
    [v3 setLockscreenWallpaperHidden:*(unsigned __int8 *)(a1 + 40)];
  }
  id v3 = v5;
LABEL_6:
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  wallpaperAnimationSuspendedReasons = self->_wallpaperAnimationSuspendedReasons;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke;
  v10[3] = &unk_1E62B3378;
  objc_copyWeak(&v13, &location);
  id v6 = v4;
  id v11 = v6;
  BOOL v12 = self;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _simpleAssertionWithReasonsSet:wallpaperAnimationSuspendedReasons identifier:@"WallpaperAnimationSuspended" reason:v6 updater:v10];
  id v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2048;
    BOOL v18 = v7;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Suspending animation for reason %{public}@ assertion %p", buf, 0x16u);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = PBUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 1024;
      int v12 = a2 ^ 1;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Animation suspension assertion for reason %{public}@ invalidated. Setting sampling suspended:%{BOOL}u", buf, 0x12u);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke_75;
    v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    char v8 = a2;
    [WeakRetained _updateWallpaperSceneSettingsWithBlock:v7];
    [*(id *)(a1 + 40) _reconfigureBlurViewsForVariant:1];
    [*(id *)(a1 + 40) _reconfigureBlurViewsForVariant:0];
  }
}

uint64_t __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke_75(uint64_t a1, void *a2)
{
  return [a2 setWallpaperAnimationSuspended:*(unsigned char *)(a1 + 32) == 0];
}

- (id)irisWallpaperPlayer
{
  return self->_remoteIrisWallpaperPlayer;
}

- (void)updateIrisWallpaperForInteractiveMode
{
  id v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Updating iris wallpaper for interactive mode", v4, 2u);
  }

  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:&__block_literal_global_9];
}

uint64_t __74__PBUIWallpaperRemoteViewController_updateIrisWallpaperForInteractiveMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLiveWallpaperInteractive:1];
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  id v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Updating iris wallpaper for static mode", v7, 2u);
  }

  id v4 = [(PBUIWallpaperRemoteViewController *)self irisWallpaperPlayer];
  uint64_t v5 = [v4 irisPlaybackState];

  if (!v5) {
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:&__block_literal_global_79];
  }
  return v5 == 0;
}

uint64_t __69__PBUIWallpaperRemoteViewController_updateIrisWallpaperForStaticMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLiveWallpaperInteractive:0];
}

- (void)cancelInProcessAnimations
{
  id v3 = [(PBUIWallpaperRemoteViewController *)self view];
  uint64_t v2 = [v3 window];
  [v2 _removeAllRetargetableAnimations:1];
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  id v7 = [(PBUIWallpaperRemoteViewController *)self _sceneSettings];
  id v4 = [v7 homescreenStyleTransitionState];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 highestPriorityStyleTransitionState];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0.0;
  }

  return result;
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10 = a6;
  PBUIWallpaperStyleTransitionStateMake(a3, a3, (uint64_t)v12, 0.0);
  LOBYTE(a5) = [(PBUIWallpaperRemoteViewController *)self setWallpaperStyleTransitionState:v12 forPriority:a4 forVariant:a5 withAnimationFactory:v10];

  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  __int16 v11 = [(PBUIWallpaperRemoteViewController *)self _sceneSettings];
  int v12 = v11;
  if (!a5)
  {
    uint64_t v13 = [v11 lockscreenStyleTransitionState];
LABEL_5:
    id v14 = (PBUIWallpaperWindowSceneStyleTransitionState *)v13;
    if (v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a5 == 1)
  {
    uint64_t v13 = [v11 homescreenStyleTransitionState];
    goto LABEL_5;
  }
LABEL_6:
  id v14 = objc_alloc_init(PBUIWallpaperWindowSceneStyleTransitionState);
LABEL_7:
  uint64_t v15 = (void *)[(PBUIWallpaperWindowSceneStyleTransitionState *)v14 copy];
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  *(double *)&buf[16] = a3->var2;
  [v15 setWallpaperStyleTransitionState:buf forPriority:a4];
  int v16 = [v15 isEqual:v14];
  char v17 = v16;
  int v26 = v16 ^ 1;
  BOOL v18 = PBUILogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(double *)&buf[16] = a3->var2;
    uint64_t v19 = PBUIStringForStyleTransitionState((unint64_t *)buf);
    double v20 = PBUIStringForWallpaperStylePriority(a4);
    PBUIStringForWallpaperVariant(a5);
    uint64_t v25 = self;
    __int16 v21 = v12;
    v23 = id v22 = v10;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    long long v33 = v23;
    __int16 v34 = 1024;
    int v35 = v26;
    _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_DEFAULT, "Setting wallpaper style transition state %{public}@ for priority %{public}@ variant %{public}@. Is different:%{BOOL}u", buf, 0x26u);

    id v10 = v22;
    int v12 = v21;
    self = v25;
  }
  if ((v17 & 1) == 0)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __114__PBUIWallpaperRemoteViewController_setWallpaperStyleTransitionState_forPriority_forVariant_withAnimationFactory___block_invoke;
    v27[3] = &unk_1E62B33C0;
    int64_t v31 = a5;
    id v28 = v15;
    id v29 = v10;
    id v30 = self;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithTransitionBlock:v27];
  }
  return v26;
}

id __114__PBUIWallpaperRemoteViewController_setWallpaperStyleTransitionState_forPriority_forVariant_withAnimationFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    if (v5 == 1) {
      [v3 setHomescreenStyleTransitionState:*(void *)(a1 + 32)];
    }
  }
  else
  {
    [v3 setLockscreenStyleTransitionState:*(void *)(a1 + 32)];
  }
  uint64_t v6 = [MEMORY[0x1E4F42790] transitionContext];
  id v7 = [*(id *)(a1 + 40) settings];
  if (v7)
  {
    char v8 = [*(id *)(a1 + 48) view];
    uint64_t v9 = [v8 window];
    id v10 = [v9 windowScene];

    [v10 _synchronizeDrawing];
    __int16 v11 = [v10 _synchronizedDrawingFence];
    [v6 setAnimationFence:v11];

    [v6 setAnimationSettings:v7];
  }

  return v6;
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(PBUIWallpaperRemoteViewController *)self _sceneSettings];
  id v10 = v9;
  if (!a4)
  {
    uint64_t v11 = [v9 lockscreenStyleTransitionState];
LABEL_5:
    int v12 = (PBUIWallpaperWindowSceneStyleTransitionState *)v11;
    if (v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a4 == 1)
  {
    uint64_t v11 = [v9 homescreenStyleTransitionState];
    goto LABEL_5;
  }
LABEL_6:
  int v12 = objc_alloc_init(PBUIWallpaperWindowSceneStyleTransitionState);
LABEL_7:
  uint64_t v13 = (void *)[(PBUIWallpaperWindowSceneStyleTransitionState *)v12 copy];
  [v13 removeWallpaperStyleTransitionStateForPriority:a3];
  int v14 = [v13 isEqual:v12];
  char v15 = v14;
  int v16 = v14 ^ 1;
  char v17 = PBUILogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = PBUIStringForWallpaperStylePriority(a3);
    PBUIStringForWallpaperVariant(a4);
    __int16 v23 = self;
    uint64_t v19 = v10;
    v21 = id v20 = v8;
    *(_DWORD *)buf = 138543874;
    id v30 = v18;
    __int16 v31 = 2114;
    id v32 = v21;
    __int16 v33 = 1024;
    int v34 = v16;
    _os_log_impl(&dword_1BC4B3000, v17, OS_LOG_TYPE_DEFAULT, "Removing wallpaper style transition state for priority %{public}@ variant %{public}@. Is different:%{BOOL}u", buf, 0x1Cu);

    id v8 = v20;
    id v10 = v19;
    self = v23;
  }
  if ((v15 & 1) == 0)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__PBUIWallpaperRemoteViewController_removeWallpaperStyleForPriority_forVariant_withAnimationFactory___block_invoke;
    v24[3] = &unk_1E62B33C0;
    int64_t v28 = a4;
    id v25 = v13;
    id v26 = v8;
    uint64_t v27 = self;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithTransitionBlock:v24];
  }
  return v16;
}

id __101__PBUIWallpaperRemoteViewController_removeWallpaperStyleForPriority_forVariant_withAnimationFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    if (v5 == 1) {
      [v3 setHomescreenStyleTransitionState:*(void *)(a1 + 32)];
    }
  }
  else
  {
    [v3 setLockscreenStyleTransitionState:*(void *)(a1 + 32)];
  }
  uint64_t v6 = [MEMORY[0x1E4F42790] transitionContext];
  id v7 = [*(id *)(a1 + 40) settings];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 48) view];
    uint64_t v9 = [v8 window];
    id v10 = [v9 windowScene];

    [v10 _synchronizeDrawing];
    uint64_t v11 = [v10 _synchronizedDrawingFence];
    [v6 setAnimationFence:v11];

    [v6 setAnimationSettings:v7];
  }

  return v6;
}

- (id)requireWallpaperWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  wallpaperRequiredReasons = self->_wallpaperRequiredReasons;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke;
  v10[3] = &unk_1E62B33E8;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v11 = v6;
  id v7 = [(PBUIWallpaperRemoteViewController *)self _simpleAssertionWithReasonsSet:wallpaperRequiredReasons identifier:@"WallpaperRequired" reason:v6 updater:v10];
  id v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2048;
    char v17 = v7;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Beginning wallpaper requiring for reason %{public}@ assertion %p", buf, 0x16u);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

void __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = PBUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 1024;
      int v12 = a2 ^ 1;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Ending wallpaper requiring with reason %{public}@. Setting wallpaper required:%{BOOL}u", buf, 0x12u);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke_86;
    v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    char v8 = a2;
    [WeakRetained _updateWallpaperSceneSettingsWithBlock:v7];
  }
}

uint64_t __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke_86(uint64_t a1, void *a2)
{
  return [a2 setWallpaperRequired:*(unsigned char *)(a1 + 32) == 0];
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(FBScene *)self->_scene isActive])
  {
    uint64_t v5 = PBUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = PBUIStringForWallpaperVariant(a3);
      int v11 = 138543362;
      int v12 = v6;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Sending wallpaper preheat action for variant %{public}@", (uint8_t *)&v11, 0xCu);
    }
    scene = self->_scene;
    char v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = [[PBUIWallpaperPreheatAction alloc] initWithVariant:a3];
    uint64_t v10 = [v8 setWithObject:v9];
    [(FBScene *)scene sendActions:v10];
  }
}

- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_homescreenChangesDelayedReasons addObject:v4];
  uint64_t v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Beginning delaying homescreen style changes for reason %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:&__block_literal_global_89];
}

uint64_t __82__PBUIWallpaperRemoteViewController_beginDelayingHomescreenStyleChangesForReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenStyleChangesDelayed:1];
}

- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->_homescreenChangesDelayedReasons removeObject:v6];
  uint64_t v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(NSMutableSet *)self->_homescreenChangesDelayedReasons count];
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Ending delaying homescreen style changes for reason %{public}@. Remaining reasons: %ld", buf, 0x16u);
  }

  if (![(NSMutableSet *)self->_homescreenChangesDelayedReasons count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__PBUIWallpaperRemoteViewController_endDelayingHomescreenStyleChangesForReason_animationFactory___block_invoke;
    v10[3] = &unk_1E62B3410;
    id v11 = v7;
    int v12 = self;
    [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithTransitionBlock:v10];
  }
}

id __97__PBUIWallpaperRemoteViewController_endDelayingHomescreenStyleChangesForReason_animationFactory___block_invoke(uint64_t a1, void *a2)
{
  [a2 setHomescreenStyleChangesDelayed:0];
  id v3 = [MEMORY[0x1E4F42790] transitionContext];
  id v4 = [*(id *)(a1 + 32) settings];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) view];
    id v6 = [v5 window];
    id v7 = [v6 windowScene];

    [v7 _synchronizeDrawing];
    uint64_t v8 = [v7 _synchronizedDrawingFence];
    [v3 setAnimationFence:v8];

    [v3 setAnimationSettings:v4];
  }

  return v3;
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  uint64_t v9 = [WeakRetained wallpaperPresenter:self requestsOrientationWithRefresh:1];

  uint64_t v10 = [[PBUIFakeBlurView alloc] initWithVariant:a3 imageProvider:self fakeBlurRegistry:self wallpaperViewDelegate:self transformOptions:a5 reachabilityCoordinator:self->_reachabilityCoordinator];
  id v11 = v10;
  if (v9)
  {
    int v12 = (void *)MEMORY[0x1E4F42FF0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__PBUIWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
    v14[3] = &unk_1E62B31E0;
    __int16 v15 = v10;
    uint64_t v16 = v9;
    [v12 performWithoutAnimation:v14];
  }
  return v11;
}

uint64_t __86__PBUIWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rotateToInterfaceOrientation:*(void *)(a1 + 40)];
}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke;
  v10[3] = &unk_1E62B3460;
  void v10[4] = self;
  id v11 = v8;
  int64_t v12 = a3;
  int64_t v13 = a4;
  id v9 = v8;
  [(PBUIWallpaperRemoteViewController *)self _performWithLiveScene:v10];
}

void __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Acquiring foreground support scene mode assertion for wallpaper update", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) _acquireSceneModeAssertionForReason:@"UpdateWallpaperForLocations" sceneMode:2];
  id v4 = (void *)MEMORY[0x1E4F4F670];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke_95;
  uint64_t v17 = &unk_1E62B3438;
  id v5 = *(id *)(a1 + 40);
  id v18 = v3;
  id v19 = v5;
  id v6 = v3;
  id v7 = [v4 responderWithHandler:&v14];
  objc_msgSend(v7, "setQueue:", MEMORY[0x1E4F14428], v14, v15, v16, v17);
  [v7 setTimeout:15];
  id v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = PBUIStringForWallpaperLocations(*(void *)(a1 + 48));
    uint64_t v10 = PBUIStringForWallpaperMode(*(void *)(a1 + 56));
    *(_DWORD *)buf = 138543618;
    __int16 v21 = v9;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Sending wallpaper update locations action for locations %{public}@ wallpaper mode %{public}@", buf, 0x16u);
  }
  id v11 = [[PBUIWallpaperUpdateLocationsAction alloc] initWithLocations:*(void *)(a1 + 48) wallpaperMode:*(void *)(a1 + 56) responder:v7];
  int64_t v12 = *(void **)(*(void *)(a1 + 32) + 976);
  int64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  [v12 sendActions:v13];
}

void __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating foreground support scene mode assertion for wallpaper update", v6, 2u);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_lockscreenBlurViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v11++) rotateToInterfaceOrientation:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v12 = self->_homescreenBlurViews;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v16++) rotateToInterfaceOrientation:a3];
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__PBUIWallpaperRemoteViewController_noteWillAnimateToInterfaceOrientation_duration___block_invoke;
  v17[3] = &unk_1E62B3488;
  v17[4] = self;
  v17[5] = a3;
  *(double *)&v17[6] = a4;
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithTransitionBlock:v17];
}

id __84__PBUIWallpaperRemoteViewController_noteWillAnimateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  [a2 setInterfaceOrientation:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F42790] transitionContext];
  uint64_t v4 = [*(id *)(a1 + 32) view];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];

  [v6 _synchronizeDrawing];
  id v7 = [v6 _synchronizedDrawingFence];
  [v3 setAnimationFence:v7];

  uint64_t v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:*(double *)(a1 + 48)];
  [v3 setAnimationSettings:v8];

  return v3;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  id v5 = v4;
  if (!a3)
  {
    uint64_t v6 = [v4 lockscreenLegibilitySettings];
LABEL_5:
    id v7 = (void *)v6;
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v6 = [v4 homescreenLegibilitySettings];
    goto LABEL_5;
  }
LABEL_6:
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:0];
LABEL_7:

  return v7;
}

- (id)averageColorForVariant:(int64_t)a3
{
  uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  id v5 = v4;
  if (!a3)
  {
    uint64_t v6 = [v4 lockscreenAverageColor];
LABEL_5:
    id v7 = (void *)v6;
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v6 = [v4 homescreenAverageColor];
    goto LABEL_5;
  }
LABEL_6:
  id v7 = [MEMORY[0x1E4F428B8] clearColor];
LABEL_7:

  return v7;
}

- (double)contrastForVariant:(int64_t)a3
{
  uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  id v5 = v4;
  if (!a3)
  {
    [v4 lockscreenContrast];
    goto LABEL_5;
  }
  double v6 = 0.0;
  if (a3 == 1)
  {
    [v4 homescreenContrast];
LABEL_5:
    double v6 = v7;
  }

  return v6;
}

- (void)remoteIrisWallpaperPlayer:(id)a3 touchActiveChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v4;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Setting live wallpaper touch active: %{BOOL}u", buf, 8u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PBUIWallpaperRemoteViewController_remoteIrisWallpaperPlayer_touchActiveChanged___block_invoke;
  v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  BOOL v8 = v4;
  [(PBUIWallpaperRemoteViewController *)self _updateWallpaperSceneSettingsWithBlock:v7];
}

uint64_t __82__PBUIWallpaperRemoteViewController_remoteIrisWallpaperPlayer_touchActiveChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLiveWallpaperTouchActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = a4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v6 = PBUILogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v5;
          _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Received action %{public}@", buf, 0xCu);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id WeakRetained = v5;
          uint64_t v8 = [WeakRetained variant];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v9 = [(PBUIWallpaperRemoteViewController *)self _observersForVariant:v8];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v31 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                if (objc_opt_respondsToSelector()) {
                  [v14 wallpaperWillChangeForVariant:v8];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v11);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id WeakRetained = v5;
            uint64_t v15 = [WeakRetained variant];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            uint64_t v16 = [(PBUIWallpaperRemoteViewController *)self _observersForVariant:v15];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v27;
              do
              {
                for (uint64_t k = 0; k != v18; ++k)
                {
                  if (*(void *)v27 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  long long v21 = *(void **)(*((void *)&v26 + 1) + 8 * k);
                  if (objc_opt_respondsToSelector()) {
                    [v21 wallpaperDidChangeForVariant:v15];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
              }
              while (v18);
            }

            [(PBUIWallpaperRemoteViewController *)self _reconfigureBlurViewsForVariant:v15];
            [(PBUIWallpaperRemoteViewController *)self _updateBlurViewsForVariant:v15];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
            [WeakRetained wallpaperPresenterDidCompleteWallpaperChange:self];
          }
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v24);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_scene == a3)
  {
    double v7 = PBUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)uint64_t v18 = self;
      *(_WORD *)&v18[8] = 2112;
      double v19 = *(double *)&v6;
      _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Remote wallpaper controller %p scene did deactivate with error: %@", buf, 0x16u);
    }

    [(PBUISessionReconnectPolicy *)self->_reconnectPolicy sessionDidDisconnect];
    int64_t v8 = [(PBUIWallpaperRemoteViewController *)self _effectiveSceneMode];
    BOOL v9 = self->_missingEffectViewImages || [(NSMutableSet *)self->_pendingEffectViewImageSlots count] != 0;
    if (v8) {
      int v10 = 1;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v18 = v8 != 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v9;
      _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEFAULT, "shouldReactivateForSceneMode: %{BOOL}u\nshouldReactivateForEffectImages: %{BOOL}u\n", buf, 0xEu);
    }

    if (v10)
    {
      [(PBUISessionReconnectPolicy *)self->_reconnectPolicy sessionReconnectDelay];
      double v13 = v12;
      uint64_t v14 = PBUILogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)uint64_t v18 = self;
        *(_WORD *)&v18[8] = 2048;
        double v19 = v13;
        _os_log_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_DEFAULT, "Attempting reactivation of remote wallpaper controller %p scene in %0.3f seconds.", buf, 0x16u);
      }

      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PBUIWallpaperRemoteViewController_sceneDidDeactivate_withError___block_invoke;
      block[3] = &unk_1E62B2798;
      void block[4] = self;
      dispatch_after(v15, MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __66__PBUIWallpaperRemoteViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PBUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Reactivating remote wallpaper controller scene %p.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _setupScene];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v10 = a4;
  id v32 = a5;
  id v33 = a6;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  char v84 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v60[3] = &unk_1E62B34B0;
  v60[4] = &v61;
  uint64_t v11 = (void *)MEMORY[0x1C1872570](v60);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
  v55[3] = &unk_1E62B34B0;
  v55[4] = &v56;
  double v12 = (void *)MEMORY[0x1C1872570](v55);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  char v54 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_3;
  v52[3] = &unk_1E62B34B0;
  v52[4] = v53;
  double v13 = (void *)MEMORY[0x1C1872570](v52);
  uint64_t v14 = objc_alloc_init(PBUIWallpaperWindowSceneClientSettingsDiffInspector);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_4;
  v51[3] = &unk_1E62B34B0;
  v51[4] = &v81;
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenLegibilitySettingsWithBlock:v51];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_5;
  v50[3] = &unk_1E62B34B0;
  v50[4] = &v77;
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenLegibilitySettingsWithBlock:v50];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_6;
  v49[3] = &unk_1E62B34B0;
  v49[4] = &v73;
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenAverageColorWithBlock:v49];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_7;
  v48[3] = &unk_1E62B34B0;
  v48[4] = &v69;
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenContrastWithBlock:v48];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenContentStaticWithBlock:v13];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenContentStaticWithBlock:v13];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenContentLiveWallpaperWithBlock:v13];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenParallaxFactorWithBlock:v11];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenParallaxEnabledWithBlock:v11];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeHomescreenZoomFactorWithBlock:v11];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenParallaxFactorWithBlock:v12];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenParallaxEnabledWithBlock:v12];
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLockscreenZoomFactorWithBlock:v12];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_8;
  v47[3] = &unk_1E62B34B0;
  v47[4] = &v65;
  [(PBUIWallpaperWindowSceneClientSettingsDiffInspector *)v14 observeLiveWallpaperPlaybackStateWithBlock:v47];
  [v10 evaluateWithInspector:v14 context:0];
  dispatch_time_t v15 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  uint64_t v16 = v15;
  long long v37 = v11;
  id v38 = v10;
  long long v35 = v13;
  long long v36 = v12;
  long long v34 = v15;
  if (*((unsigned char *)v82 + 24))
  {
    uint64_t v17 = objc_msgSend(v15, "homescreenLegibilitySettings", v31, v32);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v18 = self->_homescreenObservers;
    uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v43 objects:v88 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v22 wallpaperLegibilitySettingsDidChange:v17 forVariant:1];
          }
        }
        uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v43 objects:v88 count:16];
      }
      while (v19);
    }

    uint64_t v11 = v37;
    id v10 = v38;
    double v13 = v35;
    double v12 = v36;
    uint64_t v16 = v34;
    [(PBUIWallpaperRemoteViewController *)self _reconfigureBlurViewsForVariant:1];
  }
  if (*((unsigned char *)v78 + 24))
  {
    uint64_t v23 = [v16 lockscreenLegibilitySettings];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v24 = self->_lockscreenObservers;
    uint64_t v25 = [(NSHashTable *)v24 countByEnumeratingWithState:&v39 objects:v87 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v24);
          }
          long long v28 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v28 wallpaperLegibilitySettingsDidChange:v23 forVariant:0];
          }
        }
        uint64_t v25 = [(NSHashTable *)v24 countByEnumeratingWithState:&v39 objects:v87 count:16];
      }
      while (v25);
    }

    uint64_t v11 = v37;
    id v10 = v38;
    double v13 = v35;
    double v12 = v36;
    uint64_t v16 = v34;
    [(PBUIWallpaperRemoteViewController *)self _reconfigureBlurViewsForVariant:0];
  }
  if (*((unsigned char *)v74 + 24) || *((unsigned char *)v70 + 24)) {
    [(PBUIWallpaperRemoteViewController *)self _updateFallbackView];
  }
  if (*((unsigned char *)v62 + 24)) {
    [(PBUIWallpaperRemoteViewController *)self _reconfigureBlurViewsForVariant:1];
  }
  if (*((unsigned char *)v57 + 24)) {
    [(PBUIWallpaperRemoteViewController *)self _reconfigureBlurViewsForVariant:0];
  }
  if (*((unsigned char *)v66 + 24))
  {
    long long v29 = PBUILogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = PBUIIrisWallpaperPlaybackStateDescription([v16 liveWallpaperPlaybackState]);
      *(_DWORD *)buf = 138543362;
      v86 = v30;
      _os_log_impl(&dword_1BC4B3000, v29, OS_LOG_TYPE_DEFAULT, "Live wallpaper playback state changed. Playback state: %{public}@", buf, 0xCu);
    }
    -[PBUIRemoteIrisWallpaperPlayer _setIrisPlaybackState:](self->_remoteIrisWallpaperPlayer, "_setIrisPlaybackState:", [v16 liveWallpaperPlaybackState]);
  }

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_7(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperRemoteViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PBUIWallpaperRemoteViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E62B2C38;
  id v7 = v6;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"scenePresenter"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 992) withName:@"reconnectPolicy"];
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 1000) allObjects];
  [v4 appendArraySection:v5 withName:@"lockscreenObservers" skipIfEmpty:1 objectTransformer:&__block_literal_global_122];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 1008) allObjects];
  [v6 appendArraySection:v7 withName:@"homescreenObservers" skipIfEmpty:1 objectTransformer:&__block_literal_global_127];

  id v8 = *(void **)(a1 + 32);
  BOOL v9 = [*(id *)(*(void *)(a1 + 40) + 1016) allObjects];
  [v8 appendArraySection:v9 withName:@"lockscreenBlurViews" skipIfEmpty:1];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 1024) allObjects];
  [v10 appendArraySection:v11 withName:@"homescreenBlurViews" skipIfEmpty:1];

  double v12 = *(void **)(a1 + 32);
  double v13 = [*(id *)(*(void *)(a1 + 40) + 1048) allObjects];
  [v12 appendArraySection:v13 withName:@"disallowRasterizationReasonsLockVariant" skipIfEmpty:1];

  uint64_t v14 = *(void **)(a1 + 32);
  dispatch_time_t v15 = [*(id *)(*(void *)(a1 + 40) + 1040) allObjects];
  [v14 appendArraySection:v15 withName:@"disallowRasterizationReasonsHomeVariant" skipIfEmpty:1];

  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 1064) allObjects];
  [v16 appendArraySection:v17 withName:@"hideWallpaperReasonsLockVariant" skipIfEmpty:1];

  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 1056) allObjects];
  [v18 appendArraySection:v19 withName:@"hideWallpaperReasonsHomeVariant" skipIfEmpty:1];

  uint64_t v20 = *(void **)(a1 + 32);
  long long v21 = [*(id *)(*(void *)(a1 + 40) + 1072) allObjects];
  [v20 appendArraySection:v21 withName:@"wallpaperAnimationSuspendedReasons" skipIfEmpty:1];

  long long v22 = *(void **)(a1 + 32);
  uint64_t v23 = [*(id *)(*(void *)(a1 + 40) + 1080) allObjects];
  [v22 appendArraySection:v23 withName:@"wallpaperRequiredReasons" skipIfEmpty:1];

  uint64_t v24 = *(void **)(a1 + 32);
  uint64_t v25 = [*(id *)(*(void *)(a1 + 40) + 1088) allObjects];
  [v24 appendArraySection:v25 withName:@"homescreenChangesDelayedReasons" skipIfEmpty:1];

  uint64_t v26 = *(void **)(a1 + 32);
  long long v27 = [*(id *)(*(void *)(a1 + 40) + 1096) allObjects];
  [v26 appendArraySection:v27 withName:@"scaleAssertions" skipIfEmpty:1];

  long long v28 = *(void **)(a1 + 32);
  long long v29 = [*(id *)(*(void *)(a1 + 40) + 1104) allObjects];
  [v28 appendArraySection:v29 withName:@"sceneModeAssertions" skipIfEmpty:1];

  long long v30 = *(void **)(a1 + 32);
  id v31 = [*(id *)(*(void *)(a1 + 40) + 1112) allObjects];
  [v30 appendArraySection:v31 withName:@"externalSceneModeAssertionActions" skipIfEmpty:1];

  id v32 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1120) withName:@"sceneModeAssertionForViewMode"];
  id v33 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1136) withName:@"scenePresentationView"];
  id v34 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1144) withName:@"missingEffectViewImages" ifEqualTo:1];
  long long v35 = *(void **)(a1 + 32);
  long long v36 = [*(id *)(*(void *)(a1 + 40) + 1152) allObjects];
  [v35 appendArraySection:v36 withName:@"pendingEffectViewImageSlots" skipIfEmpty:1];

  id v37 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1160) withName:@"eventQueue"];
  id v38 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1168) withName:@"remoteIrisWallpaperPlayer"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 1184) withName:@"cachingIdentifier"];
  long long v39 = *(void **)(a1 + 32);
  long long v40 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:*(void *)(*(void *)(a1 + 40) + 1192)];
  id v41 = (id)[v39 appendObject:v40 withName:@"wallpaperConfigurationManager"];

  long long v42 = (void *)MEMORY[0x1E4F4F718];
  long long v43 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1200));
  long long v45 = [v42 succinctDescriptionForObject:WeakRetained];
  id v46 = (id)[v43 appendObject:v45 withName:@"wallpaperPresentingDelegate"];

  v47 = *(void **)(a1 + 32);
  id v48 = PBUIStringForWallpaperVariant(*(void *)(*(void *)(a1 + 40) + 1208));
  [v47 appendString:v48 withName:@"activeVariant"];

  id v49 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1128) withName:@"sceneDeactivationTimer" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 976) withName:@"scene"];
}

uint64_t __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] succinctDescriptionForObject:a2];
}

uint64_t __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] succinctDescriptionForObject:a2];
}

- (id)succinctDescription
{
  id v2 = [(PBUIWallpaperRemoteViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)_performWithLiveScene:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F4F748];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke;
  id v11 = &unk_1E62B2D78;
  double v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 eventWithName:@"Perform with live scene" handler:&v8];
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v7, 1, v8, v9, v10, v11, v12);
}

void __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 976) isActive])
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke_2;
    v5[3] = &unk_1E62B34F8;
    id v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v3 _setupSceneWithCompletion:v5];
  }
}

uint64_t __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _performWithLiveScene:*(void *)(a1 + 40)];
  }
}

- (void)_updateWallpaperSceneSettingsWithTransitionBlock:(id)a3
{
  id v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithTransitionBlock___block_invoke;
  v7[3] = &unk_1E62B3520;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBScene *)scene updateSettingsWithTransitionBlock:v7];
}

id __86__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
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

  if (v7)
  {
    id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = 0;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 976) isActive]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3
{
}

- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3 postUpdateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F4F748];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke;
  v12[3] = &unk_1E62B3548;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 eventWithName:@"Update scene settings" handler:v12];
  [(BSEventQueue *)self->_eventQueue executeOrInsertEvent:v11 atPosition:1];
}

void __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 976);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke_2;
  v4[3] = &unk_1E62B3168;
  id v5 = *(id *)(a1 + 40);
  [v2 updateSettingsWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_setupScene
{
}

- (void)_setupSceneWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_scene == 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke;
  v14[3] = &unk_1E62B3570;
  char v6 = !v5;
  char v16 = v6;
  void v14[4] = self;
  id v15 = v4;
  id v7 = v4;
  id v8 = (void *)MEMORY[0x1C1872570](v14);
  id v9 = (void *)MEMORY[0x1E4F4F748];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_213;
  v12[3] = &unk_1E62B2D78;
  v12[4] = self;
  id v13 = v8;
  id v10 = v8;
  id v11 = [v9 eventWithName:@"Setup scene" handler:v12];
  [(BSEventQueue *)self->_eventQueue executeOrInsertEvent:v11 atPosition:1];
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Scene setup completed. Success: %{BOOL}u Error: %{public}@", (uint8_t *)v9, 0x12u);
  }

  if (a2)
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _notifyAllObserversOfNewWallpaperScene];
      [*(id *)(a1 + 32) _updateFallbackView];
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v7 + 1144))
    {
      if (![*(id *)(v7 + 1152) count]) {
        goto LABEL_10;
      }
      uint64_t v7 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v7 + 1144) = 0;
    [*(id *)(*(void *)(a1 + 32) + 1152) removeAllObjects];
    [*(id *)(a1 + 32) _reconfigureBlurViewsForVariant:1];
    [*(id *)(a1 + 32) _reconfigureBlurViewsForVariant:0];
    [*(id *)(a1 + 32) _updateBlurViewsForVariant:1];
    [*(id *)(a1 + 32) _updateBlurViewsForVariant:0];
  }
LABEL_10:
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_213(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 976))
  {
    id v2 = PBUILogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 976);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v3;
      _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "Activating existing wallpaper scene %{public}@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    char v6 = *(void **)(v5 + 976);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_214;
    v29[3] = &unk_1E62B3598;
    v29[4] = v5;
    [v6 performUpdate:v29 withCompletion:v4];
  }
  else
  {
    if (_PBUIWallpaperRemoteViewControllerSceneWorkspace_onceToken != -1) {
      dispatch_once(&_PBUIWallpaperRemoteViewControllerSceneWorkspace_onceToken, &__block_literal_global_749);
    }
    id v7 = (id)_PBUIWallpaperRemoteViewControllerSceneWorkspace_workspace;
    uint64_t v8 = [v7 createScene:&__block_literal_global_218];
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(v9 + 976);
    *(void *)(v9 + 976) = v8;

    id v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 976);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v12;
      _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEFAULT, "Created new wallpaper scene %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setDelegate:");
    id v13 = [*(id *)(*(void *)(a1 + 32) + 976) layerManager];
    [v13 addObserver:*(void *)(a1 + 32)];

    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 976);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_228;
    void v28[3] = &unk_1E62B3628;
    v28[4] = v14;
    [v15 configureParameters:v28];
    char v16 = [*(id *)(*(void *)(a1 + 32) + 976) uiPresentationManager];
    uint64_t v17 = PBUIWallpaperWorkspaceIdentifier_block_invoke_sequenceNumber++;
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIWallpaperRemoteViewController-%ld", v17);
    uint64_t v19 = [v16 createPresenterWithIdentifier:v18];
    uint64_t v20 = *(void *)(a1 + 32);
    long long v21 = *(void **)(v20 + 984);
    *(void *)(v20 + 984) = v19;

    [*(id *)(*(void *)(a1 + 32) + 984) modifyPresentationContext:&__block_literal_global_241];
    [*(id *)(*(void *)(a1 + 32) + 984) activate];
    long long v22 = PBUILogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v22, OS_LOG_TYPE_DEFAULT, "Installing live scene view on scene setup", buf, 2u);
    }

    uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 984) presentationView];
    uint64_t v24 = [*(id *)(a1 + 32) view];
    [v24 bounds];
    objc_msgSend(v23, "setFrame:");
    [v23 setAutoresizingMask:18];
    [v24 setClipsToBounds:1];
    [v24 addSubview:v23];
    [v24 sendSubviewToBack:v23];
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void **)(v25 + 1136);
    *(void *)(v25 + 1136) = v23;
    id v27 = v23;

    [*(id *)(*(void *)(a1 + 32) + 976) performUpdate:&__block_literal_global_244 withCompletion:*(void *)(a1 + 40)];
  }
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_214(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "_modifySceneSettings:forSceneMode:", v3, objc_msgSend(v2, "_effectiveSceneMode"));
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F96408];
  id v3 = a2;
  id v6 = [v2 identityForAngelJobLabel:@"com.apple.PaperBoard"];
  [v3 setIdentifier:@"sceneID:com.apple.PaperBoard-wallpaper"];
  uint64_t v4 = +[FBSSceneSpecification specification];
  [v3 setSpecification:v4];

  uint64_t v5 = [MEMORY[0x1E4F62470] identityForProcessIdentity:v6];
  [v3 setClientIdentity:v5];
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_228(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2_229;
  v3[3] = &unk_1E62B35E0;
  v3[4] = *(void *)(a1 + 32);
  id v2 = a2;
  [v2 updateSettingsWithBlock:v3];
  [v2 updateClientSettingsWithBlock:&__block_literal_global_233];
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2_229(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v14 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v14;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1200));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    uint64_t v7 = [WeakRetained wallpaperPresenter:*(void *)(a1 + 32) requestsOrientationWithRefresh:1];
  }
  __int16 v10 = [MEMORY[0x1E4F62420] mainConfiguration];
  [v10 bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setInterfaceOrientation:v7];
  [v6 setDisplayConfiguration:v10];
  id v11 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v6, "setUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));

  [*(id *)(a1 + 32) _modifySceneSettings:v6 forSceneMode:3];
  [v6 setWallpaperVariant:*(void *)(*(void *)(a1 + 32) + 1208)];
  [v6 setHomescreenWallpaperAlpha:1.0];
  [v6 setLockscreenWallpaperAlpha:1.0];
  [v6 setLockscreenOnlyWallpaperAlpha:1.0];
  objc_msgSend(v6, "setLockscreenWallpaperContentsRect:", 0.0, 0.0, 1.0, 1.0);
  [v6 setCachingIdentifier:*(void *)(*(void *)(a1 + 32) + 1184)];
  uint64_t v12 = objc_opt_new();
  [v6 setHomescreenStyleTransitionState:v12];

  id v13 = objc_opt_new();
  [v6 setLockscreenStyleTransitionState:v13];
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  [v5 setHomescreenMinimumWallpaperScale:1.0];
  [v5 setLockscreenMinimumWallpaperScale:1.0];
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setClippingDisabled:1];
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
}

- (id)_sceneSettings
{
  id v2 = [(FBScene *)self->_scene settings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_sceneClientSettings
{
  id v2 = [(FBScene *)self->_scene clientSettings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_updateFallbackView
{
  unint64_t v3 = [(PBUIWallpaperRemoteViewController *)self activeVariant];
  if (v3 < 2)
  {
    uint64_t v4 = [(PBUIWallpaperRemoteViewController *)self averageColorForVariant:v3];
LABEL_5:
    id v6 = (id)v4;
    goto LABEL_7;
  }
  if (v3 == -1)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] systemTealColor];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:
  id v5 = [(PBUIWallpaperRemoteViewController *)self view];
  [v5 setBackgroundColor:v6];
}

- (void)_notifyAllObserversOfNewWallpaperScene
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PBUIWallpaperRemoteViewController *)self _sceneClientSettings];
  uint64_t v4 = [v3 homescreenLegibilitySettings];
  uint64_t v18 = v3;
  id v5 = [v3 lockscreenLegibilitySettings];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self;
  id v6 = self->_homescreenObservers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 wallpaperWillChangeForVariant:1];
        }
        if (objc_opt_respondsToSelector()) {
          [v11 wallpaperDidChangeForVariant:1];
        }
        if (objc_opt_respondsToSelector()) {
          [v11 wallpaperLegibilitySettingsDidChange:v4 forVariant:1];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = v19->_lockscreenObservers;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 wallpaperWillChangeForVariant:0];
        }
        if (objc_opt_respondsToSelector()) {
          [v17 wallpaperDidChangeForVariant:0];
        }
        if (objc_opt_respondsToSelector()) {
          [v17 wallpaperLegibilitySettingsDidChange:v5 forVariant:0];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  [(PBUIWallpaperRemoteViewController *)v19 _reconfigureBlurViewsForVariant:1];
  [(PBUIWallpaperRemoteViewController *)v19 _reconfigureBlurViewsForVariant:0];
  [(PBUIWallpaperRemoteViewController *)v19 _updateBlurViewsForVariant:1];
  [(PBUIWallpaperRemoteViewController *)v19 _updateBlurViewsForVariant:0];
}

- (id)_observersForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenObservers;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenObservers;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)_disallowRasterizationReasonsForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__disallowRasterizationReasonsHomeVariant;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__disallowRasterizationReasonsLockVariant;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)_hideWallpaperReasonsForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__hideWallpaperReasonsHomeVariant;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    uint64_t v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__hideWallpaperReasonsLockVariant;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return 0;
}

- (id)_simpleAssertionWithReasonsSet:(id)a3 identifier:(id)a4 reason:(id)a5 updater:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PBUIWallpaperRemoteViewController.m", 1630, @"Invalid parameter not satisfying: %@", @"reasonsSet" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_10:
      long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"PBUIWallpaperRemoteViewController.m", 1632, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PBUIWallpaperRemoteViewController.m", 1631, @"Invalid parameter not satisfying: %@", @"updater" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_11:
  long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PBUIWallpaperRemoteViewController.m", 1633, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_5:
  objc_initWeak(&location, v11);
  id v16 = objc_alloc(MEMORY[0x1E4F4F838]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __94__PBUIWallpaperRemoteViewController__simpleAssertionWithReasonsSet_identifier_reason_updater___block_invoke;
  v25[3] = &unk_1E62B3670;
  objc_copyWeak(&v28, &location);
  id v17 = v13;
  id v26 = v17;
  id v18 = v15;
  id v27 = v18;
  uint64_t v19 = (void *)[v16 initWithIdentifier:v12 forReason:v17 invalidationBlock:v25];
  [v11 addObject:v17];
  (*((void (**)(id, void))v18 + 2))(v18, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v19;
}

void __94__PBUIWallpaperRemoteViewController__simpleAssertionWithReasonsSet_identifier_reason_updater___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObject:*(void *)(a1 + 32)];
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [WeakRetained count] == 0);
}

- (double)_wallpaperScaleForVariant:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_wallpaperScaleAssertions;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    double v8 = 1.0;
    double v9 = 1.0;
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (-[PBUIWallpaperScaleAssertion variant](v13) == a3)
          {
            double v14 = -[PBUIWallpaperScaleAssertion scale](v13);
            if (v14 < v9) {
              double v9 = v14;
            }
            if (v14 >= v8) {
              double v8 = v14;
            }
          }
        }
        uint64_t v10 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    if (v8 <= 1.0) {
      return v9;
    }
    else {
      return v8;
    }
  }
  return v5;
}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  id v4 = a3;
  [(PBUIWallpaperRemoteViewController *)self _wallpaperScaleForVariant:[(PBUIWallpaperRemoteViewController *)self activeVariant]];
  CGFloat v6 = v5;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = (void *)MEMORY[0x1E4F4F898];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PBUIWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke;
    v10[3] = &unk_1E62B3698;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&v6;
    [v7 animateWithFactory:v4 actions:v10 completion:&__block_literal_global_270];
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    scenePresentationView = self->_scenePresentationView;
    CGAffineTransformMakeScale(&v9, v5, v5);
    [(UIScenePresentation *)scenePresentationView setTransform:&v9];
  }
}

void __79__PBUIWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 142);
    CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
    [v4 setTransform:&v5];
  }
}

- (id)_blurViewsForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenBlurViews;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (!a3)
  {
    id v4 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenBlurViews;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)_reconfigureBlurViewsForVariant:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = -[PBUIWallpaperRemoteViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) reconfigureFromProvider];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateBlurViewsForVariant:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[PBUIWallpaperRemoteViewController _invalidateBlurCacheForVariant:](self, "_invalidateBlurCacheForVariant:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = -[PBUIWallpaperRemoteViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) updateImageFromProviderForWallpaperMode:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_cacheBlurImageForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 actualStyle:(int64_t)a5 traitCollection:(id)a6 image:(id)a7 imageURL:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  long long v17 = -[PBUIFakeBlurConfiguration initWithVariant:style:traitCollection:]([PBUIFakeBlurConfiguration alloc], a3, a4, v16);

  long long v18 = -[PBUIFakeBlurAsset initWithActualStyle:imageURL:image:]((id *)[PBUIFakeBlurAsset alloc], (void *)a5, v14, v15);
  if (!self->_fakeBlurCache)
  {
    long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
    fakeBlurCache = self->_fakeBlurCache;
    self->_fakeBlurCache = v19;
  }
  uint64_t v21 = PBUILogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543618;
    long long v23 = v18;
    __int16 v24 = 2114;
    long long v25 = v17;
    _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, "Caching asset %{public}@ for configuration %{public}@", (uint8_t *)&v22, 0x16u);
  }

  [(NSMutableDictionary *)self->_fakeBlurCache setObject:v18 forKeyedSubscript:v17];
}

- (id)_cachedBlurAssetForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 traitCollection:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = -[PBUIFakeBlurConfiguration initWithVariant:style:traitCollection:]([PBUIFakeBlurConfiguration alloc], a3, a4, v8);

  long long v10 = [(NSMutableDictionary *)self->_fakeBlurCache objectForKeyedSubscript:v9];
  long long v11 = PBUILogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEFAULT, "Retrieved cached asset %{public}@ for configuration %{public}@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)_invalidateBlurCacheForVariant:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  fakeBlurCache = self->_fakeBlurCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __68__PBUIWallpaperRemoteViewController__invalidateBlurCacheForVariant___block_invoke;
  v9[3] = &__block_descriptor_40_e61_B32__0__PBUIFakeBlurConfiguration_8__PBUIFakeBlurAsset_16_B24l;
  v9[4] = a3;
  uint64_t v5 = [(NSMutableDictionary *)fakeBlurCache keysOfEntriesPassingTest:v9];
  uint64_t v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v11 = v5;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating cached assets for configurations %{public}@", buf, 0xCu);
  }

  if (v5)
  {
    uint64_t v7 = self->_fakeBlurCache;
    id v8 = [v5 allObjects];
    [(NSMutableDictionary *)v7 removeObjectsForKeys:v8];
  }
}

BOOL __68__PBUIWallpaperRemoteViewController__invalidateBlurCacheForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 == *(void *)(a1 + 32);
}

- (id)_blurImageFromURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PBUIWallpaperDataForFileURL(v3, 0);
  if (v4)
  {
    CFTypeRef cf = 0;
    CFTypeRef v17 = 0;
    CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      CFArrayRef v6 = ImagesFromData;
      ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(ImagesFromData, 0);
      objc_opt_class();
      objc_opt_isKindOfClass();
      uint64_t v9 = (void *)MEMORY[0x1E4F42D90];
      id v10 = 0;
      long long v11 = [v9 mainScreen];
      [v11 scale];
      double v13 = v12;

      id v14 = [[PBUIWallpaperImage alloc] initWithCGImage:ValueAtIndex scale:0 orientation:v3 wallpaperFileURL:v13];
      CFRelease(v6);
    }
    else
    {
      id v8 = PBUILogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(PBUIWallpaperRemoteViewController *)(uint64_t)v3 _blurImageFromURL:v8];
      }

      id v14 = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (int64_t)_effectiveSceneMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_sceneModeAssertions;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sceneMode", (void)v10);
        if (v5 <= v8) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_modifySceneSettings:(id)a3 forSceneMode:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (uint64_t)*(&off_1E62B3848 + a4);
    }
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Modifying scene settings for scene mode %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ((unint64_t)a4 <= 3)
  {
    [v5 setActivityMode:(char)(0xFFFF00u >> (8 * a4))];
    [v5 setForeground:(0xCu >> (a4 & 0xF)) & 1];
  }
}

- (void)_scheduleSceneDeactivation
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PBUIWallpaperRemoteViewController__scheduleSceneDeactivation__block_invoke;
  v6[3] = &unk_1E62B3700;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:5.0];
  sceneDeactivationTimer = self->_sceneDeactivationTimer;
  self->_sceneDeactivationTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__PBUIWallpaperRemoteViewController__scheduleSceneDeactivation__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if (![WeakRetained _effectiveSceneMode])
    {
      uint64_t v3 = PBUILogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating idle wallpaper scene due to inactivity.", (uint8_t *)v5, 2u);
      }

      [v2[122] deactivateWithTransitionContext:0];
    }
    id v4 = v2[141];
    v2[141] = 0;
  }
}

- (void)_cancelSceneDeactivation
{
  [(NSTimer *)self->_sceneDeactivationTimer invalidate];
  sceneDeactivationTimer = self->_sceneDeactivationTimer;
  self->_sceneDeactivationTimer = 0;
}

- (void)_updateSceneMode
{
}

- (void)_updateSceneModeWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PBUIWallpaperRemoteViewController *)self _effectiveSceneMode];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke;
  v10[3] = &unk_1E62B3750;
  void v10[4] = self;
  int64_t v12 = v5;
  id v6 = v4;
  id v11 = v6;
  id v7 = (void *)MEMORY[0x1C1872570](v10);
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (!v5)
    {
      eventQueue = self->_eventQueue;
      uint64_t v9 = [MEMORY[0x1E4F4F748] eventWithName:@"Update scene mode to idle" handler:v7];
      [(BSEventQueue *)eventQueue executeOrInsertEvent:v9 atPosition:1];
    }
  }
  else
  {
    [(PBUIWallpaperRemoteViewController *)self _performWithLiveScene:v7];
  }
}

void __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 976) settings];
  uint64_t v3 = (void *)[v2 mutableCopy];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
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

  [*(id *)(a1 + 32) _modifySceneSettings:v7 forSceneMode:*(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 976);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke_2;
  v11[3] = &unk_1E62B3728;
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v11[4] = v8;
  id v12 = v10;
  [v9 updateSettings:v7 withTransitionContext:0 completion:v11];
}

uint64_t __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = (void *)a1[4];
  if (v2) {
    [v3 _cancelSceneDeactivation];
  }
  else {
    [v3 _scheduleSceneDeactivation];
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4
{
  return [(PBUIWallpaperRemoteViewController *)self _acquireSceneModeAssertionForReason:a3 sceneMode:a4 completion:0];
}

- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = [_PBUIWallpaperRemoteViewControllerSceneModeAssertion alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __94__PBUIWallpaperRemoteViewController__acquireSceneModeAssertionForReason_sceneMode_completion___block_invoke;
  long long v19 = &unk_1E62B3778;
  objc_copyWeak(&v20, &location);
  id v11 = [(_PBUIWallpaperRemoteViewControllerSceneModeAssertion *)v10 initWithIdentifier:@"PBUIWallpaperRemoteViewController.sceneMode" forReason:v8 sceneMode:a4 invalidationBlock:&v16];
  sceneModeAssertions = self->_sceneModeAssertions;
  if (!sceneModeAssertions)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v16, v17, v18, v19);
    uint64_t v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    id v14 = self->_sceneModeAssertions;
    self->_sceneModeAssertions = v13;

    sceneModeAssertions = self->_sceneModeAssertions;
  }
  -[NSHashTable addObject:](sceneModeAssertions, "addObject:", v11, v16, v17, v18, v19);
  [(PBUIWallpaperRemoteViewController *)self _updateSceneModeWithCompletion:v9];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v11;
}

void __94__PBUIWallpaperRemoteViewController__acquireSceneModeAssertionForReason_sceneMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[138] removeObject:v5];
    [v4 _updateSceneMode];
  }
}

- (void)_addStateCaptureHandlers
{
  id v3 = MEMORY[0x1E4F14428];
  objc_initWeak(location, self);
  stateCaptureHandles = self->_stateCaptureHandles;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIWallpaperRemoteViewController - %p", self);
  v18[1] = (id)MEMORY[0x1E4F143A8];
  v18[2] = (id)3221225472;
  v18[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke;
  v18[4] = &unk_1E62B37A0;
  objc_copyWeak(&v19, location);
  id v6 = BSLogAddStateCaptureBlockWithTitle();
  [(NSMutableSet *)stateCaptureHandles addObject:v6];

  id v7 = self->_stateCaptureHandles;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIWallpaperRemoteViewController - %p - Scene", self);
  v17[1] = (id)MEMORY[0x1E4F143A8];
  v17[2] = (id)3221225472;
  v17[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_2;
  v17[4] = &unk_1E62B37A0;
  objc_copyWeak(v18, location);
  id v9 = BSLogAddStateCaptureBlockWithTitle();
  [(NSMutableSet *)v7 addObject:v9];

  uint64_t v10 = self->_stateCaptureHandles;
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIWallpaperRemoteViewController - %p - SceneMode", self);
  v16[1] = (id)MEMORY[0x1E4F143A8];
  v16[2] = (id)3221225472;
  v16[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_3;
  v16[4] = &unk_1E62B37A0;
  objc_copyWeak(v17, location);
  id v12 = BSLogAddStateCaptureBlockWithTitle();
  [(NSMutableSet *)v10 addObject:v12];

  uint64_t v13 = self->_stateCaptureHandles;
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIWallpaperRemoteViewController - %p - WallpaperConfigurationManager", self);
  objc_copyWeak(v16, location);
  uint64_t v15 = BSLogAddStateCaptureBlockWithTitle();
  [(NSMutableSet *)v13 addObject:v15];

  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained descriptionWithMultilinePrefix:0];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_1F1606C18;
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained[122] debugDescription];
  }
  else
  {
    id v3 = &stru_1F1606C18;
  }

  return v3;
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  id v3 = &stru_1F1606C18;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[138] allObjects];
    uint64_t v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_303);
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    else {
      id v7 = &stru_1F1606C18;
    }
    id v3 = v7;
  }
  return v3;
}

uint64_t __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 description];
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained[149] description];
  }
  else
  {
    id v3 = &stru_1F1606C18;
  }

  return v3;
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager
{
  return self->_wallpaperConfigurationManager;
}

- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  return (PBUIWallpaperPresentingDelegate *)WeakRetained;
}

- (void)setWallpaperPresentingDelegate:(id)a3
{
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandles, 0);
  objc_storeStrong((id *)&self->_remoteIrisWallpaperPlayer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_pendingEffectViewImageSlots, 0);
  objc_storeStrong((id *)&self->_scenePresentationView, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationTimer, 0);
  objc_storeStrong((id *)&self->_sceneModeAssertionForViewAppeared, 0);
  objc_storeStrong((id *)&self->_externalSceneModeAssertionActions, 0);
  objc_storeStrong((id *)&self->_sceneModeAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_homescreenChangesDelayedReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperAnimationSuspendedReasons, 0);
  objc_storeStrong((id *)&self->_hideWallpaperReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_hideWallpaperReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_fakeBlurCache, 0);
  objc_storeStrong((id *)&self->_homescreenBlurViews, 0);
  objc_storeStrong((id *)&self->_lockscreenBlurViews, 0);
  objc_storeStrong((id *)&self->_homescreenObservers, 0);
  objc_storeStrong((id *)&self->_lockscreenObservers, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_53_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "Did not receive response for image request %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_blurImageFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BC4B3000, log, OS_LOG_TYPE_ERROR, "Error deserializing wallpaper image from URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end