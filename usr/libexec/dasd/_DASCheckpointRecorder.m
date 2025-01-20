@interface _DASCheckpointRecorder
+ (BOOL)shouldLogCheckpointForActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5;
- (BOOL)reportFeatureStatus:(unint64_t)a3 forFeature:(unint64_t)a4 statusChangedDate:(id)a5 error:(id *)a6;
- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5;
- (BOOL)sendTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
- (BOOL)validateFeatureCode:(id)a3;
- (NSMutableDictionary)availableStatus;
- (NSMutableDictionary)previewAvailableStatus;
- (NSMutableDictionary)taskToDependencies;
- (NSMutableDictionary)taskToFeatureCodes;
- (NSMutableDictionary)taskToSemanticVersion;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)featureAvailabilityQueue;
- (OS_dispatch_queue)featureCodeQueue;
- (OS_dispatch_queue)featureStatusQueue;
- (OS_dispatch_queue)taskCheckpointQueue;
- (OS_dispatch_queue)taskDependencyQueue;
- (OS_os_log)log;
- (_DASCheckpointRecorder)init;
- (int)notifyToken;
- (void)addDependencyInfoForTask:(id)a3 producedResultIdentifiers:(id)a4 dependencyIdentifiers:(id)a5;
- (void)addFeatureCodesForTask:(id)a3 featureCodes:(id)a4 semanticVersion:(int64_t)a5;
- (void)handlePLBackgroundProcessingNotification;
- (void)logFeatureAvailability:(unint64_t)a3 forFeature:(unint64_t)a4;
- (void)populateFeatureStatusFromPast;
- (void)registerFeatureStatusTask;
- (void)registerReportTaskInfoTask;
- (void)reportDependencyInfoForTasks;
- (void)reportFeatureCodesForTasks;
- (void)reportFeatureStatus;
- (void)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
- (void)setAvailableStatus:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setFeatureAvailabilityQueue:(id)a3;
- (void)setFeatureCodeQueue:(id)a3;
- (void)setFeatureStatusQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPreviewAvailableStatus:(id)a3;
- (void)setTaskCheckpointQueue:(id)a3;
- (void)setTaskDependencyQueue:(id)a3;
- (void)setTaskToDependencies:(id)a3;
- (void)setTaskToFeatureCodes:(id)a3;
- (void)setTaskToSemanticVersion:(id)a3;
@end

@implementation _DASCheckpointRecorder

+ (BOOL)shouldLogCheckpointForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 isIntensive])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v3 fastPass];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = +[_DASPhotosPolicy isPhotosSyncActivity:v3];
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080A8C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C41E0 != -1) {
    dispatch_once(&qword_1001C41E0, block);
  }
  v2 = (void *)qword_1001C41D8;

  return v2;
}

