@interface TRIServerContext
- (BOOL)useCKNative;
- (TRIActivationEventDatabase)activationEventDatabase;
- (TRIBackgroundMLTaskDatabase)bmltDatabase;
- (TRIBackgroundMLTaskHistoryDatabase)bmltHistoryDatabase;
- (TRIClient)client;
- (TRIContentTracker)contentTracker;
- (TRIDatabase)underlyingDatabase;
- (TRIExperimentDatabase)experimentDatabase;
- (TRIExperimentHistoryDatabase)experimentHistoryDatabase;
- (TRIKVStore)keyValueStore;
- (TRILimitedCarryProfileManager)limitedCarryManager;
- (TRIMLRuntimeEvaluationHistoryDatabase)evaluationHistoryDatabase;
- (TRINamespaceDatabase)namespaceDatabase;
- (TRIPaths)paths;
- (TRIPushServiceConnectionMultiplexing)pushServiceMuxer;
- (TRIRolloutDatabase)rolloutDatabase;
- (TRIRolloutHistoryDatabase)rolloutHistoryDatabase;
- (TRISQLiteCKDatabase)fakeCKDatabase;
- (TRISQLiteCKDatabaseFailureInjectionDelegate)failureInjectionDelegate;
- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5;
- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5 xpcActivityManagement:(id)a6;
- (TRITaskDatabase)taskDatabase;
- (TRITaskQueuing)taskQueue;
- (TRIXPCActivityManagementProtocol)xpcActivityManager;
- (id)ensureFakeCKDatabase;
- (void)_logInitErrorWithClient:(id)a3 message:(id)a4;
- (void)logErrorMetric:(id)a3;
- (void)setExperimentDatabase:(id)a3;
- (void)setFailureInjectionDelegate:(id)a3;
- (void)setFakeCKDatabase:(id)a3;
- (void)setLimitedCarryManager:(id)a3;
- (void)setPushServiceMuxer:(id)a3;
- (void)setTaskQueue:(id)a3;
- (void)setUseCKNative:(BOOL)a3;
- (void)setXpcActivityManager:(id)a3;
@end

@implementation TRIServerContext

- (TRIRolloutDatabase)rolloutDatabase
{
  return self->_rolloutDatabase;
}

- (TRIExperimentDatabase)experimentDatabase
{
  return self->_experimentDatabase;
}

- (TRIExperimentHistoryDatabase)experimentHistoryDatabase
{
  return self->_experimentHistoryDatabase;
}

- (void)logErrorMetric:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4FB05A8] metricWithName:@"server_error" categoricalValue:a3];
  v5 = [(TRIServerContext *)self client];
  v6 = [v5 logger];
  v7 = [(TRIServerContext *)self client];
  v8 = [v7 trackingId];
  v10[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v6 logWithTrackingId:v8 metrics:v9 dimensions:0 trialSystemTelemetry:0];
}

- (void)_logInitErrorWithClient:(id)a3 message:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [v7 shouldLogAtLevel:50 withPrivacyRadar:54260918];
  if (v9) {
    [(TRIServerContext *)self logErrorMetric:v6];
  }
}

- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5
{
  return [(TRIServerContext *)self initWithPaths:a3 client:a4 storageManagement:a5 xpcActivityManagement:0];
}

- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5 xpcActivityManagement:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"TRIServerContext.m", 72, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  v51 = [MEMORY[0x1E4F28B00] currentHandler];
  [v51 handleFailureInMethod:a2, self, @"TRIServerContext.m", 71, @"Invalid parameter not satisfying: %@", @"paths" object file lineNumber description];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_14:
  v53 = [MEMORY[0x1E4F28B00] currentHandler];
  [v53 handleFailureInMethod:a2, self, @"TRIServerContext.m", 73, @"Invalid parameter not satisfying: %@", @"storageManagement" object file lineNumber description];

