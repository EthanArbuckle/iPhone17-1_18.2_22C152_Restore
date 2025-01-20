@interface SBElasticValueViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_changeValue:(float)a3;
- (BOOL)_computeCachedRouteDisplayInformation;
- (BOOL)_isStateChangeAllowedFrom:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)definesAnimatedDismissal;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isHUDAttached;
- (BOOL)isSliderTracking;
- (BOOL)updateActiveRouteDisplay:(id *)a3;
- (CGPoint)centerForElasticHUDWhenInInteractingState;
- (CGPoint)centerForState:(int64_t)a3 sliderSize:(CGSize)a4 bounds:(CGRect)a5;
- (CGPoint)positionOffset;
- (CGSize)maximumSizeForSlider;
- (CGSize)sizeForState:(int64_t)a3;
- (NSArray)physicalButtonSceneTargets;
- (SBElasticHUDSettings)settings;
- (SBElasticSliderView)sliderView;
- (SBElasticValueDataSource)dataSource;
- (SBElasticValueViewController)initWithCoder:(id)a3;
- (SBElasticValueViewController)initWithDataSource:(id)a3;
- (SBElasticValueViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBElasticValueViewControllerDelegate)delegate;
- (SBHUDAttachmentDelegate)attachmentDelegate;
- (double)glyphScaleForState:(int64_t)a3;
- (double)interactiveValueUpdateDiscontinuityInterval;
- (float)currentValue;
- (id)createSliderView;
- (id)overrideDisplayNameForRoute:(id)a3;
- (id)sliderAccessibilityIdentifier;
- (int64_t)hudPresentationOrientation;
- (int64_t)triggerButton;
- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4;
- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4 transitioningStateContextuallyIfNecessary:(BOOL)a5;
- (unint64_t)attachmentIgnoredOrientations;
- (unint64_t)axis;
- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_actuallyDismiss;
- (void)_animateFromState:(int64_t)a3 toState:(int64_t)a4 primaryAnimations:(id)a5 primaryCompletion:(id)a6 positionAnimations:(id)a7 positionCompletion:(id)a8 finalCompletion:(id)a9;
- (void)_beginDeflationDismissalAnimation;
- (void)_debugAutoDismissalSwitchValueChanged:(id)a3;
- (void)_debugChangingStateFromSegmentedControl:(id)a3;
- (void)_debugDidTapNextRoute:(id)a3;
- (void)_debugDidTapResetRoute:(id)a3;
- (void)_debugDimensionSliderValueDidChange:(id)a3;
- (void)_debugDump:(id)a3;
- (void)_debugLockStateSwitchValueChanged:(id)a3;
- (void)_dismissalTimerFired:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_handleShortLongPressGestureRecognizer:(id)a3;
- (void)_invalidateDismissalTimerForReason:(id)a3;
- (void)_noteSliderViewDidBeginTracking;
- (void)_noteSliderViewDidEndTracking;
- (void)_reduceMotionStatusDidChange;
- (void)_refreshDebugUI:(BOOL)a3;
- (void)_reloadData;
- (void)_scheduleDismissal:(id)a3;
- (void)_scheduleDismissal:(id)a3 afterInterval:(double)a4;
- (void)_sliderEditingDidBegin:(id)a3;
- (void)_sliderEditingDidEnd:(id)a3;
- (void)_sliderIndirectInputDidBegin:(id)a3;
- (void)_sliderIndirectInputDidEnd:(id)a3;
- (void)_sliderValueDidChange:(id)a3;
- (void)_sliderViewMetricsUpdatersForState:(int64_t)a3 bounds:(CGRect)a4 primaryMetricsUpdater:(id *)a5 positionUpdater:(id *)a6;
- (void)_startMonitoringForSliderVisiblyOffscreen;
- (void)_stopMonitoringForSliderVisiblyOffscreen;
- (void)_updateDebugString:(id)a3;
- (void)_updateDebugUIPositions;
- (void)_updateDimmingVisible:(BOOL)a3;
- (void)_updateForAxisChange:(unint64_t)a3;
- (void)_updateGlyphStateIfNecessaryForValue:(float *)a3;
- (void)_updateLabelsForAxis:(unint64_t)a3;
- (void)_updateLiveRenderingAssertion;
- (void)_updateSliderTracking;
- (void)_updateSliderViewMetricsForState:(int64_t)a3 bounds:(CGRect)a4;
- (void)_updateSliderWithAxis:(unint64_t)a3;
- (void)_updateTouchTrackingArea;
- (void)changeValue:(float)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)dismissAnimatedWithCompletion:(id)a3;
- (void)loadView;
- (void)reloadData;
- (void)setAttachmentDelegate:(id)a3;
- (void)setButtonStepCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHUDAttached:(BOOL)a3;
- (void)setPositionOffset:(CGPoint)a3;
- (void)setupFailureRelationshipForGestureRecognizer:(id)a3;
- (void)transitionStateContextuallyForValueChangeEvent;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateValue:(float)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBElasticValueViewController

- (SBElasticValueViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBElasticValueViewController.m", 148, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBElasticValueViewController;
  v6 = [(SBElasticValueViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_previousState = -1;
    v6->_state = -1;
    v6->_axis = 0;
    objc_storeWeak((id *)&v6->_dataSource, v5);
    uint64_t v8 = +[SBElasticHUDDomain rootSettings];
    settings = v7->_settings;
    v7->_settings = (SBElasticHUDSettings *)v8;

    [(PTSettings *)v7->_settings addKeyObserver:v7];
    v7->_isDebugging = [(SBElasticHUDSettings *)v7->_settings showDebugUI];
    v7->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v7 action:sel__handleShortLongPressGestureRecognizer_];
    shortLongPressGestureRecognizer = v7->_shortLongPressGestureRecognizer;
    v7->_shortLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v10;

    [(UILongPressGestureRecognizer *)v7->_shortLongPressGestureRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v7->_shortLongPressGestureRecognizer setDelegate:v7];
  }

  return v7;
}

- (SBElasticValueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBElasticValueViewController.m" lineNumber:171 description:@"Use -initWithDataSource: instead."];

  return [(SBElasticValueViewController *)self initWithDataSource:0];
}

- (SBElasticValueViewController)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBElasticValueViewController.m" lineNumber:176 description:@"Use -initWithDataSource: instead."];

  return [(SBElasticValueViewController *)self initWithDataSource:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setOpaque:0];
  [(SBElasticValueViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)SBElasticValueViewController;
  [(SBElasticValueViewController *)&v59 viewDidLoad];
  id v3 = [(SBElasticValueViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v4, v6, v8, v10);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v12;

  [(UIView *)self->_dimmingView setAutoresizingMask:18];
  objc_super v14 = [(UIView *)self->_dimmingView layer];
  [v14 setAllowsHitTesting:0];

  [v3 addSubview:self->_dimmingView];
  if (self->_isDebugging)
  {
    v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v5, v7, v9, v11);
    debugContainerView = self->_debugContainerView;
    self->_debugContainerView = v15;

    [v3 addSubview:self->_debugContainerView];
  }
  v17 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v5, v7, v9, v11);
  sliderContainerView = self->_sliderContainerView;
  self->_sliderContainerView = v17;

  v54 = v3;
  [v3 addSubview:self->_sliderContainerView];
  v19 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  [(SBElasticValueViewController *)self _computeCachedRouteDisplayInformation];
  [(SBElasticHUDSettings *)self->_settings legibilityStrength];
  double v21 = v20;
  id v22 = objc_alloc(MEMORY[0x1E4F43220]);
  v23 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] systemFontSize];
  v24 = objc_msgSend(v23, "boldSystemFontOfSize:");
  v25 = (_UILegibilityLabel *)[v22 initWithSettings:v19 strength:@"  " string:v24 font:v21];
  leadingLabel = self->_leadingLabel;
  self->_leadingLabel = v25;

  id v27 = objc_alloc(MEMORY[0x1E4F43220]);
  v28 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] systemFontSize];
  v29 = objc_msgSend(v28, "boldSystemFontOfSize:");
  v30 = (_UILegibilityLabel *)[v27 initWithSettings:v19 strength:@"  " string:v29 font:v21];
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v30;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v32 = self->_trailingLabel;
  v60[0] = self->_leadingLabel;
  v60[1] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        [v38 setAlpha:0.0];
        [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v35);
  }

  v39 = [(SBElasticValueViewController *)self createSliderView];
  sliderView = self->_sliderView;
  self->_sliderView = v39;

  [(SBFTouchPassThroughView *)self->_sliderContainerView addSubview:self->_sliderView];
  v41 = self->_sliderView;
  v42 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo glyphImage];
  [(CCUIBaseSliderView *)v41 setGlyphImage:v42];

  v43 = self->_sliderView;
  v44 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo glyphPackage];
  [(CCUIBaseSliderView *)v43 setGlyphPackageDescription:v44];

  v45 = self->_sliderView;
  [(SBElasticValueViewController *)self currentValue];
  -[CCUIBaseSliderView setValue:animated:](v45, "setValue:animated:", 0);
  v46 = self->_sliderView;
  v47 = [(SBElasticValueViewController *)self sliderAccessibilityIdentifier];
  [(SBElasticSliderView *)v46 setAccessibilityIdentifier:v47];

  [(SBElasticSliderView *)self->_sliderView setLeadingAccessoryView:self->_leadingLabel];
  [(SBElasticSliderView *)self->_sliderView setTrailingAccessoryView:self->_trailingLabel];
  v48 = self->_sliderView;
  [(SBElasticHUDSettings *)self->_settings labelPadding];
  -[SBElasticSliderView setAccessoryViewPadding:](v48, "setAccessoryViewPadding:");
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderEditingDidBegin_ forControlEvents:0x10000];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderValueDidChange_ forControlEvents:4096];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderEditingDidEnd_ forControlEvents:0x40000];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderIndirectInputDidBegin_ forControlEvents:*MEMORY[0x1E4F5AD58]];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderIndirectInputDidEnd_ forControlEvents:*MEMORY[0x1E4F5AD60]];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderTrackingDidBegin_ forControlEvents:1];
  [(SBElasticSliderView *)self->_sliderView addTarget:self action:sel__sliderTrackingDidEnd_ forControlEvents:448];
  id v49 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v50 = (UIView *)objc_msgSend(v49, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  touchTrackingView = self->_touchTrackingView;
  self->_touchTrackingView = v50;

  [(UIView *)self->_touchTrackingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v52 = [(UIView *)self->_touchTrackingView layer];
  [v52 setHitTestsAsOpaque:1];

  [(SBFTouchPassThroughView *)self->_sliderContainerView insertSubview:self->_touchTrackingView atIndex:0];
  [(SBElasticSliderView *)self->_sliderView addGestureRecognizer:self->_shortLongPressGestureRecognizer];
  v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v53 addObserver:self selector:sel__reduceMotionStatusDidChange name:*MEMORY[0x1E4F43478] object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43478] object:0];

  [(SBElasticValueViewController *)self _stopMonitoringForSliderVisiblyOffscreen];
  [(SBElasticValueViewController *)self _refreshDebugUI:1];
  v4.receiver = self;
  v4.super_class = (Class)SBElasticValueViewController;
  [(SBElasticValueViewController *)&v4 dealloc];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SBElasticValueViewController;
  [(SBElasticValueViewController *)&v14 viewWillLayoutSubviews];
  id v3 = [(SBElasticValueViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5 + self->_positionOffset.x;
  double v13 = v7 + self->_positionOffset.y;
  -[SBFTouchPassThroughView setFrame:](self->_sliderContainerView, "setFrame:", v12, v13, v9, v11);
  -[UIView setFrame:](self->_debugContainerView, "setFrame:", v12, v13, v9, v11);
}

- (void)setPositionOffset:(CGPoint)a3
{
  if (a3.x != self->_positionOffset.x || a3.y != self->_positionOffset.y)
  {
    self->_positionOffset = a3;
    id v4 = [(SBElasticValueViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  double v5 = [(SBElasticValueViewController *)self view];
  double v6 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138412546;
    objc_super v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);
  }
  [(SBElasticValueViewController *)self _updateLiveRenderingAssertion];
  [(SBElasticValueViewController *)self _updateGlyphStateIfNecessaryForValue:0];
  double v8 = (void *)MEMORY[0x1E4F42FF0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SBElasticValueViewController_viewWillAppear___block_invoke;
  v10[3] = &unk_1E6AF4AC0;
  id v11 = v5;
  id v9 = v5;
  [v8 performWithoutAnimation:v10];
}

uint64_t __47__SBElasticValueViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBElasticValueViewController;
  [(SBElasticValueViewController *)&v11 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    self->_axis = 0;
    unint64_t v6 = [(SBElasticValueViewController *)self axis];
    double v7 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = _SBFLoggingMethodProem();
      id v9 = (void *)v8;
      if (v6 > 2) {
        double v10 = @"both";
      }
      else {
        double v10 = off_1E6AFEB90[v6];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "%@ axis: %@", buf, 0x16u);
    }
    [(SBElasticValueViewController *)self _updateForAxisChange:v6];
    if (self->_state == -1) {
      [(SBElasticValueViewController *)self transitionToState:0 animated:0 completion:0];
    }
  }
  else
  {
    [(SBElasticValueViewController *)self _stopMonitoringForSliderVisiblyOffscreen];
  }
  [(SBElasticValueViewController *)self _updateLiveRenderingAssertion];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  double v5 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138412546;
    id v9 = v6;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);
  }
  [(SBElasticValueViewController *)self _refreshDebugUI:0];
  [(SBElasticValueViewController *)self transitionToState:1 animated:1 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  double v5 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138412546;
    __int16 v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);
  }
  objc_super v7 = [(SBElasticValueViewController *)self view];
  [v7 setAlpha:0.0];

  [(SBElasticValueViewController *)self _updateLiveRenderingAssertion];
  [(SBElasticValueViewController *)self _actuallyDismiss];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewWillTransitionToSize:withTransitionCoordinator:](&v47, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = _SBFLoggingMethodProem();
    v55.double width = width;
    v55.double height = height;
    __int16 v10 = NSStringFromSize(v55);
    *(_DWORD *)buf = 138412802;
    id v49 = v9;
    __int16 v50 = 2112;
    v51 = v10;
    __int16 v52 = 2112;
    id v53 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%@ size:%@ coordinator:%@", buf, 0x20u);
  }
  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"viewWillTransitionToSize:withTranisitionCoordinator:"];
  self->_isRotating = 1;
  state = (void *)self->_state;
  BSRectWithSize();
  uint64_t v13 = v12;
  __int16 v15 = v14;
  uint64_t v17 = v16;
  v19 = v18;
  double v20 = [(SBElasticValueViewController *)self layoutAxisForInterfaceOrientation:[(SBElasticValueViewController *)self _rotatingToInterfaceOrientation]];
  BOOL v21 = v20 != (void *)[(SBElasticValueViewController *)self axis];
  id v22 = self->_sliderContainerView;
  v23 = self->_sliderView;
  objc_initWeak((id *)buf, self);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v44[3] = &unk_1E6AFE890;
  objc_copyWeak(v46, (id *)buf);
  v24 = v23;
  v45 = v24;
  v46[1] = v20;
  v46[2] = state;
  v46[3] = v13;
  v46[4] = v15;
  v46[5] = v17;
  v46[6] = v19;
  v25 = (void *)MEMORY[0x1D948C7A0](v44);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v35[3] = &unk_1E6AFE8B8;
  v35[4] = self;
  v38 = v13;
  v39 = v15;
  v40 = v17;
  v41 = v19;
  BOOL v43 = v21;
  v26 = v22;
  uint64_t v36 = v26;
  id v27 = v25;
  id v37 = v27;
  v42 = state;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v30[3] = &unk_1E6AFE8E0;
  objc_copyWeak(v33, (id *)buf);
  BOOL v34 = v21;
  id v28 = v27;
  id v32 = v28;
  v33[1] = v20;
  v29 = v26;
  v31 = v29;
  v33[2] = state;
  [v7 animateAlongsideTransition:v35 completion:v30];

  objc_destroyWeak(v33);
  objc_destroyWeak(v46);
  objc_destroyWeak((id *)buf);
}

