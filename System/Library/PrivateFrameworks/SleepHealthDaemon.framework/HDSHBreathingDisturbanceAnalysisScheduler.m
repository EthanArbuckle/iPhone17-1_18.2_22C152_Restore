@interface HDSHBreathingDisturbanceAnalysisScheduler
- (BOOL)_areNotificationsEnabled;
- (BOOL)_isFeatureOnboardedWithFeatureOnboardingRecord:(id)a3;
- (BOOL)_writeDateOfMostRecentSuccessfulAnalysisAttempt;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDPeriodicActivity)activity;
- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6;
- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6 protectedDataOperation:(id)a7 profileDidBecomeReadyBlock:(id)a8;
- (id)_getEarliestOnboardingDate;
- (void)_requestBreathingDisturbanceAnalysisIfNeeded;
- (void)_runCompletionIfExistsWithResult:(int64_t)a3 retryInterval:(double)a4;
- (void)_updateActivityCriteriaAndResetActivity;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)overrideAnalysisTimeIntervalAndResetActivityWithTimeInterval:(double)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDSHBreathingDisturbanceAnalysisScheduler

- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6
{
  v10 = (objc_class *)MEMORY[0x263F432D8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v10 alloc] initWithProfile:v14 debugIdentifier:@"BreathingDisturbanceAnalysisProtectedDataOperation" delegate:self];
  v16 = [(HDSHBreathingDisturbanceAnalysisScheduler *)self initWithProfile:v14 featureStatusProvider:v13 featureAvailabilityProviding:v12 currentDateProvider:v11 protectedDataOperation:v15 profileDidBecomeReadyBlock:0];

  return v16;
}

- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6 protectedDataOperation:(id)a7 profileDidBecomeReadyBlock:(id)a8
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v40 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v42.receiver = self;
  v42.super_class = (Class)HDSHBreathingDisturbanceAnalysisScheduler;
  v19 = [(HDSHBreathingDisturbanceAnalysisScheduler *)&v42 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_profile, v14);
    objc_storeStrong((id *)&v20->_featureStatusProvider, a4);
    id v21 = objc_alloc(MEMORY[0x263F43218]);
    uint64_t v22 = objc_msgSend(v21, "initWithCategory:domainName:profile:", 102, *MEMORY[0x263F75EF8], v14, v40);
    keyValueDomain = v20->_keyValueDomain;
    v20->_keyValueDomain = (HDKeyValueDomain *)v22;

    uint64_t v24 = [v16 copy];
    id currentDateProvider = v20->_currentDateProvider;
    v20->_id currentDateProvider = (id)v24;

    v20->_analysisTimeInterval = (double)(uint64_t)*MEMORY[0x263EF81E8];
    uint64_t v26 = HKCreateSerialUtilityDispatchQueue();
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v20->_featureAvailabilityProviding, a5);
    [(HKFeatureAvailabilityProviding *)v20->_featureAvailabilityProviding registerObserver:v20 queue:v20->_queue];
    v20->_useTimeIntervalOverride = 0;
    uint64_t v28 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    cachedCalendar = v20->_cachedCalendar;
    v20->_cachedCalendar = (NSCalendar *)v28;

    id WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    [WeakRetained registerProfileReadyObserver:v20 queue:0];

    v20->_completionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_protectedDataOperation, a7);
    uint64_t v31 = [v18 copy];
    id unitTesting_profileDidBecomeReadyBlock = v20->_unitTesting_profileDidBecomeReadyBlock;
    v20->_id unitTesting_profileDidBecomeReadyBlock = (id)v31;

    protectedDataOperation = v20->_protectedDataOperation;
    id v41 = 0;
    LOBYTE(WeakRetained) = [(HDProtectedDataOperation *)protectedDataOperation requestWorkWithPriority:2 error:&v41];
    id v34 = v41;
    if ((WeakRetained & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
      {
        v37 = v35;
        v38 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        __int16 v45 = 2112;
        id v46 = v34;
        id v39 = v38;
        _os_log_error_impl(&dword_226DD9000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Request was not processed with error: %@", buf, 0x16u);
      }
    }
  }
  return v20;
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8 = (void (**)(void))a6;
  v9 = [a3 debugIdentifier];
  char v10 = [v9 isEqualToString:@"BreathingDisturbanceAnalysisProtectedDataOperation"];

  if (v10)
  {
    [(HDSHBreathingDisturbanceAnalysisScheduler *)self _requestBreathingDisturbanceAnalysisIfNeeded];
    v8[2](v8);
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v13 = v15;
      _os_log_impl(&dword_226DD9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected operation received; not performing operation.",
        (uint8_t *)&v14,
        0xCu);
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F432C8]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = (HDPeriodicActivity *)[v4 initWithProfile:WeakRetained name:@"com.apple.healthd.sleep.breathingdisturbanceanalysisactivity" interval:self delegate:*MEMORY[0x263F09958] loggingCategory:self->_analysisTimeInterval];
  activity = self->_activity;
  self->_activity = v6;

  id unitTesting_profileDidBecomeReadyBlock = self->_unitTesting_profileDidBecomeReadyBlock;
  if (unitTesting_profileDidBecomeReadyBlock)
  {
    v9 = (void (*)(void))*((void *)unitTesting_profileDidBecomeReadyBlock + 2);
    v9();
  }
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding record has updated. Recalculating activity criteria.", v7, 0xCu);
  }
  [(HDSHBreathingDisturbanceAnalysisScheduler *)self _updateActivityCriteriaAndResetActivity];
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F09958];
  v9 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    char v10 = v9;
    *(_DWORD *)buf = 138543362;
    id v32 = (id)objc_opt_class();
    id v11 = v32;
    _os_log_impl(&dword_226DD9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Periodic activity interval has been met.", buf, 0xCu);
  }
  id v12 = [v7 name];

  if ([v12 isEqualToString:@"com.apple.healthd.sleep.breathingdisturbanceanalysisactivity"])
  {
    protectedDataOperation = self->_protectedDataOperation;
    id v30 = 0;
    char v14 = [(HDProtectedDataOperation *)protectedDataOperation requestWorkWithPriority:2 error:&v30];
    id v15 = v30;
    if (v14)
    {
      os_unfair_lock_lock(&self->_completionLock);
      if (self->_completion)
      {
        _HKInitializeLogging();
        uint64_t v16 = *v8;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          id v18 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v32 = v18;
          id v19 = v18;
          _os_log_impl(&dword_226DD9000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request was processed, but completion exists before capture.", buf, 0xCu);
        }
        (*((void (**)(double))self->_completion + 2))((double)(uint64_t)*MEMORY[0x263EF81E8]);
      }
      v20 = (void *)[v6 copy];
      id completion = self->_completion;
      self->_id completion = v20;

      os_unfair_lock_unlock(&self->_completionLock);
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v23 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v27 = v23;
        uint64_t v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v32 = v28;
        __int16 v33 = 2112;
        id v34 = v15;
        id v29 = v28;
        _os_log_error_impl(&dword_226DD9000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Request was not processed with error: %@\nWill try analysis again in a day.", buf, 0x16u);
      }
      (*((void (**)(id, uint64_t, void, double))v6 + 2))(v6, 2, 0, (double)(uint64_t)*MEMORY[0x263EF81E8]);
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v22 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v22;
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v32 = v25;
      id v26 = v25;
      _os_log_error_impl(&dword_226DD9000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected activity received; not performing activity.",
        buf,
        0xCu);
    }
    (*((void (**)(id, uint64_t, void, double))v6 + 2))(v6, 1, 0, 0.0);
  }
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a3 name];
  if ([v7 isEqualToString:@"com.apple.healthd.sleep.breathingdisturbanceanalysisactivity"])
  {
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x263EF82A0], 1);
    if (self->_useTimeIntervalOverride)
    {
      _HKInitializeLogging();
      uint64_t v8 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        char v10 = objc_opt_class();
        double analysisTimeInterval = self->_analysisTimeInterval;
        int v18 = 138543618;
        id v19 = v10;
        __int16 v20 = 2048;
        double v21 = analysisTimeInterval;
        id v12 = v10;
        _os_log_impl(&dword_226DD9000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using time interval override of %f.", (uint8_t *)&v18, 0x16u);
      }
      id v13 = (const char *)*MEMORY[0x263EF81D8];
      int64_t v14 = (uint64_t)self->_analysisTimeInterval;
    }
    else
    {
      id v13 = (const char *)*MEMORY[0x263EF81D8];
      int64_t v14 = *MEMORY[0x263EF81E8];
    }
    xpc_dictionary_set_int64(v6, v13, v14);
  }
  else
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v17 = v19;
      _os_log_impl(&dword_226DD9000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected activity received; not setting activity criteria.",
        (uint8_t *)&v18,
        0xCu);
    }
  }
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (void)overrideAnalysisTimeIntervalAndResetActivityWithTimeInterval:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = objc_opt_class();
    double analysisTimeInterval = self->_analysisTimeInterval;
    *(_DWORD *)char v10 = 138543874;
    *(void *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2048;
    *(double *)&v10[14] = analysisTimeInterval;
    *(_WORD *)&v10[22] = 2048;
    double v11 = a3;
    id v9 = v7;
    _os_log_impl(&dword_226DD9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding old time interval of %f with new time interval of %f.", v10, 0x20u);
  }
  self->_double analysisTimeInterval = a3;
  self->_useTimeIntervalOverride = 1;
  [(HDSHBreathingDisturbanceAnalysisScheduler *)self _updateActivityCriteriaAndResetActivity];
}

