@interface SDHotspotAgent
+ (id)sharedAgent;
- (BOOL)_advertiserShouldAdvertise;
- (BOOL)_companionLinkFamilySupported;
- (BOOL)_companionLinkShouldStart;
- (BOOL)_fillXpcDictionaryDescriptor:(id)a3 descriptor:(id)a4 metaData:(id)a5;
- (BOOL)_legacyBrowserShouldBrowse;
- (BOOL)_legacyBrowserShouldScan;
- (BOOL)_legacyBrowserShouldStart;
- (BOOL)_sysMonitorD2DEncryptionIsAvailable;
- (BOOL)isTetheringInUse;
- (BOOL)p2pAllowed;
- (LogCategory)_logCategoryCreateWithLabel:(id)a3 sessionID:(unsigned int)a4;
- (NSString)description;
- (NSString)hotspotName;
- (NSString)hotspotPassword;
- (SDHotspotAgent)init;
- (id)_appMonitorAppList;
- (id)_appMonitorStringForState:(unsigned int)a3;
- (id)_idsDeviceArray;
- (id)_idsDeviceIDForBluetoothID:(id)a3;
- (id)_slicingLLPHSStateNotificationValueToString:(unint64_t)a3;
- (id)_sysMonitorFamilyMemberForAltDSID:(id)a3;
- (id)_sysMonitorFamilyMemberForAppleID:(id)a3;
- (int64_t)_discoveryGroupForDevice:(id)a3;
- (int64_t)_idsLegacyClientDeviceCount;
- (int64_t)_idsLegacyHostDeviceCount;
- (int64_t)_idsTetheringClientDeviceCount;
- (int64_t)_idsTetheringHostDeviceCount;
- (int64_t)_sysMonitorFamilyCount;
- (unsigned)_nearbyNetworkTypeForHotspotNetworkType:(unsigned __int8)a3;
- (void)_activate;
- (void)_addClientID:(id)a3 bundleID:(id)a4 proxy:(id)a5;
- (void)_additionalInfoForRequest:(id)a3 toMessage:(id)a4;
- (void)_advertiserEnsureStopped;
- (void)_advertiserUpdate;
- (void)_appMonitorEnsureStarted;
- (void)_appMonitorEnsureStopped;
- (void)_appMonitorUpdate;
- (void)_companionLinkActivateWithRequest:(id)a3;
- (void)_companionLinkActivatedRequest:(id)a3;
- (void)_companionLinkEnsureStarted;
- (void)_companionLinkEnsureStopped;
- (void)_companionLinkHandleLowLatencyFilterRequestOfType:(int64_t)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_companionLinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_companionLinkHandleResponse:(id)a3 request:(id)a4 error:(id)a5;
- (void)_companionLinkStartTetheringWithResponse:(id)a3 logCategory:(LogCategory *)a4 modelID:(id)a5 productVersion:(id)a6 canConnectOn5GHz:(BOOL)a7;
- (void)_discoveryCellularSlicingStateUpdateFor:(id)a3;
- (void)_discoveryDeviceChanged:(id)a3;
- (void)_discoveryDeviceFound:(id)a3;
- (void)_discoveryDeviceLost:(id)a3;
- (void)_discoveryUpdateClients;
- (void)_discoveryUpdateCombined:(BOOL)a3;
- (void)_discoveryUpdateLegacyDeviceList:(id)a3;
- (void)_enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)_idsEnsureStarted;
- (void)_idsEnsureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_legacyBrowserEnsureStarted;
- (void)_legacyBrowserEnsureStopped;
- (void)_legacyBrowswerUpdateD2DState;
- (void)_postUserAlertForName:(id)a3 altDSID:(id)a4 logCategory:(LogCategory *)a5 completion:(id)a6;
- (void)_prefsChanged:(BOOL)a3;
- (void)_registerForCellularSlicingAvailabilityNotifications;
- (void)_registerForWombatActivityNotifications;
- (void)_removeClientID:(id)a3;
- (void)_startBrowsingForClientID:(id)a3;
- (void)_stopBrowsingForClientID:(id)a3;
- (void)_sysMonitorEnsureStarted;
- (void)_sysMonitorEnsureStopped;
- (void)_unregisterForCellularSlicingCapabilityNotifications;
- (void)_unregisterWombatActivityNotifications;
- (void)_update;
- (void)_updateAdvertisementSuppression:(BOOL)a3;
- (void)_userAlertForMember:(id)a3 logCategory:(LogCategory *)a4 completion:(id)a5;
- (void)activate;
- (void)addClientID:(id)a3 proxy:(id)a4;
- (void)disableTethering;
- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)hotspotManagerTetheringSupportChanged:(id)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)removeClientID:(id)a3;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)stopBrowsingForClientID:(id)a3;
- (void)testNotification;
- (void)update;
- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5;
- (void)updatedFoundDeviceList:(id)a3;
@end

@implementation SDHotspotAgent

+ (id)sharedAgent
{
  if (qword_10097FC98 != -1) {
    dispatch_once(&qword_10097FC98, &stru_1008CB568);
  }
  v2 = (void *)qword_10097FCA0;

  return v2;
}

- (SDHotspotAgent)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDHotspotAgent;
  v2 = [(SDHotspotAgent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_advertisementTime = 0.0;
    v2->_cellularSlicingNotifyToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.sharing.SDHotspotAgent", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_familyCount = -1;
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    *(_OWORD *)&v3->_idsLegacyClientDeviceCount = v6;
    *(_OWORD *)&v3->_idsTetheringClientDeviceCount = v6;
    *(void *)&v3->_wombatActivityReadyToken = 0xFFFFFFFFLL;
    v7 = v3;
  }

  return v3;
}

- (NSString)description
{
  NSAppendPrintF();
  id v31 = 0;
  NSAppendPrintF();
  id v3 = v31;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  NSAppendPrintF();
  id v6 = v5;

  int64_t idsLegacyHostDeviceCount = self->_idsLegacyHostDeviceCount;
  NSAppendPrintF();
  id v7 = v6;

  if ([(SDHotspotManager *)self->_hotspotManager isTetheringSupported]) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  v25 = v8;
  NSAppendPrintF();
  id v9 = v7;

  [(NSArray *)self->_idsDeviceArray count];
  NSAppendPrintF();
  id v10 = v9;

  NSAppendPrintF();
  id v11 = v10;

  int64_t idsTetheringHostDeviceCount = self->_idsTetheringHostDeviceCount;
  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  v14 = [(SDStatusMonitor *)self->_statusMonitor localPowerSource];
  [v14 chargeLevel];
  uint64_t v27 = (uint64_t)(v15 * 100.0);
  NSAppendPrintF();
  id v16 = v13;

  if ([(SDStatusMonitor *)self->_statusMonitor familyHotspotEnabled]) {
    v17 = "yes";
  }
  else {
    v17 = "no";
  }
  v28 = v17;
  NSAppendPrintF();
  id v18 = v16;

  uint64_t v29 = [(SDStatusMonitor *)self->_statusMonitor networkType];
  NSAppendPrintF();
  id v19 = v18;

  int64_t v30 = [(SDStatusMonitor *)self->_statusMonitor signalStrength];
  NSAppendPrintF();
  id v20 = v19;

  [(SDHotspotAgent *)self p2pAllowed];
  NSAppendPrintF();
  id v21 = v20;

  NSAppendPrintF();
  id v22 = v21;

  return (NSString *)v22;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072B08;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = objc_alloc_init(_TtC16DaemoniOSLibrary28SDLocalCellularStatusManager);
  cellularStatusManager = self->_cellularStatusManager;
  self->_cellularStatusManager = v3;

  id v5 = +[SDStatusMonitor sharedMonitor];
  statusMonitor = self->_statusMonitor;
  self->_statusMonitor = v5;

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"update" name:@"com.apple.sharingd.HotspotAutoStateChanged" object:0];
  [v7 addObserver:self selector:"update" name:@"com.apple.sharingd.HotspotFamilyStateChanged" object:0];
  [v7 addObserver:self selector:"update" name:@"com.apple.sharingd.PowerSourceChanged" object:0];
  [v7 addObserver:self selector:"update" name:@"com.apple.sharingd.SIMDataChanged" object:0];
  [v7 addObserver:self selector:"update" name:@"com.apple.sharingd.SignalStrengthChanged" object:0];
  [v7 addObserver:self selector:"update" name:@"SDHotspotManagerConnectionStateChanged" object:0];
  [(SDHotspotAgent *)self _prefsChanged:1];
  [(SDHotspotAgent *)self _idsEnsureStarted];
  [(SDHotspotAgent *)self _sysMonitorEnsureStarted];
  [(SDHotspotAgent *)self _registerForWombatActivityNotifications];
  if (_os_feature_enabled_impl()) {
    [(SDHotspotAgent *)self _registerForCellularSlicingAvailabilityNotifications];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072D44;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072E9C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDHotspotAgent *)self _unregisterWombatActivityNotifications];
    [(SDHotspotAgent *)self _unregisterForCellularSlicingCapabilityNotifications];
    [(SDHotspotAgent *)self _advertiserEnsureStopped];
    [(SDHotspotAgent *)self _companionLinkEnsureStopped];
    [(SDHotspotAgent *)self _idsEnsureStopped];
    [(SDHotspotAgent *)self _legacyBrowserEnsureStopped];
    [(SDHotspotAgent *)self _sysMonitorEnsureStopped];
    [(SDHotspotAgent *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_invalidateDone = 1;
  if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)prefsChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007308C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_prefsChanged:(BOOL)a3
{
  int v50 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v5 = CFPrefs_GetInt64() != 0;
  if (self->_prefAdvertisingDisabled != v5)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = "yes";
      if (v5) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v5) {
        id v6 = "no";
      }
      v47 = v7;
      v48 = (void *)v6;
      LogPrintF();
    }
    self->_prefAdvertisingDisabled = v5;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v50) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = Int64;
  }
  uint64_t v10 = 100;
  if (v9 < 100) {
    uint64_t v10 = v9;
  }
  if (v10 <= 1) {
    LODWORD(v10) = 1;
  }
  if (v9 < 0) {
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v11 = v10;
  }
  prefBatteryLevelOverride = (const char *)self->_prefBatteryLevelOverride;
  if (v11 != prefBatteryLevelOverride)
  {
    if (dword_1009667F0 <= 50)
    {
      if (dword_1009667F0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_27;
        }
        prefBatteryLevelOverride = (const char *)self->_prefBatteryLevelOverride;
      }
      v47 = prefBatteryLevelOverride;
      v48 = (void *)v11;
      LogPrintF();
    }
