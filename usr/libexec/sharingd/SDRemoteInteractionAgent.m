@interface SDRemoteInteractionAgent
+ (id)sharedAgent;
- (BOOL)_clientShouldStart;
- (BOOL)preventNotifications;
- (OS_dispatch_queue)dispatchQueue;
- (SDRemoteInteractionAgent)init;
- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3;
- (id)description;
- (int)sessionStart:(id)a3;
- (void)_clientClinkDeviceChanged:(id)a3;
- (void)_clientClinkDeviceFound:(id)a3;
- (void)_clientClinkDeviceLost:(id)a3;
- (void)_clientDeviceFound:(id)a3;
- (void)_clientDeviceLockStatusChanged;
- (void)_clientDeviceLost:(id)a3;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientUpdateCoalesceTimerForDevice:(id)a3 identifier:(id)a4;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_commonIDSChanged:(id)a3;
- (void)_commonRapportChanged:(id)a3;
- (void)_legacy_serverHandleEvent:(id)a3;
- (void)_legacy_serverHandleRequest:(id)a3;
- (void)_legacy_serverRespondInfo:(id)a3;
- (void)_sendRTIPayload:(id)a3;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_update;
- (void)activate;
- (void)advertisingTimerFired;
- (void)advertisingTimerStart;
- (void)clientNotificationPostIfNeededForDevice:(id)a3;
- (void)clientNotificationRemoveForDevice:(id)a3;
- (void)clientNotificationUpdateForDevice:(id)a3 info:(id)a4;
- (void)clientNotificationUpdateForDevice:(id)a3 rtiData:(id)a4;
- (void)clientTextSessionDidBegin:(id)a3 device:(id)a4;
- (void)clientUserDidTapNotification:(id)a3;
- (void)handleEventWithData:(id)a3;
- (void)invalidate;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)prefsChanged;
- (void)sessionStop:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testKeyboardPost:(id)a3;
- (void)testKeyboardPostThenUpdate;
- (void)testKeyboardPostWithDelay;
- (void)testKeyboardRemove;
- (void)testKeyboardRemoveWithDelay;
- (void)testKeyboardUpdate;
- (void)testKeyboardUpdateWithDelay;
@end

@implementation SDRemoteInteractionAgent

+ (id)sharedAgent
{
  if (qword_10097FFA0 != -1) {
    dispatch_once(&qword_10097FFA0, &stru_1008CD3D8);
  }
  v2 = (void *)qword_10097FFA8;

  return v2;
}

- (SDRemoteInteractionAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDRemoteInteractionAgent;
  v2 = [(SDRemoteInteractionAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)description
{
  uint64_t v30 = 0;
  NSAppendPrintF();
  id v3 = 0;
  id v29 = v3;
  controlService = self->_controlService;
  if (!controlService) {
    controlService = (SFService *)@"off";
  }
  v17 = controlService;
  NSAppendPrintF();
  id v5 = v29;

  id v28 = v5;
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  id v21 = [(NSMutableDictionary *)self->_devices count];
  int64_t rssiThreshold = self->_rssiThreshold;
  v18 = deviceDiscovery;
  NSAppendPrintF();
  id v7 = v28;

  id v27 = v7;
  id v19 = [(NSMutableSet *)self->_sessions count];
  NSAppendPrintF();
  id v8 = v7;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = self->_devices;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16, v19);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v13), v20);
        v20 = [v15 description];
        NSAppendPrintF();
        id v8 = v14;

        v13 = (char *)v13 + 1;
        v14 = v8;
      }
      while (v11 != v13);
      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16, v20);
    }
    while (v11);
  }

  return v8;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FABD4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FADB8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_clientEnabled != v3)
  {
    if (dword_100967A08 <= 40 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      v4 = "yes";
      if (v3) {
        id v5 = "no";
      }
      else {
        id v5 = "yes";
      }
      if (!v3) {
        v4 = "no";
      }
      v15 = v5;
      v17 = v4;
      LogPrintF();
    }
    self->_clientEnabled = v3;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_cloudPairedOnly != v6)
  {
    if (dword_100967A08 <= 40 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "yes";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (!v6) {
        id v7 = "no";
      }
      v15 = v8;
      v17 = v7;
      LogPrintF();
    }
    self->_cloudPairedOnly = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_serverEnabled != v9)
  {
    if (dword_100967A08 <= 40 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      id v10 = "yes";
      if (v9) {
        id v11 = "no";
      }
      else {
        id v11 = "yes";
      }
      if (!v9) {
        id v10 = "no";
      }
      v15 = v11;
      v17 = v10;
      LogPrintF();
    }
    self->_serverEnabled = v9;
  }
  uint64_t v12 = +[SDNearbyAgent sharedNearbyAgent];
  id v13 = [v12 bleProximityRSSIThreshold:@"kb"];

  int64_t rssiThreshold = self->_rssiThreshold;
  if (v13 != (id)rssiThreshold)
  {
    if (dword_100967A08 <= 40)
    {
      if (dword_100967A08 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_39;
        }
        int64_t rssiThreshold = self->_rssiThreshold;
      }
      int64_t v16 = rssiThreshold;
      id v18 = v13;
      LogPrintF();
    }
