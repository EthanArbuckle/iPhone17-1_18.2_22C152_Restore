@interface SBSpotlightPresentableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_setUpHostedContentMetrics;
- (BOOL)allowsKeyboardWhileInteractive;
- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance;
- (BOOL)allowsVelocityInjection;
- (BOOL)cancellingDismissAnimation;
- (BOOL)dismissingFromFullyPresented;
- (BOOL)hasUnifiedKeyboardBackground;
- (BOOL)initializingKeyboardView;
- (BOOL)injectsVelocityForNonInteractiveTransitions;
- (BOOL)injectsVelocityOnlyForShortSwipes;
- (BOOL)keyboardFollowsSpotlightContent;
- (BOOL)scalesSearchAffordanceContentWhileFading;
- (BOOL)supportsSeparateSearchBarBackground;
- (BOOL)waitingForKeyboardPresentationForFadeIn;
- (BOOL)waitingForSearchContentAvailabilityForFadeIn;
- (BSInvalidatable)stateCaptureHandle;
- (CGRect)searchAffordanceReferenceFrame;
- (NSMutableSet)searchBarPortalRequirementReasons;
- (NSString)description;
- (SBFFluidBehaviorSettings)scaleSettings;
- (SBFFluidBehaviorSettings)searchAnimationSettings;
- (SBHHomePullToSearchSettings)searchTransitionSettings;
- (SBHSearchAffordance)searchAffordance;
- (SBHSearchAffordance)searchAffordanceView;
- (SBHomeGrabberView)homeAffordance;
- (SBSpotlightBackgroundWeighting)searchBackgroundView;
- (SBSpotlightHostedContentMetrics)hostedContentMetrics;
- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController;
- (SBSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3;
- (SBSpotlightPresentableViewControllerDelegate)delegate;
- (SBSpotlightPresentationMetrics)_presentationMetricsWithProgress:(SEL)a3 offset:(double)a4 velocity:(double)a5 presentationState:(double)a6 previousPresentationState:(int64_t)a7 anticipatedPresentationState:(int64_t)a8 searchContentPresentationState:(int64_t)a9 searchAffordancePresentationState:(int64_t)a10 hostedContentMetrics:(int64_t)a11;
- (SBSpotlightPresentationMetrics)appliedKeyboardAlignedElementsMetrics;
- (SBSpotlightTransitionRange)backgroundBlurRange;
- (SBSpotlightTransitionRange)backgroundUnblurRange;
- (SBSpotlightTransitionRange)searchAffordanceBackgroundMaterialFadeRange;
- (SBSpotlightTransitionRange)searchAffordanceContentFadeRange;
- (SBSpotlightTransitionRange)searchAffordanceScaleAndTranslateRange;
- (SBSpotlightTransitionRange)searchBarContentFadeRange;
- (SBSpotlightTransitionRange)searchContentFadeInRange;
- (SBSpotlightTransitionRange)searchContentFadeOutRange;
- (UIView)keyboardView;
- (UIView)scaleView;
- (UIView)scalingContentView;
- (UIView)searchAffordanceBackgroundCapturingView;
- (UIView)searchAffordanceContentContainerView;
- (UIView)searchAffordanceReferenceBackgroundView;
- (UIView)searchAffordanceReferenceView;
- (UIView)searchBarPortalClippingContainerView;
- (UIViewFloatAnimatableProperty)backgroundBlurProperty;
- (UIViewFloatAnimatableProperty)keyboardFadeProperty;
- (UIViewFloatAnimatableProperty)scaleProperty;
- (UIViewFloatAnimatableProperty)searchAffordanceReferenceBackgroundFadeProperty;
- (UIViewFloatAnimatableProperty)searchContentFadeProperty;
- (_UIPortalView)keyboardProtectorPortalView;
- (_UIPortalView)searchBarBackgroundPortalView;
- (_UIPortalView)searchBarPortalView;
- (double)backgroundInteractiveBlurDistance;
- (double)injectedPercentageOfGestureVelocity;
- (double)injectedVelocityForNonInteractiveTransitions;
- (double)interactiveKeyboardPresentationOffset;
- (double)interactiveKeyboardPresentationThreshold;
- (double)keyboardFadeInStartValue;
- (double)keyboardInjectedVelocityPercentage;
- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
- (double)maxPresentationOffset;
- (double)presentationOffset;
- (double)presentationProgress;
- (double)pullTransitionDistance;
- (double)searchAffordanceBackgroundMaterialInteractiveFadeDistance;
- (double)searchAffordanceMaxOffset;
- (double)searchAffordanceMaxScaleX;
- (double)searchAffordanceMaxScaleY;
- (double)searchAffordanceOffsetRubberbandingRange;
- (double)searchAffordanceScaleRubberbandingRange;
- (double)searchAffordanceTransientFadeInThreshold;
- (double)searchContentFadeInStartValue;
- (double)searchContentInteractiveFadeInDistance;
- (double)shortSwipeMaximumPercentageOfExpectedVelocity;
- (double)spotlightActivationThreshold;
- (double)topOffset;
- (id)_sharedRemoteSearchViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5;
- (int64_t)_searchAffordancePresentationStateWithOffset:(double)a3 presentationState:(int64_t)a4 previousSearchAffordancePresentationState:(int64_t)a5;
- (int64_t)anticipatedPresentationState;
- (int64_t)presentationState;
- (int64_t)previousPresentationState;
- (int64_t)searchAffordancePresentationState;
- (unint64_t)_activeTransitionCount;
- (unint64_t)outstandingAnimationCount;
- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3;
- (void)_configureHostedContent;
- (void)_createBackgroundBlurProperty;
- (void)_createKeyboardFadeProperty;
- (void)_createScaleProperty;
- (void)_createSearchAffordanceReferenceBackgroundFadeProperty;
- (void)_createSearchContentFadeProperty;
- (void)_endRequiringSearchBarPortalViewForReason:(id)a3;
- (void)_getSearchAffordanceMetricsForDefaultSize:(CGSize)a3 presentationState:(int64_t)a4 presentationOffset:(double)a5 scaleX:(double *)a6 scaleY:(double *)a7 offset:(double *)a8 size:(CGSize *)a9 cornerRadius:(double *)a10;
- (void)_layoutSearchAffordanceWithMetrics:(SBSpotlightPresentationMetrics *)a3;
- (void)_layoutSearchContentWithMetrics:(SBSpotlightPresentationMetrics *)a3;
- (void)_layoutWithMetrics:(SBSpotlightPresentationMetrics *)a3;
- (void)_positionKeyboardAlignedElementsWithMetrics:(SBSpotlightPresentationMetrics *)a3;
- (void)_requestDismissal;
- (void)_setCornerRounded:(BOOL)a3;
- (void)_setHitTestingDisabledOnHostedContent:(BOOL)a3;
- (void)_setUpHomeAffordance;
- (void)_setUpSearchAffordance;
- (void)_setUpSearchAnimationSettings;
- (void)_setUpSearchBackground;
- (void)_setUpSearchBackgroundMatchMoveAnimation;
- (void)_tearDownBackgroundBlurProperty;
- (void)_tearDownKeyboardFadeProperty;
- (void)_tearDownSearchAffordanceReferenceBackgroundFadeProperty;
- (void)_updateForScalePropertyChanged;
- (void)_updateHomeAffordanceInteractionEnablement;
- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6 previousPresentationState:(int64_t)a7;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateBackgroundView;
- (void)invalidateSearchAffordanceView;
- (void)loadView;
- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3;
- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3;
- (void)setAllowsVelocityInjection:(BOOL)a3;
- (void)setAnticipatedPresentationState:(int64_t)a3;
- (void)setAppliedKeyboardAlignedElementsMetrics:(SBSpotlightPresentationMetrics *)a3;
- (void)setBackgroundBlurProperty:(id)a3;
- (void)setBackgroundBlurRange:(SBSpotlightTransitionRange)a3;
- (void)setBackgroundInteractiveBlurDistance:(double)a3;
- (void)setBackgroundUnblurRange:(SBSpotlightTransitionRange)a3;
- (void)setCancellingDismissAnimation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissingFromFullyPresented:(BOOL)a3;
- (void)setHomeAffordance:(id)a3;
- (void)setHostedContentMetrics:(SBSpotlightHostedContentMetrics *)a3;
- (void)setInitializingKeyboardView:(BOOL)a3;
- (void)setInjectedPercentageOfGestureVelocity:(double)a3;
- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3;
- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3;
- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3;
- (void)setInteractiveKeyboardPresentationOffset:(double)a3;
- (void)setInteractiveKeyboardPresentationThreshold:(double)a3;
- (void)setKeyboardFadeInStartValue:(double)a3;
- (void)setKeyboardFadeProperty:(id)a3;
- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3;
- (void)setKeyboardInjectedVelocityPercentage:(double)a3;
- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3;
- (void)setKeyboardProtectorPortalView:(id)a3;
- (void)setKeyboardView:(id)a3;
- (void)setMaxPresentationOffset:(double)a3;
- (void)setOutstandingAnimationCount:(unint64_t)a3;
- (void)setPresentationOffset:(double)a3;
- (void)setPresentationProgress:(double)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPreviousPresentationState:(int64_t)a3;
- (void)setPullTransitionDistance:(double)a3;
- (void)setScaleProperty:(id)a3;
- (void)setScaleSettings:(id)a3;
- (void)setScaleView:(id)a3;
- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3;
- (void)setSearchAffordance:(id)a3;
- (void)setSearchAffordanceBackgroundCapturingView:(id)a3;
- (void)setSearchAffordanceBackgroundMaterialFadeRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchAffordanceBackgroundMaterialInteractiveFadeDistance:(double)a3;
- (void)setSearchAffordanceContentContainerView:(id)a3;
- (void)setSearchAffordanceContentFadeRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchAffordanceMaxOffset:(double)a3;
- (void)setSearchAffordanceMaxScaleX:(double)a3;
- (void)setSearchAffordanceMaxScaleY:(double)a3;
- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3;
- (void)setSearchAffordancePresentationState:(int64_t)a3;
- (void)setSearchAffordanceReferenceBackgroundFadeProperty:(id)a3;
- (void)setSearchAffordanceReferenceBackgroundView:(id)a3;
- (void)setSearchAffordanceReferenceFrame:(CGRect)a3;
- (void)setSearchAffordanceReferenceView:(id)a3;
- (void)setSearchAffordanceScaleAndTranslateRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3;
- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3;
- (void)setSearchAnimationSettings:(id)a3;
- (void)setSearchBackgroundView:(id)a3;
- (void)setSearchBarBackgroundPortalView:(id)a3;
- (void)setSearchBarContentFadeRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchBarPortalClippingContainerView:(id)a3;
- (void)setSearchBarPortalRequirementReasons:(id)a3;
- (void)setSearchBarPortalView:(id)a3;
- (void)setSearchContentFadeInRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchContentFadeInStartValue:(double)a3;
- (void)setSearchContentFadeOutRange:(SBSpotlightTransitionRange)a3;
- (void)setSearchContentFadeProperty:(id)a3;
- (void)setSearchContentInteractiveFadeInDistance:(double)a3;
- (void)setSearchTransitionSettings:(id)a3;
- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3;
- (void)setSpotlightActivationThreshold:(double)a3;
- (void)setSpotlightScale:(double)a3 interactive:(BOOL)a4;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)setTopOffset:(double)a3;
- (void)setWaitingForKeyboardPresentationForFadeIn:(BOOL)a3;
- (void)setWaitingForSearchContentAvailabilityForFadeIn:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)spotlightMultiplexingViewController:(id)a3 externalKeyboardViewContainsKeyboardDidChange:(BOOL)a4;
- (void)spotlightMultiplexingViewController:(id)a3 searchContentAvailabilityDidChange:(BOOL)a4;
- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBSpotlightPresentableViewController

- (SBSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSpotlightPresentableViewController;
  v6 = [(SBSpotlightPresentableViewController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spotlightMultiplexingViewController, a3);
    v7->_hasUnifiedKeyboardBackground = [MEMORY[0x1E4FA5E28] useUnifiedBackground];
    v7->_supportsSeparateSearchBarBackground = [MEMORY[0x1E4FA5E28] separateHeaderBlurLayeringEnabled];
    v8 = NSString;
    v9 = [(SBSpotlightPresentableViewController *)v7 succinctDescription];
    v10 = [v8 stringWithFormat:@"SpringBoard - Spotlight - %@", v9];

    objc_initWeak(&location, v7);
    id v11 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v15, &location);
    uint64_t v12 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v7->_stateCaptureHandle;
    v7->_stateCaptureHandle = (BSInvalidatable *)v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v7;
}

id __84__SBSpotlightPresentableViewController_initWithSpotlightMultiplexingViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty invalidate];
  [(UIViewFloatAnimatableProperty *)self->_backgroundBlurProperty invalidate];
  [(UIViewFloatAnimatableProperty *)self->_searchContentFadeProperty invalidate];
  [(UIViewFloatAnimatableProperty *)self->_searchAffordanceReferenceBackgroundFadeProperty invalidate];
  [(UIViewFloatAnimatableProperty *)self->_keyboardFadeProperty invalidate];
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightPresentableViewController;
  [(SBSpotlightPresentableViewController *)&v3 dealloc];
}

- (void)invalidateBackgroundView
{
  [(SBSpotlightBackgroundWeighting *)self->_searchBackgroundView spotlightBackgroundWeighting];
  double v4 = v3;
  [(SBSpotlightBackgroundWeighting *)self->_searchBackgroundView removeFromSuperview];
  searchBackgroundView = self->_searchBackgroundView;
  self->_searchBackgroundView = 0;

  [(SBSpotlightPresentableViewController *)self _setUpSearchBackground];
  [(SBSpotlightPresentableViewController *)self _tearDownBackgroundBlurProperty];
  [(SBSpotlightPresentableViewController *)self _createBackgroundBlurProperty];
  [(UIViewFloatAnimatableProperty *)self->_backgroundBlurProperty setValue:v4];
  v6 = self->_searchBackgroundView;
  [(SBSpotlightBackgroundWeighting *)v6 setSpotlightBackgroundWeighting:v4];
}

- (void)invalidateSearchAffordanceView
{
  [(UIView *)self->_searchAffordanceContentContainerView removeFromSuperview];
  searchAffordanceContentContainerView = self->_searchAffordanceContentContainerView;
  self->_searchAffordanceContentContainerView = 0;

  [(SBHSearchAffordance *)self->_searchAffordance removeFromSuperview];
  searchAffordance = self->_searchAffordance;
  self->_searchAffordance = 0;

  [(SBSpotlightPresentableViewController *)self _setUpSearchAffordance];
  if (self->_presentationState == 2)
  {
    id v5 = [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceReferenceView];
    searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
    self->_searchAffordanceReferenceView = v5;

    [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceReferenceFrame];
    self->_searchAffordanceReferenceFrame.origin.x = v7;
    self->_searchAffordanceReferenceFrame.origin.y = v8;
    self->_searchAffordanceReferenceFrame.size.width = v9;
    self->_searchAffordanceReferenceFrame.size.height = v10;
    uint64_t v43 = 0;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double presentationProgress = self->_presentationProgress;
    double presentationOffset = self->_presentationOffset;
    int64_t presentationState = self->_presentationState;
    long long v37 = 0u;
    long long v38 = 0u;
    int64_t previousPresentationState = self->_previousPresentationState;
    long long v35 = 0u;
    long long v36 = 0u;
    int64_t anticipatedPresentationState = self->_anticipatedPresentationState;
    CGSize v33 = (CGSize)0;
    long long v34 = 0u;
    int64_t searchAffordancePresentationState = self->_searchAffordancePresentationState;
    long long v31 = 0u;
    CGSize v32 = (CGSize)0;
    CGSize searchBarSize = self->_hostedContentMetrics.searchBarSize;
    long long v18 = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
    CGSize v19 = searchBarSize;
    CGSize dockedSearchBarSize = self->_hostedContentMetrics.dockedSearchBarSize;
    *(double *)&long long v21 = self->_hostedContentMetrics.searchBarCornerRadius;
    [(SBSpotlightPresentableViewController *)self _presentationMetricsWithProgress:presentationState offset:previousPresentationState velocity:anticipatedPresentationState presentationState:presentationState previousPresentationState:searchAffordancePresentationState anticipatedPresentationState:&v18 searchContentPresentationState:presentationProgress searchAffordancePresentationState:presentationOffset hostedContentMetrics:0.0];
    long long v28 = v41;
    long long v29 = v42;
    uint64_t v30 = v43;
    long long v24 = v37;
    long long v25 = v38;
    long long v26 = v39;
    long long v27 = v40;
    CGSize dockedSearchBarSize = v33;
    long long v21 = v34;
    long long v22 = v35;
    long long v23 = v36;
    long long v18 = v31;
    CGSize v19 = v32;
    [(SBSpotlightPresentableViewController *)self _layoutSearchAffordanceWithMetrics:&v18];
    long long v28 = v41;
    long long v29 = v42;
    uint64_t v30 = v43;
    long long v24 = v37;
    long long v25 = v38;
    long long v26 = v39;
    long long v27 = v40;
    CGSize dockedSearchBarSize = v33;
    long long v21 = v34;
    long long v22 = v35;
    long long v23 = v36;
    long long v18 = v31;
    CGSize v19 = v32;
    [(SBSpotlightPresentableViewController *)self _positionKeyboardAlignedElementsWithMetrics:&v18];
  }
}

