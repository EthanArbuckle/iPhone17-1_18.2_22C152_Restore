@interface ConnectionManager
+ (id)instance;
- (BOOL)allowInRestrictedMode:(id)a3;
- (BOOL)authInProgress;
- (BOOL)isAlwaysConnecting:(id)a3;
- (BOOL)requireServicesAndMFi:(id)a3;
- (CBCentralManager)centralManager;
- (CBL2CAPChannel)mfiAuthChannel;
- (CBL2CAPChannel)peerChannel;
- (CBPeripheral)mfiPeripheral;
- (ConnectionManager)init;
- (NSArray)peripherals;
- (NSMutableArray)L2CAPChannels;
- (NSMutableArray)services;
- (NSMutableDictionary)clientServiceManagerMap;
- (NSMutableDictionary)connectAlwaysIdentifiersMap;
- (NSMutableDictionary)connectOnceIdentifiersMap;
- (NSMutableSet)connectOnceNoTimeoutIdentifiers;
- (NSMutableSet)denylistedIdentifiers;
- (NSMutableSet)mfiAuthPendingPeripherals;
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (OS_os_transaction)connectionAssertion;
- (OS_voucher)mfiVoucher;
- (id)centralManagerStateString;
- (id)peripheralForIdentifier:(id)a3;
- (void)analyzeConnectionError:(id)a3 peripheral:(id)a4 info:(id)a5;
- (void)authDidFail:(id)a3;
- (void)authDidSucceed:(id)a3;
- (void)cancelPeripheralConnectionForConnectOnceIdentifier:(id)a3;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 timestamp:(double)a5 isReconnecting:(BOOL)a6 error:(id)a7;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectAlways:(id)a3;
- (void)connectOnce:(id)a3;
- (void)connectOnce:(id)a3 connectionTimeoutEnabled:(BOOL)a4;
- (void)connectPeripheral:(id)a3;
- (void)connectionTimeout:(id)a3;
- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4;
- (void)peerDidIdleTimeout:(id)a3;
- (void)peerIsUsingBuiltinService:(id)a3;
- (void)performMFiAuth:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralPairingDidFail:(id)a3;
- (void)refreshConnectionAssertion;
- (void)refreshPeripherals;
- (void)setAuthInProgress:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setClientServiceManagerMap:(id)a3;
- (void)setConnectAlwaysIdentifiersMap:(id)a3;
- (void)setConnectOnceIdentifiersMap:(id)a3;
- (void)setConnectOnceNoTimeoutIdentifiers:(id)a3;
- (void)setConnectionAssertion:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDenylistedIdentifiers:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setL2CAPChannels:(id)a3;
- (void)setMfiAuthChannel:(id)a3;
- (void)setMfiAuthPendingPeripherals:(id)a3;
- (void)setMfiPeripheral:(id)a3;
- (void)setMfiVoucher:(id)a3;
- (void)setPeerChannel:(id)a3;
- (void)setPeripherals:(id)a3;
- (void)setServices:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5;
- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7;
- (void)transportClientServerDisconnected:(id)a3;
@end

@implementation ConnectionManager

+ (id)instance
{
  if (qword_1000CD0A0 != -1) {
    dispatch_once(&qword_1000CD0A0, &stru_1000B1B80);
  }
  v2 = (void *)qword_1000CD098;

  return v2;
}

- (void)connectOnce:(id)a3
{
}

- (void)connectOnce:(id)a3 connectionTimeoutEnabled:(BOOL)a4
{
  id v9 = a3;
  if (a4)
  {
    v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"connectionTimeout:" selector:v9 userInfo:0 repeats:5.0];
    v7 = [(ConnectionManager *)self connectOnceIdentifiersMap];
    [v7 setObject:v6 forKeyedSubscript:v9];
  }
  else
  {
    v6 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
    [v6 addObject:v9];
  }

  v8 = [(ConnectionManager *)self denylistedIdentifiers];
  [v8 removeObject:v9];

  [(ConnectionManager *)self refreshConnectionAssertion];
  [(ConnectionManager *)self refreshPeripherals];
}

- (void)connectAlways:(id)a3
{
  id v4 = a3;
  v5 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  v6 = [v5 allKeys];
  unsigned __int8 v7 = [v6 isEqualToArray:v4];

  if ((v7 & 1) == 0)
  {
    v8 = +[NSMutableDictionary dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v4;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
          v15 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
          v16 = [v15 objectForKeyedSubscript:v14];

          if (!v16) {
            v16 = objc_alloc_init(PeripheralConnectionInfo);
          }
          [v8 setObject:v16 forKeyedSubscript:v14];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [(ConnectionManager *)self setConnectAlwaysIdentifiersMap:v8];
    [(ConnectionManager *)self refreshConnectionAssertion];
    [(ConnectionManager *)self refreshPeripherals];

    id v4 = v17;
  }
}

- (BOOL)isAlwaysConnecting:(id)a3
{
  id v4 = a3;
  v5 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  v6 = [v4 identifier];

  unsigned __int8 v7 = [v5 objectForKeyedSubscript:v6];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (id)peripheralForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ConnectionManager *)self peripherals];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)cancelPeripheralConnectionForConnectOnceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  [v5 removeObject:v4];

  id v6 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  [v6 removeObjectForKey:v4];

  [(ConnectionManager *)self refreshConnectionAssertion];

  [(ConnectionManager *)self refreshPeripherals];
}

