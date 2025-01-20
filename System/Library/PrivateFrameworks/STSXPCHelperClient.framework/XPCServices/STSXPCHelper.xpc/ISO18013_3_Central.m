@interface ISO18013_3_Central
- (BLESender)sender;
- (BOOL)_startCBCentralManager;
- (BOOL)connectBLEAddress:(id)a3 advertiseServiceUUID:(id)a4 readerIdentCharacteristic:(id)a5 onDeviceConnection:(id)a6 onDisconnect:(id)a7 onDataRx:(id)a8;
- (BOOL)connectPeripheral:(id)a3 delay:(unsigned __int8)a4;
- (BOOL)discoverMDOCServiceCharacteristics:(id)a3;
- (BOOL)invalidated;
- (BOOL)isConnected;
- (BOOL)setupGATTServerCharacteristics:(id)a3;
- (BOOL)writeData:(id)a3 toUUID:(id)a4;
- (BOOL)writeL2CAPData:(id)a3;
- (CBCentralManager)centralManager;
- (CBL2CAPChannel)l2capChannel;
- (CBPeripheral)remoteReader;
- (CBService)readerService;
- (CBUUID)peripheralServiceUUID;
- (ISO18013_3_Central)initWithWorkQueue:(id)a3 callbackQueue:(id)a4;
- (NSCondition)centralCallbackLock;
- (NSData)readerIdentCharacteristic;
- (NSData)remoteBLEAddress;
- (NSMutableArray)discoveredReaders;
- (NSMutableData)rxBuffer;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)queue;
- (id)_extractFromMessage:(const char *)a3 length:(unint64_t)a4 lastPacket:(BOOL *)a5;
- (id)connectionBlock;
- (id)disconnectionBlock;
- (id)getBluetoothStatusDict:(id *)a3;
- (id)getCharacteristic:(id)a3;
- (id)getIdentifierCharacteristicUUID;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getOutgoingDataCharacteristicUUID;
- (id)getStateCharacteristicUUID;
- (id)rxBlock;
- (int64_t)hardwareAvailable;
- (unint64_t)expectedCharacteristicReadOnStartup;
- (unint64_t)peripheralL2CapState;
- (unint64_t)peripheralReaderIdentState;
- (void)_activateConnectionBlock:(unint64_t)a3 connectionState:(BOOL)a4;
- (void)_activateDisconnectBlock:(unint64_t)a3;
- (void)_activateRxCallbackWithData:(id)a3 lastPacket:(BOOL)a4;
- (void)_signalConnectionStateChange:(unsigned __int8)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4;
- (void)invalidatePeripheral;
- (void)openL2CAP:(unsigned __int16)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3;
- (void)queryBLEGATTServer:(id)a3;
- (void)receivedData:(id)a3;
- (void)setCentralCallbackLock:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setConnectionBlock:(id)a3;
- (void)setDisconnectionBlock:(id)a3;
- (void)setDiscoveredReaders:(id)a3;
- (void)setExpectedCharacteristicReadOnStartup:(unint64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setL2capChannel:(id)a3;
- (void)setPeripheralL2CapState:(unint64_t)a3;
- (void)setPeripheralReaderIdentState:(unint64_t)a3;
- (void)setPeripheralServiceUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReaderIdentCharacteristic:(id)a3;
- (void)setReaderService:(id)a3;
- (void)setReady;
- (void)setRemoteBLEAddress:(id)a3;
- (void)setRemoteReader:(id)a3;
- (void)setRxBlock:(id)a3;
- (void)setRxBuffer:(id)a3;
- (void)setSender:(id)a3;
- (void)stateChanged:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation ISO18013_3_Central

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "centralManagerDidUpdateState:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [v4 state];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central centralManagerDidUpdateState:]", 62, self, @"LE: centralManagerDidUpdateState : %ld", v7, v8, (uint64_t)v6);
  if ([v4 state] == (id)1)
  {
    v9 = [(NSMutableArray *)self->_discoveredReaders firstObject];
    uint64_t v10 = 1;
LABEL_5:
    v11 = +[NSError errorWithDomain:@"BluetoothDomain" code:v10 userInfo:0];
    v17[0] = NSLocalizedDescriptionKey;
    v17[1] = NSUnderlyingErrorKey;
    state.opaque[0] = @"Bluetooth specific error";
    state.opaque[1] = (uint64_t)v11;
    v12 = +[NSDictionary dictionaryWithObjects:&state forKeys:v17 count:2];
    v13 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v12];

    [(ISO18013_3_Central *)self centralManager:v4 didDisconnectPeripheral:v9 error:v13];
    goto LABEL_6;
  }
  if ([v4 state] == (id)4)
  {
    v9 = [(NSMutableArray *)self->_discoveredReaders firstObject];
    uint64_t v10 = 0;
    goto LABEL_5;
  }
