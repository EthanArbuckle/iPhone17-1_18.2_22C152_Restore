@interface NDAVBackgroundSession
- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (BOOL)ensureAVAssetDownloadSessionWrapperForTaskIdentifier:(unint64_t)a3;
- (BOOL)hasEntitlementToSpecifyDownloadDestinationURL;
- (BOOL)retryTask:(id)a3 originalError:(id)a4;
- (NDAVBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11;
- (id)avAssetDownloadsDirectory;
- (id)avAssetForURL:(id)a3 downloadToken:(unint64_t)a4;
- (id)destinationURLToUseForTask:(id)a3;
- (id)downloadDirectoryToUse:(id)a3;
- (id)newAVAssetDownloadSessionWrapperForTaskInfo:(id)a3;
- (id)restoreTasksFromArchivedInfo:(id)a3;
- (id)restoreTasksFromSqliteDB:(id)a3;
- (int64_t)adjustedTCPConnectionPriorityForTaskPriority:(int64_t)a3;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didCompleteWithError:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didResolveMediaSelectionPropertyList:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didUpdateProgressWithLastBytesWritten:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 willDownloadVariants:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12;
- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15;
- (void)cancelAVDownloadAndFailTaskWithIdentifier:(unint64_t)a3 withError:(id)a4;
- (void)cancelDelayedCompletionWakeTimer;
- (void)cancelTCPConnectionForTask:(unint64_t)a3 withError:(id)a4;
- (void)cancelTaskWithIdentifier:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4;
- (void)cancelThroughputMonitorForWrapper:(unint64_t)a3;
- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3;
- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 pipeHandle:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7;
- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)resetStorageWithReply:(id)a3;
- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setupDelayedCompletionWakeTimer;
- (void)setupThroughputMonitorForWrapper:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5;
- (void)startAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3;
- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5;
- (void)stopAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3;
- (void)taskShouldResume:(unint64_t)a3;
- (void)taskShouldSuspend:(unint64_t)a3;
- (void)taskWithIdentifier:(unint64_t)a3 didCompleteWithError:(id)a4;
- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
@end

@implementation NDAVBackgroundSession

