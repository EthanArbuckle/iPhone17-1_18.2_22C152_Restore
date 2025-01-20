@interface NTKDDaemon
+ (void)killDaemon;
+ (void)run;
+ (void)runDaemon;
+ (void)runSnapshotTool;
@end

@implementation NTKDDaemon

+ (void)run
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v4 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100044ABC(v4);
    }
  }
  v5 = NSTemporaryDirectory();
  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "daemon is running with temporary directory %@", buf, 0xCu);
  }

  objc_opt_class();
  v7 = dispatch_queue_create("com.apple.nanotimekitd.daemon-queue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034CD0;
  block[3] = &unk_100060B50;
  block[4] = a1;
  dispatch_async(v7, block);

  v8 = +[NSRunLoop mainRunLoop];
  [v8 run];
}

+ (void)runDaemon
{
  v2 = +[NTKDActivityTracker sharedInstance];
  [v2 checkin];

  nw_parameters_t v3 = nw_parameters_create();
  nw_parameters_set_source_application_by_bundle_id();
  v4 = +[NTKDArgonService sharedService];
  [v4 start];

  sub_10000A8A4(@"CleanupUnpairedDevices", &stru_100062170, 432000.0);
  +[NTKDMigrator runPreMigrator];
  v5 = +[NTKDCompanionTrackedPhotosService sharedService];
  [v5 start];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v7 = +[NTKCompanionAppLibrary sharedAppLibrary];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100035164;
  v14[3] = &unk_100060A90;
  dispatch_semaphore_t v15 = v6;
  v8 = v6;
  [v7 prewarmCompanionDaemonWithCompletion:v14];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  +[NTKBundleComplicationMigrationCompanionDevicePrewarmer run];
  id v9 = +[NTKDCompanionGalleryPhotosFacesCurator sharedInstance];
  +[NTKDCollectionCoordinator runCollectionServer];
  sub_10000A8A4(@"CleanupResources", &stru_100062190, 2592000.0);
  +[NTKDComplicationStoreCoordinator runComplicationStoreServer];
  id v10 = +[NTKDSyncController sharedInstance];
  +[NTKDMigrator runPostMigrator];
  +[NTKDFaceSnapshotCoordinator runSnapshotServer];
  v11 = dispatch_get_global_queue(17, 0);
  dispatch_async(v11, &stru_1000621B0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, NTKDaemonDidLaunchDarwinNotification, 0, 0, 1u);
  v13 = +[NTKDCompanionDeviceLibraryService sharedService];
  [v13 start];
}

+ (void)killDaemon
{
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "nanotimekitcompaniond should not be running because bridge is not installed--killing process!", v9, 2u);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000621D0);
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = [v3 initWithMachServiceName:NTKCollectionMachService];
  [v4 resume];
  id v5 = objc_alloc((Class)NSXPCListener);
  id v6 = [v5 initWithMachServiceName:NTKComplicationStoreMachService];
  [v6 resume];
  id v7 = objc_alloc((Class)NSXPCListener);
  id v8 = [v7 initWithMachServiceName:NTKFaceSnapshotMachService];
  [v8 resume];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, &stru_100062230);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &stru_100062250);
  xpc_set_event_stream_handler("com.apple.xpc.activity", 0, &stru_100062270);
}

+ (void)runSnapshotTool
{
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SNAPSHOT TEST MODE: all nonessential features are disabled", v4, 2u);
  }

  NTKDebugLoadLocaleOverride();
  +[NTKDFaceSnapshotCoordinator runSnapshotServer];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, NTKDaemonDidLaunchDarwinNotification, 0, 0, 1u);
}

@end