@interface EPCharacteristicReader
+ (id)stringForEPCharacteristicReaderState:(unint64_t)a3;
- (EPCharacteristicReader)initWithDelegate:(id)a3 peripheral:(id)a4 serviceUUID:(id)a5 characteristicUUID:(id)a6;
- (EPCharacteristicReader)initWithDelegate:(id)a3 timeout:(double)a4 peripheral:(id)a5 serviceUUID:(id)a6 characteristicUUID:(id)a7;
- (NSData)readData;
- (id)newDispatchTimerOfDuration:(double)a3 withTimeoutBlock:(id)a4;
- (unint64_t)state;
- (void)_characteristicDiscoveryTimedOut;
- (void)_readFinishedWithError:(id)a3 withData:(id)a4;
- (void)_readSequenceTimedOut;
- (void)_updateStateWithNewState:(unint64_t)a3;
- (void)invalidate;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)read;
- (void)setState:(unint64_t)a3;
- (void)update;
@end

@implementation EPCharacteristicReader

- (EPCharacteristicReader)initWithDelegate:(id)a3 peripheral:(id)a4 serviceUUID:(id)a5 characteristicUUID:(id)a6
{
  return [(EPCharacteristicReader *)self initWithDelegate:a3 timeout:a4 peripheral:a5 serviceUUID:a6 characteristicUUID:30.0];
}

- (EPCharacteristicReader)initWithDelegate:(id)a3 timeout:(double)a4 peripheral:(id)a5 serviceUUID:(id)a6 characteristicUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)EPCharacteristicReader;
  v16 = [(EPCharacteristicReader *)&v31 init];
  if (v16)
  {
    v17 = sub_1000A3BC0();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = sub_1000A3BC0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v15 UUIDString];
        *(_DWORD *)buf = 134218242;
        v33 = v16;
        __int16 v34 = 2112;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: init to read characteristic %@", buf, 0x16u);
      }
    }
    v16->_timeout = a4;
    objc_storeWeak((id *)&v16->_delegate, v12);
    v21 = +[EPFactory sharedFactory];
    v22 = [v21 agentManager];
    v23 = (EPCentralManager *)[v22 newCentralManagerWithDelegate:v16];
    central = v16->_central;
    v16->_central = v23;

    objc_storeStrong((id *)&v16->_peripheral, a5);
    [v13 setDelegate:v16];
    objc_storeStrong((id *)&v16->_serviceUUID, a6);
    objc_storeStrong((id *)&v16->_characteristicUUID, a7);
    uint64_t v25 = +[NSMutableArray array];
    services = v16->_services;
    v16->_services = (NSMutableArray *)v25;

    v27 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A45D0;
    block[3] = &unk_1001655F8;
    v30 = v16;
    dispatch_async(v27, block);
  }
  return v16;
}

- (id)newDispatchTimerOfDuration:(double)a3 withTimeoutBlock:(id)a4
{
  central = self->_central;
  id v6 = a4;
  v7 = [(EPResource *)central resourceManager];
  v8 = [v7 queue];
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler(v9, v6);

  dispatch_resume(v9);
  return v9;
}

- (void)_readSequenceTimedOut
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Timeout reading from Bluetooth characteristic";
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v4 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.read" code:555 userInfo:v3];

  [(EPCharacteristicReader *)self _readFinishedWithError:v4 withData:0];
}

- (void)_characteristicDiscoveryTimedOut
{
  v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    NSErrorUserInfoKey v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FA920((uint64_t)self, v5);
    }
  }
  [(EPCharacteristicReader *)self _readFinishedWithError:0 withData:0];
}

