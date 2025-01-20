@interface SBCoverSheetSlidingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPresentingInterstitialForGestureRecognizer:(id)a3;
- (BOOL)_isTransitioning;
- (BOOL)_mathForGestureRecognizerPointsDown:(id)a3 position:(double *)a4 velocity:(double *)a5 instantVelocity:(double *)a6 averageVelocity:(double *)a7;
- (BOOL)_shouldEndPresentedForEndingGestureRecognizer:(id)a3;
- (BOOL)_shouldRubberBandForGestureRecognizer:(id)a3;
- (BOOL)canBePulledDown;
- (BOOL)canBePulledUp;
- (BOOL)canTransitionToPresented:(BOOL)a3;
- (BOOL)indirectPresentGestureCalledBegin;
- (BOOL)isAnyGestureActivelyRecognized;
- (BOOL)isBottomMostSlider;
- (BOOL)isDismissGestureActive;
- (BOOL)isPresentGestureActive;
- (BOOL)mathForGestureRecognizerPointsDown:(id)a3;
- (BOOL)performingCatchUpForPresentation;
- (BOOL)roundsCorners;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotate;
- (BOOL)wantsFullScreenLayout;
- (CGPoint)_adjustedTouchLocationForCurrentDismissalMode:(CGPoint)a3;
- (CGPoint)_averageVelocityForGesture:(id)a3;
- (CGPoint)_finalLocationForTransitionToPresented:(BOOL)a3;
- (CGPoint)_locationForGesture:(id)a3;
- (CGPoint)_velocityForGesture:(id)a3;
- (CGPoint)lastGestureVelocity;
- (CGPoint)lastTouchLocation;
- (CGRect)_updatePositionViewForProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5;
- (CSCoverSheetTransitionSettings)transitionSettings;
- (CSLockScreenSettings)lockScreenSettings;
- (OS_dispatch_group)completionGroup;
- (SBCoverSheetPositionView)positionView;
- (SBCoverSheetSlidingViewController)initWithContentViewController:(id)a3 canBePulledDown:(BOOL)a4 canBePulledUp:(BOOL)a5 dismissalPreemptingGestureRecognizer:(id)a6;
- (SBCoverSheetSlidingViewControllerContentViewController)contentViewController;
- (SBCoverSheetSlidingViewControllerDelegate)delegate;
- (SBCoverSheetSystemGesturesDelegate)systemGesturesDelegate;
- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer;
- (SBHomeGestureSettings)homeGestureSettings;
- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer;
- (SBProximitySensorManager)proximitySensorManager;
- (SBScreenEdgePanGestureRecognizer)dismissAddendumGestureRecognizer;
- (SBScreenEdgePanGestureRecognizer)dismissGestureRecognizer;
- (UIViewFloatAnimatableProperty)catchupProperty;
- (UIViewFloatAnimatableProperty)progressProperty;
- (double)_viewVelocity;
- (double)initialTouchOffsetFromScreenEdge;
- (id)_grabberRecognizer;
- (id)activeGestureRecognizer;
- (id)completionBlock;
- (id)coverSheetIdentifier;
- (int64_t)dismissalSlidingMode;
- (int64_t)dismissalTransformMode;
- (int64_t)groupCount;
- (int64_t)participantState;
- (int64_t)presentGestureState;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addSystemGestureRecognizerIfUntracked:(id)a3 withType:(unint64_t)a4;
- (void)_addSystemGestureRecognizers;
- (void)_animationTickForPresentationValue:(BOOL)a3;
- (void)_beginTransitionFromAppeared:(BOOL)a3;
- (void)_cancelTransitionForGesture:(id)a3;
- (void)_createProperties;
- (void)_dismissCoverSheetAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_dismissGestureBeganWithGestureRecognizer:(id)a3;
- (void)_dismissGestureChangedWithGestureRecognizer:(id)a3;
- (void)_endTransitionToAppeared:(BOOL)a3;
- (void)_finishTransitionToPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)_handleDismissGesture:(id)a3;
- (void)_handleIndirectPresentGesture:(id)a3;
- (void)_handlePresentGesture:(id)a3;
- (void)_logDismissGestureState:(int64_t)a3 forAddendumGesture:(BOOL)a4;
- (void)_logPresentGestureState:(int64_t)a3;
- (void)_presentCoverSheetAnimated:(BOOL)a3 forUserGesture:(BOOL)a4 withCompletion:(id)a5;
- (void)_presentGestureBeganWithGestureRecognizer:(id)a3;
- (void)_presentOrDismissGestureChangedWithGestureRecognizer:(id)a3;
- (void)_presentOrDismissGestureEndedWithGestureRecognizer:(id)a3;
- (void)_removeSystemGestureRecognizers;
- (void)_setCornerRounded:(BOOL)a3;
- (void)_startCatchupAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)_studyLogForCompletionOfTransitionToPresented:(BOOL)a3;
- (void)_studyLogForGestureRecognizerState:(int64_t)a3 bounds:(CGRect)a4 position:(double)a5 velocity:(double)a6;
- (void)_transitionToViewControllerAppearState:(int)a3;
- (void)_transitionToViewControllerAppearState:(int)a3 forUserGesture:(BOOL)a4;
- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5;
- (void)_updateCoverSheetDismissSettings:(id)a3;
- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4;
- (void)_updateHomeGestureSettings:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)loadView;
- (void)setCanBePulledDown:(BOOL)a3;
- (void)setCanBePulledUp:(BOOL)a3;
- (void)setCatchupProperty:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionGroup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAddendumGestureRecognizer:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setDismissGesturesEnabled:(BOOL)a3;
- (void)setDismissalSlidingMode:(int64_t)a3;
- (void)setDismissalTransformMode:(int64_t)a3;
- (void)setGroupCount:(int64_t)a3;
- (void)setHomeGestureSettings:(id)a3;
- (void)setIndirectDismissGestureRecognizer:(id)a3;
- (void)setIndirectPresentGestureCalledBegin:(BOOL)a3;
- (void)setIndirectPresentGestureRecognizer:(id)a3;
- (void)setInitialTouchOffsetFromScreenEdge:(double)a3;
- (void)setLastGestureVelocity:(CGPoint)a3;
- (void)setLastTouchLocation:(CGPoint)a3;
- (void)setLockScreenSettings:(id)a3;
- (void)setPerformingCatchUpForPresentation:(BOOL)a3;
- (void)setPositionView:(id)a3;
- (void)setPresented:(BOOL)a3 forUserGesture:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)setProgressProperty:(id)a3;
- (void)setProximitySensorManager:(id)a3;
- (void)setRoundsCorners:(BOOL)a3;
- (void)setScrunchDismissGestureRecognizer:(id)a3;
- (void)setSystemGesturesDelegate:(id)a3;
- (void)setTransitionSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBCoverSheetSlidingViewController

- (BOOL)isAnyGestureActivelyRecognized
{
  v2 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  char v3 = [v2 isAnyGestureActivelyRecognized];

  return v3;
}

- (SBCoverSheetSystemGesturesDelegate)systemGesturesDelegate
{
  return self->_systemGesturesDelegate;
}

- (SBCoverSheetSlidingViewController)initWithContentViewController:(id)a3 canBePulledDown:(BOOL)a4 canBePulledUp:(BOOL)a5 dismissalPreemptingGestureRecognizer:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v39.receiver = self;
  v39.super_class = (Class)SBCoverSheetSlidingViewController;
  v13 = [(SBCoverSheetSlidingViewController *)&v39 init];
  v14 = v13;
  if (v13)
  {
    [(SBCoverSheetSlidingViewController *)v13 _setIgnoreAppSupportedOrientations:1];
    uint64_t v15 = +[SBHomeGestureDomain rootSettings];
    homeGestureSettings = v14->_homeGestureSettings;
    v14->_homeGestureSettings = (SBHomeGestureSettings *)v15;

    [(PTSettings *)v14->_homeGestureSettings addKeyObserver:v14];
    uint64_t v17 = [MEMORY[0x1E4F5E408] rootSettings];
    lockScreenSettings = v14->_lockScreenSettings;
    v14->_lockScreenSettings = (CSLockScreenSettings *)v17;

    [(CSLockScreenSettings *)v14->_lockScreenSettings addKeyObserver:v14];
    v19 = [(CSLockScreenSettings *)v14->_lockScreenSettings coverSheetDismissGestureSettings];
    [v19 addKeyObserver:v14];

    v14->_dismissalSlidingMode = 1;
    v14->_dismissalTransformMode = 1;
    objc_storeStrong((id *)&v14->_contentViewController, a3);
    v20 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    uint64_t v21 = [v20 homeButtonType];

    uint64_t v22 = _os_feature_enabled_impl();
    v23 = [(CSLockScreenSettings *)v14->_lockScreenSettings coverSheetDismissGestureSettings];
    uint64_t v24 = [v23 usesGrapeFlags] ^ 1 | v22;

    if (v21 == 2) {
      uint64_t v25 = 5;
    }
    else {
      uint64_t v25 = 1;
    }
    v26 = [(SBHomeGesturePanGestureRecognizer *)[SBCoverSheetScreenEdgePanGestureRecognizer alloc] initWithTarget:v14 action:sel__handleDismissGesture_ type:v25 options:v24];
    dismissGestureRecognizer = v14->_dismissGestureRecognizer;
    v14->_dismissGestureRecognizer = &v26->super.super;

    [(UIScreenEdgePanGestureRecognizer *)v14->_dismissGestureRecognizer setEdges:4];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissGestureRecognizer setAllowedTouchTypes:&unk_1F3347C58];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissGestureRecognizer sbf_setPencilTouchesAllowed:v22];
    v28 = [(SBHomeGesturePanGestureRecognizer *)[SBCoverSheetScreenEdgePanGestureRecognizer alloc] initWithTarget:v14 action:sel__handleDismissGesture_ type:1 options:1];
    dismissAddendumGestureRecognizer = v14->_dismissAddendumGestureRecognizer;
    v14->_dismissAddendumGestureRecognizer = &v28->super.super;

    [(UIScreenEdgePanGestureRecognizer *)v14->_dismissAddendumGestureRecognizer setEdges:4];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissAddendumGestureRecognizer setAllowedTouchTypes:&unk_1F3347C70];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissAddendumGestureRecognizer sbf_setPencilTouchesAllowed:v22];
    [(SBCoverSheetSlidingViewController *)v14 _updateHomeGestureSettings:v14->_homeGestureSettings];
    v30 = [(CSLockScreenSettings *)v14->_lockScreenSettings coverSheetDismissGestureSettings];
    [(SBCoverSheetSlidingViewController *)v14 _updateCoverSheetDismissSettings:v30];

    v31 = [[SBCoverSheetSystemGesturesDelegate alloc] initWithViewController:v14 dismissGestureRecognizer:v14->_dismissGestureRecognizer dismissAddendumGestureRecognizer:v14->_dismissAddendumGestureRecognizer dismissalPreemptingGestureRecognizer:v12];
    v32 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:v14 action:sel__handleDismissGesture_ edges:4];
    indirectDismissGestureRecognizer = v14->_indirectDismissGestureRecognizer;
    v14->_indirectDismissGestureRecognizer = v32;

    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setName:@"indirectDismissCoverSheetGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setShouldInvertYAxis:1];
    [(SBCoverSheetSystemGesturesDelegate *)v31 setIndirectDismissGestureRecognizer:v14->_indirectDismissGestureRecognizer];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setDelegate:v31];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setActivationRecognitionDistance:80.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setHysteresis:0 forInputType:30.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setHysteresis:1 forInputType:10.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectDismissGestureRecognizer setTranslationAdjustmentBlock:&__block_literal_global_109];
    v34 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:v14 action:sel__handleIndirectPresentGesture_ edges:1];
    indirectPresentGestureRecognizer = v14->_indirectPresentGestureRecognizer;
    v14->_indirectPresentGestureRecognizer = v34;

    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setName:@"indirectPresentCoverSheetGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setShouldInvertYAxis:1];
    [(SBCoverSheetSystemGesturesDelegate *)v31 setIndirectPresentGestureRecognizer:v14->_indirectPresentGestureRecognizer];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setDelegate:v31];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setOrientationProvider:v31];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setActivationRecognitionDistance:80.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setShouldRequireGestureToStartAtEdge:1];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setHysteresis:0 forInputType:30.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setHysteresis:1 forInputType:10.0];
    [(SBIndirectPanGestureRecognizer *)v14->_indirectPresentGestureRecognizer setTranslationAdjustmentBlock:&__block_literal_global_18];
    v36 = [[SBFluidScrunchGestureRecognizer alloc] initWithTarget:v14 action:sel__handleDismissGesture_];
    scrunchDismissGestureRecognizer = v14->_scrunchDismissGestureRecognizer;
    v14->_scrunchDismissGestureRecognizer = v36;

    [(SBFluidScrunchGestureRecognizer *)v14->_scrunchDismissGestureRecognizer setAllowedTouchTypes:&unk_1F3347C88];
    [(SBCoverSheetSystemGesturesDelegate *)v31 setScrunchDismissGestureRecognizer:v14->_scrunchDismissGestureRecognizer];
    [(SBFluidScrunchGestureRecognizer *)v14->_scrunchDismissGestureRecognizer setDelegate:v31];
    [(SBCoverSheetSystemGesturesDelegate *)v31 setPositionProvider:v14];
    [(SBCoverSheetSlidingViewController *)v14 setSystemGesturesDelegate:v31];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissGestureRecognizer setDelegate:v31];
    [(SBScreenEdgePanGestureRecognizer *)v14->_dismissAddendumGestureRecognizer setDelegate:v31];
    [(SBCoverSheetSlidingViewController *)v14 _createProperties];
    v14->_canBePulledDown = a4;
    v14->_canBePulledUp = a5;
    [(SBCoverSheetSlidingViewController *)v14 _addSystemGestureRecognizers];
  }
  return v14;
}

