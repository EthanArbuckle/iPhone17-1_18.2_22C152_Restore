@interface _DASLatencyProjector
+ (id)sharedInstance;
- (BOOL)isDASTaskCheckpoint:(id)a3;
- (BOOL)isTerminalEvent:(id)a3;
- (NSDate)lastPPSFlush;
- (OS_os_log)log;
- (_DASLatencyProjector)init;
- (id)computeActivityBlockingReason:(id)a3;
- (id)computeActivityTimeline:(id)a3 installations:(id)a4;
- (id)computeBlockedDurations:(id)a3;
- (id)computeElapsedRunTimeFromPairings:(id)a3 endDate:(id)a4;
- (id)computeElapsedRunTimeTotals:(id)a3;
- (id)computeElapsedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)computeElapsedRunTimesFromCheckpoints:(id)a3 endDate:(id)a4;
- (id)computeEstimatedMADCompletionTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 blockingReasonsTimeSeries:(id)a6 activity:(id)a7 osUpgradeTimestamp:(id)a8 endDate:(id)a9;
- (id)computeEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 filepath:(id)a5;
- (id)computeEstimatedRunTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 activity:(id)a6 endDate:(id)a7;
- (id)computeEstimatedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)computeFeatureTimeline:(id)a3 installations:(id)a4;
- (id)computePlugInStatus:(id)a3;
- (id)computeProgressTimeline:(id)a3;
- (id)computeUserActivityStatus:(id)a3;
- (id)exactCheckpointState:(unint64_t)a3;
- (id)exactFeatureCode:(id)a3;
- (id)exactTaskNamePredicate:(id)a3;
- (id)findActivitiesByName:(id)a3;
- (id)findLastCheckpointEvent:(id)a3 checkpoint:(unint64_t)a4;
- (id)findLastDASTaskCheckpointEvent:(id)a3;
- (id)findLastTaskSubmissionEvent:(id)a3;
- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)getBuddyData:(id)a3 filepath:(id)a4;
- (id)getConditionsPenalties:(id)a3;
- (id)getConditionsPenalty:(id)a3;
- (id)getDeviceConditionTimelines:(id)a3 filepath:(id)a4;
- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)getInstallTimeline:(id)a3 filepath:(id)a4;
- (id)getLastOSUpgradeTimestamp:(id)a3 endDate:(id)a4 eraseInstallOnly:(BOOL)a5;
- (id)getRecentUniqueInstallationEvents:(id)a3 timeFilter:(id)a4;
- (id)getRecentUniqueProgressEvents:(id)a3;
- (id)getTaskCheckpointPairings:(id)a3;
- (id)getTasksForFeatures:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)removeImmediatelyPrecedingSubmissions:(id)a3;
- (id)stringifyDASTaskCheckpoint:(unint64_t)a3;
- (unint64_t)computeOverallProgressPercentage:(id)a3;
- (void)flushPPSCaches;
- (void)setLastPPSFlush:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _DASLatencyProjector

- (_DASLatencyProjector)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASLatencyProjector;
  v2 = [(_DASLatencyProjector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"latencyProjector"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E0028;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C44D8 != -1) {
    dispatch_once(&qword_1001C44D8, block);
  }
  v2 = (void *)qword_1001C44D0;

  return v2;
}

- (id)exactTaskNamePredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"SELF.TaskName == %@", a3];
}

- (id)exactFeatureCode:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"SELF.FeatureCode == %@", a3];
}

- (id)exactCheckpointState:(unint64_t)a3
{
  uint64_t v3 = +[NSNumber numberWithUnsignedLong:a3];
  v4 = +[NSPredicate predicateWithFormat:@"SELF.CheckpointState == %@", v3];

  return v4;
}

- (BOOL)isDASTaskCheckpoint:(id)a3
{
  uint64_t v3 = [a3 metricKeysAndValues];
  v4 = [v3 objectForKeyedSubscript:@"CheckpointState"];
  unint64_t v5 = (unint64_t)[v4 unsignedLongValue];

  return (v5 < 0x33) & (0x4210040108400uLL >> v5);
}

- (id)stringifyDASTaskCheckpoint:(unint64_t)a3
{
  if ((uint64_t)a3 > 29)
  {
    if ((uint64_t)a3 > 44)
    {
      if (a3 == 45)
      {
        uint64_t v3 = @"Limited";
        goto LABEL_18;
      }
      if (a3 == 50)
      {
        uint64_t v3 = @"Canceled";
        goto LABEL_18;
      }
    }
    else
    {
      if (a3 == 30)
      {
        uint64_t v3 = @"Completed";
        goto LABEL_18;
      }
      if (a3 == 40)
      {
        uint64_t v3 = @"Expired";
        goto LABEL_18;
      }
    }
    goto LABEL_16;
  }
  if (a3 == 10)
  {
    uint64_t v3 = @"Submitted";
    goto LABEL_18;
  }
  if (a3 != 15)
  {
    if (a3 == 20)
    {
      uint64_t v3 = @"Started";
      goto LABEL_18;
    }
LABEL_16:
    v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    uint64_t v3 = +[NSString stringWithFormat:@"Unknown State %@ Count", v4];

    goto LABEL_18;
  }
  uint64_t v3 = @"TimewiseEligible";
LABEL_18:

  return v3;
}

- (BOOL)isTerminalEvent:(id)a3
{
  uint64_t v3 = [a3 metricKeysAndValues];
  v4 = [v3 objectForKeyedSubscript:@"CheckpointState"];
  unint64_t v5 = (unint64_t)[v4 unsignedLongValue];

  return (v5 < 0x33) & (0x4010040000000uLL >> v5);
}

- (id)findLastTaskSubmissionEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 firstObject];
  unint64_t v5 = [v4 metricKeysAndValues];
  uint64_t v28 = [v5 objectForKeyedSubscript:@"TaskName"];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v29 = v3;
  objc_super v6 = [v3 reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v32;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v32 != v11) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
      v14 = [v13 metricKeysAndValues];
      v15 = [v14 objectForKeyedSubscript:@"CheckpointState"];
      id v16 = [v15 unsignedLongValue];

      if (v16 == (id)45 && v9 != 0)
      {
LABEL_29:
        id v23 = v10;

        v25 = (void *)v28;
        v24 = v29;
        goto LABEL_34;
      }
      if (v9 && v10)
      {

        [(_DASLatencyProjector *)self isDASTaskCheckpoint:v13];
        v9 = 0;
        id v10 = 0;
      }
      else
      {
        if (v16 == (id)40 && v10 != 0)
        {
          v20 = v9;
          v9 = v13;
          id v21 = v10;
LABEL_25:
          id v22 = v13;

          id v10 = v21;
          goto LABEL_26;
        }
        if ([(_DASLatencyProjector *)self isDASTaskCheckpoint:v13]) {
          BOOL v19 = v10 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          goto LABEL_29;
        }
      }
      v20 = v10;
      id v21 = v13;
      if (v16 == (id)10) {
        goto LABEL_25;
      }
LABEL_26:
      if (v8 == (id)++v12)
      {
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_31;
      }
    }
  }
  v9 = 0;
  id v10 = 0;
LABEL_31:

  log = self->_log;
  v25 = (void *)v28;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Last submission event for %@: %@", buf, 0x16u);
  }
  id v10 = v10;
  v24 = v29;
LABEL_34:

  return v10;
}

