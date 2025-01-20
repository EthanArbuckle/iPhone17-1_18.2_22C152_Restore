@interface SDActivityScanner
+ (id)sharedScanner;
- (BOOL)restart;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)shouldBoostScan;
- (BOOL)shouldScanForCopyPaste;
- (BOOL)shouldScanForHandoff;
- (SDActivityScanner)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (id)state;
- (os_state_data_s)dumpState;
- (void)_createOSTransactionIfNeeded;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)activityServiceDevicesChanged:(id)a3;
- (void)addObservers;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)consoleUserChanged:(id)a3;
- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6;
- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4;
- (void)continuityDidUpdateState:(id)a3;
- (void)didLosePeer:(id)a3;
- (void)didLosePeerTimer:(id)a3;
- (void)handleNewAdvertisementDevice:(id)a3 data:(id)a4 receivedViaScanning:(BOOL)a5 withSuccessHandler:(id)a6;
- (void)initializeStateCaptureBlock;
- (void)lostAllDevices;
- (void)nearbyServiceDevicesChanged:(id)a3;
- (void)removeObservers;
- (void)scanForTypes:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)systemHasPoweredOn:(id)a3;
- (void)systemWillSleep:(id)a3;
@end

@implementation SDActivityScanner

+ (id)sharedScanner
{
  if (qword_100980320 != -1) {
    dispatch_once(&qword_100980320, &stru_1008CFF68);
  }
  v2 = (void *)qword_100980318;

  return v2;
}

