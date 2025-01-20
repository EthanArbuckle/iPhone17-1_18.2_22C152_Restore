@interface BYDaemonExpressActivity
+ (id)sharedActivity;
- (BYDaemonExpressActivity)init;
- (OS_dispatch_queue)queue;
- (SASExpressCloudSettings)cloudSettings;
- (void)_updateSettingsForActivity:(id)a3;
- (void)registerActivity;
- (void)registerBackupActivity;
- (void)registerMaintenanceActivity;
- (void)setCloudSettings:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterActivity;
@end

@implementation BYDaemonExpressActivity

+ (id)sharedActivity
{
  if (qword_100024D10 != -1) {
    dispatch_once(&qword_100024D10, &stru_10001C6B0);
  }
  v2 = (void *)qword_100024D08;
  return v2;
}

- (BYDaemonExpressActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYDaemonExpressActivity;
  v2 = [(BYDaemonExpressActivity *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Express Activity Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)registerActivity
{
  dispatch_queue_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for express activities...", v4, 2u);
  }

  [(BYDaemonExpressActivity *)self registerMaintenanceActivity];
  [(BYDaemonExpressActivity *)self registerBackupActivity];
}

- (void)unregisterActivity
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unregistering for express activities...", v5, 2u);
  }

  dispatch_queue_t v3 = +[BYXPCActivityRegistrar sharedInstance];
  [v3 unregisterActivityWithIdentifier:"com.apple.purplebuddy.maintenance"];

  v4 = +[BYXPCActivityRegistrar sharedInstance];
  [v4 unregisterActivityWithIdentifier:"com.apple.purplebuddy.backup"];
}

- (SASExpressCloudSettings)cloudSettings
{
  dispatch_queue_t v3 = [(BYDaemonExpressActivity *)self queue];
  dispatch_assert_queue_V2(v3);

  cloudSettings = self->_cloudSettings;
  if (!cloudSettings)
  {
    v5 = (SASExpressCloudSettings *)objc_alloc_init((Class)SASExpressCloudSettings);
    objc_super v6 = self->_cloudSettings;
    self->_cloudSettings = v5;

    cloudSettings = self->_cloudSettings;
  }
  v7 = cloudSettings;
  return v7;
}

- (void)registerMaintenanceActivity
{
  dispatch_queue_t v3 = +[BYXPCActivityRegistrar sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004B50;
  v4[3] = &unk_10001C6D8;
  v4[4] = self;
  [v3 registerActivityWithIdentifier:"com.apple.purplebuddy.maintenance" criteria:XPC_ACTIVITY_CHECK_IN handler:v4];
}

- (void)registerBackupActivity
{
  dispatch_queue_t v3 = +[BYXPCActivityRegistrar sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004C8C;
  v4[3] = &unk_10001C6D8;
  v4[4] = self;
  [v3 registerActivityWithIdentifier:"com.apple.purplebuddy.backup" criteria:XPC_ACTIVITY_CHECK_IN handler:v4];
}

- (void)_updateSettingsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MBManager);
  if ([v5 isBackupEnabled]
    && (+[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal"), objc_super v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 BOOLForKey:@"SkipExpressSettingsUpload"], v6, !v7))
  {
    *(void *)buf = 0;
    v14 = buf;
    uint64_t v15 = 0x3032000000;
    v16 = sub_100004F04;
    v17 = sub_100004F14;
    id v18 = (id)os_transaction_create();
    [v4 setState:4];
    v9 = [(BYDaemonExpressActivity *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004F1C;
    block[3] = &unk_10001C728;
    block[4] = self;
    id v11 = v4;
    v12 = buf;
    dispatch_async(v9, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping updating express settings", buf, 2u);
    }

    [v4 setState:5];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setCloudSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSettings, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end