LABEL_6:
  v14 = [(ISO18013_3_Central *)self centralCallbackLock];
  [v14 lock];

  v15 = [(ISO18013_3_Central *)self centralCallbackLock];
  [v15 broadcast];

  v16 = [(ISO18013_3_Central *)self centralCallbackLock];
  [v16 unlock];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "centralManager:didDiscoverPeripheral:advertisementData:RSSI:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v11 = sub_1000261A8();
  if (os_signpost_enabled(v11))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DiscoveredPeripheral", "", (uint8_t *)&state, 2u);
  }

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 84, self, @"LE: found device matching UUID %@ !", v12, v13, (uint64_t)v9);
  [(NSMutableArray *)self->_discoveredReaders addObject:v8];
  if (!self->_remoteReader)
  {
    [(CBCentralManager *)self->_centralManager stopScan];
    [(ISO18013_3_Central *)self connectPeripheral:v8 delay:0];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "centralManager:didConnectPeripheral:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = [v7 state];
  [v6 state];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central centralManager:didConnectPeripheral:]", 95, self, @"LE: State=(central: %ld, peripheral: %ld)", v10, v11, (uint64_t)v9);
  [(ISO18013_3_Central *)self queryBLEGATTServer:v6];
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _os_activity_create((void *)&_mh_execute_header, "centralManager:didiFailToConnectPeripheral:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  id v12 = [v10 state];
  [v9 state];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central centralManager:didFailToConnectPeripheral:error:]", 104, self, @"LE: State=(central: %ld, peripheral: %ld) (error %@)", v13, v14, (uint64_t)v12);

  remoteReader = self->_remoteReader;
  self->_remoteReader = 0;

  [(ISO18013_3_Central *)self connectPeripheral:v9 delay:1];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _os_activity_create((void *)&_mh_execute_header, "centralManager:didDisconnectPeripheral:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  id v12 = sub_1000261A8();
  if (os_signpost_enabled(v12))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_PeripheralDisconnected", "", (uint8_t *)&state, 2u);
  }

  id v13 = [v10 state];
  [v9 state];

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central centralManager:didDisconnectPeripheral:error:]", 115, self, @"LE: State=(central: %ld, peripheral: %ld) (error %@)", v14, v15, (uint64_t)v13);
  unsigned int v16 = sub_10001AC44((os_unfair_lock_s *)self->_sender);
  sub_10001ABC0(self->_sender, v17, v18, v19, v20, v21, v22, v23);
  sender = self->_sender;
  self->_sender = 0;

  objc_storeWeak((id *)&self->_readerService, 0);
  remoteReader = self->_remoteReader;
  self->_remoteReader = 0;

  readerIdentCharacteristic = self->_readerIdentCharacteristic;
  self->_readerIdentCharacteristic = 0;

  self->_peripheralL2CapState = 0;
  self->_peripheralReaderIdentState = 0;
  if (self->_l2capChannel)
  {
    v27 = [(ISO18013_3_Central *)self l2capChannel];
    v28 = [v27 inputStream];
    v29 = [(ISO18013_3_Central *)self queue];
    CFReadStreamSetDispatchQueue(v28, v29);

    v30 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
    [v30 setDelegate:0];

    v31 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
    [v31 close];

    v32 = [(ISO18013_3_Central *)self l2capChannel];
    v33 = [v32 outputStream];
    v34 = [(ISO18013_3_Central *)self queue];
    CFWriteStreamSetDispatchQueue(v33, v34);

    v35 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
    [v35 setDelegate:0];

    v36 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
    [v36 close];

    l2capChannel = self->_l2capChannel;
    self->_l2capChannel = 0;
  }
  v38 = [v8 domain];
  unsigned int v39 = [v38 isEqualToString:@"BluetoothDomain"];

  if (v39)
  {
    v40 = [v8 userInfo];
    v41 = [v40 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v41)
    {
      id v42 = [v41 code];
      uint64_t v43 = 5;
      if (!v16) {
        uint64_t v43 = 1;
      }
      if (v42) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = 4;
      }
    }
    else
    {
      uint64_t v44 = 1;
    }
  }
  else
  {
    uint64_t v44 = v8 != 0;
  }
  [(ISO18013_3_Central *)self _activateDisconnectBlock:v44];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = _os_activity_create((void *)&_mh_execute_header, "peripheral:ididDiscoverCharacteristicsForService:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  if (v8) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didDiscoverCharacteristicsForService:error:]", 162, self, @"LE: error %@", v10, v11, (uint64_t)v8);
  }
  id v12 = [v7 UUID];
  unsigned int v13 = [v12 isEqual:self->_peripheralServiceUUID];

  if (v13 && ![(ISO18013_3_Central *)self setupGATTServerCharacteristics:v7]) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didDiscoverCharacteristicsForService:error:]", 167, self, @"LE: Failed to setup ISO characteristics...", v14, v15, v16);
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "perihperal:didDiscoverServices:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if (v7) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didDiscoverServices:]", 176, self, @"LE: error %@", v9, v10, (uint64_t)v7);
  }
  if (![(ISO18013_3_Central *)self discoverMDOCServiceCharacteristics:v6])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didDiscoverServices:]", 180, self, @"LE: No ISO services...", v11, v12, v13);
    [(NSMutableArray *)self->_discoveredReaders removeObject:v6];
    [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:v6];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v5 = a3;
  id v6 = _os_activity_create((void *)&_mh_execute_header, "peripheral:didModifyServices:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);
  os_activity_scope_leave(&v9);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didModifyServices:]", 188, self, @"LE: didModifyServices", v7, v8, v9.opaque[0]);
  objc_storeWeak((id *)&self->_readerService, 0);
  [(ISO18013_3_Central *)self queryBLEGATTServer:v5];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create((void *)&_mh_execute_header, "periphperal:didUpdateValueForCharacteristic:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (v10) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didUpdateValueForCharacteristic:error:]", 198, self, @"LE: didUpdateValueForCharacteristic : %@ (error %@)", v12, v13, (uint64_t)v9);
  }
  uint64_t v14 = [v9 UUID];
  uint64_t v15 = [(ISO18013_3_Central *)self getStateCharacteristicUUID];
  uint64_t v16 = +[CBUUID UUIDWithString:v15];
  unsigned int v17 = [v14 isEqual:v16];

  if (v17)
  {
    [(ISO18013_3_Central *)self stateChanged:v9];
    goto LABEL_20;
  }
  uint64_t v18 = [v9 UUID];
  uint64_t v19 = [(ISO18013_3_Central *)self getIncomingDataCharacteristicUUID];
  uint64_t v20 = +[CBUUID UUIDWithString:v19];
  unsigned int v21 = [v18 isEqual:v20];

  if (v21)
  {
    [(ISO18013_3_Central *)self receivedData:v9];
    goto LABEL_20;
  }
  uint64_t v22 = [v9 UUID];
  uint64_t v23 = [(ISO18013_3_Central *)self getL2CAPCharacteristicUUID];
  v24 = +[CBUUID UUIDWithString:v23];
  unsigned int v25 = [v22 isEqual:v24];

  if (v25)
  {
    if (self->_peripheralL2CapState == 1)
    {
      self->_peripheralL2CapState = 2;
      unint64_t expectedCharacteristicReadOnStartup = self->_expectedCharacteristicReadOnStartup;
      if (expectedCharacteristicReadOnStartup) {
        self->_unint64_t expectedCharacteristicReadOnStartup = expectedCharacteristicReadOnStartup - 1;
      }
      else {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didUpdateValueForCharacteristic:error:]", 214, self, @"Unexpected underflow", v26, v27, v43);
      }
      v34 = @"L2CAP not supported";
      os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
      uint64_t v36 = 217;
    }
    else
    {
      v34 = @"LE: Unexpected state";
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      uint64_t v36 = 207;
    }
    goto LABEL_19;
  }
  v29 = [v9 UUID];
  v30 = [(ISO18013_3_Central *)self getIdentifierCharacteristicUUID];
  v31 = +[CBUUID UUIDWithString:v30];
  unsigned int v32 = [v29 isEqual:v31];

  if (!v32) {
    goto LABEL_20;
  }
  if (self->_peripheralReaderIdentState != 1)
  {
    v34 = @"LE: Unexpected state";
    os_log_type_t v35 = OS_LOG_TYPE_ERROR;
    uint64_t v36 = 229;
LABEL_19:
    sub_100025F04(v35, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didUpdateValueForCharacteristic:error:]", v36, self, v34, v26, v27, v43);
    goto LABEL_20;
  }
  self->_peripheralReaderIdentState = 2;
  unint64_t v33 = self->_expectedCharacteristicReadOnStartup;
  if (v33) {
    self->_unint64_t expectedCharacteristicReadOnStartup = v33 - 1;
  }
  else {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didUpdateValueForCharacteristic:error:]", 236, self, @"Unexpected underflow", v26, v27, v43);
  }
  readerIdentCharacteristic = self->_readerIdentCharacteristic;
  if (!readerIdentCharacteristic)
  {
    v34 = @"Skipping reader Ident verification.";
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    uint64_t v36 = 240;
    goto LABEL_19;
  }
  v38 = [v9 value];
  unsigned int v39 = [(NSData *)readerIdentCharacteristic isEqualToData:v38];

  if (v39)
  {
    [(ISO18013_3_Central *)self setReady];
  }
  else
  {
    v40 = [v9 value];
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didUpdateValueForCharacteristic:error:]", 247, self, @"LE: Mismatch reader Ident value: %@", v41, v42, (uint64_t)v40);

    [(NSMutableArray *)self->_discoveredReaders removeObject:v8];
    [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:v8];
  }
