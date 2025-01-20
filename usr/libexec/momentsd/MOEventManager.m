@interface MOEventManager
- (MOConfigurationManager)configurationManager;
- (MODefaultsManager)defaultsManager;
- (MOEventBundleStore)eventBundleStore;
- (MOEventManager)initWithUniverse:(id)a3;
- (MOEventPatternManager)patternManager;
- (MOEventStore)eventStore;
- (MOHealthKitManager)healthKitManager;
- (MOLifeEventManager)lifeEventManager;
- (MOMotionManager)motionManager;
- (MONowPlayingMediaManager)nowPlayingMediaManager;
- (MOPeopleDiscoveryManager)peopleDiscoveryManager;
- (MOPhotoManager)photoManager;
- (MOProactiveTravelManager)proactiveTravelManager;
- (MORoutineServiceManager)routineServiceManager;
- (MOSharedWithYouManager)sharedWithYouManager;
- (MOSignificantContactManager)significantContactManager;
- (MOSuggestedEventManager)suggestedEventManager;
- (MOWeatherManager)weatherManager;
- (NSArray)cachedEvents;
- (NSDate)cacheEndDate;
- (NSDate)cacheStartDate;
- (OS_dispatch_queue)queue;
- (id)_getEarliestDateForCategory_postlaunch:(unint64_t)a3;
- (id)_getEarliestDateForCategory_prelaunch:(unint64_t)a3;
- (id)mergeEventArraysFromDict:(id)a3;
- (id)splitEventArrayByCategory:(id)a3;
- (void)_cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)_clearEvents;
- (void)_collectCompleteEventsBetweenStartDate:(id)a3 endDate:(id)a4 refreshVariant:(unint64_t)a5 withStoredEvents:(id)a6 handler:(id)a7;
- (void)_collectEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)_fetchEventsFromCacheWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchEventsFromDBAndRehydrateEventsWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)_rehydrateEvents:(id)a3 withHandler:(id)a4;
- (void)_rehydrateEventsBySingleSource:(id)a3 handler:(id)a4;
- (void)_updateEventsDeletedAtSingleSource:(id)a3 handler:(id)a4;
- (void)_updateEventsDeletedAtSources:(id)a3;
- (void)cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)clearCache;
- (void)clearEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)rehydrateEvents:(id)a3 withHandler:(id)a4;
- (void)runAnalyticsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)setCacheEndDate:(id)a3;
- (void)setCacheStartDate:(id)a3;
- (void)setCachedEvents:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setEventBundleStore:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setLifeEventManager:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setNowPlayingMediaManager:(id)a3;
- (void)setPatternManager:(id)a3;
- (void)setPeopleDiscoveryManager:(id)a3;
- (void)setPhotoManager:(id)a3;
- (void)setProactiveTravelManager:(id)a3;
- (void)setRoutineServiceManager:(id)a3;
- (void)setSharedWithYouManager:(id)a3;
- (void)setSignificantContactManager:(id)a3;
- (void)setSuggestedEventManager:(id)a3;
- (void)setWeatherManager:(id)a3;
- (void)storeEvents:(id)a3 handler:(id)a4;
@end

@implementation MOEventManager

- (MOEventManager)initWithUniverse:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (OS_dispatch_queue *)dispatch_queue_create("collect", v7);
  collectQueue = self->collectQueue;
  self->collectQueue = v8;

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v6 getService:v11];

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [v6 getService:v14];

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [v6 getService:v17];

  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  v21 = [v6 getService:v20];

  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v24 = [v6 getService:v23];

  if (!v18)
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager initWithUniverse:]();
    }

    v31 = +[NSAssertionHandler currentHandler];
    v32 = v31;
    CFStringRef v33 = @"Invalid parameter not satisfying: eventStore";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 118;
    goto LABEL_20;
  }
  if (!v12)
  {
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager initWithUniverse:]();
    }

    v31 = +[NSAssertionHandler currentHandler];
    v32 = v31;
    CFStringRef v33 = @"Invalid parameter not satisfying: defaultsManager";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 120;
    goto LABEL_20;
  }
  if (!v15)
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v31 = +[NSAssertionHandler currentHandler];
    v32 = v31;
    CFStringRef v33 = @"Invalid parameter not satisfying: configurationManager";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 121;
    goto LABEL_20;
  }
  if (!v24)
  {
    v39 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager initWithUniverse:].cold.4();
    }

    v31 = +[NSAssertionHandler currentHandler];
    v32 = v31;
    CFStringRef v33 = @"Invalid parameter not satisfying: patternManager";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 122;
LABEL_20:
    [v31 handleFailureInMethod:v34 object:v35 file:@"MOEventManager.m" lineNumber:v36 description:v33];

    v29 = 0;
    goto LABEL_21;
  }
  v41.receiver = self;
  v41.super_class = (Class)MOEventManager;
  v25 = [(MOEventManager *)&v41 init];
  if (v25)
  {
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("MOEventManager", v26);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v27;

    objc_storeStrong((id *)&v25->_defaultsManager, v12);
    objc_storeStrong((id *)&v25->_eventStore, v18);
    objc_storeStrong((id *)&v25->_configurationManager, v15);
    objc_storeStrong((id *)&v25->_patternManager, v24);
    objc_storeStrong((id *)&v25->_eventBundleStore, v21);
  }
  self = v25;
  v29 = self;
LABEL_21:

  return v29;
}

- (MOPhotoManager)photoManager
{
  photoManager = self->_photoManager;
  if (!photoManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_photoManager;
    self->_photoManager = v7;

    photoManager = self->_photoManager;
  }

  return photoManager;
}

- (MORoutineServiceManager)routineServiceManager
{
  routineServiceManager = self->_routineServiceManager;
  if (!routineServiceManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_routineServiceManager;
    self->_routineServiceManager = v7;

    routineServiceManager = self->_routineServiceManager;
  }

  return routineServiceManager;
}

- (MOHealthKitManager)healthKitManager
{
  healthKitManager = self->_healthKitManager;
  if (!healthKitManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_healthKitManager;
    self->_healthKitManager = v7;

    healthKitManager = self->_healthKitManager;
  }

  return healthKitManager;
}

- (MOSharedWithYouManager)sharedWithYouManager
{
  sharedWithYouManager = self->_sharedWithYouManager;
  if (!sharedWithYouManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_sharedWithYouManager;
    self->_sharedWithYouManager = v7;

    sharedWithYouManager = self->_sharedWithYouManager;
  }

  return sharedWithYouManager;
}

- (MOSuggestedEventManager)suggestedEventManager
{
  suggestedEventManager = self->_suggestedEventManager;
  if (!suggestedEventManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_suggestedEventManager;
    self->_suggestedEventManager = v7;

    suggestedEventManager = self->_suggestedEventManager;
  }

  return suggestedEventManager;
}

- (MOProactiveTravelManager)proactiveTravelManager
{
  proactiveTravelManager = self->_proactiveTravelManager;
  if (!proactiveTravelManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_proactiveTravelManager;
    self->_proactiveTravelManager = v7;

    proactiveTravelManager = self->_proactiveTravelManager;
  }

  return proactiveTravelManager;
}

- (MONowPlayingMediaManager)nowPlayingMediaManager
{
  nowPlayingMediaManager = self->_nowPlayingMediaManager;
  if (!nowPlayingMediaManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_nowPlayingMediaManager;
    self->_nowPlayingMediaManager = v7;

    nowPlayingMediaManager = self->_nowPlayingMediaManager;
  }

  return nowPlayingMediaManager;
}

- (MOSignificantContactManager)significantContactManager
{
  significantContactManager = self->_significantContactManager;
  if (!significantContactManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_significantContactManager;
    self->_significantContactManager = v7;

    significantContactManager = self->_significantContactManager;
  }

  return significantContactManager;
}

- (MOPeopleDiscoveryManager)peopleDiscoveryManager
{
  peopleDiscoveryManager = self->_peopleDiscoveryManager;
  if (!peopleDiscoveryManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_peopleDiscoveryManager;
    self->_peopleDiscoveryManager = v7;

    peopleDiscoveryManager = self->_peopleDiscoveryManager;
  }

  return peopleDiscoveryManager;
}

- (MOWeatherManager)weatherManager
{
  weatherManager = self->_weatherManager;
  if (!weatherManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_weatherManager;
    self->_weatherManager = v7;

    weatherManager = self->_weatherManager;
  }

  return weatherManager;
}

- (MOLifeEventManager)lifeEventManager
{
  lifeEventManager = self->_lifeEventManager;
  if (!lifeEventManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_lifeEventManager;
    self->_lifeEventManager = v7;

    lifeEventManager = self->_lifeEventManager;
  }

  return lifeEventManager;
}

- (MOMotionManager)motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)fUniverse getService:v6];
    v8 = self->_motionManager;
    self->_motionManager = v7;

    motionManager = self->_motionManager;
  }

  return motionManager;
}

- (id)_getEarliestDateForCategory_prelaunch:(unint64_t)a3
{
  v3 = +[NSDate date];
  v4 = +[NSDate dateWithTimeInterval:v3 sinceDate:-2419200.0];

  return v4;
}

- (id)_getEarliestDateForCategory_postlaunch:(unint64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 1uLL:
    case 0x16uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDateLocation";
      goto LABEL_9;
    case 2uLL:
    case 0xDuLL:
    case 0x10uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDateActivity";
      goto LABEL_9;
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 9uLL:
    case 0x13uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDateMedia";
      goto LABEL_9;
    case 5uLL:
    case 0xEuLL:
    case 0x11uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDatePhoto";
      goto LABEL_9;
    case 0xAuLL:
    case 0x12uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDateCommunication";
      goto LABEL_9;
    case 0xFuLL:
    case 0x15uLL:
    case 0x17uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDatePeople";
      goto LABEL_9;
    case 0x18uLL:
      v4 = [(MOEventManager *)self defaultsManager];
      v5 = v4;
      CFStringRef v6 = @"OnboardingEarliestCollectDateStateOfMind";
LABEL_9:
      v3 = [v4 objectForKey:v6];

      break;
    default:
      break;
  }

  return v3;
}

- (void)clearEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  CFStringRef v6 = (void (**)(id, void, void *))a4;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerClearEvents", "", v20, 2u);
  }

  v9 = [[MOPerformanceMeasurement alloc] initWithName:@"ClearEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  if (a3 == 0xFFFF)
  {
    v10 = [(MOEventManager *)self photoManager];
    [v10 deletePhotoMemoryPlistFile];
  }
  v11 = [(MOEventManager *)self eventStore];
  v12 = [v11 persistenceManager];
  id v13 = [v12 availability];

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = v14;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "clear event since datastore is available", v20, 2u);
    }

    [(MOEventManager *)self _clearEvents];
    if (v6) {
      v6[2](v6, 0, &__NSDictionary0__struct);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager clearEventsWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"[clearEventsWithRefreshVariant] database is not available";
      v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v17 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v16];

      ((void (**)(id, void *, void *))v6)[2](v6, v17, &__NSDictionary0__struct);
    }
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v19 = v18;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, a3, "EventManagerClearEvents", "", v20, 2u);
  }

  [(MOPerformanceMeasurement *)v9 endSession];
}

- (void)_clearEvents
{
  id v2 = [(MOEventManager *)self eventStore];
  [v2 removeAllEventsWithCompletionHandler:&__block_literal_global_45];
}

void __30__MOEventManager__clearEvents__block_invoke(id a1, NSError *a2)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "cleared all events", v3, 2u);
  }
}

- (void)collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCollectEvents", "", buf, 2u);
  }

  v9 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  v10 = [(MOEventManager *)self eventStore];
  v11 = [v10 persistenceManager];
  id v12 = [v11 availability];

  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v14 = v13;
  if (v12 == (id)2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "collect event since datastore is available", buf, 2u);
    }

    +[MOPersistenceManager persistCollectionDate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __61__MOEventManager_collectEventsWithRefreshVariant_andHandler___block_invoke;
    v20[3] = &unk_1002CE600;
    id v22 = v6;
    unint64_t v23 = a3;
    NSErrorUserInfoKey v21 = v9;
    [(MOEventManager *)self _collectEventsWithRefreshVariant:a3 andHandler:v20];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager collectEventsWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      CFStringRef v28 = @"[collectEventsWithRefreshVariant] database is not available";
      v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v16 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v15];

      CFStringRef v25 = @"stateDatabaseAvailable";
      v26 = &__kCFBooleanFalse;
      v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v16, v17);
    }
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v19 = v18;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, a3, "EventManagerCollectEvents", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
  }
}

