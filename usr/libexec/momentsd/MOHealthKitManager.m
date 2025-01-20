@interface MOHealthKitManager
+ (id)convertBiologicalSexObjToString:(id)a3;
- (HKHealthStore)healthStore;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)eventStore;
- (MOHealthKitManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_createEventFromMindfulSession:(id)a3;
- (id)_createEventFromStateOfMind:(id)a3;
- (id)_createEventFromWorkout:(id)a3;
- (id)_createQueryBasedonEvents:(id)a3 withPredicate:(id)a4;
- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 stateOfMind:(id)a4;
- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 workouts:(id)a4;
- (void)_createEventsFromStateOfMind:(id)a3 handler:(id)a4;
- (void)_createEventsFromWorkout:(id)a3 handler:(id)a4;
- (void)_createNewEventsFromStateOfMind:(id)a3 storedEvents:(id)a4 handler:(id)a5;
- (void)_createNewEventsFromWorkouts:(id)a3 storedEvents:(id)a4 handler:(id)a5;
- (void)_fetchLocationsFrom:(id)a3 handler:(id)a4;
- (void)_fetchMindfulSessionBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_fetchStateOfMindBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchUserAgeWithHandler:(id)a3;
- (void)_fetchUserBiologicalSexWithHandler:(id)a3;
- (void)_fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchWorkoutRouteLocations:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchWorkoutRoutes:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_rehydrateStateOfMind:(id)a3 handler:(id)a4;
- (void)_rehydrateStoredEvents:(id)a3 fromMindfulSession:(id)a4 handler:(id)a5;
- (void)_rehydrateStoredEvents:(id)a3 fromStateOfMind:(id)a4 handler:(id)a5;
- (void)_rehydrateStoredEvents:(id)a3 fromWorkouts:(id)a4 handler:(id)a5;
- (void)_rehydrateWorkouts:(id)a3 handler:(id)a4;
- (void)_saveMindfulSessions:(id)a3 handler:(id)a4;
- (void)_saveWorkouts:(id)a3 handler:(id)a4;
- (void)_setDynamicProperties:(id)a3 mindfulSession:(id)a4;
- (void)_setDynamicProperties:(id)a3 stateOfMind:(id)a4;
- (void)_setDynamicProperties:(id)a3 workout:(id)a4;
- (void)_updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveMindfulSessionsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchAndSaveWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)fetchUserAgeWithHandler:(id)a3;
- (void)fetchUserBiologicalSexWithHandler:(id)a3;
- (void)fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)rehydrateStateOfMind:(id)a3 handler:(id)a4;
- (void)rehydrateWorkouts:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4;
@end

@implementation MOHealthKitManager

- (MOHealthKitManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)HKHealthStore);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v5 getService:v11];

    if (v12)
    {
      if (v9)
      {
        v22.receiver = self;
        v22.super_class = (Class)MOHealthKitManager;
        v13 = [(MOHealthKitManager *)&v22 init];
        if (v13)
        {
          v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v15 = dispatch_queue_create("MOHealthKitManager", v14);
          queue = v13->_queue;
          v13->_queue = (OS_dispatch_queue *)v15;

          objc_storeStrong((id *)&v13->_healthStore, v9);
          objc_storeStrong((id *)&v13->_eventStore, v12);
          objc_storeStrong((id *)&v13->_configurationManager, v8);
        }
        self = v13;
        v17 = self;
        goto LABEL_14;
      }
    }
    else
    {
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MORoutineServiceManager initWithUniverse:]();
      }

      v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"MOHealthKitManager.m" lineNumber:54 description:@"Invalid parameter not satisfying: eventStore"];
    }
    v17 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[MOEventStore initWithUniverse:]();
  }

  id v9 = +[NSAssertionHandler currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"MOHealthKitManager.m" lineNumber:47 description:@"Invalid parameter not satisfying: configurationManager"];
  v17 = 0;
LABEL_15:

  return v17;
}

- (void)_fetchWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:2];
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:HKSampleSortIdentifierEndDate ascending:0];
  id v21 = v10;
  v11 = +[NSArray arrayWithObjects:&v21 count:1];

  v12 = [(MOHealthKitManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002D1D88;
  id v17 = v9;
  id v18 = v11;
  v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSampleQuery);
  v3 = +[HKObjectType workoutType];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002CB630;
  id v9 = *(id *)(a1 + 56);
  id v6 = [v2 initWithSampleType:v3 predicate:v4 limit:0 sortDescriptors:v5 resultsHandler:v8];

  v7 = [*(id *)(a1 + 48) healthStore];
  [v7 executeQuery:v6];
}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
    v13();
    goto LABEL_9;
  }
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();
  }

  if ([v9 code] != (id)6)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  CFStringRef v15 = @"Provider database is unavailable";
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:1536 userInfo:v11];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

- (void)_fetchStateOfMindBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:2];
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:HKSampleSortIdentifierEndDate ascending:0];
  id v21 = v10;
  v11 = +[NSArray arrayWithObjects:&v21 count:1];

  v12 = [(MOHealthKitManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002D1D88;
  id v17 = v9;
  id v18 = v11;
  v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSampleQuery);
  v3 = +[HKStateOfMindType stateOfMindType];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002CB630;
  id v9 = *(id *)(a1 + 56);
  id v6 = [v2 initWithSampleType:v3 predicate:v4 limit:0 sortDescriptors:v5 resultsHandler:v8];

  id v7 = [*(id *)(a1 + 48) healthStore];
  [v7 executeQuery:v6];
}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
    v13();
    goto LABEL_9;
  }
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();
  }

  if ([v9 code] != (id)6)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  CFStringRef v15 = @"Provider database is unavailable";
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:1536 userInfo:v11];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

- (id)_createEventFromWorkout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  id v7 = [v4 startDate];
  id v8 = [v4 endDate];
  id v9 = +[NSDate date];
  id v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:1 category:2];

  v11 = [v4 endDate];
  v12 = [(MOHealthKitManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  CFStringRef v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  v16 = [v4 UUID];

  id v17 = [v16 UUIDString];
  [(MOEvent *)v10 setIdentifierFromProvider:v17];

  return v10;
}

- (id)_createEventFromStateOfMind:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  id v7 = [v4 startDate];
  id v8 = [v4 endDate];
  id v9 = +[NSDate date];
  id v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:1 category:24];

  v11 = [v4 endDate];
  v12 = [(MOHealthKitManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  CFStringRef v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  v16 = [v4 UUID];

  id v17 = [v16 UUIDString];
  [(MOEvent *)v10 setIdentifierFromProvider:v17];

  return v10;
}

- (void)_setDynamicProperties:(id)a3 stateOfMind:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  id v6 = [v5 sourceRevision];
  id v7 = [v6 source];
  id v8 = [v7 bundleIdentifier];
  [v26 setAppBundle:v8];

  id v9 = [v5 sourceRevision];
  id v10 = [v9 source];
  [v26 setFromFirstParty:[v10 _hasFirstPartyBundleID]];

  v11 = [v26 stateOfMindEvent];

  if (!v11)
  {
    v12 = objc_alloc_init(MOEventStateOfMind);
    [v26 setStateOfMindEvent:v12];
  }
  double v13 = (double)(uint64_t)[v5 kind];
  float v14 = [v26 stateOfMindEvent];
  [v14 setReflectiveInterval:v13];

  [v5 valence];
  double v16 = v15;
  id v17 = [v26 stateOfMindEvent];
  [v17 setValence:v16];

  [v5 valence];
  id v18 = HKStateOfMindValenceClassificationForValence();
  [v18 doubleValue];
  double v20 = v19;
  id v21 = [v26 stateOfMindEvent];
  [v21 setValenceClassification:v20];

  objc_super v22 = [v5 labels];
  v23 = [v26 stateOfMindEvent];
  [v23 setLabels:v22];

  v24 = [v5 associations];
  v25 = [v26 stateOfMindEvent];
  [v25 setDomains:v24];
}

