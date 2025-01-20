@interface MOContextStore
- (MOContextPersistenceManager)persistenceManager;
- (MOContextStore)initWithPersistenceManager:(id)a3;
- (OS_dispatch_queue)queue;
- (void)fetchContextsGeneratedFromClientRequest:(id)a3 handler:(id)a4;
- (void)fetchContextsWithOption:(id)a3 handler:(id)a4;
- (void)removeContexts:(id)a3 handler:(id)a4;
- (void)removeExpiredContextWithHandler:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeContexts:(id)a3 handler:(id)a4;
@end

@implementation MOContextStore

- (MOContextStore)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)MOContextStore;
    v6 = [(MOContextStore *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create("MOContextStore", v8);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v9;
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)fetchContextsWithOption:(id)a3 handler:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = (id)objc_opt_new();
  dispatch_queue_t v9 = [(MOContextStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __50__MOContextStore_fetchContextsWithOption_handler___block_invoke;
  v11[3] = &unk_1000A4DB8;
  id v10 = v7;
  id v12 = v10;
  objc_super v13 = &v22;
  v14 = &v16;
  SEL v15 = a2;
  [v9 performBlockAndWait:v11];

  if (v8) {
    v8[2](v8, v17[5], v23[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

void __50__MOContextStore_fetchContextsWithOption_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[MOContextMO fetchRequest];
  id v5 = +[NSMutableArray array];
  if ([v5 count])
  {
    v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v6];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"contextCreationTimestamp" ascending:1];
  id v39 = v7;
  v8 = +[NSArray arrayWithObjects:&v39 count:1];
  [v4 setSortDescriptors:v8];

  if ([*(id *)(a1 + 32) contextCount]) {
    objc_msgSend(v4, "setFetchBatchSize:", objc_msgSend(*(id *)(a1 + 32), "contextCount"));
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v21 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v22 = [v10 count];
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v32 = v21;
    __int16 v33 = 2112;
    v34 = v4;
    __int16 v35 = 2048;
    id v36 = v22;
    __int16 v37 = 2112;
    uint64_t v38 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v24 = v5;
    uint64_t v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [[MOContext alloc] initWithContextMO:*(void *)(*((void *)&v25 + 1) + 8 * (void)v19)];
          if (v20) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v20];
          }

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    id v5 = v24;
  }
  [v3 reset];
}

- (void)storeContexts:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  if ([v6 count])
  {
    v8 = [(MOContextStore *)self persistenceManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __40__MOContextStore_storeContexts_handler___block_invoke;
    v11[3] = &unk_1000A4DE0;
    uint64_t v12 = v6;
    uint64_t v13 = &v14;
    [v8 performBlockAndWait:v11];

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no contexts to be saved", v10, 2u);
    }
  }

  if (v7) {
    v7[2](v7, v15[5]);
  }
  _Block_object_dispose(&v14, 8);
}

void __40__MOContextStore_storeContexts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v36 = a1;
  __int16 v35 = (id *)(a1 + 32);
  id v4 = *(id *)(a1 + 32);
  id v38 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
  id v5 = 0;
  if (v38)
  {
    uint64_t v6 = *(void *)v42;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v9 = +[MOContextMO fetchRequest];
        id v10 = [v8 contextIdentifier];
        v11 = +[NSPredicate predicateWithFormat:@"contextIdentifier == %@", v10];
        [v9 setPredicate:v11];

        id v40 = 0;
        uint64_t v12 = [v3 executeFetchRequest:v9 error:&v40];
        id v13 = v40;
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;

          uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __40__MOContextStore_storeContexts_handler___block_invoke_cold_2(v49, v15, &v50, v16);
          }

          goto LABEL_16;
        }
        if (![v12 count]
          || ([v12 lastObject], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v15 = v5;
LABEL_16:
          id v21 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "save context, %@", buf, 0xCu);
          }

          id v22 = +[MOContextMO managedObjectWithContext:v8 inManagedObjectContext:v3];
          id v5 = v15;
          goto LABEL_19;
        }
        uint64_t v18 = (void *)v17;
        id v19 = v4;
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v8;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "update context, %@", buf, 0xCu);
        }

        +[MOContextMO updateManagedObject:v18 withContext:v8 inManagedObjectContext:v3];
        id v4 = v19;
        uint64_t v6 = v37;
