@interface MSDSession
- (BOOL)getIsFileDownload;
- (BOOL)isDownloadPaused;
- (MSDSession)init;
- (MSDSession)initWithCellularAccess:(BOOL)a3;
- (MSDSessionTaskManager)taskManager;
- (NSURLSession)session;
- (OS_dispatch_queue)demuxQueue;
- (id)getServerErrorMessage:(id)a3 withDefault:(id)a4;
- (id)parseResponseHeader:(id)a3 statusCode:(int64_t)a4;
- (int64_t)requestTimeoutCount;
- (unint64_t)signpostId;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
- (void)dispatchSessionTask:(id)a3;
- (void)dispatchSessionTask:(id)a3 withError:(id *)a4;
- (void)handleDownloadAborted:(id)a3;
- (void)handleDownloadPaused:(id)a3;
- (void)invalidate;
- (void)launchTaskWithInfo:(id)a3;
- (void)logDownloadTaskLaunch:(id)a3;
- (void)retrySessionTask:(id)a3;
- (void)setDemuxQueue:(id)a3;
- (void)setIsDownloadPaused:(BOOL)a3;
- (void)setRequestTimeoutCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setTaskManager:(id)a3;
@end

@implementation MSDSession

- (MSDSession)init
{
  return [(MSDSession *)self initWithCellularAccess:1];
}

- (MSDSession)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MSDSession;
  v4 = [(MSDSession *)&v26 init];
  if (v4)
  {
    v5 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v5 setURLCache:0];
    [v5 setRequestCachePolicy:1];
    [v5 set_timingDataOptions:2];
    [v5 setAllowsCellularAccess:v3];
    v6 = +[NSURLSession sessionWithConfiguration:v5 delegate:v4 delegateQueue:0];
    [(MSDSession *)v4 setSession:v6];

    v7 = [(MSDSession *)v4 session];

    if (v7)
    {
      v8 = objc_alloc_init(MSDSessionTaskManager);
      [(MSDSession *)v4 setTaskManager:v8];

      dispatch_queue_t v9 = dispatch_queue_create("com.apple.msdconnection-demux", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
      [(MSDSession *)v4 setDemuxQueue:v9];

      [(MSDSession *)v4 setRequestTimeoutCount:0];
      [(MSDSession *)v4 setIsDownloadPaused:0];
      v10 = sub_1000687C8();
      [(MSDSession *)v4 setSignpostId:os_signpost_id_generate(v10)];

      objc_initWeak(&location, v4);
      if ([(MSDSession *)v4 getIsFileDownload])
      {
        v11 = +[NSNotificationCenter defaultCenter];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100073E20;
        v22[3] = &unk_100153390;
        v12 = v4;
        v23 = v12;
        objc_copyWeak(&v24, &location);
        id v13 = [v11 addObserverForName:@"MSDNotificationPauseDownload" object:0 queue:0 usingBlock:v22];

        v14 = +[NSNotificationCenter defaultCenter];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100073F3C;
        v19[3] = &unk_100153390;
        v20 = v12;
        objc_copyWeak(&v21, &location);
        id v15 = [v14 addObserverForName:@"MSDNotificationAbortDownload" object:0 queue:0 usingBlock:v19];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v24);
      }
      v16 = v4;
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000D3340();
      }

      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)invalidate
{
  id v2 = [(MSDSession *)self session];
  [v2 invalidateAndCancel];
}

