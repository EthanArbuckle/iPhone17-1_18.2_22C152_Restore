@interface SBWallpaperController
+ (FBServiceClientAuthenticator)accessAuthenticator;
+ (SBWallpaperController)sharedInstance;
- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState;
- (BOOL)_isAcceptingOrientationChangesFromSource:(int64_t)a3;
- (BOOL)_isMaglevActive;
- (BOOL)_isTraitsArbiterWallpaperActive;
- (BOOL)homeScreenPosterMirrorsLock;
- (BOOL)homeScreenWallpaperDimming;
- (BOOL)isWindowIgnoredForReachability:(id)a3;
- (BOOL)posterHandlesWakeAnimation;
- (BOOL)posterHidesDimmingLayer;
- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5;
- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4;
- (BOOL)updateIrisWallpaperForStaticMode;
- (BSInvalidatable)batterySaverAnimationAssertion;
- (BSInvalidatable)wallpaperStyleAnimationAssertion;
- (CGRect)_screenBoundsForOrientation:(int64_t)a3;
- (NSString)cachingIdentifier;
- (NSString)description;
- (PBUIHomeVariantStyleState)currentHomeVariantStyleState;
- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer;
- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager;
- (PBUIWallpaperLegibilityProviding)legibilityProvider;
- (PBUIWallpaperPresenting)presenter;
- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate;
- (SBFWallpaperAggdLogger)wallpaperAggdLogger;
- (SBFWallpaperCoreAnalyticsLogger)wallpaperCoreAnalyticsLogger;
- (SBWallpaperController)init;
- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3;
- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3 cachingIdentifier:(id)a4;
- (SBWallpaperController)initWithWindowScene:(id)a3 orientation:(int64_t)a4 variant:(int64_t)a5 wallpaperConfigurationManager:(id)a6 cachingIdentifier:(id)a7;
- (SBWindowScene)windowScene;
- (UIGestureRecognizer)wallpaperGestureRecognizer;
- (UITraitCollection)fakeBlurViewOverrideTraitCollection;
- (double)contrastForVariant:(int64_t)a3;
- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (double)effectiveReachabilityYOffset;
- (double)homescreenWallpaperScale;
- (double)lockscreenWallpaperScale;
- (double)minimumHomescreenWallpaperScale;
- (double)minimumLockscreenWallpaperScale;
- (double)windowLevel;
- (id)_controlIdentityForExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5;
- (id)_posterQuickActionsConfigurationFromConfigurationRequest:(id)a3;
- (id)_wallpaperViewForVariant:(int64_t)a3;
- (id)_window;
- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3;
- (id)activeInterfaceOrientationSourcesDescriptions;
- (id)averageColorForVariant:(int64_t)a3;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5;
- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)embeddedWindowScene;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)requireWallpaperWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)suspendWallpaperAnimationForReason:(id)a3;
- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4;
- (int64_t)_WallpaperOrientationNotForYou;
- (int64_t)activeOrientationSource;
- (int64_t)activeVariant;
- (int64_t)defaultInterfaceOrientationForSource:(int64_t)a3;
- (int64_t)wallpaperPresenter:(id)a3 requestsOrientationWithRefresh:(BOOL)a4;
- (void)_batterySaverModeChanged:(id)a3;
- (void)_fetchUserTapEventsRequestedWithCompletionHandler:(id)a3;
- (void)_ingestPrimaryWallpaperLayersSnapshotIOSurface:(id)a3 floatingWallpaperLayerSnapshotIOSurface:(id)a4 snapshotScale:(double)a5 traitCollection:(id)a6 withCompletion:(id)a7;
- (void)_loadLastActiveConfigurations;
- (void)_motionEffectsChanged;
- (void)_noteSignificantTimeChanged:(id)a3;
- (void)_persistLastActiveHomeScreenPosterConfiguration:(id)a3;
- (void)_persistLastActiveLockScreenPosterConfiguration:(id)a3;
- (void)_reloadWallpaperAndFlushCaches:(BOOL)a3 completionHandler:(id)a4;
- (void)_saveWallpaperAggdKeysForLocations:(int64_t)a3 withConfiguration:(id)a4;
- (void)_saveWallpaperCoreAnalyticsForLocations:(int64_t)a3 withConfiguration:(id)a4;
- (void)_updateForLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4;
- (void)_updateScreenBlanked;
- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6;
- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)activateOrientationSource:(int64_t)a3;
- (void)activeActivityDidChangeForManager:(id)a3;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)addObserver:(id)a3 forVariant:(int64_t)a4;
- (void)addReachabilityObserver:(id)a3;
- (void)addWallpaperOverlay:(id)a3;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)cancelInProcessAnimations;
- (void)deactivateOrientationSource:(int64_t)a3;
- (void)dealloc;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)homeScreenPosterMirrorsLock;
- (void)noteHomeVariantStyleStateMayHaveUpdated;
- (void)orientationSource:(int64_t)a3 didRotateFromInterfaceOrientation:(int64_t)a4;
- (void)orientationSource:(int64_t)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)preheatWallpaperForVariant:(int64_t)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3 forVariant:(int64_t)a4;
- (void)removeReachabilityObserver:(id)a3;
- (void)removeWallpaperOverlay:(id)a3;
- (void)setActiveVariant:(int64_t)a3;
- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6;
- (void)setBatterySaverAnimationAssertion:(id)a3;
- (void)setExternalDisplayConfiguration:(id)a3;
- (void)setFakeBlurViewOverrideTraitCollection:(id)a3;
- (void)setHomeScreenWallpaperDimmed:(BOOL)a3;
- (void)setLockscreenOnlyWallpaperAlpha:(double)a3;
- (void)setOrientationProvider:(id)a3 forSource:(int64_t)a4;
- (void)setWallpaperAggdLogger:(id)a3;
- (void)setWallpaperCoreAnalyticsLogger:(id)a3;
- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5;
- (void)setWallpaperObscured:(BOOL)a3;
- (void)setWallpaperPresentingDelegate:(id)a3;
- (void)setWallpaperStyleAnimationAssertion:(id)a3;
- (void)setWindowLevel:(double)a3;
- (void)setWindowScene:(id)a3;
- (void)triggerPosterSignificantEvent;
- (void)triggerPosterTapEvent:(id)a3;
- (void)updateIrisWallpaperForInteractiveMode;
- (void)updateOrientationAfterSourceChange;
- (void)updatePosterSwitcherSnapshots;
- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4;
- (void)updateWallpaperAnimationWithProgress:(double)a3;
- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3;
- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5;
- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4;
- (void)wallpaperPresenter:(id)a3 didChangeWallpaperForLocations:(int64_t)a4 withConfiguration:(id)a5;
- (void)wallpaperPresenterDidCompleteWallpaperChange:(id)a3;
- (void)wallpaperServer:(id)a3 fetchContentCutoutBoundsForVariant:(int64_t)a4 orientation:(int64_t)a5 completionHandler:(id)a6;
- (void)wallpaperServer:(id)a3 fetchLimitedOcclusionBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchLockScreenMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchLockScreenTimeBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchObscurableBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchOriginalImageDataForVariant:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchOriginalVideoURLDataForVariant:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchSignificantEventsCounterForPosterWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 fetchThumbnailDataForVariant:(int64_t)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 handleQuickActionConfigurationRequest:(id)a4 completionHandler:(id)a5;
- (void)wallpaperServer:(id)a3 restoreDefaultWallpaperWithCompletionHandler:(id)a4;
- (void)wallpaperServer:(id)a3 setWallpaperColor:(id)a4 darkColor:(id)a5 forVariants:(int64_t)a6 completionHandler:(id)a7;
- (void)wallpaperServer:(id)a3 setWallpaperColorName:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6;
- (void)wallpaperServer:(id)a3 setWallpaperGradient:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6;
- (void)wallpaperServer:(id)a3 setWallpaperVideoWithWallpaperMode:(id)a4 cropRect:(CGRect)a5 wallpaperMode:(int64_t)a6 completionHandler:(id)a7;
- (void)wallpaperServer:(id)a3 triggerPosterSignificantEventCompletionHandler:(id)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SBWallpaperController

- (id)requireWallpaperWithReason:(id)a3
{
  return (id)[(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter requireWallpaperWithReason:a3];
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return (id)[(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter requireWallpaperRasterizationWithReason:a3];
}

- (BOOL)isWindowIgnoredForReachability:(id)a3
{
  id v3 = a3;
  v4 = +[SBReachabilityManager sharedInstance];
  v5 = [v4 ignoredWindows];
  char v6 = [v5 containsObject:v3];

  return v6;
}

+ (SBWallpaperController)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBWallpaperController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once_3 != -1) {
    dispatch_once(&sharedInstance___once_3, block);
  }
  v2 = (void *)sharedInstance___controller;
  return (SBWallpaperController *)v2;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  return (id)[(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setHomescreenWallpaperScale:a4 withAnimationFactory:a3];
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  return (id)[(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter suspendWallpaperAnimationForReason:a3];
}

- (void)deactivateOrientationSource:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableSet *)self->_activeOrientationSources count];
  activeOrientationSources = self->_activeOrientationSources;
  v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)activeOrientationSources removeObject:v7];

  v8 = BKLogOrientationGlobal();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      v9 = 0;
    }
    else {
      v9 = off_1E6B012B8[a3];
    }
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating wallpaper orientation source %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5 != [(NSMutableSet *)self->_activeOrientationSources count]) {
    [(SBWallpaperController *)self updateOrientationAfterSourceChange];
  }
}

- (void)cancelInProcessAnimations
{
}

