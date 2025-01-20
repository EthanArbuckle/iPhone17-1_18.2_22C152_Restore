@interface MLRTrialShadowExperimentTaskWorker
- (BOOL)_DASAllowTask:(id)a3 error:(id *)a4;
- (BOOL)_pluginSupportTrialTask:(id *)a3;
- (BOOL)canRunTask:(id)a3;
- (BOOL)requestedToStop;
- (BOOL)updateTaskAfterCompletion:(id)a3 taskID:(id)a4 error:(id *)a5;
- (DESDebugRecord)debugRecord;
- (MLRTrialShadowExperimentTaskWorker)initWithTrialManager:(id)a3 plugin:(id)a4 alwaysRun:(BOOL)a5;
- (id)telemetryResponse;
- (void)_performAfterTask:(id)a3 duration:(double)a4 error:(id)a5;
- (void)runWithCompletion:(id)a3;
- (void)stop;
@end

@implementation MLRTrialShadowExperimentTaskWorker

- (MLRTrialShadowExperimentTaskWorker)initWithTrialManager:(id)a3 plugin:(id)a4 alwaysRun:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v20 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000A1DC(v20);
    }
    goto LABEL_10;
  }
  if (!v9)
  {
    v20 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000A220(v20);
    }
LABEL_10:

    v19 = 0;
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)MLRTrialShadowExperimentTaskWorker;
  v11 = [(MLRTrialShadowExperimentTaskWorker *)&v22 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("MLRTrialShadowExperimentTaskWorker", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_plugin, a4);
    objc_storeStrong((id *)&v11->_trialManager, a3);
    v11->_alwaysRun = a5;
    id v15 = objc_alloc((Class)DESDebugRecord);
    v16 = [v10 bundleIdentifier];
    v17 = (DESDebugRecord *)[v15 initWithPluginID:v16 taskSource:1];
    debugRecord = v11->_debugRecord;
    v11->_debugRecord = v17;
  }
  self = v11;
  v19 = self;
LABEL_11:

  return v19;
}

- (BOOL)canRunTask:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_alwaysRun)
  {
    if (!v4)
    {
      id v9 = +[NSString stringWithFormat:@"Nil scheduling policy."];
      v21 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000A264();
      }

      debugRecord = self->_debugRecord;
      id v10 = [0 taskID];
      [(DESDebugRecord *)debugRecord addForTaskID:v10 result:1 description:v9];
      goto LABEL_15;
    }
    v7 = [MLRTaskSchedulingRecord alloc];
    v8 = [v5 taskID];
    id v9 = [(MLRTaskSchedulingRecord *)v7 initWithTaskID:v8];

    id v10 = +[NSDate date];
    id v11 = [(MLRTaskSchedulingRecord *)v9 performCount];
    if (v11 >= [v5 maxPerformCount])
    {
      id v23 = [(MLRTaskSchedulingRecord *)v9 performCount];
      v24 = [(DESPluginManaging *)self->_plugin bundleIdentifier];
      v19 = +[NSString stringWithFormat:@"Cannot run: too many times (%ld), plugin=%@, policy=%@", v23, v24, v5];

      v20 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v19;
        goto LABEL_13;
      }
    }
    else
    {
      v12 = [(MLRTaskSchedulingRecord *)v9 lastCompletionDate];
      [v10 timeIntervalSinceDate:v12];
      double v14 = v13;
      [v5 minInterval];
      double v16 = v15;

      if (v14 >= v16)
      {
        v28 = [v5 startAfterDate];
        id v29 = [v10 compare:v28];

        if (v29 == (id)-1)
        {
          v33 = [(DESPluginManaging *)self->_plugin bundleIdentifier];
          v19 = +[NSString stringWithFormat:@"Cannot run: too early to run, plugin=%@, policy=%@", v33, v5];

          v20 = +[DESLogging coreChannel];
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          v35 = v19;
        }
        else
        {
          v30 = [v5 endAtDate];
          id v31 = [v10 compare:v30];

          if (v31 != (id)1)
          {
            BOOL v6 = 1;
            goto LABEL_16;
          }
          v32 = [(DESPluginManaging *)self->_plugin bundleIdentifier];
          v19 = +[NSString stringWithFormat:@"Cannot run: too late to run, plugin=%@, policy=%@", v32, v5];

          v20 = +[DESLogging coreChannel];
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          v35 = v19;
        }
        goto LABEL_13;
      }
      v17 = [(MLRTaskSchedulingRecord *)v9 lastCompletionDate];
      v18 = [(DESPluginManaging *)self->_plugin bundleIdentifier];
      v19 = +[NSString stringWithFormat:@"Cannot run: too soon since last completion date (%@), plugin=%@, policy=%@", v17, v18, v5];

      v20 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v19;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
LABEL_14:

    v25 = self->_debugRecord;
    v26 = [v5 taskID];
    [(DESDebugRecord *)v25 addForTaskID:v26 result:1 description:v19];

LABEL_15:
    BOOL v6 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v6 = 1;
LABEL_17:

  return v6;
}

