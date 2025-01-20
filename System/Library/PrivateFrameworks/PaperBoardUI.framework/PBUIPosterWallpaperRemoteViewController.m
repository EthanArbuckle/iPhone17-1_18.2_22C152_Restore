@interface PBUIPosterWallpaperRemoteViewController
- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState;
- (BOOL)_canShowWhileLocked;
- (BOOL)homeScreenPosterMirrorsLock;
- (BOOL)isHomeScreenWallpaperDimmed;
- (BOOL)parallaxEnabledForVariant:(int64_t)a3;
- (BOOL)posterHandlesWakeAnimation;
- (BOOL)posterHidesDimmingLayer;
- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5;
- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4;
- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4;
- (BOOL)userTapEventsRequested;
- (NSString)description;
- (PBUIHomeVariantStyleState)currentHomeVariantStyleState;
- (PBUIPosterWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager;
- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate;
- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator;
- (double)_wallpaperScaleForVariant:(int64_t)a3;
- (double)contrastForVariant:(int64_t)a3;
- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (double)homescreenWallpaperScale;
- (double)lockscreenWallpaperScale;
- (double)minimumHomescreenWallpaperScale;
- (double)minimumLockscreenWallpaperScale;
- (double)parallaxFactorForVariant:(int64_t)a3;
- (double)zoomFactorForVariant:(int64_t)a3;
- (id)_observers;
- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4;
- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3;
- (id)averageColorForVariant:(int64_t)a3;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4;
- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5;
- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5;
- (id)legibilitySettingsForVariant:(int64_t)a3;
- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5;
- (id)newImageProviderView;
- (id)posterComponentExternalDisplayConfiguration:(id)a3;
- (id)requireWallpaperRasterizationWithReason:(id)a3;
- (id)requireWallpaperWithReason:(id)a3;
- (id)scenesForBacklightSession;
- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4;
- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)suspendWallpaperAnimationForReason:(id)a3;
- (int64_t)activeVariant;
- (unint64_t)posterSignificantEventsCounter;
- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addStateCaptureHandlers;
- (void)_registerFakeBlurView:(id)a3;
- (void)_unregisterFakeBlurView:(id)a3;
- (void)_updateFallbackView;
- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 forVariant:(int64_t)a4;
- (void)cancelInProcessAnimations;
- (void)dealloc;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)noteHomeVariantStyleStateMayHaveUpdated;
- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4;
- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4;
- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forVariant:(int64_t)a4;
- (void)setActiveVariant:(int64_t)a3;
- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6;
- (void)setAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (void)setExternalDisplayConfiguration:(id)a3;
- (void)setReachabilityCoordinator:(id)a3;
- (void)setWallpaperConfigurationManager:(id)a3;
- (void)setWallpaperObscured:(BOOL)a3;
- (void)setWallpaperPresentingDelegate:(id)a3;
- (void)triggerPosterSignificantEvent;
- (void)triggerPosterTapEvent:(id)a3;
- (void)triggerSceneUpdate;
- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4;
- (void)updateWallpaperAnimationWithProgress:(double)a3;
- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4;
@end

@implementation PBUIPosterWallpaperRemoteViewController

uint64_t __78__PBUIPosterWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnimationSuspended];
}

- (void)cancelInProcessAnimations
{
  id v3 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  v2 = [v3 window];
  [v2 _removeAllRetargetableAnimations:1];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  [(PBUIPosterWallpaperRemoteViewController *)&v16 viewWillLayoutSubviews];
  if (soft_PUIDynamicRotationIsActive())
  {
    id v3 = [(PBUIPosterWallpaperRemoteViewController *)self view];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v15[0] = *MEMORY[0x1E4F1DAB8];
    v15[1] = v4;
    v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v3 setTransform:v15];
  }
  v5 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[UIView setBounds:](self->_containerView, "setBounds:", v7, v9, v11, v13);
  containerView = self->_containerView;
  UIRectGetCenter();
  -[UIView setCenter:](containerView, "setCenter:");
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  double v7 = [(PBUIPosterWallpaperRemoteViewController *)self _wallpaperScaleAssertionForVariant:1 scale:a3];
  [(PBUIPosterWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  objc_initWeak(&location, self);
  double v7 = [PBUIWallpaperScaleAssertion alloc];
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Wallpaper scale %f", *(void *)&a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PBUIPosterWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v11[3] = &unk_1E62B3310;
  objc_copyWeak(&v12, &location);
  double v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v11, a4);

  [(NSHashTable *)self->_wallpaperScaleAssertions addObject:v9];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v9;
}

