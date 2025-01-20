@interface SearchSession
+ (SearchSession)currentSearchSession;
+ (void)initialize;
+ (void)performSearchForEngineType:(int)a3 withObserver:(id)a4;
+ (void)setCurrentSearchSession:(id)a3;
- (BOOL)isAddStopFromWaypointEditor;
- (BOOL)isInvalidated;
- (BOOL)isLoading;
- (BOOL)isOptionsLowFuel;
- (BOOL)isRedoOrAutoRedoSearchType;
- (BOOL)isResultRefinementsBarSearch;
- (BOOL)isSingleResultToShowAsPlacecard;
- (BOOL)isSpotlightPunchInSearch;
- (BOOL)isSuggestionSearch;
- (BOOL)isVenueQuery;
- (BOOL)restoreSingleResult;
- (BOOL)shouldBroadcast;
- (BOOL)shouldCreateHistoryEntry;
- (BOOL)singleResultMode;
- (BOOL)spotlightMatchingResultFound;
- (GEOMapServiceTraits)traits;
- (GEORelatedSearchSuggestion)suggestion;
- (GEOSearchSessionData)searchSessionData;
- (NSArray)currentResults;
- (NSError)lastError;
- (NSHashTable)observers;
- (NSString)currentSearchString;
- (NSString)currentUserTypedSearchString;
- (NSString)printedPageSubtitle;
- (NSString)printedPageTitle;
- (NSString)stringToDisplay;
- (OS_dispatch_queue)observersQueue;
- (SearchFieldItem)searchFieldItem;
- (SearchInfo)currentResultsSearchInfo;
- (SearchInfo)searchInfo;
- (SearchInfo)suggestionSearchInfo;
- (SearchManager)searchManager;
- (SearchSession)init;
- (SearchSession)initWithOrigin:(unint64_t)a3;
- (SearchSession)initWithOrigin:(unint64_t)a3 options:(unint64_t)a4;
- (int)source;
- (unint64_t)options;
- (unint64_t)origin;
- (unint64_t)searchRequestType;
- (unint64_t)selectedResultIndex;
- (void)_notifyAllObservers:(id)a3;
- (void)_notifyObservers:(id)a3 block:(id)a4;
- (void)_performSearch;
- (void)_performSearchIfNeeded;
- (void)_processResults:(id)a3;
- (void)_refreshEVChargers:(id)a3;
- (void)_setupTimersToRefreshEVChargers;
- (void)_willProcessSearchFieldItem;
- (void)addObserver:(id)a3;
- (void)becomeCurrent;
- (void)cancelSearch;
- (void)didChangeSearchFieldItem;
- (void)didChangeSearchResults;
- (void)invalidate;
- (void)invalidateWithReason:(unint64_t)a3;
- (void)notifyPPTDidChangeSearchResults;
- (void)notifyToRefreshEVChargers:(id)a3;
- (void)redoSearchWithTraits:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetEVChargerTimers;
- (void)restoreSearchForItem:(id)a3 withResults:(id)a4;
- (void)searchManager:(id)a3 didReceiveSearchInfo:(id)a4 searchSessionData:(id)a5 error:(id)a6;
- (void)searchManager:(id)a3 willProcessSearchFieldItem:(id)a4;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsAddStopFromWaypointEditor:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsResultRefinementsBarSearch:(BOOL)a3;
- (void)setIsSuggestionSearch:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setObserversQueue:(id)a3;
- (void)setOrigin:(unint64_t)a3;
- (void)setRestoreSingleResult:(BOOL)a3;
- (void)setSearchFieldItem:(id)a3;
- (void)setSearchInfo:(id)a3;
- (void)setSearchManager:(id)a3;
- (void)setSearchSessionData:(id)a3;
- (void)setSelectedResultIndex:(unint64_t)a3;
- (void)setShouldBroadcast:(BOOL)a3;
- (void)setShouldCreateHistoryEntry:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setSpotlightMatchingResultFound:(BOOL)a3;
- (void)setSuggestion:(id)a3;
- (void)setSuggestionSearchInfo:(id)a3;
- (void)setTraits:(id)a3;
- (void)showExistingSearchInfo:(id)a3;
- (void)startSearch:(id)a3;
- (void)suggestionSearch:(id)a3 withTraits:(id)a4;
@end

