@interface CARCarPlayServiceConnector
- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3;
- (CARCarPlayServiceConnector)initWithVehicleStore:(id)a3;
- (CARCarPlayServiceConnectorDelegate)delegate;
- (CBCentralManager)centralManager;
- (CBDiscovery)discoverer;
- (CBPeripheral)activePeripheral;
- (CRVehicleStore)vehicleStore;
- (NSMutableDictionary)servicesForBluetoothIdentifiers;
- (NSMutableDictionary)vehiclesForBluetoothIdentifiers;
- (NSSet)connectedVehicles;
- (NSSet)identifiersToDiscover;
- (NSString)pairingPeripheralName;
- (NSUUID)pairingPeripheralIdentifier;
- (id)_pairedBLEIdentifiers;
- (id)_periperalForIdentifier:(id)a3;
- (id)_vehicleForService:(id)a3;
- (id)actionPendingPowerOn;
- (id)currentConnectionCompletion;
- (void)_addConnectedVehicle:(id)a3;
- (void)_connectWithBluetoothIdentifier:(id)a3 completion:(id)a4;
- (void)_finishedCurrentPairing;
- (void)_handleIdentificationMessage:(id)a3 fromService:(id)a4;
- (void)_handleStartSessionMessage:(id)a3 fromService:(id)a4;
- (void)_mainQueue_handleDidDiscoverDevice:(id)a3;
- (void)_pairWithBluetoothIdentifier:(id)a3 deviceName:(id)a4;
- (void)_removeConnectedVehicle:(id)a3;
- (void)_startServiceForPeripheral:(id)a3;
- (void)_updateDiscoverer;
- (void)carPlayService:(id)a3 didFailToSendMessage:(id)a4;
- (void)carPlayService:(id)a3 didReceiveMessage:(id)a4;
- (void)carPlayService:(id)a3 didSendMessage:(id)a4;
- (void)carPlayServiceDidActivate:(id)a3;
- (void)carPlayServiceDidDeactivate:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdateANCSAuthorizationForPeripheral:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectWithBluetoothLEIdentifier:(id)a3;
- (void)invalidate;
- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)setActionPendingPowerOn:(id)a3;
- (void)setActivePeripheral:(id)a3;
- (void)setCurrentConnectionCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPairingPeripheralIdentifier:(id)a3;
- (void)setPairingPeripheralName:(id)a3;
- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4;
- (void)vehicleStore:(id)a3 didSaveVehicle:(id)a4;
- (void)vehicleStoreDidBecomeAvailable:(id)a3;
@end

@implementation CARCarPlayServiceConnector

- (CARCarPlayServiceConnector)initWithVehicleStore:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CARCarPlayServiceConnector;
  v6 = [(CARCarPlayServiceConnector *)&v21 init];
  if (v6)
  {
    v22 = CBCentralManagerOptionShowPowerAlertKey;
    v23 = &__kCFBooleanTrue;
    v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_storeStrong((id *)&v6->_vehicleStore, a3);
    [v5 addObserver:v6];
    v8 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:v6 queue:&_dispatch_main_q options:v7];
    centralManager = v6->_centralManager;
    v6->_centralManager = v8;

    id v10 = [(CBCentralManager *)v6->_centralManager sharedPairingAgent];
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    servicesForBluetoothIdentifiers = v6->_servicesForBluetoothIdentifiers;
    v6->_servicesForBluetoothIdentifiers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    vehiclesForBluetoothIdentifiers = v6->_vehiclesForBluetoothIdentifiers;
    v6->_vehiclesForBluetoothIdentifiers = v13;

    pairingPeripheralIdentifier = v6->_pairingPeripheralIdentifier;
    v6->_pairingPeripheralIdentifier = 0;

    pairingPeripheralName = v6->_pairingPeripheralName;
    v6->_pairingPeripheralName = 0;

    activePeripheral = v6->_activePeripheral;
    v6->_activePeripheral = 0;

    id currentConnectionCompletion = v6->_currentConnectionCompletion;
    v6->_id currentConnectionCompletion = 0;

    id actionPendingPowerOn = v6->_actionPendingPowerOn;
    v6->_id actionPendingPowerOn = 0;

    if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
    {
      [(CARCarPlayServiceConnector *)v6 _updateDiscoverer];
    }
  }
  return v6;
}

- (void)invalidate
{
}

