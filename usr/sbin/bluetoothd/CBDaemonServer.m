@interface CBDaemonServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)_bleAdvertiserUpdateSpatialInteraction;
- (BOOL)_bleAdvertiserUpdateWithAuthTagNC;
- (BOOL)_firstUnlockedOrAllowedBefore;
- (BOOL)_identitiesShouldRun;
- (BOOL)_stackAccessoryMonitorShouldRun;
- (BOOL)_stackBLEScannerShouldRun;
- (BOOL)_stackClassicScannerShouldRun;
- (BOOL)_stackDeviceMonitorShouldRun;
- (BOOL)_supportsProxControl;
- (BOOL)_verifyNearbyInfoV2IntegrityTag:(id)a3 rapportIdentity:(id)a4;
- (BOOL)_whbDiscoveryShouldRun;
- (BOOL)prefAppleAudioDeviceLimitedLoggingEnabled;
- (BOOL)prefEnforceApprovedExtensions;
- (BOOL)prefEnforceApprovedList;
- (BOOL)prefExtensionsEnabled;
- (BOOL)prefRemoteClientEnabled;
- (BOOL)prefRemoteServerEnabled;
- (BOOL)prefSystemReferenceTimeDisabled;
- (BOOL)prefWiProxAdvertising;
- (BOOL)supportsNCSecondaryAdvertisingInstance;
- (BOOL)xpcEventAllowedInfo:(id)a3;
- (CBAccessoryDaemon)accessoryDaemon;
- (CBAdvertiserDaemon)testAdvertiser;
- (CBController)testAssertion;
- (CBDaemonServer)initWithCBStackAdaptor:(id)a3;
- (CBDiscovery)testDiscovery;
- (CBExtensionsDaemon)extensionsDaemon;
- (CBStackAdaptor)stackAdaptor;
- (CBStackAddressMonitor)addressMonitor;
- (CBStackBLEScanner)stackBLEScanner;
- (CBStackController)stackController;
- (CBUserController)userController;
- (CBWHBDiscoveryDaemon)whbDiscoveryDaemon;
- (NSArray)identityArray;
- (NSData)prefFilterNearbyActionExtraData;
- (NSMutableDictionary)deviceMap;
- (NSMutableDictionary)identifyDevices;
- (NSMutableDictionary)whbDeviceMap;
- (NSMutableSet)xpcConnections;
- (OS_xpc_object)xpcListenerEndpoint;
- (char)prefCBExtensionRSSIOverride;
- (char)wifiCriticalOverride;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)getAudioAccessoryDeviceArray;
- (id)localWhbDeviceForStableId:(id)a3;
- (void)_accessoryDaemonEnsureStarted;
- (void)_accessoryDaemonEnsureStopped;
- (void)_activate;
- (void)_activateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)_activateCBController:(id)a3 completion:(id)a4;
- (void)_activateCBDiscovery:(id)a3 completion:(id)a4;
- (void)_activateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)_aopMessageReceived:(id)a3;
- (void)_bleAddressMonitorEnsureStarted;
- (void)_bleAddressMonitorEnsureStopped;
- (void)_bleAdvertiserAddressChanged:(BOOL)a3;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_extensionsEnsureStarted;
- (void)_extensionsEnsureStopped;
- (void)_identitiesEnsureStarted;
- (void)_identitiesEnsureStopped;
- (void)_identitiesGet;
- (void)_identitiesReevaluateDevices;
- (void)_identitiesResolveNearbyDevice:(id)a3;
- (void)_invalidate;
- (void)_invalidateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)_invalidateCBController:(id)a3 completion:(id)a4;
- (void)_invalidateCBDiscovery:(id)a3 completion:(id)a4;
- (void)_invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)_invalidateUserController;
- (void)_notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5;
- (void)_performUserControllerActionWithCompletion:(id)a3;
- (void)_prefsChanged;
- (void)_remoteEnsureStarted;
- (void)_remoteEnsureStopped;
- (void)_remoteInvalidateInactiveXPC;
- (void)_remoteReceivedEvent:(id)a3 options:(id)a4;
- (void)_remoteReceivedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_reportDeviceFound:(id)a3;
- (void)_reportDeviceLost:(id)a3;
- (void)_reportDeviceLostIfNeeded:(unint64_t)a3;
- (void)_reportDevicesBuffered:(id)a3;
- (void)_stackAccessoryMonitorEnsureStarted;
- (void)_stackAccessoryMonitorEnsureStopped;
- (void)_stackBLEScannerDeviceFound:(id)a3;
- (void)_stackBLEScannerDeviceLost:(id)a3;
- (void)_stackBLEScannerDevicesBuffered:(id)a3;
- (void)_stackBLEScannerEnsureStarted;
- (void)_stackBLEScannerEnsureStopped;
- (void)_stackBLEScannerUpdateProxControlIfNeeded:(id)a3;
- (void)_stackClassicScannerDeviceFound:(id)a3;
- (void)_stackClassicScannerDeviceLost:(id)a3;
- (void)_stackClassicScannerEnsureStarted;
- (void)_stackClassicScannerEnsureStopped;
- (void)_stackControllerEnsureStarted;
- (void)_stackControllerEnsureStopped;
- (void)_stackDeviceMonitorDeviceFound:(id)a3;
- (void)_stackDeviceMonitorDeviceLost:(id)a3;
- (void)_stackDeviceMonitorEnsureStarted;
- (void)_stackDeviceMonitorEnsureStopped;
- (void)_tipiChanged:(id)a3;
- (void)_update;
- (void)_updateMemoryPressure;
- (void)_updateSelfAuthTag;
- (void)_updateUserControllerCloudDevices;
- (void)_userControllerCloudUpdateWithDevices:(id)a3;
- (void)_userControllerUploadLocalControllerInfo;
- (void)_whbDiscoveryDeviceFound:(id)a3;
- (void)_whbDiscoveryDeviceLost:(id)a3;
- (void)_whbDiscoveryEnsureStarted;
- (void)_whbDiscoveryEnsureStopped;
- (void)_xpcConnectionAccept:(id)a3;
- (void)_xpcListenerEvent:(id)a3;
- (void)_xpcPublisherConnectionsAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5;
- (void)_xpcPublisherConnectionsAddToken:(unint64_t)a3 info:(id)a4;
- (void)_xpcPublisherConnectionsRemoveToken:(unint64_t)a3 reason:(const char *)a4;
- (void)_xpcPublisherDiscoveryAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5;
- (void)_xpcPublisherDiscoveryAddToken:(unint64_t)a3 info:(id)a4;
- (void)_xpcPublisherDiscoveryRemoveToken:(unint64_t)a3 reason:(const char *)a4;
- (void)activate;
- (void)activateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)activateCBController:(id)a3 completion:(id)a4;
- (void)activateCBDiscovery:(id)a3 completion:(id)a4;
- (void)activateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)addLostDeviceToLostCBSpatialDevicesIfNeeded:(id)a3;
- (void)aopMessageReceived:(id)a3;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)coexChangeNotification:(id)a3;
- (void)descriptionInternalDebug;
- (void)invalidate;
- (void)invalidateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)invalidateCBController:(id)a3 completion:(id)a4;
- (void)invalidateCBDiscovery:(id)a3 completion:(id)a4;
- (void)invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5;
- (void)optimalWhbDeviceForStableIdentifier:(id)a3 completion:(id)a4;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)remoteDeregisterConnection:(id)a3;
- (void)remoteRegisterConnection:(id)a3 clientID:(id)a4;
- (void)scheduleAdvertiserUpdateImmediate:(BOOL)a3;
- (void)scheduleControlUpdateImmediate:(BOOL)a3;
- (void)scheduleDiscoveryUpdateImmediate:(BOOL)a3;
- (void)scheduleSpatialUpdateImmediate:(BOOL)a3;
- (void)scheduleUpdateImmediate:(BOOL)a3;
- (void)sendCoexUpdate:(id)a3;
- (void)setAccessoryDaemon:(id)a3;
- (void)setAddressMonitor:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setExtensionsDaemon:(id)a3;
- (void)setIdentifyDevices:(id)a3;
- (void)setIdentityArray:(id)a3;
- (void)setPrefEnforceApprovedExtensions:(BOOL)a3;
- (void)setPrefEnforceApprovedList:(BOOL)a3;
- (void)setPrefExtensionsEnabled:(BOOL)a3;
- (void)setStackController:(id)a3;
- (void)setSystemFlags:(unsigned int)a3 mask:(unsigned int)a4;
- (void)setTestAdvertiser:(id)a3;
- (void)setTestAssertion:(id)a3;
- (void)setTestDiscovery:(id)a3;
- (void)setUserController:(id)a3;
- (void)setWifiCriticalOverride:(char)a3;
- (void)setXpcConnections:(id)a3;
- (void)updateIdentities:(id)a3;
- (void)xpcConnectionInvalidated:(id)a3;
@end

@implementation CBDaemonServer

- (void)_xpcListenerEvent:(id)a3
{
  id v8 = a3;
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_connection)
  {
    [(CBDaemonServer *)self _xpcConnectionAccept:v8];
    goto LABEL_7;
  }
  v4 = v8;
  if (v8 == &_xpc_error_connection_invalid)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        LogPrintF_safe();
        goto LABEL_7;
      }
    }
  }
  else if (dword_1009F7F98 <= 90)
  {
    if (dword_1009F7F98 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      v7 = CUPrintXPC();
      LogPrintF_safe();

LABEL_7:
      v4 = v8;
    }
  }
}

- (void)_xpcConnectionAccept:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  int v5 = objc_alloc_init(CBDaemonXPCConnection);
  [(CBDaemonXPCConnection *)v5 setDaemon:self];
  [(CBDaemonXPCConnection *)v5 setDispatchQueue:self->_dispatchQueue];
  [(CBDaemonXPCConnection *)v5 setPid:xpc_connection_get_pid(v4)];
  [(CBDaemonXPCConnection *)v5 setXpcCnx:v4];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004CD14;
  handler[3] = &unk_100997A28;
  handler[4] = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);

  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v5];
  [(CBDaemonXPCConnection *)v5 activate];
}

- (void)_update
{
  self->_updatePending = 0;
  if (!self->_assertionFlagsValid)
  {
    unsigned int assertionFlags = self->_assertionFlags;
    self->_unsigned int assertionFlags = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v4 = self->_xpcConnections;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) activatedController];
          v10 = v9;
          if (v9) {
            self->_assertionFlags |= [v9 assertionFlags];
          }
        }
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }

    self->_assertionFlagsValid = 1;
    uint64_t v11 = self->_assertionFlags;
    if (v11 != assertionFlags)
    {
      if (dword_1009F7F98 <= 30
        && (dword_1009F7F98 != -1 || (v13 = _LogCategory_Initialize(), uint64_t v11 = self->_assertionFlags, v13)))
      {
        v12 = CUPrintFlags32();
        v25 = CUPrintFlags32();
        LogPrintF_safe();

        -[CBExtensionsDaemon setAssertionFlags:](self->_extensionsDaemon, "setAssertionFlags:", self->_assertionFlags, v12, v25, (void)v26);
      }
      else
      {
        -[CBExtensionsDaemon setAssertionFlags:](self->_extensionsDaemon, "setAssertionFlags:", v11, v23, v24, (void)v26);
      }
    }
  }
  if (self->_wifiCriticalOverride) {
    BOOL v14 = self->_wifiCriticalOverride == 1;
  }
  else {
    BOOL v14 = ([(CUSystemMonitor *)self->_systemMonitor wifiFlags] >> 8) & 1;
  }
  if (v14 != self->_wifiCritical)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      v15 = "no";
      if (v14) {
        v16 = "no";
      }
      else {
        v16 = "yes";
      }
      if (v14) {
        v15 = "yes";
      }
      v23 = v16;
      v24 = v15;
      LogPrintF_safe();
    }
    self->_wifiCritical = v14;
    bleDiscoveryArray = self->_bleDiscoveryArray;
    self->_bleDiscoveryArray = 0;
  }
  if ([(CBDaemonServer *)self _identitiesShouldRun]) {
    [(CBDaemonServer *)self _identitiesEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _identitiesEnsureStopped];
  }
  unsigned int v18 = [(CBDaemonServer *)self _bleAdvertiserShouldRun];
  unsigned int v19 = [(CBDaemonServer *)self _stackBLEScannerShouldRun];
  unsigned int v20 = v19;
  if ((v18 & 1) != 0 || !v19)
  {
    if (v18) {
      goto LABEL_37;
    }
  }
  else if (self->_stackBLEScannerNeedsAdvertisingAddress)
  {
LABEL_37:
    [(CBDaemonServer *)self _bleAddressMonitorEnsureStarted];
    goto LABEL_40;
  }
  [(CBDaemonServer *)self _bleAddressMonitorEnsureStopped];
LABEL_40:
  if (v18) {
    [(CBDaemonServer *)self _bleAdvertiserEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _bleAdvertiserEnsureStopped];
  }
  if ([(CBDaemonServer *)self _stackAccessoryMonitorShouldRun]) {
    [(CBDaemonServer *)self _stackAccessoryMonitorEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _stackAccessoryMonitorEnsureStopped];
  }
  if (v20) {
    [(CBDaemonServer *)self _stackBLEScannerEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _stackBLEScannerEnsureStopped];
  }
  if ([(CBDaemonServer *)self _stackClassicScannerShouldRun]) {
    [(CBDaemonServer *)self _stackClassicScannerEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _stackClassicScannerEnsureStopped];
  }
  if ([(CBDaemonServer *)self _stackDeviceMonitorShouldRun]) {
    [(CBDaemonServer *)self _stackDeviceMonitorEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _stackDeviceMonitorEnsureStopped];
  }
  if (self->_prefAccessoryDaemonEnabled) {
    [(CBDaemonServer *)self _accessoryDaemonEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _accessoryDaemonEnsureStopped];
  }
  if (self->_prefExtensionsEnabled) {
    [(CBDaemonServer *)self _extensionsEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _extensionsEnsureStopped];
  }
  unsigned int v21 = [(CBDaemonServer *)self _whbDiscoveryShouldRun];
  unsigned int v22 = v21;
  if (self->_prefRemoteClientEnabled && (v21 & 1) != 0 || self->_prefRemoteServerEnabled) {
    [(CBDaemonServer *)self _remoteEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _remoteEnsureStopped];
  }
  if (v22) {
    [(CBDaemonServer *)self _whbDiscoveryEnsureStarted];
  }
  else {
    [(CBDaemonServer *)self _whbDiscoveryEnsureStopped];
  }
}

- (BOOL)_whbDiscoveryShouldRun
{
  if (!self->_prefRemoteClientEnabled
    || ![(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    return 0;
  }
  if (self->_prefWHBDiscoveryAlways) {
    return 1;
  }
  id v5 = self->_whbDiscoveryArray;
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = self->_xpcConnections;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      id v6 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) activatedDiscoveryWHB:v13];
          if (v12)
          {
            if (!v6) {
              id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
            }
            [(NSMutableArray *)v6 addObject:v12];
          }
        }
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    else
    {
      id v6 = 0;
    }

    objc_storeStrong((id *)&self->_whbDiscoveryArray, v6);
    [(CBWHBDiscoveryDaemon *)self->_whbDiscoveryDaemon setDiscoveryArray:0];
  }
  BOOL v3 = [(NSMutableArray *)v6 count] != 0;

  return v3;
}

- (void)_whbDiscoveryEnsureStopped
{
  if (self->_whbDiscoveryDaemon)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    whbDiscoveryArray = self->_whbDiscoveryArray;
    self->_whbDiscoveryArray = 0;

    [(CBWHBDiscoveryDaemon *)self->_whbDiscoveryDaemon invalidate];
    whbDiscoveryDaemon = self->_whbDiscoveryDaemon;
    self->_whbDiscoveryDaemon = 0;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(NSMutableDictionary *)self->_whbDeviceMap allValues];
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          [(CBDaemonServer *)self _whbDiscoveryDeviceLost:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = self->_xpcConnections;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) whbStop:v15];
        }
        id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (void)_stackDeviceMonitorEnsureStarted
{
  BOOL v3 = self->_stackDeviceMonitor;
  if (!v3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAdaptor *)self->_stackAdaptor deviceMonitorClass];
    id v4 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&self->_stackDeviceMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006D428;
    v13[3] = &unk_100997370;
    id v5 = v4;
    id v14 = v5;
    long long v15 = self;
    [v5 setDeviceFoundHandler:v13];
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10006D444;
    uint64_t v10 = &unk_100997370;
    BOOL v3 = (CBStackDeviceMonitor *)v5;
    id v11 = v3;
    id v12 = self;
    [(CBStackDeviceMonitor *)v3 setDeviceLostHandler:&v7];
  }
  id deviceMonitorFlags = self->_deviceMonitorFlags;
  if (deviceMonitorFlags != [(CBStackDeviceMonitor *)v3 discoveryFlags])
  {
    [(CBStackDeviceMonitor *)v3 setDiscoveryFlags:self->_deviceMonitorFlags];
    [(CBStackDeviceMonitor *)v3 activate];
  }
}

- (void)_stackClassicScannerEnsureStopped
{
  if (self->_stackClassicScanner)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackBLEScanner *)self->_stackClassicScanner invalidate];
    stackClassicScanner = self->_stackClassicScanner;
    self->_stackClassicScanner = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSMutableDictionary *)self->_deviceMap allValues];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [(CBDaemonServer *)self _stackClassicScannerDeviceLost:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_stackBLEScannerShouldRun
{
  if (!self->_prefBLEScanning
    || (self->_assertionFlags & 1) != 0
    || ![(CBDaemonServer *)self _firstUnlockedOrAllowedBefore]
    || ![(CBStackController *)self->_stackController poweredOn])
  {
    return 0;
  }
  BOOL v3 = self->_bleDiscoveryArray;
  if (v3)
  {
    id v4 = v3;
    goto LABEL_84;
  }
  BOOL v7 = GestaltGetDeviceClass() == 7 || GestaltGetDeviceClass() == 13;
  BOOL v32 = v7;
  location = (id *)&self->_bleDiscoveryArray;
  if ([(CUSystemMonitor *)self->_systemMonitor screenOn])
  {
    uint64_t v8 = +[BLSBacklight sharedBacklight];
    if ([v8 isAlwaysOnEnabled]) {
      BOOL v9 = self->_screenUndimmed != 0;
    }
    else {
      BOOL v9 = 1;
    }
    BOOL v33 = v9;
  }
  else
  {
    BOOL v33 = 0;
  }
  *(_WORD *)&self->_stackBLEScannerNeedsAdvertisingAddress = 0;
  self->_unint64_t stackBLEProxControlFlags = 0;
  *(_WORD *)&self->_stackBLEProxControlNeedsDeviceClose = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v10 = self->_xpcConnections;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v11)
  {
    id v4 = 0;
    goto LABEL_83;
  }
  id v12 = v11;
  id v4 = 0;
  uint64_t v13 = *(void *)v35;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      long long v16 = [v15 activatedDiscovery:location];
      long long v17 = v16;
      if (v16)
      {
        unint64_t v18 = (unint64_t)[v16 discoveryFlags];
        unsigned int v19 = [v17 needsBLEScan];
        if (!v19) {
          goto LABEL_37;
        }
        if (!self->_prefDiscoveryProxy && [v15 xpcToken]
          || ([v17 internalFlags] & 0x10) != 0
          || (v33 | (v18 >> 25) & 1) != 1
          || [v17 denyLowPowerModeScans] && self->_lowPowerModeEnabled
          || [v17 denyScreenLockedScans]
          && (self->_screenLocked
           || ![(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
          || (v18 & 0x200000000000) != 0 && ![(CBDaemonServer *)self _supportsProxControl])
        {
          BOOL v20 = 1;
          goto LABEL_40;
        }
        if ([v17 deviceSetupState]) {
          BOOL v20 = self->_deviceSetupState == 10;
        }
        else {
LABEL_37:
        }
          BOOL v20 = 0;
LABEL_40:
        uint64_t v21 = v18 & 0x200000000000;
        self->_stackBLEProxControlAnyDeviceClose = (v21 | self->_stackBLEProxControlAnyDeviceClose) != 0;
        [v17 setDisabledPending:v20];
        if (!v20 && ((v19 ^ 1) & 1) == 0)
        {
          if ([v17 needsAdvertisingAddress]) {
            self->_stackBLEScannerNeedsAdvertisingAddress = 1;
          }
          if ([v17 needsIdentify]) {
            self->_stackBLENeedsIdentify = 1;
          }
          if (v21)
          {
            self->_stackBLENeedsIdentify = 1;
            if (v32)
            {
              self->_unint64_t stackBLEProxControlFlags = 64;
              unint64_t stackBLEProxControlFlags = 64;
            }
            else
            {
              self->_unint64_t stackBLEProxControlFlags = 0x80000;
              self->_stackBLEProxControlNeedsDeviceClose = 1;
              [v17 setUseCase:786432];
              unint64_t stackBLEProxControlFlags = self->_stackBLEProxControlFlags;
            }
          }
          else
          {
            unint64_t stackBLEProxControlFlags = 0;
          }
          [v17 setExtraDiscoveryFlags:stackBLEProxControlFlags];
          unsigned int v23 = [v17 bleScanRateOverride];
          if (v33 || (int v24 = [v17 bleScanRateScreenOff]) == 0) {
            int v24 = [v17 bleScanRate];
          }
          if (self->_wifiCritical && v24 >= 31)
          {
            if (([v17 useCase] & 0xFFFF0000) == 0x90000) {
              uint64_t v25 = 40;
            }
            else {
              uint64_t v25 = 30;
            }
            int v26 = 1;
          }
          else
          {
            BOOL v27 = v24 > 30;
            BOOL odeonActive = self->_odeonActive;
            if (odeonActive && v27) {
              int v26 = 2;
            }
            else {
              int v26 = 0;
            }
            if (odeonActive && v27) {
              uint64_t v25 = 30;
            }
            else {
              uint64_t v25 = v23;
            }
            if (!self->_odeonActive && !self->_wifiCritical)
            {
              int v26 = 0;
              if ([v17 bleScanRateOverride]) {
                uint64_t v25 = 0;
              }
              else {
                uint64_t v25 = v23;
              }
            }
          }
          if (v25 != v23)
          {
            [v17 setBleScanRateOverride:v25];
            [v17 setSystemOverrideFlags:((unint64_t)[v17 systemOverrideFlags] & 0xFFFFFFFC)];
            if (v25) {
              [v17 setSystemOverrideFlags:[v17 systemOverrideFlags] | v26];
            }
            uint64_t v29 = [v17 systemOverrideHandler];
            v30 = (void *)v29;
            if (v29) {
              (*(void (**)(uint64_t))(v29 + 16))(v29);
            }
          }
          if (!v4) {
            id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          }
          [(NSMutableArray *)v4 addObject:v17];
        }
      }
    }
    id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v12);
LABEL_83:

  objc_storeStrong(location, v4);
  [(CBStackBLEScanner *)self->_stackBLEScanner setDiscoveryArray:0];
LABEL_84:
  BOOL v5 = [(NSMutableArray *)v4 count] != 0;

  return v5;
}

- (BOOL)_stackAccessoryMonitorShouldRun
{
  unsigned int v3 = [(CBDaemonServer *)self _firstUnlockedOrAllowedBefore];
  if (v3)
  {
    stackController = self->_stackController;
    LOBYTE(v3) = [(CBStackController *)stackController poweredOn];
  }
  return v3;
}

- (void)_stackAccessoryMonitorEnsureStarted
{
  unsigned int v3 = self->_stackAccessoryMonitor;
  if (!v3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAdaptor *)self->_stackAdaptor accessoryMonitorClass];
    id v4 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&self->_stackAccessoryMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006B958;
    v12[3] = &unk_100997BC8;
    id v5 = v4;
    id v13 = v5;
    long long v14 = self;
    [v5 setAudioAccessoryEventHandler:v12];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    uint64_t v8 = sub_10006BAB8;
    BOOL v9 = &unk_100997BF0;
    unsigned int v3 = (CBStackAccessoryMonitor *)v5;
    uint64_t v10 = v3;
    id v11 = self;
    [(CBStackAccessoryMonitor *)v3 setAudioAccessoryInfoChangedHandler:&v6];

    [(CBStackAccessoryMonitor *)v3 activate];
  }
}

