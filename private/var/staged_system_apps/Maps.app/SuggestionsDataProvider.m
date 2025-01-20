@interface SuggestionsDataProvider
- (BOOL)active;
- (BOOL)attached;
- (BOOL)hasInitialData;
- (BOOL)includePlaceholderShortcuts;
- (GEOObserverHashTable)observers;
- (MapsSuggestionsFilter)filter;
- (NSArray)shortcuts;
- (NSArray)suggestions;
- (NSString)uniqueName;
- (SuggestionsDataProvider)initWithViewMode:(int64_t)a3 filter:(id)a4 includePlaceholderShortcuts:(BOOL)a5;
- (SuggestionsItemSource)suggestionsItemSource;
- (id)_createMapsSuggestionEngine;
- (id)strippedData:(id)a3;
- (int64_t)viewMode;
- (void)_addressbookDidChange:(id)a3;
- (void)_didEnterBackground:(id)a3;
- (void)_fetchSuggestionsFromStorageFile;
- (void)_fetchSuggestionsWithCompletion:(id)a3;
- (void)_processTopSuggestions:(id)a3 error:(id)a4 wasFromStorageFile:(BOOL)a5;
- (void)_saveMapsSuggestionsEngineStateIfNeeded;
- (void)_scheduleFetch;
- (void)_setNeedsSaveMapsSuggestionsEngineState;
- (void)_startFetchingSuggestionsAndNotifyObservers:(BOOL)a3;
- (void)_startObservingAutoOptions;
- (void)_startObservingTitlesForEntry:(id)a3;
- (void)_startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:(BOOL)a3;
- (void)_stopFetchingSuggestionsAndNotifyObservers:(BOOL)a3 isDeallocating:(BOOL)a4;
- (void)_stopObservingAutoOptions;
- (void)_stopObservingTitlesForEntry:(id)a3;
- (void)_updateAppConnectionSuggestionsEntriesIfNeeded:(id)a3;
- (void)_updateObservedShortcutsWithShortcuts:(id)a3;
- (void)_updateObservedSuggestionsWithSuggestions:(id)a3;
- (void)_updateTitlesForEntry:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)dealloc;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActive:(BOOL)a3;
@end

@implementation SuggestionsDataProvider

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___SuggestionsDataProviderObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)_fetchSuggestionsFromStorageFile
{
  if (self->_attached)
  {
    objc_initWeak(&location, self);
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001C050;
    v5[3] = &unk_1012E6E78;
    objc_copyWeak(&v6, &location);
    id v4 = &_dispatch_main_q;
    [(MapsSuggestionsEngine *)mapsSuggestionsEngine topSuggestionsFromStorageFile:0 sink:self count:99 transportType:4 callback:v5 onQueue:&_dispatch_main_q];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_startObservingAutoOptions
{
  v3 = +[NSUserDefaults standardUserDefaults];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [&off_1013AE640 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(&off_1013AE640);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) options:1 context:off_1015E4270];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_1013AE640 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_saveMapsSuggestionsEngineStateIfNeeded
{
  if (self->_needsSaveMapsSuggestionState)
  {
    self->_needsSaveMapsSuggestionState = 0;
    v2 = self->_mapsSuggestionsEngine;
    v3 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100107F04;
    block[3] = &unk_1012E5D08;
    uint64_t v6 = v2;
    id v4 = v2;
    dispatch_async(v3, block);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    id v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = v5;
    if (v3)
    {
      [v5 addObserver:self selector:"_addressbookDidChange:" name:off_1015E5428 object:0];

      v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:self selector:"_willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

      uint64_t v6 = +[NSNotificationCenter defaultCenter];
      [v6 addObserver:self selector:"_didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    }
    else
    {
      [v5 removeObserver:self];
    }

    [(SuggestionsDataProvider *)self _startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:0];
  }
}

- (void)_addressbookDidChange:(id)a3
{
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    long long v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    long long v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);
  }
  [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine hintRefreshOfType:1];
}

- (SuggestionsDataProvider)initWithViewMode:(int64_t)a3 filter:(id)a4 includePlaceholderShortcuts:(BOOL)a5
{
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SuggestionsDataProvider;
  long long v10 = [(SuggestionsDataProvider *)&v24 init];
  __int16 v11 = v10;
  if (v10)
  {
    v10->_viewMode = a3;
    objc_storeStrong((id *)&v10->_filter, a4);
    v11->_includePlaceholderShortcuts = a5;
    suggestions = v11->_suggestions;
    v11->_suggestions = (NSArray *)&__NSArray0__struct;

    shortcuts = v11->_shortcuts;
    v11->_shortcuts = (NSArray *)&__NSArray0__struct;

    observedSuggestions = v11->_observedSuggestions;
    v11->_observedSuggestions = (NSArray *)&__NSArray0__struct;

    observedShortcuts = v11->_observedShortcuts;
    v11->_observedShortcuts = (NSArray *)&__NSArray0__struct;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("SuggestionsDataProvider.appConnectionSuggestionsUpdateQueue", v16);
    appConnectionMapsSuggestionsUpdateQueue = v11->_appConnectionMapsSuggestionsUpdateQueue;
    v11->_appConnectionMapsSuggestionsUpdateQueue = (OS_dispatch_queue *)v17;

    v19 = (MapsSuggestionsNetworkRequester *)[objc_alloc((Class)MapsSuggestionsRealNetworkRequester) initFromResourceDepot:0];
    requester = v11->_requester;
    v11->_requester = v19;

    v21 = objc_alloc_init(SuggestionsItemSource);
    suggestionsItemSource = v11->_suggestionsItemSource;
    v11->_suggestionsItemSource = v21;
  }
  return v11;
}

- (void)_startObservingTitlesForEntry:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    long long v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 addObserver:self forKeyPath:@"title" options:1 context:off_1015E4278];
  [v5 addObserver:self forKeyPath:@"subtitle" options:1 context:off_1015E4278];
}

