@interface SFBLEPipe
- (BOOL)manualConnect;
- (NSString)description;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (SFBLEPipe)init;
- (SFBLEPipe)initWithPriority:(int64_t)a3;
- (id)_defaultPairedDeviceBluetoothIdentifier;
- (id)bluetoothStateChangedHandler;
- (id)connectionStateChangedHandler;
- (id)frameHandler;
- (id)getPeerUUID;
- (id)invalidationHandler;
- (int64_t)connectionState;
- (void)_activate;
- (void)_frameHandler:(unsigned __int8)a3 data:(id)a4;
- (void)_invalidate;
- (void)_readHandler;
- (void)_sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5;
- (void)_setupIfNeeded;
- (void)_setupPipe:(id)a3;
- (void)_tearDownPipe;
- (void)_writeHandler;
- (void)activate;
- (void)addFrameHandlerForType:(unsigned __int8)a3 handler:(id)a4;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeFrameHandlerForType:(unsigned __int8)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setConnectionStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFrameHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setManualConnect:(BOOL)a3;
@end

@implementation SFBLEPipe

- (SFBLEPipe)init
{
  return [(SFBLEPipe *)self initWithPriority:2];
}

- (SFBLEPipe)initWithPriority:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFBLEPipe;
  v4 = [(SFBLEPipe *)&v9 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = SFMainQueue(v4);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v5->_ucat = (LogCategory *)&gLogCategory_SFBLEPipe;
    v5->_btPipePriority = a3;
  }
  return v5;
}

- (void)dealloc
{
  if (self->_btPipe)
  {
    v4 = (SFBLEPipe *)FatalErrorF();
    [(SFBLEPipe *)v4 description];
  }
  else
  {
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
    v6.super_class = (Class)SFBLEPipe;
    [(SFBLEPipe *)&v6 dealloc];
  }
}

- (NSString)description
{
  return (NSString *)NSPrintF();
}

- (int64_t)connectionState
{
  if (self->_btConnected) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)getPeerUUID
{
  btPipe = self->_btPipe;
  if (btPipe)
  {
    v3 = [(CBScalablePipe *)btPipe peer];
    v4 = [v3 identifier];
  }
  else
  {
    v4 = 0;
  }

  return v4;
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

- (void)setIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  [(NSString *)self->_identifier UTF8String];
  ASPrintF();
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__SFBLEPipe_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __21__SFBLEPipe_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!self->_btWriteQueue)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      btWriteQueue = self->_btWriteQueue;
      self->_btWriteQueue = v4;
    }
    if (!self->_btCentral)
    {
      objc_super v6 = (CBCentralManager *)[objc_alloc((Class)getCBCentralManagerClass[0]()) initWithDelegate:self queue:self->_dispatchQueue];
      btCentral = self->_btCentral;
      self->_btCentral = v6;
    }
    if (!self->_btPipeManager)
    {
      v8 = (CBScalablePipeManager *)[objc_alloc((Class)getCBScalablePipeManagerClass[0]()) initWithDelegate:self queue:self->_dispatchQueue];
      btPipeManager = self->_btPipeManager;
      self->_btPipeManager = v8;
    }
    [(SFBLEPipe *)self _setupIfNeeded];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SFBLEPipe_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__SFBLEPipe_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_invalidateCalled = 1;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v32 = self;
    v4 = self->_btWriteQueue;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v12 = [v11 completion];

          if (v12)
          {
            v13 = [v11 completion];
            v14 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v37 = v9;
            uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
            v16 = (void *)v15;
            v17 = @"?";
            if (v15) {
              v17 = (__CFString *)v15;
            }
            v38 = v17;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            v19 = [v14 errorWithDomain:v8 code:-6723 userInfo:v18];
            ((void (**)(void, void *))v13)[2](v13, v19);
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)v32->_btWriteQueue removeAllObjects];
    btWriteQueue = v32->_btWriteQueue;
    v32->_btWriteQueue = 0;

    v21 = v32->_identifier;
    [(SFBLEPipe *)v32 _tearDownPipe];
    if (v21 && (v32->_btEndpointRegistered || v32->_btEndpointRegistering)) {
      [(CBScalablePipeManager *)v32->_btPipeManager unregisterEndpoint:v21];
    }
    *(_WORD *)&v32->_btEndpointRegistering = 0;
    [(CBScalablePipeManager *)v32->_btPipeManager setDelegate:0];
    btPipeManager = v32->_btPipeManager;
    v32->_btPipeManager = 0;

    btPipe = v32->_btPipe;
    v32->_btPipe = 0;

    btCentral = v32->_btCentral;
    v32->_btCentral = 0;

    [(NSMutableDictionary *)v32->_frameHandlers removeAllObjects];
    frameHandlers = v32->_frameHandlers;
    v32->_frameHandlers = 0;

    int v26 = v32->_ucat->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))v32->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id bluetoothStateChangedHandler = v32->_bluetoothStateChangedHandler;
    v32->_id bluetoothStateChangedHandler = 0;

    id connectionStateChangedHandler = v32->_connectionStateChangedHandler;
    v32->_id connectionStateChangedHandler = 0;

    id frameHandler = v32->_frameHandler;
    v32->_id frameHandler = 0;

    id v31 = v32->_invalidationHandler;
    v32->_invalidationHandler = 0;
  }
}

