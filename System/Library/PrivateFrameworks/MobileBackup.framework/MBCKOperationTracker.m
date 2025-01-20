@interface MBCKOperationTracker
+ (MBCKOperationTracker)operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 error:(id *)a6;
+ (MBCKOperationTracker)operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 error:(id *)a7;
+ (MBCKOperationTracker)operationTrackerWithParentTracker:(id)a3 policy:(id)a4 error:(id *)a5;
+ (id)_operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 parentTracker:(id)a7 error:(id *)a8;
- (BOOL)canceled;
- (CKOperationGroup)ckOperationGroup;
- (CKRecordZoneID)defaultZoneID;
- (CKRecordZoneID)syncZoneID;
- (MBCKDatabaseManager)databaseManager;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKOperationTracker)parentTracker;
- (MBServiceAccount)account;
- (NSArray)engines;
- (NSArray)operations;
- (NSArray)trackers;
- (NSMutableArray)batchDeletes;
- (NSMutableArray)batchFetches;
- (NSMutableArray)batchSaves;
- (NSMutableArray)metrics;
- (NSString)groupNamePrefix;
- (OS_dispatch_group)dispatchGroup;
- (OS_xpc_object)xpcActivity;
- (id)_initWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 parentTracker:(id)a7;
- (id)description;
- (id)fetchRecordWithID:(id)a3 error:(id *)a4;
- (id)startBatchDelete;
- (id)startBatchFetch;
- (id)startBatchSave;
- (void)_addTracker:(id)a3;
- (void)_associateMetricsWithOperation:(id)a3;
- (void)_cancel:(BOOL)a3;
- (void)_drainWithCompletion:(id)a3;
- (void)_removeTracker:(id)a3;
- (void)_replenishRetryTokens;
- (void)_submitMetrics;
- (void)addCKMetric:(id)a3;
- (void)addDatabaseOperation:(id)a3;
- (void)addDatabaseOperation:(id)a3 policy:(id)a4;
- (void)addEngine:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)drain;
- (void)fetchRecordWithID:(id)a3 completion:(id)a4;
- (void)finishBatchDelete:(id)a3 completion:(id)a4;
- (void)finishBatchFetch:(id)a3 completion:(id)a4;
- (void)finishBatchSave:(id)a3 completion:(id)a4;
- (void)removeEngine:(id)a3;
- (void)saveRecord:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)setBatchDeletes:(id)a3;
- (void)setBatchFetches:(id)a3;
- (void)setBatchSaves:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCkOperationGroup:(id)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setGroupNamePrefix:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setParentTracker:(id)a3;
- (void)setXpcActivity:(id)a3;
@end

@implementation MBCKOperationTracker

+ (id)_operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 parentTracker:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!a8) {
    __assert_rtn("+[MBCKOperationTracker _operationTrackerWithAccount:databaseManager:policy:group:parentTracker:error:]", "MBCKOperationTracker.m", 161, "error");
  }
  v18 = v17;
  id v19 = [[MBCKOperationTracker alloc] _initWithAccount:v13 databaseManager:v14 policy:v15 group:v16 parentTracker:v17];

  return v19;
}

+ (MBCKOperationTracker)operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 error:(id *)a7
{
  return (MBCKOperationTracker *)[a1 _operationTrackerWithAccount:a3 databaseManager:a4 policy:a5 group:a6 parentTracker:0 error:a7];
}

+ (MBCKOperationTracker)operationTrackerWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 error:(id *)a6
{
  return (MBCKOperationTracker *)[a1 _operationTrackerWithAccount:a3 databaseManager:a4 policy:a5 group:0 parentTracker:0 error:a6];
}

+ (MBCKOperationTracker)operationTrackerWithParentTracker:(id)a3 policy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("+[MBCKOperationTracker operationTrackerWithParentTracker:policy:error:]", "MBCKOperationTracker.m", 174, "parentTracker");
  }
  v9 = v8;
  v10 = [v7 account];
  v11 = [v7 databaseManager];
  v12 = +[MBCKOperationTracker _operationTrackerWithAccount:v10 databaseManager:v11 policy:v9 group:0 parentTracker:v7 error:a5];

  return (MBCKOperationTracker *)v12;
}