- (void)_runCompletionIfExistsWithResult:(int64_t)a3 retryInterval:(double)a4
{
  p_completionLock = &self->_completionLock;
  os_unfair_lock_lock(&self->_completionLock);
  id completion = (void (**)(id, int64_t, void, double))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, 0, a4);
    id v9 = self->_completion;
    self->_id completion = 0;
  }
  os_unfair_lock_unlock(p_completionLock);
  [(HDSHBreathingDisturbanceAnalysisScheduler *)self _updateActivityCriteriaAndResetActivity];
}

- (BOOL)_writeDateOfMostRecentSuccessfulAnalysisAttempt
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (*((void (**)(void))self->_currentDateProvider + 2))();
  keyValueDomain = self->_keyValueDomain;
  uint64_t v5 = *MEMORY[0x263F75EE0];
  id v15 = 0;
  char v6 = [(HDKeyValueDomain *)keyValueDomain setDate:v3 forKey:v5 error:&v15];
  id v7 = v15;
  _HKInitializeLogging();
  uint64_t v8 = (void *)*MEMORY[0x263F09958];
  id v9 = *MEMORY[0x263F09958];
  if ((v6 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    char v10 = v8;
    int64_t v14 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v17 = v14;
    __int16 v18 = 2112;
    id v19 = v7;
    id v12 = v14;
    _os_log_fault_impl(&dword_226DD9000, v10, OS_LOG_TYPE_FAULT, "[%{public}@] Could not write date of last analysis attempt with error %@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = v8;
    double v11 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v3;
    id v12 = v11;
    _os_log_impl(&dword_226DD9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wrote date of last analysis attempt: %@", buf, 0x16u);
LABEL_4:
  }
LABEL_6:

  return v6;
}

- (BOOL)_areNotificationsEnabled
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  featureStatusProvider = self->_featureStatusProvider;
  id v13 = 0;
  v3 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v13];
  id v4 = v13;
  if (v4)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x263F09958];
    char v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      id v9 = v8;
      _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error getting feature status: %@", buf, 0x16u);

      char v6 = 0;
    }
  }
  else
  {
    char v10 = [v3 requirementsEvaluationByContext];
    double v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    char v6 = [v11 areAllRequirementsSatisfied];
  }
  return v6;
}

- (BOOL)_isFeatureOnboardedWithFeatureOnboardingRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    _HKInitializeLogging();
    char v6 = (void *)*MEMORY[0x263F09958];
    BOOL v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v7 = v6;
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v8 = v13;
    id v9 = "[%{public}@] Received nil onboarding record. Will assume feature is not onboarded.";
