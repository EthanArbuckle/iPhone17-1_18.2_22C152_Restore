@interface TRClientConnection
- (SFSession)session;
- (id)eventMessageHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)requestMessageHandler;
- (void)connectToNearbyDevice:(id)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)sendEvent:(id)a3;
- (void)sendRequest:(id)a3;
- (void)sendResponse:(id)a3;
- (void)setEventMessageHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRequestMessageHandler:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation TRClientConnection

- (id)interruptionHandler
{
  v2 = [(TRClientConnection *)self session];
  v3 = [v2 interruptionHandler];

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  [v5 setInterruptionHandler:v4];
}

- (id)invalidationHandler
{
  v2 = [(TRClientConnection *)self session];
  v3 = [v2 invalidationHandler];

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(TRClientConnection *)self session];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TRClientConnection_setInvalidationHandler___block_invoke;
  v7[3] = &unk_264220B78;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 setInvalidationHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__TRClientConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSession:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (id)eventMessageHandler
{
  uint64_t v2 = [(TRClientConnection *)self session];
  v3 = [v2 eventMessageHandler];

  return v3;
}

- (void)setEventMessageHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  [v5 setEventMessageHandler:v4];
}

- (id)requestMessageHandler
{
  uint64_t v2 = [(TRClientConnection *)self session];
  v3 = [v2 requestMessageHandler];

  return v3;
}

- (void)setRequestMessageHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  [v5 setRequestMessageHandler:v4];
}

- (void)sendEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  id v6 = v5;
  if (v5)
  {
    [v5 sendEvent:v4];
  }
  else if (_TRLogEnabled == 1)
  {
    v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[TRClientConnection sendEvent:]";
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send event message. Connection not connected.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)sendRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  id v6 = v5;
  if (v5)
  {
    [v5 sendRequest:v4];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v7 = TRLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[TRClientConnection sendRequest:]";
        _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send request message. Connection not connected.", buf, 0xCu);
      }
    }
    uint64_t v8 = *MEMORY[0x263F08338];
    v12[0] = *MEMORY[0x263F08320];
    v12[1] = v8;
    v13[0] = @"Unable to send request message.";
    v13[1] = @"The connection must be connected before sending messages";
    id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9102 userInfo:v9];
    v11 = [v4 responseHandler];
    ((void (**)(void, void *, void))v11)[2](v11, v10, 0);
  }
}

- (void)sendResponse:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TRClientConnection *)self session];
  id v6 = v5;
  if (v5)
  {
    [v5 sendResponse:v4];
  }
  else if (_TRLogEnabled == 1)
  {
    v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[TRClientConnection sendResponse:]";
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send response message. Connection not connected.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(TRClientConnection *)self session];
  v3 = v2;
  if (v2)
  {
    [v2 invalidate];
  }
  else if (_TRLogEnabled == 1)
  {
    id v4 = TRLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[TRClientConnection invalidate]";
      _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "%s Unable to invalidate. Connection not connected.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)connectToNearbyDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F6C2B8]);
  id v9 = [v6 representedDevice];
  [v8 setPeerDevice:v9];

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.TRClientConnection.session.dispatchQ", 0);
  [v8 setDispatchQueue:v10];

  if ([v6 supportedService] == 1) {
    [v8 setServiceIdentifier:*MEMORY[0x263F6C388]];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __59__TRClientConnection_connectToNearbyDevice_withCompletion___block_invoke;
  v13[3] = &unk_264220BA0;
  id v11 = v7;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v8;
  id v14 = v12;
  [v12 activateWithCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__TRClientConnection_connectToNearbyDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (_TRLogEnabled == 1)
    {
      id v4 = TRLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        id v8 = "-[TRClientConnection connectToNearbyDevice:withCompletion:]_block_invoke";
        __int16 v9 = 2112;
        id v10 = v3;
        _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "%s Connection failed to activate with error: %@", (uint8_t *)&v7, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      int v5 = TRLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        id v8 = "-[TRClientConnection connectToNearbyDevice:withCompletion:]_block_invoke";
        _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Connection activated successfully", (uint8_t *)&v7, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setSession:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (SFSession)session
{
  return (SFSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end