@interface MOEventStore
- (BOOL)_persistEWAMetricsPrivate:(id)a3 withData:(id)a4;
- (BOOL)_removeEntriesInPlist:(id)a3 forCategory:(id)a4 forURL:(id)a5;
- (BOOL)_shouldEventBeDeleted:(id)a3 patternDict:(id)a4 forkey:(id)a5;
- (BOOL)persistEWAMetrics:(id)a3 withData:(id)a4;
- (HKHealthStore)healthStore;
- (MOConfigurationManager)configurationManager;
- (MOEventPatternManager)patternManager;
- (MOEventStore)initWithUniverse:(id)a3;
- (MOPersistenceManager)persistenceManager;
- (OS_dispatch_queue)queue;
- (id)_readEWAPlistFilePrivate:(id)a3;
- (id)getEWAPlistFileURL;
- (id)readEWAPlistFile:(id)a3;
- (void)_checkWorkoutExistsInHealthDB:(id)a3 handler:(id)a4;
- (void)_deleteEWAForExpiredEvents:(id)a3;
- (void)_deleteEWAOnRehydrationFailure:(id)a3;
- (void)_deletePatternEvents:(id)a3 forContext:(id)a4 handler:(id)a5;
- (void)_deleteSensedEvents:(id)a3 forContext:(id)a4 handler:(id)a5;
- (void)_deleteStaleEWAEvents;
- (void)fetchAllEventsWithCompletionHandler:(id)a3;
- (void)fetchAnalyticsEventsWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)fetchEventsWithStartDateAfter:(id)a3 Category:(unint64_t)a4 CompletionHandler:(id)a5;
- (void)fetchLastEventOfCategories:(id)a3 CompletionHandler:(id)a4;
- (void)fetchLastEventOfCategories:(id)a3 isHighConfidenceOnly:(BOOL)a4 CompletionHandler:(id)a5;
- (void)fetchLastEventOfCategory:(unint64_t)a3 CompletionHandler:(id)a4;
- (void)getEWAPlistFileURL;
- (void)purgeExpiredEventsWithCompletionHandler:(id)a3;
- (void)purgeRehydrationFailedEventsForType:(id)a3 rehydrationFailCount:(int)a4 CompletionHandler:(id)a5;
- (void)purgeUnknownEventsWithCompletionHandler:(id)a3;
- (void)purgeVisitEventsBeforeDate:(id)a3 WithCompletionHandler:(id)a4;
- (void)removeAllEventsWithCompletionHandler:(id)a3;
- (void)removeEvents:(id)a3 CompletionHandler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setPatternManager:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeEvent:(id)a3 CompletionHandler:(id)a4;
- (void)storeEvents:(id)a3 CompletionHandler:(id)a4;
@end

@implementation MOEventStore

- (MOEventStore)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v5 getService:v10];

  id v12 = objc_alloc_init((Class)HKHealthStore);
  if (!v8)
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v19 = +[NSAssertionHandler currentHandler];
    v20 = v19;
    CFStringRef v21 = @"Invalid parameter not satisfying: persistenceManager";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 38;
    goto LABEL_12;
  }
  if (!v11)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v19 = +[NSAssertionHandler currentHandler];
    v20 = v19;
    CFStringRef v21 = @"Invalid parameter not satisfying: configurationManager";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 39;
LABEL_12:
    [v19 handleFailureInMethod:v22 object:v23 file:@"MOEventStore.m" lineNumber:v24 description:v21];

    v17 = 0;
    goto LABEL_13;
  }
  v27.receiver = self;
  v27.super_class = (Class)MOEventStore;
  v13 = [(MOEventStore *)&v27 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MOEventStore", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_persistenceManager, v8);
    objc_storeStrong((id *)&v13->_configurationManager, v11);
    objc_storeStrong((id *)&v13->_healthStore, v12);
  }
  self = v13;
  v17 = self;
LABEL_13:

  return v17;
}

- (void)storeEvent:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MOEventStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __45__MOEventStore_storeEvent_CompletionHandler___block_invoke;
  v11[3] = &unk_1002CB568;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

void __45__MOEventStore_storeEvent_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = +[MOEventMO managedObjectWithEvent:v4 inManagedObjectContext:v3];
    id v13 = 0;
    unsigned __int8 v6 = [v3 save:&v13];
    id v7 = (void (**)(id, void, void *))v13;
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saving event succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __45__MOEventStore_storeEvent_CompletionHandler___block_invoke_cold_1();
    }

    [v3 reset];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      CFStringRef v15 = @"resultNumberOfEvents";
      v16 = &off_1002F4DC0;
      v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v7, v11);
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "no event to be saved", buf, 2u);
    }

    id v7 = *(void (***)(id, void, void *))(a1 + 40);
    if (v7)
    {
      CFStringRef v17 = @"resultNumberOfEvents";
      v18 = &off_1002F4DA8;
      v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v7[2](v7, 0, v11);
      id v7 = 0;
LABEL_13:
    }
  }
}

- (void)storeEvents:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MOEventStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __46__MOEventStore_storeEvents_CompletionHandler___block_invoke;
  v11[3] = &unk_1002CB568;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

void __46__MOEventStore_storeEvents_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v30 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v28 = a1;
    id obj = *(id *)(a1 + 32);
    id v3 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v34;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v34 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v6);
          v8 = +[MOEventMO fetchRequest];
          id v9 = [v7 eventIdentifier];
          id v10 = +[NSPredicate predicateWithFormat:@"eventIdentifier == %@", v9];
          [v8 setPredicate:v10];

          id v32 = 0;
          v11 = [v30 executeFetchRequest:v8 error:&v32];
          id v12 = v32;
          if (!v12
            && [v11 count]
            && ([v11 lastObject], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = (void *)v15;
            CFStringRef v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v7;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "update event, %@", buf, 0xCu);
            }

            +[MOEventMO setPropertiesOfEventMO:v16 withEvent:v7];
          }
          else
          {
            id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v7;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "save event, %@", buf, 0xCu);
            }

            id v14 = +[MOEventMO managedObjectWithEvent:v7 inManagedObjectContext:v30];
          }

          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v18 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        id v4 = v18;
      }
      while (v18);
    }

    id v31 = 0;
    unsigned __int8 v19 = [v30 save:&v31];
    id v20 = v31;
    CFStringRef v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    SEL v22 = v21;
    if (v19)
    {
      a1 = v28;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v23 = [*(id *)(v28 + 32) count];
        *(_DWORD *)buf = 134217984;
        id v40 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "saving events succeeded, event count, %lu", buf, 0xCu);
      }
    }
    else
    {
      a1 = v28;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __46__MOEventStore_storeEvents_CompletionHandler___block_invoke_cold_1();
      }
    }

    [v30 reset];
  }
  else
  {
    uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "no events to be saved", buf, 2u);
    }

    id v20 = 0;
  }
  uint64_t v25 = *(void *)(a1 + 40);
  if (v25)
  {
    CFStringRef v37 = @"resultNumberOfEvents";
    v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) count]);
    v38 = v26;
    objc_super v27 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    (*(void (**)(uint64_t, id, void *))(v25 + 16))(v25, v20, v27);
  }
}