- (void)_updateDiscoverer
{
  p_identifiersToDiscover = (uint64_t *)&self->_identifiersToDiscover;
  identifiersToDiscover = self->_identifiersToDiscover;
  if (identifiersToDiscover
    && ([(CARCarPlayServiceConnector *)self _pairedBLEIdentifiers],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [(NSSet *)identifiersToDiscover isEqualToSet:v5],
        v5,
        v6))
  {
    v7 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007710C(v7);
    }
  }
  else
  {
    v8 = [(CARCarPlayServiceConnector *)self _pairedBLEIdentifiers];
    v9 = self->_identifiersToDiscover;
    self->_identifiersToDiscover = v8;

    id v10 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100077090(p_identifiersToDiscover, v10);
    }

    p_discoverer = &self->_discoverer;
    discoverer = self->_discoverer;
    if (discoverer)
    {
      [(CBDiscovery *)discoverer invalidate];
      v13 = *p_discoverer;
      *p_discoverer = 0;
    }
    v7 = objc_alloc_init((Class)CBDiscovery);
    [v7 setDispatchQueue:&_dispatch_main_q];
    [v7 setDiscoveryFlags:0x200000];
    v14 = [(CARCarPlayServiceConnector *)self identifiersToDiscover];
    v15 = [v14 allObjects];
    [v7 setDeviceFilter:v15];

    objc_initWeak(&location, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10006B484;
    v32[3] = &unk_1000BFA20;
    objc_copyWeak(&v33, &location);
    [v7 setDeviceFoundHandler:v32];
    [v7 activateWithCompletion:&stru_1000BFA40];
    objc_storeStrong((id *)&self->_discoverer, v7);
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v17 = xpc_array_create(0, 0);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v18 = [(CARCarPlayServiceConnector *)self identifiersToDiscover];
    id v19 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v29;
      do
      {
        objc_super v21 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = (const char *)[*(id *)(*((void *)&v28 + 1) + 8 * (void)v21) UTF8String];
          if (v22)
          {
            xpc_object_t v23 = xpc_string_create(v22);
            xpc_array_append_value(v17, v23);
          }
          objc_super v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v19);
    }

    xpc_dictionary_set_value(v16, "deviceFilter", v17);
    xpc_set_event();
    v24 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      xpc_object_t v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "setup BLE XPC event for devices: %@", buf, 0xCu);
    }

    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v26 = xpc_string_create((const char *)[CBUUIDLECarPlayServiceString UTF8String]);
    xpc_dictionary_set_value(v25, "serviceUUIDs", v26);
    xpc_set_event();
    v27 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "setup BLE XPC event for service connections", buf, 2u);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

- (NSSet)connectedVehicles
{
  v2 = [(CARCarPlayServiceConnector *)self vehiclesForBluetoothIdentifiers];
  v3 = [v2 allValues];
  v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2113;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "attempt to BLE pair to: %{private, mask.hash}@", buf, 0x16u);
  }

  v9 = [(CARCarPlayServiceConnector *)self centralManager];
  BOOL v10 = [v9 state] == (id)5;

  if (v10)
  {
    [(CARCarPlayServiceConnector *)self _pairWithBluetoothIdentifier:v6 deviceName:v7];
  }
  else
  {
    v11 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pending pairing to %{private, mask.hash}@ until BLE is ready", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006B810;
    v12[3] = &unk_1000BED98;
    objc_copyWeak(&v15, (id *)buf);
    id v13 = v6;
    id v14 = v7;
    [(CARCarPlayServiceConnector *)self setActionPendingPowerOn:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)connectWithBluetoothLEIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "attempt to BLE connect to: %{private, mask.hash}@", buf, 0x16u);
  }

  id v6 = [(CARCarPlayServiceConnector *)self centralManager];
  BOOL v7 = [v6 state] == (id)5;

  if (v7)
  {
    [(CARCarPlayServiceConnector *)self _connectWithBluetoothIdentifier:v4 completion:0];
  }
  else
  {
    v8 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v13 = 1752392040;
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pending connection to %{private, mask.hash}@ until BLE is ready", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006BA80;
    v9[3] = &unk_1000BD5C8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    [(CARCarPlayServiceConnector *)self setActionPendingPowerOn:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CARCarPlayServiceConnector *)self servicesForBluetoothIdentifiers];
    id v6 = [v5 objectForKey:v4];

    if (v6)
    {
      BOOL v7 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removing connected service: %@", (uint8_t *)&v18, 0xCu);
      }

      v8 = [(CARCarPlayServiceConnector *)self servicesForBluetoothIdentifiers];
      [v8 removeObjectForKey:v4];
    }
    v9 = [(CARCarPlayServiceConnector *)self _periperalForIdentifier:v4];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      id v11 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
      unsigned int v12 = [v4 isEqual:v11];

      if (v12)
      {
        [(CARCarPlayServiceConnector *)self setPairingPeripheralIdentifier:0];
        [(CARCarPlayServiceConnector *)self setPairingPeripheralName:0];
      }
      uint64_t v13 = [(CARCarPlayServiceConnector *)self centralManager];
      __int16 v14 = [v13 sharedPairingAgent];
      [v14 unpairPeer:v9];

      id v15 = [(CARCarPlayServiceConnector *)self activePeripheral];
      LODWORD(v14) = [v9 isEqual:v15];

      if (v14) {
        [(CARCarPlayServiceConnector *)self setActivePeripheral:0];
      }
    }
    else
    {
      xpc_object_t v16 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000771FC();
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_pairedBLEIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CARCarPlayServiceConnector *)self vehicleStore];
  id v5 = [v4 allStoredVehicles];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 supportsBluetoothLE] && objc_msgSend(v10, "pairingStatus") == (id)2)
        {
          id v11 = [v10 bluetoothAddress];
          if (v11) {
            [v3 addObject:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)_periperalForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CARCarPlayServiceConnector *)self centralManager];
  id v11 = v4;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  id v7 = [v5 retrievePeripheralsWithIdentifiers:v6];

  uint64_t v8 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100077264();
  }

  v9 = [v7 firstObject];

  return v9;
}

