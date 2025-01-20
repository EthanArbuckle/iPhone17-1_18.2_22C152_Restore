@interface NSSServer
+ (double)mirrorAirplaneSendTimeout;
+ (id)getActivePairedDeviceIDFromNanoRegistry;
+ (void)associateProtobufHandlers:(id)a3;
+ (void)setLaunchNotification:(id)a3 enabled:(BOOL)a4;
+ (void)tellRadiosPrefsToEnableAirplaneMode:(BOOL)a3;
- (BOOL)activeDeviceIsAltAccount;
- (BOOL)endBridgeLiveActivity;
- (BOOL)fileTransferInProgress;
- (BOOL)handleDarwinNotification:(id)a3;
- (BOOL)isDefaultPairedDeviceNearby;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)messageIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (BOOL)messageIdentifier:(id)a3 hasBeenDeliveredWithContext:(id)a4;
- (BOOL)mirroringAirplaneMode;
- (BOOL)scheduleTimerForIdentifier:(id)a3 requests:(id)a4 timeout:(double)a5 timeoutHandler:(id)a6 timers:(id)a7 utilityName:(id)a8;
- (BOOL)shouldSendAPMMessageToOppositeDevice:(BOOL)a3;
- (IDSService)idsFileTransferService;
- (IDSService)idsService;
- (NSMutableArray)connectionHandlers;
- (NSMutableDictionary)airplaneModeDeliveryTimers;
- (NSMutableDictionary)airplaneModeEnabledTracking;
- (NSMutableDictionary)logTranferIdentifiers;
- (NSSServer)init;
- (NSUUID)activeDeviceID;
- (NSXPCListener)listener;
- (OS_dispatch_queue)airplaneModeQueue;
- (OS_dispatch_queue)connectionHandlersQueue;
- (OS_dispatch_queue)idsQueue;
- (OS_dispatch_source)vmPressureHandler;
- (id)acceptConnection:(id)a3;
- (id)getActivePairedDevice;
- (id)initTestInstance;
- (id)linkFileForViewing:(id)a3 metadata:(id)a4 withError:(id *)a5;
- (id)sendLogFileAtUrl:(id)a3 toDevice:(id)a4 withOptions:(id)a5;
- (id)sendMessage:(id)a3 identifier:(id *)a4 sendTimeout:(double)a5 wantsAcknowledgement:(BOOL)a6 queueOneIdentifier:(id)a7 overBluetoothOnly:(BOOL)a8;
- (id)sendProtobuf:(id)a3 options:(id)a4 identifier:(id *)a5;
- (id)sendRequest:(id)a3 expectsResponse:(BOOL)a4 replyBlock:(id)a5 replyDictionary:(id)a6 sendTimeout:(double)a7 wantsAcknowledgement:(BOOL)a8 bypassDuet:(BOOL)a9;
- (id)sendResponse:(id)a3 forRequest:(id)a4 identifier:(id *)a5 bypassDuet:(BOOL)a6;
- (id)systemBuildVersion;
- (void)_resetIfTheActivePairedDeviceChanges;
- (void)askRemoteDeviceToPasscodeLockWithCompletionHandler:(id)a3;
- (void)cancelOrphanedFileTransfer:(id)a3;
- (void)cancelTimerForIdentifier:(id)a3 timers:(id)a4 utilityName:(id)a5;
- (void)connectionHandlerLostConnection:(id)a3;
- (void)dealloc;
- (void)displayAirplaneModeMirroringUserEducationAlertIfNeeded:(BOOL)a3;
- (void)earlyIvarInitialzation;
- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4;
- (void)failedToMirrorAirplaneMode:(BOOL)a3;
- (void)handleAirplaneModeMsg:(id)a3;
- (void)handleMemoryPressureEvent;
- (void)handleNotifyRemoteDeviceOfUsageAfterSetupRequestMsg:(id)a3;
- (void)handleRemotePasscodeLockRequestMsg:(id)a3;
- (void)initializeIDS;
- (void)listenToNanoRegistryAndResetIfTheActivePairedDeviceChanges;
- (void)notifyRemoteDeviceOfUsageAfterSetup:(id)a3;
- (void)resetIfTheActivePairedDeviceChanges;
- (void)sendFileTransfer:(id)a3 progress:(unint64_t)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setActiveDeviceID:(id)a3;
- (void)setAirplaneModeDeliveryTimers:(id)a3;
- (void)setAirplaneModeEnabledTracking:(id)a3;
- (void)setAirplaneModeQueue:(id)a3;
- (void)setConnectionHandlers:(id)a3;
- (void)setConnectionHandlersQueue:(id)a3;
- (void)setFileTransferInProgress:(BOOL)a3;
- (void)setIdsQueue:(id)a3;
- (void)setListener:(id)a3;
- (void)setLogTranferIdentifiers:(id)a3;
- (void)setVmPressureHandler:(id)a3;
@end

@implementation NSSServer

