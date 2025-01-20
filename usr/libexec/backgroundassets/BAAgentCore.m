@interface BAAgentCore
+ (id)sharedCore;
- (BAAgentCore)init;
- (BAAgentDownloadRulesEngine)rulesEngine;
- (BOOL)__schedulingPermittedWithIdentifier:(id)a3 downloadQueue:(id *)a4 appInfo:(id *)a5 error:(id *)a6;
- (BOOL)_applicationIdentifierAllowsBackgroundActivity:(id)a3;
- (BOOL)_checkConnection:(id)a3 hasAllowedTeamIDForIdentifier:(id)a4;
- (BOOL)_checkIdentifierHasExtension:(id)a3;
- (BOOL)debugClearState;
- (BOOL)downloadQueue:(id)a3 permittedToStartDownloadsWithNecessity:(int64_t)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewClientConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewSPIConnection:(id)a4;
- (BOOL)removeAppWithAppInfo:(id)a3 error:(id *)a4;
- (CoreTelephonyClient)telephonyClient;
- (NSMutableArray)applicationState;
- (NSMutableArray)connections;
- (NSMutableArray)unhandledDownloadEvents;
- (NSMutableDictionary)connectionReplyQueue;
- (NSMutableDictionary)downloadQueuesByClientIdentifier;
- (NSMutableDictionary)extensionConnections;
- (NSMutableDictionary)telemetryByDownloadUniqueIdentifier;
- (NSXPCListener)listener;
- (NSXPCListener)spiListener;
- (OS_dispatch_queue)asyncClientNotificationQueue;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)lockDownQueue;
- (OS_dispatch_queue)telemetryQueue;
- (OS_dispatch_queue)workQueue;
- (id)_connectionReplyQueueForIdentifier:(id)a3;
- (id)_connectionsForApplicationIdentifier:(id)a3;
- (id)_downloadQueueForIdentifier:(id)a3 create:(BOOL)a4 error:(id *)a5;
- (id)_downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4;
- (id)_essentialAssetsProgressDescriptorWithAppInfo:(id)a3 essentialAssetState:(int64_t)a4 sizeDownloaded:(int64_t)a5 totalDownloadSize:(int64_t)a6;
- (id)_systemConnections;
- (id)applicationInfoForIdentifier:(id)a3;
- (id)applicationInfoIfExistsForIdentifier:(id)a3;
- (id)downloadForIdentifier:(id)a3 forClientIdentifier:(id)a4;
- (id)downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4;
- (id)downloadsForIdentifier:(id)a3;
- (id)essentialAssetsProgressDescriptorWithIdentifier:(id)a3;
- (id)updateApplicationInformationForIdentifier:(id)a3 bundleURLPath:(id)a4;
- (int64_t)applicationExtensionStateForIdentifier:(id)a3;
- (int64_t)applicationStateForIdentifier:(id)a3;
- (unint64_t)_downloadsInProgress;
- (unint64_t)_downloadsInProgressForIdentifier:(id)a3;
- (void)__handleApplicationLaunchedWithInfo:(id)a3;
- (void)_asyncAwaitLockdownClientMessage:(_lockdown_connection *)a3 waitQueue:(id)a4;
- (void)_backgroundActivityStateDidChange;
- (void)_clearState;
- (void)_debugDownloadTime:(BOOL)a3 clear:(BOOL)a4;
- (void)_debugShutdown;
- (void)_deleteDownloadQueueForIdentifier:(id)a3;
- (void)_deserializeApplicationList;
- (void)_deserializeDownloadQueues;
- (void)_deserializeState;
- (void)_deserializeUndeliveredEvents;
- (void)_pauseDownloads;
- (void)_pokeScheduler;
- (void)_printDebugState;
- (void)_processLockdownClientMessage:(id)a3 withConnection:(_lockdown_connection *)a4 withQueue:(id)a5;
- (void)_processRunningBoardStateUpdate:(id)a3 forProcess:(id)a4;
- (void)_requestNetworkConsentWithApplication:(id)a3 userInitiated:(BOOL)a4;
- (void)_scheduleDownloads;
- (void)_serializeApplicationState;
- (void)_serializeDownloadQueues;
- (void)_serializeState;
- (void)_serializeUndeliveredEvents;
- (void)_setClearBeforeShutdown;
- (void)_shutdownAgent;
- (void)_updateProcessMonitor;
- (void)_updateStateForAppBundleIdentifier:(id)a3 state:(int64_t)a4;
- (void)_updateStateForAppExtensionBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 state:(int64_t)a5;
- (void)applicationInstallCanceledWithIdentifier:(id)a3 userInitiated:(BOOL)a4;
- (void)applicationPlaceholderReadyWithIdentifier:(id)a3 placeholderBundleURL:(id)a4 userInitiated:(BOOL)a5;
- (void)applicationPrepareWithDescriptor:(id)a3;
- (void)cancelDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5;
- (void)connectionDisconnected:(id)a3;
- (void)doPeriodicUpdateCheck;
- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)download:(id)a3 failedWithError:(id)a4;
- (void)download:(id)a3 finishedWithFileURL:(id)a4;
- (void)downloadDidBegin:(id)a3;
- (void)downloadDidPause:(id)a3;
- (void)downloadQueue:(id)a3 essentialAssetState:(int64_t)a4 bytesWritten:(int64_t)a5 totalBytes:(int64_t)a6;
- (void)downloadQueue:(id)a3 manifest:(id)a4 finishedWithFileURL:(id)a5;
- (void)downloadTimeValidityDidChange;
- (void)extensionDisconnectedWithIdentifier:(id)a3 connectionProxy:(id)a4;
- (void)handleApplicationEvent:(int64_t)a3 identifier:(id)a4 bundleURLPath:(id)a5 userInitiated:(BOOL)a6;
- (void)handleApplicationLaunched:(id)a3;
- (void)invalidateExtensionWithAppInfo:(id)a3;
- (void)pauseQueueWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)resumeQueueWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)saveApplicationState;
- (void)scheduleDownload:(id)a3 forClientIdentifier:(id)a4 notifyQueue:(id)a5 completionBlock:(id)a6;
- (void)setApplicationState:(id)a3;
- (void)setAsyncClientNotificationQueue:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnectionReplyQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setContentRequestTelemetry:(id)a3 forDownloads:(id)a4;
- (void)setDebugClearState:(BOOL)a3;
- (void)setDownloadQueuesByClientIdentifier:(id)a3;
- (void)setExtensionConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setLockDownQueue:(id)a3;
- (void)setRulesEngine:(id)a3;
- (void)setSpiListener:(id)a3;
- (void)setTelemetryByDownloadUniqueIdentifier:(id)a3;
- (void)setTelemetryQueue:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setUnhandledDownloadEvents:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startForegroundDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5;
- (void)updateContentRequestTelemetryForCompletedDownload:(id)a3 error:(id)a4;
@end

@implementation BAAgentCore

+ (id)sharedCore
{
  if (qword_100069590 != -1) {
    dispatch_once(&qword_100069590, &stru_10005CFD8);
  }
  v2 = (void *)qword_100069588;

  return v2;
}

