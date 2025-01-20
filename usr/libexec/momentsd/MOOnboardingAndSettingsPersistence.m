@interface MOOnboardingAndSettingsPersistence
- (BOOL)_getFallbackStateForSetting_postlaunch:(unint64_t)a3;
- (BOOL)_getStateForSetting_postlaunch:(unint64_t)a3;
- (BOOL)_updateCachedRoutineStateWithCurrentTime:(double)a3;
- (BOOL)fetchSignificantLocationEnablementStatus;
- (BOOL)getStateForSettingFast:(unint64_t)a3;
- (BOOL)isAllowedToCollectAndCompute;
- (MOConfigurationManager)configManager;
- (MODaemonUniverse)universe;
- (MODataAccessManager)dataAccessManager;
- (MODefaultsManager)defaultsManager;
- (MOOnboardingAndSettingsPersistence)initWithUniverse:(id)a3;
- (MORoutineServiceManager)routineServiceManager;
- (OS_dispatch_queue)queue;
- (float)maxAllowedDaysForVisitLookback;
- (id)_getSettingKey:(unint64_t)a3;
- (id)_getSettingName:(unint64_t)a3;
- (id)getSnapshotDictionaryForAnalytics;
- (int64_t)_fetchSignificantLocationEnablementStatus;
- (unint64_t)determineOnboardingDurationBinRange;
- (unint64_t)getCollectAndComputeAuthorization;
- (unint64_t)getOnboardingFlowCompletionStatus;
- (unint64_t)getOnboardingFlowRefreshCompletionStatus;
- (void)_onRoutineStateUpdate:(int64_t)a3 error:(id)a4 currentTime:(double)a5 hasTimedout:(BOOL)a6;
- (void)_peopleAwarenessSubscribe:(BOOL)a3;
- (void)determineOnboardingDurationBinRange;
- (void)getCollectAndComputeAuthorization;
- (void)postRefreshTriggerAfterOnboarding;
- (void)postRefreshTriggerAfterSettingChange;
- (void)publishOnboardingStatusAnalytics;
- (void)setConfigManager:(id)a3;
- (void)setDataAccessManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setMaxAllowedDaysForVisitLookback:(float)a3;
- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3;
- (void)setRoutineServiceManager:(id)a3;
- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4;
- (void)setUniverse:(id)a3;
@end

@implementation MOOnboardingAndSettingsPersistence

- (MOOnboardingAndSettingsPersistence)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v5 getService:v10];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v5 getService:v13];

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [v5 getService:v16];

  v36.receiver = self;
  v36.super_class = (Class)MOOnboardingAndSettingsPersistence;
  id v18 = [(MOOnboardingAndSettingsPersistence *)&v36 init];
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("MOOnboardingAndSettingsPersistence.background", v19);
    v21 = (void *)*((void *)v18 + 1);
    *((void *)v18 + 1) = v20;

    objc_storeStrong((id *)v18 + 10, a3);
    objc_storeStrong((id *)v18 + 11, v8);
    objc_storeStrong((id *)v18 + 12, v11);
    objc_storeStrong((id *)v18 + 13, v14);
    objc_storeStrong((id *)v18 + 14, v17);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("MOOnboardingAndSettingsPersistence", v22);
    v24 = (void *)*((void *)v18 + 1);
    *((void *)v18 + 1) = v23;

    *((unsigned char *)v18 + 24) = 0;
    *((void *)v18 + 2) = 0;
    v25 = (void *)*((void *)v18 + 4);
    *((void *)v18 + 4) = 0;

    *((void *)v18 + 5) = 0;
    *((CFAbsoluteTime *)v18 + 6) = CFAbsoluteTimeGetCurrent();
    *((void *)v18 + 7) = 0;
    id v26 = [objc_alloc((Class)RTPeopleDiscoveryServiceConfiguration) initWithAdvertisingCapability:1 serviceLevel:2 observationInterval:2 storageDuration:3 densityCallbackConfiguration:0];
    v27 = (void *)*((void *)v18 + 8);
    *((void *)v18 + 8) = v26;

    v28 = [v18 defaultsManager];
    v29 = [v18 defaultsManager];
    v30 = [v29 objectForKey:@"OnboardingStatus"];
    [v28 setObject:v30 forKey:@"OnboardingRefreshStatus"];

    objc_initWeak(&location, v18);
    v31 = *((void *)v18 + 1);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __55__MOOnboardingAndSettingsPersistence_initWithUniverse___block_invoke;
    v33[3] = &unk_1002CB2B0;
    objc_copyWeak(&v34, &location);
    dispatch_async(v31, v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return (MOOnboardingAndSettingsPersistence *)v18;
}

void __55__MOOnboardingAndSettingsPersistence_initWithUniverse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _peopleAwarenessSubscribe:[WeakRetained getStateForSetting:6]];
}

- (void)_peopleAwarenessSubscribe:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_peopleAwarenessSubscribe", v9, 2u);
  }

  self->_peopleAwarenessRegistrationTrigger = 0;
  v6 = [(MOOnboardingAndSettingsPersistence *)self routineServiceManager];
  v7 = [v6 routineManager];
  v8 = v7;
  if (v3) {
    [v7 startMonitoringForPeopleDiscovery:self->_peopleAwarenessConfiguration handler:&__block_literal_global_46];
  }
  else {
    [v7 stopMonitoringForPeopleDiscoveryWithHandler:&__block_literal_global_179];
  }
}

