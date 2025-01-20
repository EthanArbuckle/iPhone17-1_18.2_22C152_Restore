@interface SKSetupSIMTransferServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)useSecondTrigger;
- (SKSetupSIMTransferServer)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_invalidate;
- (void)_oobEnsureStarted;
- (void)_run;
- (void)setUseSecondTrigger:(BOOL)a3;
@end

@implementation SKSetupSIMTransferServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleServer, 0);

  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

- (void)setUseSecondTrigger:(BOOL)a3
{
  self->_useSecondTrigger = a3;
}

- (BOOL)useSecondTrigger
{
  return self->_useSecondTrigger;
}

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    [(SKConnection *)v3 setSendDataHandler:self->super._sendDataHandler];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v3 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_23_1008];
  }
}

- (void)_bleServerAcceptConnecton:(id)a3
{
  id v11 = a3;
  v4 = self->super._skCnx;
  if (v4)
  {
    v5 = v4;
    int var0 = self->super._ucat->var0;
    if (var0 <= 90)
    {
      id v7 = v11;
      if (var0 != -1)
      {
LABEL_4:
        id v9 = v7;
        LogPrintF();
        objc_msgSend(v11, "invalidate", v9, v5);
        goto LABEL_8;
      }
      if (_LogCategory_Initialize())
      {
        id v7 = v11;
        goto LABEL_4;
      }
    }
    objc_msgSend(v11, "invalidate", v8, v10);
  }
  else
  {
    v5 = objc_alloc_init(SKConnection);
    [(SKConnection *)v5 setBleConnection:v11];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v5 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_1011];
  }
LABEL_8:
}

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CBServer *)self->_bleServer invalidate];
  bleServer = self->_bleServer;
  self->_bleServer = 0;
}

- (void)_bleServerEnsureStarted
{
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEF78]);
    objc_storeStrong((id *)p_bleServer, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setBleListenPSM:130];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_264548FF8;
    v8[4] = v4;
    v8[5] = self;
    [v4 setAcceptHandler:v8];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v4;
      LogPrintF();
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2;
    v7[3] = &unk_2645496B0;
    v7[4] = v4;
    v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7, v6);
  }
}

void __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) != *(void *)(v6 + 216))
  {
    id v7 = NSErrorF_safe();
    v5[2](v5, v7);

    goto LABEL_9;
  }
  int v8 = **(_DWORD **)(v6 + 144);
  id v9 = v12;
  if (v8 <= 30)
  {
    if (v8 == -1)
    {
      int v10 = _LogCategory_Initialize();
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v10)
      {
        id v9 = v12;
        goto LABEL_8;
      }
      id v9 = v12;
    }
    id v11 = v9;
    LogPrintF();
    id v9 = v12;
    uint64_t v6 = *(void *)(a1 + 40);
  }
LABEL_8:
  objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
  [*(id *)(a1 + 40) _run];
  v5[2](v5, 0);
LABEL_9:
}

uint64_t __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void *)(v4 + 216))
  {
    int v6 = **(_DWORD **)(v4 + 144);
    id v13 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        id v11 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 216);
      *(void *)(v7 + 216) = 0;

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v12 = v5;
        LogPrintF();
        uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_run", v12);
LABEL_13:
        id v3 = v13;
        goto LABEL_14;
      }
      int v9 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 40);
      if (v9)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        goto LABEL_8;
      }
    }
    uint64_t v4 = objc_msgSend((id)v4, "_run", v11);
    goto LABEL_13;
  }
LABEL_14:

  return MEMORY[0x270F9A758](v4, v3);
}

- (void)_bleAdvertiserEnsureStopped
{
  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (int v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        uint64_t v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }
  [(CBAdvertiser *)bleAdvertiser invalidate];
  int v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;
}

- (void)_bleAdvertiserEnsureStarted
{
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEEF8]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setNearbyActionFlags:64];
    if (self->_useSecondTrigger) {
      uint64_t v5 = 45;
    }
    else {
      uint64_t v5 = 2;
    }
    [v4 setNearbyActionType:v5];
    [v4 setUseCase:258];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (self->_useSecondTrigger) {
        uint64_t v7 = "yes";
      }
      else {
        uint64_t v7 = "no";
      }
      id v8 = v4;
      int v9 = v7;
      LogPrintF();
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke;
    v10[3] = &unk_2645496B0;
    v10[4] = v4;
    v10[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v10, v8, v9);
  }
}

uint64_t __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 208))
  {
    id v10 = v3;
    if (v3)
    {
      int v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        int v9 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v9);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0;
    }
    else
    {
      uint64_t v4 = [(id)v4 _run];
    }
    id v3 = v10;
  }

  return MEMORY[0x270F9A758](v4, v3);
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3 = [(CBServer *)self->_bleServer bleListeningPSM];
  if (v3) {
    LOBYTE(v3) = self->super._skCnx == 0;
  }
  return v3;
}

- (void)_run
{
  if ([(SKSetupSIMTransferServer *)self _bleAdvertiserShouldRun])
  {
    [(SKSetupSIMTransferServer *)self _bleAdvertiserEnsureStarted];
  }
  else
  {
    [(SKSetupSIMTransferServer *)self _bleAdvertiserEnsureStopped];
  }
}

- (void)_invalidate
{
  [(SKSetupSIMTransferServer *)self _bleAdvertiserEnsureStopped];
  [(SKSetupSIMTransferServer *)self _bleServerEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupSIMTransferServer;
  [(SKSetupBase *)&v3 _invalidate];
}

- (void)_activate
{
  if (self->super._sendDataHandler) {
    [(SKSetupSIMTransferServer *)self _oobEnsureStarted];
  }
  else {
    [(SKSetupSIMTransferServer *)self _bleServerEnsureStarted];
  }
  v3.receiver = self;
  v3.super_class = (Class)SKSetupSIMTransferServer;
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
    uint64_t v7 = [(id)objc_opt_class() description];
    CUAppendF();
    objc_super v3 = (__CFString *)0;
  }
  uint64_t v4 = &stru_26D1CA560;
  if (v3) {
    uint64_t v4 = v3;
  }
  int v5 = v4;

  return v5;
}

- (SKSetupSIMTransferServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupSIMTransferServer;
  v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupSIMTransferServer];
  objc_super v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
    uint64_t v4 = v2;
  }

  return v3;
}

@end