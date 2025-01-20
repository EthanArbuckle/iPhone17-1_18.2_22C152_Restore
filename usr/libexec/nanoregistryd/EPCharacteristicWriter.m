@interface EPCharacteristicWriter
+ (id)stringForEPCharacteristicWriterState:(unint64_t)a3;
- (EPCharacteristicWriter)initWithPeripheral:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5;
- (id)newDispatchTimerOfDuration:(double)a3 withTimeoutBlock:(id)a4;
- (unint64_t)state;
- (void)_updateStateWithNewState:(unint64_t)a3;
- (void)_writeFinishedWithError:(id)a3 withEntry:(id)a4;
- (void)_writeTimedOutWithEntry:(id)a3;
- (void)invalidate;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setState:(unint64_t)a3;
- (void)update;
- (void)write;
- (void)writeData:(id)a3 begin:(id)a4 completion:(id)a5;
- (void)writeData:(id)a3 timeout:(double)a4 begin:(id)a5 completion:(id)a6;
@end

@implementation EPCharacteristicWriter

- (void)invalidate
{
  v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: invalidate call", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_invalidated = 1;
  [(EPCharacteristicWriter *)self update];
}

- (EPCharacteristicWriter)initWithPeripheral:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(EPCharacteristicWriter *)self init];
  if (v12)
  {
    v13 = sub_1000A3BC0();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = sub_1000A3BC0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v11 UUIDString];
        *(_DWORD *)buf = 134218242;
        v30 = v12;
        __int16 v31 = 2112;
        v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: init to write characteristic %@", buf, 0x16u);
      }
    }
    v17 = +[EPFactory sharedFactory];
    v18 = [v17 agentManager];
    v19 = (EPCentralManager *)[v18 newCentralManagerWithDelegate:v12];
    central = v12->_central;
    v12->_central = v19;

    objc_storeStrong((id *)&v12->_peripheral, a3);
    [v9 setDelegate:v12];
    objc_storeStrong((id *)&v12->_serviceUUID, a4);
    objc_storeStrong((id *)&v12->_characteristicUUID, a5);
    uint64_t v21 = +[NSMutableArray array];
    writeFIFO = v12->_writeFIFO;
    v12->_writeFIFO = (NSMutableArray *)v21;

    uint64_t v23 = +[NSMutableArray array];
    services = v12->_services;
    v12->_services = (NSMutableArray *)v23;

    v25 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D1750;
    block[3] = &unk_1001655F8;
    v28 = v12;
    dispatch_async(v25, block);
  }
  return v12;
}

- (id)newDispatchTimerOfDuration:(double)a3 withTimeoutBlock:(id)a4
{
  central = self->_central;
  id v6 = a4;
  v7 = [(EPResource *)central resourceManager];
  v8 = [v7 queue];
  id v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler(v9, v6);

  dispatch_resume(v9);
  return v9;
}

- (void)writeData:(id)a3 begin:(id)a4 completion:(id)a5
{
}

- (void)writeData:(id)a3 timeout:(double)a4 begin:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_alloc_init(EPCharacteristicWriterWriteEntry);
  [(EPCharacteristicWriterWriteEntry *)v13 setData:v12];

  [(EPCharacteristicWriterWriteEntry *)v13 setBegin:v11];
  [(EPCharacteristicWriterWriteEntry *)v13 setCompletion:v10];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1000D1970;
  v19 = &unk_100165530;
  v20 = self;
  uint64_t v21 = v13;
  BOOL v14 = v13;
  id v15 = [(EPCharacteristicWriter *)self newDispatchTimerOfDuration:&v16 withTimeoutBlock:a4];
  -[EPCharacteristicWriterWriteEntry setTimer:](v14, "setTimer:", v15, v16, v17, v18, v19, v20);

  [(EPCharacteristicWriterWriteEntry *)v14 setWriter:self];
  [(NSMutableArray *)self->_writeFIFO addObject:v14];
  [(EPCharacteristicWriter *)self update];
  [(EPCharacteristicWriter *)self write];
}