- (void)launchTaskWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [[MSDSessionTask alloc] initFromTaskInfo:v4];

  v6 = [(MSDSession *)self demuxQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007416C;
  v8[3] = &unk_1001520B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

- (BOOL)getIsFileDownload
{
  return 0;
}

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, void))a6;
  v12 = [(MSDSession *)self taskManager];
  id v13 = [v12 getSessionTask:v9];

  if (!v13)
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D3374();
    }
    id v14 = 0;
    v18 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = sub_100068600();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1000D33DC();
    }

    BOOL v25 = 0;
    v18 = 0;
    id v14 = 0;
    goto LABEL_20;
  }
  id v14 = v10;
  id v15 = [v13 info];
  v16 = [v15 savePath];

  if (v16)
  {
    if ([v14 statusCode] != (id)200 && objc_msgSend(v14, "statusCode") != (id)206)
    {
      BOOL v25 = [v14 statusCode] == (id)416;
      if ([v14 statusCode] == (id)403 || objc_msgSend(v14, "statusCode") == (id)404) {
        [v13 setState:3];
      }
      v18 = 0;
      goto LABEL_20;
    }
    v17 = [v14 allHeaderFields];
    v18 = [v17 objectForKey:@"Content-Range"];

    if (!v18)
    {
      objc_super v26 = sub_100068600();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v13 info];
        v28 = [v27 savePath];
        int v36 = 138543618;
        id v37 = v28;
        __int16 v38 = 2114;
        CFStringRef v39 = @"Content-Range";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HTTP response header for %{public}@ does not contain key %{public}@; cannot proceed with download",
          (uint8_t *)&v36,
          0x16u);
      }
      v18 = 0;
      BOOL v25 = 1;
      goto LABEL_20;
    }
    v19 = [v13 contentRange];
    [v19 processServerRangeResponse:v18];

    v20 = [v13 contentRange];
    unsigned int v21 = [v20 isDownloadComplete];

    if (v21)
    {
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v13 info];
        id v24 = [v23 savePath];
        int v36 = 138543362;
        id v37 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Download for %{public}@ is already complete, no need to continue with download task", (uint8_t *)&v36, 0xCu);
      }
      BOOL v25 = 0;
LABEL_20:
      if ([v13 state] != 3) {
        [v13 setState:2];
      }
      if (v25)
      {
        v29 = +[NSFileManager defaultManager];
        v30 = [v13 info];
        v31 = [v30 savePath];
        [v29 removeItemAtPath:v31 error:0];

        [v13 resetFileHandle];
      }
      v32 = sub_100068600();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [v14 statusCode];
        unsigned int v34 = [v13 state];
        int v36 = 134218240;
        id v37 = v33;
        __int16 v38 = 1024;
        LODWORD(v39) = v34 == 2;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Cancelling download task on status code: %ld; should retry=%d",
          (uint8_t *)&v36,
          0x12u);
      }
LABEL_26:

      v11[2](v11, 0);
      goto LABEL_27;
    }
  }
  else
  {
    v18 = 0;
  }
  v11[2](v11, 1);
LABEL_27:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12 = [v9 response];
  id v13 = [v12 statusCode];
  id v14 = [(MSDSession *)self taskManager];
  id v15 = [v14 getSessionTask:v9];

  if (!v15)
  {
    v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000D3374();
    }
    id v19 = 0;
    goto LABEL_15;
  }
  v16 = [v15 info];
  v17 = [v16 savePath];
  if (!v17)
  {

LABEL_8:
    id v19 = [v15 outData];
    [v19 appendData:v10];
    goto LABEL_9;
  }

  if (v13 != (id)206 && v13 != (id)200) {
    goto LABEL_8;
  }
  v18 = [v15 fileHandle];
  id v21 = 0;
  [v18 writeData:v10 error:&v21];
  id v19 = v21;

  if (v19)
  {
    [v15 setError:v19];
    v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000D3410(v15, (uint64_t)v19, v20);
    }
LABEL_15:

    [v9 cancel];
    goto LABEL_9;
  }
  id v19 = [v15 contentRange];
  [v19 appendDownloadedFileSize:[v10 length]];
