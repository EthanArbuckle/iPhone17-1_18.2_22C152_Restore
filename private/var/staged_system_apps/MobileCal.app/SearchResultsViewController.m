@interface SearchResultsViewController
- (BOOL)_useLargeFormatBehavior;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3;
- (BOOL)prefersShowingViewControllersOnNavigationStack;
- (BOOL)shouldLeaveSearchString;
- (BOOL)shouldPreserveDateAcrossRefresh;
- (BOOL)shouldUpdateModelSelectedDate;
- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4;
- (SearchResultsViewController)initWithModel:(id)a3 window:(id)a4;
- (SearchResultsViewControllerDelegate)searchResultsDelegate;
- (UISearchBar)searchBar;
- (double)_maxHeightOfTableView;
- (id)_sizingContextWindow;
- (id)backButtonTitleForEventDetails;
- (id)contentUnavailableConfigurationForState:(id)a3;
- (int64_t)editorPresentationStyle;
- (int64_t)positionForBar:(id)a3;
- (void)_eventStoreChanged:(id)a3;
- (void)_refreshView;
- (void)_searchResultsUpdated:(id)a3;
- (void)_setContentInsets;
- (void)_updateFilterState;
- (void)_updatePreferredContentSize;
- (void)_updateTableAlpha:(BOOL)a3;
- (void)beginSearch:(id)a3;
- (void)cancelTimer;
- (void)dealloc;
- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5;
- (void)scrollToDate:(id)a3 animated:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchResultsDelegate:(id)a3;
- (void)setShouldLeaveSearchString:(BOOL)a3;
- (void)showEvent:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchResultsViewController

