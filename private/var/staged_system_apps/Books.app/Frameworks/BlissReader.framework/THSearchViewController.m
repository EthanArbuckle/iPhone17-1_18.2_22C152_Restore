@interface THSearchViewController
- (BEHairlineDividerView)footerTopBorderView;
- (BEHairlineDividerView)headerDividerView;
- (BESearchResultTableViewCell)dummySearchResultsCell;
- (BOOL)p_dismissKeyboardOnScroll;
- (BOOL)p_isBottomViewVisible;
- (BOOL)p_presentingFullscreen;
- (BOOL)searchingForPredeterminedString;
- (BOOL)settingSearchForString;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (IMTheme)theme;
- (IMThemePage)themePage;
- (NSDictionary)pendingDeferredViewWillAppear;
- (NSLayoutConstraint)footerViewHeightConstraint;
- (NSString)pendingSearchText;
- (THSearchController)searchController;
- (THSearchTableViewDataSource)detailsDataSource;
- (THSearchTableViewDataSource)resultsDataSource;
- (THSearchTableViewDataSource)suggestionsDataSource;
- (THSearchViewController)initWithSearchController:(id)a3;
- (THSearchViewControllerDelegate)delegate;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)zeroWidthBarButton;
- (UIButton)searchEncyclopedia;
- (UIButton)searchWeb;
- (UITableViewController)detailsViewController;
- (UITableViewController)resultsViewController;
- (UIView)progressView;
- (UIView)searchView;
- (double)_resultsEstimatedRowHeight;
- (double)_resultsHeaderHeight;
- (double)maxContentHeight;
- (double)p_bestPopoverHeight;
- (double)searchBarHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)p_dataSourceForTableView:(id)a3;
- (id)p_searchText;
- (id)tableView:(id)a3 cellForPlainString:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForSearchResult:(id)a4;
- (id)tableView:(id)a3 noResultsCellWithKind:(int)a4;
- (id)tableView:(id)a3 seeAllResultsCellWithKind:(int)a4 count:(unint64_t)a5;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderWithTitle:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)searchViewMode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3;
- (void)_cancelOperation:(id)a3;
- (void)_configureResultsCell:(id)a3 forSearchResult:(id)a4 inTableView:(id)a5;
- (void)dealloc;
- (void)didPresentViewController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)navigateToAbsolutePageIndex:(unint64_t)a3;
- (void)navigateToSearchResult:(id)a3;
- (void)p_changeToSize:(double)a3 animated:(BOOL)a4;
- (void)p_configureAnimated:(BOOL)a3;
- (void)p_configureTableViewController:(id)a3;
- (void)p_configureTableViewControllerColors:(id)a3;
- (void)p_deferredViewWillAppear;
- (void)p_dismissSearchView:(id)a3;
- (void)p_navigateToAbsolutePageIndex:(id)a3;
- (void)p_navigateToAbsolutePageIndex:(id)a3 animated:(BOOL)a4;
- (void)p_navigateToSearchResult:(id)a3;
- (void)p_navigateToSearchResult:(id)a3 animated:(BOOL)a4;
- (void)p_removeSpinner;
- (void)p_searchForSuggestion:(id)a3;
- (void)p_searchIndexLoaded:(id)a3;
- (void)p_searchPaginationResultsUpdated:(id)a3;
- (void)p_setupSpinner;
- (void)p_showBottomView:(BOOL)a3 animated:(BOOL)a4;
- (void)p_showRecents;
- (void)p_updateButtonState;
- (void)releaseViews;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchEncyclopedia:(id)a3;
- (void)searchForString:(id)a3;
- (void)searchWeb:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsDataSource:(id)a3;
- (void)setDetailsViewController:(id)a3;
- (void)setDummySearchResultsCell:(id)a3;
- (void)setFooterTopBorderView:(id)a3;
- (void)setFooterViewHeightConstraint:(id)a3;
- (void)setHeaderDividerView:(id)a3;
- (void)setMaxContentHeight:(double)a3;
- (void)setPendingDeferredViewWillAppear:(id)a3;
- (void)setPendingSearchText:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setResultsDataSource:(id)a3;
- (void)setResultsViewController:(id)a3;
- (void)setSearchBarHeight:(double)a3;
- (void)setSearchEncyclopedia:(id)a3;
- (void)setSearchView:(id)a3;
- (void)setSearchViewMode:(int)a3;
- (void)setSearchWeb:(id)a3;
- (void)setSearchingForPredeterminedString:(BOOL)a3;
- (void)setSettingSearchForString:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setSuggestionsDataSource:(id)a3;
- (void)setTheme:(id)a3;
- (void)setZeroWidthBarButton:(id)a3;
- (void)showAllResultsWithKind:(int)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation THSearchViewController

