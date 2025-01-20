@interface _DASTrialManager
+ (_DASTrialManager)sharedInstance;
+ (id)sharedInstanceForNamespace:(id)a3;
+ (void)initialize;
- (BOOL)handleTrialContinuation:(id)a3;
- (BOOL)handleTrialEnd:(id)a3;
- (BOOL)handleTrialStart:(id)a3;
- (BOOL)handleTrialUpdate:(id)a3;
- (BOOL)matches:(id)a3 withCache:(id)a4;
- (NSMutableArray)delegates;
- (NSString)experimentID;
- (NSString)namespace;
- (NSString)treatmentID;
- (NSUserDefaults)defaults;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_DASTrialManager)initWithNamespaceName:(id)a3;
- (id)factorWithName:(id)a3;
- (id)readFromDefaults;
- (int)deploymentID;
- (int)token;
- (os_unfair_lock_s)lock;
- (void)addDelegate:(id)a3;
- (void)clear;
- (void)saveToDefaults:(id)a3;
- (void)sendToPowerLog:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDeploymentID:(int)a3;
- (void)setExperimentID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setTimer:(id)a3;
- (void)setToken:(int)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)startTimer;
- (void)updateFactors;
- (void)updateKernelWithDASIdentifiers;
@end

@implementation _DASTrialManager

+ (void)initialize
{
  uint64_t v2 = +[NSMutableArray array];
  v3 = (void *)qword_1001C3B68;
  qword_1001C3B68 = v2;

  dword_1001C3B70 = 0;
}

+ (_DASTrialManager)sharedInstance
{
  if (qword_1001C3B78 != -1) {
    dispatch_once(&qword_1001C3B78, &stru_100175980);
  }
  uint64_t v2 = (void *)qword_1001C3B80;

  return (_DASTrialManager *)v2;
}

+ (id)sharedInstanceForNamespace:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001C3B70);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)qword_1001C3B68;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      v10 = [v9 namespace:v14];
      unsigned __int8 v11 = [v10 isEqual:v3];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = [[_DASTrialManager alloc] initWithNamespaceName:v3];
  [(id)qword_1001C3B68 addObject:v12];
LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001C3B70);

  return v12;
}

- (_DASTrialManager)initWithNamespaceName:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_DASTrialManager;
  id v6 = [(_DASTrialManager *)&v26 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_namespace, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[_DASDaemonLogger logForCategory:@"TrialManager"];
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = +[TRIClient clientWithIdentifier:222];
    trialClient = v7->_trialClient;
    v7->_trialClient = (TRIClient *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_trialClient;
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    uint64_t v14 = +[NSMutableArray array];
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableArray *)v14;

    long long v16 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler.trial"];
    defaults = v7->_defaults;
    v7->_defaults = v16;

    objc_initWeak((id *)buf, v7);
    v18 = v7->_trialClient;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002A708;
    v24[3] = &unk_1001759A8;
    objc_copyWeak(&v25, (id *)buf);
    id v19 = [(TRIClient *)v18 addUpdateHandlerForNamespaceName:v5 usingBlock:v24];
    [(_DASTrialManager *)v7 updateFactors];
    [(_DASTrialManager *)v7 updateKernelWithDASIdentifiers];
    v20 = dispatch_get_global_queue(-32768, 0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002A7A0;
    v22[3] = &unk_1001759D0;
    v23 = v7;
    notify_register_dispatch("com.apple.dasd.trial", &v7->_token, v20, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  return v7;
}

- (void)updateFactors
{
  [(TRIClient *)self->_trialClient refresh];
  uint64_t v3 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_namespace];
  id v4 = self->_experimentID;
  id v5 = self->_treatmentID;
  int deploymentID = self->_deploymentID;
  v31 = (void *)v3;
  if ([(_DASTrialManager *)self handleTrialStart:v3])
  {
    log = self->_log;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    treatmentID = self->_treatmentID;
    experimentID = self->_experimentID;
    int v10 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v39 = experimentID;
    __int16 v40 = 2112;
    v41 = treatmentID;
    __int16 v42 = 1024;
    int v43 = v10;
    unsigned __int8 v11 = "Trial Experiment Started, experiment: %@, treatment: %@, deployment: %d";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, v11, buf, 0x1Cu);
    goto LABEL_14;
  }
  if ([(_DASTrialManager *)self handleTrialUpdate:v3])
  {
    log = self->_log;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    v13 = self->_treatmentID;
    v12 = self->_experimentID;
    int v14 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v39 = v12;
    __int16 v40 = 2112;
    v41 = v13;
    __int16 v42 = 1024;
    int v43 = v14;
    unsigned __int8 v11 = "Trial Experiment Updated, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  if ([(_DASTrialManager *)self handleTrialEnd:v3])
  {
    log = self->_log;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138412802;
    v39 = v4;
    __int16 v40 = 2112;
    v41 = v5;
    __int16 v42 = 1024;
    int v43 = deploymentID;
    unsigned __int8 v11 = "Trial Experiment Ended, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  unsigned int v15 = [(_DASTrialManager *)self handleTrialContinuation:v3];
  log = self->_log;
  BOOL v16 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (!v16) {
      goto LABEL_14;
    }
    v18 = self->_treatmentID;
    long long v17 = self->_experimentID;
    int v19 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    __int16 v42 = 1024;
    int v43 = v19;
    unsigned __int8 v11 = "Trial Experiment Found, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "No Trial Experiments Found", buf, 2u);
  }
  [(_DASTrialManager *)self clear];
LABEL_14:
  v29 = v5;
  v30 = v4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v20 = self->_delegates;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        objc_super v26 = self->_log;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Calling out Trial handler blocks", buf, 2u);
        }
        v27 = dispatch_get_global_queue(-2, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002ABD8;
        block[3] = &unk_100175570;
        block[4] = v25;
        block[5] = self;
        dispatch_async(v27, block);
      }
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16, lock, v29, v30, v31);
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);
}

