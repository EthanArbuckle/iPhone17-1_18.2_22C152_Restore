@interface CheckDownloadQueueOperation
- (CheckDownloadQueueOperation)init;
- (CheckDownloadQueueOperation)initWithDownloadQueueRequest:(id)a3;
- (StoreDownloadQueueRequest)downloadQueueRequest;
- (id)_account;
- (id)_newURLOperation;
- (int64_t)numberOfAvailableDownloads;
- (void)_runPendingCancelDownloadOperations;
- (void)dealloc;
- (void)run;
@end

@implementation CheckDownloadQueueOperation

- (CheckDownloadQueueOperation)init
{
  return [(CheckDownloadQueueOperation *)self initWithDownloadQueueRequest:0];
}

- (CheckDownloadQueueOperation)initWithDownloadQueueRequest:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CheckDownloadQueueOperation.m" lineNumber:33 description:@"Must have a request"];
  }
  v7.receiver = self;
  v7.super_class = (Class)CheckDownloadQueueOperation;
  v5 = [(CheckDownloadQueueOperation *)&v7 init];
  if (v5) {
    v5->_request = (StoreDownloadQueueRequest *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CheckDownloadQueueOperation;
  [(CheckDownloadQueueOperation *)&v3 dealloc];
}

- (StoreDownloadQueueRequest)downloadQueueRequest
{
  id v2 = [(StoreDownloadQueueRequest *)self->_request copy];

  return (StoreDownloadQueueRequest *)v2;
}

- (int64_t)numberOfAvailableDownloads
{
  [(CheckDownloadQueueOperation *)self lock];
  int64_t numberOfAvailableDownloads = self->_numberOfAvailableDownloads;
  [(CheckDownloadQueueOperation *)self unlock];
  return numberOfAvailableDownloads;
}

- (void)run
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    request = self->_request;
    int v33 = 138412546;
    uint64_t v34 = v6;
    __int16 v35 = 2112;
    int64_t v36 = (int64_t)request;
    LODWORD(v31) = 22;
    v29 = &v33;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v33, v31);
      free(v9);
      v29 = (int *)v10;
      SSFileLog();
    }
  }
  [(CheckDownloadQueueOperation *)self _runPendingCancelDownloadOperations];
  v32 = 0;
  id v11 = [(CheckDownloadQueueOperation *)self _newURLOperation];
  if ([(CheckDownloadQueueOperation *)self runSubOperation:v11 returningError:&v32])
  {
    id v12 = objc_msgSend(objc_msgSend(objc_msgSend(v11, "dataProvider"), "output"), "objectForKey:", @"download-queue-item-count");
    if (objc_opt_respondsToSelector()) {
      int64_t v13 = (int)[v12 intValue];
    }
    else {
      int64_t v13 = 0;
    }
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21) {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_INFO)) {
      v23 &= 2u;
    }
    if (v23)
    {
      uint64_t v24 = objc_opt_class();
      v25 = self->_request;
      int v33 = 138412802;
      uint64_t v34 = v24;
      __int16 v35 = 2048;
      int64_t v36 = v13;
      __int16 v37 = 2112;
      v38 = v25;
      LODWORD(v31) = 32;
      v30 = &v33;
      uint64_t v26 = _os_log_send_and_compose_impl();
      if (v26)
      {
        v27 = (void *)v26;
        v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v33, v31);
        free(v27);
        v30 = (int *)v28;
        SSFileLog();
      }
    }
    [(CheckDownloadQueueOperation *)self lock];
    self->_int64_t numberOfAvailableDownloads = v13;
    [(CheckDownloadQueueOperation *)self unlock];
    [(CheckDownloadQueueOperation *)self setSuccess:1];
  }
  else
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      v18 = self->_request;
      int v33 = 138412802;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      int64_t v36 = (int64_t)v18;
      __int16 v37 = 2112;
      v38 = v32;
      LODWORD(v31) = 32;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v33, v31);
        free(v20);
        SSFileLog();
      }
    }
  }
}

- (id)_account
{
  id v2 = [(StoreDownloadQueueRequest *)self->_request accountIdentifier];
  if (!v2
    || (id result = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "accountWithUniqueIdentifier:", v2)) == 0)
  {
    id v4 = +[SSAccountStore defaultStore];
    return [v4 activeAccount];
  }
  return result;
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  [v3 setUseUserSpecificURLBag:1];
  id v4 = [(CheckDownloadQueueOperation *)self _account];
  id v5 = [objc_alloc((Class)SSAuthenticationContext) initWithAccount:v4];
  [v3 setAuthenticationContext:v5];

  id v6 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v6 setAllowedRetryCount:0];
  [v6 setCachePolicy:1];
  objc_msgSend(v6, "setURLBagKey:", -[StoreDownloadQueueRequest queueCountURLBagKey](self->_request, "queueCountURLBagKey"));
  [v4 accountScope];
  [v6 setURLBagType:SSURLBagTypeForAccountScope()];
  [v3 setRequestProperties:v6];

  objc_super v7 = objc_alloc_init(DaemonProtocolDataProvider);
  [v3 setDataProvider:v7];

  return v3;
}

- (void)_runPendingCancelDownloadOperations
{
  id v3 = objc_alloc_init(FinishDownloadsOperation);
  [(CheckDownloadQueueOperation *)self runSubOperation:v3 returningError:0];
}

@end