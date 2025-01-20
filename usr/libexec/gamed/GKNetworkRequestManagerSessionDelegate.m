@interface GKNetworkRequestManagerSessionDelegate
- (GKNetworkRequestManager)networkManager;
- (GKNetworkRequestManagerSessionDelegate)initWithNetworkManager:(id)a3;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation GKNetworkRequestManagerSessionDelegate

- (GKNetworkRequestManagerSessionDelegate)initWithNetworkManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKNetworkRequestManagerSessionDelegate;
  v5 = [(GKNetworkRequestManagerSessionDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_networkManager, v4);
  }

  return v6;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 134218754;
    int64_t v15 = a5;
    __int16 v16 = 2048;
    int64_t v17 = a6;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Download resumed at offset %lld bytes out of an expected %lld bytes. Session %@ task %@\n", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = v8;
  +[GKStoreBag addAuthHeadersToRequest:v10];
  v11 = [v10 valueForHTTPHeaderField:@"x-gk-sap-signature"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C9B08;
  v22[3] = &unk_1002D3A48;
  id v23 = v10;
  id v12 = v23;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  int v14 = objc_retainBlock(v22);
  int64_t v15 = (void (**)(void))v14;
  if (v11)
  {
    __int16 v16 = [(GKNetworkRequestManagerSessionDelegate *)self networkManager];
    if (v16)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000C9C14;
      v19[3] = &unk_1002D91A0;
      id v20 = v12;
      id v21 = v15;
      [v16 getFairPlaySession:v19];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers();
      }
      __int16 v18 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000CAB04(v18);
      }
      v15[2](v15);
    }
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [v9 response];
  p_networkManager = &self->_networkManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkManager);

  if (!v9 || !WeakRetained)
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    id v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v81 = v8;
      __int16 v82 = 2112;
      id v83 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Download manager or task is nil. Session %@ task %@", buf, 0x16u);
    }
    goto LABEL_82;
  }
  if (!v10 || [v10 code] != (id)-999)
  {
    if (!v12)
    {
      if (!os_log_GKGeneral) {
        id v35 = (id)GKOSLoggers();
      }
      v36 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v81 = v8;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Session %@ Task completed but repsonse was nil, going to retry", buf, 0xCu);
      }
      id v17 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v9];
      v37 = [v9 originalRequest];
      __int16 v18 = +[GKNetworkRequestManager taskWithRequest:v37 description:v17 session:v8];

      [v18 resume];
      goto LABEL_29;
    }
    id v21 = +[GKNetworkRequestManager uuidFromTask:v9];
    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)p_networkManager);
      id v23 = [v22 resultsLocation];
      id v24 = [v22 pathToTempFile:v23 fileName:v21];

      id v25 = objc_loadWeakRetained((id *)p_networkManager);
      v26 = [v25 resultsLocation];
      v79 = [v25 filePathToTempFile:v26 fileName:v21];

      v27 = v24;
      if (v24)
      {
        v28 = [v24 absoluteString];
        v29 = +[NSDictionary dictionaryWithContentsOfFile:v28];

        if (v29)
        {
          v30 = v29;
          v74 = v21;
          v31 = [v29 objectForKey:@"status"];
          id v32 = [v31 longValue];

          v77 = v30;
          v78 = [v30 objectForKey:@"message"];
          v27 = v24;
          uint64_t v76 = (uint64_t)v32;
          if (v32)
          {
            if (!os_log_GKGeneral) {
              id v33 = (id)GKOSLoggers();
            }
            v34 = os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              id v81 = v32;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "GKNetworkRequestManager serverError %ld", buf, 0xCu);
            }
          }
          id v21 = v74;
          if (v78)
          {
LABEL_34:
            v38 = +[NSFileManager defaultManager];
            v39 = [v79 path];
            [v38 removeItemAtPath:v39 error:0];

            v40 = (char *)[v12 statusCode];
            if (v40 == (char *)520)
            {
              v41 = objc_loadWeakRetained((id *)p_networkManager);
              [v41 handleRetryAfter:v9];
LABEL_81:

              goto LABEL_82;
            }
            BOOL v44 = v40 != (char *)401 && v40 != (char *)200 && v40 != (char *)413 && (unint64_t)(v40 - 433) > 1;
            v73 = v27;
            if (v44 || v76 != 5000)
            {
              BOOL v58 = v40 != (char *)200 && v40 != (char *)304 && v40 != (char *)206;
              if (!v10 && !v58 && v76 < 1) {
                goto LABEL_76;
              }
              v94[0] = @"statusCode";
              v59 = +[NSNumber numberWithInteger:v40];
              v95[0] = v59;
              v94[1] = @"serverResult";
              v60 = +[NSNumber numberWithLong:v76];
              v94[2] = @"serverMessage";
              v95[1] = v60;
              v95[2] = v78;
              v41 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];

              if (!os_log_GKGeneral) {
                id v61 = (id)GKOSLoggers();
              }
              v62 = os_log_GKDaemon;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v81 = v41;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "GKNetworkRequestManager sending event %@", buf, 0xCu);
              }
              v63 = +[GKReporter reporter];
              [v63 reportEvent:GKReporterDomainNetworkRequests type:GKNetworkRequestFailure payload:v41];

              v27 = v73;
            }
            else
            {
              v41 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v9];
              v45 = [v41 objectForKeyedSubscript:@"_gkAuthRetries"];
              uint64_t v46 = (uint64_t)[v45 longValue];

              if (v46 <= 9)
              {
                uint64_t v47 = v46 + 1;
                if (!os_log_GKGeneral) {
                  id v48 = (id)GKOSLoggers();
                }
                v49 = (void *)os_log_GKDaemon;
                if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
                {
                  v50 = v49;
                  v51 = +[NSNumber numberWithInteger:v47];
                  *(_DWORD *)buf = 138412546;
                  id v81 = v51;
                  __int16 v82 = 2112;
                  id v83 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "GKNetworkRequestManager auth failure, retry %@: for request: %@", buf, 0x16u);
                }
                v52 = +[NSNumber numberWithInteger:v47];
                [v41 setObject:v52 forKeyedSubscript:@"_gkAuthRetries"];

                v53 = [v9 originalRequest];
                +[GKStoreBag addAuthHeadersToRequest:v53];

                v54 = [v9 originalRequest];
                v55 = +[GKNetworkRequestManager taskWithRequest:v54 description:v41 session:v8];

                [v55 resume];
                v27 = v73;
                goto LABEL_81;
              }
              if (!os_log_GKGeneral) {
                id v64 = (id)GKOSLoggers();
              }
              v65 = os_log_GKDaemon;
              v27 = v73;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v81 = v41;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "GKNetworkRequestManager request exceeded maximum amount of auth retries: %@", buf, 0xCu);
              }
            }