void __64__MOOnboardingAndSettingsPersistence__peopleAwarenessSubscribe___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  BOOL v3 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"OK";
    if (v2) {
      CFStringRef v4 = (const __CFString *)v2;
    }
    int v5 = 138412290;
    CFStringRef v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "startMonitoringForPeopleDiscovery done, %@", (uint8_t *)&v5, 0xCu);
  }
}

void __64__MOOnboardingAndSettingsPersistence__peopleAwarenessSubscribe___block_invoke_177(id a1, NSError *a2)
{
  v2 = a2;
  BOOL v3 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"OK";
    if (v2) {
      CFStringRef v4 = (const __CFString *)v2;
    }
    int v5 = 138412290;
    CFStringRef v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stopMonitoringForPeopleDiscovery done, %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_getSettingName:(unint64_t)a3
{
  if (a3 > 0xA) {
    return 0;
  }
  else {
    return *(&off_1002D21E8 + a3);
  }
}

- (id)_getSettingKey:(unint64_t)a3
{
  if (a3 > 0xA)
  {
    CFStringRef v4 = 0;
  }
  else
  {
    if (a3 == 7)
    {
      BOOL v3 = -[MOOnboardingAndSettingsPersistence _getSettingName:](self, "_getSettingName:");
      +[NSString stringWithFormat:@"MOSetting%@", v3];
    }
    else
    {
      BOOL v3 = -[MOOnboardingAndSettingsPersistence _getSettingName:](self, "_getSettingName:");
      +[NSString stringWithFormat:@"MOSensedEventCombinedSwitch%@", v3];
    CFStringRef v4 = };
  }

  return v4;
}

- (unint64_t)getOnboardingFlowCompletionStatus
{
  BOOL v3 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "getOnboardingFlowCompletionStatus", v7, 2u);
  }

  CFStringRef v4 = [(MOOnboardingAndSettingsPersistence *)self configManager];
  unint64_t v5 = (int)[v4 getIntegerSettingForKey:@"OnboardingStatus" withFallback:0];

  return v5;
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  unint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v61) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "setOnboardingFlowCompletionStatus", (uint8_t *)&v61, 2u);
  }

  unint64_t v6 = [(MOOnboardingAndSettingsPersistence *)self getOnboardingFlowCompletionStatus];
  if (v6 != a3)
  {
    uint64_t v9 = v6;
    switch(v6)
    {
      case 0uLL:
        if (a3 - 1 < 2) {
          goto LABEL_13;
        }
        goto LABEL_10;
      case 1uLL:
        if (a3 != 2) {
          goto LABEL_10;
        }
        goto LABEL_13;
      case 2uLL:
        if (a3 != 3) {
          goto LABEL_10;
        }
LABEL_13:
        v10 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = +[NSNumber numberWithUnsignedInteger:v9];
          v12 = +[NSNumber numberWithUnsignedInteger:a3];
          int v61 = 138412546;
          *(void *)v62 = v11;
          *(_WORD *)&v62[8] = 2112;
          *(void *)&v62[10] = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Onboarding transtion requested from %@ -> %@", (uint8_t *)&v61, 0x16u);
        }
        v13 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
        v14 = +[NSNumber numberWithUnsignedInteger:a3];
        [v13 setObject:v14 forKey:@"OnboardingStatus"];

        unsigned int v15 = [(MOOnboardingAndSettingsPersistence *)self fetchSignificantLocationEnablementStatus];
        LODWORD(v16) = 14.0;
        [(MOConfigurationManagerBase *)self->_configManager getFloatSettingForKey:@"Visit_PreOnboardingLookBackWindow" withFallback:v16];
        self->_double maxAllowedDaysForVisitLookback = v17;
        id v18 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          double maxAllowedDaysForVisitLookback = self->_maxAllowedDaysForVisitLookback;
          int v61 = 67109376;
          *(_DWORD *)v62 = v15;
          *(_WORD *)&v62[4] = 2048;
          *(double *)&v62[6] = maxAllowedDaysForVisitLookback;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "setOnboardingFlowCompletionStatus,Onboarding, isVisitPreOnboardingEnabled,%d,maxAllowedDaysForVisitLookback,%f", (uint8_t *)&v61, 0x12u);
        }

        if (a3 - 1 <= 1)
        {
          dispatch_queue_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = +[NSNumber numberWithUnsignedInteger:a3];
            int v61 = 138412290;
            *(void *)v62 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Posting onboarding refresh request after transition to %@", (uint8_t *)&v61, 0xCu);
          }
          if (a3 == 2)
          {
            v22 = +[NSDate date];
            dispatch_queue_t v23 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v24 = +[NSDate dateWithTimeInterval:v22 sinceDate:0.0];
            [v23 setObject:v24 forKey:@"OnboardingDate"];

            v25 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            id v26 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            LODWORD(v27) = 1234413568;
            [v26 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowActivity" withFallback:v27];
            v29 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v28];
            [v25 setObject:v29 forKey:@"OnboardingEarliestCollectDateActivity"];

            v30 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v31 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            LODWORD(v32) = 1234413568;
            [v31 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowMedia" withFallback:v32];
            id v34 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v33];
            [v30 setObject:v34 forKey:@"OnboardingEarliestCollectDateMedia"];

            v35 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            objc_super v36 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            LODWORD(v37) = 1234413568;
            [v36 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowCommunication" withFallback:v37];
            v39 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v38];
            [v35 setObject:v39 forKey:@"OnboardingEarliestCollectDateCommunication"];

            v40 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v41 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            LODWORD(v42) = 1234413568;
            [v41 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowPhoto" withFallback:v42];
            v44 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v43];
            [v40 setObject:v44 forKey:@"OnboardingEarliestCollectDatePhoto"];

            v45 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v46 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            v47 = v46;
            double v48 = 0.0;
            if (v15) {
              *(float *)&double v48 = self->_maxAllowedDaysForVisitLookback * 86400.0;
            }
            [v46 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowLocation" withFallback:v48];
            v50 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v49];
            [v45 setObject:v50 forKey:@"OnboardingEarliestCollectDateLocation"];

            v51 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v52 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v52 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowPeople" withFallback:0.0];
            v54 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v53];
            [v51 setObject:v54 forKey:@"OnboardingEarliestCollectDatePeople"];

            v55 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            v56 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            LODWORD(v57) = 1234413568;
            [v56 getFloatSettingForKey:@"OnboardingOverrideLookBackWindowStateOfMind" withFallback:v57];
            v59 = +[NSDate dateWithTimeInterval:v22 sinceDate:(float)-v58];
            [v55 setObject:v59 forKey:@"OnboardingEarliestCollectDateStateOfMind"];
          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.momentsd.onboarding-status-updated", 0, 0, 1u);
          [(MOOnboardingAndSettingsPersistence *)self postRefreshTriggerAfterOnboarding];
        }
        return;
      case 4uLL:
        v7 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[MOOnboardingAndSettingsPersistence setOnboardingFlowCompletionStatus:]();
        }
        goto LABEL_27;
      default:
