@interface NetworkRelayAgent
+ (id)networkRelayIdentifierForBluetoothIdentifier:(id)a3;
+ (id)sharedInstance;
- (BOOL)hasPairingClients;
- (NetworkRelayAgent)init;
- (void)_networkRelayAgentPairingCompletedWithIdentifier:(id)a3 error:(id)a4;
- (void)_notifyDelegatesOfPairingCompletionWithIdentifier:(id)a3 error:(id)a4;
- (void)_notifyDelegatesOfUnpairingCompletionWithError:(id)a3;
- (void)_pairWithCandidate:(id)a3 withPreSharedAuthData:(id)a4;
- (void)_startScanningForCandidates;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)deviceHasUnpairedBluetooth:(id)a3;
- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4;
- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4;
- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsEnabledDidChange:(id)a3 isEnabled:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)deviceIsRegisteredDidChange:(id)a3 isRegistered:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4;
- (void)invalidatePairingManagerIfIdle;
- (void)passPINAuthDataToPairingCandidate:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)requestPINPairingForCandidateWithIdentifier:(id)a3;
- (void)requestPreSharedAuthForCandidateWithIdentifier:(id)a3 preSharedAuthData:(id)a4;
- (void)reset;
- (void)setHasPairingClients:(BOOL)a3;
- (void)startMonitoringDeviceWithBluetoothUUID:(id)a3;
- (void)startPushingCandidates;
- (void)startScanningForCandidates;
- (void)stopMonitoring;
- (void)stopPushingCandidates;
- (void)stopScanningForCandidates;
- (void)unpairNetworkRelayDeviceWithNetworkRelayIdentifier:(id)a3;
@end

@implementation NetworkRelayAgent

- (NetworkRelayAgent)init
{
  v17.receiver = self;
  v17.super_class = (Class)NetworkRelayAgent;
  v2 = [(NetworkRelayAgent *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.networkrelayagent", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    monitor = v2->_monitor;
    v2->_monitor = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    candidateExtendedMetadata = v2->_candidateExtendedMetadata;
    v2->_candidateExtendedMetadata = v7;

    monitoringBluetoothUUID = v2->_monitoringBluetoothUUID;
    v2->_monitoringBluetoothUUID = 0;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    identifierCandidateMap = v2->_identifierCandidateMap;
    v2->_identifierCandidateMap = v10;

    *(_WORD *)&v2->_scanningForCandidates = 0;
    v2->_pairingInProgress = 0;
    pendingPairingCandidateIdentifier = v2->_pendingPairingCandidateIdentifier;
    v2->_pendingPairingCandidateIdentifier = 0;

    pendingAuthData = v2->_pendingAuthData;
    v2->_pendingAuthData = 0;

    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    weakDelegates = v2->_weakDelegates;
    v2->_weakDelegates = (NSHashTable *)v14;
  }
  return v2;
}

- (void)dealloc
{
  monitor = self->_monitor;
  self->_monitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)NetworkRelayAgent;
  [(NetworkRelayAgent *)&v4 dealloc];
}

- (void)reset
{
  [(NSMutableDictionary *)self->_identifierCandidateMap removeAllObjects];
  pendingPairingCandidateIdentifier = self->_pendingPairingCandidateIdentifier;
  self->_pendingPairingCandidateIdentifier = 0;

  pendingAuthData = self->_pendingAuthData;
  self->_pendingAuthData = 0;
}

- (void)setHasPairingClients:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100064BB0;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)queue, v4);
}

- (void)invalidatePairingManagerIfIdle
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064C40;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100064E10;
    v7[3] = &unk_100165530;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100064EC4;
    v7[3] = &unk_100165530;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)startMonitoringDeviceWithBluetoothUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100064FB8;
    v8[3] = &unk_100165530;
    v9 = v4;
    v10 = self;
    dispatch_async((dispatch_queue_t)queue, v8);
    v7 = v9;
  }
  else
  {
    v7 = link_monitor_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid bluetooth UUID to start monitoring", buf, 2u);
    }
  }
}

