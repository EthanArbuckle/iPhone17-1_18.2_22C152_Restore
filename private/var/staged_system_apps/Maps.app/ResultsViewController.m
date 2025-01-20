@interface ResultsViewController
+ (BOOL)isReloadingRefinementsWithSearchSession:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)hasResults;
- (BOOL)hideHeader;
- (BOOL)isPresentingAddStopResultsFromWaypointEditor;
- (BOOL)isShowingOmnipresentSearchBar;
- (BOOL)isWaitingForResults;
- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4;
- (BOOL)shouldShowSearchOverlay;
- (GEOLocation)currentLocation;
- (NSArray)resultsList;
- (NSDictionary)searchResultCountInVenue;
- (NSNumber)refinementsSelectionSequenceNumber;
- (ResultsViewControllerDelegate)resultsDelegate;
- (SearchSession)searchSession;
- (UIScrollView)pptTestScrollView;
- (VKVenueFeatureMarker)venueWithFocus;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentTableView;
- (id)errorModeView;
- (id)impressionsCalculator;
- (id)loadingModeView;
- (id)loadingString;
- (id)localSearchViewController;
- (id)mapServiceTraitsForQuickActionPresenter:(id)a3;
- (id)noResultString;
- (id)originalSearchInfo;
- (id)refineSearchText;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)listForDataSource:(id)a3;
- (int)refineSearchSessionType;
- (int)uiTargetForQuickActionMenu;
- (int64_t)floatingControlsOptions;
- (unint64_t)containeeLayout;
- (unint64_t)preferredPresentationStyle;
- (void)_hideSearchHereControl;
- (void)_localSearchViewControllerDidChange:(id)a3;
- (void)_searchWithSuggestion:(id)a3;
- (void)_showOfflineErrorView;
- (void)_updateLoadingErrorFrames;
- (void)_updateResultRefinementBarFromSearchInfo:(id)a3;
- (void)allRefinementsApplyViewModel:(id)a3 selectionSequenceNumber:(id)a4;
- (void)applyAlphaToContent:(double)a3;
- (void)configureHeader;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didBecomeCurrent;
- (void)didCachePlaceSummaryTemplates;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didResignCurrent;
- (void)didTapOnAddAPlace;
- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4;
- (void)didTapOnCallWithSearchResult:(id)a3;
- (void)didTapOnContainmentParentMapItem:(id)a3;
- (void)didTapOnCuratedGuide:(id)a3;
- (void)didTapOnCuratedGuides:(id)a3;
- (void)didTapOnDirectionsWithSearchResult:(id)a3;
- (void)didTapOnFlyoverWithSearchResult:(id)a3;
- (void)didTapOnLookAroundWithSearchResult:(id)a3;
- (void)didTapOnTappableEntry:(id)a3;
- (void)didTapOnUserGeneratedGuide:(id)a3;
- (void)didTapOnUserLibraryMapItem:(id)a3;
- (void)didTapOnWebsiteWithSearchResult:(id)a3;
- (void)editSearchButtonTapped;
- (void)handleDismissAction:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)increasResultRefinementsSelectionSequenceNumber;
- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3;
- (void)localSearchViewControllerSizeDidChange:(id)a3;
- (void)localSearchViewShouldBeVisibleDidChange:(id)a3;
- (void)logNoSearchResult;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4;
- (void)refreshCurrentSearch;
- (void)refreshEVChargers:(id)a3;
- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4;
- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3;
- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3;
- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3;
- (void)resetRefinementsSequenceNumber;
- (void)resultRefinementsBarApplyMultiSelectViewModel:(id)a3 atIndex:(id)a4;
- (void)resultRefinementsBarApplyOpenOptionViewModel:(id)a3 atIndex:(id)a4;
- (void)resultRefinementsBarDidTapOnMultiSelect:(id)a3 tappedAtIndex:(int64_t)a4;
- (void)resultRefinementsBarDidTapOnOpenOptions:(id)a3 tappedAtIndex:(int64_t)a4;
- (void)resultRefinementsBarDidTapOnSeeAllRefinements:(id)a3;
- (void)resultRefinementsBarDidTapOnToggle:(id)a3 isSelected:(BOOL)a4;
- (void)resultRefinementsBarDidUpdateViewModel:(id)a3;
- (void)routeToCuratedCollection:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4;
- (void)searchDidCancel:(BOOL)a3;
- (void)setContaineeLayout:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setHeaderContentWithSearchSession:(id)a3;
- (void)setHideHeader:(BOOL)a3;
- (void)setHideRefinementsBar:(BOOL)a3;
- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3;
- (void)setRefinementsSelectionSequenceNumber:(id)a3;
- (void)setResultsDelegate:(id)a3;
- (void)setResultsList:(id)a3;
- (void)setSearchSession:(id)a3;
- (void)setupConstraints;
- (void)showError:(id)a3;
- (void)showError:(id)a3 hideRefinementsBar:(BOOL)a4;
- (void)showSearchingHereIfNeeded:(BOOL)a3;
- (void)updateLocalSearchViewInsets;
- (void)updateSearchSession;
- (void)updateTheme;
- (void)viewControllerDidSelectBrowseVenue:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waitingData;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation ResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateTheme
{
  contentTableView = self->_contentTableView;
  id v4 = [(ResultsViewController *)self theme];
  v3 = [v4 hairlineColor];
  [(UITableView *)contentTableView setSeparatorColor:v3];
}

- (BOOL)hasResults
{
  v2 = [(ResultsViewController *)self searchSession];
  v3 = [v2 currentResults];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)refreshCurrentSearch
{
  v3 = [(ResultsViewController *)self searchSession];
  BOOL v4 = [v3 searchFieldItem];

  v5 = [(ResultsViewController *)self originalSearchInfo];
  v6 = +[NSMutableDictionary dictionaryWithDictionary:&off_1013AEE48];
  if ([(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor])
  {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"kAddStopFromWaypointEditor"];
  }
  v7 = [v5 resultRefinementGroup];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    [v8 setResultRefinementOriginType:self->_lastRefinementOriginType];
    v9 = [v5 resultRefinementGroup];
    v10 = [v9 refinementSessionState];
    [v8 setRefinementSessionState:v10];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = [v5 resultRefinementGroup];
    v12 = [v11 resultRefinementBar];
    v13 = [v12 resultRefinements];

    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v17) convertToGEOPDResultRefinement];
          [v8 addRefinement:v18];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = [v5 resultRefinementGroup];
    v20 = [v19 resultRefinementView];
    v21 = [v20 sections];

    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v25) convertToGEOPDResultRefinementSection];
          [v8 addRefinementSection:v26];

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v23);
    }

    v27 = [(ControlContaineeViewController *)self delegate];
    [v27 viewController:self doSearchItem:v4 withUserInfo:v6 refinementsQuery:v8];
  }
  else
  {
    id v8 = [(ControlContaineeViewController *)self delegate];
    [v8 viewController:self doSearchItem:v4 withUserInfo:v6];
  }
}

- (BOOL)shouldShowSearchOverlay
{
  if (!MapsFeature_IsEnabled_SearchAndDiscovery()) {
    return self->_hasViewAppeared;
  }

  return [(ResultsViewController *)self hasResults];
}

- (id)loadingModeView
{
  loadingModeView = self->_loadingModeView;
  if (!loadingModeView)
  {
    BOOL v4 = [LoadingModeView alloc];
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
    v7 = [(LoadingModeView *)v4 initWithTitle:v6];
    id v8 = self->_loadingModeView;
    self->_loadingModeView = v7;

    loadingModeView = self->_loadingModeView;
  }

  return loadingModeView;
}

- (id)errorModeView
{
  errorModeView = self->_errorModeView;
  if (!errorModeView)
  {
    BOOL v4 = objc_alloc_init(ErrorModeView);
    v5 = self->_errorModeView;
    self->_errorModeView = v4;

    [(ErrorModeView *)self->_errorModeView setSpacing:0.0];
    errorModeView = self->_errorModeView;
  }

  return errorModeView;
}

- (id)contentTableView
{
  contentTableView = self->_contentTableView;
  if (!contentTableView)
  {
    BOOL v4 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentTableView;
    self->_contentTableView = &v4->super;

    [(UITableView *)self->_contentTableView setAccessibilityIdentifier:@"ResultsViewTable"];
    [(UITableView *)self->_contentTableView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[UIColor clearColor];
    [(UITableView *)self->_contentTableView setBackgroundColor:v6];

    v7 = +[UIColor clearColor];
    [(UITableView *)self->_contentTableView setSectionIndexBackgroundColor:v7];

    [(UITableView *)self->_contentTableView _setHeaderAndFooterViewsFloat:0];
    [(UITableView *)self->_contentTableView setSectionHeaderTopPadding:0.0];
    [(UITableView *)self->_contentTableView setPreservesSuperviewLayoutMargins:1];
    contentTableView = self->_contentTableView;
  }

  return contentTableView;
}

- (id)localSearchViewController
{
  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    BOOL v4 = [[LocalSearchViewController alloc] initAsButton:0];
    v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    v6 = [(LocalSearchViewController *)self->_localSearchViewController view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(ContaineeViewController *)self cardPresentationController];
    -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", [v7 containerStyle] != (id)6);

    [(LocalSearchViewController *)self->_localSearchViewController setDelegate:self];
    localSearchViewController = self->_localSearchViewController;
  }

  return localSearchViewController;
}

- (id)noResultString
{
  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      v3 = +[NSBundle mainBundle];
      BOOL v4 = v3;
      CFStringRef v5 = @"no_result_key";
      goto LABEL_6;
    case 1:
      switch(MGGetSInt32Answer())
      {
        case 1u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_AirplaneMode_iPhone";
          break;
        case 2u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_AirplaneMode_iPod";
          break;
        case 3u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_AirplaneMode_iPad";
          break;
        case 6u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_AirplaneMode_Watch";
          break;
        default:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_AirplaneMode_Device";
          break;
      }
      goto LABEL_6;
    case 2:
      v3 = +[NSBundle mainBundle];
      BOOL v4 = v3;
      CFStringRef v5 = @"NoSearchResults_CellDataDisabled";
      goto LABEL_6;
    case 3:
      switch(MGGetSInt32Answer())
      {
        case 1u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_iPhone";
          break;
        case 2u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_iPod";
          break;
        case 3u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_iPad";
          break;
        case 6u:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_Watch";
          break;
        default:
          v3 = +[NSBundle mainBundle];
          BOOL v4 = v3;
          CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_Device";
          break;
      }
LABEL_6:
      v2 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v2;
}

- (SearchSession)searchSession
{
  v3 = [(ControlContaineeViewController *)self delegate];
  searchSession = [v3 currentSearchSession];
  CFStringRef v5 = searchSession;
  if (!searchSession) {
    searchSession = self->_searchSession;
  }
  v6 = searchSession;

  return v6;
}

- (void)setSearchSession:(id)a3
{
  CFStringRef v5 = (SearchSession *)a3;
  if (self->_searchSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchSession, a3);
    [(ResultsViewController *)self updateSearchSession];
    CFStringRef v5 = v6;
  }
}

