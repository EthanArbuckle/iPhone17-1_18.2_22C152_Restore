@interface ISO18013_3_Peripheral
+ (id)getAddress;
- (BLESender)sender;
- (BOOL)_startCBPeripheralManager;
- (BOOL)advertise:(id)a3 readerIdentCharacteristic:(id)a4 centralAddress:(id)a5 onDeviceConnection:(id)a6 onDisconnect:(id)a7 onDataRx:(id)a8;
- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5;
- (BOOL)getL2CAPEnable;
- (BOOL)isConnected;
- (BOOL)writeData:(id)a3 toUUID:(id)a4;
- (CBL2CAPChannel)l2capChannel;
- (CBMutableService)iso18Service;
- (CBPeripheralManager)peripheralManager;
- (CBUUID)advertiseServiceUUID;
- (ISO18013_3_Peripheral)initWithWorkQueue:(id)a3 callbackQueue:(id)a4;
- (NSCondition)peripheralCallbackLock;
- (NSData)identCharacteristicValue;
- (NSMutableArray)iso18Characteristics;
- (NSMutableArray)readers;
- (NSMutableData)rxBuffer;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)queue;
- (id)_extractFromMessage:(const char *)a3 length:(unint64_t)a4 lastPacket:(BOOL *)a5;
- (id)connectionBlock;
- (id)disconnectionBlock;
- (id)getBluetoothStatusDict:(id *)a3;
- (id)getCharacteristic:(id)a3;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getStateCharacteristicUUID;
- (id)rxBlock;
- (int64_t)hardwareAvailable;
- (unsigned)isoConnectionState;
- (unsigned)l2CapPSM;
- (void)_activateConnectionBlock:(unint64_t)a3 connectionState:(BOOL)a4;
- (void)_activateDisconnectBlock:(unint64_t)a3;
- (void)_activateRxCallbackWithData:(id)a3 lastPacket:(BOOL)a4;
- (void)_signalConnectionStateChange:(unsigned __int8)a3;
- (void)_startAdvertising:(id)a3 prioritizedCentralAddress:(id)a4;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
- (void)setAdvertiseServiceUUID:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setConnectionBlock:(id)a3;
- (void)setDisconnectionBlock:(id)a3;
- (void)setIdentCharacteristicValue:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIso18Characteristics:(id)a3;
- (void)setIso18Service:(id)a3;
- (void)setIsoConnectionState:(unsigned __int8)a3;
- (void)setL2CapPSM:(unsigned __int16)a3;
- (void)setL2capChannel:(id)a3;
- (void)setPeripheralCallbackLock:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReaders:(id)a3;
- (void)setReady;
- (void)setRxBlock:(id)a3;
- (void)setRxBuffer:(id)a3;
- (void)setSender:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation ISO18013_3_Peripheral

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "peripheralManagerDidUpdateState:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [v4 state];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManagerDidUpdateState:]", 47, self, @"LE: peripheralManagerDidUpdateState : %ld", v7, v8, (uint64_t)v6);
  if ([v4 state] == (id)4)
  {
    [(ISO18013_3_Peripheral *)self _activateDisconnectBlock:4];
LABEL_6:
    v9 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v9 lock];

    v10 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v10 broadcast];

    v11 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v11 unlock];

    goto LABEL_7;
  }
  if ([v4 state] != (id)5 || !-[ISO18013_3_Peripheral getL2CAPEnable](self, "getL2CAPEnable")) {
    goto LABEL_6;
  }
  [(CBPeripheralManager *)self->_peripheralManager publishL2CAPChannelWithEncryption:0];