- (void)_startFetchingSuggestionsAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    long long v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v10 = sub_100097E28(v3);
    int v18 = 138412802;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v18, 0x20u);
  }
  if (!self->_attached)
  {
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    __int16 v12 = [(SuggestionsDataProvider *)self _createMapsSuggestionEngine];
    v13 = self->_mapsSuggestionsEngine;
    self->_mapsSuggestionsEngine = v12;

    if (self->_mapsSuggestionsEngine)
    {
      self->_attached = 1;
      [(GEOObserverHashTable *)self->_observers suggestionsDataProviderDidAttachToEngine:self];
      [(SuggestionsDataProvider *)self _startObservingAutoOptions];
      __int16 v14 = [DrivePreferences alloc];
      id v15 = +[NSUserDefaults standardUserDefaults];
      v16 = [(DrivePreferences *)v14 initWithDefaults:v15];
      dispatch_queue_t v17 = [(DrivePreferences *)v16 automobileOptions];

      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine setAutomobileOptions:v17];
      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine attachSink:self];
      if (mapsSuggestionsEngine) {
        [(SuggestionsDataProvider *)self _scheduleFetch];
      }
      else {
        [(SuggestionsDataProvider *)self _fetchSuggestionsFromStorageFile];
      }
    }
  }
}

- (id)_createMapsSuggestionEngine
{
  mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
  if (mapsSuggestionsEngine)
  {
    BOOL v3 = mapsSuggestionsEngine;
  }
  else
  {
    id v5 = sub_1000AA148();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    v7 = sub_1000AA148();
    long long v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CreateMapsSuggestionEngine", "", (uint8_t *)buf, 2u);
    }

    id v9 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_1012ED380];
    sub_100018584();
    int v10 = (MapsSuggestionsEngine *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = v10;
    unint64_t v11 = self->_viewMode + 1;
    if (v11 > 7) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = dword_100F6F9B8[v11];
    }
    [(MapsSuggestionsEngine *)v10 setMapType:v12];
    filter = self->_filter;
    if (filter) {
      [(MapsSuggestionsEngine *)v3 addAdditionalFilter:filter forSink:self];
    }
    [(MapsSuggestionsEngine *)v3 addAdditionalFilter:v9 forSink:self];
    objc_initWeak(buf, self);
    __int16 v14 = [MapsThrottler alloc];
    id v15 = &_dispatch_main_q;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10008EC5C;
    v22[3] = &unk_1012ED3A8;
    objc_copyWeak(&v23, buf);
    v16 = [(MapsThrottler *)v14 initWithInitialValue:&__kCFBooleanTrue throttlingInterval:&_dispatch_main_q queue:v22 updateHandler:0.0];
    fetchThrottler = self->_fetchThrottler;
    self->_fetchThrottler = v16;

    int v18 = sub_1000AA148();
    v19 = v18;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      __int16 v21 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v6, "CreateMapsSuggestionEngine", "", (uint8_t *)&v21, 2u);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }

  return v3;
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return self->_suggestionsItemSource;
}

