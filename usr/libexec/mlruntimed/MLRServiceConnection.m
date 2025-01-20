@interface MLRServiceConnection
- (BOOL)taskIsDeferred;
- (MLRServiceConnection)initWithXPCConnection:(id)a3;
- (OS_xpc_object)activity;
- (void)debugInfoStringForPluginID:(id)a3 completion:(id)a4;
- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5;
- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)fetchRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4;
- (void)fetchTelemetryForBundleId:(id)a3 completion:(id)a4;
- (void)runEvaluationForBundleId:(id)a3 recipePath:(id)a4 recordUUIDs:(id)a5 attachments:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)runLiveEvaluationForAllBundlesWithBaseURL:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)runLiveEvaluationForBundleId:(id)a3 taskSource:(int64_t)a4 baseURL:(id)a5 localeIdentifier:(id)a6 completion:(id)a7;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forInfoKey:(id)a4 bundleID:(id)a5 completion:(id)a6;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation MLRServiceConnection

- (MLRServiceConnection)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLRServiceConnection;
  v5 = [(MLRServiceConnection *)&v21 init];
  if (v5)
  {
    v6 = +[NSProcessInfo processInfo];
    [v6 systemUptime];
    v5->_connectionStartTime = v7;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MLRServiceConnection", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    [v4 _setQueue:v5->_queue];
    objc_storeWeak((id *)&v5->_connection, v4);
    uint64_t v11 = +[DESBundleRegistry sharedInstance];
    bundleRegistry = v5->_bundleRegistry;
    v5->_bundleRegistry = (DESBundleRegistry *)v11;

    uint64_t v13 = objc_opt_new();
    recordStoreManager = v5->_recordStoreManager;
    v5->_recordStoreManager = (DESRecordStoreManager *)v13;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000AB1C;
    v19[3] = &unk_100018708;
    v15 = v5;
    v20 = v15;
    v16 = objc_retainBlock(v19);
    [v4 setInterruptionHandler:v16];
    [v4 setInvalidationHandler:v16];
    v17 = v15;
  }
  return v5;
}

- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3
{
  p_connection = &self->_connection;
  v5 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  unsigned __int8 v7 = +[DESServiceAccess hasToolEntitlement:WeakRetained];

  if (v7)
  {
    id v10 = [(DESBundleRegistry *)self->_bundleRegistry allBundleIds];
    v5[2](v5);
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"fetchInstalledBundlesIdsWithCompletion may only be called by des_tool";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    dispatch_queue_t v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v8];
    ((void (*)(void (**)(void), void, void *))v5[2])(v5, 0, v9);
  }
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    DESLogAndReturnSunsetError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
  }
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)fetchRecordsForBundleId:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void, id))a4 + 2))(v5, 0, 0, 0, v6);
  }
}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v14 = 0;
  unsigned __int8 v9 = +[DESServiceAccess hasRecordAccessToBundleId:v6 connection:WeakRetained error:&v14];
  id v10 = v14;

  if (v9)
  {
    recordStoreManager = self->_recordStoreManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B50C;
    v12[3] = &unk_100018960;
    v12[4] = self;
    id v13 = v7;
    [(DESRecordStoreManager *)recordStoreManager deleteAllSavedRecordsForBundleId:v6 completion:v12];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v17 = 0;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:v8 connection:WeakRetained error:&v17];
  id v13 = v17;

  if (v12)
  {
    recordStoreManager = self->_recordStoreManager;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B714;
    v15[3] = &unk_100018960;
    v15[4] = self;
    id v16 = v10;
    [(DESRecordStoreManager *)recordStoreManager deleteSavedRecordForBundleId:v8 identfier:v9 completion:v15];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v14 = 0;
  unsigned __int8 v10 = +[DESServiceAccess hasRecordAccessToBundleId:v8 connection:WeakRetained error:&v14];

  id v11 = v14;
  if (v10)
  {
    if (v7)
    {
      unsigned __int8 v12 = DESLogAndReturnSunsetError();
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    id v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Uh oh %@", buf, 0xCu);
    }

    v7[2](v7, 0, v11);
  }
}

