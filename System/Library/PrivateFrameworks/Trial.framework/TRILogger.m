@interface TRILogger
- (NSArray)logHandlers;
- (TRILogger)init;
- (TRILogger)initWithClient:(id)a3 projectId:(int)a4 logHandlers:(id)a5;
- (TRILogger)initWithProjectId:(int)a3;
- (TRILogger)initWithProjectId:(int)a3 logHandlers:(id)a4;
- (id)messageWithOneofField:(id)a3 withName:(id)a4;
- (unint64_t)_incrementedLogEventCount;
- (void)_dispatchLogEvent:(id)a3;
- (void)logEvent:(id)a3;
- (void)logWithMLRuntimeDimensions:(id)a3 metrics:(id)a4 factorState:(id)a5;
- (void)logWithNamespaceName:(id)a3 metrics:(id)a4 dimensions:(id)a5;
- (void)logWithProjectNameAndTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6;
- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5;
- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5 args:(char *)a6;
- (void)logWithTrackingId:(id)a3 message:(id)a4;
- (void)logWithTrackingId:(id)a3 metric:(id)a4;
- (void)logWithTrackingId:(id)a3 metric:(id)a4 dimensions:(id)a5;
- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5;
- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 systemDimensions:(id)a6 trialSystemTelemetry:(id)a7;
- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6;
@end

@implementation TRILogger

- (TRILogger)initWithClient:(id)a3 projectId:(int)a4 logHandlers:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TRILogger;
  v10 = [(TRILogger *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_client, v8);
    v11->_projectId = a4;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v17 = dispatch_queue_create(v14, v16);
    loggingQueue = v11->_loggingQueue;
    v11->_loggingQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [v9 copy];
    logHandlers = v11->_logHandlers;
    v11->_logHandlers = (NSArray *)v19;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandlers, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

- (TRILogger)init
{
  return [(TRILogger *)self initWithProjectId:0];
}

- (TRILogger)initWithProjectId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[TRILogger initWithProjectId:]";
    _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "called deprecated method %s", buf, 0xCu);
  }

  v6 = +[TRIClient clientWithIdentifier:v3];
  v7 = objc_opt_new();
  v11 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v9 = [(TRILogger *)self initWithClient:v6 projectId:v3 logHandlers:v8];

  if (v9) {
    v9->_projectId = v3;
  }

  return v9;
}

- (TRILogger)initWithProjectId:(int)a3 logHandlers:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = +[TRIClient clientWithIdentifier:v4];
  id v8 = [(TRILogger *)self initWithClient:v7 projectId:v4 logHandlers:v6];

  return v8;
}

- (id)messageWithOneofField:(id)a3 withName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 descriptor];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = objc_msgSend(v7, "oneofs", 0);
  id v9 = (void *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 name];
        char v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          v15 = [v12 fields];
          v16 = [v15 objectAtIndexedSubscript:0];

          dispatch_queue_t v17 = [v16 name];
          id v9 = [v5 valueForKey:v17];

          goto LABEL_11;
        }
      }
      id v9 = (void *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_dispatchLogEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  v7 = v6;
  if (!v6)
  {
    if (qword_1EB3B7868 != -1) {
      dispatch_once(&qword_1EB3B7868, &__block_literal_global_12);
    }
    v7 = (void *)_MergedGlobals_11;
  }
  id v8 = v7;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->_logHandlers;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "logEvent:subgroupName:queue:", v4, v8, self->_loggingQueue, (void)v14);
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

void __31__TRILogger__dispatchLogEvent___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v1 = +[TRIEntitlement stringForCurrentProcessEntitlement:@"application-identifier"];
  v2 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v1;
}

- (unint64_t)_incrementedLogEventCount
{
  if (qword_1EB3B7870 != -1) {
    dispatch_once(&qword_1EB3B7870, &__block_literal_global_7);
  }
  [(id)qword_1EB3B7878 lock];
  unint64_t v2 = ++qword_1EB3B7880;
  [(id)qword_1EB3B7878 unlock];
  return v2;
}

void __38__TRILogger__incrementedLogEventCount__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB3B7878;
  qword_1EB3B7878 = v0;

  qword_1EB3B7880 = 0;
}

- (void)logEvent:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(TRILogger *)self _incrementedLogEventCount];
  id v5 = [v6 context];
  [v5 setProcessEventIndex:v4];

  [(TRILogger *)self _dispatchLogEvent:v6];
}

- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5 args:(char *)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    id v8 = "-[TRILogger logWithTrackingId:logLevel:message:args:]";
    _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)logWithTrackingId:(id)a3 message:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[TRILogger logWithTrackingId:message:]";
    _os_log_error_impl(&dword_19D909000, v4, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[TRILogger logWithTrackingId:logLevel:message:]";
    _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1E4FB0580];
  uint64_t projectId = self->_projectId;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  long long v15 = [v10 eventWithTrackingId:a3 projectId:projectId];
  long long v16 = (void *)[v14 mutableCopy];

  long long v17 = [v15 denormalizedEvent];
  [v17 setMetrics:v16];

  v18 = (void *)[v13 mutableCopy];
  uint64_t v19 = [v15 denormalizedEvent];
  [v19 setUserDimensions:v18];

  long long v20 = [MEMORY[0x1E4FB0620] systemDimensions];
  long long v21 = [v15 denormalizedEvent];
  [v21 setSystemDimensions:v20];

  long long v22 = (void *)[v12 copy];
  v23 = [v15 denormalizedEvent];
  [v23 setTrialSystemTelemetry:v22];

  uint64_t v24 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = [v15 description];
    int v26 = 138412290;
    v27 = v25;
    _os_log_impl(&dword_19D909000, v24, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v26, 0xCu);
  }
  [(TRILogger *)self logEvent:v15];
}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 systemDimensions:(id)a6 trialSystemTelemetry:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = (void *)MEMORY[0x1E4FB0580];
  uint64_t projectId = self->_projectId;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [v12 eventWithTrackingId:a3 projectId:projectId];
  uint64_t v19 = (void *)[v17 mutableCopy];

  long long v20 = [v18 denormalizedEvent];
  [v20 setMetrics:v19];

  long long v21 = (void *)[v16 mutableCopy];
  long long v22 = [v18 denormalizedEvent];
  [v22 setUserDimensions:v21];

  v23 = [v18 denormalizedEvent];
  [v23 setSystemDimensions:v15];

  uint64_t v24 = (void *)[v14 copy];
  v25 = [v18 denormalizedEvent];
  [v25 setTrialSystemTelemetry:v24];

  int v26 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = [v18 description];
    int v28 = 138412290;
    v29 = v27;
    _os_log_impl(&dword_19D909000, v26, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v28, 0xCu);
  }
  [(TRILogger *)self logEvent:v18];
}

- (void)logWithProjectNameAndTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1E4FB0580];
  uint64_t projectId = self->_projectId;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [v10 eventWithTrackingId:a3 projectId:projectId];
  id v16 = (void *)[v14 mutableCopy];

  id v17 = [v15 denormalizedEvent];
  [v17 setMetrics:v16];

  v18 = (void *)[v13 mutableCopy];
  uint64_t v19 = [v15 denormalizedEvent];
  [v19 setUserDimensions:v18];

  long long v20 = [MEMORY[0x1E4FB0620] systemDimensions];
  long long v21 = [v15 denormalizedEvent];
  [v21 setSystemDimensions:v20];

  uint64_t v22 = [v12 copy];
  v23 = [v15 denormalizedEvent];
  [v23 setTrialSystemTelemetry:v22];

  uint64_t v24 = [v15 denormalizedEvent];
  LOBYTE(v22) = [v24 hasTrialSystemTelemetry];

  if ((v22 & 1) == 0)
  {
    v25 = objc_opt_new();
    int v26 = [v15 denormalizedEvent];
    [v26 setTrialSystemTelemetry:v25];
  }
  v27 = [MEMORY[0x1E4FB0600] projectNameFromId:self->_projectId];
  int v28 = [v15 denormalizedEvent];
  v29 = [v28 trialSystemTelemetry];
  [v29 setClientProjectId:v27];

  uint64_t v30 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = [v15 description];
    int v32 = 138412290;
    v33 = v31;
    _os_log_impl(&dword_19D909000, v30, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v32, 0xCu);
  }
  [(TRILogger *)self logEvent:v15];
}

