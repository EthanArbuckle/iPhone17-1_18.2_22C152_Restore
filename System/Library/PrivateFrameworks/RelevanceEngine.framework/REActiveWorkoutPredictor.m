@interface REActiveWorkoutPredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (BOOL)hasActiveWorkout;
- (NSDate)lastCompletedWorkoutDate;
- (float)dailyAverageWorkouts;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (unint64_t)numberOfWorkoutsPerformedToday;
- (void)_cancelMonitoringWorkoutIfNeeded;
- (void)_processWorkoutHistoryData:(id)a3 completion:(id)a4;
- (void)_queue_fetchWorkoutHistory;
- (void)_scheduleFetchWorkoutTimer;
- (void)_updateWorkoutState;
- (void)dealloc;
- (void)pause;
- (void)resume;
- (void)setHasActiveWorkout:(BOOL)a3;
- (void)setLastCompletedWorkoutDate:(id)a3;
@end

@implementation REActiveWorkoutPredictor

+ (id)supportedFeatures
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature activeWorkoutFeature];
  v4 = +[REFeature dailyAverageWorkoutCountFeature];
  v9[1] = v4;
  v5 = +[REFeature performedWorkoutCountFeature];
  v9[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [(REFeatureSet *)v2 initWithFeatures:v6];

  return v7;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)REActiveWorkoutPredictor;
  v2 = [(REPredictor *)&v5 _init];
  v3 = v2;
  if (v2)
  {
    [v2 setHasActiveWorkout:0];
    v3[17] = 0;
    *((void *)v3 + 9) = 0;
  }
  return v3;
}

+ (double)updateInterval
{
  return 43200.0;
}

- (void)dealloc
{
  [(REActiveWorkoutPredictor *)self _cancelMonitoringWorkoutIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)REActiveWorkoutPredictor;
  [(REPredictor *)&v3 dealloc];
}

- (void)resume
{
  [(REActiveWorkoutPredictor *)self _cancelMonitoringWorkoutIfNeeded];
  if (HealthKitLibraryCore_0())
  {
    objc_initWeak(&location, self);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    objc_super v3 = (const char **)getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr;
    uint64_t v35 = getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr;
    if (!getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_block_invoke;
      v30 = &unk_2644BC768;
      v31 = &v32;
      v4 = (void *)HealthKitLibrary_0();
      objc_super v5 = dlsym(v4, "kHKHealthDaemonActiveWorkoutServersDidUpdateNotification");
      *(void *)(v31[1] + 24) = v5;
      getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr = *(void *)(v31[1] + 24);
      objc_super v3 = (const char **)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (v3)
    {
      v6 = *v3;
      v7 = MEMORY[0x263EF83A0];
      id v8 = MEMORY[0x263EF83A0];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __34__REActiveWorkoutPredictor_resume__block_invoke;
      handler[3] = &unk_2644BDA90;
      objc_copyWeak(&v25, &location);
      notify_register_dispatch(v6, &self->_workoutStateNotifyToken, v7, handler);

      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v9 = (void *)getHKObserverQueryClass_softClass;
      uint64_t v35 = getHKObserverQueryClass_softClass;
      if (!getHKObserverQueryClass_softClass)
      {
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __getHKObserverQueryClass_block_invoke;
        v30 = &unk_2644BC768;
        v31 = &v32;
        __getHKObserverQueryClass_block_invoke((uint64_t)&v27);
        v9 = (void *)v33[3];
      }
      v10 = v9;
      _Block_object_dispose(&v32, 8);
      id v11 = [v10 alloc];
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v12 = (void *)getHKSampleTypeClass_softClass;
      uint64_t v35 = getHKSampleTypeClass_softClass;
      if (!getHKSampleTypeClass_softClass)
      {
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __getHKSampleTypeClass_block_invoke;
        v30 = &unk_2644BC768;
        v31 = &v32;
        __getHKSampleTypeClass_block_invoke((uint64_t)&v27);
        v12 = (void *)v33[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v32, 8);
      v14 = [v13 workoutType];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __34__REActiveWorkoutPredictor_resume__block_invoke_2;
      v22[3] = &unk_2644BDAB8;
      objc_copyWeak(&v23, &location);
      v15 = (void *)[v11 initWithSampleType:v14 predicate:0 updateHandler:v22];

      v16 = +[RESingleton sharedInstance];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __34__REActiveWorkoutPredictor_resume__block_invoke_3;
      v20[3] = &unk_2644BD9B0;
      v20[4] = self;
      id v17 = v15;
      id v21 = v17;
      [v16 accessHealthStore:v20];

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      v19 = RESignificantTimeChangeNotification();
      [v18 addObserver:self selector:sel__scheduleFetchWorkoutTimer name:v19 object:0];

      [(REActiveWorkoutPredictor *)self _scheduleFetchWorkoutTimer];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
  }
}

void __34__REActiveWorkoutPredictor_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateWorkoutState];
    id WeakRetained = v2;
  }
}

