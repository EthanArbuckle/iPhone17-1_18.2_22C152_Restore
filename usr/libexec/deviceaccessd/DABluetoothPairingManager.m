@interface DABluetoothPairingManager
- (BOOL)busy;
- (BOOL)mitmPairing;
- (DABluetoothPairingManager)init;
- (NSUUID)bluetoothUUID;
- (OS_dispatch_queue)dispatchQueue;
- (double)taskTimeoutSeconds;
- (id)_getNextTask;
- (id)getCurrentTaskBluetoothIdentifier;
- (void)_addNewTask:(id)a3 completion:(id)a4 bluetoothOp:(int64_t)a5 pairCTKD:(BOOL)a6 displayName:(id)a7 taskTimeout:(id)a8 appConfirmsAuth:(BOOL)a9;
- (void)_reportEvent:(int64_t)a3 error:(id)a4 endCurrentTask:(BOOL)a5;
- (void)_reportFailure:(id)a3;
- (void)_runNextTask;
- (void)cancelAll;
- (void)cancelCurrentTask;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)forgetBluetoothDevice:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)persistBluetoothDevice:(id)a3 pairingRequired:(BOOL)a4 pairWithCTKD:(BOOL)a5 displayName:(id)a6 taskTimeout:(id)a7 appConfirmsAuth:(BOOL)a8 completion:(id)a9;
- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 passkey:(id)a6;
- (void)setBluetoothUUID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMitmPairing:(BOOL)a3;
- (void)setTaskTimeoutSeconds:(double)a3;
@end

@implementation DABluetoothPairingManager

- (DABluetoothPairingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)DABluetoothPairingManager;
  v2 = [(DABluetoothPairingManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = 0;

    cbCentralManager = v3->_cbCentralManager;
    v3->_cbCentralManager = 0;

    cbPairingAgent = v3->_cbPairingAgent;
    v3->_cbPairingAgent = 0;

    v3->_currentTaskEndEvent = 0;
    uint64_t v7 = objc_opt_new();
    taskList = v3->_taskList;
    v3->_taskList = (NSMutableArray *)v7;

    *(_WORD *)&v3->_cbPowerOn = 0;
    v3->_busy = 0;
    v3->_taskTimeoutSeconds = 30.0;
    v9 = v3;
  }

  return v3;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E2C;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)persistBluetoothDevice:(id)a3 pairingRequired:(BOOL)a4 pairWithCTKD:(BOOL)a5 displayName:(id)a6 taskTimeout:(id)a7 appConfirmsAuth:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v19 = objc_retainBlock(v18);
  v20 = (NSUUID *)v15;
  id v21 = v16;
  id v22 = v17;
  bluetoothUUID = self->_bluetoothUUID;
  self->_bluetoothUUID = v20;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002508C;
    block[3] = &unk_10003D5A0;
    block[4] = self;
    void block[5] = v20;
    block[7] = v22;
    block[8] = v19;
    BOOL v26 = a4;
    BOOL v27 = a5;
    block[6] = v21;
    BOOL v28 = a8;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_1000437C8 <= 30 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)forgetBluetoothDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = objc_retainBlock(v7);
  id v9 = v6;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002526C;
    block[3] = &unk_10003D5C8;
    block[4] = self;
    void block[5] = v9;
    block[6] = v8;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_1000437C8 <= 30 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)cancelCurrentTask
{
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000253A8;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)cancelAll
{
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025670;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)getCurrentTaskBluetoothIdentifier
{
  currentTask = self->_currentTask;
  if (currentTask)
  {
    currentTask = [currentTask bluetoothUUID];
  }

  return currentTask;
}

