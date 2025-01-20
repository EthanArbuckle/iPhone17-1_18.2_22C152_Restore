@interface PowerManagerIdleTracker
+ (id)idleTracker:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6;
+ (unint64_t)setup:(id)a3 interval:(double)a4;
- (BOOL)active;
- (BOOL)enabled;
- (BOOL)firstTime;
- (BOOL)isMirroringActive;
- (NSDate)startTime;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (double)interval;
- (id)block;
- (id)init:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6;
- (unint64_t)userActivityNotificationRef;
- (void)dealloc;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
- (void)setBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFirstTime:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setUserActivityNotificationRef:(unint64_t)a3;
@end

@implementation PowerManagerIdleTracker

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_enabled != v3)
  {
    obj->_enabled = v3;
    [(PowerManagerIdleTracker *)obj userActivityNotificationRef];
    v4 = obj;
    if (v3)
    {
      v5 = [(PowerManagerIdleTracker *)obj block];
      ((void (**)(void, BOOL))v5)[2](v5, [(PowerManagerIdleTracker *)obj active]);

      v4 = obj;
    }
  }
  objc_sync_exit(v4);
}

+ (id)idleTracker:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[PowerManagerIdleTracker alloc] init:v11 queue:v10 interval:v9 block:a5];

  return v12;
}

- (id)init:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = sub_10000BA18(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v11;
    __int16 v26 = 2050;
    double v27 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "IdleTracker:alloc(%{public}@) interval=%{public}g", buf, 0x16u);
  }

  v23.receiver = self;
  v23.super_class = (Class)PowerManagerIdleTracker;
  v15 = [(PowerManagerIdleTracker *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    *(_WORD *)&v16->_active = 257;
    v16->_firstTime = 1;
    v16->_interval = a5;
    id v17 = [v13 copy];
    id block = v16->_block;
    v16->_id block = v17;

    objc_initWeak((id *)buf, v16);
    v19 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    -[PowerManagerIdleTracker setUserActivityNotificationRef:](v16, "setUserActivityNotificationRef:", [v19 setup:WeakRetained interval:a5]);

    if (![(PowerManagerIdleTracker *)v16 userActivityNotificationRef])
    {
      v21 = [(PowerManagerIdleTracker *)v16 block];
      ((void (**)(void, BOOL))v21)[2](v21, [(PowerManagerIdleTracker *)v16 active]);
    }
    objc_destroyWeak((id *)buf);
  }

  return v16;
}

- (void)dealloc
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PowerManagerIdleTracker *)self name];
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "IdleTracker:dealloc(%{public}@", buf, 0xCu);
  }
  [(PowerManagerIdleTracker *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)PowerManagerIdleTracker;
  [(PowerManagerIdleTracker *)&v5 dealloc];
}

+ (unint64_t)setup:(id)a3 interval:(double)a4
{
  id v4 = a3;
  objc_super v5 = [v4 queue];
  id v9 = v4;
  id v6 = v4;
  unint64_t v7 = IOPMScheduleUserActivityLevelNotificationWithTimeout();

  return v7;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if ([(PowerManagerIdleTracker *)obj userActivityNotificationRef])
  {
    [(PowerManagerIdleTracker *)obj userActivityNotificationRef];
    IOPMUnregisterNotification();
    [(PowerManagerIdleTracker *)obj setUserActivityNotificationRef:0];
  }
  objc_sync_exit(obj);
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_active != v3)
  {
    obj->_BOOL active = v3;
    if (v3)
    {
      uint64_t v5 = +[NSDate date];
      startTime = obj->_startTime;
      obj->_startTime = (NSDate *)v5;

      id v4 = obj;
    }
  }
  if (![(PowerManagerIdleTracker *)v4 userActivityNotificationRef]
    && [(PowerManagerIdleTracker *)obj enabled])
  {
    unint64_t v7 = [(PowerManagerIdleTracker *)obj block];
    ((void (**)(void, BOOL))v7)[2](v7, [(PowerManagerIdleTracker *)obj active]);
  }
  objc_sync_exit(obj);
}

- (BOOL)enabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL enabled = v2->_enabled;
  objc_sync_exit(v2);

  return enabled;
}

- (double)interval
{
  v2 = self;
  objc_sync_enter(v2);
  double interval = v2->_interval;
  objc_sync_exit(v2);

  return interval;
}

- (void)setInterval:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_double interval = a3;
  [(PowerManagerIdleTracker *)obj userActivityNotificationRef];
  [(PowerManagerIdleTracker *)obj interval];
  IOPMSetUserActivityIdleTimeout();
  objc_sync_exit(obj);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)userActivityNotificationRef
{
  return self->_userActivityNotificationRef;
}

- (void)setUserActivityNotificationRef:(unint64_t)a3
{
  self->_userActivityNotificationRef = a3;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)firstTime
{
  return self->_firstTime;
}

- (void)setFirstTime:(BOOL)a3
{
  self->_firstTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end