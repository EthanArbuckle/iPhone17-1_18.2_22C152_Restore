@interface PerformDownloadOperation
- (BOOL)waitForDownload;
- (PerformDownloadOperation)initWithDownloadPipeline:(id)a3 response:(id)a4;
- (PrepareDownloadResponse)response;
- (void)run;
- (void)setResponse:(id)a3;
- (void)setWaitForDownload:(BOOL)a3;
- (void)signalDownloadCompletion;
@end

@implementation PerformDownloadOperation

- (PerformDownloadOperation)initWithDownloadPipeline:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PerformDownloadOperation;
  v9 = [(PerformDownloadOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pipeline, a3);
    objc_storeStrong((id *)&v10->_response, a4);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    downloadTaskWaitSemaphore = v10->_downloadTaskWaitSemaphore;
    v10->_downloadTaskWaitSemaphore = (OS_dispatch_semaphore *)v11;

    v10->_waitForDownload = 0;
  }

  return v10;
}

- (void)run
{
  [(DownloadPipeline *)self->_pipeline _performDownloadOperation:self];
  if (self->_waitForDownload)
  {
    v3 = +[SSLogConfig sharedDaemonConfig];
    if (!v3)
    {
      v3 = +[SSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      v10[0] = 0;
      LODWORD(v9) = 2;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_14:

        dispatch_semaphore_wait((dispatch_semaphore_t)self->_downloadTaskWaitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        return;
      }
      v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, v10, v9);
      free(v8);
      SSFileLog();
    }

    goto LABEL_14;
  }
}

- (void)signalDownloadCompletion
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (!v7) {
    goto LABEL_12;
  }
  v10[0] = 0;
  LODWORD(v9) = 2;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, v10, v9);
    free(v8);
    SSFileLog();
LABEL_12:
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_downloadTaskWaitSemaphore);
}

- (PrepareDownloadResponse)response
{
  return (PrepareDownloadResponse *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResponse:(id)a3
{
}

- (BOOL)waitForDownload
{
  return self->_waitForDownload;
}

- (void)setWaitForDownload:(BOOL)a3
{
  self->_waitForDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTaskWaitSemaphore, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end