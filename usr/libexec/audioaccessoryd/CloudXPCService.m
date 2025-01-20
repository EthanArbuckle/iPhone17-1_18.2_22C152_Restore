@interface CloudXPCService
+ (id)sharedInstance;
- (BOOL)accountAvailable;
- (BOOL)manateeZoneUpgraded;
- (BTNetworkMonitor)networkMonitor;
- (BTXPCConnection)serverConnection;
- (CloudXPCService)init;
- (NSHashTable)clients;
- (NSMutableDictionary)activeTransactions;
- (NSUserDefaults)bluetoothDefaults;
- (OS_dispatch_queue)transactionQueue;
- (OS_dispatch_queue)xpcQueue;
- (OS_xpc_object)cloudKitConnection;
- (OS_xpc_object)xpcServer;
- (_TtC15audioaccessoryd13DeviceManager)deviceManager;
- (_TtC15audioaccessoryd16DefaultsObserver)bluetoothDefaultsObserver;
- (id)_legacyNicknameMessage:(id)a3 withNewFormatDevices:(id)a4;
- (id)bundleIdentifierForConnection:(id)a3;
- (id)readUserPreference:(id)a3;
- (id)transactionIdentifierForActionIdentifier:(id)a3;
- (void)_sigTermReceived;
- (void)accountStatusAvailable:(BOOL)a3 force:(BOOL)a4;
- (void)accountStatusUpdateWithAvailable:(BOOL)a3 forced:(BOOL)a4;
- (void)activate;
- (void)allDeviceSupportInformationRecordsRemovedWithRecords:(id)a3;
- (void)allDevicesRemovedWithRecords:(id)a3;
- (void)allLegacyMagicPairingRecordsWithRecordsData:(id)a3;
- (void)allMagicPairingRecordsRemovedWithRecords:(id)a3;
- (void)axHeadTrackingSettingChanged;
- (void)beginTransaction:(id)a3;
- (void)dealloc;
- (void)deviceSupportInformationRecordsRemovedWithRecords:(id)a3;
- (void)deviceSupportInformationRecordsUpdatedWithRecords:(id)a3;
- (void)devicesRemovedWithRecords:(id)a3;
- (void)devicesUpdatedWithRecords:(id)a3;
- (void)endTransaction:(id)a3;
- (void)establishBluetoothdXPCWithCompletion:(id)a3;
- (void)handleConnection:(id)a3;
- (void)handleConnection:(id)a3 XPCMessage:(id)a4 userID:(unsigned int)a5 processID:(int)a6;
- (void)handleEvent:(id)a3;
- (void)hmDeviceCloudRecordsRemovedWithRecords:(id)a3;
- (void)hmDeviceCloudRecordsUpdatedWithRecords:(id)a3;
- (void)magicPairingRecordsRemovedWithRecords:(id)a3;
- (void)magicPairingRecordsUpdatedWithRecords:(id)a3;
- (void)removeConnection:(id)a3;
- (void)sendCloudKitMsg:(id)a3 args:(id)a4;
- (void)sendCloudKitMsg:(id)a3 args:(id)a4 withReply:(id)a5;
- (void)sendCloudKitMsg:(id)a3 argsObject:(id)a4;
- (void)sendCloudKitMsgSync:(id)a3 args:(id)a4 withReply:(id)a5;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setAccountAvailable:(BOOL)a3;
- (void)setActiveTransactions:(id)a3;
- (void)setBluetoothDefaults:(id)a3;
- (void)setBluetoothDefaultsObserver:(id)a3;
- (void)setClients:(id)a3;
- (void)setCloudKitConnection:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)setXpcQueue:(id)a3;
- (void)setXpcServer:(id)a3;
@end

@implementation CloudXPCService

+ (id)sharedInstance
{
  if (qword_100263F08 != -1) {
    dispatch_once(&qword_100263F08, &stru_1002353C8);
  }
  v2 = (void *)qword_100263F00;

  return v2;
}

