@interface SDProximityPairingAgent
+ (SDProximityPairingAgent)sharedProximityPairingAgent;
+ (id)dataFromHexString:(id)a3;
- (BOOL)_shouldShowBatteryCard:(id)a3 inDevice:(id)a4;
- (BOOL)_supportedDevice:(id)a3;
- (BOOL)_systemCanShowUIWithCounterpart:(id)a3;
- (BOOL)_uiShowing;
- (BOOL)isBackgroundCheckReadyForFeature:(id)a3 forDevice:(id)a4;
- (BOOL)launchRemoteAlertWithUserInfo:(id)a3;
- (BOOL)reenableProxCardType:(unsigned __int8)a3;
- (BOOL)shouldNotTriggerBecauseDeviceInformationIsTooOld:(id)a3;
- (BOOL)shouldNotifyForNonGenuineDevice:(id)a3;
- (BOOL)shouldPromptForAdaptiveControlsProx:(id)a3;
- (BOOL)shouldPromptForEndCallProx:(id)a3;
- (BOOL)shouldPromptForMuteCallProx:(id)a3;
- (BOOL)shouldPromptForSiriNotificationForDevice:(id)a3;
- (BOOL)shouldPromptForSpatialAudioProfileForDevice:(id)a3;
- (BOOL)shouldPromptForWhatsNewProx:(id)a3;
- (BOOL)shouldPromptProx:(id)a3 forFeature:(int)a4;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDProximityPairingAgent)init;
- (id)_createNewPowerSourceContainer;
- (id)_testDeviceWithParams:(id)a3;
- (id)bufferedDevicesPurgeBlock;
- (int)_startPairingUI:(id)a3 autoStart:(BOOL)a4 repair:(BOOL)a5;
- (int)_startStatusUI:(id)a3;
- (void)_accountSettingsChanged;
- (void)_activate;
- (void)_bufferedBleDeviceFound:(id)a3;
- (void)_deviceChanged:(id)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceFound:(id)a3 andIsABufferedDevice:(BOOL)a4;
- (void)_deviceLost:(id)a3;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_fastScanStart:(id)a3;
- (void)_fastScanStop:(const char *)a3 reset:(BOOL)a4;
- (void)_invalidate;
- (void)_powerSourceContainerUpdate:(id)a3 device:(id)a4 batteryInfo:(id)a5;
- (void)_powerSourceEnsureStopped;
- (void)_powerSourcesUpdateForDevice:(id)a3 changes:(unsigned int)a4;
- (void)_removeB389sFromTriggeredDevices;
- (void)_resetTriggers;
- (void)_screenStateChanged;
- (void)_uiLockStatusChanged;
- (void)_update;
- (void)activate;
- (void)bluetoothUserInteractionStart:(id)a3;
- (void)bluetoothUserInteractionStop:(id)a3;
- (void)dealloc;
- (void)ensureTimerStartedForBufferedDevicesPurge;
- (void)invalidate;
- (void)notifyForNonGenuineDevice:(id)a3;
- (void)prefsChanged;
- (void)promptForAdaptiveControlsProxForDevice:(id)a3;
- (void)promptForEndCallProxForDevice:(id)a3;
- (void)promptForHeadphoneProxFeature:(id)a3 forDevice:(id)a4;
- (void)promptForMuteCallProxForDevice:(id)a3;
- (void)promptForSiriNotificationsForDevice:(id)a3;
- (void)promptForSpatialAudioProfileForDevice:(id)a3;
- (void)promptForWhatsNewProxForDevice:(id)a3;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)readyToShowWithDevice:(id)a3 features:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)removeOldBufferedSamplesFromCache;
- (void)retriggerProximityPairing:(id)a3;
- (void)setBufferedDevicesPurgeBlock:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)startSoftwareUpdateRequiredUI;
- (void)testPairingUI:(id)a3;
- (void)testStatusUI:(id)a3;
@end

@implementation SDProximityPairingAgent

+ (SDProximityPairingAgent)sharedProximityPairingAgent
{
  if (qword_10097FF08 != -1) {
    dispatch_once(&qword_10097FF08, &stru_1008CD188);
  }
  v2 = (void *)qword_10097FF10;

  return (SDProximityPairingAgent *)v2;
}

- (SDProximityPairingAgent)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDProximityPairingAgent;
  v2 = [(SDProximityPairingAgent *)&v8 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    [(SDProximityPairingAgent *)v2 setBufferedDevicesPurgeBlock:0];
    v5 = objc_alloc_init(_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient);
    headphoneProxFeatureClient = v2->_headphoneProxFeatureClient;
    v2->_headphoneProxFeatureClient = v5;

    [(HeadphoneProxFeatureClient *)v2->_headphoneProxFeatureClient setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_deviceDiscovery)
  {
    v5 = (SDProximityPairingAgent *)FatalErrorF();
    [(SDProximityPairingAgent *)v5 description];
  }
  else
  {
    uint64_t v3 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];

    if (v3)
    {
      v4 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];
      dispatch_block_cancel(v4);

      [(SDProximityPairingAgent *)self setBufferedDevicesPurgeBlock:0];
    }
    v7.receiver = self;
    v7.super_class = (Class)SDProximityPairingAgent;
    [(SDProximityPairingAgent *)&v7 dealloc];
  }
}

- (NSString)description
{
  uint64_t v99 = 0;
  NSAppendPrintF();
  id v3 = 0;
  id v98 = v3;
  if (self->_enabled) {
    v4 = "yes";
  }
  else {
    v4 = "no";
  }
  v5 = " (always)";
  if (!self->_scanAlways) {
    v5 = "";
  }
  v74 = v5;
  obj = v4;
  if (self->_autoPairEnabled) {
    SEL v6 = "yes";
  }
  else {
    SEL v6 = "no";
  }
  if (self->_autoStatusEnabled) {
    objc_super v7 = "yes";
  }
  else {
    objc_super v7 = "no";
  }
  if (self->_autoStatusUnpaired) {
    objc_super v8 = "yes";
  }
  else {
    objc_super v8 = "no";
  }
  uint64_t autoPairRSSI = self->_autoPairRSSI;
  uint64_t autoStatusRSSI = self->_autoStatusRSSI;
  uint64_t exitRSSI = self->_exitRSSI;
  uint64_t v12 = [(SDStatusMonitor *)self->_statusMonitor systemUIFlags];
  uint64_t v13 = 79;
  if (!self->_fastScanStatusOthers) {
    uint64_t v13 = 111;
  }
  uint64_t v14 = 77;
  if (!self->_fastScanStatusMine) {
    uint64_t v14 = 109;
  }
  uint64_t v70 = v14;
  uint64_t v71 = v13;
  uint64_t v15 = 80;
  if (!self->_fastScanPair) {
    uint64_t v15 = 115;
  }
  uint64_t v16 = 65;
  if (!self->_fastScanAlways) {
    uint64_t v16 = 97;
  }
  uint64_t v68 = v16;
  uint64_t v69 = v15;
  uint64_t v17 = 89;
  if (!self->_fastScanTimer) {
    uint64_t v17 = 110;
  }
  uint64_t v66 = v12;
  uint64_t v67 = v17;
  v56 = obj;
  v61 = v74;
  NSAppendPrintF();
  id obja = v98;

  id v97 = obja;
  if (self->_pairingAlertHandle) {
    v18 = "yes";
  }
  else {
    v18 = "no";
  }
  if (self->_statusAlertHandle) {
    v19 = "yes";
  }
  else {
    v19 = "no";
  }
  v73 = v19;
  v75 = v18;
  id v72 = [(NSMutableSet *)self->_bluetoothUserInteractionClients count];
  v20 = +[SDNearbyAgent sharedNearbyAgent];
  id v21 = [v20 bleProximityRSSIThreshold:@"ppEn"];
  v22 = +[SDNearbyAgent sharedNearbyAgent];
  id v23 = [v22 bleProximityRSSIThreshold:@"ppEx"];
  v24 = +[SDNearbyAgent sharedNearbyAgent];
  id v25 = [v24 bleProximityRSSIThreshold:@"ppRp"];
  v26 = +[SDNearbyAgent sharedNearbyAgent];
  id v27 = [v26 bleProximityRSSIThreshold:@"psEn"];
  v28 = +[SDNearbyAgent sharedNearbyAgent];
  id v64 = v27;
  id v65 = [v28 bleProximityRSSIThreshold:@"psEx"];
  NSAppendPrintF();
  id v29 = v97;

  id v96 = v29;
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  id v62 = [(NSMutableDictionary *)self->_devices count];
  id v63 = [(NSMutableDictionary *)self->_triggeredDevices count];
  NSAppendPrintF();
  id v31 = v96;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  objb = self->_devices;
  id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v92, v102, 16, deviceDiscovery, v62, v63);
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v93;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v93 != v34) {
          objc_enumerationMutation(objb);
        }
        uint64_t v36 = *(void *)(*((void *)&v92 + 1) + 8 * i);
        id v91 = v31;
        v58 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v36];
        NSAppendPrintF();
        id v37 = v31;

        v38 = -[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v36, v58);

        if (v38)
        {
          id v90 = v37;
          NSAppendPrintF();
          id v39 = v37;

          id v37 = v39;
        }
        id v89 = v37;
        NSAppendPrintF();
        id v31 = v37;
      }
      id v33 = [(NSMutableDictionary *)objb countByEnumeratingWithState:&v92 objects:v102 count:16];
    }
    while (v33);
  }

  long long v88 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v85 = 0u;
  v40 = self->_triggeredDevices;
  id v41 = [(NSMutableDictionary *)v40 countByEnumeratingWithState:&v85 objects:v101 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v86;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v86 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v85 + 1) + 8 * (void)j);
        v46 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v45, v57);

        if (!v46)
        {
          id v84 = v31;
          v57 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v45];
          NSAppendPrintF();
          id v47 = v31;

          id v31 = v47;
        }
      }
      id v42 = [(NSMutableDictionary *)v40 countByEnumeratingWithState:&v85 objects:v101 count:16];
    }
    while (v42);
  }

  id v83 = v31;
  id v59 = [(NSMutableSet *)self->_powerSourceContainers count];
  NSAppendPrintF();
  id v48 = v31;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v49 = self->_powerSourceContainers;
  id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v100, 16, v59);
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v80;
    do
    {
      v53 = 0;
      v54 = v48;
      do
      {
        if (*(void *)v80 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v60 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v53);
        NSAppendPrintF();
        id v48 = v54;

        v53 = (char *)v53 + 1;
        v54 = v48;
      }
      while (v51 != v53);
      id v51 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v100, 16, v60);
    }
    while (v51);
  }

  return (NSString *)v48;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E49D4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDProximityPairingAgent *)self prefsChanged];
  if (self->_enabled && !self->_proximityPairingBufferedScanner)
  {
    id v3 = [[SDProximityPairingBufferedScanner alloc] initWithQueue:self->_dispatchQueue];
    proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
    self->_proximityPairingBufferedScanner = v3;

    id location = 0;
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    objc_super v7 = sub_1000E4B3C;
    objc_super v8 = &unk_1008CD1B0;
    objc_copyWeak(&v9, &location);
    [(SDProximityPairingBufferedScanner *)self->_proximityPairingBufferedScanner setBufferedDeviceFoundHandler:&v5];
    [(SDProximityPairingBufferedScanner *)self->_proximityPairingBufferedScanner ensureStarted];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4C0C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDProximityPairingAgent *)self _ensureStopped];
  id v3 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];

  if (v3)
  {
    v4 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];
    dispatch_block_cancel(v4);

    [(SDProximityPairingAgent *)self setBufferedDevicesPurgeBlock:0];
  }
}

- (void)_accountSettingsChanged
{
  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDProximityPairingAgent *)self _resetTriggers];
}

- (void)bluetoothUserInteractionStart:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4E04;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)bluetoothUserInteractionStop:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4F5C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_autoPairEnabled != v3)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        v5 = "no";
      }
      else {
        v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      uint64_t v52 = v5;
      v53 = v4;
      LogPrintF();
    }
    self->_autoPairEnabled = v3;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (Int64 <= 999 && Int64 >= -999) {
    uint64_t v9 = Int64;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t autoPairRSSI = (const char *)self->_autoPairRSSI;
  if ((const char *)v9 != autoPairRSSI)
  {
    if (dword_1009673C0 <= 40)
    {
      if (dword_1009673C0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_26;
        }
        uint64_t autoPairRSSI = (const char *)self->_autoPairRSSI;
      }
      uint64_t v52 = autoPairRSSI;
      v53 = (const char *)v9;
      LogPrintF();
    }
LABEL_26:
    self->_uint64_t autoPairRSSI = v9;
  }
  BOOL v11 = CFPrefs_GetInt64() != 0;
  if (self->_autoStatusEnabled != v11)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = "yes";
      if (v11) {
        uint64_t v13 = "no";
      }
      else {
        uint64_t v13 = "yes";
      }
      if (!v11) {
        uint64_t v12 = "no";
      }
      uint64_t v52 = v13;
      v53 = v12;
      LogPrintF();
    }
    self->_autoStatusEnabled = v11;
  }
  BOOL v14 = CFPrefs_GetInt64() != 0;
  if (self->_autoStatusUnpaired != v14)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = "yes";
      if (v14) {
        uint64_t v16 = "no";
      }
      else {
        uint64_t v16 = "yes";
      }
      if (!v14) {
        uint64_t v15 = "no";
      }
      uint64_t v52 = v16;
      v53 = v15;
      LogPrintF();
    }
    self->_autoStatusUnpaired = v14;
  }
  uint64_t v17 = CFPrefs_GetInt64();
  if (v17 <= 999 && v17 >= -999) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t autoStatusRSSI = (const char *)self->_autoStatusRSSI;
  if ((const char *)v20 != autoStatusRSSI)
  {
    if (dword_1009673C0 <= 40)
    {
      if (dword_1009673C0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_63;
        }
        uint64_t autoStatusRSSI = (const char *)self->_autoStatusRSSI;
      }
      uint64_t v52 = autoStatusRSSI;
      v53 = (const char *)v20;
      LogPrintF();
    }
