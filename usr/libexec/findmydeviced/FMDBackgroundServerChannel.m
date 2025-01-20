@interface FMDBackgroundServerChannel
- (BOOL)isActive;
- (BOOL)supportsRequestType:(unint64_t)a3;
- (FMDBackgroundServerChannel)init;
- (FMDURLSession)session;
- (OS_dispatch_queue)queue;
- (void)cancelAllRequests;
- (void)cancelRequestWithId:(id)a3;
- (void)resumeBackgroundTasks;
- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)tasksWithCompletion:(id)a3;
@end

@implementation FMDBackgroundServerChannel

- (FMDBackgroundServerChannel)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMDBackgroundServerChannel;
  v2 = [(FMDBackgroundServerChannel *)&v7 init];
  if (v2)
  {
    v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v3 setURLCache:0];
    [v3 setRequestCachePolicy:1];
    v4 = +[FMDURLSessionFactory sessionWithConfiguration:v3];
    [(FMDBackgroundServerChannel *)v2 setSession:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBackgroundServerChannel.serialqueue", 0);
    [(FMDBackgroundServerChannel *)v2 setQueue:v5];
  }
  return v2;
}

- (void)resumeBackgroundTasks
{
  objc_initWeak(&location, self);
  v3 = [(FMDBackgroundServerChannel *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C5FAC;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(FMDBackgroundServerChannel *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6200;
  block[3] = &unk_1002DD0F0;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  v24 = self;
  id v25 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

- (void)cancelRequestWithId:(id)a3
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100244094(v3);
  }
}

- (void)cancelAllRequests
{
  objc_initWeak(&location, self);
  v3 = [(FMDBackgroundServerChannel *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C64D0;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return 1;
}

- (BOOL)isActive
{
  return 1;
}

- (void)tasksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDBackgroundServerChannel *)self session];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C66BC;
  v7[3] = &unk_1002DD138;
  id v8 = v4;
  id v6 = v4;
  [v5 getAllTasksWithCompletionHandler:v7];
}

- (FMDURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end