- (void)performMFiAuth:(id)a3
{
  id v4 = a3;
  v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Perform MFIAuth for %@", buf, 0xCu);
  }
  id v6 = [(ConnectionManager *)self centralManager];
  id v7 = [v6 state];

  if (v7 == (id)5)
  {
    v8 = [(ConnectionManager *)self centralManager];
    id v40 = v4;
    id v9 = +[NSArray arrayWithObjects:&v40 count:1];
    id v10 = [v8 retrievePeripheralsWithIdentifiers:v9];

    unsigned __int8 v11 = [v10 firstObject];
    if ([v11 hasTag:@"needsMFiAuthentication4.0"])
    {
      [(ConnectionManager *)self setMfiPeripheral:v11];
      id v12 = [(ConnectionManager *)self centralManager];
      id v13 = [(ConnectionManager *)self mfiPeripheral];
      [v12 connectPeripheral:v13 options:0];
    }
    else
    {
      v33 = v10;
      long long v18 = [(ConnectionManager *)self centralManager];
      long long v19 = +[CBUUID UUIDWithString:@"0xFE13"];
      v39 = v19;
      long long v20 = +[NSArray arrayWithObjects:&v39 count:1];
      long long v21 = [v18 retrieveConnectedPeripheralsWithServices:v20];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v21;
      id v22 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v12);
            }
            v26 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v27 = [v26 identifier];
            unsigned int v28 = [v27 isEqual:v4];

            if (v28)
            {
              [(ConnectionManager *)self setMfiPeripheral:v26];
              id v30 = [(ConnectionManager *)self centralManager];
              v32 = [(ConnectionManager *)self mfiPeripheral];
              [v30 connectPeripheral:v32 options:0];
              id v13 = v12;
              goto LABEL_21;
            }
          }
          id v23 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      [(ConnectionManager *)self setMfiPeripheral:0];
      v29 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Register for connection event for this Fitness machine service", buf, 2u);
      }
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      id v30 = objc_alloc_init((Class)NSMutableArray);
      v31 = +[CBUUID UUIDWithString:@"0000FE13-0000-1000-8000-00805F9B34FB"];
      [v30 addObject:v31];

      [v13 setObject:v30 forKeyedSubscript:CBConnectionEventMatchingOptionServiceUUIDs];
      v32 = [(ConnectionManager *)self centralManager];
      [v32 registerForConnectionEventsWithOptions:v13];
LABEL_21:
      id v10 = v33;
    }
  }
  else
  {
    long long v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = v14;
      long long v16 = [(ConnectionManager *)self centralManager];
      unsigned int v17 = [v16 state];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = v17;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Manager state is %d, deferring MFI Auth for %@", buf, 0x12u);
    }
    [(NSMutableSet *)self->_mfiAuthPendingPeripherals addObject:v4];
  }
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v11 = v10;
    id v12 = [v9 name];
    int v17 = 138412546;
    long long v18 = v12;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" connection event:%tu", (uint8_t *)&v17, 0x16u);
  }
  if (a4 == 1)
  {
    [(ConnectionManager *)self setMfiPeripheral:v9];
    id v13 = [(ConnectionManager *)self centralManager];
    long long v14 = [(ConnectionManager *)self mfiPeripheral];
    [v13 connectPeripheral:v14 options:0];

    long long v15 = [(ConnectionManager *)self centralManager];
    [v15 registerForConnectionEventsWithOptions:0];
  }
  else
  {
    long long v16 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070AC0(v16, v9);
    }
    [(ConnectionManager *)self setMfiPeripheral:0];
  }
}

- (ConnectionManager)init
{
  v31.receiver = self;
  v31.super_class = (Class)ConnectionManager;
  v2 = [(ConnectionManager *)&v31 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBCentralManager);
    v32[0] = CBCentralManagerOptionReceiveSystemEvents;
    v32[1] = CBManagerNeedsRestrictedStateOperation;
    v33[0] = &__kCFBooleanTrue;
    v33[1] = &__kCFBooleanTrue;
    id v4 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v5 = (CBCentralManager *)[v3 initWithDelegate:v2 queue:&_dispatch_main_q options:v4];
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectOnceIdentifiersMap = v2->_connectOnceIdentifiersMap;
    v2->_connectOnceIdentifiersMap = v7;

    id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connectOnceNoTimeoutIdentifiers = v2->_connectOnceNoTimeoutIdentifiers;
    v2->_connectOnceNoTimeoutIdentifiers = v9;

    connectAlwaysIdentifiersMap = v2->_connectAlwaysIdentifiersMap;
    v2->_connectAlwaysIdentifiersMap = 0;

    id v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    denylistedIdentifiers = v2->_denylistedIdentifiers;
    v2->_denylistedIdentifiers = v12;

    connectionAssertion = v2->_connectionAssertion;
    v2->_connectionAssertion = 0;

    peripherals = v2->_peripherals;
    v2->_peripherals = 0;

    uint64_t v16 = objc_opt_new();
    L2CAPChannels = v2->_L2CAPChannels;
    v2->_L2CAPChannels = (NSMutableArray *)v16;

    mfiPeripheral = v2->_mfiPeripheral;
    v2->_mfiPeripheral = 0;

    peerChannel = v2->_peerChannel;
    v2->_peerChannel = 0;

    mfiAuthChannel = v2->_mfiAuthChannel;
    v2->_mfiAuthChannel = 0;

    v2->_authInProgress = 0;
    long long v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientServiceManagerMap = v2->_clientServiceManagerMap;
    v2->_clientServiceManagerMap = v21;

    id v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mfiAuthPendingPeripherals = v2->_mfiAuthPendingPeripherals;
    v2->_mfiAuthPendingPeripherals = v23;

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v2 selector:"peripheralPairingDidFail:" name:@"PeripheralPairingDidFailNotification" object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"authDidSucceed:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v2 selector:"authDidFail:" name:@"AuthenticationServiceAuthDidFailNotification" object:0];

    unsigned int v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v2 selector:"peerIsUsingBuiltinService:" name:@"PeerIsUsingBuiltinServiceNotification" object:0];

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v2 selector:"peerDidIdleTimeout:" name:@"PeerDidIdleTimeoutNotification" object:0];
  }
  return v2;
}

