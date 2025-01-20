@interface MOEventRefreshScheduler
- (MOConfigurationManager)configurationManager;
- (MODaemonSPINotifier)notifier;
- (MODaemonUniverse)universe;
- (MODefaultsManager)defaultsManager;
- (MOEventBundleManager)eventBundleManager;
- (MOEventManager)eventManager;
- (MOEventRefreshScheduler)initWithUniverse:(id)a3;
- (MONotificationsManager)notificationsManager;
- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence;
- (OS_dispatch_queue)queue;
- (id)_createWatchDogWithName:(id)a3;
- (void)_collectWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4;
- (void)_computeWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4;
- (void)_dataDumpWithRefreshVariant:(unint64_t)a3 completion:(id)a4;
- (void)_purgeEventsAndBundlesWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4;
- (void)_trendsWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4;
- (void)refreshWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4;
- (void)registerDefaultRefreshActivity;
- (void)registerFirstRefreshActivity;
- (void)registerFirstRefreshActivityWithPreRegisteredTask:(BOOL)a3;
- (void)registerLightRefreshActivity;
- (void)setConfigurationManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setEventBundleManager:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setNotificationsManager:(id)a3;
- (void)setOnboardingAndSettingsPersistence:(id)a3;
- (void)setUniverse:(id)a3;
@end

@implementation MOEventRefreshScheduler

- (MOEventRefreshScheduler)initWithUniverse:(id)a3
{
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id obj = [v6 getService:v8];

  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v6 getService:v10];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v6 getService:v13];

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [v6 getService:v16];

  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v20 = [v6 getService:v19];

  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v6 getService:v22];

  if (!v14)
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient initWithUniverse:]();
    }

    v35 = +[NSAssertionHandler currentHandler];
    v36 = v35;
    CFStringRef v37 = @"Invalid parameter not satisfying: eventManager";
    SEL v38 = a2;
    v39 = self;
    uint64_t v40 = 86;
    goto LABEL_11;
  }
  if (!v17)
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[MOEventRefreshScheduler initWithUniverse:]();
    }

    v35 = +[NSAssertionHandler currentHandler];
    v36 = v35;
    CFStringRef v37 = @"Invalid parameter not satisfying: eventBundleManager";
    SEL v38 = a2;
    v39 = self;
    uint64_t v40 = 87;
LABEL_11:
    [v35 handleFailureInMethod:v38 object:v39 file:@"MOEventRefreshScheduler.m" lineNumber:v40 description:v37];

    v24 = 0;
    goto LABEL_12;
  }
  v44.receiver = self;
  v44.super_class = (Class)MOEventRefreshScheduler;
  v24 = [(MOEventRefreshScheduler *)&v44 init];
  if (!v24)
  {
LABEL_12:
    v30 = obj;
    goto LABEL_13;
  }
  v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v26 = dispatch_queue_create("MOEventRefreshScheduler", v25);
  queue = v24->_queue;
  v24->_queue = (OS_dispatch_queue *)v26;

  objc_storeStrong((id *)&v24->_universe, a3);
  v28 = [[MODaemonSPINotifier alloc] initWithName:@"MOEventRefreshScheduler"];
  notifier = v24->_notifier;
  v24->_notifier = v28;

  v30 = obj;
  objc_storeStrong((id *)&v24->_configurationManager, obj);
  objc_storeStrong((id *)&v24->_defaultsManager, v11);
  objc_storeStrong((id *)&v24->_eventManager, v14);
  objc_storeStrong((id *)&v24->_eventBundleManager, v17);
  objc_storeStrong((id *)&v24->_onboardingAndSettingsPersistence, v20);
  objc_storeStrong((id *)&v24->_notificationsManager, v23);
  LODWORD(v31) = 10.0;
  [(MOConfigurationManagerBase *)v24->_configurationManager getFloatSettingForKey:@"WatchdogOverrideDefaultCadenceInSeconds" withFallback:v31];
  v24->_watchdogCadence = v32;
  defaultRefreshActivity = v24->_defaultRefreshActivity;
  v24->_defaultRefreshActivity = 0;

  [(MOEventRefreshScheduler *)v24 registerDefaultRefreshActivity];
  [(MOEventRefreshScheduler *)v24 registerFirstRefreshActivity];
  [(MOEventRefreshScheduler *)v24 registerLightRefreshActivity];
LABEL_13:

  return v24;
}