- (void)_fetchSuggestionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_attached)
  {
    objc_initWeak(&location, self);
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009788C;
    v8[3] = &unk_1012EB628;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    id v7 = &_dispatch_main_q;
    [(MapsSuggestionsEngine *)mapsSuggestionsEngine topSuggestionsForSink:self count:99 transportType:4 callback:v8 onQueue:&_dispatch_main_q];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)_processTopSuggestions:(id)a3 error:(id)a4 wasFromStorageFile:(BOOL)a5
{
  id v32 = a3;
  id v9 = a4;
  if (self->_attached)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_100103C9C;
    v43 = sub_1001046D8;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_100103C9C;
    v37 = sub_1001046D8;
    id v38 = 0;
    id v30 = v9;
    MapsSuggestionsShortcutSplit();
    if (!self->_includePlaceholderShortcuts)
    {
      id v10 = (void *)v34[5];
      unint64_t v11 = +[NSPredicate predicateWithBlock:&stru_1012ED410];
      uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];
      v13 = (void *)v34[5];
      v34[5] = v12;
    }
    BOOL hasInitialData = self->_hasInitialData;
    if (!self->_hasInitialData) {
      self->_BOOL hasInitialData = 1;
    }
    unsigned int v15 = [v40[5] isEqual:self->_suggestions v30];
    unsigned int v16 = [(id)v34[5] isEqual:self->_shortcuts];
    if ((v15 & 1) == 0)
    {
      sub_100097E44((void *)v40[5]);
      dispatch_queue_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      suggestions = self->_suggestions;
      self->_suggestions = v17;

      [(SuggestionsDataProvider *)self _updateObservedSuggestionsWithSuggestions:v40[5]];
      if (!a5)
      {
        [(SuggestionsDataProvider *)self _setNeedsSaveMapsSuggestionsEngineState];
        [(SuggestionsDataProvider *)self _updateAppConnectionSuggestionsEntriesIfNeeded:v40[5]];
      }
    }
    if ((v16 & 1) == 0)
    {
      sub_100097E44((void *)v34[5]);
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      shortcuts = self->_shortcuts;
      self->_shortcuts = v19;

      [(SuggestionsDataProvider *)self _updateObservedShortcutsWithShortcuts:v34[5]];
      if (!a5) {
        [(SuggestionsDataProvider *)self _setNeedsSaveMapsSuggestionsEngineState];
      }
    }
    int v21 = v15 ^ 1;
    int v22 = v16 ^ 1;
    id v23 = sub_1000AA148();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_super v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      sub_100097E28(!hasInitialData);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      sub_100097E28(v21);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = sub_100097E28(v22);
      *(_DWORD *)buf = 138413314;
      id v46 = v25;
      __int16 v47 = 2112;
      id v48 = v26;
      __int16 v49 = 2112;
      id v50 = v27;
      __int16 v51 = 2112;
      id v52 = v28;
      __int16 v53 = 2112;
      v54 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ %@, hasInitialDataChanged = %@, suggestionsChanged = %@, shortcutsChanged = %@", buf, 0x34u);
    }
    if ((!hasInitialData | v21 | v22) == 1)
    {
      [(SuggestionsItemSource *)self->_suggestionsItemSource setSuggestions:v32];
      +[HomeAnalyticsManager captureStateWithShortcuts:self->_shortcuts];
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    id v9 = v31;
  }
}