LABEL_27:
    self->_prefBatteryLevelOverride = v11;
  }
  uint64_t v13 = CFPrefs_GetInt64();
  if (v50) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  BOOL v15 = !v14;
  if (self->_prefChargingOverrideDisabled != v15)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = "yes";
      if (v15) {
        v17 = "no";
      }
      else {
        v17 = "yes";
      }
      if (!v15) {
        id v16 = "no";
      }
      v47 = v17;
      v48 = (void *)v16;
      LogPrintF();
    }
    self->_prefChargingOverrideDisabled = v15;
  }
  uint64_t v18 = CFPrefs_GetInt64();
  if (!v50 || (id v19 = self->_prefFamilyEnabledOverride, self->_prefFamilyEnabledOverride = 0, v19, !v50))
  {
    prefFamilyEnabledOverride = self->_prefFamilyEnabledOverride;
    if (!prefFamilyEnabledOverride
      || (v18 != 0) != [(NSNumber *)prefFamilyEnabledOverride BOOLValue])
    {
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v21 = [(NSNumber *)self->_prefFamilyEnabledOverride BOOLValue];
        id v22 = "no";
        if (v21) {
          v23 = "yes";
        }
        else {
          v23 = "no";
        }
        if (v18) {
          id v22 = "yes";
        }
        v47 = v23;
        v48 = (void *)v22;
        LogPrintF();
      }
      +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18 != 0, v47, v48);
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v25 = self->_prefFamilyEnabledOverride;
      self->_prefFamilyEnabledOverride = v24;
    }
  }
  uint64_t v26 = CFPrefs_GetInt64();
  if (v50) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = v26 == 0;
  }
  BOOL v28 = !v27;
  if (self->_prefLegacyDisabled != v28)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v29 = "yes";
      if (v28) {
        int64_t v30 = "no";
      }
      else {
        int64_t v30 = "yes";
      }
      if (!v28) {
        uint64_t v29 = "no";
      }
      v47 = v30;
      v48 = (void *)v29;
      LogPrintF();
    }
    self->_prefLegacyDisabled = v28;
  }
  CFStringGetTypeID();
  id v31 = (void *)CFPrefs_CopyTypedValue();
  if (!v50 || (v32 = self->_prefNetworkTypeOverride, self->_prefNetworkTypeOverride = 0, v32, !v50))
  {
    if (v31)
    {
      char v49 = 0;
      uint64_t v33 = SFHotspotTypeStringToType(v31, &v49);
      if (v49)
      {
        uint64_t v34 = v33;
        unsigned __int8 v35 = [(NSNumber *)self->_prefNetworkTypeOverride unsignedIntValue];
        if (dword_1009667F0 <= 50)
        {
          unsigned __int8 v36 = v35;
          if (dword_1009667F0 != -1 || _LogCategory_Initialize())
          {
            SFHotspotNetworkTypeString(v36);
            v37 = (char *)objc_claimAutoreleasedReturnValue();
            SFHotspotNetworkTypeString(v34);
            v48 = v47 = v37;
            LogPrintF();
          }
        }
        +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v34, v47, v48);
        v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        prefNetworkTypeOverride = self->_prefNetworkTypeOverride;
        self->_prefNetworkTypeOverride = v38;
      }
    }
  }
  uint64_t v40 = CFPrefs_GetInt64();
  if (v50) {
    BOOL v41 = 1;
  }
  else {
    BOOL v41 = v40 == 0;
  }
  BOOL v42 = !v41;
  if (self->_prefRapportDisabled != v42)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefRapportDisabled = v42;
  }
  uint64_t v43 = CFPrefs_GetInt64();
  if (v50) {
    uint64_t v44 = 0;
  }
  else {
    uint64_t v44 = v43;
  }
  int v45 = 4;
  if (v44 < 4) {
    int v45 = v44;
  }
  if (v44 >= 1) {
    int v46 = v45;
  }
  else {
    int v46 = 0;
  }
  if (v46 != self->_prefSignalStrengthOverride)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefSignalStrengthOverride = v46;
  }
  if (!a3) {
    [(SDHotspotAgent *)self _update];
  }
}

- (void)update
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073750;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDHotspotAgent *)self _advertiserShouldAdvertise]) {
    [(SDHotspotAgent *)self _advertiserUpdate];
  }
  else {
    [(SDHotspotAgent *)self _advertiserEnsureStopped];
  }
  if ([(SDHotspotAgent *)self _companionLinkShouldStart]) {
    [(SDHotspotAgent *)self _companionLinkEnsureStarted];
  }
  else {
    [(SDHotspotAgent *)self _companionLinkEnsureStopped];
  }
  if ([(SDHotspotAgent *)self _legacyBrowserShouldStart])
  {
    [(SDHotspotAgent *)self _legacyBrowserEnsureStarted];
  }
  else
  {
    [(SDHotspotAgent *)self _legacyBrowserEnsureStopped];
  }
}

- (void)_advertiserUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = [(SDStatusMonitor *)self->_statusMonitor localPowerSource];
  unsigned int v4 = [v3 charging];
  [v3 chargeLevel];
  double v6 = v5 * 100.0;
  if (self->_prefBatteryLevelOverride <= 0) {
    uint64_t prefBatteryLevelOverride = (uint64_t)v6;
  }
  else {
    uint64_t prefBatteryLevelOverride = self->_prefBatteryLevelOverride;
  }
  BOOL v8 = self->_prefChargingOverrideDisabled || v4 == 0;
  if (v8 || prefBatteryLevelOverride > 20)
  {
    if (prefBatteryLevelOverride >= 21)
    {
      if ((unint64_t)prefBatteryLevelOverride < 0x64) {
        int v10 = 2;
      }
      else {
        int v10 = 3;
      }
      if ((unint64_t)prefBatteryLevelOverride >= 0x33) {
        int v9 = v10;
      }
      else {
        int v9 = 1;
      }
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v9 = 1;
  }
  prefFamilyEnabledOverride = self->_prefFamilyEnabledOverride;
  if (prefFamilyEnabledOverride) {
    unsigned int v12 = [(NSNumber *)prefFamilyEnabledOverride BOOLValue];
  }
  else {
    unsigned int v12 = [(SDStatusMonitor *)self->_statusMonitor familyHotspotEnabled];
  }
  unsigned int v36 = v12;
  prefNetworkTypeOverride = self->_prefNetworkTypeOverride;
  if (prefNetworkTypeOverride) {
    unsigned __int8 v14 = [(NSNumber *)prefNetworkTypeOverride integerValue];
  }
  else {
    unsigned __int8 v14 = [(SDStatusMonitor *)self->_statusMonitor networkType];
  }
  unsigned __int8 v15 = [(SDHotspotAgent *)self _nearbyNetworkTypeForHotspotNetworkType:v14];
  unsigned __int8 prefSignalStrengthOverride = self->_prefSignalStrengthOverride;
  if (!prefSignalStrengthOverride) {
    unsigned __int8 prefSignalStrengthOverride = [(SDStatusMonitor *)self->_statusMonitor signalStrength];
  }
  if (prefSignalStrengthOverride) {
    char v17 = prefSignalStrengthOverride - 1;
  }
  else {
    char v17 = 0;
  }
  uint64_t v18 = +[SDNearbyAgent sharedNearbyAgent];
  unsigned int v19 = [v18 hotspotInfo];

  if (v36) {
    int v20 = 128;
  }
  else {
    int v20 = 0;
  }
  uint64_t v21 = v9 | v20 | (16 * (v15 & 7)) | (4 * (v17 & 3)) | 0x100u;
  if (v19 != v21)
  {
    char v22 = v21 ^ v19;
    double Current = CFAbsoluteTimeGetCurrent();
    if ((v22 & 0x83) != 0)
    {
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
      {
        v24 = "yes";
        if ((v22 & 3) != 0) {
          v25 = "yes";
        }
        else {
          v25 = "no";
        }
        if ((v22 & 0x80) == 0) {
          v24 = "no";
        }
        uint64_t v34 = v25;
        unsigned __int8 v35 = v24;
        LogPrintF();
      }
LABEL_53:
      BOOL v27 = +[SDNearbyAgent sharedNearbyAgent];
      [v27 setHotspotInfo:v21];

      if (dword_1009667F0 > 50 || dword_1009667F0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_57;
      }
LABEL_55:
      LogPrintF();
      goto LABEL_57;
    }
    double advertisementTime = self->_advertisementTime;
    if (Current > advertisementTime)
    {
      self->_double advertisementTime = CFAbsoluteTimeGetCurrent() + 60.0;
      goto LABEL_53;
    }
    if (self->_advertisementTimer)
    {
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_55;
      }
    }
    else if (advertisementTime - Current <= 0.0)
    {
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SDHotspotAgent *)self _update];
    }
    else
    {
      id v31 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      advertisementTimer = self->_advertisementTimer;
      self->_advertisementTimer = v31;

      uint64_t v33 = self->_advertisementTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100073D94;
      handler[3] = &unk_1008CA4B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v33, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_advertisementTimer);
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_55;
      }
    }
  }
LABEL_57:
  if (!self->_companionLinkReceiver)
  {
    BOOL v28 = (RPCompanionLinkClient *)objc_opt_new();
    companionLinkReceiver = self->_companionLinkReceiver;
    self->_companionLinkReceiver = v28;

    [(RPCompanionLinkClient *)self->_companionLinkReceiver setDispatchQueue:self->_dispatchQueue];
    int64_t v30 = self->_companionLinkReceiver;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100073E28;
    v37[3] = &unk_1008CB5B8;
    v37[4] = self;
    [(RPCompanionLinkClient *)v30 registerRequestID:@"com.sharing.hotspot.request" options:0 handler:v37];
    [(RPCompanionLinkClient *)self->_companionLinkReceiver setInterruptionHandler:&stru_1008CB5D8];
    [(RPCompanionLinkClient *)self->_companionLinkReceiver setInvalidationHandler:&stru_1008CB5F8];
    [(RPCompanionLinkClient *)self->_companionLinkReceiver activateWithCompletion:&stru_1008CB618];
  }
}

