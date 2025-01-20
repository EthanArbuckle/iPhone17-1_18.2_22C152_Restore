@interface PBUIWallpaperViewController
+ (id)substitutionFlatColorForWallpaperName:(id)a3;
- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isRasterizationDisallowedForCurrentVariant;
- (BOOL)_isWallpaperHiddenForVariant:(int64_t)a3;
- (BOOL)_isWallpaperView:(id)a3 displayingWallpaperWithConfiguration:(id)a4 forVariant:(int64_t)a5;
- (BOOL)_setDisallowRasterization:(BOOL)a3 withReason:(id)a4 reasons:(id)a5;
- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3;
- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3;
- (BOOL)_updateEffectViewForVariant:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 oldEffectView:(id *)a6 newEffectView:(id *)a7;
- (BOOL)_updateEffectViewForVariant:(int64_t)a3 withFactory:(id)a4;
- (BOOL)colorSamplingDisabled;
- (BOOL)fixedOrientation;
- (BOOL)homeScreenPosterMirrorsLock;
- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5;
- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDelayHomescreenStyleUpdates;
- (BOOL)updateIrisWallpaperForStaticMode;
- (BOOL)variantsShareWallpaper;
- (BSInvalidatable)wallpaperStyleAnimationAssertion;
- (Class)_wallpaperViewClassForType:(int64_t)a3;
- (NSString)cachingIdentifier;
- (NSString)description;
- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer;
- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager;
- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate;
- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator;
- (PBUIWallpaperStyleInfo)homescreenStyleInfo;
- (PBUIWallpaperStyleInfo)lockscreenStyleInfo;
- (PBUIWallpaperView)homescreenWallpaperView;
- (PBUIWallpaperView)lockscreenWallpaperView;
- (PBUIWallpaperView)sharedWallpaperView;
- (PBUIWallpaperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITraitCollection)fakeBlurViewOverrideTraitCollection;
- (double)_wallpaperScaleForVariant:(int64_t)a3;
- (double)contrastForVariant:(int64_t)a3;
- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (double)homescreenWallpaperScale;
- (double)lockscreenWallpaperScale;
- (double)minimumHomescreenWallpaperScale;
- (double)minimumLockscreenWallpaperScale;
- (double)minimumWallpaperScaleForVariant:(int64_t)a3;
- (id)_activeWallpaperView;
- (id)_blurViewsForVariant:(int64_t)a3;
- (id)_newWallpaperEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4;
- (id)_observersForVariant:(int64_t)a3;
- (id)_sourceForFakeBlurView:(id)a3;
- (id)_vendWallpaperViewForConfiguration:(id)a3 forVariant:(int64_t)a4 shared:(BOOL)a5 options:(unint64_t)a6;
- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4;
- (id)averageColorForVariant:(int64_t)a3;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)requireWallpaperWithReason:(id)a3;
- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)substitutionWallpaperConfigurationForWallpaperConfiguration:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)suspendColorSamplingForReason:(id)a3;
- (id)suspendWallpaperAnimationForReason:(id)a3;
- (id)wallpaperConfigurationForUpdatingWallpaperViewsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5;
- (id)wallpaperConfigurationManager:(id)a3 legibilitySettingsForVariant:(int64_t)a4;
- (id)wallpaperStyleInfoForVariant:(int64_t)a3;
- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4;
- (id)wallpaperViewForVariant:(int64_t)a3;
- (int64_t)activeVariant;
- (unint64_t)_bestWallpaperViewInitializationOptionsForVariant:(int64_t)a3 shared:(BOOL)a4 wallpaperOptions:(id)a5 options:(unint64_t)a6;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)wallpaperDataTypesToRequestForUpdatingWallpaperViews;
- (void)_accessibilityReduceTransparencyChanged:(id)a3;
- (void)_beginDisallowRasterizationBlock;
- (void)_beginSuspendingMotionEffectsForStyleIfNeeded;
- (void)_clearWallpaperEffectView:(id)a3;
- (void)_clearWallpaperView:(id)a3;
- (void)_endDisallowRasterizationBlock;
- (void)_endSuspendingMotionEffectsForStyleIfNeeded;
- (void)_handleWallpaperChangedForVariant:(int64_t)a3;
- (void)_handleWallpaperLegibilitySettingsChanged:(id)a3 forVariant:(int64_t)a4;
- (void)_invalidateWallpaperAssertion:(id)a3;
- (void)_precacheStyles:(id)a3 usingTraitCollection:(id)a4;
- (void)_reconfigureBlurViewsForVariant:(int64_t)a3;
- (void)_registerFakeBlurView:(id)a3;
- (void)_removeColorSamplingAssertion:(id)a3;
- (void)_removeWallpaperAnimationAssertion:(id)a3;
- (void)_setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5;
- (void)_suspendOrResumeColorSampling;
- (void)_suspendOrResumeWallpaperAnimation;
- (void)_unregisterFakeBlurView:(id)a3;
- (void)_updateAndPrewarmWallpapers;
- (void)_updateBlurGeneration;
- (void)_updateBlurImagesForVariant:(int64_t)a3;
- (void)_updateMotionEffectsForState:(id *)a3;
- (void)_updateRasterizationState;
- (void)_updateSeparateWallpaperForVariants:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5;
- (void)_updateSharedWallpaperWithOptions:(unint64_t)a3 wallpaperMode:(int64_t)a4;
- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6;
- (void)_updateWallpaperForWallpaperDimming:(BOOL)a3;
- (void)_updateWallpaperForWallpaperMode:(int64_t)a3;
- (void)_updateWallpaperHidden;
- (void)_updateWallpaperParallax;
- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3;
- (void)addObserver:(id)a3 forVariant:(int64_t)a4;
- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3;
- (void)beginSimulatedLiveWallpaperTouchWithReason:(id)a3;
- (void)cancelInProcessAnimations;
- (void)cleanupOldSharedWallpaper:(id)a3 lockSreenWallpaper:(id)a4 homeScreenWallpaper:(id)a5;
- (void)dealloc;
- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4;
- (void)endSimulatedLiveWallpaperTouchWithReason:(id)a3;
- (void)noteDidRotateFromInterfaceOrientation:(int64_t)a3;
- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3;
- (void)preheatWallpaperForVariant:(int64_t)a3;
- (void)providerLegibilitySettingsChanged:(id)a3;
- (void)removeObserver:(id)a3 forVariant:(int64_t)a4;
- (void)removeWallpaperRequiredAssertion:(id)a3;
- (void)setActiveVariant:(int64_t)a3;
- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6;
- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4;
- (void)setCachingIdentifier:(id)a3;
- (void)setColorSamplingDisabled:(BOOL)a3;
- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5;
- (void)setFakeBlurViewOverrideTraitCollection:(id)a3;
- (void)setFixedOrientation:(BOOL)a3;
- (void)setHomescreenWallpaperView:(id)a3;
- (void)setLockscreenOnlyWallpaperAlpha:(double)a3;
- (void)setLockscreenWallpaperContentsRect:(CGRect)a3;
- (void)setLockscreenWallpaperView:(id)a3;
- (void)setReachabilityCoordinator:(id)a3;
- (void)setSharedWallpaperView:(id)a3;
- (void)setWallpaperConfigurationManager:(id)a3;
- (void)setWallpaperPresentingDelegate:(id)a3;
- (void)setWallpaperStyleAnimationAssertion:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIrisWallpaperForInteractiveMode;
- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5;
- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wallpaperEffectImageForStyle:(int64_t)a3 variant:(int64_t)a4 traitCollection:(id)a5 result:(id)a6;
- (void)wallpaperView:(id)a3 didChangeZoomFactor:(double)a4;
- (void)wallpaperViewDidChangeWantsRasterization:(id)a3;
- (void)wallpaperViewDidInvalidateBlurs:(id)a3;
@end

@implementation PBUIWallpaperViewController

