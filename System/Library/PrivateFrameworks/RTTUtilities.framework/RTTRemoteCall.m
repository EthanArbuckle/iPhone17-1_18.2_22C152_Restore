@interface RTTRemoteCall
- (BOOL)isLocallyHosted;
- (RPCompanionLinkClient)client;
- (RPCompanionLinkDevice)pairedCallDevice;
- (RTTRemoteCall)initWithCall:(id)a3;
- (id)responseForRequest:(id)a3 options:(id)a4;
- (void)addDevice:(id)a3;
- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4;
- (void)removeDevice:(id)a3;
- (void)resetRapportClientAndInvalidate:(BOOL)a3;
- (void)sendCallIDChallengeToDevice:(id)a3;
- (void)sendCallIDChallengeToDeviceId:(id)a3;
- (void)sendString:(id)a3;
- (void)setClient:(id)a3;
- (void)setPairedCallDevice:(id)a3;
- (void)setupRapportClient;
- (void)start;
- (void)stop;
- (void)updateCallWithRemoteFailure;
@end

@implementation RTTRemoteCall

- (RTTRemoteCall)initWithCall:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RTTRemoteCall;
  v3 = [(RTTCall *)&v10 initWithCall:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    devices = v3->_devices;
    v3->_devices = v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("rtt_relay_queue", v6);
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v7;

    [(RTTRemoteCall *)v3 setupRapportClient];
  }
  return v3;
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Starting call: %@", buf, 0xCu);
  }

  v4 = [(RTTCall *)self call];
  int v5 = [v4 isHostedOnCurrentDevice];

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)RTTRemoteCall;
    [(RTTCall *)&v6 start];
  }
  if (!self->_client) {
    [(RTTRemoteCall *)self setupRapportClient];
  }
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(RTTCall *)self call];
  int v4 = [v3 isHostedOnCurrentDevice];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)RTTRemoteCall;
    [(RTTCall *)&v7 stop];
  }
  int v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Stopping call: %@", buf, 0xCu);
  }

  [(RPCompanionLinkClient *)self->_client invalidate];
  client = self->_client;
  self->_client = 0;
}

- (BOOL)isLocallyHosted
{
  return 0;
}

- (void)updateCallWithRemoteFailure
{
  id v3 = [(RTTCall *)self delegate];
  [v3 ttyCall:self setVisible:1 serviceUpdate:RTTServiceUpdateTypeRemoteInterrupt];
}

- (void)sendString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Send string for remote call: %@", buf, 0xCu);
  }

  objc_super v6 = [(RTTCall *)self call];
  int v7 = [v6 isHostedOnCurrentDevice];

  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTTRemoteCall;
    [(RTTCall *)&v13 sendString:v4];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__RTTRemoteCall_sendString___block_invoke;
    block[3] = &unk_2645406C8;
    objc_copyWeak(&v12, (id *)buf);
    id v10 = v4;
    v11 = self;
    dispatch_async(connectionQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __28__RTTRemoteCall_sendString___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained call];
  int v5 = [v2 contactPathForCall:v4];

  objc_super v6 = +[RTTUtterance utteranceWithContactPath:v5 andText:*(void *)(a1 + 32)];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = [v7 conversation];
  [v8 addUtterance:v6];

  uint64_t v9 = +[RTTDatabaseManager sharedManager];
  id v10 = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = [v10 conversation];
  [v9 saveConversation:v11];

  id v12 = AXLogRTT();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    v14 = [v13 conversation];
    *(_DWORD *)buf = 138412546;
    v32 = v14;
    __int16 v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "saving convo and utterance: %@/%@", buf, 0x16u);
  }
  uint64_t v15 = [*(id *)(a1 + 32) length];
  uint64_t v16 = AXLogRTT();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v17)
    {
      v18 = *(void **)(a1 + 32);
      id v19 = objc_loadWeakRetained((id *)(a1 + 48));
      v20 = [v19 client];
      *(_DWORD *)buf = 138412546;
      v32 = v18;
      __int16 v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Sending text %@ - %@", buf, 0x16u);
    }
    uint64_t v16 = objc_loadWeakRetained((id *)(a1 + 48));
    v21 = [v16 client];
    uint64_t v22 = *(void *)(a1 + 32);
    v29 = @"RTTSendKey";
    uint64_t v30 = v22;
    v23 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v24 = objc_loadWeakRetained((id *)(a1 + 48));
    v25 = [v24 pairedCallDevice];
    v26 = [v25 identifier];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __28__RTTRemoteCall_sendString___block_invoke_508;
    v28[3] = &unk_2645406A0;
    v28[4] = *(void *)(a1 + 40);
    [v21 sendRequestID:@"com.apple.accessibility.RTT" request:v23 destinationID:v26 options:MEMORY[0x263EFFA78] responseHandler:v28];
  }
  else if (v17)
  {
    v27 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v32 = v27;
    _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Not sending %@", buf, 0xCu);
  }
}

