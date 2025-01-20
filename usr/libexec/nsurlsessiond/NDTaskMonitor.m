@interface NDTaskMonitor
- (NDTaskMonitor)initWithTask:(id)a3 taskInfo:(id)a4 clientBundleIdentifier:(id)a5 secondaryIdentifier:(id)a6 monitoredApplication:(id)a7 priority:(int64_t)a8 options:(unint64_t)a9 queue:(id)a10;
- (double)currentThroughputThreshold;
- (int64_t)basePriority;
- (int64_t)currentIntervalEndDelta;
- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)backgroundUpdatesDisabledForApplication:(id)a3;
- (void)calculateThroughput;
- (void)cancel;
- (void)setBasePriority:(int64_t)a3;
- (void)setThroughputTimerForCurrentInterval;
- (void)startThroughputMonitoring;
- (void)startThroughputMonitoringIfAppropriate;
- (void)stopThroughputMonitoring;
- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4;
- (void)taskWillResume;
@end

@implementation NDTaskMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UMSyncTask, 0);
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressTimestamps, 0);
  objc_storeStrong((id *)&self->_throughputTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B10C;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B238;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)applicationEnteredForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B308;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)backgroundUpdatesDisabledForApplication:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B494;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B5FC;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancel
{
  [(NDTaskMonitor *)self stopThroughputMonitoring];
  [(NDApplication *)self->_monitoredApplication removeObserver:self];
  if (self->_UMSyncTask)
  {
    v3 = +[NDUserSyncStakeholder sharedStakeholder];
    [v3 endUMTask:self->_UMSyncTask];

    UMSyncTask = self->_UMSyncTask;
    self->_UMSyncTask = 0;
  }
  int powerMonitorToken = self->_powerMonitorToken;
  if (powerMonitorToken != -1)
  {
    notify_cancel(powerMonitorToken);
  }
}

- (void)startThroughputMonitoringIfAppropriate
{
  if (self->_discretionary
    || self->_performsNonDiscretionaryThrougputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0
    && ![(NDApplication *)monitoredApplication isForeground])
  {
    v3 = +[Daemon sharedDaemon];
    unsigned int v4 = [v3 isInSyncBubble];

    if (v4)
    {
      if (self->_powerMonitorToken == -1)
      {
        queue = self->_queue;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10005B8A0;
        handler[3] = &unk_1000B5DA8;
        handler[4] = self;
        notify_register_dispatch("com.apple.system.powersources.source", &self->_powerMonitorToken, queue, handler);
      }
      if ((IOPSDrawingUnlimitedPower() & 1) == 0) {
        [(NDTaskMonitor *)self startThroughputMonitoring];
      }
    }
    else
    {
      [(NDTaskMonitor *)self startThroughputMonitoring];
    }
  }
}

- (void)taskWillResume
{
  if (self->_discretionary
    && !self->_explicitlyDiscretionary
    && [(NDApplication *)self->_monitoredApplication isForeground])
  {
    id v3 = [(NSURLSessionTask *)self->_task error:@"_nsurlsessiondErrorDomain" code:6];
    -[NSURLSessionTask cancel_with_error:](self->_task, "cancel_with_error:");
  }
}

- (void)stopThroughputMonitoring
{
  throughputTimer = self->_throughputTimer;
  if (throughputTimer)
  {
    dispatch_source_cancel(throughputTimer);
    unsigned int v4 = self->_throughputTimer;
    self->_throughputTimer = 0;

    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = 0;

    progressValues = self->_progressValues;
    self->_progressValues = 0;

    self->_throughputInterval = 0;
  }
}

- (void)startThroughputMonitoring
{
  if (!self->_throughputTimer)
  {
    id v3 = +[NSMutableArray array];
    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = v3;

    v5 = +[NSMutableArray array];
    progressValues = self->_progressValues;
    self->_progressValues = v5;

    self->_throughputInterval = 0;
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    throughputTimer = self->_throughputTimer;
    self->_throughputTimer = v7;

    [(NDTaskMonitor *)self setThroughputTimerForCurrentInterval];
    v9 = self->_throughputTimer;
    dispatch_resume(v9);
  }
}

- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4
{
  if (!self->_hasTransferredData) {
    [(NDTaskMonitor *)self startThroughputMonitoringIfAppropriate];
  }
  self->_hasTransferredData = 1;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (![(NSMutableArray *)self->_progressTimestamps count]) {
    self->_throughputMonitoringStartTime = Current;
  }
  if ([(NSMutableArray *)self->_progressTimestamps count]
    && ([(NSMutableArray *)self->_progressTimestamps lastObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 doubleValue],
        CFAbsoluteTime v10 = Current - v9,
        v8,
        v10 <= 1.0))
  {
    v16 = [(NSMutableArray *)self->_progressValues lastObject];
    v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v16 unsignedIntegerValue] + a4 + a3);

    [(NSMutableArray *)self->_progressValues removeLastObject];
    [(NSMutableArray *)self->_progressValues addObject:v15];
  }
  else
  {
    if ((unint64_t)[(NSMutableArray *)self->_progressTimestamps count] >= 0xA)
    {
      [(NSMutableArray *)self->_progressTimestamps removeObjectAtIndex:0];
      [(NSMutableArray *)self->_progressValues removeObjectAtIndex:0];
    }
    progressValues = self->_progressValues;
    v12 = +[NSNumber numberWithLongLong:a4 + a3];
    [(NSMutableArray *)progressValues addObject:v12];

    progressTimestamps = self->_progressTimestamps;
    uint64_t v14 = +[NSNumber numberWithDouble:Current];
    [(NSMutableArray *)progressTimestamps addObject:v14];
    v15 = (void *)v14;
  }

  if ((unint64_t)[(NSMutableArray *)self->_progressTimestamps count] >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    [(NDTaskMonitor *)self calculateThroughput];
  }
}

- (void)setThroughputTimerForCurrentInterval
{
  throughputTimer = self->_throughputTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005BD3C;
  handler[3] = &unk_1000B6380;
  handler[4] = self;
  dispatch_source_set_event_handler(throughputTimer, handler);
  unsigned int v4 = self->_throughputTimer;
  dispatch_time_t v5 = dispatch_time(0, [(NDTaskMonitor *)self currentIntervalEndDelta]);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)calculateThroughput
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = self->_progressValues;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntegerValue:v23];
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v4);
    double v8 = (double)v5;
  }
  else
  {
    double v8 = 0.0;
  }

  double v9 = [(NSMutableArray *)self->_progressTimestamps firstObject];
  CFAbsoluteTime v10 = [(NSMutableArray *)self->_progressTimestamps lastObject];
  [v10 doubleValue];
  double v12 = v11;
  [v9 doubleValue];
  double v14 = v13;
  [(NDTaskMonitor *)self currentThroughputThreshold];
  double v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    v17 = (id)qword_1000CB148;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = [(NSURLSessionTask *)self->_task _loggableDescription];
      [(NDTaskMonitor *)self currentThroughputThreshold];
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 138544386;
      v28 = v19;
      __int16 v29 = 2048;
      double v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      v34 = progressValues;
      __int16 v35 = 2112;
      v36 = progressTimestamps;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ canceling because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@", buf, 0x34u);
    }
    v18 = [(NSURLSessionTask *)self->_task error:@"_nsurlsessiondErrorDomain" code:3];
    [(NSURLSessionTask *)self->_task cancel_with_error:v18];
  }
}

- (int64_t)currentIntervalEndDelta
{
  unint64_t throughputInterval = self->_throughputInterval;
  if (throughputInterval) {
    return (uint64_t)((dbl_100091C08[throughputInterval] - dbl_100091C08[throughputInterval - 1]) * 60.0 * 1000000000.0);
  }
  else {
    return 60000000000;
  }
}

- (double)currentThroughputThreshold
{
  return dbl_100091C50[self->_throughputInterval] * 1024.0;
}

- (NDTaskMonitor)initWithTask:(id)a3 taskInfo:(id)a4 clientBundleIdentifier:(id)a5 secondaryIdentifier:(id)a6 monitoredApplication:(id)a7 priority:(int64_t)a8 options:(unint64_t)a9 queue:(id)a10
{
  id v27 = a3;
  id v28 = a4;
  id v17 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)NDTaskMonitor;
  v18 = [(NDTaskMonitor *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_task, a3);
    objc_storeStrong((id *)&v19->_taskInfo, a4);
    objc_storeStrong((id *)&v19->_queue, a10);
    objc_storeStrong((id *)&v19->_clientBundleIdentifier, a5);
    objc_storeStrong((id *)&v19->_clientSecondaryIdentifier, a6);
    objc_storeStrong((id *)&v19->_monitoredApplication, a7);
    v19->_basePriority = a8;
    v19->_discretionary = a9 & 1;
    v19->_explicitlyDiscretionary = (a9 & 2) != 0;
    v19->_performsNonDiscretionaryThrougputMonitoring = (a9 & 4) != 0;
    v19->_mayBeDemotedToDiscretionary = (a9 & 8) != 0;
    [(NDApplication *)v19->_monitoredApplication addObserver:v19];
    v20 = +[NDUserSyncStakeholder sharedStakeholder];
    uint64_t v21 = [v20 startUMTask:v17 taskInfo:v28];
    UMSyncTask = v19->_UMSyncTask;
    v19->_UMSyncTask = (UMUserSyncTask *)v21;

    v19->_int powerMonitorToken = -1;
  }

  return v19;
}

@end