LABEL_9:
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t, void))a6;
  v12 = [(MSDSession *)self taskManager];
  id v13 = [v12 getSessionTask:v9];

  if (v13)
  {
    id v14 = [v10 protectionSpace];
    id v15 = [v14 authenticationMethod];

    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000D3528(v13);
    }

    if ([v15 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      [(MSDSession *)self authenticate:v10 forTask:v13 completion:v11];
    }
    else
    {
      v18 = sub_100068600();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000D34C0();
      }

      v11[2](v11, 2, 0);
    }
  }
  else
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v19,
        0xCu);
    }

    v11[2](v11, 2, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  v12 = (void (**)(id, void *))a7;
  id v13 = [(MSDSession *)self taskManager];
  id v14 = [v13 getSessionTask:v10];

  if (v14)
  {
    [v14 setRedirected:1];
    id v15 = [v11 URL];
    v16 = +[NSMutableURLRequest requestWithURL:v15 cachePolicy:1 timeoutInterval:30.0];

    v17 = [v14 info];
    v18 = [v17 savePath];

    if (v18)
    {
      int v19 = [v14 contentRange];
      id v20 = [v19 getRangeHeaderForDownload];

      if (v20) {
        [v16 setValue:v20 forHTTPHeaderField:@"Range"];
      }
    }
    v12[2](v12, v16);
  }
  else
  {
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v22,
        0xCu);
    }

    [v10 cancel];
    v12[2](v12, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v110 = a5;
  id v8 = [(MSDSession *)self taskManager];
  id v9 = [v8 getSessionTask:v7];

  id v10 = [v7 response];
  uint64_t v11 = (uint64_t)[v10 statusCode];
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v9)
  {
    v30 = sub_100068600();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v117 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@ done.", buf, 0xCu);
    }

    id v27 = 0;
    goto LABEL_77;
  }
  if (!-[MSDSession getIsFileDownload](self, "getIsFileDownload") || [v9 state] != 1)
  {
    if ([v110 code] == (id)-999 && objc_msgSend(v9, "state") != 3)
    {
      v104 = v10;
      id v107 = v12;
      id v33 = [v9 info];
      uint64_t v34 = [v33 savePath];
      if (v34)
      {
        v35 = (void *)v34;
        [v9 contentRange];
        v37 = uint64_t v36 = v11;
        unsigned int v38 = [v37 isDownloadComplete];

        uint64_t v11 = v36;
        if (v38)
        {
          CFStringRef v39 = sub_100068600();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [v9 info];
            v41 = [v40 description];
            v42 = [v9 info];
            v43 = [v42 savePath];
            *(_DWORD *)buf = 138543618;
            uint64_t v117 = (uint64_t)v41;
            __int16 v118 = 2114;
            id v119 = v43;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "SessionTask %{public}@ for file %{public}@ is cancelled but it is already complete, ignoring cancellation", buf, 0x16u);

            uint64_t v11 = v36;
          }

          id v27 = 0;
          int v28 = 0;
          BOOL v29 = 0;
          id v10 = v104;
          id v12 = v107;
          goto LABEL_61;
        }
      }
      else
      {
      }
      v55 = [v9 error];
      if (v55)
      {
        id v56 = [v9 error];
      }
      else
      {
        id v56 = v110;
      }
      id v27 = v56;
      id v10 = v104;

      int v28 = 0;
      BOOL v29 = [v9 state] == 2;
      goto LABEL_46;
    }
    if (!v10)
    {
      if (v110)
      {
        v108 = self;
        id v31 = v7;
        id v32 = v12;
        id v27 = v110;
        BOOL v29 = 1;
LABEL_58:
        v62 = sub_100068600();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          [v9 info];
          v63 = v105 = v10;
          [v63 description];
          v65 = uint64_t v64 = v11;
          v66 = [v27 localizedDescription];
          id v67 = [v27 code];
          *(_DWORD *)buf = 138543874;
          uint64_t v117 = (uint64_t)v65;
          __int16 v118 = 2114;
          id v119 = v66;
          __int16 v120 = 2048;
          id v121 = v67;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Session task %{public}@ did fail with error: %{public}@(0x%tx)", buf, 0x20u);

          id v10 = v105;
          uint64_t v11 = v64;
        }

        int v28 = 0;
        id v12 = v32;
        id v7 = v31;
        self = v108;
        goto LABEL_61;
      }
      v44 = 0;
      v54 = sub_100068600();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        sub_1000D35B8();
      }

      v52 = [(MSDSession *)self getServerErrorMessage:v9 withDefault:@"Unexpected server response."];
      v111 = 0;
      sub_1000C3140(&v111, 3727744512, (uint64_t)v52);
      v53 = v111;
