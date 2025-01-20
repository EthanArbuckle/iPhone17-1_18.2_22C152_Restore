@interface KTFetchServerOptInStatus
- (KTFetchServerOptInStatus)initWithDependencies:(id)a3 reason:(id)a4 retryScheduler:(id)a5;
- (KTNearFutureScheduler)retryScheduler;
- (KTOperationDependencies)deps;
- (NSOperation)finishedOp;
- (NSString)reason;
- (void)groupStart;
- (void)retry;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setReason:(id)a3;
- (void)setRetryScheduler:(id)a3;
@end

@implementation KTFetchServerOptInStatus

- (KTFetchServerOptInStatus)initWithDependencies:(id)a3 reason:(id)a4 retryScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KTFetchServerOptInStatus;
  v11 = [(KTGroupOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(KTFetchServerOptInStatus *)v11 setDeps:v8];
    [(KTFetchServerOptInStatus *)v12 setRetryScheduler:v10];
    [(KTFetchServerOptInStatus *)v12 setReason:v9];
  }

  return v12;
}

- (void)groupStart
{
  v3 = [(KTFetchServerOptInStatus *)self deps];
  v4 = [v3 stateMonitor];
  v5 = [v4 ktStatus];

  if ([v5 optIn] == (id)2
    || [v5 accountStatus] != (id)4 && objc_msgSend(v5, "idsAccountStatus") == (id)3)
  {
    v6 = [(KTFetchServerOptInStatus *)self deps];
    v7 = [v6 accountOperations];
    id v29 = 0;
    v25 = [v7 primaryAccount:&v29];
    id v8 = v29;

    if (v25)
    {
      id v9 = objc_alloc_init((Class)NSOperation);
      [(KTFetchServerOptInStatus *)self setFinishedOp:v9];

      id v10 = [(KTFetchServerOptInStatus *)self finishedOp];
      [(KTGroupOperation *)self dependOnBeforeGroupFinished:v10];

      v11 = [v25 username];
      v12 = +[IDSURI URIWithUnprefixedURI:v11];
      *(void *)location = 0;
      objc_initWeak((id *)location, self);
      v13 = [(KTFetchServerOptInStatus *)self deps];
      objc_super v14 = [v13 contextStore];
      v15 = [(KTFetchServerOptInStatus *)self deps];
      v16 = [v15 logClient];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002DAE4;
      v26[3] = &unk_1002B94F8;
      objc_copyWeak(&v28, (id *)location);
      uint64_t v17 = kKTApplicationIdentifierIDS;
      id v18 = v12;
      id v27 = v18;
      [v14 contextForApplication:v17 logClient:v16 fetchState:1 completionHandler:v26];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v22 = [(KTFetchServerOptInStatus *)self deps];
      v23 = [v22 stateMonitor];
      [v23 setServerOptInState:2];

      if (qword_100326760 != -1) {
        dispatch_once(&qword_100326760, &stru_1002B9428);
      }
      v24 = qword_100326768;
      if (os_log_type_enabled((os_log_t)qword_100326768, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "KTFetchServerOptInStatus: failed to check server opt-in, no account: %@", location, 0xCu);
      }
    }
  }
  else
  {
    v19 = [(KTFetchServerOptInStatus *)self deps];
    v20 = [v19 stateMonitor];
    [v20 setServerOptInState:2];

    if (qword_100326760 != -1) {
      dispatch_once(&qword_100326760, &stru_1002B9408);
    }
    v21 = qword_100326768;
    if (os_log_type_enabled((os_log_t)qword_100326768, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "KTFetchServerOptInStatus: CDP is ready and we found an opt-in state, skipping KT server opt-in state", location, 2u);
    }
  }
}

- (void)retry
{
  if (qword_100326760 != -1) {
    dispatch_once(&qword_100326760, &stru_1002B9518);
  }
  v3 = qword_100326768;
  if (os_log_type_enabled((os_log_t)qword_100326768, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "triggering a server opt-in state fetch retry", v12, 2u);
  }
  v4 = [KTPendingFlag alloc];
  v5 = [(KTFetchServerOptInStatus *)self retryScheduler];
  v6 = [(KTPendingFlag *)v4 initWithFlag:@"CheckServerOptIn" conditions:2 scheduler:v5];

  v7 = [(KTFetchServerOptInStatus *)self deps];
  id v8 = [v7 flagHandler];
  [v8 handlePendingFlag:v6];

  id v9 = [(KTFetchServerOptInStatus *)self deps];
  id v10 = [v9 stateMonitor];
  [v10 setNewServerOptInRequests:1];

  v11 = [(KTFetchServerOptInStatus *)self retryScheduler];
  [v11 trigger];
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTNearFutureScheduler)retryScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRetryScheduler:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_retryScheduler, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end