- (BAAgentCore)init
{
  v46.receiver = self;
  v46.super_class = (Class)BAAgentCore;
  v2 = [(BAAgentCore *)&v46 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.backgroundassets.agentcore.clientnotification.async", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(BAAgentCore *)v2 setAsyncClientNotificationQueue:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.backgroundassets.agentcore.connectionqueue", 0);
    [(BAAgentCore *)v2 setConnectionQueue:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.backgroundassets.agentcore.workqueue", 0);
    [(BAAgentCore *)v2 setWorkQueue:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.backgroundassets.agentcore.telemetryQueue", 0);
    [(BAAgentCore *)v2 setTelemetryQueue:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.backgroundassets.agentcore.lockdown", 0);
    [(BAAgentCore *)v2 setLockDownQueue:v7];

    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:32];
    [(BAAgentCore *)v2 setConnections:v8];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(BAAgentCore *)v2 setExtensionConnections:v9];

    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [(BAAgentCore *)v2 setDownloadQueuesByClientIdentifier:v10];

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [(BAAgentCore *)v2 setTelemetryByDownloadUniqueIdentifier:v11];

    id v12 = objc_alloc_init((Class)NSMutableArray);
    [(BAAgentCore *)v2 setApplicationState:v12];

    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [(BAAgentCore *)v2 setConnectionReplyQueue:v13];

    id v14 = objc_alloc_init((Class)NSMutableArray);
    [(BAAgentCore *)v2 setUnhandledDownloadEvents:v14];

    v15 = [[BAAgentDownloadRulesEngine alloc] initWithDelegate:v2];
    [(BAAgentCore *)v2 setRulesEngine:v15];

    id v16 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
    [(BAAgentCore *)v2 setTelephonyClient:v16];

    v17 = [(BAAgentCore *)v2 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A70C;
    block[3] = &unk_10005C998;
    v18 = v2;
    v45 = v18;
    dispatch_async(v17, block);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001A748, @"kKeepAppsUpToDateEnabledChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v18 selector:"_backgroundActivityStateDidChange" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    id v21 = objc_alloc((Class)NSXPCListener);
    id v22 = [v21 initWithMachServiceName:off_1000692E8[0]];
    [(BAAgentCore *)v18 setListener:v22];

    v23 = [(BAAgentCore *)v18 listener];
    v24 = [(BAAgentCore *)v18 connectionQueue];
    [v23 _setQueue:v24];

    v25 = [(BAAgentCore *)v18 listener];
    [v25 setDelegate:v18];

    v26 = [(BAAgentCore *)v18 listener];
    [v26 resume];

    id v27 = objc_alloc((Class)NSXPCListener);
    id v28 = [v27 initWithMachServiceName:off_1000692E0[0]];
    [(BAAgentCore *)v18 setSpiListener:v28];

    v29 = [(BAAgentCore *)v18 spiListener];
    v30 = [(BAAgentCore *)v18 connectionQueue];
    [v29 _setQueue:v30];

    v31 = [(BAAgentCore *)v18 spiListener];
    [v31 setDelegate:v18];

    v32 = [(BAAgentCore *)v18 spiListener];
    [v32 resume];

    v33 = sub_100013ABC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Started listening for clients.", buf, 2u);
    }

    v34 = [(BAAgentCore *)v18 lockDownQueue];
    v35 = v18;
    v42 = v35;
    int v36 = lockdown_checkin_xpc();

    v37 = sub_100013ABC();
    v38 = v37;
    if (v36)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100039710(v36, v38);
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Started listening for lockdown clients.", buf, 2u);
    }

    v39 = [(BAAgentCore *)v35 rulesEngine];
    [v39 resume];

    v40 = sub_100013ABC();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Started listening for xpc activity.", buf, 2u);
    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 serviceName];
  unsigned int v9 = [v8 isEqualToString:off_1000692E8[0]];

  if (v9)
  {
    unsigned __int8 v10 = [(BAAgentCore *)self listener:v6 shouldAcceptNewClientConnection:v7];
LABEL_5:
    BOOL v13 = v10;
    goto LABEL_9;
  }
  id v11 = [v6 serviceName];
  unsigned int v12 = [v11 isEqualToString:off_1000692E0[0]];

  if (v12)
  {
    unsigned __int8 v10 = [(BAAgentCore *)self listener:v6 shouldAcceptNewSPIConnection:v7];
    goto LABEL_5;
  }
  id v14 = sub_100013BEC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100039788(v7, v14);
  }

  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewClientConnection:(id)a4
{
  id v5 = a4;
  id v16 = 0;
  id v6 = [[BAAgentClientConnection alloc] initWithNSXPCConnection:v5 error:&v16];
  id v7 = v16;
  id v8 = [(BAAgentCore *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AA90;
  v12[3] = &unk_10005CE30;
  BOOL v13 = v6;
  id v14 = v5;
  v15 = self;
  id v9 = v5;
  unsigned __int8 v10 = v6;
  dispatch_async(v8, v12);

  return v10 != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewSPIConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100013BEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v24 = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New SPI connection from pid:%{public}d", buf, 8u);
  }

  id v7 = [v5 valueForEntitlement:@"com.apple.backgroundassets.system"];
  if ([v7 BOOLValue])
  {

LABEL_6:
    id v22 = 0;
    unsigned __int8 v10 = [[BAAgentSystemConnection alloc] initWithNSXPCConnection:v5 error:&v22];
    id v11 = v22;
    unsigned int v12 = [(BAAgentCore *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AF54;
    block[3] = &unk_10005D050;
    v18 = v10;
    v19 = self;
    id v20 = v5;
    id v21 = v11;
    id v13 = v11;
    id v14 = v10;
    dispatch_async(v12, block);

    BOOL v15 = v14 != 0;
    goto LABEL_10;
  }
  id v8 = [v5 valueForEntitlement:@"com.apple.backgroundassets.appstore"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9) {
    goto LABEL_6;
  }
  id v14 = sub_100013BEC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100039868(v5);
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (void)connectionDisconnected:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BAAgentCore *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001B11C;
    v6[3] = &unk_10005CA10;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)extensionDisconnectedWithIdentifier:(id)a3 connectionProxy:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    id v7 = -[BAAgentCore applicationInfoForIdentifier:](self, "applicationInfoForIdentifier:");
    id v8 = [(BAAgentCore *)self extensionConnections];
    objc_sync_enter(v8);
    unsigned int v9 = [(BAAgentCore *)self extensionConnections];
    id v10 = [v9 objectForKey:v12];

    if (v10 == v6)
    {
      id v11 = [(BAAgentCore *)self extensionConnections];
      [v11 removeObjectForKey:v12];

      [v7 extensionExited];
    }

    objc_sync_exit(v8);
  }
}

- (id)downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v6];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10001B51C;
  v19 = sub_10001B52C;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B534;
  v11[3] = &unk_10005D078;
  id v12 = v6;
  id v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_downloaderExtensionForApplicationIdentifier:(id)a3 cacheOnly:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(BAAgentCore *)self applicationInfoForIdentifier:v6];
  if (([v7 allowsBackgroundActivity] & 1) == 0)
  {
    id v11 = sub_100013B54();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100039CFC();
    }
LABEL_6:
    id v12 = 0;
    goto LABEL_7;
  }
  id v8 = [(BAAgentCore *)self extensionConnections];
  objc_sync_enter(v8);
  id v9 = [(BAAgentCore *)self extensionConnections];
  id v10 = [v9 objectForKey:v6];

  if (v10)
  {
    id v11 = v10;
    objc_sync_exit(v8);

    id v12 = (BADownloaderExtensionProxy *)v11;
LABEL_7:

    goto LABEL_8;
  }
  objc_sync_exit(v8);

  if (!a4)
  {
    if ([v7 shouldLaunchExtension])
    {
      id v11 = [v7 extensionIdentity];
      if (v11)
      {
        BOOL v14 = objc_opt_new();
        [v14 setExtensionIdentity:v11];
        id v36 = 0;
        uint64_t v15 = +[_EXExtensionProcess extensionProcessWithConfiguration:v14 error:&v36];
        id v16 = v36;
        uint64_t v17 = v16;
        if (v15)
        {
          v35 = v16;
          v18 = [v15 makeXPCConnectionWithError:&v35];
          v19 = v35;

          if (v18)
          {
            id v20 = [[BADownloaderExtensionProxy alloc] initWithExtension:v15 XPCConnection:v18 applicationInfo:v7];
            unsigned int v21 = [(BAAgentCore *)self _checkConnection:v18 hasAllowedTeamIDForIdentifier:v6];
            if (v20 && v21)
            {
              p_super = [(BAAgentCore *)self extensionConnections];
              objc_sync_enter(p_super);
              v23 = [(BAAgentCore *)self extensionConnections];
              [v23 setObject:v20 forKey:v6];

              objc_sync_exit(p_super);
            }
            else
            {
              p_super = sub_100013B54();
              BOOL v34 = os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR);
              if (v20)
              {
                if (v34) {
                  sub_100039B74(v18, p_super);
                }

                [(BADownloaderExtensionProxy *)v20 invalidate];
                p_super = &v20->super;
              }
              else if (v34)
              {
                sub_100039C04(v18, p_super);
              }
              id v20 = 0;
            }

            id v12 = v20;
          }
          else
          {
            v25 = sub_100013B54();
            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
            if (v19)
            {
              if (v26) {
                sub_100039ADC(v19, v25);
              }

              id v12 = 0;
            }
            else
            {
              if (v26) {
                sub_100039AA4(v25, v27, v28, v29, v30, v31, v32, v33);
              }
              id v12 = 0;
              v19 = v25;
            }
          }
        }
        else
        {
          unsigned int v24 = sub_100013B54();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100039A0C(v17, v24);
          }

          id v12 = 0;
          v19 = v17;
        }
      }
      else
      {
        BOOL v14 = sub_100013B54();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000399A4();
        }
        id v12 = 0;
      }

      goto LABEL_7;
    }
    id v11 = sub_100013B54();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100039C94();
    }
    goto LABEL_6;
  }
  id v12 = 0;
LABEL_8:

  return v12;
}

- (int64_t)applicationExtensionStateForIdentifier:(id)a3
{
  dispatch_queue_t v3 = [(BAAgentCore *)self applicationInfoForIdentifier:a3];
  id v4 = [v3 applicationExtensionState];

  return (int64_t)v4;
}

- (int64_t)applicationStateForIdentifier:(id)a3
{
  dispatch_queue_t v3 = [(BAAgentCore *)self applicationInfoForIdentifier:a3];
  id v4 = [v3 applicationState];

  return (int64_t)v4;
}

- (void)saveApplicationState
{
  dispatch_queue_t v3 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BA50;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)_deleteDownloadQueueForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  [v6 removeObjectForKey:v4];
}

- (id)_downloadQueueForIdentifier:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  id v11 = [v10 objectForKey:v8];

  if (!v11)
  {
    if (a4)
    {
      id v12 = [[BADownloadQueue alloc] initWithApplicationIdentifier:v8 delegate:self];
      if (v12)
      {
        id v11 = v12;
        id v13 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
        [v13 setObject:v11 forKey:v8];

        goto LABEL_11;
      }
      if (a5)
      {
        uint64_t v14 = -104;
        goto LABEL_9;
      }
    }
    else if (a5)
    {
      uint64_t v14 = -105;
LABEL_9:
      sub_100029C00(v14);
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    id v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)applicationInfoForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(BAAgentCore *)self applicationState];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      id v11 = [v10 applicationIdentifier];
      unsigned __int8 v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v13 = [[BAApplicationInfo alloc] initWithIdentifier:v4];
  uint64_t v14 = [(BAAgentCore *)self applicationState];
  [v14 addObject:v13];

  [(BAAgentCore *)self _updateProcessMonitor];
  [(BAAgentCore *)self _serializeApplicationState];
LABEL_12:
  objc_sync_exit(v5);

  return v13;
}