- (void)activateOrientationSource:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableSet *)self->_activeOrientationSources count];
  activeOrientationSources = self->_activeOrientationSources;
  v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)activeOrientationSources addObject:v7];

  v8 = BKLogOrientationGlobal();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      v9 = 0;
    }
    else {
      v9 = off_1E6B012B8[a3];
    }
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Activating wallpaper orientation source %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5 != [(NSMutableSet *)self->_activeOrientationSources count]) {
    [(SBWallpaperController *)self updateOrientationAfterSourceChange];
  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int64_t orientation = self->_orientation;
  v8 = BKLogOrientationGlobal();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (orientation == a3)
  {
    if (v9)
    {
      int v10 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      __int16 v27 = 2048;
      double v28 = a4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Not animating wallpaper orientation to %{public}@ in %1.2f because it's already in that orientation", buf, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      v11 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      __int16 v27 = 2048;
      double v28 = a4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Animating wallpaper orientation to %{public}@ in %1.2f", buf, 0x16u);
    }
    self->_int64_t orientation = a3;
    [(SBWallpaperController *)self cancelInProcessAnimations];
    if (![(SBWallpaperController *)self _isTraitsArbiterWallpaperActive]
      && [MEMORY[0x1E4F83BB0] supportsLandscapeWallpaperContents])
    {
      if ([(SBWallpaperController *)self _isMaglevActive])
      {
        switch(a3)
        {
          case 1:
            double v12 = 0.0;
            break;
          case 3:
            double v12 = 1.57079633;
            break;
          case 4:
            double v12 = -1.57079633;
            break;
          case 2:
            double v12 = v12 + -3.14159265;
            break;
          default:
            double v12 = 3.14159265;
            if (a3 != 2) {
              double v12 = 0.0;
            }
            break;
        }
        wallpaperContainerView = self->_wallpaperContainerView;
        CGAffineTransformMakeRotation(&v23, v12);
        UIIntegralTransform();
        [(UIView *)wallpaperContainerView setTransform:v24];
        v16 = self->_wallpaperContainerView;
        v17 = [MEMORY[0x1E4F42D90] mainScreen];
        [v17 _referenceBounds];
        -[UIView setBounds:](v16, "setBounds:");

        v18 = self->_wallpaperContainerView;
        [(UIView *)v18 bounds];
        double MidX = CGRectGetMidX(v30);
        [(UIView *)self->_wallpaperContainerView bounds];
        -[UIView setCenter:](v18, "setCenter:", MidX, CGRectGetMidY(v31));
      }
      else
      {
        v13 = self->_wallpaperContainerView;
        switch(a3)
        {
          case 1:
            double v14 = 0.0;
            break;
          case 3:
            double v14 = 1.57079633;
            break;
          case 4:
            double v14 = -1.57079633;
            break;
          default:
            double v14 = 3.14159265;
            if (a3 != 2) {
              double v14 = 0.0;
            }
            break;
        }
        CGAffineTransformMakeRotation(&v21, v14);
        UIIntegralTransform();
        [(UIView *)v13 setTransform:v22];
        v20 = self->_wallpaperContainerView;
        [(UIWindow *)self->_wallpaperWindow bounds];
        -[UIView setFrame:](v20, "setFrame:");
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter noteWillAnimateToInterfaceOrientation:a3 duration:a4];
    }
    else if (objc_opt_respondsToSelector())
    {
      [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter noteWillAnimateToInterfaceOrientation:a3];
    }
  }
}

- (int64_t)wallpaperPresenter:(id)a3 requestsOrientationWithRefresh:(BOOL)a4
{
  if (a4) {
    [(SBWallpaperController *)self updateOrientationAfterSourceChange];
  }
  return self->_orientation;
}

- (void)updateOrientationAfterSourceChange
{
  int64_t v3 = [(SBWallpaperController *)self activeOrientationSource];
  if ([(SBWallpaperController *)self _isAcceptingOrientationChangesFromSource:v3])
  {
    int64_t v4 = [(SBWallpaperController *)self defaultInterfaceOrientationForSource:v3];
    if (v4)
    {
      [(SBWallpaperController *)self willAnimateRotationToInterfaceOrientation:v4 duration:0.0];
    }
  }
}

- (int64_t)defaultInterfaceOrientationForSource:(int64_t)a3
{
  orientationProviders = self->_orientationProviders;
  char v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMapTable *)orientationProviders objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v7 interfaceOrientationForWallpaperController:self];
  }
  else
  {
    if (a3 != 1)
    {
      int64_t v9 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = [(id)SBApp activeInterfaceOrientation];
  }
  int64_t v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)_isAcceptingOrientationChangesFromSource:(int64_t)a3
{
  return [(SBWallpaperController *)self activeOrientationSource] == a3;
}

- (int64_t)activeOrientationSource
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_activeOrientationSources;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "integerValue", (void)v10);
        if (v8 > v5) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  return [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setWallpaperStyle:a3 forPriority:a4 forVariant:a5 withAnimationFactory:a6];
}

- (double)effectiveReachabilityYOffset
{
  v2 = +[SBReachabilityManager sharedInstance];
  [v2 effectiveReachabilityYOffset];
  double v4 = v3;

  return v4;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return (id)[(PBUIWallpaperLegibilityProviding *)self->_wallpaperLegibilityProvider legibilitySettingsForVariant:a3];
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
}

- (void)addReachabilityObserver:(id)a3
{
  id v3 = a3;
  id v4 = +[SBReachabilityManager sharedInstance];
  [v4 addObserver:v3];
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  wallpaperPresenter = self->_wallpaperPresenter;
  return (id)[(PBUIWallpaperPresenting_Staged *)wallpaperPresenter newFakeBlurViewForVariant:a3 style:a4 transformOptions:a5];
}

void __39__SBWallpaperController_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SBWallpaperController);
  id v3 = (void *)sharedInstance___controller;
  sharedInstance___controller = (uint64_t)v2;

  id v4 = +[SBWallpaperServer sharedInstance];
  [v4 setDelegate:sharedInstance___controller];

  id v6 = +[SBWallpaperServer sharedInstance];
  int64_t v5 = [*(id *)(a1 + 32) accessAuthenticator];
  [v6 setAccessAuthenticator:v5];
}

+ (FBServiceClientAuthenticator)accessAuthenticator
{
  if (accessAuthenticator_onceToken != -1) {
    dispatch_once(&accessAuthenticator_onceToken, &__block_literal_global_150);
  }
  v2 = (void *)accessAuthenticator___WallpaperAuthenticator;
  return (FBServiceClientAuthenticator *)v2;
}

void __44__SBWallpaperController_accessAuthenticator__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.wallpaper-access" additionalCredentials:3];
  v1 = (void *)accessAuthenticator___WallpaperAuthenticator;
  accessAuthenticator___WallpaperAuthenticator = v0;
}

- (SBWallpaperController)initWithWindowScene:(id)a3 orientation:(int64_t)a4 variant:(int64_t)a5 wallpaperConfigurationManager:(id)a6 cachingIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v87.receiver = self;
  v87.super_class = (Class)SBWallpaperController;
  uint64_t v15 = [(SBWallpaperController *)&v87 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_23;
  }
  id v77 = v13;
  objc_storeWeak((id *)&v15->_windowScene, v12);
  int64_t v78 = a4;
  id v79 = v14;
  v16->_int64_t orientation = a4;
  v16->_displayedVariant = -1;
  uint64_t v17 = [v14 copy];
  cachingIdentifier = v16->_cachingIdentifier;
  v16->_cachingIdentifier = (NSString *)v17;

  objc_storeStrong((id *)&v16->_wallpaperConfigurationManager, a6);
  v76 = [MEMORY[0x1E4F83BF8] rootSettings];
  [v76 addKeyObserver:v16];
  v19 = [[_SBWallpaperSecureWindow alloc] initWithWindowScene:v12];
  v20 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl()) {
    [(_SBWallpaperSecureWindow *)v19 _setRoleHint:@"SBTraitsParticipantRoleWallpaper"];
  }
  [(_SBWallpaperSecureWindow *)v19 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0];
  [(SBFWindow *)v19 setHidden:0];
  [(_SBWallpaperSecureWindow *)v19 setUserInteractionEnabled:0];
  objc_storeStrong((id *)&v16->_wallpaperWindow, v19);
  v22 = [MEMORY[0x1E4F428B8] blackColor];
  [(_SBWallpaperSecureWindow *)v19 setBackgroundColor:v22];

  if (CSAutobahnEnabledForPlatform())
  {
    CGAffineTransform v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4F83BB0]);
    [(UIViewController *)v23 setWallpaperConfigurationManager:v16->_wallpaperConfigurationManager];
LABEL_9:
    [(UIViewController *)v23 setReachabilityCoordinator:v16];
    [(UIViewController *)v23 setWallpaperPresentingDelegate:v16];
    goto LABEL_13;
  }
  if (_os_feature_enabled_impl())
  {
    CGAffineTransform v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4F83C18]);
    [(UIViewController *)v23 setWallpaperConfigurationManager:v16->_wallpaperConfigurationManager];
    [(UIViewController *)v23 setCachingIdentifier:v16->_cachingIdentifier];
    goto LABEL_9;
  }
  CGAffineTransform v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4F83C30]);
  [(UIViewController *)v23 setWallpaperConfigurationManager:v16->_wallpaperConfigurationManager];
  [(UIViewController *)v23 setCachingIdentifier:v14];
  [(UIViewController *)v23 setReachabilityCoordinator:v16];
  if (![(SBWallpaperController *)v16 _isTraitsArbiterWallpaperActive]) {
    [(UIViewController *)v23 setFixedOrientation:1];
  }
  [(UIViewController *)v23 setWallpaperPresentingDelegate:v16];
  objc_storeStrong((id *)&v16->_wallpaperViewController, v23);
LABEL_13:
  objc_storeStrong((id *)&v16->_wallpaperPresenter, v23);
  objc_storeStrong((id *)&v16->_wallpaperLegibilityProvider, v23);
  rootWallpaperViewController = v16->_rootWallpaperViewController;
  v16->_rootWallpaperViewController = v23;

  [(UIWindow *)v16->_wallpaperWindow setRootViewController:v16->_rootWallpaperViewController];
  v25 = [(UIWindow *)v16->_wallpaperWindow traitCollection];
  uint64_t v26 = [v25 userInterfaceStyle];

  if (v26 == 1)
  {
    uint64_t v27 = 1;
LABEL_17:
    [(PBUIWallpaperConfigurationManager *)v16->_wallpaperConfigurationManager setWallpaperMode:v27];
    goto LABEL_18;
  }
  double v28 = [(UIWindow *)v16->_wallpaperWindow traitCollection];
  uint64_t v29 = [v28 userInterfaceStyle];

  if (v29 == 2)
  {
    uint64_t v27 = 2;
    goto LABEL_17;
  }
