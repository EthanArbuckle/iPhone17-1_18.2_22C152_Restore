@interface EPSagaTransactionPairing
- (BOOL)alreadyPaired;
- (BOOL)calledReadyToPair;
- (BOOL)classCPaired;
- (BOOL)classDPaired;
- (BOOL)isReadingCharacteristic;
- (BOOL)registeredForPairingNotification;
- (BOOL)startedPairing;
- (BOOL)watchReadFirstTime;
- (EPAdvertiser)advertiser;
- (EPDiscoverer)discoverer;
- (EPFactory)factory;
- (EPKey)sharedKey;
- (EPMassUnpairer)unpairer;
- (EPOOBKeyGenerator)oobKeyGenerator;
- (EPPeripheralConnector)connector;
- (EPPeripheralConnectorManager)connectorManager;
- (EPResourceManager)fakePipeManager;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPSagaServiceOOBStash)oobKeyStash;
- (EPSagaTransactionPairing)init;
- (EPServiceRegistry)serviceRegistry;
- (EPTransactionDelegate)delegate;
- (NSMutableArray)migrationReadResponseBlocks;
- (NSMutableSet)pairers;
- (NSMutableSet)pairingDevices;
- (NSMutableSet)readers;
- (NSString)advertisingName;
- (NSTimer)globalTimer;
- (NSTimer)pairingTimer;
- (NSUUID)expectedIncomingPairingUUID;
- (id)findPairingReaderEntryWithPairer:(id)a3 andRemove:(BOOL)a4;
- (id)findPairingReaderEntryWithReader:(id)a3 andRemove:(BOOL)a4;
- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4;
- (unint64_t)state;
- (void)advertiser:(id)a3 deviceDidAppear:(id)a4;
- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)characteristicReader:(id)a3 didFailWithError:(id)a4;
- (void)characteristicReader:(id)a3 didRead:(id)a4;
- (void)checkIfIDSPaired;
- (void)connectUp:(id)a3;
- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4;
- (void)failWithError:(id)a3;
- (void)migrationBTPairingTimeout:(id)a3;
- (void)pairer:(id)a3 completedWithError:(id)a4;
- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5;
- (void)registerForPairingNotificationCompletion:(id)a3;
- (void)setAdvertiser:(id)a3;
- (void)setAdvertisingName:(id)a3;
- (void)setCalledReadyToPair:(BOOL)a3;
- (void)setClassCPaired:(BOOL)a3;
- (void)setClassDPaired:(BOOL)a3;
- (void)setConnector:(id)a3;
- (void)setConnectorManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverer:(id)a3;
- (void)setExpectedIncomingPairingUUID:(id)a3;
- (void)setFactory:(id)a3;
- (void)setFakePipeManager:(id)a3;
- (void)setGlobalTimer:(id)a3;
- (void)setMigrationReadResponseBlocks:(id)a3;
- (void)setOobKeyGenerator:(id)a3;
- (void)setOobKeyStash:(id)a3;
- (void)setPairers:(id)a3;
- (void)setPairingDevices:(id)a3;
- (void)setPairingTimer:(id)a3;
- (void)setReaders:(id)a3;
- (void)setRegisteredForPairingNotification:(BOOL)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setSharedKey:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUnpairer:(id)a3;
- (void)setWatchReadFirstTime:(BOOL)a3;
- (void)timedOut;
- (void)timeout:(id)a3;
- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4;
- (void)unregisterForPairingNotification;
- (void)update;
- (void)updateAdvertisingName;
@end

@implementation EPSagaTransactionPairing