LABEL_63:
    self->_uint64_t autoStatusRSSI = v20;
  }
  BOOL v22 = CFPrefs_GetInt64() != 0;
  if (self->_enabled != v22)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v23 = "yes";
      if (v22) {
        v24 = "no";
      }
      else {
        v24 = "yes";
      }
      if (!v22) {
        id v23 = "no";
      }
      uint64_t v52 = v24;
      v53 = v23;
      LogPrintF();
    }
    self->_enabled = v22;
  }
  uint64_t v25 = CFPrefs_GetInt64();
  if (v25 <= 999 && v25 >= -999) {
    uint64_t v28 = v25;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t exitRSSI = (const char *)self->_exitRSSI;
  if ((const char *)v28 != exitRSSI)
  {
    if (dword_1009673C0 <= 40)
    {
      if (dword_1009673C0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_89;
        }
        uint64_t exitRSSI = (const char *)self->_exitRSSI;
      }
      uint64_t v52 = exitRSSI;
      v53 = (const char *)v28;
      LogPrintF();
    }
LABEL_89:
    self->_uint64_t exitRSSI = v28;
  }
  uint64_t v30 = CFPrefs_GetInt64();
  BOOL v31 = v30 != 0;
  if (self->_fastScanAlways != v31)
  {
    if (dword_1009673C0 <= 40)
    {
      uint64_t v32 = v30;
      if (dword_1009673C0 != -1 || _LogCategory_Initialize())
      {
        id v33 = "yes";
        if (v32) {
          uint64_t v34 = "no";
        }
        else {
          uint64_t v34 = "yes";
        }
        if (!v32) {
          id v33 = "no";
        }
        uint64_t v52 = v34;
        v53 = v33;
        LogPrintF();
      }
    }
    self->_fastScanAlways = v31;
  }
  BOOL v35 = CFPrefs_GetInt64() != 0;
  if (self->_fastScanPair != v35)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v36 = "yes";
      if (v35) {
        id v37 = "no";
      }
      else {
        id v37 = "yes";
      }
      if (!v35) {
        uint64_t v36 = "no";
      }
      uint64_t v52 = v37;
      v53 = v36;
      LogPrintF();
    }
    self->_fastScanPair = v35;
  }
  BOOL v38 = CFPrefs_GetInt64() != 0;
  if (self->_fastScanStatusMine != v38)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v39 = "yes";
      if (v38) {
        v40 = "no";
      }
      else {
        v40 = "yes";
      }
      if (!v38) {
        id v39 = "no";
      }
      uint64_t v52 = v40;
      v53 = v39;
      LogPrintF();
    }
    self->_fastScanStatusMine = v38;
  }
  BOOL v41 = CFPrefs_GetInt64() != 0;
  if (self->_fastScanStatusOthers != v41)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v42 = "yes";
      if (v41) {
        uint64_t v43 = "no";
      }
      else {
        uint64_t v43 = "yes";
      }
      if (!v41) {
        id v42 = "no";
      }
      uint64_t v52 = v43;
      v53 = v42;
      LogPrintF();
    }
    self->_fastScanStatusOthers = v41;
  }
  BOOL v44 = CFPrefs_GetInt64() != 0;
  if (self->_phoneOnly != v44)
  {
    if (dword_1009673C0 <= 40 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v45 = "yes";
      if (v44) {
        v46 = "no";
      }
      else {
        v46 = "yes";
      }
      if (!v44) {
        uint64_t v45 = "no";
      }
      uint64_t v52 = v46;
      v53 = v45;
      LogPrintF();
    }
    self->_phoneOnly = v44;
  }
  uint64_t v47 = CFPrefs_GetInt64();
  BOOL v48 = v47 != 0;
  if (self->_scanAlways != v48)
  {
    if (dword_1009673C0 <= 40)
    {
      uint64_t v49 = v47;
      if (dword_1009673C0 != -1 || _LogCategory_Initialize())
      {
        id v50 = "yes";
        if (v49) {
          id v51 = "no";
        }
        else {
          id v51 = "yes";
        }
        if (!v49) {
          id v50 = "no";
        }
        uint64_t v52 = v51;
        v53 = v50;
        LogPrintF();
      }
    }
    self->_scanAlways = v48;
  }
  [(SDProximityPairingAgent *)self _update];
}

- (BOOL)reenableProxCardType:(unsigned __int8)a3
{
  if (a3 == 102)
  {
    self->_triggeredB389Setup = 0;
  }
  else
  {
    if (a3 != 101) {
      return 0;
    }
    [(SDProximityPairingAgent *)self _removeB389sFromTriggeredDevices];
  }
  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 1;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_enabled && (!self->_phoneOnly || SFIsDevicePhone()))
  {
    [(SDProximityPairingAgent *)self _ensureStarted];
  }
  else
  {
    [(SDProximityPairingAgent *)self _ensureStopped];
  }
}

- (void)_ensureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusMonitor)
  {
    BOOL v3 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_screenStateChanged" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
  }
  if (!self->_systemMonitor)
  {
    id v6 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v6;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000E5EC4;
    v30[3] = &unk_1008CA4B8;
    v30[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000E5ECC;
    v29[3] = &unk_1008CA4B8;
    v29[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000E5ED4;
    v28[3] = &unk_1008CA4B8;
    v28[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setSystemLockStateChangedHandler:v28];
    id v8 = self->_systemMonitor;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000E5EDC;
    v27[3] = &unk_1008CA4B8;
    v27[4] = self;
    [(CUSystemMonitor *)v8 activateWithCompletion:v27];
  }
  if (self->_forceFastScan || self->_scanAlways || [(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (!self->_proximityController)
    {
      uint64_t v9 = +[SDProximityController sharedController];
      proximityController = self->_proximityController;
      self->_proximityController = v9;
    }
    if (!self->_deviceDiscovery)
    {
      if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v13 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
      deviceDiscovery = self->_deviceDiscovery;
      self->_deviceDiscovery = v13;

      [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:13];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:2];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setOverrideScreenOff:self->_forceFastScan];
      [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"PPA"];
      if (self->_forceFastScan) {
        uint64_t v15 = -80;
      }
      else {
        uint64_t v15 = -60;
      }
      [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:v15];
      if (self->_fastScanAlways)
      {
        uint64_t v16 = 50;
      }
      else if (self->_forceFastScan)
      {
        uint64_t v16 = 50;
      }
      else
      {
        uint64_t v16 = 20;
      }
      [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:v16];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000E5EE4;
      v26[3] = &unk_1008CADB8;
      v26[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v26];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000E5EF0;
      v25[3] = &unk_1008CADB8;
      v25[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v25];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000E5EFC;
      v24[3] = &unk_1008CADE0;
      v24[4] = self;
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v24];
      [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1008CD1D0];
    }
    proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
    if (proximityPairingBufferedScanner) {
      [(SDProximityPairingBufferedScanner *)proximityPairingBufferedScanner ensureStarted];
    }
    BOOL v18 = 1;
LABEL_33:
    self->_started = v18;
    return;
  }
  BOOL v11 = self->_proximityPairingBufferedScanner;
  if (v11)
  {
    [(SDProximityPairingBufferedScanner *)v11 turnOffScreenOffScanningIfNoAirPodsOntheAccount];
    [(NSMutableDictionary *)self->_bufferedDevices removeAllObjects];
    bufferedDevices = self->_bufferedDevices;
    self->_bufferedDevices = 0;
  }
  if (self->_deviceDiscovery)
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    v19 = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    [(NSMutableDictionary *)self->_devices removeAllObjects];
    [(SDProximityPairingAgent *)self _resetTriggers];
    [(SDProximityPairingAgent *)self _powerSourceEnsureStopped];
    [(SDProximityPairingAgent *)self _fastScanStop:"screenOff" reset:0];
    pairingAlertHandle = self->_pairingAlertHandle;
    if (pairingAlertHandle)
    {
      [(SBSRemoteAlertHandle *)pairingAlertHandle removeObserver:self];
      [(SBSRemoteAlertHandle *)self->_pairingAlertHandle invalidate];
      id v21 = self->_pairingAlertHandle;
      self->_pairingAlertHandle = 0;
    }
    statusAlertHandle = self->_statusAlertHandle;
    if (statusAlertHandle)
    {
      [(SBSRemoteAlertHandle *)statusAlertHandle removeObserver:self];
      [(SBSRemoteAlertHandle *)self->_statusAlertHandle invalidate];
      id v23 = self->_statusAlertHandle;
      self->_statusAlertHandle = 0;
    }
    BOOL v18 = 0;
    goto LABEL_33;
  }
}

- (void)_ensureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  statusMonitor = self->_statusMonitor;
  self->_statusMonitor = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];

  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;
  }
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;

  [(SDProximityPairingAgent *)self _resetTriggers];
  [(SDProximityPairingAgent *)self _powerSourceEnsureStopped];
  pairingAlertHandle = self->_pairingAlertHandle;
  if (pairingAlertHandle)
  {
    [(SBSRemoteAlertHandle *)pairingAlertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_pairingAlertHandle invalidate];
    uint64_t v9 = self->_pairingAlertHandle;
    self->_pairingAlertHandle = 0;
  }
  statusAlertHandle = self->_statusAlertHandle;
  if (statusAlertHandle)
  {
    [(SBSRemoteAlertHandle *)statusAlertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_statusAlertHandle invalidate];
    BOOL v11 = self->_statusAlertHandle;
    self->_statusAlertHandle = 0;
  }
  [(SDProximityPairingAgent *)self _fastScanStop:"stop" reset:0];
  [(SDProximityController *)self->_proximityController clearDeviceList];
  proximityPairingBufferedScanner = self->_proximityPairingBufferedScanner;
  if (proximityPairingBufferedScanner)
  {
    [(SDProximityPairingBufferedScanner *)proximityPairingBufferedScanner invalidate];
    uint64_t v13 = self->_proximityPairingBufferedScanner;
    self->_proximityPairingBufferedScanner = 0;
  }
  self->_started = 0;
}

- (void)_bufferedBleDeviceFound:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init((Class)SFDevice);
  [v10 updateWithBLEDevice:v4];
  v5 = [v4 identifier];

  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v10 bleDevice];
    LogPrintF();
  }
  bufferedDevices = self->_bufferedDevices;
  if (!bufferedDevices)
  {
    objc_super v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v8 = self->_bufferedDevices;
    self->_bufferedDevices = v7;

    bufferedDevices = self->_bufferedDevices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](bufferedDevices, "setObject:forKeyedSubscript:", v10, v5, v9);
  if (self->_started)
  {
    [(SDProximityPairingAgent *)self _deviceFound:v10 andIsABufferedDevice:1];
    [(SDProximityPairingAgent *)self ensureTimerStartedForBufferedDevicesPurge];
  }
}

- (void)_deviceFound:(id)a3
{
}

- (void)_deviceFound:(id)a3 andIsABufferedDevice:(BOOL)a4
{
  id v11 = a3;
  id v6 = [v11 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery)
  {
    if (dword_1009673C0 <= 9 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    if (v6)
    {
      devices = self->_devices;
      if (!devices)
      {
        id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v9 = self->_devices;
        self->_devices = v8;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v6, v10);
      [(SDProximityPairingAgent *)self _deviceChanged:v11];
      if (!a4) {
        [(SDProximityPairingAgent *)self _powerSourcesUpdateForDevice:v11 changes:0xFFFFFFFFLL];
      }
    }
  }
}

- (void)_deviceLost:(id)a3
{
  id v10 = a3;
  id v4 = [v10 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009673C0 <= 9 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v10;
    LogPrintF();
  }
  if (v4)
  {
    v5 = [v10 model];
    if (v5 == @"Device1,21760"
      || (id v6 = v5) != 0
      && (unsigned int v7 = [(__CFString *)v5 isEqual:@"Device1,21760"],
          v6,
          v6,
          v7))
    {
      id v8 = +[SDB389SetupAgent shared];
      [v8 advertisingB389Lost:v4];
    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v9);
    [(SDProximityPairingAgent *)self _update];
  }
}

- (void)_deviceChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [v4 bleDevice];
  unsigned int v7 = [v6 counterpartIdentifier];
  id v8 = [v6 advertisementFields];
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v5 || !self->_deviceDiscovery) {
    goto LABEL_116;
  }
  [(NSMutableDictionary *)self->_devices setObject:v4 forKeyedSubscript:v5];
  id v10 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v5];
  if (!v10 && v7)
  {
    id v10 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v7];
  }
  if (!v10)
  {
    if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:v7]) {
      goto LABEL_116;
    }
    long long v82 = v8;
    __int16 v11 = CFDictionaryGetInt64Ranged();
    int v12 = Int64Ranged;
    if (Int64Ranged == 5)
    {
      unint64_t autoPairRSSI = self->_autoPairRSSI;
      if (!autoPairRSSI)
      {
        BOOL v14 = +[SDNearbyAgent sharedNearbyAgent];
        unint64_t autoPairRSSI = (unint64_t)[v14 bleProximityRSSIThresholdForType:8 device:v4];
      }
      id v8 = v82;
      if ((autoPairRSSI & 0x8000000000000000) == 0) {
        goto LABEL_116;
      }
      uint64_t v15 = v7;
      unint64_t v16 = (unint64_t)[v6 rssiFloor];
      [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v4];
      unint64_t v17 = [(SDProximityController *)self->_proximityController checkDeviceRegion:v4];
      if (_os_feature_enabled_impl())
      {
        if (v17 == 2)
        {
          if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_81;
          }
          goto LABEL_49;
        }
LABEL_53:
        if (self->_fastScanPair) {
          [(SDProximityPairingAgent *)self _fastScanStart:v4];
        }
        goto LABEL_110;
      }
      unsigned int v7 = v15;
      if ((v16 & 0x8000000000000000) != 0 && autoPairRSSI <= v16)
      {
        if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_81;
        }
LABEL_49:
        LogPrintF();
LABEL_81:
        BOOL v41 = +[SDStatusMonitor sharedMonitor];
        unsigned int v42 = [v41 deviceKeyBagLocked];

        if (v42)
        {
          if (dword_1009673C0 <= 30)
          {
            unsigned int v7 = v15;
            if (dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_116;
            }
            goto LABEL_84;
          }
LABEL_110:
          id v10 = 0;
          unsigned int v7 = v15;
          goto LABEL_117;
        }
        if (self->_triggeredB389Setup)
        {
          id v72 = v6;
          id v73 = v4;
          v74 = v72;
          if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v10 = 0;
          v75 = v74;
          id v4 = v73;
          id v6 = v75;
          unsigned int v7 = v15;
          goto LABEL_77;
        }
        unsigned int v7 = v15;
        if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
        {
          v76 = (void *)autoPairRSSI;
          id v78 = v6;
          LogPrintF();
        }
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          BOOL v44 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v45 = self->_triggeredDevices;
          self->_triggeredDevices = v44;

          triggeredDevices = self->_triggeredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDevices, "setObject:forKeyedSubscript:", v4, v5, v76, v78);
        self->_triggeredB389Setup = 1;
        v46 = +[SDB389SetupAgent shared];
        [v46 advertisingB389Found:v4];

LABEL_116:
        id v10 = 0;
        goto LABEL_117;
      }
LABEL_71:
      if (self->_fastScanPair) {
        [(SDProximityPairingAgent *)self _fastScanStart:v4];
      }
      goto LABEL_116;
    }
    __int16 v28 = v11;
    if (self->_autoPairEnabled && [v4 needsSetup])
    {
      if ((v28 & 0x24) == 0)
      {
        id v8 = v82;
        if (CFDictionaryGetInt64()) {
          goto LABEL_116;
        }
        unint64_t v29 = self->_autoPairRSSI;
        if (!v29)
        {
          uint64_t v30 = +[SDNearbyAgent sharedNearbyAgent];
          unint64_t v29 = (unint64_t)[v30 bleProximityRSSIThresholdForType:1 device:v4];
        }
        uint64_t v15 = v7;
        if ((v29 & 0x8000000000000000) == 0) {
          goto LABEL_110;
        }
        unint64_t v31 = (unint64_t)[v6 rssiFloor];
        [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v4];
        unint64_t v32 = [(SDProximityController *)self->_proximityController checkDeviceRegion:v4];
        if (_os_feature_enabled_impl())
        {
          if (v32 != 2) {
            goto LABEL_53;
          }
          if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_98;
          }
        }
        else
        {
          unsigned int v7 = v15;
          if ((v31 & 0x8000000000000000) == 0 || v29 > v31) {
            goto LABEL_71;
          }
          if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_98;
          }
        }
        LogPrintF();
LABEL_98:
        uint64_t v47 = +[SDStatusMonitor sharedMonitor];
        unsigned int v48 = [v47 deviceKeyBagLocked];

        if (v48)
        {
          double v49 = CACurrentMediaTime();
          BKSHIDServicesLastUserEventTime();
          if (v49 - v50 > 30.0)
          {
            if (dword_1009673C0 > 30) {
              goto LABEL_110;
            }
            unsigned int v7 = v15;
            if (dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_116;
            }
LABEL_84:
            LogPrintF();
            goto LABEL_116;
          }
          if (![(SDProximityPairingAgent *)self _supportedDevice:v4])
          {
            if (dword_1009673C0 > 30) {
              goto LABEL_110;
            }
            unsigned int v7 = v15;
            if (dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_116;
            }
            goto LABEL_84;
          }
        }
        if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
        {
          id v78 = v4;
          long long v79 = v6;
          v76 = (void *)v29;
          LogPrintF();
        }
        -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger pair", 1, v76, v78, v79);
        id v51 = self->_triggeredDevices;
        unsigned int v7 = v15;
        if (!v51)
        {
          uint64_t v52 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v53 = self->_triggeredDevices;
          self->_triggeredDevices = v52;

          id v51 = self->_triggeredDevices;
        }
        [(NSMutableDictionary *)v51 setObject:v4 forKeyedSubscript:v5];
        v54 = self;
        id v55 = v4;
        uint64_t v56 = 0;