- (void)_advertiserEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[SDNearbyAgent sharedNearbyAgent];
  [v3 setHotspotInfo:0];

  companionLinkReceiver = self->_companionLinkReceiver;
  if (companionLinkReceiver)
  {
    [(RPCompanionLinkClient *)companionLinkReceiver setInterruptionHandler:0];
    [(RPCompanionLinkClient *)self->_companionLinkReceiver setInvalidationHandler:0];
    [(RPCompanionLinkClient *)self->_companionLinkReceiver invalidate];
    double v5 = self->_companionLinkReceiver;
    self->_companionLinkReceiver = 0;

    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)_advertiserShouldAdvertise
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 40 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    if (self->_prefAdvertisingDisabled) {
      id v3 = "yes";
    }
    else {
      id v3 = "no";
    }
    int64_t v4 = [(SDHotspotAgent *)self _idsTetheringClientDeviceCount];
    int64_t v5 = [(SDHotspotAgent *)self _sysMonitorFamilyCount];
    if ([(SDHotspotManager *)self->_hotspotManager isTetheringSupported]) {
      double v6 = "yes";
    }
    else {
      double v6 = "no";
    }
    if (self->_systemMonitorActivated) {
      id v7 = "yes";
    }
    else {
      id v7 = "no";
    }
    if ([(SDHotspotManager *)self->_hotspotManager maxConnectionsReached]) {
      BOOL v8 = "yes";
    }
    else {
      BOOL v8 = "no";
    }
    if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]) {
      int v9 = "yes";
    }
    else {
      int v9 = "no";
    }
    if (self->_suppressAdvertisement) {
      int v10 = "yes";
    }
    else {
      int v10 = "no";
    }
    unsigned int v19 = v9;
    int v20 = v10;
    char v17 = v7;
    uint64_t v18 = v8;
    int64_t v15 = v5;
    id v16 = v6;
    uint64_t v13 = v3;
    int64_t v14 = v4;
    LogPrintF();
  }
  if (!self->_systemMonitorActivated || self->_prefAdvertisingDisabled) {
    goto LABEL_25;
  }
  unsigned int v11 = [(SDHotspotManager *)self->_hotspotManager isTetheringSupported];
  if (!v11) {
    return v11;
  }
  if ([(SDHotspotManager *)self->_hotspotManager maxConnectionsReached])
  {
LABEL_25:
    LOBYTE(v11) = 0;
  }
  else
  {
    if (self->_suppressAdvertisement)
    {
      unsigned int v11 = _os_feature_enabled_impl();
      if (!v11) {
        return v11;
      }
      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    LOBYTE(v11) = [(SDHotspotAgent *)self _idsTetheringClientDeviceCount] >= 1&& [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]|| [(SDHotspotAgent *)self _sysMonitorFamilyCount] > 0;
  }
  return v11;
}

- (unsigned)_nearbyNetworkTypeForHotspotNetworkType:(unsigned __int8)a3
{
  if (((a3 - 1) & 0xF8) != 0) {
    char v3 = 0;
  }
  else {
    char v3 = 0x706050004030201uLL >> (8 * (a3 - 1));
  }
  return v3 & 7;
}

- (void)hotspotManagerTetheringSupportChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000743E0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)_appMonitorAppList
{
  if (qword_10097FCB0 != -1) {
    dispatch_once(&qword_10097FCB0, &stru_1008CB638);
  }
  v2 = (void *)qword_10097FCA8;

  return v2;
}

- (void)_appMonitorEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  browserAppMonitor = self->_browserAppMonitor;
  if (!browserAppMonitor)
  {
    int64_t v4 = (BKSApplicationStateMonitor *)objc_opt_new();
    int64_t v5 = self->_browserAppMonitor;
    self->_browserAppMonitor = v4;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007460C;
    v6[3] = &unk_1008CB660;
    v6[4] = self;
    [(BKSApplicationStateMonitor *)self->_browserAppMonitor setHandler:v6];
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    browserAppMonitor = self->_browserAppMonitor;
  }
  [(BKSApplicationStateMonitor *)browserAppMonitor updateInterestedBundleIDs:self->_browserBundleIDs];
}

- (void)_appMonitorEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  browserAppMonitor = self->_browserAppMonitor;
  if (browserAppMonitor)
  {
    [(BKSApplicationStateMonitor *)browserAppMonitor invalidate];
    [(BKSApplicationStateMonitor *)self->_browserAppMonitor setHandler:0];
    int64_t v4 = self->_browserAppMonitor;
    self->_browserAppMonitor = 0;

    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_appMonitorUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(NSMutableArray *)self->_browserBundleIDs count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v3 = [(NSMutableDictionary *)self->_clientProxyMap allValues];
    id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          unsigned int v9 = [v8 browsing:v13, v14];
          if (v9)
          {
            int v10 = [v8 bundleID];
            if (!v10
              || ![(NSMutableArray *)self->_browserBundleIDs containsObject:v10])
            {

              goto LABEL_19;
            }
            id v11 = [(BKSApplicationStateMonitor *)self->_browserAppMonitor applicationStateForApplication:v10];
            if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
            {
              [(SDHotspotAgent *)self _appMonitorStringForState:v11];
              v14 = uint64_t v13 = v10;
              LogPrintF();
            }
            if (v11 == 8) {
              goto LABEL_19;
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_19:
      unsigned int v9 = 0;
    }

    int browserClientsInactive = self->_browserClientsInactive;
    self->_int browserClientsInactive = v9;
    if (browserClientsInactive != v9
      && dword_1009667F0 <= 50
      && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)_appMonitorStringForState:(unsigned int)a3
{
  if (a3 < 9 && ((0x117u >> a3) & 1) != 0)
  {
    char v3 = (void *)*((void *)&off_1008CB900 + (int)a3);
  }
  else
  {
    char v3 = +[NSString stringWithFormat:@"Unexpected (%ld)", a3];
  }

  return v3;
}

- (void)addClientID:(id)a3 proxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[NSXPCConnection currentConnection];
  unsigned int v9 = [v8 sd_connectionBundleID];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100074B38;
  v13[3] = &unk_1008CA770;
  v13[4] = self;
  id v14 = v6;
  long long v15 = v9;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(dispatchQueue, v13);
}

- (void)_addClientID:(id)a3 bundleID:(id)a4 proxy:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  id v10 = a5;
  dispatch_assert_queue_V2(dispatchQueue);
  id v11 = objc_opt_new();
  [v11 setBundleID:v8];
  [v11 setClientProxy:v10];

  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v17;
    id v16 = v8;
    LogPrintF();
  }
  clientProxyMap = self->_clientProxyMap;
  if (!clientProxyMap)
  {
    uint64_t v13 = (NSMutableDictionary *)objc_opt_new();
    id v14 = self->_clientProxyMap;
    self->_clientProxyMap = v13;

    clientProxyMap = self->_clientProxyMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](clientProxyMap, "setObject:forKeyedSubscript:", v11, v17, v15, v16);
}

- (void)removeClientID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100074D10;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_removeClientID:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [(NSMutableDictionary *)self->_clientProxyMap objectForKeyedSubscript:v8];
  if (v4)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v7 = [v4 bundleID];
      LogPrintF();

      -[NSMutableDictionary removeObjectForKey:](self->_clientProxyMap, "removeObjectForKey:", v8, v8, v7);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_clientProxyMap, "removeObjectForKey:", v8, v5, v6);
    }
  }
}

- (void)startBrowsing
{
  char v3 = +[NSXPCConnection currentConnection];
  id v4 = [v3 userInfo];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"SDConnectionManagerIdentifier"];
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = [v5 UUIDString];
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074F50;
  block[3] = &unk_1008CA640;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)_startBrowsingForClientID:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDStatusMonitor *)self->_statusMonitor deviceSupportsContinuity])
  {
    id v4 = [(NSMutableDictionary *)self->_clientProxyMap objectForKeyedSubscript:v13];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 setBrowsing:1];
      uint64_t v6 = [v5 bundleID];
      if (v6)
      {
        id v7 = [(SDHotspotAgent *)self _appMonitorAppList];
        unsigned __int8 v8 = [v7 containsObject:v6];

        if (v8)
        {
          browserBundleIDs = self->_browserBundleIDs;
          if (!browserBundleIDs)
          {
            id v10 = (NSMutableArray *)objc_opt_new();
            id v11 = self->_browserBundleIDs;
            self->_browserBundleIDs = v10;

            browserBundleIDs = self->_browserBundleIDs;
          }
          [(NSMutableArray *)browserBundleIDs addObject:v6];
          [(SDHotspotAgent *)self _appMonitorEnsureStarted];
        }
      }

      if (dword_1009667F0 < 51 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
      {
        id v12 = [v5 bundleID];
        LogPrintF();
      }
      if ([(NSMutableDictionary *)self->_devices count] && !self->_prefRapportDisabled)
      {
        if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(SDHotspotAgent *)self _discoveryUpdateCombined:1];
      }
      self->_browserActive = 1;
      [(SDHotspotAgent *)self _update];
    }
    else if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_1009667F0 <= 60 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stopBrowsing
{
  char v3 = +[NSXPCConnection currentConnection];
  id v5 = [v3 userInfo];

  id v4 = [v5 objectForKeyedSubscript:@"SDConnectionManagerIdentifier"];
  [(SDHotspotAgent *)self stopBrowsingForClientID:v4];
}