LABEL_18:
  CGRect v30 = +[SBReachabilityManager sharedInstance];
  [v30 ignoreWindowForReachability:v16->_wallpaperWindow];

  uint64_t v31 = [(UIViewController *)v16->_rootWallpaperViewController view];
  wallpaperContainerView = v16->_wallpaperContainerView;
  v16->_wallpaperContainerView = (UIView *)v31;

  v33 = [(UIView *)v16->_wallpaperContainerView layer];
  v34 = [MEMORY[0x1E4F42D90] mainScreen];
  [v34 scale];
  objc_msgSend(v33, "setRasterizationScale:");

  [(UIView *)v16->_wallpaperContainerView setClipsToBounds:1];
  id v35 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(UIWindow *)v16->_wallpaperWindow bounds];
  uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
  wallpaperOverlayContainerView = v16->_wallpaperOverlayContainerView;
  v16->_wallpaperOverlayContainerView = (UIView *)v36;

  v38 = v16->_wallpaperOverlayContainerView;
  v39 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v38 setBackgroundColor:v39];

  [(UIWindow *)v16->_wallpaperWindow addSubview:v16->_wallpaperOverlayContainerView];
  v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  activeOrientationSources = v16->_activeOrientationSources;
  v16->_activeOrientationSources = v40;

  [(SBWallpaperController *)v16 setActiveVariant:a5];
  [(id)SBApp addActiveOrientationObserver:v16];
  v42 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v42 registerBacklightEnvironmentSceneProvider:v16];

  v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 addObserver:v16 selector:sel__updateScreenBlanked name:@"SBBlankScreenStateChangeNotification" object:0];
  [v43 addObserver:v16 selector:sel__motionEffectsChanged name:*MEMORY[0x1E4F44100] object:0];
  [v43 addObserver:v16 selector:sel__batterySaverModeChanged_ name:@"SBBatterySaverModeDidChangeNotification" object:SBApp];
  [v43 addObserver:v16 selector:sel__noteSignificantTimeChanged_ name:@"SBSignificantTimeChangedNotification" object:0];
  [v43 addObserver:v16 selector:sel__applicationDidFinishLaunching_ name:*MEMORY[0x1E4F43668] object:0];
  if (_os_feature_enabled_impl())
  {
    v44 = objc_alloc_init(SBBootDefaultsPosterCacheProvider);
    v45 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v46 = [v45 isSharedIPad];

    if (v46)
    {
      uint64_t v47 = [objc_alloc(MEMORY[0x1E4F922E8]) initWithCachingReason:@"SharediPad"];

      v44 = (SBBootDefaultsPosterCacheProvider *)v47;
    }
    posterCacheProvider = v16->_posterCacheProvider;
    v16->_posterCacheProvider = (PRSPosterConfigurationCacheProviding *)v44;
    v49 = v44;

    v50 = objc_opt_new();
    [v50 setLocations:12];
    [v50 setNeedsSandboxExtensions:0];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke;
    v85[3] = &unk_1E6B01110;
    v51 = v16;
    v86 = v51;
    [v50 setHandler:v85];
    v52 = objc_opt_new();
    [v52 setLocationStateObserver:v50];
    [v52 setQueue:MEMORY[0x1E4F14428]];
    id v53 = objc_alloc(MEMORY[0x1E4F92390]);
    v54 = (objc_class *)objc_opt_class();
    v55 = NSStringFromClass(v54);
    uint64_t v56 = [v53 initWithExplanation:v55];
    posterBoardStateObserver = v51->_posterBoardStateObserver;
    v51->_posterBoardStateObserver = (PRSWallpaperObserver *)v56;

    [(PRSWallpaperObserver *)v51->_posterBoardStateObserver activateWithConfiguration:v52];
    [(SBWallpaperController *)v51 _loadLastActiveConfigurations];
    v58 = (PRSService *)objc_alloc_init(MEMORY[0x1E4F92380]);
    posterBoardService = v51->_posterBoardService;
    v51->_posterBoardService = v58;

    id v60 = +[SBPosterBoardUpdateManager sharedInstance];
  }
  v61 = objc_alloc_init(SBPosterBoardModalEditingManager);
  posterBoardModalEditingManager = v16->_posterBoardModalEditingManager;
  v16->_posterBoardModalEditingManager = v61;

  uint64_t v63 = [MEMORY[0x1E4F62278] sharedActivityManager];
  activityManager = v16->_activityManager;
  v16->_activityManager = (FCActivityManager *)v63;

  [(FCActivityManager *)v16->_activityManager addObserver:v16];
  v65 = [MEMORY[0x1E4F83BF8] rootSettings];
  v66 = [v65 resetWallpaperOutlet];
  id v67 = (id)[v66 addAction:&__block_literal_global_110_0];

  objc_initWeak(&location, v16);
  v68 = (void *)MEMORY[0x1E4F941D0];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_3;
  v82[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v83, &location);
  uint64_t v69 = [v68 recipeWithTitle:@"Run Wallpaper Migration" prepareBlock:0 action:v82 cleanupBlock:0];
  migrationTestRecipe = v16->_migrationTestRecipe;
  v16->_migrationTestRecipe = (PTSingleTestRecipe *)v69;

  [MEMORY[0x1E4F83BF8] registerTestRecipe:v16->_migrationTestRecipe];
  v71 = (void *)MEMORY[0x1E4F941D0];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_5;
  v80[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v81, &location);
  uint64_t v72 = [v71 recipeWithTitle:@"Reload Wallpaper" prepareBlock:0 action:v80 cleanupBlock:0];
  reloadTestRecipe = v16->_reloadTestRecipe;
  v16->_reloadTestRecipe = (PTSingleTestRecipe *)v72;

  [MEMORY[0x1E4F83BF8] registerTestRecipe:v16->_reloadTestRecipe];
  v16->_int64_t orientation = 0;
  [(SBWallpaperController *)v16 willAnimateRotationToInterfaceOrientation:v78 duration:0.0];
  v74 = [MEMORY[0x1E4F74230] sharedConnection];
  [v74 registerObserver:v16];
  [(SBWallpaperController *)v16 profileConnectionDidReceiveEffectiveSettingsChangedNotification:v74 userInfo:0];

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&location);

  id v13 = v77;
  id v14 = v79;
LABEL_23:

  return v16;
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 activeLock];
  id v4 = [v3 activeHome];

  objc_msgSend(*(id *)(a1 + 32), "_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:");
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_2()
{
  id v1 = objc_alloc_init(MEMORY[0x1E4F83BE0]);
  [v1 restoreDefaultWallpaperForAllVariantsAndNotify:0];
  uint64_t v0 = +[SBPrototypeController sharedInstance];
  [v0 restartSpringBoard];
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained wallpaperConfigurationManager];
  [v1 performMigrationWithFailureHandler:&__block_literal_global_118];

  [WeakRetained _updateWallpaperForLocations:3 options:0 withCompletion:0];
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_4()
{
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadWallpaperAndFlushCaches:1 completionHandler:0];
}

- (void)_loadLastActiveConfigurations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 112) lastActiveLockPoster];
  if (v2)
  {
    id v18 = 0;
    id v3 = [MEMORY[0x1E4F922E0] decodeFromPersistableRepresentation:v2 error:&v18];
    id v4 = v18;
    if (v3)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 112) lastActiveHomePoster];
      if (v5)
      {
        id v17 = 0;
        id v6 = [MEMORY[0x1E4F922E0] decodeFromPersistableRepresentation:v5 error:&v17];
        id v7 = v17;
        uint64_t v8 = SBLogWallpaper();
        int64_t v9 = v8;
        if (v6)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v20 = v3;
            __int16 v21 = 2112;
            v22 = v6;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "loaded last active lock/home posters :\nlock=%@\nhome=%@", buf, 0x16u);
          }

          id v10 = v3;
          id v11 = v6;
        }
        else
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_2();
          }

          [*(id *)(*(void *)(a1 + 32) + 112) setLastActiveLockPoster:0];
          [*(id *)(*(void *)(a1 + 32) + 112) setLastActiveHomePoster:0];
          id v10 = 0;
        }
      }
      else
      {
        id v14 = SBLogWallpaper();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v3;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "loaded last active lock poster : lock=%@", buf, 0xCu);
        }

        id v10 = v3;
        id v6 = 0;
      }
    }
    else
    {
      id v13 = SBLogWallpaper();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_1();
      }

      [*(id *)(*(void *)(a1 + 32) + 112) setLastActiveLockPoster:0];
      [*(id *)(*(void *)(a1 + 32) + 112) setLastActiveHomePoster:0];
      id v6 = 0;
      id v10 = 0;
    }
  }
  else
  {
    id v12 = SBLogWallpaper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "no last active lock poster found", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 112) setLastActiveHomePoster:0];
    id v6 = 0;
    id v10 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), v10);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), v6);
  *(unsigned char *)(*(void *)(a1 + 32) + 185) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 186))
  {
    uint64_t v15 = SBLogWallpaper();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "ignoring last active as we've already received a posters update", buf, 2u);
    }

    [*(id *)(a1 + 32) _persistLastActiveLockScreenPosterConfiguration:*(void *)(*(void *)(a1 + 32) + 144)];
    [*(id *)(a1 + 32) _persistLastActiveHomeScreenPosterConfiguration:*(void *)(*(void *)(a1 + 32) + 160)];
  }
  else if (v10)
  {
    v16 = SBLogWallpaper();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "initializing to last active posters cache", buf, 2u);
    }

    [*(id *)(a1 + 32) _updateForLockScreenPosterConfiguration:v10 homeScreenPosterConfiguration:v6];
  }
}

- (void)_persistLastActiveLockScreenPosterConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (self->_loadedLastActiveConfigurations)
  {
    p_lastActiveLockScreenPosterConfiguration = &self->_lastActiveLockScreenPosterConfiguration;
    lastActiveLockScreenPosterConfiguration = self->_lastActiveLockScreenPosterConfiguration;
    if (v5)
    {
      if ([v5 isEqualToPersistable:lastActiveLockScreenPosterConfiguration])
      {
        objc_storeStrong((id *)&self->_lastActiveLockScreenPosterConfiguration, a3);
      }
      else
      {
        id v18 = 0;
        id v12 = [v6 persistableRepresentationWithError:&v18];
        id v13 = v18;
        id v14 = SBLogWallpaper();
        uint64_t v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v6;
            _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "cached last active lock poster : config=%@", buf, 0xCu);
          }

          [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveLockPoster:v12];
          v16 = v6;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SBWallpaperController _persistLastActiveLockScreenPosterConfiguration:]();
          }

          [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveLockPoster:0];
          v16 = 0;
        }
        id v17 = *p_lastActiveLockScreenPosterConfiguration;
        *p_lastActiveLockScreenPosterConfiguration = v16;
      }
    }
    else if (lastActiveLockScreenPosterConfiguration)
    {
      id v10 = SBLogWallpaper();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "erased last active lock poster cache", buf, 2u);
      }

      [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveLockPoster:0];
      id v11 = self->_lastActiveLockScreenPosterConfiguration;
      self->_lastActiveLockScreenPosterConfiguration = 0;
    }
  }
  else
  {
    int64_t v9 = SBLogWallpaper();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "ignoring update to last active lock poster cache because we're not yet fully loaded", buf, 2u);
    }
  }
}

- (void)_persistLastActiveHomeScreenPosterConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (self->_loadedLastActiveConfigurations)
  {
    p_lastActiveHomeScreenPosterConfiguration = &self->_lastActiveHomeScreenPosterConfiguration;
    lastActiveHomeScreenPosterConfiguration = self->_lastActiveHomeScreenPosterConfiguration;
    if (v5)
    {
      if ([v5 isEqualToPersistable:lastActiveHomeScreenPosterConfiguration])
      {
        objc_storeStrong((id *)&self->_lastActiveHomeScreenPosterConfiguration, a3);
      }
      else
      {
        id v18 = 0;
        id v12 = [v6 persistableRepresentationWithError:&v18];
        id v13 = v18;
        id v14 = SBLogWallpaper();
        uint64_t v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v6;
            _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "cached last active home poster : config=%@", buf, 0xCu);
          }

          [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveHomePoster:v12];
          v16 = v6;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SBWallpaperController _persistLastActiveHomeScreenPosterConfiguration:]();
          }

          [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveHomePoster:0];
          v16 = 0;
        }
        id v17 = *p_lastActiveHomeScreenPosterConfiguration;
        *p_lastActiveHomeScreenPosterConfiguration = v16;
      }
    }
    else if (lastActiveHomeScreenPosterConfiguration)
    {
      id v10 = SBLogWallpaper();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "erased last active home poster cache", buf, 2u);
      }

      [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider setLastActiveHomePoster:0];
      id v11 = self->_lastActiveHomeScreenPosterConfiguration;
      self->_lastActiveHomeScreenPosterConfiguration = 0;
    }
  }
  else
  {
    int64_t v9 = SBLogWallpaper();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "ignoring update to last active home poster cache because we're not yet fully loaded", buf, 2u);
    }
  }
}

- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWallpaperController *)self embeddedWindowScene];
  id v6 = [(SBWallpaperController *)self initWithWindowScene:v5 orientation:1 variant:1 wallpaperConfigurationManager:v4 cachingIdentifier:@"wallpaperController"];

  return v6;
}

- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3 cachingIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBWallpaperController *)self embeddedWindowScene];
  int64_t v9 = [(SBWallpaperController *)self initWithWindowScene:v8 orientation:1 variant:1 wallpaperConfigurationManager:v7 cachingIdentifier:v6];

  return v9;
}

- (SBWallpaperController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F83BE0]);
  id v4 = [(SBWallpaperController *)self embeddedWindowScene];
  id v5 = [(SBWallpaperController *)self embeddedWindowScene];
  if (v5)
  {
    id v6 = [(SBWallpaperController *)self embeddedWindowScene];
    id v7 = -[SBWallpaperController initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](self, "initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:", v4, [v6 interfaceOrientation], 1, v3, @"wallpaperController");
  }
  else
  {
    id v7 = [(SBWallpaperController *)self initWithWindowScene:v4 orientation:1 variant:1 wallpaperConfigurationManager:v3 cachingIdentifier:@"wallpaperController"];
  }

  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 unregisterObserver:self];

  [(id)SBApp removeActiveOrientationObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)SBWallpaperController;
  [(SBWallpaperController *)&v5 dealloc];
}

- (int64_t)activeVariant
{
  return [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter activeVariant];
}

- (void)setActiveVariant:(int64_t)a3
{
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
}

- (void)fetchWallpaperProminentColor:(id)a3
{
}

- (id)embeddedWindowScene
{
  v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 embeddedDisplayWindowScene];

  return v3;
}

- (void)_updateForLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  self->_updatedActiveConfigurations = 1;
  int v9 = BSEqualObjects();
  if (v9) {
    goto LABEL_26;
  }
  id v10 = SBLogWallpaper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.7();
  }
  id v40 = v8;

  objc_storeStrong((id *)&self->_activeLockScreenPosterConfiguration, a3);
  [(SBWallpaperController *)self _persistLastActiveLockScreenPosterConfiguration:self->_activeLockScreenPosterConfiguration];
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setConfiguration:v7 withAnimationSettings:0];
  }
  id v11 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v11 invalidateBacklightScenesForProvider:self];

  id v42 = 0;
  objc_msgSend(v7, "pr_loadTitleStyleConfigurationWithError:", &v42);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v42;
  if (!v12)
  {
    id v14 = SBLogWallpaper();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.6();
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F926E8]);
  }
  uint64_t v15 = objc_msgSend(v7, "pr_posterProvider");
  int v39 = v9;
  v37 = (void *)v15;
  id v38 = a4;
  if (!v15)
  {
    v20 = SBLogWallpaper();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.5();
    }

    goto LABEL_16;
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v15 error:0];
  id v17 = [v16 URL];

  if (!v17)
  {
LABEL_16:
    uint64_t v21 = SBLogWallpaper();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.4();
    }

    uint64_t v18 = [MEMORY[0x1E4F926E8] defaultTimeFont];
    v22 = SBLogWallpaper();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:]();
    }

    v19 = [v12 vibrancyConfiguration];
    goto LABEL_21;
  }
  uint64_t v18 = [v12 effectiveTimeFontWithExtensionBundleURL:v17];
  v19 = [v12 vibrancyConfigurationWithExtensionBundleURL:v17];

LABEL_21:
  uint64_t v23 = [v12 timeNumberingSystem];
  v24 = +[SBLockScreenManager sharedInstance];
  v25 = [v24 coverSheetViewController];

  uint64_t v26 = [v12 titleContentStyle];
  uint64_t v36 = (void *)v18;
  [v25 updateFont:v18 vibrancyConfiguration:v19 numberingSystem:v23 contentStyle:v26];

  [v25 updateFloatingLayerOrdering];
  objc_msgSend(v25, "setAlternateDateEnabled:", objc_msgSend(v12, "isAlternateDateEnabled"));
  id v41 = 0;
  uint64_t v27 = objc_msgSend(v7, "pr_loadConfiguredPropertiesWithError:", &v41);
  id v28 = v41;

  if (v27)
  {
    uint64_t v29 = [v27 renderingConfiguration];
    objc_msgSend(v25, "setDepthEffectDisabled:", objc_msgSend(v29, "isDepthEffectDisabled"));

    id v30 = objc_alloc(MEMORY[0x1E4F5E458]);
    uint64_t v31 = [v27 quickActionsConfiguration];
    v32 = [v30 initWithPosterActionsConfiguration:v31];

    [v25 setQuickActionsConfiguration:v32];
  }
  else
  {
    v32 = SBLogWallpaper();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:]();
    }
  }

  v33 = [v7 providerBundleIdentifier];
  int v34 = [v33 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp.AegirPoster"];

  [v25 setFloatingLayerFullscreen:v34 ^ 1u];
  id v8 = v40;
  int v9 = v39;
  a4 = v38;
LABEL_26:
  if (BSEqualObjects()) {
    goto LABEL_32;
  }
  id v35 = SBLogWallpaper();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:]();
  }

  objc_storeStrong((id *)&self->_activeHomeScreenPosterConfiguration, a4);
  [(SBWallpaperController *)self _persistLastActiveHomeScreenPosterConfiguration:self->_activeHomeScreenPosterConfiguration];
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setAssociatedPosterConfiguration:v8 withAnimationSettings:0];
  }
  if (v9)
  {
LABEL_32:
    if (objc_opt_respondsToSelector()) {
      [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter triggerSceneUpdate];
    }
  }
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter acquireDuckHomeScreenWallpaperDimAssertionWithReason:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter noteHomeVariantStyleStateMayHaveUpdated];
  }
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    char v7 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter updateCurrentPosterWithUpdates:v6 error:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)setHomeScreenWallpaperDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter setHomeScreenWallpaperDimmed:v3];
  }
}

- (BOOL)homeScreenWallpaperDimming
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  wallpaperPresenter = self->_wallpaperPresenter;
  return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter isHomeScreenWallpaperDimmed];
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  BOOL v3 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter currentHomeVariantStyleState];
  if (!v3)
  {
    id v4 = [(PRSPosterConfigurationCacheProviding *)self->_posterCacheProvider lastActiveLockPoster];
    if (v4)
    {
      uint64_t v9 = 0;
      objc_super v5 = [MEMORY[0x1E4F922E0] decodeFromPersistableRepresentation:v4 error:&v9];
      id v6 = v5;
      if (v5)
      {
        char v7 = objc_msgSend(v5, "pr_loadHomeScreenConfigurationWithError:", 0);
        if (v7)
        {
          BOOL v3 = PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration();
        }
        else
        {
          BOOL v3 = 0;
        }
      }
      else
      {
        BOOL v3 = 0;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return (PBUIHomeVariantStyleState *)v3;
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  wallpaperPresenter = self->_wallpaperPresenter;
  return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter updateIrisWallpaperForStaticMode];
}

- (void)updateIrisWallpaperForInteractiveMode
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter updateIrisWallpaperForInteractiveMode];
  }
}

- (void)setWindowLevel:(double)a3
{
}

- (double)windowLevel
{
  [(UIWindow *)self->_wallpaperWindow windowLevel];
  return result;
}

- (double)homescreenWallpaperScale
{
  [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter homescreenWallpaperScale];
  return result;
}