LABEL_115:
        [(SDProximityPairingAgent *)v54 _startPairingUI:v55 autoStart:0 repair:v56];
        goto LABEL_116;
      }
LABEL_41:
      id v10 = 0;
LABEL_77:
      id v8 = v82;
      goto LABEL_117;
    }
    if (!self->_autoStatusEnabled
      || ([v4 needsSetup] & 1) != 0
      || !self->_autoStatusUnpaired && ![v4 paired])
    {
      goto LABEL_41;
    }
    long long v81 = v7;
    if ((v28 & 0x400) == 0)
    {
      id v33 = [v4 model];
      int v34 = sub_1000E755C(v33);

      if (!v34) {
        goto LABEL_147;
      }
    }
    unint64_t autoStatusRSSI = self->_autoStatusRSSI;
    if (!autoStatusRSSI)
    {
      uint64_t v36 = +[SDNearbyAgent sharedNearbyAgent];
      unint64_t autoStatusRSSI = (unint64_t)[v36 bleProximityRSSIThresholdForType:4 device:v4];
    }
    if ((autoStatusRSSI & 0x8000000000000000) == 0)
    {
LABEL_147:
      id v10 = 0;
      unsigned int v7 = v81;
      id v8 = v82;
      goto LABEL_117;
    }
    unint64_t v37 = (unint64_t)[v6 rssiFloor];
    BOOL v38 = [v4 bleDevice];
    unsigned __int8 v39 = [v38 triggered];

    if ((v39 & 1) == 0)
    {
      if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
      {
        v40 = [v4 bleDevice];
        v77 = [v40 description];
        LogPrintF();

        -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4, v77);
      }
      else
      {
        -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4, v76);
      }
    }
    if (_os_feature_enabled_impl())
    {
      unsigned int v7 = v81;
      if ((id)[(SDProximityController *)self->_proximityController checkDeviceRegion:v4] == (id)2)
      {
        if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_137;
        }
        goto LABEL_129;
      }
    }
    else
    {
      unsigned int v7 = v81;
      if ((v37 & 0x8000000000000000) != 0 && autoStatusRSSI <= v37)
      {
        if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_137;
        }
LABEL_129:
        LogPrintF();
LABEL_137:
        if (v12 != 4 && (v28 & 0x400) == 0)
        {
          v57 = [v4 model];
          char v58 = sub_1000E761C(v57);

          if ((v58 & 1) == 0 && (v28 & 0x212) != 0x12) {
            goto LABEL_147;
          }
        }
        if (CFDictionaryGetInt64()) {
          goto LABEL_147;
        }
        id v59 = +[SDStatusMonitor sharedMonitor];
        unsigned int v60 = [v59 deviceKeyBagLocked];

        if (v60)
        {
          double v61 = CACurrentMediaTime();
          BKSHIDServicesLastUserEventTime();
          if (v61 - v62 > 30.0)
          {
            if (dword_1009673C0 <= 30)
            {
              unsigned int v7 = v81;
              id v8 = v82;
              if (dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_116;
              }
              goto LABEL_84;
            }
            goto LABEL_147;
          }
        }
        int v63 = CFDictionaryGetInt64Ranged();
        unsigned int v64 = [(CUSystemMonitor *)self->_systemMonitor screenLocked];
        unsigned int v65 = v64;
        if (v12 == 4 && (v64 & 1) == 0)
        {
          unsigned int v7 = v81;
          if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
          {
            id v78 = v4;
            long long v79 = v6;
            v76 = (void *)autoStatusRSSI;
            LogPrintF();
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger mismatch", 1, v76, v78, v79);
          uint64_t v66 = self->_triggeredDevices;
          id v8 = v82;
          if (v66) {
            goto LABEL_170;
          }
          goto LABEL_169;
        }
        if (v63 && ([v4 deviceFlags] & 0x1000) != 0)
        {
          id v8 = v82;
          if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
          {
            id v78 = v4;
            long long v79 = v6;
            v76 = (void *)autoStatusRSSI;
            LogPrintF();
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger disconnect", 1, v76, v78, v79);
          uint64_t v69 = self->_triggeredDevices;
          unsigned int v7 = v81;
          if (v69) {
            goto LABEL_178;
          }
        }
        else
        {
          id v8 = v82;
          if (([v4 paired] | v65))
          {
            unsigned int v7 = v81;
            if (![v4 paired]
              || ![(SDProximityPairingAgent *)self _shouldShowBatteryCard:v6 inDevice:v4])
            {
              goto LABEL_116;
            }
            if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
            {
              id v78 = v4;
              long long v79 = v6;
              v76 = (void *)autoStatusRSSI;
              LogPrintF();
            }
            -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger status", 1, v76, v78, v79);
            uint64_t v66 = self->_triggeredDevices;
            if (v66) {
              goto LABEL_170;
            }
LABEL_169:
            uint64_t v67 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v68 = self->_triggeredDevices;
            self->_triggeredDevices = v67;

            uint64_t v66 = self->_triggeredDevices;
LABEL_170:
            [(NSMutableDictionary *)v66 setObject:v4 forKeyedSubscript:v5];
            [(SDProximityPairingAgent *)self _startStatusUI:v4];
            goto LABEL_116;
          }
          unsigned int v7 = v81;
          if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
          {
            id v78 = v4;
            long long v79 = v6;
            v76 = (void *)autoStatusRSSI;
            LogPrintF();
          }
          -[SDProximityPairingAgent _fastScanStop:reset:](self, "_fastScanStop:reset:", "trigger repair", 1, v76, v78, v79);
          uint64_t v69 = self->_triggeredDevices;
          if (v69)
          {
LABEL_178:
            [(NSMutableDictionary *)v69 setObject:v4 forKeyedSubscript:v5];
            v54 = self;
            id v55 = v4;
            uint64_t v56 = 1;
            goto LABEL_115;
          }
        }
        uint64_t v70 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v71 = self->_triggeredDevices;
        self->_triggeredDevices = v70;

        uint64_t v69 = self->_triggeredDevices;
        goto LABEL_178;
      }
    }
    if (self->_fastScanPair) {
      [(SDProximityPairingAgent *)self _fastScanStart:v4];
    }
    goto LABEL_41;
  }
  if (!CFDictionaryGetInt64())
  {
    long long v80 = v7;
    BOOL v18 = [v10 bleDevice];
    v19 = [v18 advertisementFields];

    int v20 = CFDictionaryGetInt64Ranged();
    int v21 = CFDictionaryGetInt64Ranged();
    uint64_t v22 = CFDictionaryGetInt64Ranged();
    id v23 = v8;
    uint64_t v24 = v22;
    long long v82 = v23;
    uint64_t v25 = CFDictionaryGetInt64Ranged();
    uint64_t v26 = v25;
    BOOL v27 = v25 != v24;
    if (v21 != v20) {
      BOOL v27 = 1;
    }
    if (v27)
    {
      if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
      {
        id v78 = (id)v26;
        long long v79 = v6;
        v76 = (void *)v24;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v5, v76, v78, v79);
      unsigned int v7 = v80;
      if (v80) {
        [(NSMutableDictionary *)self->_triggeredDevices removeObjectForKey:v80];
      }
    }
    else
    {
      unsigned int v7 = v80;
      if (v25 != v24 || v21 != v20) {
        [(NSMutableDictionary *)self->_triggeredDevices setObject:v4 forKeyedSubscript:v5];
      }
    }

    goto LABEL_77;
  }
  if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    v76 = v6;
    LogPrintF();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v5, v76);
  if (v7) {
    [(NSMutableDictionary *)self->_triggeredDevices removeObjectForKey:v7];
  }
LABEL_117:
  [(SDProximityPairingAgent *)self _update];
}

- (BOOL)_shouldShowBatteryCard:(id)a3 inDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)SFHeadphoneProduct);
  id v8 = [v6 model];

  id v9 = [v7 initWithBluetoothModel:v8];
  unsigned __int8 v10 = [v9 ignoresBatteryStatusIfCounterfeit];
  __int16 v11 = [v5 bluetoothAddress];
  int v12 = CUPrintNSDataAddress();
  uint64_t v13 = [v12 uppercaseString];

  if (v13)
  {
    id v14 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Sharing"];
    uint64_t v15 = [v14 objectForKey:v13];

    if (!v15)
    {
      char v20 = 1;
      goto LABEL_8;
    }
    unint64_t v16 = [v14 dictionaryForKey:v13];
    unint64_t v17 = [v16 valueForKey:@"genuineness"];
    BOOL v18 = +[NSNumber numberWithInt:0];
    unsigned __int8 v19 = [v17 isEqualToNumber:v18];

    if (v19) {
      goto LABEL_4;
    }
    uint64_t v22 = [v16 valueForKey:@"genuineness"];
    id v23 = +[NSNumber numberWithInt:2];
    unsigned int v24 = [v22 isEqualToNumber:v23];

    if (v24)
    {
      char v20 = v10 ^ 1;
      if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_5;
    }
    uint64_t v25 = [v16 valueForKey:@"needsUpsell"];
    uint64_t v26 = +[NSNumber numberWithInt:0];
    unsigned int v27 = [v25 isEqualToNumber:v26];

    if (v27)
    {
      if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_4;
      }
    }
    else
    {
      __int16 v28 = [v16 valueForKey:@"needsUpsell"];
      unint64_t v29 = +[NSNumber numberWithInt:1];
      if ([v28 isEqualToNumber:v29])
      {
        uint64_t v30 = [v16 valueForKey:@"genuineness"];
        unint64_t v31 = +[NSNumber numberWithInt:2];
        unsigned __int8 v32 = [v30 isEqualToNumber:v31];

        if (v32)
        {
          char v20 = 0;
          goto LABEL_5;
        }
      }
      else
      {
      }
      if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize())
      {
LABEL_4:
        char v20 = 1;
LABEL_5:

LABEL_8:
        goto LABEL_9;
      }
    }
    LogPrintF();
    goto LABEL_4;
  }
  char v20 = 1;
LABEL_9:

  return v20;
}

- (void)_fastScanStart:(id)a3
{
  id v4 = a3;
  if (self->_fastScanAlways || self->_fastScanTimer) {
    goto LABEL_28;
  }
  mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds() > 0x63)
  {
    if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v14 = [v4 bleDevice];
      LogPrintF();
    }
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 50, v14);
    id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    fastScanTimer = self->_fastScanTimer;
    self->_fastScanTimer = v5;

    id v7 = self->_fastScanTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000E7DC0;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_fastScanTimer);
    v16[0] = @"scanRate";
    uint64_t v8 = (uint64_t)[(SFDeviceDiscovery *)self->_deviceDiscovery scanRate];
    if (v8 <= 19)
    {
      id v9 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_25;
        case 1:
          id v9 = "BackgroundOld";
          break;
        case 2:
          id v9 = "NormalOld";
          break;
        case 3:
          id v9 = "HighOld";
          break;
        case 4:
          id v9 = "AggressiveOld";
          break;
        case 10:
          id v9 = "Background";
          break;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v8 > 39)
    {
      if (v8 == 40)
      {
        id v9 = "High";
        goto LABEL_25;
      }
      if (v8 == 50)
      {
        id v9 = "Aggressive";
        goto LABEL_25;
      }
    }
    else
    {
      if (v8 == 20)
      {
        id v9 = "Normal";
        goto LABEL_25;
      }
      if (v8 == 30)
      {
        id v9 = "HighNormal";
LABEL_25:
        uint64_t v10 = +[NSString stringWithUTF8String:v9];
        __int16 v11 = (void *)v10;
        CFStringRef v12 = @"?";
        if (v10) {
          CFStringRef v12 = (const __CFString *)v10;
        }
        v16[1] = @"state";
        v17[0] = v12;
        v17[1] = @"Start";
        uint64_t v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
        SFPowerLogEvent();

        goto LABEL_28;
      }
    }
LABEL_24:
    id v9 = "?";
    goto LABEL_25;
  }
  if (dword_1009673C0 <= 10 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_28:
}

- (void)_fastScanStop:(const char *)a3 reset:(BOOL)a4
{
  if (self->_fastScanTimer)
  {
    v20[0] = @"scanRate";
    uint64_t v7 = (uint64_t)[(SFDeviceDiscovery *)self->_deviceDiscovery scanRate];
    if (v7 > 19)
    {
      if (v7 > 39)
      {
        if (v7 == 40)
        {
          uint64_t v8 = "High";
          goto LABEL_21;
        }
        if (v7 == 50)
        {
          uint64_t v8 = "Aggressive";
          goto LABEL_21;
        }
      }
      else
      {
        if (v7 == 20)
        {
          uint64_t v8 = "Normal";
          goto LABEL_21;
        }
        if (v7 == 30)
        {
          uint64_t v8 = "HighNormal";
          goto LABEL_21;
        }
      }
LABEL_20:
      uint64_t v8 = "?";
    }
    else
    {
      uint64_t v8 = "Invalid";
      switch(v7)
      {
        case 0:
          break;
        case 1:
          uint64_t v8 = "BackgroundOld";
          break;
        case 2:
          uint64_t v8 = "NormalOld";
          break;
        case 3:
          uint64_t v8 = "HighOld";
          break;
        case 4:
          uint64_t v8 = "AggressiveOld";
          break;
        case 10:
          uint64_t v8 = "Background";
          break;
        default:
          goto LABEL_20;
      }
    }
LABEL_21:
    uint64_t v9 = +[NSString stringWithUTF8String:v8];
    uint64_t v10 = (void *)v9;
    CFStringRef v11 = @"?";
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    v20[1] = @"state";
    v21[0] = v11;
    v21[1] = @"Stop";
    CFStringRef v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    SFPowerLogEvent();

    if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v19 = a3;
      LogPrintF();
    }
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", self->_forceFastScan, v19);
    if (self->_forceFastScan) {
      uint64_t v13 = -80;
    }
    else {
      uint64_t v13 = -60;
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:v13];
    if (self->_forceFastScan) {
      uint64_t v14 = 50;
    }
    else {
      uint64_t v14 = 20;
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:v14];
    fastScanTimer = self->_fastScanTimer;
    if (fastScanTimer)
    {
      unint64_t v16 = fastScanTimer;
      dispatch_source_cancel(v16);
      unint64_t v17 = self->_fastScanTimer;
      self->_fastScanTimer = 0;
    }
    if (!a4)
    {
      uint64_t v18 = mach_absolute_time();
      goto LABEL_38;
    }
LABEL_36:
    uint64_t v18 = 0;
LABEL_38:
    self->_fastScanLastEndTicks = v18;
    return;
  }
  if (a4) {
    goto LABEL_36;
  }
}

- (void)_powerSourceEnsureStopped
{
  if ([(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(NSMutableSet *)self->_powerSourceContainers copy];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) invalidate];
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_powerSourceContainers removeAllObjects];
    if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)_createNewPowerSourceContainer
{
  id v3 = [SDBLEPowerSourceContainer alloc];
  id v4 = objc_alloc_init((Class)SFPowerSource);
  id v5 = [(SDBLEPowerSourceContainer *)v3 initWithPowerSource:v4];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E82E0;
  v10[3] = &unk_1008CA640;
  v10[4] = self;
  uint64_t v6 = v5;
  long long v11 = v6;
  [(SDBLEPowerSourceContainer *)v6 setInvalidationHandler:v10];
  uint64_t v7 = v11;
  long long v8 = v6;

  return v8;
}

