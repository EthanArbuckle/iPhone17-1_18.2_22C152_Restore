@interface HDSPSleepScheduleModelManager
- (BOOL)_locked_canApplyChangesFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4;
- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5;
- (BOOL)_locked_saveSleepSchedule:(id)a3 error:(id *)a4;
- (BOOL)_locked_saveSleepSettings:(id)a3 error:(id *)a4;
- (BOOL)_locked_updateModelWithBlock:(id)a3 persistBlock:(id)a4 error:(id *)a5;
- (BOOL)_shouldTurnOffSleepSchedule;
- (BOOL)_shouldTurnOffWatchSleepFeatures;
- (BOOL)removeSleepScheduleModelWithError:(id *)a3;
- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4;
- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5;
- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4;
- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4;
- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPSleepScheduleModelChangeEvaluator)changeEvaluator;
- (HDSPSleepScheduleModelManager)initWithEnvironment:(id)a3;
- (HKSPMutexProvider)mutexProvider;
- (HKSPObserverSet)observers;
- (HKSPSleepEventRecord)sleepEventRecord;
- (HKSPSleepSchedule)sleepSchedule;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (HKSPSleepSettings)sleepSettings;
- (NSSet)observedApplicationBundleIdentifiers;
- (NSString)providerIdentifier;
- (NSString)sourceIdentifier;
- (id)_earliestDateToScheduleEventsForDate:(id)a3;
- (id)_loadSleepEventRecord:(id *)a3;
- (id)_loadSleepSchedule:(id *)a3;
- (id)_loadSleepScheduleModel:(id *)a3;
- (id)_loadSleepSettings:(id *)a3;
- (id)_locked_applyNecessaryChangesBeforeSaving:(id)a3;
- (id)_locked_applyNecessaryChangesBeforeSavingSleepEventRecord:(id)a3;
- (id)_locked_applyNecessaryChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4;
- (id)_locked_loadSleepEventRecord:(id *)a3;
- (id)_locked_loadSleepSchedule:(id *)a3;
- (id)_locked_loadSleepScheduleModel:(id *)a3;
- (id)_locked_loadSleepSettings:(id *)a3;
- (id)_locked_removeSleepSchedule;
- (id)_locked_resetSleepEventRecord;
- (id)_locked_resetSleepSettings;
- (id)_locked_saveSleepEventRecord:(id)a3;
- (id)_locked_saveSleepSchedule:(id)a3;
- (id)_locked_saveSleepSettings:(id)a3;
- (id)_locked_setSleepEventRecord:(id)a3;
- (id)_locked_setSleepSchedule:(id)a3;
- (id)_locked_setSleepSettings:(id)a3;
- (id)_locked_sleepScheduleModel;
- (id)_locked_updateSleepEventRecord:(id)a3;
- (id)_locked_updateSleepSchedule:(id)a3;
- (id)_locked_updateSleepSettings:(id)a3;
- (id)_locked_validateSleepSchedule:(id)a3 generateValidSchedule:(BOOL)a4;
- (id)diagnosticDescription;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (void)_locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4;
- (void)_locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:(id)a3;
- (void)_locked_notifyObserversForSleepEventRecordChange:(id)a3;
- (void)_locked_notifyObserversForSleepScheduleChange:(id)a3;
- (void)_locked_notifyObserversForSleepScheduleModelChange:(id)a3;
- (void)_locked_notifyObserversForSleepSettingsChange:(id)a3;
- (void)_turnOffSleepSchedule;
- (void)_turnOffWatchSleepFeatures;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)notifyObserversForSleepEventRecordChange:(id)a3;
- (void)notifyObserversForSleepScheduleChange:(id)a3;
- (void)notifyObserversForSleepSettingsChange:(id)a3;
- (void)observedApplicationDidUninstall:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepStorageDidChangeExternally:(id)a3;
@end

@implementation HDSPSleepScheduleModelManager

- (HKSPSleepSchedule)sleepSchedule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepScheduleModelManager_sleepSchedule__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepScheduleModelManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepSchedule *)v2;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HDSPSleepScheduleModelManager_sleepScheduleModel__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepScheduleModelManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepScheduleModel *)v2;
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepScheduleModelManager_sleepEventRecord__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepScheduleModelManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepEventRecord *)v2;
}

- (void)_withLock:(id)a3
{
}

- (HKSPSleepSettings)sleepSettings
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepScheduleModelManager_sleepSettings__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepScheduleModelManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepSettings *)v2;
}

uint64_t __46__HDSPSleepScheduleModelManager_sleepSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x270F9A758]();
}

uint64_t __49__HDSPSleepScheduleModelManager_sleepEventRecord__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return MEMORY[0x270F9A758]();
}

uint64_t __51__HDSPSleepScheduleModelManager_sleepScheduleModel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_sleepScheduleModel");

  return MEMORY[0x270F9A758]();
}

uint64_t __46__HDSPSleepScheduleModelManager_sleepSchedule__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (id)_locked_sleepScheduleModel
{
  return (id)[MEMORY[0x263F75E88] sleepScheduleModelWithSleepSchedule:self->_sleepSchedule sleepSettings:self->_sleepSettings sleepEventRecord:self->_sleepEventRecord];
}

- (HDSPSleepScheduleModelManager)initWithEnvironment:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepScheduleModelManager;
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)&v20 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      __int16 v23 = 2048;
      v24 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_environment, v4);
    v9 = [v4 mutexGenerator];
    uint64_t v10 = v9[2]();
    mutexProvider = v5->_mutexProvider;
    v5->_mutexProvider = (HKSPMutexProvider *)v10;

    id v12 = objc_alloc(MEMORY[0x263F75E20]);
    v13 = [v4 defaultCallbackScheduler];
    uint64_t v14 = [v12 initWithCallbackScheduler:v13];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v14;

    v16 = [[HDSPSleepScheduleModelChangeEvaluator alloc] initWithEnvironment:v4];
    changeEvaluator = v5->_changeEvaluator;
    v5->_changeEvaluator = v16;

    v18 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v10 = a3;
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepScheduleModelChangeEvaluator *)self->_changeEvaluator environmentWillBecomeReady:v10];
  }
  id v4 = [v10 sleepScheduler];
  [v4 addEventProvider:self];

  uint64_t v5 = [v10 timeChangeListener];
  [v5 addObserver:self];

  v6 = [v10 sleepStorage];
  [v6 addObserver:self];

  uint64_t v7 = [v10 diagnostics];
  [v7 addProvider:self];

  id v8 = [v10 systemMonitor];
  v9 = [v8 applicationWorkspaceMonitor];
  [v9 addObserver:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v10 = 0;
  id v5 = [(HDSPSleepScheduleModelManager *)self _loadSleepScheduleModel:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      id v9 = v8;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load model: %{public}@", buf, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepScheduleModelChangeEvaluator *)self->_changeEvaluator environmentDidBecomeReady:v4];
  }
  if ([(HDSPSleepScheduleModelManager *)self _shouldTurnOffWatchSleepFeatures]) {
    [(HDSPSleepScheduleModelManager *)self _turnOffWatchSleepFeatures];
  }
  if ([(HDSPSleepScheduleModelManager *)self _shouldTurnOffSleepSchedule]) {
    [(HDSPSleepScheduleModelManager *)self _turnOffSleepSchedule];
  }
}

- (id)_loadSleepScheduleModel:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading model...", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPSleepScheduleModelManager__loadSleepScheduleModel___block_invoke;
  v9[3] = &unk_2645DB048;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  [(HDSPSleepScheduleModelManager *)self _withLock:v9];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);

  return v7;
}

