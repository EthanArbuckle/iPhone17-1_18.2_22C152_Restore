@interface CarNavigationSearchResultsModeController
- (BOOL)_contentNeedsRefreshingForUpdatedLocation:(id)a3;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)showsMapView;
- (BrowseCategory)category;
- (BrowseManager)browseManager;
- (CarNavigationSearchResultsModeController)initWithCategory:(id)a3;
- (CarNavigationSearchResultsModeController)initWithDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4;
- (CarNavigationSearchResultsModeController)initWithMapItems:(id)a3 selectedItemIndex:(unint64_t)a4;
- (CarNavigationSearchResultsModeController)initWithSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4;
- (CarNavigationSearchResultsModeController)initWithSearchSession:(id)a3;
- (CarPlaceCardCardViewController)placeCard;
- (CarSearchResultsCardViewController)sarCard;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredCarFocusEnvironments;
- (SearchSession)searchSession;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC;
- (double)_detourDistanceToMapItem:(id)a3;
- (id)_cardTitle;
- (id)automaticSharingContacts;
- (id)desiredCards;
- (id)etaForCurrentRoute;
- (id)personalizedItemSources;
- (int)currentUsageTarget;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)state;
- (unint64_t)_rowForSearchItem:(id)a3;
- (unint64_t)_validateSelectedIndex:(unint64_t)a3 forCount:(unint64_t)a4;
- (void)_configureCard:(id)a3;
- (void)_displayMapItems;
- (void)_displayPlaceCardForSearchResult:(id)a3;
- (void)_fetchCategoryResults;
- (void)_highlightMapItem:(id)a3;
- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3;
- (void)_updateContext;
- (void)_updateContextAndDisplay;
- (void)_updateDisplay;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)chromeDidEndConfiguringCards:(id)a3;
- (void)chromeDidStartConfiguringCards:(id)a3;
- (void)commonInit;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)handleHardwareBackButtonPressed;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)placeCard:(id)a3 didPresentAlert:(id)a4;
- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4;
- (void)placeCardDidDismissAlert:(id)a3;
- (void)placeCardDidSelectGo:(id)a3;
- (void)placeCardDidSelectHandoff:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5;
- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchSessionDidFail:(id)a3;
- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4;
- (void)searchSessionWillPerformSearch:(id)a3;
- (void)setBrowseManager:(id)a3;
- (void)setCategory:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4;
- (void)setEvChargingAvailabilityVC:(id)a3;
- (void)setMapItems:(id)a3 selectedItemIndex:(unint64_t)a4;
- (void)setPlaceCard:(id)a3;
- (void)setSarCard:(id)a3;
- (void)setSearchInfo:(id)a3;
- (void)setSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4;
- (void)setSearchSession:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CarNavigationSearchResultsModeController

- (CarNavigationSearchResultsModeController)initWithSearchSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarNavigationSearchResultsModeController;
  v5 = [(CarNavigationSearchResultsModeController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CarNavigationSearchResultsModeController *)v5 commonInit];
    [(CarNavigationSearchResultsModeController *)v6 setSearchSession:v4];
  }

  return v6;
}

