@interface DownloadPipeline
- (BOOL)_downloadIsForLegacyClientWithIdentifier:(id)a3;
- (BOOL)_hasAutomaticUpdateTasks;
- (BOOL)_isPodcast:(id)a3;
- (DownloadPipeline)initWithDownloadsDatabase:(id)a3;
- (id)_applicationBundleIdentifierForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4;
- (id)_applicationHandleForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4;
- (id)_authenticationChallengeQueue;
- (id)_downloadSessionPropertiesWithPhase:(id)a3 taskState:(id)a4 databaseSession:(id)a5;
- (id)restartDownloadsWithIdentifiers:(id)a3;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didCompleteForMediaSelection:(id)a5;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_attemptRecoveryForDownloadWithTaskState:(id)a3 databaseSession:(id)a4;
- (void)_commitProgressTimer;
- (void)_disavowDownloadHandlerSession:(id)a3 withTaskState:(id)a4;
- (void)_failDownloadWithIdentifier:(id)a3 error:(id)a4 transaction:(id)a5;
- (void)_finishDownloadWithOperation:(id)a3 response:(id)a4;
- (void)_finishRecoveryWithOperation:(id)a3 response:(id)a4;
- (void)_logDownloadEvent:(id)a3 forTaskWithState:(id)a4 session:(id)a5;
- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3 withSessionProperties:(id)a4 completionHandler:(id)a5;
- (void)_performDownloadOperation:(id)a3;
- (void)_prepareDownloadsMatchingPredicate:(id)a3 ignoreDownloadHandlers:(BOOL)a4 filtersExistingTasks:(BOOL)a5;
- (void)_processDownloadFailureWithTaskState:(id)a3 cancelReason:(int64_t)a4;
- (void)_processDownloadWithTaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5;
- (void)_queueFinishDownloadWithtaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5;
- (void)_releaseDownloadHandlerSession:(id)a3 withTaskState:(id)a4;
- (void)_reloadKeepAliveAssertion;
- (void)_reportTVAppDownloadQOSMetricsIfAppropriateForKind:(id)a3 adamID:(id)a4 rentalID:(id)a5 error:(id)a6 cancelReason:(int64_t)a7;
- (void)_scheduleReconnect;
- (void)_setDownloadPhase:(id)a3 forDownloadIdentifier:(int64_t)a4 databaseTransaction:(id)a5;
- (void)_startProgressTimer;
- (void)_taskReceived:(id)a3 persistAVAssetDownloadToken:(unint64_t)a4;
- (void)addDownloadsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)downloadAssetFairPlayStreamingKeyLoader:(id)a3 didFailWithError:(id)a4;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)prioritizeDownloadWithIdentifier:(id)a3;
- (void)reconnectWithURLSessionTasks;
- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4;
- (void)updateAfterSessionsChanged:(id)a3;
@end

@implementation DownloadPipeline

- (DownloadPipeline)initWithDownloadsDatabase:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DownloadPipeline;
  v6 = [(DownloadPipeline *)&v35 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    aggregateDownloadProgress = v7->_aggregateDownloadProgress;
    v7->_aggregateDownloadProgress = v8;

    v10 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    backgroundOperationQueue = v7->_backgroundOperationQueue;
    v7->_backgroundOperationQueue = v10;

    [(ISOperationQueue *)v7->_backgroundOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v7->_backgroundOperationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)v7->_backgroundOperationQueue setName:@"com.apple.itunesstored.DownloadPipeline.background"];
    v12 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    preparationOperationQueue = v7->_preparationOperationQueue;
    v7->_preparationOperationQueue = v12;

    [(ISOperationQueue *)v7->_preparationOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v7->_preparationOperationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)v7->_preparationOperationQueue setName:@"com.apple.itunesstored.DownloadPipeline.prepare"];
    v14 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    processingOperationQueue = v7->_processingOperationQueue;
    v7->_processingOperationQueue = v14;

    [(ISOperationQueue *)v7->_processingOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v7->_processingOperationQueue setMaxConcurrentOperationCount:3];
    [(ISOperationQueue *)v7->_processingOperationQueue setName:@"com.apple.itunesstored.DownloadPipeline.processing"];
    v16 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    discretionaryDownloadOperationQueue = v7->_discretionaryDownloadOperationQueue;
    v7->_discretionaryDownloadOperationQueue = v16;

    [(ISOperationQueue *)v7->_discretionaryDownloadOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v7->_discretionaryDownloadOperationQueue setMaxConcurrentOperationCount:3];
    [(ISOperationQueue *)v7->_discretionaryDownloadOperationQueue setName:@"com.apple.itunesstored.DownloadPipeline.discretionaryDownloads"];
    v18 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    nonDiscretionaryDownloadOperationQueue = v7->_nonDiscretionaryDownloadOperationQueue;
    v7->_nonDiscretionaryDownloadOperationQueue = v18;

    [(ISOperationQueue *)v7->_nonDiscretionaryDownloadOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v7->_nonDiscretionaryDownloadOperationQueue setMaxConcurrentOperationCount:3];
    [(ISOperationQueue *)v7->_nonDiscretionaryDownloadOperationQueue setName:@"com.apple.itunesstored.DownloadPipeline.nonDiscretionaryDownloads"];
    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    dirtyTaskStates = v7->_dirtyTaskStates;
    v7->_dirtyTaskStates = v20;

    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    downloadHandlerSessions = v7->_downloadHandlerSessions;
    v7->_downloadHandlerSessions = v22;

    v24 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    preparationDownloadIDs = v7->_preparationDownloadIDs;
    v7->_preparationDownloadIDs = v24;

    v26 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    resourceLoaders = v7->_resourceLoaders;
    v7->_resourceLoaders = v26;

    v28 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    taskStates = v7->_taskStates;
    v7->_taskStates = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlSessions = v7->_urlSessions;
    v7->_urlSessions = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    downloadOperationsByTask = v7->_downloadOperationsByTask;
    v7->_downloadOperationsByTask = v32;
  }
  return v7;
}

- (void)dealloc
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    v4 = self->_progressTimer;
    self->_progressTimer = 0;
  }
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_source_cancel((dispatch_source_t)reconnectTimer);
    v6 = self->_reconnectTimer;
    self->_reconnectTimer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DownloadPipeline;
  [(DownloadPipeline *)&v7 dealloc];
}

- (void)addDownloadsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if ((-[NSMutableOrderedSet containsObject:](self->_preparationDownloadIDs, "containsObject:", v11) & 1) == 0)[v5 addObject:v11]; {
      }
        }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v12 = self->_taskStates;
    id v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [(NSMapTable *)self->_taskStates objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
          id v18 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v17, "downloadIdentifier"));
          [v5 removeObject:v18];
        }
        id v14 = [(NSMapTable *)v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v14);
    }
  }
  if ([v5 count])
  {
    v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      v23 = [v5 array];
      v24 = [v23 componentsJoinedByString:@", "];
      int v39 = 138543362;
      v40 = v24;
      LODWORD(v29) = 12;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_31:

        uint64_t v26 = objc_opt_class();
        v27 = [v5 array];
        v30 = [v27 componentsJoinedByString:@", "];
        SSDebugLog();

        v28 = +[SSSQLiteContainsPredicate containsPredicateWithProperty:values:](SSSQLiteContainsPredicate, "containsPredicateWithProperty:values:", SSSQLEntityPropertyPersistentID, v5, v26, v30);
        [(DownloadPipeline *)self _prepareDownloadsMatchingPredicate:v28 ignoreDownloadHandlers:0 filtersExistingTasks:0];

        goto LABEL_32;
      }
      v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v39, v29);
      free(v25);
      SSFileLog();
    }

    goto LABEL_31;
  }
LABEL_32:
  [(DownloadPipeline *)self _reloadKeepAliveAssertion];
}

- (void)reconnectWithURLSessionTasks
{
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_source_cancel((dispatch_source_t)reconnectTimer);
    id v4 = self->_reconnectTimer;
    self->_reconnectTimer = 0;
  }
  id v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download_state.blocked_reason, 0)" equalToValue:&off_1003C9300];
  v13[0] = SSDownloadPhaseFinished;
  v13[1] = SSDownloadPhaseFailed;
  v13[2] = SSDownloadPhasePaused;
  v13[3] = SSDownloadPhaseCanceled;
  id v6 = +[NSArray arrayWithObjects:v13 count:4];
  id v7 = +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:@"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")" values:v6];

  id v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_purchase" equalToValue:&__kCFBooleanFalse];
  uint64_t v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download_state.is_restricted, 0)" equalToValue:&__kCFBooleanFalse];
  v12[0] = v5;
  v12[1] = v9;
  v12[2] = v8;
  v12[3] = v7;
  v10 = +[NSArray arrayWithObjects:v12 count:4];
  uint64_t v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  [(DownloadPipeline *)self _prepareDownloadsMatchingPredicate:v11 ignoreDownloadHandlers:0 filtersExistingTasks:1];
}

