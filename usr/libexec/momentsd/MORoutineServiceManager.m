@interface MORoutineServiceManager
+ (id)_timeZoneFromLocation:(id)a3;
- (BOOL)_shouldMarkAsPreOnboardedVisit:(id)a3;
- (BOOL)_visitAlreadyHaveValidEvent:(id)a3 Events:(id)a4;
- (GEOMapService)mapServiceManager;
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)universe;
- (MOEventStore)eventStore;
- (MORoutineServiceManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (RTLocation)homeLOI;
- (RTRoutineManager)routineManager;
- (double)_findMatchingFamiliarityIndexValue:(id)a3 forVisit:(id)a4;
- (id)_calculateDistanceFromHome:(id)a3;
- (id)_createEventFromVisit:(id)a3;
- (id)_findMatchingEventFor:(id)a3 inEvents:(id)a4;
- (id)_getLoiInfo:(id)a3;
- (id)_getVisitInfo:(id)a3;
- (id)_redactString:(id)a3;
- (id)_rehydrateStoreEvents:(id)a3 withVisits:(id)a4 familiarityIndex:(id)a5;
- (id)fetchHomeLOI;
- (id)findMatchingVisitFor:(id)a3 inVisits:(id)a4;
- (id)getPhotosCloseToHome:(id)a3 withDistance:(double)a4;
- (int)maxAllowedDaysForVisitLookback;
- (unint64_t)_placeInferencePlaceTypeFromMapItemPlaceType:(unint64_t)a3;
- (void)_checkAndFetchInvalidEvents:(id)a3 Events:(id)a4 handler:(id)a5;
- (void)_createEventsFromVisits:(id)a3 familiarityIndex:(id)a4 handler:(id)a5;
- (void)_createNewEventsFromVisits:(id)a3 familiarityIndex:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_detectHindsightVisitsWithCompletionHandler:(id)a3;
- (void)_fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchEarliestVisitDateInRoutineWithHandler:(id)a3;
- (void)_fetchFamiliarityIndexesLOIForDateInterval:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchGeoMapItemFromHandler:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchRealTimeVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_fetchRealTimeVisitsForStartDate:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_fetchVisitsBetweenStartDate:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_rehydrateVisits:(id)a3 handler:(id)a4;
- (void)_removeVisitsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)_setDynamicProperties:(id)a3 familiarityIndexResultsLOIs:(id)a4 visit:(id)a5;
- (void)_setDynamicProperties:(id)a3 visit:(id)a4;
- (void)detectHindsightVisitsWithCompletionHandler:(id)a3;
- (void)fetchAndSaveVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchConsolidatedEvents:(id)a3 withStored:(id)a4 handler:(id)a5;
- (void)fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchEarliestVisitDateInRoutineWithHandler:(id)a3;
- (void)fetchHomeLOI;
- (void)fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)rehydrateVisits:(id)a3 handler:(id)a4;
- (void)removeVisitsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMaxAllowedDaysForVisitLookback:(int)a3;
- (void)setRoutineManager:(id)a3;
- (void)setUniverse:(id)a3;
@end

@implementation MORoutineServiceManager

- (MORoutineServiceManager)initWithUniverse:(id)a3
{
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 getService:v8];

  if (!v9)
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MORoutineServiceManager.m" lineNumber:87 description:@"Invalid parameter not satisfying: configurationManager"];
    goto LABEL_12;
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v6 getService:v11];

  if (!v12)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager initWithUniverse:]();
    }

    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MORoutineServiceManager.m" lineNumber:93 description:@"Invalid parameter not satisfying: eventStore"];

LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  v27.receiver = self;
  v27.super_class = (Class)MORoutineServiceManager;
  v13 = [(MORoutineServiceManager *)&v27 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MORoutineServiceManager", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_eventStore, v12);
    objc_storeStrong((id *)&v13->_configurationManager, v9);
    uint64_t v17 = objc_opt_new();
    mapServiceManager = v13->_mapServiceManager;
    v13->_mapServiceManager = (GEOMapService *)v17;

    objc_storeStrong((id *)&v13->_universe, a3);
    v28[0] = GEOPOICategoryAirport;
    v28[1] = GEOPOICategoryAirportGate;
    v28[2] = GEOPOICategoryAirportTerminal;
    v19 = +[NSArray arrayWithObjects:v28 count:3];
    uint64_t v20 = +[NSSet setWithArray:v19];
    airportCategories = v13->_airportCategories;
    v13->_airportCategories = (NSSet *)v20;
  }
  self = v13;
  v22 = self;
LABEL_13:

  return v22;
}

- (RTRoutineManager)routineManager
{
  routineManager = self->_routineManager;
  if (!routineManager)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __41__MORoutineServiceManager_routineManager__block_invoke;
    block[3] = &unk_1002C98B8;
    block[4] = self;
    if (routineManager_onceToken != -1) {
      dispatch_once(&routineManager_onceToken, block);
    }
    routineManager = self->_routineManager;
  }

  return routineManager;
}

uint64_t __41__MORoutineServiceManager_routineManager__block_invoke(uint64_t a1)
{
  id v2 = [objc_alloc((Class)RTRoutineManager) initWithRestorationIdentifier:@"MORoutineServiceManagerClient"];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

- (void)fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MORoutineServiceManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MORoutineServiceManager_fetchStitchedVisitsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002C9A78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

id __89__MORoutineServiceManager_fetchStitchedVisitsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStitchedVisitsBetweenStartDate:*(void *)(a1 + 40) EndDate:*(void *)(a1 + 48) CompletionHandler:*(void *)(a1 + 56)];
}

- (void)_fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v10);

  if (v16 && v8)
  {
    id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v16 endDate:v8];
    id v12 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F5F30, 0];
    id v13 = objc_alloc((Class)RTStoredVisitFetchOptions);
    id v14 = +[NSNumber numberWithDouble:RTVisitConfidenceHigh];
    id v15 = [v13 initWithAscending:1 confidence:v14 dateInterval:v11 labelVisit:1 limit:0 sources:v12];

    [(MORoutineServiceManager *)self _fetchVisitsBetweenStartDate:v15 CompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)_fetchRealTimeVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v10);

  if (v16 && v8)
  {
    id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v16 endDate:v8];
    id v12 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F5F48, 0];
    id v13 = objc_alloc((Class)RTStoredVisitFetchOptions);
    id v14 = +[NSNumber numberWithDouble:RTVisitConfidenceHigh];
    id v15 = [v13 initWithAscending:1 confidence:v14 dateInterval:v11 labelVisit:1 limit:0 sources:v12];

    [(MORoutineServiceManager *)self _fetchRealTimeVisitsForStartDate:v15 CompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)detectHindsightVisitsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MORoutineServiceManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__MORoutineServiceManager_detectHindsightVisitsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1002CCDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __70__MORoutineServiceManager_detectHindsightVisitsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _detectHindsightVisitsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_detectHindsightVisitsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerVisitTrainingvisitTraining", "", buf, 2u);
  }

  v7 = [[MOPerformanceMeasurement alloc] initWithName:@"RoutineVisitTraining" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v7 startSession];
  id v8 = [(MORoutineServiceManager *)self routineManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1002CD928;
  id v12 = v7;
  id v13 = v4;
  id v9 = v7;
  id v10 = v4;
  [v8 processHindsightVisitsWithHandler:v11];
}

void __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 code] == (id)5 || objc_msgSend(v4, "code") == (id)8))
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke_cold_1();
    }

    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Provider database is unavailable";
    id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v7 = +[NSError errorWithDomain:@"MOErrorDomain" code:1088 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerVisitTrainingvisitTraining", "", v9, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_not_V2(v11);

  id v12 = [(MORoutineServiceManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __77__MORoutineServiceManager_fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke;
  v16[3] = &unk_1002C9A78;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

id __77__MORoutineServiceManager_fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDeviceLocationsFromStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  CFStringRef v11 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v9];
  LOBYTE(v18) = 1;
  id v13 = [objc_alloc((Class)RTStoredLocationEnumerationOptions) initWithDateInterval:v12 horizontalAccuracy:20 batchSize:0 boundingBoxLocation:14 type:1 smoothingRequired:1 downsampleRequired:60.0 smoothingErrorThreshold:5.0 ascending:v18];
  id v14 = objc_opt_new();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__24;
  objc_super v27 = __Block_byref_object_dispose__24;
  id v28 = 0;
  id v15 = [(MORoutineServiceManager *)self routineManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __78__MORoutineServiceManager__fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke;
  v19[3] = &unk_1002CF478;
  id v16 = v12;
  id v20 = v16;
  id v17 = v14;
  id v21 = v17;
  v22 = &v23;
  [v15 enumerateStoredLocationsWithOptions:v13 usingBlock:v19];

  v10[2](v10, v17, v24[5]);
  _Block_object_dispose(&v23, 8);
}

void __78__MORoutineServiceManager__fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [v7 count];
    CFStringRef v12 = @"Stop";
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    if (!a4) {
      CFStringRef v12 = @"Error";
    }
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    CFStringRef v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchStoredLocations returned locations. dates, %@, count, %lu, error, %@, stop, %@", buf, 0x2Au);
  }

  if ([v7 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v7];
  }
  if (v8 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if ([v8 code] == (id)5 || objc_msgSend(v8, "code") == (id)8)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Provider database is unavailable";
      id v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v14 = +[NSError errorWithDomain:@"MOErrorDomain" code:1088 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      id v18 = v8;
      id v13 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v18;
    }
  }
}

