@interface MOPeopleDiscoveryManager
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)universe;
- (MOEventStore)eventStore;
- (MOPeopleDiscoveryManager)initWithUniverse:(id)a3;
- (MORoutineServiceManager)routineServiceManager;
- (OS_dispatch_queue)queue;
- (id)_createEventFromPeopleDensityEvent:(id)a3;
- (id)_createEventFromProx:(id)a3;
- (id)_createNewEventsWithStoredEvents:(id)a3 peopleDensityEvents:(id)a4;
- (id)_createNewEventsWithStoredEvents:(id)a3 proxEvents:(id)a4;
- (id)_rehydrateStoredEvents:(id)a3 fromPeopleDensityEvents:(id)a4;
- (id)_rehydrateStoredEvents:(id)a3 fromProxEvents:(id)a4;
- (id)_updateMOEventWithEndDate:(id)a3 endDate:(id)a4;
- (id)routineManager;
- (void)_fetchPeopleDensityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_rehydratePeopleDensityEvents:(id)a3 handler:(id)a4;
- (void)_rehydrateProx:(id)a3 handler:(id)a4;
- (void)_removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)_removeProxDeletedAtSource:(id)a3 handler:(id)a4;
- (void)_saveEvents:(id)a3 handler:(id)a4;
- (void)_savePeopleDensityEvents:(id)a3 handler:(id)a4;
- (void)fetchAndSavePeopleDensityEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchAndSaveProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)rehydratePeopleDensityEvents:(id)a3 handler:(id)a4;
- (void)rehydrateProx:(id)a3 handler:(id)a4;
- (void)removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)removeProxDeletedAtSource:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setRoutineServiceManager:(id)a3;
- (void)setUniverse:(id)a3;
@end

@implementation MOPeopleDiscoveryManager

- (MOPeopleDiscoveryManager)initWithUniverse:(id)a3
{
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 getService:v8];

  if (!v9)
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOPeopleDiscoveryManager initWithUniverse:]();
    }

    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MOPeopleDiscoveryManager.m" lineNumber:57 description:@"Invalid parameter not satisfying: configurationManager"];
    goto LABEL_12;
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v6 getService:v11];

  if (!v12)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MOPeopleDiscoveryManager initWithUniverse:]();
    }

    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MOPeopleDiscoveryManager.m" lineNumber:63 description:@"Invalid parameter not satisfying: eventStore"];

LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v22.receiver = self;
  v22.super_class = (Class)MOPeopleDiscoveryManager;
  v13 = [(MOPeopleDiscoveryManager *)&v22 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MOPeopleDiscoveryManager", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_eventStore, v12);
    objc_storeStrong((id *)&v13->_configurationManager, v9);
    objc_storeStrong((id *)&v13->_universe, a3);
  }
  self = v13;
  v17 = self;
LABEL_13:

  return v17;
}

- (id)routineManager
{
  routineServiceManager = self->_routineServiceManager;
  if (!routineServiceManager)
  {
    universe = self->_universe;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [(MODaemonUniverse *)universe getService:v6];
    v8 = self->_routineServiceManager;
    self->_routineServiceManager = v7;

    routineServiceManager = self->_routineServiceManager;
  }

  return [(MORoutineServiceManager *)routineServiceManager routineManager];
}

- (void)fetchAndSaveProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CAD10;
  v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOPeopleDiscoveryManager *)v9 _fetchProxBetweenStartDate:a3 EndDate:a4 handler:v8];
}

void __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    id v9 = [v5 count];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        id v17 = [v5 count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "saving %lu proximity events", buf, 0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke_104;
      v14[3] = &unk_1002C9A50;
      v12 = *(void **)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      [v12 _saveEvents:v5 handler:v14];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "no proximity event are fetched", buf, 2u);
      }

      uint64_t v13 = *(void *)(a1 + 40);
      if (v13)
      {
        v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_4;
      }
    }
  }
}

uint64_t __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke_104(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchAndSavePeopleDensityEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CAD10;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOPeopleDiscoveryManager *)v9 _fetchPeopleDensityBetweenStartDate:a3 EndDate:a4 handler:v8];
}

void __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    id v9 = [v5 count];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        id v17 = [v5 count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "saving %lu people density events", buf, 0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke_107;
      v14[3] = &unk_1002C9A50;
      v12 = *(void **)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      [v12 _savePeopleDensityEvents:v5 handler:v14];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "no people density events are fetched", buf, 2u);
      }

      uint64_t v13 = *(void *)(a1 + 40);
      if (v13)
      {
        v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_4;
      }
    }
  }
}

