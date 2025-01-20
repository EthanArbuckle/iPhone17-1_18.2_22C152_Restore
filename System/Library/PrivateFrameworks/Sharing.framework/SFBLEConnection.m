@interface SFBLEConnection
- (BOOL)acceptor;
- (BOOL)bleEncrypted;
- (BOOL)latencyCritical;
- (BOOL)lePipeCapable;
- (BOOL)removeClient:(id)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SFBLEConnection)initWithDevice:(id)a3 acceptor:(BOOL)a4;
- (SFBLEDevice)peerDevice;
- (id)bluetoothBandwidthChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)connectionStateChangedHandler;
- (id)dataHandler;
- (id)invalidationHandler;
- (int64_t)connectionState;
- (unsigned)sessionFlags;
- (unsigned)useCase;
- (void)_activate;
- (void)_cleanupQueuedData:(int)a3;
- (void)_connectIfNeeded;
- (void)_invalidate;
- (void)_processQueuedData;
- (void)activate;
- (void)activateDirect;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3;
- (void)nearbyDidUpdateState:(id)a3;
- (void)sendData:(id)a3 completion:(id)a4;
- (void)sendDataDirect:(id)a3 completion:(id)a4;
- (void)setAcceptor:(BOOL)a3;
- (void)setBleEncrypted:(BOOL)a3;
- (void)setBluetoothBandwidthChangedHandler:(id)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setConnectionStateChangedHandler:(id)a3;
- (void)setDataHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLatencyCritical:(BOOL)a3;
- (void)setLePipeCapable:(BOOL)a3;
- (void)setPeerDevice:(id)a3;
- (void)setSessionFlags:(unsigned int)a3;
- (void)setUseCase:(unsigned int)a3;
@end

@implementation SFBLEConnection

- (SFBLEConnection)initWithDevice:(id)a3 acceptor:(BOOL)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v17 = 0;
  v18[0] = 0;
  v18[1] = 0;
  int v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)SFBLEConnection;
  v8 = [(SFBLEConnection *)&v15 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  v8->_acceptor = a4;
  v8->_bleEncrypted = 1;
  uint64_t v10 = SFMainQueue(v8);
  dispatchQueue = v9->_dispatchQueue;
  v9->_dispatchQueue = (OS_dispatch_queue *)v10;

  objc_storeStrong((id *)&v9->_peerDevice, a3);
  v12 = [v7 identifier];
  [v12 getUUIDBytes:v18];

  ASPrintF();
  if (v17)
  {
    v9->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v17);
    v13 = 0;
    if (!v16) {
      v13 = v9;
    }
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_connectRetrier)
  {
    FatalErrorF();
    goto LABEL_8;
  }
  if (self->_wpNearby)
  {
LABEL_8:
    v4 = (SFBLEConnection *)FatalErrorF();
    [(SFBLEConnection *)v4 description];
    return;
  }
  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SFBLEConnection;
  [(SFBLEConnection *)&v6 dealloc];
}

- (NSString)description
{
  v3 = [(SFBLEDevice *)self->_peerDevice identifier];
  [(NSMutableSet *)self->_clients count];
  v4 = NSPrintF();

  return (NSString *)v4;
}

- (void)setAcceptor:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__SFBLEConnection_setAcceptor___block_invoke;
  v4[3] = &unk_1E5BBCD90;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __31__SFBLEConnection_setAcceptor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 80);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v6 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v6))
    {
      v4 = "yes";
      if (*(unsigned char *)(v2 + 8)) {
        BOOL v5 = "yes";
      }
      else {
        BOOL v5 = "no";
      }
      if (!*(unsigned char *)(a1 + 40)) {
        v4 = "no";
      }
      v13 = v5;
      v14 = v4;
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 8) = *(unsigned char *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 9))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      [*(id *)(v7 + 40) invalidate];
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
    else
    {
      if (!*(void *)(v7 + 40))
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F5E1D0]);
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        [*(id *)(*(void *)(a1 + 32) + 40) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 136)];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __31__SFBLEConnection_setAcceptor___block_invoke_2;
        v15[3] = &unk_1E5BBC870;
        uint64_t v16 = *(void *)(a1 + 32);
        [*(id *)(v16 + 40) setActionHandler:v15];
        [*(id *)(*(void *)(a1 + 32) + 40) setInterval:3.0];
        [*(id *)(*(void *)(a1 + 32) + 40) startDirect];
        uint64_t v7 = *(void *)(a1 + 32);
      }
      objc_msgSend((id)v7, "_processQueuedData", v13, v14);
    }
  }
}