void __28__RTTRemoteCall_sendString___block_invoke_508(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Sent text response %@ = %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    [*(id *)(a1 + 32) updateCallWithRemoteFailure];
  }
}

- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTTCall *)self call];
  if (([v8 isEndpointOnCurrentDevice] & 1) != 0 || !objc_msgSend(v6, "length"))
  {
  }
  else
  {
    uint64_t v9 = [v7 length];

    if (v9)
    {
      id v10 = AXLogRTT();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Sending remote device received text %@", buf, 0xCu);
      }

      id v11 = objc_initWeak((id *)buf, self);
      id v12 = [(RTTRemoteCall *)self client];
      v27 = @"RTTReceiveKey";
      v25[0] = @"RTTTextKey";
      v25[1] = @"RTTUtteranceKey";
      v26[0] = v6;
      v26[1] = v7;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      v28[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      id WeakRetained = objc_loadWeakRetained((id *)buf);
      uint64_t v16 = [WeakRetained pairedCallDevice];
      BOOL v17 = [v16 identifier];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke;
      v20[3] = &unk_2645406A0;
      v20[4] = self;
      [v12 sendRequestID:@"com.apple.accessibility.RTT" request:v14 destinationID:v17 options:MEMORY[0x263EFFA78] responseHandler:v20];

      objc_destroyWeak((id *)buf);
      goto LABEL_11;
    }
  }
  v18 = AXLogRTT();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_21FEA9000, v18, OS_LOG_TYPE_INFO, "Not sending remote device received text %@, %@", buf, 0x16u);
  }

LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)RTTRemoteCall;
  [(RTTCall *)&v19 callDidReceiveText:v6 forUtterance:v7];
}

void __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Received text response %@ = %@", buf, 0x16u);
  }

  id v11 = [v7 objectForKey:@"RTTError"];
  if ([v11 isEqualToString:@"ActionRepair"])
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_525;
    v15[3] = &unk_2645400C0;
    id v13 = v8;
    uint64_t v14 = *(void *)(a1 + 32);
    id v16 = v13;
    uint64_t v17 = v14;
    dispatch_async(v12, v15);
  }
}

void __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_525(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectForKey:@"senderID"];
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 104);
    *(_DWORD *)buf = 138412546;
    id v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Received request from %@ to re-pair with known devices: %@", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 104);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_529;
  v7[3] = &unk_2645406F0;
  v7[4] = v5;
  [v6 enumerateObjectsUsingBlock:v7];
}

uint64_t __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_529(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCallIDChallengeToDevice:a2];
}

- (void)resetRapportClientAndInvalidate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Invalidate Rapport client and setup again", v7, 2u);
  }

  if (v3) {
    [(RPCompanionLinkClient *)self->_client invalidate];
  }
  client = self->_client;
  self->_client = 0;

  [(RTTRemoteCall *)self setupRapportClient];
}