LABEL_20:
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  id v4 = _os_activity_create((void *)&_mh_execute_header, "perihperalIsReadyToSendWriteWithoutResponse:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);
  os_activity_scope_leave(&v12);

  sub_10001ACF0((uint64_t)self->_sender, v5, v6, v7, v8, v9, v10, v11, v12.opaque[0]);
}

- (void)openL2CAP:(unsigned __int16)a3
{
  uint64_t v5 = a3;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central openL2CAP:]", 267, self, @"LE: opening L2CAP 0x%X", v3, v4, a3);
  remoteReader = self->_remoteReader;

  [(CBPeripheral *)remoteReader openL2CAPChannel:v5];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v8 = a3;
  if (a4 == 4)
  {
    os_activity_scope_state_s v12 = @"NSStreamEventHasSpaceAvailable";
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint64_t v14 = 281;
LABEL_6:
    sub_100025F04(v13, 0, (uint64_t)"-[ISO18013_3_Central stream:handleEvent:]", v14, self, v12, v6, v7, v15);
    goto LABEL_7;
  }
  if (a4 != 2)
  {
    unint64_t v15 = a4;
    os_activity_scope_state_s v12 = @"LE: Stream event %lu on %@";
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint64_t v14 = 283;
    goto LABEL_6;
  }
  bzero(v17, 0x400uLL);
  unsigned __int8 v16 = 0;
  uint64_t v9 = -[ISO18013_3_Central _extractFromMessage:length:lastPacket:](self, "_extractFromMessage:length:lastPacket:", v17, [v8 read:v17 maxLength:1024], &v16);
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central stream:handleEvent:]", 278, self, @"LE: L2CAP RX> %@", v10, v11, (uint64_t)v9);
  [(ISO18013_3_Central *)self _activateRxCallbackWithData:v9 lastPacket:v16];