- (NDAVBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  BOOL v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v39.receiver = self;
  v39.super_class = (Class)NDAVBackgroundSession;
  v25 = [(NDBackgroundSession *)&v39 initWithConfiguration:v17 bundleID:v18 isSpringBoardApp:v14 downloadDirectory:v19 options:v20 clientProxy:v21 delegate:v22 workQueue:v23 db:v24];
  if (v25)
  {
    uint64_t v26 = +[NSMutableDictionary dictionary];
    identifiersToAVWrappers = v25->_identifiersToAVWrappers;
    v25->_identifiersToAVWrappers = (NSMutableDictionary *)v26;

    uint64_t v28 = +[NSMutableDictionary dictionary];
    identifiersToThroughputMonitors = v25->_identifiersToThroughputMonitors;
    v25->_identifiersToThroughputMonitors = (NSMutableDictionary *)v28;

    uint64_t v30 = +[NSMutableDictionary dictionary];
    identifiersToTCPConnections = v25->_identifiersToTCPConnections;
    v25->_identifiersToTCPConnections = (NSMutableDictionary *)v30;

    uint64_t v32 = +[NSMutableDictionary dictionary];
    identifiersToDASActivities = v25->_identifiersToDASActivities;
    v25->_identifiersToDASActivities = (NSMutableDictionary *)v32;

    v34 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:5 capacity:0];
    assetDownloadTokensToAssets = v25->_assetDownloadTokensToAssets;
    v25->_assetDownloadTokensToAssets = v34;

    objc_storeStrong((id *)&v25->_clientConfig, a3);
    delayedWakeTimer = v25->_delayedWakeTimer;
    v25->_delayedWakeTimer = 0;
  }
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedWakeTimer, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assetDownloadTokensToAssets, 0);
  objc_storeStrong((id *)&self->_identifiersToDASActivities, 0);
  objc_storeStrong((id *)&self->_identifiersToTCPConnections, 0);
  objc_storeStrong((id *)&self->_identifiersToThroughputMonitors, 0);

  objc_storeStrong((id *)&self->_identifiersToAVWrappers, 0);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 taskIdentifier];
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v10 = +[NSNumber numberWithUnsignedInteger:v8];
  v11 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v10];

  [v11 setCountOfBytesReceived:[v6 countOfBytesWritten]];
  [v11 setCountOfBytesExpectedToReceive:[v6 countOfBytesExpectedToWrite]];
  v12 = (id)qword_1000CB148;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 _loggableDescription];
    *(_DWORD *)buf = 138543874;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2048;
    id v23 = [v7 code];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ AVAssetDownloadSession did complete with error %@ [%ld]", buf, 0x20u);
  }
  if (sub_10000F590((BOOL)v7))
  {
    BOOL v14 = [(NDBackgroundSession *)self clientBundleID];
    v15 = [(NDBackgroundSession *)self identifier];
    v16 = [(NDBackgroundSession *)self monitoredAppBundleID];
    id v17 = [(NDBackgroundSession *)self secondaryID];
    sub_10005C2B8(3, v14, v15, v16, v17, v11, 0, (uint64_t)[v6 countOfBytesWritten], 0, [v11 isDiscretionary], 0, 1, 1, v7);

    [(NDBackgroundSession *)self finalizeTaskCompletionWithSuppressedWake:1];
    [(NDAVBackgroundSession *)self cancelThroughputMonitorForWrapper:v8];
    [(NDAVBackgroundSession *)self cancelTCPConnectionForTask:v8 withError:v7];
    [(NDAVBackgroundSession *)self retryTask:v11 originalError:v7];
  }
  else
  {
    [(NDAVBackgroundSession *)self taskWithIdentifier:v8 didCompleteWithError:v7];
  }
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didResolveMediaSelectionPropertyList:(id)a4
{
  id v6 = a4;
  id v7 = [a3 taskIdentifier];
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v9 = +[NSNumber numberWithUnsignedInteger:v7];
  v10 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v9];

  [v10 setResolvedMediaSelectionPlist:v6];
  v11 = +[NSNumber numberWithUnsignedInteger:v7];
  [(NDBackgroundSession *)self queueUpdatesForTask:v11 updateType:14 highPriority:1];

  v12 = [PendingCallback alloc];
  if (v6)
  {
    id v15 = v6;
    v13 = +[NSArray arrayWithObjects:&v15 count:1];
  }
  else
  {
    v13 = &__NSArray0__struct;
  }
  BOOL v14 = [(PendingCallback *)v12 initWithCallbackType:8 taskIdentifier:v7 args:v13];
  if (v6) {

  }
  [(NDCallbackQueue *)self->super._callbackQueue addPendingCallback:v14 wakeRequirement:0];
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:", [v7 taskIdentifier], v6);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:", [v16 taskIdentifier], v12, v13, v14, v15);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 willDownloadVariants:(id)a4
{
  id v6 = a4;
  id v7 = [a3 taskIdentifier];
  id v8 = [PendingCallback alloc];
  if (v6)
  {
    id v11 = v6;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v9 = &__NSArray0__struct;
  }
  v10 = [(PendingCallback *)v8 initWithCallbackType:11 taskIdentifier:v7 args:v9];
  if (v6) {

  }
  [(NDCallbackQueue *)self->super._callbackQueue addPendingCallback:v10 wakeRequirement:0];
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didUpdateProgressWithLastBytesWritten:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6
{
  id v14 = a3;
  id v10 = [v14 taskIdentifier];
  if (a4)
  {
    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    id v12 = +[NSNumber numberWithUnsignedInteger:v10];
    id v13 = [(NSMutableDictionary *)identifiersToThroughputMonitors objectForKeyedSubscript:v12];

    [v13 wrapperTransferredData:a4];
  }
  [(NSXPCProxyCreating *)self->super._clientProxy backgroundAVAssetDownloadTaskDidUpdateProgress:v10 totalBytesWritten:a5 totalBytesExpectedToWrite:a6];
}

- (void)taskWithIdentifier:(unint64_t)a3 didCompleteWithError:(id)a4
{
  id v41 = a4;
  v40 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:");
  if (v6)
  {
    objc_super v39 = [(NDBackgroundSession *)self clientErrorForError:v41];
    id v7 = [(NSMutableDictionary *)self->_identifiersToAVWrappers objectForKeyedSubscript:v40];
    v38 = v7;
    if (v7) {
      id v8 = [v7 countOfBytesWritten];
    }
    else {
      id v8 = 0;
    }
    v9 = [(NDBackgroundSession *)self clientBundleID];
    id v10 = [(NDBackgroundSession *)self identifier];
    id v11 = [(NDBackgroundSession *)self monitoredAppBundleID];
    id v12 = [(NDBackgroundSession *)self secondaryID];
    sub_10005C2B8(3, v9, v10, v11, v12, v6, 0, (uint64_t)v8, 0, [v6 isDiscretionary], 0, 1, 0, v41);

    [v6 setState:3];
    [v6 setError:v39];
    id v13 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NDBackgroundSession *)self queueUpdatesForTask:v13 updateType:14 highPriority:1];

    [(NSMutableDictionary *)self->_identifiersToAVWrappers removeObjectForKey:v40];
    [v6 setAVURLAsset:0];
    if (sub_10000F84C((BOOL)v41)) {
      unsigned int v14 = [(NDApplication *)self->super._clientApplication canBeSuspended];
    }
    else {
      unsigned int v14 = 0;
    }
    id v15 = +[NSFileManager defaultManager];
    id v16 = [v6 _destinationURLToUse];
    id v17 = [v16 path];
    unsigned int v18 = [v15 fileExistsAtPath:v17];

    if (v18)
    {
      id v19 = [PendingCallback alloc];
      __int16 v20 = [v6 _destinationURLToUse];
      v49[0] = v20;
      id v21 = +[NSNull null];
      v49[1] = v21;
      __int16 v22 = +[NSArray arrayWithObjects:v49 count:2];
      id v23 = [(PendingCallback *)v19 initWithCallbackType:1 taskIdentifier:a3 args:v22];

      [(NDCallbackQueue *)self->super._callbackQueue addPendingCallback:v23 wakeRequirement:0];
    }
    id v24 = [PendingCallback alloc];
    v25 = v39;
    if (!v39)
    {
      v25 = +[NSNull null];
    }
    v48[0] = v25;
    uint64_t v26 = +[NSNull null];
    v48[1] = v26;
    v48[2] = &__NSDictionary0__struct;
    v27 = +[NSArray arrayWithObjects:v48 count:3];
    uint64_t v28 = [(PendingCallback *)v24 initWithCallbackType:0 taskIdentifier:a3 args:v27];

    if (!v39) {
    [(NDCallbackQueue *)self->super._callbackQueue addPendingCallback:v28 wakeRequirement:0];
    }
    v43.receiver = self;
    v43.super_class = (Class)NDAVBackgroundSession;
    [(NDBackgroundSession *)&v43 removeOutstandingTaskWithIdentifier:a3];
    [(NDAVBackgroundSession *)self cancelThroughputMonitorForWrapper:a3];
    v42.receiver = self;
    v42.super_class = (Class)NDAVBackgroundSession;
    unsigned int v29 = [(NDBackgroundSession *)&v42 finalizeTaskCompletionWithSuppressedWake:v14];
    uint64_t v30 = (id)qword_1000CB148;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v6 _loggableDescription];
      uint64_t v32 = (void *)v31;
      if (v29) {
        int v33 = 89;
      }
      else {
        int v33 = 78;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v31;
      __int16 v46 = 1024;
      int v47 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ completion woke client: %c", buf, 0x12u);
    }
    if ((v29 & 1) != 0 || [(NDBackgroundSession *)self clientIsActive])
    {
      v34 = (id)qword_1000CB148;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v6 _loggableDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = (uint64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ completion woke client or client is active - not requesting delayed wake", buf, 0xCu);
      }
      [(NDAVBackgroundSession *)self cancelDelayedCompletionWakeTimer];
    }
    else
    {
      v36 = (id)qword_1000CB148;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v6 _loggableDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = (uint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ completion did not wake client and client is not active - requesting delayed wake", buf, 0xCu);
      }
      [(NDAVBackgroundSession *)self setupDelayedCompletionWakeTimer];
    }
    [(NDAVBackgroundSession *)self cancelTCPConnectionForTask:a3 withError:v41];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->super._tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v7 _loggableDescription];
    *(_DWORD *)buf = 138543618;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finished downloading to %@", buf, 0x16u);
  }
  id v13 = [PendingCallback alloc];
  unsigned int v14 = +[NSNull null];
  v17[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v17 count:2];
  id v16 = [(PendingCallback *)v13 initWithCallbackType:1 taskIdentifier:v10 args:v15];

  [(NDCallbackQueue *)self->super._callbackQueue addPendingCallback:v16 wakeRequirement:0];
}

- (void)cancelTCPConnectionForTask:(unint64_t)a3 withError:(id)a4
{
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, a4);
  id v6 = [(NSMutableDictionary *)self->super._identifiersToTaskInfo objectForKeyedSubscript:v5];
  id v7 = [(NSMutableDictionary *)self->_identifiersToTCPConnections objectForKeyedSubscript:v5];
  if (v7)
  {
    id v8 = (id)qword_1000CB148;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v6 _loggableDescription];
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling tcp_connection", (uint8_t *)&v14, 0xCu);
    }
    tcp_connection_cancel();
    [(NSMutableDictionary *)self->_identifiersToTCPConnections removeObjectForKey:v5];
  }
  id v10 = [(NSMutableDictionary *)self->_identifiersToDASActivities objectForKeyedSubscript:v5];
  if (v10)
  {
    id v11 = (id)qword_1000CB148;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 _loggableDescription];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ completing _DASActivity %@", (uint8_t *)&v14, 0x16u);
    }
    id v13 = +[_DASScheduler sharedScheduler];
    [v13 activityCompleted:v10];

    [(NSMutableDictionary *)self->_identifiersToDASActivities removeObjectForKey:v5];
  }
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_identifiersToAVWrappers;
    v9 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)NDAVBackgroundSession;
  [(NDBackgroundSession *)&v10 clientAcknowledgedTerminalCallbackForTask:a3];
}

