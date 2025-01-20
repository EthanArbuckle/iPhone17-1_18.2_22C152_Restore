@interface NDUserSyncStakeholder
+ (BOOL)EDUMode;
+ (id)sharedStakeholder;
- (BOOL)tasksEnqueued;
- (BOOL)tasksInitialized;
- (NDUserSyncStakeholder)init;
- (NSMutableDictionary)bridgeTasks;
- (NSMutableSet)activeTasks;
- (NSMutableSet)monitorTaskSet;
- (UMUserSyncTask)monitorTask;
- (id)startUMTask:(id)a3 taskInfo:(id)a4;
- (os_unfair_lock_s)activeTasksLock;
- (os_unfair_lock_s)monitorTaskLock;
- (void)endBridgingUMTask:(id)a3;
- (void)endUMTask:(id)a3;
- (void)restoredTaskActive:(id)a3;
- (void)restoredTaskEnqueued:(id)a3;
- (void)setActiveTasks:(id)a3;
- (void)setActiveTasksLock:(os_unfair_lock_s)a3;
- (void)setBridgeTasks:(id)a3;
- (void)setMonitorTask:(id)a3;
- (void)setMonitorTaskLock:(os_unfair_lock_s)a3;
- (void)setMonitorTaskSet:(id)a3;
- (void)setTasksEnqueued:(BOOL)a3;
- (void)setTasksInitialized:(BOOL)a3;
- (void)startBridgingUMTask:(id)a3;
- (void)tasksHaveBeenEnqueued;
- (void)uploadContent;
@end

@implementation NDUserSyncStakeholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeTasks, 0);
  objc_storeStrong((id *)&self->_monitorTaskSet, 0);
  objc_storeStrong((id *)&self->_monitorTask, 0);

  objc_storeStrong((id *)&self->_activeTasks, 0);
}

- (void)setBridgeTasks:(id)a3
{
}

- (NSMutableDictionary)bridgeTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTasksEnqueued:(BOOL)a3
{
  self->_tasksEnqueued = a3;
}

- (BOOL)tasksEnqueued
{
  return self->_tasksEnqueued;
}

- (void)setTasksInitialized:(BOOL)a3
{
  self->_tasksInitialized = a3;
}

- (BOOL)tasksInitialized
{
  return self->_tasksInitialized;
}

- (void)setMonitorTaskLock:(os_unfair_lock_s)a3
{
  self->_monitorTaskLock = a3;
}

- (os_unfair_lock_s)monitorTaskLock
{
  return self->_monitorTaskLock;
}

- (void)setMonitorTaskSet:(id)a3
{
}

- (NSMutableSet)monitorTaskSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMonitorTask:(id)a3
{
}

- (UMUserSyncTask)monitorTask
{
  return (UMUserSyncTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveTasksLock:(os_unfair_lock_s)a3
{
  self->_activeTasksLock = a3;
}

- (os_unfair_lock_s)activeTasksLock
{
  return self->_activeTasksLock;
}

- (void)setActiveTasks:(id)a3
{
}

- (NSMutableSet)activeTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)tasksHaveBeenEnqueued
{
  p_monitorTaskLock = &self->_monitorTaskLock;
  os_unfair_lock_lock(&self->_monitorTaskLock);
  self->_tasksEnqueued = 1;
  if (![(NSMutableSet *)self->_monitorTaskSet count])
  {
    [(UMUserSyncTask *)self->_monitorTask end];
    monitorTask = self->_monitorTask;
    self->_monitorTask = 0;

    self->_tasksInitialized = 1;
  }

  os_unfair_lock_unlock(p_monitorTaskLock);
}

- (void)restoredTaskActive:(id)a3
{
  id v4 = a3;
  if (!self->_tasksInitialized)
  {
    id v6 = v4;
    os_unfair_lock_lock(&self->_monitorTaskLock);
    [(NSMutableSet *)self->_monitorTaskSet removeObject:v6];
    if (![(NSMutableSet *)self->_monitorTaskSet count] && self->_tasksEnqueued)
    {
      [(UMUserSyncTask *)self->_monitorTask end];
      monitorTask = self->_monitorTask;
      self->_monitorTask = 0;

      self->_tasksInitialized = 1;
    }
    os_unfair_lock_unlock(&self->_monitorTaskLock);
    id v4 = v6;
  }
}

- (void)restoredTaskEnqueued:(id)a3
{
  id v4 = a3;
  if (!self->_tasksInitialized)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_monitorTaskLock);
    [(NSMutableSet *)self->_monitorTaskSet addObject:v5];
    os_unfair_lock_unlock(&self->_monitorTaskLock);
    id v4 = v5;
  }
}

