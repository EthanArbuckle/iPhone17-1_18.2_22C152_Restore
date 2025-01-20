@interface _DASUserRequestedBackupTaskManager
+ (_DASUserRequestedBackupTaskManager)managerWithContext:(id)a3;
+ (id)userRequestedBackupKeyPath;
- (BOOL)activityEligibleForRunning:(id)a3;
- (BOOL)isBackupStatusCompleted:(unint64_t)a3;
- (BOOL)syncInProgress;
- (BYBuddyDaemonCloudSyncClient)client;
- (NSMutableArray)clientsWithErrors;
- (NSMutableDictionary)backupTasks;
- (OS_os_log)log;
- (_CDLocalContext)context;
- (_DASUserRequestedBackupTaskManager)initWithContext:(id)a3;
- (id)currentClient;
- (int64_t)totalClients;
- (os_unfair_lock_s)lock;
- (unint64_t)backupTaskStatusForCompletedActivity:(int64_t)a3;
- (void)_queue_obtainPendingBackupTasks;
- (void)activitySubmitted:(id)a3;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)setBackupTasks:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientsWithErrors:(id)a3;
- (void)setContext:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)setTotalClients:(int64_t)a3;
- (void)syncRequested;
@end

@implementation _DASUserRequestedBackupTaskManager

- (_DASUserRequestedBackupTaskManager)initWithContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_DASUserRequestedBackupTaskManager;
  v6 = [(_DASUserRequestedBackupTaskManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    os_log_t v8 = os_log_create("com.apple.duetactivityscheduler", "syncOnBackup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    backupTasks = v7->_backupTasks;
    v7->_backupTasks = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableArray array];
    clientsWithErrors = v7->_clientsWithErrors;
    v7->_clientsWithErrors = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v7->_context, a3);
    context = v7->_context;
    v15 = [(id)objc_opt_class() userRequestedBackupKeyPath];
    v16 = [(_CDLocalContext *)context objectForKeyedSubscript:v15];
    v7->_syncInProgress = [v16 BOOLValue];
  }
  return v7;
}

+ (_DASUserRequestedBackupTaskManager)managerWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithContext:v3];

  return (_DASUserRequestedBackupTaskManager *)v4;
}

+ (id)userRequestedBackupKeyPath
{
  if (qword_1001C44F0 != -1) {
    dispatch_once(&qword_1001C44F0, &stru_1001784F8);
  }
  v2 = (void *)qword_1001C44F8;

  return v2;
}

- (id)currentClient
{
  client = self->_client;
  if (!client)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)qword_1001C4500;
    uint64_t v13 = qword_1001C4500;
    if (!qword_1001C4500)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000E7EC0;
      v9[3] = &unk_100175628;
      v9[4] = &v10;
      sub_1000E7EC0((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (BYBuddyDaemonCloudSyncClient *)objc_alloc_init(v5);
    v7 = self->_client;
    self->_client = v6;

    client = self->_client;
  }

  return client;
}

- (BOOL)isBackupStatusCompleted:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)activitySubmitted:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  backupTasks = self->_backupTasks;
  v7 = [v5 name];
  os_log_t v8 = [(NSMutableDictionary *)backupTasks objectForKeyedSubscript:v7];
  id v9 = [v8 unsignedIntegerValue];

  if (v9 == (id)1) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  v11 = +[NSNumber numberWithUnsignedInteger:v10];
  uint64_t v12 = self->_backupTasks;
  uint64_t v13 = [v5 name];

  [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

  os_unfair_lock_unlock(p_lock);
}