- (_DASCheckpointRecorder)init
{
  v41.receiver = self;
  v41.super_class = (Class)_DASCheckpointRecorder;
  v2 = [(_DASCheckpointRecorder *)&v41 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"checkpointRecorder"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v5;

    uint64_t v7 = objc_opt_new();
    taskToFeatureCodes = v2->_taskToFeatureCodes;
    v2->_taskToFeatureCodes = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    taskToSemanticVersion = v2->_taskToSemanticVersion;
    v2->_taskToSemanticVersion = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    taskToDependencies = v2->_taskToDependencies;
    v2->_taskToDependencies = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    availableStatus = v2->_availableStatus;
    v2->_availableStatus = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    previewAvailableStatus = v2->_previewAvailableStatus;
    v2->_previewAvailableStatus = (NSMutableDictionary *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.duetactivityscheduler.taskCheckpoint", v18);
    taskCheckpointQueue = v2->_taskCheckpointQueue;
    v2->_taskCheckpointQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.duetactivityscheduler.featureCode", v22);
    featureCodeQueue = v2->_featureCodeQueue;
    v2->_featureCodeQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.duetactivityscheduler.taskDependency", v26);
    taskDependencyQueue = v2->_taskDependencyQueue;
    v2->_taskDependencyQueue = (OS_dispatch_queue *)v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = dispatch_queue_attr_make_with_qos_class(v29, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.duetactivityscheduler.featureAvailability", v30);
    featureAvailabilityQueue = v2->_featureAvailabilityQueue;
    v2->_featureAvailabilityQueue = (OS_dispatch_queue *)v31;

    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create("com.apple.duetactivityscheduler.featureStatusRecorder", v33);
    featureStatusQueue = v2->_featureStatusQueue;
    v2->_featureStatusQueue = (OS_dispatch_queue *)v34;

    v36 = (const char *)[@"com.apple.perfpowerservices.reportfeaturestatus" UTF8String];
    v37 = v2->_featureStatusQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100080DB0;
    handler[3] = &unk_1001759D0;
    v40 = v2;
    notify_register_dispatch(v36, &v2->_notifyToken, v37, handler);
  }
  return v2;
}

- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a4];
  unsigned __int8 v10 = [(_DASCheckpointRecorder *)self validateFeatureCode:v9];

  if (v10)
  {
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a4];
    v12 = +[NSPredicate predicateWithFormat:@"FeatureCode == %@", v11];

    uint64_t v13 = +[_DASPPSDataManager sharedInstance];
    id v32 = 0;
    v14 = [v13 getPPSTimeSeries:@"BackgroundProcessing" category:@"FeatureCheckpoint" valueFilter:v12 metrics:0 timeFilter:0 limitCount:1 offsetCount:0 readDirection:1 filepath:0 error:&v32];
    id v15 = v32;

    if (!v15 && v14)
    {
      v29 = v14;
      v30 = v12;
      v16 = [v14 firstObject];
      v17 = [v16 metricKeysAndValues];
      v18 = [v17 objectForKeyedSubscript:@"FeatureState"];
      id v19 = [v18 unsignedIntegerValue];

      if (v19 == (id)a3 && (a3 == 50 || a3 == 30))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v21 = log;
          v22 = +[NSNumber numberWithUnsignedInteger:a3];
          dispatch_queue_t v23 = +[NSNumber numberWithUnsignedInteger:a4];
          *(_DWORD *)buf = 138412546;
          dispatch_queue_t v34 = v22;
          __int16 v35 = 2112;
          v36 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Duplicate feature state: %@ for feature code: %@", buf, 0x16u);
        }
        BOOL v24 = 1;
        v14 = v29;
        v12 = v30;
LABEL_20:

        goto LABEL_23;
      }

      v14 = v29;
      v12 = v30;
    }
    if (a3 == 50 || a3 == 30)
    {
      featureAvailabilityQueue = self->_featureAvailabilityQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000811B0;
      block[3] = &unk_100176EC8;
      block[4] = self;
      void block[5] = a3;
      block[6] = a4;
      dispatch_sync(featureAvailabilityQueue, block);
    }
    v16 = +[NSMutableDictionary dictionary];
    v26 = +[NSNumber numberWithUnsignedInteger:a4];
    [v16 setObject:v26 forKeyedSubscript:@"FeatureCode"];

    dispatch_queue_t v27 = +[NSNumber numberWithUnsignedInteger:a3];
    [v16 setObject:v27 forKeyedSubscript:@"FeatureState"];

    if (a5) {
      *a5 = v15;
    }
    BOOL v24 = [(_DASCheckpointRecorder *)self sendDataToPPS:v16 subsystem:@"BackgroundProcessing" category:@"FeatureCheckpoint"];
    goto LABEL_20;
  }
  id v15 = +[NSError errorWithDomain:BGSystemTaskSchedulerErrorDomain code:110 userInfo:0];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F93C8();
    if (a5) {
      goto LABEL_12;
    }
LABEL_22:
    BOOL v24 = 0;
    goto LABEL_23;
  }
  if (!a5) {
    goto LABEL_22;
  }
LABEL_12:
  id v15 = v15;
  BOOL v24 = 0;
  *a5 = v15;
LABEL_23:

  return v24;
}

