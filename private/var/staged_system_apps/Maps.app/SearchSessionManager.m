@interface SearchSessionManager
- (ActionCoordination)coordinator;
- (BOOL)isSearchAlongTheRoute;
- (BOOL)singleResultMode;
- (GEOLatLng)searchOriginationPreviousLatlng;
- (GEOObserverHashTable)observers;
- (GEOPDViewportInfo)lastSearchSessionViewport;
- (GEOSearchSessionData)previousSearchSessionData;
- (SearchSession)currentSearchSession;
- (SearchSessionManager)init;
- (SearchSessionManagerDelegate)delegate;
- (id)_spotlightMatchingSearchResult:(id)a3 searchInfo:(id)a4;
- (int64_t)_userInterfaceIdiom;
- (void)_clearSearchField;
- (void)_handleSearchAlongRouteSearchSession:(id)a3;
- (void)_handleUpdateSearchFieldWithSearchFieldItem:(id)a3;
- (void)_presentLoadingResults:(id)a3;
- (void)_searchSessionWillStart:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearLastSearchSessionViewport;
- (void)clearSearchSession;
- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 recentAutocompleteSessionData:(id)a5;
- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 refinementsQuery:(id)a5 recentAutocompleteSessionData:(id)a6;
- (void)refreshedEVChargersReceieved:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5;
- (void)searchSessionDidChangeSearchFieldItem:(id)a3;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchSessionDidFail:(id)a3;
- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4;
- (void)searchSessionWillPerformSearch:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastSearchSessionViewport:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreviousSearchSessionData:(id)a3;
- (void)setSearchOriginationPreviousLatlng:(id)a3;
@end

@implementation SearchSessionManager

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchSessionManager *)self observers];
  [v5 registerObserver:v4];
}

- (SearchSessionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchSessionManager;
  v2 = [(SearchSessionManager *)&v7 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___SearchSessionManagerObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_searchSessionWillStart:" name:@"SearchSessionWillStart" object:0];
  }
  return v2;
}

- (SearchSession)currentSearchSession
{
  return self->_searchSession;
}

- (BOOL)singleResultMode
{
  return [(SearchSession *)self->_searchSession singleResultMode];
}

- (void)setDelegate:(id)a3
{
}

- (void)setCoordinator:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)_searchSessionWillStart:(id)a3
{
  id v4 = [a3 object];
  id v5 = v4;
  if (v4)
  {
    if (self->_searchSession != v4)
    {
      obj = v4;
      unint64_t v6 = [(SearchSession *)v4 origin];
      id v5 = obj;
      if (v6)
      {
        objc_super v7 = [(SearchSession *)obj currentResultsSearchInfo];
        unsigned __int8 v8 = [v7 isSearchAlongRoute];

        id v5 = obj;
        if ((v8 & 1) == 0)
        {
          objc_storeStrong((id *)&self->_searchSession, obj);
          [(SearchSession *)self->_searchSession addObserver:self];
          id v5 = obj;
        }
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchSessionManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4 = a3;
  id v5 = sub_100D74940();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "searchSessionWillPerformSearch: %@", (uint8_t *)&v14, 0xCu);
  }

  if ([(SearchSessionManager *)self isSearchAlongTheRoute])
  {
    [(SearchSessionManager *)self _handleSearchAlongRouteSearchSession:v4];
  }
  else
  {
    unsigned __int8 v6 = [v4 isVenueQuery];
    objc_super v7 = [v4 searchFieldItem];
    if ((v6 & 1) == 0 && ([v4 restoreSingleResult] & 1) == 0)
    {
      if ((id)[(SearchSessionManager *)self _userInterfaceIdiom] != (id)5)
      {
        unsigned __int8 v8 = [(SearchSessionManager *)self coordinator];
        [v8 presentLoadingResults];

        v9 = [(SearchSessionManager *)self coordinator];
        [v9 updateResultsViewContent];
      }
      [(SearchSessionManager *)self _handleUpdateSearchFieldWithSearchFieldItem:v7];
      v10 = [(SearchSessionManager *)self observers];
      [v10 searchSessionManagerSessionWillPerformSearch];
    }
    v11 = [(SearchSessionManager *)self delegate];
    [v11 updateFloatingControlsWithSearchSession:v4];

    v12 = [v7 venueCategoryItem];
    v13 = [(SearchSessionManager *)self coordinator];
    [v13 presentVenueCategoryWithVenueCategoryItem:v12];
  }
}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_100D74940();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "searchSessionDidChangeSearchFieldItem: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(SearchSessionManager *)self isSearchAlongTheRoute])
  {
    [(SearchSessionManager *)self _handleSearchAlongRouteSearchSession:v4];
  }
  else
  {
    if (([v4 isVenueQuery] & 1) == 0)
    {
      unsigned __int8 v6 = [v4 searchFieldItem];
      [(SearchSessionManager *)self _handleUpdateSearchFieldWithSearchFieldItem:v6];
    }
    objc_super v7 = [(SearchSessionManager *)self delegate];
    [v7 updateFloatingControlsWithSearchSession:v4];
  }
}