void __57__HDSPSleepScheduleModelManager__loadSleepScheduleModel___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_locked_loadSleepScheduleModel:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_locked_loadSleepScheduleModel:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v26 = 0;
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self _locked_loadSleepSchedule:&v26];
  id v6 = v26;
  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      v28 = v18;
      __int16 v29 = 2114;
      id v30 = v6;
      id v19 = v18;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load schedule: %{public}@", buf, 0x16u);
    }
  }
  id v25 = 0;
  id v8 = [(HDSPSleepScheduleModelManager *)self _locked_loadSleepSettings:&v25];
  id v9 = v25;
  if (v9)
  {
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      v28 = v20;
      __int16 v29 = 2114;
      id v30 = v9;
      id v21 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load settings: %{public}@", buf, 0x16u);
    }
  }
  id v24 = 0;
  v11 = [(HDSPSleepScheduleModelManager *)self _locked_loadSleepEventRecord:&v24];
  id v12 = v24;
  if (v12)
  {
    __int16 v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      v28 = v22;
      __int16 v29 = 2114;
      id v30 = v12;
      id v23 = v22;
      _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load record: %{public}@", buf, 0x16u);
    }
  }
  id v14 = [MEMORY[0x263F75E88] sleepScheduleModelWithSleepSchedule:v5 sleepSettings:v8 sleepEventRecord:v11];
  if (a3)
  {
    if (v9) {
      id v15 = v9;
    }
    else {
      id v15 = v12;
    }
    if (v6) {
      v16 = v6;
    }
    else {
      v16 = v15;
    }
    *a3 = v16;
  }

  return v14;
}

- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HDSPSleepScheduleModelManager *)self environment];
  id v8 = [v7 currentSource];

  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    id v25 = v8;
    id v10 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleModel: %{public}@ - %{public}@", buf, 0x20u);
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v25 = __Block_byref_object_copy__21;
  id v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  if (objc_opt_respondsToSelector()) {
    char v11 = [v8 dontNotify] ^ 1;
  }
  else {
    char v11 = 1;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__HDSPSleepScheduleModelManager_saveSleepScheduleModel_error___block_invoke;
  v15[3] = &unk_2645DB070;
  v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  uint64_t v17 = &v20;
  v18 = buf;
  char v19 = v11;
  [(HDSPSleepScheduleModelManager *)self _withLock:v15];
  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v13 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __62__HDSPSleepScheduleModelManager_saveSleepScheduleModel_error___block_invoke(uint64_t a1)
{
  v24[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) sleepSchedule];
  uint64_t v5 = objc_msgSend(v3, "_locked_saveSleepSchedule:", v4);

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) sleepSettings];
  id v8 = objc_msgSend(v6, "_locked_saveSleepSettings:", v7);

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) sleepEventRecord];
  char v11 = objc_msgSend(v9, "_locked_saveSleepEventRecord:", v10);

  int v12 = [v5 success];
  if (v12)
  {
    int v12 = [v8 success];
    if (v12) {
      LOBYTE(v12) = [v11 success];
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
  uint64_t v13 = [v5 error];
  id v14 = (void *)v13;
  if (v13)
  {
    int v15 = 0;
    id v16 = (void *)v13;
  }
  else
  {
    uint64_t v17 = [v8 error];
    v1 = (void *)v17;
    if (v17)
    {
      int v15 = 0;
      id v16 = (void *)v17;
    }
    else
    {
      id v16 = [v11 error];
      int v15 = 1;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v16);
  if (v15) {

  }
  if (!v14) {
  if (*(unsigned char *)(a1 + 64))
  }
  {
    if ([v5 shouldNotify] & 1) != 0 || (objc_msgSend(v8, "shouldNotify")) {
      char v18 = 0;
    }
    else {
      char v18 = [v11 shouldNotify] ^ 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && (v18 & 1) == 0)
    {
      char v19 = [v5 changeEvaluation];
      uint64_t v20 = objc_msgSend(v8, "changeEvaluation", v19);
      v24[1] = v20;
      id v21 = [v11 changeEvaluation];
      v24[2] = v21;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
      char v23 = +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:v22];

      objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", v23);
    }
  }
}

- (BOOL)removeSleepScheduleModelWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self environment];
  id v6 = [v5 currentSource];

  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    id v8 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] removeSleepScheduleModel %{public}@", buf, 0x16u);
  }
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  char v19 = __Block_byref_object_copy__21;
  uint64_t v20 = __Block_byref_object_dispose__21;
  id v21 = 0;
  if (objc_opt_respondsToSelector()) {
    int v9 = [v6 dontNotify] ^ 1;
  }
  else {
    LOBYTE(v9) = 1;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPSleepScheduleModelManager_removeSleepScheduleModelWithError___block_invoke;
  v12[3] = &unk_2645DB098;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = buf;
  char v13 = v9;
  [(HDSPSleepScheduleModelManager *)self _withLock:v12];
  if (a3) {
    *a3 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v10 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __67__HDSPSleepScheduleModelManager_removeSleepScheduleModelWithError___block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSchedule:", 0);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSettings:", 0);
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepEventRecord:", 0);
  int v6 = [v3 success];
  if (v6)
  {
    int v6 = [v4 success];
    if (v6) {
      LOBYTE(v6) = [v5 success];
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  uint64_t v7 = [v3 error];
  id v8 = (void *)v7;
  if (v7)
  {
    int v9 = 0;
    BOOL v10 = (void *)v7;
  }
  else
  {
    uint64_t v11 = [v4 error];
    v1 = (void *)v11;
    if (v11)
    {
      int v9 = 0;
      BOOL v10 = (void *)v11;
    }
    else
    {
      BOOL v10 = [v5 error];
      int v9 = 1;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
  if (v9) {

  }
  if (!v8) {
  if (*(unsigned char *)(a1 + 56))
  }
  {
    if ([v3 shouldNotify] & 1) != 0 || (objc_msgSend(v4, "shouldNotify")) {
      char v12 = 0;
    }
    else {
      char v12 = [v5 shouldNotify] ^ 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && (v12 & 1) == 0)
    {
      char v13 = [v3 changeEvaluation];
      uint64_t v14 = objc_msgSend(v4, "changeEvaluation", v13);
      v18[1] = v14;
      int v15 = [v5 changeEvaluation];
      v18[2] = v15;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
      char v17 = +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:v16];

      objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", v17);
    }
  }
}

- (void)_locked_notifyObserversForSleepScheduleModelChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self environment];
  int v6 = [v5 currentContext];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(HDSPEnvironmentContext);
  }
  int v9 = v8;

  BOOL v10 = [(HDSPEnvironmentContext *)v9 contextByApplyingChangeEvaluation:v4];

  uint64_t v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = [v10 source];
    *(_DWORD *)long long buf = 138543618;
    char v23 = v12;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepScheduleModel changes from %{public}@", buf, 0x16u);
  }
  int v15 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  observers = self->_observers;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke;
  v19[3] = &unk_2645DB0C0;
  v19[4] = self;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  id v18 = v15;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v19];
}

void __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke_2;
  v9[3] = &unk_2645D9EE0;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = v3;
  [v4 perform:v9 withContext:v7];
}

void __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke_2(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = (void *)a1[4];
  if (v2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    [v3 sleepScheduleModelManager:v4 didUpdateSleepScheduleModel:v5];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      int v6 = (void *)a1[4];
      uint64_t v7 = a1[5];
      id v8 = [(id)a1[6] sleepSchedule];
      [v6 sleepScheduleModelManager:v7 didUpdateSleepSchedule:v8];
    }
    if (objc_opt_respondsToSelector())
    {
      int v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      uint64_t v11 = [(id)a1[6] sleepSettings];
      [v9 sleepScheduleModelManager:v10 didUpdateSleepSettings:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      id v12 = (void *)a1[4];
      uint64_t v13 = a1[5];
      id v14 = [(id)a1[6] sleepEventRecord];
      [v12 sleepScheduleModelManager:v13 didUpdateSleepEventRecord:v14];
    }
  }
}

- (id)_loadSleepSchedule:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading schedule...", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  char v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HDSPSleepScheduleModelManager__loadSleepSchedule___block_invoke;
  v9[3] = &unk_2645DB048;
  void v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  [(HDSPSleepScheduleModelManager *)self _withLock:v9];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);

  return v7;
}

void __52__HDSPSleepScheduleModelManager__loadSleepSchedule___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_locked_loadSleepSchedule:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_locked_loadSleepSchedule:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self environment];
  id v6 = [v5 sleepStorage];
  id v7 = [v6 loadSleepSchedule:a3];

  id v8 = [(HDSPSleepScheduleModelManager *)self _locked_validateSleepSchedule:v7 generateValidSchedule:1];
  int v9 = [v8 timelineResults];
  uint64_t v10 = [v9 validSleepSchedule];

  if (([v8 success] & 1) == 0)
  {
    uint64_t v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138543618;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2114;
      id v31 = v7;
      id v24 = v29;
      _os_log_error_impl(&dword_221A52000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] persisted schedule invalid: %{public}@", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v12 = HKSPLogForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v13)
      {
        id v25 = objc_opt_class();
        int v28 = 138543618;
        id v29 = v25;
        __int16 v30 = 2114;
        id v31 = v10;
        id v26 = v25;
        _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] persisting valid schedule: %{public}@", (uint8_t *)&v28, 0x16u);
      }
      uint64_t v12 = [(HDSPSleepScheduleModelManager *)self environment];
      id v14 = [v12 sleepStorage];
      [v14 saveSleepSchedule:v10 error:a3];
    }
    else
    {
      if (!v13) {
        goto LABEL_10;
      }
      id v27 = objc_opt_class();
      int v28 = 138543362;
      id v29 = v27;
      id v14 = v27;
      _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] no valid schedule could be made", (uint8_t *)&v28, 0xCu);
    }