- (id)originalSearchInfo
{
  v2 = [(ResultsViewController *)self searchSession];
  v3 = [v2 searchInfo];

  return v3;
}

- (void)refreshEVChargers:(id)a3
{
  searchResultsDataSource = self->_searchResultsDataSource;
  if (searchResultsDataSource) {
    [(SearchResultsDataSource *)searchResultsDataSource refreshEVChargers:a3];
  }
}

- (void)updateSearchSession
{
  id v42 = [(ResultsViewController *)self searchSession];
  v3 = [(ResultsViewController *)self originalSearchInfo];
  BOOL v4 = [v42 lastError];
  CFStringRef v5 = [(ResultsViewController *)self localSearchViewController];
  v6 = [v5 refreshSearchHereBusinessController];
  [v6 setSearchSession:v42];

  v7 = [(ResultsViewController *)self view];

  if (!v7) {
    goto LABEL_41;
  }
  unsigned int v8 = [(ResultsViewController *)self isWaitingForResults];
  unsigned int v9 = [v42 isResultRefinementsBarSearch] ^ 1;
  uint64_t v10 = v9 & v8;
  if ((v9 & 1) == 0)
  {
    v11 = v42;
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v10 = [(id)objc_opt_class() isReloadingRefinementsWithSearchSession:v42] ^ 1;
  }
  v11 = v42;
LABEL_6:
  if ([v11 isSpotlightPunchInSearch])
  {
    [(ResultsViewController *)self setHideHeader:1];
  }
  else
  {
    [(ResultsViewController *)self setHideHeader:v10];
    [(ResultsViewController *)self setHeaderContentWithSearchSession:v42];
  }
  unsigned int v12 = [(ResultsViewController *)self isWaitingForResults];
  unsigned int v13 = [v42 isResultRefinementsBarSearch];
  if (v12)
  {
    if (v13)
    {
      id v14 = [(RefinementsBarUIView *)self->_refinementsBar viewModel];
      [v14 setTapInteractionEnabled:0];
    }
    [(ResultsViewController *)self waitingData];
    goto LABEL_42;
  }
  if (v13)
  {
    id v15 = [(RefinementsBarUIView *)self->_refinementsBar viewModel];
    [v15 setTapInteractionEnabled:1];
  }
  if (!v4
    || [v42 isRedoOrAutoRedoSearchType]
    && ([v42 currentResults],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [v16 count],
        v16,
        v17))
  {
    if (!v3)
    {
      [(ResultsViewController *)self setResultsList:0];
LABEL_41:
      [(ResultsViewController *)self logNoSearchResult];
      goto LABEL_42;
    }
    if ([v3 searchResultType] == 1)
    {
      if (![v42 isSpotlightPunchInSearch]
        || ([v42 spotlightMatchingResultFound] & 1) == 0)
      {
        v18 = [v42 currentResults];
        [(ResultsViewController *)self setResultsList:v18];
      }
      v19 = [v3 results];
      id v20 = [v19 count];

      if (v20) {
        goto LABEL_41;
      }
    }
    else
    {
      if ([v3 searchResultType] != 2)
      {
        if ([v3 searchResultType] == 3)
        {
          v37 = [v42 currentResults];
          [(ResultsViewController *)self setResultsList:v37];
        }
        else
        {
          if ([v3 searchResultType] != 4) {
            goto LABEL_41;
          }
          v39 = [v42 currentResults];
          [(ResultsViewController *)self setResultsList:v39];

          v40 = [v3 results];
          id v41 = [v40 count];

          if (v41) {
            goto LABEL_41;
          }
          v37 = [(ResultsViewController *)self noResultString];
          [(ResultsViewController *)self showError:v37 hideRefinementsBar:0];
        }
        goto LABEL_40;
      }
      [(ResultsViewController *)self setResultsList:0];
    }
    long long v34 = [v3 resultDisplayHeader];
    long long v35 = v34;
    if (v34)
    {
      id v36 = v34;
    }
    else
    {
      id v36 = [(ResultsViewController *)self noResultString];
    }
    v37 = v36;

    v38 = [v3 resultDisplayHeader];
    [(ResultsViewController *)self showError:v37 hideRefinementsBar:v38 != 0];

LABEL_40:
    goto LABEL_41;
  }
  v21 = [(ResultsViewController *)self noResultString];
  id v22 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v23 = [v22 isUsingOfflineMaps];

  if (v23)
  {
    [(ResultsViewController *)self _showOfflineErrorView];
  }
  else
  {
    uint64_t v24 = [(ResultsViewController *)self searchSession];
    v25 = [v24 lastError];
    v26 = [v25 domain];
    unsigned int v27 = [v26 isEqualToString:@"SearchFindMy"];

    if (v27)
    {
      long long v28 = +[NSBundle mainBundle];
      long long v29 = [v28 localizedStringForKey:@"[Location Update] Unable to Refresh for person" value:@"localized string not found" table:0];

      long long v30 = [(ResultsViewController *)self searchSession];
      long long v31 = [v30 searchFieldItem];
      long long v32 = [v31 title];
      uint64_t v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v32);

      [(ResultsViewController *)self setHideHeader:1];
      v21 = (void *)v33;
    }
    [(ResultsViewController *)self showError:v21 hideRefinementsBar:0];
    [(LoadingModeView *)self->_loadingModeView setHidden:1];
    [(ResultsViewController *)self _updateResultRefinementBarFromSearchInfo:v3];
  }
  [(ResultsViewController *)self logNoSearchResult];

LABEL_42:
}

- (void)logNoSearchResult
{
  id v7 = [(ResultsViewController *)self searchSession];
  if ([v7 isLoading])
  {
  }
  else
  {
    v3 = [(ResultsViewController *)self searchSession];
    BOOL v4 = [v3 currentResults];
    id v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = [(ResultsViewController *)self currentUITargetForAnalytics];
      +[SearchResultsAnalyticsManager logNoSearchResults:v6];
    }
  }
}

