@interface SearchManager
- (BOOL)_shouldEnableRAPForNoResultsWithError:(id)a3;
- (GEOMapServiceTraits)activeTraits;
- (MKMapServiceTicket)activeSearchTicket;
- (SearchFieldItem)searchFieldItem;
- (SearchManagerDelegate)delegate;
- (id)closestSearchResultOfType:(unsigned int)a3 fromSearchResults:(id)a4;
- (id)correctedSearchResultsFrom:(id)a3;
- (id)orderedSearchResults:(id)a3 itemsToFrame:(id)a4;
- (void)_forwardGeocodeAddress:(id)a3 addressString:(id)a4 addressBookAddress:(id)a5 label:(id)a6 defaultSearchResultType:(unsigned int)a7 traits:(id)a8 source:(int)a9;
- (void)_handleGeocoderError:(id)a3;
- (void)_resolveRefinementForSearch:(id)a3 atIndex:(unint64_t)a4;
- (void)_searchCanceled;
- (void)_searchFailedWithError:(id)a3;
- (void)_searchFailedWithError:(id)a3 ticket:(id)a4 enableStructuredRAPAffordance:(BOOL)a5;
- (void)_searchForAddress:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6;
- (void)_searchForAddress:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForAddressString:(id)a3 label:(id)a4 defaultSearchResultType:(unsigned int)a5 traits:(id)a6 source:(int)a7;
- (void)_searchForAutocompletePerson:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForBookmarkSearchResult:(id)a3 origin:(int64_t)a4;
- (void)_searchForCategory:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 source:(int)a6 maxResults:(unsigned int)a7;
- (void)_searchForChildPlace:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForCompletion:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForContactAddressedForAutocompletePerson:(id)a3 searchResults:(id)a4 traits:(id)a5 source:(int)a6;
- (void)_searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7 traits:(id)a8 source:(int)a9;
- (void)_searchForHistoryItem:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6 isRedoOrAutoRedoSearch:(BOOL)a7;
- (void)_searchForMapKitHandle:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForPlaceCategoryItem:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForSearchInfo:(id)a3 completedQuery:(id)a4;
- (void)_searchForSearchResults:(id)a3 completedQuery:(id)a4;
- (void)_searchForString:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 completedQuery:(id)a6 retainedSearchMetadata:(id)a7 source:(int)a8;
- (void)_searchForSuggestion:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchForVenueCategoryItem:(id)a3 traits:(id)a4 source:(int)a5;
- (void)_searchReceivedResults:(id)a3;
- (void)_submitCategorySearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5;
- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6;
- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6 completionTitle:(id)a7;
- (void)_submitTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5;
- (void)_submitTicketForSearchForCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 traits:(id)a6 defaultSearchResultType:(unsigned int)a7 source:(int)a8 maxResults:(unsigned int)a9;
- (void)cancelSearch;
- (void)dealloc;
- (void)reset;
- (void)searchForSearchFieldItem:(id)a3 traits:(id)a4 source:(int)a5 isRedoOrAutoRedoSearch:(BOOL)a6 searchSessionData:(id)a7;
- (void)setActiveSearchTicket:(id)a3;
- (void)setActiveTraits:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchFieldItem:(id)a3;
@end

@implementation SearchManager

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(SearchManager *)self activeSearchTicket];
    v6 = [(SearchManager *)self searchFieldItem];
    *(_DWORD *)buf = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Dealloc is called. %@: SearchFieldItem: %@: ", buf, 0x16u);
  }
  [(SearchManager *)self cancelSearch];
  [(SearchManager *)self reset];
  v7.receiver = self;
  v7.super_class = (Class)SearchManager;
  [(SearchManager *)&v7 dealloc];
}

- (void)reset
{
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = +[NSThread callStackSymbols];
    searchSessionData = self->_searchSessionData;
    v6 = [(SearchManager *)self searchFieldItem];
    objc_super v7 = [(SearchManager *)self activeSearchTicket];
    int v9 = 138413058;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    v12 = searchSessionData;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Reset is called. Call stack: %@. Search Session: %@, Search field: %@, active ticket: %@", (uint8_t *)&v9, 0x2Au);
  }
  activeTraits = self->_activeTraits;
  self->_activeTraits = 0;

  [(SearchManager *)self cancelSearch];
  [(SearchManager *)self setSearchFieldItem:0];
}

- (void)_submitCategorySearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5
{
  id v7 = a3;
  v8 = [(SearchManager *)self delegate];
  int v9 = [(SearchManager *)self searchFieldItem];
  [v8 searchManager:self willProcessSearchFieldItem:v9];

  [(SearchManager *)self setActiveSearchTicket:v7];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100103B7C;
  v19[4] = sub_100104648;
  id v20 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003D3624;
  v18[3] = &unk_1012E83B0;
  v18[4] = v19;
  __int16 v10 = objc_retainBlock(v18);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003D36C0;
  v13[3] = &unk_1012E83D8;
  objc_copyWeak(&v15, &location);
  id v11 = v7;
  id v14 = v11;
  unsigned int v16 = a4;
  [v11 submitWithRefinedHandler:v13 networkActivity:v10];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v19, 8);
}

