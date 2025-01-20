@interface MBTapToRadar
+ (BOOL)_collectRestoreErrorsAndFileTTR:(id)a3 restoreFailuresPlistPath:(id)a4 error:(id *)a5;
+ (BOOL)reportDryRestoreError:(id)a3;
+ (void)_fileTTR:(id)a3 classification:(id)a4 componentID:(id)a5 componentName:(id)a6 componentVersion:(id)a7 description:(id)a8 reproducibility:(id)a9 attachment:(id)a10;
+ (void)reportBackgroundRestoreTimeoutWithPersona:(id)a3;
+ (void)reportBackupVerificationFailure;
+ (void)reportLightrailRestoreFailed;
+ (void)reportRestoreErrorsIn:(id)a3 persona:(id)a4;
@end

@implementation MBTapToRadar

+ (void)_fileTTR:(id)a3 classification:(id)a4 componentID:(id)a5 componentName:(id)a6 componentVersion:(id)a7 description:(id)a8 reproducibility:(id)a9 attachment:(id)a10
{
  id v48 = a8;
  id v15 = a9;
  id v16 = a10;
  v17 = @"Serious Bug";
  if (a4) {
    v17 = (__CFString *)a4;
  }
  v18 = v17;
  v19 = (__CFString *)a7;
  v20 = (__CFString *)a6;
  v21 = (__CFString *)a5;
  id v22 = a3;
  v23 = @"1584597";
  if (v21) {
    v23 = v21;
  }
  v24 = v23;

  v25 = @"MobileBackup";
  if (v20) {
    v25 = v20;
  }
  v26 = v25;

  v27 = @"iCloud";
  if (v19) {
    v27 = v19;
  }
  v28 = v27;

  id v29 = [objc_alloc((Class)NSURLComponents) initWithString:@"tap-to-radar://new"];
  v30 = +[NSURLQueryItem queryItemWithName:@"Title" value:v22];

  v49[0] = v30;
  v31 = +[NSURLQueryItem queryItemWithName:@"Classification" value:v18];

  v49[1] = v31;
  v32 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:v24];

  v49[2] = v32;
  v33 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:v26];

  v49[3] = v33;
  v34 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:v28];

  v49[4] = v34;
  v35 = +[NSArray arrayWithObjects:v49 count:5];
  [v29 setQueryItems:v35];

  if (v15)
  {
    v36 = +[NSURLQueryItem queryItemWithName:@"Reproducibility" value:v15];
    v37 = [v29 queryItems];
    v38 = [v37 arrayByAddingObject:v36];
    [v29 setQueryItems:v38];
  }
  if (v48)
  {
    v39 = +[NSURLQueryItem queryItemWithName:@"Description" value:v48];
    v40 = [v29 queryItems];
    v41 = [v40 arrayByAddingObject:v39];
    [v29 setQueryItems:v41];
  }
  if (v16)
  {
    v42 = +[NSURLQueryItem queryItemWithName:@"Attachments" value:v16];
    v43 = [v29 queryItems];
    v44 = [v43 arrayByAddingObject:v42];
    [v29 setQueryItems:v44];
  }
  v45 = +[LSApplicationWorkspace defaultWorkspace];
  v46 = [v29 URL];
  v47 = [v46 absoluteURL];
  [v45 openURL:v47 withOptions:0];
}

+ (void)reportBackupVerificationFailure
{
  if (MBIsInternalInstall())
  {
    v4 = +[MBDaemon sharedDaemon];
    [v4 holdWorkAssertion:a2];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100160740;
    v5[3] = &unk_100414A80;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

+ (void)reportLightrailRestoreFailed
{
  if (MBIsInternalInstall())
  {
    v4 = +[MBDaemon sharedDaemon];
    [v4 holdWorkAssertion:a2];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100160AB0;
    v5[3] = &unk_100414A80;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

+ (void)reportBackgroundRestoreTimeoutWithPersona:(id)a3
{
  id v3 = a3;
  if (MBIsInternalInstall())
  {
    id v4 = [v3 copyPreferencesValueForKey:@"UserNotificationEvents" class:objc_opt_class()];
    v5 = [v4 objectForKeyedSubscript:@"BackgroundRestoreTimeoutTTR"];
    v6 = +[NSDate date];
    v7 = v6;
    if (!v5 || ([v6 timeIntervalSinceDate:v5], v8 >= 86400.0))
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=ttr= Background Restore is taking more than 48 hours", buf, 2u);
        _MBLog();
      }

      id v10 = [v4 mutableCopy];
      v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = (id)objc_opt_new();
      }
      v13 = v12;

      [v13 setObject:v7 forKeyedSubscript:@"BackgroundRestoreTimeoutTTR"];
      [v3 setPreferencesValue:v13 forKey:@"UserNotificationEvents"];
      CFOptionFlags v16 = 0;
      if (!CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, @"iCloud Restore is taking too long", @"iCloud Restore is taking more than 48h", @"Open with Tap-to-Radar", @"Ignore", 0, &v16)&& !v16)
      {
        v14 = +[NSURL URLWithString:@"tap-to-radar://new?Title=iCloud%20Restore%20took%20more%20than%2048h&Classification=Serious%20Bug&ComponentID=436863&ComponentName=Purple%20Backup%20-%20iCloud&ComponentVersion=1.0"];
        id v15 = +[LSApplicationWorkspace defaultWorkspace];
        [v15 openURL:v14 withOptions:0];
      }
    }
  }
}

