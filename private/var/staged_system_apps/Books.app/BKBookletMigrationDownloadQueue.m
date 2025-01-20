@interface BKBookletMigrationDownloadQueue
- (BKBookletMigrationDownloadQueue)initWithStore:(id)a3;
- (BKBookletMigrationDownloadQueueObserver)observer;
- (BKBookletMigrationStore)store;
- (BOOL)_hasPendingItems;
- (BUCoalescingCallBlock)coalescingProcessNextBatch;
- (NSMutableArray)pendingItems;
- (unint64_t)_batchSize;
- (void)_notifyDidBecomeEmpty;
- (void)_processNextBatchWithCompletion:(id)a3;
- (void)_setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 logPrefix:(id)a5;
- (void)_triggerDownloads:(id)a3;
- (void)enqueueDownloads:(id)a3;
- (void)reloadFromStore;
- (void)setCoalescingProcessNextBatch:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPendingItems:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation BKBookletMigrationDownloadQueue

- (void)setObserver:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100078AA8;
  v5[3] = &unk_100A43DD8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_100078AA8((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (BKBookletMigrationDownloadQueue)initWithStore:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKBookletMigrationDownloadQueue;
  id v6 = [(BKBookletMigrationDownloadQueue *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingItems = v7->_pendingItems;
    v7->_pendingItems = v8;

    v7->_accessLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v12 = dispatch_queue_create("BKBookletMigrationDownloadQueue.workQueue", v11);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v12;

    observer = v7->_observer;
    v7->_observer = 0;

    objc_initWeak(&location, v7);
    id v15 = objc_alloc((Class)BUCoalescingCallBlock);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1001456F4;
    v22 = &unk_100A451B8;
    objc_copyWeak(&v23, &location);
    v16 = (BUCoalescingCallBlock *)[v15 initWithNotifyBlock:&v19 blockDescription:@"BKBookletMigrationDownloadQueue.processNextBatch"];
    coalescingProcessNextBatch = v7->_coalescingProcessNextBatch;
    v7->_coalescingProcessNextBatch = v16;

    -[BUCoalescingCallBlock setCoalescingDelay:](v7->_coalescingProcessNextBatch, "setCoalescingDelay:", 60.0, v19, v20, v21, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (unint64_t)_batchSize
{
  return 5;
}

- (BKBookletMigrationDownloadQueueObserver)observer
{
  uint64_t v11 = 0;
  dispatch_queue_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100007060;
  id v15 = sub_10000720C;
  id v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_100145884;
  v8 = &unk_100A44058;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_accessLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (BKBookletMigrationDownloadQueueObserver *)v4;
}

- (void)enqueueDownloads:(id)a3
{
  v19 = self;
  id v3 = a3;
  id v4 = BKBookletMigrationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: storeIDs: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  id v20 = v5;

  id v6 = +[NSSet setWithArray:v20];
  id v7 = [v6 mutableCopy];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100007060;
  v38 = sub_10000720C;
  id v39 = &__NSArray0__struct;
  v8 = [(BKBookletMigrationDownloadQueue *)v19 store];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100145C74;
  v25[3] = &unk_100A48310;
  id v9 = v7;
  id v26 = v9;
  p_long long buf = &buf;
  [v8 migrationItemsWithStoreIDStrings:v9 completion:v25];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v14 storeIDString:v19];
        id v16 = BKBookletMigrationLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 migrationState]);
          *(_DWORD *)v28 = 141558530;
          uint64_t v29 = 1752392040;
          __int16 v30 = 2112;
          v31 = v15;
          __int16 v32 = 2114;
          v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: Skipping existing item - storeID: %{mask.hash}@, state: %{public}@", v28, 0x20u);
        }
        [v9 removeObject:v15];
      }
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    [(BKBookletMigrationDownloadQueue *)v19 _setMigrationState:100 forStoreIDStrings:v9 logPrefix:@"enqueueDownloads"];
  }
  else
  {
    v18 = BKBookletMigrationLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: Nothing to enqueue", v28, 2u);
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)reloadFromStore
{
  id v3 = BKBookletMigrationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reloadFromStore", buf, 2u);
  }

  *(void *)long long buf = 0;
  long long v21 = buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_100007060;
  long long v24 = sub_10000720C;
  id v25 = &__NSArray0__struct;
  id v4 = [(BKBookletMigrationDownloadQueue *)self store];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100145F98;
  v19[3] = &unk_100A48338;
  v19[4] = buf;
  v19[5] = 100;
  [v4 migrationItemsWithState:100 completion:v19];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v10 = sub_100146058;
  id v11 = &unk_100A45520;
  uint64_t v12 = self;
  uint64_t v13 = buf;
  v14 = &v15;
  id v5 = v9;
  os_unfair_lock_lock(&self->_accessLock);
  v10((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((unsigned char *)v16 + 24))
  {
    id v6 = [(BKBookletMigrationDownloadQueue *)self coalescingProcessNextBatch];
    [v6 signalWithCompletion:&stru_100A48358];
  }
  else
  {
    id v7 = BKBookletMigrationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "reloadFromStore: Pending queue is empty", v8, 2u);
    }

    [(BKBookletMigrationDownloadQueue *)self _notifyDidBecomeEmpty];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);
}