+ (void)setLaunchNotification:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "Notification", (const char *)[v5 UTF8String]);
  }
  else
  {
    xpc_object_t v6 = 0;
  }
  v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"disabling";
    if (v4) {
      CFStringRef v8 = @"enabling";
    }
    int v10 = 138412546;
    CFStringRef v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setLaunchNotification: %@ launch notification %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = v5;
  [v9 UTF8String];
  xpc_set_event();
}

+ (id)getActivePairedDeviceIDFromNanoRegistry
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  BOOL v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  xpc_object_t v6 = [v5 valueForProperty:NRDevicePropertyPairingID];

  return v6;
}

- (BOOL)activeDeviceIsAltAccount
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  BOOL v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  xpc_object_t v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  LOBYTE(v3) = [v6 BOOLValue];

  return (char)v3;
}

- (void)listenToNanoRegistryAndResetIfTheActivePairedDeviceChanges
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"resetIfTheActivePairedDeviceChanges" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"resetIfTheActivePairedDeviceChanges" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

  self->_activeDeviceID = [(id)objc_opt_class() getActivePairedDeviceIDFromNanoRegistry];
  _objc_release_x1();
}

- (void)resetIfTheActivePairedDeviceChanges
{
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A3FC;
  block[3] = &unk_100034AE0;
  block[4] = self;
  dispatch_async(idsQueue, block);
}

- (void)_resetIfTheActivePairedDeviceChanges
{
  v3 = [(id)objc_opt_class() getActivePairedDeviceIDFromNanoRegistry];
  if (self->_activeDeviceID != v3)
  {
    BOOL v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      activeDeviceID = self->_activeDeviceID;
      int v6 = 138543618;
      v7 = activeDeviceID;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting because the active paired device changed from %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)&self->_activeDeviceID, v3);
    [(NSSServer *)self resetBecauseTheActivePairedDeviceChanged];
  }
}

- (NSSServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)NSSServer;
  v2 = [(NSSServer *)&v22 init];
  if (v2)
  {
    v3 = NSSLogForType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching; \"NanoSystemSettingsDaemon-353\" \"9362\"",
        buf,
        2u);
    }

    [(NSSServer *)v2 listenToNanoRegistryAndResetIfTheActivePairedDeviceChanges];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001A738, @"com.apple.language.changed", 0, (CFNotificationSuspensionBehavior)0);
    [(NSSServer *)v2 earlyIvarInitialzation];
    id v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanosystemsettings"];
    listener = v2->_listener;
    v2->_listener = v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    [(NSSServer *)v2 initializeIDS];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001A7A8;
    handler[3] = &unk_100035050;
    v7 = v2;
    v20 = v7;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
    __int16 v8 = dispatch_get_global_queue(9, 0);
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 6uLL, v8);
    vmPressureHandler = v7->_vmPressureHandler;
    v7->_vmPressureHandler = (OS_dispatch_source *)v9;

    CFStringRef v11 = v7->_vmPressureHandler;
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10001A958;
    v17 = &unk_100034AE0;
    __int16 v12 = v7;
    v18 = v12;
    dispatch_source_set_event_handler(v11, &v14);
    -[NSSServer setFileTransferInProgress:](v12, "setFileTransferInProgress:", 0, v14, v15, v16, v17);
  }
  return v2;
}

- (id)initTestInstance
{
  v3.receiver = self;
  v3.super_class = (Class)NSSServer;
  return [(NSSServer *)&v3 init];
}

- (void)earlyIvarInitialzation
{
  objc_super v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  connectionHandlers = self->_connectionHandlers;
  self->_connectionHandlers = v3;

  id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nanosystemsettings.connectionHandlers", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  connectionHandlersQueue = self->_connectionHandlersQueue;
  self->_connectionHandlersQueue = v5;

  v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nanosystemsettings.ids", 0);
  idsQueue = self->_idsQueue;
  self->_idsQueue = v7;

  dispatch_source_t v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nanosystemsettings.airplaneMode", 0);
  airplaneModeQueue = self->_airplaneModeQueue;
  self->_airplaneModeQueue = v9;

  CFStringRef v11 = (NSMutableDictionary *)objc_opt_new();
  airplaneModeDeliveryTimers = self->_airplaneModeDeliveryTimers;
  self->_airplaneModeDeliveryTimers = v11;

  self->_logTranferIdentifiers = (NSMutableDictionary *)objc_opt_new();
  _objc_release_x1();
}

- (BOOL)handleDarwinNotification:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSSServer;
  [(NSSServer *)&v2 dealloc];
}

- (void)handleMemoryPressureEvent
{
  objc_super v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_100028283, v3, 2u);
  }
}

- (id)systemBuildVersion
{
  if (qword_10003E7B0 != -1) {
    dispatch_once(&qword_10003E7B0, &stru_100035070);
  }
  objc_super v2 = (void *)qword_10003E7B8;
  return v2;
}

- (void)initializeIDS
{
  id v3 = [(NSSServer *)self idsService];
  id v4 = [(NSSServer *)self idsFileTransferService];
}

+ (void)associateProtobufHandlers:(id)a3
{
  id v3 = a3;
  [v3 setProtobufAction:"handleAirplaneModeMsg:" forIncomingRequestsOfType:0];
  [v3 setProtobufAction:"handleRemotePasscodeLockRequestMsg:" forIncomingRequestsOfType:41];
  [v3 setProtobufAction:"handleNotifyRemoteDeviceOfUsageAfterSetupRequestMsg:" forIncomingRequestsOfType:42];
}

