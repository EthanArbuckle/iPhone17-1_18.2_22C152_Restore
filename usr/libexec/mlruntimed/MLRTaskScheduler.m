@interface MLRTaskScheduler
- (BOOL)allowBypassDiagnosticsUsage:(id)a3;
- (BOOL)diagnosticsUsageAllowed;
- (BOOL)taskIsDeferred;
- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5;
- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5 bundleRegistry:(id)a6 recordStoreManager:(id)a7;
- (double)_maxTimeLimitForBundle:(id)a3;
- (id)_requestedToStopError;
- (id)filterPluginIDs:(id)a3;
- (id)tasksForPluginIDs:(id)a3;
- (void)_completeTaskRunWithResult:(id)a3 error:(id)a4;
- (void)_scheduleNextTask;
- (void)_startTasks:(id)a3 completion:(id)a4;
- (void)createTaskWorkerForShadowEvaluationTask:(id)a3 completion:(id)a4;
- (void)createTaskWorkerForTask:(id)a3 completion:(id)a4;
- (void)startTasks:(id)a3 completion:(id)a4;
- (void)startTasksForPluginIDs:(id)a3 completion:(id)a4;
- (void)stop;
- (void)updateInterval;
@end

@implementation MLRTaskScheduler

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5
{
  return [(MLRTaskScheduler *)self initWithBaseURL:a3 localeIdentifier:a4 fromDesTool:a5 bundleRegistry:0 recordStoreManager:0];
}

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5 bundleRegistry:(id)a6 recordStoreManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)MLRTaskScheduler;
  v17 = [(MLRTaskScheduler *)&v38 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseURL, a3);
    if (v15)
    {
      v19 = (DESBundleRegistryManaging *)v15;
    }
    else
    {
      v19 = +[DESBundleRegistry sharedInstance];
    }
    bundleRegistry = v18->_bundleRegistry;
    v18->_bundleRegistry = v19;

    if (v16) {
      v21 = (DESRecordStoreManager *)v16;
    }
    else {
      v21 = (DESRecordStoreManager *)objc_opt_new();
    }
    recordStoreManager = v18->_recordStoreManager;
    v18->_recordStoreManager = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskWorker", v23);
    taskWorkerQueue = v18->_taskWorkerQueue;
    v18->_taskWorkerQueue = (OS_dispatch_queue *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskStop", v26);
    taskStopQueue = v18->_taskStopQueue;
    v18->_taskStopQueue = (OS_dispatch_queue *)v27;

    v18->_alwaysRun = DESShouldAlwaysParticipate() | a5;
    if (v14)
    {
      v29 = (NSString *)v14;
    }
    else
    {
      DESGetDeviceLocale();
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    localeIdentifier = v18->_localeIdentifier;
    v18->_localeIdentifier = v29;

    uint64_t v31 = +[NSHashTable weakObjectsHashTable];
    workers = v18->_workers;
    v18->_workers = (NSHashTable *)v31;

    v33 = [[MLRPluginFactory alloc] initWithBundleRegistry:v18->_bundleRegistry];
    pluginFactory = v18->_pluginFactory;
    v18->_pluginFactory = v33;

    uint64_t v35 = objc_opt_new();
    trialManager = v18->_trialManager;
    v18->_trialManager = (MLRTrialManager *)v35;
  }
  return v18;
}

- (id)_requestedToStopError
{
  uint64_t v2 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Requested to defer by DAS.";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v4 = +[NSError errorWithDomain:v2 code:1902 userInfo:v3];

  return v4;
}

- (void)_scheduleNextTask
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskWorkerQueue);
  v3 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E2E0((uint64_t)self, v3);
  }

  if (self->_numOfCompletedTasks == self->_numOfExpectedTasks)
  {
    [(MLRTaskScheduler *)self _completeTaskRunWithResult:0 error:0];
    return;
  }
  if (self->_requestedToStop)
  {
    v4 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Task scheduling deferred by DAS.", buf, 2u);
    }

    id v5 = [(MLRTaskScheduler *)self _requestedToStopError];
    [(MLRTaskScheduler *)self _completeTaskRunWithResult:0 error:v5];
  }
  else
  {
    if (![(NSMutableArray *)self->_tasks count]) {
      return;
    }
    NSErrorUserInfoKey v6 = [(NSMutableArray *)self->_tasks lastObject];
    [(NSMutableArray *)self->_tasks removeLastObject];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CB54;
    v7[3] = &unk_100018A68;
    id v8 = v6;
    v9 = self;
    id v5 = v6;
    [(MLRTaskScheduler *)self createTaskWorkerForTask:v5 completion:v7];
  }
}