@implementation SearchSession

- (SearchSession)init
{
  return [(SearchSession *)self initWithOrigin:0];
}

- (SearchSession)initWithOrigin:(unint64_t)a3
{
  return [(SearchSession *)self initWithOrigin:a3 options:0];
}

- (SearchSession)initWithOrigin:(unint64_t)a3 options:(unint64_t)a4
{
  v20.receiver = self;
  v20.super_class = (Class)SearchSession;
  v6 = [(SearchSession *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_options = a4;
    v6->_origin = a3;
    v8 = +[UIDevice currentDevice];
    if ([v8 userInterfaceIdiom] == (id)1)
    {

      BOOL v9 = 0;
    }
    else
    {
      v10 = +[UIDevice currentDevice];
      BOOL v9 = [v10 userInterfaceIdiom] != (id)5;
    }
    v7->_shouldBroadcast = v9;
    v11 = objc_alloc_init(SearchManager);
    searchManager = v7->_searchManager;
    v7->_searchManager = v11;

    [(SearchManager *)v7->_searchManager setDelegate:v7];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Maps.SearchSession", 0);
    observersQueue = v7->_observersQueue;
    v7->_observersQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v15;

    uint64_t v17 = +[NSMutableArray array];
    timers = v7->_timers;
    v7->_timers = (NSMutableArray *)v17;
  }
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1004364E4;
    v5[3] = &unk_1012EA3D8;
    v5[4] = a1;
    id v4 = [v3 addObserverForName:@"SearchSessionWillStart" object:0 queue:0 usingBlock:v5];
  }
}

+ (SearchSession)currentSearchSession
{
  id WeakRetained = objc_loadWeakRetained(&qword_10160ECA8);
  unsigned __int8 v3 = [WeakRetained isInvalidated];

  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = objc_loadWeakRetained(&qword_10160ECA8);
  }

  return (SearchSession *)v4;
}

+ (void)setCurrentSearchSession:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&qword_10160ECA8);

  id v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&qword_10160ECA8, obj);
    id v4 = obj;
  }
}

- (void)becomeCurrent
{
}

- (void)startSearch:(id)a3
{
  id v4 = a3;
  v5 = sub_100436738();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchSession %@ : startSearch %@", (uint8_t *)&v7, 0x16u);
  }

  [(SearchSession *)self _assertNotInvalidated];
  [(SearchSession *)self setSearchFieldItem:v4];
  if ([(SearchSession *)self shouldBroadcast])
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"SearchSessionWillStart" object:self];
  }
  [(SearchSession *)self didChangeSearchFieldItem];
  [(SearchSession *)self _performSearchIfNeeded];
}

- (void)suggestionSearch:(id)a3 withTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchSession *)self _assertNotInvalidated];
  v8 = [(SearchSession *)self searchInfo];
  id v9 = [v8 defaultSuggestion];

  if (v9 == v6)
  {
    [(SearchSession *)self setSuggestion:0];
    [(SearchSession *)self setSuggestionSearchInfo:0];
    [(SearchSession *)self setIsSuggestionSearch:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10043693C;
    v16[3] = &unk_1012EA400;
    v16[4] = self;
    [(SearchSession *)self _notifyAllObservers:v16];
    [(SearchSession *)self didChangeSearchResults];
  }
  else
  {
    [(SearchSession *)self setSuggestion:v6];
    [(SearchSession *)self setTraits:v7];
    [(SearchSession *)self setIsSuggestionSearch:1];
    id v10 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v10 setSuggestion:v6];
    searchManager = self->_searchManager;
    v12 = [(SearchSession *)self traits];
    uint64_t v13 = [(SearchSession *)self source];
    BOOL v14 = [(SearchSession *)self isRedoOrAutoRedoSearchType];
    uint64_t v15 = [(SearchSession *)self searchSessionData];
    [(SearchManager *)searchManager searchForSearchFieldItem:v10 traits:v12 source:v13 isRedoOrAutoRedoSearch:v14 searchSessionData:v15];
  }
}