- (void)stopBrowsingForClientID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007530C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_stopBrowsingForClientID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDStatusMonitor *)self->_statusMonitor deviceSupportsContinuity])
  {
    id v5 = [(NSMutableDictionary *)self->_clientProxyMap objectForKeyedSubscript:v4];
    [v5 setBrowsing:0];
    id v6 = [v5 bundleID];
    if (v6) {
      [(NSMutableArray *)self->_browserBundleIDs removeObject:v6];
    }

    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = [v5 bundleID];
      LogPrintF();
    }
    if ([(NSMutableArray *)self->_browserBundleIDs count])
    {
      [(SDHotspotAgent *)self _appMonitorEnsureStarted];
      [(SDHotspotAgent *)self _appMonitorUpdate];
    }
    else
    {
      [(SDHotspotAgent *)self _appMonitorEnsureStopped];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    devicesLegacy = [(NSMutableDictionary *)self->_clientProxyMap allValues];
    id v8 = [devicesLegacy countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_16:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(devicesLegacy);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v11) browsing]) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [devicesLegacy countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:

      if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_browserActive = 0;
      self->_int browserClientsInactive = 0;
      devicesCombined = self->_devicesCombined;
      self->_devicesCombined = 0;

      devicesLegacy = self->_devicesLegacy;
      self->_devicesLegacy = 0;
    }

    [(SDHotspotAgent *)self _update];
  }
  else if (dword_1009667F0 <= 60 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000756A0;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = arc4random();
  id v8 = [(SDHotspotAgent *)self _logCategoryCreateWithLabel:@"TetheringAgent" sessionID:v7];
  id v9 = objc_opt_new();
  [v9 setRequestType:1];
  [v9 setHotspotDevice:v20];
  [v9 setHotspotInfoHandler:v6];
  [v9 setLogCategory:v8];
  [v9 setSessionID:v7];
  id v10 = [v20 group];
  unsigned int v11 = [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable];
  if (v8->var0 <= 50 && (v8->var0 != -1 || _LogCategory_Initialize()))
  {
    id v12 = "no";
    if (v10 == (id)2) {
      id v13 = "yes";
    }
    else {
      id v13 = "no";
    }
    if (v11) {
      id v12 = "yes";
    }
    long long v18 = v12;
    id v19 = v20;
    long long v17 = v13;
    LogPrintF();
  }
  unsigned int v14 = [v20 supportsCompanionLink:v17, v18, v19];
  if (v10 == (id)2) {
    int v15 = 1;
  }
  else {
    int v15 = v11;
  }
  int var0 = v8->var0;
  if (v14 && v15)
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDHotspotAgent *)self _companionLinkActivateWithRequest:v9];
  }
  else
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDHotspotBrowser *)self->_hotspotBrowser enableHotspotForDevice:v20 withCompletionHandler:v6];
  }
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (_os_feature_enabled_impl())
  {
    dispatchQueue = self->_dispatchQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000759EC;
    v12[3] = &unk_1008CB6B0;
    v12[4] = self;
    BOOL v15 = a4;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(dispatchQueue, v12);
  }
  else
  {
    unsigned int v11 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

- (void)_additionalInfoForRequest:(id)a3 toMessage:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  if (((unint64_t)[v22 requestType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v6 = [v22 trafficFilterParams];
    uint64_t v7 = [v6 srcIPAddress];
    [v5 setObject:v7 forKeyedSubscript:@"tfsIP"];

    id v8 = [v22 trafficFilterParams];
    id v9 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v8 srcPort]);
    [v5 setObject:v9 forKeyedSubscript:@"tfsPrt"];

    id v10 = [v22 trafficFilterParams];
    unsigned int v11 = [v10 destIPAddress];
    [v5 setObject:v11 forKeyedSubscript:@"tfdIP"];

    id v12 = [v22 trafficFilterParams];
    id v13 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v12 destPort]);
    [v5 setObject:v13 forKeyedSubscript:@"tfdPrt"];

    id v14 = [v22 trafficFilterParams];
    BOOL v15 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v14 ipProtocol]);
    [v5 setObject:v15 forKeyedSubscript:@"tfPro"];

    long long v16 = [v22 trafficFilterParams];
    long long v17 = [v16 trafficClass];
    [v5 setObject:v17 forKeyedSubscript:@"tfTC"];

    long long v18 = [v22 trafficFilterParams];
    id v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v18 ipVersion]);
    [v5 setObject:v19 forKeyedSubscript:@"tfIPv"];

    id v20 = [v22 trafficFilterParams];
    uint64_t v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 idleTimeout]);
    [v5 setObject:v21 forKeyedSubscript:@"tfTO"];
  }
}

- (void)_companionLinkEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDHotspotAgent *)self _companionLinkFamilySupported]) {
    uint64_t v3 = 4098;
  }
  else {
    uint64_t v3 = 2;
  }
  companionLinkClient = self->_companionLinkClient;
  if (!companionLinkClient) {
    goto LABEL_12;
  }
  if ([(RPCompanionLinkClient *)companionLinkClient controlFlags] != (id)v3)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = [(RPCompanionLinkClient *)self->_companionLinkClient controlFlags];
      LogPrintF();
      -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", v3, v8, &unk_10076DC38, v3, &unk_10076DC38);
    }
    else
    {
      -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", v3, v7, v9, v10, v11);
    }
  }
  if (!self->_companionLinkClient)
  {
LABEL_12:
    id v5 = (RPCompanionLinkClient *)objc_opt_new();
    id v6 = self->_companionLinkClient;
    self->_companionLinkClient = v5;

    [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:self->_dispatchQueue];
    [(RPCompanionLinkClient *)self->_companionLinkClient setControlFlags:v3];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100076108;
    v14[3] = &unk_1008CA828;
    v14[4] = self;
    [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceFoundHandler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000761B4;
    v13[3] = &unk_1008CA850;
    v13[4] = self;
    [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceChangedHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100076260;
    v12[3] = &unk_1008CA828;
    v12[4] = self;
    [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceLostHandler:v12];
    [(RPCompanionLinkClient *)self->_companionLinkClient setInterruptionHandler:&stru_1008CB6D0];
    [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:&stru_1008CB6F0];
    [(RPCompanionLinkClient *)self->_companionLinkClient activateWithCompletion:&stru_1008CB710];
  }
}

- (void)_companionLinkEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_companionLinkClient)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkClient *)self->_companionLinkClient setInterruptionHandler:0];
    [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:0];
    [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
    companionLinkClient = self->_companionLinkClient;
    self->_companionLinkClient = 0;

    devices = self->_devices;
    self->_devices = 0;
  }
}

- (BOOL)_companionLinkShouldStart
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 40 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    if (self->_prefLegacyDisabled) {
      uint64_t v3 = "yes";
    }
    else {
      uint64_t v3 = "no";
    }
    int64_t v4 = [(SDHotspotAgent *)self _idsTetheringHostDeviceCount];
    int64_t v5 = [(SDHotspotAgent *)self _sysMonitorFamilyCount];
    if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    if (self->_browserActive) {
      uint64_t v7 = "yes";
    }
    else {
      uint64_t v7 = "no";
    }
    if (self->_systemMonitorActivated) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (self->_browserClientsInactive) {
      uint64_t v9 = "yes";
    }
    else {
      uint64_t v9 = "no";
    }
    long long v18 = v8;
    id v19 = v9;
    long long v16 = v6;
    long long v17 = v7;
    int64_t v14 = v4;
    int64_t v15 = v5;
    id v13 = v3;
    LogPrintF();
  }
  if (self->_systemMonitorActivated && !self->_prefRapportDisabled)
  {
    if ([(SDHotspotAgent *)self _idsTetheringHostDeviceCount] >= 1
      && [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]
      || [(SDHotspotAgent *)self _sysMonitorFamilyCount] > 0)
    {
      return 1;
    }
    if ([(SDHotspotManager *)self->_hotspotManager isTetheringSupported])
    {
      id v12 = [(SDHotspotAgent *)self _idsDeviceArray];
      BOOL v10 = [v12 count] != 0;

      return v10;
    }
  }
  return 0;
}

- (BOOL)_companionLinkFamilySupported
{
  return self->_browserActive && !self->_browserClientsInactive;
}

- (void)_companionLinkActivateWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t v5 = [v4 hotspotDevice];
  id v6 = (int *)[v4 logCategory];
  uint64_t v7 = [v5 deviceIdentifier];
  if (v7)
  {
    uint64_t v21 = v6;
    id v22 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [(RPCompanionLinkClient *)self->_companionLinkClient activeDevices];
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        int64_t v14 = [v13 identifier];
        unsigned __int8 v15 = [v14 isEqualToString:v7];

        if (v15) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v16 = v13;

      if (!v16) {
        goto LABEL_15;
      }
      int64_t v5 = v22;
      if (*v21 <= 50 && (*v21 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      long long v18 = (void (**)(void, void, void))objc_opt_new();
      [v18 setAppID:@"com.sharing.hotspot"];
      [v18 setControlFlags:6291712];
      [v18 setDestinationDevice:v16];
      [v18 setDispatchQueue:self->_dispatchQueue];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100076BB4;
      v29[3] = &unk_1008CA4B8;
      v29[4] = v22;
      [v18 setInterruptionHandler:v29];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100076C34;
      v28[3] = &unk_1008CA4B8;
      v28[4] = v22;
      [v18 setInvalidationHandler:v28];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100076CB4;
      v23[3] = &unk_1008CB738;
      BOOL v27 = v21;
      v23[4] = v22;
      id v20 = v4;
      id v24 = v20;
      id v25 = v16;
      uint64_t v26 = self;
      id v17 = v16;
      [v18 activateWithCompletion:v23];
      [v20 setCompanionLinkClient:v18];
    }
    else
    {
LABEL_10:

LABEL_15:
      int64_t v5 = v22;
      if (*v21 <= 90 && (*v21 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      NSErrorWithOSStatusF();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      long long v18 = [v4 hotspotInfoHandler];
      ((void (**)(void, void, id))v18)[2](v18, 0, v17);
    }
  }
  else
  {
    if (*v6 <= 90 && (*v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [v4 hotspotInfoHandler];
    ((void (**)(void, void, id))v19)[2](v19, 0, v17);
  }
}

- (void)_companionLinkActivatedRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t v5 = [v4 companionLinkClient];
  id v6 = [v5 destinationDevice];
  unsigned __int16 v7 = (unsigned __int16)[v6 statusFlags];

  id v8 = SFDeviceProductVersion();
  id v9 = objc_opt_new();
  id v10 = [(SDStatusMonitor *)self->_statusMonitor myAltDSID];
  [v9 setObject:v10 forKeyedSubscript:@"altDSID"];

  uint64_t v11 = [(SDStatusMonitor *)self->_statusMonitor myAppleID];
  [v9 setObject:v11 forKeyedSubscript:@"aplID"];

  uint64_t v12 = [(SDStatusMonitor *)self->_statusMonitor computerName];
  [v9 setObject:v12 forKeyedSubscript:@"devnm"];

  id v13 = +[NSNumber numberWithInt:(v7 & 0x4000) == 0];
  [v9 setObject:v13 forKeyedSubscript:@"icld"];

  int64_t v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 sessionID]);
  [v9 setObject:v14 forKeyedSubscript:@"sID"];

  unsigned __int8 v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 requestType]);
  [v9 setObject:v15 forKeyedSubscript:@"reqT"];

  if (v8 && ([v8 isEqualToString:@"?"] & 1) == 0) {
    [v9 setObject:v8 forKeyedSubscript:@"proVer"];
  }
  if ([v4 requestType] == (id)2 || objc_msgSend(v4, "requestType") == (id)3) {
    [(SDHotspotAgent *)self _additionalInfoForRequest:v4 toMessage:v9];
  }
  id v16 = objc_opt_new();
  [v16 setObject:&off_100902700 forKeyedSubscript:RPOptionTimeoutSeconds];
  if (*(int *)[v4 logCategory] <= 50)
  {
    if (*(_DWORD *)[v4 logCategory] != -1
      || ([v4 logCategory], _LogCategory_Initialize()))
    {
      [v4 logCategory];
      LogPrintF();
    }
  }
  uint64_t v17 = RPDestinationIdentifierDirectPeer;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100077104;
  v19[3] = &unk_1008CB760;
  v19[4] = self;
  id v20 = v4;
  id v18 = v4;
  [v5 sendRequestID:@"com.sharing.hotspot.request" request:v9 destinationID:v17 options:v16 responseHandler:v19];
}