- (CloudXPCService)init
{
  v27.receiver = self;
  v27.super_class = (Class)CloudXPCService;
  id v2 = [(CloudXPCService *)&v27 init];
  if (!v2) {
    return (CloudXPCService *)v2;
  }
  v3 = +[NSProcessInfo processInfo];
  v4 = [v3 environment];
  v5 = [v4 objectForKey:@"XPC_SERVICE_NAME"];

  v6 = sub_10006CA04("XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v5;
      v8 = "Cloudpaird is launched by (%@)";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = "Cloudpaird is launched";
    v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_7;
  }

  uint64_t v11 = +[NSHashTable hashTableWithOptions:0];
  v12 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v11;

  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.cloudpaird.xpcservice", v13);
  v15 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = v14;

  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.cloudpaird.xpcservice.transactions", v16);
  v18 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v17;

  uint64_t v19 = +[NSMutableDictionary dictionary];
  v20 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v19;

  *((_DWORD *)v2 + 2) = -1;
  if (!*((void *)v2 + 2))
  {
    dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *((dispatch_queue_t *)v2 + 4));
    v22 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v21;

    v23 = *((void *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100082190;
    handler[3] = &unk_100232710;
    id v26 = v2;
    dispatch_source_set_event_handler(v23, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
  }
  return (CloudXPCService *)v2;
}

- (void)activate
{
  objc_initWeak(&location, self);
  v3 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activate Bluetooth Cloud User Daemon", buf, 2u);
  }

  [(CloudXPCService *)self establishBluetoothdXPCWithCompletion:0];
  if (+[CBPreferencesManager isDeviceClass:@"AudioAccessory"])
  {
    v4 = +[DarwinNotificationManager shared];
    [v4 setUp];
  }
  else
  {
    v5 = +[DeviceManager singleton];
    [(CloudXPCService *)self setDeviceManager:v5];

    v6 = [(CloudXPCService *)self xpcQueue];
    BOOL v7 = [(CloudXPCService *)self deviceManager];
    [v7 setClientQueue:v6];

    v8 = [(CloudXPCService *)self deviceManager];
    [v8 setDeviceDelegate:self];

    v9 = [(CloudXPCService *)self deviceManager];
    [v9 setHmDeviceDelegate:self];

    id v10 = +[MPCloudKit sharedInstance];
    id v11 = +[MPCloudKit_Manatee sharedInstance];
    v4 = +[CloudPushService shared];
    [v4 start];
  }

  id v12 = +[CBIDSManager sharedInstance];
  v13 = (const char *)[kAXSAirPodSpatialAudioLockToDeviceChangedNotification UTF8String];
  dispatch_queue_t v14 = [(CloudXPCService *)self xpcQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000825DC;
  handler[3] = &unk_1002353F0;
  objc_copyWeak(&v27, &location);
  notify_register_dispatch(v13, &self->_axHeadTrackingChangedNotifyToken, v14, handler);

  [(CloudXPCService *)self axHeadTrackingSettingChanged];
  v15 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Create the XPC server", buf, 2u);
  }

  v16 = [(CloudXPCService *)self xpcQueue];
  mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v16, 1uLL);
  xpcServer = self->_xpcServer;
  self->_xpcServer = mach_service;

  uint64_t v19 = self->_xpcServer;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008261C;
  v24[3] = &unk_100235418;
  objc_copyWeak(&v25, &location);
  xpc_connection_set_event_handler(v19, v24);
  xpc_connection_resume(self->_xpcServer);
  v20 = objc_alloc_init(BTNetworkMonitor);
  [(CloudXPCService *)self setNetworkMonitor:v20];

  dispatch_source_t v21 = [(CloudXPCService *)self networkMonitor];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100082678;
  v22[3] = &unk_100235440;
  objc_copyWeak(&v23, &location);
  [v21 startMonitoringWithCallback:v22];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_sigTermReceived
{
  v3 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIGTERM received", buf, 2u);
  }

  v4 = [(CloudXPCService *)self transactionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082824;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_sync(v4, block);

  xpc_transaction_exit_clean();
}

- (void)axHeadTrackingSettingChanged
{
  v3 = [(CloudXPCService *)self xpcQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000828F0;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)bundleIdentifierForConnection:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  xpc_connection_get_audit_token();
  memset(&cf, 0, sizeof(cf));
  v3 = SecTaskCreateWithAuditToken(0, &cf);
  if (v3)
  {
    v4 = v3;
    *(void *)cf.val = 0;
    CFStringRef v5 = SecTaskCopySigningIdentifier(v3, (CFErrorRef *)&cf);
    v6 = (__CFString *)v5;
    if (*(void *)cf.val)
    {
      BOOL v7 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001B7EA4();
      }

      CFRelease(*(CFTypeRef *)cf.val);
      if (!v6) {
        goto LABEL_15;
      }
      CFRelease(v6);
    }
    else
    {
      if (v5)
      {
LABEL_15:
        CFRelease(v4);
        goto LABEL_16;
      }
      v9 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001B7E70();
      }
    }
    v6 = 0;
    goto LABEL_15;
  }
  v8 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1001B7E3C();
  }

  v6 = 0;
LABEL_16:

  return v6;
}

- (void)dealloc
{
  v3 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc called", buf, 2u);
  }

  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    self->_xpcServer = 0;
  }
  CFStringRef v5 = [(CloudXPCService *)self serverConnection];

  if (v5) {
    [(CloudXPCService *)self setServerConnection:0];
  }
  v6 = [(CloudXPCService *)self networkMonitor];
  [v6 stopMonitoring];

  int axHeadTrackingChangedNotifyToken = self->_axHeadTrackingChangedNotifyToken;
  if (axHeadTrackingChangedNotifyToken != -1)
  {
    notify_cancel(axHeadTrackingChangedNotifyToken);
    self->_int axHeadTrackingChangedNotifyToken = -1;
  }
  [(CloudXPCService *)self setNetworkMonitor:0];
  v8.receiver = self;
  v8.super_class = (Class)CloudXPCService;
  [(CloudXPCService *)&v8 dealloc];
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CloudXPCService *)self serverConnection];

  if (v8)
  {
    v9 = [(CloudXPCService *)self serverConnection];
    [v9 sendMsg:v6 args:v7];

    sigTermSource = self->_sigTermSource;
    if (sigTermSource)
    {
      id v11 = sigTermSource;
      dispatch_source_cancel(v11);
      long long v12 = self->_sigTermSource;
      self->_sigTermSource = 0;
    }
  }
  else
  {
    long long v13 = sub_10006CA04("XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to Send message: %@, args: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)establishBluetoothdXPCWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082E94;
  v4[3] = &unk_100232620;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)sendCloudKitMsg:(id)a3 argsObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000831F8;
  v10[3] = &unk_1002354A8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(CloudXPCService *)self establishBluetoothdXPCWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100083494;
  v10[3] = &unk_1002354D0;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  id v13 = self;
  [(CloudXPCService *)self establishBluetoothdXPCWithCompletion:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100083810;
  v14[3] = &unk_100235520;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  [(CloudXPCService *)self establishBluetoothdXPCWithCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)sendCloudKitMsgSync:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100083ED8;
  v14[3] = &unk_100235520;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  [(CloudXPCService *)self establishBluetoothdXPCWithCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    [(CloudXPCService *)self handleConnection:v4];
  }
  else
  {
    xpc_type_t v6 = type;
    id v7 = sub_10006CA04("XPC");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v8) {
        sub_1001B82F4();
      }
    }
    else if (v8)
    {
      sub_1001B835C();
    }
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  id v5 = [[BTXPCConnection alloc] initWithConnection:v4];
  xpc_type_t v6 = (BTXPCConnection *)xpc_connection_copy_entitlement_value();
  id v7 = (void *)xpc_connection_copy_entitlement_value();

  BOOL v8 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Check entitlement: %@:%@:[%@]", (uint8_t *)&v15, 0x20u);
  }

  if (v6
    && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL
    && v6 == (BTXPCConnection *)&_xpc_BOOL_true
    && v7
    && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL
    && v7 == &_xpc_BOOL_true
    && ([(CloudXPCService *)self serverConnection],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v14 = sub_10006CA04("XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Connected to bluetoothd: %@", (uint8_t *)&v15, 0xCu);
    }

    [(CloudXPCService *)self setServerConnection:v5];
  }
  else
  {
    id v10 = [(CloudXPCService *)self serverConnection];

    if (v10)
    {
      id v11 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(CloudXPCService *)self serverConnection];
        int v15 = 138412290;
        id v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Already connected to bluetoothd: %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  id v13 = [(CloudXPCService *)self clients];
  [v13 addObject:v5];
}