- (id)factorWithName:(id)a3
{
  return [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_namespace];
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSMutableArray *)self->_delegates addObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)updateKernelWithDASIdentifiers
{
  treatmentID = self->_treatmentID;
  if (treatmentID)
  {
    if (self->_experimentID)
    {
      [(NSString *)treatmentID UTF8String];
      strlen([(NSString *)self->_treatmentID UTF8String]);
      __strncpy_chk();
      [(NSString *)self->_experimentID UTF8String];
      strlen([(NSString *)self->_experimentID UTF8String]);
      __strncpy_chk();
      if (!memorystatus_control())
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
          sub_1000F3CAC((os_log_t)log);
        }
      }
    }
  }
}

- (BOOL)handleTrialStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 experimentId], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6)
    && ([(_DASTrialManager *)self readFromDefaults],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    int v10 = [v5 treatmentId];
    treatmentID = self->_treatmentID;
    self->_treatmentID = v10;

    v12 = [v5 experimentId];
    experimentID = self->_experimentID;
    self->_experimentID = v12;

    self->_int deploymentID = [v5 deploymentId];
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [v14 setObject:self->_experimentID forKeyedSubscript:@"trialExperimentId"];
    [v14 setObject:self->_treatmentID forKeyedSubscript:@"trialTreatmentId"];
    unsigned int v15 = +[NSNumber numberWithInt:self->_deploymentID];
    [v14 setObject:v15 forKeyedSubscript:@"trialDeploymentId"];

    BOOL v16 = +[NSDate now];
    [v14 setObject:v16 forKeyedSubscript:@"trialStartDate"];

    [(_DASTrialManager *)self saveToDefaults:v14];
    [(_DASTrialManager *)self sendToPowerLog:v14];
    [(_DASTrialManager *)self startTimer];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)handleTrialUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 experimentId], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [(_DASTrialManager *)self readFromDefaults];
    id v8 = [v7 mutableCopy];

    if (v8 && ![(_DASTrialManager *)self matches:v5 withCache:v8])
    {
      int v10 = +[NSDate date];
      [v8 setObject:v10 forKeyedSubscript:@"trialEndDate"];

      [(_DASTrialManager *)self sendToPowerLog:v8];
      unsigned __int8 v11 = [v5 treatmentId];
      treatmentID = self->_treatmentID;
      self->_treatmentID = v11;

      v13 = [v5 experimentId];
      experimentID = self->_experimentID;
      self->_experimentID = v13;

      self->_int deploymentID = [v5 deploymentId];
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      [v15 setObject:self->_experimentID forKeyedSubscript:@"trialExperimentId"];
      [v15 setObject:self->_treatmentID forKeyedSubscript:@"trialTreatmentId"];
      BOOL v16 = +[NSNumber numberWithInt:self->_deploymentID];
      [v15 setObject:v16 forKeyedSubscript:@"trialDeploymentId"];

      long long v17 = +[NSDate date];
      [v15 setObject:v17 forKeyedSubscript:@"trialStartDate"];

      [(_DASTrialManager *)self saveToDefaults:v15];
      [(_DASTrialManager *)self sendToPowerLog:v15];

      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)handleTrialEnd:(id)a3
{
  if (a3) {
    return 0;
  }
  id v5 = [(_DASTrialManager *)self readFromDefaults];
  id v6 = [v5 mutableCopy];

  BOOL v3 = v6 != 0;
  if (v6)
  {
    uint64_t v7 = +[NSDate date];
    [v6 setObject:v7 forKeyedSubscript:@"trialEndDate"];

    [(_DASTrialManager *)self sendToPowerLog:v6];
    [(_DASTrialManager *)self clear];
  }

  return v3;
}

