@interface MAXpcManager
- (MAXpcManager)initWithServiceName:(id)a3 callbackQueue:(id)a4;
- (id)progressCallbacksForAssetType:(id)a3 assetId:(id)a4 withPurpose:(id)a5;
- (id)sendSync:(id)a3 gettingResponseCode:(int64_t *)a4 codeForXpcError:(int64_t)int64 loggingName:(id)a6;
- (void)attachProgressHandler:(id)a3 assetId:(id)a4 callBack:(id)a5 withPurpose:(id)a6;
- (void)clearConnection:(id)a3;
- (void)ensureConnection;
- (void)notifyClientsOfProgress:(id)a3;
- (void)restoreProgressCallbacks:(id)a3 assetType:(id)a4 assetId:(id)a5 withPurpose:(id)a6;
- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5;
- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6;
- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6 retryInitialReconnectionCount:(unint64_t)a7;
- (void)setClientConnectionHandler;
- (void)setClientName:(id)a3;
@end

@implementation MAXpcManager

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) ensureConnection];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    v3 = *(void **)(a1 + 40);
    id v4 = [v2 connectionId];
    xpc_dictionary_set_string(v3, "connectionIdentifier", (const char *)[v4 UTF8String]);

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 56);
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) connection];
    id v6 = *(id *)(*(void *)(a1 + 32) + 24);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_5;
    v25[3] = &unk_1E6005220;
    v30 = &v31;
    id v7 = v5;
    id v26 = v7;
    id v27 = *(id *)(a1 + 40);
    id v8 = v6;
    id v28 = v8;
    id v29 = *(id *)(a1 + 48);
    uint64_t v9 = MEMORY[0x1B3EAAEB0](v25);
    v14 = (void *)v9;
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) <= *(void *)(a1 + 72))
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke_4", @"Need to wait to retry message send: originalReconnectionCount = %llu, currentReconnectionCount = %llu", v10, v11, v12, v13, *(void *)(a1 + 72));
      if (!*(void *)(*(void *)(a1 + 32) + 64))
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 64);
        *(void *)(v18 + 64) = v17;
      }
      *((unsigned char *)v32 + 24) = 1;
      v20 = *(void **)(*(void *)(a1 + 32) + 64);
      v21 = (void *)[v14 copy];
      [v20 addObject:v21];
    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "Result", 1);
    v15 = *(void **)(a1 + 56);
    if (!v15) {
      return;
    }
    v16 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_6;
    block[3] = &unk_1E60042B8;
    id v24 = v15;
    id v23 = *(id *)(a1 + 40);
    dispatch_async(v16, block);

    id v7 = v24;
  }
}

void __73__MAXpcManager_sendSync_gettingResponseCode_codeForXpcError_loggingName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) ensureConnection];
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v6 connectionId];
    xpc_dictionary_set_string(v7, "connectionIdentifier", (const char *)[v8 UTF8String]);

    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) connection];
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v9, *(xpc_object_t *)(a1 + 40));
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = MEMORY[0x1B3EAB1B0](*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v18 = MEMORY[0x1E4F145A8];
    if (v13 != MEMORY[0x1E4F145A8]) {
      return;
    }
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v19 == MEMORY[0x1E4F14520])
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]_block_invoke", @"%@ mobileassetd connection interrupted - retrying sync message: %@", v14, v15, v16, v17, *(void *)(a1 + 48));
      id v23 = [*(id *)(*(void *)(a1 + 32) + 8) connection];
      xpc_object_t v24 = xpc_connection_send_message_with_reply_sync(v23, *(xpc_object_t *)(a1 + 40));
      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      if (MEMORY[0x1B3EAB1B0](*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) != v18) {
        return;
      }
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    if (v19 == MEMORY[0x1E4F14528])
    {
      v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      [v20 clearConnection:v21];
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]_block_invoke", @"No active XPC connection to mobileassetd", v2, v3, v4, v5, v27);
    v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v22)
    {
      xpc_dictionary_set_int64(v22, "Result", 1);
    }
  }
}