- (void)setResultsList:(id)a3
{
  p_resultsList = (id *)&self->_resultsList;
  id v38 = a3;
  if (*p_resultsList != v38)
  {
    self->_didTriggerAutoRedoSearch = 0;
    objc_storeStrong((id *)&self->_resultsList, a3);
    if (![(ResultsViewController *)self isShowingOmnipresentSearchBar]) {
      [(ResultsViewController *)self setHideHeader:0];
    }
    uint64_t v6 = +[NSUUID UUID];
    id v7 = [(ResultsViewController *)self impressionsCalculator];
    [v7 setSessionIdentifier:v6];

    unsigned int v8 = [(ResultsViewController *)self view];

    if (v8)
    {
      unsigned int v9 = [(ResultsViewController *)self searchSession];
      uint64_t v10 = [v9 currentResultsSearchInfo];
      v11 = [v10 searchText];
      if (v11)
      {
        p_searchResultsDataSource = &self->_searchResultsDataSource;
        [(SearchResultsDataSource *)self->_searchResultsDataSource setSearchQuery:v11];
      }
      else
      {
        unsigned int v13 = [v10 searchFieldItem];
        id v14 = [v13 title];
        p_searchResultsDataSource = &self->_searchResultsDataSource;
        [(SearchResultsDataSource *)self->_searchResultsDataSource setSearchQuery:v14];
      }
      -[SearchResultsDataSource setDisplaysAsChainResult:](*p_searchResultsDataSource, "setDisplaysAsChainResult:", [v10 isChainResults]);
      -[SearchResultsDataSource setPrefersAddressOverCategory:](*p_searchResultsDataSource, "setPrefersAddressOverCategory:", [v10 prefersAddressOverCategory]);
      id v15 = [v10 searchFieldItem];
      uint64_t v16 = [v15 searchCategory];
      [(SearchResultsDataSource *)*p_searchResultsDataSource setSearchCategory:v16];

      id v17 = [v10 placeSummaryMetadata];
      [(SearchResultsDataSource *)*p_searchResultsDataSource setPlaceSummaryMetadata:v17];

      -[SearchResultsDataSource setEnableStructuredRAPAffordance:](*p_searchResultsDataSource, "setEnableStructuredRAPAffordance:", [v10 enableStructuredRAPAffordance]);
      [(SearchResultsDataSource *)*p_searchResultsDataSource setIsPresentingAddStopResultsFromWaypointEditor:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
      v18 = [(ResultsViewController *)self impressionsCalculator];
      v19 = [v18 sessionIdentifier];
      [(SearchResultsDataSource *)*p_searchResultsDataSource setImpressionsSessionIdentifier:v19];

      if ([v10 sortOrder] == (id)1)
      {
        id v20 = [[AlphabeticallyOrderedDataSource alloc] initWithAlphabeticallySortableObject:v38];
        v21 = [(AlphabeticallyOrderedDataSource *)v20 sectionIndexTitles];
        [(SearchResultsDataSource *)*p_searchResultsDataSource setSectionIndexTitles:v21];
      }
      else
      {
        id v22 = [v10 searchSectionList];
        if (v22)
        {
          id v23 = *p_resultsList;

          if (v23)
          {
            uint64_t v24 = [SearchListOrderedDataSource alloc];
            id v25 = *p_resultsList;
            v26 = [v10 searchSectionList];
            id v20 = [(SearchListOrderedDataSource *)v24 initWithObjects:v25 searchSectionList:v26];

            [(SearchResultsDataSource *)*p_searchResultsDataSource setSectionIndexTitles:0];
            unsigned int v27 = [[SearchResultsDataSourceContent alloc] initWithOrderedDataSource:v20];
            long long v28 = *p_searchResultsDataSource;
            long long v29 = [v10 openAt];
            [(SearchResultsDataSource *)v28 setContent:v27 openAt:v29];

            goto LABEL_18;
          }
        }
        long long v30 = [IdenticallyOrderedDataSource alloc];
        if (*p_resultsList) {
          id v31 = *p_resultsList;
        }
        else {
          id v31 = &__NSArray0__struct;
        }
        id v20 = [(IdenticallyOrderedDataSource *)v30 initWithObjects:v31];
        [(SearchResultsDataSource *)*p_searchResultsDataSource setSectionIndexTitles:0];
      }
      unsigned int v27 = [[SearchResultsDataSourceContent alloc] initWithOrderedDataSource:v20];
      [(SearchResultsDataSource *)*p_searchResultsDataSource setContent:v27];
LABEL_18:

      long long v32 = [(ControlContaineeViewController *)self delegate];
      uint64_t v33 = [v32 venuesManager];
      [v33 venuesControlCoordinatingDidChangeSearchResultCount:self];

      long long v34 = [(ControlContaineeViewController *)self delegate];
      long long v35 = [v34 venuesManager];
      [v35 updateFocusedVenueFloor];

      [(LoadingModeView *)self->_loadingModeView setHidden:1];
      if (*p_resultsList)
      {
        if ([*p_resultsList count]
          || ([v10 suggestions],
              id v36 = objc_claimAutoreleasedReturnValue(),
              id v37 = [v36 count],
              v36,
              v37))
        {
          [(ResultsViewController *)self showError:0];
          [(UITableView *)self->_contentTableView setHidden:0];
        }
      }
      [(ResultsViewController *)self _updateResultRefinementBarFromSearchInfo:v10];
    }
  }
}

- (void)setDataSource:(id)a3
{
  id v5 = (DataSource *)a3;
  currentDataSource = self->_currentDataSource;
  if (currentDataSource != v5)
  {
    unsigned int v13 = v5;
    [currentDataSource setActive:0];
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    [(UITableView *)self->_contentTableView setDelegate:v13];
    [(UITableView *)self->_contentTableView setDataSource:v13];
    id v7 = +[MapsDragAndDropManager sharedManager];
    unsigned int v8 = [v7 deviceSupportsDragAndDrop];

    if (v8) {
      [(UITableView *)self->_contentTableView setDragDelegate:v13];
    }
    [self->_currentDataSource setActive:1];
    [(UITableView *)self->_contentTableView reloadData];
    unsigned int v9 = [(ControlContaineeViewController *)self delegate];
    uint64_t v10 = [v9 venuesManager];
    [v10 venuesControlCoordinatingDidChangeSearchResultCount:self];

    v11 = [(ControlContaineeViewController *)self delegate];
    unsigned int v12 = [v11 venuesManager];
    [v12 updateFocusedVenueFloor];

    id v5 = v13;
  }
}

- (void)showError:(id)a3
{
  [(ResultsViewController *)self showError:a3 hideRefinementsBar:a3 != 0];
}

- (void)_showOfflineErrorView
{
  v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"No results found in your offline map. Connect to the internet for more search results." value:@"localized string not found" table:@"Offline"];

  id v5 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v6 = [v5 isUsingForcedOfflineMaps];

  id v7 = +[NSBundle mainBundle];
  unsigned int v8 = v7;
  if (v6) {
    CFStringRef v9 = @"Using Offline Maps";
  }
  else {
    CFStringRef v9 = @"You’re Offline";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:@"Offline"];

  [(ResultsViewController *)self showError:v4 hideRefinementsBar:0];
  [(ErrorModeView *)self->_errorModeView setTitle:v10 andMessage:v4];
  [(ErrorModeView *)self->_errorModeView insertErrorIcon:@"icloud.slash" atIndex:0];
  if (v6)
  {
    v11 = +[NSBundle mainBundle];
    unsigned int v12 = [v11 localizedStringForKey:@"Turn Off" value:@"localized string not found" table:@"Offline"];

    objc_initWeak(&location, self);
    errorModeView = self->_errorModeView;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100B5125C;
    v14[3] = &unk_1012EE310;
    objc_copyWeak(&v15, &location);
    [(ErrorModeView *)errorModeView setButtonTitle:v12 handler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)showError:(id)a3 hideRefinementsBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(UITableView *)self->_contentTableView setHidden:1];
    [(LoadingModeView *)self->_loadingModeView setHidden:1];
    if (v4) {
      [(ResultsViewController *)self setHideRefinementsBar:1];
    }
    id v7 = [(ResultsViewController *)self view];
    unsigned int v8 = [(ResultsViewController *)self errorModeView];
    CFStringRef v9 = [(ContaineeViewController *)self headerView];
    [v7 insertSubview:v8 belowSubview:v9];

    [(ResultsViewController *)self _updateLoadingErrorFrames];
    [(ErrorModeView *)self->_errorModeView setTitle:v6 andMessage:0];
    uint64_t v10 = [(ResultsViewController *)self searchSession];
    v11 = [v10 currentResultsSearchInfo];
    LODWORD(v9) = [v11 enableStructuredRAPAffordance];

    if (v9)
    {
      objc_initWeak(&location, self);
      errorModeView = self->_errorModeView;
      unsigned int v13 = +[NSBundle mainBundle];
      id v14 = [v13 localizedStringForKey:@"Add a Missing Place" value:@"localized string not found" table:0];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100B5150C;
      v16[3] = &unk_1012EE310;
      objc_copyWeak(&v17, &location);
      [(ErrorModeView *)errorModeView setButtonTitle:v14 handler:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(ErrorModeView *)self->_errorModeView removeFromSuperview];
    id v15 = self->_errorModeView;
    self->_errorModeView = 0;
  }
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v19 viewDidLoad];
  [(ResultsViewController *)self configureHeader];
  v3 = [(ContaineeViewController *)self contentView];
  BOOL v4 = [(ResultsViewController *)self contentTableView];
  [v3 addSubview:v4];

  id v5 = [(ResultsViewController *)self view];
  id v6 = [(ResultsViewController *)self loadingModeView];
  [v5 addSubview:v6];

  id v7 = [(ResultsViewController *)self view];
  unsigned int v8 = [(ResultsViewController *)self errorModeView];
  [v7 addSubview:v8];

  CFStringRef v9 = [(ResultsViewController *)self view];
  uint64_t v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  unsigned int v12 = [v11 stringByReplacingOccurrencesOfString:@"Controller" withString:&stru_101324E70];
  [v9 setAccessibilityIdentifier:v12];

  [(ResultsViewController *)self setupConstraints];
  unsigned int v13 = [[ResultRefinementsAnalyticsManager alloc] initWithRefinementsFromWaypointEditor:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = v13;

  id v15 = [[SearchResultsDataSource alloc] initWithTableView:self->_contentTableView];
  searchResultsDataSource = self->_searchResultsDataSource;
  self->_searchResultsDataSource = v15;

  [self->_searchResultsDataSource setDelegate:self];
  id v17 = [(ControlContaineeViewController *)self delegate];
  v18 = [v17 appCoordinator];
  [(SearchResultsDataSource *)self->_searchResultsDataSource setShareDelegate:v18];

  [(SearchResultsDataSource *)self->_searchResultsDataSource setCollectionCarouselRoutingDelegate:self];
  [(SearchResultsDataSource *)self->_searchResultsDataSource setUsePlaceSummary:sub_1009DB5CC()];
  [(SearchResultsDataSource *)self->_searchResultsDataSource setIsPresentingAddStopResultsFromWaypointEditor:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
  [(ResultsViewController *)self setDataSource:self->_searchResultsDataSource];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v8 viewWillAppear:a3];
  BOOL v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2080;
    unsigned int v12 = "-[ResultsViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  if (!self->_quickActionMenuPresenter)
  {
    id v5 = [[SearchResultQuickActionMenuPresenter alloc] initWithTableView:self->_contentTableView];
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v5;

    [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter setDelegate:self];
  }
  if (([(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator isActive] & 1) == 0)
  {
    id v7 = [(ResultsViewController *)self impressionsCalculator];
    [v7 setActive:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    CFStringRef v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[ResultsViewController viewWillDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:v3];
  id v6 = [(ResultsViewController *)self impressionsCalculator];
  [v6 setActive:0];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v21 willBecomeCurrent:a3];
  BOOL v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    id v23 = self;
    __int16 v24 = 2080;
    id v25 = "-[ResultsViewController willBecomeCurrent:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  if (([(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator isActive] & 1) == 0)
  {
    id v5 = [(ResultsViewController *)self impressionsCalculator];
    [v5 setActive:1];
  }
  id v6 = [(ResultsViewController *)self searchSession];
  objc_super v7 = [v6 currentResults];
  if ([v7 count])
  {
    objc_super v8 = [(ResultsViewController *)self searchSession];
    if ([v8 isSpotlightPunchInSearch])
    {
      CFStringRef v9 = [(ResultsViewController *)self searchSession];
      unsigned int v10 = [v9 spotlightMatchingResultFound];

      if (!v10) {
        goto LABEL_11;
      }
      __int16 v11 = [(ResultsViewController *)self searchSession];
      [(ResultsViewController *)self setHeaderContentWithSearchSession:v11];

      [(ResultsViewController *)self setHideHeader:0];
      id v6 = [(ResultsViewController *)self searchSession];
      objc_super v7 = [v6 currentResults];
      [(ResultsViewController *)self setResultsList:v7];
    }
    else
    {
    }
  }

LABEL_11:
  unsigned int v12 = [(ResultsViewController *)self resultsList];
  if ([v12 count])
  {
    unsigned int v13 = [(ResultsViewController *)self resultsList];
    id v14 = [(ControlContaineeViewController *)self delegate];
    id v15 = [v14 searchPinsManager];
    uint64_t v16 = [v15 allSearchResults];
    unsigned __int8 v17 = [v13 isEqualToArray:v16];

    if (v17) {
      return;
    }
    v18 = [(ResultsViewController *)self resultsList];
    unsigned int v12 = +[SearchInfo searchInfoWithResults:v18];

    objc_super v19 = [(ControlContaineeViewController *)self delegate];
    id v20 = [v19 searchPinsManager];
    [v20 setSearchPinsFromSearchInfo:v12 scrollToResults:0 displayPlaceCardForResult:0 animated:0 completion:0];
  }
}

- (void)didResignCurrent
{
  BOOL v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    objc_super v7 = self;
    __int16 v8 = 2080;
    CFStringRef v9 = "-[ResultsViewController didResignCurrent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  self->_hasViewAppeared = 0;
  v5.receiver = self;
  v5.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v5 didResignCurrent];
  [(ResultsViewController *)self _hideSearchHereControl];
  BOOL v4 = [(ResultsViewController *)self impressionsCalculator];
  [v4 setActive:0];
}

- (void)didBecomeCurrent
{
  v7.receiver = self;
  v7.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v7 didBecomeCurrent];
  BOOL v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    CFStringRef v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[ResultsViewController didBecomeCurrent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  self->_hasViewAppeared = 1;
  BOOL v4 = [(ContaineeViewController *)self cardPresentationController];
  -[ResultsViewController setContaineeLayout:](self, "setContaineeLayout:", [v4 containeeLayout]);

  objc_super v5 = [(ResultsViewController *)self impressionsCalculator];
  unsigned __int8 v6 = [v5 hasImpressionElements];

  if ((v6 & 1) == 0) {
    [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v3 viewDidLayoutSubviews];
  [(ResultsViewController *)self _updateLoadingErrorFrames];
  [(ResultsViewController *)self updateLocalSearchViewInsets];
  [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
}

- (void)_updateLoadingErrorFrames
{
  if (self->_hideHeader)
  {
    objc_super v3 = [(ResultsViewController *)self view];
    [v3 bounds];
  }
  else
  {
    objc_super v3 = [(ContaineeViewController *)self contentView];
    [v3 frame];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;

  -[LoadingModeView setFrame:](self->_loadingModeView, "setFrame:", v8, v9, v10, v11);
  unsigned int v12 = [(ResultsViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = v11 - v13;

  errorModeView = self->_errorModeView;

  -[ErrorModeView setFrame:](errorModeView, "setFrame:", v8, v9, v10, v14);
}

- (void)setupConstraints
{
  _NSDictionaryOfVariableBindings(@"_contentTableView", self->_contentTableView, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[NSMutableArray array];
  objc_super v3 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[_contentTableView]-0-|", 0, 0, v5);
  [v2 addObjectsFromArray:v3];

  double v4 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0-[_contentTableView]-0-|", 0, 0, v5);
  [v2 addObjectsFromArray:v4];

  +[NSLayoutConstraint activateConstraints:v2];
}

- (void)applyAlphaToContent:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v10, "applyAlphaToContent:");
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containerStyle];

  double v7 = 0.0;
  if (!self->_hideHeader)
  {
    if (v6 == (id)6) {
      double v8 = 1.0;
    }
    else {
      double v8 = a3;
    }
    unsigned int v9 = [(ResultsViewController *)self isShowingOmnipresentSearchBar];
    double v7 = 0.0;
    if (!v9) {
      double v7 = v8;
    }
  }
  [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:v7];
  [(ErrorModeView *)self->_errorModeView setAlpha:a3];
  [(RefinementsBarUIView *)self->_refinementsBar setAlpha:a3];
}

- (GEOLocation)currentLocation
{
  return [self->_searchResultsDataSource currentLocation];
}

- (id)impressionsCalculator
{
  if (MapsFeature_IsEnabled_SearchResultsImpressions())
  {
    impressionsCalculator = self->_impressionsCalculator;
    if (impressionsCalculator)
    {
LABEL_9:
      double v14 = impressionsCalculator;
      goto LABEL_11;
    }
    double v4 = objc_alloc_init(SearchResultsImpressionsLogger);
    objc_initWeak(&location, self);
    id v5 = objc_alloc((Class)MUImpressionsCalculatorConfiguration);
    contentTableView = self->_contentTableView;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100B52414;
    objc_super v19 = &unk_1012F9518;
    objc_copyWeak(&v20, &location);
    id v7 = [v5 initWithLogger:v4 contentScrollView:contentTableView containerViewProvider:&v16];
    id v8 = objc_alloc((Class)MUScrollViewImpressionsCalculator);
    unsigned int v9 = [(MUScrollViewImpressionsCalculator *)[v8 initWithConfiguration:v7 visibleItemsProvider:self->_searchResultsDataSource v16, v17, v18, v19];
    objc_super v10 = self->_impressionsCalculator;
    self->_impressionsCalculator = v9;

    double v11 = +[GEOPlatform sharedPlatform];
    if ([v11 isInternalInstall])
    {
      unsigned int v12 = +[NSUserDefaults standardUserDefaults];
      unsigned int v13 = [v12 BOOLForKey:@"EnableSearchResultsImpressionLoggingVisualization"];

      if (!v13)
      {
LABEL_8:

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

        impressionsCalculator = self->_impressionsCalculator;
        goto LABEL_9;
      }
      double v11 = +[MapsImpressionsSearchResultsFloatingDebugViewController sharedInstance];
      [v11 setCalculator:self->_impressionsCalculator];
      if (([v11 isAttached] & 1) == 0) {
        [v11 attach];
      }
    }

    goto LABEL_8;
  }
  double v14 = 0;
LABEL_11:

  return v14;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 clearSearch];

  [(ResultsViewController *)self setResultsList:0];
  [(ErrorModeView *)self->_errorModeView removeErrorIconImageView];
  id v7 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  [v7 resetRedoSearchController];

  v8.receiver = self;
  v8.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v8 handleDismissAction:v4];
}

- (unint64_t)preferredPresentationStyle
{
  return 1;
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = sub_100109E50();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10.receiver = self;
    v10.super_class = (Class)ResultsViewController;
    id v7 = [(ResultsViewController *)&v10 class];
    id v8 = v7;
    unsigned int v9 = [(ControlContaineeViewController *)self delegate];
    *(_DWORD *)buf = 138412802;
    unsigned int v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Header view close button tapped. Self : %@, Super class: %@ delegate: %@", buf, 0x20u);
  }
  [(ResultsViewController *)self handleDismissAction:v5];
}

- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2022 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2023 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3
{
  id v4 = [a3 pdSuggestion];
  [(ResultsViewController *)self _searchWithSuggestion:v4];
}

- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4
{
  id v8 = a3;
  if (a4 >= 3)
  {
    id v6 = +[NSString stringWithFormat:@"(unknown: %lu)", a4];
  }
  else
  {
    id v6 = off_101319180[a4];
  }
  id v7 = +[MKMapService sharedService];
  [v7 captureUserAction:2021 onTarget:[self currentUITargetForAnalytics] eventValue:v6];
}

- (void)waitingData
{
  [(ResultsViewController *)self showError:0];
  loadingModeView = self->_loadingModeView;
  id v4 = [(ResultsViewController *)self loadingString];
  [(LoadingModeView *)loadingModeView setTitle:v4];

  [(LoadingModeView *)self->_loadingModeView setHidden:0];
  [(UITableView *)self->_contentTableView setHidden:1];
  double y = CGPointZero.y;
  contentTableView = self->_contentTableView;

  -[UITableView setContentOffset:](contentTableView, "setContentOffset:", CGPointZero.x, y);
}

- (id)loadingString
{
  v2 = [(ResultsViewController *)self searchSession];
  id v3 = [v2 stringToDisplay];
  id v4 = [v2 searchFieldItem];
  id v5 = [v4 searchCategory];

  if (v5)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Searching for  ... [Search Category]" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3);
  }
  else
  {
    id v8 = [v4 autocompletePerson];
    unsigned int v9 = [v8 handle];

    if (!v9)
    {
      unsigned int v12 = [v4 completion];
      __int16 v13 = [v12 mapItem];

      id v14 = +[NSBundle mainBundle];
      id v6 = v14;
      if (v13) {
        CFStringRef v15 = @"Loading ...";
      }
      else {
        CFStringRef v15 = @"Searching... [Search Query]";
      }
      objc_super v10 = [v14 localizedStringForKey:v15 value:@"localized string not found" table:0];
      goto LABEL_6;
    }
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"[Location Update] Refreshing Location" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v16);
  objc_super v10 = };

LABEL_6:

  return v10;
}

