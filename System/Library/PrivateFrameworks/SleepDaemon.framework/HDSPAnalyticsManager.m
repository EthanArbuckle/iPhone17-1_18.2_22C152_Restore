@interface HDSPAnalyticsManager
+ (id)dailyCollectionActivity;
+ (id)dailyCollectionCriteria;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryMorningIndexRangeForDate:(id)a3;
- (BOOL)isDataCollectionEnabled;
- (BOOL)isDataCollectionInProgress;
- (HDSPActivityScheduler)dataCollectionScheduler;
- (HDSPAnalyticsManager)initWithEnvironment:(id)a3;
- (HDSPAnalyticsManager)initWithEnvironment:(id)a3 analyticsManager:(id)a4 dataCollectionScheduler:(id)a5;
- (HDSPEnvironment)environment;
- (HKSPAnalyticsManager)analyticsManager;
- (HKSPMutexProvider)mutexProvider;
- (id)_makeReportQueryWithMorningIndexRange:(id)a3 resultsHandler:(id)a4;
- (id)currentDate;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)_lock_executeQuery:(id)a3;
- (void)_processQueryResultsWithSummaries:(id)a3 breathingDisturbanceSamples:(id)a4 sleepApneaEventSamples:(id)a5 sleepApneaFeatureStatus:(id)a6 queryRange:(id)a7 error:(id)a8;
- (void)_pruneExpiredWindDownActionDataBeforeQueryRange:(id)a3;
- (void)_submitAnalyticsReportsUsingBuilder:(id)a3;
- (void)_unit_testing_pruneExpiredWindDownActionData;
- (void)_withLock:(id)a3;
- (void)cancelDailyCollectionActivity;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)scheduleDailyCollectionActivity;
- (void)significantTimeChangeDetected:(id)a3;
- (void)updateScheduledActivity;
@end

@implementation HDSPAnalyticsManager

- (HDSPAnalyticsManager)initWithEnvironment:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F75DA0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = objc_msgSend(MEMORY[0x263EFFA40], "hksp_analyticsUserDefaults");
  v8 = (void *)[v6 initWithUserDefaults:v7];

  v9 = [HDSPXPCActivityScheduler alloc];
  v10 = [v5 defaultCallbackScheduler];
  v11 = [(HDSPXPCActivityScheduler *)v9 initWithCallbackScheduler:v10];

  v12 = [(HDSPAnalyticsManager *)self initWithEnvironment:v5 analyticsManager:v8 dataCollectionScheduler:v11];
  return v12;
}

- (HDSPAnalyticsManager)initWithEnvironment:(id)a3 analyticsManager:(id)a4 dataCollectionScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDSPAnalyticsManager;
  v11 = [(HDSPAnalyticsManager *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_analyticsManager, a4);
    v13 = [v8 mutexGenerator];
    uint64_t v14 = v13[2]();
    mutexProvider = v12->_mutexProvider;
    v12->_mutexProvider = (HKSPMutexProvider *)v14;

    objc_storeStrong((id *)&v12->_dataCollectionScheduler, a5);
    v12->_isDataCollectionInProgress = 0;
    v16 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment will become ready", (uint8_t *)&v9, 0xCu);
  }
  v7 = [v4 timeChangeListener];
  [v7 addObserver:self];

  id v8 = [v4 notificationListener];

  [v8 addObserver:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment did become ready", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPAnalyticsManager *)self updateScheduledActivity];
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Significant time change detected", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPAnalyticsManager *)self updateScheduledActivity];
}

- (void)updateScheduledActivity
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating schedule activity", (uint8_t *)&v5, 0xCu);
  }
  if ([(HDSPAnalyticsManager *)self isDataCollectionEnabled]) {
    [(HDSPAnalyticsManager *)self scheduleDailyCollectionActivity];
  }
  else {
    [(HDSPAnalyticsManager *)self cancelDailyCollectionActivity];
  }
}