- (id)_vehicleForService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peripheral];
  id v6 = [v5 identifier];

  id v7 = [(CARCarPlayServiceConnector *)self vehiclesForBluetoothIdentifiers];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v9 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000772DC();
    }
  }

  return v8;
}

- (void)_pairWithBluetoothIdentifier:(id)a3 deviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CARCarPlayServiceConnector *)self setPairingPeripheralIdentifier:v6];
  [(CARCarPlayServiceConnector *)self setPairingPeripheralName:v7];

  uint64_t v8 = [(CARCarPlayServiceConnector *)self centralManager];
  v9 = [v8 sharedPairingAgent];
  [v9 setDelegate:self];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006C128;
  v11[3] = &unk_1000BFA68;
  id v12 = v6;
  long long v13 = self;
  id v10 = v6;
  [(CARCarPlayServiceConnector *)self _connectWithBluetoothIdentifier:v10 completion:v11];
}

- (void)_finishedCurrentPairing
{
  id v3 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "finished current pairing attempt", v6, 2u);
  }

  id v4 = [(CARCarPlayServiceConnector *)self centralManager];
  id v5 = [v4 sharedPairingAgent];
  [v5 setDelegate:0];

  [(CARCarPlayServiceConnector *)self setCurrentConnectionCompletion:0];
  [(CARCarPlayServiceConnector *)self setPairingPeripheralIdentifier:0];
  [(CARCarPlayServiceConnector *)self setPairingPeripheralName:0];
}

- (void)_connectWithBluetoothIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CARCarPlayServiceConnector *)self servicesForBluetoothIdentifiers];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007743C();
    }

    id v11 = [(CARCarPlayServiceConnector *)self servicesForBluetoothIdentifiers];
    [v11 removeObjectForKey:v6];
  }
  id v12 = [(CARCarPlayServiceConnector *)self _periperalForIdentifier:v6];
  long long v13 = sub_10005C6FC(2uLL);
  long long v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v12 name];
      int v16 = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_connectWithBluetoothIdentifier peripheral %@ name: %@", (uint8_t *)&v16, 0x16u);
    }
    [(CARCarPlayServiceConnector *)self setCurrentConnectionCompletion:v7];
    [(CARCarPlayServiceConnector *)self setActivePeripheral:v12];
    long long v14 = [(CARCarPlayServiceConnector *)self centralManager];
    [v14 connectPeripheral:v12 options:0];
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1000773D4();
  }
}

- (void)_startServiceForPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "starting CarPlay service for %@", buf, 0xCu);
  }

  id v6 = [v4 identifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006C684;
  v7[3] = &unk_1000BFA90;
  v7[4] = self;
  [(CARCarPlayServiceConnector *)self _connectWithBluetoothIdentifier:v6 completion:v7];
}

