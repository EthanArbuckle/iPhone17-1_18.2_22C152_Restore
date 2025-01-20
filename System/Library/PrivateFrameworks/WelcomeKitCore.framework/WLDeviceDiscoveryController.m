@interface WLDeviceDiscoveryController
+ (id)sharedInstance;
- (BOOL)_shouldForceDiscoveryError;
- (BOOL)supportsLocalImport;
- (NSString)ssid;
- (OS_dispatch_queue)queue;
- (WLDeviceDiscoveryController)init;
- (WLSourceDevice)sourceDevice;
- (id)_generatePairingSecret;
- (id)_ssidWithSecret:(id)a3;
- (id)listenForConnectionOnSocket:(int)a3 withConnectionHandler:(id)a4;
- (int)acceptIncomingConnectionWithListenerSocket:(int)a3 nonBlocking:(BOOL)a4;
- (int)createListenerSocketOnPort:(unint64_t)a3;
- (void)_allowConnectionsFromAnyAddress;
- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8 enabled:(BOOL)a9 error:(id)a10 channel:(id)a11 currentChannel:(int64_t)a12;
- (void)_postSourceDevicesDidChangeNotification;
- (void)_queue_startDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4;
- (void)_queue_stopDeviceDiscoveryWithCompletion:(id)a3;
- (void)_queue_stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3;
- (void)attemptDirectConnectionToAddress:(id)a3;
- (void)deviceDiscoverySocketHandler:(id)a3 didDiscoverCandidate:(id)a4;
- (void)deviceDiscoverySocketHandler:(id)a3 didFailToHandshakeWithSourceDevice:(id)a4 error:(id)a5;
- (void)deviceDiscoverySocketHandler:(id)a3 didFinishHandshakeWithSourceDevice:(id)a4;
- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8;
- (void)importLocalContent;
- (void)listenerDidStart:(int)a3 srp:(id)a4;
- (void)setNextIncomingConnectionHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSsid:(id)a3;
- (void)softAPDidStart:(BOOL)a3 ssid:(id)a4 psk:(id)a5 secret:(id)a6 srp:(id)a7 channel:(id)a8 error:(id)a9 completion:(id)a10;
- (void)startWiFiAndDeviceDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4;
- (void)stopDeviceDiscoveryWithCompletion:(id)a3;
- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3;
@end

@implementation WLDeviceDiscoveryController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __45__WLDeviceDiscoveryController_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = objc_alloc_init(WLDeviceDiscoveryController);
  return MEMORY[0x270F9A758]();
}

- (WLDeviceDiscoveryController)init
{
  v10.receiver = self;
  v10.super_class = (Class)WLDeviceDiscoveryController;
  v2 = [(WLDeviceDiscoveryController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_starting = 0;
    v2->_listenerSocket = -1;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    socketHandlers = v3->_socketHandlers;
    v3->_socketHandlers = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    sourceDevices = v3->_sourceDevices;
    v3->_sourceDevices = (NSMutableArray *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.welcomekitcore.discoveryRequestSerialQueue", 0);
    [(WLDeviceDiscoveryController *)v3 setQueue:v8];
  }
  return v3;
}

- (WLSourceDevice)sourceDevice
{
  v3 = self->_sourceDevices;
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableArray *)self->_sourceDevices firstObject];
  objc_sync_exit(v3);

  return (WLSourceDevice *)v4;
}

- (BOOL)_shouldForceDiscoveryError
{
  return [MEMORY[0x263F862C0] BOOLForKey:@"ForceDiscoveryError"] == 1;
}

- (void)startWiFiAndDeviceDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke;
  v11[3] = &unk_26490CE90;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 8) = 1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke_2;
    v5[3] = &unk_26490CE68;
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_queue_startDiscoveryWithPreGeneratedCode:completion:", v4, v5);
  }
}

void __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ((a2 & 1) == 0)
  {
    v16 = [MEMORY[0x263F862E0] sharedInstance];
    [v16 wifiDidFail];
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id, id, id, uint64_t, id))(v17 + 16))(v17, a2, v18, v13, v14, a6, v15);
  }
}