- (BOOL)isWaitingForResults
{
  v2 = [(ResultsViewController *)self searchSession];
  unsigned __int8 v3 = [v2 isSingleResultToShowAsPlacecard];
  if (([v2 isRedoOrAutoRedoSearchType] & 1) == 0
    && ([v2 isLoading] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

+ (BOOL)isReloadingRefinementsWithSearchSession:(id)a3
{
  id v3 = a3;
  if ([v3 isResultRefinementsBarSearch])
  {
    id v4 = [v3 currentResults];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)searchDidCancel:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    double v11 = self;
    __int16 v12 = 2080;
    __int16 v13 = "-[ResultsViewController searchDidCancel:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%p] %s", (uint8_t *)&v10, 0x16u);
  }

  [(LoadingModeView *)self->_loadingModeView setHidden:1];
  id v6 = [(ResultsViewController *)self impressionsCalculator];
  [v6 setActive:0];

  id v7 = [(ControlContaineeViewController *)self delegate];
  [v7 clearSearch];

  [(ResultsViewController *)self setResultsList:0];
  id v8 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  [v8 resetRedoSearchController];

  if (v3)
  {
    unsigned int v9 = [(ControlContaineeViewController *)self delegate];
    [v9 viewControllerClosed:self animated:1];
  }
}

- (void)_searchWithSuggestion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned int v9 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v9 setSuggestion:v4];
    BOOL v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:self doSearchItem:v9 withUserInfo:0];

    id v6 = +[MKMapService sharedService];
    uint64_t v7 = [(ResultsViewController *)self currentUITargetForAnalytics];
    id v8 = [v4 searchBarDisplayToken];

    [v6 captureUserAction:2020 onTarget:v7 eventValue:v8];
  }
}

- (void)increasResultRefinementsSelectionSequenceNumber
{
  id v4 = [(ResultsViewController *)self refinementsSelectionSequenceNumber];
  BOOL v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
  [(ResultsViewController *)self setRefinementsSelectionSequenceNumber:v3];
}

- (void)resultRefinementsBarDidUpdateViewModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  [v5 resetRedoSearchController];

  self->_lastRefinementOriginType = 1;
  id v6 = [(ResultsViewController *)self originalSearchInfo];
  id v7 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
  [v7 setResultRefinementOriginType:self->_lastRefinementOriginType];
  id v8 = [v6 resultRefinementGroup];
  unsigned int v9 = [v8 refinementSessionState];
  [v7 setRefinementSessionState:v9];

  int v10 = +[GEORefinementsFactory barResultRefinementsWith:v4];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        CFStringRef v15 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v14) convertToGEOPDResultRefinement];
        [v7 addRefinement:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v12);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = [v6 resultRefinementGroup];
  uint64_t v17 = [v16 resultRefinementView];
  v18 = [v17 sections];

  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      id v22 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v22) convertToGEOPDResultRefinementSection];
        [v7 addRefinementSection:v23];

        id v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v20);
  }

  __int16 v24 = [(ControlContaineeViewController *)self delegate];
  id v25 = [(ResultsViewController *)self searchSession];
  v26 = [v25 searchFieldItem];
  v37[0] = @"ResultRefinementsBarSearch";
  v37[1] = @"kAddStopFromWaypointEditor";
  v38[0] = &__kCFBooleanTrue;
  unsigned int v27 = +[NSNumber numberWithBool:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
  v38[1] = v27;
  long long v28 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v24 viewController:self doSearchItem:v26 withUserInfo:v28 refinementsQuery:v7];
}

- (void)resultRefinementsBarDidTapOnSeeAllRefinements:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AllRefinementsViewController alloc];
  id v6 = [v4 copy];

  id v7 = [(ResultsViewController *)self refinementsSelectionSequenceNumber];
  id v8 = [v7 copy];
  uint64_t v13 = [(AllRefinementsViewController *)v5 initWithViewModel:v6 selectionSequenceNumber:v8 resultRefinementsAnalyticsDelegate:self->_analyticsManager];

  unsigned int v9 = [(ContaineeViewController *)self containeeDelegate];
  [(ContaineeViewController *)v13 setContaineeDelegate:v9];

  int v10 = [(ControlContaineeViewController *)self delegate];
  [(ControlContaineeViewController *)v13 setDelegate:v10];

  [(AllRefinementsViewController *)v13 setAllRefinementsDelegate:self];
  id v11 = [(ControlContaineeViewController *)self delegate];
  id v12 = [v11 containerViewController];
  [v12 presentController:v13 animated:1];

  [(ResultRefinementsAnalyticsManager *)self->_analyticsManager logRefinementsEvent:2 fromSource:0];
}

- (void)resultRefinementsBarDidTapOnMultiSelect:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v13 = +[RefinementsViewModelFactory multiSelectRefinementsViewModelWith:a3 tappedAtIndex:a4];
  BOOL v5 = [AllRefinementsViewController alloc];
  id v6 = [(ResultsViewController *)self refinementsSelectionSequenceNumber];
  id v7 = [v6 copy];
  id v8 = [(AllRefinementsViewController *)v5 initWithViewModel:v13 selectionSequenceNumber:v7 resultRefinementsAnalyticsDelegate:self->_analyticsManager];

  unsigned int v9 = [(ContaineeViewController *)self containeeDelegate];
  [(ContaineeViewController *)v8 setContaineeDelegate:v9];

  int v10 = [(ControlContaineeViewController *)self delegate];
  [(ControlContaineeViewController *)v8 setDelegate:v10];

  [(AllRefinementsViewController *)v8 setAllRefinementsDelegate:self];
  id v11 = [(ControlContaineeViewController *)self delegate];
  id v12 = [v11 containerViewController];
  [v12 presentController:v8 animated:1];

  [(ResultRefinementsAnalyticsManager *)self->_analyticsManager logRefinementsEvent:3 fromSource:0];
}

