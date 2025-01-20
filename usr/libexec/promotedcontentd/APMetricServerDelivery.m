@interface APMetricServerDelivery
- (APFakeNetworkResponse)fakeNetworkResponse;
- (APMetricHTTPDelivering)httpDelivery;
- (APMetricPreparedDataServerDelivery)preparedDataServerDelivery;
- (APMetricPreparedUnsignedDataProcessor)preparedUnsignedDataProcessor;
- (APMetricServerDelivery)init;
- (BOOL)_shouldBackoffForDestination:(id)a3;
- (BOOL)isRunningTests;
- (BOOL)processMetrics:(int64_t)a3 forChannel:(id)a4;
- (BOOL)serverDeliveryTimerWasRunningWhenPaused;
- (NSLock)processingDestinationsLock;
- (NSMutableDictionary)backoffTimers;
- (NSMutableDictionary)lastProcessingDates;
- (NSMutableSet)processingDestinations;
- (OS_dispatch_queue)serverDeliveryQueue;
- (OS_dispatch_source)serverDeliveryTimer;
- (double)_periodicDelay;
- (id)_dataFromBatchDictionaries:(id)a3;
- (id)_determineBillable:(id)a3;
- (id)_dictionariesFromBatchesInStorage:(id)a3 useShelvedData:(BOOL)a4 channels:(id)a5 groupBatches:(BOOL)a6 batchInfos:(id *)a7 billing:(id *)a8;
- (id)_loadBatchesAsDataForChannel:(id)a3 useShelvedData:(BOOL)a4 groupBatches:(BOOL)a5 batchInfos:(id *)a6 billing:(id *)a7;
- (id)_purposeConfig:(int64_t)a3;
- (id)backoffTimerForDestination:(id)a3;
- (id)batchDeliveredClosure;
- (id)lastProcessingDateForDestination:(id)a3;
- (int64_t)backoffFromResponse:(id)a3;
- (void)_asyncProcessMetrics:(int64_t)a3 forChannel:(id)a4;
- (void)_configurePreparedDataObjects;
- (void)_sendPayload:(id)a3 successCompletionHandler:(id)a4;
- (void)_startTestCommandsListener;
- (void)_stopDeliveryTimer;
- (void)dealloc;
- (void)flushMetricsToServerForChannel:(id)a3;
- (void)metricsReadyForDeliveryToChannel:(id)a3;
- (void)pause;
- (void)processServerDeliveryTimer;
- (void)resume;
- (void)setBackoffTimers:(id)a3;
- (void)setBatchDeliveredClosure:(id)a3;
- (void)setFakeNetworkResponse:(id)a3;
- (void)setHttpDelivery:(id)a3;
- (void)setIsRunningTests:(BOOL)a3;
- (void)setLastProcessingDate:(id)a3 forDestination:(id)a4;
- (void)setLastProcessingDates:(id)a3;
- (void)setPreparedDataServerDelivery:(id)a3;
- (void)setPreparedUnsignedDataProcessor:(id)a3;
- (void)setServerDeliveryQueue:(id)a3;
- (void)setServerDeliveryTimer:(id)a3;
- (void)setServerDeliveryTimerWasRunningWhenPaused:(BOOL)a3;
- (void)startDeliveryTimer;
- (void)startTimer:(id)a3 withResponse:(id)a4;
- (void)withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 withSaveObjectBlock:(id)a5;
@end

@implementation APMetricServerDelivery

- (double)_periodicDelay
{
  if (qword_100289C60 != -1) {
    dispatch_once(&qword_100289C60, &stru_100236998);
  }
  return *(double *)&qword_100289C58;
}