- (id)applicationInfoIfExistsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(BAAgentCore *)self applicationState];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 applicationIdentifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (void)applicationPrepareWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C014;
  v7[3] = &unk_10005CA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)applicationPlaceholderReadyWithIdentifier:(id)a3 placeholderBundleURL:(id)a4 userInitiated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BAAgentCore *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001C1A4;
  v13[3] = &unk_10005D0A0;
  BOOL v17 = a5;
  id v14 = v8;
  id v15 = v9;
  long long v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)applicationInstallCanceledWithIdentifier:(id)a3 userInitiated:(BOOL)a4
{
  id v5 = a3;
  id v6 = sub_100013B54();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v16 = [v5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Event (Canceled) received for client (%{public}s)", buf, 0xCu);
  }

  id v7 = [(BAAgentCore *)self applicationInfoIfExistsForIdentifier:v5];
  if (v7)
  {
    id v14 = 0;
    unsigned __int8 v8 = [(BAAgentCore *)self removeAppWithAppInfo:v7 error:&v14];
    id v9 = v14;
    if (v8)
    {
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      id v11 = [(BAAgentCore *)self workQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001C524;
      v13[3] = &unk_10005C998;
      void v13[4] = self;
      dispatch_after(v10, v11, v13);
    }
    else
    {
      id v12 = sub_100013B54();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100039DCC();
      }
    }
  }
  else
  {
    id v9 = sub_100013B54();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100039D64();
    }
  }
}

- (void)_requestNetworkConsentWithApplication:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    unsigned __int8 v8 = [v6 applicationIdentifier];
    if ([v7 setAwaitingNetworkConsent:1])
    {
      id v9 = [(BAAgentCore *)self telephonyClient];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001C624;
      v10[3] = &unk_10005D0C8;
      id v11 = v8;
      id v12 = v7;
      [v9 performNetworkAccessFlowIfAllowed:v11 ignoreForeground:1 completion:v10];
    }
  }
}

- (id)updateApplicationInformationForIdentifier:(id)a3 bundleURLPath:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (v7)
  {
    unsigned __int8 v8 = [objc_alloc((Class)NSBundle) _initUniqueWithURL:v7];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 infoDictionary];
      if (v10)
      {
        id v11 = (id)v10;
        id v12 = objc_alloc((Class)LSApplicationRecord);
        id v13 = [v9 bundleURL];
        id v33 = 0;
        id v14 = [v12 initWithURL:v13 allowPlaceholder:1 error:&v33];
        id v15 = v33;

        if (v14)
        {
          [(BAAgentCore *)self applicationInfoForIdentifier:v6];
          id v16 = v11;
          id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

          v23 = sub_100013B54();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v24 = @"N/A";
            if (v7) {
              CFStringRef v24 = v7;
            }
            *(_DWORD *)buf = 138543618;
            id v35 = v6;
            __int16 v36 = 2114;
            CFStringRef v37 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Application info for (%{public}@) is being updated based on URL:(%{public}@)", buf, 0x16u);
          }

          v25 = +[BAApplicationConfigurationOverrides overridesForAppBundleIdentifier:v6];
          [v11 updateApplicationWithInfoDictionary:v16 applicationRecord:v14 overrides:v25];
          [(BAAgentCore *)self _serializeApplicationState];
          id v11 = v11;

          BOOL v26 = v11;
          goto LABEL_36;
        }
        uint64_t v27 = sub_100013B54();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = [v9 bundleURL];
          *(_DWORD *)buf = 138543874;
          id v35 = v6;
          __int16 v36 = 2114;
          CFStringRef v37 = v31;
          __int16 v38 = 2114;
          id v39 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to update application info. LSApplicationRecord from URL failed (bundle identifier: %{public}@, URL: %{public}@) %{public}@", buf, 0x20u);
        }
        BOOL v26 = 0;
        id v14 = v9;
        goto LABEL_36;
      }
      id v14 = sub_100013B54();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100039FF8();
      }
    }
    else
    {
      id v14 = sub_100013B54();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100039F88();
      }
    }
    BOOL v26 = 0;
    id v11 = v9;
    goto LABEL_36;
  }
  id v11 = [(BAAgentCore *)self applicationInfoForIdentifier:v6];
  id v14 = [v11 persistentIdentifier];
  if (!v14
    || (BOOL v17 = [objc_alloc((Class)LSApplicationRecord) initWithPersistentIdentifier:v14]) == 0)
  {
    long long v18 = sub_100013B54();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Unable to use persistent identifier to update application info. Falling back to bundle identifier lookup. (bundle identifier: %{public}@)", buf, 0xCu);
    }

    id v32 = 0;
    BOOL v17 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v32];
    id v19 = v32;
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        goto LABEL_13;
      }
      uint64_t v28 = sub_100013B54();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100039F20();
      }
    }
    else
    {
      uint64_t v28 = sub_100013B54();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100039E48();
      }
    }

    BOOL v26 = 0;
    goto LABEL_36;
  }
LABEL_13:
  id v20 = objc_alloc((Class)NSBundle);
  unsigned int v21 = [v17 URL];
  id v15 = [v20 _initUniqueWithURL:v21];

  uint64_t v22 = [v15 infoDictionary];
  if (v22)
  {
    id v16 = (void *)v22;
    id v9 = v14;
    id v14 = v17;
    goto LABEL_15;
  }
  uint64_t v29 = sub_100013B54();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_100039EB8();
  }

  BOOL v26 = 0;
  id v14 = v17;
LABEL_36:

  return v26;
}

- (void)handleApplicationEvent:(int64_t)a3 identifier:(id)a4 bundleURLPath:(id)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = [(BAAgentCore *)self updateApplicationInformationForIdentifier:v10 bundleURLPath:a5];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 manifestURL];
    if (v13)
    {
      id v14 = [v12 applicationSecurityGroups];
      if ([v14 count])
      {
        id v15 = os_transaction_create();
        switch(a3)
        {
          case 1:
            id v16 = v12;
            uint64_t v17 = 0;
            goto LABEL_22;
          case 2:
            id v16 = v12;
            uint64_t v17 = 1;
LABEL_22:
            [v16 applicationInstallingWithUpdateInstall:v17];
            [(BAAgentCore *)self invalidateExtensionWithAppInfo:v12];
            [(BAAgentCore *)self _updateProcessMonitor];
            [(BAAgentCore *)self _serializeApplicationState];
            goto LABEL_30;
          case 3:
            long long v18 = sub_100013B54();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              id v58 = [v10 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Event (Restoring) received for client (%{public}s)", buf, 0xCu);
            }

            [(BAAgentCore *)self _updateProcessMonitor];
            [(BAAgentCore *)self _serializeApplicationState];
            break;
          case 4:
            id v19 = sub_100013B54();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              id v58 = [v10 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Event (Paused) received for client (%{public}s)", buf, 0xCu);
            }

            id v20 = [v12 applicationIdentifier];
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_10001D4E8;
            v54[3] = &unk_10005D0F0;
            id v55 = v10;
            id v15 = v15;
            v56 = v15;
            [(BAAgentCore *)self pauseQueueWithIdentifier:v20 completionBlock:v54];

            unsigned int v21 = v55;
            goto LABEL_40;
          case 5:
            uint64_t v22 = sub_100013B54();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              id v58 = [v10 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Event (Resumed) received for client (%{public}s)", buf, 0xCu);
            }

            v23 = [v12 applicationIdentifier];
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_10001D550;
            v51[3] = &unk_10005D0F0;
            id v52 = v10;
            id v15 = v15;
            v53 = v15;
            [(BAAgentCore *)self resumeQueueWithIdentifier:v23 completionBlock:v51];

            unsigned int v21 = v52;
            goto LABEL_40;
          case 6:
            unsigned int v24 = [v12 receivedInstalledNotification];
            v25 = sub_100013B54();
            BOOL v26 = v25;
            if (v24)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                sub_10003A1F0(v10, v26);
              }
            }
            else
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446210;
                id v58 = [v10 UTF8String];
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Event (Installed) received for client (%{public}s)", buf, 0xCu);
              }

              [(BAAgentCore *)self invalidateExtensionWithAppInfo:v12];
              id v39 = [(BAAgentCore *)self workQueue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10001D5B8;
              block[3] = &unk_10005D050;
              void block[4] = self;
              id v48 = v10;
              id v49 = v12;
              id v15 = v15;
              v50 = v15;
              dispatch_async(v39, block);

              [(BAAgentCore *)self _updateProcessMonitor];
              unsigned int v21 = v48;
LABEL_40:
            }
            break;
          case 7:
            uint64_t v27 = sub_100013B54();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              id v58 = [v10 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Event (Periodic) received for client (%{public}s", buf, 0xCu);
            }

LABEL_30:
            if ([(BAAgentCore *)self _applicationIdentifierAllowsBackgroundActivity:v10])
            {
              [(BAAgentCore *)self _requestNetworkConsentWithApplication:v12 userInitiated:v6];
              uint64_t v28 = [BAManifestDownload alloc];
              uint64_t v29 = [v14 firstObject];
              uint64_t v30 = sub_10000BDD8(v28, (uint64_t)v13, a3, v29, v12);

              uint64_t v31 = sub_100013B54();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [v10 UTF8String];
                *(_DWORD *)buf = 134218242;
                id v58 = (id)a3;
                __int16 v59 = 2082;
                id v60 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Event (%ld) for client (%{public}s) is scheduling manifest for download.", buf, 0x16u);
              }

              id v33 = [v12 applicationIdentifier];
              BOOL v34 = [(BAAgentCore *)self workQueue];
              v42[0] = _NSConcreteStackBlock;
              v42[1] = 3221225472;
              v42[2] = sub_10001D62C;
              v42[3] = &unk_10005D118;
              int64_t v46 = a3;
              id v43 = v10;
              v44 = v13;
              id v35 = v15;
              v45 = v35;
              [(BAAgentCore *)self scheduleDownload:v30 forClientIdentifier:v33 notifyQueue:v34 completionBlock:v42];

              id v15 = v35;
              v41 = v15;
              __int16 v36 = [(BAAgentCore *)self workQueue];
              [v12 performAfterNetworkConsentProvided:&v40 queue:v36];
            }
            else
            {
              CFStringRef v37 = sub_100013B54();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                id v38 = [v10 UTF8String];
                *(_DWORD *)buf = 134218242;
                id v58 = (id)a3;
                __int16 v59 = 2082;
                id v60 = v38;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Event (%ld) ignored for client (%{public}s) because background activity is not allowed.", buf, 0x16u);
              }
            }
            break;
          default:
            break;
        }
      }
      else
      {
        id v15 = sub_100013B54();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10003A174();
        }
      }
    }
    else
    {
      id v14 = sub_100013B54();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003A0E4();
      }
    }
  }
  else
  {
    id v13 = sub_100013B54();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003A068();
    }
  }
}

