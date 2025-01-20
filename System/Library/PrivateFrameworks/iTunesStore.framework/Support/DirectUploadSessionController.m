@interface DirectUploadSessionController
- (DirectUploadSessionController)initWithDispatchQueue:(id)a3;
- (DirectUploadSessionDelegate)delegate;
- (int64_t)numberOfTasks;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)_addUploadTaskWithRequest:(id)a3 configuration:(id)a4 URLRequest:(id)a5;
- (void)_asyncModifyTasksForDatabaseIDs:(id)a3 usingBlock:(id)a4;
- (void)_cleanupForDatabaseID:(id)a3;
- (void)_failUploadWithDatabaseID:(id)a3 error:(id)a4;
- (void)_flushProgress;
- (void)addUploadTasksWithRequests:(id)a3;
- (void)cancelUploadTasksWithDatabaseIdentifiers:(id)a3;
- (void)dealloc;
- (void)invalidURLSessions;
- (void)pauseUploadTasksWithDatabaseIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DirectUploadSessionController

- (DirectUploadSessionController)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DirectUploadSessionController;
  v6 = [(DirectUploadSessionController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    preparationQueue = v7->_preparationQueue;
    v7->_preparationQueue = v8;

    [(ISOperationQueue *)v7->_preparationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)v7->_preparationQueue setName:@"com.apple.DirectUploadSessionController"];
    v10 = +[Daemon daemon];
    [v10 addKeepAliveOperationQueue:v7->_preparationQueue];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[Daemon daemon];
  [v3 removeKeepAliveOperationQueue:self->_preparationQueue];

  progressFlushTimer = self->_progressFlushTimer;
  if (progressFlushTimer) {
    dispatch_source_cancel((dispatch_source_t)progressFlushTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)DirectUploadSessionController;
  [(DirectUploadSessionController *)&v5 dealloc];
}

- (void)addUploadTasksWithRequests:(id)a3
{
  id v4 = a3;
  if (!self->_uploadDatabaseIDs)
  {
    objc_super v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uploadDatabaseIDs = self->_uploadDatabaseIDs;
    self->_uploadDatabaseIDs = v5;
  }
  v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    v11 = objc_opt_class();
    id v12 = v11;
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v11;
    __int16 v33 = 2048;
    id v34 = [v4 count];
    LODWORD(v22) = 22;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, location, v22);
      free(v13);
      SSFileLog();
    }
  }
  else
  {
  }
  objc_initWeak((id *)location, self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v19 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v18, "databaseIdentifier"));
        v20 = [[PrepareDirectUploadOperation alloc] initWithRequest:v18];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100052224;
        v24[3] = &unk_1003A43A8;
        objc_copyWeak(&v26, (id *)location);
        v24[4] = v18;
        v24[5] = self;
        id v21 = v19;
        id v25 = v21;
        [(PrepareDirectUploadOperation *)v20 setOutputBlock:v24];
        [(NSMutableArray *)self->_uploadDatabaseIDs addObject:v21];
        [(ISOperationQueue *)self->_preparationQueue addOperation:v20];

        objc_destroyWeak(&v26);
      }
      id v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  objc_destroyWeak((id *)location);
}

- (void)cancelUploadTasksWithDatabaseIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000525A8;
  v3[3] = &unk_1003A43D0;
  v3[4] = self;
  [(DirectUploadSessionController *)self _asyncModifyTasksForDatabaseIDs:a3 usingBlock:v3];
}

- (void)invalidURLSessions
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_sessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "invalidateAndCancel", (void)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  sessions = self->_sessions;
  self->_sessions = 0;
}

- (int64_t)numberOfTasks
{
  return (int64_t)[(NSMutableArray *)self->_uploadDatabaseIDs count];
}

- (void)pauseUploadTasksWithDatabaseIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005291C;
  v3[3] = &unk_1003A43D0;
  v3[4] = self;
  [(DirectUploadSessionController *)self _asyncModifyTasksForDatabaseIDs:a3 usingBlock:v3];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id object = a4;
  id v6 = a5;
  uint64_t v7 = objc_getAssociatedObject(object, "com.apple.itunesstored.upload.id");
  unsigned int v8 = (void *)v7;
  if (v6 && v7)
  {
    long long v9 = [DirectUploadResponse alloc];
    long long v10 = [object response];
    long long v11 = [(DirectUploadResponse *)v9 initWithURLResponse:v10 data:v6];

    if (v11)
    {
      -[DirectUploadResponse setCountOfBytesSent:](v11, "setCountOfBytesSent:", [object countOfBytesSent]);
      objc_setAssociatedObject(object, "com.apple.itunesstored.upload.response", v11, (void *)1);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  long long v9 = (void (**)(id, void))a6;
  uint64_t v10 = (uint64_t)objc_msgSend(a5, "itunes_statusCode");
  if (v10 > 399)
  {
    uint64_t v11 = v10;
    long long v12 = SSError();
    v13 = +[NSNumber numberWithInteger:v11];
    v14 = SSErrorBySettingUserInfoValue();

    objc_setAssociatedObject(v8, "com.apple.itunesstored.upload.error", v14, (void *)1);
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
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      id v19 = objc_opt_class();
      id v20 = v19;
      objc_getAssociatedObject(v8, "com.apple.itunesstored.upload.id");
      int v23 = 138412802;
      v24 = v19;
      __int16 v25 = 2112;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v27 = 2112;
      long long v28 = v14;
      LODWORD(v22) = 32;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_14:

        v9[2](v9, 0);
        goto LABEL_15;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v23, v22);
      free(v21);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v9[2](v9, 1);
LABEL_15:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_getAssociatedObject(v9, "com.apple.itunesstored.upload.id");
  if (v11)
  {
    long long v12 = objc_getAssociatedObject(v9, "com.apple.itunesstored.upload.response");
    dispatchQueue = self->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100052FFC;
    v15[3] = &unk_1003A43F8;
    id v16 = v10;
    id v17 = v12;
    id v18 = v9;
    id v19 = self;
    id v20 = v11;
    id v21 = v8;
    id v14 = v12;
    dispatch_async(dispatchQueue, v15);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10 = objc_getAssociatedObject(a4, "com.apple.itunesstored.upload.id");
  uint64_t v11 = v10;
  if (v10)
  {
    dispatchQueue = self->_dispatchQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000535F8;
    v13[3] = &unk_1003A4448;
    id v14 = v10;
    id v15 = self;
    int64_t v16 = a7;
    int64_t v17 = a6;
    dispatch_async(dispatchQueue, v13);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, id))a6;
  uint64_t v11 = objc_getAssociatedObject(a4, "com.apple.itunesstored.upload.id");
  long long v12 = v11;
  if (v11)
  {
    dispatchQueue = self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100053A44;
    v14[3] = &unk_1003A3268;
    v14[4] = self;
    id v15 = v11;
    dispatch_async(dispatchQueue, v14);
  }
  v10[2](v10, v9);
}

- (void)_addUploadTaskWithRequest:(id)a3 configuration:(id)a4 URLRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = self->_sessions;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v38 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
      int64_t v16 = [v15 configuration];
      unsigned __int8 v17 = [v16 isEqual:v9];

      if (v17) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v18 = v15;

    if (v18) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  if (!self->_sessions)
  {
    id v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = self->_sessions;
    self->_sessions = v19;
  }
  id v18 = +[NSURLSession sessionWithConfiguration:v9 delegate:self delegateQueue:0];
  [(NSMutableArray *)self->_sessions addObject:v18];
LABEL_14:
  id v21 = [v8 localAssetURL];
  uint64_t v22 = [v18 uploadTaskWithRequest:v36 fromFile:v21];

  v35 = v8;
  id v23 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v8, "databaseIdentifier"));
  objc_setAssociatedObject(v22, "com.apple.itunesstored.upload.id", v23, (void *)1);
  v24 = +[SSLogConfig sharedDaemonConfig];
  if (!v24)
  {
    v24 = +[SSLogConfig sharedConfig];
  }
  unsigned int v25 = [v24 shouldLog];
  if ([v24 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  __int16 v27 = [v24 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
    int v28 = v26;
  }
  else {
    int v28 = v26 & 2;
  }
  if (!v28) {
    goto LABEL_25;
  }
  long long v29 = objc_opt_class();
  id v34 = v29;
  id v30 = [v22 taskIdentifier];
  v31 = [v9 identifier];
  int v41 = 138413058;
  v42 = v29;
  __int16 v43 = 2048;
  id v44 = v30;
  __int16 v45 = 2112;
  id v46 = v23;
  __int16 v47 = 2112;
  v48 = v31;
  LODWORD(v33) = 42;
  v32 = (void *)_os_log_send_and_compose_impl();

  if (v32)
  {
    __int16 v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v41, v33);
    free(v32);
    SSFileLog();
LABEL_25:
  }
  [v22 resume];
}