void __34__REActiveWorkoutPredictor_resume__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _scheduleFetchWorkoutTimer];
    id WeakRetained = v2;
  }
}

void __34__REActiveWorkoutPredictor_resume__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  id v4 = a2;
  [v4 executeQuery:*(void *)(a1 + 40)];
}

- (void)pause
{
  [(REActiveWorkoutPredictor *)self _cancelMonitoringWorkoutIfNeeded];
  objc_super v3 = +[RESingleton sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__REActiveWorkoutPredictor_pause__block_invoke;
  v7[3] = &unk_2644BD9D8;
  v7[4] = self;
  [v3 accessHealthStore:v7];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = RESignificantTimeChangeNotification();
  [v4 removeObserver:self name:v5 object:0];

  [(REUpNextTimer *)self->_workoutQueryCoalesceTimer invalidate];
  workoutQueryCoalesceTimer = self->_workoutQueryCoalesceTimer;
  self->_workoutQueryCoalesceTimer = 0;
}

void __33__REActiveWorkoutPredictor_pause__block_invoke(uint64_t a1, void *a2)
{
  [a2 stopQuery:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = 0;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7 = a3;
  id v8 = +[REFeature activeWorkoutFeature];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = +[REFeatureValue featureValueWithBool:[(REActiveWorkoutPredictor *)self hasActiveWorkout]];
  }
  else
  {
    id v11 = +[REFeature dailyAverageWorkoutCountFeature];
    int v12 = [v7 isEqual:v11];

    if (v12) {
      +[REFeatureValue featureValueWithDouble:self->_dailyAverageWorkouts];
    }
    else {
    uint64_t v10 = +[REFeatureValue featureValueWithInt64:self->_numberOfWorkoutsPerformedToday];
    }
  }
  id v13 = (void *)v10;

  return v13;
}

- (void)_cancelMonitoringWorkoutIfNeeded
{
  if (notify_is_valid_token(self->_workoutStateNotifyToken))
  {
    int workoutStateNotifyToken = self->_workoutStateNotifyToken;
    notify_cancel(workoutStateNotifyToken);
  }
}

- (void)_updateWorkoutState
{
  [(REPredictor *)self beginFetchingData];
  objc_initWeak(&location, self);
  uint64_t v3 = +[RESingleton sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke;
  v4[3] = &unk_2644BDB08;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 accessHealthStore:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_2;
    v6[3] = &unk_2644BDAE0;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6[4] = *(void *)(a1 + 32);
    [v3 _currentWorkoutSnapshotWithCompletion:v6];
    objc_destroyWeak(&v7);
  }
  else if (WeakRetained)
  {
    [WeakRetained setHasActiveWorkout:0];
    [v5 finishFetchingData];
    [v5 updateObservers];
  }
}

void __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (v7)
  {
    if ([v7 isFirstPartyWorkout])
    {
      unint64_t v9 = [v8 internalState];
      if (v9 >= 0x11) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = (0x1F80u >> v9) & 1;
      }
    }
    else
    {
      uint64_t v10 = (([v8 sessionState] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v10 != [*(id *)(a1 + 32) hasActiveWorkout])
  {
    [WeakRetained setHasActiveWorkout:v10];
    [WeakRetained updateObservers];
    int v12 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_3;
    block[3] = &unk_2644BC660;
    block[4] = WeakRetained;
    dispatch_async(v12, block);
  }
}

uint64_t __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchWorkoutHistory");
  id v2 = *(void **)(a1 + 32);
  return [v2 finishFetchingData];
}

- (void)_scheduleFetchWorkoutTimer
{
  id v3 = [(REPredictor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(v3, block);
}

void __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) invalidate];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:20.0];
  id v3 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke_2;
  v7[3] = &unk_2644BC700;
  objc_copyWeak(&v8, &location);
  uint64_t v4 = +[REUpNextTimer timerWithFireDate:v2 queue:v3 block:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v4;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [v3 isValid];

  uint64_t v4 = WeakRetained;
  if (v2 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue_fetchWorkoutHistory");
    uint64_t v4 = WeakRetained;
  }
}