- (SBHSearchAffordance)searchAffordanceView
{
  return self->_searchAffordance;
}

- (UIView)scalingContentView
{
  return self->_scaleView;
}

- (void)setSpotlightScale:(double)a3 interactive:(BOOL)a4
{
  BOOL v4 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0) {
    [(SBSpotlightPresentableViewController *)self _setCornerRounded:1];
  }
  if (v4) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 3;
  }
  scaleSettings = self->_scaleSettings;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke;
  v11[3] = &unk_1E6AF4A70;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke_2;
  v9[3] = &unk_1E6AF9080;
  BOOL v10 = v4;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v7, v11, v9);
}

uint64_t __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1048) setValue:*(double *)(a1 + 40)];
}

uint64_t __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _setCornerRounded:0];
  }
  return result;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBSpotlightPresentableViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)SBSpotlightPresentableViewController;
  [(SBSpotlightPresentableViewController *)&v15 viewDidLoad];
  [(SBSpotlightPresentableViewController *)self _createScaleProperty];
  [(SBSpotlightPresentableViewController *)self _createBackgroundBlurProperty];
  [(SBSpotlightPresentableViewController *)self _createSearchContentFadeProperty];
  [(SBSpotlightPresentableViewController *)self _createKeyboardFadeProperty];
  id v3 = [(SBSpotlightPresentableViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v4, v6, v8, v10);
  scaleView = self->_scaleView;
  self->_scaleView = v12;

  [(UIView *)self->_scaleView setAutoresizingMask:18];
  [v3 addSubview:self->_scaleView];
  [(SBSpotlightPresentableViewController *)self _setUpSearchBackground];
  [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setSpotlightDelegate:self];
  [(SBSpotlightPresentableViewController *)self bs_addChildViewController:self->_spotlightMultiplexingViewController withSuperview:self->_scaleView];
  v14 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController view];
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);
  [v14 setAutoresizingMask:18];
  [(SBSpotlightPresentableViewController *)self _setUpSearchAffordance];
  [(SBSpotlightPresentableViewController *)self _setUpHomeAffordance];
  [(SBSpotlightPresentableViewController *)self _setUpSearchAnimationSettings];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    [(SBSpotlightPresentableViewController *)self _setUpSearchBackgroundMatchMoveAnimation];
  }
  else
  {
    id v5 = [(SBSpotlightBackgroundWeighting *)self->_searchBackgroundView layer];
    [v5 removeAnimationForKey:@"SBSearchBackgroundMatchMoveAnimation"];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  searchBackgroundView = self->_searchBackgroundView;
  if (searchBackgroundView)
  {
    double v9 = [(SBSpotlightBackgroundWeighting *)searchBackgroundView layer];
    double v10 = [v9 animationForKey:@"SBSearchBackgroundMatchMoveAnimation"];
    [v9 removeAnimationForKey:@"SBSearchBackgroundMatchMoveAnimation"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v17[3] = &unk_1E6B003A8;
    v17[4] = self;
    *(double *)&v17[5] = width;
    *(double *)&v17[6] = height;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v14[3] = &unk_1E6AF7D20;
    id v15 = v9;
    id v16 = v10;
    id v11 = v10;
    id v12 = v9;
    [v7 animateAlongsideTransition:v17 completion:v14];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1032);
  BSRectWithSize();
  return objc_msgSend(v1, "setFrame:");
}

uint64_t __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"SBSearchBackgroundMatchMoveAnimation"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightPresentableViewController;
  [(SBSpotlightPresentableViewController *)&v4 viewDidAppear:a3];
  [(SBSpotlightPresentableViewController *)self _updateHomeAffordanceInteractionEnablement];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightPresentableViewController;
  [(SBSpotlightPresentableViewController *)&v4 viewDidDisappear:a3];
  [(SBSpotlightPresentableViewController *)self _updateHomeAffordanceInteractionEnablement];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
}

- (void)setSearchTransitionSettings:(id)a3
{
  id v5 = a3;
  if ((-[SBHHomePullToSearchSettings isEqual:](self->_searchTransitionSettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchTransitionSettings, a3);
    [v5 addKeyObserver:self];
    if ([(SBSpotlightPresentableViewController *)self isViewLoaded]) {
      [(SBSpotlightPresentableViewController *)self _setUpSearchAnimationSettings];
    }
  }
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  int64_t presentationState = self->_presentationState;
  if (a6 == 1 && presentationState == 1) {
    goto LABEL_10;
  }
  self->_int64_t previousPresentationState = presentationState;
  if (presentationState == a6) {
    goto LABEL_10;
  }
  self->_int64_t presentationState = a6;
  if (!a6)
  {
    BOOL v11 = 0;
    goto LABEL_9;
  }
  if (!self->_previousPresentationState
    && [(SBSpotlightPresentableViewController *)self _activeTransitionCount] >= 2)
  {
    BOOL v11 = 1;
LABEL_9:
    self->_cancellingDismissAnimation = v11;
  }
LABEL_10:
  self->_double presentationProgress = a3;
  self->_double presentationOffset = a4;
  int64_t v12 = self->_presentationState;
  int64_t previousPresentationState = self->_previousPresentationState;
  [(SBSpotlightPresentableViewController *)self _updatePresentationProgress:v12 withOffset:previousPresentationState velocity:a3 presentationState:a4 previousPresentationState:a5];
}

- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6 previousPresentationState:(int64_t)a7
{
  objc_super v13 = [(SBSpotlightPresentableViewController *)self view];
  searchBackgroundView = self->_searchBackgroundView;
  [v13 bounds];
  -[SBSpotlightBackgroundWeighting setFrame:](searchBackgroundView, "setFrame:");
  int v15 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController isSearchContentAvailable];
  uint64_t v16 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons count];
  self->_searchContentFadeInStartValue = 0.0;
  if (a6 == 2)
  {
    BOOL v17 = (v16 != 0) & ~v15;
    self->_waitingForSearchContentAvailabilityForFadeIn = v17;
    if (v17) {
      int64_t v18 = 2 * (self->_searchBarPortalView != 0);
    }
    else {
      int64_t v18 = 2;
    }
  }
  else
  {
    self->_waitingForSearchContentAvailabilityForFadeIn = 0;
    int64_t v18 = a6;
  }
  BOOL v19 = self->_outstandingAnimationCount != 0;
  int64_t searchAffordancePresentationState = self->_searchAffordancePresentationState;
  int64_t v21 = [(SBSpotlightPresentableViewController *)self _searchAffordancePresentationStateWithOffset:a6 presentationState:searchAffordancePresentationState previousSearchAffordancePresentationState:a4];
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  CGSize v62 = (CGSize)0;
  long long v63 = 0u;
  int64_t anticipatedPresentationState = self->_anticipatedPresentationState;
  long long v60 = 0u;
  CGSize v61 = (CGSize)0;
  CGSize searchBarSize = self->_hostedContentMetrics.searchBarSize;
  long long v47 = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
  CGSize v48 = searchBarSize;
  CGSize dockedSearchBarSize = self->_hostedContentMetrics.dockedSearchBarSize;
  *(double *)&long long v50 = self->_hostedContentMetrics.searchBarCornerRadius;
  [(SBSpotlightPresentableViewController *)self _presentationMetricsWithProgress:a6 offset:a7 velocity:anticipatedPresentationState presentationState:v18 previousPresentationState:v21 anticipatedPresentationState:&v47 searchContentPresentationState:a3 searchAffordancePresentationState:a4 hostedContentMetrics:a5];
  int v24 = v18 == 1 && v19;
  if (v18 == 1 && v21 != searchAffordancePresentationState && v21 != 1)
  {
    int v24 = 1;
    uint64_t v25 = 3;
LABEL_19:
    long long v29 = v13;
    goto LABEL_22;
  }
  char v26 = v24 ^ 1;
  if (v21 != 2) {
    char v26 = 1;
  }
  if (v26)
  {
    uint64_t v25 = 4;
    goto LABEL_19;
  }
  long long v27 = [(UIView *)self->_keyboardView layer];
  long long v28 = [v27 presentationLayer];

  if (v28)
  {
    [v28 position];
    int v24 = BSFloatGreaterThanOrEqualToFloat() ^ 1;
  }
  else
  {
    int v24 = 1;
  }
  long long v29 = v13;

  uint64_t v25 = 4;
LABEL_22:
  long long v57 = v70;
  long long v58 = v71;
  uint64_t v59 = v72;
  long long v53 = v66;
  long long v54 = v67;
  long long v55 = v68;
  long long v56 = v69;
  CGSize dockedSearchBarSize = v62;
  long long v50 = v63;
  long long v51 = v64;
  long long v52 = v65;
  long long v47 = v60;
  CGSize v48 = v61;
  [(SBSpotlightPresentableViewController *)self _layoutSearchContentWithMetrics:&v47];
  self->_int64_t searchAffordancePresentationState = v21;
  self->_keyboardFadeInStartValue = 0.0;
  if (self->_searchAffordancePresentationState == 2) {
    BOOL v30 = ![(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController externalKeyboardViewContainsKeyboard];
  }
  else {
    BOOL v30 = 0;
  }
  self->_waitingForKeyboardPresentationForFadeIn = v30;
  if (v24)
  {
    ++self->_outstandingAnimationCount;
    searchAnimationSettings = self->_searchAnimationSettings;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    long long v43 = v69;
    long long v44 = v70;
    long long v45 = v71;
    long long v39 = v65;
    long long v40 = v66;
    long long v41 = v67;
    long long v42 = v68;
    CGSize v35 = v61;
    CGSize v36 = v62;
    long long v37 = v63;
    long long v38 = v64;
    v33[2] = __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke;
    v33[3] = &unk_1E6B0B668;
    v33[4] = self;
    uint64_t v46 = v72;
    long long v34 = v60;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke_2;
    v32[3] = &unk_1E6AFA1B8;
    v32[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, v25, v33, v32);
  }
  else
  {
    long long v57 = v70;
    long long v58 = v71;
    uint64_t v59 = v72;
    long long v53 = v66;
    long long v54 = v67;
    long long v55 = v68;
    long long v56 = v69;
    CGSize dockedSearchBarSize = v62;
    long long v50 = v63;
    long long v51 = v64;
    long long v52 = v65;
    long long v47 = v60;
    CGSize v48 = v61;
    [(SBSpotlightPresentableViewController *)self _layoutSearchAffordanceWithMetrics:&v47];
    long long v57 = v70;
    long long v58 = v71;
    uint64_t v59 = v72;
    long long v53 = v66;
    long long v54 = v67;
    long long v55 = v68;
    long long v56 = v69;
    CGSize dockedSearchBarSize = v62;
    long long v50 = v63;
    long long v51 = v64;
    long long v52 = v65;
    long long v47 = v60;
    CGSize v48 = v61;
    [(SBSpotlightPresentableViewController *)self _positionKeyboardAlignedElementsWithMetrics:&v47];
  }
}

uint64_t __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 184);
  long long v4 = *(_OWORD *)(a1 + 216);
  long long v27 = *(_OWORD *)(a1 + 200);
  long long v28 = v4;
  uint64_t v29 = *(void *)(a1 + 232);
  long long v5 = *(_OWORD *)(a1 + 120);
  long long v6 = *(_OWORD *)(a1 + 152);
  long long v23 = *(_OWORD *)(a1 + 136);
  long long v24 = v6;
  long long v25 = *(_OWORD *)(a1 + 168);
  long long v26 = v3;
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 72);
  long long v20 = v8;
  long long v21 = *(_OWORD *)(a1 + 104);
  long long v22 = v5;
  long long v17 = *(_OWORD *)(a1 + 40);
  long long v18 = v7;
  [v2 _layoutSearchAffordanceWithMetrics:&v17];
  double v9 = *(void **)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 184);
  long long v11 = *(_OWORD *)(a1 + 216);
  long long v27 = *(_OWORD *)(a1 + 200);
  long long v28 = v11;
  uint64_t v29 = *(void *)(a1 + 232);
  long long v12 = *(_OWORD *)(a1 + 120);
  long long v13 = *(_OWORD *)(a1 + 152);
  long long v23 = *(_OWORD *)(a1 + 136);
  long long v24 = v13;
  long long v25 = *(_OWORD *)(a1 + 168);
  long long v26 = v10;
  long long v14 = *(_OWORD *)(a1 + 56);
  long long v15 = *(_OWORD *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 72);
  long long v20 = v15;
  long long v21 = *(_OWORD *)(a1 + 104);
  long long v22 = v12;
  long long v17 = *(_OWORD *)(a1 + 40);
  long long v18 = v14;
  return [v9 _positionKeyboardAlignedElementsWithMetrics:&v17];
}

uint64_t __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)setTargetDisplayConfiguration:(id)a3
{
}

- (void)_layoutWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  long long v5 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  long long v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  long long v34 = v5;
  double keyboardVelocity = a3->keyboardVelocity;
  long long v6 = *(_OWORD *)&a3->fullSearchBarSize.height;
  long long v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  long long v30 = v6;
  long long v7 = *(_OWORD *)&a3->keyboardAlpha;
  CGPoint keyboardCenter = a3->keyboardCenter;
  long long v32 = v7;
  long long v8 = *(_OWORD *)&a3->searchAffordanceSize.height;
  long long v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  long long v26 = v8;
  long long v9 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  long long v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  long long v28 = v9;
  long long v10 = *(_OWORD *)&a3->searchContentCenter.y;
  long long v23 = *(_OWORD *)&a3->backgroundWeighting;
  long long v24 = v10;
  [(SBSpotlightPresentableViewController *)self _layoutSearchContentWithMetrics:&v23];
  long long v11 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  long long v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  long long v34 = v11;
  double keyboardVelocity = a3->keyboardVelocity;
  long long v12 = *(_OWORD *)&a3->fullSearchBarSize.height;
  long long v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  long long v30 = v12;
  long long v13 = *(_OWORD *)&a3->keyboardAlpha;
  CGPoint keyboardCenter = a3->keyboardCenter;
  long long v32 = v13;
  long long v14 = *(_OWORD *)&a3->searchAffordanceSize.height;
  long long v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  long long v26 = v14;
  long long v15 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  long long v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  long long v28 = v15;
  long long v16 = *(_OWORD *)&a3->searchContentCenter.y;
  long long v23 = *(_OWORD *)&a3->backgroundWeighting;
  long long v24 = v16;
  [(SBSpotlightPresentableViewController *)self _layoutSearchAffordanceWithMetrics:&v23];
  long long v17 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  long long v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  long long v34 = v17;
  double keyboardVelocity = a3->keyboardVelocity;
  long long v18 = *(_OWORD *)&a3->fullSearchBarSize.height;
  long long v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  long long v30 = v18;
  long long v19 = *(_OWORD *)&a3->keyboardAlpha;
  CGPoint keyboardCenter = a3->keyboardCenter;
  long long v32 = v19;
  long long v20 = *(_OWORD *)&a3->searchAffordanceSize.height;
  long long v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  long long v26 = v20;
  long long v21 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  long long v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  long long v28 = v21;
  long long v22 = *(_OWORD *)&a3->searchContentCenter.y;
  long long v23 = *(_OWORD *)&a3->backgroundWeighting;
  long long v24 = v22;
  [(SBSpotlightPresentableViewController *)self _positionKeyboardAlignedElementsWithMetrics:&v23];
}