LABEL_10:
        v7 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          [(MOOnboardingAndSettingsPersistence *)v9 setOnboardingFlowCompletionStatus:v7];
        }
        goto LABEL_27;
    }
  }
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = +[NSNumber numberWithUnsignedInteger:a3];
    int v61 = 138412290;
    *(void *)v62 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No-op onboarding transtion requested with state %@", (uint8_t *)&v61, 0xCu);
  }
LABEL_27:
}

- (unint64_t)getOnboardingFlowRefreshCompletionStatus
{
  v2 = [(MOOnboardingAndSettingsPersistence *)self configManager];
  unint64_t v3 = (int)[v2 getIntegerSettingForKey:@"OnboardingRefreshStatus" withFallback:0];

  return v3;
}

- (void)postRefreshTriggerAfterOnboarding
{
  unint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "postRefreshTriggerAfterOnboarding", buf, 2u);
  }

  unint64_t v5 = [(MOOnboardingAndSettingsPersistence *)self universe];
  unint64_t v6 = [v5 getService:@"DaemonClient"];

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke;
  v9[3] = &unk_1002C9518;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2;
  v5[3] = &unk_1002C9518;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v3 scheduleClientTask:v5 withName:@"onboardingRefresh"];
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Requesting onboarding refresh", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_new();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_271;
  v7[3] = &unk_1002D2108;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 _clearEventsWithContext:v4 andRefreshVariant:256 andHandler:v7];
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_271(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_opt_new();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2_272;
  v6[3] = &unk_1002D2108;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _refreshEventsWithContext:v3 andRefreshVariant:256 andSoftKindFlag:0 andHandler:v6];
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2_272(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_opt_new();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3;
  v6[3] = &unk_1002D2108;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _purgeEventsWithContext:v3 andRefreshVariant:256 andHandler:v6];
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Onboarding refresh completed", v14, 2u);
  }

  [*(id *)(a1 + 32) finalizeClientTaskWithName:@"onboardingRefresh"];
  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 80);
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 getService:v8];

  [v9 registerDefaultRefreshActivity];
  [v9 registerFirstRefreshActivity];
  [v9 registerLightRefreshActivity];
  id v10 = [*(id *)(a1 + 40) getOnboardingFlowCompletionStatus];
  v11 = [*(id *)(a1 + 40) defaultsManager];
  v12 = +[NSNumber numberWithUnsignedInteger:v10];
  [v11 setObject:v12 forKey:@"OnboardingRefreshStatus"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.momentsd.onboarding-status-updated", 0, 0, 1u);
}

- (BOOL)fetchSignificantLocationEnablementStatus
{
  return (id)[(MOOnboardingAndSettingsPersistence *)self _fetchSignificantLocationEnablementStatus] == (id)2;
}

