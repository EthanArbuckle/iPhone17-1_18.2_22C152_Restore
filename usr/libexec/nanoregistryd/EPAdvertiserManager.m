@interface EPAdvertiserManager
+ (Class)resourceClass;
- (BOOL)dontAdvertiseWithServiceUUID;
- (BOOL)notAvailableToPair;
- (EPAdvertiserManager)init;
- (NSDictionary)devicesDictionary;
- (NSString)name;
- (id)newAdvertiserWithDelegate:(id)a3;
- (unint64_t)advertisingRate;
- (void)addCharacteristic:(id)a3 encryptionRequired:(BOOL)a4 withReadHandler:(id)a5 writeHandler:(id)a6;
- (void)collection:(id)a3 deviceDidAppear:(id)a4;
- (void)collection:(id)a3 deviceDidDisappear:(id)a4;
- (void)collection:(id)a3 deviceInfoDidDealloc:(id)a4;
- (void)createResource;
- (void)destroyResource;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)removeCharacteristic:(id)a3;
- (void)setAdvertisingRate:(unint64_t)a3;
- (void)setDontAdvertiseWithServiceUUID:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNotAvailableToPair:(BOOL)a3;
- (void)update;
@end

@implementation EPAdvertiserManager

- (void)addCharacteristic:(id)a3 encryptionRequired:(BOOL)a4 withReadHandler:(id)a5 writeHandler:(id)a6
{
  BOOL v8 = a4;
  id v16 = a3;
  id v10 = a6;
  id v11 = a5;
  v12 = objc_opt_new();
  [v12 setCharacteristicUUID:v16];
  [v12 setEncryptionRequired:v8];
  [v12 setReadHandler:v11];

  [v12 setWriteHandler:v10];
  v13 = [(NSMutableDictionary *)self->_characteristics objectForKeyedSubscript:v16];
  if ([(EPResourceManager *)self referenceCounter])
  {
    if (v13)
    {
      v14 = [v13 characteristic];
      v15 = [v12 characteristic];
      if (([v14 isEqual:v15] & 1) == 0) {
        self->_shouldUpdateCharacteristics = 1;
      }
    }
    else
    {
      self->_shouldUpdateCharacteristics = 1;
    }
  }
  [(NSMutableDictionary *)self->_characteristics setObject:v12 forKeyedSubscript:v16];
  if (self->_shouldUpdateCharacteristics) {
    [(EPAdvertiserManager *)self update];
  }
}

- (void)removeCharacteristic:(id)a3
{
  characteristics = self->_characteristics;
  id v5 = a3;
  uint64_t v8 = [(NSMutableDictionary *)characteristics objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_characteristics removeObjectForKey:v5];

  id v6 = [(EPResourceManager *)self referenceCounter];
  uint64_t v7 = v8;
  if (v6 && v8)
  {
    self->_shouldUpdateCharacteristics = 1;
    id v6 = [(EPAdvertiserManager *)self update];
    uint64_t v7 = v8;
  }

  _objc_release_x1(v6, v7);
}

- (NSDictionary)devicesDictionary
{
  return (NSDictionary *)[(EPDeviceCollection *)self->_deviceCollection devicesDictionary];
}

- (EPAdvertiserManager)init
{
  v3 = +[EPFactory queue];
  v13.receiver = self;
  v13.super_class = (Class)EPAdvertiserManager;
  v4 = [(EPResourceManager *)&v13 initWithQueue:v3];

  if (v4)
  {
    id v5 = [[EPDeviceCollection alloc] initWithDelegate:v4];
    deviceCollection = v4->_deviceCollection;
    v4->_deviceCollection = v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    characteristics = v4->_characteristics;
    v4->_characteristics = (NSMutableDictionary *)v7;

    v4->_advertisingRate = 1;
    v9 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100081E3C;
    block[3] = &unk_1001655F8;
    v12 = v4;
    dispatch_async(v9, block);
  }
  return v4;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (void)createResource
{
  v11.receiver = self;
  v11.super_class = (Class)EPAdvertiserManager;
  [(EPResourceManager *)&v11 createResource];
  v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPAdvertiserManager: Create peripheral", v10, 2u);
    }
  }
  id v6 = +[EPFactory sharedFactory];
  uint64_t v7 = [v6 agentManager];
  uint64_t v8 = (EPPeripheralManager *)[v7 newPeripheralManagerWithDelegate:self];
  peripheral = self->_peripheral;
  self->_peripheral = v8;

  [(EPAdvertiserManager *)self update];
}

