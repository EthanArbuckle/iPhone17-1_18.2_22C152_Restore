@interface MLRExtensionPluginManager
+ (id)pluginManagerForBundleIdentifier:(id)a3 endpoint:(id)a4;
- (BOOL)shouldTriggerSimulatedCrash;
- (MLRExtensionPluginManager)initWithExtension:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (id)_createSandBoxExtensions:(id)a3 error:(id *)a4;
- (id)_failToGetHostError;
- (id)_failToPerformErrorWithError:(id)a3;
- (id)_recordDirectoriesForIdentifier:(id)a3;
- (id)_skipTaskError;
- (id)extensionName;
- (id)performTask:(id)a3 error:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (id)sandboxExtensionsForTask:(id)a3 error:(id *)a4;
- (int64_t)_graceIntervalBeforeKilling;
- (int64_t)_graceIntervalBeforeUnloading;
- (void)_activateExtensionIfNecessary;
- (void)_killExtension:(id)a3 afterInterval:(int64_t)a4;
- (void)_setupExtensionHandlers;
- (void)_triggerSimulatedCrash;
- (void)_unload;
- (void)stopWithCompletion:(id)a3;
- (void)unload;
@end

@implementation MLRExtensionPluginManager

+ (id)pluginManagerForBundleIdentifier:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100008214(v11, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_10;
  }
  if (!v7)
  {
    v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000824C(v11, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_10:
    id v27 = 0;
    goto LABEL_19;
  }
  v39[0] = NSExtensionPointName;
  v39[1] = NSExtensionIdentifierName;
  v40[0] = v7;
  v40[1] = v6;
  v9 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  id v32 = 0;
  v10 = +[NSExtension extensionsWithMatchingAttributes:v9 error:&v32];
  v11 = v32;
  if ((unint64_t)[v10 count] < 2)
  {
    v28 = [v10 firstObject];

    v29 = +[DESLogging coreChannel];
    v12 = v29;
    if (v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_10000830C(v10, v12);
      }

      id v30 = objc_alloc((Class)a1);
      v12 = [v10 firstObject];
      id v27 = [v30 initWithExtension:v12];
      goto LABEL_18;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v6;
      __int16 v35 = 2112;
      v36 = v8;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to find extension for identifier=%@ extensionPoint=%@, with error=%@", buf, 0x20u);
    }
  }
  else
  {
    v12 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100008284((uint64_t)v6, (uint64_t)v8, v12);
    }
  }
  id v27 = 0;
LABEL_18:

LABEL_19:

  return v27;
}

- (MLRExtensionPluginManager)initWithExtension:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MLRExtensionPluginManager;
  id v6 = [(MLRExtensionPluginManager *)&v30 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    uint64_t v8 = [v5 identifier];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v10 = [v5 identifier];
    v11 = [v10 componentsSeparatedByString:@"."];
    v12 = [v11 lastObject];

    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = +[NSString stringWithFormat:@"%@.%@", v14, v12];

    id v16 = v15;
    uint64_t v17 = (const char *)[v16 cStringUsingEncoding:4];
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v23 = +[NSString stringWithFormat:@"%@.%@.execution", v22, v12];

    id v24 = v23;
    uint64_t v25 = (const char *)[v24 cStringUsingEncoding:4];
    uint64_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    taskExecutionQueue = v7->_taskExecutionQueue;
    v7->_taskExecutionQueue = (OS_dispatch_queue *)v27;

    [(MLRExtensionPluginManager *)v7 _setupExtensionHandlers];
  }

  return v7;
}

- (void)_setupExtensionHandlers
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005D84;
  v5[3] = &unk_1000186B8;
  objc_copyWeak(&v6, &location);
  [(NSExtension *)self->_extension setRequestInterruptionBlock:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005ED0;
  v3[3] = &unk_1000186E0;
  objc_copyWeak(&v4, &location);
  [(NSExtension *)self->_extension setRequestCancellationBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)extensionName
{
  v2 = [(NSExtension *)self->_extension identifier];
  v3 = [v2 componentsSeparatedByString:@"."];
  id v4 = [v3 lastObject];

  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MLRExtensionPluginManager *)self extensionName];
  id v5 = +[NSString stringWithFormat:@"<%@ %@>", v3, v4];

  return (NSString *)v5;
}