- (void)resultRefinementsBarDidTapOnToggle:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  analyticsManager = self->_analyticsManager;
  id v6 = [a3 refinementKey];
  [(ResultRefinementsAnalyticsManager *)analyticsManager resultRefinementTappedWithKey:v6 source:0 refinementType:0 isSelected:v4];
}

- (void)resultRefinementsBarDidTapOnOpenOptions:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v15 = a3;
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v6 = +[RefinementsViewModelFactory openOptionsRefinementsViewModelWith:v15 tappedAtIndex:a4];
    id v7 = [AllRefinementsViewController alloc];
    id v8 = [(ResultsViewController *)self refinementsSelectionSequenceNumber];
    id v9 = [v8 copy];
    int v10 = [(AllRefinementsViewController *)v7 initWithViewModel:v6 selectionSequenceNumber:v9 resultRefinementsAnalyticsDelegate:self->_analyticsManager];

    id v11 = [(ContaineeViewController *)self containeeDelegate];
    [(ContaineeViewController *)v10 setContaineeDelegate:v11];

    id v12 = [(ControlContaineeViewController *)self delegate];
    [(ControlContaineeViewController *)v10 setDelegate:v12];

    [(AllRefinementsViewController *)v10 setAllRefinementsDelegate:self];
    id v13 = [(ControlContaineeViewController *)self delegate];
    id v14 = [v13 containerViewController];
    [v14 presentController:v10 animated:1];

    [(ResultRefinementsAnalyticsManager *)self->_analyticsManager logRefinementsEvent:3 fromSource:0];
  }
}

- (void)allRefinementsApplyViewModel:(id)a3 selectionSequenceNumber:(id)a4
{
  id v6 = a3;
  [(ResultsViewController *)self setRefinementsSelectionSequenceNumber:a4];
  id v7 = [v6 tappedBarButtonIndex];

  if (!v7) {
    goto LABEL_9;
  }
  id v8 = [v6 sections];
  id v9 = [v8 firstObject];

  id v10 = [v9 type];
  if (v10)
  {
    if (v10 == (id)2)
    {
      id v13 = v9;
      id v12 = [v6 tappedBarButtonIndex];
      [(ResultsViewController *)self resultRefinementsBarApplyOpenOptionViewModel:v13 atIndex:v12];
      goto LABEL_7;
    }
    if (v10 == (id)1)
    {
      id v11 = v9;
      id v12 = [v6 tappedBarButtonIndex];
      [(ResultsViewController *)self resultRefinementsBarApplyMultiSelectViewModel:v11 atIndex:v12];
LABEL_7:

LABEL_24:
      goto LABEL_25;
    }

LABEL_9:
    id v14 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
    [v14 resetRedoSearchController];

    self->_lastRefinementOriginType = 2;
    id v9 = [(ResultsViewController *)self originalSearchInfo];
    id v12 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    [v12 setResultRefinementOriginType:self->_lastRefinementOriginType];
    id v15 = [v9 resultRefinementGroup];
    uint64_t v16 = [v15 refinementSessionState];
    [v12 setRefinementSessionState:v16];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v17 = [v9 resultRefinementGroup];
    v18 = [v17 resultRefinementBar];
    id v19 = [v18 resultRefinements];

    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        id v23 = 0;
        do
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v23) convertToGEOPDResultRefinement];
          [v12 addRefinement:v24];

          id v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v21);
    }

    id v25 = +[GEORefinementsFactory allRefinementsSectionsWith:v6];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        long long v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v29) convertToGEOPDResultRefinementSection];
          [v12 addRefinementSection:v30];

          long long v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v27);
    }
    long long v31 = [(ControlContaineeViewController *)self delegate];
    long long v32 = [(ResultsViewController *)self searchSession];
    long long v33 = [v32 searchFieldItem];
    CFStringRef v44 = @"kAddStopFromWaypointEditor";
    long long v34 = +[NSNumber numberWithBool:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
    v45 = v34;
    long long v35 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    [v31 viewController:self doSearchItem:v33 withUserInfo:v35 refinementsQuery:v12];

    goto LABEL_24;
  }
LABEL_25:
}

- (void)resultRefinementsBarApplyMultiSelectViewModel:(id)a3 atIndex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  [v8 resetRedoSearchController];

  self->_lastRefinementOriginType = 1;
  id v9 = [(ResultsViewController *)self originalSearchInfo];
  id v10 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
  [v10 setResultRefinementOriginType:self->_lastRefinementOriginType];
  id v11 = [v9 resultRefinementGroup];
  id v12 = [v11 refinementSessionState];
  [v10 setRefinementSessionState:v12];

  id v13 = [v9 resultRefinementGroup];
  id v14 = [v13 resultRefinementBar];
  id v15 = [v14 resultRefinements];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100B53D80;
  v36[3] = &unk_101319138;
  id v16 = v7;
  id v37 = v16;
  id v17 = v6;
  id v38 = v17;
  id v18 = v10;
  id v39 = v18;
  [v15 enumerateObjectsUsingBlock:v36];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = [v9 resultRefinementGroup];
  id v20 = [v19 resultRefinementView];
  id v21 = [v20 sections];

  id v22 = [v21 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      id v25 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v25) convertToGEOPDResultRefinementSection];
        [v18 addRefinementSection:v26];

        id v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v23);
  }

  id v27 = [(ControlContaineeViewController *)self delegate];
  uint64_t v28 = [(ResultsViewController *)self searchSession];
  long long v29 = [v28 searchFieldItem];
  CFStringRef v40 = @"kAddStopFromWaypointEditor";
  long long v30 = +[NSNumber numberWithBool:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
  long long v41 = v30;
  long long v31 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  [v27 viewController:self doSearchItem:v29 withUserInfo:v31 refinementsQuery:v18];
}

- (void)resultRefinementsBarApplyOpenOptionViewModel:(id)a3 atIndex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v8 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
    [v8 resetRedoSearchController];

    self->_lastRefinementOriginType = 1;
    id v9 = [(ResultsViewController *)self originalSearchInfo];
    id v10 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    [v10 setResultRefinementOriginType:self->_lastRefinementOriginType];
    id v11 = [v9 resultRefinementGroup];
    id v12 = [v11 refinementSessionState];
    [v10 setRefinementSessionState:v12];

    id v13 = [v9 resultRefinementGroup];
    id v14 = [v13 resultRefinementBar];
    id v15 = [v14 resultRefinements];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100B541A0;
    v34[3] = &unk_101319138;
    id v35 = v7;
    id v36 = v6;
    id v16 = v10;
    id v37 = v16;
    [v15 enumerateObjectsUsingBlock:v34];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = [v9 resultRefinementGroup];
    id v18 = [v17 resultRefinementView];
    id v19 = [v18 sections];

    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        id v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v23) convertToGEOPDResultRefinementSection];
          [v16 addRefinementSection:v24];

          id v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v21);
    }

    id v25 = [(ControlContaineeViewController *)self delegate];
    id v26 = [(ResultsViewController *)self searchSession];
    id v27 = [v26 searchFieldItem];
    CFStringRef v38 = @"kAddStopFromWaypointEditor";
    uint64_t v28 = +[NSNumber numberWithBool:[(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor]];
    id v39 = v28;
    long long v29 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v25 viewController:self doSearchItem:v27 withUserInfo:v29 refinementsQuery:v16];
  }
}

- (void)setHeaderContentWithSearchSession:(id)a3
{
  id v58 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isReloadingRefinementsWithSearchSession:v58];
  BOOL v5 = v58;
  if ((v4 & 1) == 0)
  {
    id v6 = [v58 searchFieldItem];
    id v7 = [v58 searchInfo];
    id v8 = [v6 originalSearchString];
    v57 = v7;
    if (!v8)
    {
      id v9 = [v6 historyItem];
      id v10 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
      objc_opt_class();
      id v8 = v9;
      if (objc_opt_isKindOfClass()) {
        id v11 = v8;
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;

      if (v12
        && ([v12 historyEntry],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unsigned int v14 = [v13 conformsToProtocol:v10],
            v13,
            v14))
      {
        id v15 = v8;
      }
      else
      {
        id v15 = 0;
      }

      if (!v15)
      {
        v51 = [v6 completion];
        id v52 = [v51 _type];

        if (v52)
        {
          BOOL v17 = 1;
          goto LABEL_20;
        }
LABEL_13:
        id v16 = [v6 searchCategory];
        if (v16)
        {
          BOOL v17 = 1;
        }
        else
        {
          id v18 = [v6 placeCategoryItem];
          BOOL v17 = v18
             || [(ResultsViewController *)self isWaitingForResults]
             || [(ResultsViewController *)self isShowingOmnipresentSearchBar];
        }
LABEL_20:
        [(ResultsTitleView *)self->_resultsTitleView setEditButtonHidden:v17];
        unsigned __int8 v19 = [(ResultsViewController *)self isWaitingForResults];
        double v20 = 0.0;
        if ((v19 & 1) == 0)
        {
          unsigned int v21 = [(ResultsViewController *)self isShowingOmnipresentSearchBar];
          double v20 = 1.0;
          if (v21) {
            double v20 = 0.0;
          }
        }
        [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:v20];
        uint64_t v22 = [v7 headerDisplayName];
        id v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [v6 title];
        }
        id v25 = v24;

        uint64_t v26 = [v7 subHeaderDisplayName];
        if (v26
          && (id v27 = (void *)v26,
              unsigned __int8 v28 = [v58 isRedoOrAutoRedoSearchType],
              v27,
              (v28 & 1) == 0))
        {
          long long v33 = [v7 subHeaderDisplayName];
        }
        else
        {
          long long v29 = [v58 currentResults];

          if (v29)
          {
            long long v30 = +[NSBundle mainBundle];
            long long v31 = [v30 localizedStringForKey:@"[Results] subtitle" value:@"localized string not found" table:0];
            long long v32 = [v58 currentResults];
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, [v32 count]);
            long long v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v33 = &stru_101324E70;
          }
        }
        if ([(__CFString *)v33 length]) {
          char v34 = v17;
        }
        else {
          char v34 = 1;
        }
        if ((v34 & 1) == 0)
        {
          id v35 = +[NSBundle mainBundle];
          id v36 = [v35 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

          uint64_t v37 = [(__CFString *)v33 stringByAppendingString:v36];

          long long v33 = (__CFString *)v37;
        }
        [(ResultsTitleView *)self->_resultsTitleView setTitle:v25];
        [(ResultsTitleView *)self->_resultsTitleView setSubtitle:v33];
        CFStringRef v38 = [v6 searchCategory];
        uint64_t v39 = [v38 styleAttributes];
        if (v39)
        {
          CFStringRef v40 = (void *)v39;
        }
        else
        {
          long long v41 = [v6 placeCategoryItem];
          long long v42 = [v41 searchCategory];
          CFStringRef v40 = [v42 styleAttributes];

          if (!v40)
          {
            v53 = [v7 styleAttributes];

            if (!v53)
            {
              CFStringRef v44 = 0;
              id v50 = 0;
              goto LABEL_42;
            }
            id v54 = objc_alloc((Class)GEOFeatureStyleAttributes);
            v55 = [v7 styleAttributes];
            id v43 = [v54 initWithGEOStyleAttributes:v55];

            CFStringRef v44 = 0;
            id v50 = 0;
            if (!v43) {
              goto LABEL_42;
            }
LABEL_41:
            v45 = +[UIScreen mainScreen];
            [v45 nativeScale];
            double v47 = v46;
            v48 = [(ResultsViewController *)self traitCollection];
            LOBYTE(v56) = [v48 userInterfaceStyle] == (id)2;
            v49 = +[MKIconManager imageForStyle:v43 size:4 forScale:1 format:0 transparent:0 transitMode:0 isCarplay:v47 nightMode:v56];

            id v50 = v43;
            if (v49)
            {
LABEL_43:
              [(ResultsTitleView *)self->_resultsTitleView setHeaderImage:v49];

              BOOL v5 = v58;
              goto LABEL_44;
            }
LABEL_42:
            v49 = +[UIImage imageNamed:@"search"];
            id v43 = v50;
            goto LABEL_43;
          }
        }
        id v43 = v40;
        CFStringRef v44 = v43;
        goto LABEL_41;
      }
    }
    goto LABEL_13;
  }