- (void)_runNextTask
{
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    currentTask = self->_currentTask;
    LogPrintF();
  }
  if (self->_currentTask)
  {
    if (dword_1000437C8 <= 30 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (self->_cbCentralManager)
  {
    if (!self->_cbPowerOn) {
      return;
    }
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if ([(NSMutableArray *)self->_taskList count])
    {
      if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
      {
        taskList = self->_taskList;
        LogPrintF();
      }
      objc_super v11 = [(DABluetoothPairingManager *)self _getNextTask];
      v12 = self->_currentTask;
      self->_currentTask = v11;

      self->_currentTaskEndEvent = 0;
      v13 = self->_currentTask;
      v14 = [(DABluetoothTask *)v13 taskTimeout];
      id v15 = [v14 integerValue];
      dispatchQueue = self->_dispatchQueue;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100025F98;
      v35[3] = &unk_10003C950;
      v35[4] = self;
      [(DABluetoothTask *)v13 setTimerTimeout:dispatchQueue queue:v35 handler:(double)(uint64_t)v15];

      cbCentralManager = self->_cbCentralManager;
      id v18 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
      v36 = v18;
      id v19 = +[NSArray arrayWithObjects:&v36 count:1];
      v20 = [(CBCentralManager *)cbCentralManager retrievePeripheralsWithIdentifiers:v19];

      if (!v20 || [v20 count] != (id)1)
      {
        if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
        {
          v29 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
          LogPrintF();
        }
        v24 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
        v33 = self->_currentTask;
        v25 = DAErrorF();
        -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v25, v24, v33);

        goto LABEL_42;
      }
      id v21 = [v20 objectAtIndexedSubscript:0];
      cbPeripheral = self->_cbPeripheral;
      self->_cbPeripheral = v21;

      int64_t v23 = [(DABluetoothTask *)self->_currentTask btOperation];
      switch(v23)
      {
        case 10:
          goto LABEL_73;
        case 30:
          if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
          {
            v29 = self->_cbPeripheral;
            LogPrintF();
          }
          -[CBPairingAgent unpairPeer:](self->_cbPairingAgent, "unpairPeer:", self->_cbPeripheral, v29);
          break;
        case 20:
LABEL_73:
          if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
          {
            v29 = self->_cbPeripheral;
            LogPrintF();
          }
          if (-[CBPairingAgent isPeerPaired:](self->_cbPairingAgent, "isPeerPaired:", self->_cbPeripheral, v29))
          {
            if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
            {
              v30 = self->_cbPeripheral;
              LogPrintF();
            }
            -[DABluetoothPairingManager pairingAgent:peerDidCompletePairing:](self, "pairingAgent:peerDidCompletePairing:", self->_cbPairingAgent, self->_cbPeripheral, v30);
          }
          else
          {
            [(CBCentralManager *)self->_cbCentralManager connectPeripheral:self->_cbPeripheral options:0];
          }
          break;
        default:
          if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
          {
            v29 = [(DABluetoothTask *)self->_currentTask btOperation];
            LogPrintF();
          }
          v31 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
          v34 = self->_currentTask;
          BOOL v26 = DAErrorF();

          -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v26, v31, v34);
          break;
      }
LABEL_42:

      return;
    }
    v3 = self->_currentTask;
    if (v3)
    {
      v4 = [(DABluetoothTask *)v3 bluetoothUUID];
      v32 = self->_currentTask;
      v5 = DAErrorF();
      -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v5, v4, v32);
    }
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(DABluetoothPairingManager *)self cancelAll];
  }
  else
  {
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:self->_dispatchQueue options:0];
    id v7 = self->_cbCentralManager;
    self->_cbCentralManager = v6;

    id v8 = [(CBCentralManager *)self->_cbCentralManager sharedPairingAgent];
    cbPairingAgent = self->_cbPairingAgent;
    self->_cbPairingAgent = v8;

    v10 = self->_cbPairingAgent;
    [(CBPairingAgent *)v10 setDelegate:self];
  }
}