- (void)_activateExtensionIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_sessionID)
  {
    if (self->_stopped)
    {
      uint64_t v3 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_10000852C();
      }
    }
    else
    {
      extension = self->_extension;
      id v9 = 0;
      id v5 = [(NSExtension *)extension beginExtensionRequestWithOptions:0 inputItems:0 error:&v9];
      uint64_t v3 = v9;
      if (v5)
      {
        id v6 = [(NSExtension *)self->_extension _extensionContextForUUID:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&self->_hostContext, v6);
          id v7 = v5;
          p_super = &self->_sessionID->super;
          self->_sessionID = v7;
        }
        else
        {
          p_super = +[DESLogging coreChannel];
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            sub_1000084A0((uint64_t)v6, p_super);
          }
        }
      }
      else
      {
        id v6 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100008438();
        }
      }
    }
  }
}

- (BOOL)shouldTriggerSimulatedCrash
{
  return _DESIsInternalInstall(self, a2);
}

- (int64_t)_graceIntervalBeforeKilling
{
  if ([(MLRExtensionPluginManager *)self shouldTriggerSimulatedCrash]) {
    return 10000000000;
  }
  else {
    return 0;
  }
}

- (void)_killExtension:(id)a3 afterInterval:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 < 1)
  {
    [v6 _kill:9];
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, a4);
    syncQueue = self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006390;
    block[3] = &unk_100018708;
    id v11 = v7;
    dispatch_after(v8, syncQueue, block);
  }
}

- (void)_triggerSimulatedCrash
{
  uint64_t v3 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100008598(self, v3);
  }

  hostContext = self->_hostContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000645C;
  v5[3] = &unk_100018770;
  void v5[4] = self;
  [(MLRExtensionHostContext *)hostContext performOnRemoteObjectSynchronouslyWithBlock:&stru_100018748 errorHandler:v5];
}

- (void)_unload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  uint64_t v3 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000086B8();
  }

  if (self->_sessionID)
  {
    [(NSExtension *)self->_extension setRequestCancellationBlock:0];
    [(NSExtension *)self->_extension setRequestInterruptionBlock:0];
    hostContext = self->_hostContext;
    self->_hostContext = 0;

    [(NSExtension *)self->_extension cancelExtensionRequestWithIdentifier:self->_sessionID];
    sessionID = self->_sessionID;
    self->_sessionID = 0;
  }
}

- (void)unload
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000065D8;
  block[3] = &unk_100018708;
  void block[4] = self;
  dispatch_async(syncQueue, block);
}

- (id)_recordDirectoriesForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v4 recordDirURLsForBundleId:v3];

  return v5;
}

- (id)_createSandBoxExtensions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSMutableArray array];
  dispatch_time_t v8 = [v6 recipe];
  id v9 = [v8 attachments];
  id v10 = [v9 count];

  if (v10)
  {
    hostContext = self->_hostContext;
    v12 = [v6 recipe];
    uint64_t v13 = [v12 attachments];
    uint64_t v14 = [(MLRExtensionHostContext *)hostContext issueSandBoxExtensionsForFileURLs:v13 requireWrite:0 outError:a4];

    id v15 = [v14 count];
    id v16 = [v6 recipe];
    uint64_t v17 = [v16 attachments];
    id v18 = [v17 count];

    if (v15 != v18)
    {
      dispatch_queue_t v27 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100008830(v6, v27);
      }
      goto LABEL_14;
    }
    [v7 addObjectsFromArray:v14];
  }
  dispatch_queue_t v19 = self->_hostContext;
  uint64_t v20 = DESSubmissionLogDirectoryURL();
  v31 = v20;
  uint64_t v21 = +[NSArray arrayWithObjects:&v31 count:1];
  uint64_t v14 = [(MLRExtensionHostContext *)v19 issueSandBoxExtensionsForFileURLs:v21 requireWrite:1 outError:a4];

  if ([v14 count] == (id)1)
  {
    uint64_t v22 = [v14 firstObject];
    [v7 addObject:v22];

    uint64_t v23 = self->_hostContext;
    id v24 = [v6 recipe];
    uint64_t v25 = [v24 bundleIdentifier];
    uint64_t v26 = [(MLRExtensionPluginManager *)self _recordDirectoriesForIdentifier:v25];
    dispatch_queue_t v27 = [(MLRExtensionHostContext *)v23 issueSandBoxExtensionsForFileURLs:v26 requireWrite:0 outError:a4];

    if ([v27 count])
    {
      [v7 addObjectsFromArray:v27];
      id v28 = [v7 copy];
      goto LABEL_15;
    }
    v29 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100008724(v6, v29);
    }
  }
  else
  {
    dispatch_queue_t v27 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000087C8();
    }
  }