- (id)findLastCheckpointEvent:(id)a3 checkpoint:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 firstObject];
  id v8 = [v7 metricKeysAndValues];
  v9 = [v8 objectForKeyedSubscript:@"TaskName"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v30 = a4;
    __int16 v31 = 2112;
    long long v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Finding the last event for checkpoint %lu of %@", buf, 0x16u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [v6 reverseObjectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    id v22 = v9;
    id v23 = v6;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v17 = [v16 metricKeysAndValues:v22, v23];
        v18 = [v17 objectForKeyedSubscript:@"CheckpointState"];
        id v19 = [v18 unsignedLongValue];

        if (v19 == (id)a4)
        {
          id v20 = v16;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    id v20 = 0;
LABEL_13:
    v9 = v22;
    id v6 = v23;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)findLastDASTaskCheckpointEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 firstObject];
  id v6 = [v5 metricKeysAndValues];
  id v7 = [v6 objectForKeyedSubscript:@"TaskName"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100100844((uint64_t)v7, log);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [v4 reverseObjectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(_DASLatencyProjector *)self isDASTaskCheckpoint:v14])
        {
          id v15 = v14;
          goto LABEL_13;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (id)removeImmediatelyPrecedingSubmissions:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v16 = v3;
  unint64_t v5 = [v3 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      id v11 = [v10 metricKeysAndValues];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"CheckpointState"];
      id v13 = [v12 unsignedIntegerValue];

      if (v13 != (id)10) {
        break;
      }
      [v4 addObject:v10];
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v14 = [v16 mutableCopy];
  [v14 removeObjectsInArray:v4];

  return v14;
}

- (id)getTaskCheckpointPairings:(id)a3
{
  id v3 = a3;
  id v18 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = (_DASTaskCheckpointPair *)v3;
  id v5 = [(_DASTaskCheckpointPair *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v21;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 metricKeysAndValues:v18];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"CheckpointState"];
        id v13 = [v12 unsignedLongValue];

        if (v13 == (id)20)
        {
          id v14 = v10;
LABEL_11:

          id v7 = v14;
          continue;
        }
        if (v7 && [(_DASLatencyProjector *)self isTerminalEvent:v10])
        {
          id v15 = [[_DASTaskCheckpointPair alloc] initWithParams:v7 terminalEvent:v10];
          [v18 addObject:v15];

          id v14 = 0;
          goto LABEL_11;
        }
      }
      id v6 = [(_DASTaskCheckpointPair *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v6)
      {

        if (v7)
        {
          id v16 = [[_DASTaskCheckpointPair alloc] initWithParams:v7 terminalEvent:v7];
          [v18 addObject:v16];
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  id v7 = 0;
  id v16 = v4;
LABEL_17:

LABEL_18:

  return v18;
}

- (id)getRecentUniqueProgressEvents:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v5 metricKeysAndValues];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"TaskName"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting the recent unique progress events for %@", buf, 0xCu);
  }
  uint64_t v9 = +[NSMutableArray array];
  id v10 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v21 = v4;
  id v11 = [v4 reverseObjectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v17 = [v16 metricKeysAndValues];
        id v18 = [v17 objectForKeyedSubscript:@"WorkloadCategory"];

        if (([v10 containsObject:v18] & 1) == 0)
        {
          [v10 addObject:v18];
          [v9 insertObject:v16 atIndex:0];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v9;
}

- (unint64_t)computeOverallProgressPercentage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v5 metricKeysAndValues];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"TaskName"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Computing Overall Progress Percentage for %@", buf, 0xCu);
  }
  uint64_t v9 = [(_DASLatencyProjector *)self getRecentUniqueProgressEvents:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  id v11 = v10;
  unint64_t v12 = 0;
  uint64_t v13 = *(void *)v20;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v9);
      }
      id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) metricKeysAndValues];
      id v16 = [v15 objectForKeyedSubscript:@"CompletedPercentage"];

      v12 += (unint64_t)[v16 unsignedIntegerValue];
    }
    id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v11);
  if (v12) {
    unint64_t v17 = v12 / (unint64_t)[v9 count];
  }
  else {
LABEL_12:
  }
    unint64_t v17 = 0;

  return v17;
}

- (id)getRecentUniqueInstallationEvents:(id)a3 timeFilter:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting the recent unique installation events", buf, 2u);
  }
  uint64_t v8 = +[NSMutableArray array];
  uint64_t v9 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v28 = v6;
  id v10 = [v6 reverseObjectEnumerator];
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v16 = [v15 metricKeysAndValues];
        unint64_t v17 = [v16 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        if (v17 && ([v9 containsObject:v17] & 1) == 0)
        {
          [v9 addObject:v17];
          [v8 insertObject:v15 atIndex:0];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  if (v27)
  {
    id v18 = [v27 startDate];
    [v18 timeIntervalSince1970];
    uint64_t v20 = v19;
    long long v21 = [v27 endDate];
    [v21 timeIntervalSince1970];
    long long v23 = +[NSPredicate predicateWithFormat:@"LastUpgradeSystemTimestamp >= %lf AND LastUpgradeSystemTimestamp <= %lf", v20, v22];

    long long v24 = [v8 filteredArrayUsingPredicate:v23];
    id v25 = [v24 mutableCopy];

    uint64_t v8 = v25;
  }

  return v8;
}

- (id)findActivitiesByName:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1001008BC((uint64_t)v4, log);
  }
  id v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = +[_DASDaemon sharedInstance];
  uint64_t v8 = [v7 allTasks];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 name:v19];
        unsigned int v16 = [v4 containsObject:v15];

        if (v16)
        {
          unint64_t v17 = [v14 name];
          [v6 setObject:v14 forKeyedSubscript:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v6;
}

- (void)flushPPSCaches
{
  id v3 = [(_DASLatencyProjector *)self lastPPSFlush];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  id v6 = [(_DASLatencyProjector *)self lastPPSFlush];

  if (!v6 || v5 < -3.0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_100100934((os_log_t)log);
    }
    PLQueryRegistered();
    uint64_t v8 = +[NSDate date];
    [(_DASLatencyProjector *)self setLastPPSFlush:v8];
  }
}

- (id)getTasksForFeatures:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_DASPPSDataManager sharedInstance];
  long long v30 = v8;
  long long v31 = v7;
  long long v29 = v9;
  id v11 = [v10 loadTasksForFeatures:v7 metrics:0 timeFilter:v8 filepath:v9];

  uint64_t v12 = +[NSMutableDictionary dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        unint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v18 = [v17 metricKeysAndValues];
        long long v19 = [v18 objectForKeyedSubscript:@"FeatureCodes"];

        long long v20 = [v17 metricKeysAndValues];
        long long v21 = [v20 objectForKeyedSubscript:@"TaskName"];

        long long v22 = [v19 stringValue];
        long long v23 = [v12 objectForKeyedSubscript:v22];

        if (!v23)
        {
          long long v24 = +[NSMutableArray array];
          id v25 = [v19 stringValue];
          [v12 setObject:v24 forKeyedSubscript:v25];
        }
        long long v26 = [v19 stringValue];
        id v27 = [v12 objectForKeyedSubscript:v26];

        if (([v27 containsObject:v21] & 1) == 0) {
          [v27 addObject:v21];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  return v12;
}

- (id)getLastOSUpgradeTimestamp:(id)a3 endDate:(id)a4 eraseInstallOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(_DASLatencyProjector *)self getRecentUniqueInstallationEvents:a3 timeFilter:0];
  if (v8)
  {
    [v8 timeIntervalSince1970];
    id v11 = +[NSPredicate predicateWithFormat:@"LastUpgradeSystemTimestamp <= %lf", v10];
    uint64_t v12 = [v9 filteredArrayUsingPredicate:v11];

    id v9 = (void *)v12;
  }
  if (v5)
  {
    id v13 = +[NSPredicate predicateWithFormat:@"InstallType = 0"];
    uint64_t v14 = [v9 filteredArrayUsingPredicate:v13];

    id v9 = (void *)v14;
  }
  uint64_t v15 = [v9 reverseObjectEnumerator];
  unsigned int v16 = [v15 nextObject];

  unint64_t v17 = [v16 metricKeysAndValues];
  id v18 = [v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
  [v18 doubleValue];
  long long v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

  return v19;
}