LABEL_7:
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "peripheral:didOpenL2CAPChannel:error:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didOpenL2CAPChannel:error:]", 291, self, @"LE: didOpenL2CAPChannel : %@ (error = %@)", v11, v12, (uint64_t)v8);
  if (v9)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central peripheral:didOpenL2CAPChannel:error:]", 294, self, @"Fallback to GATT??", v13, v14, v26);
  }
  else
  {
    objc_storeStrong((id *)&self->_l2capChannel, a4);
    sender = self->_sender;
    self->_sender = 0;

    unsigned __int8 v16 = [(ISO18013_3_Central *)self l2capChannel];
    unsigned int v17 = [v16 inputStream];
    uint64_t v18 = [(ISO18013_3_Central *)self queue];
    CFReadStreamSetDispatchQueue(v17, v18);

    uint64_t v19 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
    [v19 setDelegate:self];

    uint64_t v20 = [(CBL2CAPChannel *)self->_l2capChannel inputStream];
    [v20 open];

    unsigned int v21 = [(ISO18013_3_Central *)self l2capChannel];
    uint64_t v22 = [v21 outputStream];
    uint64_t v23 = [(ISO18013_3_Central *)self queue];
    CFWriteStreamSetDispatchQueue(v22, v23);

    v24 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
    [v24 setDelegate:self];

    unsigned int v25 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
    [v25 open];
  }
  [(ISO18013_3_Central *)self setReady];
}

- (BOOL)writeL2CAPData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
    id v7 = v4;
    uint64_t v8 = (uint64_t)objc_msgSend(v6, "write:maxLength:", &v5[(void)objc_msgSend(v7, "bytes")], (unsigned char *)objc_msgSend(v7, "length") - v5);

    v5 += v8;
    [v7 length];
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central writeL2CAPData:]", 321, self, @"LE: L2CAP Wrote %lu bytes out of %lu", v9, v10, v8);
  }
  while (v8);
  BOOL v11 = v5 == [v7 length];

  return v11;
}

- (void)receivedData:(id)a3
{
  [a3 value];
  unsigned __int8 v6 = 0;
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[ISO18013_3_Central _extractFromMessage:length:lastPacket:](self, "_extractFromMessage:length:lastPacket:", [v4 bytes], objc_msgSend(v4, "length"), &v6);
  [(ISO18013_3_Central *)self _activateRxCallbackWithData:v5 lastPacket:v6];
}

- (void)queryBLEGATTServer:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  id v5 = objc_alloc((Class)NSMutableArray);
  unsigned __int8 v6 = [(ISO18013_3_Central *)self peripheralServiceUUID];
  id v9 = objc_msgSend(v5, "initWithObjects:", v6, 0);

  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central queryBLEGATTServer:]", 341, self, @"LE: services=%@", v7, v8, (uint64_t)v9);
  [v4 discoverServices:v9];
}

- (BOOL)discoverMDOCServiceCharacteristics:(id)a3
{
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v35 = a3;
  id obj = [v35 services];
  id v4 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v9 = [v8 UUID];
        sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central discoverMDOCServiceCharacteristics:]", 347, self, @"service UUID: %@", v10, v11, (uint64_t)v9);

        uint64_t v12 = [v8 UUID];
        uint64_t v13 = [(ISO18013_3_Central *)self peripheralServiceUUID];
        unsigned int v14 = [v12 isEqual:v13];

        if (v14)
        {
          v34 = [(ISO18013_3_Central *)self getStateCharacteristicUUID];
          uint64_t v19 = +[CBUUID UUIDWithString:v34];
          v41[0] = v19;
          uint64_t v20 = [(ISO18013_3_Central *)self getOutgoingDataCharacteristicUUID];
          unsigned int v21 = +[CBUUID UUIDWithString:v20];
          v41[1] = v21;
          uint64_t v22 = [(ISO18013_3_Central *)self getIncomingDataCharacteristicUUID];
          uint64_t v23 = +[CBUUID UUIDWithString:v22];
          v41[2] = v23;
          v24 = +[NSArray arrayWithObjects:v41 count:3];
          unsigned int v25 = +[NSMutableArray arrayWithArray:v24];

          uint64_t v26 = [(ISO18013_3_Central *)self getIdentifierCharacteristicUUID];

          if (v26)
          {
            uint64_t v27 = [(ISO18013_3_Central *)self getIdentifierCharacteristicUUID];
            v28 = +[CBUUID UUIDWithString:v27];
            [v25 addObject:v28];
          }
          v29 = [(ISO18013_3_Central *)self getL2CAPCharacteristicUUID];

          if (v29)
          {
            v30 = [(ISO18013_3_Central *)self getL2CAPCharacteristicUUID];
            v31 = +[CBUUID UUIDWithString:v30];
            [v25 addObject:v31];
          }
          uint64_t v18 = v35;
          [v35 discoverCharacteristics:v25 forService:v8];
          objc_storeWeak((id *)&self->_readerService, v8);

          BOOL v17 = 1;
          goto LABEL_15;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central discoverMDOCServiceCharacteristics:]", 370, self, @"LE: Error : No ISO service", v15, v16, v33);
  BOOL v17 = 0;
  uint64_t v18 = v35;
LABEL_15:

  return v17;
}