- (EPSagaTransactionPairing)init
{
  v11.receiver = self;
  v11.super_class = (Class)EPSagaTransactionPairing;
  v2 = [(EPSagaTransactionPairing *)&v11 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(EPSagaTransactionPairing *)v2 setMigrationReadResponseBlocks:v3];

    v4 = +[NSMutableSet set];
    [(EPSagaTransactionPairing *)v2 setReaders:v4];

    v5 = +[NSMutableSet set];
    [(EPSagaTransactionPairing *)v2 setPairers:v5];

    v6 = +[NSMutableSet set];
    [(EPSagaTransactionPairing *)v2 setPairingDevices:v6];

    v7 = [EPNullResourceManager alloc];
    v8 = +[EPFactory queue];
    v9 = [(EPResourceManager *)v7 initWithQueue:v8];
    [(EPSagaTransactionPairing *)v2 setFakePipeManager:v9];
  }
  return v2;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(EPSagaTransactionPairing *)self setServiceRegistry:v6];
  v8 = [v6 serviceFromClass:objc_opt_class()];
  [(EPSagaTransactionPairing *)self setFactory:v8];

  v9 = [v6 serviceFromClass:objc_opt_class()];

  [(EPSagaTransactionPairing *)self setOobKeyStash:v9];
  [(EPSagaTransactionPairing *)self setRoutingSlipEntry:v7];

  [(EPSagaTransactionPairing *)self updateAdvertisingName];
  v10 = sub_1000A3CF0();
  LODWORD(v6) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    objc_super v11 = sub_1000A3CF0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = 0x404E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairing: Setting transaction timeout of %1.0f seconds", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E37F4;
  v12[3] = &unk_100166120;
  v12[4] = self;
  v12[5] = 0x404E000000000000;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v12);
  [(EPSagaTransactionPairing *)self setState:1];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(EPSagaTransactionPairing *)self setServiceRegistry:v6];
  v8 = [v6 serviceFromClass:objc_opt_class()];

  [(EPSagaTransactionPairing *)self setFactory:v8];
  [(EPSagaTransactionPairing *)self setRoutingSlipEntry:v7];

  [(EPSagaTransactionPairing *)self setState:3];
}

- (void)updateAdvertisingName
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ShouldNotDiscoverWithName", @"com.apple.nanoregistryd", 0);
  uint64_t v4 = 0;
  if (!AppBooleanValue)
  {
    if (CFPreferencesGetAppBooleanValue(@"IDSAdvertiseMigrationWithNameEnabled", @"com.apple.nanoregistryd", 0))
    {
      uint64_t v4 = sub_1000E39C0();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  id v5 = (id)v4;
  [(EPSagaTransactionPairing *)self setAdvertisingName:v4];
}

- (void)setAdvertisingName:(id)a3
{
  id v5 = a3;
  advertisingName = self->_advertisingName;
  id v8 = v5;
  if (v5 && !advertisingName
    || advertisingName && ([(NSString *)advertisingName isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_advertisingName, a3);
    id v7 = [(EPSagaTransactionPairing *)self factory];
    [v7 setAdvertisingName:v8];
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    id v5 = sub_1000A3CF0();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = sub_1000A3CF0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t state = self->_state;
        *(_DWORD *)buf = 67109376;
        int v20 = state;
        __int16 v21 = 1024;
        int v22 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Changing EPSagaTransactionPairing state from %d -> %d", buf, 0xEu);
      }
    }
    self->_unint64_t state = a3;
    if (a3 == 1)
    {
      [(EPSagaTransactionPairing *)self update];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000E3CEC;
      block[3] = &unk_1001655F8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      if (a3 != 2)
      {
        v9 = [(EPSagaTransactionPairing *)self pairers];
        [v9 removeAllObjects];

        v10 = [(EPSagaTransactionPairing *)self pairingDevices];
        [v10 removeAllObjects];
      }
      unpairer = self->_unpairer;
      self->_unpairer = 0;

      discoverer = self->_discoverer;
      self->_discoverer = 0;

      sharedKey = self->_sharedKey;
      self->_sharedKey = 0;

      if (a3 == 3 || !a3)
      {
        advertiser = self->_advertiser;
        self->_advertiser = 0;

        v15 = [(EPSagaTransactionPairing *)self pairers];
        [v15 removeAllObjects];

        v16 = [(EPSagaTransactionPairing *)self pairingDevices];
        [v16 removeAllObjects];

        [(EPSagaTransactionPairing *)self setConnector:0];
        [(EPSagaTransactionPairing *)self setConnectorManager:0];
      }
      [(EPSagaTransactionPairing *)self update];
      if ((a3 | 2) == 2)
      {
        v17 = [(EPSagaTransactionPairing *)self delegate];
        [v17 transactionDidComplete:self];
      }
    }
  }
}