- (void)scheduleDailyCollectionActivity
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling daily collection activity", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  int v5 = [(HDSPAnalyticsManager *)self dataCollectionScheduler];
  id v6 = [(id)objc_opt_class() dailyCollectionActivity];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke;
  v7[3] = &unk_2645D92B0;
  objc_copyWeak(&v8, (id *)buf);
  [v5 scheduleActivity:v6 activityHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running daily collection activity", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke_288;
  v8[3] = &unk_2645D9288;
  v8[4] = WeakRetained;
  id v9 = v3;
  id v7 = v3;
  [WeakRetained _withLock:v8];
}

uint64_t __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke_288(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_executeQuery:", *(void *)(a1 + 40));
}

- (void)cancelDailyCollectionActivity
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling daily collection activity", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HDSPAnalyticsManager *)self dataCollectionScheduler];
  [v5 unscheduleActivities];
}

+ (id)dailyCollectionCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A8], 1);

  return v2;
}

+ (id)dailyCollectionActivity
{
  id v3 = [HDSPXPCActivity alloc];
  id v4 = [a1 dailyCollectionCriteria];
  int v5 = [(HDSPXPCActivity *)v3 initWithEventName:@"com.apple.sleep.analytics-daily.activity" options:0 criteria:v4];

  return v5;
}

- (BOOL)isDataCollectionEnabled
{
  return [(HKSPAnalyticsManager *)self->_analyticsManager isDiagnosticDataSubmissionAllowed];
}

- (id)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v3 = [WeakRetained currentDateProvider];
  id v4 = v3[2]();

  return v4;
}

- (void)_withLock:(id)a3
{
}

- (void)_lock_executeQuery:(id)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing query", (uint8_t *)&buf, 0xCu);
  }
  if (![(HDSPAnalyticsManager *)self isDataCollectionEnabled])
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      id v9 = v8;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Data collection disabled; not executing query",
        (uint8_t *)&buf,
        0xCu);
    }
    goto LABEL_7;
  }
  if ([(HDSPAnalyticsManager *)self isDataCollectionInProgress])
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v49;
      id v50 = v49;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Data collection is already in progress; not executing query",
        (uint8_t *)&buf,
        0xCu);
    }