LABEL_56:
      id v27 = v53;

      BOOL v29 = 1;
      if (v27) {
        goto LABEL_57;
      }
      goto LABEL_52;
    }
    if (v11 <= 205)
    {
      BOOL v29 = 0;
      id v27 = 0;
      int v28 = 1;
      if ((unint64_t)(v11 - 200) < 3 || v11 == 204) {
        goto LABEL_61;
      }
      goto LABEL_53;
    }
    if (v11 > 403)
    {
      if (v11 != 404)
      {
        if (v11 == 408)
        {
          v44 = v10;
          v52 = [(MSDSession *)self getServerErrorMessage:v9 withDefault:@"Connection with server is broken."];
          v113 = 0;
          sub_1000C3140(&v113, 3727740931, (uint64_t)v52);
          v53 = v113;
          goto LABEL_56;
        }
        goto LABEL_53;
      }
      v44 = v10;
      v45 = [(MSDSession *)self getServerErrorMessage:v9 withDefault:@"Requested asset not found"];
      v114 = 0;
      sub_1000C3140(&v114, 3727740934, (uint64_t)v45);
      v46 = v114;
      goto LABEL_51;
    }
    if (v11 != 206)
    {
      if (v11 != 403)
      {
LABEL_53:
        v44 = v10;
        v61 = sub_100068600();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v117 = v11;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unrecognized status code %ld; will attempt to retry task",
            buf,
            0xCu);
        }

        v52 = [(MSDSession *)self getServerErrorMessage:v9 withDefault:@"Unexpected server response."];
        v112 = 0;
        sub_1000C3140(&v112, 3727744512, (uint64_t)v52);
        v53 = v112;
        goto LABEL_56;
      }
      v44 = v10;
      v45 = [(MSDSession *)self getServerErrorMessage:v9 withDefault:@"Cannot authenticate with server."];
      v115 = 0;
      sub_1000C3140(&v115, 3727740933, (uint64_t)v45);
      v46 = v115;
LABEL_51:
      id v27 = v46;

      BOOL v29 = 0;
      if (v27)
      {
LABEL_57:
        v108 = self;
        id v31 = v7;
        id v32 = v12;
        id v10 = v44;
        goto LABEL_58;
      }
LABEL_52:
      int v28 = 0;
      id v10 = v44;
      goto LABEL_61;
    }
    v44 = v10;
    v57 = [v9 info];
    v58 = [v57 savePath];

    if (v58)
    {
      v59 = [v9 contentRange];
      unsigned __int8 v60 = [v59 isDownloadComplete];

      if (v60)
      {
        BOOL v29 = 0;
        goto LABEL_83;
      }
      v95 = [v9 contentRange];
      unsigned int v96 = [v95 didProgress];

      if (v96)
      {
        v97 = sub_100068600();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          v98 = [v9 info];
          [v98 savePath];
          id v99 = v7;
          v101 = id v100 = v12;
          *(_DWORD *)buf = 138543362;
          uint64_t v117 = (uint64_t)v101;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Allowing partial download of %{public}@ to progress without retry penalty", buf, 0xCu);

          id v12 = v100;
          id v7 = v99;
        }

        [v9 setCurrentRetry:((char *)[v9 currentRetry]) - 1];
        v102 = [v9 contentRange];
        [v102 recordDownloadedBytes];
      }
    }
    BOOL v29 = 1;
LABEL_83:
    id v27 = v110;
    if (v27) {
      goto LABEL_57;
    }
    goto LABEL_52;
  }
  id v107 = v12;
  id v13 = [v9 contentRange];
  unsigned __int8 v14 = [v13 isDownloadComplete];

  id v15 = sub_100068600();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v16)
    {
      v47 = [v9 info];
      [v47 description];
      v49 = v48 = v10;
      v50 = [v9 info];
      v51 = [v50 savePath];
      *(_DWORD *)buf = 138543618;
      uint64_t v117 = (uint64_t)v49;
      __int16 v118 = 2114;
      id v119 = v51;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SessionTask %{public}@ with savePath: %{public}@ paused, waiting to be resumed", buf, 0x16u);

      id v10 = v48;
    }

    id v27 = 0;
    id v12 = v107;
    goto LABEL_77;
  }
  if (v16)
  {
    v17 = [v9 info];
    [v17 savePath];
    int v19 = v18 = v11;
    *(_DWORD *)buf = 138543362;
    uint64_t v117 = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not pausing task for %{public}@ because download is already complete", buf, 0xCu);

    uint64_t v11 = v18;
  }

  id v20 = sub_1000687C8();
  unint64_t v21 = [(MSDSession *)self signpostId];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      id v23 = [v9 info];
      id v24 = [v23 description];
      [v9 info];
      BOOL v25 = v103 = v11;
      objc_super v26 = [v25 savePath];
      *(_DWORD *)buf = 138412546;
      uint64_t v117 = (uint64_t)v24;
      __int16 v118 = 2112;
      id v119 = v26;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, v22, "Resume Session Task", "Not Pausing Completed Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);

      uint64_t v11 = v103;
    }
  }

  id v27 = 0;
  int v28 = 0;
  BOOL v29 = 0;