- (void)_setDynamicProperties:(id)a3 workout:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  [v5 workoutActivityType];
  id v6 = _HKWorkoutActivityNameForActivityType();
  id v7 = [v6 copy];
  [v36 setWorkoutType:v7];

  id v8 = [v5 sourceRevision];
  id v9 = [v8 source];
  id v10 = [v9 bundleIdentifier];
  [v36 setAppBundle:v10];

  v11 = [v5 sourceRevision];
  v12 = [v11 source];
  [v36 setFromFirstParty:[v12 _hasFirstPartyBundleID]];

  [v5 duration];
  double v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v36 setWorkoutDuration:v13];

  [v5 _totalDistanceInCanonicalUnit];
  float v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v36 setWorkoutTotalDistance:v14];

  [v5 _totalEnergyBurnedInCanonicalUnit];
  double v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v36 setWorkoutTotalEnergyBurned:v15];

  double v16 = [v5 metadata];
  id v17 = [v16 objectForKeyedSubscript:HKMetadataKeyAppleFitnessPlusSession];
  [v36 setIsFitnessPlusSession:[v17 BOOLValue]];

  id v18 = [v5 metadata];
  double v19 = [v18 objectForKeyedSubscript:HKMetadataKeyIndoorWorkout];
  id v20 = [v19 BOOLValue];
  id v21 = [v36 workoutEvent];
  [v21 setIsIndoors:v20];

  objc_super v22 = [v5 metadata];
  uint64_t v23 = _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude;
  v24 = [v22 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude];
  [v24 doubleValue];
  double v26 = v25;

  if (v26 != 0.0)
  {
    id v27 = objc_alloc((Class)CLLocation);
    v28 = [v5 metadata];
    v29 = [v28 objectForKeyedSubscript:v23];
    [v29 doubleValue];
    double v31 = v30;
    v32 = [v5 metadata];
    v33 = [v32 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLongitude];
    [v33 doubleValue];
    id v35 = [v27 initWithLatitude:v31 longitude:v34];
    [v36 setWorkoutLocationStart:v35];
  }
}

- (void)_fetchWorkoutRoutes:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[HKQuery predicateForObjectsFromWorkout:a3];
  id v8 = objc_alloc((Class)HKAnchoredObjectQuery);
  id v9 = +[HKSeriesType workoutRouteType];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke;
  v13[3] = &unk_1002D24F8;
  id v14 = v6;
  id v10 = v6;
  id v11 = [v8 initWithType:v9 predicate:v7 anchor:0 limit:0 resultsHandler:v13];

  v12 = [(MOHealthKitManager *)self healthStore];
  [v12 executeQuery:v11];
}

void __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7 = a6;
  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (void)_fetchWorkoutRouteLocations:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = objc_alloc((Class)HKWorkoutRouteQuery);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke;
  v15[3] = &unk_1002D2520;
  id v17 = v8;
  id v18 = v7;
  id v16 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  id v13 = [v9 initWithRoute:v11 dataHandler:v15];
  id v14 = [(MOHealthKitManager *)self healthStore];
  [v14 executeQuery:v13];
}

void __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    unint64_t v11 = (unint64_t)[v8 count];
    if ([v8 count])
    {
      id v12 = [*(id *)(a1 + 32) count];
      unint64_t v13 = (unint64_t)[v8 count] + (void)v12 - 1;
      unint64_t v14 = v13 / (unint64_t)[v8 count];
      unint64_t v11 = (v14 + 255) / v14;
      if (v11 > 1)
      {
        if (v11 >= (unint64_t)[v8 count])
        {
          [*(id *)(a1 + 40) addObjectsFromArray:v8];
        }
        else
        {
          double v19 = +[RTLocationDownsampler downsampleLocations:v8 outputSize:v11];
          [*(id *)(a1 + 40) addObjectsFromArray:v19];
        }
      }
      else
      {
        if (![*(id *)(a1 + 40) count])
        {
          double v15 = *(void **)(a1 + 40);
          id v16 = [v8 firstObject];
          [v15 addObject:v16];
        }
        id v17 = *(void **)(a1 + 40);
        id v18 = [v8 lastObject];
        [v17 addObject:v18];
      }
    }
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [v8 count];
      id v27 = [*(id *)(a1 + 40) count];
      id v28 = [*(id *)(a1 + 32) count];
      int v29 = 134219008;
      *(void *)double v30 = v26;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = a4;
      __int16 v31 = 2048;
      id v32 = v27;
      __int16 v33 = 2048;
      *(void *)double v34 = v28;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "_fetchWorkoutRouteLocations,itemCount,%lu,done,%d,accu,%lu,workoutCount,%lu,target,%lu", (uint8_t *)&v29, 0x30u);
    }

    if (a4)
    {
      id v21 = +[RTLocationDownsampler downsampleLocations:*(void *)(a1 + 40) outputSize:64];
      objc_super v22 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = [*(id *)(a1 + 40) count];
        id v24 = [v21 count];
        id v25 = [*(id *)(a1 + 32) count];
        int v29 = 67110144;
        *(_DWORD *)double v30 = 4;
        *(_WORD *)&v30[4] = 2048;
        *(void *)&v30[6] = v23;
        __int16 v31 = 2048;
        id v32 = v24;
        __int16 v33 = 1024;
        *(_DWORD *)double v34 = 64;
        *(_WORD *)&v34[4] = 2048;
        *(void *)&v34[6] = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "RTLocationDownsampler 2%d: in %lu, out %lu, target %d, raw %lu", (uint8_t *)&v29, 0x2Cu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_saveWorkouts:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__41;
  double v34 = __Block_byref_object_dispose__41;
  id v35 = 0;
  eventStore = self->_eventStore;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __44__MOHealthKitManager__saveWorkouts_handler___block_invoke;
  v29[3] = &unk_1002CADF8;
  v29[4] = &v30;
  [(MOEventStore *)eventStore fetchLastEventOfCategory:2 CompletionHandler:v29];
  objc_super v22 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 duration];
        if (v13 >= 60.0)
        {
          unint64_t v14 = [(MOHealthKitManager *)self _createEventFromWorkout:v12];
          double v15 = v14;
          if (!v31[5]
            || ([v14 startDate],
                id v16 = objc_claimAutoreleasedReturnValue(),
                [(id)v31[5] startDate],
                id v17 = objc_claimAutoreleasedReturnValue(),
                unsigned int v18 = [v16 isAfterDate:v17],
                v17,
                v16,
                v18))
          {
            [v22 addObject:v15];
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v9);
  }

  double v19 = self->_eventStore;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2;
  v23[3] = &unk_1002C9A50;
  id v20 = v21;
  id v24 = v20;
  [(MOEventStore *)v19 storeEvents:v22 CompletionHandler:v23];

  _Block_object_dispose(&v30, 8);
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (id)_createQueryBasedonEvents:(id)a3 withPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v8 = [v5 firstObject];
  id v9 = [v8 category];

  if (v9 == (id)2)
  {
    id v10 = objc_alloc((Class)HKQueryDescriptor);
    unint64_t v11 = +[HKObjectType workoutType];
    id v12 = [v10 initWithSampleType:v11 predicate:v6];

    double v13 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = 0;
      unint64_t v14 = "start rehydrating workout";
      double v15 = (uint8_t *)&v27;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, v15, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v16 = [v5 firstObject];
  id v17 = [v16 category];

  if (v17 == (id)13)
  {
    id v18 = objc_alloc((Class)HKQueryDescriptor);
    double v19 = +[HKSampleType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession];
    id v12 = [v18 initWithSampleType:v19 predicate:v6];

    double v13 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = 0;
      unint64_t v14 = "start rehydrating mindful session";
      double v15 = (uint8_t *)&v26;
      goto LABEL_10;
    }
LABEL_11:

    [v7 addObject:v12];
    goto LABEL_12;
  }
  id v20 = [v5 firstObject];
  id v21 = [v20 category];

  if (v21 == (id)24)
  {
    id v22 = objc_alloc((Class)HKQueryDescriptor);
    id v23 = +[HKObjectType stateOfMindType];
    id v12 = [v22 initWithSampleType:v23 predicate:v6];

    double v13 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = 0;
      unint64_t v14 = "start rehydrating state of mind";
      double v15 = (uint8_t *)&v25;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[MOHealthKitManager _createQueryBasedonEvents:withPredicate:]();
  }