- (void)_readFinishedWithError:(id)a3 withData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1000A3BC0();
  v9 = v8;
  if (!v6)
  {
    BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      id v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: _readFinishedWithError no error", buf, 0xCu);
      }
    }
    ++self->_readAttemptCounter;
    self->_waitingForRead = 0;
    goto LABEL_13;
  }
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v10)
  {
    v11 = sub_1000A3BC0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000FA998();
    }
  }
  int64_t readAttemptCounter = self->_readAttemptCounter;
  self->_int64_t readAttemptCounter = readAttemptCounter + 1;
  self->_waitingForRead = 0;
  if (readAttemptCounter >= 3)
  {
LABEL_13:
    readSequenceTimer = self->_readSequenceTimer;
    if (readSequenceTimer)
    {
      dispatch_source_cancel(readSequenceTimer);
      v16 = self->_readSequenceTimer;
      self->_readSequenceTimer = 0;
    }
    characteristicDiscoveryTimer = self->_characteristicDiscoveryTimer;
    if (characteristicDiscoveryTimer)
    {
      dispatch_source_cancel(characteristicDiscoveryTimer);
      BOOL v18 = self->_characteristicDiscoveryTimer;
      self->_characteristicDiscoveryTimer = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    v20 = +[EPFactory queue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000A4A44;
    v22[3] = &unk_100165668;
    id v23 = v6;
    id v24 = WeakRetained;
    uint64_t v25 = self;
    id v26 = v7;
    id v21 = WeakRetained;
    dispatch_async(v20, v22);
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3) {
    self->_state = a3;
  }
  -[EPCharacteristicReader _updateStateWithNewState:](self, "_updateStateWithNewState:");
}

- (void)_updateStateWithNewState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      readSequenceTimer = self->_readSequenceTimer;
      if (readSequenceTimer)
      {
        dispatch_source_cancel(readSequenceTimer);
        NSErrorUserInfoKey v5 = self->_readSequenceTimer;
        self->_readSequenceTimer = 0;
      }
      characteristicDiscoveryTimer = self->_characteristicDiscoveryTimer;
      if (characteristicDiscoveryTimer)
      {
        dispatch_source_cancel(characteristicDiscoveryTimer);
        id v7 = self->_characteristicDiscoveryTimer;
        self->_characteristicDiscoveryTimer = 0;
      }
      [(NSMutableArray *)self->_services removeAllObjects];
      characteristic = self->_characteristic;
      self->_characteristic = 0;

      connector = self->_connector;
      self->_connector = 0;
      goto LABEL_12;
    case 1uLL:
      if (!self->_readSequenceTimer)
      {
        double timeout = self->_timeout;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000A4F14;
        v33[3] = &unk_1001655F8;
        v33[4] = self;
        v11 = [(EPCharacteristicReader *)self newDispatchTimerOfDuration:v33 withTimeoutBlock:timeout];
        id v12 = self->_readSequenceTimer;
        self->_readSequenceTimer = v11;
      }
      if (!self->_connector)
      {
        BOOL v13 = [(EPPeripheralObserver *)self->_peripheral newConnectorWithDelegate:self];
        id v14 = self->_connector;
        self->_connector = v13;
      }
      [(NSMutableArray *)self->_services removeAllObjects];
      connector = self->_characteristic;
      self->_characteristic = 0;
LABEL_12:

      self->_waitingForRead = 0;
      break;
    case 2uLL:
      if ((id)[(EPResource *)self->_peripheral availability] == (id)1)
      {
        id v15 = sub_1000A3BC0();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v16)
        {
          v17 = sub_1000A3BC0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v18 = [(CBUUID *)self->_serviceUUID UUIDString];
            *(_DWORD *)buf = 134218242;
            v36 = self;
            __int16 v37 = 2112;
            v38 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Calling CoreBluetooth CBPeripheral discoverServices: %@", buf, 0x16u);
          }
        }
        v19 = [(EPPeripheralObserver *)self->_peripheral peripheral];
        serviceUUID = self->_serviceUUID;
        v20 = +[NSArray arrayWithObjects:&serviceUUID count:1];
        [v19 discoverServices:v20];

        [(EPCharacteristicReader *)self setState:3];
      }
      break;
    case 4uLL:
      if ((id)[(EPResource *)self->_peripheral availability] == (id)1)
      {
        if (!self->_characteristicDiscoveryTimer)
        {
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1000A4F58;
          v32[3] = &unk_1001655F8;
          v32[4] = self;
          id v21 = [(EPCharacteristicReader *)self newDispatchTimerOfDuration:v32 withTimeoutBlock:1.5];
          v22 = self->_characteristicDiscoveryTimer;
          self->_characteristicDiscoveryTimer = v21;
        }
        id v23 = [(NSMutableArray *)self->_services firstObject];
        if (v23)
        {
          [(NSMutableArray *)self->_services removeObjectAtIndex:0];
          id v24 = sub_1000A3BC0();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

          if (v25)
          {
            id v26 = sub_1000A3BC0();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = [(CBUUID *)self->_characteristicUUID UUIDString];
              *(_DWORD *)buf = 134218498;
              v36 = self;
              __int16 v37 = 2112;
              v38 = v27;
              __int16 v39 = 2048;
              v40 = v23;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Calling CoreBluetooth CBPeripheral discoverCharacteristics: %@ service: %p", buf, 0x20u);
            }
          }
          v28 = [(EPPeripheralObserver *)self->_peripheral peripheral];
          characteristicUUID = self->_characteristicUUID;
          v29 = +[NSArray arrayWithObjects:&characteristicUUID count:1];
          [v28 discoverCharacteristics:v29 forService:v23];

          [(EPCharacteristicReader *)self setState:5];
        }
      }
      break;
    case 6uLL:
      v30 = self->_characteristicDiscoveryTimer;
      if (v30)
      {
        dispatch_source_cancel(v30);
        objc_super v31 = self->_characteristicDiscoveryTimer;
        self->_characteristicDiscoveryTimer = 0;
      }
      if ((id)[(EPResource *)self->_peripheral availability] == (id)1 && !self->_waitingForRead)
      {
        self->_waitingForRead = 1;
        [(EPCharacteristicReader *)self read];
      }
      break;
    default:
      return;
  }
}