- (void)prioritizeDownloadWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = &syslog_ptr;
  id v56 = v4;
  if ([(DownloadPipeline *)self _downloadIsForLegacyClientWithIdentifier:v4])
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      int v66 = 138412546;
      id v67 = (id)objc_opt_class();
      __int16 v68 = 2112;
      id v69 = v4;
      id v11 = v67;
      LODWORD(v55) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v66, v55);
        free(v12);
        SSFileLog();
      }
      id v4 = v56;
    }
    else
    {
    }
    goto LABEL_82;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v14 = self->_taskStates;
  id v15 = [(NSMapTable *)v14 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (!v15)
  {

    goto LABEL_70;
  }
  id v16 = v15;
  char v57 = 0;
  uint64_t v17 = *(void *)v63;
  v61 = self;
  uint64_t v58 = *(void *)v63;
  v59 = v14;
  do
  {
    id v18 = 0;
    id v60 = v16;
    do
    {
      if (*(void *)v63 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v20 = [(NSMapTable *)self->_taskStates objectForKey:v19];
        id v21 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v20, "downloadIdentifier"));
        if ([v4 isEqualToNumber:v21])
        {
          v22 = [v5[405] sharedDaemonConfig];
          if (!v22)
          {
            v22 = [v5[405] sharedConfig];
          }
          unsigned int v23 = objc_msgSend(v22, "shouldLog", v54);
          if ([v22 shouldLogToDisk]) {
            int v24 = v23 | 2;
          }
          else {
            int v24 = v23;
          }
          v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            int v26 = v24;
          }
          else {
            int v26 = v24 & 2;
          }
          if (v26)
          {
            id v27 = [v19 taskIdentifier];
            int v66 = 134218242;
            id v67 = v27;
            __int16 v68 = 2112;
            id v69 = v21;
            LODWORD(v55) = 22;
            v54 = &v66;
            v28 = (void *)_os_log_send_and_compose_impl();

            id v5 = &syslog_ptr;
            if (v28)
            {
              v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v66, v55);
              free(v28);
              v54 = (int *)v25;
              SSFileLog();
              goto LABEL_55;
            }
          }
          else
          {
            id v5 = &syslog_ptr;
LABEL_55:
          }
          *(float *)&double v47 = NSURLSessionTaskPriorityHigh;
          [v19 setPriority:v47];
          char v57 = 1;
LABEL_63:

          id v16 = v60;
          self = v61;
          uint64_t v17 = v58;
          id v14 = v59;
          goto LABEL_64;
        }
        unsigned int v29 = [v20 isLegacyClient];
        uint64_t v30 = [v5[405] sharedDaemonConfig];
        long long v31 = (void *)v30;
        if (v29)
        {
          if (!v30)
          {
            long long v31 = [v5[405] sharedConfig];
          }
          unsigned int v32 = objc_msgSend(v31, "shouldLog", v54);
          if ([v31 shouldLogToDisk]) {
            int v33 = v32 | 2;
          }
          else {
            int v33 = v32;
          }
          long long v34 = [v31 OSLogObject];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
            int v35 = v33;
          }
          else {
            int v35 = v33 & 2;
          }
          if (v35)
          {
            long long v36 = objc_opt_class();
            id v37 = v36;
            id v38 = [v19 taskIdentifier];
            int v66 = 138412802;
            id v67 = v36;
            __int16 v68 = 2048;
            id v69 = v38;
            __int16 v70 = 2112;
            id v71 = v21;
            LODWORD(v55) = 32;
            v54 = &v66;
            int v39 = (void *)_os_log_send_and_compose_impl();

            id v4 = v56;
            id v5 = &syslog_ptr;
            if (v39)
            {
              long long v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v66, v55);
              free(v39);
              v54 = (int *)v34;
              SSFileLog();
              goto LABEL_58;
            }
          }
          else
          {
            id v5 = &syslog_ptr;
LABEL_58:
          }
          goto LABEL_63;
        }
        if (!v30)
        {
          long long v31 = [v5[405] sharedConfig];
        }
        unsigned int v40 = objc_msgSend(v31, "shouldLog", v54);
        if ([v31 shouldLogToDisk]) {
          v40 |= 2u;
        }
        v41 = [v31 OSLogObject];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
          int v42 = v40;
        }
        else {
          int v42 = v40 & 2;
        }
        if (v42)
        {
          v43 = objc_opt_class();
          id v44 = v43;
          id v45 = [v19 taskIdentifier];
          int v66 = 138412802;
          id v67 = v43;
          __int16 v68 = 2048;
          id v69 = v45;
          __int16 v70 = 2112;
          id v71 = v21;
          LODWORD(v55) = 32;
          v54 = &v66;
          v46 = (void *)_os_log_send_and_compose_impl();

          id v4 = v56;
          id v5 = &syslog_ptr;
          if (v46)
          {
            v41 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v66, v55);
            free(v46);
            v54 = (int *)v41;
            SSFileLog();
            goto LABEL_61;
          }
        }
        else
        {
          id v5 = &syslog_ptr;
LABEL_61:
        }
        *(float *)&double v48 = NSURLSessionTaskPriorityDefault;
        [v19 setPriority:v48];
        goto LABEL_63;
      }
LABEL_64:
      id v18 = (char *)v18 + 1;
    }
    while (v16 != v18);
    id v16 = [(NSMapTable *)v14 countByEnumeratingWithState:&v62 objects:v72 count:16];
  }
  while (v16);

  if (v57) {
    goto LABEL_83;
  }
LABEL_70:
  v49 = objc_msgSend(v5[405], "sharedDaemonConfig", v54);
  if (!v49)
  {
    v49 = [v5[405] sharedConfig];
  }
  unsigned int v50 = [v49 shouldLog];
  if ([v49 shouldLogToDisk]) {
    v50 |= 2u;
  }
  v51 = [v49 OSLogObject];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
    int v52 = v50;
  }
  else {
    int v52 = v50 & 2;
  }
  if (v52)
  {
    int v66 = 138412290;
    id v67 = v4;
    LODWORD(v55) = 12;
    v53 = (void *)_os_log_send_and_compose_impl();

    if (v53)
    {
      v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v66, v55);
      free(v53);
      SSFileLog();
      goto LABEL_80;
    }
  }
  else
  {
LABEL_80:
  }
  id v6 = +[NSMutableOrderedSet orderedSet];
  [v6 addObject:v4];
  [(DownloadPipeline *)self addDownloadsWithIdentifiers:v6];
LABEL_82:

LABEL_83:
}

- (id)restartDownloadsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v28 = +[NSMutableOrderedSet orderedSet];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = self;
  id v6 = self->_taskStates;
  id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    int v10 = &syslog_ptr;
    uint64_t v26 = *(void *)v32;
    id v27 = v5;
    do
    {
      id v11 = 0;
      id v29 = v8;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = [(NSMapTable *)v5->_taskStates objectForKey:v12];
          id v13 = objc_msgSend(objc_alloc((Class)v10[333]), "initWithLongLong:", objc_msgSend(v30, "downloadIdentifier"));
          if ([v4 containsObject:v13])
          {
            id v14 = +[SSLogConfig sharedDaemonConfig];
            if (!v14)
            {
              id v14 = +[SSLogConfig sharedConfig];
            }
            unsigned int v15 = objc_msgSend(v14, "shouldLog", v24);
            if ([v14 shouldLogToDisk]) {
              v15 |= 2u;
            }
            id v16 = [v14 OSLogObject];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              v15 &= 2u;
            }
            if (v15)
            {
              uint64_t v17 = v6;
              id v18 = v4;
              v19 = objc_opt_class();
              id v20 = v19;
              id v21 = [v12 taskIdentifier];
              int v35 = 138412802;
              long long v36 = v19;
              id v4 = v18;
              id v6 = v17;
              uint64_t v9 = v26;
              __int16 v37 = 2048;
              id v38 = v21;
              __int16 v39 = 2112;
              id v40 = v13;
              LODWORD(v25) = 32;
              int v24 = &v35;
              v22 = (void *)_os_log_send_and_compose_impl();

              id v5 = v27;
              if (v22)
              {
                id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v35, v25);
                free(v22);
                int v24 = (int *)v16;
                SSFileLog();
                goto LABEL_17;
              }
            }
            else
            {
LABEL_17:
            }
            [v12 cancelWithITunesStoreReason:3 error:0];
            [v28 addObject:v13];
            int v10 = &syslog_ptr;
          }

          id v8 = v29;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v8);
  }

  return v28;
}

- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4
{
  id v73 = a3;
  v74 = self;
  [(ISOperationQueue *)self->_preparationOperationQueue operations];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v84;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v84 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v9, "downloadIdentifier"));
        if ([v73 containsObject:v10])
        {
          id v11 = +[SSLogConfig sharedDaemonConfig];
          if (!v11)
          {
            id v11 = +[SSLogConfig sharedConfig];
          }
          unsigned int v12 = objc_msgSend(v11, "shouldLog", v64);
          if ([v11 shouldLogToDisk]) {
            int v13 = v12 | 2;
          }
          else {
            int v13 = v12;
          }
          id v14 = [v11 OSLogObject];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
            int v15 = v13;
          }
          else {
            int v15 = v13 & 2;
          }
          if (v15)
          {
            id v16 = objc_opt_class();
            int v88 = 138412546;
            v89 = v16;
            __int16 v90 = 2112;
            id v91 = v10;
            id v17 = v16;
            LODWORD(v66) = 22;
            long long v64 = &v88;
            id v18 = (void *)_os_log_send_and_compose_impl();

            if (v18)
            {
              id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v88, v66);
              free(v18);
              long long v64 = (int *)v14;
              SSFileLog();
              goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
          }
          [v9 cancel];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v83 objects:v95 count:16];
    }
    while (v6);
  }
  v19 = v73;
  -[NSMutableOrderedSet minusOrderedSet:](v74->_preparationDownloadIDs, "minusOrderedSet:", v73, v64);
  id v20 = [(NSMutableSet *)v74->_downloadHandlerSessions copy];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v71 = v20;
  id v21 = [v71 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (!v21) {
    goto LABEL_44;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v80;
  do
  {
    for (j = 0; j != v22; j = (char *)j + 1)
    {
      if (*(void *)v80 != v23) {
        objc_enumerationMutation(v71);
      }
      uint64_t v25 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
      id v26 = objc_alloc((Class)NSNumber);
      id v27 = [v25 sessionProperties];
      id v28 = objc_msgSend(v26, "initWithLongLong:", objc_msgSend(v27, "downloadIdentifier"));

      if ([v19 containsObject:v28])
      {
        id v29 = +[SSLogConfig sharedDaemonConfig];
        if (!v29)
        {
          id v29 = +[SSLogConfig sharedConfig];
        }
        unsigned int v30 = objc_msgSend(v29, "shouldLog", v65);
        if ([v29 shouldLogToDisk]) {
          v30 |= 2u;
        }
        long long v31 = [v29 OSLogObject];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          v30 &= 2u;
        }
        if (v30)
        {
          long long v32 = objc_opt_class();
          id v33 = v32;
          id v34 = [v25 sessionID];
          int v88 = 138412802;
          v89 = v32;
          v19 = v73;
          __int16 v90 = 2048;
          id v91 = v34;
          __int16 v92 = 2112;
          id v93 = v28;
          LODWORD(v66) = 32;
          long long v65 = &v88;
          int v35 = (void *)_os_log_send_and_compose_impl();

          if (v35)
          {
            long long v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v88, v66);
            free(v35);
            long long v65 = (int *)v31;
            SSFileLog();
            goto LABEL_37;
          }
        }
        else
        {
LABEL_37:
        }
        long long v36 = +[DownloadHandlerManager handlerManager];
        id v37 = [v25 sessionID];
        if (a4 == 1) {
          [v36 pauseSessionWithID:v37];
        }
        else {
          [v36 cancelSessionWithID:v37];
        }

        [(NSMutableSet *)v74->_downloadHandlerSessions removeObject:v25];
        [(NSMapTable *)v74->_taskStates removeObjectForKey:v25];
      }
    }
    id v22 = [v71 countByEnumeratingWithState:&v79 objects:v94 count:16];
  }
  while (v22);
