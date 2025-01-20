@interface MOSuggestedEventManager
- (EKEventStore)ekStore;
- (MOEventStore)momentStore;
- (MOSuggestedEventManager)initWithPortraitStore:(id)a3 momentStore:(id)a4;
- (MOSuggestedEventManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (PPCalendarInternPool)calendarInternPool;
- (PPEventStore)portraitStore;
- (id)createEventFromSuggestedEvent:(id)a3;
- (id)rehydratedSuggestedEvents:(id)a3;
- (void)_enrichSuggestedEventsWithEventKit:(id)a3;
- (void)_fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)saveSuggestedEvents:(id)a3 handler:(id)a4;
- (void)waitForQueueEmpty;
@end

@implementation MOSuggestedEventManager

- (MOSuggestedEventManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PPEventStore);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 getService:v7];

  v9 = [(MOSuggestedEventManager *)self initWithPortraitStore:v5 momentStore:v8];
  return v9;
}

- (MOSuggestedEventManager)initWithPortraitStore:(id)a3 momentStore:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestedEventManager initWithPortraitStore:momentStore:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"MOSuggestedEventManager.m" lineNumber:55 description:@"Invalid parameter not satisfying: momentStore"];

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v25.receiver = self;
  v25.super_class = (Class)MOSuggestedEventManager;
  v10 = [(MOSuggestedEventManager *)&v25 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MOSuggestedEventManager", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_portraitStore, a3);
    objc_storeStrong((id *)&v10->_momentStore, a4);
  }
  self = v10;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)_fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MOSuggestedEventManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002C9A78;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke(void *a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
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
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = (id)objc_opt_new();
  uint64_t v6 = *(void *)&buf[8];
  v7 = *(void **)(*(void *)&buf[8] + 40);
  id v8 = *(void **)(a1[6] + 16);
  v17[5] = &v19;
  id obj = v7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_105;
  v17[3] = &unk_1002CB138;
  v17[4] = buf;
  [v8 iterScoredEventsWithQuery:v5 error:&obj block:v17];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)&buf[8], v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v16 = [(id)v20[5] count];
      *(_DWORD *)objc_super v25 = 134217984;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "found %lu trips", v25, 0xCu);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(buf, 8);
}

void *__81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_105(void *result, uint64_t a2, unsigned char *a3)
{
  if (!*(void *)(*(void *)(result[4] + 8) + 40)) {
    return [*(id *)(*(void *)(result[5] + 8) + 40) addObject:a2];
  }
  *a3 = 1;
  return result;
}

- (void)fetchSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MOSuggestedEventManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002C9A78;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke(void *a1)
{
  v2 = objc_opt_new();
  [v2 setFromDate:a1[4]];
  [v2 setToDate:a1[5]];
  uint64_t v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = __Block_byref_object_copy__8;
  v23[3] = __Block_byref_object_dispose__8;
  id v24 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__8;
  uint64_t v20 = __Block_byref_object_dispose__8;
  id v21 = (id)objc_opt_new();
  uint64_t v4 = (id *)(v23[0] + 40);
  uint64_t v3 = *(void **)(v23[0] + 40);
  id v5 = *(void **)(a1[6] + 16);
  v14[5] = &v16;
  id obj = v3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v14[3] = &unk_1002CB138;
  v14[4] = &v22;
  [v5 iterScoredEventsWithQuery:v2 error:&obj block:v14];
  objc_storeStrong(v4, obj);
  if (*(void *)(v23[0] + 40))
  {
    uint64_t v6 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)v23, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v6 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v13 = [(id)v17[5] count];
      *(_DWORD *)buf = 134217984;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got %lu events", buf, 0xCu);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v10 addObject:a2];
  }
}

- (id)createEventFromSuggestedEvent:(id)a3
{
  id v3 = a3;
  if ([v3 category] == 12) {
    uint64_t v4 = 12;
  }
  else {
    uint64_t v4 = 11;
  }
  uint64_t v5 = [MOEvent alloc];
  uint64_t v6 = +[NSUUID UUID];
  uint64_t v7 = [v3 startDate];
  uint64_t v8 = [v3 endDate];
  uint64_t v9 = +[NSDate date];
  uint64_t v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:3 category:v4];

  uint64_t v11 = [v3 eventIdentifier];

  if (v11)
  {
    uint64_t v12 = [v3 eventIdentifier];
    [(MOEvent *)v10 setSuggestedEventIdentifier:v12];

    id v13 = [v3 eventIdentifier];
    [(MOEvent *)v10 setIdentifierFromProvider:v13];

    id v14 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(MOEvent *)v10 suggestedEventIdentifier];
      int v19 = 138412290;
      uint64_t v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "has eventIdentifier, %@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v16 = [v3 endDate];
    id v17 = [v16 dateByAddingTimeInterval:2419200.0];
    [(MOEvent *)v10 setExpirationDate:v17];

    uint64_t v11 = v10;
  }

  return v11;
}