void __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) _removeAllRetargetableAnimations:1];
  [WeakRetained _updateForAxisChange:*(void *)(a1 + 48)];
  objc_msgSend(WeakRetained, "_updateSliderViewMetricsForState:bounds:", *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

uint64_t __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 40) setAlpha:0.0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v2 = [*(id *)(a1 + 32) attachmentDelegate];
    [v2 updateAttachmentStateForHUDViewController:*(void *)(a1 + 32)];
  }
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = *(void *)(a1 + 88) == 3;
  return [v3 _updateDimmingVisible:v4];
}

void __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1091) = 0;
    if (*((void *)WeakRetained + 124))
    {
      if (*(unsigned char *)(a1 + 72)) {
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:*(void *)(a1 + 40)];
      }
      [v3 _updateLabelsForAxis:*(void *)(a1 + 56)];
      if (*(unsigned char *)(a1 + 72))
      {
        BOOL v4 = (void *)MEMORY[0x1E4F42FF0];
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
        v6[3] = &unk_1E6AF4AC0;
        id v7 = *(id *)(a1 + 32);
        [v4 animateWithDuration:v6 animations:0.2];
        double v5 = [v3 attachmentDelegate];
        [v5 updateAttachmentStateForHUDViewController:v3];
      }
      [v3 _updateTouchTrackingArea];
      if (*(void *)(a1 + 64) != 3 || ([v3 isSliderTracking] & 1) == 0) {
        [v3 _scheduleDismissal:@"Rotation"];
      }
    }
    else
    {
      [WeakRetained _actuallyDismiss];
    }
  }
}

uint64_t __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_reduceMotionStatusDidChange
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
}

- (void)setButtonStepCount:(unint64_t)a3
{
  [(SBElasticValueViewController *)self loadViewIfNeeded];
  if (objc_opt_respondsToSelector())
  {
    sliderView = self->_sliderView;
    [(CCUIBaseSliderView *)sliderView setButtonInputStepCount:a3];
  }
}

- (void)updateValue:(float)a3
{
  if (![(SBElasticValueViewController *)self isSliderTracking])
  {
    if ([(SBElasticValueViewController *)self isViewLoaded]) {
      uint64_t v6 = [(SBElasticValueViewController *)self bs_isAppearingOrAppeared];
    }
    else {
      uint64_t v6 = 0;
    }
    *(float *)&double v5 = a3;
    [(SBElasticValueViewController *)self _updateSliderValue:v6 animated:v5];
  }
}

- (void)reloadData
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(SBElasticValueViewController *)self _computeCachedRouteDisplayInformation])
  {
    unint64_t v3 = [(SBElasticValueViewController *)self axis];
    BOOL v4 = self->_initialTransitionCompleted
      && [(SBElasticValueViewController *)self _appearState] == 2
      && (self->_state & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__SBElasticValueViewController_reloadData__block_invoke;
    v24[3] = &unk_1E6AF4AC0;
    v24[4] = self;
    double v5 = (void (**)(void))MEMORY[0x1D948C7A0](v24);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__SBElasticValueViewController_reloadData__block_invoke_2;
    v23[3] = &unk_1E6AF4A70;
    v23[4] = self;
    v23[5] = v3;
    uint64_t v6 = (void *)MEMORY[0x1D948C7A0](v23);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__SBElasticValueViewController_reloadData__block_invoke_3;
    v22[3] = &unk_1E6AF4AC0;
    v22[4] = self;
    id v7 = (void *)MEMORY[0x1D948C7A0](v22);
    if (v4)
    {
      objc_super v8 = (void *)MEMORY[0x1E4F42FF0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __42__SBElasticValueViewController_reloadData__block_invoke_4;
      v21[3] = &unk_1E6AF4AC0;
      v21[4] = self;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42__SBElasticValueViewController_reloadData__block_invoke_5;
      v15[3] = &unk_1E6AFE908;
      v15[4] = self;
      uint64_t v16 = v5;
      uint64_t v19 = 0x3FE6666666666666;
      uint64_t v20 = 6;
      id v17 = v7;
      id v18 = v6;
      [v8 animateWithDuration:65542 delay:v21 options:v15 animations:0.1 completion:0.0];

      id v9 = v16;
    }
    else
    {
      v5[2](v5);
      __int16 v10 = (void *)MEMORY[0x1E4F42FF0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__SBElasticValueViewController_reloadData__block_invoke_8;
      v12[3] = &unk_1E6AF6BD0;
      id v13 = v7;
      id v14 = v6;
      [v10 performWithoutAnimation:v12];

      id v9 = v13;
    }

    __int16 v11 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v26 = v4;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Refreshing route UI animated: %{BOOL}u...", buf, 8u);
    }
  }
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 1272);
  BOOL v4 = [*(id *)(v2 + 1200) glyphImage];
  [v3 setGlyphImage:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 1272);
  id v7 = [*(id *)(v5 + 1200) glyphPackage];
  [v6 setGlyphPackageDescription:v7];

  objc_super v8 = *(void **)(a1 + 32);
  return [v8 _updateGlyphStateIfNecessaryForValue:0];
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLabelsForAxis:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1272);
  return [v2 layoutIfNeeded];
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = (void *)v2[159];
  [v2 glyphScaleForState:v2[124]];
  objc_msgSend(v3, "setAdditiveGlyphScaleFactor:");
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 1272);
  return [v4 layoutIfNeeded];
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1272) additiveGlyphScaleFactor];
  [*(id *)(*(void *)(a1 + 32) + 1272) setAdditiveGlyphScaleFactor:v2 * 0.875];
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1272);
  return [v3 layoutIfNeeded];
}

void __42__SBElasticValueViewController_reloadData__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(*(void *)(a1 + 32) + 1272) layoutIfNeeded];
  double v2 = (void *)MEMORY[0x1E4F42FF0];
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__SBElasticValueViewController_reloadData__block_invoke_6;
  v10[3] = &unk_1E6AF5300;
  id v11 = *(id *)(a1 + 48);
  [v2 animateWithDuration:v4 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:v3 options:0.0 animations:0.5 completion:0.0];
  uint64_t v5 = (void *)MEMORY[0x1E4F42FF0];
  double v6 = *(double *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SBElasticValueViewController_reloadData__block_invoke_7;
  v8[3] = &unk_1E6AF5300;
  id v9 = *(id *)(a1 + 56);
  [v5 animateWithDuration:v7 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:v6 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)setupFailureRelationshipForGestureRecognizer:(id)a3
{
  id v4 = a3;
  [v4 requireGestureRecognizerToFail:self->_shortLongPressGestureRecognizer];
  uint64_t v5 = [(SBElasticValueViewController *)self log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    uint64_t v7 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBElasticValueViewController setupFailureRelationshipForGestureRecognizer:]((uint64_t)v4, v7);
    }
  }
}

- (CGPoint)centerForElasticHUDWhenInInteractingState
{
  double v3 = [(SBElasticValueViewController *)self sliderView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  [(SBFTouchPassThroughView *)self->_sliderContainerView bounds];
  -[SBElasticValueViewController centerForState:sliderSize:bounds:](self, "centerForState:sliderSize:bounds:", 3, v5, v7, v8, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBElasticValueViewController.m" lineNumber:507 description:@"Subclasses must implement this method and should not call super."];

  return 0;
}

- (id)overrideDisplayNameForRoute:(id)a3
{
  return 0;
}

- (double)interactiveValueUpdateDiscontinuityInterval
{
  return 0.0;
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)createSliderView
{
  double v2 = [SBElasticSliderView alloc];
  double v3 = -[SBElasticSliderView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CCUIBaseSliderView *)v3 setShouldScaleWithButtonInput:1];
  return v3;
}

- (id)sliderAccessibilityIdentifier
{
  return @"sb-unspecified-elastic-hud";
}

- (NSArray)physicalButtonSceneTargets
{
  return 0;
}

- (BOOL)definesAnimatedDismissal
{
  return 1;
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBElasticValueViewController_dismissAnimatedWithCompletion___block_invoke;
  v6[3] = &unk_1E6AFE930;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBElasticValueViewController *)self transitionToState:0 animated:1 completion:v6];
}

uint64_t __62__SBElasticValueViewController_dismissAnimatedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a4) {
    int v6 = 0;
  }
  else {
    int v6 = a5;
  }
  if (v6 == 1) {
    [*(id *)(a1 + 32) _actuallyDismiss];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (int64_t)triggerButton
{
  return 0;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 0;
}

- (BOOL)isHUDAttached
{
  return self->_isHUDAttached;
}

- (void)setHUDAttached:(BOOL)a3
{
  self->_isHUDAttached = a3;
  id v4 = [(SBElasticValueViewController *)self attachmentDelegate];
  [v4 updateAttachmentStateForHUDViewController:self];
}

- (float)currentValue
{
  double v3 = [(SBElasticValueViewController *)self dataSource];
  [v3 elasticValueViewControllerCurrentValue:self];
  float v5 = v4;

  return v5;
}

- (void)changeValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[SBElasticValueViewController _changeValue:](self, "_changeValue:"))
  {
    *(float *)&double v7 = a3;
    [(SBElasticValueViewController *)self _updateSliderValue:v4 animated:v7];
  }
  else
  {
    double v8 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Data source rejected updateCurrentValue; skipping...",
        v9,
        2u);
    }
  }
}

- (BOOL)_changeValue:(float)a3
{
  BOOL v4 = self;
  float v5 = [(SBElasticValueViewController *)self dataSource];
  *(float *)&double v6 = a3;
  LOBYTE(v4) = [v5 elasticValueViewController:v4 updateCurrentValue:v6];

  return (char)v4;
}

- (unint64_t)axis
{
  unint64_t result = self->_axis;
  if (!result)
  {
    unint64_t result = [(SBElasticValueViewController *)self layoutAxisForInterfaceOrientation:[(SBElasticValueViewController *)self hudPresentationOrientation]];
    self->_axis = result;
  }
  return result;
}

- (int64_t)hudPresentationOrientation
{
  double v2 = [(SBElasticValueViewController *)self viewIfLoaded];
  double v3 = [v2 window];

  if (v3)
  {
    int64_t v4 = [v3 interfaceOrientation];
  }
  else
  {
    float v5 = SBLogCommon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6) {
      NSLog(&cfstr_ThisIsnTTheWor.isa);
    }
    int64_t v4 = 1;
  }

  return v4;
}

- (void)transitionStateContextuallyForValueChangeEvent
{
  if ([(SBElasticValueViewController *)self _appearState] == 2)
  {
    if (self->_state || self->_initialTransitionCompleted) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    [(SBElasticValueViewController *)self transitionToState:v3 animated:1 completion:0];
  }
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int64_t state = self->_state;
  if ([(SBElasticValueViewController *)self _isStateChangeAllowedFrom:state toState:a3])
  {
    if (self->_lockState)
    {
      if (a3) {
        goto LABEL_38;
      }
      BOOL v55 = v5;
      uint64_t v62 = (void (**)(void, void, void, void, void))v8;
      a3 = 1;
    }
    else
    {
      BOOL v55 = v5;
      uint64_t v62 = (void (**)(void, void, void, void, void))v8;
    }
    double v10 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(state + 1) > 5) {
        double v11 = @"Invalid state";
      }
      else {
        double v11 = off_1E6AFEBD8[state + 1];
      }
      if ((unint64_t)(a3 + 1) > 5) {
        double v12 = @"Invalid state";
      }
      else {
        double v12 = off_1E6AFEBD8[a3 + 1];
      }
      *(_DWORD *)buf = 138543618;
      v105 = v11;
      __int16 v106 = 2114;
      v107 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to transition from %{public}@ -> %{public}@", buf, 0x16u);
    }

    self->_previousState = state;
    self->_int64_t state = a3;
    objc_initWeak((id *)buf, self);
    double v13 = self;
    double v14 = v13;
    if (state) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = a3 == 1;
    }
    if (v15)
    {
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke;
      v103[3] = &unk_1E6AF4AC0;
      v103[4] = v13;
      double v17 = (void *)MEMORY[0x1D948C7A0](v103);
      id v18 = v102;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      uint64_t v19 = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_93;
    }
    else
    {
      if (state == -1 || a3 != 0)
      {
        id v53 = 0;
        double v17 = 0;
        goto LABEL_28;
      }
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_94;
      v101[3] = &unk_1E6AF4AC0;
      v101[4] = v13;
      double v17 = (void *)MEMORY[0x1D948C7A0](v101);
      id v18 = v100;
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      uint64_t v19 = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_95;
    }
    v18[2] = v19;
    v18[3] = &unk_1E6AF4AC0;
    v18[4] = v14;
    id v53 = (void *)MEMORY[0x1D948C7A0]();