void __61__MOEventManager_collectEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 mutableCopy];
  [v6 setObject:&__kCFBooleanTrue forKey:@"stateDatabaseAvailable"];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventManagerCollectEvents", "", v11, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)_collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v7 = a4;
  uint64_t v33 = 0;
  SEL v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__37;
  v37 = __Block_byref_object_dispose__37;
  id v38 = 0;
  uint64_t v27 = 0;
  CFStringRef v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__37;
  v31 = __Block_byref_object_dispose__37;
  id v32 = 0;
  v8 = [[MOEventRefreshHelper alloc] initWithUniverse:self->fUniverse];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke;
  v26[3] = &unk_1002CE0A0;
  v26[4] = &v33;
  v26[5] = &v27;
  [(MOEventRefreshHelper *)v8 getCollectDatesForVariant:a3 withHandler:v26];
  if (v34[5] && v28[5])
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v34[5];
      uint64_t v12 = v28[5];
      id v13 = +[NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138413058;
      id v40 = v10;
      __int16 v41 = 2112;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      uint64_t v44 = v12;
      __int16 v45 = 2112;
      v46 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, collect startDate, %@, endDate, %@, refreshVariant, %@", buf, 0x2Au);
    }
    v14 = [MOEventBundleFetchOptions alloc];
    id v15 = objc_alloc((Class)NSDateInterval);
    id v16 = [v15 initWithStartDate:v34[5] endDate:v28[5]];
    v17 = [(MOEventBundleFetchOptions *)v14 initWithDateInterval:v16 ascending:1 limit:&off_1002F79A0 includeDeletedBundles:0 skipRanking:1 interfaceType:13];

    v18 = [(MOEventManager *)self eventBundleStore];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_186;
    v20[3] = &unk_1002D1730;
    unint64_t v23 = &v27;
    SEL v24 = a2;
    unint64_t v25 = a3;
    id v22 = &v33;
    void v20[4] = self;
    id v21 = v7;
    [v18 fetchEventBundleWithOptions:v17 CompletionHandler:v20];
  }
  else
  {
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    CFStringRef v48 = @"collec start or end date cannot be nil";
    v19 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v17 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v19];

    if (v7) {
      (*((void (**)(id, MOEventBundleFetchOptions *, void *))v7 + 2))(v7, v17, &__NSDictionary0__struct);
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_186_cold_1();
    }
    goto LABEL_4;
  }
  if ([v5 count])
  {
    v20 = [v5 firstObject];
    id v21 = [v20 startDate];
    unsigned int v22 = [v21 isBeforeDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    if (v22)
    {
      id v7 = [v5 firstObject];
      uint64_t v23 = [v7 startDate];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

LABEL_4:
    }
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    *(_DWORD *)buf = 138413058;
    id v32 = v9;
    __int16 v33 = 2112;
    uint64_t v34 = v10;
    __int16 v35 = 2112;
    uint64_t v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, updated collect startDate for trip bundle, %@, endDate, %@, refreshVariant, %@", buf, 0x2Au);
  }
  id v13 = [MOEventFetchOptions alloc];
  id v14 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) endDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v15 = [(MOEventFetchOptions *)v13 initWithDateInterval:v14 ascending:1 limit:0];

  id v16 = [*(id *)(a1 + 32) eventStore];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_188;
  v27[3] = &unk_1002D1708;
  uint64_t v17 = *(void *)(a1 + 56);
  v27[4] = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v29 = v17;
  uint64_t v30 = v18;
  long long v26 = *(_OWORD *)(a1 + 40);
  id v19 = (id)v26;
  long long v28 = v26;
  [v16 fetchEventsWithOptions:v15 CompletionHandler:v27];
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_188(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(v4 + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(v5 + 8) + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_2;
  v9[3] = &unk_1002D16E0;
  v9[4] = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  id v10 = *(id *)(a1 + 40);
  [v3 _collectCompleteEventsBetweenStartDate:v6 endDate:v7 refreshVariant:v8 withStoredEvents:a2 handler:v9];
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!v9)
  {
    uint64_t v6 = [*(id *)(a1 + 32) defaultsManager];
    [v6 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:@"EventManagerLastCollectStartDate"];

    uint64_t v7 = [*(id *)(a1 + 32) defaultsManager];
    [v7 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:@"EventManagerLastCollectEndDate"];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

- (void)_collectCompleteEventsBetweenStartDate:(id)a3 endDate:(id)a4 refreshVariant:(unint64_t)a5 withStoredEvents:(id)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v98 = a7;
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEvents", "", buf, 2u);
  }

  v101 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectEventsBetweenStartEndWithStoredEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v101 startSession];
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v11 stringFromDate];
    uint64_t v17 = [v12 stringFromDate];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "start collecting events, start date, %@, end date, %@", buf, 0x16u);
  }
  id v97 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v18 = objc_opt_new();
  v105 = objc_opt_new();
  v103 = objc_opt_new();
  v99 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v303 = __Block_byref_object_copy__37;
  v304 = __Block_byref_object_dispose__37;
  id v305 = 0;
  uint64_t v296 = 0;
  v297 = &v296;
  uint64_t v298 = 0x3032000000;
  v299 = __Block_byref_object_copy__37;
  v300 = __Block_byref_object_dispose__37;
  id v301 = (id)objc_opt_new();
  uint64_t v290 = 0;
  v291 = &v290;
  uint64_t v292 = 0x3032000000;
  v293 = __Block_byref_object_copy__37;
  v294 = __Block_byref_object_dispose__37;
  id v295 = (id)objc_opt_new();
  uint64_t v284 = 0;
  v285 = &v284;
  uint64_t v286 = 0x3032000000;
  v287 = __Block_byref_object_copy__37;
  v288 = __Block_byref_object_dispose__37;
  id v289 = (id)objc_opt_new();
  uint64_t v278 = 0;
  v279 = &v278;
  uint64_t v280 = 0x3032000000;
  v281 = __Block_byref_object_copy__37;
  v282 = __Block_byref_object_dispose__37;
  id v283 = (id)objc_opt_new();
  uint64_t v272 = 0;
  v273 = &v272;
  uint64_t v274 = 0x3032000000;
  v275 = __Block_byref_object_copy__37;
  v276 = __Block_byref_object_dispose__37;
  id v277 = (id)objc_opt_new();
  uint64_t v266 = 0;
  v267 = &v266;
  uint64_t v268 = 0x3032000000;
  v269 = __Block_byref_object_copy__37;
  v270 = __Block_byref_object_dispose__37;
  id v271 = (id)objc_opt_new();
  uint64_t v260 = 0;
  v261 = &v260;
  uint64_t v262 = 0x3032000000;
  v263 = __Block_byref_object_copy__37;
  v264 = __Block_byref_object_dispose__37;
  id v265 = (id)objc_opt_new();
  uint64_t v254 = 0;
  v255 = &v254;
  uint64_t v256 = 0x3032000000;
  v257 = __Block_byref_object_copy__37;
  v258 = __Block_byref_object_dispose__37;
  id v259 = (id)objc_opt_new();
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x3032000000;
  v251 = __Block_byref_object_copy__37;
  v252 = __Block_byref_object_dispose__37;
  id v253 = (id)objc_opt_new();
  uint64_t v242 = 0;
  v243 = &v242;
  uint64_t v244 = 0x3032000000;
  v245 = __Block_byref_object_copy__37;
  v246 = __Block_byref_object_dispose__37;
  id v247 = (id)objc_opt_new();
  group = dispatch_group_create();
  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:24])
  {
    id v19 = [(MOEventManager *)self _getEarliestDateForCategory:24];
    [(id)v297[5] setObject:&__kCFBooleanFalse forKey:@"resultMindfulSessionsSuccess"];
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsState Of Mind", "", v241, 2u);
    }

    id v21 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectStateOfMind" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v21 startSession];
    unsigned int v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "start fetching and rehydrating state of mind data", v241, 2u);
    }

    dispatch_group_enter(group);
    collectQueue = self->collectQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke;
    block[3] = &unk_1002D17A8;
    block[4] = self;
    id v230 = v11;
    id v231 = v19;
    id v232 = v12;
    id v233 = v13;
    id v234 = v18;
    id v235 = v105;
    v239 = &v296;
    v240 = buf;
    id v236 = v103;
    v237 = v21;
    v238 = group;
    uint64_t v24 = v21;
    unint64_t v25 = v19;
    dispatch_async(collectQueue, block);
  }
  else
  {
    unint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating state of mind", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:2])
  {
    long long v26 = [(MOEventManager *)self _getEarliestDateForCategory:2];
    [(id)v291[5] setObject:&__kCFBooleanFalse forKey:@"resultWorkoutsSuccess"];
    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsWorkouts", "", v241, 2u);
    }

    long long v28 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectWorkouts" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v28 startSession];
    uint64_t v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "start fetching and rehydrating workouts", v241, 2u);
    }

    dispatch_group_enter(group);
    uint64_t v30 = self->collectQueue;
    v217[0] = _NSConcreteStackBlock;
    v217[1] = 3221225472;
    v217[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_216;
    v217[3] = &unk_1002D17A8;
    v217[4] = self;
    id v218 = v11;
    id v219 = v26;
    id v220 = v12;
    id v221 = v13;
    id v222 = v18;
    id v223 = v105;
    v227 = &v290;
    v228 = buf;
    id v224 = v103;
    v225 = v28;
    v226 = group;
    v31 = v28;
    id v32 = v26;
    dispatch_async(v30, v217);
  }
  else
  {
    id v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating workouts", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:17])
  {
    __int16 v33 = [(MOEventManager *)self _getEarliestDateForCategory:17];
    [(id)v285[5] setObject:&__kCFBooleanFalse forKey:@"resultPhotoMemorySuccess"];
    uint64_t v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPhotoMemories", "", v241, 2u);
    }

    __int16 v35 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectPhotoMemories" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v35 startSession];
    uint64_t v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "start fetching and rehydrating photo memory", v241, 2u);
    }

    dispatch_group_enter(group);
    __int16 v37 = self->collectQueue;
    v206[0] = _NSConcreteStackBlock;
    v206[1] = 3221225472;
    v206[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_222;
    v206[3] = &unk_1002D1820;
    v206[4] = self;
    id v207 = v11;
    id v208 = v33;
    id v209 = v12;
    id v210 = v13;
    id v211 = v18;
    id v212 = v105;
    v216 = &v284;
    id v213 = v103;
    v214 = v35;
    v215 = group;
    id v38 = v35;
    v39 = v33;
    dispatch_async(v37, v206);
  }
  else
  {
    v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating photo memory", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:10])
  {
    id v40 = [(MOEventManager *)self _getEarliestDateForCategory:10];
    [(id)v279[5] setObject:&__kCFBooleanFalse forKey:@"resultContactsSuccess"];
    __int16 v41 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v41))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsContacts", "", v241, 2u);
    }

    uint64_t v42 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectContacts" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v42 startSession];
    __int16 v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "start fetching and rehydrating contact events", v241, 2u);
    }

    dispatch_group_enter(group);
    uint64_t v44 = self->collectQueue;
    v195[0] = _NSConcreteStackBlock;
    v195[1] = 3221225472;
    v195[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_228;
    v195[3] = &unk_1002D1820;
    v195[4] = self;
    id v196 = v11;
    id v197 = v40;
    id v198 = v12;
    id v199 = v13;
    id v200 = v18;
    id v201 = v105;
    v205 = &v278;
    id v202 = v103;
    v203 = v42;
    v204 = group;
    __int16 v45 = v42;
    v46 = v40;
    dispatch_async(v44, v195);
  }
  else
  {
    v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating contact events", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:15])
  {
    NSErrorUserInfoKey v47 = [(MOEventManager *)self _getEarliestDateForCategory:15];
    [(id)v273[5] setObject:&__kCFBooleanFalse forKey:@"resultPeopleDiscoverySuccess"];
    CFStringRef v48 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v48))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsProximity", "", v241, 2u);
    }

    v49 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectProximity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v49 startSession];
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "start fetching and rehydrating prox", v241, 2u);
    }

    dispatch_group_enter(group);
    v51 = self->collectQueue;
    v184[0] = _NSConcreteStackBlock;
    v184[1] = 3221225472;
    v184[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_234;
    v184[3] = &unk_1002D1898;
    v184[4] = self;
    id v185 = v11;
    id v186 = v47;
    id v187 = v12;
    id v188 = v13;
    id v189 = v18;
    v193 = &v272;
    v194 = buf;
    id v190 = v105;
    v191 = v49;
    v192 = group;
    v52 = v49;
    v53 = v47;
    dispatch_async(v51, v184);
  }
  else
  {
    v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating prox", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:23])
  {
    v54 = [(MOEventManager *)self _getEarliestDateForCategory:23];
    [(id)v267[5] setObject:&__kCFBooleanFalse forKey:@"resultPeopleDensitySuccess"];
    v55 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v55))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPeopleDensity", "", v241, 2u);
    }

    v56 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectPeopleDensity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v56 startSession];
    v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "start fetching and rehydrating people density events", v241, 2u);
    }

    dispatch_group_enter(group);
    v58 = self->collectQueue;
    v173[0] = _NSConcreteStackBlock;
    v173[1] = 3221225472;
    v173[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_240;
    v173[3] = &unk_1002D1898;
    v173[4] = self;
    id v174 = v11;
    id v175 = v54;
    id v176 = v12;
    id v177 = v13;
    id v178 = v18;
    v182 = &v266;
    v183 = buf;
    id v179 = v105;
    v180 = v56;
    v181 = group;
    v59 = v56;
    v60 = v54;
    dispatch_async(v58, v173);
  }
  else
  {
    v60 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating people density events", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:22])
  {
    v61 = [(MOEventManager *)self _getEarliestDateForCategory:22];
    [(id)v261[5] setObject:&__kCFBooleanFalse forKey:@"resultLifeEventsSuccess"];
    v62 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v62))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsLifeEvents", "", v241, 2u);
    }

    v63 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectLifeEvents" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v63 startSession];
    v64 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "start fetching and rehydrating life events", v241, 2u);
    }

    dispatch_group_enter(group);
    v65 = self->collectQueue;
    v163[0] = _NSConcreteStackBlock;
    v163[1] = 3221225472;
    v163[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_246;
    v163[3] = &unk_1002D1910;
    v163[4] = self;
    id v164 = v11;
    id v165 = v61;
    id v166 = v12;
    id v167 = v13;
    id v168 = v18;
    v172 = &v260;
    id v169 = v105;
    v170 = v63;
    v171 = group;
    v66 = v63;
    v67 = v61;
    dispatch_async(v65, v163);
  }
  else
  {
    v67 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating life events", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:1])
  {
    v68 = [(MOEventManager *)self _getEarliestDateForCategory:1];
    [(id)v255[5] setObject:&__kCFBooleanFalse forKey:@"resultVisitsTrainingSuccess"];
    [(id)v255[5] setObject:&__kCFBooleanFalse forKey:@"resultVisitsSuccess"];
    v69 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v69))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits", "", v241, 2u);
    }

    v70 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisits" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v70 startSession];
    v71 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "start training, fetching and rehydrating visits", v241, 2u);
    }

    dispatch_group_enter(group);
    v72 = self->collectQueue;
    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_252;
    v152[3] = &unk_1002D19D8;
    v152[4] = self;
    v161 = &v254;
    v162 = buf;
    id v153 = v11;
    id v154 = v68;
    id v155 = v13;
    id v156 = v18;
    id v157 = v99;
    id v158 = v105;
    v159 = v70;
    v160 = group;
    v73 = v70;
    v74 = v68;
    dispatch_async(v72, v152);
  }
  else
  {
    v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "skipping training, fetching and rehydrating visits", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:6])
  {
    v75 = [(MOEventManager *)self _getEarliestDateForCategory:6];
    [(id)v249[5] setObject:&__kCFBooleanFalse forKey:@"resultMusicSuccess"];
    v76 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v76))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMusic", "", v241, 2u);
    }

    v77 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectMusic" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v77 startSession];
    v78 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "start fetching and rehydrating music", v241, 2u);
    }

    dispatch_group_enter(group);
    v79 = self->collectQueue;
    v141[0] = _NSConcreteStackBlock;
    v141[1] = 3221225472;
    v141[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_268;
    v141[3] = &unk_1002D1820;
    v141[4] = self;
    id v142 = v11;
    id v143 = v75;
    id v144 = v12;
    id v145 = v13;
    id v146 = v18;
    id v147 = v105;
    v151 = &v248;
    id v148 = v103;
    v149 = v77;
    v150 = group;
    v80 = v77;
    v81 = v75;
    dispatch_async(v79, v141);
  }
  else
  {
    v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating music", v241, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:16])
  {
    v82 = [(MOEventManager *)self _getEarliestDateForCategory:16];
    [(id)v243[5] setObject:&__kCFBooleanFalse forKey:@"resultMotionSuccess"];
    v83 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v83))
    {
      *(_WORD *)v241 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMotionActivity", "", v241, 2u);
    }

    v84 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectMotionActivity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v84 startSession];
    v85 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "start fetching and rehydrating motion events", v241, 2u);
    }

    dispatch_group_enter(group);
    v86 = self->collectQueue;
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_274;
    v130[3] = &unk_1002D1898;
    v130[4] = self;
    id v131 = v11;
    id v132 = v82;
    id v133 = v12;
    id v134 = v13;
    id v135 = v18;
    v139 = &v242;
    v140 = buf;
    id v136 = v105;
    v137 = v84;
    v138 = group;
    v87 = v84;
    v88 = v82;
    dispatch_async(v86, v130);
  }
  else
  {
    v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v241 = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "skipping fetching and saving motion events", v241, 2u);
    }
  }

  queue = [(MOEventManager *)self queue];
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_277;
  v107[3] = &unk_1002D1A28;
  v120 = &v290;
  v121 = &v284;
  v122 = &v278;
  v123 = &v272;
  v124 = &v266;
  v125 = &v260;
  v126 = &v254;
  v127 = &v248;
  id v108 = v97;
  id v109 = v105;
  id v110 = v103;
  id v111 = v18;
  v128 = &v242;
  v129 = buf;
  id v112 = v11;
  id v113 = v12;
  id v114 = v13;
  v115 = self;
  id v118 = v98;
  v119 = &v296;
  id v116 = v99;
  v117 = v101;
  v102 = v101;
  id v89 = v98;
  id v100 = v99;
  id v90 = v13;
  id v91 = v12;
  id v92 = v11;
  id v93 = v18;
  id v104 = v103;
  id v94 = v105;
  id v95 = v97;
  dispatch_group_notify(group, queue, v107);

  _Block_object_dispose(&v242, 8);
  _Block_object_dispose(&v248, 8);

  _Block_object_dispose(&v254, 8);
  _Block_object_dispose(&v260, 8);

  _Block_object_dispose(&v266, 8);
  _Block_object_dispose(&v272, 8);

  _Block_object_dispose(&v278, 8);
  _Block_object_dispose(&v284, 8);

  _Block_object_dispose(&v290, 8);
  _Block_object_dispose(&v296, 8);

  _Block_object_dispose(buf, 8);
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [*(id *)(a1 + 32) healthKitManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  uint64_t v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2;
  v16[3] = &unk_1002D1780;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  long long v22 = *(_OWORD *)(a1 + 112);
  id v11 = v2;
  v20 = v11;
  id v21 = *(id *)(a1 + 96);
  [v3 fetchStateOfMindEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v16];

  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 507, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v15 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v15, v12, 120.0);
  id v13 = v15;
  if ((v6 & 1) == 0)
  {
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3;
  block[3] = &unk_1002D1758;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 80);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsState Of Mind", "", v11, 2u);
  }

  [*(id *)(a1 + 72) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v17 = v3;
      unsigned __int16 v14 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v14 & 0x400) != 0)
      {
        id v15 = *(void **)(a1 + 32);
        id v16 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        objc_storeStrong(v16, v15);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v9];
    }
    uint64_t v10 = [*(id *)(a1 + 40) objectForKey:@"unrehydratedEvents"];

    if (v10)
    {
      id v11 = *(void **)(a1 + 64);
      id v12 = [*(id *)(a1 + 40) objectForKey:@"unrehydratedEvents"];
      [v11 addObjectsFromArray:v12];
    }
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    [v13 setObject:&__kCFBooleanTrue forKey:@"resultMindfulSessionsSuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_216(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [*(id *)(a1 + 32) healthKitManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_217;
  v16[3] = &unk_1002D1780;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  long long v22 = *(_OWORD *)(a1 + 112);
  id v11 = v2;
  v20 = v11;
  id v21 = *(id *)(a1 + 96);
  [v3 fetchWorkoutEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v16];

  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 553, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v15 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v15, v12, 120.0);
  id v13 = v15;
  if ((v6 & 1) == 0)
  {
    unsigned __int16 v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_217(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_218;
  block[3] = &unk_1002D1758;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 80);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsWorkouts", "", v11, 2u);
  }

  [*(id *)(a1 + 72) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_218(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v17 = v3;
      unsigned __int16 v14 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v14 & 0x400) != 0)
      {
        id v15 = *(void **)(a1 + 32);
        id v16 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        objc_storeStrong(v16, v15);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v9];
    }
    uint64_t v10 = [*(id *)(a1 + 40) objectForKey:@"unrehydratedEvents"];

    if (v10)
    {
      id v11 = *(void **)(a1 + 64);
      id v12 = [*(id *)(a1 + 40) objectForKey:@"unrehydratedEvents"];
      [v11 addObjectsFromArray:v12];
    }
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    [v13 setObject:&__kCFBooleanTrue forKey:@"resultWorkoutsSuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_222(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [*(id *)(a1 + 32) photoManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_223;
  v18[3] = &unk_1002D17F8;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 112);
  id v21 = v11;
  uint64_t v24 = v12;
  id v13 = v2;
  long long v22 = v13;
  id v23 = *(id *)(a1 + 96);
  [v3 fetchPhotoMemoryEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v18];

  unsigned __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 594, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v17 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v17, v14, 120.0);
  id v15 = v17;
  if ((v6 & 1) == 0)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_223(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_224;
  block[3] = &unk_1002D17D0;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 80);
  id v19 = v10;
  uint64_t v20 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPhotoMemories", "", v13, 2u);
  }

  [*(id *)(a1 + 72) endSession];
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_224(id *result)
{
  if (!result[4])
  {
    v1 = result;
    dispatch_semaphore_t v2 = [result[5] objectForKey:@"newEvents"];

    if (v2)
    {
      id v3 = v1[6];
      uint64_t v4 = [v1[5] objectForKey:@"newEvents"];
      [v3 addObjectsFromArray:v4];
    }
    id v5 = [v1[5] objectForKey:@"rehydratedEvents"];

    if (v5)
    {
      id v6 = v1[7];
      uint64_t v7 = [v1[5] objectForKey:@"rehydratedEvents"];
      [v6 addObjectsFromArray:v7];
    }
    id v8 = [v1[5] objectForKey:@"unrehydratedEvents"];

    if (v8)
    {
      id v9 = v1[8];
      id v10 = [v1[5] objectForKey:@"unrehydratedEvents"];
      [v9 addObjectsFromArray:v10];
    }
    uint64_t v11 = *(void **)(*((void *)v1[9] + 1) + 40);
    return (id *)[v11 setObject:&__kCFBooleanTrue forKey:@"resultPhotoMemorySuccess"];
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_228(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) significantContactManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_229;
  v18[3] = &unk_1002D17F8;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 112);
  id v21 = v11;
  uint64_t v24 = v12;
  id v13 = v2;
  long long v22 = v13;
  id v23 = *(id *)(a1 + 96);
  [v3 fetchConversationEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v18];

  unsigned __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 635, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v17 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v17, v14, 120.0);
  id v15 = v17;
  if ((v6 & 1) == 0)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_229(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_230;
  block[3] = &unk_1002D17D0;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 80);
  id v19 = v10;
  uint64_t v20 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsContacts", "", v13, 2u);
  }

  [*(id *)(a1 + 72) endSession];
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_230(id *result)
{
  if (!result[4])
  {
    v1 = result;
    dispatch_semaphore_t v2 = [result[5] objectForKey:@"newEvents"];

    if (v2)
    {
      id v3 = v1[6];
      uint64_t v4 = [v1[5] objectForKey:@"newEvents"];
      [v3 addObjectsFromArray:v4];
    }
    id v5 = [v1[5] objectForKey:@"rehydratedEvents"];

    if (v5)
    {
      id v6 = v1[7];
      uint64_t v7 = [v1[5] objectForKey:@"rehydratedEvents"];
      [v6 addObjectsFromArray:v7];
    }
    id v8 = [v1[5] objectForKey:@"unrehydratedEvents"];

    if (v8)
    {
      id v9 = v1[8];
      id v10 = [v1[5] objectForKey:@"unrehydratedEvents"];
      [v9 addObjectsFromArray:v10];
    }
    uint64_t v11 = *(void **)(*((void *)v1[9] + 1) + 40);
    return (id *)[v11 setObject:&__kCFBooleanTrue forKey:@"resultContactsSuccess"];
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_234(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) peopleDiscoveryManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_235;
  v16[3] = &unk_1002D1870;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 104);
  uint64_t v11 = v2;
  id v19 = v11;
  id v20 = *(id *)(a1 + 88);
  [v3 fetchProxEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v16];

  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 676, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v15 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v15, v12, 120.0);
  id v13 = v15;
  if ((v6 & 1) == 0)
  {
    unsigned __int16 v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_235(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_236;
  block[3] = &unk_1002D1848;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsProximity", "", v11, 2u);
  }

  [*(id *)(a1 + 64) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_236(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v16 = v3;
      unsigned __int16 v11 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v11 & 0x400) != 0)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        id v15 = *(void **)(v12 + 40);
        id v13 = (id *)(v12 + 40);
        id v14 = v15;
        if (!v15) {
          id v14 = *(void **)(a1 + 32);
        }
        objc_storeStrong(v13, v14);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v9];
    }
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [v10 setObject:&__kCFBooleanTrue forKey:@"resultPeopleDiscoverySuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_240(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) peopleDiscoveryManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_241;
  v16[3] = &unk_1002D1870;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 104);
  unsigned __int16 v11 = v2;
  id v19 = v11;
  id v20 = *(id *)(a1 + 88);
  [v3 fetchPeopleDensityEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v16];

  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 718, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v15 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v15, v12, 120.0);
  id v13 = v15;
  if ((v6 & 1) == 0)
  {
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_241(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_242;
  block[3] = &unk_1002D1848;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)unsigned __int16 v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPeopleDensity", "", v11, 2u);
  }

  [*(id *)(a1 + 64) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_242(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v16 = v3;
      unsigned __int16 v11 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v11 & 0x400) != 0)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        id v15 = *(void **)(v12 + 40);
        id v13 = (id *)(v12 + 40);
        id v14 = v15;
        if (!v15) {
          id v14 = *(void **)(a1 + 32);
        }
        objc_storeStrong(v13, v14);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v9];
    }
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [v10 setObject:&__kCFBooleanTrue forKey:@"resultPeopleDensitySuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_246(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) lifeEventManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_247;
  v18[3] = &unk_1002D18E8;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 104);
  id v20 = v11;
  uint64_t v23 = v12;
  id v13 = v2;
  long long v21 = v13;
  id v22 = *(id *)(a1 + 88);
  [v3 fetchLifeEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v18];

  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 757, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v17 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v17, v14, 120.0);
  id v15 = v17;
  if ((v6 & 1) == 0)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_247(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_248;
  block[3] = &unk_1002D18C0;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  id v18 = v10;
  uint64_t v19 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsLifeEvents", "", v13, 2u);
  }

  [*(id *)(a1 + 64) endSession];
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_248(id *result)
{
  if (!result[4])
  {
    v1 = result;
    dispatch_semaphore_t v2 = [result[5] objectForKey:@"newEvents"];

    if (v2)
    {
      id v3 = v1[6];
      uint64_t v4 = [v1[5] objectForKey:@"newEvents"];
      [v3 addObjectsFromArray:v4];
    }
    id v5 = [v1[5] objectForKey:@"rehydratedEvents"];

    if (v5)
    {
      id v6 = v1[7];
      uint64_t v7 = [v1[5] objectForKey:@"rehydratedEvents"];
      [v6 addObjectsFromArray:v7];
    }
    id v8 = *(void **)(*((void *)v1[8] + 1) + 40);
    return (id *)[v8 setObject:&__kCFBooleanTrue forKey:@"resultLifeEventsSuccess"];
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_252(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Training", "", buf, 2u);
  }

  uint64_t v4 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisitsTraining" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v4 startSession];
  id v5 = [*(id *)(a1 + 32) routineServiceManager];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_256;
  v38[3] = &unk_1002D1960;
  v38[4] = *(void *)(a1 + 32);
  long long v41 = *(_OWORD *)(a1 + 104);
  id v6 = v2;
  v39 = v6;
  uint64_t v7 = v4;
  id v40 = v7;
  [v5 detectHindsightVisitsWithCompletionHandler:v38];

  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 794, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v37 = 0;
  BOOL v9 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v6, &v37, v8, 120.0);
  id v26 = v37;
  if (!v9)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Fetching", "", buf, 2u);
  }

  uint64_t v12 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisitsFetching" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v12 startSession];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);

  id v14 = [*(id *)(a1 + 32) routineServiceManager];
  id v15 = *(void **)(a1 + 40);
  id v16 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  id v17 = [v15 laterDate:v16];
  id v18 = +[NSDate distantFuture];
  uint64_t v19 = *(void **)(a1 + 56);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_261;
  v28[3] = &unk_1002D19B0;
  v28[4] = *(void *)(a1 + 32);
  id v29 = v19;
  id v30 = *(id *)(a1 + 64);
  id v31 = *(id *)(a1 + 72);
  id v32 = *(id *)(a1 + 80);
  long long v36 = *(_OWORD *)(a1 + 104);
  id v20 = v12;
  __int16 v33 = v20;
  id v34 = *(id *)(a1 + 88);
  long long v21 = v13;
  __int16 v35 = v21;
  [v14 fetchVisitsBetweenStartDate:v17 endDate:v18 withStoredEvents:v29 handler:v28];

  id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 833, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v27 = 0;
  BOOL v23 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v21, &v27, v22, 120.0);
  id v24 = v27;
  if (!v23)
  {
    unint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_256(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "detectHindsightVisits, error, %@", buf, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_257;
  block[3] = &unk_1002D1938;
  id v6 = v3;
  id v9 = v6;
  long long v10 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v5, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Training", "", buf, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_257(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      long long v10 = v3;
      unsigned __int16 v5 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v5 & 0x400) != 0)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
        id v9 = *(void **)(v6 + 40);
        uint64_t v7 = (id *)(v6 + 40);
        id v8 = v9;
        if (!v9) {
          id v8 = *(void **)(a1 + 32);
        }
        objc_storeStrong(v7, v8);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v4 setObject:&__kCFBooleanTrue forKey:@"resultVisitsSuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_261(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_262;
  block[3] = &unk_1002D1988;
  id v8 = v5;
  id v16 = v8;
  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v11;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 96);
  dispatch_sync(v7, block);

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Fetching", "", v14, 2u);
  }

  [*(id *)(a1 + 72) endSession];
  dispatch_semaphore_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits", "", v14, 2u);
  }

  [*(id *)(a1 + 80) endSession];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 88));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_262(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v19 = v3;
      unsigned __int16 v14 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v14 & 0x400) != 0)
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
        uint64_t v18 = *(void **)(v15 + 40);
        id v16 = (id *)(v15 + 40);
        id v17 = v18;
        if (!v18) {
          id v17 = *(void **)(a1 + 32);
        }
        objc_storeStrong(v16, v17);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      uint64_t v27 = 0;
      long long v28 = &v27;
      uint64_t v29 = 0x3032000000;
      id v30 = __Block_byref_object_copy__37;
      id v31 = __Block_byref_object_dispose__37;
      id v32 = 0;
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x3032000000;
      id v24 = __Block_byref_object_copy__37;
      unint64_t v25 = __Block_byref_object_dispose__37;
      id v26 = 0;
      id v5 = [*(id *)(a1 + 48) routineServiceManager];
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      uint64_t v7 = *(void *)(a1 + 56);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_263;
      v20[3] = &unk_1002CE2D0;
      void v20[4] = &v27;
      void v20[5] = &v21;
      [v5 fetchConsolidatedEvents:v6 withStored:v7 handler:v20];

      [*(id *)(a1 + 64) addObjectsFromArray:v28[5]];
      if ([(id)v22[5] count])
      {
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = [(id)v22[5] count];
          *(_DWORD *)buf = 134217984;
          id v34 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Number of real time new home events to be deleted is , %lu", buf, 0xCu);
        }

        [*(id *)(a1 + 72) addObjectsFromArray:v22[5]];
      }
      _Block_object_dispose(&v21, 8);

      _Block_object_dispose(&v27, 8);
    }
    uint64_t v10 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      id v12 = *(void **)(a1 + 80);
      dispatch_semaphore_t v13 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v12 addObjectsFromArray:v13];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setObject:&__kCFBooleanTrue forKey:@"resultVisitsTrainingSuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_263(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_268(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) nowPlayingMediaManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  uint64_t v9 = [v7 laterDate:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_269;
  v18[3] = &unk_1002D17F8;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 112);
  id v21 = v11;
  uint64_t v24 = v12;
  dispatch_semaphore_t v13 = v2;
  id v22 = v13;
  id v23 = *(id *)(a1 + 96);
  [v3 fetchMediaPlayEventsBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v18];

  unsigned __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 874, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v17 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v17, v14, 120.0);
  id v15 = v17;
  if ((v6 & 1) == 0)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_269(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_270;
  block[3] = &unk_1002D17D0;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 80);
  id v19 = v10;
  uint64_t v20 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)dispatch_semaphore_t v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMusic", "", v13, 2u);
  }

  [*(id *)(a1 + 72) endSession];
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_270(id *result)
{
  if (!result[4])
  {
    v1 = result;
    dispatch_semaphore_t v2 = [result[5] objectForKey:@"newEvents"];

    if (v2)
    {
      id v3 = v1[6];
      uint64_t v4 = [v1[5] objectForKey:@"newEvents"];
      [v3 addObjectsFromArray:v4];
    }
    id v5 = [v1[5] objectForKey:@"rehydratedEvents"];

    if (v5)
    {
      id v6 = v1[7];
      uint64_t v7 = [v1[5] objectForKey:@"rehydratedEvents"];
      [v6 addObjectsFromArray:v7];
    }
    id v8 = [v1[5] objectForKey:@"unrehydratedEvents"];

    if (v8)
    {
      id v9 = v1[8];
      id v10 = [v1[5] objectForKey:@"unrehydratedEvents"];
      [v9 addObjectsFromArray:v10];
    }
    uint64_t v11 = *(void **)(*((void *)v1[9] + 1) + 40);
    return (id *)[v11 setObject:&__kCFBooleanTrue forKey:@"resultMusicSuccess"];
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_274(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) motionManager];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:0.0];
  uint64_t v6 = [v4 laterDate:v5];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 48) sinceDate:1.0];
  id v9 = [v7 laterDate:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_275;
  v16[3] = &unk_1002D1870;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 104);
  uint64_t v11 = v2;
  id v19 = v11;
  id v20 = *(id *)(a1 + 88);
  [v3 fetchMotionActivityBetweenStartDate:v6 endDate:v9 withStoredEvents:v10 handler:v16];

  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 915, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke");
  id v15 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v15, v12, 120.0);
  id v13 = v15;
  if ((v6 & 1) == 0)
  {
    unsigned __int16 v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_275(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_276;
  block[3] = &unk_1002D1848;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMotionActivity", "", v11, 2u);
  }

  [*(id *)(a1 + 64) endSession];
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_276(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (v3 == @"MOErrorDomain")
    {
      id v16 = v3;
      unsigned __int16 v11 = (unsigned __int16)[*(id *)(a1 + 32) code];

      if ((v11 & 0x400) != 0)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        id v15 = *(void **)(v12 + 40);
        id v13 = (id *)(v12 + 40);
        id v14 = v15;
        if (!v15) {
          id v14 = *(void **)(a1 + 32);
        }
        objc_storeStrong(v13, v14);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];

    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) objectForKey:@"newEvents"];
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 40) objectForKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v9];
    }
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [v10 setObject:&__kCFBooleanTrue forKey:@"resultMotionSuccess"];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_277(uint64_t a1)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 40)];
  [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 40)];
  unsigned int v2 = [*(id *)(a1 + 40) count];
  unsigned int v3 = [*(id *)(a1 + 48) count] + v2;
  uint64_t v4 = v3 + [*(id *)(a1 + 56) count];
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSNumber numberWithInt:v4];
  [v5 setValue:v6 forKey:@"resultNumberOfEvents"];

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 200) + 8) + 40);
  if (v7 && ([v7 code] & 0x400) != 0) {
    [*(id *)(a1 + 32) setValue:&off_1002F79A0 forKey:@"stateDataProviderDatabaseUnavailable"];
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = *(void **)(a1 + 64);
    uint64_t v10 = *(void **)(a1 + 72);
    id v11 = [*(id *)(a1 + 40) count];
    id v12 = [*(id *)(a1 + 56) count];
    id v13 = [*(id *)(a1 + 48) count];
    id v14 = [*(id *)(a1 + 80) count];
    *(_DWORD *)buf = 138413570;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2048;
    id v42 = v11;
    __int16 v43 = 2048;
    id v44 = v12;
    __int16 v45 = 2048;
    id v46 = v13;
    __int16 v47 = 2048;
    id v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "done with fetching and rehydrating events, start date, %@, end date, %@, rehydrated events count, %lu, new events count, %lu, unrehydrated events count, %lu, stored events count, %lu", buf, 0x3Eu);
  }

  id v15 = objc_opt_new();
  id v16 = objc_opt_new();
  if ([*(id *)(a1 + 40) count]) {
    [v15 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 56) count])
  {
    [v15 addObjectsFromArray:*(void *)(a1 + 56)];
    [v16 addObjectsFromArray:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 48) count]) {
    [v16 addObjectsFromArray:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 88) setCachedEvents:v15];
  [*(id *)(a1 + 88) setCacheStartDate:*(void *)(a1 + 64)];
  [*(id *)(a1 + 88) setCacheEndDate:*(void *)(a1 + 72)];
  long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [*(id *)(a1 + 88) cachedEvents];
    id v19 = [v18 count];
    id v20 = [*(id *)(a1 + 88) cacheStartDate];
    long long v21 = [*(id *)(a1 + 88) cacheEndDate];
    *(_DWORD *)buf = 134218498;
    id v38 = v19;
    __int16 v39 = 2112;
    id v40 = v20;
    __int16 v41 = 2112;
    id v42 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "done with updating cache, event count, %lu, start date, %@, end date, %@", buf, 0x20u);
  }
  id v22 = [*(id *)(a1 + 96) count];
  uint64_t v23 = *(void *)(a1 + 200);
  if (v22 && !*(void *)(*(void *)(v23 + 8) + 40))
  {
    uint64_t v24 = [*(id *)(a1 + 88) eventStore];
    unint64_t v25 = *(void **)(a1 + 96);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_278;
    v34[3] = &unk_1002CE4A0;
    uint64_t v36 = *(void *)(a1 + 200);
    id v35 = v25;
    [v24 removeEvents:v35 CompletionHandler:v34];

    uint64_t v23 = *(void *)(a1 + 200);
  }
  if (*(void *)(*(void *)(v23 + 8) + 40))
  {
    if (*(void *)(a1 + 112))
    {
      id v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_277_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
    }
    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", "", buf, 2u);
    }

    [*(id *)(a1 + 104) endSession];
  }
  else
  {
    long long v28 = [*(id *)(a1 + 88) eventStore];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_282;
    v29[3] = &unk_1002D1A00;
    id v33 = *(id *)(a1 + 112);
    id v30 = *(id *)(a1 + 32);
    id v31 = v16;
    id v32 = *(id *)(a1 + 104);
    [v28 storeEvents:v31 CompletionHandler:v29];
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_278(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Remove old real time visits events failed";
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v5 = +[NSError errorWithDomain:@"MOErrorDomain" code:22 userInfo:v4];

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(NSObject **)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    id v8 = v9;
    if (v9) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v5;
    }
    objc_storeStrong(v7, v10);
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_278_cold_1();
    }
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v12 = [*(id *)(a1 + 32) count];
      int v13 = 134217984;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "remove old real time visits events succeeded and continue refresh, removed events count %lu", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_282(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_282_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v11 = [*(id *)(a1 + 40) count];
      int v14 = 134217984;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved new and unrehydrated events into database. %lu", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
  int v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", "", (uint8_t *)&v14, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

- (void)_collectEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v224 = a3;
  id v223 = a4;
  id v221 = a5;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEvents", "", buf, 2u);
  }

  id v222 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectEventsBetweenStartEnd" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v222 startSession];
  *(void *)buf = 0;
  v332 = buf;
  uint64_t v333 = 0x3032000000;
  v334 = __Block_byref_object_copy__37;
  v335 = __Block_byref_object_dispose__37;
  id v336 = objc_alloc_init((Class)NSMutableDictionary);
  v329[0] = 0;
  v329[1] = v329;
  v329[2] = 0x2020000000;
  int v330 = 0;
  group = dispatch_group_create();
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v224 stringFromDate];
    id v10 = [v223 stringFromDate];
    *(_DWORD *)v337 = 138412546;
    id v338 = v9;
    __int16 v339 = 2112;
    id v340 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "start collecting events, start date, %@, end date, %@", v337, 0x16u);
  }
  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:2])
  {
    id v11 = [(MOEventManager *)self _getEarliestDateForCategory:2];
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsWorkouts", "", v337, 2u);
    }

    int v13 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectWorkouts" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v13 startSession];
    int v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "start fetching and saving workouts", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    CFStringRef v16 = [(MOEventManager *)self healthKitManager];
    long long v17 = +[NSDate dateWithTimeInterval:v11 sinceDate:0.0];
    id v18 = [v224 laterDate:v17];
    id v19 = +[NSDate dateWithTimeInterval:v11 sinceDate:1.0];
    uint64_t v20 = [v223 laterDate:v19];
    v323[0] = _NSConcreteStackBlock;
    v323[1] = 3221225472;
    v323[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke;
    v323[3] = &unk_1002D1A50;
    v327 = v329;
    v328 = buf;
    long long v21 = v15;
    v324 = v21;
    v325 = group;
    id v22 = v13;
    v326 = v22;
    [v16 fetchAndSaveWorkoutsBetweenStartDate:v18 EndDate:v20 handler:v323];

    uint64_t v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1042, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v322 = 0;
    LOBYTE(v20) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v21, &v322, v23, 120.0);
    id v24 = v322;
    if ((v20 & 1) == 0)
    {
      unint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v24) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultWorkoutsSuccess"];
    }
  }
  else
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "skipping fetching and saving workouts", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:13])
  {
    id v26 = [(MOEventManager *)self _getEarliestDateForCategory:13];
    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMindfullSessions", "", v337, 2u);
    }

    long long v28 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectMindfulSessions" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v28 startSession];
    uint64_t v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "start fetching and saving mindful sessions", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    id v31 = [(MOEventManager *)self healthKitManager];
    id v32 = +[NSDate dateWithTimeInterval:v26 sinceDate:0.0];
    id v33 = [v224 laterDate:v32];
    id v34 = +[NSDate dateWithTimeInterval:v26 sinceDate:1.0];
    uint64_t v35 = [v223 laterDate:v34];
    v316[0] = _NSConcreteStackBlock;
    v316[1] = 3221225472;
    v316[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_289;
    v316[3] = &unk_1002D1A50;
    v320 = v329;
    v321 = buf;
    uint64_t v36 = v30;
    v317 = v36;
    v318 = group;
    id v37 = v28;
    v319 = v37;
    [v31 fetchAndSaveMindfulSessionsBetweenStartDate:v33 EndDate:v35 handler:v316];

    id v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1076, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v315 = 0;
    LOBYTE(v35) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v36, &v315, v38, 120.0);
    id v39 = v315;
    if ((v35 & 1) == 0)
    {
      id v40 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v39) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultMindfulSessionsSuccess"];
    }
  }
  else
  {
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "skipping fetching and saving mindful sessions", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:1])
  {
    __int16 v41 = [(MOEventManager *)self _getEarliestDateForCategory:1];
    id v42 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v42))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits", "", v337, 2u);
    }

    __int16 v43 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisits" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v43 startSession];
    id v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "start fetching and saving visits", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
    id v46 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v46))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Training", "", v337, 2u);
    }

    __int16 v47 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisitsTraining" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v47 startSession];
    id v48 = [(MOEventManager *)self routineServiceManager];
    v311[0] = _NSConcreteStackBlock;
    v311[1] = 3221225472;
    v311[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_290;
    v311[3] = &unk_1002D1A78;
    v314 = buf;
    v49 = v45;
    v312 = v49;
    id v219 = v47;
    v313 = v219;
    [v48 detectHindsightVisitsWithCompletionHandler:v311];

    v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1106, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v310 = 0;
    LOBYTE(v47) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v49, &v310, v50, 120.0);
    unint64_t v220 = (unint64_t)v310;
    if ((v47 & 1) == 0)
    {
      v51 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    v52 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Fetching", "", v337, 2u);
    }

    v53 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectVisitsFetching" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v53 startSession];
    dispatch_semaphore_t v54 = dispatch_semaphore_create(0);

    v55 = [(MOEventManager *)self routineServiceManager];
    v56 = +[NSDate dateWithTimeInterval:v41 sinceDate:0.0];
    v57 = [v224 laterDate:v56];
    v58 = +[NSDate dateWithTimeInterval:v41 sinceDate:1.0];
    uint64_t v59 = [v223 laterDate:v58];
    v303[0] = _NSConcreteStackBlock;
    v303[1] = 3221225472;
    v303[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_291;
    v303[3] = &unk_1002D1AA0;
    v308 = v329;
    v309 = buf;
    v60 = v54;
    v304 = v60;
    id v305 = group;
    v61 = v53;
    v306 = v61;
    v62 = v43;
    v307 = v62;
    [v55 fetchAndSaveVisitsBetweenStartDate:v57 EndDate:v59 handler:v303];

    v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1126, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v302 = 0;
    LOBYTE(v59) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v60, &v302, v63, 120.0);
    unint64_t v64 = (unint64_t)v302;
    if ((v59 & 1) == 0)
    {
      v65 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v220 | v64) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultVisitsSuccess"];
    }
  }
  else
  {
    __int16 v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "skipping fetching and saving visits", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:14])
  {
    v66 = [(MOEventManager *)self _getEarliestDateForCategory:14];
    v67 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v67))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsSharedPhotoMoments", "", v337, 2u);
    }

    v68 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectSharedPhotoMoments" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v68 startSession];
    v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "start fetching and saving shared p mom", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v70 = dispatch_semaphore_create(0);
    v71 = [(MOEventManager *)self photoManager];
    v72 = +[NSDate dateWithTimeInterval:v66 sinceDate:0.0];
    v73 = [v224 laterDate:v72];
    v74 = +[NSDate dateWithTimeInterval:v66 sinceDate:1.0];
    uint64_t v75 = [v223 laterDate:v74];
    v296[0] = _NSConcreteStackBlock;
    v296[1] = 3221225472;
    v296[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_295;
    v296[3] = &unk_1002D1A50;
    v300 = v329;
    id v301 = buf;
    v76 = v70;
    v297 = v76;
    uint64_t v298 = group;
    v77 = v68;
    v299 = v77;
    [v71 fetchAndSaveSharedPhotosBetweenStartDate:v73 EndDate:v75 handler:v296];

    v78 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1161, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v295 = 0;
    LOBYTE(v75) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v76, &v295, v78, 120.0);
    id v79 = v295;
    if ((v75 & 1) == 0)
    {
      v80 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v79) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultSharedPhotosSuccess"];
    }
  }
  else
  {
    v66 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "skipping fetching and saving shared p mom", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:17])
  {
    v81 = [(MOEventManager *)self _getEarliestDateForCategory:17];
    v82 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v82))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPhotoMemories", "", v337, 2u);
    }

    v83 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectPhotoMemories" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v83 startSession];
    v84 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "start fetching and saving photo memory", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v85 = dispatch_semaphore_create(0);
    v86 = [(MOEventManager *)self photoManager];
    v87 = +[NSDate dateWithTimeInterval:v81 sinceDate:0.0];
    v88 = [v224 laterDate:v87];
    id v89 = +[NSDate dateWithTimeInterval:v81 sinceDate:1.0];
    uint64_t v90 = [v223 laterDate:v89];
    v289[0] = _NSConcreteStackBlock;
    v289[1] = 3221225472;
    v289[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_296;
    v289[3] = &unk_1002D1A50;
    v293 = v329;
    v294 = buf;
    id v91 = v85;
    uint64_t v290 = v91;
    v291 = group;
    id v92 = v83;
    uint64_t v292 = v92;
    [v86 fetchAndSavePhotoMemoriesStartDate:v88 EndDate:v90 handler:v289];

    id v93 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1196, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v288 = 0;
    LOBYTE(v90) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v91, &v288, v93, 120.0);
    id v94 = v288;
    if ((v90 & 1) == 0)
    {
      id v95 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v94) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultPhotoMemorySuccess"];
    }
  }
  else
  {
    v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "skipping fetching and saving photo memory", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:9])
  {
    v96 = [(MOEventManager *)self _getEarliestDateForCategory:9];
    id v97 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v97))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsSharedWithYouItems", "", v337, 2u);
    }

    id v98 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectSharedWithYouItems" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v98 startSession];
    v99 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "start fetching and saving share with you items", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v100 = dispatch_semaphore_create(0);
    v101 = [(MOEventManager *)self sharedWithYouManager];
    v102 = +[NSDate dateWithTimeInterval:v96 sinceDate:0.0];
    v103 = [v224 laterDate:v102];
    id v104 = +[NSDate dateWithTimeInterval:v96 sinceDate:1.0];
    uint64_t v105 = [v223 laterDate:v104];
    v282[0] = _NSConcreteStackBlock;
    v282[1] = 3221225472;
    v282[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_300;
    v282[3] = &unk_1002D1A50;
    uint64_t v286 = v329;
    v287 = buf;
    v106 = v100;
    id v283 = v106;
    uint64_t v284 = group;
    v107 = v98;
    v285 = v107;
    [v101 fetchAndSaveSharedContentBetweenStartDate:v103 EndDate:v105 handler:v282];

    id v108 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1232, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v281 = 0;
    LOBYTE(v105) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v106, &v281, v108, 120.0);
    id v109 = v281;
    if ((v105 & 1) == 0)
    {
      id v110 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v109) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultSharedSuccess"];
    }
  }
  else
  {
    v96 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "skipping fetching and saving share with you items", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:8])
  {
    id v111 = [(MOEventManager *)self _getEarliestDateForCategory:8];
    id v112 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v112))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v112, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsTrips", "", v337, 2u);
    }

    id v113 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectTrips" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v113 startSession];
    id v114 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "start fetching and saving trips", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v115 = dispatch_semaphore_create(0);
    id v116 = [(MOEventManager *)self proactiveTravelManager];
    v117 = +[NSDate dateWithTimeInterval:v111 sinceDate:0.0];
    id v118 = [v224 laterDate:v117];
    v119 = +[NSDate dateWithTimeInterval:v111 sinceDate:1.0];
    uint64_t v120 = [v223 laterDate:v119];
    v275[0] = _NSConcreteStackBlock;
    v275[1] = 3221225472;
    v275[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_304;
    v275[3] = &unk_1002D1A50;
    v279 = v329;
    uint64_t v280 = buf;
    v121 = v115;
    v276 = v121;
    id v277 = group;
    v122 = v113;
    uint64_t v278 = v122;
    [v116 fetchAndSaveTripsBetweenStartDate:v118 EndDate:v120 handler:v275];

    v123 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1300, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v274 = 0;
    LOBYTE(v120) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v121, &v274, v123, 120.0);
    id v124 = v274;
    if ((v120 & 1) == 0)
    {
      v125 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v124) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultTripsSuccess"];
    }
  }
  else
  {
    id v111 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "skipping fetching and saving trips", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:6])
  {
    v126 = [(MOEventManager *)self _getEarliestDateForCategory:6];
    v127 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v127))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v127, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMusic", "", v337, 2u);
    }

    v128 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectMusic" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v128 startSession];
    v129 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_INFO, "start fetching and saving music", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v130 = dispatch_semaphore_create(0);
    id v131 = [(MOEventManager *)self nowPlayingMediaManager];
    id v132 = +[NSDate dateWithTimeInterval:v126 sinceDate:0.0];
    id v133 = [v224 laterDate:v132];
    id v134 = +[NSDate dateWithTimeInterval:v126 sinceDate:1.0];
    uint64_t v135 = [v223 laterDate:v134];
    v268[0] = _NSConcreteStackBlock;
    v268[1] = 3221225472;
    v268[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_305;
    v268[3] = &unk_1002D1A50;
    uint64_t v272 = v329;
    v273 = buf;
    id v136 = v130;
    v269 = v136;
    v270 = group;
    v137 = v128;
    id v271 = v137;
    [v131 fetchAndSaveMediaPlayEventsBetweenStartDate:v133 EndDate:v135 handler:v268];

    v138 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1336, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v267 = 0;
    LOBYTE(v135) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v136, &v267, v138, 120.0);
    id v139 = v267;
    if ((v135 & 1) == 0)
    {
      v140 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v139) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultMusicSuccess"];
    }
  }
  else
  {
    v126 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "skipping fetching and saving music", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:10])
  {
    v141 = [(MOEventManager *)self _getEarliestDateForCategory:10];
    id v142 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v142))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v142, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsContacts", "", v337, 2u);
    }

    id v143 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectContacts" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v143 startSession];
    id v144 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_INFO, "start fetching and saving contact events", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v145 = dispatch_semaphore_create(0);
    id v146 = [(MOEventManager *)self significantContactManager];
    id v147 = +[NSDate dateWithTimeInterval:v141 sinceDate:0.0];
    id v148 = [v224 laterDate:v147];
    v149 = +[NSDate dateWithTimeInterval:v141 sinceDate:1.0];
    uint64_t v150 = [v223 laterDate:v149];
    v261[0] = _NSConcreteStackBlock;
    v261[1] = 3221225472;
    v261[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_306;
    v261[3] = &unk_1002D1A50;
    id v265 = v329;
    uint64_t v266 = buf;
    v151 = v145;
    uint64_t v262 = v151;
    v263 = group;
    v152 = v143;
    v264 = v152;
    [v146 fetchAndSaveConversationsBetweenStartDate:v148 EndDate:v150 handler:v261];

    id v153 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1372, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v260 = 0;
    LOBYTE(v150) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v151, &v260, v153, 120.0);
    id v154 = v260;
    if ((v150 & 1) == 0)
    {
      id v155 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v154) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultContactsSuccess"];
    }
  }
  else
  {
    v141 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "skipping fetching and saving contact events", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:15])
  {
    id v156 = [(MOEventManager *)self _getEarliestDateForCategory:15];
    id v157 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v157))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v157, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsProximity", "", v337, 2u);
    }

    id v158 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectProximity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v158 startSession];
    v159 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_INFO, "start fetching and saving prox", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v160 = dispatch_semaphore_create(0);
    v161 = [(MOEventManager *)self peopleDiscoveryManager];
    v162 = +[NSDate dateWithTimeInterval:v156 sinceDate:0.0];
    v163 = [v224 laterDate:v162];
    id v164 = +[NSDate dateWithTimeInterval:v156 sinceDate:1.0];
    uint64_t v165 = [v223 laterDate:v164];
    v254[0] = _NSConcreteStackBlock;
    v254[1] = 3221225472;
    v254[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_307;
    v254[3] = &unk_1002D1A50;
    v258 = v329;
    id v259 = buf;
    id v166 = v160;
    v255 = v166;
    uint64_t v256 = group;
    id v167 = v158;
    v257 = v167;
    [v161 fetchAndSaveProxBetweenStartDate:v163 EndDate:v165 handler:v254];

    id v168 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1407, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v253 = 0;
    LOBYTE(v165) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v166, &v253, v168, 120.0);
    id v169 = v253;
    if ((v165 & 1) == 0)
    {
      v170 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v169) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultPeopleDiscoverySuccess"];
    }
  }
  else
  {
    id v156 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_INFO, "skipping fetching and saving prox", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:23])
  {
    v171 = [(MOEventManager *)self _getEarliestDateForCategory:23];
    v172 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v172))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v172, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPeopleDensity", "", v337, 2u);
    }

    v173 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectPeopleDensity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v173 startSession];
    id v174 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_INFO, "start fetching and saving people density events", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v175 = dispatch_semaphore_create(0);
    id v176 = [(MOEventManager *)self peopleDiscoveryManager];
    id v177 = +[NSDate dateWithTimeInterval:v171 sinceDate:0.0];
    id v178 = [v224 laterDate:v177];
    id v179 = +[NSDate dateWithTimeInterval:v171 sinceDate:1.0];
    uint64_t v180 = [v223 laterDate:v179];
    v247[0] = _NSConcreteStackBlock;
    v247[1] = 3221225472;
    v247[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_308;
    v247[3] = &unk_1002D1A50;
    v251 = v329;
    v252 = buf;
    v181 = v175;
    uint64_t v248 = v181;
    v249 = group;
    v182 = v173;
    uint64_t v250 = v182;
    [v176 fetchAndSavePeopleDensityEventsBetweenStartDate:v178 EndDate:v180 handler:v247];

    v183 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1443, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v246 = 0;
    LOBYTE(v180) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v181, &v246, v183, 120.0);
    id v184 = v246;
    if ((v180 & 1) == 0)
    {
      id v185 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v184) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultPeopleDensitySuccess"];
    }
  }
  else
  {
    v171 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_INFO, "skipping fetching and saving people density events", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:16])
  {
    id v186 = [(MOEventManager *)self _getEarliestDateForCategory:16];
    id v187 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v187))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v187, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMotionActivity", "", v337, 2u);
    }

    id v188 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectMotionActivity" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v188 startSession];
    id v189 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "start fetching and saving motion events", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v190 = dispatch_semaphore_create(0);
    v191 = [(MOEventManager *)self motionManager];
    v192 = +[NSDate dateWithTimeInterval:v186 sinceDate:0.0];
    v193 = [v224 laterDate:v192];
    v194 = +[NSDate dateWithTimeInterval:v186 sinceDate:1.0];
    uint64_t v195 = [v223 laterDate:v194];
    v240[0] = _NSConcreteStackBlock;
    v240[1] = 3221225472;
    v240[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_309;
    v240[3] = &unk_1002D1A50;
    uint64_t v244 = v329;
    v245 = buf;
    id v196 = v190;
    v241 = v196;
    uint64_t v242 = group;
    id v197 = v188;
    v243 = v197;
    [v191 fetchAndSaveMotionActivityBetweenStartDate:v193 EndDate:v195 handler:v240];

    id v198 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1479, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v239 = 0;
    LOBYTE(v195) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v196, &v239, v198, 120.0);
    id v199 = v239;
    if ((v195 & 1) == 0)
    {
      id v200 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v199) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultMotionSuccess"];
    }
  }
  else
  {
    id v186 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_INFO, "skipping fetching and saving motion events", v337, 2u);
    }
  }

  if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:22])
  {
    id v201 = [(MOEventManager *)self _getEarliestDateForCategory:22];
    id v202 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v202))
    {
      *(_WORD *)v337 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v202, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsLifeEvents", "", v337, 2u);
    }

    v203 = [[MOPerformanceMeasurement alloc] initWithName:@"CollectLifeEvents" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v203 startSession];
    v204 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_INFO, "start fetching and saving life events", v337, 2u);
    }

    dispatch_group_enter(group);
    dispatch_semaphore_t v205 = dispatch_semaphore_create(0);
    v206 = [(MOEventManager *)self lifeEventManager];
    id v207 = +[NSDate dateWithTimeInterval:v201 sinceDate:0.0];
    id v208 = [v224 laterDate:v207];
    id v209 = +[NSDate dateWithTimeInterval:v201 sinceDate:1.0];
    uint64_t v210 = [v223 laterDate:v209];
    v233[0] = _NSConcreteStackBlock;
    v233[1] = 3221225472;
    v233[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_310;
    v233[3] = &unk_1002D1A50;
    v237 = v329;
    v238 = buf;
    id v211 = v205;
    id v234 = v211;
    id v235 = group;
    id v212 = v203;
    id v236 = v212;
    [v206 fetchAndSaveLifeEventsBetweenStartDate:v208 endDate:v210 handler:v233];

    id v213 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1515, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]");
    id v232 = 0;
    LOBYTE(v210) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v211, &v232, v213, 120.0);
    id v214 = v232;
    if ((v210 & 1) == 0)
    {
      v215 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
    if (v214) {
      [*((id *)v332 + 5) setObject:&__kCFBooleanFalse forKey:@"resultLifeEventsSuccess"];
    }
  }
  else
  {
    id v201 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v201, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v337 = 0;
      _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_INFO, "skipping fetching and saving life events", v337, 2u);
    }
  }

  v216 = [(MOEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_311;
  block[3] = &unk_1002D1AC8;
  id v230 = buf;
  id v231 = v329;
  id v217 = v221;
  id v229 = v217;
  id v218 = v222;
  v228 = v218;
  dispatch_group_notify(group, v216, block);

  _Block_object_dispose(v329, 8);
  _Block_object_dispose(buf, 8);
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultWorkoutsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsWorkouts", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_289(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultMindfulSessionsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMindfullSessions", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_290(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "detectHindsightVisits, error, %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultVisitsSuccess"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v5))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Training", "", (uint8_t *)&v6, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultVisitsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Fetching", "", buf, 2u);
  }

  [*(id *)(a1 + 48) endSession];
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits", "", v12, 2u);
  }

  [*(id *)(a1 + 56) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultSharedPhotosSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsSharedPhotoMoments", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultPhotoMemorySuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPhotoMemories", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_300(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultSharedSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsSharedWithYouItems", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultTripsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsTrips", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_305(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultMusicSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMusic", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultContactsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsContacts", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultPeopleDiscoverySuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsProximity", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_308(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultPeopleDensitySuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPeopleDensity", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultMotionSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMotionActivity", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_310(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKey:@"resultLifeEventsSuccess"];
  }
  else
  {
    id v8 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v9 = v8;
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 intValue];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsLifeEvents", "", v11, 2u);
  }

  [*(id *)(a1 + 48) endSession];
}

