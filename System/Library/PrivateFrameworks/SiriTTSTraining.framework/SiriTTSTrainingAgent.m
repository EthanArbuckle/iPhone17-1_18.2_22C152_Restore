@interface SiriTTSTrainingAgent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SiriTTSTrainerAgentDelegate)delegate;
- (SiriTTSTrainingAgent)init;
- (id)installedTrainingAssetsSyncWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5;
- (int64_t)trainerTaskEvent:(int64_t)a3 currentValue:(int64_t)a4 totalValue:(int64_t)a5;
- (void)cancelTask:(id)a3 reply:(id)a4;
- (void)cleanUpTaskQueue:(id)a3;
- (void)getAllTasksWithReply:(id)a3;
- (void)getCurrentAssetVersion:(id)a3 name:(id)a4 reply:(id)a5;
- (void)getRecordingMetadata:(id)a3 name:(id)a4 reply:(id)a5;
- (void)getTaskById:(id)a3 reply:(id)a4;
- (void)installTrainingAsset:(id)a3 reply:(id)a4;
- (void)installableTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 reply:(id)a6;
- (void)installedTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 reply:(id)a6;
- (void)startRequest:(id)a3 reply:(id)a4;
- (void)uninstallTrainingAsset:(id)a3 reply:(id)a4;
@end

@implementation SiriTTSTrainingAgent

- (void)installableTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 reply:(id)a6
{
  v9 = _Block_copy(a6);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  v11 = self;
  uint64_t v12 = sub_100005404();
  SiriTTSTrainingAgent.installableTrainingAssets(language:name:type:reply:)(v12, v13, v14, v15, v16, v17, v10);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)installedTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 reply:(id)a6
{
  v9 = _Block_copy(a6);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  _Block_copy(v9);
  uint64_t v10 = self;
  uint64_t v11 = sub_100005404();
  sub_1000039FC(v11, v12, v13, v14, v15, v10, (void (**)(void, void))v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)installedTrainingAssetsSyncWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
    if (v6)
    {
LABEL_3:
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v6 = v12;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  uint64_t v13 = self;
  SiriTTSTrainingAgent.installedTrainingAssetsSync(language:name:type:)(v8, v10, v11, (uint64_t)v6, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100004EA0(0, &qword_10001D588);
  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

- (void)installTrainingAsset:(id)a3 reply:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unint64_t v9 = self;
  SiriTTSTrainingAgent.install(trainingAsset:reply:)(v8, (uint64_t)sub_100005380, v7);

  swift_release();
}

- (void)uninstallTrainingAsset:(id)a3 reply:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unint64_t v9 = self;
  SiriTTSTrainingAgent.uninstall(trainingAsset:reply:)(v8, (uint64_t)sub_1000052B4, v7);

  swift_release();
}

- (SiriTTSTrainingAgent)init
{
  v24.receiver = self;
  v24.super_class = (Class)SiriTTSTrainingAgent;
  v2 = [(SiriTTSTrainingAgent *)&v24 init];
  v3 = (NSLock *)objc_alloc_init((Class)NSLock);
  trainingThreadLock = v2->_trainingThreadLock;
  v2->_trainingThreadLock = v3;

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.SiriTTSTrainingAgent.queue.training_task", v5);
  trainingTaskQueue = v2->_trainingTaskQueue;
  v2->_trainingTaskQueue = (OS_dispatch_queue *)v6;

  dispatch_queue_t v8 = dispatch_queue_create("SiriTTSTrainingAgent.DAS", v5);
  dasQueue = v2->_dasQueue;
  v2->_dasQueue = (OS_dispatch_queue *)v8;

  id v10 = objc_alloc((Class)NSXPCListener);
  uint64_t v11 = (NSXPCListener *)[v10 initWithMachServiceName:SiriTTSTrainerAgentMachName];
  xpcListener = v2->_xpcListener;
  v2->_xpcListener = v11;

  [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
  v2->_agentDeferred = 0;
  uint64_t v13 = +[TrainingTaskDatabase sharedInstance];
  NSArray v14 = [v13 getSubmittedTasks];

  uint64_t v15 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [v14 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Existing training task count: %d", buf, 8u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:buf count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        sub_100008E84((uint64_t)v2, *(void **)(*((void *)&v25 + 1) + 8 * (void)v20), 0.0);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:buf count:16];
    }
    while (v18);
  }

  v21 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "scheduleDaemonInvokeXPCActivity", buf, 2u);
  }

  xpc_activity_register("com.apple.SiriTTSTrainingAgent.xpc_checkin", XPC_ACTIVITY_CHECK_IN, &stru_100018C10);
  id v22 = +[TrainingTaskDatabase sharedInstance];
  objc_storeWeak((id *)&v2->_currentTrainingTask, 0);

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = [v5 valueForEntitlement:@"com.apple.SiriTTSTrainingAgent.training"];
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue])
  {
    uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SiriTTSTrainerAgentDelegate];
    [v5 setRemoteObjectInterface:v7];
    dispatch_queue_t v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SiriTTSTrainerAgentProtocol];
    uint64_t v14 = objc_opt_class();
    unint64_t v9 = +[NSArray arrayWithObjects:&v14 count:1];
    id v10 = +[NSSet setWithArray:v9];

    [v8 setClasses:v10 forSelector:"startRequest:reply:" argumentIndex:0 ofReply:0];
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    [v5 setInvalidationHandler:&stru_100018A98];
    objc_storeWeak((id *)&self->_connection, v5);
    [v5 resume];

    BOOL v11 = 1;
  }
  else
  {
    uint64_t v7 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalidated entitlement", v13, 2u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (SiriTTSTrainerAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = [WeakRetained remoteObjectProxy];

  return (SiriTTSTrainerAgentDelegate *)v3;
}

