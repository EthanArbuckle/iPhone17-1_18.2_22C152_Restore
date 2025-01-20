@interface ICDPlaybackPositionSyncCoordinator
- (ICDPlaybackPositionSyncCoordinator)initWithOperationQueue:(id)a3;
- (void)_onQueue_addSyncBlockWithIdentifier:(id)a3 block:(id)a4;
- (void)_onQueue_flushSyncBlocks;
- (void)_onQueue_scheduleBlockWithIdentifier:(id)a3 isCheckpoint:(BOOL)a4 block:(id)a5;
- (void)scheduleSyncForContext:(id)a3 isCheckpoint:(BOOL)a4;
@end

@implementation ICDPlaybackPositionSyncCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_inFlightSyncIDs, 0);
  objc_storeStrong((id *)&self->_pendingSyncBlocks, 0);
  objc_storeStrong((id *)&self->_syncTimerSource, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_onQueue_scheduleBlockWithIdentifier:(id)a3 isCheckpoint:(BOOL)a4 block:(id)a5
{
  serialQueue = self->_serialQueue;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ICDPlaybackPositionSyncCoordinator *)self _onQueue_addSyncBlockWithIdentifier:v10 block:v9];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000120F8;
  v20[3] = &unk_1001BEC20;
  v20[4] = self;
  v11 = objc_retainBlock(v20);
  if (a4)
  {
    syncTimerSource = self->_syncTimerSource;
    v13 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (syncTimerSource)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = 0x4024000000000000;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ New checkpoint sync request. Delaying sync by %f seconds", buf, 0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)self->_syncTimerSource);
      v13 = self->_syncTimerSource;
      self->_syncTimerSource = 0;
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling sync %f seconds from now...", buf, 0x16u);
    }

    v16 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_serialQueue);
    v17 = self->_syncTimerSource;
    self->_syncTimerSource = v16;

    v18 = self->_syncTimerSource;
    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_syncTimerSource, v11);
    dispatch_resume((dispatch_object_t)self->_syncTimerSource);
  }
  else
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing sync NOW.", buf, 0xCu);
    }

    ((void (*)(void *))v11[2])(v11);
  }
}

- (void)_onQueue_flushSyncBlocks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = [(NSMutableDictionary *)self->_pendingSyncBlocks allValues];
  [(NSMutableDictionary *)self->_pendingSyncBlocks removeAllObjects];
  v4 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing sync blocks", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_onQueue_addSyncBlockWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v8 = [(NSMutableDictionary *)self->_pendingSyncBlocks objectForKeyedSubscript:v6];

  id v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v11 = 138543618;
      long long v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync already pending with identifier %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 138543618;
      long long v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding pending sync block for identifier %{public}@.", (uint8_t *)&v11, 0x16u);
    }

    id v9 = objc_retainBlock(v7);
    [(NSMutableDictionary *)self->_pendingSyncBlocks setObject:v9 forKeyedSubscript:v6];
  }
}

- (void)scheduleSyncForContext:(id)a3 isCheckpoint:(BOOL)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000124EC;
  block[3] = &unk_1001BB358;
  id v10 = v6;
  int v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

- (ICDPlaybackPositionSyncCoordinator)initWithOperationQueue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICDPlaybackPositionSyncCoordinator;
  id v6 = [(ICDPlaybackPositionSyncCoordinator *)&v16 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloudd.ICDPlaybackPositionSyncCoordinator.serialQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    pendingSyncBlocks = v6->_pendingSyncBlocks;
    v6->_pendingSyncBlocks = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableSet set];
    inFlightSyncIDs = v6->_inFlightSyncIDs;
    v6->_inFlightSyncIDs = (NSMutableSet *)v11;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_operationQueue, a3);
    }
    else
    {
      __int16 v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
      operationQueue = v6->_operationQueue;
      v6->_operationQueue = v13;

      [(NSOperationQueue *)v6->_operationQueue setName:@"com.apple.itunescloudd.ICDPlaybackPositionSyncCoordinator.operationQueue"];
      [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    }
  }

  return v6;
}

@end