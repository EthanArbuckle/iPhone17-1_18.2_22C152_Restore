@interface BMRapportSyncEngine
- (BMDistributedSyncMultiStreamManager)primarySyncManager;
- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 primaryDatabase:(id)a5;
- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 rapportManager:(id)a5 atomBatchChunkerPolicy:(id)a6 primaryDatabase:(id)a7;
- (BMSyncDatabase)primaryDatabase;
- (BMSyncDevicePeerStatusTracker)peerStatusTracker;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4;
- (OS_dispatch_queue)queue;
- (id)accountFromRapportOptions:(id)a3;
- (id)buildAtomBatchRequestWithIsReciprocal:(BOOL)a3 syncReason:(unint64_t)a4 sequenceNumber:(unint64_t)a5 transportType:(unint64_t)a6 device:(id)a7;
- (id)createDistributedSyncManagerForAccount:(id)a3;
- (id)fetchAtomBatchesRequestHandler;
- (id)reciprocalCompletionBlock;
- (id)siteSuffix;
- (unsigned)protocolVersion;
- (void)_startServerWithCompletion:(id)a3;
- (void)completeRequest:(id)a3 deliveredToDevices:(id)a4 withErrors:(id)a5;
- (void)completeRequestIfDeliveredToAllNearbyDevices:(id)a3;
- (void)fetchAtomBatchesFromDevices:(id)a3 isReciprocal:(BOOL)a4 reason:(unint64_t)a5 activity:(id)a6 completionHandler:(id)a7;
- (void)fetchAtomBatchesIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)finishRequest:(id)a3 toDevice:(id)a4 withError:(id)a5 peerInfo:(id)a6 peerStatusTracker:(id)a7;
- (void)handleFetchAtomBatchesResponse:(id)a3 options:(id)a4 error:(id)a5 fromDevice:(id)a6 forRequest:(id)a7 isReciprocal:(BOOL)a8;
- (void)rapportManager:(id)a3 didDiscoverBMRapportDevice:(id)a4;
- (void)rapportManagerDiscoveryTimedOut:(id)a3;
- (void)registerRequests;
- (void)runRequest:(id)a3 onDevice:(id)a4;
- (void)sendFetchAtomBatchesRequest:(id)a3 toDevice:(id)a4 forRequest:(id)a5;
- (void)setMetricsCollector:(id)a3;
- (void)setReciprocalCompletionBlock:(id)a3;
- (void)startClient;
- (void)startServer;
- (void)startServerWithCompletion:(id)a3;
- (void)syncNowWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
@end

@implementation BMRapportSyncEngine

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 primaryDatabase:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BMRapportSyncEngine;
  v12 = [(BMRapportSyncEngine *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primarySyncManager, a4);
    uint64_t v14 = [v10 peerStatusTracker];
    peerStatusTracker = v13->_peerStatusTracker;
    v13->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v14;

    uint64_t v16 = [v10 metricsCollector];
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v16;

    objc_storeStrong((id *)&v13->_queue, a3);
    v18 = [[BMRapportManager alloc] initWithQueue:v9];
    rapportManager = v13->_rapportManager;
    v13->_rapportManager = v18;

    [(BMRapportManager *)v13->_rapportManager setDelegate:v13];
    v20 = [v10 peerStatusTracker];
    v21 = [v20 localDeviceIdentifierCreatingIfNecessary];
    v22 = (NSString *)[v21 copy];
    localDeviceIdentifier = v13->_localDeviceIdentifier;
    v13->_localDeviceIdentifier = v22;

    v24 = [[BMAtomBatchMaxBytes alloc] initWithMaxBytes:0x200000];
    atomBatchChunkerPolicy = v13->_atomBatchChunkerPolicy;
    v13->_atomBatchChunkerPolicy = (BMAtomBatchChunkerPolicy *)v24;

    objc_storeStrong((id *)&v13->_primaryDatabase, a5);
  }

  return v13;
}

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 rapportManager:(id)a5 atomBatchChunkerPolicy:(id)a6 primaryDatabase:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)BMRapportSyncEngine;
  v17 = [(BMRapportSyncEngine *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_primarySyncManager, a4);
    uint64_t v19 = [v13 peerStatusTracker];
    peerStatusTracker = v18->_peerStatusTracker;
    v18->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v19;

    uint64_t v21 = [v13 metricsCollector];
    metricsCollector = v18->_metricsCollector;
    v18->_metricsCollector = (BMSyncSessionMetricsCollector *)v21;

    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_rapportManager, a5);
    [(BMRapportManager *)v18->_rapportManager setDelegate:v18];
    objc_storeStrong((id *)&v18->_atomBatchChunkerPolicy, a6);
    v23 = [v13 peerStatusTracker];
    v24 = [v23 localDeviceIdentifierCreatingIfNecessary];
    v25 = (NSString *)[v24 copy];
    localDeviceIdentifier = v18->_localDeviceIdentifier;
    v18->_localDeviceIdentifier = v25;

    objc_storeStrong((id *)&v18->_primaryDatabase, a7);
  }

  return v18;
}

