@interface HDSHBreathingDisturbanceAnalyzer
+ (BOOL)_areSamplesInSameSleepDayWithFirstSample:(id)a3 secondSample:(id)a4 calendar:(id)a5;
+ (BOOL)isAnalysisNeededWithAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5;
+ (id)_sampleWithHighestDurationWithFirstSample:(id)a3 secondSample:(id)a4;
+ (id)constructAnalysisDateIntervalFromDate:(id)a3 withCalendar:(id)a4;
+ (id)endDateFromMostRecentlyAnalyzedDateIntervalWithDate:(id)a3 numberOfAnalysisAttempts:(int64_t)a4 calendar:(id)a5;
+ (id)samplesFilteredBySleepDay:(id)a3;
+ (int64_t)numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5;
- (BOOL)_requestBreathingDisturbanceAnalysisWithSamples:(id)a3 analysisInterval:(id)a4;
- (BOOL)_writePossibleSleepApneaNotificationSampleWithAnalysisInterval:(id)a3 algorithmVersion:(id)a4 error:(id *)a5;
- (BOOL)performBreathingDisturbanceAnalysisWithIsForced:(BOOL)a3 date:(id)a4 numberOfAnalysisAttempts:(int64_t)a5;
- (HDSHBreathingDisturbanceAnalyzer)initWithProfile:(id)a3;
- (id)_createEnumeratorWithAnalysisInterval:(id)a3 profile:(id)a4;
- (id)fetchSamplesWithAnalysisInterval:(id)a3 profile:(id)a4 error:(id *)a5;
- (void)_sendAnalyticsWithPayload:(id)a3;
- (void)_sendPossibleSleepApneaNotificationWithRequest:(id)a3;
@end

@implementation HDSHBreathingDisturbanceAnalyzer

- (HDSHBreathingDisturbanceAnalyzer)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSHBreathingDisturbanceAnalyzer;
  v5 = [(HDSHBreathingDisturbanceAnalyzer *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F0A0C0]);
    uint64_t v8 = *MEMORY[0x263F09958];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v10 = [v7 initWithLoggingCategory:v8 healthDataSource:WeakRetained];
    analyticsEventSubmissionManager = v6->_analyticsEventSubmissionManager;
    v6->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v10;
  }
  return v6;
}

- (BOOL)performBreathingDisturbanceAnalysisWithIsForced:(BOOL)a3 date:(id)a4 numberOfAnalysisAttempts:(int64_t)a5
{
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = [MEMORY[0x263EFF910] now];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  if (v6)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v11 setDay:~*MEMORY[0x263F75EF0]];
    v12 = [v10 dateByAddingComponents:v11 toDate:v9 options:0];

    v9 = v11;
  }
  else
  {
    v12 = +[HDSHBreathingDisturbanceAnalyzer endDateFromMostRecentlyAnalyzedDateIntervalWithDate:v8 numberOfAnalysisAttempts:a5 calendar:v10];
  }

  objc_super v13 = +[HDSHBreathingDisturbanceAnalyzer constructAnalysisDateIntervalFromDate:v12 withCalendar:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v23 = 0;
  v15 = [(HDSHBreathingDisturbanceAnalyzer *)self fetchSamplesWithAnalysisInterval:v13 profile:WeakRetained error:&v23];
  id v16 = v23;

  if (v16)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x263F09958];
    BOOL v18 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v17;
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      __int16 v26 = 2112;
      id v27 = v16;
      id v21 = v20;
      _os_log_impl(&dword_226DD9000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not get breathing disturbance samples with error: %@", buf, 0x16u);

      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = [(HDSHBreathingDisturbanceAnalyzer *)self _requestBreathingDisturbanceAnalysisWithSamples:v15 analysisInterval:v13];
  }

  return v18;
}

- (id)fetchSamplesWithAnalysisInterval:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = __Block_byref_object_copy__0;
  id v27 = __Block_byref_object_dispose__0;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = [(HDSHBreathingDisturbanceAnalyzer *)self _createEnumeratorWithAnalysisInterval:v8 profile:v9];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__HDSHBreathingDisturbanceAnalyzer_fetchSamplesWithAnalysisInterval_profile_error___block_invoke;
  v21[3] = &unk_2647E7310;
  v21[4] = &v23;
  id v22 = 0;
  char v11 = [v10 enumerateWithError:&v22 handler:v21];
  id v12 = v22;
  objc_super v13 = v12;
  if (v11)
  {
    v14 = [(id)objc_opt_class() samplesFilteredBySleepDay:v24[5]];
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x263F09958];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      uint64_t v17 = [(id)v24[5] count];
      uint64_t v18 = [v14 count];
      *(_DWORD *)buf = 138543874;
      id v30 = v16;
      __int16 v31 = 2048;
      uint64_t v32 = v17;
      __int16 v33 = 2048;
      uint64_t v34 = v18;
      _os_log_impl(&dword_226DD9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched %lu samples, filtered to %lu samples.", buf, 0x20u);
    }
  }
  else
  {
    v19 = v12;
    v15 = v19;
    if (v19)
    {
      if (a5)
      {
        v15 = v19;
        v14 = 0;
        *a5 = v15;
        goto LABEL_9;
      }
      _HKLogDroppedError();
    }
    v14 = 0;
  }