LABEL_12:

  return v7;
}

- (void)rehydrateWorkouts:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOHealthKitManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOHealthKitManager_rehydrateWorkouts_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __48__MOHealthKitManager_rehydrateWorkouts_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateWorkouts:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateWorkouts:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke;
  v24[3] = &unk_1002CBAD0;
  id v8 = (id)objc_opt_new();
  id v25 = v8;
  [v6 enumerateObjectsUsingBlock:v24];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "start rehydrating health data, identifier count, %lu", buf, 0xCu);
  }

  if ([v8 count])
  {
    unint64_t v11 = +[NSSet setWithArray:v8];
    id v12 = +[HKQuery predicateForObjectsWithUUIDs:v11];

    id v13 = [(MOHealthKitManager *)self _createQueryBasedonEvents:v6 withPredicate:v12];
    if ([v13 count])
    {
      id v14 = objc_alloc((Class)HKSampleQuery);
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      double v19 = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418;
      id v20 = &unk_1002D2548;
      id v23 = v7;
      id v21 = v6;
      id v22 = self;
      id v15 = [v14 initWithQueryDescriptors:v13 limit:0 resultsHandler:&v17];
      id v16 = [(MOHealthKitManager *)self healthStore];
      [v16 executeQuery:v15];
    }
    else if (v7)
    {
      (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 identifierFromProvider];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = objc_alloc((Class)NSUUID);
    id v6 = [v8 identifierFromProvider];
    id v7 = [v5 initWithUUIDString:v6];
    [v4 addObject:v7];
  }
}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) firstObject];
    id v10 = [v9 category];

    if (v10 == (id)2)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      unint64_t v11 = *(void **)(a1 + 40);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_419;
      v19[3] = &unk_1002CA140;
      id v20 = *(id *)(a1 + 48);
      [v11 _rehydrateStoredEvents:v12 fromWorkouts:v6 handler:v19];
    }
    id v13 = [*(id *)(a1 + 32) firstObject];
    id v14 = [v13 category];

    if (v14 == (id)13)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_2;
      v17[3] = &unk_1002CA140;
      id v18 = *(id *)(a1 + 48);
      [v15 _rehydrateStoredEvents:v16 fromMindfulSession:v6 handler:v17];
    }
  }
}

uint64_t __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_419(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rehydrateStateOfMind:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOHealthKitManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MOHealthKitManager_rehydrateStateOfMind_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __51__MOHealthKitManager_rehydrateStateOfMind_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateStateOfMind:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateStateOfMind:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke;
  v24[3] = &unk_1002CBAD0;
  id v8 = (id)objc_opt_new();
  id v25 = v8;
  [v6 enumerateObjectsUsingBlock:v24];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "start rehydrating state of mind data, identifier count, %lu", buf, 0xCu);
  }

  if ([v8 count])
  {
    unint64_t v11 = +[NSSet setWithArray:v8];
    id v12 = +[HKQuery predicateForObjectsWithUUIDs:v11];

    id v13 = [(MOHealthKitManager *)self _createQueryBasedonEvents:v6 withPredicate:v12];
    if ([v13 count])
    {
      id v14 = objc_alloc((Class)HKSampleQuery);
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      double v19 = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_421;
      id v20 = &unk_1002D2548;
      id v23 = v7;
      id v21 = v6;
      id v22 = self;
      id v15 = [v14 initWithQueryDescriptors:v13 limit:0 resultsHandler:&v17];
      uint64_t v16 = [(MOHealthKitManager *)self healthStore];
      [v16 executeQuery:v15];
    }
    else if (v7)
    {
      (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
}

void __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 identifierFromProvider];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = objc_alloc((Class)NSUUID);
    id v6 = [v8 identifierFromProvider];
    id v7 = [v5 initWithUUIDString:v6];
    [v4 addObject:v7];
  }
}

void __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_421(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) firstObject];
    id v10 = [v9 category];

    if (v10 == (id)24)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      unint64_t v11 = *(void **)(a1 + 40);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_422;
      v13[3] = &unk_1002CA140;
      id v14 = *(id *)(a1 + 48);
      [v11 _rehydrateStoredEvents:v12 fromStateOfMind:v6 handler:v13];
    }
  }
}