LABEL_7:
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create((void *)&_mh_execute_header, "peripheralManagerDidStartAdvertising:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManagerDidStartAdvertising:error:]", 65, self, @"LE: peripheralManagerDidStartAdvertising : %@", v7, v8, (uint64_t)v5);
  if (!v5)
  {
    v9 = sub_1000261A8();
    if (os_signpost_enabled(v9))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DidStartAdvertising", "", (uint8_t *)&state, 2u);
    }
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:central:didSubscribeToCharacterisitc:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = sub_1000261A8();
  if (os_signpost_enabled(v10))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_CentralSubscribedCharacteristic", "", (uint8_t *)&state, 2u);
  }

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:central:didSubscribeToCharacteristic:]", 77, self, @"LE: didSubscribeToCharacteristic : %@", v11, v12, (uint64_t)v8);
  if ([(CBPeripheralManager *)self->_peripheralManager isAdvertising]) {
    [(CBPeripheralManager *)self->_peripheralManager stopAdvertising];
  }
  if (![(NSMutableArray *)self->_readers count])
  {
    v13 = [v8 UUID];
    v14 = [(ISO18013_3_Peripheral *)self getStateCharacteristicUUID];
    v15 = +[CBUUID UUIDWithString:v14];
    unsigned int v16 = [v13 isEqual:v15];

    if (v16)
    {
      [(NSMutableArray *)self->_readers addObject:v7];
      [(ISO18013_3_Peripheral *)self setReady];
    }
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:central:didUnsubscribeFromCharacteristic:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = sub_1000261A8();
  if (os_signpost_enabled(v10))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_CentralUnsubscribedCharacteristic", "", (uint8_t *)&state, 2u);
  }

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:central:didUnsubscribeFromCharacteristic:]", 95, self, @"LE: didUnsubscribeFromCharacteristic : %@", v11, v12, (uint64_t)v8);
  v13 = [v8 UUID];

  v14 = [(ISO18013_3_Peripheral *)self getStateCharacteristicUUID];
  v15 = +[CBUUID UUIDWithString:v14];
  unsigned int v16 = [v13 isEqual:v15];

  if (v16)
  {
    [(NSMutableArray *)self->_readers removeObject:v7];
    if (![(NSMutableArray *)self->_readers count])
    {
      if (sub_10001AC44((os_unfair_lock_s *)self->_sender)) {
        uint64_t v24 = 5;
      }
      else {
        uint64_t v24 = 0;
      }
      sub_10001ABC0(self->_sender, v17, v18, v19, v20, v21, v22, v23);
      sender = self->_sender;
      self->_sender = 0;

      l2capChannel = self->_l2capChannel;
      if (l2capChannel)
      {
        v27 = [(CBL2CAPChannel *)l2capChannel inputStream];
        v28 = [(ISO18013_3_Peripheral *)self queue];
        CFReadStreamSetDispatchQueue(v27, v28);

        v29 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
        [v29 setDelegate:0];

        v30 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
        [v30 close];

        v31 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
        v32 = [(ISO18013_3_Peripheral *)self queue];
        CFWriteStreamSetDispatchQueue(v31, v32);

        v33 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
        [v33 setDelegate:0];

        v34 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
        [v34 close];

        v35 = self->_l2capChannel;
        self->_l2capChannel = 0;
      }
      dispatch_time_t v36 = dispatch_time(0, 1000000000);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001FFDC;
      block[3] = &unk_100054D80;
      block[4] = self;
      block[5] = v24;
      dispatch_after(v36, queue, block);
    }
  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:didReceiveWriteRequests:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  id v44 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v44)
  {
    id v8 = &AnalyticsSendEventLazy_ptr;
    uint64_t v43 = *(void *)v46;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v9);
        uint64_t v11 = [v10 value];
        uint64_t v12 = [v10 characteristic];
        v13 = [v12 UUID];
        v14 = v8[197];
        v15 = [(ISO18013_3_Peripheral *)self getStateCharacteristicUUID];
        unsigned int v16 = [v14 UUIDWithString:v15];
        unsigned int v17 = [v13 isEqual:v16];

        if (v17)
        {
          uint64_t v18 = [v10 value];
          id v19 = [v18 length];

          if (v19)
          {
            id v20 = [v10 value];
            int v21 = *(unsigned __int8 *)[v20 bytes];

            if (v21 == 2)
            {
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didReceiveWriteRequests:]", 150, self, @"LE: Rcv End State", v22, v23, v40);
              self->_isoConnectionState = 2;
              if (sub_10001AC44((os_unfair_lock_s *)self->_sender)) {
                uint64_t v38 = 5;
              }
              else {
                uint64_t v38 = 0;
              }
              [(ISO18013_3_Peripheral *)self _activateDisconnectBlock:v38];
            }
            else if (v21 == 1)
            {
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didReceiveWriteRequests:]", 146, self, @"LE: Rcv Start State", v22, v23, v40);
              self->_isoConnectionState = 1;
              [(ISO18013_3_Peripheral *)self setReady];
            }
          }
        }
        else
        {
          uint64_t v24 = [v10 characteristic];
          v25 = [v24 UUID];
          v26 = v8[197];
          v27 = [(ISO18013_3_Peripheral *)self getIncomingDataCharacteristicUUID];
          v28 = [v26 UUIDWithString:v27];
          unsigned int v29 = [v25 isEqual:v28];

          if (v29)
          {
            readers = self->_readers;
            v33 = [v10 central];
            LOBYTE(readers) = [(NSMutableArray *)readers containsObject:v33];

            if (readers)
            {
              LOBYTE(state.opaque[0]) = 0;
              id v34 = v11;
              v35 = -[ISO18013_3_Peripheral _extractFromMessage:length:lastPacket:](self, "_extractFromMessage:length:lastPacket:", [v34 bytes], objc_msgSend(v34, "length"), &state);
              [(ISO18013_3_Peripheral *)self _activateRxCallbackWithData:v35 lastPacket:LOBYTE(state.opaque[0])];
            }
            else
            {
              [v41 respondToRequest:v10 withResult:3];
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didReceiveWriteRequests:]", 162, self, @"LE: Rcv data but Reader is not tracked", v36, v37, v40);
            }
          }
          else
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didReceiveWriteRequests:]", 170, self, @"LE: didReceiveWriteRequests : unknown request\n%@", v30, v31, (uint64_t)v10);
          }
          id v8 = &AnalyticsSendEventLazy_ptr;
        }

        v9 = (char *)v9 + 1;
      }
      while (v44 != v9);
      id v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      id v44 = v39;
    }
    while (v39);
  }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4 = _os_activity_create((void *)&_mh_execute_header, "peripheralManagerIsReadyToUpdateSubscribers:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);
  os_activity_scope_leave(&v12);

  sub_10001ACF0((uint64_t)self->_sender, v5, v6, v7, v8, v9, v10, v11, v12.opaque[0]);
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:didPublishL2CAPChannel:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didPublishL2CAPChannel:error:]", 186, self, @"LE: didPublishL2CAPChannel : 0x%X (error = %@)", v9, v10, v5);
  if (!v7) {
    [(ISO18013_3_Peripheral *)self setL2CapPSM:v5];
  }
  uint64_t v11 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
  [v11 lock];

  os_activity_scope_state_s v12 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
  [v12 broadcast];

  v13 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
  [v13 unlock];
}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  unsigned int v5 = a4;
  id v7 = a5;
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:didUnpublishL2CAPChannel:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didUnpublishL2CAPChannel:error:]", 198, self, @"LE: didUnpublishL2CAPChannel : %d (error = %@)", v9, v10, v5);
}

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = (CBL2CAPChannel *)a4;
  id v8 = a5;
  uint64_t v9 = _os_activity_create((void *)&_mh_execute_header, "peripheralManager:didOpenL2CAPChannel:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  uint64_t v10 = sub_1000261A8();
  if (os_signpost_enabled(v10))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DidOpenLCAPChannel", "", (uint8_t *)&state, 2u);
  }

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral peripheralManager:didOpenL2CAPChannel:error:]", 206, self, @"LE: didOpenL2CAPChannel : %@ (error = %@)", v11, v12, (uint64_t)v7);
  l2capChannel = self->_l2capChannel;
  self->_l2capChannel = v7;
  v14 = v7;

  v15 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
  unsigned int v16 = [(ISO18013_3_Peripheral *)self queue];
  CFReadStreamSetDispatchQueue(v15, v16);

  unsigned int v17 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
  [v17 setDelegate:self];

  uint64_t v18 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
  [v18 open];

  id v19 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
  id v20 = [(ISO18013_3_Peripheral *)self queue];
  CFWriteStreamSetDispatchQueue(v19, v20);

  int v21 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
  [v21 setDelegate:self];

  uint64_t v22 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];

  [v22 open];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v8 = a3;
  if (a4 == 4)
  {
    uint64_t v10 = @"NSStreamEventHasSpaceAvailable";
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint64_t v12 = 228;
LABEL_6:
    sub_100025F04(v11, 0, (uint64_t)"-[ISO18013_3_Peripheral stream:handleEvent:]", v12, self, v10, v6, v7, v13);
    goto LABEL_7;
  }
  if (a4 != 2)
  {
    unint64_t v13 = a4;
    uint64_t v10 = @"LE: Stream event %lu on %@";
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint64_t v12 = 230;
    goto LABEL_6;
  }
  bzero(v15, 0x400uLL);
  unsigned __int8 v14 = 0;
  uint64_t v9 = -[ISO18013_3_Peripheral _extractFromMessage:length:lastPacket:](self, "_extractFromMessage:length:lastPacket:", v15, [v8 read:v15 maxLength:1024], &v14);
  [(ISO18013_3_Peripheral *)self _activateRxCallbackWithData:v9 lastPacket:v14];