- (void)refreshedEVChargersReceieved:(id)a3
{
  id v10 = a3;
  id v4 = [(SearchSessionManager *)self observers];
  unsigned int v5 = [v4 searchSessionShouldUpdateEVChargers];

  if (v5)
  {
    unsigned __int8 v6 = [(SearchSessionManager *)self coordinator];
    objc_super v7 = [v6 searchPinsManager];
    [v7 setSearchPins:v10 selectedPin:0 animated:1];

    int v8 = [(SearchSessionManager *)self observers];
    [v8 searchSessionManagerReceiveEVChargersUpdate:v10];

    if ([(SearchSession *)self->_searchSession isVenueQuery])
    {
      id v9 = [(SearchSessionManager *)self delegate];
      [v9 receivedVenueEVChargersUpdate:v10];
    }
  }
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100D74940();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received results for searchSession: %@", buf, 0xCu);
  }

  unsigned __int8 v6 = [v4 searchInfo];
  objc_super v7 = [v6 searchSessionData];
  [(SearchSessionManager *)self setPreviousSearchSessionData:v7];

  if (![(SearchSessionManager *)self isSearchAlongTheRoute])
  {
    int v8 = [v4 searchInfo];
    id v9 = [v8 clientResolvedResult];

    if (v9)
    {
      id v10 = [(SearchSessionManager *)self coordinator];
      v11 = [v8 clientResolvedResult];
      [v10 viewController:0 selectClientResolvedItem:v11 fromSearchInfo:v8 withUserInfo:0];
      goto LABEL_12;
    }
    v12 = [v8 directionIntent];

    if (v12)
    {
      v13 = [(SearchSessionManager *)self coordinator];
      [v13 clearSearch];

      id v10 = [(SearchSessionManager *)self coordinator];
      v11 = [v8 directionIntent];
      int v14 = [v8 results];
      [v10 viewController:0 doDirectionIntent:v11 withSearchResults:v14];
    }
    else
    {
      if (![v8 singlePlaceCollection])
      {
        v16 = [v8 publisher];

        id v10 = [(SearchSessionManager *)self coordinator];
        if (!v16)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100D74EC4;
          v17[3] = &unk_1012E66E0;
          id v18 = v4;
          id v19 = v8;
          v20 = self;
          [v10 deferPresentingMapPopoversInsideBlock:v17];

          id v15 = v18;
          goto LABEL_14;
        }
        v11 = [v8 publisher];
        [v10 viewControllerShowPublisher:v11 replaceViewController:MapsFeature_IsEnabled_SearchAndDiscovery() ^ 1];
LABEL_12:

        if ((id)[(SearchSessionManager *)self _userInterfaceIdiom] != (id)5)
        {
LABEL_15:

          goto LABEL_16;
        }
        id v15 = [(SearchSessionManager *)self observers];
        [v15 searchSessionManagerSessionDidReceiveUpdate];
LABEL_14:

        goto LABEL_15;
      }
      id v10 = [(SearchSessionManager *)self coordinator];
      v11 = [v8 placeCollections];
      int v14 = [v11 firstObject];
      [v10 viewController:0 showFullyClientizedCuratedCollection:v14 replaceViewController:MapsFeature_IsEnabled_SearchAndDiscovery() ^ 1];
    }

    goto LABEL_12;
  }
  [(SearchSessionManager *)self _handleSearchAlongRouteSearchSession:v4];
LABEL_16:
}