- (void)_remoteEnsureStopped
{
  if (self->_remoteClient)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(RPCompanionLinkClient *)self->_remoteClient invalidate];
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0;

    self->_remoteRequestRegistered = 0;
  }
  if (self->_remoteServer)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(RPServer *)self->_remoteServer invalidate];
    remoteServer = self->_remoteServer;
    self->_remoteServer = 0;
  }
  if (self->_coexNotificationSetup)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"com.apple.bluetooth.leconnection" object:0];

    self->_coexNotificationSetup = 0;
  }
}

- (BOOL)_identitiesShouldRun
{
  if (![(CUSystemMonitor *)self->_systemMonitor firstUnlocked]
    || ![(CBStackController *)self->_stackController poweredOn])
  {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v3 = self->_xpcConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v9 = [v8 activatedDiscovery:v15];
        if ([v9 needsIdentify]) {
          goto LABEL_16;
        }
        uint64_t v10 = [v8 activatedSpatialInteractionSession];
        if (([v10 controlFlags] & 0x3E0) != 0
          || ([v8 activatedAdvertiser],
              id v11 = objc_claimAutoreleasedReturnValue(),
              unsigned int v12 = [v11 needsIdentify],
              v11,
              v12))
        {

LABEL_16:
          BOOL v13 = 1;
          goto LABEL_18;
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_18:

  return v13;
}

- (void)_identitiesEnsureStarted
{
  p_identitiesNotifyToken = &self->_identitiesNotifyToken;
  if (self->_identitiesNotifyToken == -1)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006DCDC;
    handler[3] = &unk_100997AD8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", p_identitiesNotifyToken, dispatchQueue, handler);
    [(CBDaemonServer *)self _identitiesGet];
  }
}

- (void)_extensionsEnsureStarted
{
  if (!self->_extensionsDaemon)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned int v3 = objc_alloc_init(CBExtensionsDaemon);
    extensionsDaemon = self->_extensionsDaemon;
    self->_extensionsDaemon = v3;

    [(CBExtensionsDaemon *)self->_extensionsDaemon setDispatchQueue:self->_dispatchQueue];
    [(CBExtensionsDaemon *)self->_extensionsDaemon setDaemonServer:self];
    id v5 = self->_extensionsDaemon;
    [(CBExtensionsDaemon *)v5 activate];
  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  if (!self->_prefBLEAdvertising
    || ![(CBDaemonServer *)self _firstUnlockedOrAllowedBefore]
    || ![(CBStackController *)self->_stackController poweredOn])
  {
    return 0;
  }
  unsigned int v3 = self->_bleAdvertiserArray;
  if ([(NSMutableArray *)v3 count]) {
    goto LABEL_30;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_xpcConnections;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 activatedAdvertiser];
        if (v11)
        {
          if (!v3) {
            unsigned int v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          }
          [(NSMutableArray *)v3 addObject:v11];
        }
        if (v7)
        {
          BOOL v7 = 1;
        }
        else
        {
          unsigned int v12 = [v10 activatedSpatialInteractionSession];
          BOOL v13 = v12;
          if (v12) {
            BOOL v7 = ([v12 controlFlags] & 8) == 0;
          }
          else {
            BOOL v7 = 0;
          }
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  objc_storeStrong((id *)&self->_bleAdvertiserArray, v3);
  [(CBAdvertiserDaemon *)self->_bleAdvertiser setAdvertiserArray:0];
  if (v7
    || [(CBAdvertiserDaemon *)self->_bleAdvertiser needsToRun]
    || self->_bleAdvertiserSpatialLingerTimer
    || ([(CBAdvertiserDaemon *)self->_bleAdvertiser spatialInteractionIdentifiers],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [v16 count],
        v16,
        v17))
  {
LABEL_30:
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = [(NSMutableArray *)v3 count] != 0;
  }

  return v14;
}

- (BOOL)_stackDeviceMonitorShouldRun
{
  unsigned int v3 = [(CBDaemonServer *)self _firstUnlockedOrAllowedBefore];
  if (v3)
  {
    unsigned int v3 = [(CBStackController *)self->_stackController poweredOn];
    if (v3)
    {
      if (self->_deviceMonitorFlagsValid)
      {
        BOOL v4 = self->_deviceMonitorFlags == 0;
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v5 = self->_xpcConnections;
        id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          id v7 = v6;
          unint64_t v8 = 0;
          uint64_t v9 = *(void *)v16;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v5);
              }
              id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) activatedDiscovery:v15];
              unint64_t v12 = (unint64_t)[v11 discoveryFlags];

              if ((v12 & 0xA00000) != 0) {
                unint64_t v13 = v12;
              }
              else {
                unint64_t v13 = 0;
              }
              v8 |= v13;
            }
            id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v7);
        }
        else
        {
          unint64_t v8 = 0;
        }

        self->_id deviceMonitorFlags = v8;
        self->_deviceMonitorFlagsValid = 1;
        BOOL v4 = v8 == 0;
      }
      LOBYTE(v3) = !v4;
    }
  }
  return v3;
}

- (BOOL)_firstUnlockedOrAllowedBefore
{
  if (([(CUSystemMonitor *)self->_systemMonitor firstUnlocked] & 1) != 0
    || (os_variant_is_recovery() & 1) != 0)
  {
    return 1;
  }

  return MGGetBoolAnswer();
}

- (void)_bleAdvertiserEnsureStarted
{
  p_bleAdvertiser = &self->_bleAdvertiser;
  BOOL v4 = self->_bleAdvertiser;
  BOOL v5 = v4 == 0;
  if (!v4)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = objc_alloc_init(CBAdvertiserDaemon);
    objc_storeStrong((id *)p_bleAdvertiser, v6);
    [(CBAdvertiserDaemon *)v6 setDaemonServer:self];
    [(CBAdvertiserDaemon *)v6 setDispatchQueue:self->_dispatchQueue];
    [(CBAdvertiserDaemon *)v6 setStackAdaptor:self->_stackAdaptor];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10006B1AC;
    v23[3] = &unk_100997208;
    BOOL v4 = v6;
    int v24 = v4;
    uint64_t v25 = self;
    [(CBAdvertiserDaemon *)v4 setStateChangedHandler:v23];
  }
  id v7 = self->_selfAuthTag;
  unint64_t v8 = [(CBAdvertiserDaemon *)v4 selfAuthTag];
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_14;
  }
  id v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_13;
  }
  unsigned __int8 v12 = [(NSData *)v9 isEqual:v10];

  if ((v12 & 1) == 0)
  {
LABEL_13:
    [(CBAdvertiserDaemon *)v4 setSelfAuthTag:v9];
    BOOL v5 = 1;
  }
LABEL_14:
  unint64_t v13 = [(CBAdvertiserDaemon *)v4 advertiserArray];
  if (v13)
  {

LABEL_16:
    int v14 = 0;
    goto LABEL_19;
  }
  if (![(NSMutableArray *)self->_bleAdvertiserArray count]) {
    goto LABEL_16;
  }
  [(CBAdvertiserDaemon *)v4 setAdvertiserArray:self->_bleAdvertiserArray];
  int v14 = 1;
LABEL_19:
  unsigned int v15 = [(CBDaemonServer *)self _bleAdvertiserUpdateSpatialInteraction];
  unsigned int v16 = [(CBDaemonServer *)self _bleAdvertiserUpdateWithAuthTagNC];
  if (v5)
  {
    long long v17 = [(CBStackAddressMonitor *)self->_addressMonitor nonConnectableAddressData];
    BOOL v18 = v17 == 0;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006B1C4;
    v19[3] = &unk_100997BA0;
    long long v20 = v4;
    long long v21 = self;
    BOOL v22 = v18;
    [(CBAdvertiserDaemon *)v20 activateWithCompletion:v19];
  }
  else if (v14 + v15 != (int)(v16 << 31) >> 31 {
         && dword_1009F7F98 <= 30
  }
         && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (BOOL)_bleAdvertiserUpdateWithAuthTagNC
{
  v2 = self;
  unsigned int v3 = self->_bleAdvertiser;
  if (!v3)
  {
    BOOL v6 = 0;
    goto LABEL_99;
  }
  unsigned __int8 v99 = 0;
  BOOL v4 = [(CBStackAddressMonitor *)v2->_addressMonitor nonConnectableAddressData];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = [(CBAdvertiserDaemon *)v3 advertiserArray];
  id v5 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
  BOOL v6 = v5 != 0;
  if (!v5)
  {
    v80 = 0;
    v81 = 0;
    v78 = 0;
    goto LABEL_96;
  }
  id v7 = v5;
  BOOL v72 = v5 != 0;
  v73 = v3;
  int v8 = 0;
  v78 = 0;
  v80 = 0;
  unsigned int v84 = 0;
  unsigned int v9 = 0;
  v81 = 0;
  v82 = v2;
  char v74 = 0;
  uint64_t v10 = *(void *)v96;
  v77 = v4;
  do
  {
    id v11 = 0;
    do
    {
      if (*(void *)v96 != v10) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v12 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v11);
      unsigned __int8 v14 = [v12 nearbyInfoV2DecryptedFlags];
      v99 |= v14;
      v8 |= [v12 nearbyInfoV2Flags] & 4;
      unsigned int v15 = [v12 airplaySourceFlags];
      if (v8) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v15 == 0;
      }
      if (v16 && v99 == 0) {
        goto LABEL_46;
      }
      if (!v2->_identitySelf) {
        goto LABEL_44;
      }
      char v18 = v15;
      if ([v4 length] != (id)6) {
        goto LABEL_44;
      }
      if (v8) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = v99 == 0;
      }
      unsigned int v83 = v9;
      if (!v19)
      {
        long long v20 = [v12 nearbyInfoV2AuthTagData];

        v75 = [v12 nearbyInfoV2RapportIRKData];

        long long v21 = [(RPIdentity *)v2->_identitySelf authTagForData:v4 type:2 error:0];
        BOOL v22 = [(RPIdentity *)v2->_identitySelf deviceIRKData];
        id v23 = v20;
        id v24 = v21;
        id v25 = v23;
        int v26 = v24;
        v80 = v25;
        if (v25 == v24)
        {

          goto LABEL_27;
        }
        if ((v25 == 0) != (v24 != 0))
        {
          unsigned __int8 v79 = [v25 isEqual:v24];

          if (v79)
          {
LABEL_27:
            id v27 = v75;
            id v28 = v22;
            uint64_t v29 = v28;
            v78 = v27;
            if (v27 == v28)
            {
            }
            else
            {
              if ((v27 == 0) != (v28 != 0))
              {
                unsigned __int8 v76 = [v27 isEqual:v28];

                if (v76) {
                  goto LABEL_34;
                }
              }
              else
              {
              }
              [v12 setNearbyInfoV2RapportIRKData:v29];
              char v74 = 1;
            }
LABEL_34:

            BOOL v4 = v77;
            v2 = v82;
            unsigned int v9 = v83;
            goto LABEL_35;
          }
        }
        else
        {
        }
        [v12 setNearbyInfoV2AuthTagData:v26];
        char v74 = 1;
        goto LABEL_27;
      }
LABEL_35:
      if ((v18 & 0x10) != 0)
      {
        v30 = [v12 airplaySourceAuthTagData];

        v31 = [(RPIdentity *)v2->_identitySelf authTagForData:v4 type:2 error:0];
        id v32 = v30;
        id v33 = v31;
        id v34 = v32;
        long long v35 = v33;
        v81 = v34;
        if (v34 == v33)
        {
        }
        else
        {
          if ((v34 == 0) != (v33 != 0))
          {
            long long v36 = v34;
            unsigned __int8 v37 = [v34 isEqual:v33];

            if (v37) {
              goto LABEL_43;
            }
          }
          else
          {
          }
          [v12 setAirplaySourceAuthTagData:v35];
          char v74 = 1;
        }
LABEL_43:

        BOOL v4 = v77;
        unsigned int v9 = v83;
      }
LABEL_44:
      if (v84)
      {
        if (v9) {
          goto LABEL_46;
        }
      }
      else
      {
        unsigned int v84 = [v12 nearbyInfoV2InvitationCounter];
        if (v9) {
          goto LABEL_46;
        }
      }
      unsigned int v9 = [v12 nearbyInfoV2InvitationRouteType];
LABEL_46:
      id v11 = (char *)v11 + 1;
    }
    while (v7 != v11);
    id v38 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
    id v7 = v38;
  }
  while (v38);

  if ((v74 & 1) == 0)
  {
    BOOL v6 = 0;
    unsigned int v3 = v73;
    goto LABEL_98;
  }
  unsigned int v39 = v9;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  unsigned int v3 = v73;
  id obj = [(CBAdvertiserDaemon *)v73 advertiserArray];
  id v40 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (!v40) {
    goto LABEL_94;
  }
  id v41 = v40;
  uint64_t v42 = *(void *)v92;
  if (v84) {
    BOOL v43 = v39 == 0;
  }
  else {
    BOOL v43 = 1;
  }
  char v44 = !v43;
  char v85 = v44;
  while (2)
  {
    uint64_t v45 = 0;
    while (2)
    {
      if (*(void *)v92 != v42) {
        objc_enumerationMutation(obj);
      }
      v46 = *(void **)(*((void *)&v91 + 1) + 8 * v45);
      uint64_t v47 = [v46 nearbyInfoV2AuthTagData:v66, v67];
      if (v47)
      {
        v48 = (void *)v47;
        if ([v46 nearbyInfoV2Flags])
        {

LABEL_67:
          v50 = [v46 nearbyInfoV2AuthTagData];
          double Current = CFAbsoluteTimeGetCurrent();
          unint64_t v89 = 0xBFF0000000000000;
          *(double *)&unint64_t v90 = -1.0;
          unsigned int v88 = -1;
          if (!v2->_prefSystemReferenceTimeDisabled && TMGetReferenceTime() && v88)
          {
            double v53 = *(double *)&v90;
            if (dword_1009F7F98 > 20)
            {
              double v54 = *(double *)&v90;
            }
            else
            {
              double v54 = *(double *)&v90;
              if (dword_1009F7F98 != -1 || (v63 = _LogCategory_Initialize(), double v54 = *(double *)&v90, v63))
              {
                v55 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v54];
                id v56 = [v55 description];
                id v57 = [v56 UTF8String];
                uint64_t v70 = v88;
                v71 = v50;
                double v68 = v53 - Current;
                double v69 = *(double *)&v89;
                id v67 = v57;
                double v66 = v54;
                LogPrintF_safe();

                double v54 = *(double *)&v90;
              }
            }
          }
          else
          {
            if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
            {
              v52 = "disabled";
              if (!v2->_prefSystemReferenceTimeDisabled) {
                v52 = "not available";
              }
              double v66 = *(double *)&v52;
              id v67 = v50;
              LogPrintF_safe();
            }
            double v54 = Current;
          }
          if ((v99 & 1) == 0) {
            unsigned __int8 v99 = v99 & 0xFE | v85;
          }
          double v87 = (double)((v54 + kCFAbsoluteTimeIntervalSince1970) / 7200.0) * 7200.0
              - kCFAbsoluteTimeIntervalSince1970;
          v58 = +[NSMutableData data];
          v59 = +[NSData dataWithBytes:"bleAdv22IauthTag" length:16];
          [v58 appendData:v59];

          v60 = +[NSData dataWithBytes:&v87 length:8];
          [v58 appendData:v60];

          v61 = +[NSData dataWithBytes:&v99 length:1];
          [v58 appendData:v61];

          [v58 appendData:v50];
          v62 = [(RPIdentity *)v2->_identitySelf authTagForData:v58 type:2 error:0];
          [v46 setNearbyInfoV2AuthIntegrityTagData:v62];
          if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v70 = v99;
            double v69 = v87;
            id v67 = v62;
            *(void *)&double v68 = ((v54 + kCFAbsoluteTimeIntervalSince1970) / 7200.0);
            double v66 = *(double *)&v50;
            LogPrintF_safe();
          }

          v2 = v82;
        }
        else
        {
          unsigned int v49 = [v46 nearbyInfoV2DecryptedFlags];

          if (v49) {
            goto LABEL_67;
          }
        }
      }
      if (v41 != (id)++v45) {
        continue;
      }
      break;
    }
    id v64 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
    id v41 = v64;
    if (v64) {
      continue;
    }
    break;
  }
  unsigned int v3 = v73;
  BOOL v4 = v77;
LABEL_94:
  BOOL v6 = v72;
LABEL_96:

LABEL_98:
LABEL_99:

  return v6;
}

- (BOOL)_bleAdvertiserUpdateSpatialInteraction
{
  if (!self->_bleAdvertiserSpatialValid)
  {
    BOOL v4 = self->_bleAdvertiser;
    if (!v4)
    {
      BOOL v2 = 0;
      goto LABEL_126;
    }
    id v5 = [(CBStackAddressMonitor *)self->_addressMonitor nonConnectableAddressData];
    BOOL v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(CBStackAddressMonitor *)self->_addressMonitor fakeNonConnectableAddressData];
    }
    int v8 = v7;

    if ([(CBDaemonServer *)self supportsNCSecondaryAdvertisingInstance])
    {
      uint64_t v9 = [(CBStackAddressMonitor *)self->_addressMonitor nonConnectableSecondaryAddressData];

      int v8 = (void *)v9;
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v10 = self->_xpcConnections;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v91 objects:v98 count:16];
    v80 = self;
    v81 = v8;
    unsigned int v84 = v10;
    if (v11)
    {
      id v12 = v11;
      unsigned __int8 v79 = v4;
      char v85 = 0;
      uint64_t v86 = 0;
      uint64_t v87 = 0;
      unsigned int v88 = 0;
      v82 = 0;
      unsigned int v83 = 0;
      uint64_t v13 = *(void *)v92;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v92 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = [*(id *)(*((void *)&v91 + 1) + 8 * i) activatedSpatialInteractionSession];
          BOOL v16 = v15;
          if (v15)
          {
            unsigned int v17 = [v15 controlFlags];
            if ((v17 & 8) == 0)
            {
              unsigned int v18 = v17;
              if ([v8 length] == (id)6)
              {
                BOOL v19 = [v16 identifierData];
                if ([v19 length] == (id)3)
                {
                  long long v20 = [v16 irkData];
                  if ([v20 length] == (id)16)
                  {
                    int v21 = [v16 advertiseRate];
                    if (v21 <= (int)v87) {
                      int v22 = v87;
                    }
                    else {
                      int v22 = v21;
                    }
                    LODWORD(v87) = v22;
                    if ((v18 & 0x400) == 0)
                    {
                      char v97 = 0;
                      uint64_t v96 = 0;
                      id v23 = [v8 bytes];
                      __int16 v24 = v23[2];
                      LODWORD(v96) = *(_DWORD *)v23;
                      WORD2(v96) = v24;
                      id v25 = v19;
                      int v26 = [v25 bytes];
                      char v27 = v26[2];
                      HIWORD(v96) = *(_WORD *)v26;
                      char v97 = v27;
                      [v20 bytes];
                      unint64_t v95 = bswap64(SipHash());
                      id v28 = [objc_alloc((Class)NSData) initWithBytes:&v95 length:3];
                      id v29 = v85;
                      if (!v85) {
                        id v29 = objc_alloc_init((Class)NSMutableArray);
                      }
                      char v85 = v29;
                      [v29 addObject:v25];
                      id v30 = v88;
                      if (!v88) {
                        id v30 = objc_alloc_init((Class)NSMutableArray);
                      }
                      unsigned int v88 = v30;
                      [v30 addObject:v28];
                    }
                    v31 = [v16 uwbConfigData];
                    id v32 = [v31 length];
                    if ((v18 & 2) != 0 && v32)
                    {
                      id v33 = v31;

                      v82 = v33;
                    }
                    id v34 = [v16 presenceConfigData];
                    id v35 = [v34 length];
                    if ((v18 & 0x4000) != 0 && v35)
                    {
                      id v36 = v34;

                      unsigned int v83 = v36;
                      int v8 = v81;
                    }
                    LOBYTE(v86) = ((v18 & 0x3E0) != 0) | v86;
                    int v37 = HIDWORD(v86) | 0x20;
                    if ((v18 & 0x4000) == 0) {
                      int v37 = HIDWORD(v86);
                    }
                    int v38 = (v18 >> 7) & 0x10 | v37;
                    if ((v18 & 2) != 0) {
                      v38 |= 8u;
                    }
                    HIDWORD(v86) = v38;
                    HIDWORD(v87) |= [v16 enableEPAForLEAdvertisement];
                    id v39 = [v88 count];

                    if ((unint64_t)v39 > 2)
                    {

                      goto LABEL_48;
                    }
                    uint64_t v10 = v84;
                  }
                }
              }
            }
          }
        }
        id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v91 objects:v98 count:16];
        if (v12) {
          continue;
        }
        break;
      }

