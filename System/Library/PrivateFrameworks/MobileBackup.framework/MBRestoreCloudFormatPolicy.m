@interface MBRestoreCloudFormatPolicy
+ (BOOL)isRestoringFromFileLists:(BOOL *)a3 persona:(id)a4 error:(id *)a5;
+ (BOOL)shouldRestoreSnapshot:(id)a3 account:(id)a4 persona:(id)a5 useFileLists:(BOOL *)a6 error:(id *)a7;
+ (id)_lastFailedLightrailRestoreAttemptDate:(id)a3;
+ (int64_t)snapshotFormatForCurrentRestore:(id)a3;
+ (void)promptTTRIfLightrailRestoreFailed:(id)a3;
+ (void)recordLightrailForegroundRestoreFailed:(id)a3;
@end

@implementation MBRestoreCloudFormatPolicy

+ (void)recordLightrailForegroundRestoreFailed:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];
  v5 = v4;
  if (!v4) {
    id v4 = &__NSDictionary0__struct;
  }
  id v6 = [v4 mutableCopy];

  v7 = +[NSDate now];
  [v6 setObject:v7 forKeyedSubscript:@"LastFailedLightrailRestoreAttemptDate"];

  [v3 setPreferencesValue:v6 forKey:@"RestoreCloudFormatInfo"];
  if (MBIsInternalInstall())
  {
    pid_t v15 = 0;
    __argv[0] = "backupctl";
    __argv[1] = "diagnose";
    __argv[2] = "--skipsample";
    __argv[3] = "--skipsysdiag";
    __argv[4] = "-f";
    __argv[5] = (char *)[@"/var/mobile/Library/Caches/Backup/lightrail_failure_diagnose/restore_failure" fileSystemRepresentation];
    __argv[6] = 0;
    int v8 = posix_spawn(&v15, "/usr/local/bin/backupctl", 0, 0, __argv, 0);
    if (v8)
    {
      int v9 = v8;
      v10 = MBGetDefaultLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v17 = @"Failed to run diagnose for Lightrail restore failure";
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=snapshot-policy= %@: unable to spawn the process backupctl diagnose, errno=%d", buf, 0x12u);
    }
    else
    {
      int v14 = 0;
      pid_t v11 = waitpid(v15, &v14, 0);
      if (v11)
      {
        if (v11 == -1)
        {
          v10 = MBGetDefaultLog();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v17 = @"Failed to run diagnose for Lightrail restore failure";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=snapshot-policy= %@: waitpid error", buf, 0xCu);
        }
        else
        {
          if ((v14 & 0x7F) == 0x7F) {
            goto LABEL_9;
          }
          if ((v14 & 0x7F) != 0)
          {
            v10 = MBGetDefaultLog();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_8;
            }
            *(_DWORD *)buf = 138412546;
            CFStringRef v17 = @"Failed to run diagnose for Lightrail restore failure";
            __int16 v18 = 1024;
            int v19 = v14 & 0x7F;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=snapshot-policy= %@: 'backupctl diagnose' was terminated by signal %d", buf, 0x12u);
          }
          else
          {
            int v12 = BYTE1(v14);
            v13 = MBGetDefaultLog();
            v10 = v13;
            if (v12)
            {
              if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                goto LABEL_8;
              }
              *(_DWORD *)buf = 138412546;
              CFStringRef v17 = @"Failed to run diagnose for Lightrail restore failure";
              __int16 v18 = 1024;
              int v19 = v12;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=snapshot-policy= %@: 'backupctl diagnose' exited with status %d", buf, 0x12u);
            }
            else
            {
              if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_8;
              }
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Successfully collected diagnose for Lightrail restore failure", buf, 2u);
            }
          }
        }
      }
      else
      {
        v10 = MBGetDefaultLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v17 = @"Failed to run diagnose for Lightrail restore failure";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=snapshot-policy= %@: no child processes to wait for", buf, 0xCu);
      }
    }
    _MBLog();
    goto LABEL_8;
  }
LABEL_9:
}