- (void)registerDefaultRefreshActivity
{
  if (!self->_defaultRefreshActivity)
  {
    v3 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.momentsd.eventRefresh"];
    defaultRefreshActivity = self->_defaultRefreshActivity;
    self->_defaultRefreshActivity = v3;

    [(NSBackgroundActivityScheduler *)self->_defaultRefreshActivity setPreregistered:1];
  }
  v5 = [(MOEventRefreshScheduler *)self onboardingAndSettingsPersistence];
  unsigned int v6 = [v5 isAllowedToCollectAndCompute];

  v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity com.apple.momentsd.eventRefresh", buf, 2u);
    }

    v9 = self->_defaultRefreshActivity;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke;
    v20 = &unk_1002CF200;
    LOBYTE(v22) = v6;
    v21 = self;
    v10 = &v17;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not allowed to collect and compute, registering empty activity handler for com.apple.momentsd.eventRefresh", buf, 2u);
    }

    v9 = self->_defaultRefreshActivity;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_138;
    v14 = &unk_1002CF200;
    LOBYTE(v16) = 0;
    v15 = self;
    v10 = &v11;
  }
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v9, "scheduleWithBlock:", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh completionHandler with isAllowedToCollectAndCompute=%i", buf, 8u);
  }

  *(void *)buf = 0;
  SEL v38 = buf;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__23;
  v41 = __Block_byref_object_dispose__23;
  id v42 = (id)os_transaction_create();
  unsigned int v6 = [*(id *)(a1 + 32) onboardingAndSettingsPersistence];
  [v6 publishOnboardingStatusAnalytics];

  v7 = +[NSDate distantPast];
  BOOL v8 = [*(id *)(a1 + 32) defaultsManager];
  v9 = [v8 objectForKey:@"EventRefreshSchedulerLastAttemptTriggerDefault"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;

      v7 = v10;
    }
  }
  v11 = +[NSDate date];
  [v11 timeIntervalSinceDate:v7];
  double v13 = v12;
  [*(id *)(*(void *)(a1 + 32) + 16) interval];
  double v15 = v14;
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = +[NSNumber numberWithDouble:v13];
    uint64_t v18 = +[NSNumber numberWithDouble:v15];
    *(_DWORD *)v29 = 138413058;
    v30 = v7;
    __int16 v31 = 2112;
    float v32 = v11;
    __int16 v33 = 2112;
    v34 = v17;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", v29, 0x2Au);
  }
  if (v7 && v13 > 0.0 && v15 > 0.0 && v13 < v15 * 0.9)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_cold_1();
    }

    v3[2](v3, 1);
    v20 = (MOPerformanceMeasurement *)*((void *)v38 + 5);
    *((void *)v38 + 5) = 0;
  }
  else
  {
    v21 = [*(id *)(a1 + 32) defaultsManager];
    [v21 setObject:v11 forKey:@"EventRefreshSchedulerLastAttemptTriggerDefault"];

    uint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0x300uLL, "ScheduledRefreshRegularWrapper", "", v29, 2u);
    }

    v23 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshRegularWrapper" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v23 startSession];
    v24 = [*(id *)(a1 + 32) queue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_128;
    v25[3] = &unk_1002CF1D8;
    v25[4] = *(void *)(a1 + 32);
    v27 = v3;
    v28 = buf;
    dispatch_queue_t v26 = v23;
    v20 = v23;
    dispatch_async(v24, v25);
  }
  _Block_object_dispose(buf, 8);
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_128(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_2;
  v5[3] = &unk_1002CF1B0;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 refreshWithRefreshVariant:768 andCompletion:v5];
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Refresh: All completed with error (%@)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Refresh: All completed!", (uint8_t *)&v12, 2u);
    }

    id v6 = [*(id *)(a1 + 32) defaultsManager];
    id v7 = +[NSDate now];
    [v6 setObject:v7 forKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

    uint64_t v4 = [*(id *)(a1 + 32) defaultsManager];
    uint64_t v8 = +[NSDate now];
    [v4 setObject:v8 forKey:@"EventRefreshSchedulerLastSuccessfulTriggerDefault"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0x300uLL, "ScheduledRefreshRegularWrapper", "", (uint8_t *)&v12, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_138(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh completionHandler with isAllowedToCollectAndCompute=%i", (uint8_t *)v7, 8u);
  }

  id v6 = [*(id *)(a1 + 32) onboardingAndSettingsPersistence];
  [v6 publishOnboardingStatusAnalytics];

  v3[2](v3, 1);
}

- (void)registerFirstRefreshActivity
{
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MOEventRefreshScheduler *)self onboardingAndSettingsPersistence];
  unsigned int v6 = [v5 isAllowedToCollectAndCompute];

  id v7 = [(MOEventRefreshScheduler *)self configurationManager];
  unsigned __int8 v8 = [v7 getBoolSettingForKey:@"EventRefreshSchedulerOverrideForceFullRefreshAtBoot" withFallback:0];

  uint64_t v9 = [(MOEventRefreshScheduler *)self configurationManager];
  unsigned __int8 v10 = [v9 getBoolSettingForKey:@"EventRefreshSchedulerOverrideAvoidFullRefreshAtBoot" withFallback:0];

  v11 = [(MOEventRefreshScheduler *)self configurationManager];
  unsigned __int8 v12 = [v11 getBoolSettingForKey:@"EventRefreshSchedulerOverrideAllowFullRefreshAtBoot" withFallback:1];

  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v40 = @"com.apple.momentsd.eventRefresh.first";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not allowed to collect and compute, retiring activity %@", buf, 0xCu);
    }

    v17 = +[BGSystemTaskScheduler sharedScheduler];
    [v17 deregisterTaskWithIdentifier:@"com.apple.momentsd.eventRefresh.first"];
    goto LABEL_26;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = @"com.apple.momentsd.eventRefresh.first";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity %@", buf, 0xCu);
  }

  double v15 = +[BGSystemTaskScheduler sharedScheduler];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke;
  v34[3] = &unk_1002CF278;
  char v35 = v6;
  unsigned __int8 v36 = v12;
  unsigned __int8 v37 = v10;
  unsigned __int8 v38 = v8;
  v34[4] = self;
  unsigned __int8 v16 = [v15 registerForTaskWithIdentifier:@"com.apple.momentsd.eventRefresh.first" usingQueue:0 launchHandler:v34];

  if (!v3)
  {
    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v40 = @"com.apple.momentsd.eventRefresh.first";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Re-registering %@ activity with high priority", buf, 0xCu);
    }

    v17 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.momentsd.eventRefresh.first"];
    [v17 setRequiresNetworkConnectivity:0];
    [v17 setRequiresExternalPower:0];
    [v17 setRequiresProtectionClass:2];
    [v17 setTrySchedulingBefore:60.0];
    [v17 setPriority:2];
    v19 = +[BGSystemTaskScheduler sharedScheduler];
    v20 = [v19 taskRequestForIdentifier:@"com.apple.momentsd.eventRefresh.first"];

    v21 = +[BGSystemTaskScheduler sharedScheduler];
    uint64_t v22 = v21;
    if (v20)
    {
      id v33 = 0;
      unsigned __int8 v23 = [v21 updateTaskRequest:v17 error:&v33];
      v24 = (__CFString *)v33;

      v25 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      dispatch_queue_t v26 = v25;
      if ((v23 & 1) == 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          [(MOEventRefreshScheduler *)v24 registerFirstRefreshActivityWithPreRegisteredTask:v30];
        }
        goto LABEL_25;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v27 = "Succeeded updating task";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
      }
    }
    else
    {
      id v32 = 0;
      unsigned __int8 v28 = [v21 submitTaskRequest:v17 error:&v32];
      v24 = (__CFString *)v32;

      v29 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      dispatch_queue_t v26 = v29;
      if ((v28 & 1) == 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          [(MOEventRefreshScheduler *)v24 registerFirstRefreshActivityWithPreRegisteredTask:v31];
        }
        goto LABEL_25;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v27 = "Succeeded submitting task";
        goto LABEL_20;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (v16) {
    return;
  }
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = @"com.apple.momentsd.eventRefresh.first";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Re-registering %@ activity failed", buf, 0xCu);
  }
