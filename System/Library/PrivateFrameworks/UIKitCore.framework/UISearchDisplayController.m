@interface UISearchDisplayController
+ (void)_uiibSetRequiresSearchDisplayControllerSupport;
- (BOOL)_allowDisablingNavigationBarHiding;
- (BOOL)_areSearchContentsSplitViewMaster;
- (BOOL)_containedInPopover;
- (BOOL)_isCancelButtonManagementDisabled;
- (BOOL)_isSearchBarInBar;
- (BOOL)_searchBarInNavigationControllerComponent;
- (BOOL)_searchBarShouldScrollToVisible:(id)a3;
- (BOOL)_shouldAccountForStatusBarHeight;
- (BOOL)_showsResultsForEmptyField;
- (BOOL)automaticallyShowsNoResultsMessage;
- (BOOL)dimTableViewOnEmptySearchString;
- (BOOL)displaysSearchBarInNavigationBar;
- (BOOL)hidNavigationBar;
- (BOOL)isActive;
- (BOOL)isNavigationBarHidingEnabled;
- (BOOL)noResultsMessageVisible;
- (BOOL)popoverControllerShouldDismissPopover:(id)a3;
- (NSString)noResultsMessage;
- (NSString)searchResultsTitle;
- (UIEdgeInsets)_tableViewContentInsets;
- (UINavigationItem)navigationItem;
- (UISearchBar)searchBar;
- (UISearchDisplayController)init;
- (UISearchDisplayController)initWithCoder:(id)a3;
- (UISearchDisplayController)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;
- (UISearchDisplayController)initWithSearchBar:(id)a3 contentsController:(id)a4 searchResultsTableViewStyle:(int64_t)a5;
- (UITableView)searchResultsTableView;
- (UIViewController)searchContentsController;
- (double)_activationGapHeight;
- (double)_additionalNonCollapsingHeightAboveSearchBar;
- (double)_dimmingViewAlpha;
- (double)_statusBarHeight;
- (double)_updateNavigationPalette;
- (id)_containerView;
- (id)_containingTableView;
- (id)_containingViewOfClass:(Class)a3;
- (id)_createPopoverController;
- (id)_dimmingOverlayColor;
- (id)_dimmingViewColor;
- (id)_noResultsMessageLabel;
- (id)_topShadowView;
- (id)delegate;
- (id)searchResultsDataSource;
- (id)searchResultsDelegate;
- (unint64_t)navigationBarSearchFieldSizing;
- (void)_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:(BOOL)a3;
- (void)_animateNavigationBarSearchBarAppearance:(id)a3;
- (void)_cleanUpSearchBar;
- (void)_clearSavedSelectedCellsWeUsedWhenHedgingOurBets;
- (void)_clearViewController;
- (void)_configureContainerView;
- (void)_configureNewSearchBar;
- (void)_configureSearchBarForTableView;
- (void)_destroyManagedTableView;
- (void)_disableParentScrollViews;
- (void)_enableParentScrollViews;
- (void)_hideVisibleRefreshControl;
- (void)_hoistSearchBar;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_managedTableViewDidScroll;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_popoverClearButtonPressed:(id)a3;
- (void)_popoverKeyboardDidHide:(id)a3;
- (void)_popoverKeyboardDidShow:(id)a3;
- (void)_restoreSelectedCellsInCaseViewDidNotReallyAppear;
- (void)_saveSelectedRowsInCaseViewDoesNotReallyAppear;
- (void)_searchBarSuperviewChanged;
- (void)_searchBarSuperviewWillChange;
- (void)_sendDelegateDidBeginDidEndSearch;
- (void)_setAllowDisablingNavigationBarHiding:(BOOL)a3;
- (void)_setCancelButtonManagementDisabled:(BOOL)a3;
- (void)_setDimmingOverlayColor:(id)a3;
- (void)_setShowsResultsForEmptyField:(BOOL)a3;
- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4;
- (void)_setupNoResultsLabelIfNecessary;
- (void)_updateNoSearchResultsMessageVisiblity;
- (void)_updatePinnedSearchBar;
- (void)_updateSearchBarMaskIfNecessary;
- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4;
- (void)_watchContainingTableViewForScrolling:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)navigationControllerDidCancelShowingViewController:(id)a3;
- (void)navigationControllerDidShowViewController:(id)a3;
- (void)navigationControllerWillShowViewController:(id)a3;
- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarResultsListButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setActive:(BOOL)active;
- (void)setActive:(BOOL)visible animated:(BOOL)animated;
- (void)setAutomaticallyShowsNoResultsMessage:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDimTableViewOnEmptySearchString:(BOOL)a3;
- (void)setDisplaysSearchBarInNavigationBar:(BOOL)displaysSearchBarInNavigationBar;
- (void)setNavigationBarHidingEnabled:(BOOL)a3;
- (void)setNavigationBarSearchFieldSizing:(unint64_t)a3;
- (void)setNoResultsMessage:(id)a3;
- (void)setNoResultsMessageVisible:(BOOL)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchContentsController:(id)a3;
- (void)setSearchResultsDataSource:(id)searchResultsDataSource;
- (void)setSearchResultsDelegate:(id)searchResultsDelegate;
- (void)setSearchResultsTitle:(NSString *)searchResultsTitle;
- (void)set_activationGapHeight:(double)a3;
- (void)set_additionalNonCollapsingHeightAboveSearchBar:(double)a3;
- (void)showHideAnimationDidFinish;
- (void)windowDidRotate:(id)a3;
- (void)windowWillAnimateRotation:(id)a3;
@end

@implementation UISearchDisplayController

- (UISearchDisplayController)init
{
  return [(UISearchDisplayController *)self initWithSearchBar:0 contentsController:0];
}

- (UISearchDisplayController)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController
{
  return [(UISearchDisplayController *)self initWithSearchBar:searchBar contentsController:viewController searchResultsTableViewStyle:0];
}

+ (void)_uiibSetRequiresSearchDisplayControllerSupport
{
  __UISearchDisplayControllerSupportRequired = 1;
}

- (UISearchDisplayController)initWithSearchBar:(id)a3 contentsController:(id)a4 searchResultsTableViewStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UISearchDisplayController;
  v11 = [(UISearchDisplayController *)&v13 init];
  if (v11)
  {
    if ((__UISearchDisplayControllerSupportRequired & 1) == 0) {
      UISearchDisplayControllerNoLongerSupported();
    }
    objc_storeWeak((id *)&v11->_viewController, v10);
    objc_storeStrong((id *)&v11->_searchBar, a3);
    if (v11->_searchBar) {
      [(UISearchDisplayController *)v11 _configureNewSearchBar];
    }
    [v10 _setSearchDisplayControllerUnretained:v11];
    UISearchDisplayControllerCommonInit(v11);
    v11->_searchResultsTableViewStyle = a5;
  }

  return v11;
}

- (UISearchDisplayController)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchDisplayController;
  v5 = [(UISearchDisplayController *)&v9 init];
  if (v5)
  {
    if ((unint64_t)_UIApplicationPackedMinimumDeploymentVersion() >= 0xD0000) {
      UISearchDisplayControllerNoLongerSupported();
    }
    UISearchDisplayControllerCommonInit(v5);
    v5->_searchResultsTableViewStyle = 0;
    uint64_t v6 = [v4 decodeObjectForKey:@"UIResultsTitle"];
    resultsTitle = v5->_resultsTitle;
    v5->_resultsTitle = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  resultsTitle = self->_resultsTitle;
  if (resultsTitle) {
    [a3 encodeObject:resultsTitle forKey:@"UIResultsTitle"];
  }
}

- (void)dealloc
{
  v11[9] = *MEMORY[0x1E4F143B8];
  [(UISearchBar *)self->_searchBar setController:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained _clearRecordedContentScrollView];
  [WeakRetained _setSearchDisplayControllerUnretained:0];
  [(UISearchDisplayController *)self _destroyManagedTableView];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11[0] = @"UIWindowWillAnimateRotationNotification";
  v11[1] = @"UIWindowDidRotateNotification";
  v11[2] = 0x1ED10DD40;
  v11[3] = 0x1ED10DD60;
  v11[4] = 0x1ED10DD80;
  v11[5] = @"UIKeyboardDidShowNotification";
  v11[6] = @"UIKeyboardDidHideNotification";
  v11[7] = @"UIKeyboardPrivateWillShowNotification";
  v11[8] = @"UIKeyboardPrivateWillHideNotification";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  didScrollDelegate = self->_didScrollDelegate;
  if (didScrollDelegate)
  {
    v7 = [(_UISearchControllerDidScrollDelegate *)didScrollDelegate scrollView];
    [v7 _removeScrollViewScrollObserver:self->_didScrollDelegate];
  }
  containingScrollViews = self->_containingScrollViews;
  if (containingScrollViews) {
    CFRelease(containingScrollViews);
  }
  tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
  self->_tableViewBackgroundHeaderView = 0;

  v10.receiver = self;
  v10.super_class = (Class)UISearchDisplayController;
  [(UISearchDisplayController *)&v10 dealloc];
}

- (void)_configureSearchBarForTableView
{
  v3 = [(UISearchDisplayController *)self _containingTableView];
  if (v3)
  {
    id v11 = v3;
    id v4 = [v3 tableHeaderView];
    searchBar = self->_searchBar;

    if (v4 == searchBar)
    {
      [(UISearchBar *)self->_searchBar _setShowsSeparator:0];
      tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
      if (!tableViewBackgroundHeaderView
        || ([v11 _tableHeaderBackgroundView],
            v7 = (UIView *)objc_claimAutoreleasedReturnValue(),
            v7,
            tableViewBackgroundHeaderView != v7))
      {
        if (([v11 _usingCustomBackgroundView] & 1) == 0)
        {
          v8 = +[UIColor colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
          [v11 setTableHeaderBackgroundColor:v8];
        }
        [(UISearchDisplayController *)self _updateTableHeaderBackgroundViewInTableView:v11 amountScrolledUnder:0.0];
        objc_super v9 = [v11 _tableHeaderBackgroundView];
        objc_super v10 = self->_tableViewBackgroundHeaderView;
        self->_tableViewBackgroundHeaderView = v9;
      }
    }
    [(UISearchBar *)self->_searchBar _updateInsetsForTableView:v11];
    [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:1];
    v3 = v11;
  }
}

- (void)_cleanUpSearchBar
{
  v3 = [(UISearchDisplayController *)self _containingTableView];
  if (v3)
  {
    id v5 = v3;
    if (([v3 _usingCustomBackgroundView] & 1) == 0) {
      [v5 setTableHeaderBackgroundColor:0];
    }
    tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
    self->_tableViewBackgroundHeaderView = 0;

    [(UISearchBar *)self->_searchBar _updateInsetsForTableView:0];
    [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:0];
    v3 = v5;
  }
}

- (BOOL)_areSearchContentsSplitViewMaster
{
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v4 = [WeakRetained splitViewController];
  id v5 = [v4 masterViewController];

  uint64_t v6 = (id *)objc_loadWeakRetained((id *)p_viewController);
  v7 = v6;
  BOOL v8 = v6 != 0;
  if (v6 && v6 != v5)
  {
    do
    {
      objc_super v9 = v7;
      v7 = (id *)v7[13];

      BOOL v8 = v7 != 0;
      if (v7) {
        BOOL v10 = v7 == v5;
      }
      else {
        BOOL v10 = 1;
      }
    }
    while (!v10);
  }

  return v8;
}

- (void)_configureNewSearchBar
{
  [(UISearchBar *)self->_searchBar _setRequiresLegacyVisualProvider];
  [(UISearchBar *)self->_searchBar setController:self];
  [(UISearchBar *)self->_searchBar setShowsScopeBar:*(_WORD *)&self->_searchDisplayControllerFlags & 1];
  [(UIView *)self->_searchBar frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(UISearchBar *)self->_searchBar _defaultHeight];
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v4, v6, v8, v9);
  [(UISearchBar *)self->_searchBar _setAutoDisableCancelButton:0];
  [(UISearchBar *)self->_searchBar setUsesEmbeddedAppearance:1];
  [(UISearchBar *)self->_searchBar _setAllowsInlineScopeBar:[(UISearchDisplayController *)self _areSearchContentsSplitViewMaster] ^ 1];
  if (![(UISearchBar *)self->_searchBar showsScopeBar]) {
    [(UISearchBar *)self->_searchBar _setScopeBarHidden:1];
  }
  BOOL v10 = [(UISearchBar *)self->_searchBar placeholder];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    searchBar = self->_searchBar;
    objc_super v13 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
    [(UISearchBar *)searchBar setPlaceholder:v13];
  }
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v14 = [(UIView *)self->_searchBar window];
  [v16 addObserver:self selector:sel_windowWillAnimateRotation_ name:@"UIWindowWillAnimateRotationNotification" object:v14];

  v15 = [(UIView *)self->_searchBar window];
  [v16 addObserver:self selector:sel_windowDidRotate_ name:@"UIWindowDidRotateNotification" object:v15];

  [(UISearchDisplayController *)self _configureSearchBarForTableView];
}

- (void)setSearchBar:(id)a3
{
  double v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    BOOL v10 = v5;
    if (searchBar)
    {
      [(UISearchBar *)searchBar setController:0];
      double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v8 = [(UIView *)self->_searchBar window];
      [v7 removeObserver:self name:@"UIWindowWillAnimateRotationNotification" object:v8];

      double v9 = [(UIView *)self->_searchBar window];
      [v7 removeObserver:self name:@"UIWindowDidRotateNotification" object:v9];
    }
    objc_storeStrong((id *)&self->_searchBar, a3);
    [(UISearchDisplayController *)self _configureNewSearchBar];
    double v5 = v10;
  }
}

- (void)_setupNoResultsLabelIfNecessary
{
  if (!self->_noResultsLabel)
  {
    double v3 = [UILabel alloc];
    double v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    noResultsLabel = self->_noResultsLabel;
    self->_noResultsLabel = v4;

    double v6 = self->_noResultsLabel;
    double v7 = [(UISearchDisplayController *)self noResultsMessage];
    [(UILabel *)v6 setText:v7];

    [(UILabel *)self->_noResultsLabel setTextAlignment:1];
    [(UIView *)self->_noResultsLabel setAutoresizingMask:5];
    double v8 = self->_noResultsLabel;
    double v9 = +[UIColor clearColor];
    [(UIView *)v8 setBackgroundColor:v9];

    BOOL v10 = self->_noResultsLabel;
    uint64_t v11 = +[UIColor colorWithWhite:0.8 alpha:1.0];
    [(UILabel *)v10 setTextColor:v11];

    UISystemFontBoldForSize();
  }
}

- (void)setSearchContentsController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_viewController, obj);
    [(UISearchBar *)self->_searchBar _setAllowsInlineScopeBar:[(UISearchDisplayController *)self _areSearchContentsSplitViewMaster] ^ 1];
    BOOL v6 = [(UISearchDisplayController *)self isNavigationBarHidingEnabled];
    double v5 = obj;
    if (v6)
    {
      double v7 = [obj navigationController];
      objc_msgSend(v7, "setPretendNavBarHidden:", -[UISearchDisplayController isActive](self, "isActive"));
      if (v7 && [v7 searchBarHidNavBar]) {
        *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;
      }

      double v5 = obj;
    }
  }
}

- (id)_containingViewOfClass:(Class)a3
{
  double v4 = [(UIView *)self->_searchBar superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_viewController);
    if (!WeakRetained)
    {
      double v4 = 0;
      goto LABEL_12;
    }
    BOOL v6 = WeakRetained;
    do
    {
      double v7 = v6;
      double v4 = [v6 savedHeaderSuperview];
      BOOL v6 = (id *)v6[13];
    }
    while (!v4 && v6);
  }
  if (v4)
  {
    do
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v8 = [v4 superview];

      double v4 = (void *)v8;
    }
    while (v8);
  }