LABEL_7:
}

- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5
{
  return 0;
}

- (id)getIncomingDataCharacteristicUUID
{
  return 0;
}

- (id)getStateCharacteristicUUID
{
  return 0;
}

- (id)getL2CAPCharacteristicUUID
{
  return 0;
}

- (BOOL)getL2CAPEnable
{
  return 0;
}

- (id)getCharacteristic:(id)a3
{
  id v6 = a3;
  iso18Characteristics = self->_iso18Characteristics;
  if (iso18Characteristics)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = iso18Characteristics;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          unsigned __int8 v14 = objc_msgSend(v13, "UUID", (void)v19);
          v15 = +[CBUUID UUIDWithString:v6];
          unsigned __int8 v16 = [v14 isEqual:v15];

          if (v16)
          {
            id v17 = v13;

            goto LABEL_14;
          }
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Peripheral getCharacteristic:]", 263, self, @"LE: No GATT", v4, v5, v19);
  }
  id v17 = 0;
LABEL_14:

  return v17;
}

- (void)_startAdvertising:(id)a3 prioritizedCentralAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length]) {
    [(CBPeripheralManager *)self->_peripheralManager incomingAddress:v7];
  }
  peripheralManager = self->_peripheralManager;
  id v11 = v6;
  v12[0] = CBAdvertisementDataServiceUUIDsKey;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  v12[1] = CBOptionUseCase;
  v13[0] = v9;
  v13[1] = &off_10005AE78;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [(CBPeripheralManager *)peripheralManager startAdvertising:v10];
}