- (PBUIWallpaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v45.receiver = self;
  v45.super_class = (Class)PBUIWallpaperViewController;
  v4 = [(PBUIWallpaperViewController *)&v45 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_displayedVariant = -1;
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lockscreenObservers = v5->_lockscreenObservers;
    v5->_lockscreenObservers = (NSHashTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    homescreenObservers = v5->_homescreenObservers;
    v5->_homescreenObservers = (NSHashTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lockscreenBlurViews = v5->_lockscreenBlurViews;
    v5->_lockscreenBlurViews = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    homescreenBlurViews = v5->_homescreenBlurViews;
    v5->_homescreenBlurViews = (NSHashTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    suspendColorSamplingAssertions = v5->_suspendColorSamplingAssertions;
    v5->_suspendColorSamplingAssertions = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    suspendWallpaperAnimationAssertions = v5->_suspendWallpaperAnimationAssertions;
    v5->_suspendWallpaperAnimationAssertions = (NSHashTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    wallpaperScaleAssertions = v5->_wallpaperScaleAssertions;
    v5->_wallpaperScaleAssertions = (NSHashTable *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    requireWallpaperAssertions = v5->_requireWallpaperAssertions;
    v5->_requireWallpaperAssertions = (NSHashTable *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hideHomescreenWallpaperReasons = v5->_hideHomescreenWallpaperReasons;
    v5->_hideHomescreenWallpaperReasons = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hideLockscreenWallpaperReasons = v5->_hideLockscreenWallpaperReasons;
    v5->_hideLockscreenWallpaperReasons = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disallowRasterizationReasonsHomeVariant = v5->_disallowRasterizationReasonsHomeVariant;
    v5->_disallowRasterizationReasonsHomeVariant = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disallowRasterizationReasonsLockVariant = v5->_disallowRasterizationReasonsLockVariant;
    v5->_disallowRasterizationReasonsLockVariant = v28;

    v5->_lockscreenOnlyWallpaperAlpha = 1.0;
    v30 = objc_alloc_init(PBUIWallpaperStyleInfo);
    homescreenStyleInfo = v5->_homescreenStyleInfo;
    v5->_homescreenStyleInfo = v30;

    v32 = objc_alloc_init(PBUIWallpaperStyleInfo);
    lockscreenStyleInfo = v5->_lockscreenStyleInfo;
    v5->_lockscreenStyleInfo = v32;

    [(PBUIWallpaperConfigurationManager *)v5->_wallpaperConfigurationManager setDelegate:v5];
    v34 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
    wallpaperDefaultsStore = v5->_wallpaperDefaultsStore;
    v5->_wallpaperDefaultsStore = v34;

    [(PBUIWallpaperConfigurationManager *)v5->_wallpaperConfigurationManager setEnableWallpaperDimming:[(PBUIWallpaperDefaultsDomain *)v5->_wallpaperDefaultsStore enableWallpaperDimming]];
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v5 selector:sel__accessibilityReduceTransparencyChanged_ name:*MEMORY[0x1E4F43480] object:0];
    v37 = v5->_wallpaperDefaultsStore;
    v38 = [NSString stringWithUTF8String:"enableWallpaperDimming"];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __54__PBUIWallpaperViewController_initWithNibName_bundle___block_invoke;
    v43[3] = &unk_1E62B2798;
    v39 = v5;
    v44 = v39;
    uint64_t v40 = [(BSAbstractDefaultDomain *)v37 observeDefault:v38 onQueue:MEMORY[0x1E4F14428] withBlock:v43];
    wallpaperEnableDimmingObserver = v39->_wallpaperEnableDimmingObserver;
    v39->_wallpaperEnableDimmingObserver = (BSDefaultObserver *)v40;
  }
  return v5;
}

uint64_t __54__PBUIWallpaperViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = [v1[140] enableWallpaperDimming];
  return [v1 _updateWallpaperForWallpaperDimming:v2];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(BSDefaultObserver *)self->_wallpaperEnableDimmingObserver invalidate];
  [(BSInvalidatable *)self->_colorSamplingAssertion invalidate];
  [(PBUIWallpaperViewController *)self _endSuspendingMotionEffectsForStyleIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperViewController;
  [(PBUIWallpaperViewController *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperViewController *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperViewController;
  [(PBUIWallpaperViewController *)&v10 viewDidLoad];
  v3 = [(PBUIWallpaperViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  wallpaperContainerView = self->_wallpaperContainerView;
  self->_wallpaperContainerView = v5;

  v7 = [(UIView *)self->_wallpaperContainerView layer];
  uint64_t v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  objc_msgSend(v7, "setRasterizationScale:");

  [(UIView *)self->_wallpaperContainerView setClipsToBounds:0];
  [(UIView *)self->_wallpaperContainerView setAutoresizingMask:18];
  [v3 addSubview:self->_wallpaperContainerView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PBUIWallpaperViewController_viewDidLoad__block_invoke;
  v9[3] = &unk_1E62B2798;
  v9[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
}

uint64_t __42__PBUIWallpaperViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAndPrewarmWallpapers];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PBUIWallpaperViewController *)self view];
  v7 = [v6 window];

  uint64_t v8 = [v7 _toWindowOrientation];
  uint64_t v9 = [v7 _fromWindowOrientation];
  [(PBUIWallpaperViewController *)self noteWillAnimateToInterfaceOrientation:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PBUIWallpaperViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E62B40F0;
  v10[4] = self;
  v10[5] = v9;
  [v5 animateAlongsideTransition:&__block_literal_global_17 completion:v10];
}

uint64_t __82__PBUIWallpaperViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteDidRotateFromInterfaceOrientation:*(void *)(a1 + 40)];
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PBUIWallpaperViewController;
  id v4 = a3;
  [(PBUIWallpaperViewController *)&v14 traitCollectionDidChange:v4];
  id v5 = [(PBUIWallpaperViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];
  uint64_t v8 = [v4 _backlightLuminance];

  uint64_t v9 = [v5 _backlightLuminance];
  if (v6 != v7 || (v8 != 1) == (v9 == 1))
  {
    objc_super v10 = [(PBUIWallpaperViewController *)self traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];

    uint64_t v12 = v11 == 1;
    if (v11 == 2) {
      uint64_t v12 = 2;
    }
    if (v9 == 1) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v13) {
      -[PBUIWallpaperViewController _updateWallpaperForWallpaperMode:](self, "_updateWallpaperForWallpaperMode:");
    }
  }
}

- (BOOL)shouldAutorotate
{
  return !self->_fixedOrientation;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_fixedOrientation) {
    return 2;
  }
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperViewController;
  return [(PBUIWallpaperViewController *)&v3 supportedInterfaceOrientations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  id v5 = (PBUIWallpaperConfigurationManager *)a3;
  p_wallpaperConfigurationManager = &self->_wallpaperConfigurationManager;
  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (wallpaperConfigurationManager != v5)
  {
    uint64_t v8 = v5;
    [(PBUIWallpaperConfigurationManager *)wallpaperConfigurationManager setDelegate:0];
    objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
    [(PBUIWallpaperConfigurationManager *)*p_wallpaperConfigurationManager setDelegate:self];
    wallpaperConfigurationManager = (PBUIWallpaperConfigurationManager *)[(PBUIWallpaperConfigurationManager *)*p_wallpaperConfigurationManager setEnableWallpaperDimming:[(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaultsStore enableWallpaperDimming]];
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](wallpaperConfigurationManager, v5);
}

- (void)wallpaperEffectImageForStyle:(int64_t)a3 variant:(int64_t)a4 traitCollection:(id)a5 result:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PBUIWallpaperViewController_wallpaperEffectImageForStyle_variant_traitCollection_result___block_invoke;
  v14[3] = &unk_1E62B4118;
  id v15 = v10;
  id v13 = v10;
  +[PBUIFakeBlurView _imageForStyle:a3 withSource:v12 overrideTraitCollection:v11 result:v14];
}

uint64_t __91__PBUIWallpaperViewController_wallpaperEffectImageForStyle_variant_traitCollection_result___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginSimulatedLiveWallpaperTouchWithReason:(id)a3
{
  id v9 = a3;
  if (![(PBUIWallpaperViewController *)self activeVariant])
  {
    id v4 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:0];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    [v8 beginSimulatedTouchWithReason:v9];
  }
}

- (void)endSimulatedLiveWallpaperTouchWithReason:(id)a3
{
  id v9 = a3;
  id v4 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:0];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [v8 endSimulatedTouchWithReason:v9];
}

- (int64_t)activeVariant
{
  return self->_displayedVariant;
}

- (void)setActiveVariant:(int64_t)a3
{
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (self->_displayedVariant == a3)
  {
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
  else
  {
    id v45 = v10;
    self->_displayedVariant = a3;
    objc_super v14 = [(PBUIWallpaperViewController *)self suspendColorSamplingForReason:@"settingVariant"];
    [(PBUIWallpaperViewController *)self _beginDisallowRasterizationBlock];
    if (a3) {
      id v15 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenStyleInfo;
    }
    else {
      id v15 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenStyleInfo;
    }
    uint64_t v16 = *(Class *)((char *)&self->super.super.super.isa + *v15);
    if (a3) {
      v17 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenStyleInfo;
    }
    else {
      v17 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenStyleInfo;
    }
    id v18 = v16;
    id v19 = *(id *)((char *)&self->super.super.super.isa + *v17);
    uint64_t v20 = v19;
    long long v78 = 0uLL;
    uint64_t v79 = 0;
    if (v19) {
      [v19 styleTransitionState];
    }
    long long v69 = v78;
    uint64_t v70 = v79;
    BOOL v21 = [(PBUIWallpaperViewController *)self _shouldSuspendMotionEffectsForState:&v69];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke;
    v72[3] = &unk_1E62B4140;
    id v40 = v14;
    id v73 = v40;
    v74 = self;
    long long v76 = v78;
    uint64_t v77 = v79;
    id v75 = v13;
    v44 = (void *)MEMORY[0x1C1872570](v72);
    v41 = v20;
    v22 = [v20 wallpaperEffectView];
    v42 = v18;
    v23 = [v18 wallpaperEffectView];
    [v22 setHidden:0];
    [v22 setAlpha:0.0];
    if (self->_sharedWallpaperView)
    {
      [(PBUIWallpaperViewController *)self _updateWallpaperHidden];
      [(PBUIWallpaperViewController *)self _updateWallpaperParallax];
      [(PBUIWallpaperView *)self->_sharedWallpaperView setVariant:a3 withAnimationFactory:v11];
      id v24 = 0;
      id v25 = 0;
    }
    else
    {
      if (a3) {
        v26 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
      }
      else {
        v26 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
      }
      v27 = *(Class *)((char *)&self->super.super.super.isa + *v26);
      if (a3) {
        v28 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
      }
      else {
        v28 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
      }
      id v24 = v27;
      id v25 = *(id *)((char *)&self->super.super.super.isa + *v28);
      [(UIView *)self->_wallpaperContainerView sendSubviewToBack:v25];
      [v24 setHidden:0];
      [v24 setAlpha:0.0];
      if ([v23 currentTransitionStateIsOpaque]) {
        [v25 setAlpha:0.0];
      }
    }
    v43 = v13;
    if (!v21) {
      [(PBUIWallpaperViewController *)self _endSuspendingMotionEffectsForStyleIfNeeded];
    }
    *(void *)&long long v69 = 0;
    *((void *)&v69 + 1) = &v69;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    char v68 = 0;
    v29 = (void *)MEMORY[0x1E4F4F898];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2;
    v64[3] = &unk_1E62B2C38;
    id v65 = v23;
    id v66 = v25;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3;
    v57[3] = &unk_1E62B4168;
    id v39 = v66;
    id v58 = v39;
    id v30 = v65;
    id v59 = v30;
    id v31 = v24;
    id v60 = v31;
    v62 = &v69;
    v63 = v67;
    id v32 = v44;
    id v61 = v32;
    id v10 = v45;
    [v29 animateWithFactory:v45 actions:v64 completion:v57];
    if (a3)
    {
      sharedWallpaperView = self->_sharedWallpaperView;
      [(PBUIWallpaperViewController *)self homescreenWallpaperScale];
      double lockscreenOnlyWallpaperAlpha = 1.0;
    }
    else
    {
      double lockscreenOnlyWallpaperAlpha = self->_lockscreenOnlyWallpaperAlpha;
      sharedWallpaperView = self->_sharedWallpaperView;
      [(PBUIWallpaperViewController *)self lockscreenWallpaperScale];
    }
    -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](sharedWallpaperView, "setZoomFactor:withAnimationFactory:", v11);
    v35 = (void *)MEMORY[0x1E4F4F898];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4;
    v52[3] = &unk_1E62B4190;
    id v36 = v22;
    id v53 = v36;
    double v56 = lockscreenOnlyWallpaperAlpha;
    id v54 = v31;
    v55 = self;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5;
    v46[3] = &unk_1E62B41B8;
    id v37 = v54;
    double v51 = lockscreenOnlyWallpaperAlpha;
    id v47 = v37;
    v49 = v67;
    v50 = &v69;
    id v38 = v32;
    id v48 = v38;
    [v35 animateWithFactory:v11 actions:v52 completion:v46];

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(&v69, 8);

    id v13 = v43;
  }
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) _endDisallowRasterizationBlock];
  uint64_t v2 = *(void **)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  [v2 _updateMotionEffectsForState:&v4];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 40) setHidden:1];
  [*(id *)(a1 + 32) prepareToDisappear];
  uint64_t result = [*(id *)(a1 + 48) prepareToAppear];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
  return result;
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  if (([*(id *)(a1 + 32) currentTransitionStateIsOpaque] & 1) == 0) {
    [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 56)];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1192), "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1184), "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
  uint64_t v2 = *(void **)(*(void *)(a1 + 48) + 1200);
  return objc_msgSend(v2, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    id v8 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v8 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
  }
  id v9 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.super.super.isa + *v8) addObject:v6];
  id v7 = v9;
LABEL_6:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    id v8 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v8 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
  }
  id v9 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.super.super.isa + *v8) removeObject:v6];
  id v7 = v9;
LABEL_6:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    id v6 = [(PBUIWallpaperStyleInfo *)self->_homescreenStyleInfo wallpaperEffectView];
    [v6 setAlpha:a3];

    p_homescreenWallpaperView = &self->_homescreenWallpaperView;
  }
  else
  {
    id v8 = [(PBUIWallpaperStyleInfo *)self->_lockscreenStyleInfo wallpaperEffectView];
    [v8 setHidden:0];

    p_homescreenWallpaperView = &self->_lockscreenWallpaperView;
    [(PBUIWallpaperView *)self->_lockscreenWallpaperView setHidden:0];
    id v9 = [(PBUIWallpaperStyleInfo *)self->_lockscreenStyleInfo wallpaperEffectView];
    [v9 setAlpha:a3];
  }
  id v10 = *p_homescreenWallpaperView;
  [(PBUIWallpaperView *)v10 setAlpha:a3];
}

- (void)setLockscreenWallpaperContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PBUIWallpaperView *)self->_lockscreenWallpaperView hasContentOutsideVisibleBounds])
  {
    -[PBUIWallpaperView setContentsRect:](self->_lockscreenWallpaperView, "setContentsRect:", x, y, width, height);
  }
  if (!self->_displayedVariant
    && [(PBUIWallpaperView *)self->_sharedWallpaperView hasContentOutsideVisibleBounds])
  {
    sharedWallpaperView = self->_sharedWallpaperView;
    -[PBUIWallpaperView setContentsRect:](sharedWallpaperView, "setContentsRect:", x, y, width, height);
  }
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  self->_double lockscreenOnlyWallpaperAlpha = v4;
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke;
    v7[3] = &unk_1E62B31E0;
    v7[4] = self;
    *(double *)&v7[5] = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke_2;
    v6[3] = &unk_1E62B2A50;
    v6[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:v6 completion:0.0];
  }
  else
  {
    lockscreenWallpaperView = self->_lockscreenWallpaperView;
    [(PBUIWallpaperView *)lockscreenWallpaperView setAlpha:v4];
  }
}

uint64_t __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginDisallowRasterizationBlock];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1184);
  double v3 = *(double *)(a1 + 40);
  return [v2 setAlpha:v3];
}

uint64_t __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDisallowRasterizationBlock];
}

- (double)minimumHomescreenWallpaperScale
{
  [(PBUIWallpaperViewController *)self minimumWallpaperScaleForVariant:1];
  return result;
}

