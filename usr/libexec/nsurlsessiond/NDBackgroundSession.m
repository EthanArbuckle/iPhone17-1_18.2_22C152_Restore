@interface NDBackgroundSession
- (BOOL)clientIsActive;
- (BOOL)currentDiscretionaryStatus:(id)a3 withOptionalTaskInfo:(id)a4;
- (BOOL)errorIfBlockedTracker:(id)a3 url:(id)a4;
- (BOOL)finalizeTaskCompletionWithSuppressedWake:(BOOL)a3;
- (BOOL)hasConnectedClient;
- (BOOL)retryTask:(id)a3 originalError:(id)a4 transactionMetrics:(id)a5;
- (BOOL)sessionHasOutstandingTasks;
- (BOOL)trustPassesExtendedValidation:(__SecTrust *)a3;
- (NDBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11;
- (NDBackgroundSessionDelegate)delegate;
- (NSString)clientBundleID;
- (NSString)identifier;
- (NSString)monitoredAppBundleID;
- (NSString)secondaryID;
- (NSString)sharedContainerIdentifier;
- (NSUUID)uuid;
- (double)defaultWindowDurationForResourceTimeout:(double)a3;
- (id)_URLSession:(id)a3 downloadTaskNeedsDownloadDirectory:(id)a4;
- (id)adjustDiscretionaryStatusForTaskInfo:(id)a3;
- (id)clientErrorForError:(id)a3;
- (id)configurationWithClientConfiguration:(id)a3 discretionary:(BOOL)a4;
- (id)createNewTaskFromInfo:(id)a3;
- (id)descriptionForRequest:(id)a3;
- (id)descriptionForTCPConnectionWaitingReason:(int64_t)a3;
- (id)descriptionForTaskWithIdentifier:(unint64_t)a3;
- (id)getClientProxy;
- (id)getTLSSessionCachePrefix;
- (id)getTasksForReconnection;
- (id)inputStreamWithFileHandle:(id)a3 taskIdentifier:(unint64_t)a4;
- (id)invalidateReply;
- (id)makeTempUploadFile:(id)a3 withExtensionData:(id)a4;
- (id)requestWithAdjustedWindowForTaskInfo:(id)a3;
- (id)restoreCompletedTask:(id)a3;
- (id)restoreInProgressTask:(id)a3;
- (id)restoreTask:(id)a3 isOutstanding:(BOOL *)a4;
- (id)restoreTasks:(BOOL *)a3;
- (id)restoreTasksFromArchivedInfo:(id)a3;
- (id)restoreTasksFromSqliteDB:(id)a3;
- (id)sanitizeTaskProperties:(id)a3;
- (id)sessionForDiscretionaryStatus:(BOOL)a3;
- (id)setupDownloadDirectory;
- (id)tasksArchivePath;
- (int64_t)priorityForDiscretionaryStatus:(BOOL)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5;
- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_URLSession:(id)a3 downloadTask:(id)a4 didReceiveResponse:(id)a5;
- (void)_URLSession:(id)a3 openFileAtPath:(id)a4 mode:(int)a5 completionHandler:(id)a6;
- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)addOutstandingTaskWithIdentifier:(unint64_t)a3;
- (void)allowReconnect;
- (void)applicationWasSuspended:(id)a3 pid:(int)a4;
- (void)archiveTimerFired;
- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12;
- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15;
- (void)backgroundUpdatesEnabledForApplication:(id)a3;
- (void)cancelMonitorForTask:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4;
- (void)cancelTasksRequiringClientConnectionAndResumeUnstartedTasks;
- (void)cleanupSessionWithCompletionHandler:(id)a3;
- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3;
- (void)clientApplicationWasReinstalled;
- (void)clientDidDisconnect;
- (void)configureAdditionalPropertiesOnTask:(id)a3 taskInfo:(id)a4;
- (void)configureTask:(id)a3 withTaskInfo:(id)a4;
- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7;
- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 downloadFilePath:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
- (void)downloadTaskWithResumeData:(id)a3 identifier:(unint64_t)a4 uniqueIdentifier:(id)a5 reply:(id)a6;
- (void)enqueueTaskWithIdentifier:(unint64_t)a3;
- (void)ensureSessionDownloadDirectoryExists;
- (void)errorOccurredDuringAuthCallbackDelivery:(id)a3 completionHandler:(id)a4;
- (void)errorOccurredDuringFinishedCallbackDelivery:(id)a3;
- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)fillInPropertiesForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)handleCompletionOfTask:(id)a3 identifier:(unint64_t)a4 taskInfo:(id)a5 isRecoverable:(BOOL)a6 suppressWake:(BOOL)a7;
- (void)handleEarliestBeginDateForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4;
- (void)handleWillBeginDelayedRequestForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4;
- (void)invalidateWithReply:(id)a3;
- (void)obliterate;
- (void)performCommonSetupForTask:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5 discretionaryStatus:(BOOL)a6;
- (void)pingForXPCObjectValidityWithReply:(id)a3;
- (void)queueUpdatesForTask:(id)a3 updateType:(unint64_t)a4 highPriority:(BOOL)a5;
- (void)reconnectClient:(id)a3 withCompletion:(id)a4;
- (void)removeDownloadFileForTaskInfo:(id)a3;
- (void)removeOutstandingTaskWithIdentifier:(unint64_t)a3;
- (void)removeUploadFileForTaskInfo:(id)a3;
- (void)requeueTask:(unint64_t)a3;
- (void)requeueTask:(unint64_t)a3 skipResume:(BOOL)a4;
- (void)resetStorageWithReply:(id)a3;
- (void)resumeTaskWithIdentifier:(unint64_t)a3 withProperties:(id)a4;
- (void)setBytesPerSecondLimit:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDescription:(id)a3 forTask:(unint64_t)a4;
- (void)setDiscretionaryOverride:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setExpectedProgressTarget:(unint64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setInvalidateReply:(id)a3;
- (void)setLoadingPoolPriority:(double)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setPropertyOnStreamWithIdentifier:(unint64_t)a3 propDict:(id)a4 propKey:(id)a5 withReply:(id)a6;
- (void)setSharedContainerIdentifier:(id)a3;
- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setTLSSessionCachePrefix:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setupDASPropertiesOnTask:(id)a3 taskInfo:(id)a4 discretionaryStatus:(BOOL)a5;
- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5;
- (void)storeTaskInfoUpdates:(BOOL)a3;
- (void)suspendTaskWithIdentifier:(unint64_t)a3;
- (void)taskShouldResume:(unint64_t)a3;
- (void)taskShouldSuspend:(unint64_t)a3;
- (void)triggerPowerlogPeriodicUpdate;
- (void)updateOptions:(id)a3;
- (void)updateTaskInfoBasedOnCurrentDiscretionaryStatus:(id)a3;
- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 sandboxExtensionData:(id)a6 identifier:(unint64_t)a7 uniqueIdentifier:(id)a8 potentialCredentials:(id)a9 reply:(id)a10;
- (void)uploadTaskWithResumableUploadState:(id)a3 request:(id)a4 originalRequest:(id)a5 fromFile:(id)a6 sandboxExtensionData:(id)a7 identifier:(unint64_t)a8 uniqueIdentifier:(id)a9 potentialCredentials:(id)a10 reply:(id)a11;
- (void)wakeUpClient:(int64_t)a3;
@end

@implementation NDBackgroundSession

- (void)setTLSSessionCachePrefix:(id)a3
{
  id v4 = a3;
  -[NSURLSession set_tlsSessionCachePrefix:](self->_userInitiatedSession, "set_tlsSessionCachePrefix:");
  [(NSURLSession *)self->_discretionaryPrioritySession set_tlsSessionCachePrefix:v4];
}

- (void)archiveTimerFired
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C668;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)storeTaskInfoUpdates:(BOOL)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FB8;
  block[3] = &unk_1000B53A0;
  BOOL v8 = a3;
  *(CFAbsoluteTime *)&void block[5] = Current;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (NDBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  BOOL v137 = a5;
  id v15 = a3;
  id v140 = a4;
  id v147 = a7;
  id v145 = a8;
  id obj = a9;
  id v141 = a10;
  id v142 = a11;
  v148.receiver = self;
  v148.super_class = (Class)NDBackgroundSession;
  v16 = [(NDBackgroundSession *)&v148 init];
  if (!v16)
  {
LABEL_67:
    v88 = v16;
    goto LABEL_68;
  }
  v17 = +[Daemon sharedDaemon];
  [v17 addTransaction];

  v18 = [v147 objectForKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
  v19 = v18;
  if (v18)
  {
    v135 = v16 + 264;
    id v20 = v18;
  }
  else
  {
    id v20 = objc_alloc_init((Class)NSUUID);
    v135 = v16 + 264;
  }
  v21 = (void *)*((void *)v16 + 33);
  *((void *)v16 + 33) = v20;

  objc_storeWeak((id *)v16 + 32, obj);
  v22 = (uint64_t *)(v16 + 280);
  objc_storeStrong((id *)v16 + 35, a4);
  v23 = [v15 _sourceApplicationBundleIdentifier];
  if (v23)
  {
    id v24 = [v15 _sourceApplicationBundleIdentifier];
    v25 = (id *)(v16 + 288);
  }
  else
  {
    v25 = (id *)(v16 + 288);
    id v24 = *((id *)v16 + 35);
  }
  v26 = (void *)*((void *)v16 + 36);
  *((void *)v16 + 36) = v24;

  v16[248] = 1;
  uint64_t v27 = +[NSMutableDictionary dictionary];
  v28 = (void *)*((void *)v16 + 23);
  *((void *)v16 + 23) = v27;

  id v144 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:*v22 error:0];
  uint64_t v29 = [v15 _sourceApplicationSecondaryIdentifier];
  v30 = (void *)*((void *)v16 + 37);
  *((void *)v16 + 37) = v29;

  v143 = +[NDCloudContainer containerIDForPrimaryIdentifier:*((void *)v16 + 36) secondaryIdentifier:*((void *)v16 + 37)];
  if (v143)
  {
    v31 = +[NDCloudContainer bundleIDForPrimaryIdentifier:*((void *)v16 + 36) secondaryIdentifier:*((void *)v16 + 37)];
    v32 = (id)qword_1000CB148;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v16 uuid];
      v34 = (void *)*v22;
      *(_DWORD *)buf = 138544130;
      id v150 = v33;
      __int16 v151 = 2112;
      id v152 = v34;
      __int16 v153 = 2112;
      id v154 = v143;
      __int16 v155 = 2112;
      id v156 = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of cloud documents container with container id: %@ and bundle id: %@", buf, 0x2Au);
    }
    if (v31) {
      v35 = v31;
    }
    else {
      v35 = v143;
    }
    objc_storeStrong(v25, v35);
    uint64_t v36 = +[NDApplication cloudContainerWithIdentifier:v143];
    v37 = (void *)*((void *)v16 + 27);
    *((void *)v16 + 27) = v36;
  }
  v38 = (id *)(v16 + 216);
  if (!*((void *)v16 + 27))
  {
    id v39 = *v25;
    v40 = [v15 sharedContainerIdentifier];
    v41 = +[NDFPProvider providerIDForBundle:v39 sharedContainerIdentifier:v40];

    if (v41)
    {
      uint64_t v42 = +[NDApplication fileProviderWithIdentifer:v41 applicationIdentifier:*v25];
      id v43 = *v38;
      id *v38 = (id)v42;

      v44 = (id)qword_1000CB148;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [v16 uuid];
        v46 = (void *)*v22;
        id v47 = *v25;
        *(_DWORD *)buf = 138544130;
        id v150 = v45;
        __int16 v151 = 2112;
        id v152 = v46;
        __int16 v153 = 2112;
        id v154 = v41;
        __int16 v155 = 2112;
        id v156 = v47;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of file provider id: %@ and bundle id: %@", buf, 0x2Au);
      }
    }
  }
  if (v144 && sub_100010184(v144))
  {
    v48 = (id)qword_1000CB148;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [v16 uuid];
      v50 = (void *)*v22;
      *(_DWORD *)buf = 138543618;
      id v150 = v49;
      __int16 v151 = 2112;
      id v152 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is an independent extension", buf, 0x16u);
    }
    uint64_t v51 = +[NDApplication chronoKitExtensionWithIdentifier:*v22];
    v52 = (void *)*((void *)v16 + 4);
    *((void *)v16 + 4) = v51;
  }
  v53 = (void *)*((void *)v16 + 4);
  if (v53)
  {
    id v54 = v53;
  }
  else
  {
    uint64_t v55 = *v22;
    if (v137) {
      +[NDApplication springboardApplicationWithBundleIdentifier:v55];
    }
    else {
    id v54 = +[NDApplication applicationWithIdentifier:v55];
    }
  }
  v56 = (void *)*((void *)v16 + 4);
  *((void *)v16 + 4) = v54;

  if (!*((void *)v16 + 27))
  {
    if ([*v25 isEqualToString:*v22])
    {
      objc_storeStrong((id *)v16 + 27, *((id *)v16 + 4));
      v57 = (id)qword_1000CB148;
      BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      if (v137)
      {
        if (v58)
        {
          v59 = [v16 uuid];
          id v60 = *v25;
          *(_DWORD *)buf = 138543618;
          id v150 = v59;
          __int16 v151 = 2112;
          id v152 = v60;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is a SpringBoard application", buf, 0x16u);
        }
      }
      else if (v58)
      {
        v64 = [v16 uuid];
        id v65 = *v25;
        *(_DWORD *)buf = 138543618;
        id v150 = v64;
        __int16 v151 = 2112;
        id v152 = v65;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is a daemon or non-SpringBoard application", buf, 0x16u);
      }
    }
    else
    {
      unsigned int v61 = +[NDApplication springBoardApplicationExistsWithIdentifier:*v25];
      id v62 = *v25;
      if (v61) {
        +[NDApplication springboardApplicationWithBundleIdentifier:v62];
      }
      else {
      uint64_t v63 = +[NDApplication applicationWithIdentifier:v62];
      }
      id v66 = *v38;
      id *v38 = (id)v63;

      v57 = (id)qword_1000CB148;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [v16 uuid];
        v68 = (void *)*v22;
        id v69 = *v25;
        *(_DWORD *)buf = 138544130;
        id v150 = v67;
        __int16 v151 = 2112;
        id v152 = v68;
        __int16 v153 = 2112;
        id v154 = v69;
        __int16 v155 = 1024;
        LODWORD(v156) = v61;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of application %@, impersonatingSpringBoardApp: %d", buf, 0x26u);
      }
    }
  }
  uint64_t v70 = [v15 identifier];
  v71 = (void *)*((void *)v16 + 34);
  *((void *)v16 + 34) = v70;

  uint64_t v72 = [v15 sharedContainerIdentifier];
  v73 = (void *)*((void *)v16 + 39);
  *((void *)v16 + 39) = v72;

  v74 = +[NDFileUtilities sessionPath:*((void *)v16 + 34) forBundleID:*((void *)v16 + 35)];
  uint64_t v75 = +[NSURL fileURLWithPath:v74];
  v76 = (void *)*((void *)v16 + 14);
  *((void *)v16 + 14) = v75;

  v77 = [v15 _directoryForDownloadedFiles];
  v78 = v77;
  if (v77)
  {
    id v79 = v77;
  }
  else
  {
    id v79 = [v16 setupDownloadDirectory];
  }
  v80 = (void *)*((void *)v16 + 15);
  *((void *)v16 + 15) = v79;

  uint64_t v81 = [*((id *)v16 + 14) URLByAppendingPathComponent:@"Uploads"];
  v82 = (void *)*((void *)v16 + 16);
  *((void *)v16 + 16) = v81;

  if (*((void *)v16 + 15))
  {
    objc_storeStrong((id *)v16 + 25, a10);
    objc_storeStrong((id *)v16 + 29, a8);
    v83 = [[NDCredentialStorage alloc] initWithDelegate:v16 forBundleID:*((void *)v16 + 35)];
    v84 = (void *)*((void *)v16 + 3);
    *((void *)v16 + 3) = v83;

    v85 = [v16 configurationWithClientConfiguration:v15 discretionary:0];
    v138 = [v16 configurationWithClientConfiguration:v15 discretionary:1];
    v16[142] = [v15 isDiscretionary];
    if ([v15 sessionSendsLaunchEvents]) {
      unsigned __int8 v86 = 1;
    }
    else {
      unsigned __int8 v86 = [v15 _sessionSendsLaunchOnDemandEvents];
    }
    v16[141] = v86;
    v89 = +[Daemon sharedDaemon];
    unsigned int v90 = [v89 isInSyncBubble];

    if (v90) {
      v16[141] = 0;
    }
    v16[136] = [v15 _performsEVCertCheck];
    [v16 updateOptions:v147];
    uint64_t v91 = +[NSURLSession _sessionWithConfiguration:v85 delegate:v16 delegateDispatchQueue:*((void *)v16 + 25)];
    v92 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v91;

    uint64_t v93 = +[NSURLSession _sessionWithConfiguration:v138 delegate:v16 delegateDispatchQueue:*((void *)v16 + 25)];
    v94 = (void *)*((void *)v16 + 2);
    *((void *)v16 + 2) = v93;

    [*((id *)v16 + 2) _useTLSSessionCacheFromSession:*((void *)v16 + 1)];
    v95 = [[NDCallbackQueue alloc] initWithDelegate:v16];
    v96 = (void *)*((void *)v16 + 26);
    *((void *)v16 + 26) = v95;

    uint64_t v97 = +[NSMutableDictionary dictionary];
    v98 = (void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v97;

    uint64_t v99 = +[NSMutableDictionary dictionary];
    v100 = (void *)*((void *)v16 + 7);
    *((void *)v16 + 7) = v99;

    uint64_t v101 = +[NSMutableDictionary dictionary];
    v102 = (void *)*((void *)v16 + 28);
    *((void *)v16 + 28) = v101;

    uint64_t v103 = +[NSMutableDictionary dictionary];
    v104 = (void *)*((void *)v16 + 8);
    *((void *)v16 + 8) = v103;

    uint64_t v105 = +[NSMutableDictionary dictionary];
    v106 = (void *)*((void *)v16 + 9);
    *((void *)v16 + 9) = v105;

    uint64_t v107 = +[NSMutableArray array];
    v108 = (void *)*((void *)v16 + 11);
    *((void *)v16 + 11) = v107;

    v16[147] = v145 != 0;
    v16[192] = [v15 _allowsRetryForBackgroundDataTasks];
    if (v16[146]) {
      unsigned __int8 v109 = 1;
    }
    else {
      unsigned __int8 v109 = [v15 _infersDiscretionaryFromOriginatingClient];
    }
    v16[146] = v109;
    *(_WORD *)(v16 + 143) = 0;
    *((_DWORD *)v16 + 40) = [v15 _neTrackerTCCResult];
    *((_DWORD *)v16 + 41) = -1;
    +[NDFileUtilities createDirectoryAtURL:*((void *)v16 + 14)];
    +[NDFileUtilities createDirectoryAtURL:*((void *)v16 + 16)];
    if (*((void *)v16 + 29))
    {
      id v110 = [v15 copy];
      id v111 = [v147 mutableCopy];
      [v111 setObject:*v135 forKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
      v112 = [*((id *)v16 + 14) URLByAppendingPathComponent:@"configuration.plist"];
      v113 = [v112 path];

      v114 = [*((id *)v16 + 14) URLByAppendingPathComponent:@"options.plist"];
      v115 = [v114 path];

      v116 = +[NSKeyedArchiver archivedDataWithRootObject:v110 requiringSecureCoding:1 error:0];
      [v116 writeToFile:v113 atomically:1];

      v117 = +[NSKeyedArchiver archivedDataWithRootObject:v111 requiringSecureCoding:1 error:0];
      [v117 writeToFile:v115 atomically:1];
    }
    if (*v38) {
      [*v38 addObserver:v16];
    }
    objc_storeStrong((id *)v16 + 30, a11);
    v118 = (id)qword_1000CB148;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v136 = v85;
      id v139 = [v16 uuid];
      v119 = (void *)*((void *)v16 + 34);
      v120 = (void *)*((void *)v16 + 35);
      v121 = (void *)*((void *)v16 + 33);
      [v15 timeoutIntervalForResource];
      uint64_t v123 = v122;
      [v15 timeoutIntervalForRequest];
      uint64_t v125 = v124;
      unsigned int v126 = [v15 allowsCellularAccess];
      unsigned int v127 = [v15 allowsExpensiveNetworkAccess];
      v134 = [v15 _sourceApplicationBundleIdentifier];
      v128 = [v15 _sourceApplicationSecondaryIdentifier];
      int v129 = v16[248];
      unsigned int v130 = [v15 _allowsUCA];
      *(_DWORD *)buf = 138546178;
      id v150 = v139;
      __int16 v151 = 2114;
      id v152 = v121;
      __int16 v153 = 2112;
      id v154 = v120;
      __int16 v155 = 2112;
      id v156 = v119;
      __int16 v157 = 2048;
      uint64_t v158 = v123;
      __int16 v159 = 2048;
      uint64_t v160 = v125;
      __int16 v161 = 1024;
      unsigned int v162 = v126;
      __int16 v163 = 1024;
      unsigned int v164 = v127;
      __int16 v165 = 2112;
      v166 = v134;
      __int16 v167 = 2112;
      v168 = v128;
      __int16 v169 = 1024;
      int v170 = v129;
      __int16 v171 = 1024;
      unsigned int v172 = v130;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session <%{public}@> is for <%@>.<%@> using resource timeout: %f, request timeout: %f allowsCellularAccess: %d, allowsExpensiveAccess: %d, _sourceApplicationBundleIdentifier: %@, _sourceApplicationSecondaryIdentifier: %@, hasSqliteSupport: %u, _allowsUCA: %d", buf, 0x6Au);

      v85 = v136;
    }

    goto LABEL_67;
  }
  v87 = (id)qword_1000CB148;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
  {
    v132 = [v16 uuid];
    v133 = (void *)*v22;
    *(_DWORD *)buf = 138543618;
    id v150 = v132;
    __int16 v151 = 2112;
    id v152 = v133;
    _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't find out download directory for %@. Not creating session", buf, 0x16u);
  }
  v88 = 0;
LABEL_68:

  return v88;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 264, 1);
}

- (id)configurationWithClientConfiguration:(id)a3 discretionary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v6 timeoutIntervalForRequest];
  [v7 setTimeoutIntervalForRequest:];
  [v6 timeoutIntervalForResource];
  if (v8 == 0.0) {
    [v7 timeoutIntervalForResource];
  }
  [v7 setTimeoutIntervalForResource:];
  v9 = [v6 connectionProxyDictionary];
  [v7 setConnectionProxyDictionary:v9];

  [v7 setTLSMinimumSupportedProtocol:[v6 TLSMinimumSupportedProtocol]];
  [v7 setTLSMaximumSupportedProtocol:[v6 TLSMaximumSupportedProtocol]];
  v10 = [v6 HTTPAdditionalHeaders];
  [v7 setHTTPAdditionalHeaders:v10];

  [v7 setHTTPMaximumConnectionsPerHost:[v6 HTTPMaximumConnectionsPerHost]];
  [v7 setNetworkServiceType:[v6 networkServiceType]];
  v11 = [v6 _authenticatorStatusCodes];
  [v7 set_authenticatorStatusCodes:v11];

  v12 = [v6 _atsContext];
  [v7 set_atsContext:v12];

  [v7 set_allowsTLSFalseStart:[v6 _allowsTLSFalseStart]];
  [v7 set_allowsTLSFallback:[v6 _allowsTLSFallback]];
  v13 = [v6 _tlsTrustPinningPolicyName];
  [v7 set_tlsTrustPinningPolicyName:v13];

  [v7 set_allowsTLSECH:[v6 _allowsTLSECH]];
  [v7 set_reportsDataStalls:[v6 _reportsDataStalls]];
  [v7 set_TCPAdaptiveReadTimeout:[v6 _TCPAdaptiveReadTimeout]];
  [v7 set_TCPAdaptiveWriteTimeout:[v6 _TCPAdaptiveWriteTimeout]];
  [v7 set_onBehalfOfPairedDevice:[v6 _onBehalfOfPairedDevice]];
  [v7 set_requiresSustainedDataDelivery:[v6 _requiresSustainedDataDelivery]];
  [v7 set_IDSMessageTimeout:[v6 _IDSMessageTimeout]];
  [v7 set_alwaysPerformDefaultTrustEvaluation:[v6 _alwaysPerformDefaultTrustEvaluation]];
  [v7 set_prefersInfraWiFi:[v6 _prefersInfraWiFi]];
  if ([(NDApplication *)self->_clientApplication canBeSuspended]) {
    [v7 setNetworkServiceType:3];
  }
  v14 = [v6 _maximumWatchCellularTransferSize];
  [v7 set_maximumWatchCellularTransferSize:v14];

  [v7 setHTTPCookieStorage:0];
  [v7 setURLCache:0];
  [v7 setURLCredentialStorage:self->_credentialStorage];
  [v7 setAllowsCellularAccess:[v6 allowsCellularAccess]];
  [v7 setWaitsForConnectivity:0];
  [v7 setShouldUseExtendedBackgroundIdleMode:0];
  [v7 setAllowsExpensiveNetworkAccess:[v6 allowsExpensiveNetworkAccess]];
  [v7 setAllowsConstrainedNetworkAccess:[v6 allowsConstrainedNetworkAccess]];
  [v7 _setAllowsUCA:[v6 _allowsUCA]];
  [v7 set_allowsVirtualInterfaces:[v6 _allowsVirtualInterfaces]];
  [v7 set_multipathAlternatePort:[v6 _multipathAlternatePort]];
  [v7 set_allowsPowerNapScheduling:[v6 _allowsPowerNapScheduling]];
  [v7 set_allowsHSTSWithUntrustedRootCertificate:[v6 _allowsHSTSWithUntrustedRootCertificate]];
  uint64_t v15 = [v6 _connectionPoolName];
  v16 = (void *)v15;
  if (v15) {
    CFStringRef v17 = (const __CFString *)v15;
  }
  else {
    CFStringRef v17 = @"NSURLSessionBackgroundPoolName";
  }
  [v7 set_tcpConnectionPoolName:v17];

  v18 = +[Daemon sharedDaemon];
  if ([v18 isInSyncBubble])
  {
    v19 = [v6 _connectionPoolName];

    if (v19) {
      goto LABEL_12;
    }
    v18 = +[NSString stringWithFormat:@"NSURLSessionBackgroundPoolName-sync-%d", geteuid()];
    [v7 set_tcpConnectionPoolName:v18];
  }

