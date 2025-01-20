@interface HDSHWidgetSchedulingManager
+ (void)_logSleepSampleStatistics:(id)a3;
- (HDSHWidgetSchedulingManager)initWithProfile:(id)a3;
- (void)_reloadWidgetsWithReasons:(unint64_t)a3;
- (void)_startObservingSleep;
- (void)_stopObservingSleep;
- (void)_updateWidgetRelevances;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDSHWidgetSchedulingManager

- (HDSHWidgetSchedulingManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDSHWidgetSchedulingManager;
  v5 = [(HDSHWidgetSchedulingManager *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x263F75EA8]);
    v10 = HKSPGenerateSleepStoreIdentifier();
    uint64_t v11 = [v9 initWithIdentifier:v10 healthStore:0 options:8];
    sleepStore = v6->_sleepStore;
    v6->_sleepStore = (HKSPSleepStore *)v11;

    objc_initWeak(&location, v6);
    id v13 = objc_alloc(MEMORY[0x263F75EC0]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __47__HDSHWidgetSchedulingManager_initWithProfile___block_invoke;
    v22 = &unk_2647E7338;
    objc_copyWeak(&v23, &location);
    uint64_t v14 = [v13 initWithInterval:&v19 executeBlock:1.0];
    reloadThrottler = v6->_reloadThrottler;
    v6->_reloadThrottler = (HKSPThrottler *)v14;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v17 = objc_msgSend(WeakRetained, "daemon", v19, v20, v21, v22);
    [v17 registerDaemonReadyObserver:v6 queue:v6->_queue];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __47__HDSHWidgetSchedulingManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadWidgetsWithReasons:1];
  [WeakRetained _updateWidgetRelevances];
}

- (void)dealloc
{
  [(HDSHWidgetSchedulingManager *)self _stopObservingSleep];
  v3.receiver = self;
  v3.super_class = (Class)HDSHWidgetSchedulingManager;
  [(HDSHWidgetSchedulingManager *)&v3 dealloc];
}

- (void)_startObservingSleep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  [v3 addObserver:self forDataType:v4];
}

- (void)_stopObservingSleep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  [v3 removeObserver:self forDataType:v4];
}

- (void)_reloadWidgetsWithReasons:(unint64_t)a3
{
  id v3 = [(HKSPSleepStore *)self->_sleepStore widgetManager];
  [v3 reloadWidgetsWithReason:1];
}

- (void)_updateWidgetRelevances
{
  id v2 = [(HKSPSleepStore *)self->_sleepStore widgetManager];
  [v2 invalidateRelevances];
}

- (void)daemonReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] daemonReady", buf, 0xCu);
  }
  [(HDSHWidgetSchedulingManager *)self _startObservingSleep];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__HDSHWidgetSchedulingManager_daemonReady___block_invoke;
  v10[3] = &unk_2647E7250;
  v10[4] = self;
  [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v10];
}

uint64_t __43__HDSHWidgetSchedulingManager_daemonReady___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v2 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)id v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_226DD9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_reloadWidgetsWithReasons:", 2, *(_OWORD *)v6);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  objc_msgSend(a3, "na_filter:", &__block_literal_global_0, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    [(id)objc_opt_class() _logSleepSampleStatistics:v5];
    [(HKSPThrottler *)self->_reloadThrottler execute];
  }
}

uint64_t __51__HDSHWidgetSchedulingManager_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 categoryType];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v7 isEqualToString:*MEMORY[0x263F09410]];

  return v8;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  if (objc_msgSend(a3, "na_any:", &__block_literal_global_292, a4))
  {
    reloadThrottler = self->_reloadThrottler;
    [(HKSPThrottler *)reloadThrottler execute];
  }
}

uint64_t __64__HDSHWidgetSchedulingManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F09410]];

  return v3;
}

+ (void)_logSleepSampleStatistics:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__HDSHWidgetSchedulingManager__logSleepSampleStatistics___block_invoke;
  v24[3] = &unk_2647E73A0;
  v24[4] = &v37;
  v24[5] = &v33;
  v24[6] = &v25;
  v24[7] = &v29;
  objc_msgSend(v3, "na_each:", v24);
  _HKInitializeLogging();
  id v4 = (id *)MEMORY[0x263F09958];
  id v5 = (id)*MEMORY[0x263F09958];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)objc_opt_class();
    uint64_t v7 = [v3 count];
    *(_DWORD *)buf = 138543618;
    id v42 = v6;
    __int16 v43 = 2048;
    uint64_t v44 = v7;
    _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld sleep samples added", buf, 0x16u);
  }
  _HKInitializeLogging();
  uint64_t v8 = *v4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    uint64_t v10 = v38[3];
    *(_DWORD *)buf = 138543618;
    id v42 = v9;
    __int16 v43 = 2048;
    uint64_t v44 = v10;
    id v11 = v9;
    _os_log_impl(&dword_226DD9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] in bed: %ld", buf, 0x16u);
  }
  _HKInitializeLogging();
  id v12 = *v4;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v34[3];
    *(_DWORD *)buf = 138543618;
    id v42 = v13;
    __int16 v43 = 2048;
    uint64_t v44 = v14;
    id v15 = v13;
    _os_log_impl(&dword_226DD9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] asleep: %ld", buf, 0x16u);
  }
  _HKInitializeLogging();
  v16 = *v4;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    uint64_t v18 = v30[3];
    *(_DWORD *)buf = 138543618;
    id v42 = v17;
    __int16 v43 = 2048;
    uint64_t v44 = v18;
    id v19 = v17;
    _os_log_impl(&dword_226DD9000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep stages: %ld", buf, 0x16u);
  }
  _HKInitializeLogging();
  uint64_t v20 = *v4;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    uint64_t v22 = v26[3];
    *(_DWORD *)buf = 138543618;
    id v42 = v21;
    __int16 v43 = 2048;
    uint64_t v44 = v22;
    id v23 = v21;
    _os_log_impl(&dword_226DD9000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] first party asleep: %ld", buf, 0x16u);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __57__HDSHWidgetSchedulingManager__logSleepSampleStatistics___block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  if (![v12 value])
  {
    id v11 = (void *)(*(void *)(a1[4] + 8) + 24);
    id v6 = v12;
    goto LABEL_11;
  }
  id v3 = HKCategoryValueSleepAnalysisAsleepValues();
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "value"));
  int v5 = [v3 containsObject:v4];

  id v6 = v12;
  if (v5)
  {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    uint64_t v7 = [v12 sourceRevision];
    uint64_t v8 = [v7 source];
    int v9 = [v8 _isAppleWatch];

    if (v9) {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
    BOOL v10 = [v12 value] == 5;
    id v6 = v12;
    if (v10
      || (v10 = [v12 value] == 3, id v6 = v12, v10)
      || (v10 = [v12 value] == 4, id v6 = v12, v10))
    {
      id v11 = (void *)(*(void *)(a1[7] + 8) + 24);
LABEL_11:
      ++*v11;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_reloadThrottler, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end