LABEL_26:
}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = @"com.apple.momentsd.eventRefresh.first";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ completionHandler with isAllowedToCollectAndCompute=%i", buf, 0x12u);
  }

  unsigned int v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0x500uLL, "ScheduledRefreshFirstWrapper", "", buf, 2u);
  }

  id v7 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshFirstWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v7 startSession];
  if (+[MOPlatformInfo wasBuildVersionUpdated]
    && *(unsigned char *)(a1 + 41)
    && !*(unsigned char *)(a1 + 42)
    || *(unsigned char *)(a1 + 43))
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__23;
    v51 = __Block_byref_object_dispose__23;
    id v52 = (id)os_transaction_create();
    unsigned __int8 v8 = +[NSDate distantPast];
    uint64_t v9 = [*(id *)(a1 + 32) defaultsManager];
    unsigned __int8 v10 = [v9 objectForKey:@"EventRefreshSchedulerLastAttemptTriggerFirst"];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = v10;

        unsigned __int8 v8 = v11;
      }
    }
    unsigned __int8 v12 = [*(id *)(a1 + 32) configurationManager];
    LODWORD(v13) = -1.0;
    [v12 getFloatSettingForKey:@"EventRefreshSchedulerOverrideOnFailureRetryAfter" withFallback:v13];
    float v15 = v14;

    unsigned __int8 v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:v8];
    double v18 = v17;
    if (v15 >= 0.0) {
      double v19 = v15;
    }
    else {
      double v19 = 3600.0;
    }
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = +[NSNumber numberWithDouble:v18];
      uint64_t v22 = +[NSNumber numberWithDouble:v19];
      *(_DWORD *)v41 = 138413058;
      CFStringRef v42 = v8;
      __int16 v43 = 2112;
      objc_super v44 = v16;
      __int16 v45 = 2112;
      v46 = v21;
      __int16 v47 = 2112;
      v48 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", v41, 0x2Au);
    }
    if (v8 && v18 > 0.0 && v19 > 0.0 && v18 < v19 * 0.9)
    {
      unsigned __int8 v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_cold_1(v23, v24, v25);
      }

      [v3 setTaskCompleted];
      dispatch_queue_t v26 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = 0;

      v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)v41 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", "", v41, 2u);
      }

      [(MOPerformanceMeasurement *)v7 endSession];
      _Block_object_dispose(buf, 8);
    }
    else
    {
      unsigned __int8 v28 = [*(id *)(a1 + 32) defaultsManager];
      [v28 setObject:v16 forKey:@"EventRefreshSchedulerLastAttemptTriggerFirst"];

      v29 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v41 = 138412290;
        CFStringRef v42 = @"com.apple.momentsd.eventRefresh.first";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade", v41, 0xCu);
      }

      uint64_t v30 = [*(id *)(a1 + 32) queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_163;
      block[3] = &unk_1002CF250;
      block[4] = *(void *)(a1 + 32);
      float v40 = v15;
      id v37 = v3;
      uint64_t v39 = buf;
      unsigned __int8 v38 = v7;
      dispatch_async(v30, block);

      _Block_object_dispose(buf, 8);
    }
    goto LABEL_38;
  }
  unsigned __int8 v31 = +[MOPlatformInfo wasBuildVersionUpdated];
  id v32 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      v34 = "Refresh.First: build upgrade was detected but overrides prevent this task to run, skipped!";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v34, buf, 2u);
    }
  }
  else if (v33)
  {
    *(_WORD *)buf = 0;
    v34 = "Refresh.First: no build upgrade detected, skipped!";
    goto LABEL_34;
  }

  [v3 setTaskCompleted];
  char v35 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v7 endSession];