LABEL_28:
    uint64_t v20 = v14->_debugStateSegmentedControl;
    BOOL v21 = v14->_leadingLabel;
    id v22 = v14->_trailingLabel;
    v60 = [(SBElasticValueViewController *)v14 sliderView];
    v23 = [(SBElasticValueViewController *)v14 axis];
    long long v56 = v22;
    location = v21;
    id v49 = v20;
    [(SBFTouchPassThroughView *)v14->_sliderContainerView bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    LOBYTE(v20) = v14->_reduceMotionEnabled;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_96;
    v98[3] = &unk_1E6AFE958;
    objc_copyWeak(&v99, (id *)buf);
    id v32 = (void *)MEMORY[0x1D948C7A0](v98);
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2;
    v96[3] = &unk_1E6AFE980;
    objc_copyWeak(&v97, (id *)buf);
    v51 = (void *)MEMORY[0x1D948C7A0](v96);
    uint64_t v95 = 0;
    uint64_t v94 = 0;
    -[SBElasticValueViewController _sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:](v14, "_sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:", a3, &v95, &v94, v25, v27, v29, v31);
    v33 = (void *)MEMORY[0x1D948C7A0](v95);
    BOOL v34 = (void *)MEMORY[0x1D948C7A0](v94);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3;
    v86[3] = &unk_1E6AFE9A8;
    objc_copyWeak(v92, (id *)buf);
    id v43 = v17;
    id v88 = v43;
    v92[1] = (id)state;
    v92[2] = (id)a3;
    id v35 = v32;
    id v89 = v35;
    v92[3] = v23;
    char v93 = (char)v20;
    id v36 = v33;
    id v90 = v36;
    id v37 = v60;
    id v87 = v37;
    id v38 = v34;
    id v91 = v38;
    objc_super v59 = (void (**)(void))MEMORY[0x1D948C7A0](v86);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_102;
    v77[3] = &unk_1E6AFE9D0;
    objc_copyWeak(v85, (id *)buf);
    v85[1] = (id)state;
    v85[2] = (id)a3;
    id v46 = v37;
    id v78 = v46;
    v79 = v14;
    id v48 = v36;
    id v82 = v48;
    id v47 = v35;
    id v83 = v47;
    v85[3] = v23;
    id v39 = v51;
    id v84 = v39;
    v45 = v56;
    v80 = v45;
    v44 = location;
    v81 = v44;
    v61 = (void *)MEMORY[0x1D948C7A0](v77);
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_104;
    v73[3] = &unk_1E6AFE9F8;
    objc_copyWeak(v76, (id *)buf);
    id v57 = v38;
    id v74 = v57;
    id v52 = v39;
    id v75 = v52;
    v76[1] = (id)a3;
    v76[2] = v23;
    v40 = (void *)MEMORY[0x1D948C7A0](v73);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3_105;
    v71[3] = &unk_1E6AFEA20;
    objc_copyWeak(v72, (id *)buf);
    v72[1] = (id)state;
    v41 = (void (**)(void))MEMORY[0x1D948C7A0](v71);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_4;
    v67[3] = &unk_1E6AFEA48;
    objc_copyWeak(v70, (id *)buf);
    v70[1] = (id)state;
    v70[2] = (id)a3;
    __int16 v50 = v49;
    v68 = v50;
    id v54 = v53;
    id v69 = v54;
    v42 = (void (**)(void))MEMORY[0x1D948C7A0](v67);
    if (state == -1
      || a3
      || ![(SBElasticValueViewController *)v14 bs_isAppearingOrAppeared])
    {
      [(SBElasticValueViewController *)v14 _stopMonitoringForSliderVisiblyOffscreen];
    }
    else
    {
      [(SBElasticValueViewController *)v14 _startMonitoringForSliderVisiblyOffscreen];
    }
    v59[2]();
    if (v55)
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_111;
      v63[3] = &unk_1E6AFEA70;
      v64 = v42;
      objc_copyWeak(v66, (id *)buf);
      v65 = v62;
      v66[1] = (id)state;
      v66[2] = (id)a3;
      [(SBElasticValueViewController *)v14 _animateFromState:state toState:a3 primaryAnimations:v61 primaryCompletion:&__block_literal_global_110 positionAnimations:v40 positionCompletion:v41 finalCompletion:v63];

      objc_destroyWeak(v66);
    }
    else
    {
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v61];
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v40];
      v41[2](v41);
      v42[2](v42);
      if (v62) {
        v62[2](v62, state, a3, self->_state, 1);
      }
    }

    objc_destroyWeak(v70);
    objc_destroyWeak(v72);

    objc_destroyWeak(v76);
    objc_destroyWeak(v85);

    objc_destroyWeak(v92);
    objc_destroyWeak(&v97);

    objc_destroyWeak(&v99);
    objc_destroyWeak((id *)buf);
    id v8 = v62;
    goto LABEL_38;
  }
  if (v8) {
    (*((void (**)(id, int64_t, int64_t, int64_t, void))v8 + 2))(v8, state, a3, self->_state, 0);
  }
LABEL_38:
}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  double v2 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_PRESENT_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBElasticValueViewControllerWillPresentNotificationName" object:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) setHUDAttached:0];
}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_93(uint64_t a1)
{
  double v2 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_PRESENT_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBElasticValueViewControllerDidPresentNotificationName" object:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) setHUDAttached:1];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_94(uint64_t a1)
{
  double v2 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_DISMISS_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBElasticValueViewControllerWillDismissNotificationName" object:*(void *)(a1 + 32)];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_95(uint64_t a1)
{
  double v2 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_DISMISS_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBElasticValueViewControllerDidDismissNotificationName" object:*(void *)(a1 + 32)];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_96(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLabelsForAxis:a2];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTouchTrackingArea];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    int64_t v4 = [WeakRetained log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *(void *)(a1 + 80) + 1;
      if (v5 > 5) {
        BOOL v6 = @"Invalid state";
      }
      else {
        BOOL v6 = off_1E6AFEBD8[v5];
      }
      unint64_t v7 = *(void *)(a1 + 88) + 1;
      if (v7 > 5) {
        id v8 = @"Invalid state";
      }
      else {
        id v8 = off_1E6AFEBD8[v7];
      }
      int v9 = 138543618;
      double v10 = v6;
      __int16 v11 = 2114;
      double v12 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) preAnimations", (uint8_t *)&v9, 0x16u);
    }

    [WeakRetained _invalidateDismissalTimerForReason:@"transitionToState pre-animations"];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (*(unsigned char *)(a1 + 104) && !*(void *)(a1 + 80))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      [*(id *)(a1 + 32) layoutIfNeeded];
    }
  }
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v4 = [WeakRetained log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *(void *)(a1 + 96) + 1;
      if (v5 > 5) {
        BOOL v6 = @"Invalid state";
      }
      else {
        BOOL v6 = off_1E6AFEBD8[v5];
      }
      unint64_t v7 = *(void *)(a1 + 104) + 1;
      if (v7 > 5) {
        id v8 = @"Invalid state";
      }
      else {
        id v8 = off_1E6AFEBD8[v7];
      }
      int v22 = 138543618;
      v23 = v6;
      __int16 v24 = 2114;
      double v25 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) animations", (uint8_t *)&v22, 0x16u);
    }

    [v3 _updateDimmingVisible:*(void *)(a1 + 104) == 3];
    uint64_t v9 = *(void *)(a1 + 104);
    if (v9 == 2)
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (v9) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = *(void *)(a1 + 96) == 2;
      }
      uint64_t v10 = !v11;
    }
    [*(id *)(a1 + 32) setGlyphVisible:v10];
    double v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 1264);
    if (*(void *)(a1 + 104) == 3) {
      [v13 interactingStretchAmount];
    }
    else {
      [v13 compactStretchAmount];
    }
    objc_msgSend(v12, "setElasticContentStretchAmount:");
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    double v14 = *(void **)(a1 + 48);
    if (*(void *)(a1 + 112))
    {
      if (*(void *)(a1 + 104) == 3) {
        double v15 = 1.0;
      }
      else {
        double v15 = 0.0;
      }
      [v14 setAlpha:v15];
      double v16 = *(void **)(a1 + 56);
      if (*(void *)(a1 + 104) == 3) {
        double v17 = 1.0;
      }
      else {
        double v17 = 0.0;
      }
    }
    else
    {
      [v14 setAlpha:0.0];
      double v16 = *(void **)(a1 + 56);
      double v17 = 0.0;
    }
    [v16 setAlpha:v17];
    uint64_t v18 = *(void *)(a1 + 104);
    if (v18) {
      [*(id *)(a1 + 32) setShadowMode:v18 == 2];
    }
    [*(id *)(a1 + 32) layoutIfNeeded];
    if (v3[1092])
    {
      uint64_t v19 = *(void *)(a1 + 104);
      if (!v19 || !*(void *)(a1 + 96))
      {
        if (v19) {
          double v20 = 1.0;
        }
        else {
          double v20 = 0.0;
        }
        BOOL v21 = [v3 view];
        [v21 setAlpha:v20];
      }
    }
  }
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_104(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3_105(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained[1088];
    if (*(void *)(a1 + 40))
    {
      if (WeakRetained[1088]) {
        goto LABEL_8;
      }
    }
    else
    {
      WeakRetained[1088] = 1;
      if (v3) {
        goto LABEL_8;
      }
    }
    if (*((void *)WeakRetained + 124) == 1)
    {
      WeakRetained[1088] = 1;
      int64_t v4 = WeakRetained;
      [WeakRetained _beginDeflationDismissalAnimation];
      id WeakRetained = v4;
    }
  }
LABEL_8:
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v4 = [WeakRetained log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *(void *)(a1 + 56) + 1;
      if (v5 > 5) {
        BOOL v6 = @"Invalid state";
      }
      else {
        BOOL v6 = off_1E6AFEBD8[v5];
      }
      unint64_t v7 = *(void *)(a1 + 64) + 1;
      if (v7 > 5) {
        id v8 = @"Invalid state";
      }
      else {
        id v8 = off_1E6AFEBD8[v7];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v6;
      __int16 v27 = 2114;
      double v28 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) postAnimations", buf, 0x16u);
    }

    uint64_t v9 = *(void *)(a1 + 64);
    if (v9 && v9 != 3 && ([v3[132] isValid] & 1) == 0 && v3[124] == *(id *)(a1 + 64))
    {
      [v3[158] postTransitionDismissalInterval];
      double v11 = v10;
      unint64_t v12 = *(void *)(a1 + 56) + 1;
      if (v12 > 5) {
        uint64_t v13 = @"Invalid state";
      }
      else {
        uint64_t v13 = off_1E6AFEBD8[v12];
      }
      unint64_t v14 = *(void *)(a1 + 64) + 1;
      if (v14 > 5) {
        double v15 = @"Invalid state";
      }
      else {
        double v15 = off_1E6AFEBD8[v14];
      }
      double v16 = [NSString stringWithFormat:@"Transition from %@ -> %@", v13, v15];
      [v3 _scheduleDismissal:v16 afterInterval:v11];
    }
    [v3 _updateDebugUIPositions];
    double v17 = *(void **)(a1 + 32);
    if (v17)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F42FF0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_110;
      v22[3] = &unk_1E6AF4A70;
      id v19 = v17;
      uint64_t v20 = *(void *)(a1 + 64);
      id v23 = v19;
      uint64_t v24 = v20;
      [v18 performWithoutAnimation:v22];
    }
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(void))(v21 + 16))();
    }
  }
}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_110(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedSegmentIndex:*(void *)(a1 + 40)];
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_111(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v5 = WeakRetained;
  if (WeakRetained) {
    uint64_t v6 = *((void *)WeakRetained + 124);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = v5;
    (*(void (**)(uint64_t, void, void, uint64_t, uint64_t))(v7 + 16))(v7, *(void *)(a1 + 56), *(void *)(a1 + 64), v6, a2);
    unint64_t v5 = v8;
  }
}

- (void)_animateFromState:(int64_t)a3 toState:(int64_t)a4 primaryAnimations:(id)a5 primaryCompletion:(id)a6 positionAnimations:(id)a7 positionCompletion:(id)a8 finalCompletion:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = [(SBElasticValueViewController *)self settings];
  uint64_t v21 = v20;
  BOOL v34 = v19;
  id v35 = (void *)a4;
  if (!a3 && a4 == 1)
  {
    int v22 = objc_msgSend(v20, "baseToInitialTransitionSettings", v19);
    uint64_t v23 = [v21 baseToInitialPositionSettings];
    goto LABEL_12;
  }
  if (a3 == 1 && a4 == 4)
  {
    uint64_t v24 = objc_msgSend(v20, "deflationTransitionSettings", v19);
    goto LABEL_7;
  }
  if (a3 != 4 || a4)
  {
    if (a4)
    {
      id v25 = 0;
      goto LABEL_17;
    }
    if (a3 == 2 && !self->_reduceMotionEnabled)
    {
      uint64_t v24 = objc_msgSend(v20, "compactToBaseTransitionSettings", v19);
    }
    else
    {
      uint64_t v24 = objc_msgSend(v20, "generalToBaseTransitionSettings", v19);
    }
LABEL_7:
    int v22 = (void *)v24;
    id v25 = 0;
    if (v24) {
      goto LABEL_13;
    }
LABEL_17:
    int v22 = objc_msgSend(v21, "defaultTransitionSettings", v34);
    if (v25) {
      goto LABEL_14;
    }
LABEL_18:
    id v25 = v22;
    goto LABEL_14;
  }
  int v22 = objc_msgSend(v20, "deflatingToBaseTransitionSettings", v19);
  uint64_t v23 = [v21 deflatingToBasePositionSettings];
LABEL_12:
  id v25 = (id)v23;
  if (!v22) {
    goto LABEL_17;
  }
LABEL_13:
  if (!v25) {
    goto LABEL_18;
  }
LABEL_14:
  CAFrameRateRange v48 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v22, "setFrameRateRange:highFrameRateReason:", 1114141, *(double *)&v48.minimum, *(double *)&v48.maximum, *(double *)&v48.preferred);
  CAFrameRateRange v49 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v25, "setFrameRateRange:highFrameRateReason:", 1114141, *(double *)&v49.minimum, *(double *)&v49.maximum, *(double *)&v49.preferred);
  objc_initWeak(location, self);
  uint64_t v26 = (void *)MEMORY[0x1E4FA5E48];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke;
  v39[3] = &unk_1E6AFEAC0;
  id v27 = v22;
  id v40 = v27;
  uint64_t v46 = 3;
  id v28 = v15;
  id v42 = v28;
  id v29 = v16;
  id v43 = v29;
  id v30 = v25;
  id v41 = v30;
  id v31 = v17;
  id v44 = v31;
  id v32 = v18;
  id v45 = v32;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_4;
  v36[3] = &unk_1E6AFEAE8;
  objc_copyWeak(v38, location);
  id v33 = v34;
  id v37 = v33;
  v38[1] = v35;
  [v26 perform:v39 finalCompletion:v36];

  objc_destroyWeak(v38);
  objc_destroyWeak(location);
}

void __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke(uint64_t a1, void (**a2)(id, __CFString *))
{
  int64_t v4 = a2 + 2;
  int v3 = (void (*)(void))a2[2];
  unint64_t v5 = a2;
  uint64_t v6 = v3();
  uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 80);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_2;
  v21[3] = &unk_1E6AFEA98;
  uint64_t v10 = *(void *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v23 = v6;
  id v11 = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, v9, v10, v21);
  unint64_t v12 = (*v4)(v5, @"positionAnimations");

  uint64_t v13 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_3;
  v18[3] = &unk_1E6AFEA98;
  uint64_t v16 = *(void *)(a1 + 80);
  id v19 = *(id *)(a1 + 72);
  id v20 = v12;
  id v17 = v12;
  objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v14, v16, v15, v18);
}