- (BOOL)__schedulingPermittedWithIdentifier:(id)a3 downloadQueue:(id *)a4 appInfo:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(BAAgentCore *)self _downloadQueueForIdentifier:v10 create:1 error:a6];
  id v13 = v12;
  if (v12)
  {
    if (a4) {
      *a4 = v12;
    }
    id v14 = [(BAAgentCore *)self applicationInfoForIdentifier:v10];
    id v15 = v14;
    if (a5) {
      *a5 = v14;
    }
    if (([v15 hasLaunchedApplication] & 1) != 0
      || ([v15 permittedForInitialBackgroundActivity] & 1) != 0)
    {
      BOOL v16 = 1;
    }
    else if (a6)
    {
      sub_100029C00(206);
      BOOL v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    BOOL v16 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v16;
}

- (void)scheduleDownload:(id)a3 forClientIdentifier:(id)a4 notifyQueue:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D8DC;
  block[3] = &unk_10005D168;
  void block[4] = self;
  id v20 = v11;
  id v22 = v10;
  id v23 = v13;
  id v21 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (void)startForegroundDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BAAgentCore *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001DEC0;
  v15[3] = &unk_10005D208;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)pauseQueueWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E3DC;
  block[3] = &unk_10005D1B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)resumeQueueWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E55C;
  block[3] = &unk_10005D1B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)removeAppWithAppInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10001B51C;
  unsigned int v24 = sub_10001B52C;
  id v25 = 0;
  id v8 = [(BAAgentCore *)self workQueue];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10001E7AC;
  id v15 = &unk_10005D230;
  id v9 = v6;
  id v16 = v9;
  id v17 = self;
  id v18 = &v20;
  id v19 = &v26;
  dispatch_async_and_wait(v8, &v12);

  -[BAAgentCore invalidateExtensionWithAppInfo:](self, "invalidateExtensionWithAppInfo:", v9, v12, v13, v14, v15);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v10 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (void)cancelDownload:(id)a3 forClientIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BAAgentCore *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001EB10;
  v15[3] = &unk_10005D208;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(v11, v15);
}

- (id)downloadForIdentifier:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10001B51C;
  uint64_t v20 = sub_10001B52C;
  id v21 = 0;
  id v8 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ED60;
  block[3] = &unk_10005D258;
  id v15 = &v16;
  void block[4] = self;
  id v9 = v7;
  id v14 = v9;
  dispatch_sync(v8, block);

  id v10 = (void *)v17[5];
  if (v10)
  {
    id v11 = [v10 downloadWithUniqueIdentifier:v6];
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)downloadsForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10001B51C;
  uint64_t v16 = sub_10001B52C;
  id v17 = &__NSArray0__struct;
  id v5 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EF04;
  block[3] = &unk_10005D280;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_updateProcessMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F438;
  block[3] = &unk_10005C998;
  void block[4] = self;
  if (qword_1000695A0 != -1) {
    dispatch_once(&qword_1000695A0, block);
  }
  dispatch_queue_t v3 = +[NSMutableSet set];
  id v4 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v4);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = [(BAAgentCore *)self applicationState];
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v5);
        }
        [v3 addObject:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      id v6 = [v5 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  id v9 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  id v10 = [obj countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        uint64_t v14 = [v13 applicationIdentifier];
        id v29 = 0;
        id v15 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v14 allowPlaceholder:1 error:&v29];
        id v16 = v29;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v13 applicationIdentifier];
          uint64_t v18 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v17];

          [v9 addObject:v18];
          id v19 = [v13 extensionIdentity];
          uint64_t v20 = v19;
          if (v19)
          {
            id v21 = [v19 bundleIdentifier];
            uint64_t v22 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v21];

            [v9 addObject:v22];
          }
          else
          {
            uint64_t v22 = sub_100013ABC();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10003A420(v39, v13, &v40, v22);
            }
          }
        }
        else
        {
          uint64_t v18 = sub_100013ABC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v23 = [v13 applicationIdentifier];
            *(_DWORD *)buf = 138543618;
            v42 = v23;
            __int16 v43 = 2112;
            id v44 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Cannot observe app with identifier (%{public}@), because the app is not installed. %@", buf, 0x16u);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v10);
  }

  unsigned int v24 = (void *)qword_100069598;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001F5BC;
  v27[3] = &unk_10005D2D0;
  id v28 = v9;
  id v25 = v9;
  [v24 updateConfiguration:v27];
}

- (void)_processRunningBoardStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 bundle];
  if (v7)
  {
    id v8 = [v6 state];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 endowmentNamespaces];
      unsigned int v11 = [v10 containsObject:@"com.apple.frontboard.visibility"];

      switch([v9 taskState])
      {
        case 1u:
          uint64_t v12 = 1;
          break;
        case 2u:
        case 4u:
          if (v11) {
            uint64_t v12 = 5;
          }
          else {
            uint64_t v12 = 4;
          }
          break;
        case 3u:
          uint64_t v12 = 3;
          break;
        default:
          uint64_t v12 = 0;
          break;
      }
    }
    else
    {
      id v13 = [v6 exitEvent];
      uint64_t v14 = [v13 context];
      id v15 = [v14 status];
      id v16 = [v15 code];

      if (v16 != (id)3735943697)
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v12 = 2;
    }
    id v17 = [v7 identifier];
    id v32 = 0;
    uint64_t v18 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v17 allowPlaceholder:0 error:&v32];
    id v19 = v32;

    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v18 containingBundleRecord];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = [(BAAgentCore *)self workQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001F93C;
          block[3] = &unk_10005CC48;
          void block[4] = self;
          id v29 = v7;
          id v30 = v20;
          uint64_t v31 = v12;
          dispatch_async(v21, block);
        }
        else
        {
          unsigned int v24 = sub_100013B54();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_10003A524();
          }
        }
      }
      else
      {
        id v23 = [(BAAgentCore *)self workQueue];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10001F9B8;
        v25[3] = &unk_10005D2F8;
        v25[4] = self;
        id v26 = v7;
        uint64_t v27 = v12;
        dispatch_async(v23, v25);
      }
    }
    else
    {
      uint64_t v22 = sub_100013ABC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003A498();
      }
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (void)_updateStateForAppExtensionBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 state:(int64_t)a5
{
  id v6 = [(BAAgentCore *)self applicationInfoForIdentifier:a4];
  [v6 setApplicationExtensionState:a5];
}

- (void)_updateStateForAppBundleIdentifier:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(BAAgentCore *)self applicationInfoForIdentifier:v6];
  id v8 = [v7 applicationState];
  [v7 setApplicationState:a4];
  if (v8 != (id)a4)
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      if (a4 == 3)
      {
        if (v8)
        {
          unsigned int v11 = sub_100013ABC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 138543362;
            id v23 = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) is backgrounded.", (uint8_t *)&v22, 0xCu);
          }

          unsigned int v12 = [v7 allowsBackgroundActivity];
          id v13 = [(BAAgentCore *)self _downloadQueueForIdentifier:v6 create:0 error:0];
          uint64_t v14 = [v13 allDownloads];
          id v15 = [v14 count];

          if (v12)
          {
            if (v15)
            {
              id v16 = sub_100013ABC();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                int v22 = 138543362;
                id v23 = v6;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) allows BG activity, pausing any foreground downloads for background demotion.", (uint8_t *)&v22, 0xCu);
              }

              [v13 demoteAllForegroundDownloads];
            }
            goto LABEL_35;
          }
          if (!v15)
          {
LABEL_35:

            goto LABEL_36;
          }
          id v21 = sub_100013ABC();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
LABEL_34:

            [v13 cancelAllDownloads];
            goto LABEL_35;
          }
          int v22 = 138543362;
          id v23 = v6;
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) does NOT allow BG activity, canceling all active downloads.", (uint8_t *)&v22, 0xCu);
          goto LABEL_34;
        }
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        id v17 = sub_100013ABC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v18 = @"NO";
          if (a4 == 5) {
            CFStringRef v18 = @"YES";
          }
          int v22 = 138543618;
          id v23 = v6;
          __int16 v24 = 2114;
          CFStringRef v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) is active. (Foreground = %{public}@)", (uint8_t *)&v22, 0x16u);
        }

        [(BAAgentCore *)self __handleApplicationLaunchedWithInfo:v7];
      }
    }
    else if (v8)
    {
      id v9 = sub_100013ABC();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (a4 == 2)
      {
        if (v10)
        {
          int v22 = 138543362;
          id v23 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) was quit by the user.", (uint8_t *)&v22, 0xCu);
        }

        [v7 setUserForceQuitApp:1];
      }
      else
      {
        if (v10)
        {
          int v22 = 138543362;
          id v23 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) has terminated.", (uint8_t *)&v22, 0xCu);
        }
      }
      id v13 = [(BAAgentCore *)self _downloadQueueForIdentifier:v6 create:0 error:0];
      id v19 = [v13 allDownloads];
      id v20 = [v19 count];

      if (!v20 || ([v7 allowsBackgroundActivity] & 1) != 0) {
        goto LABEL_35;
      }
      id v21 = sub_100013ABC();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v22 = 138543362;
      id v23 = v6;
      goto LABEL_33;
    }
  }
LABEL_36:
}

