@interface SBTodayViewSpotlightPresenter
- (BOOL)isPresenting;
- (BOOL)searchPresenterCanPresent:(id)a3;
- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3;
- (NSArray)searchBarGradientMaskLayers;
- (SBFFeatherBlurView)featherBlurView;
- (SBSearchPresenter)presenter;
- (SBTodayViewSpotlightPresenter)initWithSearchBarViewController:(id)a3 containerView:(id)a4 scrollView:(id)a5 delegate:(id)a6;
- (SBTodayViewSpotlightPresenterDelegate)delegate;
- (SPUISearchBarController)searchBarViewController;
- (UIScrollView)scrollView;
- (UIView)containerView;
- (UIViewController)spotlightViewController;
- (_SBTodaySpotlightViewController)spotlightMultiplexingViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)_topOffset;
- (id)_newSearchBackdropView;
- (id)backdropViewForLegacyTodayViewSpotlightPresentableViewController:(id)a3;
- (id)backgroundViewForSpotlightPresentableViewController:(id)a3;
- (id)displayConfigurationForPresenter:(id)a3;
- (id)searchPresentablesForPresenter:(id)a3;
- (void)_configureFeatherBlurMatchMoveAnimations;
- (void)_setUpFeatherBlur;
- (void)_setUpStartingScrollOffset;
- (void)_updateFeatherBlurMaskLayers;
- (void)dismissSpotlightAnimated:(BOOL)a3;
- (void)layout;
- (void)legacyTodayViewSpotlightPresentableViewControllerShouldDismiss:(id)a3;
- (void)presentSpotlightAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4;
- (void)searchBarDidFocus;
- (void)searchPresenterDidDismissSearch:(id)a3;
- (void)searchPresenterDidPresentSearch:(id)a3;
- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4;
- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatherBlurView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSearchBarGradientMaskLayers:(id)a3;
- (void)setSpotlightMultiplexingViewController:(id)a3;
- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3;
@end

@implementation SBTodayViewSpotlightPresenter

- (BOOL)isPresenting
{
  return [(SBSearchPresenter *)self->_presenter isPresenting];
}

- (SPUISearchBarController)searchBarViewController
{
  return self->_searchBarViewController;
}

- (void)layout
{
}

- (SBTodayViewSpotlightPresenter)initWithSearchBarViewController:(id)a3 containerView:(id)a4 scrollView:(id)a5 delegate:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBTodayViewSpotlightPresenter.m", 65, @"Invalid parameter not satisfying: %@", @"containerView" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBTodayViewSpotlightPresenter.m", 67, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)SBTodayViewSpotlightPresenter;
  v17 = [(SBTodayViewSpotlightPresenter *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_searchBarViewController, a3);
    objc_storeStrong((id *)&v18->_containerView, a4);
    objc_storeStrong((id *)&v18->_scrollView, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    [v12 setDelegate:v18];
    v19 = [SBSearchPresenter alloc];
    v20 = [MEMORY[0x1E4FA6270] rootSettings];
    v21 = [v20 todayViewPullToSearchSettings];
    uint64_t v22 = [(SBSearchPresenter *)v19 initWithSettings:v21 identifier:@"TodayView"];
    presenter = v18->_presenter;
    v18->_presenter = (SBSearchPresenter *)v22;

    [(SBSearchPresenter *)v18->_presenter setSearchPresenterDelegate:v18];
    [(SBTodayViewSpotlightPresenter *)v18 _setUpFeatherBlur];
  }

  return v18;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [(SBTodayViewSpotlightPresenter *)self _setUpStartingScrollOffset];
  [(SBSearchPresenter *)self->_presenter scrollViewWillBeginDragging:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(SBTodayViewSpotlightPresenter *)self _updateFeatherBlurMaskLayers];
  [(SBSearchPresenter *)self->_presenter scrollViewDidScroll:v4];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
}

