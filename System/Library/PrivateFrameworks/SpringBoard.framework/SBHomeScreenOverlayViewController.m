@interface SBHomeScreenOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)bs_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)bs_endAppearanceTransition;
- (BOOL)bs_endAppearanceTransition:(BOOL)a3;
- (BOOL)hasBackgroundBlur;
- (BOOL)isDisplayingEditingButtons;
- (BOOL)isFromLeading;
- (BOOL)isHeaderVisible;
- (BOOL)isLibraryPresentationModal;
- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3;
- (BOOL)isTransitioningPresentationProgress;
- (BOOL)shouldUseReducedMotionAnimation;
- (BOOL)showsAddWidgetButton;
- (BOOL)showsDoneButton;
- (BOOL)suppressesExtraEditingButtons;
- (CGRect)contentRect;
- (MTMaterialView)backgroundView;
- (NSLayoutConstraint)contentLeadingConstraint;
- (NSLayoutConstraint)contentWidthConstraint;
- (SBFTodayGestureSettings)gestureSettings;
- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration;
- (SBHRootSidebarController)contentViewController;
- (SBHVisibleContentPresenter)leadingSidebarViewController;
- (SBHVisibleContentPresenter)trailingSidebarViewController;
- (SBHomeScreenOverlayViewController)initWithListLayoutProvider:(id)a3;
- (SBHomeScreenOverlayViewControllerDelegate)delegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBTitledHomeScreenButton)doneButton;
- (SBTitledHomeScreenButton)widgetButton;
- (UIViewFloatAnimatableProperty)overlayPresentationFloatAnimatableProperty;
- (double)contentWidth;
- (double)contentWidthWithContainerWidth:(double)a3;
- (double)layerPresentationProgress;
- (double)presentationProgress;
- (double)titledButtonsAlpha;
- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3;
- (id)currentSidebarViewController;
- (id)makeTitledButtonOfClass:(Class)a3;
- (id)newHomeScreenButtonBackgroundView;
- (unint64_t)childContentVisibility;
- (unint64_t)contentVisibility;
- (unint64_t)presenterType;
- (void)_button:(id)a3 appearAnimated:(BOOL)a4;
- (void)_button:(id)a3 disappearAnimated:(BOOL)a4 completion:(id)a5;
- (void)_configureMatchMoveAnimationForBackgroundView:(id)a3 withSourceView:(id)a4;
- (void)_updateBackgroundView;
- (void)_updateConstraintsForPresentationProgress:(double)a3;
- (void)_updateConstraintsForPresentationProgress:(double)a3 layoutIfNeeded:(BOOL)a4;
- (void)_updateLayoutForEditButtonsWithSize:(CGSize)a3;
- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5;
- (void)doneButtonTriggered:(id)a3;
- (void)loadView;
- (void)setContentLeadingConstraint:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setContentWidthConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setFromLeading:(BOOL)a3;
- (void)setGestureSettings:(id)a3;
- (void)setLeadingSidebarViewController:(id)a3;
- (void)setOverlayPresentationFloatAnimatableProperty:(id)a3;
- (void)setPresentationProgress:(double)a3;
- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)setPresentationProgress:(double)a3 withAnimationUpdateMode:(int64_t)a4 overrideAnimationSettings:(id)a5 completionHandler:(id)a6;
- (void)setShouldUseReducedMotionAnimation:(BOOL)a3;
- (void)setShowsAddWidgetButton:(BOOL)a3;
- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setSuppressesEditingStateForListView:(BOOL)a3;
- (void)setSuppressesExtraEditingButtons:(BOOL)a3;
- (void)setTitledButtonsAlpha:(double)a3;
- (void)setTrailingSidebarViewController:(id)a3;
- (void)setTransitioningPresentationProgress:(BOOL)a3;
- (void)setWidgetButton:(id)a3;
- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widgetButtonTriggered:(id)a3;
@end

@implementation SBHomeScreenOverlayViewController

- (SBHomeScreenOverlayViewController)initWithListLayoutProvider:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeScreenOverlayViewController;
  v6 = [(SBHomeScreenOverlayViewController *)&v20 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listLayoutProvider, a3);
    v8 = [v5 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 sidebarVisualConfiguration];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FA6348]);
    }
    v10 = v9;
    if (objc_opt_respondsToSelector())
    {
      v11 = [v8 rootFolderVisualConfiguration];
    }
    else
    {
      v11 = (SBHRootFolderVisualConfiguration *)objc_alloc_init(MEMORY[0x1E4FA6318]);
    }
    rootFolderVisualConfiguration = v7->_rootFolderVisualConfiguration;
    v7->_rootFolderVisualConfiguration = v11;

    v7->_fromLeading = 1;
    v7->_presentationProgress = 0.0;
    v7->_titledButtonsAlpha = 1.0;
    v7->_contentVisibility = 0;
    uint64_t v13 = [MEMORY[0x1E4FA6018] rootSettings];
    gestureSettings = v7->_gestureSettings;
    v7->_gestureSettings = (SBFTodayGestureSettings *)v13;

    v15 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
    overlayPresentationFloatAnimatableProperty = v7->_overlayPresentationFloatAnimatableProperty;
    v7->_overlayPresentationFloatAnimatableProperty = v15;

    [(UIViewFloatAnimatableProperty *)v7->_overlayPresentationFloatAnimatableProperty setValue:0.0];
    v17 = (SBHRootSidebarController *)objc_alloc_init(MEMORY[0x1E4FA6320]);
    contentViewController = v7->_contentViewController;
    v7->_contentViewController = v17;

    [(SBHRootSidebarController *)v7->_contentViewController setSidebarVisualConfiguration:v10];
    [(SBHRootSidebarController *)v7->_contentViewController setLayoutInsetsIgnoredEdges:4];
  }
  return v7;
}