uint64_t __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke_107(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MOPeopleDiscoveryManager *)self routineManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002CADD0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 fetchProximityHistoryFromStartDate:v14 endDate:v13 completionHandler:v15];
}

void __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_5:
    v8();
    goto LABEL_21;
  }
  id v9 = [v5 count];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      v25 = *(void **)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v34 = v25;
      __int16 v35 = 2112;
      uint64_t v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "proximity event fetch result is nil, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v11)
  {
    id v12 = [v5 count];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    id v34 = v12;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetch %lu proximity events, start date, %@, end date, %@", buf, 0x20u);
  }

  id v15 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v27 = v5;
  id v16 = v5;
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
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_super v22 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "proximity event: %@", buf, 0xCu);
        }

        v23 = [v21 endDate];

        if (v23)
        {
          v24 = [*(id *)(a1 + 48) _createEventFromProx:v21];
          [v15 addObject:v24];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v6 = 0;
  id v5 = v27;
LABEL_21:
}

- (void)_fetchPeopleDensityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MOPeopleDiscoveryManager *)self routineManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002CADD0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 fetchPeopleDensityHistoryFromStartDate:v14 endDate:v13 completionHandler:v15];
}

void __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_5:
    v8();
    goto LABEL_21;
  }
  id v9 = [v5 count];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      v25 = *(void **)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v34 = v25;
      __int16 v35 = 2112;
      uint64_t v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "people density fetch result is empty, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v11)
  {
    id v12 = [v5 count];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    id v34 = v12;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetch %lu people density events, start date, %@, end date, %@", buf, 0x20u);
  }

  id v15 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v27 = v5;
  id v16 = v5;
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
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_super v22 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "people density event: %@", buf, 0xCu);
        }

        v23 = [v21 endDate];

        if (v23)
        {
          v24 = [*(id *)(a1 + 48) _createEventFromPeopleDensityEvent:v21];
          [v15 addObject:v24];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v6 = 0;
  id v5 = v27;
LABEL_21:
}

- (id)_createEventFromProx:(id)a3
{
  id v4 = a3;
  id v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  uint64_t v7 = [v4 startDate];
  id v8 = [v4 endDate];
  if (v8) {
    [v4 endDate];
  }
  else {
  id v9 = +[NSDate now];
  }
  id v10 = +[NSDate now];
  BOOL v11 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v9 creationDate:v10 provider:6 category:15];

  id v12 = [v4 endDate];
  if (v12) {
    [v4 endDate];
  }
  else {
  uint64_t v13 = +[NSDate now];
  }
  uint64_t v14 = [(MOPeopleDiscoveryManager *)self configurationManager];
  LODWORD(v15) = 1242802176;
  [v14 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v15];
  id v17 = [v13 dateByAddingTimeInterval:v16];
  [(MOEvent *)v11 setExpirationDate:v17];

  id v18 = [v4 endDate];
  if (v18)
  {
    [(MOEvent *)v11 setSourceCreationDate:v18];
  }
  else
  {
    uint64_t v19 = +[NSDate now];
    [(MOEvent *)v11 setSourceCreationDate:v19];
  }
  v20 = [v4 endDate];

  if (!v20) {
    [(MOEvent *)v11 setIsGComplete:0];
  }
  v21 = [v4 eventID];
  objc_super v22 = [v21 UUIDString];
  [(MOEvent *)v11 setIdentifierFromProvider:v22];

  return v11;
}

- (id)_createEventFromPeopleDensityEvent:(id)a3
{
  id v3 = a3;
  id v4 = [MOEvent alloc];
  id v5 = +[NSUUID UUID];
  id v6 = [v3 startDate];
  uint64_t v7 = [v3 endDate];
  if (v7) {
    [v3 endDate];
  }
  else {
  id v8 = +[NSDate now];
  }
  id v9 = +[NSDate now];
  id v10 = [(MOEvent *)v4 initWithEventIdentifier:v5 startDate:v6 endDate:v8 creationDate:v9 provider:6 category:23];

  BOOL v11 = [v3 endDate];
  if (v11) {
    [v3 endDate];
  }
  else {
  id v12 = +[NSDate now];
  }
  uint64_t v13 = [v12 dateByAddingTimeInterval:2419200.0];
  [(MOEvent *)v10 setExpirationDate:v13];

  uint64_t v14 = [v3 endDate];
  if (v14)
  {
    [(MOEvent *)v10 setSourceCreationDate:v14];
  }
  else
  {
    double v15 = +[NSDate now];
    [(MOEvent *)v10 setSourceCreationDate:v15];
  }
  float v16 = [v3 uuid];
  id v17 = [v16 UUIDString];
  [(MOEvent *)v10 setIdentifierFromProvider:v17];

  id v18 = [v3 endDate];

  if (!v18) {
    [(MOEvent *)v10 setIsGComplete:0];
  }

  return v10;
}