- (void)devicesRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "devicesRemovedWithDevices: %@", buf, 0xCu);
  }

  id v10 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = sub_10006CA04("XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B83C4();
    }
  }
  else
  {
    CFStringRef v11 = @"devices";
    id v12 = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"DevicesRemovedWithRecords" args:v9];
  }
}

- (void)devicesUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "devicesUpdatedWithDevices: %@", buf, 0xCu);
  }

  id v10 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = sub_10006CA04("XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B842C();
    }
  }
  else
  {
    CFStringRef v11 = @"devices";
    id v12 = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"DevicesUpdatedWithRecords" args:v9];
  }
}

- (void)allDevicesRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "allDevicesRemoved: %@", buf, 0xCu);
  }

  id v10 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = sub_10006CA04("XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B8494();
    }
  }
  else
  {
    CFStringRef v11 = @"devices";
    id v12 = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"AllDevicesRemovedWithRecords" args:v9];
  }
}

- (id)_legacyNicknameMessage:(id)a3 withNewFormatDevices:(id)a4
{
  v20 = self;
  id v21 = a3;
  id v5 = a4;
  xpc_type_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v30[0] = @"bluetoothAddress";
        id v12 = [v11 bluetoothAddress:v20];
        v30[1] = @"nickname";
        v31[0] = v12;
        id v13 = [v11 nickname];
        v31[1] = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
        [v6 addObject:v14];
      }
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  id v23 = 0;
  int v15 = +[NSJSONSerialization dataWithJSONObject:v6 options:0 error:&v23];
  id v16 = v23;
  if (v16)
  {
    __int16 v17 = sub_10006CA04("XPC");
    id v18 = v21;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001B84FC();
    }
  }
  else
  {
    CFStringRef v28 = @"devices";
    v29 = v15;
    __int16 v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v18 = v21;
    [(CloudXPCService *)v20 sendCloudKitMsg:v21 args:v17];
  }

  return v15;
}

- (void)accountStatusUpdateWithAvailable:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v4;
    __int16 v9 = 1024;
    BOOL v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Force(%d) Account status changed: %d", (uint8_t *)v8, 0xEu);
  }

  [(CloudXPCService *)self accountStatusAvailable:v5 force:v4];
}

- (void)allDeviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "allDeviceSupportInformationRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v10 = @"records";
    uint64_t v11 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"AllDeviceSupportInformationRecordsRemoved" args:v9];
  }
}

- (void)allMagicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "allMagicPairingRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v10 = @"records";
    uint64_t v11 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"AllMagicPairingRecordsRemoved" args:v9];
  }
}

- (void)deviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deviceSupportInformationRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v10 = @"records";
    uint64_t v11 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"DeviceSupportInformationRecordsRemoved" args:v9];
  }
}

- (void)deviceSupportInformationRecordsUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deviceSupportInformationRecordsUpdatedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v10 = @"records";
    uint64_t v11 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"DeviceSupportInformationRecordsUpdated" args:v9];
  }
}

- (void)magicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  xpc_type_t v6 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "magicPairingRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v10 = @"records";
    uint64_t v11 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"MagicPairingRecordsRemoved" args:v9];
  }
}