- (void)_writeTimedOutWithEntry:(id)a3
{
  id v4 = a3;
  [v4 setTimer:0];
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  CFStringRef v8 = @"Timeout writing to Bluetooth characteristic";
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v6 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.write" code:555 userInfo:v5];

  [(EPCharacteristicWriter *)self _writeFinishedWithError:v6 withEntry:v4];
}

- (void)_writeFinishedWithError:(id)a3 withEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    BOOL v14 = sub_1000A3BC0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (!v15) {
      goto LABEL_16;
    }
    id v12 = sub_1000A3BC0();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 134217984;
    v47 = self;
    v13 = "EPCharacteristicWriter[%p]: _writeFinishedWithError no error";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    goto LABEL_15;
  }
  CFStringRef v8 = [v6 domain];
  if ([v8 isEqual:@"com.apple.nanoregistry.extensiblepair.write"])
  {
    id v9 = [v6 code];

    if (v9 == (id)666)
    {
      id v10 = sub_1000A3BC0();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (!v11) {
        goto LABEL_16;
      }
      id v12 = sub_1000A3BC0();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 134217984;
      v47 = self;
      v13 = "EPCharacteristicWriter[%p]: Write canceled";
      goto LABEL_10;
    }
  }
  else
  {
  }
  v16 = sub_1000A3BC0();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (!v17) {
    goto LABEL_16;
  }
  id v12 = sub_1000A3BC0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000FBBA0();
  }
LABEL_15:

LABEL_16:
  if (!v7)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v22 = self->_writeFIFO;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v39;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v27 written])
          {
            [(NSMutableArray *)self->_writeFIFO removeObject:v27];
            v28 = [v27 timer];

            if (v28)
            {
              v29 = [v27 timer];
              dispatch_source_cancel(v29);

              [v27 setTimer:0];
            }
            v30 = [v27 completion];

            if (v30)
            {
              __int16 v31 = +[EPFactory queue];
              v32 = _NSConcreteStackBlock;
              uint64_t v33 = 3221225472;
              v34 = sub_1000D1F18;
              v35 = &unk_100165530;
              v36 = v27;
              id v37 = v6;
              dispatch_async(v31, &v32);
            }
            goto LABEL_34;
          }
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
    goto LABEL_34;
  }
  [(NSMutableArray *)self->_writeFIFO removeObject:v7];
  v18 = [v7 timer];

  if (v18)
  {
    v19 = [v7 timer];
    dispatch_source_cancel(v19);

    [v7 setTimer:0];
  }
  v20 = [v7 completion];

  if (v20)
  {
    uint64_t v21 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D1EBC;
    block[3] = &unk_100165530;
    v43 = (NSMutableArray *)v7;
    id v44 = v6;
    dispatch_async(v21, block);

    v22 = v43;
LABEL_34:
  }
  [(EPCharacteristicWriter *)self update];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[EPCharacteristicWriter _updateStateWithNewState:](self, "_updateStateWithNewState:");
  }
}