- (void)_updateObservedShortcutsWithShortcuts:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  os_signpost_id_t v6 = +[NSMutableArray arrayWithArray:self->_observedShortcuts];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = (NSArray *)v4;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        [v6 removeObjectIdenticalTo:v12];
        if ([(NSArray *)self->_observedShortcuts indexOfObjectIdenticalTo:v12] == 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addObject:v12];
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        [(SuggestionsDataProvider *)self _startObservingTitlesForEntry:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v15);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        -[SuggestionsDataProvider _stopObservingTitlesForEntry:](self, "_stopObservingTitlesForEntry:", *(void *)(*((void *)&v24 + 1) + 8 * (void)k), (void)v24);
      }
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  observedShortcuts = self->_observedShortcuts;
  self->_observedShortcuts = v7;
}

- (void)_setNeedsSaveMapsSuggestionsEngineState
{
  self->_needsSaveMapsSuggestionState = 1;
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107EFC;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)strippedData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          [v10 type];
          unint64_t v11 = NSStringFromMapsSuggestionsEntryType();
          uint64_t v12 = +[NSString stringWithFormat:@"%@ %p", v11, v10];

          [v4 addObject:v12];
        }
        else
        {
          unint64_t v11 = +[NSString stringWithFormat:@"%@ %p", objc_opt_class(), v9];
          [v4 addObject:v11];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);
  }
  [(SuggestionsDataProvider *)self _scheduleFetch];
}

- (void)_scheduleFetch
{
  id v4 = [(MapsThrottler *)self->_fetchThrottler value];
  id v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 BOOLValue] ^ 1);
  [(MapsThrottler *)self->_fetchThrottler setValue:v3];
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)_startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[UIApplication _maps_isAnySceneForeground];
  if (!self->_active || v5 == 0)
  {
    [(SuggestionsDataProvider *)self _stopFetchingSuggestionsAndNotifyObservers:v3 isDeallocating:0];
  }
  else
  {
    [(SuggestionsDataProvider *)self _startFetchingSuggestionsAndNotifyObservers:v3];
  }
}

- (void)dealloc
{
  filter = self->_filter;
  if (filter) {
    [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine removeAdditionalFilter:filter forSink:self];
  }
  [(SuggestionsDataProvider *)self _stopFetchingSuggestionsAndNotifyObservers:0 isDeallocating:1];
  [(SuggestionsDataProvider *)self _updateObservedSuggestionsWithSuggestions:&__NSArray0__struct];
  [(SuggestionsDataProvider *)self _updateObservedShortcutsWithShortcuts:&__NSArray0__struct];
  v4.receiver = self;
  v4.super_class = (Class)SuggestionsDataProvider;
  [(SuggestionsDataProvider *)&v4 dealloc];
}

- (void)_willEnterForeground:(id)a3
{
  if (self->_active) {
    [(SuggestionsDataProvider *)self _startFetchingSuggestionsAndNotifyObservers:1];
  }
}

- (void)_didEnterBackground:(id)a3
{
}

- (void)_stopFetchingSuggestionsAndNotifyObservers:(BOOL)a3 isDeallocating:(BOOL)a4
{
  BOOL v5 = a3;
  id v8 = sub_1000AA148();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    __int16 v11 = NSStringFromSelector(a2);
    uint64_t v12 = sub_100097E28(v5);
    int v13 = 138412802;
    id v14 = v10;
    __int16 v15 = 2112;
    long long v16 = v11;
    __int16 v17 = 2112;
    long long v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v13, 0x20u);
  }
  if (self->_attached)
  {
    self->_attached = 0;
    [(GEOObserverHashTable *)self->_observers suggestionsDataProviderDidDetachFromEngine:self];
    [(SuggestionsDataProvider *)self _stopObservingAutoOptions];
    if (!a4) {
      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine detachSink:self];
    }
  }
}

- (void)_updateAppConnectionSuggestionsEntriesIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 type] == (id)12)
        {
          uint64_t v12 = [v11 geoMapItem];

          if (!v12) {
            [v5 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    int v13 = self->_requester;
    appConnectionMapsSuggestionsUpdateQueue = self->_appConnectionMapsSuggestionsUpdateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1004EB250;
    v16[3] = &unk_1012E5D58;
    id v17 = v5;
    long long v18 = v13;
    __int16 v15 = v13;
    dispatch_async(appConnectionMapsSuggestionsUpdateQueue, v16);
  }
}

- (void)_stopObservingAutoOptions
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [&off_1013AE640 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(&off_1013AE640);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_1013AE640 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateObservedSuggestionsWithSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSMutableArray arrayWithArray:self->_observedSuggestions];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = (NSArray *)v4;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        [v6 removeObjectIdenticalTo:v12];
        if ([(NSArray *)self->_observedSuggestions indexOfObjectIdenticalTo:v12] == 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addObject:v12];
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        [(SuggestionsDataProvider *)self _startObservingTitlesForEntry:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v15);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        -[SuggestionsDataProvider _stopObservingTitlesForEntry:](self, "_stopObservingTitlesForEntry:", *(void *)(*((void *)&v24 + 1) + 8 * (void)k), (void)v24);
      }
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  observedSuggestions = self->_observedSuggestions;
  self->_observedSuggestions = v7;
}

