@interface PSDWatchSyncStateObserver
+ (id)pairdSyncStateDomainKey;
- (PSDWatchSyncStateObserver)init;
- (id)_watchSyncClientStateFromSyncSession:(id)a3;
- (id)_watchSyncStateFromSyncSession:(id)a3;
- (unint64_t)_watchSyncProgressStateFromSyncSession:(id)a3;
- (unint64_t)_watchSyncSessionTypeFromSyncSession:(id)a3;
- (void)_updateStateWithSyncSession:(id)a3;
- (void)_updateWithSyncState:(id)a3 andSyncClientState:(id)a4;
- (void)dealloc;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
@end

@implementation PSDWatchSyncStateObserver

- (PSDWatchSyncStateObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)PSDWatchSyncStateObserver;
  v2 = [(PSDWatchSyncStateObserver *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pairedsync.watchsyncstate", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.pairedsync"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v6;

    v8 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    preferencesManager = v2->_preferencesManager;
    v2->_preferencesManager = v8;

    v10 = +[PSDScheduler sharedScheduler];
    [v10 addSchedulerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[PSDScheduler sharedScheduler];
  [v3 removeSchedulerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSDWatchSyncStateObserver;
  [(PSDWatchSyncStateObserver *)&v4 dealloc];
}

+ (id)pairdSyncStateDomainKey
{
  if (qword_100038518 != -1) {
    dispatch_once(&qword_100038518, &stru_10002CE40);
  }
  v2 = (void *)qword_100038510;

  return v2;
}

- (void)_updateWithSyncState:(id)a3 andSyncClientState:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  if (([v15 isEqual:self->_syncState] & 1) == 0 && (v15 || self->_syncState))
  {
    objc_storeStrong((id *)&self->_syncState, a3);
    v9 = [(PSYWatchSyncState *)self->_syncState plistRepresentation];
    [(NPSDomainAccessor *)self->_domainAccessor setObject:v9 forKey:@"PSYWatchSyncState"];

    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  if (([v7 isEqual:self->_syncClientState] & 1) == 0 && (v7 || self->_syncClientState))
  {
    objc_storeStrong((id *)&self->_syncClientState, a4);
    v10 = [(PSYWatchSyncClientState *)self->_syncClientState plistRepresentation];
    [(NPSDomainAccessor *)self->_domainAccessor setObject:v10 forKey:@"PSYWatchSyncClientState"];

    goto LABEL_12;
  }
  if (v8)
  {
LABEL_12:
    id v11 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
    preferencesManager = self->_preferencesManager;
    v13 = [(NPSDomainAccessor *)self->_domainAccessor domain];
    v14 = [(id)objc_opt_class() pairdSyncStateDomainKey];
    [(NPSManager *)preferencesManager synchronizeNanoDomain:v13 keys:v14];
  }
}

- (unint64_t)_watchSyncProgressStateFromSyncSession:(id)a3
{
  id v3 = [a3 syncSessionState];
  if ((unint64_t)v3 < 3) {
    return (unint64_t)v3 + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)_watchSyncSessionTypeFromSyncSession:(id)a3
{
  return [a3 syncSessionType] == (id)1;
}

- (id)_watchSyncStateFromSyncSession:(id)a3
{
  id v4 = a3;
  if ([v4 syncSessionType] && objc_msgSend(v4, "syncSessionType") != (id)2)
  {
    objc_super v12 = [[PSYWatchSyncState alloc] initWithActivityLabel:0 globalProgress:100 syncProgressState:3];
  }
  else
  {
    v5 = [v4 firstIncompleteActivity];
    v6 = [v5 activityInfo];
    id v7 = [v6 label];

    unint64_t v8 = [(PSDWatchSyncStateObserver *)self _watchSyncProgressStateFromSyncSession:v4];
    [v4 sessionProgress];
    unint64_t v10 = vcvtad_u64_f64(v9 * 100.0);
    if (v8 == 3) {
      uint64_t v11 = 100;
    }
    else {
      uint64_t v11 = v10;
    }
    objc_super v12 = [[PSYWatchSyncState alloc] initWithActivityLabel:v7 globalProgress:v11 syncProgressState:v8];
  }

  return v12;
}

- (id)_watchSyncClientStateFromSyncSession:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PSDWatchSyncStateObserver *)self _watchSyncProgressStateFromSyncSession:v4];
  unint64_t v6 = [(PSDWatchSyncStateObserver *)self _watchSyncSessionTypeFromSyncSession:v4];
  id v7 = [v4 syncSessionType];
  if (v5 == 2)
  {
    id v30 = v7;
    unint64_t v31 = v6;
    unint64_t v8 = [v4 runningActivities];
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v16 = [v15 activityInfo];
          v17 = [v16 label];

          if (v17)
          {
            v18 = [v15 activityInfo];
            v19 = [v18 label];
            [v9 addObject:v19];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v12);
    }

    v20 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v21 = [v4 completedActivities];
    id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) activityInfo];
          v27 = [v26 label];
          [v20 addObject:v27];
        }
        id v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }

    v28 = [[PSYWatchSyncClientState alloc] initWithSyncSessionState:2 syncSessionType:v31 migrationSync:v30 == (id)2 activities:v9 completedActivities:v20];
  }
  else
  {
    v28 = [[PSYWatchSyncClientState alloc] initWithSyncSessionState:v5 syncSessionType:v6 migrationSync:v7 == (id)2 activities:0 completedActivities:0];
  }

  return v28;
}

- (void)_updateStateWithSyncSession:(id)a3
{
  id v4 = a3;
  id v6 = [(PSDWatchSyncStateObserver *)self _watchSyncStateFromSyncSession:v4];
  unint64_t v5 = [(PSDWatchSyncStateObserver *)self _watchSyncClientStateFromSyncSession:v4];

  [(PSDWatchSyncStateObserver *)self _updateWithSyncState:v6 andSyncClientState:v5];
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  objc_msgSend(a4, "updatedSession", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PSDWatchSyncStateObserver *)self _updateStateWithSyncSession:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncClientPlistRepresentation, 0);
  objc_storeStrong((id *)&self->_preferencesManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_syncClientState, 0);
  objc_storeStrong((id *)&self->_syncState, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end