- (IDSService)idsService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ADA4;
  block[3] = &unk_100034AE0;
  block[4] = self;
  if (qword_10003E7C8 != -1) {
    dispatch_once(&qword_10003E7C8, block);
  }
  return (IDSService *)(id)qword_10003E7C0;
}

- (IDSService)idsFileTransferService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF60;
  block[3] = &unk_100034AE0;
  block[4] = self;
  if (qword_10003E7D8 != -1) {
    dispatch_once(&qword_10003E7D8, block);
  }
  objc_super v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = qword_10003E7D0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DEBUG: returning tranfer service %@", buf, 0xCu);
  }

  return (IDSService *)(id)qword_10003E7D0;
}

- (BOOL)isDefaultPairedDeviceNearby
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v2 = [(NSSServer *)self idsService];
  id v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice])
        {
          LODWORD(v4) = [v7 isNearby];
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  __int16 v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = (int)v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dpd isNearby: %d", buf, 8u);
  }

  return (char)v4;
}

- (id)linkFileForViewing:(id)a3 metadata:(id)a4 withError:(id *)a5
{
  v7 = (__CFString *)a3;
  id v8 = a4;
  dispatch_source_t v9 = +[NSFileManager defaultManager];
  v45 = v7;
  long long v10 = [(__CFString *)v7 relativePath];
  v44 = [v10 lastPathComponent];
  long long v11 = objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:");
  id v50 = 0;
  long long v12 = [v9 contentsOfDirectoryAtPath:v11 error:&v50];
  CFStringRef v13 = (const __CFString *)v50;
  v14 = [v12 firstObject];
  v43 = v11;
  v46 = [v11 stringByAppendingPathComponent:v14];

  if (v13)
  {
    int v15 = NSSLogForType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v52 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Couldn't get files from IDS's temp dir with error: %@", buf, 0xCu);
    }
  }
  v16 = [(NSSServer *)self getActivePairedDevice];
  v17 = [v16 valueForProperty:NRDevicePropertyPairingID];

  v18 = NSSLogForType();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v52 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "pairing id: %@", buf, 0xCu);
  }

  v19 = [(__CFString *)v17 UUIDString];
  v20 = [@"/var/mobile/tmp/BridgeDiagnosticLogs/" stringByAppendingPathComponent:v19];

  if (([v9 fileExistsAtPath:@"/var/mobile/tmp/BridgeDiagnosticLogs/"] & 1) == 0)
  {
    id v49 = 0;
    [v9 createDirectoryAtPath:@"/var/mobile/tmp/BridgeDiagnosticLogs/" withIntermediateDirectories:0 attributes:0 error:&v49];
    id v21 = v49;
    if (v21)
    {
      objc_super v22 = v21;
      v23 = NSSLogForType();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v52 = @"/var/mobile/tmp/BridgeDiagnosticLogs/";
        __int16 v53 = 2112;
        v54 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to create %@ directory with error: %@", buf, 0x16u);
      }
    }
  }
  if (([v9 fileExistsAtPath:v20] & 1) == 0)
  {
    id v48 = 0;
    [v9 createDirectoryAtPath:v20 withIntermediateDirectories:0 attributes:0 error:&v48];
    id v24 = v48;
    if (v24)
    {
      v25 = v24;
      v26 = NSSLogForType();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v52 = v20;
        __int16 v53 = 2112;
        v54 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to create %@ directory with error: %@", buf, 0x16u);
      }
    }
  }
  v27 = (__CFString *)v13;
  v28 = [v8 objectForKey:@"originalFilePath"];
  v29 = [v28 lastPathComponent];

  uint64_t v30 = [(__CFString *)v20 stringByAppendingPathComponent:v29];
  v31 = (void *)v30;
  if (!v46 || !v30)
  {
    v32 = v10;
    v38 = NSSLogForType();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v52 = v46;
      __int16 v53 = 2112;
      v54 = v31;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Can't copy file; transferred file path and/or destination path is nil\nTransferred File: %@\nNew Path: %@",
        buf,
        0x16u);
    }
    v33 = v8;

    if (a5)
    {
      +[NSError errorWithDomain:@"NSSErrorDomain" code:12 userInfo:0];
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v32 = v10;
  v33 = v8;
  id v47 = 0;
  unsigned int v34 = [v9 moveItemAtPath:v46 toPath:v30 error:&v47];
  id v35 = v47;
  v36 = v35;
  if (!v34)
  {
    if (a5) {
      *a5 = v35;
    }
    v39 = NSSLogForType();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v52 = v45;
      __int16 v53 = 2112;
      v54 = v31;
      __int16 v55 = 2112;
      v56 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Failed to copy file from %@ to %@ with error: %@", buf, 0x20u);
    }

LABEL_32:
    v36 = 0;
    goto LABEL_33;
  }
  v37 = NSSLogForType();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v52 = v45;
    __int16 v53 = 2112;
    v54 = v31;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Copied file from %@ to %@", buf, 0x16u);
  }

