@interface HKSHSleepApneaControl
- (BOOL)forceBreathingDisturbanceAnalysisWithError:(id *)a3;
- (BOOL)overrideTimeIntervalAndResetActivityWithTimeInterval:(double)a3 error:(id *)a4;
- (HKSHSleepApneaControl)initWithHealthStore:(id)a3;
- (id)getDateIntervalOfLastAnalysis;
- (id)getSamplesFromLastAnalysisWithError:(id *)a3;
@end

@implementation HKSHSleepApneaControl

- (HKSHSleepApneaControl)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSHSleepApneaControl;
  v6 = [(HKSHSleepApneaControl *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A818]);
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v8 initWithHealthStore:v5 taskIdentifier:@"HKSHSleepApneaControlServer" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
    id v12 = objc_alloc_init(MEMORY[0x263F0A810]);
    [(HKTaskServerProxyProvider *)v7->_proxyProvider setTaskConfiguration:v12];
  }
  return v7;
}

- (BOOL)forceBreathingDisturbanceAnalysisWithError:(id *)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  objc_super v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke_2;
  v9[3] = &unk_264227EF8;
  v9[4] = &v10;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:&__block_literal_global errorHandler:v9];
  id v5 = (id)v11[5];
  v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_forceBreathingDisturbanceAnalysis");
}

void __68__HKSHSleepApneaControl_forceBreathingDisturbanceAnalysisWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)overrideTimeIntervalAndResetActivityWithTimeInterval:(double)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v10[4] = &v12;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke;
  v11[3] = &__block_descriptor_40_e39_v16__0___HKSHSleepApneaControlServer__8l;
  *(double *)&v11[4] = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke_2;
  v10[3] = &unk_264227EF8;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  id v6 = (id)v13[5];
  BOOL v7 = v6;
  if (v6)
  {
    if (a4) {
      *a4 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_overridePreviousTimeIntervalWithTimeInterval:", *(double *)(a1 + 32));
}

void __84__HKSHSleepApneaControl_overrideTimeIntervalAndResetActivityWithTimeInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSamplesFromLastAnalysisWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v17;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke;
  v10[3] = &unk_264227F68;
  v10[4] = self;
  void v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_3;
  v9[3] = &unk_264227EF8;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v18[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 getDateIntervalOfLastAnalysis];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_2;
  v6[3] = &unk_264227F40;
  v6[4] = *(void *)(a1 + 40);
  objc_msgSend(v4, "remote_getBreathingDisturbanceSamplesInDateInterval:completion:", v5, v6);
}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

void __61__HKSHSleepApneaControl_getSamplesFromLastAnalysisWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)getDateIntervalOfLastAnalysis
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F0A470]) initWithCategory:2 domainName:@"com.apple.health.Sleep.BreathingDisturbanceAnalysis" healthStore:self->_healthStore];
  id v37 = 0;
  id v4 = [v3 numberForKey:@"HDSHBreathingDisturbanceAnalysisSchedulerSuccessfulAnalysisAttemptCountKey" error:&v37];
  id v5 = v37;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09958];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v7 = 0;
      goto LABEL_13;
    }
    uint64_t v14 = v6;
    v25 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v39 = v25;
    __int16 v40 = 2112;
    id v41 = v5;
    id v16 = v25;
    uint64_t v17 = "[%{public}@] Error fetching count of successful analysis attempts: %@";
    v18 = v14;
    uint32_t v19 = 22;
LABEL_17:
    _os_log_error_impl(&dword_214A6B000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

    goto LABEL_3;
  }
  if (!v4)
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x263F09958];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v14 = v13;
    id v15 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    id v16 = v15;
    uint64_t v17 = "[%{public}@] No analysis has been performed yet; not returning date interval from the most recent analysis.";
    v18 = v14;
    uint32_t v19 = 12;
    goto LABEL_17;
  }
  id v8 = objc_alloc(MEMORY[0x263F0A3B8]);
  v9 = (void *)[v8 initWithFeatureIdentifier:*MEMORY[0x263F097D8] healthStore:self->_healthStore];
  id v36 = 0;
  uint64_t v10 = [v9 featureOnboardingRecordWithError:&v36];
  id v11 = v36;
  if (v11)
  {
    _HKInitializeLogging();
    uint64_t v12 = (void *)*MEMORY[0x263F09958];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v27 = v12;
    v33 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v39 = v33;
    __int16 v40 = 2112;
    id v41 = v11;
    id v29 = v33;
    v30 = "[%{public}@] Unable to fetch onboarding record with error: %@";
    v31 = v27;
    uint32_t v32 = 22;
LABEL_21:
    _os_log_error_impl(&dword_214A6B000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

    goto LABEL_7;
  }
  if (v10)
  {
    v35 = [v10 earliestDateOfAnyOnboardingCompletion];
    v20 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    id v21 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v21, "setDay:", 30 * objc_msgSend(v4, "integerValue") - 30);
    v34 = v20;
    id v22 = [v20 dateByAddingComponents:v21 toDate:v35 options:0];
    objc_msgSend(v21, "setDay:", 30 * objc_msgSend(v4, "integerValue"));
    v23 = [v20 dateByAddingComponents:v21 toDate:v35 options:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v22 endDate:v23];

    goto LABEL_12;
  }
  _HKInitializeLogging();
  v26 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    v28 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v39 = v28;
    id v29 = v28;
    v30 = "[%{public}@] Fetched nil onboarding record; cannot calculate date interval.";
    v31 = v27;
    uint32_t v32 = 12;
    goto LABEL_21;
  }
LABEL_7:
  id v7 = 0;
LABEL_12:

LABEL_13:
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end