LABEL_48:
      BOOL v4 = v79;
      BOOL v43 = v82;
      uint64_t v42 = v83;
      int v41 = HIDWORD(v86);
      uint64_t v40 = v87;
      if ((v86 & 1) == 0 || !v80->_identitySelf || [v8 length] != (id)6)
      {
LABEL_61:
        unsigned int v46 = [v88 count] & 3 | v41;
        if (v43) {
          LOBYTE(v46) = v46 | 0x40;
        }
        if (v42) {
          unsigned __int8 v47 = v46 | 0x80;
        }
        else {
          unsigned __int8 v47 = v46;
        }
        unsigned int v48 = [(CBAdvertiserDaemon *)v4 spatialInteractionAdvertiseRate];
        BOOL v2 = v40 != v48;
        if (v40 != v48) {
          [(CBAdvertiserDaemon *)v4 setSpatialInteractionAdvertiseRate:v40];
        }
        if (v47 != [(CBAdvertiserDaemon *)v4 spatialInteractionFlags])
        {
          [(CBAdvertiserDaemon *)v4 setSpatialInteractionFlags:v47];
          BOOL v2 = 1;
        }
        if ([(CBAdvertiserDaemon *)v4 spatialInteractionConfigFlags] != (v42 != 0))
        {
          [(CBAdvertiserDaemon *)v4 setSpatialInteractionConfigFlags:v42 != 0];
          BOOL v2 = 1;
        }
        unsigned int v49 = [(CBAdvertiserDaemon *)v4 spatialInteractionIdentifiers];
        id v50 = v88;
        id v51 = v49;
        v52 = v51;
        if (v50 == v51)
        {

          goto LABEL_79;
        }
        if ((v50 == 0) != (v51 != 0))
        {
          unsigned __int8 v53 = [v50 isEqual:v51];

          if (v53)
          {
LABEL_79:
            double v54 = [(CBAdvertiserDaemon *)v4 spatialInteractionUWBConfigData];
            id v55 = v43;
            id v56 = v54;
            unint64_t v89 = v52;
            if (v55 == v56)
            {

              goto LABEL_86;
            }
            id v57 = v56;
            if ((v43 == 0) != (v56 != 0))
            {
              unsigned __int8 v58 = [v55 isEqual:v56];

              if (v58)
              {
LABEL_86:
                v59 = [(CBAdvertiserDaemon *)v4 spatialInteractionPresenceConfigData];
                id v60 = v42;
                id v61 = v59;
                if (v60 == v61)
                {

                  goto LABEL_93;
                }
                v62 = v61;
                if ((v42 == 0) != (v61 != 0))
                {
                  unsigned __int8 v63 = [v60 isEqual:v61];

                  if (v63)
                  {
LABEL_93:
                    if ((BYTE4(v87) & 1) != [(CBAdvertiserDaemon *)v4 advertiserEnableEPA])
                    {
                      -[CBAdvertiserDaemon setAdvertiserEnableEPA:](v4, "setAdvertiserEnableEPA:");
                      BOOL v2 = 1;
                    }
                    id v64 = v89;
                    if ([v50 count])
                    {
                      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
                      {
                        v65 = CUPrintNSDataAddress();
                        double v66 = CUPrintFlags32();
                        id v67 = CUPrintNSObjectOneLine();
                        v78 = CUPrintNSObjectOneLine();
                        LogPrintF_safe();

                        id v64 = v89;
                      }
                      bleAdvertiserSpatialLingerTimer = v80->_bleAdvertiserSpatialLingerTimer;
                      if (bleAdvertiserSpatialLingerTimer)
                      {
                        if (dword_1009F7F98 >= 31)
                        {
                          uint64_t v70 = bleAdvertiserSpatialLingerTimer;
                          int v8 = v81;
                        }
                        else
                        {
                          if (dword_1009F7F98 != -1 || _LogCategory_Initialize()) {
                            LogPrintF_safe();
                          }
                          uint64_t v70 = v80->_bleAdvertiserSpatialLingerTimer;
                          int v8 = v81;
                          if (!v70) {
                            goto LABEL_125;
                          }
                        }
                        dispatch_source_cancel(v70);
                        v71 = v80->_bleAdvertiserSpatialLingerTimer;
                        v80->_bleAdvertiserSpatialLingerTimer = 0;
                      }
                      else
                      {
                        int v8 = v81;
                      }
LABEL_125:
                      v80->_bleAdvertiserSpatialValid = 1;

LABEL_126:
                      return v2;
                    }
                    if ([v89 count] && !v80->_bleAdvertiserSpatialLingerTimer)
                    {
                      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
                      {
                        uint64_t v77 = 4;
                        LogPrintF_safe();
                      }
                      -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v4, "setSpatialInteractionIdentifiers:", &__NSArray0__struct, v77);
                      dispatch_source_t v72 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v80->_dispatchQueue);
                      v73 = v80->_bleAdvertiserSpatialLingerTimer;
                      v80->_bleAdvertiserSpatialLingerTimer = (OS_dispatch_source *)v72;
                      char v74 = v72;

                      handler[0] = _NSConcreteStackBlock;
                      handler[1] = 3221225472;
                      handler[2] = sub_10006B828;
                      handler[3] = &unk_100997230;
                      handler[4] = v80;
                      dispatch_source_set_event_handler(v74, handler);
                      CUDispatchTimerSet();
                      dispatch_activate(v74);

                      id v64 = v89;
                      goto LABEL_125;
                    }
                    if (![(CBAdvertiserDaemon *)v4 spatialInteractionFlags])
                    {
                      double v68 = [(CBAdvertiserDaemon *)v4 spatialInteractionIdentifiers];
                      if (v68
                        || ([(CBAdvertiserDaemon *)v4 spatialInteractionUWBConfigData],
                            (double v68 = objc_claimAutoreleasedReturnValue()) != 0))
                      {
                      }
                      else
                      {
                        unsigned __int8 v76 = [(CBAdvertiserDaemon *)v4 spatialInteractionPresenceConfigData];

                        if (!v76) {
                          goto LABEL_125;
                        }
                      }
                    }
                    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
                      LogPrintF_safe();
                    }
                    [(CBAdvertiserDaemon *)v4 setSpatialInteractionFlags:0];
                    [(CBAdvertiserDaemon *)v4 setSpatialInteractionIdentifiers:0];
                    [(CBAdvertiserDaemon *)v4 setSpatialInteractionUWBConfigData:0];
                    [(CBAdvertiserDaemon *)v4 setSpatialInteractionPresenceConfigData:0];
                    BOOL v2 = 1;
                    goto LABEL_125;
                  }
                }
                else
                {
                }
                [(CBAdvertiserDaemon *)v4 setSpatialInteractionPresenceConfigData:v60];
                BOOL v2 = 1;
                goto LABEL_93;
              }
            }
            else
            {
            }
            [(CBAdvertiserDaemon *)v4 setSpatialInteractionUWBConfigData:v55];
            BOOL v2 = 1;
            goto LABEL_86;
          }
        }
        else
        {
        }
        [(CBAdvertiserDaemon *)v4 setSpatialInteractionIdentifiers:v50];
        BOOL v2 = 1;
        goto LABEL_79;
      }
      unsigned int v84 = [(RPIdentity *)v80->_identitySelf authTagForData:v8 type:2 error:0];
      if (v84)
      {
        if ((unint64_t)[v88 count] >= 3)
        {
          do
            [v88 removeLastObject];
          while ((unint64_t)[v88 count] > 2);
        }
        if ((unint64_t)[v85 count] >= 3)
        {
          do
            [v85 removeLastObject];
          while ((unint64_t)[v85 count] > 2);
        }
        id v44 = v85;
        if (!v85) {
          id v44 = objc_alloc_init((Class)NSMutableArray);
        }
        char v85 = v44;
        [v44 insertObject:v8 atIndex:0];
        id v45 = v88;
        if (!v88) {
          id v45 = objc_alloc_init((Class)NSMutableArray);
        }
        unsigned int v88 = v45;
        [v45 insertObject:v84 atIndex:0];
      }
    }
    else
    {
      uint64_t v40 = 0;
      int v41 = 0;
      BYTE4(v87) = 0;
      uint64_t v42 = 0;
      BOOL v43 = 0;
      char v85 = 0;
      unsigned int v88 = 0;
    }

    goto LABEL_61;
  }
  return 0;
}

- (void)_bleAddressMonitorEnsureStarted
{
  if (!self->_addressMonitor)
  {
    p_addressMonitor = &self->_addressMonitor;
    [(CBStackAdaptor *)self->_stackAdaptor addressMonitorClass];
    id v4 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)p_addressMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006B114;
    v7[3] = &unk_100997208;
    id v5 = v4;
    id v8 = v5;
    uint64_t v9 = self;
    [v5 setAddressChangedHandler:v7];
    [v5 activate];
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      BOOL v6 = CUDescriptionWithLevel();
      LogPrintF_safe();
    }
    -[CBDaemonServer _bleAdvertiserAddressChanged:](self, "_bleAdvertiserAddressChanged:", 1, v6);
    [(CBDaemonServer *)self _updateSelfAuthTag];
  }
}

- (void)_accessoryDaemonEnsureStarted
{
  if (!self->_accessoryDaemon)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned int v3 = objc_alloc_init(CBAccessoryDaemon);
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = v3;

    [(CBAccessoryDaemon *)self->_accessoryDaemon setDispatchQueue:self->_dispatchQueue];
    [(CBAccessoryDaemon *)self->_accessoryDaemon setDaemonServer:self];
    id v5 = self->_accessoryDaemon;
    [(CBAccessoryDaemon *)v5 activate];
  }
}

- (void)xpcConnectionInvalidated:(id)a3
{
  xpcConnections = self->_xpcConnections;
  id v5 = a3;
  [(NSMutableSet *)xpcConnections removeObject:v5];
  [(CBDaemonServer *)self remoteDeregisterConnection:v5];

  [(CBDaemonServer *)self scheduleUpdateImmediate:0];
}

- (void)scheduleUpdateImmediate:(BOOL)a3
{
  if (a3)
  {
    [(CBDaemonServer *)self _update];
  }
  else
  {
    block[5] = v3;
    block[6] = v4;
    if (!self->_updatePending)
    {
      self->_updatePending = 1;
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004D240;
      block[3] = &unk_100997230;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
}

- (void)remoteDeregisterConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_remoteConnectionMap allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v10, v12, v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          [(NSMutableDictionary *)self->_remoteConnectionMap setObject:0 forKeyedSubscript:v10];
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v12 = v10;
            id v13 = v4;
            LogPrintF_safe();
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (BOOL)prefEnforceApprovedList
{
  return self->_prefEnforceApprovedList;
}

- (void)_stackBLEScannerEnsureStarted
{
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  int v41 = self;
  id obj = self->_xpcConnections;
  id v2 = [(NSMutableSet *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v2)
  {
    id v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v61;
    uint64_t v43 = *(void *)v61;
    do
    {
      id v6 = 0;
      id v44 = v3;
      do
      {
        if (*(void *)v61 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v6);
        uint64_t v8 = [v7 activatedDiscovery:v41];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = [v8 disabledPending];
          if (v10 != [v9 disabledActive])
          {
            if (!v4)
            {
              id v4 = [(NSMutableDictionary *)v41->_deviceMap allValues];
            }
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v4 = v4;
            id v11 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v57;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v57 != v13) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                  if (v10) {
                    [v7 reportDeviceLost:v15];
                  }
                  else {
                    [v7 reportDeviceFound:v15];
                  }
                }
                id v12 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
              }
              while (v12);
            }

            [v9 setDisabledActive:v10];
            uint64_t v5 = v43;
            id v3 = v44;
          }
        }

        id v6 = (char *)v6 + 1;
      }
      while (v6 != v3);
      id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  long long v17 = v41;
  unsigned int v18 = v41->_stackBLEScanner;
  if (!v18)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAdaptor *)v41->_stackAdaptor bleScannerClass];
    id v19 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&v17->_stackBLEScanner, v19);
    [v19 setDispatchQueue:v17->_dispatchQueue];
    [v19 setIdentifier:@"CBDaemon"];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10006BCA0;
    v53[3] = &unk_100997370;
    id v20 = v19;
    id v54 = v20;
    id v55 = v17;
    [v20 setDeviceFoundHandler:v53];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10006BCBC;
    v50[3] = &unk_100997370;
    id v21 = v20;
    id v51 = v21;
    v52 = v17;
    [v21 setDeviceLostHandler:v50];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10006BCD8;
    v47[3] = &unk_100997C18;
    unsigned int v18 = (CBStackBLEScanner *)v21;
    unsigned int v48 = v18;
    unsigned int v49 = v17;
    [(CBStackBLEScanner *)v18 setDevicesBufferedHandler:v47];
  }
  int v22 = [(CBStackBLEScanner *)v18 discoveryArray];
  if (v22)
  {

LABEL_33:
    int v23 = 0;
    goto LABEL_36;
  }
  if (![(NSMutableArray *)v17->_bleDiscoveryArray count]) {
    goto LABEL_33;
  }
  [(CBStackBLEScanner *)v18 setDiscoveryArray:v17->_bleDiscoveryArray];
  int v23 = 1;
LABEL_36:
  if (([(CUSystemMonitor *)v17->_systemMonitor screenOn] & 1) == 0)
  {
    if (![(CBStackBLEScanner *)v18 screenOn]) {
      goto LABEL_50;
    }
    [(CBStackBLEScanner *)v18 setScreenOn:0];
    goto LABEL_49;
  }
  __int16 v24 = +[BLSBacklight sharedBacklight];
  if ([v24 isAlwaysOnEnabled]) {
    BOOL v25 = v42->_screenUndimmed != 0;
  }
  else {
    BOOL v25 = 1;
  }

  long long v17 = v42;
  if (v25 == [(CBStackBLEScanner *)v18 screenOn]) {
    goto LABEL_50;
  }
  [(CBStackBLEScanner *)v18 setScreenOn:v25];
  if (!v25 || !v42->_stackBLEProxControlAnyDeviceClose)
  {
LABEL_49:
    int v23 = 1;
    goto LABEL_50;
  }
  sub_1005FE4A8(0);
  int v26 = sub_1005FE5D8();
  uint64_t v27 = sub_1005FE584(0);
  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v28 = v27;
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HandoffScanStart", "Screen ON", buf, 2u);
    }
  }

  int v23 = 1;
  long long v17 = v42;
LABEL_50:
  id v29 = v17->_selfAuthTag;
  id v30 = [(CBStackBLEScanner *)v18 selfAuthTag];
  v31 = v29;
  id v32 = v30;
  if (v31 == v32)
  {

    goto LABEL_57;
  }
  id v33 = v32;
  if ((v31 == 0) == (v32 != 0))
  {

    goto LABEL_56;
  }
  unsigned __int8 v34 = [(NSData *)v31 isEqual:v32];

  if ((v34 & 1) == 0)
  {
LABEL_56:
    [(CBStackBLEScanner *)v18 setSelfAuthTag:v31];
    int v23 = 1;
  }
LABEL_57:
  id v35 = v42->_selfAuthTagNonConnectable;
  id v36 = [(CBStackBLEScanner *)v18 selfAuthTagNonConnectable];
  int v37 = v35;
  int v38 = v36;
  if (v37 == v38)
  {

    goto LABEL_62;
  }
  id v39 = v38;
  if ((v37 == 0) != (v38 != 0))
  {
    unsigned __int8 v40 = [(NSData *)v37 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_65;
    }
LABEL_62:
    if (!v23) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }

LABEL_65:
  [(CBStackBLEScanner *)v18 setSelfAuthTagNonConnectable:v37];
LABEL_66:
  [(CBStackBLEScanner *)v18 activate];
LABEL_67:
}

