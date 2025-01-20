@interface _DASSwapPredictionManager
+ (id)sharedInstance;
- (NSDictionary)currentPredictions;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASAppResumePLLogger)pLLogger;
- (_DASSwapModelAggregating)aggregator;
- (_DASSwapPredictionManager)initWithAlgorithms:(id)a3;
- (int)notifyToken;
- (void)setAggregator:(id)a3;
- (void)setCurrentPredictions:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPLLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)updateScores;
- (void)updateSwapScoresWithDictionary:(id)a3;
@end

@implementation _DASSwapPredictionManager

- (_DASSwapPredictionManager)initWithAlgorithms:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_DASSwapPredictionManager;
  id v5 = [(_DASSwapPredictionManager *)&v23 init];
  if (v5)
  {
    v6 = [[_DASSwapModelCustomAggregator alloc] initWithAlgorithms:v4];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    uint64_t v8 = +[_DASAppResumePLLogger sharedInstance];
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.dasd.smartswapqueue", v10);
    v12 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v11;

    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 4));
    v14 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v13;

    dispatch_set_qos_class_fallback();
    v15 = *((void *)v5 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A22C0;
    handler[3] = &unk_1001754F8;
    v16 = (int *)v5;
    v22 = v16;
    dispatch_source_set_event_handler(v15, handler);
    v16[2] = -1;
    v17 = *((void *)v5 + 4);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A2308;
    v19[3] = &unk_1001759D0;
    v20 = v16;
    notify_register_dispatch("com.apple.dasd.updateswapscores", v16 + 2, v17, v19);
  }
  return (_DASSwapPredictionManager *)v5;
}

- (void)updateScores
{
  id v6 = (id)os_transaction_create();
  [(_DASSwapModelAggregating *)self->_aggregator updateScores];
  aggregator = self->_aggregator;
  id v4 = +[NSDate date];
  id v5 = [(_DASSwapModelAggregating *)aggregator scoresForAllApplicationsAtDate:v4];
  [(_DASSwapPredictionManager *)self updateSwapScoresWithDictionary:v5];
}

- (void)updateSwapScoresWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger logForCategory:@"swap"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating scores to %@", buf, 0xCu);
  }
  if ([v4 count])
  {
    v28 = self;
    id v6 = [v4 mutableCopy];
    [v6 setObject:&off_100187288 forKeyedSubscript:@"MobileSafari"];
    id v27 = v6;
    id v7 = [v6 copy];

    v26[1] = v26;
    v26[0] = [v7 count];
    v29 = (char *)v26 - ((56 * v26[0] + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v36 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    id v4 = v7;
    id v8 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v8)
    {
      id v10 = v8;
      int v11 = 0;
      uint64_t v12 = *(void *)v34;
      v30 = v29 + 32;
      *(void *)&long long v9 = 138412546;
      long long v31 = v9;
      do
      {
        dispatch_source_t v13 = 0;
        uint64_t v32 = v11;
        v14 = &v30[56 * v11];
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v4);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v13);
          *((_DWORD *)v14 - 8) = 1;
          id v16 = v15;
          snprintf(v14, 0x11uLL, "%s", (const char *)[v16 UTF8String]);
          v17 = [v4 objectForKeyedSubscript:v16];
          [v17 doubleValue];
          BOOL v19 = v18 > 0.0;

          *((_DWORD *)v14 - 5) = v19;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            id v38 = v16;
            __int16 v39 = 1024;
            BOOL v40 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ => %d", buf, 0x12u);
          }
          dispatch_source_t v13 = (char *)v13 + 1;
          v14 += 56;
        }
        while (v10 != v13);
        id v10 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
        int v11 = v32 + v13;
      }
      while (v10);
    }

    int v20 = memorystatus_control();
    v21 = v28;
    if (v20)
    {
      int v22 = v20;
      objc_super v23 = +[_DASDaemonLogger logForCategory:@"swap"];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000FD194(v22, v23);
      }
    }
    uint64_t v24 = +[_DASAppResumePLLogger topPredictionsFromScores:v4];
    currentPredictions = v21->_currentPredictions;
    v21->_currentPredictions = (NSDictionary *)v24;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No scores to update!", buf, 2u);
  }
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2890;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4350 != -1) {
    dispatch_once(&qword_1001C4350, block);
  }
  v2 = (void *)qword_1001C4348;

  return v2;
}

- (void)start
{
  timer = self->_timer;
  dispatch_time_t v4 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(timer, v4, 0x1A3185C5000uLL, 0x45D964B800uLL);
  id v5 = self->_timer;

  dispatch_resume(v5);
}

- (void)stop
{
}

- (_DASSwapModelAggregating)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
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
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSDictionary)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);

  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end