- (APMetricServerDelivery)init
{
  v27.receiver = self;
  v27.super_class = (Class)APMetricServerDelivery;
  v2 = [(APMetricServerDelivery *)&v27 init];
  if (v2)
  {
    v3 = (APMetricHTTPDelivering *)objc_alloc_init(+[MetricsModuleClasses httpDeliveryClass]);
    httpDelivery = v2->_httpDelivery;
    v2->_httpDelivery = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ap.pc.metrics.queue", v5);
    serverDeliveryQueue = v2->_serverDeliveryQueue;
    v2->_serverDeliveryQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:2];
    processingDestinations = v2->_processingDestinations;
    v2->_processingDestinations = v8;

    v10 = (NSLock *)objc_alloc_init((Class)NSLock);
    processingDestinationsLock = v2->_processingDestinationsLock;
    v2->_processingDestinationsLock = v10;

    v12 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    lastProcessingDates = v2->_lastProcessingDates;
    v2->_lastProcessingDates = v12;

    v14 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    backoffTimers = v2->_backoffTimers;
    v2->_backoffTimers = v14;

    id batchDeliveredClosure = v2->_batchDeliveredClosure;
    v2->_id batchDeliveredClosure = 0;

    v17 = +[NSProcessInfo processInfo];
    v2->_isRunningTests = [v17 isRunningTests];

    [(APMetricServerDelivery *)v2 startDeliveryTimer];
    objc_initWeak(&location, v2);
    dispatch_time_t v18 = dispatch_time(0, 5000000000);
    v19 = [(APMetricServerDelivery *)v2 serverDeliveryQueue];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100124C88;
    v24 = &unk_100234B00;
    objc_copyWeak(&v25, &location);
    dispatch_after(v18, v19, &v21);

    [(APMetricServerDelivery *)v2 _startTestCommandsListener];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_startTestCommandsListener
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    objc_initWeak(&location, self);
    v3 = +[APTestingRig sharedInstance];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100124DC0;
    v4[3] = &unk_1002369E8;
    objc_copyWeak(&v5, &location);
    [v3 subscribeForDictMessage:@"metrics-start-upload" handler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  [(APMetricServerDelivery *)self _stopDeliveryTimer];
  v3.receiver = self;
  v3.super_class = (Class)APMetricServerDelivery;
  [(APMetricServerDelivery *)&v3 dealloc];
}

- (void)startDeliveryTimer
{
  objc_super v3 = [(APMetricServerDelivery *)self serverDeliveryTimer];

  if (!v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    id v5 = [(APMetricServerDelivery *)v4 serverDeliveryTimer];
    if (!v5)
    {
      id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v4->_serverDeliveryQueue);
      [(APMetricServerDelivery *)v4 setServerDeliveryTimer:v5];
      if (v5)
      {
        objc_initWeak(location, v4);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100125270;
        v14[3] = &unk_100234B00;
        objc_copyWeak(&v15, location);
        dispatch_queue_t v6 = objc_retainBlock(v14);
        [(APMetricServerDelivery *)v4 _periodicDelay];
        double v8 = v7 * 1000000000.0;
        uint64_t v9 = (unint64_t)v8;
        dispatch_time_t v10 = dispatch_time(0, (uint64_t)v8);
        dispatch_source_set_timer(v5, v10, v9, 0x37E11D600uLL);
        dispatch_source_set_event_handler(v5, v6);
        dispatch_resume(v5);
        v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start Metric Server Delivery Timer", v13, 2u);
        }

        objc_destroyWeak(&v15);
        objc_destroyWeak(location);
      }
      else
      {
        v12 = APLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not create a dispatch timer!", (uint8_t *)location, 2u);
        }

        APSimulateCrash();
        id v5 = 0;
      }
    }

    objc_sync_exit(v4);
  }
}

- (void)_stopDeliveryTimer
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(APMetricServerDelivery *)v2 serverDeliveryTimer];
  v4 = v3;
  if (v3)
  {
    dispatch_source_cancel(v3);
    [(APMetricServerDelivery *)v2 setServerDeliveryTimer:0];
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stop Metric Server Delivery Timer", v6, 2u);
    }
  }
  objc_sync_exit(v2);
}

- (id)lastProcessingDateForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(APMetricServerDelivery *)self lastProcessingDates];
  dispatch_queue_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    dispatch_queue_t v6 = +[NSDate distantPast];
  }

  return v6;
}

- (void)setLastProcessingDate:(id)a3 forDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APMetricServerDelivery *)self lastProcessingDates];
  [v8 setObject:v7 forKey:v6];
}

- (id)backoffTimerForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(APMetricServerDelivery *)self backoffTimers];
  id v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    id v7 = [APECBackoffTimer alloc];
    id v8 = objc_alloc_init((Class)APSystemClock);
    id v6 = [(APECBackoffTimer *)v7 initWithClock:v8];

    [v5 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)_determineBillable:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {
    id v6 = 0;
LABEL_14:
    v14 = +[NSBundle mainBundle];
    uint64_t v15 = [v14 bundleIdentifier];

    id v6 = (void *)v15;
    goto LABEL_15;
  }
  id v5 = v4;
  id v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v18;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v3);
      }
      dispatch_time_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      id v11 = [v3 countForObject:v10];
      if ((unint64_t)v11 > v7)
      {
        unint64_t v12 = (unint64_t)v11;
        id v13 = v10;

        id v6 = v13;
        unint64_t v7 = v12;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v5);
  if (!v6 || ![v6 length]) {
    goto LABEL_14;
  }
