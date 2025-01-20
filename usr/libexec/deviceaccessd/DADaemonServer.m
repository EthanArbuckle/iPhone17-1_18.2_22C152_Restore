@interface DADaemonServer
- (BOOL)_checkAppAccessInfoExpired;
- (BOOL)_checkDevicesForAppDataURL:(id)a3;
- (BOOL)_necpSignAddressEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5;
- (BOOL)_necpSignHostnameEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5;
- (BOOL)_saveAccessoryDevice:(id)a3 bundleID:(id)a4 existingOptions:(unint64_t)a5 removalType:(int64_t)a6 error:(id *)a7;
- (BOOL)alwaysConfirmBeforeAccessoryRemoval;
- (BOOL)devicesPresentWithAppID:(id)a3;
- (BOOL)modifyAccessoryDevice:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)modifyDeviceIdentifier:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:(id)a3 device:(id)a4;
- (BOOL)saveDevice:(id)a3 session:(id)a4 allowCreate:(BOOL)a5 error:(id *)a6;
- (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5;
- (BOOL)updateAppAccessInfo:(id)a3 accessoryDevice:(id)a4 removalType:(int64_t)a5 error:(id *)a6;
- (DADaemonServer)init;
- (NSString)description;
- (id)_findDADeviceWithBTIdentifier:(id)a3;
- (id)_findDADeviceWithBTPeripheral:(id)a3;
- (id)_necpUUIDForAppID:(id)a3 deviceID:(id)a4 uuidBytes:(unsigned __int8)a5[16];
- (id)_parseDADiscoveryConfiguration:(id)a3;
- (id)_saveDeviceAppAccessInfo:(id)a3 device:(id)a4 error:(id *)a5;
- (id)_statefulDevicesForAppID:(id)a3;
- (id)_updateStateForDiscoveryDeviceID:(id)a3 state:(int64_t)a4 appID:(id)a5;
- (id)addDiscovery:(id)a3;
- (id)appAccessInfoForDeviceID:(id)a3 appID:(id)a4;
- (id)appBundleInfoAccessoryDiscoveryOptions:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)generateImageURLForDevice:(id)a3;
- (id)getAuthorizedDevices:(id)a3;
- (id)getDevicesWithFlags:(unint64_t)a3 appID:(id)a4;
- (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4;
- (id)xpcListenerEndpoint;
- (int64_t)_applicationHasBluetoothGlobalTCC:(id)a3;
- (int64_t)_updateDeviceStateForBluetooth:(id)a3 device:(id)a4;
- (int64_t)_updateDeviceStateForWifi:(id)a3 currentState:(int64_t)a4;
- (int64_t)applicationHasBluetoothGlobalTCC:(id)a3;
- (unint64_t)appBundleInfoAccessoryOptions:(id)a3;
- (void)_activate;
- (void)_addSSDPDatatoNWEndpoint:(id)a3 appID:(id)a4;
- (void)_addTXTRecordToNWEndpoint:(id)a3 appID:(id)a4;
- (void)_applicationsDidInstall:(id)a3;
- (void)_applicationsDidUninstall:(id)a3;
- (void)_armBTScanTimer;
- (void)_checkAndReportLostBTDevices;
- (void)_checkAppAccessInfo;
- (void)_checkDevices;
- (void)_checkDevicesForAllApps;
- (void)_cleanupBTDiscovery;
- (void)_cleanupWiFiDiscovery;
- (void)_discoveryEvent:(id)a3 appID:(id)a4;
- (void)_forgetBluetoothDevice:(id)a3;
- (void)_forgetWiFiDevice:(id)a3;
- (void)_invalidate;
- (void)_keychainMarkDeviceForRestoreOnSameDevice;
- (void)_keychainVerificationDevicesRestoredOnSameDevice;
- (void)_necpCleanupIfNeeded;
- (void)_necpRemoveUUIDsForAppID:(id)a3 deviceID:(id)a4;
- (void)_necpSignEndpointForDevice:(id)a3 appID:(id)a4;
- (void)_necpUpdateUUIDForAppID:(id)a3 device:(id)a4;
- (void)_necpUpdateUUIDsWithBlock:(id)a3;
- (void)_necpUpdateValueStrings:(id)a3;
- (void)_persistBluetoothDevice:(id)a3 device:(id)a4 requirePairing:(BOOL)a5 pairWithCTKD:(BOOL)a6;
- (void)_prefsChanged;
- (void)_removeAllDevicesAndAppAccess;
- (void)_reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5;
- (void)_reportDevicesMigratedEvent:(id)a3 appID:(id)a4;
- (void)_reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4;
- (void)_reportDevicesPresentChanged:(BOOL)a3 migrated:(BOOL)a4 appID:(id)a5;
- (void)_reportDiscoveredBTDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5 AppID:(id)a6 DADaemonDiscovery:(id)a7 DADiscovery:(id)a8 config:(id)a9;
- (void)_reportDiscoveryEvent:(id)a3 appID:(id)a4;
- (void)_reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5;
- (void)_saveAppDataDict:(id)a3 fileURL:(id)a4;
- (void)_scheduleCheckAppAccessInfo;
- (void)_scheduleCheckDevices;
- (void)_setupBTPairingManager;
- (void)_startBTScan;
- (void)_stopBTScan;
- (void)_updateAppInfo:(id)a3 options:(unint64_t)a4;
- (void)_updateBluetoothScannerIfNeeded;
- (void)_updateDeviceStateTimer;
- (void)_updateWiFiDevice:(id)a3 bundleID:(id)a4;
- (void)_updateWiFiManagerIfNeeded;
- (void)_xpcConnectionAccept:(id)a3;
- (void)_xpcListenerEvent:(id)a3;
- (void)activate;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeAppsAccess:(id)a3;
- (void)removeAppsAccessForBundleID:(id)a3 appRemoval:(BOOL)a4;
- (void)removeDiscovery:(id)a3;
- (void)reportAuthorizedDevices:(id)a3;
- (void)respondToBluetoothPairingRequest:(id)a3 accept:(BOOL)a4 pairingType:(int64_t)a5 passkey:(id)a6;
- (void)runMigrationWithDiscovery:(id)a3;
- (void)runSystemDiscovery;
- (void)updateAppInfo:(id)a3;
- (void)updateDADevicesWithInstalledApps;
- (void)xpcConnectionInvalidated:(id)a3;
@end

@implementation DADaemonServer

- (DADaemonServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)DADaemonServer;
  v2 = [(DADaemonServer *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("DADaemon", v3);
    v5 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v4;

    *((_DWORD *)v2 + 24) = -1;
    *(void *)(v2 + 180) = -1;
    objc_storeStrong(&gDADaemonServer, v2);
    v2[296] = 0;
    v6 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = 0;

    v7 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = 0;

    v8 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = 0;

    v9 = (void *)*((void *)v2 + 32);
    *((void *)v2 + 32) = 0;

    v10 = v2;
  }

  return (DADaemonServer *)v2;
}

- (void)dealloc
{
  int necpFD = self->_necpFD;
  if ((necpFD & 0x80000000) == 0)
  {
    if (close(necpFD) && *__error()) {
      __error();
    }
    self->_int necpFD = -1;
  }
  expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  self->_expiredDeviceChecktransaction = 0;

  v5.receiver = self;
  v5.super_class = (Class)DADaemonServer;
  [(DADaemonServer *)&v5 dealloc];
}

- (NSString)description
{
  return (NSString *)[(DADaemonServer *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v46 = a3;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = sub_100003B10;
  v79 = sub_100003B20;
  id v80 = 0;
  id obj = 0;
  mach_continuous_time();
  UpTicksToSeconds();
  objc_super v5 = CUPrintDuration64();
  mach_absolute_time();
  UpTicksToSeconds();
  CUPrintDuration64();
  v43 = v41 = v5;
  NSAppendPrintF();
  objc_storeStrong(&v80, 0);

  if (self->_deviceStateTimer)
  {
    v6 = (id *)(v76 + 5);
    id v73 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v6, v73);
  }
  v7 = (id *)(v76 + 5);
  id v72 = (id)v76[5];
  NSAppendPrintF();
  objc_storeStrong(v7, v72);
  v45 = -[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0, v41, v43);
  id v8 = [v45 count];
  id v9 = [v45 count];
  BOOL v10 = v9 != 0;
  if (v9)
  {
    v11 = (id *)(v76 + 5);
    id v71 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v11, v71);
    objc_super v12 = (id *)(v76 + 5);
    id v70 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v12, v70);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100003B28;
    v68[3] = &unk_10003C900;
    v68[4] = &v75;
    int v69 = a3;
    [v45 enumerateObjectsUsingBlock:v68, v8];
    v13 = (id *)(v76 + 5);
    id v67 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v13, v67);
  }
  id v14 = [(NSMutableDictionary *)self->_discoveryMap count];
  if (v14)
  {
    if (!v9)
    {
      v15 = (id *)(v76 + 5);
      id v66 = (id)v76[5];
      NSAppendPrintF();
      objc_storeStrong(v15, v66);
    }
    v16 = (id *)(v76 + 5);
    id v65 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v16, v65);
    discoveryMap = self->_discoveryMap;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100003B98;
    v64[3] = &unk_10003C928;
    v64[4] = &v75;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryMap, "enumerateKeysAndObjectsUsingBlock:", v64, v14);
    v18 = (id *)(v76 + 5);
    id v63 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v18, v63);
    BOOL v10 = 1;
  }
  id v19 = [(NSMutableSet *)self->_xpcConnections count];
  if (v19)
  {
    if (!v10)
    {
      v20 = (id *)(v76 + 5);
      id v62 = (id)v76[5];
      NSAppendPrintF();
      objc_storeStrong(v20, v62);
    }
    v21 = (id *)(v76 + 5);
    id v61 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v21, v61);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    v22 = self->_xpcConnections;
    v23 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v57, v82, 16, v19);
    if (v23)
    {
      uint64_t v24 = *(void *)v58;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = (id *)(v76 + 5);
          id v56 = (id)v76[5];
          v42 = CUDescriptionWithLevel();
          NSAppendPrintF();
          objc_storeStrong(v26, v56);

          if (v46 >= 0xB)
          {
            v27 = (id *)(v76 + 5);
            id v55 = (id)v76[5];
            NSAppendPrintF();
            objc_storeStrong(v27, v55);
          }
        }
        v23 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v57, v82, 16, v42);
      }
      while (v23);
    }

    v28 = (id *)(v76 + 5);
    id v54 = (id)v76[5];
    NSAppendPrintF();
    objc_storeStrong(v28, v54);
    BOOL v10 = 1;
  }
  if (v46 <= 0x14)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v29 = (void *)CFPrefs_CopyKeys();
    v30 = (char *)[v29 countByEnumeratingWithState:&v50 objects:v81 count:16];
    if (!v30)
    {
LABEL_36:

      goto LABEL_37;
    }
    int v31 = 0;
    uint64_t v32 = *(void *)v51;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v29);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v10)
          {
            v34 = (id *)(v76 + 5);
            id v49 = (id)v76[5];
            NSAppendPrintF();
            objc_storeStrong(v34, v49);
          }
          v35 = (void *)CFPrefs_CopyTypedValue();
          v36 = (id *)(v76 + 5);
          id v48 = (id)v76[5];
          v44 = CUPrintNSObjectOneLine();
          NSAppendPrintF();
          objc_storeStrong(v36, v48);

          ++v31;
          BOOL v10 = 1;
        }
      }
      v30 = (char *)[v29 countByEnumeratingWithState:&v50 objects:v81 count:16];
    }
    while (v30);

    if (v31 >= 1)
    {
      v37 = v76;
      v47 = (void *)v76[5];
      NSAppendPrintF();
      id v38 = v47;
      v29 = (void *)v37[5];
      v37[5] = (uint64_t)v38;
      goto LABEL_36;
    }
  }
LABEL_37:
  id v39 = (id)v76[5];

  _Block_object_dispose(&v75, 8);

  return v39;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003CC0;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_startTicksAwake = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  LogSetAppID();
  LogControl();
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    objc_super v5 = self->_xpcListener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000040E4;
    handler[3] = &unk_10003C978;
    handler[4] = self;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000040F0;
    v17[3] = &unk_10003C9A0;
    v17[4] = self;
    notify_register_dispatch("com.apple.DeviceAccess.prefsChanged", &self->_prefsChangedNotifyToken, dispatchQueue, v17);
  }
  if (self->_resetPrivacySettingsToken == -1)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v7 = self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004174;
    v16[3] = &unk_10003C9A0;
    v16[4] = self;
    notify_register_dispatch("com.apple.Preferences.ResetPrivacyWarningsNotification", &self->_resetPrivacySettingsToken, v7, v16);
  }
  if (!self->_stateHandler)
  {
    v15[5] = _NSConcreteStackBlock;
    v15[6] = 3221225472;
    v15[7] = sub_1000041F8;
    v15[8] = &unk_10003C9C8;
    v15[9] = self;
    self->_stateHandler = os_state_add_handler();
  }
  if (!self->_systemMonitor)
  {
    id v8 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v8;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100004214;
    v15[3] = &unk_10003C950;
    v15[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v15];
    BOOL v10 = self->_systemMonitor;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000421C;
    v14[3] = &unk_10003C950;
    v14[4] = self;
    [(CUSystemMonitor *)v10 activateWithCompletion:v14];
  }
  [(DADaemonServer *)self _prefsChanged];
  v11 = +[LSApplicationWorkspace defaultWorkspace];
  [v11 addObserver:self];

  [(DADaemonServer *)self updateDADevicesWithInstalledApps];
  if (!self->_cbCentralManager)
  {
    objc_super v12 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_dispatchQueue options:0];
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v12;
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_dispatchQueue, &stru_10003CA08);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004328;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_super v5 = v3;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) invalidate:v22];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)v5 removeAllObjects];
  [(NSMutableDictionary *)self->_discoveryMap enumerateKeysAndObjectsUsingBlock:&stru_10003CA48];
  [(NSMutableDictionary *)self->_discoveryMap removeAllObjects];
  [(DADaemonServer *)self _necpCleanupIfNeeded];
  [(CBCentralManager *)self->_cbCentralManager stopScan];
  [(DADaemonServer *)self _cleanupWiFiDiscovery];
  BOOL v10 = +[LSApplicationWorkspace defaultWorkspace];
  [v10 removeObserver:self];

  checkDevicesTimer = self->_checkDevicesTimer;
  if (checkDevicesTimer)
  {
    objc_super v12 = checkDevicesTimer;
    dispatch_source_cancel(v12);
    v13 = self->_checkDevicesTimer;
    self->_checkDevicesTimer = 0;
  }
  deviceStateTimer = self->_deviceStateTimer;
  if (deviceStateTimer)
  {
    v15 = deviceStateTimer;
    dispatch_source_cancel(v15);
    v16 = self->_deviceStateTimer;
    self->_deviceStateTimer = 0;
  }
  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }
  int resetPrivacySettingsToken = self->_resetPrivacySettingsToken;
  if (resetPrivacySettingsToken != -1)
  {
    notify_cancel(resetPrivacySettingsToken);
    self->_int resetPrivacySettingsToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    v20 = xpcListener;
    xpc_connection_cancel(v20);
    v21 = self->_xpcListener;
    self->_xpcListener = 0;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefAlwaysRequireAccessoryRemovalUserConfirmation != v3)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&dispatch_queue_t v4 = COERCE_DOUBLE("yes");
      if (v3) {
        *(double *)&objc_super v5 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&objc_super v5 = COERCE_DOUBLE("yes");
      }
      if (!v3) {
        *(double *)&dispatch_queue_t v4 = COERCE_DOUBLE("no");
      }
      double v38 = *(double *)&v5;
      double v39 = *(double *)&v4;
      LogPrintF();
    }
    self->_prefAlwaysRequireAccessoryRemovalUserConfirmation = v3;
  }
  CFPrefs_GetDouble();
  if (v6 > 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 60.0;
  }
  double prefCheckAppAccessInfoSeconds = self->_prefCheckAppAccessInfoSeconds;
  if (v7 != prefCheckAppAccessInfoSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_20;
        }
        double prefCheckAppAccessInfoSeconds = self->_prefCheckAppAccessInfoSeconds;
      }
      double v38 = prefCheckAppAccessInfoSeconds;
      double v39 = v7;
      LogPrintF();
    }
LABEL_20:
    self->_double prefCheckAppAccessInfoSeconds = v7;
    [(DADaemonServer *)self _scheduleCheckAppAccessInfo];
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefBTPairingWithMITM != v9)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&BOOL v10 = COERCE_DOUBLE("yes");
      if (v9) {
        *(double *)&v11 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v11 = COERCE_DOUBLE("yes");
      }
      if (!v9) {
        *(double *)&BOOL v10 = COERCE_DOUBLE("no");
      }
      double v38 = *(double *)&v11;
      double v39 = *(double *)&v10;
      LogPrintF();
    }
    self->_prefBTPairingWithMITM = v9;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (Int64 >= 1) {
    uint64_t v13 = Int64;
  }
  else {
    *(double *)&uint64_t v13 = NAN;
  }
  *(void *)&double v14 = self->_prefsBTRSSIThreshold;
  if (v13 != *(void *)&v14)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_40;
        }
        *(void *)&double v14 = self->_prefsBTRSSIThreshold;
      }
      double v38 = v14;
      double v39 = *(double *)&v13;
      LogPrintF();
    }
LABEL_40:
    self->_prefsBTRSSIThreshold = (__int16)v13;
  }
  CFPrefs_GetDouble();
  double v16 = 86400.0;
  if (v15 > 0.0) {
    double v17 = v15;
  }
  else {
    double v17 = 86400.0;
  }
  double prefsBluetoothTransportBridgingTimeoutSeconds = self->_prefsBluetoothTransportBridgingTimeoutSeconds;
  if (v17 != prefsBluetoothTransportBridgingTimeoutSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_49;
        }
        double prefsBluetoothTransportBridgingTimeoutSeconds = self->_prefsBluetoothTransportBridgingTimeoutSeconds;
      }
      double v38 = prefsBluetoothTransportBridgingTimeoutSeconds;
      double v39 = v17;
      LogPrintF();
    }
LABEL_49:
    self->_double prefsBluetoothTransportBridgingTimeoutSeconds = v17;
  }
  CFPrefs_GetDouble();
  if (v19 > 0.0) {
    double v20 = v19;
  }
  else {
    double v20 = 10.0;
  }
  double prefBTScanRefreshSeconds = self->_prefBTScanRefreshSeconds;
  if (v20 != prefBTScanRefreshSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_58;
        }
        double prefBTScanRefreshSeconds = self->_prefBTScanRefreshSeconds;
      }
      double v38 = prefBTScanRefreshSeconds;
      double v39 = v20;
      LogPrintF();
    }
LABEL_58:
    self->_double prefBTScanRefreshSeconds = v20;
  }
  CFPrefs_GetDouble();
  if (v22 > 0.0) {
    double v23 = v22;
  }
  else {
    double v23 = 30.0;
  }
  double prefsBTTaskTimeoutSeconds = self->_prefsBTTaskTimeoutSeconds;
  if (v23 != prefsBTTaskTimeoutSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_67;
        }
        double prefsBTTaskTimeoutSeconds = self->_prefsBTTaskTimeoutSeconds;
      }
      double v38 = prefsBTTaskTimeoutSeconds;
      double v39 = v23;
      LogPrintF();
    }
LABEL_67:
    self->_double prefsBTTaskTimeoutSeconds = v23;
  }
  CFPrefs_GetDouble();
  if (v25 > 0.0) {
    double v26 = v25;
  }
  else {
    double v26 = 1800.0;
  }
  double prefCheckDevicesSeconds = self->_prefCheckDevicesSeconds;
  if (v26 != prefCheckDevicesSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_76;
        }
        double prefCheckDevicesSeconds = self->_prefCheckDevicesSeconds;
      }
      double v38 = prefCheckDevicesSeconds;
      double v39 = v26;
      LogPrintF();
    }
LABEL_76:
    self->_double prefCheckDevicesSeconds = v26;
    [(DADaemonServer *)self _scheduleCheckDevices];
  }
  CFPrefs_GetDouble();
  if (v28 > 0.0) {
    double v29 = v28;
  }
  else {
    double v29 = 86400.0;
  }
  double prefDeviceApprovedSeconds = self->_prefDeviceApprovedSeconds;
  if (v29 != prefDeviceApprovedSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_85;
        }
        double prefDeviceApprovedSeconds = self->_prefDeviceApprovedSeconds;
      }
      double v38 = prefDeviceApprovedSeconds;
      double v39 = v29;
      LogPrintF();
    }
LABEL_85:
    self->_double prefDeviceApprovedSeconds = v29;
    [(DADaemonServer *)self _scheduleCheckDevices];
  }
  CFPrefs_GetDouble();
  if (v31 > 0.0) {
    double v32 = v31;
  }
  else {
    double v32 = 30.0;
  }
  double prefDeviceStateTimeoutSeconds = self->_prefDeviceStateTimeoutSeconds;
  if (v32 != prefDeviceStateTimeoutSeconds)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_94;
        }
        double prefDeviceStateTimeoutSeconds = self->_prefDeviceStateTimeoutSeconds;
      }
      double v38 = prefDeviceStateTimeoutSeconds;
      double v39 = v32;
      LogPrintF();
    }
