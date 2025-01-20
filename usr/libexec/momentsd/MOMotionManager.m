@interface MOMotionManager
+ (BOOL)eligibleForBundling:(unint64_t)a3;
- (CMMotionActivityManager)motionActivityManager;
- (CMPedometer)pedometer;
- (HKHealthStore)healthStore;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)eventStore;
- (MOMotionManager)initWithUniverse:(id)a3;
- (MORoutineServiceManager)routineServiceManager;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (id)createEventForMotionActivityWithStartDate:(id)a3 andEndDate:(id)a4;
- (id)createEventsFromActivities:(id)a3 withMininumEventSize:(double)a4;
- (void)_createNewEventsFromActivities:(id)a3 handler:(id)a4;
- (void)_fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_rehydrateEvents:(id)a3 andCreateNewEventsfromMotionActivity:(id)a4 handler:(id)a5;
- (void)_rehydrateMotionActivity:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5;
- (void)_removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4;
- (void)_setMotionTypeAndDurationFor:(id)a3 fromMotionActivity:(id)a4;
- (void)_updateDeviceLocationsForMotionEvents:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5;
- (void)_updateMetadataOfMotionEvents:(id)a3 withMotionActities:(id)a4 handler:(id)a5;
- (void)fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)fetchPedometerDataFor:(id)a3 toEndDate:(id)a4 CompletionHandler:(id)a5;
- (void)rehydrateMotionActivity:(id)a3 handler:(id)a4;
- (void)removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPedometer:(id)a3;
- (void)setRoutineServiceManager:(id)a3;
@end

@implementation MOMotionManager

- (MOMotionManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)CMMotionActivityManager);
  id v7 = objc_alloc_init((Class)CMPedometer);
  id v8 = objc_alloc_init((Class)HKHealthStore);
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v5 getService:v10];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v5 getService:v13];

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [v5 getService:v16];

  if (!v11)
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MOMotionManager initWithUniverse:](v26, v27, v28, v29, v30, v31, v32, v33);
    }

    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"MOMotionManager.m" lineNumber:65 description:@"Invalid parameter not satisfying: eventStore"];

    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  v36.receiver = self;
  v36.super_class = (Class)MOMotionManager;
  v18 = [(MOMotionManager *)&v36 init];
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("MOMotionManager", v19);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = objc_opt_new();
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = (NSOperationQueue *)v22;

    v24 = [(MOMotionManager *)v18 queue];
    [(NSOperationQueue *)v18->_operationQueue setUnderlyingQueue:v24];

    objc_storeStrong((id *)&v18->_motionActivityManager, v6);
    objc_storeStrong((id *)&v18->_pedometer, v7);
    objc_storeStrong((id *)&v18->_eventStore, v11);
    objc_storeStrong((id *)&v18->_configurationManager, v14);
    objc_storeStrong((id *)&v18->_routineServiceManager, v17);
    objc_storeStrong((id *)&v18->_healthStore, v8);
  }
  self = v18;
  v25 = self;
LABEL_10:

  return v25;
}

- (void)fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MOMotionManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002D1D88;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32) && (v3 = (void *)(a1 + 40), *(void *)(a1 + 40)))
  {
    uint64_t v9 = 0;
    v10[0] = &v9;
    v10[1] = 0x3032000000;
    v10[2] = __Block_byref_object_copy__38;
    v10[3] = __Block_byref_object_dispose__38;
    id v11 = 0;
    v4 = [*(id *)(a1 + 48) eventStore];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_129;
    v8[3] = &unk_1002CADF8;
    v8[4] = &v9;
    [v4 fetchLastEventOfCategory:16 CompletionHandler:v8];

    if (*(void *)(v10[0] + 40) && objc_msgSend(*v2, "isBeforeDate:")) {
      v2 = (id *)(v10[0] + 40);
    }
    id v5 = *v2;
    if ([v5 isAfterDate:*v3])
    {
      id v6 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_cold_1((uint64_t)v10, (uint64_t *)(a1 + 40), v6);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [*(id *)(a1 + 48) _fetchAndSaveMotionActivityBetweenStartDate:v5 EndDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 56)];
    }

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
}

uint64_t __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_129(uint64_t result, void *a2)
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

- (void)_fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MOMotionManager *)self queue];
  dispatch_assert_queue_V2(v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
  v13[3] = &unk_1002CE538;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(MOMotionManager *)self _fetchMotionActivityBetweenStartDate:v10 EndDate:v9 handler:v13];
}