- (void)_layoutSearchContentWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  id v6 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController view];
  objc_msgSend(v6, "setCenter:", a3->searchContentCenter.x, a3->searchContentCenter.y);
  if ((BSFloatIsZero() & 1) == 0)
  {
    long long v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, a3->searchContentVelocity);
    [v6 _setVelocity:v5 forKey:@"position"];
  }
  [(UIViewFloatAnimatableProperty *)self->_backgroundBlurProperty setValue:a3->backgroundWeighting];
  [(UIViewFloatAnimatableProperty *)self->_searchContentFadeProperty setValue:a3->searchContentAlpha];
}

- (void)_layoutSearchAffordanceWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  BSRectWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  [(UIViewFloatAnimatableProperty *)self->_searchAffordanceReferenceBackgroundFadeProperty setValue:a3->searchAffordanceBackgroundAlpha];
  -[UIView setBounds:](self->_searchAffordanceContentContainerView, "setBounds:", v6, v8, v10, v12);
  [(SBHSearchAffordance *)self->_searchAffordance setSearchAffordanceContentAlignment:a3->searchAffordanceContentAlignment];
  [(SBHSearchAffordance *)self->_searchAffordance setAppliesSearchAffordanceCornerRadius:1];
  [(SBHSearchAffordance *)self->_searchAffordance setSearchAffordanceCornerRadius:a3->searchAffordanceCornerRadius];
  -[SBHSearchAffordance setBounds:](self->_searchAffordance, "setBounds:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_searchAffordanceReferenceBackgroundView, "setFrame:", v6, v8, v10, v12);
  [(UIView *)self->_searchAffordanceReferenceBackgroundView _setContinuousCornerRadius:a3->searchAffordanceCornerRadius];
  [(SBHSearchAffordance *)self->_searchAffordance layoutIfNeeded];
  [(SBHSearchAffordance *)self->_searchAffordance setAlpha:a3->searchAffordanceAlpha];
  if (!searchAffordanceReferenceView || !self->_supportsSeparateSearchBarBackground) {
    [(UIView *)self->_searchAffordanceContentContainerView setAlpha:a3->searchAffordanceAlpha];
  }
  -[UIView setBounds:](self->_searchAffordanceBackgroundCapturingView, "setBounds:", v6, v8, v10, v12);
  -[UIView setBounds:](self->_searchBarPortalClippingContainerView, "setBounds:", v6, v8, v10, v12);
  [(UIView *)self->_searchBarPortalClippingContainerView _setContinuousCornerRadius:a3->searchAffordanceCornerRadius];
  double v14 = v10 / a3->fullSearchBarSize.width;
  double v15 = v12 / a3->fullSearchBarSize.height;
  if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
  {
    int v16 = 1128;
    searchBarPortalView = self->_searchBarPortalView;
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v25 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.c = v24;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v28.tx = v23;
    [(_UIPortalView *)searchBarPortalView setTransform:&v28];
    if (self->_supportsSeparateSearchBarBackground)
    {
      searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
      *(_OWORD *)&v28.a = v25;
      *(_OWORD *)&v28.c = v24;
      *(_OWORD *)&v28.tx = v23;
      [(_UIPortalView *)searchBarBackgroundPortalView setTransform:&v28];
    }
  }
  else
  {
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, v14, v15);
    if (self->_supportsSeparateSearchBarBackground)
    {
      long long v19 = self->_searchBarBackgroundPortalView;
      CGAffineTransform v27 = v28;
      [(_UIPortalView *)v19 setTransform:&v27];
      memset(&v27.c, 0, 32);
      if (v14 <= v15) {
        CGFloat v20 = v14;
      }
      else {
        CGFloat v20 = v15;
      }
      *(_OWORD *)&v27.a = 0uLL;
      CGAffineTransformMakeScale(&v27, v20, v20);
      int v16 = 1128;
      long long v21 = self->_searchBarPortalView;
      CGAffineTransform v26 = v27;
      long long v22 = &v26;
    }
    else
    {
      int v16 = 1128;
      long long v21 = self->_searchBarPortalView;
      CGAffineTransform v27 = v28;
      long long v22 = &v27;
    }
    [(_UIPortalView *)v21 setTransform:v22];
  }
  UIRectGetCenter();
  if (self->_supportsSeparateSearchBarBackground) {
    int v16 = 1136;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v16), "setCenter:");
  if (searchAffordanceReferenceView) {
    [(UIView *)self->_searchBarPortalClippingContainerView setAlpha:a3->searchBarAlpha];
  }
}

- (void)_positionKeyboardAlignedElementsWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.backgroundWeighting = *(_OWORD *)&a3->backgroundWeighting;
  long long v5 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  long long v7 = *(_OWORD *)&a3->searchContentCenter.y;
  long long v6 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceSize.double height = *(_OWORD *)&a3->searchAffordanceSize.height;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCenter.y = v5;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchContentCenter.y = v7;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceBackgroundAlpha = v6;
  CGPoint keyboardCenter = a3->keyboardCenter;
  long long v10 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  long long v9 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.fullSearchBarSize.double height = *(_OWORD *)&a3->fullSearchBarSize.height;
  self->_appliedKeyboardAlignedElementsMetrics.CGPoint keyboardCenter = keyboardCenter;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceContentAlignment = v10;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCornerRadius = v9;
  long long v12 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  long long v11 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  long long v13 = *(_OWORD *)&a3->keyboardAlpha;
  self->_appliedKeyboardAlignedElementsMetrics.double keyboardVelocity = a3->keyboardVelocity;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardProtectorCenter.y = v12;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.homeAffordanceCenter.y = v11;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardAlpha = v13;
  if (BSFloatIsZero())
  {
    double v14 = 0;
  }
  else
  {
    double v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, a3->keyboardVelocity);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__SBSpotlightPresentableViewController__positionKeyboardAlignedElementsWithMetrics___block_invoke;
  v17[3] = &unk_1E6B0B690;
  id v15 = v14;
  id v18 = v15;
  int v16 = (void (**)(void, void))MEMORY[0x1D948C7A0](v17);
  -[SBHSearchAffordance setCenter:](self->_searchAffordance, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(void, SBHSearchAffordance *))v16)[2](v16, self->_searchAffordance);
  -[UIView setCenter:](self->_searchAffordanceContentContainerView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(void, UIView *))v16)[2](v16, self->_searchAffordanceContentContainerView);
  -[UIView setCenter:](self->_searchAffordanceBackgroundCapturingView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(void, UIView *))v16)[2](v16, self->_searchAffordanceBackgroundCapturingView);
  -[UIView setCenter:](self->_searchBarPortalClippingContainerView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(void, UIView *))v16)[2](v16, self->_searchBarPortalClippingContainerView);
  if (self->_supportsSeparateSearchBarBackground)
  {
    -[_UIPortalView setCenter:](self->_searchBarPortalView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
    ((void (**)(void, _UIPortalView *))v16)[2](v16, self->_searchBarPortalView);
  }
  [(UIViewFloatAnimatableProperty *)self->_keyboardFadeProperty setValue:a3->keyboardAlpha];
  -[UIView setCenter:](self->_keyboardView, "setCenter:", a3->keyboardCenter.x, a3->keyboardCenter.y);
  ((void (**)(void, UIView *))v16)[2](v16, self->_keyboardView);
  -[_UIPortalView setCenter:](self->_keyboardProtectorPortalView, "setCenter:", a3->keyboardProtectorCenter.x, a3->keyboardProtectorCenter.y);
  ((void (**)(void, _UIPortalView *))v16)[2](v16, self->_keyboardProtectorPortalView);
  -[SBHomeGrabberView setCenter:](self->_homeAffordance, "setCenter:", a3->homeAffordanceCenter.x, a3->homeAffordanceCenter.y);
  ((void (**)(void, SBHomeGrabberView *))v16)[2](v16, self->_homeAffordance);
}

uint64_t __84__SBSpotlightPresentableViewController__positionKeyboardAlignedElementsWithMetrics___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [a2 _setVelocity:v2 forKey:@"position"];
  }
  return result;
}

- (int64_t)_searchAffordancePresentationStateWithOffset:(double)a3 presentationState:(int64_t)a4 previousSearchAffordancePresentationState:(int64_t)a5
{
  uint64_t v8 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons count];
  searchBarPortalView = self->_searchBarPortalView;
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  if (a4 == 2)
  {
    if (v8) {
      BOOL v17 = searchBarPortalView == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17) {
      return searchAffordanceReferenceView != 0;
    }
    else {
      return 2;
    }
  }
  else if (a4 == 1)
  {
    long long v11 = &OBJC_IVAR___SBSpotlightPresentableViewController__allowsKeyboardWhileInteractive;
    if (!searchAffordanceReferenceView) {
      long long v11 = &OBJC_IVAR___SBSpotlightPresentableViewController__allowsKeyboardWhileInteractiveWithoutSearchAffordance;
    }
    uint64_t v12 = *v11;
    int v13 = *((unsigned __int8 *)&self->super.super.super.isa + v12);
    if (*((unsigned char *)&self->super.super.super.isa + v12)) {
      BOOL v14 = searchBarPortalView == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      int v15 = 1;
      int64_t v16 = 1;
    }
    else
    {
      char v18 = BSFloatLessThanOrEqualToFloat();
      if (a5 == 2 && (v18 & 1) != 0)
      {
        int v15 = 0;
        int64_t v16 = 0;
      }
      else
      {
        int v19 = BSFloatGreaterThanOrEqualToFloat();
        if (a5 == 2) {
          int v20 = 1;
        }
        else {
          int v20 = v19;
        }
        int v15 = v20 ^ 1;
        BOOL v14 = v20 == 0;
        int64_t v16 = 1;
        if (!v14) {
          int64_t v16 = 2;
        }
      }
    }
    if (searchAffordanceReferenceView) {
      int v15 = 0;
    }
    if (!v13) {
      int v15 = 1;
    }
    if (v15) {
      return 0;
    }
    else {
      return v16;
    }
  }
  return a4;
}