- (void)_queue_startDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WLDeviceDiscoveryController *)self _shouldForceDiscoveryError])
  {
    _WLLog();
    if (v7)
    {
      dispatch_queue_t v8 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F86308], 1, MEMORY[0x263EFFA78], self);
      (*((void (**)(id, void, void, void, void, uint64_t, void *))v7 + 2))(v7, 0, 0, 0, 0, -1, v8);
    }
  }
  else
  {
    [(WLDeviceDiscoveryController *)self _allowConnectionsFromAnyAddress];
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      id v9 = [(WLDeviceDiscoveryController *)self _generatePairingSecret];
    }
    id v10 = v9;
    self->_countOfPairingAttemptsWithCurrentSecret = 0;
    v11 = objc_alloc_init(WLAutomation);
    automation = self->_automation;
    self->_automation = v11;

    [(WLAutomation *)self->_automation writeCodeForTestAutomationIfNeeded:v10];
    id v13 = self->_sourceDevices;
    objc_sync_enter(v13);
    [(NSMutableArray *)self->_sourceDevices removeAllObjects];
    objc_sync_exit(v13);

    [(WLDeviceDiscoveryController *)self _postSourceDevicesDidChangeNotification];
    id v14 = objc_msgSend(v10, "substringWithRange:", 0, 2);
    id v15 = [(WLDeviceDiscoveryController *)self _ssidWithSecret:v14];
    v16 = objc_msgSend(v10, "substringWithRange:", 2, objc_msgSend(v10, "length") - 2);
    [(WLDeviceDiscoveryController *)self setSsid:v15];
    objc_initWeak(&location, self);
    uint64_t v17 = +[WLWiFiController sharedInstance];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__WLDeviceDiscoveryController__queue_startDiscoveryWithPreGeneratedCode_completion___block_invoke;
    v21[3] = &unk_26490CEB8;
    objc_copyWeak(&v27, &location);
    id v18 = v15;
    id v22 = v18;
    id v23 = 0;
    id v19 = v10;
    id v24 = v19;
    id v20 = v16;
    id v25 = v20;
    id v26 = v7;
    [v17 preferredChannel:v21];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __84__WLDeviceDiscoveryController__queue_startDiscoveryWithPreGeneratedCode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  v5 = [NSNumber numberWithInteger:a2];
  id v6 = objc_msgSend(v4, "initWithObjects:", v5, 0);

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  _WLLog();
  objc_msgSend(WeakRetained, "enableSoftAPWithSSID:password:channels:secret:srp:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v6, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), WeakRetained, v7, v8, v6);
}

- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v16 lastObject];
  [v16 removeLastObject];
  _WLLog();
  objc_initWeak(&location, self);
  v21 = +[WLWiFiController sharedInstance];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __92__WLDeviceDiscoveryController_enableSoftAPWithSSID_password_channels_secret_srp_completion___block_invoke;
  v29[3] = &unk_26490CEE0;
  objc_copyWeak(&v37, &location);
  id v22 = v14;
  id v30 = v22;
  id v23 = v15;
  id v31 = v23;
  id v24 = v16;
  id v32 = v24;
  id v25 = v17;
  id v33 = v25;
  id v26 = v18;
  id v34 = v26;
  id v27 = v19;
  id v36 = v27;
  id v28 = v20;
  id v35 = v28;
  [v21 enableSoftAPWithSSID:v22 password:v23 channel:v28 completion:v29];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __92__WLDeviceDiscoveryController_enableSoftAPWithSSID_password_channels_secret_srp_completion___block_invoke(void *a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (id *)(a1 + 11);
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(v7);
  LOBYTE(v9) = a2;
  [WeakRetained _enableSoftAPWithSSID:a1[4] password:a1[5] channels:a1[6] secret:a1[7] srp:a1[8] completion:a1[10] enabled:v9 error:v8 channel:a1[9] currentChannel:a3];
}

- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8 enabled:(BOOL)a9 error:(id)a10 channel:(id)a11 currentChannel:(int64_t)a12
{
  id v34 = a3;
  id v18 = a4;
  id v33 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  objc_initWeak(location, self);
  id v24 = [(WLDeviceDiscoveryController *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __130__WLDeviceDiscoveryController__enableSoftAPWithSSID_password_channels_secret_srp_completion_enabled_error_channel_currentChannel___block_invoke;
  block[3] = &unk_26490CF08;
  objc_copyWeak(v44, location);
  BOOL v45 = a9;
  id v36 = v22;
  id v37 = v33;
  id v38 = v23;
  id v39 = v34;
  id v40 = v18;
  id v41 = v19;
  id v42 = v20;
  id v43 = v21;
  v44[1] = (id)a12;
  id v32 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v34;
  id v29 = v23;
  id v30 = v33;
  id v31 = v22;
  dispatch_async(v24, block);

  objc_destroyWeak(v44);
  objc_destroyWeak(location);
}

void __130__WLDeviceDiscoveryController__enableSoftAPWithSSID_password_channels_secret_srp_completion_enabled_error_channel_currentChannel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if ((!*(unsigned char *)(a1 + 112) || *(void *)(a1 + 32)) && [*(id *)(a1 + 40) count])
  {
    uint64_t v5 = *(void *)(a1 + 48);
    _WLLog();
    objc_msgSend(WeakRetained, "enableSoftAPWithSSID:password:channels:secret:srp:completion:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), WeakRetained, v5);
  }
  else
  {
    id v2 = *(id *)(a1 + 48);
    if (*(uint64_t *)(a1 + 104) < 1)
    {
      id v4 = WeakRetained;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 104);
      _WLLog();
      uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 104), WeakRetained, v6);

      id v4 = WeakRetained;
      id v2 = (id)v3;
    }
    [v4 softAPDidStart:*(unsigned __int8 *)(a1 + 112) ssid:*(void *)(a1 + 56) psk:*(void *)(a1 + 64) secret:*(void *)(a1 + 72) srp:*(void *)(a1 + 80) channel:v2 error:*(void *)(a1 + 32) completion:*(void *)(a1 + 88)];
  }
}

- (void)softAPDidStart:(BOOL)a3 ssid:(id)a4 psk:(id)a5 secret:(id)a6 srp:(id)a7 channel:(id)a8 error:(id)a9 completion:(id)a10
{
  v45[1] = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = (void (**)(void, void, void, void, void, void, void))v22;
  if (self->_starting)
  {
    if ([v16 isEqualToString:self->_ssid])
    {
      if (a3)
      {
        if (self->_listenerSocket == -1
          && (int v24 = [(WLDeviceDiscoveryController *)self createListenerSocketOnPort:59523], self->_listenerSocket = v24, v24 == -1))
        {
          _WLLog();
          if (v23) {
            v23[2](v23, 0, 0, 0, 0, -1, 0);
          }
        }
        else
        {
          id v25 = self;
          objc_sync_enter(v25);
          id v26 = v25;
          uint64_t listenerSocket = self->_listenerSocket;
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __91__WLDeviceDiscoveryController_softAPDidStart_ssid_psk_secret_srp_channel_error_completion___block_invoke;
          v39[3] = &unk_26490CF30;
          id v28 = v26;
          id v40 = v28;
          id v41 = v19;
          uint64_t v29 = [(WLDeviceDiscoveryController *)v28 listenForConnectionOnSocket:listenerSocket withConnectionHandler:v39];
          incomingConnSource = v28->_incomingConnSource;
          v28->_incomingConnSource = (OS_dispatch_source *)v29;

          objc_sync_exit(v28);
          if (v23) {
            ((void (**)(void, uint64_t, id, id, id, uint64_t, void))v23)[2](v23, 1, v16, v17, v18, [v20 integerValue], 0);
          }
        }
      }
      else if (v23)
      {
        ((void (**)(void, void, void, void, void, uint64_t, id))v23)[2](v23, 0, 0, 0, 0, -1, v21);
      }
    }
    else if (v23)
    {
      id v38 = self;
      _WLLog();
      id v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08320];
      id v43 = @"a new SSID was already requested.";
      id v35 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1, v38);
      id v36 = [v34 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v35];

      ((void (**)(void, void, void, void, void, uint64_t, void *))v23)[2](v23, 0, 0, 0, 0, -1, v36);
    }
  }
  else if (v22)
  {
    id v37 = self;
    _WLLog();
    id v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45[0] = @"it is being stopped.";
    id v32 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, &v44, 1, v37);
    id v33 = [v31 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v32];

    ((void (**)(void, void, void, void, void, uint64_t, void *))v23)[2](v23, 0, 0, 0, 0, -1, v33);
  }
}

