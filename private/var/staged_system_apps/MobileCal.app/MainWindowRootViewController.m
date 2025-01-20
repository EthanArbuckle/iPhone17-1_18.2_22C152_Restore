@interface MainWindowRootViewController
+ (BOOL)shouldHideInlineFocusBannerForSidebarState:(unint64_t)a3;
+ (double)minimumStandardWindowWidth;
+ (double)sidebarWidthForViewHierarchy:(id)a3;
+ (id)sanitizeCalSubCal:(id)a3;
- (BOOL)_shouldUseSideBar;
- (BOOL)_viewControllerExistsInPresentationChainThatShouldNotRotate;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowAvatarViewWithTraitCollection:(id)a3;
- (BOOL)listViewControllerContainerHandlesShowEvent;
- (BOOL)listViewControllerShouldShowEvent:(id)a3 showMode:(unint64_t)a4;
- (BOOL)paletteShouldShowAvatarView;
- (BOOL)showsSearchBarForTraitCollection:(id)a3;
- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3;
- (CGSize)mainContentSize;
- (MainWindowRootViewController)initWithRootNavigationController:(id)a3;
- (double)searchFieldWidth;
- (id)ekui_futureTraitCollection;
- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3;
- (id)traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:(id)a3;
- (id)undoManager;
- (id)viewControllerForSidebarState:(unint64_t)a3;
- (unint64_t)currentSidebarState;
- (unint64_t)focusFilterMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_delegatesChanged:(id)a3;
- (void)_identityChanged:(id)a3;
- (void)_updateAfterExtendedLaunch:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)calendarButtonTapped;
- (void)continueSearchWithTerm:(id)a3;
- (void)copy:(id)a3;
- (void)createSearchBarIfNeeded;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleCloseKeyCommand;
- (void)handleDayKeyCommand;
- (void)handleDeleteKeyCommand;
- (void)handleDismissSplashScreenKeyCommand;
- (void)handleDuplicateKeyCommand;
- (void)handleGoToNextDateComponentUnitCommand;
- (void)handleGoToPreviousDateComponentUnitCommand;
- (void)handleMonthKeyCommand;
- (void)handleRefreshKeyCommand;
- (void)handleSelectNextEventCommand;
- (void)handleSelectNextOccurrenceCommand;
- (void)handleSelectPreviousEventCommand;
- (void)handleSelectPreviousOccurrenceCommand;
- (void)handleTodayKeyCommand;
- (void)handleURL:(id)a3 context:(id)a4;
- (void)handleViewAvailabilityCommand;
- (void)handleWeekKeyCommand;
- (void)handleYearKeyCommand;
- (void)hideMainSideBar;
- (void)hideSearchSideBar;
- (void)inboxButtonTapped;
- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4;
- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4;
- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5;
- (void)inboxWillDismiss;
- (void)layoutSearchControl;
- (void)listButtonTapped;
- (void)newEventButtonTapped:(id)a3;
- (void)palette:(id)a3 identitySwitcherTapped:(id)a4;
- (void)paletteAvatarViewTapped:(id)a3;
- (void)paletteTodayButtonTapped:(id)a3;
- (void)paste:(id)a3;
- (void)routeNewEventKeyCommand;
- (void)routeSearchKeyCommand;
- (void)searchBegan;
- (void)searchButtonTapped:(id)a3;
- (void)searchButtonTappedCreateAndAddSearchBar:(BOOL)a3;
- (void)searchEnded;
- (void)searchEnding;
- (void)searchTapped;
- (void)setCurrentSidebarState:(unint64_t)a3;
- (void)setCurrentSidebarState:(unint64_t)a3 completion:(id)a4;
- (void)setEkui_futureTraitCollection:(id)a3;
- (void)setFocusFilterMode:(unint64_t)a3;
- (void)setupSearchControlForTraitCollection:(id)a3;
- (void)showAddEvent;
- (void)showAddEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 location:(id)a6 suggestionsKey:(id)a7 allDay:(BOOL)a8;
- (void)showCalendarsSideBarWithCompletion:(id)a3;
- (void)showCalendarsView;
- (void)showCalendarsViewWithCompletion:(id)a3;
- (void)showDayView;
- (void)showEventAndCloseSidebarIfNeeded:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5;
- (void)showIdentitySwitcherFromSourceView:(id)a3;
- (void)showInboxSideBarWithCompletion:(id)a3;
- (void)showInboxView;
- (void)showInspectorForCalendar:(id)a3 enableDoneInitially:(BOOL)a4;
- (void)showListSideBarWithCompletion:(id)a3;
- (void)showListView;
- (void)showMonthView;
- (void)showSearchView;
- (void)showSplitMonthView;
- (void)showWeekView;
- (void)showYearView;
- (void)splitViewController:(id)a3 willExpandToProposedDisplayMode:(int64_t *)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)todayToolbarItemPressed;
- (void)updateErrorState;
- (void)updateInboxCount;
- (void)updateNewEventButtonEnabledness;
- (void)updatePrimaryViewControllerNavBar;
- (void)updatePrimaryViewControllerToolbar;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willEnterForeground;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainWindowRootViewController

- (void)updateInboxCount
{
  notificationQ = self->_notificationQ;
  if (!notificationQ)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.notificationUpdateQ", 0);
    v5 = self->_notificationQ;
    self->_notificationQ = v4;

    notificationQ = self->_notificationQ;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000620C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async(notificationQ, block);
}

- (void)setCurrentSidebarState:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  if (!self->_didAppear || [(UISplitViewController *)self->_splitViewController isCollapsed])
  {
    if (self->_currentSidebarState != a3)
    {
      self->_needsSidebarSetup = 1;
      self->_pendingState = a3;
    }
    if (v6) {
      v6[2](v6, 0);
    }
    goto LABEL_33;
  }
  if (!a3) {
    goto LABEL_16;
  }
  if (a3 != 1)
  {
    unint64_t currentSidebarState = self->_currentSidebarState;
    goto LABEL_15;
  }
  unint64_t currentSidebarState = self->_currentSidebarState;
  if (currentSidebarState != 1) {
    goto LABEL_15;
  }
  if (!self->_calendarsPreservedState)
  {
    unint64_t currentSidebarState = 1;
LABEL_15:
    if (currentSidebarState != a3)
    {
      id v11 = [(MainWindowRootViewController *)self viewControllerForSidebarState:a3];
      if (v11)
      {
        if (self->_currentSidebarState == 2) {
          [(MainWindowRootViewController *)self inboxWillDismiss];
        }
        primaryVC = self->_primaryVC;
        id v37 = v11;
        v14 = +[NSArray arrayWithObjects:&v37 count:1];
        [(UINavigationController *)primaryVC setViewControllers:v14];

        if (self->_currentSidebarState)
        {
          id v15 = [(id)objc_opt_class() shouldHideInlineFocusBannerForSidebarState:a3];
          v16 = [(RootNavigationController *)self->_rootNavigationController paletteView];
          [v16 setShouldHideInlineFocusBanner:v15];
        }
        else
        {
          v24 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];

          if (v24)
          {

            goto LABEL_32;
          }
          self->_animatingSidebar = (id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)1;
          [(UISplitViewController *)self->_splitViewController showColumn:0];
          v25 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1000F4700;
          v32[3] = &unk_1001D52B0;
          v32[4] = self;
          v32[5] = a3;
          v26 = _NSConcreteStackBlock;
          uint64_t v27 = 3221225472;
          v28 = sub_1000F47B4;
          v29 = &unk_1001D2DF0;
          v30 = self;
          id v31 = v11;
          [v25 animateAlongsideTransition:v32 completion:&v26];
        }
        if (a3 == 3)
        {
          id v17 = objc_alloc((Class)UIBarButtonItem);
          v18 = +[NSBundle mainBundle];
          v19 = [v18 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];
          id v20 = [v17 initWithTitle:v19 style:0 target:self action:"todayToolbarItemPressed"];
          id v36 = v20;
          v21 = +[NSArray arrayWithObjects:&v36 count:1];
          [v11 setToolbarItems:v21];
        }
        [(MainWindowRootViewController *)self updatePrimaryViewControllerNavBar];
        [(MainWindowRootViewController *)self updatePrimaryViewControllerToolbar];
      }
      self->_unint64_t currentSidebarState = a3;

LABEL_30:
      self->_animatingSidebar = 0;
      [(MainWindowControlHeaderView *)self->_headerView updateButtonStateForSidebar:self->_currentSidebarState];
      if (v6) {
        ((void (**)(id, id))v6)[2](v6, v11);
      }
      goto LABEL_32;
    }
