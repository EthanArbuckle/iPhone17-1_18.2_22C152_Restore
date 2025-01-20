@interface NDCloudContainer
+ (id)bundleIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4;
+ (id)containerIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (BOOL)supportsWakes;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (NDCloudContainer)initWithIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)containerDidEnterBackground:(id)a3;
- (void)containerDidEnterForeground:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NDCloudContainer

+ (id)containerIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = +[BRContainersMonitor containerIDFromPrimaryIdentifier:v5 secondaryIdentifier:v6];
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)containerDidEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Container %@ entered foreground", buf, 0xCu);
  }
  self->_isForeground = 1;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    [(NDApplication *)&v6 invokeSelectorForAllObservers:"applicationEnteredForeground:"];
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;
}

- (void)containerDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Container %@ entered background", buf, 0xCu);
  }
  self->_isForeground = 0;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    [(NDApplication *)&v6 invokeSelectorForAllObservers:"applicationNoLongerInForeground:"];
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  [(NDApplication *)&v6 removeObserver:v4];
  if (![(NSMutableArray *)v5->super._observers count]) {
    [(BRContainersMonitor *)v5->_monitor removeObserver:v5 forContainerID:v5->super._bundleIdentifier];
  }
  objc_sync_exit(v5);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableArray *)v5->super._observers count]) {
    [(BRContainersMonitor *)v5->_monitor addObserver:v5 forContainerID:v5->super._bundleIdentifier];
  }
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  [(NDApplication *)&v6 addObserver:v4];
  objc_sync_exit(v5);
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  return 0;
}

- (BOOL)supportsWakes
{
  return 0;
}

- (BOOL)isForeground
{
  if (!self->_initializedForegroundStateFromMonitorCallback)
  {
    unsigned int v3 = +[BRContainersMonitor isContainerIDForeground:self->super._bundleIdentifier];
    self->_isForeground = v3;
    id v4 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->super._bundleIdentifier;
      if (v3) {
        int v6 = 89;
      }
      else {
        int v6 = 78;
      }
      int v8 = 138412546;
      v9 = bundleIdentifier;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Being asked if container with identifier %@ is foreground before getting callback from BRContainersMonitor! Foreground state is %c", (uint8_t *)&v8, 0x12u);
    }
  }
  return self->_isForeground;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (NDCloudContainer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDCloudContainer;
  id v5 = [(NDApplication *)&v9 initWithIdentifier:v4];
  if (v5)
  {
    int v6 = (BRContainersMonitor *)objc_alloc_init((Class)BRContainersMonitor);
    monitor = v5->_monitor;
    v5->_monitor = v6;

    v5->_initializedForegroundStateFromMonitorCallback = 0;
  }

  return v5;
}

+ (id)bundleIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  int v8 = 0;
  if (v5 && v6)
  {
    int v8 = +[BRContainersMonitor bundleIDFromPrimaryIdentifier:v5 secondaryIdentifier:v6];
  }

  return v8;
}

@end