- (SDActivityScanner)init
{
  v13.receiver = self;
  v13.super_class = (Class)SDActivityScanner;
  v2 = [(SDActivityController *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[SDStatusMonitor sharedMonitor];
    monitor = v2->_monitor;
    v2->_monitor = (SDStatusMonitor *)v3;

    v2->_versionByte = sub_1000D9248(@"BluetoothAdvertiseScanVersionByte", 0);
    v2->_scanTypes = 0;
    v2->_isScanning = 0;
    uint64_t v5 = objc_opt_new();
    deviceIdentifierToDeviceRecord = v2->_deviceIdentifierToDeviceRecord;
    v2->_deviceIdentifierToDeviceRecord = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    deviceIdentifierToLostDeviceTimers = v2->_deviceIdentifierToLostDeviceTimers;
    v2->_deviceIdentifierToLostDeviceTimers = (NSMutableDictionary *)v7;

    v9 = (IDSContinuity *)[objc_alloc((Class)IDSContinuity) initWithDelegate:v2 queue:&_dispatch_main_q];
    continuity = v2->_continuity;
    v2->_continuity = v9;

    [(SDActivityScanner *)v2 initializeStateCaptureBlock];
    [(SDActivityScanner *)v2 addObservers];
    v12.receiver = v2;
    v12.super_class = (Class)SDActivityScanner;
    [(SDXPCDaemon *)&v12 _activate];
  }
  return v2;
}

- (BOOL)shouldScanForHandoff
{
  return self->_scanTypes & 1;
}

- (BOOL)shouldScanForCopyPaste
{
  return (LOBYTE(self->_scanTypes) >> 1) & 1;
}

- (BOOL)shouldBoostScan
{
  return (LOBYTE(self->_scanTypes) >> 2) & 1;
}

- (void)start
{
  self->_scannerEnabled = 1;
  [(SDActivityScanner *)self restart];
}

- (void)stop
{
  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  self->_scannerEnabled = 0;

  [(SDActivityScanner *)self restart];
}

- (BOOL)restart
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(SDActivityController *)v2 shouldStart];
  unsigned int v4 = [(SDActivityScanner *)v2 shouldScanForCopyPaste];
  unsigned int v5 = [(SDActivityScanner *)v2 shouldScanForHandoff];
  if (!v2->_scannerEnabled
    || ([(IDSContinuity *)v2->_continuity state] == (id)3 ? (unsigned int v6 = v3) : (unsigned int v6 = 0),
        v6 == 1 ? (BOOL v7 = (v4 | v5) == 0) : (BOOL v7 = 1),
        v7))
  {
    if (v2->_isScanning) {
      v8 = @"Stopped";
    }
    else {
      v8 = @"Skipping request for";
    }
    v9 = v8;
    v10 = handoff_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v2->_scannerEnabled) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      if (((unint64_t)[(IDSContinuity *)v2->_continuity state] & 0x8000000000000000) != 0
        || (uint64_t)[(IDSContinuity *)v2->_continuity state] > 3)
      {
        objc_super v12 = "UnexpectedState";
      }
      else
      {
        objc_super v12 = off_1008CFF88[(void)[(IDSContinuity *)v2->_continuity state]];
      }
      if (v3) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      *(_DWORD *)buf = 138413570;
      if (v4) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      if (v5) {
        CFStringRef v16 = @"YES";
      }
      else {
        CFStringRef v16 = @"NO";
      }
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2080;
      v50 = (uint64_t (*)(uint64_t, uint64_t))v12;
      *(_WORD *)v51 = 2112;
      *(void *)&v51[2] = v14;
      *(_WORD *)&v51[10] = 2112;
      *(void *)&v51[12] = v15;
      __int16 v52 = 2112;
      CFStringRef v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ enabled: %@, state: %s, shouldStart: %@, scanForCopyPaste: %@, scanForHandoff: %@", buf, 0x3Eu);
    }

    if (v2->_isScanning)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v50 = sub_1001D0C60;
      *(void *)v51 = sub_1001D0C70;
      *(void *)&v51[8] = 0;
      *(void *)&v51[8] = v2->_scanningTransaction;
      [(IDSContinuity *)v2->_continuity stopScanningForType:0];
      stopScanLostDeviceTimer = v2->_stopScanLostDeviceTimer;
      if (!stopScanLostDeviceTimer)
      {
        id v18 = &_dispatch_main_q;
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1001D0C78;
        v44[3] = &unk_1008CA6D0;
        v44[4] = v2;
        v44[5] = buf;
        uint64_t v19 = sub_1001B1B10(0, &_dispatch_main_q, v44);
        v20 = v2->_stopScanLostDeviceTimer;
        v2->_stopScanLostDeviceTimer = (OS_dispatch_source *)v19;

        dispatch_resume((dispatch_object_t)v2->_stopScanLostDeviceTimer);
        stopScanLostDeviceTimer = v2->_stopScanLostDeviceTimer;
      }
      dispatch_time_t v21 = sub_1001B1AF8(10.0);
      sub_1001B1BC4(stopScanLostDeviceTimer, v21);
      _Block_object_dispose(buf, 8);
    }
    BOOL v22 = 0;
  }
  else
  {
    [(SDActivityScanner *)v2 _createOSTransactionIfNeeded];
    v9 = [(SDActivityController *)v2 allPeerBTIdentifiers];
    if ((v4 ^ 1 | v5))
    {
      id v13 = 0;
    }
    else
    {
      v23 = +[NSMutableData dataWithCapacity:14];
      [v23 setLength:14];
      id v13 = v23;
      *(unsigned char *)[v13 mutableBytes] = 8;
    }
    unint64_t v24 = [(SDActivityScanner *)v2 shouldBoostScan];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v25 = [(NSMutableDictionary *)v2->_deviceIdentifierToDeviceRecord allValues];
    id v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    unsigned int v43 = v24;
    if (v26)
    {
      uint64_t v27 = *(void *)v46;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v25);
          }
          if ([*(id *)(*((void *)&v45 + 1) + 8 * i) deviceTracked])
          {
            LODWORD(v26) = 1;
            goto LABEL_49;
          }
        }
        id v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v26) {
          continue;
        }
        break;
      }
LABEL_49:
      unint64_t v24 = v43;
    }

    v29 = handoff_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = v13;
      if (v5) {
        CFStringRef v30 = @" Handoff";
      }
      else {
        CFStringRef v30 = &stru_1008E7020;
      }
      v31 = v9;
      if (v4) {
        CFStringRef v32 = @" CopyPaste";
      }
      else {
        CFStringRef v32 = &stru_1008E7020;
      }
      if (v24) {
        CFStringRef v33 = @" Boosted";
      }
      else {
        CFStringRef v33 = &stru_1008E7020;
      }
      if (v26) {
        CFStringRef v34 = @"YES";
      }
      else {
        CFStringRef v34 = @"NO";
      }
      v42 = v31;
      v35 = [(__CFString *)v31 valueForKeyPath:@"@unionOfObjects.UUIDString"];
      v36 = [v35 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v50 = (uint64_t (*)(uint64_t, uint64_t))v33;
      *(_WORD *)v51 = 2112;
      *(void *)&v51[2] = v34;
      *(_WORD *)&v51[10] = 2112;
      *(void *)&v51[12] = v36;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting%@%@%@ scanning with duplicates:%@ for peers [%@]", buf, 0x34u);

      id v13 = v41;
      v9 = v42;
      unint64_t v24 = v43;
    }
    LOBYTE(v40) = (_BYTE)v26;
    [(IDSContinuity *)v2->_continuity startScanningForType:0 withData:v13 mask:v13 peers:v9 withOptions:0 boostedScan:v24 duplicates:v40];
    v37 = v2->_stopScanLostDeviceTimer;
    if (v37)
    {
      dispatch_source_cancel(v37);
      v38 = v2->_stopScanLostDeviceTimer;
      v2->_stopScanLostDeviceTimer = 0;
    }
    BOOL v22 = 1;
  }

  objc_sync_exit(v2);
  return v22;
}