- (BOOL)setupGATTServerCharacteristics:(id)a3
{
  id v4 = a3;
  v54 = [(ISO18013_3_Central *)self getIdentifierCharacteristicUUID];

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 379, self, @"LE: Setting up ISO reader characteristics...", v5, v6, v50);
  self->_unint64_t expectedCharacteristicReadOnStartup = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v51 = v4;
  id obj = [v4 characteristics];
  id v55 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  int v7 = 0;
  if (v55)
  {
    uint64_t v53 = *(void *)v57;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v57 != v53) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        unsigned int v10 = [v9 properties];
        uint64_t v11 = [v9 UUID];
        uint64_t v12 = [(ISO18013_3_Central *)self getStateCharacteristicUUID];
        uint64_t v13 = +[CBUUID UUIDWithString:v12];
        unsigned int v14 = [v11 isEqual:v13];

        if (v14)
        {
          if ((~v10 & 0x14) != 0)
          {
            uint64_t v15 = [v9 UUID];
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 389, self, @"LE: Error : %@ is not notify-able", v16, v17, (uint64_t)v15);
          }
          else
          {
            [(CBPeripheral *)self->_remoteReader setNotifyValue:1 forCharacteristic:v9];
            ++v7;
          }
        }
        uint64_t v18 = [v9 UUID];
        uint64_t v19 = [(ISO18013_3_Central *)self getOutgoingDataCharacteristicUUID];
        uint64_t v20 = +[CBUUID UUIDWithString:v19];
        unsigned int v21 = [v18 isEqual:v20];

        if (v21)
        {
          if ((v10 & 4) != 0)
          {
            ++v7;
          }
          else
          {
            uint64_t v22 = [v9 UUID];
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 398, self, @"LE: Error : %@ is not write-able", v23, v24, (uint64_t)v22);
          }
        }
        unsigned int v25 = [v9 UUID];
        uint64_t v26 = [(ISO18013_3_Central *)self getIncomingDataCharacteristicUUID];
        uint64_t v27 = +[CBUUID UUIDWithString:v26];
        unsigned int v28 = [v25 isEqual:v27];

        if (v28)
        {
          if ((v10 & 0x10) != 0)
          {
            [(CBPeripheral *)self->_remoteReader setNotifyValue:1 forCharacteristic:v9];
            ++v7;
          }
          else
          {
            v29 = [v9 UUID];
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 406, self, @"LE: Error : %@ is not notify-able", v30, v31, (uint64_t)v29);
          }
        }
        if (v54)
        {
          unsigned int v32 = [v9 UUID];
          uint64_t v33 = [(ISO18013_3_Central *)self getIdentifierCharacteristicUUID];
          v34 = +[CBUUID UUIDWithString:v33];
          unsigned int v35 = [v32 isEqual:v34];

          if (v35)
          {
            if ((v10 & 2) != 0)
            {
              ++v7;
              [(CBPeripheral *)self->_remoteReader readValueForCharacteristic:v9];
              unint64_t v39 = self->_expectedCharacteristicReadOnStartup + 1;
              self->_peripheralReaderIdentState = 1;
              self->_unint64_t expectedCharacteristicReadOnStartup = v39;
            }
            else
            {
              uint64_t v36 = [v9 UUID];
              sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 415, self, @"LE: Error : %@ is not read-able", v37, v38, (uint64_t)v36);
            }
          }
        }
        long long v40 = [v9 UUID];
        uint64_t v41 = [(ISO18013_3_Central *)self getL2CAPCharacteristicUUID];
        uint64_t v42 = +[CBUUID UUIDWithString:v41];
        unsigned int v43 = [v40 isEqual:v42];

        if (v43)
        {
          if ((v10 & 2) != 0)
          {
            [(CBPeripheral *)self->_remoteReader readValueForCharacteristic:v9];
            self->_peripheralL2CapState = 1;
            ++self->_expectedCharacteristicReadOnStartup;
          }
          else
          {
            uint64_t v44 = [v9 UUID];
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setupGATTServerCharacteristics:]", 427, self, @"LE: Error : %@ is not readable", v45, v46, (uint64_t)v44);
          }
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v55);
  }

  if (!self->_expectedCharacteristicReadOnStartup) {
    [(ISO18013_3_Central *)self setReady];
  }
  if (v54) {
    int v47 = 3;
  }
  else {
    int v47 = 2;
  }
  BOOL v48 = v7 > v47;

  return v48;
}

- (void)stateChanged:(id)a3
{
  id v10 = a3;
  id v4 = [v10 value];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central stateChanged:]", 450, self, @"LE: Remote state changed to %@", v5, v6, (uint64_t)v4);

  int v7 = [v10 value];
  if ([v7 length])
  {
    id v8 = [v10 value];
    int v9 = *(unsigned __int8 *)[v8 bytes];

    if (v9 == 2) {
      [(ISO18013_3_Central *)self invalidatePeripheral];
    }
  }
  else
  {
  }
}

- (void)invalidatePeripheral
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerService);
  id v4 = objc_msgSend(WeakRetained, "characteristics", 0);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isNotifying]) {
          [(CBPeripheral *)self->_remoteReader setNotifyValue:0 forCharacteristic:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:self->_remoteReader];
  remoteReader = self->_remoteReader;
  self->_remoteReader = 0;
}