- (void)_reportEvent:(int64_t)a3 error:(id)a4 endCurrentTask:(BOOL)a5
{
  BOOL v5 = a5;
  id v27 = a4;
  if (dword_1000437C8 > 50 || dword_1000437C8 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_33;
  }
  if (a3 <= 19)
  {
    if (a3)
    {
      id v8 = v27;
      if (a3 == 10)
      {
        CFStringRef v9 = @"DABluetoothEventAccessoryConnected";
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    CFStringRef v9 = @"DABluetoothEventUnknown";
LABEL_16:
    id v8 = v27;
    goto LABEL_18;
  }
  if (a3 == 20)
  {
    CFStringRef v9 = @"DABluetoothEventCompleted";
    goto LABEL_16;
  }
  if (a3 == 30)
  {
    CFStringRef v9 = @"DABluetoothEventFailed";
    goto LABEL_16;
  }
  id v8 = v27;
  if (a3 == 40)
  {
    CFStringRef v9 = @"DABluetoothEventPairingRequested";
    goto LABEL_18;
  }
LABEL_17:
  CFStringRef v9 = @"?";
LABEL_18:
  int64_t currentTaskEndEvent = self->_currentTaskEndEvent;
  if (currentTaskEndEvent <= 19)
  {
    if (!currentTaskEndEvent)
    {
      CFStringRef v11 = @"DABluetoothEventUnknown";
      goto LABEL_30;
    }
    if (currentTaskEndEvent == 10)
    {
      CFStringRef v11 = @"DABluetoothEventAccessoryConnected";
      goto LABEL_30;
    }
LABEL_29:
    CFStringRef v11 = @"?";
    goto LABEL_30;
  }
  if (currentTaskEndEvent == 20)
  {
    CFStringRef v11 = @"DABluetoothEventCompleted";
    goto LABEL_30;
  }
  if (currentTaskEndEvent == 30)
  {
    CFStringRef v11 = @"DABluetoothEventFailed";
    goto LABEL_30;
  }
  if (currentTaskEndEvent != 40) {
    goto LABEL_29;
  }
  CFStringRef v11 = @"DABluetoothEventPairingRequested";
LABEL_30:
  v12 = "no";
  if (v5) {
    v12 = "yes";
  }
  v25 = v12;
  currentTask = self->_currentTask;
  CFStringRef v23 = v11;
  id v24 = v8;
  CFStringRef v22 = v9;
  LogPrintF();
LABEL_33:
  if (!self->_currentTaskEndEvent)
  {
    v13 = self->_currentTask;
    if (v13)
    {
      BOOL v14 = [(DABluetoothTask *)v13 pairedCTKD];
      id v15 = [(CBPeripheral *)self->_cbPeripheral identifier];
      id v16 = [objc_alloc((Class)DABluetoothPairingInfo) initWithBluetoothIdentifier:v15 pairedCTKD:v14 appConfirmsAuth:-[DABluetoothTask appConfirmsAuth](self->_currentTask, "appConfirmsAuth", v22, v23, v24, v25, currentTask) pairingRequired:(id)-[DABluetoothTask btOperation](self->_currentTask, "btOperation") == (id)10];
      if (!v27)
      {
        cbPeripheral = self->_cbPeripheral;
        id v18 = [(DABluetoothTask *)self->_currentTask displayName];
        [(CBPeripheral *)cbPeripheral setCustomProperty:@"ASK_DISPLAY_NAME" value:v18];
      }
      id v19 = [(DABluetoothTask *)self->_currentTask eventHandler];
      ((void (**)(void, int64_t, id, id))v19)[2](v19, a3, v16, v27);
    }
  }
  if (v5)
  {
    self->_busy = [(NSMutableArray *)self->_taskList count] != 0;
    [(DABluetoothTask *)self->_currentTask cancelTimer];
    v20 = self->_cbPeripheral;
    self->_cbPeripheral = 0;
    self->_int64_t currentTaskEndEvent = a3;

    id v21 = self->_currentTask;
    self->_currentTask = 0;

    [(DABluetoothPairingManager *)self _runNextTask];
  }
}

- (void)_reportFailure:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_1000437C8 <= 50)
  {
    if (dword_1000437C8 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      currentTask = self->_currentTask;
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }
  -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v4, 1, currentTask, v7);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [(CBCentralManager *)self->_cbCentralManager state];
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_cbPowerOn = v4 == (id)5;

  [(DABluetoothPairingManager *)self _runNextTask];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v18 = v7;
    currentTask = self->_currentTask;
    id v17 = v6;
    LogPrintF();
  }
  if (!v7
    && self->_currentTask
    && ([v6 identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(DABluetoothTask *)self->_currentTask bluetoothUUID],
        CFStringRef v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v8 isEqual:v9],
        v9,
        v8,
        v10))
  {
    BOOL mitmPairing = self->_mitmPairing;
    uint64_t v12 = [(DABluetoothTask *)self->_currentTask pairCTKD] ^ 1;
    v21[0] = CBPairingOptionsUseMITMAuthentication;
    v13 = +[NSNumber numberWithBool:mitmPairing];
    v21[1] = @"kCBMsgArgPairingOptionsDisableCTKD";
    v22[0] = v13;
    BOOL v14 = +[NSNumber numberWithInt:v12];
    v22[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
    {
      id v17 = v6;
      id v18 = v15;
      LogPrintF();
    }
    -[CBPairingAgent pairPeer:options:](self->_cbPairingAgent, "pairPeer:options:", v6, v15, v17, v18, currentTask);
  }
  else
  {
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
    {
      id v17 = v7;
      id v18 = v6;
      LogPrintF();
    }
    id v15 = [v6 identifier:v17 v18:currentTask];
    id v19 = self->_currentTask;
    id v16 = DAErrorF();
    -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v16, v15, v19);
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    currentTask = self->_currentTask;
    LogPrintF();
  }
  if (!self->_currentTask
    || ([v6 identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(DABluetoothTask *)self->_currentTask bluetoothUUID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        !v9))
  {
    if (dword_1000437C8 > 50 || dword_1000437C8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  int64_t v10 = [(DABluetoothTask *)self->_currentTask btOperation];
  CFStringRef v11 = self->_currentTask;
  if (v10 != 10)
  {
    if ((id)[(DABluetoothTask *)v11 btOperation] == (id)20)
    {
      [(CBPeripheral *)self->_cbPeripheral tag:@"DA_ASK_RETAIN_DEVICE"];
      uint64_t v12 = [(DABluetoothTask *)self->_currentTask appConfirmsAuth] ^ 1;
      v13 = self;
      uint64_t v14 = 20;
      goto LABEL_28;
    }
    if (dword_1000437C8 > 50 || dword_1000437C8 == -1 && !_LogCategory_Initialize())
    {
LABEL_18:
      id v15 = [v6 identifier:v17 currentTask];
      id v19 = self->_currentTask;
      id v16 = DAErrorF();
      -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v16, v15, v19);

      goto LABEL_19;
    }
LABEL_14:
    id v17 = v6;
    LogPrintF();
    goto LABEL_18;
  }
  if (![(DABluetoothTask *)v11 appConfirmsAuth])
  {
    [v6 setDelegate:self];
    [v6 discoverServices:0];
    goto LABEL_19;
  }
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  v13 = self;
  uint64_t v14 = 10;
  uint64_t v12 = 0;
LABEL_28:
  -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](v13, "_reportEvent:error:endCurrentTask:", v14, 0, v12, v17, currentTask);
LABEL_19:
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v9;
    currentTask = self->_currentTask;
    id v12 = v8;
    LogPrintF();
  }
  [(CBPeripheral *)self->_cbPeripheral untag:@"DA_ASK_RETAIN_DEVICE", v12, v13, currentTask];
  int64_t v10 = [v8 identifier];
  uint64_t v14 = self->_currentTask;
  CFStringRef v11 = DAErrorF();
  -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v11, v10, v14);
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v6;
    currentTask = self->_currentTask;
    LogPrintF();
  }
  if (self->_currentTask)
  {
    id v7 = [v6 identifier];
    id v8 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
    unsigned int v9 = [v7 isEqual:v8];

    if (v9)
    {
      [(CBPeripheral *)self->_cbPeripheral tag:@"DA_ASK_RETAIN_DEVICE"];
      if ([(DABluetoothTask *)self->_currentTask pairCTKD]
        && [(CBPeripheral *)self->_cbPeripheral hasTag:@"_CTKD_"])
      {
        [(CBPeripheral *)self->_cbPeripheral tag:@"_DENY_INCOMING_CLASSIC_CONNECTION_"];
        [(DABluetoothTask *)self->_currentTask setPairedCTKD:1];
      }
      [(DABluetoothPairingManager *)self _reportEvent:20 error:0 endCurrentTask:[(DABluetoothTask *)self->_currentTask appConfirmsAuth] ^ 1];
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    id v15 = CUPrintNSError();
    LogPrintF();
  }
  if (self->_currentTask)
  {
    id v10 = [v8 identifier];
    CFStringRef v11 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
    unsigned int v12 = [v10 isEqual:v11];

    if (v12)
    {
      [v8 untag:@"DA_ASK_RETAIN_DEVICE"];
      id v13 = [v8 identifier];
      currentTask = self->_currentTask;
      uint64_t v14 = DAErrorF();
      -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v14, v13, currentTask, v9);
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_currentTask)
  {
    id v7 = [v6 identifier];
    id v8 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
    unsigned int v9 = [v7 isEqual:v8];

    if (v9) {
      [(DABluetoothPairingManager *)self _reportEvent:20 error:0 endCurrentTask:1];
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a6;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_currentTask)
  {
    unsigned int v12 = [v10 identifier];
    id v13 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
    unsigned int v14 = [v12 isEqual:v13];

    if (v14)
    {
      int v15 = 0;
      uint64_t v16 = 10;
      switch(a5)
      {
        case 0:
          break;
        case 1:
          int v15 = 0;
          uint64_t v16 = 20;
          break;
        case 2:
          int v15 = 0;
          uint64_t v16 = 30;
          break;
        case 4:
          int v15 = 0;
          uint64_t v16 = 40;
          break;
        default:
          uint64_t v16 = 0;
          int v15 = 1;
          break;
      }
      id v17 = v11;
      if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v15)
      {
        id v18 = [v10 identifier];
        currentTask = self->_currentTask;
        DAErrorF();
        id v19 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v19, 1, v18, a5, currentTask);
      }
      else
      {
        id v20 = objc_alloc((Class)DABluetoothPairingInfo);
        id v21 = [v10 identifier];
        id v18 = [v20 initWithBluetoothIdentifier:v21 pairingType:v16];

        if (v18)
        {
          [v18 setPasskey:v17];
          id v19 = [(DABluetoothTask *)self->_currentTask eventHandler];
          ((void (**)(void, uint64_t, id, void))v19)[2](v19, 40, v18, 0);
        }
        else
        {
          id v19 = [(DABluetoothTask *)self->_currentTask eventHandler];
          CFStringRef v22 = [v10 identifier];
          CFStringRef v23 = DAErrorF();
          ((void (**)(void, uint64_t, void, void *))v19)[2](v19, 30, 0, v23);
        }
      }
    }
  }
}

- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 passkey:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    cbPeripheral = self->_cbPeripheral;
    currentTask = self->_currentTask;
    BOOL v22 = v7;
    id v24 = v11;
    id v18 = v10;
    uint64_t v20 = (unsigned __int16)a4;
    LogPrintF();
  }
  unsigned int v12 = [(DABluetoothTask *)self->_currentTask bluetoothUUID];
  if (![v10 isEqual:v12]) {
    goto LABEL_25;
  }
  id v13 = self->_cbPeripheral;

  if (v13)
  {
    unsigned int v12 = self->_cbPeripheral;
    if (a4 <= 19)
    {
      if (!a4)
      {
        uint64_t v21 = 3;
        CFStringRef v23 = self->_currentTask;
        id v19 = v10;
LABEL_24:
        id v17 = DAErrorF();
        -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v17, 1, v19, v21, v23);

        goto LABEL_25;
      }
      if (a4 == 10)
      {
        uint64_t v14 = 0;
        int v15 = 0;
LABEL_20:
        [(CBPairingAgent *)self->_cbPairingAgent respondToPairingRequest:v12 type:v14 accept:v7 data:v15];

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      switch(a4)
      {
        case 20:
          uint64_t v14 = 1;
          if (!v11) {
            goto LABEL_23;
          }
          goto LABEL_19;
        case 30:
          uint64_t v14 = 2;
          if (!v11)
          {
LABEL_23:
            uint64_t v21 = v14;
            CFStringRef v23 = self->_currentTask;
            id v19 = v10;
            goto LABEL_24;
          }
LABEL_19:
          uint64_t v27 = CBPairingAgentPairingDataPasskeyKey;
          id v28 = v11;
          id v16 = v11;
          int v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

          goto LABEL_20;
        case 40:
          uint64_t v14 = 4;
          if (!v11) {
            goto LABEL_23;
          }
          goto LABEL_19;
      }
    }
    uint64_t v14 = 3;
    if (!v11) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_26:
}