- (id)computeBlockedDurations:(id)a3
{
  id v49 = a3;
  v46 = +[NSMutableDictionary dictionary];
  id v3 = +[_DASRequiresPluggedInPolicy policyInstance];
  double v4 = [v3 policyName];
  unint64_t v42 = +[_DASPolicyManager bitmaskForPolicy:v4];
  BOOL v5 = +[_DASDeviceActivityPolicy policyInstance];
  id v6 = [v5 policyName];
  unint64_t v41 = +[_DASPolicyManager bitmaskForPolicy:v6];

  unint64_t v48 = +[_DASPolicyManager bitmaskForPolicy:@"Incompatibility"];
  id v7 = +[_DASPolicyManager allPoliciesForPlatform];
  id v8 = +[NSMutableSet setWithArray:v7];

  v45 = v8;
  id v9 = [v8 objectEnumerator];
  uint64_t v10 = +[NSMutableSet set];
  uint64_t v11 = [v9 nextObject];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      id v13 = [v12 policyName];
      [v10 addObject:v13];

      uint64_t v14 = [v9 nextObject];

      uint64_t v12 = (void *)v14;
    }
    while (v14);
  }
  v44 = v9;
  uint64_t v15 = +[_DASRequiresPluggedInPolicy policyInstance];
  unsigned int v16 = [v15 policyName];
  v61[0] = v16;
  unint64_t v17 = +[_DASDeviceActivityPolicy policyInstance];
  id v18 = [v17 policyName];
  v61[1] = v18;
  v61[2] = @"Incompatibility";
  long long v19 = +[NSArray arrayWithObjects:v61 count:3];
  long long v20 = +[NSSet setWithArray:v19];
  [v10 minusSet:v20];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v56;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v21);
        }
        v24 |= +[_DASPolicyManager bitmaskForPolicy:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      id v23 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v24 = 0;
  }
  v43 = v21;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = v49;
  id v28 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = 0;
    uint64_t v50 = 0;
    uint64_t v47 = 0;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v27);
        }
        long long v33 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) metricKeysAndValues];
        long long v34 = [v33 objectForKeyedSubscript:@"Maintenance"];

        if (((unint64_t)[v34 unsignedLongValue] & (v41 | v42)) != 0)
        {
          ++v30;
        }
        else if (((unint64_t)[v34 unsignedLongValue] & v48) != 0)
        {
          ++v50;
        }
        else
        {
          unint64_t v35 = (unint64_t)[v34 unsignedLongValue];
          uint64_t v36 = v47;
          if ((v35 & v24) != 0) {
            uint64_t v36 = v47 + 1;
          }
          uint64_t v47 = v36;
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v29);
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v50 = 0;
    uint64_t v47 = 0;
  }

  __int16 v37 = +[NSNumber numberWithUnsignedInteger:900 * v30];
  [v46 setObject:v37 forKeyedSubscript:@"UnpluggedOrDeviceActive"];

  id v38 = +[NSNumber numberWithUnsignedInteger:900 * v50];
  [v46 setObject:v38 forKeyedSubscript:@"Incompatibility"];

  v39 = +[NSNumber numberWithUnsignedInteger:900 * v47];
  [v46 setObject:v39 forKeyedSubscript:@"SystemConditions"];

  return v46;
}

- (id)computeElapsedRunTimeFromPairings:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = +[NSMutableArray array];
  uint64_t v10 = [v6 firstObject];
  uint64_t v11 = [v10 startEvent];
  uint64_t v12 = [v11 metricKeysAndValues];
  id v13 = [v12 objectForKeyedSubscript:@"TaskName"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Computing Elapsed Run Time for %@", buf, 0xCu);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    __int16 v37 = v13;
    id v38 = v8;
    id v18 = 0;
    uint64_t v19 = *(void *)v40;
    double v20 = 0.0;
    do
    {
      id v21 = 0;
      id v22 = v18;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v15);
        }
        id v18 = *(id *)(*((void *)&v39 + 1) + 8 * (void)v21);

        id v23 = [v18 terminalEvent];
        uint64_t v24 = [v18 startEvent];

        if (v23 == v24)
        {
          if (!v7)
          {
            id v7 = +[NSDate date];
          }
          [v7 timeIntervalSince1970:v37, v38, v39];
          double v32 = v31;
          uint64_t v25 = [v18 startEvent];
          [v25 epochTimestamp];
          double v30 = v32 - v33;
        }
        else
        {
          uint64_t v25 = [v18 terminalEvent];
          [v25 epochTimestamp];
          double v27 = v26;
          id v28 = [v18 startEvent];
          [v28 epochTimestamp];
          double v30 = v27 - v29;
        }
        double v20 = v20 + v30;
        long long v34 = [v18 dictionaryRepresentation];
        [v9 addObject:v34];

        id v21 = (char *)v21 + 1;
        id v22 = v18;
      }
      while (v17 != v21);
      id v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);

    id v13 = v37;
    id v8 = v38;
  }
  else
  {
    double v20 = 0.0;
  }

  unint64_t v35 = +[NSNumber numberWithDouble:v20];
  [v8 setObject:v35 forKeyedSubscript:@"Elapsed Runtime"];

  [v8 setObject:v9 forKeyedSubscript:@"Checkpoint Pairings"];

  return v8;
}

- (id)computeElapsedRunTimesFromCheckpoints:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  id v9 = [v7 copy];

  uint64_t v10 = [(_DASLatencyProjector *)self findLastTaskSubmissionEvent:v9];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    v60 = v8;
    do
    {
      [v11 epochTimestamp];
      v67 = +[NSPredicate predicateWithFormat:@"@epochTimestamp >= %lf", v12];
      id v13 = [v9 filteredArrayUsingPredicate:v67];
      v68 = [(_DASLatencyProjector *)self getTaskCheckpointPairings:v13];
      uint64_t v14 = [(_DASLatencyProjector *)self computeElapsedRunTimeFromPairings:v68 endDate:v6];
      id v15 = [v11 dictionaryRepresentation];
      v66 = v14;
      [v14 setObject:v15 forKeyedSubscript:@"Submission Event"];

      id v16 = [(_DASLatencyProjector *)self findLastDASTaskCheckpointEvent:v9];
      id v17 = [v16 dictionaryRepresentation];
      [v14 setObject:v17 forKeyedSubscript:@"Last DAS Checkpoint Event"];

      id v18 = +[NSMutableDictionary dictionary];
      uint64_t v19 = [(_DASLatencyProjector *)self exactCheckpointState:10];
      double v20 = [v13 filteredArrayUsingPredicate:v19];
      id v62 = [v20 count];

      id v21 = [(_DASLatencyProjector *)self exactCheckpointState:20];
      id v22 = [v13 filteredArrayUsingPredicate:v21];
      id v63 = [v22 count];

      id v23 = [(_DASLatencyProjector *)self exactCheckpointState:40];
      uint64_t v24 = [v13 filteredArrayUsingPredicate:v23];
      id v64 = [v24 count];

      uint64_t v25 = [(_DASLatencyProjector *)self exactCheckpointState:45];
      double v26 = [v13 filteredArrayUsingPredicate:v25];
      id v27 = [v26 count];

      id v28 = [(_DASLatencyProjector *)self exactCheckpointState:15];
      double v29 = [v13 filteredArrayUsingPredicate:v28];
      id v65 = [v29 count];

      double v30 = [(_DASLatencyProjector *)self exactCheckpointState:50];
      double v31 = [v13 filteredArrayUsingPredicate:v30];
      id v32 = [v31 count];

      double v33 = [(_DASLatencyProjector *)self exactCheckpointState:30];
      long long v34 = [v13 filteredArrayUsingPredicate:v33];
      id v61 = [v34 count];

      unint64_t v35 = +[NSNumber numberWithUnsignedInteger:v62];
      uint64_t v36 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:10];
      [v18 setObject:v35 forKeyedSubscript:v36];

      __int16 v37 = +[NSNumber numberWithUnsignedInteger:v63];
      id v38 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:20];
      [v18 setObject:v37 forKeyedSubscript:v38];

      long long v39 = +[NSNumber numberWithUnsignedInteger:v27];
      long long v40 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:45];
      [v18 setObject:v39 forKeyedSubscript:v40];

      long long v41 = +[NSNumber numberWithUnsignedInteger:v64];
      long long v42 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:40];
      [v18 setObject:v41 forKeyedSubscript:v42];

      id v43 = v32;
      id v8 = v60;
      v44 = +[NSNumber numberWithUnsignedInteger:v43];
      v45 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:50];
      [v18 setObject:v44 forKeyedSubscript:v45];

      v46 = +[NSNumber numberWithUnsignedInteger:v61];
      uint64_t v47 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:30];
      [v18 setObject:v46 forKeyedSubscript:v47];

      unint64_t v48 = +[NSNumber numberWithUnsignedInteger:v65];
      id v49 = [(_DASLatencyProjector *)self stringifyDASTaskCheckpoint:15];
      [v18 setObject:v48 forKeyedSubscript:v49];

      [v66 setObject:v18 forKeyedSubscript:@"Totals"];
      [v60 insertObject:v66 atIndex:0];
      [v11 epochTimestamp];
      long long v51 = +[NSPredicate predicateWithFormat:@"@epochTimestamp < %lf", v50];

      long long v52 = [v9 filteredArrayUsingPredicate:v51];

      id v9 = [(_DASLatencyProjector *)self removeImmediatelyPrecedingSubmissions:v52];

      [v11 epochTimestamp];
      long long v53 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

      uint64_t v54 = [(_DASLatencyProjector *)self findLastTaskSubmissionEvent:v9];

      uint64_t v11 = (void *)v54;
      id v6 = v53;
    }
    while (v54);
  }
  else
  {
    long long v53 = v6;
  }
  if ([v9 count])
  {
    long long v55 = [(_DASLatencyProjector *)self getTaskCheckpointPairings:v9];
    long long v56 = [(_DASLatencyProjector *)self computeElapsedRunTimeFromPairings:v55 endDate:v53];
    long long v57 = [(_DASLatencyProjector *)self findLastDASTaskCheckpointEvent:v9];
    long long v58 = [v57 dictionaryRepresentation];
    [v56 setObject:v58 forKeyedSubscript:@"Last DAS Checkpoint Event"];

    [v8 addObject:v56];
  }

  return v8;
}

