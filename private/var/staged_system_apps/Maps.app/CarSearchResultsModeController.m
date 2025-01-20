@interface CarSearchResultsModeController
- (BOOL)_contentNeedsRefreshingForUpdatedLocation:(id)a3;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)showsMapView;
- (BOOL)wantsNavigationDisplay;
- (BrowseCategory)category;
- (BrowseManager)browseManager;
- (CarSearchResultsCardViewController)searchResultsCard;
- (CarSearchResultsModeController)initWithCategory:(id)a3;
- (CarSearchResultsModeController)initWithCollection:(id)a3;
- (CarSearchResultsModeController)initWithSearchInfo:(id)a3;
- (CarSearchResultsModeController)initWithSearchResults:(id)a3;
- (CarSearchResultsModeController)initWithSearchSession:(id)a3;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredCarFocusEnvironments;
- (NSArray)searchResults;
- (NSString)cardTitle;
- (SearchInfo)searchInfo;
- (SearchSession)searchSession;
- (UIScrollView)pptTestScrollView;
- (id)desiredCards;
- (id)personalizedItemSources;
- (int)backButtonUsageActionToMode:(id)a3;
- (int)currentUsageTarget;
- (void)_cardDidUpdateVisibleCells;
- (void)_fetchCategoryResults;
- (void)_highlightSearchResult:(id)a3;
- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3;
- (void)_setup;
- (void)_setupForCuratedCollection:(id)a3;
- (void)_setupForUserCollection:(id)a3;
- (void)_updateVisibleSearchResults;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureFocusContainerGuideController:(id)a3;
- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5;
- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4;
- (void)searchResultsCardDidUpdateVisibleCells:(id)a3;
- (void)searchSessionDidChangeSearchFieldItem:(id)a3;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchSessionDidFail:(id)a3;
- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4;
- (void)searchSessionWillPerformSearch:(id)a3;
- (void)setBrowseManager:(id)a3;
- (void)setCardTitle:(id)a3;
- (void)setCategory:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setSearchInfo:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSearchResultsCard:(id)a3;
- (void)setSearchSession:(id)a3;
@end

@implementation CarSearchResultsModeController

- (CarSearchResultsModeController)initWithSearchSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = [(CarSearchResultsModeController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CarSearchResultsModeController *)v5 setSearchSession:v4];
    [(CarSearchResultsModeController *)v6 _setup];
  }

  return v6;
}

- (CarSearchResultsModeController)initWithSearchInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = [(CarSearchResultsModeController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CarSearchResultsModeController *)v5 setSearchInfo:v4];
    [(CarSearchResultsModeController *)v6 _setup];
  }

  return v6;
}

- (CarSearchResultsModeController)initWithSearchResults:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = [(CarSearchResultsModeController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CarSearchResultsModeController *)v5 setSearchResults:v4];
    [(CarSearchResultsModeController *)v6 _setup];
  }

  return v6;
}

- (CarSearchResultsModeController)initWithCategory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarSearchResultsModeController;
  v6 = [(CarSearchResultsModeController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    uint64_t v8 = [v5 name];
    cardTitle = v7->_cardTitle;
    v7->_cardTitle = (NSString *)v8;

    [(CarSearchResultsModeController *)v7 _setup];
  }

  return v7;
}

- (CarSearchResultsModeController)initWithCollection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSearchResultsModeController;
  id v5 = [(CarSearchResultsModeController *)&v9 init];
  if (v5)
  {
    if ([v4 handlerType] == (id)4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CarSearchResultsModeController *)v5 _setupForCuratedCollection:v4];
      }
    }
    else
    {
      [(CarSearchResultsModeController *)v5 _setupForUserCollection:v4];
    }
    uint64_t v6 = [v4 title];
    cardTitle = v5->_cardTitle;
    v5->_cardTitle = (NSString *)v6;

    [(CarSearchResultsModeController *)v5 _setup];
  }

  return v5;
}

- (void)_setupForUserCollection:(id)a3
{
  id v3 = a3;
  [v3 setSortType:1];
  id v4 = [v3 content];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [[SearchResult alloc] initWithMapItem:v12];

          [v5 addObject:v13];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];
  [(CarSearchResultsModeController *)self setSearchResults:v14];
}

- (void)_setupForCuratedCollection:(id)a3
{
  id v9 = a3;
  id v4 = [v9 curatedCollectionIdentifier];

  if (v4)
  {
    id v5 = [CuratedCollectionResolver alloc];
    id v6 = [v9 curatedCollectionIdentifier];
    id v7 = [(CuratedCollectionResolver *)v5 initWithCuratedCollectionIdentifier:v6 delegate:self];
    curatedCollectionResolver = self->_curatedCollectionResolver;
    self->_curatedCollectionResolver = v7;
  }
  [(CuratedCollectionResolver *)self->_curatedCollectionResolver resolveCollection];
}

