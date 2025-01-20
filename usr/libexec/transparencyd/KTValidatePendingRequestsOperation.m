@interface KTValidatePendingRequestsOperation
- (KTOperationDependencies)deps;
- (KTValidatePendingRequestsOperation)initWithApplication:(id)a3 dependencies:(id)a4 opId:(id)a5;
- (NSMutableArray)errors;
- (NSMutableArray)requestIds;
- (NSMutableArray)serverHints;
- (NSOperation)finishedOp;
- (NSString)application;
- (NSUUID)backgroundOpId;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)fetchQueue;
- (id)createChainOfErrorsFromRequestFailures:(id)a3;
- (id)createErrorFromRequestFailure:(id)a3 underlyingError:(id)a4;
- (id)failExpiredRequest:(id)a3 error:(id)a4;
- (void)groupStart;
- (void)handleKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 completionHandler:(id)a6;
- (void)handleKTRequestDownload:(id)a3 context:(id)a4;
- (void)saveRequestFailure:(id)a3 failure:(id)a4;
- (void)setApplication:(id)a3;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setRequestIds:(id)a3;
- (void)setServerHints:(id)a3;
@end

@implementation KTValidatePendingRequestsOperation

- (KTValidatePendingRequestsOperation)initWithApplication:(id)a3 dependencies:(id)a4 opId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KTValidatePendingRequestsOperation;
  v12 = [(KTGroupOperation *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a4);
    objc_storeStrong((id *)&v13->_application, a3);
    [(KTValidatePendingRequestsOperation *)v13 setBackgroundOpId:v11];
    v14 = +[NSMutableArray array];
    [(KTValidatePendingRequestsOperation *)v13 setErrors:v14];

    v15 = +[NSMutableArray array];
    [(KTValidatePendingRequestsOperation *)v13 setRequestIds:v15];

    v16 = +[NSMutableArray array];
    [(KTValidatePendingRequestsOperation *)v13 setServerHints:v16];

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("VerifyInclusion_FetchWaiter", v17);
    [(KTValidatePendingRequestsOperation *)v13 setFetchQueue:v18];

    [(KTGroupOperation *)v13 setName:@"KTRequest"];
  }

  return v13;
}

- (void)groupStart
{
  if (qword_1003266B0 != -1) {
    dispatch_once(&qword_1003266B0, &stru_1002B7618);
  }
  v3 = qword_1003266B8;
  if (os_log_type_enabled((os_log_t)qword_1003266B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ValidatePendingRequests: start", buf, 2u);
  }
  id v4 = objc_alloc_init((Class)NSOperation);
  [(KTValidatePendingRequestsOperation *)self setFinishedOp:v4];

  v5 = [(KTValidatePendingRequestsOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v5];

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v6 = [(KTValidatePendingRequestsOperation *)self deps];
  v7 = [v6 contextStore];
  v8 = [(KTValidatePendingRequestsOperation *)self application];
  id v9 = [(KTValidatePendingRequestsOperation *)self deps];
  id v10 = [v9 logClient];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000102C8;
  v11[3] = &unk_1002B76E8;
  objc_copyWeak(&v12, (id *)buf);
  [v7 contextForApplication:v8 logClient:v10 fetchState:1 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)handleKTRequestDownload:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010D30;
  v8[3] = &unk_1002B7758;
  objc_copyWeak(&v9, &location);
  [v7 fetchQueryForKTRequest:v6 userInitiated:0 completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = 0;
  objc_initWeak(&location, self);
  v24 = v10;
  v14 = [v10 requestId];
  v15 = [(KTValidatePendingRequestsOperation *)self deps];
  v16 = [v15 contextStore];
  v17 = [(KTValidatePendingRequestsOperation *)self application];
  dispatch_queue_t v18 = [(KTValidatePendingRequestsOperation *)self deps];
  v19 = [v18 logClient];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000113E4;
  v25[3] = &unk_1002B77E8;
  objc_copyWeak(&v30, &location);
  id v20 = v14;
  id v26 = v20;
  id v21 = v13;
  id v29 = v21;
  id v22 = v11;
  id v27 = v22;
  id v23 = v12;
  id v28 = v23;
  [v16 contextForApplication:v17 logClient:v19 fetchState:1 completionHandler:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)failExpiredRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDeleted])
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_1002855E0];
  }
  else
  {
    [v6 requestTime];
    CFAbsoluteTime v10 = v9 + (double)kKTMaximumMergeDelayMs / 1000.0;
    if (v10 >= CFAbsoluteTimeGetCurrent())
    {
      id v8 = 0;
    }
    else
    {
      id v11 = [v6 failures];
      id v12 = [(KTValidatePendingRequestsOperation *)self createChainOfErrorsFromRequestFailures:v11];

      id v13 = +[TransparencyError errorWithError:v7 underlyingError:v12];
      v14 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-213 underlyingError:v13 description:@"failed to download query response for request"];

      if (qword_1003266B0 != -1) {
        dispatch_once(&qword_1003266B0, &stru_1002B7808);
      }
      v15 = (void *)qword_1003266B8;
      if (os_log_type_enabled((os_log_t)qword_1003266B8, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = [v6 requestId];
        int v26 = 138543874;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "ValidatePendingRequests: Request validation failed after MMD for requestId %{public}@, error: %@, underlyingError: %@", (uint8_t *)&v26, 0x20u);
      }
      dispatch_queue_t v18 = [(KTValidatePendingRequestsOperation *)self deps];
      v19 = [v18 dataStore];
      id v20 = [v19 createRequestFailure];

      [v20 setErrorCode:-213];
      [v20 setErrorDomain:@"TransparencyErrorVerify"];
      [v20 setRequest:v6];
      [v6 setVerificationResult:0];
      id v21 = +[TransparencyAnalytics logger];
      id v22 = [v6 type];
      id v23 = [(KTValidatePendingRequestsOperation *)self application];
      v24 = +[KTContext validateEventName:v22 application:v23];
      [v21 logResultForEvent:v24 hardFailure:1 result:v14];

      id v8 = [v6 requestId];
    }
  }

  return v8;
}

- (void)saveRequestFailure:(id)a3 failure:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTValidatePendingRequestsOperation *)self deps];
  double v9 = [v8 dataStore];
  id v11 = [v9 createRequestFailure];

  [v11 setErrorCode:[v6 code]];
  CFAbsoluteTime v10 = [v6 domain];

  [v11 setErrorDomain:v10];
  [v11 setRequest:v7];
}

- (id)createChainOfErrorsFromRequestFailures:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 allObjects];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0;
      CFAbsoluteTime v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = [(KTValidatePendingRequestsOperation *)self createErrorFromRequestFailure:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9) underlyingError:v10];

        double v9 = (char *)v9 + 1;
        CFAbsoluteTime v10 = v7;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)createErrorFromRequestFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 errorDomain];
  id v8 = [v6 errorCode];

  double v9 = +[TransparencyError errorWithDomain:v7 code:v8 underlyingError:v5 description:0];

  return v9;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBackgroundOpId:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchGroup:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFetchQueue:(id)a3
{
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableArray)requestIds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestIds:(id)a3
{
}

- (NSMutableArray)serverHints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setServerHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHints, 0);
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end