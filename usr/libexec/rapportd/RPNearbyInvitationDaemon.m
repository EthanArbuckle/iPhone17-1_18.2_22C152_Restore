@interface RPNearbyInvitationDaemon
+ (id)sharedInvitationDaemon;
- (BOOL)_clientBLENearbyActionAdvertiserShouldRun;
- (BOOL)_clientBLENearbyActionDiscoveryShouldRun;
- (BOOL)_clientBLEServerShouldRun;
- (BOOL)_clientProximityEstimatorShouldRun;
- (BOOL)_serverBLEClientConnectionShouldStart;
- (BOOL)_serverBLENearbyActionAdvertiserShouldRun;
- (BOOL)_serverBLENearbyActionDiscoveryShouldRun;
- (BOOL)_serverBLENearbyInfoDiscoveryShouldRun;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)invalidateCalled;
- (BOOL)invalidateDone;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)prefClientEnabled;
- (BOOL)prefGuestClientEnabled;
- (BOOL)prefGuestServerEnabled;
- (BOOL)prefServerEnabled;
- (BOOL)prefServerRSSIDisabled;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (CUBLEServer)bleServer;
- (CUSystemMonitor)systemMonitor;
- (NSMutableDictionary)bleClientConnections;
- (NSMutableSet)bleServerConnections;
- (NSMutableSet)devicesWantingInvitations;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)clientDisabledDupeFilterTimer;
- (OS_dispatch_source)clientNearbyActionAdvertiserTimer;
- (OS_dispatch_source)clientNearbyActionDiscoveryTimer;
- (OS_dispatch_source)serverNearbyActionAdvertiserTimer;
- (RPCompanionLinkClient)bleNearbyInfoDiscovery;
- (RPCompanionLinkDevice)bleDeviceWantingInvitations;
- (RPNIProximityEstimator)proximityEstimator;
- (RPNearbyInvitationDaemon)init;
- (RPNearbyInvitationDevice)bleDeviceAcceptedInvitations;
- (SFDeviceDiscovery)bleNearbyActionDiscovery;
- (SFDeviceDiscovery)clientBLENearbyActionDiscovery;
- (SFService)bleNearbyActionAdvertiser;
- (SFService)clientBLENearbyActionAdvertiser;
- (id)_findMatchingDeviceWithIdentifier:(id)a3;
- (id)_idleSessionConnection;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)cnxIDLast;
- (unsigned)sessionIDLast;
- (void)_activate;
- (void)_bleClientConnectionEnded:(id)a3;
- (void)_bleClientConnectionStateChanged:(int)a3 cnx:(id)a4 sessionID:(id)a5;
- (void)_clientBLENearbyActionAdvertiserEnsureStarted;
- (void)_clientBLENearbyActionAdvertiserEnsureStopped;
- (void)_clientBLENearbyActionAdvertiserStartTimer;
- (void)_clientBLENearbyActionDisableDupeFilter;
- (void)_clientBLENearbyActionDiscoveryDeviceFound:(id)a3;
- (void)_clientBLENearbyActionDiscoveryDeviceLost:(id)a3;
- (void)_clientBLENearbyActionDiscoveryEnsureStarted;
- (void)_clientBLENearbyActionDiscoveryEnsureStopped;
- (void)_clientBLENearbyActionDiscoveryScanRateStartTimer;
- (void)_clientBLENearbyActionEnableDupeFilter;
- (void)_clientBLEServerEnsureStarted;
- (void)_clientBLEServerEnsureStopped;
- (void)_clientBLEServerHandleConnectionEnded:(id)a3;
- (void)_clientBLEServerHandleConnectionStarted:(id)a3;
- (void)_clientBLEServerHandleConnectionStateChange:(int)a3 cnx:(id)a4;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientProximityEstimatorEnsureStarted;
- (void)_clientProximityEstimatorEnsureStopped;
- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)_clientReportFoundDevice:(id)a3;
- (void)_clientReportLostDevice:(id)a3;
- (void)_handleServerActivation:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 xpcCnx:(id)a6 sessionID:(id)a7;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 xpcCnx:(id)a7 sessionID:(id)a8;
- (void)_serverBLEClientConnectionEnsureStarted;
- (void)_serverBLENearbyActionAdvertiserEnsureStarted;
- (void)_serverBLENearbyActionAdvertiserEnsureStopped;
- (void)_serverBLENearbyActionAdvertiserRestartTimer;
- (void)_serverBLENearbyActionDiscoveryDeviceFound:(id)a3;
- (void)_serverBLENearbyActionDiscoveryEnsureStarted;
- (void)_serverBLENearbyActionDiscoveryEnsureStopped;
- (void)_serverBLENearbyInfoDiscoveryDeviceFound:(id)a3;
- (void)_serverBLENearbyInfoDiscoveryDeviceLost:(id)a3;
- (void)_serverBLENearbyInfoDiscoveryEnsureStarted;
- (void)_serverBLENearbyInfoDiscoveryEnsureStopped;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)setBleClientConnections:(id)a3;
- (void)setBleDeviceAcceptedInvitations:(id)a3;
- (void)setBleDeviceWantingInvitations:(id)a3;
- (void)setBleNearbyActionAdvertiser:(id)a3;
- (void)setBleNearbyActionDiscovery:(id)a3;
- (void)setBleNearbyInfoDiscovery:(id)a3;
- (void)setBleServer:(id)a3;
- (void)setBleServerConnections:(id)a3;
- (void)setClientBLENearbyActionAdvertiser:(id)a3;
- (void)setClientBLENearbyActionDiscovery:(id)a3;
- (void)setClientDisabledDupeFilterTimer:(id)a3;
- (void)setClientNearbyActionAdvertiserTimer:(id)a3;
- (void)setClientNearbyActionDiscoveryTimer:(id)a3;
- (void)setCnxIDLast:(unsigned int)a3;
- (void)setDevicesWantingInvitations:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setInvalidateDone:(BOOL)a3;
- (void)setPrefClientEnabled:(BOOL)a3;
- (void)setPrefGuestClientEnabled:(BOOL)a3;
- (void)setPrefGuestServerEnabled:(BOOL)a3;
- (void)setPrefServerEnabled:(BOOL)a3;
- (void)setPrefServerRSSIDisabled:(BOOL)a3;
- (void)setProximityEstimator:(id)a3;
- (void)setServerNearbyActionAdvertiserTimer:(id)a3;
- (void)setSessionIDLast:(unsigned int)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation RPNearbyInvitationDaemon