LABEL_94:
    self->_double prefDeviceStateTimeoutSeconds = v32;
    [(DADaemonServer *)self _scheduleCheckDevices];
  }
  CFPrefs_GetDouble();
  if (v34 > 0.0) {
    double v16 = v34;
  }
  if (v16 != self->_prefAppPartialIPUpdateMinCadenceSeconds)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefAppPartialIPUpdateMinCadenceSeconds = v16;
  }
  BOOL v35 = CFPrefs_GetInt64() != 0;
  if (self->_prefEnabled != v35)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefEnabled = v35;
  }
  if (CFPrefs_GetInt64()) {
    BOOL v36 = IsAppleInternalBuild() != 0;
  }
  else {
    BOOL v36 = 0;
  }
  BOOL v37 = v36;
  if (self->_prefKeychainDisabled != v36)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefKeychainDisabled = v37;
  }
}

- (BOOL)alwaysConfirmBeforeAccessoryRemoval
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL prefAlwaysRequireAccessoryRemovalUserConfirmation = v2->_prefAlwaysRequireAccessoryRemovalUserConfirmation;
  objc_sync_exit(v2);

  return prefAlwaysRequireAccessoryRemovalUserConfirmation;
}

- (unint64_t)appBundleInfoAccessoryOptions:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
  objc_super v5 = [v4 infoDictionary];
  double v6 = [v5 objectForKey:@"NSAccessorySetupKitSupports" ofClass:objc_opt_class()];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 |= [v13 isEqualToString:@"Bluetooth"];
        if ([v13 isEqualToString:@"WiFi"]) {
          v10 |= 2uLL;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    double v15 = DADeviceAccessorySetupOptionsToString();
    LogPrintF();
  }
  return v10;
}

- (id)appBundleInfoAccessoryDiscoveryOptions:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionary];
  if ([(DADaemonServer *)self appBundleInfoAccessoryOptions:v4])
  {
    double v6 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v4 allowPlaceholder:1 error:0];
    id v7 = [v5 copy];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005254;
  v7[3] = &unk_10003CA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_applicationsDidInstall:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v4;
    LogPrintF();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000533C;
  v6[3] = &unk_10003CA98;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6, v5];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000054CC;
  v7[3] = &unk_10003CA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000055E8;
  v6[3] = &unk_10003CAC0;
  id v7 = (id)objc_opt_new();
  id v5 = v7;
  [v4 enumerateObjectsUsingBlock:v6];
  [(DADaemonServer *)self removeAppsAccess:v5];
}

- (void)_keychainMarkDeviceForRestoreOnSameDevice
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100003B10;
  double v14 = sub_100003B20;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000058EC;
  v9[3] = &unk_10003CAE8;
  v9[4] = &v10;
  id v3 = objc_retainBlock(v9);
  if (self->_prefKeychainDisabled)
  {
    if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    id v4 = objc_alloc_init((Class)CUKeychainItem);
    [v4 setAccessGroup:@"com.apple.DeviceAccess"];
    [v4 setAccessibleType:6];
    id v5 = +[NSString stringWithFormat:@"%@-%@", @"com.apple.DeviceAccess", @"DADaemon-SameDevice"];
    [v4 setIdentifier:v5];

    [v4 setInvisible:1];
    [v4 setSyncType:1];
    [v4 setType:@"DADaemon-SameDevice"];
    if (dword_100043408 <= 40 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = objc_alloc_init((Class)CUKeychainManager);
    id v7 = (id *)(v11 + 5);
    id obj = (id)v11[5];
    [v6 addOrUpdateOrReAddItem:v4 flags:1 logCategory:&dword_100043408 logLabel:@"DAKeychain" error:&obj];
    objc_storeStrong(v7, obj);
  }
  ((void (*)(void *))v3[2])(v3);

  _Block_object_dispose(&v10, 8);
}

- (void)_keychainVerificationDevicesRestoredOnSameDevice
{
  if (self->_prefKeychainDisabled)
  {
    if (dword_100043408 > 90 || dword_100043408 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }
  else
  {
    if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
    {
      id v2 = objc_alloc_init((Class)CUKeychainItem);
      [v2 setAccessGroup:@"com.apple.DeviceAccess"];
      id v3 = +[NSString stringWithFormat:@"%@-%@", @"com.apple.DeviceAccess", @"DADaemon-SameDevice"];
      [v2 setIdentifier:v3];

      [v2 setSyncType:1];
      [v2 setType:@"DADaemon-SameDevice"];
      id v4 = objc_alloc_init((Class)CUKeychainManager);
      id v19 = 0;
      id v5 = [v4 copyItemsMatchingItem:v2 flags:1 error:&v19];
      id v6 = v19;
      id v7 = v6;
      if (v5 || [v6 code] != (id)-25300)
      {
        if (dword_100043408 <= 40 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        id v8 = +[NSFileManager defaultManager];
        id v9 = +[NSFileManager defaultManager];
        id v18 = v7;
        uint64_t v10 = [v9 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v18];
        id v11 = v18;

        uint64_t v12 = [v10 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
        uint64_t v13 = [v12 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
        id v17 = 0;
        unsigned __int8 v14 = [v8 removeItemAtURL:v13 error:&v17];
        id v15 = v17;
        if ((v14 & 1) == 0
          && dword_100043408 <= 90
          && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          long long v16 = CUPrintNSError();
          LogPrintF();
        }
        id v7 = v11;
      }

      return;
    }
    if (dword_100043408 > 90 || dword_100043408 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }

  LogPrintF();
}

- (void)updateDADevicesWithInstalledApps
{
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    int v3 = off_1000435F8();
    id v4 = "no";
    if (v3) {
      id v4 = "yes";
    }
    v21 = v4;
    LogPrintF();
  }
  if (off_1000435F8())
  {
    if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v5 = [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100006128;
    v30[3] = &unk_10003CB10;
    id v8 = v6;
    id v31 = v8;
    [v5 enumerateObjectsUsingBlock:v30];
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      v21 = (const char *)[v8 count];
      LogPrintF();
    }
    id v9 = +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 192, v21);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned __int8 v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) bundleIdentifier];
          if (v14)
          {
            [v7 addObject:v14];
            if ([v8 containsObject:v14]) {
              [(DADaemonServer *)self updateAppInfo:v14];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v11);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
          if (([v7 containsObject:v20] & 1) == 0) {
            [(DADaemonServer *)self removeAppsAccessForBundleID:v20 appRemoval:1];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v17);
    }
  }
}

- (void)_removeAllDevicesAndAppAccess
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v3 = [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000063CC;
  v11[3] = &unk_10003CB10;
  v11[4] = self;
  [v3 enumerateObjectsUsingBlock:v11];
  v10[1] = 1;
  uint64_t v4 = container_system_group_path_for_identifier();
  if (v4)
  {
    id v5 = (void *)v4;
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v5;
      LogPrintF();
    }
    id v6 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v5, 1, 0, v9);
    free(v5);
    if (v6)
    {
      id v7 = [v6 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
      id v8 = +[NSFileManager defaultManager];
      v10[0] = 0;
      [v8 removeItemAtURL:v7 error:v10];
    }
    else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)removeAppsAccess:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v6 = v4;
    LogPrintF();
  }
  id v5 = -[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000066B8;
  v7[3] = &unk_10003CB88;
  v7[4] = v5;
  void v7[5] = self;
  [v4 enumerateObjectsUsingBlock:v7];
}

- (void)removeAppsAccessForBundleID:(id)a3 appRemoval:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v7 = "no";
    if (v4) {
      id v7 = "yes";
    }
    id v10 = v6;
    id v11 = v7;
    LogPrintF();
  }
  id v8 = -[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, 0, v10, v11);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006A34;
  v12[3] = &unk_10003CBB0;
  BOOL v15 = v4;
  id v13 = v6;
  unsigned __int8 v14 = self;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v12];
}

- (void)updateAppInfo:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006B6C;
  v7[3] = &unk_10003CA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_updateAppInfo:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1 || _LogCategory_Initialize())
    {
      id v9 = v6;
      LogPrintF();
    }
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v6;
      LogPrintF();
    }
  }
  id v7 = -[DADaemonServer getDevicesWithFlags:appID:](self, "getDevicesWithFlags:appID:", 8, v6, v9);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100006D18;
  v10[3] = &unk_10003CBD8;
  uint64_t v12 = self;
  unint64_t v13 = a4;
  id v11 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

- (BOOL)updateAppAccessInfo:(id)a3 accessoryDevice:(id)a4 removalType:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v49 = 0;
  long long v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000;
  long long v52 = sub_100003B10;
  long long v53 = sub_100003B20;
  id v54 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100007418;
  v46[3] = &unk_10003CC00;
  id v48 = &v49;
  id v11 = a4;
  id v47 = v11;
  uint64_t v12 = objc_retainBlock(v46);
  BOOL v35 = v12;
  id v36 = [v11 copy];
  id v13 = v11;
  unsigned __int8 v14 = [v10 bundleIdentifier];
  if ([v14 length])
  {
    BOOL v15 = [v10 deviceIdentifier];
    if (![v15 length])
    {
      if (a6)
      {
        DAErrorF();
        BOOL v32 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v32 = 0;
      }
      goto LABEL_24;
    }
    id v16 = [v13 appAccessInfoDeviceMap];

    if (!v16)
    {
      id v17 = +[NSMutableDictionary dictionary];
      [v13 setAppAccessInfoDeviceMap:v17];
    }
    uint64_t v18 = v50;
    id obj = v50[5];
    id v19 = [(DADaemonServer *)self _saveDeviceAppAccessInfo:v10 device:v13 error:&obj];
    objc_storeStrong(v18 + 5, obj);
    id v20 = v50[5];
    if (v20)
    {
      if (a6)
      {
        BOOL v32 = 0;
        *a6 = v20;
LABEL_23:

        uint64_t v12 = v35;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      v21 = [v13 appAccessInfoDeviceMap];
      [v21 setObject:v19 forKeyedSubscript:v14];

      long long v22 = [(DADaemonServer *)self generateImageURLForDevice:v13];
      [v13 setDisplayImageFileURL:v22];

      if (-[DADaemonServer _saveAccessoryDevice:bundleID:existingOptions:removalType:error:](self, "_saveAccessoryDevice:bundleID:existingOptions:removalType:error:", v13, v14, [v10 accessoryOptions], a5, a6))
      {
        long long v23 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v14];
        long long v24 = [v23 discoveryObj];
        unsigned __int8 v25 = [v24 flags];

        if ((v25 & 8) == 0)
        {
          id v26 = [v19 state];
          long long v27 = [(DADaemonServer *)self _updateStateForDiscoveryDeviceID:v15 state:v26 appID:v14];
          if (v26)
          {
            if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
              id v34 = v13;
              LogPrintF();
            }
            -[DADaemonServer _reportDeviceChanged:appID:discovery:](self, "_reportDeviceChanged:appID:discovery:", v13, v14, v27 != 0, v34);
          }
          else if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[DADaemonServer _reportRemovedDevice:appID:discovery:](self, "_reportRemovedDevice:appID:discovery:", v36, v14, v27 != 0, v36);
          }
          else
          {
            -[DADaemonServer _reportRemovedDevice:appID:discovery:](self, "_reportRemovedDevice:appID:discovery:", v36, v14, v27 != 0, v34);
          }
          [(DADaemonServer *)self _scheduleCheckAppAccessInfo];
        }
        long long v28 = [v13 SSID];

        if (v28) {
          [(DADaemonServer *)self _updateWiFiDevice:v13 bundleID:v14];
        }
        long long v29 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
        dispatchQueue = self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000074E4;
        block[3] = &unk_10003CC28;
        id v38 = v14;
        id v39 = v13;
        int64_t v44 = a5;
        id v40 = v19;
        id v41 = v39;
        v42 = self;
        id v31 = v29;
        id v43 = v31;
        dispatch_async(dispatchQueue, block);
        [(DADaemonServer *)self _keychainMarkDeviceForRestoreOnSameDevice];

        BOOL v32 = 1;
        goto LABEL_23;
      }
    }
    BOOL v32 = 0;
    goto LABEL_23;
  }
  if (a6)
  {
    DAErrorF();
    BOOL v32 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_25:

  ((void (*)(void *))v12[2])(v12);
  _Block_object_dispose(&v49, 8);

  return v32;
}

- (void)_checkAppAccessInfo
{
  if ([(DADaemonServer *)self _checkAppAccessInfoExpired])
  {
    int v3 = self->_checkAppAccessInfoTimer;
    if (v3)
    {
      id v4 = v3;
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        id v9 = CUPrintDurationDouble();
        LogPrintF();
      }
      CUDispatchTimerSet();
    }
    else
    {
      dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_checkAppAccessInfoTimer, v6);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000078C8;
      handler[3] = &unk_10003CA70;
      id v4 = v6;
      id v13 = v4;
      unsigned __int8 v14 = self;
      dispatch_source_set_event_handler(v4, handler);
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        id v10 = CUPrintDurationDouble();
        LogPrintF();
      }
      CUDispatchTimerSet();
      dispatch_activate(v4);
    }
    return;
  }
  checkAppAccessInfoTimer = self->_checkAppAccessInfoTimer;
  if (!checkAppAccessInfoTimer) {
    return;
  }
  if (dword_100043408 >= 31)
  {
    id v7 = checkAppAccessInfoTimer;
LABEL_18:
    id v11 = v7;
    dispatch_source_cancel(v7);
    id v8 = self->_checkAppAccessInfoTimer;
    self->_checkAppAccessInfoTimer = 0;

    return;
  }
  if (dword_100043408 != -1 || _LogCategory_Initialize()) {
    LogPrintF();
  }
  id v7 = self->_checkAppAccessInfoTimer;
  if (v7) {
    goto LABEL_18;
  }
}

- (BOOL)_checkAppAccessInfoExpired
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [v7 appAccessInfoMap];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100007B18;
        v15[3] = &unk_10003CC50;
        v15[4] = v7;
        v15[5] = self;
        v15[6] = &v20;
        *(CFAbsoluteTime *)&v15[7] = Current;
        [v8 enumerateKeysAndObjectsUsingBlock:v15];
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v4);
  }

  expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  if (*((unsigned char *)v21 + 24)) {
    BOOL v10 = expiredDeviceChecktransaction == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = (OS_os_transaction *)os_transaction_create();
    expiredDeviceChecktransaction = self->_expiredDeviceChecktransaction;
  }
  else
  {
    id v11 = 0;
  }
  self->_expiredDeviceChecktransaction = v11;

  BOOL v12 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)_checkDevices
{
  self->_deviceStateHasTransient = 0;
  deviceNECPValueStrings = self->_deviceNECPValueStrings;
  self->_deviceNECPValueStrings = 0;

  [(DADaemonServer *)self _checkDevicesForAllApps];
  [(DADaemonServer *)self _updateDeviceStateTimer];
  [(DADaemonServer *)self _necpUpdateValueStrings:self->_deviceNECPValueStrings];
  id v4 = self->_deviceNECPValueStrings;
  self->_deviceNECPValueStrings = 0;
}

- (void)_checkDevicesForAllApps
{
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_100003B10;
  id v39 = sub_100003B20;
  id v40 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000084F4;
  v34[3] = &unk_10003CAE8;
  v34[4] = &v35;
  id v2 = objc_retainBlock(v34);
  int v3 = +[NSFileManager defaultManager];
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = +[NSURL fileURLWithPath:v4];
  dispatch_source_t v6 = (id *)(v36 + 5);
  id obj = (id)v36[5];
  long long v24 = [v3 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:4 error:&obj];
  char v23 = v3;
  objc_storeStrong(v6, obj);

  if (v24)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v24;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v8)
    {
      int v9 = 0;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          BOOL v12 = v2;
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          unsigned __int8 v14 = [v13 pathExtension];
          BOOL v15 = [v14 caseInsensitiveCompare:@"daappdata"] == 0;

          id v2 = v12;
          if (v15) {
            v9 |= ![(DADaemonServer *)self _checkDevicesForAppDataURL:v13];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v8);

      if (v9)
      {
        long long v16 = self->_checkDevicesTimer;
        if (v16)
        {
          long long v17 = v16;
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            v21 = CUPrintDurationDouble();
            LogPrintF();
          }
          CUDispatchTimerSet();
          goto LABEL_33;
        }
        dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        objc_storeStrong((id *)&self->_checkDevicesTimer, v19);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000085B8;
        handler[3] = &unk_10003CA70;
        long long v17 = v19;
        long long v27 = v17;
        long long v28 = self;
        dispatch_source_set_event_handler(v17, handler);
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v22 = CUPrintDurationDouble();
          LogPrintF();
        }
        CUDispatchTimerSet();
        dispatch_activate(v17);
        uint64_t v20 = (OS_dispatch_source *)v27;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }
    else
    {
    }
    checkDevicesTimer = self->_checkDevicesTimer;
    if (checkDevicesTimer)
    {
      if (dword_100043408 >= 31)
      {
        long long v17 = checkDevicesTimer;
LABEL_27:
        dispatch_source_cancel(v17);
        uint64_t v20 = self->_checkDevicesTimer;
        self->_checkDevicesTimer = 0;
        goto LABEL_32;
      }
      if (dword_100043408 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      long long v17 = self->_checkDevicesTimer;
      if (v17) {
        goto LABEL_27;
      }
    }
  }
LABEL_34:

  ((void (*)(void *))v2[2])(v2);
  _Block_object_dispose(&v35, 8);
}

- (BOOL)_checkDevicesForAppDataURL:(id)a3
{
  id v4 = a3;
  id v76 = 0;
  id v5 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v4 error:&v76];
  id v6 = v76;
  id v7 = v6;
  if (v5)
  {
    id v59 = v4;
    long long v60 = v6;
    id v8 = [v4 lastPathComponent];
    int v9 = [v8 stringByDeletingPathExtension];

    double Current = CFAbsoluteTimeGetCurrent();
    CFDictionaryGetTypeID();
    id v65 = v5;
    CFDictionaryGetTypedValue();
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v70 = v75 = 0u;
    id obj = [v70 allKeys];
    id v69 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    id v11 = 0;
    id v12 = 0;
    if (!v69)
    {
      id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
      goto LABEL_73;
    }
    uint64_t v67 = *(void *)v73;
    id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
    while (1)
    {
      unsigned __int8 v14 = 0;
      do
      {
        if (*(void *)v73 != v67) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v14);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v17 = [v70 objectForKeyedSubscript:v15];
        if ((isKindOfClass & 1) == 0)
        {
          unsigned __int8 v25 = @"bad deviceID class";
          goto LABEL_51;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unsigned __int8 v25 = @"bad device info class";
          goto LABEL_51;
        }
        uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
        if (!(Int64Ranged << 32))
        {
          unsigned __int8 v25 = @"state unapproved";
          goto LABEL_51;
        }
        uint64_t v19 = (int)Int64Ranged;
        if ((int)Int64Ranged != 10 && (int)Int64Ranged != 30)
        {
          CFDictionaryGetDouble();
          if (self->_prefDeviceApprovedSeconds - (Current - v21) <= 0.0)
          {
            id v63 = [(DADaemonServer *)self _statefulDevicesForAppID:v9];
            uint64_t v22 = [v63 objectForKeyedSubscript:v15];
            id v23 = v22;
            if (v22) {
              [v22 setState:30];
            }
            v64 = -[DADaemonServer _updateStateForDiscoveryDeviceID:state:appID:](self, "_updateStateForDiscoveryDeviceID:state:appID:", v15, 30, v9, v54, v56, v58);
            if (!v23)
            {
              id v23 = objc_alloc_init((Class)DADevice);
              [v23 setIdentifier:v15];
            }
            int v24 = v13[258];
            if (v24 <= 30 && (v24 != -1 || _LogCategory_Initialize()))
            {
              id v55 = v9;
              id v56 = v23;
              LogPrintF();
            }
            id v62 = v23;
            [(DADaemonServer *)self _reportDeviceChanged:v23 appID:v9 discovery:v64 != 0];
            id v61 = [v70 objectForKeyedSubscript:v15];
            id v26 = [v61 mutableCopy];
            [v26 setObject:&off_10003E530 forKeyedSubscript:@"deviceState"];
            if (!v11) {
              id v11 = [v70 mutableCopy];
            }
            id v27 = [v26 copy:v55];
            [v11 setObject:v27 forKeyedSubscript:v15];

            if (!v12) {
              id v12 = [v65 mutableCopy];
            }
            [v12 setObject:v11 forKeyedSubscript:@"devices"];
            self->_deviceStateHasTransient = 1;

            id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
          }
        }
        if (v19 == 30 || v19 == 10)
        {
          CFDictionaryGetDouble();
          if (self->_prefDeviceApprovedSeconds - (Current - v29) <= 0.0)
          {
            unsigned __int8 v25 = @"expired";
LABEL_51:
            int v39 = v13[258];
            if (v39 <= 30 && (v39 != -1 || _LogCategory_Initialize()))
            {
              id v56 = v15;
              long long v58 = v25;
              id v54 = v9;
              LogPrintF();
            }
            if (!v11) {
              id v11 = [v70 mutableCopy];
            }
            [v11 setObject:0 forKeyedSubscript:v15];
            if (!v12) {
              id v12 = [v65 mutableCopy];
            }
            [v12 setObject:v11 forKeyedSubscript:@"devices"];
            [(DADaemonServer *)self _necpRemoveUUIDsForAppID:v9 deviceID:v15];
            uint64_t v40 = [(DADaemonServer *)self _updateStateForDiscoveryDeviceID:v15 state:0 appID:v9];
            id v41 = (id)v40;
            if (!v40)
            {
              id v41 = objc_alloc_init((Class)DADevice);
              [v41 setIdentifier:v15];
            }
            [(DADaemonServer *)self _reportRemovedDevice:v41 appID:v9 discovery:v40 != 0];

            id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
            goto LABEL_62;
          }
        }
        if (v19 == 30 || v19 == 10)
        {
          CFDictionaryGetDouble();
          if (Current - v31 >= self->_prefDeviceStateTimeoutSeconds + -1.0)
          {
            id v32 = objc_alloc((Class)NSString);
            v33 = DADeviceStateToString();
            unsigned __int8 v25 = (__CFString *)[v32 initWithFormat:@"state timeout: %@", v33];

            id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
            if (v25) {
              goto LABEL_51;
            }
          }
          self->_deviceStateHasTransient = 1;
        }
        deviceNECPValueStrings = self->_deviceNECPValueStrings;
        if (!deviceNECPValueStrings)
        {
          uint64_t v35 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          id v36 = self->_deviceNECPValueStrings;
          self->_deviceNECPValueStrings = v35;

          deviceNECPValueStrings = self->_deviceNECPValueStrings;
        }
        id v37 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@", v9, v15];
        [(NSMutableSet *)deviceNECPValueStrings addObject:v37];

        int v38 = v13[258];
        if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
        {
          CUPrintDurationDouble();
          unsigned __int8 v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v56 = v15;
          long long v58 = v25;
          id v54 = v9;
          LogPrintF();
LABEL_62:
        }
        unsigned __int8 v14 = (char *)v14 + 1;
      }
      while (v69 != v14);
      id v42 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
      id v69 = v42;
      if (!v42)
      {
LABEL_73:

        id v5 = v65;
        CFDictionaryGetTypeID();
        int64_t v44 = CFDictionaryGetTypedValue();
        id v45 = [v44 count];
        BOOL v43 = v45 == 0;
        if (v45)
        {
          int v46 = v13[258];
          id v4 = v59;
          if (v46 <= 30 && (v46 != -1 || _LogCategory_Initialize()))
          {
            [v44 count:v54];
            LogPrintF();
          }
          id v51 = v12;
          long long v52 = v51;
          if (v12 && ([v51 isEqual:v65] & 1) == 0) {
            [(DADaemonServer *)self _saveAppDataDict:v52 fileURL:v59];
          }

          goto LABEL_96;
        }
        id v47 = +[NSFileManager defaultManager];
        id v71 = v60;
        id v48 = v13;
        id v4 = v59;
        unsigned int v49 = [v47 removeItemAtURL:v59 error:&v71];
        id v68 = v71;

        int v50 = v48[258];
        if (v49)
        {
          if (v50 <= 30)
          {
            BOOL v43 = 1;
            if (v50 != -1 || _LogCategory_Initialize()) {
              LogPrintF();
            }
            long long v60 = v68;
LABEL_96:

            id v7 = v60;
LABEL_97:

            goto LABEL_98;
          }
LABEL_94:
          long long v60 = v68;
        }
        else
        {
          if (v50 > 90 || v50 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_94;
          }
          long long v57 = CUPrintNSError();
          LogPrintF();

          long long v60 = v68;
        }
        BOOL v43 = 1;
        goto LABEL_96;
      }
    }
  }
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    BOOL v43 = 1;
    goto LABEL_97;
  }
  BOOL v43 = 1;