- (CarNavigationSearchResultsModeController)initWithDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = [(CarNavigationSearchResultsModeController *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    [(CarNavigationSearchResultsModeController *)v7 commonInit];
    [(CarNavigationSearchResultsModeController *)v8 setDestinations:v6 selectedDestinationIndex:a4];
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = [(CarNavigationSearchResultsModeController *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    [(CarNavigationSearchResultsModeController *)v7 commonInit];
    [(CarNavigationSearchResultsModeController *)v8 setSearchResults:v6 selectedResultIndex:a4];
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = [(CarNavigationSearchResultsModeController *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    [(CarNavigationSearchResultsModeController *)v7 commonInit];
    [(CarNavigationSearchResultsModeController *)v8 setMapItems:v6 selectedItemIndex:a4];
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithCategory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarNavigationSearchResultsModeController;
  v5 = [(CarNavigationSearchResultsModeController *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(CarNavigationSearchResultsModeController *)v5 commonInit];
    [(CarNavigationSearchResultsModeController *)v6 setCategory:v4];
  }

  return v6;
}

- (void)commonInit
{
  self->_state = 0;
  v3 = [[CarSearchResultsCardViewController alloc] initWithSearchResults:self->_searchResults cellStyle:2 delegate:self];
  sarCard = self->_sarCard;
  self->_sarCard = v3;
}

- (BrowseManager)browseManager
{
  browseManager = self->_browseManager;
  if (!browseManager)
  {
    id v4 = [[BrowseManager alloc] initWithCacheKey:@"Stark-SAR"];
    v5 = self->_browseManager;
    self->_browseManager = v4;

    [(BrowseManager *)self->_browseManager readCategoriesFromDiskIfNeeded];
    browseManager = self->_browseManager;
  }

  return browseManager;
}

- (void)setSearchInfo:(id)a3
{
  v5 = (SearchInfo *)a3;
  if (self->_searchInfo != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_searchInfo, a3);
    id v6 = [(SearchInfo *)self->_searchInfo results];
    [(CarNavigationSearchResultsModeController *)self setSearchResults:v6 selectedResultIndex:[(SearchInfo *)self->_searchInfo selectedIndex]];

    v5 = v7;
  }
}

- (void)setSearchSession:(id)a3
{
  v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  if (searchSession != v5)
  {
    objc_super v8 = v5;
    [(SearchSession *)searchSession removeObserver:self];
    objc_storeStrong((id *)&self->_searchSession, a3);
    [(SearchSession *)self->_searchSession addObserver:self];
    v7 = [(SearchSession *)self->_searchSession currentResults];
    [(CarNavigationSearchResultsModeController *)self setSearchResults:v7 selectedResultIndex:[(SearchSession *)self->_searchSession selectedResultIndex]];

    v5 = v8;
  }
}

- (void)setDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 objectAtIndexedSubscript:a4];
  objc_super v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = +[MKMapItem carMapItemFromDestination:](MKMapItem, "carMapItemFromDestination:", v14, (void)v18);
        v16 = v15;
        if (v15)
        {
          if (v7 == v14)
          {
            id v17 = v15;

            v7 = v17;
          }
          [v8 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  -[CarNavigationSearchResultsModeController setMapItems:selectedItemIndex:](self, "setMapItems:selectedItemIndex:", v8, [v8 indexOfObject:v7]);
}

- (void)setSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4
{
  id v6 = [a3 carShortenedArray];
  searchResults = self->_searchResults;
  self->_searchResults = v6;

  self->_selectedIndex = [(CarNavigationSearchResultsModeController *)self _validateSelectedIndex:a4 forCount:[(NSArray *)self->_searchResults count]];
  if ([(NSArray *)self->_searchResults count])
  {
    objc_super v8 = [(NSArray *)self->_searchResults valueForKey:@"mapItem"];
    mapItems = self->_mapItems;
    self->_mapItems = v8;
  }
  else
  {
    mapItems = self->_mapItems;
    self->_mapItems = 0;
  }

  [(CarNavigationSearchResultsModeController *)self _updateContextAndDisplay];
}

- (void)setMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 carShortenedArray];
  mapItems = self->_mapItems;
  self->_mapItems = v7;

  self->_selectedIndex = [(CarNavigationSearchResultsModeController *)self _validateSelectedIndex:a4 forCount:[(NSArray *)self->_mapItems count]];
  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  id v10 = +[MKMapItem searchResultsForMapItems:self->_mapItems];
  searchResults = self->_searchResults;
  self->_searchResults = v10;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v16);
        long long v18 = [SearchResult alloc];
        long long v19 = -[SearchResult initWithMapItem:](v18, "initWithMapItem:", v17, (void)v22);
        [v9 addObject:v19];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  long long v20 = (NSArray *)[v9 copy];
  long long v21 = self->_searchResults;
  self->_searchResults = v20;

  [(CarNavigationSearchResultsModeController *)self _updateContextAndDisplay];
}

- (void)setCategory:(id)a3
{
  v5 = (BrowseCategory *)a3;
  if (self->_category != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_category, a3);
    [(CarNavigationSearchResultsModeController *)self _fetchCategoryResults];
    [(CarNavigationSearchResultsModeController *)self _updateContextAndDisplay];
    v5 = v6;
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v6 = @"CarNavigationSearchResultsModeStateResults";
      if (a3 == 1) {
        CFStringRef v6 = @"CarNavigationSearchResultsModeStatePlaceCard";
      }
      if (a3 == 2) {
        CFStringRef v6 = @"CarNavigationSearchResultsModeStateEVAvailability";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SAR: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v8, 0xCu);
    }

    v7 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:1];
  }
}

