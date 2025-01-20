@interface TraceRouteLoadingTask
- (BOOL)inProgress;
- (MNNavigationServiceDirectionsRequestTicket)ticket;
- (NSString)tracePath;
- (OS_dispatch_queue)isolationQueue;
- (Result)result;
- (Result)resultOnIsolationQueue;
- (TraceRouteLoadingTask)initWithTracePath:(id)a3;
- (unint64_t)taskState;
- (void)cancel;
- (void)setResultOnIsolationQueue:(id)a3;
- (void)setTaskState:(unint64_t)a3;
- (void)setTicket:(id)a3;
- (void)setTracePath:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation TraceRouteLoadingTask

- (TraceRouteLoadingTask)initWithTracePath:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TraceRouteLoadingTask;
  v6 = [(TraceRouteLoadingTask *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracePath, a3);
    v8 = +[NSBundle mainBundle];
    v9 = [v8 bundleIdentifier];
    v10 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v9, objc_opt_class(), v7];

    id v11 = v10;
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (BOOL)inProgress
{
  v2 = self;
  v3 = [(TraceRouteLoadingTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4 = [(TraceRouteLoadingTask *)v2 isolationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D7176C;
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
  v3 = [(TraceRouteLoadingTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1001045C0;
  v12 = sub_100104B50;
  id v13 = 0;
  v4 = [(TraceRouteLoadingTask *)self isolationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D718DC;
  v7[3] = &unk_1012E73F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (Result *)v5;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TraceRouteLoadingTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v6 = [(TraceRouteLoadingTask *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D71AA0;
  block[3] = &unk_1012E73F0;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v6, block);

  if (!*((unsigned char *)v12 + 24))
  {
    uint64_t v7 = [(TraceRouteLoadingTask *)self isolationQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100D71B10;
    v8[3] = &unk_1012E76E8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
  _Block_object_dispose(&v11, 8);
}

- (void)cancel
{
  v3 = [(TraceRouteLoadingTask *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(TraceRouteLoadingTask *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D7211C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (unint64_t)taskState
{
  return self->_taskState;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (Result)resultOnIsolationQueue
{
  return self->_resultOnIsolationQueue;
}

- (void)setResultOnIsolationQueue:(id)a3
{
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end