uint64_t __31__SFBLEConnection_setAcceptor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectIfNeeded];
}

- (int64_t)connectionState
{
  if (self->_connected) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFBLEConnection_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __27__SFBLEConnection_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)activateDirect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v3 = self;
  objc_sync_enter(v3);
  v3->_activateCalled = 1;
  objc_sync_exit(v3);

  [(SFBLEConnection *)v3 _activate];
}

- (void)_activate
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!self->_wpNearby)
    {
      v4 = +[SFBLEClient sharedClient];
      BOOL v5 = [v4 addNearbyDelegate:self];
      wpNearby = self->_wpNearby;
      self->_wpNearby = v5;
    }
    if (!self->_dataSendQueue)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      dataSendQueue = self->_dataSendQueue;
      self->_dataSendQueue = v7;
    }
    if (self->_acceptor)
    {
      self->_connected = 1;
      connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
      if (connectionStateChangedHandler) {
        connectionStateChangedHandler[2](connectionStateChangedHandler, 1);
      }
    }
    else if (!self->_connectRetrier)
    {
      id v10 = (CURetrier *)objc_alloc_init(MEMORY[0x1E4F5E1D0]);
      connectRetrier = self->_connectRetrier;
      self->_connectRetrier = v10;

      [(CURetrier *)self->_connectRetrier setDispatchQueue:self->_dispatchQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __28__SFBLEConnection__activate__block_invoke;
      v12[3] = &unk_1E5BBC870;
      v12[4] = self;
      [(CURetrier *)self->_connectRetrier setActionHandler:v12];
      [(CURetrier *)self->_connectRetrier setInterval:3.0];
      [(CURetrier *)self->_connectRetrier startDirect];
    }
    [(SFBLEConnection *)self _processQueuedData];
  }
}

uint64_t __28__SFBLEConnection__activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectIfNeeded];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SFBLEConnection_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFBLEConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_invalidateCalled = 1;
    [(CURetrier *)self->_connectRetrier invalidateDirect];
    connectRetrier = self->_connectRetrier;
    self->_connectRetrier = 0;

    [(SFBLEConnection *)self _cleanupQueuedData:4294960573];
    dataSendQueue = self->_dataSendQueue;
    self->_dataSendQueue = 0;

    if (self->_connected || self->_connecting)
    {
      *(_WORD *)&self->_connected = 0;
      int v6 = self->_ucat->var0;
      if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      wpNearby = self->_wpNearby;
      uint64_t v8 = [(SFBLEDevice *)self->_peerDevice identifier];
      [(WPNearby *)wpNearby disconnectFromPeer:v8];
    }
    v9 = self->_wpNearby;
    if (v9)
    {
      id v10 = +[SFBLEClient sharedClient];
      [v10 removeNearbyDelegate:self];

      v9 = self->_wpNearby;
    }
    self->_wpNearby = 0;

    int v11 = self->_ucat->var0;
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id bluetoothBandwidthChangedHandler = self->_bluetoothBandwidthChangedHandler;
    self->_id bluetoothBandwidthChangedHandler = 0;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0;

    clients = self->_clients;
    self->_clients = 0;

    id connectionStateChangedHandler = self->_connectionStateChangedHandler;
    self->_id connectionStateChangedHandler = 0;

    id dataHandler = self->_dataHandler;
    self->_id dataHandler = 0;

    id v18 = self->_invalidationHandler;
    self->_invalidationHandler = 0;
  }
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFBLEConnection_sendData_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFBLEConnection_sendData_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendDataDirect:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)sendDataDirect:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    id v7 = objc_alloc_init(SFBLEData);
    [(SFBLEData *)v7 setData:v8];
    [(SFBLEData *)v7 setCompletion:v6];
    [(NSMutableArray *)self->_dataSendQueue addObject:v7];
    [(SFBLEConnection *)self _processQueuedData];
  }
}