- (void)uploadContent
{
  p_monitorTaskLock = &self->_monitorTaskLock;
  os_unfair_lock_lock(&self->_monitorTaskLock);
  if (!self->_tasksInitialized)
  {
    id v4 = +[UMUserSyncTask taskWithName:@"nsurlsession bg task" reason:@"monitor"];
    monitorTask = self->_monitorTask;
    self->_monitorTask = v4;

    [(UMUserSyncTask *)self->_monitorTask begin];
  }

  os_unfair_lock_unlock(p_monitorTaskLock);
}

- (void)endUMTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_activeTasksLock = &self->_activeTasksLock;
    os_unfair_lock_lock(&self->_activeTasksLock);
    [(NSMutableSet *)self->_activeTasks removeObject:v4];
    os_unfair_lock_unlock(&self->_activeTasksLock);
    [v4 end];
    id v6 = +[NSURLCredentialStorage sharedCredentialStorage];
    v7 = [v6 allCredentials];

    if (v7)
    {
      v8 = +[NSMutableSet set];
      os_unfair_lock_lock(&self->_activeTasksLock);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v9 = self->_activeTasks;
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) bundleID];
            [v8 addObject:v13];

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      os_unfair_lock_unlock(p_activeTasksLock);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10004DA18;
      v15[3] = &unk_1000B5A10;
      id v14 = v8;
      id v16 = v14;
      [v7 enumerateKeysAndObjectsUsingBlock:v15];
    }
  }
}

- (void)endBridgingUMTask:(id)a3
{
  id v4 = a3;
  bridgeTasks = self->_bridgeTasks;
  id v10 = v4;
  id v6 = [v4 uniqueIdentifier];
  v7 = [(NSMutableDictionary *)bridgeTasks objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 end];
    v8 = self->_bridgeTasks;
    v9 = [v10 uniqueIdentifier];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];
  }
}

- (void)startBridgingUMTask:(id)a3
{
  id v12 = a3;
  if (+[NDUserSyncStakeholder EDUMode])
  {
    id v4 = +[Daemon sharedDaemon];
    if ([v4 isInSyncBubble])
    {
    }
    else
    {
      if ([v12 taskKind] != (id)1)
      {
        v9 = v4;
        goto LABEL_8;
      }
      id v5 = [v12 originalRequest];
      [v5 _timeWindowDelay];
      double v7 = v6;

      if (v7 != 0.0) {
        goto LABEL_9;
      }
    }
    v8 = [v12 bundleID];
    v9 = +[UMUserSyncTask taskWithName:@"nsurlsession bg task" reason:@"retry" forBundleID:v8];

    [v9 begin];
    bridgeTasks = self->_bridgeTasks;
    uint64_t v11 = [v12 uniqueIdentifier];
    [(NSMutableDictionary *)bridgeTasks setObject:v9 forKeyedSubscript:v11];

LABEL_8:
  }
LABEL_9:
}

- (id)startUMTask:(id)a3 taskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[NDUserSyncStakeholder EDUMode])
  {
    v8 = +[Daemon sharedDaemon];
    if ([v8 isInSyncBubble])
    {

LABEL_6:
      id v12 = +[UMUserSyncTask taskWithName:@"nsurlsession bg task" reason:@"client" forBundleID:v6];
      os_unfair_lock_lock(&self->_activeTasksLock);
      [(NSMutableSet *)self->_activeTasks addObject:v12];
      os_unfair_lock_unlock(&self->_activeTasksLock);
      [v12 begin];
      goto LABEL_9;
    }
    if ([v7 taskKind] == (id)1)
    {
      v9 = [v7 originalRequest];
      [v9 _timeWindowDelay];
      double v11 = v10;

      if (v11 == 0.0) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (NDUserSyncStakeholder)init
{
  v10.receiver = self;
  v10.super_class = (Class)NDUserSyncStakeholder;
  v2 = [(NDUserSyncStakeholder *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    activeTasks = v2->_activeTasks;
    v2->_activeTasks = (NSMutableSet *)v3;

    v2->_tasksInitialized = 0;
    v2->_activeTasksLock._os_unfair_lock_opaque = 0;
    v2->_monitorTaskLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = objc_opt_new();
    monitorTaskSet = v2->_monitorTaskSet;
    v2->_monitorTaskSet = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    bridgeTasks = v2->_bridgeTasks;
    v2->_bridgeTasks = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (BOOL)EDUMode
{
  v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isMultiUser];

  return v3;
}

+ (id)sharedStakeholder
{
  if (qword_1000CB0F8 != -1) {
    dispatch_once(&qword_1000CB0F8, &stru_1000B59C0);
  }
  v2 = (void *)qword_1000CB100;

  return v2;
}

@end