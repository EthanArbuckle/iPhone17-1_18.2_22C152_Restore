@interface HDMHPeriodicPromptedAssessmentsManager
- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 error:(id *)a5;
- (HDMHPeriodicPromptedAssessmentsManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (HKObserverSet)observers;
- (NSCalendar)unitTest_gregorianCalendar;
- (NSDate)unitTest_currentDate;
- (id)_currentDate;
- (id)_currentGregorianCalendar;
- (id)_lastPromptAcknowledgmentDateWithFeatureSettings:(id)a3;
- (id)_mostRecentAssessmentDateWithError:(id *)a3;
- (id)_mostRecentAssessmentInteractionDateWithFeatureSettings:(id)a3 error:(id *)a4;
- (id)_mostRecentSampleStartDateForSampleType:(id)a3 error:(id *)a4;
- (id)_promptedAssessmentEligibilityStartDateWithFeatureStatus:(id)a3 error:(id *)a4;
- (int64_t)_periodicAssessmentPromptCadenceInDaysWithFeatureSettings:(id)a3;
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

@implementation HDMHPeriodicPromptedAssessmentsManager

- (HDMHPeriodicPromptedAssessmentsManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMHPeriodicPromptedAssessmentsManager;
  v5 = [(HDMHPeriodicPromptedAssessmentsManager *)&v13 init];
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
    [(HDMHPeriodicPromptedAssessmentsManager *)self _stopObserving];
  }
  v3.receiver = self;
  v3.super_class = (Class)HDMHPeriodicPromptedAssessmentsManager;
  [(HDMHPeriodicPromptedAssessmentsManager *)&v3 dealloc];
}

- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x263F09600];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F09600]];
  char v11 = [v10 areAllRequirementsSatisfied];

  if (v11)
  {
    id v30 = 0;
    v12 = [(HDMHPeriodicPromptedAssessmentsManager *)self _promptedAssessmentEligibilityStartDateWithFeatureStatus:v8 error:&v30];
    id v13 = v30;
    BOOL v14 = v12 != 0;
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x263F09938];
    v16 = *MEMORY[0x263F09938];
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v15;
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        __int16 v33 = 2114;
        v34 = v12;
        id v19 = v18;
        _os_log_impl(&dword_255F2E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Next periodic prompted assessment due date: %{public}@", buf, 0x16u);
      }
      v20 = (void *)[objc_alloc(MEMORY[0x263F55038]) initWithEligibilityStartDate:v12 reason:1];
      id v21 = v20;
      if (a3)
      {
        id v21 = v20;
        *a3 = v21;
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[HDMHPeriodicPromptedAssessmentsManager promptedAssessment:featureStatus:error:](v15, (uint64_t)self, (uint64_t)v13);
      }
      id v28 = v13;
      id v21 = v28;
      if (v28)
      {
        if (a5)
        {
          id v21 = v28;
          *a5 = v21;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = [v8 objectForKeyedSubscript:v9];
      v27 = [v26 unsatisfiedRequirementIdentifiersDescription];
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      __int16 v33 = 2114;
      v34 = v27;
      _os_log_impl(&dword_255F2E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Periodic assessments not supported due to: %{public}@", buf, 0x16u);
    }
    BOOL v14 = 1;
  }

  return v14;
}

- (id)_promptedAssessmentEligibilityStartDateWithFeatureStatus:(id)a3 error:(id *)a4
{
  v6 = [a3 onboardingRecord];
  id v7 = [v6 featureSettings];
  id v20 = 0;
  id v8 = [(HDMHPeriodicPromptedAssessmentsManager *)self _mostRecentAssessmentInteractionDateWithFeatureSettings:v7 error:&v20];
  id v9 = v20;

  if (v9)
  {
    if (a4)
    {
      uint64_t v10 = 0;
      *a4 = v9;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v10 = 0;
    }
  }
  else
  {
    char v11 = [v6 featureSettings];
    int64_t v12 = [(HDMHPeriodicPromptedAssessmentsManager *)self _periodicAssessmentPromptCadenceInDaysWithFeatureSettings:v11];

    if (v8)
    {
      id v13 = [(HDMHPeriodicPromptedAssessmentsManager *)self _currentGregorianCalendar];
      uint64_t v10 = objc_msgSend(v13, "hk_startOfDateByAddingDays:toDate:", v12, v8);
    }
    else
    {
      id v13 = [v6 earliestDateOfAnyOnboardingCompletion];
      BOOL v14 = [(HDMHPeriodicPromptedAssessmentsManager *)self _currentDate];
      int v15 = objc_msgSend(v13, "hk_isAfterDate:", v14);
      v16 = [(HDMHPeriodicPromptedAssessmentsManager *)self _currentGregorianCalendar];
      v17 = v16;
      if (v15) {
        v18 = v14;
      }
      else {
        v18 = v13;
      }
      uint64_t v10 = objc_msgSend(v16, "hk_startOfDateByAddingDays:toDate:", v12, v18);
    }
  }

  return v10;
}

