@interface WLWiFiController
+ (id)sharedInstance;
- (BOOL)hasSoftAPCapability;
- (BOOL)isIPAddressInRange:(id)a3;
- (WLWiFiController)init;
- (id)_initWithWiFiManager:(id)a3 netrbClient:(id)a4;
- (id)_networkRecordFromSSID:(id)a3 password:(id)a4 channel:(id)a5;
- (id)_startedNetwork;
- (unint64_t)_newRequestID;
- (void)_disableSoftAPWithCompletion:(id)a3;
- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6;
- (void)_ensureStartedNetworkReflectsPreferences;
- (void)_startWiFiWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6;
- (void)_stopWiFiWithCompletion:(id)a3;
- (void)disableSoftAPWithCompletion:(id)a3;
- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6;
- (void)preferredChannel:(id)a3;
@end

@implementation WLWiFiController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __34__WLWiFiController_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(WLWiFiController);
  return MEMORY[0x270F9A758]();
}

- (WLWiFiController)init
{
  v3 = objc_alloc_init(WLWiFiManager);
  v4 = objc_alloc_init(WLNETRBClient);
  v5 = [(WLWiFiController *)self _initWithWiFiManager:v3 netrbClient:v4];

  return v5;
}

- (id)_initWithWiFiManager:(id)a3 netrbClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLWiFiController;
  v9 = [(WLWiFiController *)&v13 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.welcomekitcore.wificontroller.requestqueue", 0);
    requestQueue = v9->_requestQueue;
    v9->_requestQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_wifiManager, a3);
    objc_storeStrong((id *)&v9->_netrbClient, a4);
  }

  return v9;
}

- (unint64_t)_newRequestID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_lastRequestID + 1;
  v2->_lastRequestID = v3;
  objc_sync_exit(v2);

  return v3;
}

- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = (void (**)(id, uint64_t, uint64_t, void))a6;
  _WLLog();
  if (objc_msgSend(MEMORY[0x263F862C0], "BOOLForKey:", *MEMORY[0x263F862F8], self) == 1)
  {
    _WLLog();
    v13[2](v13, 1, -1, 0);
  }
  else if (-[WLWiFiController hasSoftAPCapability](self, "hasSoftAPCapability") && [v10 length])
  {
    unint64_t v15 = [(WLWiFiController *)self _newRequestID];
    _WLLog();
    requestQueue = self->_requestQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke;
    block[3] = &unk_26490C010;
    unint64_t v21 = v15;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    v20 = v13;
    dispatch_async(requestQueue, block);
  }
  else
  {
    _WLLog();
    v13[2](v13, 0, -1, 0);
  }
}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 72);
  _WLLog();
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_ensureStartedNetworkReflectsPreferences", v5);
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_2;
  v6[3] = &unk_26490BFE8;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 _disableSoftAPWithCompletion:v6];
}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_3;
  v8[3] = &unk_26490BFC0;
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  id v9 = v6;
  uint64_t v10 = v7;
  v8[4] = *(void *)(a1 + 32);
  [v2 _enableSoftAPWithSSID:v3 password:v4 channel:v5 completion:v8];
}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _WLLog();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_resume(v2);
}

- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke;
  v12[3] = &unk_26490C088;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(WLWiFiController *)self _startWiFiWithSSID:a3 password:a4 channel:a5 completion:v12];
}

void __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  _WLLog();
  if (a2)
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_2;
    v9[3] = &unk_26490C060;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = a3;
    v9[4] = *(void *)(a1 + 32);
    [v8 startDHCPWithCompletion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    _WLLog();
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    _WLLog();
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_3;
    v5[3] = &unk_26490C038;
    uint64_t v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 _stopWiFiWithCompletion:v5];
  }
}

uint64_t __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableSoftAPWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v7 = [(WLWiFiController *)self _newRequestID];
  _WLLog();
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke;
  block[3] = &unk_26490C0D8;
  id v9 = v4;
  unint64_t v10 = v7;
  block[4] = self;
  id v6 = v4;
  dispatch_async(requestQueue, block);
}

void __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 48);
  _WLLog();
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_ensureStartedNetworkReflectsPreferences", v5);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke_2;
  v6[3] = &unk_26490C0B0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  v6[4] = *(void *)(a1 + 32);
  [v2 _disableSoftAPWithCompletion:v6];
}

void __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _WLLog();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_resume(v2);
}

- (void)_disableSoftAPWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  startedNetwork = v5->_startedNetwork;
  objc_sync_exit(v5);

  _WLLog();
  if (startedNetwork)
  {
    netrbClient = v5->_netrbClient;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke;
    v8[3] = &unk_26490C128;
    v8[4] = v5;
    id v9 = v4;
    [(WLNETRBClient *)netrbClient stopDHCPWithCompletion:v8];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  char v2 = a2;
  uint64_t v5 = a2;
  _WLLog();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke_2;
  v6[3] = &unk_26490C100;
  char v8 = v2;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_stopWiFiWithCompletion:", v6, v5);
}