- (void)stopMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006518C;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startScanningForCandidates
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[NetworkRelayAgent startScanningForCandidates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_scanningForCandidates)
  {
    id v4 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scanning already in progress", buf, 2u);
    }
  }
  else if (self->_pairingManager)
  {
    BOOL v5 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reuse existing NRDevicePairingManager to scan for candiates", buf, 2u);
    }

    [(NetworkRelayAgent *)self _startScanningForCandidates];
  }
  else
  {
    id v6 = objc_alloc_init((Class)NRDevicePairingCriteria);
    [v6 setPairingTransport:1];
    [v6 setDeviceType:1];
    [v6 setRssi:&off_100176A60];
    objc_initWeak((id *)buf, self);
    v7 = (NRDevicePairingManager *)[objc_alloc((Class)NRDevicePairingManager) initWithIdentifier:0 pairingCriteria:v6 metadata:0 queue:self->_queue];
    pairingManager = self->_pairingManager;
    self->_pairingManager = v7;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000655DC;
    v16[3] = &unk_100167C28;
    objc_copyWeak(&v17, (id *)buf);
    [(NRDevicePairingManager *)self->_pairingManager setCandidateDiscoveredHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000659C4;
    v14[3] = &unk_100167C28;
    objc_copyWeak(&v15, (id *)buf);
    [(NRDevicePairingManager *)self->_pairingManager setCandidateLostHandler:v14];
    [(NRDevicePairingManager *)self->_pairingManager setInvalidationHandler:&stru_100167C48];
    v9 = self->_pairingManager;
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100065C80;
      v11[3] = &unk_100167C70;
      objc_copyWeak(&v12, (id *)buf);
      [(NRDevicePairingManager *)v9 activateWithCompletion:v11];
      objc_destroyWeak(&v12);
    }
    else
    {
      v10 = networkrelay_pairing_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to initialize NRDevicePairingManager", v13, 2u);
      }
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_startScanningForCandidates
{
  self->_scanningForCandidates = 1;
  [(NRDevicePairingManager *)self->_pairingManager startDiscoveryWithCompletion:&stru_100167C90];
}

- (void)stopScanningForCandidates
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[NetworkRelayAgent stopScanningForCandidates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (self->_scanningForCandidates)
  {
    self->_scanningForCandidates = 0;
    [(NRDevicePairingManager *)self->_pairingManager cancelDiscovery];
  }
  else
  {
    id v4 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Currently not scanning for candidates", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)startPushingCandidates
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[NetworkRelayAgent startPushingCandidates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066054;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)stopPushingCandidates
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[NetworkRelayAgent stopPushingCandidates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066444;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)requestPreSharedAuthForCandidateWithIdentifier:(id)a3 preSharedAuthData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting to pair using pre-shared auth data with candidate with identifier = %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066604;
  block[3] = &unk_100165868;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_pairWithCandidate:(id)a3 withPreSharedAuthData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pendingPairingCandidateIdentifier = self->_pendingPairingCandidateIdentifier;
  if (*(_OWORD *)&self->_pendingPairingCandidateIdentifier != 0)
  {
    self->_pendingPairingCandidateIdentifier = 0;

    pendingAuthData = self->_pendingAuthData;
    self->_pendingAuthData = 0;

    [(NetworkRelayAgent *)self stopScanningForCandidates];
  }
  id v10 = objc_alloc_init((Class)NRDevicePairingTarget);
  [v10 setCandidate:v6];
  [v10 setAuthMethod:1];
  [v10 setAuthData:v7];
  pairingManager = self->_pairingManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000668AC;
  v14[3] = &unk_1001678E8;
  id v15 = v6;
  id v16 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000669A4;
  v13[3] = &unk_100167D00;
  v13[4] = self;
  id v12 = v6;
  [(NRDevicePairingManager *)pairingManager startPairingDevice:v10 withCompletion:v14 resultBlock:v13];
}

- (void)requestPINPairingForCandidateWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting PIN pairing for candidate with identifier = %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100066BF0;
  v8[3] = &unk_100165530;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)passPINAuthDataToPairingCandidate:(id)a3
{
  id v4 = a3;
  int v5 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestedPINPairingCandidateIdentifier = self->_requestedPINPairingCandidateIdentifier;
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2114;
    id v13 = requestedPINPairingCandidateIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Passing PIN data %@ for pairing with candidate with identifier %{public}@", buf, 0x16u);
  }

  if (v4 && self->_requestedPINPairingCandidateIdentifier && [v4 length])
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006700C;
    v8[3] = &unk_100165530;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)queue, v8);
  }
}