LABEL_33:
  v40 = +[NSURL URLWithString:v31];

  return v40;
}

- (id)getActivePairedDevice
{
  objc_super v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)sendMessage:(id)a3 identifier:(id *)a4 sendTimeout:(double)a5 wantsAcknowledgement:(BOOL)a6 queueOneIdentifier:(id)a7 overBluetoothOnly:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  v22[0] = IDSSendMessageOptionTimeoutKey;
  id v14 = a7;
  id v15 = a3;
  v16 = +[NSNumber numberWithDouble:a5];
  v23[0] = v16;
  v22[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v17 = +[NSNumber numberWithBool:v9];
  v23[1] = v17;
  v23[2] = v14;
  v22[2] = IDSSendMessageOptionQueueOneIdentifierKey;
  v22[3] = IDSSendMessageOptionRequireBluetoothKey;
  v18 = +[NSNumber numberWithBool:v8];
  v23[3] = v18;
  v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  v20 = [(NSSServer *)self sendProtobuf:v15 options:v19 identifier:a4];

  return v20;
}

- (id)sendRequest:(id)a3 expectsResponse:(BOOL)a4 replyBlock:(id)a5 replyDictionary:(id)a6 sendTimeout:(double)a7 wantsAcknowledgement:(BOOL)a8 bypassDuet:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  id v15 = a5;
  id v16 = a6;
  v27[0] = &__kCFBooleanTrue;
  v26[0] = IDSSendMessageOptionExpectsPeerResponseKey;
  v26[1] = IDSSendMessageOptionTimeoutKey;
  id v17 = a3;
  v18 = +[NSNumber numberWithDouble:a7];
  v27[1] = v18;
  v26[2] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v19 = +[NSNumber numberWithBool:v10];
  v27[2] = v19;
  v26[3] = IDSSendMessageOptionBypassDuetKey;
  v20 = +[NSNumber numberWithBool:v9];
  v27[3] = v20;
  id v21 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  id v25 = 0;
  objc_super v22 = [(NSSServer *)self sendProtobuf:v17 options:v21 identifier:&v25];

  id v23 = v25;
  if (v16 && v15 && !v22 && v23) {
    [v16 setObject:v15 forKey:v23];
  }

  return v22;
}

- (id)sendResponse:(id)a3 forRequest:(id)a4 identifier:(id *)a5 bypassDuet:(BOOL)a6
{
  BOOL v6 = a6;
  v16[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
  v16[1] = IDSSendMessageOptionBypassDuetKey;
  v17[0] = a4;
  id v10 = a4;
  id v11 = a3;
  long long v12 = +[NSNumber numberWithBool:v6];
  v17[1] = v12;
  CFStringRef v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v14 = [(NSSServer *)self sendProtobuf:v11 options:v13 identifier:a5];

  return v14;
}

- (id)sendProtobuf:(id)a3 options:(id)a4 identifier:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [(NSSServer *)self _resetIfTheActivePairedDeviceChanges];
  id v9 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
  uint64_t v10 = IDSSendMessageOptionTimeoutKey;
  id v11 = [v8 objectForKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  long long v12 = v11;
  if (!v11 || ([v11 doubleValue], v13 == 0.0))
  {
    id v14 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v9 setObject:v14 forKeyedSubscript:v10];
  }
  id v15 = [v8 objectForKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = 5;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 6;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = 26;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = 33;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = 34;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v16 = 29;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = 24;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v16 = 25;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v16 = 32;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v16 = 31;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v16 = 30;
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v16 = 35;
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            uint64_t v16 = 27;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v16 = 28;
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                uint64_t v16 = 0;
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v16 = 9;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v16 = 10;
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      uint64_t v16 = 15;
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        uint64_t v16 = 16;
                                      }
                                      else
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          uint64_t v16 = 8;
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            uint64_t v16 = 20;
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              uint64_t v16 = 21;
                                            }
                                            else
                                            {
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                uint64_t v16 = 22;
                                              }
                                              else
                                              {
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  uint64_t v16 = 23;
                                                }
                                                else
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    uint64_t v16 = 13;
                                                  }
                                                  else
                                                  {
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      uint64_t v16 = 14;
                                                    }
                                                    else
                                                    {
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        uint64_t v16 = 11;
                                                      }
                                                      else
                                                      {
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          uint64_t v16 = 12;
                                                        }
                                                        else
                                                        {
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            uint64_t v16 = 19;
                                                          }
                                                          else
                                                          {
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              uint64_t v16 = 17;
                                                            }
                                                            else
                                                            {
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                uint64_t v16 = 18;
                                                              }
                                                              else
                                                              {
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  uint64_t v16 = 7;
                                                                }
                                                                else
                                                                {
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    uint64_t v16 = 3;
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      uint64_t v16 = 4;
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        uint64_t v16 = 1;
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          uint64_t v16 = 2;
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            uint64_t v16 = 36;
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              uint64_t v16 = 37;
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                uint64_t v16 = 38;
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  uint64_t v16 = 39;
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    uint64_t v16 = 40;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      uint64_t v16 = 41;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                                                                                        abort();
                                                                                      }
                                                                                      uint64_t v16 = 42;
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v17 = v15 != 0;
  v18 = [v7 data];
  id v19 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v18 type:v16 isResponse:v17];
  v20 = [(NSSServer *)self idsService];
  id v21 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v32 = 0;
  id v33 = 0;
  [v20 sendProtobuf:v19 toDestinations:v21 priority:300 options:v8 identifier:&v33 error:&v32];
  id v22 = v33;
  id v23 = v32;

  id v24 = NSSLogForType();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (!v25) {
      goto LABEL_96;
    }
    id v26 = [v18 length];
    *(_DWORD *)buf = 134218242;
    id v35 = v26;
    __int16 v36 = 2112;
    id v37 = v23;
    v27 = "Failed to send message of length (%lu) with error: (%@); ";
  }
  else
  {
    if (!v25) {
      goto LABEL_96;
    }
    id v28 = [v18 length];
    *(_DWORD *)buf = 138412546;
    id v35 = v22;
    __int16 v36 = 2048;
    id v37 = v28;
    v27 = "sendProtobuf: success; identifier: (%@); length: (%lu)";
  }
  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
