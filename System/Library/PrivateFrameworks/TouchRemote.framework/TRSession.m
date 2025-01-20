@interface TRSession
- (BOOL)isConnected;
- (NSMutableDictionary)messageHandlerMap;
- (OS_dispatch_queue)connectionQ;
- (OS_dispatch_queue)messageHandlerMapQ;
- (OS_dispatch_source)heartbeatRequestTimer;
- (TRAnisetteDataHandler)anisetteDataHandler;
- (TRConnection)connection;
- (TRNearbyDevice)nearbyDevice;
- (TRSession)init;
- (TRSession)initWithNearbyDevice:(id)a3;
- (id)_messageHandlerForMessageClass:(Class)a3;
- (id)disconnectHandler;
- (void)_handleEvent:(id)a3;
- (void)_handleHeartbeatWithResponseHandler:(id)a3;
- (void)_handleRequest:(id)a3;
- (void)_respondToRequest:(id)a3 withError:(id)a4;
- (void)_sendHeartbeats;
- (void)_sendResponse:(id)a3 forRequest:(id)a4;
- (void)_setMessageHandler:(id)a3 forMessageClass:(Class)a4;
- (void)disconnect;
- (void)sendEvent:(id)a3;
- (void)sendHeartbeatWithResponseHandler:(id)a3;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setAnisetteDataHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQ:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setEventHandler:(id)a3 forEventClass:(Class)a4;
- (void)setHeartbeatRequestTimer:(id)a3;
- (void)setMessageHandlerMap:(id)a3;
- (void)setMessageHandlerMapQ:(id)a3;
- (void)setNearbyDevice:(id)a3;
- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4;
@end

@implementation TRSession

- (TRSession)init
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"-init is not a valid initializer for the class %@", v4];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (TRSession)initWithNearbyDevice:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TRSession;
  id v6 = [(TRSession *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nearbyDevice, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    messageHandlerMap = v7->_messageHandlerMap;
    v7->_messageHandlerMap = (NSMutableDictionary *)v8;

    v10 = MEMORY[0x263EF83A8];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.TRSession.messageHandlerMapQ", MEMORY[0x263EF83A8]);
    messageHandlerMapQ = v7->_messageHandlerMapQ;
    v7->_messageHandlerMapQ = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.TRSession.connectionQ", v10);
    connectionQ = v7->_connectionQ;
    v7->_connectionQ = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(TRAnisetteDataHandler);
    anisetteDataHandler = v7->_anisetteDataHandler;
    v7->_anisetteDataHandler = v15;

    [(TRAnisetteDataHandler *)v7->_anisetteDataHandler registerForAnisetteDataRequestsFromSession:v7];
  }

  return v7;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  connectionQ = self->_connectionQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__TRSession_setConnection___block_invoke;
  v7[3] = &unk_264220880;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(connectionQ, v7);
}

void __27__TRSession_setConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __27__TRSession_setConnection___block_invoke_2;
  v12[3] = &unk_264220BC8;
  objc_copyWeak(&v13, &location);
  [v2 setInvalidationHandler:v12];
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__TRSession_setConnection___block_invoke_2_8;
  v10[3] = &unk_264220BC8;
  objc_copyWeak(&v11, &location);
  [v3 setInterruptionHandler:v10];
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__TRSession_setConnection___block_invoke_9;
  v8[3] = &unk_264221188;
  objc_copyWeak(&v9, &location);
  [v4 setEventMessageHandler:v8];
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__TRSession_setConnection___block_invoke_2_11;
  v6[3] = &unk_2642211B0;
  objc_copyWeak(&v7, &location);
  [v5 setRequestMessageHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __27__TRSession_setConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRSession setConnection:]_block_invoke_2";
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "%s Connection invalidated", buf, 0xCu);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__TRSession_setConnection___block_invoke_6;
    block[3] = &unk_264220858;
    block[4] = v4;
    dispatch_barrier_async(v5, block);
    id v6 = [v4 heartbeatRequestTimer];
    id v7 = v6;
    if (v6)
    {
      dispatch_source_cancel(v6);
      [v4 setHeartbeatRequestTimer:0];
    }
    uint64_t v8 = [v4 disconnectHandler];
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
  }
}

void __27__TRSession_setConnection___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void __27__TRSession_setConnection___block_invoke_2_8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[TRSession setConnection:]_block_invoke_2";
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "%s Connection interrupted", (uint8_t *)&v4, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained disconnect];
}

void __27__TRSession_setConnection___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

void __27__TRSession_setConnection___block_invoke_2_11(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRequest:v3];
}