LABEL_12:
  [v7 set_connectionCachePurgeTimeout:1.0];
  [v7 set_longLivedConnectionCachePurgeTimeout:1.0];
  [v7 set_preventsIdleSleepOnceConnected:1];
  [v7 set_timingDataOptions:[v6 _timingDataOptions]];
  [v7 set_shouldSkipPreferredClientCertificateLookup:[v6 _shouldSkipPreferredClientCertificateLookup]];
  [v7 set_requiresPowerPluggedIn:[v6 _requiresPowerPluggedIn]];
  [v7 set_sourceApplicationBundleIdentifier:self->_monitoredAppBundleID];
  [v7 set_sourceApplicationSecondaryIdentifier:self->_secondaryID];
  [v7 set_watchExtensionBundleIdentifier:self->_watchExtensionBundleIdentifier];
  id v20 = [v6 _sourceApplicationAuditTokenData];
  [v7 set_sourceApplicationAuditTokenData:v20];

  v21 = [v6 _directoryForDownloadedFiles];
  [v7 set_directoryForDownloadedFiles:v21];

  v22 = +[Daemon sharedDaemon];
  unsigned int v23 = [v22 isPrivileged];

  if (v23) {
    [v7 set_requiresClientToOpenFiles:1];
  }
  [v7 set_duetPreauthorized:[v6 _duetPreauthorized]];
  [v7 set_loggingPrivacyLevel:[v6 _loggingPrivacyLevel]];
  [v7 set_duetPreClearedMode:[v6 _duetPreClearedMode]];
  [v7 set_pidForHAR:[v6 _pidForHAR]];
  id v24 = +[NSMutableDictionary dictionary];
  if ([v6 _duetPreauthorized])
  {
    v25 = 0;
  }
  else
  {
    v25 = +[NSMutableDictionary dictionary];
  }
  [v24 setObject:kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyLargeDownload];
  [v24 setObject:kCFBooleanTrue forKeyedSubscript:kCFStreamPropertyIndefiniteConnection];
  [v24 setObject:&off_1000B8980 forKeyedSubscript:_kCFStreamPropertyWatchdogTimeout];
  [v24 setObject:&off_1000B8998 forKeyedSubscript:_kCFStreamPropertyIndefiniteConnectionKickInterval];
  if (v4)
  {
    if (v25)
    {
      [v7 timeoutIntervalForResource];
      [(NDBackgroundSession *)self defaultWindowDurationForResourceTimeout:"defaultWindowDurationForResourceTimeout:"];
      uint64_t v27 = +[NSNumber numberWithInteger:(uint64_t)v26];
      [v25 setObject:v27 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];

      [v25 setObject:&off_1000B89B0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];
      [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionIsDiscretionary];
      [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFStreamPropertyDUETConditional];
      if ([v6 isDiscretionary]
        && ([v6 _clientIsNotExplicitlyDiscretionary] & 1) == 0)
      {
        [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionClientOptInDiscretionary];
      }
      else
      {
        [v7 set_clientIsNotExplicitlyDiscretionary:1];
      }
      if ([v6 _xpcActivityBudgeted])
      {
        [v25 setObject:&off_1000B89C8 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
      }
      else
      {
        v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 _duetPreClearedMode]);
        [v25 setObject:v30 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
      }
    }
    [v7 set_forcedNetworkServiceType:5];
    [v7 setDiscretionary:1];
  }
  else if (v25)
  {
    [v25 setObject:&off_1000B89E0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];
    [v25 setObject:&off_1000B89B0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];
    [v25 setObject:&__kCFBooleanFalse forKeyedSubscript:kConditionalConnectionIsDiscretionary];
    if ([v6 _xpcActivityBudgeted])
    {
      if ([v6 _xpcActivityBudgeted] == 1) {
        v28 = &off_1000B89C8;
      }
      else {
        v28 = &off_1000B89F8;
      }
      [v25 setObject:v28 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
    }
    else
    {
      uint64_t v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 _duetPreClearedMode]);
      [v25 setObject:v29 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
    }
  }
  v31 = +[Daemon sharedDaemon];
  unsigned int v32 = [v31 isInSyncBubble];

  if (v32) {
    [v7 set_forcedNetworkServiceType:5];
  }
  if (v25) {
    [v24 setObject:v25 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
  }
  [v7 set_socketStreamProperties:v24];
  [v7 setSkip_download_unlink:1];

  return v7;
}

- (void)updateOptions:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsWillSendRequestForEstablishedConnectionKey"];
  self->_clientImplementsWillSendRequest = [v4 BOOLValue];

  v5 = [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsWillBeginDelayedRequestKey"];
  self->_clientImplementsWillBeginDelayedRequest = [v5 BOOLValue];

  id v6 = [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsSessionAuthChallengeKey"];
  self->_clientImplementsSessionChallenge = [v6 BOOLValue];

  v7 = [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsTaskAuthChallengeKey"];
  self->_clientImplementsTaskChallenge = [v7 BOOLValue];
}

- (id)setupDownloadDirectory
{
  if (!self->_sharedContainerIdentifier) {
    goto LABEL_16;
  }
  id v3 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:self->_clientBundleID error:0];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 groupContainerURLs];
    id v6 = [v5 objectForKeyedSubscript:self->_sharedContainerIdentifier];
  }
  else
  {
    id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:self->_clientBundleID allowPlaceholder:0 error:0];
    v7 = [v5 groupContainerURLs];
    id v6 = [v7 objectForKeyedSubscript:self->_sharedContainerIdentifier];
  }
  if (!v6)
  {
LABEL_16:
    id v6 = [(NDApplication *)self->_clientApplication containerURL];
    if (!v6) {
      goto LABEL_8;
    }
  }
  id v8 = [v6 URLByAppendingPathComponent:@"Library/Caches/com.apple.nsurlsessiond/Downloads" isDirectory:1];
  v9 = [v8 URLByAppendingPathComponent:self->_clientBundleID isDirectory:1];

  if (!v9)
  {
LABEL_8:
    v9 = +[NDFileUtilities defaultDownloadDirectoryForBundleID:self->_clientBundleID];
  }
  v10 = +[NSFileManager defaultManager];
  v11 = [v9 path];
  unsigned __int8 v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) == 0) {
    +[NDFileUtilities createDirectoryAtURL:v9];
  }

  return v9;
}

- (void)setXPCConnection:(id)a3
{
  id v5 = a3;
  [v5 setUserInfo:self];
  p_xpcConn = &self->_xpcConn;
  objc_storeStrong((id *)&self->_xpcConn, a3);
  self->_int clientPID = [v5 processIdentifier];
  v7 = (id)qword_1000CB148;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NDBackgroundSession *)self uuid];
    xpcConn = self->_xpcConn;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int clientPID = self->_clientPID;
    *(_DWORD *)buf = 138544386;
    unsigned int v23 = v8;
    __int16 v24 = 2112;
    v25 = xpcConn;
    __int16 v26 = 2112;
    uint64_t v27 = clientBundleID;
    __int16 v28 = 2112;
    uint64_t v29 = identifier;
    __int16 v30 = 1024;
    int v31 = clientPID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Using XPC connection %@ for client %@ with identifier %@ and PID %d", buf, 0x30u);
  }
  if (self->_shouldPullInitialCredentials)
  {
    self->_shouldPullInitialCredentials = 0;
    [(NDCredentialStorage *)self->_credentialStorage populateWithInitialCredentials];
  }
  v13 = [(NSXPCConnection *)*p_xpcConn _xpcConnection];
  int is_extension = xpc_connection_is_extension();

  if (is_extension)
  {
    if (*p_xpcConn)
    {
      [(NSXPCConnection *)*p_xpcConn auditToken];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    uint64_t v15 = (id)qword_1000CB148;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(NDBackgroundSession *)self uuid];
      v18 = self->_identifier;
      CFStringRef v17 = self->_clientBundleID;
      *(_DWORD *)buf = 138544130;
      unsigned int v23 = v16;
      __int16 v24 = 2112;
      v25 = 0;
      __int16 v26 = 2112;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> XPC connection is to PlugIn %@ for session <%@>.<%@>", buf, 0x2Au);
    }
  }
  self->_shouldElevateDiscretionaryPriority = [(NDApplication *)self->_clientApplication shouldElevateDiscretionaryPriority];
  v19 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  [v19 removePendingWakeForClient:self->_clientBundleID sessionIdentifier:self->_identifier];
}

- (id)getClientProxy
{
  return self->_clientProxy;
}

- (double)defaultWindowDurationForResourceTimeout:(double)a3
{
  return (double)(uint64_t)(a3 * 0.9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedContainerIdentifier, 0);
  objc_storeStrong(&self->_invalidateReply, 0);
  objc_storeStrong((id *)&self->_secondaryID, 0);
  objc_storeStrong((id *)&self->_monitoredAppBundleID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->tasksDB, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_identifiersToTaskInfo, 0);
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifiersToUpdates, 0);
  objc_storeStrong((id *)&self->_watchExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConn, 0);
  objc_storeStrong(&self->_completeReconnectionBlock, 0);
  objc_storeStrong((id *)&self->_uploadsDirectory, 0);
  objc_storeStrong((id *)&self->_downloadDirectory, 0);
  objc_storeStrong((id *)&self->_sessionDirectory, 0);
  objc_storeStrong((id *)&self->_outstandingTaskIDs, 0);
  objc_storeStrong((id *)&self->_identifiersToStreamQueues, 0);
  objc_storeStrong((id *)&self->_identifiersToStreams, 0);
  objc_storeStrong((id *)&self->_identifiersToMonitors, 0);
  objc_storeStrong((id *)&self->_identifiersToTasks, 0);
  objc_storeStrong((id *)&self->_tasksToIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectedExtension, 0);
  objc_storeStrong((id *)&self->_clientApplication, 0);
  objc_storeStrong((id *)&self->_credentialStorage, 0);
  objc_storeStrong((id *)&self->_discretionaryPrioritySession, 0);

  objc_storeStrong((id *)&self->_userInitiatedSession, 0);
}

- (void)setSharedContainerIdentifier:(id)a3
{
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setInvalidateReply:(id)a3
{
}

- (id)invalidateReply
{
  return objc_getProperty(self, a2, 304, 1);
}

- (NSString)secondaryID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (NSString)monitoredAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NDBackgroundSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDBackgroundSessionDelegate *)WeakRetained;
}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned __int8 v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  v14 = (id)qword_1000CB148;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = v11;
    uint64_t v15 = [(NDBackgroundSession *)self uuid];
    id v16 = v10;
    id v17 = v9;
    v18 = [v9 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    BOOL sendsLaunchEvents = self->_sendsLaunchEvents;
    unsigned int v21 = [(NDApplication *)self->_clientApplication supportsWakes];
    v22 = "Y";
    *(_DWORD *)buf = 138544386;
    __int16 v49 = 2114;
    v48 = v15;
    if (sendsLaunchEvents) {
      unsigned int v23 = "Y";
    }
    else {
      unsigned int v23 = "N";
    }
    v50 = v18;
    __int16 v51 = 2112;
    if (!v21) {
      v22 = "N";
    }
    v52 = clientBundleID;
    __int16 v53 = 2080;
    id v54 = v23;
    __int16 v55 = 2080;
    v56 = v22;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse for %@ _sendsLaunchEvents=%s [_clientApplication supportsWakes]=%s", buf, 0x34u);

    id v10 = v16;
    id v11 = v40;
    id v9 = v17;
  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100027C18;
    v44[3] = &unk_1000B61F0;
    v44[4] = self;
    id v25 = v9;
    id v45 = v25;
    id v26 = v11;
    id v46 = v26;
    uint64_t v27 = [(NSXPCProxyCreating *)clientProxy remoteObjectProxyWithErrorHandler:v44];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100027D7C;
    v41[3] = &unk_1000B5670;
    v41[4] = self;
    id v42 = v25;
    id v43 = v26;
    [v27 backgroundTask:v13 getAuthHeadersForResponse:v10 reply:v41];
  }
  else if (self->_sendsLaunchEvents && [(NDApplication *)self->_clientApplication supportsWakes])
  {
    __int16 v28 = (id)qword_1000CB148;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [(NDBackgroundSession *)self uuid];
      __int16 v30 = [v9 _loggableDescription];
      int v31 = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      v48 = v29;
      __int16 v49 = 2114;
      v50 = v30;
      __int16 v51 = 2112;
      v52 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ waking %@ for auth headers", buf, 0x20u);
    }
    unsigned int v32 = [PendingCallback alloc];
    id v33 = objc_retainBlock(v11);
    id v34 = [v33 copy];
    v35 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v34, v10, 0);
    uint64_t v36 = [(PendingCallback *)v32 initWithCallbackType:10 taskIdentifier:v13 args:v35];

    [v9 _releasePreventIdleSleepAssertionIfAppropriate];
    [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v36 wakeRequirement:2];
  }
  else
  {
    v37 = (id)qword_1000CB148;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = [(NDBackgroundSession *)self uuid];
      id v39 = [v9 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      v48 = v38;
      __int16 v49 = 2114;
      v50 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse does not have a remote object and does not support app wakes, canceling.", buf, 0x16u);
    }
    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
  }
}

- (void)_URLSession:(id)a3 openFileAtPath:(id)a4 mode:(int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = (NSString *)a4;
  id v12 = a6;
  id v13 = (id)qword_1000CB148;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(NDBackgroundSession *)self uuid];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v14;
    __int16 v37 = 2112;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Need file descriptor for file at path %@", buf, 0x16u);
  }
  if (self->_sendsLaunchEvents && [(NDApplication *)self->_clientApplication supportsWakes]) {
    goto LABEL_9;
  }
  clientProxy = self->_clientProxy;
  id v16 = (id)qword_1000CB148;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (clientProxy)
  {
    if (v17)
    {
      id v26 = [(NDBackgroundSession *)self uuid];
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v26;
      __int16 v37 = 2112;
      v38 = clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client %@ does not support app wakes, but it is still running. Will attempt to get file descriptor for download file.", buf, 0x16u);
    }
LABEL_9:
    __int16 v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    unsigned int v32 = sub_1000282C8;
    id v33 = &unk_1000B5648;
    id v34 = v12;
    v18 = objc_retainBlock(&v30);
    v19 = [PendingCallback alloc];
    long long v20 = +[NSNumber numberWithInt:v7];
    id v21 = [v18 copy];
    v22 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, v20, v21, 0, v30, v31, v32, v33);
    unsigned int v23 = [(PendingCallback *)v19 initWithCallbackType:6 taskIdentifier:0 args:v22];

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if ([(NDApplication *)self->_clientApplication supportsWakes]) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    [(NDCallbackQueue *)callbackQueue addPendingCallback:v23 wakeRequirement:v25];

    goto LABEL_18;
  }
  if (v17)
  {
    __int16 v28 = [(NDBackgroundSession *)self uuid];
    uint64_t v29 = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    v38 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client %@ does not support app wakes, cannot get file descriptor for download file!", buf, 0x16u);
  }
  (*((void (**)(id, uint64_t))v12 + 2))(v12, 0xFFFFFFFFLL);
LABEL_18:
}

- (id)_URLSession:(id)a3 downloadTaskNeedsDownloadDirectory:(id)a4
{
  id v5 = +[Daemon sharedDaemon];
  if ([v5 isPrivileged]) {
    downloadDirectory = 0;
  }
  else {
    downloadDirectory = self->_downloadDirectory;
  }
  uint64_t v7 = downloadDirectory;

  return v7;
}

- (void)_URLSession:(id)a3 downloadTask:(id)a4 didReceiveResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NDBackgroundSession *)self uuid];
    id v13 = [v7 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    int v22 = 138544130;
    unsigned int v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = clientBundleID;
    __int16 v28 = 1024;
    unsigned int v29 = [v8 statusCode];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ download for client %@ received response, status code: %d", (uint8_t *)&v22, 0x26u);
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v16 = +[NSNumber numberWithUnsignedInteger:v10];
  BOOL v17 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v16];

  [v17 setResponse:v8];
  v18 = +[NSNumber numberWithUnsignedInteger:v10];
  [(NDBackgroundSession *)self queueUpdatesForTask:v18 updateType:1 highPriority:1];

  clientProxy = self->_clientProxy;
  long long v20 = [v7 _metrics];
  id v21 = [v20 _daemon_currentTransactionMetrics];
  [(NSXPCProxyCreating *)clientProxy backgroundTask:v10 didReceiveResponse:v8 transactionMetrics:v21];
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id)qword_1000CB148;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(NDBackgroundSession *)self uuid];
    id v12 = [v9 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    int v15 = 138544130;
    id v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2112;
    long long v20 = clientBundleID;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ conditions changed - satisfied: %d", (uint8_t *)&v15, 0x26u);
  }
  if (!v5)
  {
    v14 = [v9 error:@"_nsurlsessiondErrorDomain" code:5];
    [v9 cancel_with_error:v14];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = (id)qword_1000CB148;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(NDBackgroundSession *)self uuid];
    id v12 = [v7 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    int v15 = 138544130;
    id v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2112;
    long long v20 = clientBundleID;
    __int16 v21 = 2048;
    int64_t v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ is waiting for connection - reason: %lld", (uint8_t *)&v15, 0x2Au);
  }
  v14 = +[NSURLError errorWithDomain:NSTCPConnectionConditionsUnmetReasonErrorDomain code:a5 userInfo:0];
  [(NSXPCProxyCreating *)self->_clientProxy backgroundTask:v9 hasConnectionWaitingWithError:v14];
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v42 = a4;
  id v40 = a5;
  v41 = (void (**)(id, id))a6;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v42];
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v12 = +[NSNumber numberWithUnsignedInteger:v10];
  id v13 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v12];

  v14 = (id)qword_1000CB148;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(NDBackgroundSession *)self uuid];
    id v16 = [v42 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    __int16 v51 = v15;
    __int16 v52 = 2114;
    __int16 v53 = v16;
    __int16 v54 = 2112;
    __int16 v55 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ _willSendRequestForEstablishedConnection", buf, 0x20u);
  }
  sub_10005CD1C(1, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v42, v13, 0);
  if (![v13 taskKind]) {
    [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
  }
  if (!self->_clientImplementsWillSendRequest
    && (![v13 taskKind]
     || [v13 taskKind] == (id)1 && (objc_msgSend(v13, "shouldCancelOnDisconnect") & 1) == 0))
  {
    __int16 v28 = (id)qword_1000CB148;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client does not implement _willSendRequestForEstablishedConnection, so using proposed request", buf, 0xCu);
    }
LABEL_29:

    v41[2](v41, v40);
    goto LABEL_30;
  }
  if (self->_clientProxy
    || self->_sendsLaunchEvents && [(NDApplication *)self->_clientApplication supportsWakes])
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100029070;
    v43[3] = &unk_1000B5620;
    id v44 = v13;
    id v45 = self;
    id v49 = v10;
    id v18 = v40;
    id v46 = v18;
    id v19 = v42;
    id v47 = v19;
    v48 = v41;
    long long v20 = objc_retainBlock(v43);
    __int16 v21 = [PendingCallback alloc];
    int64_t v22 = objc_retainBlock(v20);
    id v23 = [v22 copy];
    __int16 v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v23, 0);
    uint64_t v25 = [(PendingCallback *)v21 initWithCallbackType:5 taskIdentifier:v10 args:v24];

    [v19 _releasePreventIdleSleepAssertionIfAppropriate];
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if ([(NDApplication *)self->_clientApplication supportsWakes]) {
        uint64_t v27 = 2;
      }
      else {
        uint64_t v27 = 0;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    [(NDCallbackQueue *)callbackQueue addPendingCallback:v25 wakeRequirement:v27];

    v35 = v44;
  }
  else
  {
    unsigned int v30 = [v13 shouldCancelOnDisconnect];
    uint64_t v31 = (id)qword_1000CB148;
    __int16 v28 = v31;
    if (!v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [(NDBackgroundSession *)self uuid];
        __int16 v37 = [v42 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v51 = v36;
        __int16 v52 = 2114;
        __int16 v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ using proposed request since the client application is not running and doesn't support wakes", buf, 0x16u);
      }
      goto LABEL_29;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v38 = [(NDBackgroundSession *)self uuid];
      id v39 = [v42 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v51 = v38;
      __int16 v52 = 2114;
      __int16 v53 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ established a connection which requires the client to be running, but it isn't running and doesn't support app wakes. Canceling the task.", buf, 0x16u);
    }
    unsigned int v32 = (id)qword_1000CB148;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(NDBackgroundSession *)self uuid];
      id v34 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      __int16 v51 = v33;
      __int16 v52 = 2112;
      __int16 v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Perhaps the client %@ was uninstalled?", buf, 0x16u);
    }
    v35 = [v42 error:NSURLErrorDomain code:-997];
    [v42 cancel_with_error:v35];
    v41[2](v41, 0);
  }

