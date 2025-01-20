@interface FMFAppStateObserver
+ (id)sharedInstance;
- (FMFAppStateObserver)init;
- (void)dealloc;
- (void)detectedAppInstallStateChanged:(id)a3;
@end

@implementation FMFAppStateObserver

+ (id)sharedInstance
{
  if (qword_10006D5B0 != -1) {
    dispatch_once(&qword_10006D5B0, &stru_100059E78);
  }
  v2 = (void *)qword_10006D5A8;

  return v2;
}

- (FMFAppStateObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMFAppStateObserver;
  v2 = [(FMFAppStateObserver *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"detectedAppInstallStateChanged:" name:off_10006CD70 object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:off_10006CD70 object:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFAppStateObserver;
  [(FMFAppStateObserver *)&v4 dealloc];
}

- (void)detectedAppInstallStateChanged:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];

  v6 = [v3 userInfo];

  v7 = [v6 objectForKeyedSubscript:@"isPlaceholder"];
  unsigned int v8 = [v7 BOOLValue];

  if ((objc_msgSend(v5, "fm_any:", &stru_100059EB8) & 1) != 0 || !v8)
  {
    v9 = +[SystemConfig sharedInstance];
    unsigned int v10 = [v9 isFMFAppRemoved];

    v11 = sub_10001B6D4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v10 ^ 1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected install state change event for Find My app - installed: %d.", (uint8_t *)v12, 8u);
    }
  }
}

@end