LABEL_16:
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000F4618;
    v35[3] = &unk_1001D2740;
    v35[4] = self;
    v10 = objc_retainBlock(v35);
    if ((id)[(UISplitViewController *)self->_splitViewController displayMode] == (id)1) {
      goto LABEL_17;
    }
    v12 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];

    if (!v12)
    {
      if (self->_currentSidebarState == 2) {
        [(MainWindowRootViewController *)self inboxWillDismiss];
      }
      self->_animatingSidebar = (id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)1;
      [(UISplitViewController *)self->_splitViewController hideColumn:0];
      uint64_t v22 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
      if (v22)
      {
        v23 = (void *)v22;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000F46F0;
        v33[3] = &unk_1001D2DC8;
        v34 = v10;
        [v23 animateAlongsideTransition:v33 completion:0];

        goto LABEL_18;
      }
LABEL_17:
      ((void (*)(void *))v10[2])(v10);
LABEL_18:
      self->_unint64_t currentSidebarState = 0;

      id v11 = 0;
      goto LABEL_30;
    }

    id v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v8 = [(UINavigationController *)self->_primaryVC topViewController];
  [v8 restorePreservedState:self->_calendarsPreservedState];
  calendarsPreservedState = self->_calendarsPreservedState;
  self->_calendarsPreservedState = 0;

  if (v6) {
    v6[2](v6, 0);
  }

LABEL_33:
}

- (void)willEnterForeground
{
  v3 = [(MainWindowRootViewController *)self traitCollection];
  [(MainWindowRootViewController *)self setupSearchControlForTraitCollection:v3];

  secondaryContainerVC = self->_secondaryContainerVC;

  [(MainWindowContentContainerViewController *)secondaryContainerVC layoutSegmentedControl];
}

- (void)layoutSearchControl
{
  p_searchBar = (id *)&self->_searchBar;
  v4 = [(UISearchBar *)self->_searchBar superview];
  if (v4)
  {
  }
  else
  {
    v5 = [(UIButton *)self->_searchButton superview];

    if (!v5) {
      return;
    }
  }
  v6 = [(RootNavigationController *)self->_rootNavigationController viewSwitcher];
  [v6 frame];
  double MidY = CGRectGetMidY(v41);

  LODWORD(v6) = CalInterfaceIsLeftToRight();
  v8 = [(MainWindowRootViewController *)self view];
  [v8 safeAreaInsets];
  double v10 = v9;
  double v12 = v11;

  if (v6) {
    double v13 = v12;
  }
  else {
    double v13 = v10;
  }
  double v14 = v13 + 16.0;
  if (*p_searchBar
    && ([*p_searchBar superview],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    [*p_searchBar sizeToFit];
    [(MainWindowRootViewController *)self searchFieldWidth];
    double v17 = v16;
    [*p_searchBar layoutMargins];
    double v19 = v18;
    double v21 = v20;
    if (self->_isSearching)
    {
      uint64_t v22 = [(MainWindowRootViewController *)self EKUI_viewHierarchy];
      +[MainWindowRootViewController sidebarWidthForViewHierarchy:v22];
      double v17 = v23 - (v14 + 16.0);
    }
    double v24 = v21 + v19 + v17;
    [*p_searchBar frame];
    double v26 = v25;
    if (CalInterfaceIsLeftToRight())
    {
      uint64_t v27 = [(MainWindowRootViewController *)self view];
      [v27 bounds];
      double v14 = v28 - v24 - (v14 - v21);
    }
    else
    {
      double v14 = v14 - v19;
    }
    id v36 = [(MainWindowRootViewController *)self traitCollection];
    if (EKUIUsesLargeTextLayout())
    {
      id v37 = [(MainWindowRootViewController *)self view];
      [v37 safeAreaInsets];
      double v35 = v38;
    }
    else
    {
      double v35 = MidY + v26 * -0.5;
    }
  }
  else
  {
    p_searchBar = (id *)&self->_searchButton;
    searchButton = self->_searchButton;
    if (!searchButton) {
      return;
    }
    v30 = [(UIButton *)searchButton superview];

    if (!v30) {
      return;
    }
    [*p_searchBar sizeToFit];
    [*p_searchBar frame];
    double v24 = v31;
    double v26 = v32;
    if (CalInterfaceIsLeftToRight())
    {
      v33 = [(MainWindowRootViewController *)self view];
      [v33 bounds];
      double v14 = v34 - v24 - v14;
    }
    double v35 = MidY + v26 * -0.5;
  }
  id v39 = *p_searchBar;

  [v39 setFrame:v14, v35, v24, v26];
}

- (void)updateNewEventButtonEnabledness
{
  buttonQ = self->_buttonQ;
  if (!buttonQ)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.buttonUpdateQ", 0);
    v5 = self->_buttonQ;
    self->_buttonQ = v4;

    buttonQ = self->_buttonQ;
  }
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000085CC;
  v6[3] = &unk_1001D3068;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(buttonQ, v6);
  _Block_object_dispose(v7, 8);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didAppear = 1;
  if (self->_needsSidebarSetup)
  {
    if (([(UISplitViewController *)self->_splitViewController _isCollapsed] & 1) == 0) {
      [(MainWindowRootViewController *)self setCurrentSidebarState:self->_pendingState];
    }
    self->_needsSidebarSetup = 0;
  }
  v5 = [(MainWindowRootViewController *)self traitCollection];
  [(MainWindowRootViewController *)self setupSearchControlForTraitCollection:v5];

  [(MainWindowRootViewController *)self layoutSearchControl];
  headerView = self->_headerView;
  v7 = [(MainWindowRootViewController *)self view];
  [v7 bounds];
  [(MainWindowControlHeaderView *)headerView layoutForWidth:v8];

  [(MainWindowRootViewController *)self updateNewEventButtonEnabledness];
  v9.receiver = self;
  v9.super_class = (Class)MainWindowRootViewController;
  [(MainWindowRootViewController *)&v9 viewDidAppear:v3];
}

- (void)updateErrorState
{
  BOOL v3 = [(RootNavigationController *)self->_rootNavigationController model];
  v4 = [(RootNavigationController *)self->_rootNavigationController model];
  v5 = [v4 sourceForSelectedIdentity];
  BOOL v6 = (uint64_t)[v3 displayableAccountErrorsForSource:v5] > 0;

  headerView = self->_headerView;

  [(MainWindowControlHeaderView *)headerView updateErrorState:v6];
}

- (void)setupSearchControlForTraitCollection:(id)a3
{
  id v16 = a3;
  if (-[MainWindowRootViewController showsSearchBarForTraitCollection:](self, "showsSearchBarForTraitCollection:")
    || self->_isSearching)
  {
    [(MainWindowRootViewController *)self createSearchBarIfNeeded];
    v4 = self->_searchBar;
    int v5 = 72;
  }
  else
  {
    searchButton = self->_searchButton;
    if (!searchButton)
    {
      double v10 = +[UIImageSymbolConfiguration configurationWithScale:3];
      double v11 = +[UIImage systemImageNamed:@"magnifyingglass" withConfiguration:v10];
      double v12 = +[UIButton buttonWithType:0];
      double v13 = self->_searchButton;
      self->_searchButton = v12;

      [(UIButton *)self->_searchButton addTarget:self action:"searchButtonTapped:" forControlEvents:64];
      [(UIButton *)self->_searchButton setImage:v11 forState:0];
      [(UIButton *)self->_searchButton setShowsLargeContentViewer:1];
      double v14 = self->_searchButton;
      id v15 = objc_opt_new();
      [(UIButton *)v14 addInteraction:v15];

      [(UIButton *)self->_searchButton setAccessibilityIdentifier:@"search-button"];
      searchButton = self->_searchButton;
    }
    v4 = searchButton;
    int v5 = 64;
  }
  id v6 = *(id *)((char *)&self->super.super.super.isa + v5);
  if ([v16 horizontalSizeClass] == (id)2)
  {
    [v6 removeFromSuperview];
    v7 = [(UISearchBar *)v4 superview];

    if (!v7)
    {
      double v8 = [(MainWindowRootViewController *)self view];
      [v8 addSubview:v4];
    }
  }
  else
  {
    [(UISearchBar *)self->_searchBar removeFromSuperview];
    [(UIButton *)self->_searchButton removeFromSuperview];
  }
}