- (void)_powerSourcesUpdateForDevice:(id)a3 changes:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  if (![v6 paired]) {
    goto LABEL_79;
  }
  if (!self->_powerSourceContainers)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    powerSourceContainers = self->_powerSourceContainers;
    self->_powerSourceContainers = v7;
  }
  unsigned int v60 = self;
  long long v9 = [v6 bleDevice];
  uint64_t v61 = [v9 advertisementFields];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v10 = [v6 batteryInfo];
  id v11 = [v10 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v11)
  {
    id v12 = v11;
    unsigned int v64 = 0;
    unsigned int v65 = 0;
    uint64_t v13 = 0;
    uint64_t v66 = 0;
    uint64_t v14 = *(void *)v72;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v72 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v16 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        unint64_t v17 = v13;
        uint64_t v18 = v16;
        switch((unint64_t)[v16 batteryType])
        {
          case 1uLL:
            goto LABEL_14;
          case 2uLL:
            unint64_t v17 = v65;
            unsigned int v65 = v16;
            goto LABEL_12;
          case 3uLL:
            unint64_t v17 = v64;
            unsigned int v64 = v16;
LABEL_12:
            uint64_t v18 = v13;
            goto LABEL_14;
          case 4uLL:
            unint64_t v17 = v66;
            uint64_t v18 = v13;
            uint64_t v66 = v16;
LABEL_14:
            id v19 = v16;

            uint64_t v13 = v18;
            break;
          default:
            continue;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v12);
  }
  else
  {
    unsigned int v64 = 0;
    unsigned int v65 = 0;
    uint64_t v13 = 0;
    uint64_t v66 = 0;
  }

  CFDataGetTypeID();
  char v20 = (void *)v61;
  int v21 = CFDictionaryGetTypedValue();
  uint64_t v22 = 0;
  if ([v21 length] == (id)6)
  {
    [v21 bytes];
    uint64_t v22 = NSPrintF();
  }
  id v23 = v60;
  unsigned int v24 = v60->_powerSourceContainers;
  uint64_t v25 = +[NSPredicate predicateWithFormat:@"powerSource.groupID == %@", v22];
  uint64_t v26 = [(NSMutableSet *)v24 filteredSetUsingPredicate:v25];

  int v27 = v4 & 9;
  __int16 v28 = v66;
  char v58 = v26;
  id v59 = v21;
  if (v66)
  {
    unint64_t v29 = (void *)v61;
    uint64_t v30 = v64;
    if ((unint64_t)[v26 count] >= 2
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v52 = [v26 count];
      v53 = v22;
      LogPrintF();
    }
    double v49 = [v26 anyObject:v52, v53];
    if (v49)
    {
      if (!v27)
      {
        v46 = v49;
        [v49 trigger];
LABEL_56:
        uint64_t v45 = v65;
        goto LABEL_78;
      }
    }
    else
    {
      double v49 = [(SDProximityPairingAgent *)v60 _createNewPowerSourceContainer];
    }
    v46 = v49;
    double v50 = [v49 powerSource];
    [v50 setLowWarnLevel:20.0];

    [(SDProximityPairingAgent *)v60 _powerSourceContainerUpdate:v46 device:v6 batteryInfo:v66];
    goto LABEL_56;
  }
  BOOL v55 = v27 != 0;
  uint64_t v56 = v22;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v31 = v26;
  id v32 = [v31 countByEnumeratingWithState:&v67 objects:v75 count:16];
  id v57 = v6;
  if (!v32)
  {

    uint64_t v45 = v65;
    if (!v65)
    {
      v46 = v64;
      if (!v64)
      {
        unint64_t v29 = (void *)v61;
        uint64_t v30 = 0;
        double v62 = 0;
        BOOL v35 = 0;
        if (!v13) {
          goto LABEL_77;
        }
LABEL_75:
        kdebug_trace();
        uint64_t v51 = [(SDProximityPairingAgent *)v23 _createNewPowerSourceContainer];
        goto LABEL_76;
      }
      int v34 = 0;
      double v62 = 0;
      goto LABEL_65;
    }
    int v34 = 0;
    BOOL v35 = 0;
    v46 = v64;
    goto LABEL_58;
  }
  id v33 = v32;
  double v62 = 0;
  id obj = v31;
  int v54 = v27;
  int v34 = 0;
  BOOL v35 = 0;
  uint64_t v36 = *(void *)v68;
  do
  {
    unint64_t v37 = 0;
    do
    {
      if (*(void *)v68 != v36) {
        objc_enumerationMutation(obj);
      }
      BOOL v38 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v37);
      unsigned __int8 v39 = [v38 powerSource];
      v40 = [v39 partID];

      if ([v40 isEqual:@"Case"])
      {
        BOOL v41 = v34;
        int v34 = v38;
LABEL_35:
        unsigned int v42 = v35;
LABEL_36:
        id v43 = v38;

        BOOL v35 = v42;
        goto LABEL_37;
      }
      if ([v40 isEqual:@"Left"])
      {
        BOOL v41 = v62;
        double v62 = v38;
        goto LABEL_35;
      }
      BOOL v41 = v35;
      unsigned int v42 = v38;
      if ([v40 isEqual:@"Right"]) {
        goto LABEL_36;
      }
LABEL_37:

      unint64_t v37 = (char *)v37 + 1;
    }
    while (v33 != v37);
    id v44 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    id v33 = v44;
  }
  while (v44);

  uint64_t v45 = v65;
  if (!v65)
  {
    id v23 = v60;
    char v20 = (void *)v61;
    v46 = v64;
    __int16 v28 = 0;
    uint64_t v22 = v56;
    int v48 = v55;
    if (!v64) {
      goto LABEL_67;
    }
    goto LABEL_60;
  }
  v46 = v64;
  id v23 = v60;
  __int16 v28 = 0;
  uint64_t v22 = v56;
  uint64_t v47 = (uint64_t)v62;
  if (!v62)
  {
    char v20 = (void *)v61;
LABEL_58:
    uint64_t v47 = [(SDProximityPairingAgent *)v23 _createNewPowerSourceContainer];
LABEL_59:
    double v62 = (void *)v47;
    [(SDProximityPairingAgent *)v23 _powerSourceContainerUpdate:v47 device:v57 batteryInfo:v45];
    int v48 = 1;
    if (!v46) {
      goto LABEL_67;
    }
LABEL_60:
    if (v35)
    {
      if (!v48)
      {
        [v35 trigger];
        int v48 = 0;
        goto LABEL_67;
      }
      goto LABEL_66;
    }
LABEL_65:
    BOOL v35 = [(SDProximityPairingAgent *)v23 _createNewPowerSourceContainer];
LABEL_66:
    [(SDProximityPairingAgent *)v23 _powerSourceContainerUpdate:v35 device:v57 batteryInfo:v46];
    int v48 = 1;
    goto LABEL_67;
  }
  if (v54)
  {
    char v20 = (void *)v61;
    goto LABEL_59;
  }
  [v62 trigger];
  int v48 = 0;
  char v20 = (void *)v61;
  if (v64) {
    goto LABEL_60;
  }
LABEL_67:
  uint64_t v51 = (uint64_t)v34;
  unint64_t v29 = v20;
  uint64_t v30 = v46;
  if (!v13)
  {
    v46 = v34;
    goto LABEL_77;
  }
  if (!v34) {
    goto LABEL_75;
  }
  if (!v48)
  {
    v46 = v34;
    [v34 trigger];
    goto LABEL_77;
  }
LABEL_76:
  v46 = (void *)v51;
  [(SDProximityPairingAgent *)v23 _powerSourceContainerUpdate:v51 device:v57 batteryInfo:v13];
LABEL_77:

  id v6 = v57;
LABEL_78:

LABEL_79:
}

- (void)_powerSourceContainerUpdate:(id)a3 device:(id)a4 batteryInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 bleDevice];
  id v12 = [v11 advertisementFields];

  uint64_t v13 = [v8 powerSource];
  unsigned __int16 Int64Ranged = CFDictionaryGetInt64Ranged();
  uint64_t v61 = self;
  id v62 = v8;
  [(NSMutableSet *)self->_powerSourceContainers removeObject:v8];
  id v15 = [v10 batteryType];
  if (v15 == (id)1)
  {
    [v13 setAccessoryCategory:@"Audio Battery Case"];
    if (CFDictionaryGetInt64Ranged() == 1)
    {
      [v13 setAdapterSourceID:(unsigned __int16)CFDictionaryGetInt64Ranged()];
      id v16 = objc_alloc_init((Class)SFPowerSourceLEDInfo);
      char v17 = CFDictionaryGetInt64Ranged();
      if (v17) {
        uint64_t v18 = 2 * (v17 == 1);
      }
      else {
        uint64_t v18 = 1;
      }
      [v16 setLEDState:v18];
      switch(CFDictionaryGetInt64Ranged())
      {
        case 0u:
          [v16 setLEDState:0];
          goto LABEL_16;
        case 1u:
          id v19 = v16;
          uint64_t v20 = 1;
          goto LABEL_15;
        case 2u:
          id v19 = v16;
          uint64_t v20 = 2;
          goto LABEL_15;
        case 3u:
          id v19 = v16;
          uint64_t v20 = 3;
          goto LABEL_15;
        case 4u:
          id v19 = v16;
          uint64_t v20 = 4;
          goto LABEL_15;
        default:
          id v19 = v16;
          uint64_t v20 = 0;
LABEL_15:
          [v19 setLEDColor:v20];
LABEL_16:
          id v64 = v16;
          int v21 = +[NSArray arrayWithObjects:&v64 count:1];
          [v13 setLEDs:v21];

          break;
      }
    }
    else
    {
      [v13 setLEDs:&__NSArray0__struct];
    }
  }
  else
  {
    [v13 setAccessoryCategory:@"Headphone"];
  }
  CFDataGetTypeID();
  uint64_t v22 = CFDictionaryGetTypedValue();
  unsigned int v60 = v22;
  if ([v22 length] == (id)6)
  {
    id v55 = [v22 bytes];
    uint64_t v23 = NSPrintF();
    if (v23)
    {
      [v13 setAccessoryID:v23, v55];
      char v24 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  char v24 = 1;
LABEL_22:
  uint64_t v25 = [v13 accessoryID:v55];
  [v13 setGroupID:v25];

  id v26 = [v10 batteryState];
  [v13 setCharging:v26 == (id)2];
  [v10 batteryLevel];
  [v13 setChargeLevel:];
  [v13 setMaxCapacity:100.0];
  [v13 setLowWarnLevel:10.0];
  if ((v24 & 1) == 0) {
    [v13 setGroupID:v23];
  }
  id v59 = (void *)v23;
  int v63 = v9;
  if (v15 != (id)1)
  {
    uint64_t v33 = [v9 name];
LABEL_30:
    id v32 = (void *)v33;
    if (!v33) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (Int64Ranged != 8203)
  {
    id v27 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:Int64Ranged];
    unsigned int v28 = [v27 usesProductCaseName];

    if (!v28) {
      goto LABEL_28;
    }
  }
  unint64_t v29 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v30 = +[NSString stringWithFormat:@"Localizable-PID_%d", Int64Ranged];
  id v31 = +[NSString stringWithFormat:@"PRODUCT_CASE_NAME_PID_%d", Int64Ranged];
  id v32 = SFLocalizedStringEx();

  if (!v32)
  {
LABEL_28:
    uint64_t v33 = SFLocalizedStringForKey();
    goto LABEL_30;
  }
LABEL_31:
  [v13 setName:v32];
LABEL_32:
  int v34 = [v13 partID];

  if (v34) {
    goto LABEL_42;
  }
  if (v15 == (id)2)
  {
    CFStringRef v35 = @"Left";
  }
  else if (v15 == (id)3)
  {
    CFStringRef v35 = @"Right";
  }
  else if (v15 == (id)1)
  {
    CFStringRef v35 = @"Case";
  }
  else
  {
    if (v15 != (id)4) {
      goto LABEL_42;
    }
    CFStringRef v35 = @"Single";
  }
  [v13 setPartID:v35];
LABEL_42:
  uint64_t v36 = [v13 partName];

  if (v36) {
    goto LABEL_48;
  }
  if (v15 == (id)2)
  {
    CFStringRef v37 = @" 🅛";
  }
  else
  {
    if (v15 != (id)3) {
      goto LABEL_48;
    }
    CFStringRef v37 = @" 🅡";
  }
  BOOL v38 = [v32 stringByAppendingString:v37];
  [v13 setPartName:v38];

LABEL_48:
  [v10 batteryLevel];
  if (fabs(v39 + -1.0) < 0.00000011920929)
  {
    [v13 setPowerState:4];
    [v13 setProductID:Int64Ranged];
    if (v26 != (id)2) {
      goto LABEL_55;
    }
LABEL_53:
    CFStringRef v40 = @"AC Power";
    goto LABEL_56;
  }
  if (v26 == (id)2)
  {
    [v13 setPowerState:3];
    [v13 setProductID:Int64Ranged];
    goto LABEL_53;
  }
  [v13 setPowerState:2];
  [v13 setProductID:Int64Ranged];
LABEL_55:
  CFStringRef v40 = @"Battery Power";
LABEL_56:
  [v13 setState:v40];
  [v13 setTransportType:@"Bluetooth"];
  [v13 setType:@"Accessory Source"];
  [v13 setVendorID:76];
  unint64_t v41 = CFDictionaryGetInt64Ranged();
  uint64_t v42 = Int64Ranged;
  unsigned int v43 = ((unsigned __int16)(Int64Ranged - 8213) > 7u) | (0x76u >> (Int64Ranged - 21));
  uint64_t Int64 = CFDictionaryGetInt64();
  id v45 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v42];
  if ([v45 hasCaseBT])
  {
    uint64_t v46 = (v41 >> 4) & 1;
    if ((v41 & 0x100) != 0) {
      LODWORD(v46) = (v41 >> 1) & 1;
    }
    if (v46) {
      unsigned int v47 = 1;
    }
    else {
      unsigned int v47 = (v41 >> 3) & 1;
    }
    char v48 = v46 ^ 1;
    BOOL v49 = Int64 == 0;
    if (Int64) {
      unsigned int v50 = v47;
    }
    else {
      unsigned int v50 = (v41 >> 3) & 1;
    }
    if (v49) {
      char v51 = 1;
    }
    else {
      char v51 = v48;
    }
    [(NSMutableSet *)v61->_powerSourceContainers addObject:v62];
    BOOL v52 = v15 == (id)1;
    v53 = v62;
    char v54 = !v52;
    if (!v52 && !v50)
    {
      LOBYTE(v43) = v54 & v51 & v43;
      goto LABEL_75;
    }
  }
  else
  {
    v53 = v62;
    [(NSMutableSet *)v61->_powerSourceContainers addObject:v62];
    if ((v41 & 8) == 0)
    {
LABEL_75:
      if (v43)
      {
        if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
        {
          char v58 = [v63 bleDevice];
          LogPrintF();

          [v53 publish:v13, v58];
        }
        else
        {
          [v53 publish:v56 with:v57];
        }
      }
      goto LABEL_86;
    }
  }
  if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    [v63 bleDevice];
    v57 = uint64_t v56 = v13;
    LogPrintF();
  }
  [v53 invalidate:v56, v57];
LABEL_86:
}