- (id)computeElapsedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  id v28 = +[NSMutableDictionary dictionary];
  uint64_t v11 = +[_DASPPSDataManager sharedInstance];
  id v27 = [v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v9 filepath:v10];

  uint64_t v12 = [v9 endDate];
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  if (v12) {
    [v9 endDate];
  }
  else {
  id v13 = +[NSDate date];
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v8;
  id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v19 = [(_DASLatencyProjector *)self exactTaskNamePredicate:v18];
        double v20 = [v27 array];
        id v21 = [v20 filteredArrayUsingPredicate:v19];
        id v22 = [(_DASLatencyProjector *)self computeElapsedRunTimesFromCheckpoints:v21 endDate:v13];

        [v28 setObject:v22 forKeyedSubscript:v18];
      }
      id v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  return v28;
}

- (id)computeElapsedRunTimeTotals:(id)a3
{
  id v3 = a3;
  double v4 = +[NSMutableDictionary dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    double v5 = 0.0;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        id v8 = [v7 objectForKeyedSubscript:@"Elapsed Runtime"];
        [v8 doubleValue];
        double v10 = v9;

        uint64_t v11 = [v7 objectForKeyedSubscript:@"Totals"];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              id v17 = [v4 objectForKeyedSubscript:v16];
              uint64_t v18 = (char *)[v17 unsignedLongValue];
              uint64_t v19 = [v11 objectForKeyedSubscript:v16];
              double v20 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", &v18[(void)[v19 unsignedLongValue]]);
              [v4 setObject:v20 forKeyedSubscript:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v13);
        }
        double v5 = v5 + v10;

        uint64_t v6 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }
  else
  {
    double v5 = 0.0;
  }

  id v21 = +[NSNumber numberWithDouble:v5];
  [v4 setObject:v21 forKeyedSubscript:@"Run Time"];

  id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj count]);
  [v4 setObject:v22 forKeyedSubscript:@"Instances"];

  return v4;
}

- (id)computeEstimatedRunTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 activity:(id)a6 endDate:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = +[NSMutableDictionary dictionary];
  id v75 = v11;
  uint64_t v16 = [v11 array];
  v81 = v13;
  id v17 = [(_DASLatencyProjector *)self computeElapsedRunTimesFromCheckpoints:v16 endDate:v13];

  v82 = v17;
  uint64_t v18 = [v17 lastObject];
  v79 = [v18 objectForKeyedSubscript:@"Submission Event"];
  uint64_t v19 = [v79 objectForKeyedSubscript:@"epoch"];
  [v19 doubleValue];
  uint64_t v21 = v20;

  v77 = +[NSPredicate predicateWithFormat:@"@epochTimestamp >= %lf", v21];
  id v22 = [v14 filteredTimeSeriesUsingPredicate:];

  v78 = v22;
  id v23 = [v22 array];
  uint64_t v24 = [(_DASLatencyProjector *)self getRecentUniqueProgressEvents:v23];

  unint64_t v25 = [(_DASLatencyProjector *)self computeOverallProgressPercentage:v24];
  id v26 = [v18 objectForKeyedSubscript:@"Elapsed Runtime"];
  [v26 doubleValue];
  double v28 = v27;

  v76 = [v18 objectForKeyedSubscript:@"Last DAS Checkpoint Event"];
  long long v29 = [v76 objectForKeyedSubscript:@"CheckpointState"];
  unint64_t v30 = (unint64_t)[v29 unsignedIntegerValue];

  v80 = v18;
  [v15 addEntriesFromDictionary:v18];
  id v74 = v12;
  long long v31 = [v12 fastPass];
  BOOL v32 = v31 != 0;
  v72 = v31;

  unint64_t v73 = v25;
  long long v33 = +[NSNumber numberWithUnsignedInteger:v25];
  [v15 setObject:v33 forKeyedSubscript:@"Overall Progress"];

  long long v34 = +[NSNumber numberWithBool:0];
  [v15 setObject:v34 forKeyedSubscript:@"hasFastPass"];

  long long v35 = +[NSNumber numberWithBool:v32];
  [v15 setObject:v35 forKeyedSubscript:@"isFastPass"];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v36 = v24;
  id v37 = [v36 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v88;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v88 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        long long v42 = [v15 objectForKeyedSubscript:@"Recent Progress Events"];

        if (!v42)
        {
          id v43 = +[NSMutableArray array];
          [v15 setObject:v43 forKeyedSubscript:@"Recent Progress Events"];
        }
        v44 = [v15 objectForKeyedSubscript:@"Recent Progress Events"];
        v45 = [v41 dictionaryRepresentation];
        [v44 addObject:v45];
      }
      id v38 = [v36 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v38);
  }

  if (v30 > 0x32) {
    goto LABEL_14;
  }
  if (((1 << v30) & 0x4200040000000) != 0)
  {
LABEL_31:
    v66 = v74;
    id v65 = v75;
    v67 = &AnalyticsSendEvent_ptr;
    goto LABEL_32;
  }
  if (((1 << v30) & 0x8400) != 0)
  {
    if (v28 == 0.0)
    {
      v46 = [v82 reverseObjectEnumerator];
      id v47 = [v46 nextObject];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v48 = v46;
      id v49 = [v48 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v49)
      {
        id v50 = v49;
        id v51 = 0;
        uint64_t v52 = *(void *)v84;
LABEL_18:
        long long v53 = 0;
        uint64_t v54 = v51;
        while (1)
        {
          if (*(void *)v84 != v52) {
            objc_enumerationMutation(v48);
          }
          id v51 = *(id *)(*((void *)&v83 + 1) + 8 * (void)v53);

          long long v55 = [v51 objectForKeyedSubscript:@"Last DAS Checkpoint Event"];
          long long v56 = [v55 objectForKeyedSubscript:@"CheckpointState"];
          id v57 = [v56 unsignedIntegerValue];

          if (v57 == (id)30) {
            break;
          }

          long long v53 = (char *)v53 + 1;
          uint64_t v54 = v51;
          if (v50 == v53)
          {
            id v50 = [v48 countByEnumeratingWithState:&v83 objects:v91 count:16];
            if (v50) {
              goto LABEL_18;
            }

            goto LABEL_25;
          }
        }
        long long v58 = [v51 objectForKeyedSubscript:@"Elapsed Runtime"];
        [v58 doubleValue];
        double v60 = v59;

        if (!v51) {
          goto LABEL_28;
        }
        id v61 = [v51 objectForKeyedSubscript:@"Last DAS Checkpoint Event"];
        id v62 = [v51 objectForKeyedSubscript:@"Submission Event"];
        id v63 = [v62 objectForKeyedSubscript:@"epoch"];
        [v15 setObject:v63 forKeyedSubscript:@"Previous Instance Submission Time"];

        id v64 = [v61 objectForKeyedSubscript:@"epoch"];
        [v15 setObject:v64 forKeyedSubscript:@"Previous Instance Completion Time"];

        double v28 = v60;
        goto LABEL_31;
      }
LABEL_25:

LABEL_28:
    }
  }
  else if (((1 << v30) & 0x10000100000) == 0)
  {
LABEL_14:
    double v28 = -1.0;
    goto LABEL_31;
  }
  if (v73)
  {
    double v28 = v28 / (float)((float)v73 / 100.0);
    goto LABEL_31;
  }
  v66 = v74;
  id v65 = v75;
  v67 = &AnalyticsSendEvent_ptr;
  if (v72)
  {
    v70 = +[_DASRuntimeLimiter sharedLimiter];
    [v70 maximumRuntimeForActivity:v74];
    double v28 = v71;
  }
  else
  {
    double v28 = v28 + 3600.0;
  }
