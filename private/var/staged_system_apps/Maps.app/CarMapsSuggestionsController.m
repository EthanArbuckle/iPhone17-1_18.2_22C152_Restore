@interface CarMapsSuggestionsController
- (BKSProcessAssertion)processAssertion;
- (BOOL)allowLowFuelAlert;
- (BOOL)holdProcessAssertion;
- (BOOL)monitorLowFuel;
- (BOOL)sinkAttached;
- (BOOL)sinkDetaching;
- (CarMapsSuggestionsController)init;
- (CarMapsSuggestionsObserver_LowFuel)lowFuelObserver;
- (MapsSuggestionsEngine)suggestionsEngine;
- (MapsSuggestionsFilter)myAdditionalFilter;
- (NSArray)suggestions;
- (NSHashTable)observers;
- (NSString)uniqueName;
- (NSTimer)processAssertionTimer;
- (unint64_t)routeGeniusAttemptCount;
- (unint64_t)suggestionCount;
- (void)_notifyObservers;
- (void)_verifyHaveObservers;
- (void)dealloc;
- (void)hintRefreshOfType:(int64_t)a3;
- (void)refreshSuggestions;
- (void)registerObserver:(id)a3;
- (void)setAllowLowFuelAlert:(BOOL)a3;
- (void)setHoldProcessAssertion:(BOOL)a3;
- (void)setLowFuelObserver:(id)a3;
- (void)setMonitorLowFuel:(BOOL)a3;
- (void)setMyAdditionalFilter:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProcessAssertionTimer:(id)a3;
- (void)setRouteGeniusAttemptCount:(unint64_t)a3;
- (void)setSinkAttached:(BOOL)a3;
- (void)setSinkDetaching:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestionsEngine:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CarMapsSuggestionsController

- (CarMapsSuggestionsController)init
{
  v13.receiver = self;
  v13.super_class = (Class)CarMapsSuggestionsController;
  v2 = [(CarMapsSuggestionsController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_sinkDetaching = 0;
    v2->_allowLowFuelAlert = 1;
    v4 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    observers = v3->_observers;
    v3->_observers = v4;

    uint64_t v6 = sub_100018584();
    suggestionsEngine = v3->_suggestionsEngine;
    v3->_suggestionsEngine = (MapsSuggestionsEngine *)v6;

    uint64_t v8 = objc_opt_new();
    lowFuelObserver = v3->_lowFuelObserver;
    v3->_lowFuelObserver = (CarMapsSuggestionsObserver_LowFuel *)v8;

    uint64_t v10 = +[MapsSuggestionsBlockFilter filterWithBlock:&stru_101315000];
    myAdditionalFilter = v3->_myAdditionalFilter;
    v3->_myAdditionalFilter = (MapsSuggestionsFilter *)v10;
  }
  return v3;
}

- (void)dealloc
{
  [(CarMapsSuggestionsController *)self setSinkAttached:0];
  v3.receiver = self;
  v3.super_class = (Class)CarMapsSuggestionsController;
  [(CarMapsSuggestionsController *)&v3 dealloc];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)hintRefreshOfType:(int64_t)a3
{
  v5 = [(CarMapsSuggestionsController *)self suggestionsEngine];
  [v5 hintRefreshOfType:a3];

  [(CarMapsSuggestionsController *)self refreshSuggestions];
}

- (void)refreshSuggestions
{
  [(CarMapsSuggestionsController *)self _verifyHaveObservers];
  if ([(CarMapsSuggestionsController *)self sinkAttached]
    && ![(CarMapsSuggestionsController *)self sinkDetaching])
  {
    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100A3DC9C;
    v14[3] = &unk_1012E6E78;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v8 = objc_retainBlock(v14);
    v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] Requesting topSuggestions from suggestions engine", v13, 2u);
    }

    uint64_t v10 = [(CarMapsSuggestionsController *)self suggestionsEngine];
    if (qword_101610560 != -1) {
      dispatch_once(&qword_101610560, &stru_101314FE0);
    }
    uint64_t v11 = qword_101610558;
    v12 = dispatch_get_global_queue(2, 0);
    [v10 topSuggestionsForSink:self count:v11 transportType:0 callback:v8 onQueue:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_super v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if ([(CarMapsSuggestionsController *)self sinkAttached]) {
        v4 = @"YES";
      }
      else {
        v4 = @"NO";
      }
      v5 = v4;
      if ([(CarMapsSuggestionsController *)self sinkDetaching]) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      v7 = v6;
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] skipping suggestions refresh sinkAttached=%{public}@ sinkDetaching=%{public}@", buf, 0x16u);
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v8 = a3;
  v4 = [(CarMapsSuggestionsController *)self observers];
  objc_sync_enter(v4);
  v5 = [(CarMapsSuggestionsController *)self observers];
  unsigned __int8 v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    v7 = [(CarMapsSuggestionsController *)self observers];
    [v7 addObject:v8];

    if (![(CarMapsSuggestionsController *)self sinkAttached]) {
      [(CarMapsSuggestionsController *)self setSinkAttached:1];
    }
  }
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v8 = a3;
  v4 = [(CarMapsSuggestionsController *)self observers];
  objc_sync_enter(v4);
  v5 = [(CarMapsSuggestionsController *)self observers];
  unsigned int v6 = [v5 containsObject:v8];

  if (v6)
  {
    v7 = [(CarMapsSuggestionsController *)self observers];
    [v7 removeObject:v8];

    [(CarMapsSuggestionsController *)self _verifyHaveObservers];
  }
  objc_sync_exit(v4);
}