LABEL_96:

  if (a5) {
    *a5 = v22;
  }
  id v29 = v23;

  return v29;
}

- (id)sendLogFileAtUrl:(id)a3 toDevice:(id)a4 withOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_fileTransferInProgress) {
    [(NSSServer *)self setFileTransferInProgress:1];
  }
  id v11 = [(NSSServer *)self idsFileTransferService];
  long long v12 = [v8 relativePath];
  double v13 = +[NSDictionary dictionaryWithObject:v12 forKey:@"originalFilePath"];

  id v23 = 0;
  id v24 = 0;
  unsigned int v14 = [v11 sendResourceAtURL:v8 metadata:v13 toDestinations:v9 priority:300 options:v10 identifier:&v24 error:&v23];
  id v15 = v24;
  uint64_t v16 = (__CFString *)v23;
  BOOL v17 = NSSLogForType();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"failure";
    *(_DWORD *)buf = 138412802;
    if (v14) {
      CFStringRef v18 = @"success";
    }
    CFStringRef v26 = v18;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "result: %@ for file %@ with id: %@", buf, 0x20u);
  }

  if (v16)
  {
    id v19 = NSSLogForType();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "error while sending resource error: %@", buf, 0xCu);
    }
  }
  else
  {
    id v19 = [(NSSServer *)self logTranferIdentifiers];
    v20 = [v8 lastPathComponent];
    [v19 setObject:v20 forKey:v15];
  }
  id v21 = v15;

  return v21;
}

- (BOOL)scheduleTimerForIdentifier:(id)a3 requests:(id)a4 timeout:(double)a5 timeoutHandler:(id)a6 timers:(id)a7 utilityName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v30 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    CFStringRef v18 = v14;
    id v19 = [v15 objectForKey:v14];
    if (!v19)
    {
      BOOL v28 = 0;
      goto LABEL_9;
    }
    v20 = NSSLogForType();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2048;
      v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found replyBlock for identifier (%@) in container (%@): (%p)", buf, 0x20u);
    }

    id v14 = v18;
  }
  else
  {
    id v19 = 0;
  }
  id v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_idsQueue);
  dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001CBFC;
  handler[3] = &unk_100035098;
  CFStringRef v18 = v14;
  id v23 = v14;
  id v33 = v23;
  id v34 = v17;
  id v24 = v21;
  id v35 = v24;
  id v36 = v15;
  id v25 = v16;
  id v37 = v25;
  id v39 = v30;
  CFStringRef v26 = v19;
  v38 = v26;
  dispatch_source_set_event_handler(v24, handler);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v41 = sub_10001CCE4;
  v42 = sub_10001CCF4;
  __int16 v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:]");
  NSSOSTransactionCreate();
  id v43 = (id)objc_claimAutoreleasedReturnValue();

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001CCFC;
  v31[3] = &unk_1000350C0;
  v31[4] = buf;
  dispatch_source_set_cancel_handler(v24, v31);
  [v25 setObject:v24 forKey:v23];
  dispatch_resume(v24);
  _Block_object_dispose(buf, 8);

  BOOL v28 = 1;
LABEL_9:

  return v28;
}

- (void)cancelTimerForIdentifier:(id)a3 timers:(id)a4 utilityName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && v8)
  {
    id v10 = [v8 objectForKey:v7];
    if (v10)
    {
      id v11 = NSSLogForType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412802;
        id v13 = v7;
        __int16 v14 = 2112;
        id v15 = v9;
        __int16 v16 = 2048;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found timerSource for identifier (%@) in container (%@): (%p)", (uint8_t *)&v12, 0x20u);
      }

      dispatch_source_cancel(v10);
      [v8 removeObjectForKey:v7];
    }
  }
}

