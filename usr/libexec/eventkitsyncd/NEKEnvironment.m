@interface NEKEnvironment
+ (id)instance;
- (BOOL)isReminderKitEnabled;
- (NEKDaemon)daemon;
- (NEKDatabaseFileManager)dbFileManager;
- (NEKEnvironment)init;
- (NEKRecordMap)recordMap;
- (NEKSeenMap)seenMap;
- (NEKSessionAnalytics)analytics;
- (NEKSyncController)syncController;
- (NEKSyncCoordinator)syncCoordinator;
- (NEKTinyStore)tinyStore;
- (NSString)clientName;
- (void)setAnalytics:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setSyncController:(id)a3;
@end

@implementation NEKEnvironment

- (NEKEnvironment)init
{
  v7.receiver = self;
  v7.super_class = (Class)NEKEnvironment;
  v2 = [(NEKEnvironment *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    controllerCondition = v3->_controllerCondition;
    v3->_controllerCondition = v4;
  }
  return v3;
}

- (NEKDatabaseFileManager)dbFileManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_dbFileManager)
  {
    v4 = objc_alloc_init(NEKDatabaseFileManager);
    dbFileManager = self->_dbFileManager;
    self->_dbFileManager = v4;
  }
  os_unfair_lock_unlock(p_lock);
  v6 = self->_dbFileManager;

  return v6;
}

- (NEKTinyStore)tinyStore
{
  v3 = [(NEKEnvironment *)self dbFileManager];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_tinyStore)
  {
    v4 = [[NEKTinyStore alloc] initWithDatabaseManager:v3];
    tinyStore = self->_tinyStore;
    self->_tinyStore = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
  v6 = self->_tinyStore;

  return v6;
}

- (NEKRecordMap)recordMap
{
  v3 = [(NEKEnvironment *)self dbFileManager];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_recordMap)
  {
    v4 = [[NEKRecordMap alloc] initWithDatabaseManager:v3];
    recordMap = self->_recordMap;
    self->_recordMap = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
  v6 = self->_recordMap;

  return v6;
}

- (NEKSeenMap)seenMap
{
  v3 = [(NEKEnvironment *)self dbFileManager];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_seenMap)
  {
    v4 = [[NEKSeenMap alloc] initWithDatabaseManager:v3];
    seenMap = self->_seenMap;
    self->_seenMap = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
  v6 = self->_seenMap;

  return v6;
}

- (NEKSyncCoordinator)syncCoordinator
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_syncCoordinator)
  {
    v4 = [[NEKSyncCoordinator alloc] initWithEnvironment:self];
    syncCoordinator = self->_syncCoordinator;
    self->_syncCoordinator = v4;
  }
  os_unfair_lock_unlock(p_lock);
  v6 = self->_syncCoordinator;

  return v6;
}

- (NEKSyncController)syncController
{
  [(NEKEnvironment *)self tinyStore];

  [(NEKEnvironment *)self recordMap];
  [(NSCondition *)self->_controllerCondition lock];
  while (!self->_syncController)
    [(NSCondition *)self->_controllerCondition wait];
  [(NSCondition *)self->_controllerCondition broadcast];
  [(NSCondition *)self->_controllerCondition unlock];
  syncController = self->_syncController;

  return syncController;
}

- (NSString)clientName
{
  v3 = [(NEKEnvironment *)self dbFileManager];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_clientName)
  {
    v4 = [v3 pairingID];
    v5 = +[NSString stringWithFormat:@"com.apple.eventkitsync.changeobserver.%@", v4];
    clientName = self->_clientName;
    self->_clientName = v5;
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_super v7 = self->_clientName;

  return v7;
}

- (void)setSyncController:(id)a3
{
  v4 = (NEKSyncController *)a3;
  [(NSCondition *)self->_controllerCondition lock];
  syncController = self->_syncController;
  self->_syncController = v4;
  v6 = v4;

  [(NSCondition *)self->_controllerCondition broadcast];
  [(NSCondition *)self->_controllerCondition unlock];
}

- (NEKSessionAnalytics)analytics
{
  v3 = [(NEKEnvironment *)self dbFileManager];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_analytics)
  {
    v4 = [[NEKSessionAnalytics alloc] initWithFileManager:v3];
    analytics = self->_analytics;
    self->_analytics = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
  v6 = self->_analytics;

  return v6;
}

- (BOOL)isReminderKitEnabled
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && +[REMStore performSelector:"isEventKitSyncEnabledForReminderKit"] != 0;
}

+ (id)instance
{
  if (qword_1000C6B30 != -1) {
    dispatch_once(&qword_1000C6B30, &stru_1000A8B20);
  }
  v2 = (void *)qword_1000C6B38;

  return v2;
}

- (NEKDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void)setAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_seenMap, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong((id *)&self->_tinyStore, 0);
  objc_storeStrong((id *)&self->_dbFileManager, 0);
  objc_storeStrong((id *)&self->_syncController, 0);

  objc_storeStrong((id *)&self->_controllerCondition, 0);
}

@end