LABEL_9:

  _Block_object_dispose(&v23, 8);
  return v14;
}

uint64_t __83__HDSHBreathingDisturbanceAnalyzer_fetchSamplesWithAnalysisInterval_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_createEnumeratorWithAnalysisInterval:(id)a3 profile:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x263F0A598];
  uint64_t v7 = *MEMORY[0x263F09BD8];
  id v8 = a4;
  id v9 = [v6 quantityTypeForIdentifier:v7];
  uint64_t v10 = HDSampleEntityPredicateForDateInterval();
  char v11 = [MEMORY[0x263F432E8] entityEnumeratorWithType:v9 profile:v8];

  [v11 setPredicate:v10];
  id v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:1];
  v29[0] = v12;
  objc_super v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v11 setSortDescriptors:v13];

  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    id v16 = objc_opt_class();
    id v22 = v16;
    uint64_t v17 = [v5 startDate];
    uint64_t v18 = [v17 description];
    v19 = [v5 endDate];
    v20 = [v19 description];
    *(_DWORD *)buf = 138543874;
    v24 = v16;
    __int16 v25 = 2112;
    __int16 v26 = v18;
    __int16 v27 = 2112;
    id v28 = v20;
    _os_log_impl(&dword_226DD9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Constructed query for breathing disturbance samples with analysis window for start date: %@, end date: %@", buf, 0x20u);
  }
  return v11;
}

- (BOOL)_requestBreathingDisturbanceAnalysisWithSamples:(id)a3 analysisInterval:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (id *)MEMORY[0x263F09958];
  id v9 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    char v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = [v6 count];
    v14 = [v7 description];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v34 = v14;
    _os_log_impl(&dword_226DD9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting analysis with %lu samples and analysis interval of %@", buf, 0x20u);
  }
  memset(buf, 0, sizeof(buf));
  [MEMORY[0x263F2BB18] analyzeSamples:v6 dateInterval:v7];
  if (buf[16])
  {
    _HKInitializeLogging();
    v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 138543362;
      id v30 = (id)objc_opt_class();
      id v16 = v30;
      _os_log_impl(&dword_226DD9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Possible sleep apnea detected from breathing disturbance samples.", v29, 0xCu);
    }
    id v28 = 0;
    BOOL v17 = [(HDSHBreathingDisturbanceAnalyzer *)self _writePossibleSleepApneaNotificationSampleWithAnalysisInterval:v7 algorithmVersion:*(void *)buf error:&v28];
    uint64_t v18 = v28;
    if (!v17)
    {
      _HKInitializeLogging();
      v19 = *v8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        *(_DWORD *)v29 = 138543618;
        id v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = v18;
        id v21 = v20;
        _os_log_impl(&dword_226DD9000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to write sleep apnea event sample with error: %@. Not sending notification and will attempt to retry in one day.", v29, 0x16u);
      }
      BOOL v22 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v18 = *v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 138543362;
      id v30 = (id)objc_opt_class();
      id v23 = v30;
      _os_log_impl(&dword_226DD9000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Possible sleep apnea NOT detected from breathing disturbance samples.", v29, 0xCu);
    }
  }

  _HKInitializeLogging();
  v24 = *v8;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = objc_opt_class();
    *(_DWORD *)v29 = 138543362;
    id v30 = v25;
    id v26 = v25;
    _os_log_impl(&dword_226DD9000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis successfully performed!", v29, 0xCu);
  }
  [(HDSHBreathingDisturbanceAnalyzer *)self _sendAnalyticsWithPayload:*(void *)&buf[8]];
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)_writePossibleSleepApneaNotificationSampleWithAnalysisInterval:(id)a3 algorithmVersion:(id)a4 error:(id *)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v43 = *MEMORY[0x263F09A08];
  v44[0] = v8;
  id v9 = NSDictionary;
  id v10 = a3;
  char v11 = [v9 dictionaryWithObjects:v44 forKeys:&v43 count:1];
  id v12 = (void *)MEMORY[0x263F0A150];
  uint64_t v13 = [MEMORY[0x263F0A158] _typeWithIdentifier:*MEMORY[0x263F09418]];
  v14 = [v10 startDate];
  v15 = [v10 endDate];

  id v16 = [v12 categorySampleWithType:v13 value:0 startDate:v14 endDate:v15 metadata:v11];

  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v19 = [WeakRetained sourceManager];
  v20 = [v19 localDeviceSourceWithError:a5];

  id v21 = objc_loadWeakRetained((id *)&self->_profile);
  id v23 = [v21 deviceManager];
  BOOL v22 = [v23 currentDeviceEntityWithError:a5];

  LOBYTE(v23) = 0;
  if (v20 && v22)
  {
    v36 = self;
    id v37 = v8;
    id v23 = objc_loadWeakRetained((id *)&self->_profile);
    v24 = [v23 dataProvenanceManager];
    __int16 v25 = [v24 localDataProvenanceForSourceEntity:v20 version:0 deviceEntity:v22];

    id v26 = objc_loadWeakRetained((id *)p_profile);
    __int16 v27 = [v26 dataManager];
    v42 = v16;
    id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    LODWORD(v23) = [v27 insertDataObjects:v28 withProvenance:v25 creationDate:0 skipInsertionFilter:a5 error:CFAbsoluteTimeGetCurrent()];

    if (v23)
    {
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        id v30 = v29;
        *(_DWORD *)buf = 138543618;
        id v39 = (id)objc_opt_class();
        __int16 v40 = 2112;
        v41 = v20;
        id v31 = v39;
        _os_log_impl(&dword_226DD9000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully wrote possible sleep apnea event sample with source %@", buf, 0x16u);
      }
      uint64_t v32 = [v16 UUID];
      __int16 v33 = [v32 UUIDString];
      uint64_t v34 = HKSHCreatePossibleSleepApneaDetectedNotificationRequest();

      [(HDSHBreathingDisturbanceAnalyzer *)v36 _sendPossibleSleepApneaNotificationWithRequest:v34];
    }

    id v8 = v37;
  }

  return (char)v23;
}