- (THSearchViewController)initWithSearchController:(id)a3
{
  id v5 = a3;
  v6 = [(THSearchViewController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mSearchController, a3);
    v8 = +[UITraitCollection bc_allAPITraits];
    id v9 = [(THSearchViewController *)v7 registerForTraitChanges:v8 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(THSearchViewController *)self releaseViews];
  mDummySearchResultsCell = self->mDummySearchResultsCell;
  self->mDummySearchResultsCell = 0;

  v5.receiver = self;
  v5.super_class = (Class)THSearchViewController;
  [(THNavigationViewController *)&v5 dealloc];
}

- (void)releaseViews
{
  [(THSearchViewController *)self setSearchWeb:0];
  [(THSearchViewController *)self setSearchEncyclopedia:0];
  [(THSearchViewController *)self setPendingSearchText:0];
  [(THSearchViewController *)self setSpinner:0];
  [(THSearchViewController *)self setProgressView:0];
  [(THSearchViewController *)self setResultsViewController:0];
  [(THSearchViewController *)self setDetailsViewController:0];
  [(THSearchViewController *)self setResultsDataSource:0];
  [(THSearchViewController *)self setDetailsDataSource:0];
  [(THSearchViewController *)self setSuggestionsDataSource:0];
  mNoIndexViewController = self->mNoIndexViewController;
  self->mNoIndexViewController = 0;

  mSearchBar = self->mSearchBar;
  self->mSearchBar = 0;

  mNoIndexView = self->mNoIndexView;
  self->mNoIndexView = 0;

  mNoIndexViewLabel = self->mNoIndexViewLabel;
  self->mNoIndexViewLabel = 0;

  mNoIndexActivityIndicatorView = self->mNoIndexActivityIndicatorView;
  self->mNoIndexActivityIndicatorView = 0;

  mDummySearchResultsCell = self->mDummySearchResultsCell;
  self->mDummySearchResultsCell = 0;

  mPendingDeferredViewWillAppear = self->mPendingDeferredViewWillAppear;
  self->mPendingDeferredViewWillAppear = 0;

  v10.receiver = self;
  v10.super_class = (Class)THSearchViewController;
  [(THNavigationViewController *)&v10 releaseViews];
}

- (IMThemePage)themePage
{
  objc_opt_class();

  return (IMThemePage *)BUDynamicCast();
}

- (BOOL)p_isBottomViewVisible
{
  v3 = [(THSearchViewController *)self view];
  if (v3)
  {
    v4 = [(THSearchViewController *)self view];
    [v4 frame];
    if (v5 <= self->_searchBarHeight)
    {
      BOOL v7 = 0;
    }
    else
    {
      [(THSearchViewController *)self preferredContentSize];
      BOOL v7 = v6 > self->_searchBarHeight;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)p_showBottomView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->mShowBottomView = a3;
  if ([(THSearchViewController *)self p_presentingFullscreen])
  {
    [(THSearchViewController *)self p_updateButtonState];
    BOOL v7 = [(THSearchViewController *)self footerViewHeightConstraint];
    [v7 setConstant:44.0];

    v8 = [(THNavigationViewController *)self contentContainerView];
    [v8 setAlpha:1.0];

    id v25 = [(THNavigationViewController *)self footerView];
    [v25 setAlpha:1.0];
  }
  else
  {
    id v9 = [(THSearchViewController *)self view];
    [v9 frame];
    double v11 = v10;

    if (v5)
    {
      [(THSearchViewController *)self p_bestPopoverHeight];
      double searchBarHeight = v12;
      v14 = [(THSearchViewController *)self footerViewHeightConstraint];
      [v14 setConstant:44.0];

      double v15 = 1.0;
    }
    else
    {
      double searchBarHeight = self->_searchBarHeight;
      v16 = [(THSearchViewController *)self footerViewHeightConstraint];
      double v15 = 0.0;
      [v16 setConstant:0.0];
    }
    BOOL v17 = searchBarHeight != self->_searchBarHeight && v4;
    v18 = [(THSearchViewController *)self view];
    [v18 frame];
    if (searchBarHeight == v19
      && ([(THSearchViewController *)self preferredContentSize], searchBarHeight == v20))
    {
      v22 = [(THNavigationViewController *)self footerView];
      [v22 alpha];
      double v24 = v23;

      if (v24 == v15) {
        return;
      }
    }
    else
    {
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_D3F58;
    v28[3] = &unk_4591F8;
    v28[4] = self;
    *(double *)&v28[5] = v15;
    v21 = objc_retainBlock(v28);
    -[THSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, searchBarHeight);
    if (v17)
    {
      +[UIView animateWithDuration:v21 animations:0.3];
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_D3FE0;
      v26[3] = &unk_4576D0;
      v27 = v21;
      +[UIView performBlockWithActionsAndAnimationsDisabled:v26];
    }
  }
}

- (void)p_changeToSize:(double)a3 animated:(BOOL)a4
{
  if (![(THSearchViewController *)self p_presentingFullscreen]
    && [(THSearchViewController *)self p_isBottomViewVisible])
  {
    double v6 = [(THSearchViewController *)self view];
    [v6 frame];
    double Width = CGRectGetWidth(v15);

    if (Width <= 0.0) {
      double Width = 375.0;
    }
    v8 = [(THSearchViewController *)self view];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    if (Width != v10 || v12 != a3)
    {
      -[THSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, a3);
    }
  }
}

- (double)p_bestPopoverHeight
{
  double searchBarHeight = self->_searchBarHeight;
  objc_opt_class();
  BOOL v4 = [(THNavigationViewController *)self topViewController];
  BOOL v5 = TSUDynamicCast();

  double v6 = [v5 tableView];
  if (v6)
  {
    BOOL v7 = [(THNavigationViewController *)self navigationBar];
    [v7 frame];
    double v9 = v8;
    double v10 = [(THNavigationViewController *)self footerView];
    [v10 frame];
    double v12 = v9 + v11 + -1.0;

    [(THSearchViewController *)self maxContentHeight];
    if (v13 <= 0.0) {
      double v14 = kBESearchPopoverViewMaxContentHeight;
    }
    else {
      [(THSearchViewController *)self maxContentHeight];
    }
    double v15 = v14 - v12;
    v16 = [(THSearchViewController *)self resultsDataSource];
    BOOL v17 = [(THSearchViewController *)self suggestionsDataSource];

    if (v16 == v17)
    {
      [v6 rowHeight];
      double v20 = v19;
      [(THSearchViewController *)self _resultsHeaderHeight];
      double v22 = 440.0;
      if (v20 > 0.0) {
        double v22 = v20 * 10.0;
      }
      if (v22 >= v15) {
        double v22 = v15;
      }
      double v18 = v21 + v22;
    }
    else
    {
      [v6 preferredContentHeightWithMax:v15];
    }
    double searchBarHeight = v12 + v18;
  }

  return searchBarHeight;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  [(THSearchViewController *)self p_bestPopoverHeight];

  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  [(THSearchViewController *)self p_bestPopoverHeight];

  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
}

- (void)keyboardWillChangeFrame:(id)a3
{
  [(THSearchViewController *)self p_bestPopoverHeight];

  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 0);
}

- (void)p_showRecents
{
  if ([(THSearchViewController *)self isMovingToParentViewController]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(THSearchViewController *)self isBeingPresented] ^ 1;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D43A0;
  v5[3] = &unk_456DB8;
  v5[4] = self;
  id v4 = [(THNavigationViewController *)self popToRootViewControllerAnimated:v3 completion:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)THSearchViewController;
  -[THSearchViewController viewWillAppear:](&v9, "viewWillAppear:");
  BOOL v5 = [(THSearchViewController *)self ba_analyticsTracker];

  if (!v5) {
    id v6 = [(THSearchViewController *)self ba_setupNewAnalyticsTrackerWithName:@"ContentSearch"];
  }
  CFStringRef v10 = @"animated";
  BOOL v7 = +[NSNumber numberWithBool:v3];
  double v11 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(THSearchViewController *)self setPendingDeferredViewWillAppear:v8];

  [(THSearchViewController *)self p_updateButtonState];
}

- (void)p_deferredViewWillAppear
{
  BOOL v3 = [(THSearchViewController *)self pendingDeferredViewWillAppear];
  id v4 = [v3 objectForKeyedSubscript:@"animated"];
  id v5 = [v4 BOOLValue];

  [(THSearchViewController *)self setPendingDeferredViewWillAppear:0];

  [(THSearchViewController *)self p_configureAnimated:v5];
}

- (void)_cancelOperation:(id)a3
{
}

- (void)p_configureAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(THSearchViewController *)self p_wantsCancelButton];
  if (v5 && isPad()) {
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"searchBarCancelButtonClicked:"];
  }
  else {
    id v13 = 0;
  }
  [(UISearchBar *)self->mSearchBar setShowsCancelButton:v5];
  id v6 = [(THSearchViewController *)self resultsViewController];
  BOOL v7 = [v6 navigationItem];
  [v7 setRightBarButtonItem:v13];

  if (![(THSearchController *)self->mSearchController indexLoaded])
  {
    uint64_t v9 = 0;
LABEL_15:
    [(THSearchViewController *)self p_showBottomView:v9 animated:v3];
    goto LABEL_16;
  }
  if ([(THSearchViewController *)self settingSearchForString]) {
    goto LABEL_11;
  }
  double v8 = [(THSearchController *)self->mSearchController currentQuery];
  if (v8)
  {

    goto LABEL_11;
  }
  CFStringRef v10 = [(THSearchViewController *)self pendingSearchText];

  if (v10)
  {
LABEL_11:
    uint64_t v9 = [(THSearchController *)self->mSearchController currentQuery];

    if (v9)
    {
      double v11 = [(THSearchController *)self->mSearchController currentQuery];
      [(UISearchBar *)self->mSearchBar setText:v11];

      if ([(THSearchViewController *)self searchingForPredeterminedString]
        && !self->mSearchingForString)
      {
        double v12 = [(THSearchController *)self->mSearchController currentQuery];
        uint64_t v9 = [v12 length] != 0;
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    goto LABEL_15;
  }
  [(THSearchViewController *)self p_showRecents];
LABEL_16:
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THSearchViewController;
  [(THSearchViewController *)&v9 viewDidAppear:a3];
  if (!self->mSearchingForString)
  {
    objc_opt_class();
    id v4 = [(THNavigationViewController *)self topViewController];
    BOOL v5 = TSUDynamicCast();

    id v6 = [v5 tableView];
    BOOL v7 = [(THSearchViewController *)self p_dataSourceForTableView:v6];
    unsigned int v8 = [v7 searchViewMode];

    if (v8 != 2) {
      [(UISearchBar *)self->mSearchBar becomeFirstResponder];
    }
  }
  self->mSearchingForString = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UISearchBar *)self->mSearchBar resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)THSearchViewController;
  [(THSearchViewController *)&v5 viewWillDisappear:v3];
}