id __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_311(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 setValue:v3 forKey:@"resultNumberOfEvents"];

  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "done with fetching events ", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", "", v8, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)storeEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerStoreEvents", "", buf, 2u);
  }

  id v9 = [[MOPerformanceMeasurement alloc] initWithName:@"StoreEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  id v10 = [(MOEventManager *)self eventStore];
  id v11 = [v10 persistenceManager];
  id v12 = [v11 availability];

  int v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  int v14 = v13;
  if (v12 == (id)2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "store events since datastore is available", buf, 2u);
    }

    dispatch_semaphore_t v15 = [(MOEventManager *)self eventStore];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __38__MOEventManager_storeEvents_handler___block_invoke;
    v19[3] = &unk_1002CE7A0;
    id v21 = v7;
    uint64_t v20 = v9;
    [v15 storeEvents:v6 CompletionHandler:v19];

    CFStringRef v16 = v21;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager storeEvents:handler:]();
    }

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"[storeEvents] database is not available";
    long long v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    CFStringRef v16 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v17];

    if (v7) {
      (*((void (**)(id, void *, void *))v7 + 2))(v7, v16, &__NSDictionary0__struct);
    }
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerStoreEvents", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
  }
}

void __38__MOEventManager_storeEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerStoreEvents", "", v9, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerFetchEvents", "", buf, 2u);
  }

  id v9 = [[MOPerformanceMeasurement alloc] initWithName:@"FetchEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  id v10 = [(MOEventManager *)self eventStore];
  id v11 = [v10 persistenceManager];
  id v12 = [v11 availability];

  int v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  int v14 = v13;
  if (v12 == (id)2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "fetch events since datastore is available", buf, 2u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __59__MOEventManager_fetchEventsWithOptions_CompletionHandler___block_invoke;
    v18[3] = &unk_1002CAD10;
    id v20 = v7;
    id v19 = v9;
    [(MOEventManager *)self _fetchEventsWithOptions:v6 CompletionHandler:v18];

    dispatch_semaphore_t v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager fetchEventsWithOptions:CompletionHandler:]();
    }

    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"database is not available";
    CFStringRef v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    dispatch_semaphore_t v15 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v16];

    if (v7) {
      (*((void (**)(id, void *, void *))v7 + 2))(v7, &__NSArray0__struct, v15);
    }
    long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerFetchEvents", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
  }
}

