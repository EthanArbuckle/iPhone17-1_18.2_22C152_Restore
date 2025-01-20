@interface SearchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isSearchingAlongTheRoute;
- (BOOL)isShowingOmnipresentSearchBar;
- (BOOL)maintainSearchStateWhenDisappearing;
- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4;
- (BOOL)shouldInjectVenueSearchResult:(id)a3;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4;
- (BOOL)shouldRetainSearchQuery;
- (BOOL)shouldShowSearchOverlay;
- (BOOL)supportsFullTextSearch;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CardButton)closeSearchResultsButton;
- (DataSource)currentDataSource;
- (MapsDragDestinationHandler)mapsDragDestinationHandler;
- (MenuContaineeViewController)menuController;
- (NavActionCoordination)navContaineeDelegate;
- (ParkedCarActionDelegate)homeParkedCarActionDelegate;
- (PersonalizedItemManager)personalizedItemManager;
- (PersonalizedItemSource)suggestionsItemSource;
- (SearchViewController)init;
- (SearchViewController)initWithSearchAlongRoute:(BOOL)a3;
- (ShareDelegate)homeShareDelegate;
- (UIScrollView)pptTestScrollView;
- (UIScrollView)scrollViewForProactive;
- (VKVenueFeatureMarker)venueWithFocus;
- (double)_contentAlphaForCurrentLayout;
- (double)heightForContaineeLayoutMedium;
- (double)heightForLayout:(unint64_t)a3;
- (double)isTouristHereValue;
- (id)_homeViewController;
- (id)browseModeHeaderView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentSearchSession;
- (id)defaultSearchQueryToRetain;
- (id)keyCommands;
- (id)lastViewportChangeDate;
- (id)localSearchViewController;
- (id)mapServiceTraitsForQuickActionPresenter:(id)a3;
- (id)newTraits;
- (id)offlinePlaceholderQueue;
- (id)recentAutocompleteSessionData;
- (id)searchBar;
- (id)searchDataSource;
- (id)searchHomeDataSource;
- (id)searchResultsViewController;
- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)listForDataSource:(id)a3;
- (int)uiTargetForQuickActionMenu;
- (int64_t)currentDataSourceType;
- (int64_t)floatingControlsOptions;
- (unint64_t)preferredPresentationStyle;
- (void)_addRecentPlaceForSearchResult:(id)a3;
- (void)_addVenueObserver;
- (void)_configureForceTouchIfNeeded;
- (void)_configureSearchBarIfNeeded;
- (void)_enableTextFieldNotification:(BOOL)a3;
- (void)_hideSearchHereControl;
- (void)_initOfflinePlaceHolderWithCompletion:(id)a3;
- (void)_initPlaceholderWithSubmitTicketIfNeeded:(BOOL)a3;
- (void)_internalViewDidAppear;
- (void)_internalViewDidDisappear;
- (void)_internalViewWillAppear;
- (void)_internalViewWillDisappear;
- (void)_invalidateMediumHeightCache;
- (void)_invalidateSearchSession:(id)a3;
- (void)_offlineSettingChangeHandler;
- (void)_popToHomeWithCompletion:(id)a3;
- (void)_preventAutoPresentingKeyboard_rdar_126940251;
- (void)_restoreRetainedQueryIfNeeded;
- (void)_setPlaceHolder;
- (void)_setupOfflinePlaceholder;
- (void)_setupOnlinePlaceholder;
- (void)_shouldHideOfflineHeaderView:(BOOL)a3;
- (void)_startMonitoringCoreRoutine;
- (void)_textFieldDidChange:(id)a3;
- (void)_textFieldDidChange:(id)a3 tappedQuerySuggestionCompletion:(id)a4;
- (void)_updateDefaultLayoutWithContainerStyle:(unint64_t)a3;
- (void)_updateHeaderHairlineAlphaWithContentAlpha:(double)a3 animated:(BOOL)a4;
- (void)_updateSearchFieldText;
- (void)_updateSearchFieldWithItem:(id)a3 updatingSearchText:(BOOL)a4;
- (void)_updateUserProfileEntryPointButton;
- (void)_updateUserProfileEntryPointImage;
- (void)addCloseSearchResultsButtonBesidesSearchBar:(id)a3;
- (void)addRefreshFooter:(BOOL)a3 animated:(BOOL)a4;
- (void)addSupportedChildActionToTraits:(id)a3;
- (void)applyAlphaToContent:(double)a3;
- (void)cleanSearch;
- (void)clearRetainedSearchQuery;
- (void)clearSelectionWithReason:(id)a3;
- (void)closeSearchResultsButtonAction:(id)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4 childItemParent:(id)a5;
- (void)dataSourceUpdated:(id)a3;
- (void)didBecomeCurrent;
- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didResignCurrent;
- (void)didSelectSearchBar:(id)a3;
- (void)didStartDownloadFromAutocomplete;
- (void)didTapOnCuratedGuide:(id)a3;
- (void)didTapOnCuratedGuides:(id)a3;
- (void)didTapOnHomePinnedLibraryItem:(id)a3;
- (void)didTapOnUserGeneratedGuide:(id)a3;
- (void)didTapToUnpinLibraryItem:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)didUpdateSearchResults;
- (void)displaySearchResultsWithViewController:(id)a3 searchBar:(id)a4;
- (void)editCollection:(id)a3;
- (void)endEditing;
- (void)endSearch;
- (void)endSearchForTesting;
- (void)fetchMapItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchSearchCompletion:(id)a3 completion:(id)a4;
- (void)handleDismissAction:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)homeContentDidUpdate;
- (void)homeDidTapMarkMyLocation;
- (void)homeDidTapOnContainment:(id)a3 forResults:(id)a4;
- (void)homeDidTapOnPlaceContextWithViewModel:(id)a3;
- (void)homeDidTapReportAProblem;
- (void)homeDidTapShareMyLocation;
- (void)homeDidTapTermsAndConditions;
- (void)homeDidTapToUnpinLibraryShortcutItem:(id)a3;
- (void)homeItemTapped:(id)a3;
- (void)homePinnedLibraryItemTapped:(id)a3;
- (void)homeSectionHeaderButtonTapped:(int64_t)a3;
- (void)initializeCachedTelephonyValue;
- (void)keyboardProxyViewCreated:(id)a3;
- (void)localSearchViewControllerSizeDidChange:(id)a3;
- (void)localSearchViewShouldBeVisibleDidChange:(id)a3;
- (void)logOfflineBrowseMode:(BOOL)a3;
- (void)macMenuPresentationControllerDidDismiss:(id)a3;
- (void)macMenuPresentationControllerWillDismiss:(id)a3;
- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)popoverDismissed:(id)a3;
- (void)popoverPresented:(id)a3;
- (void)pptSearchBarShouldProvideTextChangeNotification;
- (void)pptSelectACSuggestionMatchingAddress:(id)a3;
- (void)pptSelectFirstCuratedCollection;
- (void)pptSelectFirstGuidePublisher;
- (void)pptSelectSeeAllCuratedCollections;
- (void)pptSetSearchDataSource;
- (void)preferredContentSizeChanged:(id)a3;
- (void)presentUserProfile;
- (void)presentVenueWithVenueCardItem:(id)a3;
- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4;
- (void)refreshCurrentSearch;
- (void)reloadContentTableView;
- (void)resetMapServiceTicket;
- (void)resetOfflineTextSearchSupport;
- (void)restoreSearchItem:(id)a3;
- (void)retainSearchQuery;
- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 forTimeInterval:(double)a4;
- (void)retainSearchQueryForSelectedSearchResult:(id)a3;
- (void)retainSpotlightQuery:(id)a3 metadata:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchBarBecomeFirstResponder;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4;
- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4;
- (void)seeAllTappedForCollections;
- (void)seeAllTappedForRecents;
- (void)seeAllTappedForUserGuides;
- (void)selectNearbyCategoryAtIndex:(unint64_t)a3;
- (void)sendACRequestWithTappedQuerySuggestionCompletion:(id)a3 retainQueryMetadata:(id)a4;
- (void)sendSearchRequest;
- (void)setCloseSearchResultsButton:(id)a3;
- (void)setCurrentDataSource:(id)a3;
- (void)setMaintainSearchStateWhenDisappearing:(BOOL)a3;
- (void)setMenuController:(id)a3;
- (void)setNavContaineeDelegate:(id)a3;
- (void)setNeedsUpdateContentState;
- (void)setPersonalizedItemManager:(id)a3;
- (void)setSearchingAlongTheRoute:(BOOL)a3;
- (void)shareCollection:(id)a3 collection:(id)a4;
- (void)showCitySelector;
- (void)showCollection:(id)a3;
- (void)showDropDown:(BOOL)a3;
- (void)showGuidesHomeFromExploreGuides:(id)a3;
- (void)showRegionSelectorForMapItem:(id)a3;
- (void)showSearchResults:(id)a3;
- (void)showSearchingHereIfNeeded:(BOOL)a3;
- (void)showTitleBarSeparatorWhenScrolling:(BOOL)a3;
- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)triggerAutocompleteByReplacingQueryWithCompletion:(id)a3;
- (void)updateCloseSearchResultEntryPointButton:(id)a3 searchBarToButtonSpacing:(double)a4 userButtonWidth:(double)a5;
- (void)updateConstraintsForHideableFooterForWasVisible:(BOOL)a3 isVisible:(BOOL)a4;
- (void)updateContentState;
- (void)updateDataSource;
- (void)updateIsTouristHereValue;
- (void)updateRefreshFooter;
- (void)updateRefreshFooterAnimated:(BOOL)a3;
- (void)updateRowHeightForCurrentDataSource;
- (void)updateSearchFieldWithItem:(id)a3;
- (void)updateTheme;
- (void)venueDidReceiveEVChargersUpdate:(id)a3;
- (void)viewControllerDidSelectBrowseVenue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willBecomeCurrentByGesture;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation SearchViewController

- (double)_contentAlphaForCurrentLayout
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 contentAlpha];
  double v4 = v3;

  return v4;
}

- (void)setPersonalizedItemManager:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_personalizedItemManager, v5);
  searchDataSource = self->_searchDataSource;
  if (searchDataSource) {
    [(SearchDataSource *)searchDataSource setMapPersonalizedItems:v5];
  }
}

- (void)updateSearchFieldWithItem:(id)a3
{
  id v6 = a3;
  if (sub_1000BBB44(self) == 5 && ([v6 isSpotlightSearch] & 1) == 0)
  {
    id v5 = +[UIApplication sharedApplication];
    uint64_t v4 = (uint64_t)[v5 isRunningTest];
  }
  else
  {
    uint64_t v4 = 1;
  }
  [(SearchViewController *)self _updateSearchFieldWithItem:v6 updatingSearchText:v4];
}

- (void)_configureForceTouchIfNeeded
{
  if (!self->_quickActionMenuPresenter)
  {
    double v3 = [[SearchResultQuickActionMenuPresenter alloc] initWithTableView:self->_contentTableView];
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v3;

    id v5 = self->_quickActionMenuPresenter;
    [(QuickActionMenuPresenter *)v5 setDelegate:self];
  }
}

- (void)_startMonitoringCoreRoutine
{
  id v3 = +[CoreRoutineLocationOfInterestManager sharedManager];
  v2 = +[NSSet setWithArray:&off_1013ADE60];
  [v3 monitorLOIsOfTypes:v2];
}

- (void)_updateSearchFieldWithItem:(id)a3 updatingSearchText:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (SearchFieldItem *)a3;
  if (self->_searchItem != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_searchItem, a3);
    [(SearchViewController *)self loadViewIfNeeded];
    if (v4) {
      [(SearchViewController *)self _updateSearchFieldText];
    }
    [(SearchViewController *)self setNeedsUpdateContentState];
    [(SearchViewController *)self updateDataSource];
    [(SearchDataSource *)self->_searchDataSource clearAutocompleteResults];
    [(SearchDataSource *)self->_searchDataSource reset];
    v7 = v8;
  }
}

- (void)_restoreRetainedQueryIfNeeded
{
  id v3 = [(SearchViewController *)self currentSearchSession];

  if (!v3)
  {
    objc_initWeak(&location, self);
    retainedQueryController = self->_retainedQueryController;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100022694;
    v5[3] = &unk_1012F78B8;
    objc_copyWeak(&v6, &location);
    [(RetainedQueryController *)retainedQueryController restoreIfNeededWithBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)cleanSearch
{
  id v7 = [(SearchViewController *)self searchResultsViewController];
  if (v7)
  {
    [v7 willMoveToParentViewController:0];
    id v3 = [v7 view];
    [v3 removeFromSuperview];

    [v7 removeFromParentViewController];
    BOOL v4 = [(SearchViewController *)self closeSearchResultsButton];
    [v4 setHidden:1];
  }
  [(SearchDataSource *)self->_searchDataSource reset];
  id v5 = objc_alloc_init(SearchFieldItem);
  [(SearchViewController *)self updateSearchFieldWithItem:v5];

  userTypedSearchString = self->_userTypedSearchString;
  self->_userTypedSearchString = 0;

  [(SearchViewController *)self _hideSearchHereControl];
}

- (void)_internalViewWillAppear
{
  [(SearchViewController *)self updateDataSource];
  [(SearchViewController *)self _restoreRetainedQueryIfNeeded];
  [(SearchViewController *)self _configureSearchBarIfNeeded];
  [(SearchViewController *)self _configureForceTouchIfNeeded];
  [(SearchViewController *)self _addVenueObserver];
  if (!self->_currentDataSource) {
    [(HomeViewController *)self->_homeViewController scrollContentToOriginalPosition];
  }
  id v4 = +[UserInformationManager sharedInstance];
  id v3 = [v4 observers];
  [v3 registerObserver:self queue:&_dispatch_main_q];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SVC viewWillAppear", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v8 viewWillAppear:v3];
  id v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)5) {
    [(SearchViewController *)self _internalViewWillAppear];
  }
}

- (void)willBecomeCurrent:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchViewController;
  -[ContaineeViewController willBecomeCurrent:](&v10, "willBecomeCurrent:");
  [(SearchViewController *)self _internalViewWillAppear];
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 updateHistoricalLocations];

  currentDataSource = self->_currentDataSource;
  if (!currentDataSource) {
    currentDataSource = self->_homeViewController;
  }
  [currentDataSource setActive:1];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    id v7 = [(SearchViewController *)self searchResultsViewController];
    objc_super v8 = v7;
    if (v7) {
      [v7 willBecomeCurrent:v3];
    }
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"SearchWillBecomeCurrentNotification" object:self];
}

- (void)_hideSearchHereControl
{
  v2 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v2 containerViewController];
  id v5 = [v3 chromeViewController];

  id v4 = [v5 redoSearchOverlay];
  [v4 shouldHideFloatingControl:1 animated:0];
}

- (void)_updateSearchFieldText
{
  BOOL v3 = [(SearchViewController *)self currentSearchSession];
  id v4 = [v3 suggestion];
  id v10 = [v4 searchBarDisplayToken];

  if (v10)
  {
    id v5 = v10;
  }
  else
  {
    id v5 = [(SearchFieldItem *)self->_searchItem searchString];
  }
  id v6 = v5;
  id v7 = [(PassthruSearchBar *)self->_searchBar searchField];
  objc_super v8 = [v7 text];
  if (![v8 isEqualToString:v6])
  {

    goto LABEL_8;
  }
  unsigned __int8 v9 = [v7 isFirstResponder];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    +[CATransaction setFrameStallSkipRequest:1];
    [v7 setText:v6];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SearchViewController;
  [(SearchViewController *)&v4 viewLayoutMarginsDidChange];
  BOOL v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 bottomSafeOffset];
  -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");
}

- (void)_addVenueObserver
{
  BOOL v3 = [(ControlContaineeViewController *)self delegate];
  objc_super v4 = [v3 venuesManager];
  [v4 addChangeObserver:self];

  id v8 = [(LocalSearchViewController *)self->_localSearchViewController browseVenueBusinessController];
  id v5 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v5 venuesManager];
  id v7 = [v6 venueWithFocus];
  [v8 handleVenueWithFocusDidChange:v7];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v7 viewDidLayoutSubviews];
  BOOL v3 = [(SearchViewController *)self currentDataSource];
  objc_super v4 = v3;
  if (v3 == self->_searchDataSource)
  {
    unsigned int v5 = [(SearchDataSource *)v3 shouldReloadOnHeightChange];

    if (v5) {
      [(SearchViewController *)self reloadContentTableView];
    }
  }
  else
  {
  }
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  -[SearchViewController _updateDefaultLayoutWithContainerStyle:](self, "_updateDefaultLayoutWithContainerStyle:", [v6 containerStyle]);
}

- (DataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (void)_updateDefaultLayoutWithContainerStyle:(unint64_t)a3
{
  if (a3 == 6) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setDefaultContaineeLayout:v3];
}

- (void)addCloseSearchResultsButtonBesidesSearchBar:(id)a3
{
  id v4 = a3;
  if (![(SearchViewController *)self isSearchingAlongTheRoute])
  {
    unsigned int v5 = [CardButton alloc];
    id v6 = +[CardButtonConfiguration close];
    objc_super v7 = [(CardButton *)v5 initWithConfiguration:v6];
    [(SearchViewController *)self setCloseSearchResultsButton:v7];

    id v8 = [(SearchViewController *)self closeSearchResultsButton];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    unsigned __int8 v9 = [(SearchViewController *)self closeSearchResultsButton];
    [v9 setAccessibilityIdentifier:@"closeSearchResultsButton"];

    id v10 = [(SearchViewController *)self closeSearchResultsButton];
    [v10 addTarget:self action:"closeSearchResultsButtonAction:" forControlEvents:64];

    v11 = [(ContaineeViewController *)self headerView];
    v12 = [(SearchViewController *)self closeSearchResultsButton];
    [v11 addSubview:v12];

    v23 = [(SearchViewController *)self closeSearchResultsButton];
    v13 = [v23 centerYAnchor];
    v14 = [v4 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[0] = v15;
    v16 = [(SearchViewController *)self closeSearchResultsButton];
    v17 = [v16 trailingAnchor];
    v18 = [(SearchViewController *)self view];
    v19 = [v18 trailingAnchor];
    [v17 constraintEqualToAnchor:v19];
    v21 = id v20 = v4;
    v24[1] = v21;
    v22 = +[NSArray arrayWithObjects:v24 count:2];
    +[NSLayoutConstraint activateConstraints:v22];

    id v4 = v20;
  }
}

- (CardButton)closeSearchResultsButton
{
  return self->_closeSearchResultsButton;
}

- (PersonalizedItemSource)suggestionsItemSource
{
  v2 = [(SearchViewController *)self _homeViewController];
  uint64_t v3 = [v2 suggestionsItemSource];

  return (PersonalizedItemSource *)v3;
}

- (id)_homeViewController
{
  if ([(SearchViewController *)self isViewLoaded])
  {
    homeViewController = self->_homeViewController;
    if (!homeViewController)
    {
      id v4 = [[HomeViewController alloc] initWithDelegate:self];
      unsigned int v5 = self->_homeViewController;
      self->_homeViewController = v4;

      homeViewController = self->_homeViewController;
    }
    id v6 = homeViewController;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)newTraits
{
  v2 = [(ControlContaineeViewController *)self delegate];
  id v3 = [v2 newTraits];

  return v3;
}

- (void)_updateUserProfileEntryPointImage
{
  id v5 = +[UserInformationManager sharedInstance];
  userProfileButton = self->_userProfileButton;
  id v4 = [v5 userIcon];
  [(UIButton *)userProfileButton setImage:v4 forState:0];
}

- (unint64_t)preferredPresentationStyle
{
  return 1;
}

- (void)applyAlphaToContent:(double)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SearchViewController;
  -[ContaineeViewController applyAlphaToContent:](&v15, "applyAlphaToContent:");
  [(SearchViewController *)self _updateHeaderHairlineAlphaWithContentAlpha:0 animated:a3];
  id v5 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v5 currentSearchSession];

  if (v6)
  {
    objc_super v7 = [(SearchViewController *)self searchResultsViewController];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 parentViewController];
      if (v9)
      {
        id v10 = (void *)v9;
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          v12 = [(ContaineeViewController *)self cardPresentationController];
          id v13 = [v12 containeeLayout];

          double v14 = 0.0;
          if (v13 != (id)1) {
            double v14 = a3;
          }
          [v8 applyAlphaToContent:v14];
        }
      }
    }
  }
}