- (void)removeEvents:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = [(MOEventStore *)self persistenceManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __47__MOEventStore_removeEvents_CompletionHandler___block_invoke;
    v11[3] = &unk_1002CB590;
    id v12 = v7;
    SEL v14 = a2;
    id v13 = v8;
    [v9 performBlockAndWait:v11];

    id v10 = v12;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    CFStringRef v15 = @"resultNumberOfEvents";
    v16 = &off_1002F4DA8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
    goto LABEL_5;
  }
LABEL_6:
}

void __47__MOEventStore_removeEvents_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v52 objects:v67 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v52 + 1) + 8 * i) eventIdentifier];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v52 objects:v67 count:16];
    }
    while (v7);
  }

  v11 = +[MOEventMO fetchRequest];
  v45 = v4;
  id v12 = +[NSPredicate predicateWithFormat:@"eventIdentifier IN %@", v4];
  [v11 setPredicate:v12];

  [v11 setReturnsObjectsAsFaults:0];
  id v51 = 0;
  id v13 = [v3 executeFetchRequest:v11 error:&v51];
  id v14 = v51;
  CFStringRef v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v40 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v41 = [v13 count];
    *(_DWORD *)buf = 138413058;
    id v60 = v40;
    __int16 v61 = 2112;
    v62 = v11;
    __int16 v63 = 2048;
    id v64 = v41;
    __int16 v65 = 2112;
    id v66 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v14)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v14, &__NSDictionary0__struct);
    }
    [v3 reset];
  }
  else
  {
    if ([v13 count])
    {
      v42 = v13;
      v43 = v11;
      uint64_t v44 = a1;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v17 = v13;
      id v18 = [v17 countByEnumeratingWithState:&v47 objects:v58 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v48;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v17);
            }
            SEL v22 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
            [v3 deleteObject:v22];
            id v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              [v22 eventIdentifier];
              v25 = uint64_t v24 = v20;
              [v22 provider];
              objc_super v27 = v26 = v17;
              [v22 category];
              v29 = id v28 = v3;
              id v30 = [v22 startDate];
              *(_DWORD *)buf = 138413058;
              id v60 = v25;
              __int16 v61 = 2112;
              v62 = v27;
              __int16 v63 = 2112;
              id v64 = v29;
              __int16 v65 = 2112;
              id v66 = v30;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "trying to remove event, id, %@, provider, %@, category, %@, startDate, %@", buf, 0x2Au);

              id v3 = v28;
              id v17 = v26;

              uint64_t v20 = v24;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v47 objects:v58 count:16];
        }
        while (v19);
      }

      id v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v32 = [v17 count];
        *(_DWORD *)buf = 134217984;
        id v60 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "trying to remove events count %lu", buf, 0xCu);
      }

      id v46 = 0;
      unsigned __int8 v33 = [v3 save:&v46];
      id v34 = v46;
      long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      long long v36 = v35;
      a1 = v44;
      id v14 = 0;
      if (v33)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "saving event deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1();
      }

      id v13 = v42;
      v11 = v43;
    }
    else
    {
      id v34 = 0;
    }
    [v3 reset];
    uint64_t v37 = *(void *)(a1 + 40);
    if (v37)
    {
      CFStringRef v56 = @"resultNumberOfEvents";
      v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 count]);
      v57 = v38;
      v39 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      (*(void (**)(uint64_t, id, void *))(v37 + 16))(v37, v34, v39);
    }
  }
}

- (void)removeAllEventsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(MOEventStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__MOEventStore_removeAllEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002CB5B8;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [v6 performBlockAndWait:v8];
}

void __53__MOEventStore_removeAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v28 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v28];
  id v6 = v28;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v21 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v22 = [v5 count];
    *(_DWORD *)buf = 138413058;
    id v31 = v21;
    __int16 v32 = 2112;
    unsigned __int8 v33 = v4;
    __int16 v34 = 2048;
    id v35 = v22;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
    [v3 reset];
  }
  else
  {
    if ([v5 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          id v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            [v3 deleteObject:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v11);
      }

      id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v9 count];
        *(_DWORD *)buf = 134217984;
        id v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "trying to remove events count %lu", buf, 0xCu);
      }

      id v23 = 0;
      unsigned __int8 v16 = [v3 save:&v23];
      id v17 = v23;
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      id v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "saving event deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      id v17 = 0;
    }
    [v3 reset];
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      (*(void (**)(uint64_t, id))(v20 + 16))(v20, v17);
    }
  }
}

- (void)purgeExpiredEventsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(MOEventStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002CB590;
  id v9 = v5;
  SEL v10 = a2;
  void v8[4] = self;
  id v7 = v5;
  [v6 performBlockAndWait:v8];
}

void __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  id v5 = [*(id *)(a1 + 32) configurationManager];
  [v5 getDoubleSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:2419200.0];
  double v7 = v6;

  uint64_t v8 = +[NSDate date];
  id v9 = +[NSDate dateWithTimeInterval:v8 sinceDate:-v7];

  SEL v10 = +[NSDate date];
  id v11 = +[NSPredicate predicateWithFormat:@"expirationDate < %@ || endDate < %@", v10, v9];
  [v4 setPredicate:v11];

  [v4 setReturnsObjectsAsFaults:0];
  id v37 = 0;
  uint64_t v12 = [v3 executeFetchRequest:v4 error:&v37];
  id v13 = v37;
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v30 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v31 = [v12 count];
    *(_DWORD *)buf = 138413058;
    id v42 = v30;
    __int16 v43 = 2112;
    uint64_t v44 = v4;
    __int16 v45 = 2048;
    id v46 = v31;
    __int16 v47 = 2112;
    id v48 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  [*(id *)(a1 + 32) _deleteStaleEWAEvents];
  if (v13)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, id, void *))(v15 + 16))(v15, v13, &__NSDictionary0__struct);
    }
    [v3 reset];
  }
  else
  {
    if ([v12 count])
    {
      [*(id *)(a1 + 32) _deleteEWAForExpiredEvents:v12];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v16 = v12;
      id v17 = [v16 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            [v3 deleteObject:*(void *)(*((void *)&v33 + 1) + 8 * (void)v20)];
            uint64_t v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v18);
      }

      CFStringRef v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [v16 count];
        *(_DWORD *)buf = 134217984;
        id v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "trying to purge events count %lu", buf, 0xCu);
      }

      id v32 = 0;
      unsigned __int8 v23 = [v3 save:&v32];
      id v24 = v32;
      long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      long long v26 = v25;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "saving event purge operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      id v24 = 0;
    }
    [v3 reset];
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27)
    {
      CFStringRef v38 = @"resultNumberOfEvents";
      id v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 count]);
      v39 = v28;
      v29 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      (*(void (**)(uint64_t, id, void *))(v27 + 16))(v27, v24, v29);
    }
  }
}