- (int64_t)_fetchSignificantLocationEnablementStatus
{
  double Current = CFAbsoluteTimeGetCurrent();
  int64_t result = self->_cachedRoutineState;
  if (!result
    || ((double v5 = self->_cachedRoutineStateTimestamp, Current >= v5) ? (v6 = Current <= v5 + 10.0) : (v6 = 0), !v6))
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Checking RT state...", buf, 2u);
    }

    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v20 = self->_cachedRoutineState == 0;
      double cachedRoutineStateTimestamp = self->_cachedRoutineStateTimestamp;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)id v26 = v20;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = Current < cachedRoutineStateTimestamp;
      __int16 v27 = 1024;
      BOOL v28 = Current > cachedRoutineStateTimestamp + 10.0;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Conditions for checking RT state: %i,%i,%i", buf, 0x14u);
    }

    uint64_t v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke;
    v22[3] = &unk_1002D2158;
    v22[4] = self;
    double v24 = Current;
    id v10 = v9;
    dispatch_queue_t v23 = v10;
    v11 = objc_retainBlock(v22);
    if (+[MOPlatformInfo isInternalBuild]
      && ([(MOOnboardingAndSettingsPersistence *)self configManager],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 getFloatSettingForKey:@"SettingsOverrideSignificantLocationMasterSwitchRetrievalDelay" withFallback:0.0], float v14 = v13, v12, v14 > 0.0))
    {
      unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)id v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Delaying RT state retrieval by %f seconds...", buf, 0xCu);
      }

      double v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      float v17 = dispatch_queue_create("routineStateRetrievalQueue", v16);

      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(float)(v14 * 1000000000.0));
      dispatch_after(v18, v17, v11);
    }
    else
    {
      ((void (*)(void *))v11[2])(v11);
    }
    dispatch_time_t v19 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v10, v19)) {
      [(MOOnboardingAndSettingsPersistence *)self _onRoutineStateUpdate:0 error:0 currentTime:1 hasTimedout:Current];
    }

    return self->_cachedRoutineState;
  }
  return result;
}

void __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) routineServiceManager];
  id v3 = [v2 routineManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke_2;
  v5[3] = &unk_1002D2130;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v6 = v4;
  [v3 fetchRoutineStateWithHandler:v5];
}

void __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _onRoutineStateUpdate:a2 error:a3 currentTime:0 hasTimedout:*(double *)(a1 + 48)];
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

- (void)_onRoutineStateUpdate:(int64_t)a3 error:(id)a4 currentTime:(double)a5 hasTimedout:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  v11 = self;
  objc_sync_enter(v11);
  if (v6)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      float v13 = +[NSNumber numberWithInteger:a3];
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:](v13, buf, v12);
    }
    goto LABEL_7;
  }
  if (v10)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      float v14 = +[NSNumber numberWithInteger:a3];
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:](v14, (uint64_t)v10, buf, v12);
    }
    goto LABEL_7;
  }
  if (!a3)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      BOOL v20 = +[NSNumber numberWithInteger:0];
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:](v20, buf, v12);
    }
LABEL_7:

    if (!v11->_cachedRoutineState)
    {
      unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)v11 _updateCachedRoutineStateWithCurrentTime:a5];
      if (v6) {
        v11->_double cachedRoutineStateTimestamp = CFAbsoluteTimeGetCurrent();
      }
      if (v15)
      {
LABEL_25:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.momentsd.event-streams-updated", 0, 0, 1u);
        goto LABEL_26;
      }
    }
    goto LABEL_17;
  }
  double v16 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    float v17 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138412546;
    v29 = v17;
    __int16 v30 = 2112;
    uint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received RT state response with state: %@ and error: %@", buf, 0x16u);
  }
  if (v11->_cachedRoutineState != a3)
  {
    v11->_cachedRoutineState = a3;
    v21 = [(MOOnboardingAndSettingsPersistence *)v11 defaultsManager];
    v22 = +[NSNumber numberWithInteger:a3];
    [v21 setObject:v22 forKey:@"SettingsSignificantLocationMasterSwitchCache"];

    dispatch_queue_t v23 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      double v24 = +[NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updated and persisted RT state: %@", buf, 0xCu);
    }
    v11->_double cachedRoutineStateTimestamp = a5;
    goto LABEL_25;
  }
  v11->_double cachedRoutineStateTimestamp = a5;
LABEL_17:
  dispatch_time_t v18 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v19 = +[NSNumber numberWithInteger:v11->_cachedRoutineState];
    int v26 = 138412290;
    __int16 v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Keeping cached RT state: %@", (uint8_t *)&v26, 0xCu);
  }
LABEL_26:
  objc_sync_exit(v11);
}

- (BOOL)_updateCachedRoutineStateWithCurrentTime:(double)a3
{
  double v5 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
  BOOL v6 = [v5 objectForKey:@"SettingsSignificantLocationMasterSwitchCache"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7 = [v6 intValue], uint64_t v8 = v7, (unint64_t)(v7 - 1) <= 1))
  {
    self->_cachedRoutineState = v7;
    self->_double cachedRoutineStateTimestamp = a3;
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = +[NSNumber numberWithInteger:v8];
      int v13 = 138412290;
      float v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieved RT state from storage: %@", (uint8_t *)&v13, 0xCu);
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_getFallbackStateForSetting_postlaunch:(unint64_t)a3
{
  unint64_t v4 = [(MOOnboardingAndSettingsPersistence *)self getOnboardingFlowCompletionStatus];
  unsigned int v5 = (v4 < 4) & (0xCu >> (v4 & 0xF));
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      return v5;
    case 0xAuLL:
      unsigned int v5 = (v4 < 4) & (0xEu >> (v4 & 0xF));
      break;
    default:
      LOBYTE(v5) = 0;
      break;
  }
  return v5;
}

