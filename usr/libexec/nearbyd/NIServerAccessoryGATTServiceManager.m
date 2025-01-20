@interface NIServerAccessoryGATTServiceManager
+ (id)sharedInstance;
- (BOOL)_isListener:(id)a3 backgroundAuthorizedForPeer:(id)a4 useCache:(BOOL)a5;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_cleanupExcessiveDetachedPeers;
- (void)_connectToPeer:(id)a3;
- (void)_peer:(id)a3 didFailWithError:(id)a4;
- (void)addServiceListener:(id)a3 withIdentifier:(id)a4 forBluetoothPeer:(id)a5 withConfiguration:(id)a6;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)probeAuthorizationForServiceListenerWithIdentifier:(id)a3;
- (void)removeServiceListenerWithIdentifier:(id)a3;
@end

@implementation NIServerAccessoryGATTServiceManager

- (id)_initInternal
{
  v16.receiver = self;
  v16.super_class = (Class)NIServerAccessoryGATTServiceManager;
  v2 = [(NIServerAccessoryGATTServiceManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearbyd.accessory.gatt-service", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:v2 queue:v2->_queue];
    cbManager = v2->_cbManager;
    v2->_cbManager = v6;

    uint64_t v8 = objc_opt_new();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = (NSMutableDictionary *)v10;

    if (+[NIPlatformInfo isInternalBuild]
      || (+[NSUserDefaults standardUserDefaults],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 BOOLForKey:@"EnableStateDump"],
          v12,
          v13))
    {
      v15 = v2;
      os_state_add_handler();
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB650;
  block[3] = &unk_1008466D8;
  block[4] = a1;
  if (qword_1008A3E48 != -1) {
    dispatch_once(&qword_1008A3E48, block);
  }
  v2 = (void *)qword_1008A3E40;

  return v2;
}

- (void)addServiceListener:(id)a3 withIdentifier:(id)a4 forBluetoothPeer:(id)a5 withConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB79C;
  block[3] = &unk_100856BD8;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)probeAuthorizationForServiceListenerWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001ABC98;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)removeServiceListenerWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001AC494;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (id)printableState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001AC8A8;
  id v10 = sub_1001AC8B8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001AC8C0;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1001AC8A8;
  v19 = sub_1001AC8B8;
  id v20 = (id)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v4 = sub_100006C38();
  v5 = (void *)v16[5];
  uint64_t v6 = +[NSString stringWithFormat:@"%d listeners", [(NSMutableDictionary *)self->_listeners count]];
  [v5 addObject:v6];

  listeners = self->_listeners;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001ACB54;
  v14[3] = &unk_100856C28;
  v14[4] = &v15;
  [(NSMutableDictionary *)listeners enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v8 = (void *)v16[5];
  v9 = +[NSString stringWithFormat:@"%d peers", [(NSMutableDictionary *)self->_peerDevices count]];
  [v8 addObject:v9];

  peerDevices = self->_peerDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001ACD20;
  v13[3] = &unk_100856C78;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  [(NSMutableDictionary *)peerDevices enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)_connectToPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (char *)[(CBCentralManager *)self->_cbManager state];
  if ((unint64_t)(v5 - 2) < 3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004173DC();
    }
    v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10017 userInfo:0];
    [(NIServerAccessoryGATTServiceManager *)self _peer:v4 didFailWithError:v9];
  }
  else if ((unint64_t)v5 >= 2)
  {
    if (v5 != (char *)5) {
      __assert_rtn("-[NIServerAccessoryGATTServiceManager _connectToPeer:]", "NIServerAccessoryGATTServiceManager.mm", 413, "cbState == CBManagerStatePoweredOn");
    }
    id v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v4];
    unsigned int v11 = [v10 connectionState];

    if (v11 == 6)
    {
      id v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: already finished", buf, 0xCu);
      }
    }
    else
    {
      id v13 = [(CBCentralManager *)self->_cbManager sharedPairingAgent];
      v14 = [v13 retrievePairedPeers];

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001AD7E4;
      v33[3] = &unk_100856CA0;
      id v15 = v4;
      id v34 = v15;
      if ([v14 indexOfObjectPassingTest:v33] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100417444();
        }
        id v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
        [(NIServerAccessoryGATTServiceManager *)self _peer:v15 didFailWithError:v16];
      }
      else
      {
        id v16 = [(CBCentralManager *)self->_cbManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
        v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        v30 = sub_1001AD838;
        v31 = &unk_100856CC8;
        id v17 = v15;
        id v32 = v17;
        id v18 = [v16 indexOfObjectPassingTest:&v28];
        v19 = qword_1008ABDE0;
        if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_1004174AC();
          }
          id v20 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction", -5882, 0, v28, v29, v30, v31 code userInfo];
          [(NIServerAccessoryGATTServiceManager *)self _peer:v17 didFailWithError:v20];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: Paired and connected. Establishing a local connection", buf, 0xCu);
          }
          id v21 = [v16 objectAtIndexedSubscript:v18, v28, v29, v30, v31];
          id v22 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v17];
          [v22 setPeripheral:v21];

          id v23 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v17];
          v24 = [v23 peripheral];
          [v24 setDelegate:self];

          cbManager = self->_cbManager;
          v26 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v17];
          v27 = [v26 peripheral];
          [(CBCentralManager *)cbManager connectPeripheral:v27 options:0];

          id v20 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v17];
          [v20 changeConnectionState:2];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#bt-accessory,ConnectToPeer [%@]: wait for CBManager state update", buf, 0xCu);
    }
    v7 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v4];
    [v7 changeConnectionState:1];

    uint64_t v8 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v4];
    [v8 cacheCharacteristics];
  }
}