- (id)_initWithAccount:(id)a3 databaseManager:(id)a4 policy:(id)a5 group:(id)a6 parentTracker:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13) {
    __assert_rtn("-[MBCKOperationTracker _initWithAccount:databaseManager:policy:group:parentTracker:]", "MBCKOperationTracker.m", 179, "account");
  }
  if (!v14) {
    __assert_rtn("-[MBCKOperationTracker _initWithAccount:databaseManager:policy:group:parentTracker:]", "MBCKOperationTracker.m", 180, "databaseManager");
  }
  if (!v15) {
    __assert_rtn("-[MBCKOperationTracker _initWithAccount:databaseManager:policy:group:parentTracker:]", "MBCKOperationTracker.m", 181, "policy");
  }
  v18 = v17;
  v31.receiver = self;
  v31.super_class = (Class)MBCKOperationTracker;
  id v19 = [(MBCKOperationTracker *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_account, a3);
    objc_storeStrong((id *)&v20->_databaseManager, a4);
    dispatch_group_t v21 = dispatch_group_create();
    dispatchGroup = v20->_dispatchGroup;
    v20->_dispatchGroup = (OS_dispatch_group *)v21;

    objc_storeStrong((id *)&v20->_ckOperationPolicy, a5);
    if (v16)
    {
      v23 = (CKOperationGroup *)v16;
    }
    else
    {
      v23 = [v18 ckOperationGroup];
    }
    ckOperationGroup = v20->_ckOperationGroup;
    v20->_ckOperationGroup = v23;

    groupNamePrefix = v20->_groupNamePrefix;
    v20->_groupNamePrefix = (NSString *)&stru_100418BA8;

    [(MBCKOperationTracker *)v20 setParentTracker:v18];
    v26 = [v18 engines];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10025D7B4;
    v29[3] = &unk_1004175C8;
    v27 = v20;
    v30 = v27;
    [v26 enumerateObjectsUsingBlock:v29];
    [v18 _addTracker:v27];
  }
  return v20;
}

- (void)dealloc
{
  if ([(NSMutableArray *)self->_batchFetches count]) {
    __assert_rtn("-[MBCKOperationTracker dealloc]", "MBCKOperationTracker.m", 201, "!_batchFetches.count");
  }
  if ([(NSMutableArray *)self->_batchSaves count]) {
    __assert_rtn("-[MBCKOperationTracker dealloc]", "MBCKOperationTracker.m", 202, "!_batchSaves.count");
  }
  if ([(NSMutableArray *)self->_batchDeletes count]) {
    __assert_rtn("-[MBCKOperationTracker dealloc]", "MBCKOperationTracker.m", 203, "!_batchDeletes.count");
  }
  v3 = [(MBCKOperationTracker *)self parentTracker];
  [v3 _removeTracker:self];

  [(MBCKOperationTracker *)self _cancel:0];
  v4.receiver = self;
  v4.super_class = (Class)MBCKOperationTracker;
  [(MBCKOperationTracker *)&v4 dealloc];
}

- (id)description
{
  v3 = [(MBCKOperationTracker *)self ckOperationGroup];
  objc_super v4 = [v3 operationGroupID];

  v5 = [(MBCKOperationTracker *)self parentTracker];
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if (v4)
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"gid=%@", v4];
    [v6 addObject:v7];
  }
  if (v5)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"parent=%p", v5);
    [v6 addObject:v8];
  }
  if ([v6 count])
  {
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = [v6 componentsJoinedByString:@", "];
    v12 = +[NSString stringWithFormat:@"<%s: %p; %@>", Name, self, v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MBCKOperationTracker;
    v12 = [(MBCKOperationTracker *)&v14 description];
  }

  return v12;
}

- (void)_addTracker:(id)a3
{
  objc_super v4 = (MBCKOperationTracker *)a3;
  if (!v4) {
    __assert_rtn("-[MBCKOperationTracker _addTracker:]", "MBCKOperationTracker.m", 220, "tracker");
  }
  if (v4 == self) {
    __assert_rtn("-[MBCKOperationTracker _addTracker:]", "MBCKOperationTracker.m", 221, "tracker != self");
  }
  v9 = v4;
  v5 = self;
  objc_sync_enter(v5);
  trackers = v5->_trackers;
  if (!trackers)
  {
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    id v8 = v5->_trackers;
    v5->_trackers = (NSHashTable *)v7;

    trackers = v5->_trackers;
  }
  [(NSHashTable *)trackers addObject:v9];
  objc_sync_exit(v5);

  if ([(MBCKOperationTracker *)v5 canceled]) {
    [(MBCKOperationTracker *)v9 cancel];
  }
}