LABEL_44:
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_currentDataSource == a3)
  {
    [(LoadingModeView *)self->_loadingModeView setHidden:1];
    [(UITableView *)self->_contentTableView setHidden:0];
    [(UITableView *)self->_contentTableView reloadData];
    unsigned __int8 v4 = [(ControlContaineeViewController *)self delegate];
    BOOL v5 = [v4 venuesManager];
    [v5 venuesControlCoordinatingDidChangeSearchResultCount:self];

    id v7 = [(ControlContaineeViewController *)self delegate];
    id v6 = [v7 venuesManager];
    [v6 updateFocusedVenueFloor];
  }
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:self focusSearchResult:v7];

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = 0;
  }
  else
  {
    if (self->_lastItemTapped) {
      goto LABEL_6;
    }
    lastItemTapped = [(ControlContaineeViewController *)self delegate];
    [lastItemTapped viewControllerRemoveSearchResultFocus:self];
  }

LABEL_6:
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v16 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v16;
  if (isKindOfClass)
  {
    id v7 = v16;
    id v8 = [v7 mapItem];
    unsigned int v9 = [v8 _hasHikeInfo];

    if (v9)
    {
      id v10 = [(ControlContaineeViewController *)self delegate];
      id v11 = [v10 appCoordinator];
      id v12 = [v7 mapItem];
      [v11 enterRouteCreationWithMapItem:v12 completion:0];
    }
    else
    {
      id v13 = [v7 placeCollection];

      unsigned int v14 = [(ControlContaineeViewController *)self delegate];
      id v10 = v14;
      if (v13)
      {
        id v11 = [v7 placeCollection];
        [v10 viewController:self showCuratedCollection:v11];
      }
      else
      {
        id v11 = [v14 mapSelectionManager];
        [v11 selectSearchResult:v7 animated:1];
      }
    }

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = v7;

    id v6 = v16;
  }
}

- (void)didTapOnAddAPlace
{
  BOOL v3 = [(ResultsViewController *)self searchSession];
  unsigned __int8 v4 = [v3 searchInfo];
  BOOL v5 = [v4 searchFieldItem];
  id v6 = [v5 title];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(ResultsTitleView *)self->_resultsTitleView title];
  }
  id v14 = v8;

  unsigned int v9 = [[ReportASearchAutocompleteResult alloc] initWithTitle:v14];
  id v10 = [(ResultsViewController *)self _maps_mapsSceneDelegate];
  id v11 = [v10 rapPresenter];
  [v11 presentAddToMapsFromSearchEntryPoint:[self currentUITargetForAnalytics] result:v9 completion:0];

  id v12 = [(ResultsViewController *)self searchSession];
  id v13 = [v12 currentResults];
  +[SearchResultsAnalyticsManager addAPlaceTappedWithNumberOfResults:target:](SearchResultsAnalyticsManager, "addAPlaceTappedWithNumberOfResults:target:", [v13 count], -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));
}

- (int)refineSearchSessionType
{
  v2 = [(ResultsViewController *)self searchSession];
  BOOL v3 = [v2 searchFieldItem];
  unsigned __int8 v4 = [v3 searchCategory];

  if (v4) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }

  return v5;
}

- (id)refineSearchText
{
  v2 = [(ResultsViewController *)self originalSearchInfo];
  BOOL v3 = [v2 searchText];

  return v3;
}

- (int)listForDataSource:(id)a3
{
  BOOL v3 = [(ResultsViewController *)self searchSession];
  unsigned __int8 v4 = [v3 searchFieldItem];
  int v5 = [v4 searchCategory];

  if (v5) {
    int v6 = 3;
  }
  else {
    int v6 = 5;
  }

  return v6;
}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  id v9 = a4;
  id v5 = [v9 type];
  if (v5 == (id)3)
  {
    int v6 = [(ControlContaineeViewController *)self delegate];
    id v7 = [v9 userGeneratedCollection];
    [v6 viewController:self showCollection:v7];
  }
  else if (v5 == (id)2)
  {
    int v6 = [(ControlContaineeViewController *)self delegate];
    id v7 = [v9 placeCollections];
    [v6 viewController:self showCuratedCollectionsList:v7 usingTitle:0 usingCollectionIds:0 completion:0];
  }
  else
  {
    if (v5 != (id)1) {
      goto LABEL_8;
    }
    int v6 = [(ControlContaineeViewController *)self delegate];
    id v7 = [v9 placeCollections];
    id v8 = [v7 firstObject];
    [v6 viewController:self showCuratedCollection:v8];
  }
LABEL_8:
}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCollection:v4];

  +[SearchResultsAnalyticsManager userGeneratedGuideUnitTapped];
}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];

  +[SearchResultsAnalyticsManager curatedGuidesUnitTapped];
}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollectionsList:v4 usingTitle:0 usingCollectionIds:0 completion:0];

  +[SearchResultsAnalyticsManager curatedGuidesUnitTapped];
}

- (void)didTapOnDirectionsWithSearchResult:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SearchFieldItem);
  int v6 = +[SearchResult currentLocationSearchResult];
  [(SearchFieldItem *)v5 setSearchResult:v6];

  id v7 = +[SearchFieldItem searchFieldItemWithObject:v4];
  id v8 = [DirectionItem alloc];
  v16[0] = v5;
  v16[1] = v7;
  id v9 = +[NSArray arrayWithObjects:v16 count:2];
  id v10 = [(DirectionItem *)v8 initWithItems:v9 ignoreMapType:0 transportType:0];

  CFStringRef v14 = @"DirectionsSessionInitiatorKey";
  id v15 = &off_1013AA840;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v12 = [(ControlContaineeViewController *)self delegate];
  [v12 viewController:0 doDirectionItem:v10 withUserInfo:v11];

  id v13 = [v4 mapItem];

  +[SearchResultsAnalyticsManager directionsButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "directionsButtonTappedOnSearchResultWithMuid:", [v13 _muid]);
}

- (void)didTapOnLookAroundWithSearchResult:(id)a3
{
  id v8 = a3;
  id v4 = [v8 mapItem];
  if ([v4 _hasLookAroundStorefront])
  {
    id v5 = [(ControlContaineeViewController *)self delegate];
    int v6 = +[MKLookAroundEntryPoint entryPointWithMapItem:v4 wantsCloseUpView:1];
    [v5 enterLookAroundWithEntryPoint:v6 lookAroundView:0 showsFullScreen:1 originFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  }
  id v7 = [v8 mapItem];
  +[SearchResultsAnalyticsManager lookAroundButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "lookAroundButtonTappedOnSearchResultWithMuid:", [v7 _muid]);
}

- (void)didTapOnCallWithSearchResult:(id)a3
{
  id v9 = a3;
  BOOL v3 = [v9 mapItem];
  id v4 = [v3 phoneNumber];
  id v5 = [v4 length];

  if (v5)
  {
    int v6 = +[UIApplication sharedApplication];
    id v7 = [v3 phoneNumber];
    [v6 callPhoneNumber:v7 completion:0];
  }
  id v8 = [v9 mapItem];
  +[SearchResultsAnalyticsManager callButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "callButtonTappedOnSearchResultWithMuid:", [v8 _muid]);
}

- (void)didTapOnWebsiteWithSearchResult:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  int v6 = [v4 mapItem];
  id v7 = [v6 url];
  [v5 viewController:self openURL:v7];

  id v8 = [v4 mapItem];

  +[SearchResultsAnalyticsManager websiteButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "websiteButtonTappedOnSearchResultWithMuid:", [v8 _muid]);
}

- (void)didTapOnFlyoverWithSearchResult:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  int v6 = [v4 mapItem];
  [v5 viewController:self enterFlyoverForMapItem:v6];

  id v7 = [v4 mapItem];

  +[SearchResultsAnalyticsManager flyoverButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "flyoverButtonTappedOnSearchResultWithMuid:", [v7 _muid]);
}

- (void)didTapOnContainmentParentMapItem:(id)a3
{
  id v4 = a3;
  id v10 = [[SearchResult alloc] initWithMapItem:v4];

  id v5 = [(ResultsViewController *)self resultsList];
  int v6 = [v5 arrayByAddingObject:v10];

  id v7 = [(ControlContaineeViewController *)self delegate];
  id v8 = [v7 searchPinsManager];
  [v8 setSearchPins:v6 selectedPin:v10 animated:1];

  id v9 = [(SearchResult *)v10 mapItem];
  +[SearchResultsAnalyticsManager containmentParentUnitTappedWithMuid:](SearchResultsAnalyticsManager, "containmentParentUnitTappedWithMuid:", [v9 _muid]);
}

- (void)didTapOnTappableEntry:(id)a3
{
  id v4 = a3;
  id v10 = [[SearchResult alloc] initWithMapItem:v4];

  id v5 = [(ResultsViewController *)self resultsList];
  int v6 = [v5 arrayByAddingObject:v10];

  id v7 = [(ControlContaineeViewController *)self delegate];
  id v8 = [v7 searchPinsManager];
  [v8 setSearchPins:v6 selectedPin:v10 animated:1];

  id v9 = [(SearchResult *)v10 mapItem];
  +[SearchResultsAnalyticsManager tappableEntryUnitTappedWithMuid:](SearchResultsAnalyticsManager, "tappableEntryUnitTappedWithMuid:", [v9 _muid]);
}

- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4
{
  CFStringRef v11 = @"DirectionsSessionInitiatorKey";
  id v12 = &off_1013AA840;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [(ControlContaineeViewController *)self delegate];
  [v9 viewController:self addStopForSearchResult:v7 withUserInfo:v8];

  id v10 = [v7 mapItem];

  +[SearchResultsAnalyticsManager didTapOnAddStopForSearchResultWithMapItem:v10 indexPath:v6];
}

