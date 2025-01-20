@interface NPTOSyncDaemonController
- (BOOL)_wantsProxyServiceController;
- (BOOL)_wantsTinkerServiceController;
- (NPTOSyncDaemonController)initWithDeviceControllerClass:(Class)a3;
- (void)_registerNotifydServices;
- (void)run;
@end

@implementation NPTOSyncDaemonController

- (NPTOSyncDaemonController)initWithDeviceControllerClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NPTOSyncDaemonController;
  v4 = [(NPTOSyncDaemonController *)&v11 init];
  if (v4)
  {
    v5 = sub_10005CDAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[NPTOSyncDaemonController initWithDeviceControllerClass:]";
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Daemon Controllers/NPTOSyncDaemonController.m";
      __int16 v16 = 1024;
      int v17 = 29;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
    }

    [(NPTOSyncDaemonController *)v4 _registerNotifydServices];
    if ([(NPTOSyncDaemonController *)v4 _wantsProxyServiceController])
    {
      v6 = [[NPTOSyncServiceController alloc] initWithService:@"com.apple.private.alloy.photos.proxy" relationship:1 requiresConnectedDevice:1 deviceControllerClass:a3];
      proxyServiceController = v4->_proxyServiceController;
      v4->_proxyServiceController = v6;
    }
    if ([(NPTOSyncDaemonController *)v4 _wantsTinkerServiceController])
    {
      v8 = [[NPTOSyncServiceController alloc] initWithService:@"com.apple.private.alloy.tinker.photos" relationship:2 requiresConnectedDevice:0 deviceControllerClass:a3];
      tinkerServiceController = v4->_tinkerServiceController;
      v4->_tinkerServiceController = v8;
    }
  }
  return v4;
}

- (void)run
{
  id v2 = +[NSRunLoop mainRunLoop];
  [v2 run];
}

- (void)_registerNotifydServices
{
  xpc_activity_register("com.apple.notifyd.matching", XPC_ACTIVITY_CHECK_IN, &stru_100093970);

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100093990);
}

- (BOOL)_wantsProxyServiceController
{
  return 1;
}

- (BOOL)_wantsTinkerServiceController
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerServiceController, 0);

  objc_storeStrong((id *)&self->_proxyServiceController, 0);
}

@end