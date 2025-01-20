@interface MTIDSyncEngine
+ (double)transactionTimeout;
+ (void)setTransactionTimeout:(double)a3;
- (CKContainer)container;
- (CKRecordZoneID)zoneID;
- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6;
- (MTIDSyncEngineDelegate)delegate;
- (NSMutableArray)transactions;
- (NSMutableSet)pendingRecordIDs;
- (NSMutableSet)queuedRecordIDs;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (OS_dispatch_queue)queue;
- (id)fetchRecordWithIDs:(id)a3;
- (int64_t)qualityOfService;
- (int64_t)state;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)accountDidChange:(id)a3;
- (void)addPendingRecordID:(id)a3;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5;
- (void)commit;
- (void)deleteRecordsWithIDs:(id)a3;
- (void)fetchAllRecords;
- (void)fetchRecordWithID:(id)a3;
- (void)handleDeletedRecordID:(id)a3 error:(id)a4;
- (void)handleEngineStartedWithError:(id)a3;
- (void)handleFetchedRecords:(id)a3 error:(id)a4;
- (void)handleSavedRecord:(id)a3 error:(id)a4;
- (void)handleUserRecordID:(id)a3;
- (void)removePendingRecordID:(id)a3;
- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingRecordIDs:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedRecordIDs:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTransactions:(id)a3;
- (void)setZoneID:(id)a3;
- (void)setupContainerWithIdentifier:(id)a3;
- (void)startEngine;
@end

@implementation MTIDSyncEngine

- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MTIDSyncEngine;
  v14 = [(MTIDSyncEngine *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(MTIDSyncEngine *)v14 setQueue:v12];
    [(MTIDSyncEngine *)v15 setDelegate:v13];
    [(MTIDSyncEngine *)v15 setZoneID:v11];
    v16 = +[NSMutableSet set];
    [(MTIDSyncEngine *)v15 setQueuedRecordIDs:v16];

    v17 = +[NSMutableSet set];
    [(MTIDSyncEngine *)v15 setPendingRecordIDs:v17];

    [(MTIDSyncEngine *)v15 setupContainerWithIdentifier:v10];
    [(MTIDSyncEngine *)v15 setQualityOfService:17];
  }

  return v15;
}

- (void)setupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"accountDidChange:" name:CKAccountChangedNotification object:0];

  v6 = +[MTFrameworkEnvironment sharedEnvironment];
  if ([v6 useCloudKitSandbox]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }

  id v8 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v4 environment:v7];
  id v9 = [objc_alloc((Class)CKContainer) initWithContainerID:v8];
  [(MTIDSyncEngine *)self setContainer:v9];

  id v10 = [(MTIDSyncEngine *)self container];
  id v11 = [v10 containerID];
  id v12 = [v11 environment];

  if (v12 == (id)2)
  {
    id v13 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService is using iCloud container in the sandbox environment", v14, 2u);
    }
  }
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((id)[(MTIDSyncEngine *)v5 state] == (id)2)
  {
    v6 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Restarting ID sync engine because account has changed", v7, 2u);
    }

    [(MTIDSyncEngine *)v5 setState:0];
    [(MTIDSyncEngine *)v5 startEngine];
  }
  objc_sync_exit(v5);
}

- (void)setState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_state = a3;
  if (!a3)
  {
    id v4 = [(MTIDSyncEngine *)obj pendingRecordIDs];
    [v4 removeAllObjects];

    v5 = [(MTIDSyncEngine *)obj queuedRecordIDs];
    [v5 removeAllObjects];

    [(MTIDSyncEngine *)obj _endTransaction];
  }
  objc_sync_exit(obj);
}

