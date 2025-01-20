@interface FMDALFailureAnalyticsManager
- (FMDALFailureAnalyticsManager)initWithProvider:(id)a3 context:(id)a4;
- (FMDServiceProvider)provider;
- (NSString)context;
- (OS_dispatch_queue)serialQueue;
- (void)dispatchAnalytics:(id)a3;
- (void)performAnalytics:(id)a3;
- (void)setContext:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDALFailureAnalyticsManager

- (FMDALFailureAnalyticsManager)initWithProvider:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_provider, a3);
    objc_storeStrong((id *)&self->_context, a4);
    dispatch_queue_t v9 = dispatch_queue_create("FMDALFailureAnalytics.serialQueue", 0);
    [(FMDALFailureAnalyticsManager *)self setSerialQueue:v9];
  }
  return self;
}

- (void)performAnalytics:(id)a3
{
  id v4 = a3;
  v5 = [(FMDALFailureAnalyticsManager *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DBA4;
  v7[3] = &unk_1002D93F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)dispatchAnalytics:(id)a3
{
  id v4 = a3;
  provider = self->_provider;
  if (provider)
  {
    id v6 = [(FMDServiceProvider *)provider account];

    if (v6)
    {
      id v7 = [FMDActivationLockFailureAnalytics alloc];
      id v8 = [(FMDServiceProvider *)self->_provider account];
      dispatch_queue_t v9 = [(FMDActivationLockFailureAnalytics *)v7 initWithAccountAndError:v8 error:v4];

      v10 = +[ServerDeviceInfo sharedInstance];
      v11 = [(FMDServiceProvider *)self->_provider account];
      v12 = [v10 deviceInfoForAccount:v11];

      v13 = [FMDActingRequestDecorator alloc];
      v22 = self;
      v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      v25 = sub_10000DEAC;
      v26 = &unk_1002D9458;
      id v27 = v12;
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_10000DEB4;
      v21 = &unk_1002D9458;
      id v14 = v12;
      v15 = [(FMDActingRequestDecorator *)v13 initWithDeviceContextGenerator:&stru_1002D9430 deviceInfoGenerator:&v23 serverContextGenerator:0 requestHeaderGenerator:&v18];
      -[NSObject setDecorator:](v9, "setDecorator:", v15, v18, v19, v20, v21, v22, v23, v24, v25, v26);
      [v9 setCompletionHandler:&stru_1002D9498];
      v16 = sub_100059B70();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v9 fm_logID];
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@:     request to disable locations.", buf, 0xCu);
      }
      [(FMDServiceProvider *)self->_provider enqueueRequest:v9];
    }
    else
    {
      dispatch_queue_t v9 = sub_100059B70();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10023B524(v9);
      }
    }
  }
  else
  {
    dispatch_queue_t v9 = sub_100059B70();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023B4E0(v9);
    }
  }
}

- (FMDServiceProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end