void __84__PBUIPosterWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[131] removeObject:v8];
    [v7 _updateWallpaperScaleWithAnimationFactory:v5];
  }
}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  id v4 = a3;
  [(PBUIPosterWallpaperRemoteViewController *)self _wallpaperScaleForVariant:[(PBUIPosterWallpaperRemoteViewController *)self activeVariant]];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__PBUIPosterWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke;
    v8[3] = &unk_1E62B31E0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = v5;
    [MEMORY[0x1E4F4F898] animateWithFactory:v4 actions:v8];
  }
  else
  {
    containerView = self->_containerView;
    CGAffineTransformMakeScale(&v7, v5, v5);
    [(UIView *)containerView setTransform:&v7];
  }
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
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

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  return self->_externalDisplayConfiguration;
}

- (void)_updateFallbackView
{
  id v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  unint64_t v4 = [(PBUIPosterWallpaperRemoteViewController *)self activeVariant];
  BOOL IsHidden = PBUIWallpaperStyleIsHidden([(PBUIPosterWallpaperViewController *)self->_viewController activeStyleForVariant:v4]);
  char v6 = IsHidden;
  int IsZero = 1;
  if (v4 <= 1 && !IsHidden)
  {
    double v8 = [(PBUIPosterWallpaperRemoteViewController *)self averageColorForVariant:v4];
    double v9 = v8;
    if (v8)
    {
      id v10 = v8;

      uint64_t v22 = 0;
      double v23 = 0.0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      if ([v10 getRed:&v22 green:&v21 blue:&v20 alpha:&v23])
      {
        if (BSFloatIsZero() && BSFloatIsZero()) {
          int IsZero = BSFloatIsZero();
        }
        else {
          int IsZero = 0;
        }
      }
      id v3 = v10;
    }
  }
  uint64_t v11 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  id v12 = [v11 backgroundColor];
  BOOL v13 = v12 == 0;

  double v23 = 0.0;
  double v14 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  v15 = [v14 backgroundColor];
  int v16 = [v15 getRed:0 green:0 blue:0 alpha:&v23];

  if (v16) {
    BOOL v13 = v23 < 1.0 || v12 == 0;
  }
  if (v4 < 2) {
    char v18 = 1;
  }
  else {
    char v18 = v6;
  }
  if ((v18 & 1) != 0 || ((IsZero ^ 1) & 1) != 0 || v13)
  {
    long long v19 = [(PBUIPosterWallpaperRemoteViewController *)self view];
    [v19 setBackgroundColor:v3];
  }
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController requireWallpaperRasterizationWithReason:a3];
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10 = a6;
  PBUIWallpaperStyleTransitionStateMake(a3, a3, (uint64_t)v12, 0.0);
  LOBYTE(a5) = [(PBUIPosterWallpaperRemoteViewController *)self setWallpaperStyleTransitionState:v12 forPriority:a4 forVariant:a5 withAnimationFactory:v10];

  [(PBUIPosterWallpaperRemoteViewController *)self _updateFallbackView];
  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10 = a6;
  if (!PBUIWallpaperVariantIsValid(a5))
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PBUIWallpaperVariantIsValid(variant)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:]();
    }
LABEL_9:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4BAAECLL);
  }
  if (!PBUIWallpaperStylePriorityIsValid(a4))
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PBUIWallpaperStylePriorityIsValid(priority)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:]();
    }
    goto LABEL_9;
  }
  [(PBUIPosterWallpaperViewController *)self->_viewController setWallpaperStyle:a3->var1 forPriority:a4 forVariant:a5];
  [(PBUIPosterWallpaperRemoteViewController *)self _updateFallbackView];

  return 1;
}

- (id)requireWallpaperWithReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = v4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    double v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController requireWallpaperWithReason:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4BADACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController requireWallpaperWithReason:]();
    }
    goto LABEL_11;
  }

  char v6 = [(PBUIPosterWallpaperViewController *)self->_viewController requireWallpaperWithReason:v5];

  return v6;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = v4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController suspendWallpaperAnimationForReason:]();
    }