- (void)_removeB389sFromTriggeredDevices
{
  id v3 = [(NSMutableDictionary *)self->_triggeredDevices allKeys];
  id v4 = [v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v10, (void)v15);
        id v12 = [v11 bleDevice];
        uint64_t v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 advertisementFields];
          if (v14 && CFDictionaryGetInt64Ranged() == 5) {
            [(NSMutableDictionary *)self->_triggeredDevices removeObjectForKey:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  self->_triggeredB389Setup = 0;
}

- (BOOL)shouldPromptForSiriNotificationForDevice:(id)a3
{
  id v4 = a3;
  if (([v4 supportsAACPService] & 1) == 0)
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_27;
    }
LABEL_26:
    LogPrintF();
LABEL_27:
    BOOL v6 = 0;
    goto LABEL_28;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ((+[SFSiriController isHeySiriEnabled] & 1) == 0)
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  BOOL v5 = [v4 primaryPlacement] == 1
    || [v4 secondaryPlacement] == 1;
  if ([v4 primaryPlacement] != 4)
  {
    char v8 = [v4 secondaryPlacement] == 4 || v5;
    if ((v8 & 1) == 0)
    {
      if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_27;
      }
      [v4 primaryPlacement];
      [v4 secondaryPlacement];
      goto LABEL_26;
    }
  }
  if ((+[SFSiriController shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:", [v4 productIdentifier], 1) & 1) == 0&& (+[SFSiriController shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:", objc_msgSend(v4, "productIdentifier"), 1, 1) & 1) == 0)
  {
    if (SFIsAnnounceCallsEnabled()) {
      +[SFSiriController setHasUserSeenAnnounceCallsOptOutScreen:1];
    }
    else {
      +[SFSiriController setHasUserSeenAnnounceMessagesOptOutScreen:1];
    }
  }
  BOOL v6 = 1;
  if ((+[SFSiriController shouldPromptForAnnounceNotificationsForProductID:isUpsellFlow:](SFSiriController, "shouldPromptForAnnounceNotificationsForProductID:isUpsellFlow:", [v4 productIdentifier], 1) & 1) == 0)
  {
    +[SFSiriController setHasUserSeenAnnounceNotificationsOptOutScreen:1];
    goto LABEL_27;
  }
LABEL_28:

  return v6;
}

- (BOOL)shouldPromptForSpatialAudioProfileForDevice:(id)a3
{
  id v4 = a3;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
LABEL_14:
    LogPrintF();
LABEL_25:
    unsigned __int8 v8 = 0;
    goto LABEL_26;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_14;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_14;
  }
  BOOL v5 = [v4 addressString];

  if (!v5)
  {
    if (dword_1009673C0 > 115 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_14;
  }
  id v6 = sub_1000E98D4();
  id v7 = [v4 addressString];
  unsigned __int8 v8 = [v6 isProxCardEnrollmentSupportedForDevice:v7];

LABEL_26:
  return v8;
}

- (BOOL)shouldPromptForEndCallProx:(id)a3
{
  id v4 = a3;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_29;
    }
LABEL_16:
    LogPrintF();
LABEL_29:
    char v12 = 0;
    goto LABEL_30;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_29;
    }
    goto LABEL_16;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_29;
    }
    goto LABEL_16;
  }
  BOOL v5 = [v4 addressString];

  if (!v5)
  {
    if (dword_1009673C0 > 115 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_29;
    }
    goto LABEL_16;
  }
  id v6 = [SDHeadphoneEndCallManager alloc];
  id v7 = [v4 addressString];
  unsigned __int8 v8 = [(SDHeadphoneEndCallManager *)v6 initWithBluetoothAddress:v7];

  unsigned __int8 v9 = [(SDHeadphoneEndCallManager *)v8 isStatusUnknown];
  id v10 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:[v4 productIdentifier]];
  unsigned __int8 v11 = [v10 supportsEndCallProx];

  if (dword_1009673C0 <= 115 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  char v12 = v11 & v9;

LABEL_30:
  return v12;
}

- (BOOL)shouldPromptForMuteCallProx:(id)a3
{
  return [(SDProximityPairingAgent *)self shouldPromptProx:a3 forFeature:0];
}

- (BOOL)shouldPromptForAdaptiveControlsProx:(id)a3
{
  return [(SDProximityPairingAgent *)self shouldPromptProx:a3 forFeature:1];
}

- (BOOL)shouldPromptForWhatsNewProx:(id)a3
{
  return [(SDProximityPairingAgent *)self shouldPromptProx:a3 forFeature:2];
}

- (BOOL)shouldPromptProx:(id)a3 forFeature:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
LABEL_15:
    LogPrintF();
LABEL_28:
    BOOL v13 = 0;
    goto LABEL_29;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  id v7 = [v6 addressString];

  if (!v7)
  {
    if (dword_1009673C0 > 115 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (v4 == 2)
  {
    headphoneProxFeatureClient = self->_headphoneProxFeatureClient;
    unsigned __int8 v9 = [v6 addressString];
    unsigned __int8 v10 = [(HeadphoneProxFeatureClient *)headphoneProxFeatureClient shouldShowWhatsNewCardWithDeviceAddress:v9];
  }
  else
  {
    unsigned __int8 v11 = [SDHeadphoneFeatureManager alloc];
    char v12 = [v6 addressString];
    unsigned __int8 v9 = -[SDHeadphoneFeatureManager initWithBluetoothAddress:productID:](v11, "initWithBluetoothAddress:productID:", v12, [v6 productIdentifier]);

    unsigned __int8 v10 = [(SDHeadphoneFeatureManager *)v9 shouldShowProxCardForFeature:v4];
  }
  BOOL v13 = v10;

LABEL_29:
  return v13;
}

- (BOOL)isBackgroundCheckReadyForFeature:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v10 = [v7 bluetoothAddress];
      LogPrintF();
    }
    goto LABEL_19;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
LABEL_13:
    LogPrintF();
LABEL_19:
    BOOL v8 = 0;
    goto LABEL_20;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  BOOL v8 = 1;
LABEL_20:

  return v8;
}

- (void)readyToShowWithDevice:(id)a3 features:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    BOOL v8 = [v6 bluetoothAddress];
    [v7 description];
    v16 = long long v15 = v8;
    LogPrintF();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (-[SDProximityPairingAgent isBackgroundCheckReadyForFeature:forDevice:](self, "isBackgroundCheckReadyForFeature:forDevice:", v14, v6, v15, v16, (void)v17))
        {
          [(SDProximityPairingAgent *)self promptForHeadphoneProxFeature:v14 forDevice:v6];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (BOOL)shouldNotifyForNonGenuineDevice:(id)a3
{
  id v4 = a3;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_68;
    }
LABEL_61:
    LogPrintF();
LABEL_68:
    char v36 = 0;
    goto LABEL_69;
  }
  if (![(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_68;
    }
    goto LABEL_61;
  }
  if (![(SDProximityPairingAgent *)self _systemCanShowUIWithCounterpart:0])
  {
    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_68;
    }
    goto LABEL_61;
  }
  LOBYTE(v5) = 0;
  char v6 = 1;
  id v7 = &NSCalendarIdentifierGregorian_ptr;
  do
  {
    char v8 = v6;
    if ((v6 & 1) == 0) {
      break;
    }
    id v9 = [v4 addressString];
    id v10 = [v9 uppercaseString];

    BOOL v11 = v10 != 0;
    if (v10)
    {
      id v12 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Sharing"];
      BOOL v13 = [v12 dictionaryForKey:v10];
      if (!v13)
      {
        BOOL v11 = 0;
        goto LABEL_21;
      }
      char v42 = v8;
      id v43 = v13;
      id v14 = v13;
      long long v15 = [v14 valueForKey:@"needsUpsell"];
      [(NSCalendarIdentifier *)(id)v7[214] numberWithInt:1];
      long long v16 = v7;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if ([v15 isEqualToNumber:v17])
      {
        id v40 = v12;
        long long v18 = [v14 valueForKey:@"genuineness"];
        long long v19 = [(NSCalendarIdentifier *)(id)v16[214] numberWithInt:0];
        unsigned int v20 = [v18 isEqualToNumber:v19];

        if (v20)
        {
          id v48 = 0;
          int v21 = +[CBDiscovery devicesWithDiscoveryFlags:0x200000 error:&v48];
          id v22 = v48;
          uint64_t v23 = v22;
          if (v22 && !v21)
          {
            id v7 = &NSCalendarIdentifierGregorian_ptr;
            id v12 = v40;
            if (dword_1009673C0 <= 90)
            {
              if (dword_1009673C0 != -1 || (v25 = v22, v26 = _LogCategory_Initialize(), uint64_t v23 = v25, v26))
              {
                BOOL v38 = v23;
                char v24 = v23;
                LogPrintF();
                uint64_t v23 = v24;
              }
            }

            id v43 = v14;
LABEL_20:

            char v8 = v42;
            BOOL v13 = v43;
LABEL_21:

            goto LABEL_22;
          }
          unint64_t v41 = v22;
          if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
          {
            BOOL v38 = [v21 description];
            LogPrintF();
          }
          id v39 = v4;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v17 = v21;
          id v27 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v45;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v45 != v29) {
                  objc_enumerationMutation(v17);
                }
                id v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                id v32 = [v31 btAddressData:v38];
                uint64_t v33 = CUPrintNSDataAddress();

                if ([v33 isEqualToString:v10])
                {
                  unsigned int v34 = [v31 gapaFlags];
                  if ((v34 & 2) != 0)
                  {
                    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize())
                    {
                      LOBYTE(v5) = 1;
                      CFStringRef v35 = &off_100905758;
                      goto LABEL_49;
                    }
                    CFStringRef v35 = &off_100905758;
                  }
                  else
                  {
                    if (([v31 gapaFlags] & 1) == 0) {
                      goto LABEL_50;
                    }
                    if (dword_1009673C0 > 30 || dword_1009673C0 == -1 && !_LogCategory_Initialize())
                    {
                      LOBYTE(v5) = 0;
                      CFStringRef v35 = &off_100905780;
                      goto LABEL_49;
                    }
                    CFStringRef v35 = &off_100905780;
                  }
                  int v5 = (v34 >> 1) & 1;
                  BOOL v38 = v10;
                  LogPrintF();
LABEL_49:

                  id v14 = v35;
                }
LABEL_50:
              }
              id v28 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
            }
            while (v28);
          }

          id v4 = v39;
          id v12 = v40;
LABEL_17:
        }
        else
        {
          id v12 = v40;
        }
        [v12 setObject:v14 forKey:v10];
        BOOL v11 = 0;
        id v7 = &NSCalendarIdentifierGregorian_ptr;
        goto LABEL_20;
      }
      unint64_t v41 = v15;
      goto LABEL_17;
    }
LABEL_22:

    char v6 = 0;
  }
  while (!v11);
  char v36 = (v8 ^ 1) & v5;
LABEL_69:

  return v36 & 1;
}

- (BOOL)launchRemoteAlertWithUserInfo:(id)a3
{
  id v4 = a3;
  pairingAlertHandle = self->_pairingAlertHandle;
  if (pairingAlertHandle)
  {
    [(SBSRemoteAlertHandle *)pairingAlertHandle unregisterObserver:self];
    [(SBSRemoteAlertHandle *)self->_pairingAlertHandle invalidate];
  }
  int v6 = _os_feature_enabled_impl();
  if (v6) {
    CFStringRef v7 = @"com.apple.HeadphoneProxService";
  }
  else {
    CFStringRef v7 = @"com.apple.SharingViewService";
  }
  if (v6) {
    CFStringRef v8 = @"HeadphoneProxService.HeadphoneFlowViewController";
  }
  else {
    CFStringRef v8 = @"SharingViewService.HeadphoneFlowViewController";
  }
  id v9 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v7 viewControllerClassName:v8];
  id v10 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  [v10 setUserInfo:v4];
  BOOL v11 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v9 configurationContext:v10];
  id v12 = self->_pairingAlertHandle;
  self->_pairingAlertHandle = v11;

  BOOL v13 = self->_pairingAlertHandle;
  if (v13)
  {
    [(SBSRemoteAlertHandle *)self->_pairingAlertHandle registerObserver:self];
    [(SBSRemoteAlertHandle *)self->_pairingAlertHandle activateWithContext:0];
  }

  return v13 != 0;
}