LABEL_12:
  return v4;
}

- (id)_containingTableView
{
  p_savedContainingScrollView = &self->_savedContainingScrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_savedContainingScrollView);
  if (WeakRetained
    && (double v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_savedContainingScrollView),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v8 = objc_loadWeakRetained((id *)p_savedContainingScrollView);
  }
  else
  {
    uint64_t v8 = [(UISearchDisplayController *)self _containingViewOfClass:objc_opt_class()];
  }
  return v8;
}

- (id)_topShadowView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [(UITableView *)self->_tableView _topShadowView];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)hidNavigationBar
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 3) & 1;
}

- (BOOL)_isSearchBarInBar
{
  return [(UISearchBar *)self->_searchBar _isInBarButNotHosted];
}

- (void)_popoverKeyboardDidShow:(id)a3
{
  if (self->_popoverController)
  {
    double v4 = (void *)MEMORY[0x1E4F1C978];
    searchBar = self->_searchBar;
    id v7 = +[UIKeyboard activeKeyboard];
    id v6 = objc_msgSend(v4, "arrayWithObjects:", searchBar, v7, 0);
    [(UIPopoverController *)self->_popoverController setPassthroughViews:v6];
  }
}

- (void)_popoverKeyboardDidHide:(id)a3
{
  if (self->_popoverController)
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_searchBar, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIPopoverController *)self->_popoverController setPassthroughViews:v4];
  }
}

- (void)_popoverClearButtonPressed:(id)a3
{
  [(UISearchBar *)self->_searchBar setText:&stru_1ED0E84C0];
  [(UISearchDisplayController *)self setActive:0 animated:1];
}

- (id)_createPopoverController
{
  double v3 = [[UITableViewController alloc] initWithStyle:self->_searchResultsTableViewStyle];
  id v4 = [(UISearchDisplayController *)self searchResultsTableView];
  -[UIView __setViewDelegate:](v4, 0);

  double v5 = [(UISearchDisplayController *)self searchResultsTableView];
  objc_msgSend(v5, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

  id v6 = [(UISearchDisplayController *)self searchResultsTableView];
  objc_msgSend(v6, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  id v7 = [(UISearchDisplayController *)self searchResultsTableView];
  [(UITableViewController *)v3 setTableView:v7];

  uint64_t v8 = [(UISearchDisplayController *)self searchResultsTitle];
  if ([v8 length]) {
    [(UISearchDisplayController *)self searchResultsTitle];
  }
  else {
  double v9 = _UINSLocalizedStringWithDefaultValue(@"Results", @"Results");
  }
  BOOL v10 = [(UIViewController *)v3 navigationItem];
  [v10 setTitle:v9];

  if ([(UISearchBar *)self->_searchBar showsSearchResultsButton]
    && [(UISearchBar *)self->_searchBar isSearchResultsButtonSelected])
  {
    uint64_t v11 = [UIBarButtonItem alloc];
    v12 = _UIKitBundle();
    objc_super v13 = [v12 localizedStringForKey:@"Clear[Search]" value:@"Clear" table:@"Localizable"];
    v14 = [(UIBarButtonItem *)v11 initWithTitle:v13 style:1 target:self action:sel__popoverClearButtonPressed_];
    v15 = [(UIViewController *)v3 navigationItem];
    [v15 setLeftBarButtonItem:v14];
  }
  id v16 = [[UINavigationController alloc] initWithRootViewController:v3];
  v17 = [[UIPopoverController alloc] initWithContentViewController:v16];
  [(UIPopoverController *)v17 setDelegate:self];

  return v17;
}

- (void)_destroyManagedTableView
{
  tableView = self->_tableView;
  if (tableView)
  {
    [(UIScrollView *)tableView removeFromSuperview];
    id v4 = self->_tableView;
    self->_tableView = 0;
  }
  popoverController = self->_popoverController;
  if (popoverController)
  {
    if ([(UIPopoverController *)popoverController isPopoverVisible]) {
      [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:0];
    }
    id v6 = self->_popoverController;
    id v7 = self->_popoverController;
    self->_popoverController = 0;
  }
}

- (void)_disableParentScrollViews
{
  if (self->_containingScrollViews
    || (Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]),
        (self->_containingScrollViews = Mutable) != 0))
  {
    id v4 = [(UIView *)self->_searchBar superview];
    if (!v4 && [(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
      || [(UISearchBar *)self->_searchBar _containedInNavigationPalette])
    {
      uint64_t v5 = [(UIView *)self->_containerView superview];

      id v4 = (void *)v5;
    }
    if (v4)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v4 isScrollEnabled])
          {
            [v4 setScrollEnabled:0];
            [v4 setProgrammaticScrollEnabled:0];
            CFArrayAppendValue(self->_containingScrollViews, v4);
          }
        }
        uint64_t v6 = [v4 superview];

        id v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

- (void)_enableParentScrollViews
{
  containingScrollViews = self->_containingScrollViews;
  if (containingScrollViews)
  {
    v4.length = CFArrayGetCount(self->_containingScrollViews);
    v4.location = 0;
    CFArrayApplyFunction(containingScrollViews, v4, (CFArrayApplierFunction)_EnableScrollView, 0);
    CFArrayRemoveAllValues(self->_containingScrollViews);
    CFRelease(self->_containingScrollViews);
    self->_containingScrollViews = 0;
  }
}

- (UIEdgeInsets)_tableViewContentInsets
{
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) == 0)
  {
    BOOL v3 = [(UISearchDisplayController *)self _searchBarInNavigationControllerComponent];
    double v4 = 0.0;
    if (!v3) {
      goto LABEL_15;
    }
  }
  if (![(UISearchBar *)self->_searchBar _containedInNavigationPalette])
  {
    if (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
    {
      [(UIView *)self->_searchBar bounds];
      double Height = CGRectGetHeight(v22);
      goto LABEL_12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    uint64_t v11 = [WeakRetained navigationController];
    v12 = [v11 navigationBar];
    [v12 frame];
    double Height = CGRectGetHeight(v21);
    goto LABEL_9;
  }
  id v5 = objc_loadWeakRetained((id *)&self->_viewController);
  char v6 = [v5 edgesForExtendedLayout];

  double Height = 0.0;
  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_viewController);
    double v9 = [v8 navigationController];
    id WeakRetained = [v9 existingPaletteForEdge:2];

    [WeakRetained frame];
    double Height = CGRectGetHeight(v19);
    if ([(UISearchDisplayController *)self isNavigationBarHidingEnabled])
    {
LABEL_10:

      goto LABEL_12;
    }
    uint64_t v11 = objc_loadWeakRetained((id *)&self->_viewController);
    v12 = [v11 navigationController];
    objc_super v13 = [v12 navigationBar];
    [v13 frame];
    double Height = Height + CGRectGetHeight(v20);

LABEL_9:
    goto LABEL_10;
  }
LABEL_12:
  BOOL v14 = [(UISearchDisplayController *)self _shouldAccountForStatusBarHeight];
  double v15 = 0.0;
  if (v14) {
    [(UISearchDisplayController *)self _statusBarHeight];
  }
  double v4 = Height + v15;
LABEL_15:
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v4;
  return result;
}

- (void)_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:(BOOL)a3
{
  if (a3)
  {
    double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v37 = *MEMORY[0x1E4F1DAD8];
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    [(UIScrollView *)self->_tableView contentOffset];
    double v36 = v9;
    double v37 = v8;
    [(UIScrollView *)self->_tableView contentInset];
    double v4 = v10;
    double v5 = v11;
    double v6 = v12;
    double v7 = v13;
  }
  [(UISearchDisplayController *)self _tableViewContentInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20 + self->_lastFooterAdjustment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v38 = [WeakRetained navigationController];

  v23 = v38;
  if (v38)
  {
    double v35 = v5;
    double v24 = v4;
    double v25 = v7;
    double v26 = v6;
    id v27 = objc_loadWeakRetained((id *)&self->_viewController);
    [v38 _scrollViewBottomContentInsetForViewController:v27];
    double v29 = v28;

    double lastFooterAdjustment = self->_lastFooterAdjustment;
    if (lastFooterAdjustment != v29)
    {
      self->_double lastFooterAdjustment = lastFooterAdjustment + v29 - lastFooterAdjustment;
      double v21 = v21 + v29 - lastFooterAdjustment;
    }
    double v6 = v26;
    v23 = v38;
    double v7 = v25;
    double v4 = v24;
    double v5 = v35;
  }
  if (v5 != v17 || v4 != v15 || v7 != v19 || v6 != v21)
  {
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v15, v17, v21, v19);
    -[UIScrollView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v15, v17, v21, v19);
    v23 = v38;
    if (v4 != v15 || v5 != v17)
    {
      -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", v37 + v5 - v17, v36 + v4 - v15);
      v23 = v38;
    }
  }
}

- (void)_hoistSearchBar
{
  BOOL v3 = [(UIView *)self->_searchBar superview];
  double v4 = [(UISearchDisplayControllerContainerView *)self->_containerView topView];

  if (v3 == v4)
  {
    if (*(_WORD *)&self->_searchDisplayControllerFlags) {
      return;
    }
    p_savedContainingScrollView = &self->_savedContainingScrollView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_savedContainingScrollView);
    if (WeakRetained)
    {
      id v18 = WeakRetained;
      if (self->_savedSearchBarResizingMask != -1)
      {
        -[UIView setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:");
        self->_savedSearchBarResizingMask = -1;
      }
      *(_WORD *)&self->_searchDisplayControllerFlags |= 0x8000u;
      [v18 addSubview:self->_searchBar];
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x8000u;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        searchBar = self->_searchBar;
        [v18 _rectForTableHeaderView];
        -[UISearchBar setFrame:](searchBar, "setFrame:");
      }
      [v18 layoutBelowIfNeeded];
      objc_storeWeak((id *)p_savedContainingScrollView, 0);
      goto LABEL_15;
    }
  }
  else
  {
    id WeakRetained = [(UISearchDisplayController *)self _containingViewOfClass:objc_opt_class()];
    if (WeakRetained)
    {
      id v18 = WeakRetained;
      objc_storeWeak((id *)&self->_savedContainingScrollView, WeakRetained);
      [(UIView *)self->_searchBar frame];
      double v7 = v6;
      double v9 = v8;
      double v10 = *MEMORY[0x1E4F1DAD8];
      double v11 = [(UISearchDisplayControllerContainerView *)self->_containerView topView];
      [v11 bounds];
      double Width = CGRectGetWidth(v20);

      if (Width == 0.0) {
        double v7 = 0.0;
      }
      [(UISearchDisplayController *)self _additionalNonCollapsingHeightAboveSearchBar];
      -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v10, v13, v7, v9);
      *(_WORD *)&self->_searchDisplayControllerFlags |= 0x8000u;
      double v14 = [(UISearchDisplayControllerContainerView *)self->_containerView topView];
      [v14 addSubview:self->_searchBar];

      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x8000u;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 _pinsTableHeaderView])
      {
        unint64_t v15 = [(UIView *)self->_searchBar autoresizingMask];
        self->_savedSearchBarResizingMask = v15;
        [(UIView *)self->_searchBar setAutoresizingMask:v15 | 2];
      }
LABEL_15:
      id WeakRetained = v18;
    }
  }
}

- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = [(UISearchDisplayController *)self _isSearchBarInBar];
  BOOL v7 = [(UIView *)self->_tableView isHidden];
  if (v4)
  {
    if (!v7)
    {
      if (!v6) {
        return;
      }
      double v24 = +[UIDevice currentDevice];
      uint64_t v25 = [v24 userInterfaceIdiom];

      if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1
        || [(UIPopoverController *)self->_popoverController isPopoverVisible])
      {
        return;
      }
    }
    [(UISearchDisplayController *)self _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:1];
    if (objc_opt_respondsToSelector()) {
      [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self willShowSearchResultsTableView:self->_tableView];
    }
    if (!v6
      || (+[UIDevice currentDevice],
          double v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 userInterfaceIdiom],
          v8,
          (v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      || [(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
      && [(UISearchDisplayController *)self navigationBarSearchFieldSizing] != 3)
    {
      [(UIView *)self->_tableView setHidden:0];
      [(UIView *)self->_dimmingView setHidden:1];
      self->_lastKeyboardAdjustment = 0.0;
      if (UIKeyboardAutomaticIsOnScreen()) {
        [(UITableView *)self->_tableView _adjustForAutomaticKeyboardInfo:0 animated:0 lastAdjustment:&self->_lastKeyboardAdjustment];
      }
      containerView = self->_containerView;
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = [(UISearchDisplayController *)self _searchBarInNavigationControllerComponent] ^ 1;
      }
      [(UISearchDisplayControllerContainerView *)containerView setBottomViewUserInteractionEnabled:v27];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
      {
        goto LABEL_48;
      }
      searchBar = self->_searchBar;
      v32 = self->_tableView;
      v33 = [(UISearchBar *)searchBar _makeShadowView];
      [(UITableView *)v32 _setTopShadowView:v33];

LABEL_47:
LABEL_48:
      if (objc_opt_respondsToSelector()) {
        [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self didShowSearchResultsTableView:self->_tableView];
      }
      [(UISearchDisplayController *)self _updateNoSearchResultsMessageVisiblity];
      return;
    }
    if (!self->_popoverController)
    {
      double v10 = [(UISearchDisplayController *)self _createPopoverController];
      popoverController = self->_popoverController;
      self->_popoverController = v10;
    }
    unint64_t v12 = [(UISearchDisplayController *)self navigationBarSearchFieldSizing];
    double v13 = (void *)MEMORY[0x1E4F1C978];
    double v14 = self->_searchBar;
    if (v12 == 3)
    {
      unint64_t v15 = [(UISearchBar *)self->_searchBar searchField];
      double v16 = +[UIKeyboard activeKeyboard];
      double v17 = objc_msgSend(v13, "arrayWithObjects:", v15, v16, 0);
      [(UIPopoverController *)self->_popoverController setPassthroughViews:v17];

      id v18 = [(UISearchBar *)self->_searchBar searchField];
      double v19 = v18;
    }
    else
    {
      v34 = +[UIKeyboard activeKeyboard];
      double v35 = objc_msgSend(v13, "arrayWithObjects:", v14, v34, 0);
      [(UIPopoverController *)self->_popoverController setPassthroughViews:v35];

      BOOL v36 = [(UISearchBar *)self->_searchBar isSearchResultsButtonSelected];
      id v18 = [(UISearchBar *)self->_searchBar searchField];
      double v19 = v18;
      if (v36)
      {
        double v37 = [(UISearchBar *)self->_searchBar searchField];
        [v37 bounds];
        objc_msgSend(v19, "rightViewRectForBounds:");
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;

LABEL_46:
        v50 = self->_popoverController;
        v33 = [(UISearchBar *)self->_searchBar searchField];
        -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v50, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v33, 3, 1, v39, v41, v43, v45);
        goto LABEL_47;
      }
    }
    [v18 bounds];
    double v39 = v46;
    double v41 = v47;
    double v43 = v48;
    double v45 = v49;
    goto LABEL_46;
  }
  if (!v7 || v6)
  {
    if (objc_opt_respondsToSelector()) {
      [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self willHideSearchResultsTableView:self->_tableView];
    }
    if (v6
      && (+[UIDevice currentDevice],
          CGRect v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 userInterfaceIdiom],
          v20,
          (v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      && (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
       || [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3))
    {
      [(UISearchBar *)self->_searchBar setSearchResultsButtonSelected:0];
      if ([(UIPopoverController *)self->_popoverController isPopoverVisible]) {
        [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:0];
      }
      CGRect v22 = self->_popoverController;
      v23 = self->_popoverController;
      self->_popoverController = 0;
    }
    else
    {
      if ([(UISearchDisplayController *)self dimTableViewOnEmptySearchString]) {
        [(UIView *)self->_dimmingView setHidden:0];
      }
      [(UIView *)self->_tableView setHidden:1];
      [(UIView *)self->_tableView setAlpha:1.0];
      [(UISearchDisplayControllerContainerView *)self->_containerView setBottomViewUserInteractionEnabled:[(UISearchDisplayController *)self dimTableViewOnEmptySearchString]];
    }
    double v28 = [(UISearchBar *)self->_searchBar searchField];
    [v28 _setSuffix:0 withColor:0];

    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      tableView = self->_tableView;
      [(UISearchDisplayDelegate *)delegate searchDisplayController:self didHideSearchResultsTableView:tableView];
    }
  }
}