- (double)homescreenWallpaperScale
{
  [(PBUIWallpaperViewController *)self _wallpaperScaleForVariant:1];
  return result;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  id v7 = [(PBUIWallpaperViewController *)self _wallpaperScaleAssertionForVariant:1 scale:a3];
  [(PBUIWallpaperViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (double)minimumLockscreenWallpaperScale
{
  [(PBUIWallpaperViewController *)self minimumWallpaperScaleForVariant:0];
  return result;
}

- (double)lockscreenWallpaperScale
{
  [(PBUIWallpaperViewController *)self _wallpaperScaleForVariant:0];
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  id v7 = [(PBUIWallpaperViewController *)self _wallpaperScaleAssertionForVariant:0 scale:a3];
  [(PBUIWallpaperViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  id v6 = a3;
  homescreenWallpaperView = self->_homescreenWallpaperView;
  [(PBUIWallpaperViewController *)self homescreenWallpaperScale];
  -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](homescreenWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  lockscreenWallpaperView = self->_lockscreenWallpaperView;
  [(PBUIWallpaperViewController *)self lockscreenWallpaperScale];
  -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](lockscreenWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  if (self->_sharedWallpaperView)
  {
    if (self->_displayedVariant) {
      [(PBUIWallpaperViewController *)self homescreenWallpaperScale];
    }
    else {
      [(PBUIWallpaperViewController *)self lockscreenWallpaperScale];
    }
    -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](self->_sharedWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  }
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

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v7 = [PBUIWallpaperScaleAssertion alloc];
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper scale %f", *(void *)&a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PBUIWallpaperViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v13[3] = &unk_1E62B3310;
  objc_copyWeak(&v14, &location);
  double v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v13, a4);

  uint64_t v10 = PBUILogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 description];
    *(_DWORD *)buf = 138412290;
    long long v17 = v11;
    _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring wallpaper scale assertion %@", buf, 0xCu);
  }
  [(NSHashTable *)self->_wallpaperScaleAssertions addObject:v9];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

void __72__PBUIWallpaperViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
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
      double v9 = [v5 description];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Removing wallpaper scale assertion %@", (uint8_t *)&v10, 0xCu);
    }
    [WeakRetained[142] removeObject:v5];
    [WeakRetained _updateWallpaperScaleWithAnimationFactory:v6];
  }
}

- (double)minimumWallpaperScaleForVariant:(int64_t)a3
{
  double v4 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a3];
  [v4 parallaxFactor];
  double v6 = v5;

  uint64_t v7 = [(PBUIWallpaperViewController *)self wallpaperConfigurationManager];
  [v7 wallpaperSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v7 parallaxDeviceType];
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v12, 1, v9, v11, v6);
  double v14 = v13;
  double v16 = v15;
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v12, 1, v9, v11, 0.0);
  double v18 = v17 / v16;
  double v20 = v19 / v14;
  if (v18 >= v20) {
    double v21 = v18;
  }
  else {
    double v21 = v20;
  }

  return v21;
}

- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (uint64_t)a5;
  uint64_t v10 = v8;
  if (a4 == 1)
  {
    uint64_t v8 = [(PBUIWallpaperViewController *)self _setDisallowRasterization:v6 withReason:v8 reasons:self->_disallowRasterizationReasonsHomeVariant];
    uint64_t v9 = v10;
    if (v8)
    {
LABEL_4:
      uint64_t v8 = [(PBUIWallpaperViewController *)self _updateRasterizationState];
      uint64_t v9 = v10;
    }
  }
  else
  {
    uint64_t v9 = v8;
    if (!a4)
    {
      uint64_t v8 = [(PBUIWallpaperViewController *)self _setDisallowRasterization:v6 withReason:v8 reasons:self->_disallowRasterizationReasonsLockVariant];
      uint64_t v9 = v10;
      if (v8) {
        goto LABEL_4;
      }
    }
  }
  MEMORY[0x1F41817F8](v8, v9);
}

- (void)setColorSamplingDisabled:(BOOL)a3
{
  if (self->_colorSamplingDisabled != a3)
  {
    self->_colorSamplingDisabled = a3;
    colorSamplingAssertion = self->_colorSamplingAssertion;
    if (a3)
    {
      if (colorSamplingAssertion) {
        return;
      }
      double v5 = [(PBUIWallpaperViewController *)self suspendColorSamplingForReason:@"ExplicitlyDisabled"];
    }
    else
    {
      if (!colorSamplingAssertion) {
        return;
      }
      [(BSInvalidatable *)colorSamplingAssertion invalidate];
      double v5 = 0;
    }
    BOOL v6 = self->_colorSamplingAssertion;
    self->_colorSamplingAssertion = v5;
    MEMORY[0x1F41817F8](v5, v6);
  }
}

- (id)suspendColorSamplingForReason:(id)a3
{
  id v4 = a3;
  double v5 = [[_PBUIWallpaperViewControllerAssertion alloc] initWithWallpaperViewController:self type:0 reason:v4];

  [(NSHashTable *)self->_suspendColorSamplingAssertions addObject:v5];
  [(PBUIWallpaperViewController *)self _suspendOrResumeColorSampling];
  return v5;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [[_PBUIWallpaperViewControllerAssertion alloc] initWithWallpaperViewController:self type:1 reason:v4];

  [(NSHashTable *)self->_suspendWallpaperAnimationAssertions addObject:v5];
  [(PBUIWallpaperViewController *)self _suspendOrResumeWallpaperAnimation];
  BOOL v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    suspendWallpaperAnimationAssertions = self->_suspendWallpaperAnimationAssertions;
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = suspendWallpaperAnimationAssertions;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_INFO, "Adding wallpaper animation (and parallax) assertion: %@ \nAll assertions: %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)cancelInProcessAnimations
{
  id v3 = [(PBUIWallpaperViewController *)self view];
  uint64_t v2 = [v3 window];
  [v2 _removeAllRetargetableAnimations:1];
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  id v4 = [(PBUIWallpaperViewController *)self homescreenStyleInfo];
  if (v4)
  {
    BOOL v6 = v4;
    [v4 styleTransitionState];
    id v4 = v6;
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
  LOBYTE(a5) = [(PBUIWallpaperViewController *)self setWallpaperStyleTransitionState:v12 forPriority:a4 forVariant:a5 withAnimationFactory:v10];

  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  if ((unint64_t)a4 >= 5)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBUIWallpaperViewController.m", 646, @"invalid wallpaper style priority (%i)", a4);
  }
  uint64_t v12 = PBUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = PBUIStringForWallpaperVariant(a5);
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(double *)&buf[16] = a3->var2;
    double v14 = PBUIStringForStyleTransitionState((unint64_t *)buf);
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v14;
    _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_INFO, "Set wallpaper style state for priority %li for variant %{public}@ to %{public}@", buf, 0x20u);
  }
  double v15 = [(PBUIWallpaperViewController *)self wallpaperStyleInfoForVariant:a5];
  *(_DWORD *)&v19[3] = 0;
  *(_DWORD *)double v19 = 0;
  *(double *)&v19[23] = a3->var2;
  *(_OWORD *)&v19[7] = *(_OWORD *)&a3->var0;
  buf[0] = 1;
  *(_OWORD *)&buf[1] = *(_OWORD *)v19;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v19[15];
  [v15 setPriorityInfo:buf forPriority:a4];
  BOOL v16 = [(PBUIWallpaperViewController *)self _updateEffectViewForVariant:a5 withFactory:v11];

  return v16;
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ((unint64_t)a3 >= 5)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBUIWallpaperViewController.m", 658, @"invalid wallpaper style priority (%i)", a3);
  }
  id v10 = PBUILogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = PBUIStringForWallpaperVariant(a4);
    *(_DWORD *)buf = 134218242;
    int64_t v17 = a3;
    __int16 v18 = 2114;
    double v19 = v11;
    _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_INFO, "Remove wallpaper style for priority %li for variant %{public}@", buf, 0x16u);
  }
  uint64_t v12 = [(PBUIWallpaperViewController *)self wallpaperStyleInfoForVariant:a4];
  [v12 removePriorityInfoForPriority:a3];
  BOOL v13 = [(PBUIWallpaperViewController *)self _updateEffectViewForVariant:a4 withFactory:v9];

  return v13;
}

- (id)requireWallpaperWithReason:(id)a3
{
  id v4 = a3;
  double v5 = [[_PBUIWallpaperViewControllerAssertion alloc] initWithWallpaperViewController:self type:2 reason:v4];

  [(NSHashTable *)self->_requireWallpaperAssertions addObject:v5];
  [(PBUIWallpaperViewController *)self _updateWallpaperHidden];
  return v5;
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  id v3 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a3];
  [v3 preheatImageData];
}

- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PBUIWallpaperViewController.m", 682, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  homescreenStyleChangeDelayReasons = self->_homescreenStyleChangeDelayReasons;
  if (!homescreenStyleChangeDelayReasons)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = self->_homescreenStyleChangeDelayReasons;
    self->_homescreenStyleChangeDelayReasons = v7;

    id v5 = v10;
    homescreenStyleChangeDelayReasons = self->_homescreenStyleChangeDelayReasons;
  }
  [(NSMutableSet *)homescreenStyleChangeDelayReasons addObject:v5];
}

- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PBUIWallpaperViewController.m", 691, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  BOOL v8 = [(PBUIWallpaperViewController *)self shouldDelayHomescreenStyleUpdates];
  [(NSMutableSet *)self->_homescreenStyleChangeDelayReasons removeObject:v11];
  BOOL v9 = [(PBUIWallpaperViewController *)self shouldDelayHomescreenStyleUpdates];
  if (v8 && !v9) {
    [(PBUIWallpaperViewController *)self _updateEffectViewForVariant:1 withFactory:v7];
  }
}

- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer
{
  p_lockscreenWallpaperView = &self->_lockscreenWallpaperView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (p_lockscreenWallpaperView = &self->_sharedWallpaperView, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = *p_lockscreenWallpaperView;
  }
  else
  {
    id v4 = 0;
  }
  return (PBUIIrisWallpaperPlaying *)v4;
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  sharedWallpaperView = self->_sharedWallpaperView;
  if (!sharedWallpaperView) {
    sharedWallpaperView = self->_lockscreenWallpaperView;
  }
  id v3 = sharedWallpaperView;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(PBUIWallpaperView *)v3 irisPlaybackState])
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = 1;
      [(PBUIWallpaperView *)v3 switchToIrisMode:1];
    }
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)updateIrisWallpaperForInteractiveMode
{
  sharedWallpaperView = self->_sharedWallpaperView;
  if (!sharedWallpaperView) {
    sharedWallpaperView = self->_lockscreenWallpaperView;
  }
  id v3 = sharedWallpaperView;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PBUIWallpaperView *)v3 switchToIrisMode:0];
  }
}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(PBUIWallpaperView *)self->_sharedWallpaperView setRotating:1];
  [(PBUIWallpaperView *)self->_homescreenWallpaperView setRotating:1];
  [(PBUIWallpaperView *)self->_lockscreenWallpaperView setRotating:1];
  id v5 = [(PBUIWallpaperViewController *)self _activeWallpaperView];
  int v6 = [v5 needsImmediateLayoutBeforeRotation];

  if (v6) {
    [(UIView *)self->_wallpaperContainerView layoutIfNeeded];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = self->_lockscreenBlurViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v11++) rotateToInterfaceOrientation:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_homescreenBlurViews;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "rotateToInterfaceOrientation:", a3, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (a3 != 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PBUIWallpaperView *)self->_sharedWallpaperView switchToIrisMode:1];
    }
  }
}

- (void)noteDidRotateFromInterfaceOrientation:(int64_t)a3
{
  [(PBUIWallpaperView *)self->_sharedWallpaperView setRotating:0];
  [(PBUIWallpaperView *)self->_homescreenWallpaperView setRotating:0];
  lockscreenWallpaperView = self->_lockscreenWallpaperView;
  [(PBUIWallpaperView *)lockscreenWallpaperView setRotating:0];
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  uint64_t v10 = [WeakRetained wallpaperPresenter:self requestsOrientationWithRefresh:1];

  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (a4 && IsReduceTransparencyEnabled)
  {
    uint64_t v12 = [[PBUIAccessibilityTintView alloc] initWithVariant:a3 wallpaperViewController:self];
    [(PBUIAccessibilityTintView *)v12 setTransformOptions:a5];
  }
  else
  {
    uint64_t v13 = [[PBUIFakeBlurView alloc] initWithVariant:a3 wallpaperViewController:self transformOptions:a5 reachabilityCoordinator:self->_reachabilityCoordinator];
    uint64_t v12 = (PBUIAccessibilityTintView *)v13;
    if (v10)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F42FF0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__PBUIWallpaperViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
      v16[3] = &unk_1E62B31E0;
      uint64_t v12 = v13;
      long long v17 = v12;
      uint64_t v18 = v10;
      [v14 performWithoutAnimation:v16];
    }
  }
  return v12;
}

uint64_t __80__PBUIWallpaperViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rotateToInterfaceOrientation:*(void *)(a1 + 40)];
}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
}

- (BOOL)homeScreenPosterMirrorsLock
{
  return self->_sharedWallpaperView != 0;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  if (self->_sharedWallpaperView)
  {
    sharedWallpaperView = self->_sharedWallpaperView;
  }
  else
  {
    if (a3)
    {
      if (a3 != 1)
      {
        id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid wallpaper variant to legibilitySettingsForVariant:" userInfo:0];
        objc_exception_throw(v7);
      }
      uint64_t v4 = 1192;
    }
    else
    {
      uint64_t v4 = 1184;
    }
    sharedWallpaperView = *(PBUIWallpaperView **)((char *)&self->super.super.super.isa + v4);
  }
  id v5 = [(PBUIWallpaperView *)sharedWallpaperView legibilitySettings];
  return v5;
}

