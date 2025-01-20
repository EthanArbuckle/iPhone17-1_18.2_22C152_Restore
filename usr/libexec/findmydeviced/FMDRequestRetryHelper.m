@interface FMDRequestRetryHelper
- (FMDRequest)request;
- (FMDRequestRetryHelper)initWithRequest:(id)a3 retryAction:(id)a4;
- (NSDate)lastRetryTime;
- (NSDate)nextRetryTime;
- (NSMutableDictionary)consecutiveRetriesByType;
- (NSMutableDictionary)totalRetriesByType;
- (NSString)lastRetryType;
- (NSString)nextRetryType;
- (PCPersistentTimer)retryTimer;
- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3;
- (id)retryAction;
- (int)_consecutiveRetryCountForType:(id)a3;
- (int)_retryCountForType:(id)a3;
- (int64_t)totalRetryCount;
- (void)_incrementRetryCountForType:(id)a3;
- (void)_networkCameUp;
- (void)_networkStateChanged:(id)a3;
- (void)_retryNow;
- (void)_retryTimerFired;
- (void)_scheduleRetryAfterTimeInterval:(double)a3;
- (void)checkAndScheduleRetries;
- (void)dealloc;
- (void)deinitializeHelper;
- (void)setConsecutiveRetriesByType:(id)a3;
- (void)setLastRetryTime:(id)a3;
- (void)setLastRetryType:(id)a3;
- (void)setNextRetryTime:(id)a3;
- (void)setNextRetryType:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRetryAction:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setTotalRetriesByType:(id)a3;
- (void)setTotalRetryCount:(int64_t)a3;
@end

@implementation FMDRequestRetryHelper

- (FMDRequestRetryHelper)initWithRequest:(id)a3 retryAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FMDRequestRetryHelper;
  v8 = [(FMDRequestRetryHelper *)&v13 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v7);
    id retryAction = v8->_retryAction;
    v8->_id retryAction = v9;

    objc_storeWeak((id *)&v8->_request, v6);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v8 selector:"_networkStateChanged:" name:FMLocalNetworkStatusChangedNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(FMDRequestRetryHelper *)self deinitializeHelper];
  v3.receiver = self;
  v3.super_class = (Class)FMDRequestRetryHelper;
  [(FMDRequestRetryHelper *)&v3 dealloc];
}

- (void)deinitializeHelper
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:FMLocalNetworkStatusChangedNotification object:0];

  v4 = [(FMDRequestRetryHelper *)self retryTimer];
  [v4 invalidate];

  [(FMDRequestRetryHelper *)self setRetryTimer:0];
  [(FMDRequestRetryHelper *)self setNextRetryTime:0];
  [(FMDRequestRetryHelper *)self setRetryAction:0];

  [(FMDRequestRetryHelper *)self setRequest:0];
}

- (void)checkAndScheduleRetries
{
  [(FMDRequestRetryHelper *)self setNextRetryType:0];
  objc_super v3 = [(FMDRequestRetryHelper *)self request];
  if (!v3) {
    [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
  }
  v4 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v4)
  {
  }
  else if ([v3 completed])
  {
    v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v52 = 138412546;
      *(void *)&v52[4] = objc_opt_class();
      *(_WORD *)&v52[12] = 2048;
      *(void *)&v52[14] = v3;
      id v6 = *(id *)&v52[4];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request is complete", v52, 0x16u);
    }
    [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
  }
  id v7 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v7)
  {
  }
  else if (([v3 canRequestBeRetriedNow] & 1) == 0)
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)v52 = 138412546;
      *(void *)&v52[4] = v9;
      *(_WORD *)&v52[12] = 2048;
      *(void *)&v52[14] = v3;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request cannot be retried anymore. Not scheduling any more retries", v52, 0x16u);
    }
    [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
  }
  v11 = [(FMDRequestRetryHelper *)self nextRetryType];

  double v12 = -1.0;
  if (!v11)
  {
    objc_super v13 = [v3 httpResponseHeaders];
    v14 = [v13 objectForKeyedSubscript:@"X-Apple-Retry-After"];

    if (v14)
    {
      [v14 doubleValue];
      if (v15 < 0.0)
      {
        v16 = sub_100004238();
        double v17 = -1.0;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_opt_class();
          *(_DWORD *)v52 = 138412546;
          *(void *)&v52[4] = v18;
          *(_WORD *)&v52[12] = 2048;
          *(void *)&v52[14] = v3;
          id v19 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Server requested that no more retries be done.", v52, 0x16u);
        }
        CFStringRef v20 = @"NoMoreRetries";
LABEL_25:

        [(FMDRequestRetryHelper *)self setNextRetryType:v20];
        double v12 = v17;
        goto LABEL_26;
      }
      if (v15 > 0.0)
      {
        double v17 = v15;
        v16 = sub_100004238();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_opt_class();
          *(_DWORD *)v52 = 138412802;
          *(void *)&v52[4] = v21;
          *(_WORD *)&v52[12] = 2048;
          *(void *)&v52[14] = v3;
          *(_WORD *)&v52[22] = 2048;
          double v53 = v17;
          id v22 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Server requested a retry after %f seconds", v52, 0x20u);
        }
        CFStringRef v20 = @"ServerDelayedRetry";
        goto LABEL_25;
      }
    }