uint64_t __91__WLDeviceDiscoveryController_softAPDidStart_ssid_psk_secret_srp_channel_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) listenerDidStart:a2 srp:*(void *)(a1 + 40)];
}

- (void)listenerDidStart:(int)a3 srp:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v16 = a4;
  uint64_t v6 = [(WLDeviceDiscoveryController *)self acceptIncomingConnectionWithListenerSocket:v4 nonBlocking:1];
  id v13 = [NSNumber numberWithInt:v6];
  _WLLog();

  if (v6 != -1)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v14 = (void *)MEMORY[0x230F5E7D0](v7->_nextIncomingConnectionHandler);
    _WLLog();

    nextIncomingConnectionHandler = (void (**)(id, uint64_t, void))v7->_nextIncomingConnectionHandler;
    if (nextIncomingConnectionHandler)
    {
      nextIncomingConnectionHandler[2](nextIncomingConnectionHandler, v6, 0);
      id v9 = v7->_nextIncomingConnectionHandler;
      v7->_nextIncomingConnectionHandler = 0;

      objc_sync_exit(v7);
    }
    else
    {
      objc_sync_exit(v7);

      id v10 = -[WLDeviceDiscoverySocketHandler initWithSocket:srpPassword:delegate:]([WLDeviceDiscoverySocketHandler alloc], "initWithSocket:srpPassword:delegate:", v6, v16, v7, v7, v14);
      v11 = v7->_socketHandlers;
      objc_sync_enter(v11);
      [(NSMutableArray *)v7->_socketHandlers addObject:v10];
      objc_sync_exit(v11);

      id v12 = v7;
      objc_sync_enter(v12);
      id v15 = [NSNumber numberWithUnsignedInteger:v12->_countOfPairingAttemptsWithCurrentSecret];
      _WLLog();

      ++v12->_countOfPairingAttemptsWithCurrentSecret;
      objc_sync_exit(v12);

      [(WLDeviceDiscoverySocketHandler *)v10 resume];
      uint64_t v7 = (WLDeviceDiscoveryController *)v10;
    }
  }
}

- (void)stopDeviceDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke;
  block[3] = &unk_26490CBA0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke_2;
    v3[3] = &unk_26490C038;
    id v4 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_queue_stopDeviceDiscoveryWithCompletion:", v3);
  }
}

uint64_t __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v7[3] = &unk_26490CE90;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 8) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    _WLLog();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2;
    v6[3] = &unk_26490CF58;
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    objc_msgSend(v3, "_queue_stopWiFiAndDeviceDiscoveryWithCompletion:", v6, v5);
    [v3[8] deleteTestAutomationCachesIfNeeded];
  }
}

void __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v6 = [NSNumber numberWithBool:a2];
  _WLLog();

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
}

- (void)_queue_stopDeviceDiscoveryWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)_queue_stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  nextIncomingConnectionHandler = (void (**)(id, void, void *))v4->_nextIncomingConnectionHandler;
  if (nextIncomingConnectionHandler)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:0];
    nextIncomingConnectionHandler[2](nextIncomingConnectionHandler, 0, v6);

    id v7 = v4->_nextIncomingConnectionHandler;
    v4->_nextIncomingConnectionHandler = 0;
  }
  objc_sync_exit(v4);

  incomingConnSource = v4->_incomingConnSource;
  if (incomingConnSource)
  {
    dispatch_source_cancel(incomingConnSource);
    id v9 = v4->_incomingConnSource;
    v4->_incomingConnSource = 0;
  }
  _WLLog();
  id v10 = +[WLWiFiController sharedInstance];
  [v10 disableSoftAPWithCompletion:&__block_literal_global_66];

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
    v11 = v12;
  }
}

- (BOOL)supportsLocalImport
{
  return +[WLLocalDataSource localDataExists];
}

- (void)importLocalContent
{
  id v5 = objc_alloc_init(MEMORY[0x263F862C8]);
  [v5 setName:@"Local Import"];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  [v5 setPersistentIdentifier:v4];

  [v5 setIsLocal:1];
  _WLLog();
  -[WLDeviceDiscoveryController deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:](self, "deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:", 0, v5, self, v5);
}

