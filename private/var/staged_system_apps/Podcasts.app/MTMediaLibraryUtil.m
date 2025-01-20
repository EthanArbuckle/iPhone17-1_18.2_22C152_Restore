@interface MTMediaLibraryUtil
+ (BOOL)isDeletingPersistentId:(unint64_t)a3;
+ (id)pendingDeletionPersistentIds;
+ (void)deleteMediaItems:(id)a3 completion:(id)a4;
+ (void)didDeletePersistentId:(unint64_t)a3;
+ (void)updateMediaLibraryItem:(unint64_t)a3 playhead:(double)a4 playState:(int64_t)a5 playCount:(int64_t)a6;
+ (void)willDeletePersistentId:(unint64_t)a3;
@end

@implementation MTMediaLibraryUtil

+ (void)updateMediaLibraryItem:(unint64_t)a3 playhead:(double)a4 playState:(int64_t)a5 playCount:(int64_t)a6
{
  if (a3)
  {
    v10 = +[MTMediaLibraryTransactionManager sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000CFDE0;
    v11[3] = &unk_1005508C8;
    v11[4] = a3;
    *(double *)&v11[5] = a4;
    v11[6] = a5;
    v11[7] = a6;
    [v10 requestMediaLibraryReadTransaction:v11];
  }
}

+ (id)pendingDeletionPersistentIds
{
  if (qword_10060A7B0 != -1) {
    dispatch_once(&qword_10060A7B0, &stru_1005508E8);
  }
  v2 = (void *)qword_10060A7A8;

  return v2;
}

+ (BOOL)isDeletingPersistentId:(unint64_t)a3
{
  v5 = [a1 pendingDeletionPersistentIds];
  objc_sync_enter(v5);
  v6 = [a1 pendingDeletionPersistentIds];
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = _MTLogCategoryDownload();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "isDeletingPersistentId %llu", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_sync_exit(v5);

  return v8;
}

+ (void)willDeletePersistentId:(unint64_t)a3
{
  v5 = [a1 pendingDeletionPersistentIds];
  objc_sync_enter(v5);
  v6 = [a1 pendingDeletionPersistentIds];
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v6 addObject:v7];

  unsigned int v8 = _MTLogCategoryDownload();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "willDeletePersistentId %llu", (uint8_t *)&v9, 0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)didDeletePersistentId:(unint64_t)a3
{
  v5 = [a1 pendingDeletionPersistentIds];
  objc_sync_enter(v5);
  v6 = [a1 pendingDeletionPersistentIds];
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v6 removeObject:v7];

  unsigned int v8 = _MTLogCategoryDownload();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didDeletePersistentId %llu", (uint8_t *)&v9, 0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)deleteMediaItems:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v25 = [v5 count];
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting %lu pids %{public}@ from MediaLibrary", buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        +[MTMediaLibraryUtil willDeletePersistentId:](MTMediaLibraryUtil, "willDeletePersistentId:", [*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) unsignedLongLongValue]);
        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v13 = +[MTMediaLibraryTransactionManager sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D0778;
  v16[3] = &unk_100550938;
  id v17 = v8;
  id v18 = v6;
  id v14 = v6;
  id v15 = v8;
  [v13 requestMediaLibraryReadTransaction:v16];
}

@end