void __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "trying to save motion event into database, count, %lu", buf, 0xCu);
  }

  if ([v5 count])
  {
    id v8 = [*(id *)(a1 + 32) eventStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_132;
    v9[3] = &unk_1002C9A50;
    id v10 = *(id *)(a1 + 40);
    [v8 storeEvents:v5 CompletionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "saving motion event into database failed with error, %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v35 = a3;
  id v36 = a4;
  id v31 = a5;
  v34 = +[NSCalendar currentCalendar];
  int v8 = +[NSDate now];
  id v9 = [v8 dateByAddingTimeInterval:-604800.0];
  uint64_t v33 = [v34 startOfDayForDate:v9];

  uint64_t v32 = [v34 startOfDayForDate:v35];
  if ([v33 isAfterDate:v32]) {
    id v10 = v33;
  }
  else {
    id v10 = v32;
  }
  id v11 = v10;
  id v12 = objc_opt_new();
  id v13 = 0;
  if ([v11 isBeforeDate:v36])
  {
    do
    {
      id v14 = [v11 dateByAddingTimeInterval:86400.0];

      if ([v11 isAfterDate:v35]) {
        v15 = v11;
      }
      else {
        v15 = v35;
      }
      id v16 = v15;
      if ([v14 isBeforeDate:v36]) {
        id v17 = v14;
      }
      else {
        id v17 = v36;
      }
      id v18 = v17;
      if ([v16 isBeforeDate:v18])
      {
        id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v16 endDate:v18];
        [v12 addObject:v19];
      }
      id v13 = v14;

      id v11 = v13;
    }
    while (([v13 isBeforeDate:v36] & 1) != 0);
  }
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__38;
  v57[4] = __Block_byref_object_dispose__38;
  id v58 = 0;
  dispatch_queue_t v20 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__38;
  v55[4] = __Block_byref_object_dispose__38;
  id v56 = (id)objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v12;
  id v21 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v21)
  {
    uint64_t v38 = *(void *)v52;
    do
    {
      id v39 = v21;
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        dispatch_group_enter(v20);
        v25 = [v23 startDate];

        v26 = [v23 endDate];

        uint64_t v27 = [(MOMotionManager *)self motionActivityManager];
        uint64_t v28 = [(MOMotionManager *)self operationQueue];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
        v44[3] = &unk_1002D1DB0;
        v45 = v20;
        id v11 = v25;
        id v46 = v11;
        id v13 = v26;
        id v47 = v13;
        v48 = self;
        v49 = v55;
        v50 = v57;
        [v27 queryActivityWithAttribute:1 fromDate:v11 toDate:v13 toQueue:v28 withHandler:v44];
      }
      id v21 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v21);
  }

  uint64_t v29 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_2;
  block[3] = &unk_1002D1DD8;
  id v41 = v31;
  v42 = v55;
  v43 = v57;
  id v30 = v31;
  dispatch_group_notify(v20, v29, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

void __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      int v8 = "fetch motion activity failed with error, %@";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    if ([v5 count])
    {
      id v11 = *(void **)(a1 + 56);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_139;
      v14[3] = &unk_1002CF568;
      long long v16 = *(_OWORD *)(a1 + 64);
      id v15 = *(id *)(a1 + 32);
      [v11 _createNewEventsFromActivities:v5 handler:v14];

      goto LABEL_8;
    }
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      id v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      int v8 = "motion activity fetch result for collection is nil, start date, %@, end date, %@, error, %@";
      id v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_4;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_8:
}

void __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v6];
  }
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%lu remaining walking events after rejection filter", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createEventsFromActivities:(id)a3 withMininumEventSize:(double)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v6;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v15 = [v13 startDate];
          long long v16 = [v13 endDate];
          [v16 timeIntervalSinceDate:v15];
          if (v17 >= a4)
          {
            id v18 = [(MOMotionManager *)self createEventForMotionActivityWithStartDate:v15 andEndDate:v16];
            [v7 addObject:v18];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      id v19 = v7;
    }
    else {
      id v19 = &__NSArray0__struct;
    }

    id v6 = v21;
  }
  else
  {
    id v19 = &__NSArray0__struct;
  }

  return v19;
}

- (id)createEventForMotionActivityWithStartDate:(id)a3 andEndDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [MOEvent alloc];
  id v8 = +[NSUUID UUID];
  id v9 = +[NSDate date];
  id v10 = [(MOEvent *)v7 initWithEventIdentifier:v8 startDate:v6 endDate:v5 creationDate:v9 provider:7 category:16];

  uint64_t v11 = [v5 dateByAddingTimeInterval:604800.0];

  [(MOEvent *)v10 setExpirationDate:v11];

  return v10;
}

- (void)fetchPedometerDataFor:(id)a3 toEndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(MOMotionManager *)self pedometer];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke;
  v13[3] = &unk_1002D1E00;
  id v14 = v8;
  id v12 = v8;
  [v11 queryPedometerDataFromDate:v10 toDate:v9 withHandler:v13];
}

void __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v12();
}

+ (BOOL)eligibleForBundling:(unint64_t)a3
{
  return (a3 < 7) & (0x4Cu >> a3);
}

