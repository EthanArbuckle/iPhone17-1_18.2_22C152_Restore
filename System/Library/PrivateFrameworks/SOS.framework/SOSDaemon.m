@interface SOSDaemon
+ (void)connectToDaemon;
- (SOSDaemon)init;
- (id)keepAliveFileDirectory;
- (id)keepAliveFilePath;
- (id)keepAliveFilename;
- (void)SOSHasActiveTriggerChanged:(id)a3;
- (void)SOSSendingLocationUpdateChanged:(id)a3;
- (void)createKeepAlivePathStateFile;
- (void)dealloc;
- (void)deleteKeepAlivePathStateFile;
- (void)languageDidChange;
- (void)releaseLocationStatusBarAssertion;
- (void)releaseMessageSendingOSTransaction;
- (void)run;
- (void)startSendingLocationUpdateNotification;
- (void)stopSendingLocationUpdateNotification;
- (void)takeLocationStatusBarAssertion;
- (void)takeMessageSendingOSTransaction;
@end

@implementation SOSDaemon

- (void)run
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v4 = +[NSRunLoop mainRunLoop];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100001380;
  v5[3] = &unk_100004228;
  v5[4] = self;
  [v4 performBlock:v5];
  [v4 run];
}

- (SOSDaemon)init
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "initializing SOSDaemon", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)SOSDaemon;
  v4 = [(SOSDaemon *)&v22 init];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"SOSSendingLocationUpdateChanged:" name:SOSSendingLocationUpdateChangedNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"SOSHasActiveTriggerChanged:" name:SOSHasActiveTriggerChangedNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_100001624, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v8 = +[SOSEngine sharedInstance];
    sosEngine = v4->_sosEngine;
    v4->_sosEngine = (SOSEngine *)v8;

    id v10 = objc_alloc((Class)NSXPCListener);
    v11 = (NSXPCListener *)[v10 initWithMachServiceName:SOSMachService];
    xpcListener = v4->_xpcListener;
    v4->_xpcListener = v11;

    [(NSXPCListener *)v4->_xpcListener setDelegate:v4->_sosEngine];
    [(NSXPCListener *)v4->_xpcListener resume];
    id v13 = objc_alloc((Class)NSXPCListener);
    v14 = (NSXPCListener *)[v13 initWithMachServiceName:SOSStatusMachService];
    v15 = v4->_xpcListener;
    v4->_xpcListener = v14;

    v16 = v4->_xpcListener;
    v17 = [(SOSEngine *)v4->_sosEngine sosStatusManager];
    [(NSXPCListener *)v16 setDelegate:v17];

    [(NSXPCListener *)v4->_xpcListener resume];
    p_notifyToken = &v4->_notifyToken;
    uint32_t v19 = notify_register_dispatch(SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME, &v4->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, &stru_100004268);
    if (v19 || !notify_is_valid_token(*p_notifyToken))
    {
      v20 = sub_1000025DC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100002704(&v4->_notifyToken, v19, v20);
      }
    }
    else
    {
      notify_set_state(*p_notifyToken, 1uLL);
    }
    notify_post(SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME);
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:SOSSendingLocationUpdateChangedNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:SOSHasActiveTriggerChangedNotification object:0];

  notify_cancel(self->_notifyToken);
  v5.receiver = self;
  v5.super_class = (Class)SOSDaemon;
  [(SOSDaemon *)&v5 dealloc];
}

- (void)SOSSendingLocationUpdateChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000025DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:SOSSendingLocationUpdateValueKey];
  unsigned int v8 = [v7 BOOLValue];

  if (v8) {
    [(SOSDaemon *)self startSendingLocationUpdateNotification];
  }
  else {
    [(SOSDaemon *)self stopSendingLocationUpdateNotification];
  }
}

- (void)startSendingLocationUpdateNotification
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  [(SOSDaemon *)self createKeepAlivePathStateFile];
  [(SOSDaemon *)self takeMessageSendingOSTransaction];
  [(SOSDaemon *)self takeLocationStatusBarAssertion];
}

- (void)stopSendingLocationUpdateNotification
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  [(SOSDaemon *)self releaseLocationStatusBarAssertion];
  [(SOSDaemon *)self releaseMessageSendingOSTransaction];
  if (!self->_sosIsStarting) {
    [(SOSDaemon *)self deleteKeepAlivePathStateFile];
  }
}

- (void)SOSHasActiveTriggerChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000025DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SOSDaemon, SOSHasActiveTriggerChanged", v8, 2u);
  }

  v6 = [v4 userInfo];

  v7 = [v6 objectForKeyedSubscript:SOSHasActiveTriggerValueKey];
  self->_sosIsStarting = [v7 BOOLValue];

  if (self->_sosIsStarting)
  {
    [(SOSDaemon *)self createKeepAlivePathStateFile];
  }
  else if (!self->_sendingMessagesOSTransaction)
  {
    [(SOSDaemon *)self deleteKeepAlivePathStateFile];
  }
}

