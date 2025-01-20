@interface _APRSRecommendationEngine
+ (id)sharedInstance;
- (BOOL)freezerDisabled;
- (BOOL)isAppRunning:(id)a3;
- (BOOL)prewarmDisabled;
- (BOOL)wasAppForegrounded:(id)a3;
- (NSArray)dockingRecommendations;
- (NSArray)freezerDemotionRecommendations;
- (NSArray)freezerRecommendations;
- (NSArray)jetsamDemotionRecommendations;
- (NSArray)prewarmRecommendations;
- (NSMutableDictionary)foregroundedApps;
- (NSMutableDictionary)runningApps;
- (NSString)name;
- (OS_os_log)log;
- (RBSProcessMonitor)appMonitor;
- (_APRSFreezerRecommendation)freezerRecommender;
- (_APRSPrewarmRecommendation)prewarmRecommender;
- (_APRSRecommendationEngine)init;
- (double)version;
- (void)evaluateFreezerRecommendations;
- (void)evaluatePrewarmRecommendations;
- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4;
- (void)registerForTrial;
- (void)setAppMonitor:(id)a3;
- (void)setDockingRecommendations:(id)a3;
- (void)setForegroundedApps:(id)a3;
- (void)setFreezerDemotionRecommendations:(id)a3;
- (void)setFreezerDisabled:(BOOL)a3;
- (void)setFreezerRecommendations:(id)a3;
- (void)setFreezerRecommender:(id)a3;
- (void)setJetsamDemotionRecommendations:(id)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmDisabled:(BOOL)a3;
- (void)setPrewarmRecommendations:(id)a3;
- (void)setPrewarmRecommender:(id)a3;
- (void)setRunningApps:(id)a3;
- (void)updateCurrentRecommendations;
- (void)updateTrialParameters;
@end

@implementation _APRSRecommendationEngine

- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [v6 bundle];
  v10 = [v9 identifier];

  if (v10)
  {
    v11 = [v7 state];
    unsigned __int8 v12 = [v11 isRunning];

    runningApps = v8->_runningApps;
    if ((v12 & 1) == 0)
    {
      [(NSMutableDictionary *)runningApps removeObjectForKey:v10];
      v20 = +[LSApplicationProxy applicationProxyForIdentifier:v10];
      v18 = [v20 bundleExecutable];

      if (v18) {
        [(NSMutableDictionary *)v8->_foregroundedApps removeObjectForKey:v18];
      }
      if (byte_1001C41F8)
      {
        v21 = +[_APRSPrewarmInterface sharedInstance];
        id v22 = [v21 prewarmLaunchAppFromBundleID:v10];
      }
      goto LABEL_14;
    }
    [(NSMutableDictionary *)runningApps setObject:v6 forKey:v10];
    v14 = [v7 state];
    v15 = [v14 endowmentNamespaces];
    unsigned int v16 = [v15 containsObject:@"com.apple.frontboard.visibility"];

    if (v16)
    {
      v17 = +[LSApplicationProxy applicationProxyForIdentifier:v10];
      v18 = [v17 bundleExecutable];

      if (v18)
      {
        [(NSMutableDictionary *)v8->_foregroundedApps setObject:v6 forKey:v18];
      }
      else
      {
        log = v8->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_1000F960C((uint64_t)v10, log);
        }
      }
LABEL_14:
    }
  }
  else
  {
    v19 = v8->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No bundleIdentifier was associated with the process handle, aborting state transition", v24, 2u);
    }
  }

  objc_sync_exit(v8);
}

- (NSString)name
{
  return (NSString *)@"recommendationEngine1.0";
}

- (double)version
{
  return 1.0;
}

- (_APRSRecommendationEngine)init
{
  v24.receiver = self;
  v24.super_class = (Class)_APRSRecommendationEngine;
  v2 = [(_APRSRecommendationEngine *)&v24 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_freezerDisabled = 0;
    os_log_t v4 = os_log_create("com.apple.aprs", "appResume.RecomEngine");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    uint64_t v6 = +[_APRSFreezerRecommendation sharedInstance];
    freezerRecommender = v3->_freezerRecommender;
    v3->_freezerRecommender = (_APRSFreezerRecommendation *)v6;

    uint64_t v8 = +[_APRSPrewarmRecommendation sharedInstance];
    prewarmRecommender = v3->_prewarmRecommender;
    v3->_prewarmRecommender = (_APRSPrewarmRecommendation *)v8;

    [(_APRSRecommendationEngine *)v3 registerForTrial];
    [(_APRSRecommendationEngine *)v3 updateTrialParameters];
    id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    byte_1001C41F8 = [v10 BOOLForKey:@"prewarmOnAppDeath"];

    v11 = +[RBSProcessStateDescriptor descriptor];
    [v11 setValues:1];
    [v11 setEndowmentNamespaces:&off_100187A98];
    uint64_t v12 = +[NSMutableDictionary dictionary];
    foregroundedApps = v3->_foregroundedApps;
    v3->_foregroundedApps = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    runningApps = v3->_runningApps;
    v3->_runningApps = (NSMutableDictionary *)v14;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100083B74;
    v21[3] = &unk_100176F68;
    id v22 = v11;
    unsigned int v16 = v3;
    v23 = v16;
    id v17 = v11;
    uint64_t v18 = +[RBSProcessMonitor monitorWithConfiguration:v21];
    appMonitor = v16->_appMonitor;
    v16->_appMonitor = (RBSProcessMonitor *)v18;
  }
  return v3;
}