- (void)redoSearchWithTraits:(id)a3
{
  id v4 = a3;
  [(SearchSession *)self _assertNotInvalidated];
  [(SearchSession *)self setTraits:v4];

  id v13 = [(SearchSession *)self searchFieldItem];
  v5 = [(SearchSession *)self suggestion];

  if (v5)
  {
    id v6 = objc_alloc_init(SearchFieldItem);

    id v7 = [(SearchSession *)self suggestion];
    [(SearchFieldItem *)v6 setSuggestion:v7];

    id v13 = v6;
  }
  searchManager = self->_searchManager;
  id v9 = [(SearchSession *)self traits];
  uint64_t v10 = [(SearchSession *)self source];
  BOOL v11 = [(SearchSession *)self isRedoOrAutoRedoSearchType];
  v12 = [(SearchSession *)self searchSessionData];
  [(SearchManager *)searchManager searchForSearchFieldItem:v13 traits:v9 source:v10 isRedoOrAutoRedoSearch:v11 searchSessionData:v12];
}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SearchSession setRestoreSingleResult:](self, "setRestoreSingleResult:", [v7 singleResultMode]);
  [(SearchSession *)self _assertNotInvalidated];
  if ([(SearchSession *)self shouldBroadcast])
  {
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"SearchSessionWillStart" object:self];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100436B8C;
  block[3] = &unk_1012E66E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showExistingSearchInfo:(id)a3
{
  [(SearchSession *)self setSearchInfo:a3];

  [(SearchSession *)self didChangeSearchResults];
}

- (void)didChangeSearchFieldItem
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100436C88;
  v2[3] = &unk_1012EA400;
  v2[4] = self;
  [(SearchSession *)self _notifyAllObservers:v2];
}

- (void)notifyPPTDidChangeSearchResults
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"SearchSessionDidChangeSearchResultsNotification" object:self userInfo:0];
}

- (void)didChangeSearchResults
{
  [(SearchSession *)self _setupTimersToRefreshEVChargers];
  [(SearchSession *)self notifyPPTDidChangeSearchResults];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100436D80;
  v3[3] = &unk_1012EA400;
  v3[4] = self;
  [(SearchSession *)self _notifyAllObservers:v3];
}

- (void)_setupTimersToRefreshEVChargers
{
  v2 = [(SearchSession *)self searchInfo];
  v32 = [v2 results];

  if ([v32 count])
  {
    [(SearchSession *)self resetEVChargerTimers];
    id v3 = +[NSMutableDictionary dictionary];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    id v4 = v32;
    id v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v44;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v44 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v9 = [v8 mapItem:v32];
          id v10 = [v9 _geoMapItem];
          unsigned int v11 = [v10 _hasEVCharger];

          if (v11)
          {
            id v12 = [v8 mapItem];
            id v13 = [v12 _realTimeAvailableEVCharger];
            BOOL v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 ttlSeconds]);

            uint64_t v15 = [v3 objectForKeyedSubscript:v14];
            v16 = v15;
            if (v15)
            {
              id v17 = [v15 mutableCopy];
            }
            else
            {
              id v17 = +[NSMutableArray array];
            }
            v18 = v17;
            v19 = [v8 mapItem];
            [v18 addObject:v19];

            [v3 setObject:v18 forKeyedSubscript:v14];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v5);
    }

    objc_super v20 = [v3 allKeys];
    BOOL v21 = [v20 count] == 0;

    if (!v21)
    {
      v22 = [v3 allKeys];
      v23 = [v22 sortedArrayUsingSelector:"compare:"];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = v23;
      id v24 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v40;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
            v28 = [v3 objectForKeyedSubscript:v27, v32];
            if ([v28 count])
            {
              v29 = dispatch_get_global_queue(9, 0);
              objc_initWeak(&location, self);
              id v30 = [v27 integerValue];
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_1004371F0;
              v35[3] = &unk_1012EA428;
              objc_copyWeak(&v37, &location);
              id v36 = v28;
              v31 = +[GCDTimer scheduledTimerWithTimeInterval:v29 queue:1 repeating:v35 block:(double)(uint64_t)v30];
              [(NSMutableArray *)self->_timers addObject:v31];

              objc_destroyWeak(&v37);
              objc_destroyWeak(&location);
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v24);
      }
    }
  }
}