- (void)magicPairingRecordsUpdatedWithRecords:(id)a3
{
  id v9 = a3;
  unsigned __int8 v10 = [(CloudXPCService *)self manateeZoneUpgraded];
  if (v10)
  {
    int v53 = 0;
  }
  else
  {
    id v3 = SmartRoutingStatsWx;
    v48 = +[MPCloudKit sharedInstance];
    BOOL v5 = [v48 pauseErrorReason];
    id v4 = [v5 domain];
    if ([v4 isEqualToString:CKErrorDomain])
    {
      xpc_type_t v6 = +[MPCloudKit sharedInstance];
      uint64_t v7 = [v6 pauseErrorReason];
      if ([v7 code] == (id)26)
      {

        BOOL v11 = 1;
LABEL_42:

        goto LABEL_43;
      }
      int v53 = 1;
    }
    else
    {
      int v53 = 0;
    }
  }
  unsigned __int8 v52 = [(CloudXPCService *)self manateeZoneUpgraded];
  if (v52)
  {
    v51 = v7;
    int v12 = 0;
  }
  else
  {
    id v3 = SmartRoutingStatsWx;
    v50 = +[MPCloudKit sharedInstance];
    v47 = [v50 pauseErrorReason];
    v46 = [v47 domain];
    if ([v46 isEqualToString:CKErrorDomain])
    {
      id v3 = +[MPCloudKit sharedInstance];
      id v13 = [(__objc2_class *)v3 pauseErrorReason];
      if ([v13 code] == (id)11)
      {

        BOOL v11 = 1;
        goto LABEL_39;
      }
      v38 = v13;
      v51 = v7;
      int v12 = 1;
    }
    else
    {
      v51 = v7;
      int v12 = 0;
    }
  }
  unsigned int v14 = [(CloudXPCService *)self manateeZoneUpgraded];
  v49 = v3;
  if (v14
    && (+[MPCloudKit_Manatee sharedInstance],
        v45 = objc_claimAutoreleasedReturnValue(),
        [v45 pauseErrorReason],
        v44 = objc_claimAutoreleasedReturnValue(),
        [v44 domain],
        v43 = objc_claimAutoreleasedReturnValue(),
        [v43 isEqualToString:CKErrorDomain]))
  {
    int v15 = +[MPCloudKit_Manatee sharedInstance];
    id v16 = [v15 pauseErrorReason];
    if ([v16 code] == (id)11)
    {

      BOOL v11 = 1;
      __int16 v17 = v50;
      if ((v12 & 1) == 0) {
        goto LABEL_35;
      }
LABEL_34:

      goto LABEL_35;
    }
    if (![(CloudXPCService *)self manateeZoneUpgraded])
    {

      BOOL v11 = 0;
      __int16 v17 = v50;
      goto LABEL_33;
    }
    v35 = v16;
    v36 = v15;
    int v19 = 1;
  }
  else
  {
    unsigned __int8 v18 = [(CloudXPCService *)self manateeZoneUpgraded];
    int v19 = 0;
    BOOL v11 = 0;
    if ((v18 & 1) == 0) {
      goto LABEL_23;
    }
  }
  int v39 = v19;
  v40 = v6;
  unsigned __int8 v41 = v10;
  v42 = v4;
  v20 = +[MPCloudKit_Manatee sharedInstance];
  id v21 = [v20 pauseErrorReason];
  v22 = [v21 domain];
  if (![v22 isEqualToString:CKErrorDomain])
  {

    BOOL v11 = 0;
    if (!v39) {
      goto LABEL_22;
    }
LABEL_26:

    id v4 = v42;
    unsigned __int8 v10 = v41;
    xpc_type_t v6 = v40;
    __int16 v17 = v50;
    if (v14) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  +[MPCloudKit_Manatee sharedInstance];
  id v23 = v37 = v9;
  [v23 pauseErrorReason];
  long long v24 = v5;
  long long v25 = self;
  v27 = int v26 = v12;
  BOOL v11 = [v27 code] == (id)26;

  int v12 = v26;
  self = v25;
  BOOL v5 = v24;

  id v9 = v37;
  if (v39) {
    goto LABEL_26;
  }
LABEL_22:
  id v4 = v42;
  unsigned __int8 v10 = v41;
  xpc_type_t v6 = v40;
LABEL_23:
  __int16 v17 = v50;
  if (v14)
  {
LABEL_33:

    if ((v12 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_27:
  if (v12) {
    goto LABEL_34;
  }
LABEL_35:
  uint64_t v7 = v51;
  if ((v52 & 1) == 0)
  {

LABEL_39:
    if ((v53 & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (v53)
  {
LABEL_40:
  }
LABEL_41:
  if ((v10 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_43:
  id v28 = [v9 count];
  v29 = sub_10006CA04("MagicPairing");
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (!v28 && v11)
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Inform bluetoothd again no data on cloud", buf, 2u);
    }

    *(_WORD *)buf = 0;
    v31 = +[CloudXPCService sharedInstance];
    v32 = +[NSData dataWithBytes:buf length:2];
    v33 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v32, @"kDeviceInfoBlob", 0];
    [v31 sendCloudKitMsg:@"DeviceInfoAvailable" args:v33];

    goto LABEL_52;
  }
  if (v30)
  {
    *(_DWORD *)buf = 138477827;
    id v58 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "magicPairingRecordsUpdatedWithRecords: %{private}@", buf, 0xCu);
  }

  uint64_t v34 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  v31 = (void *)v34;
  if (v34)
  {
    CFStringRef v55 = @"records";
    uint64_t v56 = v34;
    v32 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    [(CloudXPCService *)self sendCloudKitMsg:@"MagicPairingRecordsUpdated" args:v32];
LABEL_52:
  }
}

- (void)allLegacyMagicPairingRecordsWithRecordsData:(id)a3
{
  id v3 = a3;
  id v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inform bluetoothd with cloud data: %@", buf, 0xCu);
  }

  if (v3)
  {
    BOOL v5 = +[CloudXPCService sharedInstance];
    xpc_type_t v6 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v3, @"kDeviceInfoBlob", 0];
    [v5 sendCloudKitMsg:@"DeviceInfoAvailable" args:v6];
  }
}

- (void)accountStatusAvailable:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v26[0]) = v5;
    WORD2(v26[0]) = 1024;
    *(_DWORD *)((char *)v26 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Account status changed: %d, Forced: %d", buf, 0xEu);
  }

  id v8 = [(CloudXPCService *)self deviceManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100085F40;
  v19[3] = &unk_100235560;
  BOOL v20 = v5;
  [v8 fetchAccountMagicKeysBlobWithCompletion:v19];

  BOOL v9 = [(CloudXPCService *)self accountAvailable] ^ v5;
  if (v4 || v9)
  {
    [(CloudXPCService *)self setAccountAvailable:v5];
    unsigned __int8 v10 = [(CloudXPCService *)self deviceManager];
    BOOL v11 = [v10 cloudAccountInfo];

    if (v11)
    {
      int v12 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v26[0] = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cloud Account Info: %{private}@", buf, 0xCu);
      }

      v23[0] = @"kSignInStatus";
      id v13 = +[NSNumber numberWithBool:[(CloudXPCService *)self accountAvailable]];
      v23[1] = @"kSignInAppleID";
      v24[0] = v13;
      uint64_t v14 = [v11 loginID];
      int v15 = (void *)v14;
      CFStringRef v16 = &stru_10023D730;
      if (v14) {
        CFStringRef v16 = (const __CFString *)v14;
      }
      v24[1] = v16;
      __int16 v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      [(CloudXPCService *)self sendCloudKitMsg:@"SignInStatusChanged" args:v17];
    }
    else
    {
      CFStringRef v21 = @"kSignInStatus";
      id v13 = +[NSNumber numberWithBool:[(CloudXPCService *)self accountAvailable]];
      v22 = v13;
      int v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [(CloudXPCService *)self sendCloudKitMsg:@"SignInStatusChanged" args:v15];
    }

    if (v9 && v5)
    {
      if ([(CloudXPCService *)self manateeZoneUpgraded])
      {
        unsigned __int8 v18 = +[MPCloudKit sharedInstance];
        [v18 markLegacyNonManateeContainerMigrated];
      }
    }
  }
}

- (void)hmDeviceCloudRecordsRemovedWithRecords:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "hmDeviceCloudRecordsRemovedWithRecords: %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unsigned __int8 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) hmDeviceCloudRecordInfo:(void)v13];
        [v5 addObject:v11];

        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  int v12 = +[BTUserCloudServicesDaemon sharedBTServicesDaemon];
  [v12 reportHMDeviceCloudRecordInfosRemoved:v5];
}