LABEL_98:

  return v43;
}

- (BOOL)devicesPresentWithAppID:(id)a3
{
  int v3 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:a3];
  id v4 = [v3 deviceMap];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)getAuthorizedDevices:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v3, @"daappdata"];
  BOOL v5 = NSTemporaryDirectory();
  id v6 = +[NSURL fileURLWithPath:v5];
  id v7 = [v6 URLByAppendingPathComponent:v4 isDirectory:0];

  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v7 error:0];
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v8)
  {
    CFDictionaryGetTypeID();
    int v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000091C4;
      v14[3] = &unk_10003CC78;
      id v15 = objc_alloc_init((Class)NSMutableArray);
      id v10 = v15;
      [v9 enumerateKeysAndObjectsUsingBlock:v14];
      id v11 = &__NSArray0__struct;
      if (v10) {
        id v11 = v10;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)modifyDeviceIdentifier:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    unsigned __int8 v25 = a6;
    id v26 = v11;
    uint64_t v16 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v19 = [v18 identifier];
        unsigned int v20 = [v19 isEqualToString:v10];

        if (v20)
        {
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v23 = v12;
            int v24 = v18;
            LogPrintF();
          }
          id v11 = v26;
          BOOL v21 = -[DADaemonServer modifyAccessoryDevice:session:settings:error:](self, "modifyAccessoryDevice:session:settings:error:", v18, v26, v12, v25, v23, v24);
          goto LABEL_16;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    BOOL v21 = 1;
    id v11 = v26;
  }
  else
  {
    BOOL v21 = 1;
  }
LABEL_16:

  return v21;
}

- (id)generateImageURLForDevice:(id)a3
{
  uint64_t v31 = 0;
  id v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100003B10;
  uint64_t v35 = sub_100003B20;
  id v36 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100009864;
  v28[3] = &unk_10003CC00;
  long long v30 = &v31;
  id v3 = a3;
  id v29 = v3;
  id v4 = objc_retainBlock(v28);
  BOOL v5 = [v3 identifier];
  if (![v5 length])
  {
    uint64_t v20 = DAErrorF();
    id v21 = v32[5];
    v32[5] = (id)v20;

LABEL_15:
    uint64_t v19 = 0;
    goto LABEL_16;
  }
  obj[1] = (id)1;
  id v6 = (void *)container_system_group_path_for_identifier();
  if (!v6) {
    goto LABEL_15;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    int v24 = v6;
    LogPrintF();
  }
  id v7 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v6, 1, 0, v24);
  free(v6);
  if (!v7) {
    goto LABEL_15;
  }
  id v26 = v4;
  id v8 = [v7 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
  int v9 = [v8 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
  uint64_t v10 = [v9 path];
  id v11 = (void *)v10;
  if (v9 && v10)
  {
    unsigned __int8 v25 = v8;
    id v12 = [v9 URLByAppendingPathComponent:@"DADevices" isDirectory:1];
    id v13 = +[NSFileManager defaultManager];
    id v14 = v32 + 5;
    obj[0] = v32[5];
    unsigned __int8 v15 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:obj];
    objc_storeStrong(v14, obj[0]);

    if (v15)
    {
      uint64_t v16 = [v12 path];
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%@-Image.%@", v5, @"dadeviceimagedata"];
      long long v18 = +[NSURL fileURLWithPath:v16];
      uint64_t v19 = [v18 URLByAppendingPathComponent:v17 isDirectory:0];
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v8 = v25;
    id v4 = v26;
  }
  else
  {
    uint64_t v23 = DAErrorF();
    uint64_t v19 = 0;
    id v12 = v32[5];
    v32[5] = (id)v23;
  }

LABEL_16:
  ((void (*)(void *))v4[2])(v4);

  _Block_object_dispose(&v31, 8);

  return v19;
}

- (id)appAccessInfoForDeviceID:(id)a3 appID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v39[1] = (id)1;
  id v7 = (id)container_system_group_path_for_identifier();
  if (v7)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v30 = v7;
      LogPrintF();
    }
    id v8 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 1, 0, v30);
    free(v7);
    if (v8)
    {
      int v9 = [v8 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
      uint64_t v10 = [v9 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
      id v11 = [v10 URLByAppendingPathComponent:@"AppAccessInfos" isDirectory:1];
      id v12 = [v11 path];
      id v13 = CBGenerateObfuscatedSHA256HashedString();
      id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v13, @"daappInfodata"];
      unsigned __int8 v15 = +[NSURL fileURLWithPath:v12];
      id v37 = v14;
      uint64_t v16 = [v15 URLByAppendingPathComponent:v14 isDirectory:0];

      v39[0] = 0;
      id v36 = (void *)v16;
      id v17 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v16 error:v39];
      id v18 = v39[0];
      id v34 = v13;
      uint64_t v35 = v17;
      if (v17)
      {
        CFDictionaryGetTypeID();
        uint64_t v19 = CFDictionaryGetTypedValue();
        uint64_t v20 = v19;
        uint64_t v33 = v12;
        if (v19)
        {
          id v32 = v11;
          id v21 = v10;
          uint64_t v22 = v8;
          uint64_t v23 = v9;
          id v24 = v6;
          id v25 = v5;
          id v26 = [v19 objectForKeyedSubscript:v5];
          id v38 = v18;
          id v7 = [objc_alloc((Class)DADeviceAppAccessInfo) initWithPersistentDictionaryRepresentation:v26 error:&v38];
          id v27 = v38;

          if (v7)
          {
            id v28 = v7;
          }
          else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v31 = CUPrintNSError();
            LogPrintF();
          }
          id v18 = v27;
          id v5 = v25;
          id v6 = v24;
          int v9 = v23;
          id v8 = v22;
          uint64_t v10 = v21;
          id v11 = v32;
          goto LABEL_12;
        }
        if (dword_100043408 <= 90)
        {
          if (dword_100043408 == -1 && !_LogCategory_Initialize())
          {
            id v7 = 0;
            goto LABEL_13;
          }
          id v26 = CUPrintNSError();
          LogPrintF();
          id v7 = 0;
LABEL_12:

LABEL_13:
          id v12 = v33;
LABEL_14:

LABEL_15:
          id v13 = v34;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        if (dword_100043408 > 90)
        {
          id v7 = 0;
          goto LABEL_16;
        }
        if (dword_100043408 == -1 && !_LogCategory_Initialize())
        {
          id v7 = 0;
          goto LABEL_15;
        }
        uint64_t v20 = CUPrintNSError();
        LogPrintF();
      }
      id v7 = 0;
      goto LABEL_14;
    }
    id v7 = 0;
  }
LABEL_17:

  return v7;
}

- (id)getDevicesWithFlags:(unint64_t)a3 appID:(id)a4
{
  id v58 = a4;
  uint64_t v87 = 0;
  v88 = (id *)&v87;
  uint64_t v89 = 0x3032000000;
  v90 = sub_100003B10;
  v91 = sub_100003B20;
  id v92 = 0;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10000A804;
  v86[3] = &unk_10003CAE8;
  v86[4] = &v87;
  id v56 = objc_retainBlock(v86);
  obj[1] = (id)1;
  id v4 = (void *)container_system_group_path_for_identifier();
  if (!v4) {
    goto LABEL_12;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v47 = v4;
    LogPrintF();
  }
  id v5 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0, v47);
  free(v4);
  if (!v5)
  {
LABEL_12:
    uint64_t v15 = DANestedErrorF();
    id v59 = 0;
    id v16 = v88[5];
    v88[5] = (id)v15;
    goto LABEL_47;
  }
  int v50 = v5;
  unsigned int v49 = [v5 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
  long long v57 = [v49 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
  id v62 = +[NSMutableDictionary dictionary];
  id v48 = [v57 URLByAppendingPathComponent:@"AppAccessInfos" isDirectory:1];
  id v54 = [v48 path];
  if (!v58)
  {
    long long v53 = +[NSFileManager defaultManager];
    id v17 = +[NSURL fileURLWithPath:v54];
    id v18 = v88 + 5;
    id v81 = v88[5];
    uint64_t v19 = [v53 contentsOfDirectoryAtURL:v17 includingPropertiesForKeys:0 options:4 error:&v81];
    objc_storeStrong(v18, v81);

    if (!v19)
    {
      id v59 = 0;
LABEL_45:

      goto LABEL_46;
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v77 objects:v94 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v78;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v78 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:*(void *)(*((void *)&v77 + 1) + 8 * i)];
          if (v24)
          {
            CFStringGetTypeID();
            id v25 = CFDictionaryGetTypedValue();
            if (v25)
            {
              CFDictionaryGetTypeID();
              id v26 = CFDictionaryGetTypedValue();
              v73[0] = _NSConcreteStackBlock;
              v73[1] = 3221225472;
              v73[2] = sub_10000A9E0;
              v73[3] = &unk_10003CCC8;
              id v74 = v62;
              id v76 = &v87;
              id v27 = v25;
              id v75 = v27;
              [v26 enumerateKeysAndObjectsUsingBlock:v73];
            }
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v77 objects:v94 count:16];
      }
      while (v21);
    }

LABEL_25:
    long long v53 = [v57 URLByAppendingPathComponent:@"DADevices" isDirectory:1];
    long long v52 = [v53 path];
    id v51 = +[NSFileManager defaultManager];
    id v28 = +[NSURL fileURLWithPath:v52];
    id v29 = v88 + 5;
    id v72 = v88[5];
    id v55 = [v51 contentsOfDirectoryAtURL:v28 includingPropertiesForKeys:0 options:4 error:&v72];
    objc_storeStrong(v29, v72);

    if (v55)
    {
      id v59 = +[NSMutableArray array];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v60 = v55;
      id v30 = [v60 countByEnumeratingWithState:&v68 objects:v93 count:16];
      if (v30)
      {
        uint64_t v63 = *(void *)v69;
        do
        {
          uint64_t v31 = 0;
          id v64 = v30;
          do
          {
            if (*(void *)v69 != v63) {
              objc_enumerationMutation(v60);
            }
            id v32 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v31);
            id v67 = 0;
            [v32 getResourceValue:&v67 forKey:NSURLNameKey error:0];
            id v34 = v67;
            id v66 = 0;
            [v32 getResourceValue:&v66 forKey:NSURLIsDirectoryKey error:0];
            id v35 = v66;
            if (([v35 BOOLValue] & 1) == 0)
            {
              uint64_t v36 = [v32 lastPathComponent];
              id v37 = [(id)v36 stringByDeletingPathExtension];

              id v38 = [v62 objectForKeyedSubscript:v37];
              LOBYTE(v36) = v38 == 0;

              if ((v36 & 1) == 0)
              {
                int v39 = [v32 path];
                uint64_t v40 = +[NSURL fileURLWithPath:v39];
                id v41 = +[NSDictionary dictionaryWithContentsOfURL:v40];
                id v42 = objc_alloc((Class)DADevice);
                id v65 = 0;
                id v43 = [v42 initWithPersistentDictionaryRepresentation:v41 error:&v65];
                id v61 = v65;
                if (v43)
                {
                  int64_t v44 = [v62 objectForKeyedSubscript:v37];
                  [v43 setAppAccessInfoDeviceMap:v44];

                  [v59 addObject:v43];
                }
                else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
              }
            }

            uint64_t v31 = (char *)v31 + 1;
          }
          while (v64 != v31);
          id v30 = [v60 countByEnumeratingWithState:&v68 objects:v93 count:16];
        }
        while (v30);
      }
    }
    else
    {
      id v59 = 0;
    }

    goto LABEL_45;
  }
  id v6 = v58;
  id v7 = CBGenerateObfuscatedSHA256HashedString();
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v7, @"daappInfodata"];
  int v9 = +[NSURL fileURLWithPath:v54];
  uint64_t v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];

  id v11 = objc_alloc((Class)NSDictionary);
  id v12 = v88 + 5;
  obj[0] = v88[5];
  id v13 = [v11 initWithContentsOfURL:v10 error:obj];
  objc_storeStrong(v12, obj[0]);
  if (v13)
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10000A8C8;
    v82[3] = &unk_10003CCA0;
    id v83 = v62;
    v84 = &v87;
    [v14 enumerateKeysAndObjectsUsingBlock:v82];
  }
  else
  {
    uint64_t v46 = DANestedErrorF();
    id v14 = v88[5];
    v88[5] = (id)v46;
  }

  if (v13) {
    goto LABEL_25;
  }
  id v59 = 0;
LABEL_46:

  id v16 = v50;
LABEL_47:

  ((void (*)(void *))v56[2])(v56);
  _Block_object_dispose(&v87, 8);

  return v59;
}

- (void)reportAuthorizedDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(DADaemonServer *)self getAuthorizedDevices:v4];
  id v6 = v5;
  if (v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identifier];
          if (v11) {
            id v12 = [(DADaemonServer *)self _updateStateForDiscoveryDeviceID:v11 state:25 appID:v4];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          [v18 setState:25];
          [(DADaemonServer *)self _reportDeviceChanged:v18 appID:v4 discovery:0];
        }
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }
  }
  else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = self->_xpcConnections;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) reportDeviceChanged:v8 appID:v9 discovery:v5];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  id v15 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v9];
  uint64_t v16 = [v15 discoveryObj];
  id v17 = [v16 configuration];
  id v18 = [v17 bundleID];
  unsigned __int8 v19 = [v18 isEqualToString:v9];

  long long v20 = [v15 discoveryObj];
  long long v21 = v20;
  if (v19) {
    goto LABEL_11;
  }
  long long v22 = [v20 bundleID];
  unsigned int v23 = [v22 isEqualToString:v9];

  if (v23)
  {
    long long v21 = [v15 discoveryObj];
LABEL_11:
    [v21 reportDeviceChanged:v8 appID:v9];
  }
}

- (void)_reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) reportDevicesPresentChanged:v4 appID:v6];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_reportDevicesPresentChanged:(BOOL)a3 migrated:(BOOL)a4 appID:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) reportDevicesPresentChanged:v5 appID:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_xpcConnections;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) reportRemovedDevice:v8 appID:v9 discovery:(void)v15];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_discoveryMap;
  id v9 = [v6 bundleIdentifier];
  id v10 = [(NSMutableDictionary *)v8 objectForKey:v9];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v22 = v7;
    LogPrintF();
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100003B10;
  uint64_t v33 = sub_100003B20;
  id v34 = 0;
  if (v10)
  {
    id v11 = [v10 discoverySet];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000B638;
    v25[3] = &unk_10003CD18;
    id v12 = v6;
    id v26 = v12;
    id v27 = v7;
    id v28 = &v29;
    [v11 enumerateObjectsUsingBlock:v25];

    uint64_t v13 = (void *)v30[5];
    if (v13)
    {
      long long v14 = [v13 bluetoothIdentifier];
      BOOL v15 = v14 == 0;

      if (!v15 || [v12 state] == (id)25 || objc_msgSend(v12, "state") == (id)10)
      {
        long long v16 = [v12 bundleIdentifier];
        BOOL v17 = (id)[(DADaemonServer *)self _applicationHasBluetoothGlobalTCC:v16] == (id)1;

        if (!v17)
        {
          if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            unsigned int v23 = [v12 bundleIdentifier];
            LogPrintF();
          }
          long long v20 = [v12 bundleIdentifier:v23];
          v35[0] = kTCCSetNoKill;
          v35[1] = kTCCResetSyncAuth;
          v36[0] = &__kCFBooleanTrue;
          v36[1] = &__kCFBooleanTrue;
          +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
          int v21 = TCCAccessResetForBundleIdWithOptions();

          if (v21)
          {
            BOOL v18 = 1;
            goto LABEL_12;
          }
          if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            long long v24 = [(id)v30[5] bundleID];
            LogPrintF();
          }
        }
      }
    }
  }
  BOOL v18 = 0;
