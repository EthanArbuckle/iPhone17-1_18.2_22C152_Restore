@interface CloudArtworkImporter
- (CGSize)_sizeForArtworkWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (CloudArtworkImporter)initWithConfiguration:(id)a3 sourceType:(int64_t)a4;
- (CloudArtworkOperationQueue)artworkDownloadOperationQueue;
- (ICConnectionConfiguration)configuration;
- (ICURLSession)artworkDownloadSession;
- (ML3MusicLibrary)musicLibrary;
- (MPMediaDownloadManager)downloadManager;
- (MSVWatchdog)artworkDownloadWatchdog;
- (NSMutableDictionary)artworkDownloadOperationMap;
- (NSOperationQueue)artworkColorAnalysisOperationQueue;
- (NSString)powerAssertionIdentifier;
- (OS_dispatch_queue)artworkColorAnalysisAccessQueue;
- (OS_dispatch_queue)artworkDownloadAccessQueue;
- (id)_artworkColorAnalysisOperationForArtworkAsset:(id)a3 library:(id)a4 artwork:(id)a5;
- (int64_t)sourceType;
- (void)_adjustOperationQueueStatusForMediaDownloads;
- (void)cancelAllImports;
- (void)cancelAllImportsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeImportArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4;
- (void)importArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4 token:(id)a5 mediaType:(unsigned int)a6 allowsCellularData:(BOOL)a7 clientIdentity:(id)a8 completionHandler:(id)a9;
- (void)importCloudArtworkForRequests:(id)a3;
- (void)increasePriorityForAllOperations;
- (void)setArtworkColorAnalysisAccessQueue:(id)a3;
- (void)setArtworkColorAnalysisOperationQueue:(id)a3;
- (void)setArtworkDownloadAccessQueue:(id)a3;
- (void)setArtworkDownloadOperationMap:(id)a3;
- (void)setArtworkDownloadOperationQueue:(id)a3;
- (void)setArtworkDownloadSession:(id)a3;
- (void)setArtworkDownloadWatchdog:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
@end

@implementation CloudArtworkImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisAccessQueue, 0);
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_artworkDownloadWatchdog, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkDownloadOperationMap, 0);
  objc_storeStrong((id *)&self->_artworkDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_artworkDownloadAccessQueue, 0);
  objc_storeStrong((id *)&self->_artworkDownloadSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_musicLibrary, 0);
}

- (void)setArtworkColorAnalysisAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)artworkColorAnalysisAccessQueue
{
  return self->_artworkColorAnalysisAccessQueue;
}

- (void)setArtworkColorAnalysisOperationQueue:(id)a3
{
}

- (NSOperationQueue)artworkColorAnalysisOperationQueue
{
  return self->_artworkColorAnalysisOperationQueue;
}

- (void)setDownloadManager:(id)a3
{
}

- (MPMediaDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setArtworkDownloadWatchdog:(id)a3
{
}

- (MSVWatchdog)artworkDownloadWatchdog
{
  return self->_artworkDownloadWatchdog;
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (void)setArtworkDownloadOperationMap:(id)a3
{
}

- (NSMutableDictionary)artworkDownloadOperationMap
{
  return self->_artworkDownloadOperationMap;
}

- (void)setArtworkDownloadOperationQueue:(id)a3
{
}

- (CloudArtworkOperationQueue)artworkDownloadOperationQueue
{
  return self->_artworkDownloadOperationQueue;
}

- (void)setArtworkDownloadAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)artworkDownloadAccessQueue
{
  return self->_artworkDownloadAccessQueue;
}

- (void)setArtworkDownloadSession:(id)a3
{
}

- (ICURLSession)artworkDownloadSession
{
  return self->_artworkDownloadSession;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (CGSize)_sizeForArtworkWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = +[ML3ArtworkConfiguration systemConfiguration];
  v7 = [v6 sizesToAutogenerateForMediaType:v5 artworkType:a4];

  uint64_t v12 = 0;
  v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -8388609;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F7228;
  v11[3] = &unk_1001BDDE8;
  v11[4] = &v12;
  [v7 enumerateObjectsUsingBlock:v11];
  double v8 = v13[6];
  _Block_object_dispose(&v12, 8);

  double v9 = v8;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_artworkColorAnalysisOperationForArtworkAsset:(id)a3 library:(id)a4 artwork:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ _artworkColorAnalysisOperationForArtworkAsset calling color analysis for artwork asset", buf, 0xCu);
  }

  id v12 = objc_alloc((Class)ICAsyncBlockOperation);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000F7420;
  v18[3] = &unk_1001BDF48;
  id v19 = v9;
  id v20 = v8;
  v21 = self;
  id v22 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  id v16 = [v12 initWithStartHandler:v18];

  return v16;
}

