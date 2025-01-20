@interface MOFSMStore
- (MOConfigurationManager)configurationManager;
- (MOFSMStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4;
- (MOFSMStore)initWithUniverse:(id)a3;
- (MOPersistenceManager)persistenceManager;
- (OS_dispatch_queue)queue;
- (void)fetchFSMWithName:(id)a3 CompletionHandler:(id)a4;
- (void)removeAllFSMsWithCompletionHandler:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)updateFSM:(id)a3 completionHandler:(id)a4;
@end

@implementation MOFSMStore

- (MOFSMStore)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 getService:v6];

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v4 getService:v9];

  v11 = [(MOFSMStore *)self initWithPersistenceManager:v7 andConfigurationManager:v10];
  return v11;
}

- (MOFSMStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)MOFSMStore;
    v10 = [(MOFSMStore *)&v18 init];
    if (v10)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("MOFSMStore", v11);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v10->_persistenceManager, a3);
      objc_storeStrong((id *)&v10->_configurationManager, a4);
    }
    self = v10;
    v14 = self;
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOFSMStore initWithPersistenceManager:andConfigurationManager:](v15);
    }

    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MOFSMStore.m" lineNumber:33 description:@"Invalid parameter not satisfying: persistenceManager"];

    v14 = 0;
  }

  return v14;
}

- (void)fetchFSMWithName:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__26;
  v20 = __Block_byref_object_dispose__26;
  id v21 = 0;
  id v9 = [(MOFSMStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __49__MOFSMStore_fetchFSMWithName_CompletionHandler___block_invoke;
  v11[3] = &unk_1002CFAD0;
  id v10 = v7;
  id v12 = v10;
  v13 = &v22;
  v14 = &v16;
  SEL v15 = a2;
  [v9 performBlockAndWait:v11];

  v8[2](v8, v17[5], v23[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __49__MOFSMStore_fetchFSMWithName_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOFSMMO fetchRequest];
  v5 = +[NSMutableArray array];
  v6 = +[NSPredicate predicateWithFormat:@"name == %@ ", *(void *)(a1 + 32)];
  [v5 addObject:v6];

  if ([v5 count])
  {
    id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v7];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastProcessedDate" ascending:0];
  id v32 = v8;
  id v9 = +[NSArray arrayWithObjects:&v32 count:1];
  [v4 setSortDescriptors:v9];

  [v4 setFetchBatchSize:1];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v21 = [v11 count];
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v25 = v20;
    __int16 v26 = 2112;
    id v27 = v4;
    __int16 v28 = 2048;
    id v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v13 = [MOFSM alloc];
    v14 = [v11 firstObject];
    SEL v15 = [(MOFSM *)v13 initWithFSMMO:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetched fsm from store :%@", buf, 0xCu);
    }
  }
  [v3 reset];
}

- (void)updateFSM:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  id v18 = 0;
  id v8 = [(MOFSMStore *)self persistenceManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __42__MOFSMStore_updateFSM_completionHandler___block_invoke;
  v10[3] = &unk_1002CFAF8;
  id v9 = v6;
  id v11 = v9;
  id v12 = &v13;
  [v8 performBlockAndWait:v10];

  if (v7) {
    v7[2](v7, v14[5], &__NSDictionary0__struct);
  }

  _Block_object_dispose(&v13, 8);
}

void __42__MOFSMStore_updateFSM_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = +[MOFSMMO fetchRequest];
    v5 = [*(id *)(a1 + 32) name];
    id v6 = +[NSPredicate predicateWithFormat:@"name == %@", v5];
    [v4 setPredicate:v6];

    id v26 = 0;
    id v7 = [v3 executeFetchRequest:v4 error:&v26];
    id v8 = v26;
    if (!v8
      && [v7 count]
      && ([v7 firstObject], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v22 = (void *)v21;
      v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "update fsm, %@", buf, 0xCu);
      }

      +[MOFSMMO setPropertiesOfFSMMO:v22 withFSM:*(void *)(a1 + 32)];
    }
    else
    {
      id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "save fsm, %@", buf, 0xCu);
      }

      id v11 = +[MOFSMMO managedObjectWithObject:*(void *)(a1 + 32) inManagedObjectContext:v3];
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v12 = a1 + 40;
    uint64_t v14 = *(void *)(v13 + 8);
    id obj = *(id *)(v14 + 40);
    unsigned __int8 v15 = [v3 save:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);
    uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "saving fsm succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __42__MOFSMStore_updateFSM_completionHandler___block_invoke_cold_1(v12, v17);
    }

    [v3 reset];
  }
  else
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "no fsm to be saved", buf, 2u);
    }

    NSErrorUserInfoKey v29 = NSDebugDescriptionErrorKey;
    CFStringRef v30 = @"No FSM passed.";
    id v4 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v19 = +[NSError errorWithDomain:@"MOErrorDomain" code:2 userInfo:v4];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(id *)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

- (void)removeAllFSMsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(MOFSMStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002CB5B8;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [v6 performBlockAndWait:v8];
}

void __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOFSMMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v28 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v28];
  id v6 = v28;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v22 = [v5 count];
    *(_DWORD *)buf = 138413058;
    id v31 = v21;
    __int16 v32 = 2112;
    v33 = v4;
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
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            [v3 deleteObject:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v11);
      }

      uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v9 count];
        *(_DWORD *)buf = 134217984;
        id v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "trying to remove fsm count %lu", buf, 0xCu);
      }

      id v23 = 0;
      unsigned __int8 v16 = [v3 save:&v23];
      id v17 = v23;
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      uint64_t v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "saving fsm deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke_cold_1((uint64_t)v17, v19);
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)initWithPersistenceManager:(os_log_t)log andConfigurationManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", v1, 2u);
}

void __42__MOFSMStore_updateFSM_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "saving fsm error, %@", (uint8_t *)&v3, 0xCu);
}

void __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "saving fsm deletion operation error, %@", (uint8_t *)&v2, 0xCu);
}

@end