LABEL_44:

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v69 = v74->_taskStates;
  id v38 = [(NSMapTable *)v69 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v76;
    uint64_t v67 = *(void *)v76;
    do
    {
      v41 = 0;
      id v68 = v39;
      do
      {
        if (*(void *)v76 != v40) {
          objc_enumerationMutation(v69);
        }
        int v42 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v41);
        v43 = -[NSMapTable objectForKey:](v74->_taskStates, "objectForKey:", v42, v65);
        id v44 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v43, "downloadIdentifier"));
        if ([v19 containsObject:v44])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v45 = v42;
            v46 = +[SSLogConfig sharedDaemonConfig];
            if (!v46)
            {
              v46 = +[SSLogConfig sharedConfig];
            }
            unsigned int v47 = [v46 shouldLog];
            if ([v46 shouldLogToDisk]) {
              int v48 = v47 | 2;
            }
            else {
              int v48 = v47;
            }
            v49 = [v46 OSLogObject];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
              int v50 = v48;
            }
            else {
              int v50 = v48 & 2;
            }
            if (v50)
            {
              v51 = objc_opt_class();
              id v52 = v51;
              id v53 = [v45 taskIdentifier];
              int v88 = 138412802;
              v89 = v51;
              v19 = v73;
              __int16 v90 = 2048;
              id v91 = v53;
              __int16 v92 = 2112;
              id v93 = v44;
              LODWORD(v66) = 32;
              long long v65 = &v88;
              v54 = (void *)_os_log_send_and_compose_impl();

              uint64_t v40 = v67;
              if (v54)
              {
                v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v54, 4, &v88, v66);
                free(v54);
                long long v65 = (int *)v49;
                SSFileLog();
                goto LABEL_75;
              }
            }
            else
            {
              uint64_t v40 = v67;
LABEL_75:
            }
            [v45 cancelWithITunesStoreReason:2 error:0];
            goto LABEL_80;
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (a4 != 1 && (isKindOfClass & 1) != 0)
          {
            id v56 = v42;
            char v57 = +[SSLogConfig sharedDaemonConfig];
            if (!v57)
            {
              char v57 = +[SSLogConfig sharedConfig];
            }
            unsigned int v58 = [v57 shouldLog];
            if ([v57 shouldLogToDisk]) {
              v58 |= 2u;
            }
            v59 = [v57 OSLogObject];
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
              int v60 = v58;
            }
            else {
              int v60 = v58 & 2;
            }
            if (v60)
            {
              v61 = objc_opt_class();
              int v88 = 138412802;
              v89 = v61;
              __int16 v90 = 2112;
              id v91 = v56;
              __int16 v92 = 2112;
              id v93 = v44;
              id v62 = v61;
              LODWORD(v66) = 32;
              long long v65 = &v88;
              long long v63 = (void *)_os_log_send_and_compose_impl();

              uint64_t v40 = v67;
              if (v63)
              {
                v59 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, &v88, v66);
                free(v63);
                long long v65 = (int *)v59;
                SSFileLog();
                goto LABEL_78;
              }
            }
            else
            {
              uint64_t v40 = v67;
LABEL_78:
            }
            [v56 stopWithFinishResult:2];
LABEL_80:

            id v39 = v68;
          }
        }

        v41 = (char *)v41 + 1;
      }
      while (v39 != v41);
      id v39 = [(NSMapTable *)v69 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v39);
  }

  [(DownloadPipeline *)v74 _reloadKeepAliveAssertion];
}

- (void)updateAfterSessionsChanged:(id)a3
{
  id v4 = a3;
  id v24 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    id v22 = v31;
    uint64_t v23 = v26;
    uint64_t v21 = SSDownloadPhaseDownloading;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v11 = -[NSMutableSet member:](self->_downloadHandlerSessions, "member:", v10, v21, v22, v23);
        unsigned int v12 = [(NSMapTable *)self->_taskStates objectForKey:v11];
        if (v12)
        {
          int v13 = [v10 sessionProperties];
          id v14 = [v13 downloadPhase];

          switch((unint64_t)[v10 sessionState])
          {
            case 0uLL:
              if ([v14 isEqualToString:v21])
              {
                [v10 percentComplete];
                [v12 setTransferProgress:v15];
                [(NSMutableSet *)self->_dirtyTaskStates addObject:v12];
                [(DownloadPipeline *)self _startProgressTimer];
              }
              goto LABEL_17;
            case 6uLL:
              [(DownloadPipeline *)self _disavowDownloadHandlerSession:v10 withTaskState:v12];
              break;
            case 7uLL:
              id v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 downloadIdentifier]);
              [v24 addObject:v16];

              break;
            case 8uLL:
              database = self->_database;
              v30[0] = _NSConcreteStackBlock;
              v30[1] = 3221225472;
              v31[0] = sub_10010E8A8;
              v31[1] = &unk_1003A4D58;
              id v32 = v12;
              id v33 = v10;
              id v34 = self;
              id v18 = [(DownloadsDatabase *)database modifyUsingTransactionBlock:v30];
              v19 = v32;
              goto LABEL_15;
            case 9uLL:
              id v20 = self->_database;
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 3221225472;
              v26[0] = sub_10010EB14;
              v26[1] = &unk_1003A55D0;
              id v27 = v14;
              id v28 = self;
              id v29 = v12;
              [(DownloadsDatabase *)v20 readUsingTransactionBlock:v25];

              v19 = v27;
LABEL_15:

              break;
            case 0xAuLL:
              [(DownloadPipeline *)self _releaseDownloadHandlerSession:v10 withTaskState:v12];
              break;
            default:
              break;
          }
          [(NSMutableSet *)self->_downloadHandlerSessions removeObject:v11];
          [(NSMapTable *)self->_taskStates removeObjectForKey:v11];
LABEL_17:
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }

  if ([v24 count]) {
    [(DownloadPipeline *)self addDownloadsWithIdentifiers:v24];
  }
  [(DownloadPipeline *)self _reloadKeepAliveAssertion];
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010EE6C;
  v11[3] = &unk_1003A4298;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DownloadsDatabase *)database dispatchBlockAsync:v11];
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5
{
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10 = a4;
  id v11 = v10;
  if (a7 >= 1)
  {
    database = self->_database;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10010EFD0;
    v13[3] = &unk_1003A4448;
    void v13[4] = self;
    id v14 = v10;
    int64_t v15 = a6;
    int64_t v16 = a7;
    [(DownloadsDatabase *)database dispatchBlockAsync:v13];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 ITunesStoreDataConsumer];
  id v35 = 0;
  unsigned __int8 v10 = [v9 consumeData:v8 error:&v35];

  id v11 = v35;
  if ((v10 & 1) == 0)
  {
    v19 = [(NSMapTable *)self->_taskStates objectForKey:v7];
    id v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20)
    {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    uint64_t v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (v22)
    {
      id v24 = [v7 taskIdentifier];
      id v25 = [v19 downloadIdentifier];
      int v36 = 134218498;
      id v37 = v24;
      __int16 v38 = 2048;
      id v39 = v25;
      __int16 v40 = 2112;
      id v41 = v11;
      LODWORD(v27) = 32;
      id v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_14:

        [v7 cancelWithITunesStoreReason:1 error:v11];
        goto LABEL_15;
      }
      uint64_t v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v36, v27);
      free(v26);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v12 = [v7 countOfBytesReceived];
  unsigned __int8 v13 = [v9 overrideProgress];
  [v9 percentComplete];
  uint64_t v15 = v14;
  id v16 = [v9 resumptionOffset];
  id v17 = [v7 countOfBytesExpectedToReceive];
  database = self->_database;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10010F328;
  v28[3] = &unk_1003A6CB0;
  v28[4] = self;
  id v29 = v7;
  id v30 = v17;
  id v31 = v12;
  id v32 = v16;
  unsigned __int8 v34 = v13;
  uint64_t v33 = v15;
  [(DownloadsDatabase *)database dispatchBlockAsync:v28];

LABEL_15:
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v32 = 0;
  uint64_t v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = sub_10010F710;
  v31[3] = &unk_1003A6CD8;
  v31[4] = &v32;
  [v13 enumerateObjectsUsingBlock:v31];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a7->var1;
  uint64_t v14 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *))ISWeakLinkedSymbolForString();
  if (v14)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = var1;
    v14(&v36);
  }
  else
  {
    double v15 = 0.0;
  }
  double v16 = v33[3] / v15;
  database = self->_database;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10010F7AC;
  v27[3] = &unk_1003A47B0;
  v27[4] = self;
  id v18 = v12;
  id v28 = v18;
  double v29 = v16;
  [(DownloadsDatabase *)database dispatchBlockAsync:v27];
  v19 = +[SSLogConfig sharedDaemonConfig];
  if (!v19)
  {
    v19 = +[SSLogConfig sharedConfig];
  }
  unsigned int v20 = [v19 shouldLog];
  unsigned int v21 = [v19 shouldLogToDisk];
  int v22 = [v19 OSLogObject];
  uint64_t v23 = v22;
  if (v21) {
    v20 |= 2u;
  }
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_13;
  }
  id v24 = [v18 taskIdentifier];
  LODWORD(v36.var0) = 134218240;
  *(double *)((char *)&v36.var0 + 4) = v16;
  LOWORD(v36.var2) = 2048;
  *(void *)((char *)&v36.var2 + 2) = v24;
  LODWORD(v26) = 22;
  id v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    uint64_t v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v36, v26);
    free(v25);
    SSFileLog();
