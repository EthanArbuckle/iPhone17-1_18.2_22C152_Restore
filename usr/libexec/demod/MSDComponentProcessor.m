@interface MSDComponentProcessor
- (MSDComponentProcessor)initWithQoS:(int64_t)a3;
- (MSDOperationQueue)defaultQueue;
- (MSDOperationQueue)downloadQueue;
- (MSDOperationQueue)installQueue;
- (MSDOperationQueue)parallelInstallQueue;
- (MSDOperationQueue)prepareQueue;
- (MSDOperationQueue)uninstallQueue;
- (id)_queueForOperation:(id)a3;
- (void)_dispatchOperationForExecution:(id)a3;
- (void)cancel;
- (void)process:(id)a3;
- (void)resume;
- (void)setDefaultQueue:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setInstallQueue:(id)a3;
- (void)setParallelInstallQueue:(id)a3;
- (void)setPrepareQueue:(id)a3;
- (void)setUninstallQueue:(id)a3;
- (void)suspend;
@end

@implementation MSDComponentProcessor

- (MSDComponentProcessor)initWithQoS:(int64_t)a3
{
  v39.receiver = self;
  v39.super_class = (Class)MSDComponentProcessor;
  v4 = [(MSDComponentProcessor *)&v39 init];
  if (v4)
  {
    if (os_variant_has_internal_content()
      && (+[MSDTestPreferences sharedInstance],
          v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = (uint64_t)[v5 concurrentDownloadOperation],
          v5,
          v6 >= 1))
    {
      v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v41 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent download operation: %ld", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = 2;
    }
    v8 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setDefaultQueue:v8];

    v9 = [(MSDComponentProcessor *)v4 defaultQueue];
    [v9 setMaxConcurrentOperationCount:1];

    v10 = [(MSDComponentProcessor *)v4 defaultQueue];
    [v10 setQualityOfService:a3];

    v11 = [(MSDComponentProcessor *)v4 defaultQueue];
    [v11 setSuspended:1];

    v12 = [(MSDComponentProcessor *)v4 defaultQueue];
    [v12 setName:@"com.apple.msd.default_queue"];

    v13 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setPrepareQueue:v13];

    v14 = [(MSDComponentProcessor *)v4 prepareQueue];
    [v14 setMaxConcurrentOperationCount:1];

    v15 = [(MSDComponentProcessor *)v4 prepareQueue];
    [v15 setQualityOfService:a3];

    v16 = [(MSDComponentProcessor *)v4 prepareQueue];
    [v16 setSuspended:1];

    v17 = [(MSDComponentProcessor *)v4 prepareQueue];
    [v17 setName:@"com.apple.msd.prepare_queue"];

    v18 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setDownloadQueue:v18];

    v19 = [(MSDComponentProcessor *)v4 downloadQueue];
    [v19 setMaxConcurrentOperationCount:v6];

    v20 = [(MSDComponentProcessor *)v4 downloadQueue];
    [v20 setQualityOfService:a3];

    v21 = [(MSDComponentProcessor *)v4 downloadQueue];
    [v21 setSuspended:1];

    v22 = [(MSDComponentProcessor *)v4 downloadQueue];
    [v22 setName:@"com.apple.msd.download_queue"];

    v23 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setInstallQueue:v23];

    v24 = [(MSDComponentProcessor *)v4 installQueue];
    [v24 setMaxConcurrentOperationCount:1];

    v25 = [(MSDComponentProcessor *)v4 installQueue];
    [v25 setQualityOfService:a3];

    v26 = [(MSDComponentProcessor *)v4 installQueue];
    [v26 setSuspended:1];

    v27 = [(MSDComponentProcessor *)v4 installQueue];
    [v27 setName:@"com.apple.msd.install_queue"];

    v28 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setParallelInstallQueue:v28];

    v29 = [(MSDComponentProcessor *)v4 parallelInstallQueue];
    [v29 setMaxConcurrentOperationCount:5];

    v30 = [(MSDComponentProcessor *)v4 parallelInstallQueue];
    [v30 setQualityOfService:a3];

    v31 = [(MSDComponentProcessor *)v4 parallelInstallQueue];
    [v31 setSuspended:1];

    v32 = [(MSDComponentProcessor *)v4 parallelInstallQueue];
    [v32 setName:@"com.apple.msd.parallel_install_queue"];

    v33 = objc_alloc_init(MSDOperationQueue);
    [(MSDComponentProcessor *)v4 setUninstallQueue:v33];

    v34 = [(MSDComponentProcessor *)v4 uninstallQueue];
    [v34 setMaxConcurrentOperationCount:1];

    v35 = [(MSDComponentProcessor *)v4 uninstallQueue];
    [v35 setQualityOfService:a3];

    v36 = [(MSDComponentProcessor *)v4 uninstallQueue];
    [v36 setSuspended:1];

    v37 = [(MSDComponentProcessor *)v4 uninstallQueue];
    [v37 setName:@"com.apple.msd.uninstall_queue"];
  }
  return v4;
}