LABEL_15:

  return v6;
}

- (id)_dataFromBatchDictionaries:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = +[NSDate date];
    id v5 = +[NSDateFormatter iso8601TruncatedToMinutes];
    v26 = (void *)v4;
    id v6 = [v5 stringFromDate:v4];
    unint64_t v7 = +[APSystemInfo osIdentifier];
    uint64_t v8 = +[APDeviceInfo current];
    uint64_t v9 = [v8 buildVersion];

    dispatch_time_t v10 = +[APDeviceInfo current];
    id v11 = [v10 deviceModel];

    v29[0] = @"local_utc";
    v29[1] = @"batches";
    v30[0] = v6;
    v30[1] = v3;
    v29[2] = @"version";
    v29[3] = @"os";
    v30[2] = &off_10024A358;
    v30[3] = v7;
    v29[4] = @"build";
    v29[5] = @"model";
    v30[4] = v9;
    v30[5] = v11;
    unint64_t v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];
    if (+[APSystemInternal isAppleInternalInstall])
    {
      id v13 = [v12 mutableCopy];
      [v13 setValue:&__kCFBooleanTrue forKey:@"internal"];
      v14 = +[NSDictionary dictionaryWithDictionary:v13];

      id v15 = objc_alloc((Class)NSUserDefaults);
      id v16 = [v15 initWithSuiteName:APDefaultsBundleID];
      unsigned int v17 = [v16 BOOLForKey:kAPAutomationLoggingEnabled];

      if (v17)
      {
        long long v18 = APLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          long long v19 = [v14 jsonString];
          *(_DWORD *)buf = 138477827;
          id v28 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Batch payload %{private}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v14 = v12;
    }
    long long v20 = [v14 jsonDataWithOptions:0x400000];
    v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [v20 length];
      *(_DWORD *)buf = 134217984;
      id v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Batch payload size %lu", buf, 0xCu);
    }

    if (v20)
    {
      id v23 = v20;
    }
    else
    {
      v24 = APLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "NSJSONSerialization resulted in empty data!", buf, 2u);
      }
    }
  }
  else
  {
    long long v20 = 0;
  }

  return v20;
}

- (void)_sendPayload:(id)a3 successCompletionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, BOOL))a4;
  uint64_t v8 = [(APMetricServerDelivery *)self httpDelivery];
  id v23 = 0;
  uint64_t v9 = [v8 sendPayload:v6 error:&v23];
  id v10 = v23;
  id v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  unint64_t v12 = (char *)[v10 code];
  id v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    id v25 = v12;
    __int16 v26 = 2114;
    objc_super v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error (%ld) attempting to send batch: %{public}@", buf, 0x16u);
  }

  if (v12 == (char *)8898)
  {
    v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sendData failed due to error code APMetricHTTPDeliveringErrorCodeMescalSigningFailed. Not sending batches.", buf, 2u);
    }
  }
  else
  {
LABEL_7:
    id v15 = [v6 channel];
    id v16 = [v15 destination];
    v14 = [(APMetricServerDelivery *)self backoffTimerForDestination:v16];

    unsigned int v17 = (char *)[v9 statusCode];
    long long v18 = v17;
    if ((unint64_t)(v17 - 200) > 0x63)
    {
      if (v11) {
        BOOL v19 = v17 == 0;
      }
      else {
        BOOL v19 = 0;
      }
      int v20 = v19;
      if ((unint64_t)(v17 - 400) < 0xC8 || v20)
      {
        if (v17 == (char *)503) {
          [(APMetricServerDelivery *)self startTimer:v14 withResponse:v9];
        }
        else {
          [v14 startNextTimer];
        }
      }
      else
      {
        v21 = APLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Received unknown status code from response (%ld)!", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v17 == (char *)202) {
        [(APMetricServerDelivery *)self startTimer:v14 withResponse:v9];
      }
      else {
        [v14 resetTimer];
      }
      id v22 = [(APMetricServerDelivery *)self preparedDataServerDelivery];
      sub_10011C29C(v22);

      if (v7) {
        v7[2](v7, v18 != (char *)202);
      }
    }
  }
}

