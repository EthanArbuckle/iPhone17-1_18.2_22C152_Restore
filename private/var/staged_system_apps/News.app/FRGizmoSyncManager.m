@interface FRGizmoSyncManager
- (BOOL)syncingWatchData;
- (FCNewsAppConfigurationManager)appConfigManager;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FRGizmoPreferencesNotifier)notifier;
- (FRGizmoSyncManager)init;
- (FRGizmoSyncManager)initWithAppConfigManager:(id)a3 readingList:(id)a4 readingHistory:(id)a5;
- (FRGizmoSyncManagerDelegate)delegate;
- (NSSet)articleIdentifiersOnGizmo;
- (id)_newCompanionConnection;
- (void)_fetchMetadataWithCompletion:(id)a3;
- (void)_syncPreferredRefreshDatesWithCompletion:(id)a3;
- (void)_syncSavedIdentifiersOnGizmo:(id)a3 articleIdentifiersOnGizmo:(id)a4 withCompletion:(id)a5;
- (void)_syncSeenIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)gizmoPreferencesNotifierDidNoticeUpdate:(id)a3;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
- (void)setArticleIdentifiersOnGizmo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSyncingWatchData:(BOOL)a3;
- (void)syncWithGizmo;
@end

@implementation FRGizmoSyncManager

- (id)_newCompanionConnection
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.nanonews.service.companion" options:0];
  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FRWatchConsuming];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

- (void)_syncPreferredRefreshDatesWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Syncing refresh dates with gizmo…", buf, 2u);
  }
  v5 = [(FRGizmoSyncManager *)self appConfigManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007DE4;
  v7[3] = &unk_1000C6EA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAppConfigurationIfNeededWithCompletion:v7];
}

- (FRGizmoSyncManager)initWithAppConfigManager:(id)a3 readingList:(id)a4 readingHistory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  +[NSThread isMainThread];
  v17.receiver = self;
  v17.super_class = (Class)FRGizmoSyncManager;
  v12 = [(FRGizmoSyncManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appConfigManager, a3);
    objc_storeStrong((id *)&v13->_readingList, a4);
    objc_storeStrong((id *)&v13->_readingHistory, a5);
    v14 = objc_alloc_init(FRGizmoPreferencesNotifier);
    [(FRGizmoPreferencesNotifier *)v14 setDelegate:v13];
    notifier = v13->_notifier;
    v13->_notifier = v14;

    [v10 addObserver:v13];
    [v11 addObserver:v13];
  }

  return v13;
}

- (void)_fetchMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Syncing metadata with gizmo…", buf, 2u);
  }
  *(void *)buf = 0;
  v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100018AF0;
  v19 = sub_100018A00;
  id v20 = [(FRGizmoSyncManager *)self _newCompanionConnection];
  [*((id *)v16 + 5) resume];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006D30;
  v12[3] = &unk_1000C84A8;
  id v5 = v4;
  id v13 = v5;
  v14 = buf;
  id v6 = objc_retainBlock(v12);
  v7 = [*((id *)v16 + 5) remoteObjectProxyWithErrorHandler:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100046D00;
  v9[3] = &unk_1000C84F8;
  id v8 = v5;
  id v10 = v8;
  id v11 = buf;
  [v7 fetchHeadlineMetadataWithReply:v9];

  _Block_object_dispose(buf, 8);
}

- (void)syncWithGizmo
{
  +[NSThread isMainThread];
  if (![(FRGizmoSyncManager *)self syncingWatchData])
  {
    [(FRGizmoSyncManager *)self setSyncingWatchData:1];
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100018E8C;
    v12[3] = &unk_1000C83E0;
    objc_copyWeak(&v13, &location);
    v3 = objc_retainBlock(v12);
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000AFD4;
    v9[3] = &unk_1000C8408;
    objc_copyWeak(&v11, &location);
    id v5 = v4;
    id v10 = v5;
    [(FRGizmoSyncManager *)self _fetchMetadataWithCompletion:v9];
    dispatch_group_enter(v5);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100018E84;
    v7[3] = &unk_1000C5680;
    id v6 = v5;
    id v8 = v6;
    [(FRGizmoSyncManager *)self _syncPreferredRefreshDatesWithCompletion:v7];
    dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, v3);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (BOOL)syncingWatchData
{
  return self->_syncingWatchData;
}

- (void)setSyncingWatchData:(BOOL)a3
{
  self->_syncingWatchData = a3;
}

- (void)setDelegate:(id)a3
{
}

- (FCNewsAppConfigurationManager)appConfigManager
{
  return self->_appConfigManager;
}

- (FRGizmoSyncManager)init
{
  return [(FRGizmoSyncManager *)self initWithAppConfigManager:0 readingList:0 readingHistory:0];
}

- (void)gizmoPreferencesNotifierDidNoticeUpdate:(id)a3
{
  +[NSThread isMainThread];

  [(FRGizmoSyncManager *)self syncWithGizmo];
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  +[NSThread isMainThread];
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = [v10 count];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v11 count];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Marking %lu IDs saved and %lu IDs unsaved…", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v31 = sub_100018AF0;
    v32 = sub_100018A00;
    id v33 = [(FRGizmoSyncManager *)self _newCompanionConnection];
    [*(id *)(*(void *)&buf[8] + 40) resume];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000468E8;
    v26[3] = &unk_1000C8430;
    id v12 = v10;
    id v27 = v12;
    id v13 = v11;
    id v28 = v13;
    v29 = buf;
    v14 = objc_retainBlock(v26);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10004694C;
    v22 = &unk_1000C74D0;
    id v15 = v12;
    id v23 = v15;
    id v16 = v13;
    id v24 = v16;
    v25 = buf;
    uint64_t v17 = objc_retainBlock(&v19);
    v18 = [*(id *)(*(void *)&buf[8] + 40) remoteObjectProxyWithErrorHandler:v14, v19, v20, v21, v22];
    [v18 markArticleIdentifiersAsSaved:v15 articleIdentifiersAsNotSaved:v16 withReply:v17];

    _Block_object_dispose(buf, 8);
  }
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Clearing gizmo seen history…", buf, 2u);
  }
  *(void *)buf = 0;
  id v10 = buf;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100018AF0;
  id v13 = sub_100018A00;
  id v14 = [(FRGizmoSyncManager *)self _newCompanionConnection];
  [*((id *)v10 + 5) resume];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100046C04;
  v8[3] = &unk_1000C8458;
  v8[4] = buf;
  id v5 = objc_retainBlock(v8);
  id v6 = [*((id *)v10 + 5) remoteObjectProxyWithErrorHandler:v5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046C74;
  v7[3] = &unk_1000C8480;
  void v7[4] = buf;
  [v6 clearAllSeenArticleIdentifiersWithReply:v7];

  _Block_object_dispose(buf, 8);
}

- (void)_syncSeenIdentifiers:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046EF0;
  block[3] = &unk_1000C8598;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_syncSavedIdentifiersOnGizmo:(id)a3 articleIdentifiersOnGizmo:(id)a4 withCompletion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000475E0;
  v11[3] = &unk_1000C7AA8;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (FRGizmoSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FRGizmoSyncManagerDelegate *)WeakRetained;
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FRGizmoPreferencesNotifier)notifier
{
  return self->_notifier;
}

- (NSSet)articleIdentifiersOnGizmo
{
  return self->_articleIdentifiersOnGizmo;
}

- (void)setArticleIdentifiersOnGizmo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleIdentifiersOnGizmo, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_appConfigManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end