LABEL_30:
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v17 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:a4];
  id v11 = [v17 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  id v13 = +[NSNumber numberWithUnsignedInteger:v11];
  id v18 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v13];

  if (v18) {
    [v18 taskTransferredData:0 countOfBytesReceived:a5];
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  int v15 = +[NSNumber numberWithUnsignedInteger:v11];
  id v16 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v15];

  if (![v16 taskKind]) {
    [(NSXPCProxyCreating *)self->_clientProxy backgroundDownloadTask:v11 didWriteData:a5 totalBytesWritten:a6 totalBytesExpectedToWrite:a7];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v11 = [v10 unsignedIntegerValue];

  id v12 = (id)qword_1000CB148;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(NDBackgroundSession *)self uuid];
    v14 = [v9 _loggableDescription];
    int v19 = 138544130;
    long long v20 = v13;
    __int16 v21 = 2114;
    int64_t v22 = v14;
    __int16 v23 = 2048;
    int64_t v24 = a5;
    __int16 v25 = 2048;
    int64_t v26 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didResumeAtOffset: %lld expectedTotalBytes: %lld", (uint8_t *)&v19, 0x2Au);
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v16 = +[NSNumber numberWithUnsignedInteger:v11];
  id v17 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v16];

  if ([v17 expectingResumeCallback])
  {
    [(NSXPCProxyCreating *)self->_clientProxy backgroundDownloadTask:v11 didResumeAtOffset:a5 expectedTotalBytes:a6];
    [v17 setExpectingResumeCallback:0];
    id v18 = +[NSNumber numberWithUnsignedInteger:v11];
    [(NDBackgroundSession *)self queueUpdatesForTask:v18 updateType:14 highPriority:0];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NDBackgroundSession *)self uuid];
    id v13 = [v7 _loggableDescription];
    *(_DWORD *)buf = 138543874;
    int64_t v24 = v12;
    __int16 v25 = 2114;
    int64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ finished downloading to %@", buf, 0x20u);
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  int v15 = +[NSNumber numberWithUnsignedInteger:v10];
  id v16 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v15];

  if ([v7 _hasSZExtractor])
  {
    +[NDFileUtilities updateStreamingZipModificationDate:v8];
    [v16 set_updatedStreamingZipModificationDate:1];
  }
  id v17 = [PendingCallback alloc];
  id v18 = [v7 response:v16];
  int v19 = v18;
  if (!v18)
  {
    int v19 = +[NSNull null];
  }
  v22[1] = v19;
  long long v20 = +[NSArray arrayWithObjects:v22 count:2];
  __int16 v21 = [(PendingCallback *)v17 initWithCallbackType:1 taskIdentifier:v10 args:v20];

  if (!v18) {
  [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v21 wakeRequirement:0];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NDBackgroundSession *)self uuid];
    id v13 = [v7 _loggableDescription];
    int v24 = 138543618;
    __int16 v25 = v12;
    __int16 v26 = 2114;
    __int16 v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ became download task", (uint8_t *)&v24, 0x16u);
  }
  v14 = +[NSNumber numberWithUnsignedInteger:v10];
  [(NSMutableDictionary *)self->_tasksToIdentifiers setObject:v14 forKeyedSubscript:v8];

  [(NSMutableDictionary *)self->_tasksToIdentifiers removeObjectForKey:v7];
  identifiersToTasks = self->_identifiersToTasks;
  id v16 = +[NSNumber numberWithUnsignedInteger:v10];
  [(NSMutableDictionary *)identifiersToTasks setObject:v8 forKeyedSubscript:v16];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v18 = +[NSNumber numberWithUnsignedInteger:v10];
  int v19 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v18];

  long long v20 = [v8 downloadFile];
  __int16 v21 = [v20 path];

  if (v21)
  {
    int64_t v22 = +[NSURL fileURLWithPath:v21];
  }
  else
  {
    int64_t v22 = 0;
  }
  [v19 setDownloadFileURL:v22];
  if (v21) {

  }
  if ([v19 taskKind] == (id)2)
  {
    [(NSXPCProxyCreating *)self->_clientProxy backgroundDataTaskDidBecomeDownloadTask:v10];
    [v19 setTaskKind:0];
  }
  __int16 v23 = +[NSNumber numberWithUnsignedInteger:v10];
  [(NDBackgroundSession *)self queueUpdatesForTask:v23 updateType:14 highPriority:0];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  id v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  int v15 = +[NSNumber numberWithUnsignedInteger:v13];
  id v16 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v15];

  if (v16) {
    [v16 taskTransferredData:0 countOfBytesReceived:[v10 length]];
  }
  id v17 = (id)qword_1000CB148;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v25 = [(NDBackgroundSession *)self uuid];
    id v26 = [v9 _loggableDescription];
    *(_DWORD *)buf = 138544130;
    id v33 = v25;
    __int16 v34 = 2114;
    id v35 = v26;
    __int16 v36 = 2048;
    id v37 = [v9 countOfBytesReceived];
    __int16 v38 = 2048;
    id v39 = [v9 countOfBytesExpectedToReceive];
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "NDSession <%{public}@> %{public}@ did receive data (%lld of %lld total bytes)", buf, 0x2Au);
  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002A04C;
    v29[3] = &unk_1000B61F0;
    v29[4] = self;
    id v30 = v9;
    int v19 = v11;
    id v31 = v19;
    long long v20 = [(NSXPCProxyCreating *)clientProxy remoteObjectProxyWithErrorHandler:v29];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002A194;
    v27[3] = &unk_1000B5EC0;
    id v28 = v19;
    [v20 backgroundDataTask:v13 didReceiveData:v10 withReply:v27];
  }
  else
  {
    __int16 v21 = (id)qword_1000CB148;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v22 = [(NDBackgroundSession *)self uuid];
      __int16 v23 = [v9 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v33 = v22;
      __int16 v34 = 2114;
      id v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received data and there is no connected client. Canceling task.", buf, 0x16u);
    }
    int v24 = [v9 error:NSURLErrorDomain code:-997];
    [v9 cancel_with_error:v24];
    v11[2](v11);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  id v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  v14 = (id)qword_1000CB148;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(NDBackgroundSession *)self uuid];
    id v16 = [v9 _loggableDescription];
    *(_DWORD *)buf = 138544130;
    id v46 = v15;
    __int16 v47 = 2114;
    v48 = v16;
    __int16 v49 = 2112;
    id v50 = v10;
    __int16 v51 = 1024;
    unsigned int v52 = [v10 statusCode];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveResponse: %@, status code: %d", buf, 0x26u);
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v18 = +[NSNumber numberWithUnsignedInteger:v13];
  int v19 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v18];

  [v19 setResponse:v10];
  uint64_t v20 = +[NSNumber numberWithUnsignedInteger:v13];
  [(NDBackgroundSession *)self queueUpdatesForTask:v20 updateType:1 highPriority:0];

  __int16 v21 = [v19 resumableUploadData];
  LOBYTE(v20) = v21 == 0;

  if ((v20 & 1) == 0)
  {
    [v19 setResumableUploadData:0];
    int64_t v22 = +[NSNumber numberWithUnsignedInteger:v13];
    [(NDBackgroundSession *)self queueUpdatesForTask:v22 updateType:2 highPriority:0];
  }
  id v23 = [v19 taskKind];
  clientProxy = self->_clientProxy;
  if (v23 == (id)1)
  {
    __int16 v25 = [v9 _metrics];
    id v26 = [v25 _daemon_currentTransactionMetrics];
    [(NSXPCProxyCreating *)clientProxy backgroundTask:v13 didReceiveResponse:v10 transactionMetrics:v26];

    [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
    v11[2](v11, 2);
  }
  else if (clientProxy)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10002A764;
    v42[3] = &unk_1000B61F0;
    v42[4] = self;
    id v27 = v9;
    id v28 = v11;
    id v29 = v27;
    id v43 = v27;
    __int16 v38 = v28;
    id v30 = v28;
    id v44 = v30;
    id v31 = [(NSXPCProxyCreating *)clientProxy remoteObjectProxyWithErrorHandler:v42];
    unsigned int v32 = [v29 _metrics];
    id v33 = [v32 _daemon_currentTransactionMetrics];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10002A8E8;
    v39[3] = &unk_1000B55F8;
    v39[4] = self;
    id v40 = v29;
    v41 = v30;
    [v31 backgroundTask:v13 didReceiveResponse:v10 transactionMetrics:v33 reply:v39];

    id v11 = v38;
  }
  else
  {
    __int16 v34 = (id)qword_1000CB148;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = [(NDBackgroundSession *)self uuid];
      id v37 = [v9 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v46 = v36;
      __int16 v47 = 2114;
      v48 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ received data task didReceiveResponse callback and there is no connected client. Canceling task.", buf, 0x16u);
    }
    id v35 = [v9 error:NSURLErrorDomain code:-997];
    [v9 cancel_with_error:v35];
    v11[2](v11, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v78 = v7;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v12 = +[NSNumber numberWithUnsignedInteger:v10];
  id v13 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v12];

  v14 = [v78 _metrics];
  id v77 = v10;
  [v13 setTaskMetrics:v14];

  identifiersToStreams = self->_identifiersToStreams;
  if (identifiersToStreams)
  {
    id v16 = +[NSNumber numberWithUnsignedInteger:v10];
    [(NSMutableDictionary *)identifiersToStreams removeObjectForKey:v16];
  }
  if ([v78 _hasSZExtractor])
  {
    id v17 = [v13 downloadFileURL];
    if (v17)
    {
      unsigned __int8 v18 = [v13 _updatedStreamingZipModificationDate];

      if ((v18 & 1) == 0)
      {
        int v19 = [v13 downloadFileURL];
        +[NDFileUtilities updateStreamingZipModificationDate:v19];
      }
    }
  }
  if (!v8
    || !sub_10000F590((BOOL)v8)
    || [v13 disablesRetry] && ((sub_10000FAA8(v78) & 1) != 0 || !sub_10000F7D4(v8))
    || [v13 state] == (id)2)
  {
    char v20 = 0;
    goto LABEL_14;
  }
  v59 = (id)qword_1000CB148;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    id v60 = [(NDBackgroundSession *)self uuid];
    unsigned int v61 = [v78 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138544386;
    v87 = v60;
    __int16 v88 = 2114;
    id v89 = v61;
    __int16 v90 = 2112;
    uint64_t v91 = clientBundleID;
    __int16 v92 = 2112;
    id v93 = v8;
    __int16 v94 = 2048;
    id v95 = [v8 code];
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ will be retried after error %@ - code: %ld", buf, 0x34u);
  }
  uint64_t v63 = +[NDUserSyncStakeholder sharedStakeholder];
  [v63 startBridgingUMTask:v13];

  [(NDBackgroundSession *)self handleCompletionOfTask:v78 identifier:v10 taskInfo:v13 isRecoverable:1 suppressWake:1];
  [(NSMutableDictionary *)self->_tasksToIdentifiers removeObjectForKey:v78];
  v64 = [v78 _extractor];
  [v13 set_extractor:v64];

  [v13 set_hasSZExtractor:[v78 _hasSZExtractor]];
  [v13 set_doesSZExtractorConsumeExtractedData:[v78 _doesSZExtractorConsumeExtractedData]];
  id v65 = [v78 _metrics];
  id v66 = [v65 _daemon_currentTransactionMetrics];
  unsigned __int8 v67 = [(NDBackgroundSession *)self retryTask:v13 originalError:v8 transactionMetrics:v66];

  if ((v67 & 1) == 0)
  {
    v68 = +[NDUserSyncStakeholder sharedStakeholder];
    [v68 endBridgingUMTask:v13];

    id v69 = (id)qword_1000CB148;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v73 = [(NDBackgroundSession *)self uuid];
      v74 = [v78 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      v87 = v73;
      __int16 v88 = 2114;
      id v89 = v74;
      _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ failed to retry", buf, 0x16u);
    }
    uint64_t v70 = [v8 userInfo];
    uint64_t v71 = +[NSURLError errorWithDomain:NSURLErrorDomain code:-1 userInfo:v70];

    char v20 = 1;
    id v8 = (id)v71;
LABEL_14:
    clientProxy = [v8 domain];
    if ([clientProxy isEqualToString:@"_nsurlsessiondErrorDomain"])
    {
      BOOL v22 = [v8 code] == (id)1;

      if (!v22) {
        goto LABEL_20;
      }
      id v23 = (id)qword_1000CB148;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v72 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543362;
        v87 = v72;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Removing client proxy due to task failure caused by app quit", buf, 0xCu);
      }
      clientProxy = self->_clientProxy;
      self->_clientProxy = 0;
    }

LABEL_20:
    int v24 = [(NDBackgroundSession *)self clientErrorForError:v8];
    if (sub_10000F84C((BOOL)v8)) {
      unsigned int v75 = [(NDApplication *)self->_clientApplication canBeSuspended];
    }
    else {
      unsigned int v75 = 0;
    }
    [v13 setState:3];
    [v13 setError:v24];
    [v78 setError:v24];
    __int16 v25 = [v78 _trailers];
    [v13 set_backgroundTrailers:v25];

    id v26 = +[NSNumber numberWithUnsignedInteger:v77];
    [(NDBackgroundSession *)self queueUpdatesForTask:v26 updateType:14 highPriority:1];

    id v27 = (id)qword_1000CB148;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(NDBackgroundSession *)self uuid];
      id v29 = [v78 _loggableDescription];
      id v30 = [v8 code];
      if (sub_10000FAA8(v78))
      {
        if ([v78 _connectionIsCellular]) {
          int v31 = 89;
        }
        else {
          int v31 = 78;
        }
      }
      else
      {
        int v31 = 85;
      }
      *(_DWORD *)buf = 138544386;
      v87 = v28;
      __int16 v88 = 2114;
      id v89 = v29;
      __int16 v90 = 2112;
      uint64_t v91 = (NSString *)v8;
      __int16 v92 = 2048;
      id v93 = v30;
      __int16 v94 = 1024;
      LODWORD(v95) = v31;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld]. C(%c)", buf, 0x30u);
    }
    if (!v8)
    {
      __int16 v34 = (id)qword_1000CB148;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v38 = [(NDBackgroundSession *)self uuid];
        id v39 = [v78 _loggableDescription];
        id v40 = self->_clientBundleID;
        *(_DWORD *)buf = 138543874;
        v87 = v38;
        __int16 v88 = 2114;
        id v89 = v39;
        __int16 v90 = 2112;
        uint64_t v91 = v40;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ completed successfully", buf, 0x20u);
      }
      goto LABEL_40;
    }
    unsigned int v32 = [v8 domain];
    if ([v32 isEqualToString:NSURLErrorDomain])
    {
      BOOL v33 = [v8 code] == (id)-999;

      if (v33)
      {
        __int16 v34 = (id)qword_1000CB148;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [(NDBackgroundSession *)self uuid];
          __int16 v36 = [v78 _loggableDescription];
          id v37 = self->_clientBundleID;
          *(_DWORD *)buf = 138543874;
          v87 = v35;
          __int16 v88 = 2114;
          id v89 = v36;
          __int16 v90 = 2112;
          uint64_t v91 = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ was cancelled", buf, 0x20u);
        }
LABEL_40:

        outstandingTaskIDs = self->_outstandingTaskIDs;
        id v46 = +[NSNumber numberWithUnsignedInteger:v77];
        LOBYTE(outstandingTaskIDs) = [(NSMutableArray *)outstandingTaskIDs containsObject:v46];

        if (outstandingTaskIDs)
        {
          id v76 = objc_alloc_init((Class)NSMutableDictionary);
          __int16 v47 = [v13 _backgroundTrailers];
          BOOL v48 = v47 == 0;

          if (!v48)
          {
            __int16 v49 = [v13 _backgroundTrailers];
            [v76 setObject:v49 forKeyedSubscript:@"trailers"];
          }
          id v50 = [PendingCallback alloc];
          __int16 v51 = v24;
          if (!v24)
          {
            __int16 v51 = +[NSNull null];
          }
          v85[0] = v51;
          unsigned int v52 = [v13 taskMetrics];
          __int16 v53 = v52;
          if (!v52)
          {
            __int16 v53 = +[NSNull null];
          }
          v85[1] = v53;
          v85[2] = v76;
          __int16 v54 = +[NSArray arrayWithObjects:v85 count:3];
          __int16 v55 = [(PendingCallback *)v50 initWithCallbackType:0 taskIdentifier:v77 args:v54];

          if (!v52) {
          if (!v24)
          }

          [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v55 wakeRequirement:0];
          [(NDBackgroundSession *)self removeOutstandingTaskWithIdentifier:v77];
          [(NDBackgroundSession *)self handleCompletionOfTask:v78 identifier:v77 taskInfo:v13 isRecoverable:0 suppressWake:v75];
          [(NDBackgroundSession *)self removeUploadFileForTaskInfo:v13];
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_10002B834;
          v81[3] = &unk_1000B60C0;
          id v82 = v13;
          id v83 = v24;
          v84 = self;
          v56 = objc_retainBlock(v81);
          if ((v20 & (v8 != 0)) == 1
            && ([v78 _extractor], (v57 = objc_claimAutoreleasedReturnValue()) != 0)
            && (unsigned __int8 v58 = [v78 _extractorFinishedDecoding], v57,
                                                                                        (v58 & 1) == 0))
          {
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472;
            v79[2] = sub_10002B8D8;
            v79[3] = &unk_1000B5EC0;
            v80 = v56;
            [v78 terminateExtractorWithError:v8 completion:v79];
          }
          else
          {
            ((void (*)(void *))v56[2])(v56);
          }
        }
        goto LABEL_57;
      }
    }
    else
    {
    }
    __int16 v34 = (id)qword_1000CB148;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v41 = [(NDBackgroundSession *)self uuid];
      id v42 = [v78 _loggableDescription];
      id v43 = self->_clientBundleID;
      id v44 = [v8 code];
      *(_DWORD *)buf = 138544130;
      v87 = v41;
      __int16 v88 = 2114;
      id v89 = v42;
      __int16 v90 = 2112;
      uint64_t v91 = v43;
      __int16 v92 = 2048;
      id v93 = v44;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ completed with error - code: %ld", buf, 0x2Au);
    }
    goto LABEL_40;
  }
LABEL_57:
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NDBackgroundSession *)self uuid];
    id v13 = [v7 _loggableDescription];
    int v23 = 138544130;
    int v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    unsigned int v30 = [v8 statusCode];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveInformationalResponse: %@, status code: %d", (uint8_t *)&v23, 0x26u);
  }
  v14 = [v7 resumableUploadState];
  unsigned int v15 = [v14 isResumable];

  if (v15)
  {
    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v17 = +[NSNumber numberWithUnsignedInteger:v10];
    unsigned __int8 v18 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v17];

    int v19 = [v18 resumableUploadData];
    LODWORD(v17) = v19 == 0;

    if (v17)
    {
      char v20 = [v7 resumableUploadState];
      __int16 v21 = [v20 createResumeDataForTaskInfo];
      [v18 setResumableUploadData:v21];

      BOOL v22 = +[NSNumber numberWithUnsignedInteger:v10];
      [(NDBackgroundSession *)self queueUpdatesForTask:v22 updateType:2 highPriority:0];
    }
  }
  [(NSXPCProxyCreating *)self->_clientProxy backgroundTask:v10 didReceiveInformationalResponse:v8];
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v12 = +[NSNumber numberWithUnsignedInteger:v10];
  id v13 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v12];

  [v13 setShouldCancelOnDisconnect:1];
  [v13 setDisablesRetry:!self->_retryDataTasks];
  v14 = (id)qword_1000CB148;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [(NDBackgroundSession *)self uuid];
    id v16 = [v7 _loggableDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v15;
    __int16 v30 = 2114;
    int v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ needs new body stream", buf, 0x16u);
  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002BEE4;
    v25[3] = &unk_1000B61F0;
    v25[4] = self;
    id v18 = v7;
    id v26 = v18;
    id v19 = v8;
    id v27 = v19;
    char v20 = [(NSXPCProxyCreating *)clientProxy remoteObjectProxyWithErrorHandler:v25];
    uint64_t v21 = sub_10000FAA8(v18);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    void v22[2] = sub_10002C030;
    v22[3] = &unk_1000B55D0;
    v22[4] = self;
    id v24 = v10;
    id v23 = v19;
    [v20 backgroundTask:v10 needNewBodyStream:v21 withReply:v22];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v14 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:a4];
  id v11 = [v14 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  id v13 = +[NSNumber numberWithUnsignedInteger:v11];
  id v15 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v13];

  if (v15) {
    [v15 taskTransferredData:a5 countOfBytesReceived:0];
  }
  [(NSXPCProxyCreating *)self->_clientProxy backgroundTask:v11 didSendBodyData:a5 totalBytesSent:a6 totalBytesExpectedToSend:a7];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v66 = a5;
  id v69 = a6;
  id v65 = a7;
  v68 = v12;
  id v13 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v12];
  id v14 = [v13 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v16 = +[NSNumber numberWithUnsignedInteger:v14];
  id v17 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v16];

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10002CBFC;
  v78[3] = &unk_1000B5558;
  id v18 = v17;
  id v79 = v18;
  v80 = self;
  id v82 = v14;
  id v19 = v65;
  id v81 = v19;
  unsigned __int8 v67 = objc_retainBlock(v78);
  if (![v18 isDiscretionary]) {
    goto LABEL_24;
  }
  id v60 = [v69 URL];
  v64 = [v60 host];
  unsigned int v61 = [v18 currentRequest];
  id v62 = [v61 URL];
  uint64_t v63 = [v62 host];
  unsigned int v20 = [v64 isEqualToString:];
  if (v20)
  {
    __int16 v54 = [v69 URL];
    v59 = [v54 scheme];
    __int16 v55 = [v18 currentRequest];
    v56 = [v55 URL];
    v57 = [v56 scheme];
    if (objc_msgSend(v59, "isEqualToString:"))
    {
      __int16 v51 = [v69 URL];
      unsigned __int8 v58 = [v51 port];
      unsigned int v52 = [v18 currentRequest];
      __int16 v53 = [v52 URL];
      id v7 = [v53 port];
      if (v58 == v7)
      {
        int v25 = 0;
        id v7 = v58;
        goto LABEL_9;
      }
      int v21 = 1;
    }
    else
    {
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 0;
  }
  BOOL v22 = [v68 _taskGroup];
  id v23 = [v22 _groupConfiguration];
  unsigned int v24 = [v23 _duetPreauthorized];

  int v25 = v24 ^ 1;
  if (!v21)
  {
    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_9:

  if (v20)
  {
LABEL_12:
  }
LABEL_13:

  if (v25)
  {
    id v26 = (id)qword_1000CB148;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(NDBackgroundSession *)self uuid];
      id v28 = [v68 _loggableDescription];
      __int16 v29 = [v18 currentRequest];
      *(_DWORD *)buf = 138544130;
      v84 = v27;
      __int16 v85 = 2114;
      unsigned __int8 v86 = v28;
      __int16 v87 = 2112;
      id v88 = v69;
      __int16 v89 = 2112;
      id v90 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ modifying conditional connection properties since new request %@ is to a different host than previous request %@", buf, 0x2Au);
    }
    id v30 = [v68 _copySocketStreamProperties];
    if (!v30) {
      id v30 = (id)objc_opt_new();
    }
    uint64_t v31 = kCFStreamPropertyConditionalConnectionProperties;
    unsigned int v32 = [v30 objectForKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
    id v33 = [v32 mutableCopy];

    if (!v33) {
      id v33 = (id)objc_opt_new();
    }
    [v33 setObject:&off_1000B89B0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];
    [v33 setObject:&off_1000B89E0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionIsDiscretionary];
    __int16 v34 = [v68 _legacySocketStreamProperties];
    id v35 = [v34 mutableCopy];
    __int16 v36 = v35;
    if (v35) {
      id v37 = v35;
    }
    else {
      id v37 = (id)objc_opt_new();
    }
    __int16 v38 = v37;

    [v38 setObject:v33 forKeyedSubscript:v31];
    [v68 set_legacySocketStreamProperties:v38];
  }
LABEL_24:
  [v18 setCurrentRequest:v69];
  id v39 = [v69 URL];
  unsigned __int8 v40 = [(NDBackgroundSession *)self errorIfBlockedTracker:v68 url:v39];

  if (v40)
  {
    id v41 = 0;
    id v42 = v19;
LABEL_30:
    ((void (*)(void *, id))v42[2])(v42, v41);
    goto LABEL_31;
  }
  id v43 = (id)qword_1000CB148;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    id v44 = [(NDBackgroundSession *)self uuid];
    id v45 = [v68 _loggableDescription];
    *(_DWORD *)buf = 138544130;
    v84 = v44;
    __int16 v85 = 2114;
    unsigned __int8 v86 = v45;
    __int16 v87 = 2112;
    id v88 = v66;
    __int16 v89 = 2112;
    id v90 = v69;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ willPerformHTTPRedirection, response: %@, new request: %@", buf, 0x2Au);
  }
  clientProxy = self->_clientProxy;
  id v42 = v67;
  id v41 = v69;
  if (!clientProxy) {
    goto LABEL_30;
  }
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10002CCBC;
  v74[3] = &unk_1000B5580;
  v74[4] = self;
  id v47 = v68;
  id v75 = v47;
  BOOL v48 = v67;
  id v77 = v48;
  id v49 = v69;
  id v76 = v49;
  id v50 = [(NSXPCProxyCreating *)clientProxy remoteObjectProxyWithErrorHandler:v74];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10002CE04;
  v70[3] = &unk_1000B55A8;
  v70[4] = self;
  id v71 = v47;
  id v72 = v19;
  v73 = v48;
  [v50 backgroundTask:v14 willPerformHTTPRedirection:v66 withNewRequest:v49 reply:v70];