- (void)addFrameHandlerForType:(unsigned __int8)a3 handler:(id)a4
{
  uint64_t v4 = a3;
  id aBlock = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = aBlock;
  if (!v6->_frameHandlers)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    frameHandlers = v6->_frameHandlers;
    v6->_frameHandlers = v8;

    uint64_t v7 = aBlock;
  }
  v10 = _Block_copy(v7);
  v11 = v6->_frameHandlers;
  v12 = [NSNumber numberWithUnsignedChar:v4];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

  objc_sync_exit(v6);
}

- (void)removeFrameHandlerForType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  frameHandlers = obj->_frameHandlers;
  uint64_t v5 = [NSNumber numberWithUnsignedChar:v3];
  [(NSMutableDictionary *)frameHandlers removeObjectForKey:v5];

  objc_sync_exit(obj);
}

- (void)sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__SFBLEPipe_sendFrameType_payload_completion___block_invoke;
  v13[3] = &unk_1E5BBF300;
  unsigned __int8 v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __46__SFBLEPipe_sendFrameType_payload_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendFrameTypeDirect:*(unsigned __int8 *)(a1 + 56) payload:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  int v29 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v9)
    {
      unsigned __int8 v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28760];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v18 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v14 = (void *)v18;
      v19 = @"?";
      if (v18) {
        v19 = (__CFString *)v18;
      }
      v33[0] = v19;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v20 = v16;
      uint64_t v21 = v17;
      uint64_t v22 = -6709;
LABEL_20:
      v27 = [v20 errorWithDomain:v21 code:v22 userInfo:v15];
      v9[2](v9, v27);

      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v11 = [v8 length];
    unint64_t v12 = v11;
    if (v11 < 0x989681)
    {
      LOBYTE(v29) = a3;
      BYTE1(v29) = BYTE2(v11);
      BYTE2(v29) = BYTE1(v11);
      HIBYTE(v29) = v11;
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v29 length:4];
      [v14 appendData:v8];
      id v15 = objc_alloc_init(SFBLEData);
      [(SFBLEData *)v15 setData:v14];
      [(SFBLEData *)v15 setCompletion:v9];
      [(NSMutableArray *)self->_btWriteQueue addObject:v15];
      [(SFBLEPipe *)self _writeHandler];
LABEL_21:

      goto LABEL_22;
    }
    int v13 = self->_ucat->var0;
    if (v13 <= 50 && (v13 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v28 = v12;
      LogPrintF();
    }
    if (v9)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28760];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      uint64_t v25 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v14 = (void *)v25;
      int v26 = @"?";
      if (v25) {
        int v26 = (__CFString *)v25;
      }
      id v31 = v26;
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v28);
      id v15 = (SFBLEData *)objc_claimAutoreleasedReturnValue();
      v20 = v23;
      uint64_t v21 = v24;
      uint64_t v22 = -6743;
      goto LABEL_20;
    }
  }
LABEL_22:
}