- (void)_updateHeaderHairlineAlphaWithContentAlpha:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = 0.0;
  if (sub_1000BBB44(self) != 5)
  {
    currentDataSource = (SearchHomeDataSource *)self->_currentDataSource;
    if (currentDataSource)
    {
      if (currentDataSource != self->_searchHomeDataSource
        || ![(SearchHomeDataSource *)currentDataSource shouldHideHairLine])
      {
        uint64_t v9 = [(SearchViewController *)self currentDataSource];
        id v10 = [v9 presentationStyle];

        if (v10 == (id)1)
        {
          uint64_t v11 = 216;
        }
        else
        {
          if (v10) {
            goto LABEL_16;
          }
          uint64_t v11 = 208;
        }
        if ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v11) _maps_shouldShowTopHairline])double v7 = a3; {
        else
        }
          double v7 = 0.0;
      }
    }
    else
    {
      BOOL v12 = [(HomeViewController *)self->_homeViewController shouldShowTopHairline];
      if (v12) {
        double v7 = a3;
      }
      else {
        double v7 = 0.0;
      }
      id v13 = [(HomeViewController *)self->_homeViewController scrollView];
      [v13 setClipsToBounds:v12];
    }
  }
LABEL_16:
  v14[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D0E24;
  v15[3] = &unk_1012EB708;
  v15[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100107B54;
  v14[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:v4 animated:v15 getter:v14 setter:v7];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    id v13 = [(ContaineeViewController *)self cardPresentationController];
    [v13 availableHeight];
LABEL_8:
    double v15 = v14;

    return v15;
  }
  if (a3 != 2)
  {
    double result = -1.0;
    if (a3 == 1)
    {
      if (![(LocalSearchViewController *)self->_localSearchViewController shouldBeVisible]) {
        goto LABEL_20;
      }
      [(UIView *)self->_hideableFooterView frame];
      double Height = CGRectGetHeight(v24);
      id v6 = self->_hideableFooterView;
      double v7 = [(UIView *)v6 window];
      id v8 = [v7 screen];
      if (v8)
      {
        uint64_t v9 = [(UIView *)v6 window];
        id v10 = [v9 screen];
        [v10 nativeScale];
        double v12 = v11;
      }
      else
      {
        uint64_t v9 = +[UIScreen mainScreen];
        [v9 nativeScale];
        double v12 = v17;
      }

      double v18 = v12 <= 0.0 ? 1.0 : 1.0 / v12;
      double v19 = Height - v18;
      if (v19 == 0.0)
      {
LABEL_20:
        id v20 = [(ContaineeViewController *)self cardPresentationController];
        [v20 bottomSafeOffset];
        double v19 = v21;
      }
      [(ContaineeViewController *)self headerHeight];
      return v19 + v22;
    }
    return result;
  }
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    v16 = [(SearchViewController *)self searchResultsViewController];

    if (v16)
    {
      id v13 = +[UIScreen mainScreen];
      [v13 bounds];
      UIRoundToScreenScale();
      goto LABEL_8;
    }
  }

  [(SearchViewController *)self heightForContaineeLayoutMedium];
  return result;
}

- (id)searchResultsViewController
{
  if (sub_1000BBB44(self) == 5)
  {
    id v3 = 0;
  }
  else
  {
    BOOL v4 = [(SearchViewController *)self childViewControllers];
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_100104410;
    double v11 = sub_100104A78;
    id v12 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100074FF4;
    v6[3] = &unk_10131AC90;
    v6[4] = &v7;
    [v4 enumerateObjectsUsingBlock:v6];
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return v3;
}

- (BOOL)isShowingOmnipresentSearchBar
{
  int IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery();
  if (IsEnabled_SearchAndDiscovery) {
    LOBYTE(IsEnabled_SearchAndDiscovery) = sub_1000BBB44(self) != 5;
  }
  return IsEnabled_SearchAndDiscovery;
}

- (double)heightForContaineeLayoutMedium
{
  double result = self->_cachedMediumHeight;
  if (result == 0.0)
  {
    [(ContaineeViewController *)self headerHeight];
    double v5 = v4;
    sub_10002197C();
    double v7 = v6;
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    id v9 = [v8 containerStyle];

    if (v9 == (id)6)
    {
      if (self->_currentDataSource)
      {
        if (+[UIFont accessibilityTextEnabled])
        {
          double v10 = UITableViewAutomaticDimension;
        }
        else
        {
          id v12 = +[UIFont system15];
          +[TwoLinesTableViewCell estimatedCellHeight];
          [v12 _mapkit_scaledValueForValue:];
          double v10 = v13;
        }
        double v7 = v10 * 3.0 + -1.0;
      }
      else
      {
        [(HomeViewController *)self->_homeViewController mediumContentHeight];
        double v7 = v11;
      }
    }
    else if (v5 + v7 > v7)
    {
      double v7 = v7 - v5;
    }
    double result = v5 + v7;
    self->_cachedMediumdouble Height = v5 + v7;
  }
  return result;
}

- (int64_t)floatingControlsOptions
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  id v3 = [v2 containerStyle];

  if (v3 == (id)6) {
    return 255;
  }
  else {
    return 251;
  }
}

- (id)currentSearchSession
{
  v2 = [(ControlContaineeViewController *)self delegate];
  id v3 = [v2 currentSearchSession];

  return v3;
}

- (void)updateDataSource
{
  if (![(SearchViewController *)self isViewLoaded]) {
    return;
  }
  id v3 = [(UITextField *)self->_searchField text];
  double v4 = [v3 _maps_stringByTrimmingLeadingWhitespace];
  if ([v4 length])
  {
    BOOL v5 = 1;
  }
  else if (sub_1000BBB44(self) == 5)
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [(SearchViewController *)self searchResultsViewController];
    BOOL v5 = v6 != 0;
  }
  if (([(UITextField *)self->_searchField isFirstResponder] & 1) != 0
    || ([(PassthruSearchBar *)self->_searchBar showsCancelButton] & 1) != 0)
  {
    unsigned int v7 = 1;
  }
  else
  {
    unsigned int v7 = [(SearchViewController *)self isSearchingAlongTheRoute];
  }
  if (sub_1000BBB44(self) == 5)
  {
    if (v5)
    {
      id v8 = [(SearchViewController *)self menuController];
      id v9 = [v8 macMenuPresentationController];
      unsigned __int8 v10 = [v9 isPresented];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
    id v12 = [(SearchViewController *)self menuController];
    double v13 = [v12 macMenuPresentationController];
    unsigned int v7 = [v13 isPresented];

    if ((v10 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_16:
    uint64_t v11 = [(SearchViewController *)self searchDataSource];
    goto LABEL_21;
  }
  if (v5) {
    goto LABEL_16;
  }
LABEL_19:
  if (!v7)
  {
    double v15 = +[MapsOfflineUIHelper sharedHelper];
    if ([v15 isUsingOfflineMaps])
    {
      BOOL supportsFullTextSearch = self->_supportsFullTextSearch;

      if (!supportsFullTextSearch)
      {
        [(SearchViewController *)self _shouldHideOfflineHeaderView:1];
        [(UITextField *)self->_searchField resignFirstResponder];
      }
    }
    else
    {
    }
    double v14 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = [(SearchViewController *)self searchHomeDataSource];
LABEL_21:
  double v14 = (void *)v11;
LABEL_27:
  id v19 = v14;
  [(SearchViewController *)self setCurrentDataSource:v14];
  double v17 = +[MapsOfflineUIHelper sharedHelper];
  if ([v17 isUsingOfflineMaps])
  {
    BOOL v18 = self->_supportsFullTextSearch;

    if (!v18) {
      [(UITextField *)self->_searchField resignFirstResponder];
    }
  }
  else
  {
  }
}

- (void)setCurrentDataSource:(id)a3
{
  BOOL v5 = (DataSource *)a3;
  double v6 = v5;
  p_currentDataSource = &self->_currentDataSource;
  if (self->_currentDataSource == v5 && (v5 || [(HomeViewController *)self->_homeViewController isActive])) {
    goto LABEL_40;
  }
  id v8 = sub_1000AA148();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v83 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SVC setCurrentDataSource %@", buf, 0xCu);
  }

  if (*p_currentDataSource)
  {
    [*p_currentDataSource setActive:0];
  }
  else if (sub_1000BBB44(self) != 5)
  {
    [(HomeViewController *)self->_homeViewController setActive:0];
    [(UIButton *)self->_userProfileButton setHidden:1];
    [(SearchViewController *)self _updateUserProfileEntryPointButton];
  }
  if (*p_currentDataSource == (DataSource *)self->_searchHomeDataSource)
  {
    [(UICollectionView *)self->_collectionView _maps_scrollContentToOriginalPosition];
    if (v6)
    {
LABEL_13:
      [(SearchViewController *)self updateIsTouristHereValue];
      objc_storeStrong((id *)&self->_currentDataSource, a3);
      if (sub_1000BBB44(self) == 5)
      {
        id v9 = self->_dropDownView;
      }
      else
      {
        id v9 = [(ContaineeViewController *)self contentView];
      }
      v33 = v9;
      id v34 = [(DataSource *)v6 presentationStyle];
      if (v34 == (id)1)
      {
        [(UICollectionView *)self->_collectionView setDelegate:v6];
        if ([(DataSource *)v6 conformsToProtocol:&OBJC_PROTOCOL___DataSourceCollectionView])
        {
          v39 = [(DataSource *)v6 collectionViewDiffableDataSource];
          [(UICollectionView *)self->_collectionView setDataSource:v39];

          v40 = [(DataSource *)v6 collectionViewLayout];
          [(UICollectionView *)self->_collectionView setCollectionViewLayout:v40];
        }
        [(UITableView *)self->_contentTableView removeFromSuperview];
        v37 = self->_collectionView;
        collectionView = self->_collectionView;
      }
      else
      {
        if (v34)
        {
          v37 = 0;
          goto LABEL_35;
        }
        [(UITableView *)self->_contentTableView setDelegate:v6];
        if ([(DataSource *)v6 conformsToProtocol:&OBJC_PROTOCOL___UITableViewDataSource])[(UITableView *)self->_contentTableView setDataSource:v6]; {
        v35 = +[MapsDragAndDropManager sharedManager];
        }
        unsigned int v36 = [v35 deviceSupportsDragAndDrop];

        if (v36) {
          [(UITableView *)self->_contentTableView setDragDelegate:v6];
        }
        [(UICollectionView *)self->_collectionView removeFromSuperview];
        v37 = self->_contentTableView;
        if (sub_1000BBB44(self) == 5) {
          [(UITableView *)self->_contentTableView setSeparatorStyle:0];
        }
        collectionView = self->_contentTableView;
      }
      v41 = [(SearchViewController *)self menuController];
      [v41 setTrackedScrollview:collectionView];

LABEL_35:
      uint64_t v42 = sub_1000BBB44(self);
      homeViewController = self->_homeViewController;
      v79 = v6;
      if (v42 == 5)
      {
        v44 = [(HomeViewController *)homeViewController view];
        [v44 setAlpha:0.300000012];
      }
      else
      {
        [(HomeViewController *)homeViewController scrollContentToOriginalPosition];
        [(HomeViewController *)self->_homeViewController willMoveToParentViewController:0];
        v45 = [(HomeViewController *)self->_homeViewController view];
        [v45 removeFromSuperview];

        [(HomeViewController *)self->_homeViewController removeFromParentViewController];
      }
      [v33 insertSubview:v37 atIndex:0];
      v76 = [(UICollectionView *)v37 topAnchor];
      v74 = [v33 topAnchor];
      v72 = [v76 constraintEqualToAnchor:v74];
      v81[0] = v72;
      v68 = [(UICollectionView *)v37 leadingAnchor];
      v66 = [v33 leadingAnchor];
      v46 = [v68 constraintEqualToAnchor:v66];
      v81[1] = v46;
      v47 = [(UICollectionView *)v37 trailingAnchor];
      v48 = [v33 trailingAnchor];
      uint64_t v49 = [v47 constraintEqualToAnchor:v48];
      v50 = v37;
      v70 = v37;
      v51 = (void *)v49;
      v81[2] = v49;
      v52 = [(UICollectionView *)v50 bottomAnchor];
      v53 = [v33 bottomAnchor];
      v54 = [v52 constraintEqualToAnchor:v53];
      v81[3] = v54;
      v55 = +[NSArray arrayWithObjects:v81 count:4];
      +[NSLayoutConstraint activateConstraints:v55];

      [self->_currentDataSource setActive:1];
      [(SearchViewController *)self reloadContentTableView];

      double v6 = v79;
      goto LABEL_39;
    }
  }
  else if (v6)
  {
    goto LABEL_13;
  }
  self->_userSelectedSearchBar = 0;
  [(SearchViewController *)self updateIsTouristHereValue];
  unsigned __int8 v10 = *p_currentDataSource;
  *p_currentDataSource = 0;

  [(UITableView *)self->_contentTableView removeFromSuperview];
  [(UICollectionView *)self->_collectionView removeFromSuperview];
  uint64_t v11 = [(HomeViewController *)self->_homeViewController parentViewController];

  if (!v11)
  {
    id v12 = [(SearchViewController *)self _homeViewController];
    [(SearchViewController *)self addChildViewController:v12];

    double v13 = [(ContaineeViewController *)self contentView];
    double v14 = [(HomeViewController *)self->_homeViewController view];
    [v13 insertSubview:v14 atIndex:0];

    [(HomeViewController *)self->_homeViewController didMoveToParentViewController:self];
    double v15 = [(HomeViewController *)self->_homeViewController view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(HomeViewController *)self->_homeViewController view];
    double v17 = [v16 bottomAnchor];
    BOOL v18 = [(ContaineeViewController *)self contentView];
    [v18 bottomAnchor];
    id v19 = v78 = v6;
    id v20 = [v17 constraintEqualToAnchor:v19];
    homeViewControllerBottomConstraint = self->_homeViewControllerBottomConstraint;
    self->_homeViewControllerBottomConstraint = v20;

    v77 = [(HomeViewController *)self->_homeViewController view];
    v73 = [v77 topAnchor];
    v75 = [(ContaineeViewController *)self contentView];
    v71 = [v75 topAnchor];
    v69 = [v73 constraintEqualToAnchor:v71];
    v80[0] = v69;
    v67 = [(HomeViewController *)self->_homeViewController view];
    v64 = [v67 leadingAnchor];
    v65 = [(ContaineeViewController *)self contentView];
    double v22 = [v65 leadingAnchor];
    v23 = [v64 constraintEqualToAnchor:v22];
    v80[1] = v23;
    CGRect v24 = [(HomeViewController *)self->_homeViewController view];
    v25 = [v24 trailingAnchor];
    v26 = [(ContaineeViewController *)self contentView];
    v27 = [v26 trailingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v29 = self->_homeViewControllerBottomConstraint;
    v80[2] = v28;
    v80[3] = v29;
    v30 = +[NSArray arrayWithObjects:v80 count:4];
    +[NSLayoutConstraint activateConstraints:v30];

    double v6 = v78;
  }
  [(HomeViewController *)self->_homeViewController setActive:1];
  [(UIButton *)self->_userProfileButton setHidden:[(PassthruSearchBar *)self->_searchBar isHidden]];
  v31 = [(SearchViewController *)self closeSearchResultsButton];
  v32 = [(SearchViewController *)self searchResultsViewController];
  [v31 setHidden:v32 == 0];

  [(SearchViewController *)self _updateUserProfileEntryPointButton];
  if (sub_1000BBB44(self) == 5)
  {
    v33 = [(HomeViewController *)self->_homeViewController view];
    [v33 setAlpha:1.0];
LABEL_39:
  }
LABEL_40:
  v56 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v57 = [v56 isUsingOfflineMaps];

  if (v57)
  {
    if ([(HomeViewController *)self->_homeViewController isActive])
    {
      [(UIButton *)self->_userProfileButton setHidden:0];
      [(PassthruSearchBar *)self->_searchBar setHidden:0];
      v58 = [(SearchViewController *)self closeSearchResultsButton];
      [v58 setHidden:1];

      v59 = [(SearchViewController *)self browseModeHeaderView];
      [v59 setHidden:1];
    }
    else
    {
      [(PassthruSearchBar *)self->_searchBar setHidden:!self->_supportsFullTextSearch];
      BOOL supportsFullTextSearch = self->_supportsFullTextSearch;
      v61 = [(SearchViewController *)self browseModeHeaderView];
      [v61 setHidden:supportsFullTextSearch];

      BOOL v62 = [(SearchViewController *)self isSearchingAlongTheRoute]
         || self->_supportsFullTextSearch;
      v59 = [(SearchViewController *)self browseModeHeaderView];
      v63 = [v59 buttonView];
      [v63 setHidden:v62];
    }
  }
}

- (void)_updateUserProfileEntryPointButton
{
  if (sub_1000BBB44(self) == 5) {
    return;
  }
  if ([(SearchViewController *)self isSearchingAlongTheRoute]) {
    return;
  }
  id v3 = [(SearchViewController *)self searchResultsViewController];

  if (v3) {
    return;
  }
  double v4 = [(SearchViewController *)self view];
  id v5 = [v4 effectiveUserInterfaceLayoutDirection];

  if ([(UIButton *)self->_userProfileButton isHidden])
  {
    searchBar = self->_searchBar;
    double v7 = 17.0;
    double v8 = 16.0;
  }
  else
  {
    searchBar = self->_searchBar;
    if (v5 != (id)1)
    {
      double v10 = 62.0;
      double v7 = 17.0;
      double v8 = 16.0;
      double v9 = 17.0;
      goto LABEL_11;
    }
    double v8 = 62.0;
    double v7 = 17.0;
  }
  double v9 = 17.0;
  double v10 = 16.0;
LABEL_11:

  -[PassthruSearchBar setContentInset:](searchBar, "setContentInset:", v7, v8, v9, v10);
}

- (void)viewDidLoad
{
  v128.receiver = self;
  v128.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v128 viewDidLoad];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.mapsSuggestions", v3);
  mapsSuggestionsLoadingSearchQueue = self->_mapsSuggestionsLoadingSearchQueue;
  self->_mapsSuggestionsLoadingSearchQueue = v4;

  self->_isConfigured = 0;
  unsigned __int8 v6 = [(SearchViewController *)self isSearchingAlongTheRoute];
  double v7 = [(ContaineeViewController *)self cardPresentationController];
  double v8 = v7;
  if (v6)
  {
    [v7 setBlurInCardView:0];

    double v9 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    double v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 setCardColor:v9];
  }
  else
  {
    [v7 setAllowResizeInFloatingStyle:1];

    double v9 = [(ContaineeViewController *)self cardPresentationController];
    [v9 setFirstCard:1];
  }

  uint64_t v11 = objc_alloc_init(RetainedQueryController);
  retainedQueryController = self->_retainedQueryController;
  self->_retainedQueryController = v11;

  double v13 = [[PassthruSearchBar alloc] initWithStyle:[(SearchViewController *)self isSearchingAlongTheRoute]];
  searchBar = self->_searchBar;
  self->_searchBar = v13;

  [(PassthruSearchBar *)self->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
  double v15 = [(ContaineeViewController *)self headerView];
  [v15 addSubview:self->_searchBar];

  [(PassthruSearchBar *)self->_searchBar setDelegate:self];
  [(PassthruSearchBar *)self->_searchBar setTextFieldDelegate:self];
  v16 = [(PassthruSearchBar *)self->_searchBar searchTextField];
  searchField = self->_searchField;
  self->_searchField = v16;

  self->_isOfflineBrowseRecordedAlreaddouble y = 0;
  BOOL v18 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v19 = [v18 isUsingOfflineMaps];

  if (v19)
  {
    [(SearchViewController *)self _setupOfflinePlaceholder];
    [(SearchViewController *)self _initOfflinePlaceHolderWithCompletion:0];
  }
  self->_isOfflineServiceRunning = 0;
  if (sub_1000BBB44(self) == 5) {
    [(UITextField *)self->_searchField setFocusGroupIdentifier:@"DropDownFocusGroupName"];
  }
  [(UITextField *)self->_searchField setTextDropDelegate:self];
  id v20 = [(SearchViewController *)self theme];
  double v21 = [v20 searchBarPlaceHolderColor];
  double v22 = [(UITextField *)self->_searchField _placeholderLabel];
  [v22 setTextColor:v21];

  self->_searchFieldWantsFocus = 1;
  if (sub_1000BBB44(self) == 5)
  {
    [(UITextField *)self->_searchField setControlSize:2];
    -[PassthruSearchBar setContentInset:](self->_searchBar, "setContentInset:", 3.0, 15.0, 3.0, 15.0);
  }
  v23 = [(SearchViewController *)self view];
  id v24 = [v23 effectiveUserInterfaceLayoutDirection];

  if (sub_1000BBB44(self) != 5 && ![(SearchViewController *)self isSearchingAlongTheRoute])
  {
    if (v24 == (id)1) {
      double v25 = 62.0;
    }
    else {
      double v25 = 16.0;
    }
    if (v24 == (id)1) {
      double v26 = 16.0;
    }
    else {
      double v26 = 62.0;
    }
    if (v24 == (id)1) {
      double v27 = -16.0;
    }
    else {
      double v27 = -8.0;
    }
    if (v24 == (id)1) {
      double v28 = -8.0;
    }
    else {
      double v28 = -16.0;
    }
    -[PassthruSearchBar setContentInset:](self->_searchBar, "setContentInset:", 17.0, v25, 17.0, v26);
    v29 = +[UIButton buttonWithType:0];
    userProfileButton = self->_userProfileButton;
    self->_userProfileButton = v29;

    [(UIButton *)self->_userProfileButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_userProfileButton setAccessibilityIdentifier:@"userProfileButton"];
    v31 = [(UIButton *)self->_userProfileButton imageView];
    v32 = +[UIColor systemGrayColor];
    [v31 setTintColor:v32];

    v33 = [(UIButton *)self->_userProfileButton imageView];
    id v34 = +[UIImageSymbolConfiguration configurationWithPointSize:(uint64_t)UIFontWeightRegular weight:36.0];
    [v33 setPreferredSymbolConfiguration:v34];

    [(UIButton *)self->_userProfileButton addTarget:self action:"presentUserProfile" forControlEvents:64];
    -[UIButton _setTouchInsets:](self->_userProfileButton, "_setTouchInsets:", -17.0, v27, -17.0, v28);
    v35 = [(ContaineeViewController *)self headerView];
    [v35 addSubview:self->_userProfileButton];

    [(SearchViewController *)self _updateUserProfileEntryPointImage];
    v126 = [(UIButton *)self->_userProfileButton widthAnchor];
    v124 = [v126 constraintEqualToConstant:36.0];
    v131[0] = v124;
    v122 = [(UIButton *)self->_userProfileButton heightAnchor];
    v120 = [(UIButton *)self->_userProfileButton widthAnchor];
    v119 = [v122 constraintEqualToAnchor:v120];
    v131[1] = v119;
    unsigned int v36 = [(UIButton *)self->_userProfileButton centerYAnchor];
    v37 = [(PassthruSearchBar *)self->_searchBar centerYAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v131[2] = v38;
    v39 = [(UIButton *)self->_userProfileButton trailingAnchor];
    v40 = [(SearchViewController *)self view];
    v41 = [v40 trailingAnchor];
    uint64_t v42 = [v39 constraintEqualToAnchor:v41 constant:-16.0];
    v131[3] = v42;
    v43 = +[NSArray arrayWithObjects:v131 count:4];
    +[NSLayoutConstraint activateConstraints:v43];
  }
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar]) {
    [(SearchViewController *)self addCloseSearchResultsButtonBesidesSearchBar:self->_searchBar];
  }
  v44 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  searchFieldLayoutGuide = self->_searchFieldLayoutGuide;
  self->_searchFieldLayoutGuide = v44;

  v46 = [(SearchViewController *)self view];
  [v46 addLayoutGuide:self->_searchFieldLayoutGuide];

  v47 = [(UILayoutGuide *)self->_searchFieldLayoutGuide widthAnchor];
  v48 = [v47 constraintGreaterThanOrEqualToConstant:282.0];

  LODWORD(v49) = 1148846080;
  [v48 setPriority:v49];
  v50 = [(UILayoutGuide *)self->_searchFieldLayoutGuide widthAnchor];
  v51 = [(UITextField *)self->_searchField widthAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];

  LODWORD(v53) = 1148829696;
  [v52 setPriority:v53];
  v125 = v52;
  v127 = v48;
  v130[0] = v48;
  v130[1] = v52;
  v54 = [(UILayoutGuide *)self->_searchFieldLayoutGuide leadingAnchor];
  v55 = [(UITextField *)self->_searchField leadingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  v130[2] = v56;
  unsigned int v57 = [(UILayoutGuide *)self->_searchFieldLayoutGuide topAnchor];
  v58 = [(UITextField *)self->_searchField bottomAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  v130[3] = v59;
  v60 = +[NSArray arrayWithObjects:v130 count:4];
  +[NSLayoutConstraint activateConstraints:v60];

  [(SearchViewController *)self _initPlaceholderWithSubmitTicketIfNeeded:0];
  v61 = [(ContaineeViewController *)self headerView];
  double right = 0.0;
  [v61 _maps_addHairlineAtBottomWithMargin:0.0];
  v63 = (HairlineView *)objc_claimAutoreleasedReturnValue();
  bottomHeaderHairline = self->_bottomHeaderHairline;
  self->_bottomHeaderHairline = v63;

  v65 = [(UIView *)self->_hideableFooterView bottomAnchor];
  v66 = [(SearchViewController *)self view];
  v67 = [v66 bottomAnchor];
  v68 = [v65 constraintEqualToAnchor:v67];
  bottomHideableFooterConstraint = self->_bottomHideableFooterConstraint;
  self->_bottomHideableFooterConstraint = v68;

  v70 = +[NSMutableArray array];
  if (sub_1000BBB44(self) == 5)
  {
    double top = -4.0;
    double bottom = 7.0;
    double left = 0.0;
    v74 = NSCollectionLayoutEdgeSpacing_ptr;
  }
  else
  {
    v74 = NSCollectionLayoutEdgeSpacing_ptr;
    if ([(SearchViewController *)self isSearchingAlongTheRoute])
    {
      double bottom = 5.0;
      double left = 0.0;
      double top = 0.0;
    }
    else
    {
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
  }
  v75 = self->_searchBar;
  v76 = [(ContaineeViewController *)self headerView];
  v77 = -[PassthruSearchBar _maps_constraintsForCenteringInView:edgeInsets:](v75, "_maps_constraintsForCenteringInView:edgeInsets:", v76, top, left, bottom, right);
  v123 = v70;
  [v70 addObjectsFromArray:v77];

  if (sub_1000BBB44(self) == 5)
  {
    v78 = (UIView *)objc_alloc_init((Class)UIView);
    dropDownView = self->_dropDownView;
    self->_dropDownView = v78;
  }
  id v80 = objc_alloc((Class)UICollectionView);
  id v81 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v85 = [v80 initWithFrame:CGRectZero.origin.x, y, width, height collectionViewLayout:v81];
  collectionView = self->_collectionView;
  self->_collectionView = v85;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v87 = [v74[237] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v87];

  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"SearchHomeView"];
  [(UICollectionView *)self->_collectionView setPreservesSuperviewLayoutMargins:1];
  if (sub_1000BBB44(self) == 5)
  {
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, 10.0, 0.0);
    [(UICollectionView *)self->_collectionView setFocusGroupIdentifier:@"DropDownFocusGroupName"];
  }
  v88 = objc_alloc_init(MapsThemeTableView);
  contentTableView = self->_contentTableView;
  self->_contentTableView = &v88->super;

  [(UITableView *)self->_contentTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_contentTableView setEstimatedSectionHeaderHeight:0.0];
  id v90 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UITableView *)self->_contentTableView setTableFooterView:v90];

  [(UITableView *)self->_contentTableView _setHeaderAndFooterViewsFloat:0];
  v91 = [v74[237] clearColor];
  [(UITableView *)self->_contentTableView setBackgroundColor:v91];

  v92 = [(UITableView *)self->_contentTableView layer];
  [v92 setAllowsGroupOpacity:0];

  if (sub_1000BBB44(self) == 5) {
    [(UITableView *)self->_contentTableView setFocusGroupIdentifier:@"DropDownFocusGroupName"];
  }
  [(UITableView *)self->_contentTableView setSectionHeaderTopPadding:0.0];
  [(UITableView *)self->_contentTableView setPreservesSuperviewLayoutMargins:1];
  [(UITableView *)self->_contentTableView setAccessibilityIdentifier:@"SearchAutocompleteView"];
  v93 = (UIView *)objc_alloc_init((Class)UIView);
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v93;

  [(UIView *)self->_hideableFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v95 = [(UIView *)self->_hideableFooterView _maps_addHairlineAtTopWithMargin:0.0];
  v96 = [(SearchViewController *)self view];
  v97 = self->_hideableFooterView;
  v98 = [(ContaineeViewController *)self headerView];
  [v96 insertSubview:v97 belowSubview:v98];

  v99 = [(UIView *)self->_hideableFooterView bottomAnchor];
  v100 = [(SearchViewController *)self view];
  v101 = [v100 bottomAnchor];
  v102 = [v99 constraintEqualToAnchor:v101];
  v103 = self->_bottomHideableFooterConstraint;
  self->_bottomHideableFooterConstraint = v102;

  v121 = [(UIView *)self->_hideableFooterView trailingAnchor];
  v104 = [(SearchViewController *)self view];
  v105 = [v104 trailingAnchor];
  v106 = [v121 constraintEqualToAnchor:v105];
  v107 = self->_bottomHideableFooterConstraint;
  v129[0] = v106;
  v129[1] = v107;
  v108 = [(UIView *)self->_hideableFooterView leadingAnchor];
  v109 = [(SearchViewController *)self view];
  v110 = [v109 leadingAnchor];
  v111 = [v108 constraintEqualToAnchor:v110];
  v129[2] = v111;
  v112 = +[NSArray arrayWithObjects:v129 count:3];
  [v123 addObjectsFromArray:v112];

  +[NSLayoutConstraint activateConstraints:v123];
  v113 = [(PassthruSearchBar *)self->_searchBar searchTextField];
  [v113 addTarget:self action:"didSelectSearchBar:" forControlEvents:1];

  v114 = +[NSNotificationCenter defaultCenter];
  [v114 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v115 = +[NSNotificationCenter defaultCenter];
  [v115 addObserver:self selector:"popoverPresented:" name:@"MacPopoverPresentationControllerDidPresentPopover" object:0];

  v116 = +[NSNotificationCenter defaultCenter];
  [v116 addObserver:self selector:"popoverDismissed:" name:@"MacPopoverPresentationControllerDidDismissPopover" object:0];

  v117 = +[NSNotificationCenter defaultCenter];
  [v117 addObserver:self selector:"_offlineSettingChangeHandler" name:@"UsingOfflineMapsStateChangedNotification" object:0];

  v118 = +[NSNotificationCenter defaultCenter];
  [v118 addObserver:self selector:"_preventAutoPresentingKeyboard_rdar_126940251" name:@"SearchViewPreventAutoPresentingKeyboard_rdar_126940251" object:0];

  [(SearchViewController *)self _startMonitoringCoreRoutine];
  +[KeyboardAvoidingView startObservingKeyboard];
  [(SearchViewController *)self _contentAlphaForCurrentLayout];
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);
}

- (BOOL)isSearchingAlongTheRoute
{
  return self->_searchingAlongTheRoute;
}

- (void)_initPlaceholderWithSubmitTicketIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    if (v3)
    {
      id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      unsigned __int8 v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.placeholder", v5);
      placeholderQueue = self->_placeholderQueue;
      self->_placeholderQueue = v6;

      objc_initWeak(&location, self);
      double v8 = self->_placeholderQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100107F3C;
      v9[3] = &unk_1012E5D08;
      v9[4] = self;
      dispatch_async(v8, v9);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SearchViewController *)self _setPlaceHolder];
    }
  }
}