double __134__SBCoverSheetSlidingViewController_initWithContentViewController_canBePulledDown_canBePulledUp_dismissalPreemptingGestureRecognizer___block_invoke_2(double a1)
{
  v2 = +[SBPlatformController sharedInstance];
  int v3 = [v2 isRoundCornerPad];

  if (v3) {
    SBScreenDisplayCornerRadius();
  }
  return a1;
}

- (void)dealloc
{
  [(SBCoverSheetSlidingViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetSlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v3 dealloc];
}

- (void)invalidate
{
  [(SBCoverSheetSlidingViewController *)self _removeSystemGestureRecognizers];
  suppressTouchCancellation = self->_suppressTouchCancellation;
  [(BSInvalidatable *)suppressTouchCancellation invalidate];
}

- (void)setPresented:(BOOL)a3 forUserGesture:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  if (a3) {
    [(SBCoverSheetSlidingViewController *)self _presentCoverSheetAnimated:a5 forUserGesture:a4 withCompletion:a6];
  }
  else {
    [(SBCoverSheetSlidingViewController *)self _dismissCoverSheetAnimated:a5 withCompletion:a6];
  }
}

- (BOOL)canTransitionToPresented:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  v5 = v4;
  if (v3) {
    char v6 = [v4 isPresentGestureAllowedToBegin];
  }
  else {
    char v6 = [v4 isDismissGestureAllowedToBegin];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isPresentGestureActive
{
  v2 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  char v3 = [v2 isPresentGestureActive];

  return v3;
}

- (BOOL)isDismissGestureActive
{
  v2 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  char v3 = [v2 isDismissGestureActive];

  return v3;
}

- (BOOL)_isTransitioning
{
  v2 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  int v3 = [v2 syntheticAppearState];

  return (v3 & 0xFFFFFFFD) == 1;
}

- (void)setDismissalSlidingMode:(int64_t)a3
{
  if (self->_dismissalSlidingMode != a3)
  {
    if (a3 != 1 && (SBHomeGestureEnabled() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBCoverSheetSlidingViewController.m" lineNumber:288 description:@"We should never enter rubber banding mode on this device."];
    }
    self->_dismissalSlidingMode = a3;
    if ([(SBCoverSheetSlidingViewController *)self isDismissGestureActive])
    {
      p_dismissAddendumGestureRecognizer = (id *)&self->_dismissAddendumGestureRecognizer;
      if ((unint64_t)([(SBScreenEdgePanGestureRecognizer *)self->_dismissAddendumGestureRecognizer state]- 1) >= 2&& (p_dismissAddendumGestureRecognizer = (id *)&self->_dismissGestureRecognizer, (unint64_t)([(SBScreenEdgePanGestureRecognizer *)self->_dismissGestureRecognizer state] - 1) >= 2)&& (p_dismissAddendumGestureRecognizer = (id *)&self->_indirectDismissGestureRecognizer, (unint64_t)([(SBIndirectPanGestureRecognizer *)self->_indirectDismissGestureRecognizer state]- 1) >= 2)&& (p_dismissAddendumGestureRecognizer = (id *)&self->_scrunchDismissGestureRecognizer, (unint64_t)([(SBFluidScrunchGestureRecognizer *)self->_scrunchDismissGestureRecognizer state]- 1) > 1))
      {
        id v7 = 0;
      }
      else
      {
        id v7 = *p_dismissAddendumGestureRecognizer;
        if (v7)
        {
          [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:3 ifNeeded:1 forUserGesture:1];
          if (self->_dismissalSlidingMode == 1)
          {
            self->_performingCatchUpForPresentation = 0;
            v9[0] = MEMORY[0x1E4F143A8];
            v9[1] = 3221225472;
            v9[2] = __61__SBCoverSheetSlidingViewController_setDismissalSlidingMode___block_invoke_2;
            v9[3] = &unk_1E6AF4AC0;
            v9[4] = self;
            [(SBCoverSheetSlidingViewController *)self _startCatchupAnimationWithDuration:v9 completion:0.57];
          }
        }
      }
    }
  }
}

void __61__SBCoverSheetSlidingViewController_setDismissalSlidingMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1016));
  [WeakRetained coverSheetSlidingViewControllerCleanupInterstitialTransition:*(void *)(a1 + 32)];
}

- (void)setDismissGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBCoverSheetSlidingViewController *)self dismissGestureRecognizer];
  [v5 setEnabled:v3];

  id v6 = [(SBCoverSheetSlidingViewController *)self dismissAddendumGestureRecognizer];
  [v6 setEnabled:v3];
}

- (BOOL)mathForGestureRecognizerPointsDown:(id)a3
{
  return [(SBCoverSheetSlidingViewController *)self _mathForGestureRecognizerPointsDown:a3 position:0 velocity:0 instantVelocity:0 averageVelocity:0];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  id v14 = (id)objc_msgSend(v3, "initWithFrame:");

  [v14 setAutoresizingMask:18];
  [v14 setOpaque:0];
  v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v14 setBackgroundColor:v5];

  id v6 = [SBCoverSheetPositionView alloc];
  [v14 bounds];
  id v7 = -[SBCoverSheetPositionView initWithFrame:](v6, "initWithFrame:");
  positionView = self->_positionView;
  self->_positionView = v7;

  [(SBCoverSheetPositionView *)self->_positionView setAutoresizingMask:18];
  [v14 addSubview:self->_positionView];
  v9 = self->_positionView;
  [v14 bounds];
  -[SBCoverSheetPositionView setFrame:](v9, "setFrame:");
  [(SBCoverSheetSlidingViewController *)self setView:v14];
  v10 = [(SBCoverSheetSlidingViewControllerContentViewController *)self->_contentViewController view];
  [v14 bounds];
  objc_msgSend(v10, "setFrame:");

  contentViewController = self->_contentViewController;
  id v12 = [(SBCoverSheetPositionView *)self->_positionView contentView];
  [(SBCoverSheetSlidingViewController *)self bs_addChildViewController:contentViewController withSuperview:v12];

  v13 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  [v13 setSyntheticAppearState:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v4 viewDidLoad];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  if (viewDidLoad_onceToken != -1) {
    dispatch_once(&viewDidLoad_onceToken, block);
  }
}

uint64_t __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke_2;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v2];
}

uint64_t __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, 0.5, -0.5);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCoverSheetSlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(SBCoverSheetSlidingViewControllerContentViewController *)self->_contentViewController view];
  v5 = [(SBCoverSheetPositionView *)self->_positionView contentView];
  id v6 = [v4 superview];

  if (v6 != v5)
  {
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");
    [v5 addSubview:v4];
  }
  [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBCoverSheetSlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  int v5 = [v4 syntheticAppearState];

  if (!v5) {
    [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:2];
  }
}

