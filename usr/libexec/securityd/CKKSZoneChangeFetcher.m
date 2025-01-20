@interface CKKSZoneChangeFetcher
- (BOOL)halted;
- (BOOL)newRequests;
- (BOOL)sendMetric;
- (CKContainer)container;
- (CKKSFetchAllRecordZoneChangesOperation)currentFetch;
- (CKKSNearFutureScheduler)fetchScheduler;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSResultOperation)currentProcessResult;
- (CKKSResultOperation)holdOperation;
- (CKKSZoneChangeFetchDependencyOperation)inflightFetchDependency;
- (CKKSZoneChangeFetchDependencyOperation)successfulFetchDependency;
- (CKKSZoneChangeFetcher)initWithContainer:(id)a3 fetchClass:(Class)a4 reachabilityTracker:(id)a5 altDSID:(id)a6 sendMetric:(BOOL)a7;
- (Class)fetchRecordZoneChangesOperationClass;
- (NSError)lastCKFetchError;
- (NSMapTable)clientMap;
- (NSMutableSet)apnsPushes;
- (NSMutableSet)currentFetchReasons;
- (NSMutableSet)inflightFetchDependencies;
- (NSOperationQueue)operationQueue;
- (NSString)altDSID;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)createSuccessfulFetchDependency;
- (id)inflightFetch;
- (id)requestFetchDueToAPNS:(id)a3;
- (id)requestSuccessfulFetch:(id)a3;
- (id)requestSuccessfulFetchForManyReasons:(id)a3;
- (id)strongClientMap;
- (void)_onqueueCreateNewFetch;
- (void)cancel;
- (void)halt;
- (void)holdFetchesUntil:(id)a3;
- (void)maybeCreateNewFetch;
- (void)maybeCreateNewFetchOnQueue;
- (void)notifyZoneChange:(id)a3;
- (void)registerClient:(id)a3 zoneID:(id)a4;
- (void)setAltDSID:(id)a3;
- (void)setApnsPushes:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setCurrentFetch:(id)a3;
- (void)setCurrentFetchReasons:(id)a3;
- (void)setCurrentProcessResult:(id)a3;
- (void)setFetchScheduler:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldOperation:(id)a3;
- (void)setInflightFetchDependencies:(id)a3;
- (void)setInflightFetchDependency:(id)a3;
- (void)setLastCKFetchError:(id)a3;
- (void)setName:(id)a3;
- (void)setNewRequests:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setSuccessfulFetchDependency:(id)a3;
@end

@implementation CKKSZoneChangeFetcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdOperation, 0);
  objc_storeStrong((id *)&self->_inflightFetchDependency, 0);
  objc_storeStrong((id *)&self->_inflightFetchDependencies, 0);
  objc_storeStrong((id *)&self->_successfulFetchDependency, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_apnsPushes, 0);
  objc_storeStrong((id *)&self->_currentFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentProcessResult, 0);
  objc_storeStrong((id *)&self->_currentFetch, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fetchScheduler, 0);
  objc_storeStrong((id *)&self->_lastCKFetchError, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_fetchRecordZoneChangesOperationClass, 0);
}

- (void)setHoldOperation:(id)a3
{
}

- (CKKSResultOperation)holdOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInflightFetchDependency:(id)a3
{
}

- (CKKSZoneChangeFetchDependencyOperation)inflightFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInflightFetchDependencies:(id)a3
{
}

- (NSMutableSet)inflightFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSuccessfulFetchDependency:(id)a3
{
}

- (CKKSZoneChangeFetchDependencyOperation)successfulFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNewRequests:(BOOL)a3
{
  self->_newRequests = a3;
}

- (BOOL)newRequests
{
  return self->_newRequests;
}

- (void)setApnsPushes:(id)a3
{
}