- (id)_updateMOEventWithEndDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [MOEvent alloc];
  id v8 = [v6 eventIdentifier];
  id v9 = [v6 startDate];
  id v10 = [v6 creationDate];
  BOOL v11 = [[v7 initWithEventIdentifier:v8 startDate:v9 endDate:v5 creationDate:v10 provider:[v6 provider] category:[v6 category]];

  id v12 = [v6 expirationDate];
  [(MOEvent *)v11 setExpirationDate:v12];

  uint64_t v13 = [v6 sourceCreationDate];
  [(MOEvent *)v11 setSourceCreationDate:v13];

  [(MOEvent *)v11 setIsGComplete:1];
  uint64_t v14 = [v6 identifierFromProvider];

  [(MOEvent *)v11 setIdentifierFromProvider:v14];

  return v11;
}

- (void)_saveEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  eventStore = self->_eventStore;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke;
  v28[3] = &unk_1002CADF8;
  v28[4] = &v29;
  [(MOEventStore *)eventStore fetchLastEventOfCategory:15 CompletionHandler:v28];
  id v8 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v12);
        if (!v30[5]
          || ([*(id *)(*((void *)&v24 + 1) + 8 * (void)v12) startDate],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              [(id)v30[5] startDate],
              double v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v14 isAfterDate:v15],
              v15,
              v14,
              v16))
        {
          [v8 addObject:v13];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v10);
  }

  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "trying to save %lu proximity events", buf, 0xCu);
  }

  uint64_t v19 = self->_eventStore;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_116;
  v22[3] = &unk_1002C9A50;
  id v20 = v21;
  id v23 = v20;
  [(MOEventStore *)v19 storeEvents:v8 CompletionHandler:v22];

  _Block_object_dispose(&v29, 8);
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_116_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)_savePeopleDensityEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  eventStore = self->_eventStore;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke;
  v28[3] = &unk_1002CADF8;
  v28[4] = &v29;
  [(MOEventStore *)eventStore fetchLastEventOfCategory:23 CompletionHandler:v28];
  uint64_t v8 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v12);
        if (!v30[5]
          || ([*(id *)(*((void *)&v24 + 1) + 8 * (void)v12) startDate],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              [(id)v30[5] startDate],
              double v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v14 isAfterDate:v15],
              v15,
              v14,
              v16))
        {
          [v8 addObject:v13];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v10);
  }

  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "trying to save %lu people density events", buf, 0xCu);
  }

  uint64_t v19 = self->_eventStore;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_117;
  v22[3] = &unk_1002C9A50;
  id v20 = v21;
  id v23 = v20;
  [(MOEventStore *)v19 storeEvents:v8 CompletionHandler:v22];

  _Block_object_dispose(&v29, 8);
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_117_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)rehydrateProx:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOPeopleDiscoveryManager_rehydrateProx_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __50__MOPeopleDiscoveryManager_rehydrateProx_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateProx:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateProx:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 getDurationOfMOEventArray];
  id v9 = [(MOPeopleDiscoveryManager *)self routineManager];
  id v10 = [v8 startDate];
  uint64_t v11 = [v8 endDate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke;
  v15[3] = &unk_1002CADD0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  [v9 fetchProximityHistoryFromStartDate:v10 endDate:v11 completionHandler:v15];
}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2;
  v11[3] = &unk_1002CAE20;
  id v12 = v6;
  id v13 = a1[5];
  id v17 = a1[7];
  id v8 = a1[4];
  id v14 = v5;
  id v15 = v8;
  id v16 = a1[6];
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 48) count];
      id v6 = [*(id *)(a1 + 40) startDate];
      id v7 = [*(id *)(a1 + 40) endDate];
      int v9 = 134218498;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "fetch %lu proximity event, start date, %@, end date, %@", (uint8_t *)&v9, 0x20u);
    }
    id v8 = [*(id *)(a1 + 56) _rehydrateStoredEvents:*(void *)(a1 + 64) fromProxEvents:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (id)_rehydrateStoredEvents:(id)a3 fromProxEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No storedEvents for rehydrating prox event", buf, 2u);
    }
    goto LABEL_31;
  }
  if (![v6 count])
  {
    uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "prox event fetch result is nil for rehydrate stored events", buf, 2u);
    }

    v32 = [MORehydrationMetrics alloc];
    v33 = [v5 firstObject];
    id v34 = [v33 category];
    __int16 v35 = [v5 firstObject];
    id v7 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v32, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v34, [v35 provider], 1, 0, [v5 count], 3, (double)[v5 count], 0.0);

    uint64_t v58 = 0;
    [v7 submitMetricsWithError:&v58];
