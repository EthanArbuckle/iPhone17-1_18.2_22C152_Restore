@interface NTKDMigrator
+ (void)runPostMigrator;
+ (void)runPreMigrator;
@end

@implementation NTKDMigrator

+ (void)runPreMigrator
{
  if (qword_100072338 != -1) {
    dispatch_once(&qword_100072338, &stru_100061018);
  }
  if (byte_100072340)
  {
    v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "beginning pre migration", buf, 2u);
    }

    v3 = +[NTKDSiriDataSourcesObserver sharedInstance];
    [v3 updateDeviceDataSourcesInNanoPreferences];

    v4 = +[NTKSiriDefaults sharedInstance];
    [v4 migrateIfNecessary];

    v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pre migration complete", v6, 2u);
    }
  }
}

+ (void)runPostMigrator
{
  if (qword_100072338 != -1) {
    dispatch_once(&qword_100072338, &stru_100061018);
  }
  if (byte_100072340)
  {
    v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "beginning post migration", buf, 2u);
    }

    v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating all snapshots due to migration", v7, 2u);
    }

    +[NTKDFaceSnapshotCoordinator updateAllSnapshots];
    v4 = (const void *)NTKBuildVersion();
    CFPreferencesSetAppValue(@"LastSystemVersionMigrated", v4, NTKFacePreferencesDomain);
    v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "post migration complete", v6, 2u);
    }
  }
}

@end