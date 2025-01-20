@interface EventMonitor
+ (id)sharedEventMonitor;
- (EventMonitor)init;
- (id)monitorEvent:(id)a3;
- (void)_cancelPollTimer;
- (void)_fireEventsAfterPollTimer;
- (void)_reloadPollTimer;
- (void)_willRemoveEvent:(id)a3;
- (void)dealloc;
- (void)removeEvent:(id)a3;
@end

@implementation EventMonitor

- (EventMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)EventMonitor;
  v2 = [(EventMonitor *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EventMonitor", 0);
  }
  return v2;
}

- (void)dealloc
{
  [(EventMonitor *)self _cancelPollTimer];
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)EventMonitor;
  [(EventMonitor *)&v3 dealloc];
}

+ (id)sharedEventMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C4A4;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401E58 != -1) {
    dispatch_once(&qword_100401E58, block);
  }
  return (id)qword_100401E50;
}

- (id)monitorEvent:(id)a3
{
  id v4 = [a3 copy];
  [v4 _setLastOccurrenceCheckTime:CFAbsoluteTimeGetCurrent()];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011C568;
  v7[3] = &unk_1003A3380;
  v7[4] = self;
  v7[5] = v4;
  dispatch_sync(dispatchQueue, v7);
  return v4;
}

- (void)removeEvent:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011C664;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)_cancelPollTimer
{
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pollTimer);
    dispatch_release((dispatch_object_t)self->_pollTimer);
    self->_pollTimer = 0;
  }
}

- (void)_fireEventsAfterPollTimer
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  double Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"EventMonitor");
  uint64_t v5 = (uint64_t)[(NSMutableArray *)self->_events count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      id v7 = [(NSMutableArray *)self->_events objectAtIndex:v6 - 2];
      [v7 _lastOccurrenceCheckTime];
      if (vabdd_f64(Current, v8 + (double)(uint64_t)[v7 pollInterval]) < 0.5)
      {
        if ([v7 hasOccurred])
        {
          [v3 addObject:v7];
          [(EventMonitor *)self _willRemoveEvent:v7];
          [(NSMutableArray *)self->_events removeObjectAtIndex:v6 - 2];
        }
        else
        {
          [v7 _setLastOccurrenceCheckTime:Current];
        }
      }
      --v6;
    }
    while (v6 > 1);
  }
  if ([v3 count])
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011C8B8;
    block[3] = &unk_1003A33A8;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }
  else
  {
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "releaseKeepAliveAssertion:", @"EventMonitor");
  }
  [(EventMonitor *)self _cancelPollTimer];
  [(EventMonitor *)self _reloadPollTimer];
}

- (void)_reloadPollTimer
{
  if ([(NSMutableArray *)self->_events count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    events = self->_events;
    id v4 = [(NSMutableArray *)events countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v34;
      double v7 = 1.79769313e308;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(events);
          }
          v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (v7 >= (double)(uint64_t)[v9 pollInterval]) {
            double v7 = (double)(uint64_t)[v9 pollInterval];
          }
        }
        id v5 = [(NSMutableArray *)events countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 1.79769313e308;
    }
    double v10 = fmax(v7, 10.0);
    if (self->_pollTimer)
    {
      double v11 = v10 + self->_lastPollTime;
      double Current = CFAbsoluteTimeGetCurrent();
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig];
      }
      double v14 = v11 - Current;
      unsigned int v15 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        int v37 = 138412546;
        uint64_t v38 = v17;
        __int16 v39 = 2048;
        double v40 = v14;
        LODWORD(v31) = 22;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v37, v31);
          free(v19);
          SSFileLog();
        }
      }
      pollTimer = self->_pollTimer;
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)pollTimer, v21, (unint64_t)(v10 * 1000000000.0), 0);
    }
    else
    {
      id v22 = +[SSLogConfig sharedDaemonConfig];
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig];
      }
      unsigned int v23 = [v22 shouldLog];
      if ([v22 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v24 &= 2u;
      }
      if (v24)
      {
        uint64_t v25 = objc_opt_class();
        int v37 = 138412546;
        uint64_t v38 = v25;
        __int16 v39 = 2048;
        double v40 = v10;
        LODWORD(v31) = 22;
        uint64_t v26 = _os_log_send_and_compose_impl();
        if (v26)
        {
          v27 = (void *)v26;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v37, v31);
          free(v27);
          SSFileLog();
        }
      }
      self->_lastPollTime = CFAbsoluteTimeGetCurrent();
      v28 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      self->_pollTimer = v28;
      dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v28, v29, (unint64_t)(v10 * 1000000000.0), 0);
      v30 = self->_pollTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10011CDC4;
      handler[3] = &unk_1003A33A8;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v30, handler);
      dispatch_resume((dispatch_object_t)self->_pollTimer);
    }
  }
  else
  {
    [(EventMonitor *)self _cancelPollTimer];
  }
}

- (void)_willRemoveEvent:(id)a3
{
  if ([a3 shouldKeepDaemonAlive])
  {
    id v3 = +[Daemon daemon];
    [v3 releaseKeepAliveAssertion:@"EventMonitor"];
  }
}

@end