- (SBSpotlightPresentationMetrics)_presentationMetricsWithProgress:(SEL)a3 offset:(double)a4 velocity:(double)a5 presentationState:(double)a6 previousPresentationState:(int64_t)a7 anticipatedPresentationState:(int64_t)a8 searchContentPresentationState:(int64_t)a9 searchAffordancePresentationState:(int64_t)a10 hostedContentMetrics:(int64_t)a11
{
  int64_t v15 = a8;
  int64_t v16 = a7;
  char v18 = self;
  retstr->double keyboardVelocity = 0.0;
  *(_OWORD *)&retstr->keyboardProtectorCenter.y = 0u;
  *(_OWORD *)&retstr->homeAffordanceCenter.y = 0u;
  retstr->CGPoint keyboardCenter = 0u;
  *(_OWORD *)&retstr->keyboardAlpha = 0u;
  *(_OWORD *)&retstr->searchAffordanceCornerRadius = 0u;
  *(_OWORD *)&retstr->fullSearchBarSize.CGFloat height = 0u;
  *(_OWORD *)&retstr->searchAffordanceCenter.y = 0u;
  *(_OWORD *)&retstr->searchAffordanceContentAlignment = 0u;
  *(_OWORD *)&retstr->searchAffordanceBackgroundAlpha = 0u;
  *(_OWORD *)&retstr->searchAffordanceSize.CGFloat height = 0u;
  *(_OWORD *)&retstr->backgroundWeighting = 0u;
  *(_OWORD *)&retstr->searchContentCenter.y = 0u;
  int v20 = [(SBSpotlightPresentableViewController *)self view];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  UIRectGetCenter();
  CGFloat v30 = v29;
  double v32 = v31;
  [(SBSpotlightPresentableViewController *)v18 topOffset];
  searchAffordanceReferenceBackgroundView = v18->_searchAffordanceReferenceBackgroundView;
  double v35 = 0.0;
  double v36 = 1.0;
  if (searchAffordanceReferenceBackgroundView) {
    double v36 = 0.0;
  }
  if (v16)
  {
    if (v16 == 2)
    {
      double v36 = 1.0;
      double v35 = 1.0;
      double v37 = 1.0;
      double v38 = v32;
    }
    else
    {
      double v37 = 0.0;
      double v38 = v32;
      if (v16 == 1)
      {
        double v38 = v32 + v33 + a5;
        double v36 = 1.0;
        double v37 = fmin(fmax(a5 / v18->_backgroundInteractiveBlurDistance + 0.0, 0.0), 1.0);
        double v35 = fmin(fmax(a5 / v18->_searchContentInteractiveFadeInDistance + 0.0, 0.0), 1.0);
        if (searchAffordanceReferenceBackgroundView) {
          double v36 = fmin(fmax(a5 / v18->_searchAffordanceBackgroundMaterialInteractiveFadeDistance + 0.0, 0.0), 1.0);
        }
      }
    }
  }
  else
  {
    double v38 = v32 + v33;
    double v37 = 0.0;
  }
  double v120 = a5;
  retstr->backgroundWeighting = v37;
  retstr->searchContentCenter.x = v30;
  retstr->searchContentCenter.y = v38;
  retstr->searchContentAlpha = v35;
  retstr->searchAffordanceBackgroundAlpha = v36;
  CGFloat width = a12->searchBarSize.width;
  CGFloat height = a12->searchBarSize.height;
  double v130 = height;
  double v131 = width;
  double searchBarCornerRadius = a12->searchBarCornerRadius;
  searchAffordanceReferenceView = v18->_searchAffordanceReferenceView;
  UIRectGetCenter();
  CGFloat v127 = v41;
  double v129 = v42;
  if (searchAffordanceReferenceView)
  {
    *(CGSize *)v136 = v18->_searchAffordanceReferenceFrame.size;
    double v43 = v136[1];
  }
  else
  {
    v136[0] = width;
    v136[1] = height;
    double v43 = height;
  }
  double v44 = v43 * 0.5;
  double v135 = v43 * 0.5;
  [MEMORY[0x1E4FA5E28] bottomPaddingToKeyboard];
  double v123 = v45;
  BOOL v46 = a9 == 0;
  int v47 = [(id)SBApp isHardwareKeyboardAttached];
  BOOL v48 = [(SBSpotlightMultiplexingViewController *)v18->_spotlightMultiplexingViewController externalKeyboardViewContainsKeyboard];
  CGFloat v128 = v30;
  double v114 = v26;
  double v115 = v22;
  double v119 = v24;
  if (a9)
  {
    char v49 = !v18->_cancellingDismissAnimation || v48;
    if ((v49 & 1) == 0) {
      goto LABEL_18;
    }
  }
  else if (!v48)
  {
LABEL_18:
    int v47 = 1;
  }
  double v50 = v28;
  double keyboardHeight = a12->keyboardHeight;
  double keyboardProtectorHeight = a12->keyboardProtectorHeight;
  double v53 = v32 + a12->keyboardHeight;
  double v54 = 0.0;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    long long v55 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    [v55 safeAreaInsetsPortrait];
    v113 = a12;
    long long v56 = v18;
    BOOL v57 = v46;
    int64_t v58 = v16;
    int64_t v59 = v15;
    int v60 = v47;
    int64_t v61 = a11;
    v63 = CGSize v62 = v20;
    [v63 bottomInset];
    double v54 = v64;

    int v20 = v62;
    a11 = v61;
    int v47 = v60;
    int64_t v15 = v59;
    int64_t v16 = v58;
    BOOL v46 = v57;
    char v18 = v56;
    a12 = v113;
  }
  double v65 = v53 - v50;
  double v66 = 1.0;
  double v126 = v50;
  if (!a11)
  {
    if (searchAffordanceReferenceView)
    {
      double v71 = 0.0;
      double v70 = 1.0;
      if (v16 == 1)
      {
        double v134 = 0.0;
        -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](v18, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", 1, 0, 0, &v134, v136, &v135, v136[0], v43, v120, 1.0);
        double v71 = 0.0;
        double v65 = v53 - v50;
        double v70 = 1.0;
        double v66 = 1.0;
        double v69 = v129 + v134;
      }
      else
      {
        double v69 = v129;
      }
    }
    else
    {
      double v70 = 0.0;
      if (v15 == 2) {
        double v71 = 0.0;
      }
      else {
        double v71 = 1.0;
      }
      v136[0] = v131;
      v136[1] = v130;
      double v135 = searchBarCornerRadius;
      double v44 = v130 * 0.5;
      double v69 = v50 + v130 * 0.5;
    }
    double v53 = v123 + v65 + v69 + v44;
    BOOL v46 = 1;
    CGFloat v67 = v131;
    goto LABEL_60;
  }
  if (a11 != 2)
  {
    CGFloat v67 = v131;
    if (a11 == 1)
    {
      double v68 = v53 - v50;
      uint64_t v133 = 0x3FF0000000000000;
      double v134 = 1.0;
      double v132 = 0.0;
      -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](v18, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", v16, &v134, &v133, &v132, v136, &v135, v136[0], v43, v120);
      double v69 = v129 + v132;
      double v66 = 1.0;
      double v70 = 1.0;
      double v71 = 0.0;
      if (!searchAffordanceReferenceView) {
        double v70 = fmin(fmax(a4 / v18->_searchAffordanceTransientFadeInThreshold + 0.0, 0.0), 1.0);
      }
      double v65 = v68;
      double v53 = v68 + v69 + v136[1] * 0.5;
      BOOL v46 = 1;
    }
    else
    {
      BOOL v46 = 1;
      double v70 = 1.0;
      double v69 = v129;
      double v71 = 0.0;
    }
    goto LABEL_60;
  }
  CGFloat v67 = v131;
  if (v47)
  {
    double v69 = v50 - (v123 + v54) + a12->dockedSearchBarSize.height * -0.5;
    *(CGSize *)v136 = a12->dockedSearchBarSize;
    goto LABEL_46;
  }
  double v72 = v136[0];
  v136[0] = v131;
  v136[1] = v130;
  if (v16 != 1 || !v18->_keyboardFollowsSpotlightContent)
  {
    double v69 = v50 - keyboardHeight + v130 * -0.5 - v123;
    double v53 = v32;
LABEL_46:
    double v135 = searchBarCornerRadius;
    if (searchAffordanceReferenceView) {
      goto LABEL_47;
    }
LABEL_58:
    double v66 = 1.0;
    double v70 = 0.0;
LABEL_59:
    double v71 = 1.0;
    goto LABEL_60;
  }
  if (!searchAffordanceReferenceView)
  {
    double v69 = v50 - keyboardHeight + v130 * -0.5 - v123 + v120;
    double v53 = v32 + v120;
    double v135 = searchBarCornerRadius;
    goto LABEL_58;
  }
  double v134 = 0.0;
  -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](v18, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", 1, 0, 0, &v134, 0, 0, v72, v43, v18->_interactiveKeyboardPresentationThreshold);
  double v65 = v53 - v50;
  double v73 = v129 + v134 + v18->_interactiveKeyboardPresentationOffset;
  double v74 = v123 + v53 - v50 + v73 + v136[1] * 0.5;
  double v75 = v120 - v18->_interactiveKeyboardPresentationThreshold;
  double v69 = v73 + v75;
  double v53 = v75 + v74;
  double v135 = searchBarCornerRadius;
LABEL_47:
  double v66 = 1.0;
  double v70 = 0.0;
  if (!v18->_supportsSeparateSearchBarBackground || !v18->_scalesSearchAffordanceContentWhileFading) {
    goto LABEL_59;
  }
  double v76 = v65;
  double v77 = keyboardProtectorHeight;
  double v78 = v18->_searchAffordanceContentFadeRange.end - v18->_searchBarContentFadeRange.start;
  if (BSFloatGreaterThanFloat())
  {
    double v79 = v78 * 0.5 + v18->_searchBarContentFadeRange.start;
    double v80 = v136[1] / v130;
    if (v136[1] / v130 > v136[0] / v131) {
      double v80 = v136[0] / v131;
    }
    double v71 = 1.0;
    double v81 = v130 * (v80 + v79 * (1.0 - v80)) / v136[1];
    double v82 = v130 / v136[1];
    if (v130 / v136[1] > v131 / v136[0]) {
      double v82 = v131 / v136[0];
    }
    double v66 = v81
        * (1.0
         / (v79 * (v82 + -1.0) + 1.0))
        * ((v18->_searchAffordanceContentFadeRange.end - v18->_searchAffordanceContentFadeRange.start)
         / v79);
    double keyboardProtectorHeight = v77;
  }
  else
  {
    double v71 = 1.0;
    double keyboardProtectorHeight = v77;
    double v66 = 1.0;
  }
  double v70 = 0.0;
  double v65 = v76;
LABEL_60:
  if (v18->_hasUnifiedKeyboardBackground) {
    double v83 = v126 * 0.5 - keyboardProtectorHeight * 0.5 + v53;
  }
  else {
    double v83 = v53 - (v65 + keyboardProtectorHeight * 0.5);
  }
  BOOL v86 = v16 != 2 || v15 == 2 || !v18->_allowsVelocityInjection;
  if (v15 != 1 && !v86)
  {
    if (!v18->_injectsVelocityForNonInteractiveTransitions)
    {
      double injectedVelocityForNonInteractiveTransitions = 0.0;
      double v88 = 0.0;
      goto LABEL_91;
    }
    goto LABEL_86;
  }
  char v89 = v15 != 1 || v86;
  if ((v89 & 1) == 0 && v18->_injectsVelocityOnlyForShortSwipes)
  {
    double v90 = v66;
    double v91 = v70;
    double v92 = v83;
    double v93 = v71;
    v94 = [(SBSpotlightMultiplexingViewController *)v18->_spotlightMultiplexingViewController view];
    uint64_t v95 = [v94 _velocityForKey:@"position"];
    [(id)v95 CGPointValue];

    LOBYTE(v95) = BSFloatGreaterThanOrEqualToFloat();
    double v71 = v93;
    double v83 = v92;
    double v70 = v91;
    double v66 = v90;
    double injectedVelocityForNonInteractiveTransitions = 0.0;
    double v88 = 0.0;
    if (v95) {
      goto LABEL_91;
    }
LABEL_85:
    double injectedVelocityForNonInteractiveTransitions = v18->_injectedPercentageOfGestureVelocity * a6;
    goto LABEL_87;
  }
  double injectedVelocityForNonInteractiveTransitions = 0.0;
  double v88 = 0.0;
  if (v86) {
    goto LABEL_91;
  }
  if (v15 == 1) {
    goto LABEL_85;
  }
LABEL_86:
  double injectedVelocityForNonInteractiveTransitions = v18->_injectedVelocityForNonInteractiveTransitions;
LABEL_87:
  double v88 = 0.0;
  if (a11 == 2)
  {
    v96 = &OBJC_IVAR___SBSpotlightPresentableViewController__keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
    if (v15 == 1) {
      v96 = &OBJC_IVAR___SBSpotlightPresentableViewController__keyboardInjectedVelocityPercentage;
    }
    double v88 = injectedVelocityForNonInteractiveTransitions * *(double *)((char *)&v18->super.super.super.isa + *v96);
  }
LABEL_91:
  double v97 = v53;
  if (v47)
  {
    double v125 = v66;
    double v98 = v70;
    double v99 = v83;
    double v100 = v69;
    double v101 = v67;
    double v102 = v71;
    v103 = [(SBSpotlightPresentableViewController *)v18 spotlightMultiplexingViewController];
    uint64_t v104 = [v103 level];

    double v71 = v102;
    CGFloat v67 = v101;
    double v69 = v100;
    double v83 = v99;
    double v70 = v98;
    double v66 = v125;
    double v97 = v53;
    if (!v104)
    {
      double v105 = v71;
      [(SBHomeGrabberView *)v18->_homeAffordance bounds];
      double v121 = v106 + v107;
      -[SBHomeGrabberView grabberFrameForBounds:](v18->_homeAffordance, "grabberFrameForBounds:", v115, v119, v114, v126);
      double v122 = v121 - v108;
      double v109 = v105;
      double v69 = v100;
      UIRectGetCenter();
      double v71 = v109;
      CGFloat v67 = v131;
      double v83 = v99;
      double v70 = v98;
      double v66 = v125;
      double v97 = v110 + (1.0 - a4) * v122;
    }
  }
  retstr->searchAffordanceSize = *(CGSize *)v136;
  retstr->searchAffordanceCenter.x = v127;
  retstr->searchAffordanceCenter.y = v69;
  retstr->searchAffordanceAlpha = v70;
  retstr->searchAffordanceContentAlignment = v46;
  double v111 = v135;
  retstr->searchAffordanceContentScale = v66;
  retstr->searchAffordanceCornerRadius = v111;
  retstr->fullSearchBarSize.CGFloat width = v67;
  retstr->fullSearchBarSize.CGFloat height = v130;
  retstr->searchBarAlpha = v71;
  retstr->keyboardCenter.x = v128;
  retstr->keyboardCenter.y = v53;
  retstr->keyboardAlpha = v71;
  retstr->keyboardProtectorCenter.x = v128;
  retstr->keyboardProtectorCenter.y = v83;
  retstr->homeAffordanceCenter.x = v128;
  retstr->homeAffordanceCenter.y = v97;
  retstr->searchContentVelocity = injectedVelocityForNonInteractiveTransitions;
  retstr->double keyboardVelocity = v88;

  return result;
}

- (void)_getSearchAffordanceMetricsForDefaultSize:(CGSize)a3 presentationState:(int64_t)a4 presentationOffset:(double)a5 scaleX:(double *)a6 scaleY:(double *)a7 offset:(double *)a8 size:(CGSize *)a9 cornerRadius:(double *)a10
{
  double height = a3.height;
  CGFloat width = a3.width;
  double searchAffordanceMaxScaleX = self->_searchAffordanceMaxScaleX;
  uint64_t v38 = 0x3FF0000000000000;
  double v40 = searchAffordanceMaxScaleX;
  uint64_t v39 = 1;
  uint64_t v41 = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  CGFloat v21 = v20;
  if (a6) {
    *a6 = v20;
  }
  double searchAffordanceMaxScaleY = self->_searchAffordanceMaxScaleY;
  uint64_t v34 = 0x3FF0000000000000;
  double v36 = searchAffordanceMaxScaleY;
  uint64_t v35 = 1;
  uint64_t v37 = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  CGFloat v24 = v23;
  if (a7) {
    *a7 = v23;
  }
  uint64_t v25 = 0;
  if (a4 != 2)
  {
    double searchAffordanceMaxOffset = self->_searchAffordanceMaxOffset;
    long long v31 = 0u;
    double v32 = searchAffordanceMaxOffset;
    BYTE8(v31) = 1;
    uint64_t v33 = 1;
    BSUIConstrainValueToIntervalWithRubberBand();
  }
  if (a8) {
    *(void *)a8 = v25;
  }
  if (!BSFloatEqualToFloat() || (BSFloatEqualToFloat() & 1) == 0)
  {
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, v21, v24);
    double v27 = [(SBSpotlightPresentableViewController *)self view];
    UISizeRoundToViewScale();
    CGFloat width = v28;
    double height = v29;
  }
  if (a9)
  {
    a9->CGFloat width = width;
    a9->double height = height;
  }
  if (a10) {
    *a10 = height * 0.5;
  }
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  BOOL v6 = a4;
  self->_int64_t anticipatedPresentationState = a3;
  if (self->_presentationState != 2)
  {
    long long v9 = [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceReferenceView];
    searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
    self->_searchAffordanceReferenceView = v9;

    [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceReferenceFrame];
    self->_searchAffordanceReferenceFrame.origin.x = v11;
    self->_searchAffordanceReferenceFrame.origin.y = v12;
    self->_searchAffordanceReferenceFrame.size.CGFloat width = v13;
    self->_searchAffordanceReferenceFrame.size.double height = v14;
  }
  if (a3)
  {
    int64_t v15 = NSString;
    int64_t v16 = [MEMORY[0x1E4F29128] UUID];
    BOOL v17 = [v16 UUIDString];
    if (a3 == 2) {
      [v15 stringWithFormat:@"AnimatedPresentation-%@", v17];
    }
    else {
      [v15 stringWithFormat:@"InteractivePresentation-%@", v17];
    }
  }
  else
  {
    char v18 = NSString;
    int64_t v16 = [MEMORY[0x1E4F29128] UUID];
    BOOL v17 = [v16 UUIDString];
    [v18 stringWithFormat:@"AnimatedDismissal-%@", v17];
  int v19 = };

  if (v19) {
    BOOL v20 = v6;
  }
  else {
    BOOL v20 = 0;
  }
  int64_t presentationState = self->_presentationState;
  if (a3) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v6;
  }
  searchBarPortalView = self->_searchBarPortalView;
  BOOL v24 = presentationState == 2;
  BOOL v25 = presentationState == 2 && a3 == 0;
  BOOL v26 = v24 && v22;
  BOOL v27 = searchBarPortalView == 0;
  if (searchBarPortalView) {
    BOOL v28 = 0;
  }
  else {
    BOOL v28 = v20;
  }
  BOOL v29 = v25 || v28;
  BOOL v30 = v27 && v26;
  self->_dismissingFromFullyPresented = v30;
  if (v20)
  {
    [(SBSpotlightPresentableViewController *)self _beginRequiringSearchBarPortalViewForReason:v19];
    [(SBSpotlightPresentableViewController *)self _setHitTestingDisabledOnHostedContent:a3 == 0];
    *a5 = v29;
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
    v33[3] = &unk_1E6AFB8D8;
    objc_copyWeak(&v36, &location);
    id v34 = v19;
    uint64_t v35 = self;
    long long v31 = (void *)MEMORY[0x1D948C7A0](v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SBSpotlightPresentableViewController *)self _setHitTestingDisabledOnHostedContent:v22];
    long long v31 = 0;
    *a5 = v29;
  }

  return v31;
}

void __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _endRequiringSearchBarPortalViewForReason:*(void *)(a1 + 32)];
    if (!v3[141])
    {
      [v3 _setHitTestingDisabledOnHostedContent:0];
      *(unsigned char *)(*(void *)(a1 + 40) + 979) = 0;
      *(unsigned char *)(*(void *)(a1 + 40) + 980) = 0;
    }
    if (v3[147] == (id)2 && !v3[139])
    {
      [v3[134] alpha];
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        uint64_t v43 = 0;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v4 = *(void *)(a1 + 40);
        uint64_t v5 = *(void *)(v4 + 1192);
        uint64_t v6 = *(void *)(v4 + 1184);
        uint64_t v7 = *(void *)(v4 + 1176);
        double v8 = *(double *)(v4 + 1168);
        double v9 = *(double *)(v4 + 1160);
        long long v10 = *(_OWORD *)(v4 + 1584);
        long long v11 = *(_OWORD *)(v4 + 1600);
        long long v12 = *(_OWORD *)(v4 + 1616);
        uint64_t v30 = *(void *)(v4 + 1632);
        v29[1] = v11;
        v29[2] = v12;
        v29[0] = v10;
        [v3 _presentationMetricsWithProgress:v7 offset:v6 velocity:v5 presentationState:v7 previousPresentationState:v7 anticipatedPresentationState:v29 searchContentPresentationState:v9 searchAffordancePresentationState:v8 hostedContentMetrics:0.0];
        CGFloat v13 = (void *)MEMORY[0x1E4F42FF0];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_2;
        v14[3] = &unk_1E6B0B6B8;
        void v14[4] = *(void *)(a1 + 40);
        int64_t v15 = v3;
        long long v26 = v41;
        long long v27 = v42;
        uint64_t v28 = v43;
        long long v22 = v37;
        long long v23 = v38;
        long long v25 = v40;
        long long v24 = v39;
        long long v18 = v33;
        long long v19 = v34;
        long long v21 = v36;
        long long v20 = v35;
        long long v17 = v32;
        long long v16 = v31;
        [v13 performWithoutAnimation:v14];
      }
    }
  }
}