- (BOOL)_getStateForSetting_postlaunch:(unint64_t)a3
{
  if (a3 == 11)
  {
    return [(MOOnboardingAndSettingsPersistence *)self fetchSignificantLocationEnablementStatus];
  }
  else
  {
    unint64_t v4 = a3;
    if (a3 == 8)
    {
      unsigned int v5 = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MOSettingDiscoverableByNearbyContacts is a disabled setting, will read from MOSettingNearbyPeople instead", v10, 2u);
      }

      unint64_t v4 = 6;
    }
    BOOL v6 = [(MOOnboardingAndSettingsPersistence *)self _getSettingKey:v4];
    if (v6)
    {
      signed int v7 = [(MOOnboardingAndSettingsPersistence *)self configManager];
      unsigned int v8 = [v7 getBoolSettingForKey:v6 withFallback:-[MOOnboardingAndSettingsPersistence _getFallbackStateForSetting_postlaunch:](self, "_getFallbackStateForSetting_postlaunch:", v4)];

      if (v4 == 5) {
        v8 &= [(MOOnboardingAndSettingsPersistence *)self fetchSignificantLocationEnablementStatus];
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }

    return v8;
  }
}

- (BOOL)getStateForSettingFast:(unint64_t)a3
{
  if (a3 == 11 || a3 == 5)
  {
    if ([(MOOnboardingAndSettingsPersistence *)self _updateCachedRoutineStateWithCurrentTime:CFAbsoluteTimeGetCurrent()])
    {
      char v5 = self->_cachedRoutineState == 2;
    }
    else
    {
      char v5 = 0;
    }
    if (a3 == 11)
    {
      signed int v7 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = +[NSNumber numberWithInteger:self->_cachedRoutineState];
        *(_DWORD *)buf = 138412290;
        BOOL v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(getStateForSettingFast) returning cached routine state, isRoutineEnabled=%@, triggering background cache refresh", buf, 0xCu);
      }
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke;
      block[3] = &unk_1002C98B8;
      block[4] = self;
      dispatch_async(queue, block);
    }
    else
    {
      id v10 = [(MOOnboardingAndSettingsPersistence *)self _getSettingKey:a3];
      if (v10)
      {
        BOOL v11 = [(MOOnboardingAndSettingsPersistence *)self configManager];
        id v12 = [v11 getBoolSettingForKey:v10 withFallback:-[MOOnboardingAndSettingsPersistence _getFallbackStateForSetting_postlaunch:](self, "_getFallbackStateForSetting_postlaunch:", a3)];

        int v13 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          float v14 = +[NSNumber numberWithInteger:self->_cachedRoutineState];
          unsigned __int8 v15 = +[NSNumber numberWithBool:v12];
          *(_DWORD *)buf = 138412546;
          BOOL v20 = v14;
          __int16 v21 = 2112;
          v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(getStateForSettingFast) returning cached location state, isRoutineEnabled=%@, locationSwitch=%@, triggering background cache refresh", buf, 0x16u);
        }
        double v16 = self->_queue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke_286;
        v17[3] = &unk_1002C98B8;
        v17[4] = self;
        dispatch_async(v16, v17);
        v5 &= v12;
      }
      else
      {
        char v5 = 0;
      }
    }
    return v5;
  }
  else
  {
    return -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:");
  }
}

id __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getStateForSetting:11];
}

id __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke_286(uint64_t a1)
{
  return [*(id *)(a1 + 32) getStateForSetting:11];
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  BOOL v5 = a3;
  signed int v7 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setState", v31, 2u);
  }

  if (a4 == 11)
  {
    unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingAndSettingsPersistence setState:forSetting:]();
    }
  }
  else if (a4 == 8)
  {
    unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingAndSettingsPersistence setState:forSetting:]();
    }
  }
  else
  {
    unsigned int v8 = [(MOOnboardingAndSettingsPersistence *)self _getSettingKey:a4];
    if (v8)
    {
      unsigned int v9 = [(MOOnboardingAndSettingsPersistence *)self getStateForSetting:a4];
      uint64_t v10 = [(MOOnboardingAndSettingsPersistence *)self getOnboardingFlowCompletionStatus];
      BOOL v11 = v9 ^ v5;
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (v9 && !v5) {
          self->_wasAnySetingDisabledAfterOnboarding = 1;
        }
        BOOL v12 = v9 ^ v5;
      }
      else
      {
        BOOL v12 = 0;
      }
      if (a4 != 6) {
        BOOL v11 = 0;
      }
      if (v11)
      {
        int64_t v13 = 1;
        if (!v5) {
          int64_t v13 = -1;
        }
        self->_peopleAwarenessRegistrationTrigger = v13;
      }
      if (v12 && v5)
      {
        float v14 = +[NSDate date];
        switch(a4)
        {
          case 1uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowActivity" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v17];
            CFStringRef v19 = @"OnboardingEarliestCollectDateActivity";
            goto LABEL_36;
          case 2uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowMedia" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v22];
            CFStringRef v19 = @"OnboardingEarliestCollectDateMedia";
            goto LABEL_36;
          case 3uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowCommunication" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v23];
            CFStringRef v19 = @"OnboardingEarliestCollectDateCommunication";
            goto LABEL_36;
          case 4uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowPhoto" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v24];
            CFStringRef v19 = @"OnboardingEarliestCollectDatePhoto";
            goto LABEL_36;
          case 5uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowLocation" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v25];
            CFStringRef v19 = @"OnboardingEarliestCollectDateLocation";
            goto LABEL_36;
          case 6uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowPeople" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v26];
            CFStringRef v19 = @"OnboardingEarliestCollectDatePeople";
            goto LABEL_36;
          case 9uLL:
            unsigned __int8 v15 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
            double v16 = [(MOOnboardingAndSettingsPersistence *)self configManager];
            [v16 getFloatSettingForKey:@"PrivacySettingsOverrideLookBackWindowStateOfMind" withFallback:0.0];
            dispatch_time_t v18 = +[NSDate dateWithTimeInterval:v14 sinceDate:(float)-v27];
            CFStringRef v19 = @"OnboardingEarliestCollectDateStateOfMind";
LABEL_36:
            [v15 setObject:v18 forKey:v19];

            break;
          default:
            break;
        }
      }
      else
      {
        if (!v5)
        {
          switch(a4)
          {
            case 1uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDateActivity";
              goto LABEL_43;
            case 2uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDateMedia";
              goto LABEL_43;
            case 3uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDateCommunication";
              goto LABEL_43;
            case 4uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDatePhoto";
              goto LABEL_43;
            case 5uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDateLocation";
              goto LABEL_43;
            case 6uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDatePeople";
              goto LABEL_43;
            case 9uLL:
              BOOL v20 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
              float v14 = v20;
              CFStringRef v21 = @"OnboardingEarliestCollectDateStateOfMind";
LABEL_43:
              [v20 deleteObjectForKey:v21];
              goto LABEL_44;
            default:
              goto LABEL_45;
          }
        }
        float v14 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[MOOnboardingAndSettingsPersistence setState:forSetting:](a4, v10, v14);
        }
      }