- (void)_connectIfNeeded
{
  v14[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CURetrier *)self->_connectRetrier succeededDirect];
  if (!self->_connected && !self->_connecting && [(WPNearby *)self->_wpNearby state] == 3)
  {
    self->_connecting = 1;
    kdebug_trace();
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v5 = [NSNumber numberWithBool:self->_bleEncrypted];
    [v4 setObject:v5 forKeyedSubscript:@"kCBConnectOptionEncryptionEnabled"];

    if ((self->_sessionFlags & 0x1000) != 0) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBConnectOptionDoNoDisconnectOnEncryptionFailure"];
    }
    if (self->_latencyCritical)
    {
      id v6 = getWPNearbyKeyConnectLatencyCritical[0]();
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v6];
    }
    if (self->_lePipeCapable)
    {
      id v7 = getWPNearbyLEPipeCapable[0]();
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
    }
    if (self->_useCase)
    {
      id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      v14[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      id v10 = getWPNearbyKeyUseCaseList[0]();
      [v4 setObject:v9 forKeyedSubscript:v10];
    }
    int v11 = self->_ucat->var0;
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_connectStartTime = CFAbsoluteTimeGetCurrent();
    wpNearby = self->_wpNearby;
    id v13 = [(SFBLEDevice *)self->_peerDevice identifier];
    [(WPNearby *)wpNearby connectToPeer:v13 withOptions:v4];
  }
}

- (void)_processQueuedData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_connected && !self->_currentData)
  {
    int v3 = [(NSMutableArray *)self->_dataSendQueue firstObject];
    currentData = self->_currentData;
    self->_currentData = v3;

    if (self->_currentData)
    {
      [(NSMutableArray *)self->_dataSendQueue removeObjectAtIndex:0];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v6 = [(SFBLEData *)self->_currentData data];
        id v7 = [(SFBLEData *)self->_currentData data];
        int v11 = v6;
        uint64_t v12 = [v7 length];
        LogPrintF();
      }
      id v8 = [(SFBLEData *)self->_currentData data];
      [v8 length];
      kdebug_trace();

      wpNearby = self->_wpNearby;
      id v13 = [(SFBLEData *)self->_currentData data];
      id v10 = [(SFBLEDevice *)self->_peerDevice identifier];
      [(WPNearby *)wpNearby sendData:v13 toPeer:v10];
    }
  }
}

- (void)_cleanupQueuedData:(int)a3
{
  id v4 = self;
  v45[1] = *MEMORY[0x1E4F143B8];
  currentData = self->_currentData;
  if (currentData)
  {
    id v6 = [(SFBLEData *)currentData completion];

    if (v6)
    {
      uint64_t v7 = [(SFBLEData *)v4->_currentData completion];
      id v8 = (void (**)(void, void))v7;
      if (a3)
      {
        id v9 = (void *)MEMORY[0x1E4F28C58];
        id v10 = v4;
        uint64_t v11 = *MEMORY[0x1E4F28760];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
        id v13 = (void *)v12;
        v14 = @"?";
        if (v12) {
          v14 = (__CFString *)v12;
        }
        v45[0] = v14;
        objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
        uint64_t v16 = v11;
        id v4 = v10;
        v17 = [v9 errorWithDomain:v16 code:a3 userInfo:v15];
        ((void (**)(void, void *))v8)[2](v8, v17);
      }
      else
      {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
      }
    }
    id v18 = v4->_currentData;
    v4->_currentData = 0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v34 = v4;
  v19 = v4->_dataSendQueue;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    uint64_t v36 = *MEMORY[0x1E4F28760];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "completion", v34);

        if (v25)
        {
          uint64_t v26 = [v24 completion];
          v27 = (void (**)(void, void))v26;
          if (a3)
          {
            v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v41 = v35;
            uint64_t v29 = [NSString stringWithUTF8String:DebugGetErrorString()];
            v30 = (void *)v29;
            v31 = @"?";
            if (v29) {
              v31 = (__CFString *)v29;
            }
            v42 = v31;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            v33 = [v28 errorWithDomain:v36 code:a3 userInfo:v32];
            ((void (**)(void, void *))v27)[2](v27, v33);
          }
          else
          {
            (*(void (**)(uint64_t, void))(v26 + 16))(v26, 0);
          }
        }
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v21);
  }

  [(NSMutableArray *)v34->_dataSendQueue removeAllObjects];
}