- (void)read
{
  v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    NSErrorUserInfoKey v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      characteristic = self->_characteristic;
      int v8 = 134218242;
      v9 = self;
      __int16 v10 = 2112;
      v11 = characteristic;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Calling CoreBluetooth CBPeripheral readValueForCharacteristic: for characteristic %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v7 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  [v7 readValueForCharacteristic:self->_characteristic];
}

- (void)invalidate
{
  v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    NSErrorUserInfoKey v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: invalidate call", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_invalidated = 1;
  [(EPCharacteristicReader *)self update];
}

- (void)update
{
  BOOL invalidated = self->_invalidated;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (invalidated)
  {
    if (WeakRetained)
    {
LABEL_3:
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Reader invalidated";
      int v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v7 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.read" code:666 userInfo:v6];

LABEL_13:
      [(EPCharacteristicReader *)self _readFinishedWithError:v7 withData:0];
      [(EPCharacteristicReader *)self setState:0];
      [(EPResource *)self->_central invalidate];
      central = self->_central;
      self->_central = 0;

      [(EPResource *)self->_peripheral invalidate];
      peripheral = self->_peripheral;
      self->_peripheral = 0;

      [(EPResource *)self->_connector invalidate];
      connector = self->_connector;
      self->_connector = 0;

      return;
    }
    goto LABEL_12;
  }
  if (!WeakRetained)
  {
    if (self->_invalidated)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);

      if (!v7) {
        goto LABEL_13;
      }
      goto LABEL_3;
    }
LABEL_12:
    id v7 = 0;
    goto LABEL_13;
  }
  if ((id)[(EPResource *)self->_central availability] != (id)1)
  {
    if (![(EPCharacteristicReader *)self state]) {
      return;
    }
    __int16 v10 = self;
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  unint64_t v8 = [(EPResource *)self->_connector availability];
  unint64_t v9 = [(EPCharacteristicReader *)self state];
  if (v8 != 1)
  {
    if (v9 == 1) {
      return;
    }
LABEL_18:
    __int16 v10 = self;
    uint64_t v11 = 1;
    goto LABEL_25;
  }
  if (v9 != 1)
  {
    if ((id)[(EPCharacteristicReader *)self state] == (id)3)
    {
      if (![(NSMutableArray *)self->_services count]) {
        return;
      }
      __int16 v10 = self;
      uint64_t v11 = 4;
      goto LABEL_25;
    }
    if ((id)[(EPCharacteristicReader *)self state] == (id)5)
    {
      if (!self->_characteristic) {
        return;
      }
      [(NSMutableArray *)self->_services removeAllObjects];
      __int16 v10 = self;
      uint64_t v11 = 6;
      goto LABEL_25;
    }
    if ([(EPCharacteristicReader *)self state]) {
      return;
    }
    goto LABEL_18;
  }
  __int16 v10 = self;
  uint64_t v11 = 2;
LABEL_25:

  [(EPCharacteristicReader *)v10 setState:v11];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  unint64_t v8 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  unint64_t v9 = [v8 identifier];
  unsigned int v10 = [v7 isEqual:v9];

  if (v10 && (id)[(EPCharacteristicReader *)self state] == (id)3)
  {
    if (a4)
    {
      [(EPCharacteristicReader *)self setState:1];
LABEL_37:
      [(EPCharacteristicReader *)self update];
      goto LABEL_38;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v11 = [v6 services];
    id v12 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          CFStringRef v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v17 = [v16 UUID];
          unsigned int v18 = [v17 isEqual:self->_serviceUUID];

          if (v18) {
            [(NSMutableArray *)self->_services addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v13);
    }

    if ([(NSMutableArray *)self->_services count])
    {
      v19 = sub_1000A3BC0();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (!v20) {
        goto LABEL_37;
      }
      id v21 = sub_1000A3BC0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v48 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Found service", buf, 0xCu);
      }
    }
    else
    {
      id v21 = objc_alloc_init((Class)NSMutableArray);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v38 = v6;
      v22 = [v6 services];
      id v23 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v40;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(CBUUID **)(*((void *)&v39 + 1) + 8 * (void)j);
            v28 = [(CBUUID *)v27 UUID];
            v29 = [v28 UUIDString];

            if (v29)
            {
              [v21 addObject:v29];
            }
            else
            {
              v30 = sub_1000A3BC0();
              BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

              if (v31)
              {
                v32 = sub_1000A3BC0();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v48 = self;
                  __int16 v49 = 2112;
                  v50 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "EPCharacteristicReader[%p]: CBService %@ has nil UUID", buf, 0x16u);
                }
              }
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
        }
        while (v24);
      }

      v33 = sub_1000A3BC0();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      id v6 = v38;
      if (v34)
      {
        v35 = sub_1000A3BC0();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          serviceUUID = self->_serviceUUID;
          __int16 v37 = [v21 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 134218498;
          v48 = self;
          __int16 v49 = 2114;
          v50 = serviceUUID;
          __int16 v51 = 2112;
          v52 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Did not find service %{public}@, services device has: [%@]", buf, 0x20u);
        }
      }
      [(EPCharacteristicReader *)self _readFinishedWithError:0 withData:0];
    }

    goto LABEL_37;
  }