- (void)_updateStateWithNewState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      [(NSMutableArray *)self->_services removeAllObjects];
      characteristic = self->_characteristic;
      self->_characteristic = 0;

      [(EPResource *)self->_connector invalidate];
      connector = self->_connector;
      self->_connector = 0;

      return;
    case 1uLL:
      [(NSMutableArray *)self->_services removeAllObjects];
      id v6 = self->_characteristic;
      self->_characteristic = 0;

      if (!self->_connector)
      {
        id v7 = [(EPPeripheralObserver *)self->_peripheral newConnectorWithDelegate:self];
        CFStringRef v8 = self->_connector;
        self->_connector = v7;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v9 = self->_writeFIFO;
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v32;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            BOOL v15 = [v14 completion:v31];

            if (v15) {
              [v14 setWritten:0];
            }
          }
          id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v11);
      }

      return;
    case 2uLL:
      v16 = sub_1000A3BC0();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        v18 = sub_1000A3BC0();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v37 = self;
          __int16 v38 = 2112;
          CFStringRef v39 = @"9AA4730F-B25C-4CC3-B821-C931559FC196";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Calling CoreBluetooth CBPeripheral discoverServices: %@", buf, 0x16u);
        }
      }
      v19 = [(EPPeripheralObserver *)self->_peripheral peripheral];
      serviceUUID = self->_serviceUUID;
      v20 = +[NSArray arrayWithObjects:&serviceUUID count:1];
      [v19 discoverServices:v20];

      [(EPCharacteristicWriter *)self setState:3];
      return;
    case 4uLL:
      uint64_t v21 = [(NSMutableArray *)self->_services firstObject];
      if (v21)
      {
        [(NSMutableArray *)self->_services removeObjectAtIndex:0];
        v22 = sub_1000A3BC0();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

        if (v23)
        {
          id v24 = sub_1000A3BC0();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            characteristicUUID = self->_characteristicUUID;
            *(_DWORD *)buf = 134218498;
            id v37 = self;
            __int16 v38 = 2112;
            CFStringRef v39 = (const __CFString *)characteristicUUID;
            __int16 v40 = 2048;
            long long v41 = v21;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Calling CoreBluetooth CBPeripheral discoverCharacteristics: %@ service: %p", buf, 0x20u);
          }
        }
        v26 = [(EPPeripheralObserver *)self->_peripheral peripheral];
        v35 = self->_characteristicUUID;
        v27 = +[NSArray arrayWithObjects:&v35 count:1];
        [v26 discoverCharacteristics:v27 forService:v21];

        uint64_t v28 = 5;
      }
      else
      {
        v29 = sub_1000A3BC0();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

        if (!v30)
        {
          uint64_t v28 = 1;
          goto LABEL_36;
        }
        v26 = sub_1000A3BC0();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000FBC08((uint64_t)self, v26);
        }
        uint64_t v28 = 1;
      }

LABEL_36:
      [(EPCharacteristicWriter *)self setState:v28];

      return;
    case 6uLL:
      [(NSMutableArray *)self->_services removeAllObjects];
      [(EPCharacteristicWriter *)self write];
      return;
    default:
      return;
  }
}

- (void)write
{
  if ((id)[(EPCharacteristicWriter *)self state] == (id)6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v3 = self->_writeFIFO;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v24;
      *(void *)&long long v5 = 134218242;
      long long v22 = v5;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v9, "written", v22) & 1) == 0)
          {
            [v9 setWritten:1];
            id v10 = sub_1000A3BC0();
            BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

            if (v11)
            {
              uint64_t v12 = sub_1000A3BC0();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                v13 = [v9 data];
                BOOL v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 length]);
                *(_DWORD *)buf = v22;
                uint64_t v28 = self;
                __int16 v29 = 2112;
                BOOL v30 = v14;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Calling CoreBluetooth CBPeripheral writeValue:forCharacteristic:type: data.length %@", buf, 0x16u);
              }
            }
            BOOL v15 = [(EPPeripheralObserver *)self->_peripheral peripheral];
            v16 = [v9 data];
            [v15 writeValue:v16 forCharacteristic:self->_characteristic type:0];
          }
          BOOL v17 = [v9 begin];

          if (v17)
          {
            v18 = [v9 begin];
            [v9 setBegin:0];
            v19 = sub_1000A3BC0();
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

            if (v20)
            {
              uint64_t v21 = sub_1000A3BC0();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v28 = self;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Calling write:withBegin:withCompletion: begin block()", buf, 0xCu);
              }
            }
            v18[2](v18);
          }
        }
        id v6 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v6);
    }
  }
}