- (void)_setMotionTypeAndDurationFor:(id)a3 fromMotionActivity:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  if ([v5 unknown])
  {
    uint64_t v6 = [v19 motionActivityEvent];
    [v6 setMotionType:0];
  }
  if ([v5 stationary])
  {
    uint64_t v7 = [v19 motionActivityEvent];
    [v7 setMotionType:1];
  }
  if ([v5 walking] && (objc_msgSend(v5, "running") & 1) == 0)
  {
    uint64_t v8 = [v19 motionActivityEvent];
    [v8 setMotionType:2];

    uint64_t v9 = [v19 workoutEvent];
    [v9 setWorkoutType:@"MOMotionActivityTypeWalking"];
  }
  if ([v5 running] && (objc_msgSend(v5, "walking") & 1) == 0)
  {
    uint64_t v10 = [v19 motionActivityEvent];
    [v10 setMotionType:3];

    uint64_t v11 = [v19 workoutEvent];
    [v11 setWorkoutType:@"MOMotionActivityTypeRunning"];
  }
  if ([v5 running] && objc_msgSend(v5, "walking"))
  {
    id v12 = [v19 motionActivityEvent];
    [v12 setMotionType:6];

    uint64_t v13 = [v19 workoutEvent];
    [v13 setWorkoutType:@"MOMotionActivityTypeMixedRunningWalking"];
  }
  if ([v5 automotive])
  {
    id v14 = [v19 motionActivityEvent];
    [v14 setMotionType:4];
  }
  if ([v5 cycling])
  {
    id v15 = [v19 motionActivityEvent];
    [v15 setMotionType:5];

    long long v16 = [v19 workoutEvent];
    [v16 setWorkoutType:@"MOMotionActivityTypeCycling"];
  }
  [v19 duration];
  double v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v18 = [v19 workoutEvent];
  [v18 setWorkoutDuration:v17];
}

- (void)rehydrateMotionActivity:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MOMotionManager_rehydrateMotionActivity_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __51__MOMotionManager_rehydrateMotionActivity_handler___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 48) isAllowedToProcessEventCategory:1];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return [v3 _rehydrateMotionActivity:v4 forLocationSetting:v2 handler:v5];
}

- (void)_rehydrateMotionActivity:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5
{
  id v43 = a3;
  id v33 = a5;
  id v7 = [(MOMotionManager *)self queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v38 = [v43 getDurationOfMOEventArray];
  id v39 = [v38 startDate];
  v40 = [v38 endDate];
  v37 = +[NSCalendar currentCalendar];
  uint64_t v8 = +[NSDate now];
  id v9 = [v8 dateByAddingTimeInterval:-604800.0];
  id v36 = [v37 startOfDayForDate:v9];

  id v35 = [v37 startOfDayForDate:v39];
  if ([v36 isAfterDate:v35]) {
    id v10 = v36;
  }
  else {
    id v10 = v35;
  }
  id v11 = v10;
  id v12 = objc_opt_new();
  id v13 = 0;
  if ([v11 isBeforeDate:v40])
  {
    do
    {
      id v14 = [v11 dateByAddingTimeInterval:86400.0];

      if ([v11 isAfterDate:v39]) {
        id v15 = v11;
      }
      else {
        id v15 = v39;
      }
      id v16 = v15;
      if ([v14 isBeforeDate:v40]) {
        double v17 = v14;
      }
      else {
        double v17 = v40;
      }
      id v18 = v17;
      if ([v16 isBeforeDate:v18])
      {
        id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v16 endDate:v18];
        [v12 addObject:v19];
      }
      id v13 = v14;

      id v11 = v13;
    }
    while (([v13 isBeforeDate:v40] & 1) != 0);
  }
  uint64_t v20 = dispatch_group_create();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__38;
  v60[4] = __Block_byref_object_dispose__38;
  id v61 = (id)objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v12;
  id v21 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v21)
  {
    uint64_t v42 = *(void *)v57;
    do
    {
      long long v22 = 0;
      long long v23 = v13;
      long long v24 = v11;
      do
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v22);
        dispatch_group_enter(v20);
        id v11 = [v25 startDate];

        id v13 = [v25 endDate];

        motionActivityManager = self->_motionActivityManager;
        uint64_t v28 = [(MOMotionManager *)self operationQueue];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke;
        v51[3] = &unk_1002D1E28;
        long long v52 = v20;
        id v53 = v43;
        long long v54 = self;
        v55 = v60;
        [(CMMotionActivityManager *)motionActivityManager queryActivityWithAttribute:1 fromDate:v11 toDate:v13 toQueue:v28 withHandler:v51];

        long long v22 = (char *)v22 + 1;
        long long v23 = v13;
        long long v24 = v11;
      }
      while (v21 != v22);
      id v21 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v21);
  }

  uint64_t v29 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_157;
  block[3] = &unk_1002D1E78;
  v49 = v60;
  id v45 = v39;
  id v46 = v40;
  BOOL v50 = a4;
  id v47 = self;
  id v48 = v33;
  id v30 = v33;
  id v31 = v40;
  id v32 = v39;
  dispatch_group_notify(v20, v29, block);

  _Block_object_dispose(v60, 8);
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_4:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_9;
  }
  id v14 = [v5 count];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  BOOL v15 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no motion activity is fetched for rehydration", buf, 2u);
    }
    goto LABEL_4;
  }
  if (v15)
  {
    id v16 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134217984;
    id v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "motion activity update, events, %lu", buf, 0xCu);
  }

  double v17 = *(void **)(a1 + 40);
  id v18 = *(void **)(a1 + 48);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_156;
  v21[3] = &unk_1002CA328;
  id v19 = v17;
  uint64_t v20 = *(void *)(a1 + 56);
  id v22 = v19;
  uint64_t v24 = v20;
  id v23 = *(id *)(a1 + 32);
  [v18 _updateMetadataOfMotionEvents:v19 withMotionActities:v5 handler:v21];