- (void)cancelOrphanedFileTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSSServer *)self idsFileTransferService];
  id v8 = 0;
  [v5 cancelIdentifier:v4 error:&v8];
  id v6 = v8;
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS service is tranferring a file, but it was not ordered, cancelled identifier %@ with error: %@", buf, 0x16u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7
{
  id v10 = a5;
  __int16 v11 = NSSLogForType();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [(NSSServer *)self fileTransferInProgress];
    CFStringRef v13 = @"NO";
    *(_DWORD *)v20 = 138413058;
    *(void *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2048;
    if (v12) {
      CFStringRef v13 = @"YES";
    }
    *(void *)&v20[14] = a6;
    __int16 v21 = 2048;
    int64_t v22 = a7;
    __int16 v23 = 2112;
    CFStringRef v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Delegate called for progress message %@ with sentBytes %ld and totalBytes %ld with file transfer in progress: %@", v20, 0x2Au);
  }

  __int16 v14 = [(NSSServer *)self logTranferIdentifiers];
  id v15 = [v14 objectForKey:v10];

  if (v15)
  {
    __int16 v16 = [(NSSServer *)self logTranferIdentifiers];
    id v17 = [v16 objectForKey:v10];

    if (a6 == a7)
    {
      CFStringRef v18 = [(NSSServer *)self logTranferIdentifiers];
      [v18 removeObjectForKey:v10];

      unint64_t v19 = 100;
    }
    else
    {
      unint64_t v19 = vcvtas_u32_f32((float)((float)a6 / (float)a7) * 100.0);
    }
    -[NSSServer sendFileTransfer:progress:](self, "sendFileTransfer:progress:", v17, v19, *(_OWORD *)v20);
  }
  else
  {
    [(NSSServer *)self cancelOrphanedFileTransfer:v10];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a8;
  id v15 = a6;
  __int16 v16 = NSSLogForType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v14 incomingResponseIdentifier];
    *(_DWORD *)buf = 138412802;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    BOOL v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Delegate called for incoming resource at URL file downloaded to: %@ on service: %@ with identifier: %@", buf, 0x20u);
  }
  id v22 = 0;
  CFStringRef v18 = [(NSSServer *)self linkFileForViewing:v13 metadata:v15 withError:&v22];

  id v19 = v22;
  if (v19)
  {
    v20 = NSSLogForType();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error when linking file %@ with error: %@", buf, 0x16u);
    }
  }
  __int16 v21 = [v14 incomingResponseIdentifier];
  [(NSSServer *)self handleIncomingDiagnosticLogFile:v18 withContext:v21];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = NSSLogForType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138413314;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    __int16 v21 = 2112;
    id v22 = v14;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "service: (%@), account: (%@), identifier: (%@), success: (%d), error: (%@)", (uint8_t *)&v17, 0x30u);
  }

  [(NSSServer *)self messageIdentifier:v14 didSendWithSuccess:v8 error:v15];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = NSSLogForType();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413058;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "service: (%@), account: (%@), identifier: (%@), context: (%@)", (uint8_t *)&v15, 0x2Au);
  }

  [(NSSServer *)self messageIdentifier:v12 hasBeenDeliveredWithContext:v13];
}

- (BOOL)messageIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_airplaneModeDeliveryTimers objectForKey:v8];

  if (!v10) {
    goto LABEL_12;
  }
  [(NSSServer *)self cancelTimerForIdentifier:v8 timers:self->_airplaneModeDeliveryTimers utilityName:@"airplane"];
  id v11 = [(NSMutableDictionary *)self->_airplaneModeEnabledTracking objectForKey:v8];

  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_airplaneModeEnabledTracking objectForKey:v8];
    LOBYTE(v11) = [v12 BOOLValue];

    [(NSMutableDictionary *)self->_airplaneModeEnabledTracking removeObjectForKey:v8];
  }
  if (!v9) {
    goto LABEL_11;
  }
  id v13 = [v9 domain];
  if (([v13 isEqualToString:IDSErrorDomain] & 1) == 0)
  {

    goto LABEL_11;
  }
  id v14 = [v9 code];

  if (v14 != (id)24)
  {
LABEL_11:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    __int16 v27 = sub_10001CCE4;
    BOOL v28 = sub_10001CCF4;
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[NSSServer messageIdentifier:didSendWithSuccess:error:]");
    NSSOSTransactionCreate();
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    airplaneModeQueue = self->_airplaneModeQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D830;
    block[3] = &unk_1000350E8;
    BOOL v23 = a4;
    block[4] = self;
    char v24 = (char)v11;
    id v20 = v8;
    id v21 = v9;
    p_long long buf = &buf;
    dispatch_async(airplaneModeQueue, block);

    _Block_object_dispose(&buf, 8);
    goto LABEL_12;
  }
  int v15 = NSSLogForType();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping handling of Airplane mode IDS mesasge as it got replaced (%@)", (uint8_t *)&buf, 0xCu);
  }

LABEL_12:
  return v10 != 0;
}

- (BOOL)messageIdentifier:(id)a3 hasBeenDeliveredWithContext:(id)a4
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = NSSLogForType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    id v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New connection (%p) received from process: (%d)", buf, 0x12u);
  }

  id v7 = [(NSSServer *)self acceptConnection:v5];
  connectionHandlersQueue = self->_connectionHandlersQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001DACC;
  v11[3] = &unk_100035110;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  dispatch_barrier_sync(connectionHandlersQueue, v11);

  return 1;
}

