@interface BYDaemonConnectionManager
+ (id)sharedInstance;
- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)_handleIncomingAutomatedDeviceEnrollmentConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BYDaemonConnectionManager)init;
- (BYFlowSkipController)flowSkipController;
- (NSXPCConnection)currentProximityAutomatedDeviceEnrollmentConnection;
- (void)_monitorLocalNotifications;
- (void)_monitorXPCEvents;
- (void)dealloc;
- (void)performLaunchTokenUpgrade;
- (void)setCurrentProximityAutomatedDeviceEnrollmentConnection:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)start;
@end

@implementation BYDaemonConnectionManager

+ (id)sharedInstance
{
  if (qword_100024DD8 != -1) {
    dispatch_once(&qword_100024DD8, &stru_10001CBB8);
  }
  v2 = (void *)qword_100024DD0;
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_generalListener invalidate];
  [(NSXPCListener *)self->_generalListener setDelegate:0];
  [(NSXPCListener *)self->_cloudSyncListener invalidate];
  [(NSXPCListener *)self->_cloudSyncListener setDelegate:0];
  [(NSXPCListener *)self->_migrationSourceListener invalidate];
  [(NSXPCListener *)self->_migrationSourceListener setDelegate:0];
  [(NSXPCListener *)self->_proximitySourceListener invalidate];
  [(NSXPCListener *)self->_proximitySourceListener setDelegate:0];
  [(NSXPCListener *)self->_proximityTargetListener invalidate];
  [(NSXPCListener *)self->_proximityTargetListener setDelegate:0];
  [(NSXPCListener *)self->_proximityAutomatedDeviceEnrollmentTargetListener invalidate];
  [(NSXPCListener *)self->_proximityAutomatedDeviceEnrollmentTargetListener setDelegate:0];
  [(NSXPCListener *)self->_settingsManagerListener invalidate];
  [(NSXPCListener *)self->_settingsManagerListener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BYDaemonConnectionManager;
  [(BYDaemonConnectionManager *)&v3 dealloc];
}

- (BYDaemonConnectionManager)init
{
  v27.receiver = self;
  v27.super_class = (Class)BYDaemonConnectionManager;
  v2 = [(BYDaemonConnectionManager *)&v27 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(BYDaemonContext);
    context = v2->_context;
    v2->_context = v3;

    v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.xpc"];
    generalListener = v2->_generalListener;
    v2->_generalListener = v5;

    [(NSXPCListener *)v2->_generalListener setDelegate:v2];
    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.cloud.xpc"];
    cloudSyncListener = v2->_cloudSyncListener;
    v2->_cloudSyncListener = v7;

    [(NSXPCListener *)v2->_cloudSyncListener setDelegate:v2];
    v9 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.migration.source.xpc"];
    migrationSourceListener = v2->_migrationSourceListener;
    v2->_migrationSourceListener = v9;

    [(NSXPCListener *)v2->_migrationSourceListener setDelegate:v2];
    v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.proximity.source.xpc"];
    proximitySourceListener = v2->_proximitySourceListener;
    v2->_proximitySourceListener = v11;

    [(NSXPCListener *)v2->_proximitySourceListener setDelegate:v2];
    v13 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.proximity.target.xpc"];
    proximityTargetListener = v2->_proximityTargetListener;
    v2->_proximityTargetListener = v13;

    [(NSXPCListener *)v2->_proximityTargetListener setDelegate:v2];
    v15 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc"];
    proximityAutomatedDeviceEnrollmentTargetListener = v2->_proximityAutomatedDeviceEnrollmentTargetListener;
    v2->_proximityAutomatedDeviceEnrollmentTargetListener = v15;

    [(NSXPCListener *)v2->_proximityAutomatedDeviceEnrollmentTargetListener setDelegate:v2];
    v17 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.purplebuddy.budd.settings.xpc"];
    settingsManagerListener = v2->_settingsManagerListener;
    v2->_settingsManagerListener = v17;

    [(NSXPCListener *)v2->_settingsManagerListener setDelegate:v2];
    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.budd.pendingFollowUpRevisionQueue", v19);
    pendingFollowUpRevisionQueue = v2->_pendingFollowUpRevisionQueue;
    v2->_pendingFollowUpRevisionQueue = (OS_dispatch_queue *)v20;

    v22 = objc_alloc_init(BYDaemonMigrationSourceController);
    migrationSourceController = v2->_migrationSourceController;
    v2->_migrationSourceController = v22;

    v24 = (BYFlowSkipController *)objc_alloc_init((Class)BYFlowSkipController);
    flowSkipController = v2->_flowSkipController;
    v2->_flowSkipController = v24;
  }
  return v2;
}