- (void)resetEVChargerTimers
{
  [(NSMutableArray *)self->_timers enumerateObjectsUsingBlock:&stru_1012EA468];
  timers = self->_timers;

  [(NSMutableArray *)timers removeAllObjects];
}

- (void)_refreshEVChargers:(id)a3
{
  id v4 = a3;
  id v5 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v6 = [v5 isUsingOfflineMaps];

  if ((v6 & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100437454;
    v14[3] = &unk_1012EA490;
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v15 = v7;
    [v4 enumerateObjectsUsingBlock:v14];
    if ([v7 count])
    {
      v8 = +[MKMapService sharedService];
      id v9 = [v8 ticketForRefreshingEVChargersWithIdentifiers:v7 traits:0];

      objc_initWeak(&location, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1004374D0;
      v10[3] = &unk_1012E7418;
      objc_copyWeak(&v12, &location);
      id v11 = v4;
      [v9 submitRefreshRequestWithHandler:v10 networkActivity:0];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)notifyToRefreshEVChargers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004378AC;
  v5[3] = &unk_1012EA400;
  id v6 = a3;
  id v4 = v6;
  [(SearchSession *)self _notifyAllObservers:v5];
}

- (void)invalidate
{
  [(SearchSession *)self resetEVChargerTimers];

  [(SearchSession *)self invalidateWithReason:0];
}

- (void)cancelSearch
{
  id v2 = [(SearchSession *)self searchManager];
  [v2 cancelSearch];
}

- (void)invalidateWithReason:(unint64_t)a3
{
  id v5 = sub_100436738();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchSession %@ : invalidate", (uint8_t *)&buf, 0xCu);
  }

  id v6 = [(SearchSession *)self observersQueue];
  dispatch_assert_queue_not_V2(v6);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100103BDC;
  v18 = sub_100104678;
  id v19 = 0;
  id v7 = [(SearchSession *)self observersQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100437BAC;
  block[3] = &unk_1012E73F0;
  block[4] = self;
  void block[5] = &buf;
  dispatch_sync(v7, block);

  if ([*(id *)(*((void *)&buf + 1) + 40) count])
  {
    v8 = self;
    uint64_t v9 = *(void *)(*((void *)&buf + 1) + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100437C10;
    v11[3] = &unk_1012EA4B8;
    id v10 = v8;
    id v12 = v10;
    unint64_t v13 = a3;
    [(SearchSession *)v10 _notifyObservers:v9 block:v11];
  }
  _Block_object_dispose(&buf, 8);
}

- (BOOL)singleResultMode
{
  return [(SearchInfo *)self->_searchInfo singleResultMode];
}

- (BOOL)isVenueQuery
{
  id v2 = [(SearchSession *)self searchFieldItem];
  id v3 = [v2 venueCategoryItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)stringToDisplay
{
  if ([(SearchSession *)self isSuggestionSearch])
  {
    id v3 = [(SearchSession *)self suggestion];
    [v3 displayString];
  }
  else
  {
    id v3 = [(SearchSession *)self searchFieldItem];
    [v3 searchString];
  BOOL v4 = };

  return (NSString *)v4;
}

- (NSArray)currentResults
{
  id v3 = [(SearchSession *)self suggestionSearchInfo];

  if (v3) {
    [(SearchSession *)self suggestionSearchInfo];
  }
  else {
  BOOL v4 = [(SearchSession *)self searchInfo];
  }
  id v5 = [v4 results];

  return (NSArray *)v5;
}

- (SearchInfo)currentResultsSearchInfo
{
  id v3 = [(SearchSession *)self suggestionSearchInfo];

  if (v3) {
    [(SearchSession *)self suggestionSearchInfo];
  }
  else {
  BOOL v4 = [(SearchSession *)self searchInfo];
  }

  return (SearchInfo *)v4;
}

- (void)setSelectedResultIndex:(unint64_t)a3
{
  id v5 = [(SearchSession *)self currentResultsSearchInfo];
  if (v5)
  {
    id v7 = v5;
    BOOL v6 = [v5 selectedIndex] == (id)a3;
    id v5 = v7;
    if (!v6)
    {
      [v7 setSelectedIndex:a3];
      [(SearchSession *)self didChangeSearchResults];
      id v5 = v7;
    }
  }
}

- (unint64_t)selectedResultIndex
{
  id v3 = [(SearchSession *)self currentResultsSearchInfo];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 selectedIndex];
    BOOL v6 = [(SearchSession *)self currentResults];
    id v7 = [v6 count];

    if (v5 >= v7)
    {
      uint64_t v9 = [(SearchSession *)self currentResults];
      unint64_t v8 = (unint64_t)[v9 count] - 1;
    }
    else
    {
      unint64_t v8 = (unint64_t)[v4 selectedIndex];
    }
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)searchRequestType
{
  id v2 = [(SearchSession *)self traits];
  unsigned int v3 = [v2 searchRequestType];

  if (v3 == 2) {
    return 2;
  }
  else {
    return v3 == 1;
  }
}

- (BOOL)isRedoOrAutoRedoSearchType
{
  return (char *)[(SearchSession *)self searchRequestType] - 1 < (char *)2;
}

- (BOOL)isSingleResultToShowAsPlacecard
{
  if ([(SearchSession *)self isVenueQuery]
    || ![(SearchSession *)self singleResultMode]
    || [(SearchSession *)self isRedoOrAutoRedoSearchType])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v12 = [(SearchSession *)self traits];
    unint64_t v13 = [v12 resultRefinementQuery];
    BOOL v3 = v13 == 0;
  }
  BOOL v4 = [(SearchSession *)self searchInfo];
  id v5 = [v4 results];
  if ([v5 count] == (id)1)
  {
    unsigned __int8 v6 = [(SearchSession *)self isRedoOrAutoRedoSearchType];

    if ((v6 & 1) == 0)
    {
      id v7 = [(SearchSession *)self searchInfo];
      unsigned int v8 = [v7 searchResultViewType];

      if (v8 == 1) {
        return 0;
      }
      if (v8 == 2) {
        return 1;
      }
      return v3;
    }
  }
  else
  {
  }
  uint64_t v9 = [(SearchSession *)self searchInfo];
  id v10 = [v9 autocompletePerson];

  if (v10) {
    return 1;
  }
  return v3;
}

- (NSHashTable)observers
{
  BOOL v3 = [(SearchSession *)self observersQueue];
  dispatch_assert_queue_V2(v3);

  observers = self->_observers;

  return observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  [(SearchSession *)self _assertNotInvalidated];
  if (v4)
  {
    id v5 = [(SearchSession *)self observersQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100438178;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SearchSession *)self observersQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100438284;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)_notifyAllObservers:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchSession *)self observersQueue];
  dispatch_assert_queue_not_V2(v5);

  if (v4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = sub_100103BDC;
    id v12 = sub_100104678;
    id v13 = 0;
    unsigned __int8 v6 = [(SearchSession *)self observersQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100438410;
    v7[3] = &unk_1012E73F0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v6, v7);

    [(SearchSession *)self _notifyObservers:v9[5] block:v4];
    _Block_object_dispose(&v8, 8);
  }
}

- (void)_notifyObservers:(id)a3 block:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = (void (**)(id, void))a4;
  if (v6)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          v6[2](v6, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_performSearchIfNeeded
{
  BOOL v3 = [(SearchSession *)self searchFieldItem];
  id v4 = [v3 searchResult];

  if (!v4)
  {
    id v8 = [(SearchSession *)self searchFieldItem];
    uint64_t v9 = [v8 historyItem];

    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v10 = [(SearchSession *)self searchFieldItem];
    id v11 = [v10 historyItem];
    long long v12 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    objc_opt_class();
    id v13 = v11;
    id v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
    id v15 = v14;

    if (v15
      && ([v15 historyEntry],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 conformsToProtocol:v12],
          v16,
          v17))
    {
      id v18 = v13;
    }
    else
    {
      id v18 = 0;
    }

    if (v18)
    {
      id v19 = [SearchResult alloc];
      objc_super v20 = [v18 historyEntry];
      BOOL v21 = [v20 geoMapItem];
      id v4 = [(SearchResult *)v19 initWithGEOMapItem:v21];

      [(SearchResultRepr *)v4 setHasIncompleteMetadata:1];
      v22 = [(SearchResult *)v4 mapItem];
      v23 = [v22 _geoMapItem];
      id v5 = [v23 displayMapRegionOrNil];

      if (v4) {
        goto LABEL_3;
      }
    }
    else
    {
LABEL_15:
      id v5 = 0;
    }
    [(SearchSession *)self _performSearch];
    goto LABEL_17;
  }
  id v5 = 0;
LABEL_3:
  id v24 = v4;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:&v24 count:1];
  id v7 = +[SearchInfo searchInfoWithResults:v6 boundingMapRegion:v5];

  [v7 setSelectedIndex:0];
  [(SearchSession *)self showExistingSearchInfo:v7];

LABEL_17:
}