- (BOOL)_stackClassicScannerShouldRun
{
  if ([(CBDaemonServer *)self _firstUnlockedOrAllowedBefore]
    && [(CBStackController *)self->_stackController poweredOn])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_xpcConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) activatedDiscovery:v10];
          unint64_t v8 = (unint64_t)[v7 discoveryFlags];

          if ((v8 & 0x4000000000000) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (CBDaemonServer)initWithCBStackAdaptor:(id)a3
{
  id v5 = a3;
  if (objc_opt_class()
    && (v12.receiver = self,
        v12.super_class = (Class)CBDaemonServer,
        id v6 = [(CBDaemonServer *)&v12 init],
        (self = v6) != 0))
  {
    v6->_deviceSetupStateToken = -1;
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("CBDaemon", v7);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v8;

    self->_identitiesNotifyToken = -1;
    self->_odeonNotifyToken = -1;
    self->_prefsChangedNotifyToken = -1;
    self->_screenDimmedChangeNotifyToken = -1;
    self->_screenUndimmedChangeNotifyToken = -1;
    objc_storeStrong((id *)&self->_stackAdaptor, a3);
    self->_systemFlagsNotifyToken = -1;
    self->_coexNotificationSetup = 0;
    *(void *)&self->_userCloudDataChangedNotifyToken = -1;
    objc_storeStrong((id *)&gCBDaemonServer, self);
    self = self;
    long long v10 = self;
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (void)descriptionInternalDebug
{
  if (IsAppleInternalBuild())
  {
    id v3 = sub_1000663D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "---------------- CBDaemonServer ----------------", v5, 2u);
    }

    id v4 = [(CBDaemonServer *)self descriptionWithLevel:5];
    [v4 enumerateLinesUsingBlock:&stru_1009979B0];
  }
}

- (id)description
{
  return [(CBDaemonServer *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL v4 = a3 < 0xBu;
  if (a3 >= 0xBu) {
    int v5 = 60;
  }
  else {
    int v5 = 30;
  }
  if (a3 >= 0xBu) {
    int v6 = 30;
  }
  else {
    int v6 = 20;
  }
  unsigned int v137 = a3;
  if (a3 < 6u) {
    int v5 = 5;
  }
  int v131 = v5;
  if (a3 >= 6u) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 5;
  }
  uint64_t v205 = 0;
  v206 = &v205;
  uint64_t v207 = 0x3032000000;
  v208 = sub_10004CECC;
  v209 = sub_10004CD38;
  id v210 = 0;
  id obj = 0;
  mach_continuous_time();
  UpTicksToSeconds();
  unint64_t v8 = CUPrintDuration64();
  mach_absolute_time();
  UpTicksToSeconds();
  uint64_t v9 = CUPrintDuration64();
  id v10 = [(NSMutableDictionary *)self->_identityMapSameAccount count];
  NSUInteger v11 = [(NSArray *)self->_identityArray count];
  id v12 = [(NSMutableDictionary *)self->_identifyDevices count];
  long long v13 = "yes";
  if (self->_odeonActive) {
    long long v14 = "yes";
  }
  else {
    long long v14 = "no";
  }
  if (!self->_wifiCritical) {
    long long v13 = "no";
  }
  unsigned int deviceSetupState = self->_deviceSetupState;
  if (deviceSetupState > 9)
  {
    if (deviceSetupState == 10)
    {
      long long v16 = "NotStarted";
      goto LABEL_27;
    }
    if (deviceSetupState == 20)
    {
      long long v16 = "Complete";
      goto LABEL_27;
    }
  }
  else
  {
    if (!self->_deviceSetupState)
    {
      long long v16 = "Unknown";
      goto LABEL_27;
    }
    if (deviceSetupState == 1)
    {
      long long v16 = "FrameworkUnavailable";
      goto LABEL_27;
    }
  }
  long long v16 = "?";
LABEL_27:
  v128 = v13;
  v129 = v16;
  id v126 = v12;
  v127 = v14;
  id v124 = v10;
  v114 = v8;
  double v119 = *(double *)&v9;
  NSAppendPrintF_safe();
  objc_storeStrong(&v210, obj);

  long long v17 = self->_selfAuthTag;
  if (v17)
  {
    unsigned int v18 = (id *)(v206 + 5);
    id v203 = (id)v206[5];
    v114 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    objc_storeStrong(v18, v203);
  }
  id v19 = self->_selfAuthTagNonConnectable;
  if (v19)
  {
    id v20 = (id *)(v206 + 5);
    id v202 = (id)v206[5];
    v114 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    objc_storeStrong(v20, v202);
  }
  if (IsAppleInternalBuild())
  {
    unint64_t v21 = ((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970) / 7200.0);
    int v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", -(kCFAbsoluteTimeIntervalSince1970 - (double)v21 * 7200.0), v114, *(void *)&v119, v124, v11, v126, v127, v128, v129);
    int v23 = +[NSDateFormatter localizedStringFromDate:v22 dateStyle:1 timeStyle:1];

    __int16 v24 = (id *)(v206 + 5);
    id v201 = (id)v206[5];
    id v124 = v23;
    double v119 = -(kCFAbsoluteTimeIntervalSince1970 - (double)v21 * 7200.0);
    v114 = (void *)v21;
    NSAppendPrintF_safe();
    objc_storeStrong(v24, v201);
  }
  BOOL v25 = (id *)(v206 + 5);
  id v200 = (id)v206[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v25, v200);
  if (self->_assertionFlags)
  {
    int v26 = (id *)(v206 + 5);
    id v199 = (id)v206[5];
    v114 = CUPrintFlags32();
    NSAppendPrintF_safe();
    objc_storeStrong(v26, v199);
  }
  uint64_t v27 = self->_bleAdvertiser;
  if (v27)
  {
    os_signpost_id_t v28 = (id *)(v206 + 5);
    id v198 = (id)v206[5];
    v114 = CUDescriptionWithLevel();
    NSAppendPrintF_safe();
    objc_storeStrong(v28, v198);
  }
  v134 = self->_accessoryDaemon;
  if (v134) {
    BOOL v29 = v137 < 0xB;
  }
  else {
    BOOL v29 = 1;
  }
  if (!v29)
  {
    id v30 = (id *)(v206 + 5);
    id v197 = (id)v206[5];
    v114 = v134;
    NSAppendPrintF_safe();
    objc_storeStrong(v30, v197);
  }
  v135 = self->_extensionsDaemon;
  if (v137 >= 0xB && v135)
  {
    v31 = (id *)(v206 + 5);
    id v196 = (id)v206[5];
    v114 = v135;
    NSAppendPrintF_safe();
    objc_storeStrong(v31, v196);
  }
  uint64_t v32 = +[CBMetricsDaemon sharedCBMetricsDaemon];
  id v33 = (void *)v32;
  if (v32)
  {
    unsigned __int8 v34 = (id *)(v206 + 5);
    id v195 = (id)v206[5];
    v115 = (char *)v32;
    NSAppendPrintF_safe();
    objc_storeStrong(v34, v195);
  }

  id v35 = self->_addressMonitor;
  if (v35)
  {
    id v36 = (id *)(v206 + 5);
    id v194 = (id)v206[5];
    CUDescriptionWithLevel();
    v115 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v36, v194);
  }
  v133 = self->_stackBLEScanner;
  if (v133) {
    BOOL v37 = v137 < 0xB;
  }
  else {
    BOOL v37 = 1;
  }
  if (!v37)
  {
    int v38 = (id *)(v206 + 5);
    id v193 = (id)v206[5];
    v115 = (char *)v133;
    NSAppendPrintF_safe();
    objc_storeStrong(v38, v193);
  }
  v136 = self->_stackClassicScanner;
  if (v137 >= 0xB && v136)
  {
    id v39 = (id *)(v206 + 5);
    id v192 = (id)v206[5];
    v115 = (char *)v136;
    NSAppendPrintF_safe();
    objc_storeStrong(v39, v192);
  }
  unsigned __int8 v40 = self->_stackController;
  if (v40)
  {
    int v41 = (id *)(v206 + 5);
    id v191 = (id)v206[5];
    CUDescriptionWithLevel();
    v115 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v41, v191);
  }
  v132 = self->_stackDeviceMonitor;
  if (v132) {
    BOOL v42 = v137 < 0xB;
  }
  else {
    BOOL v42 = 1;
  }
  if (!v42)
  {
    uint64_t v43 = (id *)(v206 + 5);
    id v190 = (id)v206[5];
    v115 = (char *)v132;
    NSAppendPrintF_safe();
    objc_storeStrong(v43, v190);
  }
  id v44 = self->_remoteClient;
  id v45 = v44;
  if (v44)
  {
    unsigned int v46 = (id *)(v206 + 5);
    id v189 = (id)v206[5];
    unsigned __int8 v47 = [(RPCompanionLinkClient *)v44 localDevice];
    unsigned int v48 = [v47 idsDeviceIdentifier];
    unsigned int v49 = [(RPCompanionLinkClient *)v45 activeDevices];
    v120 = v48;
    id v125 = [v49 count];
    v115 = "";
    NSAppendPrintF_safe();
    objc_storeStrong(v46, v189);
  }
  id v50 = self->_remoteServer;
  if (v50)
  {
    id v51 = v50;
    v52 = (id *)(v206 + 5);
    id v188 = (id)v206[5];
    unsigned __int8 v53 = ", ";
    if (!v45) {
      unsigned __int8 v53 = "";
    }
    v115 = (char *)v53;
    NSAppendPrintF_safe();
    objc_storeStrong(v52, v188);

    goto LABEL_71;
  }
  if (v45)
  {
LABEL_71:
    id v54 = (id *)(v206 + 5);
    id v187 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v54, v187);
  }
  if (v134 && v137 <= 0xA)
  {
    id v55 = (id *)(v206 + 5);
    id v186 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v55, v186);
    long long v56 = (id *)(v206 + 5);
    id v185 = (id)v206[5];
    CUDescriptionWithLevel();
    v115 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v56, v185);
  }
  if (v135) {
    BOOL v57 = v137 > 0xA;
  }
  else {
    BOOL v57 = 1;
  }
  if (!v57)
  {
    long long v58 = (id *)(v206 + 5);
    id v184 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v58, v184);
    long long v59 = (id *)(v206 + 5);
    id v183 = (id)v206[5];
    CUDescriptionWithLevel();
    v115 = (char *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v59, v183);
  }
  if (v133) {
    BOOL v60 = v137 > 0xA;
  }
  else {
    BOOL v60 = 1;
  }
  if (v60)
  {
    if (v136) {
      BOOL v61 = v137 > 0xA;
    }
    else {
      BOOL v61 = 1;
    }
    if (v61)
    {
      if (v132) {
        BOOL v62 = v137 > 0xA;
      }
      else {
        BOOL v62 = 1;
      }
      if (v62)
      {
        long long v63 = self->_whbDiscoveryDaemon;
        if (!v63)
        {
          BOOL v4 = 0;
          goto LABEL_109;
        }
LABEL_107:
        dispatch_source_t v72 = (id *)(v206 + 5);
        id v176 = (id)v206[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v72, v176);
        goto LABEL_108;
      }
      goto LABEL_103;
    }
LABEL_96:
    double v66 = (id *)(v206 + 5);
    id v180 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v66, v180);
    goto LABEL_97;
  }
  id v64 = (id *)(v206 + 5);
  id v182 = (id)v206[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v64, v182);
  v65 = (id *)(v206 + 5);
  id v181 = (id)v206[5];
  CUDescriptionWithLevel();
  v115 = (char *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong(v65, v181);

  if (!v136) {
    goto LABEL_98;
  }
  if (v137 >= 0xB) {
    goto LABEL_96;
  }
LABEL_97:
  id v67 = (id *)(v206 + 5);
  id v179 = (id)v206[5];
  CUDescriptionWithLevel();
  v115 = (char *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong(v67, v179);

LABEL_98:
  if (v132) {
    BOOL v68 = v137 > 0xA;
  }
  else {
    BOOL v68 = 1;
  }
  if (!v68)
  {
    if (v137 < 0xB)
    {
LABEL_104:
      uint64_t v70 = (id *)(v206 + 5);
      id v177 = (id)v206[5];
      CUDescriptionWithLevel();
      v115 = (char *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v70, v177);

      goto LABEL_105;
    }
LABEL_103:
    double v69 = (id *)(v206 + 5);
    id v178 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v69, v178);
    goto LABEL_104;
  }
LABEL_105:
  v71 = self->_whbDiscoveryDaemon;
  if (!v71) {
    goto LABEL_109;
  }
  long long v63 = v71;
  if (v137 >= 0xB) {
    goto LABEL_107;
  }
LABEL_108:
  v73 = (id *)(v206 + 5);
  id v175 = (id)v206[5];
  CUDescriptionWithLevel();
  v115 = (char *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong(v73, v175);

LABEL_109:
  char v74 = (char *)[(NSMutableDictionary *)self->_deviceMap count];
  if (v74)
  {
    if (!v4)
    {
      v75 = (id *)(v206 + 5);
      id v174 = (id)v206[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v75, v174);
    }
    unsigned __int8 v76 = (id *)(v206 + 5);
    id v173 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v76, v173);
    uint64_t v169 = 0;
    v170 = &v169;
    uint64_t v171 = 0x2020000000;
    uint64_t v172 = 0;
    deviceMap = self->_deviceMap;
    v166[0] = _NSConcreteStackBlock;
    v166[1] = 3221225472;
    v166[2] = sub_10006791C;
    v166[3] = &unk_1009979D8;
    v166[4] = &v205;
    v166[5] = &v169;
    int v167 = v131;
    int v168 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v166, v74);
    unint64_t v78 = v170[3];
    BOOL v79 = (unint64_t)v74 >= v78;
    v80 = &v74[-v78];
    if (v80 != 0 && v79)
    {
      v81 = (id *)(v206 + 5);
      id v165 = (id)v206[5];
      v116 = v80;
      v121 = v74;
      NSAppendPrintF_safe();
      objc_storeStrong(v81, v165);
    }
    v82 = (id *)(v206 + 5);
    id v164 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v82, v164);
    _Block_object_dispose(&v169, 8);
    BOOL v4 = 1;
  }
  id v83 = [(NSMutableOrderedSet *)self->_lostDevicesForCBSpatial count];
  if (v83)
  {
    unsigned int v84 = (id *)(v206 + 5);
    id v163 = (id)v206[5];
    id v117 = v83;
    NSAppendPrintF_safe();
    objc_storeStrong(v84, v163);
    lostDevicesForCBSpatial = self->_lostDevicesForCBSpatial;
    v161[0] = _NSConcreteStackBlock;
    v161[1] = 3221225472;
    v161[2] = sub_1000679C8;
    v161[3] = &unk_100997A00;
    v161[4] = &v205;
    int v162 = v131;
    -[NSMutableOrderedSet enumerateObjectsUsingBlock:](lostDevicesForCBSpatial, "enumerateObjectsUsingBlock:", v161, v117);
    uint64_t v86 = (id *)(v206 + 5);
    id v160 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v86, v160);
    BOOL v4 = 1;
  }
  id v87 = [(NSMutableSet *)self->_xpcConnections count];
  if (v87)
  {
    if (!v4)
    {
      unsigned int v88 = (id *)(v206 + 5);
      id v159 = (id)v206[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v88, v159);
    }
    unint64_t v89 = (id *)(v206 + 5);
    id v158 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v89, v158);
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    unint64_t v90 = self->_xpcConnections;
    long long v91 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v154, v214, 16, v87);
    if (v91)
    {
      uint64_t v92 = *(void *)v155;
      do
      {
        for (i = 0; i != v91; ++i)
        {
          if (*(void *)v155 != v92) {
            objc_enumerationMutation(v90);
          }
          long long v94 = (id *)(v206 + 5);
          id v153 = (id)v206[5];
          v118 = CUDescriptionWithLevel();
          NSAppendPrintF_safe();
          objc_storeStrong(v94, v153);

          if (v7 > 0x14)
          {
            unint64_t v95 = (id *)(v206 + 5);
            id v152 = (id)v206[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v95, v152);
          }
        }
        long long v91 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v154, v214, 16, v118);
      }
      while (v91);
    }

    uint64_t v96 = (id *)(v206 + 5);
    id v151 = (id)v206[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v96, v151);
    BOOL v4 = 1;
  }
  if (v137 <= 0x14)
  {
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    char v97 = (void *)CFPrefs_CopyKeys();
    int v98 = 0;
    unsigned __int8 v99 = (char *)[v97 countByEnumeratingWithState:&v147 objects:v213 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v148;
      do
      {
        for (j = 0; j != v99; ++j)
        {
          if (*(void *)v148 != v100) {
            objc_enumerationMutation(v97);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v4)
            {
              v102 = (id *)(v206 + 5);
              id v146 = (id)v206[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v102, v146);
            }
            v103 = (void *)CFPrefs_CopyTypedValue();
            v104 = (id *)(v206 + 5);
            id v145 = (id)v206[5];
            v122 = CUPrintNSObjectOneLine();
            NSAppendPrintF_safe();
            objc_storeStrong(v104, v145);

            ++v98;
            BOOL v4 = 1;
          }
        }
        unsigned __int8 v99 = (char *)[v97 countByEnumeratingWithState:&v147 objects:v213 count:16];
      }
      while (v99);
    }

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    v211[0] = @"accessoryDaemonConnections";
    v211[1] = @"accessoryDaemonConnectSeconds";
    v211[2] = @"accessoryDaemonEnabled";
    v211[3] = @"adjustHIDSniffForStereoSCO";
    v211[4] = @"APLogCloudCollectionEnabled";
    v211[5] = @"authTagIntegrityCheckEnabled";
    v211[6] = @"bleAdvertising";
    v211[7] = @"bleScanning";
    v211[8] = @"btvcDefaultAdvRSSI";
    v211[9] = @"CBExtensionRSSIOverride";
    v211[10] = @"disableCentralSkipSniff";
    v211[11] = @"disabledExtensions";
    v211[12] = @"discoveryProxy";
    v211[13] = @"enableSpecialSniffTransitions";
    v211[14] = @"enforceApprovedExtensions";
    v211[15] = @"enforceApprovedList";
    v211[16] = @"extensionsEnabled";
    v211[17] = @"filterNearbyActionExtraData";
    v211[18] = @"intelligenceDaemonEnabled";
    v211[19] = @"memoryPressureFlags";
    v211[20] = @"move3PPLEMSToLegacyMode";
    v211[21] = @"move3PPLEMSToLegacyModeSerial";
    v211[22] = @"NCSecondaryAdvInstance";
    v211[23] = @"remoteClientEnabled";
    v211[24] = @"remoteServerEnabled";
    v211[25] = @"BluetoothAutoSeekKeyboard";
    v211[26] = @"BluetoothAutoSeekPointingDevice";
    v211[27] = @"SpatialSoundProfileAllowed";
    v211[28] = @"systemReferenceTimeDisabled";
    v211[29] = @"whbDiscoveryAlways";
    v211[30] = @"whbMaxLEConnections";
    v211[31] = @"wiproxAdvertising";
    v211[32] = @"UseLowLatencyGameController";
    v105 = +[NSArray arrayWithObjects:v211 count:33];
    id v106 = [v105 countByEnumeratingWithState:&v141 objects:v212 count:16];
    if (v106)
    {
      uint64_t v107 = *(void *)v142;
      id v138 = v105;
      do
      {
        for (k = 0; k != v106; k = (char *)k + 1)
        {
          if (*(void *)v142 != v107) {
            objc_enumerationMutation(v138);
          }
          v109 = (void *)CFPreferencesCopyValue(*(CFStringRef *)(*((void *)&v141 + 1) + 8 * (void)k), @"com.apple.Bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
          if (v109)
          {
            v110 = (id *)(v206 + 5);
            id v140 = (id)v206[5];
            v123 = CUPrintNSObjectOneLine();
            NSAppendPrintF_safe();
            objc_storeStrong(v110, v140);

            ++v98;
          }
        }
        v105 = v138;
        id v106 = [v138 countByEnumeratingWithState:&v141 objects:v212 count:16];
      }
      while (v106);
    }

    if (v98 >= 1)
    {
      v111 = (id *)(v206 + 5);
      id v139 = (id)v206[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v111, v139);
    }
  }
  id v112 = (id)v206[5];

  _Block_object_dispose(&v205, 8);

  return v112;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067AAC;
  block[3] = &unk_100997230;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_startTicksAwake = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  LogSetAppID();
  LogControl();
  [(CBDaemonServer *)self _stackControllerEnsureStarted];
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    int v5 = self->_xpcListener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004D254;
    handler[3] = &unk_100997A28;
    handler[4] = self;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (!self->_xpcPublisherConnections)
  {
    xpc_event_publisher_create();
    int v6 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
    xpcPublisherConnections = self->_xpcPublisherConnections;
    self->_xpcPublisherConnections = v6;

    v43[10] = _NSConcreteStackBlock;
    v43[11] = 3221225472;
    v43[12] = sub_100068468;
    v43[13] = &unk_100997A50;
    v43[14] = self;
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
  }
  if (!self->_xpcPublisherDiscovery)
  {
    xpc_event_publisher_create();
    unint64_t v8 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
    xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
    self->_xpcPublisherDiscovery = v8;

    v43[5] = _NSConcreteStackBlock;
    v43[6] = 3221225472;
    v43[7] = sub_100068524;
    v43[8] = &unk_100997A50;
    v43[9] = self;
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000685E0;
    v43[3] = &unk_100997AD8;
    v43[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, dispatchQueue, v43);
  }
  if (self->_screenDimmedChangeNotifyToken == -1)
  {
    NSUInteger v11 = self->_dispatchQueue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100068664;
    v42[3] = &unk_100997AD8;
    v42[4] = self;
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed", &self->_screenDimmedChangeNotifyToken, v11, v42);
  }
  if (self->_screenUndimmedChangeNotifyToken == -1)
  {
    id v12 = self->_dispatchQueue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000686F4;
    v41[3] = &unk_100997AD8;
    v41[4] = self;
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventUndimmed", &self->_screenUndimmedChangeNotifyToken, v12, v41);
  }
  long long v13 = self->_memoryPressureSource;
  if (!v13)
  {
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_memoryPressureSource, v14);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100068788;
    v38[3] = &unk_100997208;
    long long v13 = v14;
    id v39 = v13;
    unsigned __int8 v40 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, v38);
    dispatch_activate((dispatch_object_t)v13);
  }
  if (!self->_systemMonitor)
  {
    uint64_t v15 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v15;
    long long v17 = v15;

    [(CUSystemMonitor *)v17 setDispatchQueue:self->_dispatchQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100068884;
    v37[3] = &unk_100997230;
    v37[4] = self;
    [(CUSystemMonitor *)v17 setFirstUnlockHandler:v37];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10006888C;
    v36[3] = &unk_100997230;
    v36[4] = self;
    [(CUSystemMonitor *)v17 setScreenOnChangedHandler:v36];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100068898;
    v35[3] = &unk_100997230;
    v35[4] = self;
    [(CUSystemMonitor *)v17 setWifiStateChangedHandler:v35];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000688A4;
    v34[3] = &unk_100997208;
    v34[4] = self;
    v34[5] = v17;
    [(CUSystemMonitor *)v17 activateWithCompletion:v34];
  }
  if (self->_odeonNotifyToken == -1)
  {
    unsigned int v18 = self->_dispatchQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100068908;
    v33[3] = &unk_100997AD8;
    v33[4] = self;
    notify_register_dispatch("com.apple.airplay.isPlayingAmbientAudioChanged", &self->_odeonNotifyToken, v18, v33);
  }
  if (self->_systemFlagsNotifyToken == -1) {
    notify_register_check("com.apple.bluetooth.systemFlags", &self->_systemFlagsNotifyToken);
  }
  if (!self->_tipiObserving)
  {
    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:self selector:"_tipiChanged:" name:@"com.apple.bluetooth.TipiChanged" object:0];
    self->_tipiObserving = 1;
  }
  if (self->_userCloudDataChangedNotifyToken == -1)
  {
    id v20 = self->_dispatchQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000689F4;
    v32[3] = &unk_100997AD8;
    v32[4] = self;
    notify_register_dispatch("com.apple.bluetoothuser.cloudChanged", &self->_userCloudDataChangedNotifyToken, v20, v32);
  }
  if (self->_userDaemonStartedNotifyToken == -1)
  {
    unint64_t v21 = self->_dispatchQueue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000689FC;
    v31[3] = &unk_100997AD8;
    v31[4] = self;
    notify_register_dispatch("com.apple.bluetoothuser.daemonStarted", &self->_userDaemonStartedNotifyToken, v21, v31);
  }
  if (!self->_stateHandler)
  {
    v30[5] = _NSConcreteStackBlock;
    v30[6] = 3221225472;
    v30[7] = sub_100068A04;
    v30[8] = &unk_100997B00;
    v30[9] = self;
    self->_stateHandler = os_state_add_handler();
  }
  if (&_BYSetupAssistantNeedsToRun)
  {
    if (self->_deviceSetupState == 1)
    {
      id v22 = 0;
    }
    else
    {
      if (BYSetupAssistantNeedsToRun()) {
        unsigned __int8 v23 = 10;
      }
      else {
        unsigned __int8 v23 = 20;
      }
      self->_unsigned int deviceSetupState = v23;
      id v24 = BYSetupAssistantFinishedDarwinNotification;
      id v22 = v24;
      if (self->_deviceSetupState == 10 && self->_deviceSetupStateToken == -1)
      {
        id v22 = v24;
        BOOL v25 = (const char *)[v22 UTF8String];
        int v26 = self->_dispatchQueue;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100068A50;
        v30[3] = &unk_100997AD8;
        v30[4] = self;
        notify_register_dispatch(v25, &self->_deviceSetupStateToken, v26, v30);
      }
    }
  }
  else
  {
    id v22 = 0;
    self->_unsigned int deviceSetupState = 1;
  }
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    unsigned int deviceSetupState = self->_deviceSetupState;
    if (deviceSetupState > 9)
    {
      if (deviceSetupState == 10)
      {
        os_signpost_id_t v28 = "NotStarted";
        goto LABEL_53;
      }
      if (deviceSetupState == 20)
      {
        os_signpost_id_t v28 = "Complete";
        goto LABEL_53;
      }
    }
    else
    {
      if (!self->_deviceSetupState)
      {
        os_signpost_id_t v28 = "Unknown";
        goto LABEL_53;
      }
      if (deviceSetupState == 1)
      {
        os_signpost_id_t v28 = "FrameworkUnavailable";
LABEL_53:
        BOOL v29 = v28;
        LogPrintF_safe();
        goto LABEL_54;
      }
    }
    os_signpost_id_t v28 = "?";
    goto LABEL_53;
  }