- (double)minimumHomescreenWallpaperScale
{
  [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter minimumHomescreenWallpaperScale];
  return result;
}

- (double)lockscreenWallpaperScale
{
  [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter lockscreenWallpaperScale];
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  return (id)[(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setLockscreenWallpaperScale:a4 withAnimationFactory:a3];
}

- (double)minimumLockscreenWallpaperScale
{
  [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter minimumLockscreenWallpaperScale];
  return result;
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter setLockscreenOnlyWallpaperAlpha:a3];
  }
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  double result = ($1D129F7B4C980C50E70029647222EF17 *)self->_wallpaperPresenter;
  if (result) {
    return ($1D129F7B4C980C50E70029647222EF17 *)[($1D129F7B4C980C50E70029647222EF17 *)result currentHomescreenStyleTransitionState];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0.0;
  return result;
}

- (void)triggerPosterSignificantEvent
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter triggerPosterSignificantEvent];
  }
}

- (void)triggerPosterTapEvent:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter triggerPosterSignificantEvent];
  }
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter triggerPosterTapEvent:v4];
  }
  [(SBWallpaperController *)self _fetchUserTapEventsRequestedWithCompletionHandler:&__block_literal_global_164_0];
}

void __47__SBWallpaperController_triggerPosterTapEvent___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = +[SBLockScreenManager sharedInstance];
    id v3 = [v2 coverSheetViewController];

    [v3 requestIdleTimerResetForPoster];
  }
}

- (void)_fetchUserTapEventsRequestedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    id v6 = v4;
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter userTapEventsRequested];
    }
    else {
      uint64_t v5 = 0;
    }
    v6[2](v6, v5);
    id v4 = v6;
  }
}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setWallpaperFloatingLayerContainerView:v8 forReason:v9 withAnimationFactory:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v7 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter createWallpaperFloatingViewForReason:v6 ignoreReplica:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  wallpaperPresenter = self->_wallpaperPresenter;
  $1D129F7B4C980C50E70029647222EF17 v8 = *a3;
  return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter setWallpaperStyleTransitionState:&v8 forPriority:a4 forVariant:a5 withAnimationFactory:a6];
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  return [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter removeWallpaperStyleForPriority:a3 forVariant:a4 withAnimationFactory:a5];
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
}

- (void)updateWallpaperAnimationWithProgress:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter updateWallpaperAnimationWithProgress:a3];
  }
}

- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter updateWallpaperAnimationWithIconFlyInTension:a3 friction:a4];
  }
}

- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:v3];
  }
}

- (BOOL)homeScreenPosterMirrorsLock
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter homeScreenPosterMirrorsLock];
  }
  else
  {
    activeLockScreenPosterConfiguration = self->_activeLockScreenPosterConfiguration;
    id v11 = 0;
    id v6 = [(PRSPosterConfiguration *)activeLockScreenPosterConfiguration pr_loadHomeScreenConfigurationWithError:&v11];
    id v7 = v11;
    if (!v6)
    {
      $1D129F7B4C980C50E70029647222EF17 v8 = SBLogWallpaper();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBWallpaperController homeScreenPosterMirrorsLock]();
      }

      id v6 = objc_alloc_init(MEMORY[0x1E4F92680]);
    }
    if ([v6 selectedAppearanceType])
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      id v10 = [v6 lockPosterAppearance];
      int v9 = [v10 isLegibilityBlurEnabled] ^ 1;
    }
    return v9;
  }
}

- (BOOL)posterHandlesWakeAnimation
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  wallpaperPresenter = self->_wallpaperPresenter;
  return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter posterHandlesWakeAnimation];
}

- (BOOL)posterHidesDimmingLayer
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  wallpaperPresenter = self->_wallpaperPresenter;
  return [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter posterHidesDimmingLayer];
}

- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter irisWallpaperPlayer];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (PBUIIrisWallpaperPlaying *)v3;
}

- (UIGestureRecognizer)wallpaperGestureRecognizer
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_triggerPosterTapEvent_];
    [v3 setName:@"WallpaperTap"];
  }
  else if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter irisWallpaperPlayer];
    BOOL v3 = [v4 irisGestureRecognizer];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (UIGestureRecognizer *)v3;
}

- (void)setWallpaperObscured:(BOOL)a3
{
  if (self->_wallpaperObscured != a3)
  {
    BOOL v3 = a3;
    self->_wallpaperObscured = a3;
    if (objc_opt_respondsToSelector())
    {
      wallpaperPresenter = self->_wallpaperPresenter;
      [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter setWallpaperObscured:v3];
    }
  }
}

- (id)averageColorForVariant:(int64_t)a3
{
  return (id)[(PBUIWallpaperLegibilityProviding *)self->_wallpaperLegibilityProvider averageColorForVariant:a3];
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return (id)-[PBUIWallpaperLegibilityProviding averageColorInRect:forVariant:](self->_wallpaperLegibilityProvider, "averageColorInRect:forVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  return (id)-[PBUIWallpaperLegibilityProviding averageColorInRect:forVariant:withSmudgeRadius:](self->_wallpaperLegibilityProvider, "averageColorInRect:forVariant:withSmudgeRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  -[PBUIWallpaperLegibilityProviding contrastInRect:forVariant:](self->_wallpaperLegibilityProvider, "contrastInRect:forVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)contrastForVariant:(int64_t)a3
{
  [(PBUIWallpaperLegibilityProviding *)self->_wallpaperLegibilityProvider contrastForVariant:a3];
  return result;
}

- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setWallpaperHidden:v6 variant:a4 reason:v8];
  }
}

- (void)setExternalDisplayConfiguration:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setExternalDisplayConfiguration:v4];
  }
}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  if (objc_opt_respondsToSelector())
  {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter updateWallpaperForLocations:a3 withCompletion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = (void (**)(void))a5;
  if (objc_opt_respondsToSelector())
  {
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter updateWallpaperForLocations:a3 wallpaperMode:a4 withCompletion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6
{
}

- (id)scenesForBacklightSession
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter scenesForBacklightSession];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)_window
{
  return self->_wallpaperWindow;
}

- (void)_batterySaverModeChanged:(id)a3
{
  int v4 = objc_msgSend((id)SBApp, "isBatterySaverModeActive", a3);
  uint64_t v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax for battery saver mode", buf, 2u);
    }

    id v7 = [(SBWallpaperController *)self batterySaverAnimationAssertion];
    [v7 invalidate];

    id v8 = [(SBWallpaperController *)self suspendWallpaperAnimationForReason:@"SBWallpaperViewBatterySaverReason"];
    [(SBWallpaperController *)self setBatterySaverAnimationAssertion:v8];

    [MEMORY[0x1E4F42FF0] _beginSuspendingMotionEffectsForReason:@"SBWallpaperViewBatterySaverReason"];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Re-enabling dynamic wallpapers and parallax for battery saver mode", v10, 2u);
    }

    int v9 = [(SBWallpaperController *)self batterySaverAnimationAssertion];
    [v9 invalidate];

    [(SBWallpaperController *)self setBatterySaverAnimationAssertion:0];
    [MEMORY[0x1E4F42FF0] _endSuspendingMotionEffectsForReason:@"SBWallpaperViewBatterySaverReason"];
  }
}

- (void)_motionEffectsChanged
{
  id v2 = [(SBWallpaperController *)self wallpaperConfigurationManager];
  [v2 regenerateStaticWallpaperThumbnailImages];
}

- (void)_updateScreenBlanked
{
  BOOL IsBlanked = SBScreenIsBlanked();
  [(SBWallpaperController *)self setWallpaperHidden:IsBlanked variant:0 reason:@"ScreenIsBlanked"];
  [(SBWallpaperController *)self setWallpaperHidden:IsBlanked variant:1 reason:@"ScreenIsBlanked"];
}

- (id)_wallpaperViewForVariant:(int64_t)a3
{
  return (id)[(PBUIWallpaperViewController *)self->_wallpaperViewController wallpaperViewForVariant:a3];
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter preheatWallpaperForVariant:a3];
  }
}

- (void)_reloadWallpaperAndFlushCaches:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = SBLogWallpaper();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8) {
      -[SBWallpaperController _reloadWallpaperAndFlushCaches:completionHandler:](v7);
    }

    int v9 = [MEMORY[0x1E4F83BD0] wallpaperCache];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke;
    v10[3] = &unk_1E6AF6828;
    v10[4] = self;
    id v11 = v6;
    [v9 removeEverythingWithCompletion:v10];
  }
  else
  {
    if (v8) {
      -[SBWallpaperController _reloadWallpaperAndFlushCaches:completionHandler:](v7);
    }

    [(SBWallpaperController *)self _updateWallpaperForLocations:3 options:0 withCompletion:v6];
  }
}

void __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke_2;
  v2[3] = &unk_1E6AF6828;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) clearCacheForVariants:3];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateWallpaperForLocations:3 options:0 withCompletion:v3];
}

