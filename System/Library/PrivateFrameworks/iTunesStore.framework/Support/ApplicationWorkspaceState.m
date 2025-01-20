@interface ApplicationWorkspaceState
+ (BOOL)_completeNotification:(id)a3 bundleIdentifier:(id)a4;
+ (BOOL)_incompleteNotification:(id)a3 forDownload:(int64_t)a4 bundleIdentifier:(id)a5;
+ (BOOL)completeNotificationForCanceledBundleIdentifier:(id)a3;
+ (BOOL)completeNotificationForFailedBundleIdentifier:(id)a3;
+ (BOOL)completeNotificationForInstallingBundleIdentifier:(id)a3;
+ (BOOL)deleteIncompleteNotification:(id)a3 forBundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForCanceledDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForFailedDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForInstallingDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (id)databaseTable;
@end

@implementation ApplicationWorkspaceState

+ (id)databaseTable
{
  return @"application_workspace_state";
}

+ (BOOL)completeNotificationForCanceledBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseCanceled bundleIdentifier:a3];
}

+ (BOOL)completeNotificationForFailedBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseFailed bundleIdentifier:a3];
}

+ (BOOL)completeNotificationForInstallingBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseInstalling bundleIdentifier:a3];
}

+ (BOOL)deleteIncompleteNotification:(id)a3 forBundleIdentifier:(id)a4
{
  return [a1 _completeNotification:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForCanceledDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseCanceled forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForFailedDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseFailed forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForInstallingDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseInstalling forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)_completeNotification:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v12 = 138412546;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2112;
    id v15 = a4;
    LODWORD(v11) = 22;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v12, v11);
      free(v9);
      SSFileLog();
    }
  }
  return 0;
}

+ (BOOL)_incompleteNotification:(id)a3 forDownload:(int64_t)a4 bundleIdentifier:(id)a5
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (SSDebugShouldUseAppstored())
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    unsigned int v10 = [v8 shouldLogToDisk];
    uint64_t v11 = [v8 OSLogObject];
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v12 = objc_opt_class();
      id v13 = +[SSStackShot generateSymbolicatedStackShot];
      int v32 = 138412802;
      uint64_t v33 = v12;
      __int16 v34 = 2048;
      int64_t v35 = a4;
      __int16 v36 = 2112;
      id v37 = v13;
      LODWORD(v26) = 32;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        id v15 = (void *)v14;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v32, v26);
        free(v15);
        SSFileLog();
      }
    }
  }
  else
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    v19 = [v16 OSLogObject];
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v20 = objc_opt_class();
      int v32 = 138412802;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      int64_t v35 = (int64_t)a3;
      __int16 v36 = 2112;
      id v37 = a5;
      LODWORD(v26) = 32;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        v22 = (void *)v21;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v32, v26);
        free(v22);
        SSFileLog();
      }
    }
    if ([a5 length])
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10004B944;
      v27[3] = &unk_1003A4218;
      v27[4] = a5;
      v27[5] = a3;
      v27[6] = &v28;
      v27[7] = a4;
      objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v27);
    }
  }
  char v24 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);
  return v24;
}

@end