LABEL_13:
  }
  _Block_object_dispose(&v32, 8);
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  id v6 = a4;
  id v7 = [v6 URLAsset];
  id v8 = objc_alloc_init(DownloadAssetProgress);
  id v9 = [v7 downloadToken];
  [(NSMapTable *)self->_aggregateDownloadProgress setObject:v8 forKey:v6];
  [(DownloadPipeline *)self _taskReceived:v6 persistAVAssetDownloadToken:v9];
  unsigned __int8 v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    unsigned __int8 v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  id v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_11;
  }
  int v16 = 134217984;
  id v17 = [v6 taskIdentifier];
  LODWORD(v15) = 12;
  uint64_t v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v16, v15);
    free(v14);
    SSFileLog();
LABEL_11:
  }
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didCompleteForMediaSelection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMapTable *)self->_aggregateDownloadProgress objectForKey:v7];
  unsigned __int8 v10 = v9;
  if (v9)
  {
    [v9 setProgress:v8 forMediaSelection:1.0];
    [v10 setMediaSelectionDidComplete:v8];
  }
  unsigned int v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    unsigned int v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  uint64_t v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_13;
  }
  id v15 = [v10 numMediaSelectionsCompleted];
  [v10 progress];
  int v19 = 138413058;
  id v20 = v7;
  __int16 v21 = 2112;
  id v22 = v8;
  __int16 v23 = 2048;
  id v24 = v15;
  __int16 v25 = 2048;
  double v26 = v16 * 100.0;
  LODWORD(v18) = 42;
  id v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v19, v18);
    free(v17);
    SSFileLog();
LABEL_13:
  }
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  id v40 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100110068;
  v49[3] = &unk_1003A6CD8;
  v49[4] = &v50;
  [v14 enumerateObjectsUsingBlock:v49];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a7->var1;
  double v16 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *))ISWeakLinkedSymbolForString();
  if (v16)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v54 = var1;
    v16(&v54);
  }
  else
  {
    double v17 = 0.0;
  }
  double v18 = v51[3] / v17;
  if (v18 <= 1.0) {
    double v19 = v18;
  }
  else {
    double v19 = 1.0;
  }
  id v20 = [(NSMapTable *)self->_aggregateDownloadProgress objectForKey:v13];
  if (!v20)
  {
    id v20 = objc_alloc_init(DownloadAssetProgress);
    [(NSMapTable *)self->_aggregateDownloadProgress setObject:v20 forKey:v13];
  }
  if (![(DownloadAssetProgress *)v20 numAudioSelectionsToBeDownloaded])
  {
    __int16 v21 = [(NSMutableDictionary *)self->_downloadOperationsByTask objectForKey:v13];
    id v22 = v21;
    if (v21)
    {
      __int16 v23 = [v21 response];
      id v24 = [v23 numAudioSelectionsToBeDownloaded];

      __int16 v25 = [v22 response];
      id v26 = [v25 numSubtitleSelectionsToBeDownloaded];

      if ((unint64_t)v24 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = (uint64_t)v24;
      }
      [(DownloadAssetProgress *)v20 setNumAudioSelectionsToBeDownloaded:v27];
      [(DownloadAssetProgress *)v20 setNumSubtitleSelectionsToBeDownloaded:v26];
    }
  }
  [(DownloadAssetProgress *)v20 setProgress:v15 forMediaSelection:v19];
  [(DownloadAssetProgress *)v20 progress];
  uint64_t v29 = v28;
  database = self->_database;
  id v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  v43 = sub_100110104;
  id v44 = &unk_1003A47B0;
  id v45 = self;
  id v31 = v13;
  id v46 = v31;
  uint64_t v47 = v29;
  [(DownloadsDatabase *)database dispatchBlockAsync:&v41];
  uint64_t v32 = +[SSLogConfig sharedDaemonConfig];
  if (!v32)
  {
    uint64_t v32 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = [v32 shouldLog];
  unsigned int v34 = [v32 shouldLogToDisk];
  uint64_t v35 = [v32 OSLogObject];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = v35;
  if (v34) {
    v33 |= 2u;
  }
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    v33 &= 2u;
  }
  if (!v33) {
    goto LABEL_25;
  }
  [(DownloadAssetProgress *)v20 progress];
  LODWORD(v54.var0) = 138413058;
  *(int64_t *)((char *)&v54.var0 + 4) = (int64_t)v31;
  LOWORD(v54.var2) = 2112;
  *(void *)((char *)&v54.var2 + 2) = v15;
  HIWORD(v54.var3) = 2048;
  double v55 = v19 * 100.0;
  __int16 v56 = 2048;
  double v57 = v37 * 100.0;
  LODWORD(v39) = 42;
  __int16 v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v54, v39, v40, v41, v42, v43, v44, v45);
    free(v38);
    SSFileLog();
LABEL_25:
  }
  _Block_object_dispose(&v50, 8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = (uint64_t)objc_msgSend(v9, "itunes_statusCode");
  uint64_t v12 = v11;
  if (v11 <= 399)
  {
    id v13 = [v8 ITunesStoreDataConsumer];
    id v14 = [v13 resumptionOffset];
    if (v12 == 206 || !v14) {
      goto LABEL_16;
    }
    id v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    double v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      double v19 = objc_opt_class();
      id v20 = v19;
      int v54 = 138412546;
      double v55 = v19;
      __int16 v56 = 2048;
      id v57 = [v8 taskIdentifier];
      LODWORD(v53) = 22;
      __int16 v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_15:

        [v13 truncate];
LABEL_16:
        v10[2](v10, 1);

        goto LABEL_60;
      }
      double v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v54, v53);
      free(v21);
      SSFileLog();
    }

    goto LABEL_15;
  }
  if (v11 == 416)
  {
    uint64_t v29 = +[SSLogConfig sharedDaemonConfig];
    if (!v29)
    {
      uint64_t v29 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = [v29 shouldLog];
    if ([v29 shouldLogToDisk]) {
      int v31 = v30 | 2;
    }
    else {
      int v31 = v30;
    }
    uint64_t v32 = [v29 OSLogObject];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      v31 &= 2u;
    }
    if (v31)
    {
      unsigned int v33 = objc_opt_class();
      id v34 = v33;
      int v54 = 138412546;
      double v55 = v33;
      __int16 v56 = 2048;
      id v57 = [v8 taskIdentifier];
      LODWORD(v53) = 22;
      uint64_t v52 = &v54;
      uint64_t v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_42:

        $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = [v8 ITunesStoreDataConsumer];
        [v36 truncate];

        goto LABEL_43;
      }
      uint64_t v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v54, v53);
      free(v35);
      uint64_t v52 = (int *)v32;
      SSFileLog();
    }

    goto LABEL_42;
  }
  if (v11 == 408)
  {
    id v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    __int16 v25 = [v22 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      v24 &= 2u;
    }
    if (v24)
    {
      id v26 = objc_opt_class();
      id v27 = v26;
      int v54 = 138412546;
      double v55 = v26;
      __int16 v56 = 2048;
      id v57 = [v8 taskIdentifier];
      LODWORD(v53) = 22;
      uint64_t v52 = &v54;
      uint64_t v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_30:

LABEL_43:
        objc_msgSend(v8, "cancelWithITunesStoreReason:error:", 3, 0, v52);
        v10[2](v10, 0);
        goto LABEL_60;
      }
      __int16 v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v54, v53);
      free(v28);
      uint64_t v52 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_30;
  }
  double v37 = +[SSLogConfig sharedDaemonConfig];
  if (!v37)
  {
    double v37 = +[SSLogConfig sharedConfig];
  }
  unsigned int v38 = [v37 shouldLog];
  if ([v37 shouldLogToDisk]) {
    int v39 = v38 | 2;
  }
  else {
    int v39 = v38;
  }
  id v40 = [v37 OSLogObject];
  if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    v39 &= 2u;
  }
  if (!v39) {
    goto LABEL_54;
  }
  id v41 = objc_opt_class();
  id v42 = v41;
  int v54 = 138412802;
  double v55 = v41;
  __int16 v56 = 2048;
  id v57 = [v8 taskIdentifier];
  __int16 v58 = 2048;
  uint64_t v59 = v12;
  LODWORD(v53) = 32;
  uint64_t v52 = &v54;
  v43 = (void *)_os_log_send_and_compose_impl();

  if (v43)
  {
    id v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v54, v53);
    free(v43);
    uint64_t v52 = (int *)v40;
    SSFileLog();
LABEL_54:
  }
  id v44 = SSError();
  id v45 = +[NSNumber numberWithInteger:v12];
  id v46 = SSErrorBySettingUserInfoValue();

  uint64_t v47 = objc_msgSend(v9, "itunes_allHeaderFields");
  int v48 = ISDictionaryValueForCaseInsensitiveString();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v49 = SSErrorBySettingUserInfoValue();

    id v46 = (void *)v49;
  }
  uint64_t v50 = ISDictionaryValueForCaseInsensitiveString();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v51 = SSErrorBySettingUserInfoValue();

    id v46 = (void *)v51;
  }
  objc_msgSend(v8, "cancelWithITunesStoreReason:error:", 1, v46, v52);
  v10[2](v10, 0);

LABEL_60:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (v13)
  {
    int v29 = 138412290;
    id v30 = v7;
    LODWORD(v23) = 12;
    id v22 = &v29;
    id v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v29, v23);
    free(v14);
    id v22 = (int *)v12;
    SSFileLog();
  }

