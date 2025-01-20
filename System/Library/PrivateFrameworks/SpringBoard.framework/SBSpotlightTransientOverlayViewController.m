@interface SBSpotlightTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isReduceMotionOrTransparency;
- (BOOL)_isSpotlightVisible;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)dismissesForCoverSheetPresentation;
- (BOOL)dismissesSiriForPresentation;
- (BOOL)handleHomeButtonPress;
- (BOOL)isContentOpaque;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersWindowHitTestingDisabled;
- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal;
- (BOOL)preventsClippingToBounds;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldPreventDragAndDrop;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (FBSDisplayConfiguration)targetDisplayConfiguration;
- (SBModalUIFluidDismissGestureManager)modalUIDismissGestureManager;
- (SBSpotlightSettings)settings;
- (SBSpotlightTransientOverlayViewController)init;
- (SBSpotlightTransientOverlayViewControllerDelegate)delegate;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UITapGestureRecognizer)tapToDismissGestureRecognizer;
- (UIView)scalingView;
- (id)hostedSceneIdentityTokens;
- (id)keyboardFocusTarget;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)preferredDisplayLayoutElementIdentifier;
- (id)presentationDimmingViewColor;
- (id)sceneDeactivationPredicate;
- (int)_preferredStatusBarVisibility;
- (int64_t)homeAffordanceSuppression;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (unint64_t)animationCount;
- (unint64_t)dismissalSource;
- (unint64_t)presentationSource;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureBlurFilterOnView:(id)a3;
- (void)_handlePanGestureRecognizer:(id)a3;
- (void)_handleTapToDismissGestureRecognizer:(id)a3;
- (void)_setSpotlightAlpha:(double)a3 scale:(double)a4 blurProgress:(double)a5 translation:(CGPoint)a6 withAnimationMode:(int64_t)a7 alongsideAnimationBlock:(id)a8 completion:(id)a9;
- (void)_setSpotlightPresented:(BOOL)a3 withAnimationMode:(int64_t)a4 alongsideAnimationBlock:(id)a5 completion:(id)a6;
- (void)beginInteractivePresentation;
- (void)dealloc;
- (void)dismissSearchView;
- (void)endInteractivePresentation:(BOOL)a3;
- (void)handleGestureDismissal;
- (void)setAnimationCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalSource:(unint64_t)a3;
- (void)setModalUIDismissGestureManager:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPresentationSource:(unint64_t)a3;
- (void)setScalingView:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTapToDismissGestureRecognizer:(id)a3;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)updateInteractivePresentationWithProgress:(double)a3 translation:(double)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBSpotlightTransientOverlayViewController

- (SBSpotlightTransientOverlayViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightTransientOverlayViewController;
  v2 = [(SBSpotlightTransientOverlayViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SBSpotlightDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBSpotlightSettings *)v3;

    v2->_presentationSource = 6;
  }
  return v2;
}