- (void)viewDidLayoutSubviews
{
  id v13 = [(SBCoverSheetSlidingViewController *)self positionView];
  id v3 = [(SBCoverSheetSlidingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  id v12 = [(CSLockScreenSettings *)self->_lockScreenSettings coverSheetDismissGestureSettings];
  [(SBCoverSheetSlidingViewController *)self _updateCoverSheetDismissSettings:v12];
}

- (BOOL)shouldAutorotate
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet")) {
    return 1;
  }
  contentViewController = self->_contentViewController;
  return [(SBCoverSheetSlidingViewControllerContentViewController *)contentViewController shouldAutorotate];
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    return [(SBCoverSheetSlidingViewControllerContentViewController *)contentViewController supportedInterfaceOrientations];
  }
  else
  {
    if (__sb__runningInSpringBoard())
    {
      BOOL v4 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      double v5 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v4 = [v5 userInterfaceIdiom] == 1;
    }
    if (v4) {
      return 30;
    }
    else {
      return 2;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isBottomMostSlider
{
  v2 = self;
  id v3 = [(SBCoverSheetSlidingViewController *)self delegate];
  LOBYTE(v2) = [v3 hasContentUnderCoverSheetSlidingViewController:v2] ^ 1;

  return (char)v2;
}

- (id)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_presentCoverSheetAnimated:(BOOL)a3 forUserGesture:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = SBLogCoverSheet();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = @"not ";
    if (v6) {
      double v11 = &stru_1F3084718;
    }
    else {
      double v11 = @"not ";
    }
    if (v5) {
      double v10 = &stru_1F3084718;
    }
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Starting %{public}@animated presentation %{public}@for user gesture", (uint8_t *)&v12, 0x16u);
  }

  [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:1 forUserGesture:v5];
  [(SBCoverSheetSlidingViewController *)self _finishTransitionToPresented:1 animated:v6 withCompletion:v8];
}

- (void)_dismissCoverSheetAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = SBLogCoverSheet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"not ";
    if (v4) {
      id v8 = &stru_1F3084718;
    }
    int v11 = 138543362;
    int v12 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@animated dismissal", (uint8_t *)&v11, 0xCu);
  }

  [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:3];
  double v9 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  int v10 = [v9 syntheticAppearState];

  [(SBCoverSheetSlidingViewController *)self _finishTransitionToPresented:(v10 - 1) < 2 animated:v4 withCompletion:v6];
}

- (void)_handlePresentGesture:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 state];
  uint64_t v7 = [(SBScreenEdgePanGestureRecognizer *)self->_dismissGestureRecognizer state];
  uint64_t v8 = [(SBScreenEdgePanGestureRecognizer *)self->_dismissAddendumGestureRecognizer state];
  if ((unint64_t)(v7 - 1) <= 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBCoverSheetSlidingViewController.m", 487, @"Starting Present Gesture when dismiss gesture is %ldd", v7);
  }
  if ((unint64_t)(v8 - 1) <= 1)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBCoverSheetSlidingViewController.m", 488, @"Starting Present Gesture when dismiss addendum gesture is %ldd", v8);
  }
  [(SBCoverSheetSlidingViewController *)self _logPresentGestureState:v6];
  switch(v6)
  {
    case 1:
      uint64_t v9 = SBFEffectiveArtworkSubtype();
      if (v9 > 2795)
      {
        if (v9 != 2868 && v9 != 2796) {
          goto LABEL_17;
        }
LABEL_16:
        int v10 = [(SBProximitySensorManager *)self->_proximitySensorManager suppressBacklightChangesForReason:@"CSPresentation"];
        suppressTouchCancellation = self->_suppressTouchCancellation;
        self->_suppressTouchCancellation = v10;

        goto LABEL_17;
      }
      if (v9 == 2556 || v9 == 2622) {
        goto LABEL_16;
      }
LABEL_17:
      [(SBCoverSheetSlidingViewController *)self _presentGestureBeganWithGestureRecognizer:v5];
      int v12 = (void *)MEMORY[0x1E4F42FF0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__SBCoverSheetSlidingViewController__handlePresentGesture___block_invoke;
      v15[3] = &unk_1E6AF5290;
      v15[4] = self;
      id v16 = v5;
      [v12 _performWithoutRetargetingAnimations:v15];

LABEL_18:
      return;
    case 2:
      [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureChangedWithGestureRecognizer:v5];
      goto LABEL_18;
    case 3:
      [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureEndedWithGestureRecognizer:v5];
      goto LABEL_13;
    case 4:
    case 5:
      [(SBCoverSheetSlidingViewController *)self _cancelTransitionForGesture:v5];
      goto LABEL_13;
    default:
LABEL_13:
      [(BSInvalidatable *)self->_suppressTouchCancellation invalidate];
      goto LABEL_18;
  }
}

uint64_t __59__SBCoverSheetSlidingViewController__handlePresentGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentOrDismissGestureChangedWithGestureRecognizer:*(void *)(a1 + 40)];
}

- (void)_handleIndirectPresentGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 4) < 2)
  {
    self->_indirectPresentGestureCalledBegin = 0;
    [(SBCoverSheetSlidingViewController *)self _cancelTransitionForGesture:v4];
  }
  else if (v5 == 3)
  {
    self->_indirectPresentGestureCalledBegin = 0;
    [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureEndedWithGestureRecognizer:v4];
  }
  else if (v5 == 2)
  {
    if (self->_indirectPresentGestureCalledBegin)
    {
      [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureChangedWithGestureRecognizer:v4];
    }
    else
    {
      uint64_t v6 = [(SBCoverSheetSlidingViewController *)self view];
      [v4 translationInView:v6];
      double v8 = v7;

      if (v8 != 0.0)
      {
        self->_indirectPresentGestureCalledBegin = 1;
        [(SBCoverSheetSlidingViewController *)self _presentGestureBeganWithGestureRecognizer:v4];
        uint64_t v9 = (void *)MEMORY[0x1E4F42FF0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __67__SBCoverSheetSlidingViewController__handleIndirectPresentGesture___block_invoke;
        v10[3] = &unk_1E6AF5290;
        v10[4] = self;
        id v11 = v4;
        [v9 _performWithoutRetargetingAnimations:v10];
      }
    }
  }
}

uint64_t __67__SBCoverSheetSlidingViewController__handleIndirectPresentGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentOrDismissGestureChangedWithGestureRecognizer:*(void *)(a1 + 40)];
}

- (void)_handleDismissGesture:(id)a3
{
  id v11 = (SBScreenEdgePanGestureRecognizer *)a3;
  uint64_t v5 = [(SBCoverSheetSlidingViewController *)self _grabberRecognizer];
  uint64_t v6 = [v5 state];

  uint64_t v7 = [(SBScreenEdgePanGestureRecognizer *)v11 state];
  if ((unint64_t)(v6 - 1) <= 1)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBCoverSheetSlidingViewController.m", 567, @"Starting Dismiss Gesture when present gesture is %ldd", v6);
  }
  [(SBCoverSheetSlidingViewController *)self _logDismissGestureState:v7 forAddendumGesture:self->_dismissAddendumGestureRecognizer == v11];
  switch(v7)
  {
    case 1:
      [(SBCoverSheetSlidingViewController *)self _dismissGestureBeganWithGestureRecognizer:v11];
      double v8 = self;
      uint64_t v9 = v11;
      goto LABEL_7;
    case 2:
      double v8 = self;
      uint64_t v9 = v11;
LABEL_7:
      [(SBCoverSheetSlidingViewController *)v8 _dismissGestureChangedWithGestureRecognizer:v9];
      break;
    case 3:
      [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureEndedWithGestureRecognizer:v11];
      break;
    case 4:
    case 5:
      [(SBCoverSheetSlidingViewController *)self _cancelTransitionForGesture:v11];
      break;
    default:
      break;
  }
}

- (void)_presentGestureBeganWithGestureRecognizer:(id)a3
{
  __int16 v14 = (SBIndirectPanGestureRecognizer *)a3;
  id v4 = [(SBCoverSheetSlidingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 coverSheetSlidingViewControllerUserPresentGestureBegan:self];
  }
  if (self->_indirectPresentGestureRecognizer == v14)
  {
    [(SBCoverSheetSlidingViewController *)self _locationForGesture:v14];
    self->_initialTouchOffsetFromScreenEdge = fmax(v5, 0.0);
  }
  uint64_t v6 = +[SBReachabilityManager sharedInstance];
  int v7 = [v6 reachabilityModeActive];

  if (v7)
  {
    self->_performingCatchUpForPresentation = 1;
    [(SBCoverSheetSlidingViewController *)self _startCatchupAnimationWithDuration:0 completion:0.35];
  }
  if (!self->_frameRateAssertion)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FA5F18]);
    CAFrameRateRange v16 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    uint64_t v9 = (SBFFrameRateAssertion *)objc_msgSend(v8, "initWithFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v16.minimum, *(double *)&v16.maximum, *(double *)&v16.preferred);
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = v9;
  }
  [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:1 ifNeeded:0 forUserGesture:1];
  id v11 = +[SBReachabilityManager sharedInstance];
  int v12 = [v11 reachabilityModeActive];

  if (v12)
  {
    uint64_t v13 = +[SBReachabilityManager sharedInstance];
    [v13 deactivateReachability];
  }
}

- (void)_dismissGestureBeganWithGestureRecognizer:(id)a3
{
  id v4 = (SBIndirectPanGestureRecognizer *)a3;
  if (self->_indirectDismissGestureRecognizer == v4)
  {
    double v5 = [(SBCoverSheetSlidingViewController *)self view];
    [v5 bounds];
    double Height = CGRectGetHeight(v18);
    [(SBCoverSheetSlidingViewController *)self _locationForGesture:v4];
    double v8 = Height - v7;

    self->_initialTouchOffsetFromScreenEdge = fmax(v8, 0.0);
  }
  if (!self->_frameRateAssertion)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FA5F18]);
    CAFrameRateRange v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    int v10 = (SBFFrameRateAssertion *)objc_msgSend(v9, "initWithFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = v10;
  }
  [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:3 ifNeeded:0 forUserGesture:1];
  if (![(SBCoverSheetSlidingViewController *)self _isPresentingInterstitialForGestureRecognizer:v4])
  {
    [(SBCoverSheetSlidingViewController *)self _velocityForGesture:v4];
    double v13 = v12;
    __int16 v14 = SBLogCoverSheet();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetSlidingViewController _dismissGestureBeganWithGestureRecognizer:](v14, v13);
    }

    uint64_t v15 = [(SBCoverSheetSlidingViewController *)self positionView];
    CAFrameRateRange v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v13);
    [v15 _setVelocity:v16 forKey:@"position"];

    self->_performingCatchUpForPresentation = 0;
    [(SBCoverSheetSlidingViewController *)self _startCatchupAnimationWithDuration:0 completion:0.2];
  }
}

