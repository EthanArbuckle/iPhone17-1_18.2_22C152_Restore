@interface NRBluetoothPairingManager
+ (id)copySharedManager;
- (BOOL)busy;
- (BOOL)hasPairerForNRUUID:(id)a3;
- (BOOL)isPairing;
- (BOOL)isPeripheralRole;
- (BOOL)isUnpairing;
- (BOOL)pair;
- (BOOL)unpair;
- (CBCentralManager)centralManager;
- (CBPeripheralManager)peripheralManager;
- (NRBluetoothPairer)activePairer;
- (NRBluetoothPairingManager)init;
- (NSMutableArray)enqueuedPairers;
- (NSMutableSet)peripherals;
- (NSUUID)pairedPeerBluetoothUUID;
- (OS_dispatch_queue)queue;
- (unsigned)peripheralReconnectCounter;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)disconnectFromPeripherals;
- (void)disconnectPeripheral:(id)a3;
- (void)enqueuePairer:(id)a3;
- (void)handlePairingCompletionWithSuccess:(BOOL)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)removePairerForNRUUID:(id)a3;
- (void)reset;
- (void)resumeUnpairing;
- (void)setActivePairer:(id)a3;
- (void)setBusy:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setEnqueuedPairers:(id)a3;
- (void)setIsPairing:(BOOL)a3;
- (void)setIsPeripheralRole:(BOOL)a3;
- (void)setIsUnpairing:(BOOL)a3;
- (void)setPairedPeerBluetoothUUID:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setPeripheralReconnectCounter:(unsigned int)a3;
- (void)setPeripherals:(id)a3;
- (void)setQueue:(id)a3;
- (void)startNextPairer;
@end

@implementation NRBluetoothPairingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairer, 0);
  objc_storeStrong((id *)&self->_enqueuedPairers, 0);
  objc_storeStrong((id *)&self->_pairedPeerBluetoothUUID, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setActivePairer:(id)a3
{
}

- (NRBluetoothPairer)activePairer
{
  return self->_activePairer;
}

- (void)setEnqueuedPairers:(id)a3
{
}

- (NSMutableArray)enqueuedPairers
{
  return self->_enqueuedPairers;
}

- (void)setPeripheralReconnectCounter:(unsigned int)a3
{
  self->_peripheralReconnectCounter = a3;
}

- (unsigned)peripheralReconnectCounter
{
  return self->_peripheralReconnectCounter;
}

- (void)setPairedPeerBluetoothUUID:(id)a3
{
}

- (NSUUID)pairedPeerBluetoothUUID
{
  return self->_pairedPeerBluetoothUUID;
}

- (void)setPeripherals:(id)a3
{
}

- (NSMutableSet)peripherals
{
  return self->_peripherals;
}

- (void)setIsPairing:(BOOL)a3
{
  self->_isPairing = a3;
}

- (BOOL)isPairing
{
  return self->_isPairing;
}

- (void)setIsUnpairing:(BOOL)a3
{
  self->_isUnpairing = a3;
}

- (BOOL)isUnpairing
{
  return self->_isUnpairing;
}

- (void)setIsPeripheralRole:(BOOL)a3
{
  self->_isPeripheralRole = a3;
}

- (BOOL)isPeripheralRole
{
  return self->_isPeripheralRole;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setCentralManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)enqueuePairer:(id)a3
{
  id v5 = a3;
  v4 = [(NRBluetoothPairingManager *)self enqueuedPairers];
  [v4 addObject:v5];

  if ([(NRBluetoothPairingManager *)self busy])
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      _NRLogWithArgs();
    }
  }
  else
  {
    [(NRBluetoothPairingManager *)self startNextPairer];
  }
}

