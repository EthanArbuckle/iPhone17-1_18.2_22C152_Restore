@interface MOLifeEventManager
+ (id)_createLifeEventContextWithError:(id *)a3;
- (GDLifeEventContext)lifeEventContext;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)momentStore;
- (MOLifeEventManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_createMOEventFromDiningEvent:(id)a3 existingMOEvent:(id)a4;
- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 category:(unint64_t)a5 date:(id)a6 confidenceScore:(id)a7 locations:(id)a8;
- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 logErrorWhenEventHasError:(BOOL)a5;
- (id)_createMOEventFromGamingEvent:(id)a3 existingMOEvent:(id)a4;
- (id)_createMOEventFromShoppingEvent:(id)a3 existingMOEvent:(id)a4;
- (id)_createMOEventFromTransportationEvent:(id)a3 existingMOEvent:(id)a4;
- (id)_createMOEventsBetweenStartDate:(id)a3 endDate:(id)a4 excludingEntityIdentifiers:(id)a5 error:(id *)a6;
- (id)_createNewEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5;
- (id)_entityIdentifierFromMomentEvent:(id)a3;
- (id)_rehydrateStoredLifeEvents:(id)a3;
- (void)_fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_rehydrateLifeEvents:(id)a3 handler:(id)a4;
- (void)fetchAndSaveLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)rehydrateLifeEvents:(id)a3 handler:(id)a4;
- (void)removeLifeEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setLifeEventContext:(id)a3;
@end

@implementation MOLifeEventManager

+ (id)_createLifeEventContextWithError:(id *)a3
{
  id v11 = 0;
  id v4 = [objc_alloc((Class)GDLifeEventContext) initAndReturnError:&v11];
  id v5 = v11;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v9 = v4;
  }
  else
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MOLifeEventManager _createLifeEventContextWithError:]();
    }

    id v9 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v9;
}

- (MOLifeEventManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (!v8)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v20 = +[NSAssertionHandler currentHandler];
    v21 = v20;
    CFStringRef v22 = @"Invalid parameter not satisfying: configurationManager";
    SEL v23 = a2;
    v24 = self;
    uint64_t v25 = 52;
    goto LABEL_14;
  }
  v28.receiver = self;
  v28.super_class = (Class)MOLifeEventManager;
  self = [(MOLifeEventManager *)&v28 init];
  if (self)
  {
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v5 getService:v10];

    if (v11)
    {
      objc_storeStrong((id *)&self->_momentStore, v11);
      objc_storeStrong((id *)&self->_configurationManager, v8);
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[MOLifeEventManager initWithUniverse:]();
      }

      v13 = +[MOLifeEventManager _createLifeEventContextWithError:0];
      lifeEventContext = self->_lifeEventContext;
      self->_lifeEventContext = v13;

      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = (OS_dispatch_queue *)dispatch_queue_create("MOLifeEventManager", v15);
      queue = self->_queue;
      self->_queue = v16;

      goto LABEL_7;
    }
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:]();
    }

    v20 = +[NSAssertionHandler currentHandler];
    v21 = v20;
    CFStringRef v22 = @"Invalid parameter not satisfying: momentStore";
    SEL v23 = a2;
    v24 = self;
    uint64_t v25 = 60;
LABEL_14:
    [v20 handleFailureInMethod:v23 object:v24 file:@"MOLifeEventManager.m" lineNumber:v25 description:v22];

    v18 = 0;
    goto LABEL_15;
  }
LABEL_7:
  self = self;
  v18 = self;
LABEL_15:

  return v18;
}

- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 category:(unint64_t)a5 date:(id)a6 confidenceScore:(id)a7 locations:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v16) {
    goto LABEL_10;
  }
  if (!v15)
  {
    v19 = [v16 startDate];
    if (!v19) {
      goto LABEL_11;
    }
    v27 = [v16 endDate];

    if (v27)
    {
      v33 = [MOEvent alloc];
      v34 = +[NSUUID UUID];
      v32 = [v16 startDate];
      uint64_t v28 = [v16 endDate];
      v29 = +[NSDate date];
      v30 = (void *)v28;
      v19 = [(MOEvent *)v33 initWithEventIdentifier:v34 startDate:v32 endDate:v28 creationDate:v29 provider:10 category:22];

      if (!v19) {
        goto LABEL_11;
      }
      goto LABEL_4;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v19 = (MOEvent *)v15;
LABEL_4:
  v20 = [v16 endDate];

  if (v20)
  {
    v21 = [v14 stringValue];
    [(MOEvent *)v19 setIdentifierFromProvider:v21];

    CFStringRef v22 = [v16 endDate];
    SEL v23 = [(MOLifeEventManager *)self configurationManager];
    LODWORD(v24) = 1242802176;
    [v23 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v24];
    v26 = [v22 dateByAddingTimeInterval:v25];
    [(MOEvent *)v19 setExpirationDate:v26];

    [(MOEvent *)v19 setLifeEventCategory:a5];
    [v17 doubleValue];
    -[MOEvent setConfidenceScore:](v19, "setConfidenceScore:");
  }
LABEL_11:

  return v19;
}

- (id)_createMOEventFromShoppingEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 entityIdentifier];
  id v9 = [v7 date];
  v10 = [v7 confidence];
  id v11 = [v7 locations];

  v12 = [(MOLifeEventManager *)self _createMOEventFromEntityIdentifier:v8 existingMOEvent:v6 category:1 date:v9 confidenceScore:v10 locations:v11];

  return v12;
}

- (id)_createMOEventFromDiningEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 entityIdentifier];
  id v9 = [v7 date];
  v10 = [v7 confidence];
  id v11 = [v7 locations];

  v12 = [(MOLifeEventManager *)self _createMOEventFromEntityIdentifier:v8 existingMOEvent:v6 category:2 date:v9 confidenceScore:v10 locations:v11];

  return v12;
}

- (id)_createMOEventFromGamingEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 entityIdentifier];
  id v9 = [v6 date];
  v10 = [v6 confidence];
  id v11 = [v6 locations];
  v12 = [(MOLifeEventManager *)self _createMOEventFromEntityIdentifier:v8 existingMOEvent:v7 category:3 date:v9 confidenceScore:v10 locations:v11];

  v13 = [v6 software];
  id v14 = [v13 softwareId];

  if (v14)
  {
    id v15 = [(MOLifeEventManager *)self lifeEventContext];
    id v20 = 0;
    id v16 = [v14 graphSoftwareFromContext:v15 error:&v20];
    id v17 = v20;

    if (!v16 || v17)
    {
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MOLifeEventManager _createMOEventFromGamingEvent:existingMOEvent:](v14, (uint64_t)v17, v18);
      }
    }
    else
    {
      id v18 = [v16 bundleId];
      [v12 setAppBundle:v18];
    }
  }
  else
  {
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MOLifeEventManager _createMOEventFromGamingEvent:existingMOEvent:](v6, v17);
    }
  }

  return v12;
}

- (id)_createMOEventFromTransportationEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 transportationType];
  id v9 = [v8 integerValue];

  v10 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOLifeEventManager _createMOEventFromTransportationEvent:existingMOEvent:](v6, (uint64_t)v9, v10);
  }

  if (v9 == (id)68)
  {
    id v11 = v6;
    v12 = [v11 entityIdentifier];
    v13 = [v11 date];
    id v14 = [v11 confidence];
    id v15 = [v11 locations];

    id v16 = [(MOLifeEventManager *)self _createMOEventFromEntityIdentifier:v12 existingMOEvent:v7 category:4 date:v13 confidenceScore:v14 locations:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 logErrorWhenEventHasError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)GDGraphShoppingActivityEventEntityIdentifier) initByCastingFrom:v9];
  id v11 = [objc_alloc((Class)GDGraphDiningActivityEventEntityIdentifier) initByCastingFrom:v9];
  id v12 = [objc_alloc((Class)GDGraphTransportationActivityEventEntityIdentifier) initByCastingFrom:v9];

  if (!v10)
  {
    if (v11)
    {
      id v17 = [(MOLifeEventManager *)self lifeEventContext];
      id v27 = 0;
      id v14 = [v11 graphDiningActivityEventFromContext:v17 error:&v27];
      id v15 = v27;

      if (v14)
      {
        uint64_t v16 = [(MOLifeEventManager *)self _createMOEventFromDiningEvent:v14 existingMOEvent:v8];
        goto LABEL_13;
      }
      SEL v23 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      v19 = v23;
      if (v5)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:]();
        }
        goto LABEL_28;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v15;
        CFStringRef v22 = "failed to create GDGraphDiningActivityEvent. error: %@";
        goto LABEL_27;
      }
    }
    else
    {
      if (!v12)
      {
        v21 = 0;
        goto LABEL_30;
      }
      id v20 = [(MOLifeEventManager *)self lifeEventContext];
      id v26 = 0;
      id v14 = [v12 graphTransportationActivityEventFromContext:v20 error:&v26];
      id v15 = v26;

      if (v14)
      {
        uint64_t v16 = [(MOLifeEventManager *)self _createMOEventFromTransportationEvent:v14 existingMOEvent:v8];
        goto LABEL_13;
      }
      double v24 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      v19 = v24;
      if (v5)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:]();
        }
        goto LABEL_28;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v15;
        CFStringRef v22 = "failed to create GDGraphTransportationActivityEvent. error: %@";
        goto LABEL_27;
      }
    }