LABEL_54:
  [(CBDaemonServer *)self _prefsChanged];
  notify_post("com.apple.bluetooth.daemonStarted");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068BC4;
  block[3] = &unk_100997230;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  id v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v5 = v3;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) invalidate:v31];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)v5 removeAllObjects];
  [(CBDaemonServer *)self _remoteEnsureStopped];
  [(CBDaemonServer *)self _whbDiscoveryEnsureStopped];
  [(CBDaemonServer *)self _bleAdvertiserEnsureStopped];
  [(CBDaemonServer *)self _identitiesEnsureStopped];
  [(CBDaemonServer *)self _stackBLEScannerEnsureStopped];
  [(CBDaemonServer *)self _stackClassicScannerEnsureStopped];
  [(CBDaemonServer *)self _stackControllerEnsureStopped];
  [(CBDaemonServer *)self _stackDeviceMonitorEnsureStopped];
  [(CBDaemonServer *)self _accessoryDaemonEnsureStopped];
  [(CBDaemonServer *)self _extensionsEnsureStopped];
  [(CBDaemonServer *)self _invalidateUserController];
  lostDevicesForCBSpatialWipeTimer = self->_lostDevicesForCBSpatialWipeTimer;
  if (lostDevicesForCBSpatialWipeTimer)
  {
    NSUInteger v11 = lostDevicesForCBSpatialWipeTimer;
    dispatch_source_cancel(v11);
    id v12 = self->_lostDevicesForCBSpatialWipeTimer;
    self->_lostDevicesForCBSpatialWipeTimer = 0;
  }
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_t v14 = memoryPressureSource;
    dispatch_source_cancel(v14);
    uint64_t v15 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;
  }
  int deviceSetupStateToken = self->_deviceSetupStateToken;
  if (deviceSetupStateToken != -1)
  {
    notify_cancel(deviceSetupStateToken);
    self->_int deviceSetupStateToken = -1;
  }
  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }
  int odeonNotifyToken = self->_odeonNotifyToken;
  if (odeonNotifyToken != -1)
  {
    notify_cancel(odeonNotifyToken);
    self->_int odeonNotifyToken = -1;
  }
  int screenDimmedChangeNotifyToken = self->_screenDimmedChangeNotifyToken;
  if (screenDimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenDimmedChangeNotifyToken);
    self->_int screenDimmedChangeNotifyToken = -1;
  }
  int screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_int screenUndimmedChangeNotifyToken = -1;
  }
  int systemFlagsNotifyToken = self->_systemFlagsNotifyToken;
  if (systemFlagsNotifyToken != -1)
  {
    notify_cancel(systemFlagsNotifyToken);
    self->_int systemFlagsNotifyToken = -1;
  }
  int userCloudDataChangedNotifyToken = self->_userCloudDataChangedNotifyToken;
  if (userCloudDataChangedNotifyToken != -1)
  {
    notify_cancel(userCloudDataChangedNotifyToken);
    self->_int userCloudDataChangedNotifyToken = -1;
  }
  int userDaemonStartedNotifyToken = self->_userDaemonStartedNotifyToken;
  if (userDaemonStartedNotifyToken != -1)
  {
    notify_cancel(userDaemonStartedNotifyToken);
    self->_int userDaemonStartedNotifyToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_tipiObserving || self->_lowPowerModeObserving)
  {
    BOOL v25 = +[NSNotificationCenter defaultCenter];
    [v25 removeObserver:self];

    if (self->_tipiObserving) {
      self->_tipiObserving = 0;
    }
    if (self->_lowPowerModeObserving) {
      self->_lowPowerModeObserving = 0;
    }
  }
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    uint64_t v27 = xpcListener;
    xpc_connection_cancel(v27);
    os_signpost_id_t v28 = self->_xpcListener;
    self->_xpcListener = 0;
  }
  xpcPublisherConnections = self->_xpcPublisherConnections;
  self->_xpcPublisherConnections = 0;

  xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
  self->_xpcPublisherDiscovery = 0;

  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (void)_prefsChanged
{
  int v100 = 0;
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefAccessoryDaemonEnabled != v3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      BOOL v4 = "yes";
      if (v3) {
        int v5 = "no";
      }
      else {
        int v5 = "yes";
      }
      if (!v3) {
        BOOL v4 = "no";
      }
      char v97 = v5;
      uint64_t v98 = (uint64_t)v4;
      LogPrintF_safe();
    }
    self->_prefAccessoryDaemonEnabled = v3;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v7 = Int64 != 0;
  if (self->_prefAppleAudioDeviceLimitedLoggingEnabled != v7)
  {
    if (dword_1009F7F98 <= 30)
    {
      uint64_t v8 = Int64;
      if (dword_1009F7F98 != -1 || _LogCategory_Initialize())
      {
        uint64_t v9 = "yes";
        if (v8) {
          id v10 = "no";
        }
        else {
          id v10 = "yes";
        }
        if (!v8) {
          uint64_t v9 = "no";
        }
        char v97 = v10;
        uint64_t v98 = (uint64_t)v9;
        LogPrintF_safe();
      }
    }
    self->_prefAppleAudioDeviceLimitedLoggingEnabled = v7;
  }
  uint64_t v11 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  BOOL v13 = !v12;
  if (self->_prefAuthTagIntegrityCheckEnabled != v13)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      dispatch_source_t v14 = "yes";
      if (v13) {
        uint64_t v15 = "no";
      }
      else {
        uint64_t v15 = "yes";
      }
      if (!v13) {
        dispatch_source_t v14 = "no";
      }
      char v97 = v15;
      uint64_t v98 = (uint64_t)v14;
      LogPrintF_safe();
    }
    self->_prefAuthTagIntegrityCheckEnabled = v13;
  }
  uint64_t v16 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v16 == 0;
  }
  BOOL v18 = !v17;
  if (self->_prefBLEAdvertising != v18)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v19 = "yes";
      if (v18) {
        id v20 = "no";
      }
      else {
        id v20 = "yes";
      }
      if (!v18) {
        id v19 = "no";
      }
      char v97 = v20;
      uint64_t v98 = (uint64_t)v19;
      LogPrintF_safe();
    }
    self->_prefBLEAdvertising = v18;
  }
  uint64_t v21 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21 == 0;
  }
  BOOL v23 = !v22;
  if (self->_prefBLEScanning != v23)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v24 = "yes";
      if (v23) {
        BOOL v25 = "no";
      }
      else {
        BOOL v25 = "yes";
      }
      if (!v23) {
        id v24 = "no";
      }
      char v97 = v25;
      uint64_t v98 = (uint64_t)v24;
      LogPrintF_safe();
    }
    self->_prefBLEScanning = v23;
  }
  char v26 = CFPrefs_GetInt64();
  if (v100) {
    char v27 = 0;
  }
  else {
    char v27 = v26;
  }
  int prefCBExtensionRSSIOverride = self->_prefCBExtensionRSSIOverride;
  if (prefCBExtensionRSSIOverride != v27)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_82;
        }
        LOBYTE(prefCBExtensionRSSIOverride) = self->_prefCBExtensionRSSIOverride;
      }
      char v97 = (const char *)(char)prefCBExtensionRSSIOverride;
      uint64_t v98 = v27;
      LogPrintF_safe();
    }
LABEL_82:
    self->_int prefCBExtensionRSSIOverride = v27;
  }
  uint64_t v29 = CFPrefs_GetInt64();
  if (v100) {
    goto LABEL_111;
  }
  unsigned __int8 v30 = v29;
  uint64_t deviceSetupState = self->_deviceSetupState;
  if (v29 == deviceSetupState) {
    goto LABEL_111;
  }
  if (dword_1009F7F98 <= 30)
  {
    if (dword_1009F7F98 != -1) {
      goto LABEL_87;
    }
    if (_LogCategory_Initialize())
    {
      LODWORD(deviceSetupState) = self->_deviceSetupState;
LABEL_87:
      if ((int)deviceSetupState > 9)
      {
        if (deviceSetupState == 10)
        {
          long long v32 = "NotStarted";
          goto LABEL_99;
        }
        if (deviceSetupState == 20)
        {
          long long v32 = "Complete";
          goto LABEL_99;
        }
      }
      else
      {
        if (!deviceSetupState)
        {
          long long v32 = "Unknown";
          goto LABEL_99;
        }
        if (deviceSetupState == 1)
        {
          long long v32 = "FrameworkUnavailable";
          goto LABEL_99;
        }
      }
      long long v32 = "?";
LABEL_99:
      if (v30 > 9u)
      {
        if (v30 == 10)
        {
          long long v33 = "NotStarted";
          goto LABEL_109;
        }
        if (v30 == 20)
        {
          long long v33 = "Complete";
          goto LABEL_109;
        }
      }
      else
      {
        if (!v30)
        {
          long long v33 = "Unknown";
          goto LABEL_109;
        }
        if (v30 == 1)
        {
          long long v33 = "FrameworkUnavailable";
LABEL_109:
          char v97 = v32;
          uint64_t v98 = (uint64_t)v33;
          LogPrintF_safe();
          goto LABEL_110;
        }
      }
      long long v33 = "?";
      goto LABEL_109;
    }
  }
LABEL_110:
  self->_uint64_t deviceSetupState = v30;
LABEL_111:
  uint64_t v34 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v35 = 0;
  }
  else {
    BOOL v35 = v34 == 0;
  }
  BOOL v36 = !v35;
  if (self->_prefDiscoveryProxy != v36)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      BOOL v37 = "yes";
      if (v36) {
        int v38 = "no";
      }
      else {
        int v38 = "yes";
      }
      if (!v36) {
        BOOL v37 = "no";
      }
      char v97 = v38;
      uint64_t v98 = (uint64_t)v37;
      LogPrintF_safe();
    }
    self->_prefDiscoveryProxy = v36;
  }
  uint64_t v39 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v40 = 0;
  }
  else {
    BOOL v40 = v39 == 0;
  }
  BOOL v41 = !v40;
  if (self->_prefEnforceApprovedExtensions != v41)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      BOOL v42 = "yes";
      if (v41) {
        uint64_t v43 = "no";
      }
      else {
        uint64_t v43 = "yes";
      }
      if (!v41) {
        BOOL v42 = "no";
      }
      char v97 = v43;
      uint64_t v98 = (uint64_t)v42;
      LogPrintF_safe();
    }
    self->_prefEnforceApprovedExtensions = v41;
  }
  uint64_t v44 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v45 = 0;
  }
  else {
    BOOL v45 = v44 == 0;
  }
  BOOL v46 = !v45;
  if (self->_prefEnforceApprovedList != v46)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v47 = "yes";
      if (v46) {
        unsigned int v48 = "no";
      }
      else {
        unsigned int v48 = "yes";
      }
      if (!v46) {
        unsigned __int8 v47 = "no";
      }
      char v97 = v48;
      uint64_t v98 = (uint64_t)v47;
      LogPrintF_safe();
    }
    self->_prefEnforceApprovedList = v46;
  }
  CFDataGetTypeID();
  unsigned int v49 = (void *)CFPrefs_CopyTypedValue();
  prefFilterNearbyActionExtraData = self->_prefFilterNearbyActionExtraData;
  id v51 = v49;
  v52 = prefFilterNearbyActionExtraData;
  if (v51 == v52)
  {

    id v55 = v51;
LABEL_173:

    goto LABEL_174;
  }
  unsigned __int8 v53 = v52;
  if ((v51 == 0) == (v52 != 0))
  {

LABEL_168:
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSDataHex();
      long long v56 = (char *)objc_claimAutoreleasedReturnValue();
      CUPrintNSDataHex();
      v98 = char v97 = v56;
      LogPrintF_safe();
    }
    BOOL v57 = v51;
    id v55 = self->_prefFilterNearbyActionExtraData;
    self->_prefFilterNearbyActionExtraData = v57;
    goto LABEL_173;
  }
  unsigned __int8 v54 = [(NSData *)v51 isEqual:v52];

  if ((v54 & 1) == 0) {
    goto LABEL_168;
  }
LABEL_174:
  uint64_t v58 = CFPrefs_GetInt64();
  BOOL v59 = v58 != 0;
  if (v100)
  {
    uint64_t v60 = v58;
    BOOL v59 = GestaltGetDeviceClass() - 1 < 3 || v60 != 0;
  }
  if (self->_prefExtensionsEnabled != v59)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      BOOL v62 = "yes";
      if (v59) {
        long long v63 = "no";
      }
      else {
        long long v63 = "yes";
      }
      if (!v59) {
        BOOL v62 = "no";
      }
      char v97 = v63;
      uint64_t v98 = (uint64_t)v62;
      LogPrintF_safe();
    }
    self->_prefExtensionsEnabled = v59;
  }
  uint64_t v64 = CFPrefs_GetInt64();
  if (v64 != self->_prefMemoryPressureFlags)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v65 = (char *)objc_claimAutoreleasedReturnValue();
      CUPrintFlags64();
      v98 = char v97 = v65;
      LogPrintF_safe();
    }
    self->_prefMemoryPressureFlags = v64;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069DE4;
    block[3] = &unk_100997230;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  uint64_t v67 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v68 = 0;
  }
  else {
    BOOL v68 = v67 == 0;
  }
  BOOL v69 = !v68;
  if (self->_prefNCSecondaryAdvInstance != v69)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v70 = "yes";
      if (v69) {
        v71 = "no";
      }
      else {
        v71 = "yes";
      }
      if (!v69) {
        uint64_t v70 = "no";
      }
      char v97 = v71;
      uint64_t v98 = (uint64_t)v70;
      LogPrintF_safe();
    }
    self->_prefNCSecondaryAdvInstance = v69;
  }
  BOOL v72 = CFPrefs_GetInt64() != 0;
  if (v100)
  {
    int DeviceClass = GestaltGetDeviceClass();
    BOOL v72 = DeviceClass == 4 || DeviceClass == 7;
  }
  if (self->_prefRemoteClientEnabled != v72)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      v75 = "yes";
      if (v72) {
        unsigned __int8 v76 = "no";
      }
      else {
        unsigned __int8 v76 = "yes";
      }
      if (!v72) {
        v75 = "no";
      }
      char v97 = v76;
      uint64_t v98 = (uint64_t)v75;
      LogPrintF_safe();
    }
    self->_prefRemoteClientEnabled = v72;
  }
  BOOL v77 = CFPrefs_GetInt64() != 0;
  if (v100)
  {
    int v78 = GestaltGetDeviceClass();
    BOOL v77 = v78 == 4 || v78 == 7;
  }
  if (self->_prefRemoteServerEnabled != v77)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      v80 = "yes";
      if (v77) {
        v81 = "no";
      }
      else {
        v81 = "yes";
      }
      if (!v77) {
        v80 = "no";
      }
      char v97 = v81;
      uint64_t v98 = (uint64_t)v80;
      LogPrintF_safe();
    }
    self->_prefRemoteServerEnabled = v77;
  }
  uint64_t v82 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v83 = 1;
  }
  else {
    BOOL v83 = v82 == 0;
  }
  BOOL v84 = !v83;
  if (self->_prefSystemReferenceTimeDisabled != v84)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      char v85 = "yes";
      if (v84) {
        uint64_t v86 = "no";
      }
      else {
        uint64_t v86 = "yes";
      }
      if (!v84) {
        char v85 = "no";
      }
      char v97 = v86;
      uint64_t v98 = (uint64_t)v85;
      LogPrintF_safe();
    }
    self->_prefSystemReferenceTimeDisabled = v84;
  }
  uint64_t v87 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v88 = 1;
  }
  else {
    BOOL v88 = v87 == 0;
  }
  BOOL v89 = !v88;
  if (self->_prefWHBDiscoveryAlways != v89)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v90 = "yes";
      if (v89) {
        long long v91 = "no";
      }
      else {
        long long v91 = "yes";
      }
      if (!v89) {
        unint64_t v90 = "no";
      }
      char v97 = v91;
      uint64_t v98 = (uint64_t)v90;
      LogPrintF_safe();
    }
    self->_prefWHBDiscoveryAlways = v89;
  }
  uint64_t v92 = CFPrefs_GetInt64();
  if (v100) {
    BOOL v93 = 0;
  }
  else {
    BOOL v93 = v92 == 0;
  }
  BOOL v94 = !v93;
  if (self->_prefWiProxAdvertising != v94)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v95 = "yes";
      if (v94) {
        uint64_t v96 = "no";
      }
      else {
        uint64_t v96 = "yes";
      }
      if (!v94) {
        unint64_t v95 = "no";
      }
      char v97 = v96;
      uint64_t v98 = (uint64_t)v95;
      LogPrintF_safe();
    }
    self->_prefWiProxAdvertising = v94;
  }
  [(CBAccessoryDaemon *)self->_accessoryDaemon prefsChanged];
  [(CBExtensionsDaemon *)self->_extensionsDaemon prefsChanged];
  [(CBDaemonServer *)self scheduleUpdateImmediate:0];
}

- (void)_reportDeviceFound:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        BOOL v12 = [v10 activatedDiscovery:v14];
        BOOL v13 = v12;
        if (v12 && ([v12 disabledActive] & 1) == 0) {
          [v10 reportDeviceFound:v4];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 changedTypesRemoveAll];
}

- (void)_reportDeviceLost:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        [v10 reportDeviceLost:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v4 changedTypesRemoveAll];
}

- (void)_reportDevicesBuffered:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        long long v12 = [v10 activatedDiscovery];
        long long v13 = v12;
        if (v12 && ([v12 disabledActive] & 1) == 0) {
          [v10 reportDevicesBuffered:v4];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      BOOL v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) changedTypesRemoveAll:v19];
        BOOL v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)scheduleAdvertiserUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0;

  [(CBDaemonServer *)self scheduleUpdateImmediate:v3];
}

- (void)scheduleControlUpdateImmediate:(BOOL)a3
{
  self->_assertionFlagsValid = 0;
  [(CBDaemonServer *)self scheduleUpdateImmediate:a3];
}

- (void)scheduleDiscoveryUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleDiscoveryArray = self->_bleDiscoveryArray;
  self->_bleDiscoveryArray = 0;

  self->_deviceMonitorFlagsValid = 0;
  whbDiscoveryArray = self->_whbDiscoveryArray;
  self->_whbDiscoveryArray = 0;

  [(CBDaemonServer *)self scheduleUpdateImmediate:v3];
}

- (void)scheduleSpatialUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0;

  self->_bleAdvertiserSpatialValid = 0;

  [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:v3];
}

- (void)setSystemFlags:(unsigned int)a3 mask:(unsigned int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int systemFlags = self->_systemFlags;
  uint64_t v8 = systemFlags & ~a4 | a4 & a3;
  if (v8 != systemFlags)
  {
    self->_unsigned int systemFlags = v8;
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = CUPrintFlags32();
      id v10 = CUPrintFlags32();
      LogPrintF_safe();
    }
    notify_set_state(self->_systemFlagsNotifyToken, v8);
    notify_post("com.apple.bluetooth.systemFlags");
  }
}

- (void)_tipiChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A4E8;
  v7[3] = &unk_100997208;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_updateMemoryPressure
{
  id v2 = self->_xpcPublisherDiscovery;
  if (v2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v3 = self->_xpcConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      id v15 = v2;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [v8 xpcCnx];

          if (!v10 && [v8 xpcToken])
          {
            uint64_t v11 = [v8 activatedDiscovery];
            long long v12 = v11;
            if (v11)
            {
              if ([v11 keepAlive])
              {
                long long v13 = [v8 deviceMap];
                if ([v13 count]) {
                  [v12 memoryPressureFlags];
                }
              }
              xpc_event_publisher_set_subscriber_keepalive();
              if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
              {
                id v14 = CUPrintErrorCode();
                id v2 = v15;
                LogPrintF_safe();
              }
            }
          }
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
  }
}

- (void)_updateSelfAuthTag
{
  BOOL v3 = self->_identitySelf;
  if (v3)
  {
    id v4 = [(CBStackAddressMonitor *)self->_addressMonitor connectableAddressData];
    if (!v4)
    {
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      int v13 = 0;
LABEL_33:
      id v16 = [(CBStackAddressMonitor *)self->_addressMonitor nonConnectableAddressData];
      if (!v16)
      {
        if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
LABEL_60:
        if (!v13) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      id v31 = 0;
      long long v17 = [(RPIdentity *)v3 authTagForData:v16 type:2 error:&v31];
      id v18 = v31;
      if (v17)
      {
        selfAuthTagNonConnectable = self->_selfAuthTagNonConnectable;
        long long v20 = v17;
        long long v21 = selfAuthTagNonConnectable;
        if (v20 == v21)
        {
        }
        else
        {
          long long v22 = v21;
          if (!v21)
          {

            goto LABEL_51;
          }
          unsigned __int8 v23 = [(NSData *)v20 isEqual:v21];

          if ((v23 & 1) == 0)
          {
LABEL_51:
            if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
            {
              long long v25 = CUPrintNSDataHex();
              CUPrintNSDataHex();
              v30 = os_signpost_id_t v28 = v25;
              LogPrintF_safe();
            }
            long long v26 = self->_selfAuthTagNonConnectable;
            self->_selfAuthTagNonConnectable = v20;

            [(CBDaemonServer *)self _bleAdvertiserUpdateWithAuthTagNC];
LABEL_64:
            -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 1, v28, v30);
LABEL_65:

            goto LABEL_66;
          }
        }
        if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_59;
        }
        long long v24 = CUPrintNSDataHex();
        os_signpost_id_t v28 = v24;
      }
      else
      {
        if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_59;
        }
        long long v24 = CUPrintNSError();
        os_signpost_id_t v28 = v24;
      }
      LogPrintF_safe();

LABEL_59:
      goto LABEL_60;
    }
    id v32 = 0;
    id v5 = [(RPIdentity *)v3 authTagForData:v4 type:2 error:&v32];
    id v6 = v32;
    if (v5)
    {
      selfAuthTag = self->_selfAuthTag;
      id v8 = v5;
      uint64_t v9 = selfAuthTag;
      if (v8 == v9)
      {
      }
      else
      {
        id v10 = v9;
        if (!v9)
        {

          goto LABEL_20;
        }
        unsigned __int8 v11 = [(NSData *)v8 isEqual:v9];

        if ((v11 & 1) == 0)
        {
LABEL_20:
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            id v14 = CUPrintNSDataHex();
            CUPrintNSDataHex();
            v29 = char v27 = v14;
            LogPrintF_safe();
          }
          id v15 = v8;
          long long v12 = self->_selfAuthTag;
          self->_selfAuthTag = v15;
          int v13 = 1;
          goto LABEL_31;
        }
      }
      if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize())
      {
LABEL_28:
        int v13 = 0;
LABEL_32:

        goto LABEL_33;
      }
      long long v12 = CUPrintNSDataHex();
      char v27 = v12;
    }
    else
    {
      if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
      long long v12 = CUPrintNSError();
      char v27 = v12;
    }
    LogPrintF_safe();
    int v13 = 0;
LABEL_31:

    goto LABEL_32;
  }
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_66:
}

- (void)_updateUserControllerCloudDevices
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10006AEF0;
  v2[3] = &unk_100997B50;
  v2[4] = self;
  [(CBDaemonServer *)self _performUserControllerActionWithCompletion:v2];
}

- (OS_xpc_object)xpcListenerEndpoint
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_xpcListenerEndpoint;
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

- (void)_bleAddressMonitorEnsureStopped
{
  [(CBStackAddressMonitor *)self->_addressMonitor invalidate];
  addressMonitor = self->_addressMonitor;
  self->_addressMonitor = 0;
}

- (void)_bleAdvertiserEnsureStopped
{
  if (self->_bleAdvertiser)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    bleAdvertiserArray = self->_bleAdvertiserArray;
    self->_bleAdvertiserArray = 0;

    [(CBAdvertiserDaemon *)self->_bleAdvertiser invalidate];
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;

    self->_bleAdvertiserSpatialValid = 0;
    bleAdvertiserSpatialLingerTimer = self->_bleAdvertiserSpatialLingerTimer;
    if (bleAdvertiserSpatialLingerTimer)
    {
      id v6 = bleAdvertiserSpatialLingerTimer;
      dispatch_source_cancel(v6);
      xpc_endpoint_t v7 = self->_bleAdvertiserSpatialLingerTimer;
      self->_bleAdvertiserSpatialLingerTimer = 0;
    }
    bleAdvertiserSpatialRestartTimer = self->_bleAdvertiserSpatialRestartTimer;
    if (bleAdvertiserSpatialRestartTimer)
    {
      id v10 = bleAdvertiserSpatialRestartTimer;
      dispatch_source_cancel(v10);
      uint64_t v9 = self->_bleAdvertiserSpatialRestartTimer;
      self->_bleAdvertiserSpatialRestartTimer = 0;
    }
  }
}