LABEL_13:
  id v15 = [(NSMutableDictionary *)self->_downloadOperationsByTask objectForKey:v7];
  if (v15)
  {
    [(NSMutableDictionary *)self->_downloadOperationsByTask removeObjectForKey:v7];
    [v15 signalDownloadCompletion];
  }
  unsigned int v16 = objc_msgSend(v7, "ITunesStoreDataConsumer", v22);
  int v17 = v16;
  if (v8)
  {
    [v16 suspend];
    unsigned __int8 v18 = 0;
  }
  else if (v16)
  {
    id v28 = 0;
    unsigned __int8 v18 = [v16 finish:&v28];
    id v8 = v28;
  }
  else
  {
    id v8 = 0;
    unsigned __int8 v18 = 1;
  }
  [v7 setITunesStoreDataConsumer:0];
  database = self->_database;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100110BAC;
  v24[3] = &unk_1003A6D00;
  v24[4] = self;
  id v25 = v7;
  id v26 = v8;
  unsigned __int8 v27 = v18;
  id v20 = v8;
  id v21 = v7;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v24];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  database = self->_database;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100111D5C;
  v16[3] = &unk_1003A6D50;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v16];
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001120A0;
  v12[3] = &unk_1003A4D58;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v12];
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v41 = (void (**)(id, id))a6;
  id v11 = v10;
  uint64_t v12 = [v9 ITunesStoreDataConsumer];
  id v13 = [v12 resumptionOffset];
  if ([v12 hasConsumedData])
  {
    [v12 reset];
    id v13 = [v12 resumptionOffset];
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      int v44 = 134218240;
      id v45 = [v9 taskIdentifier];
      __int16 v46 = 2048;
      id v47 = v13;
      LODWORD(v40) = 22;
      int v39 = &v44;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v44, v40);
      free(v19);
      int v39 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  database = self->_database;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1001129BC;
  v42[3] = &unk_1003A55F8;
  v42[4] = self;
  id v21 = v9;
  id v43 = v21;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v42];
  if (v13)
  {
    id v22 = [v11 mutableCopy];
    uint64_t v23 = +[NSString stringWithFormat:@"bytes=%llu-", v13];
    [v22 setValue:v23 forHTTPHeaderField:@"Range"];

    int v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      int v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    unsigned __int8 v27 = [v24 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      int v28 = v26;
    }
    else {
      int v28 = v26 & 2;
    }
    if (!v28) {
      goto LABEL_38;
    }
    int v29 = objc_opt_class();
    id v30 = v29;
    id v31 = [v21 taskIdentifier];
    int v44 = 138412802;
    id v45 = v29;
    __int16 v46 = 2048;
    id v47 = v13;
    __int16 v48 = 2048;
    id v49 = v31;
    LODWORD(v40) = 32;
    uint64_t v32 = (void *)_os_log_send_and_compose_impl();

LABEL_36:
    if (!v32)
    {
LABEL_39:

      goto LABEL_40;
    }
    unsigned __int8 v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v44, v40);
    free(v32);
    SSFileLog();
LABEL_38:

    goto LABEL_39;
  }
  unsigned int v33 = [v11 valueForHTTPHeaderField:@"Range"];

  id v22 = v11;
  if (v33)
  {
    id v22 = [v11 mutableCopy];
    [v22 setValue:0 forHTTPHeaderField:@"Range"];

    int v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      int v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v34 = objc_msgSend(v24, "shouldLog", v39);
    if ([v24 shouldLogToDisk]) {
      v34 |= 2u;
    }
    unsigned __int8 v27 = [v24 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      int v35 = v34;
    }
    else {
      int v35 = v34 & 2;
    }
    if (!v35) {
      goto LABEL_38;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = objc_opt_class();
    id v37 = v36;
    id v38 = [v21 taskIdentifier];
    int v44 = 138412546;
    id v45 = v36;
    __int16 v46 = 2048;
    id v47 = v38;
    LODWORD(v40) = 22;
    uint64_t v32 = (void *)_os_log_send_and_compose_impl();

    goto LABEL_36;
  }
LABEL_40:
  v41[2](v41, v22);
}

- (void)downloadAssetFairPlayStreamingKeyLoader:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100112B3C;
  v11[3] = &unk_1003A4298;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DownloadsDatabase *)database dispatchBlockAsync:v11];
}

- (id)_applicationBundleIdentifierForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4
{
  id v5 = a4;
  id v6 = [DownloadEntity alloc];
  id v7 = [v5 database];
  id v8 = [(DownloadEntity *)v6 initWithPersistentID:a3 inDatabase:v7];

  v13[0] = @"bundle_id";
  v13[1] = @"kind";
  v12[0] = 0;
  v12[1] = 0;
  [(DownloadEntity *)v8 getValues:v12 forProperties:v13 count:2];
  id v9 = 0;
  if (SSDownloadKindIsSoftwareKind()) {
    id v9 = v12[0];
  }
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (id)_applicationHandleForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4
{
  id v5 = a4;
  id v6 = [DownloadEntity alloc];
  id v7 = [v5 database];
  id v8 = [(DownloadEntity *)v6 initWithPersistentID:a3 inDatabase:v7];

  v16[0] = @"bundle_id";
  v16[1] = @"kind";
  v16[2] = @"transaction_id";
  v14[0] = 0;
  v14[1] = 0;
  id v15 = 0;
  [(DownloadEntity *)v8 getValues:v14 forProperties:v16 count:3];
  id v9 = 0;
  if (SSDownloadKindIsSoftwareKind() && v14[0])
  {
    if (v15)
    {
      id v10 = [ApplicationHandle alloc];
      id v11 = [v15 longLongValue];
      id v9 = [(ApplicationHandle *)v10 initWithTransactionIdentifier:v11 downloadIdentifier:a3 bundleIdentifier:v14[0]];
    }
    else
    {
      id v9 = 0;
    }
  }
  for (uint64_t i = 2; i != -1; --i)

  return v9;
}

- (void)_attemptRecoveryForDownloadWithTaskState:(id)a3 databaseSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[ExpiredDownloadRecoveryOperation initWithDownloadIdentifier:databaseSession:]([ExpiredDownloadRecoveryOperation alloc], "initWithDownloadIdentifier:databaseSession:", [v6 downloadIdentifier], v7);
  objc_initWeak(&location, self);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10011321C;
  id v12 = &unk_1003A6D78;
  objc_copyWeak(&v13, &location);
  [(ExpiredDownloadRecoveryOperation *)v8 setOutputBlock:&v9];
  -[NSMapTable setObject:forKey:](self->_taskStates, "setObject:forKey:", v6, v8, v9, v10, v11, v12);
  [(ISOperationQueue *)self->_processingOperationQueue addOperation:v8];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_authenticationChallengeQueue
{
  authenticationChallengeQueue = self->_authenticationChallengeQueue;
  if (!authenticationChallengeQueue)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    id v5 = self->_authenticationChallengeQueue;
    self->_authenticationChallengeQueue = v4;

    [(ISOperationQueue *)self->_authenticationChallengeQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)self->_authenticationChallengeQueue setName:@"com.apple.itunesstored.DownloadPipeline.auth"];
    authenticationChallengeQueue = self->_authenticationChallengeQueue;
  }

  return authenticationChallengeQueue;
}

- (void)_commitProgressTimer
{
  if ([(NSMutableSet *)self->_dirtyTaskStates count])
  {
    database = self->_database;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001133B4;
    v7[3] = &unk_1003A5648;
    v7[4] = self;
    id v4 = [(DownloadsDatabase *)database modifyUsingTransactionBlock:v7];
    [(NSMutableSet *)self->_dirtyTaskStates removeAllObjects];
  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    id v6 = self->_progressTimer;
    self->_progressTimer = 0;
  }
}

- (void)_disavowDownloadHandlerSession:(id)a3 withTaskState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 requiresDownloadHandler])
  {
    database = self->_database;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100113ACC;
    v10[3] = &unk_1003A4D58;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    id v9 = [(DownloadsDatabase *)database modifyUsingTransactionBlock:v10];
  }
  [(DownloadPipeline *)self _releaseDownloadHandlerSession:v6 withTaskState:v7];
}

- (BOOL)_downloadIsForLegacyClientWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_taskStates;
  id v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = -[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", v10, (void)v16);
          if ([v11 isLegacyClient])
          {
            id v12 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v11, "downloadIdentifier"));
            unsigned __int8 v13 = [v4 isEqualToNumber:v12];

            if (v13)
            {

              BOOL v14 = 1;
              goto LABEL_14;
            }
          }
        }
      }
      id v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (id)_downloadSessionPropertiesWithPhase:(id)a3 taskState:(id)a4 databaseSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [DownloadEntity alloc];
  id v11 = [v8 downloadIdentifier];
  id v12 = [v9 database];
  unsigned __int8 v13 = [(DownloadEntity *)v10 initWithPersistentID:v11 inDatabase:v12];

  v20[0] = @"client_id";
  v20[1] = @"handler_id";
  v20[2] = @"is_from_store";
  v20[3] = @"suppress_error_dialogs";
  long long v18 = 0u;
  long long v19 = 0u;
  [(DownloadEntity *)v13 getValues:&v18 forProperties:v20 count:4];
  BOOL v14 = [DownloadSessionProperties alloc];
  id v15 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:](v14, "initWithClientIdentifier:handlerIdentifier:", (void)v18, [*((id *)&v18 + 1) longLongValue]);
  -[DownloadSessionProperties setAssetIdentifier:](v15, "setAssetIdentifier:", [v8 mediaAssetIdentifier]);
  -[DownloadSessionProperties setDownloadIdentifier:](v15, "setDownloadIdentifier:", [v8 downloadIdentifier]);
  [(DownloadSessionProperties *)v15 setDownloadPhase:v7];
  -[DownloadSessionProperties setStoreDownload:](v15, "setStoreDownload:", [(id)v19 BOOLValue]);
  -[DownloadSessionProperties setShouldSupressErrorDialogs:](v15, "setShouldSupressErrorDialogs:", [*((id *)&v19 + 1) BOOLValue]);
  for (uint64_t i = 3; i != -1; --i)

  return v15;
}

- (void)_failDownloadWithIdentifier:(id)a3 error:(id)a4 transaction:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [DownloadEntity alloc];
  id v11 = [v9 longLongValue];

  id v12 = [v7 database];
  BOOL v14 = [(DownloadEntity *)v10 initWithPersistentID:v11 inDatabase:v12];

  unsigned __int8 v13 = [(DownloadEntity *)v14 failWithError:v8];

  [v7 unionChangeset:v13];
}

- (void)_finishDownloadWithOperation:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001142A0;
  v11[3] = &unk_1003A4D58;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v11];
}

- (void)_taskReceived:(id)a3 persistAVAssetDownloadToken:(unint64_t)a4
{
  id v6 = a3;
  database = self->_database;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100115120;
  v9[3] = &unk_1003A6DA0;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v9];
}