- (void)_addConnectedVehicle:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connected vehicle: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = objc_alloc((Class)NSUUID);
  id v7 = [v4 bluetoothAddress];
  id v8 = [v6 initWithUUIDString:v7];

  id v9 = [(CARCarPlayServiceConnector *)self vehiclesForBluetoothIdentifiers];
  [v9 setObject:v4 forKey:v8];

  id v10 = [(CARCarPlayServiceConnector *)self delegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 serviceConnector:self didConnectVehicle:v4];
  }
}

- (void)_removeConnectedVehicle:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "disconnected vehicle: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = objc_alloc((Class)NSUUID);
  id v7 = [v4 bluetoothAddress];
  id v8 = [v6 initWithUUIDString:v7];

  id v9 = [(CARCarPlayServiceConnector *)self vehiclesForBluetoothIdentifiers];
  [v9 removeObjectForKey:v8];

  id v10 = [(CARCarPlayServiceConnector *)self delegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 serviceConnector:self didDisconnectVehicle:v4];
  }
}

- (void)_handleIdentificationMessage:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10005C6FC(2uLL);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedIdentification", (const char *)&unk_1000B1267, (uint8_t *)&v13, 2u);
  }

  id v9 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received identification: %@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [v7 peripheral];
  int v11 = [v10 identifier];

  id v12 = [[CARCarPlayServiceVehicle alloc] initFromBluetoothIdentifier:v11 service:v7 identificationMessage:v6];
  [(CARCarPlayServiceConnector *)self _addConnectedVehicle:v12];
}

- (void)_handleStartSessionMessage:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10005C6FC(2uLL);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedCarPlayStartSession", (const char *)&unk_1000B1267, (uint8_t *)&v11, 2u);
  }

  id v9 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received start session: %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(CARCarPlayServiceConnector *)self _vehicleForService:v7];

  if (v10) {
    [v10 _handleStartSessionMessage:v6];
  }
}

- (void)_mainQueue_handleDidDiscoverDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [v4 identifier];
  id v6 = [(CARCarPlayServiceConnector *)self _pairedBLEIdentifiers];
  unsigned __int8 v7 = [v6 containsObject:v5];

  if (v7)
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    id v9 = [(CARCarPlayServiceConnector *)self centralManager];
    xpc_object_t v23 = v8;
    id v10 = +[NSArray arrayWithObjects:&v23 count:1];
    int v11 = [v9 retrievePeripheralsWithIdentifiers:v10];
    id v12 = [v11 firstObject];

    if (!v12)
    {
      int v16 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007750C();
      }
      goto LABEL_16;
    }
    if ([v12 isConnectedToSystem])
    {
      int v13 = [v12 identifier];
      id v14 = [(CARCarPlayServiceConnector *)self activePeripheral];
      long long v15 = [v14 identifier];
      if ([v13 isEqual:v15])
      {
      }
      else
      {
        __int16 v18 = [(CARCarPlayServiceConnector *)self servicesForBluetoothIdentifiers];
        id v19 = [v18 objectForKey:v8];

        if (!v19)
        {
          uint64_t v20 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 138412290;
            id v22 = v4;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "attempt to locally connect to discovered & connected device: %@", (uint8_t *)&v21, 0xCu);
          }

          [(CARCarPlayServiceConnector *)self connectWithBluetoothLEIdentifier:v8];
          goto LABEL_17;
        }
      }
      int v16 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        id v22 = v12;
        uint64_t v17 = "discovered peripheral is already connecting: %@";
        goto LABEL_15;
      }
    }
    else
    {
      int v16 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        id v22 = v12;
        uint64_t v17 = "discovered peripheral is not connected: %@";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v21, 0xCu);
      }
    }
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  id v8 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100077574();
  }
LABEL_18:
}