- (void)getRecordingMetadata:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  BOOL v11 = sub_1000074C4(self, v8, v9, 1);
  if (!v11)
  {
    uint64_t v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 resourcePath];
    v31 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v31 count:1];
    BOOL v11 = +[NSString pathWithComponents:v14];
  }
  v30[0] = v11;
  v30[1] = @"metadata_data.json";
  uint64_t v15 = +[NSArray arrayWithObjects:v30 count:2];
  unsigned int v16 = +[NSString pathWithComponents:v15];

  id v17 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "metadataPath=%@", buf, 0xCu);
  }

  char v25 = 0;
  id v18 = +[NSFileManager defaultManager];
  unsigned int v19 = [v18 fileExistsAtPath:v16 isDirectory:&v25];
  if (v25) {
    unsigned int v20 = 0;
  }
  else {
    unsigned int v20 = v19;
  }

  if (v20)
  {
    v10[2](v10, 0, v16);
  }
  else
  {
    id v21 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Recording metadata file doesn't exist.";
    id v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v23 = [v21 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:1004 userInfo:v22];

    objc_super v24 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Recording metadata file doesn't exist. path=%@", buf, 0xCu);
    }

    ((void (**)(id, id, void *))v10)[2](v10, v23, 0);
  }
}

- (void)getCurrentAssetVersion:(id)a3 name:(id)a4 reply:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007784;
  v9[3] = &unk_100018AC0;
  id v10 = a5;
  id v8 = v10;
  [(SiriTTSTrainingAgent *)self installedTrainingAssetsForLanguage:a3 name:a4 type:0 reply:v9];
}