- (void)_addNewTask:(id)a3 completion:(id)a4 bluetoothOp:(int64_t)a5 pairCTKD:(BOOL)a6 displayName:(id)a7 taskTimeout:(id)a8 appConfirmsAuth:(BOOL)a9
{
  BOOL v11 = a6;
  id v27 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a4;
  id v18 = objc_alloc_init(DABluetoothTask);
  [(DABluetoothTask *)v18 setBluetoothUUID:v27];
  [(DABluetoothTask *)v18 setEventHandler:v17];

  [(DABluetoothTask *)v18 setBtOperation:a5];
  [(DABluetoothTask *)v18 setPairCTKD:v11];
  [(DABluetoothTask *)v18 setDisplayName:v16];

  [(DABluetoothTask *)v18 setTaskTimeout:v15];
  [(DABluetoothTask *)v18 setAppConfirmsAuth:a9];
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    BOOL v26 = v18;
    LogPrintF();
  }
  if (!self->_taskList)
  {
    id v19 = (NSMutableArray *)objc_opt_new();
    taskList = self->_taskList;
    self->_taskList = v19;
  }
  currentTask = self->_currentTask;
  if (!currentTask) {
    goto LABEL_14;
  }
  BOOL v22 = [(DABluetoothTask *)currentTask bluetoothUUID];
  CFStringRef v23 = [(DABluetoothTask *)v18 bluetoothUUID];
  if (![v22 isEqual:v23])
  {

    goto LABEL_14;
  }
  int64_t v24 = [(DABluetoothTask *)self->_currentTask btOperation];
  id v25 = [(DABluetoothTask *)v18 btOperation];

  if ((id)v24 != v25)
  {
LABEL_14:
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[NSMutableArray addObject:](self->_taskList, "addObject:", v18, v18);
    }
    else
    {
      -[NSMutableArray addObject:](self->_taskList, "addObject:", v18, v26);
    }
    goto LABEL_19;
  }
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_19:
  self->_busy = 1;
}

- (id)_getNextTask
{
  if ([(NSMutableArray *)self->_taskList count])
  {
    v3 = [(NSMutableArray *)self->_taskList objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_taskList removeObjectAtIndex:0];
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
}

- (BOOL)mitmPairing
{
  return self->_mitmPairing;
}

- (void)setMitmPairing:(BOOL)a3
{
  self->_BOOL mitmPairing = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (double)taskTimeoutSeconds
{
  return self->_taskTimeoutSeconds;
}

- (void)setTaskTimeoutSeconds:(double)a3
{
  self->_taskTimeoutSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_taskList, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_cbPairingAgent, 0);

  objc_storeStrong((id *)&self->_cbCentralManager, 0);
}

@end