- (void)_submitTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5
{
  id v7 = a3;
  [(SearchManager *)self reset];
  v8 = [(SearchManager *)self delegate];
  int v9 = [(SearchManager *)self searchFieldItem];
  [v8 searchManager:self willProcessSearchFieldItem:v9];

  [(SearchManager *)self setActiveSearchTicket:v7];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_100103B7C;
  v21[4] = sub_100104648;
  id v22 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003D39F4;
  v20[3] = &unk_1012E83B0;
  v20[4] = v21;
  __int16 v10 = objc_retainBlock(v20);
  __int16 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1003D3A90;
  unsigned int v16 = &unk_1012E8400;
  v17 = self;
  id v11 = v7;
  id v18 = v11;
  unsigned int v19 = a4;
  [v11 submitWithHandler:&v13 networkActivity:v10];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  _Block_object_dispose(v21, 8);
}

- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6
{
}

- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6 completionTitle:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  [(SearchManager *)self reset];
  uint64_t v14 = [(SearchManager *)self delegate];
  id v15 = [(SearchManager *)self searchFieldItem];
  [v14 searchManager:self willProcessSearchFieldItem:v15];

  [(SearchManager *)self setActiveSearchTicket:v12];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100103B7C;
  v28[4] = sub_100104648;
  id v29 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1003D3E24;
  v27[3] = &unk_1012E83B0;
  v27[4] = v28;
  unsigned int v16 = objc_retainBlock(v27);
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003D3EC0;
  v20[3] = &unk_1012E8428;
  objc_copyWeak(v23, &location);
  id v17 = v12;
  unsigned int v24 = a4;
  BOOL v25 = a5;
  id v21 = v17;
  v23[1] = (id)a6;
  id v18 = v13;
  id v22 = v18;
  [v17 submitWithRefinedHandler:v20 networkActivity:v16];
  unsigned int v19 = +[NSNotificationCenter defaultCenter];
  [v19 postNotificationName:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
}