LABEL_9:
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) count];
      int v6 = 134218240;
      id v7 = v5;
      __int16 v8 = 2048;
      id v9 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "motion activity step count update, motion events, %lu, events, %lu", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_157(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%lu walking events rehydrated for %@ to %@", buf, 0x20u);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(*(void *)(v6 + 8) + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_158;
    v10[3] = &unk_1002D1E50;
    uint64_t v12 = v6;
    id v9 = *(void **)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v9 _updateDeviceLocationsForMotionEvents:v7 forLocationSetting:v8 handler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v9 = 134218240;
    id v10 = v8;
    __int16 v11 = 2048;
    id v12 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "motion activity location update, motion events, %lu, updated events, %lu", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateDeviceLocationsForMotionEvents:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5
{
  id v23 = a3;
  id v24 = a5;
  if ([v23 count])
  {
    if (a4)
    {
      uint64_t v7 = objc_opt_new();
      id v8 = dispatch_group_create();
      *(void *)id v39 = 0;
      v40 = v39;
      uint64_t v41 = 0x3032000000;
      uint64_t v42 = __Block_byref_object_copy__38;
      id v43 = __Block_byref_object_dispose__38;
      id v44 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v23;
      id v9 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v36;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v36 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            dispatch_group_enter(v8);
            uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              id v14 = [v12 startDate];
              __int16 v15 = [v12 endDate];
              *(_DWORD *)buf = 138412802;
              id v46 = v12;
              __int16 v47 = 2112;
              id v48 = v14;
              __int16 v49 = 2112;
              BOOL v50 = v15;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "_updateDeviceLocationsForMotionEvents, event, %@, startDate, %@, endDate, %@", buf, 0x20u);
            }
            uint64_t v16 = [(MOMotionManager *)self routineServiceManager];
            __int16 v17 = [v12 startDate];
            uint64_t v18 = [v12 endDate];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke;
            v31[3] = &unk_1002D1EA0;
            v34 = v39;
            v31[4] = v12;
            id v32 = v7;
            id v33 = v8;
            [v16 fetchDeviceLocationsFromStartDate:v17 endDate:v18 handler:v31];
          }
          id v9 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
        }
        while (v9);
      }

      id v19 = [(MOMotionManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke_159;
      block[3] = &unk_1002D1EC8;
      id v28 = v7;
      id v29 = v24;
      id v30 = v39;
      id v20 = v7;
      dispatch_group_notify(v8, v19, block);

      _Block_object_dispose(v39, 8);
    }
    else
    {
      id v22 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "significant location disabled. return input events", v39, 2u);
      }

      (*((void (**)(id, id, void))v24 + 2))(v24, v23, 0);
    }
  }
  else
  {
    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "motionEvents is empty.", v39, 2u);
    }

    (*((void (**)(id, void *, void))v24 + 2))(v24, &__NSArray0__struct, 0);
  }
}

void __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (!v9) {
      objc_storeStrong(v8, a3);
    }
  }
  if ([v5 count])
  {
    uint64_t v10 = [*(id *)(a1 + 32) workoutEvent];
    [v10 setWorkoutLocationRoute:v5];

    __int16 v11 = [v5 firstObject];
    id v12 = [*(id *)(a1 + 32) workoutEvent];
    [v12 setWorkoutLocationStart:v11];

    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138412546;
      uint64_t v16 = v14;
      __int16 v17 = 2048;
      id v18 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "_updateDeviceLocationsForMotionEvents, event, %@, locations, %lu", (uint8_t *)&v15, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke_159(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_updateMetadataOfMotionEvents:(id)a3 withMotionActities:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if (![v9 count])
  {
    long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v36 = "no motion activity is fetched for update motion metadata";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v36, buf, 2u);
    }
LABEL_26:

    v10[2](v10, &__NSArray0__struct, 0);
    goto LABEL_27;
  }
  if (![v8 count])
  {
    long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v36 = "no motion activity is stored for update motion metadata";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  long long v37 = v10;
  uint64_t v41 = objc_opt_new();
  __int16 v11 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v38 = v9;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v53;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v18 = [v17 startDate];
        [v11 setObject:v17 forKey:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v14);
  }

  group = dispatch_group_create();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v39 = v8;
  id v19 = v8;
  id v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v49;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
        long long v25 = [v11 allKeys];
        id v26 = [v24 startDate];
        unsigned int v27 = [v25 containsObject:v26];

        if (v27)
        {
          id v28 = [v24 startDate];
          id v29 = [v11 objectForKey:v28];
          [(MOMotionManager *)self _setMotionTypeAndDurationFor:v24 fromMotionActivity:v29];

          id v30 = [v24 motionActivityEvent];
          LODWORD(v28) = +[MOMotionManager eligibleForBundling:](MOMotionManager, "eligibleForBundling:", [v30 motionType]);

          if (v28)
          {
            dispatch_group_enter(group);
            id v31 = [v24 startDate];
            id v32 = [v24 endDate];
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke;
            v45[3] = &unk_1002D1EF0;
            v45[4] = v24;
            id v46 = v41;
            __int16 v47 = group;
            [(MOMotionManager *)self fetchPedometerDataFor:v31 toEndDate:v32 CompletionHandler:v45];
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v21);
  }

  id v33 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke_2;
  block[3] = &unk_1002CEFD0;
  uint64_t v10 = v37;
  id v43 = v41;
  id v44 = v37;
  id v34 = v41;
  dispatch_group_notify(group, v33, block);

  id v9 = v38;
  id v8 = v39;