- (void)_setup
{
  id v3 = [[CarSearchResultsCardViewController alloc] initWithSearchResults:self->_searchResults cellStyle:[(SearchInfo *)self->_searchInfo isChainResults] delegate:self];
  searchResultsCard = self->_searchResultsCard;
  self->_searchResultsCard = v3;

  id v5 = +[CarDisplayController sharedInstance];
  id v6 = [v5 chromeViewController];
  id v7 = [v6 currentTraits];
  [(BrowseManager *)self->_browseManager setTraits:v7];

  lastFetchedFromLocation = self->_lastFetchedFromLocation;
  self->_lastFetchedFromLocation = 0;
}

- (BrowseManager)browseManager
{
  browseManager = self->_browseManager;
  if (!browseManager)
  {
    id v4 = [[BrowseManager alloc] initWithCacheKey:@"Stark"];
    id v5 = self->_browseManager;
    self->_browseManager = v4;

    [(BrowseManager *)self->_browseManager readCategoriesFromDiskIfNeeded];
    id v6 = [(CarSearchResultsModeController *)self category];

    browseManager = self->_browseManager;
    if (!v6)
    {
      id v7 = [(BrowseManager *)browseManager cachedCategories];
      id v8 = [v7 lastObject];
      [(CarSearchResultsModeController *)self setCategory:v8];

      browseManager = self->_browseManager;
    }
  }

  return browseManager;
}

- (void)setSearchSession:(id)a3
{
  id v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  if (searchSession != v5)
  {
    v15 = v5;
    [(SearchSession *)searchSession removeObserver:self];
    objc_storeStrong((id *)&self->_searchSession, a3);
    [(SearchSession *)self->_searchSession addObserver:self];
    id v7 = [(SearchSession *)self->_searchSession searchInfo];
    id v8 = [v7 headerDisplayName];
    id v9 = v8;
    if (v8)
    {
      v10 = v8;
      cardTitle = self->_cardTitle;
      self->_cardTitle = v10;
    }
    else
    {
      cardTitle = [(SearchSession *)self->_searchSession searchFieldItem];
      id v12 = [cardTitle searchString];
      v13 = self->_cardTitle;
      self->_cardTitle = v12;
    }
    id v14 = [(SearchSession *)self->_searchSession searchInfo];
    [(CarSearchResultsModeController *)self setSearchInfo:v14];

    id v5 = v15;
  }
}

- (void)setSearchResults:(id)a3
{
  id v9 = a3;
  if (([v9 isEqualToArray:self->_searchResults] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fullSearchResults, a3);
    id v5 = [v9 carShortenedArray];
    searchResults = self->_searchResults;
    self->_searchResults = v5;

    id v7 = [(CarSearchResultsModeController *)self chromeViewController];
    id v8 = [v7 searchPinsManager];
    [v8 setSearchPins:self->_searchResults selectedPin:0 animated:0];

    [(CarSearchResultsCardViewController *)self->_searchResultsCard setSearchResults:self->_searchResults];
  }
}

- (void)setSearchInfo:(id)a3
{
  id v5 = (SearchInfo *)a3;
  if (self->_searchInfo != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_searchInfo, a3);
    id v6 = [(SearchInfo *)self->_searchInfo results];
    [(CarSearchResultsModeController *)self setSearchResults:v6];

    id v5 = v7;
  }
}