- (void)createTaskWorkerForShadowEvaluationTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = (void (**)(id, MLRTrialShadowExperimentTaskWorker *, void))a4;
  if (self->_trialManager)
  {
    pluginFactory = self->_pluginFactory;
    v9 = [v6 bundleIdentifier];
    id v16 = 0;
    v10 = [(MLRPluginFactory *)pluginFactory pluginWithBundleIdentifier:v9 errorOut:&v16];
    id v11 = v16;

    if (v10)
    {
      v12 = [[MLRTrialShadowExperimentTaskWorker alloc] initWithTrialManager:self->_trialManager plugin:v10 alwaysRun:self->_alwaysRun];
      id v13 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v6 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created worker=%@ for plugin=%@.", buf, 0x16u);
      }
      v7[2](v7, v12, 0);
    }
    else
    {
      ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, id))v7)[2](v7, 0, v11);
    }
  }
  else
  {
    uint64_t v15 = kDESDistributedEvaluationErrorDomain;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Nil _trialManager. Please make sure Trial Framework is present.";
    id v11 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v10 = +[NSError errorWithDomain:v15 code:1903 userInfo:v11];
    ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, void *))v7)[2](v7, 0, v10);
  }
}

- (void)createTaskWorkerForTask:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 source] == (id)1) {
    [(MLRTaskScheduler *)self createTaskWorkerForShadowEvaluationTask:v8 completion:v6];
  }
}

- (void)_completeTaskRunWithResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskWorkerQueue);
  [(MLRTaskScheduler *)self updateInterval];
  completionAfterTaskRun = (void (**)(id, id, id))self->_completionAfterTaskRun;
  if (completionAfterTaskRun)
  {
    completionAfterTaskRun[2](completionAfterTaskRun, v10, v6);
    id v8 = self->_completionAfterTaskRun;
  }
  else
  {
    id v8 = 0;
  }
  self->_completionAfterTaskRun = 0;

  self->_numOfCompletedTasks = 0;
  self->_numOfExpectedTasks = 0;
  tasks = self->_tasks;
  self->_tasks = 0;

  self->_busy = 0;
}

- (void)updateInterval
{
  id v2 = (id)objc_opt_new();
  [v2 updateWakeUpPeriodInSeconds];
}

- (double)_maxTimeLimitForBundle:(id)a3
{
  id v3 = a3;
  double v4 = 5.0;
  if (([v3 isEqualToString:MLRuntimePluginID_DPMLRuntimePluginClassB] & 1) == 0)
  {
    if ([v3 isEqualToString:MLRuntimePluginID_FedStatsPluginClassB]) {
      double v4 = 5.0;
    }
    else {
      double v4 = 0.0;
    }
  }

  return v4;
}

- (BOOL)diagnosticsUsageAllowed
{
  return _DESDiagnosticsSubmissionAllowed(self, a2);
}

- (BOOL)allowBypassDiagnosticsUsage:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:MLRuntimePluginID_DPMeadPlugin] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_FedStatsPluginNonDnU] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_MediaMLPluginApp] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_RepackagingPlugin] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:MLRuntimePluginID_SiriCoreMetricsPlugin];
  }

  return v4;
}