LABEL_31:
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v62 = a6;
  uint64_t v63 = v9;
  id v11 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v61 = [v11 unsignedIntegerValue];

  id v12 = (id)qword_1000CB148;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(NDBackgroundSession *)self uuid];
    id v14 = [v9 _loggableDescription];
    id v15 = [v10 protectionSpace];
    clientBundleID = self->_clientBundleID;
    id v17 = [v10 protectionSpace];
    id v18 = [v17 authenticationMethod];
    *(_DWORD *)buf = 138544642;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    id v72 = v10;
    __int16 v73 = 2112;
    id v74 = v15;
    __int16 v75 = 2112;
    id v76 = clientBundleID;
    __int16 v77 = 2112;
    v78 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveChallenge: %@ protection space: %@ for client %@ received auth challenge with type %@", buf, 0x3Eu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v72) = 0;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10002D9A8;
  v64[3] = &unk_1000B5530;
  id v66 = buf;
  id v19 = v62;
  id v65 = v19;
  unsigned int v20 = objc_retainBlock(v64);
  if (!self->_performsEVCertCheck
    || ([v10 protectionSpace],
        int v21 = objc_claimAutoreleasedReturnValue(),
        [v21 authenticationMethod],
        BOOL v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v22 isEqualToString:NSURLAuthenticationMethodServerTrust],
        v22,
        v21,
        !v23))
  {
    if (!sub_10002D9D0(v10)
      || self->_clientImplementsSessionChallenge
      || self->_clientImplementsTaskChallenge)
    {
      if (sub_10002D9D0(v10) || self->_clientImplementsTaskChallenge)
      {
        if (self->_clientProxy) {
          goto LABEL_36;
        }
        if (self->_sendsLaunchEvents && [(NDApplication *)self->_clientApplication supportsWakes])
        {
          if (self->_clientProxy) {
            goto LABEL_36;
          }
          __int16 v34 = [v10 protectionSpace];
          id v35 = [v34 authenticationMethod];
          unsigned int v36 = [v35 isEqualToString:NSURLAuthenticationMethodServerTrust];

          if (v36)
          {
            id v37 = [v10 protectionSpace];
            __int16 v38 = (__SecTrust *)[v37 serverTrust];

            if (!SecTrustEvaluateWithError(v38, 0)) {
              goto LABEL_36;
            }
            id v39 = (id)qword_1000CB148;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v40 = [(NDBackgroundSession *)self uuid];
              id v41 = [v63 _loggableDescription];
              *(_DWORD *)unsigned __int8 v67 = 138543618;
              v68 = v40;
              __int16 v69 = 2114;
              uint64_t v70 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and trust is valid, performing default handling for auth challenge", v67, 0x16u);
            }
          }
          else
          {
            if (self->_clientProxy) {
              goto LABEL_36;
            }
            if ([v10 previousFailureCount]) {
              goto LABEL_36;
            }
            __int16 v55 = [v10 proposedCredential];
            BOOL v56 = v55 == 0;

            if (v56) {
              goto LABEL_36;
            }
            id v39 = (id)qword_1000CB148;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v57 = [(NDBackgroundSession *)self uuid];
              unsigned __int8 v58 = [v63 _loggableDescription];
              *(_DWORD *)unsigned __int8 v67 = 138543618;
              v68 = v57;
              __int16 v69 = 2114;
              uint64_t v70 = v58;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and challenge has a previousFailureCount of 0 and a proposedCredential, performing default handling for auth challenge", v67, 0x16u);
            }
          }
        }
        else
        {
          id v39 = (id)qword_1000CB148;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v42 = [(NDBackgroundSession *)self uuid];
            id v43 = [v63 _loggableDescription];
            *(_DWORD *)unsigned __int8 v67 = 138543618;
            v68 = v42;
            __int16 v69 = 2114;
            uint64_t v70 = v43;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and doesn't support app wakes, performing default handling for auth challenge", v67, 0x16u);
          }
        }
      }
      else
      {
        id v39 = (id)qword_1000CB148;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = [(NDBackgroundSession *)self uuid];
          id v45 = [v63 _loggableDescription];
          *(_DWORD *)unsigned __int8 v67 = 138543618;
          v68 = v44;
          __int16 v69 = 2114;
          uint64_t v70 = v45;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client doesn't implement task-level auth challenge delegate, performing default handling for auth challenge", v67, 0x16u);
        }
      }
    }
    else
    {
      id v39 = (id)qword_1000CB148;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = [(NDBackgroundSession *)self uuid];
        id v47 = [v63 _loggableDescription];
        *(_DWORD *)unsigned __int8 v67 = 138543618;
        v68 = v46;
        __int16 v69 = 2114;
        uint64_t v70 = v47;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client doesn't implement session-level or task-level auth challenge delegate, performing default handling for auth challenge", v67, 0x16u);
      }
    }

    ((void (*)(void *))v20[2])(v20);
    goto LABEL_36;
  }
  unsigned int v24 = (id)qword_1000CB148;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [(NDBackgroundSession *)self uuid];
    id v26 = [v63 _loggableDescription];
    *(_DWORD *)unsigned __int8 v67 = 138543618;
    v68 = v25;
    __int16 v69 = 2114;
    uint64_t v70 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ performing Extended Validation Trust evaluation", v67, 0x16u);
  }
  id v27 = [v10 protectionSpace];
  id v28 = [v27 serverTrust];

  LODWORD(v27) = [(NDBackgroundSession *)self trustPassesExtendedValidation:v28];
  __int16 v29 = (id)qword_1000CB148;
  id v30 = v29;
  if (v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(NDBackgroundSession *)self uuid];
      unsigned int v32 = [v63 _loggableDescription];
      *(_DWORD *)unsigned __int8 v67 = 138543618;
      v68 = v31;
      __int16 v69 = 2114;
      uint64_t v70 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation succeeded", v67, 0x16u);
    }
    id v33 = +[NSURLCredential credentialForTrust:v28];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v33);
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v59 = [(NDBackgroundSession *)self uuid];
      id v60 = [v63 _loggableDescription];
      *(_DWORD *)unsigned __int8 v67 = 138543618;
      v68 = v59;
      __int16 v69 = 2114;
      uint64_t v70 = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation failed", v67, 0x16u);
    }
    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 2, 0);
  }
  *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
LABEL_36:
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    BOOL v48 = [PendingCallback alloc];
    id v49 = objc_retainBlock(v19);
    id v50 = [v49 copy];
    __int16 v51 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v50, 0);
    unsigned int v52 = [(PendingCallback *)v48 initWithCallbackType:2 taskIdentifier:v61 args:v51];

    [v63 _releasePreventIdleSleepAssertionIfAppropriate];
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if ([(NDApplication *)self->_clientApplication supportsWakes]) {
        uint64_t v54 = 2;
      }
      else {
        uint64_t v54 = 0;
      }
    }
    else
    {
      uint64_t v54 = 0;
    }
    [(NDCallbackQueue *)callbackQueue addPendingCallback:v52 wakeRequirement:v54];
  }
  _Block_object_dispose(buf, 8);
}

- (BOOL)trustPassesExtendedValidation:(__SecTrust *)a3
{
  if (a3)
  {
    CFErrorRef error = 0;
    if (!SecTrustEvaluateWithError(a3, &error))
    {
      id v6 = (id)qword_1000CB148;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(NDBackgroundSession *)self uuid];
        CFErrorRef v11 = error;
        id v12 = [(__CFError *)error code];
        *(_DWORD *)buf = 138543618;
        id v16 = v10;
        __int16 v17 = 2048;
        id v18 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Invalid trust status: %ld", buf, 0x16u);
      }
      BOOL v7 = 0;
      goto LABEL_15;
    }
    CFDictionaryRef v4 = (const __CFDictionary *)SecTrustCopyInfo();
    CFDictionaryRef v5 = v4;
    if (v4)
    {
      id v6 = CFDictionaryGetValue(v4, kSecTrustInfoExtendedValidationKey);
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue])
      {
        BOOL v7 = 1;
      }
      else
      {
        id v8 = (id)qword_1000CB148;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v13 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543362;
          id v16 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Extended trust validation failed", buf, 0xCu);
        }
        BOOL v7 = 0;
      }
      CFRelease(v5);
LABEL_15:

      return v7;
    }
  }
  return 0;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NDBackgroundSession *)self uuid];
    int v10 = 138544130;
    CFErrorRef v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    id v17 = [v7 code];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session %@ didBecomeInvalidWithError: %@ [%ld]", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)invalidateWithReply:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (id)qword_1000CB148;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NDBackgroundSession *)self uuid];
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int v13 = 138543874;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = identifier;
    __int16 v17 = 2112;
    id v18 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> InvalidateWithReply: for session %@ bundle ID %@", (uint8_t *)&v13, 0x20u);
  }
  if ([(NDCallbackQueue *)self->_callbackQueue count]
    && [(NSMutableDictionary *)self->_identifiersToTasks count]
    || [(NDBackgroundSession *)self sessionHasOutstandingTasks])
  {
    id v9 = [(NDBackgroundSession *)self invalidateReply];
    BOOL v10 = v9 == 0;

    if (v10) {
      [(NDBackgroundSession *)self setInvalidateReply:v4];
    }
  }
  else
  {
    CFErrorRef v11 = (id)qword_1000CB148;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(NDBackgroundSession *)self uuid];
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Cleaning up and invalidating immediately since there are no tasks", (uint8_t *)&v13, 0xCu);
    }
    [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:v4];
  }
}

- (void)resetStorageWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(NDCredentialStorage *)self->_credentialStorage reset];
  v4[2]();
}

- (void)setDiscretionaryOverride:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  CFErrorRef v11 = +[NSNumber numberWithUnsignedInteger:a4];
  __int16 v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  int v13 = +[NSXPCConnection currentConnection];
  unsigned int v14 = sub_10000BE38(v13, @"com.apple.private.nsurlsession.set-discretionary-override-value");

  if (v14)
  {
    [v12 setQos:qos_class_self()];
    __int16 v15 = (id)qword_1000CB148;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(NDBackgroundSession *)self uuid];
      id v17 = [v9 _loggableDescription];
      if (a3)
      {
        if (a3 == 1)
        {
          int v18 = 68;
        }
        else if (a3 == 2)
        {
          int v18 = 78;
        }
        else
        {
          int v18 = 63;
        }
      }
      else
      {
        int v18 = 45;
      }
      int v27 = 138544130;
      id v28 = v16;
      __int16 v29 = 2114;
      uint64_t v30 = (uint64_t)v17;
      __int16 v31 = 1024;
      int v32 = v18;
      __int16 v33 = 1024;
      LODWORD(v34) = [v12 qos];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting discretionaryOverrride to %c, QOS(0x%x)", (uint8_t *)&v27, 0x22u);
    }
    [v9 set_discretionaryOverride:a3];
    [v12 setDiscretionaryOverride:a3];
    [v12 setMayBeDemotedToDiscretionary:1];
    unsigned int v24 = [v12 currentRequest];
    unsigned int v25 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v24 withOptionalTaskInfo:v12];

    if ((!sub_10000FAA8(v9) || ([v9 _seenFirstResume] & 1) == 0)
      && v25 != [v12 isDiscretionary])
    {
      id v26 = [v9 error:@"_nsurlsessiondErrorDomain" code:6];
      [v9 cancel_with_error:v26];
    }
    id v19 = +[NDStatusMonitor sharedMonitor];
    [v19 simulateNetworkChangedEvent:self identifier:a4];
  }
  else
  {
    id v19 = (id)qword_1000CB148;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [(NDBackgroundSession *)self uuid];
      uint64_t v21 = [v9 _loggableDescription];
      BOOL v22 = (void *)v21;
      if (a3)
      {
        if (a3 == 1)
        {
          int v23 = 68;
        }
        else if (a3 == 2)
        {
          int v23 = 78;
        }
        else
        {
          int v23 = 63;
        }
      }
      else
      {
        int v23 = 45;
      }
      int v27 = 138544130;
      id v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      __int16 v31 = 1024;
      int v32 = v23;
      __int16 v33 = 2112;
      CFStringRef v34 = @"com.apple.private.nsurlsession.set-discretionary-override-value";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ attempted to set discretionaryOverrride to %c but lacks required entitlement %@", (uint8_t *)&v27, 0x26u);
    }
  }
}

- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v13 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
  CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v10];

  [v13 set_TLSMaximumSupportedProtocolVersion:v5];
  [v11 set_TLSMaximumSupportedProtocolVersion:v5];
  __int16 v12 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NDBackgroundSession *)self queueUpdatesForTask:v12 updateType:7 highPriority:0];
}

- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v13 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
  CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v10];

  [v13 set_TLSMinimumSupportedProtocolVersion:v5];
  [v11 set_TLSMinimumSupportedProtocolVersion:v5];
  __int16 v12 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NDBackgroundSession *)self queueUpdatesForTask:v12 updateType:7 highPriority:0];
}

- (void)setExpectedProgressTarget:(unint64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v13 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
  CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v10];

  [v13 set_expectedProgressTarget:a3];
  [v11 setExpectedProgressTarget:a3];
  __int16 v12 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NDBackgroundSession *)self queueUpdatesForTask:v12 updateType:6 highPriority:0];
}

- (void)setBytesPerSecondLimit:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  CFErrorRef v11 = +[NSNumber numberWithUnsignedInteger:a4];
  __int16 v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  id v13 = (id)qword_1000CB148;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(NDBackgroundSession *)self uuid];
    __int16 v15 = [v9 _loggableDescription];
    int v17 = 138543874;
    int v18 = v14;
    __int16 v19 = 2114;
    unsigned int v20 = v15;
    __int16 v21 = 2048;
    int64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting limit of %lld bytes per second", (uint8_t *)&v17, 0x20u);
  }
  [v9 set_bytesPerSecondLimit:a3];
  [v12 setBytesPerSecondLimit:a3];
  __int16 v16 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NDBackgroundSession *)self queueUpdatesForTask:v16 updateType:5 highPriority:0];
}

- (void)setLoadingPoolPriority:(double)a3 forTaskWithIdentifier:(unint64_t)a4
{
  id v7 = +[NSXPCConnection currentConnection];
  unsigned __int8 v8 = sub_10000BE38(v7, @"com.apple.private.nsurlsession.set-task-priority");

  if (v8)
  {
    identifiersToTasks = self->_identifiersToTasks;
    BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
    CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v10];

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v13 = +[NSNumber numberWithUnsignedInteger:a4];
    unsigned int v14 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v13];

    __int16 v15 = (id)qword_1000CB148;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(NDBackgroundSession *)self uuid];
      int v17 = [v11 _loggableDescription];
      int v21 = 138543874;
      int64_t v22 = v16;
      __int16 v23 = 2114;
      unsigned int v24 = v17;
      __int16 v25 = 2048;
      double v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting loading priority to %f", (uint8_t *)&v21, 0x20u);
    }
    [v11 set_loadingPriority:a3];
    [v14 setLoadingPriority:a3];
    int v18 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NDBackgroundSession *)self queueUpdatesForTask:v18 updateType:4 highPriority:0];
  }
  else
  {
    CFErrorRef v11 = (id)qword_1000CB148;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = [(NDBackgroundSession *)self uuid];
      clientBundleID = self->_clientBundleID;
      int v21 = 138543874;
      int64_t v22 = v19;
      __int16 v23 = 2112;
      unsigned int v24 = clientBundleID;
      __int16 v25 = 2112;
      double v26 = COERCE_DOUBLE(@"com.apple.private.nsurlsession.set-task-priority");
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %@ tried to set the loading priority of a task but is missing the %@ entitlement", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  id v7 = +[NSXPCConnection currentConnection];
  unsigned __int8 v8 = sub_10000BE38(v7, @"com.apple.private.nsurlsession.set-task-priority");

  if (v8)
  {
    identifiersToTasks = self->_identifiersToTasks;
    BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
    CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v10];

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v13 = +[NSNumber numberWithUnsignedInteger:a4];
    unsigned int v14 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v13];

    __int16 v15 = (id)qword_1000CB148;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(NDBackgroundSession *)self uuid];
      int v17 = [v11 _loggableDescription];
      *(_DWORD *)buf = 138543874;
      id v46 = v16;
      __int16 v47 = 2114;
      BOOL v48 = v17;
      __int16 v49 = 2048;
      CFStringRef v50 = (const __CFString *)a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting priority to %ld", buf, 0x20u);
    }
    unsigned __int8 v18 = [v14 hasStarted];
    if (a3 > 300) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if ((v19 & 1) == 0 && [v14 isDiscretionary])
    {
      unsigned int v20 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:0];
      int v21 = [v20 configuration];
      int64_t v22 = [v21 _socketStreamProperties];
      id v23 = [v22 mutableCopy];

      unsigned int v24 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:0];
      __int16 v25 = [v24 configuration];
      if ([v25 allowsCellularAccess])
      {
        double v26 = [v14 originalRequest];
        unsigned int v27 = [v26 allowsCellularAccess];

        if (v27) {
          [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:kCFStreamPropertyNoCellular];
        }
      }
      else
      {
      }
      [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:kCFStreamPropertyDUETConditional];
      uint64_t v30 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:0];
      __int16 v31 = [v30 configuration];
      unsigned __int8 v32 = [v31 _duetPreauthorized];

      if ((v32 & 1) == 0)
      {
        __int16 v33 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:0];
        CFStringRef v34 = [v33 configuration];
        unsigned int v35 = [v34 _requiresPowerPluggedIn];

        if (v35)
        {
          uint64_t v43 = kConditionalConnectionRequirementPowerPluggedIn;
          id v44 = &__kCFBooleanTrue;
          unsigned int v36 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          [v23 setObject:v36 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
        }
        else
        {
          uint64_t v41 = kConditionalConnectionIsDiscretionary;
          id v42 = &__kCFBooleanFalse;
          unsigned int v36 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          [v23 setObject:v36 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
        }
      }
      [v11 set_legacySocketStreamProperties:v23];
      [v14 setDiscretionary:0];
    }
    [v14 setBasePriority:a3];
    [v14 setBasePrioritySetExplicitly:1];
    identifiersToMonitors = self->_identifiersToMonitors;
    __int16 v38 = +[NSNumber numberWithUnsignedInteger:a4];
    id v39 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v38];

    [v39 setBasePriority:a3];
    sub_10000F9CC(v11, (id)a3, self->_monitoredApplication);
    unsigned __int8 v40 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NDBackgroundSession *)self queueUpdatesForTask:v40 updateType:12 highPriority:0];
  }
  else
  {
    CFErrorRef v11 = (id)qword_1000CB148;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v28 = [(NDBackgroundSession *)self uuid];
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      id v46 = v28;
      __int16 v47 = 2112;
      BOOL v48 = clientBundleID;
      __int16 v49 = 2112;
      CFStringRef v50 = @"com.apple.private.nsurlsession.set-task-priority";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %@ tried to set the priority of a task but is missing the %@ entitlement", buf, 0x20u);
    }
  }
}

- (void)setDescription:(id)a3 forTask:(unint64_t)a4
{
  id v13 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  unsigned __int8 v8 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v7];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v10 = +[NSNumber numberWithUnsignedInteger:a4];
  CFErrorRef v11 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v10];

  [v11 setTaskDescription:v13];
  [v8 setTaskDescription:v13];
  __int16 v12 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NDBackgroundSession *)self queueUpdatesForTask:v12 updateType:0 highPriority:1];
}

- (void)setPropertyOnStreamWithIdentifier:(unint64_t)a3 propDict:(id)a4 propKey:(id)a5 withReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void (**)(id, id))a6;
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  unsigned int v14 = +[NSNumber numberWithUnsignedInteger:a3];
  __int16 v15 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v14];

  __int16 v16 = (id)qword_1000CB148;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [(NDBackgroundSession *)self uuid];
    unsigned __int8 v18 = [v15 _loggableDescription];
    clientBundleID = self->_clientBundleID;
    int v24 = 138544130;
    __int16 v25 = v17;
    __int16 v26 = 2114;
    unsigned int v27 = v18;
    __int16 v28 = 2112;
    __int16 v29 = clientBundleID;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setPropertyOnStreamWithIdentifier, client %@ property %@", (uint8_t *)&v24, 0x2Au);
  }
  if (v10 && v11 && v12)
  {
    identifiersToStreams = self->_identifiersToStreams;
    if (identifiersToStreams)
    {
      int v21 = +[NSNumber numberWithUnsignedInteger:a3];
      int64_t v22 = [(NSMutableDictionary *)identifiersToStreams objectForKeyedSubscript:v21];
      id v23 = [v22 setProperty:v10 forKey:v11];
    }
    else
    {
      id v23 = 0;
    }
    v12[2](v12, v23);
  }
}

- (void)resumeTaskWithIdentifier:(unint64_t)a3 withProperties:(id)a4
{
  id v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = +[NSNumber numberWithUnsignedInteger:a3];
  __int16 v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  id v13 = (id)qword_1000CB148;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(NDBackgroundSession *)self uuid];
    __int16 v15 = [v9 _loggableDescription];
    int v27 = 138543874;
    __int16 v28 = v14;
    __int16 v29 = 2114;
    __int16 v30 = v15;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resumeTaskWithIdentifier, props %@", (uint8_t *)&v27, 0x20u);
  }
  if (v12)
  {
    if ([v12 state] == (id)1
      && (__int16 v16 = (char *)[v12 suspendCount] - 1, objc_msgSend(v12, "setSuspendCount:", v16), !v16))
    {
      [v12 setState:0];
      [v12 setQos:qos_class_self()];
      unsigned __int8 v18 = +[UMUserManager sharedManager];
      char v19 = [v18 currentPersona];
      unsigned int v20 = [v19 userPersonaUniqueString];
      [v12 setPersonaUniqueString:v20];

      int v21 = (id)qword_1000CB148;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v22 = [(NDBackgroundSession *)self uuid];
        id v23 = [v9 _loggableDescription];
        unsigned int v24 = [v12 qos];
        int v27 = 138543874;
        __int16 v28 = v22;
        __int16 v29 = 2114;
        __int16 v30 = v23;
        __int16 v31 = 1024;
        LODWORD(v32) = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resuming, QOS(0x%x)", (uint8_t *)&v27, 0x1Cu);
      }
      __int16 v25 = [(NDBackgroundSession *)self sanitizeTaskProperties:v6];
      [v12 setAdditionalProperties:v25];

      [(NDBackgroundSession *)self configureAdditionalPropertiesOnTask:v9 taskInfo:v12];
      __int16 v26 = [v9 currentRequest];
      [v12 setCurrentRequest:v26];

      [(NSXPCProxyCreating *)self->_clientProxy backgroundTaskDidResume:a3];
      [v9 startResourceTimer];
      [(NDBackgroundSession *)self taskShouldResume:a3];
    }
    else
    {
      int v17 = +[NSNumber numberWithUnsignedInteger:a3];
      [(NDBackgroundSession *)self queueUpdatesForTask:v17 updateType:11 highPriority:1];
    }
  }
}

- (void)suspendTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v6];

  unsigned __int8 v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NDBackgroundSession *)self uuid];
    id v10 = [v7 _loggableDescription];
    int v13 = 138543618;
    unsigned int v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ suspendTaskWithIdentifier", (uint8_t *)&v13, 0x16u);
  }
  if (v7)
  {
    id v11 = (char *)[v7 suspendCount];
    [v7 setSuspendCount:v11 + 1];
    if (!v11)
    {
      [v7 setState:1];
      [(NSXPCProxyCreating *)self->_clientProxy backgroundTaskDidSuspend:a3];
      [(NDBackgroundSession *)self taskShouldSuspend:a3];
    }
    __int16 v12 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NDBackgroundSession *)self queueUpdatesForTask:v12 updateType:11 highPriority:1];
  }
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v6];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v9];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [(NDBackgroundSession *)self uuid];
    int v13 = [v7 _loggableDescription];
    int v14 = 138543618;
    __int16 v15 = v12;
    __int16 v16 = 2114;
    int v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ cancelTaskWithIdentifier", (uint8_t *)&v14, 0x16u);
  }
  [v10 setState:2];
  [v10 setResumedAndWaitingForEarliestBeginDate:0];
  [v7 cancel];
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  id v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = +[NSNumber numberWithUnsignedInteger:a3];
  __int16 v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  [v12 setState:2];
  [v12 setResumedAndWaitingForEarliestBeginDate:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003014C;
    v17[3] = &unk_1000B5508;
    v17[4] = self;
    id v14 = v9;
    v17[5] = v14;
    v17[6] = v6;
    [v14 cancelByProducingResumeData:v17];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
      goto LABEL_7;
    }
    int v13 = v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100030288;
    v16[3] = &unk_1000B5508;
    v16[4] = self;
    id v15 = v9;
    v16[5] = v15;
    v16[6] = v6;
    [v15 cancelByProducingResumeData:v16];
  }