- (void)hmDeviceCloudRecordsUpdatedWithRecords:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "hmDeviceCloudRecordsUpdatedWithRecords: %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unsigned __int8 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) hmDeviceCloudRecordInfo:v13];
        [v5 addObject:v11];

        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  int v12 = +[BTUserCloudServicesDaemon sharedBTServicesDaemon];
  [v12 reportHMDeviceCloudRecordInfosUpdated:v5];
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remove connection: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CloudXPCService *)self clients];
  [v6 removeObject:v4];
}

- (BOOL)manateeZoneUpgraded
{
  id v2 = [(CloudXPCService *)self readUserPreference:@"MagicCloudPairingManateeUpgradedAccount"];

  if (v2)
  {
    id v3 = sub_10006CA04("MagicPairing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee: Master zone has been upgraded. Dont generate keys", v5, 2u);
    }
  }
  return v2 != 0;
}

- (id)readUserPreference:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  return v3;
}

- (void)handleConnection:(id)a3 XPCMessage:(id)a4 userID:(unsigned int)a5 processID:(int)a6
{
  id v8 = a3;
  id v9 = a4;
  xpc_type_t type = xpc_get_type(v9);
  BOOL v11 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received _handleXPCMessage", (uint8_t *)buf, 2u);
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v9, "kMsgId");
    long long v13 = sub_10006CA04("XPC");
    long long v14 = v13;
    if (!string)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1001B856C();
      }
      goto LABEL_56;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 136315138;
      *(void *)((char *)buf + 4) = string;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "received msg: %s", (uint8_t *)buf, 0xCu);
    }

    long long v15 = xpc_dictionary_get_value(v9, "kMsgArgs");
    long long v14 = v15;
    if (v15) {
      xpc_get_type(v15);
    }
    if (!strcmp(string, "MasterKeysAvailable")) {
      goto LABEL_56;
    }
    if (!strcmp(string, "Start"))
    {
      id v28 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received Start", (uint8_t *)buf, 2u);
      }

      if ([(CloudXPCService *)self manateeZoneUpgraded]) {
        v29 = MPCloudKit_Manatee;
      }
      else {
        v29 = MPCloudKit;
      }
      BOOL v30 = [(__objc2_class *)v29 sharedInstance];
      [v30 getAccountStatus];
      goto LABEL_49;
    }
    if (!strcmp(string, "DeviceInfoAvailable") || !strcmp(string, "OnlineStatusChanged")) {
      goto LABEL_56;
    }
    if (!strcmp(string, "SignInStatusChanged"))
    {
      [(CloudXPCService *)self beginTransaction:@"SignInStatusChanged"];
      if ([(CloudXPCService *)self manateeZoneUpgraded])
      {
        v31 = +[MPCloudKit_Manatee sharedInstance];
        v32 = v31;
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_100087F60;
        v128[3] = &unk_100235588;
        v128[4] = self;
        v33 = v128;
      }
      else
      {
        v31 = +[MPCloudKit sharedInstance];
        v32 = v31;
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_100087EBC;
        v129[3] = &unk_100235588;
        v129[4] = self;
        v33 = v129;
      }
      [v31 fetchAccountStatusWithCompletion:v33];
      goto LABEL_55;
    }
    if (!strcmp(string, "getMasterKey"))
    {
      v32 = [(CloudXPCService *)self deviceManager];
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472;
      v127[2] = sub_10008801C;
      v127[3] = &unk_1002355B0;
      v127[4] = self;
      [v32 fetchAccountMagicKeysBlobWithCompletion:v127];
      goto LABEL_55;
    }
    if (!strcmp(string, "getAccessoryKey"))
    {
      unsigned __int8 v34 = [(CloudXPCService *)self manateeZoneUpgraded];
      v35 = sub_10006CA04("XPC");
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Manatee getAccessoryKey", (uint8_t *)buf, 2u);
        }
        id v37 = &off_100231B20;
      }
      else
      {
        if (v36)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "getAccessoryKey", (uint8_t *)buf, 2u);
        }
        id v37 = off_100231B18;
      }

      v42 = [(__objc2_class *)*v37 sharedInstance];
      [v42 fetchAccessoryKeyBlob:0];

      BOOL v30 = [(CloudXPCService *)self deviceManager];
      [v30 fetchCached];
      goto LABEL_49;
    }
    if (!strcmp(string, "getSignInStatus"))
    {
      unsigned __int8 v38 = [(CloudXPCService *)self manateeZoneUpgraded];
      int v39 = sub_10006CA04("XPC");
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v38)
      {
        if (v40)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Manatee getSignInStatus", (uint8_t *)buf, 2u);
        }

        unsigned __int8 v41 = MPCloudKit_Manatee;
      }
      else
      {
        if (v40)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "getSignInStatus", (uint8_t *)buf, 2u);
        }

        unsigned __int8 v41 = MPCloudKit;
      }
      BOOL v30 = [(__objc2_class *)v41 sharedInstance];
      [v30 forceAccountStatus];
      goto LABEL_49;
    }
    if (!strcmp(string, "getOnlineStatus"))
    {
LABEL_56:

      goto LABEL_57;
    }
    if (strcmp(string, "writeMasterKey"))
    {
      if (strcmp(string, "writeAccessoryKey"))
      {
        if (!strcmp(string, "deleteAllAccessories"))
        {
          unsigned __int8 v56 = [(CloudXPCService *)self manateeZoneUpgraded];
          v57 = sub_10006CA04("XPC");
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          if (v56)
          {
            if (v58)
            {
              LOWORD(buf[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Manatee deleteAllAccessories", (uint8_t *)buf, 2u);
            }

            v59 = MPCloudKit_Manatee;
          }
          else
          {
            if (v58)
            {
              LOWORD(buf[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "deleteAllAccessories", (uint8_t *)buf, 2u);
            }

            v59 = MPCloudKit;
          }
          BOOL v30 = [(__objc2_class *)v59 sharedInstance];
          [v30 updateCloudKitAccessoryZone:0 delete:1];
          goto LABEL_49;
        }
        if (!strcmp(string, "checkIn"))
        {
          if (!v14) {
            goto LABEL_56;
          }
          BOOL v30 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
          v45 = [v30 objectForKey:@"kCheckInVersion"];
          v61 = sub_10006CA04("XPC");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0]) = 138412290;
            *(void *)((char *)buf + 4) = v45;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "received checkIn message version: %@", (uint8_t *)buf, 0xCu);
          }
        }
        else
        {
          if (!strcmp(string, "manateeZoneAvailabe"))
          {
            BOOL v30 = +[MPCloudKit_Manatee sharedInstance];
            [v30 manateeZoneAvailable];
            goto LABEL_49;
          }
          if (!strcmp(string, "deleteOldContainer"))
          {
            BOOL v30 = +[MPCloudKit sharedInstance];
            [v30 markLegacyNonManateeContainerMigrated];
            goto LABEL_49;
          }
          if (!strcmp(string, "nukeOldContainer") && IsAppleInternalBuild()
            || !strcmp(string, "resetOldContainer"))
          {
            BOOL v30 = +[MPCloudKit sharedInstance];
            [v30 resetOldZones];
            goto LABEL_49;
          }
          if (!strcmp(string, "upgradeToManatee"))
          {
            BOOL v30 = +[MPCloudKit sharedInstance];
            [v30 upgradeLegacyNonManateeContainerToManatee];
            goto LABEL_49;
          }
          if (!strcmp(string, "CachedLocalIDSIdentifiers"))
          {
            if (v14)
            {
              v65 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
              v66 = [v65 objectForKey:@"kIDSIdentifiers"];
              if (v65
                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                && v66
                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v67 = sub_10006CA04("XPC");
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(void *)((char *)buf + 4) = v65;
                  _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Update CachedLocalIDSIdentifiers: %@", (uint8_t *)buf, 0xCu);
                }

                v68 = +[CBIDSManager sharedInstance];
                [v68 xpcUpdateCloudPairings:v66];
              }
              else
              {
                v68 = sub_10006CA04("XPC");
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                  sub_1001B85AC();
                }
              }
            }
            goto LABEL_56;
          }
          if (strcmp(string, "cloudpairingRetry"))
          {
            if (!strcmp(string, "sendCloudKitPush"))
            {
              BOOL v30 = +[CBIDSManager sharedInstance];
              [v30 sendCloudKitPush];
              goto LABEL_49;
            }
            if (!strcmp(string, "printDebug"))
            {
              v71 = +[CloudXPCService sharedInstance];
              v72 = [v71 deviceManager];
              v73 = [v72 printDebug];
              v74 = +[CBIDSManager sharedInstance];
              v75 = [v74 statedumpAndRecordDailyMetric];
              uint64_t v114 = +[NSString stringWithFormat:@"%@\n%@", v73, v75];

              v76 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138412290;
                *(void *)((char *)buf + 4) = v114;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Statedump:\n%@", (uint8_t *)buf, 0xCu);
              }

              if (v114)
              {
                CFStringRef v130 = @"printDebug";
                uint64_t v131 = v114;
                v77 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
                sub_10008820C(v9, v77);
              }
              else
              {
                sub_10008820C(v9, &off_1002445C0);
              }
              v86 = (void *)v114;
              goto LABEL_155;
            }
            if (!strcmp(string, "nukeCloud"))
            {
              v78 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf[0]) = 0;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "nuking cloud", (uint8_t *)buf, 2u);
              }

              v32 = (void *)_CFXPCCreateCFObjectFromXPCObject();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v79 = [v32 objectForKeyedSubscript:@"nuke"];
                unsigned int v80 = [v79 isEqualToString:@"nukeMe"];

                if (v80)
                {
                  v81 = +[MPCloudKit sharedInstance];
                  [v81 resetOldZones];

                  v82 = [(CloudXPCService *)self deviceManager];
                  v125[0] = _NSConcreteStackBlock;
                  v125[1] = 3221225472;
                  v125[2] = sub_1000882BC;
                  v125[3] = &unk_100232738;
                  id v126 = v9;
                  [v82 resetCloudDataWithCompletion:v125];
                }
              }
              goto LABEL_55;
            }
            id v16 = +[XPCMessages fetchDeviceList];
            int v17 = strcmp(string, (const char *)[v16 UTF8String]);

            if (!v17)
            {
              v84 = +[CloudXPCService sharedInstance];
              v85 = [v84 deviceManager];
              v123[0] = _NSConcreteStackBlock;
              v123[1] = 3221225472;
              v123[2] = sub_1000883C8;
              v123[3] = &unk_1002355D8;
              id v124 = v9;
              [v85 fetchDeviceRecordsWithCompletion:v123];

              v86 = v124;
              goto LABEL_155;
            }
            id v18 = +[XPCMessages nicknameDevice];
            int v19 = strcmp(string, (const char *)[v18 UTF8String]);

            if (v19)
            {
              id v20 = +[XPCMessages removeDeviceNickname];
              int v21 = strcmp(string, (const char *)[v20 UTF8String]);

              if (v21)
              {
                id v22 = +[XPCMessages resetCachedData];
                int v23 = strcmp(string, (const char *)[v22 UTF8String]);

                if (v23)
                {
                  id v24 = +[XPCMessages fetchNicknameDevice];
                  int v25 = strcmp(string, (const char *)[v24 UTF8String]);

                  if (v25)
                  {
                    if (!strcmp(string, "headTrackingAvailable"))
                    {
                      [(CloudXPCService *)self axHeadTrackingSettingChanged];
                    }
                    else
                    {
                      int v26 = xpc_copy_description(v9);
                      long long v27 = sub_10006CA04("XPC");
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                      {
                        LODWORD(buf[0]) = 136315138;
                        *(void *)((char *)buf + 4) = v26;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ignoring unhandled incoming XPC message: %s", (uint8_t *)buf, 0xCu);
                      }

                      free(v26);
                    }
                    goto LABEL_56;
                  }
                  BOOL v30 = (void *)_CFXPCCreateCFObjectFromXPCObject();
                  if (v30)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v103 = +[XPCArguments CloudDeviceAddress];
                      uint64_t v104 = [v30 objectForKeyedSubscript:v103];
                      if (v104)
                      {
                        v105 = (void *)v104;
                        v106 = +[XPCArguments CloudDeviceAddress];
                        v107 = [v30 objectForKeyedSubscript:v106];
                        objc_opt_class();
                        LODWORD(v114) = objc_opt_isKindOfClass();

                        if (v114)
                        {
                          v108 = +[XPCArguments CloudDeviceAddress];
                          v45 = [v30 objectForKeyedSubscript:v108];

                          v109 = sub_10006CA04("XPC");
                          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                          {
                            LODWORD(buf[0]) = 138412290;
                            *(void *)((char *)buf + 4) = v45;
                            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Fetch Cloud Data for device: %@", (uint8_t *)buf, 0xCu);
                          }

                          v110 = +[CloudXPCService sharedInstance];
                          v111 = [v110 deviceManager];
                          v115[0] = _NSConcreteStackBlock;
                          v115[1] = 3221225472;
                          v115[2] = sub_100088744;
                          v115[3] = &unk_100235600;
                          id v116 = v9;
                          [v111 fetchDeviceWithAddress:v45 completion:v115];

                          goto LABEL_102;
                        }
                      }
                      else
                      {
                      }
                    }
                  }
                  v113 = sub_10006CA04("XPC");
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG)) {
                    sub_1001B8740();
                  }

                  sub_10008820C(v9, &__NSDictionary0__struct);
                  goto LABEL_49;
                }
                v100 = sub_10006CA04("XPC");
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf[0]) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Reset Cached Data XPC message", (uint8_t *)buf, 2u);
                }

                v101 = +[CloudXPCService sharedInstance];
                v102 = [v101 deviceManager];
                v117[0] = _NSConcreteStackBlock;
                v117[1] = 3221225472;
                v117[2] = sub_100088664;
                v117[3] = &unk_100232738;
                id v118 = v9;
                [v102 resetCachedDataWithCompletion:v117];

                v86 = v118;