LABEL_12:
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (void)_scheduleCheckAppAccessInfo
{
  if (!self->_checkAppAccessInfoScheduled)
  {
    self->_checkAppAccessInfoScheduled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B978;
    block[3] = &unk_10003C950;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_scheduleCheckDevices
{
  if (!self->_checkDevicesScheduled)
  {
    self->_checkDevicesScheduled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BA0C;
    block[3] = &unk_10003C950;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_saveAppDataDict:(id)a3 fileURL:(id)a4
{
  id v5 = a4;
  id v13 = 0;
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v13];
  id v7 = v13;
  id v8 = [v5 lastPathComponent];
  id v9 = [v8 stringByDeletingPathExtension];

  if (v6)
  {
    id v12 = v7;
    unsigned __int8 v10 = [v6 writeToURL:v5 options:1073741825 error:&v12];
    id v11 = v12;

    if (v10)
    {
      if (dword_100043408 > 30 || dword_100043408 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_7;
      }
    }
    else if (dword_100043408 > 90 || dword_100043408 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_7;
    }
    LogPrintF();
LABEL_7:
    id v7 = v11;
    goto LABEL_8;
  }
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_8:
}

- (BOOL)saveDevice:(id)a3 session:(id)a4 allowCreate:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v86 = a3;
  id v78 = a4;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x2020000000;
  int v105 = 0;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  int v101 = 0;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10000CAFC;
  v97[3] = &unk_10003CD68;
  v97[5] = &v102;
  v97[6] = &v98;
  long long v77 = self;
  v97[4] = self;
  id v74 = objc_retainBlock(v97);
  v82 = [v78 bundleID];
  if ([v82 length])
  {
    uint64_t v89 = [v86 identifier];
    if (![v89 length])
    {
      if (a6)
      {
        DAErrorF();
        BOOL v51 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v51 = 0;
      }
      goto LABEL_104;
    }
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v82, @"daappdata"];
    unsigned __int8 v10 = NSTemporaryDirectory();
    id v11 = +[NSURL fileURLWithPath:v10];
    long long v80 = [v11 URLByAppendingPathComponent:v9 isDirectory:0];
    long long v73 = v9;

    id v96 = 0;
    id v12 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v80 error:&v96];
    id v75 = v96;
    id v81 = v12;
    if (!v12 && !v6)
    {
      if (a6)
      {
        DANestedErrorF();
        BOOL v51 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v51 = 0;
      }
      goto LABEL_103;
    }
    id v13 = [v12 mutableCopy];
    long long v14 = v13;
    if (v13) {
      id v84 = v13;
    }
    else {
      id v84 = objc_alloc_init((Class)NSMutableDictionary);
    }

    CFDictionaryGetTypeID();
    id v76 = CFDictionaryGetTypedValue();
    if (!v76 && !v6)
    {
      if (a6)
      {
        DAErrorF();
        BOOL v51 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v51 = 0;
      }
      goto LABEL_102;
    }
    id v15 = [v76 mutableCopy];
    long long v16 = v15;
    if (v15) {
      id v88 = v15;
    }
    else {
      id v88 = objc_alloc_init((Class)NSMutableDictionary);
    }

    id v83 = [v88 objectForKeyedSubscript:v89];
    if (!v83 && !v6)
    {
      if (a6)
      {
        DAErrorF();
        BOOL v51 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v51 = 0;
      }
      goto LABEL_101;
    }
    id v17 = [v83 mutableCopy];
    BOOL v18 = v17;
    if (v17) {
      id v85 = v17;
    }
    else {
      id v85 = objc_alloc_init((Class)NSMutableDictionary);
    }

    unsigned __int8 v19 = NSDictionaryGetNSNumber();
    id v72 = [v19 integerValue];

    id v79 = [v86 state];
    double Current = CFAbsoluteTimeGetCurrent();
    double v21 = Current;
    if (v6)
    {
      if (v79)
      {
        [v86 setApproveTime:Current];
        id v22 = [v86 networkEndpoint];
        if (v22 && dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          int has_signature = nw_endpoint_has_signature();
          long long v24 = "no";
          if (has_signature) {
            long long v24 = "yes";
          }
          id v68 = v86;
          long long v69 = v82;
          id v65 = v24;
          LogPrintF();
        }
        id v27 = [v86 persistentDictionaryRepresentation:v65 withKey:v68 withKey:v69];
        id v28 = [v27 mutableCopy];

        id v85 = v28;
        goto LABEL_35;
      }
LABEL_32:
      char v71 = 1;
      id v26 = v85;
      id v85 = 0;
LABEL_46:

      [v88 setObject:v85 forKeyedSubscript:v89];
      goto LABEL_47;
    }
    CFDictionaryGetDouble();
    if (v77->_prefDeviceApprovedSeconds - (v21 - v25) <= 0.0 && v79)
    {
      if (a6)
      {
        DAErrorF();
        BOOL v51 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_100;
      }
      goto LABEL_136;
    }
    if (v72)
    {
      if (!v79) {
        goto LABEL_32;
      }
      if (v79 != (id)10)
      {
        id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
        [v85 setObject:v22 forKeyedSubscript:@"deviceState"];
LABEL_35:

        if (!v85)
        {
          id v85 = 0;
          char v71 = 1;
          [v88 setObject:0 forKeyedSubscript:v89];
LABEL_47:
          if ([v86 state] == (id)20 && objc_msgSend(v86, "supportsGrouping"))
          {
            ++*((_DWORD *)v103 + 6);
            ++*((_DWORD *)v99 + 6);
            long long v94 = 0u;
            long long v95 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            id v32 = [v88 allKeys];
            id v33 = [v32 countByEnumeratingWithState:&v92 objects:v106 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v93;
              id obj = v32;
              do
              {
                for (i = 0; i != v33; i = (char *)i + 1)
                {
                  if (*(void *)v93 != v34) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v36 = *(void **)(*((void *)&v92 + 1) + 8 * i);
                  if (([v36 isEqualToString:v89] & 1) == 0)
                  {
                    id v37 = [v88 objectForKeyedSubscript:v36];
                    CFStringGetTypeID();
                    id v38 = CFDictionaryGetTypedValue();
                    uint64_t Int64 = CFDictionaryGetInt64();
                    int Int64Ranged = CFDictionaryGetInt64Ranged();
                    if (Int64)
                    {
                      int v41 = Int64Ranged;
                      id v42 = [v86 protocolType];
                      id v43 = [v42 identifier];
                      unsigned int v44 = [v38 isEqualToString:v43];

                      if (v44)
                      {
                        ++*((_DWORD *)v103 + 6);
                        if (v41 == 20)
                        {
                          id v45 = [v37 mutableCopy];
                          uint64_t v46 = +[NSNumber numberWithDouble:v21];
                          [v45 setObject:v46 forKeyedSubscript:@"approveTime"];

                          [v88 setObject:v45 forKeyedSubscript:v36];
                          ++*((_DWORD *)v99 + 6);
                        }
                      }
                    }
                  }
                }
                id v32 = obj;
                id v33 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
              }
              while (v33);
            }
          }
          [v84 setObject:v88 forKeyedSubscript:@"devices"];
          if ([v84 isEqual:v81])
          {
            if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            BOOL v51 = 1;
            goto LABEL_100;
          }
          id v91 = 0;
          id v47 = +[NSPropertyListSerialization dataWithPropertyList:v84 format:200 options:0 error:&v91];
          id v48 = v91;

          if (!v47)
          {
            if (a6)
            {
              DANestedErrorF();
              BOOL v51 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v51 = 0;
            }
            goto LABEL_99;
          }
          id v90 = v48;
          unsigned __int8 v49 = [v47 writeToURL:v80 options:1073741825 error:&v90];
          id v50 = v90;

          if ((v49 & 1) == 0)
          {
            if (a6)
            {
              DANestedErrorF();
              BOOL v51 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v51 = 0;
            }
LABEL_98:
            id v48 = v50;
LABEL_99:

            id v75 = v48;
LABEL_100:

LABEL_101:
LABEL_102:

LABEL_103:
LABEL_104:

            goto LABEL_105;
          }
          if (v71)
          {
            if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
LABEL_75:
              id v65 = (const char *)v78;
              id v68 = v86;
              LogPrintF();
            }
          }
          else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_75;
          }
          -[DADaemonServer _necpUpdateUUIDForAppID:device:](v77, "_necpUpdateUUIDForAppID:device:", v82, v86, v65, v68);
          [(DADaemonServer *)v77 _scheduleCheckDevices];
          uint64_t v52 = [(DADaemonServer *)v77 _updateStateForDiscoveryDeviceID:v89 state:v79 appID:v82];
          long long v53 = (void *)v52;
          if (v52) {
            id v54 = (id)v52;
          }
          else {
            id v54 = v86;
          }
          [(DADaemonServer *)v77 _reportDeviceChanged:v54 appID:v82 discovery:v52 != 0];
          id v55 = [(NSMutableDictionary *)v77->_discoveryMap objectForKeyedSubscript:v82];
          id v56 = [v55 deviceMap];
          long long v57 = v56;
          if (v56)
          {
            id v58 = [v56 count];
            id v59 = [v57 objectForKeyedSubscript:v89];
            if (v72 == (id)20 && v79 != (id)20)
            {
              id v60 = [v57 objectForKeyedSubscript:v89];
              unsigned int v61 = [v60 pendingRemoval];

              if (v61)
              {
                if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  id v66 = v59;
                  LogPrintF();
                }
                id v62 = [objc_alloc((Class)DADeviceEvent) initWithEventType:41 device:v59];
                [(DADaemonServer *)v77 _reportDiscoveryEvent:v62 appID:v82];
                [v57 setObject:0 forKeyedSubscript:v89];
              }
            }
            id v63 = [v57 count:v66];
            if (v58 && !v63) {
              [(DADaemonServer *)v77 _reportDevicesPresentChanged:0 appID:v82];
            }
          }
          BOOL v51 = 1;
          goto LABEL_98;
        }
        if (v79 == (id)30 || v79 == (id)10)
        {
          CFDictionaryGetDouble();
          if (v29 == 0.0) {
            CFDictionarySetDouble();
          }
        }
        else
        {
          [v85 setObject:0 forKeyedSubscript:@"deviceStateStartTime"];
        }
        CFStringGetTypeID();
        id v26 = CFDictionaryGetTypedValue();
        CFStringGetTypeID();
        uint64_t v30 = CFDictionaryGetTypedValue();
        uint64_t v31 = (void *)v30;
        if (!v26 || !v30 || ([v26 isEqualToString:v30] & 1) != 0)
        {

          char v71 = 0;
          goto LABEL_46;
        }
        if (a6)
        {
          DANestedErrorF();
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_136:
        BOOL v51 = 0;
        goto LABEL_100;
      }
      if (!a6) {
        goto LABEL_136;
      }
    }
    else if (!a6)
    {
      goto LABEL_136;
    }
    id v67 = DADeviceStateToString();
    DAErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_136;
  }
  if (a6)
  {
    DAErrorF();
    BOOL v51 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v51 = 0;
  }
LABEL_105:

  ((void (*)(void *))v74[2])(v74);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);

  return v51;
}

- (id)_saveDeviceAppAccessInfo:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = [v8 bundleIdentifier];
  if ([v10 length])
  {
    id v11 = [v8 deviceIdentifier];
    if ([v11 length])
    {
      unint64_t v12 = [(DADaemonServer *)self appBundleInfoAccessoryOptions:v10];
      error[1] = (CFErrorRef)1;
      uint64_t v13 = container_system_group_path_for_identifier();
      if (v13)
      {
        long long v14 = (void *)v13;
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v72 = v14;
          LogPrintF();
        }
        id v91 = a5;
        id v15 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 1, 0, v72);
        free(v14);
        if (v15)
        {
          CFURLRef v16 = [v15 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
          if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            CFURLRef v73 = 0;
            LogPrintF();
          }
          id v81 = self;
          error[0] = 0;
          if (!CFURLSetResourcePropertyForKey(v16, _kCFURLIsExcludedFromUnencryptedBackupKey, kCFBooleanTrue, error)
            && dword_100043408 <= 90
            && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSError();
            v77 = CFURLRef v73 = v16;
            LogPrintF();
          }
          id v102 = 0;
          -[__CFURL setResourceValue:forKey:error:](v16, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, &v102, v73, v77);
          id v17 = v102;
          CFURLRef v18 = v16;
          id v19 = v17;
          CFURLRef v90 = v18;
          long long v20 = [(__CFURL *)v18 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
          id v96 = [v20 URLByAppendingPathComponent:@"AppAccessInfos" isDirectory:1];
          id v101 = v19;
          [v20 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:&v101];
          id v21 = v101;

          id v100 = 0;
          id v99 = 0;
          uint64_t v89 = v20;
          [v20 getResourceValue:&v100 forKey:NSURLIsExcludedFromBackupKey error:&v99];
          id v22 = v100;
          id v23 = v99;

          if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v74 = v22;
            id v78 = v23;
            LogPrintF();
          }
          id v88 = v22;
          long long v24 = v96;
          [v96 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:v74, v78];
          double v25 = +[NSFileManager defaultManager];
          unsigned int v26 = [v25 createDirectoryAtURL:v96 withIntermediateDirectories:1 attributes:0 error:v91];

          if (!v26)
          {
            id v63 = 0;
            uint64_t v52 = v89;
            CFURLRef v70 = v90;
            goto LABEL_94;
          }
          uint64_t v27 = [v96 path];
          id v84 = CBGenerateObfuscatedSHA256HashedString();
          id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v84, @"daappInfodata"];
          id v85 = (void *)v27;
          double v29 = +[NSURL fileURLWithPath:v27];
          id v83 = v28;
          uint64_t v30 = [v29 URLByAppendingPathComponent:v28 isDirectory:0];

          long long v92 = (void *)v30;
          id v95 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v30 error:0];
          id v31 = [v95 mutableCopy];
          id v32 = v31;
          if (v31) {
            id v33 = v31;
          }
          else {
            id v33 = objc_alloc_init((Class)NSMutableDictionary);
          }
          uint64_t v34 = v33;

          CFDictionaryGetTypeID();
          v82 = CFDictionaryGetTypedValue();
          id v35 = [v82 mutableCopy];
          uint64_t v36 = v35;
          id v86 = v23;
          if (v35) {
            id v37 = v35;
          }
          else {
            id v37 = objc_alloc_init((Class)NSMutableDictionary);
          }
          id v38 = v37;

          long long v93 = v11;
          int v39 = [v38 objectForKeyedSubscript:v11];
          id v40 = [v39 mutableCopy];
          int v41 = v40;
          id v94 = v9;
          uint64_t v87 = v15;
          if (v40) {
            id v42 = v40;
          }
          else {
            id v42 = objc_alloc_init((Class)NSMutableDictionary);
          }
          id v43 = v42;

          double Current = CFAbsoluteTimeGetCurrent();
          id v45 = [v8 state];
          uint64_t v46 = NSDictionaryGetNSNumber();
          id v47 = [v46 integerValue];

          if (v45 && v12)
          {
            if (v45 != (id)10 || v47 == (id)10)
            {
              unsigned __int8 v49 = [v8 accessoryOptions];
              if ((v49 & 1) != 0 && (v12 & 1) == 0)
              {
                [v8 setAccessoryOptions:((unint64_t)[v8 accessoryOptions] & 0xFFFFFFFFFFFFFFFELL)];
                if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  id v75 = v8;
                  LogPrintF();
                }
              }
              if ((v49 & 2) == 0 || (v12 & 2) != 0)
              {
                id v9 = v94;
              }
              else
              {
                [v8 setAccessoryOptions:((unint64_t)[v8 accessoryOptions] & 0xFFFFFFFFFFFFFFFDLL)];
                id v9 = v94;
                if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  id v75 = v8;
                  LogPrintF();
                }
              }
            }
            else
            {
              [v8 setAccessoryOptions:v12];
              id v9 = v94;
              id v45 = [(DADaemonServer *)v81 _updateDeviceStateForWifi:v94 currentState:[(DADaemonServer *)v81 _updateDeviceStateForBluetooth:v8 device:v94]];
            }
            [v8 setApproveTime:Current, v75];
            [v8 setState:v45];
            id v50 = [v9 discoveryConfiguration];
            if (v50) {
              [v8 setAppDiscoveryConfiguration:v50];
            }

            BOOL v51 = [v8 persistentDictionaryRepresentation];
            id v48 = [v51 mutableCopy];

            if (v12)
            {
              unsigned int v60 = [(DADaemonServer *)v81 revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:v8 device:v9];
              id v11 = v93;
              if (dword_100043408 <= 50)
              {
                unsigned int v61 = v60;
                if (dword_100043408 != -1 || _LogCategory_Initialize())
                {
                  id v62 = "no";
                  if (v61) {
                    id v62 = "yes";
                  }
                  id v75 = v8;
                  id v79 = v9;
                  long long v80 = v62;
                  LogPrintF();
                }
              }
LABEL_54:
              [v38 setObject:v48 forKeyedSubscript:v11];
              [v34 setObject:v38 forKeyedSubscript:@"devices"];
              [v34 setObject:v10 forKeyedSubscript:@"bundleID"];
              if ([v34 isEqual:v95])
              {
                uint64_t v52 = v89;
                if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }
                id v63 = v8;
                goto LABEL_93;
              }
              if (v48)
              {
                long long v53 = [v9 discoveryConfiguration];
                id v54 = [v53 bluetoothIdentifier];

                if (v54)
                {
                  id v55 = [v9 discoveryConfiguration];
                  id v56 = [v55 bluetoothIdentifier];

                  cbCentralManager = v81->_cbCentralManager;
                  uint64_t v104 = v56;
                  id v58 = +[NSArray arrayWithObjects:&v104 count:1];
                  id v59 = [(CBCentralManager *)cbCentralManager retrievePeripheralsWithIdentifiers:v58];

                  if (v59 && [v59 count])
                  {
                    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                    {
                      id v76 = v59;
                      LogPrintF();
                    }
                    id v64 = [v59 firstObject:v76];
                    [v64 tag:@"DA_ASK_RETAIN_DEVICE"];
                  }
                }
              }
              id v98 = 0;
              id v65 = +[NSPropertyListSerialization dataWithPropertyList:v34 format:200 options:0 error:&v98];
              id v66 = v98;
              id v67 = v66;
              if (!v65)
              {
                if (v91)
                {
                  DANestedErrorF();
                  id v63 = 0;
                  *id v91 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v63 = 0;
                }
                id v69 = v67;
                id v9 = v94;
                goto LABEL_92;
              }
              id v97 = v66;
              unsigned __int8 v68 = [v65 writeToURL:v92 options:1073741825 error:&v97];
              id v69 = v97;

              if (v68)
              {
                id v9 = v94;
                if (v48)
                {
                  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
                    LogPrintF();
                  }
                  id v63 = [objc_alloc((Class)DADeviceAppAccessInfo) initWithPersistentDictionaryRepresentation:v48 error:v91];
                  goto LABEL_92;
                }
                if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }
              }
              else
              {
                id v9 = v94;
                if (v91)
                {
                  DANestedErrorF();
                  id v63 = 0;
                  *id v91 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_92;
                }
              }
              id v63 = 0;
LABEL_92:

              id v11 = v93;
              uint64_t v52 = v89;
LABEL_93:

              id v23 = v86;
              id v15 = v87;
              CFURLRef v70 = v90;
              long long v24 = v96;
LABEL_94:

LABEL_100:
              goto LABEL_101;
            }
          }
          else
          {

            id v48 = 0;
            id v9 = v94;
          }
          id v11 = v93;
          goto LABEL_54;
        }
      }
    }
    else if (a5)
    {
      DAErrorF();
      id v63 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_100;
    }
    id v63 = 0;
    goto LABEL_100;
  }
  if (a5)
  {
    DAErrorF();
    id v63 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v63 = 0;
  }
LABEL_101:

  return v63;
}