+ (BOOL)reportDryRestoreError:(id)a3
{
  id v5 = a3;
  if (MBIsInternalInstall())
  {
    id v33 = 0;
    v6 = MBSerializeErrors(v5, &v33);
    id v7 = v33;
    double v8 = +[NSMutableString string];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 appendFormat:@"%@\n", *(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    id v14 = [v8 length];
    if ((unint64_t)v14 >= 0xC9)
    {
      objc_msgSend(v8, "deleteCharactersInRange:", 200, v14);
      [v8 appendString:@"…"];
    }
    id v15 = +[NSString stringWithFormat:@"Background dry restore failed with error:\n\n%@", v8];
    CFOptionFlags v16 = +[MBDaemon sharedDaemon];
    [v16 holdWorkAssertion:a2];

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100160FE0;
    block[3] = &unk_100414AA8;
    id v21 = v15;
    id v22 = &v25;
    id v23 = a1;
    SEL v24 = a2;
    id v17 = v15;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    BOOL v18 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (void)reportRestoreErrorsIn:(id)a3 persona:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MBIsInternalInstall())
  {
    if (!v6) {
      __assert_rtn("+[MBTapToRadar reportRestoreErrorsIn:persona:]", "MBTapToRadar.m", 206, "restorePlan");
    }
    if (!v7) {
      __assert_rtn("+[MBTapToRadar reportRestoreErrorsIn:persona:]", "MBTapToRadar.m", 207, "persona");
    }
    id v16 = 0;
    id v8 = [v6 fatalErrorCount:&v16];
    id v9 = v16;
    if (v8)
    {
      if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=ttr= Failed to get fatal error count: %@", buf, 0xCu);
LABEL_10:
          _MBLog();
        }
      }
      else
      {
        id v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          id v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "=ttr= Found %lu fatal errors", buf, 0xCu);
          _MBLog();
        }

        uint64_t v12 = [v7 restoreFailuresPlistPath];
        id v15 = v9;
        unsigned __int8 v13 = [a1 _collectRestoreErrorsAndFileTTR:v6 restoreFailuresPlistPath:v12 error:&v15];
        id v14 = v15;

        if (v13) {
          goto LABEL_18;
        }
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=ttr= Failed to collect restore errors and file TTR: %@", buf, 0xCu);
          _MBLog();
        }
        id v9 = v14;
      }
    }
    else
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=ttr= No fatal errors found", buf, 2u);
        goto LABEL_10;
      }
    }

    id v14 = v9;
LABEL_18:
  }
}

+ (BOOL)_collectRestoreErrorsAndFileTTR:(id)a3 restoreFailuresPlistPath:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9) {
    __assert_rtn("+[MBTapToRadar _collectRestoreErrorsAndFileTTR:restoreFailuresPlistPath:error:]", "MBTapToRadar.m", 229, "restorePlan");
  }
  id v11 = v10;
  if (!v10) {
    __assert_rtn("+[MBTapToRadar _collectRestoreErrorsAndFileTTR:restoreFailuresPlistPath:error:]", "MBTapToRadar.m", 230, "restoreFailuresPlistPath");
  }
  if (!a5) {
    __assert_rtn("+[MBTapToRadar _collectRestoreErrorsAndFileTTR:restoreFailuresPlistPath:error:]", "MBTapToRadar.m", 231, "error");
  }
  uint64_t v12 = +[NSMutableSet set];
  unsigned __int8 v13 = [v9 _failuresFor:2 isFatal:1 domainsNamesOut:v12 error:a5];
  if (v13)
  {
    uint64_t v14 = [v9 _failuresFor:2 isFatal:0 domainsNamesOut:v12 error:a5];
    id v15 = (void *)v14;
    if (v14)
    {
      v32[0] = @"Fatal Errors";
      v32[1] = @"Retryable Errors";
      v33[0] = v13;
      v33[1] = v14;
      id v16 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      unsigned __int8 v17 = [v16 writeToFile:v11 atomically:1];
      if (v17)
      {
        id v18 = [v12 allObjects];
        [v18 sortedArrayUsingSelector:"compare:"];
        v19 = v26 = v16;

        [v19 componentsJoinedByString:@"\n"];
        v20 = id v25 = a1;
        id v21 = +[NSString stringWithFormat:@"Failed to restore domain(s):\n%@", v20];

        id v22 = +[MBDaemon sharedDaemon];
        [v22 holdWorkAssertion:a2];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001616A0;
        block[3] = &unk_100414AD0;
        id v30 = v25;
        id v28 = v21;
        id v29 = v11;
        SEL v31 = a2;
        id v23 = v21;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        id v16 = v26;
      }
      else
      {
        *a5 = +[MBError errorWithCode:1 path:v11 description:@"Failed to write error(s) into plist"];
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

@end