- (void)searchSessionDidFail:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100D74940();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SearchSession did fail: %@", (uint8_t *)&v16, 0xCu);
  }

  if ([(SearchSessionManager *)self isSearchAlongTheRoute])
  {
    [(SearchSessionManager *)self _handleSearchAlongRouteSearchSession:v4];
    goto LABEL_11;
  }
  if ((id)[(SearchSessionManager *)self _userInterfaceIdiom] == (id)5)
  {
    unsigned __int8 v6 = [(SearchSessionManager *)self coordinator];
    [v6 presentLoadingResults];
  }
  else
  {
    objc_super v7 = [v4 traits];
    unsigned int v8 = [v7 searchOriginationType];

    if (v8 != 1)
    {
      id v9 = [(SearchSessionManager *)self coordinator];
      unsigned __int8 v10 = [v9 isRoutePlanningPresented];

      if (v10) {
        goto LABEL_11;
      }
    }
  }
  v11 = [(SearchSessionManager *)self observers];
  [v11 searchSessionManagerSessionDidFail];

  v12 = [(SearchSessionManager *)self delegate];
  [v12 updateFloatingControlsWithSearchSession:v4];

  v13 = [v4 lastError];
  id v14 = [v13 code];

  if (v14 == (id)-8)
  {
    id v15 = [(SearchSessionManager *)self coordinator];
    [v15 clearSearchPins];
  }
LABEL_11:
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  unsigned __int8 v6 = (SearchSession *)a3;
  if (self->_searchSession == v6)
  {
    objc_super v7 = sub_100D74940();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412546;
      v11 = v6;
      __int16 v12 = 2048;
      unint64_t v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "searchSessionDidInvalidate: %@. Reason: %lu", (uint8_t *)&v10, 0x16u);
    }

    unsigned int v8 = [(SearchSessionManager *)self coordinator];
    [v8 clearSearch];

    id v9 = [(SearchSessionManager *)self observers];
    [v9 searchSessionManagerSessionDidInvalidate];
  }
}

- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 recentAutocompleteSessionData:(id)a5
{
}

- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 refinementsQuery:(id)a5 recentAutocompleteSessionData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SearchSessionManager *)self coordinator];
  id v15 = [v14 newTraits];

  int v16 = sub_100D74940();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v73 = v10;
    __int16 v74 = 2112;
    *(void *)v75 = v11;
    *(_WORD *)&v75[8] = 2112;
    *(void *)&v75[10] = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Performing search for item: %@. dict: %@. session data: %@", buf, 0x20u);
  }

  id v17 = sub_100577254();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    unsigned int v18 = [v15 timeSinceMapViewportChanged];
    *(_DWORD *)buf = 138412802;
    id v73 = v10;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v18;
    *(_WORD *)&v75[4] = 2112;
    *(void *)&v75[6] = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Performing search for item: %@, timeSinceMapViewportChanged: %u,  session data: %@", buf, 0x1Cu);
  }

  id v19 = [v11 objectForKeyedSubscript:@"SuggestionSearch"];
  unsigned int v67 = [v19 BOOLValue];

  v20 = [v11 objectForKeyedSubscript:@"AutoRedoSearch"];
  unsigned int v71 = [v20 BOOLValue];

  v21 = [v11 objectForKeyedSubscript:@"LowFuelSearch"];
  unsigned int v65 = [v21 BOOLValue];

  id v22 = [v11 objectForKeyedSubscript:@"ReuseSearchSession"];
  unsigned int v66 = [v22 BOOLValue];

  v23 = [v11 objectForKeyedSubscript:@"ResultRefinementsBarSearch"];
  unsigned int v70 = [v23 BOOLValue];

  v24 = [v11 objectForKeyedSubscript:@"SearchAlongRoute"];
  id v25 = [v24 BOOLValue];

  v26 = [v11 objectForKeyedSubscript:@"kAddStopFromWaypointEditor"];
  unsigned int v69 = [v26 BOOLValue];

  v27 = [v11 objectForKeyedSubscript:@"IsServerProvidedWaypoint"];
  id v28 = [v27 BOOLValue];

  v29 = [v11 objectForKeyedSubscript:@"NoHistoryEntry"];

  if (v29)
  {
    v30 = [v11 objectForKeyedSubscript:@"NoHistoryEntry"];
    unsigned int v64 = [v30 BOOLValue] ^ 1;
  }
  else
  {
    unsigned int v64 = 1;
  }
  v68 = v12;
  v31 = [v11 objectForKeyedSubscript:@"GEOMapServiceTraits_Source"];

  if (v31)
  {
    v32 = [v11 objectForKeyedSubscript:@"GEOMapServiceTraits_Source"];
    uint64_t v33 = (uint64_t)[v32 integerValue];
  }
  else
  {
    uint64_t v33 = 2;
  }
  v34 = [(SearchSessionManager *)self coordinator];
  [v34 isTouristHere];
  [v15 setIsTourist:];

  [v15 setNavigating:v25];
  [v15 setSource:v33];
  v35 = [v13 autocompleteSessionData];
  [v15 setRecentAutocompleteSessionData:v35];

  v36 = [v11 objectForKeyedSubscript:@"GEOMapServiceTraits"];

  if (v36)
  {
    uint64_t v37 = [v11 objectForKeyedSubscript:@"GEOMapServiceTraits"];

    id v15 = (id)v37;
  }
  [v15 setSearchOriginationType:0];
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    if ((id)[(SearchSessionManager *)self _userInterfaceIdiom] != (id)5)
    {
      v38 = [v11 objectForKeyedSubscript:@"IsRoutePlanningPresented"];

      if (v38)
      {
        v39 = [v11 objectForKeyedSubscript:@"IsRoutePlanningPresented"];
        unsigned int v40 = [v39 BOOLValue];

        if (v40) {
          [v15 setSearchOriginationType:1];
        }
      }
    }
  }
  if (v25) {
    [v15 setSearchOriginationType:2];
  }
  if ((([v10 isSpotlightSearch] ^ 1 | v71 | v70) & 1) == 0)
  {
    v41 = [v10 punchInDetails];
    v42 = [v41 spotlightEncodedString];
    [v15 setSpotlightSearchPunchinEncodedString:v42];
  }
  v43 = [v11 objectForKeyedSubscript:@"SAROtherEVStationRequest"];

  if (v43)
  {
    [v15 setSearchOriginationType:3];
    id v44 = objc_alloc_init((Class)GEOSearchImplicitFilterInfo);
    [v44 setSearchImplicitType:1];
    v45 = [v11 objectForKeyedSubscript:@"SARImplicitRequestMUID"];
    [v44 setSearchAlongRouteMuid:v45];

    [v15 setSearchImplicitFilterInfo:v44];
  }
  if (v69)
  {
    [v15 setSearchOriginationType:1];
    v46 = [(SearchSessionManager *)self searchOriginationPreviousLatlng];

    if (!v46)
    {
      v47 = [v11 objectForKeyedSubscript:@"kAddStopPreviousLocationLatLng"];
      [(SearchSessionManager *)self setSearchOriginationPreviousLatlng:v47];
    }
    [v15 setSearchOriginationEditingServerWaypoints:v28];
    v48 = [(SearchSessionManager *)self searchOriginationPreviousLatlng];
    [v15 setSearchOriginationPreviousLatlng:v48];
  }
  [v15 addSupportedSearchTierType:1];
  if (MapsFeature_IsEnabled_ShelbyvilleSearch())
  {
    uint64_t Integer = GEOConfigGetInteger();
    if (Integer >= 1)
    {
      uint64_t v50 = Integer;
      [v15 addSupportedSearchTierType:2];
      [v15 setAuxiliaryTierNumResults:v50];
    }
    [v15 addKnownRefinementType:1];
    [v15 addKnownRefinementType:3];
    [v15 addKnownRefinementType:4];
    if (MapsFeature_IsEnabled_SearchAndDiscovery()) {
      [v15 addKnownRefinementType:5];
    }
    [v15 addSupportedPlaceSummaryFormatType:1];
    [v15 addSupportedPlaceSummaryFormatType:2];
    [v15 addSupportedPlaceSummaryFormatType:3];
  }
  [v15 useOnlineToOfflineFailoverRequestModeIfAllowed];
  if (MapsFeature_IsEnabled_HikingiOS())
  {
    uint64_t v51 = 35;
  }
  else if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    uint64_t v51 = 31;
  }
  else
  {
    uint64_t v51 = 28;
  }
  [v15 setPlaceSummaryRevision:v51];
  uint64_t v52 = [(SearchSessionManager *)self lastSearchSessionViewport];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(SearchSessionManager *)self lastSearchSessionViewport];
    v55 = [v54 mapRegion];
    unsigned int v56 = [v55 isValid];

    if (v56)
    {
      v57 = [(SearchSessionManager *)self lastSearchSessionViewport];
      [v15 setPreviousSearchViewport:v57];
    }
  }
  [v15 setResultRefinementQuery:v68];
  if (v67)
  {
    v58 = [v10 suggestion];
    [(SearchSession *)self->_searchSession setSource:v33];
    [(SearchSession *)self->_searchSession suggestionSearch:v58 withTraits:v15];
  }
  else if (v71)
  {
    [v15 setSearchRequestType:2];
    [(SearchSession *)self->_searchSession setSource:v33];
    [(SearchSession *)self->_searchSession redoSearchWithTraits:v15];
  }
  else
  {
    searchSession = self->_searchSession;
    if (!v66 || !searchSession)
    {
      [(SearchSession *)searchSession removeObserver:self];
      [(SearchSession *)self->_searchSession invalidateWithReason:1];
      v60 = self->_searchSession;
      self->_searchSession = 0;

      v61 = [[SearchSession alloc] initWithOrigin:2 * (v33 == 1) options:v65];
      v62 = self->_searchSession;
      self->_searchSession = v61;

      [(SearchSession *)self->_searchSession setTraits:v15];
      [(SearchSession *)self->_searchSession setSource:v33];
      [(SearchSession *)self->_searchSession setShouldCreateHistoryEntry:v64];
      [(SearchSession *)self->_searchSession setIsResultRefinementsBarSearch:v70];
      [(SearchSession *)self->_searchSession setIsAddStopFromWaypointEditor:v69];
      v63 = [(SearchSessionManager *)self previousSearchSessionData];
      [(SearchSession *)self->_searchSession setSearchSessionData:v63];

      [(SearchSession *)self->_searchSession addObserver:self];
      searchSession = self->_searchSession;
    }
    [(SearchSession *)searchSession startSearch:v10];
  }
}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5
{
  searchSession = self->_searchSession;
  id v9 = a4;
  id v12 = a3;
  [(SearchSession *)searchSession removeObserver:self];
  [(SearchSession *)self->_searchSession invalidate];
  id v10 = [[SearchSession alloc] initWithOrigin:a5];
  id v11 = self->_searchSession;
  self->_searchSession = v10;

  [(SearchSession *)self->_searchSession addObserver:self];
  [(SearchSession *)self->_searchSession restoreSearchForItem:v12 withResults:v9];
}