- (void)setLeadingSidebarViewController:(id)a3
{
  id v5 = (SBHVisibleContentPresenter *)a3;
  if (self->_leadingSidebarViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_leadingSidebarViewController, a3);
    leadingSidebarViewController = self->_leadingSidebarViewController;
    if (self->_fromLeading) {
      unint64_t v7 = [(SBHomeScreenOverlayViewController *)self childContentVisibility];
    }
    else {
      unint64_t v7 = 2;
    }
    [(SBHVisibleContentPresenter *)leadingSidebarViewController setContentVisibility:v7];
    id v5 = v8;
  }
}

- (void)setTrailingSidebarViewController:(id)a3
{
  id v5 = (SBHVisibleContentPresenter *)a3;
  if (self->_trailingSidebarViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_trailingSidebarViewController, a3);
    trailingSidebarViewController = self->_trailingSidebarViewController;
    if (self->_fromLeading) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = [(SBHomeScreenOverlayViewController *)self childContentVisibility];
    }
    [(SBHVisibleContentPresenter *)trailingSidebarViewController setContentVisibility:v7];
    id v5 = v8;
  }
}

- (id)currentSidebarViewController
{
  if (self->_fromLeading) {
    v2 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
  }
  else {
    v2 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
  }
  id v3 = *(id *)((char *)&self->super.super.super.isa + *v2);
  return v3;
}

- (double)contentWidth
{
  id v3 = [(SBHomeScreenOverlayViewController *)self view];
  [v3 bounds];
  [(SBHomeScreenOverlayViewController *)self contentWidthWithContainerWidth:CGRectGetWidth(v7)];
  double v5 = v4;

  return v5;
}

- (double)contentWidthWithContainerWidth:(double)a3
{
  double v4 = [(SBHRootSidebarController *)self->_contentViewController sidebarVisualConfiguration];
  [v4 insets];
  double v6 = v5;
  double v8 = v7;
  [v4 effectiveContentWidthWithContainerWidth:a3];
  double v10 = v8 + v6 + v9;

  return v10;
}

- (CGRect)contentRect
{
  v2 = [(SBHomeScreenOverlayViewController *)self contentViewController];
  id v3 = [v2 view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)loadView
{
  v49.receiver = self;
  v49.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v49 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FA5F10]);
  double v4 = [(SBHomeScreenOverlayViewController *)self view];
  [v4 frame];
  double v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setFocusGroupIdentifier:@"HomeScreenOverlay"];
  [(SBHomeScreenOverlayViewController *)self setView:v5];
  double v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v8 = @"homeScreenOverlay-iPad";
  }
  else {
    double v8 = @"homeScreenOverlay";
  }
  double v9 = (void *)MEMORY[0x1E4F743C8];
  double v10 = v8;
  double v11 = SBHBundle();
  double v12 = [v9 materialViewWithRecipeNamed:v10 inBundle:v11 options:0 initialWeighting:0 scaleAdjustment:0.1];

  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  [(MTMaterialView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MTMaterialView *)self->_backgroundView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
  [(MTMaterialView *)self->_backgroundView setGroupNameBase:@"HOMESCREEN_OVERLAY_BACKGROUNDVIEW"];
  double v14 = 0.0;
  [(MTMaterialView *)self->_backgroundView setWeighting:0.0];
  [v5 addSubview:self->_backgroundView];
  v48 = [(SBHomeScreenOverlayViewController *)self contentViewController];
  double v15 = [v48 view];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBHomeScreenOverlayViewController *)self bs_addChildViewController:v48];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v47 = [v48 sidebarVisualConfiguration];
  [v47 insets];
  double v18 = v17;
  v19 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = v18;
  }
  v21 = [v5 leadingAnchor];
  v22 = [v15 leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];

  [v16 addObject:v23];
  v24 = [v15 topAnchor];
  v25 = [v5 topAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:v18];
  [v16 addObject:v26];

  v27 = [v5 bottomAnchor];
  v28 = [v15 bottomAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:v14];
  [v16 addObject:v29];

  v30 = [v15 widthAnchor];
  [(SBHomeScreenOverlayViewController *)self contentWidth];
  v31 = objc_msgSend(v30, "constraintEqualToConstant:");

  [v16 addObject:v31];
  v32 = [v5 topAnchor];
  v33 = [(MTMaterialView *)self->_backgroundView topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v16 addObject:v34];

  v35 = [v5 bottomAnchor];
  v36 = [(MTMaterialView *)self->_backgroundView bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v16 addObject:v37];

  v38 = [v5 leadingAnchor];
  v39 = [(MTMaterialView *)self->_backgroundView leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v16 addObject:v40];

  v41 = [v5 trailingAnchor];
  v42 = [(MTMaterialView *)self->_backgroundView trailingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v16 addObject:v43];

  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  [(SBHomeScreenOverlayViewController *)self setContentLeadingConstraint:v23];
  [(SBHomeScreenOverlayViewController *)self setContentWidthConstraint:v31];
  v44 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  [(SBHRootSidebarController *)self->_contentViewController setLegibilitySettings:v44];
  [v5 bounds];
  self->_boundsSizeForConstraints.width = v45;
  self->_boundsSizeForConstraints.height = v46;
  [(SBHomeScreenOverlayViewController *)self _updateConstraintsForPresentationProgress:0 layoutIfNeeded:self->_presentationProgress];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay will appear, animated: %{BOOL}u.", buf, 8u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = _SBFLoggingMethodProem();
    uint64_t v7 = [(SBHomeScreenOverlayViewController *)self interfaceOrientation];
    BOOL v8 = [(SBHomeScreenOverlayViewController *)self view];
    [v8 frame];
    uint64_t v9 = NSStringFromCGRect(v24);
    double v10 = [(SBHomeScreenOverlayViewController *)self contentLeadingConstraint];
    [v10 constant];
    *(_DWORD *)buf = 138544386;
    double v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Overlay Position] %{public}@ animated: %{BOOL}u, orientation: %ld, overlayFrame:%{public}@, leading constrait: %f", buf, 0x30u);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v12 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay will disappear, animated: %{BOOL}u.", buf, 8u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay did disappear, animated: %{BOOL}u.", buf, 8u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v7 viewDidDisappear:v3];
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  self->_reasonsToSnapshotBackgroundView = 0;
}