LABEL_44:

LABEL_45:
      BOOL v28 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
      v29 = +[NSNumber numberWithBool:v5];
      [v28 setObject:v29 forKey:v8];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.momentsd.event-streams-updated", 0, 0, 1u);
      [(MOOnboardingAndSettingsPersistence *)self postRefreshTriggerAfterSettingChange];
    }
  }
}

- (void)postRefreshTriggerAfterSettingChange
{
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "postRefreshTriggerAfterSettingChange", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke;
  v14[3] = &unk_1002C98B8;
  v14[4] = self;
  unint64_t v4 = objc_retainBlock(v14);
  BOOL v6 = [(MOOnboardingAndSettingsPersistence *)self universe];
  signed int v7 = [v6 getService:@"DaemonClient"];

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_308;
  v11[3] = &unk_1002CAD38;
  v11[4] = self;
  id v12 = v7;
  unsigned int v9 = v4;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(queue, v11);
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke(uint64_t a1)
{
  int v2 = --*(_DWORD *)(*(void *)(a1 + 32) + 20);
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  unint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 20);
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Settings change transaction release deferred (n=%i transaction holds)", (uint8_t *)v11, 8u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Settings change transaction release complete", (uint8_t *)v11, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    signed int v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    unsigned int v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[7];
    if (v9 == -1)
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (v9 != 1) {
        return;
      }
      uint64_t v10 = 1;
    }
    [v8 _peopleAwarenessSubscribe:v10];
  }
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_308(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 32))
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Settings change detected (first one), taking a transaction", buf, 2u);
    }

    uint64_t v4 = os_transaction_create();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  ++*(_DWORD *)(v2 + 16);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 20);
  signed int v7 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(_DWORD *)(v8 + 16);
    LODWORD(v8) = *(_DWORD *)(v8 + 20);
    *(_DWORD *)buf = 67109632;
    int v17 = v9;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = 0x4024000000000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Settings change detected (n=%i changes, n=%i transaction holds), scheduling refresh in %lf seconds", buf, 0x18u);
  }

  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(NSObject **)(v11 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_310;
  block[3] = &unk_1002CAD38;
  block[4] = v11;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  dispatch_after(v10, v12, block);
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_310(uint64_t a1)
{
  --*(_DWORD *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    id v8 = [*(id *)(a1 + 48) copy];
    dispatch_after(v3, v4, v8);
  }
  else
  {
    if (*(unsigned char *)(v2 + 24))
    {
      [*(id *)(a1 + 40) triggerFeedbackAssistantFlow:@":framework-journalingsuggestions-settings" handler:&__block_literal_global_315];
      *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    }
    uint64_t v5 = *(void **)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_3;
    v9[3] = &unk_1002CAD38;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = *(id *)(a1 + 48);
    [v6 scheduleClientTask:v9 withName:@"settingsChangePurge"];
  }
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Requesting settings change refresh", buf, 2u);
  }

  dispatch_time_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_new();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_316;
  v8[3] = &unk_1002D21A0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v3 _purgeEventsWithContext:v4 andRefreshVariant:336 andHandler:v8];
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_316(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_316_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    uint64_t v11 = 0x4014000000000000;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Settings change refresh completed, scheduling transaction release attempt in %lf seconds", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 32) finalizeClientTaskWithName:@"settingsChangePurge"];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  id v9 = [v7 copy];
  dispatch_after(v6, v8, v9);
}