- (void)_queue_fetchWorkoutHistory
{
  v51[3] = *MEMORY[0x263EF8340];
  if (HealthKitLibraryCore_0())
  {
    [(REPredictor *)self beginFetchingData];
    [(REUpNextTimer *)self->_workoutQueryCoalesceTimer invalidate];
    workoutQueryCoalesceTimer = self->_workoutQueryCoalesceTimer;
    self->_workoutQueryCoalesceTimer = 0;

    uint64_t v4 = [MEMORY[0x263EFF910] date];
    uint64_t v35 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v5 = [v35 dateByAddingUnit:16 value:-7 toDate:v4 options:0];
    uint64_t v34 = REStartOfDayForDate(v5);

    id v6 = REEndOfDayForDate(v4);
    id v7 = (void *)MEMORY[0x263F08730];
    id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"startDate >= %@", v34];
    v51[0] = v8;
    unint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"startDate <= %@", v6];
    v51[1] = v9;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    uint64_t v10 = (void *)getHKQueryClass_softClass;
    uint64_t v49 = getHKQueryClass_softClass;
    if (!getHKQueryClass_softClass)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getHKQueryClass_block_invoke;
      v44 = &unk_2644BC768;
      v45 = &v46;
      __getHKQueryClass_block_invoke((uint64_t)&v41);
      uint64_t v10 = (void *)v47[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v46, 8);
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    int v12 = (void *)getHKSourceClass_softClass;
    uint64_t v49 = getHKSourceClass_softClass;
    if (!getHKSourceClass_softClass)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getHKSourceClass_block_invoke;
      v44 = &unk_2644BC768;
      v45 = &v46;
      __getHKSourceClass_block_invoke((uint64_t)&v41);
      int v12 = (void *)v47[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v46, 8);
    v14 = [v13 defaultSource];
    v15 = [v11 predicateForObjectsFromSource:v14];
    v51[2] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
    id v17 = [v7 andPredicateWithSubpredicates:v16];

    v18 = (void *)MEMORY[0x263F08B30];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    v19 = (id *)getHKSampleSortIdentifierStartDateSymbolLoc_ptr;
    uint64_t v49 = getHKSampleSortIdentifierStartDateSymbolLoc_ptr;
    if (!getHKSampleSortIdentifierStartDateSymbolLoc_ptr)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getHKSampleSortIdentifierStartDateSymbolLoc_block_invoke;
      v44 = &unk_2644BC768;
      v45 = &v46;
      v20 = (void *)HealthKitLibrary_0();
      id v21 = dlsym(v20, "HKSampleSortIdentifierStartDate");
      *(void *)(v45[1] + 24) = v21;
      getHKSampleSortIdentifierStartDateSymbolLoc_ptr = *(void *)(v45[1] + 24);
      v19 = (id *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v19)
    {
      -[RELemmaEnumerator init]();
      __break(1u);
    }
    id v22 = *v19;
    id v23 = [v18 sortDescriptorWithKey:v22 ascending:0];

    objc_initWeak(&location, self);
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v24 = (void *)getHKSampleQueryClass_softClass;
    uint64_t v49 = getHKSampleQueryClass_softClass;
    if (!getHKSampleQueryClass_softClass)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getHKSampleQueryClass_block_invoke;
      v44 = &unk_2644BC768;
      v45 = &v46;
      __getHKSampleQueryClass_block_invoke((uint64_t)&v41);
      v24 = (void *)v47[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v46, 8);
    id v26 = [v25 alloc];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    uint64_t v27 = (void *)getHKObjectTypeClass_softClass;
    uint64_t v49 = getHKObjectTypeClass_softClass;
    if (!getHKObjectTypeClass_softClass)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getHKObjectTypeClass_block_invoke;
      v44 = &unk_2644BC768;
      v45 = &v46;
      __getHKObjectTypeClass_block_invoke((uint64_t)&v41);
      uint64_t v27 = (void *)v47[3];
    }
    id v28 = v27;
    _Block_object_dispose(&v46, 8);
    v29 = [v28 workoutType];
    v50 = v23;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke;
    v38[3] = &unk_2644BDB30;
    objc_copyWeak(&v39, &location);
    v31 = (void *)[v26 initWithSampleType:v29 predicate:v17 limit:100 sortDescriptors:v30 resultsHandler:v38];

    uint64_t v32 = +[RESingleton sharedInstance];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_2;
    v36[3] = &unk_2644BD9D8;
    id v33 = v31;
    id v37 = v33;
    [v32 accessHealthStore:v36];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
}

