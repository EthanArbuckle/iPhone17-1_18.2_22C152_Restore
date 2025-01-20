@interface _APRSManager
+ (_APRSManager)sharedInstance;
- (BOOL)classCUnlocked;
- (NSDate)signpostReaderDate;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_APRSBiomeAppKillEventWriter)appKillEventWriter;
- (_APRSBiomeEventAnalyzer)eventAnalyzer;
- (_APRSFreezerInterface)freezer;
- (_APRSManager)init;
- (_APRSPrewarmInterface)prewarmLauncher;
- (_APRSRecommendationEngine)engine;
- (_APRSSignpostReader)signpostReader;
- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor;
- (int)debugNotifyToken;
- (int)notifyToken;
- (void)extractResumeLaunchSignposts:(id)a3;
- (void)feedNewRecommendations;
- (void)setAppKillEventWriter:(id)a3;
- (void)setClassCUnlocked:(BOOL)a3;
- (void)setDataProtectionStateMonitor:(id)a3;
- (void)setDebugNotifyToken:(int)a3;
- (void)setDefaults:(id)a3;
- (void)setEngine:(id)a3;
- (void)setEventAnalyzer:(id)a3;
- (void)setFreezer:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPrewarmLauncher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSignpostReader:(id)a3;
- (void)setSignpostReaderDate:(id)a3;
- (void)setTimer:(id)a3;
- (void)setupTriggerWithHandler:(id)a3;
@end

@implementation _APRSManager

- (void)extractResumeLaunchSignposts:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = +[NSDate date];
  signpostReaderDate = self->_signpostReaderDate;
  if (!signpostReaderDate
    || ([(NSDate *)signpostReaderDate timeIntervalSinceDate:v6], v8 < -86400.0))
  {
    v9 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
    v10 = self->_signpostReaderDate;
    self->_signpostReaderDate = v9;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"com.apple.appResume.signpostReader";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Started %@!", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000DA034;
  v23[3] = &unk_100175628;
  v23[4] = &buf;
  [v4 setExpirationHandler:v23];
  [(_APRSSignpostReader *)self->_signpostReader begin];
  *(void *)&long long v12 = 134217984;
  long long v21 = v12;
  while (1)
  {
    -[NSDate timeIntervalSinceDate:](self->_signpostReaderDate, "timeIntervalSinceDate:", v6, v21);
    if (v13 >= -3600.0 || *(unsigned char *)(*((void *)&buf + 1) + 24)) {
      break;
    }
    v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      [(NSDate *)self->_signpostReaderDate timeIntervalSinceDate:v6];
      *(_DWORD *)v24 = v21;
      uint64_t v25 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEBUG, "Time interval %f", v24, 0xCu);
    }

    v15 = [(NSDate *)self->_signpostReaderDate dateByAddingTimeInterval:3600.0];
    [(_APRSSignpostReader *)self->_signpostReader logAppResumeAndLaunchesFrom:self->_signpostReaderDate endDate:v15];
    [(NSUserDefaults *)self->_defaults setObject:v15 forKey:@"signpostReaderDate"];
    v16 = self->_signpostReaderDate;
    self->_signpostReaderDate = v15;
  }
  [(_APRSSignpostReader *)self->_signpostReader end];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    id v22 = 0;
    unsigned __int8 v18 = [v4 setTaskExpiredWithRetryAfter:&v22 error:0.0];
    id v19 = v22;
    if ((v18 & 1) == 0)
    {
      v20 = self->_log;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
        sub_100100254((uint64_t)v19, v20);
      }
      [v4 setTaskCompleted];
    }
  }
  else
  {
    [v4 setTaskCompleted];
  }
  _Block_object_dispose(&buf, 8);
}

- (_APRSManager)init
{
  v45.receiver = self;
  v45.super_class = (Class)_APRSManager;
  v2 = [(_APRSManager *)&v45 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.manager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[_APRSRecommendationEngine sharedInstance];
    engine = v2->_engine;
    v2->_engine = (_APRSRecommendationEngine *)v5;

    uint64_t v7 = +[_APRSFreezerInterface sharedInstance];
    freezer = v2->_freezer;
    v2->_freezer = (_APRSFreezerInterface *)v7;

    uint64_t v9 = +[_APRSPrewarmInterface sharedInstance];
    prewarmLauncher = v2->_prewarmLauncher;
    v2->_prewarmLauncher = (_APRSPrewarmInterface *)v9;

    uint64_t v11 = objc_opt_new();
    signpostReader = v2->_signpostReader;
    v2->_signpostReader = (_APRSSignpostReader *)v11;

    double v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v13;

    uint64_t v15 = [(NSUserDefaults *)v2->_defaults objectForKey:@"signpostReaderDate"];
    signpostReaderDate = v2->_signpostReaderDate;
    v2->_signpostReaderDate = (NSDate *)v15;

    NSInteger v17 = [(NSUserDefaults *)v2->_defaults integerForKey:@"prewarmRecomputeInterval"];
    if (v17)
    {
      qword_1001C3840 = (int)v17;
      qword_1001C3848 = (int)v17 / 6;
    }
    unsigned __int8 v18 = +[BGSystemTaskScheduler sharedScheduler];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000DA514;
    v43[3] = &unk_100175600;
    id v19 = v2;
    v44 = v19;
    [v18 registerForTaskWithIdentifier:@"com.apple.appResume.signpostReader" usingQueue:0 launchHandler:v43];

    v20 = +[BGSystemTaskScheduler sharedScheduler];
    long long v21 = [v20 taskRequestForIdentifier:@"com.apple.appResume.signpostReader"];

    if (!v21)
    {
      id v22 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.appResume.signpostReader"];
      [v22 setPriority:1];
      [v22 setInterval:86400.0];
      [v22 setMinDurationBetweenInstances:85400.0];
      [v22 setRequiresUserInactivity:1];
      [v22 setResourceIntensive:1];
      [v22 setResources:7];
      [v22 setRequiresProtectionClass:3];
      [v22 setRequiresExternalPower:1];
      v23 = +[BGSystemTaskScheduler sharedScheduler];
      id v42 = 0;
      unsigned __int8 v24 = [v23 submitTaskRequest:v22 error:&v42];
      id v25 = v42;

      if ((v24 & 1) == 0)
      {
        v26 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v47 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
        }
      }
    }
    v19->_debugNotifyToken = -1;
    queue = v19->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000DA520;
    handler[3] = &unk_1001759D0;
    char v28 = v19;
    v41 = v28;
    notify_register_dispatch("com.apple.dasd.appResume.Signpost", &v19->_debugNotifyToken, queue, handler);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = dispatch_queue_attr_make_with_qos_class(v29, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.appresume.manager", v30);
    v32 = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v31;

    uint64_t v33 = +[_APRSBiomeAppKillEventWriter sharedInstance];
    appKillEventWriter = v28->_appKillEventWriter;
    v28->_appKillEventWriter = (_APRSBiomeAppKillEventWriter *)v33;

    uint64_t v35 = +[_APRSBiomeEventAnalyzer sharedInstance];
    eventAnalyzer = v28->_eventAnalyzer;
    v28->_eventAnalyzer = (_APRSBiomeEventAnalyzer *)v35;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000DA52C;
    v38[3] = &unk_1001754F8;
    v39 = v28;
    [(_APRSManager *)v39 setupTriggerWithHandler:v38];
  }
  return v2;
}

