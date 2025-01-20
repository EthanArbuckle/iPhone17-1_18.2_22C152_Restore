@interface NRDBackgroundActivitySchedulerServerImpl
- (NRDBackgroundActivitySchedulerServerImpl)initWithIdentifier:(id)a3;
- (NSBackgroundActivityScheduler)scheduler;
- (void)_isAppRefresh:(id)a3;
- (void)_setAdditionalXPCActivityProperties:(id)a3;
- (void)dealloc;
- (void)delay:(id)a3;
- (void)identifier:(id)a3;
- (void)interval:(id)a3;
- (void)invalidate;
- (void)preregistered:(id)a3;
- (void)qualityOfService:(id)a3;
- (void)repeats:(id)a3;
- (void)scheduleWithRemoteableBlock:(id)a3;
- (void)setCheckInHandler:(id)a3;
- (void)setDelay:(double)a3;
- (void)setInterval:(double)a3;
- (void)setPreregistered:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setTolerance:(double)a3;
- (void)set_appRefresh:(BOOL)a3;
- (void)shouldDefer:(id)a3;
- (void)tolerance:(id)a3;
@end

@implementation NRDBackgroundActivitySchedulerServerImpl

- (NRDBackgroundActivitySchedulerServerImpl)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NRDBackgroundActivitySchedulerServerImpl *)self init];
  if (v5)
  {
    v6 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:v4];
    scheduler = v5->_scheduler;
    v5->_scheduler = v6;
  }
  return v5;
}

- (void)dealloc
{
  scheduler = self->_scheduler;
  self->_scheduler = 0;

  v4.receiver = self;
  v4.super_class = (Class)NRDBackgroundActivitySchedulerServerImpl;
  [(NRDBackgroundActivitySchedulerServerImpl *)&v4 dealloc];
}

- (void)identifier:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  id v6 = [(NSBackgroundActivityScheduler *)scheduler identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)qualityOfService:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, NSQualityOfService))a3 + 2))(v5, [(NSBackgroundActivityScheduler *)scheduler qualityOfService]);
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)repeats:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, [(NSBackgroundActivityScheduler *)scheduler repeats]);
}

- (void)interval:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  [(NSBackgroundActivityScheduler *)scheduler interval];
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setRepeats:(BOOL)a3
{
}

- (void)setInterval:(double)a3
{
}

- (void)tolerance:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  [(NSBackgroundActivityScheduler *)scheduler tolerance];
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setTolerance:(double)a3
{
}

- (void)scheduleWithRemoteableBlock:(id)a3
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSBackgroundActivityScheduler *)self->_scheduler identifier];
    v7 = "NO";
    if ([(NSBackgroundActivityScheduler *)self->_scheduler isPreregistered]) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    NSQualityOfService v9 = [(NSBackgroundActivityScheduler *)self->_scheduler qualityOfService];
    if ([(NSBackgroundActivityScheduler *)self->_scheduler repeats]) {
      v7 = "YES";
    }
    [(NSBackgroundActivityScheduler *)self->_scheduler interval];
    uint64_t v11 = v10;
    [(NSBackgroundActivityScheduler *)self->_scheduler delay];
    uint64_t v13 = v12;
    [(NSBackgroundActivityScheduler *)self->_scheduler tolerance];
    *(_DWORD *)buf = 138545154;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v6;
    __int16 v23 = 2082;
    v24 = v8;
    __int16 v25 = 2048;
    NSQualityOfService v26 = v9;
    __int16 v27 = 2082;
    v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    uint64_t v32 = v13;
    __int16 v33 = 2048;
    uint64_t v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling Activity %{public}@ = {\n\tidentifier = %{public}@\n\tpreregistered = %{public}s\n\tqualityOfService = %ld\n\trepeats = %{public}s\n\tinterval = %f\n\tdelay = %f\n\ttolerance = %f\n}", buf, 0x52u);
  }
  scheduler = self->_scheduler;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke;
  v17[3] = &unk_100018798;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [(NSBackgroundActivityScheduler *)scheduler scheduleWithBlock:v17];
}

void __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 scheduler];
    v7 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" fired.", buf, 0x16u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2;
  v10[3] = &unk_100018770;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v9 = v3;
  [v8 execute:v10];
}

uint64_t __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 scheduler];
    v7 = [v6 identifier];
    if (a2 == 1)
    {
      v8 = @"NSBackgroundActivityResultFinished";
    }
    else if (a2 == 2)
    {
      v8 = @"NSBackgroundActivityResultDeferred";
    }
    else
    {
      v8 = +[NSString stringWithFormat:@"%ld", a2];
    }
    *(_DWORD *)buf = 138543874;
    id v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" result: %{public}@", buf, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
}

- (void)shouldDefer:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, [(NSBackgroundActivityScheduler *)scheduler shouldDefer]);
}

- (void)preregistered:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, id))a3 + 2))(v5, [(NSBackgroundActivityScheduler *)scheduler isPreregistered]);
}

- (void)setPreregistered:(BOOL)a3
{
}

- (void)delay:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  [(NSBackgroundActivityScheduler *)scheduler delay];
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setDelay:(double)a3
{
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  id v4 = (id)_CFXPCCreateXPCObjectFromCFObject();
  [(NSBackgroundActivityScheduler *)self->_scheduler _setAdditionalXPCActivityProperties:v4];
}

- (void)setCheckInHandler:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  scheduler = self->_scheduler;
  if (v4)
  {
    id v6 = [(NSBackgroundActivityScheduler *)scheduler identifier];
    [(NSBackgroundActivityScheduler *)self->_scheduler description];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke;
    v9[3] = &unk_1000187E8;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v7;
    id v8 = v6;
    id v11 = v8;
    id v12 = v4;
    uint64_t v13 = v14;
    [(NSBackgroundActivityScheduler *)self->_scheduler setCheckInHandler:v9];
  }
  else
  {
    [(NSBackgroundActivityScheduler *)scheduler setCheckInHandler:0];
  }
  _Block_object_dispose(v14, 8);
}

void __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke(void *a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in.", buf, 0x16u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5;
  v25[3] = &unk_1000187C0;
  id v5 = (void *)a1[6];
  v25[4] = a1[7];
  [v5 execute:v25];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v22 = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2;
  __int16 v23 = &unk_1000185F0;
  uint64_t v24 = a1[7];
  id v6 = v21;
  id v8 = +[NSDate date];
  do
  {
    id v9 = +[NSDate date];
    id v10 = [v9 dateByAddingTimeInterval:0.02];
    id v11 = +[NSRunLoop currentRunLoop];
    [v11 runUntilDate:v10];

    id v12 = +[NSDate date];
    [v12 timeIntervalSinceDate:v9];
    double v14 = v13;

    if (v14 < 0.02)
    {
      *(void *)buf = (uint64_t)(0.02 - v14);
      *(void *)&buf[8] = (uint64_t)((0.02 - v14 - (double)*(uint64_t *)buf) * 1000000000.0);
      nanosleep((const timespec *)buf, 0);
    }

    if (v22((uint64_t)v6)) {
      break;
    }
    char v15 = +[NSDate date];
    [v15 timeIntervalSinceDate:v8];
    BOOL v17 = v16 < 3.1536e10;
  }
  while (v17);

  id v18 = nrdSharedLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = a1[4];
    uint64_t v20 = a1[5];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in complete.", buf, 0x16u);
  }
}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_isAppRefresh:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, id))a3 + 2))(v5, [(NSBackgroundActivityScheduler *)scheduler _isAppRefresh]);
}

- (void)set_appRefresh:(BOOL)a3
{
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
}

@end