@interface MSDDownloadRequestManager
- (BOOL)_coalesceDownloadRequestForFileWithSameHash:(id)a3;
- (MSDContentServer)server;
- (MSDDownloadRequestManager)initWithCellularAccess:(BOOL)a3 andFDCUpdateDelegate:(id)a4;
- (MSDFDCUpdateDelegate)fdcDelegate;
- (NSMutableDictionary)downloadRequestCompletions;
- (OS_dispatch_queue)updateQueue;
- (os_unfair_lock_s)downloadRequestsLock;
- (unint64_t)signpostId;
- (void)_dispatchRequest:(id)a3;
- (void)_finishDownloadRequest:(id)a3 withReponse:(id)a4;
- (void)_handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4;
- (void)_updateFDCforRequest:(id)a3;
- (void)downloadFileForRequest:(id)a3;
- (void)setDownloadRequestCompletions:(id)a3;
- (void)setDownloadRequestsLock:(os_unfair_lock_s)a3;
- (void)setFdcDelegate:(id)a3;
- (void)setServer:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setUpdateQueue:(id)a3;
@end

@implementation MSDDownloadRequestManager

- (MSDDownloadRequestManager)initWithCellularAccess:(BOOL)a3 andFDCUpdateDelegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSDDownloadRequestManager;
  v7 = [(MSDDownloadRequestManager *)&v16 init];
  v8 = v7;
  if (v7)
  {
    [(MSDDownloadRequestManager *)v7 setDownloadRequestsLock:0];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.downloadManagerUpdateQueue", 0);
    [(MSDDownloadRequestManager *)v8 setUpdateQueue:v9];

    [(MSDDownloadRequestManager *)v8 setFdcDelegate:v6];
    v10 = sub_1000687C8();
    [(MSDDownloadRequestManager *)v8 setSignpostId:os_signpost_id_generate(v10)];

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDDownloadRequestManager *)v8 setDownloadRequestCompletions:v11];

    v12 = [[MSDContentServer alloc] initWithCellularAccess:v4];
    [(MSDDownloadRequestManager *)v8 setServer:v12];

    v13 = [(MSDDownloadRequestManager *)v8 server];
    [v13 setObserver:v8];

    v14 = v8;
  }

  return v8;
}

- (void)downloadFileForRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MSDDownloadFileResponse);
  if ([v4 isValid])
  {
    id v6 = +[NSFileManager defaultManager];
    v7 = [v4 savePath];
    unsigned int v8 = [v6 fileExistsAtPath:v7];

    if (!v8)
    {
      if (![(MSDDownloadRequestManager *)self _coalesceDownloadRequestForFileWithSameHash:v4])
      {
        [(MSDDownloadRequestManager *)self _dispatchRequest:v4];
        goto LABEL_13;
      }
      uint64_t v12 = sub_100068600();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Coalesce current download file request with existing one.", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_11;
    }
    dispatch_queue_t v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 savePath];
      int v15 = 138543362;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "File already exists at save path: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    [(MSDServerResponse *)v5 setError:0];
  }
  else
  {
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D1474(v4, v13);
    }

    v14 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    [(MSDServerResponse *)v5 setError:v14];
  }
  id v11 = [v4 completion];

  if (v11)
  {
    uint64_t v12 = [v4 completion];
    (*(void (**)(uint64_t, MSDDownloadFileResponse *))(v12 + 16))(v12, v5);
LABEL_11:
  }
LABEL_13:
}

- (void)_dispatchRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 savePath];
  id v6 = [v5 stringByAppendingPathExtension:@"IN_PROGRESS"];
  [v4 setSavePath:v6];

  v7 = [v4 downloadCredentials];
  unsigned int v8 = [v4 originServer];
  unsigned __int8 v9 = [v7 isValidForOriginServer:v8];

  if (v9)
  {
    v10 = [(MSDDownloadRequestManager *)self server];
    [v10 downloadFile:v4];
  }
  else
  {
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D150C(v4, v11);
    }

    uint64_t v12 = [(MSDDownloadRequestManager *)self updateQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100065444;
    v13[3] = &unk_1001520B0;
    v13[4] = self;
    id v14 = v4;
    dispatch_async(v12, v13);
  }
}

- (BOOL)_coalesceDownloadRequestForFileWithSameHash:(id)a3
{
  id v4 = a3;
  v5 = [v4 savePath];
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  v7 = [(MSDDownloadRequestManager *)self downloadRequestCompletions];
  unsigned int v8 = [v7 objectForKey:v5];

  [v4 completion];
  if (v8) {
    unsigned __int8 v9 = {;
  }

    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];

    id v11 = v8;
  }
  else {
    uint64_t v12 = {;
  }

    id v13 = objc_retainBlock(v12);
    id v11 = +[NSMutableArray arrayWithObject:v13];

    unsigned __int8 v9 = [(MSDDownloadRequestManager *)self downloadRequestCompletions];
    [v9 setObject:v11 forKey:v5];
  }

  os_unfair_lock_unlock(p_downloadRequestsLock);
  return v8 != 0;
}