LABEL_26:
  }
  v23 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v23)
  {
  }
  else if ([v3 responseErrorType] == (id)257)
  {
    [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
  }
  uint64_t v24 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v24)
  {
    v25 = (void *)v24;
LABEL_33:

    goto LABEL_36;
  }
  if ([v3 responseErrorType] == (id)514
    && ![(FMDRequestRetryHelper *)self _retryCountForType:@"TryOriginalHost"])
  {
    [(FMDRequestRetryHelper *)self setNextRetryType:@"TryOriginalHost"];
    v25 = [v3 authId];
    +[FMDRealmSupport clearCachedHostsWithContext:v25];
    double v12 = 0.0;
    goto LABEL_33;
  }
LABEL_36:
  v26 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v26)
  {
  }
  else if (((unint64_t)[v3 responseErrorType] & 0x200) != 0)
  {
    uint64_t v27 = [(FMDRequestRetryHelper *)self _retryCountForType:@"TimerBasedNetworkRetry"];
    if ([v3 maxTimerBasedNetworkRetries] == (id)-1
      || (uint64_t)[v3 maxTimerBasedNetworkRetries] > v27)
    {
      [(FMDRequestRetryHelper *)self setNextRetryType:@"TimerBasedNetworkRetry"];
      [(FMDRequestRetryHelper *)self _decayedWaitIntervalForRetryCount:v27];
      double v12 = v28;
    }
    else
    {
      signed int v29 = [(FMDRequestRetryHelper *)self _consecutiveRetryCountForType:@"NotificationBasedNetworkRetry"];
      if ([v3 maxConsecutiveNetworkNotificationRetries] == (id)-1
        || (uint64_t)[v3 maxConsecutiveNetworkNotificationRetries] > v29)
      {
        [(FMDRequestRetryHelper *)self setNextRetryType:@"NotificationBasedNetworkRetry"];
        v30 = sub_100004238();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_opt_class();
          *(_DWORD *)v52 = 138412546;
          *(void *)&v52[4] = v31;
          *(_WORD *)&v52[12] = 2048;
          *(void *)&v52[14] = v3;
          id v32 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Waiting for a network-up notification to retry again", v52, 0x16u);
        }
        double v12 = -1.0;
      }
      else
      {
        [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
        v33 = sub_100004238();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = objc_opt_class();
          *(_DWORD *)v52 = 138412546;
          *(void *)&v52[4] = v34;
          *(_WORD *)&v52[12] = 2048;
          *(void *)&v52[14] = v3;
          id v35 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of consecutive network-up notification based retries", v52, 0x16u);
        }
      }
    }
  }
  v36 = [(FMDRequestRetryHelper *)self nextRetryType];
  if (v36)
  {
  }
  else if ([v3 responseErrorType] == (id)1025)
  {
    signed int v37 = [(FMDRequestRetryHelper *)self _retryCountForType:@"RedirectRetry"];
    if (v37)
    {
      uint64_t v38 = v37;
      if ([v3 maxNonNetworkRelatedRetries] == (id)-1
        || (uint64_t)[v3 maxNonNetworkRelatedRetries] > v38)
      {
        [(FMDRequestRetryHelper *)self setNextRetryType:@"RedirectRetry"];
        [(FMDRequestRetryHelper *)self _decayedWaitIntervalForRetryCount:v38];
        double v12 = v39;
      }
      else
      {
        [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
        v40 = sub_100004238();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = objc_opt_class();
          *(_DWORD *)v52 = 138412546;
          *(void *)&v52[4] = v41;
          *(_WORD *)&v52[12] = 2048;
          *(void *)&v52[14] = v3;
          id v42 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of redirect retries", v52, 0x16u);
        }
      }
    }
    else
    {
      [(FMDRequestRetryHelper *)self setNextRetryType:@"RedirectRetry"];
      double v12 = 0.0;
    }
  }
  v43 = [(FMDRequestRetryHelper *)self nextRetryType];

  if (!v43)
  {
    v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 httpResponseStatus]);
    v45 = [v44 stringValue];

    uint64_t v46 = [(FMDRequestRetryHelper *)self _retryCountForType:v45];
    if ([v3 maxNonNetworkRelatedRetries] == (id)-1
      || (uint64_t)[v3 maxNonNetworkRelatedRetries] > v46)
    {
      [(FMDRequestRetryHelper *)self setNextRetryType:v45];
      [(FMDRequestRetryHelper *)self _decayedWaitIntervalForRetryCount:v46];
      double v12 = v47;
    }
    else
    {
      [(FMDRequestRetryHelper *)self setNextRetryType:@"NoMoreRetries"];
      v48 = sub_100004238();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_opt_class();
        *(_DWORD *)v52 = 138412802;
        *(void *)&v52[4] = v49;
        *(_WORD *)&v52[12] = 2048;
        *(void *)&v52[14] = v3;
        *(_WORD *)&v52[22] = 2112;
        double v53 = *(double *)&v45;
        id v50 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of retries for status code %@", v52, 0x20u);
      }
    }
  }
  v51 = [(FMDRequestRetryHelper *)self nextRetryType];
  [v3 setWillRetry:^1[v51 isEqualToString:@"NoMoreRetries"]];

  [(FMDRequestRetryHelper *)self _scheduleRetryAfterTimeInterval:v12];
}

- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3
{
  v4 = [(FMDRequestRetryHelper *)self request];
  [v4 firstRetryInterval];
  double v6 = v5;
  [v4 retryIntervalDecayFactor];
  double v8 = v6 * pow(v7, (double)a3);
  [v4 maxRetryInterval];
  if (v9 > -1.0)
  {
    [v4 maxRetryInterval];
    if (v8 > v10)
    {
      [v4 maxRetryInterval];
      double v8 = v11;
    }
  }

  return v8;
}

- (void)_retryTimerFired
{
  objc_super v3 = [(FMDRequestRetryHelper *)self retryTimer];
  [v3 invalidate];

  [(FMDRequestRetryHelper *)self setRetryTimer:0];
  [(FMDRequestRetryHelper *)self setNextRetryTime:0];
  v4 = [(FMDRequestRetryHelper *)self request];
  if ([v4 canRequestBeRetriedNow] && !objc_msgSend(v4, "inProgress"))
  {
    [(FMDRequestRetryHelper *)self _retryNow];
  }
  else
  {
    double v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      double v10 = v4;
      id v6 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Retry time arrived, but request cannot be retried anymore or retry is already in progress. Not retrying", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_retryNow
{
  objc_super v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A7D0;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_networkCameUp
{
  objc_super v3 = [(FMDRequestRetryHelper *)self request];
  v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v27 = 138412546;
    *(void *)&v27[4] = objc_opt_class();
    *(_WORD *)&v27[12] = 2048;
    *(void *)&v27[14] = v3;
    id v5 = *(id *)&v27[4];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Network came up", v27, 0x16u);
  }
  if ([v3 canRequestBeRetriedNow]
    && ([v3 inProgress] & 1) == 0)
  {
    id v6 = [(FMDRequestRetryHelper *)self nextRetryType];
    if ([v6 isEqualToString:@"TimerBasedNetworkRetry"])
    {

      goto LABEL_8;
    }
    int v7 = [(FMDRequestRetryHelper *)self nextRetryType];
    unsigned int v8 = [v7 isEqualToString:@"NotificationBasedNetworkRetry"];

    if (v8)
    {
LABEL_8:
      __int16 v9 = +[NSDate date];
      double v10 = [(FMDRequestRetryHelper *)self nextRetryType];
      if ([v10 isEqualToString:@"NotificationBasedNetworkRetry"])
      {
        double v11 = [(FMDRequestRetryHelper *)self nextRetryTime];

        if (v11)
        {
          double v12 = sub_100004238();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v13 = objc_opt_class();
            id v14 = v13;
            double v15 = [(FMDRequestRetryHelper *)self nextRetryTime];
            *(_DWORD *)uint64_t v27 = 138412802;
            *(void *)&v27[4] = v13;
            *(_WORD *)&v27[12] = 2048;
            *(void *)&v27[14] = v3;
            *(_WORD *)&v27[22] = 2112;
            double v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Network up retry already pending for %@", v27, 0x20u);
          }
          goto LABEL_28;
        }
      }
      else
      {
      }
      v16 = [(FMDRequestRetryHelper *)self lastRetryType];
      if ([v16 isEqualToString:@"NotificationBasedNetworkRetry"])
      {
        double v17 = [(FMDRequestRetryHelper *)self lastRetryTime];

        if (v17)
        {
          v18 = [(FMDRequestRetryHelper *)self lastRetryTime];
          [v9 timeIntervalSinceDate:v18];
          double v20 = v19;

          if (v20 >= 60.0 || v20 < 0.0) {
            double v22 = 0.0;
          }
          else {
            double v22 = 60.0 - v20;
          }
          goto LABEL_23;
        }
      }
      else
      {
      }
      double v22 = 0.0;
LABEL_23:
      v23 = [(FMDRequestRetryHelper *)self nextRetryTime];

      if (!v23
        || ([(FMDRequestRetryHelper *)self nextRetryTime],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            [v24 timeIntervalSinceDate:v9],
            double v26 = v25,
            v24,
            v26 < 0.0)
        || v26 >= v22)
      {
        [(FMDRequestRetryHelper *)self _scheduleRetryAfterTimeInterval:v22];
        goto LABEL_30;
      }
      double v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10023D56C((uint64_t)v3, self, v12);
      }
LABEL_28:

LABEL_30:
    }
  }
}