- (void)handleApplicationLaunched:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FEE8;
  v7[3] = &unk_10005CA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)__handleApplicationLaunchedWithInfo:(id)a3
{
  [a3 applicationLaunched];

  [(BAAgentCore *)self _serializeApplicationState];
}

- (void)_pokeScheduler
{
  dispatch_queue_t v3 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v31 = (void *)os_transaction_create();
  [(BAAgentCore *)self _scheduleDownloads];
  id v4 = [(BAAgentCore *)self unhandledDownloadEvents];
  long long v34 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [(BAAgentCore *)self unhandledDownloadEvents];
  id v5 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v35 = *(void *)v45;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v9 = [v8 download];
        BOOL v10 = [v9 applicationIdentifier];
        unsigned int v11 = [(BAAgentCore *)self _connectionsForApplicationIdentifier:v10];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v41;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([*(id *)(*((void *)&v40 + 1) + 8 * (void)j) isActive])
              {
                char v17 = 1;
                goto LABEL_16;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
        char v17 = 0;
LABEL_16:

        CFStringRef v18 = [(BAAgentCore *)self applicationInfoIfExistsForIdentifier:v10];
        if (([v18 receivedInstalledNotification] & 1) != 0
          || ([v18 receivedInstallingNotification] & 1) == 0)
        {
          if ((v17 & 1) != 0
            || ([(BAAgentCore *)self _downloaderExtensionForApplicationIdentifier:v10 cacheOnly:0], id v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
          {
            [v34 addObject:v8];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v6);
  }

  id obja = [v34 count];
  if (obja)
  {
    id v20 = [(BAAgentCore *)self unhandledDownloadEvents];
    [v20 removeObjectsInArray:v34];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v34;
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v36 + 1) + 8 * (void)k);
        if ([v26 type] == (id)1)
        {
          uint64_t v27 = [v26 download];
          id v28 = [v26 download];
          id v30 = sub_1000333F4(v28, v29);
          [(BAAgentCore *)self download:v27 finishedWithFileURL:v30];

LABEL_34:
          goto LABEL_37;
        }
        if ([v26 type] == (id)2)
        {
          uint64_t v27 = [v26 download];
          id v28 = [v26 eventError];
          [(BAAgentCore *)self download:v27 failedWithError:v28];
          goto LABEL_34;
        }
        uint64_t v27 = sub_100013ABC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Dropping unknown unhandled event type in list: %{public}@", buf, 0xCu);
        }
LABEL_37:
      }
      id v23 = [v21 countByEnumeratingWithState:&v36 objects:v50 count:16];
    }
    while (v23);
  }

  if (obja) {
    [(BAAgentCore *)self _serializeUndeliveredEvents];
  }
}

- (void)_scheduleDownloads
{
  dispatch_queue_t v3 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  id v5 = [v4 count];

  if (!v5) {
    return;
  }
  id v22 = (void *)os_transaction_create();
  unint64_t v6 = [(BAAgentCore *)self _downloadsInProgress];
  if (v6 >= 0x32)
  {
    uint64_t v7 = sub_100013ABC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v30 = v6;
      __int16 v31 = 2048;
      uint64_t v32 = 50;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Daemon has reached maximum active download limit. (Active Downloads: %lu, Daemon Limit: %lu)", buf, 0x16u);
    }
    goto LABEL_23;
  }
  id v8 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  id v9 = [v8 allValues];
  id v23 = [v9 sortedArrayUsingComparator:&stru_10005D338];

  uint64_t v10 = 0;
  while (2)
  {
    uint64_t v24 = v10;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = v23;
    id v11 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (!v11)
    {
LABEL_22:

      break;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
      if ((uint64_t)[v15 numberOfWaitingDownloads] < 1) {
        goto LABEL_17;
      }
      id v16 = [v15 numberOfActiveDownloads];
      if ((unint64_t)v16 >= 0x19)
      {
        uint64_t v17 = (uint64_t)v16;
        CFStringRef v18 = sub_100013ABC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v15 identifier];
          *(_DWORD *)buf = 138543874;
          unint64_t v30 = (unint64_t)v19;
          __int16 v31 = 2048;
          uint64_t v32 = v17;
          __int16 v33 = 2048;
          uint64_t v34 = 25;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@ has reached its limit. (Active Downloads: %lu, Queue Limit: %lu)", buf, 0x20u);
        }
        goto LABEL_17;
      }
      unsigned __int8 v21 = [v15 startNextDownload];
      if (v21) {
        break;
      }
LABEL_17:
      if (v12 == (id)++v14)
      {
        id v12 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (v12) {
          goto LABEL_8;
        }
        goto LABEL_22;
      }
    }
    uint64_t v10 = v24 + 1;

    if (v24 + 1 < (uint64_t)(50 - v6)) {
      continue;
    }
    break;
  }
LABEL_23:
}

- (void)downloadDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationIdentifier];
  unint64_t v6 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000208B4;
  v10[3] = &unk_10005D050;
  id v11 = v4;
  id v12 = self;
  id v13 = v5;
  id v14 = (id)os_transaction_create();
  id v7 = v14;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (void)downloadDidPause:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationIdentifier];
  unint64_t v6 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100020D7C;
  v10[3] = &unk_10005D050;
  id v11 = v4;
  id v12 = self;
  id v13 = v5;
  id v14 = (id)os_transaction_create();
  id v7 = v14;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 applicationIdentifier];
  id v12 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v11];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000212A0;
  v18[3] = &unk_10005D3B0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v8;
  id v21 = v9;
  id v22 = (id)os_transaction_create();
  id v23 = v10;
  id v13 = v10;
  id v14 = v22;
  id v15 = v9;
  id v16 = v8;
  id v17 = v11;
  dispatch_async(v12, v18);
}

- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10 = a3;
  id v11 = [v10 applicationIdentifier];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10001B51C;
  v28[4] = sub_10001B52C;
  id v29 = 0;
  id v12 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021CD4;
  block[3] = &unk_10005D258;
  long long v27 = v28;
  void block[4] = self;
  id v13 = v11;
  id v26 = v13;
  dispatch_async_and_wait(v12, block);

  id v14 = (void *)os_transaction_create();
  id v15 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v13];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100021D24;
  v18[3] = &unk_10005D3D8;
  id v21 = v28;
  int64_t v22 = a4;
  int64_t v23 = a5;
  int64_t v24 = a6;
  id v19 = v10;
  id v20 = v14;
  id v16 = v14;
  id v17 = v10;
  dispatch_async(v15, v18);

  _Block_object_dispose(v28, 8);
}

- (void)download:(id)a3 failedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAAgentCore *)self telemetryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022108;
  block[3] = &unk_10005CE30;
  void block[4] = self;
  id v9 = v6;
  id v35 = v9;
  id v10 = v7;
  id v36 = v10;
  dispatch_async(v8, block);

  id v11 = [v9 applicationIdentifier];
  id v12 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v11];
  id v13 = [(BAAgentCore *)self applicationInfoForIdentifier:v11];
  id v14 = (void *)os_transaction_create();
  if ([v13 receivedInstallingNotification]
    && ([v13 receivedInstalledNotification] & 1) == 0)
  {
    CFStringRef v18 = [[BAUnhandledDownloadEvent alloc] initWithEventType:2 download:v9 error:v10];
    id v19 = [(BAAgentCore *)self workQueue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100022118;
    v29[3] = &unk_10005D050;
    id v30 = v11;
    __int16 v31 = v18;
    uint64_t v32 = self;
    id v33 = v14;
    id v20 = v14;
    id v17 = v18;
    id v21 = v11;
    dispatch_async(v19, v29);
  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000221F8;
    v22[3] = &unk_10005CC70;
    int64_t v23 = (BAUnhandledDownloadEvent *)v9;
    id v24 = v10;
    long long v25 = self;
    id v26 = v11;
    id v27 = v14;
    id v28 = v13;
    id v15 = v14;
    id v16 = v11;
    dispatch_async(v12, v22);

    id v17 = v23;
  }
}

- (void)download:(id)a3 finishedWithFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10003A7D8();
    }
    qword_1000694C8 = (uint64_t)"BUG IN BackgroundAssets: BAAgentCore received a finished file that was a BAManifestDownlo"
                               "ad. This is invalid.";
    __break(1u);
  }
  else
  {
    id v8 = [(BAAgentCore *)self telemetryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022ED4;
    block[3] = &unk_10005CA10;
    void block[4] = self;
    id v9 = v6;
    id v32 = v9;
    dispatch_async(v8, block);

    id v10 = (void *)os_transaction_create();
    id v11 = [v9 applicationIdentifier];
    id v12 = [(BAAgentCore *)self applicationInfoForIdentifier:v11];

    if ([(BAUnhandledDownloadEvent *)v12 receivedInstallingNotification]
      && ([(BAUnhandledDownloadEvent *)v12 receivedInstalledNotification] & 1) == 0)
    {
      id v19 = [[BAUnhandledDownloadEvent alloc] initWithEventType:1 download:v9 error:0];
      id v20 = [(BAAgentCore *)self workQueue];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100022EE4;
      v26[3] = &unk_10005D050;
      id v15 = (id *)&v27;
      id v27 = v12;
      id v28 = v19;
      id v29 = self;
      id v30 = v10;
      id v21 = v10;
      id v17 = v19;
      id v14 = v12;
      dispatch_async(v20, v26);

      CFStringRef v18 = v28;
    }
    else
    {
      id v13 = [(BAUnhandledDownloadEvent *)v12 applicationIdentifier];
      id v14 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v13];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100022FE0;
      v22[3] = &unk_10005D050;
      id v15 = (id *)v23;
      v23[0] = v9;
      v23[1] = self;
      id v24 = v12;
      id v25 = v10;
      id v16 = v10;
      id v17 = v12;
      dispatch_async(v14, v22);

      CFStringRef v18 = v24;
    }
  }
}