- (void)resetStorageWithReply:(id)a3
{
}

- (void)stopAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  id v8 = +[NSURLError errorWithDomain:@"_nsurlsessiondErrorDomain" code:5 userInfo:0];
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v6];

  [v7 cancelAndDeliverError:v8];
}

- (void)startAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->super._identifiersToTaskInfo objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6
    && [v6 state] != (id)3
    && [(NDAVBackgroundSession *)self ensureAVAssetDownloadSessionWrapperForTaskIdentifier:a3])
  {
    id v8 = [(NSMutableDictionary *)self->_identifiersToAVWrappers objectForKeyedSubscript:v5];
    v9 = (id)qword_1000CB148;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = [v7 _loggableDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      unsigned int v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ startAVAssetDownloadSessionWithTaskIdentifier wrapper: %@ taskIdentifier: %lu", buf, 0x20u);
    }
    [v8 resume];
    id v11 = [(NDBackgroundSession *)self clientBundleID];
    id v12 = [(NDBackgroundSession *)self identifier];
    id v13 = [(NDBackgroundSession *)self monitoredAppBundleID];
    int v14 = [(NDBackgroundSession *)self secondaryID];
    sub_10005C2B8(1, v11, v12, v13, v14, v7, 0, 0, 0, [v7 isDiscretionary], 0, 0, 0, 0);
  }
}

- (BOOL)ensureAVAssetDownloadSessionWrapperForTaskIdentifier:(unint64_t)a3
{
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->super._identifiersToTaskInfo objectForKeyedSubscript:v5];
  id v7 = [(NSMutableDictionary *)self->_identifiersToAVWrappers objectForKey:v5];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(NDAVBackgroundSession *)self newAVAssetDownloadSessionWrapperForTaskInfo:v6];
    objc_super v10 = v9;
    if (v9)
    {
      id v11 = [v9 downloadToken];
      [v6 setAVAssetDownloadToken:v11];
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 _loggableDescription];
        int v18 = 138543618;
        __int16 v19 = v13;
        __int16 v20 = 2048;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ created AVAssetDownloadSession with token %llu", (uint8_t *)&v18, 0x16u);
      }
      [(NSXPCProxyCreating *)self->super._clientProxy backgroundAVAssetDownloadTask:a3 didReceiveDownloadToken:v11];
      [v10 setTaskIdentifier:a3];
      [(NSMutableDictionary *)self->_identifiersToAVWrappers setObject:v10 forKeyedSubscript:v5];
      BOOL v8 = 1;
      int v14 = v10;
    }
    else
    {
      id v15 = (id)qword_1000CB148;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = [v6 _loggableDescription];
        int v18 = 138543362;
        __int16 v19 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ couldn't create AVAssetDownloadSession; returning an error",
          (uint8_t *)&v18,
          0xCu);
      }
      int v14 = +[NSURLError errorWithDomain:NSURLErrorDomain code:-1 userInfo:0];
      [(NDAVBackgroundSession *)self taskWithIdentifier:a3 didCompleteWithError:v14];
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)newAVAssetDownloadSessionWrapperForTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 AVURLAsset];
  if (v5)
  {

LABEL_4:
    id v7 = [NDAVAssetDownloadSessionWrapper alloc];
    BOOL v8 = [v4 AVURLAsset];
    id v9 = [v4 _destinationURLToUse];
    objc_super v10 = [(NDBackgroundSession *)self monitoredAppBundleID];
    clientConfig = self->_clientConfig;
    id v12 = [v4 AVURLAsset];
    id v13 = [v4 _AVAssetDownloadSessionOptions:v10 config:clientConfig asset:v12];
    int v14 = [(NDAVAssetDownloadSessionWrapper *)v7 initWithURLAsset:v8 destinationURL:v9 options:v13 delegate:self queue:self->super._workQueue];
    goto LABEL_5;
  }
  id v6 = [v4 downloadConfig];

  if (v6) {
    goto LABEL_4;
  }
  __int16 v20 = [v4 _URLToUse];

  if (!v20)
  {
    id v15 = 0;
    goto LABEL_9;
  }
  id v21 = [NDAVAssetDownloadSessionWrapper alloc];
  BOOL v8 = [v4 _URLToUse];
  id v9 = [v4 _destinationURLToUse];
  objc_super v10 = [(NDBackgroundSession *)self monitoredAppBundleID];
  __int16 v22 = self->_clientConfig;
  id v12 = [v4 AVURLAsset];
  id v13 = [v4 _AVAssetDownloadSessionOptions:v10 config:v22 asset:v12];
  int v14 = [(NDAVAssetDownloadSessionWrapper *)v21 initWithURL:v8 destinationURL:v9 options:v13 delegate:self queue:self->super._workQueue];
LABEL_5:
  id v15 = v14;

  if (v15)
  {
    id v16 = [(NDAVAssetDownloadSessionWrapper *)v15 downloadToken];
    __int16 v17 = (id)qword_1000CB148;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v4 _loggableDescription];
      int v23 = 138543618;
      id v24 = v18;
      __int16 v25 = 2048;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ created AVAssetDownloadSession with token %llu", (uint8_t *)&v23, 0x16u);
    }
    -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didReceiveDownloadToken:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:", [v4 identifier], v16);
  }
LABEL_9:

  return v15;
}

- (int64_t)adjustedTCPConnectionPriorityForTaskPriority:(int64_t)a3
{
  monitoredApplication = self->super._monitoredApplication;
  if (!monitoredApplication || [(NDApplication *)monitoredApplication isForeground])
  {
    if (a3 > 399)
    {
      if (a3 > 499)
      {
        if (a3 != 500)
        {
          if (a3 == 600) {
            return a3;
          }
LABEL_12:
          if (a3 == 650) {
            return 650;
          }
          return 300;
        }
        return 500;
      }
      if (a3 == 400) {
        return a3;
      }
LABEL_25:
      if (a3 != 450) {
        return 300;
      }
      return 450;
    }
    if (a3 > 299)
    {
      if (a3 == 300) {
        return a3;
      }
LABEL_28:
      if (a3 != 350) {
        return 300;
      }
      return 350;
    }
    goto LABEL_20;
  }
  if (a3 <= 399)
  {
    if (a3 > 299)
    {
      if (a3 == 300) {
        return 350;
      }
      goto LABEL_28;
    }
LABEL_20:
    if (a3 == 100) {
      return a3;
    }
    if (a3 == 200) {
      return 200;
    }
    return 300;
  }
  if (a3 <= 499)
  {
    if (a3 == 400) {
      return 450;
    }
    goto LABEL_25;
  }
  if (a3 == 500) {
    return 500;
  }
  if (a3 != 600) {
    goto LABEL_12;
  }
  return 650;
}