LABEL_28:

    v21 = 0;
    goto LABEL_29;
  }
  v13 = [(MOLifeEventManager *)self lifeEventContext];
  id v28 = 0;
  id v14 = [v10 graphShoppingActivityEventFromContext:v13 error:&v28];
  id v15 = v28;

  if (!v14)
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v19 = v18;
    if (v5)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:]();
      }
      goto LABEL_28;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v15;
      CFStringRef v22 = "failed to create GDGraphShoppingActivityEvent. error: %@";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  uint64_t v16 = [(MOLifeEventManager *)self _createMOEventFromShoppingEvent:v14 existingMOEvent:v8];
LABEL_13:
  v21 = (void *)v16;
LABEL_29:

LABEL_30:

  return v21;
}

- (id)_createMOEventsBetweenStartDate:(id)a3 endDate:(id)a4 excludingEntityIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[MOLifeEventManager _createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:]();
  }

  id v14 = +[NSMutableArray array];
  id v15 = [(MOLifeEventManager *)self lifeEventContext];
  id v16 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v10 endDate:v11];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke;
  v22[3] = &unk_1002CB848;
  id v23 = v12;
  double v24 = self;
  id v17 = v14;
  id v25 = v17;
  id v18 = v12;
  unsigned int v19 = [v15 enumerateEntriesForActivityEventsThatOverlapWithDateInterval:v16 ascending:1 error:a6 usingBlock:v22];

  if (v19) {
    id v20 = v17;
  }
  else {
    id v20 = 0;
  }

  return v20;
}

void __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v3 entityIdentifier];
  id v6 = [v5 stringValue];
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v3 entityIdentifier];
    id v10 = [v8 _createMOEventFromEntityIdentifier:v9 existingMOEvent:0 logErrorWhenEventHasError:1];

    if (v10) {
      [*(id *)(a1 + 48) addObject:v10];
    }
  }
}

- (void)fetchAndSaveLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MOLifeEventManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1002CB898;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lifeEventContext];

  if (!v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
    }

    id v31 = 0;
    id v4 = +[MOLifeEventManager _createLifeEventContextWithError:&v31];
    id v5 = v31;
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    int v8 = !v7;
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();
    }

    [*(id *)(a1 + 32) setLifeEventContext:v4];
  }
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetchAndSaveLifeEventsBetweenStartDate, %@, endDate, %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  id v37 = +[NSMutableSet set];
  id v14 = [*(id *)(a1 + 32) momentStore];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_118;
  v30[3] = &unk_1002CB870;
  uint64_t v15 = *(void *)(a1 + 40);
  v30[4] = *(void *)(a1 + 32);
  v30[5] = buf;
  [v14 fetchEventsWithStartDateAfter:v15 Category:22 CompletionHandler:v30];

  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)v32 = 134217984;
    id v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%lu existingEntityIdentifiers", v32, 0xCu);
  }

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
  id v29 = 0;
  CFStringRef v22 = [v18 _createMOEventsBetweenStartDate:v19 endDate:v20 excludingEntityIdentifiers:v21 error:&v29];
  id v23 = v29;
  double v24 = v23;
  if (!v22 || v23)
  {
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v25 = [*(id *)(a1 + 32) momentStore];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_120;
    v27[3] = &unk_1002C9A50;
    id v28 = *(id *)(a1 + 56);
    [v25 storeEvents:v22 CompletionHandler:v27];
  }
  _Block_object_dispose(buf, 8);
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(a1 + 32) _entityIdentifierFromMomentEvent:*(void *)(*((void *)&v12 + 1) + 8 * (void)v7)];
        id v9 = v8;
        if (v8)
        {
          id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v11 = [v8 stringValue];
          [v10 addObject:v11];
        }
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