uint64_t __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_422(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_rehydrateStoredEvents:(id)a3 fromWorkouts:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  double v34 = (void (**)(id, void *, void))a5;
  id v35 = v7;
  __int16 v33 = v8;
  if ([v7 count])
  {
    if ([v8 count])
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke;
      v67[3] = &unk_1002CBAD0;
      id v38 = (id)objc_opt_new();
      id v68 = v38;
      [v7 enumerateObjectsUsingBlock:v67];
      id v9 = [v38 allKeys];
      BOOL v10 = [v9 count] == 0;

      if (v10)
      {
        uint64_t v32 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[MOHealthKitManager _rehydrateStoredEvents:fromWorkouts:handler:]();
        }

        v34[2](v34, &__NSArray0__struct, 0);
      }
      else
      {
        *(void *)buf = 0;
        v62 = buf;
        uint64_t v63 = 0x3032000000;
        v64 = __Block_byref_object_copy__41;
        v65 = __Block_byref_object_dispose__41;
        id v66 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__41;
        v59 = __Block_byref_object_dispose__41;
        id v60 = objc_alloc_init((Class)NSMutableArray);
        unint64_t v11 = dispatch_group_create();
        uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v37 = dispatch_queue_create("com.apple.health.workout.rehydrate", v12);

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id obj = v33;
        id v13 = [obj countByEnumeratingWithState:&v51 objects:v70 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v52;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v52 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              id v17 = [v16 UUID];
              uint64_t v18 = [v17 UUIDString];
              double v19 = [v38 objectForKeyedSubscript:v18];

              if (v19)
              {
                dispatch_group_enter(v11);
                id v20 = [v19 copy];
                if ([v19 rehydrationFailCount])
                {
                  id v21 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v19 category] provider:[v19 provider] failureCount:[v19 rehydrationFailCount]];
                  id v50 = 0;
                  [(MORehydrationThresholdMetrics *)v21 submitMetricsWithError:&v50];
                  id v22 = v50;
                  [v20 setRehydrationFailCount:0];
                  [(id)v56[5] addObject:v19];
                }
                [(MOHealthKitManager *)self _setDynamicProperties:v20 workout:v16];
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472;
                v45[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_427;
                v45[3] = &unk_1002D2570;
                id v23 = v20;
                id v46 = v23;
                v47 = v37;
                v49 = buf;
                v48 = v11;
                [(MOHealthKitManager *)self _fetchLocationsFrom:v16 handler:v45];
              }
            }
            id v13 = [obj countByEnumeratingWithState:&v51 objects:v70 count:16];
          }
          while (v13);
        }

        id v24 = [(MOHealthKitManager *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_3;
        block[3] = &unk_1002D2598;
        v43 = buf;
        id v41 = v35;
        v42 = v34;
        v44 = &v55;
        dispatch_group_notify(v11, v24, block);

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      __int16 v26 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no workouts for rehydrating workout events", buf, 2u);
      }

      v34[2](v34, &__NSArray0__struct, 0);
      id v27 = [MORehydrationMetrics alloc];
      long long v28 = [v35 firstObject];
      id v29 = [v28 category];
      uint64_t v30 = [v35 firstObject];
      __int16 v31 = [[MORehydrationMetrics alloc] initWithCategory:v27 provider:v30 spiSuccess:1 spiError:0 failCount:[v35 count] successAfterPreFailCount:3 totalCount:[v35 count] rehydrationTrigger:0.0];

      uint64_t v69 = 0;
      [(MORehydrationMetrics *)v31 submitMetricsWithError:&v69];
    }
  }
  else
  {
    id v25 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "no input events for rehydrating workout events", buf, 2u);
    }

    v34[2](v34, &__NSArray0__struct, 0);
  }
}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 identifierFromProvider];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 identifierFromProvider];
    [v4 setObject:v6 forKey:v5];
  }
}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_427(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setWorkoutLocationRoute:a2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_2;
  v4[3] = &unk_1002CEC88;
  uint64_t v6 = *(void *)(a1 + 56);
  v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_3(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    id v4 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218240;
    id v12 = v3;
    __int16 v13 = 2048;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "rehydrated workout count, %lu, stored workout count, %lu", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = [MORehydrationMetrics alloc];
  uint64_t v6 = [*(id *)(a1 + 32) firstObject];
  id v7 = [v6 category];
  id v8 = [*(id *)(a1 + 32) firstObject];
  id v9 = [[MORehydrationMetrics alloc] initWithCategory:v5 provider:v8 spiSuccess:1 spiError:0 failCount:[v8 count] successAfterPreFailCount:[v8 count] totalCount:[v8 count] rehydrationTrigger:[v8 count]-[v8 count]];

  uint64_t v10 = 0;
  [(MORehydrationMetrics *)v9 submitMetricsWithError:&v10];
}

- (void)_rehydrateStoredEvents:(id)a3 fromStateOfMind:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if (![v7 count])
  {
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOHealthKitManager _rehydrateStoredEvents:fromStateOfMind:handler:]();
    }
    goto LABEL_19;
  }
  if (![v8 count])
  {
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOHealthKitManager _rehydrateStoredEvents:fromStateOfMind:handler:]();
    }
LABEL_19:

    v9[2](v9, &__NSArray0__struct, 0);
    goto LABEL_20;
  }
  id v25 = v9;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __69__MOHealthKitManager__rehydrateStoredEvents_fromStateOfMind_handler___block_invoke;
  v33[3] = &unk_1002CBAD0;
  id v10 = (id)objc_opt_new();
  id v34 = v10;
  id v27 = v7;
  [v7 enumerateObjectsUsingBlock:v33];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v8;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v18 = [v17 UUID:v25];
        double v19 = [v18 UUIDString];
        id v20 = [v10 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v20 copy];
          [(MOHealthKitManager *)self _setDynamicProperties:v21 stateOfMind:v17];
          [v11 addObject:v21];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v14);
  }

  id v22 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [v11 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "health data rehydrated state of mind count, %lu", buf, 0xCu);
  }

  id v9 = v25;
  v25[2](v25, v11, 0);

  id v8 = v26;
  id v7 = v27;
LABEL_20:
}

void __69__MOHealthKitManager__rehydrateStoredEvents_fromStateOfMind_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 identifierFromProvider];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 identifierFromProvider];
    [v4 setObject:v6 forKey:v5];
  }
}

- (void)_rehydrateStoredEvents:(id)a3 fromMindfulSession:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if (![v7 count])
  {
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOHealthKitManager _rehydrateStoredEvents:fromMindfulSession:handler:]();
    }
    goto LABEL_19;
  }
  if (![v8 count])
  {
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOHealthKitManager _rehydrateStoredEvents:fromMindfulSession:handler:]();
    }
LABEL_19:

    v9[2](v9, &__NSArray0__struct, 0);
    goto LABEL_20;
  }
  id v25 = v9;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __72__MOHealthKitManager__rehydrateStoredEvents_fromMindfulSession_handler___block_invoke;
  v33[3] = &unk_1002CBAD0;
  id v10 = (id)objc_opt_new();
  id v34 = v10;
  id v27 = v7;
  [v7 enumerateObjectsUsingBlock:v33];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v8;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v18 = [v17 UUID:v25];
        double v19 = [v18 UUIDString];
        id v20 = [v10 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v20 copy];
          [(MOHealthKitManager *)self _setDynamicProperties:v21 mindfulSession:v17];
          [v11 addObject:v21];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v14);
  }

  id v22 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [v11 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "health data rehydrated mindful sessions count, %lu", buf, 0xCu);
  }

  id v9 = v25;
  v25[2](v25, v11, 0);

  id v8 = v26;
  id v7 = v27;
LABEL_20:
}

void __72__MOHealthKitManager__rehydrateStoredEvents_fromMindfulSession_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 identifierFromProvider];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 identifierFromProvider];
    [v4 setObject:v6 forKey:v5];
  }
}

- (void)_fetchLocationsFrom:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__41;
  void v15[4] = __Block_byref_object_dispose__41;
  id v16 = (id)objc_opt_new();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke;
  v10[3] = &unk_1002CF5E0;
  id v8 = v6;
  id v11 = v8;
  id v12 = self;
  id v14 = v15;
  id v9 = v7;
  id v13 = v9;
  [(MOHealthKitManager *)self _fetchWorkoutRoutes:v8 CompletionHandler:v10];

  _Block_object_dispose(v15, 8);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_cold_1(v3, a1, v4);
    }

    id v5 = dispatch_group_create();
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.health.workout.route.fetch", v6);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v3;
    id obj = v3;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v11);
          dispatch_group_enter(v5);
          id v13 = *(void **)(a1 + 40);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_429;
          v24[3] = &unk_1002D25E8;
          id v25 = v7;
          uint64_t v26 = v12;
          id v14 = *(id *)(a1 + 32);
          uint64_t v15 = *(void *)(a1 + 56);
          id v27 = v14;
          uint64_t v29 = v15;
          long long v28 = v5;
          [v13 _fetchWorkoutRouteLocations:v12 CompletionHandler:v24];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    id v16 = [*(id *)(a1 + 40) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_430;
    block[3] = &unk_1002D2610;
    uint64_t v23 = *(void *)(a1 + 56);
    id v20 = obj;
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    dispatch_group_notify(v5, v16, block);

    id v3 = v17;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_429(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2;
  v10[3] = &unk_1002D25C0;
  id v5 = *(NSObject **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v11 = v3;
  uint64_t v12 = v4;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 64);
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  dispatch_sync(v5, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) count];
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_2(v2, a1);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:*(void *)(a1 + 32)];
  }
  else
  {
    if (v5) {
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_1(a1, v4);
    }
  }
}