- (void)reportActivityRunning:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL syncInProgress = self->_syncInProgress;
  log = self->_log;
  BOOL v8 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%@ running", (uint8_t *)&v11, 0xCu);
    }
    backupTasks = self->_backupTasks;
    uint64_t v10 = [v4 name];
    [(NSMutableDictionary *)backupTasks setObject:&off_100187720 forKeyedSubscript:v10];
  }
  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%@ running (no sync in progress)", (uint8_t *)&v11, 0xCu);
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)backupTaskStatusForCompletedActivity:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL syncInProgress = self->_syncInProgress;
  log = self->_log;
  BOOL v8 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%@ done running", buf, 0xCu);
    }
    backupTasks = self->_backupTasks;
    uint64_t v10 = [(NSMutableDictionary *)v4 name];
    int v11 = [(NSMutableDictionary *)backupTasks objectForKeyedSubscript:v10];
    id v12 = [v11 unsignedIntegerValue];

    if (![(_DASUserRequestedBackupTaskManager *)self isBackupStatusCompleted:v12])
    {
      uint64_t v13 = +[NSNumber numberWithUnsignedInteger:[(_DASUserRequestedBackupTaskManager *)self backupTaskStatusForCompletedActivity:[(NSMutableDictionary *)v4 completionStatus]]];
      v14 = self->_backupTasks;
      v15 = [(NSMutableDictionary *)v4 name];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
    }
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_backupTasks;
      *(_DWORD *)buf = 138412290;
      v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Now backup tasks are: %@", buf, 0xCu);
    }
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    objc_super v18 = self->_backupTasks;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000E78A0;
    v35[3] = &unk_100176BB0;
    v35[4] = self;
    v35[5] = &v36;
    [(NSMutableDictionary *)v18 enumerateKeysAndObjectsUsingBlock:v35];
    if ([(NSMutableDictionary *)v4 completionStatus] == (id)3)
    {
      v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_100100A20((uint64_t)v4, v19);
      }
      v20 = [(NSMutableDictionary *)v4 name];
      v48[0] = NSLocalizedDescriptionKey;
      v48[1] = @"client";
      v49[0] = @"Error attempting to sync local changes.";
      v49[1] = v20;
      v21 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
      v22 = +[NSError errorWithDomain:@"XPCSyncOnBackup" code:228965071 userInfo:v21];

      [(NSMutableArray *)self->_clientsWithErrors addObject:v22];
    }
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = +[NSNumber numberWithInteger:self->_totalClients];
      v25 = +[NSNumber numberWithInteger:v37[3] - (void)[(NSMutableArray *)self->_clientsWithErrors count]];
      v27 = self->_backupTasks;
      clientsWithErrors = self->_clientsWithErrors;
      *(_DWORD *)buf = 138413058;
      v41 = v24;
      __int16 v42 = 2112;
      v43 = v25;
      __int16 v44 = 2112;
      v45 = clientsWithErrors;
      __int16 v46 = 2112;
      v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Total=%@ Completed=%@ Errors=%@ All=%@", buf, 0x2Au);
    }
    v28 = [(_DASUserRequestedBackupTaskManager *)self currentClient];
    int64_t totalClients = self->_totalClients;
    uint64_t v30 = v37[3];
    id v31 = [(NSMutableArray *)self->_clientsWithErrors count];
    id v32 = [(NSMutableArray *)self->_clientsWithErrors copy];
    [v28 cloudSyncProgressUpdate:totalClients completedClients:v30 - (void)v31 errors:v32];

    if (v37[3] == self->_totalClients)
    {
      self->_int64_t totalClients = 0;
      [(NSMutableArray *)self->_clientsWithErrors removeAllObjects];
      [(NSMutableDictionary *)self->_backupTasks removeAllObjects];
      self->_BOOL syncInProgress = 0;
      context = self->_context;
      v34 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
      [(_CDLocalContext *)context setObject:&off_100187738 forKeyedSubscript:v34];
    }
    os_unfair_lock_unlock(p_lock);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%@ done running (no sync in progress)", buf, 0xCu);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)activityEligibleForRunning:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL syncInProgress = self->_syncInProgress;
  backupTasks = self->_backupTasks;
  BOOL v8 = [v5 name];

  id v9 = [(NSMutableDictionary *)backupTasks objectForKeyedSubscript:v8];

  id v10 = [v9 unsignedIntegerValue];
  BOOL v13 = syncInProgress && v9 != 0 && v10 == 0;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)_queue_obtainPendingBackupTasks
{
  [(NSMutableDictionary *)self->_backupTasks removeAllObjects];
  id v3 = +[_DASDaemon sharedInstance];
  id v4 = [v3 allPendingSyncOnBackupTasks];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        backupTasks = self->_backupTasks;
        int v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) name:v12];
        [(NSMutableDictionary *)backupTasks setObject:&off_100187750 forKeyedSubscript:v11];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)syncRequested
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  id v5 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
  id v6 = [(_CDLocalContext *)context objectForKeyedSubscript:v5];
  unsigned __int8 v7 = [v6 BOOLValue];

  log = self->_log;
  BOOL v9 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Sync requested", (uint8_t *)&v16, 2u);
    }
    [(_DASUserRequestedBackupTaskManager *)self _queue_obtainPendingBackupTasks];
    id v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      backupTasks = self->_backupTasks;
      int v16 = 138412290;
      v17 = backupTasks;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Pending tasks are %@", (uint8_t *)&v16, 0xCu);
    }
    self->_int64_t totalClients = (int64_t)[(NSMutableDictionary *)self->_backupTasks count];
    self->_BOOL syncInProgress = 1;
    if (![(NSMutableDictionary *)self->_backupTasks count])
    {
      long long v12 = self->_log;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "No pending tasks, reporting update!", (uint8_t *)&v16, 2u);
      }
      long long v13 = [(_DASUserRequestedBackupTaskManager *)self currentClient];
      [v13 cloudSyncProgressUpdate:0 completedClients:0 errors:&__NSArray0__struct];

      self->_BOOL syncInProgress = 0;
      long long v14 = self->_context;
      long long v15 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
      [(_CDLocalContext *)v14 setObject:&off_100187738 forKeyedSubscript:v15];
    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Sync ended", (uint8_t *)&v16, 2u);
    }
    self->_BOOL syncInProgress = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int64_t)totalClients
{
  return self->_totalClients;
}

- (void)setTotalClients:(int64_t)a3
{
  self->_int64_t totalClients = a3;
}

- (NSMutableDictionary)backupTasks
{
  return self->_backupTasks;
}

- (void)setBackupTasks:(id)a3
{
}

- (NSMutableArray)clientsWithErrors
{
  return self->_clientsWithErrors;
}

- (void)setClientsWithErrors:(id)a3
{
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_BOOL syncInProgress = a3;
}

- (BYBuddyDaemonCloudSyncClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientsWithErrors, 0);
  objc_storeStrong((id *)&self->_backupTasks, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end