uint64_t __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_120(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_entityIdentifierFromMomentEvent:(id)a3
{
  id v3 = [a3 identifierFromProvider];
  if (v3)
  {
    id v4 = [objc_alloc((Class)GDEntityIdentifier) initWithString:v3];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOLifeEventManager _entityIdentifierFromMomentEvent:]();
    }

    id v4 = 0;
  }

  return v4;
}

- (void)rehydrateLifeEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MOLifeEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOLifeEventManager_rehydrateLifeEvents_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __50__MOLifeEventManager_rehydrateLifeEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateLifeEvents:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateLifeEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  int v8 = [(MOLifeEventManager *)self lifeEventContext];

  if (v8)
  {
LABEL_9:
    id v11 = [(MOLifeEventManager *)self _rehydrateStoredLifeEvents:v6];
    long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v6 count];
      id v16 = [v11 count];
      *(_DWORD *)buf = 134218240;
      id v27 = v15;
      __int16 v28 = 2048;
      id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "rehydrateLifeEvents: %lu momentEvents , %lu rehydrated events", buf, 0x16u);
    }

    v7[2](v7, v11, 0);
    goto LABEL_12;
  }
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  id v25 = 0;
  id v10 = +[MOLifeEventManager _createLifeEventContextWithError:&v25];
  id v11 = v25;
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  id v13 = v12;
  if (v10 && !v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();
    }

    [(MOLifeEventManager *)self setLifeEventContext:v10];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();
  }

  ((void (**)(id, id, id))v7)[2](v7, 0, v11);
  id v17 = [MORehydrationMetrics alloc];
  id v18 = [v6 firstObject];
  id v19 = [v18 category];
  uint64_t v20 = [v6 firstObject];
  id v21 = [v20 provider];
  CFStringRef v22 = [v11 description];
  id v23 = [[MORehydrationMetrics alloc] initWithCategory:v17 provider:v19 spiSuccess:0 spiError:v22 failCount:[v6 count] successAfterPreFailCount:3 totalCount:(double)(int)[v6 count] rehydrationTrigger:0.0];

  uint64_t v24 = 0;
  [(MORehydrationMetrics *)v23 submitMetricsWithError:&v24];

LABEL_12:
}