uint64_t __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = *((void *)WeakRetained + 124);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 == *(void *)(a1 + 48));
}

- (BOOL)_isStateChangeAllowedFrom:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isRotating)
  {
    uint64_t v7 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 + 1) > 5) {
        uint64_t v8 = @"Invalid state";
      }
      else {
        uint64_t v8 = off_1E6AFEBD8[a3 + 1];
      }
      if ((unint64_t)(a4 + 1) > 5) {
        id v11 = @"Invalid state";
      }
      else {
        id v11 = off_1E6AFEBD8[a4 + 1];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      id v23 = v11;
      unint64_t v12 = "Denying state change from %{public}@ -> %{public}@; no state changes while rotating.";
LABEL_34:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (a3 == a4)
  {
    uint64_t v7 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"Null";
      switch(a3)
      {
        case -1:
          break;
        case 0:
          uint64_t v9 = @"Base";
          break;
        case 1:
          uint64_t v9 = @"Initial";
          break;
        case 2:
          uint64_t v9 = @"Compact";
          break;
        case 3:
          uint64_t v9 = @"Interacting";
          break;
        case 4:
          uint64_t v9 = @"Deflated";
          break;
        default:
          uint64_t v9 = @"Invalid state";
          break;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      id v23 = v9;
      unint64_t v12 = "Denying state change from %{public}@ -> %{public}@; this is the same state.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (a3 == -1 && a4)
  {
    uint64_t v7 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 + 1) > 5) {
        uint64_t v10 = @"Invalid state";
      }
      else {
        uint64_t v10 = off_1E6AFEBA8[a4 + 1];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = @"Null";
      __int16 v22 = 2114;
      id v23 = v10;
      unint64_t v12 = "Denying state change from %{public}@ -> %{public}@; NULL can only transition to base.";
      goto LABEL_34;
    }
LABEL_35:
    BOOL v13 = 0;
    goto LABEL_36;
  }
  if (!a3)
  {
    uint64_t v14 = [(SBElasticValueViewController *)self delegate];
    id v19 = 0;
    char v15 = [v14 elasticValueViewControllerCanBePresented:self withReason:&v19];
    uint64_t v7 = v19;

    if (v15)
    {
      BOOL v13 = 1;
LABEL_36:

      return v13;
    }
    uint64_t v16 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 + 1) > 5) {
        id v17 = @"Invalid state";
      }
      else {
        id v17 = off_1E6AFEBD8[a4 + 1];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = @"Base";
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Denying state change from %{public}@ -> %{public}@; presentation disallowed by delegate with reason: %{public}@",
        buf,
        0x20u);
    }

    goto LABEL_35;
  }
  return 1;
}

- (void)_beginDeflationDismissalAnimation
{
  if (!self->_reduceMotionEnabled)
  {
    [(SBElasticValueViewController *)self transitionToState:4 animated:1 completion:0];
    [(SBElasticHUDSettings *)self->_settings deflationDismissalInterval];
    -[SBElasticValueViewController _scheduleDismissal:afterInterval:](self, "_scheduleDismissal:afterInterval:", @"Deflation");
  }
}

- (void)_startMonitoringForSliderVisiblyOffscreen
{
  if (!self->_displayLinkForVisiblyOffscreenMonitoring)
  {
    uint64_t v3 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Started monitoring for being visibly offscreen", v8, 2u);
    }

    id v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
    displayLinkForVisiblyOffscreenMonitoring = self->_displayLinkForVisiblyOffscreenMonitoring;
    self->_displayLinkForVisiblyOffscreenMonitoring = v4;

    uint64_t v6 = self->_displayLinkForVisiblyOffscreenMonitoring;
    uint64_t v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_stopMonitoringForSliderVisiblyOffscreen
{
  if (self->_displayLinkForVisiblyOffscreenMonitoring)
  {
    uint64_t v3 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Stopped monitoring for being visibly offscreen", v5, 2u);
    }

    [(CADisplayLink *)self->_displayLinkForVisiblyOffscreenMonitoring invalidate];
    displayLinkForVisiblyOffscreenMonitoring = self->_displayLinkForVisiblyOffscreenMonitoring;
    self->_displayLinkForVisiblyOffscreenMonitoring = 0;
  }
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self->_state) {
    return;
  }
  id v4 = [(SBElasticValueViewController *)self sliderView];
  unint64_t v5 = [v4 layer];
  [v5 position];
  [v5 bounds];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [v5 presentationModifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v7)
  {

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  id v44 = self;
  id v45 = v4;
  char v9 = 0;
  uint64_t v10 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v48 != v10) {
        objc_enumerationMutation(v6);
      }
      unint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      BOOL v13 = [v12 keyPath];
      int v14 = [v13 isEqual:@"position"];

      if (v14)
      {
        char v15 = [v12 value];
        [v15 CGPointValue];
        char v9 = 1;
      }
      else
      {
        uint64_t v16 = [v12 keyPath];
        int v17 = [v16 isEqual:@"bounds"];

        if (!v17) {
          continue;
        }
        char v15 = [v12 value];
        [v15 CGRectValue];
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
  }
  while (v8);

  id v4 = v45;
  if (v9)
  {
    SBUnintegralizedRectCenteredAboutPoint();
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [v45 shadowOutsets];
    CGFloat v27 = v19 + v26;
    CGFloat v29 = v21 + v28;
    CGFloat v31 = v23 - (v26 + v30);
    CGFloat v33 = v25 - (v28 + v32);
    BOOL v34 = [(SBElasticValueViewController *)v44 view];
    [v34 bounds];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    v53.origin.x = v27;
    v53.origin.y = v29;
    v53.size.double width = v31;
    v53.size.double height = v33;
    v54.origin.x = v36;
    v54.origin.y = v38;
    v54.size.double width = v40;
    v54.size.double height = v42;
    if (!CGRectIntersectsRect(v53, v54))
    {
      id v43 = [(SBElasticValueViewController *)v44 log];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "Dismissing immediately due to being visibly offscreen in the base state", buf, 2u);
      }

      [(SBElasticValueViewController *)v44 _actuallyDismiss];
    }
  }
LABEL_20:
}

- (void)_scheduleDismissal:(id)a3
{
  id v7 = a3;
  id v4 = [(SBElasticValueViewController *)self settings];
  [v4 dismissalInterval];
  double v6 = v5;

  [(SBElasticValueViewController *)self _scheduleDismissal:v7 afterInterval:v6];
}

- (void)_scheduleDismissal:(id)a3 afterInterval:(double)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v18 = a4;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_scheduleDismissal after %fs: %{public}@", buf, 0x16u);
  }

  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"SCHEDULING NEW DISMISSAL TIMER"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
  char v15 = @"DismissalReason";
  id v16 = v6;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v10 = [v8 timerWithTimeInterval:self target:sel__dismissalTimerFired_ selector:v9 userInfo:0 repeats:a4];
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = v10;

  unint64_t v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v12 addTimer:self->_dismissalTimer forMode:*MEMORY[0x1E4F1C4B0]];

  BOOL v13 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = self->_dismissalTimer;
    *(_DWORD *)buf = 138543362;
    double v18 = *(double *)&v14;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "_scheduleDismissal's new timer: %{public}@", buf, 0xCu);
  }
}

- (void)_invalidateDismissalTimerForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSTimer *)self->_dismissalTimer userInfo];
    id v7 = [v6 objectForKey:@"DismissalReason"];
    dismissalTimer = self->_dismissalTimer;
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = dismissalTimer;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_invalidateDismissalTimer; (original dismissal timer reason: '%{public}@') -- invalidating %{public}@ for reason '%{public}@'",
      (uint8_t *)&v10,
      0x20u);
  }
  [(NSTimer *)self->_dismissalTimer invalidate];
  char v9 = self->_dismissalTimer;
  self->_dismissalTimer = 0;
}

- (void)_dismissalTimerFired:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v5 = (NSTimer *)a3;
  id v6 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dismissalTimer = self->_dismissalTimer;
    uint64_t v8 = [(NSTimer *)dismissalTimer userInfo];
    char v9 = [v8 objectForKey:@"DismissalReason"];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = dismissalTimer;
    __int16 v22 = 2114;
    double v23 = v9;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; (original dismissal timer reason: '%{public}@')",
      buf,
      0x16u);
  }
  if (self->_dismissalTimer != v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBElasticValueViewController.m", 1089, @"Invalid parameter not satisfying: %@", @"timer == _dismissalTimer" object file lineNumber description];
  }
  if ([(SBElasticValueViewController *)self isSliderTracking]
    || self->_sliderIsEditing
    || self->_lockState)
  {
    [(SBElasticValueViewController *)self _scheduleDismissal:@"We're tracking / expanded; deferring dismissal timer fire."];
    int v10 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_dismissalTimer;
      BOOL v12 = [(SBElasticValueViewController *)self isSliderTracking];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 1024;
      LODWORD(v23) = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; aborting dismissal; tracking state has us locked down. (isSliderTracking:%{BOOL"
        "}u, _lockState:{BOOL}u",
        buf,
        0x12u);
    }
  }
  else
  {
    BOOL v13 = [(NSTimer *)v5 userInfo];
    int v10 = [v13 objectForKey:@"DismissalReason"];

    [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"DISMISSAL TIMER FIRED; CLEANUP ANY RESIDUAL STATE"];
    objc_initWeak(&location, self);
    __int16 v14 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; transitioning to base state for dismissal",
        buf,
        0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__SBElasticValueViewController__dismissalTimerFired___block_invoke;
    v16[3] = &unk_1E6AFEB10;
    objc_copyWeak(&v18, &location);
    int v17 = v5;
    [(SBElasticValueViewController *)self transitionToState:0 animated:1 completion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __53__SBElasticValueViewController__dismissalTimerFired___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v9 = WeakRetained;
  if (WeakRetained && a5)
  {
    int v10 = [WeakRetained log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; transitioned to base state for dismissal.",
        (uint8_t *)&v18,
        0xCu);
    }

    if (a4)
    {
      BOOL v12 = [v9 log];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v13;
      __int16 v14 = "_dismissalTimerFired:%{public}@; dismissal was cancelled.  Bailing.";
    }
    else
    {
      id v15 = [v9 settings];
      int v16 = [v15 autoDismiss];

      if (v16) {
        [v9 _actuallyDismiss];
      }
      v9[1088] = 0;
      BOOL v12 = [v9 log];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v17;
      __int16 v14 = "_dismissalTimerFired:%{public}@; dismissal complete.  Mission Accomplished.";
    }
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_actuallyDismiss
{
  [(SBElasticValueViewController *)self _stopMonitoringForSliderVisiblyOffscreen];
  uint64_t v3 = [(SBElasticValueViewController *)self delegate];
  [v3 elasticValueViewControllerNeedsDismissal:self];

  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"actually dismissing"];
  id v4 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "_actuallyDismiss -- actually dismissing.", v5, 2u);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_state != 0;
}

- (void)_handleShortLongPressGestureRecognizer:(id)a3
{
  if (self->_shortLongPressGestureRecognizer == a3)
  {
    uint64_t v4 = [a3 state];
    if (v4 != 2)
    {
      if (v4 == 1)
      {
        [(SBElasticValueViewController *)self _noteSliderViewDidBeginTracking];
        [(SBElasticValueViewController *)self transitionToState:3 animated:1 completion:0];
      }
      else
      {
        [(SBElasticValueViewController *)self _noteSliderViewDidEndTracking];
      }
    }
  }
}

- (void)_sliderEditingDidBegin:(id)a3
{
  id v4 = a3;
  self->_sliderIsEditing = 1;
  [(SBElasticValueViewController *)self noteContinuousValueInteractionWillBegin];
  if (!self->_sliderApplyValueTimer)
  {
    [(SBElasticValueViewController *)self interactiveValueUpdateDiscontinuityInterval];
    double v6 = v5;
    objc_initWeak(&location, self);
    id v7 = (void *)MEMORY[0x1E4F1CB00];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SBElasticValueViewController__sliderEditingDidBegin___block_invoke;
    v10[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v11, &location);
    uint64_t v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:v10 block:v6];
    sliderApplyValueTimer = self->_sliderApplyValueTimer;
    self->_sliderApplyValueTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __55__SBElasticValueViewController__sliderEditingDidBegin___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isValid])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v4 = (void *)WeakRetained[134];
      if (v4)
      {
        id v7 = WeakRetained;
        id v5 = v4;
        [v5 floatValue];
        objc_msgSend(v7, "_changeValue:");
        double v6 = (void *)v7[134];
        v7[134] = 0;

        id WeakRetained = v7;
      }
    }
  }
}

- (void)_sliderValueDidChange:(id)a3
{
  [a3 value];
  int v5 = v4;
  -[SBElasticValueViewController _updateSliderValue:animated:](self, "_updateSliderValue:animated:", 1);
  LODWORD(v6) = v5;
  id v7 = [NSNumber numberWithFloat:v6];
  pendingValueToApply = self->_pendingValueToApply;
  self->_pendingValueToApply = v7;
}

- (void)_sliderIndirectInputDidBegin:(id)a3
{
  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"Button Input Began"];
  if (self->_isRotating)
  {
    int v4 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "_sliderDidReceiveButtonInput: -- skipping; we're rotating.",
        buf,
        2u);
    }
  }
  else if (![(SBElasticValueViewController *)self isSliderTracking])
  {
    int v5 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "(_sliderIndirectInputDidBegin) Slider not tracking; forcing contextual transition to state 1 or 2",
        v6,
        2u);
    }

    [(SBElasticValueViewController *)self transitionStateContextuallyForValueChangeEvent];
  }
}

- (void)_sliderIndirectInputDidEnd:(id)a3
{
  if (self->_initialTransitionCompleted) {
    [(SBElasticValueViewController *)self _scheduleDismissal:@"Button Input Ended"];
  }
}

- (void)_sliderEditingDidEnd:(id)a3
{
  [(NSTimer *)self->_sliderApplyValueTimer invalidate];
  sliderApplyValueTimer = self->_sliderApplyValueTimer;
  self->_sliderApplyValueTimer = 0;

  pendingValueToApply = self->_pendingValueToApply;
  if (pendingValueToApply)
  {
    double v6 = pendingValueToApply;
    [(NSNumber *)v6 floatValue];
    -[SBElasticValueViewController changeValue:animated:](self, "changeValue:animated:", 1);
    id v7 = self->_pendingValueToApply;
    self->_pendingValueToApply = 0;
  }
  self->_sliderIsEditing = 0;
  [(SBElasticValueViewController *)self noteContinuousValueInteractionDidEnd];
  [(SBElasticValueViewController *)self currentValue];
  -[SBElasticValueViewController _updateSliderValue:animated:transitioningStateContextuallyIfNecessary:](self, "_updateSliderValue:animated:transitioningStateContextuallyIfNecessary:", 1, 0);
}