- (void)_searchBarSuperviewWillChange
{
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x80000000) == 0) {
    [(UISearchDisplayController *)self _cleanUpSearchBar];
  }
}

- (void)_searchBarSuperviewChanged
{
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x80000000) == 0)
  {
    if ([(UISearchBar *)self->_searchBar _containedInNavigationPalette])
    {
      BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 addObserver:self selector:sel_navigationControllerWillShowViewController_ name:0x1ED10DD40 object:0];
    }
    [(UISearchDisplayController *)self _configureSearchBarForTableView];
  }
}

- (void)_hideVisibleRefreshControl
{
  v2 = [(UISearchDisplayController *)self _containingTableView];
  if (v2)
  {
    id v8 = v2;
    BOOL v3 = [v2 _refreshControl];
    v2 = v8;
    if (v3)
    {
      BOOL v4 = [v8 _refreshControl];
      if ([v4 refreshControlState] == 2)
      {
      }
      else
      {
        double v5 = [v8 _refreshControl];
        uint64_t v6 = [v5 refreshControlState];

        v2 = v8;
        if (v6 != 3) {
          goto LABEL_7;
        }
      }
      BOOL v7 = [v8 _refreshControl];
      [v7 _removeInsets];

      v2 = v8;
    }
  }
LABEL_7:
}

- (double)_dimmingViewAlpha
{
  BOOL v3 = [(UISearchDisplayController *)self _dimmingOverlayColor];
  if (v3)
  {
    id v4 = [(UISearchDisplayController *)self _dimmingOverlayColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v4 CGColor]);
  }
  else
  {
    double Alpha = 0.4;
  }

  return Alpha;
}

- (id)_dimmingViewColor
{
  BOOL v3 = [(UISearchDisplayController *)self _dimmingOverlayColor];

  if (v3)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
    id v4 = [(UISearchDisplayController *)self _dimmingOverlayColor];
    double v5 = v4;
    if (v4) {
      [v4 getRed:&v10 green:&v9 blue:&v8 alpha:0];
    }

    uint64_t v6 = +[UIColor colorWithRed:v10 green:v9 blue:v8 alpha:1.0];
  }
  else
  {
    uint64_t v6 = +[UIColor blackColor];
  }
  return v6;
}

- (void)_sendDelegateDidBeginDidEndSearch
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (searchDisplayControllerFlags)
  {
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      [(UISearchDisplayDelegate *)delegate searchDisplayControllerDidBeginSearch:self];
      return;
    }
    __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  }
  if (searchDisplayControllerFlags & 1) == 0 && (objc_opt_respondsToSelector())
  {
    double v5 = self->_delegate;
    [(UISearchDisplayDelegate *)v5 searchDisplayControllerDidEndSearch:self];
  }
}