- (void)_performDownloadOperation:(id)a3
{
  id v94 = a3;
  id v4 = [v94 response];
  id v5 = [v4 downloadIdentifier];
  if (!v5)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      v7 |= 2u;
    }
    id v8 = [v6 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      *(_WORD *)v124 = 0;
      LODWORD(v91) = 2;
      v89 = v124;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v124, v91);
        unint64_t v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        free(v10);
        v89 = v11;
        SSFileLog();
      }
    }
    else
    {
    }
  }
  id v12 = objc_msgSend(v4, "result", v89);
  if (sub_10015A078((uint64_t)v12))
  {
    id v13 = [v4 kind];
    BOOL v14 = +[ScratchManager directoryPathForDownloadID:v5 kind:v13 createIfNeeded:1];

    id v15 = [v4 bundleIdentifier];
    BOOL v16 = [v15 length] == 0;

    uint64_t v17 = +[SSLogConfig sharedDaemonConfig];
    long long v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        long long v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        v24 |= 2u;
      }
      id v20 = [v18 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        int v25 = v24;
      }
      else {
        int v25 = v24 & 2;
      }
      if (!v25) {
        goto LABEL_36;
      }
      *(_DWORD *)v124 = 138412546;
      *(void *)&v124[4] = v14;
      *(_WORD *)&v124[12] = 2048;
      *(void *)&v124[14] = v5;
      LODWORD(v91) = 22;
      __int16 v90 = v124;
      int v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, v124, v91);
        free(v26);
        __int16 v90 = v20;
        SSFileLog();
        goto LABEL_36;
      }
    }
    else
    {
      if (!v17)
      {
        long long v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        v19 |= 2u;
      }
      id v20 = [v18 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        int v21 = v19;
      }
      else {
        int v21 = v19 & 2;
      }
      if (!v21) {
        goto LABEL_36;
      }
      id v22 = [v4 bundleIdentifier];
      *(_DWORD *)v124 = 138412802;
      *(void *)&v124[4] = v14;
      *(_WORD *)&v124[12] = 2048;
      *(void *)&v124[14] = v5;
      *(_WORD *)&v124[22] = 2112;
      v125 = v22;
      LODWORD(v91) = 32;
      __int16 v90 = v124;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl();

      if (v23)
      {
        id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, v124, v91);
        free(v23);
        __int16 v90 = v20;
        SSFileLog();
LABEL_36:
      }
    }
  }
  unsigned __int8 v27 = objc_msgSend(v4, "URLSessionIdentifier", v90);
  *(void *)v124 = 0;
  *(void *)&v124[8] = v124;
  *(void *)&v124[16] = 0x3032000000;
  v125 = sub_1001163D0;
  v126 = sub_1001163E0;
  id v127 = 0;
  database = self->_database;
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_1001163E8;
  v112[3] = &unk_1003A5580;
  id v29 = v4;
  v114 = self;
  v115 = v124;
  id v113 = v29;
  [(DownloadsDatabase *)database dispatchBlockSync:v112];
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = sub_1001163D0;
  v110 = sub_1001163E0;
  id v111 = 0;
  unsigned int v30 = [v29 isHLS];
  uint64_t v31 = *(void *)(*(void *)&v124[8] + 40);
  if (v30)
  {
    if (v31) {
      goto LABEL_44;
    }
    uint64_t v32 = [v29 sessionConfiguration];
    uint64_t v33 = +[AVAssetDownloadURLSession sessionWithConfiguration:v32 assetDownloadDelegate:self delegateQueue:0];
  }
  else
  {
    if (v31) {
      goto LABEL_44;
    }
    uint64_t v32 = [v29 sessionConfiguration];
    uint64_t v33 = +[NSURLSession sessionWithConfiguration:v32 delegate:self delegateQueue:0];
  }
  unsigned int v34 = *(void **)(*(void *)&v124[8] + 40);
  *(void *)(*(void *)&v124[8] + 40) = v33;

LABEL_44:
  if (v12)
  {
    int v35 = 0;
    id v36 = 0;
  }
  else
  {
    uint64_t v37 = *(void *)(*(void *)&v124[8] + 40);
    id v105 = 0;
    int v35 = [v29 sessionTaskWithSession:v37 error:&v105];
    id v36 = v105;
  }
  id v38 = self->_database;
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_10011645C;
  v95[3] = &unk_1003A6DC8;
  id v39 = v29;
  id v96 = v39;
  v97 = self;
  v101 = v124;
  id v40 = v27;
  id v98 = v40;
  v102 = &v106;
  id v103 = v12;
  id v104 = v5;
  id v41 = v35;
  id v99 = v41;
  id v42 = v36;
  id v100 = v42;
  id v43 = [(DownloadsDatabase *)v38 modifyUsingTransactionBlock:v95];
  if (!v107[5])
  {
    if (!v41) {
      goto LABEL_107;
    }
    if ([v39 isRestore])
    {
      unsigned int v54 = [v39 isCellularAllowed];
      double v55 = +[RestoreManager sharedInstance];
      unsigned int v56 = [v55 isCellularAllowed];

      if (v54 != v56)
      {
        id v57 = +[SSLogConfig sharedDaemonConfig];
        if (!v57)
        {
          id v57 = +[SSLogConfig sharedConfig];
        }
        unsigned int v58 = [v57 shouldLog];
        unsigned int v59 = [v57 shouldLogToDisk];
        int v60 = [v57 OSLogObject];
        v61 = v60;
        if (v59) {
          int v62 = v58 | 2;
        }
        else {
          int v62 = v58;
        }
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
          int v63 = v62;
        }
        else {
          int v63 = v62 & 2;
        }
        if (v63)
        {
          id v64 = [v41 taskIdentifier];
          int v116 = 134218240;
          id v117 = v64;
          __int16 v118 = 2048;
          id v119 = v5;
          LODWORD(v91) = 22;
          long long v65 = (void *)_os_log_send_and_compose_impl();

          if (!v65)
          {
LABEL_76:

            [v41 cancelWithITunesStoreReason:3 error:0];
            goto LABEL_107;
          }
          v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v65, 4, &v116, v91);
          free(v65);
          SSFileLog();
        }

        goto LABEL_76;
      }
    }
    uint64_t v66 = +[SSLogConfig sharedDaemonConfig];
    if (!v66)
    {
      uint64_t v66 = +[SSLogConfig sharedConfig];
    }
    unsigned int v67 = [v66 shouldLog];
    unsigned int v68 = [v66 shouldLogToDisk];
    id v69 = [v66 OSLogObject];
    __int16 v70 = v69;
    if (v68) {
      int v71 = v67 | 2;
    }
    else {
      int v71 = v67;
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
      int v72 = v71;
    }
    else {
      int v72 = v71 & 2;
    }
    if (v72)
    {
      id v73 = [v41 taskIdentifier];
      id v74 = [v41 _priority];
      int v116 = 134218754;
      id v117 = v73;
      __int16 v118 = 2048;
      id v119 = v74;
      __int16 v120 = 2048;
      id v121 = v5;
      __int16 v122 = 2114;
      id v123 = v40;
      LODWORD(v91) = 42;
      long long v75 = (void *)_os_log_send_and_compose_impl();

      if (!v75) {
        goto LABEL_89;
      }
      __int16 v70 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v75, 4, &v116, v91);
      free(v75);
      SSFileLog();
    }

LABEL_89:
    uint64_t v76 = objc_opt_class();
    id v77 = [v41 taskIdentifier];
    id v93 = [v41 _priority];
    SSDebugLog();
    objc_msgSend(v41, "resume", v76, v77, v93, v5, v40);
    long long v78 = [v39 kind];
    if (([v78 isEqualToString:SSDownloadKindMusic] & 1) == 0)
    {
      long long v79 = [v39 kind];
      if (![v79 isEqualToString:SSDownloadKindMusicVideo])
      {
        unsigned __int8 v88 = [v39 isHLS];

        if ((v88 & 1) == 0)
        {
LABEL_94:
          long long v80 = +[SSLogConfig sharedDaemonConfig];
          if (!v80)
          {
            long long v80 = +[SSLogConfig sharedConfig];
          }
          unsigned int v81 = [v80 shouldLog];
          unsigned int v82 = [v80 shouldLogToDisk];
          long long v83 = [v80 OSLogObject];
          long long v84 = v83;
          if (v82) {
            int v85 = v81 | 2;
          }
          else {
            int v85 = v81;
          }
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
            int v86 = v85;
          }
          else {
            int v86 = v85 & 2;
          }
          if (v86)
          {
            int v116 = 138412290;
            id v117 = v41;
            LODWORD(v92) = 12;
            v87 = (void *)_os_log_send_and_compose_impl();

            if (!v87)
            {
LABEL_106:

              goto LABEL_107;
            }
            long long v84 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v87, 4, &v116, v92);
            free(v87);
            SSFileLog();
          }

          goto LABEL_106;
        }
LABEL_93:
        [v94 setWaitForDownload:1];
        [(NSMutableDictionary *)self->_downloadOperationsByTask setObject:v94 forKey:v41];
        goto LABEL_94;
      }
    }
    goto LABEL_93;
  }
  int v44 = +[SSLogConfig sharedDaemonConfig];
  if (!v44)
  {
    int v44 = +[SSLogConfig sharedConfig];
  }
  unsigned int v45 = [v44 shouldLog];
  unsigned int v46 = [v44 shouldLogToDisk];
  id v47 = [v44 OSLogObject];
  __int16 v48 = v47;
  if (v46) {
    int v49 = v45 | 2;
  }
  else {
    int v49 = v45;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
    int v50 = v49;
  }
  else {
    int v50 = v49 & 2;
  }
  if (!v50) {
    goto LABEL_59;
  }
  id v51 = [(id)v107[5] sessionID];
  int v116 = 134218240;
  id v117 = v51;
  __int16 v118 = 2048;
  id v119 = v5;
  LODWORD(v91) = 22;
  uint64_t v52 = (void *)_os_log_send_and_compose_impl();

  if (v52)
  {
    __int16 v48 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v116, v91);
    free(v52);
    SSFileLog();
LABEL_59:
  }
  uint64_t v53 = +[DownloadHandlerManager handlerManager];
  objc_msgSend(v53, "beginSessionWithID:", objc_msgSend((id)v107[5], "sessionID"));

  [v41 cancel];
LABEL_107:

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(v124, 8);
}

- (void)_finishRecoveryWithOperation:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001173AC;
  v11[3] = &unk_1003A4D58;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DownloadsDatabase *)database modifyAsyncUsingTransactionBlock:v11];
}