LABEL_13:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4BB40CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController suspendWallpaperAnimationForReason:]();
    }
    goto LABEL_13;
  }

  animationSuspendedAssertion = self->_animationSuspendedAssertion;
  if (!animationSuspendedAssertion)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__PBUIPosterWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke;
    v12[3] = &unk_1E62B3CD8;
    v12[4] = self;
    uint64_t v7 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"AnimationSuspended" stateDidChangeHandler:v12];
    double v8 = self->_animationSuspendedAssertion;
    self->_animationSuspendedAssertion = v7;

    animationSuspendedAssertion = self->_animationSuspendedAssertion;
  }
  double v9 = [(BSCompoundAssertion *)animationSuspendedAssertion acquireForReason:v5];

  return v9;
}

uint64_t __92__PBUIPosterWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rotateToInterfaceOrientation:*(void *)(a1 + 40)];
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  uint64_t v9 = [WeakRetained wallpaperPresenter:self requestsOrientationWithRefresh:1];

  id v10 = self;
  uint64_t v11 = v10;
  id v12 = (PBUIPosterPortalImageProvider *)v10;
  if ((a5 & 0x10) != 0)
  {
    id v12 = v10->_portalImageProvider;
  }
  if ((a5 & 0x20) != 0)
  {
    BOOL v13 = v11->_activeVariantProvider;

    id v12 = (PBUIPosterPortalImageProvider *)v13;
  }
  double v14 = [[PBUIFakeBlurView alloc] initWithVariant:a3 imageProvider:v12 fakeBlurRegistry:v11 wallpaperViewDelegate:0 transformOptions:a5 reachabilityCoordinator:v11->_reachabilityCoordinator];
  v15 = v14;
  if (v9)
  {
    int v16 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__PBUIPosterWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
    v18[3] = &unk_1E62B31E0;
    long long v19 = v14;
    uint64_t v20 = v9;
    [v16 performWithoutAnimation:v18];
  }
  return v15;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController legibilitySettingsForVariant:a3];
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  id v7 = a3;
  if (PBUIWallpaperVariantIsValid(a4))
  {
    [(PBUIPosterWallpaperRemoteViewController *)self addObserver:v7];
  }
  else
  {
    char v6 = objc_msgSend(NSString, "stringWithFormat:", @"invalid variant %ld", a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController addObserver:forVariant:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)_registerFakeBlurView:(id)a3
{
}

- (PBUIPosterWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  id v4 = [(PBUIPosterWallpaperRemoteViewController *)&v21 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    v4->_activeVariant = -1;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    stateCaptureHandles = v5->_stateCaptureHandles;
    v5->_stateCaptureHandles = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    effectViews = v5->_effectViews;
    v5->_effectViews = (NSHashTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    wallpaperScaleAssertions = v5->_wallpaperScaleAssertions;
    v5->_wallpaperScaleAssertions = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    v5->_observerLock._os_unfair_lock_opaque = 0;
    double v14 = objc_alloc_init(PBUIPosterWallpaperViewController);
    viewController = v5->_viewController;
    v5->_viewController = v14;

    [(PBUIPosterWallpaperViewController *)v5->_viewController setDelegate:v5];
    int v16 = [[PBUIPosterPortalImageProvider alloc] initWithRootObject:v5->_viewController];
    portalImageProvider = v5->_portalImageProvider;
    v5->_portalImageProvider = v16;

    char v18 = [[PBUIPosterActiveVariantImageProvider alloc] initWithRootObject:v5->_viewController];
    activeVariantProvider = v5->_activeVariantProvider;
    v5->_activeVariantProvider = v18;

    [(PBUIPosterWallpaperRemoteViewController *)v5 _addStateCaptureHandlers];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_stateCaptureHandles;
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

  [(BSCompoundAssertion *)self->_animationSuspendedAssertion invalidate];
  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  [(PBUIPosterWallpaperRemoteViewController *)&v8 dealloc];
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  p_wallpaperConfigurationManager = &self->_wallpaperConfigurationManager;
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
  id v6 = a3;
  [(PBUIWallpaperConfigurationManager *)*p_wallpaperConfigurationManager setDelegate:self];
}

- (void)fetchWallpaperProminentColor:(id)a3
{
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController acquireDuckHomeScreenWallpaperDimAssertionWithReason:a3];
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController currentHomeVariantStyleState];
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController updateCurrentPosterWithUpdates:a3 error:a4];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  [(PBUIPosterWallpaperRemoteViewController *)&v8 viewDidLoad];
  id v3 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  uint64_t v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  [(UIView *)self->_containerView setAutoresizingMask:18];
  [v3 addSubview:self->_containerView];
  uint64_t v7 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v3 setBackgroundColor:v7];

  [(PBUIPosterWallpaperRemoteViewController *)self bs_addChildViewController:self->_viewController withSuperview:self->_containerView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(PBUIPosterWallpaperRemoteViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_viewController toVisible:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  [(PBUIPosterWallpaperRemoteViewController *)&v4 viewDidAppear:a3];
  [(PBUIPosterWallpaperRemoteViewController *)self bs_endAppearanceTransitionForChildViewController:self->_viewController toVisible:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(PBUIPosterWallpaperRemoteViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_viewController toVisible:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  [(PBUIPosterWallpaperRemoteViewController *)&v4 viewDidDisappear:a3];
  [(PBUIPosterWallpaperRemoteViewController *)self bs_endAppearanceTransitionForChildViewController:self->_viewController toVisible:0];
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

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 variant];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v8 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
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
        BOOL v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 wallpaperLegibilitySettingsDidChange:v6 forVariant:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 hideDimmingLayerDidChange:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 wallpaperDidUpdatePreferredProminentColor:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4
{
  char v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = PBUIStringForWallpaperLocations(v4);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "Legacy wallpaper changed for %@", (uint8_t *)&v8, 0xCu);
  }
  [(PBUIPosterWallpaperViewController *)self->_viewController updateLegacyPoster];
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v8 = a5;
  if (!PBUIWallpaperVariantIsValid(a4))
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PBUIWallpaperVariantIsValid(variant)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController removeWallpaperStyleForPriority:forVariant:withAnimationFactory:]();
    }