- (id)_cardTitle
{
  int64_t v3 = [(CarNavigationSearchResultsModeController *)self state];
  switch(v3)
  {
    case 2:
      v7 = +[NSBundle mainBundle];
      uint64_t v8 = [v7 localizedStringForKey:@"Available Now [Carplay EV Charging Availability header]" value:@"localized string not found" table:0];
      goto LABEL_10;
    case 1:
      unint64_t selectedIndex = self->_selectedIndex;
      if (selectedIndex < [(NSArray *)self->_mapItems count])
      {
        CFStringRef v6 = [(NSArray *)self->_mapItems objectAtIndexedSubscript:self->_selectedIndex];
        goto LABEL_9;
      }
      break;
    case 0:
      id v4 = [(CarNavigationSearchResultsModeController *)self category];
      v5 = [v4 name];

      if (v5)
      {
        CFStringRef v6 = [(CarNavigationSearchResultsModeController *)self category];
LABEL_9:
        v7 = v6;
        uint64_t v8 = [v6 name];
        goto LABEL_10;
      }
      id v13 = [(SearchSession *)self->_searchSession searchInfo];
      id v14 = [v13 headerDisplayName];

      searchSession = self->_searchSession;
      if (v14)
      {
        v7 = [(SearchSession *)searchSession searchInfo];
        uint64_t v8 = [v7 headerDisplayName];
        goto LABEL_10;
      }
      v16 = [(SearchSession *)searchSession searchFieldItem];
      uint64_t v17 = [v16 searchString];

      if (v17)
      {
        v7 = [(SearchSession *)self->_searchSession searchFieldItem];
        uint64_t v8 = [v7 searchString];
LABEL_10:
        id v10 = (void *)v8;

        if (v10) {
          goto LABEL_12;
        }
        break;
      }
      long long v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = self->_searchSession;
        int v20 = 138412290;
        long long v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "SAR: failed to find an appropriate title for current search session: %@", (uint8_t *)&v20, 0xCu);
      }

      break;
  }
  id v11 = +[NSBundle mainBundle];
  id v10 = [v11 localizedStringForKey:@"CarPlay_Search_Title" value:@"localized string not found" table:0];

LABEL_12:

  return v10;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
}