LABEL_39:
    self->_int64_t rssiThreshold = (int64_t)v13;
  }
  [(SDRemoteInteractionAgent *)self _update];
}

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FB1D0;
  v4[3] = &unk_1008CB9D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDRemoteInteractionAgent *)self _commonEnsureStarted];
  if (self->_serverEnabled) {
    [(SDRemoteInteractionAgent *)self _serverEnsureStarted];
  }
  else {
    [(SDRemoteInteractionAgent *)self _serverEnsureStopped];
  }
  if ([(SDRemoteInteractionAgent *)self _clientShouldStart])
  {
    [(SDRemoteInteractionAgent *)self _clientEnsureStarted];
  }
  else
  {
    [(SDRemoteInteractionAgent *)self _clientEnsureStopped];
  }
}

- (void)_commonEnsureStarted
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  v4 = (void *)v3;
  if (!self->_idsMonitorInstalled)
  {
    BOOL v6 = (void *)v3;
    if (dword_100967A08 <= 30)
    {
      if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
      {
        LogPrintF();
        v4 = v6;
      }
    }
    [v4 addObserver:self selector:"_commonIDSChanged:" name:@"SDNotificationNameIDSAccountsChanged" object:0];
    [v6 addObserver:self selector:"_commonIDSChanged:" name:@"SDNotificationNameIDSDevicesChanged" object:0];
    v4 = v6;
    self->_idsMonitorInstalled = 1;
  }
  if (!self->_rapportMonitorInstalled)
  {
    id v7 = v4;
    [v4 addObserver:self selector:"_commonRapportChanged:" name:off_100969790 object:0];
    v4 = v7;
    self->_rapportMonitorInstalled = 1;
  }
}

- (void)_commonEnsureStopped
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  int v5 = v3;
  if (self->_idsMonitorInstalled)
  {
    if (dword_100967A08 <= 30)
    {
      if (dword_100967A08 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
    [v3 removeObserver:self name:@"SDNotificationNameIDSAccountsChanged" object:0];
    [v5 removeObserver:self name:@"SDNotificationNameIDSDevicesChanged" object:0];
    uint64_t v3 = v5;
    self->_idsMonitorInstalled = 0;
  }
  if (self->_rapportMonitorInstalled)
  {
    [v3 removeObserver:self name:off_100969790 object:0];
    uint64_t v3 = v5;
    self->_rapportMonitorInstalled = 0;
  }
}

- (void)_commonIDSChanged:(id)a3
{
  id v4 = a3;
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB644;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_commonRapportChanged:(id)a3
{
  id v4 = a3;
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB724;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_serverEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleWPNearby)
  {
    uint64_t v3 = +[SFBLEClient sharedClient];
    id v4 = [v3 addNearbyDelegate:self];
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;
  }
  if (!self->_controlService)
  {
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v6 = (SFService *)objc_alloc_init((Class)SFService);
    controlService = self->_controlService;
    self->_controlService = v6;

    [(SFService *)self->_controlService setIdentifier:SFServiceIdentifierControl];
    [(SFService *)self->_controlService setSessionFlags:[(SFService *)self->_controlService sessionFlags] | 0x100];
    [(SFService *)self->_controlService setReceivedObjectHandler:&stru_1008CD418];
    [(SFService *)self->_controlService setReceivedRequestHandler:&stru_1008CD458];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FB9DC;
    v10[3] = &unk_1008CD480;
    v10[4] = self;
    [(SFService *)self->_controlService setEventMessageHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000FB9E8;
    v9[3] = &unk_1008CB018;
    v9[4] = self;
    [(SFService *)self->_controlService setRequestMessageHandler:v9];
    [(SFService *)self->_controlService activateWithCompletion:&stru_1008CD4A0];
  }
  id v8 = +[SDSharedRemoteTextInputClient sharedClient];
  [v8 addDelegate:self];
}

- (void)_serverEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  aggressiveTimer = self->_aggressiveTimer;
  if (aggressiveTimer)
  {
    id v4 = aggressiveTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_aggressiveTimer;
    self->_aggressiveTimer = 0;
  }
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v7 = rtiTimer;
    dispatch_source_cancel(v7);
    id v8 = self->_rtiTimer;
    self->_rtiTimer = 0;
  }
  BOOL v9 = +[SFBLEClient sharedClient];
  [v9 removeNearbyDelegate:self];

  bleWPNearby = self->_bleWPNearby;
  self->_bleWPNearby = 0;

  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = 0;

  currentText = self->_currentText;
  self->_currentText = 0;

  [(SFService *)self->_controlService invalidate];
  controlService = self->_controlService;
  self->_controlService = 0;

  id v14 = +[SDSharedRemoteTextInputClient sharedClient];
  [v14 removeDelegate:self];
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(NSMutableSet *)self->_legacy_sessionDeviceIDs containsObject:v7])
  {
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[NSMutableSet removeObject:](self->_legacy_sessionDeviceIDs, "removeObject:", v7, v7);
    }
    else
    {
      -[NSMutableSet removeObject:](self->_legacy_sessionDeviceIDs, "removeObject:", v7, v6);
    }
  }
}