- (TRConnection)connection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  connectionQ = self->_connectionQ;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23__TRSession_connection__block_invoke;
  v5[3] = &unk_2642211D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TRConnection *)v3;
}

void __23__TRSession_connection__block_invoke(uint64_t a1)
{
}

- (BOOL)isConnected
{
  v2 = [(TRSession *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)disconnect
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    BOOL v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [(TRSession *)self nearbyDevice];
      id v5 = [v4 identifier];
      *(_DWORD *)buf = 136315394;
      v10 = "-[TRSession disconnect]";
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Disconnect from device %@", buf, 0x16u);
    }
  }
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__TRSession_disconnect__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_barrier_async(messageHandlerMapQ, block);
  id v7 = [(TRSession *)self connection];
  [v7 invalidate];
}

void __23__TRSession_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)sendEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TRMessageEncoder encodeMessage:v4];
  if (_TRLogEnabled == 1)
  {
    uint64_t v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v13 = 136315650;
      v14 = "-[TRSession sendEvent:]";
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = [v5 length];
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Sending event of class %@ (%lu bytes).", (uint8_t *)&v13, 0x20u);
    }
  }
  id v9 = [(TRSession *)self connection];
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x263F6C270]);
    [v10 setBodyData:v5];
    __int16 v11 = [(TRSession *)self nearbyDevice];
    v12 = [v11 representedDevice];
    [v10 setPeerDevice:v12];

    [v9 sendEvent:v10];
  }
  else
  {
    if (_TRLogEnabled != 1) {
      goto LABEL_8;
    }
    v10 = TRLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[TRSession sendEvent:]";
      _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "%s Unable to send event message. Session not connected.", (uint8_t *)&v13, 0xCu);
    }
  }

LABEL_8:
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TRMessageEncoder encodeMessage:v6];
  if (_TRLogEnabled == 1)
  {
    id v9 = TRLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 136315650;
      v26 = "-[TRSession sendRequest:withResponseHandler:]";
      __int16 v27 = 2112;
      v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = [v8 length];
      _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending request of class %@ (%lu bytes).", buf, 0x20u);
    }
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__TRSession_sendRequest_withResponseHandler___block_invoke;
  v21[3] = &unk_264221200;
  id v12 = v7;
  id v22 = v12;
  int v13 = (void *)MEMORY[0x2166AC110](v21);
  v14 = [(TRSession *)self connection];
  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F6C2A0]);
    [v15 setBodyData:v8];
    [v15 setResponseHandler:v13];
    v16 = [(TRSession *)self nearbyDevice];
    __int16 v17 = [v16 representedDevice];
    [v15 setPeerDevice:v17];

    [v14 sendRequest:v15];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v18 = TRLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[TRSession sendRequest:withResponseHandler:]";
        _os_log_impl(&dword_2149BE000, v18, OS_LOG_TYPE_DEFAULT, "%s Unable to send request message. Session not connected.", buf, 0xCu);
      }
    }
    uint64_t v19 = *MEMORY[0x263F08338];
    v23[0] = *MEMORY[0x263F08320];
    v23[1] = v19;
    v24[0] = @"Unable to send request message.";
    v24[1] = @"The session must be connected before sending messages";
    id v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    v20 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9101 userInfo:v15];
    (*((void (**)(id, void *, void))v12 + 2))(v12, v20, 0);
  }
}

void __45__TRSession_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v46[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    v14 = [v6 bodyData];
    id v36 = 0;
    id v15 = +[TRMessageDecoder decodeMessage:v14 error:&v36];
    id v9 = v36;

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_TRLogEnabled == 1)
        {
          v24 = TRLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            *(_DWORD *)buf = 136315650;
            v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
            __int16 v41 = 2112;
            id v42 = v26;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v15;
            _os_log_impl(&dword_2149BE000, v24, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);
          }
        }
        uint64_t v27 = *MEMORY[0x263F08320];
        v38[0] = @"Invalid response message class.";
        uint64_t v28 = *MEMORY[0x263F08338];
        v37[0] = v27;
        v37[1] = v28;
        __int16 v29 = NSString;
        uint64_t v30 = (objc_class *)objc_opt_class();
        uint64_t v31 = NSStringFromClass(v30);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        v34 = [v29 stringWithFormat:@"Decoded class is not a subclass of %@: %@.", v31, v33];
        v38[1] = v34;
        v35 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

        uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9201 userInfo:v35];

        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_27;
      }
      if (_TRLogEnabled == 1)
      {
        v16 = TRLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = NSStringFromClass(v17);
          uint64_t v19 = [v7 bodyData];
          uint64_t v20 = [v19 length];
          *(_DWORD *)buf = 136315650;
          v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
          __int16 v41 = 2112;
          id v42 = v18;
          __int16 v43 = 2048;
          uint64_t v44 = v20;
          _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "%s Received response message of class: %@ (%lu bytes).", buf, 0x20u);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [v15 error];

        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_27:
        id v9 = (id)v21;