- (void)_peer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
  [v8 changeConnectionState:0];

  v9 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
  [v9 cacheCharacteristics];

  id v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
  unsigned int v11 = [v10 listeners];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001AD9F0;
  v13[3] = &unk_100856CF0;
  v13[4] = self;
  id v12 = v7;
  id v14 = v12;
  [v11 enumerateObjectsUsingBlock:v13];
}

- (BOOL)_isListener:(id)a3 backgroundAuthorizedForPeer:(id)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [(NSMutableDictionary *)self->_listeners objectForKeyedSubscript:v8];
  unsigned int v11 = [v10 configuration];

  uint64_t v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    id v14 = [v11 accessoryConfigData];
    id v15 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
    if (v5) {
      [v15 cachedConfigCharacteristics];
    }
    else {
    id v16 = [v15 resultConfigCharacteristics];
    }
    unsigned __int8 v17 = [v16 containsObject:v14];

    BOOL v13 = (v17 & 1) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_cleanupExcessiveDetachedPeers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"NIAccessoryMaxDetachedPeersOverride"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else {
    unsigned int v5 = 2;
  }
  id v6 = objc_opt_new();
  peerDevices = self->_peerDevices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001ADED0;
  v11[3] = &unk_100856D18;
  id v8 = v6;
  id v12 = v8;
  [(NSMutableDictionary *)peerDevices enumerateKeysAndObjectsUsingBlock:v11];
  if ((unint64_t)[v8 count] > v5)
  {
    id v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [v8 count];
      *(_DWORD *)buf = 67109376;
      unsigned int v14 = v10;
      __int16 v15 = 1024;
      unsigned int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#bt-accessory,Cleaning up detached peers. %d found, exceeds max of %d", buf, 0xEu);
    }

    [(NSMutableDictionary *)self->_peerDevices removeObjectsForKeys:v8];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = (unint64_t)[v4 state];
    if (v6 > 0xA) {
      id v7 = "?";
    }
    else {
      id v7 = off_100856DD0[v6];
    }
    *(_DWORD *)buf = 136315138;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManagerDidUpdateState: %s", buf, 0xCu);
  }

  peerDevices = self->_peerDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001AE0D8;
  v9[3] = &unk_100856D18;
  v9[4] = self;
  [(NSMutableDictionary *)peerDevices enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 identifier];
  id v7 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
    id v9 = [v8 peripheral];
    if (v9)
    {
      unsigned int v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
      id v11 = [v10 peripheral];

      if (v11 == v5)
      {
        id v12 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
        unsigned int v13 = [v12 connectionState];

        unsigned int v14 = qword_1008ABDE0;
        if (v13 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didConnectPeripheral [%@]: Success", buf, 0xCu);
          }
          __int16 v15 = +[CBUUID UUIDWithString:@"48fe3e40-0817-4bb2-8633-3073689c2dba"];
          id v18 = v15;
          unsigned int v16 = +[NSArray arrayWithObjects:&v18 count:1];
          [v5 discoverServices:v16];

          unsigned __int8 v17 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v6];
          [v17 changeConnectionState:3];
        }
        else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          sub_10041757C();
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100417514();
  }