- (void)taskShouldResume:(unint64_t)a3
{
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->super._identifiersToTaskInfo objectForKeyedSubscript:v5];
  if ([v6 taskKind] == (id)3 || objc_msgSend(v6, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    BOOL v8 = +[NSNumber numberWithUnsignedInteger:a3];
    id v9 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v8];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006CF80;
    v12[3] = &unk_1000B64E8;
    id v13 = v6;
    int v14 = self;
    unint64_t v17 = a3;
    id v15 = v9;
    id v16 = v5;
    id v10 = v9;
    [(NDBackgroundSession *)self handleEarliestBeginDateForTaskWithIdentifier:a3 completionHandler:v12];
  }
  if (([v6 hasStarted] & 1) == 0
    && ([v6 isDiscretionary] & 1) == 0)
  {
    [v6 setStartedUserInitiated:1];
  }
  [v6 setHasStarted:1];
  id v11 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NDBackgroundSession *)self queueUpdatesForTask:v11 updateType:14 highPriority:1];
}

- (void)taskShouldSuspend:(unint64_t)a3
{
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v24 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v6];

  if ([v24 taskKind] == (id)3 || objc_msgSend(v24, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    BOOL v8 = +[NSNumber numberWithUnsignedInteger:a3];
    id v9 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v8];

    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    id v11 = +[NSNumber numberWithUnsignedInteger:a3];
    id v12 = [(NSMutableDictionary *)identifiersToThroughputMonitors objectForKeyedSubscript:v11];

    [v9 suspend];
    [v12 wrapperWillSuspend];
    if (([v24 resumedAndWaitingForEarliestBeginDate] & 1) == 0)
    {
      id v13 = [(NDBackgroundSession *)self clientBundleID];
      int v14 = [(NDBackgroundSession *)self identifier];
      id v15 = [(NDBackgroundSession *)self monitoredAppBundleID];
      id v16 = [(NDBackgroundSession *)self secondaryID];
      sub_10005C2B8(2, v13, v14, v15, v16, v24, 0, 0, 0, [v24 isDiscretionary], 0, 0, 0, 0);
    }
    [v24 setResumedAndWaitingForEarliestBeginDate:0];
    identifiersToDASActivities = self->_identifiersToDASActivities;
    int v18 = +[NSNumber numberWithUnsignedInteger:a3];
    __int16 v19 = [(NSMutableDictionary *)identifiersToDASActivities objectForKeyedSubscript:v18];

    if (v19)
    {
      __int16 v20 = self->_identifiersToDASActivities;
      id v21 = +[NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v20 setObject:0 forKeyedSubscript:v21];

      __int16 v22 = +[_DASScheduler sharedScheduler];
      [v22 activityCanceled:v19];
    }
  }
  int v23 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NDBackgroundSession *)self queueUpdatesForTask:v23 updateType:11 highPriority:1];
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 _loggableDescription];
    int v47 = 138543362;
    id v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying AVAssetDownloadTask", (uint8_t *)&v47, 0xCu);
  }
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 identifier]);
  id v12 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = self->_identifiersToAVWrappers;
    int v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 identifier]);
    [(NSMutableDictionary *)v13 removeObjectForKey:v14];
  }
  [(NDBackgroundSession *)self updateTaskInfoBasedOnCurrentDiscretionaryStatus:v6];
  [v6 setRetryError:v7];
  if (!v7) {
    goto LABEL_20;
  }
  id v15 = [v7 domain];
  if ([v15 isEqualToString:AVFoundationErrorDomain])
  {
    BOOL v16 = [v7 code] == (id)-11819;

    if (!v16) {
      goto LABEL_13;
    }
    unint64_t v17 = [v6 AVAssetURL];
    int v18 = [v6 assetOptionsPlist];
    __int16 v19 = +[AVURLAsset assetForNSURLSessionWithURL:v17 propertyList:v18];
    [v6 setAVURLAsset:v19];

    __int16 v20 = [v6 AVURLAsset];
    [v6 setAVAssetDownloadToken:[v20 downloadToken]];

    if ([v6 AVAssetDownloadToken])
    {
      assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
      __int16 v22 = [v6 AVURLAsset];
      int v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 AVAssetDownloadToken]);
      [(NSMapTable *)assetDownloadTokensToAssets setObject:v22 forKey:v23];
    }
    id v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 identifier]);
    [(NDBackgroundSession *)self queueUpdatesForTask:v24 updateType:14 highPriority:1];

    id v15 = (id)qword_1000CB148;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v6 _loggableDescription];
      id v26 = [v7 code];
      id v27 = [v6 retryCount];
      uint64_t v28 = [v6 options];
      int v47 = 138544386;
      id v48 = v25;
      __int16 v49 = 2112;
      double v50 = *(double *)&v7;
      __int16 v51 = 2048;
      id v52 = v26;
      __int16 v53 = 2048;
      id v54 = v27;
      __int16 v55 = 2112;
      v56 = v28;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ recreated asset after error %@ [%ld] retry count %lu options = %@", (uint8_t *)&v47, 0x34u);
    }
  }

LABEL_13:
  unsigned int v29 = [v7 domain];
  unsigned int v30 = [v29 isEqualToString:AVFoundationErrorDomain];

  if (!v30)
  {
LABEL_20:
    unsigned int v35 = 0;
    goto LABEL_21;
  }
  id v31 = [v7 code];
  if (v31 == (id)-11903 || v31 == (id)-11900) {
    goto LABEL_16;
  }
  uint64_t v45 = [v7 userInfo];
  v34 = [v45 objectForKey:NSUnderlyingErrorKey];

  if ([v34 code] != (id)-12540)
  {
    unsigned int v35 = 0;
LABEL_19:

    goto LABEL_21;
  }
  __int16 v46 = [v34 domain];
  unsigned int v35 = [v46 isEqualToString:NSOSStatusErrorDomain];

  if (v35)
  {
LABEL_16:
    uint64_t v32 = (id)qword_1000CB148;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = [v6 _loggableDescription];
      int v47 = 138543362;
      id v48 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ removing destination file for AVAssetDownloadTask in order to retry", (uint8_t *)&v47, 0xCu);
    }
    v34 = [v6 _destinationURLToUse];
    +[NDFileUtilities removeItemAtURL:v34];
    unsigned int v35 = 1;
    goto LABEL_19;
  }
LABEL_21:
  v36 = [v7 domain];
  unsigned int v37 = [v36 isEqualToString:@"_nsurlsessiondErrorDomain"];

  double v38 = 1.0;
  if (((v37 | v35) & 1) == 0)
  {
    objc_super v39 = (char *)[v6 retryCount:1.0];
    [v6 setRetryCount:v39 + 1];
    double v38 = exp2((double)(unint64_t)v39);
  }
  double v40 = fmin(v38, 1800.0);
  id v41 = (id)qword_1000CB148;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v42 = [v6 _loggableDescription];
    int v47 = 138543618;
    id v48 = v42;
    __int16 v49 = 2048;
    double v50 = v40;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ will retry after %f seconds", (uint8_t *)&v47, 0x16u);
  }
  objc_super v43 = +[NDStatusMonitor sharedMonitor];
  [v43 performCallbackAfterNetworkChangedEvent:self identifier:[v6 identifier] delay:v40];

  return 1;
}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  workQueue = self->super._workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006EE50;
  v6[3] = &unk_1000B6420;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async(workQueue, v6);
}