- (BOOL)allowInRestrictedMode:(id)a3
{
  id v3 = a3;
  if (([v3 hasTag:@"A1603"] & 1) != 0
    || ([v3 hasTag:@"A2051"] & 1) != 0
    || ([v3 hasTag:@"A3085"] & 1) != 0
    || ([v3 hasTag:@"A2538"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 hasTag:@"FastConnection"];
  }

  return v4;
}

- (BOOL)requireServicesAndMFi:(id)a3
{
  return [a3 hasTag:@"A2538"];
}

- (void)refreshPeripherals
{
  id v3 = [(ConnectionManager *)self centralManager];
  if ([v3 state] == (id)5)
  {
  }
  else
  {
    unsigned __int8 v4 = [(ConnectionManager *)self centralManager];
    id v5 = [v4 state];

    if (v5 != (id)10) {
      return;
    }
  }
  id v6 = +[NSMutableSet set];
  id v7 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  id v8 = [v7 allKeys];
  [v6 addObjectsFromArray:v8];

  id v9 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  id v10 = [v9 allObjects];
  [v6 addObjectsFromArray:v10];

  unsigned __int8 v11 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  id v12 = [v11 allKeys];
  [v6 addObjectsFromArray:v12];

  id v13 = [(ConnectionManager *)self centralManager];
  long long v36 = v6;
  long long v14 = [v6 allObjects];
  long long v15 = [v13 retrievePeripheralsWithIdentifiers:v14];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v16 = [(ConnectionManager *)self peripherals];
  id v17 = [v16 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        if (([v15 containsObject:v21] & 1) == 0) {
          [(ConnectionManager *)self disconnectPeripheral:v21 force:0];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v18);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v15;
  id v23 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v26);
        unsigned int v28 = [(ConnectionManager *)self centralManager];
        id v29 = [v28 state];

        if (v29 != (id)10) {
          goto LABEL_22;
        }
        unsigned int v30 = [(ConnectionManager *)self allowInRestrictedMode:v27];
        objc_super v31 = qword_1000CD178;
        BOOL v32 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
        if (v30)
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Bluetooth is restricted. Allowing connection to Apple Pencil.", buf, 2u);
          }
LABEL_22:
          [(ConnectionManager *)self connectPeripheral:v27];
          goto LABEL_23;
        }
        if (v32)
        {
          v33 = v31;
          long long v34 = [v27 name];
          *(_DWORD *)buf = 138412290;
          v46 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Bluetooth is restricted. Outgoing connection to %@ not allowed.", buf, 0xCu);
        }
LABEL_23:
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v35 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
      id v24 = v35;
    }
    while (v35);
  }

  [(ConnectionManager *)self setPeripherals:v22];
}

- (void)connectPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = [(ConnectionManager *)self centralManager];
  if ([v5 state] == (id)5)
  {
    id v6 = [v4 state];

    if (v6) {
      goto LABEL_22;
    }
  }
  else
  {
    id v7 = [(ConnectionManager *)self centralManager];
    if ([v7 state] != (id)10)
    {

LABEL_21:
      goto LABEL_22;
    }
    id v8 = [v4 state];

    if (v8) {
      goto LABEL_22;
    }
  }
  id v9 = [(ConnectionManager *)self denylistedIdentifiers];
  id v10 = [v4 identifier];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    id v5 = +[NSMutableDictionary dictionary];
    long long v15 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    uint64_t v16 = [v4 identifier];
    id v17 = [v15 objectForKeyedSubscript:v16];

    if (v17) {
      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:CBConnectPeripheralOptionEnableAutoReconnect];
    }
    id v18 = [(ConnectionManager *)self centralManager];
    id v19 = [v18 state];

    if (v19 == (id)10)
    {
      unsigned int v20 = [(ConnectionManager *)self allowInRestrictedMode:v4];
      uint64_t v21 = (void *)qword_1000CD178;
      BOOL v22 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (!v22) {
          goto LABEL_21;
        }
        v27 = v21;
        unsigned int v28 = [v4 name];
        *(_DWORD *)id v29 = 138412290;
        *(void *)&v29[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ignoring connection to \"%@\" since bluetooth state is restricted", v29, 0xCu);

        goto LABEL_20;
      }
      if (v22)
      {
        id v23 = v21;
        id v24 = [v4 name];
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v5;
        uint64_t v25 = "Allowing connection to Apple Pencil \"%@\" options %@...";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, v29, 0x16u);
      }
    }
    else
    {
      v26 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v26;
        id v24 = [v4 name];
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v5;
        uint64_t v25 = "Connecting peripheral \"%@\" options %@...";
        goto LABEL_18;
      }
    }
    v27 = [(ConnectionManager *)self centralManager];
    [v27 connectPeripheral:v4 options:v5];
LABEL_20:

    goto LABEL_21;
  }
  id v12 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    long long v14 = [v4 name];
    *(_DWORD *)id v29 = 138412290;
    *(void *)&v29[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not connecting peripheral \"%@\" as it is denylisted", v29, 0xCu);
  }
LABEL_22:
}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ConnectionManager *)self centralManager];
  if ([v7 state] == (id)5)
  {
    id v8 = [v6 state];

    if (!v8) {
      goto LABEL_12;
    }
LABEL_6:
    unsigned __int8 v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [v6 name];
      int v21 = 138412290;
      BOOL v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Disconnecting peripheral \"%@\"...", (uint8_t *)&v21, 0xCu);
    }
    long long v14 = [(ConnectionManager *)self centralManager];
    [v14 cancelPeripheralConnection:v6 force:v4];

    long long v15 = [(ConnectionManager *)self clientServiceManagerMap];
    [v15 removeObjectForKey:v6];

    uint64_t v16 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
    id v17 = [v6 identifier];
    [v16 removeObject:v17];

    if ([(ConnectionManager *)self requireServicesAndMFi:v6])
    {
      id v18 = [(ConnectionManager *)self connectionUUID];

      if (v18)
      {
        id v19 = +[ACCTransportClient sharedClient];
        unsigned int v20 = [(ConnectionManager *)self connectionUUID];
        [v19 destroyConnectionWithUUID:v20];
      }
    }
    goto LABEL_12;
  }
  id v9 = [(ConnectionManager *)self centralManager];
  if ([v9 state] != (id)10)
  {

    goto LABEL_12;
  }
  id v10 = [v6 state];

  if (v10) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)refreshConnectionAssertion
{
  id v3 = [(ConnectionManager *)self centralManager];
  if ([v3 state] == (id)4)
  {

LABEL_3:
    [(ConnectionManager *)self setConnectionAssertion:0];
    return;
  }
  BOOL v4 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  if ([v4 count]) {
    goto LABEL_9;
  }
  id v5 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  if ([v5 count])
  {

LABEL_9:
    goto LABEL_10;
  }
  id v8 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  id v9 = [v8 count];

  if (!v9) {
    goto LABEL_3;
  }
LABEL_10:
  id v6 = [(ConnectionManager *)self connectionAssertion];

  if (!v6)
  {
    id v10 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
    [v10 UTF8String];
    id v7 = (void *)os_transaction_create();
    [(ConnectionManager *)self setConnectionAssertion:v7];
  }
}