- (void)startEngine
{
  obj = self;
  objc_sync_enter(obj);
  if ([(MTIDSyncEngine *)obj state])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(MTIDSyncEngine *)obj setState:1];
    objc_sync_exit(obj);

    objc_initWeak(&location, obj);
    v2 = [(MTIDSyncEngine *)obj container];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000085B0;
    v4[3] = &unk_1000208A0;
    objc_copyWeak(&v5, &location);
    [v2 fetchUserRecordIDWithCompletionHandler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)fetchRecordWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTPromise);
  v6 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with IDs", buf, 2u);
  }

  id v7 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v4];
  id v8 = [(MTIDSyncEngine *)self applicationBundleIdentifierOverrideForNetworkAttribution];
  id v9 = [v7 configuration];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008D28;
  v14[3] = &unk_1000208C8;
  id v10 = v5;
  v15 = v10;
  [v7 setFetchRecordsCompletionBlock:v14];
  id v11 = [(MTIDSyncEngine *)self container];
  id v12 = [v11 privateCloudDatabase];
  [v12 addOperation:v7];

  return v10;
}

- (void)fetchRecordWithID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ((id)[(MTIDSyncEngine *)v5 state] == (id)2)
  {
    objc_sync_exit(v5);

    v6 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v4 recordName];
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with ID %@", buf, 0xCu);
    }
    [(MTIDSyncEngine *)v5 addPendingRecordID:v4];
    id v8 = objc_alloc((Class)CKFetchRecordsOperation);
    id v18 = v4;
    id v9 = +[NSArray arrayWithObjects:&v18 count:1];
    id v10 = [v8 initWithRecordIDs:v9];

    id v11 = [(MTIDSyncEngine *)v5 applicationBundleIdentifierOverrideForNetworkAttribution];
    id v12 = [v10 configuration];
    [v12 setApplicationBundleIdentifierOverrideForNetworkAttribution:v11];

    objc_initWeak((id *)buf, v5);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009090;
    v15[3] = &unk_1000208F0;
    id v16 = v4;
    objc_copyWeak(&v17, (id *)buf);
    [v10 setFetchRecordsCompletionBlock:v15];
    id v13 = [(MTIDSyncEngine *)v5 container];
    v14 = [v13 privateCloudDatabase];
    [v14 addOperation:v10];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(MTIDSyncEngine *)v5 startEngine];
    objc_sync_exit(v5);
  }
}