- (void)registerForPairingNotificationCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_registeredForPairingNotification)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    BOOL v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E3E48;
    v7[3] = &unk_100166210;
    v7[4] = self;
    id v8 = v5;
    [v6 initializeAllIDSChannelsBlock:v7];
  }
}

- (void)unregisterForPairingNotification
{
  if (self->_registeredForPairingNotification)
  {
    self->_registeredForPairingNotification = 0;
    v3 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v3 removeConnectivityObserver:self];
    id v4 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];

    [v4 removeConnectivityObserver:self];
  }
}

- (void)checkIfIDSPaired
{
  v3 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  id v12 = [v3 objectForKeyedSubscript:@"newlyPairedCoreBluetoothID"];

  id v4 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  id v5 = [v4 defaultPairedDevice];
  BOOL v6 = [v5 nsuuid];
  unsigned int v7 = [v12 isEqual:v6];

  if (v7) {
    self->_classCPaired = 1;
  }
  id v8 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];

  v9 = [v8 defaultPairedDevice];
  v10 = [v9 nsuuid];
  unsigned int v11 = [v12 isEqual:v10];

  if (v11) {
    self->_classDPaired = 1;
  }
  if (self->_classCPaired && self->_classDPaired)
  {
    [(EPSagaTransactionPairing *)self unregisterForPairingNotification];
    [(EPSagaTransactionPairing *)self setState:2];
  }
}

- (void)update
{
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E42C0;
    v8[3] = &unk_1001655F8;
    v8[4] = self;
    [(EPSagaTransactionPairing *)self registerForPairingNotificationCompletion:v8];
  }
  else if ((id)[(EPSagaTransactionPairing *)self state] == (id)3)
  {
    v3 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    id v7 = [v3 objectForKeyedSubscript:@"newlyPairedCoreBluetoothID"];

    if (v7)
    {
      if (!self->_unpairer)
      {
        id v4 = [EPMassUnpairer alloc];
        id v5 = +[NSSet setWithObject:v7];
        BOOL v6 = [(EPMassUnpairer *)v4 initWithDelegate:self UUIDs:v5];
        [(EPSagaTransactionPairing *)self setUnpairer:v6];
      }
    }
    else
    {
      [(EPSagaTransactionPairing *)self setState:0];
    }
  }
}

- (void)connectUp:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    BOOL v6 = [v5 objectForKeyedSubscript:@"iAmACompanionDevice"];

    if ([v6 BOOLValue])
    {
      id v7 = [(EPSagaTransactionPairing *)self connector];

      if (!v7)
      {
        id v8 = [(EPSagaTransactionPairing *)self connectorManager];

        if (!v8)
        {
          v9 = +[EPPeripheralConnectorManagerFactory sharedConnectorManagerFactory];
          v10 = [v9 connectorManagerWithUuid:v13];
          [(EPSagaTransactionPairing *)self setConnectorManager:v10];
        }
        unsigned int v11 = [(EPSagaTransactionPairing *)self connectorManager];
        id v12 = [v11 newResourceWithDelegate:self];
        [(EPSagaTransactionPairing *)self setConnector:v12];
      }
    }

    id v4 = v13;
  }
}

- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  id v7 = [v6 objectForKeyedSubscript:@"newlyPairedCoreBluetoothID"];

  if ((id)[(EPSagaTransactionPairing *)self state] == (id)3)
  {
    if (v7 && ([v5 containsObject:v7] & 1) == 0)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v10 = [v7 UUIDString];
      unsigned int v11 = +[NSString stringWithFormat:@"Bluetooth was not able to unpair device %@ during rollback", v10];
      v18 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v13 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:4 userInfo:v12];

      uint64_t v14 = [(EPSagaTransactionPairing *)self routingSlipEntry];
      v15 = [v14 errors];
      [v15 addObject:v13];
    }
    else
    {
      id v8 = [(EPSagaTransactionPairing *)self routingSlipEntry];
      v9 = [v8 operands];
      [v9 removeObjectForKey:@"newlyPairedCoreBluetoothID"];
    }
    v16 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    [v16 persist];

    [(EPSagaTransactionPairing *)self setState:0];
  }
}