- (void)process:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  [v4 activateStagedOperations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MSDComponentProcessor _dispatchOperationForExecution:](v5, "_dispatchOperationForExecution:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)resume
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MSDComponentProcessor *)obj defaultQueue];
  [v2 setSuspended:0];

  v3 = [(MSDComponentProcessor *)obj prepareQueue];
  [v3 setSuspended:0];

  id v4 = [(MSDComponentProcessor *)obj downloadQueue];
  [v4 setSuspended:0];

  v5 = [(MSDComponentProcessor *)obj installQueue];
  [v5 setSuspended:0];

  id v6 = [(MSDComponentProcessor *)obj parallelInstallQueue];
  [v6 setSuspended:0];

  id v7 = [(MSDComponentProcessor *)obj uninstallQueue];
  [v7 setSuspended:0];

  objc_sync_exit(obj);
}

- (void)suspend
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MSDComponentProcessor *)obj defaultQueue];
  [v2 setSuspended:1];

  v3 = [(MSDComponentProcessor *)obj prepareQueue];
  [v3 setSuspended:1];

  id v4 = [(MSDComponentProcessor *)obj downloadQueue];
  [v4 setSuspended:1];

  v5 = [(MSDComponentProcessor *)obj installQueue];
  [v5 setSuspended:1];

  id v6 = [(MSDComponentProcessor *)obj parallelInstallQueue];
  [v6 setSuspended:1];

  id v7 = [(MSDComponentProcessor *)obj uninstallQueue];
  [v7 setSuspended:1];

  objc_sync_exit(obj);
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MSDComponentProcessor *)obj defaultQueue];
  [v2 cancelAllOperations];

  v3 = [(MSDComponentProcessor *)obj prepareQueue];
  [v3 cancelAllOperations];

  id v4 = [(MSDComponentProcessor *)obj downloadQueue];
  [v4 cancelAllOperations];

  v5 = [(MSDComponentProcessor *)obj installQueue];
  [v5 cancelAllOperations];

  id v6 = [(MSDComponentProcessor *)obj parallelInstallQueue];
  [v6 cancelAllOperations];

  id v7 = [(MSDComponentProcessor *)obj uninstallQueue];
  [v7 cancelAllOperations];

  objc_sync_exit(obj);
}

- (void)_dispatchOperationForExecution:(id)a3
{
  id v4 = a3;
  v5 = [(MSDComponentProcessor *)self _queueForOperation:v4];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000D44C4((uint64_t)v4, v5, v6);
  }

  [v5 addOperation:v4];
}

- (id)_queueForOperation:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 type])
  {
    case 1uLL:
      uint64_t v5 = [(MSDComponentProcessor *)self prepareQueue];
      break;
    case 2uLL:
      uint64_t v5 = [(MSDComponentProcessor *)self downloadQueue];
      break;
    case 3uLL:
      if ([v4 runInstallInParallel]) {
        [(MSDComponentProcessor *)self parallelInstallQueue];
      }
      else {
      uint64_t v5 = [(MSDComponentProcessor *)self installQueue];
      }
      break;
    case 4uLL:
      uint64_t v5 = [(MSDComponentProcessor *)self uninstallQueue];
      break;
    default:
      uint64_t v5 = [(MSDComponentProcessor *)self defaultQueue];
      break;
  }
  id v6 = (void *)v5;

  return v6;
}

- (MSDOperationQueue)defaultQueue
{
  return self->_defaultQueue;
}

- (void)setDefaultQueue:(id)a3
{
}

- (MSDOperationQueue)prepareQueue
{
  return self->_prepareQueue;
}

- (void)setPrepareQueue:(id)a3
{
}

- (MSDOperationQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (MSDOperationQueue)installQueue
{
  return self->_installQueue;
}

- (void)setInstallQueue:(id)a3
{
}

- (MSDOperationQueue)parallelInstallQueue
{
  return self->_parallelInstallQueue;
}

- (void)setParallelInstallQueue:(id)a3
{
}

- (MSDOperationQueue)uninstallQueue
{
  return self->_uninstallQueue;
}

- (void)setUninstallQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstallQueue, 0);
  objc_storeStrong((id *)&self->_parallelInstallQueue, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);

  objc_storeStrong((id *)&self->_defaultQueue, 0);
}

@end