- (void)ensureConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_serviceName && !self->_maConnection)
  {
    uint64_t v3 = [[MAXpcConnection alloc] initWithServiceName:self->_serviceName];
    maConnection = self->_maConnection;
    self->_maConnection = v3;

    if (self->_maConnection)
    {
      [(MAXpcManager *)self setClientConnectionHandler];
      uint64_t v9 = [(MAXpcConnection *)self->_maConnection connection];
      xpc_connection_activate(v9);

      id v14 = [(MAXpcConnection *)self->_maConnection connectionId];
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager ensureConnection]", @"Creating client/daemon connection: %@", v10, v11, v12, v13, (uint64_t)v14);
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"[(MAXpcManager *)"Could not ensure maConnection ensureConnection], v5, v6, v7, v8, v16);
    }
  }
}

- (void)setClientConnectionHandler
{
  uint64_t v3 = [(MAXpcConnection *)self->_maConnection connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__MAXpcManager_setClientConnectionHandler__block_invoke;
  handler[3] = &unk_1E6005298;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);
}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_5(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke_5", @"Retrying message send", a5, a6, a7, a8, v13);
  }
  uint64_t v9 = (_xpc_connection_s *)a1[4];
  uint64_t v10 = (void *)a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = (void *)a1[7];
  xpc_connection_send_message_with_reply(v9, v10, v11, v12);
}

- (id)sendSync:(id)a3 gettingResponseCode:(int64_t *)a4 codeForXpcError:(int64_t)int64 loggingName:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(MAXpcManager *)self setClientName:v10];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MAXpcManager_sendSync_gettingResponseCode_codeForXpcError_loggingName___block_invoke;
  block[3] = &unk_1E60051A8;
  void block[4] = self;
  id v13 = v10;
  id v24 = v13;
  id v26 = &v27;
  id v14 = v11;
  id v25 = v14;
  dispatch_sync(stateQueue, block);
  if (!v28[5]) {
    goto LABEL_7;
  }
  uint64_t v15 = MEMORY[0x1B3EAB1B0]();
  if (v15 != MEMORY[0x1E4F14590])
  {
    if (v15 == MEMORY[0x1E4F145A8]) {
      v20 = @"%@ Received XPC error for message sent to mobileassetd";
    }
    else {
      v20 = @"%@ Received XPC error for message sent to mobileassetd: unexpected xpc type for reply";
    }
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]", v20, v16, v17, v18, v19, (uint64_t)v14);
LABEL_7:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64 = xpc_dictionary_get_int64((xpc_object_t)v28[5], "Result");
  if (a4) {
LABEL_8:
  }
    *a4 = int64;
LABEL_9:
  id v21 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (void)setClientName:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", @"%s", getprogname());
  id v5 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v4, "clientName", (const char *)[v5 UTF8String]);
}

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6 retryInitialReconnectionCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  [(MAXpcManager *)self setClientName:v12];
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke;
  v29[3] = &unk_1E60051F8;
  BOOL v36 = a6;
  char v34 = v38;
  objc_copyWeak(&v35, &location);
  id v15 = v12;
  id v30 = v15;
  id v16 = v13;
  id v32 = self;
  id v33 = v16;
  id v31 = v14;
  id v17 = v14;
  uint64_t v18 = (void *)MEMORY[0x1B3EAAEB0](v29);
  stateQueue = self->_stateQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_4;
  v23[3] = &unk_1E6005248;
  v23[4] = self;
  id v24 = v15;
  uint64_t v27 = v38;
  unint64_t v28 = a7;
  id v25 = v18;
  id v26 = v16;
  id v20 = v16;
  id v21 = v18;
  id v22 = v15;
  dispatch_async(stateQueue, v23);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(v38, 8);
}

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6
{
}

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5
{
}