void __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  _WLLog();
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)_ensureStartedNetworkReflectsPreferences
{
  if (!self->_didConsultPreferencesForStartedNetwork)
  {
    self->_didConsultPreferencesForStartedNetwork = 1;
    char v2 = self;
    objc_sync_enter(v2);
    p_startedNetwork = (id *)&v2->_startedNetwork;
    unint64_t v10 = v2->_startedNetwork;
    objc_sync_exit(v2);

    id v4 = v10;
    if (!v10)
    {
      id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v6 = [v5 stringForKey:*MEMORY[0x263F862F0]];

      if (v6)
      {
        id v7 = [(WLWiFiManager *)v2->_wifiManager createDeviceClient];
        char v8 = [v7 hostedNetworkMatchingSSID:v6];
        if (v8)
        {
          id v9 = v2;
          objc_sync_enter(v9);
          objc_storeStrong(p_startedNetwork, v8);
          objc_sync_exit(v9);
        }
      }

      id v4 = 0;
    }
  }
}

- (id)_startedNetwork
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  unint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__WLWiFiController__startedNetwork__block_invoke;
  v5[3] = &unk_26490C150;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(requestQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__WLWiFiController__startedNetwork__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureStartedNetworkReflectsPreferences];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  objc_sync_exit(obj);
}

- (BOOL)hasSoftAPCapability
{
  return [(WLWiFiManager *)self->_wifiManager isTetheringSupported];
}

- (void)_startWiFiWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(WLWiFiManager *)self->_wifiManager createDeviceClient];
  if (v14)
  {
    unint64_t v15 = [(WLWiFiController *)self _networkRecordFromSSID:v10 password:v11 channel:v12];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__WLWiFiController__startWiFiWithSSID_password_channel_completion___block_invoke;
    v16[3] = &unk_26490C178;
    v16[4] = self;
    id v17 = v13;
    [v14 startNetworkWithHostRole:2 request:v15 completion:v16];
  }
  else
  {
    _WLLog();
    (*((void (**)(id, void, uint64_t, void))v13 + 2))(v13, 0, -1, 0);
  }
}

void __67__WLWiFiController__startWiFiWithSSID_password_channel_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v9 = v3 != 0;
  _WLLog();
  if (v3)
  {
    id v4 = objc_msgSend(v3, "ssid", v9);
    id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v5 setObject:v4 forKey:*MEMORY[0x263F862F0]];
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v9);
    [v4 removeObjectForKey:*MEMORY[0x263F862F0]];
  }

  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v10 = v3;

  objc_sync_exit(v6);
  (*(void (**)(void, BOOL, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 != 0, [v10 channel], 0);
}

- (id)_networkRecordFromSSID:(id)a3 password:(id)a4 channel:(id)a5
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a5;
  BOOL v9 = [v7 dictionary];
  [v9 setObject:MEMORY[0x263EFFA88] forKey:@"HIDDEN_NETWORK"];
  id v10 = [NSNumber numberWithShort:1];
  [v9 setObject:v10 forKey:@"AP_MODE_AUTH_LOWER"];

  id v11 = [NSNumber numberWithShort:0];
  [v9 setObject:v11 forKey:@"AP_MODE_AUTH_UPPER"];

  id v12 = [NSNumber numberWithInt:0];
  [v9 setObject:v12 forKey:@"AP_MODE_CYPHER_TYPE"];

  id v13 = [v6 dataUsingEncoding:4];
  [v9 setObject:v6 forKey:@"SSID_STR"];
  [v9 setObject:v13 forKey:@"AP_MODE_SSID_BYTES"];
  [v9 setObject:v8 forKey:@"CHANNEL"];

  id v14 = v6;
  if (v14)
  {
    unint64_t v15 = [NSNumber numberWithShort:8];
    [v9 setObject:v15 forKey:@"AP_MODE_AUTH_UPPER"];

    [v9 setObject:v14 forKey:@"AP_MODE_KEY"];
  }
  v16 = (void *)[v9 copy];

  return v16;
}

- (void)_stopWiFiWithCompletion:(id)a3
{
  id v4 = a3;
  _WLLog();
  id v5 = [(WLWiFiManager *)self->_wifiManager createDeviceClient];
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = v6->_startedNetwork;
    objc_sync_exit(v6);

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__WLWiFiController__stopWiFiWithCompletion___block_invoke;
    v8[3] = &unk_26490C128;
    v8[4] = v6;
    id v9 = v4;
    [v5 stopNetwork:v7 completion:v8];
  }
  else
  {
    _WLLog();
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

uint64_t __44__WLWiFiController__stopWiFiWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v10 = a2;
  _WLLog();
  if (a2)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v10);
    [v4 removeObjectForKey:*MEMORY[0x263F862F0]];

    id v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    objc_sync_exit(v5);
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

- (BOOL)isIPAddressInRange:(id)a3
{
  return [(WLNETRBClient *)self->_netrbClient isIPAddressInRange:a3];
}

- (void)preferredChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netrbClient, 0);
  objc_storeStrong((id *)&self->_startedNetwork, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end