void __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1264);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_3;
  v11[3] = &unk_1E6B0B668;
  id v4 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 176);
  long long v22 = *(_OWORD *)(a1 + 192);
  long long v6 = *(_OWORD *)(a1 + 224);
  long long v23 = *(_OWORD *)(a1 + 208);
  long long v24 = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v18 = *(_OWORD *)(a1 + 128);
  long long v8 = *(_OWORD *)(a1 + 160);
  long long v19 = *(_OWORD *)(a1 + 144);
  long long v20 = v8;
  long long v21 = v5;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = v10;
  long long v17 = v7;
  id v12 = v4;
  uint64_t v25 = *(void *)(a1 + 240);
  long long v13 = v9;
  objc_msgSend(v2, "sb_animateWithSettings:mode:animations:completion:", v3, 2, v11, 0);
}

uint64_t __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 184);
  long long v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  uint64_t v10 = *(void *)(a1 + 232);
  long long v4 = *(_OWORD *)(a1 + 120);
  long long v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  void v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return [v1 _layoutWithMetrics:v9];
}

- (void)spotlightMultiplexingViewController:(id)a3 searchContentAvailabilityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (self->_waitingForSearchContentAvailabilityForFadeIn)
    {
      self->_waitingForSearchContentAvailabilityForFadeIn = 0;
      [(UIViewFloatAnimatableProperty *)self->_searchContentFadeProperty presentationValue];
      self->_searchContentFadeInStartValue = v7;
    }
    if (self->_presentationState)
    {
      searchBarPortalView = self->_searchBarPortalView;
      if (searchBarPortalView)
      {
        if (![(SBSpotlightPresentableViewController *)self _setUpHostedContentMetrics]) {
          goto LABEL_19;
        }
      }
      else
      {
        [(SBSpotlightPresentableViewController *)self _configureHostedContent];
      }
      [(SBSpotlightPresentableViewController *)self _beginRequiringSearchBarPortalViewForReason:@"SBWaitingForSearchBarPortalReason"];
      int64_t presentationState = self->_presentationState;
      if (searchBarPortalView) {
        BOOL v10 = presentationState == 1;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        goto LABEL_18;
      }
      BOOL v11 = self->_searchAffordanceReferenceView != 0;
      uint64_t v51 = 0;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v12 = presentationState == 1 ? 1 : 2;
      long long v47 = 0uLL;
      long long v48 = 0uLL;
      long long v45 = 0uLL;
      long long v46 = 0uLL;
      double presentationProgress = self->_presentationProgress;
      long long v43 = 0uLL;
      long long v44 = 0uLL;
      double presentationOffset = self->_presentationOffset;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
      int64_t previousPresentationState = self->_previousPresentationState;
      long long v39 = 0uLL;
      long long v40 = 0uLL;
      CGSize searchBarSize = self->_hostedContentMetrics.searchBarSize;
      v37[0] = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
      v37[1] = searchBarSize;
      v37[2] = self->_hostedContentMetrics.dockedSearchBarSize;
      double searchBarCornerRadius = self->_hostedContentMetrics.searchBarCornerRadius;
      [(SBSpotlightPresentableViewController *)self _presentationMetricsWithProgress:v12 offset:previousPresentationState velocity:v12 presentationState:presentationState == 1 previousPresentationState:v11 anticipatedPresentationState:v37 searchContentPresentationState:presentationProgress searchAffordancePresentationState:presentationOffset hostedContentMetrics:0.0];
      searchAnimationSettings = self->_searchAnimationSettings;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      long long v33 = v48;
      long long v34 = v49;
      long long v35 = v50;
      long long v29 = v44;
      long long v30 = v45;
      long long v31 = v46;
      long long v32 = v47;
      long long v25 = v40;
      long long v26 = v41;
      long long v27 = v42;
      long long v28 = v43;
      v23[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke;
      v23[3] = &unk_1E6B0B668;
      v23[4] = self;
      uint64_t v36 = v51;
      long long v24 = v39;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_2;
      v21[3] = &unk_1E6AF9080;
      BOOL v22 = presentationState == 1;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, 2, v23, v21);
      if (presentationState != 1)
      {
LABEL_18:
        long long v18 = self->_searchAnimationSettings;
        v19[4] = self;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_3;
        v20[3] = &unk_1E6AF4AC0;
        v20[4] = self;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_4;
        v19[3] = &unk_1E6AFA1B8;
        objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v18, 3, v20, v19);
      }
    }
  }
LABEL_19:
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 184);
  long long v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  uint64_t v10 = *(void *)(a1 + 232);
  long long v4 = *(_OWORD *)(a1 + 120);
  long long v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  void v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return [v1 _layoutWithMetrics:v9];
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _endRequiringSearchBarPortalViewForReason:@"SBWaitingForSearchBarPortalReason"];
  }
  return result;
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresentationProgress:2 withOffset:0 velocity:*(double *)(*(void *)(a1 + 32) + 1160) presentationState:*(double *)(*(void *)(a1 + 32) + 1168) previousPresentationState:0.0];
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endRequiringSearchBarPortalViewForReason:@"SBWaitingForSearchBarPortalReason"];
}

- (void)spotlightMultiplexingViewController:(id)a3 externalKeyboardViewContainsKeyboardDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_initializingKeyboardView && v4)
  {
    if (self->_waitingForKeyboardPresentationForFadeIn)
    {
      self->_waitingForKeyboardPresentationForFadeIn = 0;
      [(UIViewFloatAnimatableProperty *)self->_keyboardFadeProperty presentationValue];
      self->_keyboardFadeInStartValue = v8;
    }
    if (self->_presentationState)
    {
      [(SBSpotlightPresentableViewController *)self _setUpHostedContentMetrics];
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        uint64_t v48 = 0;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        double presentationProgress = self->_presentationProgress;
        double presentationOffset = self->_presentationOffset;
        int64_t presentationState = self->_presentationState;
        int64_t previousPresentationState = self->_previousPresentationState;
        int64_t anticipatedPresentationState = self->_anticipatedPresentationState;
        int64_t searchAffordancePresentationState = self->_searchAffordancePresentationState;
        CGSize searchBarSize = self->_hostedContentMetrics.searchBarSize;
        v34[0] = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
        v34[1] = searchBarSize;
        v34[2] = self->_hostedContentMetrics.dockedSearchBarSize;
        double searchBarCornerRadius = self->_hostedContentMetrics.searchBarCornerRadius;
        [(SBSpotlightPresentableViewController *)self _presentationMetricsWithProgress:presentationState offset:previousPresentationState velocity:anticipatedPresentationState presentationState:presentationState previousPresentationState:searchAffordancePresentationState anticipatedPresentationState:v34 searchContentPresentationState:presentationProgress searchAffordancePresentationState:presentationOffset hostedContentMetrics:0.0];
        [(SBSpotlightPresentableViewController *)self _beginRequiringSearchBarPortalViewForReason:@"SBKeyboardAdjustmentAnimationReason"];
        int64_t v16 = self->_presentationState;
        searchAnimationSettings = self->_searchAnimationSettings;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        long long v30 = v45;
        long long v31 = v46;
        long long v32 = v47;
        long long v26 = v41;
        long long v27 = v42;
        long long v28 = v43;
        long long v29 = v44;
        long long v22 = v37;
        long long v23 = v38;
        long long v24 = v39;
        long long v25 = v40;
        if (v16 == 1) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 3;
        }
        v20[2] = __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke;
        v20[3] = &unk_1E6B0B668;
        v20[4] = self;
        uint64_t v33 = v48;
        long long v21 = v36;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke_2;
        v19[3] = &unk_1E6AFA1B8;
        v19[4] = self;
        objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, v18, v20, v19);
      }
    }
  }
}

uint64_t __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 184);
  long long v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  uint64_t v10 = *(void *)(a1 + 232);
  long long v4 = *(_OWORD *)(a1 + 120);
  long long v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  void v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return [v1 _positionKeyboardAlignedElementsWithMetrics:v9];
}

uint64_t __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endRequiringSearchBarPortalViewForReason:@"SBKeyboardAdjustmentAnimationReason"];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([(SBSpotlightPresentableViewController *)self isViewLoaded])
  {
    [(SBSpotlightPresentableViewController *)self _setUpSearchAnimationSettings];
  }
}

- (NSString)description
{
  return (NSString *)[(SBSpotlightPresentableViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  long long v2 = [(SBSpotlightPresentableViewController *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(SBSpotlightPresentableViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  long long v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  long long v5 = [(SBSpotlightPresentableViewController *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SBSpotlightPresentableViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  BOOL v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __78__SBSpotlightPresentableViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 1176);
  if (v3 > 2) {
    id v4 = @"unknown";
  }
  else {
    id v4 = off_1E6B0B6D8[v3];
  }
  [v2 appendString:v4 withName:@"presentationState"];
  long long v5 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 1000) _appearState];
  id v6 = SBFStringForAppearState();
  [v5 appendString:v6 withName:@"appearState"];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 1152) allObjects];
  [v7 appendArraySection:v8 withName:@"searchBarPortalRequirementReasons" skipIfEmpty:1];
}

- (void)_createScaleProperty
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  p_scaleProperty = &self->_scaleProperty;
  scaleProperty = self->_scaleProperty;
  self->_scaleProperty = v3;

  [(UIViewFloatAnimatableProperty *)self->_scaleProperty setValue:1.0];
  id v6 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v6;

  [(SBFFluidBehaviorSettings *)self->_scaleSettings setBehaviorType:2];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setResponse:0.5];
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F42FF0];
  v13[0] = *p_scaleProperty;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SBSpotlightPresentableViewController__createScaleProperty__block_invoke;
  v10[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v11, &location);
  [v8 _createTransformerWithInputAnimatableProperties:v9 presentationValueChangedCallback:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__SBSpotlightPresentableViewController__createScaleProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForScalePropertyChanged];
}

- (void)_updateForScalePropertyChanged
{
  CGFloat v3 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    [(UIViewFloatAnimatableProperty *)self->_scaleProperty presentationValue];
    CGFloat v3 = v4;
  }
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, v3, v3);
  scaleView = self->_scaleView;
  CGAffineTransform v6 = v7;
  [(UIView *)scaleView setTransform:&v6];
}

- (void)_createSearchContentFadeProperty
{
  long long v2 = self;
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  CGFloat v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F43000]);
  long long v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1216);
  Class isa = v2->super.super.super.isa;
  v2->super.super.super.Class isa = v3;

  long long v5 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = v2->super.super.super.isa;
  CGAffineTransform v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke;
  v9[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke_2;
  v7[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v8, &location);
  [v5 _createTransformerWithInputAnimatableProperties:v6 modelValueSetter:v9 presentationValueSetter:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v3 = (void *)*((void *)WeakRetained + 152);
    if (v3)
    {
      CGAffineTransform v7 = v2;
      [v3 value];
      double v5 = fmin(fmax((v4 - *((double *)v7 + 182)) / (*((double *)v7 + 183) - *((double *)v7 + 182)) + 0.0, 0.0), 1.0);
      CGAffineTransform v6 = [*((id *)v7 + 125) view];
      [v6 setAlpha:v5];

      long long v2 = v7;
    }
  }
}

void __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v3 = (void *)*((void *)WeakRetained + 152);
    if (v3)
    {
      long long v15 = v2;
      [v3 value];
      [*((id *)v15 + 152) presentationValue];
      double v5 = v4;
      CGAffineTransform v6 = (double *)(v15 + 1456);
      double v7 = *((double *)v15 + 182);
      double v8 = *((double *)v15 + 183);
      if (BSFloatIsOne())
      {
        long long v9 = (id *)v15;
        double v10 = 0.0;
        if (!v15[981])
        {
          double v11 = *((double *)v15 + 155);
          if (v11 < *v6) {
            double v11 = *v6;
          }
          double v10 = fmin(fmax((v5 - v11) / (*((double *)v15 + 183) - v11) + 0.0, 0.0), 1.0);
        }
      }
      else
      {
        long long v9 = (id *)v15;
        if (v15[980]) {
          double v12 = (v5 - *((double *)v15 + 185)) / (*((double *)v15 + 184) - *((double *)v15 + 185));
        }
        else {
          double v12 = (v5 - v7) / (v8 - v7);
        }
        double v10 = fmin(fmax(v12 + 0.0, 0.0), 1.0);
      }
      long long v13 = [v9[125] view];
      long long v14 = [NSNumber numberWithDouble:v10];
      [v13 _setPresentationValue:v14 forKey:@"opacity"];

      long long v2 = v15;
    }
  }
}

- (void)_createSearchAffordanceReferenceBackgroundFadeProperty
{
  long long v2 = self;
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  CGFloat v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F43000]);
  long long v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1224);
  Class isa = v2->super.super.super.isa;
  v2->super.super.super.Class isa = v3;

  double v5 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = v2->super.super.super.isa;
  CGAffineTransform v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke;
  v9[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke_2;
  v7[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v8, &location);
  [v5 _createTransformerWithInputAnimatableProperties:v6 modelValueSetter:v9 presentationValueSetter:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[153];
    if (v3)
    {
      double v5 = v2;
      [v3 value];
      objc_msgSend(v5[136], "setAlpha:", fmin(fmax((v4 - *((double *)v5 + 187)) / (*((double *)v5 + 186) - *((double *)v5 + 187)) + 0.0, 0.0), 1.0));
      long long v2 = v5;
    }
  }
}

void __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 153);
    if (v3)
    {
      double v7 = v2;
      [v3 presentationValue];
      double v5 = (void *)*((void *)v7 + 136);
      CGAffineTransform v6 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fmax((v4 - v7[187]) / (v7[186] - v7[187]) + 0.0, 0.0), 1.0));
      [v5 _setPresentationValue:v6 forKey:@"opacity"];

      long long v2 = v7;
    }
  }
}

- (void)_tearDownSearchAffordanceReferenceBackgroundFadeProperty
{
  searchAffordanceReferenceBackgroundFadeProperty = self->_searchAffordanceReferenceBackgroundFadeProperty;
  if (searchAffordanceReferenceBackgroundFadeProperty)
  {
    if (([(UIViewFloatAnimatableProperty *)searchAffordanceReferenceBackgroundFadeProperty isInvalidated] & 1) == 0)[(UIViewFloatAnimatableProperty *)self->_searchAffordanceReferenceBackgroundFadeProperty invalidate]; {
    double v4 = self->_searchAffordanceReferenceBackgroundFadeProperty;
    }
    self->_searchAffordanceReferenceBackgroundFadeProperty = 0;
  }
}