- (RPNearbyInvitationDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationDaemon;
  v2 = [(RPNearbyInvitationDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AE7C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  RandomBytes();
  if (!self->_xpcListener)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport.NearbyInvitation"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }

  [(RPNearbyInvitationDaemon *)self prefsChanged];
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B048;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    [(RPNearbyInvitationDaemon *)self _clientEnsureStopped];
    [(RPNearbyInvitationDaemon *)self _serverEnsureStopped];
    [(RPNearbyInvitationDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableSet *)self->_xpcConnections count]
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  GestaltGetDeviceClass();
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefClientEnabled != v3)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      v4 = "yes";
      if (v3) {
        v5 = "no";
      }
      else {
        v5 = "yes";
      }
      if (!v3) {
        v4 = "no";
      }
      v20 = v5;
      v21 = v4;
      LogPrintF();
    }
    self->_prefClientEnabled = v3;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_prefServerEnabled != v6)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      v7 = "yes";
      if (v6) {
        v8 = "no";
      }
      else {
        v8 = "yes";
      }
      if (!v6) {
        v7 = "no";
      }
      v20 = v8;
      v21 = v7;
      LogPrintF();
    }
    self->_prefServerEnabled = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefGuestServerEnabled != v9)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      v10 = "yes";
      if (v9) {
        v11 = "no";
      }
      else {
        v11 = "yes";
      }
      if (!v9) {
        v10 = "no";
      }
      v20 = v11;
      v21 = v10;
      LogPrintF();
    }
    self->_prefGuestServerEnabled = v9;
  }
  BOOL v12 = CFPrefs_GetInt64() != 0;
  if (self->_prefGuestClientEnabled != v12)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      v13 = "yes";
      if (v12) {
        v14 = "no";
      }
      else {
        v14 = "yes";
      }
      if (!v12) {
        v13 = "no";
      }
      v20 = v14;
      v21 = v13;
      LogPrintF();
    }
    self->_prefGuestClientEnabled = v12;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v16 = Int64 != 0;
  if (self->_prefServerRSSIDisabled != v16)
  {
    if (dword_1001419A0 <= 30)
    {
      uint64_t v17 = Int64;
      if (dword_1001419A0 != -1 || _LogCategory_Initialize())
      {
        v18 = "yes";
        if (v17) {
          v19 = "no";
        }
        else {
          v19 = "yes";
        }
        if (!v17) {
          v18 = "no";
        }
        v20 = v19;
        v21 = v18;
        LogPrintF();
      }
    }
    self->_prefServerRSSIDisabled = v16;
  }
  [(RPNearbyInvitationDaemon *)self _update];
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

+ (id)sharedInvitationDaemon
{
  if (qword_100142D40 != -1) {
    dispatch_once(&qword_100142D40, &stru_100122DF8);
  }
  v2 = (void *)qword_100142D38;

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v3 = 0;

  return v3;
}

- (void)setBleDeviceWantingInvitations:(id)a3
{
  id v4 = a3;
  v5 = self->_bleDeviceWantingInvitations;
  BOOL v6 = (RPCompanionLinkDevice *)v4;
  BOOL v12 = v6;
  if (v5 == v6)
  {

    bleDeviceWantingInvitations = v12;
LABEL_12:

    v8 = v12;
    goto LABEL_13;
  }
  if ((v6 != 0) == (v5 == 0))
  {

    v8 = v12;
LABEL_7:
    if (dword_1001419A0 <= 30)
    {
      if (dword_1001419A0 != -1 || (int v10 = _LogCategory_Initialize(), v8 = v12, v10))
      {
        LogPrintF();
        v8 = v12;
      }
    }
    v11 = v8;
    bleDeviceWantingInvitations = self->_bleDeviceWantingInvitations;
    self->_bleDeviceWantingInvitations = v11;
    goto LABEL_12;
  }
  unsigned __int8 v7 = [(RPCompanionLinkDevice *)v5 isEqual:v6];

  v8 = v12;
  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_13:
}

- (void)setBleDeviceAcceptedInvitations:(id)a3
{
  id v4 = a3;
  v5 = self->_bleDeviceAcceptedInvitations;
  BOOL v6 = (RPNearbyInvitationDevice *)v4;
  BOOL v12 = v6;
  if (v5 == v6)
  {

    bleDeviceAcceptedInvitations = v12;
LABEL_12:

    v8 = v12;
    goto LABEL_13;
  }
  if ((v6 != 0) == (v5 == 0))
  {

    v8 = v12;
LABEL_7:
    if (dword_1001419A0 <= 30)
    {
      if (dword_1001419A0 != -1 || (int v10 = _LogCategory_Initialize(), v8 = v12, v10))
      {
        LogPrintF();
        v8 = v12;
      }
    }
    v11 = v8;
    bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
    self->_bleDeviceAcceptedInvitations = v11;
    goto LABEL_12;
  }
  unsigned __int8 v7 = [(RPNearbyInvitationDevice *)v5 isEqual:v6];

  v8 = v12;
  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_13:
}

- (void)_clientEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(RPNearbyInvitationDaemon *)self _clientProximityEstimatorShouldRun]) {
    [(RPNearbyInvitationDaemon *)self _clientProximityEstimatorEnsureStarted];
  }
  else {
    [(RPNearbyInvitationDaemon *)self _clientProximityEstimatorEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDiscoveryShouldRun])
  {
    [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDiscoveryEnsureStarted];
  }
  else
  {
    [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDiscoveryEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _clientBLEServerShouldRun]) {
    [(RPNearbyInvitationDaemon *)self _clientBLEServerEnsureStarted];
  }
  else {
    [(RPNearbyInvitationDaemon *)self _clientBLEServerEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _clientBLENearbyActionAdvertiserShouldRun])
  {
    [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionAdvertiserEnsureStarted];
  }
  else
  {
    [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionAdvertiserEnsureStopped];
  }
}