- (void)startNextPairer
{
  [(NRBluetoothPairingManager *)self reset];
  v3 = [(NRBluetoothPairingManager *)self enqueuedPairers];
  id v4 = [v3 count];

  if (v4)
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      id v5 = (id)qword_1001F4850;
      [(NRBluetoothPairingManager *)self activePairer];
      v13 = uint64_t v12 = 545;
      v10 = "";
      v11 = "-[NRBluetoothPairingManager startNextPairer]";
      _NRLogWithArgs();
    }
    -[NRBluetoothPairingManager setBusy:](self, "setBusy:", 1, v10, v11, v12, v13);
    v6 = [(NRBluetoothPairingManager *)self enqueuedPairers];
    v7 = [v6 firstObject];
    [(NRBluetoothPairingManager *)self setActivePairer:v7];

    v8 = [(NRBluetoothPairingManager *)self enqueuedPairers];
    [v8 removeObjectAtIndex:0];

    v9 = [(NRBluetoothPairingManager *)self activePairer];
    LODWORD(v7) = [v9 isUnpairRequest];

    if (v7)
    {
      if ([(NRBluetoothPairingManager *)self unpair]) {
        return;
      }
    }
    else if ([(NRBluetoothPairingManager *)self pair])
    {
      return;
    }
    [(NRBluetoothPairingManager *)self startNextPairer];
  }
  else
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      _NRLogWithArgs();
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v15 = a4;
  v6 = [a3 delegate];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 activePairer];
    v9 = [(NRBluetoothPairingManager *)self activePairer];

    if (v8 == v9)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        uint64_t v13 = 527;
        id v14 = v15;
        v11 = "";
        uint64_t v12 = "-[NRBluetoothPairingManager pairingAgent:peerDidUnpair:]";
        _NRLogWithArgs();
      }
      if ([(NRBluetoothPairingManager *)self isUnpairing])
      {
        [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:1];
        v10 = self;
        [v10 setPairedPeerBluetoothUUID:0];
      }
      else
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  v9 = [a3 delegate];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 activePairer];
    uint64_t v12 = [(NRBluetoothPairingManager *)self activePairer];

    if (v11 == v12)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        _NRLogWithArgs();
      }
      uint64_t v13 = self;
      [v13 setPairedPeerBluetoothUUID:0];

      [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:0];
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v15 = a4;
  v6 = [a3 delegate];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 activePairer];
    v9 = [(NRBluetoothPairingManager *)self activePairer];

    if (v8 == v9)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        uint64_t v13 = 501;
        id v14 = v15;
        v11 = "";
        uint64_t v12 = "-[NRBluetoothPairingManager pairingAgent:peerDidCompletePairing:]";
        _NRLogWithArgs();
      }
      if ([(NRBluetoothPairingManager *)self isPairing])
      {
        v10 = [v15 identifier];
        [(NRBluetoothPairingManager *)self setPairedPeerBluetoothUUID:v10];

        [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:1];
      }
      else
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  v10 = [(NRBluetoothPairingManager *)self centralManager];

  if (v10)
  {
    v11 = [(NRBluetoothPairingManager *)self centralManager];
    id v12 = [v11 sharedPairingAgent];

    if (v12 == v19)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        uint64_t v17 = 485;
        int64_t v18 = a5;
        id v15 = "";
        v16 = "-[NRBluetoothPairingManager pairingAgent:peerDidRequestPairing:type:passkey:]";
        _NRLogWithArgs();
      }
      uint64_t v13 = [(NRBluetoothPairingManager *)self activePairer];
      id v14 = [v13 pairingType];

      if (!v14) {
        [v19 respondToPairingRequest:v9 type:a5 accept:1 data:0];
      }
    }
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRBluetoothPairingManager *)self peripheralManager];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(NRBluetoothPairingManager *)self peripheralManager];

    if (v7 == v4)
    {
      if ([(NRBluetoothPairingManager *)self isPairing])
      {
        if ([v4 state] == (id)5)
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4858 != -1) {
              dispatch_once(&qword_1001F4858, &stru_1001C6358);
            }
            uint64_t v14 = 465;
            id v12 = "";
            uint64_t v13 = "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]";
            _NRLogWithArgs();
          }
          id v8 = [(NRBluetoothPairingManager *)self peripheralManager];
          v16 = CBAdvertisementDataServiceUUIDsKey;
          id v9 = +[CBUUID UUIDWithString:@"fd74"];
          id v15 = v9;
          v10 = +[NSArray arrayWithObjects:&v15 count:1];
          uint64_t v17 = v10;
          v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
          [v8 startAdvertising:v11];
        }
        else
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4858 != -1) {
              dispatch_once(&qword_1001F4858, &stru_1001C6358);
            }
            uint64_t v14 = 468;
            id v12 = "";
            uint64_t v13 = "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]";
            _NRLogWithArgs();
          }
          id v8 = [(NRBluetoothPairingManager *)self peripheralManager];
          [v8 stopAdvertising];
        }
      }
    }
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  uint64_t v8 = [(NRBluetoothPairingManager *)self centralManager];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(NRBluetoothPairingManager *)self centralManager];

    if (v10 == v19)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        uint64_t v17 = 444;
        id v18 = v7;
        id v15 = "";
        v16 = "-[NRBluetoothPairingManager centralManager:didDisconnectPeripheral:error:]";
        _NRLogWithArgs();
      }
      v11 = [(NRBluetoothPairingManager *)self peripherals];
      [v11 removeObject:v7];

      id v12 = [(NRBluetoothPairingManager *)self centralManager];
      uint64_t v13 = [v12 sharedPairingAgent];

      if (([v13 isPeerPaired:v7] & 1) == 0)
      {
        uint64_t v14 = [(NRBluetoothPairingManager *)self centralManager];
        [v14 connectPeripheral:v7 options:0];
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NRBluetoothPairingManager *)self centralManager];
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [(NRBluetoothPairingManager *)self centralManager];

    if (v12 == v19)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        id v17 = v8;
        id v18 = v9;
        uint64_t v16 = 426;
        uint64_t v14 = "";
        id v15 = "-[NRBluetoothPairingManager centralManager:didFailToConnectPeripheral:error:]";
        _NRLogWithArgs();
      }
      if ([(NRBluetoothPairingManager *)self peripheralReconnectCounter] > 4)
      {
        [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:0];
      }
      else
      {
        uint64_t v13 = [(NRBluetoothPairingManager *)self centralManager];
        [v13 connectPeripheral:v8 options:0];

        [(NRBluetoothPairingManager *)self setPeripheralReconnectCounter:[(NRBluetoothPairingManager *)self peripheralReconnectCounter] + 1];
      }
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NRBluetoothPairingManager *)self centralManager];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(NRBluetoothPairingManager *)self centralManager];

    if (v10 == v6)
    {
      v11 = [(NRBluetoothPairingManager *)self peripherals];
      [v11 addObject:v7];

      id v12 = [(NRBluetoothPairingManager *)self centralManager];
      [v12 stopScan];

      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        uint64_t v23 = 397;
        id v25 = v7;
        id v19 = "";
        v21 = "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]";
        _NRLogWithArgs();
      }
      uint64_t v13 = [(NRBluetoothPairingManager *)self centralManager];
      uint64_t v14 = [v13 sharedPairingAgent];

      [v14 setDelegate:self];
      if ([v14 isPeerPaired:v7])
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          uint64_t v24 = 412;
          id v26 = v7;
          v20 = "";
          v22 = "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]";
          _NRLogWithArgs();
        }
        id v15 = [v7 identifier:v20, v22, v24, v26];
        [(NRBluetoothPairingManager *)self setPairedPeerBluetoothUUID:v15];

        [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:1];
      }
      else
      {
        uint64_t v16 = [(NRBluetoothPairingManager *)self activePairer];
        id v17 = [v16 pairingType];

        if (v17)
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          if (!_NRLogIsLevelEnabled()) {
            goto LABEL_29;
          }
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
        }
        else
        {
          [v14 setOOBPairingEnabled:0 forPeer:v7];
          v27[0] = CBPairingOptionsUseMITMAuthentication;
          v27[1] = CBPairingOptionsDistributeIRK;
          v28[0] = &__kCFBooleanFalse;
          v28[1] = &__kCFBooleanTrue;
          id v18 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
          [v14 pairPeer:v7 options:v18];

          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          if (!_NRLogIsLevelEnabled()) {
            goto LABEL_29;
          }
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
        }
        _NRLogWithArgs();
      }