- (void)_createBackgroundBlurProperty
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  p_backgroundBlurProperty = &self->_backgroundBlurProperty;
  backgroundBlurProperty = self->_backgroundBlurProperty;
  self->_backgroundBlurProperty = v3;

  CGAffineTransform v6 = (void *)MEMORY[0x1E4F42FF0];
  v11[0] = *p_backgroundBlurProperty;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SBSpotlightPresentableViewController__createBackgroundBlurProperty__block_invoke;
  v8[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v9, &location);
  [v6 _createTransformerWithInputAnimatableProperties:v7 presentationValueChangedCallback:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__SBSpotlightPresentableViewController__createBackgroundBlurProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 154);
    if (v3)
    {
      double v7 = v2;
      [v3 presentationValue];
      if (v7[980])
      {
        double v5 = (double *)(v7 + 1440);
        CGAffineTransform v6 = (double *)(v7 + 1448);
      }
      else
      {
        CGAffineTransform v6 = (double *)(v7 + 1424);
        double v5 = (double *)(v7 + 1432);
      }
      objc_msgSend(*((id *)v7 + 129), "setSpotlightBackgroundWeighting:", fmin(fmax((v4 - *v6) / (*v5 - *v6) + 0.0, 0.0), 1.0));
      long long v2 = v7;
    }
  }
}

- (void)_tearDownBackgroundBlurProperty
{
  backgroundBlurProperty = self->_backgroundBlurProperty;
  if (backgroundBlurProperty)
  {
    if (([(UIViewFloatAnimatableProperty *)backgroundBlurProperty isInvalidated] & 1) == 0) {
      [(UIViewFloatAnimatableProperty *)self->_backgroundBlurProperty invalidate];
    }
    double v4 = self->_backgroundBlurProperty;
    self->_backgroundBlurProperty = 0;
  }
}

- (void)_createKeyboardFadeProperty
{
  long long v2 = self;
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F43000]);
  long long v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1248);
  Class isa = v2->super.super.super.isa;
  v2->super.super.super.Class isa = v3;

  double v5 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = v2->super.super.super.isa;
  CGAffineTransform v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke;
  v9[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke_2;
  v7[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v8, &location);
  [v5 _createTransformerWithInputAnimatableProperties:v6 modelValueSetter:v9 presentationValueSetter:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[156];
    if (v3)
    {
      uint64_t v4 = *((void *)v2 + 138);
      [v3 value];
      double v6 = v5;
      objc_msgSend(*((id *)v2 + 139), "setAlpha:");
      [*((id *)v2 + 140) setAlpha:v6];
      if (v4)
      {
        if (*((unsigned char *)v2 + 978))
        {
          [*((id *)v2 + 141) setAlpha:v6];
          [*((id *)v2 + 134) setAlpha:1.0 - v6];
          CGFloat v7 = *((double *)v2 + 216);
          if (BSFloatIsOne())
          {
            id v8 = (void *)*((void *)v2 + 134);
            long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            *(_OWORD *)&v12.a = *MEMORY[0x1E4F1DAB8];
            *(_OWORD *)&v12.c = v9;
            *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
            id v10 = &v12;
          }
          else
          {
            memset(&v12, 0, sizeof(v12));
            CGAffineTransformMakeScale(&v12, v7, v7);
            id v8 = (void *)*((void *)v2 + 134);
            CGAffineTransform v11 = v12;
            id v10 = &v11;
          }
          objc_msgSend(v8, "setTransform:", v10, *(_OWORD *)&v11.a, *(_OWORD *)&v11.c, *(_OWORD *)&v11.tx, *(void *)&v12.a, *(void *)&v12.b, *(void *)&v12.c, *(void *)&v12.d, *(void *)&v12.tx, *(void *)&v12.ty);
        }
      }
      else
      {
        if (*((unsigned char *)v2 + 978)) {
          [*((id *)v2 + 141) setAlpha:v6];
        }
        [*((id *)v2 + 143) setAlpha:v6];
      }
    }
  }
}

void __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[156];
    if (v3)
    {
      uint64_t v4 = *((void *)v2 + 138);
      [v3 value];
      [*((id *)v2 + 156) presentationValue];
      double v6 = v5;
      if (BSFloatIsOne())
      {
        double v7 = 0.0;
        if (!*((unsigned char *)v2 + 982)) {
          double v7 = fmin(fmax((v6 - *((double *)v2 + 157)) / (1.0 - *((double *)v2 + 157)) + 0.0, 0.0), 1.0);
        }
      }
      else if (*((unsigned char *)v2 + 980))
      {
        double v7 = fmin(fmax((v6 - *((double *)v2 + 185)) / (*((double *)v2 + 184) - *((double *)v2 + 185)) + 0.0, 0.0), 1.0);
      }
      else
      {
        double v7 = v6;
      }
      id v8 = (void *)*((void *)v2 + 139);
      long long v9 = [NSNumber numberWithDouble:v7];
      [v8 _setPresentationValue:v9 forKey:@"opacity"];

      id v10 = (void *)*((void *)v2 + 140);
      CGAffineTransform v11 = [NSNumber numberWithDouble:v7];
      [v10 _setPresentationValue:v11 forKey:@"opacity"];

      if (!v4)
      {
        if (*((unsigned char *)v2 + 978))
        {
          long long v25 = (void *)*((void *)v2 + 141);
          long long v26 = [NSNumber numberWithDouble:v7];
          [v25 _setPresentationValue:v26 forKey:@"opacity"];
        }
        uint64_t v18 = (void *)*((void *)v2 + 143);
        long long v27 = [NSNumber numberWithDouble:v7];
        long long v28 = @"opacity";
        goto LABEL_18;
      }
      if (*((unsigned char *)v2 + 978))
      {
        double v12 = fmin(fmax((v6 - *((double *)v2 + 189)) / (*((double *)v2 + 188) - *((double *)v2 + 189)) + 0.0, 0.0), 1.0);
        long long v13 = (void *)*((void *)v2 + 141);
        long long v14 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fmax((v6 - *((double *)v2 + 190)) / (*((double *)v2 + 191) - *((double *)v2 + 190)) + 0.0, 0.0), 1.0));
        [v13 _setPresentationValue:v14 forKey:@"opacity"];

        long long v15 = (void *)*((void *)v2 + 134);
        int64_t v16 = [NSNumber numberWithDouble:v12];
        [v15 _setPresentationValue:v16 forKey:@"opacity"];

        double v17 = *((double *)v2 + 216);
        if (BSFloatIsOne())
        {
          uint64_t v18 = (void *)*((void *)v2 + 134);
          long long v19 = (void *)MEMORY[0x1E4F29238];
          long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
          long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
          long long v37 = v20;
          long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
          long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
          long long v39 = v21;
          long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
          *(_OWORD *)&v34.a = *MEMORY[0x1E4F39B10];
          *(_OWORD *)&v34.c = v22;
          long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
          *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
          long long v35 = v23;
          long long v24 = &v34;
        }
        else
        {
          double v29 = fmax((v17 + -1.0) * (v6 - *((double *)v2 + 188)) / (*((double *)v2 + 189) - *((double *)v2 + 188)) + 1.0, 0.0);
          memset(&v34, 0, sizeof(v34));
          CGFloat v30 = fmin(v29, 1.0);
          CGAffineTransformMakeScale(&v34, v30, v30);
          uint64_t v18 = (void *)*((void *)v2 + 134);
          long long v31 = (void *)MEMORY[0x1E4F29238];
          CGAffineTransform v32 = v34;
          CATransform3DMakeAffineTransform(&v33, &v32);
          long long v24 = &v33;
          long long v19 = v31;
        }
        long long v27 = [v19 valueWithCATransform3D:v24];
        long long v28 = @"transform";
LABEL_18:
        [v18 _setPresentationValue:v27 forKey:v28];
      }
    }
  }
}

- (void)_tearDownKeyboardFadeProperty
{
  keyboardFadeProperty = self->_keyboardFadeProperty;
  if (keyboardFadeProperty)
  {
    if (([(UIViewFloatAnimatableProperty *)keyboardFadeProperty isInvalidated] & 1) == 0) {
      [(UIViewFloatAnimatableProperty *)self->_keyboardFadeProperty invalidate];
    }
    uint64_t v4 = self->_keyboardFadeProperty;
    self->_keyboardFadeProperty = 0;
  }
}

- (void)_setCornerRounded:(BOOL)a3
{
  BOOL v3 = a3;
  scaleView = self->_scaleView;
  if (a3)
  {
    double v6 = [(SBSpotlightPresentableViewController *)self _screen];
    double v7 = [v6 traitCollection];
    [v7 displayCornerRadius];
    -[UIView _setContinuousCornerRadius:](scaleView, "_setContinuousCornerRadius:");
  }
  else
  {
    [(UIView *)self->_scaleView _setContinuousCornerRadius:0.0];
  }
  id v8 = self->_scaleView;
  [(UIView *)v8 setClipsToBounds:v3];
}

- (void)_setUpSearchAnimationSettings
{
  BOOL v3 = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings pullTransitionAnimationSettings];
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;

  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings pullTransitionActivationThreshold];
  self->_spotlightActivationThreshold = v5;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings backgroundBlurInteractiveTransitionDistance];
  self->_backgroundInteractiveBlurDistance = v6;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings backgroundBlurStartThreshold];
  double v8 = v7;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings backgroundBlurEndThreshold];
  self->_backgroundBlurRange.start = v8;
  self->_backgroundBlurRange.end = v9;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings backgroundUnblurStartThreshold];
  double v11 = v10;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings backgroundUnblurEndThreshold];
  self->_backgroundUnblurRange.start = v11;
  self->_backgroundUnblurRange.end = v12;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchContentFadeInteractiveTransitionDistance];
  self->_searchContentInteractiveFadeInDistance = v13;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchContentFadeInStartThreshold];
  double v15 = v14;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchContentFadeInEndThreshold];
  self->_searchContentFadeInRange.start = v15;
  self->_searchContentFadeInRange.end = v16;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchContentFadeOutStartThreshold];
  double v18 = v17;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchContentFadeOutEndThreshold];
  self->_searchContentFadeOutRange.start = v18;
  self->_searchContentFadeOutRange.end = v19;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance];
  self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance = v20;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceBackgroundMaterialFadeStartThreshold];
  double v22 = v21;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceBackgroundMaterialFadeEndThreshold];
  self->_searchAffordanceBackgroundMaterialFadeRange.start = v22;
  self->_searchAffordanceBackgroundMaterialFadeRange.end = v23;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceContentFadeStartThreshold];
  double v25 = v24;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceContentFadeEndThreshold];
  self->_searchAffordanceContentFadeRange.start = v25;
  self->_searchAffordanceContentFadeRange.end = v26;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchBarContentFadeStartThreshold];
  double v28 = v27;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchBarContentFadeEndThreshold];
  self->_searchBarContentFadeRange.start = v28;
  self->_searchBarContentFadeRange.end = v29;
  self->_scalesSearchAffordanceContentWhileFading = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings scalesSearchAffordanceContentWhileFading];
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceTransformStartThreshold];
  double v31 = v30;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceTransformEndThreshold];
  self->_searchAffordanceScaleAndTranslateRange.start = v31;
  self->_searchAffordanceScaleAndTranslateRange.end = v32;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceMaxScaleX];
  self->_double searchAffordanceMaxScaleX = v33;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceMaxScaleY];
  self->_double searchAffordanceMaxScaleY = v34;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceScaleRubberbandingRange];
  self->_searchAffordanceScaleRubberbandingRange = v35;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceMaxOffset];
  self->_double searchAffordanceMaxOffset = v36;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceOffsetRubberbandingRange];
  self->_searchAffordanceOffsetRubberbandingRange = v37;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings searchAffordanceTransientFadeInThreshold];
  self->_searchAffordanceTransientFadeInThreshold = v38;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings pullTransitionDistance];
  self->_pullTransitionDistance = v39;
  self->_allowsKeyboardWhileInteractive = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings allowsKeyboardWhileInteractive];
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings allowsKeyboardWhileInteractiveWithoutSearchAffordance];
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings interactiveKeyboardPresentationThreshold];
  self->_interactiveKeyboardPresentationThreshold = v40;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings interactiveKeyboardPresentationOffset];
  self->_interactiveKeyboardPresentationOffset = v41;
  self->_keyboardFollowsSpotlightContent = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings keyboardFollowsSpotlightContent];
  self->_allowsVelocityInjection = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings allowsVelocityInjection];
  self->_injectsVelocityOnlyForShortSwipes = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings injectsVelocityOnlyForShortSwipes];
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings shortSwipeMaximumPercentageOfExpectedVelocity];
  self->_shortSwipeMaximumPercentageOfExpectedVelocity = v42;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings injectedPercentageOfGestureVelocity];
  self->_injectedPercentageOfGestureVelocity = v43;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings keyboardInjectedVelocityPercentage];
  self->_keyboardInjectedVelocityPercentage = v44;
  self->_injectsVelocityForNonInteractiveTransitions = [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings injectsVelocityForNonInteractiveTransitions];
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings injectedVelocityForNonInteractiveTransitions];
  self->_double injectedVelocityForNonInteractiveTransitions = v45;
  [(SBHHomePullToSearchSettings *)self->_searchTransitionSettings keyboardInjectedVelocityPercentageForNonInteractiveTransitions];
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = v46;
}

- (void)_setUpSearchBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [WeakRetained backgroundViewForSpotlightPresentableViewController:self];
    searchBackgroundView = self->_searchBackgroundView;
    self->_searchBackgroundView = v3;
  }
  double v5 = self->_searchBackgroundView;
  if (v5)
  {
    [(SBSpotlightBackgroundWeighting *)v5 bs_setHitTestingDisabled:1];
    double v6 = [(SBSpotlightPresentableViewController *)self view];
    [v6 addSubview:self->_searchBackgroundView];
    [v6 sendSubviewToBack:self->_searchBackgroundView];
  }
}

- (void)_setUpSearchAffordance
{
  [(UIView *)self->_searchAffordanceReferenceBackgroundView removeFromSuperview];
  searchAffordanceReferenceBackgroundView = self->_searchAffordanceReferenceBackgroundView;
  self->_searchAffordanceReferenceBackgroundView = 0;

  [(SBSpotlightPresentableViewController *)self _tearDownSearchAffordanceReferenceBackgroundFadeProperty];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [WeakRetained searchAffordanceViewForSpotlightPresentableViewController:self];
    searchAffordance = self->_searchAffordance;
    self->_searchAffordance = v4;
  }
  if (self->_searchAffordance)
  {
    double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    searchAffordanceContentContainerView = self->_searchAffordanceContentContainerView;
    self->_searchAffordanceContentContainerView = v6;

    [(UIView *)self->_searchAffordanceContentContainerView bs_setHitTestingDisabled:1];
    double v8 = [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceContentView];
    [v8 removeFromSuperview];
    [(UIView *)self->_searchAffordanceContentContainerView addSubview:v8];
    double v9 = self->_scaleView;
    if (self->_supportsSeparateSearchBarBackground && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double v10 = [(SBHSearchAffordance *)self->_searchAffordance makeSearchAffordanceBackgroundCapturingView];
      searchAffordanceBackgroundCapturingView = self->_searchAffordanceBackgroundCapturingView;
      self->_searchAffordanceBackgroundCapturingView = v10;

      [(UIView *)v9 addSubview:self->_searchAffordanceBackgroundCapturingView];
    }
    double v12 = [(SBHSearchAffordance *)self->_searchAffordance searchAffordanceReferenceBackgroundView];
    double v13 = self->_searchAffordanceReferenceBackgroundView;
    self->_searchAffordanceReferenceBackgroundView = v12;

    [(UIView *)v9 addSubview:self->_searchAffordance];
    if (self->_searchAffordanceReferenceBackgroundView) {
      -[SBHSearchAffordance addSubview:](self->_searchAffordance, "addSubview:");
    }
    [(UIView *)v9 addSubview:self->_searchAffordanceContentContainerView];
    [(SBSpotlightPresentableViewController *)self _createSearchAffordanceReferenceBackgroundFadeProperty];
  }
}

