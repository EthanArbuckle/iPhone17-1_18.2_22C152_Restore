@interface CSCoreDeviceProxy
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (void)initRemoteServers;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3;
- (unint64_t)getTimeoutSec;
@end

@implementation CSCoreDeviceProxy

+ (BOOL)isHost
{
  return 0;
}

+ (id)description
{
  if (+[CSCoreDeviceProxy isHost]) {
    v2 = @"CoreDeviceProxyRemote";
  }
  else {
    v2 = @"CoreDeviceProxyHost";
  }

  return v2;
}

+ (void)initRemoteServers
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSCoreDeviceProxy", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener();
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
  v4 = +[CSCoordinator sharedInstance];
  v5 = [v4 logSubsystem];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Remote server initialized.", v6, 2u);
  }
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = +[CSCoordinator sharedInstance];
  unsigned __int8 v7 = [v6 getCollectAllTrustedForDiagnosticID:v4];

  v8 = +[CSCoordinator sharedInstance];
  v9 = [v8 logSubsystem];

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) == 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Did not detect the --collectAllTrusted flag, skipping proxies", buf, 2u);
    }

    id v24 = [v5 copy];
    goto LABEL_18;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Detected --collectAllTrusted flag, beginning to find all proxies of connected devices", buf, 2u);
  }

  if (([a1 isHost] & 1) == 0)
  {
    v25 = +[CSCoordinator sharedInstance];
    v26 = [v25 logSubsystem];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Proxy is not host, skipping browseDevices", buf, 2u);
    }

    id v24 = [v5 copy];
LABEL_18:
    id v23 = v24;
    goto LABEL_19;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v35 = buf;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v12 = dispatch_get_global_queue(0, 0);
  v13 = v11;
  id v28 = v4;
  id v14 = v5;
  v29 = v14;
  remote_device_browse_present();

  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    v16 = +[CSCoordinator sharedInstance];
    v17 = [v16 logSubsystem];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100065DC8(v17);
    }
  }
  v18 = +[CSCoordinator sharedInstance];
  v19 = [v18 logSubsystem];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *((void *)v35 + 3);
    uint64_t v21 = v31[3];
    uint64_t description = remote_device_type_get_description();
    *(_DWORD *)v38 = 134218498;
    uint64_t v39 = v20;
    __int16 v40 = 2048;
    uint64_t v41 = v21;
    __int16 v42 = 2080;
    uint64_t v43 = description;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Finished browsing. Found %lu devices (%lu usable) of type %s", v38, 0x20u);
  }

  id v23 = [v14 copy];
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:

  return v23;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return [(CSRemoteXPCProxy *)self triggerCoSysdiagnoseWithParams:a3 forServiceName:"com.apple.sysdiagnose.remote.trusted"];
}

- (unint64_t)getTimeoutSec
{
  dispatch_queue_t v2 = +[CSCoordinator sharedInstance];
  v3 = [v2 logSubsystem];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 60;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 60;
}

@end