- (void)showHideAnimationDidFinish
{
  if ((![(UISearchDisplayController *)self _showsResultsForEmptyField]
     || [(UISearchDisplayController *)self _showsResultsForEmptyField]
     && (*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0)
    && ![(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
  {
    [(UISearchDisplayController *)self _hoistSearchBar];
  }
  if (*(_WORD *)&self->_searchDisplayControllerFlags)
  {
    [(UISearchBar *)self->_searchBar _allowCursorToAppear:1];
    if (![(UISearchDisplayController *)self _isSearchBarInBar]) {
      goto LABEL_26;
    }
    BOOL v3 = [(UISearchBar *)self->_searchBar text];
    BOOL v8 = [v3 length]
      || [(UISearchDisplayController *)self _showsResultsForEmptyField]
      || [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    double v10 = [WeakRetained _existingView];
    [(UISearchDisplayController *)self _setTableViewVisible:v8 inView:v10];
  }
  else
  {
    BOOL v3 = [(UISearchDisplayController *)self _containingTableView];
    if ([v3 _pinsTableHeaderView]) {
      [v3 _setIgnorePinnedTableHeaderUpdates:0];
    }
    if (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
    {
      id v4 = objc_loadWeakRetained((id *)&self->_viewController);
      double v5 = [v4 _existingView];
      [(UISearchDisplayController *)self _setTableViewVisible:0 inView:v5];
    }
    [(UISearchBar *)self->_searchBar _destroyCancelButton];
    if ([(UISearchBar *)self->_searchBar isTranslucent]) {
      [(UISearchBar *)self->_searchBar _setScopeBarHidden:1];
    }
    if (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
      && (*(_WORD *)&self->_searchDisplayControllerFlags & 0x2000) == 0)
    {
      [(UIView *)self->_containerView removeFromSuperview];
    }
    id v6 = objc_loadWeakRetained((id *)&self->_viewController);
    [v6 _clearRecordedContentScrollView];

    if ([(UISearchBar *)self->_searchBar barPosition] != 3)
    {
      [(UISearchBar *)self->_searchBar _setMaskActive:1];
      searchBar = self->_searchBar;
      [(UIView *)searchBar bounds];
      -[UISearchBar _setMaskBounds:](searchBar, "_setMaskBounds:");
    }
    [(UISearchDisplayController *)self _updateSearchBarMaskIfNecessary];
  }

LABEL_26:
  [(UISearchDisplayController *)self _sendDelegateDidBeginDidEndSearch];
}

- (void)setActive:(BOOL)visible animated:(BOOL)animated
{
  BOOL v4 = visible;
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 1) == 0) ^ visible) & 1) == 0)
  {
    BOOL v19 = animated;
    *(_WORD *)&self->___int16 searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFFC | visible | 2;
    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [(UISearchDisplayDelegate *)self->_delegate searchDisplayControllerWillBeginSearch:self];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [(UISearchDisplayDelegate *)self->_delegate searchDisplayControllerWillEndSearch:self];
    }
    if ([(UISearchDisplayController *)self _isSearchBarInBar])
    {
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x1000u;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      v23 = [WeakRetained navigationController];

      if (v4)
      {
        double v24 = +[UIDevice currentDevice];
        uint64_t v25 = [v24 userInterfaceIdiom];

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
           || [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3))
        {
          [v21 addObserver:self selector:sel__popoverKeyboardDidShow_ name:@"UIKeyboardDidShowNotification" object:0];
          [v21 addObserver:self selector:sel__popoverKeyboardDidHide_ name:@"UIKeyboardDidHideNotification" object:0];
        }
        if (v23)
        {
          [v21 addObserver:self selector:sel_navigationControllerWillShowViewController_ name:0x1ED10DD40 object:v23];
          [v21 addObserver:self selector:sel_navigationControllerDidShowViewController_ name:0x1ED10DD60 object:v23];
          [v21 addObserver:self selector:sel_navigationControllerDidCancelShowingViewController_ name:0x1ED10DD80 object:v23];
        }
      }
      else
      {
        searchBar = self->_searchBar;
        v31 = [(UISearchBar *)searchBar text];
        if ([v31 length]) {
          uint64_t v32 = [(UISearchDisplayController *)self displaysSearchBarInNavigationBar] ^ 1;
        }
        else {
          uint64_t v32 = 0;
        }
        [(UISearchBar *)searchBar setShowsSearchResultsButton:v32];

        if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x100) == 0)
        {
          v74 = [(UISearchBar *)self->_searchBar searchField];
          [v74 resignFirstResponder];

          v75 = [(UISearchBar *)self->_searchBar searchField];
          [v75 _clearBecomeFirstResponderWhenCapable];
        }
        v76 = +[UIDevice currentDevice];
        uint64_t v77 = [v76 userInterfaceIdiom];

        if ((v77 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
           || [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3))
        {
          [v21 removeObserver:self name:@"UIKeyboardDidShowNotification" object:0];
          [v21 removeObserver:self name:@"UIKeyboardDidHideNotification" object:0];
        }
        if (v23)
        {
          [v21 removeObserver:self name:0x1ED10DD40 object:v23];
          [v21 removeObserver:self name:0x1ED10DD60 object:v23];
          [v21 removeObserver:self name:0x1ED10DD80 object:v23];
        }
        [(UISearchBar *)self->_searchBar setText:&stru_1ED0E84C0];
      }
      v78 = +[UIDevice currentDevice];
      uint64_t v79 = [v78 userInterfaceIdiom];

      if ((v79 & 0xFFFFFFFFFFFFFFFBLL) != 1
        && [(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
      {
        id v80 = objc_loadWeakRetained((id *)&self->_viewController);
        v81 = v80;
        if (v4)
        {
          v82 = [v80 view];

          [(UISearchDisplayController *)self _hideVisibleRefreshControl];
          v83 = [(UIView *)self->_searchBar _screen];
          [v21 addObserver:self selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v83];

          v84 = [(UIView *)self->_searchBar _screen];
          [v21 addObserver:self selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v84];

          id v85 = [(UISearchDisplayController *)self _containerView];
          containerView = self->_containerView;
          [v82 bounds];
          -[UIView setFrame:](containerView, "setFrame:");
          v87 = self->_containerView;
          v88 = [v23 navigationBar];
          [v88 frame];
          [(UISearchDisplayControllerContainerView *)v87 updateTopViewHeight:CGRectGetHeight(v247)];

          [v82 addSubview:self->_containerView];
          [(UISearchDisplayController *)self _disableParentScrollViews];
          v89 = self->_containerView;
          [(UISearchDisplayController *)self _statusBarHeight];
          -[UISearchDisplayControllerContainerView updateTopAttributeConstant:](v89, "updateTopAttributeConstant:");
          v90 = [(UIView *)self->_containerView _containingScrollView];
          [v90 contentOffset];
          self->_containingScrollViewContentOffset.x = v91;
          self->_containingScrollViewContentOffset.y = v92;
          [v90 _setAutomaticContentOffsetAdjustmentEnabled:0];
          [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:1];
        }
        else
        {
          v82 = [v80 _existingView];

          [(UISearchBar *)self->_searchBar setText:&stru_1ED0E84C0];
          [(UISearchDisplayController *)self _enableParentScrollViews];
          [v21 removeObserver:self name:@"UIKeyboardWillShowNotification" object:0];
          [v21 removeObserver:self name:@"UIKeyboardWillHideNotification" object:0];
          v104 = [(UISearchBar *)self->_searchBar searchField];
          [v104 resignFirstResponder];

          v105 = [(UISearchBar *)self->_searchBar searchField];
          [v105 _clearBecomeFirstResponderWhenCapable];

          v106 = [(UIView *)self->_containerView _containingScrollView];
          [v106 _setAutomaticContentOffsetAdjustmentEnabled:1];

          [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:0];
        }
        v244[0] = MEMORY[0x1E4F143A8];
        v244[1] = 3221225472;
        v244[2] = __48__UISearchDisplayController_setActive_animated___block_invoke;
        v244[3] = &unk_1E52D9FC0;
        BOOL v245 = v4;
        v244[4] = self;
        v242[0] = MEMORY[0x1E4F143A8];
        v242[1] = 3221225472;
        v242[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_2;
        v242[3] = &unk_1E52E0478;
        BOOL v243 = v4;
        v242[4] = self;
        +[UIView animateWithDuration:v244 animations:v242 completion:0.25];
      }
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
      goto LABEL_203;
    }
    double v26 = off_1E52D4000;
    uint64_t v27 = &xmmword_186B92000;
    BOOL v200 = v19;
    if ([(UISearchBar *)self->_searchBar _containedInNavigationPalette])
    {
      id v28 = objc_loadWeakRetained((id *)&self->_viewController);
      double v29 = v28;
      if (v4) {
        [v28 view];
      }
      else {
      v198 = [v28 _existingView];
      }

      id v44 = objc_loadWeakRetained((id *)&self->_viewController);
      double v45 = [v44 navigationController];

      double v46 = [v45 existingPaletteForEdge:2];
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x1000u;
      if (!v4)
      {
        [(UISearchDisplayController *)self _enableParentScrollViews];
        [(UISearchBar *)self->_searchBar setText:&stru_1ED0E84C0];
        [v21 removeObserver:self name:@"UIKeyboardWillShowNotification" object:0];
        [v21 removeObserver:self name:@"UIKeyboardWillHideNotification" object:0];
        [v21 removeObserver:self name:0x1ED10DD60 object:v45];
        [v21 removeObserver:self name:0x1ED10DD80 object:v45];
        v62 = [(UISearchBar *)self->_searchBar searchField];
        [v62 resignFirstResponder];

        v63 = [(UISearchBar *)self->_searchBar searchField];
        [v63 _clearBecomeFirstResponderWhenCapable];

        v64 = [(UIView *)self->_containerView _containingScrollView];
        [v64 _setAutomaticContentOffsetAdjustmentEnabled:1];

        [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:0];
        v65 = [(UISearchBar *)self->_searchBar searchField];
        [v65 _setSuffix:0 withColor:0];

        __int16 v66 = (__int16)self->_searchDisplayControllerFlags;
        if ((v66 & 8) != 0)
        {
          *(_WORD *)&self->___int16 searchDisplayControllerFlags = v66 & 0xFFF7;
          double v67 = 0.0;
          if (v19) {
            double v67 = 0.25;
          }
          [v45 _setNavigationBarHidden:0 edgeIfNotNavigating:1 duration:v67];
          [(UISearchBar *)self->_searchBar _setBarPosition:self->_unactivatedBarPosition];
          [v46 setPinningBarShadowIsHidden:(*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1];
        }
LABEL_125:
        v131 = v26[422];
        uint64_t v234 = MEMORY[0x1E4F143A8];
        uint64_t v235 = *((void *)v27 + 137);
        uint64_t v132 = v235;
        v236 = __48__UISearchDisplayController_setActive_animated___block_invoke_3;
        v237 = &unk_1E52DC3F8;
        BOOL v241 = v4;
        v238 = self;
        id v239 = v46;
        id v133 = v198;
        id v240 = v133;
        v231[0] = MEMORY[0x1E4F143A8];
        v231[1] = v235;
        v231[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_4;
        v231[3] = &unk_1E52DF270;
        BOOL v233 = v4;
        v231[4] = self;
        id v134 = v239;
        id v232 = v134;
        [(__objc2_class *)v131 animateWithDuration:&v234 animations:v231 completion:0.25];
        if (!v19 || v4)
        {
          __int16 v136 = (__int16)self->_searchDisplayControllerFlags;
        }
        else
        {
          BOOL v135 = [(UIView *)self->_tableView isHidden];
          __int16 v136 = (__int16)self->_searchDisplayControllerFlags;
          if (!v135)
          {
            v137 = v26;
            *(_WORD *)&self->___int16 searchDisplayControllerFlags = v136 | 0x2000;
            v138 = [(UIView *)self->_tableView backgroundColor];
            p_dimmingView = &self->_dimmingView;
            if (v138) {
              [(UIView *)self->_tableView backgroundColor];
            }
            else {
            v143 = +[UIColor whiteColor];
            }
            [(UIView *)*p_dimmingView setBackgroundColor:v143];

            [(UIView *)*p_dimmingView setAlpha:0.0];
            uint64_t v142 = 0;
            int v141 = 1;
            double v26 = v137;
LABEL_134:
            [(UIView *)*p_dimmingView setHidden:v142];
            if (v4)
            {
              if ([(UISearchDisplayController *)self _showsResultsForEmptyField])
              {
                [(UIView *)self->_dimmingView setHidden:1];
                [(UISearchDisplayController *)self _setTableViewVisible:1 inView:0];
                if (v200)
                {
                  [(UIView *)self->_tableView setAlpha:0.0];
                  v144 = v26[422];
                  v230[0] = MEMORY[0x1E4F143A8];
                  v230[1] = v132;
                  v230[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_5;
                  v230[3] = &unk_1E52D9F70;
                  v230[4] = self;
                  [(__objc2_class *)v144 animateWithDuration:v230 animations:0.25];
                }
              }
            }
            v145 = v26[422];
            if (v141)
            {
              v229[0] = MEMORY[0x1E4F143A8];
              v229[1] = v132;
              v229[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_6;
              v229[3] = &unk_1E52D9F70;
              v229[4] = self;
              v228[0] = MEMORY[0x1E4F143A8];
              v228[1] = v132;
              v228[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_7;
              v228[3] = &unk_1E52E0000;
              v228[4] = self;
              v228[5] = 0x3FC0000000000000;
              [(__objc2_class *)v145 animateWithDuration:v229 animations:v228 completion:0.125];
            }
            else
            {
              v226[0] = MEMORY[0x1E4F143A8];
              v226[1] = v132;
              v226[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_9;
              v226[3] = &unk_1E52D9FC0;
              v226[4] = self;
              BOOL v227 = v4;
              [(__objc2_class *)v145 animateWithDuration:v226 animations:0.125];
            }
            v146 = v26[422];
            v224[0] = MEMORY[0x1E4F143A8];
            v224[1] = v132;
            v224[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_10;
            v224[3] = &unk_1E52D9FC0;
            v224[4] = self;
            BOOL v225 = v4;
            v222[0] = MEMORY[0x1E4F143A8];
            v222[1] = v132;
            v222[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_11;
            v222[3] = &unk_1E52E0478;
            BOOL v223 = v4;
            v222[4] = self;
            [(__objc2_class *)v146 animateWithDuration:4 delay:v224 options:v222 animations:0.25 completion:0.0];

            *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
            if (v200) {
              goto LABEL_205;
            }
            goto LABEL_203;
          }
        }
        *(_WORD *)&self->___int16 searchDisplayControllerFlags = v136 & 0xDFFF;
        v140 = [(UISearchDisplayController *)self _dimmingViewColor];
        p_dimmingView = &self->_dimmingView;
        [(UIView *)self->_dimmingView setBackgroundColor:v140];

        [(UISearchDisplayController *)self _dimmingViewAlpha];
        -[UIView setAlpha:](self->_dimmingView, "setAlpha:");
        int v141 = 0;
        uint64_t v142 = [(UISearchDisplayController *)self dimTableViewOnEmptySearchString] ^ 1;
        goto LABEL_134;
      }
      double v47 = self->_searchBar;
      double v48 = [v45 navigationBar];
      double v49 = [v48 _appearanceStorage];
      [v49 _barButtonAppearanceStorage];
      v50 = v195 = v46;
      [(UISearchBar *)v47 _setupCancelButtonWithAppearance:v50];

      [(UISearchBar *)self->_searchBar set_forceCenteredPlaceholderLayout:1];
      [(UIView *)self->_searchBar layoutBelowIfNeeded];
      [(UISearchBar *)self->_searchBar set_forceCenteredPlaceholderLayout:0];
      [(UISearchDisplayController *)self _hideVisibleRefreshControl];
      v51 = [(UIView *)self->_searchBar _screen];
      [v21 addObserver:self selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v51];

      v52 = [(UIView *)self->_searchBar _screen];
      [v21 addObserver:self selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v52];

      [v21 addObserver:self selector:sel_navigationControllerDidShowViewController_ name:0x1ED10DD60 object:v45];
      [v21 addObserver:self selector:sel_navigationControllerDidCancelShowingViewController_ name:0x1ED10DD80 object:v45];
      id v53 = [(UISearchDisplayController *)self _containerView];
      v54 = self->_containerView;
      [v198 bounds];
      -[UIView setFrame:](v54, "setFrame:");
      [v198 addSubview:self->_containerView];
      v55 = [(UIView *)self->_containerView _containingScrollView];
      [v55 contentOffset];
      self->_containingScrollViewContentOffset.x = v56;
      self->_containingScrollViewContentOffset.y = v57;
      [v55 _setAutomaticContentOffsetAdjustmentEnabled:0];
      [(UISearchDisplayController *)self _watchContainingTableViewForScrolling:1];
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0)
      {
        if (![(UISearchDisplayController *)self isNavigationBarHidingEnabled]
          || [v45 isNavigationBarHidden])
        {
          *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
LABEL_111:
          id v119 = objc_loadWeakRetained((id *)&self->_viewController);
          char v120 = [v119 edgesForExtendedLayout];

          if (v120)
          {
            v121 = [v45 navigationBar];
            [v121 frame];
            double Height = CGRectGetHeight(v248);
            double v46 = v195;
            [v195 bounds];
            double v123 = Height + CGRectGetHeight(v249);

            [(UISearchDisplayControllerContainerView *)self->_containerView updateTopViewHeight:v123];
          }
          else
          {
            [(UISearchDisplayControllerContainerView *)self->_containerView collapseTopView];
            double v46 = v195;
          }
          if ([(UISearchDisplayController *)self _shouldAccountForStatusBarHeight])
          {
            v124 = self->_containerView;
            [(UISearchDisplayController *)self _statusBarHeight];
            -[UISearchDisplayControllerContainerView updateTopAttributeConstant:](v124, "updateTopAttributeConstant:");
          }
          [(UIView *)self->_containerView layoutIfNeeded];
          [(UISearchBar *)self->_searchBar _allowCursorToAppear:0];
          self->_unactivatedBarPosition = [(UISearchBar *)self->_searchBar barPosition];
          if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0 && [v46 boundaryEdge] == 2)
          {
            v125 = [(UIView *)self->_searchBar window];
            v126 = __UIStatusBarManagerForWindow(v125);
            char v127 = [v126 isStatusBarHidden];

            double v46 = v195;
            if ((v127 & 1) == 0
              && ([(UISearchBar *)self->_searchBar barPosition] == 2
               || ![(UISearchBar *)self->_searchBar barPosition]))
            {
              if (![(UISearchDisplayController *)self _containedInPopover]) {
                goto LABEL_123;
              }
              id v128 = objc_loadWeakRetained((id *)&self->_viewController);
              v129 = [v128 _popoverController];
              v130 = [v129 _managingSplitViewController];

              double v46 = v195;
              if (v130) {
LABEL_123:
              }
                [(UISearchBar *)self->_searchBar _setBarPosition:3];
            }
          }
          [(UISearchDisplayController *)self _disableParentScrollViews];

          double v26 = off_1E52D4000;
          uint64_t v27 = &xmmword_186B92000;
          goto LABEL_125;
        }
        *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;
      }
      [v195 setVisibleWhenPinningBarIsHidden:1];
      double v116 = 0.0;
      if (v19) {
        double v116 = 0.25;
      }
      [v45 _setNavigationBarHidden:1 edgeIfNotNavigating:1 duration:v116];
      v117 = [v45 navigationBar];
      if ([v117 _hidesShadow]) {
        __int16 v118 = 0x4000;
      }
      else {
        __int16 v118 = 0;
      }
      *(_WORD *)&self->___int16 searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xBFFF | v118;

      [v195 setPinningBarShadowIsHidden:1];
      goto LABEL_111;
    }
    SEL v194 = a2;
    if (!v4) {
      [(UISearchDisplayController *)self _enableParentScrollViews];
    }
    p_viewController = &self->_viewController;
    id v34 = objc_loadWeakRetained((id *)&self->_viewController);
    id v35 = [v34 navigationController];

    int v36 = 0;
    __int16 v37 = (__int16)self->_searchDisplayControllerFlags;
    char v191 = v37;
    __int16 v38 = 0;
    if (v19 && !v4)
    {
      BOOL v39 = [(UIView *)self->_tableView isHidden];
      int v36 = !v39;
      if (v39) {
        __int16 v38 = 0;
      }
      else {
        __int16 v38 = 0x2000;
      }
      __int16 v37 = (__int16)self->_searchDisplayControllerFlags;
    }
    int v197 = v36;
    *(_WORD *)&self->___int16 searchDisplayControllerFlags = v38 | v37 & 0xDFFF;
    BOOL v192 = [(UISearchBar *)self->_searchBar _scopeBarIsVisible];
    double v40 = self->_searchBar;
    if (v4)
    {
      double v41 = [v35 navigationBar];
      double v42 = [v41 _appearanceStorage];
      double v43 = [v42 _barButtonAppearanceStorage];
      [(UISearchBar *)v40 _setupCancelButtonWithAppearance:v43];

      p_viewController = &self->_viewController;
      [(UISearchBar *)self->_searchBar set_forceCenteredPlaceholderLayout:1];
      [(UIView *)self->_searchBar layoutBelowIfNeeded];
      [(UISearchBar *)self->_searchBar set_forceCenteredPlaceholderLayout:0];
      [(UISearchBar *)self->_searchBar _allowCursorToAppear:0];
    }
    else
    {
      [(UISearchBar *)self->_searchBar setText:&stru_1ED0E84C0];
      v58 = [(UISearchBar *)self->_searchBar searchField];
      [v58 resignFirstResponder];
    }
    v59 = (void *)UIApp;
    v60 = [(UIView *)self->_searchBar window];
    if ((unint64_t)([v59 _safeInterfaceOrientationForWindowIfExists:v60] - 3) > 1)
    {
    }
    else
    {
      BOOL v61 = [(UISearchBar *)self->_searchBar _allowsInlineScopeBar];

      if (v61)
      {
LABEL_53:
        [(UISearchDisplayController *)self _hideVisibleRefreshControl];
        if (v4)
        {
          v68 = +[UIDevice currentDevice];
          uint64_t v69 = [v68 userInterfaceIdiom];

          if ((v69 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            uint64_t v70 = 0;
          }
          else
          {
            uint64_t v70 = [(UIView *)self->_searchBar _containingScrollView];
          }
          [(id)v70 _setAutomaticContentOffsetAdjustmentEnabled:0];
          objc_storeWeak(&self->_navigationControllerBookkeeper, v35);
          id v72 = objc_loadWeakRetained((id *)p_viewController);
          v73 = [v72 view];
        }
        else
        {
          [0 _setAutomaticContentOffsetAdjustmentEnabled:0];
          id v71 = objc_loadWeakRetained(&self->_navigationControllerBookkeeper);

          if (v35 != v71)
          {
            v187 = [MEMORY[0x1E4F28B00] currentHandler];
            [v187 handleFailureInMethod:v194 object:self file:@"UISearchDisplayController.m" lineNumber:1268 description:@"search contents navigation controller must not change between -setActive:YES and -setActive:NO"];
          }
          id v72 = objc_loadWeakRetained((id *)p_viewController);
          v73 = [v72 _existingView];
          uint64_t v70 = 0;
        }
        id v93 = v73;

        if (v93)
        {
          unint64_t v196 = [(UISearchDisplayController *)self _containingTableView];
        }
        else
        {
          unint64_t v196 = 0;
        }
        v190 = (void *)v70;
        if (v4)
        {
          BOOL v94 = (v70 | v196) != 0;
          *(_WORD *)&self->___int16 searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xEFFF | (v94 << 12);
          v95 = [(UISearchDisplayController *)self _containerView];
          [v95 configureInteractionForContainment:v94];

          if ([(id)v196 _pinsTableHeaderView]) {
            [(id)v196 _setIgnorePinnedTableHeaderUpdates:1];
          }
          if (!v35)
          {
            location = (id *)p_viewController;
            int v193 = 0;
            int v96 = 0;
            int v188 = 1;
            goto LABEL_165;
          }
        }
        else if (!v35)
        {
          LOBYTE(v193) = 0;
          goto LABEL_103;
        }
        v97 = [v35 navigationBar];
        int v96 = [v97 isTranslucent];

        v98 = [v35 navigationBar];
        uint64_t v99 = [v98 _barPosition];

        if (v4)
        {
          id v100 = objc_loadWeakRetained((id *)p_viewController);
          int v193 = [v35 _shouldNavigationBarInsetViewController:v100];

          location = (id *)p_viewController;
          if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0)
          {
            if (![(UISearchDisplayController *)self isNavigationBarHidingEnabled]
              || [v35 isNavigationBarHidden])
            {
              *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
LABEL_150:
              self->_unactivatedBarPosition = [(UISearchBar *)self->_searchBar barPosition];
              if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
              {
                if (v99 == 3
                  && ([(UIView *)self->_searchBar window],
                      v152 = objc_claimAutoreleasedReturnValue(),
                      __UIStatusBarManagerForWindow(v152),
                      v153 = objc_claimAutoreleasedReturnValue(),
                      int v154 = [v153 isStatusBarHidden],
                      v153,
                      v152,
                      !v154)
                  || [(UISearchDisplayController *)self _containedInPopover]
                  && ![(UISearchDisplayController *)self _isSearchBarInBar])
                {
                  [(UISearchDisplayController *)self _additionalNonCollapsingHeightAboveSearchBar];
                  if (v155 == 0.0
                    && ([(UISearchBar *)self->_searchBar barPosition] == 2
                     || ![(UISearchBar *)self->_searchBar barPosition]))
                  {
                    [(UISearchBar *)self->_searchBar _setBarPosition:3];
                  }
                }
              }
              if ([(UISearchBar *)self->_searchBar barPosition] == 3)
              {
                v156 = [v35 navigationBar];
                if ([v156 _hidesShadow]) {
                  __int16 v157 = 0x4000;
                }
                else {
                  __int16 v157 = 0;
                }
                *(_WORD *)&self->___int16 searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xBFFF | v157;
              }
              v158 = [v35 navigationBar];
              [v158 _setHidesShadow:1];

              [v21 addObserver:self selector:sel_navigationControllerWillShowViewController_ name:0x1ED10DD40 object:v35];
              [v21 addObserver:self selector:sel_navigationControllerDidShowViewController_ name:0x1ED10DD60 object:v35];
              [v21 addObserver:self selector:sel_navigationControllerDidCancelShowingViewController_ name:0x1ED10DD80 object:v35];
              int v188 = 0;
LABEL_165:
              [v93 bounds];
              -[UIView setFrame:](self->_containerView, "setFrame:");
              id v159 = objc_loadWeakRetained(location);
              [v159 _recordContentScrollView];

              double v160 = 0.0;
              if ([(UISearchDisplayController *)self _shouldAccountForStatusBarHeight])
              {
                [(UISearchDisplayController *)self _statusBarHeight];
                double v160 = v161 + 0.0;
              }
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              $8D6B8881E49F585262256A31217E692A v163 = self->_searchDisplayControllerFlags;
              if (isKindOfClass)
              {
                if ((v193 & (*(unsigned int *)&v163 >> 3)) == 1)
                {
                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_13;
                  aBlock[3] = &unk_1E52D9CD0;
                  aBlock[4] = self;
                  *(double *)&aBlock[5] = v160;
                  v115 = _Block_copy(aBlock);
                  double v160 = 0.0;
                  int v114 = 1;
                  goto LABEL_174;
                }
              }
              else if ((*(unsigned char *)&v163 & 8) != 0)
              {
                if ((v193 & 1) == 0)
                {
                  v185 = [v35 navigationBar];
                  [v185 bounds];
                  double v186 = CGRectGetHeight(v250);

                  double v160 = v160 + v186;
                  v221[0] = MEMORY[0x1E4F143A8];
                  v221[1] = 3221225472;
                  v221[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_12;
                  v221[3] = &unk_1E52DD178;
                  v221[4] = self;
                  *(double *)&v221[5] = v160;
                  *(double *)&v221[6] = v186;
                  v115 = _Block_copy(v221);
                  int v114 = 0;
LABEL_174:
                  v216[0] = MEMORY[0x1E4F143A8];
                  v216[1] = 3221225472;
                  v216[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_14;
                  v216[3] = &unk_1E52DA070;
                  id v217 = v93;
                  v218 = self;
                  double v219 = v160;
                  +[UIView performWithoutAnimation:v216];
                  v166 = [(UIView *)self->_containerView _containingScrollView];
                  [v166 contentOffset];
                  self->_containingScrollViewContentOffset.x = v167;
                  self->_containingScrollViewContentOffset.y = v168;

                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0
                    && ((v188 | v96 | [v35 isNavigationBarHidden]) & 1) == 0)
                  {
                    [(UISearchDisplayControllerContainerView *)self->_containerView collapseTopView];
                  }
                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) == 0)
                  {
                    id v169 = [(UIView *)self->_searchBar _viewControllerForAncestor];
                    id v170 = objc_loadWeakRetained(location);

                    if (v169 != v170) {
                      [(UISearchDisplayControllerContainerView *)self->_containerView collapseTopView];
                    }
                  }

LABEL_181:
                  if (v197)
                  {
                    v171 = [(UIView *)self->_tableView backgroundColor];
                    v172 = &self->_dimmingView;
                    if (v171) {
                      [(UIView *)self->_tableView backgroundColor];
                    }
                    else {
                    v176 = +[UIColor whiteColor];
                    }
                    [(UIView *)*v172 setBackgroundColor:v176];

                    [(UIView *)*v172 setAlpha:0.0];
                    uint64_t v175 = 0;
                  }
                  else
                  {
                    v173 = [(UISearchDisplayController *)self _dimmingViewColor];
                    v172 = &self->_dimmingView;
                    [(UIView *)self->_dimmingView setBackgroundColor:v173];

                    double v174 = 0.0;
                    if (!v4) {
                      [(UISearchDisplayController *)self _dimmingViewAlpha];
                    }
                    [(UIView *)self->_dimmingView setAlpha:v174];
                    uint64_t v175 = [(UISearchDisplayController *)self dimTableViewOnEmptySearchString] ^ 1;
                  }
                  [(UIView *)*v172 setHidden:v175];
                  if (v4)
                  {
                    if ([(UISearchDisplayController *)self _showsResultsForEmptyField])
                    {
                      [(UIView *)self->_dimmingView setHidden:1];
                      [(UISearchDisplayController *)self _setTableViewVisible:1 inView:0];
                      if (v200)
                      {
                        [(UIView *)self->_tableView setAlpha:0.0];
                        v215[0] = MEMORY[0x1E4F143A8];
                        v215[1] = 3221225472;
                        v215[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_15;
                        v215[3] = &unk_1E52D9F70;
                        v215[4] = self;
                        +[UIView animateWithDuration:v215 animations:0.25];
                      }
                      [(UISearchBar *)self->_searchBar _setMaskActive:0];
                    }
                    else
                    {
                      [(UISearchBar *)self->_searchBar _setMaskActive:0];
                      if ((v114 & 1) == 0) {
                        goto LABEL_199;
                      }
                    }
                  }
                  else if (!v114)
                  {
                    goto LABEL_199;
                  }
                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0) {
                    [(UISearchDisplayController *)self _hoistSearchBar];
                  }
LABEL_199:
                  v203[0] = MEMORY[0x1E4F143A8];
                  v203[1] = 3221225472;
                  v203[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_17;
                  v203[3] = &unk_1E52E94B8;
                  v203[4] = self;
                  BOOL v209 = v4;
                  id v177 = v35;
                  id v204 = v177;
                  BOOL v178 = v200;
                  BOOL v210 = v200;
                  id v179 = v93;
                  id v205 = v179;
                  id v180 = v115;
                  id v208 = v180;
                  BOOL v211 = (v191 & 8) != 0;
                  char v212 = v193;
                  BOOL v213 = v192;
                  id v181 = v190;
                  id v206 = v181;
                  id v182 = (id)v196;
                  id v207 = v182;
                  char v214 = v197;
                  v201[0] = MEMORY[0x1E4F143A8];
                  v201[1] = 3221225472;
                  v201[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_25;
                  v201[3] = &unk_1E52E0478;
                  BOOL v202 = v200;
                  v201[4] = self;
                  +[UIView conditionallyAnimate:v200 withAnimation:&__block_literal_global_122 layout:v203 completion:v201];
                  if (v4)
                  {
                    [(UISearchDisplayController *)self _disableParentScrollViews];
                    v183 = [(UIView *)self->_searchBar _screen];
                    [v21 addObserver:self selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v183];

                    v184 = [(UIView *)self->_searchBar _screen];
                    BOOL v178 = v200;
                    [v21 addObserver:self selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v184];
                  }
                  else
                  {
                    [v21 removeObserver:self name:@"UIKeyboardWillShowNotification" object:0];
                    [v21 removeObserver:self name:@"UIKeyboardWillHideNotification" object:0];
                    v184 = [(UISearchBar *)self->_searchBar searchField];
                    [v184 _clearBecomeFirstResponderWhenCapable];
                  }

                  *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
                  if (v178)
                  {
LABEL_205:

                    return;
                  }
LABEL_203:
                  if (![(UISearchBar *)self->_searchBar _containedInNavigationPalette]) {
                    [(UISearchDisplayController *)self showHideAnimationDidFinish];
                  }
                  goto LABEL_205;
                }
              }
              else
              {
                v164 = self->_searchBar;
                [(UIView *)v164 bounds];
                -[UIView convertRect:toView:](v164, "convertRect:toView:", v93);
                double v160 = v165;
              }
              int v114 = 0;
              v115 = 0;
              goto LABEL_174;
            }
            *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;
          }
          v147 = +[UIDevice currentDevice];
          uint64_t v148 = [v147 userInterfaceIdiom];

          if ((v148 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            [v35 setPretendNavBarHidden:1];
          }
          id v149 = objc_loadWeakRetained(location);
          id v150 = [v35 topViewController];

          if (v149 == v150)
          {
            [v35 _setNavigationBarHidesCompletelyOffscreen:1];
            double v151 = 0.0;
            if (v19) {
              double v151 = 0.25;
            }
            [v35 _setNavigationBarHidden:1 edgeIfNotNavigating:1 duration:v151];
          }
          goto LABEL_150;
        }
        if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
        {
          v107 = +[UIDevice currentDevice];
          uint64_t v108 = [v107 userInterfaceIdiom];

          if ((v108 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            [v35 setPretendNavBarHidden:0];
            [v35 setAvoidMovingNavBarOffscreenBeforeUnhiding:1];
          }
          *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
          double v109 = 0.0;
          if (v19) {
            double v109 = 0.25;
          }
          [v35 _setNavigationBarHidden:0 edgeIfNotNavigating:1 duration:v109];
          [v35 _setNavigationBarHidesCompletelyOffscreen:0];
          v110 = +[UIDevice currentDevice];
          uint64_t v111 = [v110 userInterfaceIdiom];

          v103 = &unk_1E52E8000;
          if ((v111 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            [v35 setAvoidMovingNavBarOffscreenBeforeUnhiding:0];
          }
          id v112 = objc_loadWeakRetained((id *)p_viewController);
          LOBYTE(v193) = [v35 _shouldNavigationBarInsetViewController:v112];

          v101 = &unk_1E52E8000;
          v102 = &unk_1E52E8000;
        }
        else
        {
          LOBYTE(v193) = 0;
          v101 = (void *)&unk_1E52E8000;
          v102 = (void *)&unk_1E52E8000;
          v103 = (void *)&unk_1E52E8000;
        }
        [(UISearchBar *)self->_searchBar _setBarPosition:self->_unactivatedBarPosition];
        v113 = [v35 navigationBar];
        [v113 _setHidesShadow:(*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1];

        [v21 removeObserver:self name:v103[237] object:v35];
        [v21 removeObserver:self name:v102[238] object:v35];
        [v21 removeObserver:self name:v101[239] object:v35];
LABEL_103:
        int v114 = 0;
        v115 = 0;
        goto LABEL_181;
      }
    }
    [(UISearchBar *)self->_searchBar _setShowsScopeBar:v4 animateOpacity:1];
    goto LABEL_53;
  }
  if (visible)
  {
    if ([(UISearchDisplayController *)self _isSearchBarInBar])
    {
      if ([(UISearchBar *)self->_searchBar isSearchResultsButtonSelected])
      {
        BOOL v7 = [(UISearchBar *)self->_searchBar searchField];
        int v8 = [v7 isEditing];

        if (v8)
        {
          popoverController = self->_popoverController;
          id v199 = [(UISearchBar *)self->_searchBar searchField];
          [v199 bounds];
          double v11 = v10;
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          id v18 = [(UISearchBar *)self->_searchBar searchField];
          -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v18, 3, 1, v11, v13, v15, v17);
        }
      }
    }
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && [*(id *)(*(void *)(a1 + 32) + 128) isHidden]) {
    [*(id *)(*(void *)(a1 + 32) + 128) setHidden:0];
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 128);
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  return [v2 setAlpha:v3];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    [*(id *)(*(void *)(result + 32) + 128) setHidden:1];
    v2 = *(void **)(*(void *)(v1 + 32) + 128);
    return [v2 removeFromSuperview];
  }
  return result;
}

void __48__UISearchDisplayController_setActive_animated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && [*(id *)(*(void *)(a1 + 32) + 128) isHidden]) {
    [*(id *)(*(void *)(a1 + 32) + 128) setHidden:0];
  }
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:v2];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if ((*(_WORD *)(v3 + 256) & 8) != 0)
    {
      BOOL v4 = *(void **)(v3 + 128);
      [*(id *)(a1 + 40) bounds];
      [v4 updateTopViewHeight:1 animateUpdate:CGRectGetHeight(v10)];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(id *)(a1 + 48);
    int v6 = *(unsigned __int8 *)(a1 + 56);
    id v8 = v5;
    if (*(unsigned char *)(a1 + 56))
    {
      if ([v5 isIndexHidden]) {
        __int16 v7 = 0;
      }
      else {
        __int16 v7 = 4;
      }
      *(_WORD *)(*(void *)(a1 + 32) + 256) = *(_WORD *)(*(void *)(a1 + 32) + 256) & 0xFFFB | v7;
    }
    else if ((*(_WORD *)(*(void *)(a1 + 32) + 256) & 4) == 0)
    {
LABEL_18:

      return;
    }
    [v8 setIndexHiddenForSearch:v6 != 0];
    id v5 = v8;
    goto LABEL_18;
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 128) setHidden:1];
    [*(id *)(*(void *)(a1 + 32) + 128) removeFromSuperview];
    [*(id *)(a1 + 40) setVisibleWhenPinningBarIsHidden:*(unsigned __int8 *)(a1 + 48)];
  }
  double v2 = *(void **)(a1 + 32);
  return [v2 _sendDelegateDidBeginDidEndSearch];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setHidden:1];
  double v2 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_8;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v4 animations:v2];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_9(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _dimmingViewAlpha];
  }
  else {
    double v2 = 0.0;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v3 setAlpha:v2];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_10(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_WORD *)(v1 + 256) & 0x200) == 0) {
    return [*(id *)(v1 + 32) _setShowsCancelButton:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_11(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(*(void *)(result + 32) + 32) _allowCursorToAppear:1];
  }
  return result;
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_12(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) updateTopAttributeConstant:*(double *)(a1 + 40) - *(double *)(a1 + 48)];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_13(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) updateTopAttributeConstant:*(double *)(a1 + 40)];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 128)];
  [*(id *)(*(void *)(a1 + 40) + 128) updateTopAttributeConstant:*(double *)(a1 + 48)];
  double v2 = *(void **)(*(void *)(a1 + 40) + 128);
  return [v2 layoutIfNeeded];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_15(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:0.25 completion:0.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_17(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) _setShadowVisibleIfNecessary:*(unsigned __int8 *)(a1 + 80)];
  if (*(unsigned char *)(a1 + 80) && [*(id *)(*(void *)(a1 + 32) + 32) isTranslucent]) {
    [*(id *)(*(void *)(a1 + 32) + 32) _setScopeBarHidden:0];
  }
  double v2 = (void *)UIApp;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) window];
  if ((unint64_t)([v2 _safeInterfaceOrientationForWindowIfExists:v3] - 3) > 1)
  {
  }
  else
  {
    int v4 = [*(id *)(*(void *)(a1 + 32) + 32) _allowsInlineScopeBar];

    if (v4) {
      [*(id *)(*(void *)(a1 + 32) + 32) _setShowsScopeBar:*(unsigned __int8 *)(a1 + 80) animateOpacity:1];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) searchBarStyle] == 2)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      id v5 = [*(id *)(a1 + 40) navigationBar];
      uint64_t v6 = [v5 _backgroundBackdropStyle];

      if (!v6) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) _updateBackgroundToBackdropStyle:v6];
  }