LABEL_46:
  id v12 = v107;
LABEL_61:
  v68 = [(MSDSession *)self taskManager];
  [v68 removeSessionTask:v9];

  [(MSDSession *)self collectTimingDataForTask:v9 withNetworkError:v110];
  if (v29)
  {
    uint64_t v106 = v11;
    id v69 = v7;
    id v70 = v12;
    v71 = v10;
    id v72 = [v9 currentRetry];
    v73 = [v9 info];
    id v74 = [v73 maxRetry];

    if ((uint64_t)v72 <= (uint64_t)v74)
    {
      [(MSDSession *)self retrySessionTask:v9];
      id v10 = v71;
      id v12 = v70;
      id v7 = v69;
      goto LABEL_77;
    }
    v75 = sub_100068600();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v109 = [v9 info];
      v76 = [v109 description];
      v77 = [v9 info];
      id v78 = [v77 maxRetry];
      *(_DWORD *)buf = 138543618;
      uint64_t v117 = (uint64_t)v76;
      __int16 v118 = 2048;
      id v119 = v78;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ exceeded maximum retry %ld", buf, 0x16u);
    }
    id v10 = v71;
    id v12 = v70;
    id v7 = v69;
    uint64_t v11 = v106;
  }
  v79 = +[NSNumber numberWithInteger:v11];
  [v12 setObject:v79 forKey:@"statusCode"];

  if (v28)
  {
    v80 = [v10 allHeaderFields];
    v81 = [(MSDSession *)self parseResponseHeader:v80 statusCode:v11];
    [v12 addEntriesFromDictionary:v81];
  }
  v82 = [v9 outData];

  if (v82)
  {
    v83 = [v9 outData];
    [v12 setObject:v83 forKey:@"data"];
  }
  v84 = [v9 info];
  v85 = [v84 savePath];

  if (v85)
  {
    v86 = [v9 contentRange];
    id v87 = [v86 downloadedBytes];

    v88 = +[NSNumber numberWithInteger:v87];
    [v12 setObject:v88 forKey:@"fileSize"];
  }
  v89 = [v9 fileHandle];

  if (v89)
  {
    v90 = [v9 fileHandle];
    [v90 closeFile];
  }
  v91 = [v9 info];
  v92 = [v91 handler];

  if (v92)
  {
    v93 = [v9 info];
    v94 = [v93 handler];
    ((void (**)(void, id, id))v94)[2](v94, v27, v12);
  }
LABEL_77:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
}