LABEL_31:
    id v36 = 0;
    goto LABEL_36;
  }
  id v7 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v46 = v6;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v55;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v14 = [v13 eventID:v46];
        id v15 = [v14 UUIDString];
        [v7 setValue:v13 forKey:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v10);
  }

  id v16 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v47 = v5;
  id v17 = v5;
  id v18 = [v17 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v18)
  {
    id v19 = v18;
    id v20 = 0;
    uint64_t v21 = *(void *)v51;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v17);
        }
        id v23 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        long long v24 = [v23 identifierFromProvider:v46];
        long long v25 = [v7 objectForKey:v24];

        if (v25)
        {
          if (([v23 isGComplete] & 1) != 0
            || ([v25 endDate], long long v26 = objc_claimAutoreleasedReturnValue(), v26, !v26))
          {
            id v28 = [v23 copy];
          }
          else
          {
            uint64_t v27 = [v25 endDate];
            id v28 = [(MOPeopleDiscoveryManager *)self _updateMOEventWithEndDate:v23 endDate:v27];

            id v20 = (void *)v27;
          }

          [v28 setGaPR:[v25 relationship]];
          [v25 socialScore];
          uint64_t v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v28 setPCount:v29];

          long long v30 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v60 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "_rehydrateProx, rehydrated event, %@", buf, 0xCu);
          }

          [v16 addObject:v28];
          id v20 = v28;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v19);
  }
  else
  {
    id v20 = 0;
  }

  __int16 v37 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    id v38 = [v16 count];
    id v39 = [v17 count];
    *(_DWORD *)buf = 134218240;
    id v60 = v38;
    __int16 v61 = 2048;
    id v62 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "rehydrated prox events count, %lu, stored prox event count, %lu", buf, 0x16u);
  }

  v40 = [MORehydrationMetrics alloc];
  v41 = [v17 firstObject];
  id v42 = [v41 category];
  v43 = [v17 firstObject];
  v44 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v40, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v42, [v43 provider], 1, 0, [v17 count], 3, (double)(int)([v17 count] - [v16 count]), 0.0);

  uint64_t v49 = 0;
  [(MORehydrationMetrics *)v44 submitMetricsWithError:&v49];
  id v36 = v16;

  id v6 = v46;
  id v5 = v47;
LABEL_36:

  return v36;
}

- (void)rehydratePeopleDensityEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOPeopleDiscoveryManager_rehydratePeopleDensityEvents_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __65__MOPeopleDiscoveryManager_rehydratePeopleDensityEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydratePeopleDensityEvents:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydratePeopleDensityEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  id v9 = [(MOPeopleDiscoveryManager *)self routineManager];
  id v10 = [v8 startDate];
  uint64_t v11 = [v8 endDate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke;
  v15[3] = &unk_1002CAE48;
  id v16 = v8;
  id v17 = self;
  id v18 = v6;
  id v19 = v7;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  [v9 fetchPeopleDensityHistoryFromStartDate:v10 endDate:v11 completionHandler:v15];
}

void __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_5:
    v8();
    goto LABEL_10;
  }
  id v9 = [v5 count];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      id v16 = [*(id *)(a1 + 32) startDate];
      id v17 = [*(id *)(a1 + 32) endDate];
      int v18 = 138412802;
      id v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "People density event fetch result is nil, start date, %@, end date, %@, error, %@", (uint8_t *)&v18, 0x20u);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v11)
  {
    id v12 = [v5 count];
    id v13 = [*(id *)(a1 + 32) startDate];
    id v14 = [*(id *)(a1 + 32) endDate];
    int v18 = 134218498;
    id v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetch %lu people density events, start date, %@, end date, %@", (uint8_t *)&v18, 0x20u);
  }
  id v15 = [*(id *)(a1 + 40) _rehydrateStoredEvents:*(void *)(a1 + 48) fromPeopleDensityEvents:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_10:
}