- (void)_legacy_serverHandleEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 peerDevice];
  uint64_t v6 = [v5 identifier];
  if (!v6)
  {
    if (dword_100967A08 > 50 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_21;
  }
  id v7 = +[SDNearbyAgent sharedNearbyAgent];
  id v8 = [v7 idsBluetoothDeviceIDsForSharing];
  unsigned __int8 v9 = [v8 containsObject:v6];

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || [v5 systemPairState] <= 0x13))
  {
    if (dword_100967A08 > 50 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  id v10 = [v4 headerFields];
  CFDictionaryGetTypeID();
  id v11 = CFDictionaryGetTypedValue();

  if (v11)
  {
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v14 = +[SDSharedRemoteTextInputClient sharedClient];
    [v14 handleTextInputData:v11];

    goto LABEL_21;
  }
  uint64_t v12 = [v4 headerFields];
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

  if (Int64Ranged != 10)
  {
    if (dword_100967A08 > 40 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
    currentSessionID = self->_currentSessionID;
    id v19 = v6;
    LogPrintF();
  }
  if (self->_currentSessionID)
  {
    legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
    if (!legacy_sessionDeviceIDs)
    {
      int64_t v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v17 = self->_legacy_sessionDeviceIDs;
      self->_legacy_sessionDeviceIDs = v16;

      legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
    }
    -[NSMutableSet addObject:](legacy_sessionDeviceIDs, "addObject:", v6, currentSessionID, v19);
    [(SDRemoteInteractionAgent *)self _serverSendTextSessionDidBegin:v6];
  }
LABEL_21:
}

- (void)_legacy_serverHandleRequest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 peerDevice];
  uint64_t v6 = [v5 identifier];
  id v7 = +[SDNearbyAgent sharedNearbyAgent];
  id v8 = [v7 idsBluetoothDeviceIDsForSharing];
  unsigned __int8 v9 = [v8 containsObject:v6];

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || [v5 systemPairState] <= 0x13))
  {
    if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = [v4 headerFields];
    char Int64Ranged = CFDictionaryGetInt64Ranged();

    if (Int64Ranged == 1)
    {
      [(SDRemoteInteractionAgent *)self _legacy_serverRespondInfo:v4];
      goto LABEL_15;
    }
    if (dword_100967A08 <= 40 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
LABEL_11:
    }
      LogPrintF();
  }
LABEL_15:
}

- (void)_legacy_serverRespondInfo:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = MGCopyAnswer();
  uint64_t v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"?";
  }
  [v9 setObject:v7 forKeyedSubscript:@"name"];
  id v8 = [objc_alloc((Class)SFResponseMessage) initWithRequestMessage:v4];

  [v8 setHeaderFields:v9];
  [(SFService *)self->_controlService sendResponse:v8];
}