- (void)dealloc
{
  [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController willMoveToParentViewController:0];
  [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController removeFromParentViewController];
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSpotlightTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidAppear:a3];
  v4 = [(SBSpotlightTransientOverlayViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 spotlightTransientOverlayViewControllerDidPresent:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSpotlightTransientOverlayViewController;
  [(SBSpotlightTransientOverlayViewController *)&v5 viewWillDisappear:a3];
  v4 = [(SBSpotlightTransientOverlayViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 spotlightTransientOverlayViewControllerWillDismiss:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SBSpotlightTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v25 viewDidLayoutSubviews];
  objc_super v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setBounds:](self->_scalingView, "setBounds:", v5, v7, v9, v11);
  [(SBSpotlightSettings *)self->_settings anchorPointY];
  double v13 = v12;
  -[UIView setCenter:](self->_scalingView, "setCenter:", v5 + v9 * 0.5, v7 + v11 * v12);
  v14 = [(UIView *)self->_scalingView layer];
  objc_msgSend(v14, "setAnchorPoint:", 0.5, v13);

  v15 = [(SBTransientOverlayViewController *)self backgroundView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:", v17, v19, v21, v23);
  v24 = [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController view];
  objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)SBSpotlightTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v26 viewDidLoad];
  objc_super v3 = [(SBTransientOverlayViewController *)self backgroundView];
  if (([MEMORY[0x1E4FA5E28] enableFloatingWindow] & 1) == 0)
  {
    double v4 = [MEMORY[0x1E4F427D8] effectWithStyle:2];
    double v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v4];
    blurEffectView = self->_blurEffectView;
    self->_blurEffectView = v5;

    [v3 addSubview:self->_blurEffectView];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v8 = [(SBTransientOverlayViewController *)self contentView];
  [v8 bounds];
  double v9 = (UIView *)objc_msgSend(v7, "initWithFrame:");
  scalingView = self->_scalingView;
  self->_scalingView = v9;

  double v11 = [(SBTransientOverlayViewController *)self contentView];
  [v11 addSubview:self->_scalingView];

  double v12 = objc_alloc_init(SBSpotlightTransientOverlaySpotlightViewController);
  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = v12;

  v14 = self->_spotlightViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  [(SBSpotlightMultiplexingViewController *)v14 setTargetDisplayConfiguration:WeakRetained];

  [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController setPresentationSource:self->_presentationSource];
  [(SBSpotlightMultiplexingViewController *)self->_spotlightViewController setSpotlightDelegate:self];
  [(SBSpotlightTransientOverlayViewController *)self addChildViewController:self->_spotlightViewController];
  double v16 = self->_scalingView;
  double v17 = [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController view];
  [(UIView *)v16 addSubview:v17];

  [(SBSpotlightTransientOverlaySpotlightViewController *)self->_spotlightViewController didMoveToParentViewController:self];
  double v18 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handlePanGestureRecognizer_];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v18;

  [(UIPanGestureRecognizer *)self->_panGestureRecognizer setAllowedScrollTypesMask:3];
  double v20 = [(SBSpotlightTransientOverlayViewController *)self view];
  [v20 addGestureRecognizer:self->_panGestureRecognizer];

  double v21 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapToDismissGestureRecognizer_];
  tapToDismissGestureRecognizer = self->_tapToDismissGestureRecognizer;
  self->_tapToDismissGestureRecognizer = v21;

  double v23 = [(SBSpotlightTransientOverlayViewController *)self view];
  [v23 addGestureRecognizer:self->_tapToDismissGestureRecognizer];

  v24 = [(SBSpotlightTransientOverlayViewController *)self view];
  objc_super v25 = [v24 layer];
  [v25 setHitTestsAsOpaque:1];

  [(SBSpotlightTransientOverlayViewController *)self _setSpotlightPresented:0 withAnimationMode:2 alongsideAnimationBlock:0 completion:0];
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v7 = a3;
  double v4 = [(UIViewController *)self _sbWindowScene];
  double v5 = [v4 modalUIFluidDismissGestureManager];

  uint64_t v6 = [v7 state];
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 2)
    {
      [v5 handleGestureChanged:v7];
    }
    else if (v6 == 1)
    {
      [v5 handleGestureBegan:v7 initiatedFromBottomEdge:0];
    }
  }
  else
  {
    [v5 handleGestureEnded:v7];
  }
}

- (void)_handleTapToDismissGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SBSpotlightTransientOverlayViewController *)self dismissSearchView];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return +[SBSpotlightMultiplexingViewController spotlightSupportedInterfaceOrientations];
}

- (BOOL)shouldDisableOrientationUpdates
{
  return [(SBSpotlightTransientOverlayViewController *)self supportedInterfaceOrientations] == 2;
}

- (BOOL)shouldAutorotate
{
  return ![(SBSpotlightTransientOverlayViewController *)self shouldDisableOrientationUpdates];
}

- (int)_preferredStatusBarVisibility
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return 2 * ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained spotlightTransientOverlayViewControllerRequestsDismissal:self];
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBSpotlightTransientOverlayViewController;
    BOOL v4 = [(SBTransientOverlayViewController *)&v6 handleHomeButtonPress];
  }

  return v4;
}

- (void)handleGestureDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained spotlightTransientOverlayViewControllerRequestsDismissal:self];
  }
}

- (id)sceneDeactivationPredicate
{
  v2 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  uint64_t v3 = [v2 sceneIdentifier];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBSpotlightTransientOverlayViewController_sceneDeactivationPredicate__block_invoke;
  v7[3] = &unk_1E6AF9A10;
  id v8 = v3;
  id v4 = v3;
  double v5 = (void *)MEMORY[0x1D948C7A0](v7);

  return v5;
}