- (void)setupRapportClient
{
  BOOL v3 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
  client = self->_client;
  self->_client = v3;

  [(RPCompanionLinkClient *)self->_client setDispatchQueue:self->_connectionQueue];
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Starting rapport support", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  [(RPCompanionLinkClient *)self->_client setInvalidationHandler:&__block_literal_global_534];
  id v6 = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_540;
  v7[3] = &unk_264540768;
  objc_copyWeak(&v8, buf);
  [(RPCompanionLinkClient *)v6 activateWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = AXLogRTT();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = [MEMORY[0x263F472B0] isInternalInstall];
    if (v1)
    {
      v2 = [MEMORY[0x263F08B88] callStackSymbols];
    }
    else
    {
      v2 = &stru_26D1B01C8;
    }
    int v3 = 138412290;
    uint64_t v4 = v2;
    _os_log_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_INFO, "Companion link was invalidated: %@", (uint8_t *)&v3, 0xCu);
    if (v1) {
  }
    }
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_540(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = AXLogRTT();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v3;
      _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Link failed to activate %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained resetRapportClientAndInvalidate:1];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [v6 client];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_541;
    v21[3] = &unk_264540718;
    objc_copyWeak(&v22, (id *)(a1 + 32));
    [v7 registerRequestID:@"com.apple.accessibility.RTT" options:MEMORY[0x263EFFA78] handler:v21];

    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    id v9 = [v8 client];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_2;
    v19[3] = &unk_264540740;
    objc_copyWeak(&v20, (id *)(a1 + 32));
    [v9 setDeviceFoundHandler:v19];

    id v10 = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v11 = [v10 client];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_3;
    v17[3] = &unk_264540740;
    objc_copyWeak(&v18, (id *)(a1 + 32));
    [v11 setDeviceLostHandler:v17];

    id v12 = objc_loadWeakRetained((id *)(a1 + 32));
    id v13 = [v12 client];
    [v13 setInterruptionHandler:&__block_literal_global_545];

    uint64_t v14 = AXLogRTT();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 32));
      id v16 = [v15 client];
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Companion link is active: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
  }
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_541(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained responseForRequest:v9 options:v8];

  (*((void (**)(id, id, void, void))v7 + 2))(v7, v11, 0, 0);
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addDevice:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 sendCallIDChallengeToDevice:v3];
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained removeDevice:v3];
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_4()
{
  v0 = AXLogRTT();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_INFO, "Companion link was interrupted", v1, 2u);
  }
}

- (void)sendCallIDChallengeToDevice:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTRemoteCall *)self client];
  id v10 = @"RTTActiveCallKey";
  id v6 = [v4 identifier];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v4 identifier];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__RTTRemoteCall_sendCallIDChallengeToDevice___block_invoke;
  v9[3] = &unk_2645406A0;
  v9[4] = self;
  [v5 sendRequestID:@"com.apple.accessibility.RTT" request:v7 destinationID:v8 options:MEMORY[0x263EFFA78] responseHandler:v9];
}

void __45__RTTRemoteCall_sendCallIDChallengeToDevice___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Call challenge response %@ - %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = (id)[*(id *)(a1 + 32) responseForRequest:v7 options:v8];
}

- (void)sendCallIDChallengeToDeviceId:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke;
  v7[3] = &unk_2645400C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_2;
  v12[3] = &unk_264540790;
  id v13 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v12];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = AXLogRTT();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Sending pairing challenge to all known devices since id (%@) could not be matched to a known device: %@", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 104);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_551;
    v11[3] = &unk_2645406F0;
    v11[4] = v7;
    [v8 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 104) objectAtIndex:v3];
    id v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Sending pairing challenge to %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) sendCallIDChallengeToDevice:v9];
  }
}

uint64_t __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_551(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCallIDChallengeToDevice:a2];
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__RTTRemoteCall_addDevice___block_invoke;
  v7[3] = &unk_2645400C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __27__RTTRemoteCall_addDevice___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = AXLogRTT();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Found device %@", buf, 0xCu);
    }

    id v4 = *(void **)(*(void *)(a1 + 40) + 104);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__RTTRemoteCall_addDevice___block_invoke_552;
    v5[3] = &unk_264540790;
    id v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "ax_removeObjectsFromArrayUsingBlock:", v5);
    [*(id *)(*(void *)(a1 + 40) + 104) addObject:*(void *)(a1 + 32)];
  }
}