- (void)_removeTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKOperationTracker _removeTracker:]", "MBCKOperationTracker.m", 230, "tracker");
  }
  id v8 = v4;
  v5 = self;
  objc_sync_enter(v5);
  [(NSHashTable *)v5->_trackers removeObject:v8];
  trackers = v5->_trackers;
  if (trackers && ![(NSHashTable *)trackers count])
  {
    uint64_t v7 = v5->_trackers;
    v5->_trackers = 0;
  }
  objc_sync_exit(v5);
}

- (NSArray)trackers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSHashTable *)v2->_trackers allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)operations
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableArray *)v2->_operations copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (CKRecordZoneID)defaultZoneID
{
  return +[MBCKDatabaseManager defaultZoneID];
}

- (CKRecordZoneID)syncZoneID
{
  return +[MBCKDatabaseManager syncZoneID];
}

- (void)_cancel:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(MBCKOperationTracker *)self canceled];
  [(MBCKOperationTracker *)self setCanceled:1];
  if ((v5 & 1) == 0 && v3)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=ck-op= Canceling %{public}@", buf, 0xCu);
      v33 = self;
      _MBLog();
    }
  }
  [(MBCKOperationTracker *)self trackers];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v53;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * i) cancel];
      }
      id v7 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v7);
  }

  v10 = self;
  objc_sync_enter(v10);
  id v11 = [(NSMutableArray *)v10->_batchFetches copy];
  id v12 = [(NSMutableArray *)v10->_batchSaves copy];
  id v13 = [(NSMutableArray *)v10->_batchDeletes copy];
  objc_sync_exit(v10);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v49;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) cancel];
      }
      id v15 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v15);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v45;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) cancel];
      }
      id v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v19);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v13;
  id v23 = [v22 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v41;
    do
    {
      for (m = 0; m != v23; m = (char *)m + 1)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * (void)m) cancel];
      }
      id v23 = [v22 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v23);
  }

  v26 = [(MBCKOperationTracker *)v10 operations];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v27 = [v26 countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      for (n = 0; n != v27; n = (char *)n + 1)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v36 + 1) + 8 * (void)n);
        if ((objc_msgSend(v30, "isCancelled", v34) & 1) == 0)
        {
          objc_super v31 = MBGetDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v30 operationID];
            *(_DWORD *)buf = 138412290;
            v62 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=ck-op= Canceling operation %@", buf, 0xCu);

            v34 = [v30 operationID];
            _MBLog();
          }
          [v30 cancel];
        }
      }
      id v27 = [v26 countByEnumeratingWithState:&v36 objects:v56 count:16];
    }
    while (v27);
  }
}

- (void)cancel
{
}

- (void)_drainWithCompletion:(id)a3
{
  id v16 = a3;
  id v4 = dispatch_group_create();
  unsigned __int8 v5 = [(MBCKOperationTracker *)self trackers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        dispatch_group_enter(v4);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10025E454;
        v21[3] = &unk_100411128;
        id v22 = v4;
        [v10 _drainWithCompletion:v21];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
  dispatch_group_enter(v4);
  dispatchGroup = self->_dispatchGroup;
  id v12 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E45C;
  block[3] = &unk_100411128;
  uint64_t v20 = v4;
  id v13 = v4;
  dispatch_group_notify(dispatchGroup, v12, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10025E464;
  v17[3] = &unk_100411B88;
  id v18 = v16;
  id v14 = v16;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v17);
  dispatch_group_notify(v13, v12, v15);
}

- (void)_submitMetrics
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MBCKOperationTracker *)v2 metrics];
  [(MBCKOperationTracker *)v2 setMetrics:0];
  objc_sync_exit(v2);

  id v4 = dispatch_group_create();
  double Current = CFAbsoluteTimeGetCurrent();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v4);
        v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v9 eventName];
          *(_DWORD *)buf = 138412290;
          double v30 = *(double *)&v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=ck-op= Submitting CKEventMetric: %@", buf, 0xCu);

          dispatch_group_t v21 = [v9 eventName];
          _MBLog();
        }
        id v12 = [(MBCKOperationTracker *)v2 databaseManager];
        id v13 = [(MBCKOperationTracker *)v2 account];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10025E868;
        v23[3] = &unk_1004110B0;
        v23[4] = v9;
        long long v24 = v4;
        [v12 submitCKEventMetric:v9 account:v13 completionHandler:v23];
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  dispatch_time_t v14 = dispatch_time(0, 30000000000);
  intptr_t v15 = dispatch_group_wait(v4, v14);
  double v16 = CFAbsoluteTimeGetCurrent();
  BOOL v17 = v15 == 0;
  id v18 = MBGetDefaultLog();
  id v19 = v18;
  double v20 = v16 - Current;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=ck-op= Successfully submitted metrics after %.3fs", buf, 0xCu);
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    double v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ck-op= Timed out while submitting metrics after %.3fs", buf, 0xCu);
    _MBLog();
  }
}

