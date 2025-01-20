@interface _DASAppResumePLLogger
+ (id)applicationBundleIDForExecutableName:(id)a3;
+ (id)sharedInstance;
+ (id)topPredictionsFromScores:(id)a3;
- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5;
- (BOOL)powerLogExists;
- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4;
- (NSDate)lastReportedDate;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (_CDContextualKeyPath)inferredCarryStatusKeyPath;
- (_DASAppResumePLLogger)init;
- (id)appsFromProactiveSuggestions;
- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4;
- (id)concatenateEventsPrivate:(id)a3;
- (void)initializeCarryStatusLogging;
- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4;
- (void)logFreezerSkipReasons:(id)a3;
- (void)logUpdatedCarryStatus;
- (void)setDefaults:(id)a3;
- (void)setInferredCarryStatusKeyPath:(id)a3;
- (void)setLastReportedDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPowerLogExists:(BOOL)a3;
@end

@implementation _DASAppResumePLLogger

- (_DASAppResumePLLogger)init
{
  v19.receiver = self;
  v19.super_class = (Class)_DASAppResumePLLogger;
  v2 = [(_DASAppResumePLLogger *)&v19 init];
  if (!v2)
  {
LABEL_6:
    v14 = v2;
    goto LABEL_10;
  }
  uint64_t v3 = +[_DASDaemonLogger logForCategory:@"appResume"];
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  BOOL v5 = dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String]);
  v2->_powerLogExists = v5;
  if (v5)
  {
    v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v6;

    [(NSUserDefaults *)v2->_defaults doubleForKey:@"appResumePredictionsReportedDate"];
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    lastReportedDate = v2->_lastReportedDate;
    v2->_lastReportedDate = (NSDate *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_lastReportedDate;
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reported date for App predictions to PowerLog is %@", buf, 0xCu);
    }
    uint64_t v12 = +[_CDContextualKeyPath keyPathWithKey:@"/das/inferredCarryStatus"];
    inferredCarryStatusKeyPath = v2->_inferredCarryStatusKeyPath;
    v2->_inferredCarryStatusKeyPath = (_CDContextualKeyPath *)v12;

    [(_DASAppResumePLLogger *)v2 initializeCarryStatusLogging];
    goto LABEL_6;
  }
  v15 = v2->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (NSDate *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String];
    *(_DWORD *)buf = 136315138;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D708;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3AD0 != -1) {
    dispatch_once(&qword_1001C3AD0, block);
  }
  v2 = (void *)qword_1001C3AC8;

  return v2;
}

+ (id)topPredictionsFromScores:(id)a3
{
  id v3 = a3;
  v4 = [v3 keysSortedByValueUsingComparator:&stru_1001755D8];
  BOOL v5 = +[NSMutableDictionary dictionary];
  if ((unint64_t)[v3 count] > 9)
  {
    int v6 = 10;
  }
  else
  {
    int v6 = [v3 count];
    if (v6 < 1) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  do
  {
    v9 = [v4 objectAtIndexedSubscript:v7];
    v10 = [v3 objectForKeyedSubscript:v9];
    v11 = [v4 objectAtIndexedSubscript:v7];
    [v5 setObject:v10 forKeyedSubscript:v11];

    ++v7;
  }
  while (v8 != v7);
LABEL_7:

  return v5;
}

- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_powerLogExists)
  {
    if (v4 && ([(NSDate *)self->_lastReportedDate timeIntervalSinceNow], v7 > -1800.0))
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Reported predictions to PowerLog in last 30 mins. Skipping";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      }
    }
    else
    {
      +[NSMutableArray array];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001DB94;
      v23[3] = &unk_100175498;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = v10;
      [v6 enumerateKeysAndObjectsUsingBlock:v23];
      v11 = [(_DASAppResumePLLogger *)self appsFromProactiveSuggestions];
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_10001DCF4;
      v21 = &unk_100175498;
      id v12 = v10;
      id v22 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:&v18];
      CFStringRef v27 = @"appResumePredictions";
      id v28 = v12;
      v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v18, v19, v20, v21);
      v14 = self->_log;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Logging to PowerLog %@", buf, 0xCu);
      }
      PLLogRegisteredEvent();
      v15 = +[NSDate date];
      lastReportedDate = self->_lastReportedDate;
      self->_lastReportedDate = v15;

      defaults = self->_defaults;
      [(NSDate *)self->_lastReportedDate timeIntervalSinceReferenceDate];
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"appResumePredictionsReportedDate");
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "PowerLog does not exist";
      goto LABEL_11;
    }
  }
}

