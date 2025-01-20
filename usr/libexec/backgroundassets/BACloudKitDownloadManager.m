@interface BACloudKitDownloadManager
- (BACloudKitDownload)download;
- (BACloudKitDownloadManager)initWithDownload:(id)a3 withDelegate:(id)a4;
- (BACloudKitDownloadManagerDelegate)delegate;
- (BOOL)_consumeAvailableDownloadSize;
- (BOOL)assetFound;
- (BOOL)recordFound;
- (BOOL)startDownloadWithError:(id *)a3;
- (CKOperationConfiguration)operationConfiguration;
- (CKQueryOperation)currentOperation;
- (NSLock)stateLock;
- (NSMutableDictionary)recordErrors;
- (NSURL)assetURL;
- (OS_dispatch_queue)responseQueue;
- (id)_newOperationQuery;
- (unint64_t)assetSize;
- (void)_downloadActualAsset;
- (void)_downloadFailedWithError:(id)a3;
- (void)_downloadSucceededWithURL:(id)a3;
- (void)cancelDownload;
- (void)pauseDownload;
- (void)setAssetFound:(BOOL)a3;
- (void)setAssetSize:(unint64_t)a3;
- (void)setAssetURL:(id)a3;
- (void)setCurrentOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownload:(id)a3;
- (void)setOperationConfiguration:(id)a3;
- (void)setRecordErrors:(id)a3;
- (void)setRecordFound:(BOOL)a3;
- (void)setResponseQueue:(id)a3;
- (void)setStateLock:(id)a3;
@end

@implementation BACloudKitDownloadManager

- (BACloudKitDownloadManager)initWithDownload:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BACloudKitDownloadManager;
  v8 = [(BACloudKitDownloadManager *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(BACloudKitDownloadManager *)v8 setDelegate:v7];
    [(BACloudKitDownloadManager *)v9 setDownload:v6];
    v10 = +[NSMutableDictionary dictionary];
    [(BACloudKitDownloadManager *)v9 setRecordErrors:v10];

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.BACloudKitDownloadManager.ResponseQueue", 0);
    [(BACloudKitDownloadManager *)v9 setResponseQueue:v11];

    id v12 = objc_alloc_init((Class)NSLock);
    [(BACloudKitDownloadManager *)v9 setStateLock:v12];
  }
  return v9;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  v4 = [(BACloudKitDownloadManager *)self stateLock];
  [v4 lock];

  v5 = [(BACloudKitDownloadManager *)self recordErrors];
  [v5 removeAllObjects];

  [(BACloudKitDownloadManager *)self setRecordFound:0];
  [(BACloudKitDownloadManager *)self setAssetFound:0];
  [(BACloudKitDownloadManager *)self setAssetURL:0];
  [(BACloudKitDownloadManager *)self setAssetSize:0];
  id v6 = objc_alloc((Class)CKContainer);
  id v7 = [(BACloudKitDownloadManager *)self download];
  v8 = [v7 containerID];
  id v9 = [v6 initWithContainerID:v8];

  id v10 = objc_alloc_init((Class)CKOperationConfiguration);
  [v10 setContainer:v9];
  dispatch_queue_t v11 = [(BACloudKitDownloadManager *)self download];
  os_unfair_lock_lock((os_unfair_lock_t)[v11 downloadLock]);

  id v12 = [(BACloudKitDownloadManager *)self download];
  unsigned int v13 = [v12 isForegroundDownload];

  objc_super v14 = [(BACloudKitDownloadManager *)self download];
  os_unfair_lock_unlock((os_unfair_lock_t)[v14 downloadLock]);

  if (v13)
  {
    [v10 setTimeoutIntervalForRequest:60.0];
    [v10 setAllowsCellularAccess:1];
    [v10 setAllowsExpensiveNetworkAccess:1];
    uint64_t v15 = 0;
    uint64_t v16 = 17;
  }
  else
  {
    [v10 setAllowsCellularAccess:0];
    [v10 setAllowsExpensiveNetworkAccess:0];
    [v10 setAutomaticallyRetryNetworkFailures:1];
    uint64_t v16 = 9;
    uint64_t v15 = 2;
  }
  [v10 setDiscretionaryNetworkBehavior:v15];
  [v10 setQualityOfService:v16];
  v17 = [(BACloudKitDownloadManager *)self download];
  v18 = [v17 masqueradeIdentifier];
  [v10 setApplicationBundleIdentifierOverrideForContainerAccess:v18];

  [(BACloudKitDownloadManager *)self setOperationConfiguration:v10];
  id v19 = [(BACloudKitDownloadManager *)self _newOperationQuery];
  [v19 setShouldFetchAssetContent:0];
  v20 = [v19 database];
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002B11C;
  v30[3] = &unk_10005D6F8;
  objc_copyWeak(&v33, &location);
  id v21 = v20;
  id v31 = v21;
  v32 = self;
  [v19 setQueryCompletionBlock:v30];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10002B474;
  v27 = &unk_10005D720;
  v28 = self;
  objc_copyWeak(&v29, &location);
  [v19 setRecordMatchedBlock:&v24];
  -[BACloudKitDownloadManager setCurrentOperation:](self, "setCurrentOperation:", v19, v24, v25, v26, v27, v28);
  [v21 addOperation:v19];
  v22 = [(BACloudKitDownloadManager *)self stateLock];
  [v22 unlock];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return 1;
}

