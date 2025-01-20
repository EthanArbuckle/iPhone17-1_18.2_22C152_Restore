@interface _OSInactivityPredictionBackupManager
+ (BOOL)hasBackup;
- (OS_os_log)log;
- (_OSInactivityPredictionBackupManager)init;
- (id)hydrateBackup;
- (void)backupData;
- (void)setLog:(id)a3;
@end

@implementation _OSInactivityPredictionBackupManager

- (_OSInactivityPredictionBackupManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSInactivityPredictionBackupManager;
  v2 = [(_OSInactivityPredictionBackupManager *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.backupmanager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (BOOL)hasBackup
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osintelligence.inactivitybackup"];
  uint64_t v3 = 2;
  do
  {
    v4 = +[NSString stringWithFormat:@"backup.v%d", v3];
    v5 = [v2 objectForKey:v4];

    if (v3 < 2) {
      break;
    }
    uint64_t v3 = (v3 - 1);
  }
  while (!v5);

  return v5 != 0;
}

- (void)backupData
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osintelligence.inactivitybackup"];
  v4 = +[_OSLockHistory sharedInstance];
  if ([v4 hasEnoughHistoryForInactivityPrediction])
  {
    v36 = self;
    v38 = v3;
    v5 = +[NSMutableDictionary dictionary];
    v39 = +[NSMutableDictionary dictionary];
    v42 = +[NSCalendar currentCalendar];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v37 = v4;
    id obj = [v4 allIntervalsSortByStartAsc];
    id v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v41 = *(void *)v48;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v48 != v41) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v10 = [v9 startDate];
          v11 = [v42 components:32 fromDate:v10];
          id v12 = [v11 hour];

          v13 = [v9 endDate];
          v14 = [v9 startDate];
          [v13 timeIntervalSinceDate:v14];
          double v16 = v15;

          v17 = +[NSNumber numberWithInteger:v12];
          v18 = [v5 objectForKeyedSubscript:v17];
          v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 intValue] + 1);
          v20 = +[NSNumber numberWithInteger:v12];
          [v5 setObject:v19 forKeyedSubscript:v20];

          if (v16 > 10800.0)
          {
            v21 = +[NSNumber numberWithInteger:v12];
            v22 = [v39 objectForKeyedSubscript:v21];

            if (!v22)
            {
              v22 = +[NSMutableArray array];
            }
            [v22 addObject:v9];
            v23 = +[NSNumber numberWithInteger:v12];
            [v39 setObject:v22 forKeyedSubscript:v23];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v7);
    }

    log = v36->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v25 = log;
      v26 = [v39 allKeys];
      v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 count]);
      *(_DWORD *)buf = 138412290;
      v52 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Found %@ events", buf, 0xCu);
    }
    v28 = +[NSMutableDictionary dictionary];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100004A64;
    v43[3] = &unk_100064748;
    id v29 = v5;
    id v44 = v29;
    id v30 = v28;
    id v45 = v30;
    v46 = v36;
    [v39 enumerateKeysAndObjectsUsingBlock:v43];
    v31 = +[NSKeyedArchiver archivedDataWithRootObject:v30 requiringSecureCoding:1 error:0];
    v32 = +[NSString stringWithFormat:@"backup.v%d", 2];
    id v3 = v38;
    [v38 setObject:v31 forKey:v32];
    v33 = +[NSDate now];
    [v33 timeIntervalSinceReferenceDate];
    [v38 setDouble:x0 forKey:@"lastUpdate"];

    v35 = +[NSString stringWithFormat:@"backup.v%d", 1];
    [v38 removeObjectForKey:v35];

    v4 = v37;
  }
}

- (id)hydrateBackup
{
  id v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = 2;
  while (1)
  {
    v4 = +[NSString stringWithFormat:@"backup.v%d", v3];
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osintelligence.inactivitybackup"];
    uint64_t v6 = [v5 objectForKey:v4];
    if (v6) {
      break;
    }

    BOOL v7 = v3 != 0;
    uint64_t v3 = (v3 - 1);
    if (v3 == 0 || !v7) {
      goto LABEL_6;
    }
  }
  v8 = (void *)v6;
  uint64_t v9 = objc_opt_class();
  v10 = v2;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v17 = v11;
  id v2 = v10;
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v17, v12, objc_opt_class(), 0);
  v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v8 error:0];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004F60;
  v18[3] = &unk_100064770;
  int v20 = v3;
  id v19 = v2;
  [v14 enumerateKeysAndObjectsUsingBlock:v18];

LABEL_6:
  id v15 = [v2 copy];

  return v15;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end