- (void)_companionLinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v63 = 0;
  uint64_t v11 = [(SDHotspotAgent *)self _logCategoryCreateWithLabel:@"TetheringAgent", CFDictionaryGetInt64Ranged(), v40 sessionID];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100077A04;
  v60[3] = &unk_1008CB788;
  v62 = v11;
  id v12 = v10;
  id v61 = v12;
  id v13 = objc_retainBlock(v60);
  if (v11->var0 <= 50 && (v11->var0 != -1 || _LogCategory_Initialize()))
  {
    id v41 = v8;
    LogPrintF();
  }
  int64_t v14 = [v8 objectForKeyedSubscript:@"reqT" :v41];
  unsigned __int8 v15 = v14;
  if (!v14 || (unint64_t v16 = (unint64_t)[v14 integerValue], (v16 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    uint64_t v17 = [v8 objectForKeyedSubscript:@"devnm"];
    if (!v17)
    {
      if (v11->var0 <= 90 && (v11->var0 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v42 = @"Request missing name";
        LogPrintF();
      }
      @"Request missing name".UTF8String;
      id v18 = NSErrorWithOSStatusF();
      ((void (*)(void *, void, void, void *))v13[2])(v13, 0, 0, v18);
      goto LABEL_68;
    }
    id v18 = [v8 objectForKeyedSubscript:@"icld"];
    if (!v18)
    {
      if (v11->var0 <= 90 && (v11->var0 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v42 = @"Request missing same iCloud state";
        LogPrintF();
      }
      @"Request missing same iCloud state".UTF8String;
      v23 = NSErrorWithOSStatusF();
      ((void (*)(void *, void, void, void *))v13[2])(v13, 0, 0, v23);
      goto LABEL_67;
    }
    char v49 = v17;
    uint64_t v19 = off_100966860();
    id v20 = (void *)v19;
    if (v19) {
      CFStringRef v21 = (const __CFString *)v19;
    }
    else {
      CFStringRef v21 = @"senderModelID";
    }
    uint64_t v22 = [v9 objectForKeyedSubscript:v21];

    if (v22)
    {
      unsigned int CanConnectOn5GHz = SFRemoteDeviceCanConnectOn5GHz();
    }
    else
    {
      if (v11->var0 <= 40 && (v11->var0 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v42 = @"Request option missing sender device's modelID";
        LogPrintF();
      }
      unsigned int CanConnectOn5GHz = 0;
    }
    v48 = (void *)v22;
    v52 = [v8 objectForKeyedSubscript:@"proVer" v42];
    if (!v52 && v11->var0 <= 40 && (v11->var0 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v43 = @"Request option missing sender device's product version";
      LogPrintF();
    }
    unsigned int v24 = [v18 BOOLValue:v43];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"altDSID"];
    uint64_t v26 = [v8 objectForKeyedSubscript:@"aplID"];
    v53 = (void *)v26;
    if (v25)
    {
      BOOL v27 = [(SDHotspotAgent *)self _sysMonitorFamilyMemberForAltDSID:v25];
    }
    else if (v26)
    {
      BOOL v27 = [(SDHotspotAgent *)self _sysMonitorFamilyMemberForAppleID:v26];
    }
    else
    {
      BOOL v27 = 0;
    }
    if (v27) {
      char v28 = 1;
    }
    else {
      char v28 = v24;
    }
    int v50 = (void *)v25;
    v51 = v27;
    if (v28)
    {
      id v46 = v9;
      statusMonitor = self->_statusMonitor;
      long long v30 = [v27 altDSID];
      unint64_t v31 = [(SDStatusMonitor *)statusMonitor familyHotspotStateForAltDSID:v30];

      if (v11->var0 <= 50 && (v11->var0 != -1 || _LogCategory_Initialize()))
      {
        id v9 = v46;
        if (v24)
        {
          uint64_t v44 = @"iCloud";
          LogPrintF();
LABEL_64:
          v23 = v48;
          -[SDHotspotAgent _companionLinkStartTetheringWithResponse:logCategory:modelID:productVersion:canConnectOn5GHz:](self, "_companionLinkStartTetheringWithResponse:logCategory:modelID:productVersion:canConnectOn5GHz:", v13, v11, v48, v52, CanConnectOn5GHz, v44);
LABEL_65:
          uint64_t v17 = v49;
          goto LABEL_66;
        }
        uint64_t v35 = [v51 firstName];
        if (v31 > 2) {
          unsigned int v36 = "?";
        }
        else {
          unsigned int v36 = off_1008CB948[v31];
        }
        int v45 = (void *)v35;
        uint64_t v44 = +[NSString stringWithFormat:@"Family ('%@') - %s", v35, v36];
        LogPrintF();
      }
      if (v31 == 2) {
        int v37 = 1;
      }
      else {
        int v37 = v24;
      }
      id v9 = v46;
      if (v37 == 1) {
        goto LABEL_64;
      }
      if (v31 != -1)
      {
        if (v31)
        {
          BOOL v38 = v31 == 1;
          v23 = v48;
          uint64_t v17 = v49;
          if (v38)
          {
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_100077AA0;
            v54[3] = &unk_1008CB7B0;
            v57 = v13;
            v58 = v11;
            v54[4] = self;
            id v55 = v48;
            id v56 = v52;
            char v59 = CanConnectOn5GHz;
            [(SDHotspotAgent *)self _userAlertForMember:v51 logCategory:v11 completion:v54];
          }
          goto LABEL_66;
        }
        v23 = v48;
        if (v11->var0 <= 90 && (v11->var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v39 = NSErrorWithOSStatusF();
        ((void (*)(void *, void, void, void *))v13[2])(v13, 0, 0, v39);

        goto LABEL_65;
      }
      if (v11->var0 <= 90 && (v11->var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      NSErrorWithOSStatusF();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      ((void (*)(void *, void, void, id))v13[2])(v13, 0, 0, v33);
    }
    else
    {
      long long v32 = +[NSString stringWithFormat:@"Family member missing (%@<%@>)", v53, v25];
      if (v11->var0 <= 90 && (v11->var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v33 = v32;
      [v33 UTF8String];
      uint64_t v34 = NSErrorWithOSStatusF();
      ((void (*)(void *, void, void, void *))v13[2])(v13, 0, 0, v34);
    }
    v23 = v48;
    uint64_t v17 = v49;
LABEL_66:

LABEL_67:
LABEL_68:

    goto LABEL_69;
  }
  [(SDHotspotAgent *)self _companionLinkHandleLowLatencyFilterRequestOfType:v16 request:v8 options:v9 responseHandler:v12];
LABEL_69:
}

- (void)_companionLinkHandleResponse:(id)a3 request:(id)a4 error:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v20)
  {
    id v10 = [v20 objectForKeyedSubscript:@"name"];
    uint64_t v11 = [v20 objectForKeyedSubscript:@"pass"];
    id v12 = [v20 objectForKeyedSubscript:@"chan"];
    id v13 = [objc_alloc((Class)SFRemoteHotspotInfo) initWithName:v10 password:v11 channel:v12];
    if (*(int *)[v8 logCategory] <= 50)
    {
      if (*(_DWORD *)[v8 logCategory] != -1
        || ([v8 logCategory], _LogCategory_Initialize()))
      {
        [v8 logCategory];
        id v19 = v13;
        LogPrintF();
      }
    }
    [v8 hotspotInfoHandler:v19];
    int64_t v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v14)[2](v14, v13, 0);

    unsigned __int8 v15 = [v8 companionLinkClient];
    unint64_t v16 = [v15 destinationDevice];
    uint64_t v17 = [v16 identifier];
    hotspotDeviceIdentifier = self->_hotspotDeviceIdentifier;
    self->_hotspotDeviceIdentifier = v17;

    if (*(int *)[v8 logCategory] <= 50)
    {
      if (*(_DWORD *)[v8 logCategory] != -1
        || ([v8 logCategory], _LogCategory_Initialize()))
      {
        [v8 logCategory];
        LogPrintF();
      }
    }
  }
  else
  {
    if (*(int *)[v8 logCategory] <= 90)
    {
      if (*(_DWORD *)[v8 logCategory] != -1
        || ([v8 logCategory], _LogCategory_Initialize()))
      {
        [v8 logCategory];
        id v19 = v9;
        LogPrintF();
      }
    }
    [v8 hotspotInfoHandler:v19];
    id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v10)[2](v10, 0, v9);
  }
}

- (BOOL)_fillXpcDictionaryDescriptor:(id)a3 descriptor:(id)a4 metaData:(id)a5
{
  xpc_object_t xdict = a4;
  id v7 = a5;
  id v8 = a3;
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  id v10 = NSDictionaryGetNSNumber();
  CFStringGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue();
  id v12 = NSDictionaryGetNSNumber();
  id v13 = NSDictionaryGetNSNumber();
  int64_t v14 = NSDictionaryGetNSNumber();
  unsigned __int8 v15 = NSDictionaryGetNSNumber();

  if (v9) {
    BOOL v16 = v10 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v20 = v16 || v11 == 0 || v12 == 0 || v13 == 0 || v14 == 0;
  char v21 = v20;
  if (v20)
  {
    if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    xpc_dictionary_set_string(v7, netrbClientIfnetTrafficDescriptorLocalIp, (const char *)[v9 UTF8String]);
    xpc_dictionary_set_string(v7, netrbClientIfnetTrafficDescriptorRemoteIp, (const char *)[v11 UTF8String]);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorLocalPort, (int)[v10 intValue]);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorRemotePort, (int)[v12 intValue]);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorDeviceId, 0);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorIpProtocol, (int)[v13 intValue]);
    xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorIpVersion, (int)[v14 intValue]);
    if (v15 && [v15 intValue]) {
      xpc_dictionary_set_uint64(v7, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout, (int)[v15 intValue]);
    }
    xpc_dictionary_set_value(xdict, netrbClientLowLatencyFlowParam, v7);
  }

  return v21 ^ 1;
}

- (void)_companionLinkHandleLowLatencyFilterRequestOfType:(int64_t)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007838C;
  v17[3] = &unk_1008CB7D8;
  id v12 = a6;
  id v18 = 0;
  id v19 = v12;
  id v13 = objc_retainBlock(v17);
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if ([(SDHotspotAgent *)self _fillXpcDictionaryDescriptor:v10 descriptor:v14 metaData:v15])
  {
    if (_NETRBClientCreate())
    {
      if (a3 == 2) {
        char v16 = _NETRBClientAddLowLatencyFlow();
      }
      else {
        char v16 = _NETRBClientRemoveLowLatencyFlow();
      }
      if (v16)
      {
        if (dword_1009667F0 > 40 || dword_1009667F0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_25;
        }
      }
      else if (dword_1009667F0 > 90 || dword_1009667F0 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
      LogPrintF();
LABEL_25:
      _NETRBClientDestroy();
      goto LABEL_26;
    }
    if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_26:

  ((void (*)(void *))v13[2])(v13);
}

- (void)_companionLinkStartTetheringWithResponse:(id)a3 logCategory:(LogCategory *)a4 modelID:(id)a5 productVersion:(id)a6 canConnectOn5GHz:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000784DC;
  v17[3] = &unk_1008CB828;
  id v18 = v12;
  id v19 = a4;
  void v17[4] = self;
  id v15 = v12;
  char v16 = objc_retainBlock(v17);
  [(SDHotspotManager *)self->_hotspotManager startTetheringWithCompletionHandler:v16 modelID:v13 productVersion:v14 canConnectOn5GHz:v7];
}

- (void)_discoveryDeviceFound:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v17 hotspotInfo];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v17 identifier];
    if (v6)
    {
      unint64_t v7 = (unint64_t)[v17 statusFlags] & 0x80000;
      unsigned __int16 v8 = (unsigned __int16)[v17 statusFlags];
      if (v7 | v8 & 0x4000)
      {
        if ((v5 & 0x80) != 0 || (v8 & 0x4000) == 0)
        {
          id v9 = objc_opt_new();
          [v9 setDeviceIdentifier:v6];
          id v10 = [v17 name];
          [v9 setDeviceName:v10];

          [v9 setGroup:-[SDHotspotAgent _discoveryGroupForDevice:](self, "_discoveryGroupForDevice:", v17)];
          id v11 = [v17 model];
          [v9 setModel:v11];

          [v9 setOsSupportsAutoHotspot:1];
          [v9 setSupportsCompanionLink:1];
          [v9 updateWithHotspotInfo:v5];
          if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
          {
            id v16 = v17;
            LogPrintF();
          }
          devices = self->_devices;
          if (!devices)
          {
            id v13 = (NSMutableDictionary *)objc_opt_new();
            id v14 = self->_devices;
            self->_devices = v13;

            devices = self->_devices;
          }
          id v15 = [v9 deviceIdentifier:v16];
          [(NSMutableDictionary *)devices setObject:v9 forKeyedSubscript:v15];

          [(SDHotspotAgent *)self _discoveryUpdateCombined:0];
          goto LABEL_33;
        }
        if (dword_1009667F0 > 50 || dword_1009667F0 == -1 && !_LogCategory_Initialize())
        {
LABEL_33:

          goto LABEL_34;
        }
      }
      else if (dword_1009667F0 > 90 || dword_1009667F0 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_33;
      }
    }
    else if (dword_1009667F0 > 90 || dword_1009667F0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_33;
    }
    LogPrintF();
    goto LABEL_33;
  }
  if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_34:
}