- (void)_fetchVisitsBetweenStartDate:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(MORoutineServiceManager *)self routineManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke;
  v12[3] = &unk_1002CF4C8;
  id v13 = v7;
  SEL v14 = a2;
  v12[4] = self;
  id v11 = v7;
  [v10 fetchStoredVisitsWithOptions:v8 handler:v12];
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchstoredVisits returned visits count, %lu", buf, 0xCu);
    }

    id v9 = +[NSPredicate predicateWithFormat:@"type == %lu", 3];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158;
    v16[3] = &unk_1002CF4A0;
    uint64_t v10 = a1[6];
    v16[4] = a1[4];
    void v16[5] = v10;
    id v11 = +[NSPredicate predicateWithBlock:v16];
    v17[0] = v9;
    v17[1] = v11;
    CFStringRef v12 = +[NSArray arrayWithObjects:v17 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    uint64_t v14 = a1[5];
    uint64_t v15 = [v5 filteredArrayUsingPredicate:v13];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
  }
}

uint64_t __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 exit];
  id v5 = [v3 entry];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 < 300.0)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158_cold_1(a1, (uint64_t)v3);
    }
LABEL_8:

    uint64_t v9 = 0;
    goto LABEL_9;
  }
  if ([v3 source] != (id)3)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158_cold_2(a1, (uint64_t)v3);
    }
    goto LABEL_8;
  }
  uint64_t v9 = 1;
LABEL_9:

  return v9;
}

- (void)_fetchRealTimeVisitsForStartDate:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(MORoutineServiceManager *)self routineManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke;
  v11[3] = &unk_1002CA140;
  id v12 = v6;
  id v10 = v6;
  [v9 fetchStoredVisitsWithOptions:v7 handler:v11];
}

void __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchRealTimestoredVisits returned visits count, %lu", buf, 0xCu);
    }

    uint64_t v9 = +[NSPredicate predicateWithFormat:@"type == %lu", 1];
    uint64_t v14 = v9;
    id v10 = +[NSArray arrayWithObjects:&v14 count:1];
    id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v5 filteredArrayUsingPredicate:v11];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
}

- (void)_fetchGeoMapItemFromHandler:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v8);

  mapServiceManager = self->_mapServiceManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke;
  v11[3] = &unk_1002CF4F0;
  id v12 = v6;
  id v10 = v6;
  [(GEOMapService *)mapServiceManager resolveMapItemFromHandle:v7 completionHandler:v11];
}

void __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMapService);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (unint64_t)_placeInferencePlaceTypeFromMapItemPlaceType:(unint64_t)a3
{
  if (a3 > 2) {
    return 4;
  }
  else {
    return qword_1002BB118[a3];
  }
}

- (BOOL)_shouldMarkAsPreOnboardedVisit:(id)a3
{
  id v4 = a3;
  LODWORD(v5) = 14.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"Visit_PreOnboardingLookBackWindow" withFallback:v5];
  self->_int maxAllowedDaysForVisitLookback = (int)v6;
  id v7 = [(MOConfigurationManagerBase *)self->_configurationManager fDefaultsManager];
  id v8 = [v7 objectForKey:@"OnboardingDate"];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = v8;
    unsigned int v10 = [v4 isBeforeDate:v9];
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int maxAllowedDaysForVisitLookback = self->_maxAllowedDaysForVisitLookback;
      int v14 = 138412802;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = maxAllowedDaysForVisitLookback;
      __int16 v18 = 1024;
      unsigned int v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "User onboarding date %@,_maxAllowedDaysForVisitLookback, %d,isPreOnboardedVisit, %d", (uint8_t *)&v14, 0x18u);
    }
  }
  else
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    LOBYTE(v10) = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User onboarding date is nil", (uint8_t *)&v14, 2u);
    }
  }

  return v10;
}

+ (id)_timeZoneFromLocation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CLLocation);
  [v3 latitude];
  double v6 = v5;
  [v3 longitude];
  double v8 = v7;

  id v9 = [v4 initWithLatitude:v6 longitude:v8];
  unsigned int v10 = +[CLGeocoder _timeZoneAtLocation:v9];

  return v10;
}

- (void)_setDynamicProperties:(id)a3 visit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 getPlaceName];
  id v9 = [v7 placeInference];
  unsigned int v10 = [v9 mapItem];

  id v11 = [v7 placeInference];
  [v11 confidence];
  double v13 = v12;

  HIDWORD(v14) = 1072588390;
  *(float *)&double v14 = 0.95;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"VA_VisitLabelHighConfidenceThreshold" withFallback:v14];
  float v16 = v15;
  int v17 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[MORoutineServiceManager _setDynamicProperties:visit:](a2, v7, v17);
  }

  __int16 v18 = [v7 placeInference];
  uint64_t v19 = [v18 finerGranularityMapItem];
  v133 = self;
  if (!v19) {
    goto LABEL_6;
  }
  CFStringRef v20 = (void *)v19;
  id v21 = [v7 placeInference];
  [v21 finerGranularityMapItemConfidence];
  if (v22 < v16)
  {

LABEL_6:
    int v131 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v127 = (void *)v8;
  airportCategories = self->_airportCategories;
  v85 = [v7 placeInference];
  v86 = [v85 mapItem];
  v87 = [v86 category];
  LOBYTE(airportCategories) = [(NSSet *)airportCategories containsObject:v87];

  if ((airportCategories & 1) == 0)
  {
    uint64_t v91 = [v7 getFinerGranularityPlaceName];

    v92 = [v7 placeInference];
    uint64_t v93 = [v92 finerGranularityMapItem];

    __int16 v18 = [v7 placeInference];
    [v18 finerGranularityMapItemConfidence];
    double v13 = v94;
    int v131 = 1;
    unsigned int v10 = (void *)v93;
    uint64_t v8 = v91;
    self = v133;
    goto LABEL_7;
  }
  int v131 = 0;
  uint64_t v8 = (uint64_t)v127;
  self = v133;
LABEL_8:
  __int16 v23 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[MORoutineServiceManager _setDynamicProperties:visit:](a2);
  }

  id v24 = [v6 routineEvent];
  __int16 v25 = (void *)v8;
  [v24 setPlaceName:v8];

  id v26 = [v7 getLocation];
  __int16 v27 = [v6 routineEvent];
  [v27 setLocation:v26];

  CFStringRef v28 = [v7 placeInference];
  id v29 = [v28 userType];
  v30 = [v6 routineEvent];
  [v30 setPlaceUserType:v29];

  v31 = [v6 routineEvent];
  [v31 setPlaceNameConfidence:v13];

  v32 = [v10 geoMapItemHandle];
  v33 = [v6 routineEvent];
  [v33 setPlaceMapItem:v32];

  id v34 = [v10 source];
  v35 = [v6 routineEvent];
  [v35 setPlaceSource:v34];

  id v36 = [v10 mapItemPlaceType];
  v37 = [v6 routineEvent];
  [v37 setMapItemPlaceType:v36];

  v38 = [v10 location];
  v39 = [v6 routineEvent];
  [v39 setMapItemLocation:v38];

  id v40 = [v10 muid];
  v41 = [v6 routineEvent];
  [v41 setMapItemID:v40];

  v42 = [v7 placeInference];
  if ([v42 placeType] == (id)4) {
    goto LABEL_13;
  }
  v43 = [v6 routineEvent];
  if ([v43 placeSource] == (id)1)
  {

LABEL_13:
LABEL_14:
    id v44 = -[MORoutineServiceManager _placeInferencePlaceTypeFromMapItemPlaceType:](self, "_placeInferencePlaceTypeFromMapItemPlaceType:", [v10 mapItemPlaceType]);
    goto LABEL_15;
  }
  v88 = [v6 routineEvent];
  if ([v88 placeSource] == (id)2) {
    char v89 = 1;
  }
  else {
    char v89 = v131;
  }

  if (v89) {
    goto LABEL_14;
  }
  v90 = [v7 placeInference];
  id v44 = [v90 placeType];

