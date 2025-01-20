@interface RouteLoadingNavigationServiceTask
- (BOOL)inProgress;
- (MNNavigationService)navigationService;
- (MNNavigationServiceDirectionsRequestTicket)ticket;
- (MNRouteRequestBuilder)routeRequestBuilder;
- (NSString)description;
- (OS_dispatch_queue)isolationQueue;
- (Result)result;
- (Result)resultOnIsolationQueue;
- (RouteLoadingNavigationServiceTask)initWithNavigationService:(id)a3 routeRequestDetailsBuilder:(id)a4;
- (unint64_t)taskState;
- (void)_createNavigationServiceTicketOnIsolationQueueWithCompletionHandler:(id)a3;
- (void)_createResultOnIsolationQueueWithRoutes:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_handleNilNavdTicketOnIsolationQueueWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)setResultOnIsolationQueue:(id)a3;
- (void)setTaskState:(unint64_t)a3;
- (void)setTicket:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RouteLoadingNavigationServiceTask

- (RouteLoadingNavigationServiceTask)initWithNavigationService:(id)a3 routeRequestDetailsBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RouteLoadingNavigationServiceTask;
  v9 = [(RouteLoadingNavigationServiceTask *)&v22 init];
  if (v9)
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 bundleIdentifier];
    v12 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v11, objc_opt_class(), v9];

    id v13 = v12;
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    isolationQueue = v9->_isolationQueue;
    v9->_isolationQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.Maps.RouteLoadingNavigationServiceTask.callback", v18);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v9->_navigationService, a3);
    objc_storeStrong((id *)&v9->_routeRequestBuilder, a4);
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(RouteLoadingNavigationServiceTask *)self navigationService];
  [v3 closeForClient:self];

  v4.receiver = self;
  v4.super_class = (Class)RouteLoadingNavigationServiceTask;
  [(RouteLoadingNavigationServiceTask *)&v4 dealloc];
}

- (BOOL)inProgress
{
  v2 = self;
  v3 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  objc_super v4 = [(RouteLoadingNavigationServiceTask *)v2 isolationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10098DB00;
  v6[3] = &unk_1012E73F0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (Result)result
{
  v3 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1001041A4;
  v12 = sub_100104950;
  id v13 = 0;
  objc_super v4 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10098DC70;
  v7[3] = &unk_1012E73F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (Result *)v5;
}

- (void)cancel
{
  v3 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  objc_super v4 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10098DD5C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "-[RouteLoadingNavigationServiceTask startWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}s %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v13 = 0;
    uint64_t v7 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10098E060;
    block[3] = &unk_1012E73F0;
    block[4] = self;
    void block[5] = buf;
    dispatch_sync(v7, block);

    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      uint64_t v8 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10098E0D0;
      v9[3] = &unk_1012E76E8;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(v8, v9);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)_createNavigationServiceTicketOnIsolationQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(RouteLoadingNavigationServiceTask *)self routeRequestBuilder];
  uint64_t v7 = [v6 buildDirectionsRequestDetails];

  uint64_t v8 = [v7 persistentData];

  if (v8)
  {
    uint64_t v9 = [[_MapsCustomRouteDirectionsRequestTicket alloc] initWithRequestDetails:v7];
    [(RouteLoadingNavigationServiceTask *)self setTicket:v9];
  }
  else
  {
    uint64_t v9 = [(RouteLoadingNavigationServiceTask *)self navigationService];
    id v10 = [(_MapsCustomRouteDirectionsRequestTicket *)v9 ticketForDirectionsRequest:v7];
    [(RouteLoadingNavigationServiceTask *)self setTicket:v10];
  }
  v11 = [(RouteLoadingNavigationServiceTask *)self ticket];

  if (v11)
  {
    v12 = [(RouteLoadingNavigationServiceTask *)self navigationService];
    [v12 openForClient:self];

    char v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ - Submitting MNNavigationServiceDirectionsRequestTicket", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v14 = [(RouteLoadingNavigationServiceTask *)self ticket];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10098E380;
    v15[3] = &unk_101312648;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v7;
    id v17 = v4;
    [v14 submitWithHandler:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(RouteLoadingNavigationServiceTask *)self _handleNilNavdTicketOnIsolationQueueWithCompletionHandler:v4];
  }
}