- (void)drain
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "=ck-op= Draining CK operations for %{public}@", buf, 0xCu);
    id v18 = self;
    _MBLog();
  }

  double Current = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10025ECB0;
  v26[3] = &unk_100411128;
  id v6 = v5;
  long long v27 = v6;
  [(MBCKOperationTracker *)self _drainWithCompletion:v26];
  dispatch_time_t v7 = dispatch_time(0, 300000000000);
  intptr_t v8 = dispatch_group_wait(v6, v7);
  double v9 = CFAbsoluteTimeGetCurrent() - Current;
  if (v8)
  {
    dispatch_group_t v21 = v6;
    v10 = [(MBCKOperationTracker *)self trackers];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          intptr_t v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "operations", v18, *(void *)&v19, v20);
          double v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v29 = self;
            __int16 v30 = 2048;
            double v31 = v9;
            __int16 v32 = 2112;
            v33 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=ck-op= Failed to drain CK operations for %{public}@ after %.3fs: %@", buf, 0x20u);
            double v20 = v15;
            double v19 = v9;
            id v18 = self;
            _MBLog();
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v12);
    }

    id v6 = v21;
  }
  else
  {
    BOOL v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2048;
      double v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "=ck-op= Drained CK operations for %@ in %.3fs", buf, 0x16u);
      _MBLog();
    }

    [(MBCKOperationTracker *)self _submitMetrics];
  }
}

- (void)_associateMetricsWithOperation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  id v6 = [(MBCKOperationTracker *)v5 metrics];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = v11;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = [v10 eventName];
            *(_DWORD *)buf = 138412290;
            dispatch_group_t v21 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "=ck-op= Associating CKEventMetric: %@", buf, 0xCu);
          }
          dispatch_time_t v14 = [v10 eventName];
          _MBLog();
        }
        [v10 associateWithCompletedOperation:v4];
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

- (void)_replenishRetryTokens
{
  id v2 = [(MBCKOperationTracker *)self engines];
  [v2 enumerateObjectsUsingBlock:&stru_100417608];
}