- (void)_scheduleRetryAfterTimeInterval:(double)a3
{
  id v5 = [(FMDRequestRetryHelper *)self request];
  if (a3 <= 0.0)
  {
    v16 = sub_100004238();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (a3 >= 0.0)
    {
      if (v17)
      {
        double v19 = objc_opt_class();
        id v20 = v19;
        v21 = [(FMDRequestRetryHelper *)self nextRetryType];
        *(_DWORD *)buf = 138412802;
        id v24 = v19;
        __int16 v25 = 2048;
        double v26 = v5;
        __int16 v27 = 2112;
        double v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Scheduling retry of type '%@' to occur now", buf, 0x20u);
      }
      double v22 = +[NSDate date];
      [(FMDRequestRetryHelper *)self setNextRetryTime:v22];

      [(FMDRequestRetryHelper *)self _retryNow];
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412546;
        id v24 = (id)objc_opt_class();
        __int16 v25 = 2048;
        double v26 = v5;
        id v18 = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Not scheduling any retry", buf, 0x16u);
      }
      [(FMDRequestRetryHelper *)self setNextRetryTime:0];
    }
  }
  else
  {
    id v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    [(FMDRequestRetryHelper *)self setNextRetryTime:v6];

    int v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = objc_opt_class();
      id v9 = v8;
      double v10 = [(FMDRequestRetryHelper *)self nextRetryType];
      double v11 = [(FMDRequestRetryHelper *)self nextRetryTime];
      *(_DWORD *)buf = 138413058;
      id v24 = v8;
      __int16 v25 = 2048;
      double v26 = v5;
      __int16 v27 = 2112;
      double v28 = v10;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Scheduling retry of type '%@' to occur at %@", buf, 0x2Au);
    }
    double v12 = +[NSString stringWithFormat:@"com.apple.icloud.findmydeviced.retry.%@-%p", objc_opt_class(), self];
    id v13 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v12 serviceIdentifier:self target:"_retryTimerFired" selector:0 userInfo:a3];
    [(FMDRequestRetryHelper *)self setRetryTimer:v13];

    id v14 = [(FMDRequestRetryHelper *)self retryTimer];
    [v14 setMinimumEarlyFireProportion:0.75];

    double v15 = [(FMDRequestRetryHelper *)self retryTimer];
    [v15 scheduleInQueue:&_dispatch_main_q];
  }
}