- (void)_sendRTIPayload:(id)a3
{
  id v16 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v16)
  {
    if (dword_100967A08 > 60 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_21:
    LogPrintF();
    goto LABEL_13;
  }
  uint64_t v5 = SFRTIDataPayloadForData();
  if (!v5)
  {
    if (dword_100967A08 > 60 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  uint64_t v6 = (void *)v5;
  [v4 setObject:v16 forKeyedSubscript:@"rp"];
  uint64_t v7 = SFFullTextFromRTIDataPayload();
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_1008E7020;
  }
  id v10 = v9;

  objc_storeStrong((id *)&self->_currentText, v9);
  [v4 setObject:&off_100902B20 forKeyedSubscript:@"o"];
  [v4 setObject:v10 forKeyedSubscript:@"t"];
  [v4 setObject:v16 forKeyedSubscript:@"rp"];
  id v11 = [objc_alloc((Class)SFRemoteTextSessionInfo) initWithRTIPayload:v6];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 dictionaryRepresentation];
    [v4 setObject:v13 forKeyedSubscript:@"tsi"];
  }
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableSet *)self->_legacy_sessionDeviceIDs count];
    LogPrintF();
  }
  id v14 = objc_alloc_init((Class)SFEventMessage);
  [v14 setDeviceIDs:self->_legacy_sessionDeviceIDs];
  [v14 setHeaderFields:v4];
  v15 = +[NSUUID UUID];
  [v14 setIdentifier:v15];

  [(SFService *)self->_controlService sendEvent:v14];
LABEL_13:
}

- (void)handleEventWithData:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100967A08 <= 30)
  {
    if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      uint64_t v6 = SFTextInputDataLogString();
      LogPrintF();

      id v4 = v7;
    }
  }
  -[SDRemoteInteractionAgent _sendRTIPayload:](self, "_sendRTIPayload:", v4, v6);
}

- (void)advertisingTimerFired
{
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v4 = rtiTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_rtiTimer;
    self->_rtiTimer = 0;
  }
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDRemoteInteractionAgent *)self handleInputDidEndWithFlags:0 sessionInfo:0];

  SFMetricsLog();
}

- (void)advertisingTimerStart
{
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v4 = rtiTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_rtiTimer;
    self->_rtiTimer = 0;
  }
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v7 = self->_rtiTimer;
  self->_rtiTimer = v6;

  id v8 = self->_rtiTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000FC8C4;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  id v9 = self->_rtiTimer;
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_rtiTimer);
}

- (int)sessionStart:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000FCAE4;
  long long v23 = sub_1000FCB10;
  id v24 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v5 = [v4 peerDevice];

  if (v5)
  {
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setAgent:self];
    uint64_t v6 = [v4 remoteTextEventHandler];

    if (v6)
    {
      uint64_t v7 = [v4 remoteTextEventHandler];
      id v8 = (void *)v20[5];
      v20[5] = v7;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FCB18;
    v15[3] = &unk_1008CD4C8;
    id v18 = &v19;
    id v9 = v4;
    id v16 = v9;
    v17 = self;
    [v9 setRemoteTextEventHandler:v15];

    sessions = self->_sessions;
    if (!sessions)
    {
      id v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      uint64_t v12 = self->_sessions;
      self->_sessions = v11;

      sessions = self->_sessions;
    }
    [(NSMutableSet *)sessions addObject:v9];
    [v9 activateWithCompletion:0];
    [(SDRemoteInteractionAgent *)self _update];
    int v13 = 0;
  }
  else
  {
    int v13 = -6705;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)sessionStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_sessions removeObject:v4];
  [(SDRemoteInteractionAgent *)self _update];
}