uint64_t __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_430(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_430_cold_1(v2, a1);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    BOOL v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v5();
  }
}

- (void)updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOHealthKitManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002C9A50;
  id v4 = *(id *)(a1 + 48);
  [v1 _updateWorkoutsDeletedAtSource:v2 handler:v3];
}

uint64_t __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke;
  v24[3] = &unk_1002CBAD0;
  id v8 = (id)objc_opt_new();
  id v25 = v8;
  [v6 enumerateObjectsUsingBlock:v24];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "start updating health data deleted at source, identifier count, %lu", buf, 0xCu);
  }

  if ([v8 count])
  {
    id v11 = +[NSSet setWithArray:v8];
    id v12 = +[HKQuery predicateForObjectsWithUUIDs:v11];

    id v13 = [(MOHealthKitManager *)self _createQueryBasedonEvents:v6 withPredicate:v12];
    if ([v13 count])
    {
      id v14 = objc_alloc((Class)HKSampleQuery);
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      double v19 = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_431;
      id v20 = &unk_1002D2548;
      id v23 = v7;
      id v21 = v6;
      id v22 = self;
      id v15 = [v14 initWithQueryDescriptors:v13 limit:0 resultsHandler:&v17];
      id v16 = [(MOHealthKitManager *)self healthStore];
      [v16 executeQuery:v15];
    }
    else if (v7)
    {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifierFromProvider];

  if (v4)
  {
    BOOL v5 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v3 identifierFromProvider];
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "adding identifier to the list: %@", (uint8_t *)&v11, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_alloc((Class)NSUUID);
    id v9 = [v3 identifierFromProvider];
    id v10 = [v8 initWithUUIDString:v9];
    [v7 addObject:v10];
  }
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_431(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = [MORehydrationMetrics alloc];
    [*(id *)(a1 + 32) firstObject];
    v11 = uint64_t v10 = a1;
    id v12 = [v11 category];
    id v13 = [*(id *)(v10 + 32) firstObject];
    id v14 = [v13 provider];
    id v15 = [v7 description];
    id v16 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v9, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v12, v14, 0, v15, [*(id *)(v10 + 32) count], 1, (double)(int)objc_msgSend(*(id *)(v10 + 32), "count"), 0.0);

    uint64_t v71 = 0;
    [(MORehydrationMetrics *)v16 submitMetricsWithError:&v71];
  }
  else
  {
    id v16 = (MORehydrationMetrics *)objc_opt_new();
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v56 = objc_alloc_init((Class)NSMutableArray);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v18 = v6;
    id v19 = [v18 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v68;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [*(id *)(*((void *)&v67 + 1) + 8 * i) UUID];
          id v24 = [v23 UUIDString];
          [(MORehydrationMetrics *)v16 addObject:v24];
        }
        id v20 = [v18 countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v20);
    }
    id v55 = v6;

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v54 = a1;
    id v25 = *(id *)(a1 + 32);
    id v26 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v64;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          long long v31 = [v30 identifierFromProvider];
          unsigned __int8 v32 = [(MORehydrationMetrics *)v16 containsObject:v31];

          long long v33 = (char *)[v30 rehydrationFailCount];
          if (v32)
          {
            if (v33)
            {
              id v34 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v30 category] provider:[v30 provider] failureCount:[v30 rehydrationFailCount]];
              id v62 = 0;
              [(MORehydrationThresholdMetrics *)v34 submitMetricsWithError:&v62];
              id v35 = v62;
              [v30 setRehydrationFailCount:0];
              [v56 addObject:v30];
            }
          }
          else
          {
            [v30 setRehydrationFailCount:v33 + 1];
            [v17 addObject:v30];
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v27);
    }

    id v36 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = [v17 count];
      id v38 = [v17 firstObject];
      v39 = [v38 describeCategory];
      *(_DWORD *)buf = 134218242;
      id v73 = v37;
      __int16 v74 = 2112;
      v75 = v39;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "health events failed to rehydrate,  count, %lu, with category, %@", buf, 0x16u);
    }
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      id v41 = [v56 count];
      v42 = [v56 firstObject];
      v43 = [v42 describeCategory];
      *(_DWORD *)buf = 134218242;
      id v73 = v41;
      __int16 v74 = 2112;
      v75 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "previously rehdyration failed health events now are found,  count, %lu, with category, %@", buf, 0x16u);
    }
    v44 = [MORehydrationMetrics alloc];
    v45 = [*(id *)(v54 + 32) firstObject];
    id v46 = [v45 category];
    v47 = [*(id *)(v54 + 32) firstObject];
    v48 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v44, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v46, [v47 provider], 1, 0, [*(id *)(v54 + 32) count], 1, [v17 count], [v56 count]);

    id v61 = 0;
    [(MORehydrationMetrics *)v48 submitMetricsWithError:&v61];
    id v49 = v61;
    [v56 addObjectsFromArray:v17];
    id v50 = [*(id *)(v54 + 40) eventStore];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_433;
    v57[3] = &unk_1002CE280;
    uint64_t v51 = *(void *)(v54 + 40);
    long long v52 = *(void **)(v54 + 48);
    id v58 = v56;
    uint64_t v59 = v51;
    id v60 = v52;
    id v53 = v56;
    [v50 storeEvents:v53 CompletionHandler:v57];

    id v7 = 0;
    id v6 = v55;
  }
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_433(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_433_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "update invalid health data events succeeded, count, %lu", buf, 0xCu);
  }

  uint64_t v10 = [a1[5] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_434;
  block[3] = &unk_1002D14D0;
  id v11 = a1[6];
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_434(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)fetchAndSaveWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CE538;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOHealthKitManager *)v9 _fetchWorkoutsBetweenStartDate:a3 EndDate:a4 CompletionHandler:v8];
}

void __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 count];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v15 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "save %lu workouts as event into database", buf, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke_435;
    v12[3] = &unk_1002C9A50;
    id v10 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v10 _saveWorkouts:v5 handler:v12];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no workouts fetched for saving", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v6, &__NSDictionary0__struct);
    }
  }
}