- (void)_clientEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(RPNearbyInvitationDaemon *)self _clientProximityEstimatorEnsureStopped];
  [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDiscoveryEnsureStopped];

  [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionAdvertiserEnsureStopped];
}

- (BOOL)_clientBLENearbyActionDiscoveryShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v3 = [(CUSystemMonitor *)self->_systemMonitor screenOn];
  if (v3) {
    LOBYTE(v3) = [(NSMutableSet *)self->_activatedDiscoverySet count] != 0;
  }
  return v3;
}

- (void)_clientBLENearbyActionDiscoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientBLENearbyActionDiscovery)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100141A10());
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = v3;

    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setPurpose:@"RPNearbyInvitation"];
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setRssiThreshold:-70];
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setDiscoveryFlags:16];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005BC68;
    v9[3] = &unk_100122E20;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005BC74;
    v8[3] = &unk_100122E20;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005BC80;
    v7[3] = &unk_100122E48;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setDeviceChangedHandler:v7];
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setInterruptionHandler:&stru_100122E68];
    v5 = self->_clientBLENearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005BD00;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_clientBLENearbyActionDiscoveryEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery invalidate];
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = 0;
  }
  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0;

  clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
  if (clientNearbyActionDiscoveryTimer)
  {
    unsigned __int8 v7 = clientNearbyActionDiscoveryTimer;
    dispatch_source_cancel(v7);
    BOOL v6 = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = 0;
  }
}

- (void)_clientBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  id v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v4 = [v38 deviceActionType] == 84;
  v5 = v38;
  if (v4)
  {
    BOOL v6 = [v38 identifier];
    unsigned __int8 v7 = [v6 UUIDString];

    if (!v7)
    {
      if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_50;
    }
    v8 = [v38 bleDevice];
    BOOL v9 = [v8 advertisementFields];
    CFDataGetTypeID();
    int v10 = CFDictionaryGetTypedValue();

    if (v10)
    {
      v11 = +[RPIdentityDaemon sharedIdentityDaemon];
      id v12 = [v11 identityOfSelfAndReturnError:0];

      v13 = [(CUSystemMonitor *)self->_systemMonitor bluetoothAddressData];
      v14 = [v12 authTagForData:v13 type:2 error:0];
      if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
      {
        id v15 = v38;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [v15 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v15 descriptionWithLevel:50];
          }
          else {
          uint64_t v16 = [v15 description];
          }
        }
        uint64_t v17 = (void *)v16;

        id v36 = [v13 bytes];
        v37 = v14;
        v29 = v10;
        v34 = v17;
        LogPrintF();
      }
      id v18 = v14;
      id v19 = [v18 bytes];
      id v20 = v10;
      if (memcmp(v19, [v20 bytes], (size_t)objc_msgSend(v20, "length")))
      {
        if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }

LABEL_49:
LABEL_50:

        v5 = v38;
        goto LABEL_51;
      }
    }
    v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v7, v29, v34, v36, v37);
    if (v21)
    {
      id v12 = v21;
      v22 = [v21 bleDevice];
      unsigned int v23 = [v22 isBLEDeviceReplaced];

      if (v23 && dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
      {
        v30 = [v12 bleDevice];
        id v35 = v38;
        LogPrintF();
      }
      id v27 = [v12 updateWithSFDevice:v38, v30, v35];
      if (v27)
      {
        id v28 = v27;
        if ([v12 inBubble])
        {
          if (dword_1001419A0 <= 10 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
          {
            v32 = CUDescriptionWithLevel();
            LogPrintF();

            -[RPNearbyInvitationDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v12, v28, v32);
          }
          else
          {
            -[RPNearbyInvitationDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v12, v28, v31);
          }
        }
      }
      if (([v12 inBubble] & 1) == 0) {
        [(RPNIProximityEstimator *)self->_proximityEstimator sendSampleForDevice:v38];
      }
      if (dword_1001419A0 <= 10 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
      {
        v33 = CUDescriptionWithLevel();
        LogPrintF();
      }
    }
    else
    {
      if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
      {
        v30 = CUDescriptionWithLevel();
        LogPrintF();
      }
      id v12 = objc_alloc_init((Class)RPNearbyInvitationDevice);
      [v12 setIdentifier:v7];
      [v12 updateWithSFDevice:v38];
      discoveredDevices = self->_discoveredDevices;
      if (!discoveredDevices)
      {
        v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v26 = self->_discoveredDevices;
        self->_discoveredDevices = v25;

        discoveredDevices = self->_discoveredDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v12, v7, v30);
      [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setScanRate:30];
      [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDiscoveryScanRateStartTimer];
      [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionDisableDupeFilter];
      [(RPNIProximityEstimator *)self->_proximityEstimator sendSampleForDevice:v38];
      [(RPNearbyInvitationDaemon *)self _update];
    }
    goto LABEL_49;
  }
LABEL_51:
}

- (void)_clientBLENearbyActionDiscoveryDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v4 = [v7 identifier];
  v5 = [v4 UUIDString];

  if (v5)
  {
    BOOL v6 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v5];
    [(NSMutableDictionary *)self->_discoveredDevices setObject:0 forKeyedSubscript:v5];
    if ([v6 inBubble]) {
      [(RPNearbyInvitationDaemon *)self _clientReportLostDevice:v6];
    }
    if (![(NSMutableDictionary *)self->_discoveredDevices count]) {
      [(RPNearbyInvitationDaemon *)self _clientBLENearbyActionEnableDupeFilter];
    }
  }
  else if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_clientBLENearbyActionDiscoveryScanRateStartTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientNearbyActionDiscoveryTimer)
  {
    unsigned int v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = v3;
    v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005C6C0;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate(v5);
  }
}

- (void)_clientBLENearbyActionDisableDupeFilter
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (([(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery changeFlags] & 4) == 0)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery setChangeFlags:[(SFDeviceDiscovery *)self->_clientBLENearbyActionDiscovery changeFlags] | 4];
  }
  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    BOOL v4 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v4);
    v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;

    BOOL v6 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v8 = self->_clientDisabledDupeFilterTimer;
  self->_clientDisabledDupeFilterTimer = v7;
  BOOL v9 = v7;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005C8F8;
  handler[3] = &unk_100121158;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