- (void)_setUpHomeAffordance
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [WeakRetained wantsHomeAffordanceForSpotlightPresentableViewController:self])
    {
      BOOL v3 = self->_scaleView;
      uint64_t v4 = [SBHomeGrabberView alloc];
      [(UIView *)v3 bounds];
      double v5 = -[SBHomeGrabberView initWithFrame:](v4, "initWithFrame:");
      homeAffordance = self->_homeAffordance;
      self->_homeAffordance = v5;

      [(SBHomeGrabberView *)self->_homeAffordance setAutoresizingMask:18];
      [(SBHomeGrabberView *)self->_homeAffordance setColorBias:2];
      [(SBHomeGrabberView *)self->_homeAffordance setPointerClickDelegate:self];
      [(UIView *)v3 addSubview:self->_homeAffordance];
    }
  }
}

- (void)_setUpSearchBackgroundMatchMoveAnimation
{
  if (self->_searchBackgroundView)
  {
    BOOL v3 = (void *)MEMORY[0x1E4FA5E88];
    uint64_t v4 = [(SBSpotlightPresentableViewController *)self view];
    double v5 = [v4 window];
    id v6 = [v3 matchMoveAnimationForPinningToView:v5];

    [(SBSpotlightBackgroundWeighting *)self->_searchBackgroundView addAnimation:v6 forKey:@"SBSearchBackgroundMatchMoveAnimation"];
  }
}

- (BOOL)_setUpHostedContentMetrics
{
  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  if (spotlightMultiplexingViewController) {
    [(SBSpotlightMultiplexingViewController *)spotlightMultiplexingViewController spotlightHostedContentMetrics];
  }
  double keyboardHeight = self->_hostedContentMetrics.keyboardHeight;
  BOOL result = keyboardHeight != 0.0;
  if (keyboardHeight != 0.0) {
    self->_hostedContentMetrics.double keyboardHeight = 0.0;
  }
  if (self->_hostedContentMetrics.keyboardProtectorHeight != 0.0)
  {
    self->_hostedContentMetrics.double keyboardProtectorHeight = 0.0;
    BOOL result = 1;
  }
  if (self->_hostedContentMetrics.searchBarSize.width != 0.0 || self->_hostedContentMetrics.searchBarSize.height != 0.0)
  {
    self->_hostedContentMetrics.CGSize searchBarSize = 0u;
    BOOL result = 1;
  }
  if (self->_hostedContentMetrics.dockedSearchBarSize.width != 0.0
    || self->_hostedContentMetrics.dockedSearchBarSize.height != 0.0)
  {
    self->_hostedContentMetrics.CGSize dockedSearchBarSize = 0u;
    BOOL result = 1;
  }
  if (self->_hostedContentMetrics.searchBarCornerRadius != 0.0)
  {
    self->_hostedContentMetrics.double searchBarCornerRadius = 0.0;
    return 1;
  }
  return result;
}

- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSpotlightPresentableViewController.m", 1369, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
  if (!searchBarPortalRequirementReasons)
  {
    double v7 = [MEMORY[0x1E4F1CA80] set];
    double v8 = self->_searchBarPortalRequirementReasons;
    self->_searchBarPortalRequirementReasons = v7;

    searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
  }
  [(NSMutableSet *)searchBarPortalRequirementReasons addObject:v5];
  double v9 = SBLogSpotlight();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [(SBSpotlightPresentableViewController *)self succinctDescription];
    uint64_t v11 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons count];
    *(_DWORD *)buf = 138543874;
    double v15 = v10;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ requiring search bar portal for reason: %{public}@ -- new count: %lu", buf, 0x20u);
  }
  double v12 = [(SBSpotlightPresentableViewController *)self _sharedRemoteSearchViewController];
  [v12 setRevealProgress:1.0];

  [(SBSpotlightPresentableViewController *)self _configureHostedContent];
}

- (void)_configureHostedContent
{
  if ([(NSMutableSet *)self->_searchBarPortalRequirementReasons count])
  {
    [(SBSpotlightPresentableViewController *)self _setUpHostedContentMetrics];
    [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setDelegate:self];
    BOOL v3 = self->_scaleView;
    p_searchBarPortalView = (id *)&self->_searchBarPortalView;
    if (!self->_searchBarPortalView)
    {
      double v39 = v3;
      id v5 = [(SBSpotlightPresentableViewController *)self _sharedRemoteSearchViewController];
      uint64_t v6 = [v5 searchHeaderLayerRenderID];
      uint64_t v7 = [v5 searchHeaderContextID];
      uint64_t v8 = [v5 searchHeaderBlurLayerRenderID];
      uint64_t v9 = [v5 searchHeaderBlurContextID];
      uint64_t v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      char v12 = v11;
      if (self->_supportsSeparateSearchBarBackground) {
        char v13 = v12;
      }
      else {
        char v13 = 0;
      }
      uint64_t v38 = [v5 searchHeaderBackgroundLayerRenderID];
      unsigned int v14 = [v5 searchHeaderBackgroundContextID];
      if (v6 && v7 && v38 && v14 && (v13 & 1) == 0)
      {
        unsigned int v37 = v14;
        id v15 = objc_alloc_init(MEMORY[0x1E4F43298]);
        id v16 = *p_searchBarPortalView;
        id *p_searchBarPortalView = v15;

        objc_msgSend(*p_searchBarPortalView, "bs_setHitTestingDisabled:", 1);
        [*p_searchBarPortalView setHidesSourceView:1];
        id v17 = [*p_searchBarPortalView portalLayer];
        [v17 setSourceLayerRenderId:v6];

        __int16 v18 = [*p_searchBarPortalView portalLayer];
        [v18 setSourceContextId:v7];

        if (self->_supportsSeparateSearchBarBackground)
        {
          uint64_t v19 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E4F43298]);
          searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
          self->_searchBarBackgroundPortalView = v19;

          [(_UIPortalView *)self->_searchBarBackgroundPortalView bs_setHitTestingDisabled:1];
          [(_UIPortalView *)self->_searchBarBackgroundPortalView setHidesSourceView:1];
          double v21 = [(_UIPortalView *)self->_searchBarBackgroundPortalView portalLayer];
          [v21 setSourceLayerRenderId:v8];

          double v22 = [(_UIPortalView *)self->_searchBarBackgroundPortalView portalLayer];
          [v22 setSourceContextId:v10];
        }
        double v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
        searchBarPortalClippingContainerView = self->_searchBarPortalClippingContainerView;
        self->_searchBarPortalClippingContainerView = v23;

        [(UIView *)self->_searchBarPortalClippingContainerView setClipsToBounds:1];
        p_searchBarBackgroundPortalView = &self->_searchBarPortalView;
        if (self->_supportsSeparateSearchBarBackground) {
          p_searchBarBackgroundPortalView = &self->_searchBarBackgroundPortalView;
        }
        double v26 = *p_searchBarBackgroundPortalView;
        [(UIView *)self->_searchBarPortalClippingContainerView addSubview:v26];
        double v27 = self->_searchBarPortalClippingContainerView;
        if (self->_searchAffordance) {
          -[UIView insertSubview:belowSubview:](v39, "insertSubview:belowSubview:", v27);
        }
        else {
          [(UIView *)v39 addSubview:v27];
        }
        if (self->_supportsSeparateSearchBarBackground) {
          [(UIView *)v39 addSubview:*p_searchBarPortalView];
        }
        double v28 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E4F43298]);
        keyboardProtectorPortalView = self->_keyboardProtectorPortalView;
        self->_keyboardProtectorPortalView = v28;

        [(_UIPortalView *)self->_keyboardProtectorPortalView bs_setHitTestingDisabled:1];
        [(_UIPortalView *)self->_keyboardProtectorPortalView setHidesSourceView:1];
        double v30 = [(_UIPortalView *)self->_keyboardProtectorPortalView portalLayer];
        [v30 setSourceLayerRenderId:v38];

        double v31 = [(_UIPortalView *)self->_keyboardProtectorPortalView portalLayer];
        [v31 setSourceContextId:v37];

        double v32 = self->_keyboardProtectorPortalView;
        double v33 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController view];
        [(UIView *)v39 insertSubview:v32 aboveSubview:v33];
      }
      BOOL v3 = v39;
    }
    if (!self->_keyboardView)
    {
      double v40 = v3;
      [(SBSpotlightPresentableViewController *)self _tearDownKeyboardFadeProperty];
      [(SBSpotlightPresentableViewController *)self _createKeyboardFadeProperty];
      self->_initializingKeyboardView = 1;
      [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setWantsExternalKeyboardView:1];
      double v34 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController externalKeyboardView];
      keyboardView = self->_keyboardView;
      self->_keyboardView = v34;

      double v36 = self->_keyboardView;
      if (self->_homeAffordance) {
        -[UIView insertSubview:belowSubview:](v40, "insertSubview:belowSubview:", v36);
      }
      else {
        [(UIView *)v40 addSubview:v36];
      }
      self->_initializingKeyboardView = 0;
      BOOL v3 = v40;
    }
  }
}

- (void)_endRequiringSearchBarPortalViewForReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons count];
  [(NSMutableSet *)self->_searchBarPortalRequirementReasons removeObject:v4];
  uint64_t v6 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons count];
  uint64_t v7 = SBLogSpotlight();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(SBSpotlightPresentableViewController *)self succinctDescription];
    int v15 = 138543874;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ended requiring search bar portal for reason: %{public}@ -- new count: %lu", (uint8_t *)&v15, 0x20u);
  }
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v5 == 0;
  }
  if (!v9)
  {
    [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setDelegate:0];
    [(UIView *)self->_searchBarPortalClippingContainerView removeFromSuperview];
    searchBarPortalClippingContainerView = self->_searchBarPortalClippingContainerView;
    self->_searchBarPortalClippingContainerView = 0;

    if (self->_supportsSeparateSearchBarBackground) {
      [(_UIPortalView *)self->_searchBarPortalView removeFromSuperview];
    }
    searchBarPortalView = self->_searchBarPortalView;
    self->_searchBarPortalView = 0;

    searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
    self->_searchBarBackgroundPortalView = 0;

    [(_UIPortalView *)self->_keyboardProtectorPortalView removeFromSuperview];
    keyboardProtectorPortalView = self->_keyboardProtectorPortalView;
    self->_keyboardProtectorPortalView = 0;

    [(UIView *)self->_keyboardView bs_setHitTestingDisabled:0];
    [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setWantsExternalKeyboardView:0];
    [(UIView *)self->_keyboardView removeFromSuperview];
    keyboardView = self->_keyboardView;
    self->_keyboardView = 0;
  }
}

- (unint64_t)_activeTransitionCount
{
  id v2 = [(NSMutableSet *)self->_searchBarPortalRequirementReasons bs_filter:&__block_literal_global_354];
  unint64_t v3 = [v2 count];

  return v3;
}

uint64_t __62__SBSpotlightPresentableViewController__activeTransitionCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:@"SBWaitingForSearchBarPortalReason"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"SBKeyboardAdjustmentAnimationReason"] ^ 1;
  }

  return v3;
}

- (void)_setHitTestingDisabledOnHostedContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController view];
  objc_msgSend(v5, "bs_setHitTestingDisabled:", v3);

  [(UIView *)self->_keyboardView bs_setHitTestingDisabled:v3];
  [(_UIPortalView *)self->_keyboardProtectorPortalView bs_setHitTestingDisabled:v3];
  [(UIView *)self->_searchBarPortalClippingContainerView bs_setHitTestingDisabled:v3];
  if (self->_supportsSeparateSearchBarBackground)
  {
    searchBarPortalView = self->_searchBarPortalView;
    [(_UIPortalView *)searchBarPortalView bs_setHitTestingDisabled:v3];
  }
}

- (id)_sharedRemoteSearchViewController
{
  id v2 = objc_opt_class();
  return (id)[v2 sharedRemoteSearchViewController];
}

- (void)_updateHomeAffordanceInteractionEnablement
{
  homeAffordance = self->_homeAffordance;
  if (homeAffordance)
  {
    uint64_t v3 = [(SBSpotlightPresentableViewController *)self bs_isAppearingOrAppeared];
    [(SBHomeGrabberView *)homeAffordance setHomeAffordanceInteractionEnabled:v3];
  }
}

- (void)_requestDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained spotlightPresentableViewControllerShouldDismiss:self];
}

- (SBSpotlightPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSpotlightPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->_maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->_maxPresentationOffset = a3;
}

- (SBHHomePullToSearchSettings)searchTransitionSettings
{
  return self->_searchTransitionSettings;
}

- (SBSpotlightBackgroundWeighting)searchBackgroundView
{
  return self->_searchBackgroundView;
}

- (void)setSearchBackgroundView:(id)a3
{
}

- (UIView)scaleView
{
  return self->_scaleView;
}

- (void)setScaleView:(id)a3
{
}

- (UIViewFloatAnimatableProperty)scaleProperty
{
  return self->_scaleProperty;
}

- (void)setScaleProperty:(id)a3
{
}

- (SBFFluidBehaviorSettings)scaleSettings
{
  return self->_scaleSettings;
}

- (void)setScaleSettings:(id)a3
{
}

- (SBHSearchAffordance)searchAffordance
{
  return self->_searchAffordance;
}

- (void)setSearchAffordance:(id)a3
{
}

- (UIView)searchAffordanceContentContainerView
{
  return self->_searchAffordanceContentContainerView;
}

- (void)setSearchAffordanceContentContainerView:(id)a3
{
}

- (UIView)searchAffordanceBackgroundCapturingView
{
  return self->_searchAffordanceBackgroundCapturingView;
}

- (void)setSearchAffordanceBackgroundCapturingView:(id)a3
{
}

- (UIView)searchAffordanceReferenceBackgroundView
{
  return self->_searchAffordanceReferenceBackgroundView;
}

- (void)setSearchAffordanceReferenceBackgroundView:(id)a3
{
}

- (SBSpotlightPresentationMetrics)appliedKeyboardAlignedElementsMetrics
{
  long long v3 = *(_OWORD *)&self[9].searchContentCenter.y;
  *(_OWORD *)&retstr->keyboardProtectorCenter.y = *(_OWORD *)&self[9].backgroundWeighting;
  *(_OWORD *)&retstr->homeAffordanceCenter.y = v3;
  retstr->double keyboardVelocity = self[9].searchAffordanceBackgroundAlpha;
  CGPoint keyboardProtectorCenter = self[8].keyboardProtectorCenter;
  *(_OWORD *)&retstr->searchAffordanceCornerRadius = *(_OWORD *)&self[8].keyboardCenter.y;
  *(CGPoint *)&retstr->fullSearchBarSize.double height = keyboardProtectorCenter;
  long long v5 = *(_OWORD *)&self[8].searchContentVelocity;
  retstr->CGPoint keyboardCenter = self[8].homeAffordanceCenter;
  *(_OWORD *)&retstr->keyboardAlpha = v5;
  long long v6 = *(_OWORD *)&self[8].searchAffordanceContentScale;
  *(_OWORD *)&retstr->searchAffordanceBackgroundAlpha = *(_OWORD *)&self[8].searchAffordanceAlpha;
  *(_OWORD *)&retstr->searchAffordanceSize.double height = v6;
  long long v7 = *(_OWORD *)&self[8].searchBarAlpha;
  *(CGSize *)&retstr->searchAffordanceCenter.y = self[8].fullSearchBarSize;
  *(_OWORD *)&retstr->searchAffordanceContentAlignment = v7;
  CGPoint searchAffordanceCenter = self[8].searchAffordanceCenter;
  *(CGSize *)&retstr->backgroundWeighting = self[8].searchAffordanceSize;
  *(CGPoint *)&retstr->searchContentCenter.y = searchAffordanceCenter;
  return self;
}