- (void)cancelAVDownloadAndFailTaskWithIdentifier:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  BOOL v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v8];

  [v9 setResumedAndWaitingForEarliestBeginDate:0];
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v11 = +[NSNumber numberWithUnsignedInteger:a3];
  id v12 = [(NSMutableDictionary *)identifiersToAVWrappers objectForKeyedSubscript:v11];

  [v12 cancel];
  [(NDAVBackgroundSession *)self cancelTCPConnectionForTask:a3 withError:v6];
  id v13 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F034;
  block[3] = &unk_1000B63F8;
  id v16 = v6;
  unint64_t v17 = a3;
  block[4] = self;
  id v14 = v6;
  dispatch_async(v13, block);
}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  -[NDAVBackgroundSession setPriority:forTCPConnectionWithTaskIdentifier:](self, "setPriority:forTCPConnectionWithTaskIdentifier:");
  v10.receiver = self;
  v10.super_class = (Class)NDAVBackgroundSession;
  [(NDBackgroundSession *)&v10 setPriority:a3 forTaskWithIdentifier:a4];
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  BOOL v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)identifiersToThroughputMonitors objectForKeyedSubscript:v8];

  [v9 setBasePriority:a3];
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(NDAVBackgroundSession *)self cancelTaskWithIdentifier:a3];
  v6[2](v6, 0);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v6];

  BOOL v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 _loggableDescription];
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelTaskWithIdentifier", (uint8_t *)&v12, 0xCu);
  }
  objc_super v10 = [v7 _URLToUse];
  id v11 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-999 URL:v10];

  [(NDAVBackgroundSession *)self cancelAVDownloadAndFailTaskWithIdentifier:a3 withError:v11];
}

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
  id v37 = a4;
  id v40 = a5;
  id v41 = a6;
  id v42 = a7;
  id v38 = a8;
  id v39 = a9;
  id v43 = a11;
  int v18 = (void (**)(id, BOOL))a12;
  __int16 v19 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    id v50 = v43;
    __int16 v51 = 2048;
    unint64_t v52 = a10;
    __int16 v53 = 2048;
    unint64_t v54 = a3;
    __int16 v55 = 2112;
    id v56 = v37;
    __int16 v57 = 2112;
    id v58 = v40;
    __int16 v59 = 2112;
    id v60 = v41;
    __int16 v61 = 2112;
    id v62 = v42;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Task <%{public}@>.<%lu> avAggregateAssetDownloadTaskWithDownloadToken: %llu, serializedMediaSelections: %@, assetTitle: %@, assetArtworkData: %@, options: %@", buf, 0x48u);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v21 = v20;
  id v22 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
  int v23 = [(NDBackgroundSession *)self clientBundleID];
  id v24 = [(NDBackgroundSession *)self identifier];
  id v25 = [v22 initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:v39 assetTitle:v40 assetArtworkData:v41 options:v42 taskIdentifier:a10 uniqueIdentifier:v43 bundleID:v23 sessionID:v24];

  if ([(NDApplication *)self->super._monitoredApplication hasForegroundBackgroundStates])
  {
    BOOL v26 = !self->super._discretionary;
  }
  else
  {
    BOOL v26 = 0;
  }
  [v25 setMayBeDemotedToDiscretionary:v26];
  v46.receiver = self;
  v46.super_class = (Class)NDAVBackgroundSession;
  [v25 setDiscretionary:-[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](&v46, "currentDiscretionaryStatus:withOptionalTaskInfo:", 0, v25)];
  v45.receiver = self;
  v45.super_class = (Class)NDAVBackgroundSession;
  [v25 setBasePriority:-[NDBackgroundSession priorityForDiscretionaryStatus:](&v45, "priorityForDiscretionaryStatus:", [v25 isDiscretionary])];
  [v25 setState:1];
  [v25 setSuspendCount:1];
  [v25 setCreationTime:v21];
  [v25 setInitializedWithAVAsset:1];
  [v25 setAVAssetDownloadToken:a3];
  uint64_t v47 = AVURLAssetDownloadTokenKey;
  id v27 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v48 = v27;
  uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  unsigned int v29 = +[AVURLAsset URLAssetWithURL:0 options:v28];

  [v25 setAVURLAsset:v29];
  unsigned int v30 = [v29 URL];
  [v25 setAVAssetURL:v30];

  [v25 setAssetOptionsPlist:v38];
  id v31 = (id)qword_1000CB148;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v25 _loggableDescription];
    *(_DWORD *)buf = 138543618;
    id v50 = v32;
    __int16 v51 = 2112;
    unint64_t v52 = (unint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ new AVAggregateAssetDownloadTask asset: %@", buf, 0x16u);
  }
  if (v29)
  {
    identifiersToTaskInfo = self->super._identifiersToTaskInfo;
    v34 = +[NSNumber numberWithUnsignedInteger:a10];
    [(NSMutableDictionary *)identifiersToTaskInfo setObject:v25 forKeyedSubscript:v34];

    v44.receiver = self;
    v44.super_class = (Class)NDAVBackgroundSession;
    [(NDBackgroundSession *)&v44 addOutstandingTaskWithIdentifier:a10];
    unsigned int v35 = +[NSNumber numberWithUnsignedInteger:a10];
    [(NDBackgroundSession *)self queueUpdatesForTask:v35 updateType:14 highPriority:1];
  }
  else
  {
    unsigned int v35 = (id)qword_1000CB148;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [v25 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v50 = v36;
      __int16 v51 = 2048;
      unint64_t v52 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAsset, token %llu", buf, 0x16u);
    }
  }

  v18[2](v18, v29 != 0);
}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
  id v20 = a4;
  id v21 = a5;
  id v68 = a6;
  id v70 = a7;
  id v71 = a8;
  id v22 = a9;
  id v65 = a10;
  id v69 = a12;
  int v23 = (void (**)(id, void))a15;
  id v24 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138545410;
    id v78 = v69;
    __int16 v79 = 2048;
    unint64_t v80 = a11;
    __int16 v81 = 2048;
    unint64_t v82 = a3;
    __int16 v83 = 2112;
    id v84 = v20;
    __int16 v85 = 2112;
    id v86 = v21;
    __int16 v87 = 2112;
    id v88 = v68;
    __int16 v89 = 2112;
    id v90 = v70;
    __int16 v91 = 2112;
    id v92 = v71;
    __int16 v93 = 2112;
    id v94 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Task <%{public}@>.<%lu> avAssetDownloadTaskWithDownloadToken: %llu, URL: %@, destinationURL: %@, temporaryDestinationURL: %@, assetTitle: %@, assetArtworkData: %@, options: %@", buf, 0x5Cu);
  }
  v66 = v21;
  id v64 = [(NDAVBackgroundSession *)self downloadDirectoryToUse:v21];
  xpcConn = self->super._xpcConn;
  if (xpcConn)
  {
    [(NSXPCConnection *)xpcConn auditToken];
  }
  else
  {
    long long v75 = 0u;
    long long v76 = 0u;
  }
  id v26 = v64;
  id v58 = [v26 fileSystemRepresentation];
  if (!sandbox_check_by_audit_token())
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v29 = v28;
    if (v22)
    {
      id v61 = [v22 mutableCopy];
    }
    else
    {
      id v61 = +[NSMutableDictionary dictionary];
    }
    uint64_t v62 = [v22 objectForKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];
    [v61 setObject:0 forKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];
    id v67 = v61;

    unsigned int v30 = ![(NDAVBackgroundSession *)self doesAVAssetDownloadSessionSupportMultipleDownloads];
    if (a13 != 5) {
      LOBYTE(v30) = 1;
    }
    if (v30)
    {
      id v35 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
      uint64_t v32 = [(NDBackgroundSession *)self clientBundleID];
      int v33 = [(NDBackgroundSession *)self identifier];
      id v34 = [v35 initWithAVAssetDownloadURL:v20 destinationURL:v66 assetTitle:v70 assetArtworkData:v71 options:v67 taskIdentifier:a11 uniqueIdentifier:v69 bundleID:v32 sessionID:v33 downloadConfig:v62];
    }
    else
    {
      id v31 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
      uint64_t v32 = [(NDBackgroundSession *)self clientBundleID];
      int v33 = [(NDBackgroundSession *)self identifier];
      LOBYTE(v59) = a14;
      id v34 = [v31 initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:v20 destinationURL:v66 assetTitle:v70 assetArtworkData:v71 options:v67 taskIdentifier:a11 uniqueIdentifier:v69 bundleID:v32 sessionID:v33 enableSPIDelegateCallbacks:v59];
    }
    v36 = v34;

    if ([(NDApplication *)self->super._monitoredApplication hasForegroundBackgroundStates])
    {
      BOOL v37 = !self->super._discretionary;
    }
    else
    {
      BOOL v37 = 0;
    }
    [v36 setMayBeDemotedToDiscretionary:v37];
    v74.receiver = self;
    v74.super_class = (Class)NDAVBackgroundSession;
    [v36 setDiscretionary:-[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](&v74, "currentDiscretionaryStatus:withOptionalTaskInfo:", 0, v36)];
    v73.receiver = self;
    v73.super_class = (Class)NDAVBackgroundSession;
    [v36 setBasePriority:-[NDBackgroundSession priorityForDiscretionaryStatus:](&v73, "priorityForDiscretionaryStatus:", [v36 isDiscretionary])];
    [v36 setState:1];
    [v36 setSuspendCount:1];
    [v36 setCreationTime:v29];
    [v36 setAVAssetDownloadToken:a3];
    [v36 setInitializedWithAVAsset:a3 != 0];
    if ([v36 initializedWithAVAsset])
    {
      uint64_t v38 = [(NDAVBackgroundSession *)self avAssetForURL:v20 downloadToken:a3];
      [v36 setAVURLAsset:v38];
    }
    else
    {
      uint64_t v38 = 0;
    }
    [v36 setTemporaryDestinationURL:v68];
    [v36 setAssetTitle:v70];
    [v36 setAssetArtworkData:v71];
    [v36 setAssetOptionsPlist:v65];
    if (v38 | v62)
    {
      id v39 = [(NDAVBackgroundSession *)self destinationURLToUseForTask:v36];
      [v36 setDestinationURL:v39];

      if (v38)
      {
        id v40 = [(id)v38 URL];
        [v36 setAVAssetURL:v40];

LABEL_31:
        id v43 = [v36 destinationURL];
        BOOL v44 = v43 == 0;

        if (!v44)
        {
          objc_super v45 = [(NDAVBackgroundSession *)self newAVAssetDownloadSessionWrapperForTaskInfo:v36];
          BOOL v60 = v45 != 0;
          objc_super v46 = (id)qword_1000CB148;
          uint64_t v47 = v46;
          if (v45)
          {
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              id v48 = [v36 _loggableDescription];
              *(_DWORD *)buf = 138543874;
              id v78 = v48;
              __int16 v79 = 2112;
              unint64_t v80 = (unint64_t)v45;
              __int16 v81 = 2048;
              unint64_t v82 = a3;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ new AVAssetDownloadSession %@ with token %llu", buf, 0x20u);
            }
            identifiersToTaskInfo = self->super._identifiersToTaskInfo;
            id v50 = +[NSNumber numberWithUnsignedInteger:a11];
            [(NSMutableDictionary *)identifiersToTaskInfo setObject:v36 forKeyedSubscript:v50];

            identifiersToAVWrappers = self->_identifiersToAVWrappers;
            unint64_t v52 = +[NSNumber numberWithUnsignedInteger:a11];
            [(NSMutableDictionary *)identifiersToAVWrappers setObject:v45 forKeyedSubscript:v52];

            [v45 setTaskIdentifier:a11];
            [(NDAVBackgroundSession *)self setupThroughputMonitorForWrapper:v45 taskInfo:v36 identifier:a11];
            v72.receiver = self;
            v72.super_class = (Class)NDAVBackgroundSession;
            [(NDBackgroundSession *)&v72 addOutstandingTaskWithIdentifier:a11];
            __int16 v53 = +[NSNumber numberWithUnsignedInteger:a11];
            [(NDBackgroundSession *)self queueUpdatesForTask:v53 updateType:14 highPriority:1];

            clientProxy = self->super._clientProxy;
            uint64_t v47 = [v36 destinationURL];
            [(NSXPCProxyCreating *)clientProxy backgroundAVAssetDownloadTask:a11 willDownloadToURL:v47];
          }
          else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            __int16 v57 = [v36 _loggableDescription];
            *(_DWORD *)buf = 138543362;
            id v78 = v57;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAssetDownloadSession", buf, 0xCu);
          }
LABEL_42:

          ((void (**)(id, BOOL))v23)[2](v23, v60);
          goto LABEL_43;
        }
