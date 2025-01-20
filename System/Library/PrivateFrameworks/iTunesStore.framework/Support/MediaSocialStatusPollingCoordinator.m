@interface MediaSocialStatusPollingCoordinator
- (MediaSocialStatusPollingCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialStatusPollingDelegate)delegate;
- (int64_t)numberOfPollRequests;
- (void)_addBackgroundTaskJob;
- (void)_finishRequests:(id)a3 withResponses:(id)a4;
- (void)_handleBackgroundTaskEvent:(id)a3;
- (void)addPollRequest:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialStatusPollingCoordinator

- (MediaSocialStatusPollingCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MediaSocialStatusPollingCoordinator;
  v6 = [(MediaSocialStatusPollingCoordinator *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requests = v7->_requests;
    v7->_requests = v8;

    v10 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v10;

    [(ISOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)v7->_operationQueue setName:@"com.apple.itunesstored.MediaSocialStatusPollingCoordinator"];
    objc_initWeak(&location, v7);
    v12 = +[Daemon daemon];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001ACAD0;
    v16[3] = &unk_1003A4510;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [v12 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.MediaSocial.poll" withBlock:v16];
    id btaObserver = v7->_btaObserver;
    v7->_id btaObserver = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_btaObserver)
  {
    v3 = +[Daemon daemon];
    [v3 removeBackgroundTaskObserver:self->_btaObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)MediaSocialStatusPollingCoordinator;
  [(MediaSocialStatusPollingCoordinator *)&v4 dealloc];
}

- (void)addPollRequest:(id)a3
{
  id v11 = a3;
  id v4 = [(NSMutableArray *)self->_requests count];
  id v5 = [v11 copy];
  [(NSMutableArray *)self->_requests addObject:v5];
  [v11 pollingInterval];
  double v6 = 15.0;
  if (v7 > 15.0)
  {
    [v11 pollingInterval];
    double v6 = v8;
  }
  if (v4)
  {
    double pollingInterval = self->_pollingInterval;
    if (v6 >= pollingInterval) {
      goto LABEL_8;
    }
    double Current = self->_nextScheduledPoll - pollingInterval;
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  self->_nextScheduledPoll = v6 + Current;
  self->_double pollingInterval = v6;
  [(MediaSocialStatusPollingCoordinator *)self _addBackgroundTaskJob];
LABEL_8:
}

- (int64_t)numberOfPollRequests
{
  return (int64_t)[(NSMutableArray *)self->_requests count];
}

- (void)_handleBackgroundTaskEvent:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ACCE4;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_addBackgroundTaskJob
{
  v2 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_nextScheduledPoll];
  [v2 timeIntervalSinceNow];
  double v4 = v3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  double v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  *(_DWORD *)v15 = 138412546;
  *(void *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2112;
  *(void *)&v15[14] = v2;
  id v9 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    double v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  id v11 = +[Daemon daemon];
  [v11 cancelBackgroundTaskWithIdentifier:@"com.apple.itunesstored.MediaSocial.poll"];
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v12, XPC_ACTIVITY_DELAY, (uint64_t)v4);
  uint64_t v13 = [[BackgroundTaskRequest alloc] initWithBackgroundTaskAgentJob:v12];
  [(BackgroundTaskRequest *)v13 setRequestIdentifier:@"com.apple.itunesstored.MediaSocial.poll"];
  [v11 addBackgroundTaskWithRequest:v13];
}

- (void)_finishRequests:(id)a3 withResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ISOperationQueue *)self->_operationQueue operationCount];
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001AD54C;
  v12[3] = &unk_1003A9110;
  id v13 = v6;
  id v14 = v7;
  v15 = self;
  BOOL v16 = v8 == (id)1;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(dispatchQueue, v12);
}

- (MediaSocialStatusPollingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaSocialStatusPollingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_btaObserver, 0);
}

@end