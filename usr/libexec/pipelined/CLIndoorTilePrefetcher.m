@interface CLIndoorTilePrefetcher
+ (id)backgroundSessionConfigurationWithDiscretionary:(BOOL)a3 isDaemon:(BOOL)a4;
+ (id)createNewRequest:(int)a3 forURL:(id)a4 lastRelevant:(id)a5;
+ (id)foregroundSessionConfigurationWithTimeout:(double)a3;
+ (id)urlForAsset:(id)a3 forFloor:(id)a4 withTileServer:(id)a5;
+ (id)urlForFloor:(id)a3 withTileServer:(id)a4;
- (BOOL)discretionaryBackground;
- (BOOL)isDaemon;
- (BOOL)isTest;
- (BOOL)scheduleDownloadForTile:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10;
- (BOOL)shouldPrefetchFloorMetadataForFloorUuid:(const void *)a3 forSession:(int)a4 withLocationContext:(int64_t)a5;
- (CLIndoorTilePrefetcher)init;
- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5;
- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5 forTest:(BOOL)a6;
- (CLIndoorTilePrefetcherDelegate)delegate;
- (CLQueuedNSURLSession)availableFloorForegroundSessionQueue;
- (CLQueuedNSURLSession)backgroundSessionQueue;
- (CLQueuedNSURLSession)unavailableFloorForegroundSessionQueue;
- (NSDate)now;
- (NSOperationQueue)downloadQ;
- (NSURL)tileServer;
- (OS_dispatch_group)sessionInvalidationGroup;
- (OS_dispatch_queue)delegateQ;
- (int)scheduleDownloadForFloorMetadata:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)allDownloadItemsCompleted;
- (void)cancelAllInflightForegroundDownloadTasks;
- (void)cancelDownloadTasksMatching:(id)a3 onSession:(id)a4;
- (void)cancelInflightBackgroundTasksMatching:(id)a3;
- (void)cancelInflightForegroundTasksMatching:(id)a3;
- (void)invalidate;
- (void)invalidateSessions;
- (void)notifyDelegateForegroundFetchComplete;
- (void)notifyDelegateForegroundTaskCompleted:(id)a3;
- (void)notifyDelegateForegroundTaskCompleted:(id)a3 withError:(id)a4;
- (void)notifyDelegateIfPrefetchComplete;
- (void)notifyDelegatePrefetchComplete;
- (void)onQueueNotifyDelegateForegroundFetchComplete;
- (void)onQueueNotifyDelegatePrefetchComplete;
- (void)onQueueSession:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6;
- (void)onQueueSessionDidCompleteTask:(id)a3 withError:(id)a4;
- (void)onQueueSessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)prefetch:(id)a3;
- (void)requestForegroundFetchForFloors:(id)a3 withRequestUUID:(id)a4;
- (void)resetSessions;
- (void)runFromNetworkCallback:(id)a3;
- (void)scheduleDownloadForRequest:(id)a3 withResumeData:(id)a4 withSession:(int)a5 andExpectedByteSize:(int64_t)a6;
- (void)scheduleForegroundDownloadForFloors:(id)a3 withRequestUUID:(id)a4;
- (void)session:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6;
- (void)session:(id)a3 didResumeRequest:(id)a4 withRemainingRequests:(unint64_t)a5;
- (void)sessionDidCompleteTask:(id)a3 withError:(id)a4;
- (void)sessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)setAvailableFloorForegroundSessionQueue:(id)a3;
- (void)setBackgroundSessionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQ:(id)a3;
- (void)setDiscretionaryBackground:(BOOL)a3;
- (void)setDownloadQ:(id)a3;
- (void)setIsDaemon:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setNow:(id)a3;
- (void)setSessionInvalidationGroup:(id)a3;
- (void)setTileServer:(id)a3;
- (void)setUnavailableFloorForegroundSessionQueue:(id)a3;
@end

@implementation CLIndoorTilePrefetcher

- (void)cancelInflightForegroundTasksMatching:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_availableFloorForegroundSessionQueue != 0)
  {
    if (qword_10047BEF8 == -1)
    {
      v5 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        v6 = [(CLIndoorTilePrefetcher *)self unavailableFloorForegroundSessionQueue];
        v7 = [v6 session];
        [(CLIndoorTilePrefetcher *)self cancelDownloadTasksMatching:v4 onSession:v7];

        v8 = [(CLIndoorTilePrefetcher *)self availableFloorForegroundSessionQueue];
        v9 = [v8 session];
        [(CLIndoorTilePrefetcher *)self cancelDownloadTasksMatching:v4 onSession:v9];

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      v5 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
    }
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Building list of in-flight foreground downloads to cancel", v10, 2u);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)cancelInflightBackgroundTasksMatching:(id)a3
{
  id v4 = a3;
  if (self->_backgroundSessionQueue)
  {
    if (qword_10047BEF8 == -1)
    {
      v5 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        v6 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
        v7 = [v6 session];
        [(CLIndoorTilePrefetcher *)self cancelDownloadTasksMatching:v4 onSession:v7];

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      v5 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
    }
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Building list of in-flight background downloads to cancel", v8, 2u);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)onQueueNotifyDelegatePrefetchComplete
{
  id v2 = [(CLIndoorTilePrefetcher *)self delegate];
  [v2 tilePrefetchFinishedAllDownloads];
}

- (void)requestForegroundFetchForFloors:(id)a3 withRequestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  v8 = (id)qword_10047BF00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v7 UUIDString];
    int v10 = 138477827;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Request foreground fetch requests for request UUID %{private}@", (uint8_t *)&v10, 0xCu);
  }
  [(CLIndoorTilePrefetcher *)self scheduleForegroundDownloadForFloors:v6 withRequestUUID:v7];
}

- (void)notifyDelegatePrefetchComplete
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1000965D0;
  v8[4] = sub_100096564;
  sel_getName(a2);
  id v9 = (id)os_transaction_create();
  v3 = [(CLIndoorTilePrefetcher *)self delegateQ];
  if (!v3)
  {
    if (qword_10047BEF8 == -1)
    {
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005060;
  v5[3] = &unk_10046B820;
  objc_copyWeak(&v6, location);
  v5[4] = v8;
  dispatch_async(v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v8, 8);
}

- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5 forTest:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CLIndoorTilePrefetcher;
  v12 = [(CLIndoorTilePrefetcher *)&v26 init];
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    v12->_isDaemon = !a6;
    v12->_discretionaryBackground = !a6;
    v12->_isTest = a6;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeWeak((id *)&v13->_delegateQ, v11);
    if (!v14->_isTest) {
      [v10 reloadAvailabilityTilePrefetchParameters];
    }
    uint64_t v15 = sub_100007D9C((uint64_t)a3);
    tileServer = v14->_tileServer;
    v14->_tileServer = (NSURL *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    downloadQ = v14->_downloadQ;
    v14->_downloadQ = v17;

    if (qword_10047BEF8 == -1)
    {
      v19 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        dispatch_queue_t v20 = dispatch_queue_create("com.apple.indoord.DownloadQueue", 0);
        v21 = [(CLIndoorTilePrefetcher *)v14 downloadQ];
        [v21 setMaxConcurrentOperationCount:1];

        v22 = [(CLIndoorTilePrefetcher *)v14 downloadQ];
        [v22 setUnderlyingQueue:v20];

        +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:&stru_10046B6C8];
        v23 = v14;

        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      v19 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
    }
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Downloads will be processed 1 at a time", v25, 2u);
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (NSOperationQueue)downloadQ
{
  return self->_downloadQ;
}

- (void)scheduleForegroundDownloadForFloors:(id)a3 withRequestUUID:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  v35 = v5;
  unsigned int v6 = [v5 count];
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  id v7 = (id)qword_10047BF00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v40 UUIDString];
    *(_DWORD *)buf = 67240451;
    BOOL v48 = v6;
    __int16 v49 = 2113;
    *(void *)v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Processing %{public}d foreground fetch requests for request UUID %{private}@", buf, 0x12u);
  }
  if (!v6)
  {
    if (qword_10047BEF8 == -1)
    {
      v32 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_45:
        [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:0];
        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      v32 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Received empty foreground download request", buf, 2u);
    goto LABEL_45;
  }
  [(CLIndoorTilePrefetcher *)self cancelInflightBackgroundTasksMatching:v5];
  [(CLIndoorTilePrefetcher *)self cancelInflightForegroundTasksMatching:v5];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v9)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v42 = 0;
    uint64_t v39 = *(void *)v44;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v10);
        if ([v11 hasCompleteFloor]) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
        v13 = [v11 floorUuid];
        v14 = [v11 venueUuid];
        id v15 = [v11 locationContext];
        v16 = [v11 relevancy];
        unsigned int v17 = -[CLIndoorTilePrefetcher scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v13, v14, v15, v16, [v11 allowCellularDownload], v12, 0, v40);

        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046B930);
        }
        v18 = (id)qword_10047BF00;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v11 venueUuid];
          id v20 = [v19 UTF8String];
          if ([v11 locationContext] == (id)1) {
            int v21 = 82;
          }
          else {
            int v21 = 73;
          }
          id v22 = [v11 priority];
          v23 = [v11 relevancy];
          [v23 timeIntervalSinceNow];
          double v25 = v24;
          unsigned int v26 = [v11 allowCellularDownload];
          *(_DWORD *)buf = 67241474;
          BOOL v48 = v17;
          __int16 v49 = 2082;
          *(void *)v50 = v20;
          *(_WORD *)&v50[8] = 1026;
          *(_DWORD *)v51 = v21;
          *(_WORD *)&v51[4] = 2050;
          id v52 = v22;
          __int16 v53 = 2050;
          double v54 = v25 / 3600.0;
          __int16 v55 = 1026;
          unsigned int v56 = v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "@TileFetch, reqcheck, %{public}d, %{public}s, %{public}c, priority, %{public}ld, relevancy, %{public}.1f, cell, %{public}d", buf, 0x32u);
        }
        if (v17 == 2)
        {
          LODWORD(v37) = v37 + 1;
        }
        else if (v17 == 1)
        {
          ++HIDWORD(v36);
        }
        else if (v17)
        {
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B930);
          }
          ++HIDWORD(v37);
          v28 = qword_10047BF00;
          if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            BOOL v48 = v17;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "@TileFetch, unxpected, scheduled, %{public}d, #Warning", buf, 8u);
          }
        }
        else
        {
          if ([v11 locationContext] == (id)1) {
            int v27 = v36 + 1;
          }
          else {
            int v27 = v36;
          }
          LODWORD(v36) = v27;
        }
        id v29 = [v11 locationContext];
        BOOL v30 = v29 == (id)1;
        if (v29 == (id)1) {
          int v31 = HIDWORD(v42) + 1;
        }
        else {
          int v31 = HIDWORD(v42);
        }
        if (v17 != 2) {
          BOOL v30 = 0;
        }
        LODWORD(v42) = v42 + v30;
        HIDWORD(v42) = v31;
        id v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v9 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v42 = 0;
  }

  if (qword_10047BEF8 == -1)
  {
    v33 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  v33 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_49:
    *(_DWORD *)buf = 67241216;
    BOOL v48 = v36;
    __int16 v49 = 1026;
    *(_DWORD *)v50 = HIDWORD(v36);
    *(_WORD *)&v50[4] = 1026;
    *(_DWORD *)&v50[6] = v37;
    *(_WORD *)v51 = 1026;
    *(_DWORD *)&v51[2] = 0;
    LOWORD(v52) = 1026;
    *(_DWORD *)((char *)&v52 + 2) = HIDWORD(v37);
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "@TileFetch, scheduled, foreground, mtnsu, %{public}d, %{public}d, %{public}d, %{public}d, %{public}d", buf, 0x20u);
  }
