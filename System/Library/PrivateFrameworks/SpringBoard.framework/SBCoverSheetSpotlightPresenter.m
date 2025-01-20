@interface SBCoverSheetSpotlightPresenter
- (BOOL)isSpotlightPresented;
- (BOOL)searchPresenterCanPresent:(id)a3;
- (SBCoverSheetSpotlightPresenter)initWithDelegate:(id)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)searchTopOffsetForSearchPresenter:(id)a3;
- (double)strength;
- (id)backgroundViewForSpotlightPresentableViewController:(id)a3;
- (id)displayConfigurationForPresenter:(id)a3;
- (id)searchPresentablesForPresenter:(id)a3;
- (void)_setUpStartingScrollOffsetWithScrollView:(id)a3;
- (void)coverSheetSpotlightViewControllerAddContentView:(id)a3;
- (void)coverSheetSpotlightViewControllerRemoveContentView:(id)a3;
- (void)coverSheetSpotlightViewControllerShouldDismiss:(id)a3 animated:(BOOL)a4;
- (void)dismissSpotlightAnimated:(BOOL)a3;
- (void)presentSpotlightAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4;
- (void)searchPresenterDidDismissSearch:(id)a3;
- (void)searchPresenterDidPresentSearch:(id)a3;
- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4;
- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3;
@end

@implementation SBCoverSheetSpotlightPresenter

- (SBCoverSheetSpotlightPresenter)initWithDelegate:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBCoverSheetSpotlightPresenter.m", 41, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBCoverSheetSpotlightPresenter;
  v7 = [(SBCoverSheetSpotlightPresenter *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_delegate, a3);
    v9 = [SBSearchPresenter alloc];
    v10 = [MEMORY[0x1E4FA6270] rootSettings];
    v11 = [v10 coversheetPullToSearchSettings];
    uint64_t v12 = [(SBSearchPresenter *)v9 initWithSettings:v11 identifier:@"CoverSheet"];
    searchPresenter = v8->_searchPresenter;
    v8->_searchPresenter = (SBSearchPresenter *)v12;

    [(SBSearchPresenter *)v8->_searchPresenter setSearchPresenterDelegate:v8];
  }

  return v8;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [(SBCoverSheetSpotlightPresenter *)self _setUpStartingScrollOffsetWithScrollView:v4];
  [(SBSearchPresenter *)self->_searchPresenter scrollViewWillBeginDragging:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
}

- (BOOL)isSpotlightPresented
{
  return [(SBSearchPresenter *)self->_searchPresenter isPresenting];
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
}

- (void)dismissSpotlightAnimated:(BOOL)a3
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
  return (id)[(SBCoverSheetSpotlightPresenterDelegate *)self->_delegate displayConfigurationForSpotlightPresenter:self];
}

- (double)searchTopOffsetForSearchPresenter:(id)a3
{
  id v4 = [(SBCoverSheetSpotlightViewController *)self->_spotlightViewController view];
  [v4 safeAreaInsets];
  double v6 = v5;
  [(SBSearchPresenter *)self->_searchPresenter interactivePresentationMetrics];
  double v8 = v6 - v7;

  return v8;
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  return [(SBCoverSheetSpotlightPresenterDelegate *)self->_delegate spotlightPresenterAllowsPullToSearch:self];
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  spotlightViewController = self->_spotlightViewController;
  if (!spotlightViewController)
  {
    double v6 = objc_alloc_init(_SBCoverSheetSpotlightViewController);
    [(SBSpotlightMultiplexingViewController *)v6 setLegibilitySettings:self->_legibilitySettings];
    double v7 = [[SBSpotlightPresentableViewController alloc] initWithSpotlightMultiplexingViewController:v6];
    [(SBSpotlightPresentableViewController *)v7 setDelegate:self];
    double v8 = [[SBCoverSheetSpotlightViewController alloc] initWithSpotlightViewController:v7];
    v9 = self->_spotlightViewController;
    self->_spotlightViewController = v8;

    v10 = self->_spotlightViewController;
    v11 = [(SBCoverSheetSpotlightPresenterDelegate *)self->_delegate displayConfigurationForSpotlightPresenter:self];
    [(SBCoverSheetSpotlightViewController *)v10 setTargetDisplayConfiguration:v11];

    [(SBCoverSheetSpotlightViewController *)self->_spotlightViewController setDelegate:self];
    spotlightViewController = self->_spotlightViewController;
  }
  delegate = self->_delegate;
  [(SBCoverSheetSpotlightPresenterDelegate *)delegate spotlightPresenter:self presentDismissableModalViewController:spotlightViewController completion:0];
}

- (void)searchPresenterDidPresentSearch:(id)a3
{
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  if (self->_spotlightViewController) {
    -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenter:dismissDismissableModalViewController:animated:completion:](self->_delegate, "spotlightPresenter:dismissDismissableModalViewController:animated:completion:");
  }
}

void __76__SBCoverSheetSpotlightPresenter_searchPresenterWillDismissSearch_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)searchPresenterDidDismissSearch:(id)a3
{
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  id v4 = objc_alloc_init(SBCoverSheetSpotlightBackgroundView);
  double v5 = [(SBCoverSheetSpotlightViewController *)self->_spotlightViewController view];
  [v5 bounds];
  -[SBCoverSheetSpotlightBackgroundView setFrame:](v4, "setFrame:");

  return v4;
}

- (void)coverSheetSpotlightViewControllerShouldDismiss:(id)a3 animated:(BOOL)a4
{
}

- (void)coverSheetSpotlightViewControllerAddContentView:(id)a3
{
}

- (void)coverSheetSpotlightViewControllerRemoveContentView:(id)a3
{
}

- (void)_setUpStartingScrollOffsetWithScrollView:(id)a3
{
  id v13 = a3;
  [(SBSearchPresenter *)self->_searchPresenter interactivePresentationMetrics];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [v13 adjustedContentInset];
  double v11 = v10;
  if (_os_feature_enabled_impl())
  {
    [v13 contentOffset];
    double v11 = v11 - v12;
  }
  -[SBSearchPresenter setInteractivePresentationMetrics:](self->_searchPresenter, "setInteractivePresentationMetrics:", v11, v5, v7, v9);
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end