- (id)_essentialAssetsProgressDescriptorWithAppInfo:(id)a3 essentialAssetState:(int64_t)a4 sizeDownloaded:(int64_t)a5 totalDownloadSize:(int64_t)a6
{
  id v9 = a3;
  id v10 = v9;
  switch(a4)
  {
    case 1:
      a5 = -1;
      uint64_t v11 = 2;
      goto LABEL_4;
    case 2:
      a6 = (int64_t)[v9 essentialAssetDownloadAllowance];
      id v12 = [v10 optionalAssetDownloadAllowance];
      if ((unint64_t)v12 > a6) {
        a6 = (int64_t)v12;
      }
      uint64_t v11 = 3;
      break;
    case 3:
      a6 = -1;
      uint64_t v11 = 4;
      break;
    case 4:
      uint64_t v11 = 5;
      break;
    case 5:
      uint64_t v11 = 6;
      break;
    default:
      a5 = -1;
      uint64_t v11 = 1;
LABEL_4:
      a6 = -1;
      break;
  }
  id v13 = sub_10000C64C([BAAppStoreProgressInfoDescriptor alloc], v11, a5, a6);

  return v13;
}

- (id)essentialAssetsProgressDescriptorWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10001B51C;
  id v16 = sub_10001B52C;
  id v17 = 0;
  id v5 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024214;
  block[3] = &unk_10005D280;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)downloadQueue:(id)a3 manifest:(id)a4 finishedWithFileURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifier];
  id v10 = [(BAAgentCore *)self applicationInfoForIdentifier:v9];

  uint64_t v11 = [v7 identifier];
  uint64_t v12 = [(BAAgentCore *)self _connectionReplyQueueForIdentifier:v11];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100024480;
  v18[3] = &unk_10005CC70;
  id v19 = v8;
  id v20 = v7;
  id v21 = self;
  id v22 = (id)os_transaction_create();
  id v23 = v10;
  id v24 = v12;
  id v13 = v12;
  id v14 = v10;
  id v15 = v22;
  id v16 = v7;
  id v17 = v8;
  dispatch_async(v13, v18);
}

- (void)downloadQueue:(id)a3 essentialAssetState:(int64_t)a4 bytesWritten:(int64_t)a5 totalBytes:(int64_t)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)os_transaction_create();
  uint64_t v12 = [(BAAgentCore *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100025534;
  v15[3] = &unk_10005D590;
  v15[4] = self;
  id v16 = v10;
  int64_t v19 = a5;
  int64_t v20 = a6;
  id v17 = v11;
  int64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

- (BOOL)downloadQueue:(id)a3 permittedToStartDownloadsWithNecessity:(int64_t)a4
{
  id v6 = [a3 identifier];
  id v7 = [(BAAgentCore *)self applicationInfoIfExistsForIdentifier:v6];

  if (v7 && ([v7 awaitingNetworkConsent] & 1) == 0)
  {
    if (([v7 receivedInstallingNotification] & 1) != 0
      || [v7 receivedInstalledNotification])
    {
      if (a4 == 1) {
        unsigned __int8 v9 = [v7 receivedInstallingNotification];
      }
      else {
        unsigned __int8 v9 = [v7 receivedInstalledNotification];
      }
      BOOL v8 = v9;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setContentRequestTelemetry:(id)a3 forDownloads:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(BAAgentCore *)self telemetryQueue];
  dispatch_assert_queue_V2(v8);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        id v15 = [(BAAgentCore *)self telemetryByDownloadUniqueIdentifier];
        id v16 = [v14 uniqueIdentifier];
        [v15 setObject:v6 forKey:v16];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)updateContentRequestTelemetryForCompletedDownload:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(BAAgentCore *)self telemetryQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(BAAgentCore *)self telemetryByDownloadUniqueIdentifier];
  id v9 = [v13 uniqueIdentifier];
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    [v10 recordDownloadCompletion:v13 error:v6];
    if ([v10 allDownloadsCompleted]) {
      +[BATelemetrySender sendContentRequestTelemetryEvent:v10];
    }
    id v11 = [(BAAgentCore *)self telemetryByDownloadUniqueIdentifier];
    uint64_t v12 = [v13 uniqueIdentifier];
    [v11 removeObjectForKey:v12];
  }
}

- (void)downloadTimeValidityDidChange
{
  dispatch_queue_t v3 = [(BAAgentCore *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025A9C;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)doPeriodicUpdateCheck
{
  dispatch_queue_t v3 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v3);
  id v4 = [(BAAgentCore *)self applicationState];
  id v5 = [v4 copy];

  objc_sync_exit(v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldDoPeriodicCheck", (void)v12))
        {
          id v11 = [v10 applicationIdentifier];
          [(BAAgentCore *)self handleApplicationEvent:7 identifier:v11 bundleURLPath:0 userInitiated:0];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)_checkIdentifierHasExtension:(id)a3
{
  id v3 = a3;
  id v26 = 0;
  id v4 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v26];
  id v5 = v26;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 applicationExtensionRecords];
      if ([v6 count])
      {
        id v20 = v5;
        id v21 = v3;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) extensionPointRecord:v20];
              long long v13 = [v12 identifier];
              unsigned __int8 v14 = [v13 isEqualToString:@"com.apple.background-asset-downloader-extension"];

              if (v14)
              {
                unsigned __int8 v15 = 1;
                goto LABEL_27;
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v7 = sub_100013ABC();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v3 = v21;
          id v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bundle for %{public}@ does not have a downloader extension. Blocking.", buf, 0xCu);
          unsigned __int8 v15 = 0;
        }
        else
        {
          unsigned __int8 v15 = 0;
LABEL_27:
          id v3 = v21;
        }
        id v5 = v20;
      }
      else
      {
        id v7 = sub_100013ABC();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v3;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bundle for %{public}@ does not have a extension record. Blocking.", buf, 0xCu);
        }
        unsigned __int8 v15 = 0;
      }
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 extensionPointRecord];
      id v7 = [v6 identifier];
      unsigned __int8 v15 = [v7 isEqualToString:@"com.apple.background-asset-downloader-extension"];
LABEL_29:

      goto LABEL_30;
    }
    id v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v3;
      id v16 = "Bundle for %{public}@ is not application or extension. Blocking.";
      long long v17 = v6;
      uint32_t v18 = 12;
      goto LABEL_20;
    }
  }
  else
  {
    id v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = v3;
      __int16 v30 = 2114;
      id v31 = v5;
      id v16 = "Failed to get bundle record for identifier: %{public}@ error: %{public}@";
      long long v17 = v6;
      uint32_t v18 = 22;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
  unsigned __int8 v15 = 0;
LABEL_30:

  return v15;
}

- (BOOL)_checkConnection:(id)a3 hasAllowedTeamIDForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(BAAgentCore *)self applicationInfoForIdentifier:a4];
  id v8 = [v6 valueForEntitlement:off_1000692F0[0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v7 applicationTeamIdentifier];

    if (v9)
    {
      uint64_t v10 = [v7 applicationTeamIdentifier];
      unsigned __int8 v11 = [v10 isEqualToString:v8];
    }
    else
    {
      [v7 setApplicationTeamIdentifier:v8];
      [(BAAgentCore *)self _serializeApplicationState];
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_setClearBeforeShutdown
{
}

- (void)_clearState
{
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:0];

  if (v3)
  {
    id v4 = [v3 URLByAppendingPathComponent:off_1000692E8[0]];
    id v5 = [v4 URLByAppendingPathComponent:@"ApplicationState.bin"];
    id v6 = [v4 URLByAppendingPathComponent:@"DownloadQueues.bin"];
    id v7 = [v4 URLByAppendingPathComponent:@"UndeliveredEvents.bin"];
    id v8 = +[NSFileManager defaultManager];
    [v8 removeItemAtURL:v5 error:0];

    id v9 = +[NSFileManager defaultManager];
    [v9 removeItemAtURL:v6 error:0];

    uint64_t v10 = +[NSFileManager defaultManager];
    [v10 removeItemAtURL:v7 error:0];
  }
  if (!+[BAApplicationConfigurationOverrides clearAllOverrides])
  {
    unsigned __int8 v11 = sub_100013ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003ABCC(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)_debugShutdown
{
  id v3 = sub_100013ABC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Debug shutdown called. Preparing to exit", v4, 2u);
  }

  [(BAAgentCore *)self _shutdownAgent];
}

- (void)_printDebugState
{
  id v3 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026400;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)_systemConnections
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BAAgentCore *)self connections];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)invalidateExtensionWithAppInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [v4 applicationIdentifier];
  uint64_t v7 = [(BAAgentCore *)self downloaderExtensionForApplicationIdentifier:v6 cacheOnly:1];
  id v8 = v7;
  if (v7)
  {
    [v7 extensionWillTerminate];
    [v8 invalidate];
    [(BAAgentCore *)self extensionDisconnectedWithIdentifier:v6 connectionProxy:v8];
  }
  uint64_t v9 = [v4 extensionIdentity];
  uint64_t v10 = v9;
  long long v11 = &off_100046000;
  if (v9)
  {
    long long v12 = [v9 bundleIdentifier];
    long long v13 = [[BATerminationAssertion alloc] initWithBundleIdentifier:v12];
    long long v14 = sub_100013ABC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Acquiring termination assertion for extension: %{public}@", buf, 0xCu);
    }

    id v34 = 0;
    unsigned __int8 v15 = [(BATerminationAssertion *)v13 acquireAssertionSync:&v34];
    id v25 = v34;
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = sub_100013ABC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003AC04();
      }
    }
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.BackgroundAssets.launch_removal_queue", v18);

    id v20 = v12;
    [v20 UTF8String];
    id v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    __int16 v30 = sub_1000272CC;
    id v31 = &unk_10005D5B8;
    id v32 = v20;
    dispatch_semaphore_t v33 = v17;
    id v21 = v17;
    id v22 = v20;
    launch_remove_external_service();
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    [(BATerminationAssertion *)v13 invalidate];

    long long v11 = &off_100046000;
  }
  long long v23 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v11 + 408);
  block[2] = sub_1000273B4;
  block[3] = &unk_10005CA10;
  void block[4] = self;
  id v27 = v6;
  id v24 = v6;
  dispatch_async(v23, block);
}