LABEL_50:
  if (HIDWORD(v42))
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
    }
    v34 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240704;
      BOOL v48 = HIDWORD(v42) == v42;
      __int16 v49 = 1026;
      *(_DWORD *)v50 = HIDWORD(v42);
      *(_WORD *)&v50[4] = 1026;
      *(_DWORD *)&v50[6] = 100 * (int)v42 / SHIDWORD(v42);
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, localize, %{public}d, groups, %{public}d, pct, %{public}d", buf, 0x14u);
    }
    AnalyticsSendEventLazy();
  }
LABEL_56:
}

- (void)notifyDelegateForegroundTaskCompleted:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v6);

  Name = sel_getName(a2);
  sub_100092088((uint64_t)v9, Name);
  v8 = [(CLIndoorTilePrefetcher *)self delegate];
  [v8 prefetcher:self didFinishForegroundRequest:v5];

  sub_100091F70((uint64_t)v9);
}

- (int)scheduleDownloadForFloorMetadata:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v45 = a9;
  id v19 = a10;
  long long v44 = [(CLIndoorTilePrefetcher *)self delegate];
  if (v16)
  {
    [v16 ps_STLString];
  }
  else
  {
    v56[0] = 0;
    v56[1] = 0;
    uint64_t v57 = 0;
  }
  LOBYTE(v42) = v11;
  id v46 = [[IndoorRequestInfo alloc] initFloor:v16 inVenue:v17 withContext:a5 requestFor:0 withinSession:v10 lastRelevant:v18 allowCellularDownloadTile:v42 requestUUID:v19];
  sub_100085B24(&v51, (uint64_t)v56);
  unsigned __int8 v20 = [(CLIndoorTilePrefetcher *)self shouldPrefetchFloorMetadataForFloorUuid:&v51 forSession:v10 withLocationContext:a5];
  unsigned __int8 v21 = v20;
  id v22 = v52;
  if (!v52 || atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v20) {
      goto LABEL_7;
    }
LABEL_11:
    v23 = v44;
    if ([v44 tilePrefetchShouldPrefetchTileDataForFloor:v56])
    {
      [(CLIndoorTilePrefetcher *)self scheduleDownloadForTile:v16 inVenue:v17 withContext:a5 lastRelevant:v18 allowCellularDownload:v11 onSession:v10 withResumeData:0 withRequestUUID:v19];
      int v27 = 1;

      if ((SHIBYTE(v57) & 0x80000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    id v43 = v19;
    id v29 = (const char *)[v16 UTF8String];
    size_t v30 = strlen(v29);
    if (v30 > 0x7FFFFFFFFFFFFFF7) {
      sub_1000A6968();
    }
    size_t v31 = v30;
    if (v30 >= 0x17)
    {
      uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v30 | 7) != 0x17) {
        uint64_t v33 = v30 | 7;
      }
      uint64_t v34 = v33 + 1;
      p_dst = (long long *)operator new(v33 + 1);
      *((void *)&__dst + 1) = v31;
      unint64_t v50 = v34 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v50) = v30;
      p_dst = &__dst;
      if (!v30)
      {
LABEL_22:
        *((unsigned char *)p_dst + v31) = 0;
        v35 = (const char *)[v17 UTF8String];
        size_t v36 = strlen(v35);
        if (v36 > 0x7FFFFFFFFFFFFFF7) {
          sub_1000A6968();
        }
        size_t v37 = v36;
        if (v36 >= 0x17)
        {
          uint64_t v39 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v36 | 7) != 0x17) {
            uint64_t v39 = v36 | 7;
          }
          uint64_t v40 = v39 + 1;
          p_p = (__n128 *)operator new(v39 + 1);
          __p.n128_u64[1] = v37;
          unint64_t v48 = v40 | 0x8000000000000000;
          __p.n128_u64[0] = (unint64_t)p_p;
          id v19 = v43;
        }
        else
        {
          HIBYTE(v48) = v36;
          p_p = &__p;
          id v19 = v43;
          if (!v36)
          {
LABEL_30:
            p_p->n128_u8[v37] = 0;
            *(void *)&double v41 = sub_100091630((uint64_t)&v51, &__dst, &__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:a5]).n128_u64[0];
            v23 = v44;
            if (SHIBYTE(v48) < 0)
            {
              operator delete((void *)__p.n128_u64[0]);
              if ((SHIBYTE(v50) & 0x80000000) == 0) {
                goto LABEL_32;
              }
            }
            else if ((SHIBYTE(v50) & 0x80000000) == 0)
            {
              goto LABEL_32;
            }
            operator delete((void *)__dst);
LABEL_32:
            [v44 tilePrefetchForTileId:&v51 updateRelevancy:v18, v41];
            if (v10) {
              [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:v46];
            }
            if (v55 < 0)
            {
              operator delete(v54);
              if ((v53 & 0x80000000) == 0)
              {
LABEL_36:
                int v27 = 2;

                if ((SHIBYTE(v57) & 0x80000000) == 0) {
                  goto LABEL_9;
                }
                goto LABEL_8;
              }
            }
            else if ((v53 & 0x80000000) == 0)
            {
              goto LABEL_36;
            }
            operator delete(v51);
            int v27 = 2;

            if ((SHIBYTE(v57) & 0x80000000) == 0) {
              goto LABEL_9;
            }
            goto LABEL_8;
          }
        }
        memmove(p_p, v35, v37);
        goto LABEL_30;
      }
    }
    memmove(p_dst, v29, v31);
    goto LABEL_22;
  }
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  if ((v21 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  v23 = v44;
  double v24 = [(CLIndoorTilePrefetcher *)self tileServer];
  double v25 = +[CLIndoorTilePrefetcher urlForAsset:@"cfgp.gz" forFloor:v16 withTileServer:v24];

  unsigned int v26 = +[CLIndoorTilePrefetcher createNewRequest:v10 forURL:v25 lastRelevant:v18];
  [v46 setOnRequest:v26];
  [(CLIndoorTilePrefetcher *)self scheduleDownloadForRequest:v26 withResumeData:v45 withSession:v10 andExpectedByteSize:100];

  int v27 = 0;
  if (SHIBYTE(v57) < 0) {
LABEL_8:
  }
    operator delete(v56[0]);
LABEL_9:

  return v27;
}

- (BOOL)shouldPrefetchFloorMetadataForFloorUuid:(const void *)a3 forSession:(int)a4 withLocationContext:(int64_t)a5
{
  v8 = [(CLIndoorTilePrefetcher *)self delegate];
  id v9 = v8;
  if (a4 || a5)
  {
    unsigned __int8 v11 = [v8 tilePrefetchShouldPrefetchMetadataForFloor:sub_100085D38((uint64_t)a3) withLocationContext:a5];

    return v11;
  }
  else
  {

    return 1;
  }
}

- (CLIndoorTilePrefetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLIndoorTilePrefetcherDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQ
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateQ);

  return (OS_dispatch_queue *)WeakRetained;
}

- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5
{
  return [(CLIndoorTilePrefetcher *)self initWithServerConfiguration:a3 usingDelegate:a4 queue:a5 forTest:0];
}

- (void)allDownloadItemsCompleted
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TileFetch, allDownloadItemsCompleted", v4, 2u);
  }
LABEL_4:
  [(CLIndoorTilePrefetcher *)self notifyDelegatePrefetchComplete];
}

+ (id)createNewRequest:(int)a3 forURL:(id)a4 lastRelevant:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableURLRequest);
  [v6 setURL:v5];

  return v6;
}

- (CLIndoorTilePrefetcher)init
{
  return 0;
}

- (void)invalidateSessions
{
  dispatch_group_t v3 = dispatch_group_create();
  [(CLIndoorTilePrefetcher *)self setSessionInvalidationGroup:v3];

  if (self->_availableFloorForegroundSessionQueue)
  {
    if (qword_10047BEF8 == -1)
    {
      id v4 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_5:

        v8 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
        dispatch_group_enter(v8);

        id v9 = [(CLIndoorTilePrefetcher *)self availableFloorForegroundSessionQueue];
        [v9 invalidateAndCancel];

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v4 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
    }
    id v5 = [(CLIndoorTilePrefetcher *)self availableFloorForegroundSessionQueue];
    id v6 = [v5 session];
    id v7 = [v6 description];
    int v27 = 138543362;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Requesting invalidation of available floor session %{public}@", (uint8_t *)&v27, 0xCu);

    goto LABEL_5;
  }
LABEL_6:
  if (!self->_unavailableFloorForegroundSessionQueue) {
    goto LABEL_11;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v10 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v10 = (id)qword_10047BF00;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    unsigned __int8 v11 = [(CLIndoorTilePrefetcher *)self unavailableFloorForegroundSessionQueue];
    uint64_t v12 = [v11 session];
    v13 = [v12 description];
    int v27 = 138543362;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Requesting invalidation of unavailable floor session %{public}@", (uint8_t *)&v27, 0xCu);
  }
LABEL_10:

  v14 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
  dispatch_group_enter(v14);

  id v15 = [(CLIndoorTilePrefetcher *)self unavailableFloorForegroundSessionQueue];
  [v15 invalidateAndCancel];

LABEL_11:
  if (!self->_backgroundSessionQueue) {
    goto LABEL_16;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v16 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v16 = (id)qword_10047BF00;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    id v17 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
    id v18 = [v17 session];
    id v19 = [v18 description];
    int v27 = 138543362;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting invalidation of background session %{public}@", (uint8_t *)&v27, 0xCu);
  }
LABEL_15:

  unsigned __int8 v20 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
  dispatch_group_enter(v20);

  unsigned __int8 v21 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
  [v21 invalidateAndCancel];

LABEL_16:
  if (qword_10047BEF8 == -1)
  {
    id v22 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  id v22 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_18:
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Waiting for sessions to be invalidated", (uint8_t *)&v27, 2u);
  }
LABEL_19:
  v23 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
  dispatch_time_t v24 = dispatch_time(0, 30000000000);
  intptr_t v25 = dispatch_group_wait(v23, v24);

  if (v25)
  {
    sub_1003A7B9C();
    __break(1u);
  }
  else if (qword_10047BEF8 == -1)
  {
    unsigned int v26 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      return;
    }
    goto LABEL_22;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  unsigned int v26 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_22:
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Sessions invalidated", (uint8_t *)&v27, 2u);
  }
}

- (void)resetSessions
{
  dispatch_group_t v3 = dispatch_group_create();
  if (self->_unavailableFloorForegroundSessionQueue)
  {
    if (qword_10047BEF8 == -1)
    {
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        dispatch_group_enter(v3);
        id v5 = [(CLIndoorTilePrefetcher *)self unavailableFloorForegroundSessionQueue];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100390D54;
        v17[3] = &unk_1004527B8;
        id v18 = v3;
        [v5 resetWithCompletionHandler:v17];

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempting to reset unavailable foreground session", buf, 2u);
    goto LABEL_5;
  }
LABEL_6:
  if (!self->_availableFloorForegroundSessionQueue) {
    goto LABEL_11;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v6 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to reset available foreground session", buf, 2u);
  }
LABEL_10:
  dispatch_group_enter(v3);
  id v7 = [(CLIndoorTilePrefetcher *)self availableFloorForegroundSessionQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100390E04;
  v15[3] = &unk_1004527B8;
  id v16 = v3;
  [v7 resetWithCompletionHandler:v15];

LABEL_11:
  if (!self->_backgroundSessionQueue) {
    goto LABEL_16;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempting to reset background session", buf, 2u);
  }
LABEL_15:
  dispatch_group_enter(v3);
  id v9 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100390EB4;
  v13[3] = &unk_1004527B8;
  v14 = v3;
  [v9 resetWithCompletionHandler:v13];

LABEL_16:
  if (qword_10047BEF8 == -1)
  {
    uint64_t v10 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  uint64_t v10 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_18:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Waiting for sessions to be reset", buf, 2u);
  }
LABEL_19:
  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v3, v11))
  {
    sub_1003A7D00();

    abort_report_np();
    __break(1u);
LABEL_27:
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v12 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (qword_10047BEF8 != -1) {
    goto LABEL_27;
  }
  uint64_t v12 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_22:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sessions reset", buf, 2u);
  }
LABEL_23:
}

- (void)invalidate
{
  if (qword_10047BEF8 == -1)
  {
    dispatch_group_t v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  dispatch_group_t v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Prefetcher invalidating all sessions and tasks", buf, 2u);
  }
LABEL_4:
  id v4 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v4);
  id v5 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];

  if (v5)
  {
    sub_1003A7E4C();

    uint64_t v11 = 282;
    uint64_t v12 = "-[CLIndoorTilePrefetcher invalidate]";
    uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorTilePrefetcher.mm";
    abort_report_np();
    __break(1u);
  }
  else
  {
    if (self->_availableFloorForegroundSessionQueue
      || self->_unavailableFloorForegroundSessionQueue
      || self->_backgroundSessionQueue)
    {
      [(CLIndoorTilePrefetcher *)self invalidateSessions];
      [(CLIndoorTilePrefetcher *)self resetSessions];
    }
    if (qword_10047BEF8 == -1)
    {
      id v6 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  id v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cancelling all operations from the download queue", v14, 2u);
  }
LABEL_12:
  id v7 = [(CLIndoorTilePrefetcher *)self downloadQ];
  [v7 cancelAllOperations];

  v8 = [(CLIndoorTilePrefetcher *)self downloadQ];
  [v8 waitUntilAllOperationsAreFinished];

  [(CLIndoorTilePrefetcher *)self setDownloadQ:0];
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v9 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "All download queue operations cancelled", v13, 2u);
  }
LABEL_15:
}

+ (id)backgroundSessionConfigurationWithDiscretionary:(BOOL)a3 isDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.pipelined.TilePrefetch.v0"];
  [v6 setDiscretionary:v5];
  [v6 setNetworkServiceType:3];
  if (v4)
  {
    [v6 set_sessionSendsLaunchOnDemandEvents:1];
    [v6 set_requiresPowerPluggedIn:0];
  }
  [v6 setRequestCachePolicy:1];
  [v6 setURLCache:0];
  [v6 setAllowsCellularAccess:0];
  [v6 set_allowsExpensiveAccess:0];

  return v6;
}

- (CLQueuedNSURLSession)backgroundSessionQueue
{
  backgroundSessionQueue = self->_backgroundSessionQueue;
  if (!backgroundSessionQueue)
  {
    BOOL v4 = +[CLIndoorTilePrefetcher backgroundSessionConfigurationWithDiscretionary:[(CLIndoorTilePrefetcher *)self discretionaryBackground] isDaemon:[(CLIndoorTilePrefetcher *)self isDaemon]];
    BOOL v5 = [CLQueuedNSURLSession alloc];
    uint64_t v12 = sub_100163848();
    uint64_t v13 = v6;
    int v7 = sub_100058BC0((uint64_t)&v12, (unsigned int *)&v13 + 1);
    v8 = [(CLIndoorTilePrefetcher *)self downloadQ];
    id v9 = [(CLQueuedNSURLSession *)v5 initWithMaxTasks:v7 usingDelegate:self withSessionConfiguration:v4 andProxiedSessionDelegate:self andSessionDelegateQueue:v8];
    uint64_t v10 = self->_backgroundSessionQueue;
    self->_backgroundSessionQueue = v9;

    backgroundSessionQueue = self->_backgroundSessionQueue;
  }

  return backgroundSessionQueue;
}