- (BOOL)_hasAutomaticUpdateTasks
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_taskStates;
  id v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        id v9 = [v8 automaticType];

        if (v9 == (id)2)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_logDownloadEvent:(id)a3 forTaskWithState:(id)a4 session:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 downloadIdentifier];
  id v11 = [v8 mediaAssetIdentifier];

  id v13 = [v7 newEventDictionaryWithDownloadIdentifier:v10 assetIdentifier:v11];
  long long v12 = +[EventDispatcher eventDispatcher];
  [v12 postEventWithName:v9 userInfo:v13];
}

- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3 withSessionProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [v8 protectionSpace];
  long long v12 = [v11 authenticationMethod];
  if (![v12 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    if ([v12 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      id v13 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v11 serverTrust]);
      v10[2](v10, 0, v13);

      goto LABEL_28;
    }
    if ([v9 isStoreDownload])
    {
      long long v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14)
      {
        long long v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      uint64_t v17 = [v14 OSLogObject];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        v16 &= 2u;
      }
      if (!v16) {
        goto LABEL_26;
      }
    }
    else
    {
      if (![v9 shouldSupressErrorDialogs])
      {
        id v21 = [objc_alloc((Class)ISURLAuthenticationChallenge) initWithAuthenticationChallenge:v8];
        id v22 = [objc_alloc((Class)ISDialog) initWithAuthenticationChallege:v21];
        uint64_t v23 = [[DaemonDialogOperation alloc] initWithDialog:v22];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        void v26[2] = sub_100117D30;
        v26[3] = &unk_1003A6DF0;
        unsigned __int8 v27 = v10;
        [(DaemonDialogOperation *)v23 setOutputBlock:v26];
        unsigned int v24 = [(DownloadPipeline *)self _authenticationChallengeQueue];
        [v24 addOperation:v23];

        goto LABEL_28;
      }
      long long v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14)
      {
        long long v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v18 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      uint64_t v17 = [v14 OSLogObject];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        v19 &= 2u;
      }
      if (!v19) {
        goto LABEL_26;
      }
    }
    int v28 = 134217984;
    id v29 = [v9 downloadIdentifier];
    LODWORD(v25) = 12;
    id v20 = (void *)_os_log_send_and_compose_impl();

    if (!v20)
    {
LABEL_27:

      v10[2](v10, 2, 0);
      goto LABEL_28;
    }
    uint64_t v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v28, v25);
    free(v20);
    SSFileLog();
LABEL_26:

    goto LABEL_27;
  }
  v10[2](v10, 1, 0);
LABEL_28:
}

- (void)_prepareDownloadsMatchingPredicate:(id)a3 ignoreDownloadHandlers:(BOOL)a4 filtersExistingTasks:(BOOL)a5
{
  id v8 = a3;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100117F3C;
  v11[3] = &unk_1003A6E68;
  BOOL v13 = a5;
  v11[4] = self;
  id v12 = v8;
  BOOL v14 = a4;
  id v10 = v8;
  [(DownloadsDatabase *)database readUsingTransactionBlock:v11];
}

- (void)_processDownloadWithTaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setTransferProgress:1.0];
  [(NSMutableSet *)self->_dirtyTaskStates addObject:v10];
  [(DownloadPipeline *)self _startProgressTimer];
  [(DownloadPipeline *)self _queueFinishDownloadWithtaskState:v10 databaseSession:v9 setupBlock:v8];
}

- (void)_queueFinishDownloadWithtaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, FinishDownloadOperation *))a5;
  id v11 = -[FinishDownloadOperation initWithDownloadIdentifier:databaseSession:]([FinishDownloadOperation alloc], "initWithDownloadIdentifier:databaseSession:", [v8 downloadIdentifier], v9);
  [(FinishDownloadOperation *)v11 setDelegate:self];
  [(FinishDownloadOperation *)v11 setShouldRunWithBackgroundPriority:1];
  objc_initWeak(&location, self);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  BOOL v14 = sub_100118590;
  unsigned int v15 = &unk_1003A6E90;
  objc_copyWeak(&v16, &location);
  [(FinishDownloadOperation *)v11 setOutputBlock:&v12];
  if (v10) {
    v10[2](v10, v11);
  }
  -[NSMapTable setObject:forKey:](self->_taskStates, "setObject:forKey:", v8, v11, v12, v13, v14, v15);
  [(ISOperationQueue *)self->_processingOperationQueue addOperation:v11];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_processDownloadFailureWithTaskState:(id)a3 cancelReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 bundleIdentifier];
  if (a4 == 1) {
    CFStringRef v8 = @"Unrecoverable Error";
  }
  else {
    CFStringRef v8 = @"Download Error";
  }
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_16;
  }
  id v13 = [v6 downloadIdentifier];
  CFStringRef v14 = @"User Stopped";
  if (a4 != 2) {
    CFStringRef v14 = v8;
  }
  int v24 = 134218242;
  id v25 = v13;
  __int16 v26 = 2112;
  CFStringRef v27 = v14;
  LODWORD(v23) = 22;
  id v22 = &v24;
  unsigned int v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v24, v23);
    free(v15);
    id v22 = (int *)v12;
    SSFileLog();
LABEL_16:
  }
  id v16 = [v6 kind];
  if (v16 && SSDownloadKindIsSoftwareKind() && [v7 length])
  {
    uint64_t v17 = [ApplicationHandle alloc];
    unsigned int v18 = [v6 downloadHandle];
    int v19 = [v6 bundleIdentifier];
    id v20 = [(ApplicationHandle *)v17 initWithDownloadHandle:v18 bundleIdentifier:v19];

    id v21 = +[ApplicationWorkspace defaultWorkspace];
    [v21 restorePlaceholderForApplicationHandle:v20];
  }
  objc_msgSend(v6, "setTransferProgress:", 1.0, v22);
  [(NSMutableSet *)self->_dirtyTaskStates addObject:v6];
}

- (void)_releaseDownloadHandlerSession:(id)a3 withTaskState:(id)a4
{
  id v6 = a4;
  id v7 = [a3 sessionProperties];
  CFStringRef v8 = [v7 downloadPhase];

  if ([v8 isEqualToString:SSDownloadPhaseDownloading])
  {
    id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", SSSQLEntityPropertyPersistentID, [v6 downloadIdentifier]);
    [(DownloadPipeline *)self _prepareDownloadsMatchingPredicate:v9 ignoreDownloadHandlers:1 filtersExistingTasks:0];
  }
  else
  {
    database = self->_database;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001189E8;
    v11[3] = &unk_1003A55D0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    [(DownloadsDatabase *)database readUsingTransactionBlock:v11];
  }
}