uint64_t __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke_435(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchMindfulSessionBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a5;
  BOOL v9 = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:2];
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:HKSampleSortIdentifierEndDate ascending:0];
  id v21 = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:&v21 count:1];

  id v12 = [(MOHealthKitManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002D1D88;
  id v17 = v9;
  id v18 = v11;
  id v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSampleQuery);
  id v3 = +[HKSampleType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002CB630;
  id v9 = *(id *)(a1 + 56);
  id v6 = [v2 initWithSampleType:v3 predicate:v4 limit:0 sortDescriptors:v5 resultsHandler:v8];

  id v7 = [*(id *)(a1 + 48) healthStore];
  [v7 executeQuery:v6];
}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      id v12 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetched %lu mindful sessions ", (uint8_t *)&v11, 0xCu);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (id)_createEventFromMindfulSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  id v7 = [v4 startDate];
  id v8 = [v4 endDate];
  id v9 = +[NSDate date];
  id v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:1 category:13];

  int v11 = [v4 endDate];
  id v12 = [(MOHealthKitManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  id v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  id v16 = [v4 UUID];

  id v17 = [v16 UUIDString];
  [(MOEvent *)v10 setIdentifierFromProvider:v17];

  return v10;
}

- (void)_saveMindfulSessions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__41;
  unsigned __int8 v32 = __Block_byref_object_dispose__41;
  id v33 = 0;
  eventStore = self->_eventStore;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke;
  v27[3] = &unk_1002CADF8;
  v27[4] = &v28;
  [(MOEventStore *)eventStore fetchLastEventOfCategory:13 CompletionHandler:v27];
  id v8 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = [(MOHealthKitManager *)self _createEventFromMindfulSession:*(void *)(*((void *)&v23 + 1) + 8 * (void)v12)];
        float v14 = v13;
        if (!v29[5]
          || ([v13 startDate],
              id v15 = objc_claimAutoreleasedReturnValue(),
              [(id)v29[5] startDate],
              id v16 = objc_claimAutoreleasedReturnValue(),
              unsigned int v17 = [v15 isAfterDate:v16],
              v16,
              v15,
              v17))
        {
          [v8 addObject:v14];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v10);
  }

  id v18 = self->_eventStore;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2;
  v21[3] = &unk_1002C9A50;
  id v19 = v20;
  id v22 = v19;
  [(MOEventStore *)v18 storeEvents:v8 CompletionHandler:v21];

  _Block_object_dispose(&v28, 8);
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)_setDynamicProperties:(id)a3 mindfulSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 sourceRevision];
  uint64_t v8 = [v7 source];
  id v9 = [v8 bundleIdentifier];
  [v6 setAppBundle:v9];

  id v11 = [v5 sourceRevision];

  id v10 = [v11 source];
  [v6 setFromFirstParty:[v10 _hasFirstPartyBundleID]];
}

- (void)fetchAndSaveMindfulSessionsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CE538;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOHealthKitManager *)v9 _fetchMindfulSessionBetweenStartDate:a3 EndDate:a4 CompletionHandler:v8];
}

void __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no mindful sessions fetched for saving", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v6, &__NSDictionary0__struct);
    }
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "save %lu mindful sessions as event into database", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke_436;
    v11[3] = &unk_1002C9A50;
    id v10 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v10 _saveMindfulSessions:v5 handler:v11];
  }
}

uint64_t __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke_436(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchUserBiologicalSexWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MOHealthKitManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __56__MOHealthKitManager_fetchUserBiologicalSexWithHandler___block_invoke;
  v7[3] = &unk_1002CCDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __56__MOHealthKitManager_fetchUserBiologicalSexWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchUserBiologicalSexWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchUserBiologicalSexWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  if (v4)
  {
    id v5 = [(MOHealthKitManager *)self healthStore];
    id v11 = 0;
    id v6 = [v5 biologicalSexWithError:&v11];
    id v7 = v11;

    if (v7)
    {
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        double v13 = v9;
        __int16 v14 = 2112;
        id v15 = v7;
        id v10 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, Unable to access biological sex due to error: %@", buf, 0x16u);
      }
      v4[2](v4, 0, v7);
    }
    else
    {
      ((void (**)(id, void *, id))v4)[2](v4, v6, 0);
    }
  }
}

- (void)fetchUserAgeWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MOHealthKitManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __46__MOHealthKitManager_fetchUserAgeWithHandler___block_invoke;
  v7[3] = &unk_1002CCDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __46__MOHealthKitManager_fetchUserAgeWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchUserAgeWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchUserAgeWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  if (v4)
  {
    id v5 = [(MOHealthKitManager *)self healthStore];
    id v19 = 0;
    id v6 = [v5 dateOfBirthComponentsWithError:&v19];
    id v7 = v19;

    if (v7)
    {
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v7;
        id v10 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, Unable to access age due to error: %@", buf, 0x16u);
      }
      v4[2](v4, 0, v7);
    }
    else if (v6)
    {
      id v11 = +[NSCalendar currentCalendar];
      id v12 = [v11 dateFromComponents:v6];
      double v13 = +[NSDate date];
      __int16 v14 = [v11 components:4 fromDate:v12 toDate:v13 options:0];

      id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 year]);
      ((void (**)(id, void *, id))v4)[2](v4, v15, 0);
    }
    else
    {
      id v16 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v21 = v17;
        id v18 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, dateOfBirthComponents is nil.", buf, 0xCu);
      }
      v4[2](v4, 0, 0);
    }
  }
}

+ (id)convertBiologicalSexObjToString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 biologicalSex];
  if ((unint64_t)v3 > 3) {
    return 0;
  }
  else {
    return *(&off_1002D2680 + (void)v3);
  }
}