+ (id)foregroundSessionConfigurationWithTimeout:(double)a3
{
  BOOL v4 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  [v4 setNetworkServiceType:0];
  [v4 set_allowsExpensiveAccess:1];
  [v4 setRequestCachePolicy:1];
  [v4 setURLCache:0];
  [v4 setTimeoutIntervalForResource:a3];

  return v4;
}

- (CLQueuedNSURLSession)unavailableFloorForegroundSessionQueue
{
  unavailableFloorForegroundSessionQueue = self->_unavailableFloorForegroundSessionQueue;
  if (!unavailableFloorForegroundSessionQueue)
  {
    sub_1001638D4((uint64_t)&v12);
    BOOL v4 = +[CLIndoorTilePrefetcher foregroundSessionConfigurationWithTimeout:sub_100367C70((uint64_t)&v12, &v14)];
    BOOL v5 = [CLQueuedNSURLSession alloc];
    uint64_t v12 = sub_100163848();
    uint64_t v13 = v6;
    int v7 = sub_100058BC0((uint64_t)&v12, (unsigned int *)&v13 + 1);
    v8 = [(CLIndoorTilePrefetcher *)self downloadQ];
    id v9 = [(CLQueuedNSURLSession *)v5 initWithMaxTasks:v7 usingDelegate:self withSessionConfiguration:v4 andProxiedSessionDelegate:self andSessionDelegateQueue:v8];
    uint64_t v10 = self->_unavailableFloorForegroundSessionQueue;
    self->_unavailableFloorForegroundSessionQueue = v9;

    unavailableFloorForegroundSessionQueue = self->_unavailableFloorForegroundSessionQueue;
  }

  return unavailableFloorForegroundSessionQueue;
}

- (CLQueuedNSURLSession)availableFloorForegroundSessionQueue
{
  availableFloorForegroundSessionQueue = self->_availableFloorForegroundSessionQueue;
  if (!availableFloorForegroundSessionQueue)
  {
    sub_1001638B8((uint64_t)&v12);
    BOOL v4 = +[CLIndoorTilePrefetcher foregroundSessionConfigurationWithTimeout:sub_100367C70((uint64_t)&v12, &v14)];
    BOOL v5 = [CLQueuedNSURLSession alloc];
    uint64_t v12 = sub_100163848();
    uint64_t v13 = v6;
    int v7 = sub_100058BC0((uint64_t)&v12, (unsigned int *)&v13 + 1);
    v8 = [(CLIndoorTilePrefetcher *)self downloadQ];
    id v9 = [(CLQueuedNSURLSession *)v5 initWithMaxTasks:v7 usingDelegate:self withSessionConfiguration:v4 andProxiedSessionDelegate:self andSessionDelegateQueue:v8];
    uint64_t v10 = self->_availableFloorForegroundSessionQueue;
    self->_availableFloorForegroundSessionQueue = v9;

    availableFloorForegroundSessionQueue = self->_availableFloorForegroundSessionQueue;
  }

  return availableFloorForegroundSessionQueue;
}

- (NSDate)now
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000965D0;
  uint64_t v13 = sub_100096564;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100391888;
  v6[3] = &unk_10046B6F0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = &v9;
  v6[4] = self;
  dispatch_group_t v3 = v7;
  [(CLIndoorTilePrefetcher *)self runFromNetworkCallback:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return (NSDate *)v4;
}

- (void)setNow:(id)a3
{
  v8 = self;
  id v7 = a3;
  std::promise<void>::promise(&v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100391A00;
  v5[3] = &unk_10046B710;
  v5[4] = &v8;
  void v5[5] = &v7;
  v5[6] = &v6;
  [(CLIndoorTilePrefetcher *)self runFromNetworkCallback:v5];
  std::promise<void>::get_future(&v6);
  std::future<void>::get(&v4);
  std::future<void>::~future(&v4);
  std::promise<void>::~promise(&v6);
}

+ (id)urlForFloor:(id)a3 withTileServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 length];
  if ((unint64_t)v7 >= 6) {
    unint64_t v8 = 6;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }
  id v9 = [objc_alloc((Class)NSMutableString) initWithCapacity:(char *)[v5 length] + 3 * (v8 >> 1) + 1];
  if (v8 >= 2)
  {
    uint64_t v10 = [v5 substringWithRange:0, 2];
    [v9 appendString:v10];

    if (v8 > 3)
    {
      [v9 appendString:@"/"];
      uint64_t v11 = [v5 substringWithRange:2, 2];
      [v9 appendString:v11];

      if (v8 >= 6)
      {
        [v9 appendString:@"/"];
        uint64_t v12 = [v5 substringWithRange:4, 2];
        [v9 appendString:v12];
      }
    }
  }
  [v9 appendString:@"/"];
  [v9 appendString:v5];
  [v9 appendString:@"/"];
  uint64_t v13 = +[NSURL URLWithString:v9 relativeToURL:v6];

  return v13;
}

+ (id)urlForAsset:(id)a3 forFloor:(id)a4 withTileServer:(id)a5
{
  id v7 = a3;
  unint64_t v8 = +[CLIndoorTilePrefetcher urlForFloor:a4 withTileServer:a5];
  id v9 = +[NSURL URLWithString:v7 relativeToURL:v8];

  return v9;
}

- (void)prefetch:(id)a3
{
  id v30 = a3;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  dispatch_group_t v3 = (id)qword_10047BF00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v30 count];
    id v5 = [(CLIndoorTilePrefetcher *)self tileServer];
    id v6 = [v5 absoluteString];
    *(_DWORD *)buf = 134349315;
    *(void *)uint64_t v40 = v4;
    *(_WORD *)&v40[8] = 2081;
    *(void *)double v41 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TileFetch, count, %{public}lu, server, %{private}s", buf, 0x16u);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  id v7 = (id)qword_10047BF00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = [v30 description];
    *(_DWORD *)buf = 138477827;
    *(void *)uint64_t v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request to prefetch: %{private}@", buf, 0xCu);
  }
  id v9 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
  uint64_t v10 = [v9 session];
  [v10 getTasksWithCompletionHandler:&stru_10046B760];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v30;
  id v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v15 = [v14 floorUuid];
        id v16 = [v14 venueUuid];
        id v17 = [v14 locationContext];
        id v18 = [v14 relevancy];
        unsigned int v19 = -[CLIndoorTilePrefetcher scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v15, v16, v17, v18, [v14 allowCellularDownload], 0, 0, 0);

        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046B930);
        }
        unsigned __int8 v20 = (id)qword_10047BF00;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v14 venueUuid];
          id v22 = [v21 UTF8String];
          id v23 = [v14 priority];
          dispatch_time_t v24 = [v14 relevancy];
          [v24 timeIntervalSinceNow];
          double v26 = v25;
          unsigned int v27 = [v14 allowCellularDownload];
          *(_DWORD *)buf = 136381699;
          *(void *)uint64_t v40 = v22;
          *(_WORD *)&v40[8] = 1026;
          *(_DWORD *)double v41 = v19;
          *(_WORD *)&v41[4] = 2050;
          *(void *)&v41[6] = v23;
          *(_WORD *)uint64_t v42 = 2050;
          *(double *)&v42[2] = v26 / 3600.0;
          __int16 v43 = 1026;
          unsigned int v44 = v27;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "@TileFetch, reqcheck, %{private}s, %{public}d, priority, %{public}ld, relevancy, %{public}.1f, cell, %{public}d", buf, 0x2Cu);
        }
        if (v19 == 2)
        {
          LODWORD(v32) = v32 + 1;
        }
        else if (v19 == 1)
        {
          ++HIDWORD(v31);
        }
        else if (v19)
        {
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B930);
          }
          ++HIDWORD(v32);
          v28 = qword_10047BF00;
          if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            *(_DWORD *)uint64_t v40 = v19;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "@TileFetch, unxpected, scheduled, %{public}d, #Warning", buf, 8u);
          }
        }
        else
        {
          LODWORD(v31) = v31 + 1;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
  }

  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v29 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  id v29 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_34:
    *(_DWORD *)buf = 67241216;
    *(_DWORD *)uint64_t v40 = v31;
    *(_WORD *)&v40[4] = 1026;
    *(_DWORD *)&v40[6] = HIDWORD(v31);
    *(_WORD *)double v41 = 1026;
    *(_DWORD *)&v41[2] = v32;
    *(_WORD *)&v41[6] = 1026;
    *(_DWORD *)&v41[8] = 0;
    *(_WORD *)&v41[12] = 1026;
    *(_DWORD *)uint64_t v42 = HIDWORD(v32);
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "@TileFetch, scheduled, prefetch, mtnsu, %{public}d, %{public}d, %{public}d, %{public}d, %{public}d", buf, 0x20u);
  }