- (void)connectionHandlerLostConnection:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 connection];
    *(_DWORD *)long long buf = 134217984;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection invalidated: (%p)", buf, 0xCu);
  }
  connectionHandlersQueue = self->_connectionHandlersQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DC10;
  v9[3] = &unk_100035110;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_barrier_sync(connectionHandlersQueue, v9);
}

- (id)acceptConnection:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v4;
    LOWORD(v16) = 2048;
    *(void *)((char *)&v16 + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling Airplane Mode: (%d), completionHandler: (%p)", buf, 0x12u);
  }
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  id v9 = (NSMutableDictionary *)objc_opt_new();
  airplaneModeEnabledTracking = self->_airplaneModeEnabledTracking;
  self->_airplaneModeEnabledTracking = v9;

  *(void *)long long buf = 0;
  *(void *)&long long v16 = buf;
  *((void *)&v16 + 1) = 0x3032000000;
  __int16 v17 = sub_10001CCE4;
  id v18 = sub_10001CCF4;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[NSSServer enableAirplaneMode:completionHandler:]");
  NSSOSTransactionCreate();
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  airplaneModeQueue = self->_airplaneModeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DE24;
  block[3] = &unk_100035138;
  BOOL v14 = v4;
  block[4] = self;
  void block[5] = buf;
  dispatch_async(airplaneModeQueue, block);
  _Block_object_dispose(buf, 8);
}

- (void)askRemoteDeviceToPasscodeLockWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, BOOL, void *))a3;
  id v5 = objc_opt_new();
  id v9 = 0;
  id v6 = [(NSSServer *)self sendMessage:v5 identifier:&v9 sendTimeout:0 wantsAcknowledgement:@"remote-passcode-lock" queueOneIdentifier:0 overBluetoothOnly:10.0];
  id v7 = v9;

  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked remote device to passcode lock with send identifier: %@ and error: %@", buf, 0x16u);
  }

  v4[2](v4, v6 == 0, v6);
}

- (void)handleRemotePasscodeLockRequestMsg:(id)a3
{
  id v3 = +[MCProfileConnection sharedConnection];
  [v3 lockDeviceImmediately:1];

  BOOL v4 = NSSLogForType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handle remote device passcode lock request!", v5, 2u);
  }
}

- (void)notifyRemoteDeviceOfUsageAfterSetup:(id)a3
{
  BOOL v4 = (void (**)(id, BOOL, void *))a3;
  id v5 = objc_opt_new();
  id v9 = 0;
  id v6 = [(NSSServer *)self sendMessage:v5 identifier:&v9 sendTimeout:0 wantsAcknowledgement:@"device-in-use" queueOneIdentifier:0 overBluetoothOnly:10.0];
  id v7 = v9;

  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked remote device to notify of use: %@ and error: %@", buf, 0x16u);
  }

  v4[2](v4, v6 == 0, v6);
}

- (void)handleNotifyRemoteDeviceOfUsageAfterSetupRequestMsg:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handle notify remote device of usage after setup request!", buf, 2u);
  }

  unsigned int v6 = [(NSSServer *)self endBridgeLiveActivity];
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    unsigned int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did end Bridge Live Activity? %{BOOL}d", buf, 8u);
  }

  id v8 = objc_msgSend(v4, "context", @"device");

  id v9 = [v8 fromID];
  v15[1] = @"date";
  v16[0] = v9;
  id v10 = +[NSDate date];
  [v10 timeIntervalSince1970];
  id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[1] = v11;
  __int16 v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Bridge"];
  [v13 setObject:v12 forKey:@"COSWatchReportedUseAfterSetup"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.nanosystemsettings.WatchReportedUsedOnAfterSetup", 0, 0, 1u);
}

- (BOOL)mirroringAirplaneMode
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano"];
  id v3 = [v2 synchronize];
  char v7 = 0;
  unsigned __int8 v4 = [v2 BOOLForKey:@"mirror-airplane" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSendAPMMessageToOppositeDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSSServer *)self mirroringAirplaneMode]) {
    return 0;
  }
  BOOL v5 = [(NSSServer *)self isDefaultPairedDeviceNearby];
  if ([(NSSServer *)self activeDeviceIsAltAccount]) {
    return 0;
  }
  [(NSSServer *)self displayAirplaneModeMirroringUserEducationAlertIfNeeded:v3];
  return v5;
}