- (BOOL)bs_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v7 > 3) {
    BOOL v8 = @"(unknown)";
  }
  else {
    BOOL v8 = off_1E6B0ED90[v7];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBHomeScreenOverlayViewController;
  BOOL v9 = [(SBHomeScreenOverlayViewController *)&v16 bs_beginAppearanceTransition:v5 animated:v4];
  unsigned int v10 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v10 > 3) {
    uint64_t v11 = @"(unknown)";
  }
  else {
    uint64_t v11 = off_1E6B0ED90[v10];
  }
  objc_super v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = _SBFLoggingMethodProem();
    double v14 = @"didn't end";
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v13;
    if (v9) {
      double v14 = @"ended";
    }
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    CGRect v24 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);
  }
  return v9;
}

- (BOOL)bs_endAppearanceTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v5 > 3) {
    objc_super v6 = @"(unknown)";
  }
  else {
    objc_super v6 = off_1E6B0ED90[v5];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenOverlayViewController;
  BOOL v7 = [(SBHomeScreenOverlayViewController *)&v14 bs_endAppearanceTransition:v3];
  unsigned int v8 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v8 > 3) {
    BOOL v9 = @"(unknown)";
  }
  else {
    BOOL v9 = off_1E6B0ED90[v8];
  }
  unsigned int v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = _SBFLoggingMethodProem();
    objc_super v12 = @"didn't end";
    *(_DWORD *)buf = 138413058;
    objc_super v16 = v11;
    if (v7) {
      objc_super v12 = @"ended";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);
  }
  return v7;
}

- (BOOL)bs_endAppearanceTransition
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v3 > 3) {
    BOOL v4 = @"(unknown)";
  }
  else {
    BOOL v4 = off_1E6B0ED90[v3];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenOverlayViewController;
  BOOL v5 = [(SBHomeScreenOverlayViewController *)&v12 bs_endAppearanceTransition];
  unsigned int v6 = [(SBHomeScreenOverlayViewController *)self _appearState];
  if (v6 > 3) {
    BOOL v7 = @"(unknown)";
  }
  else {
    BOOL v7 = off_1E6B0ED90[v6];
  }
  unsigned int v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = _SBFLoggingMethodProem();
    unsigned int v10 = @"didn't end";
    *(_DWORD *)buf = 138413058;
    objc_super v14 = v9;
    if (v5) {
      unsigned int v10 = @"ended";
    }
    __int16 v15 = 2112;
    objc_super v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);
  }
  return v5;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v7 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6) {
    [(SBHomeScreenOverlayViewController *)self _configureMatchMoveAnimationForBackgroundView:self->_backgroundView withSourceView:v6];
  }
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SBHomeScreenOverlayViewController;
  [(SBHomeScreenOverlayViewController *)&v10 viewWillLayoutSubviews];
  unsigned int v3 = [(SBHomeScreenOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 != self->_boundsSizeForConstraints.width || v7 != self->_boundsSizeForConstraints.height)
  {
    self->_boundsSizeForConstraints.width = v5;
    self->_boundsSizeForConstraints.height = v7;
    BOOL v9 = [(SBHomeScreenOverlayViewController *)self contentWidthConstraint];
    [(SBHomeScreenOverlayViewController *)self contentWidthWithContainerWidth:v5];
    objc_msgSend(v9, "setConstant:");

    [(SBHomeScreenOverlayViewController *)self _updateConstraintsForPresentationProgress:0 layoutIfNeeded:self->_presentationProgress];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)SBHomeScreenOverlayViewController;
  id v8 = a4;
  -[SBHomeScreenOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  BOOL v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = _SBFLoggingMethodProem();
    v28.double width = width;
    v28.double height = height;
    uint64_t v11 = NSStringFromCGSize(v28);
    *(_DWORD *)buf = 138412546;
    CGRect v24 = v10;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@ to size %@", buf, 0x16u);
  }
  objc_super v12 = [(MTMaterialView *)self->_backgroundView layer];
  double v13 = [v12 animationForKey:@"MatchMoveBackgroundView"];
  [v12 removeAnimationForKey:@"MatchMoveBackgroundView"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v21[3] = &unk_1E6B09440;
  v21[4] = self;
  *(double *)&v21[5] = width;
  *(double *)&v21[6] = height;
  v21[7] = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_64;
  v16[3] = &unk_1E6B0ED20;
  id v17 = v12;
  id v18 = v13;
  __int16 v19 = self;
  SEL v20 = a2;
  id v14 = v13;
  id v15 = v12;
  [v8 animateAlongsideTransition:v21 completion:v16];
}

uint64_t __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) contentWidthWithContainerWidth:*(double *)(a1 + 40)];
  double v3 = v2;
  double v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = _SBFLoggingMethodProem();
    int v8 = 138412546;
    BOOL v9 = v5;
    __int16 v10 = 2048;
    double v11 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%@ animate to width %f", (uint8_t *)&v8, 0x16u);
  }
  double v6 = [*(id *)(a1 + 32) contentWidthConstraint];
  [v6 setConstant:v3];

  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForEditButtonsWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_64(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"MatchMoveBackgroundView"];
  [*(id *)(a1 + 48) contentWidth];
  double v3 = v2;
  double v4 = [*(id *)(a1 + 48) contentWidthConstraint];
  [v4 setConstant:v3];

  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    int v7 = 138412546;
    int v8 = v6;
    __int16 v9 = 2048;
    double v10 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ animate completed with new width %f", (uint8_t *)&v7, 0x16u);
  }
}