- (BOOL)showsSearchBarForTraitCollection:(id)a3
{
  id v4 = a3;
  int v5 = [(MainWindowRootViewController *)self view];
  EKUICurrentWindowWidthWithViewHierarchy();
  double v7 = v6;

  BOOL v8 = v7 > 750.0 && (EKUIUsesLargeTextLayout() & 1) == 0 && [v4 userInterfaceIdiom] != 0;
  return v8;
}

- (void)viewWillLayoutSubviews
{
  [(MainWindowContentContainerViewController *)self->_secondaryContainerVC layoutSegmentedControl];
  BOOL v3 = [(MainWindowControlHeaderView *)self->_headerView superview];

  if (v3)
  {
    id v23 = [(RootNavigationController *)self->_rootNavigationController viewSwitcher];
    id v4 = [(MainWindowRootViewController *)self view];
    [v23 bounds];
    [v4 convertRect:v23 fromView:];
    double MidY = CGRectGetMidY(v25);

    double v6 = [(MainWindowRootViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    +[MainWindowRootViewController minimumStandardWindowWidth];
    double v10 = dbl_1001C16D0[v8 < v9];

    LODWORD(v6) = CalInterfaceIsLeftToRight();
    double v11 = [(MainWindowRootViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v12;
    double v15 = v14;

    if (v6) {
      double v16 = v13;
    }
    else {
      double v16 = v15;
    }
    double v17 = v10 + v16;
    -[MainWindowControlHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    double v19 = v18;
    char IsLeftToRight = CalInterfaceIsLeftToRight();
    if (IsLeftToRight)
    {
      double v21 = 0.0;
    }
    else
    {
      double v11 = [(MainWindowRootViewController *)self view];
      [v11 bounds];
      double v21 = v22 - v17;
    }
    -[MainWindowControlHeaderView setFrame:](self->_headerView, "setFrame:", v21, MidY + v19 * -0.5, v17, v19);
    if ((IsLeftToRight & 1) == 0) {

    }
    if (!self->_isEndingSearch) {
      [(MainWindowRootViewController *)self layoutSearchControl];
    }
  }
}

- (MainWindowRootViewController)initWithRootNavigationController:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MainWindowRootViewController;
  double v6 = [(MainWindowRootViewController *)&v23 init];
  double v7 = v6;
  if (v6)
  {
    p_rootNavigationController = (id *)&v6->_rootNavigationController;
    objc_storeStrong((id *)&v6->_rootNavigationController, a3);
    double v9 = +[NSNotificationCenter defaultCenter];
    uint64_t v10 = CUIKCalendarModelNotificationCountsChangedNotification;
    double v11 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_notificationCountChanged:" name:v10 object:v11];

    uint64_t v12 = CUIKCalendarModelIdentityChangedNotification;
    double v13 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_identityChanged:" name:v12 object:v13];

    uint64_t v14 = CUIKCalendarModelDelegatesChangedNotification;
    double v15 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_delegatesChanged:" name:v14 object:v15];

    uint64_t v16 = CUIKCalendarModelCalendarsChangedNotification;
    double v17 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_calendarsChanged:" name:v16 object:v17];

    uint64_t v18 = CUIKCalendarModelAccountErrorCountChangedNotification;
    double v19 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_calendarErrorCountChanged:" name:v18 object:v19];

    uint64_t v20 = CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification;
    double v21 = [*p_rootNavigationController model];
    [v9 addObserver:v7 selector:"_updateAfterExtendedLaunch:" name:v20 object:v21];

    [v9 addObserver:v7 selector:"_updateAfterExtendedLaunch:" name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)MainWindowRootViewController;
  [(MainWindowRootViewController *)&v65 viewDidLoad];
  BOOL v3 = [(MainWindowRootViewController *)self view];
  [v3 setAutoresizingMask:18];

  id v4 = +[UIColor systemBackgroundColor];
  id v5 = [(MainWindowRootViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = (UISplitViewController *)[objc_alloc((Class)UISplitViewController) initWithStyle:1];
  splitViewController = self->_splitViewController;
  self->_splitViewController = v6;

  double v8 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
  primaryVC = self->_primaryVC;
  self->_primaryVC = v8;

  uint64_t v10 = +[UIColor systemBackgroundColor];
  double v11 = [(UINavigationController *)self->_primaryVC view];
  [v11 setBackgroundColor:v10];

  uint64_t v12 = +[UIColor secondarySystemBackgroundColor];
  double v13 = [(UINavigationController *)self->_primaryVC navigationBar];
  [v13 setBarTintColor:v12];

  uint64_t v14 = [(UINavigationController *)self->_primaryVC navigationBar];
  [v14 setForceFullHeightInLandscape:1];

  double v15 = [[MainWindowContentContainerViewController alloc] initWithRootNavigationController:self->_rootNavigationController];
  secondaryContainerVC = self->_secondaryContainerVC;
  self->_secondaryContainerVC = v15;

  [(MainWindowContentContainerViewController *)self->_secondaryContainerVC setDelegate:self];
  double v17 = [[MainWindowWrapperNavigationController alloc] initWithRootViewController:self->_secondaryContainerVC];
  [(MainWindowWrapperNavigationController *)v17 setNavigationBarHidden:1 animated:0];
  [(UISplitViewController *)self->_splitViewController setDelegate:self];
  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:1];
  [(UISplitViewController *)self->_splitViewController setPresentsWithGesture:0];
  uint64_t v18 = [(MainWindowRootViewController *)self EKUI_viewHierarchy];
  +[MainWindowRootViewController sidebarWidthForViewHierarchy:v18];
  -[UISplitViewController setMinimumPrimaryColumnWidth:](self->_splitViewController, "setMinimumPrimaryColumnWidth:");
  v63 = (void *)v18;
  +[MainWindowRootViewController sidebarWidthForViewHierarchy:v18];
  -[UISplitViewController setMaximumPrimaryColumnWidth:](self->_splitViewController, "setMaximumPrimaryColumnWidth:");
  [(UISplitViewController *)self->_splitViewController setViewController:self->_primaryVC forColumn:0];
  v64 = v17;
  [(UISplitViewController *)self->_splitViewController setViewController:v17 forColumn:2];
  [(MainWindowRootViewController *)self addChildViewController:self->_splitViewController];
  double v19 = [(MainWindowRootViewController *)self view];
  uint64_t v20 = [(UISplitViewController *)self->_splitViewController view];
  [v19 addSubview:v20];

  [(UISplitViewController *)self->_splitViewController didMoveToParentViewController:self];
  double v21 = [MainWindowControlHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  CGRect v25 = -[MainWindowControlHeaderView initWithFrame:](v21, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerView = self->_headerView;
  self->_headerView = v25;

  [(MainWindowControlHeaderView *)self->_headerView setDelegate:self];
  [(MainWindowRootViewController *)self updateInboxCount];
  uint64_t v27 = -[MasterNavigationPaletteView initWithFrame:]([MasterNavigationPaletteView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  paletteView = self->_paletteView;
  self->_paletteView = v27;

  [(MasterNavigationPaletteView *)self->_paletteView setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = [(RootNavigationController *)self->_rootNavigationController model];
  [(MasterNavigationPaletteView *)self->_paletteView setModel:v29];

  [(MasterNavigationPaletteView *)self->_paletteView setDelegate:self];
  v30 = [(RootNavigationController *)self->_rootNavigationController model];
  -[MasterNavigationPaletteView setShowIdentity:](self->_paletteView, "setShowIdentity:", [v30 containsDelegateSources]);

  double v31 = self->_paletteView;
  double v32 = [(MainWindowRootViewController *)self view];
  [v32 bounds];
  -[MasterNavigationPaletteView sizeThatFits:](v31, "sizeThatFits:", v33, v34);
  double v36 = v35;
  double v38 = v37;

  id v39 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, v36, v38];
  [v39 addSubview:self->_paletteView];
  v62 = [(MasterNavigationPaletteView *)self->_paletteView leadingAnchor];
  v61 = [v39 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v66[0] = v60;
  v59 = [(MasterNavigationPaletteView *)self->_paletteView trailingAnchor];
  v58 = [v39 trailingAnchor];
  v40 = [v59 constraintEqualToAnchor:v58];
  v66[1] = v40;
  CGRect v41 = [(MasterNavigationPaletteView *)self->_paletteView topAnchor];
  v42 = [v39 topAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  v66[2] = v43;
  v44 = [(MasterNavigationPaletteView *)self->_paletteView bottomAnchor];
  v45 = [v39 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v66[3] = v46;
  v47 = +[NSArray arrayWithObjects:v66 count:4];
  +[NSLayoutConstraint activateConstraints:v47];

  v48 = (_UINavigationBarPalette *)[objc_alloc((Class)_UINavigationBarPalette) initWithContentView:v39];
  palette = self->_palette;
  self->_palette = v48;

  [(_UINavigationBarPalette *)self->_palette setPreferredHeight:v38];
  v50 = [(RootNavigationController *)self->_rootNavigationController paletteView];
  [v50 setDelegate:self];

  v51 = [(MainWindowRootViewController *)self traitCollection];
  id v52 = [v51 horizontalSizeClass];

  if (v52 == (id)2)
  {
    v53 = [(MainWindowRootViewController *)self view];
    [v53 addSubview:self->_headerView];

    rootNavigationController = self->_rootNavigationController;
    v55 = [(MainWindowRootViewController *)self traitCollection];
    [(RootNavigationController *)rootNavigationController setAvatarViewVisible:[(MainWindowRootViewController *)self canShowAvatarViewWithTraitCollection:v55]];
  }
  else
  {
    [(UINavigationController *)self->_primaryVC setNavigationBarHidden:1 animated:0];
    [(RootNavigationController *)self->_rootNavigationController setAvatarViewVisible:0];
  }
  id v56 = [(id)objc_opt_class() shouldHideInlineFocusBannerForSidebarState:self->_currentSidebarState];
  v57 = [(RootNavigationController *)self->_rootNavigationController paletteView];
  [v57 setShouldHideInlineFocusBanner:v56];
}

+ (double)sidebarWidthForViewHierarchy:(id)a3
{
  BOOL v3 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();
  double result = 320.0;
  if (v3) {
    return 375.0;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(MainWindowRootViewController *)self presentedViewController];
  int v4 = EKUIUseLargeFormatPhoneUI();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (!v4 || !self->_isSearching)
    && ![(MainWindowRootViewController *)self _viewControllerExistsInPresentationChainThatShouldNotRotate])
  {
    goto LABEL_7;
  }
  id v5 = [(MainWindowRootViewController *)self view];
  double v6 = [v5 window];
  double v7 = [v6 windowScene];
  id v8 = [v7 interfaceOrientation];

  if (v8)
  {
    unint64_t v9 = 1 << (char)v8;
  }
  else
  {
LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)MainWindowRootViewController;
    unint64_t v9 = [(MainWindowRootViewController *)&v11 supportedInterfaceOrientations];
  }

  return v9;
}

- (BOOL)_viewControllerExistsInPresentationChainThatShouldNotRotate
{
  BOOL v3 = +[NSMutableSet set];
  uint64_t v4 = objc_opt_class();
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(MainWindowRootViewController *)self presentedViewController];
  if (v5)
  {
    double v6 = (void *)v5;
    do
    {
      unsigned __int8 v7 = [v3 containsObject:objc_opt_class()];
      if (v7) {
        break;
      }
      uint64_t v8 = [v6 presentedViewController];

      double v6 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)focusFilterMode
{
  v2 = [(RootNavigationController *)self->_rootNavigationController model];
  id v3 = [v2 focusFilterMode];

  return (unint64_t)v3;
}

- (id)ekui_futureTraitCollection
{
  return [(RootNavigationController *)self->_rootNavigationController ekui_futureTraitCollection];
}

- (void)setCurrentSidebarState:(unint64_t)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_updateAfterExtendedLaunch:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000159C4;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (BOOL)shouldHideInlineFocusBannerForSidebarState:(unint64_t)a3
{
  return a3 - 1 < 2;
}

+ (double)minimumStandardWindowWidth
{
  return 750.0;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MainWindowRootViewController;
  [(MainWindowRootViewController *)&v4 dealloc];
}

- (id)traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:(id)a3
{
  id v3 = a3;
  if ([v3 horizontalSizeClass] == (id)1 && objc_msgSend(v3, "verticalSizeClass") == (id)1)
  {
    objc_super v4 = [v3 traitCollectionByModifyingTraits:&stru_1001D51E8];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(MainWindowRootViewController *)self isViewLoaded] & 1) == 0)
  {
    uint64_t v8 = [(MainWindowRootViewController *)self traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:v6];
    if (v8)
    {
      [(MainWindowRootViewController *)self setEkui_futureTraitCollection:v8];
      unint64_t v9 = [(MainWindowRootViewController *)self view];
      [v9 setNeedsLayout];

      [(MainWindowRootViewController *)self setEkui_futureTraitCollection:0];
    }
    else
    {
      uint64_t v10 = [(MainWindowRootViewController *)self view];
      [v10 setNeedsLayout];
    }
  }
  v40 = v7;
  id v11 = [v6 horizontalSizeClass];
  uint64_t v12 = [(MainWindowRootViewController *)self traitCollection];
  id v13 = [v12 horizontalSizeClass];

  id v14 = [v6 horizontalSizeClass];
  BOOL v38 = v14 == (id)2;
  double v15 = [(MainWindowRootViewController *)self view];
  uint64_t v16 = [v15 window];
  double v17 = [v16 windowScene];
  id v18 = [v17 activationState];
  BOOL v39 = v18 == (id)2;

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  [(UINavigationController *)self->_primaryVC setNavigationBarHidden:v14 != (id)2 animated:0];
  [(MainWindowRootViewController *)self setupSearchControlForTraitCollection:v6];
  if (v18 == (id)2)
  {
    double v19 = 0;
  }
  else
  {
    double v19 = [(MainWindowRootViewController *)self firstResponder];
  }
  if (v11 != v13 && v14 == (id)2)
  {
    uint64_t v20 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];
    if (!v20)
    {
      uint64_t v20 = [(MainWindowRootViewController *)self presentedViewController];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v21 = [v20 preservedState];
      calendarsPreservedState = self->_calendarsPreservedState;
      self->_calendarsPreservedState = v21;

      objc_super v23 = [v20 presentingViewController];
      [v23 dismissViewControllerAnimated:0 completion:0];

      double v24 = 0;
      v55[3] = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(RootNavigationController *)self->_rootNavigationController dismissViewControllerAnimated:0 completion:0];
        v55[3] = 2;
        objc_storeStrong((id *)&self->_presentedInboxVC, v20);
        double v24 = [(InboxViewController *)self->_presentedInboxVC displayedDetailViewControllers];
      }
      else
      {
        double v24 = 0;
      }
    }
    uint64_t v27 = [(MainWindowRootViewController *)self view];
    [v27 addSubview:self->_headerView];

    goto LABEL_28;
  }
  if (v11 == v13)
  {
    double v24 = 0;
    goto LABEL_29;
  }
  uint64_t v20 = [(MainWindowRootViewController *)self presentedViewController];
  if ((id)[(MainWindowRootViewController *)self currentSidebarState] == (id)1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRect v25 = [v20 viewControllers];
      double v26 = [v25 firstObject];
      NSClassFromString(@"EKCalendarEditor");
      if (objc_opt_isKindOfClass())
      {

LABEL_26:
        double v31 = [(UINavigationController *)self->_primaryVC topViewController];
        double v32 = [v31 preservedState];
        double v33 = self->_calendarsPreservedState;
        self->_calendarsPreservedState = v32;

        [(MainWindowRootViewController *)self dismissViewControllerAnimated:0 completion:0];
        goto LABEL_27;
      }
      double v28 = [v20 viewControllers];
      v29 = [v28 firstObject];
      NSClassFromString(@"EKSubscribedCalendarEditor");
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  [(MainWindowControlHeaderView *)self->_headerView removeFromSuperview];
  double v24 = 0;
LABEL_28:

LABEL_29:
  double v34 = [(UISplitViewController *)self->_splitViewController overrideTraitCollectionForChildViewController:self->_primaryVC];
  [(UISplitViewController *)self->_splitViewController setOverrideTraitCollection:0 forChildViewController:self->_primaryVC];
  v53.receiver = self;
  v53.super_class = (Class)MainWindowRootViewController;
  [(MainWindowRootViewController *)&v53 willTransitionToTraitCollection:v6 withTransitionCoordinator:v40];
  if (v40) {
    [v40 targetTransform];
  }
  else {
    memset(&v52, 0, sizeof(v52));
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000F2A4C;
  v48[3] = &unk_1001D5238;
  BOOL v49 = v38;
  BOOL v50 = !CGAffineTransformIsIdentity(&v52);
  BOOL v51 = v39;
  v48[4] = self;
  v48[5] = &v54;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000F2C14;
  v41[3] = &unk_1001D5260;
  id v35 = v19;
  id v42 = v35;
  v43 = self;
  id v36 = v34;
  id v44 = v36;
  v46 = &v54;
  BOOL v47 = v39;
  id v37 = v24;
  id v45 = v37;
  [v40 animateAlongsideTransition:v48 completion:v41];

  _Block_object_dispose(&v54, 8);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 targetTransform];
    IsIdentitdouble y = CGAffineTransformIsIdentity(&v47);
    [v8 targetTransform];
    long double v10 = *((double *)&v44 + 1);
    [v8 targetTransform];
    long double v11 = *(double *)&v41;
  }
  else
  {
    memset(&v47, 0, sizeof(v47));
    IsIdentitdouble y = CGAffineTransformIsIdentity(&v47);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long double v11 = 0.0;
    long double v10 = 0.0;
  }
  double v12 = atan2(v10, v11) * 57.2957795;
  if (!self->_currentSidebarState)
  {
    uint64_t v37 = 1;
    goto LABEL_34;
  }
  UISplitViewControllerSplitBehavior v13 = [(UISplitViewController *)self->_splitViewController splitBehavior];
  id v14 = [(MainWindowRootViewController *)self view];
  double v15 = [v14 window];
  uint64_t v16 = [v15 windowScene];
  id v17 = [v16 activationState];

  id v18 = [(MainWindowRootViewController *)self ekui_futureTraitCollection];
  id v19 = [v18 horizontalSizeClass];
  uint64_t v20 = [(MainWindowRootViewController *)self traitCollection];
  id v21 = [v20 horizontalSizeClass];

  if (v19 != v21 || v17 == (id)2)
  {
    if (v19 == v21) {
      goto LABEL_8;
    }
LABEL_33:
    uint64_t v37 = 0;
    goto LABEL_34;
  }
  double v22 = [(MainWindowRootViewController *)self presentedViewController];

  if (!v22) {
    goto LABEL_33;
  }
LABEL_8:
  objc_super v23 = +[UIScreen mainScreen];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;

  double v28 = [(MainWindowRootViewController *)self EKUI_viewHierarchy];
  BOOL v29 = (char *)[v28 ekui_interfaceOrientation] - 3 < (char *)2 && v17 == (id)2;
  if (v29) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = v13;
  }
  double v31 = fabs(v12);
  if (width >= height) {
    double v32 = height;
  }
  else {
    double v32 = width;
  }
  if (v25 >= v27) {
    double v33 = v27;
  }
  else {
    double v33 = v25;
  }
  BOOL v34 = v32 == v33 && v30 == 2;
  uint64_t v35 = 2;
  if (!v34) {
    uint64_t v35 = 3;
  }
  BOOL v29 = v30 == 2;
  uint64_t v36 = 2;
  if (v29) {
    uint64_t v36 = 3;
  }
  if (v31 == 180.0) {
    uint64_t v37 = v36;
  }
  else {
    uint64_t v37 = v35;
  }

LABEL_34:
  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:v37];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000F31E0;
  v39[3] = &unk_1001D5288;
  BOOL v40 = !IsIdentity;
  *(double *)&v39[5] = v12;
  v39[4] = self;
  [v8 animateAlongsideTransition:v39 completion:0];
  v38.receiver = self;
  v38.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v38, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
}

- (void)splitViewController:(id)a3 willExpandToProposedDisplayMode:(int64_t *)a4
{
  if (self->_currentSidebarState)
  {
    UISplitViewControllerSplitBehavior v6 = [(UISplitViewController *)self->_splitViewController splitBehavior];
    int64_t v7 = 2;
    if (v6 == UISplitViewControllerSplitBehaviorOverlay) {
      int64_t v7 = 3;
    }
    *a4 = v7;
    [(MainWindowRootViewController *)self updatePrimaryViewControllerToolbar];
  }
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6 = a3;
  if (!a4
    && self->_currentSidebarState
    && ![(UISplitViewController *)self->_splitViewController isCollapsed])
  {
    int64_t v7 = [(MainWindowRootViewController *)self view];
    uint64_t v8 = [v7 window];
    unint64_t v9 = [v8 windowScene];
    id v10 = [v9 activationState];

    unint64_t currentSidebarState = self->_currentSidebarState;
    if (v10 != (id)2)
    {
      if (currentSidebarState == 2) {
        [(MainWindowRootViewController *)self inboxWillDismiss];
      }
      unint64_t currentSidebarState = 0;
      self->_unint64_t currentSidebarState = 0;
    }
    [(MainWindowControlHeaderView *)self->_headerView updateButtonStateForSidebar:currentSidebarState];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F34A8;
    v15[3] = &unk_1001D2740;
    v15[4] = self;
    double v12 = objc_retainBlock(v15);
    UISplitViewControllerSplitBehavior v13 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];

    if (v13)
    {
      id v14 = [(UISplitViewController *)self->_splitViewController transitionCoordinator];
      [v14 animateAlongsideTransition:v12 completion:0];
    }
    else
    {
      ((void (*)(void *))v12[2])(v12);
    }
  }
}

- (void)setEkui_futureTraitCollection:(id)a3
{
}

- (CGSize)mainContentSize
{
  v2 = [(RootNavigationController *)self->_rootNavigationController view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)continueSearchWithTerm:(id)a3
{
  id v6 = a3;
  double v4 = [(MainWindowRootViewController *)self ekui_futureTraitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)1) {
    [(RootNavigationController *)self->_rootNavigationController continueSearchWithTerm:v6 animated:1 removeViewControllersIncapableOfSearchIfNeeded:1];
  }
  else {
    [(MainWindowContentContainerViewController *)self->_secondaryContainerVC continueSearchWithTerm:v6];
  }
}

- (void)showAddEvent
{
  rootNavigationController = self->_rootNavigationController;
  id v3 = [(MainWindowControlHeaderView *)self->_headerView newEventBarButtonItem];
  [(RootNavigationController *)rootNavigationController showAddEventAnimated:0 fromBarButtonItem:v3];
}

- (void)showAddEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 location:(id)a6 suggestionsKey:(id)a7 allDay:(BOOL)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(MainWindowRootViewController *)self traitCollection];
  if ([v19 horizontalSizeClass] == (id)2) {
    id v21 = [(MainWindowControlHeaderView *)self->_headerView newEventBarButtonItem];
  }
  else {
    id v21 = 0;
  }

  LOBYTE(v20) = a8;
  [(RootNavigationController *)self->_rootNavigationController showAddEventAnimated:1 fromBarButtonItem:v21 withTitle:v18 startDate:0 exactStartDate:v17 endDate:v16 location:v15 suggestionKey:v14 allDay:v20 completion:0];
}

+ (id)sanitizeCalSubCal:(id)a3
{
  id v3 = a3;
  double v4 = [v3 scheme];
  unsigned __int8 v5 = [v4 isEqualToString:@"calsubcal"];

  if (v5)
  {
    id v6 = [v3 resourceSpecifier];
    double v7 = [v6 stringByRemovingPercentEncoding];

    if (v7)
    {
      id v8 = +[NSURL URLWithString:v7];
    }
    else
    {
      id v8 = v3;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

- (void)handleURL:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 scheme];
  id v9 = [(MainWindowRootViewController *)self traitCollection];
  id v10 = [v9 horizontalSizeClass];

  if (v10 == (id)2)
  {
    if ([v8 isEqualToString:@"calinvitelist"])
    {
      long double v11 = [(RootNavigationController *)self->_rootNavigationController model];
      id v12 = [v11 allEventNotificationsCount];

      if (v12)
      {
        [(MainWindowRootViewController *)self setCurrentSidebarState:2];
        goto LABEL_23;
      }
    }
  }
  UISplitViewControllerSplitBehavior v13 = [(MainWindowRootViewController *)self traitCollection];
  if ([v13 horizontalSizeClass] == (id)2)
  {
    if ([v8 isEqualToString:@"calsubcal"])
    {

LABEL_18:
      if (self->_currentSidebarState != 1) {
        [(MainWindowRootViewController *)self setCurrentSidebarState:1];
      }
      id v17 = [(UINavigationController *)self->_primaryVC topViewController];
      id v18 = +[MainWindowRootViewController sanitizeCalSubCal:v6];
      if (v18)
      {
        [(MainWindowContentContainerViewController *)self->_secondaryContainerVC cancelSearch];
        [v17 showAddSubscribedCalendarWithURL:v18];
      }

      goto LABEL_23;
    }
    unsigned __int8 v16 = [v8 isEqualToString:@"webcal"];

    if (v16) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (v10 == (id)2
    && [v8 isEqualToString:@"calshow"]
    && ([v6 host],
        id v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 isEqualToString:@"familyCalendar"],
        v14,
        v15))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000F3B4C;
    v19[3] = &unk_1001D5210;
    v19[4] = self;
    [(MainWindowRootViewController *)self showCalendarsViewWithCompletion:v19];
  }
  else
  {
    if (self->_currentSidebarState
      && (id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)2)
    {
      [(MainWindowRootViewController *)self setCurrentSidebarState:0];
    }
    [(MainWindowContentContainerViewController *)self->_secondaryContainerVC cancelSearch];
    [(RootNavigationController *)self->_rootNavigationController handleURL:v6 context:v7];
  }
LABEL_23:
}

- (void)createSearchBarIfNeeded
{
  if (!self->_searchBar)
  {
    id v3 = -[MainWindowSearchBar initWithFrame:]([MainWindowSearchBar alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    searchBar = self->_searchBar;
    self->_searchBar = &v3->super;

    unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"Placeholder used in the search bar in the calendar occurrences list" value:@"Search" table:0];
    [(UISearchBar *)self->_searchBar setPlaceholder:v6];

    [(UISearchBar *)self->_searchBar setDrawsBackground:0];
    [(UISearchBar *)self->_searchBar setDelegate:self->_secondaryContainerVC];
    [(UISearchBar *)self->_searchBar _setAutoDisableCancelButton:0];
    id v7 = [(UISearchBar *)self->_searchBar searchField];
    [v7 setAccessibilityIdentifier:@"search-bar"];

    id v8 = self->_searchBar;
    secondaryContainerVC = self->_secondaryContainerVC;
    [(MainWindowContentContainerViewController *)secondaryContainerVC setSearchBar:v8];
  }
}

- (double)searchFieldWidth
{
  v2 = [(MainWindowRootViewController *)self view];
  EKUICurrentWindowWidthWithViewHierarchy();
  double v4 = v3;

  if (v4 > 875.0) {
    return 223.0;
  }
  if (v4 > 800.0) {
    return 193.0;
  }
  double result = 0.0;
  if (v4 > 750.0) {
    return 172.0;
  }
  return result;
}

- (void)searchButtonTapped:(id)a3
{
}

- (void)searchButtonTappedCreateAndAddSearchBar:(BOOL)a3
{
  if (!self->_isEndingSearch)
  {
    BOOL v3 = a3;
    [(UIButton *)self->_searchButton removeFromSuperview];
    if (v3)
    {
      [(MainWindowRootViewController *)self createSearchBarIfNeeded];
      unsigned __int8 v5 = [(MainWindowRootViewController *)self view];
      [v5 addSubview:self->_searchBar];
    }
    self->_isSearching = 1;
    [(UISearchBar *)self->_searchBar setShowsCancelButton:1 animated:0];
    if (v3)
    {
      [(MainWindowRootViewController *)self layoutSearchControl];
      [(UISearchBar *)self->_searchBar layoutIfNeeded];
      [(UISearchBar *)self->_searchBar frame];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      if (CalInterfaceIsLeftToRight())
      {
        id v12 = [(MainWindowRootViewController *)self view];
        [v12 bounds];
        double v14 = v13;
      }
      else
      {
        double v14 = -v9;
      }
      -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v14, v7, v9, v11);
    }
    unsigned int v15 = [(MainWindowContentContainerViewController *)self->_secondaryContainerVC startSearch];
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000F4028;
    v17[3] = &unk_1001D2E40;
    v17[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F4030;
    v16[3] = &unk_1001D2E40;
    [v15 animateAlongsideTransition:v17 completion:v16];
  }
}

- (void)updatePrimaryViewControllerNavBar
{
  id v10 = [(UINavigationController *)self->_primaryVC topViewController];
  BOOL v3 = [(MainWindowRootViewController *)self traitCollection];
  id v4 = [v3 horizontalSizeClass];

  if (v4 == (id)2)
  {
    [(MasterNavigationPaletteView *)self->_paletteView sizeToFit];
    [(MasterNavigationPaletteView *)self->_paletteView frame];
    [(_UINavigationBarPalette *)self->_palette setPreferredHeight:v5];
    palette = self->_palette;
    double v7 = [v10 navigationItem];
    double v8 = v7;
    double v9 = palette;
  }
  else
  {
    double v7 = [v10 navigationItem];
    double v8 = v7;
    double v9 = 0;
  }
  [v7 _setBottomPalette:v9];
}

- (void)updatePrimaryViewControllerToolbar
{
  id v5 = [(UINavigationController *)self->_primaryVC topViewController];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___SideBarViewController]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v3 = [v5 toolbarVisibleInSplitBehavior:[self->_splitViewController splitBehavior]];
  }
  else
  {
    id v4 = [v5 toolbarItems];
    unsigned int v3 = v4 != 0;
  }
  [(UINavigationController *)self->_primaryVC setToolbarHidden:v3 ^ 1];
}

- (BOOL)canShowAvatarViewWithTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(RootNavigationController *)self->_rootNavigationController model];
  if ([v5 containsDelegateSources]) {
    BOOL v6 = [v4 horizontalSizeClass] == (id)2;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)viewControllerForSidebarState:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      id v10 = [CompactListViewController alloc];
      double v11 = [(RootNavigationController *)self->_rootNavigationController model];
      id v12 = [(MainWindowRootViewController *)self view];
      double v13 = [v12 window];
      BOOL v6 = [(ListViewController *)v10 initWithModel:v11 window:v13];

      [(ListViewController *)v6 setDelegate:self];
      [(ListViewController *)v6 setOverrideExtendedEdges:0];
      [(ListViewController *)v6 setDestination:2];
      double v7 = +[NSBundle mainBundle];
      double v8 = v7;
      CFStringRef v9 = @"Today";
      goto LABEL_6;
    case 2uLL:
      presentedInboxVC = self->_presentedInboxVC;
      if (presentedInboxVC)
      {
        BOOL v6 = [(InboxViewController *)presentedInboxVC switcherViewController];
        [(CompactListViewController *)v6 willMoveToParentViewController:0];
        id v17 = [(CompactListViewController *)v6 view];
        [v17 removeFromSuperview];

        [(CompactListViewController *)v6 removeFromParentViewController];
        [(CompactListViewController *)v6 setSwitcherDelegate:self];
        [(ListViewController *)v6 setDestination:2];
        id v18 = self->_presentedInboxVC;
        self->_presentedInboxVC = 0;
      }
      else
      {
        id v19 = [InboxSwitcherViewController alloc];
        uint64_t v20 = [(RootNavigationController *)self->_rootNavigationController model];
        BOOL v6 = [(InboxSwitcherViewController *)v19 initWithModel:v20 destination:2];

        [(CompactListViewController *)v6 setSwitcherDelegate:self];
      }
      unsigned int v15 = [(CompactListViewController *)v6 segmentedControl];
      double v8 = +[NSBundle mainBundle];
      double v14 = [v8 localizedStringForKey:@"Inbox" value:&stru_1001D6918 table:0];
      goto LABEL_12;
    case 1uLL:
      id v4 = [CalendarsViewController alloc];
      id v5 = [(RootNavigationController *)self->_rootNavigationController model];
      BOOL v6 = [(CalendarsViewController *)v4 initWithModel:v5 destination:2];

      double v7 = +[NSBundle mainBundle];
      double v8 = v7;
      CFStringRef v9 = @"Calendars";