- (void)logFeatureAvailability:(unint64_t)a3 forFeature:(unint64_t)a4
{
  if (a3 == 30)
  {
    v6 = +[NSDate date];
    p_previewAvailableStatus = &self->_previewAvailableStatus;
    previewAvailableStatus = self->_previewAvailableStatus;
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a4];
    unsigned __int8 v10 = [v9 stringValue];
    [(NSMutableDictionary *)previewAvailableStatus setObject:v6 forKeyedSubscript:v10];
    CFStringRef v11 = @"previewAvailableStatus";
    goto LABEL_5;
  }
  if (a3 == 50)
  {
    v6 = +[NSDate date];
    p_previewAvailableStatus = &self->_availableStatus;
    availableStatus = self->_availableStatus;
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a4];
    unsigned __int8 v10 = [v9 stringValue];
    [(NSMutableDictionary *)availableStatus setObject:v6 forKeyedSubscript:v10];
    CFStringRef v11 = @"availableStatus";
LABEL_5:

    [(NSUserDefaults *)self->_defaults setObject:*p_previewAvailableStatus forKey:v11];
  }
  uint64_t v13 = +[_DASPPSDataManager sharedInstance];
  v39[0] = 0;
  v14 = [v13 getPPSTimeSeries:@"BackgroundProcessing" category:@"Config" valueFilter:0 metrics:0 timeFilter:0 limitCount:1 offsetCount:0 readDirection:1 filepath:0 error:v39];
  id v15 = v39[0];

  v16 = 0;
  if (!v15 && v14)
  {
    v17 = [v14 firstObject];
    v18 = [v17 metricKeysAndValues];
    id v19 = [v18 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"];

    v20 = [v17 metricKeysAndValues];
    [v20 objectForKeyedSubscript:@"InstallType"];

    if (v19)
    {
      [v19 doubleValue];
      v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
      [v16 timeIntervalSinceNow];
    }
    else
    {
      v16 = 0;
    }
  }
  if (a4 - 100 > 0x64)
  {
    v25 = 0;
  }
  else
  {
    v21 = +[NSPredicate predicateWithFormat:@"WorkloadType == %@", &off_100187018];
    v22 = +[_DASPPSDataManager sharedInstance];
    id v38 = 0;
    dispatch_queue_t v23 = [v22 getPPSTimeSeries:@"BackgroundProcessing" category:@"WorkloadInformation" valueFilter:v21 metrics:0 timeFilter:0 limitCount:1 offsetCount:0 readDirection:1 filepath:0 error:&v38];
    id v24 = v38;

    v25 = 0;
    if (!v24 && v23)
    {
      v26 = [v23 firstObject];
      dispatch_queue_t v27 = [v26 metricKeysAndValues];
      v25 = [v27 objectForKeyedSubscript:@"Size"];
    }
  }
  v28 = +[_APRSPLLogger sharedInstance];
  [v28 getInferredCarryStatus];

  v29 = +[NSDate now];
  if (v16 && [v16 compare:v29] != (id)1)
  {
    v30 = +[_DASPPSDataManager sharedInstance];
    id v31 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v16 endDate:v29];
    id v37 = 0;
    id v32 = [v30 getPPSTimeSeries:@"BackgroundProcessing" category:@"FeatureCheckpoint" valueFilter:0 metrics:0 timeFilter:v31 limitCount:1 offsetCount:0 readDirection:1 filepath:0 error:&v37];
    id v33 = v37;

    if (!v33 && v32)
    {
      dispatch_queue_t v34 = [v32 firstObject];
      __int16 v35 = [v34 metricKeysAndValues];
      [v35 objectForKeyedSubscript:@"FeatureState"];
    }
  }
  id v36 = v25;
  AnalyticsSendEventLazy();
}

- (BOOL)validateFeatureCode:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_DASPlistParser sharedInstance];
  v5 = [v4 dictionaryForPlist:2];

  v6 = [v3 stringValue];

  uint64_t v7 = [v5 objectForKey:v6];
  LOBYTE(v3) = v7 != 0;

  return (char)v3;
}

- (BOOL)sendTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"TaskName"];

  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forKeyedSubscript:@"CheckpointState"];

  LOBYTE(v9) = [(_DASCheckpointRecorder *)self sendDataToPPS:v8 subsystem:@"BackgroundProcessing" category:@"TaskCheckpoint"];
  return (char)v9;
}