- (void)promptForSiriNotificationsForDevice:(id)a3
{
  id v12 = a3;
  if (-[SDProximityPairingAgent shouldPromptForSiriNotificationForDevice:](self, "shouldPromptForSiriNotificationForDevice:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"siriNote"];
    int v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 productIdentifier]);
    [v4 setObject:v5 forKeyedSubscript:@"pid"];

    int v6 = [v12 identifier];
    CFStringRef v7 = [v6 UUIDString];
    [v4 setObject:v7 forKeyedSubscript:@"deviceIdentifier"];

    if (v12)
    {
      CFStringRef v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([v12 deviceFlags] >> 3) & 1);
      [v4 setObject:v8 forKeyedSubscript:@"softwareVolume"];

      if ([v12 primaryPlacement]) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = [v12 secondaryPlacement] != 0;
      }
      id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9, v11);
      [v4 setObject:v10 forKeyedSubscript:@"inEarDetection"];
    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4, v11)
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)promptForSpatialAudioProfileForDevice:(id)a3
{
  id v14 = a3;
  unsigned int v4 = [(SDProximityPairingAgent *)self shouldPromptForSpatialAudioProfileForDevice:v14];
  int v5 = v14;
  if (v4)
  {
    if (dword_1009673C0 <= 30)
    {
      if (dword_1009673C0 != -1 || (int v6 = _LogCategory_Initialize(), v5 = v14, v6))
      {
        BOOL v13 = v5;
        LogPrintF();
        int v5 = v14;
      }
    }
    CFStringRef v7 = [v5 addressString:v13];

    if (v7)
    {
      id v8 = sub_1000E98D4();
      BOOL v9 = [v14 addressString];
      [v8 setProxCardShowed:1 forDevice:v9];
    }
    else if (dword_1009673C0 <= 115 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"spatialAudioProfile"];
    id v11 = [v14 identifier];
    id v12 = [v11 UUIDString];
    [v10 setObject:v12 forKeyedSubscript:@"deviceIdentifier"];

    if (![(SDProximityPairingAgent *)self launchRemoteAlertWithUserInfo:v10]
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    int v5 = v14;
  }
}

- (void)promptForEndCallProxForDevice:(id)a3
{
  id v12 = a3;
  if (-[SDProximityPairingAgent shouldPromptForEndCallProx:](self, "shouldPromptForEndCallProx:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"endCallProx"];
    int v5 = [v12 identifier];
    int v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];

    CFStringRef v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 productIdentifier]);
    [v4 setObject:v7 forKeyedSubscript:@"pid"];

    id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 colorCode]);
    [v4 setObject:v8 forKeyedSubscript:@"colorCode"];

    BOOL v9 = [v12 addressString];

    if (v9)
    {
      id v10 = [v12 addressString];
      [v4 setObject:v10 forKeyedSubscript:@"deviceAddress"];
    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4, v11)
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)promptForMuteCallProxForDevice:(id)a3
{
  id v12 = a3;
  if (-[SDProximityPairingAgent shouldPromptForMuteCallProx:](self, "shouldPromptForMuteCallProx:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"muteCallProx"];
    int v5 = [v12 identifier];
    int v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];

    CFStringRef v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 productIdentifier]);
    [v4 setObject:v7 forKeyedSubscript:@"pid"];

    id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 colorCode]);
    [v4 setObject:v8 forKeyedSubscript:@"colorCode"];

    BOOL v9 = [v12 addressString];

    if (v9)
    {
      id v10 = [v12 addressString];
      [v4 setObject:v10 forKeyedSubscript:@"deviceAddress"];
    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4, v11)
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)promptForHeadphoneProxFeature:(id)a3 forDevice:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  CFStringRef v7 = [v6 bluetoothAddress];
  NSLog(@"HeadphoneProxFeatureService: [Sharing] promptForHeadphoneProxFeature: %@, for Device: %@", v11, v7);

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:v11];
  BOOL v9 = [v6 identifier];
  [v8 setObject:v9 forKeyedSubscript:@"deviceIdentifier"];

  id v10 = [v6 bluetoothAddress];

  [v8 setObject:v10 forKeyedSubscript:@"deviceAddress"];
  if (![(SDProximityPairingAgent *)self launchRemoteAlertWithUserInfo:v8]
    && dword_1009673C0 <= 90
    && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)promptForAdaptiveControlsProxForDevice:(id)a3
{
  id v12 = a3;
  if (-[SDProximityPairingAgent shouldPromptForAdaptiveControlsProx:](self, "shouldPromptForAdaptiveControlsProx:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"adaptiveControlsProx"];
    int v5 = [v12 identifier];
    id v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];

    CFStringRef v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 productIdentifier]);
    [v4 setObject:v7 forKeyedSubscript:@"pid"];

    id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 colorCode]);
    [v4 setObject:v8 forKeyedSubscript:@"colorCode"];

    BOOL v9 = [v12 addressString];

    if (v9)
    {
      id v10 = [v12 addressString];
      [v4 setObject:v10 forKeyedSubscript:@"deviceAddress"];
    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4, v11)
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)promptForWhatsNewProxForDevice:(id)a3
{
  id v11 = a3;
  if (-[SDProximityPairingAgent shouldPromptForWhatsNewProx:](self, "shouldPromptForWhatsNewProx:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"whatsNew"];
    int v5 = [v11 identifier];
    id v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];

    CFStringRef v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 productIdentifier]);
    [v4 setObject:v7 forKeyedSubscript:@"pid"];

    id v8 = [v11 addressString];

    if (v8)
    {
      BOOL v9 = [v11 addressString];
      [v4 setObject:v9 forKeyedSubscript:@"deviceAddress"];
    }
    if (!-[SDProximityPairingAgent launchRemoteAlertWithUserInfo:](self, "launchRemoteAlertWithUserInfo:", v4, v10)
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)notifyForNonGenuineDevice:(id)a3
{
  id v7 = a3;
  if (-[SDProximityPairingAgent shouldNotifyForNonGenuineDevice:](self, "shouldNotifyForNonGenuineDevice:"))
  {
    if (dword_1009673C0 <= 30 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"nonGenuineDevice"];
    int v5 = [v7 identifier];
    id v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];

    if (![(SDProximityPairingAgent *)self launchRemoteAlertWithUserInfo:v4]
      && dword_1009673C0 <= 90
      && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB968;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EBB24;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EBD0C;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_resetTriggers
{
  [(NSMutableDictionary *)self->_triggeredDevices removeAllObjects];
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  *(_WORD *)&self->_triggeredB389Setup = 0;
}

- (void)retriggerProximityPairing:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EBF5C;
  v7[3] = &unk_1008CAD20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_screenStateChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC230;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int)_startPairingUI:(id)a3 autoStart:(BOOL)a4 repair:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [v7 bleDevice];
  v75 = [v8 advertisementFields];
  id v9 = [v7 identifier];
  uint64_t v10 = [v9 UUIDString];

  v76 = (void *)v10;
  if (!v10)
  {
    if (dword_1009673C0 > 60 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_81;
    }
    goto LABEL_70;
  }
  BOOL v71 = v5;
  if (!v5 || ([v7 deviceFlags] & 0x1000) != 0)
  {
    id v12 = [v8 bluetoothAddress];
    if (v12)
    {
      BOOL v13 = v12;
      if ([v12 length] != (id)6)
      {
        if (dword_1009673C0 <= 60 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v78 = 0;
        int v63 = 0;
        CFStringRef v35 = 0;
        id v48 = 0;
        long long v74 = 0;
        int v64 = -6743;
        goto LABEL_86;
      }
      id v69 = v13;
      id v66 = [v69 bytes];
      uint64_t v11 = NSPrintF();
      goto LABEL_8;
    }
    if (dword_1009673C0 > 60 || dword_1009673C0 == -1 && !_LogCategory_Initialize())
    {
LABEL_81:
      id v78 = 0;
      BOOL v13 = 0;
      int v63 = 0;
      CFStringRef v35 = 0;
      id v48 = 0;
      long long v74 = 0;
      int v64 = -6761;
      goto LABEL_86;
    }
LABEL_70:
    LogPrintF();
    goto LABEL_81;
  }
  id v69 = 0;
  uint64_t v11 = 0;
LABEL_8:
  long long v72 = v8;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v14 = [v7 batteryInfo:v66];
  id v15 = [(id)v14 countByEnumeratingWithState:&v79 objects:v85 count:16];
  BOOL v70 = v6;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v80;
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v80 != v17) {
          objc_enumerationMutation((id)v14);
        }
        id v22 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        id v23 = [v22 batteryState];
        [v22 batteryLevel];
        if (v23 == (id)2) {
          double v25 = v24;
        }
        else {
          double v25 = -v24;
        }
        switch((unint64_t)[v22 batteryType])
        {
          case 1uLL:
          case 4uLL:
            double v20 = v25;
            break;
          case 2uLL:
            double v18 = v25;
            break;
          case 3uLL:
            double v19 = v25;
            break;
          default:
            continue;
        }
      }
      id v16 = [(id)v14 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v16);
  }
  else
  {
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
  }
  long long v73 = (void *)v11;

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  unsigned __int8 v27 = CFDictionaryGetInt64Ranged();
  unsigned __int8 v28 = CFDictionaryGetInt64Ranged();
  unsigned __int8 v29 = CFDictionaryGetInt64Ranged();
  LODWORD(v14) = [v7 deviceFlags];
  uint64_t v30 = +[SDNearbyAgent sharedNearbyAgent];
  id v31 = [v30 btConnectedDeviceMonitor];
  unsigned __int8 v32 = [v31 statusFlags];

  unsigned __int8 v68 = v32;
  if ([v7 testMode] | ((v32 & 8) >> 3)) {
    uint64_t v14 = v14;
  }
  else {
    uint64_t v14 = v14 & 0xFFFFF7FF;
  }
  CFDataGetTypeID();
  long long v74 = CFDictionaryGetTypedValue();
  uint64_t v33 = +[NSUUID UUID];
  id v78 = [v33 UUIDString];

  id v34 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v35 = v34;
  if (v70) {
    [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:@"autoStart"];
  }
  char v36 = +[NSNumber numberWithDouble:v18];
  [v35 setObject:v36 forKeyedSubscript:@"batteryLevelLeft"];

  CFStringRef v37 = +[NSNumber numberWithDouble:v19];
  [v35 setObject:v37 forKeyedSubscript:@"batteryLevelRight"];

  BOOL v38 = +[NSNumber numberWithDouble:v20];
  [v35 setObject:v38 forKeyedSubscript:@"batteryLevelCase"];

  if ([(SDStatusMonitor *)self->_statusMonitor carplayConnected] || (v68 & 0x10) != 0) {
    [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:@"carplayConnected"];
  }
  id v39 = +[NSNumber numberWithUnsignedChar:v29];
  [v35 setObject:v39 forKeyedSubscript:@"caseLEDColor"];

  id v40 = +[NSNumber numberWithUnsignedChar:v28];
  [v35 setObject:v40 forKeyedSubscript:@"caseVers"];

  unint64_t v41 = +[NSNumber numberWithUnsignedChar:v27];
  [v35 setObject:v41 forKeyedSubscript:@"colorCode"];

  if (v73) {
    [v35 setObject:v73 forKeyedSubscript:@"deviceAddress"];
  }
  if (v14)
  {
    char v42 = +[NSNumber numberWithUnsignedInt:v14];
    [v35 setObject:v42 forKeyedSubscript:@"deviceFlags"];
  }
  id v43 = [v7 name];
  if (v43) {
    [v35 setObject:v43 forKeyedSubscript:@"deviceName"];
  }

  [v35 setObject:v76 forKeyedSubscript:@"deviceIdentifier"];
  uint64_t v44 = [v7 model];
  long long v45 = (void *)v44;
  if (v44) {
    CFStringRef v46 = (const __CFString *)v44;
  }
  else {
    CFStringRef v46 = &stru_1008E7020;
  }
  [v35 setObject:v46 forKeyedSubscript:@"model"];

  long long v47 = +[NSNumber numberWithUnsignedInt:Int64Ranged];
  [v35 setObject:v47 forKeyedSubscript:@"pid"];

  [v35 setObject:v78 forKeyedSubscript:@"sessionUUID"];
  id v48 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:Int64Ranged];
  if (v48) {
    BOOL v49 = 1;
  }
  else {
    BOOL v49 = [(SDProximityPairingAgent *)self _supportedDevice:v7];
  }
  unsigned int v50 = +[NSNumber numberWithBool:v49];
  [v35 setObject:v50 forKeyedSubscript:@"supportedDevice"];

  char v51 = [v7 bleDevice];
  BOOL v52 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v51 proxPairingTicks]);
  [v35 setObject:v52 forKeyedSubscript:@"foundTicks"];

  v53 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v35 setObject:v53 forKeyedSubscript:@"triggerTicks"];

  [v35 setObject:v74 forKeyedSubscript:@"engravingData"];
  if (!v71) {
    goto LABEL_47;
  }
  if (SFShouldShowRepairProxCard())
  {
    char v54 = +[SDNearbyAgent sharedNearbyAgent];
    id v55 = [v54 bleProximityRSSIThresholdForType:3 device:v7];

    [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:@"repairMode"];
    uint64_t v56 = +[NSNumber numberWithInteger:v55];
    [v35 setObject:v56 forKeyedSubscript:@"repairRSSI"];

LABEL_47:
    if ([(SDProximityPairingAgent *)self launchRemoteAlertWithUserInfo:v35])
    {
      v84[0] = v78;
      v83[0] = @"sid";
      v83[1] = @"rssi";
      id v57 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v72 rssi]);
      v84[1] = v57;
      v83[2] = @"smoothedRSSI";
      char v58 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v72 rssiFloor]);
      v84[2] = v58;
      v83[3] = @"pairedModel";
      uint64_t v59 = [v7 model];
      unsigned int v60 = (void *)v59;
      if (v59) {
        CFStringRef v61 = (const __CFString *)v59;
      }
      else {
        CFStringRef v61 = &stru_1008E7020;
      }
      v84[3] = v61;
      id v62 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:4];
      SFMetricsLog();

      if (dword_1009673C0 > 50)
      {
        int v64 = 0;
        id v8 = v72;
        int v63 = v73;
      }
      else
      {
        int v63 = v73;
        if (dword_1009673C0 != -1 || _LogCategory_Initialize())
        {
          id v8 = v72;
          [v72 rssiFloor];
          long long v67 = [v7 model];
          LogPrintF();

          int v64 = 0;
        }
        else
        {
          int v64 = 0;
          id v8 = v72;
        }
      }
      BOOL v13 = v69;
    }
    else
    {
      BOOL v13 = v69;
      if (dword_1009673C0 > 60)
      {
        int v64 = 0;
        id v8 = v72;
        int v63 = v73;
      }
      else
      {
        id v8 = v72;
        int v63 = v73;
        if (dword_1009673C0 != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        int v64 = 0;
      }
    }
    goto LABEL_64;
  }
  if (dword_1009673C0 > 60)
  {
    int v64 = -6735;
    id v8 = v72;
    int v63 = v73;
    BOOL v13 = v69;
  }
  else
  {
    id v8 = v72;
    int v63 = v73;
    BOOL v13 = v69;
    if (dword_1009673C0 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int v64 = -6735;
  }
LABEL_86:
  if (dword_1009673C0 <= 60 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_64:

  return v64;
}

- (void)startSoftwareUpdateRequiredUI
{
  softwareUpdateAlertHandle = self->_softwareUpdateAlertHandle;
  if (softwareUpdateAlertHandle)
  {
    [(SBSRemoteAlertHandle *)softwareUpdateAlertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_softwareUpdateAlertHandle invalidate];
  }
  id v6 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SharingViewService" viewControllerClassName:@"SharingViewService.SoftwareUpdateRequiredFlow"];
  id v4 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:0];
  BOOL v5 = self->_softwareUpdateAlertHandle;
  self->_softwareUpdateAlertHandle = v4;

  [(SBSRemoteAlertHandle *)self->_softwareUpdateAlertHandle addObserver:self];
  [(SBSRemoteAlertHandle *)self->_softwareUpdateAlertHandle activateWithContext:0];
}

