@interface MOProactiveTravelManager
- (MOConfigurationManager)configurationManager;
- (MOEventStore)momentStore;
- (MOProactiveTravelManager)initWithPortraitStore:(id)a3 momentStore:(id)a4 configurationManager:(id)a5;
- (MOProactiveTravelManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (PPEventStore)portraitStore;
- (id)_providerIdOfTrip:(id)a3;
- (id)createEventFromTrip:(id)a3;
- (id)rehydratedTripEvents:(id)a3;
- (void)_removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveTripsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)saveTrips:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)waitForQueueEmpty;
@end

@implementation MOProactiveTravelManager

- (MOProactiveTravelManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PPEventStore);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 getService:v7];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v4 getService:v10];

  v12 = [(MOProactiveTravelManager *)self initWithPortraitStore:v5 momentStore:v8 configurationManager:v11];
  return v12;
}

- (MOProactiveTravelManager)initWithPortraitStore:(id)a3 momentStore:(id)a4 configurationManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:]();
    }

    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"MOProactiveTravelManager.m" lineNumber:55 description:@"Invalid parameter not satisfying: momentStore"];

    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)MOProactiveTravelManager;
  v13 = [(MOProactiveTravelManager *)&v21 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MOProactiveTravelManager", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_portraitStore, a3);
    objc_storeStrong((id *)&v13->_momentStore, a4);
    objc_storeStrong((id *)&v13->_configurationManager, a5);
  }
  self = v13;
  v17 = self;
LABEL_10:

  return v17;
}

- (void)fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MOProactiveTravelManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002C9A78;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke(void *a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fetching trips between %@ and %@", buf, 0x16u);
  }

  id v5 = objc_opt_new();
  [v5 setFromDate:a1[4]];
  [v5 setToDate:a1[5]];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__29;
  v30 = __Block_byref_object_dispose__29;
  id v31 = 0;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__29;
  v24 = __Block_byref_object_dispose__29;
  id v25 = (id)objc_opt_new();
  uint64_t v6 = *(void *)&buf[8];
  v7 = *(void **)(*(void *)&buf[8] + 40);
  id v8 = *(void **)(a1[6] + 16);
  v18[5] = &v20;
  id obj = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_103;
  v18[3] = &unk_1002CB138;
  v18[4] = buf;
  [v8 iterScoredEventsWithQuery:v5 error:&obj block:v18];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)&buf[8], v9, v10, v11, v12, v13, v14, v15);
    }

    [(id)v21[5] removeAllObjects];
  }
  else
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [(id)v21[5] count];
      *(_DWORD *)v26 = 134217984;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "found %lu trips", v26, 0xCu);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(buf, 8);
}

void *__81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_103(void *result, uint64_t a2, unsigned char *a3)
{
  if (!*(void *)(*(void *)(result[4] + 8) + 40)) {
    return [*(id *)(*(void *)(result[5] + 8) + 40) addObject:a2];
  }
  *a3 = 1;
  return result;
}

- (id)createEventFromTrip:(id)a3
{
  id v4 = a3;
  id v5 = [MOEvent alloc];
  uint64_t v6 = +[NSUUID UUID];
  v7 = [v4 startDate];
  id v8 = [v4 endDate];
  id v9 = +[NSDate date];
  uint64_t v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:3 category:8];

  uint64_t v11 = [v4 endDate];
  uint64_t v12 = [(MOProactiveTravelManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  uint64_t v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  id v16 = [(MOProactiveTravelManager *)self _providerIdOfTrip:v4];

  [(MOEvent *)v10 setIdentifierFromProvider:v16];
  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [(MOEvent *)v10 identifierFromProvider];
    int v20 = 138412290;
    objc_super v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "has identifierFromProvider, %@", (uint8_t *)&v20, 0xCu);
  }

  return v10;
}