- (void)advertiser:(id)a3 deviceDidAppear:(id)a4
{
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    [(EPSagaTransactionPairing *)self update];
  }
}

- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (CFPreferencesGetAppBooleanValue(@"migrationShouldIgnoreBTPairingRequest", @"com.apple.nanoregistryd", 0))
  {
    id v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairing: ************* Debug/Test Mode! Ignoring Bluetooth Pairing Requests!", buf, 2u);
      }
    }
  }
  else
  {
    *(void *)buf = 0;
    v19 = buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000E515C;
    v17[3] = &unk_100165840;
    v17[4] = self;
    v17[5] = buf;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v17);
    if (![(EPSagaTransactionPairing *)self startedPairing] && v19[24])
    {
      unsigned int v11 = [(EPSagaTransactionPairing *)self routingSlipEntry];
      id v12 = [v11 objectForKeyedSubscript:@"iAmACompanionDevice"];

      if (([v12 BOOLValue] & 1) == 0)
      {
        id v13 = [v7 newPairerWithDelegate:self];
        if (v13)
        {
          uint64_t v14 = [(EPSagaTransactionPairing *)self pairers];
          [v14 addObject:v13];

          v15 = [(EPSagaTransactionPairing *)self pairingDevices];
          v16 = [v13 device];
          [v15 addObject:v16];
        }
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)alreadyPaired
{
  v2 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  v3 = [v2 objectForKeyedSubscript:@"newlyPairedCoreBluetoothID"];

  return v3 != 0;
}

- (BOOL)startedPairing
{
  if ([(EPSagaTransactionPairing *)self alreadyPaired]) {
    return 1;
  }
  id v4 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  id v5 = [v4 objectForKeyedSubscript:@"iAmACompanionDevice"];

  if ([v5 BOOLValue])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = self->_readers;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) pairer:v14];

          if (v11)
          {

            BOOL v3 = 1;
            goto LABEL_15;
          }
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v3 = 0;
  }
  else
  {
    id v12 = [(EPSagaTransactionPairing *)self pairers];
    BOOL v3 = [v12 count] != 0;
  }
LABEL_15:

  return v3;
}

- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    id v8 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"newlyPairedCoreBluetoothID"];

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000E567C;
    v24[3] = &unk_100165840;
    v24[4] = self;
    v24[5] = &v25;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v24);
    if (!*((unsigned char *)v26 + 24) || v9) {
      goto LABEL_11;
    }
    v10 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    unsigned int v11 = [v10 objectForKeyedSubscript:@"discoverableCoreBluetoothID"];

    id v12 = [v7 uuid];
    if ([v12 isEqual:v11])
    {
    }
    else
    {
      id v13 = [(EPSagaTransactionPairing *)self advertisingName];
      if (!v13)
      {
LABEL_9:

        goto LABEL_10;
      }
      long long v14 = [(EPSagaTransactionPairing *)self advertisingName];
      long long v15 = [v7 name];
      unsigned int v16 = [v14 isEqual:v15];

      if (!v16)
      {
LABEL_10:

LABEL_11:
        _Block_object_dispose(&v25, 8);

        goto LABEL_12;
      }
    }
    long long v17 = [v7 uuid];
    [(EPSagaTransactionPairing *)self connectUp:v17];

    id v12 = [v7 newObserverWithDelegate:0];
    v18 = [EPCharacteristicReader alloc];
    v19 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
    uint64_t v20 = +[CBUUID UUIDWithString:@"889DBEA2-6C42-4B56-A453-8EAB0976D184"];
    char v21 = [(EPCharacteristicReader *)v18 initWithDelegate:self timeout:v12 peripheral:v19 serviceUUID:v20 characteristicUUID:70.0];

    int v22 = objc_opt_new();
    [v22 setReader:v21];
    [v22 setDevice:v7];
    [(NSMutableSet *)self->_readers addObject:v22];
    discoverer = self->_discoverer;
    self->_discoverer = 0;

    goto LABEL_9;
  }