- (BOOL)modifyAccessoryDevice:(id)a3 session:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [v10 bundleID];
  uint64_t v13 = [v9 identifier];
  if ([v13 length])
  {
    v105[1] = (id)1;
    long long v14 = (void *)container_system_group_path_for_identifier();
    if (v14)
    {
      id v96 = v10;
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        id v75 = v14;
        LogPrintF();
      }
      id v15 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 1, 0, v75);
      free(v14);
      if (!v15)
      {
        LOBYTE(v14) = 0;
        goto LABEL_112;
      }
      id v95 = [v15 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
      CFURLRef v16 = [v95 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
      id v17 = [v16 path];
      id v94 = v16;
      if (!v16 || !v17)
      {
        if (a6)
        {
          id v74 = v17;
          DAErrorF();
          LOBYTE(v14) = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          id v17 = v74;
        }
        else
        {
          LOBYTE(v14) = 0;
        }
        goto LABEL_111;
      }
      id v93 = v17;
      CFURLRef v18 = [v16 URLByAppendingPathComponent:@"DADevices" isDirectory:1];
      id v19 = +[NSFileManager defaultManager];
      long long v80 = a6;
      unsigned int v20 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:a6];

      if (!v20)
      {
        LOBYTE(v14) = 0;
        goto LABEL_110;
      }
      id v102 = v18;
      uint64_t v21 = [v18 path];
      id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v13, @"dadevicedata"];
      id v91 = (void *)v21;
      id v23 = +[NSURL fileURLWithPath:v21];
      CFURLRef v90 = v22;
      long long v24 = [v23 URLByAppendingPathComponent:v22 isDirectory:0];

      uint64_t v25 = [v24 path];
      unsigned int v26 = [v9 appAccessInfoMap];
      uint64_t v27 = [v26 objectForKeyedSubscript:v12];

      uint64_t v104 = v27;
      id v101 = [v27 appDiscoveryConfiguration];
      id v28 = +[NSFileManager defaultManager];
      id v88 = (void *)v25;
      LODWORD(v25) = [v28 fileExistsAtPath:v25];

      long long v92 = v15;
      if (v25)
      {
        id v29 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v24 error:0];
      }
      else
      {
        id v29 = 0;
      }
      uint64_t v89 = v24;
      long long v14 = [v9 appAccessInfoMap];
      uint64_t v30 = [v14 objectForKeyedSubscript:v12];
      id v31 = [v30 state];

      LOBYTE(v14) = 1;
      if (!v29)
      {
        CFURLRef v18 = v102;
        goto LABEL_109;
      }
      CFURLRef v18 = v102;
      if (!v31)
      {
LABEL_109:

        id v15 = v92;
LABEL_110:

        id v17 = v93;
LABEL_111:

LABEL_112:
        id v10 = v96;
        goto LABEL_113;
      }
      if (v31 == (id)10)
      {
        if (v80)
        {
          DAErrorF();
          LOBYTE(v14) = 0;
          *long long v80 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          LOBYTE(v14) = 0;
        }
        goto LABEL_109;
      }
      id v86 = v13;
      uint64_t v87 = v12;
      id v97 = [v9 bluetoothClassicAddress];
      id v32 = [v9 name];
      id v33 = [v9 SSID];
      uint64_t v34 = [v11 displayName];
      id v35 = [v11 SSID];
      v103 = [v11 bridgingIdentifier];
      id v99 = [v11 iconType];
      unsigned int v36 = [v11 userInitiated];
      id v37 = [v9 discoveryConfiguration];
      unsigned __int8 v82 = [v37 flags];

      unsigned __int8 v38 = [v9 flags];
      id v84 = v33;
      id v85 = v32;
      id v83 = (void *)v34;
      id v98 = v35;
      unsigned __int8 v81 = [v101 flags];
      if (!v36)
      {
        char v40 = 0;
        char v41 = 0;
        goto LABEL_37;
      }
      id v79 = v11;
      if (v35 && ([v33 isEqualToString:v35] & 1) == 0)
      {
        [v9 setSSID:v35];
        int v39 = 1;
        if (!v34)
        {
LABEL_26:
          id v42 = [v99 identifier];
          id v43 = [v9 protocolType];
          unsigned int v44 = [v43 identifier];
          unsigned int v45 = [v42 isEqualToString:v44];

          if (v45)
          {
            [v9 setProtocolType:v99];
            int v39 = 1;
          }
          uint64_t v46 = [v9 bluetoothIdentifier];
          char v40 = v39 != 0;

          char v41 = 0;
          id v35 = v98;
          if (v46)
          {
            id v11 = v79;
            if ((v38 & 0x40) == 0 && (v82 & 2) != 0)
            {
              if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              char v41 = 1;
            }
          }
          else
          {
            id v11 = v79;
          }
LABEL_37:
          if (v31 != (id)20)
          {
            if (v31 == (id)25) {
              char v56 = v36;
            }
            else {
              char v56 = 1;
            }
            if ((v56 & 1) == 0)
            {
              CFURLRef v18 = v102;
              id v58 = v85;
              if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
              {
                id v76 = v9;
                LogPrintF();
                id v47 = 0;
                if (v40)
                {
                  BOOL v57 = 0;
                  goto LABEL_98;
                }
              }
              else
              {
                id v47 = 0;
                BOOL v57 = 0;
                if (v40) {
                  goto LABEL_98;
                }
              }
LABEL_88:
              if (dword_100043408 > 30)
              {
                LOBYTE(v14) = 1;
                uint64_t v13 = v86;
                unint64_t v12 = v87;
              }
              else
              {
                uint64_t v13 = v86;
                unint64_t v12 = v87;
                if (dword_100043408 != -1 || _LogCategory_Initialize()) {
                  LogPrintF();
                }
                LOBYTE(v14) = 1;
              }
              goto LABEL_108;
            }
            id v47 = 0;
            BOOL v57 = 0;
LABEL_87:
            CFURLRef v18 = v102;
            id v58 = v85;
            if (v40) {
              goto LABEL_98;
            }
            goto LABEL_88;
          }
          [v104 setState:25];
          [v9 setState:25];
          id v47 = 0;
          if (v103)
          {
            if (!v97)
            {
              id v47 = 0;
              if (([0 isEqualToData:v103] & 1) == 0)
              {
                id v48 = v103;
                unsigned __int8 v49 = (unsigned __int8 *)[v48 bytes];
                id v47 = +[NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", *v49, v49[1], v49[2], v49[3], v49[4], v49[5]];
                if (v47) {
                  [v9 setBluetoothClassicAddress:v48];
                }
              }
            }
          }
          id v50 = [v9 bluetoothClassicAddress];

          if (v50)
          {
            [v9 setBluetoothClassicAddress:v103];
            BOOL v51 = [v9 bluetoothIdentifier];
            cbCentralManager = self->_cbCentralManager;
            v106 = v51;
            long long v53 = +[NSArray arrayWithObjects:&v106 count:1];
            id v54 = [(CBCentralManager *)cbCentralManager retrievePeripheralsWithIdentifiers:v53];

            if ([v54 count])
            {
              id v55 = [v54 objectAtIndexedSubscript:0];
              if (dword_100043408 <= 40 && (dword_100043408 != -1 || _LogCategory_Initialize()))
              {
                id v76 = v54;
                LogPrintF();
              }
              if (v55)
              {
                if (dword_100043408 <= 40 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                  [v55 setCustomProperty:@"ASK_RELATED_RADIO_ADDRESS" value:v47, v54, v47];
                }
                else
                {
                  [v55 setCustomProperty:@"ASK_RELATED_RADIO_ADDRESS" value:v47, v76, v77];
                }
              }
            }
            char v40 = 1;
            if (v35) {
              goto LABEL_71;
            }
          }
          else
          {
            v40 |= (v81 & 0x10) != 0;
            if (v35)
            {
LABEL_71:
              unsigned int v61 = [v9 discoveryConfiguration:v76];
              id v62 = [v61 hotspotSSIDPrefixes];
              id v63 = [v62 firstObject];

              if (v63 && ([v35 hasPrefix:v63] & 1) == 0)
              {
                id v59 = v11;
                if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  long long v77 = v63;
                  id v78 = v9;
                  id v76 = v35;
                  LogPrintF();
                }
                [v104 setState:0, v76, v77, v78];
                [v9 setState:0];
                int v60 = 1;
              }
              else
              {
                id v59 = v11;
                [v9 setSSID:v35];
                int v60 = 0;
              }

              char v40 = 1;
              goto LABEL_80;
            }
          }
          id v59 = v11;
          int v60 = 0;
LABEL_80:
          id v64 = [v9 bluetoothIdentifier:v76];

          BOOL v57 = v60 != 0;
          char v65 = v41 ^ 1;
          if (!v64) {
            char v65 = 1;
          }
          if ((v65 & 1) == 0)
          {
            id v11 = v59;
            CFURLRef v18 = v102;
            id v58 = v85;
            if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [v104 setState:0];
            [v9 setState:0];
            btPairingManager = self->_btPairingManager;
            if (btPairingManager)
            {
              id v67 = [(DABluetoothPairingManager *)btPairingManager getCurrentTaskBluetoothIdentifier];
              unsigned __int8 v68 = [v9 bluetoothIdentifier];
              unsigned int v69 = [v67 isEqual:v68];

              if (v69) {
                [(DABluetoothPairingManager *)self->_btPairingManager cancelCurrentTask];
              }
            }
LABEL_98:
            v105[0] = 0;
            unsigned __int8 v70 = -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](self, "updateAppAccessInfo:accessoryDevice:removalType:error:", v104, v9, 0, v105, v76);
            id v71 = v105[0];
            id v72 = v71;
            if ((v70 & 1) == 0)
            {
              uint64_t v13 = v86;
              unint64_t v12 = v87;
              LOBYTE(v14) = 0;
              if (v80) {
                *long long v80 = v71;
              }
              goto LABEL_107;
            }
            if (v57)
            {
              if (v80)
              {
                DAErrorF();
                LOBYTE(v14) = 0;
                *long long v80 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                LOBYTE(v14) = 0;
              }
            }
            else
            {
              if (dword_100043408 <= 30)
              {
                uint64_t v13 = v86;
                unint64_t v12 = v87;
                if (dword_100043408 != -1 || _LogCategory_Initialize()) {
                  LogPrintF();
                }
                LOBYTE(v14) = 1;
                goto LABEL_107;
              }
              LOBYTE(v14) = 1;
            }
            uint64_t v13 = v86;
            unint64_t v12 = v87;
LABEL_107:

LABEL_108:
            goto LABEL_109;
          }
          id v11 = v59;
          goto LABEL_87;
        }
      }
      else
      {
        int v39 = 0;
        if (!v34) {
          goto LABEL_26;
        }
      }
      if (([v32 isEqualToString:v34] & 1) == 0)
      {
        [v9 setName:v34];
        int v39 = 1;
      }
      goto LABEL_26;
    }
  }
  else if (a6)
  {
    DAErrorF();
    LOBYTE(v14) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v14) = 0;
  }
LABEL_113:

  return (char)v14;
}

- (BOOL)_saveAccessoryDevice:(id)a3 bundleID:(id)a4 existingOptions:(unint64_t)a5 removalType:(int64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v11 identifier];
  if (![v13 length])
  {
    if (a7)
    {
      DAErrorF();
      BOOL v53 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_81;
    }
LABEL_80:
    BOOL v53 = 0;
    goto LABEL_81;
  }
  error[1] = (CFErrorRef)1;
  uint64_t v14 = container_system_group_path_for_identifier();
  if (!v14) {
    goto LABEL_80;
  }
  id v15 = (void *)v14;
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v58 = v15;
    LogPrintF();
  }
  CFURLRef v16 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v15, 1, 0, v58);
  free(v15);
  if (!v16) {
    goto LABEL_80;
  }
  int64_t v74 = a6;
  id v63 = self;
  unsigned int v69 = a7;
  CFURLRef v17 = [v16 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
  error[0] = 0;
  if (!CFURLSetResourcePropertyForKey(v17, _kCFURLIsExcludedFromUnencryptedBackupKey, kCFBooleanTrue, error)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v60 = CFURLRef v59 = v17;
    LogPrintF();
  }
  -[__CFURL setResourceValue:forKey:error:](v17, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, 0, v59, v60);
  CFURLRef v68 = v17;
  CFURLRef v18 = [(__CFURL *)v17 URLByAppendingPathComponent:@"AccessorySetup" isDirectory:1];
  uint64_t v19 = [v18 path];
  unsigned int v20 = (void *)v19;
  if (!v18 || !v19)
  {
    id v56 = (id)DAErrorF();
    BOOL v53 = 0;
    goto LABEL_77;
  }
  id v66 = (void *)v19;
  id v67 = v16;
  id v73 = v12;
  [v18 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:0];
  uint64_t v21 = [v18 URLByAppendingPathComponent:@"DADevices" isDirectory:1];
  id v22 = +[NSFileManager defaultManager];
  unsigned int v23 = [v22 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:v69];

  if (!v23)
  {
    BOOL v53 = 0;
    goto LABEL_76;
  }
  [v21 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:0];
  uint64_t v24 = [v21 path];
  id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v13, @"dadevicedata"];
  char v65 = (void *)v24;
  unsigned int v26 = +[NSURL fileURLWithPath:v24];
  id v64 = v25;
  uint64_t v27 = [v26 URLByAppendingPathComponent:v25 isDirectory:0];

  uint64_t v28 = [v27 path];
  id v29 = +[NSFileManager defaultManager];
  id v72 = (void *)v28;
  unsigned int v30 = [v29 fileExistsAtPath:v28];
  id v31 = 0;
  if (v30) {
    id v31 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v27 error:0];
  }

  id v32 = [v31 mutableCopy];
  id v33 = v32;
  id v75 = v27;
  if (v32) {
    id v34 = v32;
  }
  else {
    id v34 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v35 = v34;

  CFStringGetTypeID();
  id v71 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  unsigned __int8 v70 = CFDictionaryGetTypedValue();
  uint64_t v81 = 0;
  unsigned __int8 v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  unsigned int v36 = [v11 appAccessInfoMap];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10000F244;
  v80[3] = &unk_10003CD90;
  v80[4] = &v81;
  [v36 enumerateKeysAndObjectsUsingBlock:v80];

  if (a6 == 2 || !v82[3])
  {
    id v38 = 0;
  }
  else
  {
    id v37 = [v11 persistentDictionaryRepresentation];
    id v38 = [v37 mutableCopy];

    id v35 = v37;
  }

  if ([v38 isEqual:v31])
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v53 = 1;
    goto LABEL_75;
  }
  if (v38)
  {
    id v79 = 0;
    int v39 = +[NSPropertyListSerialization dataWithPropertyList:v38 format:200 options:0 error:&v79];
    id v40 = v79;
    char v41 = v40;
    if (v39)
    {
      id v78 = v40;
      unsigned __int8 v42 = [v39 writeToURL:v75 options:1073741825 error:&v78];
      id v43 = v78;

      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v42)
      {

        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_73;
      }
      if (!v69) {
        goto LABEL_90;
      }
      BOOL v57 = DANestedErrorF();
    }
    else
    {
      if (!v69)
      {
        id v43 = v40;
        goto LABEL_90;
      }
      BOOL v57 = DANestedErrorF();
      id v43 = v41;
    }
    *unsigned int v69 = v57;
LABEL_90:

LABEL_91:
    BOOL v53 = 0;
    goto LABEL_74;
  }
  unsigned int v44 = +[NSFileManager defaultManager];
  unsigned int v45 = [v44 fileExistsAtPath:v72];

  if (v45)
  {
    uint64_t v46 = +[NSFileManager defaultManager];
    id v77 = 0;
    unsigned __int8 v47 = [v46 removeItemAtURL:v75 error:&v77];
    id v43 = v77;

    if ((v47 & 1) == 0)
    {
      if (v69)
      {
        DANestedErrorF();
        BOOL v53 = 0;
        *unsigned int v69 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_74;
      }
      goto LABEL_91;
    }
    unsigned int v61 = [v11 displayImageFileURL];
    id v62 = [v61 path];
    if (v62)
    {
      id v48 = +[NSFileManager defaultManager];
      unsigned int v49 = [v48 fileExistsAtPath:v62];

      if (v49)
      {
        id v50 = +[NSFileManager defaultManager];
        id v76 = v43;
        unsigned __int8 v51 = [v50 removeItemAtURL:v61 error:&v76];
        id v52 = v76;

        if ((v51 & 1) == 0)
        {
          if (v69)
          {
            DANestedErrorF();
            *unsigned int v69 = (id)objc_claimAutoreleasedReturnValue();
          }

          BOOL v53 = 0;
          id v43 = v52;
          goto LABEL_74;
        }
        id v43 = v52;
      }
    }
  }
  else
  {
    id v43 = 0;
  }
  if (!v74)
  {
    if (dword_100043408 > 30 || dword_100043408 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_73;
    }
    goto LABEL_69;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v74 == 2 || (v74 & 0xFFFFFFFFFFFFFFFDLL) == 1 && !v82[3])
  {
    if (v71)
    {
      id v54 = [objc_alloc((Class)NSUUID) initWithUUIDString:v71];
      [(DADaemonServer *)v63 _forgetBluetoothDevice:v54];
    }
    if (v70) {
      -[DADaemonServer _forgetWiFiDevice:](v63, "_forgetWiFiDevice:");
    }
    goto LABEL_73;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
LABEL_69:
  }
    LogPrintF();
LABEL_73:
  BOOL v53 = 1;
LABEL_74:

LABEL_75:
  _Block_object_dispose(&v81, 8);

LABEL_76:
  id v12 = v73;
  unsigned int v20 = v66;
  CFURLRef v16 = v67;
LABEL_77:

LABEL_81:
  return v53;
}

- (id)_statefulDevicesForAppID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v3, @"daappdata"];

  id v5 = NSTemporaryDirectory();
  BOOL v6 = +[NSURL fileURLWithPath:v5];
  id v7 = [v6 URLByAppendingPathComponent:v4 isDirectory:0];

  id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v7 error:0];
  if (v8)
  {
    CFDictionaryGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000F448;
      v12[3] = &unk_10003CC78;
      void v12[4] = v10;
      [v9 enumerateKeysAndObjectsUsingBlock:v12];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_updateDeviceStateTimer
{
  p_deviceStateTimer = &self->_deviceStateTimer;
  deviceStateTimer = self->_deviceStateTimer;
  if (self->_deviceStateHasTransient)
  {
    if (!deviceStateTimer)
    {
      dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)p_deviceStateTimer, v5);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000F6E0;
      handler[3] = &unk_10003CA70;
      void handler[4] = v5;
      void handler[5] = self;
      dispatch_source_set_event_handler(v5, handler);
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        id v8 = CUPrintDurationDouble();
        LogPrintF();
      }
      CUDispatchTimerSet();
      dispatch_activate(v5);
    }
    return;
  }
  if (!deviceStateTimer) {
    return;
  }
  if (dword_100043408 >= 31)
  {
    BOOL v6 = deviceStateTimer;
LABEL_13:
    id v9 = v6;
    dispatch_source_cancel(v6);
    id v7 = *p_deviceStateTimer;
    *p_deviceStateTimer = 0;

    return;
  }
  if (dword_100043408 != -1 || _LogCategory_Initialize()) {
    LogPrintF();
  }
  BOOL v6 = *p_deviceStateTimer;
  if (v6) {
    goto LABEL_13;
  }
}

- (id)addDiscovery:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = [v4 configuration];
  BOOL v6 = [v5 bundleID];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 bundleID];
  }
  id v9 = v8;

  id v10 = [v4 configuration];
  id v11 = [v4 configurations];
  id v12 = [v4 flags];
  if (self->_cbCentralManager)
  {
    if (v9)
    {
LABEL_6:
      uint64_t v13 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v9];
      if (!v13)
      {
        uint64_t v13 = objc_alloc_init(DADaemonDiscovery);
        discoveryMap = self->_discoveryMap;
        if (!discoveryMap)
        {
          id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          CFURLRef v16 = self->_discoveryMap;
          self->_discoveryMap = v15;

          discoveryMap = self->_discoveryMap;
        }
        [(NSMutableDictionary *)discoveryMap setObject:v13 forKeyedSubscript:v9];
        CFURLRef v17 = [(DADaemonServer *)self _statefulDevicesForAppID:v9];
        [(DADaemonDiscovery *)v13 setStatefulDeviceMap:v17];
      }
      id v18 = [(DADaemonDiscovery *)v13 discoverySet];
      if (!v18)
      {
        id v18 = objc_alloc_init((Class)NSMutableSet);
        [(DADaemonDiscovery *)v13 setDiscoverySet:v18];
      }
      [v18 addObject:v4];
      uint64_t v19 = [(DADaemonDiscovery *)v13 discoveryObj];
      if (v19)
      {
        id v20 = (id)v19;
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v30 = v20;
          id v31 = [v18 count];
          LogPrintF();
        }
      }
      else
      {
        id v23 = objc_alloc_init((Class)DADiscovery);
        [(DADaemonDiscovery *)v13 setDiscoveryObj:v23];
        [v23 setBundleID:v9];
        [v23 setConfiguration:v10];
        [v23 setConfigurations:v11];
        [v23 setFlags:v12];
        [v23 setDirect:1];
        [v23 setDispatchQueue:self->_dispatchQueue];
        id v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        id v34 = sub_10000FBA8;
        id v35 = &unk_10003CDB8;
        id v20 = v23;
        id v36 = v20;
        id v37 = v13;
        id v38 = self;
        id v39 = v9;
        [v20 setEventHandler:&v32];
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v30 = v20;
          LogPrintF();
        }
        [v20 activate:v30];
      }
      id v25 = [(DADaemonDiscovery *)v13 deviceMap];
      uint64_t v26 = [v25 allValues];
      uint64_t v27 = (void *)v26;
      uint64_t v28 = &__NSArray0__struct;
      if (v26) {
        uint64_t v28 = (void *)v26;
      }
      id v24 = v28;

      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v21 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_dispatchQueue options:0];
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v21;

    if (v9) {
      goto LABEL_6;
    }
  }
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v24 = 0;
LABEL_32:

  return v24;
}

- (void)removeDiscovery:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = [v4 configuration];
  uint64_t v6 = [v5 bundleID];
  if (v6)
  {
    id v7 = (void *)v6;

LABEL_4:
    id v8 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v7];
    id v9 = [v8 discoveryObj];
    id v10 = [v8 discoverySet];
    [v10 removeObject:v4];
    if ([v10 count])
    {
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        [v10 count];
        LogPrintF();
      }
    }
    else
    {
      id v11 = [v8 deviceMap];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000FEF4;
      v15[3] = &unk_10003CE08;
      v15[4] = self;
      [v11 enumerateKeysAndObjectsUsingBlock:v15];
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v14 = v9;
        LogPrintF();
      }
      id v12 = [v8 deviceMap:v14];
      id v13 = [v12 count];

      [v8 setDeviceMap:0];
      [v8 setDiscoveryObj:0];
      [v8 setDiscoverySet:0];
      [(NSMutableDictionary *)self->_discoveryMap setObject:0 forKeyedSubscript:v7];
      [v9 invalidate];
      if (v13) {
        [(DADaemonServer *)self _reportDevicesPresentChanged:0 appID:v7];
      }
      [(DADaemonServer *)self _necpCleanupIfNeeded];
      [(DADaemonServer *)self _cleanupWiFiDiscovery];
      [(DADaemonServer *)self _cleanupBTDiscovery];
    }
    goto LABEL_18;
  }
  id v7 = [v4 bundleID];

  if (v7) {
    goto LABEL_4;
  }
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_18:
}