- (void)_clientEnsureStarted
{
  if (self->_deviceDiscovery)
  {
    if (self->_cloudPairedOnly)
    {
      uint64_t v3 = +[SDNearbyAgent sharedNearbyAgent];
      id v4 = [v3 idsBluetoothDeviceIDsForSharing];
    }
    else
    {
      id v4 = 0;
    }
    id v5 = [(SFDeviceDiscovery *)self->_deviceDiscovery deviceFilter];
    id v6 = v4;
    uint64_t v7 = v6;
    if (v5 == v6)
    {
    }
    else
    {
      if ((v6 != 0) != (v5 == 0))
      {
        unsigned __int8 v8 = [v5 isEqual:v6];

        if (v8) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFilter:v7];
    }
LABEL_15:
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", [v7 count] != 0);

    goto LABEL_21;
  }
  if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v9 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v9;

  [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:5];
  BOOL cloudPairedOnly = self->_cloudPairedOnly;
  uint64_t v12 = +[SDNearbyAgent sharedNearbyAgent];
  int v13 = v12;
  if (cloudPairedOnly)
  {
    id v14 = [v12 idsBluetoothDeviceIDsForSharing];

    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFilter:v14];
  }
  else
  {
    id v14 = [v12 idsDeviceIDsForRIServers];
  }
  -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", [v14 count] != 0);

  [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:64];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"RIA"];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:self->_rssiThreshold];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:10];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000FD1AC;
  v24[3] = &unk_1008CADB8;
  v24[4] = self;
  [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v24];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000FD26C;
  v23[3] = &unk_1008CADB8;
  v23[4] = self;
  [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000FD32C;
  v22[3] = &unk_1008CADE0;
  v22[4] = self;
  [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v22];
  [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1008CD4E8];
LABEL_21:
  if (!self->_notificationManager)
  {
    v15 = +[SDNotificationManager sharedManager];
    notificationManager = self->_notificationManager;
    self->_notificationManager = v15;

    [(SDNotificationManager *)self->_notificationManager activate];
  }
  if (!self->_clinkClient)
  {
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v17 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clinkClient = self->_clinkClient;
    self->_clinkClient = v17;

    [(RPCompanionLinkClient *)self->_clinkClient setControlFlags:(unint64_t)[(RPCompanionLinkClient *)self->_clinkClient controlFlags] | 0x2004];
    [(RPCompanionLinkClient *)self->_clinkClient setDispatchQueue:self->_dispatchQueue];
    [(RPCompanionLinkClient *)self->_clinkClient setInterruptionHandler:&stru_1008CD508];
    [(RPCompanionLinkClient *)self->_clinkClient setInvalidationHandler:&stru_1008CD528];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000FD5CC;
    v21[3] = &unk_1008CA828;
    v21[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceFoundHandler:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000FD5D8;
    v20[3] = &unk_1008CA828;
    v20[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceLostHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000FD5E4;
    v19[3] = &unk_1008CA850;
    v19[4] = self;
    [(RPCompanionLinkClient *)self->_clinkClient setDeviceChangedHandler:v19];
    [(RPCompanionLinkClient *)self->_clinkClient activateWithCompletion:&stru_1008CD548];
  }
}

- (void)_clientEnsureStopped
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = self->_notificationTimers;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationTimers, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        dispatch_source_cancel(v8);
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_notificationTimers removeAllObjects];
  notificationTimers = self->_notificationTimers;
  self->_notificationTimers = 0;

  [(NSMutableSet *)self->_sessions removeAllObjects];
  sessions = self->_sessions;
  self->_sessions = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    [(NSMutableDictionary *)self->_devices removeAllObjects];
    devices = self->_devices;
    self->_devices = 0;
  }
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    [(RPCompanionLinkClient *)clinkClient invalidate];
    id v14 = self->_clinkClient;
    self->_clinkClient = 0;
  }
}

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100967A08 <= 30)
  {
    id v6 = v3;
    if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100967A08 <= 30)
  {
    id v6 = v3;
    if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100967A08 <= 30)
  {
    id v6 = v3;
    if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_clientDeviceFound:(id)a3
{
  id v23 = a3;
  id v4 = [v23 bleDevice];
  int v5 = [v23 identifier];
  uint64_t v6 = [v23 idsIdentifier];
  uint64_t v7 = (void *)v6;
  if (self->_deviceDiscovery) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_34;
  }
  if (self->_cloudPairedOnly)
  {
    id v9 = +[SDNearbyAgent sharedNearbyAgent];
    dispatch_time_t v10 = [v9 idsBluetoothDeviceIDsForSharing];
    id v11 = v10;
    uint64_t v12 = v5;
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    id v9 = +[SDNearbyAgent sharedNearbyAgent];
    dispatch_time_t v10 = [v9 idsDeviceIDsForRIServers];
    id v11 = v10;
    uint64_t v12 = v7;
  }
  unsigned __int8 v13 = [v10 containsObject:v12];

  if (v13) {
    goto LABEL_15;
  }
  if (self->_cloudPairedOnly)
  {
LABEL_11:
    if (dword_100967A08 <= 9 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
LABEL_13:
      LogPrintF();
      goto LABEL_34;
    }
    goto LABEL_34;
  }
LABEL_14:
  if ([v23 systemPairState] <= 0x13) {
    goto LABEL_11;
  }
LABEL_15:
  uint64_t v14 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v5];
  if (v14)
  {
    long long v15 = (void *)v14;
    [(SDRemoteInteractionAgent *)self _clientUpdateCoalesceTimerForDevice:v23 identifier:v5];
  }
  else if (!self->_preventNotifications && [v23 needsKeyboardOnly])
  {
    id v16 = [v4 smoothedRSSI];
    unint64_t rssiThreshold = 0x8000000000000000;
    if ((unint64_t)v16 <= 0x8000000000000000) {
      unint64_t v18 = 0x8000000000000000;
    }
    else {
      unint64_t v18 = (unint64_t)v16;
    }
    if (self->_rssiThreshold > 0x8000000000000000) {
      unint64_t rssiThreshold = self->_rssiThreshold;
    }
    if (v18 < rssiThreshold)
    {
      if (dword_100967A08 <= 9 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
        goto LABEL_13;
      }
    }
    else
    {
      if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
      {
        v22 = v4;
        LogPrintF();
      }
      devices = self->_devices;
      if (!devices)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v21 = self->_devices;
        self->_devices = v20;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v23, v5, v22);
      [(SDRemoteInteractionAgent *)self clientNotificationPostIfNeededForDevice:v23];
    }
  }