- (BOOL)_hasPendingItems
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_1001461D8;
  id v7 = &unk_100A44058;
  v8 = self;
  id v9 = &v10;
  id v3 = v5;
  os_unfair_lock_lock(p_accessLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  LOBYTE(p_accessLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_accessLock;
}

- (void)_processNextBatchWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = sub_100007060;
  v19 = sub_10000720C;
  id v20 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v11 = sub_1001463F8;
  uint64_t v12 = &unk_100A44170;
  char v13 = self;
  v14 = &v15;
  id v5 = v10;
  os_unfair_lock_lock(&self->_accessLock);
  v11((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  if ([(id)v16[5] count])
  {
    [(BKBookletMigrationDownloadQueue *)self _triggerDownloads:v16[5]];
  }
  else
  {
    id v6 = BKBookletMigrationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_processNextBatchWithCompletion: Pending queue is empty", v9, 2u);
    }

    [(BKBookletMigrationDownloadQueue *)self _notifyDidBecomeEmpty];
  }
  id v7 = objc_retainBlock(v4);
  v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)_triggerDownloads:(id)a3
{
  id v4 = a3;
  id v5 = BKBookletMigrationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_triggerDownloads: %@", buf, 0xCu);
  }

  id v6 = dispatch_group_create();
  id v7 = +[NSSet setWithArray:v4];
  id v8 = [v7 mutableCopy];

  if ([v4 count])
  {
    dispatch_group_enter(v6);
    id v9 = +[BKLibraryManager defaultManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001466F8;
    v17[3] = &unk_100A45638;
    char v18 = v6;
    id v19 = v8;
    id v20 = v9;
    id v10 = v9;
    [v10 fetchLibraryAssetsFromStoreIDs:v4 handler:v17];
  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100146D24;
  v13[3] = &unk_100A471F0;
  id v14 = v8;
  uint64_t v15 = self;
  id v12 = v8;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_group_notify(v6, workQueue, v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak((id *)buf);
}

- (void)_notifyDidBecomeEmpty
{
  id v2 = [(BKBookletMigrationDownloadQueue *)self observer];
  [v2 bookletMigrationDownloadQueueDidBecomeEmpty];
}

- (void)_setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 logPrefix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BKBookletMigrationDownloadQueue *)self store];
  id v17 = 0;
  unsigned int v11 = [v10 setMigrationState:a3 forStoreIDStrings:v8 error:&v17];
  id v12 = v17;

  char v13 = BKBookletMigrationLog();
  id v14 = v13;
  if (!v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v16 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)long long buf = 138544130;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v16;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error setting migrationState to %{public}@, storeIDs: %@, error: %@", buf, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v8 count];
    id v16 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)long long buf = 138544130;
    id v19 = v9;
    __int16 v20 = 2048;
    id v21 = v15;
    __int16 v22 = 2114;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated migrationState of %lu items to %{public}@, storeIDs: %@", buf, 0x2Au);
LABEL_4:
  }
LABEL_6:
}

- (BKBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSMutableArray)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
}

- (BUCoalescingCallBlock)coalescingProcessNextBatch
{
  return self->_coalescingProcessNextBatch;
}

- (void)setCoalescingProcessNextBatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingProcessNextBatch, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end