- (void)destroyResource
{
  v14.receiver = self;
  v14.super_class = (Class)EPAdvertiserManager;
  [(EPResourceManager *)&v14 destroyResource];
  if (self->_isAdvertising) {
    self->_isAdvertising = 0;
  }
  if ((id)[(EPResource *)self->_peripheral availability] == (id)1)
  {
    v3 = sub_1000A3BC0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = sub_1000A3BC0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager stopAdvertising (resource not needed)", v13, 2u);
      }
    }
    id v6 = [(EPPeripheralManager *)self->_peripheral manager];
    [v6 stopAdvertising];
  }
  uint64_t v7 = sub_1000A3BC0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = sub_1000A3BC0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPAdvertiserManager: Destroy peripheral", v13, 2u);
    }
  }
  peripheral = self->_peripheral;
  self->_peripheral = 0;

  agent = self->_agent;
  self->_agent = 0;

  self->_waitingForServiceToBeAdded = 0;
  self->_serviceAdded = 0;
  key = self->_key;
  self->_key = 0;

  self->_waitingForAdvertisingToStart = 0;
  [(EPAdvertiserManager *)self update];
}

- (id)newAdvertiserWithDelegate:(id)a3
{
  id v4 = [(EPResourceManager *)self newResourceWithDelegate:a3];
  id v5 = +[EPFactory queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000821CC;
  v10[3] = &unk_100165530;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(v5, v10);

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)setName:(id)a3
{
  id v5 = (NSString *)a3;
  name = self->_name;
  if (name != v5)
  {
    uint64_t v7 = v5;
    name = (NSString *)[(NSString *)name isEqualToString:v5];
    id v5 = v7;
    if ((name & 1) == 0)
    {
      objc_storeStrong((id *)&self->_name, a3);
      name = (NSString *)[(EPAdvertiserManager *)self update];
      id v5 = v7;
    }
  }

  _objc_release_x1(name, v5);
}

- (void)setAdvertisingRate:(unint64_t)a3
{
  if (self->_advertisingRate != a3)
  {
    self->_advertisingRate = a3;
    [(EPAdvertiserManager *)self update];
  }
}

- (void)setNotAvailableToPair:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000A3BC0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = sub_1000A3BC0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set not available to pair to: %{BOOL}d", buf, 8u);
    }
  }
  self->_notAvailableToPair = v3;
  id v8 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000824FC;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)setDontAdvertiseWithServiceUUID:(BOOL)a3
{
  self->_dontAdvertiseWithServiceUUID = a3;
  id v4 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000825A0;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)update
{
  if (self->_shouldUpdateCharacteristics)
  {
    self->_shouldUpdateCharacteristics = 0;
    self->_waitingForServiceToBeAdded = 0;
    self->_serviceAdded = 0;
    [(EPResourceManager *)self setAvailability:0 withError:0];
    BOOL v3 = sub_1000A3BC0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = sub_1000A3BC0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager removeAllServices", buf, 2u);
      }
    }
    BOOL v6 = [(EPPeripheralManager *)self->_peripheral manager];
    [v6 removeAllServices];
  }
  name = self->_name;
  activeAdvertisingName = self->_activeAdvertisingName;
  if (activeAdvertisingName)
  {
    if (![(NSString *)activeAdvertisingName isEqual:name]) {
      goto LABEL_13;
    }
LABEL_11:
    if (self->_advertisingRate == self->_activeAdvertisingRate
      && self->_dontAdvertiseWithServiceUUID == self->_activeDontAdvertiseWithServiceUUID)
    {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (!name) {
    goto LABEL_11;
  }
LABEL_13:
  objc_storeStrong((id *)&self->_activeAdvertisingName, self->_name);
  self->_activeAdvertisingRate = self->_advertisingRate;
  self->_activeDontAdvertiseWithServiceUUID = self->_dontAdvertiseWithServiceUUID;
  if (self->_isAdvertising)
  {
    self->_isAdvertising = 0;
    self->_waitingForAdvertisingToStart = 0;
    if ((id)[(EPResource *)self->_peripheral availability] == (id)1)
    {
      v9 = sub_1000A3BC0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        BOOL v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager stopAdvertising (changing advertised name or advertising interval)", buf, 2u);
        }
      }
      [(EPResourceManager *)self setAvailability:0 withError:0];
      v12 = [(EPPeripheralManager *)self->_peripheral manager];
      [v12 stopAdvertising];
    }
  }