LABEL_155:

                goto LABEL_56;
              }
              v32 = (void *)_CFXPCCreateCFObjectFromXPCObject();
              v96 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138477827;
                *(void *)((char *)buf + 4) = v32;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Remove nickname device incoming XPC message: %{private}@", (uint8_t *)buf, 0xCu);
              }

              if ([(CloudXPCService *)self accountAvailable])
              {
                if (v32)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v88 = [v32 objectForKey:@"bluetoothAddress"];
                    v89 = [v32 objectForKey:@"nickname"];
                    if (v88)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (v89)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v90 = [objc_alloc((Class)BTCloudDevice) initWithBluetoothAddress:v88];
                            [v90 setNickname:v89];
                            v97 = +[CloudXPCService sharedInstance];
                            v98 = [v97 deviceManager];
                            v119[0] = _NSConcreteStackBlock;
                            v119[1] = 3221225472;
                            v119[2] = sub_100088584;
                            v119[3] = &unk_100232738;
                            id v120 = v9;
                            [v98 removeDeviceWithRecord:v90 completion:v119];

                            v93 = v120;
                            goto LABEL_179;
                          }
                        }
                      }
                    }
                    v112 = &off_100244728;
                    goto LABEL_197;
                  }
                }
              }
              v99 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
                sub_1001B86C4(self);
              }

              v95 = &off_100244750;
            }
            else
            {
              v32 = (void *)_CFXPCCreateCFObjectFromXPCObject();
              v87 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138477827;
                *(void *)((char *)buf + 4) = v32;
                _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Nickname device incoming XPC message: %{private}@", (uint8_t *)buf, 0xCu);
              }

              if ([(CloudXPCService *)self accountAvailable])
              {
                if (v32)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v88 = [v32 objectForKey:@"bluetoothAddress"];
                    v89 = [v32 objectForKey:@"nickname"];
                    if (v88)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (v89)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v90 = [objc_alloc((Class)BTCloudDevice) initWithBluetoothAddress:v88];
                            [v90 setNickname:v89];
                            v91 = +[CloudXPCService sharedInstance];
                            v92 = [v91 deviceManager];
                            v121[0] = _NSConcreteStackBlock;
                            v121[1] = 3221225472;
                            v121[2] = sub_1000884A4;
                            v121[3] = &unk_100232738;
                            id v122 = v9;
                            [v92 addDeviceWithRecord:v90 completion:v121];

                            v93 = v122;
LABEL_179:

LABEL_198:
                            goto LABEL_55;
                          }
                        }
                      }
                    }
                    v112 = &off_100244688;