- (void)logWithMLRuntimeDimensions:(id)a3 metrics:(id)a4 factorState:(id)a5
{
  id v47 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4FB0580];
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  id v12 = [WeakRetained trackingId];
  id v13 = [v8 eventWithTrackingId:v12 projectId:self->_projectId];

  id v14 = (void *)[v9 mutableCopy];
  id v15 = [v13 denormalizedEvent];
  [v15 setMetrics:v14];

  id v16 = (void *)[v10 copy];
  id v17 = [v13 denormalizedEvent];
  [v17 setMlruntimeDimensions:v16];

  v18 = [MEMORY[0x1E4FB0620] systemDimensions];
  uint64_t v19 = [v13 denormalizedEvent];
  [v19 setSystemDimensions:v18];

  if (v47)
  {
    long long v20 = objc_opt_new();
    long long v21 = [v13 denormalizedEvent];
    [v21 setTrialSystemTelemetry:v20];

    uint64_t v22 = [v47 experimentIdentifiers];

    if (v22)
    {
      v23 = [v13 denormalizedEvent];
      uint64_t v24 = [v23 trialSystemTelemetry];
      v25 = [v24 ensureExperimentFields];

      int v26 = [v47 experimentIdentifiers];
      v27 = [v26 experimentId];
      [v25 setClientExperimentId:v27];

      int v28 = [v47 experimentIdentifiers];
      v29 = [v28 treatmentId];
      [v25 setClientTreatmentId:v29];

      uint64_t v30 = NSNumber;
      v31 = [v47 experimentIdentifiers];
    }
    else
    {
      int v32 = [v47 rolloutIdentifiers];

      if (v32)
      {
        v33 = [v13 denormalizedEvent];
        uint64_t v34 = [v33 trialSystemTelemetry];
        v25 = [v34 ensureRolloutFields];

        v35 = [v47 rolloutIdentifiers];
        v36 = [v35 rolloutId];
        [v25 setClientRolloutId:v36];

        uint64_t v30 = NSNumber;
        v31 = [v47 rolloutIdentifiers];
      }
      else
      {
        v37 = [v47 bmltIdentifiers];

        if (!v37) {
          goto LABEL_9;
        }
        v38 = [v13 denormalizedEvent];
        v39 = [v38 trialSystemTelemetry];
        v25 = [v39 ensureBMLTFields];

        v40 = [v47 bmltIdentifiers];
        v41 = [v40 bmltId];
        [v25 setClientBmltId:v41];

        uint64_t v30 = NSNumber;
        v31 = [v47 bmltIdentifiers];
      }
    }
    v42 = v31;
    v43 = objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "deploymentId"));
    v44 = [v43 stringValue];
    v45 = [v13 denormalizedEvent];
    v46 = [v45 trialSystemTelemetry];
    [v46 setClientDeploymentId:v44];
  }
LABEL_9:
  [(TRILogger *)self logEvent:v13];
}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4FB0580];
  uint64_t projectId = self->_projectId;
  id v10 = a5;
  id v11 = a4;
  id v18 = [v8 eventWithTrackingId:a3 projectId:projectId];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [v18 denormalizedEvent];
  [v13 setMetrics:v12];

  id v14 = (void *)[v10 mutableCopy];
  id v15 = [v18 denormalizedEvent];
  [v15 setUserDimensions:v14];

  id v16 = [MEMORY[0x1E4FB0620] systemDimensions];
  id v17 = [v18 denormalizedEvent];
  [v17 setSystemDimensions:v16];

  [(TRILogger *)self logEvent:v18];
}

- (void)logWithTrackingId:(id)a3 metric:(id)a4 dimensions:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    v23 = self;
    id v24 = v9;
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v19 = [v13 objectForKeyedSubscript:v18];
          long long v20 = v19;
          if (v19 && [v19 length])
          {
            long long v21 = objc_opt_new();
            [v21 setName:v18];
            [v21 setValue:v20];
            [v12 addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v15);
    }

    id v9 = v24;
    self = v23;
  }
  else
  {
    id v12 = 0;
  }
  id v29 = v9;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [(TRILogger *)self logWithTrackingId:v8 metrics:v22 dimensions:v12];
}

- (void)logWithNamespaceName:(id)a3 metrics:(id)a4 dimensions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v30 = (id)objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = [v11 UUIDString];
  [v30 setLogEventId:v12];

  id v13 = objc_opt_new();
  uint64_t v14 = (void *)MEMORY[0x1E4FB0590];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v14 logTimeFromDate:v15];
  [v13 setDeviceLogTime:v16];

  [v13 setProjectId:self->_projectId];
  [v30 setContext:v13];
  id v17 = objc_opt_new();
  [v30 setDenormalizedEvent:v17];

  uint64_t v18 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  long long v20 = [WeakRetained experimentIdentifiersWithNamespaceName:v10];

  long long v21 = [v20 experimentId];
  [v18 setExperimentId:v21];

  objc_msgSend(v18, "setDeploymentId:", objc_msgSend(v20, "deploymentId"));
  uint64_t v22 = [v20 treatmentId];
  [v18 setTreatmentId:v22];

  [v18 addNamespaceName:v10];
  v23 = [v30 denormalizedEvent];
  [v23 addTreatment:v18];

  id v24 = (void *)[v9 mutableCopy];
  long long v25 = [v30 denormalizedEvent];
  [v25 setMetrics:v24];

  long long v26 = (void *)[v8 mutableCopy];
  long long v27 = [v30 denormalizedEvent];
  [v27 setUserDimensions:v26];

  long long v28 = [MEMORY[0x1E4FB0620] systemDimensions];
  id v29 = [v30 denormalizedEvent];
  [v29 setSystemDimensions:v28];

  [(TRILogger *)self logEvent:v30];
}

- (void)logWithTrackingId:(id)a3 metric:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[TRILogger logWithTrackingId:metric:]";
    _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v9, 0xCu);
  }

  [(TRILogger *)self logWithTrackingId:v7 metric:v6 dimensions:0];
}

- (NSArray)logHandlers
{
  return self->_logHandlers;
}

@end