LABEL_29:
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (qword_1001F4858 != -1) {
    dispatch_once(&qword_1001F4858, &stru_1001C6358);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    uint64_t v25 = 377;
    id v26 = v10;
    uint64_t v23 = "";
    uint64_t v24 = "-[NRBluetoothPairingManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:]";
    _NRLogWithArgs();
  }
  uint64_t v13 = [(NRBluetoothPairingManager *)self activePairer];
  uint64_t v14 = [v13 parameters];
  id v15 = [v14 bluetoothUUID];

  if (!v15) {
    goto LABEL_9;
  }
  uint64_t v16 = [v10 identifier];
  id v17 = [(NRBluetoothPairingManager *)self activePairer];
  id v18 = [v17 parameters];
  id v19 = [v18 bluetoothUUID];
  unsigned int v20 = [v16 isEqual:v19];

  if (v20)
  {
LABEL_9:
    v21 = [(NRBluetoothPairingManager *)self peripherals];
    [v21 addObject:v10];

    v22 = [(NRBluetoothPairingManager *)self centralManager];
    [v22 connectPeripheral:v10 options:0];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRBluetoothPairingManager *)self centralManager];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(NRBluetoothPairingManager *)self centralManager];

    if (v7 == v4
      && ([(NRBluetoothPairingManager *)self isPairing]
       || [(NRBluetoothPairingManager *)self isUnpairing]))
    {
      uint64_t v8 = (uint64_t)[v4 state];
      if (v8 == 5)
      {
        if ([(NRBluetoothPairingManager *)self isUnpairing])
        {
          [(NRBluetoothPairingManager *)self resumeUnpairing];
        }
        else
        {
          id v9 = +[CBUUID UUIDWithString:@"fd74"];
          if (![(NRBluetoothPairingManager *)self isPeripheralRole])
          {
            id v10 = [(NRBluetoothPairingManager *)self centralManager];
            id v12 = v9;
            id v11 = +[NSArray arrayWithObjects:&v12 count:1];
            [v10 scanForPeripheralsWithServices:v11 options:0];

            if (qword_1001F4858 != -1) {
              dispatch_once(&qword_1001F4858, &stru_1001C6358);
            }
            if (_NRLogIsLevelEnabled())
            {
              if (qword_1001F4858 != -1) {
                dispatch_once(&qword_1001F4858, &stru_1001C6358);
              }
              _NRLogWithArgs();
            }
          }
        }
      }
      else if (v8 <= 3)
      {
        [(NRBluetoothPairingManager *)self disconnectFromPeripherals];
      }
    }
  }
}