- (void)_startTasks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = (void (**)(id, void, void *))a4;
  if ([v6 count])
  {
    if (self->_busy)
    {
      uint64_t v8 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"Task Scheduler busy.";
      v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v10 = +[NSError errorWithDomain:v8 code:1901 userInfo:v9];
      v7[2](v7, 0, v10);
    }
    else if (self->_requestedToStop)
    {
      id v11 = [(MLRTaskScheduler *)self _requestedToStopError];
      v7[2](v7, 0, v11);
    }
    else
    {
      self->_busy = 1;
      v12 = (NSMutableArray *)[v6 mutableCopy];
      tasks = self->_tasks;
      self->_tasks = v12;

      id v14 = [v7 copy];
      id completionAfterTaskRun = self->_completionAfterTaskRun;
      self->_id completionAfterTaskRun = v14;

      id v16 = [(NSMutableArray *)self->_tasks count];
      self->_numOfCompletedTasks = 0;
      self->_unint64_t numOfExpectedTasks = (unint64_t)v16;
      v17 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        unint64_t numOfExpectedTasks = self->_numOfExpectedTasks;
        int v19 = 134217984;
        unint64_t v20 = numOfExpectedTasks;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Starting scheduling %ld tasks.", (uint8_t *)&v19, 0xCu);
      }

      +[DESBitacoraEventManager sendEventActivityScheduled];
      [(MLRTaskScheduler *)self _scheduleNextTask];
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)startTasks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    taskWorkerQueue = self->_taskWorkerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DA98;
    block[3] = &unk_100018A90;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(taskWorkerQueue, block);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (id)tasksForPluginIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = (char *)[(DESBundleRegistryManaging *)self->_bundleRegistry pluginTypeForBundleId:v11];
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 != (char *)4)
          {
            v17 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10000E4D4(v11, v17);
            }

            NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
            v18 = +[NSString stringWithFormat:@"bundleID=%@", v11];
            v26 = v18;
            int v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Invalid pluginType" userInfo:v19];

            objc_exception_throw(v20);
          }
          id v14 = [MLRSchedulingTask alloc];
          [(MLRTaskScheduler *)self _maxTimeLimitForBundle:v11];
          id v13 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:maxTimeLimit:](v14, "initWithBundleIdentifier:taskSource:maxTimeLimit:", v11, 1);
        }
        else
        {
          id v13 = [[MLRSchedulingTask alloc] initWithBundleIdentifier:v11 taskSource:1];
        }
        uint64_t v15 = v13;
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)filterPluginIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  unsigned __int8 v6 = [(MLRTaskScheduler *)self diagnosticsUsageAllowed];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v12);
        if (-[DESBundleRegistryManaging containsBundleId:](self->_bundleRegistry, "containsBundleId:", v13, v19, (void)v20))
        {
          if ((v6 & 1) != 0
            || [(MLRTaskScheduler *)self allowBypassDiagnosticsUsage:v13])
          {
            [v5 addObject:v13];
            id v14 = +[DESLogging coreChannel];
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_13;
            }
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            uint64_t v15 = v14;
            id v16 = "Found plugin %@";
          }
          else
          {
            id v14 = +[DESLogging coreChannel];
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_13;
            }
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            uint64_t v15 = v14;
            id v16 = "Cannot schedule plugin=%@ because D&U is not enabled";
          }
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
        }
        else
        {
          id v14 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot schedule plugin=%@ because it is missing", buf, 0xCu);
          }
        }
LABEL_13:

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v17 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      id v10 = v17;
    }
    while (v17);
  }

  return v5;
}

- (void)startTasksForPluginIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MLRTaskScheduler *)self filterPluginIDs:a3];
  [v7 _fides_shuffledArray];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(MLRTaskScheduler *)self tasksForPluginIDs:v9];
  [(MLRTaskScheduler *)self startTasks:v8 completion:v6];
}

- (void)stop
{
  self->_requestedToStop = 1;
  taskWorkerQueue = self->_taskWorkerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E09C;
  block[3] = &unk_100018708;
  block[4] = self;
  dispatch_async(taskWorkerQueue, block);
}

- (BOOL)taskIsDeferred
{
  return self->_requestedToStop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginFactory, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong(&self->_completionAfterTaskRun, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_workers, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_taskStopQueue, 0);
  objc_storeStrong((id *)&self->_taskWorkerQueue, 0);
  objc_storeStrong((id *)&self->_recordStoreManager, 0);
  objc_storeStrong((id *)&self->factory, 0);
  objc_storeStrong((id *)&self->_bundleRegistry, 0);

  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end