LABEL_38:
}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_163(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = @"com.apple.momentsd.eventRefresh.first";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade, triggering full refresh", buf, 0xCu);
  }

  id v3 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_164;
  v6[3] = &unk_1002CF228;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  int v9 = *(_DWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  [v3 refreshWithRefreshVariant:1280 andCompletion:v6];
}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_164(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    long long v8 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh.First: All completed!", (uint8_t *)&v17, 2u);
    }

    int v9 = [*(id *)(a1 + 32) defaultsManager];
    unsigned __int8 v10 = +[NSDate now];
    [v9 setObject:v10 forKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

    CFStringRef v11 = [*(id *)(a1 + 32) defaultsManager];
    unsigned __int8 v12 = +[NSDate now];
    [v11 setObject:v12 forKey:@"EventRefreshSchedulerLastSuccessfulTriggerFirst"];

    +[MOPlatformInfo persistBuildVersion];
    goto LABEL_9;
  }
  float v4 = *(float *)(a1 + 64);
  long long v5 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 < 0.0)
  {
    if (v6)
    {
      int v17 = 138412290;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refresh.First: Giving up with error (%@)", (uint8_t *)&v17, 0xCu);
    }

LABEL_9:
    [*(id *)(a1 + 40) setTaskCompleted];
    goto LABEL_13;
  }
  if (v6)
  {
    LODWORD(v7) = *(_DWORD *)(a1 + 64);
    double v13 = +[NSNumber numberWithFloat:v7];
    int v17 = 138412546;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refresh.First: Deferred to %@ seconds later with error (%@)", (uint8_t *)&v17, 0x16u);
  }
  [*(id *)(a1 + 40) setTaskExpiredWithRetryAfter:0 error:*(float *)(a1 + 64)];
LABEL_13:
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  float v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  unsigned __int8 v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v16))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "ScheduledRefreshFirstWrapper", "", (uint8_t *)&v17, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

- (void)registerLightRefreshActivity
{
  id v3 = [(MOEventRefreshScheduler *)self onboardingAndSettingsPersistence];
  unsigned int v4 = [v3 isAllowedToCollectAndCompute];

  long long v5 = [(MOEventRefreshScheduler *)self configurationManager];
  unsigned int v6 = [v5 getBoolSettingForKey:@"EventRefreshSchedulerOverrideForceLightRefresh" withFallback:0];

  double v7 = [(MOEventRefreshScheduler *)self configurationManager];
  unsigned int v8 = [v7 getBoolSettingForKey:@"EventRefreshSchedulerOverrideAvoidLightRefresh" withFallback:0];

  if (!v4)
  {
    unsigned __int8 v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v12 = "Not allowed to collect and compute, discarding activity com.apple.momentsd.eventRefresh.light";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
LABEL_11:

    xpc_activity_unregister("com.apple.momentsd.eventRefresh.light");
    return;
  }
  int v9 = v8 ^ 1 | v6;
  unsigned __int8 v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 != 1)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v12 = "Alowed to collect and compute, yet internal configuration requirements are not met, discarding activity com."
            "apple.momentsd.eventRefresh.light";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Allowed to collect and compute, registering activity com.apple.momentsd.eventRefresh.light", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke;
  v13[3] = &unk_1002CF2F0;
  v13[4] = self;
  char v14 = v4;
  xpc_activity_register("com.apple.momentsd.eventRefresh.light", XPC_ACTIVITY_CHECK_IN, v13);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__23;
  id v52 = __Block_byref_object_dispose__23;
  id v53 = (id)os_transaction_create();
  if (xpc_activity_get_state(v3))
  {
    unsigned int v4 = +[NSDate distantPast];
    long long v5 = [*(id *)(a1 + 32) defaultsManager];
    unsigned int v6 = [v5 objectForKey:@"EventRefreshSchedulerLastAttemptTriggerLight"];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;

        unsigned int v4 = v7;
      }
    }
    unsigned int v8 = +[NSDate date];
    [v8 timeIntervalSinceDate:v4];
    double v10 = v9;
    xpc_object_t v11 = xpc_activity_copy_criteria(v3);
    unsigned __int8 v12 = v11;
    if (!v11) {
      __assert_rtn("-[MOEventRefreshScheduler registerLightRefreshActivity]_block_invoke", "MOEventRefreshScheduler.m", 326, "criteria");
    }
    int64_t int64 = xpc_dictionary_get_int64(v11, XPC_ACTIVITY_INTERVAL);
    char v14 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      float v15 = +[NSNumber numberWithDouble:v10];
      unsigned __int8 v16 = +[NSNumber numberWithDouble:(double)int64];
      *(_DWORD *)buf = 138413058;
      *(void *)v55 = v4;
      *(_WORD *)&v55[8] = 2112;
      v56 = v8;
      __int16 v57 = 2112;
      v58 = v15;
      __int16 v59 = 2112;
      v60 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Interval stats since run of same activity: last attempt %@, now %@, interval %@, expected interval %@)", buf, 0x2Au);
    }
    if (v4 && v10 > 0.0 && int64 >= 1 && v10 < (double)int64 * 0.9)
    {
      int v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_2();
      }

      if (xpc_activity_set_state(v3, 5)) {
        goto LABEL_37;
      }
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = +[NSNumber numberWithLong:xpc_activity_get_state(v3)];
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(v19, (uint64_t)buf, v18);
      }
    }
    else
    {
      dispatch_queue_t v26 = [*(id *)(a1 + 32) defaultsManager];
      [v26 setObject:v8 forKey:@"EventRefreshSchedulerLastAttemptTriggerLight"];

      xpc_activity_state_t state = xpc_activity_get_state(v3);
      unsigned __int8 v28 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v55 = state;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)&v55[6] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh.light completionHandler with state=%i, isAllowedToCollectAndCompute=%i", buf, 0xEu);
      }

      if (state == 2)
      {
        uint64_t v30 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        if (os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0x200uLL, "ScheduledRefreshLightWrapper", "", buf, 2u);
        }

        unsigned __int8 v31 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshLightWrapper" measureRecentPeak:0];
        [(MOPerformanceMeasurement *)v31 startSession];
        id v32 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "com.apple.momentsd.eventRefresh.light Triggering light refresh", buf, 2u);
        }

        BOOL v33 = [*(id *)(a1 + 32) queue];
        float v40 = _NSConcreteStackBlock;
        uint64_t v41 = 3221225472;
        CFStringRef v42 = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_195;
        __int16 v43 = &unk_1002CF2C8;
        uint64_t v44 = *(void *)(a1 + 32);
        v34 = v3;
        __int16 v45 = v34;
        __int16 v47 = &v48;
        char v35 = v31;
        v46 = v35;
        dispatch_async(v33, &v40);

        if (xpc_activity_get_state(v34) == 2 && !xpc_activity_set_state(v34, 4))
        {
          unsigned __int8 v36 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            xpc_activity_state_t v37 = xpc_activity_get_state(v34);
            unsigned __int8 v38 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v37, v40, v41, v42, v43, v44, v45);
            __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_3(v38, (uint64_t)buf, v36);
          }
        }
        goto LABEL_38;
      }
      if (xpc_activity_set_state(v3, 5))
      {
LABEL_37:
        char v35 = (MOPerformanceMeasurement *)v49[5];
        v49[5] = 0;
LABEL_38:

        goto LABEL_39;
      }
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = +[NSNumber numberWithLong:xpc_activity_get_state(v3)];
        __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(v39, (uint64_t)buf, v18);
      }
    }

    goto LABEL_37;
  }
  unsigned int v4 = xpc_activity_copy_criteria(v3);
  if (!v4)
  {
    unsigned int v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
    xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v20 = [*(id *)(a1 + 32) configurationManager];
    LODWORD(v21) = 1163984896;
    [v20 getFloatSettingForKey:@"EventRefreshSchedulerOverrideLightRefreshInterval" withFallback:v21];
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, (uint64_t)v22);

    unsigned __int8 v23 = [*(id *)(a1 + 32) configurationManager];
    LODWORD(v24) = 1150681088;
    [v23 getFloatSettingForKey:@"EventRefreshSchedulerOverrideLightRefreshGracePeriod" withFallback:v24];
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)v25);

    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_activity_set_criteria(v3, v4);
  }