- (id)personalizedItemSources
{
  if (self->_customFeaturesSource)
  {
    customFeaturesSource = self->_customFeaturesSource;
    v2 = +[NSArray arrayWithObjects:&customFeaturesSource count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (id)desiredCards
{
  v2 = [(CarNavigationSearchResultsModeController *)self state];
  if ((unint64_t)v2 <= 2)
  {
    CFStringRef v4 = @"primary";
    v2 = +[NSArray arrayWithObjects:&v4 count:1];
  }

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = [(CarNavigationSearchResultsModeController *)self _cardTitle];
  [v5 setTitle:v6];

  HIDWORD(v25) = 0;
  *(_DWORD *)((char *)&v25 + 1) = 0;
  long long v15 = xmmword_100F6F1C0;
  long long v16 = xmmword_100F67600;
  uint64_t v17 = 3;
  uint64_t v18 = 1148846080;
  uint64_t v19 = 2;
  LODWORD(v20) = 1148846080;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v23 = _Q0;
  long long v24 = _Q0;
  LOBYTE(v25) = 1;
  uint64_t v26 = 8;
  LOBYTE(v27) = 0;
  if (v5) {
    [v5 setLayout:&v15];
  }
  [v5 setAccessory:1 v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27];
  int64_t v12 = [(CarNavigationSearchResultsModeController *)self state];
  switch(v12)
  {
    case 2:
      [v5 setContent:self->_evChargingAvailabilityVC];
      break;
    case 1:
      uint64_t v13 = [(CarNavigationSearchResultsModeController *)self placeCard];
      goto LABEL_9;
    case 0:
      uint64_t v13 = [(CarNavigationSearchResultsModeController *)self sarCard];
LABEL_9:
      id v14 = (void *)v13;
      [v5 setContent:v13];

      break;
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  -[CarNavigationSearchResultsModeController _highlightMapItem:](self, "_highlightMapItem:", 0, a4);
  id v5 = +[MKLocationManager sharedLocationManager];
  [v5 stopLocationUpdateWithObserver:self];
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A672F0;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A67468;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  id v5 = a4;
  [v5 addPreparation:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A675A8;
  v6[3] = &unk_1012E7D28;
  v6[4] = self;
  [v5 addCompletion:v6];
}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  id v4 = a3;
  id v5 = [(CarNavigationSearchResultsModeController *)self desiredCards];
  unsigned int v6 = [v4 isEqualToArray:v5];

  if (v6)
  {
    id v7 = [(CarNavigationSearchResultsModeController *)self placeCard];
    [v7 setHasCardFinishedTransitioning:0];
  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  id v4 = a3;
  id v5 = [(CarNavigationSearchResultsModeController *)self desiredCards];
  unsigned int v6 = [v4 isEqualToArray:v5];

  if (v6)
  {
    id v7 = [(CarNavigationSearchResultsModeController *)self placeCard];
    [v7 setHasCardFinishedTransitioning:1];
  }
}

- (void)_configureCard:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CarNavigationSearchResultsModeController *)self state];
  unsigned int v6 = [(CarNavigationSearchResultsModeController *)self _cardTitle];
  [v4 setTitle:v6];

  if (v5)
  {
    id v7 = [(CarNavigationSearchResultsModeController *)self placeCard];
    [v4 setContent:v7];

    HIDWORD(v25) = 0;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    long long v15 = xmmword_100F6F1C0;
    long long v16 = xmmword_100F67600;
    uint64_t v17 = 3;
    uint64_t v18 = 1148846080;
    uint64_t v19 = 2;
    LODWORD(v20) = 1148846080;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v23 = _Q0;
    long long v24 = _Q0;
    LOBYTE(v25) = 1;
    uint64_t v26 = 8;
    LOBYTE(v27) = 0;
    if (v4) {
      [v4 setLayout:&v15];
    }
    [v4 setAccessory:1 v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27];
    [v4 setSelectionHandler:0];
  }
  else
  {
    uint64_t v13 = [(CarNavigationSearchResultsModeController *)self sarCard];
    [v4 setContent:v13];

    memset(v38, 0, sizeof(v38));
    v28[0] = xmmword_100F6F1C0;
    v28[1] = xmmword_100F67600;
    uint64_t v29 = 3;
    uint64_t v30 = 1148846080;
    uint64_t v31 = 2;
    int v32 = 1148846080;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v35 = _Q0;
    long long v36 = _Q0;
    char v37 = 1;
    uint64_t v39 = 8;
    char v40 = 0;
    if (v4) {
      [v4 setLayout:v28];
    }
    [v4 setAccessory:1];
  }
}

- (void)_displayPlaceCardForSearchResult:(id)a3
{
  id v4 = a3;
  if ([(CarNavigationSearchResultsModeController *)self state])
  {
    int64_t v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "SAR: tried to get to .PlaceCard state but not in .Results state, ignoring.", v7, 2u);
    }
  }
  else
  {
    unsigned int v6 = [[CarPlaceCardCardViewController alloc] initWithSearchResult:v4 style:1 dataSource:self delegate:self];
    [(CarNavigationSearchResultsModeController *)self setPlaceCard:v6];

    [(CarNavigationSearchResultsModeController *)self setState:1];
  }
}

- (void)_highlightMapItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
  unsigned int v6 = [v5 mapView];
  objc_initWeak(&location, v6);

  if (v4)
  {
    id v7 = [[PersonalizedMapItemKey alloc] initWithMapItem:v4];
    uint64_t v8 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
    CFStringRef v9 = [v8 customPOIsController];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A67B80;
    v10[3] = &unk_101315938;
    id v11 = v4;
    objc_copyWeak(&v12, &location);
    [v9 customFeatureForKey:v7 completion:v10];
    objc_destroyWeak(&v12);
  }
  else
  {
    id v7 = (PersonalizedMapItemKey *)objc_loadWeakRetained(&location);
    [(PersonalizedMapItemKey *)v7 _deselectLabelMarkerAnimated:1];
  }

  objc_destroyWeak(&location);
}