- (void)purgeUnknownEventsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  double v6 = [(MOEventStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MOEventStore_purgeUnknownEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002CB5B8;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [v6 performBlockAndWait:v8];
}

void __56__MOEventStore_purgeUnknownEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"category == 0"];
  v46[0] = v5;
  double v6 = +[NSPredicate predicateWithFormat:@"provider == 0"];
  v46[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v46 count:2];
  uint64_t v8 = +[NSCompoundPredicate orPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  [v4 setReturnsObjectsAsFaults:0];
  id v34 = 0;
  id v9 = [v3 executeFetchRequest:v4 error:&v34];
  id v10 = v34;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v28 = [v9 count];
    *(_DWORD *)buf = 138413058;
    id v39 = v27;
    __int16 v40 = 2112;
    id v41 = v4;
    __int16 v42 = 2048;
    id v43 = v28;
    __int16 v44 = 2112;
    id v45 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v10, &__NSDictionary0__struct);
    }
    [v3 reset];
  }
  else
  {
    if ([v9 count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v9;
      id v14 = [v13 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            [v3 deleteObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)v17)];
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v15);
      }

      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [v13 count];
        *(_DWORD *)buf = 134217984;
        id v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "trying to purge unknown events count %lu", buf, 0xCu);
      }

      id v29 = 0;
      unsigned __int8 v20 = [v3 save:&v29];
      id v21 = v29;
      id v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      unsigned __int8 v23 = v22;
      if (v20)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "saving event purge operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      id v21 = 0;
    }
    [v3 reset];
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      CFStringRef v35 = @"resultNumberOfEvents";
      long long v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
      long long v36 = v25;
      long long v26 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      (*(void (**)(uint64_t, id, void *))(v24 + 16))(v24, v21, v26);
    }
  }
}

- (void)purgeRehydrationFailedEventsForType:(id)a3 rehydrationFailCount:(int)a4 CompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (a4 > 0)
  {
    id v11 = [(MOEventStore *)self persistenceManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke;
    v14[3] = &unk_1002CB608;
    int v19 = a4;
    SEL v18 = a2;
    id v15 = v9;
    uint64_t v16 = self;
    id v17 = v10;
    [v11 performBlockAndWait:v14];

    uint64_t v12 = v15;
LABEL_7:

    goto LABEL_8;
  }
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:](a4, v13);
  }

  if (v10)
  {
    CFStringRef v20 = @"resultNumberOfEvents";
    id v21 = &off_1002F4DA8;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"rehydrationFailCount >= %d", *(unsigned int *)(a1 + 64)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v28 = 0;
  double v6 = [v3 executeFetchRequest:v4 error:&v28];
  id v7 = v28;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v14 = (uint64_t (*)(uint64_t, uint64_t))[v6 count];
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2048;
    long long v32 = v14;
    *(_WORD *)long long v33 = 2112;
    *(void *)&v33[2] = v7;
    *(_WORD *)&v33[10] = 2112;
    *(void *)&v33[12] = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@ for %@", buf, 0x34u);
  }
  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v7, &__NSDictionary0__struct);
    }
LABEL_6:
    [v3 reset];
    goto LABEL_21;
  }
  if (![v6 count])
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, &__NSDictionary0__struct);
    }
    goto LABEL_6;
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v32 = __Block_byref_object_copy__11;
  *(void *)long long v33 = __Block_byref_object_dispose__11;
  *(void *)&v33[8] = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  if ([*(id *)(a1 + 32) isEqualToString:@"Sensed_event"])
  {
    id v10 = *(void **)(a1 + 40);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_137;
    v23[3] = &unk_1002CB5E0;
    v23[4] = buf;
    v23[5] = &v24;
    [v10 _deleteSensedEvents:v6 forContext:v3 handler:v23];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Pattern_event"])
  {
    [*(id *)(a1 + 40) _deleteEWAOnRehydrationFailure:v6];
    uint64_t v12 = *(void **)(a1 + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_2;
    v22[3] = &unk_1002CB5E0;
    v22[4] = buf;
    v22[5] = &v24;
    [v12 _deletePatternEvents:v6 forContext:v3 handler:v22];
  }
  else
  {
    uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_cold_1(v16);
    }

    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MOEventStore.m", 387, @"purgeRehydrationFailedEventsForType, Unrecognized event type for event purge (in %s:%d)", "-[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:]_block_invoke", 387 object file lineNumber description];
  }
  [v3 reset];
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18)
  {
    uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
    CFStringRef v29 = @"resultNumberOfEvents";
    CFStringRef v20 = +[NSNumber numberWithUnsignedInteger:v25[3]];
    long long v30 = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, v19, v21);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

LABEL_21:
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_137(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (void)_deleteSensedEvents:(id)a3 forContext:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, id, id))a5;
  if (![v7 count])
  {
    id v18 = 0;
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        [v8 deleteObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)v14)];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }

  uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purgeRehydrationFailedEventsWithCompletionHandler, trying to purge events of rehydration failed more than threshold, events count %lu", buf, 0xCu);
  }

  id v21 = 0;
  unsigned __int8 v17 = [v8 save:&v21];
  id v18 = v21;
  uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  CFStringRef v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "purgeRehydrationFailedEventsWithCompletionHandler, saving event purge operation succeeded", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    -[MOEventStore _deleteSensedEvents:forContext:handler:]();
  }

  if (v9) {
LABEL_19:
  }
    v9[2](v9, v18, [v7 count]);
LABEL_20:
}