- (void)_presentOrDismissGestureChangedWithGestureRecognizer:(id)a3
{
  id v4 = (SBIndirectPanGestureRecognizer *)a3;
  [(SBCoverSheetSlidingViewController *)self _locationForGesture:v4];
  double v6 = v5;
  double v8 = v7;
  -[SBCoverSheetSlidingViewController setLastTouchLocation:](self, "setLastTouchLocation:");
  if ([(SBCoverSheetSlidingViewController *)self _isPresentingInterstitialForGestureRecognizer:v4])
  {
    id v9 = SBLogCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureChangedWithGestureRecognizer:](v9);
    }
  }
  else
  {
    id v9 = [(SBCoverSheetSlidingViewController *)self view];
    [(SBIndirectPanGestureRecognizer *)v4 translationInView:v9];
    double v11 = v10;
    double v13 = v12;
    [(SBIndirectPanGestureRecognizer *)v4 velocityInView:v9];
    double v15 = v14;
    double v17 = v16;
    -[SBCoverSheetSlidingViewController setLastGestureVelocity:](self, "setLastGestureVelocity:");
    CGRect v18 = +[SBAssistantController sharedInstance];
    objc_msgSend(v18, "dismissAssistantViewInEverySceneIfNecessaryForGestureTranslation:velocity:", v11, v13, v15, v17);

    if ([(SBCoverSheetSlidingViewController *)self _shouldRubberBandForGestureRecognizer:v4])
    {
      [(CSLockScreenSettings *)self->_lockScreenSettings unlockPasscodeThreshold];
      double v20 = v19;
      if (self->_indirectDismissGestureRecognizer == v4
        && [(SBIndirectPanGestureRecognizer *)v4 currentInputType] == 1)
      {
        [(SBIndirectPanGestureRecognizer *)self->_indirectDismissGestureRecognizer activationRecognitionDistance];
        double v22 = v21;
        [(SBIndirectPanGestureRecognizer *)self->_indirectDismissGestureRecognizer hysteresisForInputType:1];
        double v20 = v22 - v23;
      }
      uint64_t v24 = [(SBCoverSheetSlidingViewController *)self view];
      [v24 bounds];
      double v26 = v25 - v8;

      BOOL v27 = v26 >= v20;
      if (v26 < v20)
      {
        -[SBCoverSheetSlidingViewController _adjustedTouchLocationForCurrentDismissalMode:](self, "_adjustedTouchLocationForCurrentDismissalMode:", v6, v8);
      }
      else
      {
        v28 = [(SBCoverSheetSlidingViewController *)self delegate];
        [v28 coverSheetSlidingViewControllerDidPassRubberBandThreshold:self];

        [(SBCoverSheetSlidingViewController *)self _finalLocationForTransitionToPresented:1];
      }
      double v6 = v29;
      double v8 = v30;
    }
    else
    {
      BOOL v27 = 0;
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __90__SBCoverSheetSlidingViewController__presentOrDismissGestureChangedWithGestureRecognizer___block_invoke;
    v33[3] = &unk_1E6AF4AE8;
    v33[4] = self;
    *(double *)&v33[5] = v6;
    *(double *)&v33[6] = v8;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v33];
    if (v27)
    {
      v31 = SBLogCoverSheet();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, "Cancelling dismiss gesture for rubber band threshold passed.", v32, 2u);
      }

      [(SBIndirectPanGestureRecognizer *)v4 setEnabled:0];
      [(SBIndirectPanGestureRecognizer *)v4 setEnabled:1];
      if (self->_indirectDismissGestureRecognizer == v4) {
        [(SBIndirectPanGestureRecognizer *)v4 setPausedUntilTouchedUpOrMovedAwayFromEdge:1];
      }
    }
  }
}

uint64_t __90__SBCoverSheetSlidingViewController__presentOrDismissGestureChangedWithGestureRecognizer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_dismissGestureChangedWithGestureRecognizer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBCoverSheetSlidingViewController *)self _locationForGesture:v4];
  double v6 = v5;
  double v7 = [(SBCoverSheetSlidingViewController *)self view];
  [v7 bounds];
  double Height = CGRectGetHeight(v15);

  double v9 = (Height - v6) / Height;
  double v10 = SBLogCoverSheet();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "_dismissGestureChangedWithGestureRecognizer gestureProgress: %.2f", (uint8_t *)&v12, 0xCu);
  }

  if ([(SBCoverSheetSlidingViewController *)self _isPresentingInterstitialForGestureRecognizer:v4])
  {
    double v11 = [(SBCoverSheetSlidingViewController *)self delegate];
    [v11 coverSheetSlidingViewController:self dismissGestureChangedWithProgress:v9];
  }
  [(SBCoverSheetSlidingViewController *)self _presentOrDismissGestureChangedWithGestureRecognizer:v4];
}

- (void)_presentOrDismissGestureEndedWithGestureRecognizer:(id)a3
{
  id v4 = (SBIndirectPanGestureRecognizer *)a3;
  if (self->_indirectPresentGestureRecognizer == v4 || self->_indirectDismissGestureRecognizer == v4) {
    self->_initialTouchOffsetFromScreenEdge = 0.0;
  }
  double v19 = v4;
  [(SBFFrameRateAssertion *)self->_frameRateAssertion invalidate];
  frameRateAssertion = self->_frameRateAssertion;
  self->_frameRateAssertion = 0;

  BOOL v6 = [(SBCoverSheetSlidingViewController *)self _shouldEndPresentedForEndingGestureRecognizer:v19];
  uint64_t v7 = objc_opt_class();
  SBSafeCast(v7, v19);
  double v8 = (SBIndirectPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ([(SBCoverSheetSlidingViewController *)self _shouldRubberBandForGestureRecognizer:v19])
    {
      goto LABEL_16;
    }
    if ([(SBIndirectPanGestureRecognizer *)v8 endReason] == 3)
    {
      if (self->_indirectPresentGestureRecognizer != v19 && (self->_indirectDismissGestureRecognizer == v19 || !v6))
      {
LABEL_26:
        BOOL v6 = 0;
        goto LABEL_27;
      }
LABEL_16:
      BOOL v6 = 1;
      uint64_t v14 = 1;
      goto LABEL_28;
    }
    [(SBCoverSheetSlidingViewController *)self _locationForGesture:v8];
    double v11 = v10;
    [(SBCoverSheetSlidingViewController *)self _averageVelocityForGesture:v8];
    double v13 = v11 + v12 * 0.06;
    if (v8 == self->_indirectPresentGestureRecognizer)
    {
      char v15 = v13 > 80.0 || v6;
      if ((v15 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
    if (v8 == self->_indirectDismissGestureRecognizer)
    {
      double v16 = [(SBCoverSheetSlidingViewController *)self view];
      [v16 bounds];
      CGFloat v17 = CGRectGetHeight(v21) + -80.0;

      if (v13 <= v17 || !v6) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
  }
  if (v6) {
    goto LABEL_16;
  }
LABEL_27:
  uint64_t v14 = 3;
LABEL_28:
  [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:v14 ifNeeded:1 forUserGesture:1];
  if ([(SBCoverSheetSlidingViewController *)self _isPresentingInterstitialForGestureRecognizer:v19])
  {
    [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:2 ifNeeded:0 forUserGesture:0];
  }
  else
  {
    [(SBCoverSheetSlidingViewController *)self _finishTransitionToPresented:v6 animated:1 withCompletion:0];
  }
}

- (void)_finishTransitionToPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (SBFIsIRDCResetAvailable()) {
    CARenderServerFlushIRDC();
  }
  if (self->_dismissalSlidingMode != 1 && !v6)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"SBCoverSheetSlidingViewController.m" lineNumber:780 description:@"cannot finish transition to dismissed when not tracking"];
  }
  double v10 = [(SBCoverSheetSlidingViewController *)self delegate];
  if (v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v10 coverSheetSlidingViewControllerShouldAllowDismissal:self] & 1) != 0)
  {
    if (objc_opt_respondsToSelector()) {
      [v10 coverSheetSlidingViewController:self committingToEndPresented:v6];
    }
    [(SBCoverSheetSlidingViewController *)self _commitTransitionToAppeared:v6 animated:v5];
    uint32_t v11 = arc4random_uniform(0x2710u);
    double v12 = SBLogCoverSheet();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = @"Not ";
      if (v5) {
        double v13 = &stru_1F3084718;
      }
      *(_DWORD *)buf = 138412802;
      double v46 = *(double *)&v13;
      if (v6) {
        uint64_t v14 = @"presented";
      }
      else {
        uint64_t v14 = @"dismissed";
      }
      __int16 v47 = 1024;
      *(_DWORD *)v48 = v11;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v14;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Start %@Animation %d to %@", buf, 0x1Cu);
    }

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke;
    v40[3] = &unk_1E6AFE678;
    BOOL v43 = v6;
    v40[4] = self;
    uint32_t v42 = v11;
    id v41 = v9;
    BOOL v44 = v5;
    char v15 = (void *)MEMORY[0x1D948C7A0](v40);
    [(SBCoverSheetSlidingViewController *)self _finalLocationForTransitionToPresented:v6];
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    if (v5)
    {
      [(SBCoverSheetSlidingViewController *)self _viewVelocity];
      double v21 = v20;
      double v22 = SBLogCoverSheet();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        [(UIViewFloatAnimatableProperty *)self->_progressProperty velocity];
        *(_DWORD *)buf = 134218240;
        double v46 = v21;
        __int16 v47 = 2048;
        *(void *)v48 = v23;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Assigning gesture velocity: %.2f to property with existing velocity: %.2f", buf, 0x16u);
      }

      [(UIViewFloatAnimatableProperty *)self->_progressProperty setVelocity:v21];
      uint64_t v24 = [(CSLockScreenSettings *)self->_lockScreenSettings coverSheetTransitionsSettings];
      [v24 tension];
      double v26 = v25;
      [v24 friction];
      double v28 = v27;
      double v29 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
      uint64_t v30 = [v29 transitionStyle];

      if (v30 == 1)
      {
        [v24 inPlaceTension];
        double v26 = v31;
        [v24 inPlaceFriction];
        double v28 = v32;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_102;
      v39[3] = &unk_1E6AF4AE8;
      v39[4] = self;
      v39[5] = v18;
      v39[6] = v19;
      [MEMORY[0x1E4F42FF0] _animateUsingSpringWithTension:0 friction:v39 interactive:v15 animations:v26 completion:v28];
    }
    else
    {
      v33 = (void *)MEMORY[0x1E4F42FF0];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_3;
      v35[3] = &unk_1E6AF7100;
      v35[4] = self;
      uint64_t v37 = v16;
      uint64_t v38 = v17;
      id v36 = v15;
      [v33 _performWithoutRetargetingAnimations:v35];
    }
  }
  else
  {
    [(SBCoverSheetSlidingViewController *)self _presentCoverSheetAnimated:1 forUserGesture:0 withCompletion:0];
  }
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v5 = *(unsigned __int8 *)(a1 + 52);
  BOOL v6 = [*(id *)(a1 + 32) activeGestureRecognizer];
  uint64_t v7 = v6;
  if (v6 && ([v6 _hasUnmetFailureRequirements] & 1) == 0)
  {
    uint64_t v20 = [v7 state];
    BOOL v8 = v20 != 3;
    if ((a3 & 1) == 0 && v20 != 3)
    {
      double v21 = SBLogCoverSheet();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int location = 138412546;
        *(void *)location_4 = v7;
        *(_WORD *)&location_4[8] = 1024;
        *(_DWORD *)&location_4[10] = [v7 _hasUnmetFailureRequirements];
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "transition was not retargeted but there is an active gesture:\n\t%@\n\t_hasUnmetFailureRequirements: %{BOOL}d", (uint8_t *)&location, 0x12u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  if ((a3 & 1) != 0 || v8)
  {
    uint64_t v16 = SBLogCoverSheet();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = @"not ";
      int v18 = *(_DWORD *)(a1 + 48);
      if (a3) {
        uint64_t v17 = &stru_1F3084718;
      }
      int location = 67109378;
      *(_DWORD *)location_4 = v18;
      *(_WORD *)&location_4[4] = 2112;
      *(void *)&location_4[6] = v17;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Animation %d %@retargeted -> not doing anything", (uint8_t *)&location, 0x12u);
    }

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(void))(v19 + 16))();
    }
  }
  else
  {
    objc_initWeak((id *)&location, *(id *)(a1 + 32));
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_94;
    double v25 = &unk_1E6AFE650;
    objc_copyWeak(&v27, (id *)&location);
    int v9 = *(_DWORD *)(a1 + 48);
    char v30 = *(unsigned char *)(a1 + 52);
    int v28 = v9;
    int v29 = 2 * v5;
    id v26 = *(id *)(a1 + 40);
    double v10 = (void (**)(void))dispatch_block_create((dispatch_block_flags_t)0, &v22);
    uint32_t v11 = SBLogCoverSheet();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_cold_1();
    }

    double v12 = objc_msgSend(*(id *)(a1 + 32), "completionGroup", v22, v23, v24, v25);
    double v13 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 53) && v12)
    {
      [v13 setCompletionBlock:v10];
      id v14 = MEMORY[0x1E4F14428];
      char v15 = [*(id *)(a1 + 32) completionBlock];
      dispatch_group_notify(v12, MEMORY[0x1E4F14428], v15);
    }
    else
    {
      [v13 setCompletionBlock:0];
      v10[2](v10);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)&location);
  }
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_94(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_94_cold_1(WeakRetained);
  }

  [WeakRetained setCompletionBlock:0];
  id v4 = SBLogCoverSheet();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    BOOL v6 = @"presenting";
    if (!*(unsigned char *)(a1 + 56)) {
      BOOL v6 = @"dismissing";
    }
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2112;
    double v10 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Ended Animation %d not retargeted -> putting us in a good state for %@", (uint8_t *)v8, 0x12u);
  }

  [WeakRetained _transitionToViewControllerAppearState:*(unsigned int *)(a1 + 52) ifNeeded:0 forUserGesture:0];
  [WeakRetained setCompletionGroup:0];
  objc_msgSend(WeakRetained, "setLastTouchLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  [WeakRetained _studyLogForCompletionOfTransitionToPresented:*(unsigned __int8 *)(a1 + 56)];
}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_102(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_2;
  v4[3] = &unk_1E6AF4AE8;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (double)_viewVelocity
{
  id v3 = [(SBCoverSheetSlidingViewController *)self activeGestureRecognizer];
  if (v3) {
    double v4 = -self->_lastGestureVelocity.y;
  }
  else {
    double v4 = 0.0;
  }
  long long v5 = [(SBCoverSheetSlidingViewController *)self positionView];
  CAFrameRateRange v6 = [v5 contentView];
  [v6 frame];
  double Height = CGRectGetHeight(v9);

  return fmin(fmax(v4 / Height, -10.0), 10.0);
}

- (id)activeGestureRecognizer
{
  id v3 = [(SBCoverSheetSlidingViewController *)self dismissGestureRecognizer];
  double v4 = [(SBCoverSheetSlidingViewController *)self dismissAddendumGestureRecognizer];
  long long v5 = [(SBCoverSheetSlidingViewController *)self _grabberRecognizer];
  CAFrameRateRange v6 = [(SBCoverSheetSlidingViewController *)self indirectPresentGestureRecognizer];
  uint64_t v7 = [(SBCoverSheetSlidingViewController *)self indirectDismissGestureRecognizer];
  BOOL v8 = [(SBCoverSheetSlidingViewController *)self scrunchDismissGestureRecognizer];
  if ((unint64_t)([v4 state] - 1) > 2) {
    id v9 = 0;
  }
  else {
    id v9 = v4;
  }
  if ((unint64_t)([v3 state] - 1) <= 2)
  {
    id v10 = v3;

    id v9 = v10;
  }
  if ((unint64_t)([v5 state] - 1) <= 2)
  {
    id v11 = v5;

    id v9 = v11;
  }
  if ((unint64_t)([v6 state] - 1) <= 2)
  {
    id v12 = v6;

    id v9 = v12;
  }
  if ((unint64_t)([v7 state] - 1) <= 2)
  {
    id v13 = v7;

    id v9 = v13;
  }
  if ((unint64_t)([v8 state] - 1) <= 2)
  {
    id v14 = v8;

    id v9 = v14;
  }

  return v9;
}

- (CGPoint)_finalLocationForTransitionToPresented:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(SBCoverSheetSlidingViewController *)self view];
  long long v5 = v4;
  if (v3)
  {
    [v4 bounds];
    CGFloat Height = CGRectGetHeight(v10);
  }
  else
  {
    CGFloat Height = 0.0;
  }

  double v7 = 0.0;
  double v8 = Height;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_cancelTransitionForGesture:(id)a3
{
  if (self->_indirectPresentGestureRecognizer == a3 || self->_indirectDismissGestureRecognizer == a3) {
    self->_initialTouchOffsetFromScreenEdge = 0.0;
  }
  frameRateAssertion = self->_frameRateAssertion;
  id v5 = a3;
  [(SBFFrameRateAssertion *)frameRateAssertion invalidate];
  CAFrameRateRange v6 = self->_frameRateAssertion;
  self->_frameRateAssertion = 0;

  double v7 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  if ([v7 syntheticAppearState] == 3)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
    BOOL v8 = [v9 syntheticAppearState] == 2;
  }
  BOOL v10 = [(SBCoverSheetSlidingViewController *)self _shouldRubberBandForGestureRecognizer:v5];

  [(SBCoverSheetSlidingViewController *)self _finishTransitionToPresented:v10 | v8 animated:1 withCompletion:0];
}