- (void)_displayMapItems
{
  unint64_t selectedIndex = self->_selectedIndex;
  NSUInteger v4 = [(NSArray *)self->_mapItems count];
  customFeaturesSource = self->_customFeaturesSource;
  if (selectedIndex >= v4)
  {
    [(NavigationCustomFeaturesSource *)customFeaturesSource removeMapItems];
  }
  else
  {
    unsigned int v6 = [(NavigationCustomFeaturesSource *)customFeaturesSource pointsFramer];

    if (!v6)
    {
      id v7 = [(CarNavigationSearchResultsModeController *)self carChromeViewController];
      uint64_t v8 = [v7 navigationDisplay];
      CFStringRef v9 = [v8 cameraController];
      [(NavigationCustomFeaturesSource *)self->_customFeaturesSource setPointsFramer:v9];
    }
    id v10 = self->_customFeaturesSource;
    mapItems = self->_mapItems;
    [(NavigationCustomFeaturesSource *)v10 displayMapItems:mapItems];
  }
}

- (void)_updateDisplay
{
  int64_t v3 = [(CarNavigationSearchResultsModeController *)self sarCard];
  [v3 setSearchResults:self->_searchResults];

  [(CarNavigationSearchResultsModeController *)self _displayMapItems];
}

- (void)_updateContext
{
}

- (void)_updateContextAndDisplay
{
  searchSession = self->_searchSession;
  if (searchSession
    && [(SearchSession *)searchSession selectedResultIndex] != self->_selectedIndex)
  {
    [(CarNavigationSearchResultsModeController *)self _updateContext];
  }
  else
  {
    [(CarNavigationSearchResultsModeController *)self _updateDisplay];
  }
}

- (unint64_t)_validateSelectedIndex:(unint64_t)a3 forCount:(unint64_t)a4
{
  if (a3 >= a4 || a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = a3;
  }
  if (a4) {
    return v5;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_fetchCategoryResults
{
  int64_t v3 = [(CarNavigationSearchResultsModeController *)self category];

  if (v3)
  {
    NSUInteger v4 = [(CarNavigationSearchResultsModeController *)self searchSession];
    unsigned int v5 = [v4 isLoading];

    unsigned int v6 = sub_100015DB4();
    id v7 = (SearchSession *)v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        uint64_t v8 = "SAR: Tried to fetch search results for category, but we're already fetching them.";
        p_super = &v7->super;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, p_super, v10, v8, (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v11 = [(CarNavigationSearchResultsModeController *)self category];
        id v12 = [v11 name];
        int v20 = 138412290;
        uint64_t v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_INFO, "SAR: Started fetching results for category: %@. Creating new searchSesssion.", (uint8_t *)&v20, 0xCu);
      }
      id v7 = [[SearchSession alloc] initWithOrigin:1];
      uint64_t v13 = +[CarDisplayController sharedInstance];
      id v14 = [v13 chromeViewController];
      long long v15 = [v14 navigationAwareTraits];

      if ([v15 navigating]) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 0;
      }
      [v15 setSearchOriginationType:v16];
      [v15 useOnlineToOfflineFailoverRequestModeIfAllowed];
      [(SearchSession *)v7 setTraits:v15];
      [(SearchSession *)v7 setSource:6];
      [(CarNavigationSearchResultsModeController *)self setSearchSession:v7];
      uint64_t v17 = [(CarNavigationSearchResultsModeController *)self category];
      uint64_t v18 = [v17 category];
      uint64_t v19 = +[SearchFieldItem searchFieldItemWithObject:v18];

      [(SearchSession *)v7 startSearch:v19];
    }
  }
  else
  {
    sub_100015DB4();
    id v7 = (SearchSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      uint64_t v8 = "SAR: Tried to fetch search results for category that is nil.";
      p_super = &v7->super;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
}

- (double)_detourDistanceToMapItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 _detourInfo];
  [v5 distanceToPlace];
  if (v6 <= 0.0)
  {
    uint64_t v8 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
    CFStringRef v9 = [v8 mapView];
    os_log_type_t v10 = [v9 userLocation];
    [v10 coordinate];

    [v4 _coordinate];
    CLLocationDegrees v12 = v11;
    [v4 _coordinate];
    CLLocationCoordinate2DMake(v12, v13);
    CLLocationCoordinate2DGetDistanceFrom();
  }
  else
  {
    [v5 distanceToPlace];
  }
  double v14 = v7;

  return v14;
}