LABEL_6:
      double v14 = [v7 localizedStringForKey:v9 value:&stru_1001D6918 table:0];
      unsigned int v15 = 0;
LABEL_12:

      goto LABEL_13;
  }
  double v14 = 0;
  unsigned int v15 = 0;
  BOOL v6 = 0;
LABEL_13:
  [(MasterNavigationPaletteView *)self->_paletteView setTitle:v14];
  [(MasterNavigationPaletteView *)self->_paletteView setSegmentedControl:v15];
  [(MasterNavigationPaletteView *)self->_paletteView setNeedsLayout];
  [(MasterNavigationPaletteView *)self->_paletteView layoutIfNeeded];
  paletteView = self->_paletteView;
  double v22 = [(UINavigationController *)self->_primaryVC view];
  [v22 bounds];
  -[MasterNavigationPaletteView sizeThatFits:](paletteView, "sizeThatFits:", v23, v24);

  [(_UINavigationBarPalette *)self->_palette frame];
  -[_UINavigationBarPalette setFrame:](self->_palette, "setFrame:");
  double v25 = [(CompactListViewController *)v6 navigationItem];
  [v25 _setAutoScrollEdgeTransitionDistance:16.0];

  double v26 = [(CompactListViewController *)v6 navigationItem];
  [v26 _setManualScrollEdgeAppearanceEnabled:1];

  double v27 = v6;
  return v27;
}