- (void)update
{
  if (self->_invalidated)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Writer invalidated";
    v3 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v4 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.write" code:666 userInfo:v3];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v5 = self->_writeFIFO;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          -[EPCharacteristicWriter _writeFinishedWithError:withEntry:](self, "_writeFinishedWithError:withEntry:", v4, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_writeFIFO removeAllObjects];
    [(EPCharacteristicWriter *)self setState:0];
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
  if (![(NSMutableArray *)self->_writeFIFO count])
  {
    if (![(EPCharacteristicWriter *)self state]) {
      return;
    }
    BOOL v15 = self;
    uint64_t v16 = 0;
    goto LABEL_21;
  }
  if ((id)[(EPResource *)self->_central availability] != (id)1)
  {
    unint64_t v14 = [(EPCharacteristicWriter *)self state];
LABEL_19:
    if (v14 == 1) {
      return;
    }
LABEL_20:
    BOOL v15 = self;
    uint64_t v16 = 1;
    goto LABEL_21;
  }
  unint64_t v13 = [(EPResource *)self->_connector availability];
  unint64_t v14 = [(EPCharacteristicWriter *)self state];
  if (v13 != 1) {
    goto LABEL_19;
  }
  if (v14 != 1)
  {
    if ((id)[(EPCharacteristicWriter *)self state] == (id)3)
    {
      if (![(NSMutableArray *)self->_services count]) {
        return;
      }
      BOOL v15 = self;
      uint64_t v16 = 4;
      goto LABEL_21;
    }
    if ((id)[(EPCharacteristicWriter *)self state] == (id)5)
    {
      if (!self->_characteristic) {
        return;
      }
      BOOL v15 = self;
      uint64_t v16 = 6;
      goto LABEL_21;
    }
    if ([(EPCharacteristicWriter *)self state]) {
      return;
    }
    goto LABEL_20;
  }
  BOOL v15 = self;
  uint64_t v16 = 2;
LABEL_21:

  [(EPCharacteristicWriter *)v15 setState:v16];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  uint64_t v8 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  id v9 = [v8 identifier];
  unsigned int v10 = [v7 isEqual:v9];

  if (v10 && (id)[(EPCharacteristicWriter *)self state] == (id)3)
  {
    if (a4)
    {
      if ((id)[(EPCharacteristicWriter *)self state] != (id)1)
      {
        BOOL v11 = self;
        uint64_t v12 = 1;
LABEL_21:
        [(EPCharacteristicWriter *)v11 setState:v12];
      }
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v30 = v6;
      unint64_t v13 = [v6 services];
      id v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v32;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v19 = [v18 UUID];
            unsigned int v20 = [v19 isEqual:self->_serviceUUID];

            if (v20)
            {
              [(NSMutableArray *)self->_services addObject:v18];
              uint64_t v21 = sub_1000A3BC0();
              BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

              if (v22)
              {
                CFStringRef v23 = sub_1000A3BC0();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  long long v24 = [(CBUUID *)self->_serviceUUID UUIDString];
                  *(_DWORD *)buf = 134218242;
                  __int16 v38 = self;
                  __int16 v39 = 2112;
                  __int16 v40 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Found service %@", buf, 0x16u);
                }
              }
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }
        while (v15);
      }

      if (![(NSMutableArray *)self->_services count])
      {
        long long v25 = sub_1000A3BC0();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
          v27 = sub_1000A3BC0();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_1000FBC80((uint64_t)self, v27);
          }
        }
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        CFStringRef v36 = @"Service not discovered";
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        __int16 v29 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.write" code:565 userInfo:v28];

        [(EPCharacteristicWriter *)self _writeFinishedWithError:v29 withEntry:0];
        id v6 = v30;
        goto LABEL_27;
      }
      id v6 = v30;
      if ((id)[(EPCharacteristicWriter *)self state] != (id)4)
      {
        BOOL v11 = self;
        uint64_t v12 = 4;
        goto LABEL_21;
      }
    }
