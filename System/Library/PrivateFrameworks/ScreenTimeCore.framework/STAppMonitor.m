@interface STAppMonitor
- (BOOL)operationInProgress;
- (BOOL)running;
- (NSBackgroundActivityScheduler)appDiscoveryActivity;
- (NSMutableSet)cachedAppBundleIdentifiers;
- (NSOperationQueue)operationQueue;
- (STAppMonitor)initWithPersistenceController:(id)a3;
- (STPersistenceControllerProtocol)persistenceController;
- (void)_didDetectNewAppUsage:(id)a3;
- (void)_scheduleAppDiscoveryBackgroundActivity;
- (void)_updateLocalAppsWithBackgroundActivity:(id)a3 completionHandler:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)resume;
- (void)setAppDiscoveryActivity:(id)a3;
- (void)setCachedAppBundleIdentifiers:(id)a3;
- (void)setOperationInProgress:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
@end

@implementation STAppMonitor

- (STAppMonitor)initWithPersistenceController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STAppMonitor;
  v6 = [(STAppMonitor *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceController, a3);
    uint64_t v8 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_operationQueue setName:@"com.apple.ScreenTimeAgent.app-monitor"];
    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:17];
    [(NSOperationQueue *)v7->_operationQueue setSuspended:0];
    v7->_operationInProgress = 0;
    uint64_t v10 = objc_opt_new();
    cachedAppBundleIdentifiers = v7->_cachedAppBundleIdentifiers;
    v7->_cachedAppBundleIdentifiers = (NSMutableSet *)v10;

    v7->_running = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STAppMonitor;
  [(STAppMonitor *)&v4 dealloc];
}

- (void)resume
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 addObserver:self];

  [(STAppMonitor *)self _updateLocalAppsWithBackgroundActivity:0 completionHandler:0];
  [(STAppMonitor *)self setRunning:1];
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)_didDetectNewAppUsage:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"AppMonitorUsageUpdatedBundleIdentifiers"];

  if (v7)
  {
    id v5 = [(STAppMonitor *)self cachedAppBundleIdentifiers];
    v6 = +[NSMutableSet setWithArray:v7];
    [v6 minusSet:v5];
    if ([v6 count])
    {
      [(STAppMonitor *)self _scheduleAppDiscoveryBackgroundActivity];
      [v5 unionSet:v6];
    }
  }
  else
  {
    [(STAppMonitor *)self _scheduleAppDiscoveryBackgroundActivity];
  }
}

- (void)_scheduleAppDiscoveryBackgroundActivity
{
  id v3 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.ScreenTimeAgent.app-discovery"];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_DISK_INTENSIVE, 1);
  [v3 _setAdditionalXPCActivityProperties:v4];
  id v5 = +[STLog appMonitor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling app discovery activity", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009C4C;
  v7[3] = &unk_1002FB410;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v6 scheduleWithBlock:v7];
}

- (void)_updateLocalAppsWithBackgroundActivity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_operationQueue;
  objc_sync_enter(v8);
  if (self->_operationInProgress)
  {
    v9 = +[STLog appMonitor];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10025A860(v9);
    }

    objc_sync_exit(v8);
    uint64_t v10 = (STPersistLocalAppsOperation *)v8;
  }
  else
  {
    self->_operationInProgress = 1;
    objc_sync_exit(v8);

    v11 = [[STPersistLocalAppsOperation alloc] initWithPersistenceController:self->_persistenceController installedApps:0 backgroundActivity:v6];
    [(NSOperationQueue *)v8 addOperation:v11];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009DDC;
    v12[3] = &unk_1002FB438;
    v12[4] = self;
    objc_super v13 = v11;
    id v14 = v7;
    uint64_t v10 = v11;
    [(NSOperationQueue *)v8 addOperationWithBlock:v12];
  }
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSBackgroundActivityScheduler)appDiscoveryActivity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppDiscoveryActivity:(id)a3
{
}

- (NSMutableSet)cachedAppBundleIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedAppBundleIdentifiers:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)operationInProgress
{
  return self->_operationInProgress;
}

- (void)setOperationInProgress:(BOOL)a3
{
  self->_operationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_appDiscoveryActivity, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end