- (void)_discoveryEvent:(id)a3 appID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v7];
  if (v8)
  {
    unint64_t v9 = (unint64_t)[v6 eventType];
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 0x28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v10 = v6;
        id v11 = [v10 device];
        id v12 = v11;
        if (v11)
        {
          id v13 = [v11 identifier];
          if (!v13)
          {
LABEL_41:

            goto LABEL_42;
          }
          uint64_t v14 = [v12 bluetoothIdentifier];
          id v38 = v14;
          if ([v12 discoveredInExtension] && v14)
          {
            cbCentralManager = self->_cbCentralManager;
            unsigned int v45 = v14;
            CFURLRef v16 = +[NSArray arrayWithObjects:&v45 count:1];
            CFURLRef v17 = [(CBCentralManager *)cbCentralManager retrievePeripheralsWithIdentifiers:v16];
            id v18 = [v17 firstObject];

            uint64_t v19 = [v18 name];
            [v12 setBluetoothOTAName:v19];

            if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
              id v36 = v18;
              LogPrintF();
            }

            uint64_t v14 = v38;
          }
          uint64_t v28 = [v8 statefulDeviceMap:v36];
          id v29 = [v28 objectForKeyedSubscript:v13];

          id v37 = v29;
          [v12 setState:[v29 state]];
          [(DADaemonServer *)self _addTXTRecordToNWEndpoint:v12 appID:v7];
          [(DADaemonServer *)self _addSSDPDatatoNWEndpoint:v12 appID:v7];
          id v30 = [v12 url];
          if (v30
            && (+[DADevice deviceMetadataURLValid:v30] & 1) == 0)
          {
            if (dword_100043408 > 30) {
              goto LABEL_40;
            }
            id v32 = v10;
            if (dword_100043408 == -1 && !_LogCategory_Initialize())
            {
LABEL_39:
              id v10 = v32;
              uint64_t v14 = v38;
LABEL_40:

              goto LABEL_41;
            }
            id v35 = [v12 identifier];
            LogPrintF();
          }
          else
          {

            id v30 = [v8 deviceMap];
            id v31 = [v30 count];
            if (!v30)
            {
              id v30 = objc_alloc_init((Class)NSMutableDictionary);
              [v8 setDeviceMap:v30];
            }
            [v30 setObject:v12 forKeyedSubscript:v13];
            [(DADaemonServer *)self _necpSignEndpointForDevice:v12 appID:v7];
            id v32 = v10;
            [(DADaemonServer *)self _reportDiscoveryEvent:v10 appID:v7];
            if (!v31) {
              [(DADaemonServer *)self _reportDevicesPresentChanged:1 appID:v7];
            }
            uint64_t v33 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
            dispatchQueue = self->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000106DC;
            block[3] = &unk_10003CE30;
            id v41 = v7;
            unsigned __int8 v42 = v12;
            id v43 = v8;
            id v44 = v33;
            id v35 = v33;
            dispatch_async(dispatchQueue, block);
          }
          goto LABEL_39;
        }
LABEL_42:
      }
    }
    else if (v9 == 55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(DADaemonServer *)self _reportDiscoveryEvent:v6 appID:v7];
      }
    }
    else if (v9 == 41)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v10 = v6;
        id v20 = [v10 device];
        id v12 = [v20 identifier];

        if (v12)
        {
          id v13 = [v10 device];
          if (v13)
          {
            uint64_t v21 = [v8 statefulDeviceMap];
            id v22 = [v21 objectForKeyedSubscript:v12];

            if (v22) {
              [v13 setState:[v22 state]];
            }
            id v23 = [v8 deviceMap];
            id v24 = [v23 count];
            if ([v13 state] == (id)20)
            {
              [v23 objectForKeyedSubscript:v12];
              id v39 = v24;
              v26 = id v25 = v10;
              [v26 setPendingRemoval:1];

              id v10 = v25;
              id v24 = v39;
            }
            else
            {
              [(DADaemonServer *)self _reportDiscoveryEvent:v10 appID:v7];
              [v23 setObject:0 forKeyedSubscript:v12];
            }
            id v27 = [v23 count];
            if (v24 && !v27) {
              [(DADaemonServer *)self _reportDevicesPresentChanged:0 appID:v7];
            }
          }
          goto LABEL_41;
        }
        goto LABEL_42;
      }
    }
  }
  else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_reportDevicesMigratedEvent:(id)a3 appID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) reportDevicesMigrated:v6 appID:v7];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_reportDiscoveryEvent:(id)a3 appID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) reportDiscoveryEvent:v6 appID:v7];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)_updateStateForDiscoveryDeviceID:(id)a3 state:(int64_t)a4 appID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 deviceMap];
    long long v13 = [v12 objectForKeyedSubscript:v8];

    if (v13)
    {
      if (([v13 flags] & 8) != 0)
      {
        long long v14 = [v13 appAccessInfoDeviceMap];
        long long v15 = [v14 objectForKeyedSubscript:v9];
        [v15 setState:a4];
      }
      [v13 setState:a4];
      id v16 = [v11 statefulDeviceMap];
      if (!v16)
      {
        id v16 = objc_alloc_init((Class)NSMutableDictionary);
        [v11 setStatefulDeviceMap:v16];
      }
      [v16 setObject:v13 forKeyedSubscript:v8];
      CFURLRef v17 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      dispatchQueue = self->_dispatchQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100010C0C;
      v23[3] = &unk_10003CE58;
      id v24 = v9;
      int64_t v29 = a4;
      id v25 = v8;
      id v19 = v13;
      id v26 = v19;
      id v27 = v11;
      id v28 = v17;
      id v20 = v17;
      dispatch_async(dispatchQueue, v23);
      id v21 = v19;
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)runMigrationWithDiscovery:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = [v4 bundleID];
  if (v5)
  {
    if (!self->_cbCentralManager)
    {
      id v6 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_dispatchQueue options:0];
      cbCentralManager = self->_cbCentralManager;
      self->_cbCentralManager = v6;
    }
    id v8 = [(DADaemonServer *)self getDevicesWithFlags:8 appID:v5];
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v73 = [v8 count];
      LogPrintF();
    }
    id v9 = self->_cbCentralManager;
    id v96 = _NSConcreteStackBlock;
    uint64_t v97 = 3221225472;
    id v98 = sub_100011960;
    id v99 = &unk_10003CE80;
    id v100 = v5;
    id v83 = v100;
    -[CBCentralManager retrieveBundle:sessionCountWithCompletion:](v9, "retrieveBundle:sessionCountWithCompletion:");
    id v10 = +[NSMutableArray array];
    uint64_t v11 = [v4 configuration];
    id v85 = v4;
    id v86 = self;
    long long v80 = v8;
    uint64_t v81 = v5;
    id v79 = v11;
    if (v11)
    {
      id v12 = v11;
      long long v13 = [v11 bluetoothIdentifier];
      if (v13)
      {

LABEL_12:
        [v12 bluetoothIdentifier:v73];
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = -[DADaemonServer _findDADeviceWithBTIdentifier:](self, "_findDADeviceWithBTIdentifier:");
        if (v15)
        {
          id v16 = (id)v15;
          if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v74 = v16;
            LogPrintF();
          }
          unsigned int v49 = [v4 configuration:v74];
          [v16 setDiscoveryConfiguration:v49];
        }
        else
        {
          id v16 = objc_alloc_init((Class)DADevice);
          id v43 = +[NSUUID UUID];
          id v44 = [v43 UUIDString];
          [v16 setIdentifier:v44];

          unsigned int v45 = [v12 bluetoothIdentifier];
          [v16 setBluetoothIdentifier:v45];

          if ([(CBCentralManager *)self->_cbCentralManager state] == (id)5)
          {
            uint64_t v46 = self->_cbCentralManager;
            id v104 = obj;
            unsigned __int8 v47 = +[NSArray arrayWithObjects:&v104 count:1];
            id v48 = [(CBCentralManager *)v46 retrievePeripheralsWithIdentifiers:v47];

            if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
              id v74 = v48;
              LogPrintF();
            }
            if (objc_msgSend(v48, "count", v74))
            {
              id v50 = [v48 objectAtIndex:0];
              unsigned __int8 v51 = [v50 name];

              if (v51)
              {
                id v52 = [v50 name];
                [v16 setBluetoothOTAName:v52];
              }
            }
          }
          else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v74 = [(CBCentralManager *)self->_cbCentralManager state];
            LogPrintF();
          }
          [v16 setDiscoveryConfiguration:v12, v74];
          [v16 setFlags:8];
          BOOL v53 = [v12 displayName];
          [v16 setName:v53];

          if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v77 = v16;
            LogPrintF();
          }
        }
        id v54 = [v12 networkHotspotSSID:v77];

        if (v54)
        {
          id v55 = [v12 networkHotspotSSID];
          [v16 setSSID:v55];
        }
        [v10 addObject:v16];

        goto LABEL_77;
      }
      long long v14 = [v12 networkHotspotSSID];

      if (v14) {
        goto LABEL_12;
      }
    }
    CFURLRef v17 = [v4 configurations:v73];
    id v18 = [v17 count];

    if (!v18)
    {
LABEL_78:
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v56 = v10;
      id v57 = [v56 countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v89;
        do
        {
          int v60 = 0;
          do
          {
            if (*(void *)v89 != v59) {
              objc_enumerationMutation(v56);
            }
            unsigned int v61 = *(void **)(*((void *)&v88 + 1) + 8 * (void)v60);
            id v62 = [v61 identifier:v75, v78];
            if (v62)
            {
              id v63 = [v4 bundleID];
              if (v63)
              {
                unint64_t v64 = [(DADaemonServer *)v86 appBundleInfoAccessoryOptions:v63] & 3;
                if (v64)
                {
                  id v65 = [objc_alloc((Class)DADeviceAppAccessInfo) initWithBundleIdentifier:v83 deviceIdentifier:v62 state:25];
                  [v65 setAccessoryOptions:v64];
                  id v66 = [v61 appAccessInfoDeviceMap];
                  id v67 = [v66 objectForKeyedSubscript:v63];

                  if (!v67)
                  {
                    CFURLRef v68 = +[NSMutableDictionary dictionary];
                    [v61 setAppAccessInfoDeviceMap:v68];
                  }
                  unsigned int v69 = [v61 appAccessInfoDeviceMap];
                  [v69 setObject:v65 forKeyedSubscript:v63];

                  [v61 setFlags:((unint64_t)[v61 flags] | 0x100)];
                  id v87 = 0;
                  [(DADaemonServer *)v86 updateAppAccessInfo:v65 accessoryDevice:v61 removalType:0 error:&v87];
                  id v70 = v87;
                  if (v70
                    && dword_100043408 <= 90
                    && (dword_100043408 != -1 || _LogCategory_Initialize()))
                  {
                    CUPrintNSError();
                    id v75 = (id)objc_claimAutoreleasedReturnValue();
                    id v78 = v61;
                    LogPrintF();
                  }
                  id v4 = v85;
                }
                else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  id v75 = v61;
                  LogPrintF();
                }
              }
            }
            int v60 = (char *)v60 + 1;
          }
          while (v58 != v60);
          id v71 = [v56 countByEnumeratingWithState:&v88 objects:v101 count:16];
          id v58 = v71;
        }
        while (v71);
      }

      id v72 = [objc_alloc((Class)DAEventDevicesPresent) initWithMigration:1];
      [v72 setDevices:v56];
      [(DADaemonServer *)v86 _reportDevicesMigratedEvent:v72 appID:v83];

      dispatch_source_t v5 = v81;
      goto LABEL_104;
    }
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id obj = [v4 configurations];
    id v19 = [obj countByEnumeratingWithState:&v92 objects:v103 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v84 = *(void *)v93;
      id v21 = obj;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v93 != v84) {
            objc_enumerationMutation(v21);
          }
          id v23 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v22);
          id v24 = [v23 bluetoothIdentifier];
          if (v24
            && ([(DADaemonServer *)self _findDADeviceWithBTIdentifier:v24],
                (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v26 = (id)v25;
            if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
              id v75 = v26;
              LogPrintF();
            }
            id v35 = [v85 configuration:v75];
            [v26 setDiscoveryConfiguration:v35];
          }
          else
          {
            id v26 = objc_alloc_init((Class)DADevice);
            id v27 = +[NSUUID UUID];
            id v28 = [v27 UUIDString];
            [v26 setIdentifier:v28];

            int64_t v29 = [v23 bluetoothIdentifier];

            if (v29)
            {
              id v30 = [v23 bluetoothIdentifier];
              [v26 setBluetoothIdentifier:v30];

              if ([(CBCentralManager *)self->_cbCentralManager state] == (id)5)
              {
                id v31 = v10;
                id v32 = self->_cbCentralManager;
                id v102 = v24;
                uint64_t v33 = +[NSArray arrayWithObjects:&v102 count:1];
                id v34 = [(CBCentralManager *)v32 retrievePeripheralsWithIdentifiers:v33];

                if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  id v75 = v34;
                  LogPrintF();
                }
                if (objc_msgSend(v34, "count", v75))
                {
                  id v36 = [v34 objectAtIndex:0];
                  id v37 = [v36 name];

                  if (v37)
                  {
                    id v38 = [v36 name];
                    [v26 setBluetoothOTAName:v38];
                  }
                }

                id v10 = v31;
                id v21 = obj;
              }
              else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
              {
                id v75 = [(CBCentralManager *)self->_cbCentralManager state];
                id v78 = v26;
                LogPrintF();
              }
            }
            [v26 setDiscoveryConfiguration:v23, v75, v78];
            [v26 setFlags:8];
            id v39 = [v23 displayName];
            [v26 setName:v39];

            if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
            {
              id v76 = v26;
              LogPrintF();
            }
          }
          id v40 = [v23 networkHotspotSSID:v76];

          if (v40)
          {
            id v41 = [v23 networkHotspotSSID];
            [v26 setSSID:v41];
          }
          [v10 addObject:v26];

          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v42 = [v21 countByEnumeratingWithState:&v92 objects:v103 count:16];
        id v20 = v42;
      }
      while (v42);
      id v4 = v85;
    }
LABEL_77:

    goto LABEL_78;
  }
  if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_104:
}

- (void)runSystemDiscovery
{
  [(DADaemonServer *)self _updateBluetoothScannerIfNeeded];

  [(DADaemonServer *)self _updateWiFiManagerIfNeeded];
}

- (int64_t)applicationHasBluetoothGlobalTCC:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = [(DADaemonServer *)v5 _applicationHasBluetoothGlobalTCC:v4];
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)_applicationHasBluetoothGlobalTCC:(id)a3
{
  id v3 = a3;
  if (v3 && (CFArrayRef v4 = (const __CFArray *)TCCAccessCopyInformationForBundleId()) != 0)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1) {
      goto LABEL_13;
    }
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    int64_t v9 = 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
      Value = CFDictionaryGetValue(ValueAtIndex, kTCCInfoService);
      if (CFEqual(Value, kTCCServiceBluetoothAlways)) {
        break;
      }
      ++v8;
    }
    while (v7 != v8);
    CFBooleanRef v12 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, kTCCInfoGranted);
    if (v12)
    {
      if (CFBooleanGetValue(v12)) {
        int64_t v9 = 2;
      }
      else {
        int64_t v9 = 3;
      }
    }
    else
    {
LABEL_13:
      int64_t v9 = 1;
    }
    CFRelease(v5);
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (int64_t)_updateDeviceStateForBluetooth:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  int64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_100003B10;
  id v32 = sub_100003B20;
  id v33 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011EE0;
  v27[3] = &unk_10003CAE8;
  v27[4] = &v28;
  CFIndex v8 = objc_retainBlock(v27);
  id v9 = [v6 state];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v10 = DADeviceStateToString();
    uint64_t v11 = [v7 discoveryConfiguration];
    id v24 = [v11 associationIdentifier];
    id v26 = v6;
    id v22 = v7;
    id v23 = v10;
    LogPrintF();
  }
  CFBooleanRef v12 = [v7 bluetoothIdentifier:v22:v23:v24:v26];

  if (!v12)
  {
    uint64_t v21 = DANestedErrorF();
    id v19 = (void *)v29[5];
    v29[5] = v21;
    goto LABEL_15;
  }
  if ([v6 state] == (id)10 || objc_msgSend(v6, "state") == (id)20)
  {
    long long v13 = [v7 discoveryConfiguration];
    unsigned __int8 v14 = [v13 allowsBluetoothPairing];

    if (v14)
    {
      unint64_t v15 = 1;
    }
    else
    {
      id v16 = [v7 discoveryConfiguration];
      unint64_t v15 = ((unint64_t)[v16 flags] >> 1) & 1;
    }
    CFURLRef v17 = [v7 discoveryConfiguration];
    unint64_t v18 = (unint64_t)[v17 flags];

    [(DADaemonServer *)self _persistBluetoothDevice:v6 device:v7 requirePairing:v15 pairWithCTKD:(v18 >> 2) & 1];
  }
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    [v6 state];
    id v19 = DADeviceStateToString();
    uint64_t v25 = DADeviceStateToString();
    LogPrintF();

LABEL_15:
  }
  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v28, 8);
  return (int64_t)v9;
}

- (id)_parseDADiscoveryConfiguration:(id)a3
{
  id v3 = a3;
  CFArrayRef v4 = [v3 bluetoothIdentifier];

  if (v4)
  {
    id v39 = 0;
  }
  else
  {
    CFArrayRef v5 = objc_opt_new();
    id v6 = [v3 associationIdentifier];
    id v7 = [v3 bluetoothServices];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = objc_opt_new();
      id v10 = [v3 bluetoothServices];
      uint64_t v11 = [v10 objectAtIndex:0];

      if (v11)
      {
        [v9 setObject:v11 forKey:CBCentralManagerScanOptionMatchingRuleServiceUUID];
        [v9 setObject:v6 forKey:CBCentralManagerScanOptionFilterIdentifierString];
        CFBooleanRef v12 = [v3 bluetoothServicePayload];
        id v13 = [v12 length];

        if (v13)
        {
          unsigned __int8 v14 = [v3 bluetoothServicePayload];
          [v9 setObject:v14 forKey:CBCentralManagerScanOptionMatchingRulePayloadKey];
        }
        unint64_t v15 = [v3 bluetoothServicePayloadMask];
        id v16 = [v15 length];

        if (v16)
        {
          CFURLRef v17 = [v3 bluetoothServicePayloadMask];
          [v9 setObject:v17 forKey:CBCentralManagerScanOptionMatchingRuleMaskKey];
        }
        [v5 addObject:v9];
      }
    }
    unint64_t v18 = [v3 bluetoothCompanyIdentifiers];
    id v19 = [v18 count];

    if (v19)
    {
      id v20 = objc_opt_new();
      uint64_t v21 = [v3 bluetoothCompanyIdentifiers];
      id v22 = [v21 objectAtIndex:0];
      id v23 = [v22 unsignedIntValue];

      id v24 = +[NSNumber numberWithUnsignedInt:v23];
      [v20 setObject:v24 forKey:CBCentralManagerScanOptionMatchingRuleManufacturerID];

      [v20 setObject:v6 forKey:CBCentralManagerScanOptionFilterIdentifierString];
      uint64_t v25 = [v3 bluetoothCompanyPayload];
      id v26 = [v25 length];

      if (v26)
      {
        id v27 = [v3 bluetoothCompanyPayload];
        [v20 setObject:v27 forKey:CBCentralManagerScanOptionMatchingRulePayloadKey];
      }
      uint64_t v28 = [v3 bluetoothCompanyPayloadMask];
      id v29 = [v28 length];

      if (v29)
      {
        uint64_t v30 = [v3 bluetoothCompanyPayloadMask];
        [v20 setObject:v30 forKey:CBCentralManagerScanOptionMatchingRuleMaskKey];
      }
      [v5 addObject:v20];
    }
    uint64_t v31 = [v3 bluetoothNameSubstring];
    if (v31)
    {
      id v32 = (void *)v31;
      id v33 = [v3 bluetoothNameSubstring];
      id v34 = [v33 length];

      if (v34)
      {
        id v35 = [v3 bluetoothNameSubstringCompareOptions];
        id v36 = objc_opt_new();
        id v37 = [v3 bluetoothNameSubstring];
        [v36 setObject:v37 forKey:CBCentralManagerScanOptionMatchingRuleNameMatchString];
        [v36 setObject:v6 forKey:CBCentralManagerScanOptionFilterIdentifierString];
        if (v35)
        {
          id v38 = +[NSNumber numberWithUnsignedInteger:v35];
          [v36 setObject:v38 forKey:@"kCBScanOptionFilterNameMatchNSStringCompareOptions"];
        }
        else
        {
          [v36 setObject:CBCentralManagerScanOptionMatchingRuleNameMatchOptionContains forKey:CBCentralManagerScanOptionMatchingRuleNameMatchOption];
        }
        [v5 addObject:v36];
      }
    }
    if ([v5 count]) {
      id v39 = v5;
    }
    else {
      id v39 = 0;
    }
  }

  return v39;
}

- (void)_cleanupBTDiscovery
{
  btScanRefreshTimer = self->_btScanRefreshTimer;
  if (btScanRefreshTimer)
  {
    CFArrayRef v4 = btScanRefreshTimer;
    dispatch_source_cancel(v4);
    CFArrayRef v5 = self->_btScanRefreshTimer;
    self->_btScanRefreshTimer = 0;
  }
  cbCentralManager = self->_cbCentralManager;
  if (cbCentralManager) {
    [(CBCentralManager *)cbCentralManager stopScan];
  }
  cbScanClient = self->_cbScanClient;
  self->_cbScanClient = 0;

  [(NSMutableDictionary *)self->_cbDADeviceMap enumerateKeysAndObjectsUsingBlock:&stru_10003CEC0];
  id v8 = (NSMutableDictionary *)objc_opt_new();
  cbDADeviceMap = self->_cbDADeviceMap;
  self->_cbDADeviceMap = v8;

  self->_cbScanFilterArray = (NSMutableArray *)objc_opt_new();

  _objc_release_x1();
}

- (void)_setupBTPairingManager
{
  if (!self->_btPairingManager)
  {
    id v3 = objc_alloc_init(DABluetoothPairingManager);
    btPairingManager = self->_btPairingManager;
    self->_btPairingManager = v3;

    [(DABluetoothPairingManager *)self->_btPairingManager setMitmPairing:self->_prefBTPairingWithMITM];
    [(DABluetoothPairingManager *)self->_btPairingManager setTaskTimeoutSeconds:self->_prefBTScanRefreshSeconds];
    dispatchQueue = self->_dispatchQueue;
    id v6 = self->_btPairingManager;
    [(DABluetoothPairingManager *)v6 setDispatchQueue:dispatchQueue];
  }
}

