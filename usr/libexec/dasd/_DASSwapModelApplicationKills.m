@interface _DASSwapModelApplicationKills
+ (id)histogramEventStream;
- (BOOL)process:(id)a3 inSet:(id)a4;
- (NSDate)lastSnapshotTime;
- (NSDictionary)historicalKillHistogram;
- (NSMutableDictionary)todaysKillHistogram;
- (NSMutableSet)zerosSet;
- (NSUserDefaults)killDefaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASAppResumePLLogger)pLLogger;
- (_DASSwapModelApplicationKills)init;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4;
- (id)_queue_computeScores;
- (id)appsRecentlyForegrounded;
- (id)queryForHistogramWithIdentifier:(id)a3;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)_queue_loadHistograms;
- (void)_queue_updateHistograms;
- (void)incorporateLatestJetsamStatistics;
- (void)registerDailyModelUpdateTask;
- (void)setHistoricalKillHistogram:(id)a3;
- (void)setKillDefaults:(id)a3;
- (void)setLastSnapshotTime:(id)a3;
- (void)setLog:(id)a3;
- (void)setPLLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTodaysKillHistogram:(id)a3;
- (void)setZerosSet:(id)a3;
- (void)updateModel;
- (void)updateScores;
@end

@implementation _DASSwapModelApplicationKills

- (_DASSwapModelApplicationKills)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASSwapModelApplicationKills;
  v2 = [(_DASSwapModelApplicationKills *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dasd.swap.appKillsModel", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[_DASDaemonLogger logForCategory:@"swap.appKillsModel"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    v9 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.swapkills"];
    killDefaults = v2->_killDefaults;
    v2->_killDefaults = v9;

    uint64_t v11 = +[_DASAppResumePLLogger sharedInstance];
    pLLogger = v2->_pLLogger;
    v2->_pLLogger = (_DASAppResumePLLogger *)v11;

    v13 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AC16C;
    block[3] = &unk_1001754F8;
    v14 = v2;
    v17 = v14;
    dispatch_async(v13, block);
    [(_DASSwapModelApplicationKills *)v14 registerDailyModelUpdateTask];
  }
  return v2;
}

+ (id)histogramEventStream
{
  return +[_DKEventStream eventStreamWithName:@"com.apple.dasd.jetsams"];
}

- (id)queryForHistogramWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[_DASSwapModelApplicationKills histogramEventStream];
  dispatch_queue_t v5 = +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:v4 withCustomIdentifier:v3];

  return v5;
}

- (void)_queue_loadHistograms
{
  id v3 = [(NSUserDefaults *)self->_killDefaults dictionaryForKey:@"histograms"];
  v4 = [v3 objectForKeyedSubscript:@"current"];
  dispatch_queue_t v5 = [v3 objectForKeyedSubscript:@"historical"];
  v6 = [v3 objectForKeyedSubscript:@"zeros"];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"snapshotTS"];
  v8 = (void *)v7;
  if (!v4) {
    v4 = &__NSDictionary0__struct;
  }
  if (!v5) {
    dispatch_queue_t v5 = &__NSDictionary0__struct;
  }
  if (!v6) {
    v6 = &__NSArray0__struct;
  }
  if (!v7)
  {
    v8 = +[NSDate distantPast];
  }
  v9 = (NSMutableDictionary *)[v4 mutableCopy];
  todaysKillHistogram = self->_todaysKillHistogram;
  self->_todaysKillHistogram = v9;

  p_historicalKillHistogram = &self->_historicalKillHistogram;
  objc_storeStrong((id *)&self->_historicalKillHistogram, v5);
  v12 = +[NSMutableSet setWithArray:v6];
  zerosSet = self->_zerosSet;
  self->_zerosSet = v12;

  objc_storeStrong((id *)&self->_lastSnapshotTime, v8);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    lastSnapshotTime = self->_lastSnapshotTime;
    *(_DWORD *)buf = 138412290;
    v22 = lastSnapshotTime;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Last snapshot: %@", buf, 0xCu);
  }
  v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_todaysKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loaded current histogram: %@", buf, 0xCu);
  }
  objc_super v18 = self->_log;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *p_historicalKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Loaded historical histogram: %@", buf, 0xCu);
  }
}

- (void)_queue_updateHistograms
{
  v8[0] = @"current";
  v8[1] = @"historical";
  historicalKillHistogram = self->_historicalKillHistogram;
  v9[0] = self->_todaysKillHistogram;
  v9[1] = historicalKillHistogram;
  v8[2] = @"zeros";
  dispatch_queue_t v5 = [(NSMutableSet *)self->_zerosSet allObjects];
  v8[3] = @"snapshotTS";
  lastSnapshotTime = self->_lastSnapshotTime;
  v9[2] = v5;
  v9[3] = lastSnapshotTime;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  [(NSUserDefaults *)self->_killDefaults setObject:v7 forKey:@"histograms"];
}