LABEL_10:
    id v15 = v10;

    id v7 = v15;
  }
  id v16 = *a3;
  uint64_t v17 = HKSPLogForCategory();
  id v18 = v17;
  if (v16)
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    char v19 = objc_opt_class();
    id v20 = *a3;
    int v28 = 138543618;
    id v29 = v19;
    __int16 v30 = 2114;
    id v31 = v20;
    id v21 = v19;
    _os_log_error_impl(&dword_221A52000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load schedule with error %{public}@", (uint8_t *)&v28, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    uint64_t v22 = objc_opt_class();
    int v28 = 138543618;
    id v29 = v22;
    __int16 v30 = 2114;
    id v31 = v7;
    id v21 = v22;
    _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v28, 0x16u);
  }

LABEL_17:
  objc_storeStrong((id *)&self->_sleepSchedule, v7);

  return v7;
}

- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__21;
  id v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__HDSPSleepScheduleModelManager_saveSleepSchedule_error___block_invoke;
  v10[3] = &unk_2645DB0E8;
  uint64_t v12 = &v20;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  BOOL v13 = &v14;
  [(HDSPSleepScheduleModelManager *)self _withLock:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __57__HDSPSleepScheduleModelManager_saveSleepSchedule_error___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "_locked_saveSleepSchedule:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepSchedule:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HDSPSleepScheduleModelManager *)self environment];
  char v8 = [v7 currentSource];

  int v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v18 = 138543874;
    *(void *)&void v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v6;
    *(_WORD *)&v18[22] = 2114;
    id v19 = v8;
    id v10 = *(id *)&v18[4];
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepSchedule: %{public}@ - %{public}@", v18, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    int v11 = [v8 dontNotify];
    uint64_t v12 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepSchedule:v6];
    BOOL v13 = v12;
    if (v11)
    {
      [v12 success];
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v13 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepSchedule:v6];
  }
  int v14 = objc_msgSend(v13, "shouldNotify", *(_OWORD *)v18, *(void *)&v18[16], v19);
  if ([v13 success] && v14)
  {
    id v15 = [v13 changeEvaluation];
    [(HDSPSleepScheduleModelManager *)self _locked_notifyObserversForSleepScheduleChange:v15];
  }
LABEL_10:
  if (a4)
  {
    *a4 = [v13 error];
  }
  char v16 = objc_msgSend(v13, "success", *(void *)v18, *(_OWORD *)&v18[8], v19);

  return v16;
}

- (id)_locked_saveSleepSchedule:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (NAEqualObjects())
  {
    char v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = +[HDSPSleepScheduleModelSaveResult emptyResult];
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepSchedule)
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_updateSleepSchedule:v4];
    }
    else
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_setSleepSchedule:v4];
    }
  }
  else
  {
    uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_removeSleepSchedule];
  }
  char v8 = (void *)v7;

  return v8;
}

- (id)_locked_setSleepSchedule:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was created", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_validateSleepSchedule:v4 generateValidSchedule:0];
  if ([v7 success])
  {
    char v8 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:v4];
    int v9 = (void *)[v8 copy];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__21;
    id v27 = __Block_byref_object_dispose__21;
    id v28 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke;
    v21[3] = &unk_2645D9680;
    v21[4] = self;
    id v22 = v9;
    p_long long buf = &buf;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke_2;
    v19[3] = &unk_2645DB110;
    v19[4] = self;
    id v10 = v22;
    id v20 = v10;
    id v18 = 0;
    BOOL v11 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v21 persistBlock:v19 error:&v18];
    id v12 = v18;
    BOOL v13 = [HDSPSleepScheduleModelSaveResult alloc];
    int v14 = *(void **)(*((void *)&buf + 1) + 40);
    id v15 = v14;
    if (!v14)
    {
      id v15 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
    }
    char v16 = [(HDSPSleepScheduleModelSaveResult *)v13 initWithSuccess:v11 changeEvaluation:v15 error:v12 shouldNotify:1];
    if (!v14) {

    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    char v8 = [v7 error];
    char v16 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v8];
  }

  return v16;
}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepScheduleAdd:*(void *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x270F9A758]();
}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  char v5 = [v4 sleepStorage];
  uint64_t v6 = [v5 saveSleepSchedule:*(void *)(a1 + 40) error:a2];

  return v6;
}

- (id)_locked_updateSleepSchedule:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was updated", buf, 0xCu);
  }
  sleepSchedule = self->_sleepSchedule;
  id v32 = 0;
  BOOL v8 = [(HDSPSleepScheduleModelManager *)self _locked_canApplyChangesFrom:v4 to:sleepSchedule error:&v32];
  id v9 = v32;
  if (v8)
  {
    id v10 = [v4 changeSet];
    BOOL v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);
    }
    id v14 = (id)[(HKSPSleepSchedule *)self->_sleepSchedule mutableCopy];
    HKSPApplyChangesToObject();

    id v15 = [(HDSPSleepScheduleModelManager *)self _locked_validateSleepSchedule:v14 generateValidSchedule:0];
    if ([v15 success])
    {
      char v16 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSavingSleepSchedule:v14 validationResult:v15];

      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v34 = __Block_byref_object_copy__21;
      v35 = __Block_byref_object_dispose__21;
      id v36 = 0;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke;
      v29[3] = &unk_2645D9680;
      v29[4] = self;
      id v30 = v16;
      id v31 = buf;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke_2;
      v27[3] = &unk_2645DB110;
      v27[4] = self;
      id v14 = v30;
      id v28 = v14;
      id v26 = 0;
      BOOL v17 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v29 persistBlock:v27 error:&v26];
      id v18 = v26;
      id v19 = [HDSPSleepScheduleModelSaveResult alloc];
      id v20 = *(void **)(*(void *)&buf[8] + 40);
      id v21 = v20;
      if (!v20)
      {
        id v21 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
      }
      id v22 = [(HDSPSleepScheduleModelSaveResult *)v19 initWithSuccess:v17 changeEvaluation:v21 error:v18 shouldNotify:1];
      if (!v20) {

      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v24 = [v15 error];
      id v22 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v24];
    }
    char v23 = v22;

    id v4 = v14;
  }
  else
  {
    char v23 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v9];
  }

  return v23;
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepScheduleUpdate:*(void *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  char v5 = [v4 sleepStorage];
  id v6 = [*(id *)(a1 + 40) changeSet];
  uint64_t v7 = [v5 saveSleepScheduleChanges:v6 error:a2];

  return v7;
}

- (id)_locked_applyNecessaryChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:a3];
  [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:v7 validationResult:v6];

  return v7;
}