LABEL_7:
}

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v27 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t))a7;
  id v15 = (id)qword_1000CB148;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [(NDBackgroundSession *)self uuid];
    int v17 = [(NDBackgroundSession *)self descriptionForRequest:v12];
    *(_DWORD *)buf = 138544130;
    __int16 v29 = v16;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2048;
    unint64_t v33 = a5;
    __int16 v34 = 2112;
    unsigned int v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> dataTaskWithRequest: %@", buf, 0x2Au);
  }
  BOOL v18 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v12 withOptionalTaskInfo:0];
  char v19 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v18];
  unsigned int v20 = [v19 dataTaskWithRequest:v12];

  id v21 = [objc_alloc((Class)__NSCFURLSessionTaskInfo) initWithDataTask:v20 uniqueIdentifier:v13 bundleID:self->_clientBundleID sessionID:self->_identifier];
  int64_t v22 = v21;
  if (v20) {
    BOOL v23 = v21 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  uint64_t v24 = !v23;
  if (v23)
  {
    __int16 v25 = (id)qword_1000CB148;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v26;
      __int16 v30 = 2112;
      id v31 = v20;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v22;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);
    }
  }
  else
  {
    [v20 setOriginalRequest:v27];
    if (!self->_clientImplementsWillSendRequest || !self->_sendsLaunchEvents) {
      [v22 setShouldCancelOnDisconnect:1];
    }
    [v22 setDisablesRetry:!self->_retryDataTasks];
    [(NDBackgroundSession *)self performCommonSetupForTask:v20 taskInfo:v22 identifier:a5 discretionaryStatus:v18];
  }
  v14[2](v14, v24);
}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 sandboxExtensionData:(id)a6 identifier:(unint64_t)a7 uniqueIdentifier:(id)a8 potentialCredentials:(id)a9 reply:(id)a10
{
  id v37 = a3;
  id v33 = a4;
  id v15 = a5;
  id v35 = a6;
  id v36 = a8;
  id v34 = a9;
  __int16 v16 = (void (**)(id, void))a10;
  int v17 = (id)qword_1000CB148;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = [(NDBackgroundSession *)self uuid];
    char v19 = [(NDBackgroundSession *)self descriptionForRequest:v37];
    *(_DWORD *)buf = 138544386;
    unsigned __int8 v40 = v18;
    __int16 v41 = 2114;
    id v42 = v36;
    __int16 v43 = 2048;
    unint64_t v44 = a7;
    __int16 v45 = 2112;
    id v46 = v19;
    __int16 v47 = 2112;
    id v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithRequest: %@ fromFile: %@", buf, 0x34u);
  }
  BOOL v20 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v37 withOptionalTaskInfo:0];
  if (v15)
  {
    id v21 = [(NDBackgroundSession *)self makeTempUploadFile:v15 withExtensionData:v35];
    if (!v21)
    {
      v16[2](v16, 0);
      goto LABEL_24;
    }
    int64_t v22 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v20];
    BOOL v23 = [v22 uploadTaskWithRequest:v37 fromFile:v21];
  }
  else
  {
    int64_t v22 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v20];
    BOOL v23 = [v22 uploadTaskWithStreamedRequest:v37];
    id v21 = 0;
  }

  id v24 = [objc_alloc((Class)__NSCFURLSessionTaskInfo) initWithUploadTask:v23 uniqueIdentifier:v36 bundleID:self->_clientBundleID sessionID:self->_identifier];
  __int16 v25 = v24;
  if (v23) {
    BOOL v26 = v24 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  uint64_t v27 = !v26;
  if (v26)
  {
    __int16 v30 = (id)qword_1000CB148;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543874;
      unsigned __int8 v40 = v31;
      __int16 v41 = 2112;
      id v42 = v23;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)v25;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);
    }
  }
  else
  {
    if (v34)
    {
      __int16 v28 = +[Daemon sharedDaemon];
      unsigned __int8 v29 = [v28 isInSyncBubble];

      if ((v29 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100030BB0;
          v38[3] = &unk_1000B54E0;
          v38[4] = self;
          [v34 enumerateKeysAndObjectsUsingBlock:v38];
        }
      }
    }
    [v23 setOriginalRequest:v33];
    [v25 setFileURL:v21];
    [(NDBackgroundSession *)self performCommonSetupForTask:v23 taskInfo:v25 identifier:a7 discretionaryStatus:v20];
  }
  v16[2](v16, v27);

LABEL_24:
}

- (void)uploadTaskWithResumableUploadState:(id)a3 request:(id)a4 originalRequest:(id)a5 fromFile:(id)a6 sandboxExtensionData:(id)a7 identifier:(unint64_t)a8 uniqueIdentifier:(id)a9 potentialCredentials:(id)a10 reply:(id)a11
{
  id v38 = a3;
  id v40 = a4;
  id v35 = a5;
  id v16 = a6;
  id v37 = a7;
  id v39 = a9;
  id v36 = a10;
  int v17 = (void (**)(id, void))a11;
  BOOL v18 = (id)qword_1000CB148;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    char v19 = [(NDBackgroundSession *)self uuid];
    *(_DWORD *)buf = 138543874;
    __int16 v43 = v19;
    __int16 v44 = 2114;
    id v45 = v39;
    __int16 v46 = 2048;
    unint64_t v47 = a8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithResumableUploadState", buf, 0x20u);
  }
  BOOL v20 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v40 withOptionalTaskInfo:0];
  if (v16)
  {
    id v21 = [(NDBackgroundSession *)self makeTempUploadFile:v16 withExtensionData:v37];
    if (!v21)
    {
      v17[2](v17, 0);
      goto LABEL_26;
    }
    int64_t v22 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v20];
    BOOL v23 = [v22 uploadTaskWithRequest:v40 fromFile:v21];
  }
  else
  {
    int64_t v22 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v20];
    BOOL v23 = [v22 uploadTaskWithStreamedRequest:v40];
    id v21 = 0;
  }

  if (v38) {
    [v23 setResumableUploadState:v38];
  }
  id v24 = [v23 resumableUploadState:a8];
  [v24 setUploadFile:v21];

  id v25 = [objc_alloc((Class)__NSCFURLSessionTaskInfo) initWithUploadTask:v23 uniqueIdentifier:v39 bundleID:self->_clientBundleID sessionID:self->_identifier];
  BOOL v26 = v25;
  if (v23) {
    BOOL v27 = v25 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  uint64_t v28 = !v27;
  if (v27)
  {
    id v31 = (id)qword_1000CB148;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v43 = v32;
      __int16 v44 = 2112;
      id v45 = v23;
      __int16 v46 = 2112;
      unint64_t v47 = (unint64_t)v26;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);
    }
  }
  else
  {
    if (v36)
    {
      unsigned __int8 v29 = +[Daemon sharedDaemon];
      unsigned __int8 v30 = [v29 isInSyncBubble];

      if ((v30 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1000312B0;
          v41[3] = &unk_1000B54E0;
          v41[4] = self;
          [v36 enumerateKeysAndObjectsUsingBlock:v41];
        }
      }
    }
    [v23 setOriginalRequest:v35];
    [v26 setFileURL:v21];
    [(NDBackgroundSession *)self performCommonSetupForTask:v23 taskInfo:v26 identifier:v34 discretionaryStatus:v20];
  }
  v17[2](v17, v28);

LABEL_26:
}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 downloadFilePath:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a7;
  id v15 = (void (**)(id, uint64_t))a8;
  id v16 = (id)qword_1000CB148;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [(NDBackgroundSession *)self uuid];
    BOOL v18 = [(NDBackgroundSession *)self descriptionForRequest:v14];
    *(_DWORD *)buf = 138544130;
    id v40 = v17;
    __int16 v41 = 2114;
    id v42 = v38;
    __int16 v43 = 2048;
    unint64_t v44 = a6;
    __int16 v45 = 2112;
    __int16 v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> downloadTaskWithRequest: %@", buf, 0x2Au);
  }
  if ([v14 _isSafeRequestForBackgroundDownload])
  {
    BOOL v19 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v14 withOptionalTaskInfo:0];
    BOOL v20 = +[Daemon sharedDaemon];
    unsigned int v21 = [v20 isPrivileged];
    int64_t v22 = v37;
    if (!v21) {
      int64_t v22 = 0;
    }
    id v35 = v22;

    [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
    BOOL v23 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v19];
    id v24 = [v23 _downloadTaskWithRequest:v14 downloadFilePath:v35];

    id v25 = [objc_alloc((Class)__NSCFURLSessionTaskInfo) initWithDownloadTask:v24 uniqueIdentifier:v38 bundleID:self->_clientBundleID sessionID:self->_identifier];
    BOOL v26 = v25;
    if (v24 && v25)
    {
      [v24 setOriginalRequest:v36];
      BOOL v27 = [v24 downloadFile];
      uint64_t v28 = [v27 path];

      if (v28)
      {
        unsigned __int8 v29 = +[NSURL fileURLWithPath:v28];
      }
      else
      {
        unsigned __int8 v29 = 0;
      }
      [v26 setDownloadFileURL:v29, v35];
      if (v28) {

      }
      [(NDBackgroundSession *)self performCommonSetupForTask:v24 taskInfo:v26 identifier:a6 discretionaryStatus:v19];
      v15[2](v15, 1);
    }
    else
    {
      id v31 = (id)qword_1000CB148;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543874;
        id v40 = v34;
        __int16 v41 = 2112;
        id v42 = v24;
        __int16 v43 = 2112;
        unint64_t v44 = (unint64_t)v26;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);
      }
      v15[2](v15, 0);
    }
  }
  else
  {
    unsigned __int8 v30 = (id)qword_1000CB148;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = [(NDBackgroundSession *)self uuid];
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      id v40 = v32;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Received an unsafe request for background download: %@ from %@", buf, 0x20u);
    }
    v15[2](v15, 0);
  }
}

- (void)downloadTaskWithResumeData:(id)a3 identifier:(unint64_t)a4 uniqueIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v27 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  id v12 = [v10 _requestFromResumeData];
  id v13 = v12;
  if (v12 && ([v12 _isSafeRequestForBackgroundDownload] & 1) != 0)
  {
    BOOL v14 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v13 withOptionalTaskInfo:0];
    [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
    id v15 = [(NDBackgroundSession *)self sessionForDiscretionaryStatus:v14];
    id v16 = [v15 downloadTaskWithResumeData:v10];

    id v17 = [objc_alloc((Class)__NSCFURLSessionTaskInfo) initWithDownloadTask:v16 uniqueIdentifier:v27 bundleID:self->_clientBundleID sessionID:self->_identifier];
    BOOL v18 = v17;
    if (v16 && v17)
    {
      BOOL v19 = [v16 downloadFile];
      BOOL v20 = [v19 path];

      if (v20)
      {
        unsigned int v21 = +[NSURL fileURLWithPath:v20];
      }
      else
      {
        unsigned int v21 = 0;
      }
      [v18 setDownloadFileURL:v21];
      if (v20) {

      }
      [v18 setExpectingResumeCallback:1];
      [(NDBackgroundSession *)self performCommonSetupForTask:v16 taskInfo:v18 identifier:a4 discretionaryStatus:v14];
      v11[2](v11, 1);
    }
    else
    {
      BOOL v23 = (id)qword_1000CB148;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v26 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543874;
        unsigned __int8 v29 = v26;
        __int16 v30 = 2112;
        id v31 = (NSString *)v16;
        __int16 v32 = 2112;
        id v33 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);
      }
      v11[2](v11, 0);
    }
  }
  else
  {
    int64_t v22 = (id)qword_1000CB148;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v24 = [(NDBackgroundSession *)self uuid];
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v29 = v24;
      __int16 v30 = 2112;
      id v31 = clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Received a background download request from unsafe resume data from %@", buf, 0x16u);
    }
    v11[2](v11, 0);
  }
}

- (void)pingForXPCObjectValidityWithReply:(id)a3
{
}

- (void)performCommonSetupForTask:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5 discretionaryStatus:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(NDBackgroundSession *)self priorityForDiscretionaryStatus:v6];
  sub_10000F9CC(v10, v12, self->_monitoredApplication);
  [v10 setTaskIdentifier:a5];
  id v13 = [v11 uniqueIdentifier];
  [v10 set_uniqueIdentifier:v13];

  BOOL v14 = [v11 storagePartitionIdentifier];
  [v10 set_storagePartitionIdentifier:v14];

  id v15 = [v11 pathToDownloadTaskFile];
  [v10 set_pathToDownloadTaskFile:v15];

  [v11 setIdentifier:a5];
  +[NSDate timeIntervalSinceReferenceDate];
  [v11 setCreationTime:];
  [v11 setBasePriority:v12];
  [v11 setDiscretionary:v6];
  if ([(NDApplication *)self->_monitoredApplication hasForegroundBackgroundStates]) {
    BOOL v16 = !self->_discretionary;
  }
  else {
    BOOL v16 = 0;
  }
  [v11 setMayBeDemotedToDiscretionary:v16];
  [v11 setSuspendCount:1];
  [(NDBackgroundSession *)self setupDASPropertiesOnTask:v10 taskInfo:v11 discretionaryStatus:v6];
  [(NDBackgroundSession *)self addOutstandingTaskWithIdentifier:a5];
  id v17 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)self->_tasksToIdentifiers setObject:v17 forKeyedSubscript:v10];

  identifiersToTasks = self->_identifiersToTasks;
  BOOL v19 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)identifiersToTasks setObject:v10 forKeyedSubscript:v19];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  unsigned int v21 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)identifiersToTaskInfo setObject:v11 forKeyedSubscript:v21];

  int64_t v22 = (id)qword_1000CB148;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = [(NDBackgroundSession *)self uuid];
    id v24 = [v10 _loggableDescription];
    int v26 = 138543618;
    id v27 = v23;
    __int16 v28 = 2114;
    unsigned __int8 v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ enqueueing", (uint8_t *)&v26, 0x16u);
  }
  id v25 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NDBackgroundSession *)self queueUpdatesForTask:v25 updateType:14 highPriority:0];

  [(NDBackgroundSession *)self enqueueTaskWithIdentifier:a5];
}

- (void)setupDASPropertiesOnTask:(id)a3 taskInfo:(id)a4 discretionaryStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(NDApplication *)self->_clientApplication currentRequestDelay];
  double v11 = v10;
  id v12 = [v8 _effectiveConfiguration];
  unsigned __int8 v13 = [v12 _duetPreauthorized];

  if (v13)
  {
    BOOL v14 = (id)qword_1000CB148;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NDBackgroundSession *)self uuid];
      BOOL v16 = [v8 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v15;
      __int16 v46 = 2114;
      unint64_t v47 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ is duet preauthorized", buf, 0x16u);
    }
  }
  else
  {
    BOOL v14 = [v8 _copySocketStreamProperties];
    uint64_t v43 = kCFStreamPropertyConditionalConnectionProperties;
    id v17 = -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:");
    __int16 v41 = v17;
    if (v17) {
      id v18 = [v17 mutableCopy];
    }
    else {
      id v18 = (id)objc_opt_new();
    }
    BOOL v19 = v18;
    BOOL v20 = [v8 _legacySocketStreamProperties:v41];
    if (v20)
    {
      unsigned int v21 = [v8 _legacySocketStreamProperties];
      id v22 = [v21 mutableCopy];
    }
    else
    {
      id v22 = (id)objc_opt_new();
    }

    BOOL v23 = objc_opt_new();
    id v24 = [v8 _loggableDescription];
    [v23 setObject:v24 forKeyedSubscript:kConditionalConnectionActivityName];

    if ([v9 taskKind] == (id)1
      || [v9 taskKind] == (id)2
      && ([v8 originalRequest],
          id v25 = objc_claimAutoreleasedReturnValue(),
          [v25 HTTPBodyStream],
          int v26 = objc_claimAutoreleasedReturnValue(),
          v26,
          v25,
          v26))
    {
      [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionIsUpload];
    }
    [v8 set_DuetActivityProperties:v23];
    if (v5 && v11 > 0.0)
    {
      id v27 = [v9 currentRequest];
      [v27 _timeWindowDelay];
      double v29 = v28;

      if (v11 > v29)
      {
        __int16 v30 = (id)qword_1000CB148;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [(NDBackgroundSession *)self uuid];
          __int16 v32 = [v9 _loggableDescription];
          *(_DWORD *)buf = 138543874;
          __int16 v45 = v31;
          __int16 v46 = 2114;
          unint64_t v47 = v32;
          __int16 v48 = 2048;
          double v49 = v11;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ adding delay of %f", buf, 0x20u);
        }
        id v33 = +[NSNumber numberWithDouble:v11];
        [v19 setObject:v33 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];

        [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionIsDiscretionary];
      }
    }
    uint64_t v34 = [v8 _effectiveConfiguration];
    unsigned int v35 = [v34 _onBehalfOfPairedDevice];

    if (v35) {
      [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionOnBehalfOfPairedDevice];
    }
    if ([v9 isDiscretionary] && objc_msgSend(v9, "startedUserInitiated"))
    {
      id v36 = self->_clientApplication;
      if (self->_infersDiscretionary)
      {
        monitoredApplication = self->_monitoredApplication;
        if (monitoredApplication)
        {
          id v38 = monitoredApplication;

          id v36 = v38;
        }
      }
      if ([(NDApplication *)v36 isInTransitionalDiscretionaryPeriod]) {
        [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionInTransitionalDiscretionaryPeriod];
      }
    }
    if (self->_shouldElevateDiscretionaryPriority) {
      [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionRequirementDiscretionaryElevated];
    }
    id v39 = [v9 additionalProperties];
    id v40 = [v39 objectForKeyedSubscript:@"TimeoutIntervalForResource"];

    if (v40) {
      [v19 setObject:v40 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];
    }
    [v22 setObject:v19 forKeyedSubscript:v43];
    [v8 set_legacySocketStreamProperties:v22];
  }
}

- (void)wakeUpClient:(int64_t)a3
{
  if (a3)
  {
    if (self->_sendsLaunchEvents)
    {
      if ([(NDApplication *)self->_clientApplication supportsWakes])
      {
        if (self->_obliterated)
        {
          BOOL v5 = (id)qword_1000CB148;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v6 = [(NDBackgroundSession *)self uuid];
            clientBundleID = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            id v39 = v6;
            __int16 v40 = 2112;
            __int16 v41 = clientBundleID;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since session is obliterated", buf, 0x16u);
          }
        }
        else if ([(NDBackgroundSession *)self clientIsActive])
        {
          BOOL v5 = (id)qword_1000CB148;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [(NDBackgroundSession *)self uuid];
            BOOL v16 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            id v39 = v15;
            __int16 v40 = 2112;
            __int16 v41 = v16;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since it's already connected", buf, 0x16u);
          }
        }
        else if ([(NDApplication *)self->_clientApplication backgroundUpdatesEnabled])
        {
          id v17 = +[NSUUID UUID];
          BOOL v5 = [v17 UUIDString];

          id v18 = [PendingCallback alloc];
          id v37 = v5;
          BOOL v19 = +[NSArray arrayWithObjects:&v37 count:1];
          BOOL v20 = [(PendingCallback *)v18 initWithCallbackType:3 taskIdentifier:0 args:v19];

          unsigned int v21 = [PendingCallback alloc];
          id v36 = v5;
          id v22 = +[NSArray arrayWithObjects:&v36 count:1];
          BOOL v23 = [(PendingCallback *)v21 initWithCallbackType:4 taskIdentifier:0 args:v22];

          [(NDCallbackQueue *)self->_callbackQueue addPendingCallbackToFront:v20];
          [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v23 wakeRequirement:0];
          id v24 = self->_clientBundleID;
          id v25 = (id)qword_1000CB148;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = [(NDBackgroundSession *)self uuid];
            *(_DWORD *)buf = 138543618;
            id v39 = v26;
            __int16 v40 = 2112;
            __int16 v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Waking up the client app: %@", buf, 0x16u);
          }
          clientApplication = self->_clientApplication;
          identifier = self->_identifier;
          double v29 = [(NDBackgroundSession *)self uuid];
          unsigned __int8 v30 = [(NDApplication *)clientApplication wakeForSessionIdentifier:identifier withSessionUUID:v29 wakeRequirement:a3];

          if ((v30 & 1) == 0)
          {
            id v31 = (id)qword_1000CB148;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = [(NDBackgroundSession *)self uuid];
              *(_DWORD *)buf = 138543618;
              id v39 = v34;
              __int16 v40 = 2112;
              __int16 v41 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Failed to wake app: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          BOOL v5 = (id)qword_1000CB148;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v32 = [(NDBackgroundSession *)self uuid];
            id v33 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            id v39 = v32;
            __int16 v40 = 2112;
            __int16 v41 = v33;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since background updates are not enabled", buf, 0x16u);
          }
        }
      }
      else
      {
        if ([(NDApplication *)self->_clientApplication maySupportWakesLater])
        {
          id v12 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100032D64;
          v35[3] = &unk_1000B6420;
          v35[4] = self;
          v35[5] = a3;
          [v12 performWake:v35 uponNotification:self->_clientBundleID sessionIdentifier:self->_identifier];
        }
        BOOL v5 = (id)qword_1000CB148;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v13 = [(NDBackgroundSession *)self uuid];
          BOOL v14 = self->_clientBundleID;
          *(_DWORD *)buf = 138543618;
          id v39 = v13;
          __int16 v40 = 2112;
          __int16 v41 = v14;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since it doesn't support app wakes", buf, 0x16u);
        }
      }
    }
    else
    {
      BOOL v5 = (id)qword_1000CB148;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = [(NDBackgroundSession *)self uuid];
        double v11 = self->_clientBundleID;
        *(_DWORD *)buf = 138543618;
        id v39 = v10;
        __int16 v40 = 2112;
        __int16 v41 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since sessionSendsLaunchEvents is NO", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NDBackgroundSession *)self uuid];
      id v9 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      id v39 = v8;
      __int16 v40 = 2112;
      __int16 v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since wake request is unnecessary", buf, 0x16u);
    }
  }
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v6];

  if (!v7)
  {
LABEL_4:
    double v10 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NDBackgroundSession *)self queueUpdatesForTask:v10 updateType:13 highPriority:0];

    [(NDCallbackQueue *)self->_callbackQueue drainCallbacksForTaskIdentifier:a3];
    if (![(NDCallbackQueue *)self->_callbackQueue count]
      && ![(NDBackgroundSession *)self sessionHasOutstandingTasks])
    {
      double v11 = [(NDBackgroundSession *)self invalidateReply];

      if (v11)
      {
        id v12 = [(NDBackgroundSession *)self invalidateReply];
        [(NDBackgroundSession *)self setInvalidateReply:0];
        [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:v12];
      }
    }
    goto LABEL_11;
  }
  if ([v7 state] == (id)3)
  {
    [(NSMutableDictionary *)self->_tasksToIdentifiers removeObjectForKey:v7];
    id v8 = self->_identifiersToTasks;
    id v9 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    goto LABEL_4;
  }
  unsigned __int8 v13 = (id)qword_1000CB148;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(NDBackgroundSession *)self uuid];
    id v15 = [v7 _loggableDescription];
    int v16 = 138543618;
    id v17 = v14;
    __int16 v18 = 2114;
    BOOL v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ skipping acknowledgement teardown since it's not actually complete", (uint8_t *)&v16, 0x16u);
  }
LABEL_11:
}

- (void)errorOccurredDuringAuthCallbackDelivery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    double v10 = [(NDBackgroundSession *)self uuid];
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Encountered error %@ error delivering auth challenge to client, performing default handling", (uint8_t *)&v11, 0x16u);
  }
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  v7[2](v7, 1, 0);
}

- (void)errorOccurredDuringFinishedCallbackDelivery:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id)qword_1000CB148;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v7 = [(NDBackgroundSession *)self uuid];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Encountered error %@ during task completion callback delivery", (uint8_t *)&v8, 0x16u);
  }
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  if (![(NDBackgroundSession *)self sessionHasOutstandingTasks]) {
    [(NDBackgroundSession *)self wakeUpClient:1];
  }
}

- (BOOL)errorIfBlockedTracker:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSString *)self->_monitoredAppBundleID UTF8String];
  id v8 = [v7 host];
  [v8 UTF8String];
  int v9 = ne_tracker_check_is_hostname_blocked();

  if (v9 == 1)
  {
    __int16 v10 = (id)qword_1000CB148;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = [(NDBackgroundSession *)self uuid];
      id v14 = [v6 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      int v16 = v13;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ is blocked due to tracker policy", buf, 0x16u);
    }
    id v11 = [v6 error:NSURLErrorDomain code:-1004];
    [v6 cancel_with_error:v11];
  }
  return v9 == 1;
}

- (id)inputStreamWithFileHandle:(id)a3 taskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  CFReadStreamRef readStream = 0;
  CFSocketNativeHandle v7 = dup((int)[v6 fileDescriptor]);
  CFStreamCreatePairWithSocket(0, v7, &readStream, 0);
  CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(NDBackgroundSession *)self uuid];
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    CFSocketNativeHandle v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Created stream with file descriptor: %d", buf, 0x12u);
  }
  [v6 closeFile];
  CFReadStreamRef v10 = readStream;
  identifiersToStreams = self->_identifiersToStreams;
  id v12 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)identifiersToStreams setObject:v10 forKeyedSubscript:v12];

  CFReadStreamRef v13 = readStream;

  return v13;
}