- (void)_setupIfNeeded
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_btEndpointRegistered
    && !self->_btEndpointRegistering
    && [(CBScalablePipeManager *)self->_btPipeManager state] == 5)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = self->_identifier;
    if (!v4)
    {
      int v16 = self->_ucat->var0;
      if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return;
    }
    uint64_t v5 = v4;
    BOOL v6 = self->_btCentral == 0;
    uint64_t v7 = getCBScalablePipeOptionTransport[0]();
    v19 = v7;
    v20[0] = &unk_1EFA095A8;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

    [(CBScalablePipeManager *)self->_btPipeManager registerEndpoint:v5 type:v6 priority:self->_btPipePriority options:v8];
    self->_btEndpointRegistering = 1;
  }
  if (self->_manualConnect
    && self->_btEndpointRegistered
    && self->_btCentral
    && !self->_btConnected
    && !self->_btConnecting)
  {
    uint64_t v9 = [(SFBLEPipe *)self _defaultPairedDeviceBluetoothIdentifier];
    v10 = (void *)v9;
    if (v9)
    {
      btCentral = self->_btCentral;
      uint64_t v18 = v9;
      unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      int v13 = [(CBCentralManager *)btCentral retrievePeripheralsWithIdentifiers:v12];
      id v14 = [v13 firstObject];

      int v15 = self->_ucat->var0;
      if (v14)
      {
        if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        kdebug_trace();
        [(CBCentralManager *)self->_btCentral connectPeripheral:v14 options:0];
        self->_btConnecting = 1;

        goto LABEL_22;
      }
      if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize())
      {
LABEL_22:

        return;
      }
    }
    else
    {
      int v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_22;
      }
    }
    LogPrintF();
    goto LABEL_22;
  }
}

- (void)_setupPipe:(id)a3
{
  id v5 = a3;
  [(SFBLEPipe *)self _tearDownPipe];
  objc_storeStrong((id *)&self->_btPipe, a3);
  BOOL v6 = (channel *)[v5 channel];
  self->_btChannel = v6;
  if (!v6)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
LABEL_24:
    LogPrintF();
    goto LABEL_25;
  }
  os_channel_ring_id();
  uint64_t v7 = (channel_ring_desc *)os_channel_rx_ring();
  self->_btReadRing = v7;
  if (!v7)
  {
    int v22 = self->_ucat->var0;
    if (v22 > 60 || v22 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  os_channel_ring_id();
  id v8 = (channel_ring_desc *)os_channel_tx_ring();
  self->_btWriteRing = v8;
  if (!v8)
  {
    int v23 = self->_ucat->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unsigned int fd = os_channel_get_fd();
  self->_btFD = fd;
  if ((fd & 0x80000000) != 0)
  {
    int v24 = self->_ucat->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], fd, 0, (dispatch_queue_t)self->_dispatchQueue);
  btReadSource = self->_btReadSource;
  self->_btReadSource = v10;

  unint64_t v12 = self->_btReadSource;
  if (v12)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__SFBLEPipe__setupPipe___block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    int v13 = self->_btReadSource;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __24__SFBLEPipe__setupPipe___block_invoke_2;
    v30[3] = &unk_1E5BBC870;
    id v14 = v5;
    id v31 = v14;
    dispatch_source_set_cancel_handler(v13, v30);

    dispatch_resume((dispatch_object_t)self->_btReadSource);
    *(_OWORD *)&self->_btReadLen = xmmword_1A56EA630;
    btReadPayload = self->_btReadPayload;
    self->_btReadPayload = 0;

    int v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144B0], self->_btFD, 0, (dispatch_queue_t)self->_dispatchQueue);
    btWriteSource = self->_btWriteSource;
    self->_btWriteSource = v16;

    uint64_t v18 = self->_btWriteSource;
    if (v18)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __24__SFBLEPipe__setupPipe___block_invoke_3;
      v29[3] = &unk_1E5BBC870;
      v29[4] = self;
      dispatch_source_set_event_handler(v18, v29);
      v19 = self->_btWriteSource;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __24__SFBLEPipe__setupPipe___block_invoke_4;
      v27[3] = &unk_1E5BBC870;
      id v28 = v14;
      dispatch_source_set_cancel_handler(v19, v27);

      self->_btWriteSuspended = 1;
      int v20 = self->_ucat->var0;
      if (v20 <= 50 && (v20 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFBLEPipe *)self _writeHandler];
      goto LABEL_12;
    }
  }
LABEL_25:
  int v25 = self->_ucat->var0;
  if (v25 <= 60 && (v25 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v26 = 4294960596;
    LogPrintF();
  }
  [(SFBLEPipe *)self _tearDownPipe];
LABEL_12:
}

uint64_t __24__SFBLEPipe__setupPipe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readHandler];
}

uint64_t __24__SFBLEPipe__setupPipe___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeHandler];
}