- (void)_createOSTransactionIfNeeded
{
  if (!self->_scanningTransaction)
  {
    unsigned int v3 = (OS_os_transaction *)os_transaction_create();
    scanningTransaction = self->_scanningTransaction;
    self->_scanningTransaction = v3;
  }
}

- (void)activityServiceDevicesChanged:(id)a3
{
  id v4 = a3;
  id v18 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        deviceIdentifierToDeviceRecord = self->_deviceIdentifierToDeviceRecord;
        CFStringRef v11 = [v9 uniqueIDOverride];
        objc_super v12 = [(NSMutableDictionary *)deviceIdentifierToDeviceRecord objectForKeyedSubscript:v11];

        if (v12)
        {
          [v12 setIdsDevice:v9];
          if ([v12 deviceTracked])
          {
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_1001D1004;
            v22[3] = &unk_1008CFFB0;
            id v23 = v12;
            [(SDActivityScanner *)self _enumerateRemoteObjectProxiesUsingBlock:v22];
          }
          id v13 = sub_1000C9CC4(v9);
          if (v13)
          {
            CFStringRef v14 = +[SDActivityEncryptionManager sharedEncryptionManager];
            CFStringRef v15 = [v13 uniqueID];
            CFStringRef v16 = [v14 cachedDecryptionKeyForDeviceIdentifier:v15];

            if (v16)
            {
              [v13 setValidKey:[v16 isValidKey]];
              [v13 setKeyCounter:[v16 lastUsedCounter]];
            }
            [v18 addObject:v13];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D1068;
  v20[3] = &unk_1008CFFB0;
  id v21 = v18;
  id v17 = v18;
  [(SDActivityScanner *)self _enumerateRemoteObjectProxiesUsingBlock:v20];
}

- (void)nearbyServiceDevicesChanged:(id)a3
{
  id v4 = a3;
  id v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001D3404(v4, v5);
  }

  if (![(SDActivityController *)self shouldStart])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isLocallyPaired", (void)v13)
            && ([v11 isNearby] & 1) == 0)
          {
            objc_super v12 = [v11 uniqueIDOverride];
            [(SDActivityScanner *)self didLosePeer:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)handleNewAdvertisementDevice:(id)a3 data:(id)a4 receivedViaScanning:(BOOL)a5 withSuccessHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [v10 uniqueIDOverride];
  unsigned __int8 v14 = sub_1000C9A58(v11);
  if (v14)
  {
    uint64_t v19 = handoff_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int versionByte = self->_versionByte;
      *(_DWORD *)buf = 138412802;
      v29 = v13;
      __int16 v30 = 1024;
      int v31 = v14;
      __int16 v32 = 1024;
      int v33 = versionByte;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Saw IDS device %@ with mismatched version %d, expected %d", buf, 0x18u);
    }
  }
  else
  {
    if (v7)
    {
      long long v15 = [(NSMutableDictionary *)self->_deviceIdentifierToLostDeviceTimers objectForKeyedSubscript:v13];
      long long v16 = v15;
      if (v15) {
        [v15 invalidate];
      }
      id v17 = +[NSTimer scheduledTimerWithTimeInterval:self target:"didLosePeerTimer:" selector:v13 userInfo:0 repeats:10.0];
      [(NSMutableDictionary *)self->_deviceIdentifierToLostDeviceTimers setObject:v17 forKeyedSubscript:v13];
    }
    id v18 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord objectForKeyedSubscript:v13];
    if (!v18)
    {
      id v18 = [[SDActivityDeviceRecord alloc] initWithDevice:v10];
      [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord setObject:v18 forKeyedSubscript:v13];
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001D1488;
    v21[3] = &unk_1008CFFD8;
    BOOL v22 = v18;
    id v23 = self;
    id v24 = v10;
    id v27 = v12;
    id v25 = v11;
    id v26 = v13;
    uint64_t v19 = v18;
    [v19 updateWithRawAdvertisementData:v25 receivedViaScanning:v7 newAdvertisementHandler:v21];
  }
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.scanning";
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFContinuityScannerProtocol];
}