- (void)disconnectPeripheral:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [(NRBluetoothPairingManager *)self centralManager];

    id v4 = v8;
    if (v5)
    {
      if ([v8 state] == (id)1 || (v6 = objc_msgSend(v8, "state") == (id)2, id v4 = v8, v6))
      {
        id v7 = [(NRBluetoothPairingManager *)self centralManager];
        [v7 cancelPeripheralConnection:v8];

        id v4 = v8;
      }
    }
  }
}

- (void)disconnectFromPeripherals
{
  v3 = [(NRBluetoothPairingManager *)self centralManager];

  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(NRBluetoothPairingManager *)self peripherals];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(NRBluetoothPairingManager *)self disconnectPeripheral:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(NRBluetoothPairingManager *)self setPeripherals:0];
  }
}

- (void)handlePairingCompletionWithSuccess:(BOOL)a3
{
  id v5 = [(NRBluetoothPairingManager *)self activePairer];
  id v6 = [v5 completionBlock];

  if (v6)
  {
    uint64_t v7 = [(NRBluetoothPairingManager *)self pairedPeerBluetoothUUID];
    id v8 = [(NRBluetoothPairingManager *)self activePairer];
    long long v9 = [v8 completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C600;
    block[3] = &unk_1001C6338;
    BOOL v14 = a3;
    id v12 = v7;
    id v13 = v6;
    id v10 = v7;
    dispatch_async(v9, block);
  }
  [(NRBluetoothPairingManager *)self startNextPairer];
}

- (void)reset
{
  [(NRBluetoothPairingManager *)self disconnectFromPeripherals];
  v3 = [(NRBluetoothPairingManager *)self centralManager];
  id v7 = [v3 sharedPairingAgent];

  [v7 setDelegate:0];
  id v4 = [(NRBluetoothPairingManager *)self peripheralManager];
  [v4 stopAdvertising];

  id v5 = [(NRBluetoothPairingManager *)self centralManager];
  [v5 stopScan];

  [(NRBluetoothPairingManager *)self setPeripheralManager:0];
  [(NRBluetoothPairingManager *)self setCentralManager:0];
  [(NRBluetoothPairingManager *)self setBusy:0];
  [(NRBluetoothPairingManager *)self setIsPeripheralRole:0];
  [(NRBluetoothPairingManager *)self setIsUnpairing:0];
  [(NRBluetoothPairingManager *)self setIsPairing:0];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  [(NRBluetoothPairingManager *)self setPeripherals:v6];

  [(NRBluetoothPairingManager *)self setPairedPeerBluetoothUUID:0];
  [(NRBluetoothPairingManager *)self setActivePairer:0];
  [(NRBluetoothPairingManager *)self setPeripheralReconnectCounter:0];
}

- (BOOL)pair
{
  [(NRBluetoothPairingManager *)self setIsPairing:1];
  v3 = [(NRBluetoothPairingManager *)self activePairer];
  id v4 = [v3 nrUUID];
  id v5 = (id *)sub_10013DC5C((uint64_t)NRDLocalDevice, v4);

  if (v5)
  {
    if (*((unsigned char *)v5 + 10))
    {
      id v6 = v5[5];
      [(NRBluetoothPairingManager *)self setPairedPeerBluetoothUUID:v6];

      BOOL v7 = 1;
      [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:1];
      goto LABEL_44;
    }
    id v8 = v5[16];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  if ([v9 bluetoothRole] == (id)1)
  {
    BOOL v10 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v5) {
    id v11 = v5[16];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  id v13 = [v12 proxyCapability];
  BOOL v10 = v13 != (id)1;
  if (v13 == (id)1) {
    goto LABEL_21;
  }
  if (v5) {
    id v14 = v5[16];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  id v16 = [v15 bluetoothEndpointType];

  if (v16 == (id)2)
  {
    BOOL v10 = 0;
LABEL_23:
    [(NRBluetoothPairingManager *)self setIsPeripheralRole:v10];
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      _NRLogWithArgs();
    }
    id v19 = objc_alloc((Class)CBCentralManager);
    unsigned int v20 = [(NRBluetoothPairingManager *)self queue];
    id v21 = [v19 initWithDelegate:self queue:v20 options:0];
    [(NRBluetoothPairingManager *)self setCentralManager:v21];

    v22 = [(NRBluetoothPairingManager *)self centralManager];
    uint64_t v23 = [v22 sharedPairingAgent];

    [v23 setDelegate:self];
    if (v10)
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        _NRLogWithArgs();
      }
      id v24 = objc_alloc((Class)CBPeripheralManager);
      uint64_t v25 = [(NRBluetoothPairingManager *)self queue];
      id v26 = [v24 initWithDelegate:self queue:v25 options:0];
      [(NRBluetoothPairingManager *)self setPeripheralManager:v26];
    }
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      _NRLogWithArgs();
    }

    BOOL v7 = 1;
    goto LABEL_44;
  }
  if (v5) {
    id v17 = v5[16];
  }
  else {
    id v17 = 0;
  }
  id v9 = v17;
  if ([v9 bluetoothRole] == (id)2)
  {
    BOOL v10 = 1;
    goto LABEL_22;
  }
  id v18 = v5 ? v5[16] : 0;
  id v12 = v18;
  if ([v12 proxyCapability] == (id)2)
  {
LABEL_21:

    goto LABEL_22;
  }
  if (v5) {
    id v28 = v5[16];
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  id v30 = [v29 bluetoothEndpointType];

  if (v30 == (id)1)
  {
    BOOL v10 = 1;
    goto LABEL_23;
  }
  if (qword_1001F4858 != -1) {
    dispatch_once(&qword_1001F4858, &stru_1001C6358);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    _NRLogWithArgs();
  }
  BOOL v7 = 0;
LABEL_44:

  return v7;
}

- (BOOL)unpair
{
  [(NRBluetoothPairingManager *)self setIsUnpairing:1];
  v3 = [(NRBluetoothPairingManager *)self centralManager];

  if (!v3)
  {
    id v4 = objc_alloc((Class)CBCentralManager);
    id v5 = [(NRBluetoothPairingManager *)self queue];
    id v6 = [v4 initWithDelegate:self queue:v5 options:0];
    [(NRBluetoothPairingManager *)self setCentralManager:v6];
  }
  BOOL v7 = [(NRBluetoothPairingManager *)self activePairer];
  id v8 = [v7 nrUUID];
  id v9 = sub_10013DC5C((uint64_t)NRDLocalDevice, v8);

  if (v9) {
    BOOL v10 = (void *)v9[5];
  }
  else {
    BOOL v10 = 0;
  }
  id v11 = v10;
  [(NRBluetoothPairingManager *)self setPairedPeerBluetoothUUID:v11];

  if (v3) {
    [(NRBluetoothPairingManager *)self resumeUnpairing];
  }

  return 1;
}

- (void)resumeUnpairing
{
  v3 = [(NRBluetoothPairingManager *)self pairedPeerBluetoothUUID];

  if (v3)
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      id v4 = (id)qword_1001F4850;
      [(NRBluetoothPairingManager *)self pairedPeerBluetoothUUID];
      id v24 = v22 = 199;
      id v18 = "";
      unsigned int v20 = "-[NRBluetoothPairingManager resumeUnpairing]";
      _NRLogWithArgs();
    }
    id v5 = [(NRBluetoothPairingManager *)self centralManager];
    id v6 = [v5 sharedPairingAgent];

    [v6 setDelegate:self];
    id v26 = v6;
    [v6 retrievePairedPeers];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
LABEL_10:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          uint64_t v23 = 207;
          uint64_t v25 = v12;
          id v19 = "";
          id v21 = "-[NRBluetoothPairingManager resumeUnpairing]";
          _NRLogWithArgs();
        }
        id v13 = [(NRBluetoothPairingManager *)self pairedPeerBluetoothUUID];
        id v14 = [v12 identifier];
        id v15 = [v13 compare:v14];

        if (!v15) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v9) {
            goto LABEL_10;
          }
          goto LABEL_22;
        }
      }
      id v16 = v12;

      if (!v16) {
        goto LABEL_25;
      }
      id v17 = v26;
      [v26 unpairPeer:v16];
    }
    else
    {
LABEL_22:

LABEL_25:
      [(NRBluetoothPairingManager *)self handlePairingCompletionWithSuccess:1];
      id v17 = v26;
    }
  }
}