- (id)_rehydrateStoredLifeEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v12 = [(MOLifeEventManager *)self _entityIdentifierFromMomentEvent:v11];
          if (v12)
          {
            id v13 = [(MOLifeEventManager *)self _createMOEventFromEntityIdentifier:v12 existingMOEvent:v11 logErrorWhenEventHasError:0];
            if (v13) {
              [v5 addObject:v13];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v8);
    }

    long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v5 count];
      id v16 = [v6 count];
      *(_DWORD *)buf = 134218240;
      id v29 = v15;
      __int16 v30 = 2048;
      id v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "rehydrated life events count, %lu, stored life events count, %lu", buf, 0x16u);
    }

    id v17 = [MORehydrationMetrics alloc];
    id v18 = [v6 firstObject];
    id v19 = [v18 category];
    uint64_t v20 = [v6 firstObject];
    id v21 = [[MORehydrationMetrics alloc] initWithCategory:v17 provider:v20 spiSuccess:1 spiError:0 failCount:[v6 count] successAfterPreFailCount:[v5 count] totalCount:[v6 count] rehydrationTrigger:0.0];

    uint64_t v23 = 0;
    [v21 submitMetricsWithError:&v23];
  }
  else
  {
    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "No stored life events for rehydration", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)removeLifeEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOLifeEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CB8C0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke(id *a1)
{
  v2 = [a1[4] lifeEventContext];

  if (v2)
  {
LABEL_9:
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [a1[5] count];
      *(_DWORD *)buf = 134217984;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "removeLifeEventsDeletedAtSource: %lu momentEvents", buf, 0xCu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_125;
    v17[3] = &unk_1002C9B08;
    id v10 = a1[5];
    v17[4] = a1[4];
    uint64_t v11 = [v10 _pas_mappedArrayWithTransform:v17];
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v11 count];
      *(_DWORD *)buf = 134217984;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%ld life event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    long long v14 = [a1[4] momentStore];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_127;
    v15[3] = &unk_1002C9A50;
    id v16 = a1[6];
    [v14 removeEvents:v11 CompletionHandler:v15];

    return;
  }
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  id v18 = 0;
  id v4 = +[MOLifeEventManager _createLifeEventContextWithError:&v18];
  id v5 = v18;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  id v7 = v6;
  if (v4 && !v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();
    }

    [a1[4] setLifeEventContext:v4];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();
  }

  (*((void (**)(void))a1[6] + 2))();
}

id __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _entityIdentifierFromMomentEvent:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) lifeEventContext];
    id v6 = [v5 graphObjectFromEntityIdentifier:v4 error:0];

    id v7 = 0;
    if (!v6)
    {
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_125_cold_1(v4);
      }

      id v7 = v3;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_127(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_createNewEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [(MOLifeEventManager *)self _entityIdentifierFromMomentEvent:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        id v18 = v17;
        if (v17)
        {
          id v19 = [v17 stringValue];
          [v11 addObject:v19];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v14);
  }

  id v20 = +[NSMutableArray array];
  id v21 = [(MOLifeEventManager *)self lifeEventContext];
  id v22 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v9];
  id v39 = 0;
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  v34 = __80__MOLifeEventManager__createNewEventsBetweenStartDate_endDate_withStoredEvents___block_invoke;
  v35 = &unk_1002CB848;
  id v23 = v11;
  id v36 = v23;
  id v37 = self;
  id v24 = v20;
  id v38 = v24;
  unsigned int v25 = [v21 enumerateEntriesForActivityEventsThatOverlapWithDateInterval:v22 ascending:1 error:&v39 usingBlock:&v32];
  id v26 = v39;

  long long v27 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v25)
  {
    if (v28)
    {
      id v29 = [v24 count:v32, v33, v34, v35, v36, v37];
      *(_DWORD *)buf = 134217984;
      id v45 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "create new life events count, %lu", buf, 0xCu);
    }

    id v30 = v24;
  }
  else
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "create new life hit error, %@", buf, 0xCu);
    }

    id v30 = 0;
  }

  return v30;
}

void __80__MOLifeEventManager__createNewEventsBetweenStartDate_endDate_withStoredEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 entityIdentifier];
  id v6 = [v5 stringValue];
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v3 entityIdentifier];
    id v10 = [v8 _createMOEventFromEntityIdentifier:v9 existingMOEvent:0 logErrorWhenEventHasError:1];

    if (v10) {
      [*(id *)(a1 + 48) addObject:v10];
    }
  }
}

- (void)fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOLifeEventManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__MOLifeEventManager_fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
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