- (ISO18013_3_Peripheral)initWithWorkQueue:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ISO18013_3_Peripheral;
  id v9 = [(ISO18013_3_Peripheral *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a4);
    uint64_t v11 = objc_opt_new();
    readers = v10->_readers;
    v10->_readers = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_queue, a3);
    uint64_t v13 = objc_opt_new();
    peripheralCallbackLock = v10->_peripheralCallbackLock;
    v10->_peripheralCallbackLock = (NSCondition *)v13;

    v15 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    rxBuffer = v10->_rxBuffer;
    v10->_rxBuffer = v15;
  }
  return v10;
}

- (BOOL)advertise:(id)a3 readerIdentCharacteristic:(id)a4 centralAddress:(id)a5 onDeviceConnection:(id)a6 onDisconnect:(id)a7 onDataRx:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a7;
  id v19 = objc_retainBlock(a6);
  id connectionBlock = self->_connectionBlock;
  self->_id connectionBlock = v19;

  id v21 = objc_retainBlock(v18);
  disid connectionBlock = self->_disconnectionBlock;
  self->_disid connectionBlock = v21;

  if (![(ISO18013_3_Peripheral *)self _startCBPeripheralManager]) {
    goto LABEL_7;
  }
  if (![(ISO18013_3_Peripheral *)self createGATTServer:self->_peripheralManager serviceUUID:v14 readerIdentCharacteristic:v15])
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Peripheral advertise:readerIdentCharacteristic:centralAddress:onDeviceConnection:onDisconnect:onDataRx:]", 318, self, @"LE: Failed to create GATT server", v23, v24, v38);
LABEL_7:
    id v35 = self->_connectionBlock;
    self->_id connectionBlock = 0;

    id v36 = self->_disconnectionBlock;
    self->_disid connectionBlock = 0;

    BOOL v34 = 0;
    goto LABEL_8;
  }
  v25 = sub_1000261A8();
  if (os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(self);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_CreatedGATTServer", "class=%s", buf, 0xCu);
  }

  v26 = +[CBUUID UUIDWithData:v14];
  advertiseServiceUUID = self->_advertiseServiceUUID;
  self->_advertiseServiceUUID = v26;

  id v28 = objc_retainBlock(v17);
  id rxBlock = self->_rxBlock;
  self->_id rxBlock = v28;

  uint64_t v30 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  rxBuffer = self->_rxBuffer;
  self->_rxBuffer = v30;

  objc_storeStrong((id *)&self->_identCharacteristicValue, a4);
  [(ISO18013_3_Peripheral *)self _startAdvertising:self->_advertiseServiceUUID prioritizedCentralAddress:v16];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral advertise:readerIdentCharacteristic:centralAddress:onDeviceConnection:onDisconnect:onDataRx:]", 336, self, @"LE: advertising UUID: %@", v32, v33, (uint64_t)self->_advertiseServiceUUID);
  BOOL v34 = 1;