- (void)_sendAnalyticsWithPayload:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v7 = v12;
    _os_log_impl(&dword_226DD9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to send analytics.", buf, 0xCu);
  }
  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  id v9 = [[HDSHBreathingDisturbanceAnalysisAnalyticsEvent alloc] initWithDefaultAnalyticsPayload:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HDSHBreathingDisturbanceAnalyzer__sendAnalyticsWithPayload___block_invoke;
  v10[3] = &unk_2647E7200;
  v10[4] = self;
  [(HKAnalyticsEventSubmissionManager *)analyticsEventSubmissionManager submitEvent:v9 completion:v10];
}

void __62__HDSHBreathingDisturbanceAnalyzer__sendAnalyticsWithPayload___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09958];
  id v6 = *MEMORY[0x263F09958];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v7 = v5;
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v4;
    id v8 = v10;
    _os_log_error_impl(&dword_226DD9000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error attempting to send analytics payload: %@", (uint8_t *)&v9, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully sent analytics payload!", (uint8_t *)&v9, 0xCu);
LABEL_4:
  }
LABEL_6:
}

- (void)_sendPossibleSleepApneaNotificationWithRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke;
  v6[3] = &unk_2647E7228;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_226DD9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] About to post possible sleep apnea detected notification.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = [WeakRetained notificationManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke_296;
  v8[3] = &unk_2647E7200;
  uint64_t v7 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  [v6 postNotificationWithRequest:v7 completion:v8];
}

void __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke_296(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2112;
      id v10 = v3;
      id v6 = v8;
      _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error posting notification: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)constructAnalysisDateIntervalFromDate:(id)a3 withCalendar:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263EFF918];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  __int16 v9 = objc_msgSend(v7, "hk_sleepDayStartWithCalendar:", v5);
  int v10 = objc_msgSend(v9, "hk_isBeforeDate:", v7);

  if (v10)
  {
    [v8 setDay:1];
    uint64_t v11 = [v5 dateByAddingComponents:v8 toDate:v9 options:0];

    __int16 v9 = (void *)v11;
  }
  [v8 setDay:*MEMORY[0x263F75EF0]];
  id v12 = [v5 dateByAddingComponents:v8 toDate:v9 options:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v12];

  return v13;
}