- (void)startClient
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D1C;
  block[3] = &unk_10006CB58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startServer
{
}

- (void)startServerWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009DC4;
  v7[3] = &unk_10006CB80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_startServerWithCompletion:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(BMRapportSyncEngine *)self registerRequests];
  [(BMRapportManager *)self->_rapportManager start];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009F08;
  v13[3] = &unk_10006CBA8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)syncNowWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A010;
  block[3] = &unk_10006CBD0;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)completeRequestIfDeliveredToAllNearbyDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v36 = self;
  id v5 = [(BMRapportManager *)self->_rapportManager discoveredDevices];
  id v6 = +[NSSet setWithArray:v5];

  v7 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v14 = [v4 deliveredToDevices];
        unsigned int v15 = [v14 containsObject:v13];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v10);
  }

  if ([v8 isSubsetOfSet:v7])
  {
    id v16 = [v4 deliveredToDevices];
    [v7 unionSet:v16];

    id v17 = (id)objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v7;
    id v19 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          v24 = [v23 bmDeviceIdentifier];

          if (v24)
          {
            v25 = [v23 bmDeviceIdentifier];
            [v17 addObject:v25];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v20);
    }

    v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v27 = [(BMRapportSyncEngine *)v36 siteSuffix];
      id v28 = [v4 inFlightToDevices];
      *(_DWORD *)buf = 138412546;
      v49 = v27;
      __int16 v50 = 2112;
      v51 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: completing request, still inflight: %@", buf, 0x16u);
    }
    objc_super v29 = objc_opt_new();
    v30 = [v4 errorFromDevice];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000A4A8;
    v37[3] = &unk_10006CBF8;
    id v31 = v4;
    id v38 = v31;
    id v39 = v29;
    v32 = v29;
    [v30 enumerateKeysAndObjectsUsingBlock:v37];

    v33 = [v17 allObjects];
    [(BMRapportSyncEngine *)v36 completeRequest:v31 deliveredToDevices:v33 withErrors:v32];
  }
  else
  {
    id v17 = [v8 mutableCopy];
    [v17 minusSet:v7];
    v32 = __biome_log_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [(BMRapportSyncEngine *)v36 siteSuffix];
      v35 = [v4 inFlightToDevices];
      *(_DWORD *)buf = 138412802;
      v49 = v34;
      __int16 v50 = 2112;
      v51 = v35;
      __int16 v52 = 2112;
      id v53 = v17;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request(s) still inflight: %@, nearbyAndNotDelivered: %@", buf, 0x20u);
    }
  }
}

- (void)completeRequest:(id)a3 deliveredToDevices:(id)a4 withErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 state] == (id)2)
  {
    uint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(BMRapportSyncEngine *)self siteSuffix];
      int v23 = 138412546;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request %@ already finished running", (uint8_t *)&v23, 0x16u);
    }