- (CGPoint)_locationForGesture:(id)a3
{
  double v4 = (SBIndirectPanGestureRecognizer *)a3;
  id v5 = [(SBCoverSheetSlidingViewController *)self view];
  [(SBIndirectPanGestureRecognizer *)v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if (self->_indirectPresentGestureRecognizer == v4)
  {
    double v9 = fmax(v9 - self->_initialTouchOffsetFromScreenEdge, 0.0);
  }
  else if (self->_indirectDismissGestureRecognizer == v4)
  {
    BOOL v10 = [(SBCoverSheetSlidingViewController *)self view];
    [v10 bounds];
    double Height = CGRectGetHeight(v15);

    if (Height >= v9 + self->_initialTouchOffsetFromScreenEdge) {
      double v9 = v9 + self->_initialTouchOffsetFromScreenEdge;
    }
    else {
      double v9 = Height;
    }
  }

  double v12 = v7;
  double v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_velocityForGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(SBCoverSheetSlidingViewController *)self view];
  [v4 velocityInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)_averageVelocityForGesture:(id)a3
{
  [a3 averageTouchVelocityOverTimeDuration:0.0416666667];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_adjustedTouchLocationForCurrentDismissalMode:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  if (self->_dismissalSlidingMode == 2)
  {
    [(CSLockScreenSettings *)self->_lockScreenSettings unlockRubberBandThreshold];
    double v7 = v6;
    double v8 = [(SBCoverSheetSlidingViewController *)self view];
    [v8 bounds];
    double v10 = v9 - y;

    double v11 = [(SBCoverSheetSlidingViewController *)self view];
    [v11 bounds];
    double y = v12 - v7 * (1.0 - 1.0 / (v10 / v7 * 0.55 + 1.0));
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.CGFloat x = v13;
  return result;
}

- (BOOL)_shouldRubberBandForGestureRecognizer:(id)a3
{
  int64_t dismissalSlidingMode = self->_dismissalSlidingMode;
  id v5 = a3;
  double v6 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  double v7 = [v6 dismissGestures];
  char v8 = [v7 containsObject:v5];

  if (dismissalSlidingMode == 2) {
    return v8;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldEndPresentedForEndingGestureRecognizer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  if ([(__CFString *)v5 state] != 3)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBCoverSheetSlidingViewController.m" lineNumber:1047 description:@"You should not ask how to finish a transition for gesture recognizer that is not ended."];
  }
  double v6 = [(SBCoverSheetSlidingViewController *)self view];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  BOOL v7 = [(SBCoverSheetSlidingViewController *)self _mathForGestureRecognizerPointsDown:v5 position:&v20 velocity:&v19 instantVelocity:&v18 averageVelocity:&v17];
  if ([(SBCoverSheetSlidingViewController *)self _shouldRubberBandForGestureRecognizer:v5])
  {
    char v8 = SBLogCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Rubber banding to presented for gesture: %@", buf, 0xCu);
    }

    BOOL v7 = 1;
  }
  if ([(SBCoverSheetSlidingViewController *)self _isPresentingInterstitialForGestureRecognizer:v5])
  {
    double v9 = SBLogCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Finishing presented because presenting interstitial for gesture: %@", buf, 0xCu);
    }

    BOOL v7 = 1;
  }
  uint64_t v10 = [(__CFString *)v5 state];
  [v6 bounds];
  -[SBCoverSheetSlidingViewController _studyLogForGestureRecognizerState:bounds:position:velocity:](self, "_studyLogForGestureRecognizerState:bounds:position:velocity:", v10);
  double v11 = SBLogCoverSheet();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = [(SBCoverSheetSlidingViewController *)self _grabberRecognizer];
    double v13 = @"Dismiss";
    if (v12 == v5) {
      double v13 = @"Present";
    }
    *(_DWORD *)buf = 138413314;
    uint64_t v22 = v13;
    double v14 = @"presented";
    __int16 v23 = 2112;
    if (!v7) {
      double v14 = @"dismissed";
    }
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v20;
    __int16 v27 = 2048;
    uint64_t v28 = v18;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%@ Gesture recognizer Should End %@ \t position: %f instantVelocity: %f averageVelocity: %f", buf, 0x34u);
  }
  return v7;
}