uint64_t __27__RTTRemoteCall_addDevice___block_invoke_552(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__RTTRemoteCall_removeDevice___block_invoke;
  v7[3] = &unk_2645400C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __30__RTTRemoteCall_removeDevice___block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    v2 = AXLogRTT();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Lost device %@", (uint8_t *)&v4, 0xCu);
    }

    return [*(id *)(*(void *)(v1 + 40) + 104) removeObject:*(void *)(v1 + 32)];
  }
  return result;
}

- (id)responseForRequest:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Received request %@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = [(RTTCall *)self call];
  int v11 = [v10 status];

  if ((v11 - 3) > 0xFFFFFFFD)
  {
    __int16 v14 = [v7 objectForKey:@"senderID"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke;
    v18[3] = &unk_2645407B8;
    v18[4] = self;
    id v15 = v9;
    id v19 = v15;
    id v20 = v14;
    int v12 = v14;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
    __int16 v16 = v20;
    id v13 = v15;
  }
  else
  {
    int v12 = AXLogRTT();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    id v13 = [(RTTCall *)self call];
    *(_DWORD *)buf = 138412290;
    id v22 = v13;
    _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Call not yet connected. Ignoring request for call %@", buf, 0xCu);
  }

LABEL_8:

  return v9;
}

void __44__RTTRemoteCall_responseForRequest_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v60[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"RTTActiveCallKey"])
  {
    id v7 = [*(id *)(a1 + 32) call];
    if ([v7 isEndpointOnCurrentDevice])
    {

      goto LABEL_15;
    }
    uint64_t v17 = [*(id *)(a1 + 32) call];
    char v18 = [v17 isHostedOnCurrentDevice];

    if (v18)
    {
LABEL_15:
      id v19 = [*(id *)(a1 + 32) call];
      id v20 = [v19 callUUID];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        v59[0] = @"RTTActiveCallKey";
        id v22 = *(void **)(a1 + 40);
        uint64_t v23 = [*(id *)(a1 + 32) call];
        id v24 = [v23 callUUID];
        v59[1] = @"com.apple.accessibility.RTT";
        v60[0] = v24;
        v60[1] = v6;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
        [v22 setObject:v25 forKey:@"RTTActiveCallResponseKey"];
      }
      v26 = AXLogRTT();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = [*(id *)(a1 + 32) call];
        v28 = [*(id *)(a1 + 32) pairedCallDevice];
        *(_DWORD *)buf = 138412546;
        v56 = v27;
        __int16 v57 = 2112;
        v58 = v28;
        _os_log_impl(&dword_21FEA9000, v26, OS_LOG_TYPE_INFO, "Active call request for call: %@ with paired call device: %@", buf, 0x16u);
      }
      uint64_t v29 = [*(id *)(a1 + 32) pairedCallDevice];
      if (!v29) {
        goto LABEL_21;
      }
      uint64_t v30 = (void *)v29;
      v31 = [*(id *)(a1 + 32) pairedCallDevice];
      v32 = [v31 identifier];
      char v33 = [v32 isEqualToString:*(void *)(a1 + 48)];

      if ((v33 & 1) == 0)
      {
LABEL_21:
        v34 = AXLogRTT();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = [*(id *)(a1 + 32) pairedCallDevice];
          v36 = [v35 identifier];
          *(_DWORD *)buf = 138412290;
          v56 = v36;
LABEL_40:
          _os_log_impl(&dword_21FEA9000, v34, OS_LOG_TYPE_INFO, "Paired device id: %@", buf, 0xCu);

          goto LABEL_41;
        }
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    id v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v47 = [*(id *)(a1 + 32) call];
      *(_DWORD *)buf = 138412290;
      v56 = v47;
      _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Request received on non-endpoint and non-host device. Ignoring request for call %@", buf, 0xCu);
    }