LABEL_8:

  return v34;
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3
{
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4
{
  id v7 = [(ISO18013_3_Peripheral *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020FEC;
  block[3] = &unk_100054F10;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(v7, block);
}

- (int64_t)hardwareAvailable
{
  if (![(ISO18013_3_Peripheral *)self _startCBPeripheralManager]) {
    return 0;
  }
  int v3 = 4;
  int64_t v4 = 2;
  while (1)
  {
    uint64_t v5 = (uint64_t)[(CBPeripheralManager *)self->_peripheralManager state];
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Peripheral hardwareAvailable]", 373, self, @"%ld", v6, v7, v5);
    if (v5 == 4) {
      break;
    }
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      return 0;
    }
    if (v5 == 5) {
      return 1;
    }
    id v8 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v8 lock];

    BOOL v9 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v9 wait];

    id v10 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v10 unlock];

    if (--v3 <= 1) {
      return 0;
    }
  }
  return v4;
}

+ (id)getAddress
{
  v2 = dispatch_get_global_queue(33, 0);
  id v3 = [objc_alloc((Class)CBPeripheralManager) initWithDelegate:0 queue:v2];
  int64_t v4 = sub_100030048((id *)[BTAddressUpdateObserver alloc], v3);
  uint64_t v5 = sub_1000302CC(v4);
  sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[ISO18013_3_Peripheral getAddress]", 399, @"LE: address=%@", v6, v7, v8, (uint64_t)v5);

  return v5;
}