- (NSMutableSet)apnsPushes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentFetchReasons:(id)a3
{
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentProcessResult:(id)a3
{
}

- (CKKSResultOperation)currentProcessResult
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentFetch:(id)a3
{
}

- (CKKSFetchAllRecordZoneChangesOperation)currentFetch
{
  return (CKKSFetchAllRecordZoneChangesOperation *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientMap:(id)a3
{
}

- (NSMapTable)clientMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFetchScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)fetchScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setLastCKFetchError:(id)a3
{
}

- (NSError)lastCKFetchError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24, 1);
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)halt
{
  v3 = [(CKKSZoneChangeFetcher *)self fetchScheduler];
  [v3 cancel];

  v4 = [(CKKSZoneChangeFetcher *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD1DC;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = [(CKKSZoneChangeFetcher *)self currentFetch];
  [v5 cancel];

  v6 = [(CKKSZoneChangeFetcher *)self holdOperation];

  if (v6)
  {
    v7 = [(CKKSZoneChangeFetcher *)self currentFetch];
    v8 = [(CKKSZoneChangeFetcher *)self holdOperation];
    [v7 removeDependency:v8];
  }
  v9 = [(CKKSZoneChangeFetcher *)self currentFetch];
  [v9 waitUntilFinished];

  v10 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  [v10 waitUntilFinished];
}

- (void)cancel
{
  id v2 = [(CKKSZoneChangeFetcher *)self fetchScheduler];
  [v2 cancel];
}

- (void)holdFetchesUntil:(id)a3
{
}

- (id)createSuccessfulFetchDependency
{
  v3 = objc_alloc_init(CKKSZoneChangeFetchDependencyOperation);
  [(CKKSZoneChangeFetchDependencyOperation *)v3 setName:@"successful-fetch-dependency"];
  [(CKKSResultOperation *)v3 setDescriptionErrorCode:2];
  [(CKKSZoneChangeFetchDependencyOperation *)v3 setOwner:self];

  return v3;
}

- (void)_onqueueCreateNewFetch
{
  v3 = [(CKKSZoneChangeFetcher *)self queue];
  dispatch_assert_queue_V2(v3);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v38 = [(CKKSZoneChangeFetcher *)self successfulFetchDependency];
  [(CKKSZoneChangeFetcher *)self setInflightFetchDependency:v38];
  v4 = [(CKKSZoneChangeFetcher *)self inflightFetchDependencies];
  [v4 addObject:v38];

  [(CKKSZoneChangeFetcher *)self setNewRequests:0];
  v5 = [(CKKSZoneChangeFetcher *)self createSuccessfulFetchDependency];
  [(CKKSZoneChangeFetcher *)self setSuccessfulFetchDependency:v5];

  v6 = [(CKKSZoneChangeFetcher *)self currentFetchReasons];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  [(CKKSZoneChangeFetcher *)self setCurrentFetchReasons:v7];

  v8 = +[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:1];
  v47 = v8;
  v9 = +[NSArray arrayWithObjects:&v47 count:1];
  v10 = [v6 sortedArrayUsingDescriptors:v9];
  v11 = [v10 componentsJoinedByString:@","];

  v12 = sub_1000CD884(@"ckksfetcher", 0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting a new fetch, reasons: %@", buf, 0xCu);
  }

  v13 = [(CKKSZoneChangeFetcher *)self apnsPushes];
  id v14 = objc_alloc_init((Class)NSMutableSet);
  [(CKKSZoneChangeFetcher *)self setApnsPushes:v14];

  v15 = +[CKOperationGroup CKKSGroupWithName:v11];
  v16 = [(CKKSZoneChangeFetcher *)self strongClientMap];
  if (![v16 count])
  {
    v17 = sub_1000CD884(@"ckksfetcher", 0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No clients", buf, 2u);
    }
  }
  v18 = [CKKSFetchAllRecordZoneChangesOperation alloc];
  v19 = [(CKKSZoneChangeFetcher *)self container];
  v20 = [(CKKSZoneChangeFetcher *)self fetchRecordZoneChangesOperationClass];
  v21 = [(CKKSZoneChangeFetcher *)self altDSID];
  LOBYTE(v37) = [(CKKSZoneChangeFetcher *)self sendMetric];
  v22 = [(CKKSFetchAllRecordZoneChangesOperation *)v18 initWithContainer:v19 fetchClass:v20 clientMap:v16 fetchReasons:v6 apnsPushes:v13 forceResync:0 ckoperationGroup:v15 altDSID:v21 sendMetric:v37];

  if ([v6 containsObject:@"network"])
  {
    v23 = sub_1000CD884(@"ckksfetcher", 0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "blocking fetch on network reachability", buf, 2u);
    }

    v24 = [(CKKSZoneChangeFetcher *)self reachabilityTracker];
    v25 = [v24 reachabilityDependency];
    [(CKKSFetchAllRecordZoneChangesOperation *)v22 addNullableDependency:v25];
  }
  v26 = [(CKKSZoneChangeFetcher *)self holdOperation];
  [(CKKSFetchAllRecordZoneChangesOperation *)v22 addNullableDependency:v26];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001CD85C;
  v39[3] = &unk_100306EA0;
  objc_copyWeak(&v43, &location);
  v27 = v22;
  v40 = v27;
  id v28 = v6;
  id v41 = v28;
  id v29 = v13;
  id v42 = v29;
  v30 = +[CKKSResultOperation operationWithBlock:v39];
  [(CKKSZoneChangeFetcher *)self setCurrentProcessResult:v30];

  v31 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  [v31 setName:@"zone-change-fetcher-worker"];

  v32 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  [v32 addDependency:v27];

  v33 = [(CKKSZoneChangeFetcher *)self operationQueue];
  v34 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  [v33 addOperation:v34];

  [(CKKSZoneChangeFetcher *)self setCurrentFetch:v27];
  v35 = [(CKKSZoneChangeFetcher *)self operationQueue];
  v36 = [(CKKSZoneChangeFetcher *)self currentFetch];
  [v35 addOperation:v36];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)maybeCreateNewFetch
{
  v3 = [(CKKSZoneChangeFetcher *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CDFD4;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)maybeCreateNewFetchOnQueue
{
  v3 = [(CKKSZoneChangeFetcher *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CKKSZoneChangeFetcher *)self halted])
  {
    v4 = sub_1000CD884(@"ckksfetcher", 0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Halted; not starting a new fetch", buf, 2u);
    }

    return;
  }
  if (![(CKKSZoneChangeFetcher *)self newRequests]) {
    return;
  }
  id v9 = [(CKKSZoneChangeFetcher *)self currentFetch];
  if (v9)
  {
    v3 = [(CKKSZoneChangeFetcher *)self currentFetch];
    if (([v3 isFinished] & 1) == 0)
    {

      return;
    }
  }
  uint64_t v5 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  if (!v5)
  {
    if (v9)
    {
    }
    goto LABEL_18;
  }
  v6 = (void *)v5;
  id v7 = [(CKKSZoneChangeFetcher *)self currentProcessResult];
  unsigned __int8 v8 = [v7 isFinished];

  if (v9)
  {
  }
  if (v8)
  {
LABEL_18:
    [(CKKSZoneChangeFetcher *)self _onqueueCreateNewFetch];
  }
}

- (id)inflightFetch
{
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1001CE298;
  v11 = sub_1001CE2A8;
  id v12 = 0;
  v3 = [(CKKSZoneChangeFetcher *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CE2B0;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)requestSuccessfulFetchForManyReasons:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1001CE298;
  v16 = sub_1001CE2A8;
  id v17 = 0;
  uint64_t v5 = [(CKKSZoneChangeFetcher *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CE474;
  block[3] = &unk_100306E50;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)requestFetchDueToAPNS:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v5 = [(CKKSZoneChangeFetcher *)self strongClientMap];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [v5 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        if ([v11 zoneIsReadyForFetching:v10])
        {
          *((unsigned char *)v27 + 24) = 0;

          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v12 = [(CKKSZoneChangeFetcher *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CE7DC;
  block[3] = &unk_100306E50;
  id v13 = v4;
  id v19 = v13;
  v20 = self;
  v21 = &v26;
  dispatch_sync(v12, block);

  if (*((unsigned char *)v27 + 24))
  {
    uint64_t v14 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping fetching size no zone is ready", v17, 2u);
    }
    v15 = 0;
  }
  else
  {
    uint64_t v14 = +[NSSet setWithObject:@"apns"];
    v15 = [(CKKSZoneChangeFetcher *)self requestSuccessfulFetchForManyReasons:v14];
  }

  _Block_object_dispose(&v26, 8);

  return v15;
}

- (void)notifyZoneChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000CD884(@"ckkspush", 0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received a zone change notification for %@ %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CKKSZoneChangeFetcher *)self requestFetchDueToAPNS:v4];
}

- (id)requestSuccessfulFetch:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  uint64_t v5 = [(CKKSZoneChangeFetcher *)self requestSuccessfulFetchForManyReasons:v4];

  return v5;
}

- (id)strongClientMap
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(CKKSZoneChangeFetcher *)self clientMap];
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CKKSZoneChangeFetcher *)self clientMap];
  id v6 = [v5 keyEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [(CKKSZoneChangeFetcher *)self clientMap];
        uint64_t v12 = [v11 objectForKey:v10];

        if (v12) {
          [v3 setObject:v12 forKeyedSubscript:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);

  return v3;
}

- (void)registerClient:(id)a3 zoneID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(CKKSZoneChangeFetcher *)self clientMap];
  objc_sync_enter(v7);
  uint64_t v8 = [(CKKSZoneChangeFetcher *)self clientMap];
  [v8 setObject:v9 forKey:v6];

  objc_sync_exit(v7);
}