+ (_APRSManager)sharedInstance
{
  if (qword_1001C4428 != -1) {
    dispatch_once(&qword_1001C4428, &stru_100178210);
  }
  v2 = (void *)qword_1001C4420;

  return (_APRSManager *)v2;
}

- (void)setupTriggerWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = v5;

  dispatch_set_qos_class_fallback();
  uint64_t v7 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000DA888;
  handler[3] = &unk_100178238;
  id v8 = v4;
  id v26 = v8;
  dispatch_source_set_event_handler(v7, handler);
  uint64_t v9 = self->_timer;
  dispatch_time_t v10 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(v9, v10, 1000000000 * qword_1001C3840, 1000000000 * qword_1001C3848);
  uint64_t v11 = objc_alloc_init(_DASDataProtectionStateMonitor);
  dataProtectionStateMonitor = self->_dataProtectionStateMonitor;
  self->_dataProtectionStateMonitor = v11;

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000DA898;
  v22[3] = &unk_100175430;
  objc_copyWeak(&v23, &location);
  [(_DASDataProtectionStateMonitor *)self->_dataProtectionStateMonitor setChangeHandler:v22];
  double v13 = self->_dataProtectionStateMonitor;
  v14 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
  LODWORD(v13) = [(_DASDataProtectionStateMonitor *)v13 isDataAvailableFor:v14];

  if (v13)
  {
    self->_classCUnlocked = 1;
    dispatch_activate((dispatch_object_t)self->_timer);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", buf, 2u);
    }
  }
  self->_notifyToken = -1;
  p_notifyToken = &self->_notifyToken;
  NSInteger v17 = *(NSObject **)(p_notifyToken + 7);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000DA9F4;
  v19[3] = &unk_100178260;
  id v18 = v8;
  id v20 = v18;
  notify_register_dispatch("com.apple.aprs.triggerHandler", p_notifyToken, v17, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)feedNewRecommendations
{
  id v7 = (id)os_transaction_create();
  [(_APRSRecommendationEngine *)self->_engine evaluateFreezerRecommendations];
  [(_APRSRecommendationEngine *)self->_engine evaluatePrewarmRecommendations];
  [(_APRSRecommendationEngine *)self->_engine updateCurrentRecommendations];
  freezer = self->_freezer;
  id v4 = [(_APRSRecommendationEngine *)self->_engine freezerRecommendations];
  [(_APRSFreezerInterface *)freezer updateFreezer:v4];

  prewarmLauncher = self->_prewarmLauncher;
  v6 = [(_APRSRecommendationEngine *)self->_engine prewarmRecommendations];
  [(_APRSPrewarmInterface *)prewarmLauncher prewarmRecommendations:v6];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)signpostReaderDate
{
  return self->_signpostReaderDate;
}

- (void)setSignpostReaderDate:(id)a3
{
}

- (_APRSFreezerInterface)freezer
{
  return self->_freezer;
}

- (void)setFreezer:(id)a3
{
}

- (_APRSPrewarmInterface)prewarmLauncher
{
  return self->_prewarmLauncher;
}

- (void)setPrewarmLauncher:(id)a3
{
}

- (_APRSSignpostReader)signpostReader
{
  return self->_signpostReader;
}

- (void)setSignpostReader:(id)a3
{
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
}

- (_APRSRecommendationEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (_APRSBiomeAppKillEventWriter)appKillEventWriter
{
  return self->_appKillEventWriter;
}

- (void)setAppKillEventWriter:(id)a3
{
}

- (_APRSBiomeEventAnalyzer)eventAnalyzer
{
  return self->_eventAnalyzer;
}

- (void)setEventAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAnalyzer, 0);
  objc_storeStrong((id *)&self->_appKillEventWriter, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, 0);
  objc_storeStrong((id *)&self->_signpostReader, 0);
  objc_storeStrong((id *)&self->_prewarmLauncher, 0);
  objc_storeStrong((id *)&self->_freezer, 0);
  objc_storeStrong((id *)&self->_signpostReaderDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end