- (void)didTapOnUserLibraryMapItem:(id)a3
{
  if ([a3 _hasHikeInfo])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100B55864;
    v5[3] = &unk_101319160;
    v5[4] = self;
    +[MapsSavedRoutesManager fetchSavedRoutesWithType:1 completion:v5];
  }
  else
  {
    id v4 = [(ControlContaineeViewController *)self delegate];
    [v4 viewControllerShowLibraryPlacesView:self];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  id v5 = [a4 searchResult:a3];
  if (v5)
  {
    if ([(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor])
    {
      [(ResultsViewController *)self didTapOnAddStopWithSearchResult:v5 atIndexPath:0];
    }
    else
    {
      id v6 = objc_alloc_init(SearchFieldItem);
      id v7 = +[SearchResult currentLocationSearchResult];
      [(SearchFieldItem *)v6 setSearchResult:v7];

      id v8 = objc_alloc_init(SearchFieldItem);
      [(SearchFieldItem *)v8 setSearchResult:v5];
      id v9 = [DirectionItem alloc];
      v16[0] = v6;
      v16[1] = v8;
      id v10 = +[NSArray arrayWithObjects:v16 count:2];
      CFStringRef v11 = [(DirectionItem *)v9 initWithItems:v10 transportType:0];

      CFStringRef v14 = @"DirectionsSessionInitiatorKey";
      id v15 = &off_1013AA840;
      id v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v13 = [(ControlContaineeViewController *)self delegate];
      [v13 viewController:0 doDirectionItem:v11 withUserInfo:v12];
    }
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  [a4 searchResult:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:0 doAudioCallToSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  [a4 searchResult:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:0 openWebsiteForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  id v5 = [a4 searchResult:a3];
  if (v5)
  {
    id v9 = v5;
    id v6 = [v5 contactForSharingToMessages];
    id v7 = +[ShareItem shareItemWithSearchResult:v9 contact:v6 includePrintActivity:0];

    id v8 = [(ControlContaineeViewController *)self delegate];
    [v8 viewController:0 doShareSheetForShareItem:v7 completion:0];

    id v5 = v9;
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  id v5 = [(SearchResultQuickActionMenuPresenter *)self->_quickActionMenuPresenter indexPath];
  if (v5)
  {
    id v7 = v5;
    id v6 = [self->_currentDataSource objectAtIndexPath:v5];
    [(ResultsViewController *)self dataSource:self->_currentDataSource itemTapped:v6];

    id v5 = v7;
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
  BOOL v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 newTraits];

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v5 = a4;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewController:0 removeDroppedPin:v5];
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5 = a4;
  id v6 = [(ControlContaineeViewController *)self delegate];
  id v7 = [v6 venuesManager];
  id v8 = [v5 mapItem];

  LOBYTE(v5) = [v7 isUserAtSameVenueAsMapItem:v8] ^ 1;
  return (char)v5;
}

- (int)currentUITargetForAnalytics
{
  BOOL v3 = [(ResultsViewController *)self searchSession];
  id v4 = [v3 searchFieldItem];
  if ([(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor])
  {
    int v5 = 58;
  }
  else
  {
    id v6 = [v4 searchCategory];

    if (v6) {
      int v5 = 102;
    }
    else {
      int v5 = 101;
    }
  }

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)didCachePlaceSummaryTemplates
{
  BOOL v3 = [(ResultsViewController *)self originalSearchInfo];
  if (v3)
  {
    id v11 = v3;
    id v4 = [v3 searchText];
    int v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v7 = [v11 searchFieldItem];
      id v6 = [v7 title];
    }
    searchResultsDataSource = self->_searchResultsDataSource;
    uint64_t v9 = [(ResultsViewController *)self currentUITargetForAnalytics];
    id v10 = [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator sessionIdentifier];
    +[SearchResultsAnalyticsManager didShowSearchResultsWithDataSource:searchResultsDataSource target:v9 query:v6 impressionsSessionIdentifier:v10];

    BOOL v3 = v11;
  }
}

- (void)_updateResultRefinementBarFromSearchInfo:(id)a3
{
  id v12 = a3;
  id v4 = [v12 resultRefinementGroup];

  if (v4)
  {
    int v5 = [(ResultsViewController *)self refinementsSelectionSequenceNumber];

    if (!v5) {
      [(ResultsViewController *)self setRefinementsSelectionSequenceNumber:&off_1013AA858];
    }
    if (!self->_refinementsController)
    {
      id v6 = objc_alloc_init(_TtC4Maps27ResultRefinementsController);
      refinementsController = self->_refinementsController;
      self->_refinementsController = v6;

      [(ResultRefinementsController *)self->_refinementsController setDelegate:self];
      [(RefinementsBarUIView *)self->_refinementsBar setDelegate:self->_refinementsController];
    }
    id v8 = [v12 resultRefinementGroup];
    uint64_t v9 = +[RefinementsViewModelFactory barViewModelWith:v8];

    [(RefinementsBarUIView *)self->_refinementsBar setViewModel:v9];
    [(ResultsViewController *)self setHideRefinementsBar:0];
    if (!self->_lastRefinementOriginType)
    {
      id v10 = [(ResultsViewController *)self searchSession];
      unsigned int v11 = [v10 source];

      if (v11 == 7)
      {
        self->_lastRefinementOriginType = 3;
        [(ResultsViewController *)self setRefinementsSelectionSequenceNumber:&off_1013AA870];
      }
    }
  }
  else
  {
    [(ResultsViewController *)self setHideRefinementsBar:1];
  }
}

- (BOOL)isShowingOmnipresentSearchBar
{
  IsEnabled_SearchAndDiscoverdouble y = MapsFeature_IsEnabled_SearchAndDiscovery();
  if (IsEnabled_SearchAndDiscovery) {
    LOBYTE(IsEnabled_SearchAndDiscovery) = ![(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor];
  }
  return IsEnabled_SearchAndDiscovery;
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_contentTableView;
}

- (NSDictionary)searchResultCountInVenue
{
  if [self->_currentDataSource conformsToProtocol:&OBJC_PROTOCOL___VenueItemDataSource]&& (objc_opt_respondsToSelector())
  {
    BOOL v3 = [self->_currentDataSource itemCountInVenue];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v5, "willChangeContainerStyle:");
  [(LocalSearchViewController *)self->_localSearchViewController setEnable:a3 != 6];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v11 didChangeLayout:"didChangeLayout:"];
  [(ResultsViewController *)self _updateLoadingErrorFrames];
  if ([(ResultsViewController *)self containeeLayout] != a3)
  {
    objc_super v5 = objc_alloc_init(SearchSessionAnalytics);
    [(SearchSessionAnalytics *)v5 setTarget:[(ResultsViewController *)self currentUITargetForAnalytics]];
    unint64_t v6 = [(ResultsViewController *)self containeeLayout];
    if (v6 && v6 < a3)
    {
      uint64_t v7 = 1;
    }
    else
    {
      unint64_t v8 = [(ResultsViewController *)self containeeLayout];
      if (!a3 || v8 <= a3) {
        goto LABEL_9;
      }
      uint64_t v7 = 2;
    }
    [(SearchSessionAnalytics *)v5 setAction:v7];
    uint64_t v9 = +[MKMapService sharedService];
    [v9 captureUserAction:[self action] onTarget:[self target] eventValue:0];

LABEL_9:
    id v10 = +[SearchSessionAnalyticsAggregator sharedAggregator];
    [v10 collectSearchSessionAnalytics:v5];

    [(ResultsViewController *)self setContaineeLayout:a3];
  }
  [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2)
  {
    sub_10002197C();
  }
  else
  {
    if (a3 == 1)
    {
      [(ContaineeViewController *)self headerHeight];
      double v4 = 82.0;
      if (v5 > 82.0)
      {
        [(ContaineeViewController *)self headerHeight];
        double v4 = v6;
      }
      uint64_t v7 = [(ContaineeViewController *)self cardPresentationController];
      [v7 bottomSafeOffset];
      double v9 = v4 + v8;
    }
    else
    {
      uint64_t v7 = [(ContaineeViewController *)self cardPresentationController];
      [v7 availableHeight];
      double v9 = v11;
    }

    return v9;
  }
  return result;
}

- (void)_hideSearchHereControl
{
  v2 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v2 containerViewController];
  id v5 = [v3 chromeViewController];

  double v4 = [v5 redoSearchOverlay];
  [v4 shouldHideFloatingControl:1 animated:0];
}

- (void)showSearchingHereIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ResultsViewController *)self isShowingOmnipresentSearchBar])
  {
    id v5 = [(ControlContaineeViewController *)self delegate];
    double v6 = [v5 currentSearchSession];
    uint64_t v7 = [v6 searchInfo];

    if (v7)
    {
      double v8 = [(ControlContaineeViewController *)self delegate];
      double v9 = [v8 containerViewController];
      id v10 = [v9 chromeViewController];

      double v11 = [v10 redoSearchOverlay];
      [v11 setHidden:0];

      if (v3)
      {
        id v12 = sub_100109E50();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [(ControlContaineeViewController *)self delegate];
          CFStringRef v14 = [v13 currentSearchSession];
          int v24 = 138412290;
          id v25 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[ResultsVC] Trigerred auto-redo search: %@", (uint8_t *)&v24, 0xCu);
        }
        [v10 setNeedsUpdateComponent:@"redoSearchButton" animated:1];
        id v15 = [v10 redoSearchOverlay];
        [v15 updateSearchOverlayWithState:0];

        id v16 = [v10 redoSearchOverlay];
        [v16 shouldHideFloatingControl:0 animated:1];

        self->_didTriggerAutoRedoSearch = 1;
        [(ResultsViewController *)self refreshCurrentSearch];
      }
      else
      {
        BOOL v17 = [(ResultsViewController *)self localSearchViewController];
        id v18 = [v17 refreshSearchHereBusinessController];
        unsigned int v19 = [v18 shouldShowManualRedoButton];

        if (MapsFeature_IsEnabled_SearchAndDiscovery() && v19)
        {
          double v20 = sub_1005771BC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            unsigned int v21 = [(ControlContaineeViewController *)self delegate];
            uint64_t v22 = [v21 currentSearchSession];
            int v24 = 138412290;
            id v25 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[SearchVC] Showing search here button as we did not trigger Auto-Redo: %@", (uint8_t *)&v24, 0xCu);
          }
          [v10 setNeedsUpdateComponent:@"redoSearchButton" animated:1];
          id v23 = [v10 redoSearchOverlay];
          [v23 updateSearchOverlayWithState:1];
        }
      }
    }
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (self->_tappedTrackingButton)
  {
    self->_tappedTrackingButton = 0;
    id v5 = a3;
    double v6 = [(ResultsViewController *)self localSearchViewController];
    uint64_t v7 = [v6 refreshSearchHereBusinessController];
    id v8 = [v7 didStopRespondingToGesture:v5];

    [(ResultsViewController *)self showSearchingHereIfNeeded:v8];
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v8 = a3;
  if (![(ResultsViewController *)self isShowingOmnipresentSearchBar])
  {
    double v6 = [(ResultsViewController *)self localSearchViewController];
    uint64_t v7 = [v6 refreshSearchHereBusinessController];
    [v7 didStartRespondingToGesture:v8];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v12 = a3;
  if (![(ResultsViewController *)self isShowingOmnipresentSearchBar])
  {
    double v9 = [(ResultsViewController *)self localSearchViewController];
    id v10 = [v9 refreshSearchHereBusinessController];
    id v11 = [v10 didStopRespondingToGesture:v12];

    [(ResultsViewController *)self showSearchingHereIfNeeded:v11];
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (![(ResultsViewController *)self isShowingOmnipresentSearchBar] && v6)
  {
    self->_tappedTrackingButton = 1;
    id v8 = [(ResultsViewController *)self localSearchViewController];
    double v9 = [v8 refreshSearchHereBusinessController];
    [v9 didStartRespondingToGesture:v10];
  }
}

- (int64_t)floatingControlsOptions
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  id v3 = [v2 containerStyle];

  if (v3 == (id)6) {
    return 191;
  }
  else {
    return 187;
  }
}

- (void)setHideHeader:(BOOL)a3
{
  if (self->_hideHeader != a3)
  {
    self->_hideHeader = a3;
    if (a3) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
    [(ResultsTitleView *)self->_resultsTitleView setAlpha:v4];
    if ([(ResultsViewController *)self isShowingOmnipresentSearchBar]) {
      double v5 = 0.0;
    }
    else {
      double v5 = v4;
    }
    [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:v5];
    [(RefinementsBarUIView *)self->_refinementsBar setAlpha:v4];
    [(ResultsViewController *)self _updateLoadingErrorFrames];
  }
}

- (void)setHideRefinementsBar:(BOOL)a3
{
  BOOL v3 = a3;
  -[RefinementsBarUIView setHidden:](self->_refinementsBar, "setHidden:");
  if (v3)
  {
    self->_lastRefinementOriginType = 0;
    [(ResultsViewController *)self resetRefinementsSequenceNumber];
    [(RefinementsBarUIView *)self->_refinementsBar setViewModel:0];
    refinementsBarZeroHeight = self->_refinementsBarZeroHeight;
    double v5 = +[NSArray arrayWithObjects:&refinementsBarZeroHeight count:1];
    +[NSLayoutConstraint activateConstraints:v5];
  }
  else
  {
    uint64_t v7 = self->_refinementsBarZeroHeight;
    double v5 = +[NSArray arrayWithObjects:&v7 count:1];
    +[NSLayoutConstraint deactivateConstraints:v5];
  }

  BOOL v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 updateHeightForCurrentLayout];
}