- (void)fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(MOHealthKitManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__MOHealthKitManager_fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __90__MOHealthKitManager_fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWorkoutEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  __int16 v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 2];
  id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 1];
  v29[0] = v14;
  v29[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v29 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  id v18 = [v13 filteredArrayUsingPredicate:v17];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002CE818;
  id v27 = v11;
  id v28 = v12;
  id v24 = v18;
  long long v25 = self;
  id v26 = v10;
  id v19 = v11;
  id v20 = v10;
  id v21 = v18;
  id v22 = v12;
  [(MOHealthKitManager *)self _fetchWorkoutsBetweenStartDate:v20 EndDate:v19 CompletionHandler:v23];
}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetching workouts from source hit error", buf, 2u);
    }

    (*((void (**)(void))a1[8] + 2))();
    id v9 = [MORehydrationMetrics alloc];
    id v10 = [v6 description];
    id v11 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v9, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 2, 1, 0, v10, [a1[4] count], 3, (double)(int)objc_msgSend(a1[4], "count"), 0.0);

    uint64_t v44 = 0;
    [v11 submitMetricsWithError:&v44];
  }
  else
  {
    id v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    *(void *)buf = 0;
    v39 = buf;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__41;
    v42 = __Block_byref_object_dispose__41;
    id v43 = 0;
    id v14 = a1[4];
    id v13 = a1[5];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_461;
    v35[3] = &unk_1002C9D68;
    id v37 = buf;
    id v15 = v12;
    id v36 = v15;
    [v13 _rehydrateStoredEvents:v14 fromWorkouts:v5 handler:v35];
    dispatch_group_enter(v15);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__41;
    void v33[4] = __Block_byref_object_dispose__41;
    id v34 = 0;
    id v17 = a1[4];
    id v16 = a1[5];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v30[3] = &unk_1002C9D68;
    unsigned __int8 v32 = v33;
    id v11 = v15;
    long long v31 = v11;
    [v16 _createNewEventsFromWorkouts:v5 storedEvents:v17 handler:v30];
    id v18 = [a1[5] queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002D2638;
    int8x16_t v20 = *((int8x16_t *)a1 + 2);
    id v19 = (id)v20.i64[0];
    int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
    id v23 = v5;
    id v24 = a1[6];
    id v25 = a1[7];
    id v28 = buf;
    uint64_t v29 = v33;
    id v26 = v7;
    id v27 = a1[8];
    dispatch_group_notify(v11, v18, block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_461(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _findUnrehydratedEventsWithStoredEvents:*(void *)(a1 + 40) workouts:*(void *)(a1 + 48)];
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count];
    id v8 = [v2 count];
    id v9 = [*(id *)(a1 + 40) count];
    int v12 = 138413570;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2048;
    id v19 = v7;
    __int16 v20 = 2048;
    id v21 = v8;
    __int16 v22 = 2048;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated workout events count, %lu, new workout events counts, %lu, unrehydrated workout events count, %lu, stored workout events count, %lu", (uint8_t *)&v12, 0x3Eu);
  }

  if (v2) {
    [*(id *)(a1 + 72) setObject:v2 forKey:@"unrehydratedEvents"];
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v10) {
    [*(id *)(a1 + 72) setObject:v10 forKey:@"newEvents"];
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v11) {
    [*(id *)(a1 + 72) setObject:v11 forKey:@"rehydratedEvents"];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(MOHealthKitManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOHealthKitManager_fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __94__MOHealthKitManager_fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStateOfMindEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  __int16 v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 1];
  v29[0] = v14;
  v29[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v29 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  id v18 = [v13 filteredArrayUsingPredicate:v17];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002CE818;
  id v27 = v11;
  id v28 = v12;
  id v24 = v18;
  id v25 = self;
  id v26 = v10;
  id v19 = v11;
  id v20 = v10;
  id v21 = v18;
  id v22 = v12;
  [(MOHealthKitManager *)self _fetchStateOfMindBetweenStartDate:v20 EndDate:v19 CompletionHandler:v23];
}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetching state of mind from source hit error", buf, 2u);
    }

    (*((void (**)(void))a1[8] + 2))();
    id v9 = [MORehydrationMetrics alloc];
    id v10 = [v6 description];
    id v11 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v9, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 24, 1, 0, v10, [a1[4] count], 3, (double)(int)objc_msgSend(a1[4], "count"), 0.0);

    uint64_t v44 = 0;
    [v11 submitMetricsWithError:&v44];
  }
  else
  {
    id v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    *(void *)buf = 0;
    v39 = buf;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__41;
    v42 = __Block_byref_object_dispose__41;
    id v43 = 0;
    id v14 = a1[4];
    id v13 = a1[5];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_462;
    v35[3] = &unk_1002C9D68;
    id v37 = buf;
    id v15 = v12;
    id v36 = v15;
    [v13 _rehydrateStoredEvents:v14 fromStateOfMind:v5 handler:v35];
    dispatch_group_enter(v15);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__41;
    void v33[4] = __Block_byref_object_dispose__41;
    id v34 = 0;
    id v17 = a1[4];
    id v16 = a1[5];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v30[3] = &unk_1002C9D68;
    unsigned __int8 v32 = v33;
    id v11 = v15;
    long long v31 = v11;
    [v16 _createNewEventsFromStateOfMind:v5 storedEvents:v17 handler:v30];
    id v18 = [a1[5] queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002D2638;
    int8x16_t v20 = *((int8x16_t *)a1 + 2);
    id v19 = (id)v20.i64[0];
    int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
    id v23 = v5;
    id v24 = a1[6];
    id v25 = a1[7];
    id v28 = buf;
    uint64_t v29 = v33;
    id v26 = v7;
    id v27 = a1[8];
    dispatch_group_notify(v11, v18, block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_462(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _findUnrehydratedEventsWithStoredEvents:*(void *)(a1 + 40) stateOfMind:*(void *)(a1 + 48)];
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count];
    id v8 = [v2 count];
    id v9 = [*(id *)(a1 + 40) count];
    int v12 = 138413570;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2048;
    id v19 = v7;
    __int16 v20 = 2048;
    id v21 = v8;
    __int16 v22 = 2048;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated state of mind events count, %lu, new state of mind events counts, %lu, unrehydrated state of mind events count, %lu, stored state of mind events count, %lu", (uint8_t *)&v12, 0x3Eu);
  }

  if (v2) {
    [*(id *)(a1 + 72) setObject:v2 forKey:@"unrehydratedEvents"];
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v10) {
    [*(id *)(a1 + 72) setObject:v10 forKey:@"newEvents"];
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v11) {
    [*(id *)(a1 + 72) setObject:v11 forKey:@"rehydratedEvents"];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)_createEventsFromWorkout:(id)a3 handler:(id)a4
{
  id v17 = a3;
  id v18 = a4;
  if ([v17 count])
  {
    *(void *)buf = 0;
    id v33 = buf;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__41;
    id v36 = __Block_byref_object_dispose__41;
    id v37 = (id)objc_opt_new();
    id v6 = dispatch_group_create();
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.health.workout.event.create", v7);

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v17;
    id v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v11);
          dispatch_group_enter(v6);
          uint64_t v13 = [(MOHealthKitManager *)self _createEventFromWorkout:v12];
          [(MOHealthKitManager *)self _setDynamicProperties:v13 workout:v12];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke;
          v23[3] = &unk_1002D2570;
          id v14 = v13;
          id v24 = v14;
          id v25 = v8;
          id v27 = buf;
          id v26 = v6;
          [(MOHealthKitManager *)self _fetchLocationsFrom:v12 handler:v23];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [(MOHealthKitManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_3;
    block[3] = &unk_1002D2660;
    __int16 v22 = buf;
    id v21 = v18;
    dispatch_group_notify(v6, v15, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v16 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "no workouts for creating events", buf, 2u);
    }

    (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
  }
}

void __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setWorkoutLocationRoute:a2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_2;
  v4[3] = &unk_1002CEC88;
  uint64_t v6 = *(void *)(a1 + 56);
  id v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

uint64_t __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_3(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "health: new workout count, %lu", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createEventsFromStateOfMind:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([v6 count])
  {
    dispatch_queue_t v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = -[MOHealthKitManager _createEventFromStateOfMind:](self, "_createEventFromStateOfMind:", v14, (void)v19);
          [(MOHealthKitManager *)self _setDynamicProperties:v15 stateOfMind:v14];
          [v8 addObject:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v11);
    }

    __int16 v16 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "health: new state of mind count, %lu", buf, 0xCu);
    }

    v7[2](v7, v8, 0);
  }
  else
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "no state of mind data for creating events", buf, 2u);
    }

    v7[2](v7, 0, 0);
  }
}