- (void)handleDownloadPaused:(id)a3
{
  BOOL v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:@"kMSDDownloadPausedKey"];
  id v5 = [v4 BOOLValue];

  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v68 = self;
    __int16 v69 = 1024;
    LODWORD(v70) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Session received background download paused notification; pause=%d",
      buf,
      0x12u);
  }

  if (v5 == [(MSDSession *)self isDownloadPaused])
  {
    BOOL v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v68 = self;
      __int16 v69 = 1024;
      LODWORD(v70) = v5;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: downloadPaused = %d, ignoring notification...", buf, 0x12u);
    }
    uint64_t v11 = v29;
  }
  else
  {
    [(MSDSession *)self setIsDownloadPaused:v5];
    id v7 = [(MSDSession *)self taskManager];
    id v8 = v7;
    if (v5)
    {
      id v9 = [v7 getTaskInState:0];

      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1000D35F8((uint64_t)self, v9);
      }

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v11 = v9;
      id obj = [v11 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (obj)
      {
        uint64_t v54 = *(void *)v63;
        do
        {
          for (i = 0; i != obj; i = (char *)i + 1)
          {
            if (*(void *)v63 != v54) {
              objc_enumerationMutation(v11);
            }
            id v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            unsigned __int8 v14 = sub_100068600();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [v13 info];
              BOOL v16 = [v15 description];
              *(_DWORD *)buf = 138543618;
              v68 = self;
              __int16 v69 = 2114;
              id v70 = v16;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling task %{public}@", buf, 0x16u);
            }
            v17 = sub_1000687C8();
            unint64_t v18 = [(MSDSession *)self signpostId];
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v19 = v18;
              if (os_signpost_enabled(v17))
              {
                id v20 = [v13 info];
                unint64_t v21 = [v20 description];
                os_signpost_id_t v22 = [v13 info];
                id v23 = [v22 savePath];
                *(_DWORD *)buf = 138412546;
                v68 = v21;
                __int16 v69 = 2112;
                id v70 = v23;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v19, "Pause Session Task", "Pause Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);
              }
            }

            [v13 setState:1];
            id v24 = [v13 task];
            [v24 cancel];

            if (os_variant_has_internal_content())
            {
              BOOL v25 = [v13 info];
              objc_super v26 = [v25 savePath];
              id v27 = [v13 contentRange];
              [v27 setFileDownloading:v26];

              int v28 = [v13 contentRange];
              [v28 pushToTestLog:0];
            }
          }
          id obj = [v11 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (obj);
      }
    }
    else
    {
      v30 = [v7 getTaskInState:1];

      id v31 = sub_100068600();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_1000D3678((uint64_t)self, v30);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obja = v30;
      id v32 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v32)
      {
        id v34 = v32;
        uint64_t v35 = *(void *)v59;
        uint64_t v36 = "%{public}@: Relaunching task %{public}@ to resume";
        *(void *)&long long v33 = 138412546;
        long long v52 = v33;
        do
        {
          id v37 = 0;
          id v53 = v34;
          do
          {
            if (*(void *)v59 != v35) {
              objc_enumerationMutation(obja);
            }
            unsigned int v38 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v37);
            CFStringRef v39 = [(MSDSession *)self taskManager];
            [v39 removeSessionTask:v38];

            [v38 setState:0];
            [v38 setCurrentRetry:0];
            v40 = sub_100068600();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v38 info];
              v42 = [v41 description];
              *(_DWORD *)buf = 138543618;
              v68 = self;
              __int16 v69 = 2114;
              id v70 = v42;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);
            }
            v43 = sub_1000687C8();
            unint64_t v44 = [(MSDSession *)self signpostId];
            if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v45 = v44;
              if (os_signpost_enabled(v43))
              {
                v46 = [v38 info];
                [v46 description];
                uint64_t v47 = v35;
                v48 = (MSDSession *)objc_claimAutoreleasedReturnValue();
                [v38 info];
                v50 = v49 = v36;
                v51 = [v50 savePath];
                *(_DWORD *)buf = v52;
                v68 = v48;
                __int16 v69 = 2112;
                id v70 = v51;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, v45, "Resume Session Task", "Resuming Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);

                uint64_t v36 = v49;
                uint64_t v35 = v47;
                id v34 = v53;
              }
            }

            [(MSDSession *)self dispatchSessionTask:v38];
            id v37 = (char *)v37 + 1;
          }
          while (v34 != v37);
          id v34 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
        }
        while (v34);
      }
      uint64_t v11 = obja;
    }
  }
}

- (void)handleDownloadAborted:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"kMSDDownloadAbortedKey"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Session received timer expired notification; timerExpired=%d",
      (uint8_t *)&v9,
      0x12u);
  }

  if (v6)
  {
    id v8 = [(MSDSession *)self taskManager];
    [v8 cancelAndRemoveAllSessionTask];
  }
}

- (void)dispatchSessionTask:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 info];
  id v8 = [v7 postData];

  int v9 = [v6 info];
  id v10 = [v9 postFile];

  __int16 v11 = [v6 info];
  uint64_t v12 = [v11 getRequestForTimeout:30.0];
  id v13 = [(id)v12 mutableCopy];

  unsigned __int8 v14 = [v6 info];
  LOBYTE(v12) = [v14 isValid];

  if ((v12 & 1) == 0)
  {
    id v34 = sub_100068600();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000D3840();
    }
    goto LABEL_32;
  }
  if (!v13)
  {
    id v34 = sub_100068600();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000D36F8();
    }