- (void)hideMainSideBar
{
}

- (void)hideSearchSideBar
{
}

- (void)showCalendarsSideBarWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ((id)[(MainWindowRootViewController *)self currentSidebarState] == (id)1)
  {
    id v5 = [(UINavigationController *)self->_primaryVC topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        double v7 = v5;
      }
      else {
        double v7 = 0;
      }
      ((void (**)(id, void *))v4)[2](v4, v7);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F4954;
    v8[3] = &unk_1001D52D8;
    CFStringRef v9 = v4;
    [(MainWindowRootViewController *)self setCurrentSidebarState:1 completion:v8];
  }
}

- (void)calendarButtonTapped
{
}

- (void)showInboxSideBarWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ((id)[(MainWindowRootViewController *)self currentSidebarState] == (id)2)
  {
    id v5 = [(UINavigationController *)self->_primaryVC topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        double v7 = v5;
      }
      else {
        double v7 = 0;
      }
      ((void (**)(id, void *))v4)[2](v4, v7);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F4AD8;
    v8[3] = &unk_1001D52D8;
    CFStringRef v9 = v4;
    [(MainWindowRootViewController *)self setCurrentSidebarState:2 completion:v8];
  }
}

- (void)inboxButtonTapped
{
}

- (void)showListSideBarWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ((id)[(MainWindowRootViewController *)self currentSidebarState] == (id)3)
  {
    id v5 = [(UINavigationController *)self->_primaryVC topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        double v7 = v5;
      }
      else {
        double v7 = 0;
      }
      ((void (**)(id, void *))v4)[2](v4, v7);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F4C5C;
    v8[3] = &unk_1001D52D8;
    CFStringRef v9 = v4;
    [(MainWindowRootViewController *)self setCurrentSidebarState:3 completion:v8];
  }
}