- (double)layerPresentationProgress
{
  [(UIViewFloatAnimatableProperty *)self->_overlayPresentationFloatAnimatableProperty presentationValue];
  return result;
}

- (void)setPresentationProgress:(double)a3
{
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v6 = 3;
  if (a4) {
    uint64_t v6 = 5;
  }
  if (a5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 2;
  }
  [(SBHomeScreenOverlayViewController *)self setPresentationProgress:v7 withAnimationUpdateMode:0 overrideAnimationSettings:a6 completionHandler:a3];
}

- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5
{
  id v32 = a5;
  if ([(SBFTodayGestureSettings *)self->_gestureSettings scaleAnimationSettingsWithGestureVelocity])
  {
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    [(SBFTodayGestureSettings *)self->_gestureSettings minimumVelocity];
    double v10 = v9;
    [(SBFTodayGestureSettings *)self->_gestureSettings maximumVelocity];
    double v12 = v11;
    [(SBFTodayGestureSettings *)self->_gestureSettings dampingRatioAtMinimumVelocity];
    double v14 = v13;
    [(SBFTodayGestureSettings *)self->_gestureSettings dampingRatioAtMaximumVelocity];
    double v16 = v15;
    [(SBFTodayGestureSettings *)self->_gestureSettings responseAtMinimumVelocity];
    double v18 = v17;
    [(SBFTodayGestureSettings *)self->_gestureSettings responseAtMaximumVelocity];
    double v20 = fabs(a4);
    double v21 = v20 - v10;
    double v22 = v14 + (v20 - v10) * (v16 - v14) / (v12 - v10);
    if (v14 >= v16) {
      double v23 = v14;
    }
    else {
      double v23 = v16;
    }
    if (v14 <= v16) {
      double v24 = v14;
    }
    else {
      double v24 = v16;
    }
    if (v24 >= v22) {
      double v22 = v24;
    }
    if (v23 <= v22) {
      double v22 = v23;
    }
    double v25 = v18 + v21 * (v19 - v18) / (v12 - v10);
    if (v18 >= v19) {
      double v26 = v18;
    }
    else {
      double v26 = v19;
    }
    if (v18 <= v19) {
      double v19 = v18;
    }
    if (v19 < v25) {
      double v19 = v25;
    }
    if (v26 <= v19) {
      double v27 = v26;
    }
    else {
      double v27 = v19;
    }
    [v8 setDampingRatio:v22];
    [v8 setResponse:v27];
    CGSize v28 = [(SBFTodayGestureSettings *)self->_gestureSettings overlayPositionSettings];
    [v28 retargetImpulse];
    objc_msgSend(v8, "setRetargetImpulse:");

    CAFrameRateRange v34 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v34.minimum, *(double *)&v34.maximum, *(double *)&v34.preferred);
  }
  else
  {
    int v8 = 0;
  }
  [(SBHomeScreenOverlayViewController *)self setPresentationProgress:3 withAnimationUpdateMode:v8 overrideAnimationSettings:v32 completionHandler:a3];
  v29 = [(SBHomeScreenOverlayViewController *)self contentViewController];
  v30 = [v29 view];

  v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a4, 0.0);
  [v30 _setVelocity:v31 forKey:@"position"];
  [v30 _setTargetVelocity:v31 forKey:@"position"];
}