- (id)_rehydrateStoredEvents:(id)a3 fromPeopleDensityEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No storedEvents for rehydrating density events event", buf, 2u);
    }
    goto LABEL_35;
  }
  if (![v6 count])
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "density events fetch result is nil for rehydrate stored events", buf, 2u);
    }

    v41 = [MORehydrationMetrics alloc];
    id v42 = [v5 firstObject];
    id v43 = [v42 category];
    v44 = [v5 firstObject];
    id v7 = [[MORehydrationMetrics alloc] initWithCategory:v41 provider:v43 spiSuccess:1 spiError:0 failCount:[v5 count] successAfterPreFailCount:3 totalCount:[v5 count] rehydrationTrigger:0.0];

    uint64_t v58 = 0;
    [v7 submitMetricsWithError:&v58];
LABEL_35:
    id v17 = 0;
    goto LABEL_36;
  }
  id v7 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v46 = v6;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v55;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v14 = [v13 uuid:v46];

        if (v14)
        {
          id v15 = [v13 uuid];
          id v16 = [v15 UUIDString];
          [v7 setValue:v13 forKey:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v10);
  }

  id v17 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v47 = v5;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v51;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        long long v24 = [v23 identifierFromProvider:v46];
        long long v25 = [v7 objectForKey:v24];

        if (v25)
        {
          if (([v23 isGComplete] & 1) != 0
            || ([v25 endDate], long long v26 = objc_claimAutoreleasedReturnValue(), v26, !v26))
          {
            id v28 = [v23 copy];
          }
          else
          {
            uint64_t v27 = [v25 endDate];
            id v28 = [(MOPeopleDiscoveryManager *)self _updateMOEventWithEndDate:v23 endDate:v27];
          }
          [v25 densityScore];
          uint64_t v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v28 setDensityScore:v29];

          [v25 scanDuration];
          long long v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v28 setDensityScanDuration:v30];

          uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v60 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "_rehydratePeopleDensityEvents, rehydrated event, %@", buf, 0xCu);
          }

          [v17 addObject:v28];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v20);
  }

  v32 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    id v33 = [v18 count];
    id v34 = [v17 count];
    *(_DWORD *)buf = 134218240;
    id v60 = v33;
    __int16 v61 = 2048;
    id v62 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "stored density event count, %lu, rehydrated density event count, %lu", buf, 0x16u);
  }

  __int16 v35 = [MORehydrationMetrics alloc];
  id v36 = [v18 firstObject];
  id v37 = [v36 category];
  id v38 = [v18 firstObject];
  id v39 = [[MORehydrationMetrics alloc] initWithCategory:v35 provider:[v38 provider] spiSuccess:1 spiError:0 failCount:[v18 count] successAfterPreFailCount:[v17 count] totalCount:[v18 count] rehydrationTrigger:0.0];

  uint64_t v49 = 0;
  [(MORehydrationMetrics *)v39 submitMetricsWithError:&v49];

  id v6 = v46;
  id v5 = v47;
LABEL_36:

  return v17;
}

- (void)removeProxDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002C9A50;
  id v4 = *(id *)(a1 + 48);
  [v1 _removeProxDeletedAtSource:v2 handler:v3];
}

uint64_t __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002C9A50;
  id v4 = *(id *)(a1 + 48);
  [v1 _removePeopleDensityEventsDeletedAtSource:v2 handler:v3];
}