LABEL_8:

    goto LABEL_9;
  }
  [v8 setState:2];
  metricsCollector = self->_metricsCollector;
  id v14 = [v8 sessionContext];
  unsigned int v15 = [v14 sessionID];
  id v16 = [(BMSyncDatabase *)self->_primaryDatabase lastRapportSyncDate];
  [(BMSyncSessionMetricsCollector *)metricsCollector recordSessionEnd:v15 lastSyncDate:v16];

  primaryDatabase = self->_primaryDatabase;
  id v18 = objc_opt_new();
  [(BMSyncDatabase *)primaryDatabase setLastRapportSyncDate:v18];

  id v19 = [v8 completionHandler];

  if (v19)
  {
    id v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(BMRapportSyncEngine *)self siteSuffix];
      int v23 = 138412802;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: completeRequest:deliveredToDevices %@ withErrors:%@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v11 = [v8 completionHandler];
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v9, v10);
    goto LABEL_8;
  }
LABEL_9:
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;
}

- (void)runRequest:(id)a3 onDevice:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 deliveredToDevices];
  if ([v6 containsObject:v5])
  {
  }
  else
  {
    v7 = [v9 inFlightToDevices];
    unsigned __int8 v8 = [v7 containsObject:v5];

    if ((v8 & 1) == 0) {
      [v9 runRequestOnDevice:v5];
    }
  }
}

- (void)fetchAtomBatchesIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentRequest)
  {
    id v12 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:14 userInfo:0];
    long long v40 = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:&v40 count:1];
    v11[2](v11, &__NSArray0__struct, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    id v26 = +[NSUUID UUID];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000AE58;
    v35[3] = &unk_10006CC20;
    objc_copyWeak(v36, &location);
    BOOL v37 = v8;
    v35[4] = self;
    v36[1] = (id)a4;
    __int16 v25 = objc_retainBlock(v35);
    id v14 = [[BMRapportRequest alloc] initWithUUID:v26 activity:v10 requestBlock:v25 queue:self->_queue completionHandler:v11];
    objc_initWeak(&from, v14);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000AFF4;
    v31[3] = &unk_10006CC48;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31[4] = self;
    [(BMRapportRequest *)v14 setRequestTimeoutHandler:v31];
    unsigned int v15 = [(BMSyncSessionMetricsCollector *)self->_metricsCollector sessionContext];
    [(BMRapportRequest *)v14 setSessionContext:v15];

    metricsCollector = self->_metricsCollector;
    id v17 = [(BMRapportRequest *)v14 sessionContext];
    id v18 = [v17 sessionID];
    [(BMSyncSessionMetricsCollector *)metricsCollector recordSessionStart:v18 transport:2 reason:a4 isReciprocal:v8];

    objc_storeStrong((id *)&self->_currentRequest, v14);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = [(BMRapportManager *)self->_rapportManager discoveredDevices];
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          [(BMRapportSyncEngine *)self runRequest:v14 onDevice:v23];
        }
        id v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v20);
    }

    [(BMRapportManager *)self->_rapportManager start];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);

    objc_destroyWeak(v36);
    objc_destroyWeak(&location);
  }
}