LABEL_34:
}

- (void)_clientDeviceLost:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 identifier];
  int v5 = (void *)v4;
  if (self->_deviceDiscovery) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];

    if (v7)
    {
      if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
      {
        id v10 = v11;
        LogPrintF();
      }
      BOOL v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationTimers, "objectForKeyedSubscript:", v5, v10);
      id v9 = v8;
      if (v8)
      {
        dispatch_source_cancel(v8);
        [(NSMutableDictionary *)self->_notificationTimers removeObjectForKey:v5];
      }
      [(NSMutableDictionary *)self->_devices removeObjectForKey:v5];
      [(SDRemoteInteractionAgent *)self clientNotificationRemoveForDevice:v11];
    }
  }
}

- (void)_clientDeviceLockStatusChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FDEC0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_clientShouldStart
{
  id v3 = +[SDNearbyAgent sharedNearbyAgent];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 idsDeviceIDsForRIServers];
    unint64_t v6 = (unint64_t)[v5 count];

    uint64_t v7 = [v4 idsBluetoothDeviceIDsForWatches];
    unint64_t v8 = (unint64_t)[v7 count];

    BOOL v9 = self->_clientEnabled || [(NSMutableSet *)self->_sessions count] != 0;
    if (v6 | v8) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 name];
  id v23 = [v4 model];
  unint64_t v6 = [v4 idsIdentifier];
  uint64_t v7 = [v4 mediaRouteID];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    id v22 = v4;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned __int8 v13 = [v12 idsDeviceIdentifier];
        unsigned __int8 v14 = [v13 isEqualToString:v6];

        if (v14) {
          goto LABEL_20;
        }
        long long v15 = [v12 mediaRouteIdentifier];
        unsigned __int8 v16 = [v15 isEqualToString:v7];

        if (v16) {
          goto LABEL_20;
        }
        long long v17 = [v12 name];
        if ([v17 isEqualToString:v5])
        {
          unint64_t v18 = [v12 model];
          unsigned int v19 = [v18 isEqualToString:v23];

          if (v19)
          {
            if (dword_100967A08 <= 90 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
LABEL_20:
            id v20 = v12;
            id v4 = v22;
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v20 = 0;
      id v4 = v22;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_21:

  return v20;
}

- (void)clientNotificationPostIfNeededForDevice:(id)a3
{
  id v20 = a3;
  id v4 = [v20 model];
  int v5 = v4;
  if (!v4)
  {
    if (dword_100967A08 <= 90 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
  if (![v4 hasPrefix:@"AppleTV"])
  {
    unint64_t v6 = +[SDNearbyAgent sharedNearbyAgent];
    unsigned int v7 = [v6 isDeviceValidRIServer:v5];

    if (v7)
    {
      id v8 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
      id v9 = SFDeviceToRPCompanionLinkDevice();
      BOOL v10 = v9 != 0;

      [(SDNotificationManager *)self->_notificationManager riServerPostIfNeeded:v20 backgroundAction:v10];
    }
    else if ([v5 hasPrefix:@"Watch"])
    {
      [(SDNotificationManager *)self->_notificationManager watchKeyboardPostIfNeeded:v20];
    }
    else if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
  if ([v20 deviceActionType] != 19)
  {
    id v11 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
    uint64_t v12 = SFDeviceToRPCompanionLinkDevice();

    if (v12
      || ([(SDRemoteInteractionAgent *)self _rpCompanionLinkDeviceForSFDevice:v20], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_37:

        goto LABEL_38;
      }
      unsigned __int8 v13 = [v12 activeUserAltDSID];
      id v14 = objc_alloc_init((Class)off_100967A78[0]());
      long long v15 = [v14 aa_primaryAppleAccount];
      unsigned __int8 v16 = [v15 aa_altDSID];
      if ([v16 isEqualToString:v13])
      {
        [(SDNotificationManager *)self->_notificationManager riServerPostIfNeeded:v20 backgroundAction:1];
      }
      else if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      unsigned __int8 v13 = [v20 identifier];
      long long v17 = +[SDNearbyAgent sharedNearbyAgent];
      unint64_t v18 = [v17 idsBluetoothDeviceIDsForSharing];
      unsigned int v19 = [v18 containsObject:v13];

      if (v19) {
        [(SDNotificationManager *)self->_notificationManager riServerPostIfNeeded:v20 backgroundAction:0];
      }
      uint64_t v12 = 0;
    }

    goto LABEL_37;
  }
  if (dword_100967A08 <= 90 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
LABEL_9:
  }
    LogPrintF();
LABEL_38:
}

- (void)clientNotificationRemoveForDevice:(id)a3
{
  id v8 = a3;
  id v4 = [v8 model];
  int v5 = v4;
  if (v4)
  {
    if (([v4 hasPrefix:@"AppleTV"] & 1) != 0
      || (+[SDNearbyAgent sharedNearbyAgent],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isDeviceValidRIServer:v5],
          v6,
          v7))
    {
      [(SDNotificationManager *)self->_notificationManager riServerRemove:v8];
      goto LABEL_5;
    }
    if ([v5 hasPrefix:@"Watch"])
    {
      [(SDNotificationManager *)self->_notificationManager watchKeyboardRemove:v8];
      goto LABEL_5;
    }
    if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      goto LABEL_12;
    }
  }
  else if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
LABEL_12:
    LogPrintF();
  }
LABEL_5:
}

- (void)clientNotificationUpdateForDevice:(id)a3 rtiData:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unsigned int v7 = [v11 model];
  id v8 = v7;
  if (v7)
  {
    if (([v7 hasPrefix:@"AppleTV"] & 1) != 0
      || (+[SDNearbyAgent sharedNearbyAgent],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isDeviceValidRIServer:v8],
          v9,
          v10))
    {
      [(SDNotificationManager *)self->_notificationManager riServerUpdate:v11 rtiData:v6];
      goto LABEL_5;
    }
    if ([v8 hasPrefix:@"Watch"])
    {
      [(SDNotificationManager *)self->_notificationManager watchKeyboardUpdate:v11 rtiData:v6];
      goto LABEL_5;
    }
    if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      goto LABEL_12;
    }
  }
  else if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