- (NSString)description
{
  return (NSString *)[(SBWallpaperController *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBWallpaperController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = BSInterfaceOrientationDescription();
  id v6 = (id)[v4 appendObject:v5 withName:@"interfaceOrientation"];

  unint64_t v7 = [(SBWallpaperController *)self activeOrientationSource];
  if (v7 > 3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_1E6B012B8[v7];
  }
  id v9 = (id)[v4 appendObject:v8 withName:@"activeOrientationSource"];
  id v10 = [(SBWallpaperController *)self activeInterfaceOrientationSourcesDescriptions];
  [v4 appendArraySection:v10 withName:@"ActiveInterfaceOrientationSources" skipIfEmpty:0];

  id v11 = (id)[v4 appendObject:self->_wallpaperConfigurationManager withName:@"wallpaperConfigurationManager"];
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBWallpaperController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)activeInterfaceOrientationSourcesDescriptions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = self->_activeOrientationSources;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue", (void)v12);
        if (v9 > 3) {
          id v10 = 0;
        }
        else {
          id v10 = off_1E6B012B8[v9];
        }
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)wallpaperPresenter:(id)a3 didChangeWallpaperForLocations:(int64_t)a4 withConfiguration:(id)a5
{
  id v7 = a5;
  [(SBWallpaperController *)self _saveWallpaperAggdKeysForLocations:a4 withConfiguration:v7];
  [(SBWallpaperController *)self _saveWallpaperCoreAnalyticsForLocations:a4 withConfiguration:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  [WeakRetained wallpaperPresenter:self didChangeWallpaperForLocations:a4 withConfiguration:v7];
}

- (void)wallpaperPresenterDidCompleteWallpaperChange:(id)a3
{
  PBUIPostExternalWallpaperChangeNotificationAsSystemShell();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  [WeakRetained wallpaperPresenterDidCompleteWallpaperChange:self];
}

- (SBFWallpaperCoreAnalyticsLogger)wallpaperCoreAnalyticsLogger
{
  wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  if (!wallpaperCoreAnalyticsLogger)
  {
    BOOL v4 = (SBFWallpaperCoreAnalyticsLogger *)objc_alloc_init(MEMORY[0x1E4FA6070]);
    uint64_t v5 = self->_wallpaperCoreAnalyticsLogger;
    self->_wallpaperCoreAnalyticsLogger = v4;

    wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  }
  return wallpaperCoreAnalyticsLogger;
}

- (void)_saveWallpaperCoreAnalyticsForLocations:(int64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = [v6 wallpaperOptions];
  id v10 = [v7 name];

  BOOL v8 = [v6 videoURL];

  unint64_t v9 = [(SBWallpaperController *)self wallpaperCoreAnalyticsLogger];
  [v9 saveStateOfWallpaperToCoreAnalytics:a3 withHasVideo:v8 != 0 hasProcedural:0 name:v10];
}

- (SBFWallpaperAggdLogger)wallpaperAggdLogger
{
  wallpaperAggdLogger = self->_wallpaperAggdLogger;
  if (!wallpaperAggdLogger)
  {
    BOOL v4 = (SBFWallpaperAggdLogger *)objc_alloc_init(MEMORY[0x1E4FA6068]);
    uint64_t v5 = self->_wallpaperAggdLogger;
    self->_wallpaperAggdLogger = v4;

    wallpaperAggdLogger = self->_wallpaperAggdLogger;
  }
  return wallpaperAggdLogger;
}

- (void)_saveWallpaperAggdKeysForLocations:(int64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = [v6 wallpaperOptions];
  id v10 = [v7 name];

  BOOL v8 = [v6 videoURL];

  unint64_t v9 = [(SBWallpaperController *)self wallpaperAggdLogger];
  [v9 updateWallpaperAggdKeysForLocations:a3 withHasVideo:v8 != 0 hasProcedural:0 name:v10];
  [v9 saveWallpaperAggdCurrentValues];
}

- (void)_noteSignificantTimeChanged:(id)a3
{
  BOOL v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SBSignificantTimeChangeWasMidnight"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [(SBWallpaperController *)self wallpaperAggdLogger];
    [v7 saveWallpaperAggdCurrentValues];

    id v8 = [(SBWallpaperController *)self wallpaperCoreAnalyticsLogger];
    [v8 sendStateOfWallpaperToCoreAnalytics];
  }
}

- (void)setOrientationProvider:(id)a3 forSource:(int64_t)a4
{
  id v10 = a3;
  orientationProviders = self->_orientationProviders;
  if (!orientationProviders)
  {
    id v7 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v8 = self->_orientationProviders;
    self->_orientationProviders = v7;

    orientationProviders = self->_orientationProviders;
  }
  unint64_t v9 = [NSNumber numberWithInteger:a4];
  [(NSMapTable *)orientationProviders setObject:v10 forKey:v9];
}

- (void)orientationSource:(int64_t)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (-[SBWallpaperController _isAcceptingOrientationChangesFromSource:](self, "_isAcceptingOrientationChangesFromSource:"))
  {
    [(SBWallpaperController *)self willAnimateRotationToInterfaceOrientation:a4 duration:a5];
  }
  else
  {
    unint64_t v9 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        id v10 = 0;
      }
      else {
        id v10 = off_1E6B012B8[a3];
      }
      int v11 = 138543362;
      long long v12 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Not accepting changes from alternate orientation source: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)orientationSource:(int64_t)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  if (objc_opt_respondsToSelector())
  {
    wallpaperPresenter = self->_wallpaperPresenter;
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter noteDidRotateFromInterfaceOrientation:a4];
  }
}

- (BOOL)_isMaglevActive
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)_isTraitsArbiterWallpaperActive
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      LOBYTE(v3) = ![(SBWallpaperController *)self _isMaglevActive];
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  unint64_t v9 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  v12[3] = &unk_1E6B01138;
  v12[4] = &v17;
  v12[5] = &v13;
  [v9 enumerateObjectsUsingBlock:v12];

  if (*((unsigned char *)v18 + 24))
  {
    if (!*((unsigned char *)v14 + 24)) {
      goto LABEL_7;
    }
  }
  else if (self->_orientation == a3)
  {
    goto LABEL_7;
  }
  if ([(SBWallpaperController *)self _isAcceptingOrientationChangesFromSource:1])
  {
    [(SBWallpaperController *)self orientationSource:1 willRotateToInterfaceOrientation:a3 duration:a4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2;
    v11[3] = &unk_1E6AF4AE8;
    v11[4] = self;
    v11[5] = a3;
    *(double *)&v11[6] = a4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3;
    v10[3] = &unk_1E6AFF1A8;
    v10[4] = self;
    void v10[5] = a5;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:v10 completion:a4];
  }
LABEL_7:
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  id v6 = v5;
  if (([v5 isTranslucent] & 1) != 0 || objc_msgSend(v6, "wantsEnhancedWindowingEnabled"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) orientationSource:1 willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

uint64_t __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) orientationSource:1 didRotateFromInterfaceOrientation:*(void *)(a1 + 40)];
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  id v5 = [(SBWallpaperController *)self wallpaperConfigurationManager];
  id v6 = [v5 wallpaperConfigurationForVariant:1 includingValuesForTypes:a4];

  return v6;
}

- (void)wallpaperServer:(id)a3 fetchThumbnailDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBWallpaperController_wallpaperServer_fetchThumbnailDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E6AF76F8;
  id v10 = v7;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__SBWallpaperController_wallpaperServer_fetchThumbnailDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  id v2 = [v5 wallpaperConfigurationForVariant:*(void *)(a1 + 48) includingValuesForTypes:8];
  int v3 = [v2 wallpaperThumbnailImageData];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)wallpaperServer:(id)a3 fetchOriginalImageDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SBWallpaperController_wallpaperServer_fetchOriginalImageDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E6AF76F8;
  id v10 = v7;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __92__SBWallpaperController_wallpaperServer_fetchOriginalImageDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  id v2 = [v6 wallpaperConfigurationForVariant:*(void *)(a1 + 48) includingValuesForTypes:2];
  int v3 = [v2 wallpaperOriginalImage];
  uint64_t v4 = UIImagePNGRepresentation(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

- (void)wallpaperServer:(id)a3 fetchOriginalVideoURLDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBWallpaperController_wallpaperServer_fetchOriginalVideoURLDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E6AF76F8;
  id v10 = v7;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __95__SBWallpaperController_wallpaperServer_fetchOriginalVideoURLDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  id v2 = [v6 wallpaperConfigurationForVariant:*(void *)(a1 + 48) includingValuesForTypes:2];
  int v3 = [v2 originalVideoURL];
  uint64_t v4 = [v3 dataRepresentation];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

- (void)wallpaperServer:(id)a3 fetchContentCutoutBoundsForVariant:(int64_t)a4 orientation:(int64_t)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__SBWallpaperController_wallpaperServer_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
  v9[3] = &unk_1E6AFE440;
  id v10 = v7;
  int64_t v11 = a5;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __106__SBWallpaperController_wallpaperServer_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F5E3D0] normalizedContentCutoutBoundsForOrientation:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)wallpaperServer:(id)a3 fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && _os_feature_enabled_impl())
  {
    posterBoardService = self->_posterBoardService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __108__SBWallpaperController_wallpaperServer_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v11[3] = &unk_1E6B01160;
    id v12 = v9;
    [(PRSService *)posterBoardService fetchContentCutoutBoundsForActivePosterWithOrientation:a4 completionHandler:v11];
  }
}

uint64_t __108__SBWallpaperController_wallpaperServer_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E4F1DB20];
  a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  a7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  if (a2 && !a3) {
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  }
  id v8 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
  return v8(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLockScreenMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      posterBoardService = self->_posterBoardService;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __115__SBWallpaperController_wallpaperServer_fetchLockScreenMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke;
      v11[3] = &unk_1E6B01160;
      id v12 = v9;
      [(PRSService *)posterBoardService fetchMaximalContentCutoutBoundsForOrientation:a4 completionHandler:v11];
    }
    else
    {
      [(SBWallpaperController *)self _screenBoundsForOrientation:a4];
      v9[2](v9);
    }
  }
}

uint64_t __115__SBWallpaperController_wallpaperServer_fetchLockScreenMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E4F1DB20];
  a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  a7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  if (a2 && !a3) {
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  }
  id v8 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
  return v8(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchObscurableBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void, double, double, double, double))a5;
  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      posterBoardService = self->_posterBoardService;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke;
      v11[3] = &unk_1E6B01188;
      void v11[4] = self;
      int64_t v13 = a4;
      id v12 = v9;
      [(PRSService *)posterBoardService fetchActivePosterConfiguration:v11];
    }
    else
    {
      v9[2](v9, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
  }
}

void __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  if (a2)
  {
    id v7 = [a2 lockScreenPosterConfiguration];
    id v8 = *(void **)(*(void *)(a1 + 32) + 128);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6B01160;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v8 fetchObscurableBoundsForPosterConfiguration:v7 orientation:v9 completionHandler:v11];
  }
  else
  {
    id v10 = *(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
    a3.n128_u64[0] = *MEMORY[0x1E4F1DB20];
    a4.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    v10(a3, a4, a5, a6);
  }
}

uint64_t __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E4F1DB20];
  a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  a7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  if (a2 && !a3) {
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  }
  id v8 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
  return v8(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLimitedOcclusionBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && _os_feature_enabled_impl())
  {
    posterBoardService = self->_posterBoardService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke;
    v11[3] = &unk_1E6B01188;
    void v11[4] = self;
    int64_t v13 = a4;
    id v12 = v9;
    [(PRSService *)posterBoardService fetchActivePosterConfiguration:v11];
  }
}