LABEL_11:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 identifier];
  unsigned int v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
    id v12 = [v11 peripheral];
    if (v12)
    {
      unsigned int v13 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
      id v14 = [v13 peripheral];

      if (v14 == v7)
      {
        __int16 v15 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
        unsigned int v16 = [v15 connectionState];

        unsigned __int8 v17 = qword_1008ABDE0;
        if (v16 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412546;
            id v20 = v9;
            __int16 v21 = 2112;
            id v22 = v8;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: Error: %@", (uint8_t *)&v19, 0x16u);
          }
          id v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
          [(NIServerAccessoryGATTServiceManager *)self _peer:v9 didFailWithError:v18];
        }
        else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          sub_10041764C();
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004175E4();
  }
LABEL_11:
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 identifier];
  unsigned int v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
    id v12 = [v11 peripheral];
    if (v12)
    {
      unsigned int v13 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v9];
      id v14 = [v13 peripheral];

      if (v14 == v7)
      {
        __int16 v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412546;
          id v18 = v9;
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#bt-accessory,centralManager:didDisconnectPeripheral [%@]: Error: %@", (uint8_t *)&v17, 0x16u);
        }
        unsigned int v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
        [(NIServerAccessoryGATTServiceManager *)self _peer:v9 didFailWithError:v16];

        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004176B4();
  }
LABEL_10:
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v8];
  if (!v9)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041771C();
    }
    goto LABEL_12;
  }
  unsigned int v10 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v8];
  id v11 = [v10 peripheral];
  if (!v11)
  {

    goto LABEL_10;
  }
  id v12 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v8];
  id v13 = [v12 peripheral];

  if (v13 != v6) {
    goto LABEL_10;
  }
  id v14 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v8];
  unsigned int v15 = [v14 connectionState];

  if (v15 == 3)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004177EC();
      }
LABEL_8:
      unsigned int v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
      [(NIServerAccessoryGATTServiceManager *)self _peer:v8 didFailWithError:v16];

      goto LABEL_12;
    }
    int v17 = [v6 services];
    id v18 = [v17 indexOfObjectPassingTest:&stru_100856D58];

    __int16 v19 = qword_1008ABDE0;
    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100417784();
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didDiscoverServices [%@]: Success", buf, 0xCu);
    }
    id v20 = +[CBUUID UUIDWithString:@"95e8d9d5-d8ef-4721-9a4e-807375f53328"];
    __int16 v21 = +[CBUUID UUIDWithString:@"1176cf7b-bed2-4690-bd69-5f34001e820c", v20];
    v26[1] = v21;
    id v22 = +[NSArray arrayWithObjects:v26 count:2];
    id v23 = [v6 services];
    v24 = [v23 objectAtIndexedSubscript:v18];
    [v6 discoverCharacteristics:v22 forService:v24];

    v25 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v8];
    [v25 changeConnectionState:4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100417854();
  }
LABEL_12:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  id v12 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  if (v12)
  {
    id v13 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
    id v14 = [v13 peripheral];
    if (v14)
    {
      unsigned int v15 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
      id v16 = [v15 peripheral];

      if (v16 == v8)
      {
        int v17 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
        unsigned int v18 = [v17 connectionState];

        if (v18 == 4)
        {
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
              sub_10041798C();
            }
            __int16 v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
            [(NIServerAccessoryGATTServiceManager *)self _peer:v11 didFailWithError:v19];
          }
          else
          {
            id v20 = [v9 UUID];
            __int16 v21 = +[CBUUID UUIDWithString:@"48fe3e40-0817-4bb2-8633-3073689c2dba"];
            if (([v20 isEqual:v21] & 1) == 0) {
              __assert_rtn("-[NIServerAccessoryGATTServiceManager peripheral:didDiscoverCharacteristicsForService:error:]", "NIServerAccessoryGATTServiceManager.mm", 662, "[service.UUID isEqual:[CBUUID UUIDWithString:kNearbyInteractionServiceUUID]]");
            }

            id v22 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
            [v22 setNumCharacteristicsLeftToRead:0];

            id v23 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
            [v23 setReadingMultiConfigCharacteristics:0];

            v24 = [v9 characteristics];
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_1001AF444;
            v45[3] = &unk_100856D80;
            id v25 = v8;
            id v46 = v25;
            v47 = self;
            id v26 = v11;
            id v48 = v26;
            [v24 enumerateObjectsUsingBlock:v45];

            v27 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v26];
            unsigned __int8 v28 = [v27 readingMultiConfigCharacteristics];

            if ((v28 & 1) == 0)
            {
              uint64_t v29 = [v9 characteristics];
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_1001AF55C;
              v41[3] = &unk_100856D80;
              id v42 = v25;
              v43 = self;
              id v44 = v26;
              [v29 enumerateObjectsUsingBlock:v41];
            }
            v30 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v26];
            BOOL v31 = [v30 numCharacteristicsLeftToRead] == 0;

            if (v31)
            {
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                sub_100417924();
              }
              v38 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
              [(NIServerAccessoryGATTServiceManager *)self _peer:v26 didFailWithError:v38];
            }
            else
            {
              id v32 = (id)qword_1008ABDE0;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v40 = [v9 characteristics];
                unsigned int v33 = [v40 count];
                v39 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v26];
                unsigned int v34 = [v39 numCharacteristicsLeftToRead];
                v35 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v26];
                unsigned int v36 = [v35 readingMultiConfigCharacteristics];
                v37 = "single-config";
                *(_DWORD *)buf = 138413058;
                id v50 = v26;
                __int16 v51 = 1024;
                if (v36) {
                  v37 = "multi-config";
                }
                unsigned int v52 = v33;
                __int16 v53 = 1024;
                unsigned int v54 = v34;
                __int16 v55 = 2080;
                v56 = v37;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: %d total characteristics discovered, and triggered reads on %d %s characteristics", buf, 0x22u);
              }
              v38 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v26];
              [v38 changeConnectionState:5];
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          sub_1004179F4();
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004178BC();
  }