- (void)setCardTitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_cardTitle != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_cardTitle, a3);
    id v6 = [(CarSearchResultsModeController *)self chromeViewController];
    [v6 updateCardsForContext:self animated:0];

    id v5 = v7;
  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (void)configureFocusContainerGuideController:(id)a3
{
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  if (![a4 isEqualToString:@"primary"]) {
    goto LABEL_10;
  }
  id v8 = [(CarSearchResultsModeController *)self cardTitle];
  if (v8)
  {
    CFStringRef v4 = [(CarSearchResultsModeController *)self cardTitle];
    if ([v4 length])
    {
      id v9 = [(CarSearchResultsModeController *)self cardTitle];
      [v7 setTitle:v9];

LABEL_6:
      goto LABEL_7;
    }
  }
  v10 = +[NSBundle mainBundle];
  objc_super v11 = [v10 localizedStringForKey:@"CarPlay_Search_Title" value:@"localized string not found" table:0];
  [v7 setTitle:v11];

  if (v8) {
    goto LABEL_6;
  }
LABEL_7:

  [v7 setContent:self->_searchResultsCard];
  HIDWORD(v30) = 0;
  *(_DWORD *)((char *)&v30 + 1) = 0;
  long long v20 = xmmword_100F6F1C0;
  long long v21 = xmmword_100F67600;
  uint64_t v22 = 3;
  uint64_t v23 = 1148846080;
  uint64_t v24 = 2;
  LODWORD(v25) = 1148846080;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v28 = _Q0;
  long long v29 = _Q0;
  LOBYTE(v30) = 1;
  uint64_t v31 = 8;
  LOBYTE(v32) = 0;
  if (v7) {
    [v7 setLayout:&v20];
  }
  [v7 setAccessory:1 v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32];
  long long v17 = [(CarSearchResultsModeController *)self chromeViewController];
  long long v18 = [v17 overlayController];
  long long v19 = [v18 overlayContentView];
  [v19 setAccessibilityViewIsModal:1];

LABEL_10:
}

- (BOOL)wantsNavigationDisplay
{
  return 0;
}

- (id)personalizedItemSources
{
  id v3 = [(CarSearchResultsModeController *)self chromeViewController];
  CFStringRef v4 = [v3 searchPinsManager];

  if (v4)
  {
    id v5 = [(CarSearchResultsModeController *)self chromeViewController];
    id v6 = [v5 searchPinsManager];
    id v7 = [v6 searchResultsItemSource];
    v10 = v7;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  [(CarSearchResultsModeController *)self _fetchCategoryResults];
  id v6 = [(CarSearchResultsModeController *)self chromeViewController];
  id v7 = [v6 searchPinsManager];
  [v7 setSearchPins:self->_searchResults selectedPin:0 animated:0];

  [(CarSearchResultsModeController *)self _cardDidUpdateVisibleCells];
  id v8 = [(CarSearchResultsModeController *)self searchResultsCard];
  id v9 = [v5 isAnimated];

  [v8 reloadSearchStateAnimated:v9];
  v10 = [(CarSearchResultsModeController *)self category];

  if (v10)
  {
    id v11 = +[MKLocationManager sharedLocationManager];
    [v11 startLocationUpdateWithObserver:self];
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  -[CarSearchResultsModeController _highlightSearchResult:](self, "_highlightSearchResult:", 0, a4);
  id v5 = [(CarSearchResultsModeController *)self chromeViewController];
  id v6 = [v5 searchPinsManager];
  [v6 clearSearchPins];

  id v7 = +[MKLocationManager sharedLocationManager];
  [v7 stopLocationUpdateWithObserver:self];
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  CFStringRef v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(CarSearchResultsModeController *)self searchSession];
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Close button tapped to close the top context. Top Context : %@ Search Session: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(CarSearchResultsModeController *)self searchSession];

  if (v6)
  {
    id v7 = [(CarSearchResultsModeController *)self searchSession];
    [v7 invalidate];
  }
  else
  {
    id v7 = +[CarChromeModeCoordinator sharedInstance];
    [v7 popFromContext:self];
  }
}

- (void)_fetchCategoryResults
{
  id v3 = [(CarSearchResultsModeController *)self category];

  if (v3)
  {
    CFStringRef v4 = [(CarSearchResultsModeController *)self searchSession];
    unsigned int v5 = [v4 isLoading];

    id v6 = sub_100015DB4();
    id v7 = (SearchSession *)v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        int v8 = "Search Results: Tried to fetch search results for category, but we're already fetching them.";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v9 = [(CarSearchResultsModeController *)self category];
        __int16 v10 = [v9 name];
        int v17 = 138412290;
        long long v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_INFO, "Search Results: Started fetching results for category: %@. Creating new searchSesssion.", (uint8_t *)&v17, 0xCu);
      }
      id v7 = [[SearchSession alloc] initWithOrigin:1];
      id v11 = +[CarDisplayController sharedInstance];
      id v12 = [v11 chromeViewController];
      v13 = [v12 currentTraits];

      [(SearchSession *)v7 setTraits:v13];
      [(SearchSession *)v7 setSource:6];
      [(CarSearchResultsModeController *)self setSearchSession:v7];
      id v14 = [(CarSearchResultsModeController *)self category];
      v15 = [v14 category];
      long long v16 = +[SearchFieldItem searchFieldItemWithObject:v15];

      [(SearchSession *)v7 startSearch:v16];
    }
  }
  else
  {
    sub_100015DB4();
    id v7 = (SearchSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      int v8 = "Search Results: Tried to fetch search results for category that is nil.";
      goto LABEL_7;
    }
  }
}