- (BOOL)handleTrialContinuation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 experimentId], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [(_DASTrialManager *)self readFromDefaults];
    id v8 = [v7 mutableCopy];

    if (v8 && [(_DASTrialManager *)self matches:v5 withCache:v8])
    {
      BOOL v9 = [v5 treatmentId];
      treatmentID = self->_treatmentID;
      self->_treatmentID = v9;

      unsigned __int8 v11 = [v5 experimentId];
      experimentID = self->_experimentID;
      self->_experimentID = v11;

      self->_int deploymentID = [v5 deploymentId];
      [(_DASTrialManager *)self sendToPowerLog:v8];
      [(_DASTrialManager *)self startTimer];
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)readFromDefaults
{
  return [(NSUserDefaults *)self->_defaults objectForKey:@"trialDictionary"];
}

- (void)saveToDefaults:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count]) {
    [(NSUserDefaults *)self->_defaults setObject:v5 forKey:@"trialDictionary"];
  }
  else {
    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"trialDictionary"];
  }
  [(NSUserDefaults *)self->_defaults synchronize];
}

- (BOOL)matches:(id)a3 withCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 experimentId];
  id v8 = [v6 objectForKeyedSubscript:@"trialExperimentId"];
  if ([v7 isEqualToString:v8])
  {
    BOOL v9 = [v5 treatmentId];
    int v10 = [v6 objectForKeyedSubscript:@"trialTreatmentId"];
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 deploymentId]);
      v12 = [v6 objectForKeyedSubscript:@"trialDeploymentId"];
      unsigned __int8 v13 = [v11 isEqualToNumber:v12];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)startTimer
{
  if (!self->_timer)
  {
    BOOL v3 = dispatch_get_global_queue(-32768, 0);
    id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    timer = self->_timer;
    self->_timer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    id v6 = self->_timer;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002B538;
    v7[3] = &unk_1001753B0;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler(v6, v7);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)clear
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
  treatmentID = self->_treatmentID;
  self->_treatmentID = 0;

  experimentID = self->_experimentID;
  self->_experimentID = 0;

  self->_int deploymentID = 0;

  [(_DASTrialManager *)self saveToDefaults:0];
}

- (void)sendToPowerLog:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"powerlog"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3CF0((uint64_t)v4, v5);
    }

    uint64_t v6 = [v4 objectForKeyedSubscript:@"trialStartDate"];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      id v8 = [v4 objectForKeyedSubscript:@"trialStartDate"];
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      if (v10 > -1209600.0) {
        PLLogRegisteredEvent();
      }
    }
  }
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_int deploymentID = a3;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_os_unfair_lock_t lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);

  objc_storeStrong((id *)&self->_treatmentID, 0);
}

@end