LABEL_12:
}

- (void)characteristicReader:(id)a3 didRead:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    uint64_t v8 = [(EPSagaTransactionPairing *)self findPairingReaderEntryWithReader:v6 andRemove:0];
    uint64_t v9 = (void *)v8;
    if (!v7 || !v8)
    {
      int v22 = sub_1000A3CF0();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        if (!v23)
        {
          char v21 = v7;
LABEL_45:

          goto LABEL_46;
        }
        v10 = sub_1000A3CF0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000FC998();
        }
        char v21 = v7;
      }
      else
      {
        if (v23)
        {
          char v28 = sub_1000A3CF0();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_1000FC9CC();
          }
        }
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        CFStringRef v49 = @"Reader read no data";
        v29 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        v10 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:10 userInfo:v29];

        [(EPSagaTransactionPairing *)self failWithError:v10];
        char v21 = 0;
      }
LABEL_44:

      goto LABEL_45;
    }
    v10 = [(EPKey *)self->_sharedKey decryptPayload:v7];
    if (!v10)
    {
      v24 = sub_1000A3CF0();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        v26 = sub_1000A3CF0();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000FC930();
        }
      }
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      CFStringRef v51 = @"Could not decrypt payload";
      uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      long long v14 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:6 userInfo:v27];

      [(EPSagaTransactionPairing *)self failWithError:v14];
      char v21 = v7;
      goto LABEL_43;
    }
    [(NSMutableSet *)self->_readers removeAllObjects];
    [(NSMutableSet *)self->_readers addObject:v9];
    if (!self->_watchReadFirstTime)
    {
      self->_watchReadFirstTime = 1;
      [(EPSagaTransactionPairing *)self updateAdvertisingName];
      unsigned int v11 = sub_1000A3CF0();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        id v13 = sub_1000A3CF0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v55 = 0x4056C00000000000;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairing: First read received from watch, resetting transaction timeout of %1.0f seconds", buf, 0xCu);
        }
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000E5DFC;
      block[3] = &unk_1001655F8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    }
    long long v14 = [[NRPBBTMigrationOOBRead alloc] initWithData:v10];
    if (sub_1000DEE3C((uint64_t)v14))
    {
      if (sub_1000DEE50((BOOL)v14)) {
        uint64_t v15 = 8;
      }
      else {
        uint64_t v15 = 7;
      }
      v52[0] = NSLocalizedDescriptionKey;
      if (sub_1000DEE50((BOOL)v14)) {
        CFStringRef v16 = @"Watch returned FATAL error code";
      }
      else {
        CFStringRef v16 = @"Watch returned error code";
      }
      v52[1] = @"watchErrorCode";
      v53[0] = v16;
      long long v17 = +[NSNumber numberWithInt:sub_1000DEE3C((uint64_t)v14)];
      v53[1] = v17;
      v18 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
      id v19 = [v18 mutableCopy];

      uint64_t v20 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:v15 userInfo:v19];
      [(EPSagaTransactionPairing *)self failWithError:v20];
      char v21 = v7;
      goto LABEL_42;
    }
    v30 = [v9 device];
    id v19 = [v30 newObserverWithDelegate:0];

    v31 = [EPCharacteristicWriter alloc];
    v32 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
    v33 = +[CBUUID UUIDWithString:@"35646DF5-E240-4355-8A8D-41271B5C4562"];
    uint64_t v20 = [(EPCharacteristicWriter *)v31 initWithPeripheral:v19 serviceUUID:v32 characteristicUUID:v33];

    [v9 setReader:0];
    v42 = objc_opt_new();
    v34 = sub_1000DEE28((uint64_t)v14);
    sub_1000736B8((uint64_t)v42, v34);

    v41 = (void *)MGCopyAnswer();
    if (v41)
    {
      sharedKey = self->_sharedKey;
      v36 = [v41 dataUsingEncoding:4];
      v37 = [(EPKey *)sharedKey encryptPayload:v36];
      sub_1000736D0((uint64_t)v42, v37);
    }
    char v21 = [v42 data];

    if (v21)
    {
      v38 = [(EPKey *)self->_sharedKey encryptPayload:v21];
      objc_initWeak((id *)buf, self);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000E5E90;
      v43[3] = &unk_100165F78;
      v43[4] = self;
      objc_copyWeak(&v46, (id *)buf);
      id v44 = v9;
      v45 = v14;
      [(EPCharacteristicWriter *)v20 writeData:v38 timeout:&stru_100169CB0 begin:v43 completion:65.0];

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v39 = sub_1000A3CF0();
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

      if (!v40) {
        goto LABEL_41;
      }
      v38 = sub_1000A3CF0();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1000FC964();
      }
    }