- (void)_persistBluetoothDevice:(id)a3 device:(id)a4 requirePairing:(BOOL)a5 pairWithCTKD:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v10;
    id v24 = v11;
    BOOL v25 = v7;
    BOOL v26 = v6;
    LogPrintF();
  }
  BOOL v27 = v7;
  CFBooleanRef v12 = [v10 deviceIdentifier:v23, v24, v25, v26];
  id v29 = [v10 bundleIdentifier];
  id v13 = [v10 appDiscoveryConfiguration];
  uint64_t v28 = [v13 displayName];

  unsigned __int8 v14 = [v11 discoveryConfiguration];
  unint64_t v15 = (unint64_t)[v14 flags];
  v39[0] = 0;
  v39[1] = v39;
  if ((v15 & 0x10) != 0) {
    uint64_t v16 = 60;
  }
  else {
    uint64_t v16 = 30;
  }
  id v39[2] = 0x2020000000;
  id v40 = 0;
  id v40 = [v10 state];
  CFURLRef v17 = [v11 bluetoothIdentifier];

  if (v17)
  {
    [(DADaemonServer *)self _cleanupBTDiscovery];
    [(DADaemonServer *)self _cleanupWiFiDiscovery];
    unint64_t v18 = [v11 bluetoothIdentifier];
    id v19 = [v18 copy];

    [(DADaemonServer *)self _setupBTPairingManager];
    btPairingManager = self->_btPairingManager;
    uint64_t v21 = +[NSNumber numberWithInt:v16];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100012908;
    v30[3] = &unk_10003CEE8;
    id v31 = v10;
    id v32 = v14;
    id v38 = v39;
    id v33 = v11;
    id v34 = self;
    id v22 = v19;
    id v35 = v22;
    id v36 = v29;
    id v37 = v12;
    [(DABluetoothPairingManager *)btPairingManager persistBluetoothDevice:v22 pairingRequired:v27 pairWithCTKD:v6 displayName:v28 taskTimeout:v21 appConfirmsAuth:(v15 >> 4) & 1 completion:v30];
  }
  _Block_object_dispose(v39, 8);
}

- (void)_forgetBluetoothDevice:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v4)
  {
    id v5 = [v4 copy];
    [(DADaemonServer *)self _setupBTPairingManager];
    btPairingManager = self->_btPairingManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012E78;
    v7[3] = &unk_10003CF10;
    id v8 = v4;
    id v9 = self;
    [(DABluetoothPairingManager *)btPairingManager forgetBluetoothDevice:v5 completion:v7];
  }
}

- (void)_updateBluetoothScannerIfNeeded
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(DADaemonServer *)self _cleanupBTDiscovery];
  id v3 = self->_discoveryMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001308C;
  v7[3] = &unk_10003CF88;
  void v7[4] = self;
  [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:v7];
  if ([(NSMutableArray *)self->_cbScanFilterArray count])
  {
    id v4 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_dispatchQueue options:0];
    cbCentralManager = self->_cbCentralManager;
    self->_cbCentralManager = v4;
  }
  else
  {
    btPairingManager = self->_btPairingManager;
    if (btPairingManager) {
      [(DABluetoothPairingManager *)btPairingManager cancelAll];
    }
  }
}

- (void)_startBTScan
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_opt_new();
  [v3 setValue:self->_cbScanFilterArray forKey:CBCentralManagerScanOptionMatchingRuleKey];
  cbScanClient = self->_cbScanClient;
  id v4 = +[NSArray arrayWithObjects:&cbScanClient count:1];
  [v3 setValue:v4 forKey:CBManagerListOfClients];

  cbScanFilterArray = self->_cbScanFilterArray;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000135DC;
  v6[3] = &unk_10003CFD8;
  void v6[4] = self;
  [(NSMutableArray *)cbScanFilterArray enumerateObjectsUsingBlock:v6];
  [(CBCentralManager *)self->_cbCentralManager scanForPeripheralsWithServices:0 options:v3 completion:&stru_10003D018];
}

- (void)_stopBTScan
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  cbCentralManager = self->_cbCentralManager;

  [(CBCentralManager *)cbCentralManager stopScan];
}

- (void)_checkAndReportLostBTDevices
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v4 = objc_opt_new();
  cbDADeviceMap = self->_cbDADeviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013A64;
  v8[3] = &unk_10003D040;
  CFAbsoluteTime v10 = Current;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)cbDADeviceMap enumerateKeysAndObjectsUsingBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013BE0;
  v7[3] = &unk_10003D068;
  void v7[4] = self;
  *(CFAbsoluteTime *)&void v7[5] = Current;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)_armBTScanTimer
{
  if (!self->_btScanRefreshTimer)
  {
    p_btScanRefreshTimer = &self->_btScanRefreshTimer;
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_btScanRefreshTimer, v4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100013E7C;
    handler[3] = &unk_10003CA70;
    void handler[4] = v4;
    void handler[5] = self;
    dispatch_source_set_event_handler(v4, handler);
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintDurationDouble();
      LogPrintF();
    }
    CUDispatchTimerSet();
    dispatch_activate(v4);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  dispatch_source_t v4 = self->_cbCentralManager;
  BOOL BTPoweredOn = [(CBCentralManager *)v4 state] == (id)5;
  self->_BOOL BTPoweredOn = BTPoweredOn;
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    BOOL BTPoweredOn = self->_BTPoweredOn;
  }
  if (BTPoweredOn)
  {
    [(DADaemonServer *)self _checkAppAccessInfo];
    if ([(NSMutableArray *)self->_cbScanFilterArray count])
    {
      [(DADaemonServer *)self _startBTScan];
      [(DADaemonServer *)self _armBTScanTimer];
      if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
LABEL_15:
      }
        LogPrintF();
    }
    else if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else
  {
    cbDADeviceMap = self->_cbDADeviceMap;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001412C;
    v7[3] = &unk_10003D090;
    void v7[4] = self;
    [(NSMutableDictionary *)cbDADeviceMap enumerateKeysAndObjectsUsingBlock:v7];
    if ([(CBCentralManager *)v4 state] != (id)1) {
      [(DADaemonServer *)self _cleanupBTDiscovery];
    }
  }
}

- (id)_findDADeviceWithBTPeripheral:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v4;
    LogPrintF();
  }
  cbDADeviceMap = self->_cbDADeviceMap;
  id v6 = [v4 identifier:v11];
  BOOL v7 = [(NSMutableDictionary *)cbDADeviceMap objectForKey:v6];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = sub_100003B10;
  id v19 = sub_100003B20;
  id v20 = [v7 objectForKeyedSubscript:@"DADevice"];
  if (v16[5])
  {
    if (dword_100043408 > 50) {
      goto LABEL_15;
    }
    if (dword_100043408 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  else
  {
    id v8 = [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014494;
    v12[3] = &unk_10003D0B8;
    id v13 = v4;
    unsigned __int8 v14 = &v15;
    [v8 enumerateObjectsUsingBlock:v12];
  }
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:
  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_findDADeviceWithBTIdentifier:(id)a3
{
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v4;
    LogPrintF();
  }
  id v5 = -[NSMutableDictionary objectForKey:](self->_cbDADeviceMap, "objectForKey:", v4, v9);
  uint64_t v13 = 0;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100003B10;
  uint64_t v17 = sub_100003B20;
  id v18 = [v5 objectForKeyedSubscript:@"DADevice"];
  if (v14[5])
  {
    if (dword_100043408 > 50) {
      goto LABEL_15;
    }
    if (dword_100043408 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  else
  {
    id v6 = [(DADaemonServer *)self getDevicesWithFlags:8 appID:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100014834;
    v10[3] = &unk_10003D0B8;
    id v11 = v4;
    CFBooleanRef v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:
  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)_reportDiscoveredBTDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5 AppID:(id)a6 DADaemonDiscovery:(id)a7 DADiscovery:(id)a8 config:(id)a9
{
  id v63 = a3;
  id v62 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = [v19 bundleID];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v58 = v18;
    id v59 = v19;
    id v56 = v62;
    id v57 = v17;
    id v54 = v16;
    id v55 = v15;
    id v52 = v20;
    LogPrintF();
  }
  uint64_t v21 = -[DADaemonServer _findDADeviceWithBTPeripheral:](self, "_findDADeviceWithBTPeripheral:", v63, v52, v54, v55, v56, v57, v58, v59);
  id v60 = v17;
  id v61 = v18;
  if (v21)
  {
    id v22 = (id)v21;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v53 = v22;
      LogPrintF();
    }
    id v32 = v16;
    [v22 setDiscoveryConfiguration:v19, v53];
LABEL_20:
    id v33 = [v22 appAccessInfoMap:v53];
    id v34 = [v33 objectForKeyedSubscript:v20];
    unsigned __int8 v35 = [v34 accessoryOptions];

    unsigned __int8 v36 = [(DADaemonServer *)self appBundleInfoAccessoryOptions:v20];
    id v37 = [v22 appAccessInfoMap];
    id v38 = [v37 objectForKeyedSubscript:v20];
    if ([v38 state]) {
      int v39 = v36 & ((v35 & 1) == 0);
    }
    else {
      int v39 = 1;
    }

    uint64_t v40 = [v63 name];
    if (v40
      && (id v41 = (void *)v40,
          [v63 name],
          id v42 = objc_claimAutoreleasedReturnValue(),
          id v43 = [v42 length],
          v42,
          v41,
          v43))
    {
      if (v39)
      {
        id v44 = [objc_alloc((Class)DADeviceEvent) initWithEventType:40 device:v22];
        [(DADaemonServer *)self _discoveryEvent:v44 appID:v32];
      }
    }
    else if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unsigned int v45 = objc_opt_new();
    [v45 setObject:v22 forKey:@"DADevice"];
    [v45 setObject:v63 forKey:@"CBPeripheral"];
    uint64_t v46 = v62;
    [v45 setObject:v62 forKey:@"ADVData"];
    [v45 setObject:v15 forKey:@"RSSI"];
    unsigned __int8 v47 = self;
    id v48 = v15;
    unsigned int v49 = v61;
    [v45 setObject:v61 forKey:@"DiscoveryObj"];
    cbDADeviceMap = v47->_cbDADeviceMap;
    unsigned __int8 v51 = [v63 identifier];
    [(NSMutableDictionary *)cbDADeviceMap setObject:v45 forKeyedSubscript:v51];

    id v16 = v32;
    goto LABEL_32;
  }
  if ([v19 bluetoothRange] != (id)10
    || (int)[v15 intValue] >= self->_prefsBTRSSIThreshold)
  {
    id v22 = objc_alloc_init((Class)DADevice);
    id v23 = +[NSUUID UUID];
    id v24 = [v23 UUIDString];
    [v22 setIdentifier:v24];

    BOOL v25 = [v63 identifier];
    [v22 setBluetoothIdentifier:v25];

    BOOL v26 = [v63 name];
    [v22 setBluetoothOTAName:v26];

    [v22 setDiscoveryConfiguration:v19];
    [v22 setFlags:8];
    BOOL v27 = [v19 displayName];
    [v22 setName:v27];

    uint64_t v28 = [v19 hotspotSSIDs];
    id v29 = [v28 count];

    if (v29)
    {
      uint64_t v30 = [v19 hotspotSSIDs];
      id v31 = [v30 firstObject];
      [v22 setSSID:v31];
    }
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v32 = v16;
      id v53 = v22;
      LogPrintF();
    }
    else
    {
      id v32 = v16;
    }
    goto LABEL_20;
  }
  id v48 = v15;
  unsigned int v49 = v18;
  uint64_t v46 = v62;
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1 || (v49 = v18, uint64_t v46 = v62, _LogCategory_Initialize()))
    {
      LogPrintF();
      unsigned int v49 = v18;
      uint64_t v46 = v62;
LABEL_32:
      id v17 = v60;
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    [v13 intValue];
    LogPrintF();
  }
  discoveryMap = self->_discoveryMap;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015070;
  v19[3] = &unk_10003D130;
  id v20 = v12;
  uint64_t v21 = self;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = discoveryMap;
  [(NSMutableDictionary *)v18 enumerateKeysAndObjectsUsingBlock:v19];
}

- (int64_t)_updateDeviceStateForWifi:(id)a3 currentState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 discoveryConfiguration];
  unsigned __int8 v8 = [v7 flags];
  id v9 = [v6 SSID];
  id v10 = [v7 hotspotSSIDs];
  if ([v10 count])
  {
    BOOL v11 = 1;
  }
  else
  {
    id v12 = [v7 hotspotSSIDPrefixes];
    BOOL v11 = [v12 count] != 0;
  }
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    DADeviceStateToString();
    v25 = id v24 = v6;
    LogPrintF();
  }
  uint64_t v13 = [v6 bluetoothIdentifier:v24, v25];
  if (v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v11;
  }
  if (!v14)
  {
    id v22 = (void *)v13;
LABEL_32:

    goto LABEL_35;
  }
  if (a4 == 20 || a4 == 10)
  {
    id v15 = [v7 bluetoothCompanyIdentifiers];
    if (![v15 count])
    {
      id v16 = [v7 bluetoothCompanyPayload];
      if (![v16 length])
      {
        id v17 = [v7 bluetoothCompanyPayloadMask];
        if ([v17 length])
        {
        }
        else
        {
          id v31 = v17;
          id v18 = [v7 bluetoothNameSubstring];
          if ([v18 length])
          {
          }
          else
          {
            uint64_t v30 = v18;
            id v19 = [v7 bluetoothServicePayload];
            if ([v19 length])
            {
            }
            else
            {
              id v29 = v19;
              id v20 = [v7 bluetoothServicePayloadMask];
              if (![v20 length])
              {
                BOOL v27 = [v7 bluetoothServices];
                id v28 = [v27 count];

                [(DADaemonServer *)self _cleanupBTDiscovery];
                [(DADaemonServer *)self _cleanupWiFiDiscovery];
                if (!v28)
                {
                  int64_t v21 = a4;
                  if (v9)
                  {
                    if ((v8 & 0x10) != 0) {
                      int64_t v21 = 20;
                    }
                    else {
                      int64_t v21 = 25;
                    }
                  }
                  goto LABEL_29;
                }
LABEL_28:
                int64_t v21 = 20;
LABEL_29:
                if (dword_100043408 > 50 || dword_100043408 == -1 && !_LogCategory_Initialize())
                {
                  a4 = v21;
                  goto LABEL_35;
                }
                id v22 = DADeviceStateToString();
                BOOL v26 = DADeviceStateToString();
                LogPrintF();

                a4 = v21;
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
    [(DADaemonServer *)self _cleanupBTDiscovery];
    [(DADaemonServer *)self _cleanupWiFiDiscovery];
    goto LABEL_28;
  }
LABEL_35:

  return a4;
}

- (void)_updateWiFiManagerIfNeeded
{
  [(DADaemonServer *)self _cleanupWiFiDiscovery];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSMutableArray array];
  id v4 = self->_discoveryMap;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100015B80;
  v10[3] = &unk_10003CF88;
  id v5 = v3;
  id v11 = v5;
  [(NSMutableDictionary *)v4 enumerateKeysAndObjectsUsingBlock:v10];
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v5;
    LogPrintF();
  }
  if (objc_msgSend(v5, "count", v8))
  {
    id v6 = objc_alloc_init(DAWiFiScanner);
    wifiScanner = self->_wifiScanner;
    self->_wifiScanner = v6;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100016500;
    v9[3] = &unk_10003D180;
    v9[4] = self;
    [(DAWiFiScanner *)self->_wifiScanner setResultsHandler:v9];
    [(DAWiFiScanner *)self->_wifiScanner startScanningWithDescriptors:v5];
  }
  else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_cleanupWiFiDiscovery
{
  wifiScanner = self->_wifiScanner;
  if (wifiScanner)
  {
    [(DAWiFiScanner *)wifiScanner stopScanning];
    id v4 = self->_wifiScanner;
    self->_wifiScanner = 0;
  }
}

- (void)_forgetWiFiDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CWFInterface) initWithServiceType:2];
  [v4 activate];
  id v5 = [v4 knownNetworkProfilesWithProperties:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016CEC;
  v8[3] = &unk_10003D1A8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
}

- (void)_updateWiFiDevice:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v5;
    id v13 = v6;
    LogPrintF();
  }
  id v7 = [v5 identifier:v12, v13];
  if (v7)
  {
    id v8 = [v5 SSID];
    if (v8)
    {
      id v9 = [objc_alloc((Class)CWFInterface) initWithServiceType:2];
      [v9 activate];
      id v10 = [v9 knownNetworkProfilesWithProperties:0];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000170A0;
      v14[3] = &unk_10003D1D0;
      id v15 = v7;
      id v16 = v8;
      id v17 = v9;
      id v18 = v6;
      id v19 = v5;
      id v11 = v9;
      [v10 enumerateObjectsUsingBlock:v14];
    }
  }
}

- (void)_addTXTRecordToNWEndpoint:(id)a3 appID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v35[0] = 0;
  v35[1] = v35;
  void v35[2] = 0x3032000000;
  v35[3] = sub_100003B10;
  v35[4] = sub_100003B20;
  id v36 = 0;
  id v7 = [v5 networkEndpoint];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100017A44;
  v31[3] = &unk_10003D1F8;
  id v34 = v35;
  id v8 = v5;
  id v32 = v8;
  id v9 = v6;
  id v33 = v9;
  id v10 = objc_retainBlock(v31);
  if (!v7)
  {
    id v18 = (id)NSErrorF_safe();
    goto LABEL_22;
  }
  if (nw_endpoint_get_type(v7) == nw_endpoint_type_bonjour_service)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      int64_t v21 = [v8 identifier];
      id v22 = v9;
      id v19 = v7;
      LogPrintF();
    }
    id v12 = [v8 txtRecordData:v19, v21, v22];
    id v11 = v12;
    if (v12)
    {
      id v13 = v12;
      BOOL v14 = nw_txt_record_create_with_bytes((const uint8_t *)[v13 bytes], (size_t)[v13 length]);
      if (v14)
      {
        size_t out_signature_length = 0;
        signature = nw_endpoint_get_signature(v7, &out_signature_length);
        int v29 = 0;
        uint64_t v16 = off_100043600((uint64_t)signature, out_signature_length, (uint64_t)&v29);
        id v17 = (void *)v16;
        if (v16)
        {
          access_bytes[0] = _NSConcreteStackBlock;
          access_bytes[1] = 3221225472;
          access_bytes[2] = sub_100017B24;
          access_bytes[3] = &unk_10003D220;
          uint64_t v28 = v16;
          id v24 = v9;
          id v25 = v8;
          BOOL v26 = v7;
          BOOL v27 = v14;
          nw_txt_record_access_bytes(v14, access_bytes);

          off_100043610(v17);
        }
        else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v20 = CUPrintErrorCode();
          LogPrintF();
        }
      }
    }
    goto LABEL_21;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v11 = [v8 identifier];
    LogPrintF();
LABEL_21:
  }
LABEL_22:
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(v35, 8);
}