- (void)searchForSearchFieldItem:(id)a3 traits:(id)a4 source:(int)a5 isRedoOrAutoRedoSearch:(BOOL)a6 searchSessionData:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v65 = [v12 address];
  uint64_t v64 = [v12 searchResult];
  v63 = [v12 completion];
  uint64_t v71 = [v12 suggestion];
  v70 = [v12 currentCategory];
  id v15 = [v12 historyItem];
  v72 = [v12 externalURLQuery];
  v69 = [v12 venueCategoryItem];
  v68 = [v12 placeCategoryItem];
  v67 = [v12 childPlace];
  v66 = [v12 mapKitHandle];
  v62 = [v12 addressString];
  v61 = [v12 autocompletePerson];
  [(SearchManager *)self setSearchFieldItem:v12];
  objc_storeStrong((id *)&self->_searchSessionData, a7);
  if (MapsFeature_IsEnabled_OptimizeSearchResultComponents())
  {
    unsigned int v16 = sub_100109E50();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v9;
      id v18 = v14;
      searchSessionData = self->_searchSessionData;
      id v20 = [v13 recentAutocompleteSessionData];
      *(_DWORD *)buf = 138412802;
      id v84 = v12;
      __int16 v85 = 2112;
      v86 = searchSessionData;
      id v14 = v18;
      uint64_t v9 = v17;
      __int16 v87 = 2112;
      v88 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Performing optimized search request for: %@, searchSessionData: %@, acSessionData: %@", buf, 0x20u);
    }
    [v13 setOptimizeSearchRequestComponents:1];
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v21 = +[SearchSessionAnalyticsAggregator sharedAggregator];
    id v22 = [v21 collectedAnalytics];
    [v13 setUserActionMetadata:v22];

    v23 = sub_100109E50();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      unsigned int v24 = [v13 userActionMetadata];
      *(_DWORD *)buf = 138412546;
      id v84 = v12;
      __int16 v85 = 2112;
      v86 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Adding search session user action data for %@. \nActions: %@", buf, 0x16u);
    }
  }
  if (!v15)
  {
    v28 = (void *)v71;
    if (v71)
    {
      [(SearchManager *)self _searchForSuggestion:v71 traits:v13 source:v9];
      v27 = v63;
      v26 = (void *)v64;
      goto LABEL_17;
    }
    v27 = v63;
    if (v72)
    {
      id v29 = [v72 query];
      [v72 coordinate];
      double v31 = v30;
      double v33 = v32;
      id v34 = [v72 muid];
      id v35 = [v72 resultProviderId];
      v36 = [v72 contentProvider];
      id v37 = v34;
      v28 = 0;
      -[SearchManager _searchForExternalURLQuery:coordinate:muid:resultProviderId:contentProvider:traits:source:](self, "_searchForExternalURLQuery:coordinate:muid:resultProviderId:contentProvider:traits:source:", v29, v37, v35, v36, v13, 1, v31, v33);

      v26 = (void *)v64;
      goto LABEL_17;
    }
    if (v70)
    {
      unsigned int v39 = [v13 navigating];
      uint64_t v40 = +[MKMapService searchMaxResults];
      v26 = (void *)v64;
      if (v39)
      {
        LODWORD(v59) = v40;
        [(SearchManager *)self _submitTicketForSearchForCategory:v70 searchQuery:0 completionItem:0 traits:v13 defaultSearchResultType:0 source:v9 maxResults:v59];
      }
      else
      {
        [(SearchManager *)self _searchForCategory:v70 traits:v13 defaultSearchResultType:0 source:v9 maxResults:v40];
      }
      goto LABEL_12;
    }
    v26 = (void *)v64;
    if (v69)
    {
      if (![v69 isAutoCompleteCategory])
      {
        [(SearchManager *)self _searchForVenueCategoryItem:v69 traits:v13 source:v9];
        goto LABEL_17;
      }
      v41 = [v69 searchCategory];
      [(SearchManager *)self _searchForCategory:v41 traits:v13 defaultSearchResultType:0 source:v9 maxResults:+[MKMapService venuesCategorySearchMaxResults]];
    }
    else
    {
      if (v68)
      {
        [(SearchManager *)self _searchForPlaceCategoryItem:v68 traits:v13 source:v9];
        goto LABEL_17;
      }
      if (!v63)
      {
        if (v67)
        {
          [(SearchManager *)self _searchForChildPlace:v67 traits:v13 source:v9];
          goto LABEL_17;
        }
        if (v66)
        {
          [(SearchManager *)self _searchForMapKitHandle:v66 traits:v13 source:v9];
          goto LABEL_17;
        }
        if (v64) {
          goto LABEL_17;
        }
        id v60 = v14;
        if (v65)
        {
          [(SearchManager *)self _searchForAddress:v65 traits:v13 source:v9];
        }
        else
        {
          v42 = [v12 coreRecentContact];

          if (v42)
          {
            v43 = [v12 coreRecentContact];
            v44 = [v43 address];

            [(SearchManager *)self _searchForAddressString:v44 label:0 defaultSearchResultType:0 traits:v13 source:v9];
          }
          else if (v62)
          {
            v45 = [v12 addressStringLabel];
            [(SearchManager *)self _searchForAddressString:v62 label:v45 defaultSearchResultType:0 traits:v13 source:v9];
          }
          else if (v61)
          {
            [(SearchManager *)self _searchForAutocompletePerson:v61 traits:v13 source:v9];
          }
          else
          {
            v46 = [v12 searchString];
            if (v46
              || ([v13 searchImplicitFilterInfo],
                  (v46 = objc_claimAutoreleasedReturnValue()) != 0))
            {
            }
            else
            {
              v27 = 0;
              v26 = 0;
              v28 = 0;
              if (([v12 isSpotlightSearch] & 1) == 0) {
                goto LABEL_17;
              }
            }
            v47 = [v12 searchString];
            if ([v13 navigating])
            {
              v48 = [NavigationRouteHistoryInfoProvider alloc];
              v49 = +[MNNavigationService sharedService];
              v50 = [(NavigationRouteHistoryInfoProvider *)v48 initWithNavigationService:v49];

              id v51 = objc_alloc_init((Class)GEOAddStopRouteInfo);
              v52 = [(NavigationRouteHistoryInfoProvider *)v50 originalWaypointRouteRepresentation];
              [v51 setOriginalWaypointRouteRepresentation:v52];

              v53 = [(NavigationRouteHistoryInfoProvider *)v50 legacyRouteRepresentation];
              [v51 setZilchData:v53];

              v54 = [(NavigationRouteHistoryInfoProvider *)v50 sessionState];
              [v51 setSessionState:v54];

              v55 = [(NavigationRouteHistoryInfoProvider *)v50 routeId];
              [v51 setRouteId:v55];

              v56 = [(NavigationRouteHistoryInfoProvider *)v50 routeAttributes];
              [v51 setRouteAttributes:v56];

              [v13 setAddStopRouteInfo:v51];
            }
            v57 = [v12 completedQuery];
            v58 = [v12 retainedSearchMetadata];
            [(SearchManager *)self _searchForString:v47 traits:v13 defaultSearchResultType:0 completedQuery:v57 retainedSearchMetadata:v58 source:v9];
          }
        }
        id v14 = v60;
        id v15 = 0;
        goto LABEL_11;
      }
      if (![v13 navigating])
      {
        [(SearchManager *)self _searchForCompletion:v63 traits:v13 source:v9];
        goto LABEL_17;
      }
      v41 = [v63 queryLine];
      LODWORD(v59) = +[MKMapService searchMaxResults];
      [(SearchManager *)self _submitTicketForSearchForCategory:0 searchQuery:v41 completionItem:v63 traits:v13 defaultSearchResultType:0 source:v9 maxResults:v59];
    }

    goto LABEL_12;
  }
  BOOL v25 = [v15 historyEntry];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1003D4B2C;
  v78[3] = &unk_1012E8450;
  v78[4] = self;
  id v79 = v15;
  id v80 = v13;
  int v81 = v9;
  BOOL v82 = a6;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1003D4B4C;
  v73[3] = &unk_1012E8498;
  v73[4] = self;
  id v74 = v79;
  id v75 = v80;
  int v76 = v9;
  BOOL v77 = a6;
  [v25 ifSearch:v78 ifRoute:&stru_1012E8470 ifPlaceDisplay:v73 ifTransitLineItem:&stru_1012E84B8];

LABEL_11:
  v27 = v63;
  v26 = (void *)v64;
LABEL_12:
  v28 = (void *)v71;
LABEL_17:
  id v38 = [v13 copy];
  [(SearchManager *)self setActiveTraits:v38];
}