- (void)saveSuggestedEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSDate distantFuture];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v14 = [v13 startDate];
        unsigned int v15 = [v8 isAfterDate:v14];

        if (v15)
        {
          uint64_t v16 = [v13 startDate];

          uint64_t v8 = (void *)v16;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__8;
  v29[4] = __Block_byref_object_dispose__8;
  id v30 = 0;
  id v17 = [(MOSuggestedEventManager *)self momentStore];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke;
  v28[3] = &unk_1002CB180;
  v28[4] = v29;
  [v17 fetchEventsWithStartDateAfter:v8 Category:11 CompletionHandler:v28];

  uint64_t v18 = [(MOSuggestedEventManager *)self momentStore];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_3;
  v27[3] = &unk_1002CB180;
  v27[4] = v29;
  [v18 fetchEventsWithStartDateAfter:v8 Category:12 CompletionHandler:v27];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_5;
  v26[3] = &unk_1002CB1C8;
  v26[4] = self;
  v26[5] = v29;
  int v19 = [v9 _pas_mappedArrayWithTransform:v26];
  uint64_t v20 = [(MOSuggestedEventManager *)self momentStore];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6;
  v23[3] = &unk_1002CACE8;
  id v21 = v19;
  id v24 = v21;
  id v22 = v7;
  id v25 = v22;
  [v20 storeEvents:v21 CompletionHandler:v23];

  _Block_object_dispose(v29, 8);
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSMutableSet);
  [v3 _pas_mappedArrayWithTransform:&__block_literal_global_9];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v4 initWithArray:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return [(MOEvent *)a2 identifierFromProvider];
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [a2 _pas_mappedArrayWithTransform:&__block_literal_global_116];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_4(id a1, MOEvent *a2)
{
  return [(MOEvent *)a2 identifierFromProvider];
}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) createEventFromSuggestedEvent:a2];
  id v4 = v3;
  if (v3
    && (id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40),
        [v3 identifierFromProvider],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v5) = [v5 containsObject:v6],
        v6,
        (v5 & 1) == 0))
  {
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v17 = 134217984;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "saved suggested events, count, %lu", (uint8_t *)&v17, 0xCu);
  }

  if (v5)
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

- (void)fetchAndSaveSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__8;
  v16[4] = __Block_byref_object_dispose__8;
  id v17 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002CB1F0;
  void v15[4] = v16;
  [(MOSuggestedEventManager *)self _fetchTripsBetweenStartDate:v8 EndDate:v9 CompletionHandler:v15];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_2;
  v12[3] = &unk_1002CB240;
  id v11 = v10;
  v12[4] = self;
  id v13 = v11;
  uint64_t v14 = v16;
  [(MOSuggestedEventManager *)self fetchSuggestedEventBetweenStartDate:v8 EndDate:v9 CompletionHandler:v12];

  _Block_object_dispose(v16, 8);
}

void __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v12 = [v11 tripParts];
        id v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
              id v18 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) eventIdentifiers];
              [v17 addObjectsFromArray:v18];

              uint64_t v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

void __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    id v8 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_3;
    v12[3] = &unk_1002CB218;
    v12[4] = *(void *)(a1 + 48);
    uint64_t v9 = [v5 _pas_filteredArrayWithTest:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_4;
    v10[3] = &unk_1002C9A50;
    id v11 = *(id *)(a1 + 40);
    [v8 saveSuggestedEvents:v9 handler:v10];
  }
}