LABEL_8:
    _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);

    BOOL v5 = 0;
    goto LABEL_9;
  }
  if ([v3 onboardingState] != 2)
  {
    _HKInitializeLogging();
    char v10 = (void *)*MEMORY[0x263F09958];
    BOOL v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v7 = v10;
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v8 = v13;
    id v9 = "[%{public}@] User is not onboarded in a supported region.";
    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (id)_getEarliestOnboardingDate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  featureAvailabilityProviding = self->_featureAvailabilityProviding;
  id v12 = 0;
  id v4 = [(HKFeatureAvailabilityProviding *)featureAvailabilityProviding featureOnboardingRecordWithError:&v12];
  id v5 = v12;
  if (v5)
  {
    _HKInitializeLogging();
    char v6 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      id v9 = v8;
      _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error fetching onboarding record: %@\nReturning nil onboarding date.", buf, 0x16u);
    }
  }
  else if ([(HDSHBreathingDisturbanceAnalysisScheduler *)self _isFeatureOnboardedWithFeatureOnboardingRecord:v4])
  {
    char v10 = [v4 earliestDateOfAnyOnboardingCompletion];
    goto LABEL_7;
  }
  char v10 = 0;
LABEL_7:

  return v10;
}

- (void)_requestBreathingDisturbanceAnalysisIfNeeded
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  if ([(HDSHBreathingDisturbanceAnalysisScheduler *)self _areNotificationsEnabled])
  {
    id v3 = [(HDSHBreathingDisturbanceAnalysisScheduler *)self _getEarliestOnboardingDate];
    if (v3)
    {
      keyValueDomain = self->_keyValueDomain;
      uint64_t v5 = *MEMORY[0x263F75EE8];
      id v67 = 0;
      char v6 = [(HDKeyValueDomain *)keyValueDomain numberForKey:v5 error:&v67];
      id v7 = v67;
      uint64_t v8 = [v6 integerValue];

      _HKInitializeLogging();
      id v9 = (os_log_t *)MEMORY[0x263F09958];
      char v10 = (void *)*MEMORY[0x263F09958];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v11)
        {
          id v12 = v10;
          id v13 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v69 = v13;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v7;
          id v14 = v13;
          _os_log_impl(&dword_226DD9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error fetching number of analysis attempts: %@.", buf, 0x16u);
        }
        [(HDSHBreathingDisturbanceAnalysisScheduler *)self _runCompletionIfExistsWithResult:2 retryInterval:(double)(uint64_t)*MEMORY[0x263EF81E8]];
      }
      else
      {
        if (v11)
        {
          double v21 = v10;
          uint64_t v22 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v69 = v22;
          __int16 v70 = 2048;
          uint64_t v71 = v8;
          id v23 = v22;
          _os_log_impl(&dword_226DD9000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of analysis attempts: %ld.", buf, 0x16u);
        }
        uint64_t v24 = +[HDSHBreathingDisturbanceAnalyzer endDateFromMostRecentlyAnalyzedDateIntervalWithDate:v3 numberOfAnalysisAttempts:v8 calendar:self->_cachedCalendar];
        v64 = (*((void (**)(void))self->_currentDateProvider + 2))();
        int64_t v65 = +[HDSHBreathingDisturbanceAnalyzer numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:referenceDate:calendar:](HDSHBreathingDisturbanceAnalyzer, "numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:referenceDate:calendar:", v3);
        _HKInitializeLogging();
        os_log_t v25 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = v25;
          v27 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v69 = v27;
          __int16 v70 = 2048;
          uint64_t v71 = v8;
          id v28 = v27;
          _os_log_impl(&dword_226DD9000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of expected analysis attempts: %ld", buf, 0x16u);
        }
        BOOL v29 = +[HDSHBreathingDisturbanceAnalyzer isAnalysisNeededWithAnchorDate:v24 referenceDate:v64 calendar:self->_cachedCalendar];
        _HKInitializeLogging();
        os_log_t v30 = *v9;
        BOOL v31 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
        if (v29)
        {
          v63 = v24;
          if (v31)
          {
            id v32 = v30;
            __int16 v33 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v69 = v33;
            id v34 = v33;
            _os_log_impl(&dword_226DD9000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis is needed. Analyzing over date intervals that have not been analyzed.", buf, 0xCu);
          }
          uint64_t v35 = [HDSHBreathingDisturbanceAnalyzer alloc];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          v37 = [(HDSHBreathingDisturbanceAnalyzer *)v35 initWithProfile:WeakRetained];

          if (v8 >= v65)
          {
LABEL_29:
            uint64_t v52 = 0;
LABEL_39:
            uint64_t v24 = v63;
          }
          else
          {
            while (1)
            {
              BOOL v38 = [(HDSHBreathingDisturbanceAnalyzer *)v37 performBreathingDisturbanceAnalysisWithIsForced:0 date:v3 numberOfAnalysisAttempts:v8];
              _HKInitializeLogging();
              os_log_t v39 = *v9;
              id v40 = *v9;
              if (!v38) {
                break;
              }
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = v39;
                objc_super v42 = objc_opt_class();
                *(_DWORD *)buf = 138543362;
                id v69 = v42;
                id v43 = v42;
                _os_log_impl(&dword_226DD9000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully performed analysis! Attempting to update count.", buf, 0xCu);
              }
              ++v8;
              v44 = self->_keyValueDomain;
              __int16 v45 = [NSNumber numberWithInteger:v8];
              id v66 = 0;
              char v46 = [(HDKeyValueDomain *)v44 setNumber:v45 forKey:v5 error:&v66];
              id v47 = v66;

              if ((v46 & 1) == 0)
              {
                _HKInitializeLogging();
                os_log_t v56 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                {
                  v60 = v56;
                  v61 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  id v69 = v61;
                  __int16 v70 = 2112;
                  uint64_t v71 = (uint64_t)v47;
                  id v62 = v61;
                  _os_log_error_impl(&dword_226DD9000, v60, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to write updated count of analysis attempts with error: %@\nWill retry this window in one day.", buf, 0x16u);
                }
                uint64_t v52 = 2;
                goto LABEL_39;
              }
              if (![(HDSHBreathingDisturbanceAnalysisScheduler *)self _writeDateOfMostRecentSuccessfulAnalysisAttempt])
              {
                _HKInitializeLogging();
                os_log_t v48 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = v48;
                  v50 = objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  id v69 = v50;
                  id v51 = v50;
                  _os_log_impl(&dword_226DD9000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Date write failed while performing analysis.", buf, 0xCu);
                }
              }

              if (v65 == v8) {
                goto LABEL_29;
              }
            }
            uint64_t v24 = v63;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v57 = v39;
              v58 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              id v69 = v58;
              id v59 = v58;
              _os_log_error_impl(&dword_226DD9000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to perform successful analysis.\nWill retry in one day.", buf, 0xCu);
            }
            uint64_t v52 = 2;
          }
          [(HDSHBreathingDisturbanceAnalysisScheduler *)self _runCompletionIfExistsWithResult:v52 retryInterval:(double)(uint64_t)*MEMORY[0x263EF81E8]];
        }
        else
        {
          if (v31)
          {
            v53 = v30;
            v54 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v69 = v54;
            id v55 = v54;
            _os_log_impl(&dword_226DD9000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis is not needed.", buf, 0xCu);
          }
          [(HDSHBreathingDisturbanceAnalysisScheduler *)self _runCompletionIfExistsWithResult:0 retryInterval:(double)(uint64_t)*MEMORY[0x263EF81E8]];
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        *(_DWORD *)buf = 138543362;
        id v69 = (id)objc_opt_class();
        id v20 = v69;
        _os_log_impl(&dword_226DD9000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil onboarding date, not checking if analysis is overdue.", buf, 0xCu);
      }
      [(HDSHBreathingDisturbanceAnalysisScheduler *)self _runCompletionIfExistsWithResult:2 retryInterval:(double)(uint64_t)*MEMORY[0x263EF81E8]];
    }
  }
  else
  {
    _HKInitializeLogging();
    __int16 v15 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      *(_DWORD *)buf = 138543362;
      id v69 = (id)objc_opt_class();
      id v17 = v69;
      _os_log_impl(&dword_226DD9000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature is disabled; not going to check if analysis is overdue.",
        buf,
        0xCu);
    }
    [(HDSHBreathingDisturbanceAnalysisScheduler *)self _runCompletionIfExistsWithResult:0 retryInterval:(double)(uint64_t)*MEMORY[0x263EF81E8]];
  }
}

- (void)_updateActivityCriteriaAndResetActivity
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)char v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activity criteria will be updated and reset.", v6, 0xCu);
  }
  [(HDPeriodicActivity *)self->_activity updateCriteria];
  [(HDPeriodicActivity *)self->_activity resetInterval];
}

- (HDPeriodicActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_unitTesting_profileDidBecomeReadyBlock, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_cachedCalendar, 0);
  objc_storeStrong((id *)&self->_protectedDataOperation, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProviding, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end