- (void)runEvaluationForBundleId:(id)a3 recipePath:(id)a4 recordUUIDs:(id)a5 attachments:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v11 = a7;
  id v12 = a8;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v24 = 0;
  unsigned __int8 v15 = +[DESServiceAccess hasRecordAccessToBundleId:v13 connection:WeakRetained error:&v24];

  id v16 = v24;
  if (v15)
  {
    id v17 = (DESSandBoxManager *)[objc_alloc((Class)DESSandBoxManager) initWithExtensions:v11];
    sandBoxExtension = self->_sandBoxExtension;
    self->_sandBoxExtension = v17;

    v19 = self->_sandBoxExtension;
    id v23 = v16;
    unsigned __int8 v20 = [(DESSandBoxManager *)v19 consumeExtensionsWithError:&v23];
    id v21 = v23;

    if (v20)
    {
      v22 = DESLogAndReturnSunsetError();
      (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, v22);
    }
    else
    {
      (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v21);
    }
    id v16 = v21;
  }
  else
  {
    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v16);
  }
}

- (void)runLiveEvaluationForBundleId:(id)a3 taskSource:(int64_t)a4 baseURL:(id)a5 localeIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v24 = 0;
  unsigned __int8 v17 = +[DESServiceAccess hasRecordAccessToBundleId:v12 connection:WeakRetained error:&v24];
  id v18 = v24;
  if (v17)
  {
    v19 = [[MLRTaskScheduler alloc] initWithBaseURL:v13 localeIdentifier:v14 fromDesTool:WeakRetained != 0];
    unsigned __int8 v20 = [[MLRSchedulingTask alloc] initWithBundleIdentifier:v12 taskSource:a4];
    v25 = v20;
    id v21 = +[NSArray arrayWithObjects:&v25 count:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000BD0C;
    v22[3] = &unk_100018668;
    v22[4] = self;
    id v23 = v15;
    [(MLRTaskScheduler *)v19 startTasks:v21 completion:v22];
  }
  else
  {
    (*((void (**)(id, void, id))v15 + 2))(v15, 0, v18);
  }
}

- (void)runLiveEvaluationForAllBundlesWithBaseURL:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (+[DESServiceAccess hasToolEntitlement:WeakRetained])
  {
    id v12 = +[DESBundleRegistry sharedInstance];
    id v13 = [v12 allUnrestrictedBundleIds];

    id v14 = [[MLRTaskScheduler alloc] initWithBaseURL:v8 localeIdentifier:v9 fromDesTool:WeakRetained != 0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BFF0;
    v15[3] = &unk_100018610;
    id v16 = v10;
    [(MLRTaskScheduler *)v14 startTasksForPluginIDs:v13 completion:v15];
  }
  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"runLiveEvaluationForAllBundles may only be called by des_tool";
    id v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v13];
    (*((void (**)(id, MLRTaskScheduler *))v10 + 2))(v10, v14);
  }
}

- (void)fetchTelemetryForBundleId:(id)a3 completion:(id)a4
{
  p_connection = &self->_connection;
  id v5 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  unsigned __int8 v7 = +[DESServiceAccess hasToolEntitlement:WeakRetained];

  if (v7)
  {
    DESLogAndReturnSunsetError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"fetchTelemetryForBundleId may only be called by des_tool";
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v8];
    ((void (*)(void (**)(id, void), void, void *))v5[2])(v5, 0, v9);
  }
}

- (void)setValue:(id)a3 forInfoKey:(id)a4 bundleID:(id)a5 completion:(id)a6
{
}

- (void)wakeUpWithCompletion:(id)a3
{
}

- (void)debugInfoStringForPluginID:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v9 = [objc_alloc((Class)DESDebugRecord) initFromStoreWithPluginID:v6 taskSource:1];

  unsigned __int8 v7 = [v9 description];
  id v8 = +[NSString stringWithFormat:@"%@", v7];
  v5[2](v5, v8);
}

- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v12 = +[DESServiceAccess hasMLRCtlEntitlement:WeakRetained];

  if (v12)
  {
    id v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10000C66C((uint64_t)v8, (uint64_t)v9, v13);
    }

    id v14 = [objc_alloc((Class)MLRTrialDediscoTaskResult) initWithJSONResult:v8 identifier:v9];
    if (!v14)
    {
      uint64_t v17 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      +[NSString stringWithFormat:@"Unknown identifier = %@", v9];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = v16;
      CFStringRef v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v19 = +[NSError errorWithDomain:v17 code:1303 userInfo:v18];
      v10[2](v10, v19);

      goto LABEL_8;
    }
    id v15 = +[TRIClient clientWithIdentifier:280];
    id v20 = 0;
    [v14 submitWithTRIClient:v15 error:&v20];
    id v16 = v20;
  }
  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"donateJSONResult may only be called by internal tool.";
    id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v16 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v14];
  }
  v10[2](v10, v16);
LABEL_8:
}

- (BOOL)taskIsDeferred
{
  return 0;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_sandBoxExtension, 0);
  objc_storeStrong((id *)&self->_recordStoreManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleRegistry, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end