LABEL_27:
    [(EPCharacteristicWriter *)self update];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = sub_1000A3BC0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    unint64_t v13 = sub_1000A3BC0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v49 = self;
      __int16 v50 = 2112;
      id v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: CoreBluetooth CBPeripheralDelegate peripheral:didDiscoverCharacteristicsForService with error %@", buf, 0x16u);
    }
  }
  id v14 = [v8 identifier];
  id v15 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  uint64_t v16 = [v15 identifier];
  unsigned int v17 = [v14 isEqual:v16];

  if (v17 && (id)[(EPCharacteristicWriter *)self state] == (id)5)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v41 = v9;
    long long v18 = [v9 characteristics];
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          CFStringRef v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v24 = [v23 UUID];
          unsigned int v25 = [v24 isEqual:self->_characteristicUUID];

          if (v25)
          {
            objc_storeStrong((id *)&self->_characteristic, v23);
            goto LABEL_17;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    if (self->_characteristic)
    {
      BOOL v26 = sub_1000A3BC0();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        uint64_t v28 = sub_1000A3BC0();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = [(CBUUID *)self->_characteristicUUID UUIDString];
          *(_DWORD *)buf = 134218242;
          v49 = self;
          __int16 v50 = 2112;
          id v51 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Found characteristic %@", buf, 0x16u);
        }
      }
      id v9 = v41;
      if ((id)[(EPCharacteristicWriter *)self state] == (id)6) {
        goto LABEL_36;
      }
      id v30 = self;
      uint64_t v31 = 6;
    }
    else
    {
      id v32 = [(NSMutableArray *)self->_services count];
      long long v33 = sub_1000A3BC0();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (!v32)
      {
        id v9 = v41;
        if (v34)
        {
          id v37 = sub_1000A3BC0();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v38 = [(CBUUID *)self->_characteristicUUID UUIDString];
            *(_DWORD *)buf = 134218242;
            v49 = self;
            __int16 v50 = 2112;
            id v51 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Did not find characteristic %@ on any service", buf, 0x16u);
          }
        }
        NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
        CFStringRef v47 = @"Characteristic not discovered";
        __int16 v39 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        __int16 v40 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair.write" code:575 userInfo:v39];

        [(EPCharacteristicWriter *)self _writeFinishedWithError:v40 withEntry:0];
        goto LABEL_36;
      }
      id v9 = v41;
      if (v34)
      {
        NSErrorUserInfoKey v35 = sub_1000A3BC0();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v36 = [(CBUUID *)self->_characteristicUUID UUIDString];
          *(_DWORD *)buf = 134218498;
          v49 = self;
          __int16 v50 = 2112;
          id v51 = v36;
          __int16 v52 = 2048;
          id v53 = v41;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: Did not find characteristic %@ on service %p", buf, 0x20u);
        }
      }
      id v30 = self;
      uint64_t v31 = 4;
    }
    [(EPCharacteristicWriter *)v30 setState:v31];
LABEL_36:
    [(EPCharacteristicWriter *)self update];
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 identifier];
  BOOL v11 = [(EPPeripheralObserver *)self->_peripheral peripheral];
  BOOL v12 = [v11 identifier];
  unsigned int v13 = [v10 isEqual:v12];

  if (!v13) {
    goto LABEL_22;
  }
  id v14 = [v8 UUID];
  unsigned int v15 = [v14 isEqual:self->_characteristicUUID];

  if (!v15 || (id)[(EPCharacteristicWriter *)self state] != (id)6) {
    goto LABEL_22;
  }
  uint64_t v16 = sub_1000A3BC0();
  unsigned int v17 = v16;
  if (!v9)
  {
    BOOL v22 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      CFStringRef v23 = sub_1000A3BC0();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        BOOL v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "EPCharacteristicWriter[%p]: CoreBluetooth CBPeripheralDelegate peripheral:didWriteValueForCharacteristic with no error", (uint8_t *)&v26, 0xCu);
      }
    }
    long long v24 = self;
    id v25 = 0;
    goto LABEL_21;
  }
  BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v18)
  {
    id v19 = sub_1000A3BC0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000FBD34();
    }
  }
  id v20 = [v9 domain];
  if (![v20 isEqual:CBATTErrorDomain])
  {

    goto LABEL_20;
  }
  id v21 = [v9 code];

  if (v21 != (id)241)
  {
LABEL_20:
    long long v24 = self;
    id v25 = v9;
LABEL_21:
    [(EPCharacteristicWriter *)v24 _writeFinishedWithError:v25 withEntry:0];
    goto LABEL_22;
  }
  if ((id)[(EPCharacteristicWriter *)self state] != (id)1) {
    [(EPCharacteristicWriter *)self setState:1];
  }
  [(EPCharacteristicWriter *)self update];
LABEL_22:
}

+ (id)stringForEPCharacteristicWriterState:(unint64_t)a3
{
  if (a3 > 6) {
    return @"EPCharacteristicWriterState unknown";
  }
  else {
    return *(&off_100169828 + a3);
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeFIFO, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_characteristicUUID, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end