- (void)_asyncModifyTasksForDatabaseIDs:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_sessions;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100053FE4;
        v14[3] = &unk_1003A4470;
        id v15 = v6;
        id v16 = v7;
        [v13 getTasksWithCompletionHandler:v14];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_cleanupForDatabaseID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v12 = v4;
  if (self->_progress)
  {
    id v6 = [v4 longLongValue];
    uint64_t v7 = (uint64_t)[(NSMutableArray *)self->_progress count];
    if (v7 >= 1)
    {
      unint64_t v8 = v7 + 1;
      do
      {
        id v9 = [(NSMutableArray *)self->_progress objectAtIndex:v8 - 2];
        if ([v9 uploadDatabaseIdentifier] == v6) {
          [(NSMutableArray *)self->_progress removeObjectAtIndex:v8 - 2];
        }

        --v8;
      }
      while (v8 > 1);
    }
    id v10 = [(NSMutableArray *)self->_progress count];
    id v5 = v12;
    if (!v10)
    {
      progress = self->_progress;
      self->_progress = 0;

      id v5 = v12;
    }
  }
  [(NSMutableArray *)self->_uploadDatabaseIDs removeObject:v5];
}

- (void)_failUploadWithDatabaseID:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(DirectUploadSessionController *)self _cleanupForDatabaseID:v8];
  uint64_t v7 = [(DirectUploadSessionController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "uploadSessionController:uploadDidFailWithDatabaseID:error:", self, objc_msgSend(v8, "longLongValue"), v6);
  }
}

- (void)_flushProgress
{
  progressFlushTimer = self->_progressFlushTimer;
  if (progressFlushTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressFlushTimer);
    id v4 = self->_progressFlushTimer;
    self->_progressFlushTimer = 0;
  }
  if ([(NSMutableArray *)self->_progress count])
  {
    id v5 = [(DirectUploadSessionController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      id v5 = 0;
    }
    id v30 = objc_alloc_init((Class)NSMutableArray);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    int v28 = self;
    id obj = self->_progress;
    id v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v32)
    {
      uint64_t v6 = *(void *)v34;
      uint64_t v7 = &syslog_ptr;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v10 = (uint64_t)objc_msgSend(v9, "countOfBytesExpectedToSend", v25, v26);
          if (v10 >= 1)
          {
            uint64_t v11 = v10;
            id v12 = [v7[405] sharedDaemonConfig];
            if (!v12)
            {
              id v12 = [v7[405] sharedConfig];
            }
            unsigned int v13 = [v12 shouldLog];
            if ([v12 shouldLogToDisk]) {
              int v14 = v13 | 2;
            }
            else {
              int v14 = v13;
            }
            id v15 = [v12 OSLogObject];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              int v16 = v14;
            }
            else {
              int v16 = v14 & 2;
            }
            if (v16)
            {
              long long v17 = objc_opt_class();
              id v31 = v17;
              long long v18 = v7;
              long long v19 = v5;
              id v20 = [v9 uploadDatabaseIdentifier];
              id v21 = [v9 countOfBytesSent];
              int v37 = 138412802;
              long long v38 = v17;
              __int16 v39 = 2048;
              id v40 = v20;
              id v5 = v19;
              uint64_t v7 = v18;
              __int16 v41 = 2048;
              double v42 = (float)((float)(uint64_t)v21 / (float)v11);
              LODWORD(v26) = 32;
              unsigned int v25 = &v37;
              uint64_t v22 = (void *)_os_log_send_and_compose_impl();

              uint64_t v6 = v27;
              if (v22)
              {
                id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v37, v26);
                free(v22);
                unsigned int v25 = (int *)v15;
                SSFileLog();
                goto LABEL_23;
              }
            }
            else
            {
LABEL_23:
            }
          }
          if (v5)
          {
            id v23 = [v9 copy];
            [v30 addObject:v23];
          }
        }
        id v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v32);
    }

    [v5 uploadSessionController:v28 uploadProgressDidChange:v30];
    progress = v28->_progress;
    v28->_progress = 0;
  }
}

- (DirectUploadSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DirectUploadSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadDatabaseIDs, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_progressFlushTimer, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_preparationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end