- (void)_locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  id v9 = [v8 sleepEventRecord];
  id v10 = (void *)[v9 mutableCopy];

  BOOL v11 = [v7 timelineResults];

  LODWORD(v7) = [v11 snoozeFireDateNeedsReset];
  if (v7)
  {
    id v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v68 = (id)objc_opt_class();
      id v13 = v68;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting snooze fire date", buf, 0xCu);
    }
    [v10 setWakeUpAlarmSnoozedUntilDate:0];
  }
  id v14 = [v6 changeSet];
  uint64_t v15 = *MEMORY[0x263F75AF8];
  int v16 = [v14 hasChangeForPropertyIdentifier:*MEMORY[0x263F75AF8]];

  if (v16)
  {
    BOOL v17 = [v6 changeSet];
    id v18 = [v17 originalValueForPropertyIdentifier:v15];

    id v19 = [v6 changeSet];
    id v20 = [v19 changedValueForPropertyIdentifier:v15];

    v64 = v18;
    if (!v18)
    {
LABEL_37:

      goto LABEL_38;
    }
    id v21 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    id v22 = [v18 wakeUpComponents];
    v63 = [v21 dateFromComponents:v22];

    if (v20)
    {
      char v23 = [v20 wakeUpComponents];
      v62 = [v21 dateFromComponents:v23];
    }
    else
    {
      v62 = 0;
    }
    id v24 = [(HDSPSleepScheduleModelManager *)self environment];
    uint64_t v25 = [v24 currentDateProvider];
    id v26 = v25[2]();

    v60 = v21;
    int v27 = [v21 isDate:v63 inSameDayAsDate:v26];
    id v28 = [v8 previousResolvedOccurrenceBeforeDate:v26];
    uint64_t v29 = [v28 wakeUpEvent];
    id v30 = [v29 dueDate];

    v59 = v28;
    id v31 = [v28 occurrence];
    v61 = v30;
    if ([v31 isSingleDayOverride]) {
      int v32 = objc_msgSend(v30, "hksp_isBeforeOrSameAsDate:", v26);
    }
    else {
      int v32 = 0;
    }

    if (v20)
    {
      v33 = v62;
      if (objc_msgSend(v62, "hksp_isAfterDate:", v26)) {
        int v34 = [v60 isDate:v62 inSameDayAsDate:v26] ^ 1;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
      v33 = v62;
    }
    if (v20) {
      int v35 = v34;
    }
    else {
      int v35 = 1;
    }
    if ((v27 & v32) != 1 || !v35)
    {
LABEL_36:

      goto LABEL_37;
    }
    if (v34)
    {
      id v36 = HKSPLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = objc_opt_class();
        *(_DWORD *)long long buf = 138543874;
        id v68 = v37;
        __int16 v69 = 2114;
        v70 = v63;
        __int16 v71 = 2114;
        v72 = v33;
        id v38 = v37;
        v39 = "[%{public}@] override that happened today (%{public}@) moving to the future (%{public}@)";
        v40 = v36;
        uint32_t v41 = 32;
LABEL_29:
        _os_log_impl(&dword_221A52000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
      }
    }
    else
    {
      if (v20)
      {
LABEL_31:
        [v10 setWakeUpOverriddenDate:v30];
        v43 = HKSPLogForCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = objc_opt_class();
          id v45 = v44;
          v46 = [v10 wakeUpOverriddenDate];
          *(_DWORD *)long long buf = 138543618;
          id v68 = v44;
          __int16 v69 = 2114;
          v70 = v46;
          _os_log_impl(&dword_221A52000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] set wakeUpOverriddenDate to %{public}@", buf, 0x16u);
        }
        id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
        v48 = [v10 wakeUpConfirmedUntilDate];
        objc_msgSend(v47, "na_safeAddObject:", v48);

        v49 = [v8 computeConfirmedWakeUpUntilDateForOverrideWakeUpDate:v63];
        objc_msgSend(v47, "na_safeAddObject:", v49);

        v50 = objc_msgSend(MEMORY[0x263EFF910], "hksp_latestFromDates:", v47);
        [v10 setWakeUpConfirmedUntilDate:v50];

        v51 = HKSPLogForCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = objc_opt_class();
          id v58 = v52;
          v53 = [v10 wakeUpConfirmedUntilDate];
          *(_DWORD *)long long buf = 138543618;
          id v68 = v52;
          __int16 v69 = 2114;
          v70 = v53;
          _os_log_impl(&dword_221A52000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] set wakeUpConfirmedUntilDate to %{public}@", buf, 0x16u);
        }
        v33 = v62;
        goto LABEL_36;
      }
      id v36 = HKSPLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_opt_class();
        *(_DWORD *)long long buf = 138543618;
        id v68 = v42;
        __int16 v69 = 2114;
        v70 = v63;
        id v38 = v42;
        v39 = "[%{public}@] override that happened today (%{public}@) deleted";
        v40 = v36;
        uint32_t v41 = 22;
        goto LABEL_29;
      }
    }

    goto LABEL_31;
  }
LABEL_38:
  v54 = [v10 changeSet];
  v55 = [v54 changes];
  uint64_t v56 = [v55 count];

  if (v56)
  {
    v57 = [(HDSPSleepScheduleModelManager *)self environment];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __116__HDSPSleepScheduleModelManager__locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule_validationResult___block_invoke;
    v65[3] = &unk_2645D9288;
    v65[4] = self;
    id v66 = v10;
    [v57 perform:v65 withSource:self];
  }
}

uint64_t __116__HDSPSleepScheduleModelManager__locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule_validationResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepEventRecord:error:", *(void *)(a1 + 40), 0);
}

- (id)_locked_validateSleepSchedule:(id)a3 generateValidSchedule:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 occurrences];
  if ([v7 count])
  {
    BOOL v8 = [v6 occurrences];
    char v9 = objc_msgSend(v8, "na_all:", &__block_literal_global_30);

    if ((v9 & 1) == 0)
    {
      id v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138543362;
        id v27 = (id)objc_opt_class();
        id v25 = v27;
        _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] sleep schedule validation failed due to invalid occurrence", (uint8_t *)&v26, 0xCu);
      }
      BOOL v11 = objc_msgSend(MEMORY[0x263F087E8], "hksp_validationErrorWithReason:", 1);
      id v12 = +[HDSPSleepScheduleModelValidationResult emptyFailureWithError:v11];
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v13 = [MEMORY[0x263F75E88] sleepScheduleModelWithSleepSchedule:v6 sleepSettings:self->_sleepSettings sleepEventRecord:self->_sleepEventRecord];
  id v14 = (void *)MEMORY[0x263F75E60];
  uint64_t v15 = [(HDSPSleepScheduleModelManager *)self environment];
  int v16 = [v15 currentDateProvider];
  BOOL v17 = v16[2]();
  id v18 = [v14 builderWithSleepScheduleModel:v13 date:v17];

  if (v4) {
    uint64_t v19 = 7;
  }
  else {
    uint64_t v19 = 3;
  }
  BOOL v11 = [v18 buildTimelineWithOptions:v19];
  int v20 = [v11 sleepScheduleInvalid];
  if (v20)
  {
    id v21 = objc_msgSend(MEMORY[0x263F087E8], "hksp_validationErrorWithReason:", objc_msgSend(v11, "sleepScheduleInvalidReason"));
    id v22 = HKSPLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543618;
      id v27 = (id)objc_opt_class();
      __int16 v28 = 2114;
      uint64_t v29 = v21;
      id v24 = v27;
      _os_log_error_impl(&dword_221A52000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] sleep schedule validation failed: %{public}@", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    id v21 = 0;
  }
  id v12 = [[HDSPSleepScheduleModelValidationResult alloc] initWithSuccess:v20 ^ 1u timelineResults:v11 error:v21];

LABEL_16:

  return v12;
}

uint64_t __85__HDSPSleepScheduleModelManager__locked_validateSleepSchedule_generateValidSchedule___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValidOccurrence];
}

- (id)_locked_removeSleepSchedule
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was deleted", (uint8_t *)&buf, 0xCu);
  }
  char v5 = [(HDSPSleepScheduleModelManager *)self _locked_resetSleepEventRecord];
  if ([v5 success])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__21;
    int v20 = __Block_byref_object_dispose__21;
    id v21 = 0;
    v15[4] = self;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke;
    v16[3] = &unk_2645D90E8;
    v16[4] = self;
    v16[5] = &buf;
    id v14 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke_2;
    v15[3] = &unk_2645DB158;
    BOOL v6 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v16 persistBlock:v15 error:&v14];
    id v7 = v14;
    BOOL v8 = [HDSPSleepScheduleModelSaveResult alloc];
    char v9 = *(void **)(*((void *)&buf + 1) + 40);
    id v10 = v9;
    if (!v9)
    {
      id v10 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
    }
    BOOL v11 = [(HDSPSleepScheduleModelSaveResult *)v8 initWithSuccess:v6 changeEvaluation:v10 error:v7 shouldNotify:1];
    if (!v9) {

    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = [v5 error];
    BOOL v11 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v12];
  }

  return v11;
}

uint64_t __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepScheduleRemove];

  return MEMORY[0x270F9A758]();
}

uint64_t __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) environment];
  id v4 = [v3 sleepStorage];
  uint64_t v5 = [v4 removeSleepScheduleWithError:a2];

  return v5;
}

- (void)notifyObserversForSleepScheduleChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleModelManager_notifyObserversForSleepScheduleChange___block_invoke;
  v6[3] = &unk_2645D9288;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDSPSleepScheduleModelManager *)self _withLock:v6];
}

uint64_t __71__HDSPSleepScheduleModelManager_notifyObserversForSleepScheduleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleChange:", *(void *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepScheduleChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPSleepScheduleModelManager *)self environment];
  BOOL v6 = [v5 currentContext];
  id v7 = v6;
  if (v6) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = objc_alloc_init(HDSPEnvironmentContext);
  }
  char v9 = v8;

  id v10 = [(HDSPEnvironmentContext *)v9 contextByApplyingChangeEvaluation:v4];

  BOOL v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    id v14 = [v10 source];
    *(_DWORD *)long long buf = 138543618;
    char v23 = v12;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepSchedule change from %{public}@", buf, 0x16u);
  }
  uint64_t v15 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  observers = self->_observers;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke;
  v19[3] = &unk_2645DB0C0;
  v19[4] = self;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  id v18 = v15;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v19];
}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke_2;
  v9[3] = &unk_2645D9EE0;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = v3;
  [v4 perform:v9 withContext:v7];
}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke_2(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = (void *)a1[4];
  if (v2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    [v3 sleepScheduleModelManager:v4 didUpdateSleepScheduleModel:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v8 = [(id)a1[6] sleepSchedule];
    [v6 sleepScheduleModelManager:v7 didUpdateSleepSchedule:v8];
  }
}

- (id)_loadSleepSettings:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading settings...", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HDSPSleepScheduleModelManager__loadSleepSettings___block_invoke;
  v9[3] = &unk_2645DB048;
  void v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  [(HDSPSleepScheduleModelManager *)self _withLock:v9];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);

  return v7;
}

void __52__HDSPSleepScheduleModelManager__loadSleepSettings___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_locked_loadSleepSettings:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_locked_loadSleepSettings:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self environment];
  id v6 = [v5 sleepStorage];
  id v7 = [v6 loadSleepSettings:a3];

  id v8 = *a3;
  char v9 = HKSPLogForCategory();
  uint64_t v10 = v9;
  if (v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v11 = objc_opt_class();
    id v12 = *a3;
    int v15 = 138543618;
    id v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    id v13 = v11;
    _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load settings with error %{public}@", (uint8_t *)&v15, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v15 = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v7;
    id v13 = v16;
    _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
  objc_storeStrong((id *)&self->_sleepSettings, v7);

  return v7;
}

- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__21;
  id v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__HDSPSleepScheduleModelManager_saveSleepSettings_error___block_invoke;
  v10[3] = &unk_2645DB0E8;
  id v12 = &v20;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v14;
  [(HDSPSleepScheduleModelManager *)self _withLock:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __57__HDSPSleepScheduleModelManager_saveSleepSettings_error___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "_locked_saveSleepSettings:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepSettings:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HDSPSleepScheduleModelManager *)self environment];
  char v8 = [v7 currentSource];

  char v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v18 = 138543874;
    *(void *)&void v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v6;
    *(_WORD *)&v18[22] = 2114;
    id v19 = v8;
    id v10 = *(id *)&v18[4];
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepSettings: %{public}@ - %{public}@", v18, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    int v11 = [v8 dontNotify];
    id v12 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepSettings:v6];
    id v13 = v12;
    if (v11)
    {
      [v12 success];
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepSettings:v6];
  }
  int v14 = objc_msgSend(v13, "shouldNotify", *(_OWORD *)v18, *(void *)&v18[16], v19);
  if ([v13 success] && v14)
  {
    int v15 = [v13 changeEvaluation];
    [(HDSPSleepScheduleModelManager *)self _locked_notifyObserversForSleepSettingsChange:v15];
  }
LABEL_10:
  if (a4)
  {
    *a4 = [v13 error];
  }
  char v16 = objc_msgSend(v13, "success", *(void *)v18, *(_OWORD *)&v18[8], v19);

  return v16;
}

- (id)_locked_saveSleepSettings:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (NAEqualObjects())
  {
    char v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = +[HDSPSleepScheduleModelSaveResult emptyResult];
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepSettings)
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_updateSleepSettings:v4];
    }
    else
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_setSleepSettings:v4];
    }
  }
  else
  {
    uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_resetSleepSettings];
  }
  char v8 = (void *)v7;

  return v8;
}

- (id)_locked_setSleepSettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were created", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:v4];
  char v8 = (void *)[v7 copy];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__21;
  uint64_t v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke;
  v20[3] = &unk_2645D9680;
  v20[4] = self;
  id v21 = v8;
  p_long long buf = &buf;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke_2;
  v18[3] = &unk_2645DB110;
  void v18[4] = self;
  id v9 = v21;
  id v19 = v9;
  id v17 = 0;
  BOOL v10 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v20 persistBlock:v18 error:&v17];
  id v11 = v17;
  uint64_t v12 = [HDSPSleepScheduleModelSaveResult alloc];
  id v13 = *(void **)(*((void *)&buf + 1) + 40);
  int v14 = v13;
  if (!v13)
  {
    int v14 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
  }
  int v15 = [(HDSPSleepScheduleModelSaveResult *)v12 initWithSuccess:v10 changeEvaluation:v14 error:v11 shouldNotify:1];
  if (!v13) {

  }
  _Block_object_dispose(&buf, 8);

  return v15;
}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepSettingsAdd:*(void *)(*(void *)(a1 + 32) + 24)];

  return MEMORY[0x270F9A758]();
}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  char v5 = [v4 sleepStorage];
  uint64_t v6 = [v5 saveSleepSettings:*(void *)(a1 + 40) error:a2];

  return v6;
}

- (id)_locked_updateSleepSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were updated", buf, 0xCu);
  }
  sleepSettings = self->_sleepSettings;
  id v29 = 0;
  BOOL v8 = [(HDSPSleepScheduleModelManager *)self _locked_canApplyChangesFrom:v4 to:sleepSettings error:&v29];
  id v9 = v29;
  if (v8)
  {
    BOOL v10 = [v4 changeSet];
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);
    }
    int v14 = (void *)[(HKSPSleepSettings *)self->_sleepSettings mutableCopy];
    HKSPApplyChangesToObject();

    int v15 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:v14];

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v31 = __Block_byref_object_copy__21;
    int v32 = __Block_byref_object_dispose__21;
    id v33 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke;
    v26[3] = &unk_2645D9680;
    v26[4] = self;
    id v27 = v15;
    uint64_t v28 = buf;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke_2;
    v24[3] = &unk_2645DB110;
    void v24[4] = self;
    id v4 = v27;
    id v25 = v4;
    id v23 = 0;
    BOOL v16 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v26 persistBlock:v24 error:&v23];
    id v17 = v23;
    id v18 = [HDSPSleepScheduleModelSaveResult alloc];
    id v19 = *(void **)(*(void *)&buf[8] + 40);
    uint64_t v20 = v19;
    if (!v19)
    {
      uint64_t v20 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
    }
    id v21 = [(HDSPSleepScheduleModelSaveResult *)v18 initWithSuccess:v16 changeEvaluation:v20 error:v17 shouldNotify:1];
    if (!v19) {

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v21 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v9];
  }

  return v21;
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepSettingsUpdate:*(void *)(*(void *)(a1 + 32) + 24)];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  char v5 = [v4 sleepStorage];
  id v6 = [*(id *)(a1 + 40) changeSet];
  uint64_t v7 = [v5 saveSleepSettingsChanges:v6 error:a2];

  return v7;
}

- (id)_locked_resetSleepSettings
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were reset", (uint8_t *)&v8, 0xCu);
  }
  id v5 = objc_alloc_init(MEMORY[0x263F75EA0]);
  id v6 = [(HDSPSleepScheduleModelManager *)self _locked_setSleepSettings:v5];

  return v6;
}

- (void)notifyObserversForSleepSettingsChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleModelManager_notifyObserversForSleepSettingsChange___block_invoke;
  v6[3] = &unk_2645D9288;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDSPSleepScheduleModelManager *)self _withLock:v6];
}