LABEL_32:
  v68 = [v67[400] numberWithDouble:v28];
  [v15 setObject:v68 forKeyedSubscript:@"Estimated Runtime"];

  return v15;
}

- (id)computeEstimatedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    BOOL v32 = 0;
  }
  else
  {
    [(_DASLatencyProjector *)self flushPPSCaches];
    BOOL v32 = [(_DASLatencyProjector *)self findActivitiesByName:v8];
  }
  id v33 = +[NSMutableDictionary dictionary];
  id v11 = +[_DASPPSDataManager sharedInstance];
  long long v31 = [v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v9 filepath:v10];
  id v26 = v11;
  double v27 = v10;
  unint64_t v30 = [v11 loadTaskProgress:v8 metrics:0 timeFilter:v9 filepath:v10];
  id v12 = [v9 endDate];
  double v28 = v9;
  if (v12) {
    [v9 endDate];
  }
  else {
  id v13 = +[NSDate date];
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  id v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v19 = [(_DASLatencyProjector *)self exactTaskNamePredicate:v18];
        uint64_t v20 = [v31 filteredTimeSeriesUsingPredicate:v19];

        uint64_t v21 = [(_DASLatencyProjector *)self exactTaskNamePredicate:v18];
        id v22 = [v30 filteredTimeSeriesUsingPredicate:v21];

        id v23 = [v32 objectForKeyedSubscript:v18];
        uint64_t v24 = [(_DASLatencyProjector *)self computeEstimatedRunTime:v18 checkpointTimeSeries:v20 progressTimeSeries:v22 activity:v23 endDate:v13];
        [v33 setObject:v24 forKeyedSubscript:v18];
      }
      id v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  return v33;
}

- (id)getConditionsPenalty:(id)a3
{
  id v4 = a3;
  double v5 = +[NSMutableDictionary dictionary];
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_100100978(log, v4);
    }
    uint64_t v7 = [v4 requiresSignificantUserInactivity];
    if ([v4 requiresPlugin]) {
      v7 |= 2uLL;
    }
    if ([v4 requiresNetwork]) {
      uint64_t v8 = v7 | 4;
    }
    else {
      uint64_t v8 = v7;
    }
    id v9 = [v4 fileProtection];

    if (v9) {
      unint64_t v10 = v8 | 8;
    }
    else {
      unint64_t v10 = v8;
    }
    if ([v4 requiresDeviceInactivity]) {
      v10 |= 0x10uLL;
    }
    id v11 = +[NSNumber numberWithUnsignedInteger:v10];
    [v5 setObject:v11 forKeyedSubscript:@"Blocking Criteria Bitmask"];

    if (v10 > 0x1F) {
      id v12 = &off_100187450;
    }
    else {
      id v12 = (&off_1001783F8)[v10];
    }
    [v5 setObject:v12 forKeyedSubscript:@"Conditions Penalty"];
  }

  return v5;
}

- (id)getConditionsPenalties:(id)a3
{
  id v4 = a3;
  double v5 = +[NSMutableDictionary dictionary];
  uint64_t v6 = [(_DASLatencyProjector *)self findActivitiesByName:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12, v16];
        id v14 = [(_DASLatencyProjector *)self getConditionsPenalty:v13];

        [v5 setObject:v14 forKeyedSubscript:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)computeFeatureTimeline:(id)a3 installations:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v26 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = +[NSMutableDictionary dictionary];
        id v9 = [v7 metricKeysAndValues];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"FeatureState"];
        [v8 setObject:v10 forKeyedSubscript:@"FeatureState"];

        [v7 epochTimestamp];
        id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v11 forKeyedSubscript:@"epoch"];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v12 = [v28 reverseObjectEnumerator];
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
              long long v18 = [v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
              [v18 doubleValue];
              double v20 = v19;

              [v7 epochTimestamp];
              if (v20 < v21)
              {
                id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 indexOfObject:v17]);
                [v8 setObject:v22 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_16;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        [v26 addObject:v8];
      }
      id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }

  return v26;
}

- (id)computeActivityTimeline:(id)a3 installations:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v26 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = +[NSMutableDictionary dictionary];
        id v9 = [v7 metricKeysAndValues];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"CheckpointState"];
        [v8 setObject:v10 forKeyedSubscript:@"CheckpointState"];

        [v7 epochTimestamp];
        id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v11 forKeyedSubscript:@"epoch"];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v12 = [v28 reverseObjectEnumerator];
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
              long long v18 = [v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
              [v18 doubleValue];
              double v20 = v19;

              [v7 epochTimestamp];
              if (v20 < v21)
              {
                id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 indexOfObject:v17]);
                [v8 setObject:v22 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_16;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        [v26 addObject:v8];
      }
      id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }

  return v26;
}

