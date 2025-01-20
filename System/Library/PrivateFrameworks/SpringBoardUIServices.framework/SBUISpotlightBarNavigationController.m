@interface SBUISpotlightBarNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)isNavigationBarBottomTrailingCornerRounded;
- (BOOL)isPullingToSearch;
- (SBUISearchBarControlling)searchBarViewController;
- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3;
- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3 searchBarViewController:(id)a4;
- (_UILegibilitySettings)legibilitySettings;
- (void)setLegibilitySettings:(id)a3;
- (void)setNavigationBarBlurProgress:(double)a3 animated:(BOOL)a4;
- (void)setNavigationBarBottomTrailingCornerRounded:(BOOL)a3;
- (void)setPullingToSearch:(BOOL)a3;
- (void)setSearchBarViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBUISpotlightBarNavigationController

- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3 searchBarViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)SBUISpotlightBarNavigationController;
  v9 = [(SBUISpotlightBarNavigationController *)&v16 initWithNavigationBarClass:v8 toolbarClass:0];
  v10 = v9;
  if (v9)
  {
    [(SBUISpotlightBarNavigationController *)v9 pushViewController:v6 animated:0];
    [(SBUISpotlightBarNavigationController *)v10 setDelegate:v10];
    [(SBUISpotlightBarNavigationController *)v10 _setBuiltinTransitionStyle:1];
    [(SBUISpotlightBarNavigationController *)v10 setSearchBarViewController:v7];
    v11 = [(SBUISpotlightBarNavigationController *)v10 navigationBar];
    v12 = [v7 backgroundBlurView];
    [v11 _setBackgroundView:v12];

    v13 = [v6 navigationItem];
    v14 = [v7 view];
    [v13 setTitleView:v14];
  }
  return v10;
}

- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3
{
  return [(SBUISpotlightBarNavigationController *)self initWithRootViewController:a3 searchBarViewController:0];
}

- (void)setNavigationBarBlurProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SBUISpotlightBarNavigationController *)self isPullingToSearch]) {
    a3 = 0.0;
  }
  id v7 = [(SBUISpotlightBarNavigationController *)self navigationBar];
  uint64_t v8 = [v7 _backgroundView];
  v9 = v8;
  double v10 = 1.0;
  if (a3 == 0.0) {
    double v10 = 0.0;
  }
  [v8 setAlpha:v10];

  id v11 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
  [v11 setBlurProgress:v4 animated:a3];
}

- (BOOL)isNavigationBarBottomTrailingCornerRounded
{
  v2 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
  char v3 = [v2 roundedCornerVisible];

  return v3;
}

- (void)setNavigationBarBottomTrailingCornerRounded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
  [v4 setRoundedCornerVisible:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationController;
  -[SBUISpotlightBarNavigationController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
  [v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationController;
  -[SBUISpotlightBarNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  v5 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
  [v5 viewDidDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  id v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    id v4 = (_UILegibilitySettings *)[v7 copy];
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v4;

    objc_super v6 = [(SBUISpotlightBarNavigationController *)self searchBarViewController];
    [v6 setLegibilitySettings:v7];
  }
}

- (SBUISearchBarControlling)searchBarViewController
{
  return self->_searchBarViewController;
}

- (void)setSearchBarViewController:(id)a3
{
}

- (BOOL)isPullingToSearch
{
  return self->_pullingToSearch;
}

- (void)setPullingToSearch:(BOOL)a3
{
  self->_pullingToSearch = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
}

@end