- (void)listButtonTapped
{
}

- (void)newEventButtonTapped:(id)a3
{
  id v4 = a3;
  if (self->_isSearching) {
    [(MainWindowContentContainerViewController *)self->_secondaryContainerVC cancelSearch];
  }
  [(RootNavigationController *)self->_rootNavigationController showAddEventAnimated:1 fromBarButtonItem:v4];
}

- (void)todayToolbarItemPressed
{
  id v3 = [(UINavigationController *)self->_primaryVC topViewController];
  v2 = CUIKTodayDate();
  [v3 scrollToDate:v2 animated:1];
}

- (void)searchTapped
{
  [(MainWindowRootViewController *)self setCurrentSidebarState:0];
  id v3 = [(UISearchBar *)self->_searchBar superview];
  [(MainWindowRootViewController *)self searchButtonTappedCreateAndAddSearchBar:v3 == 0];
}

- (void)searchBegan
{
  self->_isSearching = 1;
  [(MainWindowRootViewController *)self layoutSearchControl];

  [(MainWindowRootViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)searchEnding
{
  self->_isSearching = 0;
  self->_isEndingSearch = 1;
  id v3 = [(MainWindowRootViewController *)self traitCollection];
  unsigned int v4 = [(MainWindowRootViewController *)self showsSearchBarForTraitCollection:v3];

  if (v4)
  {
    [(MainWindowRootViewController *)self layoutSearchControl];
  }
  else
  {
    [(UISearchBar *)self->_searchBar frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if (CalInterfaceIsLeftToRight())
    {
      double v11 = [(MainWindowRootViewController *)self view];
      [v11 bounds];
      double v13 = v12;
    }
    else
    {
      double v13 = -v8;
    }
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v13, v6, v8, v10);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F502C;
    v16[3] = &unk_1001D2740;
    v16[4] = self;
    +[UIView performWithoutAnimation:v16];
    dispatch_time_t v14 = dispatch_time(0, 100000000);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F5098;
    v15[3] = &unk_1001D2740;
    v15[4] = self;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
  [(MainWindowRootViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)searchEnded
{
  self->_isEndingSearch = 0;
  id v3 = [(MainWindowRootViewController *)self traitCollection];
  unsigned __int8 v4 = [(MainWindowRootViewController *)self showsSearchBarForTraitCollection:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = [(MainWindowRootViewController *)self traitCollection];
    [(MainWindowRootViewController *)self setupSearchControlForTraitCollection:v5];
  }
}

- (void)showEventAndCloseSidebarIfNeeded:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (self->_currentSidebarState
    && (id)[(UISplitViewController *)self->_splitViewController splitBehavior] == (id)2
    && ([(MainWindowRootViewController *)self setCurrentSidebarState:0],
        [(UISplitViewController *)self->_splitViewController transitionCoordinator],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v10 = (void *)v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000F52FC;
    v11[3] = &unk_1001D5300;
    v11[4] = self;
    BOOL v14 = v6;
    id v12 = v8;
    unint64_t v13 = a5;
    [v10 animateAlongsideTransition:v11 completion:0];
  }
  else
  {
    [(RootNavigationController *)self->_rootNavigationController showEvent:v8 animated:v6 showMode:a5 context:0];
  }
}

- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3
{
  return 0;
}

- (BOOL)listViewControllerContainerHandlesShowEvent
{
  return 0;
}

- (BOOL)listViewControllerShouldShowEvent:(id)a3 showMode:(unint64_t)a4
{
  return 0;
}

- (void)inboxWillDismiss
{
  id v3 = [(UINavigationController *)self->_primaryVC topViewController];
  v2 = [v3 view];
  [v2 endEditing:1];

  [v3 inboxWillDismiss];
}

- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4
{
}

- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4
{
}

- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
}

- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  id v6 = [(MainWindowRootViewController *)self view];
  id v3 = [v6 window];
  unsigned __int8 v4 = [v3 windowScene];
  id v5 = [(RootNavigationController *)self->_rootNavigationController model];
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:v4 calendarModel:v5];
}

- (void)showIdentitySwitcherFromSourceView:(id)a3
{
  id v4 = a3;
  id v5 = [IdentitySwitcherViewController alloc];
  id v6 = [(RootNavigationController *)self->_rootNavigationController model];
  double v7 = [(IdentitySwitcherViewController *)v5 initWithModel:v6];

  [(IdentitySwitcherViewController *)v7 setModalPresentationStyle:7];
  id v8 = [(IdentitySwitcherViewController *)v7 popoverPresentationController];
  [v8 setSourceView:v4];

  if (CalInterfaceIsLeftToRight()) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 8;
  }
  [v8 setPermittedArrowDirections:v9];
  double v10 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[83058884] Showing identity switcher", v11, 2u);
  }
  [(MainWindowRootViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)paletteTodayButtonTapped:(id)a3
{
  [(RootNavigationController *)self->_rootNavigationController todayPressed];
  if (self->_currentSidebarState == 3)
  {
    id v4 = [(UINavigationController *)self->_primaryVC topViewController];
    [v4 scrollToTodayAnimated:1];
  }
  secondaryContainerVC = self->_secondaryContainerVC;

  [(MainWindowContentContainerViewController *)secondaryContainerVC todayTapped];
}

- (void)paletteAvatarViewTapped:(id)a3
{
  id v4 = [a3 avatarView];
  [(MainWindowRootViewController *)self showIdentitySwitcherFromSourceView:v4];
}

- (BOOL)paletteShouldShowAvatarView
{
  id v3 = [(RootNavigationController *)self->_rootNavigationController ekui_futureTraitCollection];
  if ([(MainWindowRootViewController *)self canShowAvatarViewWithTraitCollection:v3])
  {
    BOOL v4 = self->_currentSidebarState == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)palette:(id)a3 identitySwitcherTapped:(id)a4
{
}

- (void)setFocusFilterMode:(unint64_t)a3
{
  id v4 = [(RootNavigationController *)self->_rootNavigationController model];
  [v4 setFocusFilterMode:a3];
}

- (void)_identityChanged:(id)a3
{
  paletteView = self->_paletteView;
  id v5 = [(RootNavigationController *)self->_rootNavigationController model];
  id v6 = [v5 sourceForSelectedIdentity];
  [(MasterNavigationPaletteView *)paletteView updateIdentity:v6];

  [(MainWindowRootViewController *)self updateNewEventButtonEnabledness];
  [(MainWindowRootViewController *)self updateErrorState];

  [(MainWindowRootViewController *)self updateInboxCount];
}

- (void)_delegatesChanged:(id)a3
{
  id v4 = [(RootNavigationController *)self->_rootNavigationController model];
  -[MasterNavigationPaletteView setShowIdentity:](self->_paletteView, "setShowIdentity:", [v4 containsDelegateSources]);

  rootNavigationController = self->_rootNavigationController;
  id v6 = [(MainWindowRootViewController *)self traitCollection];
  [(RootNavigationController *)rootNavigationController setAvatarViewVisible:[(MainWindowRootViewController *)self canShowAvatarViewWithTraitCollection:v6]];

  [(MainWindowRootViewController *)self updateNewEventButtonEnabledness];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  rootNavigationController = self->_rootNavigationController;
  id v7 = a4;
  if ([(RootNavigationController *)rootNavigationController shouldHandleCanPerformActionForSelector:a3])
  {
    unsigned __int8 v8 = [(RootNavigationController *)self->_rootNavigationController canPerformAction:a3 withSender:v7];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MainWindowRootViewController;
    unsigned __int8 v8 = [(MainWindowRootViewController *)&v11 canPerformAction:a3 withSender:v7];
  }
  BOOL v9 = v8;

  return v9;
}

- (void)routeNewEventKeyCommand
{
  id v3 = [(MainWindowRootViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] != (id)2) {
    goto LABEL_4;
  }
  id v4 = [(MainWindowRootViewController *)self presentedViewController];
  if (v4)
  {

LABEL_4:
LABEL_5:
    rootNavigationController = self->_rootNavigationController;
    [(RootNavigationController *)rootNavigationController handleNewEventKeyCommand];
    return;
  }
  id v6 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];

  if (v6) {
    goto LABEL_5;
  }
  id v7 = [(RootNavigationController *)self->_rootNavigationController addEventBarButtonItem];
  unsigned int v8 = [v7 isEnabled];

  if (v8)
  {
    [(MainWindowRootViewController *)self showAddEvent];
  }
}

- (void)routeSearchKeyCommand
{
  id v3 = [(MainWindowRootViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] != (id)2) {
    goto LABEL_4;
  }
  id v4 = [(MainWindowRootViewController *)self presentedViewController];
  if (v4)
  {

LABEL_4:
LABEL_5:
    rootNavigationController = self->_rootNavigationController;
    [(RootNavigationController *)rootNavigationController handleSearchKeyCommand];
    return;
  }
  id v6 = [(RootNavigationController *)self->_rootNavigationController presentedViewController];

  if (v6) {
    goto LABEL_5;
  }
  [(MainWindowRootViewController *)self searchTapped];
  searchBar = self->_searchBar;

  [(UISearchBar *)searchBar becomeFirstResponder];
}

- (void)handleTodayKeyCommand
{
}

- (void)handleRefreshKeyCommand
{
}

- (void)handleGoToNextDateComponentUnitCommand
{
}

- (void)handleGoToPreviousDateComponentUnitCommand
{
}

- (void)handleSelectNextEventCommand
{
}

- (void)handleSelectPreviousEventCommand
{
}

- (void)handleSelectNextOccurrenceCommand
{
}

- (void)handleSelectPreviousOccurrenceCommand
{
}

- (void)handleDayKeyCommand
{
}

- (void)handleWeekKeyCommand
{
}

- (void)handleMonthKeyCommand
{
}

- (void)handleYearKeyCommand
{
}

- (void)handleCloseKeyCommand
{
}

- (void)handleDismissSplashScreenKeyCommand
{
}

- (void)handleViewAvailabilityCommand
{
}

- (void)paste:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)cut:(id)a3
{
}

- (void)handleDeleteKeyCommand
{
}

- (void)handleDuplicateKeyCommand
{
}

- (BOOL)_shouldUseSideBar
{
  v2 = [(MainWindowRootViewController *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == (id)2;

  return v3;
}

- (void)showCalendarsView
{
}

- (void)showCalendarsViewWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MainWindowRootViewController *)self _shouldUseSideBar]) {
    [(MainWindowRootViewController *)self showCalendarsSideBarWithCompletion:v4];
  }
  else {
    [(RootNavigationController *)self->_rootNavigationController showCalendarsAnimated:1 completion:v4];
  }
}

