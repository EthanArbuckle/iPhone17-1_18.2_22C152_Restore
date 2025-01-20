@interface NEKDaemon
- (NEKDaemon)initWithEnvironment:(id)a3;
- (id)environment;
- (void)_databaseChangedExternally;
- (void)_enableDisableLogging;
- (void)_registerForNotifications;
- (void)_triggerFullSync;
- (void)_triggerMigrationSync;
- (void)_triggerNightlySync;
- (void)didReceiveReunionSyncCommand:(id)a3;
- (void)didReceiveStartSyncCommand:(id)a3;
@end

@implementation NEKDaemon

- (NEKDaemon)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NEKDaemon;
  v5 = [(NEKDaemon *)&v36 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    uint64_t v7 = +[NDTLog facilityWithSubsystem:@"com.apple.eventkitsync" category:@"phone"];
    v8 = (void *)qword_1000C6CA8;
    qword_1000C6CA8 = v7;

    uint64_t v9 = +[NDTLog facilityWithSubsystem:@"com.apple.eventkitsync" category:@"ics"];
    v10 = (void *)qword_1000C6CB0;
    qword_1000C6CB0 = v9;

    uint64_t v11 = +[NDTLog facilityWithSubsystem:@"com.apple.eventkitsync" category:@"analytics"];
    v12 = (void *)qword_1000C6CB8;
    qword_1000C6CB8 = v11;

    [(NEKDaemon *)v6 _enableDisableLogging];
    v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "== Started EventKitSync-409", buf, 2u);
    }
    v14 = [(NEKDaemon *)v6 environment];
    v15 = [v14 dbFileManager];
    v16 = [v15 pairingID];

    v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Pairing ID: %{public}@", buf, 0xCu);
    }
    v18 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Pre prefs observer init", buf, 2u);
    }
    uint64_t v19 = sub_100006A20("PreferencesObserver");
    preferencesQueue = v6->_preferencesQueue;
    v6->_preferencesQueue = (OS_dispatch_queue *)v19;

    objc_initWeak((id *)buf, v6);
    v21 = v6->_preferencesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002BD54;
    block[3] = &unk_1000A8B48;
    objc_copyWeak(&v35, (id *)buf);
    dispatch_async(v21, block);
    uint64_t v22 = sub_100006A20("com.apple.eventkitsyncd.daemon");
    daemonQueue = v6->_daemonQueue;
    v6->_daemonQueue = (OS_dispatch_queue *)v22;

    v24 = v6->_daemonQueue;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = sub_10002BDF0;
    v32 = &unk_1000A8B90;
    v25 = v6;
    v33 = v25;
    dispatch_async(v24, &v29);
    uint64_t v26 = sub_100006A20("com.apple.eventkitsyncd.notifications");
    notificationQueue = v25->_notificationQueue;
    v25->_notificationQueue = (OS_dispatch_queue *)v26;

    [(NEKDaemon *)v25 _registerForNotifications];
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return WeakRetained;
}

- (void)_registerForNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = +[NEKSyncCoordinator receivedStartSyncNotificationString];
  [v3 addObserver:self selector:"didReceiveStartSyncCommand:" name:v4 object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  v6 = +[NEKSyncCoordinator receivedReunionSyncNotificationString];
  [v5 addObserver:self selector:"didReceiveReunionSyncCommand:" name:v6 object:0];

  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002C160;
  handler[3] = &unk_1000A9440;
  objc_copyWeak(&v13, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", notificationQueue, handler);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C898;
  v10[3] = &unk_1000A9440;
  objc_copyWeak(&v11, &location);
  xpc_activity_register("com.apple.eventkitsync.analytics.daily", XPC_ACTIVITY_CHECK_IN, v10);
  v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[NEKDaemon _registerForNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Registered for XPC activity.", buf, 0xCu);
  }
  uint64_t v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered for notifications.", buf, 2u);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)didReceiveStartSyncCommand:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received full sync command from NEKSyncCoordinator.", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  preferencesQueue = self->_preferencesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CB4C;
  block[3] = &unk_1000A8B48;
  objc_copyWeak(&v12, buf);
  dispatch_async(preferencesQueue, block);
  uint64_t v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting sync controller.", v10, 2u);
  }
  v8 = [(NEKDaemon *)self environment];
  uint64_t v9 = [v8 syncController];
  [v9 setNeedsFullSync];

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)didReceiveReunionSyncCommand:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received reunion sync command.", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  preferencesQueue = self->_preferencesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CD74;
  block[3] = &unk_1000A8B48;
  objc_copyWeak(&v12, buf);
  dispatch_async(preferencesQueue, block);
  uint64_t v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting sync controller.", v10, 2u);
  }
  v8 = [(NEKDaemon *)self environment];
  uint64_t v9 = [v8 syncController];
  [v9 setNeedsReunionSync];

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)_databaseChangedExternally
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NEKDatabaseChangedExternallyNotification" object:0];
}

- (void)_triggerFullSync
{
  id v3 = [(NEKDaemon *)self environment];
  id v2 = [v3 syncController];
  [v2 setNeedsFullSync];
}

- (void)_triggerNightlySync
{
  id v3 = [(NEKDaemon *)self environment];
  id v2 = [v3 syncController];
  [v2 setNeedsNightlySync];
}

- (void)_triggerMigrationSync
{
  id v3 = [(NEKDaemon *)self environment];
  id v2 = [v3 syncController];
  [v2 setNeedsMigrationSync];
}

- (void)_enableDisableLogging
{
  dword_1000C6CC0 = 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_logDbFile, 0);
  objc_storeStrong((id *)&self->_preferencesQueue, 0);
  objc_storeStrong((id *)&self->_preferencesObserver, 0);
  objc_storeStrong((id *)&self->_daemonQueue, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end