LABEL_20:
  if (!self->_peripheral || self->_notAvailableToPair)
  {
    objc_super v13 = sub_1000A3BC0();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14) {
      goto LABEL_34;
    }
    v15 = sub_1000A3BC0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL notAvailableToPair = self->_notAvailableToPair;
      peripheral = self->_peripheral;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v69 = notAvailableToPair;
      *(_WORD *)&v69[4] = 2112;
      *(void *)&v69[6] = peripheral;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "EPAdvertiser: Skipping creation of new agent. _BOOL notAvailableToPair = %{BOOL}d _peripheral = %@", buf, 0x12u);
    }
    goto LABEL_33;
  }
  if (!self->_agent)
  {
    v20 = +[EPFactory sharedFactory];
    v21 = [v20 agentManager];
    v22 = (EPPairingAgent *)[v21 newAgentWithDelegate:self fromCentral:0];
    agent = self->_agent;
    self->_agent = v22;

LABEL_30:
    goto LABEL_31;
  }
  v18 = sub_1000A3BC0();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    v20 = sub_1000A3BC0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "EPAdvertiser: Agent already created, skipping creating a new one", buf, 2u);
    }
    goto LABEL_30;
  }
LABEL_31:
  if (self->_key) {
    goto LABEL_34;
  }
  v15 = +[EPFactory sharedFactory];
  v24 = [v15 keyGeneratorManager];
  v25 = (EPOOBKeyGenerator *)[v24 newGeneratorWithDelegate:self];
  key = self->_key;
  self->_key = v25;

LABEL_33:
LABEL_34:
  if ((id)[(EPResource *)self->_peripheral availability] != (id)1)
  {
    self->_waitingForAdvertisingToStart = 0;
    self->_isAdvertising = 0;
    self->_waitingForServiceToBeAdded = 0;
    self->_serviceAdded = 0;
    [(EPResourceManager *)self setAvailability:0 withError:0];
    return;
  }
  uint64_t v61 = 168;
  if (self->_notAvailableToPair
    || (id)[(EPResource *)self->_agent availability] == (id)1
    && (self->_notAvailableToPair || (id)[(EPResource *)self->_key availability] == (id)1))
  {
    if (self->_serviceAdded) {
      goto LABEL_85;
    }
    if (!self->_waitingForServiceToBeAdded)
    {
      self->_waitingForServiceToBeAdded = 1;
      v34 = +[NSMutableArray array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v35 = [(NSMutableDictionary *)self->_characteristics allValues];
      id v36 = [v35 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v63;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v63 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = [*(id *)(*((void *)&v62 + 1) + 8 * i) characteristic:v61];
            if (v40) {
              [v34 addObject:v40];
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v62 objects:v67 count:16];
        }
        while (v37);
      }

      if (!self->_notAvailableToPair)
      {
        id v41 = objc_alloc((Class)CBMutableCharacteristic);
        v42 = +[CBUUID UUIDWithString:@"5F6C6A23-8AC8-400E-810B-017134943460"];
        id v43 = [v41 initWithType:v42 properties:26 value:0 permissions:3];

        [v34 addObject:v43];
      }
      id v44 = objc_alloc((Class)CBMutableService);
      v45 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
      id v46 = [v44 initWithType:v45 primary:1];

      [v46 setCharacteristics:v34];
      v47 = sub_1000A3BC0();
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

      if (v48)
      {
        v49 = sub_1000A3BC0();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v69 = v46;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager addService with %@", buf, 0xCu);
        }
      }
      v50 = [(EPPeripheralManager *)self->_peripheral manager];
      [v50 addService:v46];

      if (self->_serviceAdded)
      {
LABEL_85:
        if (!self->_isAdvertising && !self->_waitingForAdvertisingToStart)
        {
          self->_waitingForAdvertisingToStart = 1;
          v27 = [(EPAdvertiserManager *)self name];
          v28 = +[NSMutableDictionary dictionary];
          v29 = v28;
          if (v27) {
            [v28 setObject:v27 forKeyedSubscript:CBAdvertisementDataLocalNameKey];
          }
          if (!self->_notAvailableToPair && !self->_dontAdvertiseWithServiceUUID)
          {
            v30 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
            v66 = v30;
            v31 = +[NSArray arrayWithObjects:&v66 count:1];
            [v29 setObject:v31 forKeyedSubscript:CBAdvertisementDataServiceUUIDsKey];
          }
          uint64_t v32 = *(uint64_t *)((char *)&self->super.super.isa + (int)v61);
          if (v32 == 3)
          {
            v33 = &off_100176B98;
          }
          else
          {
            if (v32 != 2)
            {
LABEL_72:
              v51 = sub_1000A3BC0();
              BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);

              if (v52)
              {
                v53 = sub_1000A3BC0();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager stopAdvertising", buf, 2u);
                }
              }
              v54 = [(EPPeripheralManager *)self->_peripheral manager];
              [v54 stopAdvertising];

              v55 = sub_1000A3BC0();
              BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);

              if (v56)
              {
                v57 = sub_1000A3BC0();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v69 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager startAdvertising with parameters %@", buf, 0xCu);
                }
              }
              v58 = [(EPPeripheralManager *)self->_peripheral manager];
              [v58 startAdvertising:v29];

              goto LABEL_81;
            }
            v33 = &off_100176BB0;
          }
          [v29 setObject:v33 forKeyedSubscript:CBPeripheralManagerAdvertisingInterval];
          goto LABEL_72;
        }
      }
    }
  }
