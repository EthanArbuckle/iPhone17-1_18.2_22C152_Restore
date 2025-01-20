@interface FRBackgroundFetchManager
+ (double)timeSinceLastBackgroundFetch;
- (BOOL)backgroundFetchInProgress;
- (FCNewsAppConfigurationManager)appConfigManager;
- (FCPrivateDataContext)privateDataContext;
- (FCSubscriptionController)subscriptionController;
- (FRBackgroundFetchManager)initWithResolver:(id)a3 appConfigManager:(id)a4 privateDataContext:(id)a5 subscriptionController:(id)a6 privateDataUpdateCoordinator:(id)a7 todayAgent:(id)a8;
- (FRBackgroundFetchable)fetchables;
- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator;
- (FRTodayAgent)todayAgent;
- (TFResolver)resolver;
- (void)_peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)addFetchable:(id)a3;
- (void)peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)setAppConfigManager:(id)a3;
- (void)setBackgroundFetchInProgress:(BOOL)a3;
- (void)setFetchables:(id)a3;
- (void)setPrivateDataContext:(id)a3;
- (void)setPrivateDataUpdateCoordinator:(id)a3;
- (void)setResolver:(id)a3;
- (void)setSubscriptionController:(id)a3;
- (void)setTodayAgent:(id)a3;
@end

@implementation FRBackgroundFetchManager

- (void)addFetchable:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1000754A4();
  }
  if ([(FRBackgroundFetchManager *)self backgroundFetchInProgress]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1000753D0();
  }
  v5 = [(FRBackgroundFetchManager *)self fetchables];
  [v5 addObject:v4];
}

- (FRBackgroundFetchManager)initWithResolver:(id)a3 appConfigManager:(id)a4 privateDataContext:(id)a5 subscriptionController:(id)a6 privateDataUpdateCoordinator:(id)a7 todayAgent:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v27 = a8;
  id v19 = a8;
  v29 = v14;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007530C();
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100075248();
  }
LABEL_6:
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075184();
    if (v17) {
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000750C0();
  }
LABEL_11:
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100074FFC();
    if (v19) {
      goto LABEL_16;
    }
  }
  else if (v19)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074F38();
  }
LABEL_16:
  v30.receiver = self;
  v30.super_class = (Class)FRBackgroundFetchManager;
  v20 = [(FRBackgroundFetchManager *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resolver, a3);
    objc_storeStrong((id *)&v21->_appConfigManager, a4);
    objc_storeStrong((id *)&v21->_privateDataContext, a5);
    objc_storeStrong((id *)&v21->_subscriptionController, a6);
    objc_storeStrong((id *)&v21->_privateDataUpdateCoordinator, obja);
    objc_storeStrong((id *)&v21->_todayAgent, v27);
    uint64_t v22 = +[NSMutableSet set];
    fetchables = v21->_fetchables;
    v21->_fetchables = (FRBackgroundFetchable *)v22;
  }
  return v21;
}

- (FRBackgroundFetchable)fetchables
{
  return self->_fetchables;
}

- (BOOL)backgroundFetchInProgress
{
  return self->_backgroundFetchInProgress;
}

- (void)peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  +[NSThread isMainThread];
  if ([(FRBackgroundFetchManager *)self backgroundFetchInProgress])
  {
    if (v8) {
      v8[2](v8, 2, 0);
    }
  }
  else
  {
    [(FRBackgroundFetchManager *)self setBackgroundFetchInProgress:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003C5DC;
    v9[3] = &unk_1000C7800;
    v9[4] = self;
    v10 = v8;
    [(FRBackgroundFetchManager *)self _peformBackgroundFetchWithReason:a3 timeout:v9 completionHandler:a4];
  }
}

- (void)_peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v7 = a5;
  +[NSThread isMainThread];
  v8 = +[NSDate date];
  dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10003C994;
  v32[3] = &unk_1000C7800;
  id v9 = v8;
  id v33 = v9;
  id v10 = v7;
  id v34 = v10;
  v11 = objc_retainBlock(v32);
  v12 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 1;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 1;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100018AB0;
  v26[4] = sub_1000189E0;
  id v27 = 0;
  dispatch_group_enter(v12);
  v13 = [(FRBackgroundFetchManager *)self appConfigManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003CA2C;
  v18[3] = &unk_1000C78C8;
  uint64_t v22 = v31;
  v23 = v30;
  id v14 = v12;
  id v19 = v14;
  v20 = self;
  v24 = v28;
  v25 = v26;
  id v15 = v9;
  id v21 = v15;
  [v13 fetchAppConfigurationIfNeededWithCompletion:v18];

  id v16 = &_dispatch_main_q;
  id v17 = v11;
  FCDispatchGroupNotifyWithTimeout();

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
}

+ (double)timeSinceLastBackgroundFetch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"lastBackgroundFetchDate"];

  if (v3)
  {
    id v4 = +[NSDate date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.79769313e308;
  }

  return v6;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (FCNewsAppConfigurationManager)appConfigManager
{
  return self->_appConfigManager;
}

- (void)setAppConfigManager:(id)a3
{
}

- (FCPrivateDataContext)privateDataContext
{
  return self->_privateDataContext;
}

- (void)setPrivateDataContext:(id)a3
{
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
}

- (FRTodayAgent)todayAgent
{
  return self->_todayAgent;
}

- (void)setTodayAgent:(id)a3
{
}

- (void)setBackgroundFetchInProgress:(BOOL)a3
{
  self->_backgroundFetchInProgress = a3;
}

- (void)setFetchables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchables, 0);
  objc_storeStrong((id *)&self->_todayAgent, 0);
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_appConfigManager, 0);

  objc_storeStrong((id *)&self->_resolver, 0);
}

@end