LABEL_15:
  v45 = [v6 routineEvent];
  [v45 setPlaceType:v44];

  v46 = [v10 category];
  v47 = [v6 routineEvent];
  [v47 setPoiCategory:v46];

  v48 = [v6 routineEvent];
  uint64_t v49 = [v48 location];
  if (!v49)
  {

    goto LABEL_21;
  }
  v50 = (void *)v49;
  v51 = [v10 location];

  if (!v51)
  {
LABEL_21:
    v66 = [v6 routineEvent];
    [v66 setDistanceFromVisitToPlace:-1.0];
    v61 = v133;
    goto LABEL_22;
  }
  v52 = [v10 location];
  v53 = [v6 routineEvent];
  v54 = [v53 location];
  [v52 distanceFromLocation:v54];
  double v56 = v55;

  v57 = [v6 routineEvent];
  v58 = [v57 location];
  [v58 horizontalUncertainty];
  double v60 = v59;

  v61 = v133;
  if (v60 > 0.0)
  {
    v62 = [v6 routineEvent];
    v63 = [v62 location];
    [v63 horizontalUncertainty];
    double v65 = v56 - v64;

    double v56 = fmax(v65, 0.0);
  }
  v66 = [v6 routineEvent];
  [v66 setDistanceFromVisitToPlace:v56];
LABEL_22:

  v67 = [v7 placeInference];
  if (!v67 || !v10) {
    goto LABEL_37;
  }
  v68 = [v10 address];

  if (!v68) {
    goto LABEL_38;
  }
  v69 = [v10 address];
  v70 = [v6 routineEvent];
  [v70 setAddress:v69];

  v71 = [v6 routineEvent];
  v72 = [v71 address];
  v73 = [v72 geoAddressObject];
  v74 = [v6 routineEvent];
  [v74 setGeoAddressObject:v73];

  v75 = [v6 routineEvent];
  v76 = [v75 address];
  v77 = [v76 geoAddressData];

  v67 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  BOOL v78 = os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG);
  if (v77)
  {
    if (v78)
    {
      v126 = NSStringFromSelector(a2);
      v124 = [v6 routineEvent];
      v122 = [v124 placeName];
      v79 = [(MORoutineServiceManager *)v61 _redactString:v122];
      v120 = [v6 routineEvent];
      v80 = [v120 geoAddressObject];
      v81 = [v80 shortAddress];
      v82 = [(MORoutineServiceManager *)v61 _redactString:v81];
      *(_DWORD *)buf = 138412802;
      v136 = v126;
      __int16 v137 = 2112;
      v138 = v79;
      __int16 v139 = 2112;
      v140 = v82;
      v83 = "%@, using routine cached GEOAddressObject value for map item, %@, address, %@";
LABEL_44:
      _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, v83, buf, 0x20u);

      v61 = v133;
    }
  }
  else if (v78)
  {
    v126 = NSStringFromSelector(a2);
    v124 = [v6 routineEvent];
    v122 = [v124 placeName];
    v79 = [(MORoutineServiceManager *)v61 _redactString:v122];
    v120 = [v6 routineEvent];
    v80 = [v120 geoAddressObject];
    v81 = [v80 shortAddress];
    v82 = [(MORoutineServiceManager *)v61 _redactString:v81];
    *(_DWORD *)buf = 138412802;
    v136 = v126;
    __int16 v137 = 2112;
    v138 = v79;
    __int16 v139 = 2112;
    v140 = v82;
    v83 = "%@, using reconstructed GEOAddressObject value for map item, %@, address, %@";
    goto LABEL_44;
  }
LABEL_37:

LABEL_38:
  v95 = objc_opt_class();
  v96 = [v6 routineEvent];
  v97 = [v96 location];
  v98 = [v95 _timeZoneFromLocation:v97];
  [v6 setTimeZone:v98];

  v99 = [v7 entry];
  BOOL v100 = [(MORoutineServiceManager *)v61 _shouldMarkAsPreOnboardedVisit:v99];
  v101 = [v6 routineEvent];
  [v101 setIsPreOnboardedVisit:v100];

  v102 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    v134 = NSStringFromSelector(a2);
    aSelectora = [v6 eventIdentifier];
    v123 = [v7 placeInference];
    v125 = [v123 loiIdentifier];
    CFStringRef v103 = @"NO";
    if (v131) {
      CFStringRef v103 = @"YES";
    }
    CFStringRef v118 = v103;
    v117 = [v10 identifier];
    v121 = [v10 geoMapItemHandle];
    id v116 = [v121 length];
    v132 = +[MOEventRoutine stringOfPlaceInferencePlaceType:v44];
    v128 = +[MOEventRoutine stringOfMapItemPlaceType:](MOEventRoutine, "stringOfMapItemPlaceType:", [v10 mapItemPlaceType]);
    v119 = [v7 placeInference];
    id v113 = [v119 userType];
    v104 = [(MORoutineServiceManager *)v61 _redactString:v25];
    v105 = [v10 category];
    id v112 = [v10 source];
    v115 = [v10 extendedAttributes];
    id v111 = [v115 wifiFingerprintLabelType];
    v114 = [v6 routineEvent];
    unsigned int v110 = [v114 isPreOnboardedVisit];
    v106 = [v6 routineEvent];
    [v106 distanceFromVisitToPlace];
    uint64_t v108 = v107;
    v109 = [v6 timeZone];
    *(_DWORD *)buf = 138416386;
    v136 = v134;
    __int16 v137 = 2112;
    v138 = aSelectora;
    __int16 v139 = 2112;
    v140 = v125;
    __int16 v141 = 2112;
    CFStringRef v142 = v118;
    __int16 v143 = 2112;
    v144 = v117;
    __int16 v145 = 2048;
    id v146 = v116;
    __int16 v147 = 2112;
    v148 = v132;
    __int16 v149 = 2112;
    v150 = v128;
    __int16 v151 = 2048;
    id v152 = v113;
    __int16 v153 = 2112;
    v154 = v104;
    __int16 v155 = 2112;
    v156 = v105;
    __int16 v157 = 2048;
    id v158 = v112;
    __int16 v159 = 2048;
    id v160 = v111;
    __int16 v161 = 2048;
    double v162 = v13;
    __int16 v163 = 1024;
    unsigned int v164 = v110;
    __int16 v165 = 2048;
    uint64_t v166 = v108;
    __int16 v167 = 2112;
    v168 = v109;
    _os_log_debug_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "%@, event.id, %@, loi, %@, using Finer Granularity Map Item, %@, mapItem, %@, mapItem.length, %lu, placeType, %@, mapItemPlaceType, %@, userType, %lu, name, %@, category, %@, source, %lu, wifiLabelType, %lu, confidence, %f, isPreOnboardedVisit, %d, distanceFromVisitToPlace, %f, timezone, %@", buf, 0xA8u);
  }
}

- (void)_setDynamicProperties:(id)a3 familiarityIndexResultsLOIs:(id)a4 visit:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = a3;
  if (v14)
  {
    unsigned int v10 = [v8 entry];
    BOOL v11 = [(MORoutineServiceManager *)self _shouldMarkAsPreOnboardedVisit:v10];
    double v12 = [v9 routineEvent];
    [v12 setIsPreOnboardedVisit:v11];

    [(MORoutineServiceManager *)self _findMatchingFamiliarityIndexValue:v14 forVisit:v8];
  }
  else
  {
    double v13 = -1.0;
  }
  [v9 setFamiliarityIndexLOI:v13];
}

- (id)_createEventFromVisit:(id)a3
{
  id v4 = a3;
  double v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  id v7 = [v4 entry];
  id v8 = [v4 exit];
  id v9 = v8;
  if (!v8)
  {
    id v9 = +[NSDate date];
  }
  unsigned int v10 = +[NSDate date];
  BOOL v11 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v9 creationDate:v10 provider:4 category:1];

  if (!v8) {
  double v12 = [v4 exit];
  }
  double v13 = [(MORoutineServiceManager *)self configurationManager];
  LODWORD(v14) = 1242802176;
  [v13 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v14];
  float v16 = [v12 dateByAddingTimeInterval:v15];
  [(MOEvent *)v11 setExpirationDate:v16];

  int v17 = [v4 date];
  [(MOEvent *)v11 setSourceCreationDate:v17];

  [(MORoutineServiceManager *)self _setDynamicProperties:v11 visit:v4];

  return v11;
}