- (id)_connectionsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableArray arrayWithCapacity:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(BAAgentCore *)self connections];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [v12 applicationBundleIdentifier];
          unsigned int v14 = [v13 isEqual:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v6 sortUsingComparator:&stru_10005D5F8];

  return v6;
}

- (void)_pauseDownloads
{
  v2 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  id v3 = [v2 allValues];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) pauseAllDownloads:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_deserializeState
{
  id v3 = (id)os_transaction_create();
  [(BAAgentCore *)self _deserializeApplicationList];
  [(BAAgentCore *)self _deserializeDownloadQueues];
  [(BAAgentCore *)self _deserializeUndeliveredEvents];
}

- (void)_deserializeApplicationList
{
  id v35 = +[BAApplicationInfo extensionContainingApplicationList];
  v2 = +[NSFileManager defaultManager];
  id v57 = 0;
  long long v37 = [v2 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v57];
  id v3 = v57;

  id v36 = [v37 URLByAppendingPathComponent:off_1000692E8[0]];
  long long v38 = [v36 URLByAppendingPathComponent:@"ApplicationState.bin"];
  if (!v38)
  {
    id v26 = sub_100013ABC();
    id v27 = v26;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    sub_10003ACD4();
LABEL_36:
    id v27 = v26;
    goto LABEL_41;
  }
  uint64_t v34 = +[NSMutableData dataWithContentsOfURL:](NSMutableData, "dataWithContentsOfURL:");
  if (!v34)
  {
    id v26 = sub_100013ABC();
    id v27 = v26;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    sub_10003AD3C();
    goto LABEL_36;
  }
  id v56 = v3;
  id v33 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v34 error:&v56];
  id v31 = v56;

  [v33 setDecodingFailurePolicy:1];
  id v4 = +[BAApplicationInfo classesForSerialization];
  long long v41 = [v33 decodeObjectOfClasses:v4 forKey:@"Application State"];

  id obj = [(BAAgentCore *)self applicationState];
  objc_sync_enter(obj);
  id v5 = [(BAAgentCore *)self applicationState];
  [v5 removeAllObjects];

  if (v41)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v39 = v35;
    id v6 = [v39 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v6)
    {
      uint64_t v40 = *(void *)v53;
      do
      {
        id v42 = v6;
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v53 != v40) {
            objc_enumerationMutation(v39);
          }
          id v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v9 = v41;
          id v10 = [v9 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v49;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v49 != v11) {
                  objc_enumerationMutation(v9);
                }
                long long v13 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
                unsigned int v14 = [v8 applicationIdentifier];
                unsigned __int8 v15 = [v13 applicationIdentifier];
                unsigned int v16 = [v14 isEqualToString:v15];

                if (v16)
                {
                  long long v17 = [(BAAgentCore *)self applicationState];
                  [v17 addObject:v13];

                  goto LABEL_19;
                }
              }
              id v10 = [v9 countByEnumeratingWithState:&v48 objects:v60 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          id v9 = [(BAAgentCore *)self applicationState];
          [v9 addObject:v8];
LABEL_19:
        }
        id v6 = [v39 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v6);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v18 = v41;
    id v19 = [v18 countByEnumeratingWithState:&v44 objects:v59 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v45;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v44 + 1) + 8 * (void)k);
          if (([v22 receivedInstallingNotification] & 1) == 0)
          {
            long long v23 = [(BAAgentCore *)self applicationState];
            unsigned __int8 v24 = [v23 containsObject:v22];

            if ((v24 & 1) == 0)
            {
              id v25 = [(BAAgentCore *)self applicationState];
              [v25 addObject:v22];
            }
          }
        }
        id v19 = [v18 countByEnumeratingWithState:&v44 objects:v59 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v28 = sub_100013ABC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [v33 error];
      sub_10003ADA4(v29, (uint64_t)v58, v28);
    }

    id v18 = [(BAAgentCore *)self applicationState];
    id v30 = [v35 mutableCopy];
    [v18 addObjectsFromArray:v30];
  }
  objc_sync_exit(obj);

  [(BAAgentCore *)self _updateProcessMonitor];
  id v3 = v31;
  id v27 = (void *)v34;
LABEL_41:
}

- (void)_deserializeDownloadQueues
{
  id v3 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  [v3 removeAllObjects];

  id v4 = +[NSFileManager defaultManager];
  id v28 = 0;
  id v5 = [v4 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v28];
  id v6 = v28;

  uint64_t v7 = [v5 URLByAppendingPathComponent:off_1000692E8[0]];
  id v8 = [v7 URLByAppendingPathComponent:@"DownloadQueues.bin"];
  if (v8)
  {
    uint64_t v9 = +[NSMutableData dataWithContentsOfURL:v8];
    if (v9)
    {
      id v10 = v9;
      id v27 = v6;
      id v11 = [[BAAgentKeyedUnarchiver alloc] initForReadingFromData:v9 error:&v27];
      id v12 = v27;

      [v11 setAgentCore:self];
      [v11 setDecodingFailurePolicy:1];
      long long v13 = +[BADownloadQueue classesForSerialization];
      unsigned int v14 = [v11 decodeObjectOfClasses:v13 forKey:@"Queues"];

      if (v14)
      {
        id v21 = v12;
        id v22 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        unsigned __int8 v15 = [v14 allValues];
        id v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v23 + 1) + 8 * i) setDelegate:self];
            }
            id v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
          }
          while (v17);
        }

        uint64_t v20 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
        [v20 addEntriesFromDictionary:v14];
        id v12 = v21;
        id v5 = v22;
      }
      else
      {
        uint64_t v20 = sub_100013ABC();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10003AEC4(v11, v20);
        }
      }

      id v6 = v12;
    }
    else
    {
      id v10 = sub_100013ABC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003AE5C();
      }
    }
  }
  else
  {
    id v10 = sub_100013ABC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003ADF4();
    }
  }
}

- (void)_deserializeUndeliveredEvents
{
  id v3 = [(BAAgentCore *)self unhandledDownloadEvents];
  [v3 removeAllObjects];

  id v4 = +[NSFileManager defaultManager];
  id v19 = 0;
  id v5 = [v4 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v19];
  id v6 = v19;

  uint64_t v7 = [v5 URLByAppendingPathComponent:off_1000692E8[0]];
  id v8 = [v7 URLByAppendingPathComponent:@"UndeliveredEvents.bin"];
  if (v8)
  {
    uint64_t v9 = +[NSMutableData dataWithContentsOfURL:v8];
    if (v9)
    {
      id v10 = v9;
      id v18 = v6;
      id v11 = [[BAAgentKeyedUnarchiver alloc] initForReadingFromData:v9 error:&v18];
      id v12 = v18;

      [v11 setAgentCore:self];
      [v11 setDecodingFailurePolicy:1];
      long long v13 = +[NSSet setWithObject:objc_opt_class()];
      unsigned int v14 = +[BAUnhandledDownloadEvent classesForSerialization];
      unsigned __int8 v15 = [v13 setByAddingObjectsFromSet:v14];

      id v16 = [v11 decodeObjectOfClasses:v15 forKey:@"Undelivered Events"];
      if (v16)
      {
        id v17 = [(BAAgentCore *)self unhandledDownloadEvents];
        [v17 addObjectsFromArray:v16];
      }
      else
      {
        id v17 = sub_100013ABC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10003B020(v11, v17);
        }
      }

      id v6 = v12;
    }
    else
    {
      id v10 = sub_100013ABC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003AFB8();
      }
    }
  }
  else
  {
    id v10 = sub_100013ABC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003AF50();
    }
  }
}

- (void)_serializeState
{
  id v3 = (id)os_transaction_create();
  [(BAAgentCore *)self _serializeApplicationState];
  [(BAAgentCore *)self _serializeDownloadQueues];
  [(BAAgentCore *)self _serializeUndeliveredEvents];
}

- (void)_serializeDownloadQueues
{
  id v3 = (void *)os_transaction_create();
  id v4 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];

  if (v4)
  {
    id v5 = [[BAAgentKeyedArchiver alloc] initRequiringSecureCoding:1];
    id v6 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
    [v5 encodeObject:v6 forKey:@"Queues"];

    uint64_t v7 = +[NSFileManager defaultManager];
    id v20 = 0;
    id v8 = [v7 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v20];
    id v9 = v20;

    id v10 = [v8 URLByAppendingPathComponent:off_1000692E8[0]];
    id v11 = +[NSFileManager defaultManager];
    id v19 = v9;
    [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v12 = v19;

    long long v13 = [v10 URLByAppendingPathComponent:@"DownloadQueues.bin"];
    unsigned int v14 = [v5 encodedData];
    id v18 = v12;
    unsigned __int8 v15 = [v14 writeToURL:v13 options:1 error:&v18];
    id v16 = v18;

    if ((v15 & 1) == 0)
    {
      id v17 = sub_100013ABC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003B0AC();
      }
    }
    id v3 = 0;
  }
}