LABEL_39:

  _Block_object_dispose(&v48, 8);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_195(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_2;
  v5[3] = &unk_1002CF2A0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  [v2 refreshWithRefreshVariant:512 andCompletion:v5];
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = [*(id *)(a1 + 32) configurationManager];
    LODWORD(v5) = -1.0;
    [v4 getFloatSettingForKey:@"EventRefreshSchedulerOverrideOnFailureRetryAfter" withFallback:v5];
    float v7 = v6;

    unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7 >= 0.0)
    {
      if (v9)
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh.Light: Deferred with error (%@)", (uint8_t *)&v21, 0xCu);
      }

      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
      {
        double v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          xpc_object_t v11 = +[NSNumber numberWithLong:xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40))];
          int v21 = 138412290;
          id v22 = v11;
          unsigned __int8 v12 = "com.apple.momentsd.eventRefresh.light Failed to mark activity as Deferred. Current state is %@";
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh.Light: Giving up with error (%@)", (uint8_t *)&v21, 0xCu);
      }

      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
      {
        double v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
LABEL_7:
          xpc_object_t v11 = +[NSNumber numberWithLong:xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40))];
          int v21 = 138412290;
          id v22 = v11;
          unsigned __int8 v12 = "com.apple.momentsd.eventRefresh.light Failed to mark activity as Done. Current state is %@";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 0xCu);
        }
LABEL_19:
      }
    }
  }
  else
  {
    double v13 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Refresh.Light: All completed!", (uint8_t *)&v21, 2u);
    }

    char v14 = [*(id *)(a1 + 32) defaultsManager];
    float v15 = +[NSDate now];
    [v14 setObject:v15 forKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

    unsigned __int8 v16 = [*(id *)(a1 + 32) defaultsManager];
    int v17 = +[NSDate now];
    [v16 setObject:v17 forKey:@"EventRefreshSchedulerLastSuccessfulTriggerLight"];

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      double v10 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0;

  id v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v20))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0x200uLL, "ScheduledRefreshLightWrapper", "", (uint8_t *)&v21, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