- (void)_performSearch
{
  BOOL v3 = sub_100436738();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchSession %@ : _performSearch", (uint8_t *)&v10, 0xCu);
  }

  searchManager = self->_searchManager;
  id v5 = [(SearchSession *)self searchFieldItem];
  unsigned __int8 v6 = [(SearchSession *)self traits];
  uint64_t v7 = [(SearchSession *)self source];
  BOOL v8 = [(SearchSession *)self isRedoOrAutoRedoSearchType];
  uint64_t v9 = [(SearchSession *)self searchSessionData];
  [(SearchManager *)searchManager searchForSearchFieldItem:v5 traits:v6 source:v7 isRedoOrAutoRedoSearch:v8 searchSessionData:v9];
}

- (void)_processResults:(id)a3
{
  id v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  [(SearchSession *)self setIsLoading:0];
  if (GEOConfigGetBOOL())
  {
    unsigned __int8 v6 = [v4 results];
    id v7 = [v6 count];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v8 = [v4 results];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) setPartOfMultipleResultsSet:(unint64_t)v7 > 1];
          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  if ([(SearchSession *)self isSuggestionSearch]) {
    [(SearchSession *)self setSuggestionSearchInfo:v4];
  }
  else {
    [(SearchSession *)self setSearchInfo:v4];
  }
  id v13 = [v4 searchSessionData];
  [(SearchSession *)self setSearchSessionData:v13];

  [(SearchSession *)self didChangeSearchResults];
}