LABEL_32:

    CFStringRef v35 = @"Input is invalid";
    uint64_t v36 = a4;
    uint64_t v37 = 3727744769;
LABEL_39:
    sub_1000C3140(v36, v37, (uint64_t)v35);
    goto LABEL_26;
  }
  [v6 resetData];
  id v15 = [v6 info];
  BOOL v16 = [v15 savePath];

  if (!v16)
  {
    os_signpost_id_t v19 = 0;
    goto LABEL_9;
  }
  v17 = [v6 fileHandle];

  if (!v17)
  {
    CFStringRef v39 = sub_100068600();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1000D380C();
    }

    uint64_t v37 = 3727740944;
    CFStringRef v35 = @"Cannot write file.";
    uint64_t v36 = a4;
    goto LABEL_39;
  }
  unint64_t v18 = [v6 contentRange];
  os_signpost_id_t v19 = [v18 getRangeHeaderForDownload];

  if (v19) {
    [v13 setValue:v19 forHTTPHeaderField:@"Range"];
  }
  [(MSDSession *)self logDownloadTaskLaunch:v6];
LABEL_9:
  [v6 setCurrentRetry:[v6 currentRetry] + 1];
  if (v8)
  {
    id v20 = [(MSDSession *)self session];
    uint64_t v21 = [v20 uploadTaskWithRequest:v13 fromData:v8];
  }
  else
  {
    id v23 = [(MSDSession *)self session];
    id v20 = v23;
    if (v10)
    {
      os_signpost_id_t v22 = +[NSURL URLWithString:v10];
      id v24 = [v20 uploadTaskWithRequest:v13 fromFile:v22];
      [v6 setTask:v24];

      goto LABEL_14;
    }
    uint64_t v21 = [v23 dataTaskWithRequest:v13];
  }
  os_signpost_id_t v22 = (void *)v21;
  [v6 setTask:v21];
LABEL_14:

  BOOL v25 = [v6 task];

  if (v25)
  {
    if ([(MSDSession *)self isDownloadPaused]
      && [(MSDSession *)self getIsFileDownload])
    {
      objc_super v26 = sub_100068600();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_1000D3760(v6, v26);
      }

      id v27 = sub_1000687C8();
      unint64_t v28 = [(MSDSession *)self signpostId];
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v29 = v28;
        if (os_signpost_enabled(v27))
        {
          v41 = [v6 info];
          v40 = [v41 description];
          v30 = [v6 info];
          [v30 savePath];
          *(_DWORD *)buf = 138412546;
          v43 = v40;
          v45 = __int16 v44 = 2112;
          id v31 = (void *)v45;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, v29, "Pause Session Task", "Launching Session Task: %{xcode:string}@ with save path: %{xcode:string}@ as paused", buf, 0x16u);
        }
      }

      [v6 setState:1];
    }
    else
    {
      [v6 setState:0];
      id v32 = [v6 task];
      [v32 resume];
    }
    long long v33 = [(MSDSession *)self taskManager];
    [v33 addSessionTask:v6];
  }
  else
  {
    unsigned int v38 = sub_100068600();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1000D372C();
    }

    sub_1000C3140(a4, 3727744515, @"Cannot dispatch network task or create session");
  }

LABEL_26:
}

- (void)dispatchSessionTask:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  [(MSDSession *)self dispatchSessionTask:v4 withError:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = [v4 info];
    id v7 = [v6 handler];

    if (v7)
    {
      id v8 = [v4 info];
      int v9 = [v8 handler];
      ((void (**)(void, id, void))v9)[2](v9, v5, 0);
    }
  }
}