- (void)addDatabaseOperation:(id)a3 policy:(id)a4
{
  id v6 = a3;
  id v56 = a4;
  if (!v56) {
    __assert_rtn("-[MBCKOperationTracker addDatabaseOperation:policy:]", "MBCKOperationTracker.m", 386, "policy");
  }
  long long v55 = [(MBCKOperationTracker *)self account];
  if (!v55) {
    __assert_rtn("-[MBCKOperationTracker addDatabaseOperation:policy:]", "MBCKOperationTracker.m", 388, "account");
  }
  long long v54 = [(MBCKOperationTracker *)self databaseManager];
  if (!v54) {
    __assert_rtn("-[MBCKOperationTracker addDatabaseOperation:policy:]", "MBCKOperationTracker.m", 390, "databaseManager");
  }
  id v7 = [v56 cellularAccess];
  long long v53 = v7;
  if (v7) {
    unsigned int v48 = [v7 allowsExpensiveNetworkAccess];
  }
  else {
    unsigned int v48 = 0;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  char v69 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    v10 = [v9 recordsToSave];
    long long v51 = (char *)[v10 count];
    id v11 = [v9 recordIDsToDelete];
    id v12 = [v11 count];

    [v9 perRecordCompletionBlock];
    uint64_t v13 = v67;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10025FA80;
    v67[3] = &unk_100417630;
    v67[5] = v68;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v67[4] = v14;
    intptr_t v15 = objc_retainBlock(v67);
    [v9 perRecordProgressBlock];
    long long v16 = v66;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10025FB04;
    v66[3] = &unk_100417658;
    v66[5] = v68;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v66[4] = v17;
    long long v18 = objc_retainBlock(v66);
    [v9 setPerRecordProgressBlock:v18];
    [v9 setPerRecordCompletionBlock:v15];
    long long v47 = &v51[(void)v12];
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    double v20 = [v19 recordIDs];
    long long v47 = (char *)[v20 count];

    [v19 perRecordCompletionBlock];
    uint64_t v13 = v65;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10025FB88;
    v65[3] = &unk_100417680;
    v65[5] = v68;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v65[4] = v14;
    intptr_t v15 = objc_retainBlock(v65);
    [v19 perRecordProgressBlock];
    long long v16 = v64;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10025FC28;
    v64[3] = &unk_1004176A8;
    v64[5] = v68;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v64[4] = v17;
    long long v18 = objc_retainBlock(v64);
    [v19 setPerRecordProgressBlock:v18];
    [v19 setPerRecordCompletionBlock:v15];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v6;
    [v21 recordFetchedBlock];
    uint64_t v13 = v63;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10025FCAC;
    v63[3] = &unk_1004176D0;
    v63[5] = v68;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v63[4] = v14;
    intptr_t v15 = objc_retainBlock(v63);
    [v21 queryCursorFetchedBlock];
    long long v16 = v62;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10025FCD4;
    v62[3] = &unk_1004176F8;
    v62[5] = v68;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v62[4] = v17;
    long long v18 = objc_retainBlock(v62);
    [v21 setRecordFetchedBlock:v15];
    [v21 setQueryCursorFetchedBlock:v18];
    long long v47 = 0;
    goto LABEL_13;
  }
  long long v47 = 0;
LABEL_14:
  long long v22 = [v6 completionBlock];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10025FD44;
  v57[3] = &unk_100417720;
  CFAbsoluteTime v61 = Current;
  v57[4] = self;
  id v23 = v6;
  id v58 = v23;
  v60 = v68;
  id v49 = v22;
  id v59 = v49;
  id v24 = [v57 copy];
  [v23 setCompletionBlock:v24];
  long long v50 = v24;
  [v56 qualityOfService];
  long long v52 = MBLogStringForNSQualityOfService();
  long long v25 = [v23 group];
  long long v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [(MBCKOperationTracker *)self ckOperationGroup];
  }
  long long v28 = v27;

  v29 = [v28 operationGroupID];
  __int16 v30 = [v28 name];
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  double v31 = self;
  objc_sync_enter(v31);
  operations = v31->_operations;
  if (!operations)
  {
    uint64_t v33 = objc_opt_new();
    v34 = v31->_operations;
    v31->_operations = (NSMutableArray *)v33;

    operations = v31->_operations;
  }
  id v35 = [(NSMutableArray *)operations count];
  [(NSMutableArray *)v31->_operations addObject:v23];
  objc_sync_exit(v31);

  long long v36 = [(MBCKOperationTracker *)v31 xpcActivity];
  if (v30)
  {
    long long v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      long long v37 = v37;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = objc_opt_class();
        long long v39 = [v23 operationID];
        *(_DWORD *)buf = 138545666;
        uint64_t v71 = v38;
        __int16 v72 = 2114;
        v73 = v39;
        __int16 v74 = 2114;
        v75 = v29;
        __int16 v76 = 2112;
        v77 = v30;
        __int16 v78 = 2114;
        *(void *)v79 = v52;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)v80 = v53 != 0;
        *(_WORD *)&v80[4] = 1024;
        *(_DWORD *)v81 = v48;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v36 != 0;
        __int16 v82 = 2048;
        v83 = v47;
        __int16 v84 = 2048;
        id v85 = v35;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=ck-op= Starting %{public}@, id:%{public}@, gid:%{public}@, gn:\"%@\", qos:%{public}@, ac:%d(%d), xa:%d, c:%lu, o:%lu", buf, 0x5Au);
      }
LABEL_27:

      objc_opt_class();
      long long v42 = [v23 operationID];
      _MBLog();
    }
  }
  else
  {
    long long v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      long long v37 = v37;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_opt_class();
        long long v41 = [v23 operationID];
        *(_DWORD *)buf = 138545410;
        uint64_t v71 = v40;
        __int16 v72 = 2114;
        v73 = v41;
        __int16 v74 = 2114;
        v75 = v29;
        __int16 v76 = 2114;
        v77 = v52;
        __int16 v78 = 1024;
        *(_DWORD *)v79 = v53 != 0;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v48;
        *(_WORD *)v80 = 1024;
        *(_DWORD *)&v80[2] = v36 != 0;
        *(_WORD *)v81 = 2048;
        *(void *)&v81[2] = v47;
        __int16 v82 = 2048;
        v83 = (char *)v35;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=ck-op= Starting %{public}@, id:%{public}@, gid:%{public}@, qos:%{public}@, ac:%d(%d), xa:%d, c:%lu, o:%lu", buf, 0x50u);
      }
      goto LABEL_27;
    }
  }

  [v54 addDatabaseOperation:v23 account:v55 policy:v56 operationGroup:v28 xpcActivity:v36];
  if (-[MBCKOperationTracker canceled](v31, "canceled") && ([v23 isCancelled] & 1) == 0)
  {
    long long v43 = MBGetDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      long long v44 = v43;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        long long v45 = [v23 operationID];
        *(_DWORD *)buf = 138543362;
        uint64_t v71 = (uint64_t)v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "=ck-op= Canceling operation %{public}@", buf, 0xCu);
      }
      long long v46 = [v23 operationID];
      _MBLog();
    }
    [v23 cancel];
  }

  _Block_object_dispose(v68, 8);
}