- (void)fetchAndSaveVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke;
  block[3] = &unk_1002CABE8;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  SEL v20 = a2;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, block);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__24;
  v45 = __Block_byref_object_dispose__24;
  id v46 = 0;
  id v2 = [*(id *)(a1 + 32) eventStore];
  id v3 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F5F60];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_184;
  v40[3] = &unk_1002CADF8;
  v40[4] = &v41;
  [v2 fetchLastEventOfCategories:v3 isHighConfidenceOnly:1 CompletionHandler:v40];

  id v4 = &v34;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__24;
  v38 = __Block_byref_object_dispose__24;
  id v39 = 0;
  if (v42[5] && (v5 = objc_msgSend(*(id *)(a1 + 40), "isBeforeDate:"), id v4 = v35, v5)) {
    id v6 = (id *)(v42 + 5);
  }
  else {
    id v6 = (id *)(a1 + 40);
  }
  id v7 = *v6;
  id v8 = (void *)v4[5];
  v4[5] = (uint64_t)v7;

  if ([(id)v35[5] isAfterDate:*(void *)(a1 + 48)])
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, &__NSDictionary0__struct);
    }
  }
  else
  {
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__24;
    v32[4] = __Block_byref_object_dispose__24;
    id v33 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__24;
    v30[4] = __Block_byref_object_dispose__24;
    id v31 = &__NSArray0__struct;
    double v12 = *(void **)(a1 + 32);
    uint64_t v13 = v35[5];
    id v14 = *(void **)(a1 + 48);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186;
    v24[3] = &unk_1002CF518;
    __int16 v27 = &v34;
    id v25 = v14;
    CFStringRef v28 = v30;
    id v29 = v32;
    id v15 = v11;
    id v26 = v15;
    [v12 _fetchStitchedVisitsBetweenStartDate:v13 EndDate:v25 CompletionHandler:v24];
    float v16 = [*(id *)(a1 + 32) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_187;
    block[3] = &unk_1002CF540;
    SEL v20 = v32;
    id v17 = *(id *)(a1 + 56);
    block[4] = *(void *)(a1 + 32);
    id v19 = v17;
    id v21 = v30;
    double v22 = &v34;
    uint64_t v23 = *(void *)(a1 + 64);
    dispatch_group_notify(v15, v16, block);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_184(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = [a2 endDate];
    uint64_t v4 = *(void *)(*(void *)(v2 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return _objc_release_x1(v3, v5);
  }
  return result;
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "The fetch window for fetchStitchedVisits, start date, %@, end date, %@", (uint8_t *)&v13, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  if (v7)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186_cold_2();
    }
  }
  double v12 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186_cold_1(a1 + 56);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_187(uint64_t a1)
{
  id v32 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v32)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = v32;
    if (v2) {
      (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v32, &__NSDictionary0__struct);
    }
    goto LABEL_38;
  }
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v4 && [v4 count])
  {
    *(void *)double v55 = 0;
    double v56 = v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__24;
    double v59 = __Block_byref_object_dispose__24;
    id v60 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__24;
    v53 = __Block_byref_object_dispose__24;
    id v54 = (id)objc_opt_new();
    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x3032000000;
    id v46 = __Block_byref_object_copy__24;
    v47 = __Block_byref_object_dispose__24;
    id v48 = 0;
    uint64_t v5 = [*(id *)(a1 + 32) eventStore];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_188;
    v42[3] = &unk_1002CB180;
    v42[4] = v55;
    [v5 fetchEventsWithStartDateAfter:v6 Category:1 CompletionHandler:v42];

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = *((void *)v56 + 5);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_2;
    v41[3] = &unk_1002CE2D0;
    v41[4] = &v49;
    v41[5] = &v43;
    [v7 _checkAndFetchInvalidEvents:v8 Events:v9 handler:v41];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v10 = [obj countByEnumeratingWithState:&v37 objects:v65 count:16];
    if (!v10) {
      goto LABEL_26;
    }
    uint64_t v34 = *(void *)v38;
    *(void *)&long long v11 = 138412546;
    long long v31 = v11;
    while (1)
    {
      double v12 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v12);
        if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
          || ([*(id *)(*((void *)&v37 + 1) + 8 * (void)v12) entry],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              unsigned int v15 = [v14 isAfterDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)], v14, v15))
        {
          if (!v44[5]
            || (objc_msgSend(*(id *)(a1 + 32), "_visitAlreadyHaveValidEvent:Events:", v13) & 1) == 0)
          {
            uint64_t v16 = [*(id *)(a1 + 32) _createEventFromVisit:v13, v31];
            id v17 = [v16 startDate];
            if (v17)
            {
              id v18 = [v16 endDate];
              if (v18)
              {
                id v19 = [v16 startDate];
                SEL v20 = [v16 endDate];
                unsigned int v21 = [v19 isOnOrAfter:v20];

                if (v21)
                {
                  double v22 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 72));
                    *(_DWORD *)buf = v31;
                    id v62 = v23;
                    __int16 v63 = 2112;
                    double v64 = v16;
                    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@, discard event for visit with wrong start/end date, event, %@ ", buf, 0x16u);
                  }
                  goto LABEL_23;
                }
              }
              else
              {
              }
            }
            [v16 setMode:0];
            [v16 setIsHighConfidence:[v13 source] == 3];
            [(id)v50[5] addObject:v16];
LABEL_23:
          }
        }
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v37 objects:v65 count:16];
      if (!v10)
      {
LABEL_26:

        id v24 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [(id)v50[5] count];
          *(_DWORD *)buf = 134217984;
          id v62 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "save visits as event into database, count, %lu", buf, 0xCu);
        }

        if ([(id)v50[5] count])
        {
          id v26 = *(void **)(*(void *)(a1 + 32) + 48);
          uint64_t v27 = v50[5];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_190;
          v35[3] = &unk_1002C9A50;
          id v36 = *(id *)(a1 + 40);
          [v26 storeEvents:v27 CompletionHandler:v35];
        }
        else
        {
          uint64_t v30 = *(void *)(a1 + 40);
          if (v30) {
            (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, &__NSDictionary0__struct);
          }
        }
        _Block_object_dispose(&v43, 8);

        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(v55, 8);

LABEL_37:
        uint64_t v3 = 0;
        goto LABEL_38;
      }
    }
  }
  CFStringRef v28 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v55 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no visits fetched for saving", v55, 2u);
  }

  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v3 = 0;
  if (v29)
  {
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, &__NSDictionary0__struct);
    goto LABEL_37;
  }
LABEL_38:
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_188(uint64_t a1, void *a2)
{
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) copy];
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v11];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_190_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (BOOL)_visitAlreadyHaveValidEvent:(id)a3 Events:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(v5, "isEqualToVisitMoment:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)_checkAndFetchInvalidEvents:(id)a3 Events:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void, void *, void *))a5;
  if (v8 && [v8 count] && v9 && objc_msgSend(v9, "count"))
  {
    unsigned int v21 = v10;
    id v11 = objc_opt_new();
    long long v12 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v9;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v19 = -[MORoutineServiceManager findMatchingVisitFor:inVisits:](self, "findMatchingVisitFor:inVisits:", v18, v8, v21);
          SEL v20 = v12;
          if (!v19)
          {
            [v18 setIsInvalid:1];
            SEL v20 = v11;
          }
          [v20 addObject:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    uint64_t v10 = v21;
    v21[2](v21, v11, v12);

    id v9 = v22;
  }
  else
  {
    v10[2](v10, 0, 0);
  }
}

- (void)rehydrateVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MORoutineServiceManager_rehydrateVisits_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __51__MORoutineServiceManager_rehydrateVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__24;
  v42[4] = __Block_byref_object_dispose__24;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__24;
  v40[4] = __Block_byref_object_dispose__24;
  id v41 = &__NSArray0__struct;
  id v10 = [v8 startDate];
  id v11 = [v8 endDate];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke;
  v36[3] = &unk_1002CF568;
  long long v38 = v40;
  long long v39 = v42;
  id v12 = v9;
  long long v37 = v12;
  [(MORoutineServiceManager *)self _fetchStitchedVisitsBetweenStartDate:v10 EndDate:v11 CompletionHandler:v36];

  id v13 = objc_alloc((Class)NSDateInterval);
  id v14 = [v8 startDate];
  id v15 = [v8 endDate];
  id v16 = [v13 initWithStartDate:v14 endDate:v15];

  dispatch_group_enter(v12);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__24;
  v34[4] = __Block_byref_object_dispose__24;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__24;
  v32[4] = __Block_byref_object_dispose__24;
  id v33 = &__NSArray0__struct;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_2;
  void v28[3] = &unk_1002CF568;
  uint64_t v30 = v32;
  long long v31 = v34;
  id v17 = v12;
  uint64_t v29 = v17;
  [(MORoutineServiceManager *)self _fetchFamiliarityIndexesLOIForDateInterval:v16 CompletionHandler:v28];
  id v18 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3;
  block[3] = &unk_1002CF590;
  id v24 = v7;
  long long v25 = v42;
  id v22 = v6;
  long long v23 = self;
  long long v26 = v40;
  uint64_t v27 = v32;
  id v19 = v7;
  id v20 = v6;
  dispatch_group_notify(v17, v18, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3_cold_1();
    }

    uint64_t v3 = [MORehydrationMetrics alloc];
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    id v5 = [-MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v3, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 1, 4, 0, v4, [*(id *)(a1 + 32) count], 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    id v9 = 0;
    [(MORehydrationMetrics *)v5 submitMetricsWithError:&v9];
    id v6 = v9;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) _rehydrateStoreEvents:*(void *)(a1 + 32) withVisits:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) familiarityIndex:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134218240;
      id v11 = v8;
      __int16 v12 = 2048;
      id v13 = [(MORehydrationMetrics *)v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_rehydrateVisits, input event, %lu, rehydrated events, %lu", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_rehydrateStoreEvents:(id)a3 withVisits:(id)a4 familiarityIndex:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  if (![v8 count])
  {
    _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    uint64_t v27 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v27->super.super, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager _rehydrateStoreEvents:withVisits:familiarityIndex:](a2);
    }
    goto LABEL_22;
  }
  if (![v9 count])
  {
    CFStringRef v28 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager _rehydrateStoreEvents:withVisits:familiarityIndex:](a2);
    }

    uint64_t v27 = [[MORehydrationMetrics alloc] initWithCategory:1 provider:4 spiSuccess:1 spiError:0 failCount:[v8 count] successAfterPreFailCount:3 totalCount:([v8 count]) rehydrationTrigger:0.0];
    uint64_t v40 = 0;
    [(MORehydrationMetrics *)v27 submitMetricsWithError:&v40];