- (void)retrySessionTask:(id)a3
{
  id v4 = a3;
  double v5 = exp2((double)(uint64_t)[v4 currentRetry]);
  double v6 = (double)arc4random_uniform(0x1F4u) + v5 * 1000.0;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 info];
    int v9 = [v8 description];
    id v10 = [v4 info];
    __int16 v11 = [v10 savePath];
    id v12 = [v4 currentRetry];
    id v13 = [v4 info];
    *(_DWORD *)buf = 138544386;
    id v20 = v9;
    __int16 v21 = 2114;
    os_signpost_id_t v22 = v11;
    __int16 v23 = 2048;
    double v24 = v6;
    __int16 v25 = 2048;
    id v26 = v12;
    __int16 v27 = 2048;
    id v28 = [v13 maxRetry];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying task %{public}@ with savePath: %{public}@ after %f ms; attempt %ld/%ld...",
      buf,
      0x34u);
  }
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v6 * 1000000.0));
  id v15 = [(MSDSession *)self demuxQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100076858;
  v17[3] = &unk_1001520B0;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  dispatch_after(v14, v15, v17);
}

- (id)parseResponseHeader:(id)a3 statusCode:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v5 objectForKey:@"X-Protocol-Version"];
  if (v7) {
    [v6 setObject:v7 forKey:@"protocolVersion"];
  }
  if (a4 == 202)
  {
    id v8 = [v5 objectForKey:@"Retry-After"];
    if (v8)
    {
      int v9 = v8;
      id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 intValue]);
      [v6 setObject:v10 forKey:@"retryAfter"];
    }
  }

  return v6;
}

- (id)getServerErrorMessage:(id)a3 withDefault:(id)a4
{
  id v5 = a4;
  id v6 = [a3 outData];
  if (!v6)
  {
    int v9 = 0;
    id v8 = 0;
    goto LABEL_10;
  }
  id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
  id v8 = v7;
  if (!v7)
  {
    id v10 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
LABEL_6:
    int v9 = v10;
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v9 = [v7 objectForKey:@"error_message"];
  if (!v9)
  {
    id v10 = +[NSString stringWithFormat:@"%@", v8];
    goto LABEL_6;
  }
LABEL_7:
  if ([v9 length])
  {
    __int16 v11 = [v5 stringByAppendingFormat:@": %@", v9];

    goto LABEL_11;
  }
LABEL_10:
  __int16 v11 = v5;
LABEL_11:

  return v11;
}

- (void)logDownloadTaskLaunch:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contentRange];
  id v6 = [v5 getRangeHeaderForDownload];

  id v7 = [v4 contentRange];
  id v8 = [v7 downloadedBytes];

  int v9 = [v4 contentRange];
  id v10 = [v9 existingFileSize];

  if ((uint64_t)v8 + (uint64_t)v10 >= 1)
  {
    __int16 v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 info];
      id v13 = [v12 savePath];
      int v19 = 138544130;
      id v20 = v13;
      __int16 v21 = 2048;
      id v22 = v10;
      __int16 v23 = 2048;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "File %{public}@ is partially downloaded with existing size = %ld, downloaded bytes = %ld; using range header %{public}@",
        (uint8_t *)&v19,
        0x2Au);
    }
    dispatch_time_t v14 = sub_1000687C8();
    unint64_t v15 = [(MSDSession *)self signpostId];
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        v17 = [v4 info];
        id v18 = [v17 savePath];
        int v19 = 138413058;
        id v20 = v18;
        __int16 v21 = 2048;
        id v22 = v10;
        __int16 v23 = 2048;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v16, "Resume Partial Download", "Resuming partial download for: %{xcode:string}@, existing size = %{xcode:size-in-bytes}lu; downloaded bytes = "
          "%{xcode:size-in-bytes}lu; range header = %{xcode:string}@",
          (uint8_t *)&v19,
          0x2Au);
      }
    }
  }
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
}

- (BOOL)isDownloadPaused
{
  return self->_isDownloadPaused;
}

- (void)setIsDownloadPaused:(BOOL)a3
{
  self->_isDownloadPaused = a3;
}

- (MSDSessionTaskManager)taskManager
{
  return (MSDSessionTaskManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskManager:(id)a3
{
}

- (OS_dispatch_queue)demuxQueue
{
  return self->_demuxQueue;
}

- (void)setDemuxQueue:(id)a3
{
}

- (int64_t)requestTimeoutCount
{
  return self->_requestTimeoutCount;
}

- (void)setRequestTimeoutCount:(int64_t)a3
{
  self->_requestTimeoutCount = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demuxQueue, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end