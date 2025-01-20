@interface _DASFeatureDurationTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)shouldResetDurations;
- (NSDictionary)fastPassActivities;
- (NSDictionary)featuresDict;
- (NSDictionary)maximumFeatureDurationDict;
- (NSMutableDictionary)featureDurationDict;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (_DASFeatureDurationTracker)init;
- (double)durationForFeature:(id)a3;
- (double)maximumDurationForFeature:(id)a3;
- (void)loadMaximumDurations;
- (void)loadState;
- (void)resetFeatureDurations;
- (void)saveState;
- (void)setDefaults:(id)a3;
- (void)setFastPassActivities:(id)a3;
- (void)setFeatureDurationDict:(id)a3;
- (void)setFeaturesDict:(id)a3;
- (void)setLog:(id)a3;
- (void)setMaximumFeatureDurationDict:(id)a3;
- (void)updateFeatureDurationActivityCompleted:(id)a3;
@end

@implementation _DASFeatureDurationTracker

- (_DASFeatureDurationTracker)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASFeatureDurationTracker;
  v2 = [(_DASFeatureDurationTracker *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"featureDurationTracker"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F62BC(v5);
    }
    v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.activityDurationTracker"];
    defaults = v2->_defaults;
    v2->_defaults = v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    featureDurationDict = v2->_featureDurationDict;
    v2->_featureDurationDict = (NSMutableDictionary *)v8;

    v10 = +[_DASPlistParser sharedInstance];
    uint64_t v11 = [v10 dictionaryForPlist:2];
    featuresDict = v2->_featuresDict;
    v2->_featuresDict = (NSDictionary *)v11;

    [(_DASFeatureDurationTracker *)v2 loadMaximumDurations];
    v13 = +[_DASPlistParser sharedInstance];
    uint64_t v14 = [v13 dictionaryForPlist:0];
    fastPassActivities = v2->_fastPassActivities;
    v2->_fastPassActivities = (NSDictionary *)v14;

    if ([(_DASFeatureDurationTracker *)v2 shouldResetDurations])
    {
      [(_DASFeatureDurationTracker *)v2 resetFeatureDurations];
      v16 = v2->_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1000F6278(v16);
      }
    }
    [(_DASFeatureDurationTracker *)v2 loadState];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000593D0;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3EC0 != -1) {
    dispatch_once(&qword_1001C3EC0, block);
  }
  v2 = (void *)qword_1001C3EC8;

  return v2;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  uint64_t v3 = [a3 featureCodes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)loadState
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSMutableDictionary *)v2->_featureDurationDict removeAllObjects];
  uint64_t v3 = [(NSUserDefaults *)v2->_defaults objectForKey:@"FeatureDurationDict"];
  id v4 = [v3 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        featureDurationDict = v2->_featureDurationDict;
        uint64_t v11 = [v5 objectForKeyedSubscript:v9];
        [(NSMutableDictionary *)featureDurationDict setObject:v11 forKey:v9];
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v2->_featureDurationDict;
    *(_DWORD *)buf = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Loaded feature duration data from defaults %@", buf, 0xCu);
  }

  objc_sync_exit(v2);
}

- (void)saveState
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [objc_alloc((Class)NSDictionary) initWithDictionary:v2->_featureDurationDict copyItems:1];
  [(NSUserDefaults *)v2->_defaults setObject:v3 forKey:@"FeatureDurationDict"];
  id v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(NSUserDefaults *)v2->_defaults objectForKey:@"FeatureDurationDict"];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saved feature duration data to defaults %@", (uint8_t *)&v6, 0xCu);
  }
  objc_sync_exit(v2);
}

- (BOOL)shouldResetDurations
{
  if (qword_1001C3ED0 || sysctlbyname_get_data_np()) {
    return 0;
  }
  id v5 = +[NSString stringWithUTF8String:0];
  free(0);
  int v6 = [(NSUserDefaults *)self->_defaults stringForKey:@"FeatureDurationResetVersion"];
  unsigned __int8 v7 = [v6 isEqualToString:v5];
  BOOL v8 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8) {
      sub_1000F6300();
    }
  }
  else
  {
    if (v8) {
      sub_1000F6368();
    }
    [(NSUserDefaults *)self->_defaults setObject:v5 forKey:@"FeatureDurationResetVersion"];
  }
  char v3 = v7 ^ 1;

  return v3;
}

- (void)resetFeatureDurations
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = +[_DASPlistParser sharedInstance];
  uint64_t v4 = [v3 dictionaryForPlist:2];
  featuresDict = v2->_featuresDict;
  v2->_featuresDict = (NSDictionary *)v4;

  if ([(NSDictionary *)v2->_featuresDict count])
  {
    [(NSMutableDictionary *)v2->_featureDurationDict removeAllObjects];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v6 = v2->_featuresDict;
    id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableDictionary setObject:forKey:](v2->_featureDurationDict, "setObject:forKey:", &off_100186DC0, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [(_DASFeatureDurationTracker *)v2 saveState];
    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F6414((uint64_t *)&v2->_featureDurationDict, log);
    }
  }
  else
  {
    uint64_t v11 = v2->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F63D0(v11);
    }
  }
  objc_sync_exit(v2);
}

