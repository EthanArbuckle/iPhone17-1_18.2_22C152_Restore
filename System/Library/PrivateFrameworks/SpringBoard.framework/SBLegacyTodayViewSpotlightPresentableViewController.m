@interface SBLegacyTodayViewSpotlightPresentableViewController
- (BOOL)_canShowWhileLocked;
- (MTMaterialView)searchBackdropView;
- (NSArray)searchBarGradientMaskLayers;
- (NSLayoutConstraint)featherBlurHeightConstraint;
- (NSLayoutConstraint)searchBarViewTopConstraint;
- (NSMutableSet)searchBarPortalRequirementReasons;
- (SBFFeatherBlurView)featherBlurView;
- (SBLegacyTodayViewSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3 searchBarViewController:(id)a4 scrollView:(id)a5;
- (SBLegacyTodayViewSpotlightPresentableViewControllerDelegate)delegate;
- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController;
- (SPUISearchBarController)searchBarViewController;
- (UIScrollView)scrollView;
- (_UIPortalView)searchBarPortalView;
- (double)maxPresentationOffset;
- (double)topOffset;
- (id)_sharedRemoteSearchViewController;
- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5;
- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3;
- (void)_endRequiringSearchBarPortalViewForReason:(id)a3;
- (void)_setUpFeatherBackgroundMatchMoveAnimations;
- (void)_setUpSearchBackdrop;
- (void)_setUpSearchBackdropMatchMoveAnimation;
- (void)_setUpSearchBar;
- (void)_updateMaskLayers;
- (void)dismissSearchView;
- (void)setDelegate:(id)a3;
- (void)setFeatherBlurHeightConstraint:(id)a3;
- (void)setFeatherBlurView:(id)a3;
- (void)setMaxPresentationOffset:(double)a3;
- (void)setSearchBackdropView:(id)a3;
- (void)setSearchBarGradientMaskLayers:(id)a3;
- (void)setSearchBarPortalRequirementReasons:(id)a3;
- (void)setSearchBarPortalView:(id)a3;
- (void)setSearchBarViewTopConstraint:(id)a3;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)setTopOffset:(double)a3;
- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBLegacyTodayViewSpotlightPresentableViewController

- (SBLegacyTodayViewSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3 searchBarViewController:(id)a4 scrollView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  v12 = [(SBLegacyTodayViewSpotlightPresentableViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spotlightMultiplexingViewController, a3);
    objc_storeStrong((id *)&v13->_searchBarViewController, a4);
    objc_storeStrong((id *)&v13->_scrollView, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  [(SBLegacyTodayViewSpotlightPresentableViewController *)&v3 viewDidLoad];
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _setUpSearchBackdrop];
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _setUpSearchBar];
  [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController setSpotlightDelegate:self];
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self bs_addChildViewController:self->_spotlightMultiplexingViewController];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    [(SBLegacyTodayViewSpotlightPresentableViewController *)self _setUpSearchBackdropMatchMoveAnimation];
    [(SBLegacyTodayViewSpotlightPresentableViewController *)self _setUpFeatherBackgroundMatchMoveAnimations];
  }
  else
  {
    id v5 = [(MTMaterialView *)self->_searchBackdropView layer];
    [v5 removeAnimationForKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  v6 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
  v7 = [(MTMaterialView *)self->_searchBackdropView layer];
  v8 = [v7 animationForKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
  [v7 removeAnimationForKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
  [v6 setHidden:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__SBLegacyTodayViewSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E6B02A20;
  id v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  [v5 animateAlongsideTransition:0 completion:v12];
}

uint64_t __106__SBLegacyTodayViewSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
  v2 = *(void **)(a1 + 48);
  return [v2 setHidden:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  [(SBLegacyTodayViewSpotlightPresentableViewController *)&v3 viewDidLayoutSubviews];
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _updateMaskLayers];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  id v40 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
  id v10 = [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController view];
  id v11 = [(SPUISearchBarController *)self->_searchBarViewController view];
  [v40 safeAreaInsets];
  double v13 = v12;
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self topOffset];
  double v15 = v14;
  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  double v39 = v13;
  if (spotlightMultiplexingViewController)
  {
    uint64_t v17 = [(SBSpotlightMultiplexingViewController *)spotlightMultiplexingViewController interfaceOrientation];
    double v18 = 38.0;
    if ((unint64_t)(v17 - 1) < 2) {
      double v18 = 36.0;
    }
    double v38 = v18;
  }
  else
  {
    double v38 = 36.0;
  }
  [v40 bounds];
  UIRectGetCenter();
  double v20 = v19;
  double v22 = v21;
  [v11 center];
  double v24 = v23;
  double v26 = v25;
  double v27 = a4 / 3.0 + v15;
  [v11 size];
  double v29 = v28 * 0.5;
  if (a6)
  {
    if (a6 == 2)
    {
      v31 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:", *MEMORY[0x1E4F43870], v29);
      [v31 _scaledValueForValue:v38];
      UIRoundToViewScale();
      double v26 = v39 + v32 + 6.0;

      double v27 = v15;
    }
    else
    {
      double v30 = v39 + v27 + v29;
      if (a6 == 1)
      {
        double v26 = v30;
        double v22 = v15 + a4 + v22;
      }
    }
  }
  else
  {
    double v22 = v15 + v22;
    double v26 = v39 + v27 + v29;
  }
  objc_msgSend(v10, "setCenter:", v20, v22);
  [(NSLayoutConstraint *)self->_searchBarViewTopConstraint setConstant:v27];
  -[_UIPortalView setCenter:](self->_searchBarPortalView, "setCenter:", v24, v26);
  v33 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self _sharedRemoteSearchViewController];
  [v33 setRevealProgress:a3];

  searchBackdropView = self->_searchBackdropView;
  [v40 bounds];
  -[MTMaterialView setFrame:](searchBackdropView, "setFrame:");
  [(MTMaterialView *)self->_searchBackdropView setWeighting:a3];
  [v10 setAlpha:(a3 + -0.3) / 0.7 + 0.0];
  double v35 = 1.0;
  if (a6 == 2) {
    double v35 = 0.0;
  }
  [v11 setAlpha:v35];
  featherBlurHeightConstraint = self->_featherBlurHeightConstraint;
  [v11 bounds];
  [(NSLayoutConstraint *)featherBlurHeightConstraint setConstant:v15 + v37 + 12.0];
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _updateMaskLayers];
}