void __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  if (a2)
  {
    id v7 = [a2 lockScreenPosterConfiguration];
    id v8 = *(void **)(*(void *)(a1 + 32) + 128);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6B01160;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v8 fetchLimitedOcclusionBoundsForPosterConfiguration:v7 orientation:v9 completionHandler:v11];
  }
  else
  {
    id v10 = *(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
    a3.n128_u64[0] = *MEMORY[0x1E4F1DB20];
    a4.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    v10(a3, a4, a5, a6);
  }
}

uint64_t __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E4F1DB20];
  a5.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  a6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  a7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  if (a2 && !a3) {
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  }
  id v8 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
  return v8(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLockScreenTimeBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v7 = (void (**)(void, __n128, __n128, __n128, __n128))a5;
  if (v7 && _os_feature_enabled_impl())
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      v8.n128_u64[0] = *MEMORY[0x1E4F1DB20];
      v9.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
      v10.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
      v11.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      [MEMORY[0x1E4F5E4D0] tightFrameForElements:1];
    }
    v7[2](v7, v8, v9, v10, v11);
  }
}

- (CGRect)_screenBoundsForOrientation:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  double Height = CGRectGetHeight(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  double Width = CGRectGetWidth(v23);
  if (Height >= Width) {
    double v15 = Height;
  }
  else {
    double v15 = Width;
  }
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  double v16 = CGRectGetHeight(v24);
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  double v17 = CGRectGetWidth(v25);
  if (v16 < v17) {
    double v17 = v16;
  }
  if (v3 >= 2) {
    double v18 = v15;
  }
  else {
    double v18 = v17;
  }
  if (v3 >= 2) {
    double v19 = v17;
  }
  else {
    double v19 = v15;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)wallpaperServer:(id)a3 setWallpaperVideoWithWallpaperMode:(id)a4 cropRect:(CGRect)a5 wallpaperMode:(int64_t)a6 completionHandler:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a4;
  id v15 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__SBWallpaperController_wallpaperServer_setWallpaperVideoWithWallpaperMode_cropRect_wallpaperMode_completionHandler___block_invoke;
  v18[3] = &unk_1E6B011B0;
  CGFloat v22 = x;
  CGFloat v23 = y;
  CGFloat v24 = width;
  CGFloat v25 = height;
  id v19 = v14;
  double v20 = self;
  int64_t v26 = a6;
  id v21 = v15;
  id v16 = v15;
  id v17 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __117__SBWallpaperController_wallpaperServer_setWallpaperVideoWithWallpaperMode_cropRect_wallpaperMode_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 32)];
  BOOL v2 = !CGRectIsNull(*(CGRect *)(a1 + 56));
  unint64_t v3 = [*(id *)(a1 + 40) wallpaperConfigurationManager];
  objc_msgSend(v3, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", v4, 0, v2, *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)wallpaperServer:(id)a3 setWallpaperColorName:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__SBWallpaperController_wallpaperServer_setWallpaperColorName_forVariants_completionHandler___block_invoke;
  v13[3] = &unk_1E6AF74C0;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  int64_t v16 = a5;
  id v11 = v10;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __93__SBWallpaperController_wallpaperServer_setWallpaperColorName_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  [v2 setWallpaperColorName:*(void *)(a1 + 40) forVariants:*(void *)(a1 + 56)];

  unint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)wallpaperServer:(id)a3 setWallpaperColor:(id)a4 darkColor:(id)a5 forVariants:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke;
  block[3] = &unk_1E6AF6260;
  id v18 = v11;
  id v19 = v12;
  id v21 = v13;
  int64_t v22 = a6;
  double v20 = self;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  unint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F428B8];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke_2;
    id v10 = &unk_1E6B011D8;
    id v11 = v3;
    id v12 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 colorWithDynamicProvider:&v7];

    id v2 = (id)v5;
  }
  CGFloat v6 = objc_msgSend(*(id *)(a1 + 48), "wallpaperConfigurationManager", v7, v8, v9, v10);
  [v6 setWallpaperColor:v2 forVariants:*(void *)(a1 + 64)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  uint64_t v5 = *(void **)(a1 + v4);
  return v5;
}

- (void)wallpaperServer:(id)a3 setWallpaperGradient:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__SBWallpaperController_wallpaperServer_setWallpaperGradient_forVariants_completionHandler___block_invoke;
  v13[3] = &unk_1E6AF74C0;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  int64_t v16 = a5;
  id v11 = v10;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __92__SBWallpaperController_wallpaperServer_setWallpaperGradient_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  [v2 setWallpaperGradient:*(void *)(a1 + 40) forVariants:*(void *)(a1 + 56)];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)wallpaperServer:(id)a3 restoreDefaultWallpaperWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__SBWallpaperController_wallpaperServer_restoreDefaultWallpaperWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6AF6828;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __86__SBWallpaperController_wallpaperServer_restoreDefaultWallpaperWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wallpaperConfigurationManager];
  [v2 restoreDefaultWallpaperForAllVariantsAndNotify:1];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)wallpaperServer:(id)a3 triggerPosterSignificantEventCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__SBWallpaperController_wallpaperServer_triggerPosterSignificantEventCompletionHandler___block_invoke;
  v7[3] = &unk_1E6AF6828;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __88__SBWallpaperController_wallpaperServer_triggerPosterSignificantEventCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) triggerPosterSignificantEvent];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)wallpaperServer:(id)a3 fetchSignificantEventsCounterForPosterWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__SBWallpaperController_wallpaperServer_fetchSignificantEventsCounterForPosterWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E6AF5FC8;
  id v12 = v7;
  id v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __112__SBWallpaperController_wallpaperServer_fetchSignificantEventsCounterForPosterWithIdentifier_completionHandler___block_invoke(void *a1)
{
  if (a1[4] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1[5] + 96) significantEventsCounterForPosterWithIdentifier:a1[4]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1[5] + 96) posterSignificantEventsCounter];
  }
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)wallpaperServer:(id)a3 handleQuickActionConfigurationRequest:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__SBWallpaperController_wallpaperServer_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
  block[3] = &unk_1E6AF5FC8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__SBWallpaperController_wallpaperServer_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F5E458]);
  uint64_t v3 = [*(id *)(a1 + 32) _posterQuickActionsConfigurationFromConfigurationRequest:*(void *)(a1 + 40)];
  id v6 = (id)[v2 initWithPosterActionsConfiguration:v3];

  uint64_t v4 = +[SBLockScreenManager sharedInstance];
  id v5 = [v4 coverSheetViewController];
  [v5 setQuickActionsConfiguration:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_posterQuickActionsConfigurationFromConfigurationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 leadingQuickActionControlRequest];
  id v6 = [v4 trailingQuickActionControlRequest];

  if ([v5 quickActionCategory] == 3)
  {
    id v7 = [v5 extensionBundleIdentifier];
    id v8 = [v5 containerBundleIdentifier];
    id v9 = [v5 kind];
    id v10 = [(SBWallpaperController *)self _controlIdentityForExtensionBundleIdentifier:v7 containerBundleIdentifier:v8 kind:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F92700]);
    id v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v5 type];
      if ((unint64_t)(v13 - 1) >= 3) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v13;
      }
      uint64_t v15 = [v12 initWithControlIdentity:v10 type:v14];
    }
    else
    {
      uint64_t v15 = [v11 initWithCategory:0];
    }
    id v19 = (void *)v15;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F92700]);
    uint64_t v17 = [v5 quickActionCategory];
    if ((unint64_t)(v17 - 1) >= 3) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v17;
    }
    id v19 = (void *)[v16 initWithCategory:v18];
  }
  if ([v6 quickActionCategory] == 3)
  {
    double v20 = [v6 extensionBundleIdentifier];
    id v21 = [v6 containerBundleIdentifier];
    int64_t v22 = [v6 kind];
    CGFloat v23 = [(SBWallpaperController *)self _controlIdentityForExtensionBundleIdentifier:v20 containerBundleIdentifier:v21 kind:v22];

    id v24 = objc_alloc(MEMORY[0x1E4F92700]);
    CGFloat v25 = v24;
    if (v23)
    {
      uint64_t v26 = [v6 type];
      if ((unint64_t)(v26 - 1) >= 3) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = v26;
      }
      uint64_t v28 = [v25 initWithControlIdentity:v23 type:v27];
    }
    else
    {
      uint64_t v28 = [v24 initWithCategory:0];
    }
    v32 = (void *)v28;
  }
  else
  {
    id v29 = objc_alloc(MEMORY[0x1E4F92700]);
    uint64_t v30 = [v6 quickActionCategory];
    if ((unint64_t)(v30 - 1) >= 3) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = v30;
    }
    v32 = (void *)[v29 initWithCategory:v31];
  }
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F926B8]) initWithLeadingControl:v19 trailingControl:v32];

  return v33;
}

- (id)_controlIdentityForExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v27 = v8;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:v7 containerBundleIdentifier:v8 deviceIdentifier:0];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F58C68]) initIncludingVisible:1 hidden:1];
  id v12 = objc_alloc(MEMORY[0x1E4F58E50]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F58E10]);
  uint64_t v14 = (void *)[v12 initWithWidgetsPredicate:v13 controlsPredicate:v11 includeIntents:1];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F58E40]) initWithOptions:v14];
  id v16 = [v15 extensions];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke;
  v30[3] = &unk_1E6B01200;
  id v17 = v10;
  id v31 = v17;
  uint64_t v18 = objc_msgSend(v16, "bs_firstObjectPassingTest:", v30);

  id v19 = [v18 orderedControlDescriptors];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke_2;
  v28[3] = &unk_1E6B01228;
  id v20 = v9;
  id v29 = v20;
  id v21 = objc_msgSend(v19, "bs_firstObjectPassingTest:", v28);

  if (v21)
  {
    int64_t v22 = v7;
    id v23 = objc_alloc(MEMORY[0x1E4F58C80]);
    id v24 = [v21 defaultIntentReference];
    CGFloat v25 = (void *)[v23 initWithExtensionIdentity:v17 kind:v20 intentReference:v24];
  }
  else
  {
    id v24 = SBLogWallpaper();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v22 = v7;
      id v33 = v7;
      __int16 v34 = 2112;
      id v35 = v27;
      __int16 v36 = 2112;
      id v37 = v20;
      _os_log_error_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_ERROR, "Could not find CHSControlIdentity for extensionBundleIdentifier:%@ containerBundleIdentifier:%@ kind:%@", buf, 0x20u);
    }
    else
    {
      int64_t v22 = v7;
    }
    CGFloat v25 = 0;
  }

  return v25;
}