- (void)_addSSDPDatatoNWEndpoint:(id)a3 appID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_100003B10;
  v55[4] = sub_100003B20;
  id v56 = 0;
  id v7 = [v5 networkEndpoint];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000185F4;
  v51[3] = &unk_10003D1F8;
  id v54 = v55;
  id v8 = v5;
  id v52 = v8;
  id v9 = v6;
  id v53 = v9;
  id v10 = objc_retainBlock(v51);
  if (!v7)
  {
    id v30 = (id)NSErrorF_safe();
    goto LABEL_50;
  }
  nw_endpoint_type_t type = nw_endpoint_get_type(v7);
  if (type && type != nw_endpoint_type_bonjour_service)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v33 = [v8 identifier];
      id v34 = v9;
      id v32 = v7;
      LogPrintF();
    }
    dictionary = nw_txt_record_create_dictionary();
    id v13 = [v8 url];
    txt_record = dictionary;
    if (v13)
    {
      if (+[DADevice deviceMetadataURLValid:v13])
      {
        if (dword_100043408 <= 30)
        {
          if (dword_100043408 != -1 || _LogCategory_Initialize())
          {
            id v33 = [v8 identifier:v32 v33:v34];
            id v34 = v13;
            id v32 = v9;
            LogPrintF();
          }
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v33 = [v8 identifier:v32 identifier:v33 identifier:v34];
            id v34 = v13;
            id v32 = v9;
            LogPrintF();
          }
        }
        id v16 = [v13 host];
        id v17 = (const char *)[v16 UTF8String];

        if (!v17
          || ([v13 port],
              id v18 = objc_claimAutoreleasedReturnValue(),
              id v19 = (const char *)[v18 utf8ValueSafe],
              v18,
              !v19))
        {
          id v31 = (id)NSErrorF_safe();

          goto LABEL_49;
        }
        secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
        id v20 = v13;
        host = nw_endpoint_create_host(v17, v19);
        int64_t v21 = nw_connection_create(host, secure_tcp);
        dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
        uint64_t v47 = 0;
        id v48 = &v47;
        uint64_t v49 = 0x2020000000;
        char v50 = 0;
        id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        queue = dispatch_queue_create("DAConnectionQueue", v22);

        id v13 = v20;
        nw_connection_set_queue(v21, queue);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000186D4;
        handler[3] = &unk_10003D248;
        unsigned int v45 = v17;
        uint64_t v46 = v19;
        id v15 = v21;
        uint64_t v40 = v15;
        id v41 = v9;
        id v42 = v8;
        id v44 = &v47;
        id v23 = v35;
        id v43 = v23;
        nw_connection_set_state_changed_handler(v15, handler);
        nw_connection_start(v15);
        dispatch_time_t v24 = dispatch_time(0, 3000000000);
        if (dispatch_semaphore_wait(v23, v24)
          && dword_100043408 <= 30
          && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (*((unsigned char *)v48 + 24))
        {
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v25 = [v20 absoluteString];
          BOOL v26 = (const char *)[v25 UTF8String];

          size_t v27 = strlen(v26);
          nw_txt_record_set_key(txt_record, "DDDeviceURL", (const uint8_t *)v26, v27);
        }
        else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        nw_connection_cancel(v15);

        _Block_object_dispose(&v47, 8);
      }
      else
      {
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v33 = [v8 identifier:v32 identifier:v33 identifier:v34];
          id v34 = v13;
          id v32 = v9;
          LogPrintF();
        }
        v57[0] = @"BundleID";
        v57[1] = @"SupportsSSDP";
        v58[0] = v9;
        v58[1] = &off_10003E560;
        v57[2] = @"SSDPProtocol";
        secure_tcp = [NSNumber numberWithInteger:objc_msgSend(v8, "protocol", v32, v33, v34)];
        v58[2] = secure_tcp;
        host = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
        id v15 = [v8 identifier];
        +[DADeviceAccessAnalytics sendAnalyticsInfo:host forEvent:@"com.apple.DeviceAccess.SSDPMetadataInvalidURL" withDeviceIdentifier:v15];
      }
    }
    dictionary = txt_record;
    if ([v8 protocol] == (id)1)
    {
      uint64_t v28 = (const char *)[DADeviceProtocolDIAL UTF8String];
      size_t v29 = strlen(v28);
      nw_txt_record_set_key(txt_record, "DDDeviceProtocolType", (const uint8_t *)v28, v29);
    }
    nw_endpoint_set_txt_record();
    goto LABEL_49;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    dictionary = [v8 identifier];
    LogPrintF();
LABEL_49:
  }
LABEL_50:
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(v55, 8);
}

- (void)_necpCleanupIfNeeded
{
  if (![(NSMutableDictionary *)self->_discoveryMap count])
  {
    int necpFD = self->_necpFD;
    if ((necpFD & 0x80000000) == 0)
    {
      if (dword_100043408 > 30) {
        goto LABEL_16;
      }
      if (dword_100043408 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int necpFD = self->_necpFD;
      if ((necpFD & 0x80000000) == 0)
      {
LABEL_16:
        if (close(necpFD))
        {
          if (*__error()) {
            __error();
          }
        }
        self->_int necpFD = -1;
      }
    }
  }
}

- (void)_necpSignEndpointForDevice:(id)a3 appID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_100003B10;
  id v34 = sub_100003B20;
  id v35 = 0;
  [v6 networkEndpoint];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100018E9C;
  v25[3] = &unk_10003D270;
  size_t v29 = &v30;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v26 = v8;
  id v9 = v6;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  id v11 = objc_retainBlock(v25);
  if (!v8)
  {
    id v18 = (id)NSErrorF_safe();
    goto LABEL_24;
  }
  if (!nw_endpoint_has_signature())
  {
    id v12 = [v9 identifier];
    if (v12)
    {
      nw_endpoint_type_t type = nw_endpoint_get_type(v8);
      if (type == nw_endpoint_type_host)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        id v16 = [(DADaemonServer *)self _necpUUIDForAppID:v10 deviceID:v12 uuidBytes:&v36];
        id v17 = (id *)(v31 + 5);
        id v23 = (id)v31[5];
        [(DADaemonServer *)self _necpSignHostnameEndpoint:v8 uuidBytes:&v36 error:&v23];
        objc_storeStrong(v17, v23);
        if (!v31[5] && dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          int64_t v21 = [v9 identifier];
          LogPrintF();
        }
      }
      else if (type == nw_endpoint_type_address)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        BOOL v14 = [(DADaemonServer *)self _necpUUIDForAppID:v10 deviceID:v12 uuidBytes:&v36];
        id v15 = (id *)(v31 + 5);
        id obj = (id)v31[5];
        [(DADaemonServer *)self _necpSignAddressEndpoint:v8 uuidBytes:&v36 error:&obj];
        objc_storeStrong(v15, obj);
        if (!v31[5] && dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          id v20 = [v9 identifier];
          LogPrintF();
        }
      }
      else if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        id v22 = [v9 identifier];
        LogPrintF();
      }
    }
    else
    {
      id v19 = (id)NSErrorF_safe();
    }
    goto LABEL_23;
  }
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v12 = [v9 identifier];
    LogPrintF();
LABEL_23:
  }
LABEL_24:
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v30, 8);
}

- (BOOL)_necpSignAddressEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5
{
  id v8 = a3;
  if (!nw_endpoint_get_address(v8))
  {
    if (!a5) {
      goto LABEL_25;
    }
LABEL_29:
    NSErrorF_safe();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  id v9 = malloc_type_calloc(1uLL, 0x58uLL, 0xE37DE6CCuLL);
  if (!v9)
  {
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  id v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000192A0;
  v14[3] = &unk_10003D290;
  void v14[4] = v9;
  id v11 = objc_retainBlock(v14);
  void v10[2] = *(_OWORD *)a4;
  *((void *)v10 + 6) = 4;
  SockAddrCopy();
  *((_DWORD *)v10 + 21) = 0;
  if (self->_necpFD < 0)
  {
    int v12 = necp_open();
    self->_int necpFD = v12;
    if (v12 < 0 && (!*__error() || *__error()))
    {
      if (!a5) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  if (necp_client_action() && (!*__error() || *__error()))
  {
    if (!a5) {
      goto LABEL_24;
    }
LABEL_23:
    NSErrorF_safe();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (necp_client_action() && (!*__error() || *__error()))
  {
    if (!a5) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  nw_endpoint_set_signature();
LABEL_24:
  ((void (*)(void *))v11[2])(v11);

LABEL_25:
  return 0;
}

- (BOOL)_necpSignHostnameEndpoint:(id)a3 uuidBytes:(unsigned __int8)a4[16] error:(id *)a5
{
  id v8 = a3;
  hostname = nw_endpoint_get_hostname(v8);
  if (!hostname)
  {
    if (!a5) {
      goto LABEL_27;
    }
LABEL_33:
    NSErrorF_safe();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  id v10 = hostname;
  size_t v11 = strlen(hostname);
  if (v11 >= 0x10000)
  {
    if (!a5) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  size_t v12 = v11;
  uint16_t port = nw_endpoint_get_port(v8);
  BOOL v14 = malloc_type_calloc(1uLL, v12 + 62, 0xED737C9DuLL);
  if (!v14)
  {
    if (!a5) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  id v15 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100019650;
  v19[3] = &unk_10003D290;
  void v19[4] = v14;
  id v16 = objc_retainBlock(v19);
  v15[2] = *(_OWORD *)a4;
  *((void *)v15 + 6) = 6;
  *((_WORD *)v15 + 28) = 0;
  *((_WORD *)v15 + 29) = port;
  *((_WORD *)v15 + 30) = v12;
  memcpy((char *)v15 + 62, v10, v12);
  if ((char *)v15 + v12 + 62 != (char *)v15 + v12 + 62)
  {
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (self->_necpFD < 0)
  {
    int v17 = necp_open();
    self->_int necpFD = v17;
    if (v17 < 0 && (!*__error() || *__error()))
    {
      if (!a5) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  if (necp_client_action() && (!*__error() || *__error()))
  {
    if (!a5) {
      goto LABEL_26;
    }
LABEL_25:
    NSErrorF_safe();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (necp_client_action() && (!*__error() || *__error()))
  {
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  nw_endpoint_set_signature();
LABEL_26:
  ((void (*)(void *))v16[2])(v16);

LABEL_27:
  return 0;
}

- (void)_necpRemoveUUIDsForAppID:(id)a3 deviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@", v7, v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019720;
  v9[3] = &unk_10003D2E0;
  v9[4] = v8;
  [(DADaemonServer *)self _necpUpdateUUIDsWithBlock:v9];
}

- (void)_necpUpdateValueStrings:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019A28;
  v5[3] = &unk_10003D2E0;
  id v6 = a3;
  id v4 = v6;
  [(DADaemonServer *)self _necpUpdateUUIDsWithBlock:v5];
}

- (void)_necpUpdateUUIDForAppID:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  if (v8)
  {
    id v9 = [v7 networkEndpoint];
    if (v9) {
      goto LABEL_4;
    }
    id v10 = [(NSMutableDictionary *)self->_discoveryMap objectForKeyedSubscript:v6];
    size_t v11 = [v10 deviceMap];
    size_t v12 = [v11 objectForKeyedSubscript:v8];
    id v9 = [v12 networkEndpoint];

    if (v9)
    {
LABEL_4:
      size_t out_signature_length = 0;
      signature = nw_endpoint_get_signature(v9, &out_signature_length);
      if (signature)
      {
        if (out_signature_length > 0x2F)
        {
          id v14 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:signature + 32];
          id v15 = [v14 UUIDString];

          id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@", v6, v8];
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            id v18 = v8;
            id v19 = v15;
            id v17 = v6;
            LogPrintF();
          }
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10001A000;
          v20[3] = &unk_10003D308;
          v20[4] = v15;
          v20[5] = v16;
          -[DADaemonServer _necpUpdateUUIDsWithBlock:](self, "_necpUpdateUUIDsWithBlock:", v20, v17, v18, v19);

          goto LABEL_11;
        }
        if (dword_100043408 > 90 || dword_100043408 == -1 && !_LogCategory_Initialize())
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else if (dword_100043408 > 90 || dword_100043408 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_11;
      }
      LogPrintF();
      goto LABEL_11;
    }
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
LABEL_24:
    }
      LogPrintF();
  }
  else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_24;
  }
LABEL_12:
}

- (void)_necpUpdateUUIDsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v33 = 0;
  id v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_100003B10;
  uint64_t v37 = sub_100003B20;
  id v38 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001A564;
  v32[3] = &unk_10003CAE8;
  v32[4] = &v33;
  id v5 = objc_retainBlock(v32);
  id v6 = +[NSFileManager defaultManager];
  id v7 = v34 + 5;
  id obj = v34[5];
  id v8 = [v6 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&obj];
  objc_storeStrong(v7, obj);

  if (!v8)
  {
    uint64_t v25 = DANestedErrorF();
    id v9 = v34[5];
    void v34[5] = (id)v25;
    goto LABEL_21;
  }
  id v9 = [v8 URLByAppendingPathComponent:@"com.apple.DeviceAccess" isDirectory:1];
  id v10 = +[NSFileManager defaultManager];
  size_t v11 = v34 + 5;
  id v30 = v34[5];
  unsigned __int8 v12 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v30];
  objc_storeStrong(v11, v30);

  if (v12)
  {
    id v13 = [v9 URLByAppendingPathComponent:@"DANetworkUUIDs.plist" isDirectory:0];
    id v14 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v13 error:0];
    id v15 = [v14 mutableCopy];
    id v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v20 = v17;

    v4[2](v4, v20);
    if ([v20 isEqual:v14])
    {
      if (dword_100043408 <= 20 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        [v14 count];
        LogPrintF();
      }
      goto LABEL_20;
    }
    int64_t v21 = v34;
    id v29 = 0;
    id v22 = +[NSPropertyListSerialization dataWithPropertyList:v20 format:200 options:0 error:&v29];
    objc_storeStrong(v21 + 5, v29);
    id v23 = v34 + 5;
    if (v22)
    {
      id v28 = v34[5];
      unsigned __int8 v24 = [v22 writeToURL:v13 options:1073741825 error:&v28];
      objc_storeStrong(v23, v28);
      if (v24)
      {
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          [v20 count];
          LogPrintF();
        }
        goto LABEL_19;
      }
      uint64_t v26 = DANestedErrorF();
    }
    else
    {
      uint64_t v26 = DANestedErrorF();
    }
    id v27 = v34[5];
    void v34[5] = (id)v26;

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v18 = DANestedErrorF();
  id v19 = v34[5];
  void v34[5] = (id)v18;

  v39[0] = @"Method";
  id v13 = NSStringFromSelector(a2);
  v40[0] = v13;
  v39[1] = @"Error";
  id v14 = +[NSNumber numberWithInteger:350006];
  v40[1] = v14;
  id v20 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  +[DADeviceAccessAnalytics sendAnalytics:v20 forEvent:@"com.apple.DeviceAccess.Error"];
LABEL_20:

LABEL_21:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v33, 8);
}

- (id)_necpUUIDForAppID:(id)a3 deviceID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  memset(&v18, 0, sizeof(v18));
  id v7 = a4;
  id v8 = a3;
  CC_SHA256_Init(&v18);
  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String:*(_OWORD *)v18.count :*(_OWORD *)&v18.hash[2] :*(_OWORD *)&v18.hash[6] :*(_OWORD *)&v18.wbuf[2] :*(_OWORD *)&v18.wbuf[6] :*(_OWORD *)&v18.wbuf[10] :*(void *)&v18.wbuf[14]];

  CC_LONG v11 = strlen(v10);
  CC_SHA256_Update(&v18, v10, v11);
  id v12 = v7;
  id v13 = (const char *)[v12 UTF8String];

  CC_LONG v14 = strlen(v13);
  CC_SHA256_Update(&v18, v13, v14);
  CC_SHA256_Final(md, &v18);
  memset(out, 0, 37);
  uuid_unparse_upper(md, out);
  uuid_parse(out, a5);
  id v15 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a5];
  id v16 = [v15 UUIDString];

  return v16;
}

- (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v8, @"daappdata"];
  CC_LONG v11 = NSTemporaryDirectory();
  id v12 = +[NSURL fileURLWithPath:v11];
  id v13 = [v12 URLByAppendingPathComponent:v10 isDirectory:0];

  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v41 = v13;
    LogPrintF();
  }
  id v14 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v13 error:0];
  double Current = CFAbsoluteTimeGetCurrent();
  id v16 = [v14 objectForKeyedSubscript:@"ipfragtime"];

  if (!v16 || (CFDictionaryGetDouble(), Current - v17 >= self->_prefAppPartialIPUpdateMinCadenceSeconds))
  {
    id v18 = [v14 mutableCopy:v41];
    id v19 = v18;
    id v47 = v8;
    id v44 = v13;
    id v45 = v10;
    id v42 = a5;
    id v43 = v14;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v48 = v20;

    uint64_t v49 = +[NSMutableArray array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v46 = v9;
    id v21 = v9;
    id v22 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v53;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v53 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v27 = +[NSMutableDictionary dictionary];
          id v28 = [v26 address];
          [v27 setObject:v28 forKeyedSubscript:@"ipfragaddr"];

          id v29 = [v26 mask];
          [v27 setObject:v29 forKeyedSubscript:@"ipfragmask"];

          [v49 addObject:v27];
        }
        id v23 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v23);
    }

    id v30 = v48;
    [v48 setObject:v49 forKeyedSubscript:@"ipfrag"];
    id v31 = +[NSNumber numberWithDouble:Current];
    [v48 setObject:v31 forKeyedSubscript:@"ipfragtime"];

    id v51 = 0;
    uint64_t v32 = +[NSPropertyListSerialization dataWithPropertyList:v48 format:200 options:0 error:&v51];
    id v33 = v51;
    id v34 = v33;
    if (v32)
    {
      id v50 = v33;
      id v13 = v44;
      unsigned __int8 v35 = [v32 writeToURL:v44 options:1073741825 error:&v50];
      id v36 = v50;

      id v10 = v45;
      id v9 = v46;
      if (v35)
      {
        BOOL v37 = 1;
LABEL_20:
        id v34 = v36;
        id v8 = v47;
        id v14 = v43;
LABEL_21:

        goto LABEL_22;
      }
      if (!v42)
      {
        BOOL v37 = 0;
        goto LABEL_20;
      }
      uint64_t v40 = DANestedErrorF();
      id v34 = v36;
      id v8 = v47;
      int v39 = v42;
    }
    else
    {
      id v10 = v45;
      id v9 = v46;
      id v13 = v44;
      int v39 = v42;
      if (!v42)
      {
        BOOL v37 = 0;
        id v8 = v47;
        goto LABEL_31;
      }
      uint64_t v40 = DANestedErrorF();
      id v8 = v47;
    }
    id v14 = v43;
    BOOL v37 = 0;
    *int v39 = v40;
LABEL_31:
    id v30 = v48;
    goto LABEL_21;
  }
  if (a5)
  {
    DAErrorF();
    BOOL v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v37 = 0;
  }
LABEL_22:

  return v37;
}

- (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v5, @"daappdata"];
  id v7 = NSTemporaryDirectory();
  id v8 = +[NSURL fileURLWithPath:v7];
  id v9 = [v8 URLByAppendingPathComponent:v6 isDirectory:0];

  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v9;
    LogPrintF();
  }
  id v34 = 0;
  id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v9 error:&v34];
  id v11 = v34;
  if (v11)
  {
    DANestedErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v25 = v9;
    id v26 = v6;
    id v27 = v5;
    id v29 = +[NSMutableArray array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v10;
    id obj = [v10 objectForKeyedSubscript:@"ipfrag"];
    id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(obj);
          }
          double v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v18 = [v17 objectForKeyedSubscript:@"ipfragaddr" v23];
          id v19 = [v17 objectForKeyedSubscript:@"ipfragmask"];
          id v20 = [[DAPartialIP alloc] initWithAddress:v18 mask:v19];
          int v21 = v13[258];
          if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
          {
            id v23 = [(DAPartialIP *)v20 description];
            LogPrintF();

            id v13 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
          }
          if (v20) {
            [v29 addObject:v20];
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v14);
    }

    id v6 = v26;
    id v5 = v27;
    id v10 = v24;
    id v9 = v25;
    id v11 = 0;
  }

  return v29;
}

- (void)respondToBluetoothPairingRequest:(id)a3 accept:(BOOL)a4 pairingType:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B094;
  block[3] = &unk_10003D330;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dispatchQueue, block);
}

- (id)xpcListenerEndpoint
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_xpcListenerEndpoint;
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = v2->_xpcListener;
    id v6 = v5;
    if (v5)
    {
      xpc_endpoint_t v7 = xpc_endpoint_create(v5);
      objc_storeStrong((id *)&v2->_xpcListenerEndpoint, v7);
      id v4 = v7;
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)_xpcListenerEvent:(id)a3
{
  id v7 = a3;
  id type = xpc_get_type(v7);
  if (type == &_xpc_type_connection)
  {
    id type = [(DADaemonServer *)self _xpcConnectionAccept:v7];
    goto LABEL_7;
  }
  id v5 = v7;
  if (v7 == &_xpc_error_connection_invalid)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 != -1 || (type = (id)_LogCategory_Initialize(), id v5 = v7, type))
      {
        id type = (id)LogPrintF();
        goto LABEL_7;
      }
    }
  }
  else if (dword_100043408 <= 90)
  {
    if (dword_100043408 != -1 || (type = (id)_LogCategory_Initialize(), id v5 = v7, type))
    {
      id v6 = CUPrintXPC();
      LogPrintF();

LABEL_7:
      id v5 = v7;
    }
  }

  _objc_release_x1(type, v5);
}

- (void)_xpcConnectionAccept:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  id v5 = objc_alloc_init(DADaemonXPCConnection);
  [(DADaemonXPCConnection *)v5 setDaemon:self];
  [(DADaemonXPCConnection *)v5 setDispatchQueue:self->_dispatchQueue];
  [(DADaemonXPCConnection *)v5 setPid:xpc_connection_get_pid(v4)];
  [(DADaemonXPCConnection *)v5 setXpcCnx:v4];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001B3C8;
  handler[3] = &unk_10003C978;
  void handler[4] = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);

  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v5];
  [(DADaemonXPCConnection *)v5 activate];
}

- (void)xpcConnectionInvalidated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_btScanRefreshTimer, 0);
  objc_storeStrong((id *)&self->_btPairingManager, 0);
  objc_storeStrong((id *)&self->_cbDADeviceMap, 0);
  objc_storeStrong((id *)&self->_cbScanFilterArray, 0);
  objc_storeStrong((id *)&self->_cbMigrationCentralManager, 0);
  objc_storeStrong((id *)&self->_cbCentralManager, 0);
  objc_storeStrong((id *)&self->_cbScanClient, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_expiredDeviceChecktransaction, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryMap, 0);
  objc_storeStrong((id *)&self->_deviceStateTimer, 0);
  objc_storeStrong((id *)&self->_deviceNECPValueStrings, 0);
  objc_storeStrong((id *)&self->_checkDevicesTimer, 0);
  objc_storeStrong((id *)&self->_checkAppAccessInfoTimer, 0);
  objc_storeStrong((id *)&self->_appSessionMap, 0);

  objc_storeStrong((id *)&self->_deviceAppAccessInfoMap, 0);
}

@end