- (void)_clientBLENearbyActionEnableDupeFilter
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
    if (clientDisabledDupeFilterTimer)
    {
      BOOL v4 = clientDisabledDupeFilterTimer;
      dispatch_source_cancel(v4);
      v5 = self->_clientDisabledDupeFilterTimer;
      self->_clientDisabledDupeFilterTimer = 0;
    }
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    unint64_t v7 = (unint64_t)[(SFDeviceDiscovery *)clientBLENearbyActionDiscovery changeFlags] & 0xFFFFFFFB;
    [(SFDeviceDiscovery *)clientBLENearbyActionDiscovery setChangeFlags:v7];
  }
}

- (id)_idleSessionConnection
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_xpcConnections;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v7 = [v6 activatedSession:v13];
        if (v7)
        {
          v8 = (void *)v7;
          BOOL v9 = [v6 activatedSession];
          if ([v9 waitingToConnect])
          {
            int v10 = [v6 activatedSession];
            unsigned __int8 v11 = [v10 failedToConnect];

            if ((v11 & 1) == 0)
            {
              id v3 = v6;
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
      id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
LABEL_13:

  return v3;
}

- (BOOL)_clientBLENearbyActionAdvertiserShouldRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = [(RPNearbyInvitationDaemon *)self _idleSessionConnection];
  uint64_t v4 = [v3 activatedSession];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_clientBLENearbyActionAdvertiserEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = [(RPNearbyInvitationDaemon *)self _idleSessionConnection];
    uint64_t v4 = [v3 activatedSession];

    BOOL v5 = (SFService *)objc_alloc_init(off_100141A18());
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = v5;

    [(SFService *)self->_clientBLENearbyActionAdvertiser setDeviceActionType:56];
    [(SFService *)self->_clientBLENearbyActionAdvertiser setDispatchQueue:self->_dispatchQueue];
    uint64_t v7 = off_100141A20();
    [(SFService *)self->_clientBLENearbyActionAdvertiser setIdentifier:v7];

    [(SFService *)self->_clientBLENearbyActionAdvertiser setLabel:@"RPNearbyInvitation"];
    [(SFService *)self->_clientBLENearbyActionAdvertiser setPairSetupDisabled:1];
    v8 = [v4 daemonDevice];
    BOOL v9 = [v8 bleTargetData];
    [(SFService *)self->_clientBLENearbyActionAdvertiser setTargetAuthTag:v9];

    [(SFService *)self->_clientBLENearbyActionAdvertiser setAdvertiseRate:50];
    int v10 = self->_clientBLENearbyActionAdvertiser;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005CD6C;
    v12[3] = &unk_1001222C0;
    v12[4] = self;
    id v13 = v4;
    id v11 = v4;
    [(SFService *)v10 activateWithCompletion:v12];
  }
}

- (void)_clientBLENearbyActionAdvertiserEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFService *)self->_clientBLENearbyActionAdvertiser invalidate];
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = 0;
  }
  clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
  if (clientNearbyActionAdvertiserTimer)
  {
    BOOL v6 = clientNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    BOOL v5 = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = 0;
  }
}

- (void)_clientBLENearbyActionAdvertiserStartTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientNearbyActionAdvertiserTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = v3;
    BOOL v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005D058;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate(v5);
  }
}

- (BOOL)_clientProximityEstimatorShouldRun
{
  return [(NSMutableSet *)self->_activatedDiscoverySet count] != 0;
}

- (void)_clientProximityEstimatorEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_proximityEstimator)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = objc_alloc_init(RPNIProximityEstimator);
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = v3;

    [(RPNIProximityEstimator *)self->_proximityEstimator setInnerPresencePreset:6];
    [(RPNIProximityEstimator *)self->_proximityEstimator setInnerRegionName:@"nearbyInvitation-inner"];
    [(RPNIProximityEstimator *)self->_proximityEstimator setOuterRegionName:@"nearbyInvitation-outer"];
    [(RPNIProximityEstimator *)self->_proximityEstimator setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005D344;
    v7[3] = &unk_100122E90;
    v7[4] = self;
    [(RPNIProximityEstimator *)self->_proximityEstimator setDeviceRegionChangedHandler:v7];
    BOOL v5 = self->_proximityEstimator;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005D48C;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(RPNIProximityEstimator *)v5 activateWithCompletion:v6];
  }
}

- (void)_clientProximityEstimatorEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityEstimator)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNIProximityEstimator *)self->_proximityEstimator invalidate];
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = 0;
  }
  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    BOOL v6 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v6);
    BOOL v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0;
  }
}

- (void)_clientReportFoundDevice:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) reportFoundDevice:v4 outReason:0 v10];
        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
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
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) reportChangedDevice:v6 changes:v4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_clientReportLostDevice:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) reportLostDevice:v4 v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_discoveredDevices allValues];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 compareWithDeviceIdentifier:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_clientBLEServerShouldRun
{
  if (self->_prefClientEnabled && self->_prefGuestClientEnabled)
  {
    id v3 = [(NSMutableDictionary *)self->_discoveredDevices count];
    if (v3) {
      LOBYTE(v3) = [(NSMutableSet *)self->_activatedSessionSet count] != 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)_clientBLEServerEnsureStarted
{
  if (!self->_bleServer)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUBLEServer *)objc_alloc_init((Class)CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    [(CUBLEServer *)self->_bleServer setDispatchQueue:self->_dispatchQueue];
    [(CUBLEServer *)self->_bleServer setLabel:@"RPNearbyInvitation"];
    [(CUBLEServer *)self->_bleServer setListenPSM:CBAssignedL2CAPPSMForNearbyInvitation];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005DC78;
    v7[3] = &unk_100121C78;
    v7[4] = self;
    [(CUBLEServer *)self->_bleServer setConnectionStartedHandler:v7];
    BOOL v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005DC84;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(CUBLEServer *)v5 activateWithCompletion:v6];
  }
}

