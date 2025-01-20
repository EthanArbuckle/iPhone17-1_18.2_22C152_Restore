@interface _DASClosureManager
- (BOOL)extractSignposts:(id)a3 startDate:(id)a4 chunkedByInterval:(double)a5 context:(id)a6 error:(id *)a7;
- (BOOL)isDeletableApp:(id)a3;
- (BOOL)isUserInstalledApp:(id)a3;
- (_DASClosureManager)init;
- (_DASCollectTelemetryActivityContext)collectTelemetryActivityContext;
- (id)appsLaunchedSinceBoot;
- (id)appsToExclude;
- (id)mostRecentBootTime;
- (id)recentlyInstalledAppsLimitedTo:(int)a3 withStore:(id)a4;
- (void)buildClosuresForApps:(id)a3 withTask:(id)a4 onBoot:(BOOL)a5;
- (void)buildClosuresForMaximum:(int)a3 withMinimumLikelihood:(double)a4 recentInstallCount:(int)a5 task:(id)a6 onBoot:(BOOL)a7;
- (void)buildClosuresOnBootWithTask:(id)a3;
- (void)buildClosuresOpportunisticWithTask:(id)a3;
- (void)collectClosureTelemetryWithTask:(id)a3;
- (void)collectLaunchDataWithBootBatchTimestamp:(double)a3 opportunisticBatchTimestamp:(double)a4 completion:(id)a5;
- (void)collectPrewarmingDataWithCompletion:(id)a3;
- (void)initializeLogs;
- (void)registerForActivities;
- (void)setCollectTelemetryActivityContext:(id)a3;
@end

@implementation _DASClosureManager

- (_DASClosureManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)_DASClosureManager;
  v2 = [(_DASClosureManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(_DASClosureManager *)v2 initializeLogs];
    [(_DASClosureManager *)v3 registerForActivities];
    uint64_t v4 = objc_opt_new();
    collectTelemetryActivityContext = v3->_collectTelemetryActivityContext;
    v3->_collectTelemetryActivityContext = (_DASCollectTelemetryActivityContext *)v4;
  }
  return v3;
}

- (void)initializeLogs
{
  if (!qword_1001C41C8)
  {
    os_log_t v2 = os_log_create("com.apple.dasd.signpost", "DuetClosuresTelemetry");
    v3 = (void *)qword_1001C41C8;
    qword_1001C41C8 = (uint64_t)v2;
  }
  if (!qword_1001C41D0)
  {
    qword_1001C41D0 = +[_DASDaemonLogger logForCategory:@"closureManager"];
    _objc_release_x1();
  }
}