LABEL_36:
        objc_super v45 = (id)qword_1000CB148;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v56 = [v36 _loggableDescription];
          *(_DWORD *)buf = 138543618;
          id v78 = v56;
          __int16 v79 = 2048;
          unint64_t v80 = a3;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAsset, token %llu", buf, 0x16u);
        }
        BOOL v60 = 0;
        goto LABEL_42;
      }
      if (v62)
      {
        id v41 = [(id)v62 _asset];
        id v42 = [v41 URL];
        [v36 setAVAssetURL:v42];
      }
    }
    if ([v36 initializedWithAVAsset] && !v62) {
      goto LABEL_36;
    }
    goto LABEL_31;
  }
  id v27 = (id)qword_1000CB148;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    __int16 v55 = [(NDBackgroundSession *)self clientBundleID];
    *(_DWORD *)buf = 138544130;
    id v78 = v69;
    __int16 v79 = 2048;
    unint64_t v80 = a11;
    __int16 v81 = 2112;
    unint64_t v82 = (unint64_t)v55;
    __int16 v83 = 2112;
    id v84 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Task <%{public}@>.<%lu> for client %@ does not have write access to destination directory %@", buf, 0x2Au);
  }
  v23[2](v23, 0);
  id v67 = v22;
LABEL_43:
}

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)avAssetForURL:(id)a3 downloadToken:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
    BOOL v8 = +[NSNumber numberWithUnsignedLongLong:a4];
    id v9 = [(NSMapTable *)assetDownloadTokensToAssets objectForKey:v8];

    if (!v9)
    {
      if (v6)
      {
        id v9 = +[AVURLAsset URLAssetWithURL:v6 options:0];
      }
      else
      {
        uint64_t v15 = AVURLAssetDownloadTokenKey;
        objc_super v10 = +[NSNumber numberWithUnsignedLongLong:a4];
        id v16 = v10;
        id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        id v9 = +[AVURLAsset URLAssetWithURL:0 options:v11];
      }
      int v12 = self->_assetDownloadTokensToAssets;
      id v13 = +[NSNumber numberWithUnsignedLongLong:a4];
      [(NSMapTable *)v12 setObject:v9 forKey:v13];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)hasEntitlementToSpecifyDownloadDestinationURL
{
  v2 = +[NSXPCConnection currentConnection];
  unsigned __int8 v3 = sub_10000BE38(v2, @"com.apple.private.nsurlsession.media-asset-download.can-specify-destination-url");

  return v3;
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 pipeHandle:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000707E8;
  v7[3] = &unk_1000B63D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070B80;
  v7[3] = &unk_1000B63D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070F0C;
  v7[3] = &unk_1000B63D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007124C;
  v7[3] = &unk_1000B63D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (id)destinationURLToUseForTask:(id)a3
{
  id v4 = a3;
  v5 = [v4 destinationURL];
  if (!v5)
  {
    id v6 = [v4 AVURLAsset];
    if (v6)
    {

      goto LABEL_5;
    }
    id v7 = [v4 downloadConfig];

    if (v7)
    {
LABEL_5:
      id v8 = [v4 AVURLAsset];
      id v9 = [v8 URL];
      unsigned int v10 = [v9 isFileURL];

      if (v10)
      {
        id v11 = [v4 AVURLAsset];
        v5 = [v11 URL];
LABEL_21:

        goto LABEL_22;
      }
      if ([v4 AVAssetDownloadToken])
      {
        id v12 = [v4 AVAssetDownloadToken];
        if (!v12) {
          goto LABEL_11;
        }
      }
      else
      {
        id v13 = [v4 AVURLAsset];
        id v12 = [v13 downloadToken];

        if (!v12) {
LABEL_11:
        }
          id v12 = (id)arc4random();
      }
      id v14 = +[NSMutableCharacterSet URLPathAllowedCharacterSet];
      id v15 = [v14 mutableCopy];

      id v30 = v15;
      [v15 removeCharactersInString:@"/"];
      id v16 = [v4 assetTitle];
      unint64_t v17 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v15];

      if ((unint64_t)[v17 length] >= 0xE8)
      {
        uint64_t v18 = [v17 substringWithRange:0, 231];

        unint64_t v17 = (void *)v18;
      }
      __int16 v19 = [v4 AVURLAsset];
      id v20 = +[NSString stringWithFormat:@"%llu", v12];
      id v31 = destinationURLFragment();

      if (v17) {
        CFStringRef v21 = @"_";
      }
      else {
        CFStringRef v21 = &stru_1000B82C8;
      }
      id v22 = [v4 AVURLAsset];
      int v23 = [v22 URL];
      id v24 = [v23 pathExtension];
      id v25 = [(id)objc_opt_class() performSelector:"_figFilePathExtensions"];
      if ([v25 containsObject:v24]) {
        id v26 = v24;
      }
      else {
        id v26 = @"movpkg";
      }

      id v27 = +[NSString stringWithFormat:@"%@%@%@.%@", v17, v21, v31, v26];

      double v28 = [(NDAVBackgroundSession *)self avAssetDownloadsDirectory];
      v5 = [v28 URLByAppendingPathComponent:v27 isDirectory:0];

      id v11 = v30;
      goto LABEL_21;
    }
    v5 = 0;
  }
LABEL_22:

  return v5;
}