- (void)_clientBLEServerHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)RPConnection);
  [v5 setBleConnection:v4];
  [v5 setControlFlags:1536];
  [v5 setDispatchQueue:self->_dispatchQueue];
  id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 setIdentityDaemon:v6];

  id v7 = objc_alloc((Class)NSString);
  uint64_t v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  id v9 = [[v7 initWithFormat:@"NICnx-%u", v8];
  [v5 setLabel:v9];

  long long v10 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  long long v11 = [v10 localDeviceInfo];
  [v5 setLocalDeviceInfo:v11];

  [v5 setPasswordType:0];
  [v5 setPresent:1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v12 = self->_xpcConnections;
  id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v18 = [v17 activatedSession];

        if (v18)
        {
          [v5 setClient:v17];
          goto LABEL_11;
        }
      }
      id v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005E180;
  v26[3] = &unk_100121908;
  v26[4] = v5;
  [v5 setReadErrorHandler:v26];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005E2AC;
  v25[3] = &unk_1001219D0;
  v25[4] = v5;
  v25[5] = self;
  [v5 setInvalidationHandler:v25];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005E318;
  v24[3] = &unk_1001219F8;
  v24[4] = v5;
  v24[5] = self;
  [v5 setReceivedEventHandler:v24];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005E3C0;
  v23[3] = &unk_100121A20;
  v23[4] = v5;
  v23[5] = self;
  [v5 setReceivedRequestHandler:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005E47C;
  v22[3] = &unk_100121A48;
  v22[4] = v5;
  v22[5] = self;
  [v5 setStateChangedHandler:v22];
  bleServerConnections = self->_bleServerConnections;
  if (!bleServerConnections)
  {
    id v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v21 = self->_bleServerConnections;
    self->_bleServerConnections = v20;

    bleServerConnections = self->_bleServerConnections;
  }
  [(NSMutableSet *)bleServerConnections addObject:v5];
  [v5 activate];
}

- (void)_clientBLEServerHandleConnectionEnded:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setClient:0];
    [(NSMutableSet *)self->_bleServerConnections removeObject:v4];
  }
}

- (void)_clientBLEServerHandleConnectionStateChange:(int)a3 cnx:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v9 = v6;
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    id v7 = [(RPNearbyInvitationDaemon *)self _idleSessionConnection];
    [v7 sessionActivatedWithError:0];
    [v7 setNetCnx:v9];
    [(RPNearbyInvitationDaemon *)self _update];

    id v6 = v9;
  }
}

- (void)_clientBLEServerEnsureStopped
{
  if (self->_bleServer)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_bleServerConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) invalidate:v10];
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_bleServerConnections removeAllObjects];
    bleServerConnections = self->_bleServerConnections;
    self->_bleServerConnections = 0;

    [(CUBLEServer *)self->_bleServer invalidate];
    bleServer = self->_bleServer;
    self->_bleServer = 0;
  }
}

- (void)_serverEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(RPNearbyInvitationDaemon *)self _serverBLENearbyInfoDiscoveryShouldRun])
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyInfoDiscoveryEnsureStarted];
  }
  else
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyInfoDiscoveryEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _serverBLENearbyActionDiscoveryShouldRun])
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionDiscoveryEnsureStarted];
  }
  else
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionDiscoveryEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _serverBLENearbyActionAdvertiserShouldRun])
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionAdvertiserEnsureStarted];
  }
  else
  {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionAdvertiserEnsureStopped];
  }
  if ([(RPNearbyInvitationDaemon *)self _serverBLEClientConnectionShouldStart])
  {
    [(RPNearbyInvitationDaemon *)self _serverBLEClientConnectionEnsureStarted];
  }
}

- (void)_serverEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(RPNearbyInvitationDaemon *)self _serverBLENearbyInfoDiscoveryEnsureStopped];
  [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionDiscoveryEnsureStopped];

  [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionAdvertiserEnsureStopped];
}

- (BOOL)_serverBLENearbyInfoDiscoveryShouldRun
{
  return [(NSMutableDictionary *)self->_activatedServerXPCCnxMap count] != 0;
}

- (void)_serverBLENearbyInfoDiscoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyInfoDiscovery)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = v3;

    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setDispatchQueue:self->_dispatchQueue];
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setEncodeSensitiveProperties:1];
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setControlFlags:0x200000002];
    if (self->_prefGuestServerEnabled)
    {
      [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setControlFlags:(unint64_t)[(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery controlFlags] | 0x400];
      [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setFlags:1];
    }
    if (!self->_prefServerRSSIDisabled) {
      [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setRssiThreshold:-57];
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005EAEC;
    v9[3] = &unk_100122ED8;
    v9[4] = self;
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005EAF8;
    v8[3] = &unk_100122ED8;
    v8[4] = self;
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005EB04;
    v7[3] = &unk_100122F00;
    v7[4] = self;
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery setDeviceChangedHandler:v7];
    id v5 = self->_bleNearbyInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005EB10;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(RPCompanionLinkClient *)v5 activateWithCompletion:v6];
  }
}

- (void)_serverBLENearbyInfoDiscoveryEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleNearbyInfoDiscovery)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkClient *)self->_bleNearbyInfoDiscovery invalidate];
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = 0;
  }
  devicesWantingInvitations = self->_devicesWantingInvitations;
  self->_devicesWantingInvitations = 0;

  [(RPNearbyInvitationDaemon *)self setBleDeviceWantingInvitations:0];
}

- (void)_serverBLENearbyInfoDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_devicesWantingInvitations;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isEqualToDevice:v4])
        {

          if (dword_1001419A0 <= 10 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_24;
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    [v4 bleDevice];
    uint64_t v15 = v14 = v4;
    LogPrintF();
  }
  devicesWantingInvitations = self->_devicesWantingInvitations;
  if (!devicesWantingInvitations)
  {
    long long v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    long long v12 = self->_devicesWantingInvitations;
    self->_devicesWantingInvitations = v11;

    devicesWantingInvitations = self->_devicesWantingInvitations;
  }
  -[NSMutableSet addObject:](devicesWantingInvitations, "addObject:", v4, v14, v15, (void)v16);
  long long v13 = [(RPNearbyInvitationDaemon *)self bleDeviceWantingInvitations];

  if (!v13) {
    [(RPNearbyInvitationDaemon *)self setBleDeviceWantingInvitations:v4];
  }
  [(RPNearbyInvitationDaemon *)self _update];
  if ((unint64_t)[(NSMutableSet *)self->_devicesWantingInvitations count] >= 2) {
    [(RPNearbyInvitationDaemon *)self _serverBLENearbyActionAdvertiserRestartTimer];
  }
LABEL_24:
}