- (BOOL)updateTaskAfterCompletion:(id)a3 taskID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    id v11 = [[MLRTaskSchedulingRecord alloc] initWithTaskID:v9];
    [(MLRTaskSchedulingRecord *)v11 setLastCompletionDate:v8];
    [(MLRTaskSchedulingRecord *)v11 setPerformCount:(char *)[(MLRTaskSchedulingRecord *)v11 performCount] + 1];
    if ([(MLRTaskSchedulingRecord *)v11 commitWithError:a5]) {
      LOBYTE(a5) = [(DESDebugRecord *)self->_debugRecord commitWithError:a5];
    }
    else {
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    uint64_t v12 = kDESDistributedEvaluationErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Nil TaskID or completionDate";
    double v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    *a5 = +[NSError errorWithDomain:v12 code:1400 userInfo:v13];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)_performAfterTask:(id)a3 duration:(double)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(DESPluginManaging *)self->_plugin bundleIdentifier];
  *(float *)&a4 = a4;
  id v11 = v8;
  id v12 = v9;
  double v13 = [v11 evaluationID];
  LODWORD(v14) = LODWORD(a4);
  +[DESCoreAnalyticsEventManager sendEventEvaluationForBundleID:v10 evaluationID:v13 duration:0 deferred:v9 == 0 success:v12 error:0 downloadedAttachmentCount:v14];

  NSErrorUserInfoKey v15 = sub_10000A0FC(v11);

  +[DESBitacoraEventManager sendEventTaskCompletedForBundleID:v10 identifiers:v15 error:v12];
  if (v9)
  {
    if (self->_requestedToStop)
    {
LABEL_10:
      debugRecord = self->_debugRecord;
      v26 = [v11 policy];
      v27 = [v26 taskID];
      v28 = [v12 description];
      [(DESDebugRecord *)debugRecord addForTaskID:v27 result:2 description:v28];

      goto LABEL_11;
    }
  }
  else
  {
    CFStringRef v16 = self->_debugRecord;
    v17 = [v11 policy];
    v18 = [v17 taskID];
    [(DESDebugRecord *)v16 addForTaskID:v18 result:0 description:0];
  }
  v19 = +[NSDate date];
  v20 = [v11 policy];
  v21 = [v20 taskID];
  id v29 = 0;
  unsigned __int8 v22 = [(MLRTrialShadowExperimentTaskWorker *)self updateTaskAfterCompletion:v19 taskID:v21 error:&v29];
  id v23 = v29;

  if ((v22 & 1) == 0)
  {
    v24 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10000A2D8();
    }
  }
  if (v9) {
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)_pluginSupportTrialTask:(id *)a3
{
  p_plugin = &self->_plugin;
  char v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) == 0)
  {
    if (a3)
    {
      uint64_t v6 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      CFStringRef v11 = @"Plugin doesn't support trial task.";
      v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      *a3 = +[NSError errorWithDomain:v6 code:5000 userInfo:v7];
    }
    id v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000A35C((id *)p_plugin, v8);
    }
  }
  return v5 & 1;
}

- (BOOL)_DASAllowTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL requestedToStop = self->_requestedToStop;
  if (self->_requestedToStop)
  {
    id v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAS requests to stop task = %@", buf, 0xCu);
    }

    debugRecord = self->_debugRecord;
    NSErrorUserInfoKey v10 = [v6 policy];
    CFStringRef v11 = [v10 taskID];
    [(DESDebugRecord *)debugRecord addForTaskID:v11 result:3 description:0];

    if (a4)
    {
      uint64_t v12 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Evaluation has been deferred";
      double v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a4 = +[NSError errorWithDomain:v12 code:2 userInfo:v13];
    }
  }

  return !requestedToStop;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009BFC;
  v7[3] = &unk_100018888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  self->_BOOL requestedToStop = 1;
  [(DESPluginManaging *)self->_plugin stopWithCompletion:&stru_100018910];
}

- (id)telemetryResponse
{
  return 0;
}

- (BOOL)requestedToStop
{
  return self->_requestedToStop;
}

- (DESDebugRecord)debugRecord
{
  return self->_debugRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRecord, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end