- (id)averageColorForVariant:(int64_t)a3
{
  id v3 = [(PBUIWallpaperViewController *)self legibilitySettingsForVariant:a3];
  uint64_t v4 = [v3 contentColor];

  return v4;
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return -[PBUIWallpaperViewController averageColorInRect:forVariant:withSmudgeRadius:](self, "averageColorInRect:forVariant:withSmudgeRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v12 = -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:");
  if (!v12) {
    goto LABEL_5;
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  if (CGRectIsNull(v28)) {
    goto LABEL_5;
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  if (CGRectIsEmpty(v29)) {
    goto LABEL_5;
  }
  uint64_t v13 = [(PBUIWallpaperViewController *)self view];
  uint64_t v14 = [v13 window];
  uint64_t v15 = [v14 _screen];
  uint64_t v16 = [v15 coordinateSpace];
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v16, x, y, width, height);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  id v25 = objc_msgSend(v12, "averageColorInRect:withSmudgeRadius:", v18, v20, v22, v24, a5);
  if (!v25)
  {
LABEL_5:
    id v25 = [(PBUIWallpaperViewController *)self averageColorForVariant:a4];
  }

  return v25;
}

- (double)contrastForVariant:(int64_t)a3
{
  double v3 = *(double *)&PBUIWallpaperViewUnknownContrast;
  uint64_t v4 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a3];
  id v5 = v4;
  if (v4)
  {
    [v4 contrast];
    double v3 = v6;
  }

  return v3;
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = *(double *)&PBUIWallpaperViewUnknownContrast;
  uint64_t v10 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a4];
  if (v10)
  {
    uint64_t v11 = [(PBUIWallpaperViewController *)self view];
    uint64_t v12 = [v11 window];
    uint64_t v13 = [v12 _screen];
    uint64_t v14 = [v13 coordinateSpace];
    objc_msgSend(v10, "convertRect:fromCoordinateSpace:", v14, x, y, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    objc_msgSend(v10, "contrastInRect:", v16, v18, v20, v22);
    double v9 = v23;
  }

  return v9;
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  id v5 = [(PBUIWallpaperViewController *)self wallpaperConfigurationManager];
  double v6 = [v5 wallpaperConfigurationForVariant:1 includingValuesForTypes:a4];

  return v6;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  uint64_t v4 = (PBUIWallpaperView *)a3;
  id v7 = v4;
  if (self->_lockscreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    id v5 = [(PBUIWallpaperView *)v4 legibilitySettings];
    [(PBUIWallpaperViewController *)self _handleWallpaperLegibilitySettingsChanged:v5 forVariant:0];

    uint64_t v4 = v7;
  }
  if (self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    double v6 = [(PBUIWallpaperView *)v7 legibilitySettings];
    [(PBUIWallpaperViewController *)self _handleWallpaperLegibilitySettingsChanged:v6 forVariant:1];

    uint64_t v4 = v7;
  }
}

- (void)wallpaperViewDidInvalidateBlurs:(id)a3
{
  uint64_t v4 = (PBUIWallpaperView *)a3;
  id v5 = v4;
  if (self->_lockscreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    [(PBUIWallpaperViewController *)self _updateBlurImagesForVariant:0];
    uint64_t v4 = v5;
  }
  if (self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v5) {
    [(PBUIWallpaperViewController *)self _updateBlurImagesForVariant:1];
  }
  [MEMORY[0x1E4F39CF8] setLowLatency:0];
}

- (void)wallpaperView:(id)a3 didChangeZoomFactor:(double)a4
{
  id v5 = (PBUIWallpaperView *)a3;
  double v6 = v5;
  if (self->_lockscreenWallpaperView == v5 || self->_sharedWallpaperView == v5)
  {
    [(PBUIWallpaperViewController *)self _reconfigureBlurViewsForVariant:0];
    id v5 = v6;
  }
  if (self->_homescreenWallpaperView == v5 || self->_sharedWallpaperView == v5)
  {
    [(PBUIWallpaperViewController *)self _reconfigureBlurViewsForVariant:1];
    id v5 = v6;
  }
}

- (void)wallpaperViewDidChangeWantsRasterization:(id)a3
{
  uint64_t v4 = (PBUIWallpaperView *)a3;
  if (self->_lockscreenWallpaperView == v4 || self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    id v5 = v4;
    [(PBUIWallpaperViewController *)self _updateRasterizationState];
    uint64_t v4 = v5;
  }
}

- (id)wallpaperConfigurationManager:(id)a3 legibilitySettingsForVariant:(int64_t)a4
{
  return [(PBUIWallpaperViewController *)self legibilitySettingsForVariant:a4];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", 0, a4);
  [(PBUIWallpaperViewController *)self _updateBlurImagesForVariant:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(PBUIWallpaperViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  double v6 = [v4 builderWithObject:self];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v21[3] = &unk_1E62B2C38;
  id v7 = v6;
  id v22 = v7;
  double v23 = self;
  [v7 appendBodySectionWithName:@"HomeScreen" multilinePrefix:v5 block:v21];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  double v18 = &unk_1E62B2C38;
  id v8 = v7;
  id v19 = v8;
  double v20 = self;
  [v8 appendBodySectionWithName:@"LockScreen" multilinePrefix:v5 block:&v15];

  if ([(NSHashTable *)self->_suspendColorSamplingAssertions count]) {
    id v9 = (id)[v8 appendObject:self->_suspendColorSamplingAssertions withName:@"suspendColorSamplingAssertions"];
  }
  if ([(NSHashTable *)self->_suspendWallpaperAnimationAssertions count]) {
    id v10 = (id)[v8 appendObject:self->_suspendWallpaperAnimationAssertions withName:@"suspendWallpaperAnimationAssertions"];
  }
  if ([(NSHashTable *)self->_requireWallpaperAssertions count]) {
    id v11 = (id)[v8 appendObject:self->_requireWallpaperAssertions withName:@"requireWallpaperAssertions"];
  }
  id v12 = (id)[v8 appendObject:self->_wallpaperConfigurationManager withName:@"wallpaperConfigurationManager"];
  id v13 = v8;

  return v13;
}

void __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) homescreenStyleInfo];
  id v4 = (id)[v2 appendObject:v3 withName:@"StyleInfo"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 1112) allObjects];
  [v5 appendArraySection:v6 withName:@"homescreenStyleChangeDelayReasons" skipIfEmpty:1];
}

void __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) lockscreenStyleInfo];
  id v2 = (id)[v1 appendObject:v3 withName:@"StyleInfo"];
}

- (id)succinctDescription
{
  id v2 = [(PBUIWallpaperViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (BOOL)_isRasterizationDisallowedForCurrentVariant
{
  int64_t displayedVariant = self->_displayedVariant;
  if (displayedVariant == 1)
  {
    id v3 = &OBJC_IVAR___PBUIWallpaperViewController__disallowRasterizationReasonsHomeVariant;
  }
  else
  {
    if (displayedVariant)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v3 = &OBJC_IVAR___PBUIWallpaperViewController__disallowRasterizationReasonsLockVariant;
  }
  id v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
LABEL_7:
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)_setDisallowRasterization:(BOOL)a3 withReason:(id)a4 reasons:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  int v9 = [v8 containsObject:v7];
  if (!v6)
  {
    if (v9)
    {
      [v8 removeObject:v7];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if (v9) {
    goto LABEL_7;
  }
  [v8 addObject:v7];
LABEL_6:
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (void)_beginDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  self->_int64_t disallowRasterizationBlockCount = disallowRasterizationBlockCount + 1;
  if (!disallowRasterizationBlockCount) {
    [(PBUIWallpaperViewController *)self _updateRasterizationState];
  }
}

- (void)_endDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  if (disallowRasterizationBlockCount <= 0)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PBUIWallpaperViewController.m" lineNumber:1016 description:@"unpaired disallowRastrizationBlock decrement"];

    int64_t disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  }
  int64_t v4 = disallowRasterizationBlockCount - 1;
  self->_int64_t disallowRasterizationBlockCount = v4;
  if (!v4)
  {
    [(PBUIWallpaperViewController *)self _updateRasterizationState];
  }
}

- (void)_updateRasterizationState
{
  if (self->_disallowRasterizationBlockCount > 0
    || [(PBUIWallpaperViewController *)self _isRasterizationDisallowedForCurrentVariant])
  {
    uint64_t v3 = 0;
  }
  else
  {
    int64_t v4 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:self->_displayedVariant];
    uint64_t v3 = [v4 wantsRasterization];
  }
  BOOL v5 = [(UIView *)self->_wallpaperContainerView layer];
  int v6 = [v5 shouldRasterize];

  if (v3 != v6)
  {
    id v7 = [(UIView *)self->_wallpaperContainerView layer];
    [v7 setShouldRasterize:v3];
  }
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return 0;
}

- (id)wallpaperViewForVariant:(int64_t)a3
{
  sharedWallpaperView = self->_sharedWallpaperView;
  if (sharedWallpaperView) {
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    int64_t v4 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
    goto LABEL_6;
  }
  if (!a3)
  {
    int64_t v4 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
LABEL_6:
    sharedWallpaperView = *(PBUIWallpaperView **)((char *)&self->super.super.super.isa + *v4);
LABEL_7:
    BOOL v5 = sharedWallpaperView;
    goto LABEL_8;
  }
  BOOL v5 = 0;
LABEL_8:
  return v5;
}

- (id)_activeWallpaperView
{
  int64_t v3 = [(PBUIWallpaperViewController *)self activeVariant];
  return [(PBUIWallpaperViewController *)self wallpaperViewForVariant:v3];
}

- (void)_suspendOrResumeColorSampling
{
  BOOL v3 = [(NSHashTable *)self->_suspendColorSamplingAssertions count] == 0;
  [(PBUIWallpaperView *)self->_lockscreenWallpaperView setContinuousColorSamplingEnabled:v3];
  [(PBUIWallpaperView *)self->_homescreenWallpaperView setContinuousColorSamplingEnabled:v3];
  sharedWallpaperView = self->_sharedWallpaperView;
  [(PBUIWallpaperView *)sharedWallpaperView setContinuousColorSamplingEnabled:v3];
}

- (void)_suspendOrResumeWallpaperAnimation
{
  BOOL v3 = [(NSHashTable *)self->_suspendWallpaperAnimationAssertions count] == 0;
  [(PBUIWallpaperView *)self->_lockscreenWallpaperView setWallpaperAnimationEnabled:v3];
  [(PBUIWallpaperView *)self->_homescreenWallpaperView setWallpaperAnimationEnabled:v3];
  sharedWallpaperView = self->_sharedWallpaperView;
  [(PBUIWallpaperView *)sharedWallpaperView setWallpaperAnimationEnabled:v3];
}

- (void)_invalidateWallpaperAssertion:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 type];
  if (v4 == 2)
  {
    uint64_t v4 = [(PBUIWallpaperViewController *)self removeWallpaperRequiredAssertion:v6];
  }
  else if (v4 == 1)
  {
    uint64_t v4 = [(PBUIWallpaperViewController *)self _removeWallpaperAnimationAssertion:v6];
  }
  else
  {
    id v5 = v6;
    if (v4) {
      goto LABEL_8;
    }
    uint64_t v4 = [(PBUIWallpaperViewController *)self _removeColorSamplingAssertion:v6];
  }
  id v5 = v6;
LABEL_8:
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_removeColorSamplingAssertion:(id)a3
{
  [(NSHashTable *)self->_suspendColorSamplingAssertions removeObject:a3];
  [(PBUIWallpaperViewController *)self _suspendOrResumeColorSampling];
}

- (void)_removeWallpaperAnimationAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSHashTable *)self->_suspendWallpaperAnimationAssertions removeObject:v4];
  [(PBUIWallpaperViewController *)self _suspendOrResumeWallpaperAnimation];
  id v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    suspendWallpaperAnimationAssertions = self->_suspendWallpaperAnimationAssertions;
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    BOOL v10 = suspendWallpaperAnimationAssertions;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_INFO, "Removing wallpaper animation (and parallax) assertion: %@ \nAll assertions: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)wallpaperStyleInfoForVariant:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = [(PBUIWallpaperViewController *)self homescreenStyleInfo];
  }
  else if (a3)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(PBUIWallpaperViewController *)self lockscreenStyleInfo];
  }
  return v3;
}

- (void)_setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  id v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideHomescreenWallpaperReasons;
  if (!a4) {
    id v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideLockscreenWallpaperReasons;
  }
  int v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  if (a3) {
    [v7 addObject:a5];
  }
  else {
    [v7 removeObject:a5];
  }
  [(PBUIWallpaperViewController *)self _updateWallpaperHidden];
}