LABEL_19:
      }
      id v38 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v38);
  }

  uint64_t v23 = v36 + 40;
  uint64_t v24 = *(void *)(*(void *)(v36 + 40) + 8);
  id obj = *(id *)(v24 + 40);
  unsigned __int8 v25 = [v3 save:&obj];
  objc_storeStrong((id *)(v24 + 40), obj);
  long long v26 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
  long long v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v28 = [*v35 count];
      *(_DWORD *)buf = 134217984;
      id v48 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "saving contexts succeeded, contexts count, %lu", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __40__MOContextStore_storeContexts_handler___block_invoke_cold_1(v23, v35);
  }

  if (*(void *)(*(void *)(*(void *)v23 + 8) + 40)) {
    BOOL v29 = 1;
  }
  else {
    BOOL v29 = v5 == 0;
  }
  if (!v29)
  {
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"MOContextStore:storeContext persistence error";
    v30 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v31 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:1802 userInfo:v30];
    uint64_t v32 = +[NSError errorUsingError:v31 withUnderyingError:v5];
    uint64_t v33 = *(void *)(*(void *)v23 + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
  [v3 reset];
}

- (void)removeContexts:(id)a3 handler:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v9 = [(MOContextStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __41__MOContextStore_removeContexts_handler___block_invoke;
  v11[3] = &unk_1000A4E08;
  id v10 = v7;
  id v12 = v10;
  id v13 = &v15;
  SEL v14 = a2;
  [v9 performBlockAndWait:v11];

  if (v8) {
    v8[2](v8, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

void __41__MOContextStore_removeContexts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v9) contextIdentifier];
        [v4 addObject:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v7);
  }

  v11 = +[MOContextMO fetchRequest];
  id v12 = +[NSPredicate predicateWithFormat:@"contextIdentifier IN %@", v4];
  [v11 setPredicate:v12];

  [v11 setReturnsObjectsAsFaults:0];
  uint64_t v13 = a1 + 40;
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v14 + 40);
  uint64_t v15 = [v3 executeFetchRequest:v11 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v27 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v28 = [v15 count];
    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v42 = v27;
    __int16 v43 = 2112;
    long long v44 = v11;
    __int16 v45 = 2048;
    id v46 = v28;
    __int16 v47 = 2112;
    uint64_t v48 = v29;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)v13 + 8) + 40) && [v15 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        id v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [v3 deleteObject:*(void *)(*((void *)&v31 + 1) + 8 * (void)v21)];
          id v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v19);
    }

    uint64_t v22 = *(void *)(*(void *)v13 + 8);
    id v30 = *(id *)(v22 + 40);
    unsigned __int8 v23 = [v3 save:&v30];
    objc_storeStrong((id *)(v22 + 40), v30);
    uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
    unsigned __int8 v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v26 = [v17 count];
        *(_DWORD *)buf = 134217984;
        id v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "context deletion operation succeeded, contexts count %lu", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __41__MOContextStore_removeContexts_handler___block_invoke_cold_1(v13, v17);
    }
  }
  [v3 reset];
}

- (void)removeExpiredContextWithHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v6 = [(MOContextStore *)self persistenceManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__MOContextStore_removeExpiredContextWithHandler___block_invoke;
  v7[3] = &unk_1000A4E30;
  v7[4] = &v8;
  v7[5] = a2;
  [v6 performBlockAndWait:v7];

  if (v5) {
    v5[2](v5, v9[5]);
  }
  _Block_object_dispose(&v8, 8);
}