- (id)_mostRecentAssessmentInteractionDateWithFeatureSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMHPeriodicPromptedAssessmentsManager *)self _mostRecentAssessmentDateWithError:a4];
  id v8 = [(HDMHPeriodicPromptedAssessmentsManager *)self _lastPromptAcknowledgmentDateWithFeatureSettings:v6];

  id v9 = [(HDMHPeriodicPromptedAssessmentsManager *)self _currentDate];
  if (objc_msgSend(v7, "hk_isAfterDate:", v9))
  {

    id v7 = 0;
  }
  if (objc_msgSend(v8, "hk_isAfterDate:", v9))
  {

    id v8 = 0;
    BOOL v10 = v7 != 0;
    goto LABEL_8;
  }
  BOOL v10 = v7 != 0;
  if (!v7 || !v8)
  {
LABEL_8:
    if (v10) {
      int64_t v12 = v7;
    }
    else {
      int64_t v12 = v8;
    }
    id v11 = v12;
    goto LABEL_12;
  }
  id v11 = [v7 laterDate:v8];
LABEL_12:
  id v13 = v11;

  return v13;
}

- (id)_mostRecentAssessmentDateWithError:(id *)a3
{
  v5 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F90]];
  id v6 = [(HDMHPeriodicPromptedAssessmentsManager *)self _mostRecentSampleStartDateForSampleType:v5 error:a3];

  id v7 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F98]];
  id v8 = [(HDMHPeriodicPromptedAssessmentsManager *)self _mostRecentSampleStartDateForSampleType:v7 error:a3];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      BOOL v10 = v6;
    }
    else {
      BOOL v10 = v8;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [v6 laterDate:v8];
  }
  int64_t v12 = v11;

  return v12;
}

- (id)_mostRecentSampleStartDateForSampleType:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F43318];
  p_profile = &self->_profile;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  BOOL v9 = [v5 mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:a4];

  BOOL v10 = [v9 startDate];

  return v10;
}

- (id)_lastPromptAcknowledgmentDateWithFeatureSettings:(id)a3
{
  objc_super v3 = [a3 numberForKey:*MEMORY[0x263F54F88]];
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263EFF910];
    [v3 doubleValue];
    id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v6 = 0;
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

- (int64_t)_periodicAssessmentPromptCadenceInDaysWithFeatureSettings:(id)a3
{
  objc_super v3 = [a3 numberForKey:*MEMORY[0x263F54F90]];
  id v4 = v3;
  if (v3 && [v3 integerValue] > 0) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = *MEMORY[0x263F54F78];
  }

  return v5;
}

- (void)registerObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__HDMHPeriodicPromptedAssessmentsManager_registerObserver___block_invoke;
  v4[3] = &unk_2653F03B0;
  v4[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:0 runIfFirstObserver:v4];
}

uint64_t __59__HDMHPeriodicPromptedAssessmentsManager_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (void)_startObserving
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v5 = [WeakRetained dataManager];
  id v6 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F90]];
  [v5 addObserver:self forDataType:v6];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  id v7 = [v9 dataManager];
  id v8 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F98]];
  [v7 addObserver:self forDataType:v8];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HDMHPeriodicPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2653F03B0;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __61__HDMHPeriodicPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopObserving];
}

- (void)_stopObserving
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v5 = [WeakRetained dataManager];
  id v6 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F90]];
  [v5 removeObserver:self forDataType:v6];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  id v7 = [v9 dataManager];
  id v8 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F98]];
  [v7 removeObserver:self forDataType:v8];
}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__HDMHPeriodicPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v3[3] = &unk_2653F04B8;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __85__HDMHPeriodicPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 periodicPromptedAssessmentsManagerDidUpdatePromptedAssessment:*(void *)(a1 + 32)];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  int64_t v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)id v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_255F2E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples added", v8, 0xCu);
  }
  [(HDMHPeriodicPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentUpdate];
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  int64_t v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)id v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_255F2E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples removed", v8, 0xCu);
  }
  [(HDMHPeriodicPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentUpdate];
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

- (void)promptedAssessment:(void *)a1 featureStatus:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_255F2E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility start date: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end