LABEL_9:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC51368CLL);
  }
  if (!PBUIWallpaperStylePriorityIsValid(a3))
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PBUIWallpaperStylePriorityIsValid(priority)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController removeWallpaperStyleForPriority:forVariant:withAnimationFactory:]();
    }
    goto LABEL_9;
  }
  [(PBUIPosterWallpaperViewController *)self->_viewController removeWallpaperStyleForPriority:a3 forVariant:a4];
  [(PBUIPosterWallpaperRemoteViewController *)self _updateFallbackView];

  return 1;
}

- (void)removeObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  id v7 = a3;
  if (PBUIWallpaperVariantIsValid(a4))
  {
    [(PBUIPosterWallpaperRemoteViewController *)self removeObserver:v7];
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"invalid variant %ld", a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController removeObserver:forVariant:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  return ($1D129F7B4C980C50E70029647222EF17 *)PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)retstr, 0.0);
}

- (void)setActiveVariant:(int64_t)a3
{
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = v12;
  if (self->_activeVariant == a3)
  {
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
  else
  {
    v28 = (void (**)(void))v12;
    id v29 = v10;
    long long v14 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [v19 wallpaperWillChangeForVariant:0];
            [v19 wallpaperWillChangeForVariant:1];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v16);
    }
    uint64_t v20 = PBUILogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v21 = PBUIStringForWallpaperVariant(a3);
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_log_impl(&dword_1BC4B3000, v20, OS_LOG_TYPE_DEFAULT, "Setting wallpaper variant to: %{public}@", buf, 0xCu);
    }
    self->_activeVariant = a3;
    [(PBUIPosterWallpaperViewController *)self->_viewController setActiveVariant:a3];
    [(PBUIPosterWallpaperRemoteViewController *)self _updateFallbackView];
    [(PBUIPosterWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            [v27 wallpaperDidChangeForVariant:0];
            [v27 wallpaperDidChangeForVariant:1];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    long long v13 = v28;
    if (v28) {
      v28[2](v28);
    }

    id v10 = v29;
  }
}

- (double)minimumHomescreenWallpaperScale
{
  return 1.0;
}

- (double)homescreenWallpaperScale
{
  [(PBUIPosterWallpaperRemoteViewController *)self _wallpaperScaleForVariant:1];
  return result;
}

- (double)minimumLockscreenWallpaperScale
{
  return 1.0;
}

- (double)lockscreenWallpaperScale
{
  [(PBUIPosterWallpaperRemoteViewController *)self _wallpaperScaleForVariant:0];
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6 = a4;
  id v7 = [(PBUIPosterWallpaperRemoteViewController *)self _wallpaperScaleAssertionForVariant:0 scale:a3];
  [(PBUIPosterWallpaperRemoteViewController *)self _updateWallpaperScaleWithAnimationFactory:v6];

  return v7;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [PBUIPosterFloatingLayerReplica alloc];
  id v8 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PBUIPosterFloatingLayerReplica *)v8 setFloatingLayerStandin:!v4];
  uint64_t v9 = [(PBUIPosterWallpaperViewController *)self->_viewController portalProviderForFloatingLayer];
  [(PBUIPortalReplicaView *)v8 setProvider:v9];

  [(PBUIPortalReplicaView *)v8 setReason:v6];
  return v8;
}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    char v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:]();
    }