- (BOOL)_mathForGestureRecognizerPointsDown:(id)a3 position:(double *)a4 velocity:(double *)a5 instantVelocity:(double *)a6 averageVelocity:(double *)a7
{
  id v12 = a3;
  double v13 = [(SBCoverSheetSlidingViewController *)self view];
  [(SBCoverSheetSlidingViewController *)self _locationForGesture:v12];
  double v15 = v14;
  [(SBCoverSheetSlidingViewController *)self _velocityForGesture:v12];
  double v17 = v16;
  double v18 = 0.0;
  double v19 = v16;
  if (objc_opt_respondsToSelector())
  {
    [(SBCoverSheetSlidingViewController *)self _averageVelocityForGesture:v12];
    double v19 = v20;
    double v18 = v20;
  }
  [v13 bounds];
  BOOL v21 = v15 + v19 * 0.15 > CGRectGetHeight(v23) * 0.6 && v19 >= *(double *)&SBCoverSheetMinimumYVelocityForDismissal;
  [v13 bounds];
  if (v15 > CGRectGetHeight(v24) - *(double *)&SBCoverSheetMinimumYDistanceForDismissal) {
    BOOL v21 = 1;
  }
  if (a4) {
    *a4 = v15;
  }
  if (a6) {
    *a6 = v17;
  }
  if (a7) {
    *a7 = v18;
  }
  if (a5) {
    *a5 = v19;
  }

  return v21;
}

- (BOOL)_isPresentingInterstitialForGestureRecognizer:(id)a3
{
  int64_t dismissalSlidingMode = self->_dismissalSlidingMode;
  id v5 = a3;
  double v6 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  BOOL v7 = [v6 dismissGestures];
  char v8 = [v7 containsObject:v5];

  if (dismissalSlidingMode == 3) {
    return v8;
  }
  else {
    return 0;
  }
}

- (void)_logPresentGestureState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_presentGestureState != a3)
  {
    self->_presentGestureState = a3;
    double v3 = [(SBCoverSheetSlidingViewController *)self _grabberRecognizer];
    double v4 = SBLogCoverSheet();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_msgSend(v3, "sb_stringForState");
      double v6 = [v3 view];
      [v3 locationInView:v6];
      uint64_t v8 = v7;
      double v9 = [v3 view];
      [v3 velocityInView:v9];
      int v11 = 138543874;
      id v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Present gesture: %{public}@\tposition: %f velocity: %f", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)_logDismissGestureState:(int64_t)a3 forAddendumGesture:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_dismissGestureState != a3)
  {
    BOOL v4 = a4;
    self->_dismissGestureState = a3;
    double v6 = SBLogCoverSheet();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        uint64_t v8 = [(UIGestureRecognizer *)self->_dismissAddendumGestureRecognizer sb_stringForState];
        dismissAddendumGestureRecognizer = self->_dismissAddendumGestureRecognizer;
        uint64_t v10 = [(SBScreenEdgePanGestureRecognizer *)dismissAddendumGestureRecognizer view];
        [(SBScreenEdgePanGestureRecognizer *)dismissAddendumGestureRecognizer locationInView:v10];
        uint64_t v12 = v11;
        __int16 v13 = self->_dismissAddendumGestureRecognizer;
        uint64_t v14 = [(SBScreenEdgePanGestureRecognizer *)v13 view];
        [(SBScreenEdgePanGestureRecognizer *)v13 velocityInView:v14];
        int v22 = 138543874;
        CGRect v23 = v8;
        __int16 v24 = 2048;
        uint64_t v25 = v12;
        __int16 v26 = 2048;
        uint64_t v27 = v15;
        uint64_t v16 = "Dismiss Addendum gesture: %{public}@\tposition: %f velocity: %f";
LABEL_7:
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 0x20u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [(UIGestureRecognizer *)self->_dismissGestureRecognizer sb_stringForState];
      dismissGestureRecognizer = self->_dismissGestureRecognizer;
      uint64_t v10 = [(SBScreenEdgePanGestureRecognizer *)dismissGestureRecognizer view];
      [(SBScreenEdgePanGestureRecognizer *)dismissGestureRecognizer locationInView:v10];
      uint64_t v19 = v18;
      double v20 = self->_dismissGestureRecognizer;
      uint64_t v14 = [(SBScreenEdgePanGestureRecognizer *)v20 view];
      [(SBScreenEdgePanGestureRecognizer *)v20 velocityInView:v14];
      int v22 = 138543874;
      CGRect v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      uint64_t v16 = "Dismiss gesture: %{public}@\tposition: %f velocity: %f";
      goto LABEL_7;
    }
  }
}

- (void)_beginTransitionFromAppeared:(BOOL)a3
{
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:](a3, v5);
  }

  [(SBCoverSheetSlidingViewController *)self _setCornerRounded:self->_roundsCorners];
  double v6 = [(SBCoverSheetSlidingViewController *)self view];
  [v6 setNeedsLayout];
  [v6 layoutIfNeeded];
  dispatch_group_t v7 = dispatch_group_create();
  [(SBCoverSheetSlidingViewController *)self setCompletionGroup:v7];
}

- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = SBLogCoverSheet();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(CGFloat *)&uint8_t buf[4] = x;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = y;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v20) = v4;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "updateForLocation: %.2f, %.2f, %{BOOL}d", buf, 0x1Cu);
  }

  double v9 = [(SBCoverSheetSlidingViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  uint64_t v12 = [(SBCoverSheetSlidingViewController *)self progressProperty];
  double v13 = 1.0 - y / v11;
  [v12 setValue:v13];

  uint64_t v14 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  uint64_t v15 = [v14 isAnyGestureActivelyRecognized];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v20 = __Block_byref_object_copy__32;
  uint64_t v21 = __Block_byref_object_dispose__32;
  id v22 = 0;
  uint64_t v16 = [(SBCoverSheetSlidingViewController *)self delegate];
  v17[5] = buf;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke;
  v18[3] = &unk_1E6AF4B88;
  v18[4] = self;
  v18[5] = buf;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_117;
  v17[3] = &unk_1E6AF4B88;
  v17[4] = self;
  [v16 coverSheetSlidingViewController:self animateForGestureActive:v15 withProgress:v18 beginBlock:v17 endBlock:v13];

  _Block_object_dispose(buf, 8);
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke(uint64_t a1)
{
  v1 = (void *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) completionGroup];
  uint64_t v3 = *(void *)(v1[1] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(NSObject **)(*(void *)(v1[1] + 8) + 40);
  if (v5)
  {
    dispatch_group_enter(v5);
    ++*(void *)(*v1 + 1152);
    double v6 = SBLogCoverSheet();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_cold_1(v1, 1152, v6);
    }
  }
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_117(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = (void *)(a1 + 32);
    --*(void *)(v4 + 1152);
    id v5 = SBLogCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_117_cold_1(v3, 1152, v5);
    }
  }
}

- (void)_endTransitionToAppeared:(BOOL)a3
{
  [(SBCoverSheetSlidingViewController *)self _setCornerRounded:0];
  uint64_t v4 = SBLogCoverSheet();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBCoverSheetSlidingViewController _endTransitionToAppeared:](a3, v4);
  }
}

- (CGRect)_updatePositionViewForProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(SBCoverSheetSlidingViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  double v12 = v11 - a3 * v11;
  double v13 = -(a4 * v11);
  uint64_t v14 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  uint64_t v15 = [v14 transitionStyle];

  if (v15 == 1) {
    double v16 = v11;
  }
  else {
    double v16 = v12;
  }
  if (v15 == 1) {
    double v17 = *MEMORY[0x1E4F1DAD8];
  }
  else {
    double v17 = 0.0;
  }
  if (v15 == 1) {
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else {
    double v18 = v13;
  }
  uint64_t v19 = [(SBCoverSheetSlidingViewController *)self positionView];
  objc_msgSend(v19, "positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:", self->_dismissalTransformMode, v5, 0.0, v16, v17, v18);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  -[SBCoverSheetSlidingViewController _positionSubviewsForContentFrame:forPresentationValue:](self, "_positionSubviewsForContentFrame:forPresentationValue:", v5);

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.double y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)_setCornerRounded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(SBCoverSheetSlidingViewController *)self positionView];
  id v9 = [v4 contentView];

  double v5 = 0.0;
  if (v3)
  {
    double v6 = [MEMORY[0x1E4F42D90] mainScreen];
    dispatch_group_t v7 = [v6 traitCollection];
    [v7 displayCornerRadius];
    double v5 = v8;
  }
  [v9 _setContinuousCornerRadius:v5];
  [v9 setClipsToBounds:v3];
}

- (void)_animationTickForPresentationValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  progressPropertdouble y = self->_progressProperty;
  if (a3)
  {
    [(UIViewFloatAnimatableProperty *)progressProperty presentationValue];
    double v7 = v6;
    [(UIViewFloatAnimatableProperty *)self->_catchupProperty presentationValue];
  }
  else
  {
    [(UIViewFloatAnimatableProperty *)progressProperty value];
    double v7 = v10;
    [(UIViewFloatAnimatableProperty *)self->_catchupProperty value];
  }
  double v9 = v8;
  [(SBCoverSheetSlidingViewController *)self _viewVelocity];
  double v12 = v11;
  if (self->_performingCatchUpForPresentation) {
    double v13 = 1.0 - (1.0 - v7) * v9;
  }
  else {
    double v13 = v7 * v9;
  }
  double v14 = v11;
  if (v3)
  {
    [(UIViewFloatAnimatableProperty *)self->_progressProperty velocity];
    double v16 = v15;
    [(UIViewFloatAnimatableProperty *)self->_catchupProperty velocity];
    double v18 = v9 * v16 + v7 * v17;
    double v19 = -((1.0 - v7) * v17 - v16 * v9);
    if (self->_performingCatchUpForPresentation) {
      double v14 = v19;
    }
    else {
      double v14 = v18;
    }
  }
  double v20 = SBLogCoverSheet();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 134219008;
    double v33 = v7;
    __int16 v34 = 2048;
    double v35 = v9;
    __int16 v36 = 2048;
    double v37 = v13;
    __int16 v38 = 2048;
    double v39 = v12;
    __int16 v40 = 1024;
    BOOL v41 = v3;
    _os_log_debug_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEBUG, "animation ticked with progress: %.2f catchup: %.2f adjustedProgress: %.2f velocity: %.2f forPresentationValue: %{BOOL}d", (uint8_t *)&v32, 0x30u);
  }

  [(SBCoverSheetSlidingViewController *)self _animationTickedWithProgress:v3 velocity:v13 forPresentationValue:v14];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  uint64_t v30 = [v29 isAnyGestureActivelyRecognized];

  double v31 = [(SBCoverSheetSlidingViewController *)self delegate];
  objc_msgSend(v31, "coverSheetSlidingViewController:animationTickedWithProgress:velocity:coverSheetFrame:gestureActive:forPresentationValue:", self, v30, v3, v13, v12, v22, v24, v26, v28);
}