LABEL_27:
}

void __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = a2;
    id v5 = [v4 distance];
    id v6 = [*(id *)(a1 + 32) motionActivityEvent];
    [v6 setMotionDistance:v5];

    uint64_t v7 = [v4 numberOfSteps];

    id v8 = [*(id *)(a1 + 32) motionActivityEvent];
    [v8 setMotionStepCount:v7];

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  id v9 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v9);
}

uint64_t __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__MOMotionManager_removeMotionActivityDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __63__MOMotionManager_removeMotionActivityDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeMotionActivityDeletedAtSource:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v41 = a4;
  long long v49 = self;
  id v7 = [(MOMotionManager *)self queue];
  dispatch_assert_queue_V2(v7);

  long long v50 = v6;
  id v8 = [v6 getDurationOfMOEventArray];
  uint64_t v9 = [v8 startDate];
  id v44 = v8;
  uint64_t v10 = [v8 endDate];
  __int16 v11 = +[NSCalendar currentCalendar];
  id v12 = +[NSDate now];
  id v13 = [v12 dateByAddingTimeInterval:-604800.0];
  id v14 = [v11 startOfDayForDate:v13];

  uint64_t v42 = v11;
  uint64_t v15 = [v11 startOfDayForDate:v9];
  id v39 = (void *)v15;
  v40 = v14;
  if ([v14 isAfterDate:v15]) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = (void *)v15;
  }
  id v17 = v16;
  id v18 = objc_opt_new();
  id v45 = (void *)v10;
  id v19 = 0;
  if ([v17 isBeforeDate:v10])
  {
    do
    {
      id v20 = [v17 dateByAddingTimeInterval:86400.0];

      if ([v17 isAfterDate:v9]) {
        id v21 = v17;
      }
      else {
        id v21 = (void *)v9;
      }
      id v22 = v21;
      if ([v20 isBeforeDate:v10]) {
        id v23 = v20;
      }
      else {
        id v23 = (void *)v10;
      }
      id v24 = v23;
      if ([v22 isBeforeDate:v24])
      {
        id v25 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v22 endDate:v24];
        [v18 addObject:v25];

        uint64_t v10 = (uint64_t)v45;
      }
      id v19 = v20;

      id v17 = v19;
    }
    while (([v19 isBeforeDate:v10] & 1) != 0);
  }
  id v43 = (void *)v9;
  id v26 = dispatch_group_create();
  long long v48 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v18;
  id v27 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v47 = *(void *)v62;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        dispatch_group_enter(v26);
        id v32 = [v30 startDate];

        id v33 = [v30 endDate];

        motionActivityManager = v49->_motionActivityManager;
        long long v35 = [(MOMotionManager *)v49 operationQueue];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke;
        v55[3] = &unk_1002D1F18;
        id v17 = v32;
        id v56 = v17;
        id v19 = v33;
        id v57 = v19;
        id v58 = v50;
        id v59 = v48;
        v60 = v26;
        [(CMMotionActivityManager *)motionActivityManager queryActivityWithAttribute:1 fromDate:v17 toDate:v19 toQueue:v35 withHandler:v55];
      }
      id v28 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v28);
  }

  long long v36 = [(MOMotionManager *)v49 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_162;
  block[3] = &unk_1002CAD38;
  id v52 = v48;
  long long v53 = v49;
  id v54 = v41;
  id v37 = v41;
  id v38 = v48;
  dispatch_group_notify(v26, v36, block);
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v6;
      id v8 = "no motion activity is fetched for purge with error, %@";
      uint64_t v9 = v7;
      uint32_t v10 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    if (![v5 count])
    {
      id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      id v27 = *(void **)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = v28;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      id v8 = "motion event fetch result for removeMotionActivityDeletedAtSource is nil, start date, %@, end date, %@, error, %@";
      uint64_t v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_4;
    }
    id v29 = 0;
    id v7 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v17 = [v16 startDate:v29];
          [v7 setObject:v16 forKey:v17];
        }
        id v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = *(id *)(a1 + 48);
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          id v24 = [v7 allKeys];
          id v25 = [v23 startDate];
          unsigned __int8 v26 = [v24 containsObject:v25];

          if ((v26 & 1) == 0) {
            [*(id *)(a1 + 56) addObject:v23];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    id v6 = v29;
    id v5 = v30;
  }