uint64_t __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeProxDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  id v9 = [(MOPeopleDiscoveryManager *)self routineManager];
  id v10 = [v8 startDate];
  uint64_t v11 = [v8 endDate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke;
  v15[3] = &unk_1002CADD0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  [v9 fetchProximityHistoryFromStartDate:v10 endDate:v11 completionHandler:v15];
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_2;
  v12[3] = &unk_1002CAE20;
  id v13 = v6;
  id v14 = a1[5];
  id v18 = a1[7];
  id v15 = v5;
  id v8 = a1[6];
  id v9 = a1[4];
  id v16 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v3 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v4 = *(id *)(a1 + 48);
    id v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v10 = [v9 eventID];
          id v11 = [v10 UUIDString];
          [v3 setValue:v9 forKey:v11];
        }
        id v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }

    id v12 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = *(id *)(a1 + 56);
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
          id v19 = [v18 identifierFromProvider];
          id v20 = [v3 objectForKey:v19];

          if (!v20) {
            [v12 addObject:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }

    uint64_t v21 = [*(id *)(a1 + 64) eventStore];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122;
    v22[3] = &unk_1002C9A50;
    id v23 = *(id *)(a1 + 72);
    [v21 removeEvents:v12 CompletionHandler:v22];
  }
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)_removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getDurationOfMOEventArray];
  uint64_t v9 = [(MOPeopleDiscoveryManager *)self routineManager];
  id v10 = [v8 startDate];
  id v11 = [v8 endDate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke;
  v15[3] = &unk_1002CAE48;
  id v16 = v8;
  id v17 = v6;
  id v18 = self;
  id v19 = v7;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  [v9 fetchPeopleDensityHistoryFromStartDate:v10 endDate:v11 completionHandler:v15];
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1();
    }

    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v8 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v15 = [v14 uuid];

          if (v15)
          {
            id v16 = [v14 uuid];
            id v17 = [v16 UUIDString];
            [v8 setValue:v14 forKey:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    id v18 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = a1[5];
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          long long v25 = [v24 identifierFromProvider];
          long long v26 = [v8 objectForKey:v25];

          if (!v26) {
            [v18 addObject:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }

    long long v27 = [a1[6] eventStore];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123;
    v29[3] = &unk_1002C9A50;
    id v30 = a1[7];
    [v27 removeEvents:v18 CompletionHandler:v29];

    id v6 = 0;
    id v5 = v28;
  }
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __93__MOPeopleDiscoveryManager_fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __93__MOPeopleDiscoveryManager_fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchProxEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 15];
  id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 6];
  v29[0] = v14;
  v29[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v29 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  id v18 = [v13 filteredArrayUsingPredicate:v17];

  id v19 = [(MOPeopleDiscoveryManager *)self routineManager];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v24[3] = &unk_1002CAE98;
  v24[4] = self;
  id v25 = v10;
  id v27 = v18;
  id v28 = v12;
  id v26 = v11;
  id v20 = v18;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  [v19 fetchProximityHistoryFromStartDate:v23 endDate:v22 completionHandler:v24];
}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
  block[3] = &unk_1002CAE70;
  id v11 = v6;
  id v12 = a1[5];
  id v13 = a1[6];
  id v17 = a1[8];
  id v14 = a1[7];
  id v15 = v5;
  id v16 = a1[4];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2_cold_1(a1, v2, v5);
    }

    if ([*v2 code] == (id)5)
    {
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      CFStringRef v34 = @"Provider database is unavailable";
      id v6 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v7 = +[NSError errorWithDomain:@"MOErrorDomain" code:1152 userInfo:v6];

      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    id v20 = [MORehydrationMetrics alloc];
    id v21 = [*(id *)(a1 + 32) description];
    id v11 = [[MORehydrationMetrics alloc] initWithCategory:v20 provider:v21 spiSuccess:15 spiError:6 failCount:v21 successAfterPreFailCount:[*(id *)(a1 + 56) count] totalCount:3 rehydrationTrigger:0.0];

    uint64_t v22 = 0;
    [(MORehydrationMetrics *)v11 submitMetricsWithError:&v22];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 64) count];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      id v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetch %lu proximity event, start date, %@, end date, %@", buf, 0x20u);
    }

    id v11 = [*(id *)(a1 + 72) _rehydrateStoredEvents:*(void *)(a1 + 56) fromProxEvents:*(void *)(a1 + 64)];
    id v12 = [*(id *)(a1 + 72) _createNewEventsWithStoredEvents:*(void *)(a1 + 56) proxEvents:*(void *)(a1 + 64)];
    id v13 = objc_opt_new();
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      id v17 = [(MORehydrationMetrics *)v11 count];
      id v18 = [v12 count];
      id v19 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 138413314;
      id v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      id v28 = v17;
      __int16 v29 = 2048;
      id v30 = v18;
      __int16 v31 = 2048;
      id v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated prox events count, %lu, new prox events counts, %lu, stored prox events count, %lu", buf, 0x34u);
    }

    if (v12) {
      [v13 setObject:v12 forKey:@"newEvents"];
    }
    if (v11) {
      [v13 setObject:v11 forKey:@"rehydratedEvents"];
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (id)_createNewEventsWithStoredEvents:(id)a3 proxEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      id v43 = (id)objc_opt_new();
      id v7 = objc_opt_new();
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v49 objects:v62 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v50;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            id v14 = [v13 identifierFromProvider];

            if (v14)
            {
              id v15 = [v13 identifierFromProvider];
              [v7 setValue:v13 forKey:v15];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v49 objects:v62 count:16];
        }
        while (v10);
      }
      id v42 = v5;

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v41 = v6;
      id v16 = v6;
      id v17 = [v16 countByEnumeratingWithState:&v45 objects:v61 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
            uint64_t v22 = [v21 eventID:v41];
            id v23 = [v22 UUIDString];
            id v24 = [v7 objectForKey:v23];

            if (!v24)
            {
              __int16 v25 = [v21 endDate];

              if (v25)
              {
                uint64_t v26 = [(MOPeopleDiscoveryManager *)self _createEventFromProx:v21];
                [v26 setGaPR:[v21 relationship]];
                [v21 socialScore];
                __int16 v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v26 setPCount:v27];

                if (v26) {
                  [v43 addObject:v26];
                }
              }
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v45 objects:v61 count:16];
        }
        while (v18);
      }

      id v28 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [v43 count];
        id v30 = [v8 count];
        *(_DWORD *)buf = 134218240;
        id v58 = v29;
        __int16 v59 = 2048;
        id v60 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "new prox events count, %lu, stored prox event count, %lu", buf, 0x16u);
      }

      id v6 = v41;
      id v5 = v42;
    }
    else
    {
      __int16 v31 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "No storedEvents for checking before create new prox events", buf, 2u);
      }

      id v43 = (id)objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v7 = v6;
      id v32 = [v7 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v54;
        do
        {
          for (k = 0; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v54 != v34) {
              objc_enumerationMutation(v7);
            }
            long long v36 = *(void **)(*((void *)&v53 + 1) + 8 * (void)k);
            long long v37 = [v36 endDate];

            if (v37)
            {
              long long v38 = [(MOPeopleDiscoveryManager *)self _createEventFromProx:v36];
              [v38 setGaPR:[v36 relationship]];
              [v36 socialScore];
              id v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v38 setPCount:v39];

              if (v38) {
                [v43 addObject:v38];
              }
            }
          }
          id v33 = [v7 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v33);
      }
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "prox event fetch result is nil for creating new events", buf, 2u);
    }
    id v43 = 0;
  }

  return v43;
}