- (void)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v8 = a4;
  taskCheckpointQueue = self->_taskCheckpointQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100081B14;
  v11[3] = &unk_100176F18;
  id v12 = v8;
  uint64_t v13 = self;
  unint64_t v14 = a3;
  id v15 = a5;
  id v10 = v8;
  dispatch_async(taskCheckpointQueue, v11);
}

- (void)handlePLBackgroundProcessingNotification
{
  uint64_t state64 = 0;
  int notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    log = self->_log;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v7 = "Invalid notify token";
    id v8 = log;
    uint32_t v9 = 2;
    goto LABEL_7;
  }
  uint32_t state = notify_get_state(notifyToken, &state64);
  if (state)
  {
    uint32_t v5 = state;
    v6 = self->_log;
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    uint32_t v13 = v5;
    id v7 = "notify_get_state() failed with error %u";
    id v8 = v6;
    uint32_t v9 = 8;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    return;
  }
}

- (void)addFeatureCodesForTask:(id)a3 featureCodes:(id)a4 semanticVersion:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  featureCodeQueue = self->_featureCodeQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081D7C;
  v13[3] = &unk_100176F40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(featureCodeQueue, v13);
}

- (BOOL)reportFeatureStatus:(unint64_t)a3 forFeature:(unint64_t)a4 statusChangedDate:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v11 forKeyedSubscript:@"FeatureCode"];

  id v12 = +[NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:v12 forKeyedSubscript:@"FeatureState"];

  [v10 setObject:v9 forKeyedSubscript:@"StateChangedDate"];
  LOBYTE(self) = [(_DASCheckpointRecorder *)self sendDataToPPS:v10 subsystem:@"BackgroundProcessing" category:@"FeatureStatus"];

  return (char)self;
}

- (void)reportFeatureCodesForTasks
{
  featureCodeQueue = self->_featureCodeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081F5C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(featureCodeQueue, block);
}

- (void)populateFeatureStatusFromPast
{
  id v3 = +[_DASPPSDataManager sharedInstance];
  +[NSPredicate predicateWithFormat:@"FeatureState == %@ OR FeatureState == %@", &off_100187030, &off_100187048];
  v28 = v30 = v3;
  BOOL v4 = [v3 getPPSTimeSeries:@"BackgroundProcessing" category:@"FeatureCheckpoint" valueFilter:0 metrics:0 timeFilter:0 filepath:@"BackgroundProcessing" error:0];
  v29 = self;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F9560();
  }
  id v33 = (NSMutableDictionary *)objc_opt_new();
  id v31 = (NSMutableDictionary *)objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = [v9 metricKeysAndValues];
        id v11 = [v10 objectForKeyedSubscript:@"FeatureCode"];
        id v12 = [v11 integerValue];

        uint32_t v13 = [v10 objectForKeyedSubscript:@"FeatureState"];
        if ([v13 unsignedIntegerValue] == (id)50)
        {
          id v14 = +[NSNumber numberWithInteger:v12];
          id v15 = [v14 stringValue];
          int64_t v16 = [(NSMutableDictionary *)v33 objectForKeyedSubscript:v15];

          if (v16) {
            goto LABEL_15;
          }
          [v9 epochTimestamp];
          v17 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          v18 = +[NSNumber numberWithInteger:v12];
          id v19 = [v18 stringValue];
          v20 = v33;
          goto LABEL_14;
        }
        if ([v13 unsignedIntegerValue] == (id)30)
        {
          v21 = +[NSNumber numberWithInteger:v12];
          v22 = [v21 stringValue];
          dispatch_queue_t v23 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:v22];

          if (!v23)
          {
            [v9 epochTimestamp];
            v17 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
            v18 = +[NSNumber numberWithInteger:v12];
            id v19 = [v18 stringValue];
            v20 = v31;
LABEL_14:
            [(NSMutableDictionary *)v20 setObject:v17 forKeyedSubscript:v19];
          }
        }