- (void)startRequest:(id)a3 reply:(id)a4
{
  id v5 = a3;
  v49 = (void (**)(id, void, void *))a4;
  dispatch_queue_t v6 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 taskId];
    id v8 = [v5 assetLanguage];
    id v9 = [v5 trainingAssetPath];
    id v10 = [v5 dataAssetPath];
    BOOL v11 = [v5 inferenceAssetPath];
    uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 forceToStart]);
    uint64_t v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 taskMode]);
    *(_DWORD *)buf = 138413826;
    id v53 = v7;
    __int16 v54 = 2112;
    uint64_t v55 = (uint64_t)v8;
    __int16 v56 = 2112;
    v57 = v9;
    __int16 v58 = 2112;
    v59 = v10;
    __int16 v60 = 2112;
    v61 = v11;
    __int16 v62 = 2112;
    v63 = v12;
    __int16 v64 = 2112;
    v65 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received request: taskId=%@ assetLanguage=%@ trainingAssetPath=%@ dataAssetPath=%@ inferenceAssetPath=%@ forceToStart=%@ taskMode=%@", buf, 0x48u);
  }
  uint64_t v14 = [[SiriTTSTrainerTaskInternal alloc] initWithTask:v5];
  uint64_t v15 = +[NSDate now];
  [(SiriTTSTrainerTaskInternal *)v14 setTaskSubmissionDate:v15];

  unsigned int v16 = [v5 taskId];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    NSErrorUserInfoKey v26 = +[NSUUID UUID];
    CFStringRef v27 = [v26 UUIDString];
    [(SiriTTSTrainerTaskInternal *)v14 setTaskId:v27];
  }
  else
  {
    id v18 = [v5 taskId];
    [(SiriTTSTrainerTaskInternal *)v14 setTaskId:v18];

    unsigned int v19 = +[TrainingTaskDatabase sharedInstance];
    unsigned int v20 = [(SiriTTSTrainerTaskInternal *)v14 taskId];
    id v21 = [v19 getTaskById:v20];

    if (v21)
    {
      id v22 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_msgSend(v5, "taskId", self);
        *(_DWORD *)buf = 138412290;
        id v53 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found task in submit queue: taskId=%@", buf, 0xCu);
      }
      objc_super v24 = +[STTCoreAnalyticsService sharedInstance];
      [v24 reportRequest:v5];

      char v25 = [v21 getSuperTask];
      v49[2](v49, 0, v25);

      goto LABEL_23;
    }
  }
  long long v28 = [(SiriTTSTrainerTaskInternal *)v14 trainingAssetPath];
  BOOL v29 = [v28 length] == 0;

  if (v29
    && ([(SiriTTSTrainerTaskInternal *)v14 assetLanguage],
        unsigned int v30 = objc_claimAutoreleasedReturnValue(),
        BOOL v31 = [v30 length] == 0,
        v30,
        v31))
  {
    v42 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Invalid input training asset path", buf, 2u);
    }

    v43 = +[NSError errorWithDomain:@"com.apple.SiriTTSTrainingAgent" code:300 userInfo:0];
    [v5 setError:v43];

    v44 = +[STTCoreAnalyticsService sharedInstance];
    [v44 reportRequest:v5];

    id v21 = [v5 error];
    ((void (**)(id, void *, void *))v49)[2](v49, v21, 0);
  }
  else
  {
    v32 = +[TrainingTaskDatabase sharedInstance];
    [v32 submitTaskToSubmittedQueue:v14];

    v33 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [v5 taskId];
      *(_DWORD *)buf = 138412290;
      id v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Task submitted: taskId=%@", buf, 0xCu);
    }
    v35 = +[TrainingTaskDatabase sharedInstance];
    BOOL v36 = (uint64_t)[v35 getSubmittedTaskQueueSize] > 1;

    if (v36)
    {
      v37 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v45 = +[TrainingTaskDatabase sharedInstance];
        id v46 = [v45 getSubmittedTaskQueueSize];
        *(_DWORD *)buf = 134218240;
        id v53 = v46;
        __int16 v54 = 2048;
        uint64_t v55 = 1;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Training task queue size exceeds the maximum, current_size=%ld, max_size=%ld", buf, 0x16u);
      }
      v38 = +[STTCoreAnalyticsService sharedInstance];
      [v38 reportRequest:v14];

      v39 = +[TrainingTaskDatabase sharedInstance];
      [v39 addFailedTaskToFinishQueue:v14 errorCode:1005 description:@"Current task queue exceeds the maximum"];

      id v21 = [(SiriTTSTrainerTaskInternal *)v14 error];
      ((void (**)(id, void *, void *))v49)[2](v49, v21, 0);
    }
    else
    {
      id v21 = [(SiriTTSTrainerTaskInternal *)v14 getSuperTask];
      v40 = +[STTCoreAnalyticsService sharedInstance];
      [v40 reportRequest:v21];

      if ([(SiriTTSTrainerTaskInternal *)v14 forceToStart])
      {
        v41 = *(NSObject **)(v48 + 8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008398;
        block[3] = &unk_100018AE8;
        block[4] = v48;
        v51 = v14;
        dispatch_async(v41, block);
        v49[2](v49, 0, v21);
      }
      else
      {
        sub_100008E84(v48, v14, 600.0);
        v49[2](v49, 0, v21);
      }
    }
  }
LABEL_23:
}

- (void)getTaskById:(id)a3 reply:(id)a4
{
  id v5 = a3;
  dispatch_queue_t v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getTaskById: taskId=%@", buf, 0xCu);
  }

  id v8 = +[TrainingTaskDatabase sharedInstance];
  id v9 = [v8 getTaskById:v5];

  if (v9)
  {
    id v10 = [v9 getSuperTask];
    BOOL v11 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found task %@", buf, 0xCu);
    }

    v6[2](v6, 0, v10);
  }
  else
  {
    uint64_t v12 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to find task of id %@", buf, 0xCu);
    }

    id v13 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Can't find corresponding taskId";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v10 = [v13 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:300 userInfo:v14];

    ((void (**)(id, id, id))v6)[2](v6, v10, 0);
  }
}

- (void)getAllTasksWithReply:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = +[TrainingTaskDatabase sharedInstance];
  id v5 = [v4 getAllTasks];

  dispatch_queue_t v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "getSuperTask", (void)v12);
        [v6 addObject:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v3[2](v3, v6);
}