- (void)fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOPeopleDiscoveryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __102__MOPeopleDiscoveryManager_fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __102__MOPeopleDiscoveryManager_fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPeopleDensityEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 23];
  id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 6];
  v30[0] = v14;
  v30[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v30 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  id v18 = [v13 filteredArrayUsingPredicate:v17];

  uint64_t v19 = [(MOPeopleDiscoveryManager *)self routineManager];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v24[3] = &unk_1002CAEC0;
  id v25 = v10;
  id v26 = v11;
  id v28 = self;
  id v29 = v12;
  id v27 = v18;
  id v20 = v18;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  [v19 fetchPeopleDensityHistoryFromStartDate:v23 endDate:v22 completionHandler:v24];
}

void __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1();
    }

    if ([v6 code] == (id)5)
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      CFStringRef v38 = @"Provider database is unavailable";
      id v9 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v10 = +[NSError errorWithDomain:@"MOErrorDomain" code:1152 userInfo:v9];

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    id v23 = [MORehydrationMetrics alloc];
    id v24 = [v6 description];
    id v14 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v23, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 23, 6, 0, v24, [*(id *)(a1 + 48) count], 3, (double)(int)objc_msgSend(*(id *)(a1 + 48), "count"), 0.0);

    uint64_t v26 = 0;
    [(MORehydrationMetrics *)v14 submitMetricsWithError:&v26];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v11 = [v5 count];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      id v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetch %lu density events, start date, %@, end date, %@", buf, 0x20u);
    }

    id v14 = [*(id *)(a1 + 56) _rehydrateStoredEvents:*(void *)(a1 + 48) fromPeopleDensityEvents:v5];
    id v15 = [*(id *)(a1 + 56) _createNewEventsWithStoredEvents:*(void *)(a1 + 48) peopleDensityEvents:v5];
    id v16 = objc_opt_new();
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v25 = v5;
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      id v20 = [(MORehydrationMetrics *)v14 count];
      id v21 = [v15 count];
      id v22 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138413314;
      id v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      id v5 = v25;
      __int16 v31 = 2048;
      id v32 = v20;
      __int16 v33 = 2048;
      id v34 = v21;
      __int16 v35 = 2048;
      id v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated density events count, %lu, new density events counts, %lu, stored density events count, %lu", buf, 0x34u);
    }

    if (v15) {
      [v16 setObject:v15 forKey:@"newEvents"];
    }
    if (v14) {
      [v16 setObject:v14 forKey:@"rehydratedEvents"];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)_createNewEventsWithStoredEvents:(id)a3 peopleDensityEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      id v45 = (id)objc_opt_new();
      id v7 = objc_opt_new();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v51 objects:v64 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v52;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            id v14 = [v13 identifierFromProvider];
            [v7 setValue:v13 forKey:v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v51 objects:v64 count:16];
        }
        while (v10);
      }
      id v44 = v5;
      id v42 = v8;

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v43 = v6;
      id v15 = v6;
      id v16 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
            id v21 = [v20 uuid];
            id v22 = [v21 UUIDString];
            id v23 = [v7 objectForKey:v22];

            if (!v23)
            {
              id v24 = [v20 endDate];

              if (v24)
              {
                id v25 = [(MOPeopleDiscoveryManager *)self _createEventFromPeopleDensityEvent:v20];
                [v20 densityScore];
                uint64_t v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v25 setDensityScore:v26];

                [v20 scanDuration];
                id v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v25 setDensityScanDuration:v27];

                if (v25) {
                  [v45 addObject:v25];
                }
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
        }
        while (v17);
      }

      id v28 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [v45 count];
        id v30 = [v42 count];
        *(_DWORD *)buf = 134218240;
        id v60 = v29;
        __int16 v61 = 2048;
        id v62 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "new density events count, %lu, stored density event count, %lu", buf, 0x16u);
      }

      id v6 = v43;
      id v5 = v44;
    }
    else
    {
      __int16 v31 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "No storedEvents for checking before create new density events", buf, 2u);
      }

      id v45 = (id)objc_opt_new();
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v7 = v6;
      id v32 = [v7 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v56;
        do
        {
          for (k = 0; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v56 != v34) {
              objc_enumerationMutation(v7);
            }
            id v36 = *(void **)(*((void *)&v55 + 1) + 8 * (void)k);
            NSErrorUserInfoKey v37 = [v36 endDate];

            if (v37)
            {
              CFStringRef v38 = [(MOPeopleDiscoveryManager *)self _createEventFromPeopleDensityEvent:v36];
              [v36 densityScore];
              id v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v38 setDensityScore:v39];

              [v36 scanDuration];
              v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v38 setDensityScanDuration:v40];

              if (v38) {
                [v45 addObject:v38];
              }
            }
          }
          id v33 = [v7 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v33);
      }
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "density event fetch result is nil for creating new events", buf, 2u);
    }
    id v45 = 0;
  }

  return v45;
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
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

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurationManager", v1, 2u);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventStore", v1, 2u);
}

