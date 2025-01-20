@interface NDAVThroughputMonitor
- (NDAVThroughputMonitor)initWithWrapper:(id)a3 monitoredApplication:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 queue:(id)a7;
- (double)currentIntervalThroughputThreshold;
- (int64_t)basePriority;
- (int64_t)currentIntervalDuration;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)calculateThroughput;
- (void)cancel;
- (void)setBasePriority:(int64_t)a3;
- (void)setThroughputTimerForCurrentInterval;
- (void)startThroughputMonitoring;
- (void)startThroughputMonitoringIfAppropriate;
- (void)stopThroughputMonitoring;
- (void)wrapperTransferredData:(unint64_t)a3;
@end

@implementation NDAVThroughputMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressTimestamps, 0);
  objc_storeStrong((id *)&self->_throughputTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_wrapper, 0);
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (void)applicationNoLongerInForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000638E0;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)applicationEnteredForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063970;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setThroughputTimerForCurrentInterval
{
  throughputTimer = self->_throughputTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100063A9C;
  handler[3] = &unk_1000B6380;
  handler[4] = self;
  dispatch_source_set_event_handler(throughputTimer, handler);
  v4 = self->_throughputTimer;
  dispatch_time_t v5 = dispatch_time(0, [(NDAVThroughputMonitor *)self currentIntervalDuration]);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (double)currentIntervalThroughputThreshold
{
  return dbl_100091C50[self->_throughputInterval] * 1024.0;
}

- (int64_t)currentIntervalDuration
{
  unint64_t throughputInterval = self->_throughputInterval;
  if (throughputInterval) {
    return (uint64_t)((dbl_100091C08[throughputInterval] - dbl_100091C08[throughputInterval - 1]) * 60.0 * 1000000000.0);
  }
  else {
    return 60000000000;
  }
}

- (void)calculateThroughput
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = self->_progressValues;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
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
        v5 += (unint64_t)[(*(id *)(*((void *)&v23 + 1) + 8 * i)) unsignedLongLongValue:v23];
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v4);
    double v8 = (double)v5;
  }
  else
  {
    double v8 = 0.0;
  }

  v9 = [(NSMutableArray *)self->_progressTimestamps firstObject];
  v10 = [(NSMutableArray *)self->_progressTimestamps lastObject];
  [v10 doubleValue];
  double v12 = v11;
  [v9 doubleValue];
  double v14 = v13;
  [(NDAVThroughputMonitor *)self currentIntervalThroughputThreshold];
  double v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    v17 = (id)qword_1000CB148;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [(NDAVThroughputMonitor *)self currentIntervalThroughputThreshold];
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 134218754;
      double v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      v32 = progressValues;
      __int16 v33 = 2112;
      v34 = progressTimestamps;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Canceling AVAssetTask because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@", buf, 0x2Au);
    }

    v18 = [(NDAVAssetDownloadSessionWrapper *)self->_wrapper URL];
    v19 = +[NSURLError _web_errorWithDomain:@"_nsurlsessiondErrorDomain" code:3 URL:v18];

    [(NDAVAssetDownloadSessionWrapper *)self->_wrapper cancelAndDeliverError:v19];
  }
}

- (void)stopThroughputMonitoring
{
  throughputTimer = self->_throughputTimer;
  if (throughputTimer)
  {
    dispatch_source_cancel(throughputTimer);
    id v4 = self->_throughputTimer;
    self->_throughputTimer = 0;

    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = 0;

    progressValues = self->_progressValues;
    self->_progressValues = 0;

    self->_unint64_t throughputInterval = 0;
  }
}

- (void)startThroughputMonitoring
{
  if (!self->_throughputTimer)
  {
    v3 = +[NSMutableArray array];
    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = v3;

    unint64_t v5 = +[NSMutableArray array];
    progressValues = self->_progressValues;
    self->_progressValues = v5;

    self->_unint64_t throughputInterval = 0;
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    throughputTimer = self->_throughputTimer;
    self->_throughputTimer = v7;

    [(NDAVThroughputMonitor *)self setThroughputTimerForCurrentInterval];
    v9 = self->_throughputTimer;
    dispatch_resume(v9);
  }
}

- (void)startThroughputMonitoringIfAppropriate
{
  if (self->_discretionary
    || self->_performsNonDiscretionaryThroughputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0
    && ![(NDApplication *)monitoredApplication isForeground])
  {
    [(NDAVThroughputMonitor *)self startThroughputMonitoring];
  }
}

- (void)wrapperTransferredData:(unint64_t)a3
{
  if (!self->_hasTransferredData) {
    [(NDAVThroughputMonitor *)self startThroughputMonitoringIfAppropriate];
  }
  self->_hasTransferredData = 1;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (![(NSMutableArray *)self->_progressTimestamps count]) {
    self->_throughputMonitoringStartTime = Current;
  }
  if ([(NSMutableArray *)self->_progressTimestamps count]
    && ([(NSMutableArray *)self->_progressTimestamps lastObject],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 doubleValue],
        CFAbsoluteTime v8 = Current - v7,
        v6,
        v8 <= 1.0))
  {
    double v14 = [(NSMutableArray *)self->_progressValues lastObject];
    double v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v14 unsignedLongLongValue] + a3);

    [(NSMutableArray *)self->_progressValues removeLastObject];
    [(NSMutableArray *)self->_progressValues addObject:v13];
  }
  else
  {
    if ((unint64_t)[(NSMutableArray *)self->_progressTimestamps count] >= 0xA)
    {
      [(NSMutableArray *)self->_progressTimestamps removeObjectAtIndex:0];
      [(NSMutableArray *)self->_progressValues removeObjectAtIndex:0];
    }
    progressTimestamps = self->_progressTimestamps;
    v10 = +[NSNumber numberWithDouble:Current];
    [(NSMutableArray *)progressTimestamps addObject:v10];

    progressValues = self->_progressValues;
    uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableArray *)progressValues addObject:v12];
    double v13 = (void *)v12;
  }

  if ((unint64_t)[(NSMutableArray *)self->_progressTimestamps count] >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    [(NDAVThroughputMonitor *)self calculateThroughput];
  }
}

- (void)cancel
{
  [(NDAVThroughputMonitor *)self stopThroughputMonitoring];
  monitoredApplication = self->_monitoredApplication;

  [(NDApplication *)monitoredApplication removeObserver:self];
}

- (NDAVThroughputMonitor)initWithWrapper:(id)a3 monitoredApplication:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 queue:(id)a7
{
  char v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NDAVThroughputMonitor;
  double v16 = [(NDAVThroughputMonitor *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wrapper, a3);
    objc_storeStrong((id *)&v17->_queue, a7);
    objc_storeStrong((id *)&v17->_monitoredApplication, a4);
    v17->_basePriority = a5;
    v17->_discretionary = v8 & 1;
    v17->_explicitlyDiscretionary = (v8 & 2) != 0;
    v17->_performsNonDiscretionaryThroughputMonitoring = (v8 & 4) != 0;
    [(NDApplication *)v17->_monitoredApplication addObserver:v17];
  }

  return v17;
}

@end