- (void)startTimer:(id)a3 withResponse:(id)a4
{
  id v7 = a3;
  uint64_t v6 = [(APMetricServerDelivery *)self backoffFromResponse:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v7 startNextTimer];
  }
  else {
    [v7 startMinimumTimer:(double)v6];
  }
}

- (int64_t)backoffFromResponse:(id)a3
{
  id v3 = [a3 valueForHTTPHeaderField:@"Retry-After"];
  id v4 = [v3 integerValue];
  if (v4) {
    int64_t v5 = (int64_t)v4;
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)processServerDeliveryTimer
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "server delivery timer fired", buf, 2u);
  }

  id v4 = +[MetricsModule storage];
  int64_t v5 = [v4 activeChannels];
  [v4 closeActiveBatches];
  v32 = v4;
  uint64_t v6 = [(id)objc_opt_class() closedStoragePathPrefix];
  +[APMetricStorage_private removeExpiredBatchesFromClosedPrefix:v6];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    char v11 = 1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([(APMetricServerDelivery *)self isRunningTests])
        {
          v14 = APLogForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138739971;
            v39 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Timer fired, processing batch for channel: %{sensitive}@", buf, 0xCu);
          }
        }
        unsigned __int8 v16 = [(APMetricServerDelivery *)self processMetrics:1 forChannel:v13];
        if ((v16 & 1) == 0)
        {
          unsigned int v17 = APLogForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unprocessed metrics cannot suspend timer", buf, 2u);
          }

          char v11 = 0;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v9);
  }
  else
  {
    char v11 = 1;
  }

  long long v18 = +[APMetricOffsetSettings settings];
  BOOL v19 = [v18 lastActivity];
  int v20 = +[NSDate date];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v21 = objc_alloc((Class)NSUserDefaults);
    id v22 = [v21 initWithSuiteName:APDefaultsBundleID];
    id v23 = [v22 integerForKey:@"SuspendTimer"];
    if ((uint64_t)v23 <= 0) {
      uint64_t v24 = 600;
    }
    else {
      uint64_t v24 = (uint64_t)v23;
    }
  }
  else
  {
    uint64_t v24 = 600;
  }
  id v25 = APLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v33 = v18;
    __int16 v26 = +[NSNumber numberWithBool:v11 & 1];
    [v20 timeIntervalSinceDate:v19];
    objc_super v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v28 = +[NSNumber numberWithInteger:v24];
    [v20 timeIntervalSinceDate:v19];
    *(_DWORD *)buf = 138413058;
    CFStringRef v29 = @"NO";
    v39 = v26;
    if (v30 > (double)v24) {
      CFStringRef v29 = @"YES";
    }
    __int16 v40 = 2112;
    v41 = v27;
    __int16 v42 = 2112;
    v43 = v28;
    __int16 v44 = 2112;
    CFStringRef v45 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Can suspend (%@), timer (%@), suspend time (%@)), ok to suspend (%@)", buf, 0x2Au);

    long long v18 = v33;
  }

  if (v11)
  {
    if (!v19 || ([v20 timeIntervalSinceDate:v19], v31 > (double)v24)) {
      [(APMetricServerDelivery *)self _stopDeliveryTimer];
    }
  }
}

- (BOOL)_shouldBackoffForDestination:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(APMetricServerDelivery *)self backoffTimerForDestination:v4];
  unsigned int v6 = [v5 isWaitingForBackoff];
  if (v6)
  {
    id v7 = +[NSISO8601DateFormatter apLocalSharedFormatter];
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 scheduledDate];
      uint64_t v10 = [v7 stringFromDate:v9];
      int v12 = 138740227;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Metrics is in backoff for %{sensitive}@. Scheduled time: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v6;
}