- (void)_discoveryDeviceChanged:(id)a3
{
  id v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v16 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    id v6 = [v16 hotspotInfo];
    if (([v16 statusFlags] & 0x80000) != 0)
    {
      unsigned int v7 = 1;
      if (!v6) {
        goto LABEL_14;
      }
    }
    else
    {
      unsigned int v7 = ([v16 statusFlags] >> 14) & ((v6 & 0x80) >> 7);
      if (!v6) {
        goto LABEL_14;
      }
    }
    if (v7)
    {
      unsigned __int16 v8 = objc_opt_new();
      [v8 setDeviceIdentifier:v4];
      id v9 = [v16 name];
      [v8 setDeviceName:v9];

      [v8 setGroup:-[SDHotspotAgent _discoveryGroupForDevice:](self, "_discoveryGroupForDevice:", v16)];
      id v10 = [v16 model];
      [v8 setModel:v10];

      [v8 setOsSupportsAutoHotspot:1];
      [v8 setSupportsCompanionLink:1];
      [v8 updateWithHotspotInfo:v6];
      if (([v8 componentsAreEqualTo:v5] & 1) == 0)
      {
        if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
        {
          id v14 = v16;
          LogPrintF();
        }
        devices = self->_devices;
        if (!devices)
        {
          id v12 = (NSMutableDictionary *)objc_opt_new();
          id v13 = self->_devices;
          self->_devices = v12;

          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v8, v4, v14);
        [(SDHotspotAgent *)self _discoveryUpdateCombined:0];
      }

      goto LABEL_38;
    }
LABEL_14:
    if (!v5)
    {
LABEL_38:

      goto LABEL_39;
    }
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      id v14 = v16;
      LogPrintF();
    }
    if (((unsigned __int16)objc_msgSend(v16, "statusFlags", v14) & 0x4000) == 0 || (v6 & 0x80) != 0)
    {
      if (dword_1009667F0 > 50 || dword_1009667F0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_37;
      }
    }
    else if (dword_1009667F0 > 50 || dword_1009667F0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_37;
    }
    id v15 = v5;
    LogPrintF();
LABEL_37:
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v15);
    [(SDHotspotAgent *)self _discoveryUpdateCombined:0];
    goto LABEL_38;
  }
  if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_39:
}

- (void)_discoveryDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v7 identifier];
  if (!v4)
  {
    if (dword_1009667F0 > 90 || dword_1009667F0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_14;
  }
  id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];

  if (!v5)
  {
    if (dword_1009667F0 > 30 || dword_1009667F0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    id v6 = v7;
    LogPrintF();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v6);
  [(SDHotspotAgent *)self _discoveryUpdateCombined:0];
LABEL_14:
}

- (void)_discoveryUpdateClients
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  clientProxyMap = self->_clientProxyMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100079058;
  v4[3] = &unk_1008CB850;
  v4[4] = self;
  [(NSMutableDictionary *)clientProxyMap enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_discoveryUpdateCombined:(BOOL)a3
{
  BOOL v28 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = objc_opt_new();
  devices = self->_devices;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007957C;
  v37[3] = &unk_1008CB878;
  v37[4] = self;
  void v37[5] = v4;
  [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v37];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = self->_devicesLegacy;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = [v11 deviceIdentifier:v27];
        if (v12)
        {
          id v13 = [(SDHotspotAgent *)self _idsDeviceIDForBluetoothID:v12];
          if (v13)
          {
            id v14 = [v4 objectForKeyedSubscript:v13];

            if (!v14) {
              [v4 setObject:v11 forKeyedSubscript:v13];
            }
          }
          else if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
          {
            BOOL v27 = v11;
            LogPrintF();
          }
        }
        else if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
        {
          BOOL v27 = v11;
          LogPrintF();
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  id v15 = [(NSMutableDictionary *)self->_devicesCombined count];
  if (v15 == [v4 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = [v4 allValues];
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          uint64_t v22 = [v21 deviceIdentifier:v27];
          v23 = [(NSMutableDictionary *)self->_devicesCombined objectForKeyedSubscript:v22];
          if (!v23)
          {

LABEL_36:
            int v26 = 1;
            goto LABEL_37;
          }
          unsigned int v24 = v23;
          unsigned int v25 = [v23 componentsAreEqualTo:v21];

          if (!v25) {
            goto LABEL_36;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
        int v26 = 0;
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v26 = 0;
    }
LABEL_37:
  }
  else
  {
    int v26 = 1;
  }
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)self->_clientProxyMap count];
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_devicesCombined, v4);
  if ((v26 | v28) == 1) {
    [(SDHotspotAgent *)self _discoveryUpdateClients];
  }
}

- (void)_discoveryUpdateLegacyDeviceList:(id)a3
{
  id v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  devicesLegacy = self->_devicesLegacy;
  self->_devicesLegacy = v4;

  [(SDHotspotAgent *)self _discoveryUpdateCombined:0];
}

- (void)updatedFoundDeviceList:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100079744;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_discoveryCellularSlicingStateUpdateFor:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000797E8;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (int64_t)_discoveryGroupForDevice:(id)a3
{
  id v3 = a3;
  if (([v3 statusFlags] & 0x80000) != 0) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = ((unint64_t)[v3 statusFlags] >> 13) & 2;
  }

  return v4;
}

- (void)_idsEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_idsService)
  {
    id v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.tethering"];
    idsService = self->_idsService;
    self->_idsService = v3;

    [(IDSService *)self->_idsService addDelegate:self queue:self->_dispatchQueue];
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_idsEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsDeviceArray = self->_idsDeviceArray;
  self->_idsDeviceArray = 0;

  idsService = self->_idsService;
  if (idsService)
  {
    [(IDSService *)idsService removeDelegate:self];
    id v5 = self->_idsService;
    self->_idsService = 0;

    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)_idsDeviceArray
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsDeviceArray = self->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unint64_t v4 = [(IDSService *)self->_idsService devices];
    id v5 = self->_idsDeviceArray;
    self->_idsDeviceArray = v4;

    idsDeviceArray = self->_idsDeviceArray;
  }

  return idsDeviceArray;
}