void __59__MOEventManager_fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerFetchEvents", "", v9, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)_fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MOEventManager *)self cachedEvents];
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = [v8 dateInterval];
    if (v12)
    {
      id v11 = [(MOEventManager *)self cacheStartDate];
      uint64_t v4 = [v8 dateInterval];
      id v5 = [v4 startDate];
      if ([v11 isOnOrBefore:v5])
      {

LABEL_11:
        id v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [(MOEventManager *)self cacheStartDate];
          id v21 = [(MOEventManager *)self cacheEndDate];
          NSErrorUserInfoKey v22 = [v8 dateInterval];
          CFStringRef v23 = [v22 startDate];
          CFStringRef v24 = [v8 dateInterval];
          unint64_t v25 = [v24 endDate];
          *(_DWORD *)buf = 138413058;
          id v42 = v20;
          __int16 v43 = 2112;
          id v44 = v21;
          __int16 v45 = 2112;
          id v46 = v23;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "cached events time window covers the query time window, so fetch data from cache, cache start date, %@, end date, %@, query start date, %@, end date, %@", buf, 0x2Au);
        }
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_324;
        v37[3] = &unk_1002CA140;
        id v38 = v9;
        [(MOEventManager *)self _fetchEventsFromCacheWithOptions:v8 CompletionHandler:v37];
        int v14 = v38;
        goto LABEL_17;
      }
    }
    dispatch_semaphore_t v15 = [(MOEventManager *)self cacheEndDate];
    CFStringRef v16 = [(MOEventManager *)self cacheStartDate];
    [v15 timeIntervalSinceDate:v16];
    double v18 = v17;

    if (v12)
    {
    }
    if (v18 > 2419200.0) {
      goto LABEL_11;
    }
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [(MOEventManager *)self cacheStartDate];
      long long v28 = [(MOEventManager *)self cacheEndDate];
      uint64_t v29 = [v8 dateInterval];
      dispatch_semaphore_t v30 = [v29 startDate];
      id v31 = [v8 dateInterval];
      id v32 = [v31 endDate];
      *(_DWORD *)buf = 138413058;
      id v42 = v27;
      __int16 v43 = 2112;
      id v44 = v28;
      __int16 v45 = 2112;
      id v46 = v30;
      __int16 v47 = 2112;
      id v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "cached events time window does not cover the query time window, so fetch part from cache and rehydrate rest, cache start date, %@, end date, %@, query start date, %@, end date, %@", buf, 0x2Au);
    }
    eventStore = self->_eventStore;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_325;
    v34[3] = &unk_1002D1B40;
    void v34[4] = self;
    id v36 = v9;
    id v35 = v8;
    [(MOEventStore *)eventStore fetchEventsWithOptions:v35 CompletionHandler:v34];

    int v14 = v36;
  }
  else
  {
    int v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "no events in cache so fetch data from database and rehydrate them or fetch interval is nil", buf, 2u);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke;
    v39[3] = &unk_1002CA140;
    id v40 = v9;
    [(MOEventManager *)self _fetchEventsFromDBAndRehydrateEventsWithOptions:v8 CompletionHandler:v39];
    int v14 = v40;
  }