LABEL_35:
}

- (void)cancelDownloadTasksMatching:(id)a3 onSession:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100392654;
  v6[3] = &unk_10046B7B0;
  id v7 = a3;
  id v5 = v7;
  [a4 getTasksWithCompletionHandler:v6];
}

- (void)cancelAllInflightForegroundDownloadTasks
{
}

- (void)scheduleDownloadForRequest:(id)a3 withResumeData:(id)a4 withSession:(int)a5 andExpectedByteSize:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v10;
  id v31 = v11;
  id v30 = +[IndoorRequestInfo indoorRequestInfoFromRequest:v10];
  unsigned int v13 = [v30 session];
  id v29 = [v30 venueUuid];
  *((unsigned char *)&v32.__r_.__value_.__s + 23) = 0;
  v32.__r_.__value_.__s.__data_[0] = 0;
  if (v13)
  {
    if ([v30 session] == 1) {
      id v14 = "with available floor";
    }
    else {
      id v14 = "with unavailable floor";
    }
    std::string::assign(&v32, v14);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  id v15 = (id)qword_10047BF00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = a5;
    v28 = v10;
    if (v13) {
      id v17 = "foreground";
    }
    else {
      id v17 = "background";
    }
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v18 = &v32;
    }
    else {
      id v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    if ([v30 context]) {
      CFStringRef v19 = @"Regional";
    }
    else {
      CFStringRef v19 = @"Indoor";
    }
    unsigned __int8 v20 = [v28 URL];
    id v21 = [v20 description];
    *(_DWORD *)buf = 136447235;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v34 = 2082;
    long long v35 = v18;
    __int16 v36 = 2113;
    long long v37 = v29;
    __int16 v38 = 2113;
    CFStringRef v39 = v19;
    __int16 v40 = 2113;
    double v41 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Scheduling %{public}s download %{public}s of '%{private}@' (%{private}@): %{private}@", buf, 0x34u);

    uint64_t v12 = v28;
    a5 = v16;
  }
  if (!v13)
  {
    double v25 = [(CLIndoorTilePrefetcher *)self backgroundSessionQueue];
    double v26 = [[CLQueuedNSURLRequest alloc] initWithRequest:v12 withPriority:1];
    [v25 resumeRequestIfAllowedOrEnqueue:v26];
    goto LABEL_33;
  }
  id v22 = self;
  id v23 = v22;
  if (a5 == 2)
  {
    uint64_t v24 = [(CLIndoorTilePrefetcher *)v22 unavailableFloorForegroundSessionQueue];
  }
  else
  {
    if (a5 == 1) {
      [(CLIndoorTilePrefetcher *)v22 availableFloorForegroundSessionQueue];
    }
    else {
    uint64_t v24 = [(CLIndoorTilePrefetcher *)v22 backgroundSessionQueue];
    }
  }
  double v25 = (void *)v24;

  if (!v25)
  {
    sub_1003A7F70();

    abort_report_np();
    __break(1u);
    goto LABEL_37;
  }
  if (!v31) {
    goto LABEL_32;
  }
  if (qword_10047BEF8 != -1)
  {
LABEL_37:
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    unsigned int v27 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  unsigned int v27 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_31:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Using resume data", buf, 2u);
  }
LABEL_32:
  double v26 = [[CLQueuedNSURLRequest alloc] initWithRequest:v12 withPriority:0 andResumeData:v31 andCountOfBytesClientExpectsToReceive:a6];
  [v25 resumeRequestIfAllowedOrEnqueue:v26];
LABEL_33:

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
}

- (BOOL)scheduleDownloadForTile:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  id v16 = a3;
  id v44 = a4;
  id v17 = a6;
  id v42 = a9;
  id v43 = a10;
  id v18 = [(CLIndoorTilePrefetcher *)self delegate];
  LOBYTE(v40) = a7;
  id v19 = [[IndoorRequestInfo alloc] initFloor:v16 inVenue:v44 withContext:a5 requestFor:1 withinSession:v10 lastRelevant:v17 allowCellularDownloadTile:v40 requestUUID:v43];
  if (v16)
  {
    [v16 ps_STLString];
  }
  else
  {
    long long __p = 0uLL;
    uint64_t v50 = 0;
  }
  unsigned __int8 v20 = [v18 tilePrefetchShouldPrefetchTileDataForFloor:&__p];
  BOOL v21 = v20;
  if (SHIBYTE(v50) < 0)
  {
    operator delete((void *)__p);
    if (v21) {
      goto LABEL_6;
    }
LABEL_8:
    if (qword_10047BEF8 == -1)
    {
      double v25 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      double v25 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        if (v10)
        {
          [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:v19];
          goto LABEL_33;
        }
        id v41 = v19;
        double v26 = (const char *)[v16 UTF8String];
        size_t v27 = strlen(v26);
        if (v27 > 0x7FFFFFFFFFFFFFF7) {
          sub_1000A6968();
        }
        size_t v28 = v27;
        if (v27 >= 0x17)
        {
          uint64_t v30 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v27 | 7) != 0x17) {
            uint64_t v30 = v27 | 7;
          }
          uint64_t v31 = v30 + 1;
          p_dst = (long long *)operator new(v30 + 1);
          *((void *)&__dst + 1) = v28;
          unint64_t v48 = v31 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
        }
        else
        {
          HIBYTE(v48) = v27;
          p_dst = &__dst;
          if (!v27)
          {
LABEL_21:
            *((unsigned char *)p_dst + v28) = 0;
            std::string v32 = (const char *)[v44 UTF8String];
            size_t v33 = strlen(v32);
            if (v33 > 0x7FFFFFFFFFFFFFF7) {
              sub_1000A6968();
            }
            size_t v34 = v33;
            if (v33 >= 0x17)
            {
              uint64_t v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v33 | 7) != 0x17) {
                uint64_t v36 = v33 | 7;
              }
              uint64_t v37 = v36 + 1;
              long long v35 = (__n128 *)operator new(v36 + 1);
              v45.n128_u64[1] = v34;
              unint64_t v46 = v37 | 0x8000000000000000;
              v45.n128_u64[0] = (unint64_t)v35;
              id v19 = v41;
            }
            else
            {
              HIBYTE(v46) = v33;
              long long v35 = &v45;
              id v19 = v41;
              if (!v33)
              {
LABEL_29:
                v35->n128_u8[v34] = 0;
                *(void *)&double v38 = sub_100091630((uint64_t)&__p, &__dst, &v45, +[CLLocationContextConversions fromCLPipelinedLocationContext:a5]).n128_u64[0];
                if (SHIBYTE(v46) < 0)
                {
                  operator delete((void *)v45.n128_u64[0]);
                  if ((SHIBYTE(v48) & 0x80000000) == 0) {
                    goto LABEL_31;
                  }
                }
                else if ((SHIBYTE(v48) & 0x80000000) == 0)
                {
                  goto LABEL_31;
                }
                operator delete((void *)__dst);
LABEL_31:
                [v18 tilePrefetchForTileId:&__p updateRelevancy:v17, v38];
                [(CLIndoorTilePrefetcher *)self notifyDelegateIfPrefetchComplete];
                if (v52 < 0)
                {
                  operator delete(v51);
                  if ((SHIBYTE(v50) & 0x80000000) == 0) {
                    goto LABEL_33;
                  }
                }
                else if ((SHIBYTE(v50) & 0x80000000) == 0)
                {
                  goto LABEL_33;
                }
                operator delete((void *)__p);
                goto LABEL_33;
              }
            }
            memmove(v35, v32, v34);
            goto LABEL_29;
          }
        }
        memmove(p_dst, v26, v28);
        goto LABEL_21;
      }
    }
    LODWORD(__p) = 138477827;
    *(void *)((char *)&__p + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Prefetch of tile data for %{private}@ is unnecessary.  Not scheduling", (uint8_t *)&__p, 0xCu);
    goto LABEL_11;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  id v22 = [(CLIndoorTilePrefetcher *)self tileServer];
  id v23 = +[CLIndoorTilePrefetcher urlForAsset:@"tilep.xz" forFloor:v16 withTileServer:v22];

  uint64_t v24 = +[CLIndoorTilePrefetcher createNewRequest:v10 forURL:v23 lastRelevant:v17];
  [v19 setOnRequest:v24];
  [(CLIndoorTilePrefetcher *)self scheduleDownloadForRequest:v24 withResumeData:v42 withSession:v10 andExpectedByteSize:0x200000];

LABEL_33:
  return v21;
}