- (void)_serializeApplicationState
{
  id v3 = (void *)os_transaction_create();
  id v4 = [[BAAgentKeyedArchiver alloc] initRequiringSecureCoding:1];
  id v5 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v5);
  id v6 = [(BAAgentCore *)self applicationState];

  if (v6)
  {
    uint64_t v7 = [(BAAgentCore *)self applicationState];
    [v4 encodeObject:v7 forKey:@"Application State"];

    objc_sync_exit(v5);
    id v8 = +[NSFileManager defaultManager];
    id v21 = 0;
    id v9 = [v8 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v21];
    id v10 = v21;

    id v11 = [v9 URLByAppendingPathComponent:off_1000692E8[0]];
    id v12 = +[NSFileManager defaultManager];
    id v20 = v10;
    [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v13 = v20;

    unsigned int v14 = [v11 URLByAppendingPathComponent:@"ApplicationState.bin"];
    unsigned __int8 v15 = [v4 encodedData];
    id v19 = v13;
    unsigned __int8 v16 = [v15 writeToURL:v14 options:1 error:&v19];
    id v17 = v19;

    if ((v16 & 1) == 0)
    {
      id v18 = sub_100013ABC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B114();
      }
    }
  }
  else
  {

    objc_sync_exit(v5);
  }
}

- (void)_serializeUndeliveredEvents
{
  id v3 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v19 = (id)os_transaction_create();
  id v4 = [(BAAgentCore *)self unhandledDownloadEvents];

  if (v4)
  {
    id v6 = [[BAAgentKeyedArchiver alloc] initRequiringSecureCoding:1];
    uint64_t v7 = [(BAAgentCore *)self unhandledDownloadEvents];
    [v6 encodeObject:v7 forKey:@"Undelivered Events"];

    id v8 = +[NSFileManager defaultManager];
    id v22 = 0;
    id v9 = [v8 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v22];
    id v10 = v22;

    id v11 = [v9 URLByAppendingPathComponent:off_1000692E8[0]];
    id v12 = +[NSFileManager defaultManager];
    id v21 = v10;
    [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v13 = v21;

    unsigned int v14 = [v11 URLByAppendingPathComponent:@"UndeliveredEvents.bin"];
    unsigned __int8 v15 = [v6 encodedData];
    id v20 = v13;
    unsigned __int8 v16 = [v15 writeToURL:v14 options:1 error:&v20];
    id v17 = v20;

    if ((v16 & 1) == 0)
    {
      id v18 = sub_100013ABC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B114();
      }
    }
  }
  else
  {
  }
}

- (void)_asyncAwaitLockdownClientMessage:(_lockdown_connection *)a3 waitQueue:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028AD0;
  block[3] = &unk_10005D2F8;
  id v8 = a4;
  id v9 = a3;
  void block[4] = self;
  id v6 = v8;
  dispatch_async(v6, block);
}

- (void)_processLockdownClientMessage:(id)a3 withConnection:(_lockdown_connection *)a4 withQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch((unint64_t)[v8 messageOperation])
  {
    case 1uLL:
      id v10 = [v8 messageVersion];
      id v11 = [BADeveloperDebugServerMessageVersionCheck alloc];
      if ((unint64_t)v10 < 2)
      {
        uint64_t v13 = 1;
        CFStringRef v12 = 0;
      }
      else
      {
        CFStringRef v12 = @"The tool being used to debug Background Assets is newer and unsupported on the connected device's OS version.";
        uint64_t v13 = 0;
      }
      id v28 = [(BADeveloperDebugServerMessageVersionCheck *)v11 initWithVersionAllowed:v13 failureExplanation:v12];
      unsigned int v14 = v28;
      if (!v28) {
        goto LABEL_14;
      }
      id v30 = 0;
      id v18 = [(BADeveloperDebugMessage *)v28 archivedRepresentationWithError:&v30];
      id v16 = v30;
      if (v18)
      {
        if (!lockdown_send_message()) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v29 = sub_100013ABC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10003B17C();
        }
      }
      lockdown_disconnect();

      goto LABEL_25;
    case 2uLL:
      unsigned int v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      unsigned __int8 v15 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
      id v16 = +[BAAppStorePrepareDescriptor descriptorWithAppBundleIdentifier:v15 appStoreMetadata:&__NSDictionary0__struct client:3];

      [v16 setCellularPolicy:3];
      id v17 = [v16 appBundleIdentifier];
      id v18 = [(BAAgentCore *)self applicationInfoForIdentifier:v17];

      [v18 applicationPrepareWithDescriptor:v16];
      [v18 resetExtensionRuntime];
      id v19 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
      id v20 = self;
      uint64_t v21 = 1;
      goto LABEL_9;
    case 3uLL:
      unsigned int v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      id v22 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
      id v16 = +[BAAppStorePrepareDescriptor descriptorWithAppBundleIdentifier:v22 appStoreMetadata:&__NSDictionary0__struct client:3];

      [v16 setCellularPolicy:3];
      long long v23 = [v16 appBundleIdentifier];
      id v18 = [(BAAgentCore *)self applicationInfoForIdentifier:v23];

      [v18 applicationPrepareWithDescriptor:v16];
      [v18 resetExtensionRuntime];
      id v19 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
      id v20 = self;
      uint64_t v21 = 2;
LABEL_9:
      [(BAAgentCore *)v20 handleApplicationEvent:v21 identifier:v19 bundleURLPath:0 userInitiated:1];

      long long v24 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
      [(BAAgentCore *)self handleApplicationEvent:6 identifier:v24 bundleURLPath:0 userInitiated:1];

LABEL_10:
      goto LABEL_13;
    case 4uLL:
      unsigned int v14 = (BADeveloperDebugServerMessageVersionCheck *)v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
        long long v26 = [(BAAgentCore *)self applicationInfoForIdentifier:v25];

        [v26 resetExtensionRuntime];
        id v27 = [(BADeveloperDebugServerMessageVersionCheck *)v14 appBundleIdentifier];
        [(BAAgentCore *)self handleApplicationEvent:7 identifier:v27 bundleURLPath:0 userInitiated:1];

LABEL_13:
LABEL_14:
        [(BAAgentCore *)self _asyncAwaitLockdownClientMessage:a4 waitQueue:v9];
      }
      else
      {
LABEL_15:
        lockdown_disconnect();
LABEL_25:
      }
      return;
    default:
      lockdown_disconnect();
      goto LABEL_14;
  }
}

- (void)_shutdownAgent
{
  id v3 = sub_100013ABC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Serializing state and shutting down.", buf, 2u);
  }

  id v4 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000290CC;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_sync(v4, block);

  if ([(BAAgentCore *)self debugClearState])
  {
    id v5 = sub_100013ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clear state set, will clear state..", buf, 2u);
    }

    [(BAAgentCore *)self _clearState];
  }
  exit(0);
}

- (void)_debugDownloadTime:(BOOL)a3 clear:(BOOL)a4
{
  if (a3) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (a4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [(BAAgentCore *)self rulesEngine];
  [v6 setDebugValidityTimeOverride:v5];
}

- (void)_backgroundActivityStateDidChange
{
  id v3 = [(BAAgentCore *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000291BC;
  block[3] = &unk_10005C998;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)_connectionReplyQueueForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BAAgentCore *)self connections];
  objc_sync_enter(v5);
  id v6 = [(BAAgentCore *)self connectionReplyQueue];
  uint64_t v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    id v8 = +[NSString stringWithFormat:@"com.apple.backgroundassets.%@.reply", v4];
    uint64_t v7 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    id v9 = [(BAAgentCore *)self connectionReplyQueue];
    [v9 setObject:v7 forKey:v4];
  }
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)_applicationIdentifierAllowsBackgroundActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BAAgentCore *)self applicationState];
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(BAAgentCore *)self applicationState];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 applicationIdentifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          LOBYTE(v7) = [v10 allowsBackgroundActivity];
          int v13 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v13 = 1;
LABEL_11:

  objc_sync_exit(v5);
  if (v13)
  {
    unsigned int v14 = sub_100013ABC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003B1E4();
    }

    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (unint64_t)_downloadsInProgress
{
  id v3 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
        unsigned int v12 = [v11 objectForKey:v10];

        if (v12) {
          v7 += (unint64_t)[v12 numberOfActiveDownloads];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_downloadsInProgressForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BAAgentCore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BAAgentCore *)self downloadQueuesByClientIdentifier];
  unint64_t v7 = [v6 objectForKey:v4];

  if (v7) {
    id v8 = [v7 numberOfActiveDownloads];
  }
  else {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

- (OS_dispatch_queue)asyncClientNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAsyncClientNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)telemetryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTelemetryQueue:(id)a3
{
}

- (OS_dispatch_queue)lockDownQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLockDownQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 56, 1);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)spiListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpiListener:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTelephonyClient:(id)a3
{
}

- (NSMutableArray)applicationState
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationState:(id)a3
{
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnections:(id)a3
{
}

- (NSMutableDictionary)connectionReplyQueue
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnectionReplyQueue:(id)a3
{
}

- (NSMutableArray)unhandledDownloadEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUnhandledDownloadEvents:(id)a3
{
}

- (NSMutableDictionary)extensionConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExtensionConnections:(id)a3
{
}

- (BAAgentDownloadRulesEngine)rulesEngine
{
  return (BAAgentDownloadRulesEngine *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRulesEngine:(id)a3
{
}

- (NSMutableDictionary)downloadQueuesByClientIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDownloadQueuesByClientIdentifier:(id)a3
{
}

- (NSMutableDictionary)telemetryByDownloadUniqueIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTelemetryByDownloadUniqueIdentifier:(id)a3
{
}

- (BOOL)debugClearState
{
  return self->_debugClearState;
}

- (void)setDebugClearState:(BOOL)a3
{
  self->_debugClearState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryByDownloadUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadQueuesByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_rulesEngine, 0);
  objc_storeStrong((id *)&self->_extensionConnections, 0);
  objc_storeStrong((id *)&self->_unhandledDownloadEvents, 0);
  objc_storeStrong((id *)&self->_connectionReplyQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_spiListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_lockDownQueue, 0);
  objc_storeStrong((id *)&self->_telemetryQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_asyncClientNotificationQueue, 0);
}

@end