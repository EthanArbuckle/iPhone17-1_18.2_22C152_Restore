@interface FRAppCacheSnapshotter
- (BOOL)snapshotPreparedAndWaitingForRestoration;
- (NSDate)existingSnapshotCreationDate;
- (id)URLWithSuffix:(id)a3 baseURL:(id)a4;
- (id)creationDateOFURL:(id)a3;
- (id)snapshotURL;
- (id)snapshotURLForCachesURL:(id)a3;
- (id)tempRestoreURL;
- (void)copyURL:(id)a3 toURL:(id)a4 completionHandler:(id)a5;
- (void)finalizeRestoreOfCachesDirectory;
- (void)prepareToRestoreSnapshotAndKillApp;
- (void)removeExistingSnapshotWithCompletionHandler:(id)a3;
- (void)snapshotWithCompletionHandler:(id)a3;
@end

@implementation FRAppCacheSnapshotter

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = FRURLForNewsAppCachesDirectory();
  [(FRAppCacheSnapshotter *)self snapshotURLForCachesURL:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006A240;
  v8[3] = &unk_1000CA488;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v4;
  id v6 = v4;
  id v7 = v9;
  [(FRAppCacheSnapshotter *)self copyURL:v5 toURL:v7 completionHandler:v8];
}

- (void)removeExistingSnapshotWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, uint64_t, void))a3;
  +[NSThread isMainThread];
  id v4 = [(FRAppCacheSnapshotter *)self snapshotURL];
  v5 = +[NSFileManager defaultManager];
  [v5 fc_quicklyClearDirectory:v4 callbackQueue:&_dispatch_main_q completion:0];

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)prepareToRestoreSnapshotAndKillApp
{
  +[NSThread isMainThread];
  v3 = FRURLForNewsAppCachesDirectory();
  id v4 = [(FRAppCacheSnapshotter *)self snapshotURLForCachesURL:v3];
  v5 = [(FRAppCacheSnapshotter *)self tempRestoreURL];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  id v7 = +[NSFileManager defaultManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006A5C4;
  v12[3] = &unk_1000CA4B0;
  v8 = v6;
  v13 = v8;
  [v7 fc_quicklyClearDirectory:v5 callbackQueue:&_dispatch_main_q completion:v12];

  dispatch_group_enter(v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006A5CC;
  v10[3] = &unk_1000CA4B0;
  v11 = v8;
  id v9 = v8;
  [(FRAppCacheSnapshotter *)self copyURL:v4 toURL:v5 completionHandler:v10];
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, &stru_1000CA4D0);
}

- (void)finalizeRestoreOfCachesDirectory
{
  v3 = FRURLForNewsAppCachesDirectory();
  id v4 = [(FRAppCacheSnapshotter *)self tempRestoreURL];
  v5 = +[NSFileManager defaultManager];
  [v5 fc_quicklyClearDirectory:v3 callbackQueue:&_dispatch_main_q completion:0];

  id v6 = +[NSFileManager defaultManager];
  id v11 = 0;
  unsigned __int8 v7 = [v6 moveItemAtURL:v4 toURL:v3 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    id v9 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_10007C020((uint64_t)v8, v9);
    }
  }
  id v10 = +[NSUserDefaults standardUserDefaults];
  [v10 removeObjectForKey:@"FRAppCacheSnapshotterShouldRestoreOldCacheSnapshotDefaultsKey"];
  [v10 synchronize];
}

- (BOOL)snapshotPreparedAndWaitingForRestoration
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"FRAppCacheSnapshotterShouldRestoreOldCacheSnapshotDefaultsKey"];

  return v3;
}

- (NSDate)existingSnapshotCreationDate
{
  unsigned __int8 v3 = [(FRAppCacheSnapshotter *)self snapshotURL];
  id v4 = [(FRAppCacheSnapshotter *)self creationDateOFURL:v3];

  return (NSDate *)v4;
}

- (void)copyURL:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A908;
  block[3] = &unk_1000C8598;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (id)snapshotURL
{
  unsigned __int8 v3 = FRURLForNewsAppCachesDirectory();
  id v4 = [(FRAppCacheSnapshotter *)self snapshotURLForCachesURL:v3];

  return v4;
}

- (id)tempRestoreURL
{
  unsigned __int8 v3 = FRURLForNewsAppCachesDirectory();
  id v4 = [(FRAppCacheSnapshotter *)self URLWithSuffix:@"TempRestore" baseURL:v3];

  return v4;
}

- (id)URLWithSuffix:(id)a3 baseURL:(id)a4
{
  id v5 = a3;
  id v6 = [a4 URLByDeletingLastPathComponent];
  id v7 = [v6 lastPathComponent];
  id v8 = +[NSString stringWithFormat:@"%@-%@", v7, v5];

  id v9 = [v6 URLByAppendingPathComponent:v8];

  return v9;
}

- (id)snapshotURLForCachesURL:(id)a3
{
  return [(FRAppCacheSnapshotter *)self URLWithSuffix:@"CacheSnapshot" baseURL:a3];
}

- (id)creationDateOFURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];

  uint64_t v9 = 0;
  id v6 = [v4 attributesOfItemAtPath:v5 error:&v9];

  id v7 = [v6 fileModificationDate];

  return v7;
}

- (void).cxx_destruct
{
}

@end