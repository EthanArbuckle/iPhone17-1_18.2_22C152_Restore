@interface SDTaskContainer
- (BOOL)_execute;
- (BOOL)blockUntilFinished;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (BOOL)runByItself;
- (BOOL)setStartDate:(id)a3 AndExecuteFromCallback:(BOOL)a4;
- (NSDate)startDate;
- (NSMutableArray)directories;
- (NSString)displayName;
- (OS_dispatch_source)timeoutSource;
- (double)elapsedTime;
- (double)timeout;
- (void)applyContainerOverride:(id)a3;
- (void)resetTimeout:(int64_t)a3;
- (void)setBlockUntilFinished:(BOOL)a3;
- (void)setDirectories:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setRunByItself:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutSource:(id)a3;
- (void)startTimeout:(double)a3 withHandler:(id)a4;
@end

@implementation SDTaskContainer

- (void)applyContainerOverride:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"timeout"];
  if (v4)
  {
    id v5 = v4;
    [v4 doubleValue];
    [(SDTaskContainer *)self setTimeout:"setTimeout:"];
    v4 = v5;
  }
}

- (void)resetTimeout:(int64_t)a3
{
  source = [(SDTaskContainer *)self timeoutSource];
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)startTimeout:(double)a3 withHandler:(id)a4
{
  id v6 = a4;
  v7 = +[SDTaskDepot sharedTaskDepot];
  v8 = [v7 taskQueue];
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  [(SDTaskContainer *)self setTimeoutSource:v9];

  [(SDTaskContainer *)self resetTimeout:(uint64_t)a3];
  v10 = [(SDTaskContainer *)self timeoutSource];
  dispatch_source_set_event_handler(v10, v6);

  v11 = [(SDTaskContainer *)self timeoutSource];
  dispatch_resume(v11);
}

- (BOOL)_execute
{
}

- (double)elapsedTime
{
  v3 = +[NSDate date];
  dispatch_time_t v4 = [(SDTaskContainer *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)setStartDate:(id)a3 AndExecuteFromCallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[SDTaskDepot sharedTaskDepot];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v8 = sub_10002820C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v9 = [(SDContainer *)self name];
    *(_DWORD *)buf = 138412290;
    double v29 = *(double *)&v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Executing task container: %@", buf, 0xCu);
  }
  v10 = +[SDResourceManager sharedResourceManager];
  v11 = [(SDContainer *)self name];
  [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing task container: %@", v11 category msg];

  if (v4)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100043434;
    v22[3] = &unk_10009D248;
    v22[4] = self;
    v23[0] = v6;
    v23[1] = &v24;
    double v12 = sub_100028914(v22);
    v13 = sub_10002820C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(SDContainer *)self name];
      *(_DWORD *)buf = 134218242;
      double v29 = v12;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "taskQueue thread spent %.1f seconds blocked waiting for %@ to finish", buf, 0x16u);
    }
    v15 = +[SDResourceManager sharedResourceManager];
    v16 = [(SDContainer *)self name];
    [v15 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"taskQueue thread spent %.1f seconds blocked waiting for %@ to finish", *(void *)&v12, v16 category msg];

    v17 = (id *)v23;
  }
  else
  {
    v15 = [v7 taskQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043470;
    block[3] = &unk_10009D248;
    block[4] = self;
    v17 = (id *)v21;
    v21[0] = v6;
    v21[1] = &v24;
    dispatch_sync(v15, block);
  }

  BOOL v18 = *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  return v18;
}

- (BOOL)executeFromCallback
{
  unsigned __int8 v3 = [(SDTaskContainer *)self blockUntilFinished];
  unsigned int v4 = [(SDTaskContainer *)self runByItself];
  if ((v3 & 1) != 0 || v4) {
    sub_100064984();
  }
  [(SDContainer *)self updateContainerWithOverride];
  if (![(SDContainer *)self evaluateCollectionFlags]) {
    return 0;
  }
  double v5 = +[NSDate date];
  BOOL v6 = 1;
  unsigned __int8 v7 = [(SDTaskContainer *)self setStartDate:v5 AndExecuteFromCallback:1];

  if ((v7 & 1) == 0)
  {
    v8 = sub_10002820C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000649B0(self);
    }

    dispatch_source_t v9 = +[SDResourceManager sharedResourceManager];
    v10 = [(SDContainer *)self name];
    [v9 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to execute %@", v10 category msg];

    return 0;
  }
  return v6;
}

- (BOOL)execute
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(SDContainer *)self executionActivity];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004369C;
  v5[3] = &unk_10009D008;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableArray)directories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDirectories:(id)a3
{
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)runByItself
{
  return self->_runByItself;
}

- (void)setRunByItself:(BOOL)a3
{
  self->_runByItself = a3;
}

- (BOOL)blockUntilFinished
{
  return self->_blockUntilFinished;
}

- (void)setBlockUntilFinished:(BOOL)a3
{
  self->_blockUntilFinished = a3;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);

  objc_storeStrong((id *)&self->_directories, 0);
}

@end