- (void)_createProperties
{
  v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  catchupPropertdouble y = self->_catchupProperty;
  self->_catchupPropertdouble y = v3;

  [(UIViewFloatAnimatableProperty *)self->_catchupProperty setVelocityUsableForVFD:1];
  [(UIViewFloatAnimatableProperty *)self->_catchupProperty setValue:1.0];
  double v5 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  progressPropertdouble y = self->_progressProperty;
  self->_progressPropertdouble y = v5;

  [(UIViewFloatAnimatableProperty *)self->_progressProperty setVelocityUsableForVFD:1];
  [(UIViewFloatAnimatableProperty *)self->_progressProperty setValue:0.0];
  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x1E4F42FF0];
  double v8 = self->_catchupProperty;
  v15[0] = self->_progressProperty;
  v15[1] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__SBCoverSheetSlidingViewController__createProperties__block_invoke;
  v12[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SBCoverSheetSlidingViewController__createProperties__block_invoke_2;
  v10[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v11, &location);
  [v7 _createTransformerWithInputAnimatableProperties:v9 modelValueSetter:v12 presentationValueSetter:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __54__SBCoverSheetSlidingViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animationTickForPresentationValue:0];
}

void __54__SBCoverSheetSlidingViewController__createProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animationTickForPresentationValue:1];
}

- (void)_startCatchupAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = SBLogCoverSheet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "_startCatchupAnimationWithDuration", buf, 2u);
  }

  if (self->_lastTouchLocation.x != *MEMORY[0x1E4F1DAD8]
    || self->_lastTouchLocation.y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [(SBCoverSheetSlidingViewController *)self lastTouchLocation];
    -[SBCoverSheetSlidingViewController _updateForLocation:interactive:](self, "_updateForLocation:interactive:", 1);
  }
  [(UIViewFloatAnimatableProperty *)self->_catchupProperty setValue:0.0];
  double v9 = (void *)MEMORY[0x1E4F42FF0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke;
  v13[3] = &unk_1E6AF4AC0;
  v13[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_3;
  v11[3] = &unk_1E6AFA3D8;
  id v12 = v6;
  id v10 = v6;
  [v9 _animateUsingSpringWithDampingRatio:0 response:v13 tracking:v11 initialDampingRatio:1.0 initialResponse:a3 dampingRatioSmoothing:0.0 responseSmoothing:0.0 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1144) setValue:1.0];
}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_transitionToViewControllerAppearState:(int)a3
{
}

- (void)_transitionToViewControllerAppearState:(int)a3 forUserGesture:(BOOL)a4
{
}

- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v32 = [(SBCoverSheetSlidingViewController *)self delegate];
  switch(a3)
  {
    case 0:
      if (self->_dismissalSlidingMode == 2)
      {
        double v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2 object:self file:@"SBCoverSheetSlidingViewController.m" lineNumber:1430 description:@"if we're in rubber band mode we should never ever disappear"];
      }
      [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:3 ifNeeded:1 forUserGesture:v5];
      id v10 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      [v10 setSyntheticAppearState:0];

      [v32 coverSheetSlidingViewControllerCleanupDismissalTransition:self];
      id v11 = self;
      uint64_t v12 = 0;
      goto LABEL_28;
    case 1:
      [(SBCoverSheetSlidingViewController *)self setCompletionBlock:0];
      int64_t dismissalSlidingMode = self->_dismissalSlidingMode;
      if (v6)
      {
        double v14 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
        BOOL v15 = [v14 syntheticAppearState] == 3;
      }
      else
      {
        BOOL v15 = 1;
      }
      double v23 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      int v24 = [v23 syntheticAppearState];

      double v25 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      int v26 = [v25 syntheticAppearState];

      double v27 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      [v27 setSyntheticAppearState:1];

      if (v15)
      {
        if (dismissalSlidingMode == 2)
        {
          [v32 coverSheetSlidingViewControllerPrepareForRubberBandedPresentationTransition:self];
        }
        else
        {
          [v32 coverSheetSlidingViewController:self prepareForPresentationTransitionForUserGesture:v5];
          if (!v24 || v26 == 3) {
            [(SBCoverSheetSlidingViewController *)self _beginTransitionFromAppeared:0];
          }
        }
      }
      goto LABEL_29;
    case 2:
      [(SBCoverSheetSlidingViewController *)self _transitionToViewControllerAppearState:1 ifNeeded:1 forUserGesture:v5];
      double v16 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      [v16 setSyntheticAppearState:2];

      int64_t v17 = self->_dismissalSlidingMode;
      if (v17 == 3)
      {
        [v32 coverSheetSlidingViewControllerCleanupInterstitialTransition:self];
      }
      else
      {
        if (v17 == 2)
        {
          [v32 coverSheetSlidingViewControllerCleanupRubberBandedPresentationTransition:self];
        }
        else
        {
          if (v17 != 1) {
            goto LABEL_29;
          }
          [v32 coverSheetSlidingViewControllerCleanupPresentationTransition:self];
        }
        id v11 = self;
        uint64_t v12 = 1;
LABEL_28:
        [(SBCoverSheetSlidingViewController *)v11 _endTransitionToAppeared:v12];
      }
      goto LABEL_29;
    case 3:
      [(SBCoverSheetSlidingViewController *)self setCompletionBlock:0];
      double v18 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      int v19 = [v18 syntheticAppearState];

      double v20 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
      int v21 = [v20 syntheticAppearState];

      if (v6)
      {
        double v22 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
        [v22 setSyntheticAppearState:3];

        if (v19 != 1 && v21 != 2) {
          goto LABEL_29;
        }
      }
      else
      {
        double v28 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
        [v28 setSyntheticAppearState:3];
      }
      [v32 coverSheetSlidingViewController:self prepareForDismissalTransitionForReversingTransition:v19 == 1 forUserGesture:v5];
      int64_t v29 = self->_dismissalSlidingMode;
      if (v21 == 2 && v29 != 3) {
        [(SBCoverSheetSlidingViewController *)self _beginTransitionFromAppeared:1];
      }
      if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v30 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
        [v30 setSyntheticAppearState:2];
      }
LABEL_29:

      return;
    default:
      goto LABEL_29;
  }
}

- (void)_addSystemGestureRecognizers
{
  if (self->_canBePulledDown)
  {
    [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizerIfUntracked:self->_indirectPresentGestureRecognizer withType:9];
    [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizerIfUntracked:self->_dismissAddendumGestureRecognizer withType:3];
    uint64_t v3 = 12;
    uint64_t v4 = 11;
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v3 = 14;
    uint64_t v4 = 13;
    uint64_t v5 = 4;
  }
  if (self->_canBePulledUp)
  {
    [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizerIfUntracked:self->_dismissGestureRecognizer withType:v5];
    [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizerIfUntracked:self->_indirectDismissGestureRecognizer withType:v4];
    scrunchDismissGestureRecognizer = self->_scrunchDismissGestureRecognizer;
    [(SBCoverSheetSlidingViewController *)self _addSystemGestureRecognizerIfUntracked:scrunchDismissGestureRecognizer withType:v3];
  }
}

- (void)_removeSystemGestureRecognizers
{
  uint64_t v3 = +[SBSystemGestureManager mainDisplayManager];
  uint64_t v4 = [(SBCoverSheetSlidingViewController *)self _grabberRecognizer];
  [v3 removeGestureRecognizer:v4];

  uint64_t v5 = +[SBSystemGestureManager mainDisplayManager];
  [v5 removeGestureRecognizer:self->_dismissGestureRecognizer];

  BOOL v6 = +[SBSystemGestureManager mainDisplayManager];
  [v6 removeGestureRecognizer:self->_dismissAddendumGestureRecognizer];

  double v7 = +[SBSystemGestureManager mainDisplayManager];
  [v7 removeGestureRecognizer:self->_indirectDismissGestureRecognizer];

  double v8 = +[SBSystemGestureManager mainDisplayManager];
  [v8 removeGestureRecognizer:self->_scrunchDismissGestureRecognizer];

  id v9 = +[SBSystemGestureManager mainDisplayManager];
  [v9 removeGestureRecognizer:self->_indirectPresentGestureRecognizer];
}

- (void)_addSystemGestureRecognizerIfUntracked:(id)a3 withType:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = +[SBSystemGestureManager mainDisplayManager];
  if ([v6 isSystemGestureRecognizer:v5])
  {
    double v7 = SBLogCoverSheet();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Ignoring attempt to add CoverSheet system gesture: %@ because it is already tracked.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [v6 addGestureRecognizer:v5 withType:a4];
  }
}

- (id)_grabberRecognizer
{
  uint64_t v2 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  uint64_t v3 = [v2 presentGestureRecognizer];

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7 = a3;
  id v5 = [(CSLockScreenSettings *)self->_lockScreenSettings coverSheetDismissGestureSettings];

  BOOL v6 = v7;
  if (v5 == v7)
  {
    [(SBCoverSheetSlidingViewController *)self _updateCoverSheetDismissSettings:v7];
    BOOL v6 = v7;
  }
}

- (void)_updateHomeGestureSettings:(id)a3
{
  id v3 = a3;
  [v3 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&SBCoverSheetMinimumYDistanceForDismissal = v4 * SBMainScreenPointsPerMillimeter();
  [v3 minimumYVelocityForHome];
  double v6 = v5;

  *(double *)&SBCoverSheetMinimumYVelocityForDismissal = v6 * SBMainScreenPointsPerMillimeter();
}

- (void)_updateCoverSheetDismissSettings:(id)a3
{
  dismissGestureRecognizer = self->_dismissGestureRecognizer;
  id v5 = a3;
  [v5 edgeRegionSize];
  -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](dismissGestureRecognizer, "_setEdgeRegionSize:");
  double v6 = self->_dismissGestureRecognizer;
  [v5 edgeRegionSize];
  -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v6, "_setBottomEdgeRegionSize:");
  -[SBScreenEdgePanGestureRecognizer setEnabled:](self->_dismissAddendumGestureRecognizer, "setEnabled:", [v5 extendSwipeUpRegion]);
  dismissAddendumGestureRecognizer = self->_dismissAddendumGestureRecognizer;
  [v5 extendedEdgeRegionSize];
  -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](dismissAddendumGestureRecognizer, "_setEdgeRegionSize:");
  int v8 = self->_dismissAddendumGestureRecognizer;
  [v5 extendedEdgeRegionSize];
  double v10 = v9;

  [(UIScreenEdgePanGestureRecognizer *)v8 _setBottomEdgeRegionSize:v10];
}