LABEL_4:
  v55.receiver = self;
  v55.super_class = (Class)TRIServerContext;
  v16 = [(TRIServerContext *)&v55 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_paths, a3);
    objc_storeStrong((id *)&v17->_client, a4);
    v18 = [[TRIDatabase alloc] initWithPaths:v17->_paths storageManagement:v14];
    if (!v18)
    {
      [(TRIServerContext *)v17 _logInitErrorWithClient:v17->_client message:@"TRIDServer failed to initialize db"];
      v49 = 0;
      goto LABEL_11;
    }
    underlyingDatabase = v17->_underlyingDatabase;
    v17->_underlyingDatabase = v18;
    v20 = v18;

    v21 = [[TRIExperimentDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    experimentDatabase = v17->_experimentDatabase;
    v17->_experimentDatabase = v21;

    v23 = [[TRIExperimentHistoryDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    experimentHistoryDatabase = v17->_experimentHistoryDatabase;
    v17->_experimentHistoryDatabase = v23;

    v25 = [[TRINamespaceDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    namespaceDatabase = v17->_namespaceDatabase;
    v17->_namespaceDatabase = v25;

    v27 = [[TRIActivationEventDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    activationEventDatabase = v17->_activationEventDatabase;
    v17->_activationEventDatabase = v27;

    v29 = [[TRIRolloutDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    rolloutDatabase = v17->_rolloutDatabase;
    v17->_rolloutDatabase = v29;

    v31 = [[TRIRolloutHistoryDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    rolloutHistoryDatabase = v17->_rolloutHistoryDatabase;
    v17->_rolloutHistoryDatabase = v31;

    v33 = [[TRIMLRuntimeEvaluationHistoryDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    evaluationHistoryDatabase = v17->_evaluationHistoryDatabase;
    v17->_evaluationHistoryDatabase = v33;

    v35 = [TRITaskDatabase alloc];
    v36 = v17->_underlyingDatabase;
    v37 = +[TRITaskSupport sharedInstance];
    uint64_t v38 = [(TRITaskDatabase *)v35 initWithDatabase:v36 taskSetProvider:v37];
    taskDatabase = v17->_taskDatabase;
    v17->_taskDatabase = (TRITaskDatabase *)v38;

    v40 = [[TRIBackgroundMLTaskDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    bmltDatabase = v17->_bmltDatabase;
    v17->_bmltDatabase = v40;

    v42 = [[TRIBackgroundMLTaskHistoryDatabase alloc] initWithDatabase:v17->_underlyingDatabase];
    bmltHistoryDatabase = v17->_bmltHistoryDatabase;
    v17->_bmltHistoryDatabase = v42;

    v44 = [[TRIKVStore alloc] initWithDatabase:v17->_underlyingDatabase];
    keyValueStore = v17->_keyValueStore;
    v17->_keyValueStore = v44;

    v46 = [[TRIContentTracker alloc] initWithDatabase:v17->_underlyingDatabase];
    contentTracker = v17->_contentTracker;
    v17->_contentTracker = v46;

    objc_storeWeak((id *)&v17->_xpcActivityManager, v15);
    v48 = TRILogCategory_Server();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v48, OS_LOG_TYPE_DEFAULT, "Successfully initialized TRIServerContext", buf, 2u);
    }
  }
  v49 = v17;
LABEL_11:

  return v49;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (TRITaskQueuing)taskQueue
{
  taskQueue = self->_taskQueue;
  if (!taskQueue)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TRIServerContext.m" lineNumber:112 description:@"Task queue unexpectedly nil in server context"];

    taskQueue = self->_taskQueue;
  }
  return taskQueue;
}

- (TRIPushServiceConnectionMultiplexing)pushServiceMuxer
{
  pushServiceMuxer = self->_pushServiceMuxer;
  if (!pushServiceMuxer)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TRIServerContext.m" lineNumber:117 description:@"Push service muxer unexpectedly nil in server context"];

    pushServiceMuxer = self->_pushServiceMuxer;
  }
  return pushServiceMuxer;
}

- (id)ensureFakeCKDatabase
{
  v4 = [(TRIServerContext *)self fakeCKDatabase];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    id v6 = [v5 trialRootDir];
    id v7 = [v6 stringByAppendingPathComponent:@"CKSQLiteMock/Database"];

    v8 = [v5 trialRootDir];
    int v9 = [v8 stringByAppendingPathComponent:@"CKSQLiteMock/AssetCache"];

    int v10 = [[TRISQLiteCKDatabase alloc] initWithParentDir:v7 assetCacheDir:v9];
    [(TRIServerContext *)self setFakeCKDatabase:v10];

    id v11 = [(TRIServerContext *)self fakeCKDatabase];

    if (!v11)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"TRIServerContext.m" lineNumber:130 description:@"Failed to instantiate TRISQLiteCKDatabase"];
    }
  }
  id v12 = [(TRIServerContext *)self fakeCKDatabase];
  if (!v12)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerContext.m", 132, @"Expression was unexpectedly nil/false: %@", @"self.fakeCKDatabase" object file lineNumber description];
  }
  return v12;
}

- (TRIPaths)paths
{
  return self->_paths;
}

- (void)setExperimentDatabase:(id)a3
{
}

- (TRIActivationEventDatabase)activationEventDatabase
{
  return self->_activationEventDatabase;
}

- (TRINamespaceDatabase)namespaceDatabase
{
  return self->_namespaceDatabase;
}

- (TRIRolloutHistoryDatabase)rolloutHistoryDatabase
{
  return self->_rolloutHistoryDatabase;
}

- (TRIMLRuntimeEvaluationHistoryDatabase)evaluationHistoryDatabase
{
  return self->_evaluationHistoryDatabase;
}

- (TRITaskDatabase)taskDatabase
{
  return self->_taskDatabase;
}

- (TRIBackgroundMLTaskDatabase)bmltDatabase
{
  return self->_bmltDatabase;
}

- (TRIBackgroundMLTaskHistoryDatabase)bmltHistoryDatabase
{
  return self->_bmltHistoryDatabase;
}

- (TRIClient)client
{
  return self->_client;
}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (TRIContentTracker)contentTracker
{
  return self->_contentTracker;
}

- (TRISQLiteCKDatabase)fakeCKDatabase
{
  return (TRISQLiteCKDatabase *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFakeCKDatabase:(id)a3
{
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)failureInjectionDelegate
{
  return self->_failureInjectionDelegate;
}

- (void)setFailureInjectionDelegate:(id)a3
{
}

- (TRILimitedCarryProfileManager)limitedCarryManager
{
  return self->_limitedCarryManager;
}

- (void)setLimitedCarryManager:(id)a3
{
}

- (void)setTaskQueue:(id)a3
{
}

- (void)setPushServiceMuxer:(id)a3
{
}

- (TRIXPCActivityManagementProtocol)xpcActivityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcActivityManager);
  return (TRIXPCActivityManagementProtocol *)WeakRetained;
}

- (BOOL)useCKNative
{
  return self->_useCKNative;
}

- (void)setUseCKNative:(BOOL)a3
{
  self->_useCKNative = a3;
}

- (TRIDatabase)underlyingDatabase
{
  return self->_underlyingDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDatabase, 0);
  objc_destroyWeak((id *)&self->_xpcActivityManager);
  objc_storeStrong((id *)&self->_pushServiceMuxer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_limitedCarryManager, 0);
  objc_storeStrong((id *)&self->_failureInjectionDelegate, 0);
  objc_storeStrong((id *)&self->_fakeCKDatabase, 0);
  objc_storeStrong((id *)&self->_contentTracker, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bmltHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_bmltDatabase, 0);
  objc_storeStrong((id *)&self->_taskDatabase, 0);
  objc_storeStrong((id *)&self->_evaluationHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_rolloutHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_namespaceDatabase, 0);
  objc_storeStrong((id *)&self->_experimentHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_activationEventDatabase, 0);
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end