LABEL_41:
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  char v21 = v7;
LABEL_46:
}

- (void)characteristicReader:(id)a3 didFailWithError:(id)a4
{
}

- (id)findPairingReaderEntryWithReader:(id)a3 andRemove:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_readers;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 reader:v17];
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          id v14 = v12;

          if (v14) {
            BOOL v15 = !v4;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [(NSMutableSet *)self->_readers removeObject:v14];
          }
          goto LABEL_15;
        }
      }
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_15:

  return v14;
}

- (id)findPairingReaderEntryWithPairer:(id)a3 andRemove:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_readers;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 pairer:v17];
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          id v14 = v12;

          if (v14) {
            BOOL v15 = !v4;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [(NSMutableSet *)self->_readers removeObject:v14];
          }
          goto LABEL_15;
        }
      }
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_15:

  return v14;
}

- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4
{
  id v5 = a4;
  id v6 = [(EPSagaTransactionPairing *)self fakePipeManager];
  id v7 = [v6 newResourceWithDelegate:v5];

  return v7;
}

- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    uint64_t v10 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    unsigned int v11 = [v10 objectForKeyedSubscript:@"iAmACompanionDevice"];

    unsigned int v12 = [v11 BOOLValue];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E6858;
    block[3] = &unk_100165840;
    block[4] = self;
    void block[5] = &v37;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    if (a4 == 5)
    {
      if (!*((unsigned char *)v38 + 24) || [(EPSagaTransactionPairing *)self alreadyPaired]) {
        goto LABEL_18;
      }
      if (v12)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v13 = self->_readers;
        id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v32 objects:v47 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v33;
LABEL_8:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
            [v17 pairer:v32];
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v19 = v18 == v8;

            if (v19) {
              break;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v32 objects:v47 count:16];
              if (v14) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          p_super = v17;

          if (!p_super) {
            goto LABEL_18;
          }
          v26 = [p_super oobKey];
          uint64_t v27 = [(EPSagaTransactionPairing *)self oobKeyStash];
          [v27 setOobKey:v26];

          uint64_t v45 = CBPairingAgentPairingDataOOBTKKey;
          char v28 = [p_super oobKey];
          id v46 = v28;
          v29 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          [v8 respondWithType:5 accept:1 data:v29];
        }
        else
        {
LABEL_14:
          p_super = &v13->super.super;
        }
      }
      else
      {
        int v22 = [(EPSagaTransactionPairing *)self oobKeyStash];
        BOOL v23 = [v22 oobKey];

        if (v23)
        {
          uint64_t v43 = CBPairingAgentPairingDataOOBTKKey;
          p_super = [(EPSagaTransactionPairing *)self oobKeyStash];
          v24 = [p_super oobKey];
          id v44 = v24;
          BOOL v25 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          [v8 respondWithType:5 accept:1 data:v25];
        }
        else
        {
          v30 = sub_1000A3CF0();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

          if (!v31) {
            goto LABEL_18;
          }
          p_super = sub_1000A3CF0();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            sub_1000FCA78();
          }
        }
      }
    }
    else
    {
      if ((unint64_t)(a4 - 1) > 1)
      {
LABEL_18:
        _Block_object_dispose(&v37, 8);

        goto LABEL_19;
      }
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"Wrong Bluetooth pairing type received";
      p_super = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      char v21 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:5 userInfo:p_super];
      [v8 invalidateWithError:v21];
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)pairer:(id)a3 completedWithError:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    id v7 = [(EPSagaTransactionPairing *)self routingSlipEntry];
    id v8 = [v7 objectForKeyedSubscript:@"iAmACompanionDevice"];

    if ([v8 BOOLValue]) {
      id v9 = [(EPSagaTransactionPairing *)self findPairingReaderEntryWithPairer:v25 andRemove:1];
    }
    pairers = self->_pairers;
    if (v6)
    {
      [(NSMutableSet *)pairers removeObject:v25];
      pairingDevices = self->_pairingDevices;
      unsigned int v12 = [v25 device];
      [(NSMutableSet *)pairingDevices removeObject:v12];

      id v13 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
      [v13 addObject:v6];

      [(EPRoutingSlipEntry *)self->_routingSlipEntry persist];
      [(EPSagaTransactionPairing *)self setState:3];
    }
    else
    {
      [(NSMutableSet *)pairers addObject:v25];
      id v14 = self->_pairingDevices;
      uint64_t v15 = [v25 device];
      [(NSMutableSet *)v14 addObject:v15];

      uint64_t v16 = [EPSagaOperandUUID alloc];
      long long v17 = [v25 device];
      id v18 = [v17 uuid];
      BOOL v19 = [(EPSagaOperandUUID *)v16 initWithUUID:v18];

      long long v20 = [(EPSagaTransactionPairing *)self routingSlipEntry];
      char v21 = [v20 operands];
      [v21 setObject:v19 forKeyedSubscript:@"newlyPairedCoreBluetoothID"];

      int v22 = [(EPSagaTransactionPairing *)self routingSlipEntry];
      [v22 persist];

      BOOL v23 = [v25 device];
      v24 = [v23 pairingConnector];
      [(EPSagaTransactionPairing *)self setConnector:v24];

      [(EPSagaTransactionPairing *)self setState:2];
    }
  }
}

