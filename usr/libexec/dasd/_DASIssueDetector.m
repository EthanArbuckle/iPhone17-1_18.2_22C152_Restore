@interface _DASIssueDetector
+ (id)sharedInstance;
- (BOOL)hasEnoughTotalPluggedInTimeOfDuration:(int64_t)a3 withMinimumSessionDuration:(int64_t)a4 inLastHours:(double)a5;
- (BOOL)libraryExceedsPhotoCount:(int64_t)a3;
- (BOOL)shouldGenerateSpotlightProgressTTRForDevice;
- (BOOL)shouldGenerateSpotlightProgressTTRForSamples:(unint64_t)a3 initialProcessingCount:(unint64_t)a4 finalProcessingCount:(unint64_t)a5;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASIssueDetector)init;
- (id)getSpotlightTimeSeries;
- (id)ttrURLWithTitle:(id)a3 withDescription:(id)a4 withStateDictionary:(id)a5 componentID:(unint64_t)a6 componentName:(id)a7 componentVersion:(id)a8;
- (void)checkProgressForMAD;
- (void)checkProgressForSpotlight;
- (void)computeSpotlightProgressParamsForTimeSeries:(id)a3 AndReturnNumSamples:(unint64_t *)a4 initialProcessingCount:(unint64_t *)a5 finalProcessingCount:(unint64_t *)a6;
- (void)schedule;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASIssueDetector

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094924;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C42C0 != -1) {
    dispatch_once(&qword_1001C42C0, block);
  }
  v2 = (void *)qword_1001C42B8;

  return v2;
}

- (_DASIssueDetector)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DASIssueDetector;
  v2 = [(_DASIssueDetector *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"issueDetector"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.issueDetector"];
    defaults = v2->_defaults;
    v2->_defaults = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duetactivityscheduler.issueDetector", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)schedule
{
  id v2 = +[BGSystemTaskScheduler sharedScheduler];
  [v2 registerForTaskWithIdentifier:@"com.apple.dasd.issueDetector.daily" usingQueue:0 launchHandler:&stru_1001774F0];
}

- (BOOL)hasEnoughTotalPluggedInTimeOfDuration:(int64_t)a3 withMinimumSessionDuration:(int64_t)a4 inLastHours:(double)a5
{
  dispatch_queue_t v9 = +[_DASPPSDataManager sharedInstance];
  uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  id v11 = objc_alloc((Class)NSDateInterval);
  objc_super v12 = +[NSDate now];
  v40 = (void *)v10;
  id v13 = [v11 initWithStartDate:v10 endDate:v12];

  v37 = +[NSSet setWithObject:@"IsPluggedIn"];
  v41 = v9;
  v39 = v13;
  v14 = [v9 getPPSTimeSeries:@"BackgroundProcessing" category:@"SystemConditionsBattery" valueFilter:0 metrics:0 timeFilter:0 filepath:@"BackgroundProcessing" error:0];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000FBB2C((uint64_t)v14, log);
  }
  v16 = [v14 firstObject];
  [v16 epochTimestamp];
  double v18 = v17;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v14;
  id v19 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  int64_t v38 = a3;
  if (v19)
  {
    id v20 = v19;
    char v21 = 0;
    double v22 = (double)a3;
    uint64_t v23 = *(void *)v44;
    double v24 = 0.0;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v27 = [v26 metricKeysAndValues];
        v28 = [v27 objectForKeyedSubscript:@"IsPluggedIn"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v30 = [v27 objectForKeyedSubscript:@"IsPluggedIn"];
          unsigned int v31 = [v30 BOOLValue];

          if ((v21 & 1) != v31)
          {
            [v26 epochTimestamp];
            if (v31)
            {
              char v21 = 1;
              double v18 = v32;
            }
            else
            {
              char v21 = 0;
              double v33 = v32 - v18;
              if (v33 <= (double)a4) {
                double v33 = -0.0;
              }
              double v24 = v24 + v33;
            }
          }
          if (v24 > v22)
          {

            goto LABEL_21;
          }
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v24 = 0.0;
  }
LABEL_21:

  v34 = self->_log;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "PluggedIn duration %f", buf, 0xCu);
  }
  if (v24 < (double)v38)
  {
    v35 = self->_log;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_DEFAULT, "Not enough plugged in time", buf, 2u);
    }
  }

  return v24 >= (double)v38;
}