LABEL_38:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [a3 identifier];
  uint64_t v11 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  id v12 = [v11 identifier];
  unsigned int v13 = [v10 isEqual:v12];

  if (v13)
  {
    uint64_t v14 = sub_1000A3BC0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      CFStringRef v16 = sub_1000A3BC0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        long long v39 = self;
        __int16 v40 = 2112;
        id v41 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: CoreBluetooth CBPeripheralDelegate peripheral:didDiscoverCharacteristicsForService with error %@", buf, 0x16u);
      }
    }
    if ((id)[(EPCharacteristicReader *)self state] == (id)5)
    {
      if (v9)
      {
        v17 = self;
        uint64_t v18 = 1;
      }
      else
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v19 = [v8 characteristics];
        id v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v34;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v25 = [v24 UUID];
              unsigned int v26 = [v25 isEqual:self->_characteristicUUID];

              if (v26)
              {
                objc_storeStrong((id *)&self->_characteristic, v24);
                goto LABEL_22;
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
LABEL_22:

        if (self->_characteristic)
        {
          v27 = sub_1000A3BC0();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

          if (v28)
          {
            v29 = sub_1000A3BC0();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              long long v39 = self;
              __int16 v40 = 2048;
              id v41 = v8;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Found characteristic on service %p", buf, 0x16u);
            }
          }
          goto LABEL_10;
        }
        if (![(NSMutableArray *)self->_services count])
        {
LABEL_10:
          [(EPCharacteristicReader *)self update];
          goto LABEL_11;
        }
        v30 = sub_1000A3BC0();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

        if (v31)
        {
          v32 = sub_1000A3BC0();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            long long v39 = self;
            __int16 v40 = 2048;
            id v41 = v8;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: Did not find characteristic on service %p, yet", buf, 0x16u);
          }
        }
        v17 = self;
        uint64_t v18 = 4;
      }
      [(EPCharacteristicReader *)v17 setState:v18];
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 identifier];
  id v12 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  unsigned int v13 = [v12 identifier];
  if (([v11 isEqual:v13] & 1) == 0)
  {

    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained || (id)[(EPCharacteristicReader *)self state] != (id)6) {
    goto LABEL_13;
  }
  uint64_t v11 = [v9 UUID];
  id v12 = [(CBCharacteristic *)self->_characteristic UUID];
  if (([v11 isEqual:v12] & 1) == 0)
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  BOOL v15 = [v8 identifier];
  CFStringRef v16 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  v17 = [v16 identifier];
  unsigned int v18 = [v15 isEqual:v17];

  if (v18)
  {
    v19 = sub_1000A3BC0();
    id v20 = v19;
    if (v10)
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        uint64_t v22 = sub_1000A3BC0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000FAA00();
        }
LABEL_17:
      }
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v23)
      {
        uint64_t v22 = sub_1000A3BC0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [v9 value];
          uint64_t v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 length]);
          int v28 = 134218242;
          v29 = self;
          __int16 v30 = 2112;
          BOOL v31 = v25;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EPCharacteristicReader[%p]: CoreBluetooth CBPeripheralDelegate peripheral:didUpdateValueForCharacteristic with no error length = %@", (uint8_t *)&v28, 0x16u);
        }
        goto LABEL_17;
      }
    }
    unsigned int v26 = [v10 domain];
    if ([v26 isEqual:CBATTErrorDomain])
    {
      id v27 = [v10 code];

      if (v27 == (id)241)
      {
        [(EPCharacteristicReader *)self setState:1];
        [(EPCharacteristicReader *)self update];
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v11 = [v9 value];
    [(EPCharacteristicReader *)self _readFinishedWithError:v10 withData:v11];
    goto LABEL_12;
  }
LABEL_13:
}

+ (id)stringForEPCharacteristicReaderState:(unint64_t)a3
{
  if (a3 > 6) {
    return @"EPCharacteristicReaderState unknown";
  }
  else {
    return *(&off_1001687F8 + a3);
  }
}

- (NSData)readData
{
  return self->_readData;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readData, 0);
  objc_storeStrong((id *)&self->_characteristicDiscoveryTimer, 0);
  objc_storeStrong((id *)&self->_readSequenceTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_characteristicUUID, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end