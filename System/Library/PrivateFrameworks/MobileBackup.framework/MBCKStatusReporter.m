@interface MBCKStatusReporter
+ (BOOL)_isEnabledForKey:(id)a3 account:(id)a4;
+ (void)_reportStatusForEngine:(id)a3 account:(id)a4 manager:(id)a5 key:(id)a6 values:(id)a7;
+ (void)_reportStatusForEngine:(id)a3 key:(id)a4 values:(id)a5;
+ (void)reportBackupStateChangeForEngine:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6;
+ (void)reportRestoreStateChangeForEngine:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6;
+ (void)reportStatusForAccount:(id)a3 manager:(id)a4 key:(id)a5 values:(id)a6;
@end

@implementation MBCKStatusReporter

+ (BOOL)_isEnabledForKey:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[MBCKRemoteConfiguration sharedInstance];
  v8 = [v7 valueForKey:@"MBCKStatusReporterEnabled" account:v6];

  if (!v8 || ([v8 BOOLValue] & 1) != 0)
  {
    v16[0] = @"MBCKStatusReporterEnabled";
    v16[1] = v5;
    v9 = +[NSArray arrayWithObjects:v16 count:2];
    v10 = [v9 componentsJoinedByString:@"."];

    v11 = +[MBCKRemoteConfiguration sharedInstance];
    v12 = [v11 valueForKey:v10 account:v6];

    if (v12)
    {
      if ([v12 BOOLValue])
      {
        BOOL v13 = 1;
LABEL_15:

        goto LABEL_16;
      }
      v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping status reporting for \"%{public}@\" because it's explicitly disabled", buf, 0xCu);
        goto LABEL_13;
      }
    }
    else
    {
      v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping status reporting for \"%{public}@\" because it's disabled by default", buf, 0xCu);
LABEL_13:
        _MBLog();
      }
    }

    BOOL v13 = 0;
    goto LABEL_15;
  }
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Skipping status reporting for \"%{public}@\" because it's totally disabled", buf, 0xCu);
    _MBLog();
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

+ (void)_reportStatusForEngine:(id)a3 account:(id)a4 manager:(id)a5 key:(id)a6 values:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14) {
    __assert_rtn("+[MBCKStatusReporter _reportStatusForEngine:account:manager:key:values:]", "MBCKStatusReporter.m", 57, "account");
  }
  id v18 = v17;
  if (qword_100482780 != -1) {
    dispatch_once(&qword_100482780, &stru_100417128);
  }
  if (qword_100482778 && [a1 _isEnabledForKey:v16 account:v14])
  {
    v19 = [v13 ckOperationPolicy];
    id v20 = [v19 copy];
    v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = (id)objc_opt_new();
    }
    v23 = v22;

    v24 = +[MBCellularAccess expensiveCellularAccess];
    [v23 setCellularAccess:v24];

    v25 = [v15 databaseManager];
    id v58 = 0;
    v26 = +[MBCKOperationTracker operationTrackerWithAccount:v14 databaseManager:v25 policy:v23 error:&v58];
    id v52 = v58;

    if (v26)
    {
      v51 = v26;
      v27 = [v13 ckOperationTracker];
      v28 = [v27 ckOperationGroup];
      v29 = v28;
      id v50 = v13;
      SEL v47 = a2;
      v48 = v23;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v30 = [v23 operationGroupWithName:@"reportStatus" processName:0];
      }
      id v31 = v30;

      v46 = v31;
      [v51 setCkOperationGroup:v31];
      v32 = objc_alloc_init(BackupStatusMessage);
      [(BackupStatusMessage *)v32 setKey:v16];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v49 = v18;
      id v33 = v18;
      id v34 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v55;
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(void *)v55 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            v39 = objc_alloc_init(BackupStatusKeyAndValue);
            [(BackupStatusKeyAndValue *)v39 setKey:v38];
            v40 = [v33 objectForKeyedSubscript:v38];
            [(BackupStatusKeyAndValue *)v39 setValue:v40];

            [(BackupStatusMessage *)v32 addKeysAndValues:v39];
          }
          id v35 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
        }
        while (v35);
      }

      v41 = objc_opt_new();
      [v41 addMessages:v32];
      v42 = [(id)qword_100482778 longLivedOperationForRequest:v41];
      v43 = +[MBDaemon sharedDaemon];
      [v43 holdWorkAssertion:v47];

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1002498C0;
      v53[3] = &unk_100411038;
      v53[4] = v47;
      [v42 setCompletionBlock:v53];
      v44 = MBGetDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v60 = v45;
        __int16 v61 = 2114;
        id v62 = v16;
        __int16 v63 = 2114;
        id v64 = v33;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Sending %{public}@ status, key:\"%{public}@\", values:%{public}@", buf, 0x20u);
        objc_opt_class();
        _MBLog();
      }

      v26 = v51;
      [v51 addDatabaseOperation:v42];

      id v13 = v50;
      v23 = v48;
      id v18 = v49;
    }
  }
}

+ (void)_reportStatusForEngine:(id)a3 key:(id)a4 values:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 serviceAccount];
  v11 = [v10 serviceManager];
  [a1 _reportStatusForEngine:v10 account:v12 manager:v11 key:v9 values:v8];
}

+ (void)reportStatusForAccount:(id)a3 manager:(id)a4 key:(id)a5 values:(id)a6
{
}