- (void)performLaunchTokenUpgrade
{
  if (+[BYManagedAppleIDBootstrap isMultiUser])
  {
    v2 = +[BYManagedAppleIDBootstrap sharedManager];
    unsigned int v3 = [v2 isLoginUser];

    v4 = _BYLoggingFacility();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        v6 = "Login user, not performing token upgrade.";
        v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting at-launch token upgrade...", v8, 2u);
      }

      v4 = dispatch_get_global_queue(25, 0);
      dispatch_async(v4, &stru_10001CBD8);
    }
  }
  else
  {
    v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Not multi-user, not performing token upgrade.";
      v7 = buf;
      goto LABEL_7;
    }
  }
}

- (void)start
{
  [(NSXPCListener *)self->_generalListener resume];
  [(NSXPCListener *)self->_cloudSyncListener resume];
  [(NSXPCListener *)self->_migrationSourceListener resume];
  [(NSXPCListener *)self->_proximitySourceListener resume];
  [(NSXPCListener *)self->_proximityTargetListener resume];
  [(NSXPCListener *)self->_proximityAutomatedDeviceEnrollmentTargetListener resume];
  [(NSXPCListener *)self->_settingsManagerListener resume];
  [(BYDaemonConnectionManager *)self _monitorXPCEvents];
  [(BYDaemonConnectionManager *)self _monitorLocalNotifications];
  [(BYDaemonConnectionManager *)self performLaunchTokenUpgrade];
}

- (void)_monitorXPCEvents
{
  pendingFollowUpRevisionQueue = self->_pendingFollowUpRevisionQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000F9C0;
  handler[3] = &unk_10001CC00;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", pendingFollowUpRevisionQueue, handler);
  unsigned int v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registered for xpc events", v4, 2u);
  }
}

- (void)_monitorLocalNotifications
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FBAC;
  v10[3] = &unk_10001CC28;
  v10[4] = self;
  v2 = objc_retainBlock(v10);
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = MCEffectiveSettingsChangedNotification;
  BOOL v5 = +[MCProfileConnection sharedConnection];
  uint64_t v6 = [v3 addObserverForName:v4 object:v5 queue:0 usingBlock:v2];
  v7 = (void *)qword_100024DE0;
  qword_100024DE0 = v6;

  v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registered for local notifications", v9, 2u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  [v7 processIdentifier];
  v8 = BYProcessNameForPID();
  __int16 v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@[%u]", v8, [v7 processIdentifier]);

  v10 = _BYLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection from: %@", buf, 0xCu);
  }

  if ([(BYDaemonConnectionManager *)self _connection:v7 hasEntitlement:@"com.apple.purplebuddy.budd.access"])
  {
    if (self->_generalListener == v6)
    {
      v12 = [[BYDaemonGeneralClientConnection alloc] initWithConnection:v7 flowSkipController:self->_flowSkipController];
      [(BYDaemonClientConnection *)v12 setContext:self->_context];
      goto LABEL_16;
    }
    if (self->_cloudSyncListener == v6)
    {
      v12 = [[BYDaemonCloudSyncClientConnection alloc] initWithConnection:v7];
      v15 = (__objc2_class *)BYBuddyDaemonCloudSyncClient;
    }
    else
    {
      if (self->_migrationSourceListener != v6)
      {
        if (self->_proximitySourceListener == v6)
        {
          v12 = [[BYDaemonProximitySourceClientConnection alloc] initWithConnection:v7 migrationController:self->_migrationSourceController];
          uint64_t v16 = +[BYBuddyDaemonProximitySourceClient proximitySourceClientInterface];
        }
        else
        {
          if (self->_proximityTargetListener != v6)
          {
            if (self->_proximityAutomatedDeviceEnrollmentTargetListener == v6)
            {
              BOOL v14 = [(BYDaemonConnectionManager *)self _handleIncomingAutomatedDeviceEnrollmentConnection:v7];
              goto LABEL_24;
            }
            if (self->_settingsManagerListener != v6)
            {
              v11 = 0;
              v12 = 0;
LABEL_21:
              [v7 setExportedObject:v12];
              v17 = [(id)objc_opt_class() daemonProtocolInterface];
              [v7 setExportedInterface:v17];

              if (v11) {
                [v7 setRemoteObjectInterface:v11];
              }
              [(BYDaemonClientConnection *)v12 setConnection:v7];
              [v7 resume];

              BOOL v14 = 1;
              goto LABEL_24;
            }
            v12 = [(BYDaemonClientConnection *)[BYDaemonSettingsManagerClientConnection alloc] initWithConnection:v7];
LABEL_16:
            v11 = 0;
            goto LABEL_21;
          }
          v12 = [[BYDaemonProximityTargetClientConnection alloc] initWithConnection:v7];
          uint64_t v16 = +[BYBuddyDaemonProximityTargetClient proximityTargetClientInterface];
        }
LABEL_20:
        v11 = (void *)v16;
        goto LABEL_21;
      }
      v12 = [[BYDaemonMigrationSourceClientConnection alloc] initWithConnection:v7 migrationController:self->_migrationSourceController];
      v15 = BYDaemonMigrationSourceClientConnection;
    }
    uint64_t v16 = [(__objc2_class *)v15 clientInterface];
    goto LABEL_20;
  }
  v13 = _BYLoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000109D4();
  }

  BOOL v14 = 0;