- (void)_bleAdvertiserAddressChanged:(BOOL)a3
{
  if (!a3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v14 = CUDescriptionWithLevel();
      LogPrintF_safe();
    }
    self->_bleAdvertiserSpatialValid = 0;
    [(CBAdvertiserDaemon *)self->_bleAdvertiser advertisingAddressChanged];
    [(CBDaemonServer *)self scheduleUpdateImmediate:0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_xpcConnections;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 activatedSpatialInteractionSession];
        unsigned __int8 v11 = [v10 advertisingAddressChangedHandler];

        if (v11) {
          v11[2](v11);
        }

        long long v12 = [v9 activatedAdvertiser];
        int v13 = [v12 advertisingAddressChangedHandler];

        if (v13) {
          v13[2](v13);
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)clearDuplicateFilterCache:(id)a3
{
  stackBLEScanner = self->_stackBLEScanner;
  if (stackBLEScanner) {
    [(CBStackBLEScanner *)stackBLEScanner clearDuplicateFilterCache:a3];
  }
}

- (id)getAudioAccessoryDeviceArray
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CBStackAccessoryMonitor *)v2->_stackAccessoryMonitor getAudioAccessoryDeviceArray];
  objc_sync_exit(v2);

  return v3;
}

- (void)_stackAccessoryMonitorEnsureStopped
{
  if (self->_stackAccessoryMonitor)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAccessoryMonitor *)self->_stackAccessoryMonitor invalidate];
    stackAccessoryMonitor = self->_stackAccessoryMonitor;
    self->_stackAccessoryMonitor = 0;
  }
}

- (void)_reportDeviceLostIfNeeded:(unint64_t)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(NSMutableDictionary *)self->_deviceMap allValues];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        stackController = self->_stackController;
        id v17 = 0;
        unsigned __int8 v12 = [(CBStackController *)stackController isDeviceConnected:v10 error:&v17];
        id v13 = v17;
        if ((v12 & 1) == 0 && (unint64_t)[v10 lastSeenTicks] < a3)
        {
          if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            [v10 lastSeenTicks];
            uint64_t v16 = UpTicksToSeconds();
            LogPrintF_safe();
            -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v10, v10, v16);
          }
          else
          {
            -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v10, v14, v15);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_stackBLEScannerEnsureStopped
{
  if (self->_stackBLEScanner)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v3 = self->_xpcConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v28;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v27 + 1) + 8 * i) activatedDiscovery];
          uint64_t v9 = v8;
          if (v8)
          {
            [v8 setDisabledActive:0];
            [v9 setDisabledPending:0];
          }
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v5);
    }

    bleDiscoveryArray = self->_bleDiscoveryArray;
    self->_bleDiscoveryArray = 0;

    [(CBStackBLEScanner *)self->_stackBLEScanner invalidate];
    stackBLEScanner = self->_stackBLEScanner;
    self->_stackBLEScanner = 0;

    if (self->_assertionFlags)
    {
      uint64_t v19 = mach_absolute_time();
      if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      dispatch_time_t v20 = dispatch_time(0, 10000000000);
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006C1AC;
      block[3] = &unk_1009972E0;
      block[4] = self;
      void block[5] = v19;
      dispatch_after(v20, dispatchQueue, block);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      unsigned __int8 v12 = [(NSMutableDictionary *)self->_deviceMap allValues];
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
            [(CBDaemonServer *)self _stackBLEScannerDeviceLost:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)_stackBLEScannerDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v9 = self->_deviceMap;
        self->_deviceMap = v8;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v6 forKeyedSubscript:v5];
    }
    [v6 setInternalFlags:[v6 internalFlags] | 2];
    [v6 updateWithCBDevice:v4];
    [v6 updateWithReceivedAuthTag:self->_selfAuthTag forType:21];
    if ([v6 changedTypesNeedsIdentify] && self->_stackBLENeedsIdentify) {
      [(CBDaemonServer *)self _identitiesResolveNearbyDevice:v6];
    }
    [(CBDaemonServer *)self _stackBLEScannerUpdateProxControlIfNeeded:v6];
    if ([v6 attributeInternalFlags])
    {
      stackController = self->_stackController;
      uint64_t v11 = 0;
      [(CBStackController *)stackController modifyDevice:v4 error:&v11];
    }
    [(CBDaemonServer *)self _reportDeviceFound:v6];
  }
}

- (void)_stackBLEScannerDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    id v7 = v4;
    id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_identifyDevices setObject:0 forKeyedSubscript:v7];
      if (([v5 removeInternalFlags:2] & 0x8000000) != 0)
      {
        [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v7];
        if (IsAppleInternalBuild())
        {
          id v6 = [v5 spatialInteractionDeviceTimestampArrayDictionary];

          if (v6) {
            [(CBDaemonServer *)self addLostDeviceToLostCBSpatialDevicesIfNeeded:v5];
          }
        }
        [(CBDaemonServer *)self _reportDeviceLost:v5];
      }
      else
      {
        [(CBDaemonServer *)self _reportDeviceFound:v5];
      }
    }

    id v4 = v7;
  }
}

- (void)_stackBLEScannerDevicesBuffered:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  id v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v26)
  {
    long long v27 = 0;
    uint64_t v25 = *(void *)v31;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v4);
        uint64_t v7 = [v5 identifier];
        if (!v7)
        {
          goto LABEL_33;
        }
        uint64_t v8 = (void *)v7;
        id v9 = objc_alloc_init((Class)CBDevice);
        [v9 setIdentifier:v8];
        [v9 setInternalFlags:2048];
        id v10 = self->_deviceMap;
        uint64_t v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v8];
        if (v11) {
          [v9 updateWithCBDevice:v11];
        }

        unint64_t v12 = (unint64_t)[v9 updateWithCBDevice:v5];
        [v9 setChangeFlags:((unint64_t)[v9 changeFlags] | v12)];
        [v9 setLastSeenTicks:mach_absolute_time()];
        unint64_t v13 = (unint64_t)[v9 discoveryFlags];
        id v14 = self->_stackBLEScanner;
        uint64_t v15 = v14;
        if (v14)
        {
          unint64_t v16 = (unint64_t)[(CBStackBLEScanner *)v14 aggregateDiscoveryFlags];
          char v29 = 0;
          int v28 = 0;
          id v17 = [(CBStackBLEScanner *)v15 aggregateDiscoveryTypes];
          int v28 = (int)v17;
          char v29 = BYTE4(v17);
        }
        else
        {
          unint64_t v16 = 0;
          char v29 = 0;
          int v28 = 0;
        }
        if ((v16 & (v13 | v12)) != 0
          || ([v9 discoveryTypesContainTypes:&v28] & 1) != 0
          || ([v9 changedTypesContainTypes:&v28] & 1) != 0)
        {
          if (objc_msgSend(v9, "changedTypesNeedsIdentify", v21, v22, v23)
            && self->_stackBLENeedsIdentify)
          {
            [(CBDaemonServer *)self _identitiesResolveNearbyDevice:v9];
          }
          id v18 = v27;
          if (!v27) {
            id v18 = objc_alloc_init((Class)NSMutableArray);
          }
          long long v27 = v18;
          [v18 addObject:v9];
        }
        else if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v19 = CUPrintFlags64();
          CBDiscoveryTypesToString();
          v23 = long long v22 = v19;
          id v21 = v9;
          LogPrintF_safe();
        }
        id v4 = (char *)v4 + 1;
      }
      while (v26 != v4);
      id v20 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v26 = v20;
    }
    while (v20);

    if (!v27) {
      goto LABEL_35;
    }
    -[CBDaemonServer _reportDevicesBuffered:](self, "_reportDevicesBuffered:");
  }
  else
  {
    long long v27 = 0;
LABEL_33:
  }
LABEL_35:
}

- (void)_stackBLEScannerUpdateProxControlIfNeeded:(id)a3
{
  id v8 = a3;
  unint64_t v4 = (unint64_t)[v8 discoveryFlags];
  if ((self->_stackBLEProxControlFlags & v4) != 0
    && (!self->_stackBLEProxControlNeedsDeviceClose || ([v8 nearbyActionFlags] & 0x10) != 0))
  {
    unint64_t v5 = v4 | 0x200000000000;
  }
  else
  {
    unint64_t v5 = v4 & 0xFFFFDFFFFFFFFFFFLL;
  }
  id v6 = v8;
  unint64_t v7 = v5 ^ v4;
  if (v7)
  {
    [v8 setChangeFlags:((unint64_t)[v8 changeFlags] | v7)];
    [v8 setDiscoveryFlags:v5];
    id v6 = v8;
  }
}

- (void)_stackClassicScannerEnsureStarted
{
  BOOL v3 = self->_stackClassicScanner;
  if (!v3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAdaptor *)self->_stackAdaptor classicScannerClass];
    id v4 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&self->_stackClassicScanner, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006C95C;
    v12[3] = &unk_100997370;
    id v5 = v4;
    id v13 = v5;
    id v14 = self;
    [v5 setDeviceFoundHandler:v12];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_10006C978;
    id v9 = &unk_100997370;
    BOOL v3 = (CBStackBLEScanner *)v5;
    id v10 = v3;
    uint64_t v11 = self;
    [(CBStackBLEScanner *)v3 setDeviceLostHandler:&v6];

    [(CBStackBLEScanner *)v3 activate];
  }
}

- (void)_stackClassicScannerDeviceFound:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v5 forKeyedSubscript:v4];
    }
    [v5 setInternalFlags:[v5 internalFlags] | 0x80];
    [v5 updateWithCBDevice:v9];
    [(CBDaemonServer *)self _reportDeviceFound:v5];
  }
}

- (void)_stackClassicScannerDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    uint64_t v7 = v4;
    id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      if (([v5 removeInternalFlags:128] & 0x8000000) != 0)
      {
        [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v7];
        [(CBDaemonServer *)self _reportDeviceLost:v6];
      }
      else
      {
        [(CBDaemonServer *)self _reportDeviceFound:v6];
      }
    }

    id v4 = v7;
  }
}

- (void)_stackControllerEnsureStarted
{
  if (!self->_stackController)
  {
    p_stackController = &self->_stackController;
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAdaptor *)self->_stackAdaptor controllerClass];
    id v4 = objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)p_stackController, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006CDA4;
    v25[3] = &unk_100997208;
    id v5 = v4;
    id v26 = v5;
    long long v27 = self;
    [v5 setControllerDataChangedHandler:v25];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006CDBC;
    v22[3] = &unk_100997208;
    id v6 = v5;
    id v23 = v6;
    long long v24 = self;
    [v6 setDiscoverableStateChangedHandler:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006CF00;
    v19[3] = &unk_100997208;
    id v7 = v6;
    id v20 = v7;
    id v21 = self;
    [v7 setInquiryStateChangedHandler:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006D044;
    v16[3] = &unk_100997208;
    id v8 = v7;
    id v17 = v8;
    id v18 = self;
    [v8 setPowerChangedHandler:v16];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    unint64_t v12 = sub_10006D204;
    id v13 = &unk_100997C40;
    id v14 = v8;
    uint64_t v15 = self;
    id v9 = v8;
    [v9 setRelayMessageHandler:&v10];
    [v9 activate:v10, v11, v12, v13];
  }
}

- (void)_stackControllerEnsureStopped
{
  if (self->_stackController)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackController *)self->_stackController invalidate];
    stackController = self->_stackController;
    self->_stackController = 0;
  }
}

- (void)_stackDeviceMonitorEnsureStopped
{
  if (self->_stackDeviceMonitor)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    self->_deviceMonitorFlagsValid = 0;
    [(CBStackDeviceMonitor *)self->_stackDeviceMonitor invalidate];
    stackDeviceMonitor = self->_stackDeviceMonitor;
    self->_stackDeviceMonitor = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSMutableDictionary *)self->_deviceMap allValues];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [(CBDaemonServer *)self _stackDeviceMonitorDeviceLost:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)_stackDeviceMonitorDeviceFound:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v5 forKeyedSubscript:v4];
    }
    [v5 setInternalFlags:[v5 internalFlags] | 4];
    [v5 updateWithCBDevice:v9];
    [(CBDaemonServer *)self _reportDeviceFound:v5];
  }
}

- (void)_stackDeviceMonitorDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    uint64_t v7 = v4;
    id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      if (([v5 removeInternalFlags:4] & 0x8000000) != 0)
      {
        [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v7];
        [(CBDaemonServer *)self _reportDeviceLost:v6];
      }
      else
      {
        [(CBDaemonServer *)self _reportDeviceFound:v6];
      }
    }

    id v4 = v7;
  }
}

- (void)_accessoryDaemonEnsureStopped
{
  if (self->_accessoryDaemon)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBAccessoryDaemon *)self->_accessoryDaemon invalidate];
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = 0;
  }
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D8DC;
  block[3] = &unk_100997C90;
  block[4] = self;
  id v14 = v10;
  BOOL v16 = a4;
  BOOL v17 = a5;
  unsigned int v15 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006DAE4;
  v5[3] = &unk_100997CE0;
  v5[4] = self;
  BOOL v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)_extensionsEnsureStopped
{
  if (self->_extensionsDaemon)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBExtensionsDaemon *)self->_extensionsDaemon invalidate];
    extensionsDaemon = self->_extensionsDaemon;
    self->_extensionsDaemon = 0;
  }
}

- (void)_identitiesEnsureStopped
{
  int identitiesNotifyToken = self->_identitiesNotifyToken;
  if (identitiesNotifyToken != -1)
  {
    if (dword_1009F7F98 > 30) {
      goto LABEL_7;
    }
    if (dword_1009F7F98 != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
    int identitiesNotifyToken = self->_identitiesNotifyToken;
    if (identitiesNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(identitiesNotifyToken);
      self->_int identitiesNotifyToken = -1;
    }
  }
  identityArray = self->_identityArray;
  self->_identityArray = 0;

  identifyDevices = self->_identifyDevices;
  self->_identifyDevices = 0;
}

- (void)_identitiesGet
{
  if (objc_opt_class())
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v3 = objc_alloc_init((Class)RPClient);
    [v3 setDispatchQueue:self->_dispatchQueue];
    [v3 setTargetUserSession:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10006DF80;
    v4[3] = &unk_100997D08;
    v4[4] = v3;
    v4[5] = self;
    [v3 getIdentitiesWithFlags:19883 completion:v4];
  }
  else if (dword_1009F7F98 <= 90 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_identitiesResolveNearbyDevice:(id)a3
{
  id v3 = a3;
  uint64_t v43 = [v3 identifier];
  if (!v43) {
    goto LABEL_84;
  }
  id v4 = [(NSMutableDictionary *)self->_identifyDevices objectForKeyedSubscript:v43];
  if (v4)
  {
    id v5 = [v3 nearbyInfoV2EncryptedData];
    if (v5 || [v3 nearbyInfoV2EncryptedFlags])
    {
    }
    else
    {
      unsigned __int16 v34 = (unsigned __int16)[v3 internalFlags];

      if ((v34 & 0x800) == 0) {
        goto LABEL_84;
      }
    }
  }
  unsigned int v6 = (char *)[(NSMutableDictionary *)self->_identifyDevices count];
  if ((unint64_t)v6 >= 0x15E)
  {
    BOOL v7 = v6 - 300;
    do
    {
      uint64_t v54 = 0;
      id v55 = &v54;
      uint64_t v56 = 0x3032000000;
      BOOL v57 = sub_10004CECC;
      uint64_t v58 = sub_10004CD38;
      id v59 = 0;
      deviceMap = self->_deviceMap;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10006EBD8;
      v53[3] = &unk_100997D30;
      void v53[4] = self;
      v53[5] = &v54;
      [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v53];
      id v10 = [(id)v55[5] identifier];
      if (v10) {
        [(NSMutableDictionary *)self->_identifyDevices setObject:0 forKeyedSubscript:v10];
      }

      if (dword_1009F7F98 < 31 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v35 = v55[5];
        LogPrintF_safe();
      }
      _Block_object_dispose(&v54, 8);

      --v7;
    }
    while (v7);
  }
  long long v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_identityMapSameAccount, "objectForKeyedSubscript:", v43, v35);
  if (v11)
  {
    [v3 updateWithCBDeviceIdentity:v11];
    [v3 setInternalFlags:[v3 internalFlags] | 8];
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v36 = v3;
      int v38 = v11;
      LogPrintF_safe();
    }
    int v46 = 1;
  }
  else
  {
    int v46 = 0;
  }

  *(void *)&long long v48 = [v3 nearbyAuthTag];
  *((void *)&v48 + 1) = [v3 nearbyInfoV2AuthTagData];
  if (*((void *)&v48 + 1))
  {
    BOOL v47 = 0;
    BOOL v42 = (void)v48 == 0;
  }
  else
  {
    *((void *)&v48 + 1) = [v3 airplaySourceAuthTagData];
    BOOL v42 = (void)v48 == 0;
    BOOL v47 = *((void *)&v48 + 1) == 0;
    if (v48 == 0) {
      goto LABEL_83;
    }
  }
  id v12 = [v3 btAddressData:v36, v38];
  if (!v12) {
    goto LABEL_82;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = self->_identityArray;
  id v13 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (!v13) {
    goto LABEL_61;
  }
  uint64_t v14 = *(void *)v50;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v50 != v14) {
        objc_enumerationMutation(obj);
      }
      BOOL v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      unsigned int v18 = [v16 type];
      if (v18 <= 9 && ((1 << v18) & 0x354) != 0)
      {
        if (v47)
        {
          unsigned __int8 v20 = [v16 verifyAuthTag:(void)v48 data:v12 type:2 error:0];
          id v21 = (id)v48;
          if ((v20 & 1) == 0) {
            goto LABEL_51;
          }
          goto LABEL_46;
        }
        if ([v16 verifyAuthTag:*((void *)&v48 + 1) data:v12 type:2 error:0])
        {
          id v22 = *((id *)&v48 + 1);
          goto LABEL_42;
        }
        id v23 = [v16 btAddress];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          id v28 = *((id *)&v48 + 1);
        }
        else
        {
          uint64_t v25 = [v16 btAddress];
          id v26 = [v25 subdataWithRange:1, 6];

          long long v27 = [v3 btAddressData];
          LODWORD(v25) = [v26 isEqualToData:v27];

          id v28 = *((id *)&v48 + 1);
          if (v25)
          {
LABEL_42:
            char v29 = [v3 nearbyInfoV2AuthIntegrityTagData:v37, v39, v40, v41];
            if (!v29)
            {

              id v21 = (id)*((void *)&v48 + 1);
              goto LABEL_46;
            }
            unsigned __int8 v30 = [(CBDaemonServer *)self _verifyNearbyInfoV2IntegrityTag:v3 rapportIdentity:v16];

            id v21 = (id)*((void *)&v48 + 1);
            if (v30)
            {
LABEL_46:
              [v3 updateWithRPIdentity:v16, v37];
              [v3 setInternalFlags:[v3 internalFlags] | 8];
              if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
              {
                id v40 = v3;
                BOOL v41 = v16;
                BOOL v37 = v12;
                id v39 = v21;
                LogPrintF_safe();
              }
              ++v46;
            }
            else
            {
LABEL_51:
              if (dword_1009F7F98 <= 5 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
              {
                id v40 = v3;
                BOOL v41 = v16;
                BOOL v37 = v12;
                id v39 = v21;
                LogPrintF_safe();
              }
            }

            goto LABEL_59;
          }
        }
        id v21 = v28;
        goto LABEL_51;
      }
LABEL_59:
    }
    id v13 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  }
  while (v13);
LABEL_61:

  if (([v3 internalFlags] & 0x800) != 0) {
    goto LABEL_82;
  }
  identifyDevices = self->_identifyDevices;
  if (!identifyDevices)
  {
    long long v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v33 = self->_identifyDevices;
    self->_identifyDevices = v32;

    identifyDevices = self->_identifyDevices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifyDevices, "setObject:forKeyedSubscript:", v3, v43, v37);
  if (!v47)
  {
    if (v42)
    {
      if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_82;
      }
    }
    else if (dword_1009F7F98 > 30 || dword_1009F7F98 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_82;
    }
LABEL_74:
    LogPrintF_safe();
    goto LABEL_82;
  }
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    goto LABEL_74;
  }
LABEL_82:

LABEL_83:
LABEL_84:
}

- (void)_identitiesReevaluateDevices
{
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [(NSMutableDictionary *)self->_identityMapSameAccount count];
    NSUInteger v6 = [(NSArray *)self->_identityArray count];
    id v7 = [(NSMutableDictionary *)self->_deviceMap count];
    id v5 = v3;
    LogPrintF_safe();
  }
  [(NSMutableDictionary *)self->_identifyDevices removeAllObjects];
  deviceMap = self->_deviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006EDC4;
  v8[3] = &unk_100997D58;
  v8[4] = self;
  [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v8];
  [(CBDaemonServer *)self scheduleUpdateImmediate:0];
}

- (void)updateIdentities:(id)a3
{
  id v4 = a3;
  BOOL v17 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v11 bluetoothIdentifier];
        uint64_t v14 = [v13 UUIDString];

        if (v14)
        {
          [(NSMutableDictionary *)v5 setObject:v11 forKeyedSubscript:v14];
        }
        else if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
        {
          BOOL v16 = v11;
          LogPrintF_safe();
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)v5 count];
    [v6 count];
    LogPrintF_safe();
  }
  identityMapSameAccount = v17->_identityMapSameAccount;
  v17->_identityMapSameAccount = v5;

  [(CBDaemonServer *)v17 _identitiesReevaluateDevices];
}