- (void)_setPlaceHolder
{
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    BOOL v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UIApplication shouldMakeUIForDefaultPNG true. The search bar placeholder string will not changed in this case.", buf, 2u);
    }
  }
  else
  {
    [(SearchViewController *)self _setupOnlinePlaceholder];
    id v4 = [(UITextField *)self->_searchField _placeholderLabel];
    [v4 setAllowsDefaultTighteningForTruncation:1];
  }
}

- (void)_setupOnlinePlaceholder
{
  BOOL v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 firstObject];
  id v10 = +[NSString stringWithFormat:@"%@-%@", @"__internal__searchBarPlaceholderV2", v4];

  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 objectForKey:v10];

  searchField = self->_searchField;
  if (v6)
  {
    [(UITextField *)searchField setPlaceholder:v6];
  }
  else
  {
    double v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"Search for a place or address" value:@"localized string not found" table:0];
    [(UITextField *)searchField setPlaceholder:v9];
  }
}

- (void)updateIsTouristHereValue
{
  mapsSuggestionsLoadingSearchQueue = self->_mapsSuggestionsLoadingSearchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016888;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(mapsSuggestionsLoadingSearchQueue, block);
}

- (void)updateContentState
{
  if ([(SearchViewController *)self isViewLoaded])
  {
    [(SearchViewController *)self updateDataSource];
    [(SearchViewController *)self resetMapServiceTicket];
  }
}

- (void)setNeedsUpdateContentState
{
  if (!self->_needsUpdateContentState)
  {
    self->_needsUpdateContentState = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001087E0;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setCloseSearchResultsButton:(id)a3
{
}

- (void)resetMapServiceTicket
{
  [(MKMapServiceTicket *)self->_mapServiceTicket cancel];
  mapServiceTicket = self->_mapServiceTicket;
  self->_mapServiceTicket = 0;
}

- (void)initializeCachedTelephonyValue
{
}

- (SearchViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  v2 = [(SearchViewController *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(SearchViewController *)v2 initializeCachedTelephonyValue];
  }
  return v3;
}

- (void)_configureSearchBarIfNeeded
{
  if (!self->_isConfigured)
  {
    self->_isConfigured = 1;
    [(SearchViewController *)self _initPlaceholderWithSubmitTicketIfNeeded:1];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SearchViewController)initWithSearchAlongRoute:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchViewController *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    [(SearchViewController *)v4 setSearchingAlongTheRoute:v3];
    v5->_isOfflineBrowseRecordedAlreaddouble y = 0;
    unsigned __int8 v6 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v7 = [v6 isUsingOfflineMaps];

    if (v7) {
      [(SearchViewController *)v5 _initOfflinePlaceHolderWithCompletion:0];
    }
  }
  return v5;
}

- (void)updateTheme
{
  v10.receiver = self;
  v10.super_class = (Class)SearchViewController;
  [(MapsThemeViewController *)&v10 updateTheme];
  BOOL v3 = [(SearchViewController *)self theme];
  id v4 = [v3 searchBarPlaceHolderColor];
  objc_super v5 = [(UITextField *)self->_searchField _placeholderLabel];
  [v5 setTextColor:v4];

  unsigned __int8 v6 = [(SearchViewController *)self theme];
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", [v6 textFieldKeyboardAppearance]);

  contentTableView = self->_contentTableView;
  double v8 = [(SearchViewController *)self theme];
  double v9 = [v8 hairlineColor];
  [(UITableView *)contentTableView setSeparatorColor:v9];

  [(UITableView *)self->_contentTableView reloadData];
}

- (id)keyCommands
{
  if ([(HomeViewController *)self->_homeViewController isActive]
    && ([(SearchViewController *)self presentedViewController],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v4 = [(HomeViewController *)self->_homeViewController keyCommands];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchViewController;
    id v4 = [(ContaineeViewController *)&v9 keyCommands];
    if (self->_currentDataSource == &self->_searchHomeDataSource->super)
    {
      objc_super v5 = [(SearchViewController *)self presentedViewController];

      if (!v5)
      {
        unsigned __int8 v6 = [(SearchHomeDataSource *)self->_searchHomeDataSource keyCommands];
        uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v6];

        id v4 = (void *)v7;
      }
    }
  }

  return v4;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  homeViewController = self->_homeViewController;
  id v7 = a4;
  if ([(HomeViewController *)homeViewController isActive])
  {
    uint64_t v8 = [(HomeViewController *)self->_homeViewController targetForAction:a3 withSender:v7];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchViewController;
    uint64_t v8 = [(SearchViewController *)&v11 targetForAction:a3 withSender:v7];
  }
  objc_super v9 = (void *)v8;

  return v9;
}

- (id)browseModeHeaderView
{
  offlineBrowseHeaderView = self->_offlineBrowseHeaderView;
  if (!offlineBrowseHeaderView)
  {
    id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_super v5 = self->_offlineBrowseHeaderView;
    self->_offlineBrowseHeaderView = v4;

    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setDelegate:self];
    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setHeaderSize:2];
    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setHairLineAlpha:0.0];
    unsigned __int8 v6 = +[UIColor clearColor];
    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setBackgroundColor:v6];

    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Browse" value:@"localized string not found" table:@"Offline"];
    [(ContainerHeaderView *)self->_offlineBrowseHeaderView setTitle:v8];

    objc_super v9 = [(ContaineeViewController *)self headerView];
    objc_super v10 = [(SearchViewController *)self browseModeHeaderView];
    [v9 addSubview:v10];

    objc_super v11 = [(SearchViewController *)self browseModeHeaderView];
    id v12 = [(ContaineeViewController *)self headerView];
    double v13 = [v11 _maps_constraintsForCenteringInView:v12 edgeInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    +[NSLayoutConstraint activateConstraints:v13];

    offlineBrowseHeaderView = self->_offlineBrowseHeaderView;
  }

  return offlineBrowseHeaderView;
}

- (id)offlinePlaceholderQueue
{
  offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  if (!offlinePlaceholderQueue)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v4);
    unsigned __int8 v6 = self->_offlinePlaceholderQueue;
    self->_offlinePlaceholderQueue = v5;

    offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  }

  return offlinePlaceholderQueue;
}

- (void)_shouldHideOfflineHeaderView:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SearchViewController *)self browseModeHeaderView];
  [v5 setHidden:v3];

  uint64_t v6 = v3 ^ 1;
  [(PassthruSearchBar *)self->_searchBar setHidden:v6];
  [(UIButton *)self->_userProfileButton setHidden:v6];

  [(SearchViewController *)self _updateUserProfileEntryPointButton];
}

- (void)_offlineSettingChangeHandler
{
  BOOL v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = +[MapsOfflineUIHelper sharedHelper];
    objc_super v5 = sub_100097E28((int)[v4 isUsingOfflineMaps]);
    int v10 = 138412290;
    objc_super v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Offline setting has changed. New value is : %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v6 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v7 = [v6 isUsingOfflineMaps];

  if (v7)
  {
    [(SearchViewController *)self _setupOfflinePlaceholder];
    [(SearchViewController *)self _initOfflinePlaceHolderWithCompletion:0];
  }
  else
  {
    [(SearchViewController *)self _setupOnlinePlaceholder];
    uint64_t v8 = sub_100109E50();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting the placeholder string for online mode", (uint8_t *)&v10, 2u);
    }
  }
  searchHomeDataSource = self->_searchHomeDataSource;
  self->_searchHomeDataSource = 0;
}

- (void)_setupOfflinePlaceholder
{
  BOOL v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 firstObject];
  id v10 = +[NSString stringWithFormat:@"%@-%@", @"__internal__searchBarOfflinePlaceholder", v4];

  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:v10];

  if (v6)
  {
    [(UITextField *)self->_searchField setPlaceholder:v6];
  }
  else
  {
    unsigned int v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Browse Offline Maps" value:@"localized string not found" table:0];
    [(UITextField *)self->_searchField setPlaceholder:v8];
  }
  objc_super v9 = [(UITextField *)self->_searchField _placeholderLabel];
  [v9 setAllowsDefaultTighteningForTruncation:1];
}

- (void)resetOfflineTextSearchSupport
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10075B2A4;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  [(SearchViewController *)self _initOfflinePlaceHolderWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)logOfflineBrowseMode:(BOOL)a3
{
  if (!a3 && (!self->_isOfflineBrowseRecordedAlready || self->_supportsFullTextSearch))
  {
    id v3 = +[MKMapService sharedService];
    [v3 captureUserAction:45 onTarget:1708 eventValue:0];
  }
}

- (void)_initOfflinePlaceHolderWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_isOfflineServiceRunning)
  {
    self->_isOfflineServiceRunning = 1;
    objc_initWeak(&location, self);
    objc_super v5 = [(SearchViewController *)self offlinePlaceholderQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10075B478;
    v6[3] = &unk_1012F7828;
    v6[4] = self;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_enableTextFieldNotification:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  id v6 = v5;
  if (v3) {
    [v5 addObserver:self selector:"_textFieldDidChange:" name:UITextFieldTextDidChangeNotification object:self->_searchField];
  }
  else {
    [v5 removeObserver:self name:UITextFieldTextDidChangeNotification object:self->_searchField];
  }
}

- (void)_internalViewDidAppear
{
  [(SearchViewController *)self _enableTextFieldNotification:1];
  if (self->_needsToBecomeFirstResponder)
  {
    [(SearchViewController *)self searchBarBecomeFirstResponder];
  }
}

- (void)_internalViewWillDisappear
{
  [(SearchViewController *)self _enableTextFieldNotification:0];
  [(SearchViewController *)self showDropDown:0];

  [(SearchViewController *)self showDropDown:0];
}

- (void)_internalViewDidDisappear
{
  BOOL v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 venuesManager];
  [v4 removeChangeObserver:self];

  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 250000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10075BA74;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchViewController;
  [(SearchViewController *)&v6 viewDidAppear:a3];
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5) {
    [(SearchViewController *)self _internalViewDidAppear];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SVC viewWillDisappear", buf, 2u);
  }

  objc_super v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)5) {
    [(SearchViewController *)self _internalViewWillDisappear];
  }
  v8.receiver = self;
  v8.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v8 viewWillDisappear:v3];
  [(SearchViewController *)self _hideSearchHereControl];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5) {
    [(SearchViewController *)self _internalViewDidDisappear];
  }
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  [(SearchViewController *)&v7 viewDidDisappear:v3];
}