- (void)attemptDirectConnectionToAddress:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F862C8];
  id v5 = a3;
  id v11 = objc_alloc_init(v4);
  id v6 = [v5 componentsSeparatedByString:@":"];

  id v7 = [v6 objectAtIndexedSubscript:0];
  [v11 setIpAddress:v7];

  if ((unint64_t)[v6 count] < 2)
  {
    [v11 setHttpPort:80];
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:1];
    objc_msgSend(v11, "setHttpPort:", (unsigned __int16)objc_msgSend(v8, "integerValue"));
  }
  [v11 setName:@"Direct Connection"];
  id v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  [v11 setPersistentIdentifier:v10];

  _WLLog();
  -[WLDeviceDiscoveryController deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:](self, "deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:", 0, v11, self, v11);
}

- (void)setNextIncomingConnectionHandler:(id)a3
{
  if (a3)
  {
    obj = self;
    id v4 = a3;
    objc_sync_enter(obj);
    uint64_t v5 = MEMORY[0x230F5E7D0](v4);

    id nextIncomingConnectionHandler = obj->_nextIncomingConnectionHandler;
    obj->_id nextIncomingConnectionHandler = (id)v5;

    objc_sync_exit(obj);
  }
}

- (id)_generatePairingSecret
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%06u", arc4random_uniform(0xF423Fu));
}

- (id)_ssidWithSecret:(id)a3
{
  uint64_t v3 = +[WLAuthenticationUtilities hashWithString:a3];
  id v4 = NSString;
  uint64_t v5 = [v3 substringToIndex:5];
  id v6 = [v4 stringWithFormat:@"iOS %@", v5];

  return v6;
}

- (int)createListenerSocketOnPort:(unint64_t)a3
{
  unsigned int v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = socket(2, 1, 0);
  int v7 = 1;
  setsockopt(v4, 0xFFFF, 4130, &v7, 4u);
  *(_WORD *)&v8.sa_len = 528;
  *(_WORD *)v8.sa_data = bswap32(v3) >> 16;
  *(void *)&v8.sa_data[2] = 0;
  *(_DWORD *)&v8.sa_data[10] = 0;
  int v6 = 1;
  if (setsockopt(v4, 0xFFFF, 4, &v6, 4u) < 0 || bind(v4, &v8, 0x10u) < 0 || listen(v4, 128) < 0)
  {
    _WLLog();
    return -1;
  }
  return v4;
}

- (id)listenForConnectionOnSocket:(int)a3 withConnectionHandler:(id)a4
{
  id v5 = a4;
  int v6 = dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, MEMORY[0x263EF83A0]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__WLDeviceDiscoveryController_listenForConnectionOnSocket_withConnectionHandler___block_invoke;
  v9[3] = &unk_26490C758;
  id v10 = v5;
  int v11 = a3;
  id v7 = v5;
  dispatch_source_set_event_handler(v6, v9);
  dispatch_resume(v6);

  return v6;
}

uint64_t __81__WLDeviceDiscoveryController_listenForConnectionOnSocket_withConnectionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(a1 + 40));
  }
  return result;
}

- (int)acceptIncomingConnectionWithListenerSocket:(int)a3 nonBlocking:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&v24.sa_len = 0;
  *(void *)&v24.sa_data[6] = 0;
  socklen_t v22 = 16;
  int v6 = accept(a3, &v24, &v22);
  int v7 = v6;
  if (v6 == -1)
  {
    _WLLog();
    return -1;
  }
  int v21 = 1;
  setsockopt(v6, 0xFFFF, 4130, &v21, 4u);
  unsigned int v8 = fcntl(v7, 3, 0) & 0xFFFFFFFB;
  if (v4) {
    int v9 = 4;
  }
  else {
    int v9 = 0;
  }
  if (fcntl(v7, 4, v8 | v9) == -1)
  {
    _WLLog();
    return -1;
  }
  *(void *)&v23.sa_len = 0;
  *(void *)&v23.sa_data[6] = 0;
  socklen_t v20 = 16;
  if (getpeername(v7, &v23, &v20) == -1)
  {
    _WLLog();
    return -1;
  }
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = [NSString alloc];
  v12.s_addr = *(_DWORD *)&v23.sa_data[2];
  id v13 = (void *)[v11 initWithCString:inet_ntoa(v12) encoding:4];
  id v14 = +[WLWiFiController sharedInstance];
  char v15 = [v14 isIPAddressInRange:v13];

  if ((v15 & 1) == 0)
  {
    _WLLog();
    goto LABEL_15;
  }
  allowedAddress = v10->_allowedAddress;
  if (!allowedAddress)
  {
    _WLLog();
    objc_storeStrong((id *)&v10->_allowedAddress, v13);
    goto LABEL_17;
  }
  if (![(NSString *)allowedAddress isEqualToString:v13])
  {
LABEL_15:
    v17.s_addr = *(_DWORD *)&v23.sa_data[2];
    inet_ntoa(v17);
    _WLLog();
    close(v7);
    int v7 = -1;
  }