- (void)handleAirplaneModeMsg:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 context];
  unsigned int v6 = [v5 outgoingResponseIdentifier];

  char v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); outgoingResponseIdentifier: (%@)",
      buf,
      0x16u);
  }

  if ([(NSSServer *)self mirroringAirplaneMode])
  {
    id v8 = objc_opt_new();
    id v9 = objc_alloc((Class)PBDataReader);
    id v10 = [v4 data];
    id v11 = [v9 initWithData:v10];

    int v12 = NSSAirplaneModeMsgReadFrom();
    id v13 = NSSLogForType();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        unsigned int v15 = [v8 enabled];
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Airplane Mode request (%d)", buf, 8u);
      }

      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      BOOL v23 = sub_10001CCE4;
      char v24 = sub_10001CCF4;
      long long v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[NSSServer handleAirplaneModeMsg:]");
      NSSOSTransactionCreate();
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      dispatch_time_t v17 = dispatch_time(0, 1000000000);
      airplaneModeQueue = self->_airplaneModeQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001EC6C;
      block[3] = &unk_1000351B0;
      block[4] = self;
      id v20 = v8;
      id v21 = buf;
      dispatch_after(v17, airplaneModeQueue, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf", buf, 2u);
      }
    }
  }
  else
  {
    id v8 = NSSLogForType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring Airplane Mode Mirroring request since local setting is to not mirror it", buf, 2u);
    }
  }
}

+ (double)mirrorAirplaneSendTimeout
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.nanosystemsettings");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"mirror-airplane-timout", @"com.apple.nanosystemsettings", &keyExistsAndHasValidFormat);
  BOOL v3 = AppIntegerValue < 0 || keyExistsAndHasValidFormat == 0;
  double result = (double)AppIntegerValue;
  if (v3) {
    return 10.0;
  }
  return result;
}

- (void)failedToMirrorAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  +[NSSManager displayAlertFailedRemoteAirplaneMode:](NSSManager, "displayAlertFailedRemoteAirplaneMode:");
  id v4 = objc_opt_class();
  [v4 tellRadiosPrefsToEnableAirplaneMode:v3];
}

+ (void)tellRadiosPrefsToEnableAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = NSSLogForType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Effectively enable/disable (%d) Airplane Mode", (uint8_t *)v6, 8u);
  }

  BOOL v5 = objc_opt_new();
  [v5 setAirplaneModeWithoutMirroring:v3];
}

- (void)displayAirplaneModeMirroringUserEducationAlertIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.nanosystemsettings");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AirplaneModeEducation", @"com.apple.nanosystemsettings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    +[NSSManager displayAirplaneModeMirroringUserEducationAlert:v3];
    CFPreferencesSetAppValue(@"AirplaneModeEducation", kCFBooleanTrue, @"com.apple.nanosystemsettings");
    CFPreferencesAppSynchronize(@"com.apple.nanosystemsettings");
    unsigned int v6 = objc_opt_new();
    char v7 = +[NSSet setWithObject:@"AirplaneModeEducation"];
    [v6 synchronizeUserDefaultsDomain:@"com.apple.nanosystemsettings" keys:v7];
  }
}

- (void)sendFileTransfer:(id)a3 progress:(unint64_t)a4
{
  id v6 = a3;
  char v7 = objc_opt_new();
  [v7 setPath:v6];
  [v7 setProgress:a4];
  id v11 = 0;
  id v8 = [(NSSServer *)self sendProtobuf:v7 options:0 identifier:&v11];
  id v9 = v11;
  id v10 = NSSLogForType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sent file transfer progress message for file: %@ with progress: %lu with id: %@", buf, 0x20u);
  }
}

- (BOOL)fileTransferInProgress
{
  return self->_fileTransferInProgress;
}

- (void)setFileTransferInProgress:(BOOL)a3
{
  self->_fileTransferInProgress = a3;
}

- (NSMutableDictionary)logTranferIdentifiers
{
  return self->_logTranferIdentifiers;
}

- (void)setLogTranferIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
}

- (OS_dispatch_source)vmPressureHandler
{
  return self->_vmPressureHandler;
}

- (void)setVmPressureHandler:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)connectionHandlersQueue
{
  return self->_connectionHandlersQueue;
}

- (void)setConnectionHandlersQueue:(id)a3
{
}

- (NSMutableArray)connectionHandlers
{
  return self->_connectionHandlers;
}

- (void)setConnectionHandlers:(id)a3
{
}

- (OS_dispatch_queue)airplaneModeQueue
{
  return self->_airplaneModeQueue;
}

- (void)setAirplaneModeQueue:(id)a3
{
}

- (NSMutableDictionary)airplaneModeDeliveryTimers
{
  return self->_airplaneModeDeliveryTimers;
}

- (void)setAirplaneModeDeliveryTimers:(id)a3
{
}

- (NSMutableDictionary)airplaneModeEnabledTracking
{
  return self->_airplaneModeEnabledTracking;
}

- (void)setAirplaneModeEnabledTracking:(id)a3
{
}

- (NSUUID)activeDeviceID
{
  return self->_activeDeviceID;
}

- (void)setActiveDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceID, 0);
  objc_storeStrong((id *)&self->_airplaneModeEnabledTracking, 0);
  objc_storeStrong((id *)&self->_airplaneModeDeliveryTimers, 0);
  objc_storeStrong((id *)&self->_airplaneModeQueue, 0);
  objc_storeStrong((id *)&self->_connectionHandlers, 0);
  objc_storeStrong((id *)&self->_connectionHandlersQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_vmPressureHandler, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_logTranferIdentifiers, 0);
}

- (BOOL)endBridgeLiveActivity
{
  return sub_100021CBC() & 1;
}

@end