- (void)_tearDownPipe
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (self->_btPipe)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  self->_btChannel = 0;
  self->_btFD = -1;
  btPipe = self->_btPipe;
  self->_btPipe = 0;

  btReadPayload = self->_btReadPayload;
  self->_btReadPayload = 0;

  self->_btReadRing = 0;
  btReadSource = self->_btReadSource;
  if (btReadSource)
  {
    uint64_t v7 = btReadSource;
    dispatch_source_cancel(v7);
    id v8 = self->_btReadSource;
    self->_btReadSource = 0;
  }
  btWriteData = self->_btWriteData;
  self->_btWriteData = 0;

  btWriteItem = self->_btWriteItem;
  if (btWriteItem)
  {
    unint64_t v11 = [(SFBLEData *)btWriteItem completion];

    if (v11)
    {
      unint64_t v12 = [(SFBLEData *)self->_btWriteItem completion];
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28760];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
      int v16 = (void *)v15;
      int v17 = @"?";
      if (v15) {
        int v17 = (__CFString *)v15;
      }
      v24[0] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v19 = [v13 errorWithDomain:v14 code:-6723 userInfo:v18];
      ((void (**)(void, void *))v12)[2](v12, v19);
    }
    int v20 = self->_btWriteItem;
    self->_btWriteItem = 0;
  }
  self->_btWritePtr = 0;
  self->_btWriteRing = 0;
  btWriteSource = self->_btWriteSource;
  if (btWriteSource)
  {
    dispatch_source_cancel(btWriteSource);
    if (self->_btWriteSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_btWriteSource);
      self->_btWriteSuspended = 0;
    }
    int v22 = self->_btWriteSource;
    self->_btWriteSource = 0;
  }
}