- (id)searchPresentablesForPresenter:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_spotlightViewController)
  {
    v5[0] = self->_spotlightViewController;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  return [(UIView *)self->_containerView _sbDisplayConfiguration];
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained spotlightPresenterAllowsPullToSearch:v3];

  return (char)v3;
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained spotlightPresenterWillPresentSpotlight:self];
  v6 = [WeakRetained parentViewControllerForSpotlightPresenter:self];
  v7 = v6;
  spotlightViewController = self->_spotlightViewController;
  if (spotlightViewController)
  {
    objc_msgSend(v6, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", spotlightViewController, 1, v4);
  }
  else
  {
    v9 = self->_containerView;
    [WeakRetained todayViewControllerLocationForSpotlightPresenter:self];
    uint64_t v11 = (uint64_t)v10;
    id v12 = objc_alloc_init(_SBTodaySpotlightViewController);
    spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
    self->_spotlightMultiplexingViewController = v12;

    id v14 = self->_spotlightMultiplexingViewController;
    id v15 = [(SBTodayViewSpotlightPresenter *)self legibilitySettings];
    [(SBSpotlightMultiplexingViewController *)v14 setLegibilitySettings:v15];

    [(_SBTodaySpotlightViewController *)self->_spotlightMultiplexingViewController setLocation:v11];
    v16 = [(_SBTodaySpotlightViewController *)self->_spotlightMultiplexingViewController view];
    [(UIView *)v9 bounds];
    objc_msgSend(v16, "setFrame:");

    if (MEMORY[0x1D948A640]()) {
      v17 = [[SBSpotlightPresentableViewController alloc] initWithSpotlightMultiplexingViewController:self->_spotlightMultiplexingViewController];
    }
    else {
      v17 = [[SBLegacyTodayViewSpotlightPresentableViewController alloc] initWithSpotlightMultiplexingViewController:self->_spotlightMultiplexingViewController searchBarViewController:self->_searchBarViewController scrollView:self->_scrollView];
    }
    p_super = &v17->super;
    [(SBSpotlightPresentableViewController *)v17 setDelegate:self];
    v19 = self->_spotlightViewController;
    self->_spotlightViewController = p_super;

    v20 = [(UIViewController *)self->_spotlightViewController view];
    [v20 setAutoresizingMask:18];
    [(UIView *)v9 bounds];
    objc_msgSend(v20, "setFrame:");
    [v7 addChildViewController:self->_spotlightViewController];
    objc_msgSend(v7, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_spotlightViewController, 1, 0);
    [(UIView *)v9 addSubview:v20];
  }
  v21 = [(UIViewController *)self->_spotlightViewController view];
  objc_msgSend(v21, "bs_setHitTestingDisabled:", 0);
}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  id v5 = a3;
  if (self->_spotlightViewController)
  {
    id v9 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = [WeakRetained parentViewControllerForSpotlightPresenter:self];
    objc_msgSend(v7, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_spotlightViewController, 1);
    [(UIViewController *)self->_spotlightViewController didMoveToParentViewController:v7];
    [WeakRetained spotlightPresenterDidPresentSpotlight:self];
  }
  else
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_spotlightViewController != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBTodayViewSpotlightPresenter *)a2 searchPresenterDidPresentSearch:(uint64_t)v8];
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIViewController *)self->_spotlightViewController willMoveToParentViewController:0];
  v6 = [(UIViewController *)self->_spotlightViewController view];
  objc_msgSend(v6, "bs_setHitTestingDisabled:", 1);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained parentViewControllerForSpotlightPresenter:self];

  objc_msgSend(v8, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_spotlightViewController, 0, v4);
}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  BOOL v4 = [(UIViewController *)self->_spotlightViewController view];
  [v4 removeFromSuperview];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained parentViewControllerForSpotlightPresenter:self];
  objc_msgSend(v5, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_spotlightViewController, 0);
  [(UIViewController *)self->_spotlightViewController removeFromParentViewController];
  [(SBSpotlightMultiplexingViewController *)self->_spotlightMultiplexingViewController invalidate];
  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  self->_spotlightMultiplexingViewController = 0;

  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = 0;

  [WeakRetained spotlightPresenterDidDismissSpotlight:self];
}

- (double)_topOffset
{
  v3 = [(UIViewController *)self->_spotlightViewController view];
  [v3 safeAreaInsets];
  double v5 = v4;
  [(SBSearchPresenter *)self->_presenter interactivePresentationMetrics];
  double v7 = v5 - v6;

  if (self->_searchBarViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained searchBarTopOffsetForSpotlightPresenter:self];
    }
    else {
      double v10 = 8.0;
    }
    double v7 = v7 + v10;
  }
  return v7;
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
}

- (void)dismissSpotlightAnimated:(BOOL)a3
{
}