- (BOOL)writeData:(id)a3 toUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_100021620;
  v38[4] = sub_100021630;
  id v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100021620;
  id v36 = sub_100021630;
  id v37 = 0;
  uint64_t v28 = 0;
  unsigned int v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100021620;
  v26[4] = sub_100021630;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100021620;
  v24[4] = sub_100021630;
  id v25 = 0;
  uint64_t v8 = [(ISO18013_3_Peripheral *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021638;
  block[3] = &unk_100054F38;
  block[4] = self;
  id v19 = &v28;
  long long v20 = v38;
  id v9 = v7;
  id v18 = v9;
  id v21 = &v32;
  long long v22 = v26;
  uint64_t v23 = v24;
  dispatch_sync(v8, block);

  if (*((unsigned char *)v29 + 24))
  {
    uint64_t v10 = v33[5];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021950;
    v16[3] = &unk_100054F60;
    v16[4] = v26;
    v16[5] = v38;
    v16[6] = v24;
    char v11 = sub_10001A530(v10, v6, v16);
    *((unsigned char *)v29 + 24) = v11;
    uint64_t v12 = [(ISO18013_3_Peripheral *)self queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002197C;
    v15[3] = &unk_1000549A8;
    v15[4] = self;
    dispatch_sync(v12, v15);

    BOOL v13 = *((unsigned char *)v29 + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
  return v13;
}

- (void)setCharacteristics:(id)a3
{
}

- (id)getBluetoothStatusDict:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100021620;
  char v11 = sub_100021630;
  id v12 = 0;
  peripheralManager = self->_peripheralManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021AAC;
  v6[3] = &unk_100054F88;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(CBPeripheralManager *)peripheralManager queryBluetoothStatus:&off_10005B0C8 completion:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_startCBPeripheralManager
{
  if (self->_peripheralManager) {
    return 1;
  }
  id v3 = (CBPeripheralManager *)[objc_alloc((Class)CBPeripheralManager) initWithDelegate:self queue:self->_queue];
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v3;

  if (self->_peripheralManager)
  {
    uint64_t v7 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v7 lock];

    uint64_t v8 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v8 wait];

    uint64_t v9 = [(ISO18013_3_Peripheral *)self peripheralCallbackLock];
    [v9 unlock];

    return 1;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Peripheral _startCBPeripheralManager]", 527, self, @"LE: Failed to create peripheral", v5, v6, v11);
  return 0;
}

- (void)_activateConnectionBlock:(unint64_t)a3 connectionState:(BOOL)a4
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral _activateConnectionBlock:connectionState:]", 539, self, @"LE: status=%lu, isConnected=%d", v4, v5, a3);
  if (self->_connectionBlock)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Peripheral _activateConnectionBlock:connectionState:]", 541, self, @"LE: Activate connect block", v9, v10, v15);
    self->_isConnected = a4;
    id v11 = objc_retainBlock(self->_connectionBlock);
    id connectionBlock = self->_connectionBlock;
    self->_id connectionBlock = 0;

    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021D4C;
    block[3] = &unk_100054FB0;
    id v17 = v11;
    unint64_t v18 = a3;
    id v14 = v11;
    dispatch_async(clientQueue, block);
  }
}

- (void)_activateDisconnectBlock:(unint64_t)a3
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral _activateDisconnectBlock:]", 552, self, &stru_100055900, v3, v4, v13);
  if (self->_disconnectionBlock)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Peripheral _activateDisconnectBlock:]", 554, self, @"LE: Activate disconnect block, status=%lu", v7, v8, a3);
    self->_isConnected = 0;
    id v9 = objc_retainBlock(self->_disconnectionBlock);
    disid connectionBlock = self->_disconnectionBlock;
    self->_disid connectionBlock = 0;

    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021E70;
    block[3] = &unk_100054FB0;
    id v15 = v9;
    unint64_t v16 = a3;
    id v12 = v9;
    dispatch_async(clientQueue, block);
  }
}

- (void)_activateRxCallbackWithData:(id)a3 lastPacket:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSMutableData *)self->_rxBuffer appendData:a3];
  if (v4)
  {
    if (self->_rxBlock)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021F4C;
      block[3] = &unk_1000549A8;
      void block[4] = self;
      dispatch_async(clientQueue, block);
    }
    else
    {
      self->_rxBuffer = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      _objc_release_x1();
    }
  }
}