- (void)_serverBLENearbyInfoDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_devicesWantingInvitations;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if ([v10 isEqualToDevice:v4]) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v11 = v10;

    if (!v11) {
      goto LABEL_17;
    }
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      id v12 = v4;
      LogPrintF();
    }
    -[NSMutableSet removeObject:](self->_devicesWantingInvitations, "removeObject:", v11, v12);
    [(RPNearbyInvitationDaemon *)self setBleDeviceWantingInvitations:0];
    [(RPNearbyInvitationDaemon *)self _update];
  }
  else
  {
LABEL_9:
    long long v11 = v5;
  }

LABEL_17:
}

- (BOOL)_serverBLENearbyActionDiscoveryShouldRun
{
  return [(NSMutableSet *)self->_devicesWantingInvitations count] != 0;
}

- (void)_serverBLENearbyActionDiscoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyActionDiscovery)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100141A10());
    bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
    self->_bleNearbyActionDiscovery = v3;

    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setPurpose:@"RPNearbyInvitation"];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setRssiThreshold:-60];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setDiscoveryFlags:16];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005F2E4;
    v8[3] = &unk_100122E20;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setDeviceFoundHandler:v8];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setDeviceLostHandler:&stru_100122F40];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005F384;
    v7[3] = &unk_100122E48;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setDeviceChangedHandler:v7];
    [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery setInterruptionHandler:&stru_100122F60];
    id v5 = self->_bleNearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005F404;
    v6[3] = &unk_100121908;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_serverBLENearbyActionDiscoveryEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SFDeviceDiscovery *)self->_bleNearbyActionDiscovery invalidate];
  bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
  self->_bleNearbyActionDiscovery = 0;
}

- (void)_serverBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v10 deviceActionType] == 56)
  {
    id v4 = [v10 identifier];
    id v5 = [v4 UUIDString];

    if (v5)
    {
      bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
      if (!bleDeviceAcceptedInvitations
        || ([(RPNearbyInvitationDevice *)bleDeviceAcceptedInvitations identifier],
            id v7 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v8 = [v5 isEqualToString:v7],
            v7,
            (v8 & 1) != 0))
      {
        if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v9 = objc_alloc_init((Class)RPNearbyInvitationDevice);
        [v9 setIdentifier:v5];
        [v9 updateWithSFDevice:v10];
        [(RPNearbyInvitationDaemon *)self setBleDeviceWantingInvitations:0];
        [(RPNearbyInvitationDaemon *)self setBleDeviceAcceptedInvitations:v9];
        [(RPNearbyInvitationDaemon *)self _update];

        goto LABEL_16;
      }
      if (dword_1001419A0 > 30 || dword_1001419A0 == -1 && !_LogCategory_Initialize())
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (dword_1001419A0 > 30 || dword_1001419A0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_16;
    }
    LogPrintF();
    goto LABEL_16;
  }
  if (dword_1001419A0 <= 10 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_17:
}

- (BOOL)_serverBLENearbyActionAdvertiserShouldRun
{
  return [(NSMutableSet *)self->_devicesWantingInvitations count] != 0;
}

- (void)_serverBLENearbyActionAdvertiserEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = [(RPNearbyInvitationDaemon *)self bleDeviceWantingInvitations];
  id v4 = [v3 bleTargetData];
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (bleNearbyActionAdvertiser)
  {
    id v6 = [(SFService *)bleNearbyActionAdvertiser targetAuthTag];
    if ((unint64_t)[(NSMutableSet *)self->_devicesWantingInvitations count] >= 2)
    {

      id v4 = 0;
    }
    if (v6 != v4)
    {
      if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4, v6, v4);
      }
      else
      {
        -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4, v13, v14);
      }
    }
  }
  else
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = (SFService *)objc_alloc_init(off_100141A18());
    unsigned __int8 v8 = self->_bleNearbyActionAdvertiser;
    self->_bleNearbyActionAdvertiser = v7;

    [(SFService *)self->_bleNearbyActionAdvertiser setDeviceActionType:84];
    [(SFService *)self->_bleNearbyActionAdvertiser setDispatchQueue:self->_dispatchQueue];
    id v9 = off_100141A28();
    [(SFService *)self->_bleNearbyActionAdvertiser setIdentifier:v9];

    [(SFService *)self->_bleNearbyActionAdvertiser setLabel:@"RPNearbyInvitation"];
    [(SFService *)self->_bleNearbyActionAdvertiser setPairSetupDisabled:1];
    [(SFService *)self->_bleNearbyActionAdvertiser setAdvertiseRate:50];
    id v10 = [(NSMutableSet *)self->_devicesWantingInvitations count];
    if (v10 == (id)1) {
      [(SFService *)self->_bleNearbyActionAdvertiser setTargetAuthTag:v4];
    }
    BOOL v11 = v10 == (id)1;
    id v12 = self->_bleNearbyActionAdvertiser;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005FA58;
    v15[3] = &unk_100122F88;
    v15[4] = self;
    BOOL v18 = v11;
    id v16 = v3;
    id v4 = v4;
    id v17 = v4;
    [(SFService *)v12 activateWithCompletion:v15];
  }
}

- (void)_serverBLENearbyActionAdvertiserEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SFService *)self->_bleNearbyActionAdvertiser invalidate];
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
  if (serverNearbyActionAdvertiserTimer)
  {
    id v6 = serverNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    id v5 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = 0;
  }
}