- (void)didSelectSearchBar:(id)a3
{
  self->_userSelectedSearchBar = 1;
}

- (void)presentUserProfile
{
  +[UserProfileAnalyticsManager captureEnterAccountTapAction];
  id v3 = [(SearchViewController *)self homeActionCoordinator];
  [v3 viewControllerPresentUserProfile:self];
}

- (MapsDragDestinationHandler)mapsDragDestinationHandler
{
  mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  if (!mapsDragDestinationHandler)
  {
    id v4 = objc_alloc_init(MapsDragDestinationHandler);
    id v5 = self->_mapsDragDestinationHandler;
    self->_mapsDragDestinationHandler = v4;

    id v6 = [(ControlContaineeViewController *)self delegate];
    [(MapsDragDestinationHandler *)self->_mapsDragDestinationHandler setDelegate:v6];

    mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  }

  return mapsDragDestinationHandler;
}

- (id)searchBar
{
  return self->_searchBar;
}

- (void)handleDismissAction:(id)a3
{
  if ([(HomeViewController *)self->_homeViewController isActive])
  {
    id v4 = [(SearchViewController *)self presentedViewController];
    id v5 = v4;
    if (v4)
    {
      objc_super v7 = v4;
      unsigned __int8 v6 = [v4 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];
      id v5 = v7;
      if ((v6 & 1) == 0)
      {
        [v7 dismissViewControllerAnimated:1 completion:0];
        id v5 = v7;
      }
    }
  }
  else
  {
    [(SearchViewController *)self endSearch];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v16 = a3;
  id v5 = [v16 nextFocusedItem];
  if (!v5) {
    goto LABEL_5;
  }
  dropDownView = self->_dropDownView;
  if (!dropDownView) {
    goto LABEL_5;
  }
  objc_super v7 = [v16 nextFocusedItem];
  if (+[UIFocusSystem environment:dropDownView containsEnvironment:v7])
  {

LABEL_5:
    goto LABEL_6;
  }
  id v12 = [v16 nextFocusedItem];
  unsigned __int8 v13 = +[UIFocusSystem environment:self containsEnvironment:v12];

  if ((v13 & 1) == 0) {
    [(SearchViewController *)self showDropDown:0];
  }
LABEL_6:
  if (sub_1000BBB44(self) != 5 && self->_homeViewController)
  {
    objc_super v8 = +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:");
    objc_super v9 = [v8 focusedItem];

    if (!v9)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v10 = [(ContaineeViewController *)self cardPresentationController];
    if ([v10 containerStyle] == (id)6)
    {
      objc_super v11 = [(ContaineeViewController *)self cardPresentationController];
      if ([v11 containeeLayout] == (id)1)
      {
      }
      else
      {
        double v14 = [(ContaineeViewController *)self cardPresentationController];
        id v15 = [v14 containeeLayout];

        if (v15 != (id)2)
        {
LABEL_17:
          self->_searchFieldWantsFocus = 1;
          goto LABEL_18;
        }
      }
      id v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 wantsLayout:3];
    }

    goto LABEL_17;
  }
LABEL_19:
}

- (void)willBecomeCurrentByGesture
{
  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v5 willBecomeCurrentByGesture];
  [(SearchViewController *)self _restoreRetainedQueryIfNeeded];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    id v3 = [(SearchViewController *)self searchResultsViewController];
    id v4 = v3;
    if (v3) {
      [v3 willBecomeCurrentByGesture];
    }
  }
}

- (void)didBecomeCurrent
{
  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v5 didBecomeCurrent];
  [(SearchViewController *)self _internalViewDidAppear];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    id v3 = [(SearchViewController *)self searchResultsViewController];
    id v4 = v3;
    if (v3) {
      [v3 didBecomeCurrent];
    }
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  BOOL v3 = a3;
  [(SearchViewController *)self _internalViewWillDisappear];
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v7 willResignCurrent:v3];
  if (!self->_maintainSearchStateWhenDisappearing)
  {
    currentDataSource = self->_currentDataSource;
    if (!currentDataSource) {
      currentDataSource = self->_homeViewController;
    }
    [currentDataSource setActive:0];
  }
  self->_maintainSearchStateWhenDisappearing = 0;
  [(SearchViewController *)self _hideSearchHereControl];
  unsigned __int8 v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"SearchWillResignCurrentNotification" object:self];
}

- (void)didResignCurrent
{
  [(SearchViewController *)self _internalViewDidDisappear];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    BOOL v3 = [(SearchViewController *)self searchResultsViewController];
    id v4 = v3;
    if (v3) {
      [v3 didResignCurrent];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v5 didResignCurrent];
}

- (id)searchHomeDataSource
{
  if ([(SearchViewController *)self isViewLoaded])
  {
    searchHomeDataSource = self->_searchHomeDataSource;
    if (!searchHomeDataSource)
    {
      id v4 = [[SearchHomeDataSource alloc] initWithCollectionView:self->_collectionView updateLocation:0 isSearchAlongRoute:[(SearchViewController *)self isSearchingAlongTheRoute] supportsFullTextSearch:self->_supportsFullTextSearch];
      [(DataSource *)v4 setDelegate:self];
      [(SearchHomeDataSource *)v4 setSearchHomeDataSourceDelegate:self];
      objc_super v5 = self->_searchHomeDataSource;
      self->_searchHomeDataSource = v4;

      searchHomeDataSource = self->_searchHomeDataSource;
    }
    unsigned __int8 v6 = searchHomeDataSource;
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)searchDataSource
{
  if ([(SearchViewController *)self isViewLoaded])
  {
    searchDataSource = self->_searchDataSource;
    if (!searchDataSource)
    {
      id v4 = [[SearchDataSource alloc] initWithTableView:self->_contentTableView];
      [(DataSource *)v4 setDelegate:self];
      objc_super v5 = [(SearchViewController *)self personalizedItemManager];
      [(SearchDataSource *)v4 setMapPersonalizedItems:v5];

      unsigned __int8 v6 = [(ControlContaineeViewController *)self delegate];
      objc_super v7 = [v6 userLocationSearchResult];
      [(SearchDataSource *)v4 setUserLocationSearchResult:v7];

      [(SearchDataSource *)v4 setShowPlaceContext:1];
      [(SearchDataSource *)v4 setSearchAlongRoute:[(SearchViewController *)self isSearchingAlongTheRoute]];
      [(SearchDataSource *)v4 setUsePlaceSummary:sub_1009DB5CC()];
      [(SearchDataSource *)v4 setCanShowQueryAccelerator:1];
      objc_super v8 = self->_searchDataSource;
      self->_searchDataSource = v4;

      searchDataSource = self->_searchDataSource;
    }
    objc_super v9 = searchDataSource;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)preferredContentSizeChanged:(id)a3
{
  [(PassthruSearchBar *)self->_searchBar invalidateIntrinsicContentSize];
  id v4 = [(SearchViewController *)self view];
  [v4 setNeedsLayout];

  [(SearchViewController *)self reloadContentTableView];
}

- (void)popoverPresented:(id)a3
{
  self->_didPresentPopover = 1;
}

- (void)popoverDismissed:(id)a3
{
  if (self->_didPresentPopover && self->_userSelectedSearchBar)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10075C598;
    v4[3] = &unk_1012E7D28;
    v4[4] = self;
    +[UIView animateWithDuration:&stru_1012F7870 animations:v4 completion:0.0];
    self->_userSelectedSearchBar = 0;
    self->_didPresentPopover = 0;
  }
}

- (int64_t)currentDataSourceType
{
  BOOL v3 = [(SearchViewController *)self currentDataSource];
  id v4 = [(SearchViewController *)self searchDataSource];

  if (v3 == v4) {
    return 2;
  }
  objc_super v5 = [(SearchViewController *)self currentDataSource];
  unsigned __int8 v6 = [(SearchViewController *)self searchHomeDataSource];
  int64_t v7 = v5 == v6;

  return v7;
}

- (MenuContaineeViewController)menuController
{
  menuController = self->_menuController;
  if (!menuController)
  {
    id v4 = [[MenuContaineeViewController alloc] initWithContentView:self->_dropDownView];
    objc_super v5 = self->_menuController;
    self->_menuController = v4;

    [(MenuContaineeViewController *)self->_menuController setTrackedScrollview:self->_collectionView];
    searchFieldLayoutGuide = self->_searchFieldLayoutGuide;
    int64_t v7 = [(ContaineeViewController *)self->_menuController macMenuPresentationController];
    [v7 setAnchorLayoutGuide:searchFieldLayoutGuide];

    objc_super v8 = self->_searchFieldLayoutGuide;
    objc_super v9 = [(ContaineeViewController *)self->_menuController macMenuPresentationController];
    [v9 setWidthLayoutGuide:v8];

    searchBar = self->_searchBar;
    id v10 = +[NSArray arrayWithObjects:&searchBar count:1];
    objc_super v11 = [(ContaineeViewController *)self->_menuController macMenuPresentationController];
    [v11 setPassThroughViews:v10];

    id v12 = [(ContaineeViewController *)self->_menuController macMenuPresentationController];
    [v12 addObserver:self];

    menuController = self->_menuController;
  }

  return menuController;
}

- (void)showDropDown:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    if (v3)
    {
      objc_super v5 = [(SearchViewController *)self menuController];
      unsigned __int8 v6 = [v5 macMenuPresentationController];
      unsigned __int8 v7 = [v6 isPresented];

      if ((v7 & 1) == 0)
      {
        objc_super v9 = [(ControlContaineeViewController *)self delegate];
        id v10 = [(SearchViewController *)self menuController];
        [v9 viewController:self presentMenuController:v10 animated:1 fromChrome:1 completion:0];

        [(SearchViewController *)self showTitleBarSeparatorWhenScrolling:0];
      }
    }
    else
    {
      self->_userSelectedSearchBar = 0;
      id v11 = [(ControlContaineeViewController *)self delegate];
      objc_super v8 = [(SearchViewController *)self menuController];
      [v11 viewController:v8 dismissMenuControllerAnimated:1];
    }
  }
}

- (void)showTitleBarSeparatorWhenScrolling:(BOOL)a3
{
  double v3 = -1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(NSLayoutConstraint *)self->_homeViewControllerBottomConstraint setConstant:v3];
}

- (void)showSearchResults:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SearchViewController *)self currentSearchSession];
  if ([v5 isInvalidated])
  {
    unsigned __int8 v6 = sub_100109E50();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[SearchVC] The current search session : %@ was invalidated. Not showing any search results.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    [(UIButton *)self->_userProfileButton setHidden:1];
    [(SearchViewController *)self displaySearchResultsWithViewController:v4 searchBar:self->_searchBar];
    [(SearchViewController *)self updateCloseSearchResultEntryPointButton:self->_searchBar searchBarToButtonSpacing:10.0 userButtonWidth:36.0];
    [(SearchViewController *)self endEditing];
    unsigned __int8 v7 = [(SearchViewController *)self currentSearchSession];
    objc_super v8 = [(SearchViewController *)self localSearchViewController];
    objc_super v9 = [v8 refreshSearchHereBusinessController];
    [v9 setSearchSession:v7];
  }
}

- (void)reloadContentTableView
{
  double v3 = [(SearchViewController *)self currentDataSource];
  id v4 = [v3 presentationStyle];

  if (!v4)
  {
    [(SearchViewController *)self updateRowHeightForCurrentDataSource];
    [(SearchViewController *)self _invalidateMediumHeightCache];
    objc_super v5 = [(SearchViewController *)self currentDataSource];

    if (v5) {
      [(UITableView *)self->_contentTableView reloadData];
    }
  }
  [(SearchViewController *)self _contentAlphaForCurrentLayout];

  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);
}

- (void)updateRowHeightForCurrentDataSource
{
  currentDataSource = self->_currentDataSource;
  if (currentDataSource)
  {
    [currentDataSource rowHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = UITableViewAutomaticDimension;
  }
  [(UITableView *)self->_contentTableView rowHeight];
  if (v6 != v5)
  {
    contentTableView = self->_contentTableView;
    [(UITableView *)contentTableView setRowHeight:v5];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SearchViewController *)self currentDataSource];
  unsigned int v12 = [v11 conformsToProtocol:&OBJC_PROTOCOL___MapsUICollectionViewDiffableDataSourceCellProviding];

  if (v12)
  {
    unsigned __int8 v13 = [(SearchViewController *)self currentDataSource];
    double v14 = [v13 collectionView:v8 cellForItemAtIndexPath:v9 itemIdentifier:v10];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SearchViewController *)self currentDataSource];
  unsigned int v12 = [v11 conformsToProtocol:&OBJC_PROTOCOL___MapsUICollectionViewDiffableDataSourceCellProviding];

  if (v12)
  {
    unsigned __int8 v13 = [(SearchViewController *)self currentDataSource];
    double v14 = [v13 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)endEditing
{
  if ([(UITextField *)self->_searchField isFirstResponder])
  {
    [(PassthruSearchBar *)self->_searchBar resignFirstResponder];
    double v3 = [(ContaineeViewController *)self cardPresentationController];
    id v4 = [v3 containerStyle];

    if (v4 == (id)1)
    {
      double v5 = [(ContaineeViewController *)self cardPresentationController];
      [v5 wantsLayout:2];
    }
  }

  [(SearchViewController *)self showDropDown:0];
}

- (void)endSearch
{
  [(SearchViewController *)self _hideSearchHereControl];
  self->_searchFieldWantsFocus = 0;
  [(PassthruSearchBar *)self->_searchBar setShowsCancelButton:0 animated:1];
  [(SearchViewController *)self clearRetainedSearchQuery];
  double v3 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
  [v3 clearMKLocalSearchCompleterQueryState];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10075CF28;
  v6[3] = &unk_1012E5D08;
  void v6[4] = self;
  id v4 = objc_retainBlock(v6);
  if (sub_1000BBB44(self) == 5)
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    [(UIButton *)self->_userProfileButton setHidden:[(PassthruSearchBar *)self->_searchBar isHidden]];
    [(SearchViewController *)self _updateUserProfileEntryPointButton];
    double v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 applyWithAnimations:v4 completion:&stru_1012F7890];
  }
}

- (void)_invalidateSearchSession:(id)a3
{
  id v4 = (SearchViewController *)a3;
  double v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 134218242;
    unsigned int v12 = self;
    __int16 v13 = 2080;
    double v14 = "-[SearchViewController _invalidateSearchSession:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%p] %s", (uint8_t *)&v11, 0x16u);
  }

  double v6 = sub_100109E50();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      int v11 = 138412290;
      unsigned int v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Invalidating search session: %@", (uint8_t *)&v11, 0xCu);
    }

    double v6 = [(SearchViewController *)self searchResultsViewController];
    if (([(SearchViewController *)v4 isLoading] & 1) != 0
      || ([v6 view],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 superview],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          !v9))
    {
      id v10 = sub_100109E50();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        unsigned int v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "If we are showing the SearchAC or a search request is in process, then invalidate the current search and cancel the request: %@", (uint8_t *)&v11, 0xCu);
      }

      [(SearchViewController *)v4 invalidate];
      [(SearchViewController *)v4 cancelSearch];
      [(SearchViewController *)self _hideSearchHereControl];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 searchDidCancel:0];
      }
    }
  }
  else if (v7)
  {
    int v11 = 134217984;
    unsigned int v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%p] No search session to invalidate.", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_preventAutoPresentingKeyboard_rdar_126940251
{
  if ([(SearchViewController *)self isViewLoaded])
  {
    [(SearchViewController *)self endEditing];
    double v3 = [(SearchViewController *)self view];
    [v3 endEditing:1];

    self->_shouldPreventPresentingKeyboardOnRestore = 1;
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10075D2F8;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchBarBecomeFirstResponder
{
  self->_needsToBecomeFirstResponder = 0;
  if (self->_searchBar) {
    [(PassthruSearchBar *)self->_searchBar becomeFirstResponder];
  }
  else {
    self->_needsToBecomeFirstResponder = 1;
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  dispatch_time_t v4 = [(SearchViewController *)self currentSearchSession];
  double v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    unsigned int v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Search bar begins editing and invalidate the current active search session if there is any: %@", (uint8_t *)&v18, 0xCu);
  }

  if (sub_1000BBB44(self) == 5)
  {
    [(SearchViewController *)self _invalidateSearchSession:v4];
  }
  else
  {
    if (MapsFeature_IsEnabled_SearchAndDiscovery())
    {
      double v6 = [(SearchViewController *)self searchResultsViewController];
      BOOL v7 = v6;
      if (v6)
      {
        [v6 willMoveToParentViewController:0];
        id v8 = [v7 view];
        [v8 removeFromSuperview];

        [v7 removeFromParentViewController];
        id v9 = [(SearchViewController *)self closeSearchResultsButton];
        [v9 setHidden:1];

        id v10 = +[MKMapService sharedService];
        int v11 = [(SearchFieldItem *)self->_searchItem searchString];
        [v10 captureUserAction:2001 onTarget:101 queryString:v11];

        [(SearchViewController *)self _invalidateSearchSession:v4];
        unsigned int v12 = [v4 searchFieldItem];
        [(SearchViewController *)self restoreSearchItem:v12];

        [(SearchViewController *)self clearRetainedSearchQuery];
        __int16 v13 = [(ControlContaineeViewController *)self delegate];
        [v13 clearSearchPins];
      }
    }
    uint64_t v14 = [(SearchViewController *)self isSearchingAlongTheRoute] ^ 1;
    uint64_t v15 = [(SearchViewController *)self isSearchingAlongTheRoute] ^ 1;
    [(PassthruSearchBar *)self->_searchBar setShowsCancelButton:v14 animated:1];
    [(UIButton *)self->_userProfileButton setHidden:v15];
    [(SearchViewController *)self _updateUserProfileEntryPointButton];
  }
  [(SearchViewController *)self showDropDown:1];
  id v16 = +[MapsOfflineUIHelper sharedHelper];
  if ([v16 isUsingOfflineMaps] && !self->_supportsFullTextSearch)
  {
    unsigned __int8 v17 = [(SearchViewController *)self isSearchingAlongTheRoute];

    if ((v17 & 1) == 0) {
      [(SearchViewController *)self _shouldHideOfflineHeaderView:self->_supportsFullTextSearch];
    }
  }
  else
  {
  }
}

- (void)triggerAutocompleteByReplacingQueryWithCompletion:(id)a3
{
  id v6 = a3;
  dispatch_time_t v4 = [v6 queryAcceleratorCompletionString];
  if ([v4 length]) {
    [v6 queryAcceleratorCompletionString];
  }
  else {
  double v5 = [v6 title];
  }
  [(UITextField *)self->_searchField setText:v5];

  [(SearchViewController *)self _textFieldDidChange:0 tappedQuerySuggestionCompletion:v6];
  [(SearchViewController *)self searchBarBecomeFirstResponder];
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  id v7 = a3;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem])
  {
    dispatch_time_t v4 = [v7 venueMapItem];
    uint64_t v5 = [v4 name];
  }
  else
  {
    if (![v7 conformsToProtocol:&OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem]) {
      goto LABEL_6;
    }
    dispatch_time_t v4 = [v7 venueSearchCategory];
    uint64_t v5 = [v4 displayString];
  }
  id v6 = (void *)v5;

  [(PassthruSearchBar *)self->_searchBar setText:v6];
LABEL_6:
  [(HomeViewController *)self->_homeViewController presentVenueWithVenueCardItem:v7];
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
  homeViewController = self->_homeViewController;
  if (homeViewController) {
    [(HomeViewController *)homeViewController venueDidReceiveEVChargersUpdate:a3];
  }
}

- (void)showCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10075D864;
  v6[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SearchViewController *)self _popToHomeWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)editCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10075D9AC;
  v6[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SearchViewController *)self _popToHomeWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3
{
  return [(HomeViewController *)self->_homeViewController sourceViewForProfileTipPopoverWithViewController:a3];
}

- (void)clearSelectionWithReason:(id)a3
{
}

- (void)keyboardProxyViewCreated:(id)a3
{
}

- (void)_popToHomeWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(SearchViewController *)self menuController];
  id v6 = [v5 macMenuPresentationController];
  unsigned int v7 = [v6 isPresented];

  if (v7)
  {
    [(SearchViewController *)self endEditing];
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10075DB48;
    block[3] = &unk_1012E6EA8;
    id v10 = v4;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v4[2](v4);
  }
}