LABEL_81:
  if (self->_notAvailableToPair)
  {
    v59 = self->_agent;
    self->_agent = 0;

    v60 = self->_key;
    self->_key = 0;
  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v45;
    v35 = v40;
    *(void *)&long long v8 = 138543618;
    long long v34 = v8;
    uint64_t v36 = *(void *)v45;
    id v37 = v6;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_super v13 = [v12 characteristic:v34 v35];
        BOOL v14 = [v13 UUID];
        v15 = +[CBUUID UUIDWithString:@"5F6C6A23-8AC8-400E-810B-017134943460"];
        unsigned int v16 = [v14 isEqual:v15];

        if (v16)
        {
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10008337C;
          v43[3] = &unk_100165908;
          v43[4] = self;
          v43[5] = v12;
          [(EPResourceManager *)self enumerateResourcesWithBlock:v43];
          v17 = sub_1000A3BC0();
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

          if (v18)
          {
            BOOL v19 = sub_1000A3BC0();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPeripheralManager respondToRequest:withResult:", buf, 2u);
            }
          }
          [v38 respondToRequest:v12 withResult:0];
        }
        else
        {
          characteristics = self->_characteristics;
          v21 = [v12 characteristic];
          v22 = [v21 UUID];
          v23 = [(NSMutableDictionary *)characteristics objectForKeyedSubscript:v22];

          if (v23)
          {
            v24 = [v23 writeHandler];

            if (v24)
            {
              v25 = sub_1000A3BC0();
              BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

              if (v26)
              {
                v27 = sub_1000A3BC0();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  v28 = [v23 characteristicUUID];
                  v29 = [v28 UUIDString];
                  v30 = [v12 value];
                  v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 length]);
                  *(_DWORD *)buf = v34;
                  v49 = v29;
                  __int16 v50 = 2114;
                  v51 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Calling writeHandler block for characteristic %{public}@ data.length=%{public}@", buf, 0x16u);
                }
              }
              uint64_t v32 = [v23 writeHandler];
              v33 = [v12 value];
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v40[0] = sub_100083438;
              v40[1] = &unk_1001673C0;
              id v41 = v38;
              v42 = v12;
              ((void (**)(void, void *, void *))v32)[2](v32, v33, v39);

              uint64_t v10 = v36;
              id v6 = v37;
            }
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v9);
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v7 characteristic];
  id v9 = [v8 UUID];
  uint64_t v10 = +[CBUUID UUIDWithString:@"5F6C6A23-8AC8-400E-810B-017134943460"];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    v12 = self->_switchModeData;
    if (v12)
    {
      objc_super v13 = -[NSData subdataWithRange:](v12, "subdataWithRange:", [v7 offset], (unsigned char *)-[NSData length](v12, "length") - (unsigned char *)objc_msgSend(v7, "offset"));
      [v7 setValue:v13];

      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 6;
    }
    [v6 respondToRequest:v7 withResult:v14];
  }
  else
  {
    characteristics = self->_characteristics;
    unsigned int v16 = [v7 characteristic];
    v17 = [v16 UUID];
    v12 = [(NSMutableDictionary *)characteristics objectForKeyedSubscript:v17];

    if (v12)
    {
      BOOL v18 = [(NSData *)v12 readHandler];

      if (v18)
      {
        BOOL v19 = sub_1000A3BC0();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          v21 = sub_1000A3BC0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [(NSData *)v12 characteristicUUID];
            v23 = [v22 UUIDString];
            *(_DWORD *)buf = 138543362;
            v29 = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling readHandler block for characteristic %{public}@", buf, 0xCu);
          }
        }
        v24 = [(NSData *)v12 readHandler];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100083814;
        v25[3] = &unk_1001683D0;
        id v26 = v7;
        id v27 = v6;
        ((void (**)(void, void *))v24)[2](v24, v25);
      }
    }
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000A3BC0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    long long v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreBluetooth sent peripheralManagerDidStartAdvertising notification", v14, 2u);
    }
  }
  if (!v5) {
    goto LABEL_8;
  }
  id v9 = [v5 domain];
  if (([v9 isEqualToString:CBErrorDomain] & 1) == 0)
  {

    goto LABEL_10;
  }
  id v10 = [v5 code];

  if (v10 != (id)9)
  {
LABEL_10:
    unsigned int v11 = self;
    uint64_t v12 = 2;
    id v13 = v5;
    goto LABEL_11;
  }