LABEL_14:
  [*(id *)(*(void *)(a1 + 32) + 32) sizeToFit];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 128);
  [*(id *)(v7 + 32) bounds];
  double Height = CGRectGetHeight(v36);
  [*(id *)(a1 + 32) _additionalNonCollapsingHeightAboveSearchBar];
  [v8 updateTopViewHeight:1 animateUpdate:Height + v10];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 81);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_19;
    v34[3] = &unk_1E52D9F98;
    v34[4] = *(void *)(a1 + 32);
    id v35 = *(id *)(a1 + 48);
    +[UIView conditionallyAnimate:v11 withAnimation:&__block_literal_global_124 layout:v34 completion:0];
    uint64_t v12 = *(void *)(a1 + 72);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(unsigned char *)(a1 + 82) && *(unsigned char *)(a1 + 83)) {
        [*(id *)(*(void *)(a1 + 32) + 128) updateTopAttributeConstant:0.0];
      }
    }
    else if (*(unsigned char *)(a1 + 82) && !*(unsigned char *)(a1 + 83))
    {
      double v29 = [*(id *)(a1 + 40) navigationBar];
      [v29 bounds];
      double v30 = CGRectGetHeight(v38);

      [*(id *)(*(void *)(a1 + 32) + 128) adjustTopAttributeConstantByDelta:v30];
    }
  }
  if (!*(unsigned char *)(a1 + 80))
  {
    double v16 = [*(id *)(*(void *)(a1 + 32) + 32) searchField];
    [v16 _setSuffix:0 withColor:0];

    if (*(unsigned char *)(a1 + 84))
    {
      if (([*(id *)(*(void *)(a1 + 32) + 16) isHidden] & 1) == 0
        && ([*(id *)(*(void *)(a1 + 32) + 32) _allowsInlineScopeBar] & 1) == 0)
      {
        [*(id *)(a1 + 32) _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:0];
      }
    }
  }
  [*(id *)(a1 + 56) _setAutomaticContentOffsetAdjustmentEnabled:1];
  double v13 = *(void **)(a1 + 64);
  if (v13)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      if ([v13 isIndexHidden]) {
        __int16 v14 = 0;
      }
      else {
        __int16 v14 = 4;
      }
      *(_WORD *)(*(void *)(a1 + 32) + 256) = *(_WORD *)(*(void *)(a1 + 32) + 256) & 0xFFFB | v14;
      [*(id *)(a1 + 64) setIndexHiddenForSearch:1];
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if ((*(_WORD *)(v17 + 256) & 4) == 0) {
        goto LABEL_36;
      }
      [v13 setIndexHiddenForSearch:0];
      uint64_t v15 = *(void *)(a1 + 64);
    }
    [*(id *)(*(void *)(a1 + 32) + 32) _updateInsetsForTableView:v15];
    uint64_t v17 = *(void *)(a1 + 32);