LABEL_11:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC513E58);
  }
  if (!v8)
  {
    char v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"containerView != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:]();
    }
    goto LABEL_11;
  }
  id v11 = [PBUIPosterFloatingLayerReplica alloc];
  [v8 bounds];
  id v12 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v11, "initWithFrame:");
  long long v13 = [(PBUIPosterWallpaperViewController *)self->_viewController portalProviderForFloatingLayer];
  [(PBUIPortalReplicaView *)v12 setProvider:v13];

  [(PBUIPortalReplicaView *)v12 setReason:v9];
  [v8 addSubview:v12];
  long long v14 = [PBUIWallpaperFloatingLayerAssertion alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__PBUIPosterWallpaperRemoteViewController_setWallpaperFloatingLayerContainerView_forReason_withAnimationFactory___block_invoke;
  v19[3] = &unk_1E62B4340;
  uint64_t v20 = v12;
  uint64_t v15 = v12;
  uint64_t v16 = -[PBUIWallpaperFloatingLayerAssertion initWithContainerView:forReason:invalidationBlock:](v14, v8, v9, v19);

  return v16;
}

uint64_t __113__PBUIPosterWallpaperRemoteViewController_setWallpaperFloatingLayerContainerView_forReason_withAnimationFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)scenesForBacklightSession
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController scenesForBacklightSession];
}

- (void)updateWallpaperAnimationWithProgress:(double)a3
{
}

- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4
{
}

- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3
{
}

- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = v6;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v8)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setConfiguration:withAnimationSettings:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC514268);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterWallpaperRemoteViewController setConfiguration:withAnimationSettings:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC5142CCLL);
  }

  id v9 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v14 wallpaperWillChangeForVariant:0];
          [v14 wallpaperWillChangeForVariant:1];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v11);
  }
  [(PBUIPosterWallpaperViewController *)self->_viewController updateConfiguration:v8 withAnimationSettings:v7];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = self->_effectViews;
  uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        [v20 updateImageFromProviderForWallpaperMode:0];
        [v20 reconfigureFromProvider];
      }
      uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v29 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          [v26 wallpaperDidChangeForVariant:0];
          [v26 wallpaperDidChangeForVariant:1];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v23);
  }
}

- (void)setAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PBUIPosterWallpaperRemoteViewController *)self _observers];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v13 wallpaperWillChangeForVariant:1];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }
  [(PBUIPosterWallpaperViewController *)self->_viewController updateAssociatedPosterConfiguration:v6 withAnimationSettings:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v14 = self->_effectViews;
  uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        [v19 updateImageFromProviderForWallpaperMode:0];
        [v19 reconfigureFromProvider];
      }
      uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v26 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v25, "wallpaperDidChangeForVariant:", 1, (void)v26);
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v22);
  }
}

- (void)triggerSceneUpdate
{
}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int IsActive = soft_PUIDynamicRotationIsActive();
  id v8 = [(PBUIPosterWallpaperRemoteViewController *)self view];
  uint64_t v9 = v8;
  if (IsActive)
  {
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v23 = *MEMORY[0x1E4F1DAB8];
    long long v17 = v23;
    long long v24 = v18;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v16 = v25;
    [v8 setTransform:&v23];

    uint64_t v10 = [(PBUIPosterWallpaperRemoteViewController *)self view];
    [v10 layoutIfNeeded];

    uint64_t v11 = [(PBUIPosterWallpaperRemoteViewController *)self view];
    long long v23 = v17;
    long long v24 = v18;
    long long v25 = v16;
    [(NSHashTable *)v11 setTransform:&v23];
  }
  else
  {
    [v8 layoutIfNeeded];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = self->_effectViews;
    uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v15++) rotateToInterfaceOrientation:a3];
        }
        while (v13 != v15);
        uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v13);
    }
  }

  [(PBUIPosterWallpaperViewController *)self->_viewController rotateToInterfaceOrientation:a3 duration:a4];
}

- (void)triggerPosterSignificantEvent
{
}