- (id)makeTempUploadFile:(id)a3 withExtensionData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 bytes];
  id v9 = [v7 length];
  if (v9 && !v8[(void)v9 - 1])
  {
    uint64_t v10 = sandbox_extension_consume();
    id v31 = (id)qword_1000CB148;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543874;
      unint64_t v47 = v32;
      __int16 v48 = 2112;
      double v49 = v6;
      __int16 v50 = 2048;
      uint64_t v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Consumed sandbox extension for file %@, extension = %lld", buf, 0x20u);
    }
    if (v10 < 0)
    {
      id v33 = (id)qword_1000CB148;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543874;
        unint64_t v47 = v43;
        __int16 v48 = 2080;
        double v49 = v8;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v6;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Failed to consume sandbox extension %s for fileURL %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v10 = -1;
  }
  id v11 = +[NSUUID UUID];
  id v12 = [v11 UUIDString];
  CFReadStreamRef v13 = +[NSString stringWithFormat:@"CFNetworkUpload_%@", v12];

  id v14 = [(NSURL *)self->_uploadsDirectory URLByAppendingPathComponent:v13];
  LODWORD(v12) = [v6 fileDescriptor];
  id v15 = v14;
  if (!fclonefileat((int)v12, -2, (const char *)[v15 fileSystemRepresentation], 0)) {
    goto LABEL_14;
  }
  int v16 = *__error();
  if (v16 == 45 || v16 == 18)
  {
    __int16 v17 = (id)qword_1000CB148;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543362;
      unint64_t v47 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Falling back to copy", buf, 0xCu);
    }
    id v19 = v15;
    int v20 = open((const char *)[v19 fileSystemRepresentation], 513, 384);
    if (v20 != -1)
    {
      int v21 = fcopyfile((int)[v6 fileDescriptor], v20, 0, 8u);
      close(v20);
      if (v21)
      {
        id v22 = (id)qword_1000CB148;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v38 = [(NDBackgroundSession *)self uuid];
          int v39 = *__error();
          *(_DWORD *)buf = 138543618;
          unint64_t v47 = v38;
          __int16 v48 = 1024;
          LODWORD(v49) = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error copying file: %{errno}d", buf, 0x12u);
        }
        BOOL v23 = +[NSFileManager defaultManager];
        id v24 = 0;
        [v23 removeItemAtURL:v19 error:0];
        goto LABEL_39;
      }
LABEL_14:
      id v45 = 0;
      id v44 = 0;
      unsigned __int8 v25 = [v15 getResourceValue:&v45 forKey:NSURLIsSymbolicLinkKey error:&v44];
      id v26 = v45;
      BOOL v23 = v44;
      if (v25)
      {
        if (![v26 BOOLValue])
        {
LABEL_22:
          if (v10 >= 1)
          {
            sandbox_extension_release();
            double v29 = (id)qword_1000CB148;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v30 = [(NDBackgroundSession *)self uuid];
              *(_DWORD *)buf = 138543618;
              unint64_t v47 = v30;
              __int16 v48 = 2048;
              double v49 = (unsigned char *)v10;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Released sandbox extension %lld", buf, 0x16u);
            }
          }
          id v19 = v15;

          id v24 = v19;
          goto LABEL_39;
        }
        id v27 = (id)qword_1000CB148;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v42 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543362;
          unint64_t v47 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> File is a symlink", buf, 0xCu);
        }
      }
      else
      {
        id v27 = (id)qword_1000CB148;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          unsigned int v35 = [(NDBackgroundSession *)self uuid];
          id v36 = [v23 code];
          *(_DWORD *)buf = 138543874;
          unint64_t v47 = v35;
          __int16 v48 = 2112;
          double v49 = v23;
          __int16 v50 = 2048;
          uint64_t v51 = (uint64_t)v36;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error checking resource value: %@ [%ld]", buf, 0x20u);
        }
      }

      double v28 = +[NSFileManager defaultManager];
      [v28 removeItemAtURL:v15 error:0];

      id v15 = 0;
      goto LABEL_22;
    }
    BOOL v23 = (id)qword_1000CB148;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = [(NDBackgroundSession *)self uuid];
      int v41 = *__error();
      *(_DWORD *)buf = 138543618;
      unint64_t v47 = v40;
      __int16 v48 = 1024;
      LODWORD(v49) = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error creating file: %{errno}d", buf, 0x12u);
    }
    id v24 = 0;
  }
  else
  {
    BOOL v23 = (id)qword_1000CB148;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v37 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543618;
      unint64_t v47 = v37;
      __int16 v48 = 1024;
      LODWORD(v49) = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error cloning file: %{errno}d", buf, 0x12u);
    }
    id v24 = 0;
    id v19 = v15;
  }
LABEL_39:

  return v24;
}

- (void)requeueTask:(unint64_t)a3
{
}

- (void)requeueTask:(unint64_t)a3 skipResume:(BOOL)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033EA8;
  block[3] = &unk_1000B53A0;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(workQueue, block);
}

- (void)removeOutstandingTaskWithIdentifier:(unint64_t)a3
{
  outstandingTaskIDs = self->_outstandingTaskIDs;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NSMutableArray removeObject:](outstandingTaskIDs, "removeObject:");
}

- (void)addOutstandingTaskWithIdentifier:(unint64_t)a3
{
  outstandingTaskIDs = self->_outstandingTaskIDs;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NSMutableArray addObject:](outstandingTaskIDs, "addObject:");
}

- (void)enqueueTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v14 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v6];

  id v7 = v14;
  if (v14)
  {
    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v9 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v10 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v9];

    id v11 = +[NDUserSyncStakeholder sharedStakeholder];
    id v12 = [v10 uniqueIdentifier];
    [v11 restoredTaskActive:v12];

    CFReadStreamRef v13 = +[NDUserSyncStakeholder sharedStakeholder];
    [v13 endBridgingUMTask:v10];

    id v7 = v14;
  }
}

- (void)taskShouldSuspend:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v6];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v9];

  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NDBackgroundSession *)self uuid];
    CFReadStreamRef v13 = [v7 _loggableDescription];
    int v17 = 138543618;
    __int16 v18 = v12;
    __int16 v19 = 2114;
    int v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ suspending", (uint8_t *)&v17, 0x16u);
  }
  [v7 suspend];
  identifiersToMonitors = self->_identifiersToMonitors;
  id v15 = +[NSNumber numberWithUnsignedInteger:a3];
  int v16 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v15];

  [v16 taskWillSuspend];
  if (([v10 resumedAndWaitingForEarliestBeginDate] & 1) == 0) {
    sub_10005CD1C(2, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v7, v10, 0);
  }
  [v10 setResumedAndWaitingForEarliestBeginDate:0];
}

- (void)taskShouldResume:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v6];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v9];

  if (v7) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = (id)qword_1000CB148;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [(NDBackgroundSession *)self uuid];
      __int16 v19 = [v10 _loggableDescription];
      *(_DWORD *)buf = 138544130;
      unsigned __int8 v25 = v18;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2112;
      double v29 = v7;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ cannot resume because task: %@ or taskInfo: %@ is nil", buf, 0x2Au);
    }
  }
  else
  {
    if ([v7 _hasSZExtractor])
    {
      CFReadStreamRef v13 = [v10 downloadFileURL];

      if (v13)
      {
        id v14 = [v10 downloadFileURL];
        +[NDFileUtilities removeStreamingZipModificationDate:v14];
      }
    }
    workQueue = self->_workQueue;
    dispatch_qos_class_t v16 = [v10 qos];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100034734;
    v20[3] = &unk_1000B6448;
    v20[4] = self;
    id v21 = v10;
    id v22 = v7;
    unint64_t v23 = a3;
    dispatch_block_t v17 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v16, 0, v20);
    dispatch_async(workQueue, v17);
  }
}

- (void)handleWillBeginDelayedRequestForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v11 = +[NSNumber numberWithUnsignedInteger:a3];
  id v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  if (v9 && v12)
  {
    if (!self->_clientImplementsWillBeginDelayedRequest)
    {
      id v14 = (id)qword_1000CB148;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(NDBackgroundSession *)self uuid];
        int v20 = [v9 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        id v45 = v19;
        __int16 v46 = 2114;
        unint64_t v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ skipping delayed request callback - delegate not implemented", buf, 0x16u);
      }
      goto LABEL_24;
    }
    unsigned int v13 = [v12 respondedToWillBeginDelayedRequestCallback];
    id v14 = (id)qword_1000CB148;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        dispatch_qos_class_t v16 = [(NDBackgroundSession *)self uuid];
        dispatch_block_t v17 = [v9 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        id v45 = v16;
        __int16 v46 = 2114;
        unint64_t v47 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ already replied to delayed request callback - not calling again", buf, 0x16u);
      }
LABEL_24:

      v6[2](v6);
      goto LABEL_25;
    }
    if (v15)
    {
      id v21 = [(NDBackgroundSession *)self uuid];
      id v22 = [v9 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      id v45 = v21;
      __int16 v46 = 2114;
      unint64_t v47 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ receiving delayed request callback", buf, 0x16u);
    }
    if (!self->_clientProxy
      && (!self->_sendsLaunchEvents || ![(NDApplication *)self->_clientApplication supportsWakes]))
    {
      __int16 v30 = (id)qword_1000CB148;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [(NDBackgroundSession *)self uuid];
        __int16 v32 = [v9 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        id v45 = v31;
        __int16 v46 = 2114;
        unint64_t v47 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and doesn't support wakes, continuing load for delayed request", buf, 0x16u);
      }
      [v12 setRespondedToWillBeginDelayedRequestCallback:1];
      id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 identifier]);
      [(NDBackgroundSession *)self queueUpdatesForTask:v14 updateType:9 highPriority:0];
      goto LABEL_24;
    }
    __int16 v18 = [v12 currentRequest];
    unsigned int v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    id v37 = sub_100035444;
    id v38 = &unk_1000B5490;
    int v39 = self;
    unint64_t v42 = a3;
    id v40 = v12;
    int v41 = v6;
    unint64_t v23 = objc_retainBlock(&v35);
    id v24 = [PendingCallback alloc];
    v43[0] = v18;
    unsigned __int8 v25 = objc_retainBlock(v23);
    v43[1] = v25;
    __int16 v26 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2, v35, v36, v37, v38, v39);
    id v27 = [(PendingCallback *)v24 initWithCallbackType:9 taskIdentifier:a3 args:v26];

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if ([(NDApplication *)self->_clientApplication supportsWakes]) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 0;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    [(NDCallbackQueue *)callbackQueue addPendingCallback:v27 wakeRequirement:v29];
  }
  else
  {
    __int16 v18 = (id)qword_1000CB148;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v33 = [(NDBackgroundSession *)self uuid];
      uint64_t v34 = [v12 _loggableDescription];
      *(_DWORD *)buf = 138544130;
      id v45 = v33;
      __int16 v46 = 2114;
      unint64_t v47 = v34;
      __int16 v48 = 2112;
      double v49 = v9;
      __int16 v50 = 2112;
      uint64_t v51 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ cannot handle delayed request callback because task: %@ or taskInfo: %@ is nil", buf, 0x2Au);
    }
  }

LABEL_25:
}

- (void)handleEarliestBeginDateForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  BOOL v6 = (void (**)(id, void))a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)identifiersToTasks objectForKeyedSubscript:v8];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  BOOL v11 = +[NSNumber numberWithUnsignedInteger:a3];
  id v12 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v11];

  if (([v12 resumedAndWaitingForEarliestBeginDate] & 1) == 0)
  {
    unsigned int v13 = [v9 earliestBeginDate];

    id v14 = (id)qword_1000CB148;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        dispatch_qos_class_t v16 = [(NDBackgroundSession *)self uuid];
        dispatch_block_t v17 = [v12 _loggableDescription];
        __int16 v18 = [v9 earliestBeginDate];
        *(_DWORD *)buf = 138543874;
        id v37 = v16;
        __int16 v38 = 2114;
        int v39 = v17;
        __int16 v40 = 2112;
        int v41 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ should not begin before %@", buf, 0x20u);
      }
      __int16 v19 = [v9 earliestBeginDate];
      [v19 timeIntervalSinceNow];
      double v21 = v20;

      if (v21 <= 0.0)
      {
        __int16 v28 = (id)qword_1000CB148;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [(NDBackgroundSession *)self uuid];
          __int16 v30 = [v12 _loggableDescription];
          *(_DWORD *)buf = 138543618;
          id v37 = v29;
          __int16 v38 = 2114;
          int v39 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ can begin immediately - begin date is in past", buf, 0x16u);
        }
        v6[2](v6, 0);
      }
      else
      {
        [v12 setResumedAndWaitingForEarliestBeginDate:1];
        dispatch_time_t v22 = dispatch_time(0x8000000000000000, (uint64_t)(v21 * 1000000000.0));
        workQueue = self->_workQueue;
        dispatch_qos_class_t v24 = [v12 qos];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100035CF8;
        v31[3] = &unk_1000B5468;
        id v32 = v12;
        id v33 = self;
        unint64_t v35 = a3;
        uint64_t v34 = v6;
        dispatch_block_t v25 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v24, 0, v31);
        dispatch_after(v22, workQueue, v25);
      }
    }
    else
    {
      if (v15)
      {
        __int16 v26 = [(NDBackgroundSession *)self uuid];
        id v27 = [v12 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        id v37 = v26;
        __int16 v38 = 2114;
        int v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ has not requested a begin delay", buf, 0x16u);
      }
      v6[2](v6, 0);
    }
  }
}

- (void)cancelMonitorForTask:(unint64_t)a3
{
  identifiersToMonitors = self->_identifiersToMonitors;
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v9 = [(NSMutableDictionary *)identifiersToMonitors objectForKeyedSubscript:v6];

  [v9 cancel];
  id v7 = self->_identifiersToMonitors;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v7 removeObjectForKey:v8];
}

- (BOOL)currentDiscretionaryStatus:(id)a3 withOptionalTaskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 _propertyForKey:@"_NSURLRequestIsDiscretionaryOverrideValue"];
    if (v8)
    {
      id v9 = +[NSXPCConnection currentConnection];
      unsigned int v10 = sub_10000BE38(v9, @"com.apple.private.nsurlsession.set-discretionary-override-value");

      if (v10)
      {
        BOOL v11 = (id)qword_1000CB148;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [(NDBackgroundSession *)self uuid];
          if (v7)
          {
            unsigned int v13 = [v7 _loggableDescription];
          }
          else
          {
            unsigned int v13 = @"New task";
          }
          unint64_t v35 = [(NDApplication *)self->_clientApplication bundleIdentifier];
          int v40 = 138544130;
          if ([(NDApplication *)v8 BOOLValue]) {
            int v36 = 89;
          }
          else {
            int v36 = 78;
          }
          int v41 = v12;
          __int16 v42 = 2114;
          uint64_t v43 = v13;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v35;
          __int16 v46 = 1024;
          int v47 = v36;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status by request - forcing to %c", (uint8_t *)&v40, 0x26u);
          if (v7) {
        }
          }
        LOBYTE(discretionary) = [(NDApplication *)v8 BOOLValue];
        goto LABEL_66;
      }
    }
  }
  if (!v7 || ![v7 discretionaryOverride])
  {
    id v8 = self->_clientApplication;
    if (self->_infersDiscretionary)
    {
      monitoredApplication = self->_monitoredApplication;
      if (monitoredApplication)
      {
        dispatch_time_t v22 = monitoredApplication;

        id v8 = v22;
      }
    }
    xpcConn = self->_xpcConn;
    if (xpcConn)
    {
      dispatch_qos_class_t v24 = [(NSXPCConnection *)xpcConn _xpcConnection];
      if (xpc_connection_is_extension())
      {
        int discretionary = self->_discretionary;

        if (!discretionary)
        {
          dispatch_block_t v25 = (id)qword_1000CB148;
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
LABEL_65:

            goto LABEL_66;
          }
          __int16 v26 = [(NDBackgroundSession *)self uuid];
          if (v7)
          {
            id v27 = [v7 _loggableDescription];
          }
          else
          {
            id v27 = @"Task <?>.<0>";
          }
          uint64_t v34 = [(NDApplication *)self->_clientApplication bundleIdentifier];
          int v40 = 138543874;
          int v41 = v26;
          __int16 v42 = 2114;
          uint64_t v43 = v27;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary because the connected client is an extension", (uint8_t *)&v40, 0x20u);
          if (v7) {

          }
          goto LABEL_63;
        }
      }
      else
      {
      }
    }
    __int16 v28 = +[Daemon sharedDaemon];
    unsigned int v29 = [v28 isInSyncBubble];

    if (v29)
    {
      dispatch_block_t v25 = (id)qword_1000CB148;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_64:
        LOBYTE(discretionary) = 0;
        goto LABEL_65;
      }
      __int16 v26 = [(NDBackgroundSession *)self uuid];
      if (v7)
      {
        __int16 v30 = [v7 _loggableDescription];
      }
      else
      {
        __int16 v30 = @"Task <?>.<0>";
      }
      uint64_t v34 = [(NDApplication *)v8 bundleIdentifier];
      int v40 = 138543874;
      int v41 = v26;
      __int16 v42 = 2114;
      uint64_t v43 = v30;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary, since nsurlsessiond is running in EDU sync mode", (uint8_t *)&v40, 0x20u);
      if (v7) {
    }
      }
    else
    {
      if (self->_discretionary
        || [(NDApplication *)v8 hasForegroundBackgroundStates]
        && ![(NDApplication *)v8 isForeground]
        && ![(NDApplication *)v8 hasBackgroundTaskCompletion])
      {
        dispatch_block_t v25 = (id)qword_1000CB148;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [(NDBackgroundSession *)self uuid];
          if (v7)
          {
            id v32 = [v7 _loggableDescription];
          }
          else
          {
            id v32 = @"Task <?>.<0>";
          }
          id v37 = [(NDApplication *)v8 bundleIdentifier];
          BOOL v38 = self->_discretionary;
          int v40 = 138544130;
          int v41 = v31;
          __int16 v42 = 2114;
          uint64_t v43 = v32;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v37;
          __int16 v46 = 1024;
          int v47 = v38;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is discretionary (opt-in: %d)", (uint8_t *)&v40, 0x26u);
          if (v7) {
        }
          }
        LOBYTE(discretionary) = 1;
        goto LABEL_65;
      }
      dispatch_block_t v25 = (id)qword_1000CB148;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_64;
      }
      __int16 v26 = [(NDBackgroundSession *)self uuid];
      if (v7)
      {
        id v33 = [v7 _loggableDescription];
      }
      else
      {
        id v33 = @"Task <?>.<0>";
      }
      uint64_t v34 = [(NDApplication *)v8 bundleIdentifier];
      int v40 = 138543874;
      int v41 = v26;
      __int16 v42 = 2114;
      uint64_t v43 = v33;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary", (uint8_t *)&v40, 0x20u);
      if (v7) {
    }
      }
LABEL_63:

    goto LABEL_64;
  }
  id v14 = [v7 discretionaryOverride];
  LOBYTE(discretionary) = v14 == (id)1;
  id v8 = (NDApplication *)(id)qword_1000CB148;
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_qos_class_t v16 = [(NDBackgroundSession *)self uuid];
    dispatch_block_t v17 = [v7 _loggableDescription];
    uint64_t v18 = [(NDApplication *)self->_clientApplication bundleIdentifier];
    __int16 v19 = (void *)v18;
    int v40 = 138544130;
    if (v14 == (id)1) {
      int v20 = 89;
    }
    else {
      int v20 = 78;
    }
    int v41 = v16;
    __int16 v42 = 2114;
    uint64_t v43 = v17;
    __int16 v44 = 2112;
    uint64_t v45 = v18;
    __int16 v46 = 1024;
    int v47 = v20;
    _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status - forcing to %c", (uint8_t *)&v40, 0x26u);
  }
LABEL_66:

  return discretionary;
}

- (int64_t)priorityForDiscretionaryStatus:(BOOL)a3
{
  if (a3) {
    return 600;
  }
  else {
    return 300;
  }
}

- (id)getTLSSessionCachePrefix
{
  userInitiatedSession = self->_userInitiatedSession;
  if (userInitiatedSession || (userInitiatedSession = self->_discretionaryPrioritySession) != 0)
  {
    userInitiatedSession = [userInitiatedSession _tlsSessionCachePrefix];
  }

  return userInitiatedSession;
}

- (id)getTasksForReconnection
{
  id v3 = [(NSMutableDictionary *)self->_identifiersToTaskInfo copy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000369E4;
  v8[3] = &unk_1000B5440;
  v8[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(NDBackgroundSession *)self uuid];
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543874;
    unsigned int v10 = v5;
    __int16 v11 = 2112;
    id v12 = identifier;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session: %@ get tasks for reconnection: %@", buf, 0x20u);
  }

  return v3;
}

- (void)triggerPowerlogPeriodicUpdate
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_outstandingTaskIDs;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTaskInfo, "objectForKeyedSubscript:", v7, (void)v10);
        id v9 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:v7];
        sub_10005CD1C(6, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v9, v8, 0);
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)fillInPropertiesForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v8 = a3;
  id v6 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    [v8 set_hasSZExtractor:[v6 _hasSZExtractor]];
    [v8 set_doesSZExtractorConsumeExtractedData:[v7 _doesSZExtractorConsumeExtractedData]];
  }
}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v7 = a3;
  id v6 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:a4];
  [v7 setCountOfBytesSent:[v6 countOfBytesSent]];
  [v7 setCountOfBytesReceived:[v6 countOfBytesReceived]];
  [v7 setCountOfBytesExpectedToSend:[v6 countOfBytesExpectedToSend]];
  [v7 setCountOfBytesExpectedToReceive:[v6 countOfBytesExpectedToReceive]];
}

- (void)allowReconnect
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036DD8;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)reconnectClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100037350;
  v27[3] = &unk_1000B5F10;
  void v27[4] = self;
  id v8 = v6;
  id v28 = v8;
  id v9 = v7;
  id v29 = v9;
  long long v10 = objc_retainBlock(v27);
  clientApplication = self->_clientApplication;
  identifier = self->_identifier;
  long long v13 = [(NDBackgroundSession *)self uuid];
  unsigned int v14 = [(NDApplication *)clientApplication isHandlingBackgroundURLSessionWithIdentifier:identifier withSessionUUID:v13];

  if (self->_hasBeenSignalledToDeliverPendingEvents) {
    char v15 = 0;
  }
  else {
    char v15 = v14;
  }
  dispatch_qos_class_t v16 = (id)qword_1000CB148;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      uint64_t v18 = [(NDBackgroundSession *)self uuid];
      int v20 = self->_identifier;
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = clientBundleID;
      __int16 v34 = 2112;
      unint64_t v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Waiting for notification to deliver pending events for client session: <%@>.<%@>", buf, 0x20u);
    }
    double v21 = objc_retainBlock(v10);
    id completeReconnectionBlock = self->_completeReconnectionBlock;
    self->_id completeReconnectionBlock = v21;
  }
  else
  {
    if (v17)
    {
      unint64_t v23 = [(NDBackgroundSession *)self uuid];
      dispatch_block_t v25 = self->_identifier;
      dispatch_qos_class_t v24 = self->_clientBundleID;
      BOOL hasBeenSignalledToDeliverPendingEvents = self->_hasBeenSignalledToDeliverPendingEvents;
      *(_DWORD *)buf = 138544386;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = v24;
      __int16 v34 = 2112;
      unint64_t v35 = v25;
      __int16 v36 = 1024;
      BOOL v37 = hasBeenSignalledToDeliverPendingEvents;
      __int16 v38 = 1024;
      unsigned int v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Delivering pending events immediately for client session: <%@>.<%@>. Signalled already: %d, isHandlingBackgroundSession: %d", buf, 0x2Cu);
    }
    self->_BOOL hasBeenSignalledToDeliverPendingEvents = 0;
    ((void (*)(void *))v10[2])(v10);
  }
}

- (void)clientDidDisconnect
{
  id v3 = (id)qword_1000CB148;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NDBackgroundSession *)self uuid];
    uint64_t v5 = (void *)v4;
    if (self->_xpcConn) {
      int v6 = 89;
    }
    else {
      int v6 = 78;
    }
    if (self->_clientProxy) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int v20 = 138544386;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    unint64_t v23 = clientBundleID;
    __int16 v24 = 1024;
    int v25 = v6;
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 2112;
    id v29 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ disconnected, XPC(%c) proxy(%c) for %@", (uint8_t *)&v20, 0x2Cu);
  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    self->_clientProxy = 0;

    self->_int clientPID = -1;
    [(NDBackgroundSession *)self cancelTasksRequiringClientConnectionAndResumeUnstartedTasks];
    if (![(NDBackgroundSession *)self sessionHasOutstandingTasks]
      && ![(NDCallbackQueue *)self->_callbackQueue count])
    {
      [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:0];
    }
  }
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;

  connectedExtension = self->_connectedExtension;
  if (connectedExtension)
  {
    [(NDApplication *)connectedExtension removeObserver:self];
    long long v13 = self->_connectedExtension;
    self->_connectedExtension = 0;
  }
  [(NDBackgroundSession *)self setInvalidateReply:0];
  unsigned int v14 = [(NSURL *)self->_sessionDirectory URLByAppendingPathComponent:@"options.plist"];
  char v15 = [v14 path];

  dispatch_qos_class_t v16 = +[NDSessionManager restoreOptionsFromArchivePath:v15];
  id v17 = [v16 mutableCopy];
  uint64_t v18 = +[NSDate now];
  [v17 setObject:v18 forKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"];

  __int16 v19 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
  [v19 writeToFile:v15 atomically:1];
}

