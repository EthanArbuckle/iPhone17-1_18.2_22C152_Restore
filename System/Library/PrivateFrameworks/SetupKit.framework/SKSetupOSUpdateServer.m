@interface SKSetupOSUpdateServer
- (BOOL)_bleAdvertiserShouldRun;
- (SKSetupOSUpdateServer)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_invalidate;
- (void)_oobEnsureStarted;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupOSUpdateServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleServer, 0);

  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    [(SKConnection *)v3 setSendDataHandler:self->super._sendDataHandler];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v3 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_16];
  }
}

- (void)_bleServerAcceptConnecton:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->super._skCnx;
  if (v5)
  {
    v6 = v5;
    v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_21FF61000, v7, OS_LOG_TYPE_ERROR, "### Reject BLE connection when already connected: %@ vs %@", (uint8_t *)&v8, 0x16u);
    }

    [v4 invalidate];
  }
  else
  {
    v6 = objc_alloc_init(SKConnection);
    [(SKConnection *)v6 setBleConnection:v4];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v6 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_1062];
  }
}

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    v3 = logger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21FF61000, v3, OS_LOG_TYPE_DEFAULT, "BLE server stop", v6, 2u);
    }

    bleServer = self->_bleServer;
  }
  else
  {
    bleServer = 0;
  }
  [(CBServer *)bleServer invalidate];
  v5 = self->_bleServer;
  self->_bleServer = 0;
}

- (void)_bleServerEnsureStarted
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEF78]);
    objc_storeStrong((id *)p_bleServer, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setBleListenPSM:130];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke;
    v7[3] = &unk_264548FF8;
    v7[4] = v4;
    v7[5] = self;
    [v4 setAcceptHandler:v7];
    v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21FF61000, v5, OS_LOG_TYPE_DEFAULT, "BLE server start: %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13;
    v6[3] = &unk_2645496B0;
    v6[4] = v4;
    v6[5] = self;
    [v4 activateWithCompletion:v6];
  }
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 216))
  {
    id v8 = a3;
    id v9 = logger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_21FF61000, v9, OS_LOG_TYPE_DEFAULT, "BLE server incoming connection: %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 40) _bleServerAcceptConnecton:v5];
    [*(id *)(a1 + 40) _run];
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
  else
  {
    v6 = a3;
    v7 = NSErrorF_safe();
    ((void (**)(void, void *))a3)[2](v6, v7);
  }
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 216))
  {
    id v4 = logger();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v9 = CUPrintNSError();
        int v10 = 138412290;
        id v11 = v9;
        _os_log_error_impl(&dword_21FF61000, v5, OS_LOG_TYPE_ERROR, "### BLE server failed: %@", (uint8_t *)&v10, 0xCu);
      }
      [*(id *)(a1 + 32) invalidate];
      uint64_t v6 = *(void *)(a1 + 40);
      v7 = *(void **)(v6 + 216);
      *(void *)(v6 + 216) = 0;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 32);
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_21FF61000, v5, OS_LOG_TYPE_DEFAULT, "BLE server started: %@", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(a1 + 40) _run];
    }
  }
}

- (void)_bleAdvertiserEnsureStopped
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_bleAdvertiser)
  {
    id v3 = logger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bleAdvertiser = self->_bleAdvertiser;
      int v7 = 138412290;
      id v8 = bleAdvertiser;
      _os_log_impl(&dword_21FF61000, v3, OS_LOG_TYPE_DEFAULT, "BLE advertiser stop: %@", (uint8_t *)&v7, 0xCu);
    }

    id v5 = self->_bleAdvertiser;
  }
  else
  {
    id v5 = 0;
  }
  [(CBAdvertiser *)v5 invalidate];
  uint64_t v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;
}

- (void)_bleAdvertiserEnsureStarted
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEEF8]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setNearbyActionFlags:64];
    [v4 setNearbyActionType:83];
    id v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_21FF61000, v5, OS_LOG_TYPE_DEFAULT, "BLE advertiser start: %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke;
    v6[3] = &unk_2645496B0;
    v6[4] = v4;
    v6[5] = self;
    [v4 activateWithCompletion:v6];
  }
}

void __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v4[26])
  {
    if (v3)
    {
      id v5 = logger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v8 = CUPrintNSError();
        int v9 = 138412290;
        int v10 = v8;
        _os_log_error_impl(&dword_21FF61000, v5, OS_LOG_TYPE_ERROR, "### BLE advertiser failed: %@", (uint8_t *)&v9, 0xCu);
      }
      [*(id *)(a1 + 32) invalidate];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0;
    }
    else
    {
      [v4 _run];
    }
  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  if (self->_completed)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    int v2 = [(CBServer *)self->_bleServer bleListeningPSM];
    if (v2) {
      LOBYTE(v2) = [(SKConnection *)self->super._skCnx state] != 1;
    }
  }
  return v2;
}

- (void)_run
{
  if ([(SKSetupOSUpdateServer *)self _bleAdvertiserShouldRun])
  {
    [(SKSetupOSUpdateServer *)self _bleAdvertiserEnsureStarted];
  }
  else
  {
    [(SKSetupOSUpdateServer *)self _bleAdvertiserEnsureStopped];
  }
}

- (void)_prepareSteps
{
  id v3 = objc_alloc_init(SKStepBasicConfigServer);
  [(SKStepBasicConfigServer *)v3 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepBasicConfigServer *)v3 setSkMessaging:self];
  [(SKSetupBase *)self _addStep:v3];
  [(SKStepBasicConfigServer *)v3 activate];

  id v4 = objc_alloc_init(SKStepWiFiSetupServerCW);
  [(SKStepWiFiSetupServerCW *)v4 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepWiFiSetupServerCW *)v4 setSkMessaging:self];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SKSetupOSUpdateServer__prepareSteps__block_invoke;
  v5[3] = &unk_2645491E8;
  v5[4] = self;
  [(SKStepWiFiSetupServerCW *)v4 setSkCompletionHandler:v5];
  [(SKSetupBase *)self _addStep:v4];
  [(SKStepWiFiSetupServerCW *)v4 activate];
}

void __38__SKSetupOSUpdateServer__prepareSteps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [[SKEvent alloc] initWithEventType:20 error:v4];

  [v3 _reportEvent:v5];
  if (!v4) {
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
  }
}

- (void)_invalidate
{
  [(SKSetupOSUpdateServer *)self _bleAdvertiserEnsureStopped];
  [(SKSetupOSUpdateServer *)self _bleServerEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateServer;
  [(SKSetupBase *)&v3 _invalidate];
}

- (void)_activate
{
  if (self->super._sendDataHandler) {
    [(SKSetupOSUpdateServer *)self _oobEnsureStarted];
  }
  else {
    [(SKSetupOSUpdateServer *)self _bleServerEnsureStarted];
  }
  [(SKSetupOSUpdateServer *)self _prepareSteps];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateServer;
  [(SKSetupBase *)&v3 _activate];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    objc_super v3 = 0;
  }
  else
  {
    int v7 = [(id)objc_opt_class() description];
    CUAppendF();
    objc_super v3 = (__CFString *)0;
  }
  id v4 = &stru_26D1CA560;
  if (v3) {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (SKSetupOSUpdateServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupOSUpdateServer;
  int v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupOSUpdateServer];
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end