LABEL_36:
    [*(id *)(v17 + 32) bounds];
    double v18 = CGRectGetHeight(v37);
    double v19 = 0.0;
    if (*(unsigned char *)(a1 + 80) && *(unsigned char *)(a1 + 83))
    {
      [*(id *)(a1 + 32) _statusBarHeight];
      double v19 = v20;
    }
    uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 32);
    CGRect v22 = [*(id *)(a1 + 64) tableHeaderView];
    if (v21 == v22)
    {
      double v23 = v18 + v19;
      [*(id *)(a1 + 64) heightForTableHeaderViewHiding];
      double v25 = v24;

      if (v23 != v25) {
        [*(id *)(a1 + 64) _tableHeaderHeightDidChangeToHeight:v23];
      }
    }
    else
    {
    }
    if (*(unsigned char *)(a1 + 81)) {
      [*(id *)(a1 + 64) layoutBelowIfNeeded];
    }
    [*(id *)(a1 + 32) _updatePinnedSearchBar];
  }
  uint64_t v26 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v26 + 256) & 0x200) == 0)
  {
    [*(id *)(v26 + 32) _setShowsCancelButton:*(unsigned __int8 *)(a1 + 80)];
    uint64_t v26 = *(void *)(a1 + 32);
  }
  [*(id *)(v26 + 32) layoutBelowIfNeeded];
  if (*(unsigned char *)(a1 + 85))
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_20;
    v32[3] = &unk_1E52D9F70;
    uint64_t v33 = *(void *)(a1 + 32);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_21;
    v31[3] = &unk_1E52E0000;
    v31[4] = v33;
    v31[5] = 0x3FC0000000000000;
    return +[UIView animateWithDuration:32 delay:v32 options:v31 animations:0.125 completion:0.0];
  }
  else
  {
    if (*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 32) _dimmingViewAlpha];
    }
    else {
      double v28 = 0.0;
    }
    return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:v28];
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:0.0 completion:0.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_19(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 40) bounds];
  return objc_msgSend(v1, "setFrame:");
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_20(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
}

void __48__UISearchDisplayController_setActive_animated___block_invoke_21(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.0];
  double v2 = *(double *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_22;
  v9[3] = &unk_1E52D9F70;
  uint64_t v10 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_23;
  v8[3] = &unk_1E52DC3A0;
  v8[4] = v10;
  +[UIView animateWithDuration:0 delay:v9 options:v8 animations:v2 completion:0.0];
  uint64_t v3 = [*(id *)(a1 + 32) _topShadowView];
  int v4 = v3;
  if (v3)
  {
    double v5 = *(double *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_24;
    v6[3] = &unk_1E52D9F70;
    id v7 = v3;
    +[UIView animateWithDuration:v6 animations:v5];
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_22(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_23(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeFromSuperview];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_25(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) showHideAnimationDidFinish];
  }
  return result;
}

- (void)setActive:(BOOL)active
{
}

- (BOOL)isActive
{
  return *(_WORD *)&self->_searchDisplayControllerFlags & 1;
}

- (void)_updatePinnedSearchBar
{
  id v3 = [(UISearchDisplayController *)self _containingTableView];
  if ([v3 _pinsTableHeaderView]
    && (~*(_WORD *)&self->_searchDisplayControllerFlags & 3) == 0
    && ![(UISearchDisplayController *)self _showsResultsForEmptyField])
  {
    [v3 _rectForTableHeaderView];
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
  }
}

- (double)_updateNavigationPalette
{
  id v3 = [(UISearchBar *)self->_searchBar prompt];
  if (v3)
  {

LABEL_4:
    [(UIView *)self->_searchBar bounds];
    return CGRectGetHeight(*(CGRect *)&v4);
  }
  if ([(UISearchBar *)self->_searchBar _scopeBarIsVisible]) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  uint64_t v10 = [WeakRetained navigationController];
  uint64_t v11 = [v10 existingPaletteForEdge:2];

  if (v11)
  {
    uint64_t v12 = [WeakRetained navigationController];
    +[UINavigationBar defaultSizeForOrientation:](UINavigationBar, "defaultSizeForOrientation:", [v12 interfaceOrientation]);
    double v14 = v13;
    double v16 = v15;

    [v11 frame];
    if (v18 != v14 || v17 != v16)
    {
      [v11 frame];
      objc_msgSend(v11, "setFrame:");
      searchBar = self->_searchBar;
      [v11 bounds];
      -[UISearchBar setFrame:](searchBar, "setFrame:");
      [(UISearchBar *)self->_searchBar setNeedsLayout];
      [(UIView *)self->_searchBar layoutIfNeeded];
    }
    [v11 frame];
    double Height = CGRectGetHeight(v22);
  }
  else
  {
    double Height = -1.0;
  }

  return Height;
}

- (void)_keyboardWillShow:(id)a3
{
  tableView = self->_tableView;
  id v5 = [a3 userInfo];
  [(UITableView *)tableView _adjustForAutomaticKeyboardInfo:v5 animated:1 lastAdjustment:&self->_lastKeyboardAdjustment];
}

- (void)_keyboardWillHide:(id)a3
{
  tableView = self->_tableView;
  id v5 = [a3 userInfo];
  [(UITableView *)tableView _adjustForAutomaticKeyboardInfo:v5 animated:1 lastAdjustment:&self->_lastKeyboardAdjustment];
}

- (void)windowWillAnimateRotation:(id)a3
{
  id v25 = a3;
  popoverController = self->_popoverController;
  if (popoverController && [(UIPopoverController *)popoverController isPopoverVisible])
  {
    *(_WORD *)&self->_searchDisplayControllerFlags |= 0x100u;
    [(UISearchDisplayController *)self setActive:0 animated:0];
  }
  if ([(UISearchDisplayController *)self _searchBarInNavigationControllerComponent])
  {
    if ([(UISearchBar *)self->_searchBar _containedInNavigationPalette])
    {
      [(UISearchDisplayController *)self _updateNavigationPalette];
      double Height = v5;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      double v17 = [WeakRetained navigationController];
      double v18 = [v17 navigationBar];
      [v18 frame];
      double Height = CGRectGetHeight(v28);
    }
    if (Height < 0.0) {
      goto LABEL_24;
    }
    if ([(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3) {
      goto LABEL_24;
    }
    [(UISearchDisplayControllerContainerView *)self->_containerView updateTopViewHeight:Height];
    [(UISearchDisplayController *)self _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:0];
    double v19 = [(UISearchBar *)self->_searchBar searchField];
    double v20 = [v19 _clearButton];
    [v20 setImage:0 forState:0];

    [(UISearchBar *)self->_searchBar setNeedsLayout];
    [(UIView *)self->_searchBar layoutIfNeeded];
    uint64_t v21 = [(UISearchBar *)self->_searchBar searchField];
    [v21 _updateButtons];

    if ([(UISearchDisplayController *)self navigationBarSearchFieldSizing]) {
      goto LABEL_24;
    }
    id v8 = [(UISearchDisplayController *)self navigationItem];
    objc_msgSend(v8, "set_titleViewWidthForAnimations:", 14433663.0);
    [v8 updateNavigationBarButtonsAnimated:1];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_viewController);
    id v8 = [v7 _existingView];

    [(UIView *)self->_searchBar bounds];
    double v10 = v9;
    [(UIView *)self->_searchBar sizeToFit];
    containerView = self->_containerView;
    [(UIView *)self->_searchBar bounds];
    [(UISearchDisplayControllerContainerView *)containerView updateTopViewHeight:CGRectGetHeight(v27)];
    if (v8)
    {
      uint64_t v12 = [(UISearchDisplayController *)self _containingTableView];
      if (v12)
      {
        double v13 = v12;
        searchBar = self->_searchBar;
        double v15 = [v12 tableHeaderView];
        if (searchBar == v15)
        {
          [(UIView *)self->_searchBar bounds];
          double v23 = v22;

          if (v23 != v10)
          {
            [(UIView *)self->_searchBar bounds];
            [v13 _tableHeaderHeightDidChangeToHeight:v24];
          }
        }
        else
        {
        }
        [v13 layoutBelowIfNeeded];
        [(UISearchDisplayController *)self _updatePinnedSearchBar];
      }
    }
    [(UISearchBar *)self->_searchBar _setBackgroundLayoutNeedsUpdate];
    [(UIView *)self->_searchBar layoutBelowIfNeeded];
    if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0
      && ![(UISearchDisplayController *)self _isSearchBarInBar])
    {
      [(UISearchDisplayController *)self _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:0];
    }
    [(UISearchDisplayController *)self _updateSearchBarMaskIfNecessary];
  }

LABEL_24:
  [(UIView *)self->_noResultsLabel setContentMode:4];
  [(UISearchDisplayController *)self _updateNoSearchResultsMessageVisiblity];
}

- (void)windowDidRotate:(id)a3
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 0x100) != 0)
  {
    [(UISearchDisplayController *)self setActive:1 animated:1];
    __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  }
  *(_WORD *)&self->___int16 searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFEFF;
  noResultsLabel = self->_noResultsLabel;
  [(UIView *)noResultsLabel setContentMode:3];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  if ([(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
    && [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 2
    && ![(UISearchDisplayController *)self isActive])
  {
    uint64_t v4 = [(UISearchDisplayController *)self navigationItem];
    double v5 = [v4 titleView];
    [v5 frame];
    self->_searchFieldInNavigationBarFrame.origin.x = v6;
    self->_searchFieldInNavigationBarFrame.origin.y = v7;
    self->_searchFieldInNavigationBarFrame.size.width = v8;
    self->_searchFieldInNavigationBarFrame.size.height = v9;

    objc_msgSend(v4, "set_titleViewWidthForAnimations:", 14433663.0);
    [v4 updateNavigationBarButtonsAnimated:1];
  }
  [(UISearchDisplayController *)self setActive:1 animated:1];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(UISearchDisplayDelegate *)self->_delegate _shouldDeactivateOnCancelButtonClicked])
  {
    if ([(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
      && [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 2)
    {
      id v21 = [(UISearchDisplayController *)self navigationItem];
      uint64_t v4 = [v21 titleView];
      [v4 frame];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      [(UISearchDisplayController *)self setActive:0 animated:1];
      double v13 = [v21 titleView];
      [v13 frame];
      v25.origin.x = v14;
      v25.origin.y = v15;
      v25.size.width = v16;
      v25.size.height = v17;
      v23.origin.x = v6;
      v23.origin.y = v8;
      v23.size.width = v10;
      v23.size.height = v12;
      BOOL v18 = CGRectEqualToRect(v23, v25);

      if (v18)
      {
        objc_msgSend(v21, "set_titleViewWidthForAnimations:", self->_searchFieldInNavigationBarFrame.size.width);
      }
      else
      {
        double v19 = [v21 titleView];
        [v19 frame];
        objc_msgSend(v21, "set_titleViewWidthForAnimations:", CGRectGetWidth(v24));
      }
      CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_searchFieldInNavigationBarFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_searchFieldInNavigationBarFrame.size = v20;
      [v21 updateNavigationBarButtonsAnimated:1];
    }
    else
    {
      [(UISearchDisplayController *)self setActive:0 animated:1];
    }
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(UISearchBar *)self->_searchBar searchField];
  [v3 resignFirstResponder];
}

- (void)searchBarResultsListButtonClicked:(id)a3
{
  [(UISearchBar *)self->_searchBar setSearchResultsButtonSelected:(*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0];
  BOOL v4 = (*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0;
  [(UISearchDisplayController *)self setActive:v4 animated:1];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 2) == 0)
  {
    id v10 = v5;
    CGFloat v6 = [(UISearchDisplayController *)self searchResultsTableView];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self shouldReloadTableForSearchString:v10])
    {
      [v6 reloadData];
    }
    BOOL v7 = [v10 length]
      || [(UIPopoverController *)self->_popoverController isPopoverVisible]
      || [(UISearchDisplayController *)self _showsResultsForEmptyField];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    double v9 = [WeakRetained view];
    [(UISearchDisplayController *)self _setTableViewVisible:v7 inView:v9];

    id v5 = v10;
  }
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v7 = a3;
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0) {
    [(UISearchBar *)self->_searchBar becomeFirstResponder];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self shouldReloadTableForSearchScope:a4])
  {
    CGFloat v6 = [(UISearchDisplayController *)self searchResultsTableView];
    [v6 reloadData];
  }
}

- (void)_clearSavedSelectedCellsWeUsedWhenHedgingOurBets
{
  savedSelectedCellsWhenViewWillAppear = self->_savedSelectedCellsWhenViewWillAppear;
  if (savedSelectedCellsWhenViewWillAppear)
  {
    self->_savedSelectedCellsWhenViewWillAppear = 0;
  }
}

- (void)_saveSelectedRowsInCaseViewDoesNotReallyAppear
{
  [(UISearchDisplayController *)self _clearSavedSelectedCellsWeUsedWhenHedgingOurBets];
  id v6 = [(UISearchDisplayController *)self searchResultsTableView];
  id v3 = [v6 indexPathsForSelectedRows];
  BOOL v4 = (NSArray *)[v3 copy];
  savedSelectedCellsWhenViewWillAppear = self->_savedSelectedCellsWhenViewWillAppear;
  self->_savedSelectedCellsWhenViewWillAppear = v4;
}

- (void)_restoreSelectedCellsInCaseViewDidNotReallyAppear
{
  if (self->_savedSelectedCellsWhenViewWillAppear)
  {
    id v3 = [(UISearchDisplayController *)self searchResultsTableView];
    [v3 _selectRowsAtIndexPaths:self->_savedSelectedCellsWhenViewWillAppear animated:0 scrollPosition:0 notifyDelegate:0];

    [(UISearchDisplayController *)self _clearSavedSelectedCellsWeUsedWhenHedgingOurBets];
  }
}