- (id)computePlugInStatus:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = +[NSMutableDictionary dictionary];
        id v11 = [v9 metricKeysAndValues];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"IsPluggedIn"];
        [v10 setObject:v12 forKeyedSubscript:@"plugInState"];

        [v9 epochTimestamp];
        id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)computeUserActivityStatus:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = +[NSMutableDictionary dictionary];
        id v11 = [v9 metricKeysAndValues];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"UserActivityStatus"];
        [v10 setObject:v12 forKeyedSubscript:@"UserActivityStatus"];

        [v9 epochTimestamp];
        id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)computeProgressTimeline:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = +[NSMutableDictionary dictionary];
        id v11 = [v9 metricKeysAndValues];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"CompletedPercentage"];
        [v10 setObject:v12 forKeyedSubscript:@"CompletedPercentage"];

        [v9 epochTimestamp];
        id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)computeActivityBlockingReason:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = +[NSMutableDictionary dictionary];
        id v11 = [v9 metricKeysAndValues];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"BlockingPolicies"];
        [v10 setObject:v12 forKeyedSubscript:@"BlockingPolicies"];

        [v9 epochTimestamp];
        id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 setObject:v13 forKeyedSubscript:@"timestamp"];

        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v93 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  long long v83 = +[NSMutableDictionary dictionary];
  long long v86 = +[_DASPPSDataManager sharedInstance];
  long long v84 = v9;
  uint64_t v10 = [v86 loadConfig:0 timeFilter:v8 filepath:v9];
  uint64_t v11 = [v10 array];

  v96 = self;
  v81 = (void *)v11;
  long long v85 = v8;
  uint64_t v12 = [(_DASLatencyProjector *)self getRecentUniqueInstallationEvents:v11 timeFilter:v8];
  v98 = +[NSMutableArray array];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v120;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v120 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        long long v18 = +[NSMutableDictionary dictionary];
        long long v19 = [v17 metricKeysAndValues];
        double v20 = [v19 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
        [v18 setObject:v20 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v21 = [v17 metricKeysAndValues];
        id v22 = [v21 objectForKeyedSubscript:@"Build"];
        [v18 setObject:v22 forKeyedSubscript:@"Build"];

        id v23 = [v17 metricKeysAndValues];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"InstallType"];
        [v18 setObject:v24 forKeyedSubscript:@"InstallType"];

        [v98 addObject:v18];
      }
      id v14 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
    }
    while (v14);
  }

  [v83 setObject:v98 forKeyedSubscript:@"Installation Events"];
  uint64_t v25 = v96;
  id v26 = [(_DASLatencyProjector *)v96 getBuddyData:v85 filepath:v84];
  [v83 setObject:v26 forKeyedSubscript:@"Buddy Setup Events"];

  v92 = [v86 loadFeatureCheckpoints:v93 metrics:0 timeFilter:v85 filepath:v84];
  v91 = +[NSMutableDictionary dictionary];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v27 = v93;
  id v28 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v116;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v116 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = *(void **)(*((void *)&v115 + 1) + 8 * (void)j);
        long long v33 = [(_DASLatencyProjector *)v25 exactFeatureCode:v32];
        long long v34 = [v92 filteredTimeSeriesUsingPredicate:v33];

        long long v35 = [v34 array];
        long long v36 = [(_DASLatencyProjector *)v25 computeFeatureTimeline:v35 installations:v98];
        long long v37 = [v32 stringValue];
        [v91 setObject:v36 forKeyedSubscript:v37];

        uint64_t v25 = v96;
      }
      id v29 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
    }
    while (v29);
  }

  id v38 = [(_DASLatencyProjector *)v25 getTasksForFeatures:v27 timeFilter:0 filepath:v84];
  uint64_t v39 = +[NSMutableSet set];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v97 = v38;
  id v40 = [v97 countByEnumeratingWithState:&v111 objects:v126 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v112;
    do
    {
      for (k = 0; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v112 != v42) {
          objc_enumerationMutation(v97);
        }
        v44 = [v97 objectForKeyedSubscript:*(void *)(*((void *)&v111 + 1) + 8 * (void)k)];
        v45 = +[NSSet setWithArray:v44];
        [v39 unionSet:v45];
      }
      id v41 = [v97 countByEnumeratingWithState:&v111 objects:v126 count:16];
    }
    while (v41);
  }
  v80 = v27;

  v82 = v39;
  v46 = [v86 loadTaskCheckpoints:v39 metrics:0 timeFilter:v85 filepath:v84];
  long long v90 = +[NSMutableArray array];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v87 = v46;
  id v94 = [v87 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (v94)
  {
    uint64_t v89 = *(void *)v108;
    do
    {
      for (m = 0; m != v94; m = (char *)m + 1)
      {
        if (*(void *)v108 != v89) {
          objc_enumerationMutation(v87);
        }
        id v48 = *(void **)(*((void *)&v107 + 1) + 8 * (void)m);
        id v49 = +[NSMutableDictionary dictionary];
        id v50 = [v48 metricKeysAndValues];
        id v51 = [v50 objectForKeyedSubscript:@"CheckpointState"];
        [v49 setObject:v51 forKeyedSubscript:@"CheckpointState"];

        [v48 epochTimestamp];
        uint64_t v52 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v49 setObject:v52 forKeyedSubscript:@"epoch"];

        long long v53 = [v48 metricKeysAndValues];
        uint64_t v54 = [v53 objectForKeyedSubscript:@"TaskName"];
        [v49 setObject:v54 forKeyedSubscript:@"TaskName"];

        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v55 = [v98 reverseObjectEnumerator];
        id v56 = [v55 countByEnumeratingWithState:&v103 objects:v124 count:16];
        if (v56)
        {
          id v57 = v56;
          uint64_t v58 = *(void *)v104;
          while (2)
          {
            for (n = 0; n != v57; n = (char *)n + 1)
            {
              if (*(void *)v104 != v58) {
                objc_enumerationMutation(v55);
              }
              double v60 = *(void **)(*((void *)&v103 + 1) + 8 * (void)n);
              id v61 = [v60 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
              [v61 doubleValue];
              double v63 = v62;

              [v48 epochTimestamp];
              if (v63 < v64)
              {
                id v65 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v98 indexOfObject:v60]);
                [v49 setObject:v65 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_39;
              }
            }
            id v57 = [v55 countByEnumeratingWithState:&v103 objects:v124 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }
LABEL_39:

        [v90 addObject:v49];
      }
      id v94 = [v87 countByEnumeratingWithState:&v107 objects:v125 count:16];
    }
    while (v94);
  }

  v66 = [v86 loadTaskProgress:v82 metrics:0 timeFilter:v85 filepath:v84];
  v67 = +[NSMutableArray array];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v95 = v66;
  id v68 = [v95 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v100;
    do
    {
      for (ii = 0; ii != v69; ii = (char *)ii + 1)
      {
        if (*(void *)v100 != v70) {
          objc_enumerationMutation(v95);
        }
        v72 = *(void **)(*((void *)&v99 + 1) + 8 * (void)ii);
        unint64_t v73 = +[NSMutableDictionary dictionary];
        id v74 = [v72 metricKeysAndValues];
        id v75 = [v74 objectForKeyedSubscript:@"CompletedPercentage"];
        [v73 setObject:v75 forKeyedSubscript:@"CompletedPercentage"];

        [v72 epochTimestamp];
        v76 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v73 setObject:v76 forKeyedSubscript:@"epoch"];

        v77 = [v72 metricKeysAndValues];
        v78 = [v77 objectForKeyedSubscript:@"TaskName"];
        [v73 setObject:v78 forKeyedSubscript:@"TaskName"];

        [v67 addObject:v73];
      }
      id v69 = [v95 countByEnumeratingWithState:&v99 objects:v123 count:16];
    }
    while (v69);
  }

  [v83 setObject:v91 forKeyedSubscript:@"Feature Checkpoints"];
  [v83 setObject:v97 forKeyedSubscript:@"Feature To Tasks Mapping"];
  [v83 setObject:v90 forKeyedSubscript:@"Task Checkpoints"];
  [v83 setObject:v67 forKeyedSubscript:@"Progress Checkpoints"];

  return v83;
}

- (id)getDeviceConditionTimelines:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = +[_DASPPSDataManager sharedInstance];
  long long v18 = +[NSSet setWithObject:@"IsPluggedIn"];
  uint64_t v10 = [v9 getPPSTimeSeries:@"BackgroundProcessing" category:@"SystemConditionsBattery" valueFilter:0 metrics:v18 timeFilter:v6 filepath:v7 error:0];
  uint64_t v11 = [v10 array];
  uint64_t v12 = [(_DASLatencyProjector *)self computePlugInStatus:v11];

  [v8 setObject:v12 forKeyedSubscript:@"Device PlugIn Status"];
  id v13 = +[NSSet setWithObject:@"UserActivityStatus"];
  id v14 = [v9 getPPSTimeSeries:@"BackgroundProcessing" category:@"SystemConditionsPowerManagement" valueFilter:0 metrics:v13 timeFilter:v6 filepath:v7 error:0];
  uint64_t v15 = [v14 array];
  long long v16 = [(_DASLatencyProjector *)self computeUserActivityStatus:v15];

  [v8 setObject:v16 forKeyedSubscript:@"Device User Activity Status"];

  return v8;
}