- (void)_notifyObservers
{
  objc_super v3 = [(CarMapsSuggestionsController *)self observers];
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CarMapsSuggestionsController *)self observers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v6 = 138412290;
    long long v11 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 carMapsSuggestionControllerDidRefresh:self v11];
        uint64_t v10 = sub_100015DB4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v11;
          v17 = v9;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
  [(CarMapsSuggestionsController *)self _verifyHaveObservers];
}

- (void)_verifyHaveObservers
{
  objc_super v3 = [(CarMapsSuggestionsController *)self observers];
  objc_sync_enter(v3);
  v4 = [(CarMapsSuggestionsController *)self observers];
  id v5 = [v4 allObjects];
  if ([v5 count] || -[CarMapsSuggestionsController sinkDetaching](self, "sinkDetaching"))
  {
  }
  else
  {
    unsigned int v6 = [(CarMapsSuggestionsController *)self sinkAttached];

    if (v6)
    {
      uint64_t v7 = sub_100015DB4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] No observers, detaching from suggestions", (uint8_t *)buf, 2u);
      }

      [(CarMapsSuggestionsController *)self setSinkDetaching:1];
      objc_initWeak(buf, self);
      dispatch_time_t v8 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A3E328;
      block[3] = &unk_1012E6708;
      objc_copyWeak(&v10, buf);
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
  objc_sync_exit(v3);
}

- (void)setHoldProcessAssertion:(BOOL)a3
{
  if (self->_holdProcessAssertion != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_holdProcessAssertion) {
        unsigned int v6 = @"YES";
      }
      else {
        unsigned int v6 = @"NO";
      }
      uint64_t v7 = v6;
      if (v3) {
        dispatch_time_t v8 = @"YES";
      }
      else {
        dispatch_time_t v8 = @"NO";
      }
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      __int16 v18 = 2114;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] _holdProcessAssertion=%{public}@ holdProcessAssertion=%{public}@", buf, 0x16u);
    }
    self->_holdProcessAssertion = v3;
    id v10 = [(CarMapsSuggestionsController *)self processAssertion];
    [v10 invalidate];

    long long v11 = [(CarMapsSuggestionsController *)self processAssertionTimer];
    [v11 invalidate];

    [(CarMapsSuggestionsController *)self setProcessAssertion:0];
    [(CarMapsSuggestionsController *)self setProcessAssertionTimer:0];
    if (v3)
    {
      id v12 = [objc_alloc((Class)BKSProcessAssertion) initWithBundleIdentifier:@"com.apple.Maps" flags:3 reason:3 name:@"com.apple.Maps.LowFuelAlert" withHandler:&stru_101315020];
      [(CarMapsSuggestionsController *)self setProcessAssertion:v12];

      [(CarMapsSuggestionsController *)self refreshSuggestions];
      objc_initWeak((id *)buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100A3E728;
      v14[3] = &unk_1012E73C8;
      objc_copyWeak(&v15, (id *)buf);
      long long v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v14 block:60.0];
      [(CarMapsSuggestionsController *)self setProcessAssertionTimer:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)setMonitorLowFuel:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CarMapsSuggestionsController *)self lowFuelObserver];
  [v4 setActive:v3];
}