LABEL_25:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_162(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "rehydration failed motion event count, %lu", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) eventStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_163;
  v7[3] = &unk_1002CACE8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  [v4 removeEvents:v5 CompletionHandler:v7];
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2;
  block[3] = &unk_1002CB8C0;
  id v12 = v5;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MOMotionManager_fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __88__MOMotionManager_fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMotionActivityBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v46 = a3;
  id v47 = a4;
  id v42 = a5;
  id v38 = a6;
  long long v51 = self;
  id v10 = [(MOMotionManager *)self queue];
  dispatch_assert_queue_V2(v10);

  __int16 v45 = +[NSCalendar currentCalendar];
  id v11 = +[NSDate now];
  id v12 = [v11 dateByAddingTimeInterval:-604800.0];
  uint64_t v44 = [v45 startOfDayForDate:v12];

  __int16 v43 = [v45 startOfDayForDate:v46];
  if ([v44 isAfterDate:v43]) {
    id v13 = v44;
  }
  else {
    id v13 = v43;
  }
  id v14 = v13;
  id v15 = objc_opt_new();
  id v16 = 0;
  if ([v14 isBeforeDate:v47])
  {
    do
    {
      id v17 = [v14 dateByAddingTimeInterval:86400.0];

      if ([v14 isAfterDate:v46]) {
        id v18 = v14;
      }
      else {
        id v18 = v46;
      }
      id v19 = v18;
      if ([v17 isBeforeDate:v47]) {
        id v20 = v17;
      }
      else {
        id v20 = v47;
      }
      id v21 = v20;
      if ([v19 isBeforeDate:v21])
      {
        id v22 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v19 endDate:v21];
        [v15 addObject:v22];
      }
      id v16 = v17;

      id v14 = v16;
    }
    while (([v16 isBeforeDate:v47] & 1) != 0);
  }
  id v41 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 16];
  v40 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 7];
  v85[0] = v41;
  v85[1] = v40;
  id v23 = +[NSArray arrayWithObjects:v85 count:2];
  id v39 = +[NSCompoundPredicate andPredicateWithSubpredicates:v23];

  long long v50 = [v42 filteredArrayUsingPredicate:v39];
  group = dispatch_group_create();
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__38;
  v78[4] = __Block_byref_object_dispose__38;
  id v79 = (id)objc_opt_new();
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__38;
  v76[4] = __Block_byref_object_dispose__38;
  id v77 = (id)objc_opt_new();
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__38;
  v74[4] = __Block_byref_object_dispose__38;
  id v75 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v15;
  id v24 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v24)
  {
    uint64_t v49 = *(void *)v71;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v71 != v49) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        dispatch_group_enter(group);
        uint64_t v28 = [v26 startDate];

        id v29 = [v26 endDate];

        id v30 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v81 = v28;
          __int16 v82 = 2112;
          v83 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "start fetching motion activity from start date, %@, end date, %@", buf, 0x16u);
        }

        motionActivityManager = v51->_motionActivityManager;
        long long v32 = [(MOMotionManager *)v51 operationQueue];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
        v61[3] = &unk_1002D1F68;
        id v14 = v28;
        id v62 = v14;
        id v16 = v29;
        id v63 = v16;
        v67 = v74;
        id v64 = v50;
        v65 = group;
        v66 = v51;
        v68 = v76;
        v69 = v78;
        [(CMMotionActivityManager *)motionActivityManager queryActivityWithAttribute:1 fromDate:v14 toDate:v16 toQueue:v32 withHandler:v61];
      }
      id v24 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v24);
  }

  long long v33 = [(MOMotionManager *)v51 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_179;
  block[3] = &unk_1002D1F90;
  id v58 = v78;
  id v59 = v76;
  id v54 = v50;
  id v55 = v46;
  v60 = v74;
  id v56 = v47;
  id v57 = v38;
  id v34 = v38;
  id v35 = v47;
  id v36 = v46;
  id v37 = v50;
  dispatch_group_notify(group, v33, block);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    __int16 v34 = 2048;
    id v35 = [v5 count];
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching motion activity result from start date, %@, end date, %@, number of activities, %ld, error, %@", buf, 0x2Au);
  }

  if (v6)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    if ([v6 code] == (id)104 || objc_msgSend(v6, "code") == (id)109) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    }
    id v17 = [MORehydrationMetrics alloc];
    id v18 = [v6 description];
    id v19 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v17, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 16, 7, 0, v18, [*(id *)(a1 + 48) count], 3, (double)(int)objc_msgSend(*(id *)(a1 + 48), "count"), 0.0);

    id v29 = 0;
    [(MORehydrationMetrics *)v19 submitMetricsWithError:&v29];
    id v20 = v29;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    id v21 = *(void **)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 48);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_177;
    v23[3] = &unk_1002D1F40;
    long long v27 = *(_OWORD *)(a1 + 72);
    uint64_t v28 = *(void *)(a1 + 88);
    id v24 = (MORehydrationMetrics *)*(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 56);
    [v21 _rehydrateEvents:v22 andCreateNewEventsfromMotionActivity:v5 handler:v23];

    id v19 = v24;
  }
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_177(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void *)(v10 + 40);
    uint64_t v11 = (id *)(v10 + 40);
    if (!v12) {
      objc_storeStrong(v11, a4);
    }
  }
  if ([v8 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v8];
  }
  if ([v7 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObjectsFromArray:v7];
  }
  uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138413058;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    id v21 = [v8 count];
    __int16 v22 = 2048;
    id v23 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Fetching motion activity result from start date, %@, end date, %@, new events count, %ld, rehydrated events count, %ld", (uint8_t *)&v16, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_179(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) count];
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    id v38 = v4;
    __int16 v39 = 2048;
    id v40 = v5;
    __int16 v41 = 2048;
    id v42 = v6;
    __int16 v43 = 2112;
    uint64_t v44 = v7;
    __int16 v45 = 2112;
    uint64_t v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%lu stored walking events, %lu walking events rehydrated, %lu new walking events fetched for %@ to %@", buf, 0x34u);
  }

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v9) {
    [v2 setObject:v9 forKey:@"newEvents"];
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v10)
  {
    [v2 setObject:v10 forKey:@"rehydratedEvents"];
    uint64_t v11 = [[MORehydrationMetrics alloc] initWithCategory:16 provider:7 spiSuccess:1 spiError:0 failCount:[*(id *)(a1 + 32) count] successAfterPreFailCount:[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] totalCount:[*(id *)(a1 + 32) count] - [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] rehydrationTrigger:0.0];
    uint64_t v34 = 0;
    [(MORehydrationMetrics *)v11 submitMetricsWithError:&v34];
  }
  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v12) {
    goto LABEL_15;
  }
  uint64_t v13 = [v12 domain];

  if (v13 == @"MOErrorDomain")
  {
    id v26 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_179_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    id v25 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_19;
  }
  uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v14
    || [v14 code] != (id)104
    && [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) code] != (id)109)
  {
LABEL_15:
    id v25 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_19:
    v25();
    goto LABEL_20;
  }
  uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_179_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
  CFStringRef v36 = @"Provider database is unavailable";
  id v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  id v24 = +[NSError errorWithDomain:@"MOErrorDomain" code:1280 userInfo:v23];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_20:
}