uint64_t __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  if (self->_activityManager == a3)
  {
    posterBoardService = self->_posterBoardService;
    id v5 = [a3 activeActivity];
    uint64_t v4 = [v5 activityUniqueIdentifier];
    [(PRSService *)posterBoardService notifyFocusModeDidChange:v4 completion:&__block_literal_global_261];
  }
}

void __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = SBLogCommon();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Successfully notified PRS of new focus mode.", v5, 2u);
  }
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  if (self->_activityManager == a3)
  {
    uint64_t v4 = [a3 availableActivities];
    objc_msgSend(v4, "bs_map:", &__block_literal_global_264);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [(PRSService *)self->_posterBoardService notifyAvailableFocusModesDidChange:v5 completion:&__block_literal_global_266];
  }
}

uint64_t __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 activityUniqueIdentifier];
}

void __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = SBLogCommon();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Successfully notified PRS that available focus modes changed.", v5, 2u);
  }
}

- (void)removeReachabilityObserver:(id)a3
{
  id v3 = a3;
  id v4 = +[SBReachabilityManager sharedInstance];
  [v4 removeObserver:v3];
}

- (void)addWallpaperOverlay:(id)a3
{
}

- (void)removeWallpaperOverlay:(id)a3
{
}

- (void)updatePosterSwitcherSnapshots
{
  id v3 = [(SBWallpaperController *)self scenesForBacklightSession];
  id v4 = [v3 anyObject];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v6 = [WeakRetained screen];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  id v9 = v8;

  id v10 = [v9 traitCollection];
  id v11 = [v4 snapshotContext];
  [v11 scale];
  double v13 = v12;
  if (v12 == 0.0)
  {
    [v9 scale];
    double v13 = v14;
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke;
  v17[3] = &unk_1E6B01298;
  id v18 = v4;
  id v19 = v10;
  id v20 = self;
  double v21 = v13;
  id v15 = v10;
  id v16 = v4;
  objc_msgSend(v16, "prui_snapshotSceneWithOptions:traitCollection:completion:", 24, v15, v17);
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_271;
    v9[3] = &unk_1E6B01270;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = v3;
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "prui_snapshotSceneWithOptions:traitCollection:completion:", 32, v5, v9);
  }
  else
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_cold_1(v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "prui_restoreSceneAfterSnapshottingWithCompletion:", &__block_literal_global_270);
  }
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_267(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_267_cold_1();
    }
  }
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_271(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Scene did not provide floating layer snapshot for poster switcher.", v8, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "prui_restoreSceneAfterSnapshottingWithCompletion:", &__block_literal_global_274);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) IOSurface];
  uint64_t v7 = [v3 IOSurface];
  [v5 _ingestPrimaryWallpaperLayersSnapshotIOSurface:v6 floatingWallpaperLayerSnapshotIOSurface:v7 snapshotScale:*(void *)(a1 + 56) traitCollection:&__block_literal_global_277 withCompletion:*(double *)(a1 + 64)];
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_272(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_272_cold_1();
    }
  }
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_275(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_275_cold_1();
    }
  }
}

- (void)_ingestPrimaryWallpaperLayersSnapshotIOSurface:(id)a3 floatingWallpaperLayerSnapshotIOSurface:(id)a4 snapshotScale:(double)a5 traitCollection:(id)a6 withCompletion:(id)a7
{
  id v12 = a7;
  id v13 = (objc_class *)MEMORY[0x1E4F92310];
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)[[v13 alloc] initWithIOSurface:v16];

  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F92310]) initWithIOSurface:v15];
  id v19 = objc_alloc(MEMORY[0x1E4F92318]);
  uint64_t v20 = objc_msgSend(v14, "prs_interfaceStyle");
  uint64_t v21 = objc_msgSend(v14, "prs_accessibilityContrast");

  int64_t v22 = (void *)[v19 initWithPrimaryLayersSnapshot:v17 floatingLayerSnapshot:v18 snapshotScale:v20 interfaceStyle:v21 accessibilityContrast:a5];
  posterBoardService = self->_posterBoardService;
  activeLockScreenPosterConfiguration = self->_activeLockScreenPosterConfiguration;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __157__SBWallpaperController__ingestPrimaryWallpaperLayersSnapshotIOSurface_floatingWallpaperLayerSnapshotIOSurface_snapshotScale_traitCollection_withCompletion___block_invoke;
  v26[3] = &unk_1E6AF5DA8;
  id v27 = v12;
  id v25 = v12;
  [(PRSService *)posterBoardService ingestSnapshotCollection:v22 forPosterConfiguration:activeLockScreenPosterConfiguration completion:v26];
}

uint64_t __157__SBWallpaperController__ingestPrimaryWallpaperLayersSnapshotIOSurface_floatingWallpaperLayerSnapshotIOSurface_snapshotScale_traitCollection_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogWallpaper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [v5 isWallpaperAllowed];
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Profile connection settings changed, isWallpaperAllowed: %{BOOL}u", (uint8_t *)v9, 8u);
  }

  int v7 = [v5 isWallpaperAllowed];
  wallpaperPresenter = self->_wallpaperPresenter;
  if (v7)
  {
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter removeWallpaperStyleForPriority:2 forVariant:1 withAnimationFactory:0];
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter removeWallpaperStyleForPriority:2 forVariant:0 withAnimationFactory:0];
  }
  else
  {
    [(PBUIWallpaperPresenting_Staged *)wallpaperPresenter setWallpaperStyle:2 forPriority:2 forVariant:1 withAnimationFactory:0];
    [(PBUIWallpaperPresenting_Staged *)self->_wallpaperPresenter setWallpaperStyle:2 forPriority:2 forVariant:0 withAnimationFactory:0];
  }
}

- (PBUIWallpaperPresenting)presenter
{
  return self->_wallpaperPresenter;
}

- (PBUIWallpaperLegibilityProviding)legibilityProvider
{
  return self->_wallpaperLegibilityProvider;
}

- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  return (PBUIWallpaperPresentingDelegate *)WeakRetained;
}

- (void)setWallpaperPresentingDelegate:(id)a3
{
}

- (int64_t)_WallpaperOrientationNotForYou
{
  return self->_orientation;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager
{
  return self->_wallpaperConfigurationManager;
}

- (void)setWallpaperAggdLogger:(id)a3
{
}

- (void)setWallpaperCoreAnalyticsLogger:(id)a3
{
}

- (UITraitCollection)fakeBlurViewOverrideTraitCollection
{
  return self->_fakeBlurViewOverrideTraitCollection;
}

- (void)setFakeBlurViewOverrideTraitCollection:(id)a3
{
}

- (BSInvalidatable)batterySaverAnimationAssertion
{
  return self->_batterySaverAnimationAssertion;
}

- (void)setBatterySaverAnimationAssertion:(id)a3
{
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_batterySaverAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperCoreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, 0);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_posterBoardModalEditingManager, 0);
  objc_storeStrong((id *)&self->_lastActiveHomeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_activeHomeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_lastActiveLockScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_activeLockScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterBoardStateObserver, 0);
  objc_storeStrong((id *)&self->_posterBoardService, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_posterCacheProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperLegibilityProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
  objc_storeStrong((id *)&self->_wallpaperViewController, 0);
  objc_storeStrong((id *)&self->_reloadTestRecipe, 0);
  objc_storeStrong((id *)&self->_migrationTestRecipe, 0);
  objc_storeStrong((id *)&self->_orientationProviders, 0);
  objc_storeStrong((id *)&self->_activeOrientationSources, 0);
  objc_storeStrong((id *)&self->_wallpaperOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
  objc_storeStrong((id *)&self->_rootWallpaperViewController, 0);
  objc_storeStrong((id *)&self->_wallpaperWindow, 0);
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1(&dword_1D85BA000, v0, v1, "failed to decode last active lock poster : error=%{public}@ data=%@");
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1(&dword_1D85BA000, v0, v1, "failed to decode last active home poster : error=%{public}@ data=%@");
}

- (void)_persistLastActiveLockScreenPosterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "erasing last active lock poster cache due to failed encoding of new active lock poster : error=%{public}@ config=%@");
}

- (void)_persistLastActiveHomeScreenPosterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "erasing last active home poster cache due to failed encoding of new active home poster : error=%{public}@ config=%@");
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "updating home poster : home=%@", v1, 0xCu);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error loading poster configured properties: %@", v2, v3, v4, v5, v6);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_FAULT, "Unable to find extension bundle URL for config %{public}@", v1, 0xCu);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Missing extension bundle URL for poster configuration %@", v2, v3, v4, v5, v6);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Missing poster provider from the poster configuration %@", v2, v3, v4, v5, v6);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error loading poster title style configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "updating lock poster : lock=%@", v1, 0xCu);
}

- (void)homeScreenPosterMirrorsLock
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error loading poster homescreen configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_reloadWallpaperAndFlushCaches:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Flushing all wallpaper caches and rebuilding everything", v1, 2u);
}

- (void)_reloadWallpaperAndFlushCaches:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Reloading wallpaper without flushing caches", v1, 2u);
}

void __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error updated PRS notion of active focus mode: %@", v2, v3, v4, v5, v6);
}

void __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error notifying PRS that available focus modes changed: %@", v2, v3, v4, v5, v6);
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to create primary layers snapshot for poster switcher.", v1, 2u);
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_267_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Failed to restore scene settings after snapshotting primary layers: %@", v2, v3, v4, v5, v6);
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_272_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Failed to restore scene settings after snapshotting floating layer: %@", v2, v3, v4, v5, v6);
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_275_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Failed to hand off updated snapshot for poster switcher: %{public}@.", v2, v3, v4, v5, v6);
}

@end