- (void)runFromNetworkCallback:(id)a3
{
  id v5 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1000965D0;
  v18[4] = sub_100096564;
  sel_getName(a2);
  id v19 = (id)os_transaction_create();
  id v6 = [(CLIndoorTilePrefetcher *)self downloadQ];
  uint64_t v7 = (uint64_t)[v6 maxConcurrentOperationCount];

  if (v7 < 2)
  {
    id v11 = [(CLIndoorTilePrefetcher *)self downloadQ];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100393914;
    v12[3] = &unk_10046B7F8;
    id v13 = v5;
    id v14 = v18;
    [v11 addOperationWithBlock:v12];
  }
  else
  {
    unint64_t v8 = [(CLIndoorTilePrefetcher *)self downloadQ];
    id v9 = [v8 underlyingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003938B4;
    block[3] = &unk_10046B7F8;
    id v16 = v5;
    id v17 = v18;
    dispatch_barrier_async(v9, block);
  }
  _Block_object_dispose(v18, 8);
}

- (void)notifyDelegateForegroundFetchComplete
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1000965D0;
  v8[4] = sub_100096564;
  sel_getName(a2);
  id v9 = (id)os_transaction_create();
  dispatch_group_t v3 = [(CLIndoorTilePrefetcher *)self delegateQ];
  if (!v3)
  {
    if (qword_10047BEF8 == -1)
    {
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100393B2C;
  v5[3] = &unk_10046B820;
  objc_copyWeak(&v6, location);
  v5[4] = v8;
  dispatch_async(v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v8, 8);
}

- (void)onQueueNotifyDelegateForegroundFetchComplete
{
  id v2 = [(CLIndoorTilePrefetcher *)self delegate];
  [v2 tileForegroundFetchFinishedAllDownloads];
}

- (void)notifyDelegateIfPrefetchComplete
{
  id v4 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v4);

  objc_initWeak(&location, self);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000965D0;
  v7[4] = sub_100096564;
  sel_getName(a2);
  id v8 = (id)os_transaction_create();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100393D6C;
  v5[3] = &unk_10046B820;
  objc_copyWeak(&v6, &location);
  v5[4] = v7;
  [(CLIndoorTilePrefetcher *)self runFromNetworkCallback:v5];
  objc_destroyWeak(&v6);
  _Block_object_dispose(v7, 8);

  objc_destroyWeak(&location);
}

- (void)notifyDelegateForegroundTaskCompleted:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v9);

  Name = sel_getName(a2);
  sub_100092088((uint64_t)v12, Name);
  id v11 = [(CLIndoorTilePrefetcher *)self delegate];
  [v11 prefetcher:self didFinishForegroundRequest:v7 withError:v8];

  sub_100091F70((uint64_t)v12);
}

- (void)sessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000965D0;
  v21[4] = sub_100096564;
  sel_getName(a2);
  id v22 = (id)os_transaction_create();
  uint64_t v12 = [(CLIndoorTilePrefetcher *)self delegateQ];
  if (!v12)
  {
    v11[2](v11, 0);
    if (qword_10047BEF8 == -1)
    {
      id v13 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v13 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10039441C;
  block[3] = &unk_10046B8B0;
  objc_copyWeak(&v19, location);
  id v15 = v9;
  id v16 = v10;
  id v17 = v11;
  id v18 = v21;
  dispatch_async(v12, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v21, 8);
}

- (void)onQueueSessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v43 = a3;
  id v45 = a4;
  id v44 = a5;
  id v9 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v9);

  id v11 = +[IndoorRequestInfo indoorRequestInfoFromTask:v45];
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  uint64_t v12 = (id)qword_10047BF00;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v11 description];
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Download of %{private}@ starting", buf, 0xCu);
  }
  id v14 = [v11 venueUuid];
  id v15 = v14;
  if (v14)
  {
    [v14 ps_STLString];
  }
  else
  {
    long long v55 = 0uLL;
    uint64_t v56 = 0;
  }

  id v16 = [v11 floorUuid];
  id v17 = v16;
  if (v16)
  {
    [v16 ps_STLString];
  }
  else
  {
    v53[0] = 0;
    v53[1] = 0;
    uint64_t v54 = 0;
  }

  id v18 = [(CLIndoorTilePrefetcher *)self delegate];
  if ((sub_10039629C(v11, self->_now) & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      BOOL v21 = (id)qword_10047BF00;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:
        id v22 = v18;
        if (v56 >= 0) {
          id v23 = &v55;
        }
        else {
          id v23 = (long long *)v55;
        }
        uint64_t v24 = [v11 lastRelevant];
        [v24 timeIntervalSinceNow];
        *(_DWORD *)buf = 136380931;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&unsigned char buf[12] = 2050;
        *(double *)&buf[14] = v25 / 3600.0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "TileFetch, reqcb, %{private}s, tooold, %{public}.1f", buf, 0x16u);

        id v18 = v22;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      BOOL v21 = (id)qword_10047BF00;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
    }

    int v5 = 1;
    goto LABEL_28;
  }
  unsigned int v19 = [v11 kind];
  if (v19 != 1)
  {
    if (!v19)
    {
      sub_100085B24(buf, (uint64_t)v53);
      int v5 = [[self shouldPrefetchFloorMetadataForFloorUuid:buf forSession:[v11 session] withLocationContext:[v11 context]]? 0: 2];
      unsigned __int8 v20 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
          if (qword_10047BEF8 != -1) {
            goto LABEL_53;
          }
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    if (qword_10047BEF8 != -1) {
      goto LABEL_53;
    }
    goto LABEL_29;
  }
  if ([v18 tilePrefetchShouldPrefetchTileDataForFloor:v53]) {
    int v5 = 0;
  }
  else {
    int v5 = 2;
  }
  if (qword_10047BEF8 != -1)
  {
LABEL_53:
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    double v26 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
LABEL_29:
  double v26 = qword_10047BF00;
  if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_33;
  }
LABEL_30:
  size_t v27 = &v55;
  if (v56 < 0) {
    size_t v27 = (long long *)v55;
  }
  *(_DWORD *)buf = 136380931;
  *(void *)&uint8_t buf[4] = v27;
  *(_WORD *)&unsigned char buf[12] = 1026;
  *(_DWORD *)&buf[14] = v5;
  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "TileFetch, reqcb, %{private}s, drop, %{public}d", buf, 0x12u);
LABEL_33:
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      if (v5) {
        goto LABEL_69;
      }
      if (qword_10047BEF8 == -1)
      {
        size_t v28 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
LABEL_39:

          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100394F28;
          v50[3] = &unk_1004525B0;
          id v52 = v44;
          id v51 = v43;
          [(CLIndoorTilePrefetcher *)self runFromNetworkCallback:v50];

          goto LABEL_69;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046B930);
        size_t v28 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_39;
        }
      }
      id v29 = [v11 description];
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Continuing download of %{private}@.  Determined to be necessary", buf, 0xCu);

      goto LABEL_39;
    }
    if (qword_10047BEF8 == -1)
    {
      std::string v32 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
LABEL_48:

        [v45 cancel];
        (*((void (**)(id, void))v44 + 2))(v44, 0);
        goto LABEL_69;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      std::string v32 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        goto LABEL_48;
      }
    }
    size_t v33 = [v11 description];
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Cancelling download of %{private}@ as it's too old", buf, 0xCu);

    goto LABEL_48;
  }
  if (qword_10047BEF8 == -1)
  {
    uint64_t v30 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B930);
  uint64_t v30 = (id)qword_10047BF00;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
LABEL_42:
    uint64_t v31 = [v11 description];
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Cancelling download of %{private}@ as it's in the DB", buf, 0xCu);
  }
LABEL_43:

  if (SHIBYTE(v54) < 0)
  {
    sub_1000559FC(__dst, v53[0], (unint64_t)v53[1]);
  }
  else
  {
    *(_OWORD *)long long __dst = *(_OWORD *)v53;
    uint64_t v49 = v54;
  }
  if (SHIBYTE(v56) < 0)
  {
    sub_1000559FC(__p, (void *)v55, *((unint64_t *)&v55 + 1));
  }
  else
  {
    *(_OWORD *)long long __p = v55;
    uint64_t v47 = v56;
  }
  *(void *)&double v34 = sub_100091630((uint64_t)buf, (long long *)__dst, (__n128 *)__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", [v11 context])).n128_u64[0];
  if (SHIBYTE(v47) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v49) & 0x80000000) == 0) {
      goto LABEL_61;
    }
  }
  else if ((SHIBYTE(v49) & 0x80000000) == 0)
  {
    goto LABEL_61;
  }
  operator delete(__dst[0]);