- (void)_rehydrateEvents:(id)a3 andCreateNewEventsfromMotionActivity:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = [v7 count];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "stored events count, %ld, motion activity count, %ld", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v58 = __Block_byref_object_copy__38;
  id v59 = __Block_byref_object_dispose__38;
  id v60 = 0;
  uint64_t v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__38;
  v53[4] = __Block_byref_object_dispose__38;
  id v54 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke;
  v49[3] = &unk_1002CA350;
  id v52 = v53;
  id v50 = v7;
  uint64_t v11 = v10;
  long long v51 = v11;
  id v30 = v50;
  [(MOMotionManager *)self _updateMetadataOfMotionEvents:v50 withMotionActities:v8 handler:v49];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__38;
  v47[4] = __Block_byref_object_dispose__38;
  id v48 = 0;
  id v27 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  group = v11;
  id v56 = v27;
  uint64_t v12 = +[NSArray arrayWithObjects:&v56 count:1];
  uint64_t v13 = [v30 sortedArrayUsingDescriptors:v12];

  uint64_t v14 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v17);
        if (![v13 count]) {
          goto LABEL_10;
        }
        uint64_t v19 = [v18 startDate];
        uint64_t v20 = [v13 lastObject];
        uint64_t v21 = [v20 endDate];
        unsigned int v22 = [v19 isAfterDate:v21];

        if (v22) {
LABEL_10:
        }
          [v14 addObject:v18];
        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v15);
  }

  dispatch_group_enter(group);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_189;
  v38[3] = &unk_1002CE2F8;
  __int16 v41 = buf;
  id v42 = v47;
  id v23 = v14;
  id v39 = v23;
  id v24 = group;
  id v40 = v24;
  [(MOMotionManager *)self _createNewEventsFromActivities:v23 handler:v38];
  id v25 = [(MOMotionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_190;
  block[3] = &unk_1002D1FE0;
  NSErrorUserInfoKey v35 = v53;
  CFStringRef v36 = buf;
  void block[4] = self;
  id v34 = v29;
  id v37 = v47;
  id v26 = v29;
  dispatch_group_notify(v24, v25, block);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(buf, 8);
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) count];
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    int v8 = 134218240;
    id v9 = v6;
    __int16 v10 = 2048;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "stored events count, %ld, rehydrated count, %ld", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  int v8 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    int v11 = 134218240;
    id v12 = v9;
    __int16 v13 = 2048;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "activity events to save count, %ld, new events count, %ld", (uint8_t *)&v11, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_190(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) isAllowedToProcessEventCategory:1];
  v8[0] = _NSConcreteStackBlock;
  long long v3 = *(_OWORD *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v8[1] = 3221225472;
  v8[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_2;
  v8[3] = &unk_1002D1FB8;
  long long v10 = v3;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v9 = v6;
  uint64_t v11 = v7;
  [v5 _updateDeviceLocationsForMotionEvents:v4 forLocationSetting:v2 handler:v8];
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
    int v12 = 134218240;
    id v13 = v8;
    __int16 v14 = 2048;
    id v15 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "motion activity location update, rehydrated events, %lu, updated events, %lu", (uint8_t *)&v12, 0x16u);
  }

  if (v6)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    long long v10 = (id *)(v9 + 40);
    if (!v11) {
      objc_storeStrong(v10, a3);
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_createNewEventsFromActivities:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v52 = v7;
    id v8 = objc_opt_new();
    uint64_t v9 = +[NSPredicate predicateWithFormat:@"walking==YES"];
    +[NSPredicate predicateWithFormat:@"running==NO"];
    v65 = id v64 = v9;
    id v54 = (void *)v65;
    long long v10 = +[NSArray arrayWithObjects:&v64 count:2];
    uint64_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

    long long v53 = (void *)v11;
    uint64_t v12 = [v6 filteredArrayUsingPredicate:v11];
    id v13 = [(MOMotionManager *)self configurationManager];
    LODWORD(v14) = 1142292480;
    [v13 getFloatSettingForKey:@"MOMotionWalkingMinimumEventSize" withFallback:v14];
    long long v51 = (void *)v12;
    uint64_t v16 = [(MOMotionManager *)self createEventsFromActivities:v12 withMininumEventSize:v15];

    id v55 = (void *)v16;
    [v8 addObjectsFromArray:v16];
    uint64_t v17 = +[NSPredicate predicateWithFormat:@"running==YES"];
    +[NSPredicate predicateWithFormat:@"walking==NO"];
    v63 = uint64_t v62 = v17;
    uint64_t v49 = (void *)v63;
    uint64_t v18 = +[NSArray arrayWithObjects:&v62 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

    id v48 = (void *)v19;
    uint64_t v20 = [v6 filteredArrayUsingPredicate:v19];
    uint64_t v21 = [(MOMotionManager *)self configurationManager];
    LODWORD(v22) = 1133903872;
    [v21 getFloatSettingForKey:@"MOMotionRunningMinimumEventSize" withFallback:v22];
    id v24 = [(MOMotionManager *)self createEventsFromActivities:v20 withMininumEventSize:v23];

    [v8 addObjectsFromArray:v24];
    id v50 = (void *)v17;
    v61[0] = v17;
    v61[1] = v9;
    id v25 = +[NSArray arrayWithObjects:v61 count:2];
    uint64_t v26 = +[NSCompoundPredicate andPredicateWithSubpredicates:v25];

    id v47 = (void *)v26;
    id v27 = [v6 filteredArrayUsingPredicate:v26];
    uint64_t v28 = [(MOMotionManager *)self configurationManager];
    LODWORD(v29) = 1142292480;
    [v28 getFloatSettingForKey:@"MOMotionMixedRunWalkMinimumEventSize" withFallback:v29];
    uint64_t v31 = [(MOMotionManager *)self createEventsFromActivities:v27 withMininumEventSize:v30];

    [v8 addObjectsFromArray:v31];
    uint64_t v32 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v60 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Fetched %lu motion classifications", buf, 0xCu);
    }

    uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = [v51 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Fetched %lu walking classifications", buf, 0xCu);
    }

    NSErrorUserInfoKey v35 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    id v7 = v52;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = [v20 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Fetched %lu running classifications", buf, 0xCu);
    }

    id v37 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = [v27 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Fetched %lu mixed running & walking classifications", buf, 0xCu);
    }

    id v39 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = [v55 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%lu walking classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    __int16 v41 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      id v42 = [v24 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%lu running classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    long long v43 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = [v31 count];
      *(_DWORD *)buf = 134217984;
      id v60 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%lu mixed running & walking classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    unsigned __int8 v45 = [(MOConfigurationManager *)self->_configurationManager isAllowedToProcessEventCategory:1];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke;
    v56[3] = &unk_1002D2008;
    v56[4] = self;
    unsigned __int8 v58 = v45;
    id v57 = v52;
    [(MOMotionManager *)self _updateMetadataOfMotionEvents:v8 withMotionActities:v6 handler:v56];
  }
  else
  {
    long long v46 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "no new motion activity is fetched for creating events", buf, 2u);
    }

    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
}

void __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke_2;
  v5[3] = &unk_1002CA140;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 _updateDeviceLocationsForMotionEvents:a2 forLocationSetting:v3 handler:v5];
}

uint64_t __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (CMPedometer)pedometer
{
  return self->_pedometer;
}

- (void)setPedometer:(id)a3
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

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_pedometer, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Last motion acvitiy is after the fetch window, last event, %@, end date, %@", (uint8_t *)&v5, 0x16u);
}

void __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_179_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end