LABEL_22:
    id v33 = 0;
    goto LABEL_23;
  }
  id v33 = (id)objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = v8;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
  id v12 = v31;
  id v34 = v9;
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v37;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v15);
        id v17 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v42 = v21;
          __int16 v43 = 2112;
          id v44 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@, event, %@", buf, 0x16u);

          id v9 = v34;
        }

        id v18 = [(MORoutineServiceManager *)self findMatchingVisitFor:v16 inVisits:v9];
        if (v18)
        {
          id v19 = [v16 copy];
          [(MORoutineServiceManager *)self _setDynamicProperties:v19 familiarityIndexResultsLOIs:v12 visit:v18];
          [(MORoutineServiceManager *)self _setDynamicProperties:v19 visit:v18];
          id v20 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v22 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v42 = v22;
            __int16 v43 = 2112;
            id v44 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@, found matching visit, rehydrated event, %@", buf, 0x16u);

            id v12 = v31;
          }

          [v33 addObject:v19];
          id v9 = v34;
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v13);
  }

  long long v23 = [MORehydrationMetrics alloc];
  id v24 = [v10 firstObject];
  id v25 = [v24 category];
  long long v26 = [v10 firstObject];
  uint64_t v27 = [[MORehydrationMetrics alloc] initWithCategory:v23 provider:v26 spiSuccess:1 spiError:0 failCount:[v10 count] successAfterPreFailCount:[v33 count] totalCount:[v10 count] rehydrationTrigger:0.0];

  id v9 = v34;
  uint64_t v35 = 0;
  [(MORehydrationMetrics *)v27 submitMetricsWithError:&v35];
  id v8 = v30;
LABEL_23:

  return v33;
}

- (void)removeVisitsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002C9A50;
  id v4 = *(id *)(a1 + 48);
  [v1 _removeVisitsDeletedAtSource:v2 handler:v3];
}

uint64_t __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeVisitsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__24;
  v17[4] = __Block_byref_object_dispose__24;
  id v18 = (id)objc_opt_new();
  id v9 = [v8 startDate];
  id v10 = [v8 endDate];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke;
  v13[3] = &unk_1002CF5E0;
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v16 = v17;
  id v12 = v7;
  id v15 = v12;
  [(MORoutineServiceManager *)self _fetchStitchedVisitsBetweenStartDate:v9 EndDate:v10 CompletionHandler:v13];

  _Block_object_dispose(v17, 8);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2;
  block[3] = &unk_1002CF5B8;
  id v15 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v9;
  id v18 = v5;
  long long v13 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v13;
  long long v19 = v13;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, block);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v2 = *(id *)(a1 + 40);
    id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v8 = [*(id *)(a1 + 48) findMatchingVisitFor:v7 inVisits:*(void *)(a1 + 56)];
          if (!v8)
          {
            uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
              __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_2(&buf, v16, v9);
            }

            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v7];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v4);
    }
  }
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_1(a1);
  }

  id v11 = [*(id *)(a1 + 48) eventStore];
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193;
  v13[3] = &unk_1002C9A50;
  id v14 = *(id *)(a1 + 64);
  [v11 removeEvents:v12 CompletionHandler:v13];
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)findMatchingVisitFor:(id)a3 inVisits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"(type == %lu)", 3];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  if (v8 && [v8 count])
  {
    uint64_t v9 = 0;
    id v10 = (char *)[v8 count] - 1;
    do
    {
      id v11 = &v9[(unint64_t)(v10 - v9) >> 1];
      if (v11 > (char *)[v8 count] - 1) {
        break;
      }
      uint64_t v12 = [v8 objectAtIndexedSubscript:&v9[(unint64_t)(v10 - v9) >> 1]];
      unsigned int v13 = [v12 isEqualToVisitMoment:v5];

      if (v13)
      {
        long long v18 = [v8 objectAtIndexedSubscript:&v9[(unint64_t)(v10 - v9) >> 1]];
        goto LABEL_11;
      }
      id v14 = [v5 startDate];
      id v15 = [v8 objectAtIndexedSubscript:&v9[(unint64_t)(v10 - v9) >> 1]];
      id v16 = [v15 entry];
      unsigned int v17 = [v14 isBeforeDate:v16];

      if (v17) {
        id v10 = v11 - 1;
      }
      else {
        uint64_t v9 = v11 + 1;
      }
    }
    while (v9 <= v10);
  }
  long long v18 = 0;
LABEL_11:

  return v18;
}

- (id)_findMatchingEventFor:(id)a3 inEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = 0;
    uint64_t v9 = (char *)[v7 count] - 1;
    do
    {
      id v10 = &v8[(unint64_t)(v9 - v8) >> 1];
      if (v10 > (char *)[v7 count] - 1) {
        break;
      }
      id v11 = [v5 entry];
      uint64_t v12 = [v7 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
      unsigned int v13 = [v12 startDate];
      unsigned int v14 = [v11 isEqualToDate:v13];

      id v15 = [v5 exit];
      id v16 = [v7 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
      unsigned int v17 = [v16 endDate];
      unsigned int v18 = [v15 isEqualToDate:v17];

      if (v14 && v18)
      {
        long long v23 = [v7 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
        goto LABEL_12;
      }
      long long v19 = [v5 entry];
      long long v20 = [v7 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
      unsigned int v21 = [v20 startDate];
      unsigned int v22 = [v19 isBeforeDate:v21];

      if (v22) {
        uint64_t v9 = v10 - 1;
      }
      else {
        id v8 = v10 + 1;
      }
    }
    while (v8 <= v9);
  }
  long long v23 = 0;
LABEL_12:

  return v23;
}

- (double)_findMatchingFamiliarityIndexValue:(id)a3 forVisit:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = -1.0;
  if (v5 && [v5 count])
  {
    id v8 = 0;
    uint64_t v9 = (char *)[v5 count] - 1;
    do
    {
      id v10 = &v8[(unint64_t)(v9 - v8) >> 1];
      if (v10 > (char *)[v5 count] - 1) {
        break;
      }
      id v11 = [v5 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
      uint64_t v12 = [v11 dateInterval];

      unsigned int v13 = [v6 entry];
      unsigned int v14 = [v12 startDate];
      if ([v13 isEqualToDate:v14])
      {
        id v15 = [v6 exit];
        [v12 endDate];
        unsigned int v17 = v16 = v5;
        unsigned int v24 = [v15 isEqualToDate:v17];

        id v5 = v16;
        if (v24)
        {
          unsigned int v21 = [v16 objectAtIndexedSubscript:&v8[(unint64_t)(v9 - v8) >> 1]];
          [v21 familiarityIndex];
          double v7 = v22;

          break;
        }
      }
      else
      {
      }
      unsigned int v18 = [v6 entry];
      long long v19 = [v12 startDate];
      unsigned int v20 = [v18 isBeforeDate:v19];

      if (v20) {
        uint64_t v9 = v10 - 1;
      }
      else {
        id v8 = v10 + 1;
      }
    }
    while (v8 <= v9);
  }

  return v7;
}

- (void)_fetchFamiliarityIndexesLOIForDateInterval:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)RTFamiliarityIndexOptions) initWithDateInterval:v7 spatialGranularity:1];

  uint64_t v9 = [(MORoutineServiceManager *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(MORoutineServiceManager *)self routineManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke;
  v12[3] = &unk_1002CA140;
  id v13 = v6;
  id v11 = v6;
  [v10 fetchFamiliarityIndexResultsWithOptions:v8 handler:v12];
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      [v5 enumerateObjectsUsingBlock:&__block_literal_global_29];
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_198(id a1, RTFamiliarityIndexResult *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_198_cold_1();
  }
}

- (id)_getLoiInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 preferredName];
  id v7 = [(MORoutineServiceManager *)self _redactString:v6];
  [v4 confidence];
  uint64_t v9 = v8;

  id v10 = +[NSString stringWithFormat:@"%@, place, %@, confidence, %f", v5, v7, v9];

  return v10;
}