- (BOOL)_isWallpaperHiddenForVariant:(int64_t)a3
{
  if ([(NSHashTable *)self->_requireWallpaperAssertions count]) {
    return 0;
  }
  id v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideHomescreenWallpaperReasons;
  if (!a3) {
    id v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideLockscreenWallpaperReasons;
  }
  return [*(id *)((char *)&self->super.super.super.isa + *v6) count] != 0;
}

- (void)_updateWallpaperHidden
{
  BOOL v3 = [(PBUIWallpaperViewController *)self _isWallpaperHiddenForVariant:self->_displayedVariant];
  sharedWallpaperView = self->_sharedWallpaperView;
  if (v3)
  {
    [(PBUIWallpaperView *)sharedWallpaperView setHidden:1];
    [(PBUIWallpaperView *)self->_lockscreenWallpaperView setHidden:1];
    [(PBUIWallpaperView *)self->_homescreenWallpaperView setHidden:1];
    id v5 = [(PBUIWallpaperViewController *)self lockscreenStyleInfo];
    id v6 = [v5 wallpaperEffectView];
    [v6 setHidden:1];

    id v13 = [(PBUIWallpaperViewController *)self homescreenStyleInfo];
    int v7 = [v13 wallpaperEffectView];
    [v7 setHidden:1];
  }
  else
  {
    [(PBUIWallpaperView *)sharedWallpaperView setHidden:0];
    [(PBUIWallpaperView *)self->_lockscreenWallpaperView setHidden:self->_displayedVariant != 0];
    [(PBUIWallpaperView *)self->_homescreenWallpaperView setHidden:self->_displayedVariant != 1];
    id v8 = [(PBUIWallpaperViewController *)self lockscreenStyleInfo];
    __int16 v9 = [v8 wallpaperEffectView];
    [v9 setHidden:self->_displayedVariant != 0];

    BOOL v10 = [(PBUIWallpaperViewController *)self homescreenStyleInfo];
    uint64_t v11 = [v10 wallpaperEffectView];
    [v11 setHidden:self->_displayedVariant != 1];

    int64_t displayedVariant = self->_displayedVariant;
    [(PBUIWallpaperViewController *)self _updateEffectViewForVariant:displayedVariant withFactory:0];
  }
}

- (void)removeWallpaperRequiredAssertion:(id)a3
{
  id v4 = a3;
  if ([(NSHashTable *)self->_requireWallpaperAssertions containsObject:v4])
  {
    [(NSHashTable *)self->_requireWallpaperAssertions removeObject:v4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__PBUIWallpaperViewController_removeWallpaperRequiredAssertion___block_invoke;
    v5[3] = &unk_1E62B2D28;
    v5[4] = self;
    PBUIWallpaperEnumerateVariantsForLocations(3, v5);
    [(PBUIWallpaperViewController *)self _updateWallpaperHidden];
  }
}

uint64_t __64__PBUIWallpaperViewController_removeWallpaperRequiredAssertion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateEffectViewForVariant:a2 withFactory:0];
}

- (void)_updateWallpaperParallax
{
  BOOL v3 = [(PBUIWallpaperViewController *)self wallpaperConfigurationManager];
  sharedWallpaperView = self->_sharedWallpaperView;
  id v13 = v3;
  id v5 = [v3 lockScreenWallpaperConfigurationIncludingValuesForTypes:16];
  id v6 = [v5 wallpaperOptions];

  [v6 parallaxFactor];
  BOOL v8 = fabs(v7) >= 2.22044605e-16;
  if (sharedWallpaperView)
  {
    -[PBUIWallpaperView setParallaxFactor:](self->_sharedWallpaperView, "setParallaxFactor:");
    [(PBUIWallpaperView *)self->_sharedWallpaperView setParallaxEnabled:v8];
  }
  else
  {
    -[PBUIWallpaperView setParallaxFactor:](self->_lockscreenWallpaperView, "setParallaxFactor:");
    [(PBUIWallpaperView *)self->_lockscreenWallpaperView setParallaxEnabled:v8];
    __int16 v9 = [v13 homeScreenWallpaperConfigurationIncludingValuesForTypes:16];
    BOOL v10 = [v9 wallpaperOptions];

    [v10 parallaxFactor];
    double v12 = v11;
    -[PBUIWallpaperView setParallaxFactor:](self->_homescreenWallpaperView, "setParallaxFactor:");
    [(PBUIWallpaperView *)self->_homescreenWallpaperView setParallaxEnabled:fabs(v12) >= 2.22044605e-16];
  }
}

+ (id)substitutionFlatColorForWallpaperName:(id)a3
{
  id v3 = a3;
  if (([v3 hasSuffix:@".Solid_Black"] & 1) != 0
    || [v3 hasSuffix:@".Solid Black"])
  {
    id v4 = [MEMORY[0x1E4F428B8] blackColor];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)substitutionWallpaperConfigurationForWallpaperConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (PBUIWallpaperConfiguration *)a3;
  id v4 = v3;
  if ([(PBUIWallpaperConfiguration *)v3 wallpaperType] == 1)
  {
    id v5 = [(PBUIWallpaperConfiguration *)v3 wallpaperOptions];
    id v6 = [v5 name];
    id v4 = v3;
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() substitutionFlatColorForWallpaperName:v6];
      id v4 = v3;
      if (v7)
      {
        BOOL v8 = (void *)v7;
        __int16 v9 = PBUILogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412546;
          double v12 = v8;
          __int16 v13 = 2112;
          uint64_t v14 = v6;
          _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_INFO, "Substituting flat color '%@' for wallpaper with name '%@'", (uint8_t *)&v11, 0x16u);
        }

        id v4 = [[PBUIWallpaperConfiguration alloc] initWithVariant:[(PBUIWallpaperConfiguration *)v3 variant] type:4];
        [(PBUIWallpaperConfiguration *)v4 setWallpaperColor:v8];
        [(PBUIWallpaperConfiguration *)v4 setWallpaperOptions:v5];
      }
    }
  }
  return v4;
}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6
{
  BOOL v10 = (void (**)(void))a6;
  if ([(PBUIWallpaperViewController *)self variantsShareWallpaper]) {
    [(PBUIWallpaperViewController *)self _updateSharedWallpaperWithOptions:a4 wallpaperMode:a5];
  }
  else {
    [(PBUIWallpaperViewController *)self _updateSeparateWallpaperForVariants:a3 options:a4 wallpaperMode:a5];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__PBUIWallpaperViewController__updateWallpaperForLocations_options_wallpaperMode_withCompletion___block_invoke;
  v11[3] = &unk_1E62B2798;
  v11[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
  if (v10) {
    v10[2](v10);
  }
}

uint64_t __97__PBUIWallpaperViewController__updateWallpaperForLocations_options_wallpaperMode_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWallpaperScaleWithAnimationFactory:0];
  [*(id *)(a1 + 32) setLockscreenOnlyWallpaperAlpha:*(double *)(*(void *)(a1 + 32) + 1064)];
  [*(id *)(a1 + 32) _updateWallpaperParallax];
  [*(id *)(a1 + 32) _updateWallpaperHidden];
  [*(id *)(a1 + 32) _updateBlurGeneration];
  [*(id *)(a1 + 32) _suspendOrResumeColorSampling];
  id v2 = *(void **)(a1 + 32);
  return [v2 _suspendOrResumeWallpaperAnimation];
}

- (BOOL)_isWallpaperView:(id)a3 displayingWallpaperWithConfiguration:(id)a4 forVariant:(int64_t)a5
{
  return [a3 isDisplayingWallpaperWithConfiguration:a4 forVariant:a5];
}

- (void)_updateSharedWallpaperWithOptions:(unint64_t)a3 wallpaperMode:(int64_t)a4
{
  v47[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 0);
  sharedWallpaperView = self->_sharedWallpaperView;
  if (sharedWallpaperView)
  {
    if ([(PBUIWallpaperViewController *)self _isWallpaperView:sharedWallpaperView displayingWallpaperWithConfiguration:v7 forVariant:0])
    {
      uint64_t v36 = 0;
      id v37 = 0;
      __int16 v9 = 0;
      BOOL v10 = 0;
    }
    else
    {
      __int16 v9 = self->_sharedWallpaperView;
      double v18 = [(UIView *)self->_wallpaperContainerView subviews];
      uint64_t v19 = [v18 indexOfObject:self->_sharedWallpaperView];

      double v20 = (void *)MEMORY[0x1C1872330]();
      [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_sharedWallpaperView];
      [(PBUIWallpaperViewController *)self setSharedWallpaperView:0];
      [(UIView *)self->_wallpaperContainerView insertSubview:v9 atIndex:v19];
      id v37 = 0;
      BOOL v10 = 0;
      uint64_t v36 = 0x100000001;
    }
  }
  else
  {
    HIDWORD(v36) = ![(PBUIWallpaperViewController *)self _isWallpaperView:self->_lockscreenWallpaperView displayingWallpaperWithConfiguration:v7 forVariant:0];
    int v11 = self->_lockscreenWallpaperView;
    double v12 = [(UIView *)self->_wallpaperContainerView subviews];
    uint64_t v13 = [v12 indexOfObject:self->_lockscreenWallpaperView];

    uint64_t v14 = (void *)MEMORY[0x1C1872330]();
    [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_lockscreenWallpaperView];
    [(PBUIWallpaperViewController *)self setLockscreenWallpaperView:0];
    id v37 = v11;
    [(UIView *)self->_wallpaperContainerView insertSubview:v11 atIndex:v13];
    LODWORD(v36) = ![(PBUIWallpaperViewController *)self _isWallpaperView:self->_homescreenWallpaperView displayingWallpaperWithConfiguration:v7 forVariant:1];
    BOOL v10 = self->_homescreenWallpaperView;
    uint64_t v15 = [(UIView *)self->_wallpaperContainerView subviews];
    uint64_t v16 = [v15 indexOfObject:self->_homescreenWallpaperView];

    double v17 = (void *)MEMORY[0x1C1872330]();
    [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_homescreenWallpaperView];
    [(PBUIWallpaperViewController *)self setHomescreenWallpaperView:0];
    [(UIView *)self->_wallpaperContainerView insertSubview:v10 atIndex:v16];
    __int16 v9 = 0;
  }
  double v21 = self->_sharedWallpaperView;
  if (v21) {
    BOOL v22 = v9 == 0;
  }
  else {
    BOOL v22 = 0;
  }
  if (!v22)
  {
    if (self->_displayedVariant == -1) {
      int64_t displayedVariant = 0;
    }
    else {
      int64_t displayedVariant = self->_displayedVariant;
    }
    double v24 = [(PBUIWallpaperViewController *)self _makeWallpaperViewWithConfiguration:v7 forVariant:displayedVariant shared:1 options:a3];
    [(PBUIWallpaperView *)v24 setAlpha:0.0];
    if (v24) {
      [(UIView *)self->_wallpaperContainerView insertSubview:v24 atIndex:0];
    }
    id v25 = self->_sharedWallpaperView;
    self->_sharedWallpaperView = v24;
    v26 = v24;

    uint64_t v27 = (void *)MEMORY[0x1E4F42FF0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke;
    v42[3] = &unk_1E62B2EC8;
    v43 = v9;
    v44 = v37;
    id v45 = v10;
    v46 = self;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke_2;
    v38[3] = &unk_1E62B41E0;
    v38[4] = self;
    id v39 = v43;
    id v40 = v44;
    v41 = v45;
    [v27 animateWithDuration:0 delay:v42 usingSpringWithDamping:v38 initialSpringVelocity:1.0 options:0.0 animations:0.99 completion:0.0];

    double v21 = self->_sharedWallpaperView;
  }
  [(PBUIWallpaperView *)v21 prepareToAppear];
  if ((unint64_t)a4 < 2)
  {
    CGRect v28 = (void *)MEMORY[0x1E4F42F80];
    uint64_t v29 = 1;
    goto LABEL_21;
  }
  if (a4 == 3)
  {
    id v31 = (void *)MEMORY[0x1E4F42F80];
    id v32 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
    v47[0] = v32;
    v33 = [MEMORY[0x1E4F42F80] _traitCollectionWithBacklightLuminance:1];
    v47[1] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    id v30 = [v31 traitCollectionWithTraitsFromCollections:v34];
  }
  else
  {
    if (a4 == 2)
    {
      CGRect v28 = (void *)MEMORY[0x1E4F42F80];
      uint64_t v29 = 2;
LABEL_21:
      id v30 = [v28 traitCollectionWithUserInterfaceStyle:v29];
      goto LABEL_24;
    }
    id v30 = 0;
  }
LABEL_24:
  [(PBUIWallpaperViewController *)self setFakeBlurViewOverrideTraitCollection:v30];
  [(PBUIWallpaperViewController *)self _precacheStyles:self->_sharedWallpaperView usingTraitCollection:v30];
  if (HIDWORD(v36)) {
    [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:0];
  }
  if (v36) {
    [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:1];
  }
  [(PBUIWallpaperViewController *)self setFakeBlurViewOverrideTraitCollection:0];
  v35 = [(PBUIWallpaperViewController *)self wallpaperPresentingDelegate];
  [v35 wallpaperPresenter:self didChangeWallpaperForLocations:3 withConfiguration:v7];
}

uint64_t __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    [*(id *)(a1 + 40) setAlpha:0.0];
    id v2 = *(void **)(a1 + 48);
  }
  [v2 setAlpha:0.0];
  id v3 = *(void **)(*(void *)(a1 + 56) + 1200);
  return [v3 setAlpha:1.0];
}