- (void)setTargetDisplayConfiguration:(id)a3
{
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  if (a3 == 2)
  {
    double v12 = NSString;
    id v9 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", 2, a4);
    id v10 = [v9 UUIDString];
    id v11 = [v12 stringWithFormat:@"AnimatedPresentation-%@", v10];
    BOOL v7 = 0;
    goto LABEL_5;
  }
  if (!a3)
  {
    BOOL v7 = self->_searchBarPortalView == 0;
    v8 = NSString;
    id v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    id v11 = [v8 stringWithFormat:@"AnimatedDismissal-%@", v10];
LABEL_5:

    goto LABEL_7;
  }
  BOOL v7 = 0;
  id v11 = @"SBTodayViewSearchPortalRequiredForInteractivePresentationReason";
LABEL_7:
  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _beginRequiringSearchBarPortalViewForReason:v11];
  *a5 = v7;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __130__SBLegacyTodayViewSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
  v16[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v18, &location);
  uint64_t v17 = v11;
  double v13 = v11;
  double v14 = (void *)MEMORY[0x1D948C7A0](v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v14;
}

void __130__SBLegacyTodayViewSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _endRequiringSearchBarPortalViewForReason:*(void *)(a1 + 32)];
}

- (void)dismissSearchView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained legacyTodayViewSpotlightPresentableViewControllerShouldDismiss:self];
}