- (id)_queue_computeScores
{
  id v3 = +[NSMutableDictionary dictionary];
  historicalKillHistogram = self->_historicalKillHistogram;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AC700;
  v17[3] = &unk_100176AF0;
  v17[4] = self;
  id v5 = v3;
  id v18 = v5;
  [(NSDictionary *)historicalKillHistogram enumerateKeysAndObjectsUsingBlock:v17];
  todaysKillHistogram = self->_todaysKillHistogram;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AC7DC;
  v15[3] = &unk_100175498;
  id v7 = v5;
  id v16 = v7;
  [(NSMutableDictionary *)todaysKillHistogram enumerateKeysAndObjectsUsingBlock:v15];
  zerosSet = self->_zerosSet;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AC864;
  v13[3] = &unk_100176B18;
  id v9 = v7;
  id v14 = v9;
  [(NSMutableSet *)zerosSet enumerateObjectsUsingBlock:v13];
  v10 = v14;
  id v11 = v9;

  return v11;
}

- (void)updateModel
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC94C;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)registerDailyModelUpdateTask
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000ACC04;
  v12[3] = &unk_100175600;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.swapModelUpdate" usingQueue:0 launchHandler:v12];

  v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [v4 taskRequestForIdentifier:@"com.apple.dasd.swapModelUpdate"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.dasd.swapModelUpdate"];
    [v6 setPriority:1];
    [v6 setRequiresExternalPower:0];
    [v6 setInterval:86400.0];
    id v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v11 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4
{
  if (qword_1001C4370 != -1) {
    dispatch_once(&qword_1001C4370, &stru_100177A20);
  }
  return (double)((uint64_t)((a3 - a4) * dword_1001C4368) / *(unsigned int *)algn_1001C436C) / 1000000000.0;
}

- (id)appsRecentlyForegrounded
{
  v44 = (void *)os_transaction_create();
  v2 = +[NSDate date];
  id v3 = objc_alloc((Class)NSDateInterval);
  v4 = [v2 dateByAddingTimeInterval:-604800.0];
  v43 = v2;
  id v5 = [v3 initWithStartDate:v4 endDate:v2];

  id v6 = +[_DKSystemEventStreams appUsageStream];
  v42 = v5;
  uint64_t v7 = +[_DKHistogramQuery histogramQueryForStream:v6 interval:v5];

  unsigned __int8 v8 = +[_DASPredictionManager sharedKnowledgeStore];
  v41 = (void *)v7;
  id v9 = [v8 executeQuery:v7 error:0];

  v10 = +[NSMutableSet set];
  v39 = v9;
  id v11 = [v9 countDictionary];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000AD154;
  v53[3] = &unk_100176B60;
  id v12 = v10;
  id v54 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v53];

  v13 = +[_CDClientContext userContext];
  id v14 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v38 = v13;
  v15 = [v13 objectForKeyedSubscript:v14];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v22 = +[_CDContextQueries appUsageBundleID];
        v23 = [v21 objectForKeyedSubscript:v22];
        [v12 addObject:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v18);
  }

  v24 = +[NSMutableSet set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = v12;
  id v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v46;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        id v32 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v30 allowPlaceholder:0 error:0];
        v33 = [v32 compatibilityObject];

        v34 = [v33 bundleExecutable];
        if (v34) {
          [v24 addObject:v34];
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v27);
  }

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Processes recently launched: %@", buf, 0xCu);
  }
  id v36 = [v24 copy];

  return v36;
}

- (BOOL)process:(id)a3 inSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] > 0x1F)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hasPrefix:", v5, (void)v14))
          {

            unsigned __int8 v7 = 1;
            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v7 = 0;
  }
  else
  {
    unsigned __int8 v7 = [v6 containsObject:v5];
  }
LABEL_13:

  return v7;
}

- (void)incorporateLatestJetsamStatistics
{
  id v3 = [(_DASSwapModelApplicationKills *)self appsRecentlyForegrounded];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AD348;
  v6[3] = &unk_100175570;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, v6);
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = [(_DASSwapModelApplicationKills *)self scoresForAllApplicationsAtDate:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  v4 = +[NSMutableDictionary dictionary];
  queue = self->_queue;
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000ADA70;
  v13 = &unk_100175570;
  long long v14 = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(queue, &v10);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Updating Kill Count: %@", buf, 0xCu);
  }
  id v8 = [v6 copy:v10, v11, v12, v13, v14];

  return v8;
}

- (void)updateScores
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)todaysKillHistogram
{
  return self->_todaysKillHistogram;
}

- (void)setTodaysKillHistogram:(id)a3
{
}

- (NSDictionary)historicalKillHistogram
{
  return self->_historicalKillHistogram;
}

- (void)setHistoricalKillHistogram:(id)a3
{
}

- (NSMutableSet)zerosSet
{
  return self->_zerosSet;
}

- (void)setZerosSet:(id)a3
{
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(id)a3
{
}

- (NSUserDefaults)killDefaults
{
  return self->_killDefaults;
}

- (void)setKillDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killDefaults, 0);
  objc_storeStrong((id *)&self->_lastSnapshotTime, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);
  objc_storeStrong((id *)&self->_zerosSet, 0);
  objc_storeStrong((id *)&self->_historicalKillHistogram, 0);
  objc_storeStrong((id *)&self->_todaysKillHistogram, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end