- (void)fetchAtomBatchesFromDevices:(id)a3 isReciprocal:(BOOL)a4 reason:(unint64_t)a5 activity:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v33 = a6;
  v34 = (void (**)(id, void *, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentRequest)
  {
    uint64_t v13 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:14 userInfo:0];
    v54 = v13;
    id v14 = +[NSArray arrayWithObjects:&v54 count:1];
    v34[2](v34, &__NSArray0__struct, v14);
  }
  else
  {
    v36 = self;
    objc_initWeak(&location, self);
    id v32 = +[NSUUID UUID];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000B630;
    v45[3] = &unk_10006CC20;
    objc_copyWeak(v46, &location);
    BOOL v47 = v10;
    v45[4] = self;
    v46[1] = (id)a5;
    id v31 = objc_retainBlock(v45);
    v35 = [[BMRapportRequest alloc] initWithUUID:v32 activity:v33 requestBlock:v31 queue:self->_queue completionHandler:v34];
    objc_initWeak(&from, v35);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000B7C0;
    v41[3] = &unk_10006CC48;
    objc_copyWeak(&v42, &location);
    objc_copyWeak(&v43, &from);
    v41[4] = self;
    [(BMRapportRequest *)v35 setRequestTimeoutHandler:v41];
    unsigned int v15 = [(BMSyncSessionMetricsCollector *)self->_metricsCollector sessionContext];
    [(BMRapportRequest *)v35 setSessionContext:v15];

    metricsCollector = self->_metricsCollector;
    id v17 = [(BMRapportRequest *)v35 sessionContext];
    id v18 = [v17 sessionID];
    [(BMSyncSessionMetricsCollector *)metricsCollector recordSessionStart:v18 transport:2 reason:a5 isReciprocal:v10];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v19 = [(BMRapportManager *)self->_rapportManager discoveredDevices];
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          __int16 v25 = [v23 rapportIdentifier];
          unsigned int v26 = [v12 containsObject:v25];

          if (v26)
          {
            long long v27 = __biome_log_for_category();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = v12;
              long long v29 = [(BMRapportSyncEngine *)v36 siteSuffix];
              long long v30 = [v23 rapportIdentifier];
              *(_DWORD *)buf = 138412546;
              __int16 v50 = v29;
              __int16 v51 = 2112;
              __int16 v52 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: Specified Rapport device %@ found, sending sync request", buf, 0x16u);

              id v12 = v28;
            }

            [(BMRapportSyncEngine *)v36 runRequest:v35 onDevice:v23];
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v20);
    }

    [(BMRapportManager *)v36->_rapportManager start];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&from);

    objc_destroyWeak(v46);
    objc_destroyWeak(&location);
  }
}

- (void)sendFetchAtomBatchesRequest:(id)a3 toDevice:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 dictionaryRepresentation];
  rapportManager = self->_rapportManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BA20;
  v16[3] = &unk_10006CC70;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  [(BMRapportManager *)rapportManager sendRequest:@"com.apple.biomesyncd.fetchAtomBatches" request:v11 toDevice:v15 responseHandler:v16];
}

- (id)buildAtomBatchRequestWithIsReciprocal:(BOOL)a3 syncReason:(unint64_t)a4 sequenceNumber:(unint64_t)a5 transportType:(unint64_t)a6 device:(id)a7
{
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = [v12 account];
  id v14 = [(BMRapportSyncEngine *)self createDistributedSyncManagerForAccount:v13];

  if (v14)
  {
    uint64_t v23 = [v14 clockVectorForStreamsSupportingTransportType:a6 direction:1 device:v12];
    id v15 = +[BMMultiStreamVectorClockConverter multiStreamTimestampClockVectorToVectorClock:v23];
    id v16 = [v14 rangeClockVectorForStreamsSupportingTransportType:a6 direction:1 device:v12];
    id v17 = objc_opt_new();
    [v17 setProtocolVersion:-[BMRapportSyncEngine protocolVersion](self, "protocolVersion")];
    [v14 peerStatusTracker];
    id v19 = v18 = v10;
    id v20 = [v19 localDeviceUpdatingIfNeccesaryWithProtocolVersion:-[BMRapportSyncEngine protocolVersion](self, "protocolVersion")];
    [v17 setPeer:v20];

    [v17 setWalltime:CFAbsoluteTimeGetCurrent()];
    [v17 setSyncReason:a4];
    [v17 setBatchSize:0x200000];
    [v17 setBatchSequenceNumber:a5];
    [v17 setVectorClock:v15];
    [v17 setRangeClockVectors:v16];
    [v17 setIsReciprocalRequest:v18];
    [v17 setAtomBatchVersion:2];
  }
  else
  {
    uint64_t v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100044480();
    }

    id v17 = 0;
  }

  return v17;
}

- (void)registerRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = RPOptionStatusFlags;
  v7 = &off_100072CE8;
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  rapportManager = self->_rapportManager;
  id v5 = [(BMRapportSyncEngine *)self fetchAtomBatchesRequestHandler];
  [(BMRapportManager *)rapportManager registerRequestID:@"com.apple.biomesyncd.fetchAtomBatches" options:v3 requestHandler:v5];
}

- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4
{
  id v5 = a4;
  id v6 = +[BMDeviceMetadataUtils platform];
  id v7 = [v5 platform];
  if (v6 != (id)6)
  {
    if (v7 != (id)6) {
      goto LABEL_12;
    }
    if (v6 == (id)2)
    {
      id v13 = [v5 device];
      unsigned __int8 v14 = [v13 statusFlags];

      if (v14) {
        goto LABEL_12;
      }
    }
LABEL_9:
    BOOL v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(BMRapportSyncEngine *)self siteSuffix];
      int v17 = 138412546;
      BOOL v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "BMRapportSyncEngine%@: current platform disallowed from syncing with non-paired watch: %@";
      goto LABEL_16;
    }
LABEL_17:

    BOOL v15 = 0;
    goto LABEL_18;
  }
  if (v7 != (id)2
    || ([v5 device],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 statusFlags],
        v8,
        (v9 & 1) == 0))
  {
    BOOL v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(BMRapportSyncEngine *)self siteSuffix];
      int v17 = 138412546;
      BOOL v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "BMRapportSyncEngine%@: current watch disallowed from syncing with non-paired device: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 0x16u);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ([v5 platform] == (id)6) {
    goto LABEL_9;
  }
LABEL_12:
  if (!-[BMDistributedSyncMultiStreamManager supportsSyncingWithPlatform:overTransport:inDirection:](self->_primarySyncManager, "supportsSyncingWithPlatform:overTransport:inDirection:", [v5 platform], 2, 3))
  {
    BOOL v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(BMRapportSyncEngine *)self siteSuffix];
      int v17 = 138412546;
      BOOL v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "BMRapportSyncEngine%@: syncing with device platform disallowed for device: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (void)rapportManager:(id)a3 didDiscoverBMRapportDevice:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  [(BMRapportSyncEngine *)self runRequest:self->_currentRequest onDevice:v6];
}

- (void)rapportManagerDiscoveryTimedOut:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:6 userInfo:0];
  id v5 = [(BMRapportRequest *)self->_currentRequest completionHandler];

  if (v5)
  {
    id v6 = [(BMRapportRequest *)self->_currentRequest completionHandler];
    id v8 = v4;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    ((void (**)(void, void *, void *))v6)[2](v6, &__NSArray0__struct, v7);
  }
  [(BMRapportManager *)self->_rapportManager stop];
}