- (void)setPresentationProgress:(double)a3 withAnimationUpdateMode:(int64_t)a4 overrideAnimationSettings:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    id v12 = v10;
    double v13 = v12;
  }
  else
  {
    double v13 = [(SBFTodayGestureSettings *)self->_gestureSettings overlayPositionSettings];
    id v12 = [(SBFTodayGestureSettings *)self->_gestureSettings overlayBackdropSettings];
  }
  if (self->_presentationProgress != a3)
  {
    self->_presentationProgress = a3;
    [(SBHomeScreenOverlayViewController *)self setTransitioningPresentationProgress:1];
    double v14 = [(SBHomeScreenOverlayViewController *)self currentSidebarViewController];
    objc_msgSend(v14, "setContentVisibility:", -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility"));
    if ([(SBHomeScreenOverlayViewController *)self shouldUseReducedMotionAnimation])
    {
      ++self->_fadingAnimationCount;
      double v15 = (void *)MEMORY[0x1E4F42FF0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke;
      v30[3] = &unk_1E6AF4A70;
      v30[4] = self;
      *(double *)&v30[5] = a3;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_2;
      v27[3] = &unk_1E6AF5268;
      v27[4] = self;
      double v29 = a3;
      id v28 = v11;
      objc_msgSend(v15, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v30, v27);
      double v16 = v28;
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_3;
      v24[3] = &unk_1E6AF5268;
      v24[4] = self;
      double v26 = a3;
      id v25 = v11;
      double v17 = (void *)MEMORY[0x1D948C7A0](v24);
      double v18 = (void *)MEMORY[0x1E4FA5E48];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_4;
      v19[3] = &unk_1E6B0ED48;
      v19[4] = self;
      id v20 = v12;
      int64_t v22 = a4;
      double v23 = a3;
      id v21 = v13;
      [v18 perform:v19 finalCompletion:v17];

      double v16 = v25;
    }
  }
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setWeighting:*(double *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setAlpha:*(double *)(a1 + 40)];
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 992);
  if (!v3 || (*(void *)(v2 + 992) = v3 - 1, uint64_t v2 = *(void *)(a1 + 32), !*(void *)(v2 + 992)))
  {
    if (*(double *)(v2 + 1048) == *(double *)(a1 + 48))
    {
      [(id)v2 setTransitioningPresentationProgress:0];
      [*(id *)(*(void *)(a1 + 32) + 1144) setValue:*(double *)(a1 + 48)];
      [*(id *)(a1 + 32) _updateConstraintsForPresentationProgress:*(double *)(a1 + 48)];
      double v4 = [*(id *)(a1 + 32) view];
      [v4 setAlpha:1.0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 984);
  if (!v3 || (*(void *)(v2 + 984) = v3 - 1, uint64_t v2 = *(void *)(a1 + 32), !*(void *)(v2 + 984)))
  {
    if (*(double *)(v2 + 1048) == *(double *)(a1 + 48)) {
      [(id)v2 setTransitioningPresentationProgress:0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_4(void *a1, void (**a2)(id, __CFString *))
{
  ++*(void *)(a1[4] + 984);
  uint64_t v3 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v4 = a1[7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_5;
  v15[3] = &unk_1E6AF4A70;
  uint64_t v5 = a1[5];
  v15[4] = a1[4];
  v15[5] = a1[8];
  uint64_t v7 = a2 + 2;
  uint64_t v6 = (void (*)(void))a2[2];
  int v8 = a2;
  double v9 = v6();
  objc_msgSend(v3, "sb_animateWithSettings:mode:animations:completion:", v5, v4, v15, v9);

  id v10 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v11 = a1[6];
  uint64_t v12 = a1[7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_6;
  v14[3] = &unk_1E6AF4A70;
  v14[4] = a1[4];
  v14[5] = a1[8];
  double v13 = (*v7)(v8, @"overlayPositionAnimation");

  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, v12, v14, v13);
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setWeighting:*(double *)(a1 + 40)];
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_6(uint64_t a1, double a2, double a3, double a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_7;
  v7[3] = &unk_1E6AF4A70;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  HIDWORD(v5) = HIDWORD(v8);
  LODWORD(v5) = *MEMORY[0x1E4F39AF0];
  LODWORD(a3) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(a4) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v7, v5, a3, a4);
  return [*(id *)(a1 + 32) _updateConstraintsForPresentationProgress:*(double *)(a1 + 40)];
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1144) setValue:*(double *)(a1 + 40)];
}

- (void)setFromLeading:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_fromLeading != a3
    || ([(SBHRootSidebarController *)self->_contentViewController avocadoViewController],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_fromLeading = v3;
    uint64_t v6 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
    if (v3) {
      uint64_t v7 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
    }
    else {
      uint64_t v7 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
    }
    uint64_t v8 = *(Class *)((char *)&self->super.super.super.isa + *v7);
    if (!v3) {
      uint64_t v6 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
    }
    id v9 = *(id *)((char *)&self->super.super.super.isa + *v6);
    id v10 = v8;
    objc_msgSend(v9, "setContentVisibility:", -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility"));
    [(SBHRootSidebarController *)self->_contentViewController setAvocadoViewController:v9];
    [(SBHomeScreenOverlayViewController *)self _updateConstraintsForPresentationProgress:self->_presentationProgress];
    [v10 setContentVisibility:2];
  }
}

- (BOOL)isHeaderVisible
{
  return 0;
}

- (void)setSuppressesExtraEditingButtons:(BOOL)a3
{
  if (self->_suppressesExtraEditingButtons != a3)
  {
    self->_suppressesExtraEditingButtons = a3;
    [(SBHomeScreenOverlayViewController *)self updateExtraButtonVisibilityAnimated:1];
  }
}

- (void)setContentVisibility:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    uint64_t v4 = [(SBHomeScreenOverlayViewController *)self currentSidebarViewController];
    unint64_t v5 = [(SBHomeScreenOverlayViewController *)self childContentVisibility];
    uint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      id v9 = SBHStringFromContentVisibility();
      id v10 = SBHStringFromContentVisibility();
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      double v14 = v9;
      __int16 v15 = 2114;
      double v16 = v10;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Setting home screen overlay overlay controller '%{public}@' to content visibility: %{public}@, child visibility: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [v4 setContentVisibility:v5];
  }
}

- (unint64_t)childContentVisibility
{
  [(SBHomeScreenOverlayViewController *)self presentationProgress];
  if (v3 <= 0.0) {
    return 2;
  }
  return [(SBHomeScreenOverlayViewController *)self contentVisibility];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureMatchMoveAnimationForBackgroundView:(id)a3 withSourceView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = _SBFLoggingMethodProem();
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [MEMORY[0x1E4FA5E88] matchMoveAnimationForPinningToView:v5];

  [v6 addAnimation:v9 forKey:@"MatchMoveBackgroundView"];
}

- (void)_updateConstraintsForPresentationProgress:(double)a3
{
}

- (void)_updateConstraintsForPresentationProgress:(double)a3 layoutIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = 0.0;
  if (BSFloatIsZero())
  {
    uint64_t v8 = [(SBHomeScreenOverlayViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [v8 window];
    objc_msgSend(v8, "convertRect:toView:", v17, v10, v12, v14, v16);
    double v19 = v18;

    if (BSFloatIsZero()) {
      double v7 = 0.0;
    }
    else {
      double v7 = v19 + 10.0;
    }
  }
  BOOL v20 = [(SBHomeScreenOverlayViewController *)self isFromLeading];
  [(SBHomeScreenOverlayViewController *)self contentWidth];
  double v22 = v7 + v21 * (1.0 - a3);
  if (v20) {
    double v23 = v22;
  }
  else {
    double v23 = -v22;
  }
  double v24 = [(SBHomeScreenOverlayViewController *)self contentLeadingConstraint];
  [v24 setConstant:v23];

  if (v4)
  {
    id v25 = [(SBHomeScreenOverlayViewController *)self view];
    [v25 layoutIfNeeded];
  }
}

- (id)newHomeScreenButtonBackgroundView
{
  double v3 = [(SBHomeScreenOverlayViewController *)self delegate];
  BOOL v4 = [v3 backgroundViewForEditingDoneButtonForHomeScreenOverlayViewController:self];

  if (!v4)
  {
    [MEMORY[0x1E4FA6430] componentBackgroundView];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  id v5 = [(SBHomeScreenOverlayViewController *)self newHomeScreenButtonBackgroundView];
  id v6 = [a3 alloc];
  double v7 = objc_msgSend(v6, "initWithFrame:backgroundView:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v8 = [v7 configuration];
  [(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration editModeButtonContentEdgeInsets];
  objc_msgSend(v8, "setContentInsets:");
  [v7 setConfiguration:v8];
  [(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration editModeButtonSize];
  objc_msgSend(v7, "setPreferredContentFittingSize:");
  double v9 = [v7 materialView];
  double v10 = [(SBHRootSidebarController *)self->_contentViewController legibilitySettings];
  objc_msgSend(v9, "setLegibilityStyle:", objc_msgSend(v10, "style"));

  return v7;
}

- (void)setShowsDoneButton:(BOOL)a3
{
}

- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsDoneButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showsDoneButton = a3;
    double v7 = [(SBHomeScreenOverlayViewController *)self doneButton];
    id v8 = v7;
    if (v5)
    {
      if (!v7)
      {
        double v9 = [(SBHomeScreenOverlayViewController *)self makeTitledButtonOfClass:objc_opt_class()];
        [v9 addTarget:self action:sel_doneButtonTriggered_ forControlEvents:0x2000];
        [(SBHomeScreenOverlayViewController *)self setDoneButton:v9];
        double v10 = (void *)MEMORY[0x1E4F42FF0];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke;
        v14[3] = &unk_1E6AF5290;
        v14[4] = self;
        id v8 = v9;
        id v15 = v8;
        [v10 performWithoutAnimation:v14];
      }
      [(SBHomeScreenOverlayViewController *)self _button:v8 appearAnimated:v4];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke_2;
      v11[3] = &unk_1E6AF4A98;
      id v8 = v7;
      id v12 = v8;
      double v13 = self;
      [(SBHomeScreenOverlayViewController *)self _button:v8 disappearAnimated:v4 completion:v11];
    }
  }
}

void __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [v2 view];
  [v3 bounds];
  objc_msgSend(v2, "_updateLayoutForEditButtonsWithSize:", v4, v5);

  id v6 = [*(id *)(a1 + 32) view];
  [v6 addSubview:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

uint64_t __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  return [v2 setDoneButton:0];
}

- (void)setShowsAddWidgetButton:(BOOL)a3
{
}

- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsAddWidgetButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showsAddWidgetButton = a3;
    id v7 = [(SBHomeScreenOverlayViewController *)self widgetButton];
    [v7 setAccessibilityIdentifier:@"avocado-widget-add-button"];
    if (v5)
    {
      if (!v7)
      {
        id v8 = [(SBHomeScreenOverlayViewController *)self makeTitledButtonOfClass:objc_opt_class()];
        [v8 addTarget:self action:sel_widgetButtonTriggered_ forControlEvents:0x2000];
        [(SBHomeScreenOverlayViewController *)self setWidgetButton:v8];
        double v9 = (void *)MEMORY[0x1E4F42FF0];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke;
        v13[3] = &unk_1E6AF5290;
        v13[4] = self;
        id v7 = v8;
        id v14 = v7;
        [v9 performWithoutAnimation:v13];
      }
      [(SBHomeScreenOverlayViewController *)self _button:v7 appearAnimated:v4];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke_2;
      v10[3] = &unk_1E6AF4A98;
      id v7 = v7;
      id v11 = v7;
      id v12 = self;
      [(SBHomeScreenOverlayViewController *)self _button:v7 disappearAnimated:v4 completion:v10];
    }
  }
}

void __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [v2 view];
  [v3 bounds];
  objc_msgSend(v2, "_updateLayoutForEditButtonsWithSize:", v4, v5);

  id v6 = [*(id *)(a1 + 32) view];
  [v6 addSubview:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

uint64_t __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  return [v2 setWidgetButton:0];
}

- (void)doneButtonTriggered:(id)a3
{
  id v4 = [(SBHomeScreenOverlayViewController *)self delegate];
  [v4 homeScreenOverlayViewWantsToEndEditing:self];
}

- (void)widgetButtonTriggered:(id)a3
{
  id v4 = [(SBHomeScreenOverlayViewController *)self delegate];
  [v4 homeScreenOverlayViewWantsWidgetEditingViewControllerPresented:self];
}

- (void)_button:(id)a3 appearAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = (void *)MEMORY[0x1E4F42FF0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke;
    v14[3] = &unk_1E6AF4AC0;
    id v9 = v6;
    id v15 = v9;
    [v8 performWithoutAnimation:v14];
    double v10 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke_2;
    v11[3] = &unk_1E6AF5290;
    id v12 = v9;
    double v13 = self;
    [v10 animateWithDuration:v11 animations:0.2];
  }
}

uint64_t __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 40) + 1032)];
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