- (void)connectionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7 == v4)
  {
    id v8 = [(ConnectionManager *)self peripheralForIdentifier:v5];
    id v9 = v8;
    if (v8 && [v8 state] == (id)1)
    {
      id v10 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100070B58(v10, v9);
      }
      unsigned __int8 v11 = [(ConnectionManager *)self connectOnceIdentifiersMap];
      [v11 removeObjectForKey:v5];

      [(ConnectionManager *)self refreshConnectionAssertion];
      [(ConnectionManager *)self refreshPeripherals];
    }
  }
}

- (void)analyzeConnectionError:(id)a3 peripheral:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [v8 domain];
  if (v11 == CBErrorDomain && [v8 code] == (id)6)
  {

    goto LABEL_7;
  }
  id v12 = [v8 domain];
  id v13 = v12;
  if (v12 == (void *)CBInternalErrorDomain)
  {
    id v14 = [v8 code];

    if (v14 == (id)31)
    {
LABEL_7:
      long long v15 = +[NSDate date];
      uint64_t v16 = [v10 date];
      [v15 timeIntervalSinceDate:v16];
      double v18 = v17;

      if (v18 < 10.0) {
        goto LABEL_20;
      }
    }
  }
  else
  {
  }
  if ([v10 tryCount])
  {
    id v19 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = v19;
      int v21 = [v9 name];
      int v31 = 138412546;
      BOOL v32 = v21;
      __int16 v33 = 2048;
      id v34 = [v10 tryCount];
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" did not use any built-in service, strike #%lu", (uint8_t *)&v31, 0x16u);
    }
    unsigned __int8 v22 = [v9 hasTag:@"DoNotStopAutoConnecting"];
    if ((unint64_t)[v10 tryCount] >= 5 && (v22 & 1) == 0)
    {
      id v23 = +[NSNotificationCenter defaultCenter];
      [v23 postNotificationName:@"PeerIsNotUsingBuiltinServiceNotification" object:v9];
    }
  }
  id v24 = [v8 domain];
  if (v24 != CBErrorDomain) {
    goto LABEL_19;
  }
  id v25 = [v8 code];

  if (v25 == (id)14)
  {
    v26 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      unsigned int v28 = [v9 name];
      int v31 = 138412290;
      BOOL v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" removed pairing info, stop always connect", (uint8_t *)&v31, 0xCu);
    }
    id v29 = +[NSNotificationCenter defaultCenter];
    [v29 postNotificationName:@"PeerIsNotUsingBuiltinServiceNotification" object:v9];

    id v24 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    unsigned int v30 = [v9 identifier];
    [(NSString *)v24 removeObjectForKey:v30];

LABEL_19:
  }
LABEL_20:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(ConnectionManager *)self centralManagerStateString];
    *(_DWORD *)buf = 138412290;
    v68 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CentralManager state is now %@", buf, 0xCu);
  }
  [(ConnectionManager *)self refreshConnectionAssertion];
  id v8 = [(ConnectionManager *)self centralManager];
  id v9 = [v8 state];

  if (v9 == (id)10)
  {
    id v56 = v4;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v10 = [(ConnectionManager *)self peripherals];
    id v11 = [v10 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v62;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if ([(ConnectionManager *)self allowInRestrictedMode:v16])
          {
            id v17 = v16;

            id v13 = v17;
          }
          else
          {
            double v18 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Disconnecting peripheral : %@ since bluetooth is in restricted mode", buf, 0xCu);
            }
            [(ConnectionManager *)self disconnectPeripheral:v16 force:1];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v12);
    }
    else
    {
      id v13 = 0;
    }

    BOOL v32 = [(ConnectionManager *)self connectOnceIdentifiersMap];
    __int16 v33 = [v13 identifier];
    id v34 = [v32 objectForKey:v33];

    if (v34)
    {
      id v35 = [(ConnectionManager *)self connectOnceIdentifiersMap];
      long long v36 = [v13 identifier];
      long long v37 = [v35 objectForKey:v36];

      long long v38 = [(ConnectionManager *)self connectOnceIdentifiersMap];
      [v38 removeAllObjects];

      long long v39 = [(ConnectionManager *)self connectOnceIdentifiersMap];
      long long v40 = [v13 identifier];
      [v39 setObject:v37 forKey:v40];
    }
    long long v41 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    long long v42 = [v13 identifier];
    long long v43 = [v41 objectForKey:v42];

    if (v43)
    {
      long long v44 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
      v45 = [v13 identifier];
      v46 = [v44 objectForKey:v45];

      v47 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
      [v47 removeAllObjects];

      v48 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
      v49 = [v13 identifier];
      [v48 setObject:v46 forKey:v49];
    }
    [(ConnectionManager *)self setDenylistedIdentifiers:0];
    v50 = [(ConnectionManager *)self clientServiceManagerMap];
    v51 = [v50 objectForKey:v13];

    if (v51)
    {
      v52 = [(ConnectionManager *)self clientServiceManagerMap];
      v53 = [v52 objectForKeyedSubscript:v13];

      v54 = [(ConnectionManager *)self clientServiceManagerMap];
      [v54 removeAllObjects];

      v55 = [(ConnectionManager *)self clientServiceManagerMap];
      [v55 setObject:v53 forKey:v13];
    }
    [(ConnectionManager *)self refreshPeripherals];

LABEL_37:
    id v4 = v56;
    goto LABEL_38;
  }
  id v19 = [(ConnectionManager *)self centralManager];
  id v20 = [v19 state];

  if (v20 == (id)5)
  {
    id v56 = v4;
    [(ConnectionManager *)self refreshPeripherals];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    int v21 = self->_mfiAuthPendingPeripherals;
    id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v58;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
          v27 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deferred MFI Auth for %@", buf, 0xCu);
          }
          [(ConnectionManager *)self performMFiAuth:v26];
        }
        id v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v23);
    }

    [(NSMutableSet *)self->_mfiAuthPendingPeripherals removeAllObjects];
    goto LABEL_37;
  }
  unsigned int v28 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  [v28 removeAllObjects];

  id v29 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  [v29 removeAllObjects];

  [(ConnectionManager *)self setConnectAlwaysIdentifiersMap:0];
  unsigned int v30 = [(ConnectionManager *)self denylistedIdentifiers];
  [v30 removeAllObjects];

  [(ConnectionManager *)self setPeripherals:0];
  [(ConnectionManager *)self setMfiPeripheral:0];
  [(ConnectionManager *)self setAuthInProgress:0];
  int v31 = [(ConnectionManager *)self clientServiceManagerMap];
  [v31 removeAllObjects];