- (BOOL)isSliderTracking
{
  return self->_sliderTrackingCount != 0;
}

- (void)_noteSliderViewDidBeginTracking
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBElasticValueViewController *)self isSliderTracking];
  ++self->_sliderTrackingCount;
  int v4 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t sliderTrackingCount = self->_sliderTrackingCount;
    int v6 = 134217984;
    unint64_t v7 = sliderTrackingCount;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "_noteSliderViewDidBeginTracking: %lu", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != [(SBElasticValueViewController *)self isSliderTracking]) {
    [(SBElasticValueViewController *)self _updateSliderTracking];
  }
}

- (void)_noteSliderViewDidEndTracking
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_sliderTrackingCount)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBElasticValueViewController.m" lineNumber:1264 description:@"_sliderTrackingCount overflow"];
  }
  BOOL v3 = [(SBElasticValueViewController *)self isSliderTracking];
  unint64_t sliderTrackingCount = self->_sliderTrackingCount;
  if (sliderTrackingCount) {
    self->_unint64_t sliderTrackingCount = sliderTrackingCount - 1;
  }
  int v5 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = self->_sliderTrackingCount;
    int v9 = 134217984;
    unint64_t v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_noteSliderViewDidEndTracking: %lu", (uint8_t *)&v9, 0xCu);
  }

  if (v3 != [(SBElasticValueViewController *)self isSliderTracking]) {
    [(SBElasticValueViewController *)self _updateSliderTracking];
  }
}

- (void)_updateSliderTracking
{
  BOOL v3 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_updateSliderTracking", v5, 2u);
  }

  if (![(SBElasticValueViewController *)self isSliderTracking]
    && (unint64_t)(self->_state + 1) >= 2)
  {
    if (self->_previousState == 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(SBElasticValueViewController *)self transitionToState:v4 animated:1 completion:0];
  }
}

- (void)_reloadData
{
  self->_isDebugging = [(SBElasticHUDSettings *)self->_settings showDebugUI];
  int64_t state = self->_state;
  [(SBFTouchPassThroughView *)self->_sliderContainerView bounds];
  -[SBElasticValueViewController _updateSliderViewMetricsForState:bounds:](self, "_updateSliderViewMetricsForState:bounds:", state);
  [(SBElasticHUDSettings *)self->_settings legibilityStrength];
  double v5 = v4;
  -[_UILegibilityLabel setStrength:](self->_trailingLabel, "setStrength:");
  [(_UILegibilityLabel *)self->_leadingLabel setStrength:v5];
  BOOL v6 = self->_state == 3;
  [(SBElasticValueViewController *)self _updateDimmingVisible:v6];
}

