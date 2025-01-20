@interface APConfigSystemBackgroundTask
- (APConfigSystemBackgroundTask)initWithConfigurationStorage:(id)a3;
- (APConfigurationStorage)configurationStorage;
- (OS_dispatch_queue)requestQueue;
- (id)_launchHandler;
- (id)_storefront;
- (int64_t)_configurationPollValue;
- (void)_expireTask:(id)a3;
- (void)_submitNewTask;
- (void)registerTask;
- (void)setRequestQueue:(id)a3;
@end

@implementation APConfigSystemBackgroundTask

- (APConfigSystemBackgroundTask)initWithConfigurationStorage:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APConfigSystemBackgroundTask;
  v6 = [(APConfigSystemBackgroundTask *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationStorage, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ap.configurationsystem.request", v9);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)registerTask
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Register Config System Background Task.", buf, 2u);
  }

  v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [(APConfigSystemBackgroundTask *)self requestQueue];
  v6 = [(APConfigSystemBackgroundTask *)self _launchHandler];
  [v4 registerForTaskWithIdentifier:@"com.apple.ap.promotedcontentd.configsystemrequest" usingQueue:v5 launchHandler:v6];

  v7 = +[BGSystemTaskScheduler sharedScheduler];
  v8 = [v7 taskRequestForIdentifier:@"com.apple.ap.promotedcontentd.configsystemrequest"];

  if (v8)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Config System Background Task Already Exists.", v10, 2u);
    }
  }
  else
  {
    [(APConfigSystemBackgroundTask *)self _submitNewTask];
  }
}

- (int64_t)_configurationPollValue
{
  v2 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  v3 = [v2 poll];

  if (v3)
  {
    v4 = [v2 poll];
    id v5 = [v4 integerValue];
  }
  else
  {
    id v5 = (id)kDefaultConfigSystemPollValue;
  }
  if ((uint64_t)v5 >= kConfigSystemMaxCappingPollValue) {
    id v5 = (id)kConfigSystemMaxCappingPollValue;
  }

  return (int64_t)v5;
}

- (id)_launchHandler
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A0D4;
  v4[3] = &unk_10022E508;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)_expireTask:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  unsigned int v4 = [v3 setTaskExpiredWithRetryAfter:&v9 error:3000.0];
  id v5 = v9;
  v6 = APLogForCategory();
  v7 = v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Config System Background Task retry after Success.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to retry after config system task, error: %{public}@", buf, 0xCu);
    }

    [v3 setTaskCompleted];
  }
}

- (void)_submitNewTask
{
  id v3 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.ap.promotedcontentd.configsystemrequest"];
  [v3 setRequiresNetworkConnectivity:1];
  [v3 setRequiresExternalPower:0];
  [v3 setPriority:1];
  [v3 setRequiresProtectionClass:3];
  double v4 = (double)[(APConfigSystemBackgroundTask *)self _configurationPollValue];
  [v3 setInterval:v4];
  [v3 setMinDurationBetweenInstances:v4 * 0.8];
  id v5 = +[BGSystemTaskScheduler sharedScheduler];
  id v13 = 0;
  unsigned __int8 v6 = [v5 submitTaskRequest:v3 error:&v13];
  id v7 = v13;

  BOOL v8 = APLogForCategory();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Config System Background Task Registered Correctly.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = [v7 description];
    id v11 = (void *)v10;
    CFStringRef v12 = @"Unknown";
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to submit Config System Background Task with error: %{public}@", buf, 0xCu);
  }
}

- (id)_storefront
{
  v2 = +[APIDAccountProvider privateUserAccount];
  id v3 = [v2 storefront];
  double v4 = [v3 componentsSeparatedByString:@"-"];

  if ([v4 count])
  {
    id v5 = [v4 firstObject];
  }
  else
  {
    unsigned __int8 v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error creating storefront.", v8, 2u);
    }

    id v5 = @"NONE";
  }

  return v5;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (APConfigurationStorage)configurationStorage
{
  return self->_configurationStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationStorage, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end