- (void)_deletePatternEvents:(id)a3 forContext:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  if ([v8 count])
  {
    id v11 = +[MOEventMO fetchRequest];
    id v12 = +[NSPredicate predicateWithFormat:@"provider == %d", 5];
    [v11 setPredicate:v12];

    [v11 setReturnsObjectsAsFaults:0];
    id v70 = 0;
    __int16 v44 = [v9 executeFetchRequest:v11 error:&v70];
    id v13 = v70;
    if (v13)
    {
      v10[2](v10, v13, 0);
      id v14 = 0;
    }
    else
    {
      CFStringRef v38 = v11;
      id v39 = (void (**)(void, id, id))v10;
      __int16 v40 = v9;
      long long v52 = objc_opt_new();
      v77[0] = @"kEventPatternAnomalousEventIdentifier";
      v77[1] = @"kEventPatternTrendEventIdentifierList";
      v77[2] = @"kEventPatternRoutineEventIdentifierList";
      id v48 = +[NSArray arrayWithObjects:v77 count:3];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v41 = v8;
      id obj = v8;
      id v45 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v45)
      {
        uint64_t v43 = *(void *)v67;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v67 != v43) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = v16;
            unsigned __int8 v17 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v47 = v44;
            id v50 = [v47 countByEnumeratingWithState:&v62 objects:v75 count:16];
            if (v50)
            {
              uint64_t v49 = *(void *)v63;
              do
              {
                uint64_t v18 = 0;
                do
                {
                  if (*(void *)v63 != v49) {
                    objc_enumerationMutation(v47);
                  }
                  uint64_t v51 = v18;
                  uint64_t v19 = *(void **)(*((void *)&v62 + 1) + 8 * v18);
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  id v20 = v48;
                  id v21 = [v20 countByEnumeratingWithState:&v58 objects:v74 count:16];
                  if (v21)
                  {
                    id v22 = v21;
                    uint64_t v23 = *(void *)v59;
                    do
                    {
                      for (i = 0; i != v22; i = (char *)i + 1)
                      {
                        if (*(void *)v59 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        uint64_t v25 = *(void *)(*((void *)&v58 + 1) + 8 * i);
                        uint64_t v26 = [v17 eventIdentifier];
                        id v27 = [v19 patterns];
                        LODWORD(v25) = [(MOEventStore *)self _shouldEventBeDeleted:v26 patternDict:v27 forkey:v25];

                        if (v25) {
                          [v52 addObject:v19];
                        }
                      }
                      id v22 = [v20 countByEnumeratingWithState:&v58 objects:v74 count:16];
                    }
                    while (v22);
                  }

                  uint64_t v18 = v51 + 1;
                }
                while ((id)(v51 + 1) != v50);
                id v50 = [v47 countByEnumeratingWithState:&v62 objects:v75 count:16];
              }
              while (v50);
            }

            uint64_t v16 = v46 + 1;
          }
          while ((id)(v46 + 1) != v45);
          id v45 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
        }
        while (v45);
      }

      if ([v52 count])
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v28 = v52;
        id v29 = [v28 countByEnumeratingWithState:&v54 objects:v73 count:16];
        id v9 = v40;
        id v8 = v41;
        id v11 = v38;
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v55;
          do
          {
            for (j = 0; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v55 != v31) {
                objc_enumerationMutation(v28);
              }
              [v40 deleteObject:*(void *)(*((void *)&v54 + 1) + 8 * (void)j)];
            }
            id v30 = [v28 countByEnumeratingWithState:&v54 objects:v73 count:16];
          }
          while (v30);
        }

        id v53 = 0;
        unsigned __int8 v33 = [v40 save:&v53];
        id v14 = v53;
        id v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        CFStringRef v35 = v34;
        if (v33)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            id v36 = [v28 count];
            *(_DWORD *)buf = 134217984;
            id v72 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Pattern event deletion succeeded, deleted %lu", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          -[MOEventStore _deletePatternEvents:forContext:handler:]((uint64_t)v14, v28, v35);
        }

        id v10 = (void (**)(id, id, void))v39;
        v39[2](v39, v14, [v28 count]);
      }
      else
      {
        id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        id v9 = v40;
        id v8 = v41;
        id v11 = v38;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "No pattern events deleted as count is 0", buf, 2u);
        }

        id v10 = (void (**)(id, id, void))v39;
        v39[2](v39, 0, 0);
        id v14 = 0;
      }

      id v13 = 0;
    }
  }
  else
  {
    uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No source redhydration failure, pattern events unaffected", buf, 2u);
    }

    v10[2](v10, 0, 0);
  }
}

- (BOOL)_shouldEventBeDeleted:(id)a3 patternDict:(id)a4 forkey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = [v8 objectForKey:v9];

    if (v10)
    {
      id v11 = [v8 objectForKeyedSubscript:v9];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = +[NSUUID UUID];
          if ([v12 isEqual:v7])
          {
            id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v30 = v11;
              __int16 v31 = 2112;
              id v32 = v9;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Pattern to be deleted has UUID %@ for pattern type %@", buf, 0x16u);
            }

LABEL_27:
            BOOL v14 = 1;
            goto LABEL_28;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id obj = v11;
            id v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v25;
              while (2)
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v25 != v17) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                  id v20 = +[NSUUID UUID];
                  if ([v20 isEqual:v7])
                  {
                    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v30 = v19;
                      __int16 v31 = 2112;
                      id v32 = v9;
                      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Pattern to be deleted has UUID %@ for pattern type %@", buf, 0x16u);
                    }

                    goto LABEL_27;
                  }
                }
                id v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            goto LABEL_23;
          }
          id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[MOEventStore _shouldEventBeDeleted:patternDict:forkey:]((uint64_t)v11, v12);
          }
        }
      }
LABEL_23:
      BOOL v14 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  BOOL v14 = 0;
LABEL_29:

  return v14;
}

- (void)_deleteEWAOnRehydrationFailure:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v9);
        id v11 = [v10 category];
        if ([v11 integerValue] == (id)16) {
          goto LABEL_9;
        }
        id v12 = [v10 category];
        if ([v12 integerValue] == (id)10)
        {

LABEL_9:
LABEL_10:
          id v13 = [v10 eventIdentifier];
          BOOL v14 = [v13 UUIDString];
          [v4 addObject:v14];

          goto LABEL_11;
        }
        id v15 = [v10 category];
        id v16 = [v15 integerValue];

        if (v16 == (id)2) {
          goto LABEL_10;
        }
LABEL_11:
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v17 = [v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
      id v7 = v17;
    }
    while (v17);
  }

  uint64_t v18 = [(MOEventStore *)self getEWAPlistFileURL];
  if (v18)
  {
    uint64_t v19 = [(MOEventStore *)self readEWAPlistFile:v18];
    id v20 = v19;
    if (!v19)
    {
LABEL_44:

      goto LABEL_45;
    }
    id v47 = [v19 mutableCopy];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v21 = v4;
    id v44 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v44)
    {
      CFStringRef v38 = v18;
      id v39 = v5;
      __int16 v40 = v4;
      char v46 = 0;
      id obj = v21;
      uint64_t v43 = *(void *)v55;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v22;
          uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * v22);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v48 = [v20 allKeys];
          id v24 = [v48 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v51;
            do
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v51 != v26) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v28 = *(void *)(*((void *)&v50 + 1) + 8 * i);
                id v29 = v20;
                id v30 = [v20 objectForKeyedSubscript:v28];
                __int16 v31 = [v30 objectForKey:@"EWAEventUUID"];

                if (v31)
                {
                  id v32 = [v30 objectForKeyedSubscript:@"EWAEventUUID"];
                  unsigned int v33 = [v23 isEqualToString:v32];

                  if (v33)
                  {
                    [v47 removeObjectForKey:v28];
                    char v46 = 1;
                  }
                }

                id v20 = v29;
              }
              id v25 = [v48 countByEnumeratingWithState:&v50 objects:v62 count:16];
            }
            while (v25);
          }

          uint64_t v22 = v45 + 1;
        }
        while ((id)(v45 + 1) != v44);
        id v44 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v44);

      id v5 = v39;
      id v4 = v40;
      uint64_t v18 = v38;
      if (v46)
      {
        unsigned int v34 = [(MOEventStore *)self persistEWAMetrics:v38 withData:v47];
        CFStringRef v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
        if (!v34)
        {
          if (!v36) {
            goto LABEL_43;
          }
          *(_WORD *)buf = 0;
          id v37 = "Failed updating EWA pList on rehydration failure";
          goto LABEL_42;
        }
        if (v36)
        {
          *(_WORD *)buf = 0;
          id v37 = "Succesfully updated EWA pList on rehydration failure";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v37, buf, 2u);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
    }
    else
    {
    }
    CFStringRef v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v37 = "No change in EWA on rehydration failure";
      goto LABEL_42;
    }