- (BOOL)libraryExceedsPhotoCount:(int64_t)a3
{
  v4 = +[_DASPPSDataManager sharedInstance];
  v5 = +[NSPredicate predicateWithFormat:@"WorkloadType == %@", &off_1001871E0];
  [v4 getPPSTimeSeries:@"BackgroundProcessing" category:@"WorkloadInformation" valueFilter:v5 metrics:0 timeFilter:0 filepath:0 error:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    double v18 = v5;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) metricKeysAndValues];
        objc_super v12 = [v11 objectForKeyedSubscript:@"Size"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v14 = [v11 objectForKeyedSubscript:@"Size"];
          id v15 = [v14 integerValue];

          if ((uint64_t)v15 > a3)
          {

            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v16 = 0;
LABEL_12:
    v5 = v18;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)checkProgressForMAD
{
  if (![(_DASIssueDetector *)self libraryExceedsPhotoCount:1500])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000FBC40();
    }
    return;
  }
  if (![(_DASIssueDetector *)self hasEnoughTotalPluggedInTimeOfDuration:43200 withMinimumSessionDuration:3600 inLastHours:-172800.0])return; {
  v73 = self;
  }
  v78 = +[NSMutableDictionary dictionary];
  v74 = +[NSMutableDictionary dictionary];
  v77 = +[NSMutableDictionary dictionary];
  v81 = +[NSMutableDictionary dictionary];
  uint64_t v3 = +[_DASPPSDataManager sharedInstance];
  v4 = +[NSDate dateWithTimeIntervalSinceNow:-172800.0];
  id v5 = objc_alloc((Class)NSDateInterval);
  v76 = v4;
  id v6 = [v4 dateByAddingTimeInterval:-172800.0];
  id v7 = +[NSDate date];
  id v8 = [v5 initWithStartDate:v6 endDate:v7];

  v71 = v8;
  v72 = v3;
  [v3 getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskWorkload" valueFilter:0 metrics:0 timeFilter:v8 filepath:0 error:0];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (!v9) {
    goto LABEL_24;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v96;
  do
  {
    objc_super v12 = 0;
    do
    {
      if (*(void *)v96 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v12);
      v14 = [v13 metricKeysAndValues];
      id v15 = [v14 objectForKeyedSubscript:@"TaskName"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v17 = [v14 objectForKeyedSubscript:@"TaskName"];
        if ([v17 containsString:@"mediaanalysis"])
        {
          double v18 = [v14 objectForKeyedSubscript:@"SubCategory"];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            long long v20 = [v14 objectForKeyedSubscript:@"SubCategory"];
            if ([v20 containsString:@"failed"])
            {
              long long v21 = [v14 objectForKeyedSubscript:@"CompletedPercentage"];
              [v81 setObject:v21 forKeyedSubscript:v17];
              goto LABEL_13;
            }
            if (!v20)
            {
              [v13 epochTimestamp];
              long long v21 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
              long long v22 = [v14 objectForKeyedSubscript:@"CompletedPercentage"];
              objc_opt_class();
              char v79 = objc_opt_isKindOfClass();

              if (v79)
              {
                uint64_t v23 = [v14 objectForKeyedSubscript:@"CompletedPercentage"];
                [v21 timeIntervalSinceDate:v76];
                double v24 = v77;
                if (v25 >= 0.0)
                {
                  v75 = [v78 objectForKeyedSubscript:v17];
                  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v75 integerValue] + 1);
                  v26 = v80 = v23;
                  [v78 setObject:v26 forKeyedSubscript:v17];

                  uint64_t v23 = v80;
                  double v24 = v74;
                }
                [v24 setObject:v23 forKeyedSubscript:v17];
              }
LABEL_13:
            }
          }
        }
      }
      objc_super v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v27 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
    id v10 = v27;
  }
  while (v27);