- (void)_adjustOperationQueueStatusForMediaDownloads
{
  v3 = [(CloudArtworkImporter *)self downloadManager];
  unsigned int v4 = [v3 hasActiveDownloads];

  uint64_t v5 = [(CloudArtworkImporter *)self artworkDownloadOperationQueue];
  id v6 = [v5 maxConcurrentOperationCount];

  if (((v4 ^ (v6 != (id)1)) & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "Unthrottling";
      if (v4) {
        id v8 = "Throttling";
      }
      int v12 = 138543618;
      id v13 = self;
      __int16 v14 = 2080;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s operations in coordination with media downloads", (uint8_t *)&v12, 0x16u);
    }

    id v9 = [(CloudArtworkImporter *)self artworkDownloadOperationQueue];
    id v10 = v9;
    if (v4) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 5;
    }
    [v9 setMaxConcurrentOperationCount:v11];
  }
}

- (void)cancelAllImports
{
}

- (void)cancelAllImportsAndWaitForOperationsToFinish:(BOOL)a3
{
  uint64_t v5 = [(CloudArtworkImporter *)self artworkDownloadOperationQueue];
  id v6 = [v5 progress];

  v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 totalUnitCount];
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2048;
    int64_t v17 = v8 - (unsigned char *)[v6 completedUnitCount];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %lld artwork download operations", buf, 0x16u);
  }

  id v9 = [(CloudArtworkImporter *)self artworkDownloadOperationQueue];
  [v9 setSuspended:0];

  id v10 = [(CloudArtworkImporter *)self artworkDownloadOperationQueue];
  [v10 cancelAllOperations];

  uint64_t v11 = [(CloudArtworkImporter *)self artworkDownloadAccessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F7EE0;
  v12[3] = &unk_1001BDD48;
  BOOL v13 = a3;
  v12[4] = self;
  dispatch_sync(v11, v12);
}