- (id)_dictionariesFromBatchesInStorage:(id)a3 useShelvedData:(BOOL)a4 channels:(id)a5 groupBatches:(BOOL)a6 batchInfos:(id *)a7 billing:(id *)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  id v36 = a3;
  id v13 = a5;
  id v14 = 0;
  v33 = a7;
  if (a7 && a8)
  {
    id v34 = v13;
    unsigned int v38 = [(APMetricServerDelivery *)self isRunningTests];
    if (v12)
    {
      id v15 = [v34 firstObject];
      unsigned __int8 v16 = [v15 protectedEventChannel];
      unsigned int v17 = [v36 closeShelvedBatchesForChannel:v16 groupBatches:v10];
    }
    else
    {
      id v15 = [v34 mapObjectsUsingBlock:&stru_100236A28];
      unsigned int v17 = [v36 closeBatchesForChannels:v15];
    }

    id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v17 count]];
    id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v17 count]];
    id v41 = objc_alloc_init((Class)NSCountedSet);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v17;
    id v19 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v19)
    {
      uint64_t v40 = *(void *)v46;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          *(void *)&long long v55 = 0;
          *((void *)&v55 + 1) = &v55;
          uint64_t v56 = 0x2020000000;
          uint64_t v57 = 0;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1001268A8;
          v42[3] = &unk_100236A50;
          __int16 v44 = &v55;
          id v43 = v41;
          id v22 = [v21 serverDictionaryRepresentationWithBlock:v42];
          if (v22)
          {
            id v23 = APLogForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              id v24 = [v21 identifier];
              uint64_t v25 = *(void *)(*((void *)&v55 + 1) + 24);
              __int16 v26 = [v22 jsonDataWithOptions:0x400000];
              id v27 = [v26 length];
              *(_DWORD *)buf = 138543874;
              id v50 = v24;
              __int16 v51 = 2048;
              uint64_t v52 = v25;
              __int16 v53 = 2048;
              id v54 = v27;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Send batch %{public}@ with %lu metrics, batchSize %lu", buf, 0x20u);
            }
            [v39 addObject:v22];
            id v28 = objc_alloc_init(APMetricBatchInfo);
            CFStringRef v29 = [v21 identifier];
            [(APMetricBatchInfo *)v28 setIdentifier:v29];

            double v30 = [v21 fileSystemToken];
            [(APMetricBatchInfo *)v28 setFileSystemToken:v30];

            -[APMetricBatchInfo setPurpose:](v28, "setPurpose:", [v21 purpose]);
            if (v38) {
              [(APMetricBatchInfo *)v28 setMetricsCount:*(void *)(*((void *)&v55 + 1) + 24)];
            }
            [v18 addObject:v28, v33];
          }
          else
          {
            [v21 delete];
          }

          _Block_object_dispose(&v55, 8);
        }
        id v19 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v19);
    }

    id *v33 = [v18 copy];
    if ([v39 count])
    {
      *a8 = [(APMetricServerDelivery *)self _determineBillable:v41];
      id v14 = v39;
    }
    else
    {
      double v31 = APLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(v55) = 138412290;
        *(void *)((char *)&v55 + 4) = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "No batches to send for channels: %@", (uint8_t *)&v55, 0xCu);
      }

      id v14 = 0;
    }

    id v13 = v34;
  }

  return v14;
}

- (id)_loadBatchesAsDataForChannel:(id)a3 useShelvedData:(BOOL)a4 groupBatches:(BOOL)a5 batchInfos:(id *)a6 billing:(id *)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a3;
  uint64_t v25 = +[MetricsModule storage];
  BOOL v12 = +[NSMutableArray array];
  id v13 = +[NSMutableArray array];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100126C00;
  long long v35 = sub_100126C10;
  id v37 = v11;
  id v36 = +[NSArray arrayWithObjects:&v37 count:1];
  if (v8)
  {
    id v15 = -[APMetricServerDelivery _purposeConfig:](self, "_purposeConfig:", [v11 purpose]);
    unsigned __int8 v16 = [v15 allowedPurposes];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100126C18;
    v28[3] = &unk_100236A78;
    id v29 = v11;
    double v30 = &v31;
    [v16 enumerateObjectsUsingBlock:v28];
  }
  uint64_t v17 = v32[5];
  __int16 v26 = @"com.apple.ap.promotedcontentd";
  id v27 = 0;
  id v18 = -[APMetricServerDelivery _dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:](self, "_dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:", v25, v9, v17, v8, &v27, &v26, a7);
  id v19 = v27;
  int v20 = v26;
  _Block_object_dispose(&v31, 8);

  if (v18)
  {
    [v12 addObjectsFromArray:v18];
    [v13 addObjectsFromArray:v19];
  }
  if (a6) {
    *a6 = v13;
  }
  if (v24) {
    void *v24 = v20;
  }
  id v21 = [(APMetricServerDelivery *)self _dataFromBatchDictionaries:v12];

  return v21;
}