- (id)_providerIdOfTrip:(id)a3
{
  uint64_t v3 = [a3 tripParts];
  id v4 = [v3 _pas_mappedArrayWithTransform:&__block_literal_global_37];
  [v4 _pas_componentsJoinedByString:@"|"];
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  [(__CFString *)v5 length];
  if (!CStringPtr)
  {
    CFDataRef v7 = CFStringCreateExternalRepresentation(kCFAllocatorMalloc, v5, 0x8000100u, 0);
    [(__CFData *)v7 bytes];
    [(__CFData *)v7 length];
  }
  _PASMurmur3_x86_128();
  id v8 = _PASBytesToHex();

  return v8;
}

id __46__MOProactiveTravelManager__providerIdOfTrip___block_invoke(id a1, PPTripPart *a2)
{
  v2 = [(PPTripPart *)a2 eventIdentifiers];
  uint64_t v3 = [v2 _pas_componentsJoinedByString:@":"];

  return v3;
}

- (void)saveTrips:(id)a3 handler:(id)a4
{
  id v6 = a3;
  CFDataRef v7 = (void (**)(id, void, void *))a4;
  id v8 = +[NSDate distantFuture];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        float v14 = [v13 startDate];
        unsigned int v15 = [v8 isAfterDate:v14];

        if (v15)
        {
          uint64_t v16 = [v13 startDate];

          id v8 = (void *)v16;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v10);
  }

  uint64_t v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x3032000000;
  v37[2] = __Block_byref_object_copy__29;
  v37[3] = __Block_byref_object_dispose__29;
  id v38 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__29;
  v34[4] = __Block_byref_object_dispose__29;
  id v35 = 0;
  id v17 = [(MOProactiveTravelManager *)self momentStore];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke;
  v33[3] = &unk_1002CAC98;
  v33[4] = &v36;
  v33[5] = v34;
  [v17 fetchEventsWithStartDateAfter:v8 Category:8 CompletionHandler:v33];

  if (*(void *)(v37[0] + 40))
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOProactiveTravelManager saveTrips:handler:]((uint64_t)v37, v18, v19, v20, v21, v22, v23, v24);
    }

    id v25 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOProactiveTravelManager saveTrips:handler:]();
    }

    if (v7) {
      v7[2](v7, *(void *)(v37[0] + 40), &__NSDictionary0__struct);
    }
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_124;
    v32[3] = &unk_1002D0300;
    v32[4] = self;
    v32[5] = v34;
    v26 = [v9 _pas_mappedArrayWithTransform:v32];
    id v27 = [(MOProactiveTravelManager *)self momentStore];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_126;
    v29[3] = &unk_1002CACE8;
    id v28 = v26;
    id v30 = v28;
    id v31 = v7;
    [v27 storeEvents:v28 CompletionHandler:v29];
  }
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  id v8 = objc_alloc((Class)NSSet);
  [v7 _pas_mappedArrayWithTransform:&__block_literal_global_122];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v8 initWithArray:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

id __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return [(MOEvent *)a2 identifierFromProvider];
}

id __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [*(id *)(a1 + 32) _providerIdOfTrip:v3];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) createEventFromTrip:v3];
  }

  return v6;
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_126(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_126_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v15 = [*(id *)(a1 + 32) count];
    int v17 = 134217984;
    id v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved trip events, %lu", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

- (void)fetchAndSaveTripsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CAD10;
  uint64_t v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOProactiveTravelManager *)v9 fetchTripsBetweenStartDate:a3 EndDate:a4 CompletionHandler:v8];
}

void __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v6, 0);
    }
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving trip contents.", buf, 2u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke_128;
    v10[3] = &unk_1002C9A50;
    uint64_t v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v9 saveTrips:v5 handler:v10];
  }
}