- (id)etaForCurrentRoute
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex >= [(NSArray *)self->_mapItems count])
  {
    double v14 = sub_100015DB4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "SAR: failed to find ETA for the mapItem that is currently displayed in the placeCard.", v16, 2u);
    }

    CLLocationDegrees v13 = 0;
  }
  else
  {
    id v4 = [(NSArray *)self->_mapItems objectAtIndexedSubscript:self->_selectedIndex];
    unsigned int v5 = [v4 _detourInfo];

    if (v5)
    {
      double v6 = [v4 _detourInfo];
      [v6 timeToPlace];
      double v8 = v7;

      [(CarNavigationSearchResultsModeController *)self _detourDistanceToMapItem:v4];
      double v10 = v9;
      double v11 = [GuidanceETA alloc];
      CLLocationDegrees v12 = [v4 timeZone];
      CLLocationDegrees v13 = [(GuidanceETA *)v11 initWithRemainingTime:0 remainingDistance:v12 arrivalBatteryCharge:0 destinationTimeZone:v8 transportType:v10];
    }
    else
    {
      CLLocationDegrees v13 = 0;
    }
  }

  return v13;
}

- (id)automaticSharingContacts
{
  return 0;
}

- (void)placeCardDidSelectGo:(id)a3
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex < [(NSArray *)self->_searchResults count])
  {
    unsigned int v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR: placeCard didSelectGo.", v11, 2u);
    }

    if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0
      || MapsFeature_IsEnabled_Maps182())
    {
      double v6 = [(CarNavigationSearchResultsModeController *)self carChromeViewController];
      [v6 captureUserAction:6097 onTarget:[self currentUsageTarget] eventValue:0];

      double v7 = [(CarNavigationSearchResultsModeController *)self carChromeViewController];
      [v7 captureUserAction:3001 onTarget:[self currentUsageTarget] eventValue:0];
    }
    double v8 = +[CarDisplayController sharedInstance];
    double v9 = [(NSArray *)self->_searchResults objectAtIndexedSubscript:self->_selectedIndex];
    double v10 = [v9 mapItem];
    [v8 detourToMapItem:v10];
  }
}

- (void)placeCardDidSelectHandoff:(id)a3
{
  id v4 = a3;
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex < [(NSArray *)self->_searchResults count]
    && ([(NSArray *)self->_searchResults objectAtIndexedSubscript:self->_selectedIndex],
        (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_initWeak(&location, self);
    double v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = [v6 name];
      *(_DWORD *)buf = 138477827;
      uint64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR: handing off to destination: %{private}@", buf, 0xCu);
    }
    double v9 = +[MapsExternalDevice sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A686C4;
    v11[3] = &unk_1012F02B0;
    objc_copyWeak(&v13, &location);
    double v10 = v6;
    CLLocationDegrees v12 = v10;
    [v9 handoffDestination:v10 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    double v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "SAR: couldn't find destination for placeCard handOff.", buf, 2u);
    }
  }
}

- (void)placeCard:(id)a3 didPresentAlert:(id)a4
{
  id v5 = a4;
  double v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = [v5 title];
    int v9 = 138412290;
    double v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR didPresentAlert with title: %@", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
  [v8 setHardwareBackButtonBehavior:1 forContext:self];
}

- (void)placeCardDidDismissAlert:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SAR didDismissAlert", v6, 2u);
  }

  id v5 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
  [v5 setHardwareBackButtonBehavior:0 forContext:self];
}

- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4
{
  [(CarNavigationSearchResultsModeController *)self setEvChargingAvailabilityVC:a4];

  [(CarNavigationSearchResultsModeController *)self setState:2];
}

- (unint64_t)_rowForSearchItem:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  searchResults = self->_searchResults;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A68BEC;
  v11[3] = &unk_1012F7E68;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  [(NSArray *)searchResults enumerateObjectsUsingBlock:v11];
  unint64_t v7 = v15[3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SAR: couldn't find selected/highlighted search result in our _searchResults array.", v10, 2u);
    }

    unint64_t v7 = v15[3];
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5
{
  id v6 = a4;
  if (v6)
  {
    unint64_t v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = [v6 mapItem];
      int v9 = [v8 name];
      int v11 = 138477827;
      id v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR: searchResultsCard:didFocusSearchResult, -> highlighting mapItem %{private}@", (uint8_t *)&v11, 0xCu);
    }
    self->_unint64_t selectedIndex = [(CarNavigationSearchResultsModeController *)self _rowForSearchItem:v6];
    double v10 = [v6 mapItem];
    [(CarNavigationSearchResultsModeController *)self _highlightMapItem:v10];
  }
}

- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4
{
  id v5 = a4;
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = [v5 mapItem];
    double v8 = [v7 name];
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR: searchResultsCard:didSelectSearchItem, presenting PlaceCard for item %@", (uint8_t *)&v10, 0xCu);
  }
  self->_unint64_t selectedIndex = [(CarNavigationSearchResultsModeController *)self _rowForSearchItem:v5];
  int v9 = [v5 mapItem];
  [(CarNavigationSearchResultsModeController *)self _highlightMapItem:v9];

  [(CarNavigationSearchResultsModeController *)self _displayPlaceCardForSearchResult:v5];
}

- (void)handleHardwareBackButtonPressed
{
  int64_t v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SAR handleHardwareBackButtonPressed, dismissing current modal VC.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(CarNavigationSearchResultsModeController *)self placeCard];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A68F70;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, buf);
  [v4 dismissViewControllerAnimated:1 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t v5 = [(CarNavigationSearchResultsModeController *)self state];
    CFStringRef v6 = @"CarNavigationSearchResultsModeStateResults";
    if (v5 == 1) {
      CFStringRef v6 = @"CarNavigationSearchResultsModeStatePlaceCard";
    }
    if (v5 == 2) {
      CFStringRef v6 = @"CarNavigationSearchResultsModeStateEVAvailability";
    }
    int v14 = 138412290;
    CFStringRef v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SAR: closeButtonTapped, currentState: %@", (uint8_t *)&v14, 0xCu);
  }

  int64_t v7 = [(CarNavigationSearchResultsModeController *)self state];
  if (v7 == 2)
  {
    [(CarNavigationSearchResultsModeController *)self setState:1];
    p_super = &self->_evChargingAvailabilityVC->super.super.super;
    self->_evChargingAvailabilityVC = 0;
  }
  else if (v7 == 1)
  {
    [(CarNavigationSearchResultsModeController *)self _highlightMapItem:0];
    [(CarNavigationSearchResultsModeController *)self setState:0];
    int v10 = [(CarNavigationSearchResultsModeController *)self searchSession];
    int v11 = [v10 currentResults];
    id v12 = [v11 count];

    if (v12 != (id)1) {
      return;
    }
    id v13 = +[CarChromeModeCoordinator sharedInstance];
    [v13 popFromContext:self];

    p_super = sub_100015DB4();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "SAR: will remove search results as it had only one search result", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    if (v7) {
      return;
    }
    double v8 = [(CarNavigationSearchResultsModeController *)self searchSession];

    if (v8)
    {
      p_super = [(CarNavigationSearchResultsModeController *)self searchSession];
      [p_super invalidate];
    }
    else
    {
      p_super = +[CarChromeModeCoordinator sharedInstance];
      [p_super popFromContext:self];
    }
  }
}

- (NSArray)preferredCarFocusEnvironments
{
  int64_t state = self->_state;
  if (state == 2)
  {
    id v4 = [(CarNavigationSearchResultsModeController *)self evChargingAvailabilityVC];
    int64_t v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    double v8 = v5;
    CFStringRef v6 = &v8;
  }
  else if (state == 1)
  {
    id v4 = [(CarNavigationSearchResultsModeController *)self placeCard];
    int64_t v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    int v9 = v5;
    CFStringRef v6 = &v9;
  }
  else
  {
    if (state) {
      goto LABEL_8;
    }
    id v4 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
    int64_t v5 = [v4 environmentRepresentingOverlays];
    int v10 = v5;
    CFStringRef v6 = &v10;
  }
  v2 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1, v8, v9, v10);

LABEL_8:

  return (NSArray *)v2;
}