LABEL_8:
  self->_isAdvertising = 1;
  self->_waitingForAdvertisingToStart = 0;
  unsigned int v11 = self;
  uint64_t v12 = 1;
  id v13 = 0;
LABEL_11:
  [(EPResourceManager *)v11 setAvailability:v12 withError:v13];
  [(EPAdvertiserManager *)self update];
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 UUID];
  id v10 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    if (v8)
    {
      uint64_t v12 = sub_1000A3BC0();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        uint64_t v14 = sub_1000A3BC0();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000FA020((uint64_t)v7, (uint64_t)v8, v14);
        }
      }
    }
    else
    {
      self->_serviceAdded = 1;
      self->_waitingForServiceToBeAdded = 0;
      [(EPAdvertiserManager *)self update];
    }
  }
}

- (void)collection:(id)a3 deviceDidAppear:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100083C70;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)collection:(id)a3 deviceDidDisappear:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100083D38;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)collection:(id)a3 deviceInfoDidDealloc:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100083E00;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [v11 identifier];
  uint64_t v14 = [(EPAdvertiserManager *)self devicesDictionary];
  id v15 = [v14 objectForKeyedSubscript:v13];

  if (!v15)
  {
    id v15 = [(EPDeviceCollection *)self->_deviceCollection newDeviceWithPeer:v11];
    unsigned int v16 = sub_1000A3BC0();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      BOOL v18 = sub_1000A3BC0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = (objc_class *)objc_opt_class();
        BOOL v20 = NSStringFromClass(v19);
        v21 = +[EPDevice stringFromCBPairingType:a5];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        CFStringRef v23 = @"CBCentral";
        *(_DWORD *)buf = 138413570;
        __int16 v30 = 2048;
        v29 = v20;
        if (isKindOfClass) {
          CFStringRef v23 = @"CBPeripheral";
        }
        id v31 = v15;
        __int16 v32 = 2112;
        id v33 = v11;
        __int16 v34 = 2112;
        v35 = v21;
        __int16 v36 = 2112;
        id v37 = v12;
        __int16 v38 = 2112;
        CFStringRef v39 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPAdvertiserManager Calling pairingAgent:peerDidRequestPairing:type:passkey: on %@[%p] with peer %@ type=%@ passkey=%@ peer=%@ on newly created device", buf, 0x3Eu);
      }
    }
  }
  [v15 pairingAgent:v10 peerDidRequestPairing:v11 type:a5 passkey:v12];
  v24 = +[EPFactory queue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000840A0;
  v26[3] = &unk_100165530;
  v26[4] = self;
  id v27 = v15;
  id v25 = v15;
  dispatch_async(v24, v26);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)advertisingRate
{
  return self->_advertisingRate;
}

- (BOOL)notAvailableToPair
{
  return self->_notAvailableToPair;
}

- (BOOL)dontAdvertiseWithServiceUUID
{
  return self->_dontAdvertiseWithServiceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_switchModeData, 0);
  objc_storeStrong((id *)&self->_subscribedCentral, 0);
  objc_storeStrong((id *)&self->_switchModesCharacteristic, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_activeAdvertisingName, 0);
  objc_storeStrong((id *)&self->_deviceCollection, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_agent, 0);
}

@end