LABEL_76:
            if (!os_log_GKGeneral) {
              id v66 = (id)GKOSLoggers();
            }
            v67 = (void *)os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              v75 = v21;
              log = v67;
              v71 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 statusCode]);
              v68 = +[NSNumber numberWithLong:v76];
              v69 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v9];
              v70 = [v12 allHeaderFields];
              *(_DWORD *)buf = 138413826;
              id v81 = v9;
              __int16 v82 = 2112;
              id v83 = v71;
              __int16 v84 = 2112;
              v85 = v68;
              __int16 v86 = 2112;
              id v87 = v10;
              __int16 v88 = 2112;
              v89 = v69;
              __int16 v90 = 2112;
              v91 = v70;
              __int16 v92 = 2112;
              v93 = v77;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Task completed: %@ code:%@ serverCode:%@ error: %@ descriptor: %@ , headers: %@ resultsPlist: %@", buf, 0x48u);

              id v21 = v75;
              v27 = v73;
            }
            v41 = objc_loadWeakRetained((id *)p_networkManager);
            [v41 handleTaskFinished:v9];
            goto LABEL_81;
          }
        }
        else
        {
          uint64_t v76 = -1;
          v77 = 0;
          v27 = v24;
        }
LABEL_33:
        v78 = &stru_1002E4F58;
        goto LABEL_34;
      }
      v77 = 0;
    }
    else
    {
      v77 = 0;
      v27 = 0;
      v79 = 0;
    }
    uint64_t v76 = -1;
    goto LABEL_33;
  }
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  __int16 v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v17 = v16;
    __int16 v18 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v9];
    *(_DWORD *)buf = 138412290;
    id v81 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "GKNetworkRequestManager task was explicitly cancelled: %@", buf, 0xCu);
LABEL_29:
  }
LABEL_82:
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[NSFileManager defaultManager];
  id v10 = +[GKNetworkRequestManager uuidFromTask:v8];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_networkManager);
    id v12 = [v11 resultsLocation];
    id v13 = [v11 filePathToTempFile:v12 fileName:v10];

    int v14 = [v13 path];
    [v9 removeItemAtPath:v14 error:0];

    id v25 = 0;
    LODWORD(v12) = [v9 moveItemAtURL:v7 toURL:v13 error:&v25];
    id v15 = v25;
    if (v12)
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers();
      }
      id v17 = os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412546;
      id v27 = v7;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v18 = "GKNetworkRequestManager moved %@ to %@";
      id v19 = v17;
      uint32_t v20 = 22;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers();
      }
      id v24 = os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412802;
      id v27 = v7;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v18 = "GKNetworkRequestManager failed to move %@ to %@ error:%@";
      id v19 = v24;
      uint32_t v20 = 32;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, buf, v20);
LABEL_16:

    goto LABEL_17;
  }
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  id v22 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "GKNetworkRequestManager cannot move file into place there was no uuid in the task description", buf, 2u);
  }
LABEL_17:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKNetworkRequestManager finished collecting metrics for background task", v13, 2u);
  }
  id v12 = +[GKAMPController controller];
  [v12 reportURLSessionEventWithTask:v8 metrics:v9];
}

- (GKNetworkRequestManager)networkManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkManager);

  return (GKNetworkRequestManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end