- (id)_getVisitInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 getPlaceName];
  id v6 = [(MORoutineServiceManager *)self _redactString:v5];
  [v4 confidence];
  uint64_t v8 = v7;

  uint64_t v9 = +[NSString stringWithFormat:@"%@, confidence, %f", v6, v8];

  return v9;
}

- (id)_redactString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    unint64_t v5 = (unint64_t)[v4 length];
    if (v5 >> 1 >= 5) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = v5 >> 1;
    }
    uint64_t v7 = [v4 substringToIndex:v6];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%lu", v7, [v4 hash]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (id)fetchHomeLOI
{
  uint64_t v19 = 0;
  unsigned int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__24;
  long long v23 = __Block_byref_object_dispose__24;
  id v24 = +[NSArray array];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MORoutineServiceManager *)self routineManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __39__MORoutineServiceManager_fetchHomeLOI__block_invoke;
  v16[3] = &unk_1002C9D68;
  unsigned int v18 = &v19;
  unint64_t v5 = v3;
  unsigned int v17 = v5;
  [v4 fetchLocationsOfInterestOfType:0 withHandler:v16];

  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Routine/MORoutineServiceManager.m", 944, "-[MORoutineServiceManager fetchHomeLOI]");
  id v15 = 0;
  BOOL v7 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v5, &v15, v6, 30.0);
  id v8 = v15;
  if (!v7)
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  if ([(id)v20[5] count])
  {
    id v10 = [(id)v20[5] objectAtIndexedSubscript:0];
    id v11 = [v10 valueForKey:@"location"];

    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetching homeLOI successful", buf, 2u);
    }
  }
  else
  {
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager fetchHomeLOI]();
    }
    id v11 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v11;
}

void __39__MORoutineServiceManager_fetchHomeLOI__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_calculateDistanceFromHome:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MORoutineServiceManager *)self homeLOI];
  id v6 = objc_alloc((Class)RTLocation);
  [v4 coordinate];
  double v8 = v7;
  [v4 coordinate];
  double v10 = v9;
  [v4 horizontalAccuracy];
  double v12 = v11;

  id v13 = [v6 initWithLatitude:0 longitude:v8 horizontalUncertainty:v10 date:v12];
  unsigned int v14 = v13;
  id v15 = 0;
  if (v5 && v13)
  {
    [v5 distanceFromLocation:v13];
    id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }

  return v15;
}

- (id)getPhotosCloseToHome:(id)a3 withDistance:(double)a4
{
  id v6 = a3;
  double v7 = objc_opt_new();
  double v8 = [(MORoutineServiceManager *)self homeLOI];

  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v32 = v6;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v9) {
      goto LABEL_30;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v13 type] != (id)2)
        {
          [v7 addObject:v13];
          continue;
        }
        unsigned int v14 = [v13 assets];
        id v15 = +[MOContextAnnotationUtilities fetchAssetUsingID:v14 universe:self->_universe];
        id v16 = v15;
        if (v15)
        {
          unsigned int v17 = [v15 location];

          if (v17)
          {
            unsigned int v18 = [v16 location];
            uint64_t v19 = [(MORoutineServiceManager *)self _calculateDistanceFromHome:v18];

            unsigned int v20 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
            if (v19)
            {
              if (v21)
              {
                [v19 doubleValue];
                *(_DWORD *)uint8_t buf = 138412546;
                long long v39 = v13;
                __int16 v40 = 2048;
                uint64_t v41 = v22;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Resource,%@,distanceToHomeInMeters,%f", buf, 0x16u);
              }

              [v19 doubleValue];
              if (v23 < a4)
              {
                [v7 addObject:v13];
                unsigned int v20 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  [v19 doubleValue];
                  *(_DWORD *)uint8_t buf = 138412546;
                  long long v39 = v13;
                  __int16 v40 = 2048;
                  uint64_t v41 = v24;
                  id v25 = v20;
                  long long v26 = "Adding photo resource,%@, since distanceToHomeInMeters,%f is cleared";
                  goto LABEL_23;
                }
LABEL_25:

LABEL_26:
                goto LABEL_27;
              }
              unsigned int v20 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
                goto LABEL_25;
              }
              [v19 doubleValue];
              *(_DWORD *)uint8_t buf = 138412546;
              long long v39 = v13;
              __int16 v40 = 2048;
              uint64_t v41 = v28;
              id v25 = v20;
              long long v26 = "Photo resource,%@, not added since distanceToHomeInMeters,%f is out of range";
LABEL_23:
              uint32_t v27 = 22;
            }
            else
            {
              if (!v21) {
                goto LABEL_25;
              }
              *(_WORD *)uint8_t buf = 0;
              id v25 = v20;
              long long v26 = "Resource,distanceToHomeInMeters is nil";
              uint32_t v27 = 2;
            }
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
            goto LABEL_25;
          }
          uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            long long v39 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Photo resource,%@,location object is nil", buf, 0xCu);
          }
          goto LABEL_26;
        }
LABEL_27:
      }
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v10)
      {
LABEL_30:

        id v29 = v7;
        id v6 = v32;
        goto LABEL_34;
      }
    }
  }
  id v30 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "getPhotosCloseToHome,home LOI is nil", buf, 2u);
  }

  id v29 = 0;
LABEL_34:

  return v29;
}

- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MORoutineServiceManager_fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002CA300;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