- (BOOL)monitorLowFuel
{
  v2 = [(CarMapsSuggestionsController *)self lowFuelObserver];
  unsigned __int8 v3 = [v2 active];

  return v3;
}

- (void)setSinkAttached:(BOOL)a3
{
  if (self->_sinkAttached != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_sinkAttached) {
        unsigned int v6 = @"YES";
      }
      else {
        unsigned int v6 = @"NO";
      }
      uint64_t v7 = v6;
      if (v3) {
        dispatch_time_t v8 = @"YES";
      }
      else {
        dispatch_time_t v8 = @"NO";
      }
      v9 = v8;
      int v20 = 138412546;
      v21 = v7;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] _sinkAttached=%@ sinkAttached=%@", (uint8_t *)&v20, 0x16u);
    }
    self->_sinkAttached = v3;
    if (v3)
    {
      id v10 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_101315040];
      long long v11 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      [v11 addAdditionalFilter:v10 forSink:self];

      id v12 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      id v13 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
      [v12 addAdditionalFilter:v13 forSink:self];

      long long v14 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      id v15 = [(CarMapsSuggestionsController *)self myAdditionalFilter];
      [v14 addAdditionalFilter:v15 forSink:self];

      v16 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      [v16 attachSink:self];

      [(CarMapsSuggestionsController *)self refreshSuggestions];
    }
    else
    {
      v17 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      [v17 detachSink:self];

      __int16 v18 = [(CarMapsSuggestionsController *)self suggestionsEngine];
      v19 = [(CarMapsSuggestionsController *)self myAdditionalFilter];
      [v18 removeAdditionalFilter:v19 forSink:self];

      [(CarMapsSuggestionsController *)self setSuggestions:0];
    }
  }
}

- (unint64_t)suggestionCount
{
  v2 = [(CarMapsSuggestionsController *)self suggestions];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)setAllowLowFuelAlert:(BOOL)a3
{
  if (self->_allowLowFuelAlert != a3)
  {
    BOOL v3 = a3;
    self->_BOOL allowLowFuelAlert = a3;
    id obj = [(CarMapsSuggestionsController *)self observers];
    objc_sync_enter(obj);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(CarMapsSuggestionsController *)self observers];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v10 = sub_100015DB4();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              BOOL allowLowFuelAlert = self->_allowLowFuelAlert;
              *(_DWORD *)buf = 138412546;
              __int16 v18 = v9;
              __int16 v19 = 2048;
              BOOL v20 = allowLowFuelAlert;
            }

            [v9 setAllowLowFuelSuggestion:v3];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v6);
    }

    objc_sync_exit(obj);
  }
}

- (NSArray)suggestions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSuggestions:(id)a3
{
}

- (BOOL)allowLowFuelAlert
{
  return self->_allowLowFuelAlert;
}

- (BOOL)holdProcessAssertion
{
  return self->_holdProcessAssertion;
}

- (BOOL)sinkAttached
{
  return self->_sinkAttached;
}

- (MapsSuggestionsEngine)suggestionsEngine
{
  return self->_suggestionsEngine;
}

- (void)setSuggestionsEngine:(id)a3
{
}

- (MapsSuggestionsFilter)myAdditionalFilter
{
  return self->_myAdditionalFilter;
}

- (void)setMyAdditionalFilter:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
}

- (BOOL)sinkDetaching
{
  return self->_sinkDetaching;
}

- (void)setSinkDetaching:(BOOL)a3
{
  self->_sinkDetaching = a3;
}

- (unint64_t)routeGeniusAttemptCount
{
  return self->_routeGeniusAttemptCount;
}

- (void)setRouteGeniusAttemptCount:(unint64_t)a3
{
  self->_routeGeniusAttemptCount = a3;
}

- (CarMapsSuggestionsObserver_LowFuel)lowFuelObserver
{
  return (CarMapsSuggestionsObserver_LowFuel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLowFuelObserver:(id)a3
{
}

- (BKSProcessAssertion)processAssertion
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProcessAssertion:(id)a3
{
}

- (NSTimer)processAssertionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProcessAssertionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_lowFuelObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_myAdditionalFilter, 0);
  objc_storeStrong((id *)&self->_suggestionsEngine, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end