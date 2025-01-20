@interface CSDisplayProxy
+ (BOOL)isAutomaticCoSysdiagnosePossible;
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (void)browseDevices:(id)a3;
- (unint64_t)getTimeoutSec;
@end

@implementation CSDisplayProxy

+ (BOOL)isHost
{
  if (qword_1000BD798 != -1) {
    dispatch_once(&qword_1000BD798, &stru_10009D3A0);
  }
  return byte_1000BD790;
}

+ (id)description
{
  if (+[CSDisplayProxy isHost]) {
    v2 = @"DisplayProxyRemote";
  }
  else {
    v2 = @"DisplayProxyHost";
  }

  return v2;
}

+ (void)browseDevices:(id)a3
{
  id v3 = a3;
  +[CSDisplayProxy isHost];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v5 = dispatch_get_global_queue(0, 0);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100023424;
  v19 = &unk_10009D3C8;
  v6 = v4;
  v20 = v6;
  id v7 = v3;
  v21 = v7;
  remote_device_browse_present();

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    v9 = +[CSCoordinator sharedInstance];
    v10 = [v9 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100062668(v10);
    }
  }
  v11 = +[CSCoordinator sharedInstance];
  v12 = [v11 logSubsystem];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v27[3];
    uint64_t v14 = v23[3];
    uint64_t description = remote_device_type_get_description();
    *(_DWORD *)buf = 134218498;
    uint64_t v31 = v13;
    __int16 v32 = 2048;
    uint64_t v33 = v14;
    __int16 v34 = 2080;
    uint64_t v35 = description;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Finished browsing. Found %lu devices (%lu usable) of type %s", buf, 0x20u);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

+ (BOOL)isAutomaticCoSysdiagnosePossible
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023748;
  v7[3] = &unk_10009D3F0;
  v7[4] = &v8;
  +[CSDisplayProxy browseDevices:v7];
  v2 = +[CSCoordinator sharedInstance];
  id v3 = [v2 logSubsystem];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v9 + 24)) {
      dispatch_semaphore_t v4 = "";
    }
    else {
      dispatch_semaphore_t v4 = " not";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Automatic co-sysdiagnose is%s possible", buf, 0xCu);
  }

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3 = a3;
  if (sub_100048C0C() & 1) != 0 || (sub_100048BA0() & 1) != 0 || (sub_100048C78())
  {
    *(void *)uint64_t v17 = 0;
    v18 = v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_1000239D4;
    v21 = sub_1000239E4;
    id v22 = objc_alloc_init((Class)NSMutableArray);
    char v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    uint64_t v13 = sub_1000239EC;
    uint64_t v14 = &unk_10009D418;
    id v15 = v3;
    v16 = v17;
    +[CSDisplayProxy browseDevices:&v11];
    dispatch_semaphore_t v4 = +[CSCoordinator sharedInstance];
    char v5 = [v4 logSubsystem];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*((id *)v18 + 5) count];
      *(_DWORD *)buf = 134217984;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: getProxies found total: %lu", buf, 0xCu);
    }

    id v7 = [*((id *)v18 + 5) copy];
    _Block_object_dispose(v17, 8);
  }
  else
  {
    v9 = +[CSCoordinator sharedInstance];
    uint64_t v10 = [v9 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: On iOS, but not iPhone, iPad, or darwinOS. Returning no proxies", v17, 2u);
    }

    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (unint64_t)getTimeoutSec
{
  v2 = +[CSCoordinator sharedInstance];
  id v3 = [v2 logSubsystem];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 60;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 60;
}

@end