LABEL_43:

    goto LABEL_44;
  }
LABEL_45:
}

- (void)_checkWorkoutExistsInHealthDB:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v26 + 1) + 8 * (void)v13)];
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  id v15 = +[NSSet setWithArray:v8];
  id v16 = +[HKQuery predicateForObjectsWithUUIDs:v15];

  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v18 = objc_alloc((Class)HKQueryDescriptor);
  uint64_t v19 = +[HKObjectType workoutType];
  id v20 = [v18 initWithSampleType:v19 predicate:v16];

  [v17 addObject:v20];
  id v21 = objc_alloc((Class)HKSampleQuery);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke;
  v24[3] = &unk_1002CB630;
  id v25 = v7;
  id v22 = v7;
  id v23 = [v21 initWithQueryDescriptors:v17 limit:0 resultsHandler:v24];
  [(HKHealthStore *)self->_healthStore executeQuery:v23];
}

void __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke_cold_1();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    [a3 count];
    uint64_t v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
}

- (BOOL)_removeEntriesInPlist:(id)a3 forCategory:(id)a4 forURL:(id)a5
{
  unsigned int v34 = self;
  id v39 = a3;
  id v7 = a4;
  id v35 = a5;
  uint64_t v8 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v13, "integerValue", v34) == (id)2 || objc_msgSend(v13, "integerValue") == (id)16)
        {
          [v8 addObject:@"MOEventCategoryWorkout"];
          [v8 addObject:@"MOEventCategoryMotionActivity"];
        }
        if ([v13 integerValue] == (id)10) {
          [v8 addObject:@"MOEventCategorySignificantContact"];
        }
        if ([v13 integerValue] == (id)1)
        {
          [v8 addObject:@"MOEventCategoryProx"];
          [v8 addObject:@"MOEventCategoryPeopleDensityEvent"];
          [v8 addObject:@"MOEventTimeAtHomeAnomaly"];
        }
        if ([v13 integerValue] == (id)15
          || [v13 integerValue] == (id)23
          || [v13 integerValue] == (id)21)
        {
          [v8 addObject:@"MOEventCategoryProx"];
          [v8 addObject:@"MOEventCategoryPeopleDensityEvent"];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v10);
  }

  id v14 = [v39 mutableCopy];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v8;
  id v16 = [v15 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v16)
  {
    id v17 = v16;
    char v18 = 0;
    uint64_t v38 = *(void *)v46;
    id v36 = v15;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(v36);
        }
        uint64_t v20 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v21 = [v39 allKeys:v34];
        id v22 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v42;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v42 != v24) {
                objc_enumerationMutation(v21);
              }
              long long v26 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
              if ([v26 hasPrefix:v20])
              {
                [v14 removeObjectForKey:v26];
                char v18 = 1;
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
          }
          while (v23);
        }
      }
      id v15 = v36;
      id v17 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v17);

    if (v18)
    {
      long long v27 = v35;
      unsigned int v28 = [(MOEventStore *)v34 persistEWAMetrics:v35 withData:v14];
      long long v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (!v30)
        {
          BOOL v32 = 1;
          goto LABEL_47;
        }
        *(_WORD *)buf = 0;
        __int16 v31 = "EWA update on settings change successfull";
        BOOL v32 = 1;
        goto LABEL_42;
      }
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "EWA update on settings change failed", buf, 2u);
      }
      BOOL v32 = 0;
      goto LABEL_47;
    }
  }
  else
  {
  }
  long long v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  BOOL v32 = 1;
  long long v27 = v35;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    __int16 v31 = "No change in EWA on settings change";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v31, buf, 2u);
  }
LABEL_47:

  return v32;
}

- (void)_deleteStaleEWAEvents
{
  id v3 = [(MOEventStore *)self getEWAPlistFileURL];
  if (v3)
  {
    id v4 = [(MOEventStore *)self readEWAPlistFile:v3];
    id v5 = v4;
    if (!v4)
    {
LABEL_23:

      goto LABEL_24;
    }
    id v25 = [v4 mutableCopy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [v5 allKeys];
    id v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (!v6) {
      goto LABEL_21;
    }
    id v7 = v6;
    id v23 = self;
    uint64_t v24 = v3;
    char v8 = 0;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11, v23];
        id v13 = [v12 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
        [v13 doubleValue];
        double v15 = v14;

        id v16 = +[NSDate date];
        [v16 timeIntervalSinceReferenceDate];
        double v18 = v17 - v15;

        if (v18 >= 31536000.0)
        {
          [v25 removeObjectForKey:v11];
          uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v11;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removing %@ entries in EWA as it is stale", buf, 0xCu);
          }

          char v8 = 1;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);

    id v3 = v24;
    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
    unsigned int v20 = [(MOEventStore *)v23 persistEWAMetrics:v24 withData:v25];
    id obj = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    BOOL v21 = os_log_type_enabled(obj, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        id v22 = "EWA pList succesfully updated by removing stale entries";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_INFO, v22, buf, 2u);
      }
    }
    else if (v21)
    {
      *(_WORD *)buf = 0;
      id v22 = "EWA pList update failed while removing stale entries";
      goto LABEL_20;
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_deleteEWAForExpiredEvents:(id)a3
{
  id v39 = a3;
  long long v41 = self;
  uint64_t v40 = [(MOEventStore *)self getEWAPlistFileURL];
  id v4 = (void *)v40;
  if (!v40) {
    goto LABEL_51;
  }
  id v5 = -[MOEventStore readEWAPlistFile:](self, "readEWAPlistFile:");
  id v47 = v5;
  if (!v5) {
    goto LABEL_50;
  }
  id v46 = [v5 mutableCopy];
  uint64_t v68 = 0;
  long long v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v39;
  id v44 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (!v44) {
    goto LABEL_25;
  }
  uint64_t v43 = *(void *)v65;
  do
  {
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      if (*(void *)v65 != v43) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v7 = [v47 allKeys];
      id v8 = [v7 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v61;
        id v48 = v7;
        do
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(void *)v61 != v9) {
              objc_enumerationMutation(v48);
            }
            uint64_t v11 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            if (([v11 hasPrefix:@"MOEventCategoryWorkout"] & 1) == 0)
            {
              uint64_t v12 = [v6 category];
              if ([v12 integerValue] == (id)16)
              {
              }
              else
              {
                id v13 = [v6 category];
                BOOL v14 = [v13 integerValue] == (id)10;

                if (!v14) {
                  continue;
                }
              }
              double v15 = [v47 objectForKeyedSubscript:v11];
              id v16 = [v15 objectForKey:@"EWAEventUUID"];

              if (v16)
              {
                double v17 = [v6 eventIdentifier];
                double v18 = [v17 UUIDString];
                uint64_t v19 = [v15 objectForKeyedSubscript:@"EWAEventUUID"];
                unsigned int v20 = [v18 isEqualToString:v19];

                if (v20)
                {
                  [v46 removeObjectForKey:v11];
                  *((unsigned char *)v69 + 24) = 1;
                }
              }
            }
          }
          id v7 = v48;
          id v8 = [v48 countByEnumeratingWithState:&v60 objects:v74 count:16];
        }
        while (v8);
      }
    }
    id v44 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
  }
  while (v44);