- (void)addDatabaseOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKOperationTracker *)self ckOperationPolicy];
  [(MBCKOperationTracker *)self addDatabaseOperation:v4 policy:v5];
}

- (void)addCKMetric:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MBCKOperationTracker *)v4 metrics];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(MBCKOperationTracker *)v4 setMetrics:v6];
  }
  id v7 = [(MBCKOperationTracker *)v4 metrics];
  [v7 addObject:v8];

  objc_sync_exit(v4);
}

- (void)setGroupNamePrefix:(id)a3
{
  id v4 = self;
  id v5 = (__CFString *)a3;
  objc_sync_enter(v4);
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &stru_100418BA8;
  }
  id v7 = v6;

  groupNamePrefix = (__CFString *)v4->_groupNamePrefix;
  if (!groupNamePrefix) {
    groupNamePrefix = &stru_100418BA8;
  }
  id v9 = groupNamePrefix;
  uint64_t v10 = [(CKOperationGroup *)v4->_ckOperationGroup name];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_100418BA8;
  }
  uint64_t v13 = v12;

  if (([(__CFString *)v7 isEqualToString:v9] & 1) == 0)
  {
    id v14 = [(__CFString *)v13 substringFromIndex:[(__CFString *)v9 length]];
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", (char *)-[__CFString length](v7, "length") + (void)objc_msgSend(v14, "length"));
    [v15 appendString:v7];
    [v15 appendString:v14];
    [(CKOperationGroup *)v4->_ckOperationGroup setName:v15];
    objc_storeStrong((id *)&v4->_groupNamePrefix, v6);
    long long v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      long long v18 = v13;
      __int16 v19 = 2112;
      id v20 = v15;
      __int16 v21 = 2112;
      long long v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "=ck-op= Updated group name %@ -> %@ for %@", buf, 0x20u);
      _MBLog();
    }
  }
  objc_sync_exit(v4);
}

- (id)startBatchFetch
{
  BOOL v3 = [[MBCKBatchFetch alloc] initWithOperationTracker:self];
  id v4 = self;
  objc_sync_enter(v4);
  batchFetches = v4->_batchFetches;
  if (!batchFetches)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_batchFetches;
    v4->_batchFetches = (NSMutableArray *)v6;

    batchFetches = v4->_batchFetches;
  }
  [(NSMutableArray *)batchFetches addObject:v3];
  objc_sync_exit(v4);

  if ([(MBCKOperationTracker *)v4 canceled]) {
    [(MBCKBatchFetch *)v3 cancel];
  }
  return v3;
}

- (void)finishBatchFetch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKOperationTracker finishBatchFetch:completion:]", "MBCKOperationTracker.m", 551, "batchFetch");
  }
  id v8 = v7;
  id v9 = self;
  objc_sync_enter(v9);
  if (([(NSMutableArray *)v9->_batchFetches containsObject:v6] & 1) == 0) {
    __assert_rtn("-[MBCKOperationTracker finishBatchFetch:completion:]", "MBCKOperationTracker.m", 554, "[_batchFetches containsObject:batchFetch]");
  }
  objc_sync_exit(v9);

  dispatch_group_enter((dispatch_group_t)v9->_dispatchGroup);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100260880;
  v23[4] = sub_100260890;
  id v24 = 0;
  uint64_t v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100260898;
  v19[3] = &unk_100417748;
  long long v22 = v23;
  v19[4] = v9;
  id v11 = v6;
  id v20 = v11;
  id v12 = v10;
  __int16 v21 = v12;
  [v11 fetchRecordsWithCompletion:v19];
  uint64_t v13 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026093C;
  block[3] = &unk_100417770;
  id v17 = v8;
  long long v18 = v23;
  void block[4] = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_group_notify(v12, v13, v15);

  _Block_object_dispose(v23, 8);
}

