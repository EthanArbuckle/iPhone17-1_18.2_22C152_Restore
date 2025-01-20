@interface FMFCommandCoalescer
+ (id)sharedInstance;
- (NSMutableArray)coalescedCommands;
- (OS_dispatch_queue)queue;
- (double)_highPriorityRefreshInterval;
- (double)_timeTillMinCallback;
- (int64_t)coleasedRefreshPriority;
- (int64_t)refreshScheduled;
- (int64_t)sequencer;
- (void)_scheduleRefresh;
- (void)_sendRefreshOfType:(id)a3;
- (void)refreshLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8;
- (void)setCoalescedCommands:(id)a3;
- (void)setColeasedRefreshPriority:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRefreshScheduled:(int64_t)a3;
- (void)setSequencer:(int64_t)a3;
@end

@implementation FMFCommandCoalescer

+ (id)sharedInstance
{
  if (qword_1000BB808 != -1) {
    dispatch_once(&qword_1000BB808, &stru_1000A2890);
  }
  v2 = (void *)qword_1000BB800;

  return v2;
}

- (void)_sendRefreshOfType:(id)a3
{
  id v4 = a3;
  v5 = [(FMFCommandCoalescer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000374B4;
  v7[3] = &unk_1000A1468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (double)_timeTillMinCallback
{
  v2 = +[FMFCommandManager sharedInstance];
  [v2 lastSuccessfulResponseTimestamp];
  double v4 = v3;

  v5 = +[FMFDataManager sharedInstance];
  [v5 minCallbackInterval];
  double v7 = v6;

  id v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  double v10 = v9 - v4;

  return v7 - v10;
}

- (double)_highPriorityRefreshInterval
{
  v2 = +[FMFDataManager sharedInstance];
  [v2 userLocateWaitIntervalInMS];
  double v4 = v3;

  double result = v4 / 1000.0;
  if (v4 <= 0.0) {
    return 0.2;
  }
  return result;
}

- (void)_scheduleRefresh
{
  int64_t v3 = [(FMFCommandCoalescer *)self coleasedRefreshPriority];
  if ((id)[(FMFCommandCoalescer *)self refreshScheduled] == (id)2)
  {
    double v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]");
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Skipping since we already have a high priority refresh queued", buf, 0xCu);
    }
LABEL_4:

    return;
  }
  if (v3 == 1)
  {
    [(FMFCommandCoalescer *)self _highPriorityRefreshInterval];
    double v7 = v6;
    char v8 = 1;
  }
  else
  {
    if ([(FMFCommandCoalescer *)self refreshScheduled]
      || ([(FMFCommandCoalescer *)self coalescedCommands],
          v22 = objc_claimAutoreleasedReturnValue(),
          id v23 = [v22 count],
          v22,
          !v23))
    {
      double v4 = sub_100005560();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]");
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Returning since there is no need to schedule a refresh", buf, 0xCu);
      }
      goto LABEL_4;
    }
    [(FMFCommandCoalescer *)self _timeTillMinCallback];
    double v7 = v24;
    char v8 = 0;
  }
  double v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]");
    CFStringRef v11 = @"lowPriority";
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    if (v3 == 1) {
      CFStringRef v11 = @"highPriority";
    }
    __int16 v31 = 2112;
    CFStringRef v32 = v11;
    __int16 v33 = 2048;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Trying to schedule a %@ refresh after %f", buf, 0x20u);
  }
  if (v3 == 1) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  [(FMFCommandCoalescer *)self setRefreshScheduled:v12];
  if (*(double *)&v7 <= 0.0)
  {
    CFStringRef v20 = @"lowPriority";
    if (v3 == 1) {
      CFStringRef v20 = @"highPriority";
    }
    v21 = +[NSString stringWithFormat:@"immediate-%@(after %f)", v20, v7];
    [(FMFCommandCoalescer *)self _sendRefreshOfType:v21];
  }
  else
  {
    v13 = (char *)[(FMFCommandCoalescer *)self sequencer] + 1;
    [(FMFCommandCoalescer *)self setSequencer:v13];
    objc_initWeak(&location, self);
    v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]");
      CFStringRef v16 = @"lowPriority";
      *(_DWORD *)buf = 138412802;
      v30 = v15;
      if (v3 == 1) {
        CFStringRef v16 = @"highPriority";
      }
      __int16 v31 = 2112;
      CFStringRef v32 = v16;
      __int16 v33 = 2048;
      v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Queuing a dispatch_after for request(%@) with sequenceNumber: %ld", buf, 0x20u);
    }
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(*(double *)&v7 * 1000000000.0));
    v18 = [(FMFCommandCoalescer *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038210;
    block[3] = &unk_1000A2908;
    objc_copyWeak(v26, &location);
    v26[1] = v13;
    char v27 = v8;
    v26[2] = v7;
    dispatch_after(v17, v18, block);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
}

- (void)refreshLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [(FMFCommandCoalescer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038618;
  block[3] = &unk_1000A2930;
  void block[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  int64_t v28 = a6;
  int64_t v29 = a7;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v18, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)coleasedRefreshPriority
{
  return self->_coleasedRefreshPriority;
}

- (void)setColeasedRefreshPriority:(int64_t)a3
{
  self->_coleasedRefreshPriority = a3;
}

- (int64_t)refreshScheduled
{
  return self->_refreshScheduled;
}

- (void)setRefreshScheduled:(int64_t)a3
{
  self->_refreshScheduled = a3;
}

- (int64_t)sequencer
{
  return self->_sequencer;
}

- (void)setSequencer:(int64_t)a3
{
  self->_sequencer = a3;
}

- (NSMutableArray)coalescedCommands
{
  return self->_coalescedCommands;
}

- (void)setCoalescedCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedCommands, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end