- (void)removePairerForNRUUID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NRBluetoothPairingManager *)self enqueuedPairers];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 nrUUID];
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([v6 isUnpairRequest])
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      _NRLogWithArgs();
    }
  }
  else
  {
    id v12 = [(NRBluetoothPairingManager *)self enqueuedPairers];
    [v12 removeObject:v6];

    activePairer = self->_activePairer;
    if (activePairer)
    {
      id v14 = [(NRBluetoothPairer *)activePairer nrUUID];
      unsigned int v15 = [v14 isEqual:v4];

      if (v15) {
        [(NRBluetoothPairingManager *)self startNextPairer];
      }
    }
  }
}

- (BOOL)hasPairerForNRUUID:(id)a3
{
  id v4 = a3;
  activePairer = self->_activePairer;
  if (activePairer
    && ([(NRBluetoothPairer *)activePairer nrUUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqual:v4],
        v6,
        (v7 & 1) != 0))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [(NRBluetoothPairingManager *)self enqueuedPairers];
    id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v9);
          }
          id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) nrUUID];
          unsigned __int8 v13 = [v12 isEqual:v4];

          if (v13)
          {
            LOBYTE(v8) = 1;
            goto LABEL_14;
          }
        }
        id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return (char)v8;
}

- (NRBluetoothPairingManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)NRBluetoothPairingManager;
  v2 = [(NRBluetoothPairingManager *)&v14 init];
  if (!v2)
  {
    id v10 = sub_10001A9CC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v12 = sub_10001A9CC();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRBluetoothPairingManager init]";
    sub_10001A9CC();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  if (_NRIsAppleInternal())
  {
    id v4 = (OS_dispatch_queue *)sub_10015BD9C();
    queue = v3->_queue;
    v3->_queue = v4;

    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    enqueuedPairers = v3->_enqueuedPairers;
    v3->_enqueuedPairers = v6;

    id v8 = v3;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)copySharedManager
{
  if (qword_1001F4848 != -1) {
    dispatch_once(&qword_1001F4848, &stru_1001C6310);
  }
  v2 = (void *)qword_1001F4840;

  return v2;
}

@end