LABEL_12:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  id v12 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  if (!v12)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417A5C();
    }
    goto LABEL_12;
  }
  id v13 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  id v14 = [v13 peripheral];
  if (!v14)
  {

    goto LABEL_10;
  }
  unsigned int v15 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  id v16 = [v15 peripheral];

  if (v16 != v8) {
    goto LABEL_10;
  }
  int v17 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  unsigned int v18 = [v17 connectionState];

  if (v18 != 5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417BFC();
    }
    goto LABEL_12;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417B94();
    }
LABEL_8:
    __int16 v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
    [(NIServerAccessoryGATTServiceManager *)self _peer:v11 didFailWithError:v19];

    goto LABEL_12;
  }
  id v20 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
  [v20 setNumCharacteristicsLeftToRead:[v20 numCharacteristicsLeftToRead] - 1];

  __int16 v21 = [v9 UUID];
  id v22 = +[CBUUID UUIDWithString:@"1176cf7b-bed2-4690-bd69-5f34001e820c"];
  unsigned int v23 = [v21 isEqual:v22];

  if (!v23)
  {
    id v26 = [v9 UUID];
    v27 = +[CBUUID UUIDWithString:@"95e8d9d5-d8ef-4721-9a4e-807375f53328"];
    unsigned int v28 = [v26 isEqual:v27];

    if (v28)
    {
      uint64_t v29 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
      v30 = [v29 resultConfigCharacteristics];
      BOOL v31 = [v9 value];
      [v30 addObject:v31];

      id v32 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v33 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
        unsigned int v34 = [v33 resultConfigCharacteristics];
        unsigned int v35 = [v34 count];
        unsigned int v36 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v35;
        __int16 v83 = 1024;
        unsigned int v84 = [v36 numCharacteristicsLeftToRead];
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d single-config characteristics, %d left to go", buf, 0x18u);
      }
    }
    goto LABEL_58;
  }
  v24 = [v9 value];
  int v25 = [v24 length];

  if (v25 >= 65282)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417AC4();
    }
    goto LABEL_8;
  }
  buf[0] = 0;
  sub_1001B0664(&__p, v25, buf);
  v37 = [v9 value];
  int v73 = v25;
  [v37 getBytes:__p length:v78 - (unsigned char *)__p];

  int v38 = v25;
  if (v25 > 0)
  {
    unsigned int v39 = *(unsigned __int8 *)__p;
    v40 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v80 = v11;
      __int16 v81 = 1024;
      int v82 = 1;
      __int16 v83 = 1024;
      unsigned int v84 = v38;
      __int16 v85 = 1024;
      unsigned int v86 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Read config count (%d)", buf, 0x1Eu);
    }
    v72 = objc_opt_new();
    if (v39)
    {
      unsigned int v71 = v39;
      unsigned __int8 v42 = v39 - 1;
      int v43 = 1;
      *(void *)&long long v41 = 138413570;
      long long v70 = v41;
      while (v43 < v38)
      {
        uint64_t v44 = v43 + 1;
        int v45 = *((unsigned __int8 *)__p + v43);
        if (*((unsigned char *)__p + v43))
        {
          if (v43 + v45 >= v38)
          {
            v62 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v70;
              v80 = v11;
              __int16 v81 = 1024;
              int v82 = v43 + 1;
              __int16 v83 = 1024;
              unsigned int v84 = v73;
              __int16 v85 = 1024;
              unsigned int v86 = v71 - v42;
              __int16 v87 = 1024;
              unsigned int v88 = v71;
              __int16 v89 = 1024;
              int v90 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Could not read data (len: %d)", buf, 0x2Au);
            }
            goto LABEL_53;
          }
          id v46 = +[NSData dataWithBytes:(char *)__p + v44 length:*((unsigned __int8 *)__p + v43)];
          [v72 addObject:v46];

          LODWORD(v44) = v44 + v45;
          uint64_t v47 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v70;
            v80 = v11;
            __int16 v81 = 1024;
            int v82 = v44;
            __int16 v83 = 1024;
            unsigned int v84 = v73;
            __int16 v85 = 1024;
            unsigned int v86 = v71 - v42;
            __int16 v87 = 1024;
            unsigned int v88 = v71;
            __int16 v89 = 1024;
            int v90 = v45;
            id v48 = v47;
            int v38 = v73;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Read data (len: %d)", buf, 0x2Au);
          }
          else
          {
            int v38 = v73;
          }
        }
        int v43 = v44;
        if (!v42--) {
          goto LABEL_41;
        }
      }
      v61 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v43;
        __int16 v83 = 1024;
        unsigned int v84 = v73;
        __int16 v85 = 1024;
        unsigned int v86 = v71 - v42;
        __int16 v87 = 1024;
        unsigned int v88 = v71;
        _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Config %d of %d: Could not read length", buf, 0x24u);
      }
    }
    else
    {
      LODWORD(v44) = 1;
LABEL_41:
      if ((int)v44 >= v38)
      {
        __int16 v53 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
        unsigned int v54 = [v53 resultConfigCharacteristics];
        [v54 unionSet:v72];

        __int16 v55 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v74 = [v72 count];
          v56 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
          v57 = [v56 resultConfigCharacteristics];
          unsigned int v58 = [v57 count];
          v59 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
          unsigned int v60 = [v59 numCharacteristicsLeftToRead];
          *(_DWORD *)buf = 138413058;
          v80 = v11;
          __int16 v81 = 1024;
          int v82 = v74;
          __int16 v83 = 1024;
          unsigned int v84 = v58;
          __int16 v85 = 1024;
          unsigned int v86 = v60;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Read %d unique configs from this multi-config characteristic. %d unique configs so far. %d characteristics left to read", buf, 0x1Eu);
        }
        int v51 = 0;
        goto LABEL_54;
      }
      unsigned int v52 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v80 = v11;
        __int16 v81 = 1024;
        int v82 = v44;
        __int16 v83 = 1024;
        unsigned int v84 = v73;
        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Did not consume all bytes", buf, 0x18u);
      }
    }