LABEL_25:

  long long v49 = dispatch_group_create();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BOOL v21 = [v47 allKeys];
  id v22 = [v21 countByEnumeratingWithState:&v56 objects:v73 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v57;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
        if ([v25 hasPrefix:@"MOEventCategoryWorkout"])
        {
          long long v26 = [v47 objectForKeyedSubscript:v25];
          long long v27 = +[NSDate date];
          [v27 timeIntervalSinceReferenceDate];
          double v29 = v28;
          long long v30 = [v26 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
          [v30 doubleValue];
          double v32 = v31;

          if (v29 - v32 > 2419200.0)
          {
            unsigned int v33 = [v26 objectForKey:@"EWAEventProviderUUID" - v29 + v32];

            if (v33)
            {
              unsigned int v34 = [v26 objectForKeyedSubscript:@"EWAEventProviderUUID"];
              id v72 = v34;
              id v35 = +[NSArray arrayWithObjects:&v72 count:1];

              dispatch_group_enter(v49);
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = __43__MOEventStore__deleteEWAForExpiredEvents___block_invoke;
              v51[3] = &unk_1002CB658;
              id v52 = v46;
              long long v53 = v25;
              long long v55 = &v68;
              long long v54 = v49;
              [(MOEventStore *)v41 _checkWorkoutExistsInHealthDB:v35 handler:v51];
            }
          }
        }
      }
      id v22 = [v21 countByEnumeratingWithState:&v56 objects:v73 count:16];
    }
    while (v22);
  }

  if ((MODispatchGroupWait(v49, 0xFFFFFFFFFFFFFFFFLL, @"deleteEWAForExpiredEvents") & 1) == 0)
  {
    id v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[MOEventStore _deleteEWAForExpiredEvents:]();
    }
  }
  if (*((unsigned char *)v69 + 24))
  {
    if ([(MOEventStore *)v41 persistEWAMetrics:v40 withData:v46])
    {
      id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v38 = "EWA pList succesfully updated by removing expired events";
        goto LABEL_47;
      }
    }
    else
    {
      id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v38 = "EWA pList update failed while removing expired events";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 2u);
      }
    }
  }
  _Block_object_dispose(&v68, 8);

  id v5 = v47;
LABEL_50:

  id v4 = (void *)v40;
LABEL_51:
}

void __43__MOEventStore__deleteEWAForExpiredEvents___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Workout EWA deleted or not present in health DB", v4, 2u);
    }

    [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)purgeVisitEventsBeforeDate:(id)a3 WithCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(MOEventStore *)self persistenceManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke;
  v12[3] = &unk_1002CB680;
  id v13 = v7;
  BOOL v14 = self;
  id v15 = v8;
  SEL v16 = a2;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

void __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"startDate < %@ AND category == %lu", *(void *)(a1 + 32), 1];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v41 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v41];
  id v7 = v41;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v35 = [v6 count];
    *(_DWORD *)buf = 138413058;
    id v46 = v34;
    __int16 v47 = 2112;
    id v48 = v4;
    __int16 v49 = 2048;
    id v50 = v35;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if ([v6 count])
  {
    uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002F4DD8, 0);
    id v10 = [*(id *)(a1 + 40) getEWAPlistFileURL];
    if (!v10)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v11 = [*(id *)(a1 + 40) readEWAPlistFile:v10];
    if (v11)
    {
      unsigned int v12 = [*(id *)(a1 + 40) _removeEntriesInPlist:v11 forCategory:v9 forURL:v10];
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v9;
          id v15 = "Succesfully updated EWA pList for purgeVisitEventsBeforeDate, categories %@";
LABEL_13:
          SEL v16 = v13;
          uint32_t v17 = 12;
          goto LABEL_14;
        }
      }
      else if (v14)
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v9;
        id v15 = "Failed updating EWA pList for purgeVisitEventsBeforeDate, categories %@";
        goto LABEL_13;
      }
    }
    else
    {
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v15 = "Fail to read EWA pList for for purgeVisitEventsBeforeDate";
        SEL v16 = v13;
        uint32_t v17 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      }
    }

    goto LABEL_16;
  }
LABEL_17:
  if (v7)
  {
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v7, &__NSDictionary0__struct);
    }
    [v3 reset];
  }
  else
  {
    if ([v6 count])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v19 = v6;
      id v20 = [v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            [v3 deleteObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          }
          id v21 = [v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v21);
      }

      uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v19 count];
        *(_DWORD *)buf = 134217984;
        id v46 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "purgeVisitEventsBeforeDate trying to purge events count %lu", buf, 0xCu);
      }

      id v36 = 0;
      unsigned __int8 v26 = [v3 save:&v36];
      id v27 = v36;
      double v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      double v29 = v28;
      if (v26)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v30 = [v19 count];
          *(_DWORD *)buf = 134217984;
          id v46 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "purgeVisitEventsBeforeDate succeeded with event count %lu", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      id v27 = 0;
    }
    [v3 reset];
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31)
    {
      CFStringRef v42 = @"resultNumberOfEvents";
      double v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
      uint64_t v43 = v32;
      unsigned int v33 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      (*(void (**)(uint64_t, id, void *))(v31 + 16))(v31, v27, v33);
    }
  }
}

- (void)fetchAllEventsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(MOEventStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __52__MOEventStore_fetchAllEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002CB5B8;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [v6 performBlockAndWait:v8];
}

void __52__MOEventStore_fetchAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  id v23 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v23];
  id v6 = v23;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v16 = [v5 count];
    *(_DWORD *)buf = 138413058;
    unsigned __int8 v26 = v15;
    __int16 v27 = 2112;
    double v28 = v4;
    __int16 v29 = 2048;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v18 = a1;
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint32_t v17 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = [[MOEvent alloc] initWithEventMO:*(void *)(*((void *)&v19 + 1) + 8 * (void)v13)];
          if (v14) {
            [v8 addObject:v14];
          }

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    id v5 = v17;
    a1 = v18;
  }
  [v3 reset:v17];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLastEventOfCategory:(unint64_t)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSSet);
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [v7 initWithObjects:v8];

  [(MOEventStore *)self fetchLastEventOfCategories:v9 CompletionHandler:v6];
}

- (void)fetchLastEventOfCategories:(id)a3 CompletionHandler:(id)a4
{
}