+ (id)applicationBundleIDForExecutableName:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)os_transaction_create();
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  id v6 = [v5 objectForKey:@"appNameTranslation"];

  if (v6
    && ([v6 objectForKeyedSubscript:v3],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v3];
    v9 = v6;
  }
  else
  {
    v9 = +[NSMutableDictionary dictionary];

    id v10 = +[LSApplicationRecord enumeratorWithOptions:0];
    v11 = [v10 nextObject];
    id v12 = [v11 compatibilityObject];

    if (v12)
    {
      do
      {
        uint64_t v14 = [v12 bundleIdentifier];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [v12 bundleExecutable];

          if (v16)
          {
            v17 = [v12 bundleIdentifier];
            v18 = [v12 bundleExecutable];
            [v9 setObject:v17 forKeyedSubscript:v18];
          }
        }
        uint64_t v19 = [v10 nextObject];
        uint64_t v20 = [v19 compatibilityObject];

        id v12 = (void *)v20;
      }
      while (v20);
    }
    id v21 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    [v21 setObject:v9 forKey:@"appNameTranslation"];

    uint64_t v8 = [v9 objectForKeyedSubscript:v3];
  }

  return v8;
}

- (void)logFreezerSkipReasons:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_powerLogExists)
  {
    CFStringRef v11 = @"Applications";
    id v12 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Logging Freezer skipped reasons to PowerLog %@", (uint8_t *)&v9, 0xCu);
    }
    PLLogRegisteredEvent();
  }
  else
  {
    uint64_t v8 = self->_log;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", (uint8_t *)&v9, 2u);
    }
  }
}

- (id)appsFromProactiveSuggestions
{
  id v3 = +[NSMutableDictionary dictionary];
  if (dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient" UTF8String]))
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    id v4 = (void *)qword_1001C3AD8;
    uint64_t v35 = qword_1001C3AD8;
    if (!qword_1001C3AD8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      v29 = sub_10001F0B4;
      v30 = &unk_100175628;
      v31 = &v32;
      sub_10001F0B4((uint64_t)buf);
      id v4 = (void *)v33[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v32, 8);
    id v22 = [[v5 alloc] initWithConsumerSubType:9];
    id v6 = [v22 suggestionLayoutFromCache];
    id v21 = v6;
    if (v6)
    {
      double v7 = [v6 allSuggestionsInLayout:v6];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v24;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v7);
            }
            CFStringRef v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v12 = [v11 executableSpecification];
            v13 = [v12 executableObject];

            if (v13)
            {
              uint64_t v14 = [v11 scoreSpecification];
              [v14 rawScore];
              v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v16 = [v13 description];
              [v3 setObject:v15 forKeyedSubscript:v16];
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
        }
        while (v8);
      }
      v17 = +[_DASAppResumePLLogger topPredictionsFromScores:v3];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Proactive predictions not cached, returning nil", buf, 2u);
      }
      v17 = 0;
    }
  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F3014((os_log_t)v18);
    }
    v17 = 0;
  }

  return v17;
}

- (void)initializeCarryStatusLogging
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001E674;
  v13[3] = &unk_100175600;
  v13[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.appResume.inferCarryStatus" usingQueue:0 launchHandler:v13];

  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [v4 taskRequestForIdentifier:@"com.apple.appResume.inferCarryStatus"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.appResume.inferCarryStatus"];
    [v6 setPriority:1];
    [v6 setInterval:86400.0];
    [v6 setMinDurationBetweenInstances:85400.0];
    [v6 setRequiresProtectionClass:3];
    [v6 setRequiresExternalPower:0];
    double v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v12 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0)
    {
      id v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3058((os_log_t)log);
  }
}

- (void)logUpdatedCarryStatus
{
  id v3 = +[_CDClientContext userContext];
  id v4 = [v3 objectForKeyedSubscript:self->_inferredCarryStatusKeyPath];
  int v5 = [v4 BOOLValue];

  id v6 = +[_DKKnowledgeStore knowledgeStore];
  BOOL v7 = [(_DASAppResumePLLogger *)self updateCarryStatusWithContext:v3 withKnowledgeStore:v6];

  if (v5 == v7)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3114(v5, log);
    }
  }
  else
  {
    unsigned __int8 v8 = +[NSNumber numberWithBool:v7];
    [v3 setObject:v8 forKeyedSubscript:self->_inferredCarryStatusKeyPath];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = +[NSNumber numberWithBool:v7];
    [v9 setObject:v10 forKeyedSubscript:@"CarryType"];

    PLLogRegisteredEvent();
    CFStringRef v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000F309C((uint64_t)v9, v11);
    }
  }
}

- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4
{
  unsigned __int8 v5 = [(_DASAppResumePLLogger *)self deviceHasEnoughPluggedInTimeWithMinimumDays:a3 withContext:a4 withKnowledgeStore:14.0];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F318C(v5, log);
  }
  return v5;
}

- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5
{
  id v7 = a5;
  v37 = (void *)os_transaction_create();
  unsigned __int8 v8 = +[NSDate date];
  uint64_t v9 = +[_DKQuery predicateForEventsWithMinimumDuration:7200.0];
  BOOL v10 = 1;
  uint64_t v35 = +[_DKQuery predicateForEventsWithIntegerValue:1];
  v36 = (void *)v9;
  v46[0] = v9;
  v46[1] = v35;
  CFStringRef v11 = +[NSArray arrayWithObjects:v46 count:2];
  id v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

  v13 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  v45 = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:&v45 count:1];
  id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  v44 = v15;
  v16 = +[NSArray arrayWithObjects:&v44 count:1];
  v17 = +[_DKEventQuery eventQueryWithPredicate:v12 eventStreams:v14 offset:0 limit:0 sortDescriptors:v16];

  v18 = [v7 executeQuery:v17 error:0];

  uint64_t v19 = [(_DASAppResumePLLogger *)self concatenateContinuousEventsOfSameState:v18 sortedAscending:0];

  if (v19)
  {
    uint64_t v20 = [v19 lastObject];
    id v21 = [v20 startDate];
    [v8 timeIntervalSinceDate:v21];
    double v23 = v22;

    if ((unint64_t)[v19 count] >= 8)
    {
      long long v24 = [v19 firstObject];
      long long v25 = [v24 startDate];
      [v8 timeIntervalSinceDate:v25];
      if (v26 <= 604800.0)
      {

        if (v23 >= a3 * 86400.0)
        {
          BOOL v10 = 1;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    log = self->_log;
    BOOL v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = log;
      v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
      v30 = [v19 firstObject];
      v31 = [v30 startDate];
      uint64_t v32 = [v19 lastObject];
      v33 = [v32 startDate];
      *(_DWORD *)buf = 138412802;
      v39 = v29;
      __int16 v40 = 2112;
      v41 = v31;
      __int16 v42 = 2112;
      v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not real carry device: %@ events, Last plugin: %@, First plugin: %@", buf, 0x20u);

      BOOL v10 = 0;
    }
  }
LABEL_9:

  return v10;
}

- (id)concatenateEventsPrivate:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v4 = v3;
    goto LABEL_16;
  }
  id v4 = +[NSMutableArray array];
  int v5 = [v3 count];
  int v6 = v5 - 1;
  if (v5 < 2)
  {
    if (v5 != 1) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  v29 = v4;
  do
  {
    unsigned int v32 = v6;
    uint64_t v7 = (v6 - 1);
    uint64_t v8 = v7 + 1;
    int v30 = v6 - 1;
    while (1)
    {
      uint64_t v9 = [v3 objectAtIndexedSubscript:v8];
      id v10 = [v9 integerValue];
      CFStringRef v11 = [v3 objectAtIndexedSubscript:v7];
      if (v10 != [v11 integerValue]) {
        break;
      }
      id v12 = [v3 objectAtIndexedSubscript:v8];
      v13 = [v12 endDate];
      uint64_t v14 = [v3 objectAtIndexedSubscript:v7];
      id v15 = [v14 startDate];
      unsigned int v16 = [v13 isEqualToDate:v15];

      if (!v16) {
        goto LABEL_11;
      }
      --v7;
      if ((int)--v8 <= 0)
      {
        LODWORD(v7) = -1;
        goto LABEL_11;
      }
    }

LABEL_11:
    if ((int)v7 >= v30)
    {
      long long v25 = [v3 objectAtIndexedSubscript:v32];
      LODWORD(v7) = v30;
    }
    else
    {
      uint64_t v17 = v32;
      v33 = [v3 objectAtIndexedSubscript:v32];
      uint64_t v28 = [v33 stream];
      v31 = [v3 objectAtIndexedSubscript:v17];
      v18 = [v31 startDate];
      uint64_t v19 = [v3 objectAtIndexedSubscript:(int)v7 + 1];
      uint64_t v20 = [v19 endDate];
      id v21 = [v3 objectAtIndexedSubscript:v17];
      double v22 = [v21 value];
      double v23 = [v3 objectAtIndexedSubscript:v17];
      long long v24 = [v23 metadata];
      long long v25 = +[_DKEvent eventWithStream:v28 startDate:v18 endDate:v20 value:v22 metadata:v24];
    }
    id v4 = v29;
    [v29 addObject:v25];

    int v6 = v7;
  }
  while ((int)v7 > 0);
  if (!v7)
  {
LABEL_20:
    CFStringRef v27 = [v3 objectAtIndexedSubscript:0];
    [v4 addObject:v27];
  }
LABEL_16:

  return v4;
}

- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4
{
  if (a4)
  {
    int v5 = [a3 reverseObjectEnumerator];
    int v6 = [v5 allObjects];

    uint64_t v7 = [(_DASAppResumePLLogger *)self concatenateEventsPrivate:v6];
  }
  else
  {
    int v6 = [(_DASAppResumePLLogger *)self concatenateEventsPrivate:a3];
    uint64_t v8 = [v6 reverseObjectEnumerator];
    uint64_t v7 = [v8 allObjects];
  }

  return v7;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContextualKeyPath)inferredCarryStatusKeyPath
{
  return self->_inferredCarryStatusKeyPath;
}

- (void)setInferredCarryStatusKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end