- (void)_reloadKeepAliveAssertion
{
  if ([(NSMutableOrderedSet *)self->_preparationDownloadIDs count])
  {
    if (self->_holdingKeepAliveAssertion) {
      return;
    }
    self->_holdingKeepAliveAssertion = 1;
    goto LABEL_16;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_taskStates;
  id v4 = (char *)[(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LODWORD(v4) = 1;
          goto LABEL_14;
        }
      }
      id v4 = (char *)[(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (self->_holdingKeepAliveAssertion != v4)
  {
    self->_holdingKeepAliveAssertion = (char)v4;
    if (!v4)
    {
      id v7 = +[Daemon daemon];
      [v7 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadPipeline"];
      goto LABEL_18;
    }
LABEL_16:
    id v7 = +[Daemon daemon];
    [v7 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadPipeline"];
LABEL_18:
  }
}

- (void)_scheduleReconnect
{
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer((dispatch_source_t)reconnectTimer, v3, 0, 0);
  }
  else
  {
    uint64_t v5 = [(DownloadsDatabase *)self->_database newDispatchSourceWithType:&_dispatch_source_type_timer];
    id v6 = self->_reconnectTimer;
    self->_reconnectTimer = v5;

    id v7 = self->_reconnectTimer;
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer((dispatch_source_t)v7, v8, 0, 0);
    objc_initWeak(&location, self);
    long long v9 = self->_reconnectTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100118DC8;
    v10[3] = &unk_1003A4248;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
    dispatch_resume((dispatch_object_t)self->_reconnectTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_setDownloadPhase:(id)a3 forDownloadIdentifier:(int64_t)a4 databaseTransaction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!a4)
  {
    long long v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      long long v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    id v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v23[0] = 0;
      LODWORD(v22) = 2;
      CFStringRef v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v23, v22);
      free(v14);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  unsigned int v15 = [DownloadEntity alloc];
  id v16 = [v8 database];
  uint64_t v17 = [(DownloadEntity *)v15 initWithPersistentID:a4 inDatabase:v16];

  [(DownloadEntity *)v17 setValue:v7 forProperty:@"download_state.phase"];
  id v18 = objc_alloc((Class)NSDictionary);
  id v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", v7, SSDownloadPropertyDownloadPhase, 0);
  id v20 = +[DownloadController controller];
  id v21 = [(DownloadEntity *)v17 valueForProperty:@"kind"];
  [v20 notifyClientsOfPropertyChanges:v19 forDownloadID:a4 downloadKind:v21];
}

- (void)_startProgressTimer
{
  if (!self->_progressTimer)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = [(DownloadsDatabase *)self->_database newDispatchSourceWithType:&_dispatch_source_type_timer];
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    uint64_t v5 = self->_progressTimer;
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    id v7 = self->_progressTimer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001192A4;
    v8[3] = &unk_1003A4248;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_resume((dispatch_object_t)self->_progressTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_isPodcast:(id)a3
{
  dispatch_time_t v3 = [a3 valueForProperty:@"kind"];
  char IsPodcastKind = SSDownloadKindIsPodcastKind();

  return IsPodcastKind;
}

- (void)_reportTVAppDownloadQOSMetricsIfAppropriateForKind:(id)a3 adamID:(id)a4 rentalID:(id)a5 error:(id)a6 cancelReason:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (SSDownloadKindIsVideosAppKind())
  {
    if (a7 == 2)
    {
      int v15 = 300;
    }
    else if (v14 || a7 == 1)
    {
      if (!v14)
      {
        id v16 = objc_alloc((Class)NSError);
        id v14 = [v16 initWithDomain:SSErrorDomain code:100 userInfo:0];
      }
      int v15 = 500;
    }
    else
    {
      id v14 = 0;
      int v15 = 200;
    }
    unsigned int v85 = v15;
    uint64_t v17 = ISWeakLinkedStringConstantForString();
    id v18 = ISWeakLinkedStringConstantForString();
    id v19 = ISWeakLinkedStringConstantForString();
    id v20 = ISWeakLinkedStringConstantForString();
    id v21 = ISWeakLinkedStringConstantForString();
    id v94 = ISWeakLinkedStringConstantForString();
    id v93 = ISWeakLinkedStringConstantForString();
    uint64_t v92 = ISWeakLinkedStringConstantForString();
    uint64_t v91 = ISWeakLinkedStringConstantForString();
    __int16 v90 = ISWeakLinkedStringConstantForString();
    v89 = ISWeakLinkedStringConstantForString();
    unsigned __int8 v88 = ISWeakLinkedStringConstantForString();
    uint64_t v22 = ISWeakLinkedClassForString();
    if (!v22 || !v17 || !v18 || !v19 || !v20 || !v21 || !v94 || !v93 || !v92 || !v91 || !v90 || !v89 || !v88) {
      goto LABEL_98;
    }
    uint64_t v23 = (objc_class *)v22;
    long long v78 = v20;
    long long v79 = v19;
    v100[0] = v19;
    v100[1] = v20;
    v101[0] = &off_1003C9330;
    v101[1] = &off_1003C9348;
    long long v83 = v21;
    v100[2] = v21;
    int v24 = +[NSNumber numberWithUnsignedInt:arc4random()];
    v101[2] = v24;
    v101[3] = &__kCFBooleanFalse;
    v100[3] = v94;
    v100[4] = v93;
    v100[5] = v92;
    v101[4] = &__kCFBooleanTrue;
    v101[5] = @"com.apple.tv";
    v87 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:6];

    uint64_t v76 = v18;
    v98[0] = v18;
    v98[1] = @"ContentProvider";
    v99[0] = @"AppleTV";
    v99[1] = @"tvs.sbd.9001";
    v98[2] = @"iTunesServiceMonitoringKey";
    v99[2] = &__kCFBooleanTrue;
    id v25 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
    id v26 = [v25 mutableCopy];

    int v86 = v26;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v13 longLongValue])
    {
      CFStringRef v27 = @"com.apple.videos.movies.rental.cloud";
    }
    else
    {
      if (([v11 isEqualToString:SSDownloadKindMovie] & 1) == 0)
      {
        if (![v11 isEqualToString:SSDownloadKindTelevisionEpisode])
        {
          CFStringRef v28 = 0;
          char v29 = 0;
          if (!v12) {
            goto LABEL_40;
          }
LABEL_35:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = [v12 longLongValue];
            char v31 = v29 ^ 1;
            if (!v30) {
              char v31 = 1;
            }
            if ((v31 & 1) == 0)
            {
              uint64_t v32 = +[NSString stringWithFormat:@"a=%@:s=%@:e=%@", v12, @"tvs.sbd.9001", v28];
              [v86 setObject:v32 forKey:@"MediaIdentifier"];
            }
          }
LABEL_40:
          id v82 = v13;
          uint64_t v33 = +[SSDevice currentDevice];
          uint64_t v34 = [v33 storeFrontIdentifier];

          if (v34) {
            [v86 setObject:v34 forKey:@"StorefrontID"];
          }
          id v77 = (void *)v34;
          int v35 = +[SSLogConfig sharedDaemonConfig];
          if (!v35)
          {
            int v35 = +[SSLogConfig sharedConfig];
          }
          unsigned int v36 = [v35 shouldLog];
          if ([v35 shouldLogToDisk]) {
            v36 |= 2u;
          }
          uint64_t v37 = [v35 OSLogObject];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            int v38 = v36;
          }
          else {
            int v38 = v36 & 2;
          }
          if (v38)
          {
            int v96 = 138412290;
            v97[0] = v87;
            LODWORD(v74) = 12;
            int v71 = &v96;
            id v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39) {
              goto LABEL_53;
            }
            uint64_t v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v96, v74);
            free(v39);
            int v71 = (int *)v37;
            SSFileLog();
          }

LABEL_53:
          id v40 = +[SSLogConfig sharedDaemonConfig];
          if (!v40)
          {
            id v40 = +[SSLogConfig sharedConfig];
          }
          unsigned int v41 = objc_msgSend(v40, "shouldLog", v71);
          if ([v40 shouldLogToDisk]) {
            v41 |= 2u;
          }
          id v42 = [v40 OSLogObject];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            int v43 = v41;
          }
          else {
            int v43 = v41 & 2;
          }
          if (v43)
          {
            int v96 = 138412290;
            v97[0] = v86;
            LODWORD(v74) = 12;
            int v72 = &v96;
            int v44 = (void *)_os_log_send_and_compose_impl();

            if (!v44) {
              goto LABEL_64;
            }
            id v42 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v96, v74);
            free(v44);
            int v72 = (int *)v42;
            SSFileLog();
          }

LABEL_64:
          long long v80 = v17;

          id v45 = [[v23 alloc] initWithSessionInfo:v87 userInfo:v86 frameworksToCheck:0];
          [v45 setMessageLoggingBlock:&stru_1003A6EF8];
          long long v84 = v45;
          [v45 startConfigurationWithCompletionHandler:&stru_1003A6F38];
          id v46 = objc_alloc_init((Class)NSMutableDictionary);
          id v81 = v14;
          id v47 = v14;
          v95 = v46;
          if (v47)
          {
            __int16 v48 = v47;
            id v75 = v12;
            uint64_t v49 = 0;
            do
            {
              int v50 = +[NSString stringWithFormat:@"errorDomain%d", v49];
              id v51 = +[NSString stringWithFormat:@"errorCode%d", v49];
              uint64_t v52 = [v48 domain];
              uint64_t v53 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v48 code]);
              if (v52) {
                [v46 setObject:v52 forKey:v50];
              }
              [v46 setObject:v53 forKey:v51];
              unsigned int v54 = [v48 userInfo];
              double v55 = [v54 objectForKey:NSUnderlyingErrorKey];

              id v46 = v95;
              if (!v55) {
                break;
              }
              __int16 v48 = v55;
              BOOL v56 = v49 >= 9;
              uint64_t v49 = (v49 + 1);
            }
            while (!v56);

            id v12 = v75;
            id v21 = v83;
          }
          objc_msgSend(v46, "setObject:forKey:", @"downloadResult", @"event", v72);
          id v57 = objc_alloc_init((Class)NSMutableDictionary);
          [v57 setObject:&off_1003C9360 forKey:v91];
          unsigned int v58 = +[NSNumber numberWithUnsignedShort:v85];
          [v57 setObject:v58 forKey:v90];

          [v57 setObject:&off_1003C9378 forKey:v89];
          [v57 setObject:v46 forKey:v88];
          unsigned int v59 = +[SSLogConfig sharedDaemonConfig];
          if (!v59)
          {
            unsigned int v59 = +[SSLogConfig sharedConfig];
          }
          unsigned int v60 = [v59 shouldLog];
          if ([v59 shouldLogToDisk]) {
            v60 |= 2u;
          }
          v61 = [v59 OSLogObject];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
            int v62 = v60;
          }
          else {
            int v62 = v60 & 2;
          }
          id v13 = v82;
          if (v62)
          {
            int v96 = 67109378;
            LODWORD(v97[0]) = v85;
            WORD2(v97[0]) = 2112;
            *(void *)((char *)v97 + 6) = v57;
            LODWORD(v74) = 18;
            id v73 = &v96;
            int v63 = (void *)_os_log_send_and_compose_impl();

            if (!v63) {
              goto LABEL_83;
            }
            v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, &v96, v74);
            free(v63);
            id v73 = (int *)v61;
            SSFileLog();
          }

LABEL_83:
          unsigned int v64 = [v84 sendMessageWithDictionary:v57 error:0];
          long long v65 = +[SSLogConfig sharedDaemonConfig];
          if (!v65)
          {
            long long v65 = +[SSLogConfig sharedConfig];
          }
          unsigned int v66 = objc_msgSend(v65, "shouldLog", v73);
          if ([v65 shouldLogToDisk]) {
            v66 |= 2u;
          }
          unsigned int v67 = [v65 OSLogObject];
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO)) {
            int v68 = v66;
          }
          else {
            int v68 = v66 & 2;
          }
          if (v68)
          {
            CFStringRef v69 = @"unsuccessful";
            if (v64) {
              CFStringRef v69 = @"successful";
            }
            int v96 = 138412290;
            v97[0] = v69;
            LODWORD(v74) = 12;
            __int16 v70 = (void *)_os_log_send_and_compose_impl();

            id v18 = v76;
            if (!v70) {
              goto LABEL_97;
            }
            unsigned int v67 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v70, 4, &v96, v74);
            free(v70);
            SSFileLog();
          }
          else
          {
            id v18 = v76;
          }

LABEL_97:
          uint64_t v17 = v80;
          id v14 = v81;
          id v20 = v78;
          id v19 = v79;
LABEL_98:

          goto LABEL_99;
        }
        CFStringRef v27 = @"com.apple.videos.tvshows.purchase.cloud";
        CFStringRef v28 = @"episode";
LABEL_32:
        [v26 setObject:v27 forKey:v17];
        char v29 = 1;
        if (!v12) {
          goto LABEL_40;
        }
        goto LABEL_35;
      }
      CFStringRef v27 = @"com.apple.videos.movies.purchase.cloud";
    }
    CFStringRef v28 = @"movie";
    goto LABEL_32;
  }
LABEL_99:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDiscretionaryDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_discretionaryDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationsByTask, 0);
  objc_storeStrong((id *)&self->_urlSessions, 0);
  objc_storeStrong((id *)&self->_taskStates, 0);
  objc_storeStrong((id *)&self->_resourceLoaders, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_processingOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparationOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparationDownloadIDs, 0);
  objc_storeStrong((id *)&self->_downloadHandlerSessions, 0);
  objc_storeStrong((id *)&self->_dirtyTaskStates, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_backgroundOperationQueue, 0);
  objc_storeStrong((id *)&self->_authenticationChallengeQueue, 0);

  objc_storeStrong((id *)&self->_aggregateDownloadProgress, 0);
}

@end