- (MAXpcManager)initWithServiceName:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)MAXpcManager;
    id v11 = [(MAXpcManager *)&v27 init];
    if (v11)
    {
      id v12 = [NSString stringWithFormat:@"%@%@", v7, @".maxpcmanager.state"];
      id v13 = (const char *)[v12 UTF8String];
      id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
      stateQueue = v11->_stateQueue;
      v11->_stateQueue = (OS_dispatch_queue *)v15;

      id v17 = [NSString stringWithFormat:@"%@%@", v7, @".maxpcmanager.progress"];
      uint64_t v18 = (const char *)[v17 UTF8String];
      uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
      progressQueue = v11->_progressQueue;
      v11->_progressQueue = (OS_dispatch_queue *)v20;

      objc_storeStrong((id *)&v11->_callbackQueue, a4);
      objc_storeStrong((id *)&v11->_serviceName, a3);
      uint64_t v22 = objc_opt_new();
      progressHandlers = v11->_progressHandlers;
      v11->_progressHandlers = (NSMutableDictionary *)v22;

      maConnection = v11->_maConnection;
      v11->_maConnection = 0;

      postConnectionRetryCallbacks = v11->_postConnectionRetryCallbacks;
      v11->_connectionRetryCount = 1;
      v11->_postConnectionRetryCallbacks = 0;
    }
    self = v11;
    id v10 = self;
  }

  return v10;
}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      if (*(unsigned char *)(a1 + 80))
      {
        _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke", @"Retrying message (original _connectionRetryCount: %llu"), v4, v5, v6, v7, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        [WeakRetained sendAsync:*(void *)(a1 + 32) clientHandler:*(void *)(a1 + 56) taskDescriptor:*(void *)(a1 + 40) withRetry:0 retryInitialReconnectionCount:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];

        goto LABEL_6;
      }
    }
    else if (v3 == (id)MEMORY[0x1E4F14528])
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = *(NSObject **)(v13 + 16);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_2;
      v18[3] = &unk_1E60051D0;
      v18[4] = v13;
      id v19 = *(id *)(a1 + 32);
      dispatch_async(v14, v18);
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke", @"xpc error that can be ignored", v4, v5, v6, v7, v15);
    }
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_3;
    block[3] = &unk_1E60051D0;
    void block[4] = v10;
    id v17 = v9;
    dispatch_async(v11, block);
  }
LABEL_6:
}

- (void)clearConnection:(id)a3
{
  xpc_object_t xdict = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!self->_maConnection)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager clearConnection:]", @"Connection invalid, connection already nil so ignoring", v4, v5, v6, v7, v19);
    goto LABEL_13;
  }
  _MobileAssetLog(0, 3, (uint64_t)"-[MAXpcManager clearConnection:]", @"Connection invalid, checking connection", v4, v5, v6, v7, v19);
  if (!xdict || [(MAXpcConnection *)self->_maConnection notValid]) {
    goto LABEL_4;
  }
  string = xpc_dictionary_get_string(xdict, "connectionIdentifier");
  if (!string)
  {
    uint64_t v15 = 0;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v15 = [NSString stringWithUTF8String:string];
  maConnection = self->_maConnection;
  if (!maConnection || !v15) {
    goto LABEL_12;
  }
  id v17 = [(MAXpcConnection *)maConnection connectionId];
  int v18 = [v17 isEqualToString:v15];

  if (v18)
  {
LABEL_4:
    uint64_t v8 = [(MAXpcConnection *)self->_maConnection connectionId];
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager clearConnection:]", @"connection cleared: %@", v9, v10, v11, v12, (uint64_t)v8);

    uint64_t v13 = self->_maConnection;
    self->_maConnection = 0;
  }
LABEL_13:
}

uint64_t __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearConnection:*(void *)(a1 + 40)];
}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
      [v5 removeObjectForKey:v4];
    }
  }
}

