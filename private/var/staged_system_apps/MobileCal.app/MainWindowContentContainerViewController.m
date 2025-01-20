@interface MainWindowContentContainerViewController
- (BOOL)_isWindowSizeFullscreen:(CGSize)a3;
- (MainWindowContentContainerDelegate)delegate;
- (MainWindowContentContainerViewController)initWithRootNavigationController:(id)a3;
- (MainWindowSearchBar)searchBar;
- (id)startSearch;
- (void)cancelSearch;
- (void)continueSearchWithTerm:(id)a3;
- (void)endSearch:(BOOL)a3;
- (void)keyboardFrameChanged:(id)a3;
- (void)layoutSegmentedControl;
- (void)loadView;
- (void)resetSearchBar;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setupSearch:(BOOL)a3;
- (void)setupSearchNavBarHeight;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)teardownSearch;
- (void)todayTapped;
- (void)todayToolbarItemPressed;
- (void)updateSearchViewControllerToolbar;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainWindowContentContainerViewController

- (void)loadView
{
  id v9 = objc_alloc_init((Class)UIView);
  [v9 setAutoresizingMask:18];
  [(MainWindowContentContainerViewController *)self addChildViewController:self->_splitViewController];
  v3 = [(UISplitViewController *)self->_splitViewController view];
  [v9 addSubview:v3];

  [(UISplitViewController *)self->_splitViewController didMoveToParentViewController:self];
  v4 = [(MainWindowContentContainerViewController *)self traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)2)
  {
    v6 = [(RootNavigationController *)self->_rootNavigationController viewSwitcher];
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v6;

    v8 = [(UIViewController *)self->_containerViewController view];
    [v8 addSubview:self->_segmentedControl];
  }
  [(MainWindowContentContainerViewController *)self setView:v9];
}

- (void)viewWillLayoutSubviews
{
  id v12 = [(MainWindowContentContainerViewController *)self view];
  [v12 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UISplitViewController *)self->_splitViewController view];
  [v11 setFrame:v4, v6, v8, v10];

  [(MainWindowContentContainerViewController *)self layoutSegmentedControl];
}

- (MainWindowContentContainerViewController)initWithRootNavigationController:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MainWindowContentContainerViewController;
  double v6 = [(MainWindowContentContainerViewController *)&v20 init];
  double v7 = v6;
  if (v6)
  {
    p_rootNavigationController = (id *)&v6->_rootNavigationController;
    objc_storeStrong((id *)&v6->_rootNavigationController, a3);
    double v9 = (UISplitViewController *)[objc_alloc((Class)UISplitViewController) initWithStyle:1];
    splitViewController = v7->_splitViewController;
    v7->_splitViewController = v9;

    [(UISplitViewController *)v7->_splitViewController setDelegate:v7];
    [(UISplitViewController *)v7->_splitViewController setPreferredDisplayMode:1];
    [(UISplitViewController *)v7->_splitViewController setPrimaryEdge:1];
    [(UISplitViewController *)v7->_splitViewController setPresentsWithGesture:0];
    v11 = [v5 EKUI_viewHierarchy];
    +[MainWindowRootViewController sidebarWidthForViewHierarchy:v11];
    -[UISplitViewController setMinimumPrimaryColumnWidth:](v7->_splitViewController, "setMinimumPrimaryColumnWidth:");
    +[MainWindowRootViewController sidebarWidthForViewHierarchy:v11];
    -[UISplitViewController setMaximumPrimaryColumnWidth:](v7->_splitViewController, "setMaximumPrimaryColumnWidth:");
    id v12 = (UIViewController *)objc_alloc_init((Class)UIViewController);
    containerViewController = v7->_containerViewController;
    v7->_containerViewController = v12;

    v14 = [(UIViewController *)v7->_containerViewController view];
    [v14 setAutoresizingMask:18];

    [(UIViewController *)v7->_containerViewController addChildViewController:*p_rootNavigationController];
    v15 = [(UIViewController *)v7->_containerViewController view];
    v16 = [*p_rootNavigationController view];
    [v15 addSubview:v16];

    [*p_rootNavigationController didMoveToParentViewController:v7->_containerViewController];
    v17 = [[MainWindowWrapperNavigationController alloc] initWithRootViewController:v7->_containerViewController];
    [(MainWindowWrapperNavigationController *)v17 setNavigationBarHidden:1 animated:0];
    [(UISplitViewController *)v7->_splitViewController setViewController:v17 forColumn:2];
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v7 selector:"keyboardFrameChanged:" name:UIKeyboardWillChangeFrameNotification object:0];

    [*p_rootNavigationController setViewSwitcherLayoutHandler:v7];
  }

  return v7;
}