LABEL_14:
  id v28 = 0;
LABEL_15:

  return v28;
}

- (id)_skipTaskError
{
  v2 = [(MLRExtensionPluginManager *)self extensionName];
  id v3 = +[NSString stringWithFormat:@"Ignoring tasks after plugin=%@ is requested to stop.", v2];

  id v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000088D4();
  }

  uint64_t v5 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v3;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[NSError errorWithDomain:v5 code:8003 userInfo:v6];

  return v7;
}

- (id)_failToGetHostError
{
  v2 = [(MLRExtensionPluginManager *)self extensionName];
  id v3 = +[NSString stringWithFormat:@"Fail to get host context for %@.", v2];

  id v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000088D4();
  }

  uint64_t v5 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v3;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[NSError errorWithDomain:v5 code:8004 userInfo:v6];

  return v7;
}

- (id)_failToPerformErrorWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v17 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"error should not be nil" userInfo:0];
    objc_exception_throw(v17);
  }
  uint64_t v5 = v4;
  BOOL stopped = self->_stopped;
  uint64_t v7 = [(MLRExtensionPluginManager *)self extensionName];
  dispatch_time_t v8 = (void *)v7;
  if (stopped)
  {
    NSErrorUserInfoKey v9 = +[NSString stringWithFormat:@"%@ Not responding to stop request?", v7];

    uint64_t v10 = kDESDistributedEvaluationErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSUnderlyingErrorKey;
    v21[0] = v9;
    v21[1] = v5;
    id v11 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    v12 = +[NSError errorWithDomain:v10 code:8015 userInfo:v11];

    uint64_t v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000893C();
    }
  }
  else
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@ crashed?", v7];

    uint64_t v14 = kDESDistributedEvaluationErrorDomain;
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSUnderlyingErrorKey;
    v19[0] = v13;
    v19[1] = v5;
    id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    v12 = +[NSError errorWithDomain:v14 code:8016 userInfo:v15];
  }

  return v12;
}

- (id)sandboxExtensionsForTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v21 = v6;
  id obj = [v6 MLRSandboxExtensionRequests];
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        hostContext = self->_hostContext;
        uint64_t v14 = [v12 URLs];
        id v15 = -[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:](hostContext, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:", v14, [v12 requireWrite], a4);

        id v16 = [v15 count];
        id v17 = [v12 URLs];
        id v18 = [v17 count];

        if (v16 != v18)
        {

          id v19 = 0;
          goto LABEL_11;
        }
        [v7 addObjectsFromArray:v15];
      }
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v19 = v7;
LABEL_11:

  return v19;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  dispatch_queue_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000071B0;
  objc_super v30 = sub_1000071C0;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000071B0;
  long long v24 = sub_1000071C0;
  id v25 = 0;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1000071C8;
  id v15 = &unk_100018838;
  id v16 = self;
  id v18 = &v20;
  id v8 = v6;
  id v17 = v8;
  id v19 = &v26;
  dispatch_sync(taskExecutionQueue, &v12);
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  [(MLRExtensionPluginManager *)self unload];
  id v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  dispatch_queue_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000071B0;
  objc_super v30 = sub_1000071C0;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000071B0;
  long long v24 = sub_1000071C0;
  id v25 = 0;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10000783C;
  id v15 = &unk_100018838;
  id v16 = self;
  id v18 = &v20;
  id v8 = v6;
  id v17 = v8;
  id v19 = &v26;
  dispatch_sync(taskExecutionQueue, &v12);
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  [(MLRExtensionPluginManager *)self unload];
  id v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (int64_t)_graceIntervalBeforeUnloading
{
  return 5000000000;
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007D8C;
  v7[3] = &unk_100018888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(syncQueue, v7);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end