- (void)timeout:(id)a3
{
  BOOL v4 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  id v5 = [v4 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6B78;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)migrationBTPairingTimeout:(id)a3
{
  BOOL v4 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  id v5 = [v4 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6C20;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)timedOut
{
  BOOL v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FCAAC();
    }
  }
  if ([(EPSagaTransactionPairing *)self isReadingCharacteristic]
    && (id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Timeout discovering characteristics";
    id v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v7 = 9;
  }
  else
  {
    BOOL v8 = (id)[(EPSagaTransactionPairing *)self state] != (id)1;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Timeout";
    id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v7 = v8;
  }
  id v9 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairing" code:v7 userInfo:v6];

  [(EPSagaTransactionPairing *)self failWithError:v9];
}

- (BOOL)isReadingCharacteristic
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(EPSagaTransactionPairing *)self readers];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 reader];
        if (v7)
        {
          BOOL v8 = (void *)v7;
          id v9 = [v6 reader];
          NSErrorUserInfoKey v10 = [v9 readData];

          if (!v10)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    uint64_t v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FCAE0((uint64_t)v4, v7);
    }
  }
  BOOL v8 = [(EPSagaTransactionPairing *)self factory];
  [v8 setAdvertiserNotAvailableToPair:1];

  id v9 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  NSErrorUserInfoKey v10 = [v9 errors];
  [v10 addObject:v4];

  CFStringRef v11 = [(EPSagaTransactionPairing *)self routingSlipEntry];
  [v11 persist];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = [(EPSagaTransactionPairing *)self pairers];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) invalidateWithError:v4];
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  long long v17 = [(EPSagaTransactionPairing *)self pairers];
  [v17 removeAllObjects];

  id v18 = [(EPSagaTransactionPairing *)self pairingDevices];
  [v18 removeAllObjects];

  BOOL v19 = [(EPSagaTransactionPairing *)self oobKeyStash];
  [v19 clearOOBKey];

  if ((id)[(EPSagaTransactionPairing *)self state] == (id)1)
  {
    uint64_t v20 = 3;
LABEL_16:
    [(EPSagaTransactionPairing *)self setState:v20];
    goto LABEL_17;
  }
  if ((id)[(EPSagaTransactionPairing *)self state] == (id)3)
  {
    uint64_t v20 = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  return self->_routingSlipEntry;
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (EPFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
}

- (EPOOBKeyGenerator)oobKeyGenerator
{
  return self->_oobKeyGenerator;
}

- (void)setOobKeyGenerator:(id)a3
{
}

- (EPDiscoverer)discoverer
{
  return self->_discoverer;
}

- (void)setDiscoverer:(id)a3
{
}

- (EPSagaServiceOOBStash)oobKeyStash
{
  return self->_oobKeyStash;
}

- (void)setOobKeyStash:(id)a3
{
}

- (NSTimer)globalTimer
{
  return self->_globalTimer;
}

- (void)setGlobalTimer:(id)a3
{
}

- (EPMassUnpairer)unpairer
{
  return self->_unpairer;
}

- (void)setUnpairer:(id)a3
{
}

- (EPPeripheralConnectorManager)connectorManager
{
  return self->_connectorManager;
}

- (void)setConnectorManager:(id)a3
{
}

- (EPPeripheralConnector)connector
{
  return self->_connector;
}

- (void)setConnector:(id)a3
{
}

- (EPResourceManager)fakePipeManager
{
  return self->_fakePipeManager;
}

- (void)setFakePipeManager:(id)a3
{
}

- (EPAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
}

- (NSTimer)pairingTimer
{
  return self->_pairingTimer;
}

- (void)setPairingTimer:(id)a3
{
}

- (NSMutableArray)migrationReadResponseBlocks
{
  return self->_migrationReadResponseBlocks;
}

- (void)setMigrationReadResponseBlocks:(id)a3
{
}

- (NSUUID)expectedIncomingPairingUUID
{
  return self->_expectedIncomingPairingUUID;
}

- (void)setExpectedIncomingPairingUUID:(id)a3
{
}

- (EPKey)sharedKey
{
  return self->_sharedKey;
}

- (void)setSharedKey:(id)a3
{
}

- (NSMutableSet)readers
{
  return self->_readers;
}

- (void)setReaders:(id)a3
{
}

- (NSMutableSet)pairers
{
  return self->_pairers;
}

- (void)setPairers:(id)a3
{
}

- (NSMutableSet)pairingDevices
{
  return self->_pairingDevices;
}

- (void)setPairingDevices:(id)a3
{
}

- (NSString)advertisingName
{
  return self->_advertisingName;
}

- (BOOL)calledReadyToPair
{
  return self->_calledReadyToPair;
}

- (void)setCalledReadyToPair:(BOOL)a3
{
  self->_calledReadyToPair = a3;
}

- (BOOL)watchReadFirstTime
{
  return self->_watchReadFirstTime;
}

- (void)setWatchReadFirstTime:(BOOL)a3
{
  self->_watchReadFirstTime = a3;
}

- (BOOL)registeredForPairingNotification
{
  return self->_registeredForPairingNotification;
}

- (void)setRegisteredForPairingNotification:(BOOL)a3
{
  self->_registeredForPairingNotification = a3;
}

- (BOOL)classCPaired
{
  return self->_classCPaired;
}

- (void)setClassCPaired:(BOOL)a3
{
  self->_classCPaired = a3;
}

- (BOOL)classDPaired
{
  return self->_classDPaired;
}

- (void)setClassDPaired:(BOOL)a3
{
  self->_classDPaired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingName, 0);
  objc_storeStrong((id *)&self->_pairingDevices, 0);
  objc_storeStrong((id *)&self->_pairers, 0);
  objc_storeStrong((id *)&self->_readers, 0);
  objc_storeStrong((id *)&self->_sharedKey, 0);
  objc_storeStrong((id *)&self->_expectedIncomingPairingUUID, 0);
  objc_storeStrong((id *)&self->_migrationReadResponseBlocks, 0);
  objc_storeStrong((id *)&self->_pairingTimer, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_fakePipeManager, 0);
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_connectorManager, 0);
  objc_storeStrong((id *)&self->_unpairer, 0);
  objc_storeStrong((id *)&self->_globalTimer, 0);
  objc_storeStrong((id *)&self->_oobKeyStash, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_oobKeyGenerator, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end