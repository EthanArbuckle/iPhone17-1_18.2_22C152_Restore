@interface MBBackupCloudFormatPolicy
+ (int64_t)snapshotFormatForAccount:(id)a3 error:(id *)a4;
@end

@implementation MBBackupCloudFormatPolicy

+ (int64_t)snapshotFormatForAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[MBBehaviorOptions sharedOptions];
  v7 = [v6 dryRestoreInterval];
  [v7 doubleValue];
  if (v8 == 0.0)
  {
    uint64_t v12 = [v6 snapshotFormatString];
    if (v12)
    {
      v9 = v12;
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=cloud-backup-policy= Fetched snapshot format from behavior options: %@", buf, 0xCu);
        _MBLog();
      }

      unint64_t v14 = MBSnapshotFormatForString();
      int64_t v10 = v14;
      if (v14 > 3 || v14 == 1)
      {
        if (a4)
        {
          *a4 = +[MBError errorWithCode:205, @"Invalid snapshot format (%lld) %@", v14, v9 format];
        }
        int64_t v10 = -1;
      }
    }
    else
    {
      v16 = +[MBCKRemoteConfiguration sharedInstance];
      unsigned int v17 = [v16 allowSnapshotFormatSelectionOnGMForAccount:v5];

      if ((MBIsInternalInstall() & 1) != 0 || (MBBuildIsSeed() | v17) == 1)
      {
        v18 = +[MBCKRemoteConfiguration sharedInstance];
        int64_t v10 = (int64_t)[v18 snapshotFormatForBackupWithAccount:v5];

        v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = MBStringForSnapshotFormat();
          *(_DWORD *)buf = 138412290;
          v25 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=cloud-backup-policy= Using server-specified snapshot format: %@", buf, 0xCu);

          v23 = MBStringForSnapshotFormat();
          _MBLog();
        }
        v9 = 0;
      }
      else
      {
        v9 = 0;
        int64_t v10 = 0;
      }
    }
  }
  else
  {
    v9 = MBGetDefaultLog();
    int64_t v10 = 2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = MBStringForSnapshotFormat();
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=cloud-backup-policy= Force opt-in to %@ format from dry restore options", buf, 0xCu);

      v22 = MBStringForSnapshotFormat();
      _MBLog();
    }
  }

  return v10;
}

@end