- (void)_updateTitlesForEntry:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v27 = 138412802;
    long long v28 = v8;
    __int16 v29 = 2112;
    long long v30 = v9;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v27, 0x20u);
  }
  NSUInteger v10 = [(NSArray *)self->_observedSuggestions indexOfObjectIdenticalTo:v5];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    || (NSUInteger v11 = v10,
        [(NSArray *)self->_suggestions objectAtIndexedSubscript:v10],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v12 isEqualToEntry:v5],
        v12,
        (v13 & 1) != 0))
  {
    BOOL attached = 0;
  }
  else
  {
    BOOL attached = self->_attached;
    if (self->_attached)
    {
      id v15 = +[NSMutableArray arrayWithArray:self->_suggestions];
      id v16 = [v5 copy];
      [v15 setObject:v16 atIndexedSubscript:v11];

      id v17 = (NSArray *)[v15 copy];
      suggestions = self->_suggestions;
      self->_suggestions = v17;
    }
    [(SuggestionsDataProvider *)self _setNeedsSaveMapsSuggestionsEngineState];
  }
  NSUInteger v19 = [(NSArray *)self->_observedShortcuts indexOfObjectIdenticalTo:v5];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    if (!attached) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  NSUInteger v20 = v19;
  uint64_t v21 = [(NSArray *)self->_shortcuts objectAtIndexedSubscript:v19];
  unsigned __int8 v22 = [v21 isEqualToEntry:v5];

  if (v22)
  {
    if (!attached) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!self->_attached)
    {
      [(SuggestionsDataProvider *)self _setNeedsSaveMapsSuggestionsEngineState];
      goto LABEL_10;
    }
    id v23 = +[NSMutableArray arrayWithArray:self->_shortcuts];
    id v24 = [v5 copy];
    [v23 setObject:v24 atIndexedSubscript:v20];

    long long v25 = (NSArray *)[v23 copy];
    shortcuts = self->_shortcuts;
    self->_shortcuts = v25;

    [(SuggestionsDataProvider *)self _setNeedsSaveMapsSuggestionsEngineState];
  }
LABEL_17:
  [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
LABEL_18:
}

- (void)_stopObservingTitlesForEntry:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    NSUInteger v11 = v8;
    __int16 v12 = 2112;
    unsigned __int8 v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 removeObserver:self forKeyPath:@"title" context:off_1015E4278];
  [v5 removeObserver:self forKeyPath:@"subtitle" context:off_1015E4278];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015E4270 == a6)
  {
    unsigned __int8 v13 = [DrivePreferences alloc];
    __int16 v14 = +[NSUserDefaults standardUserDefaults];
    id v15 = [(DrivePreferences *)v13 initWithDefaults:v14];
    id v16 = [(DrivePreferences *)v15 automobileOptions];

    [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine setAutomobileOptions:v16];
  }
  else if (off_1015E4278 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EBCF0;
    block[3] = &unk_1012E5D58;
    void block[4] = self;
    id v19 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SuggestionsDataProvider;
    [(SuggestionsDataProvider *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (MapsSuggestionsFilter)filter
{
  return self->_filter;
}

- (BOOL)includePlaceholderShortcuts
{
  return self->_includePlaceholderShortcuts;
}

- (BOOL)attached
{
  return self->_attached;
}

- (NSArray)shortcuts
{
  return self->_shortcuts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsItemSource, 0);
  objc_storeStrong((id *)&self->_shortcuts, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_observedShortcuts, 0);
  objc_storeStrong((id *)&self->_observedSuggestions, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsEngine, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_appConnectionMapsSuggestionsUpdateQueue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end