- (void)_refreshDebugUI:(BOOL)a3
{
  v262[2] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    double v5 = [(SBElasticValueViewController *)self settings];
    [v5 showDebugUI];
    int IsZero = BSFloatIsZero();
    unint64_t v7 = [(SBElasticValueViewController *)self view];
    uint64_t v8 = v7;
    debugContainerView = self->_debugContainerView;
    if (IsZero)
    {
      [v7 sendSubviewToBack:debugContainerView];
    }
    else
    {
      [v7 bringSubviewToFront:debugContainerView];

      if (!a3)
      {
        debugLabel = self->_debugLabel;
        if (!debugLabel)
        {
          double v25 = (UILabel *)objc_opt_new();
          double v26 = self->_debugLabel;
          self->_debugLabel = v25;

          debugLabel = self->_debugLabel;
        }
        [(UILabel *)debugLabel setText:@"LAYING IN WAIT FOR ACTION"];
        CGFloat v27 = self->_debugLabel;
        double v28 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UILabel *)v27 setTextColor:v28];

        CGFloat v29 = self->_debugLabel;
        double v30 = [MEMORY[0x1E4F428B8] blackColor];
        [(UILabel *)v29 setBackgroundColor:v30];

        [(UILabel *)self->_debugLabel sizeToFit];
        [(UILabel *)self->_debugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIView *)self->_debugContainerView addSubview:self->_debugLabel];
        debugDumpButton = self->_debugDumpButton;
        if (!debugDumpButton)
        {
          double v32 = [MEMORY[0x1E4F427E0] buttonWithType:1];
          CGFloat v33 = self->_debugDumpButton;
          self->_debugDumpButton = v32;

          debugDumpButton = self->_debugDumpButton;
        }
        [(UIButton *)debugDumpButton setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIButton *)self->_debugDumpButton setTitle:@"  DUMP TO CONSOLE  " forState:0];
        [(UIButton *)self->_debugDumpButton addTarget:self action:sel__debugDump_ forControlEvents:64];
        BOOL v34 = self->_debugDumpButton;
        double v35 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UIButton *)v34 setTitleColor:v35 forState:0];

        CGFloat v36 = self->_debugDumpButton;
        double v37 = [MEMORY[0x1E4F428B8] blackColor];
        [(UIButton *)v36 setBackgroundColor:v37];

        [(UIButton *)self->_debugDumpButton _setContinuousCornerRadius:8.0];
        [(UIView *)self->_debugContainerView addSubview:self->_debugDumpButton];
        if (!self->_debugNextAudioRouteButton)
        {
          CGFloat v38 = [MEMORY[0x1E4F427E0] buttonWithType:1];
          debugNextAudioRouteButton = self->_debugNextAudioRouteButton;
          self->_debugNextAudioRouteButton = v38;
        }
        if (!self->_debugResetAudioRouteButton)
        {
          CGFloat v40 = [MEMORY[0x1E4F427E0] buttonWithType:1];
          debugResetAudioRouteButton = self->_debugResetAudioRouteButton;
          self->_debugResetAudioRouteButton = v40;
        }
        [(UIButton *)self->_debugNextAudioRouteButton _setContinuousCornerRadius:8.0];
        CGFloat v42 = self->_debugNextAudioRouteButton;
        id v43 = [MEMORY[0x1E4F428B8] darkGrayColor];
        [(UIButton *)v42 setBackgroundColor:v43];

        [(UIButton *)self->_debugNextAudioRouteButton setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIButton *)self->_debugNextAudioRouteButton setTitle:@"  NEXT ROUTE →  " forState:0];
        id v44 = self->_debugNextAudioRouteButton;
        id v45 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UIButton *)v44 setTitleColor:v45 forState:0];

        [(UIButton *)self->_debugNextAudioRouteButton addTarget:self action:sel__debugDidTapNextRoute_ forControlEvents:64];
        [(UIButton *)self->_debugResetAudioRouteButton _setContinuousCornerRadius:8.0];
        uint64_t v46 = self->_debugResetAudioRouteButton;
        long long v47 = [MEMORY[0x1E4F428B8] darkGrayColor];
        [(UIButton *)v46 setBackgroundColor:v47];

        [(UIButton *)self->_debugResetAudioRouteButton setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIButton *)self->_debugResetAudioRouteButton setTitle:@"  ↺ RESET ROUTE  " forState:0];
        long long v48 = self->_debugResetAudioRouteButton;
        long long v49 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UIButton *)v48 setTitleColor:v49 forState:0];

        [(UIButton *)self->_debugResetAudioRouteButton addTarget:self action:sel__debugDidTapResetRoute_ forControlEvents:64];
        [(UIView *)self->_debugContainerView addSubview:self->_debugNextAudioRouteButton];
        [(UIView *)self->_debugContainerView addSubview:self->_debugResetAudioRouteButton];
        debugStateSegmentedControl = self->_debugStateSegmentedControl;
        if (!debugStateSegmentedControl)
        {
          id v51 = objc_alloc(MEMORY[0x1E4F42DD0]);
          uint64_t v52 = __48__SBElasticValueViewController__refreshDebugUI___block_invoke();
          CGRect v53 = (UISegmentedControl *)[v51 initWithItems:v52];
          CGRect v54 = self->_debugStateSegmentedControl;
          self->_debugStateSegmentedControl = v53;

          debugStateSegmentedControl = self->_debugStateSegmentedControl;
        }
        [(UISegmentedControl *)debugStateSegmentedControl sizeToFit];
        [(UISegmentedControl *)self->_debugStateSegmentedControl addTarget:self action:sel__debugChangingStateFromSegmentedControl_ forControlEvents:4096];
        BOOL v55 = self->_debugStateSegmentedControl;
        long long v56 = [MEMORY[0x1E4F428B8] blackColor];
        [(UISegmentedControl *)v55 setBackgroundColor:v56];

        [(UISegmentedControl *)self->_debugStateSegmentedControl setSelectedSegmentIndex:self->_state];
        [(UISegmentedControl *)self->_debugStateSegmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIView *)self->_debugContainerView addSubview:self->_debugStateSegmentedControl];
        debugAutoDismissalSwitch = self->_debugAutoDismissalSwitch;
        if (!debugAutoDismissalSwitch)
        {
          long long v58 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4F42E78]);
          objc_super v59 = self->_debugAutoDismissalSwitch;
          self->_debugAutoDismissalSwitch = v58;

          debugAutoDismissalSwitch = self->_debugAutoDismissalSwitch;
        }
        [(UISwitch *)debugAutoDismissalSwitch sizeToFit];
        v256 = v5;
        -[UISwitch setOn:](self->_debugAutoDismissalSwitch, "setOn:", [v5 autoDismiss]);
        v60 = self->_debugAutoDismissalSwitch;
        v61 = [MEMORY[0x1E4F428B8] blackColor];
        [(UISwitch *)v60 setBackgroundColor:v61];

        [(UISwitch *)self->_debugAutoDismissalSwitch addTarget:self action:sel__debugAutoDismissalSwitchValueChanged_ forControlEvents:4096];
        [(UISwitch *)self->_debugAutoDismissalSwitch setTranslatesAutoresizingMaskIntoConstraints:0];
        debugAutoDismissLabel = self->_debugAutoDismissLabel;
        if (!debugAutoDismissLabel)
        {
          v63 = (UILabel *)objc_opt_new();
          v64 = self->_debugAutoDismissLabel;
          self->_debugAutoDismissLabel = v63;

          debugAutoDismissLabel = self->_debugAutoDismissLabel;
        }
        [(UILabel *)debugAutoDismissLabel setText:@"AutoDismiss"];
        v65 = self->_debugAutoDismissLabel;
        v66 = [MEMORY[0x1E4F428B8] blackColor];
        [(UILabel *)v65 setBackgroundColor:v66];

        v67 = self->_debugAutoDismissLabel;
        v68 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UILabel *)v67 setTextColor:v68];

        [(UILabel *)self->_debugAutoDismissLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UILabel *)self->_debugAutoDismissLabel sizeToFit];
        [(UIView *)self->_debugContainerView addSubview:self->_debugAutoDismissalSwitch];
        [(UIView *)self->_debugContainerView addSubview:self->_debugAutoDismissLabel];
        debugLockStateSwitch = self->_debugLockStateSwitch;
        if (!debugLockStateSwitch)
        {
          v70 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4F42E78]);
          v71 = self->_debugLockStateSwitch;
          self->_debugLockStateSwitch = v70;

          debugLockStateSwitch = self->_debugLockStateSwitch;
        }
        [(UISwitch *)debugLockStateSwitch sizeToFit];
        v72 = self->_debugLockStateSwitch;
        v73 = [MEMORY[0x1E4F428B8] blackColor];
        [(UISwitch *)v72 setBackgroundColor:v73];

        [(UISwitch *)self->_debugLockStateSwitch addTarget:self action:sel__debugLockStateSwitchValueChanged_ forControlEvents:4096];
        [(UISwitch *)self->_debugLockStateSwitch setTranslatesAutoresizingMaskIntoConstraints:0];
        debugLockStateLabel = self->_debugLockStateLabel;
        if (!debugLockStateLabel)
        {
          id v75 = (UILabel *)objc_opt_new();
          v76 = self->_debugLockStateLabel;
          self->_debugLockStateLabel = v75;

          debugLockStateLabel = self->_debugLockStateLabel;
        }
        [(UILabel *)debugLockStateLabel setText:@"Lock State?"];
        v77 = self->_debugLockStateLabel;
        id v78 = [MEMORY[0x1E4F428B8] blackColor];
        [(UILabel *)v77 setBackgroundColor:v78];

        v79 = self->_debugLockStateLabel;
        v80 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UILabel *)v79 setTextColor:v80];

        [(UILabel *)self->_debugLockStateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UILabel *)self->_debugLockStateLabel sizeToFit];
        [(UIView *)self->_debugContainerView addSubview:self->_debugLockStateSwitch];
        [(UIView *)self->_debugContainerView addSubview:self->_debugLockStateLabel];
        if (!self->_debugWidthSlider)
        {
          v81 = (UISlider *)objc_opt_new();
          debugWidthSlider = self->_debugWidthSlider;
          self->_debugWidthSlider = v81;
        }
        debugHeightSlider = self->_debugHeightSlider;
        if (!debugHeightSlider)
        {
          id v84 = (UISlider *)objc_opt_new();
          v85 = self->_debugHeightSlider;
          self->_debugHeightSlider = v84;

          debugHeightSlider = self->_debugHeightSlider;
        }
        v262[0] = self->_debugWidthSlider;
        v262[1] = debugHeightSlider;
        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v262 count:2];
        id v87 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v88 = [v87 userInterfaceIdiom];

        if ((v88 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          id v89 = (UISlider *)objc_opt_new();
          debugPortraitYOriginSlider = self->_debugPortraitYOriginSlider;
          self->_debugPortraitYOriginSlider = v89;

          uint64_t v91 = [v86 arrayByAddingObject:self->_debugPortraitYOriginSlider];

          v86 = (void *)v91;
        }
        long long v259 = 0u;
        long long v260 = 0u;
        long long v257 = 0u;
        long long v258 = 0u;
        id v92 = v86;
        uint64_t v93 = [v92 countByEnumeratingWithState:&v257 objects:v261 count:16];
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v95 = *(void *)v258;
          do
          {
            for (uint64_t i = 0; i != v94; ++i)
            {
              if (*(void *)v258 != v95) {
                objc_enumerationMutation(v92);
              }
              id v97 = *(void **)(*((void *)&v257 + 1) + 8 * i);
              [v97 setTranslatesAutoresizingMaskIntoConstraints:0];
              LODWORD(v98) = 5.0;
              [v97 setMinimumValue:v98];
              LODWORD(v99) = 1140457472;
              [v97 setMaximumValue:v99];
              [v97 addTarget:self action:sel__debugDimensionSliderValueDidChange_ forControlEvents:4096];
            }
            uint64_t v94 = [v92 countByEnumeratingWithState:&v257 objects:v261 count:16];
          }
          while (v94);
        }

        [(UIView *)self->_debugContainerView addSubview:self->_debugWidthSlider];
        [(UIView *)self->_debugContainerView addSubview:self->_debugHeightSlider];
        v100 = self->_debugPortraitYOriginSlider;
        if (v100)
        {
          v101 = [MEMORY[0x1E4F42D90] mainScreen];
          [v101 bounds];
          *(float *)&double v103 = v102;
          [(UISlider *)v100 setMaximumValue:v103];

          [(UIView *)self->_debugContainerView addSubview:self->_debugPortraitYOriginSlider];
        }

        __int16 v22 = self->_debugAutoLayoutConstraints;
        v104 = [(UIView *)self->_touchTrackingView layer];
        [v104 setBorderWidth:1.0];

        v105 = [(UIView *)self->_touchTrackingView layer];
        id v106 = [MEMORY[0x1E4F428B8] blackColor];
        objc_msgSend(v105, "setBorderColor:", objc_msgSend(v106, "CGColor"));

        v107 = [(SBFTouchPassThroughView *)self->_sliderContainerView layer];
        [v107 setBorderWidth:5.0];

        uint64_t v108 = [(SBFTouchPassThroughView *)self->_sliderContainerView layer];
        id v109 = [MEMORY[0x1E4F428B8] systemPinkColor];
        objc_msgSend(v108, "setBorderColor:", objc_msgSend(v109, "CGColor"));

        v110 = [(SBFTouchPassThroughView *)self->_sliderContainerView layer];
        v111 = [(SBElasticValueViewController *)self traitCollection];
        [v111 displayCornerRadius];
        objc_msgSend(v110, "setCornerRadius:");

        v112 = [(SBFTouchPassThroughView *)self->_sliderContainerView layer];
        uint64_t v113 = *MEMORY[0x1E4F39EA8];
        [v112 setCornerCurve:*MEMORY[0x1E4F39EA8]];

        v114 = [(SBElasticSliderView *)self->_sliderView layer];
        [v114 setBorderWidth:1.0];

        v115 = [(SBElasticSliderView *)self->_sliderView layer];
        id v116 = [MEMORY[0x1E4F428B8] magentaColor];
        objc_msgSend(v115, "setBorderColor:", objc_msgSend(v116, "CGColor"));

        v117 = [(UIView *)self->_debugContainerView layer];
        [v117 setBorderWidth:1.0];

        v118 = [(UIView *)self->_debugContainerView layer];
        id v119 = [MEMORY[0x1E4F428B8] systemYellowColor];
        objc_msgSend(v118, "setBorderColor:", objc_msgSend(v119, "CGColor"));

        v120 = [(UIView *)self->_debugContainerView layer];
        v121 = [(SBElasticValueViewController *)self traitCollection];
        [v121 displayCornerRadius];
        objc_msgSend(v120, "setCornerRadius:");

        v122 = [(UIView *)self->_debugContainerView layer];
        [v122 setCornerCurve:v113];

        v123 = [(_UILegibilityLabel *)self->_leadingLabel layer];
        [v123 setBorderWidth:1.0];

        v124 = [(_UILegibilityLabel *)self->_trailingLabel layer];
        [v124 setBorderWidth:1.0];

        v125 = (NSArray *)objc_opt_new();
        v126 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerXAnchor];
        v127 = [(UIView *)self->_debugContainerView centerXAnchor];
        v128 = [v126 constraintEqualToAnchor:v127];
        [(NSArray *)v125 addObject:v128];

        v129 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerYAnchor];
        v130 = [(UIView *)self->_debugContainerView centerYAnchor];
        v131 = [v129 constraintEqualToAnchor:v130];
        [(NSArray *)v125 addObject:v131];

        v132 = [(UILabel *)self->_debugLabel centerXAnchor];
        v133 = [(UIView *)self->_debugContainerView centerXAnchor];
        v134 = [v132 constraintEqualToAnchor:v133];
        [(NSArray *)v125 addObject:v134];

        v135 = [(UILabel *)self->_debugLabel leadingAnchor];
        v136 = [(UIView *)self->_debugContainerView leadingAnchor];
        v137 = [v135 constraintGreaterThanOrEqualToAnchor:v136];
        [(NSArray *)v125 addObject:v137];

        v138 = [(UILabel *)self->_debugLabel trailingAnchor];
        v139 = [(UIView *)self->_debugContainerView trailingAnchor];
        v140 = [v138 constraintLessThanOrEqualToAnchor:v139];
        [(NSArray *)v125 addObject:v140];

        v141 = [(UILabel *)self->_debugLabel topAnchor];
        v142 = [(UISegmentedControl *)self->_debugStateSegmentedControl bottomAnchor];
        v143 = [v141 constraintEqualToAnchor:v142 constant:10.0];
        [(NSArray *)v125 addObject:v143];

        v144 = [(UISwitch *)self->_debugAutoDismissalSwitch topAnchor];
        v145 = [(UILabel *)self->_debugLabel bottomAnchor];
        v146 = [v144 constraintEqualToAnchor:v145 constant:10.0];
        [(NSArray *)v125 addObject:v146];

        v147 = [(UISwitch *)self->_debugAutoDismissalSwitch centerXAnchor];
        v148 = [(UIView *)self->_debugContainerView centerXAnchor];
        v149 = [v147 constraintEqualToAnchor:v148];
        [(NSArray *)v125 addObject:v149];

        v150 = [(UISwitch *)self->_debugAutoDismissalSwitch leadingAnchor];
        v151 = [(UIView *)self->_debugContainerView leadingAnchor];
        v152 = [v150 constraintGreaterThanOrEqualToAnchor:v151];
        [(NSArray *)v125 addObject:v152];

        v153 = [(UISwitch *)self->_debugAutoDismissalSwitch widthAnchor];
        v154 = [v153 constraintEqualToConstant:100.0];
        [(NSArray *)v125 addObject:v154];

        v155 = [(UISwitch *)self->_debugAutoDismissalSwitch trailingAnchor];
        v156 = [(UIView *)self->_debugContainerView trailingAnchor];
        v157 = [v155 constraintLessThanOrEqualToAnchor:v156];
        [(NSArray *)v125 addObject:v157];

        v158 = [(UILabel *)self->_debugAutoDismissLabel widthAnchor];
        v159 = [v158 constraintEqualToConstant:200.0];
        [(NSArray *)v125 addObject:v159];

        v160 = [(UILabel *)self->_debugAutoDismissLabel centerYAnchor];
        v161 = [(UISwitch *)self->_debugAutoDismissalSwitch centerYAnchor];
        v162 = [v160 constraintEqualToAnchor:v161];
        [(NSArray *)v125 addObject:v162];

        v163 = [(UILabel *)self->_debugAutoDismissLabel leadingAnchor];
        v164 = [(UIView *)self->_debugContainerView leadingAnchor];
        v165 = [v163 constraintGreaterThanOrEqualToAnchor:v164];
        [(NSArray *)v125 addObject:v165];

        v166 = [(UILabel *)self->_debugAutoDismissLabel trailingAnchor];
        v167 = [(UISwitch *)self->_debugAutoDismissalSwitch leadingAnchor];
        v168 = [v166 constraintLessThanOrEqualToAnchor:v167 constant:-50.0];
        [(NSArray *)v125 addObject:v168];

        v169 = [(UISwitch *)self->_debugLockStateSwitch topAnchor];
        v170 = [(UISwitch *)self->_debugAutoDismissalSwitch bottomAnchor];
        v171 = [v169 constraintEqualToAnchor:v170 constant:10.0];
        [(NSArray *)v125 addObject:v171];

        v172 = [(UISwitch *)self->_debugLockStateSwitch centerXAnchor];
        v173 = [(UIView *)self->_debugContainerView centerXAnchor];
        v174 = [v172 constraintEqualToAnchor:v173];
        [(NSArray *)v125 addObject:v174];

        v175 = [(UISwitch *)self->_debugLockStateSwitch widthAnchor];
        v176 = [v175 constraintEqualToConstant:100.0];
        [(NSArray *)v125 addObject:v176];

        v177 = [(UISwitch *)self->_debugLockStateSwitch leadingAnchor];
        v178 = [(UIView *)self->_debugContainerView leadingAnchor];
        v179 = [v177 constraintGreaterThanOrEqualToAnchor:v178];
        [(NSArray *)v125 addObject:v179];

        v180 = [(UISwitch *)self->_debugLockStateSwitch trailingAnchor];
        v181 = [(UIView *)self->_debugContainerView trailingAnchor];
        v182 = [v180 constraintLessThanOrEqualToAnchor:v181];
        [(NSArray *)v125 addObject:v182];

        v183 = [(UILabel *)self->_debugLockStateLabel widthAnchor];
        v184 = [v183 constraintEqualToConstant:200.0];
        [(NSArray *)v125 addObject:v184];

        v185 = [(UILabel *)self->_debugLockStateLabel centerYAnchor];
        v186 = [(UISwitch *)self->_debugLockStateSwitch centerYAnchor];
        v187 = [v185 constraintEqualToAnchor:v186];
        [(NSArray *)v125 addObject:v187];

        v188 = [(UILabel *)self->_debugLockStateLabel leadingAnchor];
        v189 = [(UIView *)self->_debugContainerView leadingAnchor];
        v190 = [v188 constraintGreaterThanOrEqualToAnchor:v189];
        [(NSArray *)v125 addObject:v190];

        v191 = [(UILabel *)self->_debugLockStateLabel trailingAnchor];
        v192 = [(UISwitch *)self->_debugLockStateSwitch leadingAnchor];
        v193 = [v191 constraintLessThanOrEqualToAnchor:v192 constant:-50.0];
        [(NSArray *)v125 addObject:v193];

        v194 = [(UISlider *)self->_debugWidthSlider topAnchor];
        v195 = [(UILabel *)self->_debugLockStateLabel bottomAnchor];
        v196 = [v194 constraintEqualToAnchor:v195 constant:30.0];
        [(NSArray *)v125 addObject:v196];

        v197 = [(UISlider *)self->_debugWidthSlider centerXAnchor];
        v198 = [(UIView *)self->_debugContainerView centerXAnchor];
        v199 = [v197 constraintEqualToAnchor:v198];
        [(NSArray *)v125 addObject:v199];

        v200 = [(UISlider *)self->_debugWidthSlider widthAnchor];
        v201 = [v200 constraintEqualToConstant:300.0];
        [(NSArray *)v125 addObject:v201];

        v202 = [(UISlider *)self->_debugWidthSlider leadingAnchor];
        v203 = [(UIView *)self->_debugContainerView leadingAnchor];
        v204 = [v202 constraintGreaterThanOrEqualToAnchor:v203];
        [(NSArray *)v125 addObject:v204];

        v205 = [(UISlider *)self->_debugWidthSlider trailingAnchor];
        v206 = [(UIView *)self->_debugContainerView trailingAnchor];
        v207 = [v205 constraintLessThanOrEqualToAnchor:v206];
        [(NSArray *)v125 addObject:v207];

        v208 = [(UISlider *)self->_debugHeightSlider topAnchor];
        v209 = [(UISlider *)self->_debugWidthSlider bottomAnchor];
        v210 = [v208 constraintEqualToAnchor:v209 constant:30.0];
        [(NSArray *)v125 addObject:v210];

        v211 = [(UISlider *)self->_debugHeightSlider centerXAnchor];
        v212 = [(UIView *)self->_debugContainerView centerXAnchor];
        v213 = [v211 constraintEqualToAnchor:v212];
        [(NSArray *)v125 addObject:v213];

        v214 = [(UISlider *)self->_debugHeightSlider widthAnchor];
        v215 = [v214 constraintEqualToConstant:300.0];
        [(NSArray *)v125 addObject:v215];

        v216 = [(UISlider *)self->_debugHeightSlider leadingAnchor];
        v217 = [(UIView *)self->_debugContainerView leadingAnchor];
        v218 = [v216 constraintGreaterThanOrEqualToAnchor:v217];
        [(NSArray *)v125 addObject:v218];

        v219 = [(UISlider *)self->_debugHeightSlider trailingAnchor];
        v220 = [(UIView *)self->_debugContainerView trailingAnchor];
        v221 = [v219 constraintLessThanOrEqualToAnchor:v220];
        [(NSArray *)v125 addObject:v221];

        v222 = self->_debugPortraitYOriginSlider;
        double v5 = v256;
        if (v222)
        {
          v223 = [(UISlider *)v222 topAnchor];
          v224 = [(UISlider *)self->_debugHeightSlider bottomAnchor];
          v225 = [v223 constraintEqualToAnchor:v224 constant:30.0];
          [(NSArray *)v125 addObject:v225];

          v226 = [(UISlider *)self->_debugPortraitYOriginSlider centerXAnchor];
          v227 = [(UIView *)self->_debugContainerView centerXAnchor];
          v228 = [v226 constraintEqualToAnchor:v227];
          [(NSArray *)v125 addObject:v228];

          v229 = [(UISlider *)self->_debugPortraitYOriginSlider widthAnchor];
          v230 = [v229 constraintEqualToConstant:300.0];
          [(NSArray *)v125 addObject:v230];

          v231 = [(UISlider *)self->_debugPortraitYOriginSlider leadingAnchor];
          v232 = [(UIView *)self->_debugContainerView leadingAnchor];
          v233 = [v231 constraintGreaterThanOrEqualToAnchor:v232];
          [(NSArray *)v125 addObject:v233];

          v234 = [(UISlider *)self->_debugPortraitYOriginSlider trailingAnchor];
          v235 = [(UIView *)self->_debugContainerView trailingAnchor];
          v236 = [v234 constraintLessThanOrEqualToAnchor:v235];
          [(NSArray *)v125 addObject:v236];
        }
        v237 = [(UIButton *)self->_debugDumpButton centerXAnchor];
        v238 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerXAnchor];
        v239 = [v237 constraintEqualToAnchor:v238];
        [(NSArray *)v125 addObject:v239];

        v240 = [(UIButton *)self->_debugDumpButton centerYAnchor];
        v241 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerYAnchor];
        v242 = [v240 constraintEqualToAnchor:v241 constant:-50.0];
        [(NSArray *)v125 addObject:v242];

        v243 = [(UIButton *)self->_debugResetAudioRouteButton centerXAnchor];
        v244 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerXAnchor];
        v245 = [v243 constraintEqualToAnchor:v244];
        [(NSArray *)v125 addObject:v245];

        v246 = [(UIButton *)self->_debugResetAudioRouteButton centerYAnchor];
        v247 = [(UIButton *)self->_debugDumpButton centerYAnchor];
        v248 = [v246 constraintEqualToAnchor:v247 constant:-40.0];
        [(NSArray *)v125 addObject:v248];

        v249 = [(UIButton *)self->_debugNextAudioRouteButton centerXAnchor];
        v250 = [(UISegmentedControl *)self->_debugStateSegmentedControl centerXAnchor];
        v251 = [v249 constraintEqualToAnchor:v250];
        [(NSArray *)v125 addObject:v251];

        v252 = [(UIButton *)self->_debugNextAudioRouteButton centerYAnchor];
        v253 = [(UIButton *)self->_debugResetAudioRouteButton centerYAnchor];
        v254 = [v252 constraintEqualToAnchor:v253 constant:-40.0];
        [(NSArray *)v125 addObject:v254];

        debugAutoLayoutConstraints = self->_debugAutoLayoutConstraints;
        self->_debugAutoLayoutConstraints = v125;
        double v23 = v125;

        [MEMORY[0x1E4F28DC8] activateConstraints:self->_debugAutoLayoutConstraints];
        goto LABEL_42;
      }
    }
    [(UILabel *)self->_debugLabel removeFromSuperview];
    unint64_t v10 = self->_debugLabel;
    self->_debugLabel = 0;

    [(UIButton *)self->_debugDumpButton removeFromSuperview];
    uint64_t v11 = self->_debugDumpButton;
    self->_debugDumpButton = 0;

    [(UIButton *)self->_debugNextAudioRouteButton removeFromSuperview];
    [(UIButton *)self->_debugResetAudioRouteButton removeFromSuperview];
    BOOL v12 = self->_debugNextAudioRouteButton;
    self->_debugNextAudioRouteButton = 0;

    uint64_t v13 = self->_debugResetAudioRouteButton;
    self->_debugResetAudioRouteButton = 0;

    [(UISegmentedControl *)self->_debugStateSegmentedControl removeFromSuperview];
    __int16 v14 = self->_debugStateSegmentedControl;
    self->_debugStateSegmentedControl = 0;

    [(UILabel *)self->_debugAutoDismissLabel removeFromSuperview];
    id v15 = self->_debugAutoDismissLabel;
    self->_debugAutoDismissLabel = 0;

    [(UISwitch *)self->_debugAutoDismissalSwitch removeFromSuperview];
    int v16 = self->_debugAutoDismissalSwitch;
    self->_debugAutoDismissalSwitch = 0;

    [(UILabel *)self->_debugLockStateLabel removeFromSuperview];
    uint64_t v17 = self->_debugLockStateLabel;
    self->_debugLockStateLabel = 0;

    [(UISwitch *)self->_debugLockStateSwitch removeFromSuperview];
    int v18 = self->_debugLockStateSwitch;
    self->_debugLockStateSwitch = 0;

    [(UISlider *)self->_debugHeightSlider removeFromSuperview];
    uint64_t v19 = self->_debugHeightSlider;
    self->_debugHeightSlider = 0;

    [(UISlider *)self->_debugWidthSlider removeFromSuperview];
    uint64_t v20 = self->_debugWidthSlider;
    self->_debugWidthSlider = 0;

    [(UISlider *)self->_debugPortraitYOriginSlider removeFromSuperview];
    uint64_t v21 = self->_debugPortraitYOriginSlider;
    self->_debugPortraitYOriginSlider = 0;

    __int16 v22 = self->_debugAutoLayoutConstraints;
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v22];
    double v23 = self->_debugAutoLayoutConstraints;
    self->_debugAutoLayoutConstraints = 0;