- (void)_readHandler
{
  if (os_channel_get_next_slot())
  {
    while (os_channel_get_next_slot())
      ;
    if (os_channel_advance_slot())
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    if (os_channel_sync())
    {
      int v4 = self->_ucat->var0;
      if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  int v5 = self->_ucat->var0;
  if (v5 <= 10 && (v5 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_writeHandler
{
  if (!self->_btWriteRing)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_42:
    LogPrintF();
    return;
  }
  uint64_t v3 = 0;
  while (1)
  {
    unsigned __int16 v20 = 0;
    if (!self->_btWriteItem)
    {
      int v4 = [(NSMutableArray *)self->_btWriteQueue firstObject];
      btWriteItem = self->_btWriteItem;
      self->_btWriteItem = v4;

      if (!self->_btWriteItem) {
        goto LABEL_32;
      }
      [(NSMutableArray *)self->_btWriteQueue removeObjectAtIndex:0];
      BOOL v6 = [(SFBLEData *)self->_btWriteItem data];
      btWriteData = self->_btWriteData;
      self->_btWriteData = v6;

      self->_btWritePtr = (const char *)[(NSData *)self->_btWriteData bytes];
      self->_unint64_t btWriteLen = [(NSData *)self->_btWriteData length];
      self->_unint64_t btWriteOffset = 0;
      kdebug_trace();
    }
    unint64_t btWriteLen = self->_btWriteLen;
    unint64_t btWriteOffset = self->_btWriteOffset;
    unint64_t v10 = btWriteLen - btWriteOffset;
    if (btWriteLen == btWriteOffset) {
      break;
    }
    if (!os_channel_get_next_slot()) {
      goto LABEL_48;
    }
    do
    {
      if (v10 >= v20) {
        size_t v11 = v20;
      }
      else {
        size_t v11 = v10;
      }
      memcpy(0, self->_btWritePtr, v11);
      unsigned __int16 v20 = v11;
      os_channel_set_slot_properties();
      unint64_t v12 = &self->_btWritePtr[v11];
      self->_btWriteOffset += v11;
      self->_btWritePtr = v12;
      v3 += v11;
      v10 -= v11;
    }
    while (v10 && os_channel_get_next_slot());
    if (os_channel_advance_slot())
    {
      int v13 = self->_ucat->var0;
      if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    if (os_channel_sync())
    {
      int v14 = self->_ucat->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    if (v10)
    {
LABEL_48:
      if (self->_btWriteSuspended)
      {
        self->_btWriteSuspended = 0;
        dispatch_resume((dispatch_object_t)self->_btWriteSource);
      }
      break;
    }
    kdebug_trace();
    uint64_t v15 = [(SFBLEData *)self->_btWriteItem completion];

    if (v15)
    {
      int v16 = [(SFBLEData *)self->_btWriteItem completion];
      v16[2](v16, 0);
    }
    int v17 = self->_btWriteItem;
    self->_btWriteItem = 0;
  }
  if (self->_btWriteItem) {
    goto LABEL_34;
  }
LABEL_32:
  if (!self->_btWriteSuspended)
  {
    self->_btWriteSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_btWriteSource);
  }
LABEL_34:
  int v18 = self->_ucat->var0;
  if (v18 <= 10 && (v18 != -1 || _LogCategory_Initialize())) {
    goto LABEL_42;
  }
}

- (void)_frameHandler:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id frameHandler = (void (**)(id, void, id))self->_frameHandler;
  id v12 = v6;
  if (frameHandler) {
    frameHandler[2](frameHandler, v4, v6);
  }
  id v8 = self;
  objc_sync_enter(v8);
  frameHandlers = v8->_frameHandlers;
  unint64_t v10 = [NSNumber numberWithUnsignedChar:v4];
  size_t v11 = [(NSMutableDictionary *)frameHandlers objectForKeyedSubscript:v10];

  if (v11) {
    ((void (**)(void, uint64_t, id))v11)[2](v11, v4, v12);
  }

  objc_sync_exit(v8);
}

- (id)_defaultPairedDeviceBluetoothIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc((Class)getIDSServiceClass[0]()) initWithService:@"com.apple.private.alloy.nearby"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = objc_msgSend(v2, "devices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isDefaultPairedDevice])
        {
          uint64_t v9 = [v8 nsuuid];
          if (v9)
          {
            unint64_t v10 = (void *)v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v8 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btCentral = self->_btCentral;
  if (btCentral) {
    BOOL v5 = btCentral == v8;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    switch([(CBCentralManager *)v8 state])
    {
      case 1:
        int v6 = 0;
        break;
      case 2:
        int v6 = 0;
        break;
      case 3:
        int v6 = 0;
        break;
      case 4:
        int v6 = 0;
        break;
      case 5:
        int v6 = 1;
        break;
      default:
        int v6 = 0;
        break;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v6) {
      [(SFBLEPipe *)self _setupIfNeeded];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v11 = a4;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v7 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral) {
    BOOL v9 = btCentral == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  unint64_t v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral && btCentral == v10)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v15;
      id v14 = v8;
      LogPrintF();
    }
    *(_WORD *)&self->_btConnected = 0;
    [(SFBLEPipe *)self _setupIfNeeded];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v16 = a4;
  id v8 = (__CFString *)a5;
  dispatchQueue = self->_dispatchQueue;
  unint64_t v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral && btCentral == v10)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = @"success";
      if (v8) {
        id v13 = v8;
      }
      id v14 = v16;
      id v15 = v13;
      LogPrintF();
    }
    *(_WORD *)&self->_btConnected = 0;
    [(SFBLEPipe *)self _setupIfNeeded];
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CBScalablePipeManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btPipeManager = self->_btPipeManager;
  if (btPipeManager) {
    BOOL v6 = btPipeManager == v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = [(CBScalablePipeManager *)v4 state];
    if ((unint64_t)(v7 - 1) > 4) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = qword_1A56EA640[v7 - 1];
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (v8 > 5) {
        unint64_t v10 = "?";
      }
      else {
        unint64_t v10 = off_1E5BBF320[v8];
      }
      long long v34 = v10;
      LogPrintF();
    }
    unint64_t v11 = v8 - 1;
    switch(v8)
    {
      case 1uLL:
      case 4uLL:
      case 5uLL:
        goto LABEL_19;
      case 2uLL:
        long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v45 = @"SFNotificationKeyConnectionState";
        v46[0] = &unk_1EFA095C0;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        [v12 postNotificationName:@"SFNotificationNameBTPoweredOff" object:self userInfo:v13];

LABEL_19:
        int v14 = self->_ucat->var0;
        if (v14 <= 50 && (v14 != -1 || _LogCategory_Initialize()))
        {
          if (v11 > 4) {
            id v15 = "?";
          }
          else {
            id v15 = off_1E5BBF350[v11];
          }
          long long v34 = v15;
          LogPrintF();
        }
        unint64_t v35 = v8;
        long long v36 = self;
        uint64_t v37 = v4;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v16 = self->_btWriteQueue;
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v39;
          uint64_t v20 = *MEMORY[0x1E4F28760];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              int v24 = objc_msgSend(v23, "completion", v34);

              if (v24)
              {
                int v25 = [v23 completion];
                uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v42 = v21;
                uint64_t v27 = [NSString stringWithUTF8String:DebugGetErrorString()];
                id v28 = (void *)v27;
                int v29 = @"?";
                if (v27) {
                  int v29 = (__CFString *)v27;
                }
                v43 = v29;
                uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
                id v31 = [v26 errorWithDomain:v20 code:-6753 userInfo:v30];
                ((void (**)(void, void *))v25)[2](v25, v31);
              }
            }
            uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }
          while (v18);
        }

        self = v36;
        [(NSMutableArray *)v36->_btWriteQueue removeAllObjects];
        [(SFBLEPipe *)v36 _tearDownPipe];
        uint64_t v32 = v36->_identifier;
        if (v32 && (v36->_btEndpointRegistered || v36->_btEndpointRegistering)) {
          -[CBScalablePipeManager unregisterEndpoint:](v36->_btPipeManager, "unregisterEndpoint:", v32, v34);
        }
        *(_DWORD *)&v36->_btConnected = 0;

        uint64_t v4 = v37;
        unint64_t v8 = v35;
        break;
      case 3uLL:
        [(SFBLEPipe *)self _setupIfNeeded];
        break;
      default:
        break;
    }
    id bluetoothStateChangedHandler = (void (**)(id, unint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v8);
    }
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  unint64_t v11 = (CBScalablePipeManager *)a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v11 && self->_btPipeManager == v11 && [v8 isEqual:self->_identifier])
  {
    self->_btEndpointRegistering = 0;
    int var0 = self->_ucat->var0;
    if (v9)
    {
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_btEndpointRegistered = 1;
      [(SFBLEPipe *)self _setupIfNeeded];
    }
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v8 = (CBScalablePipeManager *)a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8 && self->_btPipeManager == v8 && [v6 isEqual:self->_identifier])
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(_WORD *)&self->_btEndpointRegistering = 0;
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (CBScalablePipeManager *)a3;
  id v7 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && self->_btPipeManager == v6)
  {
    kdebug_trace();
    *(_WORD *)&self->_btConnected = 1;
    [(SFBLEPipe *)self _setupPipe:v7];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v12 = @"SFNotificationKeyConnectionState";
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFBLEPipe connectionState](self, "connectionState"));
    v13[0] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v9 postNotificationName:@"SFNotificationNamePipeConnectionStateChanged" object:self userInfo:v11];
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = (CBScalablePipeManager *)a3;
  id v9 = a4;
  unint64_t v10 = (__CFString *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    if (self->_btPipeManager == v8)
    {
      unint64_t v11 = [v9 name];
      int v12 = [v11 isEqual:self->_identifier];

      if (v12)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        {
          int v14 = @"success";
          if (v10) {
            int v14 = v10;
          }
          id v18 = v9;
          uint64_t v19 = v14;
          LogPrintF();
        }
        [(SFBLEPipe *)self _tearDownPipe];
        *(_WORD *)&self->_btConnected = 0;
        id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v20 = @"SFNotificationKeyConnectionState";
        id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFBLEPipe connectionState](self, "connectionState"));
        v21[0] = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        [v15 postNotificationName:@"SFNotificationNamePipeConnectionStateChanged" object:self userInfo:v17];
      }
    }
  }
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

- (id)frameHandler
{
  return self->_frameHandler;
}

- (void)setFrameHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)manualConnect
{
  return self->_manualConnect;
}

- (void)setManualConnect:(BOOL)a3
{
  self->_manualConnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_frameHandler, 0);
  objc_storeStrong(&self->_connectionStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_lastDisconnectDate, 0);
  objc_storeStrong((id *)&self->_frameHandlers, 0);
  objc_storeStrong((id *)&self->_btPipeManager, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_btWriteSource, 0);
  objc_storeStrong((id *)&self->_btWriteQueue, 0);
  objc_storeStrong((id *)&self->_btWriteItem, 0);
  objc_storeStrong((id *)&self->_btWriteData, 0);
  objc_storeStrong((id *)&self->_btReadSource, 0);
  objc_storeStrong((id *)&self->_btReadPayload, 0);

  objc_storeStrong((id *)&self->_btCentral, 0);
}

@end