id __88__MORoutineServiceManager_fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v45 = a4;
  id v41 = a5;
  id v39 = a6;
  __int16 v43 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  v42 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 4];
  v93[0] = v43;
  v93[1] = v42;
  id v11 = +[NSArray arrayWithObjects:v93 count:2];
  __int16 v40 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

  id v44 = [v41 filteredArrayUsingPredicate:v40];
  id v12 = dispatch_group_create();
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchVisit", "", buf, 2u);
  }

  unsigned int v14 = [[MOPerformanceMeasurement alloc] initWithName:@"fetchVisit" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v14 startSession];
  dispatch_group_enter(v12);
  *(void *)uint8_t buf = 0;
  v88 = buf;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__24;
  uint64_t v91 = __Block_byref_object_dispose__24;
  id v92 = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = __Block_byref_object_copy__24;
  v85[4] = __Block_byref_object_dispose__24;
  id v86 = &__NSArray0__struct;
  id v15 = v10;
  id v16 = v15;
  if ([v44 count])
  {
    id v17 = [v44 getDurationOfMOEventArray];
    id v18 = [v17 startDate];
    unsigned int v19 = [v18 isBeforeDate:v15];

    id v16 = v15;
    if (v19)
    {
      id v16 = [v17 startDate];
    }
  }
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v80[3] = &unk_1002CE2F8;
  v83 = v85;
  v84 = buf;
  id v20 = v12;
  v81 = v20;
  long long v36 = v14;
  v82 = v36;
  [(MORoutineServiceManager *)self _fetchStitchedVisitsBetweenStartDate:v16 EndDate:v45 CompletionHandler:v80];
  id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)v74 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchRealTimeVisit", "", v74, 2u);
  }

  id v22 = [[MOPerformanceMeasurement alloc] initWithName:@"fetchRealTimeVisit" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v22 startSession];
  dispatch_group_enter(v20);
  *(void *)v74 = 0;
  v75 = v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__24;
  BOOL v78 = __Block_byref_object_dispose__24;
  id v79 = &__NSArray0__struct;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_237;
  v69[3] = &unk_1002CE2F8;
  v72 = v74;
  v73 = buf;
  id v23 = v20;
  v70 = v23;
  long long v37 = v22;
  v71 = v37;
  [(MORoutineServiceManager *)self _fetchRealTimeVisitsBetweenStartDate:v15 EndDate:v45 CompletionHandler:v69];
  uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)__int16 v63 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchFamilarity", "", v63, 2u);
  }

  id v25 = [[MOPerformanceMeasurement alloc] initWithName:@"fetchFamiliarity" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v25 startSession];
  long long v26 = +[NSDate date];
  uint64_t v27 = [v26 dateByAddingTimeInterval:-2419200.0];

  id v28 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v27 endDate:v45];
  long long v38 = (void *)v27;
  dispatch_group_enter(v23);
  *(void *)__int16 v63 = 0;
  double v64 = v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__24;
  v67 = __Block_byref_object_dispose__24;
  id v68 = &__NSArray0__struct;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_241;
  v58[3] = &unk_1002CE2F8;
  v61 = v63;
  id v62 = buf;
  id v29 = v23;
  double v59 = v29;
  id v30 = v25;
  id v60 = v30;
  [(MORoutineServiceManager *)self _fetchFamiliarityIndexesLOIForDateInterval:v28 CompletionHandler:v58];
  id v31 = [(MORoutineServiceManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_242;
  block[3] = &unk_1002CF648;
  id v54 = buf;
  double v55 = v85;
  id v48 = v44;
  uint64_t v49 = self;
  double v56 = v74;
  uint64_t v57 = v63;
  id v50 = v15;
  id v51 = v16;
  id v52 = v45;
  id v53 = v39;
  id v46 = v45;
  id v32 = v16;
  id v33 = v15;
  id v34 = v39;
  id v35 = v44;
  dispatch_group_notify(v29, v31, block);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v85, 8);
  _Block_object_dispose(buf, 8);
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  double v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchVisit", "", v9, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  double v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchRealTimeVisit", "", v9, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  double v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchVisit", "", v9, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_242(uint64_t a1)
{
  uint64_t v2 = a1 + 80;
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    dispatch_semaphore_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_242_cold_1();
    }

    id v4 = [MORehydrationMetrics alloc];
    unint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) description];
    id v6 = [-MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v4, 1, 4, 0, v5, [*(id *)(a1 + 32) count], 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    id v29 = 0;
    [(MORehydrationMetrics *)v6 submitMetricsWithError:&v29];
    id v7 = v29;
    if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) code] == (id)5
      || [*(id *)(*(void *)(*(void *)v2 + 8) + 40) code] == (id)8)
    {
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"Provider database is unavailable";
      double v8 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v9 = +[NSError errorWithDomain:@"MOErrorDomain" code:1088 userInfo:v8];

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    id v6 = (MORehydrationMetrics *)objc_opt_new();
    [(MORehydrationMetrics *)v6 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    [(MORehydrationMetrics *)v6 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    long long v26 = __Block_byref_object_copy__24;
    uint64_t v27 = __Block_byref_object_dispose__24;
    id v28 = (id)objc_opt_new();
    id v10 = [*(id *)(a1 + 40) _rehydrateStoreEvents:*(void *)(a1 + 32) withVisits:v6 familiarityIndex:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
    if ([v10 count]) {
      [(id)v24[5] setObject:v10 forKey:@"rehydratedEvents"];
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_244;
    v15[3] = &unk_1002CEDB8;
    id v22 = &v23;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    id v14 = v10;
    id v19 = v14;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 72);
    [v13 _createNewEventsFromVisits:v6 familiarityIndex:v11 withStoredEvents:v12 handler:v15];

    _Block_object_dispose(&v23, 8);
  }
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_244(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v3 forKey:@"newEvents"];
  }
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 56) count];
    id v9 = [v3 count];
    id v10 = [*(id *)(a1 + 64) count];
    int v11 = 138413570;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    id v18 = v8;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2048;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start date, %@, adjusted start date, %@, end date, %@, rehydrated visit events count, %lu, new visit events counts, %lu, stored visit events count, %lu", (uint8_t *)&v11, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_createNewEventsFromVisits:(id)a3 familiarityIndex:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 count])
  {
    uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MORoutineServiceManager _createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:]();
    }
  }
  __int16 v15 = objc_opt_new();
  if ([v12 count])
  {
    id v24 = v13;
    id v25 = v11;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v22 = [(MORoutineServiceManager *)self _findMatchingEventFor:v21 inEvents:v12];
          if (!v22) {
            [v15 addObject:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    id v13 = v24;
    id v11 = v25;
  }
  else
  {
    [v15 addObjectsFromArray:v10];
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __96__MORoutineServiceManager__createNewEventsFromVisits_familiarityIndex_withStoredEvents_handler___block_invoke;
  v26[3] = &unk_1002CA140;
  id v27 = v13;
  id v23 = v13;
  [(MORoutineServiceManager *)self _createEventsFromVisits:v15 familiarityIndex:v11 handler:v26];
}

void __96__MORoutineServiceManager__createNewEventsFromVisits_familiarityIndex_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "new visit events count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createEventsFromVisits:(id)a3 familiarityIndex:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v27 = (void (**)(id, void *, void))a5;
  id v10 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  id v32 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v32)
  {
    uint64_t v11 = *(void *)v34;
    id v29 = v9;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
        uint64_t v14 = [(MORoutineServiceManager *)self _createEventFromVisit:v13];
        uint64_t v15 = [v14 startDate];
        if (v15)
        {
          id v16 = (void *)v15;
          uint64_t v17 = [v14 endDate];
          if (v17)
          {
            id v18 = (void *)v17;
            uint64_t v19 = [v14 startDate];
            [v14 endDate];
            uint64_t v20 = v11;
            uint64_t v21 = self;
            id v23 = v22 = v10;
            unsigned int v31 = [v19 isOnOrAfter:v23];

            id v10 = v22;
            self = v21;
            uint64_t v11 = v20;

            id v9 = v29;
            if (v31)
            {
              id v24 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                goto LABEL_13;
              }
              id v25 = NSStringFromSelector(a2);
              *(_DWORD *)uint8_t buf = 138412546;
              long long v38 = v25;
              __int16 v39 = 2112;
              __int16 v40 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@, discard event for visit with wrong start/end date, event, %@ ", buf, 0x16u);
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        [(MORoutineServiceManager *)self _setDynamicProperties:v14 familiarityIndexResultsLOIs:v9 visit:v13];
        [v14 setMode:0];
        [v14 setIsHighConfidence:objc_msgSend(v13, "source") == (id)3];
        [v10 addObject:v14];
        id v24 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        id v25 = NSStringFromSelector(a2);
        *(_DWORD *)uint8_t buf = 138412546;
        long long v38 = v25;
        __int16 v39 = 2112;
        __int16 v40 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@, event, %@ ", buf, 0x16u);
LABEL_16:

LABEL_13:
        id v12 = (char *)v12 + 1;
      }
      while (v32 != v12);
      id v26 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      id v32 = v26;
    }
    while (v26);
  }

  v27[2](v27, v10, 0);
}

- (RTLocation)homeLOI
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_homeLOI)
  {
    uint64_t v3 = [(MORoutineServiceManager *)v2 fetchHomeLOI];
    homeLOI = v2->_homeLOI;
    v2->_homeLOI = (RTLocation *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_homeLOI;

  return v5;
}

- (void)_fetchEarliestVisitDateInRoutineWithHandler:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__24;
  v21[4] = __Block_byref_object_dispose__24;
  id v22 = +[NSDate distantPast];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__24;
  void v19[4] = __Block_byref_object_dispose__24;
  id v20 = 0;
  id v5 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F5F30, 0];
  id v6 = objc_alloc((Class)NSDateInterval);
  uint64_t v7 = +[NSDate distantPast];
  id v8 = +[NSDate now];
  id v9 = [v6 initWithStartDate:v7 endDate:v8];

  id v10 = objc_alloc((Class)RTStoredVisitFetchOptions);
  uint64_t v11 = +[NSNumber numberWithDouble:RTVisitConfidenceHigh];
  id v12 = [v10 initWithAscending:1 confidence:v11 dateInterval:v9 labelVisit:0 limit:0 sources:v5];

  id v13 = [(MORoutineServiceManager *)self routineManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke;
  v15[3] = &unk_1002CF670;
  uint64_t v17 = v19;
  id v18 = v21;
  id v14 = v4;
  id v16 = v14;
  [v13 fetchStoredVisitsWithOptions:v12 handler:v15];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke_cold_1();
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([v5 count])
  {
    uint64_t v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"entry" ascending:1];
    id v27 = v7;
    id v8 = +[NSArray arrayWithObjects:&v27 count:1];
    id v9 = [v5 sortedArrayUsingDescriptors:v8];

    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v5 count];
      id v12 = [v9 firstObject];
      id v13 = [v12 entry];
      int v23 = 134218242;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetch oldest visit count, %lu, with date, %@", (uint8_t *)&v23, 0x16u);
    }
    id v14 = [v9 firstObject];
    uint64_t v15 = [v14 entry];
    uint64_t v16 = *(void *)(a1[6] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_8;
  }
  uint64_t v20 = +[NSDate now];
  uint64_t v21 = *(void *)(a1[6] + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

LABEL_9:
  if (a1[4])
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void **)(*(void *)(a1[6] + 8) + 40);
      int v23 = 138412290;
      id v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetch oldest visit date, %@", (uint8_t *)&v23, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (void)fetchEarliestVisitDateInRoutineWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MORoutineServiceManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke;
  v7[3] = &unk_1002CCDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke_2;
  v2[3] = &unk_1002CF698;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _fetchEarliestVisitDateInRoutineWithHandler:v2];
}