- (void)fetchLastEventOfCategories:(id)a3 isHighConfidenceOnly:(BOOL)a4 CompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(MOEventStore *)self persistenceManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __82__MOEventStore_fetchLastEventOfCategories_isHighConfidenceOnly_CompletionHandler___block_invoke;
  v14[3] = &unk_1002CB6A8;
  BOOL v18 = a4;
  id v16 = v10;
  SEL v17 = a2;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  [v11 performBlockAndWait:v14];
}

void __82__MOEventStore_fetchLastEventOfCategories_isHighConfidenceOnly_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  if (*(unsigned char *)(a1 + 56)) {
    CFStringRef v5 = @"category IN %@ AND isInvalid == NO AND isHighConfidence == YES";
  }
  else {
    CFStringRef v5 = @"category IN %@ AND isInvalid == NO";
  }
  id v6 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v5, *(void *)(a1 + 32));
  [v4 setPredicate:v6];

  [v4 setReturnsObjectsAsFaults:0];
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v25 = v7;
  id v8 = +[NSArray arrayWithObjects:&v25 count:1];
  [v4 setSortDescriptors:v8];

  [v4 setFetchLimit:1];
  id v16 = 0;
  id v9 = [v3 executeFetchRequest:v4 error:&v16];
  id v10 = v16;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v15 = [v9 count];
    *(_DWORD *)buf = 138413058;
    BOOL v18 = v14;
    __int16 v19 = 2112;
    long long v20 = v4;
    __int16 v21 = 2048;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  id v12 = 0;
  if ([v9 count] && !v10)
  {
    id v13 = [v9 firstObject];
    id v12 = [[MOEvent alloc] initWithEventMO:v13];
  }
  [v3 reset];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchEventsWithStartDateAfter:(id)a3 Category:(unint64_t)a4 CompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(MOEventStore *)self persistenceManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __73__MOEventStore_fetchEventsWithStartDateAfter_Category_CompletionHandler___block_invoke;
  v14[3] = &unk_1002CB6D0;
  unint64_t v17 = a4;
  SEL v18 = a2;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 performBlockAndWait:v14];
}

void __73__MOEventStore_fetchEventsWithStartDateAfter_Category_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  CFStringRef v5 = +[NSPredicate predicateWithFormat:@"startDate >= %@ AND category == %lu AND isInvalid == NO", *(void *)(a1 + 32), *(void *)(a1 + 48)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v35 = v6;
  id v7 = +[NSArray arrayWithObjects:&v35 count:1];
  [v4 setSortDescriptors:v7];

  id v25 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v25];
  id v9 = v25;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    SEL v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    double v28 = v18;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2048;
    id v32 = v19;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    id v20 = v3;
    id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = [[MOEvent alloc] initWithEventMO:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    id v3 = v20;
  }
  [v3 reset];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(MOEventStore *)self persistenceManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __57__MOEventStore_fetchEventsWithOptions_CompletionHandler___block_invoke;
  v12[3] = &unk_1002CB590;
  id v14 = v8;
  SEL v15 = a2;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

void __57__MOEventStore_fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  CFStringRef v5 = +[NSMutableArray array];
  id v6 = [*(id *)(a1 + 32) dateInterval];

  long long v37 = v4;
  long long v38 = v3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) dateInterval];
    id v8 = [v7 endDate];
    id v9 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v8];
    v54[0] = v9;
    [*(id *)(a1 + 32) dateInterval];
    v11 = id v10 = v5;
    id v12 = [v11 startDate];
    id v13 = +[NSPredicate predicateWithFormat:@"endDate >= %@", v12];
    v54[1] = v13;
    id v14 = +[NSArray arrayWithObjects:v54 count:2];
    SEL v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
    [v10 addObject:v15];

    CFStringRef v5 = v10;
    id v4 = v37;

    id v3 = v38;
  }
  if ([*(id *)(a1 + 32) category])
  {
    id v16 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"category == %lu", [*(id *)(a1 + 32) category]);
    [v5 addObject:v16];
  }
  if ([v5 count])
  {
    unint64_t v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v17];
  }
  SEL v18 = [*(id *)(a1 + 32) limit];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 32) limit];
    [v4 setFetchLimit:[v19 unsignedIntegerValue]];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v20 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:[*(id *)(a1 + 32) ascending]];
  id v53 = v20;
  long long v21 = +[NSArray arrayWithObjects:&v53 count:1];
  [v4 setSortDescriptors:v21];

  [v4 setFetchBatchSize:100];
  id v43 = 0;
  long long v22 = [v3 executeFetchRequest:v4 error:&v43];
  id v23 = v43;
  long long v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    id v35 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v36 = [v22 count];
    *(_DWORD *)buf = 138413058;
    id v46 = v35;
    __int16 v47 = 2112;
    id v48 = v4;
    __int16 v49 = 2048;
    id v50 = v36;
    __int16 v51 = 2112;
    id v52 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v23)
  {
    [v3 reset];
    uint64_t v25 = *(void *)(a1 + 40);
    if (v25) {
      (*(void (**)(uint64_t, void *, id))(v25 + 16))(v25, &__NSArray0__struct, v23);
    }
    unsigned __int8 v26 = 0;
  }
  else
  {
    __int16 v27 = v5;
    unsigned __int8 v26 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v22 count]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v28 = v22;
    id v29 = [v28 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = [[MOEvent alloc] initWithEventMO:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          if (v33) {
            [v26 addObject:v33];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v30);
    }

    id v3 = v38;
    [v38 reset];
    uint64_t v34 = *(void *)(a1 + 40);
    if (v34) {
      (*(void (**)(uint64_t, void *, void))(v34 + 16))(v34, v26, 0);
    }
    CFStringRef v5 = v27;
    id v4 = v37;
    id v23 = 0;
  }
}

- (void)fetchAnalyticsEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(MOEventStore *)self persistenceManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __66__MOEventStore_fetchAnalyticsEventsWithOptions_CompletionHandler___block_invoke;
  v12[3] = &unk_1002CB590;
  id v14 = v8;
  SEL v15 = a2;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