- (void)setReady
{
  if (!self->_isConnected)
  {
    if (self->_expectedCharacteristicReadOnStartup)
    {
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central setReady]", 472, self, @"Pending reads not completed", v2, v3, v11);
    }
    else
    {
      id v5 = [(ISO18013_3_Central *)self getStateCharacteristicUUID];
      id v9 = [(ISO18013_3_Central *)self getCharacteristic:v5];

      if (v9)
      {
        [(ISO18013_3_Central *)self _activateConnectionBlock:0 connectionState:1];
        [(ISO18013_3_Central *)self _signalConnectionStateChange:1];
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central setReady]", 483, self, @"LE: Error : No ISO state characteristic", v6, v7, v8);
      }
    }
  }
}

- (id)getCharacteristic:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerService);
  uint64_t v8 = WeakRetained;
  if (self->_remoteReader) {
    BOOL v9 = WeakRetained == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central getCharacteristic:]", 491, self, @"LE: No remote", v6, v7, v21);
    id v10 = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = WeakRetained;
    uint64_t v11 = [WeakRetained characteristics];
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v17 = [v16 UUID];
          uint64_t v18 = +[CBUUID UUIDWithString:v4];
          unsigned __int8 v19 = [v17 isEqual:v18];

          if (v19)
          {
            id v10 = v16;

            goto LABEL_17;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v10 = 0;
LABEL_17:
    uint64_t v8 = v22;
  }

  return v10;
}

- (id)getStateCharacteristicUUID
{
  return 0;
}

- (id)getIdentifierCharacteristicUUID
{
  return 0;
}

- (id)getIncomingDataCharacteristicUUID
{
  return 0;
}

- (id)getOutgoingDataCharacteristicUUID
{
  return 0;
}

- (id)getL2CAPCharacteristicUUID
{
  return 0;
}

- (BOOL)connectPeripheral:(id)a3 delay:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central connectPeripheral:delay:]", 530, self, @"LE: Connecting to peripheral %@", v8, v9, (uint64_t)v7);
  if (!self->_remoteReader && self->_centralManager)
  {
    objc_storeStrong((id *)&self->_remoteReader, a3);
    centralManager = self->_centralManager;
    v14[0] = CBConnectPeripheralOptionHideFromBTSettings;
    v14[1] = CBConnectPeripheralOptionNotifyOnConnectionKey;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &off_10005AEF0;
    v14[2] = CBConnectPeripheralOptionNotifyOnDisconnectionKey;
    v14[3] = CBConnectPeripheralOptionNotifyOnNotificationKey;
    v15[2] = &off_10005AEF0;
    v15[3] = &off_10005AEF0;
    v14[4] = CBConnectPeripheralOptionStartDelayKey;
    uint64_t v11 = +[NSNumber numberWithUnsignedChar:v4];
    v14[5] = CBConnectPeripheralOptionConnectionUseCase;
    v15[4] = v11;
    v15[5] = &off_10005AF08;
    id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];
    [(CBCentralManager *)centralManager connectPeripheral:v7 options:v12];
  }
  return 1;
}

- (ISO18013_3_Central)initWithWorkQueue:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ISO18013_3_Central;
  uint64_t v9 = [(ISO18013_3_Central *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a4);
    objc_storeStrong((id *)&v10->_queue, a3);
    uint64_t v11 = objc_opt_new();
    centralCallbackLock = v10->_centralCallbackLock;
    v10->_centralCallbackLock = (NSCondition *)v11;

    id v13 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    rxBuffer = v10->_rxBuffer;
    v10->_rxBuffer = v13;
  }
  return v10;
}

- (BOOL)connectBLEAddress:(id)a3 advertiseServiceUUID:(id)a4 readerIdentCharacteristic:(id)a5 onDeviceConnection:(id)a6 onDisconnect:(id)a7 onDataRx:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v22 = +[CBUUID UUIDWithData:a4];
  if (!v22)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central connectBLEAddress:advertiseServiceUUID:readerIdentCharacteristic:onDeviceConnection:onDisconnect:onDataRx:]", 567, self, @"LE: Invalid service UUID", v20, v21, v47);
    goto LABEL_8;
  }
  if (![(ISO18013_3_Central *)self _startCBCentralManager])
  {
LABEL_8:
    BOOL v26 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_remoteBLEAddress, a3);
  if (![v15 length])
  {
    long long v23 = 0;
    goto LABEL_17;
  }
  long long v23 = [(CBCentralManager *)self->_centralManager createPeripheralWithAddress:v15 andIdentifier:0];
  if (v23) {
    goto LABEL_17;
  }
  id v24 = v15;
  long long v25 = (unsigned __int8 *)[v24 bytes];
  if ([v24 length] == (id)6)
  {
    +[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *v25, v25[1], v25[2], v25[3], v25[4], v25[5], v48];
  }
  else
  {
    if ([v24 length] != (id)7)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central connectBLEAddress:advertiseServiceUUID:readerIdentCharacteristic:onDeviceConnection:onDisconnect:onDataRx:]", 594, self, @"Invalid LE address: %@", v28, v29, (uint64_t)v24);
      goto LABEL_21;
    }
    if (*v25) {
      uint64_t v30 = "Random";
    }
    else {
      uint64_t v30 = "Public";
    }
    +[NSString stringWithFormat:@"%s %02x:%02x:%02x:%02x:%02x:%02x", v30, v25[1], v25[2], v25[3], v25[4], v25[5], v25[6]];
  uint64_t v31 = };
  long long v23 = [(CBCentralManager *)self->_centralManager retrievePeripheralWithAddress:v31];

  if (!v23)
  {
LABEL_21:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central connectBLEAddress:advertiseServiceUUID:readerIdentCharacteristic:onDeviceConnection:onDisconnect:onDataRx:]", 599, self, @"LE: Failed to create peripheral from %@", v32, v33, (uint64_t)self->_remoteBLEAddress);
    goto LABEL_8;
  }