- (void)_createNewEventsFromWorkouts:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if ([v9 count])
    {
      unsigned __int8 v32 = self;
      id v33 = v10;
      id v35 = v8;
      id v11 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v34 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v43;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v18 = [v17 identifierFromProvider];

            if (v18)
            {
              long long v19 = [v17 identifierFromProvider];
              [v11 addObject:v19];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v14);
      }

      long long v20 = objc_opt_new();
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v21 = v35;
      id v22 = [v21 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
            id v27 = [v26 UUID];
            long long v28 = [v27 UUIDString];
            unsigned __int8 v29 = [v11 containsObject:v28];

            if ((v29 & 1) == 0) {
              [v20 addObject:v26];
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v38 objects:v49 count:16];
        }
        while (v23);
      }

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke_2;
      v36[3] = &unk_1002CA140;
      id v10 = v33;
      id v37 = v33;
      [(MOHealthKitManager *)v32 _createEventsFromWorkout:v20 handler:v36];

      id v9 = v34;
      id v8 = v35;
    }
    else
    {
      long long v31 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "no stored events to check for creating new workout events", buf, 2u);
      }

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke;
      v46[3] = &unk_1002CA140;
      id v47 = v10;
      [(MOHealthKitManager *)self _createEventsFromWorkout:v8 handler:v46];
    }
  }
  else
  {
    long long v30 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "no workouts for creating new workout events", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

uint64_t __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createNewEventsFromStateOfMind:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if ([v9 count])
    {
      unsigned __int8 v32 = self;
      id v33 = v10;
      id v35 = v8;
      id v11 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v34 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v43;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v18 = [v17 identifierFromProvider];

            if (v18)
            {
              long long v19 = [v17 identifierFromProvider];
              [v11 addObject:v19];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v14);
      }

      long long v20 = objc_opt_new();
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v21 = v35;
      id v22 = [v21 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
            id v27 = [v26 UUID];
            long long v28 = [v27 UUIDString];
            unsigned __int8 v29 = [v11 containsObject:v28];

            if ((v29 & 1) == 0) {
              [v20 addObject:v26];
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v38 objects:v49 count:16];
        }
        while (v23);
      }

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke_2;
      v36[3] = &unk_1002CA140;
      id v10 = v33;
      id v37 = v33;
      [(MOHealthKitManager *)v32 _createEventsFromStateOfMind:v20 handler:v36];

      id v9 = v34;
      id v8 = v35;
    }
    else
    {
      long long v31 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "no stored events to check for creating new state of mind events", buf, 2u);
      }

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke;
      v46[3] = &unk_1002CA140;
      id v47 = v10;
      [(MOHealthKitManager *)self _createEventsFromStateOfMind:v8 handler:v46];
    }
  }
  else
  {
    long long v30 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "no state of mind data for creating new state of mind events", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

uint64_t __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 workouts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v6 count])
    {
      id v7 = objc_opt_new();
      id v8 = objc_alloc_init((Class)NSMutableArray);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v35 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v41;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = [*(id *)(*((void *)&v40 + 1) + 8 * i) UUID];
            uint64_t v15 = [v14 UUIDString];
            [v7 addObject:v15];
          }
          id v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v11);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v37;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
            id v22 = [v21 identifierFromProvider];
            unsigned __int8 v23 = [v7 containsObject:v22];

            if ((v23 & 1) == 0)
            {
              [v21 setRehydrationFailCount:[v21 rehydrationFailCount] + 1];
              [v8 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v18);
      }

      uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v8 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "health: unrehydrated workout count, %lu", buf, 0xCu);
      }

      id v6 = v35;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = v5;
      id v28 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) setRehydrationFailCount:((char *)[*(id *)(*((void *)&v44 + 1) + 8 * (void)k) rehydrationFailCount]) + 1];
          }
          id v29 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v29);
      }

      unsigned __int8 v32 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [v27 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "no workouts fetched, so all stored workout events are unrehydrated count, %lu", buf, 0xCu);
      }

      id v8 = v27;
    }
  }
  else
  {
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no stored workout events for finding unrehydrated events", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 stateOfMind:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v6 count])
    {
      id v7 = objc_opt_new();
      id v8 = objc_alloc_init((Class)NSMutableArray);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v35 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v41;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = [*(id *)(*((void *)&v40 + 1) + 8 * i) UUID];
            uint64_t v15 = [v14 UUIDString];
            [v7 addObject:v15];
          }
          id v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v11);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v37;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
            id v22 = [v21 identifierFromProvider];
            unsigned __int8 v23 = [v7 containsObject:v22];

            if ((v23 & 1) == 0)
            {
              [v21 setRehydrationFailCount:[v21 rehydrationFailCount] + 1];
              [v8 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v18);
      }

      uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v8 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "health: unrehydrated state of mind count, %lu", buf, 0xCu);
      }

      id v6 = v35;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = v5;
      id v28 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) setRehydrationFailCount:((char *)[*(id *)(*((void *)&v44 + 1) + 8 * (void)k) rehydrationFailCount]) + 1];
          }
          id v29 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v29);
      }

      unsigned __int8 v32 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [v27 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "no state of mind data fetched, so all stored state of mind events are unrehydrated count, %lu", buf, 0xCu);
      }

      id v8 = v27;
    }
  }
  else
  {
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no stored state of mind events for finding unrehydrated events", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchworkouts hit error, %@", v2, v3, v4, v5, v6);
}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchStateofMind hit error, %@", v2, v3, v4, v5, v6);
}

void __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch workout routes hit error, %@", v2, v3, v4, v5, v6);
}

void __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch workout route locations hit error, %@", v2, v3, v4, v5, v6);
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving workout as event into database failed with error, %@", v2, v3, v4, v5, v6);
}

- (void)_createQueryBasedonEvents:withPredicate:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "event category does not match with health data", v2, v3, v4, v5, v6);
}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_418_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch health data hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromWorkouts:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no inputEvents with non-nil identifierFromProvider for rehydrating workout events", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromStateOfMind:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no input events for rehydrating state of mind events", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromStateOfMind:handler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no mindful sessions for rehydrating state of mind events", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromMindfulSession:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no input events for rehydrating mindful session events", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromMindfulSession:handler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no mindful sessions for rehydrating mindful session events", v2, v3, v4, v5, v6);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 count];
  unsigned int v6 = [*(id *)(a2 + 32) workoutActivityType];
  id v7 = [*(id *)(a2 + 32) startDate];
  [*(id *)(a2 + 32) duration];
  int v9 = 134218754;
  id v10 = v5;
  __int16 v11 = 1024;
  unsigned int v12 = v6;
  __int16 v13 = 2112;
  id v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%lu workout routes were fetched for event type %d starting %@ duration %.1f", (uint8_t *)&v9, 0x26u);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  unsigned int v4 = [*(id *)(a1 + 48) workoutActivityType];
  id v5 = [*(id *)(a1 + 48) startDate];
  [*(id *)(a1 + 48) duration];
  v7[0] = 67109634;
  v7[1] = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "no workout route locations were fetched for event type %d starting %@ duration %.1f", (uint8_t *)v7, 0x1Cu);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_2(id *a1, uint64_t a2)
{
  [*a1 count];
  [*(id *)(a2 + 40) count];
  [*(id *)(a2 + 48) workoutActivityType];
  uint64_t v3 = [*(id *)(a2 + 48) startDate];
  [*(id *)(a2 + 48) duration];
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_5_7((void *)&_mh_execute_header, v4, v5, "%lu downsampled route locations were fetched, original size %lu for event type %d starting %@ duration %.1f", v6, v7, v8, v9, v10);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_430_cold_1(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  [*(id *)(a2 + 32) count];
  [*(id *)(a2 + 40) workoutActivityType];
  uint64_t v3 = [*(id *)(a2 + 40) startDate];
  [*(id *)(a2 + 40) duration];
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_5_7((void *)&_mh_execute_header, v4, v5, "Totally %lu downsampled locations were fetched in %lu routes for event type %d starting %@ duration %.1f", v6, v7, v8, v9, v10);
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_433_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to update invalid health data events, error, %@", v2, v3, v4, v5, v6);
}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch mindful session hit error, %@", v2, v3, v4, v5, v6);
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving mindful session as event into database failed with error, %@", v2, v3, v4, v5, v6);
}

@end