LABEL_24:

  return v14;
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  uint64_t v4 = [a3 valueForEntitlement:a4];
  BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0 && ([v4 BOOLValue] & 1) != 0;

  return v5;
}

- (BOOL)_handleIncomingAutomatedDeviceEnrollmentConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BYDaemonConnectionManager *)self currentProximityAutomatedDeviceEnrollmentConnection];
  if (!v5
    || (uint64_t v6 = (void *)v5,
        [(BYDaemonConnectionManager *)self currentProximityAutomatedDeviceEnrollmentConnection], id v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v6, v7 == v4))
  {
    v8 = objc_alloc_init((Class)DMTSharingBackedRemoteSetupBroadcastingProvider);
    v10 = [[BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection alloc] initWithConnection:v4 broadcastingProvider:v8];
    [v4 setExportedObject:v10];
    v11 = [(id)objc_opt_class() daemonProtocolInterface];
    [v4 setExportedInterface:v11];

    v12 = +[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient clientInterface];
    [v4 setRemoteObjectInterface:v12];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100010274;
    v20[3] = &unk_10001CC50;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    [v4 setInvalidationHandler:v20];
    BOOL v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    uint64_t v16 = sub_10001036C;
    v17 = &unk_10001CC50;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    [v4 setInterruptionHandler:&v14];
    -[BYDaemonConnectionManager setCurrentProximityAutomatedDeviceEnrollmentConnection:](self, "setCurrentProximityAutomatedDeviceEnrollmentConnection:", v4, v14, v15, v16, v17);
    [v4 resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    BOOL v9 = 1;
  }
  else
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100010A54(v8);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (NSXPCConnection)currentProximityAutomatedDeviceEnrollmentConnection
{
  return self->_currentProximityAutomatedDeviceEnrollmentConnection;
}

- (void)setCurrentProximityAutomatedDeviceEnrollmentConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProximityAutomatedDeviceEnrollmentConnection, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_migrationSourceController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pendingFollowUpRevisionQueue, 0);
  objc_storeStrong((id *)&self->_settingsManagerListener, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentTargetListener, 0);
  objc_storeStrong((id *)&self->_proximityTargetListener, 0);
  objc_storeStrong((id *)&self->_proximitySourceListener, 0);
  objc_storeStrong((id *)&self->_migrationSourceListener, 0);
  objc_storeStrong((id *)&self->_cloudSyncListener, 0);
  objc_storeStrong((id *)&self->_generalListener, 0);
}

@end