- (void)_serverBLENearbyActionAdvertiserRestartTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleNearbyActionAdvertiser)
  {
    serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
    if (serverNearbyActionAdvertiserTimer)
    {
      id v4 = serverNearbyActionAdvertiserTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_serverNearbyActionAdvertiserTimer;
      self->_serverNearbyActionAdvertiserTimer = 0;

      if (dword_1001419A0 > 50 || dword_1001419A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_12;
      }
    }
    else if (dword_1001419A0 > 50 || dword_1001419A0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v7 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = v6;
    unsigned __int8 v8 = v6;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005FDC8;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet();
    dispatch_activate(v8);
  }
}

- (BOOL)_serverBLEClientConnectionShouldStart
{
  BOOL result = 0;
  if (self->_prefServerEnabled && self->_prefGuestServerEnabled)
  {
    uint64_t v3 = [(RPNearbyInvitationDaemon *)self bleDeviceAcceptedInvitations];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [(NSMutableDictionary *)self->_bleClientConnections count];

      if (!v5) {
        return 1;
      }
    }
  }
  return result;
}

- (void)_serverBLEClientConnectionEnsureStarted
{
  id v3 = objc_alloc_init((Class)RPConnection);
  ++self->_sessionIDLast;
  id v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  id v5 = [(RPNearbyInvitationDaemon *)self bleDeviceAcceptedInvitations];
  id v6 = [v5 bleDevice];
  id v7 = [v6 identifier];

  [v3 setBlePeerIdentifier:v7];
  [v3 setBleClientUseCase:131091];
  [v3 setControlFlags:((unint64_t)[v3 controlFlags] | 0x600)];
  [v3 setDispatchQueue:self->_dispatchQueue];
  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  id v10 = [v8 initWithFormat:v9];
  [v3 setLabel:v10];

  BOOL v11 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  id v12 = [v11 localDeviceInfo];
  [v3 setLocalDeviceInfo:v12];

  [v3 setPasswordType:0];
  [v3 setPresent:1];
  [v3 setBleConnectionPSM:CBAssignedL2CAPPSMForNearbyInvitation];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = self->_xpcConnections;
  id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v19 = [v18 activatedServer];

        if (v19)
        {
          [v3 setClient:v18];
          goto LABEL_11;
        }
      }
      id v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100060390;
  v28[3] = &unk_100121770;
  v28[4] = v3;
  v28[5] = self;
  v28[6] = v4;
  [v3 setInvalidationHandler:v28];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100060418;
  v27[3] = &unk_100122FB0;
  v27[4] = v3;
  v27[5] = self;
  v27[6] = v4;
  [v3 setReceivedEventHandler:v27];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000604BC;
  v26[3] = &unk_100122FD8;
  v26[4] = v3;
  void v26[5] = self;
  v26[6] = v4;
  [v3 setReceivedRequestHandler:v26];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100060574;
  v25[3] = &unk_100121A98;
  v25[4] = v3;
  v25[5] = self;
  void v25[6] = v4;
  [v3 setStateChangedHandler:v25];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000605D4;
  v24[3] = &unk_1001222C0;
  v24[4] = v3;
  v24[5] = v4;
  [v3 setReadErrorHandler:v24];
  bleClientConnections = self->_bleClientConnections;
  if (!bleClientConnections)
  {
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v22 = self->_bleClientConnections;
    self->_bleClientConnections = v21;

    bleClientConnections = self->_bleClientConnections;
  }
  unsigned int v23 = [v7 UUIDString];
  [(NSMutableDictionary *)bleClientConnections setObject:v3 forKeyedSubscript:v23];

  [v3 activate];
}

- (void)_bleClientConnectionEnded:(id)a3
{
  id v6 = [a3 blePeerIdentifier];
  bleClientConnections = self->_bleClientConnections;
  id v5 = [v6 UUIDString];
  [(NSMutableDictionary *)bleClientConnections setObject:0 forKeyedSubscript:v5];

  [(RPNearbyInvitationDaemon *)self setBleDeviceAcceptedInvitations:0];
}