- (id)downloadDirectoryToUse:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    [v4 URLByDeletingLastPathComponent];
  }
  else {
  id v6 = [(NDAVBackgroundSession *)self avAssetDownloadsDirectory];
  }

  return v6;
}

- (id)avAssetDownloadsDirectory
{
  if (![(NDApplication *)self->super._clientApplication usesContainerManagerForAVAsset])
  {
    id v9 = [(NDBackgroundSession *)self setupDownloadDirectory];
    goto LABEL_26;
  }
  uint64_t v29 = 1;
  id v3 = [(NDBackgroundSession *)self clientBundleID];
  [v3 UTF8String];
  id v4 = (void *)container_create_or_lookup_path_for_current_user();

  if (!v4)
  {
    v5 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error getting container path: %llu", buf, 0xCu);
    }
  }
  id v6 = [(NDBackgroundSession *)self clientBundleID];
  [v6 UTF8String];
  id v7 = (void *)container_user_managed_assets_relative_path();

  if (!v7)
  {
    uint64_t v18 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error getting User managed assets path: %llu", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (!v4)
  {
LABEL_19:
    id v9 = 0;
    goto LABEL_26;
  }
  id v8 = +[NSURL fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
  id v9 = +[NSURL fileURLWithFileSystemRepresentation:v7 isDirectory:1 relativeToURL:v8];
  free(v4);
  free(v7);

  if (!v9) {
    goto LABEL_26;
  }
  char v28 = 0;
  unsigned int v10 = +[NSFileManager defaultManager];
  id v11 = [v9 path];
  unsigned int v12 = [v10 fileExistsAtPath:v11 isDirectory:&v28];

  if (v28) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = v12;
  }
  if (v13 == 1)
  {
    id v14 = +[NSFileManager defaultManager];
    id v27 = 0;
    unsigned __int8 v15 = [v14 removeItemAtURL:v9 error:&v27];
    id v16 = v27;

    if ((v15 & 1) == 0)
    {
      unint64_t v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v25 = [v16 code];
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = (uint64_t)v16;
        __int16 v32 = 2048;
        id v33 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error removing file at location of asset downloads directory: %@ [%ld]", buf, 0x16u);
      }
    }
    goto LABEL_21;
  }
  id v16 = 0;
  id v19 = 0;
  if ((v12 & 1) == 0)
  {
LABEL_21:
    id v20 = +[NSFileManager defaultManager];
    id v26 = v16;
    unsigned __int8 v21 = [v20 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v19 = v26;

    if ((v21 & 1) == 0)
    {
      id v22 = (id)qword_1000CB148;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v24 = [v19 code];
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = (uint64_t)v19;
        __int16 v32 = 2048;
        id v33 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error creating asset downloads directory: %@ [%ld]", buf, 0x16u);
      }
    }
  }