- (id)getInstallTimeline:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  id v8 = +[_DASPPSDataManager sharedInstance];
  id v26 = v7;
  id v9 = [v8 loadConfig:0 timeFilter:v6 filepath:v7];
  uint64_t v10 = [v9 array];

  uint64_t v25 = (void *)v10;
  id v27 = v6;
  uint64_t v11 = [(_DASLatencyProjector *)self getRecentUniqueInstallationEvents:v10 timeFilter:v6];
  id v29 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v17 = +[NSMutableDictionary dictionary];
        long long v18 = [v16 metricKeysAndValues];
        long long v19 = [v18 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
        [v17 setObject:v19 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v20 = [v16 metricKeysAndValues];
        double v21 = [v20 objectForKeyedSubscript:@"Build"];
        [v17 setObject:v21 forKeyedSubscript:@"Build"];

        id v22 = [v16 metricKeysAndValues];
        id v23 = [v22 objectForKeyedSubscript:@"InstallType"];
        [v17 setObject:v23 forKeyedSubscript:@"InstallType"];

        [v29 addObject:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  return v29;
}

- (id)getBuddyData:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  id v8 = +[_DASPPSDataManager sharedInstance];
  id v23 = v7;
  uint64_t v24 = v6;
  id v9 = [v8 loadBuddyData:0 timeFilter:v6 filepath:v7];
  uint64_t v10 = [v9 array];

  uint64_t v11 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v17 = +[NSMutableDictionary dictionary];
        long long v18 = [v16 metricKeysAndValues];
        long long v19 = [v18 objectForKeyedSubscript:@"SetupDate"];
        [v17 setObject:v19 forKeyedSubscript:@"SetupDate"];

        double v20 = [v16 metricKeysAndValues];
        double v21 = [v20 objectForKeyedSubscript:@"TransferMethod"];
        [v17 setObject:v21 forKeyedSubscript:@"TransferMethod"];

        [v11 addObject:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  return v11;
}

- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v91 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    [(_DASLatencyProjector *)self flushPPSCaches];
  }
  uint64_t v89 = +[NSMutableDictionary dictionary];
  v92 = +[_DASPPSDataManager sharedInstance];
  id v90 = v9;
  uint64_t v10 = [v92 loadConfig:0 timeFilter:v8 filepath:v9];
  uint64_t v11 = [v10 array];

  long long v101 = self;
  long long v102 = v8;
  long long v88 = (void *)v11;
  id v12 = [(_DASLatencyProjector *)self getRecentUniqueInstallationEvents:v11 timeFilter:v8];
  long long v106 = +[NSMutableArray array];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v124;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v124 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v123 + 1) + 8 * i);
        long long v18 = +[NSMutableDictionary dictionary];
        long long v19 = [v17 metricKeysAndValues];
        double v20 = [v19 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];
        [v18 setObject:v20 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v21 = [v17 metricKeysAndValues];
        id v22 = [v21 objectForKeyedSubscript:@"Build"];
        [v18 setObject:v22 forKeyedSubscript:@"Build"];

        id v23 = [v17 metricKeysAndValues];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"InstallType"];
        [v18 setObject:v24 forKeyedSubscript:@"InstallType"];

        [v106 addObject:v18];
      }
      id v14 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v14);
  }

  uint64_t v25 = v89;
  [v89 setObject:v106 forKeyedSubscript:@"Installation Events"];
  long long v26 = v90;
  long long v27 = [(_DASLatencyProjector *)v101 getBuddyData:v8 filepath:v90];
  [v89 setObject:v27 forKeyedSubscript:@"Buddy Setup Events"];

  long long v28 = v91;
  long long v29 = [v92 loadTaskCheckpoints:v91 metrics:0 timeFilter:v8 filepath:v90];
  long long v100 = [v92 loadTaskBlockingReasons:v91 metrics:0 timeFilter:v8 filepath:v90];
  long long v99 = [v92 loadTaskProgress:v91 metrics:0 timeFilter:v8 filepath:v90];
  long long v105 = +[NSMutableDictionary dictionary];
  long long v104 = +[NSMutableDictionary dictionary];
  long long v103 = +[NSMutableDictionary dictionary];
  v98 = +[NSMutableDictionary dictionary];
  if ([v91 count])
  {
    long long v121 = 0uLL;
    long long v122 = 0uLL;
    long long v119 = 0uLL;
    long long v120 = 0uLL;
    id v93 = v91;
    id v96 = [v93 countByEnumeratingWithState:&v119 objects:v130 count:16];
    if (v96)
    {
      uint64_t v95 = *(void *)v120;
      do
      {
        for (j = 0; j != v96; j = (char *)j + 1)
        {
          if (*(void *)v120 != v95) {
            objc_enumerationMutation(v93);
          }
          uint64_t v31 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
          long long v32 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v31];
          long long v33 = [v29 filteredTimeSeriesUsingPredicate:v32];

          long long v34 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v31];
          long long v35 = [v100 filteredTimeSeriesUsingPredicate:v34];

          long long v36 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v31];
          long long v37 = [v99 filteredTimeSeriesUsingPredicate:v36];

          id v38 = [v33 array];
          uint64_t v39 = [(_DASLatencyProjector *)v101 computeActivityTimeline:v38 installations:v106];
          [v105 setObject:v39 forKeyedSubscript:v31];

          id v40 = [v35 array];
          id v41 = [(_DASLatencyProjector *)v101 computeActivityBlockingReason:v40];
          [v104 setObject:v41 forKeyedSubscript:v31];

          uint64_t v42 = [v37 array];
          id v43 = [(_DASLatencyProjector *)v101 computeProgressTimeline:v42];
          [v103 setObject:v43 forKeyedSubscript:v31];

          v44 = [v33 array];
          v45 = [v102 endDate];
          v46 = [(_DASLatencyProjector *)v101 computeElapsedRunTimesFromCheckpoints:v44 endDate:v45];

          id v47 = [(_DASLatencyProjector *)v101 computeElapsedRunTimeTotals:v46];
          [v98 setObject:v47 forKeyedSubscript:v31];
        }
        id v96 = [v93 countByEnumeratingWithState:&v119 objects:v130 count:16];
      }
      while (v96);
      uint64_t v25 = v89;
      long long v26 = v90;
      long long v28 = v91;
    }
  }
  else
  {
    long long v117 = 0uLL;
    long long v118 = 0uLL;
    long long v115 = 0uLL;
    long long v116 = 0uLL;
    id v97 = v29;
    id v48 = [v29 array];
    id v49 = [v48 countByEnumeratingWithState:&v115 objects:v129 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v116;
      do
      {
        for (k = 0; k != v50; k = (char *)k + 1)
        {
          if (*(void *)v116 != v51) {
            objc_enumerationMutation(v48);
          }
          long long v53 = [*(id *)(*((void *)&v115 + 1) + 8 * (void)k) metricKeysAndValues];
          uint64_t v54 = [v53 objectForKeyedSubscript:@"TaskName"];

          if (v54)
          {
            long long v55 = [v105 objectForKeyedSubscript:v54];

            if (!v55)
            {
              id v56 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v54];
              id v57 = [v97 filteredTimeSeriesUsingPredicate:v56];

              uint64_t v58 = [v57 array];
              double v59 = [(_DASLatencyProjector *)v101 computeActivityTimeline:v58 installations:v106];
              [v105 setObject:v59 forKeyedSubscript:v54];

              double v60 = [v57 array];
              id v61 = [v102 endDate];
              double v62 = [(_DASLatencyProjector *)v101 computeElapsedRunTimesFromCheckpoints:v60 endDate:v61];

              double v63 = [(_DASLatencyProjector *)v101 computeElapsedRunTimeTotals:v62];
              [v98 setObject:v63 forKeyedSubscript:v54];
            }
          }
        }
        id v50 = [v48 countByEnumeratingWithState:&v115 objects:v129 count:16];
      }
      while (v50);
    }

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    double v64 = [v100 array];
    id v65 = [v64 countByEnumeratingWithState:&v111 objects:v128 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v112;
      do
      {
        for (m = 0; m != v66; m = (char *)m + 1)
        {
          if (*(void *)v112 != v67) {
            objc_enumerationMutation(v64);
          }
          id v69 = [*(id *)(*((void *)&v111 + 1) + 8 * (void)m) metricKeysAndValues];
          uint64_t v70 = [v69 objectForKeyedSubscript:@"TaskName"];

          if (v70)
          {
            double v71 = [v104 objectForKeyedSubscript:v70];

            if (!v71)
            {
              v72 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v70];
              unint64_t v73 = [v100 filteredTimeSeriesUsingPredicate:v72];

              id v74 = [v73 array];
              id v75 = [(_DASLatencyProjector *)v101 computeActivityBlockingReason:v74];
              [v104 setObject:v75 forKeyedSubscript:v70];
            }
          }
        }
        id v66 = [v64 countByEnumeratingWithState:&v111 objects:v128 count:16];
      }
      while (v66);
    }

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v93 = [v99 array];
    id v76 = [v93 countByEnumeratingWithState:&v107 objects:v127 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v108;
      do
      {
        for (n = 0; n != v77; n = (char *)n + 1)
        {
          if (*(void *)v108 != v78) {
            objc_enumerationMutation(v93);
          }
          v80 = [*(id *)(*((void *)&v107 + 1) + 8 * (void)n) metricKeysAndValues];
          v81 = [v80 objectForKeyedSubscript:@"TaskName"];

          if (v81)
          {
            v82 = [v103 objectForKeyedSubscript:v81];

            if (!v82)
            {
              long long v83 = [(_DASLatencyProjector *)v101 exactTaskNamePredicate:v81];
              long long v84 = [v99 filteredTimeSeriesUsingPredicate:v83];

              long long v85 = [v84 array];
              long long v86 = [(_DASLatencyProjector *)v101 computeProgressTimeline:v85];
              [v103 setObject:v86 forKeyedSubscript:v81];
            }
          }
        }
        id v77 = [v93 countByEnumeratingWithState:&v107 objects:v127 count:16];
      }
      while (v77);
    }
    long long v26 = v90;
    long long v28 = v91;
    uint64_t v25 = v89;
    long long v29 = v97;
  }

  [v25 setObject:v105 forKeyedSubscript:@"Activity Checkpoints"];
  [v25 setObject:v104 forKeyedSubscript:@"Activity Blocking Reasons"];
  [v25 setObject:v103 forKeyedSubscript:@"Progress Checkpoints"];
  [v25 setObject:v98 forKeyedSubscript:@"Totals"];

  return v25;
}

- (id)computeEstimatedMADCompletionTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 blockingReasonsTimeSeries:(id)a6 activity:(id)a7 osUpgradeTimestamp:(id)a8 endDate:(id)a9
{
  id v58 = a6;
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  double v21 = +[NSMutableDictionary dictionary];
  id v22 = [(_DASLatencyProjector *)self computeEstimatedRunTime:v20 checkpointTimeSeries:v19 progressTimeSeries:v18 activity:v17 endDate:v16];

  if (v22
    && ([v22 objectForKeyedSubscript:@"Estimated Runtime"],
        id v23 = objc_claimAutoreleasedReturnValue(),
        [v23 doubleValue],
        double v25 = v24,
        v23,
        double v26 = -1.0,
        v25 != -1.0))
  {
    long long v28 = [v22 objectForKeyedSubscript:@"Overall Progress"];
    unsigned int v56 = [v28 unsignedIntValue];

    [v16 timeIntervalSinceDate:v15];
    unint64_t v30 = (unint64_t)v29;
    uint64_t v31 = [v22 objectForKeyedSubscript:@"Estimated Runtime"];
    long long v32 = [v22 objectForKeyedSubscript:@"Elapsed Runtime"];
    long long v33 = [v58 array];
    long long v34 = [(_DASLatencyProjector *)self computeBlockedDurations:v33];

    long long v35 = [v34 objectForKeyedSubscript:@"UnpluggedOrDeviceActive"];
    id v55 = [v35 unsignedLongValue];

    long long v36 = [v34 objectForKeyedSubscript:@"Incompatibility"];
    id v54 = [v36 unsignedLongValue];

    long long v37 = [v34 objectForKeyedSubscript:@"SystemConditions"];
    id v53 = [v37 unsignedLongValue];

    id v57 = v31;
    [v31 doubleValue];
    double v39 = v38;
    [v32 doubleValue];
    id v41 = +[NSNumber numberWithDouble:v39 - v40];
    [v21 setObject:v41 forKeyedSubscript:@"Estimated Runtime Remaining"];

    uint64_t v42 = +[NSNumber numberWithUnsignedInteger:v30];
    [v21 setObject:v42 forKeyedSubscript:@"Time Since Upgrade"];

    id v43 = +[NSNumber numberWithUnsignedInteger:v56];
    [v21 setObject:v43 forKeyedSubscript:@"Overall Progress"];

    double v44 = -1.0;
    double v45 = -1.0;
    double v46 = -1.0;
    if (v56)
    {
      float v47 = (float)v56 / (float)(100 - (unint64_t)v56);
      double v26 = (float)((float)v30 / v47);
      double v44 = (float)((float)(v30 - (unint64_t)v55) / v47);
      double v45 = (float)((float)(v30 - (unint64_t)v54) / v47);
      double v46 = (float)((float)(v30 - (unint64_t)v53) / v47);
    }
    id v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26, v53);
    [v21 setObject:v48 forKeyedSubscript:@"Remaining Estimated Completion Time"];

    id v49 = +[NSNumber numberWithDouble:v44];
    [v21 setObject:v49 forKeyedSubscript:@"TimePluggedInOrDeviceInactive"];

    id v50 = +[NSNumber numberWithDouble:v45];
    [v21 setObject:v50 forKeyedSubscript:@"TimeCompatible"];

    uint64_t v51 = +[NSNumber numberWithDouble:v46];
    [v21 setObject:v51 forKeyedSubscript:@"TimeSystemConditionsFavorable"];

    id v27 = v21;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)computeEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v41 = 0;
  }
  else
  {
    [(_DASLatencyProjector *)self flushPPSCaches];
    id v41 = [(_DASLatencyProjector *)self findActivitiesByName:v8];
  }
  id v42 = +[NSMutableDictionary dictionary];
  uint64_t v11 = +[_DASPPSDataManager sharedInstance];
  if (!v9)
  {
    id v9 = +[NSDate date];
  }
  id v12 = objc_alloc((Class)NSDateInterval);
  id v13 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  id v14 = [v12 initWithStartDate:v13 endDate:v9];

  long long v33 = v14;
  id v15 = [v11 loadConfig:0 timeFilter:v14 filepath:v10];
  uint64_t v16 = [v15 array];

  long long v32 = (void *)v16;
  double v40 = [(_DASLatencyProjector *)self getLastOSUpgradeTimestamp:v16 endDate:v9 eraseInstallOnly:0];
  id v17 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v40 endDate:v9];
  double v39 = [v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v17 filepath:v10];
  double v38 = [v11 loadTaskProgress:v8 metrics:0 timeFilter:v17 filepath:v10];
  long long v34 = v11;
  long long v35 = v10;
  uint64_t v31 = v17;
  long long v37 = [v11 loadIntensiveTaskBlockingReasons:v17 metrics:0 filepath:v10];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  id v18 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v23 = [(_DASLatencyProjector *)self exactTaskNamePredicate:v22];
        double v24 = [v39 filteredTimeSeriesUsingPredicate:v23];

        double v25 = [(_DASLatencyProjector *)self exactTaskNamePredicate:v22];
        double v26 = [v38 filteredTimeSeriesUsingPredicate:v25];

        id v27 = [v41 objectForKeyedSubscript:v22];
        [(_DASLatencyProjector *)self computeEstimatedMADCompletionTime:v22 checkpointTimeSeries:v24 progressTimeSeries:v26 blockingReasonsTimeSeries:v37 activity:v27 osUpgradeTimestamp:v40 endDate:v9];
        v29 = id v28 = v9;
        [v42 setObject:v29 forKeyedSubscript:v22];

        id v9 = v28;
      }
      id v19 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v19);
  }

  return v42;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)lastPPSFlush
{
  return self->_lastPPSFlush;
}

- (void)setLastPPSFlush:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPPSFlush, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end