LABEL_197:
                    sub_10008820C(v9, v112);
                    goto LABEL_198;
                  }
                }
              }
              v94 = sub_10006CA04("XPC");
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
                sub_1001B8648(self);
              }

              v95 = &off_1002446B0;
            }
            sub_10008820C(v9, v95);
LABEL_55:

            goto LABEL_56;
          }
          if (!v14) {
            goto LABEL_56;
          }
          memset(buf, 0, sizeof(buf));
          xpc_connection_get_audit_token();
          uint64_t v69 = xpc_copy_code_signing_identity_for_token();
          if (v69)
          {
            v70 = (void *)v69;
            BOOL v30 = +[NSString stringWithUTF8String:v69];
            free(v70);
          }
          else
          {
            BOOL v30 = 0;
          }
          v45 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          v83 = sub_10006CA04("XPC");
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v132 = 138412546;
            v133 = v30;
            __int16 v134 = 2112;
            v135 = v45;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "cloudpairingRetry incoming (%@) XPC message: %@", v132, 0x16u);
          }

          if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v61 = +[CBIDSManager sharedInstance];
            [v61 sendRePairRequest:v45 forBundleID:v30];
          }
          else
          {
            v61 = sub_10006CA04("XPC");
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              sub_1001B8614();
            }
          }
        }