LABEL_24:
  log = v73->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v78;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "MAD Progress Count: %@", buf, 0xCu);
  }
  v29 = v73->_log;
  v30 = v77;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v77;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Past MAD Progress: %@", buf, 0xCu);
  }
  unsigned int v31 = v73->_log;
  double v32 = v74;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v74;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Current MAD Progress: %@", buf, 0xCu);
  }
  double v33 = v73->_log;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v81;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Current MAD Failed: %@", buf, 0xCu);
  }
  if (![v77 count] || !objc_msgSend(v78, "count"))
  {
    if (os_log_type_enabled((os_log_t)v73->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000FBBA4();
    }
    goto LABEL_78;
  }
  if (![v78 count])
  {
    int64_t v38 = &stru_100179948;
    goto LABEL_69;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v34 = [v74 allKeys];
  id v35 = [v34 countByEnumeratingWithState:&v91 objects:v103 count:16];
  if (!v35)
  {
LABEL_43:

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v45 = [v77 allKeys];
    id v46 = [v45 countByEnumeratingWithState:&v87 objects:v102 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v88;
      int64_t v38 = &stru_100179948;
      while (2)
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v88 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v87 + 1) + 8 * i);
          v51 = [v77 objectForKeyedSubscript:v50];
          uint64_t v52 = (uint64_t)[v51 integerValue];

          if (v52 <= 89)
          {
            int64_t v38 = +[NSString stringWithFormat:@"No progress for %@", v50];
            char v53 = 1;
            goto LABEL_59;
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v87 objects:v102 count:16];
        if (v47) {
          continue;
        }
        break;
      }
      char v53 = 0;
    }
    else
    {
      char v53 = 0;
      int64_t v38 = &stru_100179948;
    }
LABEL_59:

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v54 = [v81 allKeys];
    id v55 = [v54 countByEnumeratingWithState:&v83 objects:v101 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v84;
      do
      {
        for (j = 0; j != v56; j = (char *)j + 1)
        {
          if (*(void *)v84 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v83 + 1) + 8 * (void)j);
          v60 = [v81 objectForKeyedSubscript:v59];
          uint64_t v61 = (uint64_t)[v60 integerValue];

          if (v61 >= 36)
          {
            uint64_t v62 = +[NSString stringWithFormat:@"Failed count high for %@", v59];

            char v53 = 1;
            int64_t v38 = (__CFString *)v62;
          }
        }
        id v56 = [v54 countByEnumeratingWithState:&v83 objects:v101 count:16];
      }
      while (v56);
    }

    double v32 = v74;
    v30 = v77;
    if ((v53 & 1) == 0) {
      goto LABEL_77;
    }
LABEL_69:
    v63 = [(NSUserDefaults *)v73->_defaults valueForKey:@"lastDateForMADProgressTTR"];
    v34 = v63;
    if (v63 && ([v63 timeIntervalSinceNow], v64 >= -2592000.0))
    {
      if (os_log_type_enabled((os_log_t)v73->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000FBC0C();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v73->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000FBBD8();
      }
      v99[0] = @"count";
      v99[1] = @"pastProgress";
      v100[0] = v78;
      v100[1] = v30;
      v99[2] = @"currentProgress";
      v99[3] = @"failedProgress";
      v100[2] = v32;
      v100[3] = v81;
      v99[4] = @"trigger";
      v100[4] = v38;
      v65 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
      v66 = [(_DASIssueDetector *)v73 ttrURLWithTitle:@"Tap to file Radar. Slow progress detected for MediaAnalysis background job" withDescription:@"PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Is this your regular carry device? \n\n*Were a large number of photos/videos taken in the last 48 hours?\n\n\n" withStateDictionary:v65 componentID:787030 componentName:@"Duet" componentVersion:@"Activity Scheduler"];
      v67 = +[_DASNotificationManager sharedManager];
      v68 = +[NSDate dateWithTimeIntervalSinceNow:14400.0];
      [v67 postNotificationAtDate:0 withTitle:@"[Internal] Background Processing Issue" withTextContent:@"Tap to file Radar. Slow progress detected for MediaAnalysis background job" icon:@"TTR" url:v66 expirationDate:v68];

      defaults = v73->_defaults;
      v70 = +[NSDate date];
      [(NSUserDefaults *)defaults setValue:v70 forKey:@"lastDateForMADProgressTTR"];
    }
    goto LABEL_76;
  }
  id v36 = v35;
  uint64_t v37 = *(void *)v92;
  int64_t v38 = &stru_100179948;