id __87__MOLifeEventManager_fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLifeEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v38 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [(MOLifeEventManager *)self lifeEventContext];

  if (v13)
  {
LABEL_9:
    id v19 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v38;
      __int16 v43 = 2112;
      id v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "fetchLifeEventsBetweenStartDate, %@, endDate, %@", buf, 0x16u);
    }

    +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 22];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 10];
    v51[0] = v16;
    v51[1] = v15;
    id v20 = +[NSArray arrayWithObjects:v51 count:2];
    id v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];

    id v22 = [v11 filteredArrayUsingPredicate:v21];
    id v23 = [(MOLifeEventManager *)self _rehydrateStoredLifeEvents:v22];
    id v24 = [(MOLifeEventManager *)self _createNewEventsBetweenStartDate:v38 endDate:v10 withStoredEvents:v22];
    unsigned int v25 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v36 = [v23 count];
      id v37 = v21;
      id v26 = v16;
      long long v27 = v15;
      BOOL v28 = v12;
      id v29 = v11;
      id v30 = [v24 count];
      id v31 = [v22 count];
      *(_DWORD *)buf = 138413314;
      id v42 = v38;
      __int16 v43 = 2112;
      id v44 = v10;
      __int16 v45 = 2048;
      id v46 = v36;
      __int16 v47 = 2048;
      id v48 = v30;
      id v11 = v29;
      id v12 = v28;
      id v15 = v27;
      id v16 = v26;
      id v21 = v37;
      __int16 v49 = 2048;
      id v50 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated life events count, %lu, new life events counts, %lu, stored life events count, %lu", buf, 0x34u);
    }

    v32 = objc_opt_new();
    uint64_t v33 = v32;
    if (v24) {
      [v32 setObject:v24 forKey:@"newEvents"];
    }
    if (v23) {
      [v33 setObject:v23 forKey:@"rehydratedEvents"];
    }
    v12[2](v12, 0, v33);

    goto LABEL_18;
  }
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  id v40 = 0;
  id v15 = +[MOLifeEventManager _createLifeEventContextWithError:&v40];
  id v16 = v40;
  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  id v18 = v17;
  if (v15 && !v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();
    }

    [(MOLifeEventManager *)self setLifeEventContext:v15];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();
  }

  ((void (**)(id, id, void *))v12)[2](v12, v16, 0);
  v34 = [MORehydrationMetrics alloc];
  v35 = [v16 description];
  id v21 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v34, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 22, 10, 0, v35, [v11 count], 3, (double)(int)objc_msgSend(v11, "count"), 0.0);

  uint64_t v39 = 0;
  [(MORehydrationMetrics *)v21 submitMetricsWithError:&v39];
LABEL_18:
}

- (GDLifeEventContext)lifeEventContext
{
  return self->_lifeEventContext;
}

- (void)setLifeEventContext:(id)a3
{
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);

  objc_storeStrong((id *)&self->_lifeEventContext, 0);
}

+ (void)_createLifeEventContextWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create lifeEventContext. error: %@", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "trying to create lifeEventContext", v2, v3, v4, v5, v6);
}

- (void)_createMOEventFromGamingEvent:(void *)a1 existingMOEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 entityIdentifier];
  uint64_t v4 = [v3 stringValue];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "softwardId for the gaming event %@ is nil", v5, 0xCu);
}

- (void)_createMOEventFromGamingEvent:(NSObject *)a3 existingMOEvent:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 stringValue];
  OUTLINED_FUNCTION_6_0();
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to create GDGraphSoftware for %@. error: %@", v6, 0x16u);
}

- (void)_createMOEventFromTransportationEvent:(NSObject *)a3 existingMOEvent:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 entityIdentifier];
  uint8_t v6 = [v5 stringValue];
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "GDTransportationActivityEventType of %@ is %ld", v7, 0x16u);
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphTransportationActivityEvent. error: %@", v2, v3, v4, v5, v6);
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphDiningActivityEvent. error: %@", v2, v3, v4, v5, v6);
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphShoppingActivityEvent. error: %@", v2, v3, v4, v5, v6);
}

- (void)_createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "createMOEventsBetweenStartDate, %@, endDate, %@", v2, 0x16u);
}

void __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(void *a1)
{
  os_log_t v1 = [a1 entityIdentifier];
  uint64_t v2 = [v1 stringValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "skipping %@ since it's already in the store", v5, v6, v7, v8, v9);
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "still failed to create life event context: %@", v2, v3, v4, v5, v6);
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to fetchLifeEventsBetweenStartDate. error: %@", v2, v3, v4, v5, v6);
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "successfully created new life event context.", v2, v3, v4, v5, v6);
}

- (void)_entityIdentifierFromMomentEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "entityIdentifierStringValue is nil", v2, v3, v4, v5, v6);
}

void __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_125_cold_1(void *a1)
{
  uint64_t v1 = [a1 stringValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "previous event with %@ can no longer be found", v4, v5, v6, v7, v8);
}

@end