- (void)fetchRecordWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBCKOperationTracker *)self ckOperationPolicy];
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKOperationTracker fetchRecordWithID:completion:]", "MBCKOperationTracker.m", 577, "policy");
  }
  id v10 = [v8 fetchAssets];
  [v9 timeoutIntervalForFetch];
  double v12 = v11;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  id v14 = objc_alloc((Class)CKFetchRecordsOperation);
  id v42 = v6;
  dispatch_block_t v15 = +[NSArray arrayWithObjects:&v42 count:1];
  id v16 = [v14 initWithRecordIDs:v15];

  objc_initWeak(&location, v16);
  [v16 setShouldFetchAssetContent:v10];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100260E1C;
  v29[3] = &unk_100417798;
  objc_copyWeak(&v34, &location);
  id v17 = v13;
  __int16 v30 = v17;
  uint64_t v33 = &v36;
  id v18 = v6;
  id v31 = v18;
  id v19 = v7;
  id v32 = v19;
  [v16 setFetchRecordsCompletionBlock:v29];
  [(MBCKOperationTracker *)self addDatabaseOperation:v16 policy:v9];
  if (-[MBCKOperationTracker canceled](self, "canceled") && ([v16 isCancelled] & 1) == 0)
  {
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = v20;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = [v16 operationID];
        *(_DWORD *)buf = 138412290;
        long long v41 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=ck-op= Canceling operation %@", buf, 0xCu);
      }
      id v27 = [v16 operationID];
      _MBLog();
    }
    [v16 cancel];
  }
  if (v12 > 0.0)
  {
    dispatch_time_t v23 = dispatch_time(0, 1000000 * (uint64_t)(v12 * 1000.0));
    if (dispatch_semaphore_wait(v17, v23))
    {
      *((unsigned char *)v37 + 24) = 1;
      if (([v16 isCancelled] & 1) == 0)
      {
        id v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = v24;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            long long v26 = [v16 operationID];
            *(_DWORD *)buf = 138412290;
            long long v41 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=ck-op= Canceling operation %@", buf, 0xCu);
          }
          long long v28 = [v16 operationID];
          _MBLog();
        }
        [v16 cancel];
      }
    }
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v36, 8);
}

- (id)fetchRecordWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100260880;
  long long v25 = sub_100260890;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100260880;
  id v19 = sub_100260890;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100261230;
  v11[3] = &unk_1004136B0;
  dispatch_semaphore_t v13 = &v21;
  id v14 = &v15;
  id v7 = dispatch_semaphore_create(0);
  double v12 = v7;
  [(MBCKOperationTracker *)self fetchRecordWithID:v6 completion:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (void *)v22[5];
  if (v8)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v9 = (id)v16[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)startBatchSave
{
  BOOL v3 = [[MBCKBatchSave alloc] initWithOperationTracker:self];
  id v4 = self;
  objc_sync_enter(v4);
  batchSaves = v4->_batchSaves;
  if (!batchSaves)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_batchSaves;
    v4->_batchSaves = (NSMutableArray *)v6;

    batchSaves = v4->_batchSaves;
  }
  [(NSMutableArray *)batchSaves addObject:v3];
  objc_sync_exit(v4);

  if ([(MBCKOperationTracker *)v4 canceled]) {
    [(MBCKBatchSave *)v3 cancel];
  }
  return v3;
}

- (void)finishBatchSave:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKOperationTracker finishBatchSave:completion:]", "MBCKOperationTracker.m", 659, "batchSave");
  }
  id v8 = v7;
  id v9 = self;
  objc_sync_enter(v9);
  if (([(NSMutableArray *)v9->_batchSaves containsObject:v6] & 1) == 0) {
    __assert_rtn("-[MBCKOperationTracker finishBatchSave:completion:]", "MBCKOperationTracker.m", 662, "[_batchSaves containsObject:batchSave]");
  }
  objc_sync_exit(v9);

  dispatch_group_enter((dispatch_group_t)v9->_dispatchGroup);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100260880;
  v23[4] = sub_100260890;
  id v24 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002615F8;
  v19[3] = &unk_100417748;
  long long v22 = v23;
  v19[4] = v9;
  id v11 = v6;
  id v20 = v11;
  double v12 = v10;
  uint64_t v21 = v12;
  [v11 saveRecordsWithCompletion:v19];
  dispatch_semaphore_t v13 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026169C;
  block[3] = &unk_100417770;
  id v17 = v8;
  id v18 = v23;
  void block[4] = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_group_notify(v12, v13, v15);

  _Block_object_dispose(v23, 8);
}

- (void)saveRecord:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v11) {
    __assert_rtn("-[MBCKOperationTracker saveRecord:delegate:completion:]", "MBCKOperationTracker.m", 684, "record");
  }
  id v10 = [(MBCKOperationTracker *)self startBatchSave];
  [v10 setSaveIncrementally:0];
  [v10 saveRecord:v11 delegate:v8 completion:v9];
  [(MBCKOperationTracker *)self finishBatchSave:v10 completion:0];
}