uint64_t __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupOldSharedWallpaper:*(void *)(a1 + 40) lockSreenWallpaper:*(void *)(a1 + 48) homeScreenWallpaper:*(void *)(a1 + 56)];
}

- (void)_precacheStyles:(id)a3 usingTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((soft_PUIFeatureEnabled(2) & 1) == 0)
  {
    uint64_t v8 = 29;
    id v7 = +[PBUIFakeBlurView _imageForStyle:&v8 withSource:v5 overrideTraitCollection:v6];
  }
}

- (void)_updateSeparateWallpaperForVariants:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  unint64_t v55 = a4;
  char v6 = a3;
  v72[2] = *MEMORY[0x1E4F143B8];
  if ((a3 & 1) != 0 || self->_sharedWallpaperView)
  {
    uint64_t v8 = -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 0, a5, a4);
  }
  else
  {
    uint64_t v8 = 0;
  }
  unint64_t v56 = a5;
  if ((v6 & 2) != 0 || self->_sharedWallpaperView)
  {
    uint64_t v59 = -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 1, a5, v55);
  }
  else
  {
    uint64_t v59 = 0;
  }
  sharedWallpaperView = self->_sharedWallpaperView;
  if (sharedWallpaperView)
  {
    int v10 = ![(PBUIWallpaperViewController *)self _isWallpaperView:sharedWallpaperView displayingWallpaperWithConfiguration:v8 forVariant:0];
    int v60 = ![(PBUIWallpaperViewController *)self _isWallpaperView:self->_sharedWallpaperView displayingWallpaperWithConfiguration:v59 forVariant:1];
    int v11 = self->_sharedWallpaperView;
    double v12 = [(UIView *)self->_wallpaperContainerView subviews];
    uint64_t v13 = v8;
    uint64_t v14 = [v12 indexOfObject:self->_sharedWallpaperView];

    uint64_t v15 = (void *)MEMORY[0x1C1872330]();
    uint64_t v16 = (void *)v59;
    [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_sharedWallpaperView];
    [(PBUIWallpaperViewController *)self setSharedWallpaperView:0];
    uint64_t v17 = v14;
    uint64_t v8 = v13;
    [(UIView *)self->_wallpaperContainerView insertSubview:v11 atIndex:v17];
    double v18 = 0;
    id v61 = 0;
  }
  else
  {
    if (v6)
    {
      if (-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_lockscreenWallpaperView))
      {
        double v18 = 0;
        int v10 = 0;
      }
      else
      {
        double v18 = self->_lockscreenWallpaperView;
        uint64_t v19 = [(UIView *)self->_wallpaperContainerView subviews];
        uint64_t v20 = [v19 indexOfObject:self->_lockscreenWallpaperView];

        double v21 = (void *)MEMORY[0x1C1872330]();
        [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_lockscreenWallpaperView];
        [(PBUIWallpaperViewController *)self setLockscreenWallpaperView:0];
        [(UIView *)self->_wallpaperContainerView insertSubview:v18 atIndex:v20];
        int v10 = 1;
      }
    }
    else
    {
      double v18 = 0;
      int v10 = 0;
    }
    uint64_t v16 = (void *)v59;
    if ((v6 & 2) != 0)
    {
      if ([(PBUIWallpaperViewController *)self _isWallpaperView:self->_homescreenWallpaperView displayingWallpaperWithConfiguration:v59 forVariant:1])
      {
        int v11 = 0;
        id v61 = 0;
        int v60 = 0;
      }
      else
      {
        BOOL v22 = self->_homescreenWallpaperView;
        double v23 = [(UIView *)self->_wallpaperContainerView subviews];
        uint64_t v24 = [v23 indexOfObject:self->_homescreenWallpaperView];

        id v25 = (void *)MEMORY[0x1C1872330]();
        [(PBUIWallpaperViewController *)self _clearWallpaperView:self->_homescreenWallpaperView];
        [(PBUIWallpaperViewController *)self setHomescreenWallpaperView:0];
        id v61 = v22;
        [(UIView *)self->_wallpaperContainerView insertSubview:v22 atIndex:v24];
        int v11 = 0;
        int v60 = 1;
      }
    }
    else
    {
      int v11 = 0;
      id v61 = 0;
      int v60 = 0;
    }
  }
  p_lockscreenWallpaperView = &self->_lockscreenWallpaperView;
  if (v18) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = self->_lockscreenWallpaperView == 0;
  }
  if (v27 && v8)
  {
    CGRect v28 = [(PBUIWallpaperViewController *)self _makeWallpaperViewWithConfiguration:v8 forVariant:0 shared:0 options:v55];
    objc_storeStrong((id *)p_lockscreenWallpaperView, v28);
    if (v11) {
      uint64_t v29 = v11;
    }
    else {
      uint64_t v29 = v18;
    }
    if ((unint64_t)v11 | (unint64_t)v18)
    {
      id v30 = v29;
      if (*p_lockscreenWallpaperView) {
        [(UIView *)self->_wallpaperContainerView insertSubview:*p_lockscreenWallpaperView above:v30];
      }
    }
    else
    {
      if (*p_lockscreenWallpaperView) {
        [(UIView *)self->_wallpaperContainerView insertSubview:*p_lockscreenWallpaperView atIndex:0];
      }
      id v30 = 0;
    }
    -[PBUIWallpaperView setAlpha:](*p_lockscreenWallpaperView, "setAlpha:", 0.0, v55);
    id v31 = (void *)MEMORY[0x1E4F42FF0];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke;
    v71[3] = &unk_1E62B2798;
    v71[4] = self;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_2;
    void v67[3] = &unk_1E62B41E0;
    v67[4] = self;
    char v68 = v11;
    long long v69 = v18;
    uint64_t v70 = v61;
    [v31 animateWithDuration:0 delay:v71 usingSpringWithDamping:v67 initialSpringVelocity:1.0 options:0.0 animations:0.99 completion:0.0];
  }
  int v58 = v10;
  p_homescreenWallpaperView = &self->_homescreenWallpaperView;
  if (v61) {
    BOOL v33 = 1;
  }
  else {
    BOOL v33 = self->_homescreenWallpaperView == 0;
  }
  if (v33 && v16)
  {
    v34 = [(PBUIWallpaperViewController *)self _makeWallpaperViewWithConfiguration:v16 forVariant:1 shared:0 options:v55];
    objc_storeStrong((id *)&self->_homescreenWallpaperView, v34);
    if (v11) {
      v35 = v11;
    }
    else {
      v35 = v61;
    }
    uint64_t v36 = v18;
    if ((unint64_t)v11 | (unint64_t)v61)
    {
      id v37 = v35;
      if (*p_homescreenWallpaperView) {
        [(UIView *)self->_wallpaperContainerView insertSubview:*p_homescreenWallpaperView above:v37];
      }
    }
    else
    {
      if (*p_homescreenWallpaperView) {
        [(UIView *)self->_wallpaperContainerView insertSubview:*p_homescreenWallpaperView atIndex:0];
      }
      id v37 = 0;
    }
    -[PBUIWallpaperView setAlpha:](*p_homescreenWallpaperView, "setAlpha:", 0.0, v55);
    id v38 = (void *)MEMORY[0x1E4F42FF0];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_3;
    v66[3] = &unk_1E62B2798;
    v66[4] = self;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_4;
    v62[3] = &unk_1E62B41E0;
    v62[4] = self;
    v63 = v11;
    v64 = v36;
    id v65 = v61;
    id v39 = v38;
    double v18 = v36;
    [v39 animateWithDuration:0 delay:v66 usingSpringWithDamping:v62 initialSpringVelocity:1.0 options:0.0 animations:0.99 completion:0.0];
  }
  int64_t displayedVariant = self->_displayedVariant;
  BOOL v41 = displayedVariant == 1;
  if (displayedVariant == 1) {
    v42 = &self->_lockscreenWallpaperView;
  }
  else {
    v42 = &self->_homescreenWallpaperView;
  }
  v43 = v18;
  if (!v41) {
    double v18 = v61;
  }
  -[UIView sendSubviewToBack:](self->_wallpaperContainerView, "sendSubviewToBack:", *v42, v55);
  [(UIView *)self->_wallpaperContainerView sendSubviewToBack:v18];
  int v44 = v58;
  if (v58 && !self->_displayedVariant) {
    [(PBUIWallpaperView *)*p_lockscreenWallpaperView prepareToAppear];
  }
  if (v60 && self->_displayedVariant == 1) {
    [(PBUIWallpaperView *)*p_homescreenWallpaperView prepareToAppear];
  }
  if (v56 < 2)
  {
    id v45 = (void *)MEMORY[0x1E4F42F80];
    uint64_t v46 = 1;
    goto LABEL_69;
  }
  if (v56 == 3)
  {
    id v48 = (void *)MEMORY[0x1E4F42F80];
    v57 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
    v72[0] = v57;
    v49 = [MEMORY[0x1E4F42F80] _traitCollectionWithBacklightLuminance:1];
    v72[1] = v49;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    double v51 = v50 = v8;
    id v47 = [v48 traitCollectionWithTraitsFromCollections:v51];

    uint64_t v8 = v50;
    uint64_t v16 = (void *)v59;

    int v44 = v58;
  }
  else
  {
    if (v56 == 2)
    {
      id v45 = (void *)MEMORY[0x1E4F42F80];
      uint64_t v46 = 2;
LABEL_69:
      id v47 = [v45 traitCollectionWithUserInterfaceStyle:v46];
      goto LABEL_72;
    }
    id v47 = 0;
  }
LABEL_72:
  v52 = v43;
  [(PBUIWallpaperViewController *)self setFakeBlurViewOverrideTraitCollection:v47];
  if (v44)
  {
    [(PBUIWallpaperViewController *)self _precacheStyles:*p_lockscreenWallpaperView usingTraitCollection:v47];
    [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:0];
  }
  if (v60)
  {
    [(PBUIWallpaperViewController *)self _precacheStyles:*p_homescreenWallpaperView usingTraitCollection:v47];
    [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:1];
  }
  [(PBUIWallpaperViewController *)self setFakeBlurViewOverrideTraitCollection:0];
  id v53 = [(PBUIWallpaperViewController *)self wallpaperPresentingDelegate];
  id v54 = v53;
  if (v8) {
    [v53 wallpaperPresenter:self didChangeWallpaperForLocations:1 withConfiguration:v8];
  }
  if (v16) {
    [v54 wallpaperPresenter:self didChangeWallpaperForLocations:2 withConfiguration:v16];
  }
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) setAlpha:1.0];
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupOldSharedWallpaper:*(void *)(a1 + 40) lockSreenWallpaper:*(void *)(a1 + 48) homeScreenWallpaper:*(void *)(a1 + 56)];
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setAlpha:1.0];
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupOldSharedWallpaper:*(void *)(a1 + 40) lockSreenWallpaper:*(void *)(a1 + 48) homeScreenWallpaper:*(void *)(a1 + 56)];
}

- (BOOL)shouldDelayHomescreenStyleUpdates
{
  return [(NSMutableSet *)self->_homescreenStyleChangeDelayReasons count] != 0;
}

- (void)_beginSuspendingMotionEffectsForStyleIfNeeded
{
  id v3 = [(PBUIWallpaperViewController *)self wallpaperStyleAnimationAssertion];

  if (!v3)
  {
    id v4 = PBUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax because of requested wallpaper style", v6, 2u);
    }

    id v5 = [(PBUIWallpaperViewController *)self suspendWallpaperAnimationForReason:@"PBUIWallpaperViewIsDarkOrHiddenReason"];
    [(PBUIWallpaperViewController *)self setWallpaperStyleAnimationAssertion:v5];
  }
}

