@interface UADispatchScheduler
+ (id)dispatchScheduler:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6;
- (BOOL)scheduleAt:(id)a3;
- (BOOL)scheduleNext:(double)a3;
- (NSString)name;
- (OS_dispatch_group)executingGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)source;
- (double)frequency;
- (id)block;
- (id)init:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6;
- (id)nextRunTimeString;
- (unint64_t)nextTime;
- (unint64_t)runCount;
- (void)_doIt;
- (void)doIt;
- (void)reset;
- (void)resume;
- (void)setFrequency:(double)a3;
- (void)setName:(id)a3;
- (void)suspend;
- (void)updateFrequency:(double)a3;
- (void)waitUntilComplete;
@end

@implementation UADispatchScheduler

- (void)doIt
{
  v3 = [(UADispatchScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F460;
  block[3] = &unk_1000C4D40;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)scheduleNext:(double)a3
{
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(UADispatchScheduler *)self name];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    __int16 v29 = 2048;
    double v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@ scheduleNext, interval=%g", buf, 0x16u);
  }
  v7 = self;
  objc_sync_enter(v7);
  if (a3 > 315576000.0)
  {
    v8 = sub_10000BA18(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SCHEDULE: Setting next time to DISPATCH_TIME_FOREVER because interval > anything reasonable", buf, 2u);
    }

    v7->_dispatch_time_t nextTime = -1;
    dispatch_source_set_timer((dispatch_source_t)v7->_source, 0xFFFFFFFFFFFFFFFFLL, 0, 0x1DCD6500uLL);
LABEL_7:
    objc_sync_exit(v7);

    return 1;
  }
  if (a3 > 0.0)
  {
    *(double *)&dispatch_time_t v9 = COERCE_DOUBLE(dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
    v10 = sub_10000BA18(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = [(UADispatchScheduler *)v7 name];
      sub_10007C214(v7->_nextTime);
      double v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543874;
      v28 = v11;
      __int16 v29 = 2048;
      double v30 = a3;
      __int16 v31 = 2114;
      double v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, scheduling down to %f seconds(_next=%{public}@)", buf, 0x20u);
    }
    dispatch_time_t nextTime = v7->_nextTime;
    if (v9 < nextTime || nextTime == -1)
    {
      v15 = sub_10000BA18(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(UADispatchScheduler *)v7 name];
        v17 = sub_10007C214(v9);
        v18 = sub_10007C214(v7->_nextTime);
        unint64_t v19 = v7->_nextTime;
        *(_DWORD *)buf = 138544386;
        v28 = v16;
        __int16 v29 = 2114;
        double v30 = *(double *)&v17;
        __int16 v31 = 2048;
        double v32 = *(double *)&v9;
        __int16 v33 = 2114;
        v34 = v18;
        __int16 v35 = 2048;
        unint64_t v36 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, next=%{public}@/%lld(was %{public}@/%lld)", buf, 0x34u);
      }
      dispatch_source_set_timer((dispatch_source_t)v7->_source, v9, (unint64_t)(a3 * 1000000000.0), 0x1DCD6500uLL);
      v7->_dispatch_time_t nextTime = v9;
    }
    goto LABEL_7;
  }
  v20 = sub_10000BA18(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = [(UADispatchScheduler *)v7 name];
    v22 = sub_10007C214(v7->_nextTime);
    [(UADispatchScheduler *)v7 frequency];
    *(_DWORD *)buf = 138543874;
    v28 = v21;
    __int16 v29 = 2114;
    double v30 = *(double *)&v22;
    __int16 v31 = 2048;
    double v32 = v23 * 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, next=NOW(was %{public}@) freq=%g", buf, 0x20u);
  }
  objc_sync_exit(v7);

  v24 = [(UADispatchScheduler *)v7 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F3D8;
  block[3] = &unk_1000C4D40;
  block[4] = v7;
  dispatch_async(v24, block);

  return 1;
}

- (void)_doIt
{
  v3 = [(UADispatchScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(UADispatchScheduler *)self executingGroup];
  dispatch_group_enter(v4);

  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(UADispatchScheduler *)self name];
    int v14 = 138543362;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, run.  ", (uint8_t *)&v14, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  v7->_dispatch_time_t nextTime = -1;
  dispatch_source_set_timer((dispatch_source_t)v7->_source, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  objc_sync_exit(v7);

  ++v7->_runCount;
  v8 = [(UADispatchScheduler *)v7 block];
  v8[2]();

  dispatch_time_t v9 = sub_10000BA18(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(UADispatchScheduler *)v7 name];
    v11 = sub_10007C214(v7->_nextTime);
    int v14 = 138543618;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, DONE run, next=%{public}@", (uint8_t *)&v14, 0x16u);
  }
  double v12 = v7;
  objc_sync_enter(v12);
  dispatch_source_set_timer((dispatch_source_t)v7->_source, v7->_nextTime, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  objc_sync_exit(v12);

  v13 = [(UADispatchScheduler *)v12 executingGroup];
  dispatch_group_leave(v13);
}

- (OS_dispatch_group)executingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 64, 1);
}