- (id)startBatchDelete
{
  BOOL v3 = [[MBCKBatchDelete alloc] initWithOperationTracker:self];
  id v4 = self;
  objc_sync_enter(v4);
  batchDeletes = v4->_batchDeletes;
  if (!batchDeletes)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_batchDeletes;
    v4->_batchDeletes = (NSMutableArray *)v6;

    batchDeletes = v4->_batchDeletes;
  }
  [(NSMutableArray *)batchDeletes addObject:v3];
  objc_sync_exit(v4);

  if ([(MBCKOperationTracker *)v4 canceled]) {
    [(MBCKBatchDelete *)v3 cancel];
  }
  return v3;
}

- (void)finishBatchDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKOperationTracker finishBatchDelete:completion:]", "MBCKOperationTracker.m", 705, "batchDelete");
  }
  id v8 = v7;
  id v9 = self;
  objc_sync_enter(v9);
  if (([(NSMutableArray *)v9->_batchDeletes containsObject:v6] & 1) == 0) {
    __assert_rtn("-[MBCKOperationTracker finishBatchDelete:completion:]", "MBCKOperationTracker.m", 708, "[_batchDeletes containsObject:batchDelete]");
  }
  objc_sync_exit(v9);

  dispatch_group_enter((dispatch_group_t)v9->_dispatchGroup);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100260880;
  v23[4] = sub_100260890;
  id v24 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100261B04;
  v19[3] = &unk_100417748;
  long long v22 = v23;
  v19[4] = v9;
  id v11 = v6;
  id v20 = v11;
  double v12 = v10;
  uint64_t v21 = v12;
  [v11 deleteRecordsWithCompletion:v19];
  dispatch_semaphore_t v13 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100261BA8;
  block[3] = &unk_100417770;
  id v17 = v8;
  id v18 = v23;
  void block[4] = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_group_notify(v12, v13, v15);

  _Block_object_dispose(v23, 8);
}

- (NSArray)engines
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSHashTable *)v2->_engines allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addEngine:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKOperationTracker addEngine:]", "MBCKOperationTracker.m", 736, "engine");
  }
  id v9 = v4;
  id v5 = self;
  objc_sync_enter(v5);
  engines = v5->_engines;
  if (!engines)
  {
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    id v8 = v5->_engines;
    v5->_engines = (NSHashTable *)v7;

    engines = v5->_engines;
  }
  [(NSHashTable *)engines addObject:v9];
  objc_sync_exit(v5);
}

- (void)removeEngine:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKOperationTracker removeEngine:]", "MBCKOperationTracker.m", 744, "engine");
  }
  id v5 = v4;
  id v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_engines removeObject:v5];
  if (![(NSHashTable *)v6->_engines count])
  {
    engines = v6->_engines;
    v6->_engines = 0;
  }
  objc_sync_exit(v6);

  id v8 = [(MBCKOperationTracker *)v6 trackers];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100261E60;
  v10[3] = &unk_1004177C0;
  id v11 = v5;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (MBCKDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (MBCKOperationPolicy)ckOperationPolicy
{
  return self->_ckOperationPolicy;
}

- (void)setCkOperationPolicy:(id)a3
{
}

- (CKOperationGroup)ckOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkOperationGroup:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (OS_xpc_object)xpcActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 72, 1);
}

- (void)setXpcActivity:(id)a3
{
}

- (NSString)groupNamePrefix
{
  return self->_groupNamePrefix;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (NSMutableArray)batchFetches
{
  return self->_batchFetches;
}

- (void)setBatchFetches:(id)a3
{
}

- (NSMutableArray)batchSaves
{
  return self->_batchSaves;
}

- (void)setBatchSaves:(id)a3
{
}

- (NSMutableArray)batchDeletes
{
  return self->_batchDeletes;
}

- (void)setBatchDeletes:(id)a3
{
}

- (MBCKOperationTracker)parentTracker
{
  return (MBCKOperationTracker *)objc_getProperty(self, a2, 120, 1);
}

- (void)setParentTracker:(id)a3
{
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_parentTracker, 0);
  objc_storeStrong((id *)&self->_batchDeletes, 0);
  objc_storeStrong((id *)&self->_batchSaves, 0);
  objc_storeStrong((id *)&self->_batchFetches, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_groupNamePrefix, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_ckOperationGroup, 0);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

@end