- (id)_idsDeviceIDForBluetoothID:(id)a3
{
  id v4 = a3;
  idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  if (!idsDeviceBTDictionary)
  {
    id v6 = (NSDictionary *)objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [v12 nsuuid];
          if (v13)
          {
            id v14 = [v12 uniqueIDOverride];
            id v15 = [v13 UUIDString];
            [(NSDictionary *)v6 setObject:v14 forKeyedSubscript:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v16 = self->_idsDeviceBTDictionary;
    self->_idsDeviceBTDictionary = v6;

    idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  }
  id v17 = [(NSDictionary *)idsDeviceBTDictionary objectForKeyedSubscript:v4];

  return v17;
}

- (int64_t)_idsLegacyClientDeviceCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t result = self->_idsLegacyClientDeviceCount;
  if (result < 0)
  {
    self->_idsLegacyClientDeviceCount = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v5) {
      goto LABEL_28;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (1)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v8);
        uint64_t v10 = [v9 modelIdentifier:v14];
        id v11 = [v10 lowercaseString];

        if (v11)
        {
          if ([v11 containsString:@"mac"])
          {
            if (!v9)
            {
              uint64_t v18 = 0;
              uint64_t v19 = 0;
              id v12 = (uint64_t *)&v16;
              uint64_t v20 = 0;
LABEL_21:
              *id v12 = 0;
              v12[1] = 0;
              v12[2] = 0;
LABEL_22:
              ++self->_idsLegacyClientDeviceCount;
              goto LABEL_23;
            }
            [v9 operatingSystemVersion];
            if (v18 < 11)
            {
              [v9 operatingSystemVersion];
              if (v17 < 15) {
                goto LABEL_22;
              }
            }
          }
          if (([v11 containsString:@"iphone"] & 1) != 0
            || [v11 containsString:@"ipad"])
          {
            id v12 = &v15;
            if (!v9) {
              goto LABEL_21;
            }
            [v9 operatingSystemVersion];
            if (v15 < 13) {
              goto LABEL_22;
            }
          }
        }
        else if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
        {
          id v14 = v9;
          LogPrintF();
        }
LABEL_23:

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v13 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v6 = v13;
      if (!v13)
      {
LABEL_28:

        return self->_idsLegacyClientDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsLegacyHostDeviceCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t result = self->_idsLegacyHostDeviceCount;
  if (result < 0)
  {
    self->_int64_t idsLegacyHostDeviceCount = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 supportsTethering])
        {
          if (!v9)
          {
            uint64_t v10 = 0;
LABEL_12:
            ++self->_idsLegacyHostDeviceCount;
            continue;
          }
          [v9 operatingSystemVersion];
          if (v10 <= 12) {
            goto LABEL_12;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v6)
      {
LABEL_15:

        return self->_idsLegacyHostDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsTetheringClientDeviceCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t result = self->_idsTetheringClientDeviceCount;
  if (result < 0)
  {
    self->_idsTetheringClientDeviceCount = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v5) {
      goto LABEL_34;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (1)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v8);
        uint64_t v10 = [v9 modelIdentifier:v13];
        long long v11 = [v10 lowercaseString];

        if (v11)
        {
          if ([v11 containsString:@"mac"])
          {
            if (v9)
            {
              [v9 operatingSystemVersion];
              if (v17 > 14) {
                goto LABEL_28;
              }
              [v9 operatingSystemVersion];
              if (v16 > 10) {
                goto LABEL_28;
              }
            }
            else
            {
              uint64_t v17 = 0;
              uint64_t v16 = 0;
            }
          }
          if (([v11 containsString:@"iphone"] & 1) != 0
            || [v11 containsString:@"ipad"])
          {
            if (v9)
            {
              [v9 operatingSystemVersion];
              if (v15 <= 12) {
                goto LABEL_21;
              }
LABEL_28:
              ++self->_idsTetheringClientDeviceCount;
              goto LABEL_29;
            }
            uint64_t v15 = 0;
            if ([v11 containsString:@"watch"]) {
LABEL_26:
            }
              uint64_t v14 = 0;
          }
          else
          {
LABEL_21:
            if ([v11 containsString:@"watch"])
            {
              if (!v9) {
                goto LABEL_26;
              }
              [v9 operatingSystemVersion];
              if (v14 > 5) {
                goto LABEL_28;
              }
            }
          }
          if (![v11 containsString:@"realitydevice"]) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        if (dword_1009667F0 <= 90 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
        {
          long long v13 = v9;
          LogPrintF();
        }
LABEL_29:

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v12 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v6 = v12;
      if (!v12)
      {
LABEL_34:

        return self->_idsTetheringClientDeviceCount;
      }
    }
  }
  return result;
}

- (int64_t)_idsTetheringHostDeviceCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t result = self->_idsTetheringHostDeviceCount;
  if (result < 0)
  {
    self->_int64_t idsTetheringHostDeviceCount = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) supportsTethering]) {
            ++self->_idsTetheringHostDeviceCount;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    return self->_idsTetheringHostDeviceCount;
  }
  return result;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = (NSArray *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    [(NSArray *)v5 count];
    LogPrintF();
  }
  idsDeviceArray = self->_idsDeviceArray;
  self->_idsDeviceArray = v5;
  uint64_t v7 = v5;

  idsDeviceBTDictionary = self->_idsDeviceBTDictionary;
  self->_idsDeviceBTDictionary = 0;

  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  *(_OWORD *)&self->_idsLegacyClientDeviceCount = v9;
  *(_OWORD *)&self->_idsTetheringClientDeviceCount = v9;

  [(SDHotspotAgent *)self _update];
}

- (void)_legacyBrowserEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_hotspotBrowser)
  {
    id v3 = (SDHotspotBrowser *)objc_opt_new();
    hotspotBrowser = self->_hotspotBrowser;
    self->_hotspotBrowser = v3;

    [(SDHotspotBrowser *)self->_hotspotBrowser setClientProxy:self];
    [(SDHotspotBrowser *)self->_hotspotBrowser setHotspotManager:self->_hotspotManager];
    [(SDHotspotBrowser *)self->_hotspotBrowser setIdsService:self->_idsService];
    [(SDHotspotBrowser *)self->_hotspotBrowser setD2dEncryptionAvailable:[(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]];
    [(SDHotspotBrowser *)self->_hotspotBrowser activate];
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(SDHotspotBrowser *)self->_hotspotBrowser setProducerScanEnabled:[(SDHotspotAgent *)self _legacyBrowserShouldScan]];
  unsigned int v5 = [(SDHotspotAgent *)self _legacyBrowserShouldBrowse];
  id v6 = self->_hotspotBrowser;
  if (v5)
  {
    [(SDHotspotBrowser *)v6 startBrowsing];
  }
  else
  {
    [(SDHotspotBrowser *)v6 stopBrowsing];
  }
}

- (void)_legacyBrowserEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_hotspotBrowser)
  {
    if (dword_1009667F0 <= 50 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDHotspotBrowser *)self->_hotspotBrowser invalidate];
    hotspotBrowser = self->_hotspotBrowser;
    self->_hotspotBrowser = 0;
  }
}

- (BOOL)_legacyBrowserShouldStart
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009667F0 <= 40 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    if (self->_prefLegacyDisabled) {
      id v3 = "yes";
    }
    else {
      id v3 = "no";
    }
    long long v23 = v3;
    int64_t v4 = [(SDHotspotAgent *)self _idsLegacyHostDeviceCount];
    int64_t v5 = [(SDHotspotAgent *)self _idsLegacyClientDeviceCount];
    id v6 = [(SDHotspotAgent *)self _idsDeviceArray];
    id v7 = [v6 count];
    if (self->_systemMonitorActivated) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (self->_idsService) {
      long long v9 = "yes";
    }
    else {
      long long v9 = "no";
    }
    if (self->_hotspotManager) {
      long long v10 = "yes";
    }
    else {
      long long v10 = "no";
    }
    if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]) {
      long long v11 = "yes";
    }
    else {
      long long v11 = "no";
    }
    long long v21 = v10;
    long long v22 = v11;
    long long v19 = v8;
    long long v20 = v9;
    int64_t v17 = v5;
    id v18 = v7;
    uint64_t v15 = v23;
    int64_t v16 = v4;
    LogPrintF();
  }
  if (!self->_systemMonitorActivated || !self->_idsService || !self->_hotspotManager || self->_prefLegacyDisabled) {
    return 0;
  }
  if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]
    || ([(SDHotspotAgent *)self _idsDeviceArray],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 count],
        v13,
        !v14))
  {
    if ([(SDHotspotAgent *)self _idsLegacyHostDeviceCount] <= 0)return [(SDHotspotAgent *)self _idsLegacyClientDeviceCount] > 0; {
  }
    }
  return 1;
}

- (BOOL)_legacyBrowserShouldBrowse
{
  if (dword_1009667F0 <= 40 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable];
    [(SDHotspotAgent *)self _idsLegacyHostDeviceCount];
    LogPrintF();
  }
  if (self->_prefLegacyDisabled || !self->_browserActive || self->_browserClientsInactive) {
    return 0;
  }
  if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]) {
    return [(SDHotspotAgent *)self _idsLegacyHostDeviceCount] != 0;
  }
  return 1;
}

- (BOOL)_legacyBrowserShouldScan
{
  if (dword_1009667F0 <= 40 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
  {
    [(SDHotspotManager *)self->_hotspotManager maxConnectionsReached];
    [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable];
    [(SDHotspotAgent *)self _idsLegacyClientDeviceCount];
    LogPrintF();
  }
  if (self->_prefLegacyDisabled
    || [(SDHotspotManager *)self->_hotspotManager maxConnectionsReached])
  {
    return 0;
  }
  if ([(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable]) {
    return [(SDHotspotAgent *)self _idsLegacyClientDeviceCount] > 0;
  }
  return 1;
}

- (void)_legacyBrowswerUpdateD2DState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_hotspotBrowser)
  {
    BOOL v3 = [(SDHotspotAgent *)self _sysMonitorD2DEncryptionIsAvailable];
    hotspotBrowser = self->_hotspotBrowser;
    [(SDHotspotBrowser *)hotspotBrowser setD2dEncryptionAvailable:v3];
  }
}