- (void)cleanUpTaskQueue:(id)a3
{
  v3 = (void (**)(id, void))a3;
  v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cleanUpTaskQueue", v6, 2u);
  }

  id v5 = +[TrainingTaskDatabase sharedInstance];
  [v5 cleanUpQueue];

  v3[2](v3, 0);
}

- (void)cancelTask:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 taskId];
    *(_DWORD *)buf = 138412290;
    BOOL v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cancelTask: taskId=%@", buf, 0xCu);
  }
  id v10 = +[TrainingTaskDatabase sharedInstance];
  BOOL v11 = [v6 taskId];
  long long v12 = [v10 getTaskById:v11];

  if (!v12)
  {
    id v26 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Can't cancel task due to task not found";
    CFStringRef v27 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v28 = [v26 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:300 userInfo:v27];

    v7[2](v7, v28);
LABEL_14:

    goto LABEL_15;
  }
  if ([v12 taskStatus] != (id)1
    && [v12 taskStatus] != (id)2
    && [v12 taskStatus] != (id)6)
  {
    id v29 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Can't cancel task due to is in wrong status";
    unsigned int v30 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v28 = [v29 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:300 userInfo:v30];

    v7[2](v7, v28);
    goto LABEL_14;
  }
  p_currentTrainingTask = &self->_currentTrainingTask;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentTrainingTask);
  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)p_currentTrainingTask);
    CFStringRef v16 = [v15 taskId];
    BOOL v17 = [v6 taskId];
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)p_currentTrainingTask);

      id v20 = objc_loadWeakRetained((id *)p_currentTrainingTask);
      id v21 = [v20 currentTrainer];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        id v23 = objc_loadWeakRetained((id *)p_currentTrainingTask);
        objc_super v24 = [v23 currentTrainer];
        [v24 stop];
      }
      long long v12 = v19;
    }
  }
  char v25 = +[TrainingTaskDatabase sharedInstance];
  [v25 addTaskToFinishedQueueWithStatus:v12 status:3];

  v7[2](v7, 0);
LABEL_15:
}

- (int64_t)trainerTaskEvent:(int64_t)a3 currentValue:(int64_t)a4 totalValue:(int64_t)a5
{
  int64_t v5 = a5;
  int64_t v6 = a4;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 8:
    case 9:
    case 11:
    case 12:
    case 14:
      return 0;
    case 4:
      int64_t v6 = a4 + 2 * a5;
      goto LABEL_4;
    case 7:
      int64_t v6 = a5 + a4;
      goto LABEL_4;
    case 10:
LABEL_4:
      int64_t v5 = 3 * a5;
      goto LABEL_5;
    case 15:
      +[SiriTTSTrainerDiagnostics collectTailspin:0];
      return 0;
    default:
LABEL_5:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTrainingTask);
      id v10 = [WeakRetained trainingStatus];
      float v11 = 0.0;
      if (self && v5)
      {
        if (v10 == (id)3)
        {
          float v11 = (float)((float)((float)((float)v6 / (float)v5) * 0.8) + 0.1) + 0.1;
        }
        else if (v10 == (id)2)
        {
          float v11 = (float)((float)((float)v6 / (float)v5) * 0.1) + 0.1;
        }
        else if (v10 == (id)1)
        {
          float v11 = (float)((float)v6 / (float)v5) * 0.1;
        }
      }

      long long v12 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = +[NSNumber numberWithInteger:a3];
        int v19 = 138413058;
        id v20 = v13;
        __int16 v21 = 2048;
        int64_t v22 = v6;
        __int16 v23 = 2048;
        int64_t v24 = v5;
        __int16 v25 = 2048;
        double v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "event=%@, currentValue=%ld, totalValue=%ld, normalizedProgressValue=%f", (uint8_t *)&v19, 0x2Au);
      }
      long long v14 = +[TrainingTaskDatabase sharedInstance];
      id v15 = objc_loadWeakRetained((id *)&self->_currentTrainingTask);
      id v16 = [v15 trainingStatus];
      *(float *)&double v17 = v11;
      [v14 updateTaskWithTrainingStatusToSubmittedQueue:v15 trainingStatus:v16 currentProgressValue:v6 totalProgressValue:v5 normalizedProgressValue:v17];

      return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingThreadLock, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_currentTrainingTask);
  objc_storeStrong((id *)&self->_dayTrainingSessionTimer, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_dasQueue, 0);

  objc_storeStrong((id *)&self->_trainingTaskQueue, 0);
}

@end