- (int)_startStatusUI:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 bleDevice];
  uint64_t v6 = [v4 identifier];
  id v7 = [v5 advertisementFields];
  id v98 = (void *)v6;
  if (v6)
  {
    long long v92 = self;
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    uint64_t v9 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v88 = CFDictionaryGetInt64Ranged();
    uint64_t v90 = CFDictionaryGetInt64Ranged();
    uint64_t v10 = [v5 bluetoothAddress];
    v100 = &stru_1008E7020;
    if ([v10 length] == (id)6)
    {
      id v69 = [v10 bytes];
      NSPrintF();
      v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v97 = v10;
    long long v72 = v5;
    uint64_t Int64 = CFDictionaryGetInt64();
    unsigned __int8 v81 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v79 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v12 = CFDictionaryGetInt64Ranged();
    uint64_t v83 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v13 = CFDictionaryGetInt64Ranged();
    CFDataGetTypeID();
    uint64_t v95 = CFDictionaryGetTypedValue();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v14 = [v4 batteryInfo];
    id v15 = [v14 countByEnumeratingWithState:&v101 objects:v109 count:16];
    long long v93 = v7;
    unsigned __int8 v85 = v13;
    unsigned __int8 v86 = v12;
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v102;
      double v18 = 0.0;
      double v19 = 0.0;
      double v20 = 0.0;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v102 != v17) {
            objc_enumerationMutation(v14);
          }
          id v22 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          id v23 = [v22 batteryState:v69];
          [v22 batteryLevel];
          if (v23 == (id)2) {
            double v25 = v24;
          }
          else {
            double v25 = -v24;
          }
          switch((unint64_t)[v22 batteryType])
          {
            case 1uLL:
            case 4uLL:
              double v20 = v25;
              break;
            case 2uLL:
              double v18 = v25;
              break;
            case 3uLL:
              double v19 = v25;
              break;
            default:
              continue;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
      double v19 = 0.0;
      double v20 = 0.0;
    }
    BOOL v26 = Int64 != 0;

    int v27 = _os_feature_enabled_impl();
    if (v27) {
      CFStringRef v28 = @"com.apple.HeadphoneProxService";
    }
    else {
      CFStringRef v28 = @"com.apple.SharingViewService";
    }
    if (v27) {
      CFStringRef v29 = @"HeadphoneProxService.HeadphoneFlowViewController";
    }
    else {
      CFStringRef v29 = @"SharingViewService.HeadphoneFlowViewController";
    }
    uint64_t v30 = +[NSUUID UUID];
    uint64_t v31 = [v30 UUIDString];

    id v96 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v28 viewControllerClassName:v29];
    id v94 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    uint64_t v32 = [v4 name];
    v107[0] = @"batteryLevelLeft";
    id v78 = +[NSNumber numberWithDouble:v18];
    v108[0] = v78;
    v107[1] = @"batteryLevelRight";
    v77 = +[NSNumber numberWithDouble:v19];
    v108[1] = v77;
    v107[2] = @"batteryLevelCase";
    v76 = +[NSNumber numberWithDouble:v20];
    v108[2] = v76;
    v107[3] = @"caseLEDColor";
    long long v80 = +[NSNumber numberWithUnsignedChar:v79];
    v108[3] = v80;
    v107[4] = @"caseVers";
    long long v82 = +[NSNumber numberWithUnsignedChar:v81];
    v108[4] = v82;
    v107[5] = @"colorCode";
    id v89 = +[NSNumber numberWithUnsignedChar:v88];
    v108[5] = v89;
    v107[6] = @"cnSv";
    id v91 = +[NSNumber numberWithUnsignedInt:v90];
    v108[6] = v91;
    v108[7] = v100;
    v107[7] = @"deviceAddress";
    v107[8] = @"deviceIdentifier";
    v75 = [v98 UUIDString];
    v108[8] = v75;
    v107[9] = @"headsetStatus";
    id v84 = +[NSNumber numberWithUnsignedInt:v83];
    v108[9] = v84;
    v107[10] = @"model";
    uint64_t v33 = [v4 model];
    id v34 = (void *)v33;
    if (v33) {
      CFStringRef v35 = (const __CFString *)v33;
    }
    else {
      CFStringRef v35 = &stru_1008E7020;
    }
    v108[10] = v35;
    v107[11] = @"pid";
    long long v74 = +[NSNumber numberWithUnsignedInt:Int64Ranged];
    v108[11] = v74;
    v107[12] = @"pid2";
    uint64_t v36 = +[NSNumber numberWithUnsignedInt:v9];
    CFStringRef v37 = v4;
    BOOL v38 = (void *)v36;
    long long v73 = (void *)v32;
    if (v32) {
      CFStringRef v39 = (const __CFString *)v32;
    }
    else {
      CFStringRef v39 = &stru_1008E7020;
    }
    v108[12] = v36;
    v108[13] = v39;
    v107[13] = @"name";
    v107[14] = @"obcState";
    id v40 = +[NSNumber numberWithUnsignedChar:v85];
    v108[14] = v40;
    v107[15] = @"paired";
    unint64_t v41 = +[NSNumber numberWithBool:v26];
    v108[15] = v41;
    uint64_t v99 = (void *)v31;
    v108[16] = v31;
    v107[16] = @"sessionUUID";
    v107[17] = @"subType";
    char v42 = +[NSNumber numberWithUnsignedChar:v86];
    v108[17] = v42;
    v108[18] = &__kCFBooleanTrue;
    v107[18] = @"statusOnly";
    v107[19] = @"foundTicks";
    long long v87 = v37;
    id v43 = [v37 bleDevice];
    uint64_t v44 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v43 proxPairingTicks]);
    v108[19] = v44;
    v107[20] = @"triggerTicks";
    long long v45 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v108[20] = v45;
    CFStringRef v46 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:21];
    long long v47 = +[NSMutableDictionary dictionaryWithDictionary:v46];

    id v48 = (void *)v95;
    if (v95) {
      [v47 setObject:v95 forKeyedSubscript:@"engravingData"];
    }
    CFDataGetTypeID();
    id v7 = v93;
    BOOL v49 = CFDictionaryGetTypedValue();
    unsigned int v50 = v49;
    if (v49)
    {
      if ([v49 length] == (id)6)
      {
        id v70 = [v97 bytes];
        NSPrintF();
        char v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v51 = &stru_1008E7020;
      }
      id v4 = v87;
      BOOL v5 = v72;
      BOOL v52 = v94;
      [v47 setObject:v51 forKeyedSubscript:@"deviceAddress2" atIndex:v70];
    }
    else
    {
      char v51 = 0;
      id v4 = v87;
      BOOL v5 = v72;
      BOOL v52 = v94;
    }
    v53 = +[NSNumber numberWithBool:CFDictionaryGetInt64() != 0];
    [v47 setObject:v53 forKeyedSubscript:@"notMyCase"];

    char v54 = v47;
    id v55 = [v47 copy];
    [v52 setUserInfo:v55];

    statusAlertHandle = v92->_statusAlertHandle;
    if (statusAlertHandle)
    {
      [(SBSRemoteAlertHandle *)statusAlertHandle removeObserver:v92];
      [(SBSRemoteAlertHandle *)v92->_statusAlertHandle invalidate];
    }
    id v57 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v96 configurationContext:v52];
    char v58 = v92->_statusAlertHandle;
    v92->_statusAlertHandle = v57;

    uint64_t v59 = v92->_statusAlertHandle;
    if (v59)
    {
      [(SBSRemoteAlertHandle *)v59 addObserver:v92];
      [(SBSRemoteAlertHandle *)v92->_statusAlertHandle activateWithContext:0];
      v106[0] = v99;
      v105[0] = @"sid";
      v105[1] = @"rssi";
      unsigned int v60 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 rssi]);
      v106[1] = v60;
      v105[2] = @"smoothedRSSI";
      CFStringRef v61 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 rssiFloor]);
      v106[2] = v61;
      v105[3] = @"pairedModel";
      uint64_t v62 = [v4 model];
      int v63 = (void *)v62;
      CFStringRef v64 = &stru_1008E7020;
      if (v62) {
        CFStringRef v64 = (const __CFString *)v62;
      }
      v106[3] = v64;
      unsigned int v65 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];
      SFMetricsLog();

      if (dword_1009673C0 > 50)
      {
        int v66 = 0;
        id v48 = (void *)v95;
      }
      else
      {
        id v48 = (void *)v95;
        if (dword_1009673C0 != -1 || _LogCategory_Initialize())
        {
          [v5 rssiFloor];
          BOOL v71 = [v4 model];
          LogPrintF();
        }
        int v66 = 0;
      }
      long long v67 = v73;
      BOOL v52 = v94;
      goto LABEL_52;
    }
    long long v67 = v73;
    if (dword_1009673C0 <= 60 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v66 = -6740;
  }
  else
  {
    if (dword_1009673C0 <= 60 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v99 = 0;
    v100 = 0;
    long long v67 = 0;
    id v96 = 0;
    id v97 = 0;
    BOOL v52 = 0;
    id v48 = 0;
    unsigned int v50 = 0;
    char v51 = 0;
    char v54 = 0;
    int v66 = -6761;
  }
  if (dword_1009673C0 <= 60 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_52:

  return v66;
}

- (BOOL)_supportedDevice:(id)a3
{
  id v3 = [a3 model];
  if (([v3 isEqual:@"AirPods1,1"] & 1) != 0
    || ([v3 isEqual:@"BeatsX1,1"] & 1) != 0
    || ([v3 isEqual:@"AirPods1,3"] & 1) != 0
    || ([v3 isEqual:@"AirPodsPro1,1"] & 1) != 0
    || ([v3 isEqual:@"PowerBeats3,1"] & 1) != 0
    || ([v3 isEqual:@"BeatsSolo3,1"] & 1) != 0
    || ([v3 isEqual:@"Powerbeats4,1"] & 1) != 0
    || ([v3 isEqual:@"BeatsSoloPro1,1"] & 1) != 0
    || ([v3 isEqual:@"BeatsStudio3,2"] & 1) != 0
    || ([v3 isEqual:@"PowerbeatsPro1,1"] & 1) != 0
    || ([v3 isEqual:@"Device1,8202"] & 1) != 0
    || ([v3 isEqual:@"Device1,8208"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v6 = [objc_alloc((Class)SFHeadphoneProduct) initWithBluetoothModel:v3];
    BOOL v4 = v6 != 0;
  }
  return v4;
}

- (BOOL)_systemCanShowUIWithCounterpart:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = !gSDProxCardsSuppressed
    && (!v4
     || ([(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v4],
         id v8 = objc_claimAutoreleasedReturnValue(),
         v8,
         !v8))
    && ![(SDProximityPairingAgent *)self _uiShowing]
    && ([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x78801) == 0;

  return v6;
}

- (BOOL)_uiShowing
{
  return self->_pairingAlertHandle || self->_statusAlertHandle != 0;
}

- (void)_uiLockStatusChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EDFF8;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPairingUI:(id)a3
{
  id v4 = a3;
  id v15 = (const char *)[v4 UTF8String];
  strlen(v15);
  if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v4;
    LogPrintF();
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  for (char i = 0; TextSep(); i |= strnicmpx() == 0)
    ;
  BOOL v6 = -[SDProximityPairingAgent _testDeviceWithParams:](self, "_testDeviceWithParams:", v4, v9);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE2E0;
  block[3] = &unk_1008CBB80;
  void block[4] = self;
  id v11 = v6;
  char v12 = i & 1;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)testStatusUI:(id)a3
{
  id v4 = a3;
  if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v4;
    LogPrintF();
  }
  BOOL v5 = -[SDProximityPairingAgent _testDeviceWithParams:](self, "_testDeviceWithParams:", v4, v13);
  BOOL v6 = [v5 name];

  if (!v6)
  {
    id v7 = [v5 bleDevice];
    id v8 = [v7 advertisementFields];
    CFDictionaryGetInt64Ranged();

    id v9 = SFLocalizedNameForBluetoothProductID();
    uint64_t v10 = +[NSString stringWithFormat:@"John‘s %@", v9];
    [v5 setName:v10];
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE4A4;
  block[3] = &unk_1008CA640;
  void block[4] = self;
  id v15 = v5;
  id v12 = v5;
  dispatch_async(dispatchQueue, block);
}

- (id)_testDeviceWithParams:(id)a3
{
  id v84 = a3;
  id v97 = (const char *)[v84 UTF8String];
  strlen(v97);
  uint64_t v95 = 0;
  id v96 = 0;
  unsigned __int8 v94 = 0;
  unsigned int v93 = 0;
  id v86 = objc_alloc_init((Class)SFBLEDevice);
  id v85 = objc_alloc_init((Class)NSMutableDictionary);
  if (TextSep())
  {
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    id v91 = 0;
    long long v92 = 0;
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    double v4 = 1.0;
    BOOL v5 = &stru_1008E7020;
    double v6 = 0.88;
    id v7 = "model=";
    id v8 = &NSCalendarIdentifierGregorian_ptr;
    id v9 = ",";
    uint64_t v10 = "lbattery=";
    id v11 = "rbattery=";
    double v12 = 1.0;
    while (1)
    {
      id v13 = v96;
      if (v95)
      {
        do
        {
          uint64_t v14 = *v13;
          if (*v13 < 0)
          {
            if (!__maskrune(v14, 0x4000uLL)) {
              break;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
          {
            break;
          }
          ++v13;
          BOOL v15 = v95-- == 1;
          id v96 = v13;
        }
        while (!v15);
      }
      if (strnicmp_prefix())
      {
        if (!strnicmp_prefix())
        {
          id v20 = objc_alloc((Class)v8[225]);
          id v21 = [v20 initWithBytes:v96 + 9 length:v95 - 9 encoding:4];
          [v21 doubleValue];
          double v4 = v22;
LABEL_35:

          goto LABEL_36;
        }
        if (!strnicmp_prefix())
        {
          id v23 = objc_alloc((Class)v8[225]);
          id v21 = [v23 initWithBytes:v96 + 9 length:v95 - 9 encoding:4];
          [v21 doubleValue];
          double v12 = v24;
          goto LABEL_35;
        }
        if (!strnicmp_prefix())
        {
          id v25 = objc_alloc((Class)v8[225]);
          id v21 = [v25 initWithBytes:v96 + 9 length:v95 - 9 encoding:4];
          [v21 doubleValue];
          double v6 = v26;
          goto LABEL_35;
        }
        if (strnicmp_prefix())
        {
          if (strnicmp_prefix())
          {
            if (strnicmpx())
            {
              uint64_t v83 = &v93;
              if (SNScanF() == 1) {
                goto LABEL_36;
              }
              uint64_t v83 = (unsigned int *)&v94;
              if (SNScanF() == 1) {
                goto LABEL_36;
              }
              if (strnicmpx())
              {
                if (strnicmpx())
                {
                  if (strnicmpx())
                  {
                    if (!strnicmpx())
                    {
                      BYTE4(v88) = 1;
                      goto LABEL_36;
                    }
                    if (!strnicmpx())
                    {
                      BYTE4(v87) = 1;
                      goto LABEL_36;
                    }
                    if (!strnicmpx())
                    {
                      LOBYTE(v87) = 1;
                      goto LABEL_36;
                    }
                    if (!strnicmpx())
                    {
                      int v39 = v88 | 0x1000;
LABEL_50:
                      LODWORD(v88) = v39;
                      goto LABEL_36;
                    }
                    if (!strnicmpx())
                    {
                      int v39 = v88 | 0x800;
                      goto LABEL_50;
                    }
                    if (strnicmpx())
                    {
                      int v16 = strnicmpx();
                      int v17 = v89;
                      if (!v16) {
                        int v17 = 3;
                      }
                    }
                    else
                    {
                      int v17 = 2;
                    }
                  }
                  else
                  {
                    int v17 = 1;
                  }
                  LODWORD(v89) = v17;
                }
                else
                {
                  BYTE4(v89) = 1;
                }
              }
              else
              {
                LOBYTE(v90) = 1;
              }
            }
            else
            {
              BYTE4(v90) = 1;
            }
          }
          else
          {
            id v29 = objc_alloc((Class)v8[225]);
            id v30 = [v29 initWithBytes:v96 + 10 length:v95 - 10 encoding:4];
            [(id)objc_opt_class() dataFromHexString:v30];
            uint64_t v31 = v5;
            uint64_t v32 = v9;
            uint64_t v33 = v7;
            id v34 = v8;
            CFStringRef v35 = v10;
            uint64_t v36 = v11;
            v38 = CFStringRef v37 = self;

            id v91 = (void *)v38;
            self = v37;
            id v11 = v36;
            uint64_t v10 = v35;
            id v8 = v34;
            id v7 = v33;
            id v9 = v32;
            BOOL v5 = v31;
          }
        }
        else
        {
          id v27 = objc_alloc((Class)v8[225]);
          id v28 = [v27 initWithBytes:v96 + 5 length:v95 - 5 encoding:4];

          long long v92 = v28;
        }
      }
      else
      {
        id v18 = objc_alloc((Class)v8[225]);
        double v19 = (__CFString *)[v18 initWithBytes:v96 + 6 length:v95 - 6 encoding:4];

        BOOL v5 = v19;
      }
LABEL_36:
      if (!TextSep()) {
        goto LABEL_53;
      }
    }
  }
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v90 = 0;
  id v91 = 0;
  uint64_t v89 = 0;
  long long v92 = 0;
  double v12 = 1.0;
  double v6 = 0.88;
  double v4 = 1.0;
  BOOL v5 = &stru_1008E7020;
LABEL_53:
  if (![(__CFString *)v5 length] && !v93) {
    unsigned int v93 = 8194;
  }
  unint64_t v41 = v85;
  id v40 = v86;
  char v42 = v91;
  if (![(__CFString *)v5 caseInsensitiveCompare:@"b188"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b288"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b444"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b298"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b507"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b607"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b688"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b768e"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b768m"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b494"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b498"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b698"]
    || ![(__CFString *)v5 caseInsensitiveCompare:@"b463"]
    || sub_1000EF964(v93))
  {
    if ([(__CFString *)v5 caseInsensitiveCompare:@"b188"])
    {
      if (![(__CFString *)v5 caseInsensitiveCompare:@"b288"])
      {

        unsigned int v93 = 8207;
        BOOL v5 = @"AirPods1,3";
        goto LABEL_97;
      }
      if (![(__CFString *)v5 caseInsensitiveCompare:@"b298"])
      {

        unsigned int v93 = 8206;
        BOOL v5 = @"AirPodsPro1,1";
        goto LABEL_97;
      }
      if (![(__CFString *)v5 caseInsensitiveCompare:@"b444"])
      {

        unsigned int v93 = 8203;
        BOOL v5 = @"PowerbeatsPro1,1";
        goto LABEL_97;
      }
      if ([(__CFString *)v5 caseInsensitiveCompare:@"b507"])
      {
        if ([(__CFString *)v5 caseInsensitiveCompare:@"b688"])
        {
          if ([(__CFString *)v5 caseInsensitiveCompare:@"b768e"])
          {
            if ([(__CFString *)v5 caseInsensitiveCompare:@"b768m"])
            {
              if ([(__CFString *)v5 caseInsensitiveCompare:@"b494"])
              {
                if ([(__CFString *)v5 caseInsensitiveCompare:@"b498"])
                {
                  if ([(__CFString *)v5 caseInsensitiveCompare:@"b698"])
                  {
                    if ([(__CFString *)v5 caseInsensitiveCompare:@"b607"])
                    {
                      if ([(__CFString *)v5 caseInsensitiveCompare:@"b463"]) {
                        goto LABEL_83;
                      }
                      v53 = +[SFHeadphoneProduct b463];
                      uint64_t v44 = [v53 bluetoothModel];

                      long long v45 = +[SFHeadphoneProduct b463];
                    }
                    else
                    {
                      BOOL v52 = +[SFHeadphoneProduct b607];
                      uint64_t v44 = [v52 bluetoothModel];

                      long long v45 = +[SFHeadphoneProduct b607];
                    }
                  }
                  else
                  {
                    char v51 = +[SFHeadphoneProduct b698];
                    uint64_t v44 = [v51 bluetoothModel];

                    long long v45 = +[SFHeadphoneProduct b698];
                  }
                }
                else
                {
                  unsigned int v50 = +[SFHeadphoneProduct b498];
                  uint64_t v44 = [v50 bluetoothModel];

                  long long v45 = +[SFHeadphoneProduct b498];
                }
              }
              else
              {
                BOOL v49 = +[SFHeadphoneProduct b494];
                uint64_t v44 = [v49 bluetoothModel];

                long long v45 = +[SFHeadphoneProduct b494];
              }
            }
            else
            {
              id v48 = +[SFHeadphoneProduct b768m];
              uint64_t v44 = [v48 bluetoothModel];

              long long v45 = +[SFHeadphoneProduct b768m];
            }
          }
          else
          {
            long long v47 = +[SFHeadphoneProduct b768e];
            uint64_t v44 = [v47 bluetoothModel];

            long long v45 = +[SFHeadphoneProduct b768e];
          }
        }
        else
        {
          CFStringRef v46 = +[SFHeadphoneProduct b688];
          uint64_t v44 = [v46 bluetoothModel];

          long long v45 = +[SFHeadphoneProduct b688];
        }
      }
      else
      {
        id v43 = +[SFHeadphoneProduct b507];
        uint64_t v44 = [v43 bluetoothModel];

        long long v45 = +[SFHeadphoneProduct b507];
      }
      char v54 = v45;
      unsigned int v93 = [v45 productID];

      BOOL v5 = (__CFString *)v44;
      goto LABEL_97;
    }
LABEL_83:

    unsigned int v93 = 8194;
    BOOL v5 = @"AirPods1,1";
LABEL_97:
    id v55 = objc_alloc_init((Class)SFBatteryInfo);
    [v55 setBatteryLevel:fabs(v4)];
    if (v4 < 0.0) {
      uint64_t v56 = 1;
    }
    else {
      uint64_t v56 = 2;
    }
    [v55 setBatteryState:v56];
    [v55 setBatteryType:2];
    id v57 = objc_alloc_init((Class)SFBatteryInfo);
    [v57 setBatteryLevel:fabs(v12)];
    if (v12 < 0.0) {
      uint64_t v58 = 1;
    }
    else {
      uint64_t v58 = 2;
    }
    [v57 setBatteryState:v58];
    [v57 setBatteryType:3];
    id v59 = objc_alloc_init((Class)SFBatteryInfo);
    [v59 setBatteryLevel:fabs(v6)];
    if (v6 < 0.0) {
      uint64_t v60 = 1;
    }
    else {
      uint64_t v60 = 2;
    }
    [v59 setBatteryState:v60];
    [v59 setBatteryType:1];
    v110[0] = v55;
    v110[1] = v57;
    v110[2] = v59;
    CFStringRef v61 = +[NSArray arrayWithObjects:v110 count:3];

    goto LABEL_107;
  }
  if (![(__CFString *)v5 caseInsensitiveCompare:@"b282"] || v93 == 8197)
  {

    unsigned int v93 = 8197;
    id v55 = objc_alloc_init((Class)SFBatteryInfo);
    [v55 setBatteryLevel:0.82];
    [v55 setBatteryState:2];
    [v55 setBatteryType:4];
    id v109 = v55;
    CFStringRef v61 = +[NSArray arrayWithObjects:&v109 count:1];
    BOOL v5 = @"BeatsX1,1";
  }
  else if (![(__CFString *)v5 caseInsensitiveCompare:@"b312"] || v93 == 8195)
  {

    unsigned int v93 = 8195;
    id v55 = objc_alloc_init((Class)SFBatteryInfo);
    [v55 setBatteryLevel:0.12];
    [v55 setBatteryState:1];
    [v55 setBatteryType:4];
    id v108 = v55;
    CFStringRef v61 = +[NSArray arrayWithObjects:&v108 count:1];
    BOOL v5 = @"PowerBeats3,1";
  }
  else if (![(__CFString *)v5 caseInsensitiveCompare:@"b352"] || v93 == 8198)
  {

    unsigned int v93 = 8198;
    id v55 = objc_alloc_init((Class)SFBatteryInfo);
    [v55 setBatteryLevel:0.52];
    [v55 setBatteryState:2];
    [v55 setBatteryType:4];
    id v107 = v55;
    CFStringRef v61 = +[NSArray arrayWithObjects:&v107 count:1];
    BOOL v5 = @"BeatsSolo3,1";
  }
  else if (![(__CFString *)v5 caseInsensitiveCompare:@"b443"] || v93 == 8201)
  {

    unsigned int v93 = 8201;
    id v55 = objc_alloc_init((Class)SFBatteryInfo);
    [v55 setBatteryLevel:0.43];
    [v55 setBatteryState:2];
    [v55 setBatteryType:4];
    id v106 = v55;
    CFStringRef v61 = +[NSArray arrayWithObjects:&v106 count:1];
    BOOL v5 = @"BeatsStudio3,2";
  }
  else
  {
    if (![(__CFString *)v5 caseInsensitiveCompare:@"b453"] || v93 == 8215)
    {

      unsigned int v93 = 8215;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.68];
      [v55 setBatteryState:1];
      [v55 setBatteryType:4];
      id v105 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v105 count:1];
      BOOL v5 = @"BeatsStudioPro1,1";
    }
    else if (![(__CFString *)v5 caseInsensitiveCompare:@"b465"] || v93 == 8229)
    {

      unsigned int v93 = 8229;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.74];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v104 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v104 count:1];
      BOOL v5 = @"Device1,8229";
    }
    else if (![(__CFString *)v5 caseInsensitiveCompare:@"b487"] || v93 == 8218)
    {

      unsigned int v93 = 8218;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.56];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v103 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v103 count:1];
      BOOL v5 = @"Device1,8218";
    }
    else if (![(__CFString *)v5 caseInsensitiveCompare:@"b419"] || v93 == 8204)
    {

      unsigned int v93 = 8204;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.19];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v102 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v102 count:1];
      BOOL v5 = @"BeatsSoloPro1,1";
    }
    else if (![(__CFString *)v5 caseInsensitiveCompare:@"b364"] || v93 == 8205)
    {

      unsigned int v93 = 8205;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.64];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v101 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v101 count:1];
      BOOL v5 = @"Powerbeats4,1";
    }
    else if (![(__CFString *)v5 caseInsensitiveCompare:@"b515"] || v93 == 8202)
    {

      unsigned int v93 = 8202;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.15];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v100 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v100 count:1];
      BOOL v5 = @"Device1,8202";
    }
    else
    {
      if ([(__CFString *)v5 caseInsensitiveCompare:@"b372"] && v93 != 8208)
      {
        id v55 = objc_alloc_init((Class)SFBatteryInfo);
        [v55 setBatteryLevel:0.75];
        [v55 setBatteryState:1];
        [v55 setBatteryType:4];
        id v98 = v55;
        CFStringRef v61 = +[NSArray arrayWithObjects:&v98 count:1];
        unint64_t v41 = v85;
        id v40 = v86;
        char v42 = v91;
        goto LABEL_107;
      }

      unsigned int v93 = 8208;
      id v55 = objc_alloc_init((Class)SFBatteryInfo);
      [v55 setBatteryLevel:0.15];
      [v55 setBatteryState:2];
      [v55 setBatteryType:4];
      id v99 = v55;
      CFStringRef v61 = +[NSArray arrayWithObjects:&v99 count:1];
      BOOL v5 = @"Device1,8208";
    }
    unint64_t v41 = v85;
    id v40 = v86;
    char v42 = v91;
  }