- (void)_endSuspendingMotionEffectsForStyleIfNeeded
{
  id v3 = [(PBUIWallpaperViewController *)self wallpaperStyleAnimationAssertion];

  if (v3)
  {
    id v4 = PBUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_INFO, "Enabling dynamic wallpapers and parallax because of requested wallpaper style", v6, 2u);
    }

    id v5 = [(PBUIWallpaperViewController *)self wallpaperStyleAnimationAssertion];
    [v5 invalidate];

    [(PBUIWallpaperViewController *)self setWallpaperStyleAnimationAssertion:0];
  }
}

- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3
{
  BOOL result = _WallpaperStyleHasDarkBlur(a3);
  if ((unint64_t)(a3 - 1) < 2) {
    return 1;
  }
  return result;
}

- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3
{
  BOOL v5 = [(PBUIWallpaperViewController *)self _shouldSuspendMotionEffectsForStyle:a3->var0];
  BOOL v6 = [(PBUIWallpaperViewController *)self _shouldSuspendMotionEffectsForStyle:a3->var1];
  double var2 = a3->var2;
  if (fabs(var2 + -1.0) < 2.22044605e-16 && v6) {
    return 1;
  }
  char v9 = fabs(var2) < 2.22044605e-16 || v6;
  return v5 & v9;
}

- (void)_updateMotionEffectsForState:(id *)a3
{
  $1D129F7B4C980C50E70029647222EF17 v4 = *a3;
  if ([(PBUIWallpaperViewController *)self _shouldSuspendMotionEffectsForState:&v4])
  {
    [(PBUIWallpaperViewController *)self _beginSuspendingMotionEffectsForStyleIfNeeded];
  }
  else
  {
    [(PBUIWallpaperViewController *)self _endSuspendingMotionEffectsForStyleIfNeeded];
  }
}

- (BOOL)_updateEffectViewForVariant:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 oldEffectView:(id *)a6 newEffectView:(id *)a7
{
  if (a3 == 1) {
    [(PBUIWallpaperViewController *)self homescreenStyleInfo];
  }
  else {
  uint64_t v13 = [(PBUIWallpaperViewController *)self lockscreenStyleInfo];
  }
  uint64_t v14 = [v13 highestValidPriority];
  uint64_t v15 = v14;
  long long v34 = 0uLL;
  double v35 = 0.0;
  if (v13)
  {
    [v13 styleTransitionState];
    long long v32 = 0uLL;
    double v33 = 0.0;
    if ((v15 & 0x8000000000000000) == 0)
    {
      [v13 priorityInfoForPriority:v15];
LABEL_9:
      long long v32 = *(_OWORD *)((char *)v31 + 8);
      double v33 = *((double *)&v31[1] + 1);
      goto LABEL_11;
    }
  }
  else if ((v14 & 0x8000000000000000) == 0)
  {
    memset(v31, 0, sizeof(v31));
    goto LABEL_9;
  }
  long long v32 = 0uLL;
  double v33 = 0.0;
LABEL_11:
  if ([(NSHashTable *)self->_requireWallpaperAssertions count])
  {
    if ((void)v32 == 1 || *((void *)&v32 + 1) == 1) {
      PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)&v32, 0.0);
    }
    if ((void)v34 == 1 || *((void *)&v34 + 1) == 1)
    {
      PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)&v29, 0.0);
      long long v34 = v29;
      double v35 = v30;
    }
  }
  long long v29 = v32;
  double v30 = v33;
  [v13 setStyleTransitionState:&v29];
  uint64_t v16 = [v13 wallpaperEffectView];
  id v17 = v16;
  if (self->_displayedVariant == a3)
  {
    if (a4)
    {
      *(_OWORD *)&a4->var0 = v34;
      a4->double var2 = v35;
    }
    if (a5)
    {
      *(_OWORD *)&a5->var0 = v32;
      a5->double var2 = v33;
    }
    BOOL v18 = 1;
    if ((void)v34 != 1 && *((void *)&v34 + 1) != 1) {
      BOOL v18 = [(PBUIWallpaperViewController *)self _isWallpaperHiddenForVariant:a3];
    }
    uint64_t v19 = v32;
    if ((void)v32 == 1)
    {
      [(PBUIWallpaperViewController *)self _setWallpaperHidden:1 variant:a3 reason:@"WallpaperStyleHidden"];
      [(PBUIWallpaperViewController *)self _clearWallpaperEffectView:v17];
      id v20 = 0;
      goto LABEL_43;
    }
    uint64_t v23 = *((void *)&v32 + 1);
    int v24 = *((void *)&v32 + 1) == 1 || v18;
    if (v24 == 1)
    {
      [(PBUIWallpaperViewController *)self _setWallpaperHidden:*((void *)&v32 + 1) == 1 variant:a3 reason:@"WallpaperStyleHidden"];
      [(PBUIWallpaperViewController *)self _clearWallpaperEffectView:v17];
      [v13 setWallpaperEffectView:0];
      if (v23 == 1)
      {
LABEL_44:
        if (a6) {
          *a6 = 0;
        }
        if (a7) {
          *a7 = 0;
        }
        long long v29 = v32;
        double v30 = v33;
        [(PBUIWallpaperViewController *)self _updateMotionEffectsForState:&v29];
LABEL_68:
        BOOL v27 = 1;
        goto LABEL_69;
      }
      long long v29 = v32;
      double v30 = v33;
      id v20 = [(PBUIWallpaperViewController *)self _newWallpaperEffectViewForVariant:a3 transitionState:&v29];

      id v17 = v20;
LABEL_43:
      [v13 setWallpaperEffectView:v20];
      goto LABEL_44;
    }
    if (v34 != v32 || (BSFloatEqualToFloat() & 1) == 0)
    {
      id v25 = v17;
      id v17 = v25;
      if (v19 | v23)
      {
        if ([v25 prepareToAnimateToTransitionState:&v32])
        {
          id v26 = v17;
          if (a5)
          {
            *(_OWORD *)&a5->var0 = v32;
            a5->double var2 = v33;
          }
        }
        else
        {
          long long v29 = v32;
          double v30 = v33;
          id v26 = [(PBUIWallpaperViewController *)self _newWallpaperEffectViewForVariant:a3 transitionState:&v29];
          [v26 setAlpha:0.0];
        }
      }
      else
      {
        id v26 = 0;
      }
      [v13 setWallpaperEffectView:v26];
      if (a6) {
        *a6 = v17;
      }
      if (a7) {
        *a7 = v26;
      }

      goto LABEL_68;
    }
  }
  else
  {
    BOOL v21 = (void)v32 == 1 || *((void *)&v32 + 1) == 1;
    uint64_t v22 = v21;
    if (v21)
    {
      [(PBUIWallpaperViewController *)self _clearWallpaperEffectView:v16];
      [v13 setWallpaperEffectView:0];
    }
    else
    {
      long long v29 = v32;
      double v30 = v33;
      if (v16)
      {
        [v16 setTransitionState:&v29];
      }
      else
      {
        id v17 = [(PBUIWallpaperViewController *)self _newWallpaperEffectViewForVariant:a3 transitionState:&v29];
        [v13 setWallpaperEffectView:v17];
      }
      [v17 setHidden:1];
    }
    [(PBUIWallpaperViewController *)self _setWallpaperHidden:v22 variant:a3 reason:@"WallpaperStyleHidden"];
  }
  BOOL v27 = 0;
LABEL_69:

  return v27;
}

- (BOOL)_updateEffectViewForVariant:(int64_t)a3 withFactory:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    && [(PBUIWallpaperViewController *)self shouldDelayHomescreenStyleUpdates])
  {
    BOOL v7 = 1;
  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3810000000;
    v21[3] = &unk_1BC54E869;
    memset(&v21[4], 0, 24);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3810000000;
    v20[3] = &unk_1BC54E869;
    memset(&v20[4], 0, 24);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__5;
    v18[4] = __Block_byref_object_dispose__5;
    id v19 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__5;
    void v16[4] = __Block_byref_object_dispose__5;
    id v17 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke;
    v11[3] = &unk_1E62B4208;
    v11[4] = self;
    void v11[5] = &v12;
    v11[9] = v16;
    v11[10] = a3;
    v11[6] = v21;
    v11[7] = v20;
    v11[8] = v18;
    [MEMORY[0x1E4F4F898] animateWithFactory:0 actions:v11];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
    if (*((unsigned char *)v13 + 24))
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_2;
      v10[3] = &unk_1E62B4230;
      v10[4] = self;
      v10[5] = v20;
      void v10[6] = v16;
      v10[7] = v18;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_3;
      v9[3] = &unk_1E62B4258;
      v9[4] = self;
      void v9[5] = v18;
      v9[6] = v16;
      v9[7] = v20;
      [MEMORY[0x1E4F4F898] animateWithFactory:v6 actions:v10 completion:v9];
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v21, 8);
  }

  return v7;
}

void __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[10];
  uint64_t v4 = *(void *)(a1[6] + 8) + 32;
  uint64_t v5 = *(void *)(a1[8] + 8);
  id v6 = *(void **)(v5 + 40);
  uint64_t v7 = *(void *)(a1[7] + 8) + 32;
  uint64_t v8 = *(void *)(a1[9] + 8);
  id v10 = *(id *)(v8 + 40);
  id obj = v6;
  char v9 = [v2 _updateEffectViewForVariant:v3 oldState:v4 newState:v7 oldEffectView:&obj newEffectView:&v10];
  objc_storeStrong((id *)(v5 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v10);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
}

void __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(_OWORD *)(v3 + 32);
  uint64_t v9 = *(void *)(v3 + 48);
  if (([v2 _shouldSuspendMotionEffectsForState:&v8] & 1) == 0) {
    [*(id *)(a1 + 32) _endSuspendingMotionEffectsForStyleIfNeeded];
  }
  [*(id *)(a1 + 32) _beginDisallowRasterizationBlock];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAlpha:1.0];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(_OWORD *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 48);
  [v4 setTransitionState:&v8];
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v6
    || v6 != *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && ([v6 currentTransitionStateIsOpaque] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAlpha:0.0];
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v7 = [*(id *)(a1 + 32) _activeWallpaperView];
      [v7 setAlpha:1.0];
    }
  }
}

uint64_t __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3 != *(void **)(*(void *)(v2 + 8) + 40)) {
    [v3 removeFromSuperview];
  }
  [*(id *)(a1 + 32) _endDisallowRasterizationBlock];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v7 = *(_OWORD *)(v5 + 32);
  uint64_t v8 = *(void *)(v5 + 48);
  return [v4 _updateMotionEffectsForState:&v7];
}

- (void)_handleWallpaperChangedForVariant:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[PBUIWallpaperViewController _observersForVariant:](self, "_observersForVariant:");
  id v6 = (void *)[v5 copy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 wallpaperWillChangeForVariant:a3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v18, "wallpaperDidChangeForVariant:", a3, (void)v19);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  [(PBUIWallpaperViewController *)self _reconfigureBlurViewsForVariant:a3];
  [(PBUIWallpaperViewController *)self _updateBlurImagesForVariant:a3];
}

- (BOOL)variantsShareWallpaper
{
  uint64_t v2 = [(PBUIWallpaperViewController *)self wallpaperConfigurationManager];
  char v3 = [v2 variantsShareWallpaperConfigurationForTypes:54];

  return v3;
}

- (unint64_t)wallpaperDataTypesToRequestForUpdatingWallpaperViews
{
  return 49;
}

- (id)wallpaperConfigurationForUpdatingWallpaperViewsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  unint64_t v7 = [(PBUIWallpaperViewController *)self wallpaperDataTypesToRequestForUpdatingWallpaperViews];
  return [(PBUIWallpaperViewController *)self wallpaperConfigurationForVariant:a3 includingValuesForTypes:v7 wallpaperMode:a4];
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  unint64_t v8 = a4 | 0x10;
  uint64_t v9 = [(PBUIWallpaperViewController *)self wallpaperConfigurationManager];
  uint64_t v10 = [v9 wallpaperConfigurationForVariant:a3 includingValuesForTypes:v8 wallpaperMode:a5];

  uint64_t v11 = [(PBUIWallpaperViewController *)self substitutionWallpaperConfigurationForWallpaperConfiguration:v10];

  return v11;
}

- (void)_registerFakeBlurView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 variant];
  id v6 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenBlurViews;
  if (!v5) {
    id v6 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenBlurViews;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v6) addObject:v4];

  [(PBUIWallpaperViewController *)self _updateBlurGeneration];
}