uint64_t __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke_128(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)rehydratedTripEvents:(id)a3
{
  id v4 = a3;
  id v5 = [v4 getDurationOfMOEventArray];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  int v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  id v6 = [v5 startDate];
  uint64_t v7 = [v5 endDate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke;
  v12[3] = &unk_1002C9D68;
  v12[4] = self;
  v12[5] = &v13;
  [(MOProactiveTravelManager *)self fetchTripsBetweenStartDate:v6 EndDate:v7 CompletionHandler:v12];

  [(MOProactiveTravelManager *)self waitForQueueEmpty];
  if (v14[5])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke_130;
    v11[3] = &unk_1002CB268;
    v11[4] = &v13;
    id v8 = [v4 _pas_mappedArrayWithTransform:v11];
  }
  else
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOProactiveTravelManager rehydratedTripEvents:]();
    }

    id v8 = &__NSArray0__struct;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v3, "count")];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v14 = [*(id *)(a1 + 32) _providerIdOfTrip:v12];
        [v13 setObject:v12 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

id __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke_130(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v3 identifierFromProvider];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [v3 copy];
    id v8 = [v6 title];

    if (v8)
    {
      id v9 = [v6 title];
      [v7 setTripTitle:v9];
    }
    uint64_t v10 = [v6 tripParts];

    if (v10)
    {
      id v11 = [v6 tripParts];
      [v7 setTripParts:v11];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __68__MOProactiveTravelManager_removeTripEventsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002C9A50;
  id v8 = a4;
  id v6 = v8;
  [(MOProactiveTravelManager *)self _removeTripEventsDeletedAtSource:a3 handler:v7];
  [(MOProactiveTravelManager *)self waitForQueueEmpty];
}

uint64_t __68__MOProactiveTravelManager_removeTripEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__29;
  v26 = __Block_byref_object_dispose__29;
  id v27 = 0;
  id v9 = [v8 startDate];
  uint64_t v10 = [v8 endDate];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke;
  v21[3] = &unk_1002C9D68;
  v21[4] = self;
  v21[5] = &v22;
  [(MOProactiveTravelManager *)self fetchTripsBetweenStartDate:v9 EndDate:v10 CompletionHandler:v21];

  [(MOProactiveTravelManager *)self waitForQueueEmpty];
  if (v23[5])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_133;
    v20[3] = &unk_1002CB268;
    v20[4] = &v22;
    id v11 = [v6 _pas_mappedArrayWithTransform:v20];
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v11 count];
      *(_DWORD *)buf = 134217984;
      id v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%ld previously saved trip event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    uint64_t v14 = [(MOProactiveTravelManager *)self momentStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_134;
    v17[3] = &unk_1002CACE8;
    id v15 = v11;
    id v18 = v15;
    id v19 = v7;
    [v14 removeEvents:v15 CompletionHandler:v17];

    goto LABEL_9;
  }
  long long v16 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[MOProactiveTravelManager _removeTripEventsDeletedAtSource:handler:]();
  }

  if (v7)
  {
    CFStringRef v30 = @"resultNumberOfEvents";
    id v31 = &off_1002F6F80;
    id v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
LABEL_9:
  }
  _Block_object_dispose(&v22, 8);
}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v3, "count")];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v14 = [*(id *)(a1 + 32) _providerIdOfTrip:v12];
        [v13 setObject:v12 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

id __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v3 identifierFromProvider];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v3;
  }

  return v7;
}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_134_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting %ld travel event(s) in database succeeded!", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)waitForQueueEmpty
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PPEventStore)portraitStore
{
  return self->_portraitStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_portraitStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveTrips:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "No trips will be saved this round", v2, v3, v4, v5, v6);
}

- (void)saveTrips:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_126_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)rehydratedTripEvents:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "nil query result from trips fetching, no events rehydrated.", v2, v3, v4, v5, v6);
}

- (void)_removeTripEventsDeletedAtSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "nil query result from trips fetching, no events removed.", v2, v3, v4, v5, v6);
}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_134_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) count];
  int v6 = 134218242;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Deleting %ld travel event(s) in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end