- (void)_handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4
{
  id v6 = a4;
  v7 = [a3 savePath];
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  unsigned __int8 v9 = [(MSDDownloadRequestManager *)self downloadRequestCompletions];
  id v10 = [v9 objectForKey:v7];

  if (v10)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        int v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v15) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v15));
          int v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    [v11 removeAllObjects];
  }
  id v16 = [(MSDDownloadRequestManager *)self downloadRequestCompletions];
  [v16 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_downloadRequestsLock);
}

- (void)_updateFDCforRequest:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc_init(MSDDownloadFileResponse);
  v5 = [v18 downloadCredentials];
  id v6 = [v18 originServer];
  unsigned int v7 = [v5 isValidForOriginServer:v6];

  if (v7)
  {
    unsigned int v8 = [(MSDDownloadRequestManager *)self server];
    [v8 downloadFile:v18];
  }
  else
  {
    unsigned __int8 v9 = [(MSDDownloadRequestManager *)self fdcDelegate];

    if (v9)
    {
      id v10 = [v18 downloadCredentials];
      id v11 = [v10 manifestInfo];

      id v12 = [(MSDDownloadRequestManager *)self fdcDelegate];
      id v13 = [v12 updateFileDownloadCredentialFromManifestInfo:v11];

      uint64_t v14 = [v13 error];

      if (v14)
      {
        int v15 = [v13 error];
        [(MSDServerResponse *)v4 setError:v15];

        [(MSDDownloadRequestManager *)self _finishDownloadRequest:v18 withReponse:v4];
      }
      else
      {
        long long v17 = [(MSDDownloadRequestManager *)self server];
        [v17 downloadFile:v18];
      }
    }
    else
    {
      id v16 = +[NSError errorDomainMSDWithCode:3727744513 message:@"Download Credential Expired"];
      [(MSDServerResponse *)v4 setError:v16];

      [(MSDDownloadRequestManager *)self _finishDownloadRequest:v18 withReponse:v4];
    }
  }
}

- (void)_finishDownloadRequest:(id)a3 withReponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(MSDDownloadRequestManager *)self updateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065CC4;
  block[3] = &unk_100151AF0;
  id v9 = v7;
  id v36 = v9;
  dispatch_async(v8, block);

  id v10 = [v6 savePath];
  id v11 = [v10 pathExtension];

  id v12 = [v6 savePath];
  id v13 = [v12 stringByDeletingPathExtension];

  if (v11 && [v11 isEqualToString:@"IN_PROGRESS"])
  {
    uint64_t v14 = [v9 error];

    if (!v14)
    {
      id v15 = [v6 savePath];
      id v16 = (const std::__fs::filesystem::path *)[v15 UTF8String];
      id v17 = v13;
      id v18 = (const std::__fs::filesystem::path *)[v17 UTF8String];
      rename(v16, v18, v19);
      LODWORD(v16) = v20;

      if (v16)
      {
        v21 = __error();
        v22 = +[NSString stringWithUTF8String:strerror(*v21)];
        v23 = sub_100068600();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1000D15D0((uint64_t)v17, (uint64_t)v22, v23);
        }

        v24 = +[NSError errorDomainMSDWithCode:3727740944 message:v22];
        [v9 setError:v24];
      }
    }
    [v6 setSavePath:v13];
  }
  v25 = [v9 error];

  if (!v25) {
    goto LABEL_15;
  }
  if ((uint64_t)[v6 retryCount] < 1)
  {
    v28 = sub_100068600();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v6 savePath];
      v30 = [v9 error];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v29;
      __int16 v38 = 2114;
      v39 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Download Failed for file: %{public}@ with error: %{public}@", location, 0x16u);
    }
LABEL_15:
    [(MSDDownloadRequestManager *)self _handleCompletionForDownloadRequest:v6 withResponse:v9];
    goto LABEL_16;
  }
  objc_initWeak((id *)location, self);
  dispatch_time_t v26 = dispatch_time(0, 3000000000);
  v27 = dispatch_get_global_queue(25, 0);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100065DC4;
  v31[3] = &unk_100152F48;
  id v32 = v6;
  objc_copyWeak(&v34, (id *)location);
  v33 = self;
  dispatch_after(v26, v27, v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)location);
LABEL_16:
}

- (MSDFDCUpdateDelegate)fdcDelegate
{
  return self->_fdcDelegate;
}

- (void)setFdcDelegate:(id)a3
{
}

- (os_unfair_lock_s)downloadRequestsLock
{
  return self->_downloadRequestsLock;
}

- (void)setDownloadRequestsLock:(os_unfair_lock_s)a3
{
  self->_downloadRequestsLock = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (MSDContentServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSMutableDictionary)downloadRequestCompletions
{
  return self->_downloadRequestCompletions;
}

- (void)setDownloadRequestCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRequestCompletions, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_fdcDelegate, 0);
}

@end