- (void)showInboxView
{
  if ([(MainWindowRootViewController *)self _shouldUseSideBar])
  {
    [(MainWindowRootViewController *)self showInboxSideBarWithCompletion:0];
  }
  else
  {
    id v3 = [(RootNavigationController *)self->_rootNavigationController showInboxAnimated:1];
  }
}

- (void)showListView
{
  if ([(MainWindowRootViewController *)self _shouldUseSideBar])
  {
    [(MainWindowRootViewController *)self showListSideBarWithCompletion:0];
  }
  else
  {
    id v3 = [(RootNavigationController *)self->_rootNavigationController resetToDayView];

    if (v3)
    {
      rootNavigationController = self->_rootNavigationController;
      [(RootNavigationController *)rootNavigationController toggleDayViewMode:2];
    }
  }
}

- (void)showSearchView
{
  if ([(MainWindowRootViewController *)self _shouldUseSideBar])
  {
    [(MainWindowRootViewController *)self showSearchSideBar];
  }
  else
  {
    id v3 = [(RootNavigationController *)self->_rootNavigationController showSearchAnimated:1 becomeFirstResponder:1 completion:0];
  }
}

- (void)showSplitMonthView
{
  id v3 = [(RootNavigationController *)self->_rootNavigationController resetToMonthView];

  if (v3)
  {
    if ([(MainWindowRootViewController *)self _shouldUseSideBar])
    {
      [(MainWindowRootViewController *)self showListView];
    }
    else
    {
      id v4 = [(RootNavigationController *)self->_rootNavigationController resetToMonthViewSplit:1];
    }
  }
}

