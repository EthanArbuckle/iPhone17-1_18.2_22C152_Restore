@interface NTKDFaceSnapshotCoordinator
+ (id)sharedInstance;
+ (void)runSnapshotServer;
+ (void)updateAllSnapshots;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NTKDFaceSnapshotCoordinator)init;
- (void)_handleCalendarDayChangedNotification;
- (void)_handleCurrentLocaleDidChangeNotification;
- (void)_prewarmForActivity:(id)a3;
- (void)_setupXPCEventListner;
- (void)_updateAllSnapshots;
@end

@implementation NTKDFaceSnapshotCoordinator

+ (void)runSnapshotServer
{
  if (qword_100072380 != -1) {
    dispatch_once(&qword_100072380, &stru_100061228);
  }
}

+ (id)sharedInstance
{
  if (qword_100072390 != -1) {
    dispatch_once(&qword_100072390, &stru_100061248);
  }
  v2 = (void *)qword_100072388;
  return v2;
}

+ (void)updateAllSnapshots
{
  id v2 = +[NTKDFaceSnapshotCoordinator sharedInstance];
  [v2 _updateAllSnapshots];
}

- (NTKDFaceSnapshotCoordinator)init
{
  v18.receiver = self;
  v18.super_class = (Class)NTKDFaceSnapshotCoordinator;
  id v2 = [(NTKDFaceSnapshotCoordinator *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntkd.snapshotcoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ntkd.snapshotcoordinator.callouts", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ntkd.snapshotcoordinator.xpcIncomingMessageQueue", v7);
    xpcIncomingMessageQueue = v2->_xpcIncomingMessageQueue;
    v2->_xpcIncomingMessageQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v10;

    uint64_t v12 = objc_opt_new();
    snapshotController = v2->_snapshotController;
    v2->_snapshotController = (NTKDFaceSnapshotController *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_handleCalendarDayChangedNotification" name:NSCalendarDayChangedNotification object:0];
    [v14 addObserver:v2 selector:"_handleCurrentLocaleDidChangeNotification" name:NSCurrentLocaleDidChangeNotification object:0];
    if (CFPreferencesGetAppBooleanValue(@"NTKFaceSnapshotsAreDirtyKey", NTKDaemonPreferencesDomain, 0))
    {
      v15 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to daemon exiting while snapshotting", v17, 2u);
      }

      [(NTKDFaceSnapshotCoordinator *)v2 _updateAllSnapshots];
    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NTKDFaceSnapshotClientHandler %p accept from connection %@", buf, 0x16u);
  }

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011AA0;
  v10[3] = &unk_100060AB8;
  id v11 = v5;
  uint64_t v12 = self;
  id v8 = v5;
  dispatch_async(queue, v10);

  return 1;
}

- (void)_handleCalendarDayChangedNotification
{
  dispatch_queue_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to calendar day changed notification", v4, 2u);
  }

  [(NTKDFaceSnapshotCoordinator *)self _updateAllSnapshots];
}

- (void)_handleCurrentLocaleDidChangeNotification
{
  dispatch_queue_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to current localed changed notification", v4, 2u);
  }

  [(NTKDFaceSnapshotCoordinator *)self _updateAllSnapshots];
}

- (void)_updateAllSnapshots
{
  [(NTKDFaceSnapshotController *)self->_snapshotController updateAllSnapshots];
  snapshotController = self->_snapshotController;
  [(NTKDFaceSnapshotController *)snapshotController updateAddableAndGallerySnapshotsWithContinuationBlock:&stru_1000612B0 finishedBlock:&stru_1000612F0];
}

- (void)_setupXPCEventListner
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100011FE8;
  handler[3] = &unk_100060F90;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000120FC;
  v3[3] = &unk_100061318;
  objc_copyWeak(&v4, &location);
  xpc_activity_register("com.apple.nanotimekitcompanion.snapshots.prewarm", XPC_ACTIVITY_CHECK_IN, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_prewarmForActivity:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  id v5 = v4;
  if (v4)
  {
    if (xpc_activity_get_state(v4))
    {
      snapshotController = self->_snapshotController;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100012448;
      v10[3] = &unk_100061340;
      id v11 = v5;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000124D8;
      v8[3] = &unk_100061368;
      v9 = v11;
      [(NTKDFaceSnapshotController *)snapshotController updateAddableAndGallerySnapshotsWithContinuationBlock:v10 finishedBlock:v8];

      v7 = v11;
    }
    else
    {
      v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prewarm: XPC Activity was checked-in", buf, 2u);
      }
    }
  }
  else
  {
    v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004316C(v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_xpcIncomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end