- (void)sendSearchRequest
{
  double v3 = [(UITextField *)self->_searchField text];
  id v4 = [v3 _maps_stringByTrimmingLeadingWhitespace];
  [(SearchFieldItem *)self->_searchItem setSearchString:v4];

  [(SearchFieldItem *)self->_searchItem setUserTypedStringForRAP:self->_userTypedSearchString];
  id v5 = [(RetainedQueryController *)self->_retainedQueryController restoredRetainedSearchQueryMetadata];
  [(SearchFieldItem *)self->_searchItem setRetainedSearchMetadata:v5];

  [(RetainedQueryController *)self->_retainedQueryController setRestoredRetainedSearchQueryMetadata:0];
  id v6 = +[MKMapService sharedService];
  uint64_t v7 = [(SearchViewController *)self currentUITargetForAnalytics];
  dispatch_time_t v8 = [(SearchFieldItem *)self->_searchItem searchString];
  [v6 captureUserAction:2014 onTarget:v7 queryString:v8];

  [(SearchViewController *)self retainSearchQuery];
  [(SearchViewController *)self setNeedsUpdateContentState];
  id v13 = +[NSMutableDictionary dictionaryWithDictionary:&off_1013AECE0];
  if (!self->_hasEdited) {
    [v13 setObject:&off_1013A88C0 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
  }
  id v9 = +[NSNumber numberWithBool:[(SearchViewController *)self isSearchingAlongTheRoute]];
  [v13 setObject:v9 forKeyedSubscript:@"SearchAlongRoute"];

  id v10 = [(ControlContaineeViewController *)self delegate];
  searchItem = self->_searchItem;
  id v12 = [v13 copy];
  [v10 viewController:self doSearchItem:searchItem withUserInfo:v12];

  [(SearchViewController *)self endEditing];
  [(SearchDataSource *)self->_searchDataSource clearAutocompleteResults];
  [(SearchDataSource *)self->_searchDataSource reset];
}

- (id)lastViewportChangeDate
{
  v2 = [(ControlContaineeViewController *)self delegate];
  double v3 = [v2 containerViewController];
  id v4 = [v3 chromeViewController];
  id v5 = [v4 lastMapViewportChangedDate];

  return v5;
}

- (void)sendACRequestWithTappedQuerySuggestionCompletion:(id)a3 retainQueryMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchViewController *)self updateDataSource];
  [(SearchViewController *)self setNeedsUpdateContentState];
  if (self->_currentDataSource == &self->_searchDataSource->super)
  {
    dispatch_time_t v8 = [(ControlContaineeViewController *)self delegate];
    id v9 = [v8 newTraits];

    [v9 setNavigating:[self isSearchingAlongTheRoute]];
    [v9 setSupportDirectionIntentAutocomplete:[self isSearchingAlongTheRoute] ^ 1];
    [v9 setSupportUnresolvedDirectionIntent:[self isSearchingAlongTheRoute] ^ 1];
    [v9 setSupportAutocompletePublisherResults:[self isSearchingAlongTheRoute] ? 1 : 0];
    [v9 setSupportAutocompleteGuideResults:[self isSearchingAlongTheRoute] ^ 1];
    [v9 addSupportedAutocompleteListType:2];
    [v9 setSupportClientRankingFeatureMetadata:1];
    [v9 setSupportClientRankingCompositeFeatures:1];
    [v9 setSupportChildItems:[self isSearchingAlongTheRoute] ^ 1];
    [v9 useOnlineToOfflineFailoverRequestModeIfAllowed];
    if (![(SearchViewController *)self isSearchingAlongTheRoute]) {
      [(SearchViewController *)self addSupportedChildActionToTraits:v9];
    }
    id v10 = +[NSDate date];
    int v11 = [(SearchViewController *)self lastViewportChangeDate];
    [v10 timeIntervalSinceDate:v11];
    LODWORD(v13) = vcvtad_u64_f64(v12);
    [v9 setTimeSinceMapViewportChanged:v13];

    uint64_t v14 = sub_100577254();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 67109120;
      v21[1] = [v9 timeSinceMapViewportChanged];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending AC Request with timeSinceMapViewportChanged: %d", (uint8_t *)v21, 8u);
    }

    [v9 setAutocompleteRequestSupportsSectionHeader:1];
    [v9 addSupportedAutocompleteResultCellType:0];
    [v9 addSupportedAutocompleteResultCellType:3];
    if (![(SearchViewController *)self isSearchingAlongTheRoute])
    {
      [v9 addSupportedAutocompleteResultCellType:1];
      [v9 addSupportedAutocompleteResultCellType:2];
    }
    if (MapsFeature_IsEnabled_HikingiOS())
    {
      uint64_t v15 = 35;
    }
    else if (MapsFeature_IsEnabled_SearchAndDiscovery())
    {
      uint64_t v15 = 31;
    }
    else
    {
      uint64_t v15 = 28;
    }
    [v9 setPlaceSummaryRevision:v15];
    [(SearchViewController *)self isTouristHereValue];
    [v9 setIsTourist:];
    [v9 addKnownRefinementType:1];
    [v9 addSupportedPlaceSummaryFormatType:1];
    [v9 addSupportedPlaceSummaryFormatType:2];
    [v9 addSupportedPlaceSummaryFormatType:3];
    [v9 setSupportStructuredRapAffordance:[self isSearchingAlongTheRoute] ^ 1];
    [(SearchDataSource *)self->_searchDataSource setRetainedSearchMetadata:v7];
    if ([(SearchViewController *)self isSearchingAlongTheRoute]) {
      uint64_t v16 = 14;
    }
    else {
      uint64_t v16 = 11;
    }
    searchDataSource = self->_searchDataSource;
    int v18 = [(UITextField *)self->_searchField text];
    unsigned int v19 = [v18 _maps_stringByTrimmingLeadingWhitespace];
    [(SearchDataSource *)searchDataSource setInputText:v19 tappedQuerySuggestionCompletion:v6 isRetainQuery:v7 != 0 traits:v9 source:v16];

    if (MapsFeature_IsEnabled_MapsWally() && (GEOConfigGetBOOL() & 1) == 0)
    {
      id v20 = sub_100109E50();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will not show SearchHome tip again.", (uint8_t *)v21, 2u);
      }

      [(SearchHomeDataSource *)self->_searchHomeDataSource setShouldRemoveSearchHomeTip:1];
    }
  }
}

- (void)addSupportedChildActionToTraits:(id)a3
{
  id v8 = a3;
  [v8 addSupportedChildAction:1];
  id v4 = +[MKSystemController sharedInstance];
  unsigned int v5 = [v4 supports3DImagery];

  if (v5) {
    [v8 addSupportedChildAction:2];
  }
  [v8 addSupportedChildAction:3];
  id v6 = +[GEOResourceManifestManager modernManager];
  unsigned int v7 = [v6 isMuninEnabled];

  if (v7) {
    [v8 addSupportedChildAction:4];
  }
  if (+[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls"))[v8 addSupportedChildAction:5]; {
  [v8 addSupportedChildAction:6];
  }
  if (MapsFeature_IsEnabled_Maps269() && sub_1000BBB44(self) != 5) {
    [v8 addSupportedChildAction:7];
  }
  if (GEOSupportsOfflineMaps()) {
    [v8 addSupportedChildAction:8];
  }
}

- (BOOL)shouldRetainSearchQuery
{
  return [(RetainedQueryController *)self->_retainedQueryController shouldRetainSearchQuery];
}

- (void)clearRetainedSearchQuery
{
}

- (id)defaultSearchQueryToRetain
{
  userTypedSearchString = [(NSString *)self->_userTypedSearchString length];
  if (userTypedSearchString) {
    userTypedSearchString = self->_userTypedSearchString;
  }

  return userTypedSearchString;
}

- (void)retainSpotlightQuery:(id)a3 metadata:(id)a4
{
}

- (void)retainSearchQuery
{
  id v5 = [(SearchViewController *)self defaultSearchQueryToRetain];
  if (v5)
  {
    retainedQueryController = self->_retainedQueryController;
    id v4 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
    [v4 retainSearchTime];
    -[RetainedQueryController retainSearchQuery:metadata:forTimeInterval:](retainedQueryController, "retainSearchQuery:metadata:forTimeInterval:", v5, 0);
  }
}

- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 forTimeInterval:(double)a4
{
  id v9 = a3;
  retainedQueryController = self->_retainedQueryController;
  unsigned int v7 = [(SearchViewController *)self defaultSearchQueryToRetain];
  if (a4 == 0.0)
  {
    id v8 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
    [v8 retainSearchTime];
    -[RetainedQueryController retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:](retainedQueryController, "retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:", v9, v7);
  }
  else
  {
    [(RetainedQueryController *)retainedQueryController retainSearchQueryForSelectedAutocompleteItem:v9 query:v7 forTimeInterval:1.0];
  }
}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3
{
  retainedQueryController = self->_retainedQueryController;
  id v5 = a3;
  id v7 = [(SearchViewController *)self defaultSearchQueryToRetain];
  id v6 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
  [v6 retainSearchTime];
  -[RetainedQueryController retainSearchQueryForSelectedSearchResult:query:forTimeInterval:](retainedQueryController, "retainSearchQueryForSelectedSearchResult:query:forTimeInterval:", v5, v7);
}

- (void)restoreSearchItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    self->_hasEdited = 1;
    userTypedSearchString = self->_userTypedSearchString;
    self->_userTypedSearchString = 0;

    [(UITextField *)self->_searchField setTextSelectionBehavior:0];
    [(SearchDataSource *)self->_searchDataSource reset];
    [(SearchViewController *)self updateSearchFieldWithItem:v4];
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 wantsLayout:3];

    if (!self->_shouldPreventPresentingKeyboardOnRestore) {
      [(UITextField *)self->_searchField becomeFirstResponder];
    }
    id v7 = [v4 retainedSearchMetadata];
    [(SearchViewController *)self sendACRequestWithTappedQuerySuggestionCompletion:0 retainQueryMetadata:v7];
  }
  else
  {
    id v8 = sub_100109E50();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[SearchVC] Nothing to restore for searchItem.", v9, 2u);
    }
  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v12 willChangeLayout:"willChangeLayout:"];
  if (([(UITextField *)self->_searchField isFirstResponder] & 1) == 0) {
    [(PassthruSearchBar *)self->_searchBar setShowsCancelButton:0 animated:1];
  }
  if (a3 - 1 <= 1)
  {
    if ([(SearchViewController *)self isShowingOmnipresentSearchBar]
      && ([(SearchViewController *)self searchResultsViewController],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = sub_100109E50();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not dismissing search results while changing the layout as we are presenting results.", v11, 2u);
      }
    }
    else
    {
      id v7 = [(SearchViewController *)self currentDataSource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v9 = [(SearchViewController *)self presentedViewController];

        if (!v9) {
          [(SearchViewController *)self clearRetainedSearchQuery];
        }
        id v10 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
        [v10 clearMKLocalSearchCompleterQueryState];
      }
      [(PassthruSearchBar *)self->_searchBar resignFirstResponder];
      [(SearchViewController *)self cleanSearch];
    }
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v7 didChangeLayout:"didChangeLayout:"];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar])
  {
    id v5 = [(SearchViewController *)self searchResultsViewController];
    id v6 = v5;
    if (v5) {
      [v5 didChangeLayout:a3];
    }
  }
  [(SearchViewController *)self updateRefreshFooter];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  id v5 = [(SearchViewController *)self view];

  if (v5)
  {
    [(SearchViewController *)self _invalidateMediumHeightCache];
    [(LocalSearchViewController *)self->_localSearchViewController setEnable:a3 != 6];
    [(SearchViewController *)self _updateDefaultLayoutWithContainerStyle:a3];
  }
}

- (void)_invalidateMediumHeightCache
{
  self->_cachedMediumdouble Height = 0.0;
}

- (void)updateRefreshFooter
{
}

- (void)updateRefreshFooterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v6 = (unint64_t)[v5 containerStyle];

  BOOL v7 = (v6 < 6) & (0x3Au >> v6);
  if ([(LocalSearchViewController *)self->_localSearchViewController showInCardFooterWhenCardHasExpandedLayout])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [(ContaineeViewController *)self cardPresentationController];
    BOOL v8 = [v9 containeeLayout] != (id)1;
  }
  if (self->_refreshFooterEnabled != v7 && !v8)
  {
    self->_refreshFooterEnabled = v7;
    [(SearchViewController *)self addRefreshFooter:v7 animated:v3];
  }
}

- (void)addRefreshFooter:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v6 = a4;
    BOOL v7 = [(SearchViewController *)self localSearchViewController];
    BOOL v8 = [v7 view];

    id v9 = [v8 superview];

    if (!v9)
    {
      BOOL v29 = v6;
      [(SearchViewController *)self addChildViewController:self->_localSearchViewController];
      [(UIView *)self->_hideableFooterView insertSubview:v8 atIndex:0];
      [(LocalSearchViewController *)self->_localSearchViewController didMoveToParentViewController:self];
      double v28 = [v8 leadingAnchor];
      double v27 = [(UIView *)self->_hideableFooterView leadingAnchor];
      double v26 = [v28 constraintEqualToAnchor:v27];
      v34[0] = v26;
      double v25 = [v8 trailingAnchor];
      id v24 = [(UIView *)self->_hideableFooterView trailingAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v34[1] = v23;
      double v22 = [v8 bottomAnchor];
      objc_super v12 = [(UIView *)self->_hideableFooterView bottomAnchor];
      uint64_t v13 = [v22 constraintEqualToAnchor:v12];
      v34[2] = v13;
      uint64_t v14 = [v8 topAnchor];
      uint64_t v15 = [(UIView *)self->_hideableFooterView topAnchor];
      uint64_t v16 = [v14 constraintEqualToAnchor:v15];
      v34[3] = v16;
      unsigned __int8 v17 = +[NSArray arrayWithObjects:v34 count:4];
      +[NSLayoutConstraint activateConstraints:v17];

      BOOL v6 = v29;
    }
    [(UIView *)self->_hideableFooterView layoutIfNeeded];
    [(UIView *)self->_hideableFooterView frame];
    double v19 = v18;
    if (!self->_showRefreshFooter
      || ![(LocalSearchViewController *)self->_localSearchViewController shouldBeVisible])
    {
      [(NSLayoutConstraint *)self->_bottomHideableFooterConstraint setConstant:v19];
    }
    [(NSLayoutConstraint *)self->_bottomHideableFooterConstraint constant];
    double v21 = v20;

    if (v6 && v21 != 0.0) {
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = [(LocalSearchViewController *)self->_localSearchViewController view];
    int v11 = [v10 superview];

    if (v11)
    {
LABEL_12:
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10075EDF4;
      v32[3] = &unk_1012E6300;
      BOOL v33 = a3;
      v32[4] = self;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10075EE94;
      v30[3] = &unk_1012E8908;
      BOOL v31 = a3;
      v30[4] = self;
      +[UIView animateWithDuration:v32 animations:v30 completion:0.25];
      return;
    }
  }
  self->_showRefreshFooter = a3;
}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  id v4 = a3;
  id v10 = [v4 view];
  id v5 = [v10 superview];
  if (v5)
  {
    [(NSLayoutConstraint *)self->_bottomHideableFooterConstraint constant];
    BOOL v7 = v6 == 0.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  id v8 = [v4 shouldBeVisible];
  if (v7 != v8)
  {
    id v9 = [v10 superview];

    if (v9) {
      [(SearchViewController *)self updateConstraintsForHideableFooterForWasVisible:v7 isVisible:v8];
    }
    else {
      [(SearchViewController *)self updateRefreshFooterAnimated:1];
    }
  }
}

- (void)localSearchViewControllerSizeDidChange:(id)a3
{
  id v8 = [a3 view];
  id v4 = [v8 superview];

  if (v4)
  {
    [(NSLayoutConstraint *)self->_bottomHideableFooterConstraint constant];
    if (v5 == 0.0)
    {
      [(SearchViewController *)self updateConstraintsForHideableFooterForWasVisible:1 isVisible:1];
    }
    else
    {
      [(UIView *)self->_hideableFooterView layoutIfNeeded];
      [(UIView *)self->_hideableFooterView frame];
      [(NSLayoutConstraint *)self->_bottomHideableFooterConstraint setConstant:v6];
      BOOL v7 = [(ContaineeViewController *)self cardPresentationController];
      [v7 updateHeightForCurrentLayout];
    }
  }
}

- (void)updateConstraintsForHideableFooterForWasVisible:(BOOL)a3 isVisible:(BOOL)a4
{
  if (a4 && !a3) {
    [(UIView *)self->_hideableFooterView layoutIfNeeded];
  }
  BOOL v7 = [(SearchViewController *)self view];
  [v7 frame];
  CGFloat Height = CGRectGetHeight(v15);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10075F208;
  v12[3] = &unk_1012F78E0;
  BOOL v13 = a3;
  BOOL v14 = a4;
  v12[4] = self;
  *(CGFloat *)&v12[5] = Height;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10075F314;
  v9[3] = &unk_1012F7908;
  BOOL v10 = a3;
  BOOL v11 = a4;
  v9[4] = self;
  +[UIView animateWithDuration:v12 animations:v9 completion:0.25];
}

- (VKVenueFeatureMarker)venueWithFocus
{
  v2 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v2 venuesManager];
  id v4 = [v3 venueWithFocus];

  return (VKVenueFeatureMarker *)v4;
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  id v4 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v4 venuesManager];
  [v3 presentPlaceCardForVenueWithFocusAndAddToHistory:1 source:7 centeringOnVenue:0];
}

- (BOOL)shouldInjectVenueSearchResult:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    double v5 = [v4 mapItem];
    if ([v5 _venueFeatureType])
    {
      double v6 = [(ControlContaineeViewController *)self delegate];
      BOOL v7 = [v6 currentSearchSession];
      id v8 = [v7 currentResultsSearchInfo];
      unsigned int v9 = [v8 shouldInjectSearchResults] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)localSearchViewController
{
  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    id v4 = [[LocalSearchViewController alloc] initAsButton:0];
    double v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    double v6 = [(LocalSearchViewController *)self->_localSearchViewController view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    BOOL v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 bottomSafeOffset];
    -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");

    id v8 = [(ContaineeViewController *)self cardPresentationController];
    -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", [v8 containerStyle] != (id)6);

    [(LocalSearchViewController *)self->_localSearchViewController setDelegate:self];
    localSearchViewController = self->_localSearchViewController;
  }

  return localSearchViewController;
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v22 = a3;
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v5 = [v4 isUsingOfflineMaps];

  if (v5)
  {
    id v6 = [objc_alloc((Class)CLLocation) initWithLatitude:self->_mapViewRegion.center.latitude longitude:self->_mapViewRegion.center.longitude];
    id v7 = objc_alloc((Class)CLLocation);
    [v22 region];
    double v9 = v8;
    [v22 region];
    id v10 = [v7 initWithLatitude:v9];
    [v6 distanceFromLocation:v10];
    double v12 = v11;
    uint64_t Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    double v15 = v14;
    if (v12 > (double)Integer || ([v22 _zoomLevel], vabdd_f64(v16, self->_zoomLevel) > v15))
    {
      [v22 region];
      self->_mapViewRegion.center.latitude = v17;
      self->_mapViewRegion.center.longitude = v18;
      self->_mapViewRegion.span.latitudeDelta = v19;
      self->_mapViewRegion.span.longitudeDelta = v20;
      [v22 _zoomLevel];
      self->_zoomLevel = v21;
      [(SearchViewController *)self _initOfflinePlaceHolderWithCompletion:0];
    }
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (self->_tappedTrackingButton)
  {
    self->_tappedTrackingButton = 0;
    id v5 = a3;
    id v6 = [(SearchViewController *)self localSearchViewController];
    id v7 = [v6 refreshSearchHereBusinessController];
    id v8 = [v7 didStopRespondingToGesture:v5];

    [(SearchViewController *)self showSearchingHereIfNeeded:v8];
  }
}