- (void)_signalConnectionStateChange:(unsigned __int8)a3
{
  unsigned __int8 v15 = a3;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral _signalConnectionStateChange:]", 581, self, @"LE: ConnectionStateChange=%d", v3, v4, a3);
  uint64_t v6 = +[NSData dataWithBytes:&v15 length:1];
  peripheralManager = self->_peripheralManager;
  uint64_t v8 = [(ISO18013_3_Peripheral *)self getStateCharacteristicUUID];
  id v9 = [(ISO18013_3_Peripheral *)self getCharacteristic:v8];
  [(CBPeripheralManager *)peripheralManager updateValue:v6 forCharacteristic:v9 onSubscribedCentrals:self->_readers];

  if (v15 == 2)
  {
    uint64_t v10 = sub_1000261A8();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      id v11 = "BT_StateUpdate02";
      id v12 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v15 == 1)
  {
    uint64_t v10 = sub_1000261A8();
    if (os_signpost_enabled(v10))
    {
      __int16 v14 = 0;
      id v11 = "BT_StateUpdate01";
      id v12 = (uint8_t *)&v14;
LABEL_7:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, "", v12, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setReady
{
  if (!self->_isConnected && [(NSMutableArray *)self->_readers count] && self->_isoConnectionState == 1)
  {
    [(ISO18013_3_Peripheral *)self _activateConnectionBlock:0 connectionState:1];
  }
}

- (id)_extractFromMessage:(const char *)a3 length:(unint64_t)a4 lastPacket:(BOOL *)a5
{
  *a5 = 0;
  if (*a3 == 1) {
    goto LABEL_4;
  }
  if (!*a3)
  {
    *a5 = 1;
LABEL_4:
    uint64_t v7 = +[NSData dataWithBytes:a3 + 1 length:a4 - 1];
    goto LABEL_6;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Peripheral _extractFromMessage:length:lastPacket:]", 618, self, @"Unexpected header byte: 0x%X.  Dropping data", v5, v6, *(unsigned __int8 *)a3);
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (CBUUID)advertiseServiceUUID
{
  return self->_advertiseServiceUUID;
}

- (void)setAdvertiseServiceUUID:(id)a3
{
}

- (NSData)identCharacteristicValue
{
  return self->_identCharacteristicValue;
}

- (void)setIdentCharacteristicValue:(id)a3
{
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (CBMutableService)iso18Service
{
  return self->_iso18Service;
}

- (void)setIso18Service:(id)a3
{
}

- (NSMutableArray)iso18Characteristics
{
  return self->_iso18Characteristics;
}

- (void)setIso18Characteristics:(id)a3
{
}

- (NSMutableArray)readers
{
  return self->_readers;
}

- (void)setReaders:(id)a3
{
}

- (BLESender)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
}

- (unsigned)l2CapPSM
{
  return self->_l2CapPSM;
}

- (void)setL2CapPSM:(unsigned __int16)a3
{
  self->_l2CapPSM = a3;
}

- (id)rxBlock
{
  return self->_rxBlock;
}

- (void)setRxBlock:(id)a3
{
}

- (id)connectionBlock
{
  return self->_connectionBlock;
}

- (void)setConnectionBlock:(id)a3
{
}

- (id)disconnectionBlock
{
  return self->_disconnectionBlock;
}

- (void)setDisconnectionBlock:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSCondition)peripheralCallbackLock
{
  return self->_peripheralCallbackLock;
}

- (void)setPeripheralCallbackLock:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSMutableData)rxBuffer
{
  return self->_rxBuffer;
}

- (void)setRxBuffer:(id)a3
{
}

- (unsigned)isoConnectionState
{
  return self->_isoConnectionState;
}

- (void)setIsoConnectionState:(unsigned __int8)a3
{
  self->_isoConnectionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxBuffer, 0);
  objc_storeStrong((id *)&self->_peripheralCallbackLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong(&self->_disconnectionBlock, 0);
  objc_storeStrong(&self->_connectionBlock, 0);
  objc_storeStrong(&self->_rxBlock, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_readers, 0);
  objc_storeStrong((id *)&self->_iso18Characteristics, 0);
  objc_storeStrong((id *)&self->_iso18Service, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_identCharacteristicValue, 0);

  objc_storeStrong((id *)&self->_advertiseServiceUUID, 0);
}

@end