LABEL_107:

  uint64_t v62 = +[NSNumber numberWithUnsignedChar:v89];
  [v41 setObject:v62 forKeyedSubscript:@"csVs"];

  int v63 = +[NSNumber numberWithUnsignedChar:v94];
  [v41 setObject:v63 forKeyedSubscript:@"cc"];

  CFStringRef v64 = +[NSNumber numberWithUnsignedInt:v93];
  [v41 setObject:v64 forKeyedSubscript:@"pid"];

  if (v90) {
    [v41 setObject:&off_100902AD8 forKeyedSubscript:@"csLC"];
  }
  if ((v89 & 0x100000000) != 0) {
    [v41 setObject:&off_100902AD8 forKeyedSubscript:@"csLC"];
  }
  if (v42) {
    [v41 setObject:v42 forKeyedSubscript:@"engravingData"];
  }
  if ((v88 & 0x100000000) != 0)
  {
    unsigned int v65 = v93;
    if (v93 == 8207)
    {
      int v66 = v40;
      uint64_t v67 = 8194;
    }
    else
    {
      if (v93 != 8194)
      {
        unsigned __int8 v68 = +[SFHeadphoneProduct airPodsPro];
        unsigned int v69 = [v68 productID];

        if (v65 == v69)
        {
          id v70 = +[SFHeadphoneProduct b698];
        }
        else
        {
          unsigned int v71 = v93;
          long long v72 = +[SFHeadphoneProduct b698];
          unsigned int v73 = [v72 productID];

          if (v71 != v73) {
            goto LABEL_124;
          }
          id v70 = +[SFHeadphoneProduct airPodsPro];
        }
        long long v74 = v70;
        [v40 setProductID2:[v70 productID]];

        goto LABEL_124;
      }
      int v66 = v40;
      uint64_t v67 = 8207;
    }
    [v66 setProductID2:v67];
LABEL_124:
    v75 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v40 productID2]);
    [v41 setObject:v75 forKeyedSubscript:@"pid2"];

    [v41 setObject:&off_100902AF0 forKeyedSubscript:@"subType"];
  }
  CFStringRef v76 = @"00000000-0000-0000-0000-000000000003";
  if ((v87 & 1 & BYTE4(v87)) != 0) {
    CFStringRef v76 = @"00000000-0000-0000-0000-000000000004";
  }
  CFStringRef v77 = @"00000000-0000-0000-0000-000000000000";
  if ((v90 & 0x100000000) != 0) {
    CFStringRef v77 = @"00000000-0000-0000-0000-000000000001";
  }
  if ((v87 & 0x100000000) != 0) {
    CFStringRef v77 = @"00000000-0000-0000-0000-000000000002";
  }
  if (v87) {
    CFStringRef v78 = v76;
  }
  else {
    CFStringRef v78 = v77;
  }
  [v40 setAdvertisementFields:v41];
  unsigned __int8 v79 = +[NSData dataWithBytes:&unk_10076E1FC length:6];
  [v40 setBluetoothAddress:v79];

  id v80 = objc_alloc_init((Class)SFDevice);
  [v80 setBatteryInfo:v61];
  [v80 setBleDevice:v40];
  [v80 setDeviceFlags:v88];
  id v81 = [objc_alloc((Class)NSUUID) initWithUUIDString:v78];
  [v80 setIdentifier:v81];

  [v80 setModel:v5];
  [v80 setTestMode:1];
  [v80 setName:v92];

  return v80;
}

+ (id)dataFromHexString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [@"0" stringByAppendingString:v3];

    id v3 = (id)v4;
  }
  id v5 = v3;
  double v6 = (char *)[v5 UTF8String];
  int v7 = [v5 length];
  if (v7 >= 0) {
    int v8 = v7;
  }
  else {
    int v8 = v7 + 1;
  }
  id v9 = +[NSMutableData dataWithCapacity:(uint64_t)v8 >> 1];
  char v14 = 0;
  unint64_t v12 = 0;
  if (v7 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      *(_WORD *)__str = *(_WORD *)&v6[v10];
      v10 += 2;
      unint64_t v12 = strtoul(__str, 0, 16);
      [v9 appendBytes:&v12 length:1];
    }
    while ((int)v10 < v7);
  }

  return v9;
}

- (BOOL)shouldNotTriggerBecauseDeviceInformationIsTooOld:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bleDevice];
  id v5 = [v4 advertisementFields];
  double v6 = [v5 objectForKey:@"sampleTimestamp"];

  if (!v6)
  {
    if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
LABEL_8:
    LogPrintF();
LABEL_15:
    BOOL v11 = 1;
    goto LABEL_18;
  }
  int v7 = [v3 bleDevice];
  int v8 = [v7 advertisementFields];
  CFDictionaryGetDouble();
  double v10 = v9;

  if ((double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0 - v10 > 5.0)
  {
    if (dword_1009673C0 > 50 || dword_1009673C0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  if (dword_1009673C0 <= 10 && (dword_1009673C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EFD64;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)ensureTimerStartedForBufferedDevicesPurge
{
  id v3 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];

  if (!v3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    double v10 = sub_1000F0114;
    BOOL v11 = &unk_1008CA3B0;
    objc_copyWeak(&v12, &location);
    dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v8);
    -[SDProximityPairingAgent setBufferedDevicesPurgeBlock:](self, "setBufferedDevicesPurgeBlock:", v4, v8, v9, v10, v11);

    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    int v7 = [(SDProximityPairingAgent *)self bufferedDevicesPurgeBlock];
    dispatch_after(v5, dispatchQueue, v7);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)removeOldBufferedSamplesFromCache
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(NSMutableDictionary *)self->_bufferedDevices allKeys];
  id v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v27;
    do
    {
      for (char i = 0; i != v25; char i = (char *)i + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v22 = v4;
          LogPrintF();
        }
        dispatch_time_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bufferedDevices, "objectForKeyedSubscript:", v4, v22);
        id v6 = [v5 bleDevice];
        int v7 = [v6 advertisementFields];
        id v8 = [v7 objectForKey:@"sampleTimestamp"];

        if (v8)
        {
          uint64_t v9 = [v5 bleDevice];
          double v10 = [v9 advertisementFields];
          CFDictionaryGetDouble();
          unint64_t v12 = (unint64_t)v11;
        }
        else
        {
          unint64_t v12 = 0;
        }
        id v13 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
        char v14 = v13;
        if (v13)
        {
          BOOL v15 = [v13 bleDevice];
          int v16 = [v15 advertisementFields];
          int v17 = [v16 objectForKey:@"sampleTimestamp"];

          if (v17)
          {
            id v18 = [v14 bleDevice];
            double v19 = [v18 advertisementFields];
            CFDictionaryGetDouble();
            unint64_t v21 = (unint64_t)v20;

            if (v12 >= v21)
            {
              if (dword_1009673C0 <= 50 && (dword_1009673C0 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
                -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v4);
              }
              else
              {
                -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v22);
              }
            }
          }
        }
        [(NSMutableDictionary *)self->_bufferedDevices removeObjectForKey:v4];
      }
      id v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)bufferedDevicesPurgeBlock
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setBufferedDevicesPurgeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferedDevicesPurgeBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_headphoneProxFeatureClient, 0);
  objc_storeStrong((id *)&self->_proximityPairingBufferedScanner, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAlertHandle, 0);
  objc_storeStrong((id *)&self->_statusAlertHandle, 0);
  objc_storeStrong((id *)&self->_powerSourceContainers, 0);
  objc_storeStrong((id *)&self->_pairingAlertHandle, 0);
  objc_storeStrong((id *)&self->_fastScanTimer, 0);
  objc_storeStrong((id *)&self->_bufferedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong((id *)&self->_bluetoothUserInteractionClients, 0);
}

@end