LABEL_101:

LABEL_102:
        goto LABEL_49;
      }
      if (!v14) {
        goto LABEL_56;
      }
      unsigned __int8 v48 = [(CloudXPCService *)self manateeZoneUpgraded];
      BOOL v30 = xpc_dictionary_get_value(v14, "kDeviceInfoBlob");
      xpc_data_get_length(v30);
      __chkstk_darwin();
      v50 = (char *)&v115[-1] - v49;
      size_t length = xpc_data_get_length(v30);
      size_t bytes = xpc_data_get_bytes(v30, v50, 0, length);
      if (v48)
      {
        if (!bytes) {
          goto LABEL_49;
        }
        int v53 = +[NSData dataWithBytes:v50 length:xpc_data_get_length(v30)];
        v54 = sub_10006CA04("XPC");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v53;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Manatee Accessory blob %@", (uint8_t *)buf, 0xCu);
        }

        if (v53)
        {
          CFStringRef v55 = MPCloudKit_Manatee;
LABEL_108:
          v63 = [(__objc2_class *)v55 sharedInstance];
          [v63 updateCloudKitAccessoryZone:v53 delete:0];
        }
      }
      else
      {
        if (!bytes) {
          goto LABEL_49;
        }
        int v53 = +[NSData dataWithBytes:v50 length:xpc_data_get_length(v30)];
        v62 = sub_10006CA04("XPC");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v53;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, " Accessory blob %@", (uint8_t *)buf, 0xCu);
        }

        if (v53)
        {
          CFStringRef v55 = MPCloudKit;
          goto LABEL_108;
        }
      }

      goto LABEL_49;
    }
    if (!v14) {
      goto LABEL_56;
    }
    unsigned __int8 v43 = [(CloudXPCService *)self manateeZoneUpgraded];
    v44 = xpc_dictionary_get_value(v14, "kMasterKeyBlob");
    BOOL v30 = v44;
    if (v43)
    {
      if (xpc_data_get_bytes(v44, buf, 0, 0x21uLL))
      {
        v45 = +[NSData dataWithBytes:buf length:xpc_data_get_length(v30)];
        v46 = sub_10006CA04("XPC");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v132 = 138412290;
          v133 = v45;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Manatee Data blob %@", v132, 0xCu);
        }

        if (!v45) {
          goto LABEL_102;
        }
        v47 = MPCloudKit_Manatee;
        goto LABEL_97;
      }
    }
    else if (xpc_data_get_bytes(v44, buf, 0, 0x21uLL))
    {
      v45 = +[NSData dataWithBytes:buf length:xpc_data_get_length(v30)];
      v60 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v132 = 138412290;
        v133 = v45;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, " Data blob %@", v132, 0xCu);
      }

      if (!v45) {
        goto LABEL_102;
      }
      v47 = MPCloudKit;
LABEL_97:
      v61 = [(__objc2_class *)v47 sharedInstance];
      [v61 updateCloudKitBlobZone:v45];
      goto LABEL_101;
    }
LABEL_49:

    goto LABEL_56;
  }
LABEL_57:
}

- (id)transactionIdentifierForActionIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", @"com.apple.bluetooth.user.transaction", a3];
}

- (void)beginTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CloudXPCService *)self transactionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000889D0;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CloudXPCService *)self transactionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088C6C;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (OS_xpc_object)xpcServer
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40, 1);
}

- (void)setXpcServer:(id)a3
{
}

- (BTXPCConnection)serverConnection
{
  return (BTXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServerConnection:(id)a3
{
}

- (OS_xpc_object)cloudKitConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudKitConnection:(id)a3
{
}

- (_TtC15audioaccessoryd13DeviceManager)deviceManager
{
  return (_TtC15audioaccessoryd13DeviceManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceManager:(id)a3
{
}

- (BTNetworkMonitor)networkMonitor
{
  return (BTNetworkMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (NSMutableDictionary)activeTransactions
{
  return self->_activeTransactions;
}

- (void)setActiveTransactions:(id)a3
{
}

- (NSUserDefaults)bluetoothDefaults
{
  return self->_bluetoothDefaults;
}

- (void)setBluetoothDefaults:(id)a3
{
}

- (_TtC15audioaccessoryd16DefaultsObserver)bluetoothDefaultsObserver
{
  return self->_bluetoothDefaultsObserver;
}

- (void)setBluetoothDefaultsObserver:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (BOOL)accountAvailable
{
  return self->_accountAvailable;
}

- (void)setAccountAvailable:(BOOL)a3
{
  self->_accountAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_bluetoothDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_bluetoothDefaults, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_cloudKitConnection, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);

  objc_storeStrong((id *)&self->_sigTermSource, 0);
}

@end