LABEL_17:
}

uint64_t __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2;
  block[3] = &unk_1002D1B18;
  id v13 = v6;
  id v17 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = (void *)(a1 + 32);
  BOOL v3 = *(void *)(a1 + 32) == 0;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetched events count from store, %lu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v8 = objc_opt_new();
    id v9 = objc_opt_new();
    id v10 = [*(id *)(a1 + 48) cachedEvents];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_326;
    v38[3] = &unk_1002D14A8;
    id v26 = v8;
    id v39 = v26;
    id v11 = v9;
    id v40 = v11;
    [v10 enumerateObjectsUsingBlock:v38];

    long long v28 = objc_opt_new();
    uint64_t v27 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = *(id *)(a1 + 40);
    id v13 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v35;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(*(void *)(a1 + 48) + 128), "isAllowedToProcessEventCategory:", objc_msgSend(v16, "category")))
          {
            id v17 = [v16 eventIdentifier];
            double v18 = [v17 UUIDString];
            id v19 = [v11 objectForKeyedSubscript:v18];

            if (v19) {
              [v28 addObject:v19];
            }
            else {
              [v27 addObject:v16];
            }
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v13);
    }

    id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v28 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetched events count from cache after filtering authorized events, %lu", (uint8_t *)&buf, 0xCu);
    }

    NSErrorUserInfoKey v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v27 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetched events count from store which needes rehydration after filtering authorized events, %lu", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    __int16 v43 = __Block_byref_object_copy__37;
    id v44 = __Block_byref_object_dispose__37;
    id v45 = [v28 mutableCopy];
    CFStringRef v24 = *(void **)(a1 + 48);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_328;
    v29[3] = &unk_1002D1AF0;
    id v25 = v27;
    id v30 = v25;
    p_long long buf = &buf;
    id v31 = *(id *)(a1 + 56);
    id v32 = *(id *)(a1 + 64);
    [v24 _rehydrateEvents:v25 withHandler:v29];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, &__NSArray0__struct, *v2);
    }
  }
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_326(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventIdentifier];

  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v3 eventIdentifier];
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "event id: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 eventIdentifier];
    id v9 = [v8 UUIDString];
    [v7 addObject:v9];

    id v10 = *(void **)(a1 + 40);
    id v11 = [v3 eventIdentifier];
    id v12 = [v11 UUIDString];
    [v10 setObject:v3 forKey:v12];
  }
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    id v9 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134218240;
    id v16 = v8;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "rehydrated events count, %lu, input, %lu", buf, 0x16u);
  }

  if ([v5 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v5];
  }
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:[*(id *)(a1 + 40) ascending]];
  id v14 = v11;
  id v12 = +[NSArray arrayWithObjects:&v14 count:1];
  id v13 = [v10 sortedArrayUsingDescriptors:v12];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchEventsFromDBAndRehydrateEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  eventStore = self->_eventStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke;
  v9[3] = &unk_1002CE538;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(MOEventStore *)eventStore fetchEventsWithOptions:a3 CompletionHandler:v9];
}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_2;
  v12[3] = &unk_1002CB898;
  id v13 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v5;
  uint64_t v15 = v9;
  id v16 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, &__NSArray0__struct, *v2);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) count];
      *(_DWORD *)long long buf = 134217984;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetched events count from store, %lu", buf, 0xCu);
    }

    id v8 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = *(id *)(a1 + 40);
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([*(id *)(*(void *)(a1 + 48) + 128) isAllowedToProcessEventCategory:[v14 category]])[v8 addObject:v14]; {
        }
          }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v8 count];
      *(_DWORD *)long long buf = 134217984;
      id v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetched events count from store after filtering authorized events, %lu", buf, 0xCu);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_334;
    v19[3] = &unk_1002CE538;
    id v20 = v8;
    __int16 v17 = *(void **)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v18 = v8;
    [v17 _rehydrateEvents:v18 withHandler:v19];
  }
}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_334(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    id v9 = [*(id *)(a1 + 32) count];
    int v12 = 134218240;
    id v13 = v8;
    __int16 v14 = 2048;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "rehydrated events count, %lu, input, %lu", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if (v5) {
      id v11 = v5;
    }
    else {
      id v11 = &__NSArray0__struct;
    }
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
  }
}

- (void)_fetchEventsFromCacheWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOEventManager *)self cachedEvents];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [(MOEventManager *)self cachedEvents];
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", [v16 category]))
          {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
    }

    __int16 v17 = [MOEventFetchOptions alloc];
    id v18 = [v6 dateInterval];
    id v19 = [v6 ascending];
    id v20 = [v6 category];
    id v21 = [v6 limit];
    long long v22 = [(MOEventFetchOptions *)v17 initWithDateInterval:v18 ascending:v19 category:v20 limit:v21];

    eventStore = self->_eventStore;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke;
    v27[3] = &unk_1002CE2A8;
    v27[4] = self;
    id v28 = v10;
    id v29 = v6;
    id v30 = v7;
    id v24 = v10;
    [(MOEventStore *)eventStore fetchAnalyticsEventsWithOptions:v22 CompletionHandler:v27];
  }
  else
  {
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = @"no cached events";
    long long v25 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    long long v22 = +[NSError errorWithDomain:@"MOErrorDomain" code:19 userInfo:v25];

    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager _fetchEventsFromCacheWithOptions:CompletionHandler:]();
    }

    (*((void (**)(id, void *, MOEventFetchOptions *))v7 + 2))(v7, &__NSArray0__struct, v22);
  }
}