- (void)increasePriorityForAllOperations
{
  v3 = [(CloudArtworkImporter *)self artworkDownloadAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7FD8;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)decreasePriorityForAllOperations
{
  v3 = [(CloudArtworkImporter *)self artworkDownloadAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F80A4;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)deprioritizeImportArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4
{
  v7 = [(CloudArtworkImporter *)self artworkDownloadAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8184;
  block[3] = &unk_1001BDD20;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)importCloudArtworkForRequests:(id)a3
{
  id v5 = a3;
  id v6 = [(CloudArtworkImporter *)self artworkDownloadAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8428;
  block[3] = &unk_1001BDCF8;
  id v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)importArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4 token:(id)a5 mediaType:(unsigned int)a6 allowsCellularData:(BOOL)a7 clientIdentity:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  uint64_t v11 = *(void *)&a6;
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  id v19 = [[CloudArtworkImportRequest alloc] initWithClientIdentity:v17];

  [(CloudArtworkImportRequest *)v19 setCloudID:a3];
  [(CloudArtworkImportRequest *)v19 setToken:v18];

  [(CloudArtworkImportRequest *)v19 setMediaType:v11];
  [(CloudArtworkImportRequest *)v19 setArtworkType:a4];
  [(CloudArtworkImportRequest *)v19 setAllowsCellularData:v10];
  [(CloudArtworkImportRequest *)v19 setCompletionHandler:v16];

  v21 = v19;
  id v20 = +[NSArray arrayWithObjects:&v21 count:1];
  [(CloudArtworkImporter *)self importCloudArtworkForRequests:v20];
}

- (void)dealloc
{
  v3 = [(CloudArtworkImporter *)self downloadManager];
  [v3 unregisterObserver:self];

  unsigned int v4 = [(CloudArtworkImporter *)self artworkDownloadWatchdog];
  [v4 suspend];

  id v5 = [(CloudArtworkImporter *)self powerAssertionIdentifier];
  CPSetPowerAssertionWithIdentifier();

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)CloudArtworkImporter;
  [(CloudArtworkImporter *)&v7 dealloc];
}

- (CloudArtworkImporter)initWithConfiguration:(id)a3 sourceType:(int64_t)a4
{
  id v8 = a3;
  id v9 = [v8 userIdentity];

  if (!v9)
  {
    v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2, self, @"CloudArtworkImporter.m", 111, @"Invalid parameter not satisfying: %@", @"configuration.userIdentity != nil" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)CloudArtworkImporter;
  BOOL v10 = [(CloudArtworkImporter *)&v39 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_sourceType = a4;
    objc_storeStrong((id *)&v10->_configuration, a3);
    int v12 = [v8 userIdentity];
    uint64_t v13 = +[ML3MusicLibrary musicLibraryForUserAccount:v12];
    musicLibrary = v11->_musicLibrary;
    v11->_musicLibrary = (ML3MusicLibrary *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.itunescloudd.artworkimporter.artworkColorAnalysisAccessQueue", 0);
    [(CloudArtworkImporter *)v11 setArtworkColorAnalysisAccessQueue:v15];

    id v16 = objc_alloc_init((Class)NSOperationQueue);
    [(CloudArtworkImporter *)v11 setArtworkColorAnalysisOperationQueue:v16];

    id v17 = [(CloudArtworkImporter *)v11 artworkColorAnalysisOperationQueue];
    [v17 setMaxConcurrentOperationCount:5];

    id v18 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v18 setHTTPShouldUsePipelining:1];
    id v19 = [objc_alloc((Class)ICURLSession) initWithConfiguration:v18 maxConcurrentRequests:5 qualityOfService:-1];
    [(CloudArtworkImporter *)v11 setArtworkDownloadSession:v19];

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.itunescloudd.artworkimporter.artworkDownloadAccessQueue", 0);
    [(CloudArtworkImporter *)v11 setArtworkDownloadAccessQueue:v20];

    v21 = [[CloudArtworkOperationQueue alloc] initWithSourceType:[(CloudArtworkImporter *)v11 sourceType] configuration:v11->_configuration];
    [(CloudArtworkImporter *)v11 setArtworkDownloadOperationQueue:v21];

    id v22 = [(CloudArtworkImporter *)v11 artworkDownloadOperationQueue];
    [v22 setMaxConcurrentOperationCount:5];

    v23 = [(CloudArtworkImporter *)v11 artworkDownloadOperationQueue];
    [v23 setQualityOfService:-1];

    v24 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v25 = [v24 isWatch];

    if (v25)
    {
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2050000000;
      v26 = (void *)qword_1001F39D0;
      uint64_t v44 = qword_1001F39D0;
      if (!qword_1001F39D0)
      {
        location[0] = _NSConcreteStackBlock;
        location[1] = (id)3221225472;
        location[2] = sub_1000F98D4;
        location[3] = &unk_1001BE9E8;
        location[4] = &v41;
        sub_1000F98D4((uint64_t)location);
        v26 = (void *)v42[3];
      }
      id v27 = v26;
      _Block_object_dispose(&v41, 8);
      v28 = [v27 sharedManager];
      [(CloudArtworkImporter *)v11 setDownloadManager:v28];

      v29 = [(CloudArtworkImporter *)v11 downloadManager];
      [v29 registerObserver:v11];

      [(CloudArtworkImporter *)v11 _adjustOperationQueueStatusForMediaDownloads];
    }
    v30 = +[NSMutableDictionary dictionary];
    [(CloudArtworkImporter *)v11 setArtworkDownloadOperationMap:v30];

    v31 = +[NSString stringWithFormat:@"com.apple.itunescloudd.%@", objc_opt_class()];
    [(CloudArtworkImporter *)v11 setPowerAssertionIdentifier:v31];

    id v32 = objc_alloc_init((Class)MSVWatchdog);
    [(CloudArtworkImporter *)v11 setArtworkDownloadWatchdog:v32];

    v33 = [(CloudArtworkImporter *)v11 artworkDownloadWatchdog];
    [v33 setTimeoutInterval:3600.0];

    objc_initWeak(location, v11);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000F9AC0;
    v37[3] = &unk_1001BDCA8;
    objc_copyWeak(&v38, location);
    v34 = [(CloudArtworkImporter *)v11 artworkDownloadWatchdog];
    [v34 setTimeoutCallback:v37];

    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
  }
  return v11;
}

@end