LABEL_53:
    __int16 v55 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction", -5882, 0, v70 code userInfo];
    [(NIServerAccessoryGATTServiceManager *)self _peer:v11 didFailWithError:v55];
    int v51 = 1;
LABEL_54:

    id v50 = v72;
    goto LABEL_55;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100417B2C();
  }
  id v50 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5882 userInfo:0];
  [(NIServerAccessoryGATTServiceManager *)self _peer:v11 didFailWithError:v50];
  int v51 = 1;
LABEL_55:

  if (__p)
  {
    v78 = __p;
    operator delete(__p);
  }
  if (!v51)
  {
LABEL_58:
    v63 = -[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", v11, v70);
    BOOL v64 = [v63 numCharacteristicsLeftToRead] == 0;

    if (v64)
    {
      v65 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
      [v65 changeConnectionState:6];

      v66 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
      v67 = [v66 cachedConfigCharacteristics];
      [v67 removeAllObjects];

      v68 = [(NSMutableDictionary *)self->_peerDevices objectForKeyedSubscript:v11];
      v69 = [v68 listeners];
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_1001B033C;
      v75[3] = &unk_100856CF0;
      v75[4] = self;
      id v76 = v11;
      [v69 enumerateObjectsUsingBlock:v75];
    }
  }
LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevices, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_cbManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end