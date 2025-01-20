@interface WCDRetrieveInitialStateOperation
- (BOOL)failed;
- (NSOperationQueue)operationQueue;
- (WCDOperationDelegate)delegate;
- (WCDRetrieveInitialStateOperation)initWithDelegate:(id)a3;
- (void)main;
- (void)setFailed:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation WCDRetrieveInitialStateOperation

- (WCDRetrieveInitialStateOperation)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WCDRetrieveInitialStateOperation;
  v5 = [(WCDRetrieveInitialStateOperation *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v6->_operationQueue setQualityOfService:17];
  }

  return v6;
}

- (void)main
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    v31 = "-[WCDRetrieveInitialStateOperation main]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }

  id v4 = [WCDRetrievePairedListOperation alloc];
  v5 = [(WCDRetrieveInitialStateOperation *)self delegate];
  v6 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
  uint64_t v7 = [(WCDAsyncOperation *)v4 initWithDelegate:v5 queue:v6];

  v8 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
  [v8 addOperation:v7];

  v9 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
  [v9 waitUntilAllOperationsAreFinished];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(id)objc_opt_class() description];
    v11 = (const char *)[v10 UTF8String];
    int v30 = 136315138;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pairedListOperation: %s", (uint8_t *)&v30, 0xCu);
  }
  if ([(WCDRetrievePairedListOperation *)v7 paired])
  {
    v12 = [WCDRetrieveActiveComplicationsOperation alloc];
    v13 = [(WCDRetrieveInitialStateOperation *)self delegate];
    v14 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
    v15 = [(WCDAsyncOperation *)v12 initWithDelegate:v13 queue:v14];

    v16 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
    [v16 addOperation:v15];

    v17 = [WCDRetrieveInstalledAppsListOperation alloc];
    v18 = [(WCDRetrieveInitialStateOperation *)self delegate];
    v19 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
    v20 = [(WCDAsyncOperation *)v17 initWithDelegate:v18 queue:v19];

    v21 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
    [v21 addOperation:v20];

    v22 = [(WCDRetrieveInitialStateOperation *)self operationQueue];
    [v22 waitUntilAllOperationsAreFinished];
  }
  else
  {
    v20 = 0;
    v15 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [(id)objc_opt_class() description];
    v24 = (const char *)[v23 UTF8String];
    int v30 = 136315138;
    v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pairedListOperation2: %s", (uint8_t *)&v30, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [(id)objc_opt_class() description];
    v26 = (const char *)[v25 UTF8String];
    int v30 = 136315138;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "activeComplicationsOperation: %s", (uint8_t *)&v30, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [(id)objc_opt_class() description];
    v28 = (const char *)[v27 UTF8String];
    int v30 = 136315138;
    v31 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "installedAppsListOperation: %s", (uint8_t *)&v30, 0xCu);
  }
  uint64_t v29 = [(WCDAsyncOperation *)v7 failed]
     || [(WCDAsyncOperation *)v15 failed]
     || [(WCDAsyncOperation *)v20 failed];
  [(WCDRetrieveInitialStateOperation *)self setFailed:v29];
}

- (WCDOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDOperationDelegate *)WeakRetained;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end