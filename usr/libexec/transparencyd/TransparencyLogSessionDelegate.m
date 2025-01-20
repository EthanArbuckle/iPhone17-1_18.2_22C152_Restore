@interface TransparencyLogSessionDelegate
- (KTContextStore)contextStore;
- (KTLogClient)logClient;
- (OS_dispatch_workloop)workloop;
- (TransparencyLogSessionDelegate)initWithDataStore:(id)a3 workloop:(id)a4;
- (TransparencyManagedDataStore)dataStore;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)handleDownloadRecord:(id)a3 downloadData:(id)a4 downloadMetadata:(id)a5;
- (void)handleDownloadRecordFailure:(id)a3 task:(id)a4 downloadMetadata:(id)a5 error:(id)a6;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setWorkloop:(id)a3;
@end

@implementation TransparencyLogSessionDelegate

- (TransparencyLogSessionDelegate)initWithDataStore:(id)a3 workloop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyLogSessionDelegate;
  v8 = [(TransparencyLogSessionDelegate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyLogSessionDelegate *)v8 setDataStore:v6];
    [(TransparencyLogSessionDelegate *)v9 setWorkloop:v7];
  }

  return v9;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10 = a3;
  id v11 = a4;
  if (qword_10032F3E8 != -1) {
    dispatch_once(&qword_10032F3E8, &stru_1002CA210);
  }
  v12 = (void *)qword_10032F3F0;
  if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v11 currentRequest];
    v15 = [v14 URL];
    v16 = [v15 absoluteURL];
    int v17 = 134218498;
    int64_t v18 = a6;
    __int16 v19 = 2048;
    int64_t v20 = a7;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Wrote %lld bytes of %lld total bytes for request %@", (uint8_t *)&v17, 0x20u);
  }
}

- (void)handleDownloadRecord:(id)a3 downloadData:(id)a4 downloadMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TransparencyLogSessionDelegate *)self dataStore];
  id v24 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10020E418;
  v19[3] = &unk_1002CA278;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  v22 = self;
  id v14 = v8;
  id v23 = v14;
  LODWORD(v10) = [v11 performAndWaitForDownloadId:v14 error:&v24 block:v19];
  id v15 = v24;

  if (!v10 || v15)
  {
    if (qword_10032F3E8 != -1) {
      dispatch_once(&qword_10032F3E8, &stru_1002CA298);
    }
    v16 = qword_10032F3F0;
    if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to fetch download record %@: %@", buf, 0x16u);
    }
    int v17 = +[TransparencyAnalytics formatEventName:@"NetworkDownloadEvent" application:kKTApplicationIdentifierTLT];
    int64_t v18 = +[TransparencyAnalytics logger];
    [v18 logResultForEvent:v17 hardFailure:1 result:v15];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (qword_10032F3E8 != -1) {
    dispatch_once(&qword_10032F3E8, &stru_1002CA2B8);
  }
  id v10 = qword_10032F3F0;
  if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Download task %@ completed successfully", buf, 0xCu);
  }
  id v11 = [v8 originalRequest];
  id v12 = [v8 response];
  id v13 = [v11 kt_requestId];
  id v14 = +[NSData dataWithContentsOfURL:v9];
  uint64_t v15 = [(TransparencyLogSessionDelegate *)self workloop];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10020EC40;
  v25[3] = &unk_1002CA2E0;
  id v16 = v12;
  id v26 = v16;
  __int16 v27 = self;
  id v17 = v13;
  id v28 = v17;
  id v18 = v14;
  id v29 = v18;
  id v19 = v8;
  id v30 = v19;
  +[TransparencyLogSession dispatchToQueue:v15 block:v25];

  id v20 = +[NSFileManager defaultManager];
  id v24 = 0;
  LOBYTE(v15) = [v20 removeItemAtURL:v9 error:&v24];
  id v21 = v24;

  if ((v15 & 1) == 0)
  {
    if (qword_10032F3E8 != -1) {
      dispatch_once(&qword_10032F3E8, &stru_1002CA300);
    }
    v22 = qword_10032F3F0;
    if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v9;
      __int16 v33 = 2112;
      id v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
    }
  }
}

- (void)handleDownloadRecordFailure:(id)a3 task:(id)a4 downloadMetadata:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(TransparencyLogSessionDelegate *)self dataStore];
  id v40 = 0;
  v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472;
  __int16 v33 = sub_10020F020;
  id v34 = &unk_1002CA3A8;
  id v15 = v13;
  id v35 = v15;
  id v16 = v11;
  id v36 = v16;
  id v17 = v10;
  id v37 = v17;
  id v18 = v12;
  id v38 = v18;
  v39 = self;
  unsigned __int8 v19 = [v14 performAndWaitForDownloadId:v17 error:&v40 block:&v31];
  id v20 = v40;

  id v21 = [v15 domain:v31, v32, v33, v34];
  if ([v21 isEqualToString:NSURLErrorDomain])
  {
    id v22 = [v15 code];

    if (v20) {
      unsigned __int8 v23 = 0;
    }
    else {
      unsigned __int8 v23 = v19;
    }
    if (v23) {
      goto LABEL_20;
    }
    if (v22 == (id)-999)
    {
      if (qword_10032F3E8 != -1) {
        dispatch_once(&qword_10032F3E8, &stru_1002CA3E8);
      }
      uint64_t v24 = qword_10032F3F0;
      if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v17;
        v25 = "Failed to fetch cancelled downloadId %{public}@";
        id v26 = v24;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        uint32_t v28 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {

    if (v20) {
      unsigned __int8 v29 = 0;
    }
    else {
      unsigned __int8 v29 = v19;
    }
    if (v29) {
      goto LABEL_20;
    }
  }
  if (qword_10032F3E8 != -1) {
    dispatch_once(&qword_10032F3E8, &stru_1002CA3C8);
  }
  uint64_t v30 = qword_10032F3F0;
  if (os_log_type_enabled((os_log_t)qword_10032F3F0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v17;
    __int16 v43 = 2112;
    id v44 = v20;
    v25 = "Failed to fetch downloadId %{public}@ for failed download: %@";
    id v26 = v30;
    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    uint32_t v28 = 22;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 originalRequest];
  id v10 = [v7 response];
  id v11 = [v9 kt_requestId];
  id v12 = [v7 response];
  id v13 = +[TransparencyLogSession createErrorFromURLResonse:v12 data:0 allowEmptyData:1 error:v8];

  if (v13)
  {
    id v14 = [(TransparencyLogSessionDelegate *)self workloop];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10020F760;
    v15[3] = &unk_1002CA2E0;
    v15[4] = self;
    id v16 = v11;
    id v17 = v7;
    id v18 = v10;
    id v19 = v13;
    +[TransparencyLogSession dispatchToQueue:v14 block:v15];
  }
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextStore:(id)a3
{
}

- (KTLogClient)logClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logClient);

  return (KTLogClient *)WeakRetained;
}

- (void)setLogClient:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_destroyWeak((id *)&self->_logClient);

  objc_storeStrong((id *)&self->_contextStore, 0);
}

@end