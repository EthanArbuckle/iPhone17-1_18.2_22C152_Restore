@interface _DASBackgroundAppKillDemo
+ (id)sharedInstance;
- (NSMutableDictionary)appNameToTerminationRequestDict;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (RBSProcessMonitor)processMonitor;
- (_DASBackgroundAppKillDemo)init;
- (id)createTerminationRequestForProcessHandle:(id)a3;
- (void)handleNotification;
- (void)processUpdateHandlerWithMonitor:(id)a3 withHandle:(id)a4 withUpdate:(id)a5;
- (void)setAppNameToTerminationRequestDict:(id)a3;
- (void)setLog:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)startKilling;
- (void)stopKilling;
@end

@implementation _DASBackgroundAppKillDemo

+ (id)sharedInstance
{
  if (qword_1001C4080 != -1) {
    dispatch_once(&qword_1001C4080, &stru_100176938);
  }
  v2 = (void *)qword_1001C4088;

  return v2;
}

- (_DASBackgroundAppKillDemo)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DASBackgroundAppKillDemo;
  v2 = [(_DASBackgroundAppKillDemo *)&v17 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "bgappkilldemo");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created BGAppKillDemo instance", buf, 2u);
    }
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.BGAppKillDemo", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    appNameToTerminationRequestDict = v2->_appNameToTerminationRequestDict;
    v2->_appNameToTerminationRequestDict = (NSMutableDictionary *)v9;

    v11 = v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006CEF4;
    handler[3] = &unk_1001759D0;
    v12 = v2;
    v15 = v12;
    notify_register_dispatch("com.apple.dasd.BGAppKillDemo.statusChanged", (int *)&unk_1001C4090, v11, handler);
    [(_DASBackgroundAppKillDemo *)v12 handleNotification];
  }
  return v2;
}

- (id)createTerminationRequestForProcessHandle:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc_init((Class)RBSTerminateContext) initWithExplanation:@"BG Kill Demo"];
  [v5 setMaximumTerminationResistance:40];
  v6 = +[RBSProcessPredicate predicateMatchingHandle:v4];
  id v7 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v6 context:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = log;
    v10 = [v7 debugDescription];
    v11 = [v4 bundle];
    v12 = [v11 identifier];
    int v14 = 138412546;
    v15 = v10;
    __int16 v16 = 2112;
    objc_super v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Termination request %@ created for %@", (uint8_t *)&v14, 0x16u);
  }

  return v7;
}

- (void)handleNotification
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.appResume"];
  if ([v3 BOOLForKey:@"BGAppKillDemo"]) {
    [(_DASBackgroundAppKillDemo *)self startKilling];
  }
  else {
    [(_DASBackgroundAppKillDemo *)self stopKilling];
  }
}

- (void)startKilling
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Starting killing apps in the background", buf, 2u);
  }
  id v4 = +[RBSProcessPredicate predicateMatchingLaunchServicesProcesses];
  id v5 = +[RBSProcessStateDescriptor descriptor];
  [v5 setValues:1];
  [v5 setEndowmentNamespaces:&off_100187A50];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D2AC;
  v15[3] = &unk_100176810;
  v15[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006D3A4;
  v11[3] = &unk_100176960;
  id v12 = v4;
  id v13 = v5;
  int v14 = objc_retainBlock(v15);
  v6 = v14;
  id v7 = v5;
  id v8 = v4;
  uint64_t v9 = +[RBSProcessMonitor monitorWithConfiguration:v11];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v9;
}

- (void)stopKilling
{
  [(NSMutableDictionary *)self->_appNameToTerminationRequestDict removeAllObjects];
  processMonitor = self->_processMonitor;
  if (processMonitor) {
    [(RBSProcessMonitor *)processMonitor invalidate];
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Stopped killing apps in the background", v5, 2u);
  }
}

- (void)processUpdateHandlerWithMonitor:(id)a3 withHandle:(id)a4 withUpdate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 state];
  if ([v9 taskState] == 4)
  {
    v10 = [v8 state];
    v11 = [v10 endowmentNamespaces];
    unsigned int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];

    if (v12)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = log;
        v15 = [v7 bundle];
        __int16 v16 = [v15 identifier];
        *(_DWORD *)buf = 138412290;
        v49 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "App %@ foregrounded, creating a termination request", buf, 0xCu);
      }
      objc_super v17 = [(_DASBackgroundAppKillDemo *)self createTerminationRequestForProcessHandle:v7];
      appNameToTerminationRequestDict = self->_appNameToTerminationRequestDict;
      id v19 = [v7 bundle];
      v20 = [v19 identifier];
      [(NSMutableDictionary *)appNameToTerminationRequestDict setObject:v17 forKeyedSubscript:v20];
      goto LABEL_22;
    }
  }
  else
  {
  }
  v21 = [v8 state];
  unsigned int v22 = [v21 taskState];

  if (v22 == 3)
  {
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = [v7 bundle];
      v26 = [v25 identifier];
      *(_DWORD *)buf = 138412290;
      v49 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "App %@ suspended", buf, 0xCu);
    }
    v27 = self->_appNameToTerminationRequestDict;
    v28 = [v7 bundle];
    v29 = [v28 identifier];
    v30 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v29];

    if (v30)
    {
      v31 = self->_appNameToTerminationRequestDict;
      v32 = [v7 bundle];
      v33 = [v32 identifier];
      objc_super v17 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:v33];

      v34 = self->_log;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "Executing termination request %@", buf, 0xCu);
      }
      id v47 = 0;
      unsigned int v35 = [v17 execute:&v47];
      id v19 = v47;
      v36 = self->_log;
      BOOL v37 = os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          v38 = v36;
          v39 = [v7 bundle];
          v40 = [v39 identifier];
          *(_DWORD *)buf = 138412290;
          v49 = v40;
          v41 = "App %@ should be killed";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
        }
      }
      else if (v37)
      {
        v38 = v36;
        v39 = [v7 bundle];
        v40 = [v39 identifier];
        *(_DWORD *)buf = 138412290;
        v49 = v40;
        v41 = "App %@ couldn't be killed";
        goto LABEL_20;
      }
      v45 = self->_appNameToTerminationRequestDict;
      v20 = [v7 bundle];
      v46 = [v20 identifier];
      [(NSMutableDictionary *)v45 removeObjectForKey:v46];

LABEL_22:
      goto LABEL_23;
    }
    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      objc_super v17 = [v7 bundle];
      v44 = [v17 identifier];
      *(_DWORD *)buf = 138412290;
      v49 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Termination request wasn't created for %@", buf, 0xCu);

LABEL_23:
    }
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)appNameToTerminationRequestDict
{
  return self->_appNameToTerminationRequestDict;
}

- (void)setAppNameToTerminationRequestDict:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_appNameToTerminationRequestDict, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end