- (void)fetchAllRecords
{
  obj = self;
  objc_sync_enter(obj);
  if ((id)[(MTIDSyncEngine *)obj state] == (id)2)
  {
    objc_sync_exit(obj);

    v2 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching all record changes", (uint8_t *)buf, 2u);
    }

    id v3 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    id v4 = [(MTIDSyncEngine *)obj zoneID];
    v23 = v4;
    id v24 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    id v6 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
    id v7 = [(MTIDSyncEngine *)obj zoneID];
    v22 = v7;
    id v8 = +[NSArray arrayWithObjects:&v22 count:1];
    id v9 = [v6 initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v5];

    id v10 = [(MTIDSyncEngine *)obj applicationBundleIdentifierOverrideForNetworkAttribution];
    id v11 = [v9 configuration];
    [v11 setApplicationBundleIdentifierOverrideForNetworkAttribution:v10];

    objc_initWeak(buf, obj);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000958C;
    v19[3] = &unk_100020918;
    objc_copyWeak(&v20, buf);
    [v9 setRecordChangedBlock:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009638;
    v17[3] = &unk_100020940;
    objc_copyWeak(&v18, buf);
    [v9 setRecordWithIDWasDeletedBlock:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009698;
    v15[3] = &unk_100020968;
    objc_copyWeak(&v16, buf);
    [v9 setRecordZoneFetchCompletionBlock:v15];
    [(MTIDSyncEngine *)obj _beginTransaction];
    id v12 = [(MTIDSyncEngine *)obj container];
    id v13 = [v12 privateCloudDatabase];
    [v13 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }
  else
  {
    [(MTIDSyncEngine *)obj startEngine];
    objc_sync_exit(obj);
  }
}

- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = self;
    objc_sync_enter(v7);
    if ([(MTIDSyncEngine *)v7 qualityOfService] < a4) {
      [(MTIDSyncEngine *)v7 setQualityOfService:a4];
    }
    if ((id)[(MTIDSyncEngine *)v7 state] == (id)2)
    {
      id v8 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
      id v9 = [v8 count];

      id v10 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
      [v10 addObjectsFromArray:v6];

      if (!v9)
      {
        id v11 = [(MTIDSyncEngine *)v7 queuedRecordIDs];
        id v12 = [v11 count];

        if (v12)
        {
          dispatch_time_t v13 = dispatch_time(0, 1000000000);
          v14 = [(MTIDSyncEngine *)v7 queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000098B8;
          block[3] = &unk_100020560;
          block[4] = v7;
          dispatch_after(v13, v14, block);
        }
      }
    }
    else
    {
      [(MTIDSyncEngine *)v7 startEngine];
    }
    objc_sync_exit(v7);
  }
}

- (void)commit
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTIDSyncEngine *)v2 queuedRecordIDs];
  id v4 = [v3 allObjects];

  id v5 = [(MTIDSyncEngine *)v2 qualityOfService];
  id v6 = [(MTIDSyncEngine *)v2 queuedRecordIDs];
  [v6 removeAllObjects];

  [(MTIDSyncEngine *)v2 setQualityOfService:17];
  objc_sync_exit(v2);

  if ([v4 count])
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218240;
      id v9 = [v4 count];
      __int16 v10 = 2048;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Started saving %ld records with qos %ld", (uint8_t *)&v8, 0x16u);
    }

    [(MTIDSyncEngine *)v2 addRecordIDsToSave:v4 recordIDsToDelete:0 qualityOfService:v5];
  }
}

- (void)deleteRecordsWithIDs:(id)a3
{
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a3;
  id v26 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  if ((id)[(MTIDSyncEngine *)v9 state] == (id)2)
  {
    int64_t v25 = a5;
    __int16 v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v34;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v14);
          id v16 = [(MTIDSyncEngine *)v9 delegate];
          id v17 = [v16 recordWithID:v15];

          if (v17)
          {
            [(MTIDSyncEngine *)v9 addPendingRecordID:v15];
            [v10 addObject:v17];
          }

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    objc_initWeak(&location, v9);
    id v18 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:v26];
    objc_super v19 = [v18 configuration];
    [v19 setQualityOfService:v25];

    id v20 = [(MTIDSyncEngine *)v9 applicationBundleIdentifierOverrideForNetworkAttribution];
    v21 = [v18 configuration];
    [v21 setApplicationBundleIdentifierOverrideForNetworkAttribution:v20];

    [v18 setSavePolicy:0];
    [v18 setAtomic:0];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100009E04;
    v30[3] = &unk_100020990;
    objc_copyWeak(&v31, &location);
    [v18 setPerRecordCompletionBlock:v30];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100009E7C;
    v27[3] = &unk_1000209B8;
    id v22 = v10;
    id v28 = v22;
    objc_copyWeak(&v29, &location);
    [v18 setCompletionBlock:v27];
    v23 = [(MTIDSyncEngine *)v9 container];
    id v24 = [v23 privateCloudDatabase];
    [v24 addOperation:v18];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }
  else
  {
    [(MTIDSyncEngine *)v9 startEngine];
  }
  objc_sync_exit(v9);
}

- (void)addPendingRecordID:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  [v5 addObject:v6];

  [(MTIDSyncEngine *)v4 _beginTransaction];
  objc_sync_exit(v4);
}

- (void)removePendingRecordID:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  [v5 removeObject:v8];

  id v6 = [(MTIDSyncEngine *)v4 pendingRecordIDs];
  id v7 = [v6 count];

  if (!v7) {
    [(MTIDSyncEngine *)v4 _endTransaction];
  }
  objc_sync_exit(v4);
}