- (void)clearSearchSession
{
  if (self->_searchSession)
  {
    v3 = sub_100D74940();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      searchSession = self->_searchSession;
      int v7 = 138412290;
      unsigned int v8 = searchSession;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleaning search session: %@", (uint8_t *)&v7, 0xCu);
    }

    [(SearchSession *)self->_searchSession invalidate];
    [(SearchSession *)self->_searchSession removeObserver:self];
    unsigned int v5 = self->_searchSession;
    self->_searchSession = 0;

    searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
    self->_searchOriginationPreviousLatlng = 0;
  }
}

- (void)clearLastSearchSessionViewport
{
}

- (void)_handleUpdateSearchFieldWithSearchFieldItem:(id)a3
{
  id v5 = [(SearchSessionManager *)self delegate];
  id v4 = [(SearchSession *)self->_searchSession searchFieldItem];
  [v5 updateSearchFieldWithSearchFieldItem:v4];
}

- (void)_clearSearchField
{
  id v3 = [(SearchSessionManager *)self delegate];
  v2 = objc_alloc_init(SearchFieldItem);
  [v3 updateSearchFieldWithSearchFieldItem:v2];
}

- (int64_t)_userInterfaceIdiom
{
  v2 = [(SearchSessionManager *)self coordinator];
  id v3 = [v2 appCoordinator];
  id v4 = [v3 chromeViewController];
  id v5 = [v4 traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  return (int64_t)v6;
}

- (BOOL)isSearchAlongTheRoute
{
  id v3 = [(SearchSessionManager *)self coordinator];
  id v4 = [v3 appCoordinator];
  if ([v4 isNavigationTurnByTurnOrStepping])
  {
    id v5 = [(SearchSessionManager *)self coordinator];
    id v6 = [v5 appCoordinator];
    int v7 = [v6 navModeController];
    unsigned int v8 = [v7 navActionCoordinator];
    if ([v8 isSearchingAlongTheRoute])
    {
      BOOL v9 = 1;
    }
    else
    {
      id v10 = [(SearchSessionManager *)self currentSearchSession];
      BOOL v9 = [v10 origin] == (id)1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_handleSearchAlongRouteSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastError];

  id v6 = sub_100D74940();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      unsigned int v8 = [v4 lastError];
      int v20 = 138412546;
      id v21 = v4;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SAR: Received error for searchSession: %@, Error: %@", (uint8_t *)&v20, 0x16u);
    }
    BOOL v9 = [(SearchSessionManager *)self coordinator];
    id v10 = [v9 appCoordinator];
    id v11 = [v10 navModeController];
    id v12 = [v11 navActionCoordinator];
    id v13 = [v4 lastError];
    [v12 setCurrentSearchInfo:0 error:v13];
  }
  else
  {
    if (v7)
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SAR: Opening search session %@.", (uint8_t *)&v20, 0xCu);
    }

    BOOL v9 = [v4 searchInfo];
    [v9 setSearchAlongRoute:1];
    id v14 = [v4 searchFieldItem];
    [v9 setSearchFieldItem:v14];

    if ([v4 isSpotlightPunchInSearch])
    {
      id v15 = [(SearchSessionManager *)self _spotlightMatchingSearchResult:v4 searchInfo:v9];
      int v16 = [v9 results];
      id v17 = [v16 indexOfObject:v15];

      if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v18 = [v9 results];
        id v19 = [v18 count];

        if (v17 < v19) {
          [v9 setSelectedIndex:v17];
        }
      }
    }
    id v10 = [(SearchSessionManager *)self coordinator];
    id v11 = [v10 appCoordinator];
    id v12 = [v11 navModeController];
    id v13 = [v12 navActionCoordinator];
    [v13 setCurrentSearchInfo:v9];
  }
}