- (void)refreshWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6 = a4;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__23;
  v61[4] = __Block_byref_object_dispose__23;
  id v62 = 0;
  float v7 = [(MOEventRefreshScheduler *)self universe];
  unsigned int v8 = [v7 getService:@"DaemonClient"];

  BOOL v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v10 = v9;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134349056;
    unint64_t v66 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, a3, "momentsd_ScheduledRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", buf, 0xCu);
  }

  xpc_object_t v11 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefresh" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v11 startSession];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke;
  v55[3] = &unk_1002CF318;
  unint64_t v60 = a3;
  v58 = (void (**)(id, NSObject *))v6;
  __int16 v59 = v61;
  int v29 = v58;
  v55[4] = self;
  id v12 = v8;
  id v56 = v12;
  v27 = v11;
  __int16 v57 = v27;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_209;
  v52[3] = &unk_1002CDCB0;
  unint64_t v54 = a3;
  v52[4] = self;
  unsigned __int8 v28 = objc_retainBlock(v55);
  id v53 = v28;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_214;
  v48[3] = &unk_1002CF368;
  v48[4] = self;
  uint64_t v50 = v61;
  unint64_t v51 = a3;
  double v13 = objc_retainBlock(v52);
  id v49 = v13;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_219;
  v43[3] = &unk_1002CF3B8;
  v46 = v61;
  unint64_t v47 = a3;
  v43[4] = self;
  char v14 = objc_retainBlock(v48);
  id v44 = v14;
  float v15 = v13;
  id v45 = v15;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_224;
  v39[3] = &unk_1002CF368;
  v39[4] = self;
  uint64_t v41 = v61;
  unint64_t v42 = a3;
  unsigned __int8 v16 = objc_retainBlock(v43);
  id v40 = v16;
  int v17 = objc_retainBlock(v39);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_229;
  v34[3] = &unk_1002CF3B8;
  xpc_activity_state_t v37 = v61;
  unint64_t v38 = a3;
  v34[4] = self;
  uint64_t v18 = v15;
  id v35 = v18;
  __int16 v19 = v17;
  id v36 = v19;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_234;
  v30[3] = &unk_1002CF368;
  v30[4] = self;
  id v32 = v61;
  unint64_t v33 = a3;
  id v20 = objc_retainBlock(v34);
  id v31 = v20;
  int v21 = objc_retainBlock(v30);
  if ([v12 acquireRefreshLock])
  {
    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Refresh: RefreshLock is acquired. Running refresh.", buf, 2u);
    }

    unsigned __int8 v23 = [(MOEventRefreshScheduler *)self queue];
    dispatch_async(v23, v21);
    goto LABEL_12;
  }
  double v24 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[MOEventRefreshScheduler refreshWithRefreshVariant:andCompletion:]();
  }

  if (v29)
  {
    id v25 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
    CFStringRef v64 = @"The refresh is dropped due to an existing refresh.";
    dispatch_queue_t v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1, v27, v28);
    unsigned __int8 v23 = [v25 initWithDomain:@"MOEventRefreshSchduler" code:0 userInfo:v26];

    v29[2](v29, v23);