- (void)didPresentViewController:(id)a3
{
  if ([(THSearchViewController *)self p_isBottomViewVisible])
  {
    [(THSearchViewController *)self p_bestPopoverHeight];
    -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
  }
}

- (void)p_searchIndexLoaded:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:THSearchControllerDidLoadIndexNotification object:self->mSearchController];

  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D4A44;
  block[3] = &unk_456D40;
  block[4] = self;
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, block);
}

- (void)p_searchPaginationResultsUpdated:(id)a3
{
  id v4 = [(THSearchViewController *)self resultsViewController];
  objc_super v5 = [v4 tableView];
  [v5 reloadData];

  id v7 = [(THSearchViewController *)self detailsViewController];
  id v6 = [v7 tableView];
  [v6 reloadData];
}

- (void)setTheme:(id)a3
{
  objc_super v5 = (IMTheme *)a3;
  p_mTheme = &self->mTheme;
  if (self->mTheme != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_mTheme, a3);
    p_mTheme = (IMTheme **)[(THSearchViewController *)self stylizeForTheme];
    objc_super v5 = v7;
  }

  _objc_release_x1(p_mTheme, v5);
}

- (void)stylizeForTheme
{
  BOOL v3 = [(THSearchViewController *)self viewIfLoaded];
  if (v3)
  {
    id v4 = [(THSearchViewController *)self themePage];
    int64_t v5 = [(THSearchViewController *)self overrideUserInterfaceStyle];
    id v6 = [(THSearchViewController *)self resultsViewController];
    [v6 setOverrideUserInterfaceStyle:v5];

    id v7 = [(THSearchViewController *)self detailsViewController];
    [v7 setOverrideUserInterfaceStyle:v5];

    v39 = [v4 secondaryTextColor];
    uint64_t v8 = [v4 keyColor];
    uint64_t v9 = [v4 primaryTextColor];
    CFStringRef v10 = [v4 searchBackgroundColor];
    if (!v10)
    {
      CFStringRef v10 = [v4 backgroundColorForTraitEnvironment:self];
    }
    v41 = (void *)v8;
    [v3 setTintColor:v8];
    v42 = v3;
    [v3 setBackgroundColor:v10];
    double v11 = [(THSearchViewController *)self searchView];
    [v11 setBackgroundColor:v10];

    double v12 = [(THNavigationViewController *)self contentContainerView];
    [v12 setBackgroundColor:v10];

    id v13 = [(THNavigationViewController *)self footerView];
    [v13 setBackgroundColor:v10];

    double v14 = [(THNavigationViewController *)self navigationBar];
    [v14 setBarTintColor:v10];

    double v15 = [(THSearchViewController *)self popoverPresentationController];
    [v15 setBackgroundColor:v10];

    [(UISearchBar *)self->mSearchBar setBackgroundColor:v10];
    v16 = [(THSearchViewController *)self resultsViewController];
    [(THSearchViewController *)self p_configureTableViewControllerColors:v16];

    BOOL v17 = [(THSearchViewController *)self detailsViewController];
    [(THSearchViewController *)self p_configureTableViewControllerColors:v17];

    NSAttributedStringKey v43 = NSForegroundColorAttributeName;
    uint64_t v44 = v9;
    v40 = (void *)v9;
    double v18 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    double v19 = [(THNavigationViewController *)self navigationBar];
    [v19 setTitleTextAttributes:v18];

    double v20 = [v4 dividerColor];
    [(BEHairlineDividerView *)self->_headerDividerView setDividerColor:v20];
    [(BEHairlineDividerView *)self->_footerTopBorderView setDividerColor:v20];
    double v21 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
    double v22 = +[UIImageSymbolConfiguration configurationWithPointSize:14.0];
    double v23 = [v21 imageWithConfiguration:v22];

    double v24 = [v23 imageWithTintColor:v39];

    id v25 = [v24 imageWithRenderingMode:1];

    v26 = +[UIImage systemImageNamed:@"magnifyingglass"];
    v27 = +[UIImageSymbolConfiguration configurationWithPointSize:16.0];
    v28 = [v26 imageWithConfiguration:v27];

    v29 = [v28 imageWithTintColor:v39];

    [(UISearchBar *)self->mSearchBar setImage:v25 forSearchBarIcon:1 state:0];
    [(UISearchBar *)self->mSearchBar setImage:v29 forSearchBarIcon:0 state:0];
    v30 = [(UISearchBar *)self->mSearchBar searchField];
    if (([(THSearchViewController *)self im_isCompactWidth] & 1) != 0
      || [(THSearchViewController *)self im_isCompactHeight])
    {
      v31 = [(THSearchViewController *)self themePage];
      v32 = [v31 secondaryBackgroundColor];
      [v30 setBackgroundColor:v32];
    }
    else
    {
      [v30 setBackgroundColor:0];
    }
    v33 = [v30 _placeholderLabel];
    [v33 setTextColor:v39];

    [v30 setTextColor:v40];
    v34 = [v30 leftView];
    [v34 setTintColor:v39];

    v35 = [(THSearchViewController *)self resultsViewController];
    v36 = [v35 tableView];
    [v36 reloadData];

    v37 = [(THSearchViewController *)self detailsViewController];
    v38 = [v37 tableView];
    [v38 reloadData];

    BOOL v3 = v42;
  }
}