- (NSString)description
{
  v3 = [(CKKSZoneChangeFetcher *)self fetchScheduler];
  id v4 = [v3 nextFireTime];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v6 = [(CKKSZoneChangeFetcher *)self name];
    id v7 = [v5 stringFromDate:v4];
    uint64_t v8 = +[NSString stringWithFormat:@"<CKKSZoneChangeFetcher(%@): next fetch at %@", v6, v7];
  }
  else
  {
    id v5 = [(CKKSZoneChangeFetcher *)self name];
    uint64_t v8 = +[NSString stringWithFormat:@"<CKKSZoneChangeFetcher(%@): no pending fetches", v5];
  }

  return (NSString *)v8;
}

- (CKKSZoneChangeFetcher)initWithContainer:(id)a3 fetchClass:(Class)a4 reachabilityTracker:(id)a5 altDSID:(id)a6 sendMetric:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v47.receiver = self;
  v47.super_class = (Class)CKKSZoneChangeFetcher;
  long long v16 = [(CKKSZoneChangeFetcher *)&v47 init];
  long long v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a3);
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a4);
    objc_storeStrong((id *)&v17->_reachabilityTracker, a5);
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentFetchReasons = v17->_currentFetchReasons;
    v17->_currentFetchReasons = v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    apnsPushes = v17->_apnsPushes;
    v17->_apnsPushes = v20;

    uint64_t v22 = +[NSMapTable strongToWeakObjectsMapTable];
    clientMap = v17->_clientMap;
    v17->_clientMap = (NSMapTable *)v22;

    name = v17->_name;
    v17->_name = (NSString *)@"zone-change-fetcher";

    long long v25 = [(NSString *)v17->_name UTF8String];
    uint64_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v27;

    char v29 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = v29;

    uint64_t v31 = [(CKKSZoneChangeFetcher *)v17 createSuccessfulFetchDependency];
    successfulFetchDependency = v17->_successfulFetchDependency;
    v17->_successfulFetchDependency = (CKKSZoneChangeFetchDependencyOperation *)v31;

    uint64_t v33 = +[NSMutableSet set];
    inflightFetchDependencies = v17->_inflightFetchDependencies;
    v17->_inflightFetchDependencies = (NSMutableSet *)v33;

    inflightFetchDependency = v17->_inflightFetchDependency;
    v17->_inflightFetchDependency = 0;

    v17->_newRequests = 0;
    objc_storeStrong((id *)&v17->_altDSID, a6);
    v17->_sendMetric = a7;
    if (qword_10035CE18 != -1) {
      dispatch_once(&qword_10035CE18, &stru_1002F8ED0);
    }
    int v36 = byte_10035CE20;
    int v37 = byte_10035CE20;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v38 = [CKKSNearFutureScheduler alloc];
    if (v37) {
      uint64_t v39 = 6000000000;
    }
    else {
      uint64_t v39 = 120000000000;
    }
    if (v36) {
      uint64_t v40 = 100000000;
    }
    else {
      uint64_t v40 = 2000000000;
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1001CF270;
    v44[3] = &unk_1003077A0;
    objc_copyWeak(&v45, &location);
    id v41 = [(CKKSNearFutureScheduler *)v38 initWithName:@"zone-change-fetch-scheduler" initialDelay:v40 exponentialBackoff:v39 maximumDelay:0 keepProcessAlive:1000 dependencyDescriptionCode:v44 block:2.0];
    fetchScheduler = v17->_fetchScheduler;
    v17->_fetchScheduler = v41;

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

  return v17;
}

@end