- (void)setCompletionGroup:(id)a3
{
  id v5 = (OS_dispatch_group *)a3;
  if (self->_completionGroup != v5)
  {
    double v6 = v5;
    [(SBCoverSheetSlidingViewController *)self setCompletionBlock:0];
    objc_storeStrong((id *)&self->_completionGroup, a3);
    id v5 = v6;
  }
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  p_completionBlock = &self->_completionBlock;
  if (*p_completionBlock != v4)
  {
    if (*p_completionBlock)
    {
      double v6 = SBLogCoverSheet();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[SBCoverSheetSlidingViewController setCompletionBlock:](p_completionBlock);
      }

      dispatch_block_cancel(*p_completionBlock);
    }
    uint64_t v7 = [v4 copy];
    id v8 = *p_completionBlock;
    id *p_completionBlock = (id)v7;

    double v9 = SBLogCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetSlidingViewController setCompletionBlock:](p_completionBlock);
    }
  }
}

- (void)_studyLogForGestureRecognizerState:(int64_t)a3 bounds:(CGRect)a4 position:(double)a5 velocity:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__SBCoverSheetSlidingViewController__studyLogForGestureRecognizerState_bounds_position_velocity___block_invoke;
  v14[3] = &__block_descriptor_88_e5__8__0l;
  v14[4] = a3;
  *(double *)&v14[5] = a5;
  *(double *)&v14[6] = a6;
  *(CGFloat *)&v14[7] = x;
  *(CGFloat *)&v14[8] = y;
  *(CGFloat *)&v14[9] = width;
  *(CGFloat *)&v14[10] = height;
  [v13 logBlock:v14];
}

id __97__SBCoverSheetSlidingViewController__studyLogForGestureRecognizerState_bounds_position_velocity___block_invoke(uint64_t a1)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"state";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v18[0] = v2;
  v17[1] = @"position";
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v18[1] = v3;
  v17[2] = @"velocity";
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v18[2] = v4;
  v17[3] = @"viewBounds";
  v15[0] = @"x";
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v16[0] = v5;
  v15[1] = @"y";
  double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v16[1] = v6;
  v15[2] = @"width";
  uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v16[2] = v7;
  void v15[3] = @"height";
  id v8 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  v16[3] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v18[3] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  id v13 = @"[SBCoverSheetSlidingViewController _shouldEndPresentedForEndingGestureRecognizer:]";
  double v14 = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  return v11;
}

- (void)_studyLogForCompletionOfTransitionToPresented:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v6 = [v5 isEnabled];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:@"SBCoverSheetSlidingViewController" forKeyedSubscript:@"LogSource"];
    id v8 = @"VisibleUI";
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
  double v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 activeInterfaceOrientation];

  id v11 = [(UIViewController *)self _sbWindowScene];
  uint64_t v12 = [v11 switcherController];

  if (a3)
  {
    id v13 = @"CoverSheet";
    goto LABEL_20;
  }
  int IsActive = SBWorkspaceSpringBoardIsActive();
  uint64_t v15 = [v12 unlockedEnvironmentMode];
  BOOL v16 = v15 == 2;
  if (IsActive)
  {
    if (v15 != 2)
    {
      id v13 = @"HomeScreen";
      goto LABEL_20;
    }
    int64_t v17 = v12;
  }
  else
  {
    int64_t v17 = v12;
    if (!v16)
    {
      int v19 = [v12 layoutStatePrimaryElement];
      double v20 = [v19 workspaceEntity];
      int v21 = [v20 applicationSceneEntity];
      double v22 = [v21 sceneHandle];

      double v23 = [v22 application];
      uint64_t v24 = [v23 bundleIdentifier];
      double v25 = (void *)v24;
      int v26 = @"Unknown";
      if (v24) {
        int v26 = (__CFString *)v24;
      }
      id v13 = v26;

      uint64_t v27 = [v22 currentInterfaceOrientation];
      if (v6)
      {
        double v28 = [NSNumber numberWithInteger:v27];
        [v7 setObject:v28 forKeyedSubscript:@"AppInterfaceOrientation"];
      }
      goto LABEL_18;
    }
  }
  uint64_t v18 = [v17 interfaceOrientation];
  if (v6)
  {
    double v22 = [NSNumber numberWithInteger:v18];
    [v7 setObject:v22 forKeyedSubscript:@"SwitcherInterfaceOrientation"];
    id v13 = @"AppSwitcher";
LABEL_18:

    goto LABEL_20;
  }
  id v13 = @"AppSwitcher";
LABEL_20:
  int64_t v29 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = BSInterfaceOrientationDescription();
    double v31 = BSInterfaceOrientationDescription();
    id v32 = BSInterfaceOrientationDescription();
    *(_DWORD *)buf = 138413058;
    double v39 = v13;
    __int16 v40 = 2112;
    BOOL v41 = v30;
    __int16 v42 = 2112;
    BOOL v43 = v31;
    __int16 v44 = 2112;
    v45 = v32;
    _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_INFO, "Visible UI change seen by Cover Sheet: transition to %@ (SB interface orientation: %@, switcher interface orientation: %@,  app interface orientation: %@)", buf, 0x2Au);
  }
  if (v6)
  {
    double v33 = [NSNumber numberWithInteger:v10];
    [v7 setObject:v33 forKeyedSubscript:@"SBInterfaceOrientation"];

    [v7 setObject:v13 forKeyedSubscript:v8];
    __int16 v34 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    __int16 v36 = @"VisibleUIChanged";
    double v37 = v7;
    double v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [v34 log:v35];
  }
}

- (SBCoverSheetSlidingViewControllerContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (SBCoverSheetSlidingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCoverSheetSlidingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBScreenEdgePanGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (SBScreenEdgePanGestureRecognizer)dismissAddendumGestureRecognizer
{
  return self->_dismissAddendumGestureRecognizer;
}

- (void)setDismissAddendumGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer
{
  return self->_indirectPresentGestureRecognizer;
}

- (void)setIndirectPresentGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer
{
  return self->_indirectDismissGestureRecognizer;
}

- (void)setIndirectDismissGestureRecognizer:(id)a3
{
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
}

- (SBProximitySensorManager)proximitySensorManager
{
  return self->_proximitySensorManager;
}

- (void)setProximitySensorManager:(id)a3
{
}

- (int64_t)dismissalSlidingMode
{
  return self->_dismissalSlidingMode;
}

- (int64_t)dismissalTransformMode
{
  return self->_dismissalTransformMode;
}

- (void)setDismissalTransformMode:(int64_t)a3
{
  self->_dismissalTransformMode = a3;
}

- (void)setSystemGesturesDelegate:(id)a3
{
}

- (BOOL)roundsCorners
{
  return self->_roundsCorners;
}

- (void)setRoundsCorners:(BOOL)a3
{
  self->_roundsCorners = a3;
}

- (CSCoverSheetTransitionSettings)transitionSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionSettings);
  return (CSCoverSheetTransitionSettings *)WeakRetained;
}

- (void)setTransitionSettings:(id)a3
{
}

- (SBCoverSheetPositionView)positionView
{
  return self->_positionView;
}

- (void)setPositionView:(id)a3
{
}

- (BOOL)indirectPresentGestureCalledBegin
{
  return self->_indirectPresentGestureCalledBegin;
}

- (void)setIndirectPresentGestureCalledBegin:(BOOL)a3
{
  self->_indirectPresentGestureCalledBegin = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
}

- (int64_t)presentGestureState
{
  return self->_presentGestureState;
}

- (BOOL)canBePulledDown
{
  return self->_canBePulledDown;
}

- (void)setCanBePulledDown:(BOOL)a3
{
  self->_canBePulledDown = a3;
}

- (BOOL)canBePulledUp
{
  return self->_canBePulledUp;
}

- (void)setCanBePulledUp:(BOOL)a3
{
  self->_canBePulledUp = a3;
}

- (UIViewFloatAnimatableProperty)progressProperty
{
  return self->_progressProperty;
}

- (void)setProgressProperty:(id)a3
{
}

- (UIViewFloatAnimatableProperty)catchupProperty
{
  return self->_catchupProperty;
}

- (void)setCatchupProperty:(id)a3
{
}

- (BOOL)performingCatchUpForPresentation
{
  return self->_performingCatchUpForPresentation;
}

- (void)setPerformingCatchUpForPresentation:(BOOL)a3
{
  self->_performingCatchUpForPresentation = a3;
}

- (CGPoint)lastTouchLocation
{
  double x = self->_lastTouchLocation.x;
  double y = self->_lastTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (CGPoint)lastGestureVelocity
{
  double x = self->_lastGestureVelocity.x;
  double y = self->_lastGestureVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastGestureVelocity:(CGPoint)a3
{
  self->_lastGestureVelocitdouble y = a3;
}

- (int64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(int64_t)a3
{
  self->_groupCount = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (double)initialTouchOffsetFromScreenEdge
{
  return self->_initialTouchOffsetFromScreenEdge;
}

- (void)setInitialTouchOffsetFromScreenEdge:(double)a3
{
  self->_initialTouchOffsetFromScreenEdge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_catchupProperty, 0);
  objc_storeStrong((id *)&self->_progressProperty, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_positionView, 0);
  objc_destroyWeak((id *)&self->_transitionSettings);
  objc_storeStrong((id *)&self->_systemGesturesDelegate, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissAddendumGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_suppressTouchCancellation, 0);
  objc_storeStrong((id *)&self->_frameRateAssertion, 0);
}

- (void)_dismissGestureBeganWithGestureRecognizer:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = 0;
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "dismissGestureBegan: imparting velocity (%f, %f)", (uint8_t *)&v2, 0x16u);
}

- (void)_presentOrDismissGestureChangedWithGestureRecognizer:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "We're presenting the interstitial, don't move CoverSheet.", v1, 2u);
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_cold_1()
{
  v0 = (void *)MEMORY[0x1D948C7A0]();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "completionBlock %p Creation", v3, v4, v5, v6, v7);
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_94_cold_1(void *a1)
{
  uint64_t v1 = [a1 completionBlock];
  uint64_t v2 = (void *)MEMORY[0x1D948C7A0]();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v3, v4, "completionBlock %p Fired", v5, v6, v7, v8, v9);
}

- (void)_beginTransitionFromAppeared:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "_beginTransitionFromAppeared: %{BOOL}d", (uint8_t *)v2, 8u);
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134217984;
  *(void *)((char *)&v3 + 4) = *(void *)(*a1 + a2);
  OUTLINED_FUNCTION_2_8(&dword_1D85BA000, a2, a3, "completionBlock Group Enter %ld", (void)v3);
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_117_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134217984;
  *(void *)((char *)&v3 + 4) = *(void *)(*a1 + a2);
  OUTLINED_FUNCTION_2_8(&dword_1D85BA000, a2, a3, "completionBlock Group Leave %ld", (void)v3);
}

- (void)_endTransitionToAppeared:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "_endTransitionToAppeared: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)setCompletionBlock:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1D948C7A0](*a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "completionBlock %p Saved", v4, v5, v6, v7, v8);
}

- (void)setCompletionBlock:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1D948C7A0](*a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "completionBlock %p Cancelled", v4, v5, v6, v7, v8);
}

@end