LABEL_38:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v7 name];
    *(_DWORD *)buf = 138412290;
    v66 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is now connected", buf, 0xCu);
  }
  if (![(ConnectionManager *)self authInProgress]) {
    goto LABEL_7;
  }
  id v11 = [(ConnectionManager *)self mfiPeripheral];
  id v12 = [v11 identifier];
  id v13 = [v7 identifier];
  unsigned int v14 = [v12 isEqual:v13];

  if (!v14)
  {
LABEL_7:
    if ([(ConnectionManager *)self authInProgress]) {
      goto LABEL_18;
    }
    double v18 = [(ConnectionManager *)self mfiPeripheral];
    if (!v18)
    {
      if (![v7 hasTag:@"needsMFiAuthentication4.0"]) {
        goto LABEL_18;
      }
      id v19 = [(ConnectionManager *)self centralManager];
      double v18 = [v19 retrievePairingInfoForPeripheral:v7];

      id v62 = [v18 objectForKey:@"kCBMsgArgRemoteAddress"];
      id v20 = (unsigned __int8 *)[v62 bytes];
      int v21 = +[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *v20, v20[1], v20[2], v20[3], v20[4], v20[5]];
      id v22 = +[ACCTransportClient sharedClient];
      [v22 setDelegate:self];

      id v23 = +[ACCTransportClient sharedClient];
      uint64_t v24 = [(ConnectionManager *)self connectionUUID];
      id v25 = [v23 identifierForConnectionWithUUID:v24];

      if (v25 == v21)
      {
        unsigned int v30 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connection exists!", buf, 2u);
        }
      }
      else
      {
        v26 = +[ACCTransportClient sharedClient];
        v27 = [v26 createConnectionWithType:2 andIdentifier:v21];
        [(ConnectionManager *)self setConnectionUUID:v27];

        unsigned int v28 = +[ACCTransportClient sharedClient];
        id v29 = [(ConnectionManager *)self connectionUUID];
        [v28 setConnectionAuthenticated:v29 state:1];
      }
      int v31 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Previously connected peripheral ..", buf, 2u);
      }
    }
LABEL_18:
    uint64_t v32 = [(ConnectionManager *)self mfiPeripheral];
    if (v32)
    {
      __int16 v33 = (void *)v32;
      id v34 = [(ConnectionManager *)self mfiPeripheral];
      id v35 = [v34 identifier];
      long long v36 = [v7 identifier];
      unsigned int v37 = [v35 isEqual:v36];

      if (v37)
      {
        long long v38 = [(ConnectionManager *)self mfiPeripheral];
        [v38 setDelegate:self];

        long long v39 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          long long v40 = v39;
          long long v41 = [(ConnectionManager *)self mfiPeripheral];
          long long v42 = [v41 name];
          *(_DWORD *)buf = 138412290;
          v66 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Perform mfi auth for \"%@\"...", buf, 0xCu);
        }
        long long v43 = [(ConnectionManager *)self centralManager];
        long long v44 = [v43 sharedPairingAgent];
        v45 = [v44 retrievePairedPeers];

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100034228;
        v63[3] = &unk_1000B1BB0;
        id v46 = v7;
        id v64 = v46;
        if ([v45 indexOfObjectPassingTest:v63] != (id)0x7FFFFFFFFFFFFFFFLL
          || ![(ConnectionManager *)self requireServicesAndMFi:v46])
        {
          v47 = [(ConnectionManager *)self mfiPeripheral];
          [v47 openL2CAPChannel:128];

          [(ConnectionManager *)self setAuthInProgress:1];
          v48 = [(ConnectionManager *)self mfiPeripheral];
          unsigned int v49 = [(ConnectionManager *)self requireServicesAndMFi:v48];

          if (!v49)
          {

            goto LABEL_36;
          }
        }
      }
    }
    v50 = [(ConnectionManager *)self peripherals];
    unsigned int v51 = [v50 containsObject:v7];

    if (!v51)
    {
      [(ConnectionManager *)self disconnectPeripheral:v7 force:0];
      goto LABEL_36;
    }
    [v7 setDelegate:self];
    v52 = [(ConnectionManager *)self clientServiceManagerMap];
    v53 = [v52 objectForKeyedSubscript:v7];

    if (!v53)
    {
      v54 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        id v56 = [v7 name];
        *(_DWORD *)buf = 138412290;
        v66 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Initializing ClientServiceManager for \"%@\"...", buf, 0xCu);
      }
      long long v57 = [[ClientServiceManager alloc] initWithPeripheral:v7];
      long long v58 = [(ConnectionManager *)self clientServiceManagerMap];
      [v58 setObject:v57 forKeyedSubscript:v7];
    }
    long long v59 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    long long v60 = [v7 identifier];
    uint64_t v16 = [v59 objectForKeyedSubscript:v60];

    if (v16)
    {
      long long v61 = +[NSDate date];
      [v16 setDate:v61];

      [v16 setTryCount:(char *)[v16 tryCount] + 1];
    }
    goto LABEL_33;
  }
  long long v15 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    id v17 = [v7 name];
    *(_DWORD *)buf = 138412290;
    v66 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Authentication in progress for \"%@\" Return.", buf, 0xCu);

LABEL_33:
  }