- (BOOL)processMetrics:(int64_t)a3 forChannel:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [(APMetricServerDelivery *)self isRunningTests];
  if (+[APSystemInternal isAppleInternalInstall]&& (v7 & 1) == 0)
  {
    BOOL v8 = [(APMetricServerDelivery *)self serverDeliveryQueue];
    dispatch_assert_queue_V2(v8);
  }
  BOOL v9 = (void *)os_transaction_create();
  if (v7) {
    goto LABEL_5;
  }
  id v19 = +[APSigningAuthorityPoolManager sharedInstance];
  unint64_t v20 = (unint64_t)[v19 state];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 0x4651)
  {
    if ((byte_100289C68 & 1) == 0)
    {
      id v21 = APLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{private}@] Signing is now ready so we can process metrics. State: %ld", buf, 0x16u);
      }
      byte_100289C68 = 1;
    }
LABEL_5:
    BOOL v10 = +[NSDate date];
    id v11 = [v6 destination];
    BOOL v12 = [(APMetricServerDelivery *)self lastProcessingDateForDestination:v11];

    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;
    [(APMetricServerDelivery *)self _periodicDelay];
    if (a3 == 1 && v14 < v15 * 0.5
      || ([v6 destination],
          unsigned __int8 v16 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v17 = [(APMetricServerDelivery *)self _shouldBackoffForDestination:v16],
          v16,
          (v17 & 1) != 0))
    {
      BOOL v18 = 0;
    }
    else
    {
      __int16 v26 = [(APMetricServerDelivery *)self processingDestinationsLock];
      long long v48 = [(APMetricServerDelivery *)self processingDestinations];
      [v26 lock];
      id v27 = [v6 destination];
      unsigned int v28 = [v48 containsObject:v27];

      if (v28)
      {
        [v26 unlock];
        BOOL v18 = 0;
      }
      else
      {
        id v29 = [v6 destination];
        [v48 addObject:v29];

        [v26 unlock];
        __int16 v44 = +[MetricsModule storage];
        id v55 = 0;
        id v56 = 0;
        long long v47 = [(APMetricServerDelivery *)self _loadBatchesAsDataForChannel:v6 useShelvedData:0 groupBatches:1 batchInfos:&v56 billing:&v55];
        id v45 = v56;
        id v46 = v55;
        if (v47) {
          BOOL v31 = v46 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        BOOL v18 = v31;
        if (!v31)
        {
          v32 = APLogForCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [v47 jsonRepresentationWithOptions:1];
            *(_DWORD *)buf = 138477827;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Batch payload %{private}@", buf, 0xCu);
          }
          id v34 = APLogForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            id v35 = [v47 length];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Batch payload size %lu", buf, 0xCu);
          }

          id v36 = objc_alloc_init(APMetricPayload);
          [(APMetricPayload *)v36 setBatchesData:v47];
          [(APMetricPayload *)v36 setBilling:v46];
          [(APMetricPayload *)v36 setChannel:v6];
          [(APMetricPayload *)v36 setBatchInfos:v45];
          id v37 = [(APMetricServerDelivery *)self fakeNetworkResponse];
          [(APMetricPayload *)v36 setFakeNetworkResponse:v37];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v58 = 0;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100127414;
          v50[3] = &unk_100236AA0;
          unsigned __int8 v54 = v7;
          id v51 = v45;
          uint64_t v52 = self;
          __int16 v53 = buf;
          [(APMetricServerDelivery *)self _sendPayload:v36 successCompletionHandler:v50];
          unsigned int v38 = [v6 destination];
          [(APMetricServerDelivery *)self setLastProcessingDate:v10 forDestination:v38];

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            id v39 = [v6 protectedEventChannel];
            unsigned int v40 = [v44 hasBacklogForChannel:v39];

            if (v40)
            {
              id v41 = APLogForCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v49 = 0;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Starting metrics processing due to a long backlog.", v49, 2u);
              }

              [(APMetricServerDelivery *)self _asyncProcessMetrics:4 forChannel:v6];
            }
          }

          _Block_object_dispose(buf, 8);
        }
        [v26 lock];
        __int16 v42 = [v6 destination];
        [v48 removeObject:v42];

        [v26 unlock];
        BOOL v9 = 0;
      }
    }
LABEL_43:

    goto LABEL_44;
  }
  id v24 = APLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Signing isn't ready yet so we can't send metrics.", buf, 2u);
  }

  if (byte_100289C68 == 1)
  {
    BOOL v10 = +[NSString stringWithFormat:@"Signing authority pool manager status changed from 'success' to %ld", v20];
    uint64_t v25 = APLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    CreateDiagnosticReport();
    BOOL v18 = 0;
    byte_100289C68 = 0;
    goto LABEL_43;
  }
  BOOL v18 = 0;