void __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "proximity event fetch hit error, start date, %@, end date, %@, error, %@");
}

void __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "people density fetch hit error, start date, %@, end date, %@, error, %@");
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_116_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving proximity event into database failed, error %@", v2, v3, v4, v5, v6);
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_117_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving people density events into database failed, error %@", v2, v3, v4, v5, v6);
}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = [*(id *)(v1 + 40) startDate];
  uint64_t v3 = [*(id *)(v0 + 40) endDate];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v4, v5, "proximity event fetch hit error, start date, %@, end date, %@, error, %@", v6, v7, v8, v9, v10);
}

void __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = [*(id *)(v1 + 32) startDate];
  uint64_t v3 = [*(id *)(v0 + 32) endDate];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v4, v5, "People density event fetch hit error, start date, %@, end date, %@, error, %@", v6, v7, v8, v9, v10);
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "delete proximity event succeeded", v1, 2u);
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_122_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete proximity event failed, error %@", v2, v3, v4, v5, v6);
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "delete people density events succeded, event count", v1, 2u);
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_123_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete people density events failed, error %@", v2, v3, v4, v5, v6);
}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&void v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 48);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, (uint64_t)a2, a3, "proximity event fetch hit error, start date, %@, end date, %@, error, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "density event fetch hit error, start date, %@, end date, %@, error, %@");
}

@end