uint64_t __71__HDSPSleepScheduleModelManager_notifyObserversForSleepSettingsChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepSettingsChange:", *(void *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepSettingsChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPSleepScheduleModelManager *)self environment];
  id v6 = [v5 currentContext];
  id v7 = v6;
  if (v6) {
    int v8 = v6;
  }
  else {
    int v8 = objc_alloc_init(HDSPEnvironmentContext);
  }
  id v9 = v8;

  uint64_t v10 = [(HDSPEnvironmentContext *)v9 contextByApplyingChangeEvaluation:v4];

  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v12;
    int v14 = [v10 source];
    *(_DWORD *)long long buf = 138543618;
    id v23 = v12;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepSettings change from %{public}@", buf, 0x16u);
  }
  int v15 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  observers = self->_observers;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke;
  v19[3] = &unk_2645DB0C0;
  v19[4] = self;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  id v18 = v15;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v19];
}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke_2;
  v9[3] = &unk_2645D9EE0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = v3;
  [v4 perform:v9 withContext:v7];
}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke_2(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = (void *)a1[4];
  if (v2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    [v3 sleepScheduleModelManager:v4 didUpdateSleepScheduleModel:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v8 = [(id)a1[6] sleepSettings];
    [v6 sleepScheduleModelManager:v7 didUpdateSleepSettings:v8];
  }
}

- (id)_loadSleepEventRecord:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading event record...", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  id v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__21;
  int v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__HDSPSleepScheduleModelManager__loadSleepEventRecord___block_invoke;
  v9[3] = &unk_2645DB048;
  void v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  [(HDSPSleepScheduleModelManager *)self _withLock:v9];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);

  return v7;
}

void __55__HDSPSleepScheduleModelManager__loadSleepEventRecord___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_locked_loadSleepEventRecord:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_locked_loadSleepEventRecord:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self environment];
  id v6 = [v5 sleepStorage];
  id v7 = [v6 loadSleepEventRecord:a3];

  id v8 = *a3;
  id v9 = HKSPLogForCategory();
  uint64_t v10 = v9;
  if (v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v11 = objc_opt_class();
    id v12 = *a3;
    int v15 = 138543618;
    id v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    id v13 = v11;
    _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load event record with error %{public}@", (uint8_t *)&v15, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v15 = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v7;
    id v13 = v16;
    _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
  objc_storeStrong((id *)&self->_sleepEventRecord, v7);

  return v7;
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__21;
  id v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__HDSPSleepScheduleModelManager_saveSleepEventRecord_error___block_invoke;
  v10[3] = &unk_2645DB0E8;
  id v12 = &v20;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v14;
  [(HDSPSleepScheduleModelManager *)self _withLock:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __60__HDSPSleepScheduleModelManager_saveSleepEventRecord_error___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "_locked_saveSleepEventRecord:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4
{
  return [(HDSPSleepScheduleModelManager *)self _locked_saveSleepEventRecord:a3 error:a4 preNotifyBlock:&__block_literal_global_312_1];
}

uint64_t __68__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error___block_invoke()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__21;
  char v23 = __Block_byref_object_dispose__21;
  id v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__HDSPSleepScheduleModelManager_saveSleepEventRecord_error_preNotifyBlock___block_invoke;
  v14[3] = &unk_2645DB1A0;
  __int16 v17 = &v25;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  id v18 = &v19;
  id v11 = v9;
  id v16 = v11;
  [(HDSPSleepScheduleModelManager *)self _withLock:v14];
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __75__HDSPSleepScheduleModelManager_saveSleepEventRecord_error_preNotifyBlock___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = objc_msgSend(v2, "_locked_saveSleepEventRecord:error:preNotifyBlock:", v3, &obj, v4);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = [(HDSPSleepScheduleModelManager *)self environment];
  id v11 = [v10 currentSource];

  char v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    int v32 = v11;
    id v13 = v28;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepEventRecord: %{public}@ - %{public}@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    char v14 = [v11 dontNotify];
    id v15 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepEventRecord:v8];
    if (v14)
    {
      int v16 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v15 = [(HDSPSleepScheduleModelManager *)self _locked_saveSleepEventRecord:v8];
  }
  int v16 = [v15 shouldNotify];
LABEL_8:
  if ([v15 success])
  {
    __int16 v17 = v9[2](v9);
    if (v16)
    {
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      char v23 = __83__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error_preNotifyBlock___block_invoke;
      id v24 = &unk_2645DB1C8;
      uint64_t v25 = self;
      id v26 = v15;
      id v18 = (id)[v17 addCompletionBlock:&v21];
    }
  }
  if (a4)
  {
    *a4 = [v15 error];
  }
  char v19 = objc_msgSend(v15, "success", v21, v22, v23, v24, v25);

  return v19;
}

void __83__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error_preNotifyBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) changeEvaluation];
  objc_msgSend(v1, "_locked_notifyObserversForSleepEventRecordChange:", v2);
}

- (id)_locked_saveSleepEventRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (NAEqualObjects())
  {
    uint64_t v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = +[HDSPSleepScheduleModelSaveResult emptyResult];
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepEventRecord)
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_updateSleepEventRecord:v4];
    }
    else
    {
      uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_setSleepEventRecord:v4];
    }
  }
  else
  {
    uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_resetSleepEventRecord];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)_locked_updateSleepEventRecord:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was updated", buf, 0xCu);
  }
  sleepEventRecord = self->_sleepEventRecord;
  id v29 = 0;
  BOOL v8 = [(HDSPSleepScheduleModelManager *)self _locked_canApplyChangesFrom:v4 to:sleepEventRecord error:&v29];
  id v9 = v29;
  if (v8)
  {
    int v10 = [v4 changeSet];
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);
    }
    char v14 = (void *)[(HKSPSleepEventRecord *)self->_sleepEventRecord mutableCopy];
    HKSPApplyChangesToObject();

    id v15 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSavingSleepEventRecord:v14];

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v31 = __Block_byref_object_copy__21;
    int v32 = __Block_byref_object_dispose__21;
    id v33 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke;
    v26[3] = &unk_2645D9680;
    v26[4] = self;
    id v27 = v15;
    id v28 = buf;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke_2;
    v24[3] = &unk_2645DB110;
    void v24[4] = self;
    id v4 = v27;
    id v25 = v4;
    id v23 = 0;
    BOOL v16 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v26 persistBlock:v24 error:&v23];
    id v17 = v23;
    id v18 = [HDSPSleepScheduleModelSaveResult alloc];
    char v19 = *(void **)(*(void *)&buf[8] + 40);
    uint64_t v20 = v19;
    if (!v19)
    {
      uint64_t v20 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
    }
    uint64_t v21 = [(HDSPSleepScheduleModelSaveResult *)v18 initWithSuccess:v16 changeEvaluation:v20 error:v17 shouldNotify:1];
    if (!v19) {

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v21 = +[HDSPSleepScheduleModelSaveResult saveFailedWithError:v9];
  }

  return v21;
}

uint64_t __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepRecordUpdate:*(void *)(*(void *)(a1 + 32) + 32)];

  return MEMORY[0x270F9A758]();
}

uint64_t __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  uint64_t v5 = [v4 sleepStorage];
  id v6 = [*(id *)(a1 + 40) changeSet];
  uint64_t v7 = [v5 saveSleepEventRecordChanges:v6 error:a2];

  return v7;
}

- (id)_locked_applyNecessaryChangesBeforeSavingSleepEventRecord:(id)a3
{
  id v4 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:a3];
  [(HDSPSleepScheduleModelManager *)self _locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:v4];

  return v4;
}

- (void)_locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  id v6 = [v5 sleepSettings];
  uint64_t v7 = (void *)[v6 mutableCopy];

  BOOL v8 = [v4 changeSet];
  if ([v8 hasChangeForPropertyIdentifier:*MEMORY[0x263F75BF8]])
  {
    int v9 = [v4 isAnySleepCoachingOnboardingCompleted];

    if (v9)
    {
      int v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v24 = (id)objc_opt_class();
        id v11 = v24;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep coaching completed, enabling dnd during wind down", buf, 0xCu);
      }
      objc_msgSend(v7, "setSleepModeOptions:", objc_msgSend(v7, "sleepModeOptions") | 0x840);
    }
  }
  else
  {
  }
  uint64_t v12 = [v4 changeSet];
  if ([v12 hasChangeForPropertyIdentifier:*MEMORY[0x263F75CF0]])
  {
    int v13 = [v4 isAnySleepTrackingOnboardingCompleted];

    if (v13)
    {
      char v14 = HKSPLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        id v24 = v15;
        id v16 = v15;
        _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking completed, enabling watch screen", buf, 0xCu);
      }
      objc_msgSend(v7, "setSleepModeOptions:", objc_msgSend(v7, "sleepModeOptions") | 4);
    }
  }
  else
  {
  }
  id v17 = [v7 changeSet];
  id v18 = [v17 changes];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = [(HDSPSleepScheduleModelManager *)self environment];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __104__HDSPSleepScheduleModelManager__locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord___block_invoke;
    v21[3] = &unk_2645D9288;
    v21[4] = self;
    id v22 = v7;
    [v20 perform:v21 withSource:self];
  }
}