LABEL_30:

        goto LABEL_31;
      }
      v23 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        id v22 = TRLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
          __int16 v41 = 2112;
          id v42 = v9;
          _os_log_impl(&dword_2149BE000, v22, OS_LOG_TYPE_DEFAULT, "%s Failed to decode response message: %@", buf, 0x16u);
        }
      }
      v23 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v23();
    goto LABEL_30;
  }
  if (_TRLogEnabled == 1)
  {
    uint64_t v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Received empty response with error: %@", buf, 0x16u);
    }
  }
  id v9 = v5;
  v10 = [v9 domain];

  if (v10 != @"TRNearbyDeviceErrorDomain")
  {
    uint64_t v11 = *MEMORY[0x263F08338];
    v45[0] = *MEMORY[0x263F08320];
    v45[1] = v11;
    v46[0] = @"Communication failure.";
    v46[1] = @"Received an error in response to a request.";
    v45[2] = *MEMORY[0x263F08608];
    v46[2] = v9;
    id v12 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9104 userInfo:v12];

    id v9 = (id)v13;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_31:
}

- (void)_sendResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TRMessageEncoder encodeMessage:v6];
  if (_TRLogEnabled == 1)
  {
    id v9 = TRLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v14 = 136315650;
      id v15 = "-[TRSession _sendResponse:forRequest:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = [v8 length];
      _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending response of class %@ (%lu bytes).", (uint8_t *)&v14, 0x20u);
    }
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x263F6C2A8]) initWithRequestMessage:v7];

  [v12 setBodyData:v8];
  uint64_t v13 = [(TRSession *)self connection];
  [v13 sendResponse:v12];
}

- (void)_respondToRequest:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(TRErrorResponse);
  [(TRErrorResponse *)v8 setError:v6];

  [(TRSession *)self _sendResponse:v8 forRequest:v7];
}

- (void)_handleEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 bodyData];
  id v19 = 0;
  id v6 = +[TRMessageDecoder decodeMessage:v5 error:&v19];
  id v7 = v19;

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_TRLogEnabled == 1)
      {
        uint64_t v8 = TRLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (objc_class *)objc_opt_class();
          v10 = NSStringFromClass(v9);
          uint64_t v11 = [v4 bodyData];
          uint64_t v12 = [v11 length];
          *(_DWORD *)buf = 136315650;
          uint64_t v21 = "-[TRSession _handleEvent:]";
          __int16 v22 = 2112;
          v23 = v10;
          __int16 v24 = 2048;
          uint64_t v25 = v12;
          _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Received event message of class: %@ (%lu bytes).", buf, 0x20u);
        }
      }
      uint64_t v13 = [(TRSession *)self _handlerForEventClass:objc_opt_class()];
      int v14 = v13;
      if (v13)
      {
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v6);
LABEL_19:

        goto LABEL_20;
      }
      if (_TRLogEnabled != 1) {
        goto LABEL_19;
      }
      __int16 v16 = TRLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[TRSession _handleEvent:]";
        __int16 v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "%s No handler registered for message class: %@", buf, 0x16u);
      }