LABEL_37:
  uint64_t v39 = 0;
  while (1)
  {
    if (*(void *)v92 != v37) {
      objc_enumerationMutation(v34);
    }
    uint64_t v40 = *(void *)(*((void *)&v91 + 1) + 8 * v39);
    v41 = [v77 objectForKeyedSubscript:v40];
    id v42 = [v41 integerValue];

    long long v43 = [v74 objectForKeyedSubscript:v40];
    id v44 = [v43 integerValue];

    if ((uint64_t)v44 > (uint64_t)v42) {
      break;
    }
    if (v36 == (id)++v39)
    {
      id v36 = [v34 countByEnumeratingWithState:&v91 objects:v103 count:16];
      if (v36) {
        goto LABEL_37;
      }
      goto LABEL_43;
    }
  }
LABEL_76:

LABEL_77:
LABEL_78:
}

- (id)getSpotlightTimeSeries
{
  id v2 = +[_DASPPSDataManager sharedInstance];
  uint64_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-216000.0];
  v4 = +[NSDate now];
  id v5 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v3 endDate:v4];
  id v6 = [v2 getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskWorkload" valueFilter:0 metrics:0 timeFilter:v5 filepath:0 error:0];

  return v6;
}

- (void)computeSpotlightProgressParamsForTimeSeries:(id)a3 AndReturnNumSamples:(unint64_t *)a4 initialProcessingCount:(unint64_t *)a5 finalProcessingCount:(unint64_t *)a6
{
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v35 = 0;
    unint64_t v37 = 0;
    unint64_t v38 = 0;
    uint64_t v40 = v6;
    uint64_t v41 = *(void *)v43;
    CFStringRef v9 = @"TaskName";
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v42 + 1) + 8 * i) metricKeysAndValues];
        objc_super v12 = [v11 objectForKeyedSubscript:@"WorkloadCategory"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v14 = [v11 objectForKeyedSubscript:@"WorkloadCategory"];
          if ([v14 unsignedIntValue] == 40)
          {
            id v15 = [v11 objectForKeyedSubscript:v9];
            objc_opt_class();
            CFStringRef v16 = v9;
            char v17 = objc_opt_isKindOfClass();

            if (v17)
            {
              double v18 = [v11 objectForKeyedSubscript:v16];
              if ([v18 containsString:@"spotlightknowledged.task"])
              {
                char v19 = [v11 objectForKeyedSubscript:@"SubCategory"];
                objc_opt_class();
                char v20 = objc_opt_isKindOfClass();

                if (v20)
                {
                  uint64_t v39 = [v11 objectForKeyedSubscript:@"SubCategory"];
                  if ([v39 containsString:@"Total"]
                    && ([v11 objectForKeyedSubscript:@"Target"],
                        long long v21 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        char v22 = objc_opt_isKindOfClass(),
                        v21,
                        (v22 & 1) != 0))
                  {
                    uint64_t v23 = [v11 objectForKeyedSubscript:@"Target"];
                    if ((unint64_t)[v23 unsignedLongValue] >> 5 < 0x465)
                    {

                      id v6 = v40;
                      goto LABEL_32;
                    }
                    double v24 = [v11 objectForKeyedSubscript:@"CompletedPercentage"];
                    objc_opt_class();
                    char v25 = objc_opt_isKindOfClass();

                    if (v25)
                    {
                      id v36 = [v11 objectForKeyedSubscript:@"CompletedPercentage"];
                      v26 = v23;
                      double v27 = (double)(unint64_t)[v23 unsignedLongValue];
                      [v36 doubleValue];
                      v29 = +[NSNumber numberWithDouble:v28 * v27 / 100.0];
                      id v30 = [v29 unsignedLongValue];

                      unint64_t v31 = v38;
                      unint64_t v35 = (unint64_t)v30;
                      if (!v37) {
                        unint64_t v31 = (unint64_t)v30;
                      }
                      ++v37;
                      unint64_t v38 = v31;

                      CFStringRef v9 = @"TaskName";
                    }
                    else
                    {
                      CFStringRef v9 = @"TaskName";
                      v26 = v23;
                    }

                    id v6 = v40;
                  }
                  else
                  {
                    id v6 = v40;
                    CFStringRef v9 = @"TaskName";
                  }
                }
                else
                {
                  id v6 = v40;
                  CFStringRef v9 = @"TaskName";
                }
              }
              else
              {
                CFStringRef v9 = v16;
              }
            }
            else
            {
              CFStringRef v9 = v16;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v35 = 0;
    unint64_t v37 = 0;
    unint64_t v38 = 0;
  }

  *a4 = v37;
  *a5 = v38;
  *a6 = v35;
LABEL_32:
}

- (BOOL)shouldGenerateSpotlightProgressTTRForDevice
{
  if ([(_DASIssueDetector *)self hasEnoughTotalPluggedInTimeOfDuration:21600 withMinimumSessionDuration:3600 inLastHours:-216000.0])
  {
    uint64_t v3 = [(NSUserDefaults *)self->_defaults valueForKey:@"lastDateForSpotlightProgressTTR"];
    v4 = v3;
    if (v3 && ([v3 timeIntervalSinceNow], v5 > -259200.0))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000FBC74();
      }
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000FBCA8();
    }
    return 0;
  }
  return v6;
}