void __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = RELogForDomain(8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1((uint64_t)v9, v10);
    }

    id v8 = (id)MEMORY[0x263EFFA68];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v12 = RELogForDomain(8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E6E6000, v12, OS_LOG_TYPE_INFO, "Received new workout data", buf, 2u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_304;
    v13[3] = &unk_2644BC660;
    v13[4] = WeakRetained;
    [WeakRetained _processWorkoutHistoryData:v8 completion:v13];
  }
}

uint64_t __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_304(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFetchingData];
}

uint64_t __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 executeQuery:*(void *)(a1 + 32)];
}

- (void)_processWorkoutHistoryData:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v23 = [v5 count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v15 = [v14 startDate];
        unsigned int v16 = REDateOccursToday(v15);

        uint64_t v17 = [v14 endDate];
        v18 = (void *)v17;
        if (v10)
        {
          uint64_t v19 = [v10 laterDate:v17];

          uint64_t v10 = (void *)v19;
        }
        else
        {
          uint64_t v10 = (void *)v17;
        }
        v11 += v16;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }

  v20 = [(REPredictor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__REActiveWorkoutPredictor__processWorkoutHistoryData_completion___block_invoke;
  block[3] = &unk_2644BDB58;
  float v29 = (float)v23 / 7.0;
  block[4] = self;
  id v26 = v10;
  id v27 = v6;
  uint64_t v28 = v11;
  id v21 = v6;
  id v22 = v10;
  dispatch_async(v20, block);
}

uint64_t __66__REActiveWorkoutPredictor__processWorkoutHistoryData_completion___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 68) = *(_DWORD *)(a1 + 64);
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 56);
  [*(id *)(a1 + 32) setLastCompletedWorkoutDate:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 updateObservers];
}

- (float)dailyAverageWorkouts
{
  return self->_dailyAverageWorkouts;
}

- (unint64_t)numberOfWorkoutsPerformedToday
{
  return self->_numberOfWorkoutsPerformedToday;
}

- (BOOL)hasActiveWorkout
{
  return self->_hasActiveWorkout;
}

- (void)setHasActiveWorkout:(BOOL)a3
{
  self->_hasActiveWorkout = a3;
}

- (NSDate)lastCompletedWorkoutDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastCompletedWorkoutDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedWorkoutDate, 0);
  objc_storeStrong((id *)&self->_workoutQueryCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_workoutObservationQuery, 0);
}

void __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch workout data: %@", (uint8_t *)&v2, 0xCu);
}

@end