LABEL_18:

      goto LABEL_19;
    }
    if (_TRLogEnabled == 1)
    {
      int v14 = TRLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      id v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = "-[TRSession _handleEvent:]";
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v6;
      _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "%s Unarchived something other than a subclass of %@: %@", buf, 0x20u);
      goto LABEL_18;
    }
  }
  else if (_TRLogEnabled == 1)
  {
    int v14 = TRLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[TRSession _handleEvent:]";
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to decode event message: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_handleRequest:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 bodyData];
  id v38 = 0;
  id v6 = +[TRMessageDecoder decodeMessage:v5 error:&v38];
  id v7 = v38;

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_TRLogEnabled == 1)
      {
        uint64_t v8 = TRLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (objc_class *)objc_opt_class();
          v10 = NSStringFromClass(v9);
          uint64_t v11 = [v4 bodyData];
          uint64_t v12 = [v11 length];
          *(_DWORD *)buf = 136315650;
          id v42 = "-[TRSession _handleRequest:]";
          __int16 v43 = 2112;
          id v44 = v10;
          __int16 v45 = 2048;
          uint64_t v46 = v12;
          _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Received request message of class: %@ (%lu bytes).", buf, 0x20u);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __28__TRSession__handleRequest___block_invoke;
        v36[3] = &unk_264221228;
        v36[4] = self;
        id v37 = v4;
        [(TRSession *)self _handleHeartbeatWithResponseHandler:v36];
      }
      else
      {
        __int16 v29 = [(TRSession *)self _handlerForRequestClass:objc_opt_class()];
        if (v29)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __28__TRSession__handleRequest___block_invoke_48;
          v34[3] = &unk_264221228;
          v34[4] = self;
          id v35 = v4;
          ((void (**)(void, void *, void *))v29)[2](v29, v6, v34);
        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            uint64_t v30 = TRLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = (objc_class *)objc_opt_class();
              v32 = NSStringFromClass(v31);
              *(_DWORD *)buf = 136315394;
              id v42 = "-[TRSession _handleRequest:]";
              __int16 v43 = 2112;
              id v44 = v32;
              _os_log_impl(&dword_2149BE000, v30, OS_LOG_TYPE_DEFAULT, "%s No handler registered for message class: %@", buf, 0x16u);
            }
          }
          v33 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
          [(TRSession *)self _respondToRequest:v4 withError:v33];
        }
      }
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        int v14 = TRLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (objc_class *)objc_opt_class();
          __int16 v16 = NSStringFromClass(v15);
          __int16 v17 = (objc_class *)objc_opt_class();
          __int16 v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 136315650;
          id v42 = "-[TRSession _handleRequest:]";
          __int16 v43 = 2112;
          id v44 = v16;
          __int16 v45 = 2112;
          uint64_t v46 = (uint64_t)v18;
          _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);
        }
      }
      uint64_t v19 = *MEMORY[0x263F08320];
      v40[0] = @"Unknown message decoded.";
      uint64_t v20 = *MEMORY[0x263F08338];
      v39[0] = v19;
      v39[1] = v20;
      uint64_t v21 = NSString;
      __int16 v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      __int16 v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = [v21 stringWithFormat:@"Decoded class is not a subclass of %@: %@.", v23, v25];
      v40[1] = v26;
      uint64_t v27 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

      uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9200 userInfo:v27];

      [(TRSession *)self _respondToRequest:v4 withError:v28];
      id v7 = (id)v28;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v13 = TRLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v42 = "-[TRSession _handleRequest:]";
        __int16 v43 = 2112;
        id v44 = v7;
        _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to decode request message: %@", buf, 0x16u);
      }
    }
    [(TRSession *)self _respondToRequest:v4 withError:v7];
  }
}

uint64_t __28__TRSession__handleRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    return [v4 _sendResponse:a3 forRequest:*(void *)(a1 + 40)];
  }
  else {
    return [v4 _respondToRequest:*(void *)(a1 + 40) withError:a2];
  }
}

uint64_t __28__TRSession__handleRequest___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    return [v4 _sendResponse:a3 forRequest:*(void *)(a1 + 40)];
  }
  else {
    return [v4 _respondToRequest:*(void *)(a1 + 40) withError:a2];
  }
}

- (void)setEventHandler:(id)a3 forEventClass:(Class)a4
{
  id v12 = a3;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"msgClass must be a subclass of %@", v9];

    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v6 = (void *)MEMORY[0x2166AC110](v12);
  [(TRSession *)self _setMessageHandler:v6 forMessageClass:a4];
}

- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4
{
  id v12 = a3;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"msgClass must be a subclass of %@", v9];

    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v6 = (void *)MEMORY[0x2166AC110](v12);
  [(TRSession *)self _setMessageHandler:v6 forMessageClass:a4];
}

- (void)_setMessageHandler:(id)a3 forMessageClass:(Class)a4
{
  id v6 = a3;
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__TRSession__setMessageHandler_forMessageClass___block_invoke;
  block[3] = &unk_264221250;
  block[4] = self;
  id v10 = v6;
  Class v11 = a4;
  id v8 = v6;
  dispatch_barrier_async(messageHandlerMapQ, block);
}

void __48__TRSession__setMessageHandler_forMessageClass___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = (id)[*(id *)(a1 + 40) copy];
  BOOL v3 = NSStringFromClass(*(Class *)(a1 + 48));
  [v2 setObject:v4 forKey:v3];
}