LABEL_42:
  }
}

id __48__SBElasticValueViewController__refreshDebugUI___block_invoke()
{
  v0 = objc_opt_new();
  for (unint64_t i = 0; i != 5; ++i)
  {
    double v2 = @"Invalid state";
    if (i <= 4) {
      double v2 = off_1E6AFEC08[i];
    }
    [v0 addObject:v2];
  }
  return v0;
}

- (void)_updateDebugString:(id)a3
{
  [(UILabel *)self->_debugLabel setText:a3];
  debugLabel = self->_debugLabel;
  [(UILabel *)debugLabel sizeToFit];
}

- (void)_debugDump:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = [(SBElasticHUDSettings *)self->_settings performSelector:sel__ivarDescription];
  double v5 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    BOOL v12 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "ELASTIC HUD DUMP: %@", (uint8_t *)&v11, 0xCu);
  }

  BOOL v6 = (void *)MEMORY[0x1E4F1CB10];
  unint64_t v7 = NSTemporaryDirectory();
  uint64_t v8 = [v6 fileURLWithPath:v7];
  int v9 = [v8 URLByAppendingPathComponent:@"ElasticHUD.dump"];

  unint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v10 removeItemAtURL:v9 error:0];

  [v4 writeToURL:v9 atomically:1 encoding:4 error:0];
}

- (void)_debugDidTapNextRoute:(id)a3
{
  [(SBElasticValueViewController *)self _debugHandleNextRoute];
  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"DEBUG NEXT ROUTE"];
  [(SBElasticValueViewController *)self reloadData];
}

- (void)_debugDidTapResetRoute:(id)a3
{
  [(SBElasticValueViewController *)self _debugHandleResetRoute];
  [(SBElasticValueViewController *)self reloadData];
}

- (void)_debugChangingStateFromSegmentedControl:(id)a3
{
  uint64_t v4 = [a3 selectedSegmentIndex];
  [(SBElasticValueViewController *)self transitionToState:v4 animated:1 completion:0];
}

- (void)_debugAutoDismissalSwitchValueChanged:(id)a3
{
  id v5 = a3;
  BOOL v6 = NSStringFromSelector(a2);
  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:v6];

  unint64_t v7 = [(SBElasticValueViewController *)self settings];
  objc_msgSend(v7, "setAutoDismiss:", objc_msgSend(v5, "isOn"));

  LODWORD(v7) = [v5 isOn];
  if (v7 && !self->_state)
  {
    [(SBElasticValueViewController *)self _actuallyDismiss];
  }
}

- (void)_debugLockStateSwitchValueChanged:(id)a3
{
  id v5 = a3;
  BOOL v6 = NSStringFromSelector(a2);
  [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:v6];

  LODWORD(v6) = [v5 isOn];
  self->_lockState = (char)v6;
  [(UISegmentedControl *)self->_debugStateSegmentedControl setEnabled:v6 ^ 1];
  [(SBElasticValueViewController *)self _scheduleDismissal:@"RESUME AFTER DEBUGGING LOCK"];
}

- (void)_debugDimensionSliderValueDidChange:(id)a3
{
  uint64_t v20 = (UISlider *)a3;
  uint64_t v4 = [(SBElasticValueViewController *)self settings];
  int64_t state = self->_state;
  unint64_t v6 = [(SBElasticValueViewController *)self axis];
  if (v6)
  {
    if (self->_debugHeightSlider == v20)
    {
      switch(state)
      {
        case 0:
        case 1:
        case 4:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState1Height:v12];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState1Height:v8];
          }
          break;
        case 2:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState2Height:v16];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState2Height:v10];
          }
          break;
        case 3:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState3Height:v17];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState3Height:v11];
          }
          break;
        default:
          break;
      }
    }
    else if (self->_debugWidthSlider == v20)
    {
      switch(state)
      {
        case 0:
        case 1:
        case 4:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState1Width:v15];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState1Width:v9];
          }
          break;
        case 2:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState2Width:v19];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState2Width:v14];
          }
          break;
        case 3:
          if (v6 == 1)
          {
            [(UISlider *)v20 value];
            [v4 setLandscapeState3Width:v18];
          }
          else if (v6 == 2)
          {
            [(UISlider *)v20 value];
            [v4 setPortraitState3Width:v13];
          }
          break;
        default:
          break;
      }
    }
    else if (self->_debugPortraitYOriginSlider)
    {
      [(UISlider *)v20 value];
      [v4 setVolumeButtonsCenterY:v7];
    }
  }
}

- (void)_updateLiveRenderingAssertion
{
  v26[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBElasticValueViewController *)self viewIfLoaded];
  uint64_t v4 = [v3 window];
  id v5 = [v4 windowScene];

  if (v5) {
    BOOL v6 = [(SBElasticValueViewController *)self _appearState] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  liveRenderingAssertion = self->_liveRenderingAssertion;
  int v8 = [(BLSAssertion *)liveRenderingAssertion isAcquired];
  int v9 = v8;
  if (v6 && (v8 & 1) == 0)
  {
    float v10 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      double v23 = self;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "%@ is requesting live rendering", (uint8_t *)&v22, 0xCu);
    }

    float v11 = (objc_class *)objc_opt_class();
    float v12 = NSStringFromClass(v11);
    [(BLSAssertion *)self->_liveRenderingAssertion invalidate];
    float v13 = (void *)MEMORY[0x1E4F4F4C0];
    float v14 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:v5];
    v26[0] = v14;
    float v15 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerateForScene:v5];
    v26[1] = v15;
    float v16 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
    v26[2] = v16;
    float v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    float v18 = [v13 acquireWithExplanation:v12 observer:0 attributes:v17];
    float v19 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = v18;

LABEL_16:
    goto LABEL_17;
  }
  if (liveRenderingAssertion) {
    char v20 = v6;
  }
  else {
    char v20 = 1;
  }
  if ((v20 & 1) == 0)
  {
    uint64_t v21 = [(SBElasticValueViewController *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      double v23 = self;
      __int16 v24 = 1024;
      int v25 = v9;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "%@ is relinquishing live rendering (was acquired: %{BOOL}u)", (uint8_t *)&v22, 0x12u);
    }

    [(BLSAssertion *)self->_liveRenderingAssertion invalidate];
    float v12 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (CGSize)maximumSizeForSlider
{
  [(SBElasticValueViewController *)self sizeForState:3];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeForState:(int64_t)a3
{
  unint64_t v5 = [(SBElasticValueViewController *)self axis];
  BOOL v6 = [(SBElasticValueViewController *)self settings];
  float v7 = v6;
  if (v5 == 2)
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 4:
        [v6 portraitState1Width];
        [v7 portraitState1Height];
        break;
      case 2:
        [v6 portraitState2Width];
        [v7 portraitState2Height];
        break;
      case 3:
        [v6 portraitState3Width];
        [v7 portraitState3Height];
        break;
      default:
        break;
    }
  }
  else if (v5 == 1)
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 4:
        [v6 landscapeState1Width];
        [v7 landscapeState1Height];
        break;
      case 2:
        [v6 landscapeState2Width];
        [v7 landscapeState2Height];
        break;
      case 3:
        [v6 landscapeState3Width];
        [v7 landscapeState3Height];
        break;
      default:
        break;
    }
  }
  if (!self->_reduceMotionEnabled)
  {
    if (a3 == 4)
    {
      [(SBElasticHUDSettings *)self->_settings deflatedScaleFactor];
    }
    else if (!a3)
    {
      [(SBElasticHUDSettings *)self->_settings baseScaleFactor];
    }
  }
  int v8 = [(SBElasticValueViewController *)self traitCollection];
  [v8 displayScale];

  BSSizeRoundForScale();
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGPoint)centerForState:(int64_t)a3 sliderSize:(CGSize)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  unint64_t v11 = [(SBElasticValueViewController *)self axis];
  double v12 = [(SBElasticValueViewController *)self settings];
  double v13 = v12;
  if (a3 == 3)
  {
    CGFloat v16 = height;
  }
  else
  {
    if (a3 != 2)
    {
      if (!a3 && !self->_reduceMotionEnabled)
      {
        [v12 offscreenTopMargin];
        [v13 offscreenLeadingMargin];
        [v13 volumeButtonsCenterY];
        if (v11 == 1)
        {
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          CGRectGetMidX(v28);
        }
        goto LABEL_18;
      }
LABEL_9:
      CGFloat v16 = height;
      goto LABEL_12;
    }
    if (v11 == 1)
    {
      double v14 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        CGFloat v16 = height;
LABEL_14:
        [v13 onscreenTopMargin];
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.CGFloat height = v16;
        CGRectGetMidX(v29);
        float v17 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v18 = [v17 userInterfaceIdiom];

        if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1
          && (unint64_t)([(SBElasticValueViewController *)self hudPresentationOrientation]- 1) <= 1)
        {
          float v19 = [(SBElasticValueViewController *)self view];
          [v19 safeAreaInsets];
        }
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    CGFloat v16 = height;
  }
LABEL_12:
  if (v11 == 2)
  {
    [v13 onscreenLeadingMargin];
    [v13 volumeButtonsCenterY];
    goto LABEL_18;
  }
  if (v11 == 1) {
    goto LABEL_14;
  }
LABEL_18:
  char v20 = [(SBElasticValueViewController *)self traitCollection];
  [v20 displayScale];

  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

- (double)glyphScaleForState:(int64_t)a3
{
  unint64_t v5 = [(SBElasticValueViewController *)self settings];
  BOOL v6 = v5;
  double v7 = 1.17549435e-38;
  switch(a3)
  {
    case 0:
      [v5 baseScaleFactor];
      goto LABEL_7;
    case 1:
      double v7 = 1.0;
      break;
    case 3:
      if ([(SBElasticValueViewController *)self axis] == 2)
      {
        [v6 portraitState3Width];
        double v10 = v9;
        [v6 portraitState1Width];
      }
      else
      {
        [v6 landscapeState3Height];
        double v10 = v12;
        [v6 landscapeState1Height];
      }
      double v7 = v10 / v11;
      break;
    case 4:
      [(SBElasticHUDSettings *)self->_settings deflatedScaleFactor];
LABEL_7:
      double v7 = v8;
      break;
    default:
      break;
  }

  return v7;
}

- (BOOL)_computeCachedRouteDisplayInformation
{
  id v7 = 0;
  BOOL v3 = [(SBElasticValueViewController *)self updateActiveRouteDisplay:&v7];
  id v4 = v7;
  id v5 = v7;
  if (v3) {
    objc_storeStrong((id *)&self->_routeDisplayInfo, v4);
  }

  return v3;
}