- (void)_setUpSearchBar
{
  v43[7] = *MEMORY[0x1E4F143B8];
  if (self->_searchBarViewController)
  {
    objc_super v3 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
    [(SBLegacyTodayViewSpotlightPresentableViewController *)self topOffset];
    double v5 = v4;
    v6 = (SBFFeatherBlurView *)[objc_alloc(MEMORY[0x1E4FA5F00]) initWithRecipe:0];
    featherBlurView = self->_featherBlurView;
    self->_featherBlurView = v6;

    [(SBFFeatherBlurView *)self->_featherBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:self->_featherBlurView];
    [(SBLegacyTodayViewSpotlightPresentableViewController *)self bs_addChildViewController:self->_searchBarViewController withSuperview:v3];
    v8 = [(SPUISearchBarController *)self->_searchBarViewController view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = [v8 topAnchor];
    id v10 = [v3 safeAreaLayoutGuide];
    id v11 = [v10 topAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11 constant:v5];
    searchBarViewTopConstraint = self->_searchBarViewTopConstraint;
    self->_searchBarViewTopConstraint = v12;

    double v14 = [(SBFFeatherBlurView *)self->_featherBlurView bottomAnchor];
    double v15 = [v3 safeAreaLayoutGuide];
    v16 = [v15 topAnchor];
    [v8 bounds];
    id v18 = [v14 constraintEqualToAnchor:v16 constant:v5 + v17];
    featherBlurHeightConstraint = self->_featherBlurHeightConstraint;
    self->_featherBlurHeightConstraint = v18;

    v34 = (void *)MEMORY[0x1E4F28DC8];
    v43[0] = self->_searchBarViewTopConstraint;
    v41 = [v3 leadingAnchor];
    v42 = v8;
    id v40 = [v8 leadingAnchor];
    double v39 = [v41 constraintEqualToAnchor:v40];
    v43[1] = v39;
    double v38 = [v3 trailingAnchor];
    double v37 = [v8 trailingAnchor];
    double v35 = [v38 constraintEqualToAnchor:v37];
    v43[2] = v35;
    v33 = [(SBFFeatherBlurView *)self->_featherBlurView topAnchor];
    double v32 = [v3 topAnchor];
    double v20 = [v33 constraintEqualToAnchor:v32];
    v43[3] = v20;
    double v21 = [(SBFFeatherBlurView *)self->_featherBlurView leadingAnchor];
    double v22 = v3;
    v36 = v3;
    double v23 = [v3 leadingAnchor];
    double v24 = [v21 constraintEqualToAnchor:v23];
    v43[4] = v24;
    double v25 = [(SBFFeatherBlurView *)self->_featherBlurView trailingAnchor];
    double v26 = [v22 trailingAnchor];
    double v27 = [v25 constraintEqualToAnchor:v26];
    double v28 = self->_featherBlurHeightConstraint;
    v43[5] = v27;
    v43[6] = v28;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];
    [v34 activateConstraints:v29];

    double v30 = [MEMORY[0x1E4FA5F00] configureGradientMaskForFeatherBlurRecipe:0 onContentView:self->_scrollView];
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v30;
  }
}

- (void)_setUpSearchBackdrop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [WeakRetained backdropViewForLegacyTodayViewSpotlightPresentableViewController:self];
  searchBackdropView = self->_searchBackdropView;
  self->_searchBackdropView = v4;

  [(MTMaterialView *)self->_searchBackdropView bs_setHitTestingDisabled:1];
  id v6 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
  [v6 addSubview:self->_searchBackdropView];
  [v6 sendSubviewToBack:self->_searchBackdropView];
}

- (void)_setUpFeatherBackgroundMatchMoveAnimations
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[(NSArray *)self->_searchBarGradientMaskLayers mutableCopy];
  if (!v3) {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  }
  featherBlurView = self->_featherBlurView;
  if (featherBlurView)
  {
    double v5 = [(SBFFeatherBlurView *)featherBlurView layer];
    [v3 addObject:v5];
  }
  id v6 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
  BOOL v7 = [v6 window];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v14 = (void *)MEMORY[0x1E4FA5F00];
        objc_msgSend(v13, "frame", (void)v16);
        double v15 = objc_msgSend(v14, "matchMoveAnimationForFrame:relativeToView:", v7);
        [v13 addAnimation:v15 forKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_setUpSearchBackdropMatchMoveAnimation
{
  objc_super v3 = (void *)MEMORY[0x1E4FA5E88];
  double v4 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
  double v5 = [v4 window];
  id v6 = [v3 matchMoveAnimationForPinningToView:v5];

  [(MTMaterialView *)self->_searchBackdropView addAnimation:v6 forKey:@"SBTodayViewSearchBackdropMatchMoveAnimation"];
}

- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBLegacyTodayViewSpotlightPresentableViewController.m", 270, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  if (self->_searchBarViewController)
  {
    searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
    id v19 = v5;
    if (!searchBarPortalRequirementReasons)
    {
      BOOL v7 = [MEMORY[0x1E4F1CA80] set];
      id v8 = self->_searchBarPortalRequirementReasons;
      self->_searchBarPortalRequirementReasons = v7;

      searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
    }
    [(NSMutableSet *)searchBarPortalRequirementReasons addObject:v19];
    id v5 = v19;
    if (!self->_searchBarPortalView)
    {
      uint64_t v9 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self _sharedRemoteSearchViewController];
      uint64_t v10 = [v9 searchHeaderLayerRenderID];
      int v11 = [v9 searchHeaderContextID];
      if (v10 && v11)
      {
        double v12 = [(SPUISearchBarController *)self->_searchBarViewController view];
        [v12 setHidden:1];

        double v13 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E4F43298]);
        searchBarPortalView = self->_searchBarPortalView;
        self->_searchBarPortalView = v13;

        [(_UIPortalView *)self->_searchBarPortalView bs_setHitTestingDisabled:1];
        [(_UIPortalView *)self->_searchBarPortalView setHidesSourceView:1];
        double v15 = [(_UIPortalView *)self->_searchBarPortalView portalLayer];
        objc_msgSend(v15, "setSourceLayerRenderId:", objc_msgSend(v9, "searchHeaderLayerRenderID"));

        long long v16 = [(_UIPortalView *)self->_searchBarPortalView portalLayer];
        objc_msgSend(v16, "setSourceContextId:", objc_msgSend(v9, "searchHeaderContextID"));

        long long v17 = [(SBLegacyTodayViewSpotlightPresentableViewController *)self view];
        [v17 addSubview:self->_searchBarPortalView];
      }
      id v5 = v19;
    }
  }
}