- (void)_presentLoadingResults:(id)a3
{
  id v5 = a3;
  if (![v5 isSuggestionSearch]
    || ([v5 isRedoOrAutoRedoSearchType] & 1) == 0)
  {
    id v4 = [(SearchSessionManager *)self coordinator];
    [v4 presentLoadingResults];
  }
}

- (id)_spotlightMatchingSearchResult:(id)a3 searchInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[NSMutableArray array];
  v27 = v26 = v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v7 = [v5 currentResults];
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
      id v13 = [v12 mapItem];
      id v14 = [v13 _identifier];
      id v15 = [v6 spotlightMapsIdentifier];
      unsigned __int8 v16 = [v14 isEqual:v15];

      if (v16) {
        break;
      }
      id v17 = [v12 mapItem];
      unsigned int v18 = [v17 _identifier];

      if (v18)
      {
        id v19 = [v12 mapItem];
        int v20 = [v19 _identifier];
        [v27 addObject:v20];
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v22 = v12;
    id v21 = v26;
    [v26 setSpotlightMatchingResultFound:1];

    if (v22) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_11:

    id v21 = v26;
  }
  [v21 setSpotlightMatchingResultFound:0];
  v23 = sub_100D74940();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v6 spotlightMapsIdentifier];
    *(_DWORD *)buf = 138478083;
    uint64_t v33 = v24;
    __int16 v34 = 2113;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Spotlight punch in search result doesn't have the requested muid in the response. MUID is %{private}@ And the search results identifiers are: %{private}@", buf, 0x16u);
  }
  id v22 = 0;
LABEL_16:

  return v22;
}

- (SearchSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchSessionManagerDelegate *)WeakRetained;
}

- (ActionCoordination)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (ActionCoordination *)WeakRetained;
}

- (void)setObservers:(id)a3
{
}

- (GEOPDViewportInfo)lastSearchSessionViewport
{
  return self->_lastSearchSessionViewport;
}

- (void)setLastSearchSessionViewport:(id)a3
{
}

- (GEOLatLng)searchOriginationPreviousLatlng
{
  return self->_searchOriginationPreviousLatlng;
}

- (void)setSearchOriginationPreviousLatlng:(id)a3
{
}

- (GEOSearchSessionData)previousSearchSessionData
{
  return self->_previousSearchSessionData;
}

- (void)setPreviousSearchSessionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_lastSearchSessionViewport, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_searchSession, 0);
}

@end