- (void)_button:(id)a3 disappearAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v6)
  {
    double v10 = (void *)MEMORY[0x1E4F42FF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke;
    v13[3] = &unk_1E6AF4AC0;
    id v14 = v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E6AF5A50;
    id v12 = v9;
    [v10 animateWithDuration:v13 animations:v11 completion:0.2];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return [v2 setTransform:&v4];
}

uint64_t __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
  }
  return result;
}

- (void)_updateLayoutForEditButtonsWithSize:(CGSize)a3
{
  CGAffineTransform v4 = [(SBHomeScreenOverlayViewController *)self doneButton];
  double v5 = [(SBHomeScreenOverlayViewController *)self widgetButton];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v6;
  long long v8 = v10;
  long long v9 = v6;
  BOOL v7 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
  BSRectWithSize();
  objc_msgSend(MEMORY[0x1E4FA6468], "_editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:", self->_rootFolderVisualConfiguration, v7, v4, v5, &v8, &v10);
  objc_msgSend(v4, "sb_setBoundsAndPositionFromFrame:", v8, v9);
  objc_msgSend(v5, "sb_setBoundsAndPositionFromFrame:", v10, v11);
}

- (unint64_t)presenterType
{
  return 1;
}

- (BOOL)isDisplayingEditingButtons
{
  if ([(SBHomeScreenOverlayViewController *)self showsDoneButton]) {
    return 1;
  }
  return [(SBHomeScreenOverlayViewController *)self showsAddWidgetButton];
}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(SBHomeScreenOverlayViewController *)self delegate];
  int v5 = [v12 showsAddWidgetButtonWhileEditingForHomeScreenOverlayViewController:self];
  int v6 = [v12 showsDoneButtonWhileEditingForHomeScreenOverlayViewController:self];
  uint64_t v7 = [v12 isEditingForHomeScreenOverlayViewController:self];
  uint64_t v8 = [(SBHomeScreenOverlayViewController *)self interfaceOrientation];
  BOOL v9 = [(SBHomeScreenOverlayViewController *)self suppressesExtraEditingButtons];
  if (v7)
  {
    uint64_t v7 = !v9;
    uint64_t v10 = v6 & v7;
    if (!v5) {
      goto LABEL_6;
    }
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (!__sb__runningInSpringBoard())
      {
        long long v11 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v11 userInterfaceIdiom] == 1) {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v7 = 0;
        }

        goto LABEL_8;
      }
      if (SBFEffectiveDeviceClass() != 2) {
LABEL_6:
      }
        uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_8:
  [(SBHomeScreenOverlayViewController *)self setShowsDoneButton:v10 animated:v3];
  [(SBHomeScreenOverlayViewController *)self setShowsAddWidgetButton:v7 animated:v3];
}