- (void)_searchForAutocompletePerson:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  [(SearchManager *)self reset];
  __int16 v10 = [(SearchManager *)self delegate];
  id v11 = [(SearchManager *)self searchFieldItem];
  [v10 searchManager:self willProcessSearchFieldItem:v11];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v14 = [v13 isUsingOfflineMaps];

  if (v14)
  {
    id v15 = sub_100109E50();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Maps is offline, will only build contacts even though we have handle.", buf, 2u);
    }

    goto LABEL_7;
  }
  unsigned int v16 = [v8 handle];

  if (!v16)
  {
LABEL_7:
    [(SearchManager *)self _searchForContactAddressedForAutocompletePerson:v8 searchResults:v12 traits:v9 source:v5];
    goto LABEL_8;
  }
  uint64_t v17 = [_TtC4Maps33SearchFindMyFriendshipCoordinator alloc];
  id v18 = [v8 handle];
  unsigned int v19 = [v18 handle];
  id v20 = [v19 handleIdentifier];
  id v21 = [(SearchFindMyFriendshipCoordinator *)v17 initWith:v20];
  searchFriendshipCoordinator = self->_searchFriendshipCoordinator;
  self->_searchFriendshipCoordinator = v21;

  v23 = self->_searchFriendshipCoordinator;
  unsigned int v24 = [v8 handle];
  BOOL v25 = [v24 handle];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1003D4DD4;
  v26[3] = &unk_1012E8508;
  id v27 = v8;
  v28 = self;
  id v29 = v12;
  id v30 = v9;
  int v31 = v5;
  [(SearchFindMyFriendshipCoordinator *)v23 getLatestLocationsFor:v25 completion:v26];

LABEL_8:
}

- (void)_searchForContactAddressedForAutocompletePerson:(id)a3 searchResults:(id)a4 traits:(id)a5 source:(int)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_10057696C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v9 contact];
    unsigned int v14 = [v13 identifier];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Rev geo addresses for ContactIdentifier:%@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_group_t v15 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = sub_100103B7C;
  v57 = sub_100104648;
  id v58 = [v9 contact];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_100103B7C;
  v52 = sub_100104648;
  id v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_100103B7C;
  v46[4] = sub_100104648;
  id v47 = 0;
  if ([v10 count])
  {
    unsigned int v16 = [v10 firstObject];
    uint64_t v17 = [v16 mapItem];
    id v18 = (void *)v49[5];
    v49[5] = v17;
  }
  id v19 = objc_alloc_init((Class)CNPostalAddressFormatter);
  id v20 = [*(id *)(*((void *)&buf + 1) + 40) postalAddresses];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1003D5878;
  v36[3] = &unk_1012E8558;
  id v21 = v15;
  id v37 = v21;
  id v22 = v19;
  id v38 = v22;
  p_long long buf = &buf;
  id v23 = v11;
  v44 = v46;
  id v39 = v23;
  uint64_t v40 = self;
  id v24 = v9;
  id v41 = v24;
  v45 = &v48;
  id v25 = v10;
  id v42 = v25;
  [v20 enumerateObjectsUsingBlock:v36];

  objc_initWeak(&location, self);
  v26 = dispatch_get_global_queue(25, 0);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1003D5E88;
  v29[3] = &unk_1012E8608;
  objc_copyWeak(&v34, &location);
  v29[4] = self;
  id v30 = v25;
  id v31 = v24;
  double v32 = v46;
  double v33 = &v48;
  id v27 = v24;
  id v28 = v25;
  dispatch_group_notify(v21, v26, v29);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)correctedSearchResultsFrom:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
  uint64_t v5 = sub_1000AC254(v3, &stru_1012E8648);
  if ([v5 count])
  {
    v6 = [v5 firstObject];
    [v4 addObject:v6];
  }
  id v7 = sub_1000AC254(v3, &stru_1012E8668);
  if ([v7 count]) {
    [v4 addObjectsFromArray:v7];
  }
  id v8 = sub_1000AC254(v3, &stru_1012E8688);
  if ([v8 count]) {
    [v4 addObjectsFromArray:v8];
  }
  id v9 = sub_1000AC254(v3, &stru_1012E86A8);
  if ([v9 count]) {
    [v4 addObjectsFromArray:v9];
  }
  id v10 = sub_1000AC254(v3, &stru_1012E86C8);
  if ([v10 count]) {
    [v4 addObjectsFromArray:v10];
  }

  return v4;
}

- (id)orderedSearchResults:(id)a3 itemsToFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  while (1)
  {
    if ([v7 count] == (id)4 || objc_msgSend(v7, "count") == (id)4)
    {
      id v13 = v7;
      goto LABEL_26;
    }
    id v9 = [(SearchManager *)self closestSearchResultOfType:1 fromSearchResults:v8];
    if (v9 && ([v7 containsObject:v9] & 1) == 0)
    {
      [v8 removeObject:v9];
      [v7 addObject:v9];
    }
    if ([v7 count] == (id)4)
    {
      id v14 = v7;
      goto LABEL_25;
    }
    id v10 = [(SearchManager *)self closestSearchResultOfType:2 fromSearchResults:v8];
    if (v10 && ([v7 containsObject:v10] & 1) == 0)
    {
      [v8 removeObject:v10];
      [v7 addObject:v10];
    }
    if ([v7 count] == (id)4)
    {
      id v15 = v7;
      goto LABEL_24;
    }
    id v11 = [(SearchManager *)self closestSearchResultOfType:3 fromSearchResults:v8];
    if (v11 && ([v7 containsObject:v11] & 1) == 0)
    {
      [v8 removeObject:v11];
      [v7 addObject:v11];
    }
    if ([v7 count] == (id)4) {
      break;
    }
    id v12 = [(SearchManager *)self closestSearchResultOfType:0 fromSearchResults:v8];
    if (v12)
    {
      if (([v7 containsObject:v12] & 1) == 0)
      {
        [v8 removeObject:v12];
        [v7 addObject:v12];
      }
    }
  }
  id v16 = v7;