LABEL_12:
  }
  _Block_object_dispose(v61, 8);
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshCompletion", "", (uint8_t *)&v15, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshCompletion" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  float v7 = [*(id *)(a1 + 32) eventManager];
  [v7 clearCache];

  [*(id *)(a1 + 40) releaseRefreshLock];
  unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh: RefreshLock is released", (uint8_t *)&v15, 2u);
  }

  BOOL v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "ScheduledRefreshCompletion", "", (uint8_t *)&v15, 2u);
  }

  [(MOPerformanceMeasurement *)v5 endSession];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 72);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v15 = 134349056;
    os_signpost_id_t v16 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "momentsd_ScheduledRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v15, 0xCu);
  }

  [*(id *)(a1 + 48) endSession];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_209(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshNotificationService", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshNotificationService" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  uint64_t v6 = [*(id *)(a1 + 32) notificationsManager];
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_213;
  double v13 = &unk_1002CDC88;
  uint64_t v7 = *(void *)(a1 + 48);
  os_signpost_id_t v14 = v5;
  uint64_t v15 = v7;
  unsigned int v8 = v5;
  [v6 serviceSuggestionsNotificationsWithHandler:&v10];

  BOOL v9 = [*(id *)(a1 + 32) queue:v10, v11, v12, v13];
  dispatch_async(v9, *(dispatch_block_t *)(a1 + 40));
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_213(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ScheduledRefreshNotificationService", "", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v8, 0xCu);
  }
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_214(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshDataDump", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshDataDump" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_218;
  v11[3] = &unk_1002CF340;
  uint64_t v15 = v7;
  id v12 = v5;
  double v13 = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v14 = v10;
  id v9 = v5;
  [v6 _dataDumpWithRefreshVariant:v7 completion:v11];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_218(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ScheduledRefreshDataDump", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  id v12 = [*(id *)(a1 + 40) queue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 48));
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_219(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshBundleEvents", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshBundleEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_223;
  v9[3] = &unk_1002CF390;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = v7;
  long long v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  [v6 _computeWithRefreshVariant:v7 andCompletion:v9];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_223(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v14[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ScheduledRefreshBundleEvents", "", (uint8_t *)v14, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) || *(void *)(a1 + 72) != 768)
  {
    id v12 = [*(id *)(a1 + 40) queue];
    id v13 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    id v12 = [*(id *)(a1 + 40) queue];
    id v13 = (dispatch_block_t *)(a1 + 48);
  }
  dispatch_async(v12, *v13);
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_224(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshAnalytics", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshAnalytics" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_228;
  v11[3] = &unk_1002CF340;
  uint64_t v15 = v7;
  id v12 = v5;
  id v13 = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v14 = v10;
  id v9 = v5;
  [v6 _trendsWithRefreshVariant:v7 andCompletion:v11];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_228(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ScheduledRefreshAnalytics", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  id v12 = [*(id *)(a1 + 40) queue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 48));
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_229(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshCollect", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshCollect" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_233;
  v9[3] = &unk_1002CF390;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = v7;
  long long v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  [v6 _collectWithRefreshVariant:v7 andCompletion:v9];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_233(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v18[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "ScheduledRefreshCollect", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v11 = *(void **)(v8 + 40);
  id v9 = (id *)(v8 + 40);
  long long v10 = v11;
  if (v11) {
    id v12 = v10;
  }
  else {
    id v12 = v4;
  }
  objc_storeStrong(v9, v12);
  if (v4
    && (([v4 code] & 0x400) != 0 || objc_msgSend(v4, "code") == (id)22)
    && ([v4 domain],
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == @"MOErrorDomain"))
  {
    os_signpost_id_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_233_cold_1((uint64_t)v4, v16, v17);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    uint64_t v14 = [*(id *)(a1 + 40) queue];
    uint64_t v15 = (dispatch_block_t *)(a1 + 48);
  }
  else
  {
    uint64_t v14 = [*(id *)(a1 + 40) queue];
    uint64_t v15 = (dispatch_block_t *)(a1 + 56);
  }
  dispatch_async(v14, *v15);
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_234(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ScheduledRefreshPurge", "", buf, 2u);
  }

  double v5 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshPurge" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_238;
  v11[3] = &unk_1002CF340;
  uint64_t v15 = v7;
  id v12 = v5;
  id v13 = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v14 = v10;
  id v9 = v5;
  [v6 _purgeEventsAndBundlesWithRefreshVariant:v7 andCompletion:v11];
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_238(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  double v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ScheduledRefreshPurge", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  id v12 = [*(id *)(a1 + 40) queue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 48));
}

- (void)_purgeEventsAndBundlesWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MOEventRefreshScheduler *)self _createWatchDogWithName:@"RefreshPurge"];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__23;
  v22[4] = __Block_byref_object_dispose__23;
  id v23 = 0;
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Refresh: Calling purge events", buf, 2u);
  }

  long long v10 = [(MOEventRefreshScheduler *)self eventManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke;
  v14[3] = &unk_1002CF408;
  id v11 = v7;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  uint64_t v17 = self;
  __int16 v19 = v22;
  unint64_t v20 = a3;
  id v13 = v6;
  id v18 = v13;
  [v10 cleanUpEventsWithRefreshVariant:a3 andHandler:v14];

  _Block_object_dispose(v22, 8);
}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  [v7 pet];
  [*(id *)(a1 + 40) addEntriesFromDictionary:v8];

  if (v6)
  {
    [*(id *)(a1 + 40) setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  }
  id v9 = [*(id *)(a1 + 48) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_2;
  block[3] = &unk_1002CDD78;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 72);
  id v17 = v10;
  uint64_t v20 = v11;
  int8x16_t v14 = *(int8x16_t *)(a1 + 40);
  id v12 = (id)v14.i64[0];
  int8x16_t v18 = vextq_s8(v14, v14, 8uLL);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v13 = (id)v15;
  long long v19 = v15;
  dispatch_async(v9, block);
}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) pet];
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Refresh: Calling purge bundles", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 40) eventBundleManager];
  uint64_t v4 = *(void *)(a1 + 72);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_251;
  v9[3] = &unk_1002CF3E0;
  id v10 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v8;
  long long v13 = v8;
  [v3 cleanUpEventBundlesWithRefreshVariant:v4 andHandler:v9];
}

void __82__MOEventRefreshScheduler__purgeEventsAndBundlesWithRefreshVariant_andCompletion___block_invoke_251(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 pet];
  [*(id *)(a1 + 40) addEntriesFromDictionary:v6];

  if (v13)
  {
    [*(id *)(a1 + 40) setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v7 + 40);
    long long v8 = (id *)(v7 + 40);
    id v9 = v10;
    id v11 = v13;
    if (v10) {
      id v11 = v9;
    }
    objc_storeStrong(v8, v11);
  }
  [*(id *)(a1 + 40) setObject:@"launchd" forKey:@"triggerSource"];
  uint64_t v12 = [*(id *)(a1 + 48) notifier];
  [v12 sendNotification:4 withPayload:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_collectWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Refresh: Calling collect", buf, 2u);
  }

  long long v8 = [(MOEventRefreshScheduler *)self _createWatchDogWithName:@"RefreshCollect"];
  id v9 = [(MOEventRefreshScheduler *)self eventManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __68__MOEventRefreshScheduler__collectWithRefreshVariant_andCompletion___block_invoke;
  v12[3] = &unk_1002CE280;
  id v13 = v8;
  int8x16_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 collectEventsWithRefreshVariant:a3 andHandler:v12];
}

void __68__MOEventRefreshScheduler__collectWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 pet];
  id v9 = [v6 mutableCopy];

  if (v7) {
    [v9 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  [v9 setObject:@"launchd" forKey:@"triggerSource"];
  long long v8 = [*(id *)(a1 + 40) notifier];
  [v8 sendNotification:2 withPayload:v9];

  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_trendsWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Refresh: Calling trends", buf, 2u);
  }

  long long v8 = [(MOEventRefreshScheduler *)self _createWatchDogWithName:@"RefreshTrends"];
  id v9 = [(MOEventRefreshScheduler *)self eventManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __67__MOEventRefreshScheduler__trendsWithRefreshVariant_andCompletion___block_invoke;
  v12[3] = &unk_1002CE280;
  id v13 = v8;
  int8x16_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 runAnalyticsWithRefreshVariant:a3 andHandler:v12];
}

void __67__MOEventRefreshScheduler__trendsWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 pet];
  id v9 = [v6 mutableCopy];

  if (v7) {
    [v9 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  [v9 setObject:@"launchd" forKey:@"triggerSource"];
  long long v8 = [*(id *)(a1 + 40) notifier];
  [v8 sendNotification:5 withPayload:v9];

  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_computeWithRefreshVariant:(unint64_t)a3 andCompletion:(id)a4
{
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Refresh: Calling compute", buf, 2u);
  }

  long long v8 = [(MOEventRefreshScheduler *)self _createWatchDogWithName:@"RefreshCompute"];
  id v9 = [(MOEventRefreshScheduler *)self eventBundleManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __68__MOEventRefreshScheduler__computeWithRefreshVariant_andCompletion___block_invoke;
  v12[3] = &unk_1002CE280;
  id v13 = v8;
  int8x16_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 bundleEventsWithRefreshVariant:a3 andHandler:v12];
}

void __68__MOEventRefreshScheduler__computeWithRefreshVariant_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 pet];
  id v9 = [v6 mutableCopy];

  if (v7) {
    [v9 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  [v9 setObject:@"launchd" forKey:@"triggerSource"];
  long long v8 = [*(id *)(a1 + 40) notifier];
  [v8 sendNotification:3 withPayload:v9];

  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_dataDumpWithRefreshVariant:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshScheduler);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Refresh: dataDumpWithCompletion", buf, 2u);
  }

  long long v8 = [(MOEventRefreshScheduler *)self _createWatchDogWithName:@"DataDump"];
  id v9 = objc_opt_new();
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  id v11 = [v10 stringValue];
  [v9 setObject:v11 forKey:@"kMORefreshVariant"];

  uint64_t v12 = [&off_1002F5F18 stringValue];
  [v9 setObject:v12 forKey:@"kMORefreshSource"];

  id v13 = [(MOEventRefreshScheduler *)self eventBundleManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __66__MOEventRefreshScheduler__dataDumpWithRefreshVariant_completion___block_invoke;
  v16[3] = &unk_1002CACE8;
  id v17 = v8;
  id v18 = v6;
  id v14 = v6;
  id v15 = v8;
  [v13 captureCurrentDBStateForTrigger:2 withFeedback:0 additionalMetadata:v9 shouldUpload:1 andHandler:v16];
}

void __66__MOEventRefreshScheduler__dataDumpWithRefreshVariant_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 pet];
  id v7 = [v6 objectForKey:@"kMODataDumpEnabled"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) cancel];
}