- (void)carPlayServiceDidActivate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D088;
  block[3] = &unk_1000BD1B0;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)carPlayService:(id)a3 didSendMessage:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D220;
  block[3] = &unk_1000BD1B0;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)carPlayService:(id)a3 didFailToSendMessage:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D360;
  block[3] = &unk_1000BD1B0;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)carPlayService:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D478;
  block[3] = &unk_1000BD3D0;
  id v10 = a4;
  int v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)carPlayServiceDidDeactivate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006D608;
  v5[3] = &unk_1000BD3A8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = [v4 state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector centralManagerDidUpdateState, state is now: %ld", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(CARCarPlayServiceConnector *)self centralManager];
  id v7 = [v6 state];

  if (v7 == (id)5)
  {
    id v8 = [(CARCarPlayServiceConnector *)self actionPendingPowerOn];
    if (v8)
    {
      id v9 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "now powered on, starting pending action", (uint8_t *)&v10, 2u);
      }

      v8[2](v8);
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didDiscoverPeripheral %@ advertisementData: %@, RSSI: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  id v6 = sub_10005C6FC(2uLL);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connected", (const char *)&unk_1000B1267, (uint8_t *)&v17, 2u);
  }

  id v7 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didConnectPeripheral %@", (uint8_t *)&v17, 0xCu);
  }

  id v8 = [(CARCarPlayServiceConnector *)self _pairedBLEIdentifiers];
  id v9 = [v5 identifier];
  id v10 = [v9 UUIDString];
  unsigned int v11 = [v8 containsObject:v10];

  if (v11)
  {
    int v12 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector connected periperal is paired, starting service", (uint8_t *)&v17, 2u);
    }

    [(CARCarPlayServiceConnector *)self _startServiceForPeripheral:v5];
  }
  id v13 = [(CARCarPlayServiceConnector *)self activePeripheral];
  unsigned int v14 = [v5 isEqual:v13];

  if (v14)
  {
    uint64_t v15 = [(CARCarPlayServiceConnector *)self currentConnectionCompletion];
    __int16 v16 = (void *)v15;
    if (v15)
    {
      (*(void (**)(uint64_t, id, uint64_t, void))(v15 + 16))(v15, v5, 1, 0);
      [(CARCarPlayServiceConnector *)self setCurrentConnectionCompletion:0];
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didFailToConnectPeripheral %@: %@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = [(CARCarPlayServiceConnector *)self activePeripheral];
  unsigned int v11 = [v7 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [(CARCarPlayServiceConnector *)self currentConnectionCompletion];
    id v13 = (void *)v12;
    if (v12)
    {
      (*(void (**)(uint64_t, id, void, id))(v12 + 16))(v12, v7, 0, v8);
      [(CARCarPlayServiceConnector *)self setCurrentConnectionCompletion:0];
    }
    [(CARCarPlayServiceConnector *)self setActivePeripheral:0];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10005C6FC(2uLL);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Disconnected", (const char *)&unk_1000B1267, (uint8_t *)&v13, 2u);
  }

  id v10 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didDisconnectPeripheral %@: %@", (uint8_t *)&v13, 0x16u);
  }

  unsigned int v11 = [(CARCarPlayServiceConnector *)self activePeripheral];
  unsigned int v12 = [v7 isEqual:v11];

  if (v12) {
    [(CARCarPlayServiceConnector *)self setActivePeripheral:0];
  }
}

- (void)centralManager:(id)a3 didUpdateANCSAuthorizationForPeripheral:(id)a4
{
  id v4 = a4;
  id v5 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didUpdateANCSAuthorizationForPeripheral %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5 = a4;
  int v6 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    id v8 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
    int v17 = 141558787;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2113;
    uint64_t v20 = v7;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2113;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "peerDidCompletePairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v17, 0x2Au);
  }
  id v9 = [v5 identifier];
  id v10 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    unsigned int v12 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 141558275;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2113;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "completed BLE pairing for %{private, mask.hash}@", (uint8_t *)&v17, 0x16u);
    }

    int v13 = [(CARCarPlayServiceConnector *)self pairingPeripheralName];
    id v14 = [(CARCarPlayServiceConnector *)self delegate];
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v14 serviceConnector:self completedPairingForBluetoothLEIdentifier:v9 name:v13];
    }
    [(CARCarPlayServiceConnector *)self _finishedCurrentPairing];
    __int16 v15 = [(CARCarPlayServiceConnector *)self _periperalForIdentifier:v9];
    if (v15)
    {
      [(CARCarPlayServiceConnector *)self _startServiceForPeripheral:v15];
    }
    else
    {
      id v16 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000776BC();
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000777D0(v7, self, v9);
  }

  id v10 = [v7 identifier];
  unsigned int v11 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
  unsigned int v12 = [v10 isEqual:v11];

  if (v12)
  {
    int v13 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100077724(v7, (uint64_t)v8, v13);
    }

    id v14 = [(CARCarPlayServiceConnector *)self pairingPeripheralName];
    __int16 v15 = [(CARCarPlayServiceConnector *)self delegate];
    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v16 = [v7 identifier];
      [v15 serviceConnector:self failedPairingForBluetoothLEIdentifier:v16 name:v14 error:v8];
    }
    [(CARCarPlayServiceConnector *)self _finishedCurrentPairing];
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5 = a4;
  int v6 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    id v8 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
    int v14 = 141558787;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2113;
    int v17 = v7;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2113;
    __int16 v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "peerDidUnpair %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v14, 0x2Au);
  }
  id v9 = [v5 identifier];
  id v10 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    unsigned int v12 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v5 identifier];
      int v14 = 141558275;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2113;
      int v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "unpaired BLE: %{private, mask.hash}@", (uint8_t *)&v14, 0x16u);
    }
    [(CARCarPlayServiceConnector *)self _finishedCurrentPairing];
  }
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unsigned int v11 = [v9 identifier];
  unsigned int v12 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
    *(_DWORD *)buf = 141558787;
    uint64_t v26 = 1752392040;
    __int16 v27 = 2113;
    long long v28 = v11;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2113;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "peerDidRequestPairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", buf, 0x2Au);
  }
  int v14 = [(CARCarPlayServiceConnector *)self pairingPeripheralIdentifier];
  unsigned int v15 = [v11 isEqual:v14];

  if (v15)
  {
    __int16 v16 = [(CARCarPlayServiceConnector *)self pairingPeripheralName];
    int v17 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558531;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2113;
      long long v28 = v11;
      __int16 v29 = 2113;
      uint64_t v30 = (uint64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "requested BLE pairing confirmation for %{private, mask.hash}@ (\"%{private}@\")", buf, 0x20u);
    }

    if (a5 == 4)
    {
      __int16 v18 = [(CARCarPlayServiceConnector *)self delegate];
      if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10006E77C;
        v19[3] = &unk_1000BFAB8;
        id v20 = v11;
        __int16 v21 = self;
        id v22 = v9;
        uint64_t v24 = 4;
        id v23 = v10;
        [v18 serviceConnector:self requestsPairingConfirmationForBluetoothLEIdentifier:v20 name:v16 numericCode:v23 responseHandler:v19];
      }
    }
    else
    {
      __int16 v18 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000778B0();
      }
    }
  }
}