uint64_t __71__SBSpotlightTransientOverlayViewController_sceneDeactivationPredicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (id)hostedSceneIdentityTokens
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 4;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 4;
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E4FA6F70];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  uint64_t v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  double v5 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v11[3] = &unk_1E6AF5290;
  id v6 = v3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
  v9[3] = &unk_1E6AFA1B8;
  id v10 = v6;
  id v8 = v6;
  [v5 _setSpotlightPresented:0 withAnimationMode:v4 alongsideAnimationBlock:v11 completion:v9];
}

uint64_t __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performAlongsideTransitions];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setPresentationDimmingAlpha:0.0];
}

uint64_t __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 1416))
  {
    objc_storeStrong((id *)(v6 + 1424), a2);
  }
  else
  {
    if ([v4 isAnimated]) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }
    id v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v11[3] = &unk_1E6AF4AC0;
    id v12 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v9[3] = &unk_1E6AFA1B8;
    id v10 = v12;
    [v8 _setSpotlightPresented:1 withAnimationMode:v7 alongsideAnimationBlock:v11 completion:v9];
  }
}

uint64_t __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAlongsideTransitions];
}

uint64_t __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (BOOL)prefersWindowHitTestingDisabled
{
  return ![(SBSpotlightTransientOverlayViewController *)self _isSpotlightVisible];
}

- (BOOL)dismissesForCoverSheetPresentation
{
  return 1;
}

- (int64_t)homeAffordanceSuppression
{
  return 2;
}

- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal
{
  return 1;
}

- (id)presentationDimmingViewColor
{
  return (id)[MEMORY[0x1E4F428B8] blackColor];
}

- (BOOL)dismissesSiriForPresentation
{
  return 0;
}

- (BOOL)shouldPreventDragAndDrop
{
  return 0;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (BOOL)preventsClippingToBounds
{
  return 1;
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  id v3 = a3;
  id v4 = +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground];
  double v5 = [v4 stringRepresentation];
  char v6 = [v5 isEqualToString:v3];

  return v6;
}

- (id)keyboardFocusTarget
{
  return +[SBSpotlightMultiplexingViewController keyboardFocusTargetIfActiveForeground];
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  unint64_t presentationSource = self->_presentationSource;
  return presentationSource == 1 || presentationSource == 7;
}

- (void)setPresentationSource:(unint64_t)a3
{
  if (self->_presentationSource != a3)
  {
    self->_unint64_t presentationSource = a3;
    -[SBSpotlightTransientOverlaySpotlightViewController setPresentationSource:](self->_spotlightViewController, "setPresentationSource:");
  }
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_targetDisplayConfiguration, obj);
    [(SBSpotlightMultiplexingViewController *)self->_spotlightViewController setTargetDisplayConfiguration:obj];
  }
}

- (void)beginInteractivePresentation
{
  [(SBSpotlightTransientOverlayViewController *)self loadViewIfNeeded];
  self->_presentingInteractively = 1;
  self->_performedAlongsideAnimations = 0;
  id v3 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  [v3 setRevealProgress:0.0];

  [(SBSpotlightTransientOverlayViewController *)self _setSpotlightPresented:0 withAnimationMode:2 alongsideAnimationBlock:0 completion:0];
}