- (SearchResultsViewController)initWithModel:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SearchResultsViewController;
  v8 = [(ListViewController *)&v19 initWithModel:v6 window:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(MainViewController *)v8 model];
    v11 = [v10 searchString];

    if (v11)
    {
      v12 = [(MainViewController *)v9 model];
      [v12 setSearchString:0];
    }
    [(ListViewController *)v9 setOverrideExtendedEdges:0];
    [(ListViewController *)v9 setDestination:1];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v13 = +[NSArray arrayWithObjects:v20 count:2];
    objc_initWeak(&location, v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011CE64;
    v16[3] = &unk_1001D2620;
    objc_copyWeak(&v17, &location);
    id v14 = [(SearchResultsViewController *)v9 registerForTraitChanges:v13 withHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)dealloc
{
  [(SearchResultsViewController *)self cancelTimer];
  if (![(SearchResultsViewController *)self shouldLeaveSearchString])
  {
    v3 = [(MainViewController *)self model];
    [v3 setSearchString:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SearchResultsViewController;
  [(ListViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  [(SearchResultsViewController *)self _updatePreferredContentSize];
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewController;
  [(SearchResultsViewController *)&v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = [(SearchResultsViewController *)self presentingViewController];
  v5 = [v4 view];
  id v6 = [v5 window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  [(SearchResultsViewController *)self _updateFilterState];
  [(SearchResultsViewController *)self _updatePreferredContentSize];
  id v7 = [(SearchResultsViewController *)self presentingViewController];
  v8 = [v7 view];
  v9 = [v8 window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  [(SearchResultsViewController *)self _updateTableAlpha:0];
  id v12 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = CUIKCalendarModelSearchResultsAvailableNotification;
  v11 = [(MainViewController *)self model];
  [v12 addObserver:self selector:"_searchResultsUpdated:" name:v10 object:v11];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SearchResultsViewController;
  [(ListViewController *)&v11 viewWillAppear:0];
  v10.receiver = self;
  v10.super_class = (Class)SearchResultsViewController;
  [(ListViewController *)&v10 viewDidAppear:0];
  objc_super v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = [(MainViewController *)self model];
    v9 = [v8 searchString];
    *(_DWORD *)buf = 138543619;
    v13 = v7;
    __int16 v14 = 2113;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. searchString = %{private}@", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewController;
  [(ListViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewWillLayoutSubviews
{
  objc_super v3 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  [(SearchResultsViewController *)self _setContentInsets];
  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewController;
  [(SearchResultsViewController *)&v5 viewWillLayoutSubviews];
  objc_super v4 = [(MainViewController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (void)_setContentInsets
{
  objc_super v3 = [(ListViewController *)self tableView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if ((id)[(ListViewController *)self destination] != (id)2)
  {
    id v12 = [(SearchResultsViewController *)self searchBar];
    [v12 bounds];
    double MaxY = CGRectGetMaxY(v21);

    __int16 v14 = [(ListViewController *)self tableView];
    v15 = [(SearchResultsViewController *)self searchBar];
    [v14 convertPoint:v15 fromView:0.0, MaxY];

    v16 = [(ListViewController *)self tableView];
    [v16 contentOffset];

    id v17 = [(ListViewController *)self tableView];
    [v17 safeAreaInsets];
    CalRoundToScreenScale();
    double v5 = v18;
  }
  id v19 = [(ListViewController *)self tableView];
  [v19 setContentInset:v5, v7, v9, v11];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewController;
  [(SearchResultsViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(SearchResultsViewController *)self _setContentInsets];
}

- (BOOL)_useLargeFormatBehavior
{
  v2 = [(SearchResultsViewController *)self _sizingContextWindow];
  char ShouldUseLargeFormatInterface = EKUICurrentWindowInterfaceParadigm_ShouldUseLargeFormatInterface();

  return ShouldUseLargeFormatInterface;
}

- (void)_updatePreferredContentSize
{
  if (![(SearchResultsViewController *)self _useLargeFormatBehavior]) {
    return;
  }
  objc_super v3 = [(SearchResultsViewController *)self searchBar];
  double v4 = [v3 text];
  if ([v4 length])
  {

    goto LABEL_5;
  }
  double v5 = [(ListViewController *)self tableView];
  int64_t v6 = [(ListViewController *)self numberOfSectionsInTableView:v5];

  if (v6)
  {
LABEL_5:
    [(SearchResultsViewController *)self _maxHeightOfTableView];
    double v8 = fmax(v7, 371.0);
    [(SearchResultsViewController *)self preferredContentSize];
    if (vabdd_f64(v9, v8) >= 2.22044605e-16)
    {
      id v12 = [(ListViewController *)self tableView];
      [v12 frame];
      -[SearchResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v8);
    }
    return;
  }
  double height = CGSizeZero.height;

  -[SearchResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGSizeZero.width, height);
}

- (double)_maxHeightOfTableView
{
  objc_super v3 = [(SearchResultsViewController *)self view];
  double v4 = [v3 window];
  if (v4)
  {
    double v5 = [(SearchResultsViewController *)self view];
    int64_t v6 = [v5 window];
    [v6 bounds];
    double Height = CGRectGetHeight(v17);
  }
  else
  {
    double Height = 4000.0;
  }

  double v8 = [(ListViewController *)self tableView];
  uint64_t v9 = (uint64_t)[v8 numberOfSections];

  if (v9 < 1)
  {
    double v11 = 0.0;
LABEL_10:
    __int16 v14 = [(ListViewController *)self tableView];
    [v14 estimatedRowHeight];
    double Height = v11 + v15;
  }
  else
  {
    uint64_t v10 = 0;
    double v11 = 0.0;
    while (1)
    {
      id v12 = [(ListViewController *)self tableView];
      [v12 rectForSection:v10];
      double v11 = v11 + v13;

      if (v11 >= Height) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_10;
      }
    }
  }
  return Height;
}

- (void)_updateTableAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011D828;
  v7[3] = &unk_1001D4280;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  double v5 = objc_retainBlock(v7);
  int64_t v6 = v5;
  if (v3) {
    +[UIView animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.0 animations:1.0 completion:0.0];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v4 = a3;
  double v5 = +[UIContentUnavailableConfiguration searchConfiguration];
  int64_t v6 = [v5 updatedConfigurationForState:v4];

  double v7 = [(MainViewController *)self model];
  id v8 = [v7 searchString];
  id v9 = [v8 length];

  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  double v11 = v10;
  if (v9) {
    CFStringRef v12 = @"No Results";
  }
  else {
    CFStringRef v12 = @"No Events";
  }
  double v13 = [v10 localizedStringForKey:v12 value:&stru_1001D6918 table:0];

  [v6 setText:v13];

  return v6;
}

- (void)_updateFilterState
{
  id v6 = [(SearchResultsViewController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {
    [(ListViewController *)self setShowFilteredData:1];
  }
  else
  {
    BOOL v3 = [(SearchResultsViewController *)self view];
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
    {
      id v4 = [(SearchResultsViewController *)self searchBar];
      double v5 = [v4 text];
      -[ListViewController setShowFilteredData:](self, "setShowFilteredData:", [v5 length] != 0);
    }
    else
    {
      [(ListViewController *)self setShowFilteredData:0];
    }
  }
}

- (BOOL)shouldPreserveDateAcrossRefresh
{
  return 1;
}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    double v7 = [(ListViewController *)self tableView];

    if (v7)
    {
      v8.receiver = self;
      v8.super_class = (Class)SearchResultsViewController;
      [(ListViewController *)&v8 scrollToDate:v6 animated:v4];
    }
  }
}

- (id)backButtonTitleForEventDetails
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"String displayed for the back button of the details of an event occurrence when in search mode" value:@"Search" table:0];

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  double v5 = [(MainViewController *)self model];
  id v6 = [v5 cachedOccurrenceAtIndexPath:v7 usingFilter:[self showFilteredData]];

  [(SearchResultsViewController *)self showEvent:v6];
  if ((id)[(ListViewController *)self destination] == (id)2) {
    [(ListViewController *)self setCurrentSelectedEvent:v6];
  }
  [(ListViewController *)self updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:v7];
}

- (void)showEvent:(id)a3
{
  id v4 = a3;
  if ((id)[(ListViewController *)self destination] == (id)2)
  {
    double v5 = [(SearchResultsViewController *)self searchResultsDelegate];

    if (v5)
    {
      id v6 = [(SearchResultsViewController *)self searchResultsDelegate];
      [v6 searchResultsViewController:self didSelectEvent:v4];
    }
  }
  else
  {
    id v7 = [(SearchResultsViewController *)self traitCollection];
    if ([v7 horizontalSizeClass] == (id)1)
    {
    }
    else
    {
      objc_super v8 = [(SearchResultsViewController *)self traitCollection];
      id v9 = [v8 verticalSizeClass];

      if (v9 != (id)1)
      {
        double v15 = [(MainViewController *)self model];
        [v15 setSelectedOccurrence:v4];

        v16 = [(SearchResultsViewController *)self presentingViewController];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10011DF18;
        v17[3] = &unk_1001D28A8;
        v17[4] = self;
        id v18 = v4;
        [v16 dismissViewControllerAnimated:1 completion:v17];

        goto LABEL_12;
      }
    }
    uint64_t v10 = [(SearchResultsViewController *)self presentedViewController];

    if (!v10)
    {
      [(ListViewController *)self setPreventScrollingForNextViewAppear:1];
      [(ListViewController *)self showEvent:v4 animated:1 showMode:1 context:0];
    }
    double v11 = [(SearchResultsViewController *)self searchBar];
    [v11 resignFirstResponder];

    CFStringRef v12 = [(SearchResultsViewController *)self traitCollection];
    id v13 = [v12 horizontalSizeClass];

    if (v13 == (id)1)
    {
      __int16 v14 = [(SearchResultsViewController *)self navigationController];
      [v14 hideSearchBarForNavigationTransitionAnimated:1];
    }
  }
LABEL_12:
}

- (BOOL)prefersShowingViewControllersOnNavigationStack
{
  BOOL v3 = [(SearchResultsViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] == (id)1)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(SearchResultsViewController *)self traitCollection];
    BOOL v4 = [v5 verticalSizeClass] == (id)1;
  }
  return v4;
}

- (BOOL)shouldUpdateModelSelectedDate
{
  return 0;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [v6 previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [v6 previewViewController];
  }
  else
  {
    objc_super v8 = 0;
  }

  id v9 = [v8 event];
  [v8 willCommitPreview];
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10011E114;
    v10[3] = &unk_1001D28A8;
    v10[4] = self;
    id v11 = v9;
    [v6 addAnimations:v10];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v6 = [a3 searchBar];
  BOOL v4 = [(SearchResultsViewController *)self searchBar];
  double v5 = [v4 text];
  [(SearchResultsViewController *)self searchBar:v6 textDidChange:v5];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  BOOL v4 = [(SearchResultsViewController *)self navigationController];
  [v4 setViewControllers:&__NSArray0__struct];

  id v6 = [(SearchResultsViewController *)self navigationController];
  double v5 = [v6 presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(SearchResultsViewController *)self searchBar];
  [v3 resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  [(SearchResultsViewController *)self cancelTimer];
  if ([v5 length])
  {
    CFStringRef v11 = @"text";
    id v12 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"beginSearch:" selector:v6 userInfo:0 repeats:0.35];
    timer = self->_timer;
    self->_timer = v7;
  }
  else
  {
    id v9 = [(MainViewController *)self model];
    [v9 setSearchString:0];

    [(SearchResultsViewController *)self _updateFilterState];
    [(SearchResultsViewController *)self _refreshView];
    uint64_t v10 = CUIKTodayDate();
    [(SearchResultsViewController *)self scrollToDate:v10 animated:0];
  }
}

- (void)beginSearch:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"text"];

  [(SearchResultsViewController *)self cancelTimer];
  id v5 = [(MainViewController *)self model];
  [v5 setSearchString:v6];
}

- (void)cancelTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (id)_sizingContextWindow
{
  id v3 = [(SearchResultsViewController *)self view];
  BOOL v4 = [v3 window];

  if (!v4)
  {
    id v5 = [(SearchResultsViewController *)self navigationController];
    id v6 = [v5 view];
    BOOL v4 = [v6 window];

    if (!v4)
    {
      id v7 = [(SearchResultsViewController *)self presentingViewController];
      objc_super v8 = [v7 view];
      BOOL v4 = [v8 window];
    }
  }

  return v4;
}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  EKUIWidthForWindowSizeParadigm();
  double v11 = v10;
  id v12 = [(SearchResultsViewController *)self _sizingContextWindow];
  if (v12)
  {
    if (!EKUICurrentWidthSizeClassIsCompactInViewHierarchy()
      || (EKUICurrentHeightSizeClassIsRegular() & 1) == 0)
    {
      [v9 bounds];
      double x = CGRectGetWidth(v24) * 0.5 - v11 * 0.5;
      CGFloat width = v11;
    }
  }
  else
  {
    id v13 = [v9 searchField];
    [v13 frame];
    BOOL IsNull = CGRectIsNull(v25);

    if (!IsNull)
    {
      double v15 = [v9 searchField];
      [v15 frame];
      double x = v16;
      CGFloat y = v17;
      CGFloat width = v18;
      CGFloat height = v19;
    }
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 0;
}

- (int64_t)editorPresentationStyle
{
  return 3;
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  objc_super v8 = [(SearchResultsViewController *)self navigationController];
  id v9 = [v8 parentViewController];

  [v9 presentViewController:v7 animated:v5 completion:0];
}

- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4
{
  BOOL v4 = [(SearchResultsViewController *)self navigationController];
  id v5 = [v4 parentViewController];

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)_eventStoreChanged:(id)a3
{
  BOOL v4 = [(SearchResultsViewController *)self searchBar];
  uint64_t v5 = [v4 text];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(SearchResultsViewController *)self searchBar];
    objc_super v8 = [v7 text];
    unsigned int v9 = [v8 isEqualToString:&stru_1001D6918];

    if (!v9) {
      return;
    }
  }
  else
  {
  }
  id v12 = [(SearchResultsViewController *)self searchBar];
  double v10 = [(SearchResultsViewController *)self searchBar];
  double v11 = [v10 text];
  [(SearchResultsViewController *)self searchBar:v12 textDidChange:v11];
}

- (void)_searchResultsUpdated:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(SearchResultsViewController *)self navigationController];

  if (v4)
  {
    [(SearchResultsViewController *)self _updateFilterState];
    [(SearchResultsViewController *)self _refreshView];
    uint64_t v5 = [v8 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"scrollToToday"];

    if ([v6 BOOLValue])
    {
      id v7 = CUIKTodayDate();
      [(SearchResultsViewController *)self scrollToDate:v7 animated:0];
    }
    [(SearchResultsViewController *)self _updatePreferredContentSize];
  }
}

- (void)_refreshView
{
  id v3 = [(ListViewController *)self tableView];
  BOOL v4 = [(MainViewController *)self model];
  uint64_t v5 = [v4 searchString];
  [v3 setShowsVerticalScrollIndicator:v5 != 0];

  [(ListViewController *)self refresh];
  [(SearchResultsViewController *)self _updateTableAlpha:1];

  [(SearchResultsViewController *)self _updatePreferredContentSize];
}

- (SearchResultsViewControllerDelegate)searchResultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchResultsDelegate);

  return (SearchResultsViewControllerDelegate *)WeakRetained;
}

- (void)setSearchResultsDelegate:(id)a3
{
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (void)setSearchBar:(id)a3
{
}

- (BOOL)shouldLeaveSearchString
{
  return self->_shouldLeaveSearchString;
}

- (void)setShouldLeaveSearchString:(BOOL)a3
{
  self->_shouldLeaveSearchString = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchResultsDelegate);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end