- (BOOL)_verifyNearbyInfoV2IntegrityTag:(id)a3 rapportIdentity:(id)a4
{
  double v6 = COERCE_DOUBLE(a3);
  double v7 = COERCE_DOUBLE(a4);
  uint64_t v67 = 0;
  BOOL v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  uint64_t v61 = 0;
  BOOL v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000;
  uint64_t v64 = sub_10004CECC;
  v65 = sub_10004CD38;
  id v66 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = (double *)&v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = sub_10004CECC;
  id v59 = sub_10004CD38;
  id v60 = 0;
  id v60 = [*(id *)&v6 nearbyInfoV2AuthIntegrityTagData];
  double v8 = [*(id *)&v6 nearbyInfoV2AuthTagData];
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10006F840;
  v50[3] = &unk_100997D80;
  void v50[4] = &v61;
  v50[5] = &v67;
  v50[6] = &v55;
  v50[7] = &v51;
  uint64_t v43 = objc_retainBlock(v50);
  uint64_t v9 = v62;
  id obj = v62[5];
  [*(id *)&v6 decryptApplePayloadWithIdentity:*(void *)&v7 forType:22 error:&obj];
  objc_storeStrong(v9 + 5, obj);
  if (v62[5])
  {
    if (self->_prefAuthTagIntegrityCheckEnabled) {
      goto LABEL_48;
    }
    goto LABEL_52;
  }
  unsigned __int8 v48 = [*(id *)&v6 nearbyInfoV2DecryptedFlags];
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v46 = 0xBFF0000000000000;
  double v47 = -1.0;
  unsigned int v45 = -1;
  if (self->_prefSystemReferenceTimeDisabled || !TMGetReferenceTime())
  {
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      if (self->_prefSystemReferenceTimeDisabled) {
        *(double *)&long long v11 = COERCE_DOUBLE("disabled");
      }
      else {
        *(double *)&long long v11 = COERCE_DOUBLE("not available");
      }
      double v36 = v8;
      double v35 = Current;
      double v34 = *(double *)&v11;
      LogPrintF_safe();
      double v12 = Current;
    }
    else
    {
      double v12 = Current;
    }
  }
  else if (dword_1009F7F98 > 20)
  {
    double v12 = v47;
  }
  else
  {
    double v12 = v47;
    if (dword_1009F7F98 != -1 || (double v12 = v47, _LogCategory_Initialize()))
    {
      id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v12];
      id v14 = [v13 description];
      *(void *)&double v38 = v45;
      double v39 = v8;
      double v36 = v47 - Current;
      unint64_t v37 = v46;
      double v35 = COERCE_DOUBLE([v14 UTF8String]);
      double v34 = v12;
      LogPrintF_safe();

      double v12 = v47;
    }
  }
  BOOL v42 = self;
  uint64_t v15 = 0;
  do
  {
    int v17 = byte_1007B8114[v15];
    unint64_t v18 = ((kCFAbsoluteTimeIntervalSince1970 + v12 + (double)(7200 * v17)) / 7200.0);
    *((unsigned char *)v52 + 24) = v17;
    double v44 = (double)v18 * 7200.0 - kCFAbsoluteTimeIntervalSince1970;
    long long v19 = +[NSMutableData data];
    long long v20 = +[NSData dataWithBytes:"bleAdv22IauthTag" length:16];
    [v19 appendData:v20];

    long long v21 = +[NSData dataWithBytes:&v44 length:8];
    [v19 appendData:v21];

    id v22 = +[NSData dataWithBytes:&v48 length:1];
    [v19 appendData:v22];

    [v19 appendData:*(void *)&v8];
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v23 = *((char *)v52 + 24) + 1;
      *(double *)&BOOL v24 = COERCE_DOUBLE("?");
      if (v23 <= 2) {
        BOOL v24 = off_100998000[v23];
      }
      double v40 = v6;
      double v41 = v7;
      *(void *)&double v39 = v48;
      double v38 = v44;
      double v36 = *(double *)&v24;
      unint64_t v37 = v18;
      double v34 = v8;
      double v35 = v56[5];
      LogPrintF_safe();
    }
    unsigned int v25 = [*(id *)&v7 verifyAuthTag:*(void *)&v56 data:v19 type:2 error:*(void *)&v34 *(void *)&v35 *(void *)&v36 v37 *(void *)&v38 *(void *)&v39 *(void *)&v40 *(void *)&v41];
    *((unsigned char *)v68 + 24) = v25;
    if (v25 && dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_32;
        }
        int v26 = *((unsigned __int8 *)v68 + 24);
      }
      else
      {
        int v26 = 1;
      }
      BOOL v27 = v26 == 0;
      *(double *)&id v28 = COERCE_DOUBLE("yes");
      if (v27) {
        *(double *)&id v28 = COERCE_DOUBLE("no");
      }
      uint64_t v29 = *((char *)v52 + 24) + 1;
      *(double *)&unsigned __int8 v30 = COERCE_DOUBLE("?");
      if (v29 <= 2) {
        unsigned __int8 v30 = off_100998000[v29];
      }
      double v38 = v6;
      double v39 = v7;
      double v36 = *(double *)&v30;
      unint64_t v37 = v18;
      double v34 = v8;
      double v35 = *(double *)&v28;
      LogPrintF_safe();
    }
LABEL_32:

    BOOL v27 = v15++ == 2;
    if (v27) {
      char v31 = 1;
    }
    else {
      char v31 = v25;
    }
  }
  while ((v31 & 1) == 0);
  if (!*((unsigned char *)v68 + 24))
  {
    if (v42->_prefAuthTagIntegrityCheckEnabled) {
      [*(id *)&v6 resetNearbyInfoV2SensitiveProperties];
    }
    if (dword_1009F7F98 <= 90 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  if (!v42->_prefAuthTagIntegrityCheckEnabled)
  {
LABEL_52:
    BOOL v32 = 1;
    goto LABEL_53;
  }
LABEL_48:
  BOOL v32 = *((unsigned char *)v68 + 24) != 0;
LABEL_53:
  ((void (*)(void *))v43[2])(v43);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v32;
}

- (void)_remoteEnsureStarted
{
  p_remoteClient = &self->_remoteClient;
  id v4 = self->_remoteClient;
  id v5 = v4;
  if (!v4)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v5 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)p_remoteClient, v5);
    [(RPCompanionLinkClient *)v5 setDispatchQueue:self->_dispatchQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006FF3C;
    v21[3] = &unk_100997DA8;
    v21[4] = self;
    [(RPCompanionLinkClient *)v5 setDeviceFoundHandler:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10006FFE4;
    v20[3] = &unk_100997DA8;
    v20[4] = self;
    [(RPCompanionLinkClient *)v5 setDeviceLostHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100070094;
    v19[3] = &unk_100997DD0;
    void v19[4] = self;
    [(RPCompanionLinkClient *)v5 setDeviceChangedHandler:v19];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007013C;
    v18[3] = &unk_100997DF8;
    v18[4] = self;
    [(RPCompanionLinkClient *)v5 registerEventID:@"com.apple.bluetooth.event" options:0 handler:v18];
  }
  if (!self->_prefRemoteServerEnabled)
  {
    if (self->_remoteRequestRegistered)
    {
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [(RPCompanionLinkClient *)v5 deregisterRequestID:@"com.apple.bluetooth.request"];
      self->_remoteRequestRegistered = 0;
    }
LABEL_18:
    if (v4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (self->_remoteRequestRegistered) {
    goto LABEL_18;
  }
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007014C;
  v17[3] = &unk_100997E20;
  v17[4] = self;
  [(RPCompanionLinkClient *)v5 registerRequestID:@"com.apple.bluetooth.request" options:0 handler:v17];
  self->_remoteRequestRegistered = 1;
  if (!v4)
  {
LABEL_19:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100070160;
    v14[3] = &unk_100997398;
    uint64_t v15 = v5;
    BOOL v16 = self;
    [(RPCompanionLinkClient *)v15 activateWithCompletion:v14];
  }
LABEL_20:
  p_remoteServer = &self->_remoteServer;
  remoteServer = self->_remoteServer;
  if (self->_prefRemoteServerEnabled)
  {
    double v8 = remoteServer;
    if (!v8)
    {
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v9 = objc_alloc_init((Class)RPServer);
      objc_storeStrong((id *)&self->_remoteServer, v9);
      [v9 setDispatchQueue:self->_dispatchQueue];
      [v9 setServiceType:@"com.apple.bluetooth.remote"];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10007029C;
      v11[3] = &unk_100997398;
      double v8 = (RPServer *)v9;
      double v12 = v8;
      id v13 = self;
      [(RPServer *)v8 setErrorHandler:v11];
      [(RPServer *)v8 activate];
    }
  }
  else
  {
    if (!remoteServer) {
      goto LABEL_37;
    }
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(RPServer *)*p_remoteServer invalidate];
    double v8 = *p_remoteServer;
    *p_remoteServer = 0;
  }

LABEL_37:
  if (!self->_coexNotificationSetup)
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"coexChangeNotification:" name:@"com.apple.bluetooth.leconnection" object:0];

    self->_coexNotificationSetup = 1;
  }
}

- (void)coexChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000703F8;
  v7[3] = &unk_100997208;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)sendCoexUpdate:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
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
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v11 = [v10 remoteDevice];
        double v12 = [v11 identifier];

        if (v12)
        {
          id v13 = [v10 activatedDiscovery];

          if (v13)
          {
            if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
            {
              long long v20 = CUPrintNSObjectOneLine();
              LogPrintF_safe();

              [(RPCompanionLinkClient *)self->_remoteClient sendEventID:@"com.apple.bluetooth.whbU", v4, v12, 0, 0, v20, v12, (void)v22 event destinationID options completion];
            }
            else
            {
              [(RPCompanionLinkClient *)self->_remoteClient sendEventID:@"com.apple.bluetooth.whbU", v4, v12, 0, 0, v19, v21, (void)v22 event destinationID options completion];
            }
          }
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  id v14 = [v4 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"];
  id v15 = [v14 unsignedLongValue];
  v26[0] = @"CBWHBMetricsKeyEventType";
  v26[1] = @"CBWHBMetricsKeySubEventType";
  v27[0] = @"CoexUpdateEvent";
  v27[1] = @"SentCoexUpdate";
  v26[2] = @"CBWHBMetricsKeyNumLEConnections";
  BOOL v16 = +[NSNumber numberWithUnsignedLongLong:v15];
  v27[2] = v16;
  int v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  unint64_t v18 = +[CBMetricsDaemon sharedCBMetricsDaemon];
  [v18 reportWhbMetric:v17];
}

- (void)_remoteReceivedEvent:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSDictionaryGetNSNumber();
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_10004CECC;
  int v26 = sub_10004CD38;
  id v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100070B24;
  v21[3] = &unk_100997E48;
  void v21[5] = v8;
  v21[6] = &v22;
  v21[4] = v9;
  id v10 = objc_retainBlock(v21);
  if (v8 && v9)
  {
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v11 = [v8 unsignedIntValue];
      CUPrintNSObjectOneLine();
      v20 = id v19 = v11;
      unint64_t v18 = v9;
      LogPrintF_safe();
    }
    double v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v8, v18, v19, v20);
    if (v12)
    {
      id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v13)
      {
        [v12 xpcReceivedEvent:v13];
      }
      else
      {
        uint64_t v16 = CBErrorF();
        int v17 = (void *)v23[5];
        v23[5] = v16;
      }
    }
    else
    {
      uint64_t v15 = CBErrorF();
      id v13 = (void *)v23[5];
      v23[5] = v15;
    }
  }
  else
  {
    uint64_t v14 = CBErrorF();
    double v12 = (void *)v23[5];
    v23[5] = v14;
  }

  ((void (*)(void *))v10[2])(v10);
  _Block_object_dispose(&v22, 8);
}

- (void)_remoteReceivedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSDictionaryGetNSNumber();
  CFStringGetTypeID();
  double v12 = CFDictionaryGetTypedValue();
  uint64_t v37 = 0;
  double v38 = &v37;
  uint64_t v39 = 0x3032000000;
  double v40 = sub_10004CECC;
  double v41 = sub_10004CD38;
  id v42 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100071024;
  v34[3] = &unk_100997E70;
  double v36 = &v37;
  v34[4] = v12;
  v34[5] = v11;
  id v13 = v10;
  id v35 = v13;
  uint64_t v14 = objc_retainBlock(v34);
  if (v11 && v12)
  {
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v15 = [v11 unsignedIntValue];
      CUPrintNSObjectOneLine();
      long long v33 = v31 = v15;
      unsigned __int8 v30 = v12;
      LogPrintF_safe();
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteConnectionMap, "objectForKeyedSubscript:", v11, v30, v31, v33);
    uint64_t v16 = (CBDaemonXPCConnection *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      uint64_t v16 = objc_alloc_init(CBDaemonXPCConnection);
      id v32 = [v11 unsignedIntValue];
      int v17 = NSPrintF_safe();
      -[CBDaemonXPCConnection setAppID:](v16, "setAppID:", v17, v12, v32);

      [(CBDaemonXPCConnection *)v16 setDaemon:self];
      [(CBDaemonXPCConnection *)v16 setDispatchQueue:self->_dispatchQueue];
      [(CBDaemonXPCConnection *)v16 setEntitled:1];
      [(CBDaemonXPCConnection *)v16 setRemoteAccepted:1];
      [(CBDaemonXPCConnection *)v16 setRemoteClient:self->_remoteClient];
      [(CBDaemonXPCConnection *)v16 setRemoteClientID:v11];
      id v18 = objc_alloc_init((Class)CBDevice);
      [v18 setIdentifier:v12];
      [(CBDaemonXPCConnection *)v16 setRemoteDevice:v18];
      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        long long v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        uint64_t v21 = self->_xpcConnections;
        self->_xpcConnections = v20;

        xpcConnections = self->_xpcConnections;
      }
      [(NSMutableSet *)xpcConnections addObject:v16];
      remoteConnectionMap = self->_remoteConnectionMap;
      if (!remoteConnectionMap)
      {
        long long v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v24 = self->_remoteConnectionMap;
        self->_remoteConnectionMap = v23;

        remoteConnectionMap = self->_remoteConnectionMap;
      }
      [(NSMutableDictionary *)remoteConnectionMap setObject:v16 forKeyedSubscript:v11];
      [(CBDaemonXPCConnection *)v16 activate];
    }
    long long v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v25)
    {
      id v26 = objc_retainBlock(v13);
      CUXPCObjectSetResponseHandler();

      [(CBDaemonXPCConnection *)v16 xpcReceivedRequest:v25];
    }
    else
    {
      uint64_t v28 = CBErrorF();
      uint64_t v29 = (void *)v38[5];
      v38[5] = v28;
    }
  }
  else
  {
    uint64_t v27 = CBErrorF();
    uint64_t v16 = (CBDaemonXPCConnection *)v38[5];
    v38[5] = v27;
  }

  ((void (*)(void *))v14[2])(v14);
  _Block_object_dispose(&v37, 8);
}

- (void)remoteRegisterConnection:(id)a3 clientID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  remoteConnectionMap = self->_remoteConnectionMap;
  if (!remoteConnectionMap)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v9 = self->_remoteConnectionMap;
    self->_remoteConnectionMap = v8;

    remoteConnectionMap = self->_remoteConnectionMap;
  }
  [(NSMutableDictionary *)remoteConnectionMap setObject:v10 forKeyedSubscript:v6];
  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (void)_remoteInvalidateInactiveXPC
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = self->_xpcConnections;
  id v2 = [(NSMutableSet *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v24 = 0;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v6 = [v5 remoteDevice];
        id v7 = [v6 identifier];

        if (v7)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v8 = [(RPCompanionLinkClient *)self->_remoteClient activeDevices];
          id v9 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v33;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v33 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) idsDeviceIdentifier];
                unsigned __int8 v14 = [v13 isEqual:v7];

                if (v14)
                {

                  goto LABEL_19;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          id v15 = v24;
          if (!v24) {
            id v15 = objc_alloc_init((Class)NSMutableArray);
          }
          uint64_t v24 = v15;
          [v15 addObject:v5];
        }
LABEL_19:
      }
      id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v24 = 0;
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v24;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)k);
        if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v22 = [v21 remoteDevice];
          long long v23 = [v22 identifier];
          LogPrintF_safe();
        }
        [v21 invalidate:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v18);
  }
}

- (void)_whbDiscoveryEnsureStarted
{
  id v3 = self->_whbDiscoveryDaemon;
  id v4 = v3;
  if (!v3)
  {
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v5 = objc_alloc_init(CBWHBDiscoveryDaemon);
    objc_storeStrong((id *)&self->_whbDiscoveryDaemon, v5);
    [(CBWHBDiscoveryDaemon *)v5 setDaemonServer:self];
    [(CBWHBDiscoveryDaemon *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CBWHBDiscoveryDaemon *)v5 setRemoteClient:self->_remoteClient];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100071704;
    v14[3] = &unk_100997370;
    id v6 = v5;
    id v15 = v6;
    id v16 = self;
    [(CBWHBDiscoveryDaemon *)v6 setDeviceFoundHandler:v14];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_100071720;
    uint64_t v11 = &unk_100997370;
    id v4 = v6;
    double v12 = v4;
    id v13 = self;
    [(CBWHBDiscoveryDaemon *)v4 setDeviceLostHandler:&v8];
  }
  id v7 = [(CBWHBDiscoveryDaemon *)v4 discoveryArray];
  if (v7)
  {
  }
  else if ([(NSMutableArray *)self->_whbDiscoveryArray count])
  {
    [(CBWHBDiscoveryDaemon *)v4 setDiscoveryArray:self->_whbDiscoveryArray];
LABEL_13:
    [(CBWHBDiscoveryDaemon *)v4 activate];
    goto LABEL_14;
  }
  if (!v3) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_whbDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_whbDeviceMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)CBDevice);
      whbDeviceMap = self->_whbDeviceMap;
      if (!whbDeviceMap)
      {
        id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v9 = self->_whbDeviceMap;
        self->_whbDeviceMap = v8;

        whbDeviceMap = self->_whbDeviceMap;
      }
      [(NSMutableDictionary *)whbDeviceMap setObject:v6 forKeyedSubscript:v5];
    }
    [v6 setInternalFlags:[v6 internalFlags] | 2];
    [v6 updateWithCBDevice:v4];
    id v10 = [v4 remoteHostID];
    [v6 setRemoteHostID:v10];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = self->_xpcConnections;
    id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v17 = [v16 activatedDiscoveryWHB:v19];
          id v18 = v17;
          if (v17 && ([v17 disabledActive] & 1) == 0) {
            [v16 reportDeviceFound:v6];
          }
        }
        id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v4 setChangeFlags:0];
  }
}

- (void)_whbDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_whbDeviceMap objectForKeyedSubscript:v5];
    if (v6)
    {
      [(NSMutableDictionary *)self->_whbDeviceMap setObject:0 forKeyedSubscript:v5];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = self->_xpcConnections;
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            id v13 = [v12 activatedDiscoveryWHB:v14];
            if (v13) {
              [v12 reportDeviceLost:v6];
            }
          }
          id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      [v4 setChangeFlags:0];
    }
  }
}

- (void)_userControllerCloudUpdateWithDevices:(id)a3
{
  id v4 = a3;
  if (dword_1009F7F98 <= 50)
  {
    if (dword_1009F7F98 != -1 || _LogCategory_Initialize())
    {
      id v24 = [v4 count];
      LogPrintF_safe();
    }
    if (dword_1009F7F98 <= 35 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v24 = v4;
      LogPrintF_safe();
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
LABEL_11:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      uint64_t v11 = [v9 identifier];
      if (!v11)
      {
        long long v21 = obj;
        goto LABEL_35;
      }
      id v12 = (void *)v11;
      id v13 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v11];
      if (!v13)
      {
        id v13 = objc_alloc_init((Class)CBDevice);
        deviceMap = self->_deviceMap;
        if (!deviceMap)
        {
          long long v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v16 = self->_deviceMap;
          self->_deviceMap = v15;

          deviceMap = self->_deviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v13, v12, v24);
      }
      [v13 setInternalFlags:[v13 internalFlags] | 0x400];
      [v13 updateWithCBDevice:v9];
      stackController = self->_stackController;
      id v29 = 0;
      unsigned int v18 = [(CBStackController *)stackController modifyDevice:v13 error:&v29];
      id v19 = v29;
      if (v18)
      {
        if (dword_1009F7F98 > 40 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_30;
        }
        long long v20 = [v9 identifier];
        long long v25 = v20;
        LogPrintF_safe();
      }
      else
      {
        if (dword_1009F7F98 > 90 || dword_1009F7F98 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_30;
        }
        long long v20 = [v9 identifier];
        CUPrintNSError();
        id v26 = v25 = v20;
        LogPrintF_safe();
      }
LABEL_30:
      -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v13, v25, v26);

      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v6) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v21 = [(RPIdentity *)self->_identitySelf idsDeviceID];
  if (v21)
  {
    id v22 = objc_alloc_init((Class)CBDevice);
    [v22 setIdentifier:v21];
    [v22 setIdsDeviceID:v21];
    userController = self->_userController;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100071EC4;
    v28[3] = &unk_100997E98;
    v28[4] = v21;
    v28[5] = self;
    [(CBUserController *)userController getControllerInfoForDevice:v22 completion:v28];
  }
LABEL_35:
}

- (void)_userControllerUploadLocalControllerInfo
{
  id v3 = [(CBStackController *)self->_stackController controllerInfo];
  if ([v3 fastLEConnectionInfoVersion]
    && ([v3 fastLEConnectionInfoData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000721A8;
    v5[3] = &unk_100997398;
    v5[4] = self;
    void v5[5] = v3;
    [(CBDaemonServer *)self _performUserControllerActionWithCompletion:v5];
  }
  else if (dword_1009F7F98 <= 35 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000723F4;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      id v14 = [v13 activatedAdvertiser];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6, v6);
    }
    else
    {
      -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6, v19);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v6;
      LogPrintF_safe();
    }
    long long v15 = objc_alloc_init(CBDaemonXPCConnection);
    [(CBDaemonXPCConnection *)v15 setActivatedAdvertiser:v6];
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      long long v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      unsigned int v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15, v19);
    [(CBDaemonXPCConnection *)v15 activate];
  }
  [(CBDaemonServer *)self scheduleAdvertiserUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072738;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 activatedAdvertiser];

        if (v14 == v6)
        {
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            id v15 = v6;
            LogPrintF_safe();
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13, v15);

          goto LABEL_15;
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  [(CBDaemonServer *)self scheduleAdvertiserUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)activateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000729D0;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      id v14 = [v13 activatedController];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6, v6);
    }
    else
    {
      -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6, v19);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v6;
      LogPrintF_safe();
    }
    id v15 = objc_alloc_init(CBDaemonXPCConnection);
    [(CBDaemonXPCConnection *)v15 setActivatedController:v6];
    [(CBDaemonXPCConnection *)v15 setAppID:@"CBDaemon"];
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      long long v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15, v19);
    [(CBDaemonXPCConnection *)v15 activate];
  }
  [(CBDaemonServer *)self scheduleControlUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)invalidateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072D24;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 activatedController];

        if (v14 == v6)
        {
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            id v15 = v6;
            LogPrintF_safe();
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13, v15);

          goto LABEL_15;
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  [(CBDaemonServer *)self scheduleControlUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072FBC;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
      id v14 = [v13 activatedDiscovery];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6, v6);
    }
    else
    {
      -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6, v23);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v23 = v6;
      LogPrintF_safe();
    }
    id v15 = objc_alloc_init(CBDaemonXPCConnection);
    [(CBDaemonXPCConnection *)v15 setActivatedDiscovery:v6];
    uint64_t v16 = [v6 appID];
    long long v17 = (void *)v16;
    if (v16) {
      CFStringRef v18 = (const __CFString *)v16;
    }
    else {
      CFStringRef v18 = @"CBDaemon";
    }
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", v18, v23);

    [(CBDaemonXPCConnection *)v15 setDispatchQueue:self->_dispatchQueue];
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      long long v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v21 = self->_xpcConnections;
      self->_xpcConnections = v20;

      xpcConnections = self->_xpcConnections;
    }
    [(NSMutableSet *)xpcConnections addObject:v15];
    [(CBDaemonXPCConnection *)v15 activate];
    long long v22 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v22 reportCBDiscovery:v6 daemonCnx:v15 action:@"strt"];
  }
  [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073364;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 activatedDiscovery];

        if (v14 == v6)
        {
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            id v16 = v6;
            LogPrintF_safe();
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13, v16);
          id v15 = +[CBMetricsDaemon sharedCBMetricsDaemon];
          [v15 reportCBDiscovery:v6 daemonCnx:v13 action:@"stop"];

          [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:0];
          goto LABEL_15;
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  v7[2](v7, 0);
}