- (void)addClient:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  if (!clients)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = v4->_clients;
    v4->_clients = v6;

    clients = v4->_clients;
  }
  [(NSMutableSet *)clients addObject:v8];
  objc_sync_exit(v4);
}

- (BOOL)removeClient:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  [(NSMutableSet *)v5->_clients removeObject:v4];
  BOOL v6 = [(NSMutableSet *)v5->_clients count] != 0;
  objc_sync_exit(v5);

  return v6;
}

- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3
{
  id v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby) {
    BOOL v5 = wpNearby == v9;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(WPNearby *)v9 btBandwidthState];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id bluetoothBandwidthChangedHandler = (void (**)(id, uint64_t))self->_bluetoothBandwidthChangedHandler;
    if (bluetoothBandwidthChangedHandler) {
      bluetoothBandwidthChangedHandler[2](bluetoothBandwidthChangedHandler, v6);
    }
  }
}

- (void)nearbyDidUpdateState:(id)a3
{
  id v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby) {
    BOOL v5 = wpNearby == v10;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    unint64_t v6 = [(WPNearby *)v10 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v6 <= 5)
    {
      if (((1 << v6) & 0x36) != 0)
      {
        if (self->_connecting || self->_connected)
        {
          *(_WORD *)&self->_connected = 0;
          int v8 = self->_ucat->var0;
          if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
      else if (v6 == 3 && !self->_acceptor)
      {
        [(SFBLEConnection *)self _connectIfNeeded];
      }
    }
    id bluetoothStateChangedHandler = (void (**)(id, unint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
    }
  }
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v12 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v13 = self->_peerDevice;
  wpNearby = self->_wpNearby;

  if (wpNearby)
  {
    if (wpNearby == v12)
    {
      objc_super v15 = [(SFBLEDevice *)v13 identifier];
      int v16 = [v15 isEqual:v9];

      if (v16)
      {
        self->_connecting = 0;
        if (self->_acceptor)
        {
          if (v10)
          {
            int var0 = self->_ucat->var0;
            if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
          }
          else
          {
            if (!self->_connected)
            {
              self->_connected = 1;
              int v20 = self->_ucat->var0;
              if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
            }
            id connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (connectionStateChangedHandler) {
              connectionStateChangedHandler[2](connectionStateChangedHandler, 1);
            }
            [(SFBLEConnection *)self _processQueuedData];
          }
        }
        else
        {
          double v18 = CFAbsoluteTimeGetCurrent() - self->_connectStartTime;
          self->_connected = v10 == 0;
          if (v10)
          {
            int v19 = self->_ucat->var0;
            if (v19 <= 50 && (v19 != -1 || _LogCategory_Initialize()))
            {
              id v30 = v10;
              double v29 = v18;
              LogPrintF();
            }
            uint64_t v22 = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (v22) {
              v22[2](v22, 2);
            }
            [(CURetrier *)self->_connectRetrier failedDirect];
          }
          else
          {
            kdebug_trace();
            int v21 = self->_ucat->var0;
            if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
            {
              double v29 = v18;
              LogPrintF();
            }
            v23 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", *(void *)&v29);
            v31[0] = @"SFBluetoothNotificationKeyConnectStart";
            v24 = [NSNumber numberWithDouble:self->_connectStartTime];
            v32[0] = v24;
            v31[1] = @"SFBluetoothNotificationKeyConnectTime";
            v25 = [NSNumber numberWithDouble:v18];
            v31[2] = @"SFBluetoothNotificationKeyPeerDevice";
            v32[1] = v25;
            v32[2] = v13;
            uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
            [v23 postNotificationName:@"SFBluetoothNotificationNameConnected" object:self userInfo:v26];

            [(CURetrier *)self->_connectRetrier succeededDirect];
            v27 = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (v27) {
              v27[2](v27, 1);
            }
            [(SFBLEConnection *)self _processQueuedData];
          }
        }
      }
    }
  }
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v11 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  id v13 = 0;
  if (!wpNearby) {
    goto LABEL_17;
  }
  if (wpNearby != v11) {
    goto LABEL_17;
  }
  id v13 = self->_peerDevice;
  v14 = [(SFBLEDevice *)v13 identifier];
  int v15 = [v14 isEqual:v8];

  if (!v15) {
    goto LABEL_17;
  }
  *(_WORD *)&self->_connected = 0;
  int var0 = self->_ucat->var0;
  if (v9)
  {
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
    id v20 = v9;
  }
  else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_14;
  }
  LogPrintF();
LABEL_14:
  -[SFBLEConnection _cleanupQueuedData:](self, "_cleanupQueuedData:", 4294960543, v20);
  id connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
  if (connectionStateChangedHandler) {
    connectionStateChangedHandler[2](connectionStateChangedHandler, 2);
  }
  [(CURetrier *)self->_connectRetrier failedDirect];
  double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v21 = @"SFBluetoothNotificationKeyPeerDevice";
  v22[0] = v13;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v18 postNotificationName:@"SFBluetoothNotificationNameDisconnected" object:self userInfo:v19];

LABEL_17:
}

- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v25 = a4;
  id v10 = a5;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  id v13 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (!wpNearby) {
    goto LABEL_24;
  }
  if (wpNearby != v13) {
    goto LABEL_24;
  }
  int v15 = [(SFBLEDevice *)self->_peerDevice identifier];
  int v16 = [v15 isEqual:v10];

  if (!v16) {
    goto LABEL_24;
  }
  if (self->_currentData)
  {
    [v25 length];
    kdebug_trace();
    int var0 = self->_ucat->var0;
    if (v11)
    {
      if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_21;
      }
      uint64_t v23 = [v25 length];
      id v24 = v11;
      id v22 = v25;
    }
    else
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_21;
      }
      uint64_t v23 = [v25 length];
      id v22 = v25;
    }
    LogPrintF();
LABEL_21:
    int v19 = [(SFBLEData *)self->_currentData completion];

    if (v19)
    {
      id v20 = [(SFBLEData *)self->_currentData completion];
      ((void (**)(void, id))v20)[2](v20, v11);
    }
    currentData = self->_currentData;
    self->_currentData = 0;

    goto LABEL_24;
  }
  int v18 = self->_ucat->var0;
  if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v23 = [v25 length];
    id v24 = v11;
    id v22 = v25;
    LogPrintF();
  }
LABEL_24:
  [(SFBLEConnection *)self _processQueuedData];
}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  id v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
  {
    if (wpNearby == v10)
    {
      uint64_t v12 = [(SFBLEDevice *)self->_peerDevice identifier];
      int v13 = [v12 isEqual:v8];

      if (v13)
      {
        id dataHandler = (void (**)(id, id))self->_dataHandler;
        if (dataHandler) {
          dataHandler[2](dataHandler, v15);
        }
      }
    }
  }
  [(SFBLEConnection *)self _processQueuedData];
}

- (BOOL)acceptor
{
  return self->_acceptor;
}

- (id)bluetoothBandwidthChangedHandler
{
  return self->_bluetoothBandwidthChangedHandler;
}

- (void)setBluetoothBandwidthChangedHandler:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)connectionStateChangedHandler
{
  return self->_connectionStateChangedHandler;
}

- (void)setConnectionStateChangedHandler:(id)a3
{
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setDataHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (SFBLEDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_sessionFlags = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_useCase = a3;
}

- (BOOL)bleEncrypted
{
  return self->_bleEncrypted;
}

- (void)setBleEncrypted:(BOOL)a3
{
  self->_bleEncrypted = a3;
}

- (BOOL)latencyCritical
{
  return self->_latencyCritical;
}

- (void)setLatencyCritical:(BOOL)a3
{
  self->_latencyCritical = a3;
}

- (BOOL)lePipeCapable
{
  return self->_lePipeCapable;
}

- (void)setLePipeCapable:(BOOL)a3
{
  self->_lePipeCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong(&self->_connectionStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothBandwidthChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_dataSendQueue, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_connectRetrier, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end