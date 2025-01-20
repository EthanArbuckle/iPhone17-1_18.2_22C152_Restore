@interface HDMHLoggingPatternEscalationsManager
- (BOOL)_areEscalationsSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureSettings:(id)a5;
- (BOOL)_areEscalationsSupportedAndNotSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureStatus:(id)a5;
- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6;
- (HDMHLoggingPatternEscalationsManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (HKObserverSet)observers;
- (NSCalendar)unitTest_gregorianCalendar;
- (NSDate)unitTest_currentDate;
- (id)_currentDate;
- (id)_currentGregorianCalendar;
- (id)_lastEscalationAcknowledgmentDateWithFeatureSettings:(id)a3;
- (void)_notifyObserversForPromptedAssessmentUpdate;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setUnitTest_currentDate:(id)a3;
- (void)setUnitTest_gregorianCalendar:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDMHLoggingPatternEscalationsManager

- (HDMHLoggingPatternEscalationsManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMHLoggingPatternEscalationsManager;
  v5 = [(HDMHLoggingPatternEscalationsManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F0A5A8]);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 initWithName:v9 loggingCategory:*MEMORY[0x263F09938]];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v10;
  }
  return v6;
}

- (void)dealloc
{
  if ([(HKObserverSet *)self->_observers count]) {
    [(HDMHLoggingPatternEscalationsManager *)self _stopObserving];
  }
  v3.receiver = self;
  v3.super_class = (Class)HDMHLoggingPatternEscalationsManager;
  [(HDMHLoggingPatternEscalationsManager *)&v3 dealloc];
}

- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(HDMHLoggingPatternEscalationsManager *)self _currentDate];
  objc_super v13 = [(HDMHLoggingPatternEscalationsManager *)self _currentGregorianCalendar];
  BOOL v14 = [(HDMHLoggingPatternEscalationsManager *)self _areEscalationsSupportedAndNotSnoozedWithCurrentDate:v12 gregorianCalendar:v13 featureStatus:v11];

  if (v14)
  {
    v15 = [HDMHLoggingPatternDetector alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v17 = [(HDMHLoggingPatternDetector *)v15 initWithProfile:WeakRetained];

    id v26 = 0;
    v18 = [(HDMHLoggingPatternDetector *)v17 isUnpleasantLoggingPatternDetectedWithCurrentDate:v12 gregorianCalendar:v13 pendingStateOfMind:v10 error:&v26];
    id v19 = v26;
    BOOL v20 = v18 != 0;
    if (v18)
    {
      if (![v18 BOOLValue])
      {
LABEL_14:

        goto LABEL_15;
      }
      v21 = (void *)[objc_alloc(MEMORY[0x263F55038]) initWithEligibilityStartDate:v12 reason:2];
      id v22 = v21;
      if (a3)
      {
        id v22 = v21;
        *a3 = v22;
      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x263F09938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
        -[HDMHLoggingPatternEscalationsManager promptedAssessment:featureStatus:pendingStateOfMind:error:](v23, (uint64_t)self, (uint64_t)v19);
      }
      id v24 = v19;
      id v22 = v24;
      if (v24)
      {
        if (a6)
        {
          id v22 = v24;
          *a6 = v22;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

    goto LABEL_14;
  }
  BOOL v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)_areEscalationsSupportedAndNotSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureStatus:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F09600];
  v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F09600]];
  char v13 = [v12 areAllRequirementsSatisfied];

  if (v13)
  {
    BOOL v14 = [v10 onboardingRecord];
    v15 = [v14 featureSettings];
    BOOL v16 = [(HDMHLoggingPatternEscalationsManager *)self _areEscalationsSnoozedWithCurrentDate:v8 gregorianCalendar:v9 featureSettings:v15];

    BOOL v17 = !v16;
  }
  else
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x263F09938];
    BOOL v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      BOOL v20 = objc_opt_class();
      id v21 = v20;
      id v22 = [v10 objectForKeyedSubscript:v11];
      v23 = [v22 unsatisfiedRequirementIdentifiersDescription];
      int v25 = 138543618;
      id v26 = v20;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_impl(&dword_255F2E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Escalations not supported due to: %{public}@", (uint8_t *)&v25, 0x16u);

      BOOL v17 = 0;
    }
  }

  return v17;
}

- (BOOL)_areEscalationsSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDMHLoggingPatternEscalationsManager *)self _lastEscalationAcknowledgmentDateWithFeatureSettings:a5];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(v9, "hk_startOfDateByAddingDays:toDate:", *MEMORY[0x263F54FD8], v10);
    if (objc_msgSend(v10, "hk_isBeforeDate:", v8)) {
      char v12 = objc_msgSend(v11, "hk_isAfterDate:", v8);
    }
    else {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)_lastEscalationAcknowledgmentDateWithFeatureSettings:(id)a3
{
  objc_super v3 = [a3 numberForKey:*MEMORY[0x263F54F80]];
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263EFF910];
    [v3 doubleValue];
    v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_currentDate
{
  unitTest_currentDate = self->_unitTest_currentDate;
  if (unitTest_currentDate)
  {
    objc_super v3 = unitTest_currentDate;
  }
  else
  {
    objc_super v3 = [MEMORY[0x263EFF910] now];
  }
  return v3;
}

- (id)_currentGregorianCalendar
{
  unitTest_gregorianCalendar = self->_unitTest_gregorianCalendar;
  if (unitTest_gregorianCalendar)
  {
    objc_super v3 = unitTest_gregorianCalendar;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    objc_super v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)registerObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__HDMHLoggingPatternEscalationsManager_registerObserver___block_invoke;
  v4[3] = &unk_2653F03B0;
  v4[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:0 runIfFirstObserver:v4];
}

uint64_t __57__HDMHLoggingPatternEscalationsManager_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (void)_startObserving
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x263F0A6E8] stateOfMindType];
  [v3 addObserver:self forDataType:v4];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__HDMHLoggingPatternEscalationsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2653F03B0;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __59__HDMHLoggingPatternEscalationsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopObserving];
}

- (void)_stopObserving
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x263F0A6E8] stateOfMindType];
  [v3 removeObserver:self forDataType:v4];
}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__HDMHLoggingPatternEscalationsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v3[3] = &unk_2653F03D8;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __83__HDMHLoggingPatternEscalationsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 loggingPatternEscalationsManagerDidUpdatePromptedAssessment:*(void *)(a1 + 32)];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)id v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_255F2E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples added", v8, 0xCu);
  }
  [(HDMHLoggingPatternEscalationsManager *)self _notifyObserversForPromptedAssessmentUpdate];
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)id v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_255F2E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples removed", v8, 0xCu);
  }
  [(HDMHLoggingPatternEscalationsManager *)self _notifyObserversForPromptedAssessmentUpdate];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
}

- (NSCalendar)unitTest_gregorianCalendar
{
  return self->_unitTest_gregorianCalendar;
}

- (void)setUnitTest_gregorianCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)promptedAssessment:(uint64_t)a3 featureStatus:pendingStateOfMind:error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_255F2E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error seeking pattern in logging: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end