- (void)registerForActivities
{
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007DBDC;
  v22[3] = &unk_100176CC8;
  v22[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.closureOnBoot" usingQueue:0 launchHandler:v22];

  uint64_t v4 = +[BGSystemTaskScheduler sharedScheduler];
  v5 = [v4 taskRequestForIdentifier:@"com.apple.dasd.closureOnBoot"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.dasd.closureOnBoot"];
    [v6 setPriority:2];
    [v6 setRequiresExternalPower:0];
    [v6 setTrySchedulingBefore:0.0];
    objc_super v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v21 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v21];
    id v9 = v21;

    if ((v8 & 1) == 0)
    {
      v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
  v11 = +[BGSystemTaskScheduler sharedScheduler];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007DCB4;
  v20[3] = &unk_100176CC8;
  v20[4] = self;
  [v11 registerForTaskWithIdentifier:@"com.apple.dasd.closureOpportunistic" usingQueue:0 launchHandler:v20];

  v12 = +[BGSystemTaskScheduler sharedScheduler];
  v13 = [v12 taskRequestForIdentifier:@"com.apple.dasd.closureOpportunistic"];

  if (!v13)
  {
    id v14 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.dasd.closureOpportunistic"];
    [v14 setPriority:1];
    [v14 setRequiresExternalPower:1];
    [v14 setRequiresUserInactivity:1];
    [v14 setTrySchedulingBefore:21600.0];
    v15 = +[BGSystemTaskScheduler sharedScheduler];
    id v19 = 0;
    unsigned __int8 v16 = [v15 submitTaskRequest:v14 error:&v19];
    id v17 = v19;

    if ((v16 & 1) == 0)
    {
      v18 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isUserInstalledApp:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v5 = [v4 compatibilityObject];

  id v6 = [v5 appState];
  if (![v6 isValid]) {
    goto LABEL_6;
  }
  objc_super v7 = [v5 appState];
  if (([v7 isInstalled] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  unsigned __int8 v8 = [v5 applicationType];
  unsigned __int8 v9 = [v8 isEqualToString:LSUserApplicationType];

  if (v9)
  {
    BOOL v10 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v11 = +[_DASDaemonLogger logForCategory:@"closureManager"];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping system application '%@'", (uint8_t *)&v13, 0xCu);
  }

  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)isDeletableApp:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v5 = [v4 applicationState];
  if (![v5 isValid]) {
    goto LABEL_6;
  }
  id v6 = [v4 applicationState];
  if (([v6 isInstalled] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  unsigned __int8 v7 = [v4 isDeletable];

  if (v7)
  {
    BOOL v8 = 1;
    goto LABEL_9;
  }
LABEL_7:
  unsigned __int8 v9 = qword_1001C41D0;
  BOOL v8 = 0;
  if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping non-deletable app '%@'", (uint8_t *)&v11, 0xCu);
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)appsToExclude
{
  return &off_100187A80;
}

- (void)buildClosuresForApps:(id)a3 withTask:(id)a4 onBoot:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v25 = a4;
  os_signpost_id_t v8 = os_signpost_id_generate((os_log_t)qword_1001C41C8);
  unsigned __int8 v9 = (id)qword_1001C41C8;
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v11 = [v7 componentsJoinedByString:@","];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v5;
    LOWORD(v38) = 2114;
    *(void *)((char *)&v38 + 2) = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v8, "DuetClosuresPrewarm", "onBoot:%d, bundleIDs:%{public}@", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&long long v38 = buf;
  *((void *)&v38 + 1) = 0x2020000000;
  char v39 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10007E434;
  v31[3] = &unk_100175628;
  v31[4] = buf;
  [v25 setExpirationHandler:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
LABEL_6:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v12);
      }
      if (*(unsigned char *)(v38 + 24)) {
        break;
      }
      uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
      id v17 = qword_1001C41D0;
      if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 138412290;
        uint64_t v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Building closure for '%@'", v32, 0xCu);
      }
      v18 = +[_APRSPrewarmInterface sharedInstance];
      id v19 = [v18 closureBuildLaunchAppFromBundleID:v16];

      if (v19)
      {
        v20 = qword_1001C41D0;
        if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 138412546;
          uint64_t v33 = v16;
          __int16 v34 = 2112;
          v35 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Encountered error launching %@: %@", v32, 0x16u);
        }
      }

      if (v13 == (id)++v15)
      {
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v13) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  if (*(unsigned char *)(v38 + 24))
  {
    id v26 = 0;
    unsigned __int8 v21 = [v25 setTaskExpiredWithRetryAfter:&v26 error:0.0];
    id v22 = v26;
    if ((v21 & 1) == 0)
    {
      v23 = (id)qword_1001C41C8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        id v24 = [v25 identifier];
        sub_1000F9104(v24, (uint64_t)v22, (uint64_t)v32);
      }

      [v25 setTaskCompleted];
    }
  }
  else
  {
    [v25 setTaskCompleted];
  }
  _Block_object_dispose(buf, 8);
}

- (id)recentlyInstalledAppsLimitedTo:(int)a3 withStore:(id)a4
{
  id v5 = a4;
  id v6 = +[_DKAppInstallMetadataKey isInstall];
  uint64_t v7 = +[_DKQuery predicateForObjectsWithMetadataKey:v6 andIntegerValue:1];

  os_signpost_id_t v8 = (void *)v7;
  unsigned __int8 v9 = +[NSDate dateWithTimeIntervalSinceNow:-172800.0];
  uint64_t v10 = +[_DKQuery predicateForEventsWithStartDateAfter:v9];

  int v11 = (void *)v10;
  v44[0] = v8;
  v44[1] = v10;
  id v12 = +[NSArray arrayWithObjects:v44 count:2];
  uint64_t v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  uint64_t v14 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  uint64_t v15 = +[_DKSystemEventStreams appInstallStream];
  v43 = v15;
  uint64_t v16 = +[NSArray arrayWithObjects:&v43 count:1];
  v42 = v14;
  id v17 = (void *)v13;
  v18 = +[NSArray arrayWithObjects:&v42 count:1];
  id v19 = +[_DKEventQuery eventQueryWithPredicate:v17 eventStreams:v16 offset:0 limit:a3 sortDescriptors:v18];

  id v40 = 0;
  v20 = [v5 executeQuery:v19 error:&v40];
  id v21 = v40;
  if (v21)
  {
    id v22 = qword_1001C41D0;
    if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
      sub_1000F915C(v22);
    }
    id v23 = &__NSArray0__struct;
  }
  else
  {
    v32 = v17;
    uint64_t v33 = (void *)v10;
    __int16 v34 = v8;
    id v35 = v5;
    id v24 = +[NSMutableArray array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v20;
    id v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v36 + 1) + 8 * i) stringValue];
          [v24 addObject:v30];
        }
        id v27 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v27);
    }

    id v23 = [v24 copy];
    os_signpost_id_t v8 = v34;
    id v5 = v35;
    id v17 = v32;
    int v11 = v33;
  }

  return v23;
}