LABEL_7:

    goto LABEL_21;
  }
  self->_isDataCollectionInProgress = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v95 = 0x3010000000;
  uint64_t v97 = 0;
  uint64_t v98 = 0;
  v96 = "";
  id v10 = [(HDSPAnalyticsManager *)self currentDate];
  uint64_t v97 = [(HDSPAnalyticsManager *)self _queryMorningIndexRangeForDate:v10];
  uint64_t v98 = v11;

  uint64_t v12 = dispatch_group_create();
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__0;
  v84[4] = __Block_byref_object_dispose__0;
  id v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__0;
  v82[4] = __Block_byref_object_dispose__0;
  id v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__0;
  v80[4] = __Block_byref_object_dispose__0;
  id v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__0;
  v78[4] = __Block_byref_object_dispose__0;
  id v79 = 0;
  dispatch_group_enter(v12);
  uint64_t v13 = *((void *)&buf + 1);
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke;
  v74[3] = &unk_2645D92D8;
  v74[4] = self;
  v76 = v84;
  v77 = v82;
  uint64_t v14 = v12;
  v75 = v14;
  v15 = -[HDSPAnalyticsManager _makeReportQueryWithMorningIndexRange:resultsHandler:](self, "_makeReportQueryWithMorningIndexRange:resultsHandler:", *(void *)(v13 + 32), *(void *)(v13 + 40), v74);
  v16 = (void *)[objc_alloc(MEMORY[0x263F0A770]) initWithIdentifier:@"Analytics" mode:0];
  [v15 setCacheSettings:v16];
  v55 = v15;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_super v18 = [WeakRetained healthStoreProvider];
  v19 = [v18 healthStore];

  [v19 executeQuery:v55];
  id v20 = objc_loadWeakRetained((id *)&self->_environment);
  v21 = [v20 behavior];
  v22 = [v21 features];
  LODWORD(v18) = [v22 nebula];

  if (v18)
  {
    v23 = HKSPLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      *(_DWORD *)v86 = 138543362;
      v87 = v24;
      id v25 = v24;
      _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning bd queries", v86, 0xCu);
    }
    dispatch_group_enter(v14);
    id v26 = objc_alloc(MEMORY[0x263F0A678]);
    v27 = [MEMORY[0x263F0A6E8] _typeWithIdentifier:*MEMORY[0x263F09BD8]];
    v28 = objc_msgSend(MEMORY[0x263F08A98], "hk_predicateForSamplesInDayIndexRange:", *(void *)(*((void *)&buf + 1) + 32), *(void *)(*((void *)&buf + 1) + 40));
    v29 = (void *)[v26 initWithSampleType:v27 predicate:v28];
    v93 = v29;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];

    id v30 = objc_alloc(MEMORY[0x263F0A6E0]);
    uint64_t v31 = *MEMORY[0x263F09F88];
    v32 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:1];
    v92 = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_303;
    v70[3] = &unk_2645D9300;
    v70[4] = self;
    v72 = v84;
    v73 = v80;
    v34 = v14;
    v71 = v34;
    v53 = (void *)[v30 initWithQueryDescriptors:v54 limit:0 sortDescriptors:v33 resultsHandler:v70];

    [v19 executeQuery:v53];
    dispatch_group_enter(v34);
    id v35 = objc_alloc(MEMORY[0x263F0A678]);
    v36 = [MEMORY[0x263F0A6E8] _typeWithIdentifier:*MEMORY[0x263F09418]];
    v37 = (void *)[v35 initWithSampleType:v36 predicate:0];
    v91 = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];

    id v39 = objc_alloc(MEMORY[0x263F0A6E0]);
    v40 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v31 ascending:1];
    v90 = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_305;
    v66[3] = &unk_2645D9300;
    v66[4] = self;
    v68 = v84;
    v69 = v78;
    v67 = v34;
    v42 = (void *)[v39 initWithQueryDescriptors:v38 limit:0 sortDescriptors:v41 resultsHandler:v66];

    [v19 executeQuery:v42];
    id v43 = objc_alloc(MEMORY[0x263F0A3D0]);
    v44 = (void *)[v43 initWithFeatureIdentifier:*MEMORY[0x263F097D8] healthStore:v19];
    id v65 = 0;
    v45 = [v44 featureStatusWithError:&v65];
    id v46 = v65;
    if (v46)
    {
      v47 = HKSPLogForCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v51 = objc_opt_class();
        *(_DWORD *)v86 = 138543618;
        v87 = v51;
        __int16 v88 = 2112;
        id v89 = v46;
        id v52 = v51;
        _os_log_error_impl(&dword_221A52000, v47, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying fetching apnea feature status: %@", v86, 0x16u);
      }
    }
  }
  else
  {
    v45 = 0;
  }
  objc_initWeak((id *)v86, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_307;
  block[3] = &unk_2645D9328;
  objc_copyWeak(&v64, (id *)v86);
  v59 = v82;
  v60 = v80;
  id v57 = v4;
  id v58 = v45;
  v61 = v78;
  p_long long buf = &buf;
  v63 = v84;
  id v48 = v45;
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)v86);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v80, 8);

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);

  _Block_object_dispose(&buf, 8);