- (void)_updateGlyphStateIfNecessaryForValue:(float *)a3
{
  id v5 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo glyphStateValueTransformer];
  if (v5)
  {
    if (a3) {
      v6.n128_f32[0] = *a3;
    }
    else {
      [(SBElasticValueViewController *)self currentValue];
    }
    uint64_t v7 = v5[2](v5, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [(CCUIBaseSliderView *)self->_sliderView setGlyphState:v7];
}

- (void)_updateLabelsForAxis:(unint64_t)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    BOOL v5 = (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && (unint64_t)([(SBElasticValueViewController *)self hudPresentationOrientation]- 1) < 2;
  }
  else
  {
    __n128 v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = (unint64_t)([(SBElasticValueViewController *)self hudPresentationOrientation]- 1) < 2;
    }
  }
  if (!self->_routeDisplayInfo) {
    goto LABEL_14;
  }
  uint64_t v7 = [(CCUIBaseSliderView *)self->_sliderView glyphPackageDescription];
  if (v7)
  {

    goto LABEL_15;
  }
  id v8 = [(CCUIBaseSliderView *)self->_sliderView glyphImage];

  if (!v8)
  {
LABEL_14:
    [(SBElasticValueViewController *)self _computeCachedRouteDisplayInformation];
    sliderView = self->_sliderView;
    double v10 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo glyphImage];
    [(CCUIBaseSliderView *)sliderView setGlyphImage:v10];

    double v11 = self->_sliderView;
    double v12 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo glyphPackage];
    [(CCUIBaseSliderView *)v11 setGlyphPackageDescription:v12];

    [(SBElasticValueViewController *)self _updateGlyphStateIfNecessaryForValue:0];
  }
LABEL_15:
  double v13 = [(SBElasticValueViewController *)self overrideDisplayNameForRoute:self->_routeDisplayInfo];
  double v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [(SBElasticRouteDisplaying *)self->_routeDisplayInfo localizedDisplayName];
  }
  CGFloat v16 = v15;
  uint64_t v17 = 2;
  if (v5) {
    uint64_t v17 = 4;
  }
  if (a3 == 1) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 1;
  }
  [(SBElasticSliderView *)self->_sliderView setAccessoryLayoutEdge:v18];
  float v19 = [(SBElasticValueViewController *)self traitCollection];
  [v19 displayScale];

  char v20 = [(_UILegibilityLabel *)self->_trailingLabel string];
  char v21 = BSEqualStrings();

  double v22 = (uint64_t *)MEMORY[0x1E4F42508];
  if ((v21 & 1) == 0)
  {
    uint64_t v33 = *MEMORY[0x1E4F42508];
    double v23 = [(_UILegibilityLabel *)self->_trailingLabel font];
    v34[0] = v23;
    double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    [0 sizeWithAttributes:v24];

    BSSizeCeilForScale();
    trailingLabel = self->_trailingLabel;
    BSRectWithSize();
    -[_UILegibilityLabel setBounds:](trailingLabel, "setBounds:");
    [(_UILegibilityLabel *)self->_trailingLabel setString:0];
    [(SBElasticSliderView *)self->_sliderView setNeedsLayout];
  }
  double v26 = [(_UILegibilityLabel *)self->_leadingLabel string];
  char v27 = BSEqualStrings();

  if ((v27 & 1) == 0)
  {
    uint64_t v31 = *v22;
    CGRect v28 = [(_UILegibilityLabel *)self->_leadingLabel font];
    double v32 = v28;
    CGRect v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v16 sizeWithAttributes:v29];

    BSSizeCeilForScale();
    leadingLabel = self->_leadingLabel;
    BSRectWithSize();
    -[_UILegibilityLabel setBounds:](leadingLabel, "setBounds:");
    [(_UILegibilityLabel *)self->_leadingLabel setString:v16];
    [(SBElasticSliderView *)self->_sliderView setNeedsLayout];
  }
}

- (void)_updateDimmingVisible:(BOOL)a3
{
  BOOL v3 = a3;
  settings = self->_settings;
  BOOL v5 = self->_dimmingView;
  [(SBElasticHUDSettings *)settings dimmingAlpha];
  double v7 = v6;
  if (v3)
  {
    id v8 = [MEMORY[0x1E4F428B8] blackColor];
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  double v9 = [v8 colorWithAlphaComponent:v7];
  [(UIView *)v5 setBackgroundColor:v9];
}

- (void)_updateSliderViewMetricsForState:(int64_t)a3 bounds:(CGRect)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  -[SBElasticValueViewController _sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:](self, "_sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:", a3, &v8, &v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  BOOL v5 = (void (**)(void, void))MEMORY[0x1D948C7A0](v8);
  double v6 = (void (**)(void, void))MEMORY[0x1D948C7A0](v7);
  ((void (**)(void, SBElasticSliderView *))v5)[2](v5, self->_sliderView);
  ((void (**)(void, SBElasticSliderView *))v6)[2](v6, self->_sliderView);
}

- (void)_sliderViewMetricsUpdatersForState:(int64_t)a3 bounds:(CGRect)a4 primaryMetricsUpdater:(id *)a5 positionUpdater:(id *)a6
{
  int64_t previousState = self->_previousState;
  if (a3 || !self->_reduceMotionEnabled)
  {
    BOOL v12 = previousState == 2;
  }
  else
  {
    if (previousState != -1)
    {
      if (a5) {
        *a5 = &__block_literal_global_228;
      }
      if (a6)
      {
        id v11 = &__block_literal_global_230;
LABEL_17:
        *a6 = v11;
        return;
      }
      return;
    }
    BOOL v12 = 0;
  }
  BOOL v13 = a3 == 0;
  BOOL v14 = v13 && v12;
  if (v13 && v12) {
    int64_t v15 = 2;
  }
  else {
    int64_t v15 = a3;
  }
  [(SBElasticValueViewController *)self glyphScaleForState:a3];
  uint64_t v17 = v16;
  [(SBElasticValueViewController *)self sizeForState:v15];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  -[SBElasticValueViewController centerForState:sliderSize:bounds:](self, "centerForState:sliderSize:bounds:", a3);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if (a5)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_3;
    v27[3] = &__block_descriptor_57_e29_v16__0__SBElasticSliderView_8l;
    BOOL v28 = v14;
    v27[4] = v17;
    v27[5] = v19;
    v27[6] = v21;
    *a5 = (id)MEMORY[0x1D948C7A0](v27);
  }
  if (a6)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_4;
    v26[3] = &__block_descriptor_48_e29_v16__0__SBElasticSliderView_8l;
    void v26[4] = v23;
    v26[5] = v25;
    id v11 = (id)MEMORY[0x1D948C7A0](v26);
    goto LABEL_17;
  }
}

void __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 56)) {
    [v3 setAdditiveGlyphScaleFactor:*(double *)(a1 + 32)];
  }
  BSRectWithSize();
  objc_msgSend(v3, "setBounds:");
}

uint64_t __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_updateTouchTrackingArea
{
  [(SBElasticSliderView *)self->_sliderView center];
  [(SBElasticValueViewController *)self maximumSizeForSlider];
  [(SBElasticValueViewController *)self axis];
  [(SBElasticSliderView *)self->_sliderView frame];
  double v4 = v3;
  double v27 = v5;
  double v28 = v6;
  double v8 = v7;
  BSRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  double v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (self->_state)
  {
    if (v9 < 0.0) {
      double v13 = 0.0;
    }
    if (v10 < 0.0) {
      CGFloat v14 = 0.0;
    }
  }
  double v17 = v13;
  CGFloat v18 = v14;
  double MinY = CGRectGetMinY(*(CGRect *)(&v11 - 2));
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v27;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v28;
  double v26 = MinY - CGRectGetMinY(v30);
  v31.origin.CGFloat x = v13;
  v31.origin.CGFloat y = v14;
  v31.size.CGFloat width = v15;
  v31.size.CGFloat height = v16;
  double MinX = CGRectGetMinX(v31);
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v27;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v28;
  double v24 = MinX - CGRectGetMinX(v32);
  v33.origin.CGFloat x = v4;
  v33.origin.CGFloat y = v27;
  v33.size.CGFloat width = v8;
  v33.size.CGFloat height = v28;
  double MaxY = CGRectGetMaxY(v33);
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v14;
  v34.size.CGFloat width = v15;
  v34.size.CGFloat height = v16;
  double v22 = MaxY - CGRectGetMaxY(v34);
  v35.origin.CGFloat x = v4;
  v35.origin.CGFloat y = v27;
  v35.size.CGFloat width = v8;
  v35.size.CGFloat height = v28;
  double MaxX = CGRectGetMaxX(v35);
  v36.origin.CGFloat x = v13;
  v36.origin.CGFloat y = v14;
  v36.size.CGFloat width = v15;
  v36.size.CGFloat height = v16;
  double v20 = MaxX - CGRectGetMaxX(v36);
  -[SBElasticSliderView _setTouchInsets:](self->_sliderView, "_setTouchInsets:", v26, v24, v22, v20);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__SBElasticValueViewController__updateTouchTrackingArea__block_invoke;
  v29[3] = &unk_1E6AF8568;
  v29[4] = self;
  *(double *)&v29[5] = v4 + v24;
  *(double *)&v29[6] = v27 + v26;
  *(double *)&v29[7] = v8 - (v24 + v20);
  *(double *)&v29[8] = v28 - (v26 + v22);
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v29];
}

uint64_t __56__SBElasticValueViewController__updateTouchTrackingArea__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateDebugUIPositions
{
  id v9 = [(SBElasticValueViewController *)self sliderView];
  if (([(UISlider *)self->_debugWidthSlider isTracking] & 1) == 0)
  {
    [v9 bounds];
    *(float *)&double v4 = v3;
    [(UISlider *)self->_debugWidthSlider setValue:v4];
  }
  if (([(UISlider *)self->_debugHeightSlider isTracking] & 1) == 0)
  {
    [v9 bounds];
    *(float *)&double v6 = v5;
    [(UISlider *)self->_debugHeightSlider setValue:v6];
  }
  if (([(UISlider *)self->_debugPortraitYOriginSlider isTracking] & 1) == 0)
  {
    [v9 center];
    *(float *)&double v8 = v7;
    [(UISlider *)self->_debugPortraitYOriginSlider setValue:v8];
  }
}

- (void)_updateForAxisChange:(unint64_t)a3
{
  self->_axis = a3;
  -[SBElasticValueViewController _updateSliderWithAxis:](self, "_updateSliderWithAxis:");
}

- (void)_updateSliderWithAxis:(unint64_t)a3
{
  id v15 = [(SBElasticValueViewController *)self sliderView];
  [v15 setAxis:a3];
  double v5 = [(SBElasticValueViewController *)self settings];
  double v6 = v5;
  if (a3 == 1)
  {
    [v5 landscapeCornerRadiusFraction];
    double v8 = v7;
    [v6 landscapeState1Height];
    double v10 = v9;
    [v6 landscapeState2Height];
  }
  else
  {
    [v5 portraitCornerRadiusFraction];
    double v8 = v12;
    [v6 portraitState1Width];
    double v10 = v13;
    [v6 portraitState2Width];
  }
  double v14 = v11;
  [v15 setCornerRadiusMinorAxisFraction:v8];
  [v15 setRegularMinorAxisDimension:v10];
  [v15 setCompactMinorAxisDimension:v14];
}

- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4
{
  return -[SBElasticValueViewController _updateSliderValue:animated:transitioningStateContextuallyIfNecessary:](self, "_updateSliderValue:animated:transitioningStateContextuallyIfNecessary:", a4, 1);
}

- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4 transitioningStateContextuallyIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  float v23 = a3;
  double v9 = [(SBElasticValueViewController *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    dismissalTimer = self->_dismissalTimer;
    *(_DWORD *)buf = 134218498;
    double v25 = a3;
    __int16 v26 = 1024;
    BOOL v27 = v6;
    __int16 v28 = 2112;
    CGRect v29 = dismissalTimer;
    _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "updateSliderValue:%f animated:%{BOOL}u -- Dismissal Timer: %@", buf, 0x1Cu);
  }

  BOOL sliderIsEditing = self->_sliderIsEditing;
  if (self->_sliderIsEditing)
  {
    int v11 = 1;
  }
  else
  {
    [(CCUIBaseSliderView *)self->_sliderView value];
    int v11 = BSFloatApproximatelyEqualToFloat();
    sliderView = self->_sliderView;
    int v13 = [(SBElasticValueViewController *)self bs_isAppearingOrAppeared];
    *(float *)&double v14 = a3;
    [(CCUIBaseSliderView *)sliderView setValue:v13 & v6 animated:v14];
  }
  [(SBElasticValueViewController *)self _updateGlyphStateIfNecessaryForValue:&v23];
  id v15 = self->_dismissalTimer;
  unint64_t v16 = 1;
  if (v15 && (v11 & 1) == 0)
  {
    double v17 = [(NSTimer *)v15 userInfo];
    CGFloat v18 = [v17 objectForKey:@"DismissalReason"];

    [(SBElasticValueViewController *)self _invalidateDismissalTimerForReason:@"updateSliderValue:animated: called"];
    [(SBElasticValueViewController *)self _scheduleDismissal:v18];

    unint64_t v16 = 0;
  }
  BOOL v19 = [(SBElasticValueViewController *)self isSliderTracking];
  int v20 = !v5;
  if (self->_state == 2) {
    int v20 = 1;
  }
  if (!sliderIsEditing && ((v20 | v11) & 1) == 0 && !v19) {
    [(SBElasticValueViewController *)self transitionStateContextuallyForValueChangeEvent];
  }
  return v16;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);
  return (SBHUDAttachmentDelegate *)WeakRetained;
}

- (void)setAttachmentDelegate:(id)a3
{
}

- (SBElasticValueDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBElasticValueDataSource *)WeakRetained;
}

- (SBElasticValueViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBElasticValueViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGPoint)positionOffset
{
  double x = self->_positionOffset.x;
  double y = self->_positionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (SBElasticHUDSettings)settings
{
  return self->_settings;
}

- (SBElasticSliderView)sliderView
{
  return self->_sliderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
  objc_storeStrong((id *)&self->_debugAutoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_routeDisplayInfo, 0);
  objc_storeStrong((id *)&self->_debugResetAudioRouteButton, 0);
  objc_storeStrong((id *)&self->_debugNextAudioRouteButton, 0);
  objc_storeStrong((id *)&self->_debugDumpButton, 0);
  objc_storeStrong((id *)&self->_debugPortraitYOriginSlider, 0);
  objc_storeStrong((id *)&self->_debugHeightSlider, 0);
  objc_storeStrong((id *)&self->_debugWidthSlider, 0);
  objc_storeStrong((id *)&self->_debugLockStateSwitch, 0);
  objc_storeStrong((id *)&self->_debugLockStateLabel, 0);
  objc_storeStrong((id *)&self->_debugAutoDismissalSwitch, 0);
  objc_storeStrong((id *)&self->_debugAutoDismissLabel, 0);
  objc_storeStrong((id *)&self->_debugStateSegmentedControl, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_debugContainerView, 0);
  objc_storeStrong((id *)&self->_displayLinkForVisiblyOffscreenMonitoring, 0);
  objc_storeStrong((id *)&self->_pendingValueToApply, 0);
  objc_storeStrong((id *)&self->_sliderApplyValueTimer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_shortLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_touchTrackingView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_sliderContainerView, 0);
}

- (void)setupFailureRelationshipForGestureRecognizer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Setting up gesture recognizer failure relationship for %{public}@", (uint8_t *)&v2, 0xCu);
}

@end