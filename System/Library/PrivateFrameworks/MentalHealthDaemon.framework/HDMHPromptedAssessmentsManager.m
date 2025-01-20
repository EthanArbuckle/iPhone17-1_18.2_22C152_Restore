@interface HDMHPromptedAssessmentsManager
- (HDMHLoggingPatternEscalationsManager)loggingPatternEscalationsManager;
- (HDMHPeriodicPromptedAssessmentsManager)periodicAssessmentsManager;
- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5;
- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5 periodicAssessmentsManager:(id)a6 loggingPatternEscalationsManager:(id)a7;
- (HDProfile)profile;
- (HKFeatureStatusManager)loggingPatternEscalationsFeatureStatusManager;
- (HKFeatureStatusManager)periodicAssessmentsFeatureStatusManager;
- (HKObserverSet)observers;
- (id)promptedAssessmentsWithError:(id *)a3;
- (int64_t)periodicAssessmentPromptCadenceInDaysWithError:(id *)a3;
- (void)_notifyObserversForPromptedAssessmentsUpdate;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)loggingPatternEscalationsManagerDidUpdatePromptedAssessment:(id)a3;
- (void)periodicPromptedAssessmentsManagerDidUpdatePromptedAssessment:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDMHPromptedAssessmentsManager

- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HDMHPeriodicPromptedAssessmentsManager alloc] initWithProfile:v10];
  v12 = [[HDMHLoggingPatternEscalationsManager alloc] initWithProfile:v10];
  v13 = [(HDMHPromptedAssessmentsManager *)self initWithProfile:v10 periodicAssessmentsAvailability:v9 loggingPatternEscalationsAvailability:v8 periodicAssessmentsManager:v11 loggingPatternEscalationsManager:v12];

  return v13;
}

- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5 periodicAssessmentsManager:(id)a6 loggingPatternEscalationsManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDMHPromptedAssessmentsManager;
  v17 = [(HDMHPromptedAssessmentsManager *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    uint64_t v19 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v13 healthDataSource:v12 countryCodeSource:0];
    periodicAssessmentsFeatureStatusManager = v18->_periodicAssessmentsFeatureStatusManager;
    v18->_periodicAssessmentsFeatureStatusManager = (HKFeatureStatusManager *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v14 healthDataSource:v12 countryCodeSource:0];
    loggingPatternEscalationsFeatureStatusManager = v18->_loggingPatternEscalationsFeatureStatusManager;
    v18->_loggingPatternEscalationsFeatureStatusManager = (HKFeatureStatusManager *)v21;

    objc_storeStrong((id *)&v18->_periodicAssessmentsManager, a6);
    objc_storeStrong((id *)&v18->_loggingPatternEscalationsManager, a7);
    id v23 = objc_alloc(MEMORY[0x263F0A5A8]);
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    uint64_t v26 = [v23 initWithName:v25 loggingCategory:*MEMORY[0x263F09938]];
    observers = v18->_observers;
    v18->_observers = (HKObserverSet *)v26;
  }
  return v18;
}

- (void)dealloc
{
  if ([(HKObserverSet *)self->_observers count]) {
    [(HDMHPromptedAssessmentsManager *)self _stopObserving];
  }
  v3.receiver = self;
  v3.super_class = (Class)HDMHPromptedAssessmentsManager;
  [(HDMHPromptedAssessmentsManager *)&v3 dealloc];
}

- (int64_t)periodicAssessmentPromptCadenceInDaysWithError:(id *)a3
{
  v4 = [(HKFeatureStatusManager *)self->_periodicAssessmentsFeatureStatusManager featureStatusWithError:a3];
  periodicAssessmentsManager = self->_periodicAssessmentsManager;
  v6 = [v4 onboardingRecord];
  v7 = [v6 featureSettings];
  int64_t v8 = [(HDMHPeriodicPromptedAssessmentsManager *)periodicAssessmentsManager _periodicAssessmentPromptCadenceInDaysWithFeatureSettings:v7];

  return v8;
}

