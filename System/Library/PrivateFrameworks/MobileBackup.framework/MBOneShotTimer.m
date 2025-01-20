@interface MBOneShotTimer
- (MBOneShotTimer)initWithSeconds:(double)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (double)seconds;
- (id)description;
- (id)handler;
- (void)cancel;
- (void)resume;
- (void)setHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSeconds:(double)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MBOneShotTimer

- (MBOneShotTimer)initWithSeconds:(double)a3 queue:(id)a4
{
  v6 = a4;
  if (!v6) {
    __assert_rtn("-[MBOneShotTimer initWithSeconds:queue:]", "MBOneShotTimer.m", 22, "queue");
  }
  v7 = v6;
  v21.receiver = self;
  v21.super_class = (Class)MBOneShotTimer;
  v8 = [(MBOneShotTimer *)&v21 init];
  v9 = v8;
  if (v8)
  {
    [(MBOneShotTimer *)v8 setSeconds:a3];
    [(MBOneShotTimer *)v9 setQueue:v7];
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
    dispatch_time_t v11 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10027EFD4;
    handler[3] = &unk_1004110B0;
    v12 = v9;
    v19 = v12;
    v20 = v10;
    v13 = v10;
    dispatch_source_set_event_handler(v13, handler);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10027F0F0;
    v16[3] = &unk_100411128;
    v14 = v12;
    v17 = v14;
    dispatch_source_set_cancel_handler(v13, v16);
    [(MBOneShotTimer *)v14 setTimer:v13];
  }
  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(MBOneShotTimer *)self seconds];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; seconds=%.3f>",
           v3,
           self,
           v4);
}

- (void)resume
{
  uint64_t v3 = [(MBOneShotTimer *)self timer];
  if (!v3) {
    __assert_rtn("-[MBOneShotTimer resume]", "MBOneShotTimer.m", 63, "timer");
  }
  uint64_t v4 = v3;
  v5 = (void *)os_transaction_create();
  [(MBOneShotTimer *)self setTransaction:v5];

  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Resuming %{public}@", buf, 0xCu);
    _MBLog();
  }

  dispatch_resume(v4);
}

- (void)cancel
{
  uint64_t v3 = [(MBOneShotTimer *)self timer];
  if (v3)
  {
    uint64_t v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@", buf, 0xCu);
      _MBLog();
    }

    dispatch_source_cancel(v3);
  }
}

- (id)handler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setHandler:(id)a3
{
}

- (double)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(double)a3
{
  self->_seconds = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end