LABEL_12:
    LogPrintF();
  }
LABEL_5:
}

- (void)clientNotificationUpdateForDevice:(id)a3 info:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unsigned int v7 = [v11 model];
  id v8 = v7;
  if (v7)
  {
    if (([v7 hasPrefix:@"AppleTV"] & 1) != 0
      || (+[SDNearbyAgent sharedNearbyAgent],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isDeviceValidRIServer:v8],
          v9,
          v10))
    {
      [(SDNotificationManager *)self->_notificationManager riServerUpdate:v11 info:v6];
      goto LABEL_5;
    }
    if ([v8 hasPrefix:@"Watch"])
    {
      [(SDNotificationManager *)self->_notificationManager watchKeyboardUpdate:v11 info:v6];
      goto LABEL_5;
    }
    if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
      goto LABEL_12;
    }
  }
  else if (dword_100967A08 <= 60 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
LABEL_12:
    LogPrintF();
  }
LABEL_5:
}

- (void)clientTextSessionDidBegin:(id)a3 device:(id)a4
{
}

- (void)_clientUpdateCoalesceTimerForDevice:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_notificationTimers objectForKeyedSubscript:v7];
  if ([v6 needsKeyboardOnly])
  {
    if (v8)
    {
      if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
      {
        long long v15 = [v6 bleDevice];
        LogPrintF();
      }
      dispatch_source_cancel(v8);
      [(NSMutableDictionary *)self->_notificationTimers removeObjectForKey:v7];
    }
  }
  else if (!v8)
  {
    if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      id v14 = [v6 bleDevice];
      LogPrintF();
    }
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    SFDispatchTimerSet();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000FEDCC;
    handler[3] = &unk_1008CA770;
    id v17 = v6;
    id v8 = v9;
    unint64_t v18 = v8;
    unsigned int v19 = self;
    id v10 = v7;
    id v20 = v10;
    dispatch_source_set_event_handler(v8, handler);
    notificationTimers = self->_notificationTimers;
    if (!notificationTimers)
    {
      uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      unsigned __int8 v13 = self->_notificationTimers;
      self->_notificationTimers = v12;

      notificationTimers = self->_notificationTimers;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](notificationTimers, "setObject:forKeyedSubscript:", v8, v10, v14);
    dispatch_resume(v8);
  }
}