- (void)cancelTasksRequiringClientConnectionAndResumeUnstartedTasks
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = self->_outstandingTaskIDs;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v22;
    *(void *)&long long v5 = 138543618;
    long long v19 = v5;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v7);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTaskInfo, "objectForKeyedSubscript:", v8, v19);
        if ([v9 shouldCancelOnDisconnect])
        {
          [v9 setResumedAndWaitingForEarliestBeginDate:0];
          long long v10 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:v8];
          long long v11 = [v10 error:NSURLErrorDomain code:-997];
          [v10 cancel_with_error:v11];
          goto LABEL_8;
        }
        if (([v9 hasStarted] & 1) == 0)
        {
          if ([(NSString *)self->_clientBundleID isEqualToString:@"com.apple.mobileassetd"])
          {
            long long v10 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:v8];
            long long v12 = (id)qword_1000CB148;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              int v20 = [(NDBackgroundSession *)self uuid];
              id v17 = [v9 _loggableDescription];
              *(_DWORD *)buf = v19;
              __int16 v26 = v20;
              __int16 v27 = 2114;
              __int16 v28 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not resumed but client disconnected, terminating it with timeout", buf, 0x16u);
            }
            long long v11 = [v10 resourceTimeoutError];
            [v10 cancel_with_error:v11];
LABEL_8:
          }
          else
          {
            long long v13 = (id)qword_1000CB148;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              char v15 = [(NDBackgroundSession *)self uuid];
              dispatch_qos_class_t v16 = [v9 _loggableDescription];
              *(_DWORD *)buf = v19;
              __int16 v26 = v15;
              __int16 v27 = 2114;
              __int16 v28 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not resumed but client disconnected, resuming it implicitly", buf, 0x16u);
            }
            id v14 = [v9 identifier];
            long long v10 = [v9 additionalProperties];
            [(NDBackgroundSession *)self resumeTaskWithIdentifier:v14 withProperties:v10];
          }
        }
        int v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v18 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      id v4 = v18;
    }
    while (v18);
  }
}

- (BOOL)finalizeTaskCompletionWithSuppressedWake:(BOOL)a3
{
  if (![(NDBackgroundSession *)self sessionHasOutstandingTasks]
    && ![(NDBackgroundSession *)self clientIsActive])
  {
    if (!a3)
    {
      BOOL v5 = 1;
      [(NDBackgroundSession *)self wakeUpClient:1];
      return v5;
    }
    if (![(NDCallbackQueue *)self->_callbackQueue count]) {
      [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:0];
    }
  }
  return 0;
}

- (void)handleCompletionOfTask:(id)a3 identifier:(unint64_t)a4 taskInfo:(id)a5 isRecoverable:(BOOL)a6 suppressWake:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v12 = a5;
  [(NDBackgroundSession *)self cancelMonitorForTask:a4];
  sub_10005CD1C(3, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v13, v12, a6);
  [(NDBackgroundSession *)self finalizeTaskCompletionWithSuppressedWake:v7];
}

- (BOOL)clientIsActive
{
  clientProxy = self->_clientProxy;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NDBackgroundSession *)self uuid];
    uint64_t v6 = (void *)v5;
    if (clientProxy) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    if (self->_xpcConn) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy) {
      int v11 = 89;
    }
    else {
      int v11 = 78;
    }
    int v13 = 138544642;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    dispatch_qos_class_t v16 = clientBundleID;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2112;
    long long v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ is active result (%c), XPC(%c) proxy(%c) for %@", (uint8_t *)&v13, 0x32u);
  }
  return clientProxy != 0;
}

- (BOOL)sessionHasOutstandingTasks
{
  id v3 = (id)qword_1000CB148;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NDBackgroundSession *)self uuid];
    id v5 = [(NSMutableArray *)self->_outstandingTaskIDs count];
    int v7 = 138543618;
    int v8 = v4;
    __int16 v9 = 2048;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> has %lu outstanding tasks", (uint8_t *)&v7, 0x16u);
  }
  return [(NSMutableArray *)self->_outstandingTaskIDs count] != 0;
}

- (void)removeUploadFileForTaskInfo:(id)a3
{
  id v3 = [a3 fileURL];
  +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:");
}

- (void)removeDownloadFileForTaskInfo:(id)a3
{
  id v7 = a3;
  id v3 = [v7 pathToDownloadTaskFile];
  if (v3
    || ([v7 additionalProperties],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    +[NDFileUtilities removeItemAtPath:v3];
  }
  else
  {
    id v5 = [v7 downloadFileURL];

    if (v5)
    {
      uint64_t v6 = [v7 downloadFileURL];
      +[NDFileUtilities removeItemAtURL:v6];
    }
    id v3 = 0;
  }
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4 transactionMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(NDBackgroundSession *)self restoreInProgressTask:v8];
  if (v11)
  {
    id v12 = [v8 taskDescription];
    [v11 setTaskDescription:v12];

    int v13 = [v8 earliestBeginDate];
    [v11 setEarliestBeginDate:v13];

    [v11 setCountOfBytesClientExpectsToSend:[v8 countOfBytesClientExpectsToSend]];
    [v11 setCountOfBytesClientExpectsToReceive:[v8 countOfBytesClientExpectsToReceive]];
    uint64_t v14 = [v8 originalRequest];
    [v11 setOriginalRequest:v14];

    [v11 setTaskIdentifier:[v8 identifier]];
    __int16 v15 = [v8 uniqueIdentifier];
    [v11 set_uniqueIdentifier:v15];

    dispatch_qos_class_t v16 = [v8 storagePartitionIdentifier];
    [v11 set_storagePartitionIdentifier:v16];

    __int16 v17 = [v8 pathToDownloadTaskFile];
    [v11 set_pathToDownloadTaskFile:v17];

    [v11 setState:1];
    [v8 creationTime];
    [v11 setStartTime:];
    sub_10000F9CC(v11, [v8 basePriority], self->_monitoredApplication);
    [v8 loadingPriority];
    [v11 set_loadingPriority:];
    [v11 set_bytesPerSecondLimit:[v8 bytesPerSecondLimit]];
    [v11 set_expectedProgressTarget:[v8 expectedProgressTarget]];
    [v11 set_TLSMinimumSupportedProtocolVersion:[v8 _TLSMinimumSupportedProtocolVersion]];
    [v11 set_TLSMaximumSupportedProtocolVersion:[v8 _TLSMaximumSupportedProtocolVersion]];
    int v18 = [v11 _extractor];

    if (!v18)
    {
      __int16 v19 = [v8 _extractor];
      [v11 set_extractor:v19];
    }
    [v11 set_hasSZExtractor:[v8 _hasSZExtractor]];
    [v11 set_doesSZExtractorConsumeExtractedData:[v8 _doesSZExtractorConsumeExtractedData]];
    int v20 = [v8 taskMetrics];
    [v11 set_metrics:v20];

    [v8 setTaskMetrics:0];
    __int16 v21 = [v8 additionalProperties];

    if (v21) {
      [(NDBackgroundSession *)self configureAdditionalPropertiesOnTask:v11 taskInfo:v8];
    }
    -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:](self, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:", v11, v8, [v8 isDiscretionary]);
    identifiersToTasks = self->_identifiersToTasks;
    __int16 v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 identifier]);
    [(NSMutableDictionary *)identifiersToTasks setObject:v11 forKeyedSubscript:v23];

    long long v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 identifier]);
    [(NSMutableDictionary *)self->_tasksToIdentifiers setObject:v24 forKeyedSubscript:v11];

    [v11 startResourceTimer];
    if ([v8 taskKind] == (id)2
      || [v8 taskKind] == (id)1
      && ([v8 fileURL], __int16 v26 = objc_claimAutoreleasedReturnValue(), v26, !v26))
    {
      int v25 = [(NDBackgroundSession *)self clientErrorForError:v9];
      -[NSXPCProxyCreating willRetryBackgroundDataTask:withError:transactionMetrics:](self->_clientProxy, "willRetryBackgroundDataTask:withError:transactionMetrics:", [v8 identifier], v25, v10);
    }
    -[NDBackgroundSession requeueTask:skipResume:](self, "requeueTask:skipResume:", [v8 identifier], 1);
    __int16 v27 = [v9 domain];
    if ([v27 isEqualToString:@"_nsurlsessiondErrorDomain"])
    {
      id v28 = [v9 code];

      if (v28 == (id)3)
      {
        id v29 = +[NDStatusMonitor sharedMonitor];
        [v29 performCallbackAfterNetworkChangedEvent:self identifier:[v8 identifier] numberOfPreviousRetries:[v8 lowThroughputTimerRetryCount]];

        [v8 setLowThroughputTimerRetryCount:((char *)[v8 lowThroughputTimerRetryCount]) + 1];
        goto LABEL_19;
      }
    }
    else
    {
    }
    __int16 v30 = [v9 domain];
    unsigned __int8 v31 = [v30 isEqualToString:@"_nsurlsessiondErrorDomain"];

    double v32 = 1.0;
    if ((v31 & 1) == 0)
    {
      id v33 = (char *)[v8 retryCount:1.0];
      [v8 setRetryCount:v33 + 1];
      double v32 = exp2((double)(unint64_t)v33);
    }
    double v34 = fmin(v32, 1800.0);
    unint64_t v35 = (id)qword_1000CB148;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = [(NDBackgroundSession *)self uuid];
      BOOL v37 = [v8 _loggableDescription];
      int v40 = 138543874;
      int v41 = v36;
      __int16 v42 = 2114;
      uint64_t v43 = v37;
      __int16 v44 = 2048;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will retry after %lld seconds", (uint8_t *)&v40, 0x20u);
    }
    __int16 v38 = +[NDStatusMonitor sharedMonitor];
    [v38 performCallbackAfterNetworkChangedEvent:self identifier:[v8 identifier] delay:v34];
  }
LABEL_19:

  return v11 != 0;
}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000386BC;
  block[3] = &unk_1000B53A0;
  block[4] = self;
  void block[5] = a4;
  BOOL v7 = a5;
  dispatch_async(workQueue, block);
}

- (id)clientErrorForError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_13;
  }
  if (sub_10000F8FC(v3))
  {
    id v5 = [v4 userInfo];
    if (v5)
    {
      uint64_t v6 = [v4 userInfo];
      id v7 = [v6 mutableCopy];
    }
    else
    {
      id v7 = (id)objc_opt_new();
    }

    id v10 = sub_10000F94C(v4);
    if (v10) {
      [v7 setObject:v10 forKeyedSubscript:NSURLErrorBackgroundTaskCancelledReasonKey];
    }
    uint64_t v11 = +[NSURLError errorWithDomain:NSURLErrorDomain code:-999 userInfo:v7];
  }
  else
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    id v7 = [v4 domain];
    id v9 = [v4 code];
    id v10 = [v4 userInfo];
    uint64_t v11 = +[NSURLError errorWithDomain:v7 code:v9 userInfo:v10];
  }
  id v8 = (void *)v11;

LABEL_13:

  return v8;
}

- (id)restoreTasks:(BOOL *)a3
{
  id v5 = +[NSMutableArray array];
  if (self->_hasSqliteSupport)
  {
    uint64_t v6 = [(NDBackgroundSession *)self restoreTasksFromSqliteDB:v5];
  }
  else
  {
    id v7 = [(NDBackgroundSession *)self tasksArchivePath];
    id v8 = sub_10000FB54((uint64_t)NSKeyedUnarchiver, v7);
    uint64_t v6 = [(NDBackgroundSession *)self restoreTasksFromArchivedInfo:v8];
  }
  id v9 = [(NSMutableDictionary *)self->_identifiersToTaskInfo count];
  if (!v9) {
    [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:0];
  }
  if (a3) {
    *a3 = v9 == 0;
  }
  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = self->_identifiersToTaskInfo;
    id v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", *(void *)(*((void *)&v15 + 1) + 8 * i), 14, 1, (void)v15);
        }
        id v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if ([v5 count]) {
      [(NDTaskStorageDB *)self->tasksDB _deleteTaskEntriesWithIdentifiers:v5 forSession:self->_identifier sessionUUID:self->_uuid];
    }
  }
  if ([(NSMutableDictionary *)self->_identifiersToTaskInfo count]
    && ![(NDBackgroundSession *)self sessionHasOutstandingTasks]
    && self->_sendsLaunchEvents
    && ![(NDApplication *)self->_clientApplication canBeSuspended])
  {
    [(NDBackgroundSession *)self wakeUpClient:2];
  }

  return v6;
}

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038D24;
  v10[3] = &unk_1000B5418;
  v10[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  int v13 = v14;
  id v6 = v4;
  id v12 = v6;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  id v7 = v12;
  id v8 = v5;

  _Block_object_dispose(v14, 8);

  return v8;
}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  id v51 = a3;
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(NDBackgroundSession *)self uuid];
    *(_DWORD *)buf = 138543362;
    id v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> restoreTasksFromSqliteDB", buf, 0xCu);
  }
  tasksDB = self->tasksDB;
  if (tasksDB)
  {
    id v7 = [(NDTaskStorageDB *)tasksDB _getAllTasksFromDBForSession:self->_identifier sessionUUID:self->_uuid];
  }
  else
  {
    id v7 = 0;
  }
  id v52 = +[NSMutableArray array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v8)
  {
    uint64_t v50 = 0;
    uint64_t v54 = *(void *)v58;
    *(void *)&long long v9 = 138543618;
    long long v49 = v9;
    do
    {
      id v10 = 0;
      uint64_t v55 = v50 + 1;
      v50 += (uint64_t)v8;
      do
      {
        if (*(void *)v58 != v54) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v10);
        if (v11)
        {
          id v12 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)v10) downloadFileURL];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            uint64_t v14 = [v11 downloadFileURL];
            long long v15 = +[Daemon sharedDaemon];
            if ([v15 isPrivileged]) {
              goto LABEL_14;
            }
            long long v16 = [v14 path];
            long long v17 = [(NSURL *)self->_downloadDirectory path];
            unsigned __int8 v18 = [v16 hasPrefix:v17];

            if ((v18 & 1) == 0)
            {
              id v28 = (id)qword_1000CB148;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [(NDBackgroundSession *)self uuid];
                clientBundleID = self->_clientBundleID;
                unsigned __int8 v31 = [(NSURL *)self->_downloadDirectory path];
                double v32 = [v14 path];
                *(_DWORD *)buf = 138544130;
                id v62 = v29;
                __int16 v63 = 2112;
                v64 = clientBundleID;
                __int16 v65 = 2112;
                id v66 = v31;
                __int16 v67 = 2112;
                v68 = v32;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is %@. Need to fix download path", buf, 0x2Au);
              }
              downloadDirectory = self->_downloadDirectory;
              double v34 = [v14 lastPathComponent];
              unint64_t v35 = [(NSURL *)downloadDirectory URLByAppendingPathComponent:v34];
              [v11 setDownloadFileURL:v35];

              long long v15 = (id)qword_1000CB148;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v36 = [(NDBackgroundSession *)self uuid];
                BOOL v37 = [v11 downloadFileURL];
                __int16 v38 = [v37 path];
                *(_DWORD *)buf = v49;
                id v62 = v36;
                __int16 v63 = 2112;
                v64 = v38;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> New download path: %@", buf, 0x16u);
              }
LABEL_14:
            }
          }
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 identifier:v49]);
          __int16 v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          char v56 = 0;
          if ([v11 shouldCancelOnDisconnect] && (uint64_t)objc_msgSend(v11, "state") <= 2)
          {
            [v11 setState:3];
            int v20 = [v11 currentRequest];
            __int16 v21 = [v20 URL];
            int v22 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v21];
            [v11 setError:v22];

            __int16 v23 = (id)qword_1000CB148;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              __int16 v42 = [(NDBackgroundSession *)self uuid];
              uint64_t v43 = [v11 _loggableDescription];
              __int16 v44 = [v11 error];
              uint64_t v45 = [v11 error];
              __int16 v46 = (NSString *)[v45 code];
              *(_DWORD *)buf = 138544130;
              id v62 = v42;
              __int16 v63 = 2114;
              v64 = v43;
              __int16 v65 = 2112;
              id v66 = v44;
              __int16 v67 = 2048;
              v68 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)", buf, 0x2Au);
            }
          }
          long long v24 = [(NDBackgroundSession *)self restoreTask:v11 isOutstanding:&v56];
          if (v24)
          {
            if (v56)
            {
              int v25 = (id)qword_1000CB148;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v26 = [v11 _loggableDescription];
                *(_DWORD *)buf = 138543362;
                id v62 = v26;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to outstanding tasks", buf, 0xCu);
              }
              -[NDBackgroundSession addOutstandingTaskWithIdentifier:](self, "addOutstandingTaskWithIdentifier:", [v11 identifier]);
              [v52 addObject:v11];
            }
            [(NSMutableDictionary *)self->_identifiersToTaskInfo setObject:v11 forKeyedSubscript:v19];
            [(NSMutableDictionary *)self->_identifiersToTasks setObject:v24 forKeyedSubscript:v19];
            [(NSMutableDictionary *)self->_tasksToIdentifiers setObject:v19 forKeyedSubscript:v24];
          }
          else
          {
            [v51 addObject:v19];
            __int16 v27 = (id)qword_1000CB148;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              unsigned int v39 = [(NDBackgroundSession *)self uuid];
              identifier = self->_identifier;
              int v40 = self->_clientBundleID;
              *(_DWORD *)buf = 138544130;
              id v62 = v39;
              __int16 v63 = 2112;
              v64 = v19;
              __int16 v65 = 2112;
              id v66 = v40;
              __int16 v67 = 2112;
              v68 = identifier;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>", buf, 0x2Au);
            }
          }
        }
        if ((unint64_t)v10 + v55 > 0x200) {
          goto LABEL_40;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v47 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      id v8 = v47;
    }
    while (v47);
  }
LABEL_40:

  return v52;
}

- (id)restoreTask:(id)a3 isOutstanding:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 1;
  if ([v6 state] == (id)2)
  {
    [v6 setState:3];
    id v7 = [v6 currentRequest];
    id v8 = [v7 URL];
    long long v9 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-999 URL:v8];
    [v6 setError:v9];
  }
  if ([v6 state] == (id)3)
  {
    *a4 = 0;
    id v10 = [(NDBackgroundSession *)self restoreCompletedTask:v6];
  }
  else
  {
    if (![v6 hasStarted])
    {
      BOOL v13 = (id)qword_1000CB148;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = [(NDBackgroundSession *)self uuid];
        __int16 v21 = [v6 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v20;
        __int16 v28 = 2114;
        id v29 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not restoring, which had never been started", buf, 0x16u);
      }
      uint64_t v14 = [v6 bundleID];
      unsigned int v15 = [v14 isEqualToString:@"com.apple.mobileassetd"];

      if (v15)
      {
        long long v16 = [0 resourceTimeoutError];
        workQueue = self->_workQueue;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        void v22[2] = sub_10003A278;
        v22[3] = &unk_1000B53F0;
        v22[4] = self;
        id v23 = v6;
        id v24 = 0;
        id v25 = v16;
        id v18 = v16;
        dispatch_async(workQueue, v22);
      }
      goto LABEL_13;
    }
    id v10 = [(NDBackgroundSession *)self restoreInProgressTask:v6];
  }
  id v11 = v10;
  if (v10)
  {
    sub_10000F9CC(v10, [v6 basePriority], self->_monitoredApplication);
    [(NDBackgroundSession *)self configureTask:v11 withTaskInfo:v6];
    [v6 loadingPriority];
    [v11 set_loadingPriority:];
    [v11 set_bytesPerSecondLimit:[v6 bytesPerSecondLimit]];
    [v11 set_expectedProgressTarget:[v6 expectedProgressTarget]];
    id v12 = [v6 originalRequest];
    [v11 setOriginalRequest:v12];

    [v6 creationTime];
    [v11 setStartTime:];
    [v11 set_TLSMinimumSupportedProtocolVersion:[v6 _TLSMinimumSupportedProtocolVersion]];
    [v11 set_TLSMaximumSupportedProtocolVersion:[v6 _TLSMaximumSupportedProtocolVersion]];
    goto LABEL_14;
  }
LABEL_13:
  id v11 = 0;
  *a4 = 0;
LABEL_14:

  return v11;
}

- (id)restoreCompletedTask:(id)a3
{
  id v4 = a3;
  if ([v4 taskKind])
  {
    if ([v4 taskKind] == (id)1) {
      id v5 = "__NSCFLocalUploadTask";
    }
    else {
      id v5 = "__NSCFLocalDataTask";
    }
  }
  else
  {
    id v5 = "__NSCFLocalDownloadTask";
  }
  int v40 = -[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", [v4 isDiscretionary]);
  id v6 = objc_alloc(objc_getClass(v5));
  id v7 = [v40 defaultTaskGroup];
  id v8 = [v6 initWithBackgroundTaskInfo:v4 taskGroup:v7];

  id v39 = v8;
  [(NDBackgroundSession *)self configureAdditionalPropertiesOnTask:v8 taskInfo:v4];
  long long v9 = [v4 pathToDownloadTaskFile];
  if (v9
    || ([v4 additionalProperties],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:@"pathToDownloadTaskFile"],
        long long v9 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    id v11 = v9;
    BOOL v37 = v11;
  }
  else
  {
    double v34 = [v4 downloadFileURL];
    id v11 = [v34 path];

    BOOL v37 = 0;
    __int16 v38 = 0;
    if (!v11) {
      goto LABEL_18;
    }
  }
  id v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:v11];

  if (v13)
  {
    uint64_t v14 = (id)qword_1000CB148;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v35 = [(NDBackgroundSession *)self uuid];
      __int16 v36 = [v4 _loggableDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v44 = v35;
      __int16 v45 = 2114;
      __int16 v46 = v36;
      __int16 v47 = 2112;
      id v48 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "NDSession <%{public}@> %{public}@ is being restored as completed with download file still at %@", buf, 0x20u);
    }
    unsigned int v15 = [PendingCallback alloc];
    id v16 = [v4 identifier];
    v42[0] = v4;
    long long v17 = [v39 response];
    id v18 = v17;
    if (!v17)
    {
      id v18 = +[NSNull null];
    }
    v42[1] = v18;
    __int16 v19 = +[NSArray arrayWithObjects:v42 count:2];
    int v20 = [(PendingCallback *)v15 initWithCallbackType:1 taskIdentifier:v16 args:v19];

    if (!v17) {
    [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v20 wakeRequirement:0];
    }
  }
  __int16 v38 = v11;
LABEL_18:
  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  int v22 = [v4 _backgroundTrailers];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    id v24 = [v4 _backgroundTrailers];
    [v21 setObject:v24 forKeyedSubscript:@"trailers"];
  }
  id v25 = [PendingCallback alloc];
  id v26 = [v4 identifier];
  __int16 v27 = [v4 error];
  __int16 v28 = v27;
  if (!v27)
  {
    __int16 v28 = +[NSNull null];
  }
  v41[0] = v28;
  id v29 = [v4 taskMetrics];
  __int16 v30 = v29;
  if (!v29)
  {
    __int16 v30 = +[NSNull null];
  }
  v41[1] = v30;
  v41[2] = v21;
  unsigned __int8 v31 = +[NSArray arrayWithObjects:v41 count:3];
  double v32 = [(PendingCallback *)v25 initWithCallbackType:0 taskIdentifier:v26 args:v31];

  if (!v29) {
  if (!v27)
  }

  [(NDCallbackQueue *)self->_callbackQueue addPendingCallback:v32 wakeRequirement:0];

  return v39;
}