+ (double)transactionTimeout
{
  return *(double *)&qword_1000282A8;
}

+ (void)setTransactionTimeout:(double)a3
{
  qword_1000282A8 = *(void *)&a3;
}

- (void)_beginTransaction
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000A2A4;
  uint64_t v15 = sub_10000A2B4;
  id v16 = [(MTIDSyncEngine *)self transactions];
  id v3 = (void *)v12[5];
  if (!v3)
  {
    uint64_t v4 = +[NSMutableArray arrayWithCapacity:1];
    id v5 = (void *)v12[5];
    v12[5] = v4;

    [(MTIDSyncEngine *)self setTransactions:v12[5]];
    id v3 = (void *)v12[5];
  }
  if (![v3 count])
  {
    id v6 = (void *)v12[5];
    id v7 = (void *)os_transaction_create();
    [v6 addObject:v7];
  }
  +[MTIDSyncEngine transactionTimeout];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A2BC;
  block[3] = &unk_1000204A0;
  block[4] = &v11;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  _Block_object_dispose(&v11, 8);
}

- (void)_endTransaction
{
  id v2 = [(MTIDSyncEngine *)self transactions];
  [v2 removeAllObjects];
}

- (void)handleUserRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(MTIDSyncEngine *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A3C4;
  v7[3] = &unk_1000209E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleEngineStartedWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(MTIDSyncEngine *)v5 setState:2 * (v4 == 0)];
  objc_sync_exit(v5);

  id v6 = [(MTIDSyncEngine *)v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A50C;
  v8[3] = &unk_1000209E0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)handleSavedRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v7 code];

    if (v9 == (id)14)
    {
      __int16 v10 = [v7 userInfo];
      uint64_t v11 = [v10 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

      if (v11)
      {
        id v12 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [v6 recordID];
          v14 = [v13 recordName];
          *(_DWORD *)buf = 138412290;
          v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MetricsKit: Server has a newer version of record with ID %@, use server record instead", buf, 0xCu);
        }
        id v15 = v11;

        id v7 = 0;
        id v6 = v15;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v16 = [v7 domain];
  if (![v16 isEqual:CKErrorDomain])
  {

    goto LABEL_13;
  }
  id v17 = [v7 code];

  if (v17 == (id)11)
  {
    uint64_t v11 = [(MTIDSyncEngine *)self delegate];
    id v18 = [v6 recordID];
    [v11 recordWasDeleted:v18];

LABEL_11:
  }
LABEL_13:
  objc_super v19 = [(MTIDSyncEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7E4;
  block[3] = &unk_100020A08;
  id v23 = v7;
  id v24 = self;
  id v25 = v6;
  id v20 = v6;
  id v21 = v7;
  dispatch_async(v19, block);
}

- (void)handleFetchedRecords:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with error %@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = [(MTIDSyncEngine *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AA80;
    v10[3] = &unk_1000209E0;
    uint64_t v11 = v6;
    id v12 = self;
    dispatch_async(v9, v10);

    id v8 = v11;
  }
}

- (void)handleDeletedRecordID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v6 recordName];
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete record with ID %@ error %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v10 = [(MTIDSyncEngine *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000ACF8;
    v11[3] = &unk_1000209E0;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(v10, v11);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (MTIDSyncEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTIDSyncEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSMutableSet)queuedRecordIDs
{
  return self->_queuedRecordIDs;
}

- (void)setQueuedRecordIDs:(id)a3
{
}

- (NSMutableSet)pendingRecordIDs
{
  return self->_pendingRecordIDs;
}

- (void)setPendingRecordIDs:(id)a3
{
}

- (NSMutableArray)transactions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactions);

  return (NSMutableArray *)WeakRetained;
}

- (void)setTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactions);
  objc_storeStrong((id *)&self->_pendingRecordIDs, 0);
  objc_storeStrong((id *)&self->_queuedRecordIDs, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end