uint64_t __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __42__MAXpcManager_setClientConnectionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1B3EAB1B0]();
  if (v4 == MEMORY[0x1E4F14578])
  {
    uint64_t v9 = @"The client got a connection request";
    int v10 = 6;
    goto LABEL_7;
  }
  if (v4 == MEMORY[0x1E4F145A8])
  {
    if (v3 == (id)MEMORY[0x1E4F14528])
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(NSObject **)(v11 + 16);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__MAXpcManager_setClientConnectionHandler__block_invoke_2;
      v16[3] = &unk_1E6005270;
      v16[4] = v11;
      uint64_t v13 = v16;
    }
    else
    {
      if (v3 == (id)MEMORY[0x1E4F14550])
      {
        uint64_t v9 = @"termination imminent";
        goto LABEL_5;
      }
      if (v3 != (id)MEMORY[0x1E4F14520])
      {
        uint64_t v9 = @"Unknown Error";
        goto LABEL_5;
      }
      _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke", @"MobileAsset XPC connection interrupted", v5, v6, v7, v8, v15[0]);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v12 = *(NSObject **)(v14 + 16);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = (uint64_t)__42__MAXpcManager_setClientConnectionHandler__block_invoke_3;
      v15[3] = (uint64_t)&unk_1E6005270;
      v15[4] = v14;
      uint64_t v13 = v15;
    }
    dispatch_async(v12, v13);
    goto LABEL_8;
  }
  if (v4 != MEMORY[0x1E4F14590])
  {
    uint64_t v9 = @"Client connection handler received unknown";
LABEL_5:
    int v10 = 3;
LABEL_7:
    _MobileAssetLog(0, v10, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke", v9, v5, v6, v7, v8, v15[0]);
    goto LABEL_8;
  }
  if (xpc_dictionary_get_int64(v3, "messageAction") == 11) {
    [*(id *)(a1 + 32) notifyClientsOfProgress:v3];
  }
LABEL_8:
}

uint64_t __42__MAXpcManager_setClientConnectionHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearConnection:0];
}

uint64_t __42__MAXpcManager_setClientConnectionHandler__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke_3", @"Incrementing _connectionRetryCount: %llu", a5, a6, a7, a8, ++*(void *)(*(void *)(a1 + 32) + 56));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (void)notifyClientsOfProgress:(id)a3
{
  id v4 = a3;
  progressQueue = self->_progressQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MAXpcManager_notifyClientsOfProgress___block_invoke;
  v7[3] = &unk_1E60051D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(progressQueue, v7);
}

void __40__MAXpcManager_notifyClientsOfProgress___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1B3EAACB0]();
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "TotalExpected");
  int64_t v4 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "totalWritten");
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "taskDescriptor");
  if (!string)
  {
    _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", @"Skipping progress notification for empty task descriptor char", v6, v7, v8, v9, v40);
    uint64_t v14 = 0;
    goto LABEL_27;
  }
  uint64_t v14 = [NSString stringWithUTF8String:string];
  if (!v14)
  {
    id v32 = @"Skipping progress notification for empty task descriptor";
LABEL_12:
    _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", v32, v10, v11, v12, v13, v40);
    goto LABEL_27;
  }
  long long v15 = *(void **)(*(void *)(a1 + 40) + 48);
  if (!v15)
  {
    id v32 = @"Notified of progress while not having any registered progress handlers";
    goto LABEL_12;
  }
  long long v16 = [v15 objectForKey:v14];
  if (v16)
  {
    long long v17 = v16;
    uint64_t v18 = [v16 callBackArray];
    if (v18)
    {
      id v23 = (void *)v18;
      id v24 = objc_opt_new();
      if (v24)
      {
        uint64_t v29 = v24;
        [v24 setTotalWritten:v4];
        [v29 setTotalExpected:int64];
        objc_msgSend(v29, "setExpectedTimeRemaining:", xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "TimeEstimate"));
        objc_msgSend(v29, "setIsStalled:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "IsStalled"));
        id v30 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "TaskID");
        if (v30)
        {
          id v31 = [NSString stringWithCString:v30 encoding:1];
          [v29 setTaskDescription:v31];
        }
        else
        {
          objc_msgSend(v29, "setTaskDescription:");
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v33 = v23;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v41;
          do
          {
            uint64_t v37 = 0;
            do
            {
              if (*(void *)v41 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v40 + 1) + 8 * v37);
              v39 = (void *)MEMORY[0x1B3EAACB0](v34);
              if (v38) {
                (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v29);
              }
              ++v37;
            }
            while (v35 != v37);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
            uint64_t v35 = v34;
          }
          while (v34);
        }
      }
      else
      {
        _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", @"Skipping progress notification as object could not be allocated", v25, v26, v27, v28, v40);
      }
    }
    else
    {
      _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", @"Skipping progress notification for empty callBack array", v19, v20, v21, v22, v40);
    }
  }