- (void)activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073628;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      id v14 = [v13 activatedSpatialInteractionSession];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6, v6);
    }
    else
    {
      -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6, v19);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v6;
      LogPrintF_safe();
    }
    id v15 = objc_alloc_init(CBDaemonXPCConnection);
    [(CBDaemonXPCConnection *)v15 setActivatedSpatialInteractionSession:v6];
    [(CBDaemonXPCConnection *)v15 setAppID:@"CBDaemon"];
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      long long v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }
    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15, v19);
    [(CBDaemonXPCConnection *)v15 activate];
  }
  [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:0];
  v7[2](v7, 0);
}

- (void)invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007397C;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 activatedSpatialInteractionSession];

        if (v14 == v6)
        {
          if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            id v15 = v6;
            LogPrintF_safe();
          }
          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13, v15);
          [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:0];

          goto LABEL_15;
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  v7[2](v7, 0);
}

- (void)aopMessageReceived:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100073BE8;
  v7[3] = &unk_100997208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_aopMessageReceived:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 activatedSpatialInteractionSession];
        id v12 = [v11 aopDataHandler];

        if (v12)
        {
          if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSDataHex();
            v14 = id v13 = v11;
            LogPrintF_safe();
          }
          [v10 aopMessageReceived:v4, v13, v14, v15];

          goto LABEL_17;
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_1009F7F98 <= 90 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataHex();
    id v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
LABEL_17:
  }
}

- (void)notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100073EFC;
  v15[3] = &unk_100997F08;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)_notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  id v42 = a3;
  id v38 = a4;
  id v44 = a5;
  long long v37 = self->_xpcPublisherConnections;
  if (!v37) {
    goto LABEL_47;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v8 = self->_xpcConnections;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (!v9)
  {

LABEL_43:
    if (dword_1009F7F98 <= 20 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      long long v33 = CUPrintNSObjectOneLine();
      LogPrintF_safe();
    }
    goto LABEL_47;
  }
  id v10 = v9;
  int v43 = 0;
  uint64_t v11 = *(void *)v57;
  uint64_t v39 = *(void *)v57;
  double v40 = v8;
  do
  {
    id v12 = 0;
    id v41 = v10;
    do
    {
      if (*(void *)v57 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v12);
      id v14 = [v13 xpcToken:v32, v34, v35, v36];
      if (v14)
      {
        id v15 = v14;
        id v16 = [v13 activatedConnection];
        id v17 = v16;
        if (v16)
        {
          id v18 = [v16 serviceUUIDs];
          if (v18)
          {
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            xpc_object_t v19 = v44;
            id v46 = [v19 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (v46)
            {
              uint64_t v20 = *(void *)v53;
              double v47 = v19;
              uint64_t v45 = *(void *)v53;
              while (2)
              {
                for (i = 0; i != v46; i = (char *)i + 1)
                {
                  if (*(void *)v53 != v20) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  id v23 = v18;
                  id v24 = [v23 countByEnumeratingWithState:&v48 objects:v60 count:16];
                  if (v24)
                  {
                    id v25 = v24;
                    uint64_t v26 = *(void *)v49;
LABEL_17:
                    uint64_t v27 = 0;
                    while (1)
                    {
                      if (*(void *)v49 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      if ([*(id *)(*((void *)&v48 + 1) + 8 * v27) isEqual:v22]) {
                        break;
                      }
                      if (v25 == (id)++v27)
                      {
                        id v25 = [v23 countByEnumeratingWithState:&v48 objects:v60 count:16];
                        if (v25) {
                          goto LABEL_17;
                        }
                        goto LABEL_23;
                      }
                    }

                    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
                    id v28 = [v42 UUIDString];
                    id v29 = (const char *)[v28 UTF8String];

                    if (!v29) {
                      goto LABEL_32;
                    }
                    xpc_dictionary_set_string(v19, "deviceID", v29);
                    long long v30 = (const char *)[v38 UTF8String];
                    id v8 = v40;
                    id v10 = v41;
                    uint64_t v11 = v39;
                    if (v30) {
                      xpc_dictionary_set_string(v19, "name", v30);
                    }
                    xpc_event_publisher_fire();
                    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
                    {
                      long long v31 = CUPrintNSObjectOneLine();
                      CUPrintErrorCode();
                      v36 = long long v35 = v31;
                      id v32 = v15;
                      id v34 = v42;
                      LogPrintF_safe();
                    }
                    ++v43;
                    goto LABEL_35;
                  }
LABEL_23:

                  xpc_object_t v19 = v47;
                  uint64_t v20 = v45;
                }
                id v46 = [v47 countByEnumeratingWithState:&v52 objects:v61 count:16];
                if (v46) {
                  continue;
                }
                break;
              }
LABEL_32:
              id v8 = v40;
              id v10 = v41;
              uint64_t v11 = v39;
            }
LABEL_35:
          }
        }
      }
      id v12 = (char *)v12 + 1;
    }
    while (v12 != v10);
    id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
  }
  while (v10);

  if (!v43) {
    goto LABEL_43;
  }
LABEL_47:
}

- (id)localWhbDeviceForStableId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10004CECC;
  id v16 = sub_10004CD38;
  id v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007448C;
  block[3] = &unk_100997E48;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)optimalWhbDeviceForStableIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000745A0;
  block[3] = &unk_100997EE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_performUserControllerActionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_systemMonitor;
  if ([(CUSystemMonitor *)v5 firstUnlocked])
  {
    id v6 = self->_userController;
    if (v6)
    {
      id v7 = v6;
      v4[2](v4, 0);
    }
    else
    {
      [(CBStackAdaptor *)self->_stackAdaptor userControllerClass];
      id v7 = (CBUserController *)objc_alloc_init((Class)objc_opt_class());
      [(CBUserController *)v7 setDispatchQueue:self->_dispatchQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000747B8;
      v11[3] = &unk_100997230;
      void v11[4] = self;
      [(CBUserController *)v7 setInvalidationHandler:v11];
      objc_storeStrong((id *)&self->_userController, v7);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000747C8;
      v9[3] = &unk_100997F30;
      v9[4] = self;
      id v10 = v4;
      [(CBUserController *)v7 activateWithCompletion:v9];
    }
  }
  else
  {
    id v8 = CBErrorF();
    ((void (**)(id, void *))v4)[2](v4, v8);
  }
}

- (void)_invalidateUserController
{
  if (!self->_userController)
  {
    id v3 = 0;
    [0 invalidate];
    userController = self->_userController;
    self->_userController = 0;

    if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_xpcPublisherConnectionsAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  id v8 = a5;
  if (a3 == 2)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 != -1 || (id v8 = (id)_LogCategory_Initialize(), v8)) {
        id v8 = (id)LogPrintF_safe();
      }
    }
  }
  else if (a3 == 1)
  {
    id v8 = [(CBDaemonServer *)self _xpcPublisherConnectionsRemoveToken:a4 reason:"removed"];
  }
  else if (a3)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 != -1 || (id v8 = (id)_LogCategory_Initialize(), v8))
      {
        id v9 = CUPrintXPC();
        LogPrintF_safe();
      }
    }
  }
  else
  {
    id v8 = -[CBDaemonServer _xpcPublisherConnectionsAddToken:info:](self, "_xpcPublisherConnectionsAddToken:info:", a4);
  }

  _objc_release_x3(v8);
}

- (void)_xpcPublisherConnectionsAddToken:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  if ([(CBDaemonServer *)self xpcEventAllowedInfo:v6])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_xpcConnections;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        if ([v12 xpcToken] == (id)a3)
        {
          id v13 = [v12 xpcCnx];

          if (!v13) {
            break;
          }
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      uint64_t v14 = v12;

      if (!v14) {
        goto LABEL_17;
      }
      id v15 = [(CBDaemonXPCConnection *)v14 activatedConnection];
      [v15 updateWithXPCSubscriberInfo:v6];
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    else
    {
LABEL_11:

LABEL_17:
      uint64_t v14 = objc_alloc_init(CBDaemonXPCConnection);
      [(CBDaemonXPCConnection *)v14 setAppID:@"XPCProxy"];
      [(CBDaemonXPCConnection *)v14 setXpcToken:a3];
      id v15 = objc_alloc_init((Class)CBConnection);
      [(CBDaemonXPCConnection *)v14 setActivatedConnection:v15];
      [v15 updateWithXPCSubscriberInfo:v6];
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v19 = a3;
        uint64_t v20 = v14;
        LogPrintF_safe();
      }
      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        id v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        id v18 = self->_xpcConnections;
        self->_xpcConnections = v17;

        xpcConnections = self->_xpcConnections;
      }
      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14, v19, v20, (void)v21);
      [(CBDaemonXPCConnection *)v14 activate];
    }
  }
  else
  {
    [(CBDaemonServer *)self _xpcPublisherConnectionsRemoveToken:a3 reason:"not allowed"];
  }
}

- (void)_xpcPublisherConnectionsRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_xpcConnections;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 xpcToken] == (id)a3)
        {
          uint64_t v11 = [v10 xpcCnx];

          if (!v11)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v7)
  {
    [(NSMutableSet *)self->_xpcConnections removeObject:v7];
    [v7 invalidate];
  }
}

- (BOOL)xpcEventAllowedInfo:(id)a3
{
  id v3 = a3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    LOBYTE(v7) = 1;
    goto LABEL_12;
  }
  uint64_t v4 = xpc_dictionary_get_array(v3, "limitToDeviceClasses");
  uint64_t v5 = xpc_dictionary_get_array(v3, "denyProductList");
  if (!(v4 | v5))
  {
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    id v6 = (id) MGCopyAnswer();
    id v7 = [v6 UTF8String];

    if (!v7) {
      goto LABEL_10;
    }
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100075110;
    applier[3] = &unk_100997F58;
    applier[4] = &v12;
    applier[5] = v7;
    xpc_array_apply((xpc_object_t)v4, applier);
  }
  if (!v5)
  {
LABEL_9:
    LOBYTE(v7) = *((unsigned char *)v13 + 24) != 0;
    goto LABEL_10;
  }
  id v8 = (id) MGCopyAnswer();
  id v7 = [v8 UTF8String];

  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100075168;
    v10[3] = &unk_100997F58;
    v10[4] = &v12;
    v10[5] = v7;
    xpc_array_apply((xpc_object_t)v5, v10);
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v12, 8);
LABEL_11:

LABEL_12:
  return (char)v7;
}

- (void)_xpcPublisherDiscoveryAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  id v8 = a5;
  if (a3 == 2)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 != -1 || (id v8 = (id)_LogCategory_Initialize(), v8)) {
        id v8 = (id)LogPrintF_safe();
      }
    }
  }
  else if (a3 == 1)
  {
    id v8 = [(CBDaemonServer *)self _xpcPublisherDiscoveryRemoveToken:a4 reason:"removed"];
  }
  else if (a3)
  {
    if (dword_1009F7F98 <= 30)
    {
      if (dword_1009F7F98 != -1 || (id v8 = (id)_LogCategory_Initialize(), v8))
      {
        id v9 = CUPrintXPC();
        LogPrintF_safe();
      }
    }
  }
  else
  {
    id v8 = -[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:](self, "_xpcPublisherDiscoveryAddToken:info:", a4);
  }

  _objc_release_x3(v8);
}

- (void)_xpcPublisherDiscoveryAddToken:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  if ([(CBDaemonServer *)self xpcEventAllowedInfo:v6])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = self->_xpcConnections;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        if ([v12 xpcToken] == (id)a3)
        {
          long long v13 = [v12 xpcCnx];

          if (!v13) {
            break;
          }
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      uint64_t v14 = v12;

      if (!v14) {
        goto LABEL_17;
      }
      id v15 = [(CBDaemonXPCConnection *)v14 activatedDiscovery];
      id v16 = [v15 updateWithXPCSubscriberInfo:v6];
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
      {
        CUPrintFlags64();
        uint64_t v26 = v25 = v14;
        unint64_t v24 = a3;
        LogPrintF_safe();
      }
      if (v16)
      {
        long long v21 = +[CBMetricsDaemon sharedCBMetricsDaemon];
        long long v22 = v21;
        CFStringRef v23 = @"updt";
        goto LABEL_27;
      }
    }
    else
    {
LABEL_11:

LABEL_17:
      uint64_t v14 = objc_alloc_init(CBDaemonXPCConnection);
      [(CBDaemonXPCConnection *)v14 setAppID:@"XPCProxy"];
      [(CBDaemonXPCConnection *)v14 setXpcToken:a3];
      id v15 = objc_alloc_init((Class)CBDiscovery);
      id v17 = [(CBDaemonXPCConnection *)v14 appID];
      [v15 setAppID:v17];

      [(CBDaemonXPCConnection *)v14 setActivatedDiscovery:v15];
      [v15 updateWithXPCSubscriberInfo:v6];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100075720;
      v28[3] = &unk_100997F80;
      v28[4] = v15;
      v28[5] = v14;
      void v28[6] = self;
      v28[7] = a3;
      [v15 setDeviceFoundHandler:v28];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10007594C;
      void v27[3] = &unk_100997F80;
      v27[4] = v15;
      v27[5] = v14;
      v27[6] = self;
      v27[7] = a3;
      [v15 setDeviceLostHandler:v27];
      if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v24 = a3;
        id v25 = v14;
        LogPrintF_safe();
      }
      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        unint64_t v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        uint64_t v20 = self->_xpcConnections;
        self->_xpcConnections = v19;

        xpcConnections = self->_xpcConnections;
      }
      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14, v24, v25);
      [(CBDaemonXPCConnection *)v14 activate];
      long long v21 = +[CBMetricsDaemon sharedCBMetricsDaemon];
      long long v22 = v21;
      CFStringRef v23 = @"strt";
LABEL_27:
      [v21 reportCBDiscovery:v15 daemonCnx:v14 action:v23, v24, v25, v26];
    }
    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0, v24, v25);
  }
  else
  {
    [(CBDaemonServer *)self _xpcPublisherDiscoveryRemoveToken:a3 reason:"not allowed"];
  }
}

- (void)_xpcPublisherDiscoveryRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 xpcToken] == (id)a3)
        {
          uint64_t v12 = [v11 xpcCnx];

          if (!v12)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
      }
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (dword_1009F7F98 <= 30 && (dword_1009F7F98 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v16 = a3;
    id v17 = v8;
    id v15 = a4;
    LogPrintF_safe();
  }
  if (v8)
  {
    [(NSMutableSet *)self->_xpcConnections removeObject:v8];
    long long v13 = [v8 activatedDiscovery];
    if (v13)
    {
      uint64_t v14 = +[CBMetricsDaemon sharedCBMetricsDaemon];
      [v14 reportCBDiscovery:v13 daemonCnx:v8 action:@"stop"];
    }
    [v8 invalidate:v15, v16, v17];
    [(CBDaemonServer *)self scheduleDiscoveryUpdateImmediate:0];
  }
}

- (BOOL)_supportsProxControl
{
  if (qword_1009FC0D8 != -1) {
    dispatch_once(&qword_1009FC0D8, &stru_100997FA0);
  }
  return byte_1009FC0E0;
}

- (BOOL)supportsNCSecondaryAdvertisingInstance
{
  if (qword_1009FC0E8 != -1) {
    dispatch_once(&qword_1009FC0E8, &stru_100997FC0);
  }
  return self->_prefNCSecondaryAdvInstance & byte_1009FC0E1;
}

- (void)addLostDeviceToLostCBSpatialDevicesIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075EEC;
  v7[3] = &unk_100997208;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (CBAccessoryDaemon)accessoryDaemon
{
  return self->_accessoryDaemon;
}

- (void)setAccessoryDaemon:(id)a3
{
}

- (CBStackAddressMonitor)addressMonitor
{
  return self->_addressMonitor;
}

- (void)setAddressMonitor:(id)a3
{
}

- (void)setDeviceMap:(id)a3
{
}

- (CBExtensionsDaemon)extensionsDaemon
{
  return self->_extensionsDaemon;
}

- (void)setExtensionsDaemon:(id)a3
{
}

- (NSArray)identityArray
{
  return self->_identityArray;
}

- (void)setIdentityArray:(id)a3
{
}

- (BOOL)prefAppleAudioDeviceLimitedLoggingEnabled
{
  return self->_prefAppleAudioDeviceLimitedLoggingEnabled;
}

- (char)prefCBExtensionRSSIOverride
{
  return self->_prefCBExtensionRSSIOverride;
}

- (BOOL)prefEnforceApprovedExtensions
{
  return self->_prefEnforceApprovedExtensions;
}

- (void)setPrefEnforceApprovedExtensions:(BOOL)a3
{
  self->_prefEnforceApprovedExtensions = a3;
}

- (void)setPrefEnforceApprovedList:(BOOL)a3
{
  self->_prefEnforceApprovedList = a3;
}

- (NSData)prefFilterNearbyActionExtraData
{
  return self->_prefFilterNearbyActionExtraData;
}

- (BOOL)prefRemoteClientEnabled
{
  return self->_prefRemoteClientEnabled;
}

- (BOOL)prefRemoteServerEnabled
{
  return self->_prefRemoteServerEnabled;
}

- (BOOL)prefSystemReferenceTimeDisabled
{
  return self->_prefSystemReferenceTimeDisabled;
}

- (BOOL)prefWiProxAdvertising
{
  return self->_prefWiProxAdvertising;
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (CBStackBLEScanner)stackBLEScanner
{
  return self->_stackBLEScanner;
}

- (CBStackController)stackController
{
  return self->_stackController;
}

- (void)setStackController:(id)a3
{
}

- (CBAdvertiserDaemon)testAdvertiser
{
  return self->_testAdvertiser;
}

- (void)setTestAdvertiser:(id)a3
{
}

- (CBController)testAssertion
{
  return self->_testAssertion;
}

- (void)setTestAssertion:(id)a3
{
}

- (CBDiscovery)testDiscovery
{
  return self->_testDiscovery;
}

- (void)setTestDiscovery:(id)a3
{
}

- (CBUserController)userController
{
  return self->_userController;
}

- (void)setUserController:(id)a3
{
}

- (NSMutableDictionary)whbDeviceMap
{
  return self->_whbDeviceMap;
}

- (CBWHBDiscoveryDaemon)whbDiscoveryDaemon
{
  return self->_whbDiscoveryDaemon;
}

- (char)wifiCriticalOverride
{
  return self->_wifiCriticalOverride;
}

- (void)setWifiCriticalOverride:(char)a3
{
  self->_wifiCriticalOverride = a3;
}

- (NSMutableSet)xpcConnections
{
  return self->_xpcConnections;
}

- (void)setXpcConnections:(id)a3
{
}

- (NSMutableDictionary)identifyDevices
{
  return self->_identifyDevices;
}

- (void)setIdentifyDevices:(id)a3
{
}

- (BOOL)prefExtensionsEnabled
{
  return self->_prefExtensionsEnabled;
}

- (void)setPrefExtensionsEnabled:(BOOL)a3
{
  self->_prefExtensionsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyDevices, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_whbDiscoveryDaemon, 0);
  objc_storeStrong((id *)&self->_whbDeviceMap, 0);
  objc_storeStrong((id *)&self->_userController, 0);
  objc_storeStrong((id *)&self->_testDiscovery, 0);
  objc_storeStrong((id *)&self->_testAssertion, 0);
  objc_storeStrong((id *)&self->_testAdvertiser, 0);
  objc_storeStrong((id *)&self->_stackController, 0);
  objc_storeStrong((id *)&self->_stackBLEScanner, 0);
  objc_storeStrong((id *)&self->_stackAdaptor, 0);
  objc_storeStrong((id *)&self->_prefFilterNearbyActionExtraData, 0);
  objc_storeStrong((id *)&self->_identityArray, 0);
  objc_storeStrong((id *)&self->_extensionsDaemon, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_addressMonitor, 0);
  objc_storeStrong((id *)&self->_accessoryDaemon, 0);
  objc_storeStrong((id *)&self->_xpcPublisherDiscovery, 0);
  objc_storeStrong((id *)&self->_xpcPublisherConnections, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_stackDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_stackClassicScanner, 0);
  objc_storeStrong((id *)&self->_stackAccessoryMonitor, 0);
  objc_storeStrong((id *)&self->_selfAuthTagNonConnectable, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong((id *)&self->_whbDiscoveryArray, 0);
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_remoteConnectionMap, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_lostDevicesForCBSpatialWipeTimer, 0);
  objc_storeStrong((id *)&self->_lostDevicesForCBSpatial, 0);
  objc_storeStrong((id *)&self->_identitySelf, 0);
  objc_storeStrong((id *)&self->_identityMapSameAccount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleDiscoveryArray, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserSpatialRestartTimer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserSpatialLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiserArray, 0);

  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end