- (void)loadMaximumDurations
{
  v2 = +[NSMutableDictionary dictionary];
  char v3 = +[_DASPlistParser sharedInstance];
  uint64_t v4 = [v3 dictionaryForPlist:2];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        long long v12 = [v11 objectForKey:@"runtimeLimit"];

        [v12 doubleValue];
        if ((uint64_t)v13 <= 0 || v12 == 0) {
          long long v15 = &off_100187AE0;
        }
        else {
          long long v15 = (_UNKNOWN **)v12;
        }
        [(NSDictionary *)v2 setObject:v15 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  maximumFeatureDurationDict = self->_maximumFeatureDurationDict;
  self->_maximumFeatureDurationDict = v2;
}

- (double)maximumDurationForFeature:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSDictionary *)v5->_maximumFeatureDurationDict count]) {
    [(_DASFeatureDurationTracker *)v5 loadMaximumDurations];
  }
  maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
  id v7 = [v4 stringValue];
  uint64_t v8 = [(NSDictionary *)maximumFeatureDurationDict objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = v5->_maximumFeatureDurationDict;
    uint64_t v10 = [v4 stringValue];
    uint64_t v11 = [(NSDictionary *)v9 objectForKeyedSubscript:v10];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (double)durationForFeature:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableDictionary *)v5->_featureDurationDict count]) {
    [(_DASFeatureDurationTracker *)v5 loadState];
  }
  featureDurationDict = v5->_featureDurationDict;
  id v7 = [v4 stringValue];
  uint64_t v8 = [(NSMutableDictionary *)featureDurationDict objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = v5->_featureDurationDict;
    uint64_t v10 = [v4 stringValue];
    uint64_t v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (void)updateFeatureDurationActivityCompleted:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v40 = v4;
  if (+[_DASFeatureDurationTracker shouldTrackActivity:v4])
  {
    [(_DASFeatureDurationTracker *)v5 loadState];
    v39 = [v4 startDate];
    v38 = [v4 endTime];
    if (v39 && v38)
    {
      id v6 = +[_DASPlistParser sharedInstance];
      uint64_t v7 = [v6 dictionaryForPlist:0];
      fastPassActivities = v5->_fastPassActivities;
      v5->_fastPassActivities = (NSDictionary *)v7;

      [v38 timeIntervalSinceDate:v39];
      double v10 = v9;
      uint64_t v11 = v5->_fastPassActivities;
      double v12 = [v40 name];
      double v13 = [(NSDictionary *)v11 objectForKeyedSubscript:v12];

      if (v13)
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v14 = v5->_fastPassActivities;
        long long v15 = [v40 name];
        long long v16 = [(NSDictionary *)v14 objectForKeyedSubscript:v15];
        long long v17 = [v16 objectForKeyedSubscript:@"FeatureCodes"];

        id v18 = [v17 countByEnumeratingWithState:&v43 objects:v57 count:16];
        obj = v17;
        if (v18)
        {
          uint64_t v42 = *(void *)v44;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v44 != v42) {
                objc_enumerationMutation(obj);
              }
              long long v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              featureDurationDict = v5->_featureDurationDict;
              v22 = [v20 stringValue:v38];
              v23 = [(NSMutableDictionary *)featureDurationDict objectForKeyedSubscript:v22];

              [v23 doubleValue];
              double v25 = v10 + v24;
              v26 = +[NSNumber numberWithDouble:v10 + v24];
              v27 = v5->_featureDurationDict;
              v28 = [v20 stringValue];
              [(NSMutableDictionary *)v27 setObject:v26 forKeyedSubscript:v28];

              v29 = v5->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = +[NSNumber numberWithDouble:v10];
                v31 = [v40 name];
                maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
                v33 = [v20 stringValue];
                v34 = [(NSDictionary *)maximumFeatureDurationDict objectForKeyedSubscript:v33];
                [v34 doubleValue];
                *(_DWORD *)buf = 138413314;
                v48 = v30;
                __int16 v49 = 2112;
                v50 = v31;
                __int16 v51 = 2112;
                v52 = v20;
                __int16 v53 = 2048;
                double v54 = v25;
                __int16 v55 = 2048;
                uint64_t v56 = v35;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Deducting runtime %@ after activity %@: Feature code %@ is now %f < %f", buf, 0x34u);
              }
            }
            id v18 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
          }
          while (v18);
        }
      }
      else
      {
        obj = v5->_log;
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        {
          v36 = [v40 name];
          sub_1000F650C(v36, buf, obj);
        }
      }

      log = v5->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        sub_1000F6490((uint64_t)v5, log);
      }
      [(_DASFeatureDurationTracker *)v5 saveState];
    }
  }
  objc_sync_exit(v5);
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

- (NSDictionary)featuresDict
{
  return self->_featuresDict;
}

- (void)setFeaturesDict:(id)a3
{
}

- (NSDictionary)maximumFeatureDurationDict
{
  return self->_maximumFeatureDurationDict;
}

- (void)setMaximumFeatureDurationDict:(id)a3
{
}

- (NSDictionary)fastPassActivities
{
  return self->_fastPassActivities;
}

- (void)setFastPassActivities:(id)a3
{
}

- (NSMutableDictionary)featureDurationDict
{
  return self->_featureDurationDict;
}

- (void)setFeatureDurationDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDurationDict, 0);
  objc_storeStrong((id *)&self->_fastPassActivities, 0);
  objc_storeStrong((id *)&self->_maximumFeatureDurationDict, 0);
  objc_storeStrong((id *)&self->_featuresDict, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end