- (void)updateInteractivePresentationWithProgress:(double)a3 translation:(double)a4
{
  uint64_t v7 = self->_settings;
  [(SBSpotlightSettings *)self->_settings hiddenScale];
  double v9 = v8;
  BOOL v10 = [(SBSpotlightTransientOverlayViewController *)self _isSpotlightVisible];
  if ([(SBSpotlightTransientOverlayViewController *)self _isReduceMotionOrTransparency])
  {
    [(SBSpotlightSettings *)v7 minTranslationToShowSpotlight];
    double v12 = 0.0;
    double v9 = 1.0;
    double v13 = fmin(fmax(a4 / v11 + 0.0, 0.0), 1.0);
    [(SBSpotlightSettings *)v7 minTranslationToShowSpotlight];
    long long v29 = 0u;
    uint64_t v30 = v14;
    BYTE8(v29) = 1;
    uint64_t v31 = 1;
    [(SBSpotlightSettings *)v7 spotlightTranslationRubberbandingRange];
    BSUIConstrainValueToIntervalWithRubberBand();
    double v16 = v15;
    [(SBSpotlightSettings *)v7 minTranslationToShowSpotlight];
    double v18 = -(v17 - v16);
    uint64_t v19 = 5;
    double v20 = 0.0;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v10)
    {
      if (a4 <= 0.0)
      {
        [(SBSpotlightSettings *)self->_settings hiddenScale];
        double v9 = v26;
        double v13 = 0.0;
        double v20 = 1.0;
      }
      else
      {
        [(SBSpotlightSettings *)v7 minTranslationToShowSpotlight];
        [(SBSpotlightSettings *)v7 maxTranslationForSpotlightScale];
        double v13 = 1.0;
        [(SBSpotlightSettings *)self->_settings spotlightScaleRubberbandingMin];
        uint64_t v22 = v21;
        [(SBSpotlightSettings *)self->_settings spotlightScaleRubberbandingMax];
        v28[6] = v22;
        v28[8] = v23;
        v28[7] = 1;
        v28[9] = 1;
        [(SBSpotlightSettings *)self->_settings spotlightScaleRubberbandingRange];
        BSUIConstrainValueToIntervalWithRubberBand();
        double v9 = v24;
        double v20 = 0.0;
      }
      uint64_t v19 = 3;
    }
    else
    {
      [(SBSpotlightSettings *)v7 minTranslationToShowSpotlight];
      uint64_t v19 = 3;
      if (v25 >= a4) {
        double v20 = 1.0;
      }
      else {
        double v20 = 0.0;
      }
      if (v25 >= a4) {
        double v13 = 0.0;
      }
      else {
        double v13 = 1.0;
      }
      if (v25 < a4) {
        double v9 = 1.0;
      }
    }
  }
  [(SBTransientOverlayViewController *)self setPresentationDimmingViewHidden:0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __99__SBSpotlightTransientOverlayViewController_updateInteractivePresentationWithProgress_translation___block_invoke;
  v28[3] = &unk_1E6AF4A70;
  *(double *)&v28[5] = a4;
  v28[4] = self;
  -[SBSpotlightTransientOverlayViewController _setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:", v19, v28, 0, v13, v9, v20, v12, v18);
  v27 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  [v27 setRevealProgress:a3];

  if (BSFloatIsOne() && !self->_performedAlongsideAnimations)
  {
    self->_performedAlongsideAnimations = 1;
    [(SBTransientOverlayTransitionContextProviding *)self->_interactivePresentationContextProvider performAlongsideTransitions];
  }
}

uint64_t __99__SBSpotlightTransientOverlayViewController_updateInteractivePresentationWithProgress_translation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1464) maxTranslationForDimmingView];
  [*(id *)(*(void *)(a1 + 32) + 1464) dimmingViewRubberbandingMin];
  uint64_t v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 1464) dimmingViewRubberbandingMax];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1464), "dimmingViewRubberbandingRange", v3, 1, v4, 1);
  BSUIConstrainValueToIntervalWithRubberBand();
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationDimmingAlpha:");
}

- (void)endInteractivePresentation:(BOOL)a3
{
  if (a3) {
    [(SBSpotlightTransientOverlayViewController *)self _setSpotlightPresented:1 withAnimationMode:3 alongsideAnimationBlock:0 completion:0];
  }
  double v5 = +[SBLockScreenManager sharedInstance];
  char v6 = [v5 isUILocked] & a3;

  uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
  double v8 = [(SBSpotlightSettings *)self->_settings opacityAnimationSettings];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke;
  v13[3] = &unk_1E6AF5D38;
  v13[4] = self;
  char v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke_2;
  v11[3] = &unk_1E6AF9080;
  char v12 = v6;
  void v11[4] = self;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v13, v11);

  interactivePresentationContextProvider = self->_interactivePresentationContextProvider;
  if (interactivePresentationContextProvider)
  {
    [(SBTransientOverlayTransitionContextProviding *)interactivePresentationContextProvider completeTransition:1];
    BOOL v10 = self->_interactivePresentationContextProvider;
  }
  else
  {
    BOOL v10 = 0;
  }
  self->_interactivePresentationContextProvider = 0;

  self->_presentingInteractively = 0;
  self->_performedAlongsideAnimations = 0;
}

uint64_t __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [v2[183] dimmingViewRubberbandingMax];
  }
  else {
    double v3 = 0.0;
  }
  uint64_t result = [v2 setPresentationDimmingAlpha:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 1417))
  {
    char v6 = *(void **)(v5 + 1424);
    return [v6 performAlongsideTransitions];
  }
  return result;
}