- (void)p_configureTableViewController:(id)a3
{
  id v9 = [a3 tableView];
  [(THSearchViewController *)self _resultsHeaderHeight];
  [v9 setSectionHeaderHeight:];
  [v9 setAutoresizingMask:18];
  id v4 = [(THNavigationViewController *)self contentContainerView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [v9 setFrame:CGPointZero.x, CGPointZero.y, v6, v8];
  [v9 setDataSource:self];
  [v9 setDelegate:self];
}

- (void)p_configureTableViewControllerColors:(id)a3
{
  id v8 = a3;
  id v4 = [(THSearchViewController *)self themePage];
  double v5 = [v4 searchBackgroundColor];
  if (!v5)
  {
    double v5 = [v4 backgroundColorForTraitEnvironment:self];
  }
  double v6 = [v8 tableView];
  double v7 = [v4 tableViewSeparatorColor];
  [v6 setSeparatorColor:v7];

  [v6 setBackgroundColor:v5];
}

- (BOOL)p_presentingFullscreen
{
  return [(THSearchViewController *)self _isInPopoverPresentation] ^ 1;
}

- (BOOL)p_dismissKeyboardOnScroll
{
  return 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if ([(THSearchViewController *)self p_dismissKeyboardOnScroll])
  {
    mSearchBar = self->mSearchBar;
    [(UISearchBar *)mSearchBar resignFirstResponder];
  }
}

- (void)viewWillLayoutSubviews
{
  if ([(THSearchViewController *)self p_presentingFullscreen])
  {
    [(THSearchViewController *)self _resultsEstimatedRowHeight];
    double v4 = v3;
    double v5 = [(THSearchViewController *)self detailsViewController];
    double v6 = [v5 tableView];
    [v6 setEstimatedRowHeight:v4];

    [(UIViewController *)self->mNoIndexViewController setView:self->mNoIndexView];
    [(UIView *)self->mNoIndexView frame];
    -[UIViewController setPreferredContentSize:](self->mNoIndexViewController, "setPreferredContentSize:", v7, v8);
    id v9 = [(UIViewController *)self->mNoIndexViewController navigationItem];
    [v9 setTitleView:0];

    CFStringRef v10 = [(UIViewController *)self->mNoIndexViewController navigationItem];
    double v11 = v10;
    uint64_t v12 = 0;
  }
  else
  {
    double v13 = kBESearchSectionSearchResultCellHeightPad;
    double v14 = [(THSearchViewController *)self detailsViewController];
    double v15 = [v14 tableView];
    [v15 setEstimatedRowHeight:v13];

    [(UIViewController *)self->mNoIndexViewController setView:0];
    mNoIndexView = self->mNoIndexView;
    BOOL v17 = [(UIViewController *)self->mNoIndexViewController navigationItem];
    [v17 setTitleView:mNoIndexView];

    CFStringRef v10 = [(UIViewController *)self->mNoIndexViewController navigationItem];
    double v11 = v10;
    uint64_t v12 = 1;
  }
  [v10 setHidesBackButton:v12];

  uint64_t v18 = [(THSearchViewController *)self pendingDeferredViewWillAppear];
  if (v18)
  {
    double v19 = (void *)v18;
    double v20 = [(THSearchViewController *)self traitCollection];
    id v21 = [v20 horizontalSizeClass];

    if (v21)
    {
      [(THSearchViewController *)self p_deferredViewWillAppear];
    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_D5554;
  v4[3] = &unk_459220;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)THSearchViewController;
  id v7 = a4;
  -[THSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_D5638;
  v8[3] = &unk_459220;
  v8[4] = self;
  [v7 animateAlongsideTransition:&stru_459260 completion:v8];
}

- (void)viewDidLoad
{
  v120.receiver = self;
  v120.super_class = (Class)THSearchViewController;
  [(THNavigationViewController *)&v120 viewDidLoad];
  double v3 = [(THNavigationViewController *)self footerView];
  double v4 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v4;

  [(BEHairlineDividerView *)self->_headerDividerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BEHairlineDividerView *)self->_headerDividerView setHorizontal:1];
  [(UIView *)self->_searchView addSubview:self->_headerDividerView];
  double v6 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = v6;

  [(BEHairlineDividerView *)self->_footerTopBorderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BEHairlineDividerView *)self->_footerTopBorderView setHorizontal:1];
  [v3 addSubview:self->_footerTopBorderView];
  double v8 = +[BESearchViewController p_standardSearchBar];
  mSearchBar = self->mSearchBar;
  self->mSearchBar = v8;

  [(UISearchBar *)self->mSearchBar setDelegate:self];
  [(UISearchBar *)self->mSearchBar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISearchBar *)self->mSearchBar _setAutoDisableCancelButton:0];
  [(UISearchBar *)self->mSearchBar sizeToFit];
  [(UISearchBar *)self->mSearchBar frame];
  self->_double searchBarHeight = CGRectGetHeight(v122);
  CFStringRef v10 = [(THSearchViewController *)self view];
  UIUserInterfaceLayoutDirection v116 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v10 semanticContentAttribute]);

  v119 = [(THSearchViewController *)self searchWeb];
  v86 = [(THSearchViewController *)self searchEncyclopedia];
  double v11 = [(THNavigationViewController *)self navigationBar];
  uint64_t v12 = [(THNavigationViewController *)self contentContainerView];
  [v86 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v119 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v13 = [(THSearchViewController *)self view];
  double v14 = [v13 safeAreaLayoutGuide];

  v115 = [(UIView *)self->_searchView topAnchor];
  v114 = [v14 topAnchor];
  v113 = [v115 constraintEqualToAnchor:v114];
  v121[0] = v113;
  v112 = [(UIView *)self->_searchView bottomAnchor];
  v111 = [v14 bottomAnchor];
  v110 = [v112 constraintEqualToAnchor:v111];
  v121[1] = v110;
  v109 = [v11 leadingAnchor];
  v108 = [v14 leadingAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v121[2] = v107;
  v87 = v11;
  v106 = [v11 trailingAnchor];
  v105 = [v14 trailingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v121[3] = v104;
  v103 = [v11 heightAnchor];
  v102 = [v103 constraintEqualToConstant:self->_searchBarHeight];
  v121[4] = v102;
  v101 = [(BEHairlineDividerView *)self->_headerDividerView topAnchor];
  v100 = [v12 topAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v121[5] = v99;
  v98 = [(BEHairlineDividerView *)self->_headerDividerView centerXAnchor];
  v97 = [v12 centerXAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v121[6] = v96;
  v95 = [(BEHairlineDividerView *)self->_headerDividerView widthAnchor];
  v118 = v12;
  v94 = [v12 widthAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v121[7] = v93;
  v92 = [(BEHairlineDividerView *)self->_headerDividerView heightAnchor];
  double v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  v91 = [v92 constraintEqualToConstant:v17];
  v121[8] = v91;
  v90 = [(BEHairlineDividerView *)self->_footerTopBorderView topAnchor];
  uint64_t v18 = v3;
  v89 = [v3 topAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v121[9] = v88;
  v85 = [(BEHairlineDividerView *)self->_footerTopBorderView centerXAnchor];
  v84 = [v3 centerXAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v121[10] = v83;
  v82 = [(BEHairlineDividerView *)self->_footerTopBorderView widthAnchor];
  v81 = [v3 widthAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v121[11] = v80;
  v79 = [(BEHairlineDividerView *)self->_footerTopBorderView heightAnchor];
  double v19 = +[UIScreen mainScreen];
  [v19 scale];
  double v21 = 1.0 / v20;

  v78 = [v79 constraintEqualToConstant:v21];
  v121[12] = v78;
  v77 = [v119 leadingAnchor];
  v76 = [v14 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:15.0];
  v121[13] = v75;
  v74 = [v119 widthAnchor];
  v73 = [v3 widthAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 multiplier:0.5 constant:-15.0];
  v121[14] = v72;
  v71 = [v119 heightAnchor];
  v70 = [v3 heightAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v121[15] = v69;
  v68 = [v119 bottomAnchor];
  v67 = [v3 bottomAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v121[16] = v66;
  v65 = [v86 trailingAnchor];
  v117 = v14;
  v64 = [v14 trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-15.0];
  v121[17] = v63;
  v62 = [v86 widthAnchor];
  v61 = [v3 widthAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 multiplier:0.5 constant:-15.0];
  v121[18] = v60;
  double v22 = [v86 heightAnchor];
  double v23 = [v3 heightAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23];
  v121[19] = v24;
  id v25 = [v86 bottomAnchor];
  v26 = [v18 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v121[20] = v27;
  v28 = +[NSArray arrayWithObjects:v121 count:21];
  +[NSLayoutConstraint activateConstraints:v28];

  if (v116 == UIUserInterfaceLayoutDirectionRightToLeft) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 1;
  }
  if (v116 == UIUserInterfaceLayoutDirectionRightToLeft) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = 2;
  }
  [v119 setContentHorizontalAlignment:v29];
  [v86 setContentHorizontalAlignment:v30];
  v31 = THBundle();
  v32 = [v31 localizedStringForKey:@"Search Web" value:&stru_46D7E8 table:0];
  [v119 setTitle:v32 forState:0];

  v33 = THBundle();
  v34 = [v33 localizedStringForKey:@"Search Wikipedia" value:&stru_46D7E8 table:0];
  [v86 setTitle:v34 forState:0];

  [v18 setHidden:0];
  [(THSearchViewController *)self p_showBottomView:0 animated:0];
  id v35 = [objc_alloc((Class)UITableViewController) initWithNibName:0 bundle:0];
  [(THSearchViewController *)self setResultsViewController:v35];

  id v36 = [objc_alloc((Class)UITableViewController) initWithNibName:0 bundle:0];
  [(THSearchViewController *)self setDetailsViewController:v36];

  v37 = self->mSearchBar;
  v38 = [(THSearchViewController *)self resultsViewController];
  v39 = [v38 navigationItem];
  [v39 setTitleView:v37];

  v40 = [THSearchTableViewDataSource alloc];
  v41 = [(THSearchViewController *)self searchController];
  v42 = [(THSearchTableViewDataSource *)v40 initWithSearchController:v41 searchViewMode:0];
  [(THSearchViewController *)self setResultsDataSource:v42];

  NSAttributedStringKey v43 = [THSearchTableViewDataSource alloc];
  uint64_t v44 = [(THSearchViewController *)self searchController];
  v45 = [(THSearchTableViewDataSource *)v43 initWithSearchController:v44 searchViewMode:2];
  [(THSearchViewController *)self setDetailsDataSource:v45];

  v46 = [THSearchTableViewDataSource alloc];
  v47 = [(THSearchViewController *)self searchController];
  v48 = [(THSearchTableViewDataSource *)v46 initWithSearchController:v47 searchViewMode:1];
  [(THSearchViewController *)self setSuggestionsDataSource:v48];

  v49 = [(THSearchViewController *)self resultsViewController];
  [(THSearchViewController *)self p_configureTableViewController:v49];

  v50 = [(THSearchViewController *)self detailsViewController];
  [(THSearchViewController *)self p_configureTableViewController:v50];

  v51 = [(THSearchViewController *)self resultsViewController];
  [(THNavigationViewController *)self pushViewController:v51 animated:0];

  v52 = +[UIImage th_imageNamed:@"clearpixel"];
  [v87 setBackgroundImage:v52 forBarMetrics:0];
  [v87 setRequestedContentSize:3];
  [v87 _setHidesShadow:1];
  if (![(THSearchController *)self->mSearchController indexLoaded])
  {
    if (!self->mNoIndexViewController)
    {
      v53 = (UIViewController *)objc_alloc_init((Class)UIViewController);
      mNoIndexViewController = self->mNoIndexViewController;
      self->mNoIndexViewController = v53;
    }
    v55 = THBundle();
    v56 = [v55 localizedStringForKey:@"Search Index Loading…" value:&stru_46D7E8 table:0];
    [(UILabel *)self->mNoIndexViewLabel setText:v56];

    [(UIActivityIndicatorView *)self->mNoIndexActivityIndicatorView startAnimating];
    [(THNavigationViewController *)self pushViewController:self->mNoIndexViewController animated:0];
    v57 = +[NSNotificationCenter defaultCenter];
    [v57 addObserver:self selector:"p_searchIndexLoaded:" name:THSearchControllerDidLoadIndexNotification object:self->mSearchController];
    [v57 addObserver:self selector:"p_searchPaginationResultsUpdated:" name:THSearchControllerDidUpdatePaginationResultsNotification object:self->mSearchController];
    [(THSearchController *)self->mSearchController loadIndex];
  }
  v58 = [(THNavigationViewController *)self contentContainerView];
  [v58 setClipsToBounds:1];

  v59 = [(THSearchViewController *)self view];
  [v59 setClipsToBounds:1];

  [(THSearchViewController *)self stylizeForTheme];
}

- (int64_t)overrideUserInterfaceStyle
{
  v7.receiver = self;
  v7.super_class = (Class)THSearchViewController;
  id v3 = [(THSearchViewController *)&v7 overrideUserInterfaceStyle];
  if (!v3)
  {
    objc_opt_class();
    double v4 = [(THSearchViewController *)self theme];
    double v5 = TSUDynamicCast();

    if (v5) {
      id v3 = [v5 userInterfaceStyle];
    }
    else {
      id v3 = 0;
    }
  }
  return (int64_t)v3;
}

- (void)p_dismissSearchView:(id)a3
{
  id v3 = [(THSearchViewController *)self delegate];
  [v3 searchFinished:1 completion:0];
}

- (void)didReceiveMemoryWarning
{
  if (![(THSearchViewController *)self isViewLoaded]
    || ([(THSearchViewController *)self view],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 window],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)THSearchViewController;
    [(THSearchViewController *)&v5 didReceiveMemoryWarning];
  }
}

- (void)searchForString:(id)a3
{
  self->mSearchingForString = 1;
  mSearchController = self->mSearchController;
  id v9 = a3;
  if ([(THSearchController *)mSearchController indexLoaded])
  {
    self->mTextSetBySearch = 1;
    [(UISearchBar *)self->mSearchBar setText:v9];

    self->mTextSetBySearch = 0;
    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(THSearchController *)self->mSearchController clearSearchResults];
    [(THSearchViewController *)self setSettingSearchForString:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_D67C8;
    v10[3] = &unk_456DB8;
    v10[4] = self;
    objc_super v5 = objc_retainBlock(v10);
    double v6 = [(THNavigationViewController *)self topViewController];
    objc_super v7 = [(THSearchViewController *)self resultsViewController];

    if (v6 == v7) {
      ((void (*)(void *, uint64_t))v5[2])(v5, 1);
    }
    else {
      id v8 = [(THNavigationViewController *)self popToRootViewControllerAnimated:1 completion:v5];
    }
  }
  else
  {
    [(THSearchViewController *)self setPendingSearchText:v9];
  }
}

- (void)p_searchForSuggestion:(id)a3
{
  id v4 = a3;
  mSearchController = self->mSearchController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D68B8;
  v7[3] = &unk_456D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(THSearchController *)mSearchController suggestionsForSearchString:v6 completionBlock:v7];
}

- (void)p_setupSpinner
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 60.0, 60.0];
  [(THSearchViewController *)self setProgressView:v3];

  id v4 = [(THSearchViewController *)self resultsViewController];
  objc_super v5 = [v4 tableView];
  id v6 = [v5 backgroundColor];
  objc_super v7 = [(THSearchViewController *)self progressView];
  [v7 setBackgroundColor:v6];

  id v8 = [(THSearchViewController *)self progressView];
  id v9 = [v8 layer];
  [v9 setCornerRadius:7.0];

  CFStringRef v10 = [(THNavigationViewController *)self contentContainerView];
  double v11 = [(THSearchViewController *)self progressView];
  [v10 addSubview:v11];

  uint64_t v12 = [(THNavigationViewController *)self contentContainerView];
  [v12 bounds];
  TSDCenterOfRect();
  TSDFlooredPoint();
  double v14 = v13;
  double v16 = v15;
  double v17 = [(THSearchViewController *)self progressView];
  [v17 setCenter:v14, v16];

  id v18 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [(THSearchViewController *)self setSpinner:v18];

  double v19 = [(THNavigationViewController *)self contentContainerView];
  double v20 = [(THSearchViewController *)self spinner];
  [v19 addSubview:v20];

  double v21 = [(THSearchViewController *)self progressView];
  [v21 center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(THSearchViewController *)self spinner];
  [v26 setCenter:v23, v25];

  v27 = [(THSearchViewController *)self progressView];
  [v27 setAlpha:0.0];

  v28 = [(THSearchViewController *)self spinner];
  [v28 setAlpha:0.0];

  id v29 = [(THSearchViewController *)self spinner];
  [v29 startAnimating];
}

- (void)p_removeSpinner
{
  id v3 = [(THSearchViewController *)self spinner];

  if (v3)
  {
    id v4 = [(THSearchViewController *)self spinner];
    [v4 stopAnimating];

    objc_super v5 = [(THSearchViewController *)self spinner];
    [v5 removeFromSuperview];

    [(THSearchViewController *)self setSpinner:0];
  }
  id v6 = [(THSearchViewController *)self progressView];

  if (v6)
  {
    objc_super v7 = [(THSearchViewController *)self progressView];
    [v7 removeFromSuperview];

    [(THSearchViewController *)self setProgressView:0];
  }
}

- (void)navigateToSearchResult:(id)a3
{
  id v4 = a3;
  [(THSearchViewController *)self p_setupSpinner];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D6D7C;
  v5[3] = &unk_456D40;
  v5[4] = self;
  +[UIView animateWithDuration:196608 delay:v5 options:0 animations:0.2 completion:0.5];
  [(THSearchViewController *)self performSelector:"p_navigateToSearchResult:" withObject:v4 afterDelay:0.0];
}

- (void)p_navigateToAbsolutePageIndex:(id)a3
{
}

- (void)p_navigateToAbsolutePageIndex:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(THSearchViewController *)self p_removeSpinner];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D6ECC;
  v9[3] = &unk_456D90;
  id v10 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  id v7 = WeakRetained;
  id v8 = v6;
  [v7 searchFinished:v4 completion:v9];
}

- (void)p_navigateToSearchResult:(id)a3
{
}

- (void)p_navigateToSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(THSearchViewController *)self p_removeSpinner];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D6FF8;
  v9[3] = &unk_459288;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  double v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = WeakRetained;
  [v8 searchFinished:v4 completion:v9];
}

- (void)navigateToAbsolutePageIndex:(unint64_t)a3
{
  [(THSearchViewController *)self p_setupSpinner];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_D7150;
  v6[3] = &unk_456D40;
  v6[4] = self;
  +[UIView animateWithDuration:196608 delay:v6 options:0 animations:0.2 completion:0.5];
  objc_super v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [(THSearchViewController *)self performSelector:"p_navigateToAbsolutePageIndex:" withObject:v5 afterDelay:0.0];
}

- (void)showAllResultsWithKind:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = [(THSearchViewController *)self detailsViewController];
  id v13 = [v5 tableView];

  id v6 = [(THSearchViewController *)self detailsDataSource];
  [v6 updateForResultsKind:v3];

  [v13 reloadData];
  if ((uint64_t)[v13 numberOfSections] >= 1
    && (uint64_t)[v13 numberOfRowsInSection:0] >= 1)
  {
    id v7 = +[NSIndexPath indexPathForRow:0 inSection:0];
    [v13 scrollToRowAtIndexPath:v7 atScrollPosition:1 animated:0];
  }
  id v8 = [(THSearchViewController *)self searchController];
  id v9 = [v8 currentQuery];
  id v10 = [(THSearchViewController *)self detailsViewController];
  double v11 = [v10 navigationItem];
  [v11 setTitle:v9];

  id v12 = [(THSearchViewController *)self detailsViewController];
  [(THNavigationViewController *)self pushViewController:v12 animated:1];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  if (!self->mTextSetBySearch)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self, a4);
    [(THSearchController *)self->mSearchController clearSearchResults];
    id v7 = [(THSearchViewController *)self p_searchText];
    if ([v7 length])
    {
      [(THSearchViewController *)self performSelector:"p_searchForSuggestion:" withObject:v7 afterDelay:0.25];
    }
    else
    {
      objc_super v5 = +[NSArray array];
      id v6 = [(THSearchViewController *)self suggestionsDataSource];
      [v6 setSuggestions:v5];

      [(THSearchViewController *)self p_showRecents];
    }
    [(THSearchViewController *)self p_updateButtonState];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  BOOL v4 = [(THSearchViewController *)self p_searchText];
  if ([v4 length])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(THSearchController *)self->mSearchController clearSearchResults];
    objc_super v5 = [THSearchTableViewDataSource alloc];
    id v6 = [(THSearchViewController *)self searchController];
    id v7 = [(THSearchTableViewDataSource *)v5 initWithSearchController:v6 searchViewMode:2];
    [(THSearchViewController *)self setResultsDataSource:v7];

    [(UISearchBar *)self->mSearchBar resignFirstResponder];
    mSearchController = self->mSearchController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_D7540;
    v9[3] = &unk_456D40;
    void v9[4] = self;
    [(THSearchController *)mSearchController searchForString:v4 completionBlock:v9];
  }
}