- (void)searchBarDidFocus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained spotlightPresenterSearchBarDidFocus:self];

  [(SBTodayViewSpotlightPresenter *)self presentSpotlightAnimated:1];
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FA6470]);
  [(UIView *)self->_containerView bounds];
  double v5 = objc_msgSend(v4, "initWithFrame:style:", 3);
  [v5 prepareForTransitionToBlurred:1];
  return v5;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return [(_SBTodaySpotlightViewController *)self->_spotlightMultiplexingViewController location] == 1;
}

- (void)legacyTodayViewSpotlightPresentableViewControllerShouldDismiss:(id)a3
{
}

- (id)backdropViewForLegacyTodayViewSpotlightPresentableViewController:(id)a3
{
  id v3 = [(SBTodayViewSpotlightPresenter *)self _newSearchBackdropView];
  return v3;
}

- (id)_newSearchBackdropView
{
  v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:14 options:0 initialWeighting:0.0];
  [v2 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
  return v2;
}

- (void)_setUpFeatherBlur
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (!self->_searchBarViewController)
  {
    id v3 = (objc_class *)MEMORY[0x1E4FA5F00];
    id v4 = self->_containerView;
    double v5 = (SBFFeatherBlurView *)[[v3 alloc] initWithRecipe:0];
    featherBlurView = self->_featherBlurView;
    self->_featherBlurView = v5;

    [(SBFFeatherBlurView *)self->_featherBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:self->_featherBlurView];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v22 = [(SBFFeatherBlurView *)self->_featherBlurView bottomAnchor];
    v23 = [(UIView *)v4 safeAreaLayoutGuide];
    v21 = [v23 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(SBFFeatherBlurView *)self->_featherBlurView topAnchor];
    v18 = [(UIView *)v4 topAnchor];
    double v7 = [v19 constraintEqualToAnchor:v18];
    v24[1] = v7;
    id v8 = [(SBFFeatherBlurView *)self->_featherBlurView leadingAnchor];
    id v9 = [(UIView *)v4 leadingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v24[2] = v10;
    uint64_t v11 = [(SBFFeatherBlurView *)self->_featherBlurView trailingAnchor];
    id v12 = [(UIView *)v4 trailingAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12];
    v24[3] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v14];

    id v15 = [MEMORY[0x1E4FA5F00] configureGradientMaskForFeatherBlurRecipe:0 onContentView:self->_scrollView];
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v15;
  }
}

- (void)_configureFeatherBlurMatchMoveAnimations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_featherBlurView)
  {
    id v3 = (void *)[(NSArray *)self->_searchBarGradientMaskLayers mutableCopy];
    if (!v3) {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    }
    id v4 = [(SBFFeatherBlurView *)self->_featherBlurView layer];
    [v3 addObject:v4];

    double v5 = [(UIView *)self->_containerView window];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
          if (v5)
          {
            id v12 = (void *)MEMORY[0x1E4FA5F00];
            [*(id *)(*((void *)&v14 + 1) + 8 * v10) frame];
            id v13 = objc_msgSend(v12, "matchMoveAnimationForFrame:relativeToView:", v5);
            [v11 addAnimation:v13 forKey:@"SBTodayViewFeatherBlurMatchMoveAnimation"];
          }
          else
          {
            objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "removeAnimationForKey:", @"SBTodayViewFeatherBlurMatchMoveAnimation", (void)v14);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateFeatherBlurMaskLayers
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_featherBlurView)
  {
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
    uint64_t v22 = self->_searchBarGradientMaskLayers;
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

    [(SBTodayViewSpotlightPresenter *)self _configureFeatherBlurMatchMoveAnimations];
    [(SBFFeatherBlurView *)self->_featherBlurView setHidden:v6 <= 0.0];
  }
}

- (void)_setUpStartingScrollOffset
{
  [(SBSearchPresenter *)self->_presenter interactivePresentationMetrics];
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  presenter = self->_presenter;
  -[SBSearchPresenter setInteractivePresentationMetrics:](presenter, "setInteractivePresentationMetrics:");
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (UIViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (SBSearchPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (_SBTodaySpotlightViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
}

- (void)setSpotlightMultiplexingViewController:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SBTodayViewSpotlightPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBTodayViewSpotlightPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFFeatherBlurView)featherBlurView
{
  return self->_featherBlurView;
}

- (void)setFeatherBlurView:(id)a3
{
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_featherBlurView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
}

- (void)searchPresenterDidPresentSearch:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"SBTodayViewSpotlightPresenter.m";
  __int16 v16 = 1024;
  int v17 = 177;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end