- (void)_highlightSearchResult:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CarSearchResultsModeController *)self chromeViewController];
  id v6 = [v5 mapView];
  objc_initWeak(&location, v6);

  if (v4)
  {
    if ([(NSArray *)self->_searchResults containsObject:v4])
    {
      id v7 = [PersonalizedMapItemKey alloc];
      int v8 = [v4 mapItem];
      id v9 = [(PersonalizedMapItemKey *)v7 initWithMapItem:v8];

      __int16 v10 = [(CarSearchResultsModeController *)self chromeViewController];
      id v11 = [v10 customPOIsController];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100538028;
      v12[3] = &unk_1012EE580;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      [v11 customFeatureForKey:v9 completion:v12];

      objc_destroyWeak(&v14);
    }
    else
    {
      id v9 = sub_100015DB4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "SearchResults: Tried to highlight focused search pin, but it wasn't in _searchResults.", buf, 2u);
      }
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained(&location);
    [v9 _deselectLabelMarkerAnimated:1];
  }

  objc_destroyWeak(&location);
}

- (void)_cardDidUpdateVisibleCells
{
  if (!self->_updatingVisibleResults)
  {
    self->_updatingVisibleResults = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v2 = dispatch_time(0, 300000000);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100538224;
    v3[3] = &unk_1012E6708;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_updateVisibleSearchResults
{
  id v3 = [(CarSearchResultsModeController *)self searchResultsCard];
  id v4 = [v3 tableView];
  [v4 _car_indexPathsForVisibleRows];
  unsigned int v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  visibleIndexPaths = self->_visibleIndexPaths;
  self->_visibleIndexPaths = v5;

  if (self->_visibleIndexPaths && !-[NSArray isEqualToArray:](self->_lastFramedIndexPaths, "isEqualToArray:")
    || self->_isFocusChanged)
  {
    id v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSUInteger v8 = [(NSArray *)self->_visibleIndexPaths count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updating visibile search pins on map, new count: %ld", buf, 0xCu);
    }

    id v9 = self->_visibleIndexPaths;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100538458;
    v14[3] = &unk_1012EE5A8;
    v14[4] = self;
    __int16 v10 = sub_100099700(v9, v14);
    id v11 = [(CarSearchResultsModeController *)self chromeViewController];
    id v12 = [v11 mapCameraController];
    LOBYTE(v13) = 0;
    [v12 frameSearchResults:v10 withResultToSelect:0 historyItem:0 suggestedMapRegion:0 minZoom:0 maxZoom:0 disableAdditionalViewportPadding:v13 completion:0];

    objc_storeStrong((id *)&self->_lastFramedIndexPaths, self->_visibleIndexPaths);
    self->_isFocusChanged = 0;
  }
}

- (void)searchResultsCardDidUpdateVisibleCells:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchResults: searchResultsCardDidUpdateVisibleCells", v5, 2u);
  }

  [(CarSearchResultsModeController *)self _cardDidUpdateVisibleCells];
}

- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100015DB4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = [v7 mapItem];
    id v11 = [v10 name];
    int v12 = 138412546;
    uint64_t v13 = v11;
    __int16 v14 = 2048;
    id v15 = [v8 row];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SearchResults: didFocusSearchResult %@, atIndexPath: %ld", (uint8_t *)&v12, 0x16u);
  }
  [(CarSearchResultsModeController *)self _highlightSearchResult:v7];
  self->_isFocusChanged = 1;
  [(CarSearchResultsModeController *)self _cardDidUpdateVisibleCells];
}

- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[CarDisplayController sharedInstance];
  unsigned int v6 = [v5 isCarAppSceneHostingNavigation];

  id v7 = sub_100015DB4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v4 mapItem];
      __int16 v10 = [v9 name];
      int v15 = 138412290;
      NSUInteger v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SearchResults: CarDisplayController will detour to mapItem: %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = +[CarDisplayController sharedInstance];
    int v12 = [v4 mapItem];
    [v11 detourToMapItem:v12];
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = [v4 mapItem];
      __int16 v14 = [v13 name];
      int v15 = 138412290;
      NSUInteger v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SearchResults: CarChromeModeCoordinator will start route planning to mapItem: %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = +[CarChromeModeCoordinator sharedInstance];
    int v12 = [v4 mapItem];
    [v11 displayRoutePlanningForDestination:v12];
  }
}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  id v7 = [(SearchSession *)self->_searchSession searchInfo];
  id v4 = [v7 headerDisplayName];
  if (v4)
  {
    [(CarSearchResultsModeController *)self setCardTitle:v4];
  }
  else
  {
    unsigned int v5 = [(SearchSession *)self->_searchSession searchFieldItem];
    unsigned int v6 = [v5 searchString];
    [(CarSearchResultsModeController *)self setCardTitle:v6];
  }
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v3 = [(CarSearchResultsModeController *)self searchResultsCard];
  [v3 reloadSearchStateAnimated:0];
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v10 = a3;
  id v4 = [(CarSearchResultsModeController *)self category];

  if (v4)
  {
    unsigned int v5 = +[MKLocationManager sharedLocationManager];
    unsigned int v6 = [v5 lastLocation];
    lastFetchedFromLocation = self->_lastFetchedFromLocation;
    self->_lastFetchedFromLocation = v6;
  }
  BOOL v8 = [v10 currentResultsSearchInfo];
  [(CarSearchResultsModeController *)self setSearchInfo:v8];

  id v9 = [(CarSearchResultsModeController *)self searchResultsCard];
  [v9 reloadSearchStateAnimated:1];
}

- (void)searchSessionDidFail:(id)a3
{
  [(CarSearchResultsModeController *)self setSearchInfo:0];
  id v4 = [(CarSearchResultsModeController *)self searchResultsCard];
  [v4 reloadSearchStateAnimated:1];
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  unsigned int v6 = (SearchSession *)a3;
  id v7 = v6;
  if (self->_searchSession == v6)
  {
    self->_searchSession = 0;

    if (a4 != 1)
    {
      BOOL v8 = sub_100015DB4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CarPlay Search mode will pop the top context: %@", (uint8_t *)&v10, 0xCu);
      }

      id v9 = +[CarChromeModeCoordinator sharedInstance];
      [v9 popFromContext:self];
    }
  }
}

- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4
{
  id v6 = a4;
  id v7 = [a3 collectionTitle];
  [(CarSearchResultsModeController *)self setCardTitle:v7];

  BOOL v8 = [v6 collectionItems];

  sub_100099700(v8, &stru_1012EE5E8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(CarSearchResultsModeController *)self setSearchResults:v9];
}

- (NSArray)preferredCarFocusEnvironments
{
  id v3 = [(CarSearchResultsModeController *)self searchResultsCard];
  if (v3)
  {
    id v4 = [(CarSearchResultsModeController *)self searchResultsCard];
    unsigned int v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    BOOL v8 = v5;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)carFocusOrderSequences
{
  id v3 = [(CarSearchResultsModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  unsigned int v5 = [(CarSearchResultsModeController *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  BOOL v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
  int v12 = v8;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [(CarSearchResultsModeController *)self category];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(CarSearchResultsModeController *)self searchSession];
    unsigned __int8 v8 = [v7 isLoading];

    if ((v8 & 1) == 0)
    {
      [(CarSearchResultsModeController *)self _fetchCategoryResults];
      objc_storeStrong((id *)&self->_lastFetchedFromLocation, a3);
    }
  }
}

- (BOOL)_contentNeedsRefreshingForUpdatedLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarSearchResultsModeController *)self category];
  if (v5)
  {
    if (self->_lastFetchedFromLocation)
    {
      [v4 distanceFromLocation:];
      BOOL v7 = v6 > 1000.0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v7 = a3;
  [(CarBaseSearchViewController *)self->_searchResultsCard locationManagerUpdatedLocation:v7];
  id v4 = [v7 lastLocation];
  unsigned int v5 = [(CarSearchResultsModeController *)self _contentNeedsRefreshingForUpdatedLocation:v4];

  if (v5)
  {
    double v6 = [v7 lastLocation];
    [(CarSearchResultsModeController *)self _reloadContentIfNeededForUpdatedLocation:v6];
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (int)backButtonUsageActionToMode:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  return 1011;
}

- (UIScrollView)pptTestScrollView
{
  dispatch_time_t v2 = [(CarSearchResultsModeController *)self searchResultsCard];
  id v3 = [v2 pptTestScrollView];

  return (UIScrollView *)v3;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void)setBrowseManager:(id)a3
{
}

- (NSString)cardTitle
{
  return self->_cardTitle;
}

- (CarSearchResultsCardViewController)searchResultsCard
{
  return self->_searchResultsCard;
}

- (void)setSearchResultsCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsCard, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_curatedCollectionResolver, 0);
  objc_storeStrong((id *)&self->_lastFramedIndexPaths, 0);
  objc_storeStrong((id *)&self->_visibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);

  objc_storeStrong((id *)&self->_fullSearchResults, 0);
}

@end