- (void)triggerPosterTapEvent:(id)a3
{
  viewController = self->_viewController;
  id v5 = a3;
  id v6 = [(PBUIPosterWallpaperViewController *)viewController view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = self->_viewController;
  -[PBUIPosterWallpaperViewController noteUserTapOccurredWithLocation:](v11, "noteUserTapOccurredWithLocation:", v8, v10);
}

- (BOOL)userTapEventsRequested
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController userTapEventsRequested];
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController significantEventsCounterForPosterWithIdentifier:a3];
}

- (unint64_t)posterSignificantEventsCounter
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController posterSignificantEventsCounter];
}

- (BOOL)homeScreenPosterMirrorsLock
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController homeScreenReflectsLockScreen];
}

- (BOOL)posterHandlesWakeAnimation
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController posterHandlesWakeAnimation];
}

- (BOOL)posterHidesDimmingLayer
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController posterHidesDimmingLayer];
}

- (void)setExternalDisplayConfiguration:(id)a3
{
  p_externalDisplayConfiguration = &self->_externalDisplayConfiguration;
  id v5 = a3;
  if (!-[PBUIExternalDisplayConfiguration isEqual:](*p_externalDisplayConfiguration, "isEqual:")) {
    objc_storeStrong((id *)p_externalDisplayConfiguration, a3);
  }
}

- (void)setWallpaperObscured:(BOOL)a3
{
}

- (BOOL)isHomeScreenWallpaperDimmed
{
  v2 = [(PBUIPosterWallpaperRemoteViewController *)self currentHomeVariantStyleState];
  char v3 = [v2 isHomeScreenDimmed];

  return v3;
}

- (id)newImageProviderView
{
  return objc_alloc_init(PBUISnapshotReplicaView);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  return 0;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController snapshotSourceProviderForVariant:a4];
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  return 0.0;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  return 0;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  return 1.0;
}

- (void)_unregisterFakeBlurView:(id)a3
{
}

- (id)averageColorForVariant:(int64_t)a3
{
  return [(PBUIPosterWallpaperViewController *)self->_viewController averageColorForVariant:a3];
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return -[PBUIPosterWallpaperViewController averageColorForVariant:](self->_viewController, "averageColorForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  return -[PBUIPosterWallpaperViewController averageColorForVariant:](self->_viewController, "averageColorForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (double)contrastForVariant:(int64_t)a3
{
  [(PBUIPosterWallpaperViewController *)self->_viewController averageContrastForVariant:a3];
  return result;
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  -[PBUIPosterWallpaperViewController averageContrastForVariant:](self->_viewController, "averageContrastForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterWallpaperRemoteViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PBUIPosterWallpaperRemoteViewController *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(PBUIPosterWallpaperRemoteViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIPosterWallpaperRemoteViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PBUIPosterWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E62B2C38;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __81__PBUIPosterWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = PBUIStringForWallpaperVariant(*(void *)(*(void *)(a1 + 40) + 1088));
  [v2 appendString:v3 withName:@"activeVariant"];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 1048) allObjects];
  [v4 appendArraySection:v5 withName:@"scaleAssertions" skipIfEmpty:1];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"viewController"];
}

- (id)_observers
{
  p_observerLocuint64_t k = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  id v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observerLock);
  return v4;
}

uint64_t __85__PBUIPosterWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 976);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

- (void)_addStateCaptureHandlers
{
  id v3 = MEMORY[0x1E4F14428];
  objc_initWeak(&location, self);
  stateCaptureHandles = self->_stateCaptureHandles;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PBUIPosterWallpaperRemoteViewController - %p", self);
  objc_copyWeak(&v7, &location);
  id v6 = BSLogAddStateCaptureBlockWithTitle();
  [(NSMutableSet *)stateCaptureHandles addObject:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

__CFString *__67__PBUIPosterWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionWithMultilinePrefix:0];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1F1606C18;
  }
  id v4 = v2;

  return v4;
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_effectViews, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_animationSuspendedAssertion, 0);
  objc_storeStrong((id *)&self->_activeVariantProvider, 0);
  objc_storeStrong((id *)&self->_portalImageProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandles, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeWallpaperStyleForPriority:forVariant:withAnimationFactory:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeWallpaperStyleForPriority:forVariant:withAnimationFactory:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)suspendWallpaperAnimationForReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:forVariant:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeObserver:forVariant:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setConfiguration:withAnimationSettings:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end