void __50__MOContextStore_removeExpiredContextWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSDate date];
  id v5 = +[NSDate dateWithTimeInterval:v4 sinceDate:-2419200.0];

  id v6 = +[MOContextMO fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"contextCreationTimestamp < %@ ", v5];
  [v6 setPredicate:v7];

  [v6 setReturnsObjectsAsFaults:0];
  uint64_t v8 = a1 + 32;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v3 executeFetchRequest:v6 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v23 = [v10 count];
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v33 = v22;
    __int16 v34 = 2112;
    __int16 v35 = v6;
    __int16 v36 = 2048;
    id v37 = v23;
    __int16 v38 = 2112;
    uint64_t v39 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)v8 + 8) + 40) && [v10 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [v3 deleteObject:*(void *)(*((void *)&v26 + 1) + 8 * (void)v16)];
          uint64_t v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v14);
    }

    uint64_t v17 = *(void *)(*(void *)v8 + 8);
    id v25 = *(id *)(v17 + 40);
    unsigned __int8 v18 = [v3 save:&v25];
    objc_storeStrong((id *)(v17 + 40), v25);
    id v19 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [v12 count];
        *(_DWORD *)buf = 134217984;
        id v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "expired context deletion operation succeeded, contexts count %lu", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __50__MOContextStore_removeExpiredContextWithHandler___block_invoke_cold_1(v8, v12);
    }
  }
  [v3 reset];
}

- (void)fetchContextsGeneratedFromClientRequest:(id)a3 handler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__0;
  long long v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  unsigned __int8 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = (id)objc_opt_new();
  if (v7)
  {
    uint64_t v9 = [(MOContextStore *)self persistenceManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __66__MOContextStore_fetchContextsGeneratedFromClientRequest_handler___block_invoke;
    v12[3] = &unk_1000A4DB8;
    id v13 = v7;
    id v14 = &v23;
    uint64_t v15 = &v17;
    SEL v16 = a2;
    [v9 performBlockAndWait:v12];

    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "client request is nil", v11, 2u);
    }
  }

  if (v8) {
    v8[2](v8, v18[5], v24[5]);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

void __66__MOContextStore_fetchContextsGeneratedFromClientRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOContextMO fetchRequest];
  id v5 = [*(id *)(a1 + 32) requestIdentifier];
  id v6 = [v5 UUIDString];
  id v7 = +[NSPredicate predicateWithFormat:@"associatedRequestID == %@", v6];
  [v4 setPredicate:v7];

  [v4 setReturnsObjectsAsFaults:0];
  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"contextCreationTimestamp" ascending:1];
  id v39 = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:&v39 count:1];
  [v4 setSortDescriptors:v9];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v23 = [v11 count];
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    long long v32 = v22;
    __int16 v33 = 2112;
    __int16 v34 = v4;
    __int16 v35 = 2048;
    id v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v11;
    id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [[MOContext alloc] initWithContextMO:*(void *)(*((void *)&v25 + 1) + 8 * (void)v20)];
          if (v21) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v21];
          }

          uint64_t v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v18);
    }
  }
  [v3 reset];
}

- (MOContextPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

void __40__MOContextStore_storeContexts_handler___block_invoke_cold_1(uint64_t a1, id *a2)
{
  [*a2 count];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v2, v3, "saving contexts error, %@, contexts count, %lu", v4, v5, v6, v7, v8);
}

void __40__MOContextStore_storeContexts_handler___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "storeContexts: '%@'", a1, 0xCu);
}

void __41__MOContextStore_removeContexts_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v2, v3, "context deletion operation error, %@, contexts count %lu", v4, v5, v6, v7, v8);
}

void __50__MOContextStore_removeExpiredContextWithHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v2, v3, "expired context deletion operation error, %@, contexts count %lu", v4, v5, v6, v7, v8);
}

@end