- (void)_bleClientConnectionStateChanged:(int)a3 cnx:(id)a4 sessionID:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  uint64_t v9 = [v12 client];
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 activatedServer];

    if (v11)
    {
      [(RPNearbyInvitationDaemon *)self setBleDeviceAcceptedInvitations:0];
      if (a3 == 1) {
        [v10 sessionStartWithID:v8 netCnx:v12 completion:&stru_100123018];
      }
      else {
        [v10 sessionEndedWithID:v8 netCnx:v12];
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [[RPNearbyInvitationXPCConnection alloc] initWithDaemon:self xpcCnx:v5];
  [(RPNearbyInvitationXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  ++self->_xpcLastID;
  -[RPNearbyInvitationXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100060A58;
  v14[3] = &unk_1001219D0;
  v14[4] = self;
  BOOL v11 = v6;
  id v15 = v11;
  [v5 setInvalidationHandler:v14];
  id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPNearbyInvitationXPCClientInterface];
  [v5 setRemoteObjectInterface:v12];

  [v5 resume];
  if (dword_1001419A0 <= 20 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    [v4 connectionInvalidated];
    [(NSMutableSet *)self->_xpcConnections removeObject:v4];
    [(RPNearbyInvitationDaemon *)self _update];
  }
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_systemMonitor)
  {
    id v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100060BD8;
    v5[3] = &unk_100121158;
    v5[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v5];
    [(CUSystemMonitor *)self->_systemMonitor activateWithCompletion:0];
  }
  if (self->_prefClientEnabled || self->_prefGuestClientEnabled) {
    [(RPNearbyInvitationDaemon *)self _clientEnsureStarted];
  }
  else {
    [(RPNearbyInvitationDaemon *)self _clientEnsureStopped];
  }
  if (self->_prefServerEnabled || self->_prefGuestServerEnabled) {
    [(RPNearbyInvitationDaemon *)self _serverEnsureStarted];
  }
  else {
    [(RPNearbyInvitationDaemon *)self _serverEnsureStopped];
  }
}

- (void)_handleServerActivation:(id)a3
{
  id v9 = a3;
  id v4 = [v9 activatedServer];
  id v5 = [v4 serviceType];

  if (v5)
  {
    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    if (!activatedServerXPCCnxMap)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v8 = self->_activatedServerXPCCnxMap;
      self->_activatedServerXPCCnxMap = v7;

      activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    }
    [(NSMutableDictionary *)activatedServerXPCCnxMap setObject:v9 forKeyedSubscript:v5];
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 xpcCnx:(id)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060DB0;
  block[3] = &unk_100123040;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async(dispatchQueue, block);
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 xpcCnx:(id)a7 sessionID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatchQueue = self->_dispatchQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006106C;
  v27[3] = &unk_100123068;
  id v28 = v18;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v19;
  id v33 = v17;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v18;
  dispatch_async(dispatchQueue, v27);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFService)bleNearbyActionAdvertiser
{
  return self->_bleNearbyActionAdvertiser;
}

- (void)setBleNearbyActionAdvertiser:(id)a3
{
}

- (SFService)clientBLENearbyActionAdvertiser
{
  return self->_clientBLENearbyActionAdvertiser;
}

- (void)setClientBLENearbyActionAdvertiser:(id)a3
{
}

- (SFDeviceDiscovery)bleNearbyActionDiscovery
{
  return self->_bleNearbyActionDiscovery;
}

- (void)setBleNearbyActionDiscovery:(id)a3
{
}

- (SFDeviceDiscovery)clientBLENearbyActionDiscovery
{
  return self->_clientBLENearbyActionDiscovery;
}

- (void)setClientBLENearbyActionDiscovery:(id)a3
{
}

- (unsigned)cnxIDLast
{
  return self->_cnxIDLast;
}

- (void)setCnxIDLast:(unsigned int)a3
{
  self->_cnxIDLast = a3;
}

- (RPCompanionLinkClient)bleNearbyInfoDiscovery
{
  return self->_bleNearbyInfoDiscovery;
}

- (void)setBleNearbyInfoDiscovery:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSMutableSet)devicesWantingInvitations
{
  return self->_devicesWantingInvitations;
}

- (void)setDevicesWantingInvitations:(id)a3
{
}

- (RPCompanionLinkDevice)bleDeviceWantingInvitations
{
  return self->_bleDeviceWantingInvitations;
}

- (RPNearbyInvitationDevice)bleDeviceAcceptedInvitations
{
  return self->_bleDeviceAcceptedInvitations;
}

- (CUBLEServer)bleServer
{
  return self->_bleServer;
}

- (void)setBleServer:(id)a3
{
}

- (NSMutableSet)bleServerConnections
{
  return self->_bleServerConnections;
}

- (void)setBleServerConnections:(id)a3
{
}

- (NSMutableDictionary)bleClientConnections
{
  return self->_bleClientConnections;
}

- (void)setBleClientConnections:(id)a3
{
}

- (RPNIProximityEstimator)proximityEstimator
{
  return self->_proximityEstimator;
}

- (void)setProximityEstimator:(id)a3
{
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)invalidateDone
{
  return self->_invalidateDone;
}

- (void)setInvalidateDone:(BOOL)a3
{
  self->_invalidateDone = a3;
}

- (BOOL)prefClientEnabled
{
  return self->_prefClientEnabled;
}

- (void)setPrefClientEnabled:(BOOL)a3
{
  self->_prefClientEnabled = a3;
}

- (BOOL)prefGuestServerEnabled
{
  return self->_prefGuestServerEnabled;
}

- (void)setPrefGuestServerEnabled:(BOOL)a3
{
  self->_prefGuestServerEnabled = a3;
}

- (BOOL)prefGuestClientEnabled
{
  return self->_prefGuestClientEnabled;
}

- (void)setPrefGuestClientEnabled:(BOOL)a3
{
  self->_prefGuestClientEnabled = a3;
}

- (BOOL)prefServerEnabled
{
  return self->_prefServerEnabled;
}

- (void)setPrefServerEnabled:(BOOL)a3
{
  self->_prefServerEnabled = a3;
}

- (BOOL)prefServerRSSIDisabled
{
  return self->_prefServerRSSIDisabled;
}

- (void)setPrefServerRSSIDisabled:(BOOL)a3
{
  self->_prefServerRSSIDisabled = a3;
}

- (OS_dispatch_source)clientNearbyActionDiscoveryTimer
{
  return self->_clientNearbyActionDiscoveryTimer;
}

- (void)setClientNearbyActionDiscoveryTimer:(id)a3
{
}

- (OS_dispatch_source)serverNearbyActionAdvertiserTimer
{
  return self->_serverNearbyActionAdvertiserTimer;
}

- (void)setServerNearbyActionAdvertiserTimer:(id)a3
{
}

- (OS_dispatch_source)clientNearbyActionAdvertiserTimer
{
  return self->_clientNearbyActionAdvertiserTimer;
}

- (void)setClientNearbyActionAdvertiserTimer:(id)a3
{
}

- (OS_dispatch_source)clientDisabledDupeFilterTimer
{
  return self->_clientDisabledDupeFilterTimer;
}

- (void)setClientDisabledDupeFilterTimer:(id)a3
{
}

- (unsigned)sessionIDLast
{
  return self->_sessionIDLast;
}

- (void)setSessionIDLast:(unsigned int)a3
{
  self->_sessionIDLast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDisabledDupeFilterTimer, 0);
  objc_storeStrong((id *)&self->_clientNearbyActionAdvertiserTimer, 0);
  objc_storeStrong((id *)&self->_serverNearbyActionAdvertiserTimer, 0);
  objc_storeStrong((id *)&self->_clientNearbyActionDiscoveryTimer, 0);
  objc_storeStrong((id *)&self->_proximityEstimator, 0);
  objc_storeStrong((id *)&self->_bleClientConnections, 0);
  objc_storeStrong((id *)&self->_bleServerConnections, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleDeviceAcceptedInvitations, 0);
  objc_storeStrong((id *)&self->_bleDeviceWantingInvitations, 0);
  objc_storeStrong((id *)&self->_devicesWantingInvitations, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_clientBLENearbyActionDiscovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionDiscovery, 0);
  objc_storeStrong((id *)&self->_clientBLENearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_activatedServerXPCCnxMap, 0);
  objc_storeStrong((id *)&self->_activatedSessionSet, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);

  objc_storeStrong((id *)&self->_activatedDiscoverySet, 0);
}

@end