- (void)showDayView
{
  id v3 = [(RootNavigationController *)self->_rootNavigationController resetToDayView];

  if (v3)
  {
    rootNavigationController = self->_rootNavigationController;
    [(RootNavigationController *)rootNavigationController toggleDayViewMode:0];
  }
}

- (void)showWeekView
{
  id v2 = [(RootNavigationController *)self->_rootNavigationController resetToWeekView];
}

- (void)showMonthView
{
  id v2 = [(RootNavigationController *)self->_rootNavigationController resetToMonthViewSplit:0];
}

- (void)showYearView
{
  id v2 = [(RootNavigationController *)self->_rootNavigationController resetToYearView];
}

- (void)showInspectorForCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F60A0;
  void v7[3] = &unk_1001D5328;
  id v8 = a3;
  BOOL v9 = a4;
  id v6 = v8;
  [(MainWindowRootViewController *)self showCalendarsViewWithCompletion:v7];
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MainWindowRootViewController *)self presentedViewController];

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F6190;
    v8[3] = &unk_1001D3518;
    void v8[4] = self;
    BOOL v10 = v4;
    id v9 = v6;
    [(MainWindowRootViewController *)self dismissViewControllerAnimated:v4 completion:v8];
  }
  else
  {
    [(RootNavigationController *)self->_rootNavigationController dismissPresentedViewControllerAnimated:v4 completion:v6];
  }
}

- (id)undoManager
{
  return [(RootNavigationController *)self->_rootNavigationController undoManager];
}

- (unint64_t)currentSidebarState
{
  return self->_currentSidebarState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQ, 0);
  objc_storeStrong((id *)&self->_buttonQ, 0);
  objc_storeStrong((id *)&self->_calendarsPreservedState, 0);
  objc_storeStrong((id *)&self->_presentedInboxVC, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_secondaryContainerVC, 0);
  objc_storeStrong((id *)&self->_primaryVC, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);

  objc_storeStrong((id *)&self->_rootNavigationController, 0);
}

@end