- (void)vehicleStoreDidBecomeAvailable:(id)a3
{
  id v4 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event now that vehicle store is available", v5, 2u);
  }

  [(CARCarPlayServiceConnector *)self _updateDiscoverer];
}

- (void)vehicleStore:(id)a3 didSaveVehicle:(id)a4
{
  if (objc_msgSend(a4, "supportsBluetoothLE", a3))
  {
    id v5 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event for saved BLE vehicle", v6, 2u);
    }

    [(CARCarPlayServiceConnector *)self _updateDiscoverer];
  }
}

- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4
{
  if (objc_msgSend(a4, "supportsBluetoothLE", a3))
  {
    id v5 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event for removed BLE vehicle", v6, 2u);
    }

    [(CARCarPlayServiceConnector *)self _updateDiscoverer];
  }
}

- (CARCarPlayServiceConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARCarPlayServiceConnectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (CBDiscovery)discoverer
{
  return self->_discoverer;
}

- (NSSet)identifiersToDiscover
{
  return self->_identifiersToDiscover;
}

- (NSMutableDictionary)servicesForBluetoothIdentifiers
{
  return self->_servicesForBluetoothIdentifiers;
}

- (NSMutableDictionary)vehiclesForBluetoothIdentifiers
{
  return self->_vehiclesForBluetoothIdentifiers;
}

- (NSUUID)pairingPeripheralIdentifier
{
  return self->_pairingPeripheralIdentifier;
}

- (void)setPairingPeripheralIdentifier:(id)a3
{
}

- (NSString)pairingPeripheralName
{
  return self->_pairingPeripheralName;
}

- (void)setPairingPeripheralName:(id)a3
{
}

- (CBPeripheral)activePeripheral
{
  return self->_activePeripheral;
}

- (void)setActivePeripheral:(id)a3
{
}

- (id)currentConnectionCompletion
{
  return self->_currentConnectionCompletion;
}

- (void)setCurrentConnectionCompletion:(id)a3
{
}

- (id)actionPendingPowerOn
{
  return self->_actionPendingPowerOn;
}

- (void)setActionPendingPowerOn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionPendingPowerOn, 0);
  objc_storeStrong(&self->_currentConnectionCompletion, 0);
  objc_storeStrong((id *)&self->_activePeripheral, 0);
  objc_storeStrong((id *)&self->_pairingPeripheralName, 0);
  objc_storeStrong((id *)&self->_pairingPeripheralIdentifier, 0);
  objc_storeStrong((id *)&self->_vehiclesForBluetoothIdentifiers, 0);
  objc_storeStrong((id *)&self->_servicesForBluetoothIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToDiscover, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end