LABEL_17:
  id v34 = objc_retainBlock(v19);
  id rxBlock = self->_rxBlock;
  self->_id rxBlock = v34;

  id v36 = objc_retainBlock(v17);
  id connectionBlock = self->_connectionBlock;
  self->_id connectionBlock = v36;

  id v38 = objc_retainBlock(v18);
  disid connectionBlock = self->_disconnectionBlock;
  self->_disid connectionBlock = v38;

  objc_storeStrong((id *)&self->_peripheralServiceUUID, v22);
  objc_storeStrong((id *)&self->_readerIdentCharacteristic, a5);
  self->_invalidated = 0;
  if (v23)
  {
    BOOL v26 = [(ISO18013_3_Central *)self connectPeripheral:v23 delay:0];
  }
  else
  {
    v50[0] = CBCentralManagerScanOptionScanInterval;
    long long v40 = +[NSNumber numberWithInt:30];
    v51[0] = v40;
    v50[1] = CBCentralManagerScanOptionScanWindow;
    uint64_t v41 = +[NSNumber numberWithInt:20];
    v50[2] = CBCentralManagerScanOptionUsecase;
    v51[1] = v41;
    v51[2] = &off_10005AF20;
    uint64_t v42 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];

    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central connectBLEAddress:advertiseServiceUUID:readerIdentCharacteristic:onDeviceConnection:onDisconnect:onDataRx:]", 620, self, @"LE: Scanning", v43, v44, v47);
    centralManager = self->_centralManager;
    v49 = v22;
    BOOL v26 = 1;
    uint64_t v46 = +[NSArray arrayWithObjects:&v49 count:1];
    [(CBCentralManager *)centralManager scanForPeripheralsWithServices:v46 options:v42];
  }
LABEL_9:

  return v26;
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3
{
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4
{
  id v7 = [(ISO18013_3_Central *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035C70;
  block[3] = &unk_100054F10;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(v7, block);
}

- (int64_t)hardwareAvailable
{
  if (![(ISO18013_3_Central *)self _startCBCentralManager]) {
    return 0;
  }
  int v3 = 4;
  int64_t v4 = 2;
  while (1)
  {
    uint64_t v5 = (uint64_t)[(CBCentralManager *)self->_centralManager state];
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central hardwareAvailable]", 660, self, @"%ld", v6, v7, v5);
    if (v5 == 4) {
      break;
    }
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      return 0;
    }
    if (v5 == 5) {
      return 1;
    }
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central hardwareAvailable]", 671, self, @"Waiting on state update", v8, v9, v14);
    id v10 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v10 lock];

    uint64_t v11 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v11 wait];

    id v12 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v12 unlock];

    if (--v3 <= 1) {
      return 0;
    }
  }
  return v4;
}

- (BOOL)writeData:(id)a3 toUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100036208;
  v37[4] = sub_100036218;
  id v38 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100036208;
  uint64_t v31 = sub_100036218;
  id v32 = 0;
  uint64_t v8 = [(ISO18013_3_Central *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036220;
  block[3] = &unk_1000555D8;
  block[4] = self;
  id v24 = &v33;
  long long v25 = v37;
  id v9 = v7;
  id v23 = v9;
  BOOL v26 = &v27;
  dispatch_sync(v8, block);

  if (!*((unsigned char *)v34 + 24)) {
    goto LABEL_5;
  }
  if (!self->_isConnected)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central writeData:toUUID:]", 732, self, @"Alt carrier no longer connected. Bail out", v10, v11, v18);
    id v16 = [(ISO18013_3_Central *)self queue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100036400;
    v21[3] = &unk_1000549A8;
    v21[4] = self;
    dispatch_sync(v16, v21);

LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = v28[5];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036410;
  v20[3] = &unk_100055600;
  v20[4] = self;
  v20[5] = v37;
  char v13 = sub_10001A530(v12, v6, v20);
  *((unsigned char *)v34 + 24) = v13;
  uint64_t v14 = [(ISO18013_3_Central *)self queue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100036478;
  v19[3] = &unk_1000549A8;
  v19[4] = self;
  dispatch_sync(v14, v19);

  BOOL v15 = *((unsigned char *)v34 + 24) != 0;
LABEL_6:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);

  return v15;
}

- (id)getBluetoothStatusDict:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100036208;
  uint64_t v11 = sub_100036218;
  id v12 = 0;
  centralManager = self->_centralManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003659C;
  v6[3] = &unk_100054F88;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(CBCentralManager *)centralManager queryBluetoothStatus:&off_10005B0F0 completion:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_startCBCentralManager
{
  if (self->_centralManager) {
    return 1;
  }
  int v3 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_queue];
  centralManager = self->_centralManager;
  self->_centralManager = v3;

  if (self->_centralManager)
  {
    uint64_t v7 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v7 lock];

    uint64_t v8 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v8 wait];

    uint64_t v9 = [(ISO18013_3_Central *)self centralCallbackLock];
    [v9 unlock];

    return 1;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central _startCBCentralManager]", 795, self, @"LE: Failed to create central", v5, v6, v11);
  return 0;
}