- (id)appsLaunchedSinceBoot
{
  os_log_t v2 = [(_DASClosureManager *)self mostRecentBootTime];
  id v3 = +[_DKKnowledgeStore knowledgeStore];
  id v4 = +[_DKApplicationMetadataKey extensionHostIdentifier];
  id v5 = +[_DKQuery predicateForObjectsWithMetadataKey:v4];
  id v6 = +[NSCompoundPredicate notPredicateWithSubpredicate:v5];

  v20 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v20 count:1];
  os_signpost_id_t v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  unsigned __int8 v9 = +[NSDate date];
  [v2 timeIntervalSinceDate:v9];
  if (v10 > 0.0)
  {
    uint64_t v11 = [v2 dateByAddingTimeInterval:3600.0];

    unsigned __int8 v9 = (void *)v11;
  }
  id v12 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v2 endDate:v9];
  uint64_t v13 = +[_DKSystemEventStreams appUsageStream];
  uint64_t v14 = +[_DKHistogramQuery histogramQueryForStream:v13 interval:v12 withPredicate:v8];

  uint64_t v19 = 0;
  uint64_t v15 = [v3 executeQuery:v14 error:&v19];
  uint64_t v16 = [v15 countDictionary];
  id v17 = [v16 allKeys];

  return v17;
}