+ (void)reportBackupStateChangeForEngine:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6
{
  id v43 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = +[NSMutableDictionary dictionary];
  id v13 = [v43 stateDescription];
  id v14 = MBCKStringForBackupState();
  [v12 setObject:v14 forKeyedSubscript:@"state"];

  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:@"description"];
  }
  [v10 timeIntervalSinceDate:v11];
  id v16 = +[NSString stringWithFormat:@"%.6f", v15];
  [v12 setObject:v16 forKeyedSubscript:@"duration"];

  id v17 = +[NSDateFormatter ISO8601Formatter];
  id v18 = [v17 stringFromDate:v11];

  [v12 setObject:v18 forKeyedSubscript:@"start"];
  v19 = +[NSDateFormatter ISO8601Formatter];
  id v20 = [v19 stringFromDate:v10];

  [v12 setObject:v20 forKeyedSubscript:@"end"];
  if ([v43 isFinished]) {
    CFStringRef v21 = @"YES";
  }
  else {
    CFStringRef v21 = @"NO";
  }
  [v12 setObject:v21 forKeyedSubscript:@"finished"];
  if ([v43 hasError]) {
    CFStringRef v22 = @"YES";
  }
  else {
    CFStringRef v22 = @"NO";
  }
  [v12 setObject:v22 forKeyedSubscript:@"hasError"];
  v23 = [v43 device];
  v24 = [v23 dateOfLastBackup];

  if (v24)
  {
    v25 = +[NSDateFormatter ISO8601Formatter];
    v26 = [v43 device];
    v27 = [v26 dateOfLastBackup];
    v28 = [v25 stringFromDate:v27];
    [v12 setObject:v28 forKeyedSubscript:@"lastBackupDate"];
  }
  if (a4 == 8) {
    [v12 setObject:@"YES" forKeyedSubscript:@"usedAPFSSnapshot"];
  }
  if ([v43 hasError])
  {
    v29 = [v43 engineError];
    id v30 = MBExtractFirstMBErrorOrCKError(v29);

    if (v30)
    {
      id v31 = [v30 domain];
      [v12 setObject:v31 forKeyedSubscript:@"errorDomain"];

      v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
      id v33 = [v32 stringValue];
      [v12 setObject:v33 forKeyedSubscript:@"errorCode"];

      id v34 = [v30 localizedDescription];
      [v12 setObject:v34 forKeyedSubscript:@"errorDescription"];
    }
  }
  if (a4 >= 4)
  {
    id v35 = [v43 telemetry];
    uint64_t v36 = [v35 backupFileCount];
    v37 = [v36 stringValue];
    [v12 setObject:v37 forKeyedSubscript:@"backupFileCount"];

    uint64_t v38 = [v43 telemetry];
    v39 = [v38 backupDirectoryCount];
    v40 = [v39 stringValue];
    [v12 setObject:v40 forKeyedSubscript:@"backupDirectoryCount"];
  }
  v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v43 backupPolicy]);
  v42 = [v41 stringValue];
  [v12 setObject:v42 forKeyedSubscript:@"backupPolicy"];

  [a1 _reportStatusForEngine:v43 key:@"MBCKBackupEngine" values:v12];
}

+ (void)reportRestoreStateChangeForEngine:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6
{
  id v31 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = +[NSMutableDictionary dictionary];
  id v13 = MBCKStringForRestoreState(a4);
  [v12 setObject:v13 forKeyedSubscript:@"state"];

  if ([v31 isForegroundRestore]) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  [v12 setObject:v14 forKeyedSubscript:@"foreground"];
  [v10 timeIntervalSinceDate:v11];
  id v16 = +[NSString stringWithFormat:@"%.6f", v15];
  [v12 setObject:v16 forKeyedSubscript:@"duration"];

  id v17 = +[NSDateFormatter ISO8601Formatter];
  id v18 = [v17 stringFromDate:v11];

  [v12 setObject:v18 forKeyedSubscript:@"start"];
  v19 = +[NSDateFormatter ISO8601Formatter];
  id v20 = [v19 stringFromDate:v10];

  [v12 setObject:v20 forKeyedSubscript:@"end"];
  if ([v31 isFinished]) {
    CFStringRef v21 = @"YES";
  }
  else {
    CFStringRef v21 = @"NO";
  }
  [v12 setObject:v21 forKeyedSubscript:@"finished"];
  if ([v31 hasError]) {
    CFStringRef v22 = @"YES";
  }
  else {
    CFStringRef v22 = @"NO";
  }
  [v12 setObject:v22 forKeyedSubscript:@"hasError"];
  if ([v31 hasError])
  {
    v23 = [v31 engineError];
    v24 = MBExtractFirstMBErrorOrCKError(v23);

    v25 = [v24 domain];
    [v12 setObject:v25 forKeyedSubscript:@"errorDomain"];

    v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 code]);
    v27 = [v26 stringValue];
    [v12 setObject:v27 forKeyedSubscript:@"errorCode"];

    v28 = [v24 localizedDescription];
    [v12 setObject:v28 forKeyedSubscript:@"errorDescription"];
  }
  v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 backupPolicy]);
  id v30 = [v29 stringValue];
  [v12 setObject:v30 forKeyedSubscript:@"backupPolicy"];

  [a1 _reportStatusForEngine:v31 key:@"MBCKRestoreEngine" values:v12];
}

@end