+ (id)endDateFromMostRecentlyAnalyzedDateIntervalWithDate:(id)a3 numberOfAnalysisAttempts:(int64_t)a4 calendar:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    __int16 v9 = (objc_class *)MEMORY[0x263EFF918];
    id v10 = a5;
    id v11 = objc_alloc_init(v9);
    [v11 setDay:*MEMORY[0x263F75EF0] * a4];
    id v12 = [v10 dateByAddingComponents:v11 toDate:v8 options:0];

    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      int v17 = 138544130;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2112;
      v20 = v8;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 2112;
      id v24 = v12;
      id v15 = v18;
      _os_log_impl(&dword_226DD9000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] With date %@ and number of analysis attempts %ld, end date of most recently analyzed date interval is %@.", (uint8_t *)&v17, 0x2Au);
    }
  }
  else
  {
    id v12 = v7;
  }

  return v12;
}

+ (BOOL)isAnalysisNeededWithAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [a5 components:16 fromDate:a3 toDate:a4 options:0];
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = objc_opt_class();
    id v9 = v8;
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = [v5 day];
    _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of days since last analysis: %ld", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [v5 day];
  BOOL v11 = v10 >= *MEMORY[0x263F75EF0];

  return v11;
}

+ (int64_t)numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 components:16 fromDate:v7 toDate:v8 options:0];
  uint64_t v10 = [v9 day];
  int64_t v11 = v10 / *MEMORY[0x263F75EF0];
  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    int v16 = 138544130;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = v11;
    id v14 = v17;
    _os_log_impl(&dword_226DD9000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of expected analysis attempts between %@ and %@ is: %ld", (uint8_t *)&v16, 0x2Au);
  }
  return v11;
}

+ (id)samplesFilteredBySleepDay:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    if ([v3 count])
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [v3 objectAtIndexedSubscript:v7];
        if ([(id)objc_opt_class() _areSamplesInSameSleepDayWithFirstSample:v4 secondSample:v8 calendar:v6])
        {
          id v9 = [(id)objc_opt_class() _sampleWithHighestDurationWithFirstSample:v4 secondSample:v8];
        }
        else
        {
          [v5 addObject:v4];
          id v9 = v8;
        }
        uint64_t v10 = v9;

        ++v7;
        id v4 = v10;
      }
      while (v7 < [v3 count]);
    }
    else
    {
      uint64_t v10 = v4;
    }
    [v5 addObject:v10];
    if ((unint64_t)[v5 count] <= 0x1E)
    {
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    }
    else
    {
      _HKInitializeLogging();
      id v12 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_FAULT))
      {
        __int16 v15 = v12;
        *(_DWORD *)id v17 = 138543618;
        *(void *)&v17[4] = objc_opt_class();
        *(_WORD *)&v17[12] = 1024;
        *(_DWORD *)&v17[14] = 30;
        id v16 = *(id *)&v17[4];
        _os_log_fault_impl(&dword_226DD9000, v15, OS_LOG_TYPE_FAULT, "[%{public}@] Unexpectedly filtered to more than %d samples, will only return that amount starting from the first sample.", v17, 0x12u);
      }
      uint64_t v13 = objc_msgSend(v5, "subarrayWithRange:", 0, 30, *(_OWORD *)v17, *(void *)&v17[16], v18);
    }
    int64_t v11 = (void *)v13;
  }
  else
  {
    int64_t v11 = (void *)MEMORY[0x263EFFA68];
  }

  return v11;
}

+ (BOOL)_areSamplesInSameSleepDayWithFirstSample:(id)a3 secondSample:(id)a4 calendar:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 endDate];
  uint64_t v10 = objc_msgSend(v9, "hk_morningIndexWithCalendar:", v7);

  int64_t v11 = [v8 endDate];

  uint64_t v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v7);
  return v10 == v12;
}

+ (id)_sampleWithHighestDurationWithFirstSample:(id)a3 secondSample:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 endDate];
  id v8 = [v5 startDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  int64_t v11 = [v6 endDate];
  uint64_t v12 = [v6 startDate];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v10 == v14)
  {
    __int16 v15 = [v5 quantity];
    [v15 _value];
    double v17 = v16;
    uint64_t v18 = [v6 quantity];
    [v18 _value];
    if (v17 <= v19) {
      __int16 v20 = v5;
    }
    else {
      __int16 v20 = v6;
    }
    id v21 = v20;
  }
  else
  {
    if (v10 <= v14) {
      __int16 v22 = v6;
    }
    else {
      __int16 v22 = v5;
    }
    id v21 = v22;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end