LABEL_36:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [v9 name];
    int v24 = 138412546;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" failed to connect: %@", (uint8_t *)&v24, 0x16u);
  }
  unsigned int v14 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  long long v15 = [v9 identifier];
  [v14 removeObjectForKey:v15];

  uint64_t v16 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  id v17 = [v9 identifier];
  [v16 removeObject:v17];

  double v18 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  id v19 = [v9 identifier];
  id v20 = [v18 objectForKeyedSubscript:v19];

  if (v20)
  {
    [(ConnectionManager *)self analyzeConnectionError:v10 peripheral:v9 info:v20];
    int v21 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    id v22 = [v9 identifier];
    id v23 = [v21 objectForKeyedSubscript:v22];

    if (v23) {
      [(ConnectionManager *)self connectPeripheral:v9];
    }
  }
  [(ConnectionManager *)self refreshConnectionAssertion];
  [(ConnectionManager *)self refreshPeripherals];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 timestamp:(double)a5 isReconnecting:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  long long v15 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    id v17 = [v13 name];
    int v32 = 138413058;
    __int16 v33 = v17;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2048;
    double v37 = CFAbsoluteTimeGetCurrent() - a5;
    __int16 v38 = 1024;
    BOOL v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" is disconnected: %@ %lf seconds ago, is reconnecting: %d", (uint8_t *)&v32, 0x26u);
  }
  double v18 = [(ConnectionManager *)self clientServiceManagerMap];
  [v18 removeObjectForKey:v13];

  id v19 = [(ConnectionManager *)self connectOnceIdentifiersMap];
  id v20 = [v13 identifier];
  [v19 removeObjectForKey:v20];

  int v21 = [(ConnectionManager *)self connectOnceNoTimeoutIdentifiers];
  id v22 = [v13 identifier];
  [v21 removeObject:v22];

  id v23 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  int v24 = [v13 identifier];
  id v25 = [v23 objectForKeyedSubscript:v24];

  if (v25)
  {
    [(ConnectionManager *)self analyzeConnectionError:v14 peripheral:v13 info:v25];
    __int16 v26 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
    id v27 = [v13 identifier];
    unsigned int v28 = [v26 objectForKeyedSubscript:v27];

    if (v28)
    {
      if (!v8) {
        [(ConnectionManager *)self connectPeripheral:v13];
      }
    }
  }
  if ([(ConnectionManager *)self requireServicesAndMFi:v13])
  {
    id v29 = [(ConnectionManager *)self connectionUUID];

    if (v29)
    {
      unsigned int v30 = +[ACCTransportClient sharedClient];
      int v31 = [(ConnectionManager *)self connectionUUID];
      [v30 destroyConnectionWithUUID:v31];
    }
  }
  [(ConnectionManager *)self refreshConnectionAssertion];
  [(ConnectionManager *)self refreshPeripherals];
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error in opening CBL2CAP channel: %@", buf, 0xCu);
    }
    [(ConnectionManager *)self setAuthInProgress:0];
    [(ConnectionManager *)self setMfiPeripheral:0];
    if ([(ConnectionManager *)self requireServicesAndMFi:v8]) {
      [(ConnectionManager *)self disconnectPeripheral:v8 force:0];
    }
  }
  else
  {
    id v12 = [(ConnectionManager *)self L2CAPChannels];
    [v12 addObject:v9];

    id v13 = (void *)voucher_copy();
    [(ConnectionManager *)self setMfiVoucher:v13];

    [(ConnectionManager *)self setPeerChannel:v9];
    id v14 = [v9 inputStream];
    [v14 setDelegate:self];

    long long v15 = [v9 outputStream];
    [v15 setDelegate:self];

    uint64_t v16 = [v9 inputStream];
    id v17 = +[NSRunLoop currentRunLoop];
    [v16 scheduleInRunLoop:v17 forMode:NSDefaultRunLoopMode];

    double v18 = [v9 outputStream];
    id v19 = +[NSRunLoop currentRunLoop];
    [v18 scheduleInRunLoop:v19 forMode:NSDefaultRunLoopMode];

    id v20 = [v9 inputStream];
    [v20 open];

    int v21 = [v9 outputStream];
    [v21 open];

    if ([v8 hasTag:@"needsMFiAuthentication4.0"])
    {
      [(ConnectionManager *)self setMfiAuthChannel:v9];
      id v22 = [(ConnectionManager *)self centralManager];
      id v23 = [v22 retrievePairingInfoForPeripheral:v8];

      id v24 = [v23 objectForKey:@"kCBMsgArgRemoteAddress"];
      id v25 = (unsigned __int8 *)[v24 bytes];
      __int16 v26 = +[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *v25, v25[1], v25[2], v25[3], v25[4], v25[5]];
      id v27 = +[ACCTransportClient sharedClient];
      [v27 setDelegate:self];

      unsigned int v28 = +[ACCTransportClient sharedClient];
      id v29 = [v28 createConnectionWithType:2 andIdentifier:v26];
      [(ConnectionManager *)self setConnectionUUID:v29];

      unsigned int v30 = +[ACCTransportClient sharedClient];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100034D24;
      v43[3] = &unk_1000B1BD8;
      id v44 = v9;
      int v31 = [(ConnectionManager *)self connectionUUID];
      int v32 = [v30 createEndpointWithTransportType:3 andProtocol:14 andIdentifier:0 andDataOutHandler:v43 forConnectionWithUUID:v31 publishConnection:1];
      [(ConnectionManager *)self setEndpointUUID:v32];
    }
    else
    {
      __int16 v33 = +[ACCTransportClient sharedClient];
      [v33 setDelegate:self];

      __int16 v34 = +[ACCTransportClient sharedClient];
      id v35 = [v8 identifier];
      __int16 v36 = [v35 UUIDString];
      double v37 = [v34 createConnectionWithType:2 andIdentifier:v36];
      [(ConnectionManager *)self setConnectionUUID:v37];

      __int16 v38 = +[ACCTransportClient sharedClient];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100034DB4;
      v41[3] = &unk_1000B1BD8;
      id v42 = v9;
      BOOL v39 = [(ConnectionManager *)self connectionUUID];
      long long v40 = [v38 createEndpointWithTransportType:3 andProtocol:4 andIdentifier:0 andDataOutHandler:v41 forConnectionWithUUID:v39 publishConnection:1];
      [(ConnectionManager *)self setEndpointUUID:v40];
    }
  }
}

- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = [(ConnectionManager *)self mfiPeripheral];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(ConnectionManager *)self mfiPeripheral];
    unsigned int v11 = [(ConnectionManager *)self requireServicesAndMFi:v10];

    if (v11)
    {
      [(ConnectionManager *)self setAuthInProgress:0];
      id v12 = [(ConnectionManager *)self mfiAuthChannel];
      id v13 = [v12 inputStream];
      id v14 = +[NSRunLoop currentRunLoop];
      [v13 removeFromRunLoop:v14 forMode:NSDefaultRunLoopMode];

      long long v15 = [(ConnectionManager *)self mfiAuthChannel];
      uint64_t v16 = [v15 outputStream];
      id v17 = +[NSRunLoop currentRunLoop];
      [v16 removeFromRunLoop:v17 forMode:NSDefaultRunLoopMode];

      double v18 = [(ConnectionManager *)self mfiAuthChannel];
      id v19 = [v18 inputStream];
      [v19 setDelegate:0];

      id v20 = [(ConnectionManager *)self mfiAuthChannel];
      int v21 = [v20 outputStream];
      [v21 setDelegate:0];

      id v22 = [(ConnectionManager *)self mfiAuthChannel];
      id v23 = [v22 inputStream];
      [v23 close];

      id v24 = [(ConnectionManager *)self mfiAuthChannel];
      id v25 = [v24 outputStream];
      [v25 close];
    }
  }
  __int16 v26 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = "not authenticated";
    if (v5) {
      id v27 = "authenticated";
    }
    *(_DWORD *)buf = 138412546;
    id v58 = v7;
    __int16 v59 = 2080;
    long long v60 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "AuthStatusDidChange %@ %s", buf, 0x16u);
  }
  unsigned int v28 = [(ConnectionManager *)self mfiPeripheral];
  id v29 = v28;
  if (v5)
  {

    if (v29)
    {
      unsigned int v30 = [(ConnectionManager *)self mfiPeripheral];
      int v31 = [v30 identifier];
      int v32 = [v31 UUIDString];
      id v56 = v32;
      CFDictionaryRef v33 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bluetooth.accessory-authentication.success", 0, 0, 0);
      DistributedCenter = CFNotificationCenterGetDistributedCenter();
      CFNotificationCenterPostNotification(DistributedCenter, @"com.apple.bluetooth.accessory-authentication.success", 0, v33, 0);
      [(ConnectionManager *)self setMfiVoucher:0];
      __int16 v36 = [(ConnectionManager *)self mfiPeripheral];
      LODWORD(v31) = [v36 hasTag:@"A2538"];

      if (v31)
      {
        double v37 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = v37;
          BOOL v39 = [(ConnectionManager *)self mfiPeripheral];
          *(_DWORD *)buf = 138412290;
          id v58 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Posting Find My specific auth successful notification for: %@", buf, 0xCu);
        }
        long long v40 = +[NSNotificationCenter defaultCenter];
        long long v41 = [(ConnectionManager *)self mfiPeripheral];
        [v40 postNotificationName:@"A2538_AuthenticationDidSucceed" object:v41 userInfo:0];
      }
      id v42 = [(ConnectionManager *)self mfiPeripheral];
      unsigned int v43 = [v42 hasTag:@"needsMFiAuthentication4.0"];

      if (v43)
      {
        id v44 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          id v46 = [(ConnectionManager *)self mfiPeripheral];
          *(_DWORD *)buf = 138412290;
          id v58 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Posting auth successful notification for: %@", buf, 0xCu);
        }
        v47 = +[NSNotificationCenter defaultCenter];
        v48 = [(ConnectionManager *)self mfiPeripheral];
        [v47 postNotificationName:@"AuthenticationServiceAuthDidSucceedNotification" object:v48 userInfo:0];
      }
LABEL_22:

      goto LABEL_25;
    }
    v54 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070BF0(v54);
    }
  }
  else
  {
    unsigned int v49 = [v28 hasTag:@"needsMFiAuthentication4.0"];

    if (v49)
    {
      v50 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v51 = v50;
        v52 = [(ConnectionManager *)self mfiPeripheral];
        *(_DWORD *)buf = 138412290;
        id v58 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Posting auth failed notification for: %@", buf, 0xCu);
      }
      CFDictionaryRef v33 = +[NSNotificationCenter defaultCenter];
      v53 = [(ConnectionManager *)self mfiPeripheral];
      [(__CFDictionary *)v33 postNotificationName:@"AuthenticationServiceAuthDidFailNotification" object:v53 userInfo:0];

      goto LABEL_22;
    }
  }
LABEL_25:
}

