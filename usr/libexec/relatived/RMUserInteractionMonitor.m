@interface RMUserInteractionMonitor
+ (id)userInteractionMonitor;
- (OS_dispatch_queue)queue;
- (double)lastUserInteractionUpdateTimestamp;
- (id)handler;
- (void)sendUserInteractionUpdate;
- (void)setHandler:(id)a3;
- (void)setLastUserInteractionUpdateTimestamp:(double)a3;
- (void)setQueue:(id)a3;
- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopUserInteractionUpdates;
@end

@implementation RMUserInteractionMonitor

+ (id)userInteractionMonitor
{
  v2 = objc_opt_new();

  return v2;
}

- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024E30);
  }
  v8 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Starting user interaction monitoring", v9, 2u);
  }
  [(RMUserInteractionMonitor *)self setQueue:v6];
  [(RMUserInteractionMonitor *)self setHandler:v7];
}

- (void)stopUserInteractionUpdates
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024E30);
  }
  v2 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Stopping user interaction monitoring", v3, 2u);
  }
}

- (void)sendUserInteractionUpdate
{
  uint64_t v3 = [(RMUserInteractionMonitor *)self queue];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(RMUserInteractionMonitor *)self handler];

    if (v5)
    {
      double v6 = sub_10000CF5C();
      [(RMUserInteractionMonitor *)self lastUserInteractionUpdateTimestamp];
      if (v6 - v7 >= 0.5)
      {
        [(RMUserInteractionMonitor *)self setLastUserInteractionUpdateTimestamp:v6];
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100024E30);
        }
        v8 = qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Sending user interaction update", buf, 2u);
        }
        v9 = [(RMUserInteractionMonitor *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D7CC;
        block[3] = &unk_100024908;
        block[4] = self;
        dispatch_async(v9, block);
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (double)lastUserInteractionUpdateTimestamp
{
  return self->_lastUserInteractionUpdateTimestamp;
}

- (void)setLastUserInteractionUpdateTimestamp:(double)a3
{
  self->_lastUserInteractionUpdateTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end