- (id)_createWatchDogWithName:(id)a3
{
  configurationManager = self->_configurationManager;
  id v5 = a3;
  id v6 = +[NSString stringWithFormat:@"%@_%@", @"WatchdogOverrideDefaultCadenceInSeconds", v5];
  *(float *)&double v7 = self->_watchdogCadence;
  [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v6 withFallback:v7];
  int v9 = v8;

  id v10 = [MOWatchDog alloc];
  LODWORD(v11) = v9;
  uint64_t v12 = [(MOWatchDog *)v10 initWithName:v5 cadenceInSeconds:0 andHandler:v11];

  return v12;
}

- (MODaemonSPINotifier)notifier
{
  return self->_notifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (void)setOnboardingAndSettingsPersistence:(id)a3
{
}

- (MONotificationsManager)notificationsManager
{
  return self->_notificationsManager;
}

- (void)setNotificationsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifier, 0);

  objc_storeStrong((id *)&self->_defaultRefreshActivity, 0);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundleManager", v2, v3, v4, v5, v6);
}

void __57__MOEventRefreshScheduler_registerDefaultRefreshActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Activity was run recently; giving up on com.apple.momentsd.eventRefresh",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(uint64_t)a3 .cold.1(const __CFString *a1, NSObject *a2, uint64_t a3)
{
  CFStringRef v3 = @"Unknown";
  if (a1) {
    CFStringRef v3 = a1;
  }
  int v4 = 138412290;
  CFStringRef v5 = v3;
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, a3, "Failed to submit task with error: %@", (uint8_t *)&v4);
}

- (void)registerFirstRefreshActivityWithPreRegisteredTask:(uint64_t)a3 .cold.2(const __CFString *a1, NSObject *a2, uint64_t a3)
{
  CFStringRef v3 = @"Unknown";
  if (a1) {
    CFStringRef v3 = a1;
  }
  int v4 = 138412290;
  CFStringRef v5 = v3;
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, a3, "Failed to update task with error: %@", (uint8_t *)&v4);
}

void __77__MOEventRefreshScheduler_registerFirstRefreshActivityWithPreRegisteredTask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  CFStringRef v4 = @"com.apple.momentsd.eventRefresh.first";
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a1, a3, "Activity was run recently; giving up on %@",
    (uint8_t *)&v3);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a3, (uint64_t)a3, "com.apple.momentsd.eventRefresh.light Failed to mark activity as Done. Current state is %@", (uint8_t *)a2);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Activity was run recently; giving up on com.apple.momentsd.eventRefresh.light",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __55__MOEventRefreshScheduler_registerLightRefreshActivity__block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a3, (uint64_t)a3, "com.apple.momentsd.eventRefresh.light Failed to mark activity as Continue. Current state is %@", (uint8_t *)a2);
}

- (void)refreshWithRefreshVariant:andCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Refresh: RefreshLock is in use. Exiting early due to exiting refresh", v2, v3, v4, v5, v6);
}

void __67__MOEventRefreshScheduler_refreshWithRefreshVariant_andCompletion___block_invoke_233_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, a3, "Refresh: Exiting early due to errors in collect: %@", (uint8_t *)&v3);
}

@end