- (id)_messageHandlerForMessageClass:(Class)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  Class v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TRSession__messageHandlerForMessageClass___block_invoke;
  block[3] = &unk_264221278;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(messageHandlerMapQ, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__TRSession__messageHandlerForMessageClass___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  NSStringFromClass(*(Class *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_sendHeartbeats
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __28__TRSession__sendHeartbeats__block_invoke;
  v2[3] = &unk_2642212A0;
  v2[4] = self;
  [(TRSession *)self sendHeartbeatWithResponseHandler:v2];
}

void __28__TRSession__sendHeartbeats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = *(void **)(a1 + 32);
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    [v8 disconnect];
    goto LABEL_7;
  }
  if ([v8 isConnected])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __28__TRSession__sendHeartbeats__block_invoke_2;
    v10[3] = &unk_264220BC8;
    objc_copyWeak(&v11, &location);
    dispatch_after(v9, MEMORY[0x263EF83A0], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
LABEL_7:
}

void __28__TRSession__sendHeartbeats__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendHeartbeats];
}

- (void)sendHeartbeatWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  id v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);

  dispatch_time_t v7 = dispatch_time(0, 25000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke;
  handler[3] = &unk_2642212C8;
  id v8 = v6;
  __int16 v17 = v8;
  objc_copyWeak(&v19, &location);
  id v9 = v4;
  id v18 = v9;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  id v10 = objc_alloc_init(TRHeartbeatRequest);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke_54;
  v13[3] = &unk_264220FC8;
  id v11 = v8;
  int v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(TRSession *)self sendRequest:v10 withResponseHandler:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315394;
        id v6 = "-[TRSession sendHeartbeatWithResponseHandler:]_block_invoke";
        __int16 v7 = 2048;
        uint64_t v8 = 0x4039000000000000;
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to receive heartbeat response within %f seconds.", (uint8_t *)&v5, 0x16u);
      }
    }
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9103 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = *MEMORY[0x263F08320];
      v18[0] = @"Invalid response message class.";
      uint64_t v8 = *MEMORY[0x263F08338];
      v17[0] = v7;
      v17[1] = v8;
      uint64_t v9 = NSString;
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      int v14 = [v9 stringWithFormat:@"Response class is not a subclass of %@: %@.", v11, v13];
      v18[1] = v14;
      id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9201 userInfo:v15];

      id v6 = 0;
      id v5 = (id)v16;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleHeartbeatWithResponseHandler:(id)a3
{
  id v4 = (void (**)(id, void, TRHeartbeatResponse *))a3;
  id v5 = [(TRSession *)self heartbeatRequestTimer];
  id v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
    [(TRSession *)self setHeartbeatRequestTimer:0];
  }
  uint64_t v7 = objc_alloc_init(TRHeartbeatResponse);
  v4[2](v4, 0, v7);
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  uint64_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);

  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__TRSession__handleHeartbeatWithResponseHandler___block_invoke;
  handler[3] = &unk_2642212F0;
  id v11 = v9;
  uint64_t v13 = v11;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume(v11);
  [(TRSession *)self setHeartbeatRequestTimer:v11];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __49__TRSession__handleHeartbeatWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315394;
        id v5 = "-[TRSession _handleHeartbeatWithResponseHandler:]_block_invoke";
        __int16 v6 = 2048;
        uint64_t v7 = 0x403E000000000000;
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to receive heartbeat request within %f seconds.", (uint8_t *)&v4, 0x16u);
      }
    }
    [WeakRetained setHeartbeatRequestTimer:0];
    [WeakRetained disconnect];
  }
}

- (TRNearbyDevice)nearbyDevice
{
  return self->_nearbyDevice;
}

- (void)setNearbyDevice:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (NSMutableDictionary)messageHandlerMap
{
  return self->_messageHandlerMap;
}

- (void)setMessageHandlerMap:(id)a3
{
}

- (TRAnisetteDataHandler)anisetteDataHandler
{
  return self->_anisetteDataHandler;
}

- (void)setAnisetteDataHandler:(id)a3
{
}

- (OS_dispatch_queue)messageHandlerMapQ
{
  return self->_messageHandlerMapQ;
}

- (void)setMessageHandlerMapQ:(id)a3
{
}

- (OS_dispatch_queue)connectionQ
{
  return self->_connectionQ;
}

- (void)setConnectionQ:(id)a3
{
}

- (OS_dispatch_source)heartbeatRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeartbeatRequestTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatRequestTimer, 0);
  objc_storeStrong((id *)&self->_connectionQ, 0);
  objc_storeStrong((id *)&self->_messageHandlerMapQ, 0);
  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
  objc_storeStrong((id *)&self->_messageHandlerMap, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_nearbyDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end