uint64_t __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke_2(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0 && !*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) setPresentationDimmingViewHidden:1];
  }
  return result;
}

- (BOOL)_isSpotlightVisible
{
  uint64_t v2 = [(SBSpotlightTransientOverlayViewController *)self scalingView];
  [v2 alpha];
  char IsOne = BSFloatIsOne();

  return IsOne;
}

- (BOOL)_isReduceMotionOrTransparency
{
  if (SBReduceMotion()) {
    return 1;
  }
  return SBReduceTransparency();
}

- (void)_configureBlurFilterOnView:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 0.0;
  if (![(SBSpotlightTransientOverlayViewController *)self _isSpotlightVisible])
  {
    [(SBSpotlightSettings *)self->_settings hiddenBlurRadius];
    double v5 = v6;
  }
  uint64_t v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v7 setName:@"gaussianBlur"];
  [v7 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  [v7 setValue:@"low" forKey:@"inputQuality"];
  double v8 = [NSNumber numberWithDouble:v5];
  [v7 setValue:v8 forKey:@"inputRadius"];

  double v9 = [v4 layer];

  v11[0] = v7;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v9 setFilters:v10];
}

- (void)_setSpotlightPresented:(BOOL)a3 withAnimationMode:(int64_t)a4 alongsideAnimationBlock:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v21 = a5;
  id v10 = a6;
  if (v8)
  {
    double v11 = 1.0;
    double v12 = 0.0;
  }
  else
  {
    [(SBSpotlightSettings *)self->_settings hiddenScale];
    double v11 = v13;
    double v12 = 1.0;
  }
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (![(SBSpotlightTransientOverlayViewController *)self _isReduceMotionOrTransparency])goto LABEL_13; {
  if (a4 == 3)
  }
  {
    uint64_t v16 = 1456;
LABEL_9:
    if (*(Class *)((char *)&self->super.super.super.super.isa + v16) == (Class)6)
    {
      double v11 = 1.0;
      double v12 = 0.0;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a4 == 2)
  {
    uint64_t v16 = 1448;
    goto LABEL_9;
  }
LABEL_11:
  double v11 = 1.0;
  double v12 = 0.0;
  if (!v8)
  {
    [(SBSpotlightSettings *)self->_settings minTranslationToShowSpotlight];
    double v14 = -v17;
    double v15 = 0.0;
  }
LABEL_13:
  if (!self->_presentingInteractively)
  {
    double v18 = +[SBLockScreenManager sharedInstance];
    int v19 = [v18 isUILocked];

    if (v19) {
      [(SBTransientOverlayViewController *)self setPresentationDimmingViewHidden:0];
    }
  }
  double v20 = 0.0;
  if (v8) {
    double v20 = 1.0;
  }
  -[SBSpotlightTransientOverlayViewController _setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:", a4, v21, v10, v20, v11, v12, v15, v14);
}

- (void)_setSpotlightAlpha:(double)a3 scale:(double)a4 blurProgress:(double)a5 translation:(CGPoint)a6 withAnimationMode:(int64_t)a7 alongsideAnimationBlock:(id)a8 completion:(id)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v17 = a8;
  id v18 = a9;
  if ([MEMORY[0x1E4FA5E28] enableFloatingWindow])
  {
    int v19 = self->_settings;
    BOOL v20 = [(SBSpotlightTransientOverlayViewController *)self prefersWindowHitTestingDisabled];
    id v21 = [(SBSpotlightTransientOverlayViewController *)self scalingView];
    if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL
      && !self->_animationCount
      && ![(SBSpotlightTransientOverlayViewController *)self _isReduceMotionOrTransparency])
    {
      [(SBSpotlightTransientOverlayViewController *)self _configureBlurFilterOnView:v21];
    }
    ++self->_animationCount;
    uint64_t v22 = (void *)MEMORY[0x1E4FA5E48];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_3;
    v33[3] = &unk_1E6B03E60;
    v33[4] = self;
    double v37 = a3;
    uint64_t v23 = v19;
    int64_t v38 = a7;
    v34 = v23;
    id v36 = v17;
    id v35 = v21;
    double v39 = a5;
    double v40 = a4;
    CGFloat v41 = x;
    CGFloat v42 = y;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_6;
    v30[3] = &unk_1E6AF5580;
    v30[4] = self;
    id v31 = v35;
    id v32 = v18;
    id v24 = v18;
    id v25 = v17;
    id v26 = v35;
    [v22 perform:v33 finalCompletion:v30];
    if (v20 != [(SBSpotlightTransientOverlayViewController *)self prefersWindowHitTestingDisabled])[(SBTransientOverlayViewController *)self setNeedsWindowHitTestingUpdate]; {
  }
    }
  else
  {
    v27 = (void *)MEMORY[0x1E4F42FF0];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke;
    v45[3] = &unk_1E6AF76F8;
    double v47 = a3;
    v45[4] = self;
    id v46 = v17;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_2;
    v43[3] = &unk_1E6AF5A50;
    id v44 = v18;
    id v28 = v18;
    id v29 = v17;
    [v27 animateWithDuration:v45 animations:v43 completion:0.2];
  }
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:*(double *)(a1 + 48)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 1448) == 6 && (BSFloatIsOne() & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 40) snappyOpacityAnimationSettings];
    uint64_t v5 = [*(id *)(a1 + 40) snappyScaleAnimationSettings];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) opacityAnimationSettings];
    uint64_t v5 = [*(id *)(a1 + 40) scaleAnimationSettings];
  }
  double v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v8 = *(void *)(a1 + 72);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_4;
  v17[3] = &unk_1E6B03E38;
  v17[4] = *(void *)(a1 + 32);
  id v20 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 80);
  double v9 = v3[2](v3, @"opacity");
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v4, v8, v17, v9);

  id v10 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v11 = *(void *)(a1 + 72);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_5;
  v13[3] = &unk_1E6B012E0;
  uint64_t v15 = *(void *)(a1 + 88);
  long long v16 = *(_OWORD *)(a1 + 96);
  id v14 = *(id *)(a1 + 48);
  double v12 = v3[2](v3, @"scale");
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v6, v11, v13, v12);
}