- (void)buildClosuresForMaximum:(int)a3 withMinimumLikelihood:(double)a4 recentInstallCount:(int)a5 task:(id)a6 onBoot:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10007F180;
  v59[3] = &unk_100175628;
  v59[4] = &v60;
  [v12 setExpirationHandler:v59];
  if (DMIsMigrationNeeded())
  {
    uint64_t v13 = (id)qword_1001C41C8;
    os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)qword_1001C41C8);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v65) = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, v15, "DuetClosuresPrewarm", "onBoot:%d, bundleIDs:", buf, 8u);
      }
    }

    [v12 setTaskCompleted];
  }
  else
  {
    BOOL v47 = v7;
    v52 = +[_DKKnowledgeStore knowledgeStore];
    unsigned int v46 = a5;
    uint64_t v16 = +[_DKApplicationMetadataKey extensionHostIdentifier];
    id v17 = +[_DKQuery predicateForObjectsWithMetadataKey:v16];
    v51 = +[NSCompoundPredicate notPredicateWithSubpredicate:v17];

    v18 = +[NSDate dateWithTimeIntervalSinceNow:-1209600.0];
    v50 = +[_DKQuery predicateForEventsWithStartDateAfter:v18];

    uint64_t v19 = [(_DASClosureManager *)self appsLaunchedSinceBoot];
    v20 = [(_DASClosureManager *)self appsToExclude];
    id v21 = [v19 arrayByAddingObjectsFromArray:v20];

    if ([v21 count])
    {
      id v22 = qword_1001C41D0;
      if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Excluding apps: %@", buf, 0xCu);
      }
      id v23 = +[_DKQuery predicateForEventsWithStringValueInValues:v21];
      v49 = +[NSCompoundPredicate notPredicateWithSubpredicate:v23];
    }
    else
    {
      v49 = +[NSPredicate predicateWithValue:1];
    }
    v66[0] = v51;
    v66[1] = v50;
    v66[2] = v49;
    id v24 = +[NSArray arrayWithObjects:v66 count:3];
    id v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

    id v26 = +[_DKSystemEventStreams appInFocusStream];
    id v27 = +[_DKPredictionQuery topNPredictionQueryForStream:v26 withPredicate:v25 withTopN:(int)((double)a3 * 1.5) withMinLikelihood:a4];

    [v27 setReadMetadata:1];
    [v27 setSlotDuration:86400];
    [v27 setMinimumDaysOfHistory:1];
    id v58 = 0;
    uint64_t v28 = [v52 executeQuery:v27 error:&v58];
    id v29 = v58;
    if (v29)
    {
      long long v30 = qword_1001C41D0;
      if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
        sub_1000F2D14(v30);
      }
      [v12 setTaskCompleted];
    }
    else
    {
      v31 = +[NSDate date];
      v48 = [v28 valueAtDate:v31];

      v32 = qword_1001C41D0;
      if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v48;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Elements are: %@", buf, 0xCu);
      }
      if (*((unsigned char *)v61 + 24))
      {
        id v57 = 0;
        unsigned __int8 v33 = [v12 setTaskExpiredWithRetryAfter:&v57 error:0.0];
        id v45 = v57;
        if ((v33 & 1) == 0)
        {
          __int16 v34 = (id)qword_1001C41C8;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            id v35 = [v12 identifier];
            sub_1000F9104(v35, (uint64_t)v45, (uint64_t)buf);
          }

          [v12 setTaskCompleted];
        }
      }
      else
      {
        long long v36 = [v48 allKeys];
        id v45 = [v36 mutableCopy];

        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10007F194;
        v55[3] = &unk_100176CF0;
        id v56 = v48;
        [v45 sortUsingComparator:v55];
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10007F228;
        v54[3] = &unk_100176D18;
        v54[4] = self;
        long long v37 = +[NSPredicate predicateWithBlock:v54];
        long long v38 = [v45 filteredArrayUsingPredicate:v37];

        if ((unint64_t)[v38 count] > a3)
        {
          uint64_t v39 = [v38 subarrayWithRange:0, a3];

          long long v38 = (void *)v39;
        }
        v44 = [v38 arrayByAddingObject:@"com.apple.InputUI"];

        id v40 = [(_DASClosureManager *)self recentlyInstalledAppsLimitedTo:v46 withStore:v52];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10007F234;
        v53[3] = &unk_100176D18;
        v53[4] = self;
        v41 = +[NSPredicate predicateWithBlock:v53];
        v42 = [v40 filteredArrayUsingPredicate:v41];

        v43 = [v42 arrayByAddingObjectsFromArray:v44];
        [(_DASClosureManager *)self buildClosuresForApps:v43 withTask:v12 onBoot:v47];
      }
    }
  }
  _Block_object_dispose(&v60, 8);
}

- (void)buildClosuresOnBootWithTask:(id)a3
{
}

- (id)mostRecentBootTime
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  *(void *)BOOL v7 = 0x1500000001;
  size_t v6 = 16;
  if (sysctl(v7, 2u, &v4, &v6, 0, 0) == -1) {
    +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  }
  else {
  os_log_t v2 = +[NSDate dateWithTimeIntervalSince1970:(double)(int)v5 / 1000000.0 + (double)v4];
  }

  return v2;
}

- (void)buildClosuresOpportunisticWithTask:(id)a3
{
}

- (void)collectClosureTelemetryWithTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DASClosureManager *)self mostRecentBootTime];
  size_t v6 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  BOOL v7 = [v5 laterDate:v6];

  [(_DASCollectTelemetryActivityContext *)self->_collectTelemetryActivityContext updateWithtask:v4 prewarmingStartDate:v5 launchStartDate:v7];
  os_signpost_id_t v8 = qword_1001C41D0;
  if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
  {
    collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = collectTelemetryActivityContext;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Running telemetry collection using context: %@", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007F518;
  v11[3] = &unk_1001754F8;
  v11[4] = self;
  [v4 setExpirationHandler:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007F528;
  v10[3] = &unk_100176D90;
  v10[4] = self;
  [(_DASClosureManager *)self collectPrewarmingDataWithCompletion:v10];
}

- (void)collectLaunchDataWithBootBatchTimestamp:(double)a3 opportunisticBatchTimestamp:(double)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = objc_opt_new();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  id v10 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  id v11 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  [v11 addSubsystem:@"com.apple.app_launch_measurement" category:@"ApplicationLaunch"];
  [v10 setSubsystemCategoryFilter:v11];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10007FF04;
  v27[3] = &unk_100176DB8;
  double v32 = a3;
  double v33 = a4;
  id v29 = v38;
  long long v30 = v36;
  v31 = v34;
  id v12 = v9;
  id v28 = v12;
  [v10 setEndEventProcessingBlock:v27];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000801A8;
  v21[3] = &unk_100176DE0;
  id v13 = v8;
  id v23 = v13;
  id v14 = v12;
  id v22 = v14;
  id v24 = v38;
  id v25 = v36;
  id v26 = v34;
  [v10 setProcessingCompletionBlock:v21];
  os_signpost_id_t v15 = [(_DASCollectTelemetryActivityContext *)self->_collectTelemetryActivityContext launchDataCollectionStartDate];
  collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
  id v20 = 0;
  unsigned __int8 v17 = [(_DASClosureManager *)self extractSignposts:v10 startDate:v15 chunkedByInterval:collectTelemetryActivityContext context:&v20 error:3600.0];
  id v18 = v20;

  if (v18) {
    unsigned __int8 v19 = 0;
  }
  else {
    unsigned __int8 v19 = v17;
  }
  if ((v19 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
    sub_1000F91A0();
  }

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

- (void)collectPrewarmingDataWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000804EC;
  void v21[4] = sub_1000804FC;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000804EC;
  v19[4] = sub_1000804FC;
  id v20 = 0;
  id v5 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  id v6 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  [v6 addSubsystem:@"com.apple.dasd.signpost" category:@"DuetClosuresTelemetry"];
  [v5 setSubsystemCategoryFilter:v6];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100080504;
  v18[3] = &unk_100176E08;
  v18[5] = v21;
  v18[6] = v19;
  v18[4] = self;
  [v5 setEmitEventProcessingBlock:v18];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100080700;
  v14[3] = &unk_100176E30;
  id v7 = v4;
  id v15 = v7;
  uint64_t v16 = v21;
  unsigned __int8 v17 = v19;
  [v5 setProcessingCompletionBlock:v14];
  id v8 = [(_DASCollectTelemetryActivityContext *)self->_collectTelemetryActivityContext prewarmingDataCollectionStartDate];
  collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
  id v13 = 0;
  unsigned __int8 v10 = [(_DASClosureManager *)self extractSignposts:v5 startDate:v8 chunkedByInterval:collectTelemetryActivityContext context:&v13 error:3600.0];
  id v11 = v13;

  if (v11) {
    unsigned __int8 v12 = 0;
  }
  else {
    unsigned __int8 v12 = v10;
  }
  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
    sub_1000F91A0();
  }

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

- (BOOL)extractSignposts:(id)a3 startDate:(id)a4 chunkedByInterval:(double)a5 context:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 dateByAddingTimeInterval:3600.0];
  id v14 = +[NSDate now];
  [v11 timeIntervalSinceDate:v14];
  if (v15 >= -3600.0)
  {
    id v16 = 0;
    char v17 = 1;
    if (!a7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v25 = a7;
  id v18 = 0;
  while (1)
  {
    unsigned __int8 v19 = [v12 wasDeferred:v25];
    if (v19)
    {
      id v22 = v11;
      id v16 = v18;
LABEL_10:
      char v17 = v19 ^ 1;
      id v11 = v22;
      goto LABEL_12;
    }
    id v26 = v18;
    unsigned __int8 v21 = [v10 processLogArchiveWithPath:0 startDate:v11 endDate:v13 errorOut:&v26];
    id v16 = v26;

    if ((v21 & 1) == 0) {
      break;
    }
    id v22 = v13;

    id v13 = [v22 dateByAddingTimeInterval:3600.0];

    [v22 timeIntervalSinceDate:v14];
    id v11 = v22;
    id v18 = v16;
    if (v23 >= -3600.0) {
      goto LABEL_10;
    }
  }
  char v17 = 0;
LABEL_12:
  a7 = v25;
  if (v25) {
LABEL_13:
  }
    *a7 = v16;
LABEL_14:

  return v17;
}

- (_DASCollectTelemetryActivityContext)collectTelemetryActivityContext
{
  return self->_collectTelemetryActivityContext;
}

- (void)setCollectTelemetryActivityContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end