- (void)setTitledButtonsAlpha:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_titledButtonsAlpha != a3)
  {
    self->_titledButtonsAlpha = a3;
    int v5 = SBLogRootController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134349056;
      double v7 = a3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBHomeScreenOverlayViewController setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    [(SBTitledHomeScreenButton *)self->_doneButton setAlpha:a3];
    [(SBTitledHomeScreenButton *)self->_widgetButton setAlpha:a3];
  }
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBHomeScreenOverlayViewController *)self delegate];
  [v5 homeScreenOverlayViewController:self setSuppressesEditingStateForListView:v3];
}

- (BOOL)isLibraryPresentationModal
{
  return 0;
}

- (BOOL)hasBackgroundBlur
{
  return 1;
}

- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenOverlayViewController *)self contentViewController];
  id v6 = [v5 avocadoViewController];
  if (v6 == v4) {
    char v7 = objc_msgSend(v4, "bs_isAppearingOrAppeared");
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3
{
  id v4 = a3;
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  if (!reasonsToSnapshotBackgroundView)
  {
    id v6 = [MEMORY[0x1E4F28BD0] set];
    char v7 = self->_reasonsToSnapshotBackgroundView;
    self->_reasonsToSnapshotBackgroundView = v6;

    reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  }
  uint64_t v8 = reasonsToSnapshotBackgroundView;
  [(NSCountedSet *)v8 addObject:v4];
  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __90__SBHomeScreenOverlayViewController_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke;
  uint64_t v17 = &unk_1E6B0ED70;
  uint64_t v10 = v8;
  double v18 = v10;
  id v11 = v4;
  id v19 = v11;
  objc_copyWeak(&v20, &location);
  id v12 = (void *)[v9 initWithIdentifier:@"SBHomeScreenOverlayViewController" forReason:v11 invalidationBlock:&v14];
  [(SBHomeScreenOverlayViewController *)self _updateBackgroundView];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v12;
}

void __90__SBHomeScreenOverlayViewController_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateBackgroundView];
}