void __66__MOEventStore_fetchAnalyticsEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventMO fetchRequest];
  CFStringRef v5 = +[NSMutableArray array];
  id v6 = +[NSPredicate predicateWithFormat:@"provider == %lu", 5];
  [v5 addObject:v6];

  id v7 = [*(id *)(a1 + 32) dateInterval];

  long long v38 = v4;
  id v39 = v3;
  if (v7)
  {
    id v8 = v5;
    id v9 = [*(id *)(a1 + 32) dateInterval];
    id v10 = [v9 endDate];
    id v11 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v10];
    v55[0] = v11;
    id v12 = [*(id *)(a1 + 32) dateInterval];
    id v13 = [v12 startDate];
    id v14 = +[NSPredicate predicateWithFormat:@"endDate >= %@", v13];
    v55[1] = v14;
    SEL v15 = +[NSArray arrayWithObjects:v55 count:2];
    id v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];
    [v8 addObject:v16];

    CFStringRef v5 = v8;
    id v3 = v39;

    id v4 = v38;
  }
  if ([*(id *)(a1 + 32) category])
  {
    unint64_t v17 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"category == %lu", [*(id *)(a1 + 32) category]);
    [v5 addObject:v17];
  }
  if ([v5 count])
  {
    SEL v18 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v18];
  }
  id v19 = [*(id *)(a1 + 32) limit];

  if (v19)
  {
    id v20 = [*(id *)(a1 + 32) limit];
    [v4 setFetchLimit:[v20 unsignedIntegerValue]];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v21 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:[*(id *)(a1 + 32) ascending]];
  id v54 = v21;
  long long v22 = +[NSArray arrayWithObjects:&v54 count:1];
  [v4 setSortDescriptors:v22];

  [v4 setFetchBatchSize:100];
  id v44 = 0;
  id v23 = [v3 executeFetchRequest:v4 error:&v44];
  id v24 = v44;
  uint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v35 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v36 = [v23 count];
    *(_DWORD *)buf = 138413058;
    __int16 v47 = v35;
    __int16 v48 = 2112;
    __int16 v49 = v4;
    __int16 v50 = 2048;
    id v51 = v36;
    __int16 v52 = 2112;
    id v53 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v24)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26) {
      (*(void (**)(uint64_t, void *, id))(v26 + 16))(v26, &__NSArray0__struct, v24);
    }
    __int16 v27 = 0;
  }
  else
  {
    long long v37 = v5;
    __int16 v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v23 count]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v28 = v23;
    id v29 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v41;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = [[MOEvent alloc] initWithEventMO:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v30);
    }

    uint64_t v34 = *(void *)(a1 + 40);
    if (v34) {
      (*(void (**)(uint64_t, void *, void))(v34 + 16))(v34, v27, 0);
    }
    id v4 = v38;
    id v3 = v39;
    CFStringRef v5 = v37;
  }
}

- (id)getEWAPlistFileURL
{
  v2 = +[MOPersistenceManager userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"EWAForAnomaly.plist"];
  }
  else
  {
    CFStringRef v5 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore getEWAPlistFileURL]();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_readEWAPlistFilePrivate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  CFStringRef v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MOEventStore _readEWAPlistFilePrivate:](v8);
    }

    id v15 = 0;
    id v9 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v15];
    id v10 = v15;
    if (v10)
    {
      id v11 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MOEventStore _readEWAPlistFilePrivate:]();
      }

      id v12 = 0;
    }
    else
    {
      id v12 = v9;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No anomaly EWA persistence plist found at path.", v14, 2u);
    }

    id v12 = objc_alloc_init((Class)NSDictionary);
  }

  return v12;
}

- (id)readEWAPlistFile:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__11;
  id v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  CFStringRef v5 = [(MOEventStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__MOEventStore_readEWAPlistFile___block_invoke;
  block[3] = &unk_1002CB6F8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __33__MOEventStore_readEWAPlistFile___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _readEWAPlistFilePrivate:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

- (BOOL)_persistEWAMetricsPrivate:(id)a3 withData:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v17 = 0;
    id v6 = +[NSPropertyListSerialization dataWithPropertyList:a4 format:100 options:0 error:&v17];
    id v7 = v17;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v16 = 0;
      unsigned __int8 v12 = [v6 writeToURL:v5 options:805306369 error:&v16];
      id v9 = v16;
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      id v10 = v13;
      if (!v9 && (v12 & 1) != 0)
      {
        BOOL v11 = 1;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Anomaly EWA persistence was successfully written to plist.", (uint8_t *)v15, 2u);
        }
        id v9 = v10;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MOEventStore _persistEWAMetricsPrivate:withData:]();
      }
    }
    else
    {
      id v9 = v7;
      id v10 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOEventStore _persistEWAMetricsPrivate:withData:]();
      }
    }

    BOOL v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MOEventStore _persistEWAMetricsPrivate:withData:]();
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)persistEWAMetrics:(id)a3 withData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  BOOL v8 = [(MOEventStore *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __43__MOEventStore_persistEWAMetrics_withData___block_invoke;
  v12[3] = &unk_1002CB720;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

id __43__MOEventStore_persistEWAMetrics_withData___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _persistEWAMetricsPrivate:*(void *)(a1 + 40) withData:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  return result;
}

- (MOPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOEventPatternManager)patternManager
{
  return self->_patternManager;
}

- (void)setPatternManager:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_patternManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: persistenceManager", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: configurationManager", v2, v3, v4, v5, v6);
}

void __45__MOEventStore_storeEvent_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "error, %@", v2, v3, v4, v5, v6);
}

void __46__MOEventStore_storeEvents_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving events error, %@", v2, v3, v4, v5, v6);
}

void __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event deletion operation error, %@", v2, v3, v4, v5, v6);
}

void __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event purge operation error, %@", v2, v3, v4, v5, v6);
}

- (void)purgeRehydrationFailedEventsForType:(int)a1 rehydrationFailCount:(NSObject *)a2 CompletionHandler:.cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "requested invalid maxRehydrationFailCount value %d", (uint8_t *)v2, 8u);
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_cold_1(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:]_block_invoke_3";
  __int16 v3 = 1024;
  int v4 = 387;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "purgeRehydrationFailedEventsForType, Unrecognized event type for event purge (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

- (void)_deleteSensedEvents:forContext:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purgeRehydrationFailedEventsWithCompletionHandler, saving event purge operation error, %@", v2, v3, v4, v5, v6);
}

- (void)_deletePatternEvents:(uint64_t)a1 forContext:(void *)a2 handler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  id v7 = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Pattern event deletion failed with error  %@, num events %ld", (uint8_t *)&v4, 0x16u);
}

- (void)_shouldEventBeDeleted:(uint64_t)a1 patternDict:(NSObject *)a2 forkey:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Pattern dict belongs to %@ class", v5, 0xCu);
}

void __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch health data hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_deleteEWAForExpiredEvents:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "HealthKit queries timed out", v1, 2u);
}

void __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purgeVisitEventsBeforeDate hit error, %@", v2, v3, v4, v5, v6);
}

- (void)getEWAPlistFileURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store anomaly EWA persistence plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

- (void)_readEWAPlistFilePrivate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read the anomaly EWA persistence plist file, error: %@", v2, v3, v4, v5, v6);
}

- (void)_readEWAPlistFilePrivate:(os_log_t)log .cold.2(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"EWAForAnomaly.plist";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %@ found.", (uint8_t *)&v1, 0xCu);
}

- (void)_persistEWAMetricsPrivate:withData:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid path for anomaly EWA persistence plist file.", v2, v3, v4, v5, v6);
}

- (void)_persistEWAMetricsPrivate:withData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Anomaly EWA persistence serialization to NSData failed or returned nil, %@", v2, v3, v4, v5, v6);
}

- (void)_persistEWAMetricsPrivate:withData:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't write to the anomaly EWA persistence plist file, %@", v2, v3, v4, v5, v6);
}

@end