- (void)_willProcessSearchFieldItem
{
  lastError = self->_lastError;
  self->_lastError = 0;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100438B50;
  v4[3] = &unk_1012EA400;
  v4[4] = self;
  [(SearchSession *)self _notifyAllObservers:v4];
}

- (void)searchManager:(id)a3 willProcessSearchFieldItem:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = sub_100436738();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SearchSession %@ : willProcessSearchFieldItem %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = sub_100109E50();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ReceivedSearchResults", "", (uint8_t *)&v8, 2u);
  }

  [(SearchSession *)self setIsLoading:1];
  [(SearchSession *)self _willProcessSearchFieldItem];
}

- (void)searchManager:(id)a3 didReceiveSearchInfo:(id)a4 searchSessionData:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = sub_100436738();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SearchSession %@ : didReceiveSearchInfo %@ error %@", buf, 0x20u);
  }

  id v13 = sub_100109E50();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReceivedSearchResults", "", buf, 2u);
  }

  if (v11)
  {
    [(SearchSession *)self setIsLoading:0];
    [(SearchSession *)self setSearchSessionData:v10];
    [(SearchSession *)self setSearchInfo:v9];
    objc_storeStrong((id *)&self->_lastError, a6);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100438ECC;
    v17[3] = &unk_1012EA400;
    v17[4] = self;
    [(SearchSession *)self _notifyAllObservers:v17];
    long long v14 = [v11 domain];
    long long v15 = GEOErrorDomain();
    if ([v14 isEqualToString:v15])
    {
      id v16 = [v11 code];

      if (v16 == (id)-8) {
        [(SearchSession *)self notifyPPTDidChangeSearchResults];
      }
    }
    else
    {
    }
  }
  else
  {
    [(SearchSession *)self _processResults:v9];
  }
}

