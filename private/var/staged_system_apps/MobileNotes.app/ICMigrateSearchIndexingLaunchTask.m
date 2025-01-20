@interface ICMigrateSearchIndexingLaunchTask
- (void)runLaunchTask;
@end

@implementation ICMigrateSearchIndexingLaunchTask

- (void)runLaunchTask
{
  uint64_t v3 = kICSearchIndexingVersionKey;
  v4 = +[ICSettingsUtilities objectForKey:kICSearchIndexingVersionKey];
  v5 = (ICMigrateSearchIndexingLaunchTask *)[v4 unsignedIntegerValue];

  if ((unint64_t)&v5[-1].super.isa + 6 < 9)
  {
    int v6 = 0;
LABEL_3:
    v7 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v18 = v5;
      __int16 v19 = 2048;
      uint64_t v20 = 11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "App needs to upgrade the search index because indexing version does not match. Current version = %lu, expected version = %lu", buf, 0x16u);
    }

    v8 = os_log_create("com.apple.notes", "LaunchTask");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ should delete search indexing before reindexing", buf, 0xCu);
      }

      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      v11 = +[ICReindexer reindexer];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100137E04;
      v15[3] = &unk_100627FC8;
      v15[4] = self;
      dispatch_semaphore_t v16 = v10;
      v12 = v10;
      [v11 deleteAllSearchableItemsWithCompletionHandler:v15];

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ no need to delete search indexing before reindexing. updating the indexing version to expected version", buf, 0xCu);
      }

      v12 = +[NSNumber numberWithInteger:11];
      +[ICSettingsUtilities setObject:v12 forKey:v3];
    }

    +[ICSettingsUtilities setObject:&__kCFBooleanTrue forKey:kICReindexOnLaunchKey];
    return;
  }
  if ((unint64_t)v5 < 2)
  {
    int v6 = 1;
    goto LABEL_3;
  }
  if (v5 != (ICMigrateSearchIndexingLaunchTask *)11)
  {
    v13 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v18 = v5;
      __int16 v19 = 2048;
      uint64_t v20 = 11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "App does not need to upgrade the search index although indexing version does not match. Current version = %lu, expected version = %lu. Directly updating the indexing version to expected version", buf, 0x16u);
    }

    v14 = +[NSNumber numberWithInteger:11];
    +[ICSettingsUtilities setObject:v14 forKey:v3];
  }
}

@end