- (void)_unregisterFakeBlurView:(id)a3
{
  lockscreenBlurViews = self->_lockscreenBlurViews;
  id v5 = a3;
  [(NSHashTable *)lockscreenBlurViews removeObject:v5];
  [(NSHashTable *)self->_homescreenBlurViews removeObject:v5];

  [(PBUIWallpaperViewController *)self _updateBlurGeneration];
}

- (id)_sourceForFakeBlurView:(id)a3
{
  uint64_t v4 = [a3 variant];
  return [(PBUIWallpaperViewController *)self wallpaperViewForVariant:v4];
}

- (void)_updateBlurGeneration
{
  NSUInteger v3 = [(NSHashTable *)self->_homescreenBlurViews count];
  NSUInteger v4 = [(NSHashTable *)self->_lockscreenBlurViews count];
  BOOL v5 = v4 != 0;
  [(PBUIWallpaperView *)self->_sharedWallpaperView setGeneratesBlurredImages:(v3 | v4) != 0];
  [(PBUIWallpaperView *)self->_homescreenWallpaperView setGeneratesBlurredImages:v3 != 0];
  lockscreenWallpaperView = self->_lockscreenWallpaperView;
  [(PBUIWallpaperView *)lockscreenWallpaperView setGeneratesBlurredImages:v5];
}

- (unint64_t)_bestWallpaperViewInitializationOptionsForVariant:(int64_t)a3 shared:(BOOL)a4 wallpaperOptions:(id)a5 options:(unint64_t)a6
{
  if (a4) {
    unint64_t v6 = 11;
  }
  else {
    unint64_t v6 = 10;
  }
  if (objc_msgSend(a5, "supportsCropping", a3)) {
    return v6;
  }
  else {
    return v6 | 0x10;
  }
}

- (Class)_wallpaperViewClassForType:(int64_t)a3
{
  return +[PBUIWallpaperView wallpaperViewClassForWallpaperType:a3];
}

- (id)_vendWallpaperViewForConfiguration:(id)a3 forVariant:(int64_t)a4 shared:(BOOL)a5 options:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  [(UIView *)self->_wallpaperContainerView bounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  long long v19 = [v10 wallpaperOptions];
  uint64_t v20 = [v10 wallpaperType];
  unint64_t v21 = [(PBUIWallpaperViewController *)self _bestWallpaperViewInitializationOptionsForVariant:a4 shared:v7 wallpaperOptions:v19 options:a6];
  long long v22 = [(PBUIWallpaperViewController *)self cachingIdentifier];
  long long v23 = [(PBUIWallpaperViewController *)self _wallpaperViewClassForType:v20];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  int v44 = __Block_byref_object_copy__5;
  id v45 = __Block_byref_object_dispose__5;
  id v46 = 0;
  long long v24 = (void *)MEMORY[0x1E4F42FF0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __92__PBUIWallpaperViewController__vendWallpaperViewForConfiguration_forVariant_shared_options___block_invoke;
  v29[3] = &unk_1E62B4280;
  double v33 = &v41;
  long long v34 = v23;
  uint64_t v35 = v12;
  uint64_t v36 = v14;
  uint64_t v37 = v16;
  uint64_t v38 = v18;
  id v25 = v10;
  id v30 = v25;
  int64_t v39 = a4;
  id v26 = v22;
  id v31 = v26;
  long long v32 = self;
  unint64_t v40 = v21;
  [v24 performWithoutAnimation:v29];
  id v27 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v27;
}

uint64_t __92__PBUIWallpaperViewController__vendWallpaperViewForConfiguration_forVariant_shared_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithFrame:configuration:variant:cacheGroup:delegate:options:", *(void *)(a1 + 32), *(void *)(a1 + 104), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 112), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  NSUInteger v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAutoresizingMask:18];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInternalObserver:*(void *)(a1 + 48)];
  BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return [v5 layoutIfNeeded];
}

- (void)cleanupOldSharedWallpaper:(id)a3 lockSreenWallpaper:(id)a4 homeScreenWallpaper:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1C1872330]();
  [(PBUIWallpaperViewController *)self _clearWallpaperView:v11];
  [(PBUIWallpaperViewController *)self _clearWallpaperView:v8];
  [(PBUIWallpaperViewController *)self _clearWallpaperView:v9];
}

- (void)_clearWallpaperView:(id)a3
{
  id v3 = a3;
  [v3 invalidate];
  [v3 setDelegate:0];
  [v3 setInternalObserver:0];
  [v3 setGeneratesBlurredImages:0];
  [v3 removeFromSuperview];
}

- (void)_clearWallpaperEffectView:(id)a3
{
}

- (id)_newWallpaperEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4
{
  unint64_t v6 = [[PBUIWallpaperEffectViewBase alloc] initWithWallpaperPresenter:self variant:a3 transformOptions:0];
  $1D129F7B4C980C50E70029647222EF17 v8 = *a4;
  [(PBUIWallpaperEffectViewBase *)v6 setTransitionState:&v8];
  [(UIView *)self->_wallpaperContainerView bounds];
  -[PBUIWallpaperEffectViewBase setFrame:](v6, "setFrame:");
  [(PBUIWallpaperEffectViewBase *)v6 setAutoresizingMask:18];
  [(UIView *)self->_wallpaperContainerView addSubview:v6];
  return v6;
}

- (id)_observersForVariant:(int64_t)a3
{
  id v3 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
  if (!a3) {
    id v3 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_blurViewsForVariant:(int64_t)a3
{
  id v3 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenBlurViews;
  if (!a3) {
    id v3 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenBlurViews;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_handleWallpaperLegibilitySettingsChanged:(id)a3 forVariant:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = -[PBUIWallpaperViewController _observersForVariant:](self, "_observersForVariant:", a4, 0);
  $1D129F7B4C980C50E70029647222EF17 v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 wallpaperLegibilitySettingsDidChange:v6 forVariant:a4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(PBUIWallpaperViewController *)self _reconfigureBlurViewsForVariant:a4];
}

- (void)_reconfigureBlurViewsForVariant:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = -[PBUIWallpaperViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) reconfigureWithSource:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateBlurImagesForVariant:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[PBUIWallpaperViewController _blurViewsForVariant:](self, "_blurViewsForVariant:");
  id v6 = [v5 allObjects];

  if ([v6 count])
  {
    uint64_t v7 = [(PBUIWallpaperViewController *)self wallpaperViewForVariant:a3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "updateImageWithSource:", v7, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)_accessibilityReduceTransparencyChanged:(id)a3
{
  [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:0];
  [(PBUIWallpaperViewController *)self _handleWallpaperChangedForVariant:1];
}

- (void)_updateWallpaperForWallpaperMode:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)os_transaction_create();
  int64_t v6 = [(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager wallpaperMode];
  BOOL v8 = a3 == 3 || v6 == 3;
  [(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager setWallpaperMode:a3];
  int v9 = [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaultsStore enableWallpaperDimming];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager dataStores];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    int v14 = v9 | v8;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v16 hasWallpaperImageForVariant:0 wallpaperMode:a3] & 1) != 0
          || ([v16 hasWallpaperImageForVariant:1 wallpaperMode:a3] | v14) == 1)
        {
          [(PBUIWallpaperViewController *)self _updateWallpaperForLocations:3 options:0 wallpaperMode:a3 withCompletion:&__block_literal_global_118];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PBUIWallpaperViewController__updateWallpaperForWallpaperMode___block_invoke_2;
  v17[3] = &unk_1E62B31E0;
  v17[4] = self;
  v17[5] = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v17 options:0 animations:0.8 completion:0.0];
}

void __64__PBUIWallpaperViewController__updateWallpaperForWallpaperMode___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(*(void *)(a1 + 32) + 984);
  uint64_t v2 = [*(id *)(a1 + 32) view];
  if (*(void *)(a1 + 40) == 3
    && ([*(id *)(a1 + 32) _activeWallpaperView],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 handlesInactiveAppearanceTreatment],
        v3,
        (v4 & 1) == 0))
  {
    id v6 = obj;
    if (!obj)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [v2 bounds];
      id obja = (id)objc_msgSend(v7, "initWithFrame:");
      [obja setAutoresizingMask:18];
      BOOL v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.6];
      [obja setBackgroundColor:v8];

      [v2 addSubview:obja];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 984), obja);
      id v6 = obja;
    }
    id obj = v6;
    [v2 bringSubviewToFront:v6];
    double v5 = 1.0;
  }
  else
  {
    double v5 = 0.0;
  }
  [obj setAlpha:v5];
}

- (void)_updateWallpaperForWallpaperDimming:(BOOL)a3
{
  [(PBUIWallpaperConfigurationManager *)self->_wallpaperConfigurationManager setEnableWallpaperDimming:a3];
  id v5 = [(PBUIWallpaperViewController *)self traitCollection];
  uint64_t v4 = [v5 userInterfaceStyle];
  if ([v5 _backlightLuminance] != 1 && v4 == 2) {
    [(PBUIWallpaperViewController *)self _updateWallpaperForLocations:3 options:0 wallpaperMode:2 withCompletion:&__block_literal_global_120];
  }
}

- (void)_updateAndPrewarmWallpapers
{
  id v3 = [(PBUIWallpaperViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [(PBUIWallpaperViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (MGGetBoolAnswer())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke;
    v11[3] = &unk_1E62B2798;
    v11[4] = self;
    [(PBUIWallpaperViewController *)self _updateWallpaperForLocations:3 options:1 wallpaperMode:3 withCompletion:v11];
  }
  if ((soft_PUIFeatureEnabled(3) & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_2;
    v10[3] = &unk_1E62B2798;
    v10[4] = self;
    [(PBUIWallpaperViewController *)self _updateWallpaperForLocations:3 options:1 wallpaperMode:v5 withCompletion:v10];
  }
  if (v7 == 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_3;
  v9[3] = &unk_1E62B2798;
  v9[4] = self;
  [(PBUIWallpaperViewController *)self _updateWallpaperForLocations:3 options:1 wallpaperMode:v8 withCompletion:v9];
}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wallpaperPresentingDelegate];
  [v2 wallpaperPresenterDidCompleteWallpaperChange:*(void *)(a1 + 32)];
}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wallpaperPresentingDelegate];
  [v2 wallpaperPresenterDidCompleteWallpaperChange:*(void *)(a1 + 32)];
}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wallpaperPresentingDelegate];
  [v2 wallpaperPresenterDidCompleteWallpaperChange:*(void *)(a1 + 32)];
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

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (void)setCachingIdentifier:(id)a3
{
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
}

- (BOOL)fixedOrientation
{
  return self->_fixedOrientation;
}

- (void)setFixedOrientation:(BOOL)a3
{
  self->_fixedOrientation = a3;
}

- (BOOL)colorSamplingDisabled
{
  return self->_colorSamplingDisabled;
}

- (PBUIWallpaperView)lockscreenWallpaperView
{
  return self->_lockscreenWallpaperView;
}

- (void)setLockscreenWallpaperView:(id)a3
{
}

- (PBUIWallpaperView)homescreenWallpaperView
{
  return self->_homescreenWallpaperView;
}

- (void)setHomescreenWallpaperView:(id)a3
{
}

- (PBUIWallpaperView)sharedWallpaperView
{
  return self->_sharedWallpaperView;
}

- (void)setSharedWallpaperView:(id)a3
{
}

- (PBUIWallpaperStyleInfo)homescreenStyleInfo
{
  return self->_homescreenStyleInfo;
}

- (PBUIWallpaperStyleInfo)lockscreenStyleInfo
{
  return self->_lockscreenStyleInfo;
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
}

- (UITraitCollection)fakeBlurViewOverrideTraitCollection
{
  return self->_fakeBlurViewOverrideTraitCollection;
}

- (void)setFakeBlurViewOverrideTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_lockscreenStyleInfo, 0);
  objc_storeStrong((id *)&self->_homescreenStyleInfo, 0);
  objc_storeStrong((id *)&self->_sharedWallpaperView, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperView, 0);
  objc_storeStrong((id *)&self->_lockscreenWallpaperView, 0);
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperEnableDimmingObserver, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsStore, 0);
  objc_storeStrong((id *)&self->_homescreenStyleChangeDelayReasons, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_homescreenBlurViews, 0);
  objc_storeStrong((id *)&self->_lockscreenBlurViews, 0);
  objc_storeStrong((id *)&self->_hideLockscreenWallpaperReasons, 0);
  objc_storeStrong((id *)&self->_hideHomescreenWallpaperReasons, 0);
  objc_storeStrong((id *)&self->_requireWallpaperAssertions, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_suspendColorSamplingAssertions, 0);
  objc_storeStrong((id *)&self->_colorSamplingAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenObservers, 0);
  objc_storeStrong((id *)&self->_lockscreenObservers, 0);
  objc_storeStrong((id *)&self->_inactiveAppearanceDimmingView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end