LABEL_26:

  return v9;
}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v7 = a3;
  id v6 = [(NSMutableDictionary *)self->_identifiersToAVWrappers objectForKeyedSubscript:a4];
  [v7 setCountOfBytesSent:0];
  [v7 setCountOfBytesReceived:[v6 countOfBytesWritten]];
  [v7 setCountOfBytesExpectedToSend:0];
  [v7 setCountOfBytesExpectedToReceive:[v6 countOfBytesExpectedToWrite]];
}

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100071F84;
  v9[3] = &unk_1000B63A8;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  id v48 = a3;
  tasksDB = self->super.tasksDB;
  if (tasksDB)
  {
    id v5 = [(NDBackgroundSession *)self identifier];
    id v6 = [(NDBackgroundSession *)self uuid];
    tasksDB = [tasksDB _getAllTasksFromDBForSession:v5 sessionUUID:v6];
  }
  id v49 = +[NSMutableArray array];
  __int16 v53 = self;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = tasksDB;
  id v7 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v7)
  {
    uint64_t v51 = *(void *)v56;
    *(void *)&long long v8 = 138543618;
    long long v47 = v8;
    do
    {
      id v52 = v7;
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v56 != v51) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v11 = [NSNumber numberWithUnsignedInteger:[v10 identifier:v47]];
        unsigned int v12 = [v10 _destinationURLToUse];
        unsigned int v13 = v12;
        if (v12)
        {
          id v14 = [v12 URLByDeletingLastPathComponent];
          id v54 = 0;
          unsigned __int8 v15 = [v14 checkResourceIsReachableAndReturnError:&v54];
          id v16 = v54;

          if ((v15 & 1) == 0)
          {
            unint64_t v17 = (id)qword_1000CB148;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [v10 _loggableDescription];
              *(_DWORD *)buf = 138543874;
              id v62 = v18;
              __int16 v63 = 2112;
              id v64 = v13;
              __int16 v65 = 2112;
              id v66 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not restoring task due to unreachable destination folder %@ (%@)", buf, 0x20u);
            }
            [v10 setState:3];
            id v19 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-3000 failingURL:0];
            [v10 setError:v19];

            id v20 = [PendingCallback alloc];
            id v21 = [v10 identifier];
            id v22 = [v10 error];
            v60[0] = v22;
            int v23 = +[NSNull null];
            v60[1] = v23;
            v60[2] = &__NSDictionary0__struct;
            id v24 = +[NSArray arrayWithObjects:v60 count:3];
            id v25 = [(PendingCallback *)v20 initWithCallbackType:0 taskIdentifier:v21 args:v24];

            [(NDCallbackQueue *)v53->super._callbackQueue addPendingCallback:v25 wakeRequirement:0];
          }
        }
        if ([v10 initializedWithAVAsset] && (uint64_t)objc_msgSend(v10, "state") <= 2)
        {
          id v26 = [v10 AVAssetURL];
          id v27 = [v10 assetOptionsPlist];
          char v28 = +[AVURLAsset assetForNSURLSessionWithURL:v26 propertyList:v27];

          [v10 setAVURLAsset:v28];
          [v10 setAVAssetDownloadToken:[v28 downloadToken]];
          if (!v28
            || ([v28 URL],
                uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                BOOL v30 = v29 == 0,
                v29,
                v30))
          {
            id v34 = (id)qword_1000CB148;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              id v44 = [v10 _loggableDescription];
              id v45 = [v10 AVAssetDownloadToken];
              *(_DWORD *)buf = v47;
              id v62 = v44;
              __int16 v63 = 2048;
              id v64 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@ failed to re-instantiate AVURLAsset with token %llu", buf, 0x16u);
            }
            [v10 setState:3];
            id v35 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-1 failingURL:0];
            [v10 setError:v35];

            v36 = [PendingCallback alloc];
            id v37 = [v10 identifier];
            uint64_t v38 = [v10 error];
            v59[0] = v38;
            id v39 = +[NSNull null];
            v59[1] = v39;
            v59[2] = &__NSDictionary0__struct;
            id v40 = +[NSArray arrayWithObjects:v59 count:3];
            uint64_t v31 = [(PendingCallback *)v36 initWithCallbackType:0 taskIdentifier:v37 args:v40];

            [(NDCallbackQueue *)v53->super._callbackQueue addPendingCallback:v31 wakeRequirement:0];
          }
          else
          {
            uint64_t v31 = (id)qword_1000CB148;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              id v32 = [v10 _loggableDescription];
              id v33 = [v10 AVAssetDownloadToken];
              *(_DWORD *)buf = v47;
              id v62 = v32;
              __int16 v63 = 2048;
              id v64 = v33;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ restored asset with token %llu from sqlite", buf, 0x16u);
            }
          }
        }
        if ((uint64_t)[v10 state] <= 2)
        {
          if ([v10 hasStarted])
          {
            id v41 = (id)qword_1000CB148;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              id v42 = [v10 _loggableDescription];
              *(_DWORD *)buf = 138543362;
              id v62 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ adding to outstanding tasks list", buf, 0xCu);
            }
            -[NDBackgroundSession addOutstandingTaskWithIdentifier:](v53, "addOutstandingTaskWithIdentifier:", [v11 unsignedIntegerValue]);
            [v49 addObject:v10];
          }
          else
          {
            id v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 identifier]);
            [v48 addObject:v43];
          }
        }
        [(NSMutableDictionary *)v53->super._identifiersToTaskInfo setObject:v10 forKeyedSubscript:v11];
      }
      id v7 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v7);
  }

  return v49;
}

- (void)cancelThroughputMonitorForWrapper:(unint64_t)a3
{
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v9 = [(NSMutableDictionary *)identifiersToThroughputMonitors objectForKeyedSubscript:v6];

  [v9 cancel];
  id v7 = self->_identifiersToThroughputMonitors;
  long long v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v7 removeObjectForKey:v8];
}

- (void)setupThroughputMonitorForWrapper:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  unsigned int v9 = [v8 isDiscretionary];
  if (self->super._discretionary) {
    uint64_t v10 = v9 | 2;
  }
  else {
    uint64_t v10 = v9;
  }
  if (self->super._infersDiscretionary
    || [(NDApplication *)self->super._clientApplication canBeSuspended])
  {
    v10 |= 4uLL;
  }
  id v11 = -[NDAVThroughputMonitor initWithWrapper:monitoredApplication:priority:options:queue:]([NDAVThroughputMonitor alloc], "initWithWrapper:monitoredApplication:priority:options:queue:", v14, self->super._monitoredApplication, [v8 basePriority], v10, self->super._workQueue);
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  unsigned int v13 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)identifiersToThroughputMonitors setObject:v11 forKeyedSubscript:v13];
}

- (void)cancelDelayedCompletionWakeTimer
{
  if (self->_delayedWakeTimer)
  {
    id v3 = (id)qword_1000CB148;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NDBackgroundSession *)self clientBundleID];
      id v5 = [(NDBackgroundSession *)self identifier];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling delayed wake for session <%@>.<%@>", (uint8_t *)&v7, 0x16u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_delayedWakeTimer);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = 0;
  }
}

- (void)setupDelayedCompletionWakeTimer
{
  if (!self->_delayedWakeTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->super._workQueue);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = v3;

    id v5 = self->_delayedWakeTimer;
    if (v5)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000733C0;
      handler[3] = &unk_1000B6380;
      handler[4] = self;
      dispatch_source_set_event_handler(v5, handler);
      id v6 = self->_delayedWakeTimer;
      dispatch_time_t v7 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_delayedWakeTimer);
      id v8 = (id)qword_1000CB148;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = [(NDBackgroundSession *)self clientBundleID];
        uint64_t v10 = [(NDBackgroundSession *)self identifier];
        *(_DWORD *)buf = 138412546;
        unsigned int v13 = v9;
        __int16 v14 = 2112;
        unsigned __int8 v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduled delayed wake for session <%@>.<%@>", buf, 0x16u);
      }
    }
  }
}

@end