- (unint64_t)getCollectAndComputeAuthorization
{
  id v3 = [(MOOnboardingAndSettingsPersistence *)self configManager];
  LODWORD(v4) = 1256029184;
  [v3 getFloatSettingForKey:@"ProcessingDurationForApplicationsWithDataAccess" withFallback:v4];
  double v6 = v5;

  uint64_t v7 = [(MOOnboardingAndSettingsPersistence *)self configManager];
  LODWORD(v8) = 1242802176;
  [v7 getFloatSettingForKey:@"ProcessingDurationForClientsWithDataAccess" withFallback:v8];
  double v10 = v9;

  uint64_t v11 = [(MOOnboardingAndSettingsPersistence *)self dataAccessManager];
  unsigned int v12 = [v11 hasAnyApplicationsWithDataAccessWithinTimeInterval:v6];

  id v13 = [(MOOnboardingAndSettingsPersistence *)self dataAccessManager];
  unsigned int v14 = [v13 hasAnyClientsWithDataAccessWithinTimeInterval:v10];

  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization]();
  }

  if (v14)
  {
    double v16 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization]();
    }

    unint64_t v17 = 2;
  }
  else
  {
    if (!v12) {
      goto LABEL_12;
    }
    __int16 v18 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization]();
    }

    unint64_t v19 = [(MOOnboardingAndSettingsPersistence *)self getOnboardingFlowCompletionStatus]- 1;
    if (v19 <= 2) {
      unint64_t v17 = qword_1002BB398[v19];
    }
    else {
LABEL_12:
    }
      unint64_t v17 = 0;
  }
  __int16 v20 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = +[NSNumber numberWithUnsignedInteger:v17];
    int v23 = 138412290;
    float v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Retrieved collect and compute authorization %@", (uint8_t *)&v23, 0xCu);
  }
  return v17;
}

- (BOOL)isAllowedToCollectAndCompute
{
  return [(MOOnboardingAndSettingsPersistence *)self getCollectAndComputeAuthorization] != 0;
}

- (unint64_t)determineOnboardingDurationBinRange
{
  uint64_t v2 = [(MOOnboardingAndSettingsPersistence *)self defaultsManager];
  id v3 = [v2 objectForKey:@"OnboardingDate"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v4 = v3;
    float v5 = +[NSDate date];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;

    if (v7 < 0.0 || v7 > 604800.0)
    {
      if (v7 <= 604800.0 || v7 > 1209600.0)
      {
        if (v7 <= 1209600.0 || v7 > 1814400.0)
        {
          if (v7 <= 1814400.0 || v7 > 2419200.0)
          {
            if (v7 <= 2419200.0 || v7 > 4838400.0)
            {
              if (v7 <= 4838400.0 || v7 > 7257600.0)
              {
                if (v7 <= 7257600.0 || v7 > 9676800.0)
                {
                  if (v7 <= 9676800.0 || v7 > 12096000.0)
                  {
                    if (v7 <= 12096000.0 || v7 > 14515200.0)
                    {
                      if (v7 <= 14515200.0) {
                        unint64_t v8 = 0;
                      }
                      else {
                        unint64_t v8 = 10;
                      }
                    }
                    else
                    {
                      unint64_t v8 = 9;
                    }
                  }
                  else
                  {
                    unint64_t v8 = 8;
                  }
                }
                else
                {
                  unint64_t v8 = 7;
                }
              }
              else
              {
                unint64_t v8 = 6;
              }
            }
            else
            {
              unint64_t v8 = 5;
            }
          }
          else
          {
            unint64_t v8 = 4;
          }
        }
        else
        {
          unint64_t v8 = 3;
        }
      }
      else
      {
        unint64_t v8 = 2;
      }
    }
    else
    {
      unint64_t v8 = 1;
    }
    float v9 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = +[NSNumber numberWithUnsignedInteger:v8];
      uint64_t v11 = +[NSNumber numberWithDouble:v7];
      int v13 = 138412546;
      unsigned int v14 = v10;
      __int16 v15 = 2112;
      double v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Onboarding bin %@, for onboarding time since now: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    double v4 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingAndSettingsPersistence determineOnboardingDurationBinRange]();
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)getSnapshotDictionaryForAnalytics
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  id v3 = [(MOOnboardingAndSettingsPersistence *)self configManager];
  LODWORD(v4) = 1242802176;
  [v3 getFloatSettingForKey:@"AnalyticsOverrideAppUsageLookbackWindow" withFallback:v4];
  float v6 = v5;

  double v7 = [(MOOnboardingAndSettingsPersistence *)self dataAccessManager];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __71__MOOnboardingAndSettingsPersistence_getSnapshotDictionaryForAnalytics__block_invoke;
  v33[3] = &unk_1002D21C8;
  *(double *)&v33[6] = v6;
  void v33[4] = &v38;
  v33[5] = &v34;
  [v7 getApplicationsWithDataAccess:v33];

  id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.journal" allowPlaceholder:0 error:0];
  unint64_t v8 = [(MOOnboardingAndSettingsPersistence *)self universe];
  float v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  double v32 = [v8 getService:v10];

  v42[0] = @"onboardingStatus";
  uint64_t v31 = +[NSNumber numberWithUnsignedInteger:[(MOOnboardingAndSettingsPersistence *)self getOnboardingFlowCompletionStatus]];
  v43[0] = v31;
  v42[1] = @"settingSwitchActivity";
  __int16 v30 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:1]];
  v43[1] = v30;
  v42[2] = @"settingSwitchCommunication";
  v29 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:3]];
  v43[2] = v29;
  v42[3] = @"settingSwitchLocation";
  BOOL v28 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:5]];
  v43[3] = v28;
  v42[4] = @"settingSwitchMedia";
  float v27 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:2]];
  v43[4] = v27;
  v42[5] = @"settingSwitchPeople";
  float v26 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:6]];
  v43[5] = v26;
  v42[6] = @"settingSwitchPhoto";
  float v25 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:4]];
  v43[6] = v25;
  v42[7] = @"settingSwitchStateOfMind";
  float v24 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:9]];
  v43[7] = v24;
  v42[8] = @"settingSwitchReflection";
  float v22 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self getStateForSetting:10]];
  v43[8] = v22;
  v42[9] = @"settingBroaderSwitchLocation";
  uint64_t v11 = +[NSNumber numberWithBool:[(MOOnboardingAndSettingsPersistence *)self fetchSignificantLocationEnablementStatus]];
  v43[9] = v11;
  v42[10] = @"appNotificationsEnabled";
  unsigned int v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 getAppNotificationAuthorizationStatus]);
  v43[10] = v12;
  v42[11] = @"systemNotificationsEnabled";
  int v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 getSystemNotificationAuthorizationStatus]);
  v43[11] = v13;
  v42[12] = @"appIsJournalAppUsed";
  unsigned int v14 = +[NSNumber numberWithBool:*((unsigned __int8 *)v39 + 24)];
  v43[12] = v14;
  v42[13] = @"appOtherJournalAppUsed";
  __int16 v15 = +[NSNumber numberWithUnsignedLong:v35[3]];
  v43[13] = v15;
  v42[14] = @"journalConfigSkipSuggestions";
  double v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[JournalAppSettingsUtilities BOOLForKey:@"SKIP_JOURNALING_SUGGESTIONS"]);
  v43[14] = v16;
  v42[15] = @"journalConfigLockJournal";
  unint64_t v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[JournalAppSettingsUtilities BOOLForKey:@"LOCK_JOURNAL"]);
  v43[15] = v17;
  v42[16] = @"journalIsInstalled";
  __int16 v18 = +[NSNumber numberWithBool:v23 != 0];
  v43[16] = v18;
  v42[17] = @"onboardingDurationBin";
  unint64_t v19 = +[NSNumber numberWithUnsignedInteger:[(MOOnboardingAndSettingsPersistence *)self determineOnboardingDurationBinRange]];
  v43[17] = v19;
  __int16 v20 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:18];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v20;
}