- (NSArray)carFocusOrderSequences
{
  int64_t v3 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  int64_t v5 = [(CarNavigationSearchResultsModeController *)self chromeViewController];
  CFStringRef v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  int64_t v7 = +[NSArray arrayWithObjects:v11 count:2];
  double v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:3];
  id v12 = v8;
  int v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SAR searchSessionWillPerformSearch", v6, 2u);
  }

  int64_t v5 = [(CarNavigationSearchResultsModeController *)self sarCard];
  [v5 reloadSearchStateAnimated:0];
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  int64_t v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = [v4 currentResults];
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR searchSessionDidChangeSearchResults, count: %ld", (uint8_t *)&v12, 0xCu);
  }
  int64_t v7 = [(CarNavigationSearchResultsModeController *)self category];

  if (v7)
  {
    double v8 = +[MKLocationManager sharedLocationManager];
    int v9 = [v8 lastLocation];
    lastFetchedFromLocation = self->_lastFetchedFromLocation;
    self->_lastFetchedFromLocation = v9;
  }
  int v11 = [v4 currentResultsSearchInfo];
  [(CarNavigationSearchResultsModeController *)self setSearchInfo:v11];

  [(CarNavigationSearchResultsModeController *)self _updateDisplay];
}

- (void)searchSessionDidFail:(id)a3
{
  id v4 = a3;
  int64_t v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = [v4 lastError];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR searchSessionDidFail with error: %@", (uint8_t *)&v8, 0xCu);
  }
  [(CarNavigationSearchResultsModeController *)self setSearchInfo:0];
  int64_t v7 = [(CarNavigationSearchResultsModeController *)self sarCard];
  [v7 reloadSearchStateAnimated:1];
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  CFStringRef v6 = (SearchSession *)a3;
  int64_t v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR searchSessionDidInvalidate", v9, 2u);
  }

  if (self->_searchSession == v6)
  {
    self->_searchSession = 0;

    if (a4 != 1)
    {
      int v8 = +[CarChromeModeCoordinator sharedInstance];
      [v8 popFromContext:self];
    }
  }
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v9 = a4;
  if (([v9 isRouteEta] & 1) == 0)
  {
    [v9 coordinate];
    CLLocationDegrees v6 = v5;
    [v9 coordinate];
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
    -[NavigationCustomFeaturesSource setOverriddenPointToFrame:](self->_customFeaturesSource, "setOverriddenPointToFrame:", v8.latitude, v8.longitude);
  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  if ((objc_msgSend(a4, "isRouteEta", a3) & 1) == 0)
  {
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
    customFeaturesSource = self->_customFeaturesSource;
    -[NavigationCustomFeaturesSource setOverriddenPointToFrame:](customFeaturesSource, "setOverriddenPointToFrame:", kCLLocationCoordinate2DInvalid.latitude, longitude);
  }
}

- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CarNavigationSearchResultsModeController *)self category];
  if (v6)
  {
    CLLocationDegrees v7 = (void *)v6;
    CLLocationCoordinate2D v8 = [(CarNavigationSearchResultsModeController *)self searchSession];
    unsigned __int8 v9 = [v8 isLoading];

    if ((v9 & 1) == 0)
    {
      int v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SAR: _reloadContentIfNeededForUpdatedLocation", v11, 2u);
      }

      [(CarNavigationSearchResultsModeController *)self _fetchCategoryResults];
      objc_storeStrong((id *)&self->_lastFetchedFromLocation, a3);
    }
  }
}

- (BOOL)_contentNeedsRefreshingForUpdatedLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CarNavigationSearchResultsModeController *)self category];
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
  id v8 = a3;
  id v4 = [(CarNavigationSearchResultsModeController *)self sarCard];
  [v4 locationManagerUpdatedLocation:v8];

  id v5 = [v8 lastLocation];
  unsigned int v6 = [(CarNavigationSearchResultsModeController *)self _contentNeedsRefreshingForUpdatedLocation:v5];

  if (v6)
  {
    BOOL v7 = [v8 lastLocation];
    [(CarNavigationSearchResultsModeController *)self _reloadContentIfNeededForUpdatedLocation:v7];
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (int)currentUsageTarget
{
  return 1009;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (CarSearchResultsCardViewController)sarCard
{
  return self->_sarCard;
}

- (void)setSarCard:(id)a3
{
}

- (CarPlaceCardCardViewController)placeCard
{
  return self->_placeCard;
}

- (void)setPlaceCard:(id)a3
{
}

- (void)setBrowseManager:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_storeStrong((id *)&self->_sarCard, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);

  objc_storeStrong((id *)&self->_customFeaturesSource, 0);
}

@end