- (BOOL)isInvalidated
{
  id v2 = self;
  BOOL v3 = [(SearchSession *)self observersQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(SearchSession *)v2 observersQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100438FCC;
  v6[3] = &unk_1012E73F0;
  v6[4] = v2;
  void v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (BOOL)isSpotlightPunchInSearch
{
  if (![(SearchFieldItem *)self->_searchFieldItem isSpotlightSearch]
    || [(SearchInfo *)self->_searchInfo searchResultViewType] != 2)
  {
    return 0;
  }
  BOOL v3 = [(SearchInfo *)self->_searchInfo spotlightMapsIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (SearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (BOOL)shouldBroadcast
{
  return self->_shouldBroadcast;
}

- (void)setShouldBroadcast:(BOOL)a3
{
  self->_shouldBroadcast = a3;
}

- (BOOL)restoreSingleResult
{
  return self->_restoreSingleResult;
}

- (void)setRestoreSingleResult:(BOOL)a3
{
  self->_restoreSingleResult = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (BOOL)shouldCreateHistoryEntry
{
  return self->_shouldCreateHistoryEntry;
}

- (void)setShouldCreateHistoryEntry:(BOOL)a3
{
  self->_shouldCreateHistoryEntry = a3;
}

- (GEORelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isSuggestionSearch
{
  return self->_isSuggestionSearch;
}

- (void)setIsSuggestionSearch:(BOOL)a3
{
  self->_isSuggestionSearch = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isResultRefinementsBarSearch
{
  return self->_isResultRefinementsBarSearch;
}

- (void)setIsResultRefinementsBarSearch:(BOOL)a3
{
  self->_isResultRefinementsBarSearch = a3;
}

- (BOOL)isAddStopFromWaypointEditor
{
  return self->_isAddStopFromWaypointEditor;
}

- (void)setIsAddStopFromWaypointEditor:(BOOL)a3
{
  self->_isAddStopFromWaypointEditor = a3;
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (void)setSearchSessionData:(id)a3
{
}

- (BOOL)spotlightMatchingResultFound
{
  return self->_spotlightMatchingResultFound;
}

- (void)setSpotlightMatchingResultFound:(BOOL)a3
{
  self->_spotlightMatchingResultFound = a3;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)observersQueue
{
  return self->_observersQueue;
}

- (void)setObserversQueue:(id)a3
{
}

- (SearchInfo)suggestionSearchInfo
{
  return self->_suggestionSearchInfo;
}

- (void)setSuggestionSearchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSearchInfo, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);

  objc_storeStrong((id *)&self->_timers, 0);
}

- (NSString)printedPageTitle
{
  id v2 = [(SearchSession *)self searchFieldItem];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)printedPageSubtitle
{
  BOOL v3 = [(SearchSession *)self searchFieldItem];
  BOOL v4 = [(SearchSession *)self currentResults];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100104310;
  id v19 = sub_1001049F8;
  id v20 = 0;
  id v5 = [v3 historyItem];
  unsigned __int8 v6 = [v5 historyEntry];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100AC9890;
  v14[3] = &unk_1012F87C0;
  void v14[4] = &v15;
  [v6 ifSearch:v14 ifRoute:0 ifPlaceDisplay:0 ifTransitLineItem:0];

  if (![(id)v16[5] length] && objc_msgSend(v4, "count"))
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    int v8 = +[NSBundle mainBundle];
    char v10 = [v8 localizedStringForKey:@"near %@" value:@"localized string not found" table:0];
    id v11 = [v7 mapItem];
    long long v12 = [v11 _addressFormattedAsCity];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);

    goto LABEL_6;
  }
  if ([(id)v16[5] length])
  {
    uint64_t v7 = +[NSBundle mainBundle];
    int v8 = [v7 localizedStringForKey:@"near %@" value:@"localized string not found" table:0];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v16[5]);
LABEL_6:

    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_8:
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

- (NSString)currentSearchString
{
  id v2 = [(SearchSession *)self searchFieldItem];
  BOOL v3 = [v2 searchString];

  return (NSString *)v3;
}

- (NSString)currentUserTypedSearchString
{
  id v2 = [(SearchSession *)self searchFieldItem];
  BOOL v3 = [v2 userTypedStringForRAP];

  return (NSString *)v3;
}

- (BOOL)isOptionsLowFuel
{
  if (([(SearchSession *)self options] & 2) != 0) {
    return 1;
  }
  else {
    return [(SearchSession *)self options] & 1;
  }
}

+ (void)performSearchForEngineType:(int)a3 withObserver:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[CarDisplayController sharedInstance];
  int v8 = [v7 chromeViewController];
  uint64_t v9 = [v8 currentTraits];

  if (v9)
  {
    dword_1016110DC = 0;
    char v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Initiating a fuel search", buf, 2u);
    }

    if (!v6)
    {
      id v6 = +[CarDisplayController sharedInstance];
    }
    id v11 = +[CarDisplayController sharedInstance];
    long long v12 = [v11 chromeViewController];
    id v13 = [v12 currentTraits];

    long long v14 = +[MNNavigationService sharedService];
    [v13 setNavigating:[v14 isInNavigatingState]];

    uint64_t v15 = +[MapsExternalAccessory sharedInstance];
    if ([v15 primaryEngineType] == a3)
    {
    }
    else
    {

      if (((a3 >> 1) & 1) + (a3 & 1) + ((a3 >> 2) & 1) + ((a3 >> 3) & 1) <= 1)
      {
        uint64_t v17 = @"Stark-SARHybrid";
        [v13 clearEngineTypes];
        [v13 addEngineType:3];
        +[BrowseManager setCacheKey:v17 writesToDisk:0];
        goto LABEL_16;
      }
    }
    uint64_t v17 = @"Stark-SAR";
LABEL_16:
    id v18 = [[BrowseManager alloc] initWithCacheKey:v17];
    [(BrowseManager *)v18 setTraits:v13];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100D4FEF8;
    v20[3] = &unk_1012E7B20;
    id v21 = v18;
    id v6 = v6;
    id v22 = v6;
    id v19 = v18;
    [(BrowseManager *)v19 getCategoriesWithCompletion:v20];

    goto LABEL_17;
  }
  id v16 = sub_100015DB4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109120;
    int v28 = dword_1016110DC;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Chrome not ready for fuel search, delaying performSearchForEngineTypeCount=%d", buf, 8u);
  }

  if (dword_1016110DC > 9)
  {
    dword_1016110DC = 0;
  }
  else
  {
    ++dword_1016110DC;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D4FEE8;
    block[3] = &unk_1012E7E30;
    id v25 = a1;
    int v26 = a3;
    id v6 = v6;
    id v24 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_17:
}

@end