- (void)showSearchingHereIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v5 currentSearchSession];

  uint64_t v7 = [v6 searchInfo];
  if (v7)
  {
    id v8 = (void *)v7;
    unsigned int v9 = [v6 isLoading];

    if (!v9)
    {
      id v10 = [(SearchViewController *)self searchResultsViewController];
      BOOL v13 = [v10 view];
      double v14 = [v13 superview];

      if (!v14)
      {
        [(SearchViewController *)self _invalidateSearchSession:v6];
        double v11 = sub_1005771BC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v29 = 134218242;
          int64_t v30 = [(SearchViewController *)self currentDataSourceType];
          __int16 v31 = 2112;
          v32 = v6;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[SearchVC] Not showing search here overlay. Autocomplete is active: %ld, Search session : %@", (uint8_t *)&v29, 0x16u);
        }
        goto LABEL_6;
      }
      double v15 = [(ControlContaineeViewController *)self delegate];
      double v16 = [v15 containerViewController];
      double v11 = [v16 chromeViewController];

      if (v3)
      {
        CLLocationDegrees v17 = sub_1005771BC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          CLLocationDegrees v18 = [(ControlContaineeViewController *)self delegate];
          double v19 = [v18 currentSearchSession];
          int v29 = 138412290;
          int64_t v30 = (int64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[SearchVC] Trigerred auto-redo search: %@", (uint8_t *)&v29, 0xCu);
        }
        [v11 setNeedsUpdateComponent:@"redoSearchButton" animated:1];
        double v20 = [v11 redoSearchOverlay];
        [v20 updateSearchOverlayWithState:0];

        double v21 = [v11 redoSearchOverlay];
        [v21 shouldHideFloatingControl:0 animated:1];

        self->_didTriggerAutoRedoSearch = 1;
        [(SearchViewController *)self refreshCurrentSearch];
        goto LABEL_6;
      }
      id v22 = [(SearchViewController *)self localSearchViewController];
      v23 = [v22 refreshSearchHereBusinessController];
      unsigned int v24 = [v23 shouldShowManualRedoButton];

      if (!MapsFeature_IsEnabled_SearchAndDiscovery() || !v24)
      {
LABEL_6:

        goto LABEL_7;
      }
      double v25 = sub_1005771BC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        double v26 = [(ControlContaineeViewController *)self delegate];
        double v27 = [v26 currentSearchSession];
        int v29 = 138412290;
        int64_t v30 = (int64_t)v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[SearchVC] Showing search here button as we did not trigger Auto-Redo: %@", (uint8_t *)&v29, 0xCu);
      }
      [v11 setNeedsUpdateComponent:@"redoSearchButton" animated:1];
      double v28 = [v11 redoSearchOverlay];
      [v28 updateSearchOverlayWithState:1];

      double v12 = +[MKMapService sharedService];
      [v12 captureUserAction:460 onTarget:503 eventValue:0];
LABEL_5:

      goto LABEL_6;
    }
  }
  id v10 = sub_1005771BC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    [v6 isLoading];
    double v11 = NSStringFromBOOL();
    double v12 = [v6 searchInfo];
    int v29 = 138412546;
    int64_t v30 = (int64_t)v11;
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[SearchVC] Not showing search here overlay. Search session loading:(%@) or doesn't have searchInfo: %@", (uint8_t *)&v29, 0x16u);
    goto LABEL_5;
  }
LABEL_7:
}

- (void)didUpdateSearchResults
{
  if (self->_didTriggerAutoRedoSearch) {
    self->_didTriggerAutoRedoSearch = 0;
  }
}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  id v5 = [(LocalSearchViewController *)self->_localSearchViewController browseVenueBusinessController];
  [v5 handleMapTypeDidChange:a4];
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = sub_1005771BC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [(ControlContaineeViewController *)self delegate];
    id v10 = [v9 currentSearchSession];
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    double v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[SearchVC] willStartRespondingToGesture:%@, searchSession:%@", (uint8_t *)&v13, 0x16u);
  }
  if (!a4)
  {
    double v11 = [(SearchViewController *)self localSearchViewController];
    double v12 = [v11 refreshSearchHereBusinessController];
    [v12 didStartRespondingToGesture:v7];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v10 = a3;
  double v11 = sub_1005771BC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v12 = [(ControlContaineeViewController *)self delegate];
    int v13 = [v12 currentSearchSession];
    int v17 = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    double v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[SearchVC] didStopRespondingToGesture:%@, searchSession:%@", (uint8_t *)&v17, 0x16u);
  }
  if (!a4)
  {
    id v14 = [(SearchViewController *)self localSearchViewController];
    __int16 v15 = [v14 refreshSearchHereBusinessController];
    id v16 = [v15 didStopRespondingToGesture:v10];

    [(SearchViewController *)self showSearchingHereIfNeeded:v16];
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a3;
  if (v6)
  {
    unsigned int v9 = sub_1005771BC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(ControlContaineeViewController *)self delegate];
      double v11 = [v10 currentSearchSession];
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      int v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[SearchVC] didChangeUserTrackingMode:%@, searchSession:%@", (uint8_t *)&v14, 0x16u);
    }
    self->_tappedTrackingButton = 1;
    double v12 = [(SearchViewController *)self localSearchViewController];
    int v13 = [v12 refreshSearchHereBusinessController];
    [v13 didStartRespondingToGesture:v8];
  }
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  localSearchViewController = self->_localSearchViewController;
  id v6 = a3;
  id v7 = [(LocalSearchViewController *)localSearchViewController browseVenueBusinessController];
  [v7 handleVenueWithFocusDidChange:v6];
}

- (int)listForDataSource:(id)a3
{
  currentDataSource = (SearchDataSource *)self->_currentDataSource;
  if (currentDataSource == (SearchDataSource *)self->_searchHomeDataSource) {
    return 1;
  }
  else {
    return 4 * (currentDataSource == self->_searchDataSource);
  }
}

- (void)dataSourceUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchViewController *)self currentDataSource];

  id v6 = sub_1000AA148();
  id v7 = v6;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      contentTableView = self->_contentTableView;
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      int v14 = contentTableView;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SVC dataSource %@ reloading %@", (uint8_t *)&v11, 0x16u);
    }

    [(SearchViewController *)self reloadContentTableView];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = self->_contentTableView;
      unsigned int v9 = [(UITableView *)v8 dataSource];
      int v11 = 138412802;
      id v12 = v4;
      __int16 v13 = 2112;
      int v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SVC dataSource %@ not current delegate of %@. Current DataSource: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
}

- (void)dataSource:(id)a3 itemTapped:(id)a4 childItemParent:(id)a5
{
  v194 = (DirectionItem *)a3;
  id v7 = (DirectionItem *)a4;
  v195 = (DirectionItem *)a5;
  id v8 = sub_1000AA148();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v232 = v194;
    __int16 v233 = 2112;
    v234 = v7;
    __int16 v235 = 2112;
    v236 = v195;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "dataSource: %@ itemTapped: %@ childItemParent: %@", buf, 0x20u);
  }

  [(SearchViewController *)self resetMapServiceTicket];
  if (v195) {
    unsigned int v9 = v195;
  }
  else {
    unsigned int v9 = v7;
  }
  [(SearchViewController *)self retainSearchQueryForSelectedAutocompleteItem:v9 forTimeInterval:0.0];
  if (sub_1000BBB44(self) == 5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(DirectionItem *)v7 historyEntry];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(HomeViewController *)self->_homeViewController scrollContentToOriginalPosition];
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [(DirectionItem *)v7 entryTapBehavior] != (id)1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v7;
      id v12 = [(DirectionItem *)v7 childItemType];
      if (v12 == (id)3)
      {
        __int16 v13 = v195;
      }
      else
      {
        if (v12 == (id)2)
        {
          objc_initWeak(&location, self);
          int v14 = [(DirectionItem *)v7 childItemAction];
          id v15 = [v14 childActionType];

          __int16 v13 = v7;
          switch((unint64_t)v15)
          {
            case 1uLL:
              __int16 v16 = objc_alloc_init(SearchFieldItem);
              int v17 = +[SearchResult currentLocationSearchResult];
              [(SearchFieldItem *)v16 setSearchResult:v17];

              id v18 = +[SearchFieldItem searchFieldItemWithObject:v195];
              __int16 v19 = (DirectionItem *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
              [(DirectionItem *)v19 addObject:v16];
              if (v18)
              {
                [(DirectionItem *)v19 addObject:v18];
              }
              else
              {
                double v21 = sub_100109E50();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v232 = v195;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Cannot select Directions child item with childItemParent: %@", buf, 0xCu);
                }
              }
              __int16 v13 = [[DirectionItem alloc] initWithItems:v19 ignoreMapType:0 transportType:0];

              goto LABEL_36;
            case 2uLL:
              v221[0] = _NSConcreteStackBlock;
              v221[1] = 3221225472;
              v221[2] = sub_100762020;
              v221[3] = &unk_1012F7930;
              double v20 = &v222;
              objc_copyWeak(&v222, &location);
              [(SearchViewController *)self fetchSearchCompletion:v195 completion:v221];
              goto LABEL_28;
            case 3uLL:
              __int16 v16 = [(DirectionItem *)v7 childItemAction];
              id v18 = [(SearchFieldItem *)v16 childActionSearch];
              __int16 v13 = [v18 relatedSearchSuggestion];
              __int16 v19 = v7;
LABEL_36:

              goto LABEL_37;
            case 4uLL:
              v219[0] = _NSConcreteStackBlock;
              v219[1] = 3221225472;
              v219[2] = sub_1007620A4;
              v219[3] = &unk_1012F7930;
              double v20 = &v220;
              objc_copyWeak(&v220, &location);
              [(SearchViewController *)self fetchSearchCompletion:v195 completion:v219];
              goto LABEL_28;
            case 5uLL:
              [(SearchViewController *)self fetchSearchCompletion:v195 completion:&stru_1012F7970];
              goto LABEL_31;
            case 6uLL:
              v217[0] = _NSConcreteStackBlock;
              v217[1] = 3221225472;
              v217[2] = sub_100762208;
              v217[3] = &unk_1012F7930;
              double v20 = &v218;
              objc_copyWeak(&v218, &location);
              [(SearchViewController *)self fetchSearchCompletion:v195 completion:v217];
LABEL_28:
              objc_destroyWeak(v20);
              goto LABEL_31;
            case 7uLL:
              [(SearchViewController *)self fetchSearchCompletion:v195 completion:0];
              __int16 v16 = [(DirectionItem *)v7 childItemAction];
              __int16 v13 = [(SearchFieldItem *)v16 guideLocation];
              id v18 = v7;
LABEL_37:

              goto LABEL_38;
            case 8uLL:
              [(SearchViewController *)self showRegionSelectorForMapItem:v195];
LABEL_31:
              objc_destroyWeak(&location);

              goto LABEL_86;
            default:
LABEL_38:
              objc_destroyWeak(&location);
              goto LABEL_39;
          }
        }
        __int16 v13 = v7;
        if (v12 == (id)1)
        {
          __int16 v13 = [(DirectionItem *)v7 childItemPlace];
        }
      }
LABEL_39:
    }
    else
    {
      __int16 v13 = v7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v193 = v195;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v22 = v193;
      }
      else {
        id v22 = 0;
      }
      v192 = v22;

      if (!v192) {
        goto LABEL_85;
      }
      v208 = v13;
      id v200 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
      [v200 setResultRefinementOriginType:3];
      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id obj = [(DirectionItem *)v192 resultRefinements];
      id v201 = [obj countByEnumeratingWithState:&v213 objects:v230 count:16];
      if (v201)
      {
        uint64_t v199 = *(void *)v214;
        do
        {
          for (i = 0; i != v201; i = (char *)i + 1)
          {
            if (*(void *)v214 != v199) {
              objc_enumerationMutation(obj);
            }
            unsigned int v24 = *(void **)(*((void *)&v213 + 1) + 8 * i);
            if ([v24 isEqual:v208])
            {
              id v198 = objc_alloc((Class)GEOResultRefinementToggle);
              v207 = [(DirectionItem *)v208 toggle];
              v203 = [v207 displayName];
              v206 = [(DirectionItem *)v208 toggle];
              unsigned int v25 = [v206 isSelected];
              v205 = [(DirectionItem *)v208 toggle];
              v202 = [v205 metadata];
              v204 = [(DirectionItem *)v208 toggle];
              id v26 = [v204 toggleType];
              double v27 = [(DirectionItem *)v208 toggle];
              id v28 = [v27 evChargingConnectorType];
              int v29 = [(DirectionItem *)v208 toggle];
              unsigned __int8 v30 = [v29 selectionFromView];
              __int16 v31 = [(DirectionItem *)v208 toggle];
              v32 = [v31 refinementKey];
              BOOL v33 = [(DirectionItem *)v208 toggle];
              LOBYTE(v191) = [v33 showAsSelected];
              LOBYTE(v190) = v30;
              id v34 = [v198 initWithDisplayName:v203 isSelected:v25 ^ 1 metadata:v202 toggleType:v26 evChargingConnectorType:v28 selectionSequenceNumber:&off_1013A88D8 selectionFromView:v190 refinementKey:v32 showAsSelected:v191];

              id v35 = [objc_alloc((Class)GEOResultRefinement) initWithToggle:v34];
              unsigned int v36 = [v35 convertToGEOPDResultRefinement];
              [v200 addRefinement:v36];
            }
            else
            {
              id v34 = [v24 convertToGEOPDResultRefinement];
              [v200 addRefinement:v34];
            }
          }
          id v201 = [obj countByEnumeratingWithState:&v213 objects:v230 count:16];
        }
        while (v201);
      }

      v37 = v192;
      __int16 v13 = v193;
    }
    else
    {
      id v200 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_initWeak((id *)buf, self);
      v211[0] = _NSConcreteStackBlock;
      v211[1] = 3221225472;
      v211[2] = sub_1007622A0;
      v211[3] = &unk_1012ECE48;
      objc_copyWeak(&v212, (id *)buf);
      v211[4] = self;
      [(SearchViewController *)self fetchMapItemWithIdentifier:v13 completion:v211];
      objc_destroyWeak(&v212);
      objc_destroyWeak((id *)buf);
LABEL_84:

LABEL_85:
      id v7 = v13;
      goto LABEL_86;
    }
    [(SearchViewController *)self showDropDown:0];
    v38 = [(SearchViewController *)self view];
    [v38 endEditing:1];

    v39 = +[NSMutableDictionary dictionary];
    v40 = +[NSNumber numberWithBool:[(SearchViewController *)self isSearchingAlongTheRoute]];
    [v39 setObject:v40 forKeyedSubscript:@"SearchAlongRoute"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = v13;
      [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NoHistoryEntry"];
      uint64_t v42 = [(SearchViewController *)self currentDataSource];
      objc_opt_class();
      v43 = +[NSNumber numberWithBool:objc_opt_isKindOfClass() & 1];
      [v39 setObject:v43 forKeyedSubscript:@"MSGEntryForceShowPlacecardOnTap"];

      if ([(DirectionItem *)v41 isShortcut])
      {
        v44 = [(DirectionItem *)v41 shortcutIdentifier];
        [v39 setObject:v44 forKeyedSubscript:@"ShortcutIdentifier"];
      }
      v45 = [(ControlContaineeViewController *)self delegate];
      [v45 viewController:self openMapsSuggestionEntry:v41 withUserInfo:v39];

      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = v13;
      [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NoHistoryEntry"];
      v47 = [(SearchViewController *)self currentDataSource];
      objc_opt_class();
      v48 = +[NSNumber numberWithBool:objc_opt_isKindOfClass() & 1];
      [v39 setObject:v48 forKeyedSubscript:@"MSGEntryForceShowPlacecardOnTap"];

      double v49 = [(DirectionItem *)v46 identifier];
      [v39 setObject:v49 forKeyedSubscript:@"ShortcutIdentifier"];

      v50 = [(ControlContaineeViewController *)self delegate];
      [v50 viewController:self openFavoriteItem:v46 withUserInfo:v39];

LABEL_83:
      goto LABEL_84;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(DirectionItem *)v13 isEqualToString:@"FavoritesEntry"])
    {
      v51 = [(ControlContaineeViewController *)self delegate];
      [v51 viewControllerShowCollections:self];

      goto LABEL_83;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(DirectionItem *)v13 isEqualToString:@"newShortcutEntry"])
    {
      v52 = [(ControlContaineeViewController *)self delegate];
      double v53 = +[ShortcutEditSession addSession];
      [v52 viewController:self showAddShortcut:v53];

      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = v13;
      v55 = [(DirectionItem *)v54 sharedTrips];
      BOOL v56 = [v55 count] == (id)1;

      unsigned int v57 = [(ControlContaineeViewController *)self delegate];
      v58 = v57;
      if (v56)
      {
        v59 = [(DirectionItem *)v54 sharedTrips];
        v60 = [v59 firstObject];
        [v58 presentSharedTrip:v60];
      }
      else
      {
        [v57 presentSharedTrips];
      }

      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v39 setObject:&off_1013A88F0 forKeyedSubscript:@"DirectionsSessionInitiatorKey"];
      v61 = self;
      if (self->_currentDataSource == &self->_searchDataSource->super)
      {
        [v39 setObject:&off_1013A8908 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
        v61 = self;
      }
      BOOL v62 = [(ControlContaineeViewController *)v61 delegate];
      [v62 viewController:self doDirectionItem:v13 withUserInfo:v39];

      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v63 = v13;
      v64 = [(DirectionItem *)v63 directionIntent];

      if (v64)
      {
        v65 = [(ControlContaineeViewController *)self delegate];
        [v65 viewController:self doDirectionIntentWithLocalSearchCompletion:v63];

        goto LABEL_83;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v66 = [(ControlContaineeViewController *)self delegate];
      [v66 viewControllerShowLibraryRootView:self];

      goto LABEL_83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v67 = v13;
      v68 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
      objc_opt_class();
      v69 = v67;
      if (objc_opt_isKindOfClass()) {
        v70 = v69;
      }
      else {
        v70 = 0;
      }
      v71 = v70;

      if (v71
        && ([(DirectionItem *)v71 historyEntry],
            v72 = objc_claimAutoreleasedReturnValue(),
            unsigned int v73 = [v72 conformsToProtocol:v68],
            v72,
            v73))
      {
        v74 = v69;
      }
      else
      {
        v74 = 0;
      }

      if (v74)
      {
        v77 = v69;
        v78 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
        objc_opt_class();
        v79 = v77;
        if (objc_opt_isKindOfClass()) {
          id v80 = v79;
        }
        else {
          id v80 = 0;
        }
        id v81 = v80;

        if (v81
          && ([(DirectionItem *)v81 historyEntry],
              v82 = objc_claimAutoreleasedReturnValue(),
              unsigned int v83 = [v82 conformsToProtocol:v78],
              v82,
              v83))
        {
          v84 = v79;
        }
        else
        {
          v84 = 0;
        }

        v86 = [(DirectionItem *)v84 historyEntry];
        v87 = [v86 endWaypoint];
        objc_opt_class();
        char v88 = objc_opt_isKindOfClass();

        if (v88)
        {
          v89 = [v86 endWaypoint];
          id v90 = [(ControlContaineeViewController *)self delegate];
          v91 = [v89 route];
          CFStringRef v228 = @"DirectionsRouteUUIDKey";
          v92 = [v86 identifier];
          v229 = v92;
          v93 = +[NSDictionary dictionaryWithObjects:&v229 forKeys:&v228 count:1];
          [(DirectionItem *)v90 viewController:self enterRouteCreationWithRoute:v91 withUserInfo:v93];
        }
        else
        {
          v89 = +[SearchFieldItem searchFieldItemsForRouteHistoryEntry:v86];
          if (([v86 navigationWasInterrupted] & 1) != 0
            || (unint64_t)[v89 count] >= 3)
          {
            id v106 = [v86 transportType];
          }
          else
          {
            id v106 = 0;
          }
          id v90 = [[DirectionItem alloc] initWithItems:v89 transportType:v106];
          v226[0] = @"DirectionsSessionInitiatorKey";
          v226[1] = @"DirectionsRouteUUIDKey";
          v227[0] = &off_1013A88F0;
          v137 = [v86 identifier];
          v227[1] = v137;
          v91 = +[NSDictionary dictionaryWithObjects:v227 forKeys:v226 count:2];

          v92 = [(ControlContaineeViewController *)self delegate];
          [v92 viewController:self doDirectionItem:v90 withUserInfo:v91];
        }

        goto LABEL_83;
      }
      v98 = v69;
      v99 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
      objc_opt_class();
      v100 = v98;
      if (objc_opt_isKindOfClass()) {
        v101 = v100;
      }
      else {
        v101 = 0;
      }
      v102 = v101;

      if (v102
        && ([(DirectionItem *)v102 historyEntry],
            v103 = objc_claimAutoreleasedReturnValue(),
            unsigned int v104 = [v103 conformsToProtocol:v99],
            v103,
            v104))
      {
        v105 = v100;
      }
      else
      {
        v105 = 0;
      }

      if (v105)
      {
        v108 = v100;
        v109 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
        objc_opt_class();
        v110 = v108;
        if (objc_opt_isKindOfClass()) {
          v111 = v110;
        }
        else {
          v111 = 0;
        }
        v112 = v111;

        if (v112
          && ([(DirectionItem *)v112 historyEntry],
              v113 = objc_claimAutoreleasedReturnValue(),
              unsigned int v114 = [v113 conformsToProtocol:v109],
              v113,
              v114))
        {
          v115 = v110;
        }
        else
        {
          v115 = 0;
        }

        v116 = [(ControlContaineeViewController *)self delegate];
        v117 = [(DirectionItem *)v115 historyEntry];
        v118 = [v117 lineItem];
        [v116 viewController:self selectTransitLineItem:v118 zoomToMapRegion:1];

        goto LABEL_83;
      }
      v119 = v100;
      v120 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      objc_opt_class();
      v121 = v119;
      if (objc_opt_isKindOfClass()) {
        v122 = v121;
      }
      else {
        v122 = 0;
      }
      v123 = v122;

      if (v123
        && ([(DirectionItem *)v123 historyEntry],
            v124 = objc_claimAutoreleasedReturnValue(),
            unsigned int v125 = [v124 conformsToProtocol:v120],
            v124,
            v125))
      {
        v126 = v121;
      }
      else
      {
        v126 = 0;
      }

      if (v126)
      {
        v129 = v121;
        v130 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
        objc_opt_class();
        v131 = v129;
        if (objc_opt_isKindOfClass()) {
          v132 = v131;
        }
        else {
          v132 = 0;
        }
        id v133 = v132;

        if (v133
          && ([v133 historyEntry],
              v134 = objc_claimAutoreleasedReturnValue(),
              unsigned int v135 = [v134 conformsToProtocol:v130],
              v134,
              v135))
        {
          v136 = v131;
        }
        else
        {
          v136 = 0;
        }

        v139 = [v136 historyEntry];
        v140 = [v139 placeCollection];

        v141 = [(ControlContaineeViewController *)self delegate];
        [v141 viewController:self showCuratedCollection:v140];

        goto LABEL_83;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_initWeak((id *)buf, self);
        v75 = [(SearchViewController *)self _maps_mapsSceneDelegate];
        v76 = [v75 rapPresenter];
        v209[0] = _NSConcreteStackBlock;
        v209[1] = 3221225472;
        v209[2] = sub_10076236C;
        v209[3] = &unk_1012E6708;
        objc_copyWeak(&v210, (id *)buf);
        [v76 presentAddToMapsFromSearchEntryPoint:11 result:v13 completion:v209];

        objc_destroyWeak(&v210);
        objc_destroyWeak((id *)buf);
        goto LABEL_83;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [(DirectionItem *)v13 type] == 3)
      {
        v85 = [(ControlContaineeViewController *)self delegate];
        [v85 viewController:self selectDroppedPin:v13];

        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v94 = [(DirectionItem *)v13 clientResolved];
        BOOL v95 = v94 == 0;

        if (!v95)
        {
          v96 = [(DirectionItem *)v13 clientResolved];
          v97 = [(ControlContaineeViewController *)self delegate];
          [v97 viewController:self selectClientResolvedItem:v96 fromSearchInfo:0 withUserInfo:0];

          goto LABEL_83;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v107 = [(ControlContaineeViewController *)self delegate];
        [v107 viewController:self showCollection:v13];

        goto LABEL_83;
      }
      if ([(DirectionItem *)v13 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
      {
        v127 = [[IncompleteTransitLineItem alloc] initWithTransitLine:v13];
        objc_super v128 = [(ControlContaineeViewController *)self delegate];
        [v128 viewController:self selectTransitLineItem:v127 zoomToMapRegion:1];

        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v138 = [(ControlContaineeViewController *)self delegate];
        [v138 viewController:self showCuratedCollection:v13];

        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v142 = [(ControlContaineeViewController *)self delegate];
        [v142 viewControllerShowPublisher:v13];

        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_maintainSearchStateWhenDisappearing = 1;
        v143 = [(ControlContaineeViewController *)self delegate];
        [v143 viewController:self showGuidesHome:v13];

        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v144 = v13;
        if ([(DirectionItem *)v144 type] != 11
          || ([(DirectionItem *)v144 relatedSection],
              v145 = objc_claimAutoreleasedReturnValue(),
              [v145 relatedCollectionSection],
              v146 = objc_claimAutoreleasedReturnValue(),
              BOOL v147 = v146 == 0,
              v146,
              v145,
              v147))
        {
          if (!MapsFeature_IsEnabled_SearchAndDiscovery()
            || ([(DirectionItem *)v144 placeCollection],
                v182 = objc_claimAutoreleasedReturnValue(),
                BOOL v183 = v182 == 0,
                v182,
                v183))
          {
            if ([(SearchViewController *)self shouldInjectVenueSearchResult:v144])
            {
              v184 = [(ControlContaineeViewController *)self delegate];
              [v184 viewController:self selectSearchResult:v144 addToHistory:1 source:2 saveSelectionState:1 replaceCurrentCard:0];

              v148 = [(ControlContaineeViewController *)self delegate];
              v149 = [v148 searchPinsManager];
              v225 = v144;
              v185 = +[NSArray arrayWithObjects:&v225 count:1];
              [v149 setSearchPins:v185 selectedPin:v144 animated:1];
            }
            else
            {
              v186 = [(DirectionItem *)v144 mapItem];
              unsigned int v187 = [v186 _hasHikeInfo];

              v188 = [(ControlContaineeViewController *)self delegate];
              v148 = v188;
              if (v187)
              {
                v149 = [v188 appCoordinator];
                v189 = [(DirectionItem *)v144 mapItem];
                [v149 enterRouteCreationWithMapItem:v189 completion:0];
              }
              else
              {
                v149 = [v188 mapSelectionManager];
                [v149 selectSearchResult:v144 animated:1];
              }
            }
          }
          else
          {
            v148 = [(ControlContaineeViewController *)self delegate];
            v149 = [(DirectionItem *)v144 placeCollection];
            [v148 viewController:self showCuratedCollection:v149];
          }
        }
        else
        {
          v148 = [(ControlContaineeViewController *)self delegate];
          v149 = [(DirectionItem *)v144 relatedSection];
          v150 = [v149 relatedPlaceCollections];
          v151 = +[NSBundle mainBundle];
          v152 = [v151 localizedStringForKey:@"Related Guides" value:@"localized string not found" table:0];
          [v148 viewController:self showCuratedCollectionsList:v150 usingTitle:v152 usingCollectionIds:0 completion:0];
        }
        goto LABEL_83;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v153 = [[SearchResult alloc] initWithMapItem:v13];
        v154 = [(ControlContaineeViewController *)self delegate];
        v155 = [v154 searchPinsManager];
        v224 = v153;
        v156 = +[NSArray arrayWithObjects:&v224 count:1];
        [v155 setSearchPins:v156 selectedPin:v153 animated:1];

        goto LABEL_83;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(DirectionItem *)v13 category],
          v157 = objc_claimAutoreleasedReturnValue(),
          [v157 venueIdentifier],
          v158 = objc_claimAutoreleasedReturnValue(),
          BOOL v159 = v158 == 0,
          v158,
          v157,
          v159))
    {
      v164 = +[SearchFieldItem searchFieldItemWithObject:v13];
    }
    else
    {
      v160 = [(DirectionItem *)v13 category];
      v161 = [VenueCategoryItem alloc];
      v162 = [v160 venueIdentifier];
      v163 = -[VenueCategoryItem initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:](v161, "initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:", v160, v162, [v160 displayMode], 1, 0);

      v164 = +[SearchFieldItem searchFieldItemWithObject:v163];
    }
    if (!v164)
    {
LABEL_202:

      goto LABEL_83;
    }
    [v164 setUserTypedStringForRAP:self->_userTypedSearchString];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NoHistoryEntry"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NoHistoryEntry"];
        v165 = v13;
        v166 = +[Recents sharedRecents];
        [v166 recordCoreRecentContact:v165];
      }
    }
    currentDataSource = (SearchHomeDataSource *)self->_currentDataSource;
    if (currentDataSource == (SearchHomeDataSource *)self->_searchDataSource)
    {
      v168 = &off_1013A8908;
    }
    else
    {
      if (currentDataSource && currentDataSource != self->_searchHomeDataSource)
      {
LABEL_185:
        if (sub_1000BBB44(self) == 5)
        {
          v169 = v13;
          v170 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
          objc_opt_class();
          v171 = v169;
          v172 = (objc_opt_isKindOfClass() & 1) != 0 ? v171 : 0;
          v173 = v172;

          if (v173
            && ([(DirectionItem *)v173 historyEntry],
                v174 = objc_claimAutoreleasedReturnValue(),
                unsigned int v175 = [v174 conformsToProtocol:v170],
                v174,
                v175))
          {
            v176 = v171;
          }
          else
          {
            v176 = 0;
          }

          if (v176)
          {
            char v177 = 1;
          }
          else
          {
            objc_opt_class();
            char v177 = objc_opt_isKindOfClass();
          }
          if (v176, objc_opt_class(), (objc_opt_isKindOfClass())
            && ((id v178 = [(DirectionItem *)v171 _type]) == 0 || v178 == (id)3)
            || (v177 & 1) != 0)
          {
            v179 = [(ControlContaineeViewController *)self delegate];
            [v179 clearSearchPins];

            v180 = [v164 searchString];
            [(UITextField *)self->_searchField setText:v180];
          }
        }
        v181 = [(ControlContaineeViewController *)self delegate];
        [v181 viewController:self doSearchItem:v164 withUserInfo:v39 refinementsQuery:v200];

        [(SearchDataSource *)self->_searchDataSource clearAutocompleteResults];
        goto LABEL_202;
      }
      v168 = &off_1013A8920;
    }
    [v39 setObject:v168 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
    goto LABEL_185;
  }
  [(SearchViewController *)self triggerAutocompleteByReplacingQueryWithCompletion:v7];