- (id)p_searchText
{
  v2 = [(UISearchBar *)self->mSearchBar text];
  uint64_t v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  BOOL v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (void)p_updateButtonState
{
  uint64_t v3 = [(THSearchViewController *)self p_searchText];
  BOOL v4 = [v3 length] != 0;

  objc_super v5 = [(THSearchViewController *)self searchEncyclopedia];
  [v5 setEnabled:v4];

  id v6 = [(THSearchViewController *)self searchWeb];
  [v6 setEnabled:v4];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)searchWeb:(id)a3
{
  uint64_t v3 = [(UISearchBar *)self->mSearchBar text];
  BOOL v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v8 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  objc_super v5 = +[UIApplication sharedApplication];
  id v6 = [@"x-web-search:///?" stringByAppendingString:v8];
  id v7 = +[NSURL URLWithString:v6];
  [v5 openURL:v7 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)searchEncyclopedia:(id)a3
{
  uint64_t v3 = [(UISearchBar *)self->mSearchBar text];
  BOOL v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v8 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  objc_super v5 = +[NSString stringWithFormat:@"x-web-search://wikipedia/?%@", v8];
  id v6 = +[NSURL URLWithString:v5];

  id v7 = +[UIApplication sharedApplication];
  [v7 openURL:v6 options:&__NSDictionary0__struct completionHandler:0];
}

- (id)tableView:(id)a3 viewForHeaderWithTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THSearchViewController *)self themePage];
  id v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"headerCell"];
  if (!v9) {
    id v9 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithReuseIdentifier:@"headerCell"];
  }
  id v10 = [v9 textLabel];
  [v10 setText:v7];

  double v11 = [(THSearchViewController *)self themePage];
  id v12 = [v11 secondaryTextColor];
  id v13 = [v9 textLabel];
  [v13 setTextColor:v12];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_D7A34;
  v17[3] = &unk_4592B0;
  id v18 = v8;
  id v19 = v6;
  id v14 = v6;
  id v15 = v8;
  [v9 _setBackgroundViewConfigurationProvider:v17];

  return v9;
}