void __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke_2;
  v6[3] = &unk_1002C9A78;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    id v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fetched analytics events from store %lu", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:*(void *)(a1 + 32)];
  }
  uint64_t v4 = +[NSMutableArray array];
  id v5 = [*(id *)(a1 + 48) dateInterval];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) dateInterval];
    id v7 = [v6 endDate];
    id v8 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v7];
    v23[0] = v8;
    id v9 = [*(id *)(a1 + 48) dateInterval];
    id v10 = [v9 startDate];
    id v11 = +[NSPredicate predicateWithFormat:@"endDate >= %@", v10];
    v23[1] = v11;
    id v12 = +[NSArray arrayWithObjects:v23 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    [v4 addObject:v13];
  }
  if ([*(id *)(a1 + 48) category])
  {
    uint64_t v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"category == %lu", [*(id *)(a1 + 48) category]);
    [v4 addObject:v14];
  }
  if ([v4 count])
  {
    id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];
    [*(id *)(a1 + 40) filterUsingPredicate:v15];
  }
  id v16 = *(void **)(a1 + 40);
  id v17 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:[*(id *)(a1 + 48) ascending]];
  id v22 = v17;
  id v18 = +[NSArray arrayWithObjects:&v22 count:1];
  id v19 = [v16 sortedArrayUsingDescriptors:v18];

  id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [*(id *)(a1 + 40) count];
    *(_DWORD *)long long buf = 134217984;
    id v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetched events total count %lu", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)rehydrateEvents:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke(uint64_t a1)
{
  unsigned int v2 = [MOEventFetchOptions alloc];
  id v3 = objc_alloc((Class)NSDateInterval);
  uint64_t v4 = +[NSDate distantPast];
  id v5 = +[NSDate distantFuture];
  id v6 = [v3 initWithStartDate:v4 endDate:v5];
  id v7 = [(MOEventFetchOptions *)v2 initWithDateInterval:v6 ascending:1 category:0 limit:0];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_2;
  v11[3] = &unk_1002CAD60;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  id v14 = *(id *)(a1 + 48);
  [v8 _fetchEventsFromCacheWithOptions:v7 CompletionHandler:v11];
}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = objc_opt_new();
  id v3 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v10 = [v9 eventIdentifier];
        [v2 setObject:v9 forKey:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v6);
  }

  id v11 = [v2 allKeys];
  id v12 = +[NSMutableSet setWithArray:v11];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v34 = a1;
  uint64_t v13 = [*(id *)(a1 + 40) cachedEvents];
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        id v19 = [v18 eventIdentifier];
        unsigned int v20 = [v12 containsObject:v19];

        if (v20)
        {
          id v21 = [v18 eventIdentifier];
          [v3 setObject:v18 forKey:v21];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v15);
  }

  id v22 = [v3 count];
  long long v23 = [v3 allKeys];
  id v24 = +[NSSet setWithArray:v23];
  [v12 minusSet:v24];

  id v25 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = [v2 objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * (void)k)];
        [v25 addObject:v31];
      }
      id v28 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v28);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_3;
  v35[3] = &unk_1002D1B68;
  id v36 = v3;
  id v39 = v22;
  id v40 = [v25 count];
  long long v32 = *(void **)(v34 + 40);
  id v37 = *(id *)(v34 + 32);
  id v38 = *(id *)(v34 + 48);
  id v33 = v3;
  [v32 _rehydrateEvents:v25 withHandler:v35];
}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) allValues];
  [v7 addObjectsFromArray:v8];

  [v7 addObjectsFromArray:v5];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [v5 count];
    id v13 = [v7 count];
    id v14 = [*(id *)(a1 + 40) count];
    int v15 = 134219008;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    id v20 = v12;
    __int16 v21 = 2048;
    id v22 = v13;
    __int16 v23 = 2048;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "rehydrateEvents, from cache, %lu, not cached, %lu, rehydratedEvents, %lu, total rehydratedEvents, %lu, total events, %lu", (uint8_t *)&v15, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_rehydrateEvents:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v23 = v6;
  if ([v6 count])
  {
    __int16 v21 = v7;
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEvents", "", buf, 2u);
    }

    id v22 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateEvents" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v22 startSession];
    *(void *)long long buf = 0;
    long long v42 = buf;
    uint64_t v43 = 0x3032000000;
    long long v44 = __Block_byref_object_copy__37;
    long long v45 = __Block_byref_object_dispose__37;
    id v46 = objc_alloc_init((Class)NSMutableDictionary);
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__37;
    void v39[4] = __Block_byref_object_dispose__37;
    id v40 = 0;
    id v9 = dispatch_group_create();
    [(MOEventManager *)self splitEventArrayByCategory:v6];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v36;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          int v15 = [v10 objectForKey:v14];
          if ([v15 count])
          {
            dispatch_group_enter(v9);
            uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              id v17 = [v15 count];
              *(_DWORD *)long long v47 = 138412546;
              uint64_t v48 = v14;
              __int16 v49 = 2048;
              id v50 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_rehydrateEventsAtSingleSource, START, keyword, %@, original events count, %lu", v47, 0x16u);
            }

            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke;
            v30[3] = &unk_1002D1BB8;
            v30[4] = self;
            v30[5] = v14;
            id v33 = buf;
            uint64_t v34 = v39;
            id v18 = v15;
            id v31 = v18;
            long long v32 = v9;
            [(MOEventManager *)self _rehydrateEventsBySingleSource:v18 handler:v30];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v11);
    }

    __int16 v19 = [(MOEventManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_355;
    block[3] = &unk_1002D1BE0;
    void block[4] = self;
    id v27 = v21;
    id v28 = buf;
    uint64_t v29 = v39;
    id v25 = v23;
    id v26 = v22;
    id v20 = v22;
    dispatch_group_notify(v9, v19, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    id v7 = v21;
  }
  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
}

void __47__MOEventManager__rehydrateEvents_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_2;
  block[3] = &unk_1002D1B90;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v8;
  long long v18 = *(_OWORD *)(a1 + 64);
  id v15 = v6;
  id v16 = v9;
  id v17 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v5 = *(void *)(v3 + 40);
  id v4 = (id *)(v3 + 40);
  if (!v5)
  {
    id v6 = *(void **)(a1 + 48);
    if (v6) {
      objc_storeStrong(v4, v6);
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 56) count];
      id v12 = [*(id *)(a1 + 32) count];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v29 = v10;
      __int16 v30 = 2048;
      id v31 = v11;
      __int16 v32 = 2048;
      id v33 = v12;
      __int16 v34 = 2112;
      uint64_t v35 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_rehydrateEventsAtSingleSource, DONE, keyword, %@, original events count, %lu, rehydrated events count, %lu, error, %@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 56) count];
    id v16 = [*(id *)(a1 + 32) count];
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138413058;
    uint64_t v29 = v14;
    __int16 v30 = 2048;
    id v31 = v15;
    __int16 v32 = 2048;
    id v33 = v16;
    __int16 v34 = 2112;
    uint64_t v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_rehydrateEventsAtSingleSource, DONE, keyword, %@, original events count, %lu, rehydrated events count, %lu, error, %@", buf, 0x2Au);
  }

  long long v18 = [MORehydrationMetrics alloc];
  __int16 v19 = [*(id *)(a1 + 56) firstObject];
  id v20 = [v19 category];
  __int16 v21 = [*(id *)(a1 + 56) firstObject];
  id v22 = [v21 provider];
  BOOL v23 = *(void *)(a1 + 32) != 0;
  id v24 = [*(id *)(a1 + 48) description];
  id v25 = [[MORehydrationMetrics alloc] initWithCategory:v18 provider:v20 spiSuccess:v23 spiError:v24 failCount:[*(id *)(a1 + 56) count] successAfterPreFailCount:2 totalCount:[*(id *)(a1 + 56) count]- [*(id *)(a1 + 32) count] rehydrationTrigger:0.0];

  id v27 = 0;
  [(MORehydrationMetrics *)v25 submitMetricsWithError:&v27];
  id v26 = v27;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

id __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_355(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) mergeEventArraysFromDict:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [*(id *)(a1 + 40) count];
      id v5 = [v2 count];
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      int v9 = 134218498;
      id v10 = v4;
      __int16 v11 = 2048;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_rehydrateEvents, DONE, all original events count, %lu, all rehydrated events count, %lu, error, %@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEvents", "", (uint8_t *)&v9, 2u);
  }

  return [*(id *)(a1 + 48) endSession];
}

- (void)_rehydrateEventsBySingleSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    if ([v6 count])
    {
      uint64_t v8 = [v6 firstObject];
      id v9 = [v8 provider];

      if (v9 == (id)5)
      {
LABEL_4:
        v7[2](v7, v6, 0);
        goto LABEL_72;
      }
      id v10 = [v6 firstObject];
      id v11 = [v10 category];

      if ([(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:v11])
      {
        switch((unint64_t)v11)
        {
          case 0uLL:
            uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            goto LABEL_70;
          case 1uLL:
            long long v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v18))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsVisits", "", buf, 2u);
            }

            __int16 v19 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateVisits" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v19 startSession];
            id v20 = [(MOEventManager *)self routineServiceManager];
            v99[0] = _NSConcreteStackBlock;
            v99[1] = 3221225472;
            v99[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke;
            v99[3] = &unk_1002D1B40;
            v99[4] = self;
            dispatch_semaphore_t v100 = v19;
            v101 = v7;
            __int16 v21 = v19;
            [v20 rehydrateVisits:v6 handler:v99];

            goto LABEL_72;
          case 2uLL:
          case 0xDuLL:
            id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v12))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsWorkouts", "", buf, 2u);
            }

            __int16 v13 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateWorkouts" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v13 startSession];
            uint64_t v14 = [(MOEventManager *)self healthKitManager];
            v96[0] = _NSConcreteStackBlock;
            v96[1] = 3221225472;
            v96[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_362;
            v96[3] = &unk_1002CAD10;
            id v97 = v13;
            id v98 = v7;
            id v15 = v13;
            [v14 rehydrateWorkouts:v6 handler:v96];

            id v16 = v98;
            goto LABEL_66;
          case 4uLL:
            id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsLeisureMedia", "", buf, 2u);
            }

            BOOL v23 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateLeisureMedia" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v23 startSession];
            id v24 = [(MOEventManager *)self nowPlayingMediaManager];
            v90[0] = _NSConcreteStackBlock;
            v90[1] = 3221225472;
            v90[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_370;
            v90[3] = &unk_1002CAD10;
            id v91 = v23;
            id v92 = v7;
            id v15 = v23;
            [v24 rehydratedMediaPlayEvents:v6 handler:v90];

            id v16 = v92;
            goto LABEL_66;
          case 5uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
            goto LABEL_4;
          case 6uLL:
            id v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v25))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsMediaPlaySessions", "", buf, 2u);
            }

            id v26 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateMediaPlaySessions" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v26 startSession];
            id v27 = [(MOEventManager *)self nowPlayingMediaManager];
            v93[0] = _NSConcreteStackBlock;
            v93[1] = 3221225472;
            v93[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_366;
            v93[3] = &unk_1002CAD10;
            id v94 = v26;
            id v95 = v7;
            id v15 = v26;
            [v27 rehydratedMediaPlayEvents:v6 handler:v93];

            id v16 = v95;
            goto LABEL_66;
          case 7uLL:
            break;
          case 8uLL:
            id v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsTrips", "", buf, 2u);
            }

            id v15 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateTrips" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v15 startSession];
            uint64_t v29 = [(MOEventManager *)self proactiveTravelManager];
            __int16 v30 = [v29 rehydratedTripEvents:v6];
            v7[2](v7, v30, 0);

            id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (!os_signpost_enabled(v31)) {
              goto LABEL_43;
            }
            *(_WORD *)long long buf = 0;
            __int16 v32 = "EventManagerRehydrateEventsTrips";
            goto LABEL_42;
          case 9uLL:
            id v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v33))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSharedWithYouItems", "", buf, 2u);
            }

            id v15 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateSharedWithYou" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v15 startSession];
            __int16 v34 = [(MOEventManager *)self sharedWithYouManager];
            uint64_t v35 = [v34 rehydratedSharedContentEvents:v6];
            v7[2](v7, v35, 0);

            id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (!os_signpost_enabled(v31)) {
              goto LABEL_43;
            }
            *(_WORD *)long long buf = 0;
            __int16 v32 = "EventManagerRehydrateEventsSharedWithYouItems";
            goto LABEL_42;
          case 0xAuLL:
            long long v36 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v36))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSignificantContact", "", buf, 2u);
            }

            long long v37 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateSignificantContact" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v37 startSession];
            long long v38 = [(MOEventManager *)self significantContactManager];
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_380;
            v87[3] = &unk_1002CAD10;
            v88 = v37;
            id v89 = v7;
            id v15 = v37;
            [v38 rehydrateConversations:v6 handler:v87];

            id v16 = v89;
            goto LABEL_66;
          case 0xBuLL:
            id v39 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v39))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsStructuredEvent", "", buf, 2u);
            }

            id v15 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateStructuredEvent" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v15 startSession];
            id v40 = [(MOEventManager *)self suggestedEventManager];
            long long v41 = [v40 rehydratedSuggestedEvents:v6];
            v7[2](v7, v41, 0);

            id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (!os_signpost_enabled(v31)) {
              goto LABEL_43;
            }
            *(_WORD *)long long buf = 0;
            __int16 v32 = "EventManagerRehydrateEventsStructuredEvent";
            goto LABEL_42;
          case 0xCuLL:
            long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v42))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsNLEvent", "", buf, 2u);
            }

            id v15 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateNLEvent" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v15 startSession];
            uint64_t v43 = [(MOEventManager *)self suggestedEventManager];
            long long v44 = [v43 rehydratedSuggestedEvents:v6];
            v7[2](v7, v44, 0);

            id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (!os_signpost_enabled(v31)) {
              goto LABEL_43;
            }
            *(_WORD *)long long buf = 0;
            __int16 v32 = "EventManagerRehydrateEventsNLEvent";
LABEL_42:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 1uLL, v32, "", buf, 2u);
LABEL_43:

            [(MOPerformanceMeasurement *)v15 endSession];
            goto LABEL_67;
          case 0xEuLL:
            long long v45 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v45))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSharedPhoto", "", buf, 2u);
            }

            id v46 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateSharedPhoto" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v46 startSession];
            long long v47 = [(MOEventManager *)self photoManager];
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472;
            v84[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_390;
            v84[3] = &unk_1002CAD10;
            dispatch_semaphore_t v85 = v46;
            v86 = v7;
            id v15 = v46;
            [v47 rehydrateSharedPhotos:v6 handler:v84];

            id v16 = v86;
            goto LABEL_66;
          case 0xFuLL:
            uint64_t v48 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v48))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsProximity", "", buf, 2u);
            }

            __int16 v49 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateProximity" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v49 startSession];
            id v50 = [(MOEventManager *)self peopleDiscoveryManager];
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_402;
            v75[3] = &unk_1002CAD10;
            v76 = v49;
            v77 = v7;
            id v15 = v49;
            [v50 rehydrateProx:v6 handler:v75];

            id v16 = v77;
            goto LABEL_66;
          case 0x10uLL:
            if ([(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"MODevEnableMotionActivity" withFallback:1])
            {
              long long v51 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
              if (os_signpost_enabled(v51))
              {
                *(_WORD *)long long buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsMotionActivity", "", buf, 2u);
              }

              long long v52 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateMotionActivity" measureRecentPeak:0];
              [(MOPerformanceMeasurement *)v52 startSession];
              v53 = [(MOEventManager *)self motionManager];
              v81[0] = _NSConcreteStackBlock;
              v81[1] = 3221225472;
              v81[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_394;
              v81[3] = &unk_1002CAD10;
              v82 = v52;
              v83 = v7;
              id v15 = v52;
              [v53 rehydrateMotionActivity:v6 handler:v81];

              id v16 = v83;
LABEL_66:

LABEL_67:
              goto LABEL_72;
            }
            uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "rehydrateEvent at single source is disabled for motion activity.", buf, 2u);
            }
LABEL_70:

            break;
          case 0x11uLL:
            dispatch_semaphore_t v54 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v54))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsPhotoMemory", "", buf, 2u);
            }

            v55 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydratePhotoMemory" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v55 startSession];
            v56 = [(MOEventManager *)self photoManager];
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472;
            v78[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_398;
            v78[3] = &unk_1002CAD10;
            id v79 = v55;
            v80 = v7;
            id v15 = v55;
            [v56 rehydratePhotoMemories:v6 handler:v78];

            id v16 = v80;
            goto LABEL_66;
          case 0x16uLL:
            v57 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v57))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsLifeEvent", "", buf, 2u);
            }

            v58 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateLifeEvent" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v58 startSession];
            uint64_t v59 = [(MOEventManager *)self lifeEventManager];
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_410;
            v69[3] = &unk_1002CAD10;
            dispatch_semaphore_t v70 = v58;
            v71 = v7;
            id v15 = v58;
            [v59 rehydrateLifeEvents:v6 handler:v69];

            id v16 = v71;
            goto LABEL_66;
          case 0x17uLL:
            v60 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v60))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsPeopleDensity", "", buf, 2u);
            }

            v61 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydratePeopleDensity" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v61 startSession];
            v62 = [(MOEventManager *)self peopleDiscoveryManager];
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_406;
            v72[3] = &unk_1002CAD10;
            v73 = v61;
            v74 = v7;
            id v15 = v61;
            [v62 rehydratePeopleDensityEvents:v6 handler:v72];

            id v16 = v74;
            goto LABEL_66;
          case 0x18uLL:
            v63 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            if (os_signpost_enabled(v63))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsStateOfMind", "", buf, 2u);
            }

            unint64_t v64 = [[MOPerformanceMeasurement alloc] initWithName:@"RehydrateStateOfMind" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v64 startSession];
            v65 = [(MOEventManager *)self healthKitManager];
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_414;
            v66[3] = &unk_1002CAD10;
            v67 = v64;
            v68 = v7;
            id v15 = v64;
            [v65 rehydrateStateOfMind:v6 handler:v66];

            id v16 = v68;
            goto LABEL_66;
          default:
            uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
LABEL_11:
            }
              -[MOEventManager _rehydrateEventsBySingleSource:handler:]();
            goto LABEL_70;
        }
      }
    }
    v7[2](v7, &__NSArray0__struct, 0);
  }
LABEL_72:
}

void __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
    id v7 = a2;
    v6(v5, v7, a3);

    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsVisits", "", v12, 2u);
    }

    [*(id *)(a1 + 40) endSession];
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = a2;
    id v11 = [v9 weatherManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_2;
    v13[3] = &unk_1002CAD10;
    id v15 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    [v11 rehydrateWeather:v10 handler:v13];
  }
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsVisits", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_362(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsWorkouts", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_366(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsMediaPlaySessions", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_370(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsLeisureMedia", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_380(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsSignificantContact", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_390(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsSharedPhoto", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_394(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsMotionActivity", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_398(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsPhotoMemory", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_402(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsProximity", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_406(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsPeopleDensity", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_410(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsLifeEvent", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_414(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsStateOfMind", "", v4, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCleanUpEvents", "", buf, 2u);
  }

  uint64_t v8 = [[MOPerformanceMeasurement alloc] initWithName:@"Cleanup" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v8 startSession];
  id v9 = [(MOEventManager *)self eventStore];
  id v10 = [v9 persistenceManager];
  id v11 = [v10 availability];

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  __int16 v13 = v12;
  if (v11 == (id)2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge event since datastore is available", buf, 2u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __61__MOEventManager_cleanUpEventsWithRefreshVariant_andHandler___block_invoke;
    v18[3] = &unk_1002CE7A0;
    id v20 = v6;
    __int16 v19 = v8;
    [(MOEventManager *)self _cleanUpEventsWithRefreshVariant:a3 andHandler:v18];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MOEventManager cleanUpEventsWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"[cleanUpEventsWithRefreshVariant] database is not available";
      id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v15 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v14];

      CFStringRef v22 = @"stateDatabaseAvailable";
      BOOL v23 = &__kCFBooleanFalse;
      id v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v15, v16);
    }
    uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCleanUpEvents", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v8 endSession];
  }
}