- (id)promptedAssessmentsWithError:(id *)a3
{
  v5 = -[HKFeatureStatusManager featureStatusWithError:](self->_periodicAssessmentsFeatureStatusManager, "featureStatusWithError:");
  if (v5)
  {
    periodicAssessmentsManager = self->_periodicAssessmentsManager;
    id v18 = 0;
    BOOL v7 = [(HDMHPeriodicPromptedAssessmentsManager *)periodicAssessmentsManager promptedAssessment:&v18 featureStatus:v5 error:a3];
    id v8 = v18;
    id v9 = 0;
    if (v7)
    {
      id v10 = [(HKFeatureStatusManager *)self->_loggingPatternEscalationsFeatureStatusManager featureStatusWithError:a3];
      if (v10)
      {
        loggingPatternEscalationsManager = self->_loggingPatternEscalationsManager;
        id v17 = 0;
        BOOL v12 = [(HDMHLoggingPatternEscalationsManager *)loggingPatternEscalationsManager promptedAssessment:&v17 featureStatus:v10 pendingStateOfMind:0 error:a3];
        id v13 = v17;
        id v9 = 0;
        if (v12)
        {
          id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v15 = v14;
          if (v8) {
            [v14 addObject:v8];
          }
          if (v13) {
            [v15 addObject:v13];
          }
          id v9 = (void *)[v15 copy];
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__HDMHPromptedAssessmentsManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_2653F03B0;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __57__HDMHPromptedAssessmentsManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (void)_startObserving
{
  [(HKFeatureStatusManager *)self->_periodicAssessmentsFeatureStatusManager registerObserver:self];
  [(HKFeatureStatusManager *)self->_loggingPatternEscalationsFeatureStatusManager registerObserver:self];
  [(HDMHPeriodicPromptedAssessmentsManager *)self->_periodicAssessmentsManager registerObserver:self];
  loggingPatternEscalationsManager = self->_loggingPatternEscalationsManager;
  [(HDMHLoggingPatternEscalationsManager *)loggingPatternEscalationsManager registerObserver:self];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HDMHPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2653F03B0;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __53__HDMHPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopObserving];
}

- (void)_stopObserving
{
  [(HKFeatureStatusManager *)self->_periodicAssessmentsFeatureStatusManager unregisterObserver:self];
  [(HKFeatureStatusManager *)self->_loggingPatternEscalationsFeatureStatusManager unregisterObserver:self];
  [(HDMHPeriodicPromptedAssessmentsManager *)self->_periodicAssessmentsManager unregisterObserver:self];
  loggingPatternEscalationsManager = self->_loggingPatternEscalationsManager;
  [(HDMHLoggingPatternEscalationsManager *)loggingPatternEscalationsManager unregisterObserver:self];
}

- (void)_notifyObserversForPromptedAssessmentsUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __78__HDMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentsUpdate__block_invoke;
  v3[3] = &unk_2653F0720;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __78__HDMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentsUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 promptedAssessmentsManagerDidUpdatePromptedAssessments:*(void *)(a1 + 32)];
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v5 featureIdentifier];
    int v11 = 138543618;
    BOOL v12 = v8;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_255F2E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in feature status for %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(HDMHPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentsUpdate];
}

- (void)periodicPromptedAssessmentsManagerDidUpdatePromptedAssessment:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)BOOL v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_255F2E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in periodic prompted assessment", v7, 0xCu);
  }
  [(HDMHPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentsUpdate];
}

- (void)loggingPatternEscalationsManagerDidUpdatePromptedAssessment:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)BOOL v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_255F2E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in logging pattern escalation", v7, 0xCu);
  }
  [(HDMHPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentsUpdate];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (HKFeatureStatusManager)periodicAssessmentsFeatureStatusManager
{
  return self->_periodicAssessmentsFeatureStatusManager;
}

- (HKFeatureStatusManager)loggingPatternEscalationsFeatureStatusManager
{
  return self->_loggingPatternEscalationsFeatureStatusManager;
}

- (HDMHPeriodicPromptedAssessmentsManager)periodicAssessmentsManager
{
  return self->_periodicAssessmentsManager;
}

- (HDMHLoggingPatternEscalationsManager)loggingPatternEscalationsManager
{
  return self->_loggingPatternEscalationsManager;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loggingPatternEscalationsManager, 0);
  objc_storeStrong((id *)&self->_periodicAssessmentsManager, 0);
  objc_storeStrong((id *)&self->_loggingPatternEscalationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_periodicAssessmentsFeatureStatusManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end