- (id)restoreInProgressTask:(id)a3
{
  id v5 = a3;
  id v6 = [(NDBackgroundSession *)self adjustDiscretionaryStatusForTaskInfo:v5];
  if ([v5 taskKind]) {
    goto LABEL_31;
  }
  id v12 = [v5 response];
  if (!v12) {
    goto LABEL_31;
  }
  unsigned int v13 = [v5 downloadFileURL];

  if (!v13) {
    goto LABEL_31;
  }
  [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
  id v14 = objc_alloc(objc_getClass("__NSCFLocalDownloadTask"));
  unsigned int v15 = [v6 defaultTaskGroup];
  id v16 = [v14 initWithBackgroundTaskInfo:v5 taskGroup:v15];

  [(NDBackgroundSession *)self configureAdditionalPropertiesOnTask:v16 taskInfo:v5];
  long long v17 = [(NDBackgroundSession *)self requestWithAdjustedWindowForTaskInfo:v5];
  [v16 updateCurrentRequest:v17];

  id v18 = [v5 pathToDownloadTaskFile];
  if (v18
    || ([v5 additionalProperties],
        __int16 v19 = objc_claimAutoreleasedReturnValue(),
        [v19 objectForKeyedSubscript:@"pathToDownloadTaskFile"],
        id v18 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18))
  {
    int v20 = 0;
    id v21 = v18;
  }
  else
  {
    id v3 = [v5 downloadFileURL];
    id v21 = [v3 path];
    id v18 = 0;
    int v20 = 1;
  }
  int v22 = [v16 createResumeInformation:v21];
  if (v20)
  {
  }
  if (v22)
  {
    BOOL v23 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v23 encodeObject:v22 forKey:@"NSKeyedArchiveRootObjectKey"];
    id v24 = [v23 encodedData];
    if (v24)
    {
      id v10 = [v6 downloadTaskWithResumeData:v24];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    BOOL v23 = (id)qword_1000CB148;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [(NDBackgroundSession *)self uuid];
      id v29 = [v5 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v31 = v28;
      __int16 v32 = 2114;
      id v33 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ could not create resume data. The server might not support resumable downloads. Will retry full download", buf, 0x16u);
    }
    id v10 = 0;
  }

  if (v10)
  {
    id v25 = (id)qword_1000CB148;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [(NDBackgroundSession *)self uuid];
      __int16 v27 = [v10 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v31 = v26;
      __int16 v32 = 2114;
      id v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ download created from resume data", buf, 0x16u);
    }
  }
  else
  {
LABEL_31:
    if (![v5 taskKind])
    {
      id v7 = [v5 additionalProperties];
      id v8 = [v7 objectForKeyedSubscript:@"pathToDownloadTaskFile"];
      long long v9 = (const char *)[v8 UTF8String];

      if (v9) {
        unlink(v9);
      }
    }
    id v10 = [(NDBackgroundSession *)self createNewTaskFromInfo:v5];
  }

  return v10;
}

- (id)createNewTaskFromInfo:(id)a3
{
  id v4 = a3;
  [(NDBackgroundSession *)self removeDownloadFileForTaskInfo:v4];
  id v5 = [(NDBackgroundSession *)self adjustDiscretionaryStatusForTaskInfo:v4];
  id v6 = [(NDBackgroundSession *)self requestWithAdjustedWindowForTaskInfo:v4];
  if (!v6)
  {
    id v14 = (id)qword_1000CB148;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [(NDBackgroundSession *)self uuid];
      id v16 = [v4 _loggableDescription];
      long long v17 = [v4 currentRequest];
      int v34 = 138543874;
      unint64_t v35 = v15;
      __int16 v36 = 2114;
      id v37 = v16;
      __int16 v38 = 2112;
      id v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ couldn't create new task becuase adjusted request is nil, taskInfo.currentRequest = %@", (uint8_t *)&v34, 0x20u);
    }
    id v8 = 0;
    goto LABEL_18;
  }
  if ([v4 taskKind])
  {
    if ([v4 taskKind] == (id)1)
    {
      id v7 = [v4 fileURL];
      id v8 = [v5 uploadTaskWithRequest:v6 fromFile:v7];

      long long v9 = [v4 resumableUploadData];

      if (v9)
      {
        Class Class = objc_getClass("__NSCFResumableUploadState");
        id v11 = [v4 resumableUploadData];
        id v12 = [v4 originalRequest];
        unsigned int v13 = [(objc_class *)Class rusWithResumeData:v11 originalRequest:v12];

        if (v13) {
          [v8 setResumableUploadState:v13];
        }
      }
    }
    else
    {
      id v8 = [v5 dataTaskWithRequest:v6];
    }
    goto LABEL_18;
  }
  id v18 = +[Daemon sharedDaemon];
  if ([v18 isPrivileged])
  {
    __int16 v19 = [v4 downloadFileURL];
    int v20 = [v19 path];
  }
  else
  {
    int v20 = 0;
  }

  [(NDBackgroundSession *)self ensureSessionDownloadDirectoryExists];
  id v21 = [v5 _downloadTaskWithRequest:v6 downloadFilePath:v20];
  id v8 = v21;
  if (v21)
  {
    int v22 = [v21 downloadFile];
    BOOL v23 = [v22 path];

    if (v23)
    {
      id v24 = [v8 downloadFile];
      id v25 = [v24 path];
      id v26 = +[NSURL fileURLWithPath:v25];
      [v4 setDownloadFileURL:v26];

LABEL_18:
      [v8 set_suspensionThreshhold:0x80000];
      id v8 = v8;
      __int16 v27 = v8;
      goto LABEL_19;
    }
  }
  id v29 = (id)qword_1000CB148;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    __int16 v30 = [(NDBackgroundSession *)self uuid];
    id v31 = [v4 _loggableDescription];
    __int16 v32 = [v8 downloadFile];
    id v33 = [v32 path];
    int v34 = 138544130;
    unint64_t v35 = v30;
    __int16 v36 = 2114;
    id v37 = v31;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    int v41 = v33;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ couldn't create new task. task: %@, path: %@", (uint8_t *)&v34, 0x2Au);
  }
  __int16 v27 = 0;
LABEL_19:

  return v27;
}

- (void)ensureSessionDownloadDirectoryExists
{
  if (self->_downloadDirectory)
  {
    id v3 = +[NSFileManager defaultManager];
    id v4 = [(NSURL *)self->_downloadDirectory path];
    unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (id)qword_1000CB148;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(NDBackgroundSession *)self uuid];
        identifier = self->_identifier;
        clientBundleID = self->_clientBundleID;
        id v10 = [(NSURL *)self->_downloadDirectory path];
        int v11 = 138544130;
        id v12 = v7;
        __int16 v13 = 2112;
        id v14 = clientBundleID;
        __int16 v15 = 2112;
        id v16 = identifier;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session <%@>.<%@> download path %@ did not exist, recreating.", (uint8_t *)&v11, 0x2Au);
      }
      +[NDFileUtilities createDirectoryAtURL:self->_downloadDirectory];
    }
  }
}

- (void)configureTask:(id)a3 withTaskInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [v14 setTaskIdentifier:[v6 identifier]];
  id v7 = [v6 taskDescription];
  [v14 setTaskDescription:v7];

  id v8 = [v6 earliestBeginDate];
  [v14 setEarliestBeginDate:v8];

  [v14 setCountOfBytesClientExpectsToSend:[v6 countOfBytesClientExpectsToSend]];
  [v14 setCountOfBytesClientExpectsToReceive:[v6 countOfBytesClientExpectsToReceive]];
  long long v9 = [v6 uniqueIdentifier];
  [v14 set_uniqueIdentifier:v9];

  id v10 = [v6 storagePartitionIdentifier];
  [v14 set_storagePartitionIdentifier:v10];

  int v11 = [v6 pathToDownloadTaskFile];
  [v14 set_pathToDownloadTaskFile:v11];

  id v12 = [v6 taskMetrics];

  if (v12)
  {
    __int16 v13 = [v6 taskMetrics];
    [v14 set_metrics:v13];

    [v6 setTaskMetrics:0];
  }
  [(NDBackgroundSession *)self configureAdditionalPropertiesOnTask:v14 taskInfo:v6];
}

- (void)configureAdditionalPropertiesOnTask:(id)a3 taskInfo:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 additionalProperties];

  if (v7)
  {
    id v8 = [v6 additionalProperties];
    long long v9 = [v8 objectForKeyedSubscript:@"effectiveConfig"];
    if (v9)
    {
      id v10 = -[NDBackgroundSession configurationWithClientConfiguration:discretionary:](self, "configurationWithClientConfiguration:discretionary:", v9, [v6 isDiscretionary]);
      id v11 = [v8 mutableCopy];
      [v11 setObject:v10 forKeyedSubscript:@"effectiveConfig"];

      id v8 = v11;
    }
    id v12 = [v6 additionalProperties];
    __int16 v13 = [v12 objectForKeyedSubscript:@"TimeoutIntervalForResource"];

    if (v13)
    {
      id v14 = [v16 currentRequest];
      BOOL v15 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v14 withOptionalTaskInfo:v6];

      [(NDBackgroundSession *)self setupDASPropertiesOnTask:v16 taskInfo:v6 discretionaryStatus:v15];
    }
    sub_100066720(v16, v8);
  }
}

- (id)sanitizeTaskProperties:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSXPCConnection currentConnection];
  id v6 = [v4 objectForKeyedSubscript:@"effectiveConfig"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 _sourceApplicationBundleIdentifier];
    if (v8)
    {
      unsigned __int8 v9 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v9 & 1) == 0)
      {
        [v7 set_sourceApplicationBundleIdentifier:];
        id v10 = (id)qword_1000CB148;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          __int16 v46 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543618;
          long long v59 = v46;
          __int16 v60 = 2112;
          CFStringRef v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0x16u);
        }
      }
    }
    id v11 = [v7 _sourceApplicationSecondaryIdentifier];
    if (v11)
    {
      unsigned __int8 v12 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v12 & 1) == 0)
      {
        [v7 set_sourceApplicationSecondaryIdentifier:0];
        __int16 v13 = (id)qword_1000CB148;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          __int16 v47 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543618;
          long long v59 = v47;
          __int16 v60 = 2112;
          CFStringRef v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement", buf, 0x16u);
        }
      }
    }
    id v14 = [v7 _sourceApplicationAuditTokenData];
    if (v14)
    {
      unsigned __int8 v15 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v15 & 1) == 0)
      {
        [v7 set_sourceApplicationAuditTokenData:0];
        id v16 = (id)qword_1000CB148;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v48 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543618;
          long long v59 = v48;
          __int16 v60 = 2112;
          CFStringRef v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement", buf, 0x16u);
        }
      }
    }
    [v7 set_attributedBundleIdentifier:0];
    if ([v7 _respectsAllowsCellularAccessForDiscretionaryTasks]
      && (sub_10000BE38(v5, @"com.apple.private.nsurlsession.allow-discretionary-cellular") & 1) == 0)
    {
      [v7 set_respectsAllowsCellularAccessForDiscretionaryTasks:0];
      __int16 v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v51 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543618;
        long long v59 = v51;
        __int16 v60 = 2112;
        CFStringRef v61 = @"com.apple.private.nsurlsession.allow-discretionary-cellular";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing the %@ entitlement", buf, 0x16u);
      }
    }
    if ([v7 _allowsPowerNapScheduling]
      && (sub_10000BE38(v5, @"com.apple.private.dark-wake-network-reachability") & 1) == 0)
    {
      [v7 set_allowsPowerNapScheduling:0];
      id v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v52 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543618;
        long long v59 = v52;
        __int16 v60 = 2112;
        CFStringRef v61 = @"com.apple.private.dark-wake-network-reachability";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement", buf, 0x16u);
      }
    }
    __int16 v19 = [v7 _connectionPoolName];
    if (v19)
    {
      unsigned __int8 v20 = sub_10000BE38(v5, @"com.apple.private.nsurlsession-allow-override-connection-pool");

      if ((v20 & 1) == 0)
      {
        [v7 set_connectionPoolName:];
        id v21 = (id)qword_1000CB148;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          long long v49 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543618;
          long long v59 = v49;
          __int16 v60 = 2112;
          CFStringRef v61 = @"com.apple.private.nsurlsession-allow-override-connection-pool";
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _connectionPoolName but is missing the %@ entitlement", buf, 0x16u);
        }
      }
    }
    int v22 = [v7 _directoryForDownloadedFiles];
    if (v22)
    {
      BOOL v23 = +[Daemon sharedDaemon];
      if ([v23 isPrivileged])
      {
      }
      else
      {
        id v24 = [v7 _directoryForDownloadedFiles];
        id v25 = [v5 processIdentifier];
        if (v5)
        {
          [v5 auditToken];
        }
        else
        {
          long long v56 = 0u;
          long long v57 = 0u;
        }
        unsigned __int8 v26 = [v24 _isSafeDirectoryForDownloads:v25 withToken:&v56];

        if ((v26 & 1) == 0)
        {
          __int16 v27 = (id)qword_1000CB148;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v54 = [(NDBackgroundSession *)self uuid];
            uint64_t v55 = [v7 _directoryForDownloadedFiles];
            *(_DWORD *)buf = 138543618;
            long long v59 = v54;
            __int16 v60 = 2112;
            CFStringRef v61 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _directoryForDownloadedFiles but does not have access to directory %@", buf, 0x16u);
          }
          [v7 set_directoryForDownloadedFiles:];
        }
      }
    }
    if (objc_msgSend(v7, "_duetPreauthorized", v56, v57)
      && (sub_10000BE38(v5, @"com.apple.private.nsurlsession.allow-duet-preauthorization") & 1) == 0)
    {
      [v7 set_duetPreauthorized:0];
      __int16 v28 = (id)qword_1000CB148;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = [(NDBackgroundSession *)self uuid];
        *(_DWORD *)buf = 138543618;
        long long v59 = v53;
        __int16 v60 = 2112;
        CFStringRef v61 = @"com.apple.private.nsurlsession.allow-duet-preauthorization";
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _duetPreauthorized but is missing the %@ entitlement", buf, 0x16u);
      }
    }
    id v29 = [v7 _maximumWatchCellularTransferSize];
    if (v29)
    {
      unsigned __int8 v30 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.set-max-watch-cell-transfer-size");

      if ((v30 & 1) == 0)
      {
        [v7 set_maximumWatchCellularTransferSize:0];
        id v31 = (id)qword_1000CB148;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = [(NDBackgroundSession *)self uuid];
          *(_DWORD *)buf = 138543362;
          long long v59 = v50;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement", buf, 0xCu);
        }
      }
    }
    if ((sub_10000BE38(v5, @"get-task-allow") & 1) != 0
      || (sub_10000BE38(v5, @"com.apple.security.get-task-allow") & 1) != 0
      || os_variant_allows_internal_security_policies())
    {
      id v32 = [v5 processIdentifier];
    }
    else
    {
      id v32 = 0;
    }
    [v7 set_pidForHAR:v32];
  }
  id v33 = [v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"];
  if (v33)
  {
    int v34 = +[NSXPCConnection currentConnection];
    unsigned __int8 v35 = sub_1000665D4(v34, v33);

    if ((v35 & 1) == 0)
    {
      __int16 v36 = (id)qword_1000CB148;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = [(NDBackgroundSession *)self uuid];
        int v44 = *__error();
        *(_DWORD *)buf = 138543874;
        long long v59 = v43;
        __int16 v60 = 2112;
        CFStringRef v61 = v33;
        __int16 v62 = 1024;
        int v63 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _pathToDownloadTaskFile but is not allowed to create %@: %{errno}d", buf, 0x1Cu);
      }
      id v37 = [v4 mutableCopy];
      [v37 setObject:0 forKeyedSubscript:@"pathToDownloadTaskFile"];

      id v4 = v37;
    }
  }
  __int16 v38 = [v4 objectForKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"];
  if (v38
    && (unsigned __int8 v39 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate"),
        v38,
        (v39 & 1) == 0))
  {
    int v41 = (id)qword_1000CB148;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      __int16 v45 = [(NDBackgroundSession *)self uuid];
      *(_DWORD *)buf = 138543618;
      long long v59 = v45;
      __int16 v60 = 2112;
      CFStringRef v61 = @"com.apple.private.nsurlsession.impersonate";
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0x16u);
    }
    id v40 = [v4 mutableCopy];
    [v40 setObject:0 forKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"];
  }
  else
  {
    id v40 = v4;
  }

  return v40;
}

- (id)adjustDiscretionaryStatusForTaskInfo:(id)a3
{
  id v4 = a3;
  [(NDBackgroundSession *)self updateTaskInfoBasedOnCurrentDiscretionaryStatus:v4];
  unsigned __int8 v5 = -[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", [v4 isDiscretionary]);

  return v5;
}

- (void)updateTaskInfoBasedOnCurrentDiscretionaryStatus:(id)a3
{
  id v4 = a3;
  if (([v4 isDiscretionary] & 1) != 0
    || [v4 mayBeDemotedToDiscretionary])
  {
    unsigned __int8 v5 = [v4 currentRequest];
    BOOL v6 = [(NDBackgroundSession *)self currentDiscretionaryStatus:v5 withOptionalTaskInfo:v4];

    id v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NDBackgroundSession *)self uuid];
      unsigned __int8 v9 = [v4 _loggableDescription];
      int v10 = 138544130;
      id v11 = v8;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      __int16 v14 = 1024;
      unsigned int v15 = [v4 isDiscretionary];
      __int16 v16 = 1024;
      BOOL v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ potentially discretionary, re-scheduling, was discretionary: %d, is now discretionary: %d", (uint8_t *)&v10, 0x22u);
    }
    [v4 setDiscretionary:v6];
    if (([v4 basePrioritySetExplicitly] & 1) == 0) {
      [v4 setBasePriority:-[NDBackgroundSession priorityForDiscretionaryStatus:](self, "priorityForDiscretionaryStatus:", v6)];
    }
  }
}

- (id)requestWithAdjustedWindowForTaskInfo:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 currentRequest];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 originalRequest];
  [v7 _timeWindowDuration];
  double v9 = v8;

  int v10 = [v4 originalRequest];
  [v10 _timeWindowDelay];
  double v12 = v11;

  unsigned int v13 = [v4 isDiscretionary];
  if (v9 == 0.0) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    unsigned int v15 = [(NSURLSession *)self->_discretionaryPrioritySession configuration];
    [v15 timeoutIntervalForResource];
    [(NDBackgroundSession *)self defaultWindowDurationForResourceTimeout:"defaultWindowDurationForResourceTimeout:"];
    double v9 = v16;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v18 = v17;
  [v4 creationTime];
  double v20 = v18 - v19;
  if (v18 - v19 < 0.0)
  {
    double v20 = 0.0;
    [v4 setCreationTime:v18];
  }
  double v21 = v12 - v20;
  double v22 = -0.0;
  if (v12 - v20 < 0.0) {
    double v22 = v12 - v20;
  }
  double v23 = v9 + v22;
  if (v9 + v22 <= 0.0)
  {
    if ([v4 isDiscretionary]) {
      double v23 = 60.0;
    }
    else {
      double v23 = 0.0;
    }
  }
  double v24 = fmax(v21, 0.0);
  id v25 = (id)qword_1000CB148;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v26 = [(NDBackgroundSession *)self uuid];
    __int16 v27 = [v4 _loggableDescription];
    int v29 = 138544386;
    unsigned __int8 v30 = v26;
    __int16 v31 = 2114;
    id v32 = v27;
    __int16 v33 = 2048;
    double v34 = v20;
    __int16 v35 = 2048;
    double v36 = v24;
    __int16 v37 = 2048;
    double v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ %f seconds past start time, new delay: %f, new window: %f", (uint8_t *)&v29, 0x34u);
  }
  [v6 _setTimeWindowDuration:v23];
  [v6 _setTimeWindowDelay:v24];

  return v6;
}

- (id)descriptionForTCPConnectionWaitingReason:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 0x13 && ((0x7F7FFu >> v3))
  {
    id v4 = *(&off_1000B5690 + v3);
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"Unknown (%llu)", a3];
  }

  return v4;
}

- (id)descriptionForRequest:(id)a3
{
  id v3 = a3;
  [v3 _timeWindowDelay];
  if (v4 == 0.0 && ([v3 _timeWindowDuration], v5 == 0.0))
  {
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ [allowsCellularAccess: %d]", v3, [v3 allowsCellularAccess]);
  }
  else
  {
    [v3 _timeWindowDelay];
    uint64_t v7 = v6;
    [v3 _timeWindowDuration];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ [delay: %f, duration: %f, allowsCellularAccess: %d]", v3, v7, v8, [v3 allowsCellularAccess]);
  }
  int v10 = (void *)v9;

  return v10;
}

- (id)descriptionForTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  double v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  uint64_t v6 = [(NSMutableDictionary *)identifiersToTaskInfo objectForKeyedSubscript:v5];

  if (v6) {
    [v6 _loggableDescription];
  }
  else {
  uint64_t v7 = +[NSString stringWithFormat:@"Task <?>.<%lu>", a3];
  }

  return v7;
}

- (void)queueUpdatesForTask:(id)a3 updateType:(unint64_t)a4 highPriority:(BOOL)a5
{
  id v8 = a3;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CCB0;
  v11[3] = &unk_1000B53C8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(workQueue, v11);
}

- (id)tasksArchivePath
{
  v2 = [(NSURL *)self->_sessionDirectory URLByAppendingPathComponent:@"tasks.plist"];
  id v3 = [v2 path];

  return v3;
}

- (void)obliterate
{
  id v3 = (id)qword_1000CB148;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(NDBackgroundSession *)self uuid];
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    double v20 = v4;
    __int16 v21 = 2112;
    double v22 = clientBundleID;
    __int16 v23 = 2112;
    double v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Obliterating session: <%@>.<%@>", buf, 0x20u);
  }
  self->_obliterated = 1;
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_outstandingTaskIDs;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), (void)v14);
        [v12 cancel];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(NDBackgroundSession *)self cleanupSessionWithCompletionHandler:0];
  unint64_t v13 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  [v13 removePendingWakeForClient:self->_clientBundleID sessionIdentifier:self->_identifier];
}

- (void)cleanupSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->_cleanedUp)
  {
    self->_cleanedUp = 1;
    double v5 = (id)qword_1000CB148;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(NDBackgroundSession *)self uuid];
      int v13 = 138543362;
      long long v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Cleaning up", (uint8_t *)&v13, 0xCu);
    }
    [(NSURLSession *)self->_userInitiatedSession finishTasksAndInvalidate];
    [(NSURLSession *)self->_discretionaryPrioritySession finishTasksAndInvalidate];
    userInitiatedSession = self->_userInitiatedSession;
    self->_userInitiatedSession = 0;

    discretionaryPrioritySession = self->_discretionaryPrioritySession;
    self->_discretionaryPrioritySession = 0;

    +[NDFileUtilities removeItemAtURL:self->_uploadsDirectory];
    tasksDB = self->tasksDB;
    if (tasksDB)
    {
      [(NDTaskStorageDB *)tasksDB _deleteAllTaskEntriesForSession:self->_identifier sessionUUID:self->_uuid];
      uint64_t v10 = self->tasksDB;
      self->tasksDB = 0;
    }
    +[NDFileUtilities removeItemAtURL:self->_sessionDirectory];
    [(NDApplication *)self->_monitoredApplication removeObserver:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionCompleted:self withCompletionHandler:v4];

    id v12 = +[Daemon sharedDaemon];
    [v12 releaseTransaction];
  }
}

- (void)clientApplicationWasReinstalled
{
  id v3 = (id)qword_1000CB148;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NDBackgroundSession *)self uuid];
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    id v32 = v4;
    __int16 v33 = 2112;
    double v34 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Application %@ was reinstalled, adjusting download paths", buf, 0x16u);
  }
  uint64_t v6 = [(NDBackgroundSession *)self setupDownloadDirectory];
  double v24 = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    if (([v6 isEqual:self->_downloadDirectory] & 1) == 0)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = self->_identifiersToTaskInfo;
      id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v27;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            id v12 = [(NSMutableDictionary *)self->_identifiersToTaskInfo objectForKeyedSubscript:v11];
            if (![v12 taskKind])
            {
              int v13 = [v12 downloadFileURL];
              long long v14 = v13;
              if (v13)
              {
                long long v15 = [v13 lastPathComponent];
                long long v16 = [v24 URLByAppendingPathComponent:v15];
              }
              else
              {
                long long v16 = 0;
              }
              [v12 setDownloadFileURL:v16];
              long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 identifier]);
              [(NDBackgroundSession *)self queueUpdatesForTask:v17 updateType:3 highPriority:0];

              double v18 = [(NSMutableDictionary *)self->_identifiersToTasks objectForKeyedSubscript:v11];
              double v19 = [v16 path];
              double v20 = [v18 downloadFile];
              [v20 setPath:v19];
            }
          }
          id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v8);
      }

      objc_storeStrong((id *)&self->_downloadDirectory, v24);
      uint64_t v7 = v24;
    }
  }
  else
  {
    __int16 v21 = (id)qword_1000CB148;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v22 = [(NDBackgroundSession *)self uuid];
      __int16 v23 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      id v32 = v22;
      __int16 v33 = 2112;
      double v34 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't find out download directory for re-installed application %@. It must not have been re-installed properly. Obliterating session", buf, 0x16u);
    }
    uint64_t v7 = 0;
    [(NDBackgroundSession *)self obliterate];
  }
}

- (void)backgroundUpdatesEnabledForApplication:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D6E8;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D878;
  block[3] = &unk_1000B5378;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (BOOL)hasConnectedClient
{
  if (self->_xpcConn) {
    BOOL v3 = self->_clientProxy != 0;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = (id)qword_1000CB148;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NDBackgroundSession *)self uuid];
    id v6 = (void *)v5;
    if (v3) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    if (self->_xpcConn) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy) {
      int v11 = 89;
    }
    else {
      int v11 = 78;
    }
    int v13 = 138544642;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    long long v16 = clientBundleID;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2112;
    double v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ connected result (%c), XPC(%c) proxy(%c) for %@", (uint8_t *)&v13, 0x32u);
  }
  return v3;
}

- (id)sessionForDiscretionaryStatus:(BOOL)a3
{
  uint64_t v3 = 8;
  if (a3) {
    uint64_t v3 = 16;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

@end