- (void)takeLocationStatusBarAssertion
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  id v4 = (SBSStatusBarStyleOverridesAssertion *)[objc_alloc((Class)SBSStatusBarStyleOverridesAssertion) initWithStatusBarStyleOverrides:0x10000 forPID:getpid() exclusive:0 showsWhenForeground:1];
  locationSBAssertion = self->_locationSBAssertion;
  self->_locationSBAssertion = v4;

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"SOS_USING_YOUR_LOCATION" value:&stru_100004390 table:0];
  [(SBSStatusBarStyleOverridesAssertion *)self->_locationSBAssertion setStatusString:v7];

  unsigned int v8 = self->_locationSBAssertion;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001C34;
  v10[3] = &unk_100004290;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100001D10;
  v9[3] = &unk_100004228;
  v9[4] = self;
  [(SBSStatusBarStyleOverridesAssertion *)v8 acquireWithHandler:v10 invalidationHandler:v9];
}

- (void)releaseLocationStatusBarAssertion
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    locationSBAssertion = self->_locationSBAssertion;
    int v6 = 138412290;
    v7 = locationSBAssertion;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_locationSBAssertion: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBSStatusBarStyleOverridesAssertion *)self->_locationSBAssertion invalidate];
  objc_super v5 = self->_locationSBAssertion;
  self->_locationSBAssertion = 0;
}

- (void)takeMessageSendingOSTransaction
{
  self->_sendingMessagesOSTransaction = (OS_os_transaction *)os_transaction_create();

  _objc_release_x1();
}

- (void)releaseMessageSendingOSTransaction
{
  self->_sendingMessagesOSTransaction = 0;
  _objc_release_x1();
}

- (id)keepAliveFilename
{
  return @"KeepAlive";
}

- (id)keepAliveFileDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndex:0];

  v7[0] = v3;
  v7[1] = @"SOS";
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  objc_super v5 = +[NSString pathWithComponents:v4];

  return v5;
}

- (id)keepAliveFilePath
{
  v3 = [(SOSDaemon *)self keepAliveFileDirectory];
  id v4 = [(SOSDaemon *)self keepAliveFilename];
  objc_super v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (void)createKeepAlivePathStateFile
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(SOSDaemon *)self keepAliveFilePath];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  if ((v5 & 1) == 0)
  {
    int v6 = [(SOSDaemon *)self keepAliveFileDirectory];
    id v17 = 0;
    unsigned int v7 = [v3 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v8 = v17;

    int v9 = sub_1000025DC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(SOSDaemon *)self keepAliveFileDirectory];
      *(_DWORD *)buf = 138412802;
      uint32_t v19 = v10;
      __int16 v20 = 1024;
      unsigned int v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created directory at path %@ with success: %d error: %@", buf, 0x1Cu);
    }
    v11 = [(SOSDaemon *)self keepAliveFilePath];
    id v16 = 0;
    unsigned int v12 = [@"SOS_in_progress\n" writeToFile:v11 atomically:1 encoding:4 error:&v16];
    id v13 = v16;

    v14 = sub_1000025DC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(SOSDaemon *)self keepAliveFilePath];
      *(_DWORD *)buf = 138412802;
      uint32_t v19 = v15;
      __int16 v20 = 1024;
      unsigned int v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wrote to file at path %@ with success: %d error: %@", buf, 0x1Cu);
    }
  }
}

- (void)deleteKeepAlivePathStateFile
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(SOSDaemon *)self keepAliveFilePath];
  id v9 = 0;
  unsigned int v5 = [v3 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  unsigned int v7 = sub_1000025DC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SOSDaemon *)self keepAliveFilePath];
    *(_DWORD *)buf = 138412802;
    v11 = v8;
    __int16 v12 = 1024;
    unsigned int v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removed file at path %@ success: %d error: %@", buf, 0x1Cu);
  }
}

+ (void)connectToDaemon
{
  v2 = sub_1000025DC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "", v8, 2u);
  }

  v3 = +[IMDaemonController sharedInstance];
  unsigned __int8 v4 = [v3 hasListenerForID:@"SOSMessages"];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[IMDaemonController sharedInstance];
    if (qword_100008368 != -1) {
      dispatch_once(&qword_100008368, &stru_1000042D0);
    }
    [v5 addListenerID:@"SOSMessages" capabilities:dword_100008360];

    id v6 = +[IMDaemonController sharedInstance];
    [v6 blockUntilConnected];

    unsigned int v7 = +[IMDaemonController sharedInstance];
    [v7 _setBlocksConnectionAtResume:1];
  }
}

- (void)languageDidChange
{
  v2 = sub_1000025DC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "", v3, 2u);
  }

  exit(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingMessagesOSTransaction, 0);
  objc_storeStrong((id *)&self->_locationSBAssertion, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_sosEngine, 0);
}

@end