- (void)navigationControllerWillShowViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v4 object];

  id v7 = [v5 valueForKey:0x1ED10DDA0];
  id v8 = [v5 valueForKey:0x1ED10DDC0];
  double v9 = [v5 valueForKey:0x1ED10DDE0];
  uint64_t v10 = [v9 BOOLValue];

  double v11 = [v6 transitionCoordinator];
  CGFloat v12 = v11;
  double v13 = 0.0;
  if (v10)
  {
    if (v11)
    {
      [v11 transitionDuration];
      double v13 = v14;
    }
    else
    {
      double v13 = 0.25;
    }
  }
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  if (searchDisplayControllerFlags)
  {
    if (v8 == WeakRetained)
    {
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
      {
        if ([(UISearchBar *)self->_searchBar _containedInNavigationPalette])
        {
          attachedNavigationPalette = self->_attachedNavigationPalette;
          if (attachedNavigationPalette)
          {
            [(_UINavigationControllerPalette *)attachedNavigationPalette setVisibleWhenPinningBarIsHidden:1];
            [v6 attachPalette:self->_attachedNavigationPalette isPinned:0];
            [(_UINavigationControllerPalette *)self->_attachedNavigationPalette setPinningBarShadowIsHidden:(*(_WORD *)&self->_searchDisplayControllerFlags & 0x4000) == 0];
            if ([v12 initiallyInteractive])
            {
              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke;
              v30[3] = &unk_1E52DB270;
              v31 = v6;
              uint64_t v32 = self;
              [v12 notifyWhenInteractionEndsUsingBlock:v30];
              CGRect v24 = v31;
            }
            else
            {
              CGRect v24 = self->_attachedNavigationPalette;
              self->_attachedNavigationPalette = 0;
            }
          }
        }
        [v6 _setNavigationBarHidden:1 edgeIfNotNavigating:1 duration:v13];
        CGRect v25 = +[UIDevice currentDevice];
        uint64_t v26 = [v25 userInterfaceIdiom];

        if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && ![(UISearchDisplayController *)self _searchBarInNavigationControllerComponent])
        {
          [v6 _sendNavigationBarToBack];
        }
        if ([(UISearchBar *)self->_searchBar barPosition] == 3)
        {
          CGRect v27 = [v6 navigationBar];
          [v27 _setHidesShadow:(*(_WORD *)&self->_searchDisplayControllerFlags & 0x4000) == 0];
        }
      }
      if (v7)
      {
        if (v6 && [v6 isInteractiveTransition]) {
          [(UISearchDisplayController *)self _saveSelectedRowsInCaseViewDoesNotReallyAppear];
        }
        [(UITableView *)self->_tableView _deselectAllNonMultiSelectRowsAnimated:v10 notifyDelegate:0];
      }
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)&self->_viewController);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke_2;
      v28[3] = &unk_1E52E8B20;
      id v29 = v7;
      int v18 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)v17, v28);

      if (v18 && (*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
      {
        double v19 = +[UIDevice currentDevice];
        uint64_t v20 = [v19 userInterfaceIdiom];

        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
          [v6 setPretendNavBarHidden:0];
        }
        [v6 _setNavigationBarHidden:0 edgeIfNotNavigating:1 duration:v13];
        if ([(UISearchBar *)self->_searchBar _containedInNavigationPalette])
        {
          id v21 = [v6 existingPaletteForEdge:2];
          [v21 setVisibleWhenPinningBarIsHidden:0];
          [v21 setPinningBarShadowIsHidden:(*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1];
          if ([v21 isAttached] && (objc_msgSend(v21, "isPinned") & 1) == 0) {
            objc_storeStrong((id *)&self->_attachedNavigationPalette, v21);
          }
        }
        if ([(UISearchBar *)self->_searchBar barPosition] == 3)
        {
          double v22 = [v6 navigationBar];
          [v22 _setHidesShadow:(*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1];
        }
      }
    }
  }
  else if (v8 == WeakRetained {
         && [(UISearchBar *)self->_searchBar _containedInNavigationPalette])
  }
  {
    [(UISearchDisplayController *)self _updateNavigationPalette];
  }
}

void __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    [*(id *)(a1 + 32) detachPalette:*(void *)(*(void *)(a1 + 40) + 200)];
    id v3 = *(void **)(*(void *)(a1 + 40) + 200);
    [v3 setVisibleWhenPinningBarIsHidden:0];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 200);
    *(void *)(v4 + 200) = 0;
  }
}

BOOL __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (void)navigationControllerDidShowViewController:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v7 = [v4 valueForKey:0x1ED10DDC0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (v7 == WeakRetained) {
    [(UISearchDisplayController *)self _clearSavedSelectedCellsWeUsedWhenHedgingOurBets];
  }
  if (*(_WORD *)&self->_searchDisplayControllerFlags)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_viewController);

    if (v7 == v6) {
      [(UITableView *)self->_tableView flashScrollIndicators];
    }
  }
}

- (void)navigationControllerDidCancelShowingViewController:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v7 = [v4 valueForKey:0x1ED10DDC0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v6 = v7;
  if (v7 == WeakRetained)
  {
    [(UISearchDisplayController *)self _restoreSelectedCellsInCaseViewDidNotReallyAppear];
    id v6 = v7;
  }
}

- (void)_updateNoSearchResultsMessageVisiblity
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 0x20) != 0)
  {
    int v4 = [(UITableView *)self->_tableView numberOfSections];
    if (v4 >= 1)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      uint64_t v7 = v4;
      do
        v6 += [(UITableView *)self->_tableView numberOfRowsInSection:v5++];
      while (v7 != v5);
      if (v6)
      {
LABEL_12:
        noResultsLabel = self->_noResultsLabel;
        [(UIView *)noResultsLabel removeFromSuperview];
        return;
      }
    }
  }
  else if ((searchDisplayControllerFlags & 0x10) == 0)
  {
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_12;
  }
  [(UITableView *)self->_tableView _offsetForNoResultsMessage];
  double v9 = v8;
  [(UIView *)self->_tableView bounds];
  double v11 = round(v10);
  [(UITableView *)self->_tableView rowHeight];
  double v13 = v12;
  [(UISearchDisplayController *)self _setupNoResultsLabelIfNecessary];
  -[UILabel setFrame:](self->_noResultsLabel, "setFrame:", 0.0, v9, v11, v13);
  tableView = self->_tableView;
  CGFloat v15 = self->_noResultsLabel;
  [(UIView *)tableView addSubview:v15];
}

- (void)_managedTableViewDidScroll
{
  if ([(UIScrollView *)self->_tableView isDragging]
    && ![(UIScrollView *)self->_tableView isDecelerating]
    && UIKeyboardAutomaticIsOnScreen())
  {
    [(UISearchBar *)self->_searchBar resignFirstResponder];
    id v3 = [(UIView *)self->_searchBar keyboardSceneDelegate];
    if (([v3 automaticAppearanceEnabled] & 1) == 0) {
      [v3 forceOrderOutAutomaticAnimated:1];
    }
  }
}

- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4
{
  if (a4 == 1) {
    [(UISearchDisplayController *)self setActive:0 animated:0];
  }
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  if ([(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
    && [(UISearchDisplayController *)self navigationBarSearchFieldSizing] == 3)
  {
    [(UISearchDisplayController *)self _animateNavigationBarSearchBarAppearance:0];
  }
  return 1;
}

- (UITableView)searchResultsTableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    int v4 = (objc_class *)objc_opt_class();
    if (objc_opt_respondsToSelector()) {
      int v4 = (objc_class *)[(UISearchDisplayDelegate *)self->_delegate _resultsTableViewClass];
    }
    id v5 = [v4 alloc];
    int v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", self->_searchResultsTableViewStyle, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = self->_tableView;
    self->_tableView = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewDataSource);
    [(UITableView *)self->_tableView setDataSource:WeakRetained];

    id v9 = objc_loadWeakRetained((id *)&self->_tableViewDelegate);
    [(UITableView *)self->_tableView setDelegate:v9];

    [(UIView *)self->_tableView setAutoresizingMask:18];
    double v10 = +[UIColor tableBackgroundColor];
    [(UITableView *)self->_tableView setBackgroundColor:v10];

    if (objc_opt_respondsToSelector()) {
      [(UITableView *)self->_tableView setController:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(UISearchDisplayDelegate *)self->_delegate searchDisplayController:self didLoadSearchResultsTableView:self->_tableView];
    }
    [(UITableView *)self->_tableView rowHeight];
    tableView = self->_tableView;
    if (v11 == -1.0)
    {
      [(UITableView *)tableView setRowHeight:44.0];
      tableView = self->_tableView;
    }
  }
  return tableView;
}

- (void)setSearchResultsDataSource:(id)searchResultsDataSource
{
  id v5 = searchResultsDataSource;
  objc_storeWeak((id *)&self->_tableViewDataSource, v5);
  tableView = self->_tableView;
  if (tableView) {
    [(UITableView *)tableView setDataSource:v5];
  }
}

- (void)setSearchResultsDelegate:(id)searchResultsDelegate
{
  id v5 = searchResultsDelegate;
  objc_storeWeak((id *)&self->_tableViewDelegate, v5);
  tableView = self->_tableView;
  if (tableView) {
    [(UITableView *)tableView setDelegate:v5];
  }
}

- (void)setNoResultsMessageVisible:(BOOL)a3
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 16;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFEF | v4;
    [(UISearchDisplayController *)self _updateNoSearchResultsMessageVisiblity];
  }
}

- (BOOL)noResultsMessageVisible
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 4) & 1;
}

- (void)setAutomaticallyShowsNoResultsMessage:(BOOL)a3
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 32;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFDF | v4;
    [(UISearchDisplayController *)self _updateNoSearchResultsMessageVisiblity];
  }
}

- (BOOL)automaticallyShowsNoResultsMessage
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 5) & 1;
}

- (void)setNoResultsMessage:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_noResultsMessage, a3);
  noResultsLabel = self->_noResultsLabel;
  if (noResultsLabel)
  {
    int v6 = [(UISearchDisplayController *)self noResultsMessage];
    [(UILabel *)noResultsLabel setText:v6];
  }
}

- (NSString)noResultsMessage
{
  noResultsMessage = self->_noResultsMessage;
  if (noResultsMessage)
  {
    id v3 = noResultsMessage;
  }
  else
  {
    _UINSLocalizedStringWithDefaultValue(@"No Results", @"No Results");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isNavigationBarHidingEnabled
{
  $8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = self->_searchDisplayControllerFlags;
  if ((*(_WORD *)&searchDisplayControllerFlags & 0x400) == 0)
  {
    __int16 v4 = +[UIDevice currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    $8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = self->_searchDisplayControllerFlags;
  }
  return (*(unsigned int *)&searchDisplayControllerFlags >> 6) & 1;
}

- (void)setNavigationBarHidingEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFFBF | v3;
}

- (void)_setAllowDisablingNavigationBarHiding:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFBFF | v3;
}

- (BOOL)_allowDisablingNavigationBarHiding
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 10) & 1;
}

- (void)setDimTableViewOnEmptySearchString:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFF7F | v3;
}

- (BOOL)dimTableViewOnEmptySearchString
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 7) & 1;
}

- (void)_clearViewController
{
}

- (BOOL)_isCancelButtonManagementDisabled
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 9) & 1;
}

- (void)_setCancelButtonManagementDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFDFF | v3;
}

- (id)_noResultsMessageLabel
{
  [(UISearchDisplayController *)self _setupNoResultsLabelIfNecessary];
  noResultsLabel = self->_noResultsLabel;
  return noResultsLabel;
}

- (void)_watchContainingTableViewForScrolling:(BOOL)a3
{
  BOOL v3 = a3;
  id v19 = [(UISearchDisplayController *)self _containingTableView];
  if ([(UISearchDisplayController *)self _searchBarInNavigationControllerComponent])
  {
    uint64_t v5 = [(UIView *)self->_containerView _containingScrollView];
    if (!v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (!v3)
    {
LABEL_3:
      BOOL v6 = v19;
      if (v19 || (BOOL v6 = v5) != 0) {
        [v6 _removeScrollViewScrollObserver:self->_didScrollDelegate];
      }
      didScrollDelegate = self->_didScrollDelegate;
      self->_didScrollDelegate = 0;

      goto LABEL_25;
    }
  }
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 2) != 0
    || (searchDisplayControllerFlags & 1) != 0
    || !v19
    || ([v19 _pinsTableHeaderView] & 1) != 0
    || [(UISearchDisplayController *)self displaysSearchBarInNavigationBar])
  {
    BOOL v9 = [(UISearchDisplayController *)self _searchBarInNavigationControllerComponent];
    __int16 v10 = (__int16)self->_searchDisplayControllerFlags;
    if (!v9 || (v10 & 1) == 0 || !v5)
    {
      if ((v10 & 1) == 0) {
        goto LABEL_25;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      double v12 = [WeakRetained navigationController];
      id v13 = [v12 topViewController];
      id v14 = objc_loadWeakRetained((id *)&self->_viewController);

      if (v13 == v14) {
        goto LABEL_25;
      }
    }
  }
  if (!self->_didScrollDelegate)
  {
    CGFloat v15 = objc_alloc_init(_UISearchControllerDidScrollDelegate);
    CGFloat v16 = self->_didScrollDelegate;
    self->_didScrollDelegate = v15;

    [(_UISearchControllerDidScrollDelegate *)self->_didScrollDelegate setController:self];
  }
  if (v19)
  {
    -[_UISearchControllerDidScrollDelegate setScrollView:](self->_didScrollDelegate, "setScrollView:");
    id v17 = self->_didScrollDelegate;
    int v18 = v19;
  }
  else
  {
    if (!v5) {
      goto LABEL_25;
    }
    [(_UISearchControllerDidScrollDelegate *)self->_didScrollDelegate setScrollView:v5];
    id v17 = self->_didScrollDelegate;
    int v18 = v5;
  }
  [v18 _addScrollViewScrollObserver:v17];
LABEL_25:
}

- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4
{
  id v12 = a3;
  BOOL v6 = [v12 _tableHeaderBackgroundView];
  if (v6)
  {
    if ([v12 _usingCustomBackgroundView])
    {
      [v12 setTableHeaderBackgroundColor:0];
      tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
      self->_tableViewBackgroundHeaderView = 0;
    }
    else
    {
      int v8 = [v6 isHidden];
      if (a4 >= 0.0)
      {
        if ((v8 & 1) == 0) {
          [v6 setHidden:1];
        }
      }
      else
      {
        if (v8) {
          [v6 setHidden:0];
        }
        [v12 bounds];
        objc_msgSend(v6, "setFrame:");
        BOOL v9 = [v12 _refreshControl];
        __int16 v10 = v9;
        if (!v9 || ([v9 backgroundColor], (double v11 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          double v11 = +[UIColor colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
        }
        [v6 setBackgroundColor:v11];
      }
    }
  }
}

- (void)_updateSearchBarMaskIfNecessary
{
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 3) != 0) {
    return;
  }
  BOOL v3 = [(UIView *)self->_searchBar window];

  if (!v3
    || [(UISearchDisplayController *)self _searchBarInNavigationControllerComponent])
  {
    return;
  }
  __int16 v4 = [(UISearchDisplayController *)self _containingTableView];
  id v24 = v4;
  if (v4)
  {
    id v5 = v4;
    BOOL v6 = [v5 _refreshControl];
    goto LABEL_9;
  }
  uint64_t v7 = [(UIView *)self->_searchBar _containingScrollView];
  if (v7)
  {
    id v5 = (id)v7;
    BOOL v6 = 0;
LABEL_9:
    [(UIView *)self->_searchBar bounds];
    double Height = CGRectGetHeight(v26);
    [v5 contentInset];
    double v10 = v9;
    [v5 contentOffset];
    double v12 = v10 + v11;
    [(UIView *)self->_searchBar frame];
    double v14 = v12 - v13;
    if (v6 && ([v6 refreshControlState] == 2 || objc_msgSend(v6, "refreshControlState") == 3))
    {
      [v6 _refreshControlHeight];
      double v14 = v14 - v15;
    }
    CGFloat v16 = [(UIView *)self->_searchBar _screen];
    [v16 scale];
    double v18 = 1.0 / v17;

    double v19 = v14 + v18;
    if (v19 <= Height)
    {
      [(UIView *)self->_searchBar bounds];
      if (v19 > 0.0)
      {
        double Width = CGRectGetWidth(*(CGRect *)&v20);
        double v23 = Height - v19;
        double v20 = 0.0;
        double v21 = v19;
      }
    }
    else
    {
      double v20 = *MEMORY[0x1E4F1DB28];
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double Width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    -[UISearchBar _setMaskBounds:](self->_searchBar, "_setMaskBounds:", v20, v21, Width, v23);
    [(UISearchDisplayController *)self _updateTableHeaderBackgroundViewInTableView:v24 amountScrolledUnder:v19];
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v11 = a3;
  if (*(_WORD *)&self->_searchDisplayControllerFlags)
  {
    __int16 v4 = [(UIView *)self->_containerView window];

    if (v4)
    {
      id v5 = [(UIView *)self->_containerView _containingScrollView];
      [v5 contentOffset];
      double v7 = v6;
      double v9 = v8;

      if (v7 != self->_containingScrollViewContentOffset.x || v9 != self->_containingScrollViewContentOffset.y)
      {
        [(UIView *)self->_containerView frame];
        -[UIView setFrame:](self->_containerView, "setFrame:");
        self->_containingScrollViewContentOffset.x = v7;
        self->_containingScrollViewContentOffset.y = v9;
      }
    }
  }
  if (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
    && ![(UISearchBar *)self->_searchBar _containedInNavigationPalette])
  {
    [(UISearchDisplayController *)self _updateSearchBarMaskIfNecessary];
  }
}

- (BOOL)_searchBarShouldScrollToVisible:(id)a3
{
  if (*(_WORD *)&self->_searchDisplayControllerFlags)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v3 = [(UISearchDisplayController *)self _containingTableView];
    int v4 = [v3 _pinsTableHeaderView] ^ 1;
  }
  return v4;
}

- (void)_setShowsResultsForEmptyField:(BOOL)a3
{
  __int16 searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 2048;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchDisplayControllerFlags = searchDisplayControllerFlags & 0xF7FF | v4;
  }
}

- (BOOL)_showsResultsForEmptyField
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 11) & 1;
}