LABEL_24:
LABEL_25:

LABEL_26:

  return v7;
}

- (id)closestSearchResultOfType:(unsigned int)a3 fromSearchResults:(id)a4
{
  id v5 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  id v23[2] = sub_1003D6ABC;
  v23[3] = &unk_1012E86E8;
  unsigned int v24 = a3;
  id v6 = sub_1000AC254(v5, v23);
  if ([v6 count])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = sub_100103B7C;
    id v21 = sub_100104648;
    id v22 = 0;
    id v7 = +[SearchResult currentLocationSearchResult];
    if ([v6 count])
    {
      uint64_t v8 = [v6 firstObject];
      id v9 = (void *)v18[5];
      void v18[5] = v8;

      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x2020000000;
      v16[3] = 0x43E0000000000000;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003D6AF0;
      v12[3] = &unk_1012E8710;
      id v13 = v7;
      id v14 = v16;
      id v15 = &v17;
      [v6 enumerateObjectsUsingBlock:v12];

      _Block_object_dispose(v16, 8);
    }
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_searchForString:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 completedQuery:(id)a6 retainedSearchMetadata:(id)a7 source:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v12 = a4;
  id v13 = a7;
  id v14 = a3;
  [v12 setSource:v8];
  unsigned int v15 = [v12 navigating];
  unsigned int v16 = [v12 searchOriginationType];
  if (v16 <= 3)
  {
    BOOL v17 = (v16 & 0xF) == 0;
    [v12 setSupportDirectionIntentSearch:v17];
    [v12 setSupportUnresolvedDirectionIntent:v17];
    [v12 setSupportStructuredRapAffordance:v17];
  }
  id v18 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v21 = [v18 updatedTraitsForCurrentGarageState:v12];

  uint64_t v19 = +[MKMapService sharedService];
  id v20 = [v19 ticketForSearchQuery:v14 completionItem:0 retainedSearch:v13 traits:v21 searchSessionData:self->_searchSessionData];

  [(SearchManager *)self _submitSearchTicket:v20 defaultSearchResultType:0 saveToHistory:v15 ^ 1 origin:((v8 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForSuggestion:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  [(SearchManager *)self reset];
  [v8 setSource:v5];
  id v10 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v13 = [v10 updatedTraitsForCurrentGarageState:v8];

  id v11 = +[MKMapService sharedService];
  id v12 = [v11 ticketForSearchQuery:&stru_101324E70 completionItem:0 relatedSearchSuggestion:v9 maxResults:[MKMapService searchMaxResults] traits:v13 searchSessionData:self->_searchSessionData];

  [(SearchManager *)self _submitCategorySearchTicket:v12 defaultSearchResultType:0 origin:((v5 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForCategory:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 source:(int)a6 maxResults:(unsigned int)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a3;
  [(SearchManager *)self reset];
  [v12 setSource:v8];
  unsigned int v14 = [v12 searchOriginationType];
  if (v14 <= 3)
  {
    BOOL v15 = (v14 & 0xF) == 0;
    [v12 setSupportDirectionIntentSearch:v15];
    [v12 setSupportUnresolvedDirectionIntent:v15];
    [v12 setSupportStructuredRapAffordance:v15];
  }
  unsigned int v16 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v18 = [v16 updatedTraitsForCurrentGarageState:v12];

  LODWORD(v17) = a7;
  [(SearchManager *)self _submitTicketForSearchForCategory:v13 searchQuery:0 completionItem:0 traits:v18 defaultSearchResultType:v9 source:v8 maxResults:v17];
}

- (void)_submitTicketForSearchForCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 traits:(id)a6 defaultSearchResultType:(unsigned int)a7 source:(int)a8 maxResults:(unsigned int)a9
{
  uint64_t v9 = *(SearchManager **)&a8;
  id v34 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a3;
  if ([v15 navigating])
  {
    uint64_t v17 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
    double v33 = [v17 updatedTraitsForCurrentGarageState:v15];

    id v18 = [NavigationRouteHistoryInfoProvider alloc];
    uint64_t v19 = +[MNNavigationService sharedService];
    id v20 = [(NavigationRouteHistoryInfoProvider *)v18 initWithNavigationService:v19];

    [v33 setSource:v9];
    id v30 = +[MKMapService sharedService];
    id v21 = [v14 geoCompletionItem];
    id v22 = [(NavigationRouteHistoryInfoProvider *)v20 originalWaypointRouteRepresentation];
    uint64_t v23 = [(NavigationRouteHistoryInfoProvider *)v20 legacyRouteRepresentation];
    [(NavigationRouteHistoryInfoProvider *)v20 sessionState];
    int v32 = (int)v9;
    v24 = uint64_t v9 = self;
    [(NavigationRouteHistoryInfoProvider *)v20 routeId];
    id v25 = v31 = v14;
    v26 = [(NavigationRouteHistoryInfoProvider *)v20 routeAttributes];
    LODWORD(v29) = +[MKMapService searchMaxResults];
    id v27 = (void *)v23;
    id v28 = [v30 ticketForSearchAlongRouteWithCategory:v16 searchQuery:v34 completionItem:v21 originalWaypointRouteData:v22 zilchData:v23 sessionState:v24 routeId:v25 routeAttributes:v26 maxResults:v29 traits:v33 searchSessionData:v9->_searchSessionData];

    id v14 = v31;
    self = v9;
    LODWORD(v9) = v32;

    id v16 = v30;
    id v15 = v33;
  }
  else
  {
    id v20 = +[MKMapService sharedService];
    id v28 = [(NavigationRouteHistoryInfoProvider *)v20 ticketForCategory:v16 maxResults:a9 traits:v15 searchSessionData:self->_searchSessionData];
  }

  [(SearchManager *)self _submitCategorySearchTicket:v28 defaultSearchResultType:0 origin:((v9 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForVenueCategoryItem:(id)a3 traits:(id)a4 source:(int)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[MKMapService sharedService];
  id v11 = [v9 searchCategory];
  id v12 = [v9 venueIdentifier];

  [v10 ticketForSearchCategory:v11 venueIdentifier:v12 maxResults:[MKMapService venuesCategorySearchMaxResults] traits:v8];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(SearchManager *)self _submitCategorySearchTicket:v13 defaultSearchResultType:0 origin:((a5 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForPlaceCategoryItem:(id)a3 traits:(id)a4 source:(int)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[MKMapService sharedService];
  id v11 = [v9 searchCategory];
  id v12 = [v9 parentMuid];

  id v13 = [v10 ticketForPlaceLookupWithSearchCategory:v11 parentMuid:v12 traits:v8];

  [(SearchManager *)self _submitCategorySearchTicket:v13 defaultSearchResultType:0 origin:((a5 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForCompletion:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  [v8 setSource:v5];
  id v10 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  id v17 = [v10 updatedTraitsForCurrentGarageState:v8];

  id v11 = +[MKMapService sharedService];
  id v12 = [v9 queryLine];
  id v13 = [v9 geoCompletionItem];
  id v14 = [v11 ticketForSearchQuery:v12 completionItem:v13 traits:v17 searchSessionData:self->_searchSessionData];

  uint64_t v15 = [v17 navigating] ^ 1;
  id v16 = [v9 title];

  [(SearchManager *)self _submitSearchTicket:v14 defaultSearchResultType:0 saveToHistory:v15 origin:((v5 - 6) & 0xFFFFFFF9) == 0 completionTitle:v16];
}

- (void)_searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7 traits:(id)a8 source:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  uint64_t v11 = *(void *)&a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v17 = a8;
  id v18 = a7;
  id v19 = a3;
  id v20 = +[MKMapService sharedService];
  id v21 = [objc_alloc((Class)MKMapItemIdentifier) initWithMUID:a5 resultProviderID:v11 coordinate:latitude longitude:longitude];
  id v22 = [v20 ticketForURLQuery:v19 identifier:v21 resultProviderId:v11 contentProvider:v18 traits:v17 source:v9];

  LODWORD(v9) = [v17 navigating];
  [(SearchManager *)self _submitSearchTicket:v22 defaultSearchResultType:0 saveToHistory:v9 ^ 1 origin:0];
}

- (void)_searchForChildPlace:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  [v8 setSource:v5];
  id v10 = +[MKMapService sharedService];
  id v11 = [v10 ticketForChildPlace:v9 traits:v8];

  [(SearchManager *)self _submitTicket:v11 defaultSearchResultType:0 origin:((v5 - 6) & 0xFFFFFFF9) == 0];
}

- (void)_searchForMapKitHandle:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  [a4 setSource:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003D77B0;
  v9[3] = &unk_1012E8738;
  v9[4] = self;
  +[MKMapItem _mapItemFromHandle:v8 completionHandler:v9];
}

- (void)_forwardGeocodeAddress:(id)a3 addressString:(id)a4 addressBookAddress:(id)a5 label:(id)a6 defaultSearchResultType:(unsigned int)a7 traits:(id)a8 source:(int)a9
{
  id v16 = a3;
  id v35 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  [(SearchManager *)self reset];
  id v20 = [(SearchManager *)self delegate];
  id v21 = [(SearchManager *)self searchFieldItem];
  [v20 searchManager:self willProcessSearchFieldItem:v21];

  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = sub_100103B7C;
  v54 = sub_100104648;
  id v55 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1003D7DB0;
  v44[3] = &unk_1012E8760;
  id v47 = &v50;
  SEL v48 = a2;
  v44[4] = self;
  id v22 = v17;
  id v45 = v22;
  unsigned int v49 = a7;
  id v23 = v18;
  id v46 = v23;
  unsigned int v24 = objc_retainBlock(v44);
  [v19 setSource:a9];
  if (!v22 || ![v22 isValid] || !objc_msgSend(v22, "isMeCard"))
  {
    if (v16)
    {
      uint64_t v29 = +[MKMapService sharedService];
      uint64_t v30 = [v29 ticketForForwardGeocodeAddress:v16 traits:v19];
    }
    else
    {
      if (!v35 || ![v35 length]) {
        goto LABEL_9;
      }
      uint64_t v29 = +[MKMapService sharedService];
      uint64_t v30 = [v29 ticketForForwardGeocodeString:v35 traits:v19];
    }
    id v31 = (void *)v51[5];
    v51[5] = v30;

LABEL_9:
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_100103B7C;
    v37[4] = sub_100104648;
    id v38 = 0;
    int v32 = (void *)v51[5];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1003D80F0;
    v36[3] = &unk_1012E83B0;
    void v36[4] = v37;
    [v32 submitWithRefinedHandler:v24 networkActivity:v36];
    _Block_object_dispose(v37, 8);

    goto LABEL_10;
  }
  id v33 = v16;
  id v34 = +[AddressBookManager sharedManager];
  id v25 = [v22 addressValue];
  v26 = [v25 identifier];
  id v27 = [v34 addressForIdentifier:v26];

  if (v27)
  {
    id v28 = v27;

    id v22 = v28;
  }
  else
  {
    id v27 = 0;
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1003D7FB0;
  v39[3] = &unk_1012E8788;
  id v41 = &v50;
  SEL v42 = a2;
  v39[4] = self;
  unsigned int v43 = a7;
  id v22 = v22;
  id v40 = v22;
  [v22 forwardGeocodeAddress:v39];

  id v16 = v33;
LABEL_10:

  _Block_object_dispose(&v50, 8);
}

- (void)_searchForAddressString:(id)a3 label:(id)a4 defaultSearchResultType:(unsigned int)a5 traits:(id)a6 source:(int)a7
{
  LODWORD(v7) = a7;
  [(SearchManager *)self _forwardGeocodeAddress:0 addressString:a3 addressBookAddress:0 label:a4 defaultSearchResultType:*(void *)&a5 traits:a6 source:v7];
}

- (void)_searchForAddress:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6
{
  id v19 = a5;
  id v9 = a3;
  id v10 = [v9 contact];
  id v11 = [v10 mapsData];

  id v12 = [(SearchManager *)self delegate];
  id v13 = [(SearchManager *)self searchFieldItem];
  [v12 searchManager:self willProcessSearchFieldItem:v13];

  if (v11)
  {
    id v14 = [v9 contact];
    uint64_t v15 = [v14 mapsData];
    id v16 = [v9 compositeName];

    id v17 = +[MKMapItem ticketForMapsDataString:v15 name:v16];

    [(SearchManager *)self _submitSearchTicket:v17 defaultSearchResultType:0 saveToHistory:0 origin:0];
  }
  else
  {
    id v17 = [objc_alloc((Class)GEOAddress) initWithAddressBookAddress:v9];
    LODWORD(v18) = a6;
    [(SearchManager *)self _forwardGeocodeAddress:v17 addressString:0 addressBookAddress:v9 label:0 defaultSearchResultType:0 traits:v19 source:v18];
  }
}

- (void)_searchForSearchInfo:(id)a3 completedQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v9 = [v6 selectedResult];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = [v6 results];
      id v11 = [v12 firstObject];
    }
    id v13 = [v11 title];

    if (v13) {
      [v11 title];
    }
    else {
    id v8 = [v11 singleLineAddress];
    }
  }
  if (([v6 shouldPreserveResults] & 1) == 0)
  {
    [(SearchManager *)self reset];
    [(SearchManager *)self setActiveSearchTicket:0];
    id v14 = [(SearchManager *)self delegate];
    uint64_t v15 = [(SearchManager *)self searchFieldItem];
    [v14 searchManager:self willProcessSearchFieldItem:v15];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003D84F0;
  v17[3] = &unk_1012E5D58;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
}

- (void)_searchForSearchResults:(id)a3 completedQuery:(id)a4
{
  id v6 = a4;
  id v7 = +[SearchInfo searchInfoWithResults:a3];
  [(SearchManager *)self _searchForSearchInfo:v7 completedQuery:v6];
}

- (void)_searchForHistoryItem:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6 isRedoOrAutoRedoSearch:(BOOL)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v48 = 0;
  unsigned int v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  objc_opt_class();
  id v15 = v12;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  id v18 = [v17 historyEntry];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1003D899C;
  v42[3] = &unk_1012E87B0;
  id v45 = &v48;
  int v46 = v8;
  BOOL v47 = a7;
  id v43 = v14;
  v44 = self;
  id v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  id v35 = sub_1003D8A5C;
  v36 = &unk_1012E87F8;
  id v40 = &v48;
  id v37 = self;
  id v19 = v43;
  id v38 = v19;
  int v41 = v8;
  id v20 = v13;
  id v39 = v20;
  [v18 ifSearch:v42 ifRoute:&stru_1012E87D0 ifPlaceDisplay:&v33 ifTransitLineItem:&stru_1012E8818];

  objc_opt_class();
  id v21 = v15;
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  if (v23)
  {
    *((unsigned char *)v49 + 24) = 1;
    unsigned int v24 = [v23 searchResult:v33, v34, v35, v36, v37, v38];
    uint64_t v52 = v24;
    id v25 = +[NSArray arrayWithObjects:&v52 count:1];
    [(SearchManager *)self _searchForSearchResults:v25 completedQuery:v20];
  }
  objc_opt_class();
  id v26 = v21;
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  if (v28)
  {
    *((unsigned char *)v49 + 24) = 1;
    [(SearchManager *)self _searchForAddress:v28 completedQuery:v20 traits:v19 source:v8];
  }
  objc_opt_class();
  id v29 = v26;
  if (objc_opt_isKindOfClass()) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 0;
  }
  id v31 = v30;

  if (v31)
  {
    *((unsigned char *)v49 + 24) = 1;
    int v32 = [v31 address];
    [(SearchManager *)self _searchForAddressString:v32 label:0 defaultSearchResultType:0 traits:v19 source:v8];
  }
  _Block_object_dispose(&v48, 8);
}

- (void)_resolveRefinementForSearch:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = +[SearchInfo searchInfoWithSearchInfo:a3 refinedIndex:a4];
  if (v5)
  {
    [(SearchManager *)self reset];
    [(SearchManager *)self _searchReceivedResults:v5];
  }
  else
  {
    [(SearchManager *)self _searchFailedWithError:0];
  }
}

- (void)_searchForAddress:(id)a3 traits:(id)a4 source:(int)a5
{
}

- (void)_searchForBookmarkSearchResult:(id)a3 origin:(int64_t)a4
{
  id v5 = a3;
  if ([v5 originalType] == 3)
  {
    id v21 = v5;
    id v6 = +[NSArray arrayWithObjects:&v21 count:1];
    [(SearchManager *)self _searchForSearchResults:v6 completedQuery:0];
  }
  else
  {
    [(SearchManager *)self reset];
    [(SearchManager *)self setActiveSearchTicket:0];
    id v7 = [(SearchManager *)self delegate];
    uint64_t v8 = [(SearchManager *)self searchFieldItem];
    [v7 searchManager:self willProcessSearchFieldItem:v8];

    id v6 = +[MKMapService sharedService];
    id v9 = [v6 defaultTraits];
    [v9 setSource:17];
    id v10 = [v5 mapItem];
    id v11 = [v6 ticketForMapItemToRefine:v10 traits:v9];

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = sub_100103B7C;
    v19[4] = sub_100104648;
    id v20 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003D8F60;
    v18[3] = &unk_1012E83B0;
    v18[4] = v19;
    id v12 = objc_retainBlock(v18);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003D8FFC;
    v14[3] = &unk_1012E8840;
    id v15 = v5;
    id v13 = v11;
    id v16 = v13;
    id v17 = self;
    [v13 submitWithRefinedHandler:v14 networkActivity:v12];

    _Block_object_dispose(v19, 8);
  }
}

- (void)cancelSearch
{
  id v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(SearchManager *)self activeSearchTicket];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Search is being cancelled, ticket %@:", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(SearchManager *)self activeSearchTicket];
  [v5 cancel];
}

- (void)_handleGeocoderError:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchManager *)self delegate];
  [v5 searchManager:self didReceiveSearchInfo:0 searchSessionData:0 error:v4];
}

- (void)_searchFailedWithError:(id)a3
{
  id v4 = a3;
  [(SearchManager *)self _searchFailedWithError:v4 ticket:0 enableStructuredRAPAffordance:[(SearchManager *)self _shouldEnableRAPForNoResultsWithError:v4]];
}

- (void)_searchFailedWithError:(id)a3 ticket:(id)a4 enableStructuredRAPAffordance:(BOOL)a5
{
  uint64_t IsEnabled_RAPSydney = a5;
  id v18 = a4;
  id v8 = a3;
  [(SearchManager *)self setActiveSearchTicket:0];
  if (IsEnabled_RAPSydney)
  {
    if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0) {
      uint64_t IsEnabled_RAPSydney = MapsFeature_IsEnabled_RAPSydney();
    }
    else {
      uint64_t IsEnabled_RAPSydney = 0;
    }
  }
  id v9 = [v18 searchAutoRedoThreshold];
  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v18 searchRedoButtonThreshold];
    BOOL v10 = v11 != 0;
  }
  id v12 = [v18 resultRefinementGroup];
  if (v12) {
    char v13 = 1;
  }
  else {
    char v13 = IsEnabled_RAPSydney;
  }
  if ((v13 & 1) != 0 || v10)
  {
    id v14 = +[SearchInfo searchInfoWithResults:&__NSArray0__struct ticket:v18];
  }
  else
  {
    id v14 = 0;
  }

  id v15 = [v18 resultRefinementGroup];
  [v14 setResultRefinementGroup:v15];

  [v14 setEnableStructuredRAPAffordance:IsEnabled_RAPSydney];
  id v16 = [(SearchManager *)self delegate];
  id v17 = [v14 searchSessionData];
  [v16 searchManager:self didReceiveSearchInfo:v14 searchSessionData:v17 error:v8];
}

- (void)_searchCanceled
{
  [(SearchManager *)self setActiveSearchTicket:0];
  id v3 = [(SearchManager *)self delegate];
  [v3 searchManager:self didReceiveSearchInfo:0 searchSessionData:0 error:0];
}

- (void)_searchReceivedResults:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 results];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Search received %@: Search Info: %@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [(SearchManager *)self searchFieldItem];
  [v4 setSearchFieldItem:v7];

  id v8 = [(SearchManager *)self activeTraits];
  [v4 setSearchAlongRoute:[v8 navigating]];

  id v9 = [(SearchManager *)self delegate];
  BOOL v10 = [v4 searchSessionData];
  [v9 searchManager:self didReceiveSearchInfo:v4 searchSessionData:v10 error:0];

  [(SearchManager *)self setActiveSearchTicket:0];
}

- (BOOL)_shouldEnableRAPForNoResultsWithError:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:GEOErrorShouldEnableRAPForNoResultsKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (SearchManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
}

- (MKMapServiceTicket)activeSearchTicket
{
  return self->_activeSearchTicket;
}

- (void)setActiveSearchTicket:(id)a3
{
}

- (GEOMapServiceTraits)activeTraits
{
  return self->_activeTraits;
}

- (void)setActiveTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTraits, 0);
  objc_storeStrong((id *)&self->_activeSearchTicket, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchSessionData, 0);

  objc_storeStrong((id *)&self->_searchFriendshipCoordinator, 0);
}

@end