- (void)layoutSegmentedControl
{
  segmentedControl = self->_segmentedControl;
  double v4 = [(UIViewController *)self->_containerViewController view];
  [v4 bounds];
  -[UISegmentedControl sizeThatFits:](segmentedControl, "sizeThatFits:", v5, v6);
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  v11 = [(MainWindowContentContainerViewController *)self view];
  id v12 = [v11 window];
  v13 = [(UIViewController *)self->_containerViewController view];
  [v12 bounds];
  [v13 convertPoint:v12 fromView:CGRectGetWidth(v24) * 0.5, 0.0];
  uint64_t v15 = v14;

  int IsCompact = EKUICurrentHeightSizeClassIsCompact();
  double v17 = 33.0;
  if (IsCompact) {
    double v17 = 5.0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001D130;
  v23[3] = &unk_1001D2DA0;
  v23[4] = self;
  v23[5] = v15;
  v23[6] = v8;
  v23[7] = v10;
  *(double *)&v23[8] = v17;
  v23[9] = 0x4042000000000000;
  v18 = objc_retainBlock(v23);
  v19 = v18;
  if (self->_animatingSidebar)
  {
    objc_super v20 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100041550;
    v21[3] = &unk_1001D2DC8;
    id v22 = v19;
    [v20 animateAlongsideTransition:v21 completion:0];
  }
  else
  {
    ((void (*)(void *))v18[2])(v18);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 horizontalSizeClass];
  uint64_t v9 = [(MainWindowContentContainerViewController *)self traitCollection];
  id v10 = [v9 horizontalSizeClass];

  if (v8 == v10)
  {
    v30.receiver = self;
    v30.super_class = (Class)MainWindowContentContainerViewController;
    [(MainWindowContentContainerViewController *)&v30 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
    goto LABEL_16;
  }
  if (self->_searchResultsController)
  {
    if (!self->_animatingSidebar)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
      double v17 = [WeakRetained text];

      [(MainWindowContentContainerViewController *)self endSearch:0];
      goto LABEL_10;
    }
    [(UISplitViewController *)self->_splitViewController setViewController:0 forColumn:0];
    goto LABEL_8;
  }
  v11 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    double v17 = 0;
    goto LABEL_10;
  }
  v13 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];
  uint64_t v14 = [v13 searchResultsUpdater];

  [v14 setShouldLeaveSearchString:1];
  uint64_t v15 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];
  v16 = [v15 searchBar];
  double v17 = [v16 text];

  [(RootNavigationController *)self->_rootNavigationController dismissViewControllerAnimated:0 completion:0];
LABEL_10:
  v29.receiver = self;
  v29.super_class = (Class)MainWindowContentContainerViewController;
  [(MainWindowContentContainerViewController *)&v29 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  id v19 = [v6 horizontalSizeClass];
  segmentedControl = self->_segmentedControl;
  if (v19 == (id)2)
  {
    if (!segmentedControl)
    {
      v21 = [(RootNavigationController *)self->_rootNavigationController viewSwitcher];
      id v22 = self->_segmentedControl;
      self->_segmentedControl = v21;
    }
    v23 = [(UIViewController *)self->_containerViewController view];
    [v23 addSubview:self->_segmentedControl];

    CGRect v24 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v25 = sub_100041870;
  }
  else
  {
    [(UISegmentedControl *)segmentedControl removeFromSuperview];
    CGRect v24 = v27;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v25 = sub_100041918;
  }
  v24[2] = v25;
  v24[3] = &unk_1001D2DF0;
  v24[4] = v17;
  v24[5] = self;
  id v26 = v17;
  [v7 animateAlongsideTransition:0 completion:v24];

LABEL_16:
}