LABEL_61:
  long long v35 = [v11 lastRelevant:v34];
  [v18 tilePrefetchForTileId:buf updateRelevancy:v35];

  [v45 cancel];
  if ([v11 kind])
  {
    if ([v11 session]) {
      [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:v11];
    }
  }
  else
  {
    uint64_t v36 = [v11 floorUuid];
    id v42 = [v11 venueUuid];
    id v37 = [v11 context];
    double v38 = [v11 lastRelevant];
    id v39 = [v11 allowCellularDownloadTile];
    id v40 = [v11 session];
    id v41 = [v11 requestUUID];
    [(CLIndoorTilePrefetcher *)self scheduleDownloadForTile:v36 inVenue:v42 withContext:v37 lastRelevant:v38 allowCellularDownload:v39 onSession:v40 withResumeData:0 withRequestUUID:v41];
  }
  (*((void (**)(id, void))v44 + 2))(v44, 0);
  if (v60 < 0)
  {
    operator delete(v59);
    if ((v58 & 0x80000000) == 0) {
      goto LABEL_69;
    }
  }
  else if ((v58 & 0x80000000) == 0)
  {
    goto LABEL_69;
  }
  operator delete(*(void **)buf);
LABEL_69:

  if (SHIBYTE(v54) < 0)
  {
    operator delete(v53[0]);
    if ((SHIBYTE(v56) & 0x80000000) == 0) {
      goto LABEL_71;
    }
LABEL_73:
    operator delete((void *)v55);
    goto LABEL_71;
  }
  if (SHIBYTE(v56) < 0) {
    goto LABEL_73;
  }
LABEL_71:
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
}

- (void)session:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6
{
  var0 = a6.var0;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1000965D0;
  v28[4] = sub_100096564;
  sel_getName(a2);
  id v29 = (id)os_transaction_create();
  id v14 = [(CLIndoorTilePrefetcher *)self delegateQ];
  if (!v14)
  {
    if (qword_10047BEF8 == -1)
    {
      unsigned int v19 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      unsigned int v19 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_11;
  }
  objc_initWeak(location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100395208;
  block[3] = &unk_10046B8D8;
  objc_copyWeak(v25, location);
  id v21 = v11;
  id v22 = v12;
  id v15 = v13;
  id v17 = *(void **)var0;
  id v16 = (std::__shared_weak_count *)*((void *)var0 + 1);
  id v23 = v15;
  v25[1] = v17;
  double v26 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v24 = v28;
  dispatch_async(v14, block);
  id v18 = v26;
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak(location);
LABEL_11:

  _Block_object_dispose(v28, 8);
}

- (void)onQueueSession:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6
{
  id v32 = a3;
  id v36 = a4;
  id v34 = a5;
  id v9 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v9);

  id v11 = +[IndoorRequestInfo indoorRequestInfoFromTask:v36];
  context = v10;
  size_t v33 = [v36 response];
  id v12 = v34;
  id v13 = (const char *)[v12 UTF8String];
  size_t v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  id v15 = (void *)v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    id v16 = (void **)operator new(v17 + 1);
    __dst[1] = v15;
    int64_t v38 = v18 | 0x8000000000000000;
    __dst[0] = v16;
    goto LABEL_8;
  }
  HIBYTE(v38) = v14;
  id v16 = __dst;
  if (v14) {
LABEL_8:
  }
    memmove(v16, v13, (size_t)v15);
  *((unsigned char *)v15 + (void)v16) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  unsigned int v19 = (id)qword_10047BF00;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [v11 description];
    id v21 = (void *)v20;
    id v22 = __dst;
    if (v38 < 0) {
      id v22 = (void **)__dst[0];
    }
    *(_DWORD *)buf = 138478083;
    uint64_t v40 = v20;
    __int16 v41 = 2081;
    id v42 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "download complete: %{private}@. tmpfile = %{private}s", buf, 0x16u);
  }
  [WeakRetained tilePrefetchDidDownload:__dst forRequest:v11];
  unsigned int v23 = [v11 kind];
  if (v23)
  {
    if (v23 == 1)
    {
      if ([v11 session]) {
        [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:v11];
      }
      else {
        [(CLIndoorTilePrefetcher *)self notifyDelegateIfPrefetchComplete];
      }
    }
  }
  else
  {
    uint64_t v24 = [v11 floorUuid];
    double v25 = [v11 venueUuid];
    id v26 = [v11 context];
    size_t v27 = [v11 lastRelevant];
    id v28 = [v11 allowCellularDownloadTile];
    id v29 = [v11 session];
    uint64_t v30 = [v11 requestUUID];
    [(CLIndoorTilePrefetcher *)self scheduleDownloadForTile:v24 inVenue:v25 withContext:v26 lastRelevant:v27 allowCellularDownload:v28 onSession:v29 withResumeData:0 withRequestUUID:v30];
  }
  if (SHIBYTE(v38) < 0) {
    operator delete(__dst[0]);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v42 = a3;
  id v8 = a4;
  id v40 = a5;
  id v43 = v8;
  __int16 v41 = +[IndoorRequestInfo indoorRequestInfoFromTask:v8];
  if (sub_10039629C(v41, self->_now))
  {
    id v9 = [v8 response];
    if ((uint64_t)[v9 statusCode] >= 200 && (uint64_t)objc_msgSend(v9, "statusCode") < 400)
    {
      uint64_t v47 = operator new(0x20uLL);
      long long v48 = xmmword_1003E7220;
      strcpy((char *)v47, "urlSessionDidFinishDownloading");
      sub_1000B25EC(0, (uint64_t)__p);
      sub_1003734B0((uint64_t)__p, (const void **)&v47, (uint64_t)buf);
      if (v52 < 0) {
        operator delete(__p[0]);
      }
      id v26 = operator new(0x38uLL);
      v26[1] = 0;
      v26[2] = 0;
      *id v26 = off_10046B960;
      sub_1003737A8((unsigned char *)v26 + 24, (long long *)buf);
      uint64_t v49 = (char *)(v26 + 3);
      uint64_t v50 = (std::__shared_weak_count *)v26;
      sub_100373950((uint64_t)buf);
      if (SHIBYTE(v48) < 0) {
        operator delete(v47);
      }
      size_t v27 = (char *)(v26 + 3);
      if (*((char *)v26 + 47) < 0) {
        size_t v27 = (char *)v26[3];
      }
      id v28 = +[NSString stringWithUTF8String:v27];
      id v29 = [v40 lastPathComponent];
      uint64_t v30 = +[NSString stringWithFormat:@"%@/%@", v28, v29];

      uint64_t v31 = +[NSFileManager defaultManager];
      id v32 = v40;
      size_t v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v32 fileSystemRepresentation]);
      id v46 = 0;
      [v31 moveItemAtPath:v33 toPath:v30 error:&v46];
      id v34 = v46;

      if (v34)
      {
        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046B930);
        }
        long long v35 = (id)qword_10047BF00;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = [v34 description];
          id v37 = [v32 fileSystemRepresentation];
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = v36;
          __int16 v55 = 2082;
          id v56 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error moving URLSession temp file to our own temporary path. %{public}@, %{public}s", buf, 0x16u);
        }
      }
      else
      {
        id v44 = (char *)(v26 + 3);
        id v45 = (std::__shared_weak_count *)v26;
        atomic_fetch_add_explicit(v26 + 1, 1uLL, memory_order_relaxed);
        [(CLIndoorTilePrefetcher *)self session:v42 didFinishDownloadTask:v43 toPath:v30 inTempPath:&v44];
        id v39 = v45;
        if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }

      int64_t v38 = v50;
      if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    else
    {
      if (qword_10047BEF8 != -1) {
        dispatch_once(&qword_10047BEF8, &stru_10046B930);
      }
      id v10 = (id)qword_10047BF00;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v41 description];
        *(_DWORD *)buf = 138478083;
        uint64_t v54 = v11;
        __int16 v55 = 2050;
        id v56 = [v9 statusCode];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Download of %{private}@ failed with response code %{public}ld. Synthesizing error", buf, 0x16u);
      }
      id v12 = [v9 statusCode];
      v57[0] = @"response";
      id v13 = v9;
      size_t v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = +[NSNull null];
      }
      uint64_t v18 = v15;

      v58[0] = v18;
      v57[1] = NSURLErrorKey;
      unsigned int v19 = [v8 currentRequest];
      id v20 = [v19 URL];
      id v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = +[NSNull null];
      }
      unsigned int v23 = v22;

      v58[1] = v23;
      uint64_t v24 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
      double v25 = +[NSError errorWithDomain:@"indoor tile prefetch" code:v12 userInfo:v24];

      [(CLIndoorTilePrefetcher *)self URLSession:v42 task:v43 didCompleteWithError:v25];
      id v9 = v14;
    }
  }
  else
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
    }
    id v16 = (id)qword_10047BF00;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [v41 description];
      *(_DWORD *)buf = 138477827;
      uint64_t v54 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Downloaded %{private}@ too irrelevant to accept into db", buf, 0xCu);
    }
    id v9 = +[NSError errorWithDomain:@"foobar" code:-1 userInfo:&__NSDictionary0__struct];
    [(CLIndoorTilePrefetcher *)self URLSession:v42 task:v43 didCompleteWithError:v9];
  }
}