- (id)fetchAtomBatchesRequestHandler
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C218;
  v5[3] = &unk_10006CCC0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)handleFetchAtomBatchesResponse:(id)a3 options:(id)a4 error:(id)a5 fromDevice:(id)a6 forRequest:(id)a7 isReciprocal:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v77 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BMSyncCore resetEagerExitTimer];
  id v18 = [[BMFetchAtomBatchesResponse alloc] initFromDictionary:v14];
  __int16 v19 = [v18 peer];
  id v20 = [v15 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
  [v19 setIdsDeviceIdentifier:v20];

  v76 = v15;
  v75 = [(BMRapportSyncEngine *)self accountFromRapportOptions:v15];
  uint64_t v21 = -[BMRapportSyncEngine createDistributedSyncManagerForAccount:](self, "createDistributedSyncManagerForAccount:");
  v22 = (void *)v21;
  if (v21)
  {
    if (v16)
    {
      uint64_t v23 = (void *)v21;
      v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        [(BMRapportSyncEngine *)self siteSuffix];
        id v74 = v17;
        id v64 = v16;
        v66 = id v65 = v14;
        *(_DWORD *)buf = 138413058;
        v79 = v66;
        __int16 v80 = 2112;
        uint64_t v81 = (uint64_t)v65;
        __int16 v82 = 2112;
        id v83 = v64;
        __int16 v84 = 2112;
        id v85 = v74;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "BMRapportSyncEngine%@: handleFetchAtomBatchesResponse %@ error %@ fromDevice: %@", buf, 0x2Au);

        id v14 = v65;
        id v16 = v64;
        id v17 = v74;
      }

      v22 = v23;
      id v25 = [v23 peerStatusTracker];
      [(BMRapportSyncEngine *)self finishRequest:v77 toDevice:v17 withError:v16 peerInfo:v19 peerStatusTracker:v25];
      goto LABEL_32;
    }
    BOOL v68 = v8;
    id v72 = v14;
    id v25 = [v14 mutableCopy];
    long long v27 = [v25 objectForKeyedSubscript:@"deletedLocations"];
    if (v27) {
      CFStringRef v28 = @"... redacted due to size ...";
    }
    else {
      CFStringRef v28 = 0;
    }
    [v25 setObject:v28 forKeyedSubscript:@"deletedLocations"];

    long long v29 = __biome_log_for_category();
    id v73 = v17;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = [(BMRapportSyncEngine *)self siteSuffix];
      id v31 = [v17 shortenedRapportIdentifier];
      *(_DWORD *)buf = 138413058;
      v79 = v30;
      __int16 v80 = 2112;
      uint64_t v81 = (uint64_t)v31;
      __int16 v82 = 2112;
      id v83 = v25;
      __int16 v84 = 2112;
      id v85 = v15;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: received response from BMRapportDevice[%@] %@ %@", buf, 0x2Au);

      id v17 = v73;
    }

    id v32 = [v19 deviceIdentifier];
    if (v32)
    {
      [v17 setBmDeviceIdentifier:v32];
      metricsCollector = self->_metricsCollector;
      id v34 = [v18 atomBatchBytes];
      v70 = self;
      v35 = v19;
      id v36 = v25;
      id v37 = v18;
      id v38 = v17;
      id v39 = v34;
      long long v40 = [v77 sessionContext];
      id v41 = v39;
      id v17 = v38;
      id v18 = v37;
      id v25 = v36;
      __int16 v19 = v35;
      self = v70;
      [(BMSyncSessionMetricsCollector *)metricsCollector recordMessageToDeviceIdentifier:v32 reachable:1 bytes:v41 isReciprocal:v68 sessionContext:v40];

      id v42 = [v77 sessionContext];
      [v42 setOriginatingSiteIdentifier:v32];
    }
    id v43 = [v18 atomBatches];
    uint64_t v44 = [v18 deletedLocations];
    long long v45 = [v77 sessionContext];
    v71 = (void *)v44;
    [v22 mergeAtomBatches:v43 deletedLocations:v44 sessionContext:v45];

    if ([v18 moreComing])
    {
      uint64_t v46 = [v77 activity];
      if (v46
        && (BOOL v47 = (void *)v46,
            [v77 activity],
            v48 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(),
            BOOL should_defer = xpc_activity_should_defer(v48),
            v48,
            v47,
            should_defer))
      {
        __int16 v50 = __biome_log_for_category();
        id v17 = v73;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v51 = [(BMRapportSyncEngine *)self siteSuffix];
          *(_DWORD *)buf = 138412546;
          v79 = v51;
          __int16 v80 = 2112;
          uint64_t v81 = (uint64_t)v73;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: asked to defer activity, won't issue more requests to device %@ even though more data is available", buf, 0x16u);
        }
        uint64_t v52 = 13;
      }
      else
      {
        v56 = (char *)[v18 batchSequenceNumber] + 1;
        id v16 = 0;
        if ((unint64_t)v56 < 6)
        {
          id v60 = [v18 syncReason];
          v67 = v56;
          v61 = v56;
          id v17 = v73;
          v55 = [(BMRapportSyncEngine *)self buildAtomBatchRequestWithIsReciprocal:v68 syncReason:v60 sequenceNumber:v61 transportType:2 device:v73];
          v62 = __biome_log_for_category();
          v69 = v62;
          if (v55)
          {
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = [(BMRapportSyncEngine *)self siteSuffix];
              *(_DWORD *)buf = 138412802;
              v79 = v63;
              __int16 v80 = 2112;
              uint64_t v81 = (uint64_t)v73;
              __int16 v82 = 2048;
              id v83 = v67;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device %@ with sequence number %lu", buf, 0x20u);

              id v16 = 0;
            }

            [(BMRapportSyncEngine *)self sendFetchAtomBatchesRequest:v55 toDevice:v73 forRequest:v77];
          }
          else
          {
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
              sub_10004487C();
            }
          }
          goto LABEL_31;
        }
        v57 = __biome_log_for_category();
        id v17 = v73;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = [(BMRapportSyncEngine *)self siteSuffix];
          *(_DWORD *)buf = 138412802;
          v79 = v58;
          __int16 v80 = 2048;
          uint64_t v81 = 5;
          __int16 v82 = 2112;
          id v83 = v73;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: max request depth %lu hit, finishing request to device %@", buf, 0x20u);
        }
        uint64_t v52 = 12;
      }
      v55 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:v52 userInfo:0];
      v59 = [v22 peerStatusTracker];
      [(BMRapportSyncEngine *)self finishRequest:v77 toDevice:v17 withError:v55 peerInfo:v19 peerStatusTracker:v59];
    }
    else
    {
      id v53 = __biome_log_for_category();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = [(BMRapportSyncEngine *)self siteSuffix];
        *(_DWORD *)buf = 138412546;
        v79 = v54;
        __int16 v80 = 2112;
        uint64_t v81 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: no more data coming from device %@ finishing request", buf, 0x16u);
      }
      v55 = [v22 peerStatusTracker];
      [(BMRapportSyncEngine *)self finishRequest:v77 toDevice:v17 withError:0 peerInfo:v19 peerStatusTracker:v55];
    }
    id v16 = 0;