+ (void)promptTTRIfLightrailRestoreFailed:(id)a3
{
  id v10 = a3;
  id v3 = [v10 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];
  id v4 = v3;
  if (!v3) {
    id v3 = &__NSDictionary0__struct;
  }
  id v5 = [v3 mutableCopy];

  id v6 = [v5 objectForKeyedSubscript:@"LastFailedLightrailRestoreAttemptDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    int v9 = [v5 objectForKeyedSubscript:@"LastTTRPromptDateForFailedLightrailRestore"];

    if (!v9)
    {
      [v5 setObject:v8 forKeyedSubscript:@"LastTTRPromptDateForFailedLightrailRestore"];
      [v10 setPreferencesValue:v5 forKey:@"RestoreCloudFormatInfo"];
      +[MBTapToRadar reportLightrailRestoreFailed];
    }
  }
}

+ (int64_t)snapshotFormatForCurrentRestore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"SnapshotFormatEnum"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v6 = (int)[v5 intValue];
    }
    else
    {
      v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v10 = v5;
        __int16 v11 = 2112;
        CFStringRef v12 = @"SnapshotFormat";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=snapshot-policy= Failed to determine if restoring from file lists - invalid value %@ for key %@", buf, 0x16u);
        _MBLog();
      }

      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)isRestoringFromFileLists:(BOOL *)a3 persona:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (!a3) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy isRestoringFromFileLists:persona:error:]", "MBRestoreCloudFormatPolicy.m", 117, "outIsRestoringFromFileLists");
  }
  id v8 = v7;
  id v9 = [v7 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];
  id v10 = v9;
  if (v9)
  {
    __int16 v11 = [v9 objectForKeyedSubscript:@"RestoredFromFileList"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *a3 = [v11 BOOLValue];
      BOOL v12 = 1;
    }
    else
    {
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v17 = v11;
        __int16 v18 = 2112;
        CFStringRef v19 = @"RestoredFromFileList";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=snapshot-policy= Failed to determine if restoring from file lists - invalid value %@ for key %@", buf, 0x16u);
        _MBLog();
      }

      if (a5)
      {
        +[MBError errorWithCode:205, @"Failed to determine if restoring from file lists - invalid value %@", v11 format];
        BOOL v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else
  {
    int v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=snapshot-policy= Could not find cloudFormatInfo", buf, 2u);
      _MBLog();
    }

    if (a5)
    {
      +[MBError errorWithCode:4 format:@"Could not find cloudFormatInfo"];
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)shouldRestoreSnapshot:(id)a3 account:(id)a4 persona:(id)a5 useFileLists:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:account:persona:useFileLists:error:]", "MBRestoreCloudFormatPolicy.m", 144, "snapshot");
  }
  if (!v13) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:account:persona:useFileLists:error:]", "MBRestoreCloudFormatPolicy.m", 145, "account");
  }
  pid_t v15 = v14;
  if (!v14) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:account:persona:useFileLists:error:]", "MBRestoreCloudFormatPolicy.m", 146, "persona");
  }
  if (!a6) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:account:persona:useFileLists:error:]", "MBRestoreCloudFormatPolicy.m", 147, "useFileLists");
  }
  if (!a7) {
    __assert_rtn("+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:account:persona:useFileLists:error:]", "MBRestoreCloudFormatPolicy.m", 148, "error");
  }
  v50 = a7;
  id v53 = [v14 accountType];
  id v16 = [v12 snapshotFormat];
  id v17 = [v12 accountType];
  __int16 v18 = MBStringForSnapshotFormat();
  CFStringRef v19 = +[MBBehaviorOptions sharedOptions];
  v51 = [v19 shouldRestoreFromLegacySnapshotFormat];

  v20 = +[MBCKRemoteConfiguration sharedInstance];
  v55 = v13;
  v21 = [v20 shouldRestoreUsingFileListsForAccount:v13];

  v22 = +[MBBehaviorOptions sharedOptions];
  v23 = [v22 requiredRestoreSnapshotFormatString];

  uint64_t v24 = MBSnapshotFormatForString();
  v25 = [a1 _lastFailedLightrailRestoreAttemptDate:v15];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10024B2CC;
  v56[3] = &unk_100417190;
  v64 = a6;
  id v65 = v53;
  id v66 = v17;
  v26 = v18;
  v57 = v26;
  id v67 = v16;
  v27 = v12;
  v58 = v27;
  id v28 = v51;
  id v59 = v28;
  id v52 = v21;
  id v60 = v52;
  v29 = v23;
  v61 = v29;
  id v30 = v25;
  id v62 = v30;
  id v31 = v15;
  id v63 = v31;
  v32 = objc_retainBlock(v56);
  v33 = (void (**)(void, void))v32;
  BOOL v34 = v24 == -1 || v24 == (void)v16;
  char v35 = v34;
  BOOL v54 = v35;
  if (!v34)
  {
    id *v50 = +[MBError errorWithCode:1, @"Existing snapshot format: '%@' does not match the BehaviorOption RequiredRestoreSnapshotFormat: '%@'", v26, v29 format];
    v33[2](v33, 0);
    v38 = MBGetDefaultLog();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    v37 = v26;
    if (v39)
    {
      *(_DWORD *)buf = 138412546;
      v69 = v26;
      __int16 v70 = 2112;
      v71 = v29;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Existing snapshot format: '%@' does not match the BehaviorOption RequiredRestoreSnapshotFormat: '%@'", buf, 0x16u);
      _MBLog();
    }
    v36 = v27;
    goto LABEL_28;
  }
  if (v16 == (id)3)
  {
    ((void (*)(void *, uint64_t))v32[2])(v32, 1);
    v38 = MBGetDefaultLog();
    v36 = v27;
    v37 = v26;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Target snapshot format only contains file lists", buf, 2u);
LABEL_27:
      _MBLog();
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  v37 = v26;
  if ((MBSnapshotFormatContainsAssets() & 1) == 0)
  {
    v33[2](v33, 0);
    v38 = MBGetDefaultLog();
    v36 = v27;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v69 = v27;
      __int16 v70 = 2112;
      v71 = v26;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Target snapshot %@ format (%@) does not contain assets, falling back to Legacy", buf, 0x16u);
      goto LABEL_27;
    }
LABEL_28:
    v40 = v28;
LABEL_29:
    v43 = v52;
    goto LABEL_30;
  }
  v36 = v27;
  v40 = v28;
  if (!v28)
  {
    if (v30)
    {
      [v30 timeIntervalSinceNow];
      if (v45 > -1209600.0)
      {
        v33[2](v33, 0);
        v48 = MBGetLogDateFormatter();
        v38 = [v48 stringFromDate:v30];

        v49 = MBGetDefaultLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v38;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Falling back to legacy restore, since last failure (%@) was within two weeks", buf, 0xCu);
          _MBLog();
        }

        v37 = v26;
        goto LABEL_29;
      }
    }
    v43 = v52;
    if (v52)
    {
      unsigned int v46 = [v52 BOOLValue];
      v47 = v33[2];
      if (v46)
      {
        v47(v33, 1);
        v38 = MBGetDefaultLog();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Server enabled Lightrail restore", buf, 2u);
      }
      else
      {
        v47(v33, 0);
        v38 = MBGetDefaultLog();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Server disabled Lightrail restore", buf, 2u);
      }
    }
    else
    {
      v33[2](v33, 0);
      v38 = MBGetDefaultLog();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Default ignoring Lightrail data in snapshot", buf, 2u);
    }
LABEL_46:
    _MBLog();
    goto LABEL_30;
  }
  unsigned int v41 = [v28 BOOLValue];
  v42 = v33[2];
  if (!v41)
  {
    v42(v33, 1);
    v38 = MBGetDefaultLog();
    v43 = v52;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Local preference enabled Lightrail restore", buf, 2u);
    goto LABEL_46;
  }
  v42(v33, 0);
  v38 = MBGetDefaultLog();
  v43 = v52;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=snapshot-policy= Local preference disabled Lightrail restore", buf, 2u);
    goto LABEL_46;
  }
LABEL_30:

  return v54;
}

+ (id)_lastFailedLightrailRestoreAttemptDate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];

  id v5 = [v4 objectForKeyedSubscript:@"LastFailedLightrailRestoreAttemptDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end