- (BOOL)_isWindowSizeFullscreen:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(MainWindowContentContainerViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 screen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (width >= height) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  if (v9 >= v11) {
    double v13 = v11;
  }
  else {
    double v13 = v9;
  }
  if (vabdd_f64(v12, v13) >= 2.22044605e-16) {
    return 0;
  }
  if (width >= height) {
    double v14 = width;
  }
  else {
    double v14 = height;
  }
  if (v9 >= v11) {
    double v15 = v9;
  }
  else {
    double v15 = v11;
  }
  return vabdd_f64(v14, v15) < 2.22044605e-16;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    [v7 targetTransform];
    long double v9 = *((double *)&v22 + 1);
    [v8 targetTransform];
    long double v10 = *(double *)&v19;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long double v10 = 0.0;
    long double v9 = 0.0;
  }
  UISplitViewControllerSplitBehavior v11 = [(UISplitViewController *)self->_splitViewController splitBehavior];
  unsigned int v12 = -[MainWindowContentContainerViewController _isWindowSizeFullscreen:](self, "_isWindowSizeFullscreen:", width, height);
  char v13 = v12;
  if (v12)
  {
    double v14 = atan2(v9, v10) * 57.2957795;
    if (fabs(v14) == 180.0 || v14 == 0.0)
    {
      if (v11 == UISplitViewControllerSplitBehaviorOverlay) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 2;
      }
    }
    else if (v11 == UISplitViewControllerSplitBehaviorOverlay)
    {
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 3;
    }
  }
  else
  {
    uint64_t v15 = 3;
  }
  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:v15];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100041BB0;
  v17[3] = &unk_1001D2E18;
  v17[4] = self;
  char v18 = v13;
  [v8 animateAlongsideTransition:0 completion:v17];
  v16.receiver = self;
  v16.super_class = (Class)MainWindowContentContainerViewController;
  -[MainWindowContentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  if (!a4)
  {
    v14[5] = v7;
    v14[6] = v6;
    v14[13] = v4;
    v14[14] = v5;
    self->_animatingSidebar = 1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041D78;
    v14[3] = &unk_1001D2740;
    v14[4] = self;
    long double v9 = objc_retainBlock(v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100041DBC;
    v13[3] = &unk_1001D2740;
    v13[4] = self;
    long double v10 = objc_retainBlock(v13);
    UISplitViewControllerSplitBehavior v11 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];

    if (v11)
    {
      unsigned int v12 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
      [v12 animateAlongsideTransition:v9 completion:v10];
    }
    else
    {
      ((void (*)(void *))v9[2])(v9);
      ((void (*)(void *))v10[2])(v10);
    }
  }
}

- (void)setSearchBar:(id)a3
{
  p_searchBar = &self->_searchBar;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_searchBar, v6);
  [v6 setHeightObserver:self];
}

- (void)keyboardFrameChanged:(id)a3
{
  p_keyboardFrame = &self->_keyboardFrame;
  id v9 = [a3 userInfo];
  uint64_t v4 = [v9 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  p_keyboardFrame->origin.x = v5;
  p_keyboardFrame->origin.y = v6;
  p_keyboardFrame->size.double width = v7;
  p_keyboardFrame->size.double height = v8;
}

- (void)updateSearchViewControllerToolbar
{
  BOOL v3 = (id)[(UISplitViewController *)self->_splitViewController splitBehavior] != (id)2;
  searchResultsNavController = self->_searchResultsNavController;

  [(UINavigationController *)searchResultsNavController setToolbarHidden:v3];
}

- (void)continueSearchWithTerm:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(MainWindowContentContainerViewController *)self delegate];
  [v5 searchTapped];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  [WeakRetained setText:v4];

  id v7 = objc_loadWeakRetained((id *)&self->_searchBar);
  [(MainWindowContentContainerViewController *)self searchBar:v7 textDidChange:v4];
}

- (id)startSearch
{
  [(MainWindowContentContainerViewController *)self setupSearch:0];
  splitViewController = self->_splitViewController;

  return [(UISplitViewController *)splitViewController transitionCoordinator];
}

- (void)cancelSearch
{
  searchResultsController = self->_searchResultsController;
  p_searchBar = &self->_searchBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  id v7 = WeakRetained;
  if (searchResultsController)
  {
    [(MainWindowContentContainerViewController *)self searchBarCancelButtonClicked:WeakRetained];
  }
  else
  {
    unsigned int v6 = [WeakRetained isFirstResponder];

    if (!v6) {
      return;
    }
    id v7 = objc_loadWeakRetained((id *)p_searchBar);
    [v7 resignFirstResponder];
  }
}