LABEL_44:

  return v18;
}

- (void)_asyncProcessMetrics:(int64_t)a3 forChannel:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [(APMetricServerDelivery *)self serverDeliveryQueue];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100127710;
  v9[3] = &unk_100236AC8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)metricsReadyForDeliveryToChannel:(id)a3
{
}

- (void)flushMetricsToServerForChannel:(id)a3
{
}

- (id)_purposeConfig:(int64_t)a3
{
  id v4 = 0;
  if (a3 > 102)
  {
    if (a3 == 103 || a3 == 8501) {
      goto LABEL_7;
    }
  }
  else if (a3 == 100 || a3 == 101)
  {
LABEL_7:
    id v4 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  }
  return v4;
}

- (void)withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 withSaveObjectBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = 0;
  uint64_t v11 = 50;
  if (!v6) {
    uint64_t v11 = 500;
  }
  id v39 = (uint64_t (**)(void, void))v9;
  v32 = self;
  uint64_t v12 = v11;
  id v33 = v8;
  while (v12 >= 1)
  {
    uint64_t v44 = v12 - 1;
    uint64_t v40 = v12;
    id v51 = 0;
    id v52 = 0;
    double v14 = [(APMetricServerDelivery *)self _loadBatchesAsDataForChannel:v8 useShelvedData:1 groupBatches:v6 batchInfos:&v52 billing:&v51];
    id v45 = v52;
    id v15 = v51;
    if (v14)
    {
      unsigned __int8 v16 = [(APMetricServerDelivery *)self httpDelivery];
      id v50 = 0;
      id v41 = v16;
      unsigned __int8 v17 = [v16 buildMetricDeliveryRequestFromData:v14 toChannel:v8 billing:v15 signingAuthority:0 failIfSignatureIsNotAvailable:0 error:&v50];
      id v42 = v50;
      if (v42)
      {
        BOOL v18 = v14;
        id v19 = APLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v55 = v42;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to build metric delivery request: %{public}@", buf, 0xCu);
        }

        double v14 = v18;
      }
      int v20 = ((uint64_t (**)(void, void *))v39)[2](v39, v17);
      if (v20)
      {
        int v34 = v20;
        id v35 = v17;
        id v36 = v15;
        id v37 = v14;
        int v38 = v10;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v21 = v45;
        id v22 = [v21 countByEnumeratingWithState:&v46 objects:v53 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v47;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v47 != v24) {
                objc_enumerationMutation(v21);
              }
              __int16 v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              id v27 = APLogForCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v28 = [v26 identifier];
                *(_DWORD *)buf = 138543362;
                id v55 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Deleting batch %{public}@", buf, 0xCu);
              }
              id v29 = [v26 fileSystemToken];
              +[APMetricBatch removeBatchByFileSystemToken:v29];
            }
            id v23 = [v21 countByEnumeratingWithState:&v46 objects:v53 count:16];
          }
          while (v23);
        }

        self = v32;
        id v8 = v33;
        int v10 = v38;
        id v15 = v36;
        double v14 = v37;
        unsigned __int8 v17 = v35;
        int v20 = v34;
      }
      v10 |= v20;
    }
    uint64_t v12 = v44;
    if (!v14)
    {
      if (v40 > 1) {
        goto LABEL_25;
      }
      break;
    }
  }
  APSimulateCrashNoKillProcess();
LABEL_25:
  if (v10)
  {
    double v30 = [(APMetricServerDelivery *)self preparedDataServerDelivery];
    sub_10011C078(v30);

    BOOL v31 = [(APMetricServerDelivery *)self preparedUnsignedDataProcessor];
    sub_100113FA8(v31);
  }
}

- (void)pause
{
  uint64_t v3 = [(APMetricServerDelivery *)self serverDeliveryTimer];
  [(APMetricServerDelivery *)self setServerDeliveryTimerWasRunningWhenPaused:v3 != 0];

  if ([(APMetricServerDelivery *)self serverDeliveryTimerWasRunningWhenPaused])
  {
    [(APMetricServerDelivery *)self _stopDeliveryTimer];
  }
  id v4 = [(APMetricServerDelivery *)self serverDeliveryQueue];
  dispatch_suspend(v4);

  int64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Suspended server delivery.", v6, 2u);
  }
}