LABEL_31:

    id v14 = v72;
    goto LABEL_32;
  }
  unsigned int v26 = __biome_log_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_1000447F0();
  }

  id v25 = [0 peerStatusTracker];
  [(BMRapportSyncEngine *)self finishRequest:v77 toDevice:v17 withError:v16 peerInfo:v19 peerStatusTracker:v25];
  v22 = 0;
LABEL_32:
}

- (void)finishRequest:(id)a3 toDevice:(id)a4 withError:(id)a5 peerInfo:(id)a6 peerStatusTracker:(id)a7
{
  id v17 = a6;
  id v12 = a7;
  id v13 = a3;
  [v13 markAsDeliveredToDevice:a4 withError:a5];
  [(BMRapportSyncEngine *)self completeRequestIfDeliveredToAllNearbyDevices:v13];

  if (v17)
  {
    id v14 = [v17 deviceIdentifier];

    if (v14)
    {
      [v12 upsertSyncDevicePeer:v17];
      id v15 = +[NSDate now];
      id v16 = [v17 deviceIdentifier];
      [v12 setLastSyncDate:v15 forDeviceWithIdentifier:v16];
    }
  }
}

- (id)accountFromRapportOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"senderAccountAltDSID"];
  if ([v5 length])
  {
    id v6 = [objc_alloc((Class)BMAccount) initWithAccountIdentifier:v5];
    if (v6)
    {
LABEL_3:
      id v7 = v6;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v9 = [(BMRapportSyncEngine *)self siteSuffix];
      int v15 = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BMRapportSyncEngine%@: Attempting to use discovered devices cache to identify account for %@", (uint8_t *)&v15, 0x16u);
    }
    rapportManager = self->_rapportManager;
    uint64_t v11 = [v4 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
    id v12 = [(BMRapportManager *)rapportManager deviceWithIdentifier:v11];

    id v6 = [v12 account];

    if (v6) {
      goto LABEL_3;
    }
  }
  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100044908();
  }

LABEL_10:

  return v6;
}

- (id)createDistributedSyncManagerForAccount:(id)a3
{
  return self->_primarySyncManager;
}

- (unsigned)protocolVersion
{
  return 5;
}

- (id)siteSuffix
{
  return &stru_10006DB68;
}

- (BMSyncDevicePeerStatusTracker)peerStatusTracker
{
  return self->_peerStatusTracker;
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
}

- (id)reciprocalCompletionBlock
{
  return self->_reciprocalCompletionBlock;
}

- (void)setReciprocalCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (BMDistributedSyncMultiStreamManager)primarySyncManager
{
  return self->_primarySyncManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primarySyncManager, 0);
  objc_storeStrong((id *)&self->_primaryDatabase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_reciprocalCompletionBlock, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_atomBatchChunkerPolicy, 0);
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);

  objc_storeStrong((id *)&self->_rapportManager, 0);
}

@end