- (void)setAppliedKeyboardAlignedElementsMetrics:(SBSpotlightPresentationMetrics *)a3
{
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.backgroundWeighting = *(_OWORD *)&a3->backgroundWeighting;
  long long v3 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  long long v5 = *(_OWORD *)&a3->searchContentCenter.y;
  long long v4 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceSize.double height = *(_OWORD *)&a3->searchAffordanceSize.height;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCenter.y = v3;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchContentCenter.y = v5;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceBackgroundAlpha = v4;
  CGPoint keyboardCenter = a3->keyboardCenter;
  long long v8 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  long long v7 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.fullSearchBarSize.double height = *(_OWORD *)&a3->fullSearchBarSize.height;
  self->_appliedKeyboardAlignedElementsMetrics.CGPoint keyboardCenter = keyboardCenter;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceContentAlignment = v8;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCornerRadius = v7;
  long long v10 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  long long v9 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  long long v11 = *(_OWORD *)&a3->keyboardAlpha;
  self->_appliedKeyboardAlignedElementsMetrics.double keyboardVelocity = a3->keyboardVelocity;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardProtectorCenter.y = v10;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.homeAffordanceCenter.y = v9;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardAlpha = v11;
}

- (SBHomeGrabberView)homeAffordance
{
  return self->_homeAffordance;
}

- (void)setHomeAffordance:(id)a3
{
}

- (UIView)searchAffordanceReferenceView
{
  return self->_searchAffordanceReferenceView;
}

- (void)setSearchAffordanceReferenceView:(id)a3
{
}

- (CGRect)searchAffordanceReferenceFrame
{
  double x = self->_searchAffordanceReferenceFrame.origin.x;
  double y = self->_searchAffordanceReferenceFrame.origin.y;
  double width = self->_searchAffordanceReferenceFrame.size.width;
  double height = self->_searchAffordanceReferenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSearchAffordanceReferenceFrame:(CGRect)a3
{
  self->_searchAffordanceReferenceFrame = a3;
}

- (UIView)keyboardView
{
  return self->_keyboardView;
}

- (void)setKeyboardView:(id)a3
{
}

- (BOOL)initializingKeyboardView
{
  return self->_initializingKeyboardView;
}

- (void)setInitializingKeyboardView:(BOOL)a3
{
  self->_initializingKeyboardView = a3;
}

- (BOOL)hasUnifiedKeyboardBackground
{
  return self->_hasUnifiedKeyboardBackground;
}

- (_UIPortalView)keyboardProtectorPortalView
{
  return self->_keyboardProtectorPortalView;
}

- (void)setKeyboardProtectorPortalView:(id)a3
{
}

- (SBSpotlightHostedContentMetrics)hostedContentMetrics
{
  CGSize dockedSearchBarSize = self[28].dockedSearchBarSize;
  *(CGSize *)&retstr->double keyboardHeight = self[28].searchBarSize;
  retstr->CGSize searchBarSize = dockedSearchBarSize;
  retstr->CGSize dockedSearchBarSize = *(CGSize *)&self[28].searchBarCornerRadius;
  retstr->double searchBarCornerRadius = self[29].keyboardProtectorHeight;
  return self;
}

- (void)setHostedContentMetrics:(SBSpotlightHostedContentMetrics *)a3
{
  CGSize searchBarSize = a3->searchBarSize;
  CGSize dockedSearchBarSize = a3->dockedSearchBarSize;
  long long v5 = *(_OWORD *)&a3->keyboardHeight;
  self->_hostedContentMetrics.double searchBarCornerRadius = a3->searchBarCornerRadius;
  self->_hostedContentMetrics.CGSize searchBarSize = searchBarSize;
  self->_hostedContentMetrics.CGSize dockedSearchBarSize = dockedSearchBarSize;
  *(_OWORD *)&self->_hostedContentMetrics.double keyboardHeight = v5;
}

- (_UIPortalView)searchBarPortalView
{
  return self->_searchBarPortalView;
}

- (void)setSearchBarPortalView:(id)a3
{
}

- (_UIPortalView)searchBarBackgroundPortalView
{
  return self->_searchBarBackgroundPortalView;
}

- (void)setSearchBarBackgroundPortalView:(id)a3
{
}

- (UIView)searchBarPortalClippingContainerView
{
  return self->_searchBarPortalClippingContainerView;
}

- (void)setSearchBarPortalClippingContainerView:(id)a3
{
}

- (NSMutableSet)searchBarPortalRequirementReasons
{
  return self->_searchBarPortalRequirementReasons;
}

- (void)setSearchBarPortalRequirementReasons:(id)a3
{
}

- (BOOL)supportsSeparateSearchBarBackground
{
  return self->_supportsSeparateSearchBarBackground;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (void)setPresentationProgress:(double)a3
{
  self->_double presentationProgress = a3;
}

- (double)presentationOffset
{
  return self->_presentationOffset;
}

- (void)setPresentationOffset:(double)a3
{
  self->_double presentationOffset = a3;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_int64_t presentationState = a3;
}

- (int64_t)previousPresentationState
{
  return self->_previousPresentationState;
}

- (void)setPreviousPresentationState:(int64_t)a3
{
  self->_int64_t previousPresentationState = a3;
}

- (int64_t)anticipatedPresentationState
{
  return self->_anticipatedPresentationState;
}

- (void)setAnticipatedPresentationState:(int64_t)a3
{
  self->_int64_t anticipatedPresentationState = a3;
}

- (int64_t)searchAffordancePresentationState
{
  return self->_searchAffordancePresentationState;
}

- (void)setSearchAffordancePresentationState:(int64_t)a3
{
  self->_int64_t searchAffordancePresentationState = a3;
}

- (unint64_t)outstandingAnimationCount
{
  return self->_outstandingAnimationCount;
}

- (void)setOutstandingAnimationCount:(unint64_t)a3
{
  self->_outstandingAnimationCount = a3;
}

- (BOOL)cancellingDismissAnimation
{
  return self->_cancellingDismissAnimation;
}

- (void)setCancellingDismissAnimation:(BOOL)a3
{
  self->_cancellingDismissAnimation = a3;
}

- (UIViewFloatAnimatableProperty)searchContentFadeProperty
{
  return self->_searchContentFadeProperty;
}

- (void)setSearchContentFadeProperty:(id)a3
{
}

- (UIViewFloatAnimatableProperty)searchAffordanceReferenceBackgroundFadeProperty
{
  return self->_searchAffordanceReferenceBackgroundFadeProperty;
}

- (void)setSearchAffordanceReferenceBackgroundFadeProperty:(id)a3
{
}

- (UIViewFloatAnimatableProperty)backgroundBlurProperty
{
  return self->_backgroundBlurProperty;
}

- (void)setBackgroundBlurProperty:(id)a3
{
}

- (BOOL)dismissingFromFullyPresented
{
  return self->_dismissingFromFullyPresented;
}

- (void)setDismissingFromFullyPresented:(BOOL)a3
{
  self->_dismissingFromFullyPresented = a3;
}

- (BOOL)waitingForSearchContentAvailabilityForFadeIn
{
  return self->_waitingForSearchContentAvailabilityForFadeIn;
}

- (void)setWaitingForSearchContentAvailabilityForFadeIn:(BOOL)a3
{
  self->_waitingForSearchContentAvailabilityForFadeIn = a3;
}

- (double)searchContentFadeInStartValue
{
  return self->_searchContentFadeInStartValue;
}

- (void)setSearchContentFadeInStartValue:(double)a3
{
  self->_searchContentFadeInStartValue = a3;
}

- (UIViewFloatAnimatableProperty)keyboardFadeProperty
{
  return self->_keyboardFadeProperty;
}

- (void)setKeyboardFadeProperty:(id)a3
{
}

- (BOOL)waitingForKeyboardPresentationForFadeIn
{
  return self->_waitingForKeyboardPresentationForFadeIn;
}

- (void)setWaitingForKeyboardPresentationForFadeIn:(BOOL)a3
{
  self->_waitingForKeyboardPresentationForFadeIn = a3;
}

- (double)keyboardFadeInStartValue
{
  return self->_keyboardFadeInStartValue;
}

- (void)setKeyboardFadeInStartValue:(double)a3
{
  self->_keyboardFadeInStartValue = a3;
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
}

- (double)spotlightActivationThreshold
{
  return self->_spotlightActivationThreshold;
}

- (void)setSpotlightActivationThreshold:(double)a3
{
  self->_spotlightActivationThreshold = a3;
}

- (double)backgroundInteractiveBlurDistance
{
  return self->_backgroundInteractiveBlurDistance;
}

- (void)setBackgroundInteractiveBlurDistance:(double)a3
{
  self->_backgroundInteractiveBlurDistance = a3;
}

- (SBSpotlightTransitionRange)backgroundBlurRange
{
  double start = self->_backgroundBlurRange.start;
  double end = self->_backgroundBlurRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setBackgroundBlurRange:(SBSpotlightTransitionRange)a3
{
  self->_backgroundBlurRange = a3;
}

- (SBSpotlightTransitionRange)backgroundUnblurRange
{
  double start = self->_backgroundUnblurRange.start;
  double end = self->_backgroundUnblurRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setBackgroundUnblurRange:(SBSpotlightTransitionRange)a3
{
  self->_backgroundUnblurRange = a3;
}

- (double)searchContentInteractiveFadeInDistance
{
  return self->_searchContentInteractiveFadeInDistance;
}

- (void)setSearchContentInteractiveFadeInDistance:(double)a3
{
  self->_searchContentInteractiveFadeInDistance = a3;
}

- (SBSpotlightTransitionRange)searchContentFadeInRange
{
  double start = self->_searchContentFadeInRange.start;
  double end = self->_searchContentFadeInRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchContentFadeInRange:(SBSpotlightTransitionRange)a3
{
  self->_searchContentFadeInRange = a3;
}

- (SBSpotlightTransitionRange)searchContentFadeOutRange
{
  double start = self->_searchContentFadeOutRange.start;
  double end = self->_searchContentFadeOutRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchContentFadeOutRange:(SBSpotlightTransitionRange)a3
{
  self->_searchContentFadeOutRange = a3;
}

- (double)searchAffordanceBackgroundMaterialInteractiveFadeDistance
{
  return self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance;
}

- (void)setSearchAffordanceBackgroundMaterialInteractiveFadeDistance:(double)a3
{
  self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceBackgroundMaterialFadeRange
{
  double start = self->_searchAffordanceBackgroundMaterialFadeRange.start;
  double end = self->_searchAffordanceBackgroundMaterialFadeRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchAffordanceBackgroundMaterialFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceBackgroundMaterialFadeRange = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceContentFadeRange
{
  double start = self->_searchAffordanceContentFadeRange.start;
  double end = self->_searchAffordanceContentFadeRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchAffordanceContentFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceContentFadeRange = a3;
}

- (SBSpotlightTransitionRange)searchBarContentFadeRange
{
  double start = self->_searchBarContentFadeRange.start;
  double end = self->_searchBarContentFadeRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchBarContentFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchBarContentFadeRange = a3;
}

- (BOOL)scalesSearchAffordanceContentWhileFading
{
  return self->_scalesSearchAffordanceContentWhileFading;
}

- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3
{
  self->_scalesSearchAffordanceContentWhileFading = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceScaleAndTranslateRange
{
  double start = self->_searchAffordanceScaleAndTranslateRange.start;
  double end = self->_searchAffordanceScaleAndTranslateRange.end;
  result.double end = end;
  result.double start = start;
  return result;
}

- (void)setSearchAffordanceScaleAndTranslateRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceScaleAndTranslateRange = a3;
}

- (double)searchAffordanceMaxScaleX
{
  return self->_searchAffordanceMaxScaleX;
}

- (void)setSearchAffordanceMaxScaleX:(double)a3
{
  self->_double searchAffordanceMaxScaleX = a3;
}

- (double)searchAffordanceMaxScaleY
{
  return self->_searchAffordanceMaxScaleY;
}

- (void)setSearchAffordanceMaxScaleY:(double)a3
{
  self->_double searchAffordanceMaxScaleY = a3;
}

- (double)searchAffordanceScaleRubberbandingRange
{
  return self->_searchAffordanceScaleRubberbandingRange;
}

- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3
{
  self->_searchAffordanceScaleRubberbandingRange = a3;
}

- (double)searchAffordanceMaxOffset
{
  return self->_searchAffordanceMaxOffset;
}

- (void)setSearchAffordanceMaxOffset:(double)a3
{
  self->_double searchAffordanceMaxOffset = a3;
}

- (double)searchAffordanceOffsetRubberbandingRange
{
  return self->_searchAffordanceOffsetRubberbandingRange;
}

- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3
{
  self->_searchAffordanceOffsetRubberbandingRange = a3;
}

- (double)searchAffordanceTransientFadeInThreshold
{
  return self->_searchAffordanceTransientFadeInThreshold;
}

- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3
{
  self->_searchAffordanceTransientFadeInThreshold = a3;
}

- (double)pullTransitionDistance
{
  return self->_pullTransitionDistance;
}

- (void)setPullTransitionDistance:(double)a3
{
  self->_pullTransitionDistance = a3;
}

- (BOOL)allowsKeyboardWhileInteractive
{
  return self->_allowsKeyboardWhileInteractive;
}

- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractive = a3;
}

- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance
{
  return self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance;
}

- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = a3;
}

- (double)interactiveKeyboardPresentationThreshold
{
  return self->_interactiveKeyboardPresentationThreshold;
}

- (void)setInteractiveKeyboardPresentationThreshold:(double)a3
{
  self->_interactiveKeyboardPresentationThreshold = a3;
}

- (double)interactiveKeyboardPresentationOffset
{
  return self->_interactiveKeyboardPresentationOffset;
}

- (void)setInteractiveKeyboardPresentationOffset:(double)a3
{
  self->_interactiveKeyboardPresentationOffset = a3;
}

- (BOOL)keyboardFollowsSpotlightContent
{
  return self->_keyboardFollowsSpotlightContent;
}

- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3
{
  self->_keyboardFollowsSpotlightContent = a3;
}

- (BOOL)allowsVelocityInjection
{
  return self->_allowsVelocityInjection;
}

- (void)setAllowsVelocityInjection:(BOOL)a3
{
  self->_allowsVelocityInjection = a3;
}

- (BOOL)injectsVelocityOnlyForShortSwipes
{
  return self->_injectsVelocityOnlyForShortSwipes;
}

- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3
{
  self->_injectsVelocityOnlyForShortSwipes = a3;
}

- (double)shortSwipeMaximumPercentageOfExpectedVelocity
{
  return self->_shortSwipeMaximumPercentageOfExpectedVelocity;
}

- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3
{
  self->_shortSwipeMaximumPercentageOfExpectedVelocitdouble y = a3;
}

- (double)injectedPercentageOfGestureVelocity
{
  return self->_injectedPercentageOfGestureVelocity;
}

- (void)setInjectedPercentageOfGestureVelocity:(double)a3
{
  self->_injectedPercentageOfGestureVelocitdouble y = a3;
}

- (double)keyboardInjectedVelocityPercentage
{
  return self->_keyboardInjectedVelocityPercentage;
}

- (void)setKeyboardInjectedVelocityPercentage:(double)a3
{
  self->_keyboardInjectedVelocityPercentage = a3;
}

- (BOOL)injectsVelocityForNonInteractiveTransitions
{
  return self->_injectsVelocityForNonInteractiveTransitions;
}

- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3
{
  self->_injectsVelocityForNonInteractiveTransitions = a3;
}

- (double)injectedVelocityForNonInteractiveTransitions
{
  return self->_injectedVelocityForNonInteractiveTransitions;
}

- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3
{
  self->_double injectedVelocityForNonInteractiveTransitions = a3;
}

- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions
{
  return self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
}

- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3
{
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = a3;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_keyboardFadeProperty, 0);
  objc_storeStrong((id *)&self->_backgroundBlurProperty, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundFadeProperty, 0);
  objc_storeStrong((id *)&self->_searchContentFadeProperty, 0);
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, 0);
  objc_storeStrong((id *)&self->_searchBarPortalClippingContainerView, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundPortalView, 0);
  objc_storeStrong((id *)&self->_searchBarPortalView, 0);
  objc_storeStrong((id *)&self->_keyboardProtectorPortalView, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceBackgroundCapturingView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceContentContainerView, 0);
  objc_storeStrong((id *)&self->_searchAffordance, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_scaleProperty, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_searchBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchTransitionSettings, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end