LABEL_86:
}

- (void)didTapOnHomePinnedLibraryItem:(id)a3
{
  id v4 = a3;
  id v6 = [(ControlContaineeViewController *)self delegate];
  id v5 = +[ShortcutEditSession editSessionWithShortcut:v4];

  [v6 viewController:self editShortcut:v5];
}

- (void)didTapToUnpinLibraryItem:(id)a3
{
  id v4 = a3;
  id v6 = [(ControlContaineeViewController *)self delegate];
  id v5 = +[ShortcutEditSession editSessionWithShortcut:v4];

  [v6 viewController:self removeShortcut:v5];
}

- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SearchViewController *)self triggerAutocompleteByReplacingQueryWithCompletion:v5];
  }
}

- (void)showRegionSelectorForMapItem:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007627C4;
  v16[3] = &unk_1012EB600;
  v16[4] = self;
  id v5 = objc_retainBlock(v16);
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10076289C;
    v14[3] = &unk_1012F7998;
    v14[4] = self;
    id v15 = v5;
    [(SearchViewController *)self fetchSearchCompletion:v8 completion:v14];
  }
  else
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    id v12 = [v11 mapItem];

    if (v12)
    {
      __int16 v13 = [v11 mapItem];
      ((void (*)(void *, NSObject *))v5[2])(v5, v13);
    }
    else
    {
      __int16 v13 = sub_100109E50();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Offline: This type of poi item is not handled :%@.", buf, 0xCu);
      }
    }
  }
}

- (void)fetchSearchCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchViewController *)self resetMapServiceTicket];
  objc_initWeak(&location, self);
  id v8 = [(ControlContaineeViewController *)self delegate];
  id v9 = [v8 newTraits];

  if (self->_currentDataSource == &self->_searchDataSource->super) {
    [v9 setSource:7];
  }
  id v10 = +[MKMapService sharedService];
  id v11 = [v6 queryLine];
  id v12 = [v6 geoCompletionItem];
  __int16 v13 = [v10 ticketForSearchQuery:v11 completionItem:v12 traits:v9 searchSessionData:0];
  mapServiceTicket = self->_mapServiceTicket;
  self->_mapServiceTicket = v13;

  id v15 = self->_mapServiceTicket;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100762B00;
  v17[3] = &unk_1012F79C0;
  objc_copyWeak(&v19, &location);
  id v16 = v7;
  id v18 = v16;
  [(MKMapServiceTicket *)v15 submitWithRefinedHandler:v17 networkActivity:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)fetchMapItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchViewController *)self resetMapServiceTicket];
  id v8 = [objc_alloc((Class)MKMapItemIdentifier) initWithGEOMapItemIdentifier:v6];
  objc_initWeak(&location, self);
  id v9 = +[MKMapService sharedService];
  id v21 = v8;
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  id v11 = [(ControlContaineeViewController *)self delegate];
  id v12 = [v11 newTraits];
  __int16 v13 = [v9 ticketForIdentifiers:v10 traits:v12];
  self = (SearchViewController *)((char *)self + 328);
  Class isa = self->super.super.super.super.super.super.isa;
  self->super.super.super.super.super.super.Class isa = v13;

  Class v15 = self->super.super.super.super.super.super.isa;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100762DA4;
  v17[3] = &unk_1012EB628;
  objc_copyWeak(&v19, &location);
  id v16 = v7;
  id v18 = v16;
  [(objc_class *)v15 submitWithHandler:v17 networkActivity:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  id v10 = a4;
  id v5 = [(SearchViewController *)self view];
  [v5 endEditing:1];

  self->_maintainSearchStateWhenDisappearing = 1;
  id v6 = [v10 type];
  if (v6 == (id)3)
  {
    id v7 = [(ControlContaineeViewController *)self delegate];
    id v8 = [v10 userGeneratedCollection];
    [v7 viewController:self showCollection:v8];
  }
  else if (v6 == (id)2)
  {
    id v7 = [(ControlContaineeViewController *)self delegate];
    id v8 = [v10 placeCollections];
    [v7 viewController:self showCuratedCollectionsList:v8 usingTitle:0 usingCollectionIds:0 completion:0];
  }
  else
  {
    if (v6 != (id)1) {
      goto LABEL_8;
    }
    id v7 = [(ControlContaineeViewController *)self delegate];
    id v8 = [v10 placeCollections];
    id v9 = [v8 firstObject];
    [v7 viewController:self showCuratedCollection:v9];
  }
LABEL_8:
}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchViewController *)self view];
  [v5 endEditing:1];

  self->_maintainSearchStateWhenDisappearing = 1;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewController:self showCollection:v4];
}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchViewController *)self view];
  [v5 endEditing:1];

  self->_maintainSearchStateWhenDisappearing = 1;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewController:self showCuratedCollection:v4];
}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchViewController *)self view];
  [v5 endEditing:1];

  if (sub_1000BBB44(self) == 5) {
    [(SearchViewController *)self showDropDown:0];
  }
  self->_maintainSearchStateWhenDisappearing = 1;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewController:self showCuratedCollectionsList:v4 usingTitle:0 usingCollectionIds:0 completion:0];
}

- (double)isTouristHereValue
{
  return self->_isTouristHereValue;
}

- (id)recentAutocompleteSessionData
{
  v2 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
  BOOL v3 = [v2 _recentAutocompleteSessionData];

  return v3;
}

- (void)seeAllTappedForCollections
{
  if (sub_1000BBB44(self) == 5)
  {
    [(SearchViewController *)self showDropDown:0];
    BOOL v3 = [(SearchViewController *)self view];
    [v3 endEditing:1];
  }
  id v4 = [(ControlContaineeViewController *)self delegate];
  [v4 viewControllerShowAllCollections];
}

- (void)seeAllTappedForRecents
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  [v3 viewControllerShowMyRecents:self includeRecentSearches:1];
}

- (void)seeAllTappedForUserGuides
{
  id v2 = [(ControlContaineeViewController *)self delegate];
  [v2 viewControllerShowCollections:0];
}

- (void)shareCollection:(id)a3 collection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ControlContaineeViewController *)self delegate];
  id v8 = [v9 appCoordinator];
  [v8 shareCollection:v6 sourceView:v7 completion:0];
}

- (void)showCitySelector
{
  id v2 = [(ControlContaineeViewController *)self delegate];
  [v2 viewControllerShowCitySelectorFromGuideLocation:0];
}

- (void)showGuidesHomeFromExploreGuides:(id)a3
{
  id v4 = a3;
  id v6 = [(ControlContaineeViewController *)self delegate];
  id v5 = [v4 guideLocation];

  [v6 viewController:self showGuidesHome:v5];
}

- (void)homeItemTapped:(id)a3
{
}

- (void)homePinnedLibraryItemTapped:(id)a3
{
}

- (void)homeDidTapToUnpinLibraryShortcutItem:(id)a3
{
}

- (void)homeSectionHeaderButtonTapped:(int64_t)a3
{
  switch(a3)
  {
    case 5:
      id v4 = [(ControlContaineeViewController *)self delegate];
      [v4 viewControllerShowMyRecents:self includeRecentSearches:0];
      break;
    case 3:
      id v4 = [(ControlContaineeViewController *)self delegate];
      [v4 viewControllerShowCollections:self];
      break;
    case 2:
      id v4 = [(ControlContaineeViewController *)self delegate];
      [v4 viewControllerShowMyShortcuts:self];
      break;
    default:
      return;
  }
}

- (void)homeDidTapOnPlaceContextWithViewModel:(id)a3
{
}

- (void)homeContentDidUpdate
{
  [(SearchViewController *)self _contentAlphaForCurrentLayout];
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);
  [(SearchViewController *)self _invalidateMediumHeightCache];
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containerStyle];

  if (v4 == (id)6)
  {
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 updateHeightForCurrentLayout];
  }
}

- (void)homeDidTapOnContainment:(id)a3 forResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [[SearchResult alloc] initWithMapItem:v7];

  id v8 = [v6 arrayByAddingObject:v11];

  id v9 = [(ControlContaineeViewController *)self delegate];
  id v10 = [v9 searchPinsManager];
  [v10 setSearchPins:v8 selectedPin:v11 animated:1];
}

- (void)homeDidTapShareMyLocation
{
  id v3 = +[NSBundle mainBundle];
  id v7 = [v3 localizedStringForKey:@"Share My Location [App Delegate]" value:@"localized string not found" table:0];

  id v4 = [objc_alloc((Class)UIApplicationShortcutItem) initWithType:@"com.apple.Maps.action.share-location-from-app-delegate" localizedTitle:v7 localizedSubtitle:0 icon:0 userInfo:0];
  id v5 = [(SearchViewController *)self _maps_mapsSceneDelegate];
  id v6 = [v5 entryPointsCoordinator];
  [v6 openShortcutItem:v4];
}

- (void)homeDidTapMarkMyLocation
{
  id v3 = +[NSBundle mainBundle];
  id v7 = [v3 localizedStringForKey:@"Mark My Location [App Delegate]" value:@"localized string not found" table:0];

  id v4 = [objc_alloc((Class)UIApplicationShortcutItem) initWithType:@"com.apple.Maps.action.mark-my-location-from-app-delegate" localizedTitle:v7 localizedSubtitle:0 icon:0 userInfo:0];
  id v5 = [(SearchViewController *)self _maps_mapsSceneDelegate];
  id v6 = [v5 entryPointsCoordinator];
  [v6 openShortcutItem:v4];
}

- (void)homeDidTapReportAProblem
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  [v3 viewControllerShowReports:self];
}

- (void)homeDidTapTermsAndConditions
{
  id v3 = GEOConfigGetString();
  id v5 = +[NSURL URLWithString:v3];

  id v4 = [(SearchViewController *)self homeActionCoordinator];
  [v4 viewController:self openURL:v5];
}

- (ShareDelegate)homeShareDelegate
{
  id v2 = [(ControlContaineeViewController *)self delegate];
  id v3 = [v2 appCoordinator];

  return (ShareDelegate *)v3;
}

- (ParkedCarActionDelegate)homeParkedCarActionDelegate
{
  id v2 = [(ControlContaineeViewController *)self delegate];
  id v3 = [v2 appCoordinator];

  return (ParkedCarActionDelegate *)v3;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2003 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  [(SearchViewController *)self endSearch];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    id v5 = [(ControlContaineeViewController *)self delegate];
    id v6 = [v5 currentViewController];
    id v7 = [v6 preferredPresentationStyle];

    if (v7 == (id)3)
    {
      id v8 = [(ControlContaineeViewController *)self delegate];
      id v9 = [(ControlContaineeViewController *)self delegate];
      id v10 = [v9 currentViewController];
      [v8 viewControllerGoPreviousState:v10 withSender:v4];
    }
  }
  self->_noTypingSent = 0;
  id v11 = +[MKMapService sharedService];
  [v11 captureUserAction:2001 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v12 = [(ControlContaineeViewController *)self delegate];
  id v13 = [v12 newTraits];
  int v14 = +[BrowseManager sharedManager];
  [v14 setTraits:v13];

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Search bar selected", buf, 2u);
  }

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  if ([v6 containeeLayout] == (id)1)
  {
  }
  else
  {
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    id v8 = [v7 containeeLayout];

    if (v8 != (id)2) {
      goto LABEL_7;
    }
  }
  id v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 wantsLayout:3];