void __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 1416))
  {
    uint64_t v2 = +[SBLockScreenManager sharedInstance];
    int v3 = [v2 isUILocked];

    if (v3)
    {
      id v4 = *(id **)(a1 + 32);
      [v4[183] dimmingViewRubberbandingMax];
      objc_msgSend(v4, "setPresentationDimmingAlpha:");
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 64)];
  id v9 = [*(id *)(a1 + 40) layer];
  double v6 = NSNumber;
  [*(id *)(a1 + 48) hiddenBlurRadius];
  uint64_t v8 = [v6 numberWithDouble:v7 * *(double *)(a1 + 72)];
  [v9 setValue:v8 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_5(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v9.c = v2;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v3 = *(double *)(a1 + 40);
  *(_OWORD *)&v8.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&v8.c = v2;
  *(_OWORD *)&v8.tCGFloat x = *(_OWORD *)&v9.tx;
  CGAffineTransformScale(&v9, &v8, v3, v3);
  CGFloat v4 = *(double *)(a1 + 48);
  CGFloat v5 = *(double *)(a1 + 56);
  CGAffineTransform v7 = v9;
  CGAffineTransformTranslate(&v8, &v7, v4, v5);
  CGAffineTransform v9 = v8;
  return [*(id *)(a1 + 32) setTransform:&v8];
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_6(uint64_t a1)
{
  if (!--*(void *)(*(void *)(a1 + 32) + 1480))
  {
    long long v2 = [*(id *)(a1 + 40) layer];
    [v2 setFilters:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    CGFloat v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)dismissSearchView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained spotlightTransientOverlayViewControllerRequestsDismissal:self];
  }
}

- (SBSpotlightTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSpotlightTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  return (FBSDisplayConfiguration *)WeakRetained;
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (unint64_t)dismissalSource
{
  return self->_dismissalSource;
}

- (void)setDismissalSource:(unint64_t)a3
{
  self->_dismissalSource = a3;
}

- (SBSpotlightSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (UIView)scalingView
{
  return self->_scalingView;
}

- (void)setScalingView:(id)a3
{
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (SBModalUIFluidDismissGestureManager)modalUIDismissGestureManager
{
  return self->_modalUIDismissGestureManager;
}

- (void)setModalUIDismissGestureManager:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modalUIDismissGestureManager, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactivePresentationContextProvider, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
}

@end