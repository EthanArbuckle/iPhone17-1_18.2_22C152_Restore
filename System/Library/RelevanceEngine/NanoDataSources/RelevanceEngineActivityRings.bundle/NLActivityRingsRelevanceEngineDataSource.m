@interface NLActivityRingsRelevanceEngineDataSource
- (HKActivitySummary)currentSummary;
- (HKHealthStore)healthStore;
- (NLActivityRingsRelevanceEngineDataSource)init;
- (NSSet)queries;
- (REDailyRoutineRelevanceProvider)downtimeRelevanceProvider;
- (id)supportedSections;
- (void)_executeQuery:(id)a3;
- (void)_generateRingsElement;
- (void)_startCurrentActivitySummaryQuery;
- (void)_startCurrentActivitySummaryQueryWithRemainingRetries:(unint64_t)a3;
- (void)_stopQueries;
- (void)dealloc;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)pause;
- (void)resume;
- (void)setCurrentSummary:(id)a3;
- (void)setDowntimeRelevanceProvider:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setQueries:(id)a3;
@end

@implementation NLActivityRingsRelevanceEngineDataSource

- (NLActivityRingsRelevanceEngineDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)NLActivityRingsRelevanceEngineDataSource;
  v2 = [(NLActivityRingsRelevanceEngineDataSource *)&v10 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v2->_didSetupElements = 0;
    v5 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
    [(NLActivityRingsRelevanceEngineDataSource *)v2 setHealthStore:v5];

    v6 = +[NSSet set];
    [(NLActivityRingsRelevanceEngineDataSource *)v2 setQueries:v6];

    id v7 = [objc_alloc((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:2];
    [(NLActivityRingsRelevanceEngineDataSource *)v2 setDowntimeRelevanceProvider:v7];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_generateRingsElement" name:HKUserPreferencesDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NLActivityRingsRelevanceEngineDataSource;
  [(NLActivityRingsRelevanceEngineDataSource *)&v4 dealloc];
}

- (void)_generateRingsElement
{
  uint64_t v3 = [(NLActivityRingsRelevanceEngineDataSource *)self currentSummary];

  if (v3)
  {
    objc_super v4 = [(NLActivityRingsRelevanceEngineDataSource *)self delegate];
    uint64_t v5 = [v4 elementOperationQueue];
    v6 = v5;
    if (v4 && v5)
    {
      if (self->_didSetupElements)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v18 = 0x2020000000;
        char v19 = 0;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_4E7C;
        block[3] = &unk_8368;
        p_long long buf = &buf;
        id v7 = v4;
        id v15 = v7;
        dispatch_sync(v6, block);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_4EEC;
        v11[3] = &unk_8390;
        v13 = &buf;
        v11[4] = self;
        id v12 = v7;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        _HKInitializeLogging();
        v8 = (void *)HKLogCoaching;
        if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          objc_super v10 = [(NLActivityRingsRelevanceEngineDataSource *)self currentSummary];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v10;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Creating element with current summary = %@", (uint8_t *)&buf, 0xCu);
        }
        self->_didSetupElements = 1;
        [v4 invalidateElements];
      }
    }
  }
}

- (void)pause
{
  _HKInitializeLogging();
  uint64_t v3 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Pause requested.", v4, 2u);
  }
  [(NLActivityRingsRelevanceEngineDataSource *)self _stopQueries];
}

- (void)resume
{
  _HKInitializeLogging();
  uint64_t v3 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Resume requested.", v4, 2u);
  }
  [(NLActivityRingsRelevanceEngineDataSource *)self _startCurrentActivitySummaryQuery];
}

- (id)supportedSections
{
  uint64_t v4 = REDefaultSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  v8 = HKLogCoaching;
  if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Elements requested (section = %{public}@).", buf, 0xCu);
  }
  if ([v6 isEqualToString:REDefaultSectionIdentifier])
  {
    serialQueue = self->_serialQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5378;
    v10[3] = &unk_83B8;
    v10[4] = self;
    id v11 = v7;
    dispatch_async(serialQueue, v10);
  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSArray0__struct);
  }
}

- (void)_startCurrentActivitySummaryQuery
{
}

- (void)_startCurrentActivitySummaryQueryWithRemainingRetries:(unint64_t)a3
{
  _HKInitializeLogging();
  uint64_t v5 = HKLogCoaching;
  if (a3)
  {
    if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v15 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Supergreen-Rings] Trying to start current activity summary query with remaining retries %lu.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_5748;
    id v12 = &unk_8408;
    objc_copyWeak(v13, (id *)buf);
    v13[1] = (id)a3;
    id v6 = objc_retainBlock(&v9);
    id v7 = objc_alloc((Class)_HKCurrentActivitySummaryQuery);
    id v8 = objc_msgSend(v7, "initWithUpdateHandler:", v6, v9, v10, v11, v12);
    [(NLActivityRingsRelevanceEngineDataSource *)self _executeQuery:v8];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(HKLogCoaching, OS_LOG_TYPE_ERROR))
  {
    sub_5D84(v5);
  }
}

- (void)_executeQuery:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5A28;
  v7[3] = &unk_83E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_stopQueries
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5B2C;
  block[3] = &unk_8430;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSSet)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (HKActivitySummary)currentSummary
{
  return self->_currentSummary;
}

- (void)setCurrentSummary:(id)a3
{
}

- (REDailyRoutineRelevanceProvider)downtimeRelevanceProvider
{
  return self->_downtimeRelevanceProvider;
}

- (void)setDowntimeRelevanceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeRelevanceProvider, 0);
  objc_storeStrong((id *)&self->_currentSummary, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end