- (BOOL)shouldGenerateSpotlightProgressTTRForSamples:(unint64_t)a3 initialProcessingCount:(unint64_t)a4 finalProcessingCount:(unint64_t)a5
{
  if (a3 > 1)
  {
    if (((a5 - a4) / (a3 - 1)) >> 5 < 0x465)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    BOOL v5 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      sub_1000FBD10();
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      sub_1000FBCDC();
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)checkProgressForSpotlight
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  if ([(_DASIssueDetector *)self shouldGenerateSpotlightProgressTTRForDevice])
  {
    uint64_t v3 = [(_DASIssueDetector *)self getSpotlightTimeSeries];
    [(_DASIssueDetector *)self computeSpotlightProgressParamsForTimeSeries:v3 AndReturnNumSamples:&v12 initialProcessingCount:&v14 finalProcessingCount:&v13];
    if ([(_DASIssueDetector *)self shouldGenerateSpotlightProgressTTRForSamples:v12 initialProcessingCount:v14 finalProcessingCount:v13])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000FBBD8();
      }
      v15[0] = @"days";
      v4 = +[NSNumber numberWithUnsignedInteger:v12];
      v16[0] = v4;
      v15[1] = @"assets processed per day";
      BOOL v5 = +[NSNumber numberWithUnsignedInteger:(v13 - v14) / (unint64_t)(v12 - 1)];
      v15[2] = @"trigger";
      v16[1] = v5;
      v16[2] = @"Not enough progress for com.apple.spotlightknowledged.task";
      BOOL v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

      id v7 = [(_DASIssueDetector *)self ttrURLWithTitle:@"Tap to file Radar. Slow progress detected for spotlightknowledged text embedding generation" withDescription:@"PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n Is this your regular carry device?\n\n" withStateDictionary:v6 componentID:185285 componentName:@"Spotlight" componentVersion:@"Backend"];
      id v8 = +[_DASNotificationManager sharedManager];
      CFStringRef v9 = +[NSDate dateWithTimeIntervalSinceNow:14400.0];
      [v8 postNotificationAtDate:0 withTitle:@"[Internal] Slow Text Embedding Generation Progress" withTextContent:@"Tap to file Radar. Slow progress detected for spotlightknowledged text embedding generation" icon:@"TTR" url:v7 expirationDate:v9];

      defaults = self->_defaults;
      uint64_t v11 = +[NSDate date];
      [(NSUserDefaults *)defaults setValue:v11 forKey:@"lastDateForSpotlightProgressTTR"];
    }
  }
}

- (id)ttrURLWithTitle:(id)a3 withDescription:(id)a4 withStateDictionary:(id)a5 componentID:(unint64_t)a6 componentName:(id)a7 componentVersion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  char v17 = +[NSString stringWithFormat:@"%@ Debug Info:\n %@", a4, a5];
  double v18 = +[NSString stringWithFormat:@"tap-to-radar://new?Title=%@&Classification=Serious Bug&ComponentID=%lu&ComponentName=%@&ComponentVersion=%@&Reproducible=Sometimes&Description=%@", v16, a6, v15, v14, v17];

  char v19 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  char v20 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v19];

  long long v21 = +[NSURL URLWithString:v20];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v21;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end