- (void)_endRequiringSearchBarPortalViewForReason:(id)a3
{
  [(NSMutableSet *)self->_searchBarPortalRequirementReasons removeObject:a3];
  if (![(NSMutableSet *)self->_searchBarPortalRequirementReasons count] && self->_searchBarPortalView)
  {
    double v4 = [(SPUISearchBarController *)self->_searchBarViewController view];
    [v4 setHidden:0];

    [(_UIPortalView *)self->_searchBarPortalView removeFromSuperview];
    searchBarPortalView = self->_searchBarPortalView;
    self->_searchBarPortalView = 0;
  }
}

- (void)_updateMaskLayers
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v6 = v4 + v5;
  [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:0];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SBFFeatherBlurView *)self->_featherBlurView frame];
  double v32 = v15;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v22 = self->_searchBarGradientMaskLayers;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    double v25 = v21 - (v8 + v12);
    double v26 = v19 - (v10 + v14);
    double v27 = v8 + v17;
    double v28 = v10 + v32;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v22);
        }
        v31 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v31, "setFrame:", v28, v27, v26, v25);
        [v31 setHidden:v6 <= 0.0];
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v24);
  }

  [(SBLegacyTodayViewSpotlightPresentableViewController *)self _setUpFeatherBackgroundMatchMoveAnimations];
  [(SBFFeatherBlurView *)self->_featherBlurView setHidden:v6 <= 0.0];
}

- (id)_sharedRemoteSearchViewController
{
  v2 = objc_opt_class();
  return (id)[v2 sharedRemoteSearchViewController];
}

- (SBLegacyTodayViewSpotlightPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLegacyTodayViewSpotlightPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
}

- (SPUISearchBarController)searchBarViewController
{
  return self->_searchBarViewController;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
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

- (SBFFeatherBlurView)featherBlurView
{
  return self->_featherBlurView;
}

- (void)setFeatherBlurView:(id)a3
{
}

- (NSLayoutConstraint)featherBlurHeightConstraint
{
  return self->_featherBlurHeightConstraint;
}

- (void)setFeatherBlurHeightConstraint:(id)a3
{
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
}

- (MTMaterialView)searchBackdropView
{
  return self->_searchBackdropView;
}

- (void)setSearchBackdropView:(id)a3
{
}

- (_UIPortalView)searchBarPortalView
{
  return self->_searchBarPortalView;
}

- (void)setSearchBarPortalView:(id)a3
{
}

- (NSLayoutConstraint)searchBarViewTopConstraint
{
  return self->_searchBarViewTopConstraint;
}

- (void)setSearchBarViewTopConstraint:(id)a3
{
}

- (NSMutableSet)searchBarPortalRequirementReasons
{
  return self->_searchBarPortalRequirementReasons;
}

- (void)setSearchBarPortalRequirementReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, 0);
  objc_storeStrong((id *)&self->_searchBarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_searchBarPortalView, 0);
  objc_storeStrong((id *)&self->_searchBackdropView, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_featherBlurHeightConstraint, 0);
  objc_storeStrong((id *)&self->_featherBlurView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end