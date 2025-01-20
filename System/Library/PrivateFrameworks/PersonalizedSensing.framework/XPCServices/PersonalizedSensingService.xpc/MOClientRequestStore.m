@interface MOClientRequestStore
- (MOClientRequestStore)initWithPersistenceManager:(id)a3;
- (MOContextPersistenceManager)persistenceManager;
- (OS_dispatch_queue)queue;
- (void)fetchMostRecentClientRequestWithHandler:(id)a3;
- (void)removeExpiredClientRequestsWithHandler:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeClientRequest:(id)a3 handler:(id)a4;
@end

@implementation MOClientRequestStore

- (MOClientRequestStore)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)MOClientRequestStore;
    v6 = [(MOClientRequestStore *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create("MOClientRequestStore", v8);
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

- (void)storeClientRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  if (v6)
  {
    v8 = [(MOClientRequestStore *)self persistenceManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __51__MOClientRequestStore_storeClientRequest_handler___block_invoke;
    v11[3] = &unk_1000A4DE0;
    v12 = v6;
    objc_super v13 = &v14;
    [v8 performBlockAndWait:v11];

    dispatch_queue_t v9 = v12;
  }
  else
  {
    dispatch_queue_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no client request to be saved", v10, 2u);
    }
  }

  if (v7) {
    v7[2](v7, v15[5]);
  }
  _Block_object_dispose(&v14, 8);
}

void __51__MOClientRequestStore_storeClientRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[MOClientRequestMO fetchRequest];
  id v5 = (uint64_t *)(a1 + 32);
  id v6 = [*(id *)(a1 + 32) requestIdentifier];
  v7 = +[NSPredicate predicateWithFormat:@"requestIdentifier == %@", v6];
  [v4 setPredicate:v7];

  id v31 = 0;
  v8 = [v3 executeFetchRequest:v4 error:&v31];
  id v9 = v31;
  if (v9)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __51__MOClientRequestStore_storeClientRequest_handler___block_invoke_cold_2(v9, v10);
    }

    goto LABEL_5;
  }
  if (![v8 count] || (objc_msgSend(v8, "lastObject"), (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_5:
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *v5;
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "save client request, %@", buf, 0xCu);
    }

    id v13 = +[MOClientRequestMO managedObjectWithClientRequest:*v5 inManagedObjectContext:v3];
    goto LABEL_8;
  }
  v27 = (void *)v26;
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = *v5;
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "update client request, %@", buf, 0xCu);
  }

  +[MOClientRequestMO updateManagedObject:v27 withClientRequest:*v5 inManagedObjectContext:v3];
LABEL_8:
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = a1 + 40;
  uint64_t v16 = *(void *)(v15 + 8);
  id obj = *(id *)(v16 + 40);
  unsigned __int8 v17 = [v3 save:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
  id v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *v5;
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "saving client request succeeded, client request, %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __51__MOClientRequestStore_storeClientRequest_handler___block_invoke_cold_1(v14, v5, v19);
  }

  if (v9 && !*(void *)(*(void *)(*(void *)v14 + 8) + 40))
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"MOClientRequestStore:storeClientRequest persistence error";
    v21 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v22 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:2058 userInfo:v21];
    uint64_t v23 = +[NSError errorUsingError:v22 withUnderyingError:v9];
    uint64_t v24 = *(void *)(*(void *)v14 + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  [v3 reset];
}

- (void)fetchMostRecentClientRequestWithHandler:(id)a3
{
  id v5 = (void (**)(id, void, uint64_t))a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  unsigned __int8 v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v10 = 0;
  v11[0] = &v10;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__3;
  v11[3] = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v6 = [(MOClientRequestStore *)self persistenceManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __64__MOClientRequestStore_fetchMostRecentClientRequestWithHandler___block_invoke;
  v9[3] = &unk_1000A4F18;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = &v13;
  [v6 performBlockAndWait:v9];

  if (v5)
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = NSStringFromSelector(a2);
      -[MOClientRequestStore fetchMostRecentClientRequestWithHandler:](v8, (uint64_t)v11, buf, v7);
    }

    v5[2](v5, *(void *)(v11[0] + 40), v14[5]);
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v13, 8);
}

void __64__MOClientRequestStore_fetchMostRecentClientRequestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[MOClientRequestMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"requestType == %lu", 2];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:1];
  id v28 = v6;
  v7 = +[NSArray arrayWithObjects:&v28 count:1];
  [v4 setSortDescriptors:v7];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v17 = [v9 count];
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v4;
    __int16 v24 = 2048;
    id v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) && [v9 count])
  {
    v11 = [MOClientRequest alloc];
    id v12 = [v9 lastObject];
    uint64_t v13 = [(MOClientRequest *)v11 initWithClientRequestMO:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  [v3 reset];
}

- (void)removeExpiredClientRequestsWithHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  id v6 = [(MOClientRequestStore *)self persistenceManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __63__MOClientRequestStore_removeExpiredClientRequestsWithHandler___block_invoke;
  v7[3] = &unk_1000A4E30;
  v7[4] = &v8;
  v7[5] = a2;
  [v6 performBlockAndWait:v7];

  if (v5) {
    v5[2](v5, v9[5]);
  }
  _Block_object_dispose(&v8, 8);
}

void __63__MOClientRequestStore_removeExpiredClientRequestsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[NSDate date];
  id v5 = +[NSDate dateWithTimeInterval:v4 sinceDate:-2419200.0];

  id v6 = +[MOClientRequestMO fetchRequest];
  v7 = +[NSPredicate predicateWithFormat:@"creationDate < %@ ", v5];
  [v6 setPredicate:v7];

  [v6 setReturnsObjectsAsFaults:0];
  uint64_t v8 = a1 + 32;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v3 executeFetchRequest:v6 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v22 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v23 = [v10 count];
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v33 = v22;
    __int16 v34 = 2112;
    uint64_t v35 = v6;
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
    id v19 = _mo_log_facility_get_os_log(&MOLogFacilityClientRequestStore);
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [v12 count];
        *(_DWORD *)buf = 134217984;
        id v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "expired client request deletion operation succeeded, contexts count %lu", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __63__MOClientRequestStore_removeExpiredClientRequestsWithHandler___block_invoke_cold_1(v8, v12, v20);
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

void __51__MOClientRequestStore_storeClientRequest_handler___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "saving client request hit error, %@, client request, %@", (uint8_t *)&v5, 0x16u);
}

void __51__MOClientRequestStore_storeClientRequest_handler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "storeClientRequest: '%@'", (uint8_t *)&v4, 0xCu);
}

- (void)fetchMostRecentClientRequestWithHandler:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@, most recent client request fetched, %@", buf, 0x16u);
}

void __63__MOClientRequestStore_removeExpiredClientRequestsWithHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "expired client request deletion operation error, %@, contexts count %lu", (uint8_t *)&v5, 0x16u);
}

@end