- (id)tableView:(id)a3 cellForPlainString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dequeueReusableCellWithIdentifier:@"textCell"];
  if (!v8)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"textCell"];
    id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v8 setSelectedBackgroundView:v9];
  }
  id v10 = [v8 textLabel];
  [v10 setText:v6];

  double v11 = [(THSearchViewController *)self themePage];
  id v12 = [v11 tableViewCellSelectedColor];
  id v13 = [v8 selectedBackgroundView];
  [v13 setBackgroundColor:v12];

  id v14 = [v8 textLabel];
  [v14 setHighlightedTextColor:0];
  id v15 = [v11 primaryTextColor];
  [v14 setTextColor:v15];

  double v16 = [v7 backgroundColor];

  [v8 setBackgroundColor:v16];

  return v8;
}

- (id)tableView:(id)a3 cellForSearchResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = kBESearchTableViewCellResultsIdentifier;
  id v9 = [v6 dequeueReusableCellWithIdentifier:kBESearchTableViewCellResultsIdentifier];
  if (!v9) {
    id v9 = [objc_alloc((Class)BESearchResultTableViewCell) initWithStyle:3 reuseIdentifier:v8];
  }
  [(THSearchViewController *)self _configureResultsCell:v9 forSearchResult:v7 inTableView:v6];

  return v9;
}

