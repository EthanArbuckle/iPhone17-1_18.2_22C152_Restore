@interface NDNotificationPoolRefreshManager
- (FCNewsAppConfigurationManager)configManager;
- (NDNotificationPoolRefreshManager)init;
- (NDNotificationPoolRefreshManager)initWithNotificationPool:(id)a3 configManager:(id)a4;
- (NDScoredNotificationPool)notificationPool;
- (void)_cancelSystemTask;
- (void)_handleSystemTask:(id)a3;
- (void)_prepareToHandleSystemTask;
- (void)_setupSystemTask;
- (void)activate;
@end

@implementation NDNotificationPoolRefreshManager

- (NDNotificationPoolRefreshManager)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDNotificationPoolRefreshManager init]";
    __int16 v7 = 2080;
    v8 = "NDNotificationPoolRefreshManager.m";
    __int16 v9 = 1024;
    int v10 = 31;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDNotificationPoolRefreshManager init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDNotificationPoolRefreshManager)initWithNotificationPool:(id)a3 configManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NDNotificationPoolRefreshManager;
  __int16 v9 = [(NDNotificationPoolRefreshManager *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationPool, a3);
    objc_storeStrong((id *)&v10->_configManager, a4);
  }

  return v10;
}

- (void)activate
{
  v3 = [(NDNotificationPoolRefreshManager *)self configManager];
  id v4 = [v3 possiblyUnfetchedAppConfiguration];
  unsigned __int8 v5 = [v4 useNotificationsV2];

  if (v5)
  {
    [(NDNotificationPoolRefreshManager *)self _prepareToHandleSystemTask];
    [(NDNotificationPoolRefreshManager *)self _setupSystemTask];
  }
  else
  {
    [(NDNotificationPoolRefreshManager *)self _cancelSystemTask];
  }
}

- (void)_prepareToHandleSystemTask
{
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  [v3 deregisterTaskWithIdentifier:@"com.apple.newsd.notifications.refresh"];

  objc_initWeak(&location, self);
  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001143C;
  v8[3] = &unk_100061DE8;
  objc_copyWeak(&v9, &location);
  unsigned int v5 = [v4 registerForTaskWithIdentifier:@"com.apple.newsd.notifications.refresh" usingQueue:0 launchHandler:v8];

  v6 = FCNotificationsLog;
  if (v5)
  {
    if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "successfully registered handler for notification pool refresh task", v7, 2u);
    }
  }
  else if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    sub_100048654(v6);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupSystemTask
{
  id v2 = [(NDNotificationPoolRefreshManager *)self configManager];
  v3 = [v2 possiblyUnfetchedAppConfiguration];
  uint64_t v4 = (uint64_t)[v3 notificationPoolAutoRefreshInterval];

  if (v4 <= 300) {
    uint64_t v5 = 300;
  }
  else {
    uint64_t v5 = v4;
  }
  objc_opt_class();
  v6 = +[BGSystemTaskScheduler sharedScheduler];
  id v7 = [v6 taskRequestForIdentifier:@"com.apple.newsd.notifications.refresh"];
  id v8 = FCDynamicCast();

  if (!v8)
  {
    int v10 = FCNotificationsLog;
    if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "will submit notification pool refresh task", buf, 2u);
    }
    id v11 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.newsd.notifications.refresh"];
    [v11 setInterval:(double)v5];
    [v11 setMinDurationBetweenInstances:(double)v5 * 0.8];
    [v11 setPriority:1];
    [v11 setPreventsDeviceSleep:1];
    [v11 setShouldWakeDevice:0];
    [v11 setNetworkDownloadSize:2000000];
    [v11 setExpectedDuration:10.0];
    [v11 setRelatedApplications:&off_100063E48];
    objc_super v12 = +[BGSystemTaskScheduler sharedScheduler];
    id v22 = 0;
    unsigned int v13 = [v12 submitTaskRequest:v11 error:&v22];
    id v14 = v22;

    v15 = FCNotificationsLog;
    if (v13)
    {
      if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "successfully submitted notification pool refresh task", buf, 2u);
      }
    }
    else if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      sub_100048698((uint64_t)v14, v15);
    }

    goto LABEL_22;
  }
  [v8 interval];
  if (v5 != (uint64_t)v9)
  {
    v16 = (void *)FCNotificationsLog;
    if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      [v8 interval];
      *(_DWORD *)buf = 134218240;
      uint64_t v25 = (uint64_t)v18;
      __int16 v26 = 2048;
      uint64_t v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "will update notification pool refresh task interval, old=%lld, new=%lld", buf, 0x16u);
    }
    [v8 setInterval:(double)v5];
    [v8 setMinDurationBetweenInstances:(double)v5 * 0.8];
    v19 = +[BGSystemTaskScheduler sharedScheduler];
    id v23 = 0;
    unsigned int v20 = [v19 updateTaskRequest:v8 error:&v23];
    id v11 = v23;

    v21 = FCNotificationsLog;
    if (v20)
    {
      if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "successfully updated notification pool refresh task", buf, 2u);
      }
    }
    else if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      sub_100048710((uint64_t)v11, v21);
    }
LABEL_22:

    goto LABEL_23;
  }
  sub_10001184C();
LABEL_23:
}

- (void)_handleSystemTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FCNotificationsLog;
  if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "will handle notification pool refresh task", buf, 2u);
  }
  v6 = [(NDNotificationPoolRefreshManager *)self notificationPool];
  id v7 = +[NSDate date];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000119C8;
  v9[3] = &unk_100061E10;
  id v10 = v4;
  id v8 = v4;
  [v6 refreshIfOlderThan:v7 completionHandler:v9];
}

- (void)_cancelSystemTask
{
  id v2 = +[BGSystemTaskScheduler sharedScheduler];
  v3 = [v2 taskRequestForIdentifier:@"com.apple.newsd.notifications.refresh"];

  if (v3)
  {
    id v4 = FCNotificationsLog;
    if (os_log_type_enabled(FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "will cancel notification pool refresh task", v6, 2u);
    }
    uint64_t v5 = +[BGSystemTaskScheduler sharedScheduler];
    [v5 cancelTaskRequestWithIdentifier:@"com.apple.newsd.notifications.refresh" error:0];
  }
}

- (NDScoredNotificationPool)notificationPool
{
  return self->_notificationPool;
}

- (FCNewsAppConfigurationManager)configManager
{
  return self->_configManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configManager, 0);

  objc_storeStrong((id *)&self->_notificationPool, 0);
}

@end