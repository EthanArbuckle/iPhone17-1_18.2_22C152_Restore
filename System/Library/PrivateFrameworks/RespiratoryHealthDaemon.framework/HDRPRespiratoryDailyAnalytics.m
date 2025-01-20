@interface HDRPRespiratoryDailyAnalytics
- (BOOL)_hasAnalyticsBeenReportedForToday:(id)a3;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDPeriodicActivity)periodicActivity;
- (HDProfile)profile;
- (HDRPRespiratoryDailyAnalytics)initWithProfile:(id)a3 featureAvailabilityProvider:(id)a4;
- (HKFeatureAvailabilityProviding)featureAvailabilityProvider;
- (OS_dispatch_queue)queue;
- (double)calculationPeriod;
- (double)retryPeriod;
- (id)_settingsWithProfile:(id)a3;
- (int64_t)_gatherAndSendDailyAnalyticsAndReturnError:(id *)a3;
- (void)daemonReady:(id)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)setPeriodicActivity:(id)a3;
@end

@implementation HDRPRespiratoryDailyAnalytics

- (HDRPRespiratoryDailyAnalytics)initWithProfile:(id)a3 featureAvailabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDRPRespiratoryDailyAnalytics;
  v9 = [(HDRPRespiratoryDailyAnalytics *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_featureAvailabilityProvider, a4);
    double v11 = (double)(uint64_t)*MEMORY[0x263EF81F0];
    v10->_calculationPeriod = (double)(uint64_t)*MEMORY[0x263EF8220];
    v10->_retryPeriod = v11;
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = [(HDProfile *)v10->_profile daemon];
    [v14 registerDaemonReadyObserver:v10 queue:v10->_queue];
  }
  return v10;
}

- (void)daemonReady:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F432C8]);
  id v7 = [(HDRPRespiratoryDailyAnalytics *)self profile];
  [(HDRPRespiratoryDailyAnalytics *)self calculationPeriod];
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, @"com.apple.healthd.respiratory.DailyAnalyticsCalculator", self, *MEMORY[0x263F09950]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v4 = (const char *)*MEMORY[0x263EF8180];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x263EF81C0], 14400.0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v8 = 0;
  v5 = (void (**)(id, int64_t, id))a4;
  int64_t v6 = [(HDRPRespiratoryDailyAnalytics *)self _gatherAndSendDailyAnalyticsAndReturnError:&v8];
  id v7 = v8;
  [(HDRPRespiratoryDailyAnalytics *)self retryPeriod];
  v5[2](v5, v6, v7);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (int64_t)_gatherAndSendDailyAnalyticsAndReturnError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF910] now];
  if (([MEMORY[0x263F0A980] isAppleInternalInstall] & 1) == 0
    && [(HDRPRespiratoryDailyAnalytics *)self _hasAnalyticsBeenReportedForToday:v5])
  {
    _HKInitializeLogging();
    int64_t v6 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v41 = (id)objc_opt_class();
      id v8 = v41;
      _os_log_impl(&dword_226AA6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analytics have already been gathered for today.", buf, 0xCu);
    }
LABEL_14:
    int64_t v29 = 1;
    goto LABEL_23;
  }
  if ((AnalyticsIsEventUsed() & 1) == 0)
  {
    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      *(_DWORD *)buf = 138543618;
      id v41 = (id)objc_opt_class();
      __int16 v42 = 2114;
      v43 = @"com.apple.health.respiratory.Daily";
      id v32 = v41;
      _os_log_impl(&dword_226AA6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analytics is disabled for %{public}@, skipping.", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v37 = a3;
  int v9 = HKImproveHealthAndActivityAnalyticsAllowed();
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    double v11 = v10;
    *(_DWORD *)buf = 138543618;
    id v41 = (id)objc_opt_class();
    __int16 v42 = 1024;
    LODWORD(v43) = v9;
    id v12 = v41;
    _os_log_impl(&dword_226AA6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Collecting daily analytics isHealthDataSubmissionAllowed = %d", buf, 0x12u);
  }
  uint64_t v13 = [MEMORY[0x263F57730] sharedInstance];
  v14 = [HDRPDailyAnalyticsReport alloc];
  profile = self->_profile;
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  v17 = [(HDRPRespiratoryDailyAnalytics *)self profile];
  v18 = [(HDRPRespiratoryDailyAnalytics *)self _settingsWithProfile:v17];
  v19 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ControlCenter"];
  LOBYTE(v36) = v9;
  v38 = (void *)v13;
  v20 = [(HDRPDailyAnalyticsReport *)v14 initWithDate:v5 profile:profile pairedDeviceRegistry:v13 featureAvailabilityProvider:featureAvailabilityProvider oxygenSaturationSettings:v18 controlCenterUserDefaults:v19 healthDataCollectionAllowed:v36];

  id v39 = 0;
  v21 = [(HDRPDailyAnalyticsReport *)v20 generatePayloadAndReturnError:&v39];
  id v22 = v39;
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x263F09950];
  v24 = *MEMORY[0x263F09950];
  if (v21)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v23;
      v26 = objc_opt_class();
      id v27 = v26;
      v28 = [v21 allKeys];
      *(_DWORD *)buf = 138543874;
      id v41 = v26;
      __int16 v42 = 2114;
      v43 = @"com.apple.health.respiratory.Daily";
      __int16 v44 = 2114;
      v45 = v28;
      _os_log_impl(&dword_226AA6000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending %{public}@: %{public}@", buf, 0x20u);
    }
    AnalyticsSendEvent();
    int64_t v29 = 0;
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      [(HDRPRespiratoryDailyAnalytics *)v23 _gatherAndSendDailyAnalyticsAndReturnError:(uint64_t)v22];
    }
    id v33 = v22;
    v34 = v33;
    if (v33)
    {
      if (v37) {
        id *v37 = v33;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v29 = 2;
  }

LABEL_23:
  return v29;
}

- (BOOL)_hasAnalyticsBeenReportedForToday:(id)a3
{
  id v4 = a3;
  v5 = [(HDRPRespiratoryDailyAnalytics *)self periodicActivity];
  int64_t v6 = [v5 lastSuccessfulRunDate];

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    char v8 = objc_msgSend(v7, "hk_isDate:withinNumberOfCalendarDays:ofDate:", v6, 0, v4);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_settingsWithProfile:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults", a3);
  id v4 = objc_alloc(MEMORY[0x263F64220]);
  v5 = (void *)[v4 initWithUserDefaultsDomain:*MEMORY[0x263F09F70]];
  int64_t v6 = (void *)[objc_alloc(MEMORY[0x263F64218]) initWithUserDefaults:v3 userDefaultsSyncProvider:v5];

  return v6;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  return self->_featureAvailabilityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)_gatherAndSendDailyAnalyticsAndReturnError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_226AA6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Could not generate analytics report: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end