LABEL_15:
      }
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v6);
  }

  if (os_log_type_enabled((os_log_t)v29->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F94F8();
  }
  if (os_log_type_enabled((os_log_t)v29->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F9490();
  }
  availableStatus = v29->_availableStatus;
  v29->_availableStatus = v33;
  v25 = v33;

  previewAvailableStatus = v29->_previewAvailableStatus;
  v29->_previewAvailableStatus = v31;
  dispatch_queue_t v27 = v31;

  [(NSUserDefaults *)v29->_defaults setObject:v29->_availableStatus forKey:@"availableStatus"];
  [(NSUserDefaults *)v29->_defaults setObject:v29->_previewAvailableStatus forKey:@"previewAvailableStatus"];
}

- (void)reportFeatureStatus
{
  featureAvailabilityQueue = self->_featureAvailabilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008266C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(featureAvailabilityQueue, block);
}

- (void)addDependencyInfoForTask:(id)a3 producedResultIdentifiers:(id)a4 dependencyIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  taskDependencyQueue = self->_taskDependencyQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000829DC;
  v15[3] = &unk_100175C78;
  id v16 = v9;
  id v17 = v10;
  v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(taskDependencyQueue, v15);
}

- (void)registerFeatureStatusTask
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082B58;
  v4[3] = &unk_100175600;
  v4[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.reportfeatureStatus" usingQueue:0 launchHandler:v4];
}

- (void)registerReportTaskInfoTask
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082C48;
  v4[3] = &unk_100175600;
  v4[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.reportTaskInfo" usingQueue:0 launchHandler:v4];
}

- (void)reportDependencyInfoForTasks
{
  taskDependencyQueue = self->_taskDependencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082D1C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(taskDependencyQueue, block);
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[_DASPPSDataManager sharedInstance];
  unsigned __int8 v11 = [v10 sendDataToPPS:v9 subsystem:v8 category:v7];

  return v11;
}

- (OS_dispatch_queue)featureCodeQueue
{
  return self->_featureCodeQueue;
}

- (void)setFeatureCodeQueue:(id)a3
{
}

- (OS_dispatch_queue)taskCheckpointQueue
{
  return self->_taskCheckpointQueue;
}

- (void)setTaskCheckpointQueue:(id)a3
{
}

- (OS_dispatch_queue)taskDependencyQueue
{
  return self->_taskDependencyQueue;
}

- (void)setTaskDependencyQueue:(id)a3
{
}

- (OS_dispatch_queue)featureAvailabilityQueue
{
  return self->_featureAvailabilityQueue;
}

- (void)setFeatureAvailabilityQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)taskToFeatureCodes
{
  return self->_taskToFeatureCodes;
}

- (void)setTaskToFeatureCodes:(id)a3
{
}

- (NSMutableDictionary)taskToSemanticVersion
{
  return self->_taskToSemanticVersion;
}

- (void)setTaskToSemanticVersion:(id)a3
{
}

- (NSMutableDictionary)availableStatus
{
  return self->_availableStatus;
}

- (void)setAvailableStatus:(id)a3
{
}

- (NSMutableDictionary)previewAvailableStatus
{
  return self->_previewAvailableStatus;
}

- (void)setPreviewAvailableStatus:(id)a3
{
}

- (NSMutableDictionary)taskToDependencies
{
  return self->_taskToDependencies;
}

- (void)setTaskToDependencies:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_int notifyToken = a3;
}

- (OS_dispatch_queue)featureStatusQueue
{
  return self->_featureStatusQueue;
}

- (void)setFeatureStatusQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStatusQueue, 0);
  objc_storeStrong((id *)&self->_taskToDependencies, 0);
  objc_storeStrong((id *)&self->_previewAvailableStatus, 0);
  objc_storeStrong((id *)&self->_availableStatus, 0);
  objc_storeStrong((id *)&self->_taskToSemanticVersion, 0);
  objc_storeStrong((id *)&self->_taskToFeatureCodes, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityQueue, 0);
  objc_storeStrong((id *)&self->_taskDependencyQueue, 0);
  objc_storeStrong((id *)&self->_taskCheckpointQueue, 0);

  objc_storeStrong((id *)&self->_featureCodeQueue, 0);
}

@end