- (UINavigationItem)navigationItem
{
  if ([(UISearchDisplayController *)self displaysSearchBarInNavigationBar]
    && !self->_navigationItem)
  {
    BOOL v3 = [(UISearchBar *)self->_searchBar _searchDisplayControllerNavigationItem];
    navigationItem = self->_navigationItem;
    self->_navigationItem = v3;
  }
  id v5 = self->_navigationItem;
  return v5;
}

- (void)_configureContainerView
{
  BOOL v3 = [(UISearchDisplayController *)self displaysSearchBarInNavigationBar];
  containerView = self->_containerView;
  if (v3)
  {
    [(UIView *)containerView setHidden:1];
    [(UIView *)self->_containerView setAlpha:0.0];
    if ([(UISearchDisplayController *)self dimTableViewOnEmptySearchString])
    {
      [(UISearchDisplayController *)self _dimmingViewAlpha];
      -[UIView setAlpha:](self->_dimmingView, "setAlpha:");
      [(UIView *)self->_dimmingView setHidden:0];
    }
    if ([(UISearchDisplayController *)self _showsResultsForEmptyField])
    {
      [(UIView *)self->_dimmingView setHidden:1];
      tableView = self->_tableView;
      [(UIView *)tableView setHidden:0];
    }
  }
  else
  {
    [(UIView *)containerView setHidden:0];
    double v6 = self->_containerView;
    [(UIView *)v6 setAlpha:1.0];
  }
}

- (id)_containerView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    BOOL v4 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    double v6 = [WeakRetained view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    id v15 = objc_loadWeakRetained((id *)&self->_viewController);
    CGFloat v16 = [v15 view];
    double v17 = v16;
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&v38, 0, sizeof(v38));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v38);

    if (!IsIdentity)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_viewController);
      double v20 = [v19 view];
      objc_msgSend(v20, "convertRect:fromView:", 0, v8, v10, v12, v14);
      double v8 = v21;
      double v10 = v22;
      double v12 = v23;
      double v14 = v24;
    }
    CGRect v25 = [UISearchDisplayControllerContainerView alloc];
    [(UIView *)self->_searchBar bounds];
    CGRect v26 = -[UISearchDisplayControllerContainerView initWithFrame:topViewHeight:](v25, "initWithFrame:topViewHeight:", v8, v10, v12, v14, CGRectGetHeight(v40));
    CGRect v27 = self->_containerView;
    self->_containerView = v26;

    CGRect v28 = [_UISearchDisplayControllerDimmingView alloc];
    id v29 = [(UISearchDisplayControllerContainerView *)self->_containerView bottomView];
    [v29 bounds];
    double v30 = -[UIControl initWithFrame:](v28, "initWithFrame:");

    [(UIControl *)v30 addTarget:self action:sel_searchBarCancelButtonClicked_ forControlEvents:64];
    v31 = [(UISearchDisplayController *)self _dimmingViewColor];
    [(UIView *)v30 setBackgroundColor:v31];

    [(UISearchDisplayController *)self _dimmingViewAlpha];
    -[UIView setAlpha:](v30, "setAlpha:");
    [(UIView *)v30 setOpaque:0];
    [(UIView *)v30 setDeliversTouchesForGesturesToSuperview:0];
    [(UIView *)v30 setAutoresizingMask:18];
    uint64_t v32 = [(UISearchDisplayControllerContainerView *)self->_containerView bottomView];
    [v32 addSubview:v30];

    objc_storeStrong((id *)&self->_dimmingView, v30);
    uint64_t v33 = [(UISearchDisplayController *)self searchResultsTableView];
    [v33 setHidden:1];
    [v33 setAutoresizingMask:18];
    objc_storeStrong((id *)&self->_tableView, v33);
    if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0
      || [(UISearchDisplayController *)self _searchBarInNavigationControllerComponent])
    {
      id v34 = [(UISearchDisplayControllerContainerView *)self->_containerView behindView];
      [v34 bounds];
      objc_msgSend(v33, "setFrame:");

      id v35 = [(UISearchDisplayControllerContainerView *)self->_containerView behindView];
      [v35 addSubview:v33];
    }
    else
    {
      CGRect v36 = [(UISearchDisplayControllerContainerView *)self->_containerView bottomView];
      [v36 bounds];
      objc_msgSend(v33, "setFrame:");

      id v35 = [(UISearchDisplayControllerContainerView *)self->_containerView bottomView];
      [v35 insertSubview:v33 belowSubview:v30];
    }

    [(UISearchDisplayController *)self _configureContainerView];
    +[UIView setAnimationsEnabled:v4];

    containerView = self->_containerView;
  }
  return containerView;
}

- (void)_animateNavigationBarSearchBarAppearance:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [(UISearchBar *)self->_searchBar _animatedAppearanceBarButtonItem];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  double v8 = [(UISearchBar *)self->_searchBar _searchDisplayControllerNavigationItem];
  double v9 = [v8 rightBarButtonItems];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v9);
        }
        if (v12)
        {
          [v7 addObject:*(void *)(*((void *)&v57 + 1) + 8 * i)];
          char v12 = 1;
        }
        else
        {
          char v12 = [*(id *)(*((void *)&v57 + 1) + 8 * i) isEqual:v6];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v11);
  }

  id v15 = [v6 view];
  CGFloat v16 = [(UISearchBar *)self->_searchBar searchField];
  double v17 = v16;
  if (self->_animatingAppearanceNavigationSearchBarWidth == 0.0)
  {
    [v16 bounds];
    self->_animatingAppearanceNavigationSearchBardouble Width = CGRectGetWidth(v63);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_animatingAppearanceNavigationButton) {
    objc_storeStrong((id *)&self->_animatingAppearanceNavigationButton, a3);
  }
  [v17 frame];
  double v19 = v18;
  [v15 frame];
  double x = v64.origin.x;
  CGFloat y = v64.origin.y;
  double width = v64.size.width;
  CGFloat height = v64.size.height;
  double v24 = CGRectGetWidth(v64);
  animatingAppearanceNavigationSearchBardouble Width = self->_animatingAppearanceNavigationSearchBarWidth;
  if (v24 == v19 + animatingAppearanceNavigationSearchBarWidth)
  {
    double v34 = v24 + -36.0;
    double v35 = x + v34;
    double v36 = width - v34;
    [(UISearchDisplayController *)self setActive:0 animated:1];
    [(UIView *)self->_animatingAppearanceNavigationButton setHidden:0];
    [(UIView *)self->_animatingAppearanceNavigationButton setAlpha:0.0];
    CGRect v37 = [v17 _placeholderLabel];
    [v37 setIgnoresGeometryChanges:1];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_6;
    v44[3] = &unk_1E52E6160;
    id v29 = &v45;
    double v45 = v15;
    v46[2] = *(id *)&v35;
    v46[3] = *(id *)&y;
    v46[4] = *(id *)&v36;
    v46[5] = *(id *)&height;
    double v30 = v46;
    v46[0] = v17;
    v46[1] = self;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_7;
    v42[3] = &unk_1E52DA660;
    v42[4] = self;
    id v43 = v46[0];
    id v38 = v15;
    +[UIView animateWithDuration:v44 animations:v42 completion:0.35];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_8;
    v40[3] = &unk_1E52D9F70;
    id v41 = v7;
    id v39 = v7;
    +[UIView animateWithDuration:0 delay:v40 options:0 animations:0.1 completion:0.28];

    uint64_t v33 = v43;
  }
  else
  {
    double v26 = v19 + animatingAppearanceNavigationSearchBarWidth - v24;
    double v27 = x - v26;
    double v28 = width + v26;
    [v15 bounds];
    [v17 setFrame:v19];
    [v17 setHidden:0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke;
    v55[3] = &unk_1E52D9F70;
    id v29 = &v56;
    CGFloat v56 = v7;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_2;
    v47[3] = &unk_1E52E94E0;
    double v30 = &v48;
    double v48 = v15;
    double v51 = v27;
    CGFloat v52 = y;
    double v53 = v28;
    CGFloat v54 = height;
    id v49 = v17;
    v50 = self;
    id v31 = v7;
    id v32 = v15;
    +[UIView animateWithDuration:v55 animations:v47 completion:0.125];
    uint64_t v33 = v49;
  }
}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "view", (void)v7);
        [v6 setAlpha:0.0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_3;
  v6[3] = &unk_1E52E6160;
  id v7 = *(id *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 72);
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v11 = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_4;
  v5[3] = &unk_1E52DC3A0;
  v5[4] = v4;
  +[UIView animateWithDuration:v6 animations:v5 completion:0.25];
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) setAlpha:1.0];
  long long v2 = *(void **)(*(void *)(a1 + 48) + 208);
  return [v2 setAlpha:0.0];
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_5;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  +[UIView performWithoutAnimation:v3];
  [*(id *)(*(void *)(a1 + 32) + 208) setHidden:1];
  return [*(id *)(a1 + 32) setActive:1 animated:1];
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) setNeedsLayout];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 208);
  return [v2 layoutIfNeeded];
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) setAlpha:0.0];
  long long v2 = *(void **)(*(void *)(a1 + 48) + 208);
  return [v2 setAlpha:1.0];
}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 208);
  *(void *)(v2 + 208) = 0;

  [*(id *)(a1 + 40) setHidden:1];
  id v4 = [*(id *)(a1 + 40) _placeholderLabel];
  [v4 setIgnoresGeometryChanges:0];
}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_8(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "view", (void)v7);
        [v6 setAlpha:1.0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)setNavigationBarSearchFieldSizing:(unint64_t)a3
{
  double v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (a3 == 3 && (v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UISearchDisplayController.m" lineNumber:2488 description:@"UINavigationBarSearchFieldSizingAnimatedAppearance can only be used on iPad"];
  }
  self->_navigationBarSearchFieldSizing = a3;
}

- (void)_setDimmingOverlayColor:(id)a3
{
  id v5 = a3;
  dimmingOverlayColor = self->_dimmingOverlayColor;
  p_dimmingOverlayColor = &self->_dimmingOverlayColor;
  id v8 = v5;
  if (!-[UIColor isEqual:](dimmingOverlayColor, "isEqual:")) {
    objc_storeStrong((id *)p_dimmingOverlayColor, a3);
  }
}

- (id)_dimmingOverlayColor
{
  return self->_dimmingOverlayColor;
}

- (BOOL)_searchBarInNavigationControllerComponent
{
  if ([(UISearchDisplayController *)self displaysSearchBarInNavigationBar]) {
    return 1;
  }
  searchBar = self->_searchBar;
  return [(UISearchBar *)searchBar _containedInNavigationPalette];
}

- (BOOL)_shouldAccountForStatusBarHeight
{
  BOOL v4 = [(UISearchDisplayController *)self _isSearchBarInBar];
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    if ([WeakRetained edgesForExtendedLayout])
    {
      if ([(UISearchDisplayController *)self _containedInPopover])
      {
LABEL_7:
        id v6 = objc_loadWeakRetained((id *)&self->_viewController);
        uint64_t v7 = [v6 _popoverController];
        id v8 = [v7 _managingSplitViewController];
        BOOL v5 = v8 != 0;

        if (v4) {
          return v5;
        }
        goto LABEL_10;
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
LABEL_10:

    return v5;
  }
  if ([(UISearchDisplayController *)self _containedInPopover]) {
    goto LABEL_7;
  }
  return 1;
}

- (double)_statusBarHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained _statusBarHeightAdjustmentForCurrentOrientation];
  double v4 = v3;

  return v4;
}

- (BOOL)_containedInPopover
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  double v4 = [WeakRetained _popoverController];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_popoverController != 0;
  }

  return v5;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (UISearchDisplayDelegate *)delegate;
}

- (UIViewController)searchContentsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (id)searchResultsDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewDataSource);
  return WeakRetained;
}

- (id)searchResultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewDelegate);
  return WeakRetained;
}

- (NSString)searchResultsTitle
{
  return self->_resultsTitle;
}

- (void)setSearchResultsTitle:(NSString *)searchResultsTitle
{
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return self->_displaysSearchBarInNavigationBar;
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)displaysSearchBarInNavigationBar
{
  self->_displaysSearchBarInNavigationBar = displaysSearchBarInNavigationBar;
}

- (unint64_t)navigationBarSearchFieldSizing
{
  return self->_navigationBarSearchFieldSizing;
}

- (double)_activationGapHeight
{
  return self->__activationGapHeight;
}

- (void)set_activationGapHeight:(double)a3
{
  self->__activationGapdouble Height = a3;
}

- (double)_additionalNonCollapsingHeightAboveSearchBar
{
  return self->__additionalNonCollapsingHeightAboveSearchBar;
}

- (void)set_additionalNonCollapsingHeightAboveSearchBar:(double)a3
{
  self->__additionalNonCollapsingHeightAboveSearchBar = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableViewDelegate);
  objc_destroyWeak((id *)&self->_tableViewDataSource);
  objc_storeStrong((id *)&self->_didScrollDelegate, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundHeaderView, 0);
  objc_storeStrong((id *)&self->_dimmingOverlayColor, 0);
  objc_storeStrong((id *)&self->_animatingAppearanceNavigationButton, 0);
  objc_storeStrong((id *)&self->_attachedNavigationPalette, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_savedContainingScrollView);
  objc_storeStrong((id *)&self->_savedSelectedCellsWhenViewWillAppear, 0);
  objc_destroyWeak(&self->_navigationControllerBookkeeper);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_resultsTitle, 0);
  objc_storeStrong((id *)&self->_noResultsMessage, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end