- (void)transportClientServerDisconnected:(id)a3
{
  id v22 = a3;
  id v4 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "transportClientServerDisconnected!!", buf, 2u);
  }
  BOOL v5 = [(ConnectionManager *)self centralManager];
  id v6 = [v5 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([(ConnectionManager *)self requireServicesAndMFi:v11])
        {
          id v12 = [(ConnectionManager *)self centralManager];
          id v13 = [v12 retrievePairingInfoForPeripheral:v11];

          id v14 = [v13 objectForKey:@"kCBMsgArgRemoteAddress"];
          long long v15 = (unsigned __int8 *)[v14 bytes];
          uint64_t v16 = +[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *v15, v15[1], v15[2], v15[3], v15[4], v15[5], v22];
          id v17 = +[ACCTransportClient sharedClient];
          [v17 setDelegate:self];

          double v18 = +[ACCTransportClient sharedClient];
          id v19 = [v18 createConnectionWithType:2 andIdentifier:v16];
          [(ConnectionManager *)self setConnectionUUID:v19];

          id v20 = +[ACCTransportClient sharedClient];
          int v21 = [(ConnectionManager *)self connectionUUID];
          [v20 setConnectionAuthenticated:v21 state:1];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7
{
  id v7 = a4;
  id v8 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100070C34((uint64_t)v7, v8);
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ConnectionManager *)self clientServiceManagerMap];
  id v9 = [v8 objectForKeyedSubscript:v7];

  [v9 peripheral:v7 didModifyServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ConnectionManager *)self clientServiceManagerMap];
  id v9 = [v8 objectForKeyedSubscript:v7];

  [v9 peripheral:v7 didDiscoverServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didDiscoverCharacteristicsForService:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didUpdateValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didWriteValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didUpdateNotificationStateForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didDiscoverDescriptorsForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ConnectionManager *)self clientServiceManagerMap];
  id v12 = [v11 objectForKeyedSubscript:v10];

  [v12 peripheral:v10 didUpdateValueForDescriptor:v9 error:v8];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v5 = a3;
  if (a4 != 16)
  {
    if (a4 != 8)
    {
      if (a4 == 2)
      {
        id v6 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NSStreamEventHasBytesAvailable", buf, 2u);
        }
        bzero(buf, 0x1000uLL);
        id v7 = [v5 read:buf maxLength:4096];
        if (v7)
        {
          uint64_t v8 = (uint64_t)v7;
          id v9 = +[NSData dataWithBytes:buf length:v7];
          id v10 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
            sub_100070CAC((uint64_t)v9, v8, v10);
          }
          uint64_t v11 = +[ACCTransportClient sharedClient];
          id v12 = [(ConnectionManager *)self endpointUUID];
          [v11 processIncomingData:v9 forEndpointWithUUID:v12];

          goto LABEL_27;
        }
      }
      goto LABEL_28;
    }
    id v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      long long v15 = [v5 streamError];
      *(_DWORD *)buf = 138412290;
      id v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NSStreamEventErrorOccurred : %@. Teardown auth", buf, 0xCu);
    }
  }
  uint64_t v16 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NSStreamEventEndEncountered", buf, 2u);
  }
  [(ConnectionManager *)self setAuthInProgress:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(ConnectionManager *)self L2CAPChannels];
  id v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        int v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v22 = [v21 inputStream];
        if ([v22 isEqual:v5])
        {
        }
        else
        {
          id v23 = [v21 outputStream];
          unsigned int v24 = [v23 isEqual:v5];

          if (!v24) {
            continue;
          }
        }
        long long v25 = [v21 inputStream];
        long long v26 = +[NSRunLoop currentRunLoop];
        [v25 removeFromRunLoop:v26 forMode:NSDefaultRunLoopMode];

        long long v27 = [v21 outputStream];
        unsigned int v28 = +[NSRunLoop currentRunLoop];
        [v27 removeFromRunLoop:v28 forMode:NSDefaultRunLoopMode];

        id v29 = [v21 inputStream];
        [v29 setDelegate:0];

        unsigned int v30 = [v21 outputStream];
        [v30 setDelegate:0];

        int v31 = [v21 inputStream];
        [v31 close];

        int v32 = [v21 outputStream];
        [v32 close];

        [(ConnectionManager *)self setMfiVoucher:0];
      }
      id v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v18);
  }

  CFDictionaryRef v33 = [(ConnectionManager *)self connectionUUID];

  if (v33)
  {
    id v9 = +[ACCTransportClient sharedClient];
    uint64_t v11 = [(ConnectionManager *)self connectionUUID];
    [v9 destroyConnectionWithUUID:v11];
LABEL_27:
  }
LABEL_28:
}

- (void)peripheralPairingDidFail:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000361B8;
    v8[3] = &unk_1000B1778;
    v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

- (void)authDidSucceed:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ConnectionManager *)self denylistedIdentifiers];
  id v5 = [v6 identifier];
  [v4 removeObject:v5];
}

- (void)authDidFail:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(ConnectionManager *)self denylistedIdentifiers];
  id v6 = [v4 identifier];
  [v5 addObject:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100036328;
  v8[3] = &unk_1000B1778;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)peerIsUsingBuiltinService:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(ConnectionManager *)self connectAlwaysIdentifiersMap];
  id v5 = [v7 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    [v6 setTryCount:0];
  }
}

- (void)peerDidIdleTimeout:(id)a3
{
  [a3 object];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003647C;
  v5[3] = &unk_1000B1778;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)centralManagerStateString
{
  v2 = [(ConnectionManager *)self centralManager];
  id v3 = (char *)[v2 state];

  if ((unint64_t)(v3 - 1) > 9) {
    return @"unknown";
  }
  else {
    return off_1000B1BF8[(void)(v3 - 1)];
  }
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableDictionary)connectOnceIdentifiersMap
{
  return self->_connectOnceIdentifiersMap;
}

- (void)setConnectOnceIdentifiersMap:(id)a3
{
}

- (NSMutableSet)connectOnceNoTimeoutIdentifiers
{
  return self->_connectOnceNoTimeoutIdentifiers;
}

- (void)setConnectOnceNoTimeoutIdentifiers:(id)a3
{
}

- (NSMutableDictionary)connectAlwaysIdentifiersMap
{
  return self->_connectAlwaysIdentifiersMap;
}

- (void)setConnectAlwaysIdentifiersMap:(id)a3
{
}

- (NSMutableSet)denylistedIdentifiers
{
  return self->_denylistedIdentifiers;
}

- (void)setDenylistedIdentifiers:(id)a3
{
}

- (OS_os_transaction)connectionAssertion
{
  return self->_connectionAssertion;
}

- (void)setConnectionAssertion:(id)a3
{
}

- (NSArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (NSMutableArray)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
}

- (NSMutableDictionary)clientServiceManagerMap
{
  return self->_clientServiceManagerMap;
}

- (void)setClientServiceManagerMap:(id)a3
{
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (CBPeripheral)mfiPeripheral
{
  return self->_mfiPeripheral;
}

- (void)setMfiPeripheral:(id)a3
{
}

- (CBL2CAPChannel)peerChannel
{
  return self->_peerChannel;
}

- (void)setPeerChannel:(id)a3
{
}

- (CBL2CAPChannel)mfiAuthChannel
{
  return self->_mfiAuthChannel;
}

- (void)setMfiAuthChannel:(id)a3
{
}

- (BOOL)authInProgress
{
  return self->_authInProgress;
}

- (void)setAuthInProgress:(BOOL)a3
{
  self->_authInProgress = a3;
}

- (OS_voucher)mfiVoucher
{
  return self->_mfiVoucher;
}

- (void)setMfiVoucher:(id)a3
{
}

- (NSMutableSet)mfiAuthPendingPeripherals
{
  return self->_mfiAuthPendingPeripherals;
}

- (void)setMfiAuthPendingPeripherals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfiAuthPendingPeripherals, 0);
  objc_storeStrong((id *)&self->_mfiVoucher, 0);
  objc_storeStrong((id *)&self->_mfiAuthChannel, 0);
  objc_storeStrong((id *)&self->_peerChannel, 0);
  objc_storeStrong((id *)&self->_mfiPeripheral, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_clientServiceManagerMap, 0);
  objc_storeStrong((id *)&self->_L2CAPChannels, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_connectionAssertion, 0);
  objc_storeStrong((id *)&self->_denylistedIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectAlwaysIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_connectOnceNoTimeoutIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectOnceIdentifiersMap, 0);

  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end