void __61__MOEventManager_cleanUpEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 mutableCopy];
  [v6 setObject:&__kCFBooleanTrue forKey:@"stateDatabaseAvailable"];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCleanUpEvents", "", v9, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)_cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x3032000000;
  v102[3] = __Block_byref_object_copy__37;
  v102[4] = __Block_byref_object_dispose__37;
  id v103 = objc_alloc_init((Class)NSMutableDictionary);
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  int v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = __Block_byref_object_copy__37;
  v98[4] = __Block_byref_object_dispose__37;
  id v99 = 0;
  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v9 = v8;
  v56 = v6;
  unint64_t v10 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsWrapper", "", buf, 2u);
  }

  id v11 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v11 startSession];
  v55 = v11;
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  __int16 v13 = v12;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsExpiredEvents", "", buf, 2u);
  }

  id v14 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupExpiredEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v14 startSession];
  dispatch_group_enter(v7);
  eventStore = self->_eventStore;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke;
  v91[3] = &unk_1002D1C08;
  id v94 = v98;
  id v95 = v100;
  id v16 = v7;
  id v92 = v16;
  unint64_t v96 = a3;
  dispatch_semaphore_t v54 = v14;
  id v93 = v54;
  [(MOEventStore *)eventStore purgeExpiredEventsWithCompletionHandler:v91];
  uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  long long v18 = v17;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsUnknownEvents", "", buf, 2u);
  }

  __int16 v19 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupUnknownEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v19 startSession];
  dispatch_group_enter(v16);
  id v20 = self->_eventStore;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_430;
  v85[3] = &unk_1002D1C08;
  v88 = v98;
  id v89 = v100;
  __int16 v21 = v16;
  v86 = v21;
  unint64_t v90 = a3;
  v53 = v19;
  v87 = v53;
  [(MOEventStore *)v20 purgeUnknownEventsWithCompletionHandler:v85];
  CFStringRef v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  BOOL v23 = v22;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsDeletedPatternEvents", "", buf, 2u);
  }

  NSErrorUserInfoKey v24 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupPatternDeletedEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v24 startSession];
  dispatch_group_enter(v21);
  CFStringRef v25 = [(MOEventManager *)self configurationManager];
  id v26 = [v25 getIntegerSettingForKey:@"EventManagerOverridePatternRehydrationFailureCountThreshold" withFallback:10];

  id v27 = self->_eventStore;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_437;
  v79[3] = &unk_1002D1C08;
  v82 = v98;
  v83 = v100;
  id v28 = v21;
  v80 = v28;
  unint64_t v84 = a3;
  uint64_t v29 = v24;
  v81 = v29;
  [(MOEventStore *)v27 purgeRehydrationFailedEventsForType:@"Pattern_event" rehydrationFailCount:v26 CompletionHandler:v79];
  __int16 v30 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v31 = v30;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsDeletedEvents", "", buf, 2u);
  }

  __int16 v32 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupDeletedEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v32 startSession];
  dispatch_group_enter(v28);
  id v33 = [(MOEventManager *)self configurationManager];
  id v34 = [v33 getIntegerSettingForKey:@"EventManagerOverrideEventsRehydrationFailureCountThreshold" withFallback:10];

  uint64_t v35 = self->_eventStore;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_444;
  v73[3] = &unk_1002D1C08;
  v76 = v98;
  v77 = v100;
  long long v36 = v28;
  v74 = v36;
  unint64_t v78 = a3;
  long long v37 = v32;
  uint64_t v75 = v37;
  [(MOEventStore *)v35 purgeRehydrationFailedEventsForType:@"Sensed_event" rehydrationFailCount:v34 CompletionHandler:v73];
  long long v38 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v39 = v38;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", "", buf, 2u);
  }

  id v40 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanupVisitEventsClearedInRoutine" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v40 startSession];
  dispatch_group_enter(v36);
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  long long v42 = [(MOEventManager *)self routineServiceManager];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_448;
  v65[3] = &unk_1002D1C58;
  uint64_t v43 = v41;
  v66 = v43;
  long long v44 = v36;
  v67 = v44;
  unint64_t v72 = a3;
  long long v45 = v40;
  v68 = v45;
  v69 = self;
  dispatch_semaphore_t v70 = v98;
  v71 = v100;
  [v42 fetchEarliestVisitDateInRoutineWithHandler:v65];

  id v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 2183, "-[MOEventManager _cleanUpEventsWithRefreshVariant:andHandler:]");
  id v64 = 0;
  BOOL v47 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v43, &v64, v46, 120.0);
  id v48 = v64;
  if (!v47)
  {
    __int16 v49 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  id v50 = [(MOEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_451;
  block[3] = &unk_1002D1C80;
  v60 = v102;
  v61 = v100;
  v62 = v98;
  unint64_t v63 = a3;
  v58 = v55;
  id v59 = v56;
  long long v51 = v55;
  id v52 = v56;
  dispatch_group_notify(v44, v50, block);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);
  _Block_object_dispose(v102, 8);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v12 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v11 = v12;
    if (v12) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 intValue];
    }
    __int16 v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge expired events succeeded", buf, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "EventManagerCleanUpEventsExpiredEvents", "", v17, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_430(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_430_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v12 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v11 = v12;
    if (v12) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 intValue];
    }
    __int16 v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge unknown events succeeded", buf, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "EventManagerCleanUpEventsUnknownEvents", "", v17, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_437(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_437_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v12 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v11 = v12;
    if (v12) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 intValue];
    }
    __int16 v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge pattern events which failed rehydration times succeeded", buf, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "EventManagerCleanUpEventsDeletedPatternEvents", "", v17, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_444(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_444_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v12 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v11 = v12;
    if (v12) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 intValue];
    }
    __int16 v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge sensed events which failed rehydration multiple times succeeded", buf, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "EventManagerCleanUpEventsDeletedEvents", "", v17, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_448(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_448_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    uint64_t v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 80);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", "", buf, 2u);
    }

    [*(id *)(a1 + 48) endSession];
  }
  else
  {
    id v11 = *(void **)(*(void *)(a1 + 56) + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_449;
    v14[3] = &unk_1002D1C30;
    id v15 = v5;
    long long v19 = *(_OWORD *)(a1 + 64);
    id v16 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 80);
    id v17 = v12;
    uint64_t v20 = v13;
    id v18 = *(id *)(a1 + 48);
    [v11 purgeVisitEventsBeforeDate:v15 WithCompletionHandler:v14];
  }
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_449(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_449_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = v5;
    id v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v12 = [v6 objectForKey:@"resultNumberOfEvents"];
    id v11 = v12;
    if (v12) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v12 intValue];
    }
    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v18 = 138412546;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge visit events before date, %@,  succeeded with event count, %@", (uint8_t *)&v18, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 80);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v17, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", "", (uint8_t *)&v18, 2u);
  }

  [*(id *)(a1 + 56) endSession];
}

id __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_451(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 setObject:v3 forKey:@"resultNumberOfEvents"];

  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Purge event methods all completed", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "EventManagerCleanUpEventsWrapper", "", v10, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)_updateEventsDeletedAtSources:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__37;
  void v18[4] = __Block_byref_object_dispose__37;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  uint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEvents", "", buf, 2u);
  }

  id v6 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v6 startSession];
  eventStore = self->_eventStore;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke;
  v10[3] = &unk_1002D1CF8;
  v10[4] = self;
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = v6;
  id v11 = v9;
  uint64_t v13 = v18;
  uint64_t v14 = v16;
  [(MOEventStore *)eventStore fetchAllEventsWithCompletionHandler:v10];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2;
  block[3] = &unk_1002D1CD0;
  id v11 = v6;
  id v15 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, *v2, &__NSDictionary0__struct);
    }
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEvents", "", buf, 2u);
    }

    [*(id *)(a1 + 40) endSession];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 48) count];
      *(_DWORD *)long long buf = 134217984;
      id v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetched all events count to update events deleted at sources, %lu", buf, 0xCu);
    }

    id v9 = dispatch_group_create();
    id v10 = [*(id *)(a1 + 56) splitEventArrayByCategory:*(void *)(a1 + 48)];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v11)
    {
      id v13 = v11;
      uint64_t v14 = *(void *)v33;
      *(void *)&long long v12 = 138412546;
      long long v23 = v12;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v10);
          }
          long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          int v17 = [v10 objectForKey:v16 v23];
          if ([v17 count])
          {
            dispatch_group_enter(v9);
            int v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = [v17 count];
              *(_DWORD *)long long buf = v23;
              id v37 = v16;
              __int16 v38 = 2048;
              id v39 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "_updateEventsDeletedAtSources, START, keyword, %@, count, %lu", buf, 0x16u);
            }

            __int16 v20 = *(void **)(a1 + 56);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_455;
            v28[3] = &unk_1002D1A50;
            long long v31 = *(_OWORD *)(a1 + 72);
            v28[4] = v16;
            id v21 = v17;
            id v29 = v21;
            __int16 v30 = v9;
            [v20 _updateEventsDeletedAtSingleSource:v21 handler:v28];
          }
        }
        id v13 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v13);
    }
    CFStringRef v22 = [*(id *)(a1 + 56) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_456;
    block[3] = &unk_1002D1CA8;
    id v26 = *(id *)(a1 + 64);
    long long v27 = *(_OWORD *)(a1 + 72);
    id v25 = *(id *)(a1 + 40);
    dispatch_group_notify(v9, v22, block);
  }
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_455(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"spiPurgeFailure"];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:&__kCFBooleanFalse forKey:v5];
  }
  uint64_t v6 = [v4 objectForKey:@"resultNumberOfEvents"];
  uint64_t v7 = v6;
  if (v6) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v6 intValue];
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) count];
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_updateEventsDeletedAtSources, DONE, keyword, %@, count, %lu", (uint8_t *)&v11, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_456(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    [v2 setObject:v3 forKey:@"resultNumberOfEvents"];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEvents", "", v6, 2u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)_updateEventsDeletedAtSingleSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 firstObject];
    id v9 = [v8 provider];

    if (v9 != (id)5)
    {
      id v10 = [v6 firstObject];
      id v11 = [v10 category];

      switch((unint64_t)v11)
      {
        case 0uLL:
          uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          goto LABEL_14;
        case 1uLL:
        case 5uLL:
        case 8uLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x16uLL:
          uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            __int16 v13 = [v6 firstObject];
            id v14 = [v13 describeCategory];
            *(_DWORD *)long long buf = 138412290;
            v60 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No need to rehydrate and update event for category, %@.", buf, 0xCu);
          }
          goto LABEL_6;
        case 2uLL:
        case 0xDuLL:
          id v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v15))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsHealthKit", "", buf, 2u);
          }

          long long v16 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeHealthKit" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v16 startSession];
          int v17 = [(MOEventManager *)self healthKitManager];
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke;
          v56[3] = &unk_1002CE7A0;
          v57 = v16;
          id v58 = v7;
          int v18 = v16;
          [v17 updateWorkoutsDeletedAtSource:v6 handler:v56];

          id v19 = v58;
          goto LABEL_35;
        case 4uLL:
          __int16 v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsLeisureMedia", "", buf, 2u);
          }

          id v21 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeLeisureMedia" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v21 startSession];
          CFStringRef v22 = [(MOEventManager *)self nowPlayingMediaManager];
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_467;
          v50[3] = &unk_1002CE7A0;
          long long v51 = v21;
          id v52 = v7;
          int v18 = v21;
          [v22 updateMediaPlayEventsDeletedAtSource:v6 handler:v50];

          id v19 = v52;
          goto LABEL_35;
        case 6uLL:
          long long v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsMediaPlaySessions", "", buf, 2u);
          }

          NSErrorUserInfoKey v24 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeMediaPlaySessions" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v24 startSession];
          id v25 = [(MOEventManager *)self nowPlayingMediaManager];
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_463;
          v53[3] = &unk_1002CE7A0;
          dispatch_semaphore_t v54 = v24;
          id v55 = v7;
          int v18 = v24;
          [v25 updateMediaPlayEventsDeletedAtSource:v6 handler:v53];

          id v19 = v55;
          goto LABEL_35;
        case 9uLL:
          id v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSharedWithYouItems", "", buf, 2u);
          }

          long long v27 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeSharedWithYou" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v27 startSession];
          id v28 = [(MOEventManager *)self sharedWithYouManager];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_475;
          v44[3] = &unk_1002CE7A0;
          long long v45 = v27;
          id v46 = v7;
          int v18 = v27;
          [v28 updateSharedContentsDeletedAtSource:v6 handler:v44];

          id v19 = v46;
          goto LABEL_35;
        case 0xAuLL:
          id v29 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v29))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSignificantContact", "", buf, 2u);
          }

          __int16 v30 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeSignificantContact" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v30 startSession];
          long long v31 = [(MOEventManager *)self significantContactManager];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_479;
          v41[3] = &unk_1002CE7A0;
          long long v42 = v30;
          id v43 = v7;
          int v18 = v30;
          [v31 updateConversationsDeletedAtSource:v6 handler:v41];

          id v19 = v43;
          goto LABEL_35;
        case 0xEuLL:
          long long v32 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v32))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSharedPhoto", "", buf, 2u);
          }

          long long v33 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgeSharedPhoto" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v33 startSession];
          long long v34 = [(MOEventManager *)self photoManager];
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_471;
          v47[3] = &unk_1002CE7A0;
          id v48 = v33;
          id v49 = v7;
          int v18 = v33;
          [v34 updateSharedPhotoEventsDeletedAtSource:v6 handler:v47];

          id v19 = v49;
          goto LABEL_35;
        case 0x11uLL:
          long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          if (os_signpost_enabled(v35))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsPhotoMemory", "", buf, 2u);
          }

          long long v36 = [[MOPerformanceMeasurement alloc] initWithName:@"PurgePhotoMemory" measureRecentPeak:0];
          [(MOPerformanceMeasurement *)v36 startSession];
          id v37 = [(MOEventManager *)self photoManager];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_483;
          v38[3] = &unk_1002CE7A0;
          id v39 = v36;
          id v40 = v7;
          int v18 = v36;
          [v37 updatePhotoMemoriesEventsDeletedAtSource:v6 handler:v38];

          id v19 = v40;
LABEL_35:

          goto LABEL_9;
        default:
          uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_14:
          }
            -[MOEventManager _updateEventsDeletedAtSingleSource:handler:]();