- (void)_handleNilNavdTicketOnIsolationQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(RouteLoadingNavigationServiceTask *)self ticket];

  if (!v6)
  {
    uint64_t v7 = +[NSError errorWithDomain:@"com.apple.Maps.RouteLoadingNavigationServiceTask.Error" code:1 userInfo:&off_1013AED80];
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ – NavigationService returned a nil MNNavigationServiceDirectionsRequestTicket. Creating a error (%{public}@ and failing the route loading task", buf, 0x16u);
    }

    uint64_t v9 = +[Result resultWithError:v7];
    [(RouteLoadingNavigationServiceTask *)self setResultOnIsolationQueue:v9];
    [(RouteLoadingNavigationServiceTask *)self setTaskState:2];
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10098E920;
    block[3] = &unk_1012E80F0;
    block[4] = self;
    id v13 = v9;
    id v14 = v4;
    id v11 = v9;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_createResultOnIsolationQueueWithRoutes:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RouteLoadingNavigationServiceTask *)self isolationQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 count];
  if (v9 && v12)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ – MNNavigationServiceDirectionsRequestTicket callback invoked with both an error %{public}@ and routes (%@) ", buf, 0x20u);
    }
  }
  id v14 = [v8 count];
  if (!v9 && !v14)
  {
    id v9 = +[NSError errorWithDomain:@"com.apple.Maps.RouteLoadingNavigationServiceTask.Error" code:2 userInfo:&off_1013AEDA8];
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ – No Routes could be constructed from the MNNavigationServiceDirectionsRequestTicket's routes and no error was returned. Creating an error %{public}@ to send in completion handler", buf, 0x16u);
    }
  }
  if (v9) {
    +[Result resultWithError:v9];
  }
  else {
  id v16 = +[Result resultWithValue:v8];
  }
  __int16 v17 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v25 = (RouteLoadingNavigationServiceTask *)"-[RouteLoadingNavigationServiceTask _createResultOnIsolationQueueWithRout"
                                               "es:error:completionHandler:]";
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}s created result: %@", buf, 0x16u);
  }

  [(RouteLoadingNavigationServiceTask *)self setTaskState:2];
  [(RouteLoadingNavigationServiceTask *)self setResultOnIsolationQueue:v16];
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10098ED04;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v22 = v16;
  id v23 = v10;
  id v19 = v10;
  id v20 = v16;
  dispatch_async(callbackQueue, block);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(RouteLoadingNavigationServiceTask *)self taskState];
  CFStringRef v5 = @"TaskStateNotStarted";
  if (v4 == 1) {
    CFStringRef v5 = @"TaskStateRunning";
  }
  if (v4 == 2) {
    CFStringRef v6 = @"TaskStateFinished";
  }
  else {
    CFStringRef v6 = v5;
  }
  uint64_t v7 = [(RouteLoadingNavigationServiceTask *)self ticket];
  id v8 = [(RouteLoadingNavigationServiceTask *)self resultOnIsolationQueue];
  id v9 = +[NSString stringWithFormat:@"<%@:%p state=%@ ticket=%@ result=%@>", v3, self, v6, v7, v8];

  return (NSString *)v9;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (MNRouteRequestBuilder)routeRequestBuilder
{
  return self->_routeRequestBuilder;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (unint64_t)taskState
{
  return self->_taskState;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (Result)resultOnIsolationQueue
{
  return self->_resultOnIsolationQueue;
}

- (void)setResultOnIsolationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeRequestBuilder, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end