- (void)sessionDidCompleteTask:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1000965D0;
  void v17[4] = sub_100096564;
  sel_getName(a2);
  id v18 = (id)os_transaction_create();
  id v9 = [(CLIndoorTilePrefetcher *)self delegateQ];
  if (!v9)
  {
    if (qword_10047BEF8 == -1)
    {
      id v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
      id v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003967B8;
  v11[3] = &unk_10046B910;
  objc_copyWeak(&v15, location);
  id v12 = v7;
  id v13 = v8;
  size_t v14 = v17;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v17, 8);
}

- (void)onQueueSessionDidCompleteTask:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_V2(v9);

  id v10 = [v7 response];
  id v11 = [v10 statusCode];

  if (v8 || v11 != (id)200)
  {
    sub_100092088((uint64_t)buf, "prefetch didCompleteWithError:");
    id v13 = +[IndoorRequestInfo indoorRequestInfoFromTask:v7];
    if (v8)
    {
      id v4 = [v8 description];
      size_t v14 = (const char *)[v4 UTF8String];
      size_t v15 = strlen(v14);
      if (v15 < 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_8;
      }
    }
    else
    {
      size_t v14 = "no error object";
      size_t v15 = strlen("no error object");
      if (v15 < 0x7FFFFFFFFFFFFFF8)
      {
LABEL_8:
        std::string::size_type v16 = v15;
        if (v15 >= 0x17)
        {
          uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v15 | 7) != 0x17) {
            uint64_t v18 = v15 | 7;
          }
          uint64_t v19 = v18 + 1;
          p_dst = (std::string *)operator new(v18 + 1);
          __dst.__r_.__value_.__l.__size_ = v16;
          __dst.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
        }
        else
        {
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v15;
          p_dst = &__dst;
          if (!v15)
          {
            __dst.__r_.__value_.__s.__data_[0] = 0;
            if (!v8)
            {
LABEL_17:
              std::to_string(&v43, (uint64_t)v11);
              id v20 = std::string::insert(&v43, 0, ". status = ");
              long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
              v44.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v21;
              v20->__r_.__value_.__l.__size_ = 0;
              v20->__r_.__value_.__r.__words[2] = 0;
              v20->__r_.__value_.__r.__words[0] = 0;
              id v22 = std::string::append(&v44, ": ");
              long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
              v49.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v23;
              v22->__r_.__value_.__l.__size_ = 0;
              v22->__r_.__value_.__r.__words[2] = 0;
              v22->__r_.__value_.__r.__words[0] = 0;
              id v24 = +[NSHTTPURLResponse localizedStringForStatusCode:v11];
              double v25 = std::string::append(&v49, (const std::string::value_type *)[v24 UTF8String]);
              long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
              int64_t v46 = v25->__r_.__value_.__r.__words[2];
              *(_OWORD *)long long __p = v26;
              v25->__r_.__value_.__l.__size_ = 0;
              v25->__r_.__value_.__r.__words[2] = 0;
              v25->__r_.__value_.__r.__words[0] = 0;
              if (v46 >= 0) {
                size_t v27 = __p;
              }
              else {
                size_t v27 = (void **)__p[0];
              }
              if (v46 >= 0) {
                std::string::size_type v28 = HIBYTE(v46);
              }
              else {
                std::string::size_type v28 = (std::string::size_type)__p[1];
              }
              std::string::append(&__dst, (const std::string::value_type *)v27, v28);
              if (SHIBYTE(v46) < 0) {
                operator delete(__p[0]);
              }

              if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v49.__r_.__value_.__l.__data_);
                if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_27:
                  if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_28;
                  }
LABEL_34:
                  operator delete(v43.__r_.__value_.__l.__data_);
LABEL_28:
                  unsigned int v29 = [v13 session];
                  uint64_t v30 = [v13 floorUuid];
                  uint64_t v31 = v30;
                  if (v30)
                  {
                    [v30 ps_STLString];
                  }
                  else
                  {
                    __p[0] = 0;
                    __p[1] = 0;
                    int64_t v46 = 0;
                  }

                  if ([v8 code] == (id)-999)
                  {
                    if (qword_10047BEF8 != -1) {
                      dispatch_once(&qword_10047BEF8, &stru_10046B930);
                    }
                    id v32 = (id)qword_10047BF00;
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v33 = [v13 description];
                      id v34 = (void *)v33;
                      long long v35 = &__dst;
                      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                        long long v35 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                      }
                      LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                      *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v33;
                      WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                      *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v35;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Download of %{private}@ was cancelled: %{private}s", (uint8_t *)&v49, 0x16u);
                    }
                  }
                  else if ([v8 code] == (id)-1001)
                  {
                    if (qword_10047BEF8 == -1)
                    {
                      id v32 = (id)qword_10047BF00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
                        goto LABEL_54;
                      }
                    }
                    else
                    {
                      dispatch_once(&qword_10047BEF8, &stru_10046B930);
                      id v32 = (id)qword_10047BF00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
                        goto LABEL_54;
                      }
                    }
                    uint64_t v36 = [v13 description];
                    id v37 = (void *)v36;
                    int64_t v38 = &__dst;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      int64_t v38 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                    }
                    LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                    *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v36;
                    WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                    *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v38;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Download of %{private}@ timed out: %{private}s", (uint8_t *)&v49, 0x16u);
                  }
                  else
                  {
                    if (qword_10047BEF8 == -1)
                    {
                      id v32 = (id)qword_10047BF00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_54;
                      }
                    }
                    else
                    {
                      dispatch_once(&qword_10047BEF8, &stru_10046B930);
                      id v32 = (id)qword_10047BF00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_54;
                      }
                    }
                    uint64_t v39 = [v13 description];
                    id v40 = (void *)v39;
                    __int16 v41 = &__dst;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      __int16 v41 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                    }
                    LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                    *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v39;
                    WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                    *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v41;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Download of %{private}@ failed: %{private}s", (uint8_t *)&v49, 0x16u);
                  }
LABEL_54:

                  if (v29) {
                    [(CLIndoorTilePrefetcher *)self notifyDelegateForegroundTaskCompleted:v13 withError:v8];
                  }
                  else {
                    [(CLIndoorTilePrefetcher *)self notifyDelegateIfPrefetchComplete];
                  }
                  if (SHIBYTE(v46) < 0)
                  {
                    operator delete(__p[0]);
                    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                      goto LABEL_59;
                    }
                  }
                  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
LABEL_59:

                    sub_100091F70((uint64_t)buf);
                    goto LABEL_60;
                  }
                  operator delete(__dst.__r_.__value_.__l.__data_);
                  goto LABEL_59;
                }
              }
              else if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_27;
              }
              operator delete(v44.__r_.__value_.__l.__data_);
              if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                goto LABEL_28;
              }
              goto LABEL_34;
            }
LABEL_16:

            goto LABEL_17;
          }
        }
        memmove(p_dst, v14, v16);
        p_dst->__r_.__value_.__s.__data_[v16] = 0;
        if (!v8) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    sub_1000A6968();
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v12 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_60;
    }
    goto LABEL_5;
  }
  id v12 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "NSURLSessionDelegate didCompleteWithError: invoked on a successfully completed task", buf, 2u);
  }
LABEL_60:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  id v8 = (id)qword_10047BF00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 description];
    id v10 = [v7 description];
    int v14 = 138543619;
    size_t v15 = v9;
    __int16 v16 = 2113;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Session %{public}@ invalidated with error: %{private}@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v11 = [(CLIndoorTilePrefetcher *)self delegateQ];
  dispatch_assert_queue_not_V2((dispatch_queue_t)v11);

  id v12 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    id v13 = [(CLIndoorTilePrefetcher *)self sessionInvalidationGroup];
    dispatch_group_leave(v13);
  }
}

- (void)session:(id)a3 didResumeRequest:(id)a4 withRemainingRequests:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    id v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    int v10 = 138478083;
    id v11 = v8;
    __int16 v12 = 2050;
    unint64_t v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Resuming request: %{private}@ with %{public}lu remaining", (uint8_t *)&v10, 0x16u);
  }
LABEL_4:
}

- (NSURL)tileServer
{
  return self->_tileServer;
}

- (void)setTileServer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setBackgroundSessionQueue:(id)a3
{
}

- (void)setAvailableFloorForegroundSessionQueue:(id)a3
{
}

- (void)setUnavailableFloorForegroundSessionQueue:(id)a3
{
}

- (void)setDownloadQ:(id)a3
{
}

- (void)setDelegateQ:(id)a3
{
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (BOOL)discretionaryBackground
{
  return self->_discretionaryBackground;
}

- (void)setDiscretionaryBackground:(BOOL)a3
{
  self->_discretionaryBackground = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (OS_dispatch_group)sessionInvalidationGroup
{
  return self->_sessionInvalidationGroup;
}

- (void)setSessionInvalidationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInvalidationGroup, 0);
  objc_destroyWeak((id *)&self->_delegateQ);
  objc_storeStrong((id *)&self->_downloadQ, 0);
  objc_storeStrong((id *)&self->_unavailableFloorForegroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_availableFloorForegroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileServer, 0);

  objc_storeStrong((id *)&self->_now, 0);
}

@end