- (void)_configureResultsCell:(id)a3 forSearchResult:(id)a4 inTableView:(id)a5
{
  id v62 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v62 setSelectedBackgroundView:v10];
  double v11 = [v8 title];
  if (v11)
  {
  }
  else if ([v8 rank] != 1)
  {
    [(THSearchController *)self->mSearchController resolveTitleForSearchResult:v8];
  }
  unsigned int v12 = [v8 rank];
  if (v12 - 6 >= 2 && v12 == 1)
  {
    id v61 = v9;
    id v13 = THBundle();
    id v14 = [v13 localizedStringForKey:@"Glossary: %@" value:&stru_46D7E8 table:0];

    id v15 = [v8 term];
    double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
    double v17 = [v62 titleLabel];
    [v17 setText:v16];

    mSearchController = self->mSearchController;
    id v19 = [v8 term];
    double v20 = [(THSearchController *)mSearchController summaryForGlossaryTerm:v19];

    if (!v20)
    {
      double v21 = THBundle();
      double v22 = [v21 localizedStringForKey:@"(Glossary entry for \\U201C%@\\U201D)" value:&stru_46D7E8 table:0];

      double v23 = [v8 term];
      double v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);
    }
    double v24 = [v62 resultLabel];
    [v24 setText:v20];

    double v25 = [(THSearchViewController *)self searchController];
    v26 = [v25 currentQuery];
    v27 = self;
    id v28 = [v20 rangeOfString:v26];
    uint64_t v30 = v29;
    v31 = [v62 resultLabel];
    id v32 = v28;
    self = v27;
    [v31 setBoldRange:v32, v30];

    id v9 = v61;
  }
  else
  {
    v33 = [v8 title];
    id v34 = [v33 length];

    if (v34) {
      [v8 title];
    }
    else {
    id v35 = [v8 term];
    }
    id v36 = [v62 titleLabel];
    [v36 setText:v35];

    v37 = [v8 displayPageNumber];
    v38 = [v62 pageNumberLabel];
    [v38 setText:v37];

    v39 = [v8 context];
    v40 = [v62 resultLabel];
    [v40 setText:v39];

    id v41 = [v8 contextRangeForResult];
    uint64_t v43 = v42;
    id v14 = [v62 resultLabel];
    [v14 setBoldRange:v41, v43];
  }

  uint64_t v44 = [(THSearchViewController *)self themePage];
  v45 = [v44 tableViewCellSelectedColor];
  [v10 setBackgroundColor:v45];

  v46 = [v44 secondaryTextColor];
  v47 = [v62 pageNumberLabel];
  [v47 setTextColor:v46];

  v48 = [v44 primaryTextColor];
  v49 = [v62 titleLabel];
  [v49 setTextColor:v48];

  v50 = [v62 resultLabel];
  [v50 setTextColor:v48];

  [v9 frame];
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;

  v64.origin.x = v52;
  v64.origin.y = v54;
  v64.size.double width = v56;
  v64.size.double height = v58;
  [v62 setMaxWidth:CGRectGetWidth(v64)];
  v59 = [v44 secondaryBackgroundColor];
  v60 = [v62 focusShapeView];
  [v60 setFillColor:v59];

  [v62 applyLabelFonts];
  [v62 updateConstraintsIfNeeded];
}

- (id)tableView:(id)a3 noResultsCellWithKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"noResultsCell"];
  if (!v6)
  {
    id v6 = [[THSearchTableViewNoResultsCell alloc] initWithStyle:3 reuseIdentifier:@"noResultsCell"];
    id v7 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(THSearchTableViewNoResultsCell *)v6 setSelectedBackgroundView:v7];
  }
  id v8 = [(THSearchViewController *)self themePage];
  id v9 = [v8 tableViewCellSelectedColor];
  id v10 = [(THSearchTableViewNoResultsCell *)v6 selectedBackgroundView];
  [v10 setBackgroundColor:v9];

  double v11 = [v8 primaryTextColor];
  unsigned int v12 = [(THSearchTableViewNoResultsCell *)v6 textLabel];
  [v12 setTextColor:v11];

  id v13 = [(THSearchTableViewNoResultsCell *)v6 detailTextLabel];
  [v13 setTextColor:v11];

  [(THSearchTableViewNoResultsCell *)v6 setSearchKind:v4];

  return v6;
}

- (id)tableView:(id)a3 seeAllResultsCellWithKind:(int)a4 count:(unint64_t)a5
{
  id v8 = [a3 dequeueReusableCellWithIdentifier:@"seeAllResultsCell"];
  if (!v8)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"seeAllResultsCell"];
    id v9 = [(THSearchViewController *)self searchWeb];
    id v10 = [v9 titleLabel];

    double v11 = [v10 font];
    unsigned int v12 = [v8 textLabel];
    [v12 setFont:v11];

    id v13 = [v8 textLabel];
    [v13 setTextAlignment:0];

    id v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v8 setSelectedBackgroundView:v14];
  }
  id v15 = [(THSearchViewController *)self themePage];
  double v16 = [v15 tableViewCellSelectedColor];
  double v17 = [v8 selectedBackgroundView];
  [v17 setBackgroundColor:v16];

  id v18 = [v15 primaryTextColor];
  id v19 = [v8 textLabel];
  [v19 setTextColor:v18];

  double v20 = THBundle();
  double v21 = v20;
  if (a4) {
    CFStringRef v22 = @"See all %lu media results…";
  }
  else {
    CFStringRef v22 = @"See all %lu text results…";
  }
  double v23 = [v20 localizedStringForKey:v22 value:&stru_46D7E8 table:0];

  double v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, a5);
  double v25 = [v8 textLabel];
  [v25 setText:v24];

  return v8;
}

- (double)_resultsEstimatedRowHeight
{
  if (+[UIFont bc_accessibilityFontSizesEnabled])
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargestHeightPhone;
    }
    else if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge])
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargerHeightPhone;
    }
    else
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargeHeightPhone;
    }
  }
  else
  {
    v2 = (double *)&kBESearchSectionSearchResultCellHeightPhone;
  }
  return *v2;
}