LABEL_17:

  objc_sync_exit(v10);
  if (v7 == -1) {
    return -1;
  }
  v18.s_addr = *(_DWORD *)&v23.sa_data[2];
  inet_ntoa(v18);
  _WLLog();
  return v7;
}

- (void)_allowConnectionsFromAnyAddress
{
  obj = self;
  objc_sync_enter(obj);
  _WLLog();
  allowedAddress = obj->_allowedAddress;
  obj->_allowedAddress = 0;

  objc_sync_exit(obj);
}

- (void)_postSourceDevicesDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263F86330];
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (void)deviceDiscoverySocketHandler:(id)a3 didDiscoverCandidate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  _WLLog();
  int v7 = self->_sourceDevices;
  objc_sync_enter(v7);
  [(NSMutableArray *)self->_sourceDevices removeAllObjects];
  [(NSMutableArray *)self->_sourceDevices addObject:v6];
  objc_sync_exit(v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F86328], 0, 0, 1u);
}

- (void)deviceDiscoverySocketHandler:(id)a3 didFinishHandshakeWithSourceDevice:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  _WLLog();
  int v7 = self->_sourceDevices;
  objc_sync_enter(v7);
  [(NSMutableArray *)self->_sourceDevices removeAllObjects];
  [(NSMutableArray *)self->_sourceDevices addObject:v6];
  objc_sync_exit(v7);

  [(WLDeviceDiscoveryController *)self _postSourceDevicesDidChangeNotification];
}

- (void)deviceDiscoverySocketHandler:(id)a3 didFailToHandshakeWithSourceDevice:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _WLLog();
  close(objc_msgSend(v8, "sockfd", self, v9, v10));
  [v8 suspend];
  id v11 = self->_socketHandlers;
  objc_sync_enter(v11);
  [(NSMutableArray *)self->_socketHandlers removeObject:v8];
  objc_sync_exit(v11);

  [(WLDeviceDiscoveryController *)self _allowConnectionsFromAnyAddress];
  in_addr v12 = [MEMORY[0x263F862E0] sharedInstance];
  [v12 deviceDidFailWithAuthenticationError];

  _WLLog();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F86338], 0, 0, 1u);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__WLDeviceDiscoveryController_deviceDiscoverySocketHandler_didFailToHandshakeWithSourceDevice_error___block_invoke;
  v14[3] = &unk_26490C890;
  v14[4] = self;
  -[WLDeviceDiscoveryController stopWiFiAndDeviceDiscoveryWithCompletion:](self, "stopWiFiAndDeviceDiscoveryWithCompletion:", v14, self);
}

void __101__WLDeviceDiscoveryController_deviceDiscoverySocketHandler_didFailToHandshakeWithSourceDevice_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = NSNumber;
  id v5 = a3;
  id v6 = [v4 numberWithBool:a2];
  _WLLog();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_automation, 0);
  objc_storeStrong(&self->_nextIncomingConnectionHandler, 0);
  objc_storeStrong((id *)&self->_incomingConnSource, 0);
  objc_storeStrong((id *)&self->_sourceDevices, 0);
  objc_storeStrong((id *)&self->_socketHandlers, 0);
  objc_storeStrong((id *)&self->_allowedAddress, 0);
}

@end