- (id)remoteObjectInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFContinuityScannerClient];
  [v2 setClass:objc_opt_class() forSelector:"receivedAdvertisement:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"foundDeviceWithDevice:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"lostDeviceWithDevice:" argumentIndex:0 ofReply:0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  unsigned int v3 = +[NSArray arrayWithObjects:v6 count:2];
  id v4 = +[NSSet setWithArray:v3];
  [v2 setClasses:v4 forSelector:"pairedDevicesChanged:" argumentIndex:0 ofReply:0];

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001D35D8();
  }

  if (!self->_scannerEnabled) {
    [(SDActivityScanner *)self start];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 deviceTracked])
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1001D1ADC;
          v11[3] = &unk_1008CFFB0;
          v11[4] = v10;
          [(SDActivityScanner *)self _enumerateRemoteObjectProxiesUsingBlock:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001D360C();
  }

  id v5 = [(SDXPCDaemon *)self activeConnections];
  id v6 = [v5 count];

  if (!v6) {
    [(SDActivityScanner *)self stop];
  }
}

- (void)initializeStateCaptureBlock
{
  self->_stateHandle = os_state_add_handler();
}

- (os_state_data_s)dumpState
{
  unsigned int v3 = handoff_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  NSAppendPrintF();
  id v4 = 0;
  uint64_t v5 = [(SDActivityScanner *)self state];
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v23 = v5;
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  uint64_t v8 = +[SDActivityAdvertiser sharedAdvertiser];
  uint64_t v9 = [v8 state];

  if (v9)
  {
    id v24 = v9;
    NSAppendPrintF();
    id v10 = v4;

    id v4 = v10;
  }
  id v11 = +[SDActivityEncryptionManager sharedEncryptionManager];
  long long v12 = [v11 state];

  if (v12)
  {
    id v25 = v12;
    NSAppendPrintF();
    id v13 = v4;

    id v4 = v13;
  }
  long long v14 = +[SDActivityPayloadManager sharedPayloadManager];
  long long v15 = [v14 state];

  if (v15)
  {
    NSAppendPrintF();
    id v16 = v4;

    id v4 = v16;
  }
  NSAppendPrintF();
  id v17 = v4;

  if (v17)
  {
    id v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:0];
    id v19 = [v18 length];
    v20 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v19 + 200, 0xEF23776AuLL);
    id v21 = v20;
    if (v20)
    {
      v20->var0 = 1;
      v20->var1.var1 = v19;
      __strlcpy_chk();
      id v18 = v18;
      memcpy(v21->var4, [v18 bytes], (size_t)v19);
    }
  }
  else
  {
    id v18 = 0;
    id v21 = 0;
  }

  return v21;
}

- (id)state
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v5 = 0;

  NSAppendPrintF();
  id v6 = v5;

  uint64_t versionByte = self->_versionByte;
  NSAppendPrintF();
  id v7 = v6;

  [(SDActivityController *)self shouldStart];
  NSAppendPrintF();
  id v8 = v7;

  NSAppendPrintF();
  id v9 = v8;

  id v10 = SFActivityScanTypesToString();
  NSAppendPrintF();
  id v11 = v9;

  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  return v13;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"systemHasPoweredOn:" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
  [v3 addObserver:self selector:"consoleUserChanged:" name:@"com.apple.sharingd.ConsoleUserChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)systemWillSleep:(id)a3
{
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = getuid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping for user %d on sleep", (uint8_t *)v5, 8u);
  }

  [(SDActivityScanner *)self stop];
}

- (void)systemHasPoweredOn:(id)a3
{
  if ([(SDStatusMonitor *)self->_monitor currentConsoleUser])
  {
    id v4 = handoff_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting for user %d on wake", (uint8_t *)v5, 8u);
    }

    [(SDActivityScanner *)self start];
  }
}

