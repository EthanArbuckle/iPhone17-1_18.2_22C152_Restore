@interface CarShortcutsProvider
- (BOOL)sinkAttached;
- (CarShortcutsProvider)init;
- (CarShortcutsProviderDelegate)delegate;
- (NSArray)shortcuts;
- (NSString)uniqueName;
- (void)_createMapsSuggestionEngineWithCallBack:(id)a3;
- (void)_fetchSuggestions;
- (void)_processTopSuggestions:(id)a3 error:(id)a4;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShortcuts:(id)a3;
- (void)setSinkAttached:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation CarShortcutsProvider

- (CarShortcutsProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)CarShortcutsProvider;
  v2 = [(CarShortcutsProvider *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CarShortcutsProviderMapsSuggestionsQueue", v3);
    msgQueue = v2->_msgQueue;
    v2->_msgQueue = (OS_dispatch_queue *)v4;

    v6 = (MapsSuggestionsFilter *)[objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_101316B38];
    offlineFilter = v2->_offlineFilter;
    v2->_offlineFilter = v6;

    uint64_t v8 = +[MapsSuggestionsBlockFilter filterWithBlock:&stru_101316B58];
    myAdditionalFilter = v2->_myAdditionalFilter;
    v2->_myAdditionalFilter = (MapsSuggestionsFilter *)v8;
  }
  return v2;
}

- (void)setSinkAttached:(BOOL)a3
{
  if (self->_sinkAttached != a3)
  {
    self->_sinkAttached = a3;
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    if (a3)
    {
      [(MapsSuggestionsEngine *)mapsSuggestionsEngine addAdditionalFilter:self->_myAdditionalFilter forSink:self];
      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine addAdditionalFilter:self->_offlineFilter forSink:self];
      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine attachSink:self];
      [(CarShortcutsProvider *)self _fetchSuggestions];
    }
    else
    {
      [(MapsSuggestionsEngine *)mapsSuggestionsEngine detachSink:self];
      [(MapsSuggestionsEngine *)self->_mapsSuggestionsEngine removeAdditionalFilter:self->_myAdditionalFilter forSink:self];
      v5 = self->_mapsSuggestionsEngine;
      offlineFilter = self->_offlineFilter;
      [(MapsSuggestionsEngine *)v5 removeAdditionalFilter:offlineFilter forSink:self];
    }
  }
}

- (void)start
{
  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AC7C20;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(msgQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stop
{
  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AC7E14;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(msgQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_createMapsSuggestionEngineWithCallBack:(id)a3
{
  v3 = (void (**)(id, id))a3;
  sub_100018584();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setMapType:1];
  dispatch_queue_t v4 = [DrivePreferences alloc];
  id v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [(DrivePreferences *)v4 initWithDefaults:v5];
  v7 = [(DrivePreferences *)v6 automobileOptions];

  [v8 setAutomobileOptions:v7];
  v3[2](v3, v8);
}

- (void)_fetchSuggestions
{
  objc_initWeak(&location, self);
  mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AC8004;
  v4[3] = &unk_1012E6E78;
  objc_copyWeak(&v5, &location);
  [(MapsSuggestionsEngine *)mapsSuggestionsEngine topSuggestionsForSink:self count:20 transportType:0 callback:v4 onQueue:self->_msgQueue];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_processTopSuggestions:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100104300;
  v23 = sub_1001049F0;
  id v24 = 0;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100AC8248;
  v17 = &unk_1012E8380;
  v18 = &v19;
  MapsSuggestionsShortcutSplit();
  id v8 = (void *)v20[5];
  v9 = +[NSPredicate predicateWithBlock:&stru_101316BC0];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AC8278;
  block[3] = &unk_1012E5D58;
  block[4] = self;
  id v13 = v10;
  id v11 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v19, 8);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AC83B4;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  dispatch_async(msgQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSArray)shortcuts
{
  return self->_shortcuts;
}

- (void)setShortcuts:(id)a3
{
}

- (CarShortcutsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarShortcutsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)sinkAttached
{
  return self->_sinkAttached;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shortcuts, 0);
  objc_storeStrong((id *)&self->_msgQueue, 0);
  objc_storeStrong((id *)&self->_offlineFilter, 0);
  objc_storeStrong((id *)&self->_myAdditionalFilter, 0);

  objc_storeStrong((id *)&self->_mapsSuggestionsEngine, 0);
}

@end