- (void)_activateConnectionBlock:(unint64_t)a3 connectionState:(BOOL)a4
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central _activateConnectionBlock:connectionState:]", 807, self, @"LE: status=%lu, isConnected=%d", v4, v5, a3);
  if (self->_connectionBlock)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013_3_Central _activateConnectionBlock:connectionState:]", 809, self, @"LE: Activate connect block", v9, v10, v15);
    self->_isConnected = a4;
    id v11 = objc_retainBlock(self->_connectionBlock);
    id connectionBlock = self->_connectionBlock;
    self->_id connectionBlock = 0;

    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003683C;
    block[3] = &unk_100054FB0;
    id v17 = v11;
    unint64_t v18 = a3;
    id v14 = v11;
    dispatch_async(clientQueue, block);
  }
}

- (void)_activateDisconnectBlock:(unint64_t)a3
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central _activateDisconnectBlock:]", 820, self, @"LE: status=%lu", v3, v4, a3);
  disid connectionBlock = self->_disconnectionBlock;
  if (disconnectionBlock)
  {
    self->_isConnected = 0;
    id v8 = objc_retainBlock(disconnectionBlock);
    id v9 = self->_disconnectionBlock;
    self->_disid connectionBlock = 0;

    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100036938;
    block[3] = &unk_100054FB0;
    id v13 = v8;
    unint64_t v14 = a3;
    id v11 = v8;
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
      block[2] = sub_100036A14;
      block[3] = &unk_1000549A8;
      void block[4] = self;
      dispatch_async(clientQueue, block);
    }
    else
    {
      uint64_t v7 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      rxBuffer = self->_rxBuffer;
      self->_rxBuffer = v7;
      _objc_release_x1(v7, rxBuffer);
    }
  }
}

- (void)_signalConnectionStateChange:(unsigned __int8)a3
{
  unsigned __int8 v14 = a3;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central _signalConnectionStateChange:]", 848, self, @"LE: ConnectionStateChange=%d", v3, v4, a3);
  uint64_t v6 = +[NSData dataWithBytes:&v14 length:1];
  uint64_t v7 = [(ISO18013_3_Central *)self getStateCharacteristicUUID];
  id v8 = [(ISO18013_3_Central *)self getCharacteristic:v7];

  if (v8)
  {
    [(CBPeripheral *)self->_remoteReader writeValue:v6 forCharacteristic:v8 type:1];
    if (v14 == 2)
    {
      id v9 = sub_1000261A8();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "BT_StateUpdate02";
        id v11 = buf;
        goto LABEL_8;
      }
LABEL_9:

      goto LABEL_10;
    }
    if (v14 == 1)
    {
      id v9 = sub_1000261A8();
      if (os_signpost_enabled(v9))
      {
        __int16 v13 = 0;
        uint64_t v10 = "BT_StateUpdate01";
        id v11 = (uint8_t *)&v13;
LABEL_8:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, "", v11, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
LABEL_10:
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
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Central _extractFromMessage:length:lastPacket:]", 878, self, @"Unexpected header byte: 0x%X.  Dropping data", v5, v6, *(unsigned __int8 *)a3);
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (NSData)remoteBLEAddress
{
  return self->_remoteBLEAddress;
}

- (void)setRemoteBLEAddress:(id)a3
{
}

- (CBUUID)peripheralServiceUUID
{
  return self->_peripheralServiceUUID;
}

- (void)setPeripheralServiceUUID:(id)a3
{
}

- (NSData)readerIdentCharacteristic
{
  return self->_readerIdentCharacteristic;
}

- (void)setReaderIdentCharacteristic:(id)a3
{
}

- (CBService)readerService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerService);

  return (CBService *)WeakRetained;
}

- (void)setReaderService:(id)a3
{
}

- (CBPeripheral)remoteReader
{
  return self->_remoteReader;
}

- (void)setRemoteReader:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableArray)discoveredReaders
{
  return self->_discoveredReaders;
}

- (void)setDiscoveredReaders:(id)a3
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

- (id)rxBlock
{
  return self->_rxBlock;
}

- (void)setRxBlock:(id)a3
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

- (NSCondition)centralCallbackLock
{
  return self->_centralCallbackLock;
}

- (void)setCentralCallbackLock:(id)a3
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

- (unint64_t)peripheralL2CapState
{
  return self->_peripheralL2CapState;
}

- (void)setPeripheralL2CapState:(unint64_t)a3
{
  self->_peripheralL2CapState = a3;
}

- (unint64_t)peripheralReaderIdentState
{
  return self->_peripheralReaderIdentState;
}

- (void)setPeripheralReaderIdentState:(unint64_t)a3
{
  self->_peripheralReaderIdentState = a3;
}

- (unint64_t)expectedCharacteristicReadOnStartup
{
  return self->_expectedCharacteristicReadOnStartup;
}

- (void)setExpectedCharacteristicReadOnStartup:(unint64_t)a3
{
  self->_unint64_t expectedCharacteristicReadOnStartup = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxBuffer, 0);
  objc_storeStrong((id *)&self->_centralCallbackLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong(&self->_rxBlock, 0);
  objc_storeStrong(&self->_disconnectionBlock, 0);
  objc_storeStrong(&self->_connectionBlock, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_discoveredReaders, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_remoteReader, 0);
  objc_destroyWeak((id *)&self->_readerService);
  objc_storeStrong((id *)&self->_readerIdentCharacteristic, 0);
  objc_storeStrong((id *)&self->_peripheralServiceUUID, 0);

  objc_storeStrong((id *)&self->_remoteBLEAddress, 0);
}

@end