- (LogCategory)_logCategoryCreateWithLabel:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatchQueue = self->_dispatchQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%x", v6, v4];

  id v8 = v7;
  [v8 UTF8String];

  return (LogCategory *)LogCategoryCreateEx();
}

- (void)disableTethering
{
}

- (BOOL)isTetheringInUse
{
  return [(SDHotspotManager *)self->_hotspotManager isTetheringInUse];
}

- (NSString)hotspotName
{
  return [(SDHotspotManager *)self->_hotspotManager hotspotName];
}

- (NSString)hotspotPassword
{
  return [(SDHotspotManager *)self->_hotspotManager hotspotPassword];
}

- (BOOL)p2pAllowed
{
  return [(SDHotspotManager *)self->_hotspotManager isP2PAllowed];
}

- (void)_sysMonitorEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_systemMonitor)
  {
    BOOL v3 = (CUSystemMonitor *)objc_opt_new();
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007AE2C;
    v9[3] = &unk_1008CA4B8;
    v9[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFamilyUpdatedHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007AEBC;
    v8[3] = &unk_1008CA4B8;
    v8[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007AF54;
    v7[3] = &unk_1008CA4B8;
    v7[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v7];
    int64_t v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007AFD8;
    v6[3] = &unk_1008CA4B8;
    v6[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
}

- (void)_sysMonitorEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;
}

- (int64_t)_sysMonitorFamilyCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int64_t result = self->_familyCount;
  if (result < 0)
  {
    self->_familyCount = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(CUSystemMonitor *)self->_systemMonitor familyMembers];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) isMe] & 1) == 0) {
            ++self->_familyCount;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    return self->_familyCount;
  }
  return result;
}

- (id)_sysMonitorFamilyMemberForAltDSID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CUSystemMonitor *)self->_systemMonitor familyMembers];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 isMe] & 1) == 0)
        {
          long long v12 = [v11 altDSID];
          if (v12 && [v4 isEqualToString:v12])
          {
            id v13 = v11;

            id v8 = v13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_sysMonitorFamilyMemberForAppleID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CUSystemMonitor *)self->_systemMonitor familyMembers];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 isMe] & 1) == 0)
        {
          long long v12 = [v11 appleID];
          if (v12 && [v4 isEqualToString:v12])
          {
            id v13 = v11;

            id v8 = v13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_sysMonitorD2DEncryptionIsAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  systemMonitor = self->_systemMonitor;

  return [(CUSystemMonitor *)systemMonitor manateeAvailable];
}

- (void)_userAlertForMember:(id)a3 logCategory:(LogCategory *)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v9 = [v13 firstName];
  if (v9)
  {
    long long v10 = [v13 altDSID];
    if (v10)
    {
      long long v11 = [(NSMutableDictionary *)self->_userAlerts objectForKeyedSubscript:v10];
      if (v11)
      {
        if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize()))
        {
          long long v12 = v9;
          LogPrintF();
        }
        [v11 invalidate:v12];
        [(NSMutableDictionary *)self->_userAlerts removeObjectForKey:v10];
      }
      [(SDHotspotAgent *)self _postUserAlertForName:v9 altDSID:v10 logCategory:a4 completion:v8];
    }
    else
    {
      if (a4->var0 <= 90 && (a4->var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      long long v11 = NSErrorWithOSStatusF();
      v8[2](v8, v11);
    }
  }
  else
  {
    if (a4->var0 <= 90 && (a4->var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v10 = NSErrorWithOSStatusF();
    v8[2](v8, v10);
  }
}

- (void)_postUserAlertForName:(id)a3 altDSID:(id)a4 logCategory:(LogCategory *)a5 completion:(id)a6
{
  id v10 = a3;
  id v31 = a4;
  id v30 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v11 = +[NSBundle bundleWithIdentifier:@"com.apple.Sharing"];
  long long v12 = [v11 URLForResource:@"Assets" withExtension:@"car"];

  if (!v12 && a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v13 = SFLocalizedStringForKey();
  id v14 = SFLocalizedStringForKey();
  long long v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v10);

  long long v16 = SFLocalizedStringForKey();
  long long v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v10);

  long long v18 = objc_opt_new();
  [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v18 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  [v18 setObject:&off_100902718 forKeyedSubscript:SBUserNotificationSystemSoundIDKey];
  long long v32 = (void *)v13;
  [v18 setObject:v13 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];
  [v18 setObject:v15 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];
  long long v19 = [v12 path];
  [v18 setObject:v19 forKeyedSubscript:SBUserNotificationIconImageAssetCatalogPathKey];

  [v18 setObject:@"InstantHotSpot" forKeyedSubscript:SBUserNotificationIconImageAssetCatalogImageKey];
  long long v20 = objc_opt_new();
  [v20 setDispatchQueue:self->_dispatchQueue];
  [v20 setTitle:v17];
  long long v21 = SFLocalizedStringForKey();
  [v20 setDefaultButtonTitle:v21];

  long long v22 = SFLocalizedStringForKey();
  [v20 setAlternateButtonTitle:v22];

  [v20 setTimeout:30.0];
  [v20 setAdditionalInfo:v18];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10007BB64;
  v33[3] = &unk_1008CB8A0;
  BOOL v38 = a5;
  id v23 = v10;
  id v34 = v23;
  id v24 = v30;
  id v37 = v24;
  long long v35 = self;
  id v25 = v31;
  id v36 = v25;
  [v20 setResponseHandler:v33];
  if (a5->var0 <= 50 && (a5->var0 != -1 || _LogCategory_Initialize()))
  {
    id v29 = v23;
    LogPrintF();
  }
  [v20 present:v29];
  userAlerts = self->_userAlerts;
  if (!userAlerts)
  {
    BOOL v27 = (NSMutableDictionary *)objc_opt_new();
    BOOL v28 = self->_userAlerts;
    self->_userAlerts = v27;

    userAlerts = self->_userAlerts;
  }
  [(NSMutableDictionary *)userAlerts setObject:v20 forKeyedSubscript:v25];
}

- (void)testNotification
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BD04;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateAdvertisementSuppression:(BOOL)a3
{
  BOOL v3 = a3;
  if ((GestaltGetDeviceClass() & 0xFFFFFFFD) == 1 && self->_suppressAdvertisement != v3)
  {
    if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_suppressAdvertisement = v3;
    [(SDHotspotAgent *)self _update];
  }
}

- (void)_registerForWombatActivityNotifications
{
  if (self->_wombatActivityReadyToken == -1)
  {
    p_int wombatActivityReadyToken = &self->_wombatActivityReadyToken;
    if (dword_1009667F0 <= 20 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007C014;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.wombat-activity", p_wombatActivityReadyToken, dispatchQueue, handler);
    int wombatActivityReadyToken = self->_wombatActivityReadyToken;
    uint64_t state64 = 0;
    notify_get_state(wombatActivityReadyToken, &state64);
    int wombatActivityState = state64;
    self->_int wombatActivityState = state64;
    if (dword_1009667F0 <= 30)
    {
      if (dword_1009667F0 != -1
        || (int v7 = _LogCategory_Initialize(), wombatActivityState = self->_wombatActivityState, v7))
      {
        LogPrintF();
        int wombatActivityState = self->_wombatActivityState;
      }
    }
    self->_suppressAdvertisement = wombatActivityState == 1;
  }
}

- (void)_unregisterWombatActivityNotifications
{
  int wombatActivityReadyToken = self->_wombatActivityReadyToken;
  if (wombatActivityReadyToken != -1)
  {
    notify_cancel(wombatActivityReadyToken);
    self->_int wombatActivityReadyToken = -1;
  }
}

- (void)_registerForCellularSlicingAvailabilityNotifications
{
  p_int cellularSlicingNotifyToken = &self->_cellularSlicingNotifyToken;
  if (self->_cellularSlicingNotifyToken == -1)
  {
    if (dword_1009667F0 <= 20 && (dword_1009667F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007C2BC;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.CoreTelephony.Slicing.LLPHS.State", p_cellularSlicingNotifyToken, dispatchQueue, handler);
    int cellularSlicingNotifyToken = self->_cellularSlicingNotifyToken;
    uint64_t state64 = 0;
    notify_get_state(cellularSlicingNotifyToken, &state64);
    uint64_t v6 = state64;
    if (dword_1009667F0 <= 30 && (dword_1009667F0 != -1 || _LogCategory_Initialize()))
    {
      int v7 = [(SDHotspotAgent *)self _slicingLLPHSStateNotificationValueToString:v6];
      LogPrintF();
    }
    if (v6)
    {
      self->_cellularSlicingIsAvailable = v6 == 2;
      [(SDLocalCellularStatusManager *)self->_cellularStatusManager publishCellularSlicingEnabledAs:v7];
    }
  }
}

- (void)_unregisterForCellularSlicingCapabilityNotifications
{
  int cellularSlicingNotifyToken = self->_cellularSlicingNotifyToken;
  if (cellularSlicingNotifyToken != -1)
  {
    notify_cancel(cellularSlicingNotifyToken);
    self->_int cellularSlicingNotifyToken = -1;
    self->_cellularSlicingIsAvailable = 0;
    cellularStatusManager = self->_cellularStatusManager;
    [(SDLocalCellularStatusManager *)cellularStatusManager publishCellularSlicingEnabledAs:0];
  }
}

- (id)_slicingLLPHSStateNotificationValueToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"?";
  }
  else {
    return *(&off_1008CB990 + a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAlerts, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_prefNetworkTypeOverride, 0);
  objc_storeStrong((id *)&self->_prefFamilyEnabledOverride, 0);
  objc_storeStrong((id *)&self->_hotspotManager, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_hotspotBrowser, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsDeviceBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devicesLegacy, 0);
  objc_storeStrong((id *)&self->_devicesCombined, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_companionLinkReceiver, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_clientProxyMap, 0);
  objc_storeStrong((id *)&self->_cellularStatusManager, 0);
  objc_storeStrong((id *)&self->_browserBundleIDs, 0);
  objc_storeStrong((id *)&self->_browserAppMonitor, 0);

  objc_storeStrong((id *)&self->_advertisementTimer, 0);
}

@end