- (id)init:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)UADispatchScheduler;
  v13 = [(UADispatchScheduler *)&v29 init];
  int v14 = v13;
  if (v13)
  {
    [(UADispatchScheduler *)v13 setName:v10];
    [(UADispatchScheduler *)v14 setFrequency:a4];
    v14->_dispatch_time_t nextTime = -1;
    objc_storeStrong((id *)&v14->_queue, a5);
    dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
    source = v14->_source;
    v14->_source = (OS_dispatch_source *)v15;

    dispatch_group_t v17 = dispatch_group_create();
    executingGroup = v14->_executingGroup;
    v14->_executingGroup = (OS_dispatch_group *)v17;

    id v19 = objc_retainBlock(v12);
    id block = v14->_block;
    v14->_id block = v19;

    v21 = sub_10000BA18(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(UADispatchScheduler *)v14 name];
      double v23 = sub_10007C214(0xFFFFFFFFFFFFFFFFLL);
      [(UADispatchScheduler *)v14 frequency];
      *(_DWORD *)buf = 138543874;
      __int16 v31 = v22;
      __int16 v32 = 2114;
      __int16 v33 = v23;
      __int16 v34 = 2048;
      double v35 = v24 * 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, next=%{public}@ freq=%g", buf, 0x20u);
    }
    dispatch_source_set_timer((dispatch_source_t)v14->_source, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v25 = v14->_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F444;
    handler[3] = &unk_1000C4D40;
    v28 = v14;
    dispatch_source_set_event_handler(v25, handler);
  }
  return v14;
}

+ (id)dispatchScheduler:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [[UADispatchScheduler alloc] init:v9 frequency:v10 queue:v11 block:a4];

  return v12;
}

- (BOOL)scheduleAt:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    [v4 timeIntervalSinceNow];
  }
  else {
    double v6 = 0.0;
  }
  BOOL v7 = [(UADispatchScheduler *)self scheduleNext:v6];

  return v7;
}

- (void)updateFrequency:(double)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_frequency = a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v6 = [(UADispatchScheduler *)v4 name];
    BOOL v7 = sub_10007C214(v4->_nextTime);
    [(UADispatchScheduler *)v4 frequency];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2048;
    double v15 = v8 * 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, setFreq, next=%{public}@ freq=%g", (uint8_t *)&v10, 0x20u);
  }
  id v9 = [(UADispatchScheduler *)v4 source];
  dispatch_source_set_timer(v9, [(UADispatchScheduler *)v4 nextTime], 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  objc_sync_exit(v4);
}

- (void)reset
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(UADispatchScheduler *)v2 name];
    v5 = sub_10007C214(v2->_nextTime);
    [(UADispatchScheduler *)v2 frequency];
    int v8 = 138543874;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2048;
    double v13 = v6 * 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SCHEDULE:%{public}@, RESET, next=FOREVER(was %{public}@) freq=%g", (uint8_t *)&v8, 0x20u);
  }
  v2->_dispatch_time_t nextTime = -1;
  BOOL v7 = [(UADispatchScheduler *)v2 source];
  dispatch_source_set_timer(v7, v2->_nextTime, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);

  objc_sync_exit(v2);
}

- (void)resume
{
  v2 = [(UADispatchScheduler *)self source];
  dispatch_resume(v2);
}

- (void)suspend
{
  v3 = [(UADispatchScheduler *)self executingGroup];
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = [(UADispatchScheduler *)self source];
  dispatch_suspend(v4);
}

- (void)waitUntilComplete
{
  group = [(UADispatchScheduler *)self executingGroup];
  if (group)
  {
    v3 = self;
    objc_sync_enter(v3);
    executingGroup = v3->_executingGroup;
    v3->_executingGroup = 0;

    objc_sync_exit(v3);
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)nextRunTimeString
{
  unint64_t v2 = [(UADispatchScheduler *)self nextTime];

  return sub_10007C214(v2);
}

- (unint64_t)runCount
{
  return self->_runCount;
}

- (unint64_t)nextTime
{
  return self->_nextTime;
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_executingGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end