- (int)_retryCountForType:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDRequestRetryHelper *)self totalRetriesByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (int)_consecutiveRetryCountForType:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDRequestRetryHelper *)self consecutiveRetriesByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (void)_incrementRetryCountForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    id v5 = [(FMDRequestRetryHelper *)self totalRetriesByType];

    if (!v5)
    {
      id v6 = +[NSMutableDictionary dictionary];
      [(FMDRequestRetryHelper *)self setTotalRetriesByType:v6];

      int v7 = +[NSMutableDictionary dictionary];
      [(FMDRequestRetryHelper *)self setConsecutiveRetriesByType:v7];
    }
    unsigned int v8 = [(FMDRequestRetryHelper *)self totalRetriesByType];
    id v9 = [v8 objectForKeyedSubscript:v18];

    double v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 intValue] + 1);
    double v11 = [(FMDRequestRetryHelper *)self totalRetriesByType];
    [v11 setObject:v10 forKeyedSubscript:v18];

    double v12 = [(FMDRequestRetryHelper *)self consecutiveRetriesByType];
    id v13 = [v12 objectForKeyedSubscript:v18];

    id v14 = [(FMDRequestRetryHelper *)self lastRetryType];
    unsigned int v15 = [v18 isEqualToString:v14];

    if (v15)
    {
      +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 intValue] + 1);
      v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &off_1002F1F48;
    }
    BOOL v17 = [(FMDRequestRetryHelper *)self consecutiveRetriesByType];
    [v17 setObject:v16 forKeyedSubscript:v18];

    id v4 = v18;
  }
  ++self->_totalRetryCount;
}

- (void)_networkStateChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:FMLocalNetworkStatusKey];

  if ([v5 BOOLValue]) {
    [(FMDRequestRetryHelper *)self _networkCameUp];
  }
}

- (NSString)nextRetryType
{
  return self->_nextRetryType;
}

- (void)setNextRetryType:(id)a3
{
}

- (int64_t)totalRetryCount
{
  return self->_totalRetryCount;
}

- (void)setTotalRetryCount:(int64_t)a3
{
  self->_totalRetryCount = a3;
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
}

- (FMDRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);

  return (FMDRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (NSMutableDictionary)totalRetriesByType
{
  return self->_totalRetriesByType;
}

- (void)setTotalRetriesByType:(id)a3
{
}

- (NSMutableDictionary)consecutiveRetriesByType
{
  return self->_consecutiveRetriesByType;
}

- (void)setConsecutiveRetriesByType:(id)a3
{
}

- (NSString)lastRetryType
{
  return self->_lastRetryType;
}

- (void)setLastRetryType:(id)a3
{
}

- (NSDate)lastRetryTime
{
  return self->_lastRetryTime;
}

- (void)setLastRetryTime:(id)a3
{
}

- (NSDate)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(id)a3
{
}

- (PCPersistentTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_nextRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryType, 0);
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, 0);
  objc_storeStrong((id *)&self->_totalRetriesByType, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong(&self->_retryAction, 0);

  objc_storeStrong((id *)&self->_nextRetryType, 0);
}

@end