- (void)setTransitioningPresentationProgress:(BOOL)a3
{
  if (self->_transitioningPresentationProgress != a3)
  {
    self->_transitioningPresentationProgress = a3;
    [(SBHomeScreenOverlayViewController *)self _updateBackgroundView];
  }
}

- (void)_updateBackgroundView
{
  BOOL v3 = ![(SBHomeScreenOverlayViewController *)self isTransitioningPresentationProgress]&& ([(SBHomeScreenOverlayViewController *)self presentationProgress], BSFloatEqualToFloat())&& [(NSCountedSet *)self->_reasonsToSnapshotBackgroundView count] != 0;
  int v4 = [(MTMaterialView *)self->_backgroundView isContentReplacedWithSnapshot];
  if (!v3 || (v4 & 1) != 0)
  {
    if (((v3 | v4 ^ 1) & 1) == 0)
    {
      char v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[SBHomeScreenOverlayViewController] Returning background to live blur", v9, 2u);
      }

      [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:0];
      uint64_t v8 = [(MTMaterialView *)self->_backgroundView layer];
      [v8 setContentsOpaque:0];

      [(MTMaterialView *)self->_backgroundView layoutIfNeeded];
    }
  }
  else
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[SBHomeScreenOverlayViewController] Replacing background with snapshot", buf, 2u);
    }

    [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:1];
    id v6 = [(MTMaterialView *)self->_backgroundView layer];
    [v6 setContentsOpaque:1];
  }
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (SBHomeScreenOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeScreenOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (BOOL)isFromLeading
{
  return self->_fromLeading;
}

- (BOOL)shouldUseReducedMotionAnimation
{
  return self->_shouldUseReducedMotionAnimation;
}

- (void)setShouldUseReducedMotionAnimation:(BOOL)a3
{
  self->_shouldUseReducedMotionAnimation = a3;
}

- (SBHRootSidebarController)contentViewController
{
  return self->_contentViewController;
}

- (SBHVisibleContentPresenter)leadingSidebarViewController
{
  return self->_leadingSidebarViewController;
}

- (SBHVisibleContentPresenter)trailingSidebarViewController
{
  return self->_trailingSidebarViewController;
}

- (BOOL)suppressesExtraEditingButtons
{
  return self->_suppressesExtraEditingButtons;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return self->_rootFolderVisualConfiguration;
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (void)setContentWidthConstraint:(id)a3
{
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (SBTitledHomeScreenButton)widgetButton
{
  return self->_widgetButton;
}

- (void)setWidgetButton:(id)a3
{
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsAddWidgetButton
{
  return self->_showsAddWidgetButton;
}

- (SBFTodayGestureSettings)gestureSettings
{
  return self->_gestureSettings;
}

- (void)setGestureSettings:(id)a3
{
}

- (UIViewFloatAnimatableProperty)overlayPresentationFloatAnimatableProperty
{
  return self->_overlayPresentationFloatAnimatableProperty;
}

- (void)setOverlayPresentationFloatAnimatableProperty:(id)a3
{
}

- (BOOL)isTransitioningPresentationProgress
{
  return self->_transitioningPresentationProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayPresentationFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_gestureSettings, 0);
  objc_storeStrong((id *)&self->_widgetButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_trailingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_leadingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reasonsToSnapshotBackgroundView, 0);
}

@end