LABEL_21:
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2112;
      id v16 = v7;
      id v12 = v14;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying for sleep day summaries: %@", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_303(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2112;
      id v16 = v7;
      id v12 = v14;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying for breathing disturbance samples: %@", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_305(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2112;
      id v16 = v7;
      id v12 = v14;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying for sleep apnea event samples: %@", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_307(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if ([*(id *)(a1 + 32) deferIfNecessary])
  {
    id v3 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    id v4 = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_2;
  }
  else
  {
    objc_msgSend(WeakRetained, "_processQueryResultsWithSummaries:breathingDisturbanceSamples:sleepApneaEventSamples:sleepApneaFeatureStatus:queryRange:error:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    id v3 = v5;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    id v4 = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_3;
  }
  v3[2] = v4;
  v3[3] = &unk_2645D90C0;
  v3[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_withLock:");
}

uint64_t __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)_processQueryResultsWithSummaries:(id)a3 breathingDisturbanceSamples:(id)a4 sleepApneaEventSamples:(id)a5 sleepApneaFeatureStatus:(id)a6 queryRange:(id)a7 error:(id)a8
{
  int64_t var1 = a7.var1;
  int64_t var0 = a7.var0;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = HKSPLogForCategory();
  id v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      id v28 = v18;
      id v21 = v26;
      _os_log_error_impl(&dword_221A52000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Queries failed with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = (id)objc_opt_class();
      id v22 = v26;
      _os_log_impl(&dword_221A52000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Queries succeeded", buf, 0xCu);
    }
    v23 = [HDSPAnalyticsDailyReportBuilder alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    id v20 = -[HDSPAnalyticsDailyReportBuilder initWithEnvironment:daySummaries:breathingDisturbanceSamples:sleepApneaEventSamples:sleepApneaFeatureStatus:morningIndexRange:](v23, "initWithEnvironment:daySummaries:breathingDisturbanceSamples:sleepApneaEventSamples:sleepApneaFeatureStatus:morningIndexRange:", WeakRetained, v14, v15, v16, v17, var0, var1);

    [(HDSPAnalyticsManager *)self _submitAnalyticsReportsUsingBuilder:v20];
    -[HDSPAnalyticsManager _pruneExpiredWindDownActionDataBeforeQueryRange:](self, "_pruneExpiredWindDownActionDataBeforeQueryRange:", var0, var1);
  }
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryMorningIndexRangeForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  int v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  uint64_t v6 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", v5);

  uint64_t v7 = HDSPAnalyticsDailyReportSummaryDayCount;
  uint64_t v8 = v6 - HDSPAnalyticsDailyReportSummaryDayCount + 1;

  int64_t v9 = v8;
  int64_t v10 = v7;
  result.int64_t var1 = v10;
  result.int64_t var0 = v9;
  return result;
}

- (id)_makeReportQueryWithMorningIndexRange:(id)a3 resultsHandler:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = (objc_class *)MEMORY[0x263F0A778];
  id v7 = a4;
  uint64_t v8 = objc_msgSend([v6 alloc], "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 5, v7);

  [v8 setDebugIdentifier:@"SleepDailyAnalyticsReportQuery"];

  return v8;
}

- (void)_submitAnalyticsReportsUsingBuilder:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a3 buildReports];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending daily reports: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(HDSPAnalyticsManager *)self analyticsManager];
  [v7 trackEvents:v4];
}

- (void)_pruneExpiredWindDownActionDataBeforeQueryRange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3.var1 <= 0) {
    int64_t v4 = 0x7FFFFFFFFFFFFFFELL;
  }
  else {
    int64_t v4 = a3.var1 + a3.var0 - 2;
  }
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = NSNumber;
    id v8 = v6;
    id v9 = [v7 numberWithInteger:v4];
    int v12 = 138543618;
    int v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruning wind down action data prior to %{public}@", (uint8_t *)&v12, 0x16u);
  }
  __int16 v10 = [(HDSPAnalyticsManager *)self analyticsManager];
  id v11 = [v10 analyticsStore];
  [v11 removeAllWindDownActionsBeforeMorningIndex:v4];
}

- (void)_unit_testing_pruneExpiredWindDownActionData
{
  id v5 = [(HDSPAnalyticsManager *)self currentDate];
  uint64_t v3 = [(HDSPAnalyticsManager *)self _queryMorningIndexRangeForDate:v5];
  -[HDSPAnalyticsManager _pruneExpiredWindDownActionDataBeforeQueryRange:](self, "_pruneExpiredWindDownActionDataBeforeQueryRange:", v3, v4);
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.sleepd.analytics"])
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v5;
      id v7 = v12;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__HDSPAnalyticsManager_notificationListener_didReceiveNotificationWithName___block_invoke;
    v10[3] = &unk_2645D90C0;
    v10[4] = self;
    [(HDSPAnalyticsManager *)self _withLock:v10];
  }
  id v8 = [MEMORY[0x263F58190] futureWithNoResult];

  return v8;
}

void __76__HDSPAnalyticsManager_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [(id)objc_opt_class() dailyCollectionActivity];
  objc_msgSend(v1, "_lock_executeQuery:", v2);
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPActivityScheduler)dataCollectionScheduler
{
  return self->_dataCollectionScheduler;
}

- (BOOL)isDataCollectionInProgress
{
  return self->_isDataCollectionInProgress;
}

- (HKSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_dataCollectionScheduler, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end