- (BOOL)wasAppForegrounded:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_foregroundedApps allKeys];
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)isAppRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_runningApps allKeys];
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

+ (id)sharedInstance
{
  if (qword_1001C4208 != -1) {
    dispatch_once(&qword_1001C4208, &stru_100176F88);
  }
  v2 = (void *)qword_1001C4200;

  return v2;
}

- (void)evaluateFreezerRecommendations
{
}

- (void)evaluatePrewarmRecommendations
{
}

- (void)updateCurrentRecommendations
{
  if (self->_freezerDisabled)
  {
    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    id v4 = [(_APRSFreezerRecommendation *)self->_freezerRecommender freezerRecommendations];
    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = v4;
  }

  if (self->_prewarmDisabled)
  {
    self->_prewarmRecommendations = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    self->_prewarmRecommendations = [(_APRSPrewarmRecommendation *)self->_prewarmRecommender recommendations];
  }

  _objc_release_x1();
}

- (void)registerForTrial
{
  id v3 = +[_DASTrialManager sharedInstance];
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = +[_DASTrialManager sharedInstance];
  id v4 = [v3 factorWithName:off_1001C2DB8];
  log = self->_log;
  BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      unsigned __int8 v7 = log;
      int v16 = 67109120;
      unsigned int v17 = [v4 BOOLeanValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: freezerDisabled set to %d", (uint8_t *)&v16, 8u);
    }
    self->_BOOL freezerDisabled = [v4 BOOLeanValue];
  }
  else if (v6)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load freezerDisabled", (uint8_t *)&v16, 2u);
  }
  uint64_t v8 = [v3 factorWithName:off_1001C2DC0];
  v9 = self->_log;
  BOOL v10 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      unsigned int v12 = [v8 BOOLeanValue];
      int v16 = 67109120;
      unsigned int v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: prewarmDisabled set to %d", (uint8_t *)&v16, 8u);
    }
    self->_BOOL prewarmDisabled = [v8 BOOLeanValue];
  }
  else if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmDisabled", (uint8_t *)&v16, 2u);
  }
  v13 = self->_log;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL freezerDisabled = self->_freezerDisabled;
    BOOL prewarmDisabled = self->_prewarmDisabled;
    int v16 = 67109376;
    unsigned int v17 = freezerDisabled;
    __int16 v18 = 1024;
    BOOL v19 = prewarmDisabled;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Freezer Disabled: %d, Prewarm Disabled: %d", (uint8_t *)&v16, 0xEu);
  }
}

- (RBSProcessMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
}

- (_APRSFreezerRecommendation)freezerRecommender
{
  return self->_freezerRecommender;
}

- (void)setFreezerRecommender:(id)a3
{
}

- (NSArray)freezerRecommendations
{
  return self->_freezerRecommendations;
}

- (void)setFreezerRecommendations:(id)a3
{
}

- (NSArray)freezerDemotionRecommendations
{
  return self->_freezerDemotionRecommendations;
}

- (void)setFreezerDemotionRecommendations:(id)a3
{
}

- (_APRSPrewarmRecommendation)prewarmRecommender
{
  return self->_prewarmRecommender;
}

- (void)setPrewarmRecommender:(id)a3
{
}

- (NSArray)prewarmRecommendations
{
  return self->_prewarmRecommendations;
}

- (void)setPrewarmRecommendations:(id)a3
{
}

- (NSArray)dockingRecommendations
{
  return self->_dockingRecommendations;
}

- (void)setDockingRecommendations:(id)a3
{
}

- (NSArray)jetsamDemotionRecommendations
{
  return self->_jetsamDemotionRecommendations;
}

- (void)setJetsamDemotionRecommendations:(id)a3
{
}

- (NSMutableDictionary)runningApps
{
  return self->_runningApps;
}

- (void)setRunningApps:(id)a3
{
}

- (NSMutableDictionary)foregroundedApps
{
  return self->_foregroundedApps;
}

- (void)setForegroundedApps:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)freezerDisabled
{
  return self->_freezerDisabled;
}

- (void)setFreezerDisabled:(BOOL)a3
{
  self->_BOOL freezerDisabled = a3;
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_BOOL prewarmDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_foregroundedApps, 0);
  objc_storeStrong((id *)&self->_runningApps, 0);
  objc_storeStrong((id *)&self->_jetsamDemotionRecommendations, 0);
  objc_storeStrong((id *)&self->_dockingRecommendations, 0);
  objc_storeStrong((id *)&self->_prewarmRecommendations, 0);
  objc_storeStrong((id *)&self->_prewarmRecommender, 0);
  objc_storeStrong((id *)&self->_freezerDemotionRecommendations, 0);
  objc_storeStrong((id *)&self->_freezerRecommendations, 0);
  objc_storeStrong((id *)&self->_freezerRecommender, 0);

  objc_storeStrong((id *)&self->_appMonitor, 0);
}

@end