LABEL_7:
  if (!self->_searchItem)
  {
    id v10 = objc_alloc_init(SearchFieldItem);
    searchItem = self->_searchItem;
    self->_searchItem = v10;
  }
  self->_hasEdited = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  _DWORD v21[2] = sub_100763E34;
  v21[3] = &unk_1012E5D08;
  v21[4] = self;
  id v12 = objc_retainBlock(v21);
  if (sub_1000BBB44(self) == 5)
  {
    ((void (*)(void *))v12[2])(v12);
  }
  else
  {
    id v13 = [(ContaineeViewController *)self cardPresentationController];
    [v13 applyWithAnimations:v12 completion:&stru_1012F79E0];
  }
  [(SearchViewController *)self updateDataSource];
  if (sub_1000BBB44(self) == 5)
  {
    int v14 = [v4 text];
    id v15 = [v14 length];

    if (v15)
    {
      id v16 = [(SearchViewController *)self currentDataSource];
      unsigned int v17 = [v16 conformsToProtocol:&OBJC_PROTOCOL___SearchDataProviding];

      if (v17)
      {
        id v18 = [(SearchViewController *)self currentDataSource];
        unsigned __int8 v19 = [v18 hasResults];

        if ((v19 & 1) == 0) {
          [(SearchViewController *)self _textFieldDidChange:0];
        }
      }
    }
  }
  double v20 = +[NSNotificationCenter defaultCenter];
  [v20 postNotificationName:@"SearchTextFieldDidBeginEditingNotification" object:self];
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(SearchViewController *)self setNeedsUpdateContentState];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"SearchTextFieldDidEndEditingNotification" object:self];
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing text field", v9, 2u);
  }

  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:2002 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  [(SearchViewController *)self clearRetainedSearchQuery];
  id v6 = [(SearchDataSource *)self->_searchDataSource searchDataProvider];
  [v6 clearMKLocalSearchCompleterQueryState];

  id v7 = [(ControlContaineeViewController *)self delegate];
  [v7 clearSearch];

  [(SearchDataSource *)self->_searchDataSource clearAutocompleteResults];
  if (sub_1000BBB44(self) != 5) {
    [(SearchViewController *)self searchBarBecomeFirstResponder];
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Keyboard search button pressed", v11, 2u);
  }

  id v6 = [v4 text];

  id v7 = [v6 _maps_stringByTrimmingLeadingWhitespace];
  id v8 = [v7 length];

  if (v8)
  {
    if (sub_1000BBB44(self) == 5)
    {
      id v9 = [(ControlContaineeViewController *)self delegate];
      [v9 clearSearchPins];
    }
    [(SearchViewController *)self sendSearchRequest];
    [(UITextField *)self->_searchField resignFirstResponder];
  }
  return v8 != 0;
}

- (void)_textFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(UITextField *)self->_searchField text];
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Processing autocomplete query: %@", (uint8_t *)&v14, 0xCu);
  }
  [(SearchViewController *)self _textFieldDidChange:v4 tappedQuerySuggestionCompletion:0];

  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  id v8 = [v7 currentInputMode];

  id v9 = [v8 identifier];
  id v10 = UIKeyboardInputModeGetBaseLanguage();
  unsigned int v11 = [v10 isEqualToString:@"ja"];

  if (v11)
  {
    id v12 = [(UITextField *)self->_searchField markedTextRange];

    if (!v12)
    {
      id v13 = +[MKMapService sharedService];
      [v13 captureUserAction:458 onTarget:127 eventValue:0];
    }
  }
}

- (void)_textFieldDidChange:(id)a3 tappedQuerySuggestionCompletion:(id)a4
{
  id v11 = a4;
  id v5 = [(UITextField *)self->_searchField text];
  id v6 = [v5 _maps_stringByTrimmingLeadingWhitespace];

  if ([v6 length] == (id)1
    && !self->_noTypingSent
    && self->_currentDataSource == &self->_searchHomeDataSource->super)
  {
    self->_noTypingSent = 1;
    [(SearchHomeDataSource *)self->_searchHomeDataSource sendNoTypingACAnalytics];
  }
  self->_hasEdited = 1;
  if ([v6 length]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong((id *)&self->_userTypedSearchString, v7);
  id v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v9 = [v6 stringByTrimmingCharactersInSet:v8];
  id v10 = [v9 length];

  if (!v10) {
    [(SearchViewController *)self clearRetainedSearchQuery];
  }
  [(SearchViewController *)self sendACRequestWithTappedQuerySuggestionCompletion:v11 retainQueryMetadata:0];
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5 = a4;
  [0 setDropPerformer:1];
  id v6 = [v5 dropSession];
  id v7 = [v6 localDragSession];

  id v8 = objc_alloc((Class)UITextDropProposal);
  if (v7)
  {
    id v9 = [v8 initWithDropOperation:0];
  }
  else
  {
    id v9 = [v8 initWithDropOperation:2];
    id v10 = [(SearchViewController *)self mapsDragDestinationHandler];
    id v11 = [v5 dropSession];
    [v10 beginDrop:v11];
  }

  return v9;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 bounds];
  double v10 = v9 + v8 * 0.5;
  double v13 = v12 + v11 * 0.5;
  id v15 = [(SearchViewController *)self mapsDragDestinationHandler];
  int v14 = [v6 dropSession];

  [v15 performDrop:v14 finishingAtLocation:v7 inView:v10];
}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = [(SearchViewController *)self mapsDragDestinationHandler];
  [v6 endDrop:v5];
}

- (void)selectNearbyCategoryAtIndex:(unint64_t)a3
{
  id v4 = [(SearchViewController *)self searchHomeDataSource];
  [v4 _ppt_selectCategoryAtIndex:a3];
}

- (void)refreshCurrentSearch
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v6 = [(SearchViewController *)self searchResultsViewController];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 refreshCurrentSearch];
        goto LABEL_7;
      }
    }
  }
  id v6 = [(ControlContaineeViewController *)self delegate];
  id v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 currentSearchSession];
  id v5 = [v4 searchFieldItem];
  [v6 viewController:self doSearchItem:v5 withUserInfo:&off_1013AED08];

LABEL_7:
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(SearchViewController *)self _contentAlphaForCurrentLayout];
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 1);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v3 scrollViewWillBeginDragging:a3];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)SearchViewController;
  [(ContaineeViewController *)&v9 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  if (y <= 0.0) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = 8;
  }
  double v8 = +[MKMapService sharedService];
  [v8 captureUserAction:v7 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (int)currentUITargetForAnalytics
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = 11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 8;
    }
    int v3 = 13;
  }
  if ([(SearchViewController *)self isSearchingAlongTheRoute]) {
    return 59;
  }
  else {
    return v3;
  }
}

- (void)_addRecentPlaceForSearchResult:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3)
  {
    double v8 = v3;
    unsigned __int8 v5 = [v3 isHomeOrWork];
    objc_super v4 = v8;
    if ((v5 & 1) == 0)
    {
      id v6 = [v8 mapItem];
      uint64_t v7 = [v8 searchToSupersedeIfRecordedInHistory];
      +[HistoryEntryRecentsItem saveMapItem:v6 superseedUUID:v7];

      objc_super v4 = v8;
    }
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  unsigned __int8 v5 = [a3 searchResult];
  if (v5)
  {
    id v6 = objc_alloc_init(SearchFieldItem);
    uint64_t v7 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v6 setSearchResult:v7];

    double v8 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v8 setSearchResult:v5];
    objc_super v9 = [DirectionItem alloc];
    v16[0] = v6;
    v16[1] = v8;
    double v10 = +[NSArray arrayWithObjects:v16 count:2];
    double v11 = [(DirectionItem *)v9 initWithItems:v10 transportType:0];

    CFStringRef v14 = @"DirectionsSessionInitiatorKey";
    id v15 = &off_1013A88F0;
    double v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    double v13 = [(ControlContaineeViewController *)self delegate];
    [v13 viewController:0 doDirectionItem:v11 withUserInfo:v12];

    [(SearchViewController *)self _addRecentPlaceForSearchResult:v5];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    unsigned __int8 v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:0 doAudioCallToSearchResult:v6];

    [(SearchViewController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    unsigned __int8 v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:0 openWebsiteForSearchResult:v6];

    [(SearchViewController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  unsigned __int8 v5 = [a3 searchResult];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 contactForSharingToMessages];
    double v8 = +[ShareItem shareItemWithSearchResult:v6 contact:v7 includePrintActivity:0];

    self->_maintainSearchStateWhenDisappearing = 1;
    objc_super v9 = [(ControlContaineeViewController *)self delegate];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100764CB4;
    v10[3] = &unk_1012E5D08;
    v10[4] = self;
    [v9 viewController:0 doShareSheetForShareItem:v8 completion:v10];

    [(SearchViewController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  unsigned __int8 v5 = [(SearchResultQuickActionMenuPresenter *)self->_quickActionMenuPresenter indexPath];
  if (v5)
  {
    id v10 = v5;
    id v6 = [(SearchViewController *)self currentDataSource];
    uint64_t v7 = [(SearchResultQuickActionMenuPresenter *)self->_quickActionMenuPresenter indexPath];
    double v8 = [v6 objectAtIndexPath:v7];

    objc_super v9 = [(SearchViewController *)self currentDataSource];
    [(SearchViewController *)self dataSource:v9 itemTapped:v8];

    unsigned __int8 v5 = v10;
  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4
{
  return 0;
}

- (int)uiTargetForQuickActionMenu
{
  return 2;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 newTraits];

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    unsigned __int8 v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:0 removeDroppedPin:v6];
  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5 = a4;
  id v6 = [(ControlContaineeViewController *)self delegate];
  uint64_t v7 = [v6 venuesManager];
  double v8 = [v5 mapItem];

  LOBYTE(v5) = [v7 isUserAtSameVenueAsMapItem:v8] ^ 1;
  return (char)v5;
}

- (int)currentMapViewTargetForAnalytics
{
  id v3 = [(SearchViewController *)self searchResultsViewController];
  unsigned int v4 = [(SearchViewController *)self isShowingOmnipresentSearchBar];
  int v5 = 502;
  if (v4 && v3 && sub_1000BBF90((uint64_t)v3, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    id v6 = v3;
    if (objc_opt_respondsToSelector()) {
      int v5 = [v6 currentMapViewTargetForAnalytics];
    }
  }
  return v5;
}

- (UIScrollView)scrollViewForProactive
{
  return [(HomeViewController *)self->_homeViewController scrollView];
}

- (void)macMenuPresentationControllerWillDismiss:(id)a3
{
}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100765064;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  +[UIView animateWithDuration:v7 animations:0.25];
  unsigned int v4 = [(SearchViewController *)self homeActionCoordinator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(SearchViewController *)self homeActionCoordinator];
    [v6 makeMapViewFirstResponder];
  }
  [(SearchViewController *)self updateDataSource];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  if ([(SearchViewController *)self isSearchingAlongTheRoute])
  {
    int v5 = [(SearchViewController *)self navContaineeDelegate];
    [v5 dismissAddStop];

    id v6 = +[MKMapService sharedService];
    [v6 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
  uint64_t v7 = [(SearchViewController *)self browseModeHeaderView];
  unsigned __int8 v8 = [v7 isHidden];

  if ((v8 & 1) == 0)
  {
    [(SearchViewController *)self endSearch];
    [(SearchViewController *)self _shouldHideOfflineHeaderView:1];
  }
}

- (UIScrollView)pptTestScrollView
{
  id v3 = [(SearchViewController *)self searchResultsViewController];
  if ([(SearchViewController *)self isShowingOmnipresentSearchBar] && v3)
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      int v5 = [v4 pptTestScrollView];

      goto LABEL_14;
    }
  }
  if (self->_currentDataSource)
  {
    int v5 = [(SearchViewController *)self currentDataSource];
    id v6 = [v5 presentationStyle];

    if (v6 == (id)1)
    {
      uint64_t v7 = 216;
    }
    else
    {
      if (v6) {
        goto LABEL_14;
      }
      uint64_t v7 = 208;
    }
    id v8 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v7);
  }
  else
  {
    id v8 = [(HomeViewController *)self->_homeViewController scrollView];
  }
  int v5 = v8;
LABEL_14:

  return (UIScrollView *)v5;
}

- (void)pptSearchBarShouldProvideTextChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_textFieldDidChange:" name:@"PPTShouldSendTextChangeNotification" object:self->_searchField];
}

- (void)pptSetSearchDataSource
{
  id v3 = [(SearchViewController *)self searchDataSource];
  [(SearchViewController *)self setCurrentDataSource:v3];
}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2 = [(SearchViewController *)self searchHomeDataSource];
  [v2 _ppt_selectSeeAllCuratedCollections];
}

- (void)pptSelectFirstGuidePublisher
{
  id v2 = [(SearchViewController *)self searchHomeDataSource];
  [v2 _ppt_selectFirstGuidePublisher];
}

- (void)pptSelectFirstCuratedCollection
{
  id v2 = [(SearchViewController *)self searchHomeDataSource];
  [v2 _ppt_selectFirstCuratedGuide];
}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  id v21 = a3;
  id v3 = [(SearchViewController *)self currentDataSource];
  id v4 = [v3 objectsForAnalytics];
  int v5 = [v4 firstObject];
  id v6 = [v5 items];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v13 = [v12 autocompleteObject];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v14 = [v13 mapItem];
            if (v14)
            {
              id v15 = (void *)v14;
              id v16 = [v13 mapItem];
              unsigned int v17 = [v16 _shortAddress];
              unsigned int v22 = [v17 isEqualToString:v21];

              if (v22)
              {
                id v18 = sub_100109E50();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  id v28 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "PPT: Found map item matching address: %@", buf, 0xCu);
                }

                [(SearchViewController *)self dataSource:self->_searchDataSource itemTapped:v13];
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
          double v13 = 0;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)didStartDownloadFromAutocomplete
{
  if (self->_downloadedSearchResult)
  {
    [(SearchViewController *)self endSearch];
    id v3 = [(ControlContaineeViewController *)self delegate];
    [v3 viewController:self selectSearchResult:self->_downloadedSearchResult addToHistory:1 source:2 saveSelectionState:1 replaceCurrentCard:1];

    downloadedSearchResult = self->_downloadedSearchResult;
    self->_downloadedSearchResult = 0;
  }
  else
  {
    int v5 = sub_100109E50();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
    }
  }
}

- (BOOL)supportsFullTextSearch
{
  id v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  return v4 && self->_supportsFullTextSearch;
}

- (BOOL)shouldShowSearchOverlay
{
  if (self->_didTriggerAutoRedoSearch)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    unsigned int v4 = [(ControlContaineeViewController *)self delegate];
    int v5 = [v4 currentSearchSession];
    id v6 = [v5 searchInfo];

    if (v6
      && ([v6 searchRedoButtonThreshold],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = [(SearchViewController *)self localSearchViewController];
      id v9 = [v8 refreshSearchHereBusinessController];
      unsigned int v10 = [v9 shouldShowManualRedoButton];

      unsigned int v2 = v10 & [v6 shouldAllowManualRedoButton];
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (NavActionCoordination)navContaineeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navContaineeDelegate);

  return (NavActionCoordination *)WeakRetained;
}

- (void)setNavContaineeDelegate:(id)a3
{
}

- (PersonalizedItemManager)personalizedItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personalizedItemManager);

  return (PersonalizedItemManager *)WeakRetained;
}

- (BOOL)maintainSearchStateWhenDisappearing
{
  return self->_maintainSearchStateWhenDisappearing;
}

- (void)setMaintainSearchStateWhenDisappearing:(BOOL)a3
{
  self->_maintainSearchStateWhenDisappearing = a3;
}

- (void)setSearchingAlongTheRoute:(BOOL)a3
{
  self->_searchingAlongTheRoute = a3;
}

- (void)setMenuController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_destroyWeak((id *)&self->_personalizedItemManager);
  objc_storeStrong((id *)&self->_closeSearchResultsButton, 0);
  objc_destroyWeak((id *)&self->_navContaineeDelegate);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_downloadedSearchResult, 0);
  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
  objc_storeStrong((id *)&self->_offlineBrowseHeaderView, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsLoadingSearchQueue, 0);
  objc_storeStrong((id *)&self->_placeholderQueue, 0);
  objc_storeStrong((id *)&self->_mapServiceTicket, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_retainedQueryController, 0);
  objc_storeStrong((id *)&self->_bottomHideableFooterConstraint, 0);
  objc_storeStrong((id *)&self->_bottomHeaderHairline, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
  objc_storeStrong((id *)&self->_searchFieldLayoutGuide, 0);
  objc_storeStrong((id *)&self->_dropDownView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_homeViewControllerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_homeViewController, 0);
  objc_storeStrong((id *)&self->_searchItem, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_searchHomeDataSource, 0);
  objc_storeStrong((id *)&self->_userProfileButton, 0);
  objc_storeStrong((id *)&self->_userTypedSearchString, 0);
  objc_storeStrong((id *)&self->_searchField, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

- (void)endSearchForTesting
{
  [(SearchViewController *)self endSearch];
  id v3 = [(SearchViewController *)self searchBar];
  [v3 setText:&stru_101324E70];
}

- (void)displaySearchResultsWithViewController:(id)a3 searchBar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MapsOfflineUIHelper sharedHelper];
  if ([v8 isUsingOfflineMaps]
    && ![(SearchViewController *)self supportsFullTextSearch])
  {
    uint64_t IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery();
  }
  else
  {
    uint64_t IsEnabled_SearchAndDiscovery = 0;
  }

  unsigned int v10 = [(SearchViewController *)self closeSearchResultsButton];
  [v10 setHidden:IsEnabled_SearchAndDiscovery];

  double v11 = [(SearchViewController *)self searchResultsViewController];

  if (!v11)
  {
    double v12 = [v6 view];
    [v12 removeFromSuperview];

    [(SearchViewController *)self addChildViewController:v6];
    double v13 = [(SearchViewController *)self view];
    uint64_t v14 = [v6 view];
    [v13 addSubview:v14];

    [v6 didMoveToParentViewController:self];
    id v15 = [v6 view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [v6 view];
    v37 = [v39 leadingAnchor];
    v38 = [(ContaineeViewController *)self contentView];
    unsigned int v36 = [v38 leadingAnchor];
    id v35 = [v37 constraintEqualToAnchor:v36];
    v40[0] = v35;
    id v34 = [v6 view];
    v32 = [v34 trailingAnchor];
    BOOL v33 = [(ContaineeViewController *)self contentView];
    __int16 v31 = [v33 trailingAnchor];
    unsigned __int8 v30 = [v32 constraintEqualToAnchor:v31];
    v40[1] = v30;
    int v29 = [v6 view];
    id v28 = [v29 topAnchor];
    double v27 = [v7 bottomAnchor];
    id v16 = [v28 constraintEqualToAnchor:v27];
    v40[2] = v16;
    unsigned int v17 = [v6 view];
    id v18 = [v17 bottomAnchor];
    unsigned __int8 v19 = [(ContaineeViewController *)self contentView];
    double v20 = [v19 bottomAnchor];
    id v21 = [v18 constraintEqualToAnchor:v20];
    v40[3] = v21;
    unsigned int v22 = +[NSArray arrayWithObjects:v40 count:4];
    +[NSLayoutConstraint activateConstraints:v22];
  }
  long long v23 = [(ContaineeViewController *)self cardPresentationController];
  id v24 = [v23 containeeLayout];

  if (v24 == (id)3)
  {
    long long v25 = [(ContaineeViewController *)self cardPresentationController];
    [v25 wantsLayout:2 animated:1];
  }
  long long v26 = [(ContaineeViewController *)self cardPresentationController];
  [v26 updateHeightForCurrentLayout];

  [v7 setShowsCancelButton:0 animated:1];
}

- (void)updateCloseSearchResultEntryPointButton:(id)a3 searchBarToButtonSpacing:(double)a4 userButtonWidth:(double)a5
{
  id v15 = a3;
  if (sub_1000BBB44(self) != 5 && ![(SearchViewController *)self isSearchingAlongTheRoute])
  {
    id v8 = [(SearchViewController *)self view];
    id v9 = [v8 effectiveUserInterfaceLayoutDirection];

    unsigned int v10 = [(SearchViewController *)self closeSearchResultsButton];
    unsigned int v11 = [v10 isHidden];

    if (v9 == (id)1) {
      double v12 = a5 + a4 * 2.0;
    }
    else {
      double v12 = 16.0;
    }
    if (v9 == (id)1) {
      int v13 = 1;
    }
    else {
      int v13 = v11;
    }
    if (v11) {
      double v12 = 16.0;
    }
    if (v13) {
      double v14 = 16.0;
    }
    else {
      double v14 = a5 + a4 * 2.0;
    }
    [v15 setContentInset:17.0 v12, 17.0, v14];
  }
}

- (void)closeSearchResultsButtonAction:(id)a3
{
  unsigned int v4 = [(SearchViewController *)self searchResultsViewController];
  if (v4)
  {
    +[SearchResultsAnalyticsManager logCloseSearchResults];
    [v4 willMoveToParentViewController:0];
    int v5 = [v4 view];
    [v5 removeFromSuperview];

    [v4 removeFromParentViewController];
    id v6 = [(SearchViewController *)self closeSearchResultsButton];
    [v6 setHidden:1];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100BDF994;
    v11[3] = &unk_1012E5D08;
    v11[4] = self;
    id v7 = objc_retainBlock(v11);
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 applyWithAnimations:v7 completion:&stru_10131AC68];
  }
  else
  {
    id v9 = sub_100109E50();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to close search results when they were not present.", v10, 2u);
    }
  }
}

@end