- (void)consoleUserChanged:(id)a3
{
  unsigned int v4 = [(SDStatusMonitor *)self->_monitor currentConsoleUser];
  id v5 = handoff_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v7 = 67109120;
      uid_t v8 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting for user %d on login", (uint8_t *)&v7, 8u);
    }

    [(SDActivityScanner *)self start];
  }
  else
  {
    if (v6)
    {
      int v7 = 67109120;
      uid_t v8 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopping for user %d on logout", (uint8_t *)&v7, 8u);
    }

    [(SDActivityScanner *)self stop];
  }
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v5, &v11);
  BOOL v6 = handoff_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 3)
    {
      int v7 = "UnexpectedState";
    }
    else
    {
      int v7 = off_1008CFF88[(void)[v4 state]];
    }
    *(_DWORD *)buf = 136315138;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did update state to %s", buf, 0xCu);
  }

  switch((unint64_t)[v4 state])
  {
    case 0uLL:
      uid_t v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10008F4E8();
      }
      goto LABEL_18;
    case 1uLL:
      uid_t v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10008F528();
      }
LABEL_18:

      break;
    case 2uLL:
      id v9 = handoff_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10008F4B4();
      }

      [(SDActivityScanner *)self lostAllDevices];
      break;
    case 3uLL:
      id v10 = handoff_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10008F480();
      }

      [(SDActivityScanner *)self restart];
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v11);
}

- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v7, &v9);
  if (!a4) {
    self->_isScanning = 1;
  }
  uid_t v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001D3640(a4, v8);
  }

  os_activity_scope_leave(&v9);
}

- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidStopScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  if (!a4) {
    self->_isScanning = 0;
  }
  uid_t v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001D36D8(a4, v8);
  }

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  os_activity_scope_leave(&v10);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityScanner/continuityDidFailToStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  if (!a4) {
    self->_isScanning = 0;
  }
  os_activity_scope_state_s v11 = handoff_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)a4 > 3) {
      id v12 = "UnexpectedType";
    }
    else {
      id v12 = off_1008CFFF8[a4];
    }
    id v13 = [v9 localizedDescription];
    sub_1001D3770((uint64_t)v12, v13, buf, v11);
  }

  scanningTransaction = self->_scanningTransaction;
  self->_scanningTransaction = 0;

  os_activity_scope_leave(&v15);
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v9 = a5;
  if (!a4)
  {
    os_activity_scope_state_s v10 = [a6 UUIDString];
    os_activity_scope_state_s v11 = [(SDActivityController *)self idsDeviceFromBTIdentifier:v10];
    if (v11)
    {
      [(SDActivityScanner *)self handleNewAdvertisementDevice:v11 data:v9 receivedViaScanning:1 withSuccessHandler:0];
    }
    else
    {
      id v12 = handoff_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001D37D8((uint64_t)v10, v12);
      }
    }
  }
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  id v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Lost IDS device %@", buf, 0xCu);
  }

  id v6 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord objectForKeyedSubscript:v4];
  if ([v6 deviceTracked])
  {
    [v6 setDeviceTracked:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001D2CF4;
    v16[3] = &unk_1008CFFB0;
    id v17 = v6;
    [(SDActivityScanner *)self _enumerateRemoteObjectProxiesUsingBlock:v16];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v7 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord allValues];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    while (2)
    {
      os_activity_scope_state_s v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) deviceTracked])
        {

          goto LABEL_15;
        }
        os_activity_scope_state_s v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [(SDActivityScanner *)self restart];
LABEL_15:
}

- (void)lostAllDevices
{
  id v3 = handoff_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001D3850();
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_deviceIdentifierToLostDeviceTimers objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        [v9 fire];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)didLosePeerTimer:(id)a3
{
  id v5 = [a3 userInfo];
  [(NSMutableDictionary *)self->_deviceIdentifierToLostDeviceTimers removeObjectForKey:v5];
  id v4 = [(NSMutableDictionary *)self->_deviceIdentifierToDeviceRecord objectForKeyedSubscript:v5];
  [v4 setDisableDuplicateFilterOnce:1];
  [(SDActivityScanner *)self didLosePeer:v5];
}

- (void)scanForTypes:(unint64_t)a3
{
  id v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = SFActivityScanTypesToString();
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "requested scanning for %@", buf, 0xCu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D3060;
  v7[3] = &unk_1008CBF30;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D3188;
  block[3] = &unk_1008D0020;
  id v19 = v11;
  id v20 = v12;
  id v22 = a7;
  int64_t v23 = a6;
  id v21 = v13;
  id v14 = v22;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifierToLostDeviceTimers, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToDeviceRecord, 0);
  objc_storeStrong((id *)&self->_stopScanLostDeviceTimer, 0);
  objc_storeStrong((id *)&self->_scanningTransaction, 0);
  objc_storeStrong((id *)&self->_continuity, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end