void __71__MOOnboardingAndSettingsPersistence_getSnapshotDictionaryForAnalytics__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  float v6 = v5;
  if (!a3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        double v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
          double Current = CFAbsoluteTimeGetCurrent();
          int v13 = [v6 objectForKey:v11];
          [v13 doubleValue];
          double v15 = Current - v14;
          double v16 = *(double *)(a1 + 48);

          if (v15 < v16)
          {
            if ([v11 isEqualToString:@"com.apple.journal"])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
            }
            else if (([v11 isEqualToString:&stru_1002D2AC8] & 1) == 0)
            {
              ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
            }
          }
          double v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (void)publishOnboardingStatusAnalytics
{
  uint64_t v2 = [(MOOnboardingAndSettingsPersistence *)self getSnapshotDictionaryForAnalytics];
  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412546;
      CFStringRef v5 = @"com.apple.Moments.MOOnboardingStatus";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retrieved and publishing onboarding status for analytics %@ : %@", (uint8_t *)&v4, 0x16u);
    }

    AnalyticsSendEvent();
  }
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

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
}

- (MODataAccessManager)dataAccessManager
{
  return self->_dataAccessManager;
}

- (void)setDataAccessManager:(id)a3
{
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
}

- (float)maxAllowedDaysForVisitLookback
{
  return self->_maxAllowedDaysForVisitLookback;
}

- (void)setMaxAllowedDaysForVisitLookback:(float)a3
{
  self->_double maxAllowedDaysForVisitLookback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataAccessManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_peopleAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_settingsChangeTransaction, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOnboardingFlowCompletionStatus:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  CFStringRef v5 = +[NSNumber numberWithUnsignedInteger:a1];
  __int16 v6 = +[NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_3_7();
  uint64_t v9 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Invalid onboarding transtion requested from %@ -> %@", v8, 0x16u);
}

- (void)setOnboardingFlowCompletionStatus:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Onboarding state unknown, skipping defaults write", v2, v3, v4, v5, v6);
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Onboarding refresh failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)_onRoutineStateUpdate:(os_log_t)log error:currentTime:hasTimedout:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Timedout RT state response with state: %@ and no error", buf, 0xCu);
}

- (void)_onRoutineStateUpdate:(os_log_t)log error:currentTime:hasTimedout:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpected RT state response with state: %@ and no error", buf, 0xCu);
}

- (void)_onRoutineStateUpdate:(void *)a1 error:(uint64_t)a2 currentTime:(uint8_t *)buf hasTimedout:(os_log_t)log .cold.3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received RT state response with state: %@ and error: %@", buf, 0x16u);
}

- (void)setState:(NSObject *)a3 forSetting:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a1];
  uint8_t v6 = +[NSNumber numberWithBool:1];
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_3_7();
  uint64_t v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Trying to set setting %@ to state %@ while onboarding status is %@ - will skip setting earliest start dates until onboarding is completed", v10, 0x20u);
}

- (void)setState:forSetting:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
}

- (void)setState:forSetting:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "MOSettingSystemSignificantLocationReadOnly is read only setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_316_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x4014000000000000;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Settings change refresh failed with error %@, scheduling transaction release attempt in %lf seconds", (uint8_t *)&v2, 0x16u);
}

- (void)getCollectAndComputeAuthorization
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "getCollectAndComputeAuthorization", v2, v3, v4, v5, v6);
}

- (void)determineOnboardingDurationBinRange
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "User onboarding date is nil, keeping duration bin as Unknown", v2, v3, v4, v5, v6);
}

@end