- (void)pauseDownload
{
  v3 = [(BACloudKitDownloadManager *)self stateLock];
  [v3 lock];

  [(BACloudKitDownloadManager *)self cancelDownload];
  v4 = [(BACloudKitDownloadManager *)self stateLock];
  [v4 unlock];

  v5 = [(BACloudKitDownloadManager *)self responseQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B688;
  block[3] = &unk_10005C998;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)cancelDownload
{
  id v2 = [(BACloudKitDownloadManager *)self currentOperation];
  [v2 cancel];
}

- (void)_downloadFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = [(BACloudKitDownloadManager *)self responseQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B7C0;
  v7[3] = &unk_10005CA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_downloadSucceededWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(BACloudKitDownloadManager *)self responseQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B924;
  v7[3] = &unk_10005CA10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (BOOL)_consumeAvailableDownloadSize
{
  v3 = [(BACloudKitDownloadManager *)self stateLock];
  [v3 lock];

  id v4 = [(BACloudKitDownloadManager *)self download];
  v5 = [v4 applicationInfo];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [(BACloudKitDownloadManager *)self download];
  id v7 = [v6 applicationInfo];
  id v8 = [(BACloudKitDownloadManager *)self download];
  id v9 = [v7 remainingDownloadAllowanceWithNecessity:[v8 necessity]];

  if (!v9) {
    goto LABEL_4;
  }
  id v10 = [(BACloudKitDownloadManager *)self download];
  dispatch_queue_t v11 = [v10 applicationInfo];
  unint64_t v12 = [(BACloudKitDownloadManager *)self assetSize];
  unsigned int v13 = [(BACloudKitDownloadManager *)self download];
  LOBYTE(v12) = [v11 consumeAllowanceShouldStopWithAdditionalBytes:v12 downloadNecessity:[v13 necessity] isManifest:0];

  if (v12) {
LABEL_4:
  }
    char v14 = 0;
  else {
LABEL_5:
  }
    char v14 = 1;
  uint64_t v15 = [(BACloudKitDownloadManager *)self stateLock];
  [v15 unlock];

  return v14 & 1;
}

- (void)_downloadActualAsset
{
  v3 = [(BACloudKitDownloadManager *)self stateLock];
  [v3 lock];

  [(BACloudKitDownloadManager *)self setRecordFound:0];
  [(BACloudKitDownloadManager *)self setAssetFound:0];
  id v4 = [(BACloudKitDownloadManager *)self recordErrors];
  [v4 removeAllObjects];

  id v5 = [(BACloudKitDownloadManager *)self _newOperationQuery];
  [v5 setShouldFetchAssetContent:1];
  id v6 = [v5 database];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002BD64;
  v15[3] = &unk_10005D6F8;
  objc_copyWeak(&v18, &location);
  id v7 = v6;
  id v16 = v7;
  v17 = self;
  [v5 setQueryCompletionBlock:v15];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  dispatch_queue_t v11 = sub_10002C0FC;
  unint64_t v12 = &unk_10005D720;
  unsigned int v13 = self;
  objc_copyWeak(&v14, &location);
  [v5 setRecordMatchedBlock:&v9];
  -[BACloudKitDownloadManager setCurrentOperation:](self, "setCurrentOperation:", v5, v9, v10, v11, v12, v13);
  [v7 addOperation:v5];
  id v8 = [(BACloudKitDownloadManager *)self stateLock];
  [v8 unlock];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)_newOperationQuery
{
  id v3 = objc_alloc((Class)CKQueryOperation);
  id v4 = [(BACloudKitDownloadManager *)self download];
  id v5 = [v4 query];
  id v6 = [v3 initWithQuery:v5];

  id v7 = [(BACloudKitDownloadManager *)self download];
  id v8 = [v7 zoneID];
  [v6 setZoneID:v8];

  id v9 = [(BACloudKitDownloadManager *)self operationConfiguration];
  [v6 setConfiguration:v9];

  uint64_t v10 = [(BACloudKitDownloadManager *)self download];
  id v11 = [v10 databaseScope];

  if (v11 == (id)2)
  {
    unint64_t v12 = [(BACloudKitDownloadManager *)self operationConfiguration];
    unsigned int v13 = [v12 container];
    uint64_t v14 = [v13 privateCloudDatabase];
  }
  else
  {
    uint64_t v15 = [(BACloudKitDownloadManager *)self download];
    id v16 = [v15 databaseScope];

    unint64_t v12 = [(BACloudKitDownloadManager *)self operationConfiguration];
    v17 = [v12 container];
    unsigned int v13 = v17;
    if (v16 == (id)3) {
      [v17 sharedCloudDatabase];
    }
    else {
    uint64_t v14 = [v17 publicCloudDatabase];
    }
  }
  id v18 = (void *)v14;

  [v6 setDatabase:v18];
  id v19 = [(BACloudKitDownloadManager *)self download];
  v20 = [v19 assetKey];
  v23 = v20;
  id v21 = +[NSArray arrayWithObjects:&v23 count:1];
  [v6 setDesiredKeys:v21];

  [v6 setResultsLimit:1];
  return v6;
}

- (BACloudKitDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BACloudKitDownloadManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BACloudKitDownload)download
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_download);

  return (BACloudKitDownload *)WeakRetained;
}

- (void)setDownload:(id)a3
{
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
}

- (NSLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (void)setOperationConfiguration:(id)a3
{
}

- (CKQueryOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (BOOL)recordFound
{
  return self->_recordFound;
}

- (void)setRecordFound:(BOOL)a3
{
  self->_recordFound = a3;
}

- (BOOL)assetFound
{
  return self->_assetFound;
}

- (void)setAssetFound:(BOOL)a3
{
  self->_assetFound = a3;
}

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationConfiguration, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_destroyWeak((id *)&self->_download);

  objc_destroyWeak((id *)&self->_delegate);
}

@end