LABEL_37:

    goto LABEL_42;
  }
  if ([v5 isEqualToString:@"RTTActiveCallResponseKey"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    id v8 = [v6 objectForKey:@"RTTActiveCallKey"];
    uint64_t v9 = [v6 objectForKey:@"com.apple.accessibility.RTT"];
    id v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v8;
      __int16 v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Active call response for call: %@ from client: %@", buf, 0x16u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = [*(id *)(a1 + 32) call];
        int v12 = [v11 callUUID];
        int v13 = [v12 isEqualToString:v8];

        if (v13)
        {
          __int16 v14 = AXLogRTT();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Active call response matched current call", buf, 2u);
          }

          uint64_t v15 = *(void *)(a1 + 32);
          __int16 v16 = *(NSObject **)(v15 + 112);
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke_557;
          v53[3] = &unk_2645400C0;
          v53[4] = v15;
          id v54 = v9;
          dispatch_async(v16, v53);
        }
      }
    }
    goto LABEL_36;
  }
  if (![v5 isEqualToString:@"RTTSendKey"])
  {
    if (![v5 isEqualToString:@"RTTReceiveKey"]) {
      goto LABEL_42;
    }
    v48 = [*(id *)(a1 + 32) call];
    char v49 = [v48 isEndpointOnCurrentDevice];

    if ((v49 & 1) == 0)
    {
      v52 = AXLogRTT();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FEA9000, v52, OS_LOG_TYPE_INFO, "Received character on non-endpoint device. Replying with re-pair request", buf, 2u);
      }

      [*(id *)(a1 + 40) setObject:@"ActionRepair" forKey:@"RTTError"];
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    id v8 = [v6 objectForKey:@"RTTTextKey"];
    uint64_t v9 = [v6 objectForKey:@"RTTUtteranceKey"];
    v50 = [*(id *)(a1 + 32) conversation];
    id v51 = (id)[v50 appendStringFromOtherContactPath:v8];

    [*(id *)(a1 + 32) callDidReceiveText:v8 forUtterance:v9];
    goto LABEL_36;
  }
  uint64_t v37 = [*(id *)(a1 + 32) pairedCallDevice];
  if (!v37) {
    goto LABEL_38;
  }
  v38 = (void *)v37;
  v39 = [*(id *)(a1 + 32) pairedCallDevice];
  v40 = [v39 identifier];
  char v41 = [v40 isEqualToString:*(void *)(a1 + 48)];

  if ((v41 & 1) == 0)
  {
LABEL_38:
    v34 = AXLogRTT();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = [*(id *)(a1 + 32) pairedCallDevice];
      v36 = [v35 identifier];
      *(_DWORD *)buf = 138412290;
      v56 = v36;
      goto LABEL_40;
    }
LABEL_41:

    [*(id *)(a1 + 32) sendCallIDChallengeToDeviceId:*(void *)(a1 + 48)];
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    [*(id *)(a1 + 32) sendString:v8];
    v42 = AXLogRTT();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v8;
      _os_log_impl(&dword_21FEA9000, v42, OS_LOG_TYPE_INFO, "Getting remote call send job: %@", buf, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) delegate];
    v43 = *(void **)(a1 + 32);
    v44 = [v43 conversation];
    v45 = [v44 lastUtteranceForMe:1];
    v46 = [v45 text];
    [v9 ttyCall:v43 didSendRemoteString:v8 forUtterance:v46];

LABEL_36:
    goto LABEL_37;
  }
LABEL_42:
}

void __44__RTTRemoteCall_responseForRequest_options___block_invoke_557(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke_2;
  v7[3] = &unk_264540790;
  id v8 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v7];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v4 = *(id **)(a1 + 32);
    id v5 = [v4[13] objectAtIndex:v3];
    [v4 setPairedCallDevice:v5];

    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 ttyCall:*(void *)(a1 + 32) setVisible:0 serviceUpdate:RTTServiceUpdateTypeRemoteInterrupt];
  }
}

uint64_t __44__RTTRemoteCall_responseForRequest_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (RPCompanionLinkDevice)pairedCallDevice
{
  return self->_pairedCallDevice;
}

- (void)setPairedCallDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedCallDevice, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end