uint64_t __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 eventIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_enrichSuggestedEventsWithEventKit:(id)a3
{
  id v4 = a3;
  if (!self->_ekStore)
  {
    id v5 = (EKEventStore *)[objc_alloc((Class)EKEventStore) initWithEKOptions:128];
    ekStore = self->_ekStore;
    self->_ekStore = v5;
  }
  if (!self->_calendarInternPool)
  {
    uint64_t v7 = (PPCalendarInternPool *)objc_opt_new();
    calendarInternPool = self->_calendarInternPool;
    self->_calendarInternPool = v7;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = self->_ekStore;
        uint64_t v16 = [v14 suggestedEventIdentifier:v19];
        id v17 = [(EKEventStore *)v15 eventWithIdentifier:v16];

        id v18 = [objc_alloc((Class)PPEvent) initWithEKEvent:v17 calendarInternPool:self->_calendarInternPool];
        [v14 setSuggestedEvent:v18];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (id)rehydratedSuggestedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [v4 getDurationOfMOEventArray];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__8;
  long long v24 = __Block_byref_object_dispose__8;
  id v25 = 0;
  id v6 = [v5 startDate];
  uint64_t v7 = [v5 endDate];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke;
  v19[3] = &unk_1002CB180;
  v19[4] = &v20;
  [(MOSuggestedEventManager *)self fetchSuggestedEventBetweenStartDate:v6 EndDate:v7 CompletionHandler:v19];

  [(MOSuggestedEventManager *)self waitForQueueEmpty];
  if (v21[5])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke_125;
    v18[3] = &unk_1002CB268;
    v18[4] = &v20;
    id v8 = [v4 _pas_mappedArrayWithTransform:v18];
    [(MOSuggestedEventManager *)self _enrichSuggestedEventsWithEventKit:v8];
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestedEventManager rehydratedSuggestedEvents:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    id v8 = &__NSArray0__struct;
  }
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v3 count]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
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
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v14 = [v12 eventIdentifier:v15];
        [v13 setObject:v12 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

id __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v3 identifierFromProvider];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [v3 copy];
    id v8 = [v3 identifierFromProvider];
    [v7 setIdentifierFromProvider:v8];

    id v9 = [v3 suggestedEventIdentifier];
    [v7 setSuggestedEventIdentifier:v9];

    uint64_t v10 = [v6 title];

    if (v10)
    {
      uint64_t v11 = [v6 title];
      [v7 setSuggestedEventTitle:v11];
    }
    [v7 setSuggestedEventCategory:[v6 category]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __72__MOSuggestedEventManager_removeSuggestedEventsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002C9A50;
  id v8 = a4;
  id v6 = v8;
  [(MOSuggestedEventManager *)self _removeSuggestedEventsDeletedAtSource:a3 handler:v7];
  [(MOSuggestedEventManager *)self waitForQueueEmpty];
}

uint64_t __72__MOSuggestedEventManager_removeSuggestedEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__8;
  long long v33 = __Block_byref_object_dispose__8;
  id v34 = 0;
  id v9 = [v8 startDate];
  uint64_t v10 = [v8 endDate];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke;
  v28[3] = &unk_1002CB180;
  v28[4] = &v29;
  [(MOSuggestedEventManager *)self fetchSuggestedEventBetweenStartDate:v9 EndDate:v10 CompletionHandler:v28];

  [(MOSuggestedEventManager *)self waitForQueueEmpty];
  if (v30[5])
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_126;
    v27[3] = &unk_1002CB268;
    v27[4] = &v29;
    uint64_t v11 = [v6 _pas_mappedArrayWithTransform:v27];
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v11 count];
      *(_DWORD *)buf = 134217984;
      id v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%ld source suggested event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    uint64_t v14 = [(MOSuggestedEventManager *)self momentStore];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_127;
    v24[3] = &unk_1002CACE8;
    id v15 = v11;
    id v25 = v15;
    id v26 = v7;
    [v14 removeEvents:v15 CompletionHandler:v24];
  }
  else
  {
    long long v16 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestedEventManager _removeSuggestedEventsDeletedAtSource:handler:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
    }
  }
  _Block_object_dispose(&v29, 8);
}

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v3 count]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
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
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v14 = [v12 eventIdentifier:v15];
        [v13 setObject:v12 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

id __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_126(uint64_t a1, void *a2)
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

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_127_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting %ld suggested event in database succeeded!", (uint8_t *)&v11, 0xCu);
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

- (EKEventStore)ekStore
{
  return self->_ekStore;
}

- (PPCalendarInternPool)calendarInternPool
{
  return self->_calendarInternPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarInternPool, 0);
  objc_storeStrong((id *)&self->_ekStore, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_portraitStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithPortraitStore:(uint64_t)a3 momentStore:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)rehydratedSuggestedEvents:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_removeSuggestedEventsDeletedAtSource:(uint64_t)a3 handler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_127_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) count];
  int v6 = 134218242;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Deleting %ld suggested event in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end