- (void)setupSearch:(BOOL)a3
{
  if (!self->_searchResultsNavController)
  {
    BOOL v3 = a3;
    CGFloat v5 = [SearchResultsViewController alloc];
    unsigned int v6 = [(RootNavigationController *)self->_rootNavigationController model];
    id v7 = [(RootNavigationController *)self->_rootNavigationController window];
    CGFloat v8 = [(SearchResultsViewController *)v5 initWithModel:v6 window:v7];
    searchResultsController = self->_searchResultsController;
    self->_searchResultsController = v8;

    [(SearchResultsViewController *)self->_searchResultsController setSearchResultsDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    [(SearchResultsViewController *)self->_searchResultsController setSearchBar:WeakRetained];

    [(ListViewController *)self->_searchResultsController setDestination:2];
    [(ListViewController *)self->_searchResultsController setOverrideExtendedEdges:0];
    id v11 = objc_alloc((Class)UIBarButtonItem);
    unsigned int v12 = +[NSBundle mainBundle];
    char v13 = [v12 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];
    id v14 = [v11 initWithTitle:v13 style:0 target:self action:"todayToolbarItemPressed"];
    id v22 = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:&v22 count:1];
    [(SearchResultsViewController *)self->_searchResultsController setToolbarItems:v15];

    [(MainWindowContentContainerViewController *)self setupSearchNavBarHeight];
    objc_super v16 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_searchResultsController];
    searchResultsNavController = self->_searchResultsNavController;
    self->_searchResultsNavController = v16;

    if ((id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)1) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 3;
    }
    [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:v18];
    [(UISplitViewController *)self->_splitViewController setViewController:self->_searchResultsNavController forColumn:0];
    [(UISplitViewController *)self->_splitViewController showColumn:0];
    self->_animatingSidebar = v3;
    if (v3)
    {
      long long v19 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
      v20[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100042418;
      v21[3] = &unk_1001D2E40;
      void v21[4] = self;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100042490;
      v20[3] = &unk_1001D2E40;
      [v19 animateAlongsideTransition:v21 completion:v20];
    }
    [(MainWindowContentContainerViewController *)self updateSearchViewControllerToolbar];
  }
}

- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    [(MainWindowContentContainerViewController *)self searchBarCancelButtonClicked:WeakRetained];

    id v9 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000425DC;
    v10[3] = &unk_1001D2E68;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v9 animateAlongsideTransition:v10 completion:0];
  }
  else
  {
    [(RootNavigationController *)self->_rootNavigationController searchResultsViewController:v6 didSelectEvent:v7];
  }
}

- (void)todayToolbarItemPressed
{
  searchResultsController = self->_searchResultsController;
  CUIKTodayDate();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SearchResultsViewController *)searchResultsController scrollToDate:v3 animated:1];
}

- (void)todayTapped
{
  if (self->_searchResultsController) {
    [(MainWindowContentContainerViewController *)self todayToolbarItemPressed];
  }
}

- (void)setupSearchNavBarHeight
{
  p_searchBar = &self->_searchBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  [WeakRetained frame];
  double v6 = v5;

  double v7 = 60.0;
  if (v6 > 60.0)
  {
    id v8 = objc_loadWeakRetained((id *)p_searchBar);
    [v8 frame];
    double v7 = v9;
  }
  long double v10 = [(SearchResultsViewController *)self->_searchResultsController navigationItem];
  [v10 _setMinimumDesiredHeight:0 forBarMetrics:v7];

  id v11 = [(SearchResultsViewController *)self->_searchResultsController navigationItem];
  [v11 _setMinimumDesiredHeight:1 forBarMetrics:v7];
}

- (void)resetSearchBar
{
  p_searchBar = &self->_searchBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  [WeakRetained setText:0];

  id v4 = objc_loadWeakRetained((id *)p_searchBar);
  [v4 resignFirstResponder];

  id v5 = objc_loadWeakRetained((id *)p_searchBar);
  [v5 setShowsCancelButton:0 animated:1];
}

- (void)teardownSearch
{
  [(MainWindowContentContainerViewController *)self resetSearchBar];
  searchResultsNavController = self->_searchResultsNavController;
  self->_searchResultsNavController = 0;

  searchResultsController = self->_searchResultsController;
  self->_searchResultsController = 0;
}

- (void)endSearch:(BOOL)a3
{
  BOOL v3 = a3;
  [(UISplitViewController *)self->_splitViewController hideColumn:0];
  [(MainWindowContentContainerViewController *)self resetSearchBar];
  self->_animatingSidebar = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100042988;
  v9[3] = &unk_1001D2E40;
  v9[4] = self;
  id v5 = objc_retainBlock(v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000429CC;
  v8[3] = &unk_1001D2E40;
  v8[4] = self;
  double v6 = objc_retainBlock(v8);
  if (v3)
  {
    double v7 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
    [v7 animateAlongsideTransition:v5 completion:v6];
  }
  else
  {
    ((void (*)(void *, void))v5[2])(v5, 0);
    ((void (*)(void *, void))v6[2])(v6, 0);
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v3 = [(MainWindowContentContainerViewController *)self delegate];
  [v3 searchTapped];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 length]) {
    [(MainWindowContentContainerViewController *)self setupSearch:1];
  }
  [(SearchResultsViewController *)self->_searchResultsController searchBar:v7 textDidChange:v6];
}

- (MainWindowContentContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MainWindowContentContainerDelegate *)WeakRetained;
}

- (MainWindowSearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (MainWindowSearchBar *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_searchResultsNavController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);

  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end