LABEL_6:

          break;
      }
    }
  }
  if (v7) {
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }
LABEL_9:
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultWorkoutsSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsHealthKit", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_463(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultMusicSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsMediaPlaySessions", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_467(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultMusicSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsLeisureMedia", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_471(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultSharedPhotosSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSharedPhoto", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_475(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultSharedSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSharedWithYouItems", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_479(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultContactsSuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSignificantContact", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_483(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  if (v5)
  {
    [v7 setObject:@"resultPhotoMemorySuccess" forKey:@"spiPurgeFailure"];
  }
  else
  {
    id v9 = [v6 objectForKey:@"resultNumberOfEvents"];
    if (v9) {
      [v8 setObject:v9 forKey:@"resultNumberOfEvents"];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsPhotoMemory", "", v12, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (id)splitEventArrayByCategory:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 describeCategory];
        uint64_t v11 = [v9 describeProvider];
        uint64_t v12 = +[NSString stringWithFormat:@"%@:%@", v10, v11];

        __int16 v13 = [v4 allKeys];
        LOBYTE(v11) = [v13 containsObject:v12];

        if (v11)
        {
          id v14 = [v4 objectForKey:v12];
          [v14 addObject:v9];
        }
        else
        {
          id v14 = objc_opt_new();
          [v14 addObject:v9];
          [v4 setObject:v14 forKey:v12];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v15 = [v4 copy];

  return v15;
}

- (id)mergeEventArraysFromDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v3 allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 count]) {
          [v4 addObjectsFromArray:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)runAnalyticsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "run pattern detection", buf, 2u);
  }

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v10 = v9;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerAnalytics", "", buf, 2u);
  }

  uint64_t v11 = [[MOPerformanceMeasurement alloc] initWithName:@"Analytics" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v11 startSession];
  *(void *)long long buf = 0;
  __int16 v38 = buf;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__37;
  dispatch_semaphore_t v41 = __Block_byref_object_dispose__37;
  id v42 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = __Block_byref_object_copy__37;
  long long v35 = __Block_byref_object_dispose__37;
  id v36 = 0;
  long long v12 = [[MOEventRefreshHelper alloc] initWithUniverse:self->fUniverse];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke;
  v30[3] = &unk_1002CE0A0;
  v30[4] = buf;
  v30[5] = &v31;
  [(MOEventRefreshHelper *)v12 getPatternDetectorDatesForVariant:a3 withHandler:v30];
  if (*((void *)v38 + 5) && v32[5])
  {
    long long v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = *((void *)v38 + 5);
      uint64_t v16 = v32[5];
      int v17 = +[NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)id v43 = 138413058;
      id v44 = v14;
      __int16 v45 = 2112;
      uint64_t v46 = v15;
      __int16 v47 = 2112;
      uint64_t v48 = v16;
      __int16 v49 = 2112;
      id v50 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@, refresh startDate, %@, endDate, %@, refreshVariant, %@", v43, 0x2Au);
    }
    long long v18 = [MOEventFetchOptions alloc];
    id v19 = objc_alloc((Class)NSDateInterval);
    id v20 = [v19 initWithStartDate:*((void *)v38 + 5) endDate:v32[5]];
    long long v21 = [(MOEventFetchOptions *)v18 initWithDateInterval:v20 ascending:1 category:0 limit:0];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    void v23[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_493;
    v23[3] = &unk_1002D1D48;
    id v26 = v7;
    unint64_t v29 = a3;
    long long v27 = buf;
    id v28 = &v31;
    NSErrorUserInfoKey v24 = v11;
    id v25 = self;
    [(MOEventManager *)self fetchEventsWithOptions:v21 CompletionHandler:v23];
  }
  else
  {
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    CFStringRef v52 = @"analytics start or end date cannot be nil";
    CFStringRef v22 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    long long v21 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v22];

    if (v7) {
      (*((void (**)(id, MOEventFetchOptions *, void *))v7 + 2))(v7, v21, &__NSDictionary0__struct);
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(buf, 8);
}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_493(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  v119 = v5;
  if (!v5)
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 134217984;
      id v164 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched events count, %lu", buf, 0xCu);
    }

    if (![v4 count])
    {
      uint64_t v104 = *(void *)(a1 + 48);
      if (v104) {
        (*(void (**)(uint64_t, void, void *))(v104 + 16))(v104, 0, &__NSDictionary0__struct);
      }
      uint64_t v105 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      uint64_t v10 = v105;
      os_signpost_id_t v11 = *(void *)(a1 + 72);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v105)) {
        goto LABEL_100;
      }
      *(_WORD *)long long buf = 0;
      goto LABEL_9;
    }
    id v116 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    long long v12 = [[*(id *)(*(void *)(a1 + 40) + 176) processEvents:v4 withRefreshVariant:*[*(void *)(a1 + 72)]];
    long long v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v12 count];
      *(_DWORD *)long long buf = 134217984;
      id v164 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "pattern events count, %lu", buf, 0xCu);
    }

    id v118 = v12;
    if ([v12 count])
    {
      id v117 = v4;
      uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      uint64_t v16 = v15;
      os_signpost_id_t v17 = *(void *)(a1 + 72);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "EventManagerAnalyticsDeduplication", "", buf, 2u);
      }

      dispatch_semaphore_t v115 = [[MOPerformanceMeasurement alloc] initWithName:@"AnalyticsDedup" measureRecentPeak:0];
      [(MOPerformanceMeasurement *)v115 startSession];
      id v114 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %@", @"provider", 5, @"trends", 0];
      id v124 = [v4 filteredArrayUsingPredicate:];
      long long v18 = objc_opt_new();
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      id obj = v12;
      v122 = v18;
      id v125 = [obj countByEnumeratingWithState:&v157 objects:v162 count:16];
      if (v125)
      {
        uint64_t v123 = *(void *)v158;
        do
        {
          for (i = 0; i != v125; i = (char *)i + 1)
          {
            if (*(void *)v158 != v123) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v157 + 1) + 8 * i);
            long long v153 = 0u;
            long long v154 = 0u;
            long long v155 = 0u;
            long long v156 = 0u;
            id v21 = v124;
            id v145 = [v21 countByEnumeratingWithState:&v153 objects:v161 count:16];
            if (!v145)
            {

              goto LABEL_84;
            }
            v126 = i;
            int v141 = 0;
            id v142 = v20;
            uint64_t v143 = *(void *)v154;
            id v144 = v21;
            do
            {
              CFStringRef v22 = 0;
              do
              {
                if (*(void *)v154 != v143) {
                  objc_enumerationMutation(v21);
                }
                long long v23 = *(void **)(*((void *)&v153 + 1) + 8 * (void)v22);
                NSErrorUserInfoKey v24 = [v20 patterns];
                id v25 = [v24 objectForKeyedSubscript:@"kEventPatternType"];
                if ([v25 intValue])
                {
                }
                else
                {
                  id v26 = [v23 patterns];
                  long long v27 = [v26 objectForKeyedSubscript:@"kEventPatternType"];
                  unsigned int v28 = [v27 intValue];

                  id v20 = v142;
                  if (!v28)
                  {
                    id v55 = [v142 patterns];
                    v56 = [v55 objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];
                    v57 = [v23 patterns];
                    id v58 = [v57 objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];
                    if ([v56 isEqualToString:v58])
                    {
                      id v59 = [v142 patterns];
                      v60 = [v59 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
                      unsigned int v61 = [v60 intValue];
                      v62 = [v23 patterns];
                      unint64_t v63 = [v62 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
                      int v64 = v61 == [v63 intValue];
                    }
                    else
                    {
                      int v64 = 0;
                    }
                    id v21 = v144;
                    dispatch_semaphore_t v54 = context;

                    v141 += v64;
                    id v20 = v142;
                    goto LABEL_50;
                  }
                }
                unint64_t v29 = [v20 patterns];
                __int16 v30 = [v29 objectForKeyedSubscript:@"kEventPatternType"];
                if ([v30 intValue] == 1)
                {
                  uint64_t v31 = [v23 patterns];
                  long long v32 = [v31 objectForKeyedSubscript:@"kEventPatternType"];
                  unsigned int v33 = [v32 intValue];

                  if (v33 == 1)
                  {
                    if ([v20 category] != (id)2
                      || ([v23 patterns],
                          long long v34 = objc_claimAutoreleasedReturnValue(),
                          [v34 objectForKey:@"kEventPatternOverallWorkoutType"],
                          long long v35 = objc_claimAutoreleasedReturnValue(),
                          v35,
                          v34,
                          v35))
                    {
                      id v36 = [v20 category];
                      if (v36 == (id)2)
                      {
                        v140 = [v20 patterns];
                        id v37 = [v140 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
                        v138 = [v23 patterns];
                        [v138 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
                        v137 = id v139 = v37;
                        if (objc_msgSend(v37, "isEqualToString:"))
                        {
                          int v38 = 0;
                          goto LABEL_57;
                        }
                      }
                      if ([v20 category] != (id)10)
                      {
                        BOOL v71 = 0;
                        goto LABEL_69;
                      }
                      id v136 = [v20 patterns];
                      v65 = [v136 objectForKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
                      id v134 = [v23 patterns];
                      [v134 objectForKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
                      id v133 = v135 = v65;
                      if (objc_msgSend(v65, "isEqualToString:"))
                      {
                        int v38 = 1;
LABEL_57:
                        v66 = [v142 patterns];
                        v67 = [v66 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"];
                        unsigned int v68 = [v67 intValue];
                        v69 = [v23 patterns];
                        dispatch_semaphore_t v70 = [v69 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"];
                        BOOL v71 = v68 == [v70 intValue];

                        if (!v38)
                        {
LABEL_69:
                          if (v36 == (id)2)
                          {

                            id v20 = v142;
                            if (v71)
                            {
LABEL_73:
                              v73 = [v20 creationDate];
                              v74 = [v23 creationDate];
                              [v73 timeIntervalSinceDate:v74];
                              double v76 = v75;

                              v77 = [v20 patterns];
                              unint64_t v78 = [v77 objectForKeyedSubscript:@"kEventPatternTrendSlope"];
                              [v78 doubleValue];
                              double v80 = v79;
                              v81 = [v23 patterns];
                              v82 = [v81 objectForKeyedSubscript:@"kEventPatternTrendSlope"];
                              [v82 doubleValue];
                              double v84 = v80 * v83;

                              int v85 = v76 <= 604800.0;
                              if (v84 > 0.0) {
                                int v85 = 1;
                              }
                              v141 += v85;
                            }
                          }
                          else
                          {
                            id v20 = v142;
                            if (v71) {
                              goto LABEL_73;
                            }
                          }
LABEL_49:
                          id v21 = v144;
                          dispatch_semaphore_t v54 = context;
                          goto LABEL_50;
                        }
                      }
                      else
                      {
                        BOOL v71 = 0;
                      }

                      goto LABEL_69;
                    }
                    uint64_t v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Work out type doesn't exist in database for trend", buf, 2u);
                    }
LABEL_48:

                    goto LABEL_49;
                  }
                }
                else
                {
                }
                uint64_t v39 = [v20 patterns];
                id v40 = [v39 objectForKeyedSubscript:@"kEventPatternType"];
                if ([v40 intValue] != 2)
                {

                  goto LABEL_48;
                }
                dispatch_semaphore_t v41 = [v23 patterns];
                id v42 = [v41 objectForKeyedSubscript:@"kEventPatternType"];
                unsigned int v43 = [v42 intValue];

                if (v43 != 2) {
                  goto LABEL_49;
                }
                id v44 = [v23 patterns];
                __int16 v45 = [v44 objectForKey:@"kEventPatternOverallWorkoutType"];

                if (v45)
                {
                  id v46 = [v20 category];
                  if (v46 == [v23 category])
                  {
                    __int16 v47 = [v20 patterns];
                    uint64_t v48 = [v47 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
                    __int16 v49 = [v23 patterns];
                    id v50 = [v49 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
                    if ([v48 isEqualToString:v50])
                    {
                      id v132 = v47;
                      id v131 = [v20 patterns];
                      dispatch_semaphore_t v130 = [v131 objectForKeyedSubscript:@"kEventPatternRoutineDetectedWeeks"];
                      NSErrorUserInfoKey v51 = +[NSSet setWithArray:](NSSet, "setWithArray:");
                      v129 = [v23 patterns];
                      v128 = [v129 objectForKeyedSubscript:@"kEventPatternRoutineDetectedWeeks"];
                      CFStringRef v52 = +[NSSet setWithArray:](NSSet, "setWithArray:");
                      if ([v51 isEqualToSet:v52])
                      {
                        BOOL v53 = 1;
                      }
                      else
                      {
                        v127 = [v20 patterns];
                        [v127 objectForKeyedSubscript:@"kEventPatternRoutineStartingRoutine"];
                        v88 = v87 = v51;
                        id v89 = [v23 patterns];
                        unint64_t v90 = [v89 objectForKeyedSubscript:@"kEventPatternRoutineStartingRoutine"];
                        BOOL v53 = v88 == v90;

                        NSErrorUserInfoKey v51 = v87;
                      }
                      int v86 = v141;

                      __int16 v47 = v132;
                    }
                    else
                    {
                      BOOL v53 = 0;
                      int v86 = v141;
                    }

                    int v141 = v86 + v53;
                    id v20 = v142;
                  }
                  goto LABEL_49;
                }
                unint64_t v72 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
                id v21 = v144;
                dispatch_semaphore_t v54 = context;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Work out type  doesn't exist in database for routine", buf, 2u);
                }

LABEL_50:
                CFStringRef v22 = (char *)v22 + 1;
              }
              while (v145 != v22);
              id v91 = [v21 countByEnumeratingWithState:&v153 objects:v161 count:16];
              id v145 = v91;
            }
            while (v91);

            long long v18 = v122;
            i = v126;
            if (!v141) {
LABEL_84:
            }
              [v18 addObject:v20];
          }
          id v125 = [obj countByEnumeratingWithState:&v157 objects:v162 count:16];
        }
        while (v125);
      }

      id v92 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      id v93 = v92;
      os_signpost_id_t v94 = *(void *)(a1 + 72);
      if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_END, v94, "EventManagerAnalyticsDeduplication", "", buf, 2u);
      }

      [(MOPerformanceMeasurement *)v115 endSession];
      id v4 = v117;
      if ([v122 count])
      {
        id v95 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        unint64_t v96 = v95;
        os_signpost_id_t v97 = *(void *)(a1 + 72);
        if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v96, OS_SIGNPOST_INTERVAL_BEGIN, v97, "EventManagerAnalyticsStore", "", buf, 2u);
        }

        id v98 = [[MOPerformanceMeasurement alloc] initWithName:@"AnalyticsStore" measureRecentPeak:0];
        [(MOPerformanceMeasurement *)v98 startSession];
        id v99 = [*(id *)(a1 + 40) eventStore];
        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_509;
        v147[3] = &unk_1002D1D20;
        id v100 = *(id *)(a1 + 48);
        uint64_t v101 = *(void *)(a1 + 72);
        id v151 = v100;
        uint64_t v152 = v101;
        id v148 = v98;
        id v149 = *(id *)(a1 + 32);
        v102 = v122;
        id v150 = v122;
        id v103 = v98;
        [v99 storeEvents:v150 CompletionHandler:v147];

        id v4 = v117;
      }
      else
      {
        uint64_t v110 = *(void *)(a1 + 48);
        if (v110) {
          (*(void (**)(uint64_t, void, void *))(v110 + 16))(v110, 0, &__NSDictionary0__struct);
        }
        id v111 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        id v112 = v111;
        os_signpost_id_t v113 = *(void *)(a1 + 72);
        if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v112, OS_SIGNPOST_INTERVAL_END, v113, "EventManagerAnalytics", "", buf, 2u);
        }

        [*(id *)(a1 + 32) endSession];
        v102 = v122;
      }
    }
    else
    {
      uint64_t v106 = *(void *)(a1 + 48);
      if (v106) {
        (*(void (**)(uint64_t, void, void *))(v106 + 16))(v106, 0, &__NSDictionary0__struct);
      }
      v107 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      id v108 = v107;
      os_signpost_id_t v109 = *(void *)(a1 + 72);
      if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v108, OS_SIGNPOST_INTERVAL_END, v109, "EventManagerAnalytics", "", buf, 2u);
      }

      [*(id *)(a1 + 32) endSession];
    }

    goto LABEL_115;
  }
  if (v7)
  {
    *(_DWORD *)long long buf = 138412290;
    id v164 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "error, %@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, &__NSDictionary0__struct);
  }
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
    goto LABEL_100;
  }
  *(_WORD *)long long buf = 0;
LABEL_9:
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "EventManagerAnalytics", "", buf, 2u);
LABEL_100:

  [*(id *)(a1 + 32) endSession];
LABEL_115:
}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_509(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_509_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, &__NSDictionary0__struct);
    }
    uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    os_signpost_id_t v11 = v10;
    os_signpost_id_t v12 = *(void *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "EventManagerAnalyticsStore", "", (uint8_t *)&v18, 2u);
    }

    [*(id *)(a1 + 32) endSession];
    long long v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 64);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v15, "EventManagerAnalytics", "", (uint8_t *)&v18, 2u);
    }

    [*(id *)(a1 + 40) endSession];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v16 = [*(id *)(a1 + 48) count];
      int v18 = 134217984;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved patterns as events into database. %lu", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v6);
    }
  }
}

- (void)clearCache
{
  [(MOEventManager *)self setCachedEvents:0];
  [(MOEventManager *)self setCacheStartDate:0];

  [(MOEventManager *)self setCacheEndDate:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (void)setPhotoManager:(id)a3
{
}

- (void)setRoutineServiceManager:(id)a3
{
}

- (void)setHealthKitManager:(id)a3
{
}

- (void)setSharedWithYouManager:(id)a3
{
}

- (void)setSuggestedEventManager:(id)a3
{
}

- (void)setProactiveTravelManager:(id)a3
{
}

- (void)setNowPlayingMediaManager:(id)a3
{
}

- (void)setSignificantContactManager:(id)a3
{
}

- (void)setPeopleDiscoveryManager:(id)a3
{
}

- (void)setMotionManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void)setLifeEventManager:(id)a3
{
}

- (void)setWeatherManager:(id)a3
{
}

- (NSArray)cachedEvents
{
  return self->_cachedEvents;
}

- (void)setCachedEvents:(id)a3
{
}

- (NSDate)cacheStartDate
{
  return self->_cacheStartDate;
}

- (void)setCacheStartDate:(id)a3
{
}

- (NSDate)cacheEndDate
{
  return self->_cacheEndDate;
}

- (void)setCacheEndDate:(id)a3
{
}

- (MOEventPatternManager)patternManager
{
  return self->_patternManager;
}

- (void)setPatternManager:(id)a3
{
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_patternManager, 0);
  objc_storeStrong((id *)&self->_cacheEndDate, 0);
  objc_storeStrong((id *)&self->_cacheStartDate, 0);
  objc_storeStrong((id *)&self->_cachedEvents, 0);
  objc_storeStrong((id *)&self->_weatherManager, 0);
  objc_storeStrong((id *)&self->_lifeEventManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_significantContactManager, 0);
  objc_storeStrong((id *)&self->_nowPlayingMediaManager, 0);
  objc_storeStrong((id *)&self->_proactiveTravelManager, 0);
  objc_storeStrong((id *)&self->_suggestedEventManager, 0);
  objc_storeStrong((id *)&self->_sharedWithYouManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_photoManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->collectQueue, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: defaultsManager", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: patternManager", v2, v3, v4, v5, v6);
}

- (void)clearEventsWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to clear event since datastore is not available", v2, v3, v4, v5, v6);
}

- (void)collectEventsWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to collect event since datastore is not available", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetching trip bundle failed with error: %@, so no updates to the collecting/caching events window", v2, v3, v4, v5, v6);
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_277_cold_1()
{
  OUTLINED_FUNCTION_5_6(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "collecting new and unrehydrated events failed with error, %@", v2, v3, v4, v5, v6);
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_278_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "detected error when trying to remove old real time visits events, %@", v2, v3, v4, v5, v6);
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_282_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving new and unrehydrated events into database failed with error, %@", v2, v3, v4, v5, v6);
}

- (void)storeEvents:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to store event since datastore is not available", v2, v3, v4, v5, v6);
}

- (void)fetchEventsWithOptions:CompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to fetch event since datastore is not available", v2, v3, v4, v5, v6);
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_6(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch events from store hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_fetchEventsFromCacheWithOptions:CompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetched events from cache hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_rehydrateEventsBySingleSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "rehydrateEvent at single source has no known category.", v2, v3, v4, v5, v6);
}

- (void)cleanUpEventsWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "purge to collect event since datastore is not available", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge expired events hit error, %@", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_430_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge unknown events hit error, %@", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_437_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge pattern events which failed rehydration hit error, %@", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_444_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge sensed events which failed rehydration multiple times hit error, %@", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_448_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch earliest visit failed, %@, skip purging visit events", v2, v3, v4, v5, v6);
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_449_cold_1()
{
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "purge visit events before date, %@,  failed with error, %@", v2, 0x16u);
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_6(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch all events to update events deleted at sources hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_updateEventsDeletedAtSingleSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "update events at single source has no known category.", v2, v3, v4, v5, v6);
}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_509_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving patterns as events into database failed with error, %@", v2, v3, v4, v5, v6);
}

@end