uint64_t __104__HDSPSleepScheduleModelManager__locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSettings:error:", *(void *)(a1 + 40), 0);
}

- (id)_locked_setSleepEventRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was created", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = [(HDSPSleepScheduleModelManager *)self _locked_applyNecessaryChangesBeforeSaving:v4];
  BOOL v8 = (void *)[v7 copy];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__21;
  id v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke;
  v20[3] = &unk_2645D9680;
  v20[4] = self;
  id v21 = v8;
  p_long long buf = &buf;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke_2;
  v18[3] = &unk_2645DB110;
  void v18[4] = self;
  id v9 = v21;
  id v19 = v9;
  id v17 = 0;
  BOOL v10 = [(HDSPSleepScheduleModelManager *)self _locked_updateModelWithBlock:v20 persistBlock:v18 error:&v17];
  id v11 = v17;
  uint64_t v12 = [HDSPSleepScheduleModelSaveResult alloc];
  int v13 = *(void **)(*((void *)&buf + 1) + 40);
  char v14 = v13;
  if (!v13)
  {
    char v14 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
  }
  id v15 = [(HDSPSleepScheduleModelSaveResult *)v12 initWithSuccess:v10 changeEvaluation:v14 error:v11 shouldNotify:1];
  if (!v13) {

  }
  _Block_object_dispose(&buf, 8);

  return v15;
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) evaluateSleepRecordAdd:*(void *)(*(void *)(a1 + 32) + 32)];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) environment];
  uint64_t v5 = [v4 sleepStorage];
  uint64_t v6 = [v5 saveSleepEventRecord:*(void *)(a1 + 40) error:a2];

  return v6;
}

- (id)_locked_resetSleepEventRecord
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was reset", (uint8_t *)&v8, 0xCu);
  }
  id v5 = objc_alloc_init(MEMORY[0x263F75E58]);
  uint64_t v6 = [(HDSPSleepScheduleModelManager *)self _locked_setSleepEventRecord:v5];

  return v6;
}

- (BOOL)_locked_updateModelWithBlock:(id)a3 persistBlock:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void (**)(void))a3;
  id v14 = 0;
  int v8 = (*((uint64_t (**)(id, id *))a4 + 2))(a4, &v14);
  id v9 = v14;
  if (v8)
  {
    v7[2](v7);
  }
  else if (a5)
  {
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v9;
      id v13 = v12;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] save failed with error: %{public}@", buf, 0x16u);
    }
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F75C10] code:2 userInfo:0];
  }

  return v8;
}

- (BOOL)_locked_canApplyChangesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 lastModifiedDate];
  uint64_t v10 = [v8 lastModifiedDate];
  if (!v10 || v9 && !objc_msgSend(v9, "hksp_isBeforeDate:", v10)) {
    goto LABEL_7;
  }
  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138544386;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v9;
    id v12 = v16;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] trying to update %{public}@ (last modified: %{public}@) to %{public}@ (last modified: %{public}@), seeing if we can resolve changes", (uint8_t *)&v15, 0x34u);
  }
  if ((HKSPCanResolveChangesToObject() & 1) == 0)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F75C10] code:1 userInfo:0];
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
LABEL_7:
    BOOL v13 = 1;
  }

  return v13;
}

- (id)_locked_applyNecessaryChangesBeforeSaving:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  id v5 = [(HDSPSleepScheduleModelManager *)self environment];
  uint64_t v6 = [v5 currentDateProvider];
  id v7 = v6[2]();
  [v4 setLastModifiedDate:v7];

  return v4;
}

- (void)notifyObserversForSleepEventRecordChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__HDSPSleepScheduleModelManager_notifyObserversForSleepEventRecordChange___block_invoke;
  v6[3] = &unk_2645D9288;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDSPSleepScheduleModelManager *)self _withLock:v6];
}

uint64_t __74__HDSPSleepScheduleModelManager_notifyObserversForSleepEventRecordChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepEventRecordChange:", *(void *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepEventRecordChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPSleepScheduleModelManager *)self environment];
  uint64_t v6 = [v5 currentContext];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(HDSPEnvironmentContext);
  }
  id v9 = v8;

  uint64_t v10 = [(HDSPEnvironmentContext *)v9 contextByApplyingChangeEvaluation:v4];

  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    id v14 = [v10 source];
    *(_DWORD *)long long buf = 138543618;
    __int16 v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepEventRecord change from %{public}@", buf, 0x16u);
  }
  int v15 = [(HDSPSleepScheduleModelManager *)self _locked_sleepScheduleModel];
  observers = self->_observers;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke;
  v19[3] = &unk_2645DB0C0;
  v19[4] = self;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  id v18 = v15;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v19];
}

void __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke_2;
  v9[3] = &unk_2645D9EE0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = v3;
  [v4 perform:v9 withContext:v7];
}

void __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke_2(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = (void *)a1[4];
  if (v2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    [v3 sleepScheduleModelManager:v4 didUpdateSleepScheduleModel:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v8 = [(id)a1[6] sleepEventRecord];
    [v6 sleepScheduleModelManager:v7 didUpdateSleepEventRecord:v8];
  }
}

- (NSString)providerIdentifier
{
  char v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  uint64_t v4 = [(HDSPSleepScheduleModelManager *)self _earliestDateToScheduleEventsForDate:a3];
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self sleepScheduleModel];
  uint64_t v6 = [v5 upcomingEventsDueAfterDate:v4];

  return v6;
}

- (id)_earliestDateToScheduleEventsForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDSPSleepScheduleModelManager *)self sleepEventRecord];
  uint64_t v6 = [v5 wakeUpAlarmDismissedDate];

  if (objc_msgSend(v6, "hksp_isAfterDate:", v4)) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v60 = (id)objc_opt_class();
    id v5 = v60;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);
  }
  uint64_t v6 = [(HDSPSleepScheduleModelManager *)self environment];
  uint64_t v7 = [v6 currentDateProvider];
  id v8 = v7[2]();

  id v9 = [(HDSPSleepScheduleModelManager *)self sleepSchedule];
  id v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [(HDSPSleepScheduleModelManager *)self sleepSettings];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [(HDSPSleepScheduleModelManager *)self sleepEventRecord];
  id v14 = (void *)[v13 mutableCopy];

  int v15 = [v10 lastModifiedDate];
  int v16 = objc_msgSend(v15, "hksp_isAfterDate:", v8);

  if (v16)
  {
    id v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v18;
      id v19 = v18;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on schedule to current date because it's in the future", buf, 0xCu);
    }
    [v10 setLastModifiedDate:v8];
  }
  id v20 = objc_msgSend(v12, "lastModifiedDate", v50);
  int v21 = objc_msgSend(v20, "hksp_isAfterDate:", v8);

  if (v21)
  {
    id v22 = HKSPLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v23;
      id v24 = v23;
      _os_log_impl(&dword_221A52000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on settings to current date because it's in the future", buf, 0xCu);
    }
    [v12 setLastModifiedDate:v8];
  }
  uint64_t v25 = [v14 wakeUpEarlyNotificationConfirmedDate];
  LODWORD(v26) = objc_msgSend(v25, "hksp_isAfterDate:", v8);

  if (v26)
  {
    id v27 = HKSPLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v28;
      id v29 = v28;
      _os_log_impl(&dword_221A52000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting wakeUpEarlyNotificationConfirmedDate because it's in the future", buf, 0xCu);
    }
    [v14 setWakeUpEarlyNotificationConfirmedDate:0];
    [v14 setWakeUpConfirmedUntilDate:0];
  }
  id v30 = [v14 wakeUpOverriddenDate];
  int v31 = objc_msgSend(v30, "hksp_isAfterDate:", v8);

  if (v31)
  {
    uint64_t v26 = HKSPLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v32;
      id v33 = v32;
      _os_log_impl(&dword_221A52000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting wakeUpOverriddenDate because it's in the future", buf, 0xCu);
    }
    [v14 setWakeUpOverriddenDate:0];
    [v14 setWakeUpConfirmedUntilDate:0];
    LOBYTE(v26) = 1;
  }
  uint64_t v34 = [v14 lastModifiedDate];
  int v35 = objc_msgSend(v34, "hksp_isAfterDate:", v8);

  if (v35)
  {
    uint64_t v26 = HKSPLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v36;
      id v37 = v36;
      _os_log_impl(&dword_221A52000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on event record to current date because it's in the future", buf, 0xCu);
    }
    [v14 setLastModifiedDate:v8];
    LOBYTE(v26) = 1;
  }
  id v38 = [v14 wakeUpAlarmDismissedDate];
  int v39 = objc_msgSend(v38, "hksp_isAfterDate:", v8);

  if (v39)
  {
    uint64_t v26 = HKSPLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v40;
      id v41 = v40;
      _os_log_impl(&dword_221A52000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting wakeUpAlarmDismissedDate on event record to current date because it's in the future", buf, 0xCu);
    }
    [v14 setWakeUpAlarmDismissedDate:v8];
    LOBYTE(v26) = 1;
  }
  v42 = [v14 goodMorningDismissedDate];
  int v43 = objc_msgSend(v42, "hksp_isAfterDate:", v8);

  if (v43)
  {
    uint64_t v26 = HKSPLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v60 = v44;
      id v45 = v44;
      _os_log_impl(&dword_221A52000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting goodMorningDismissedDate on event record to current date because it's in the future", buf, 0xCu);
    }
    [v14 setGoodMorningDismissedDate:v8];
    LOBYTE(v26) = 1;
  }
  v46 = [(HDSPSleepScheduleModelManager *)self environment];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __63__HDSPSleepScheduleModelManager_significantTimeChangeDetected___block_invoke;
  v52[3] = &unk_2645DB1F0;
  char v56 = v16;
  v52[4] = self;
  id v53 = v10;
  char v57 = v21;
  char v58 = (char)v26;
  id v54 = v12;
  id v55 = v14;
  id v47 = v14;
  id v48 = v12;
  id v49 = v10;
  [v46 perform:v52 withSource:v51];
}

uint64_t __63__HDSPSleepScheduleModelManager_significantTimeChangeDetected___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 64)) {
    result = [*(id *)(result + 32) saveSleepSchedule:*(void *)(result + 40) error:0];
  }
  if (*(unsigned char *)(v1 + 65)) {
    result = [*(id *)(v1 + 32) saveSleepSettings:*(void *)(v1 + 48) error:0];
  }
  if (*(unsigned char *)(v1 + 66))
  {
    char v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 56);
    return [v2 saveSleepEventRecord:v3 error:0];
  }
  return result;
}

- (NSSet)observedApplicationBundleIdentifiers
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0AD08], *MEMORY[0x263F75AB8], 0);
}

- (void)observedApplicationDidUninstall:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] observedApplicationDidUninstall", v6, 0xCu);
  }
  if ([(HDSPSleepScheduleModelManager *)self _shouldTurnOffWatchSleepFeatures]) {
    [(HDSPSleepScheduleModelManager *)self _turnOffWatchSleepFeatures];
  }
  if ([(HDSPSleepScheduleModelManager *)self _shouldTurnOffSleepSchedule]) {
    [(HDSPSleepScheduleModelManager *)self _turnOffSleepSchedule];
  }
}

- (BOOL)_shouldTurnOffWatchSleepFeatures
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained behavior];
  if ([v3 isAppleWatch])
  {
    id v4 = [WeakRetained systemMonitor];
    id v5 = [v4 applicationWorkspaceMonitor];
    int v6 = [v5 isApplicationInstalled:*MEMORY[0x263F75AB8]] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_turnOffWatchSleepFeatures
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HDSPSleepScheduleModelManager *)self sleepSettings];
  if ([v3 watchSleepFeaturesEnabled])
  {
    id v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v5 = v12;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off watch sleep features since sleep app was removed", buf, 0xCu);
    }
    int v6 = (void *)[v3 mutableCopy];
    [v6 setWatchSleepFeaturesEnabled:0];
    uint64_t v7 = [(HDSPSleepScheduleModelManager *)self environment];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__HDSPSleepScheduleModelManager__turnOffWatchSleepFeatures__block_invoke;
    v9[3] = &unk_2645D9288;
    void v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    [v7 perform:v9 withSource:self];
  }
}

void __59__HDSPSleepScheduleModelManager__turnOffWatchSleepFeatures__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  char v4 = [v2 saveSleepSettings:v3 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to turn off watch sleep features with error %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)_shouldTurnOffSleepSchedule
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained behavior];
  if ([v3 isAppleWatch])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = [WeakRetained systemMonitor];
    int v6 = [v5 applicationWorkspaceMonitor];
    int v4 = [v6 isApplicationInstalled:*MEMORY[0x263F0AD08]] ^ 1;
  }
  return v4;
}

- (void)_turnOffSleepSchedule
{
  uint64_t v3 = [(HDSPSleepScheduleModelManager *)self sleepSettings];
  int v4 = (void *)[v3 mutableCopy];
  [v4 setShareAcrossDevices:0];
  id v5 = [(HDSPSleepScheduleModelManager *)self environment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HDSPSleepScheduleModelManager__turnOffSleepSchedule__block_invoke;
  v7[3] = &unk_2645D9288;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 perform:v7 withSource:self];
}

void __54__HDSPSleepScheduleModelManager__turnOffSleepSchedule__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v18 = 0;
  int v4 = [v2 saveSleepSettings:v3 error:&v18];
  id v5 = v18;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) sleepSchedule];
    if ([v6 isEnabled])
    {
      uint64_t v7 = HKSPLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        id v20 = v8;
        id v9 = v8;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off sleep schedule since Health app was removed", buf, 0xCu);
      }
      id v10 = (void *)[v6 mutableCopy];
      [v10 setEnabled:0];
      uint64_t v11 = *(void **)(a1 + 32);
      id v17 = v5;
      char v12 = [v11 saveSleepSchedule:v10 error:&v17];
      id v13 = v17;

      if ((v12 & 1) == 0)
      {
        uint64_t v14 = HKSPLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = objc_opt_class();
          *(_DWORD *)long long buf = 138543618;
          id v20 = v15;
          __int16 v21 = 2114;
          id v22 = v13;
          id v16 = v15;
          _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] failed to turn off sleep schedule with error %{public}@", buf, 0x16u);
        }
      }

      id v5 = v13;
    }
  }
}

- (NSString)sourceIdentifier
{
  char v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)sleepStorageDidChangeExternally:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepStorageDidChangeExternally", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke;
  v8[3] = &unk_2645D9288;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HDSPSleepScheduleModelManager *)self _withLock:v8];
}

void __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v2 = *(void **)(a1 + 32);
  id v17 = 0;
  id v3 = (id)objc_msgSend(v2, "_locked_loadSleepScheduleModel:", &v17);
  id v4 = v17;
  if (v4)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v4;
      id v7 = v6;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load sleep schedule after sync with error %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = (void *)v8[8];
    id v10 = objc_msgSend(v8, "_locked_sleepScheduleModel");
    id v11 = [v9 evaluateSleepScheduleModelChange:v10];

    uint64_t v12 = [*(id *)(a1 + 32) environment];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke_2;
    v15[3] = &unk_2645D9288;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v15[4] = v13;
    id v16 = v11;
    id v5 = v11;
    [v12 perform:v15 withSource:v14];
  }
}

uint64_t __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", *(void *)(a1 + 40));
}

- (id)diagnosticDescription
{
  char v2 = NSString;
  id v3 = [(HDSPSleepScheduleModelManager *)self sleepScheduleModel];
  id v4 = [v2 stringWithFormat:@"Sleep Schedule Model: %@", v3];

  return v4;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSleepEventDelegate)sleepEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepEventDelegate);

  return (HDSPSleepEventDelegate *)WeakRetained;
}

- (void)setSleepEventDelegate:(id)a3
{
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (HDSPSleepScheduleModelChangeEvaluator)changeEvaluator
{
  return self->_changeEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end