- (void)resetRefinementsSequenceNumber
{
}

- (void)configureHeader
{
  BOOL v3 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v7 = -[ContainerHeaderView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v7;

  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  if (![(ResultsViewController *)self isShowingOmnipresentSearchBar])
  {
    double v9 = -[ResultsTitleView initWithFrame:]([ResultsTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    resultsTitleView = self->_resultsTitleView;
    self->_resultsTitleView = v9;

    [(ResultsTitleView *)self->_resultsTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ResultsTitleView *)self->_resultsTitleView setDelegate:self];
  }
  id v11 = objc_alloc_init(_TtC4Maps20RefinementsBarUIView);
  refinementsBar = self->_refinementsBar;
  self->_refinementsBar = v11;

  [(RefinementsBarUIView *)self->_refinementsBar setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [(RefinementsBarUIView *)self->_refinementsBar heightAnchor];
  CFStringRef v14 = [v13 constraintEqualToConstant:0.0];
  refinementsBarZeroHeight = self->_refinementsBarZeroHeight;
  self->_refinementsBarZeroHeight = v14;

  [(ResultsViewController *)self setHideRefinementsBar:1];
  id v16 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v17 = [(ResultsViewController *)self isShowingOmnipresentSearchBar];
  id v18 = self->_containerHeaderView;
  CFStringRef v44 = v16;
  if (v17)
  {
    [(ContainerHeaderView *)v18 setButtonHidden:1];
    [(ContainerHeaderView *)self->_containerHeaderView setTitleView:self->_refinementsBar];
    [(ContainerHeaderView *)self->_containerHeaderView setTitleViewIgnoresButton:1];
    -[ContainerHeaderView setTitleViewInsets:](self->_containerHeaderView, "setTitleViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    unsigned int v19 = [(RefinementsBarUIView *)self->_refinementsBar trailingAnchor];
    double v20 = [(ContainerHeaderView *)self->_containerHeaderView trailingAnchor];
    unsigned int v21 = [v19 constraintEqualToAnchor:v20];
    [v16 addObject:v21];
  }
  else
  {
    [(ContainerHeaderView *)v18 setTitleView:self->_resultsTitleView subtitleView:self->_refinementsBar verticalSpaceBetweenViews:-4.0];
  }
  if ([(ResultsViewController *)self isShowingOmnipresentSearchBar]) {
    double v22 = 1.0;
  }
  else {
    double v22 = 82.0;
  }
  id v23 = [(ContaineeViewController *)self headerView];
  [v23 addSubview:self->_containerHeaderView];

  id v43 = [(ContainerHeaderView *)self->_containerHeaderView heightAnchor];
  long long v42 = [v43 constraintGreaterThanOrEqualToConstant:v22];
  v45[0] = v42;
  CFStringRef v40 = [(ContainerHeaderView *)self->_containerHeaderView leadingAnchor];
  long long v41 = [(ContaineeViewController *)self headerView];
  uint64_t v39 = [v41 leadingAnchor];
  CFStringRef v38 = [v40 constraintEqualToAnchor:v39];
  v45[1] = v38;
  id v36 = [(ContainerHeaderView *)self->_containerHeaderView trailingAnchor];
  uint64_t v37 = [(ContaineeViewController *)self headerView];
  id v35 = [v37 trailingAnchor];
  char v34 = [v36 constraintEqualToAnchor:v35];
  v45[2] = v34;
  int v24 = [(ContainerHeaderView *)self->_containerHeaderView topAnchor];
  id v25 = [(ContaineeViewController *)self headerView];
  uint64_t v26 = [v25 topAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];
  v45[3] = v27;
  unsigned __int8 v28 = [(ContainerHeaderView *)self->_containerHeaderView bottomAnchor];
  long long v29 = [(ContaineeViewController *)self headerView];
  long long v30 = [v29 bottomAnchor];
  long long v31 = [v28 constraintEqualToAnchor:v30];
  long long v32 = self->_refinementsBarZeroHeight;
  v45[4] = v31;
  v45[5] = v32;
  long long v33 = +[NSArray arrayWithObjects:v45 count:6];
  [v44 addObjectsFromArray:v33];

  +[NSLayoutConstraint activateConstraints:v44];
}

- (void)editSearchButtonTapped
{
  if ([(ResultsViewController *)self isPresentingAddStopResultsFromWaypointEditor])
  {
    [(ResultsViewController *)self handleDismissAction:0];
  }
  else
  {
    [(ResultsViewController *)self setResultsList:0];
    [(ResultsViewController *)self resetRefinementsSequenceNumber];
    id v5 = [(ResultsViewController *)self searchSession];
    BOOL v3 = [(ControlContaineeViewController *)self delegate];
    double v4 = [v5 searchFieldItem];
    [v3 presentSearchAndRestoreSearchItem:v4];
  }
}

- (VKVenueFeatureMarker)venueWithFocus
{
  v2 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v2 venuesManager];
  double v4 = [v3 venueWithFocus];

  return (VKVenueFeatureMarker *)v4;
}

- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3
{
  double v4 = [(ControlContaineeViewController *)self delegate];
  id v5 = [v4 currentViewController];

  if (v5 == self)
  {
    BOOL v6 = +[MKMapService sharedService];
    [v6 captureUserAction:2011 onTarget:[self currentUITargetForAnalytics] eventValue:0];

    id v7 = [(ControlContaineeViewController *)self delegate];
    [v7 refreshCurrentSearch];
  }
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  id v4 = [(ControlContaineeViewController *)self delegate];
  BOOL v3 = [v4 venuesManager];
  [v3 presentPlaceCardForVenueWithFocusAndAddToHistory:1 source:7 centeringOnVenue:0];
}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v5 = (unint64_t)[v4 containerStyle];

  [(ResultsViewController *)self updateLocalSearchViewInsets];
  BOOL v6 = [(ResultsViewController *)self localSearchViewController];
  id v7 = [v6 view];

  id v8 = [v7 superview];

  if (v5 <= 5 && ((0x3Au >> v5) & 1) != 0 && !v8)
  {
    [(ResultsViewController *)self addChildViewController:self->_localSearchViewController];
    [(LocalSearchViewController *)self->_localSearchViewController didMoveToParentViewController:self];
  }
  [(ResultsViewController *)self _localSearchViewControllerDidChange:v9];
}

- (void)localSearchViewControllerSizeDidChange:(id)a3
{
  id v4 = a3;
  [(ResultsViewController *)self updateLocalSearchViewInsets];
  [(ResultsViewController *)self _localSearchViewControllerDidChange:v4];
}

- (void)_localSearchViewControllerDidChange:(id)a3
{
  if ([a3 shouldBeVisible])
  {
    [(ResultsViewController *)self showError:0];
  }
}

- (void)updateLocalSearchViewInsets
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 bottomSafeOffset];
  -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v11.receiver = self;
  v11.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v11 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  id v7 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v7 setTarget:[(ResultsViewController *)self currentUITargetForAnalytics]];
  if (y <= 0.0) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 8;
  }
  [(SearchSessionAnalytics *)v7 setAction:v8];
  id v9 = +[MKMapService sharedService];
  [v9 captureUserAction:v8 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v10 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v10 collectSearchSessionAnalytics:v7];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ResultsViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];
}

- (ResultsViewControllerDelegate)resultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);

  return (ResultsViewControllerDelegate *)WeakRetained;
}

- (void)setResultsDelegate:(id)a3
{
}

- (BOOL)isPresentingAddStopResultsFromWaypointEditor
{
  return self->_isPresentingAddStopResultsFromWaypointEditor;
}

- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3
{
  self->_isPresentingAddStopResultsFromWaypointEditor = a3;
}

- (NSArray)resultsList
{
  return self->_resultsList;
}

- (BOOL)hideHeader
{
  return self->_hideHeader;
}

- (NSNumber)refinementsSelectionSequenceNumber
{
  return self->_refinementsSelectionSequenceNumber;
}

- (void)setRefinementsSelectionSequenceNumber:(id)a3
{
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (void)setContaineeLayout:(unint64_t)a3
{
  self->_containeeLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementsSelectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_resultsList, 0);
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_imageTitleView, 0);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_searchResultsDataSource, 0);
  objc_storeStrong((id *)&self->_refinementsBarZeroHeight, 0);
  objc_storeStrong((id *)&self->_refinementsBar, 0);
  objc_storeStrong((id *)&self->_refinementsController, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);

  objc_storeStrong((id *)&self->_currentDataSource, 0);
}

@end