uint64_t __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchConsolidatedEvents:(id)a3 withStored:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v50 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K = %lu"];
  +[NSPredicate predicateWithFormat:@"category", 1, @"placeUserType", 1];
  id v46 = v52 = v7;
  id v10 = [v7 filteredArrayUsingPredicate:];
  id v11 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"isHighConfidence", 1];
  id v12 = [v10 filteredArrayUsingPredicate:v11];
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 134217984;
    id v55 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Number of hindsight home events, %lu", buf, 0xCu);
  }

  uint64_t v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"isHighConfidence", 0];

  __int16 v43 = (void *)v14;
  uint64_t v15 = [v10 filteredArrayUsingPredicate:v14];
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v15 count];
    *(_DWORD *)uint8_t buf = 134217984;
    id v55 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Number of real time home events, %lu", buf, 0xCu);
  }

  uint64_t v18 = +[NSPredicate predicateWithFormat:@"category == %lu", 1];
  uint64_t v19 = +[NSPredicate predicateWithFormat:@"isHighConfidence == NO"];
  +[NSPredicate predicateWithFormat:@"provider == %lu", 4];
  v47 = (void *)v18;
  v53[0] = v18;
  id v44 = v53[1] = v19;
  id v45 = (void *)v19;
  v53[2] = v44;
  uint64_t v20 = +[NSArray arrayWithObjects:v53 count:3];
  uint64_t v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];

  v42 = (void *)v21;
  id v22 = [v9 filteredArrayUsingPredicate:v21];

  int v23 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = [v22 count];
    *(_DWORD *)uint8_t buf = 134217984;
    id v55 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Number of real time home events that are stored, %lu", buf, 0xCu);
  }

  uint64_t v49 = v10;
  if ([v12 count])
  {
    __int16 v25 = [v12 valueForKeyPath:@"@max.endDate"];
    if (v25)
    {
      id v26 = +[NSPredicate predicateWithFormat:@"(endDate == %@)", v25];
      uint64_t v27 = [v12 filteredArrayUsingPredicate:v26];

      char v28 = 0;
      goto LABEL_13;
    }
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 0;
    __int16 v25 = 0;
  }
  char v28 = 1;
LABEL_13:
  id v29 = (void (**)(void, void, void))v8;
  id v51 = v12;
  if ([v15 count])
  {
    long long v30 = [v15 valueForKeyPath:@"@max.startDate"];
    if (v30)
    {
      unsigned int v31 = +[NSPredicate predicateWithFormat:@"(startDate == %@)", v30];
      id v32 = [v15 filteredArrayUsingPredicate:v31];

      if (!v27 || !v32 || ![v25 isAfterDate:v30]) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    long long v30 = 0;
  }
  id v32 = 0;
LABEL_21:
  id v48 = v15;
  __int16 v40 = (void *)v27;
  id v41 = v22;
  if (v28)
  {
    long long v33 = &__NSArray0__struct;
  }
  else
  {
    long long v34 = +[NSPredicate predicateWithFormat:@"(startDate < %@)", v25];
    long long v33 = [v22 filteredArrayUsingPredicate:v34];
  }
  long long v35 = objc_opt_new();
  long long v36 = +[NSPredicate predicateWithFormat:@"%K != %lu", @"placeUserType", 1];

  long long v37 = [v52 filteredArrayUsingPredicate:v36];
  long long v38 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"isHighConfidence", 1];

  __int16 v39 = [v37 filteredArrayUsingPredicate:v38];
  [v35 addObjectsFromArray:v39];
  [v35 addObjectsFromArray:v51];
  if (v32) {
    [v35 addObjectsFromArray:v32];
  }
  if (v29) {
    ((void (**)(void, void *, void *))v29)[2](v29, v35, v33);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRoutineManager:(id)a3
{
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (GEOMapService)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
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

- (int)maxAllowedDaysForVisitLookback
{
  return self->_maxAllowedDaysForVisitLookback;
}

- (void)setMaxAllowedDaysForVisitLookback:(int)a3
{
  self->_int maxAllowedDaysForVisitLookback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_homeLOI, 0);

  objc_storeStrong((id *)&self->_airportCategories, 0);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventStore", v2, v3, v4, v5, v6);
}

void __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Database unavailable,  %@", v2, v3, v4, v5, v6);
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchVisit failed with error, %@", v2, v3, v4, v5, v6);
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 32) _getVisitInfo:a2];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v6, v7, "%@, visit filtered due to visit length, visit, %@", v8, v9, v10, v11, v12);
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_158_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 32) _getVisitInfo:a2];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v6, v7, "%@, visit filtered for non hindsight visits, visit, %@", v8, v9, v10, v11, v12);
}

void __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchRealTimeVisit failed with error, %@", v2, v3, v4, v5, v6);
}

void __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error while call rehydrating map item from map service: %@", v2, v3, v4, v5, v6);
}

- (void)_setDynamicProperties:(const char *)a1 visit:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "%@, using finer granularity map item, %@", v4, v5, v6, v7, v8);
}

- (void)_setDynamicProperties:(NSObject *)a3 visit:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = [a2 placeInference];
  uint64_t v7 = [v6 mapItem];
  uint8_t v8 = [v7 identifier];
  uint64_t v9 = [a2 placeInference];
  [v9 confidence];
  uint64_t v11 = v10;
  uint8_t v12 = [a2 placeInference];
  id v13 = [v12 finerGranularityMapItem];
  uint64_t v14 = [v13 identifier];
  uint64_t v15 = [a2 placeInference];
  [v15 finerGranularityMapItemConfidence];
  int v17 = 138413314;
  uint64_t v18 = v5;
  __int16 v19 = 2112;
  uint64_t v20 = v8;
  __int16 v21 = 2048;
  uint64_t v22 = v11;
  __int16 v23 = 2112;
  id v24 = v14;
  __int16 v25 = 2048;
  uint64_t v26 = v16;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, choosing between regular granularity map item, %@, confidence, %f, and finer granularity map item, %@, finer granularity confidence, %f", (uint8_t *)&v17, 0x34u);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Last visit is after the fetch window, last event, %@, end date, %@", v2, 0x16u);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "fetched hindsight Visits, %lu", v3, v4, v5, v6, v7);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_186_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchVisits failed with error, %@", v2, v3, v4, v5, v6);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_190_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving visit as event into database failed with error, %@", v2, v3, v4, v5, v6);
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "visit fetching for rehydration hit error, %@", v2, v3, v4, v5, 2u);
}

- (void)_rehydrateStoreEvents:(const char *)a1 withVisits:familiarityIndex:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "%@:no input events for rehydrating", v4, v5, v6, v7, v8);
}

- (void)_rehydrateStoreEvents:(const char *)a1 withVisits:familiarityIndex:.cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "%@:no visits fecthed for rehydrating", v4, v5, v6, v7, v8);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "events to remove after rehydration failure, count, %lulu", v3, v4, v5, v6, v7);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "delete visit in database since no matching data is found in routine", buf, 2u);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "delete visit event succeeded", v1, 2u);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_193_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete visit event failed, error %@", v2, v3, v4, v5, v6);
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchFamiliarityIndexResultsWithOptions failed with error, %@", v2, v3, v4, v5, v6);
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_198_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "familiarity index LOI level, %lu, %@", v2, 0x16u);
}

- (void)fetchHomeLOI
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "fetching homeLOI error", v2, v3, v4, v5, v6);
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_242_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "visit fetching hit error, %@", v2, v3, v4, v5, 2u);
}

- (void)_createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "No visit fetched to create new events", v2, v3, v4, v5, v6);
}

void __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch oldest visit failed with error, %@", v2, v3, v4, v5, v6);
}

@end