- (double)_resultsHeaderHeight
{
  if (!+[UIFont bc_accessibilityFontSizesEnabled])
  {
    v2 = (double *)&kBESearchTableViewHeaderHeight;
    return *v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
  {
    v2 = (double *)&kBESearchTableViewAccessibilityHeaderLargestHeight;
    return *v2;
  }
  double v4 = kBESearchTableViewAccessibilityHeaderLargeHeight;
  unsigned int v5 = +[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge];
  double result = kBESearchTableViewAccessibilityHeaderLargerHeight;
  if (!v5) {
    return v4;
  }
  return result;
}

- (id)p_dataSourceForTableView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(THSearchViewController *)self resultsViewController];
  id v6 = [v5 view];

  if (v6 == v4)
  {
    uint64_t v10 = [(THSearchViewController *)self resultsDataSource];
  }
  else
  {
    id v7 = [(THSearchViewController *)self detailsViewController];
    id v8 = [v7 view];

    if (v8 != v4)
    {
      id v9 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [(THSearchViewController *)self detailsDataSource];
  }
  id v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(THSearchViewController *)self p_dataSourceForTableView:v6];
  id v8 = [v7 tableView:v6 numberOfRowsInSection:a4];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(THSearchViewController *)self p_dataSourceForTableView:v7];
  id v9 = [v8 tableView:v7 cellForRowAtIndexPath:v6 searchViewController:self];

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(THSearchViewController *)self p_dataSourceForTableView:v4];
  id v6 = [v5 numberOfSectionsInTableView:v4];

  return (int64_t)v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(THSearchViewController *)self p_dataSourceForTableView:a3];
  if ([v7 searchViewMode] == 2
    && [v7 indexPathCorrespondsToSearchResultRow:v6])
  {
    unsigned int v8 = [v7 indexPathCorrespondsToSeeAllResultsRow:v6] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(THSearchViewController *)self p_dataSourceForTableView:v13];
  if ([v10 searchViewMode] == 2
    && [v10 indexPathCorrespondsToSearchResultRow:v9])
  {
    objc_opt_class();
    double v11 = TSUDynamicCast();
    if (v11)
    {
      unsigned int v12 = [v10 searchResultForTableIndexPath:v9];
      [(THSearchViewController *)self _configureResultsCell:v11 forSearchResult:v12 inTableView:v13];
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(THSearchViewController *)self p_dataSourceForTableView:v6];
  id v8 = [v7 titleForHeaderInSection:a4];
  id v9 = [(THSearchViewController *)self tableView:v6 viewForHeaderWithTitle:v8];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (BESearchResultTableViewCell)dummySearchResultsCell
{
  mDummySearchResultsCell = self->mDummySearchResultsCell;
  if (!mDummySearchResultsCell)
  {
    id v4 = (BESearchResultTableViewCell *)[objc_alloc((Class)BESearchResultTableViewCell) initWithStyle:3 reuseIdentifier:0];
    unsigned int v5 = self->mDummySearchResultsCell;
    self->mDummySearchResultsCell = v4;

    mDummySearchResultsCell = self->mDummySearchResultsCell;
  }

  return mDummySearchResultsCell;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ([(THSearchViewController *)self searchViewMode] == 2)
  {
    id v9 = [(THSearchViewController *)self p_dataSourceForTableView:v6];
    id v10 = [v9 numberOfResultsInSection:[v7 section]];

    id v8 = v7;
    if (!v10)
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  [v6 deselectRowAtIndexPath:v16 animated:0];
  id v7 = [(THSearchViewController *)self p_dataSourceForTableView:v6];

  unsigned int v8 = [v7 searchViewMode];
  if (v8 == 2)
  {
    id v10 = [v7 numberOfResultsInSection:[v16 section]];
    if (!v10) {
      goto LABEL_13;
    }
    if ([v16 row] == v10)
    {
      [self showAllResultsWithKind:[v7 p_resultKindForSection:[v16 section]]];
      goto LABEL_13;
    }
    id v9 = [v7 searchResultForTableIndexPath:v16];
    [(THSearchViewController *)self navigateToSearchResult:v9];
  }
  else
  {
    if (v8 == 1)
    {
      double v11 = [v7 suggestions];
      id v9 = [v11 objectAtIndex:[v16 row]];

      unsigned int v12 = [(THSearchViewController *)self searchController];
      unsigned int v13 = [v12 isEncodedResultForPageNumber:v9];

      if (v13)
      {
        id v14 = [(THSearchViewController *)self searchController];
        id v15 = [v14 absolutePageIndexFromEncodedPageNumberResult:v9];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL) {
          [(THSearchViewController *)self navigateToAbsolutePageIndex:v15];
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (v8) {
        goto LABEL_13;
      }
      id v9 = -[THSearchController recentSearchQueryAtIndex:](self->mSearchController, "recentSearchQueryAtIndex:", [v16 row]);
    }
    [(THSearchViewController *)self searchForString:v9];
  }
LABEL_12:

LABEL_13:
}

- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3
{
  id v9 = [(THSearchViewController *)self ba_effectiveAnalyticsTracker];
  id v4 = [(THSearchViewController *)self delegate];
  unsigned int v5 = [v4 readingSessionDataForSearchViewController:self];

  id v6 = [(THSearchViewController *)self delegate];
  id v7 = [v6 contentDataForSearchViewController:self];

  if (v9 && v5 && v7)
  {
    unsigned int v8 = +[BAEventReporter sharedReporter];
    [v8 emitInBookSearchEventWithTracker:v9 readingSessionData:v5 contentData:v7];
  }
}

- (THSearchViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return (THSearchViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (THSearchController)searchController
{
  return self->mSearchController;
}

- (NSString)pendingSearchText
{
  return self->mPendingSearchText;
}

- (void)setPendingSearchText:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->mSpinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIView)progressView
{
  return self->mProgressView;
}

- (void)setProgressView:(id)a3
{
}

- (IMTheme)theme
{
  return self->mTheme;
}

- (void)setDummySearchResultsCell:(id)a3
{
}

- (NSDictionary)pendingDeferredViewWillAppear
{
  return self->mPendingDeferredViewWillAppear;
}

- (void)setPendingDeferredViewWillAppear:(id)a3
{
}

- (BOOL)searchingForPredeterminedString
{
  return self->mSearchingForPredeterminedString;
}

- (void)setSearchingForPredeterminedString:(BOOL)a3
{
  self->mSearchingForPredeterminedString = a3;
}

- (int)searchViewMode
{
  return self->_searchViewMode;
}

- (void)setSearchViewMode:(int)a3
{
  self->_searchViewMode = a3;
}

- (UIButton)searchWeb
{
  return self->_searchWeb;
}

- (void)setSearchWeb:(id)a3
{
}

- (UIButton)searchEncyclopedia
{
  return self->_searchEncyclopedia;
}

- (void)setSearchEncyclopedia:(id)a3
{
}

- (UITableViewController)resultsViewController
{
  return self->_resultsViewController;
}

- (void)setResultsViewController:(id)a3
{
}

- (UITableViewController)detailsViewController
{
  return self->_detailsViewController;
}

- (void)setDetailsViewController:(id)a3
{
}

- (THSearchTableViewDataSource)resultsDataSource
{
  return self->_resultsDataSource;
}

- (void)setResultsDataSource:(id)a3
{
}

- (THSearchTableViewDataSource)detailsDataSource
{
  return self->_detailsDataSource;
}

- (void)setDetailsDataSource:(id)a3
{
}

- (THSearchTableViewDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
}

- (UIBarButtonItem)zeroWidthBarButton
{
  return self->_zeroWidthBarButton;
}

- (void)setZeroWidthBarButton:(id)a3
{
}

- (UIView)searchView
{
  return self->_searchView;
}

- (void)setSearchView:(id)a3
{
}

- (double)maxContentHeight
{
  return self->_maxContentHeight;
}

- (void)setMaxContentHeight:(double)a3
{
  self->_maxContentHeight = a3;
}

- (BOOL)settingSearchForString
{
  return self->_settingSearchForString;
}

- (void)setSettingSearchForString:(BOOL)a3
{
  self->_settingSearchForString = a3;
}

- (NSLayoutConstraint)footerViewHeightConstraint
{
  return self->_footerViewHeightConstraint;
}

- (void)setFooterViewHeightConstraint:(id)a3
{
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
}

- (BEHairlineDividerView)footerTopBorderView
{
  return self->_footerTopBorderView;
}

- (void)setFooterTopBorderView:(id)a3
{
}

- (double)searchBarHeight
{
  return self->_searchBarHeight;
}

- (void)setSearchBarHeight:(double)a3
{
  self->_double searchBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTopBorderView, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_storeStrong((id *)&self->_footerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_zeroWidthBarButton, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_detailsDataSource, 0);
  objc_storeStrong((id *)&self->_resultsDataSource, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_searchEncyclopedia, 0);
  objc_storeStrong((id *)&self->_searchWeb, 0);
  objc_storeStrong((id *)&self->mPendingDeferredViewWillAppear, 0);
  objc_storeStrong((id *)&self->mDummySearchResultsCell, 0);
  objc_storeStrong((id *)&self->mProgressView, 0);
  objc_storeStrong((id *)&self->mSpinner, 0);
  objc_storeStrong((id *)&self->mPendingSearchText, 0);
  objc_storeStrong((id *)&self->mSearchController, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mNoIndexViewController, 0);
  objc_storeStrong((id *)&self->mNoIndexActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->mNoIndexViewLabel, 0);
  objc_storeStrong((id *)&self->mNoIndexView, 0);
  objc_storeStrong((id *)&self->mTheme, 0);

  objc_storeStrong((id *)&self->mSearchBar, 0);
}

@end