- (void)resume
{
  uint64_t v3 = [(APMetricServerDelivery *)self serverDeliveryQueue];
  dispatch_resume(v3);

  if ([(APMetricServerDelivery *)self serverDeliveryTimerWasRunningWhenPaused])
  {
    [(APMetricServerDelivery *)self startDeliveryTimer];
  }
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Resumed server delivery.", v5, 2u);
  }
}

- (void)_configurePreparedDataObjects
{
  uint64_t v3 = +[APMetricStorage_private metricsFileManager];
  id v4 = [APMetricPreparedDataServerDelivery alloc];
  int64_t v5 = +[MetricsModule storage];
  BOOL v6 = sub_10011BE40((id *)&v4->super.isa, v5, self->_serverDeliveryQueue, self->_httpDelivery, v3);
  [(APMetricServerDelivery *)self setPreparedDataServerDelivery:v6];

  unsigned __int8 v7 = [APMetricPreparedUnsignedDataProcessor alloc];
  id v8 = +[MetricsModule storage];
  id v9 = sub_100113D40((id *)&v7->super.isa, v8, self->_serverDeliveryQueue, v3);
  [(APMetricServerDelivery *)self setPreparedUnsignedDataProcessor:v9];

  objc_initWeak(&location, self);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_100127F0C;
  id v15 = &unk_100234B00;
  objc_copyWeak(&v16, &location);
  sub_100114710(self->_preparedUnsignedDataProcessor, (char *)&v12);
  int v10 = [(APMetricServerDelivery *)self preparedUnsignedDataProcessor];
  sub_100113FA8(v10);

  uint64_t v11 = [(APMetricServerDelivery *)self preparedDataServerDelivery];
  sub_10011C078(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (APMetricHTTPDelivering)httpDelivery
{
  return self->_httpDelivery;
}

- (void)setHttpDelivery:(id)a3
{
}

- (OS_dispatch_queue)serverDeliveryQueue
{
  return self->_serverDeliveryQueue;
}

- (void)setServerDeliveryQueue:(id)a3
{
}

- (OS_dispatch_source)serverDeliveryTimer
{
  return self->_serverDeliveryTimer;
}

- (void)setServerDeliveryTimer:(id)a3
{
}

- (NSMutableSet)processingDestinations
{
  return self->_processingDestinations;
}

- (NSLock)processingDestinationsLock
{
  return self->_processingDestinationsLock;
}

- (NSMutableDictionary)lastProcessingDates
{
  return self->_lastProcessingDates;
}

- (void)setLastProcessingDates:(id)a3
{
}

- (NSMutableDictionary)backoffTimers
{
  return self->_backoffTimers;
}

- (void)setBackoffTimers:(id)a3
{
}

- (id)batchDeliveredClosure
{
  return self->_batchDeliveredClosure;
}

- (void)setBatchDeliveredClosure:(id)a3
{
}

- (BOOL)isRunningTests
{
  return self->_isRunningTests;
}

- (void)setIsRunningTests:(BOOL)a3
{
  self->_isRunningTests = a3;
}

- (BOOL)serverDeliveryTimerWasRunningWhenPaused
{
  return self->_serverDeliveryTimerWasRunningWhenPaused;
}

- (void)setServerDeliveryTimerWasRunningWhenPaused:(BOOL)a3
{
  self->_serverDeliveryTimerWasRunningWhenPaused = a3;
}

- (APMetricPreparedDataServerDelivery)preparedDataServerDelivery
{
  return self->_preparedDataServerDelivery;
}

- (void)setPreparedDataServerDelivery:(id)a3
{
}

- (APMetricPreparedUnsignedDataProcessor)preparedUnsignedDataProcessor
{
  return self->_preparedUnsignedDataProcessor;
}

- (void)setPreparedUnsignedDataProcessor:(id)a3
{
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (void)setFakeNetworkResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_preparedUnsignedDataProcessor, 0);
  objc_storeStrong((id *)&self->_preparedDataServerDelivery, 0);
  objc_storeStrong(&self->_batchDeliveredClosure, 0);
  objc_storeStrong((id *)&self->_backoffTimers, 0);
  objc_storeStrong((id *)&self->_lastProcessingDates, 0);
  objc_storeStrong((id *)&self->_processingDestinationsLock, 0);
  objc_storeStrong((id *)&self->_processingDestinations, 0);
  objc_storeStrong((id *)&self->_serverDeliveryTimer, 0);
  objc_storeStrong((id *)&self->_serverDeliveryQueue, 0);

  objc_storeStrong((id *)&self->_httpDelivery, 0);
}

@end