LABEL_27:
}

- (void)attachProgressHandler:(id)a3 assetId:(id)a4 callBack:(id)a5 withPurpose:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  progressQueue = self->_progressQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MAXpcManager_attachProgressHandler_assetId_callBack_withPurpose___block_invoke;
  block[3] = &unk_1E60052C0;
  id v20 = v10;
  id v21 = v11;
  id v22 = v13;
  id v23 = self;
  id v24 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(progressQueue, block);
}

void __67__MAXpcManager_attachProgressHandler_assetId_callBack_withPurpose___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = normalizedAssetType(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  assembleTaskDescriptorWithPurpose((uint64_t)v9, *(void *)(a1 + 40), *(void **)(a1 + 48));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [*(id *)(*(void *)(a1 + 56) + 48) objectForKey:v13];
  id v11 = v10;
  if (v10)
  {
    [v10 addCallBack:*(void *)(a1 + 64)];
  }
  else
  {
    id v12 = [[MAProgressHandler alloc] initWithCallBack:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 56) + 48) setObject:v12 forKey:v13];
  }
}

- (void)restoreProgressCallbacks:(id)a3 assetType:(id)a4 assetId:(id)a5 withPurpose:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && [v10 count])
  {
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MAXpcManager_restoreProgressCallbacks_assetType_assetId_withPurpose___block_invoke;
    block[3] = &unk_1E60052E8;
    id v16 = v11;
    id v17 = v12;
    id v18 = v13;
    uint64_t v19 = self;
    id v20 = v10;
    dispatch_sync(progressQueue, block);
  }
}

void __71__MAXpcManager_restoreProgressCallbacks_assetType_assetId_withPurpose___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = normalizedAssetType(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  uint64_t v10 = assembleTaskDescriptorWithPurpose((uint64_t)v9, *(void *)(a1 + 40), *(void **)(a1 + 48));

  id v23 = (void *)v10;
  id v11 = [*(id *)(*(void *)(a1 + 56) + 48) objectForKey:v10];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = a1;
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
        if (v11)
        {
          uint64_t v19 = [v11 callBackArray];
          id v20 = (void *)MEMORY[0x1B3EAAEB0](v18);
          char v21 = [v19 containsObject:v20];

          if ((v21 & 1) == 0) {
            [v11 addCallBack:v18];
          }
        }
        else
        {
          id v22 = [[MAProgressHandler alloc] initWithCallBack:v18];
          [*(id *)(*(void *)(v12 + 56) + 48) setObject:v22 forKey:v23];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

- (id)progressCallbacksForAssetType:(id)a3 assetId:(id)a4 withPurpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  uint64_t v18 = normalizedAssetType((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v19 = assembleTaskDescriptorWithPurpose((uint64_t)v18, (uint64_t)v9, v10);

  progressQueue = self->_progressQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MAXpcManager_progressCallbacksForAssetType_assetId_withPurpose___block_invoke;
  block[3] = &unk_1E6004F58;
  long long v27 = &v28;
  void block[4] = self;
  id v21 = v19;
  id v26 = v21;
  dispatch_sync(progressQueue, block);
  id v22 = (void *)v29[5];
  if (v22)
  {
    id v23 = [v22 callBackArray];
  }
  else
  {
    id v23 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v23;
}

uint64_t __66__MAXpcManager_progressCallbacksForAssetType_assetId_withPurpose___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postConnectionRetryCallbacks, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_maConnection, 0);
}

@end