- (void)clientUserDidTapNotification:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (dword_100967A08 <= 30)
  {
    if (dword_100967A08 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v15, v5))
    {
      id v13 = v4;
      LogPrintF();
      id v4 = v15;
    }
  }
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4, v13);
  if (!v6)
  {
    if (dword_100967A08 > 90 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
LABEL_14:
    LogPrintF();
    goto LABEL_26;
  }
  id v7 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
  id v8 = SFDeviceToRPCompanionLinkDevice();

  if (!v8)
  {
    id v8 = [(SDRemoteInteractionAgent *)self _rpCompanionLinkDeviceForSFDevice:v6];
    if (!v8)
    {
      if (dword_100967A08 > 90 || dword_100967A08 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_26;
      }
      goto LABEL_14;
    }
  }
  dispatch_source_t v9 = [v8 identifier];
  if (v9)
  {
    id v10 = objc_alloc((Class)off_100967A80[0]());
    id v11 = [v10 initWithDeviceIdentifier:v9 identifierType:off_100967A88[0]() deviceType:1 launchContext:10];
    uint64_t v12 = [(objc_class *)off_100967A90() sharedInstance];
    if (dword_100967A08 <= 30 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
    {
      id v14 = v9;
      LogPrintF();
    }
    [v12 presentWithContext:v11, v14];
  }
  else if (dword_100967A08 <= 90 && (dword_100967A08 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_26:
}

- (void)testKeyboardPost:(id)a3
{
  id v6 = a3;
  if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)SFDevice);
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v5];

  if ([v6 isEqual:@"-autofill"]) {
    [v4 setDeviceActionType:19];
  }
  [(SDNotificationManager *)self->_notificationManager riServerPostIfNeeded:v4 backgroundAction:0];
}

- (void)testKeyboardPostThenUpdate
{
  if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  [v4 setName:@"postAndUpdate"];
  [(SDNotificationManager *)self->_notificationManager riServerPostIfNeeded:v4 backgroundAction:0];
}

- (void)testKeyboardPostWithDelay
{
}

- (void)testKeyboardRemove
{
  if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  [(SDNotificationManager *)self->_notificationManager riServerRemove:v4];
}

- (void)testKeyboardRemoveWithDelay
{
}

- (void)testKeyboardUpdate
{
  if (dword_100967A08 <= 50 && (dword_100967A08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v5 setIdentifier:v3];

  id v4 = objc_alloc_init((Class)SFRemoteTextSessionInfo);
  [v4 setTitle:@"Continuity Keyboard"];
  [(SDNotificationManager *)self->_notificationManager riServerUpdate:v5 info:v4];
}

- (void)testKeyboardUpdateWithDelay
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sessionDeviceIDs, 0);
  objc_storeStrong((id *)&self->_rtiTimer, 0);
  objc_storeStrong((id *)&self->_notificationTimers, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_legacy_sessionDeviceIDs, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_currentText, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);
  objc_storeStrong((id *)&self->_controlService, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_bleWPNearby, 0);

  objc_storeStrong((id *)&self->_aggressiveTimer, 0);
}

@end