- (void)_networkRelayAgentPairingCompletedWithIdentifier:(id)a3 error:(id)a4
{
  self->_pairingInProgress = 0;
  [(NetworkRelayAgent *)self _notifyDelegatesOfPairingCompletionWithIdentifier:a3 error:a4];
}

- (void)_notifyDelegatesOfPairingCompletionWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_weakDelegates;
  id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 networkRelayPairingCompletedWithIdentifier:v6 error:v7];
        }
        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)unpairNetworkRelayDeviceWithNetworkRelayIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUIDString];
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unpairing NetworkRelay device with Network Relay Identifier %{public}@", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006770C;
  v8[3] = &unk_1001678E8;
  id v9 = [objc_alloc((Class)NRDeviceIdentifier) initWithUUID:v4];
  id v10 = self;
  id v7 = v9;
  +[NRDevicePairingManager unpairDevice:v7 withCompletion:v8];
}

- (void)_notifyDelegatesOfUnpairingCompletionWithError:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = self->_weakDelegates;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 networkRelayPairingCompletedWithError:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (id)sharedInstance
{
  if (qword_1001A11B0 != -1) {
    dispatch_once(&qword_1001A11B0, &stru_100167D48);
  }
  v2 = (void *)qword_1001A11A8;

  return v2;
}

+ (id)networkRelayIdentifierForBluetoothIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:](NRDeviceIdentifier, "newDeviceIdentifierWithBluetoothUUID:");
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 nrDeviceIdentifier];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    id v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      uint64_t v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F96CC(v8);
      }
    }
    int v5 = 0;
  }

  return v5;
}

- (void)deviceIsRegisteredDidChange:(id)a3 isRegistered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsRegisteredDidChange:%@ isRegistered:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsRegisteredDidChange:self->_monitoringBluetoothUUID isRegistered:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceIsEnabledDidChange:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsEnabledDidChange:%@ isEnabled:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsEnabledDidChange:self->_monitoringBluetoothUUID isEnabled:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsNearbyDidChange:%@ isNearby:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsNearbyDidChange:self->_monitoringBluetoothUUID isNearby:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsConnectedDidChange:%@ isConnected:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsConnectedDidChange:self->_monitoringBluetoothUUID isConnected:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsCloudConnectedDidChange:%@ isCloudConnected:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsCloudConnectedDidChange:self->_monitoringBluetoothUUID isCloudConnected:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsAsleepDidChange:%@ isAsleep:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsAsleepDidChange:self->_monitoringBluetoothUUID isAsleep:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4
{
  id v4 = a3;
  int v5 = link_monitor_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 deviceIdentifier];
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = StringFromNRLinkType;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deviceLinkTypeDidChange:%@ linkType:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = link_monitor_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceIsClassCConnectedDidChange:%@ isClassCConnected:%{BOOL}d", buf, 0x12u);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_weakDelegates;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 deviceIsClassCConnectedDidChange:self->_monitoringBluetoothUUID isClassCConnected:v4];
          }
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)deviceHasUnpairedBluetooth:(id)a3
{
  id v4 = a3;
  int v5 = link_monitor_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 deviceIdentifier];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deviceHasUnpairedBluetooth:%@", buf, 0xCu);
  }
  if (self->_monitoringBluetoothUUID)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v7 = self->_weakDelegates;
    id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
          if (objc_opt_respondsToSelector()) {
            [v12 deviceHasUnpairedBluetooth:self->_monitoringBluetoothUUID v13];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)hasPairingClients
{
  return self->_hasPairingClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakDelegates, 0);
  objc_storeStrong((id *)&self->_pendingAuthData, 0);
  objc_storeStrong((id *)&self->_pendingPairingCandidateIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedPINPairingCandidateIdentifier, 0);
  objc_storeStrong((id *)&self->_identifierCandidateMap, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_candidateExtendedMetadata, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_monitoringBluetoothUUID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end