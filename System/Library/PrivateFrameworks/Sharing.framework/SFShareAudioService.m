@interface SFShareAudioService
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFShareAudioService)init;
- (void)_handleSessionEnded:(id)a3 error:(id)a4;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleShareAudioFoundDevice:(id)a3;
- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4;
- (void)_handleShareAudioRequest2:(id)a3 contact:(id)a4 responseHandler:(id)a5;
- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleShareAudioResponse:(int)a3 error:(id)a4;
- (void)_handleShareAudioSearchTimeout;
- (void)_invalidate;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setStatusMonitor:(id)a3;
- (void)xpcPerformAction:(int)a3 completion:(id)a4;
@end

@implementation SFShareAudioService

- (SFShareAudioService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioService;
  v2 = [(SFShareAudioService *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SFShareAudioService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFShareAudioService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFShareAudioService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFShareAudioService_invalidate__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 24))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 24) = 1;
    v2 = *(void **)(v1 + 32);
    return [v2 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(SFShareAudioService *)self _handleSessionEnded:self->_sfSession error:0];
    [(SFService *)self->_sfService invalidate];
    sfService = self->_sfService;
    self->_sfService = 0;

    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;
  v5 = v3;

  [(SFService *)v5 setDispatchQueue:self->_dispatchQueue];
  [(SFService *)v5 setFixedPIN:@"public"];
  [(SFService *)v5 setIdentifier:@"com.apple.sharing.ShareAudio"];
  [(SFService *)v5 setLabel:@"ShareAudio"];
  [(SFService *)v5 setSessionFlags:2305];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SFShareAudioService__sfServiceStart__block_invoke;
  v8[3] = &unk_1E5BC1B80;
  v8[4] = v5;
  v8[5] = self;
  [(SFService *)v5 setSessionStartedHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SFShareAudioService__sfServiceStart__block_invoke_2;
  v7[3] = &unk_1E5BC1BA8;
  v7[4] = v5;
  v7[5] = self;
  [(SFService *)v5 setSessionEndedHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SFShareAudioService__sfServiceStart__block_invoke_3;
  v6[3] = &unk_1E5BBCBD0;
  v6[4] = v5;
  v6[5] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

void *__38__SFShareAudioService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[7]) {
    return (void *)[result _handleSessionStarted:a2];
  }
  return result;
}

void *__38__SFShareAudioService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[7]) {
    return (void *)[result _handleSessionEnded:a2 error:a3];
  }
  return result;
}

void __38__SFShareAudioService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 56))
  {
    if (v3)
    {
      id v9 = v3;
      if (gLogCategory_SFShareAudioService <= 90
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "invalidate", v8);
      uint64_t v5 = *(void *)(a1 + 40);
      v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_SFShareAudioService <= 30)
    {
      id v9 = 0;
      if (gLogCategory_SFShareAudioService != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        uint64_t v4 = v9;
      }
    }
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFShareAudioService <= 60)
    {
      if (gLogCategory_SFShareAudioService == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_7;
        }
        sfSession = self->_sfSession;
      }
      int v7 = [(SFSession *)sfSession peer];
      id v9 = [v5 peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      id v8 = [v5 peer];
      LogPrintF();
    }
    objc_msgSend(v5, "setStatusMonitor:", self->_statusMonitor, v8);
    objc_storeStrong((id *)&self->_sfSession, a3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__SFShareAudioService__handleSessionStarted___block_invoke;
    v10[3] = &unk_1E5BBCBA8;
    v10[4] = self;
    [v5 registerRequestID:@"_shAu" options:&unk_1EFA09F58 handler:v10];
  }
LABEL_7:
}

uint64_t __45__SFShareAudioService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShareAudioRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3 error:(id)a4
{
  v20 = (SFSession *)a3;
  id v6 = a4;
  if (self->_sfSession == v20)
  {
    if (v20)
    {
      sfSession = v20;
      if (gLogCategory_SFShareAudioService <= 30)
      {
        sfSession = v20;
        if (gLogCategory_SFShareAudioService != -1
          || (int v16 = _LogCategory_Initialize(), sfSession = self->_sfSession, v16))
        {
          v18 = [(SFSession *)sfSession peer];
          id v19 = v6;
          LogPrintF();

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    [(SFBluetoothPairingSession *)self->_pairingSession invalidate];
    pairingSession = self->_pairingSession;
    self->_pairingSession = 0;

    [(SFProxCardSessionClient *)self->_proxCardSessionClient invalidate];
    proxCardSessionClient = self->_proxCardSessionClient;
    self->_proxCardSessionClient = 0;

    searchTimer = self->_searchTimer;
    if (searchTimer)
    {
      v11 = searchTimer;
      dispatch_source_cancel(v11);
      v12 = self->_searchTimer;
      self->_searchTimer = 0;
    }
    [(CUBluetoothClient *)self->_searchBTClient invalidate];
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = 0;

    v14 = _Block_copy(self->_responseHandler);
    if (v14)
    {
      v15 = NSErrorF();
      if (gLogCategory_SFShareAudioService < 91
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(void *, void *, void, void))v14 + 2))(v14, v15, 0, 0);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = 0;
    }
  }
}

- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SFShareAudioService__handleShareAudioRequest_responseHandler___block_invoke;
  v13[3] = &unk_1E5BC1BD0;
  v13[4] = sfSession;
  v13[5] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = sfSession;
  [(SFSession *)v12 appleIDVerifyProof:v11 dispatchQueue:dispatchQueue completion:v13];
}

void __64__SFShareAudioService__handleShareAudioRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 64))
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      id v7 = [v9 identifier];
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioRequest2:contact:responseHandler:", *(void *)(a1 + 48), v9, *(void *)(a1 + 56), v7, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioRequest2:contact:responseHandler:", *(void *)(a1 + 48), v9, *(void *)(a1 + 56), v6, v8);
    }
  }
}

- (void)_handleShareAudioRequest2:(id)a3 contact:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17;
  v34 = __Block_byref_object_dispose__17;
  id v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke;
  aBlock[3] = &unk_1E5BC1BF8;
  v29 = &v30;
  id v11 = v10;
  id v28 = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  if (self->_responseHandler)
  {
    uint64_t v20 = NSErrorF();
    v21 = (void *)v31[5];
    v31[5] = v20;
  }
  else
  {
    int v26 = 0;
    CFStringGetTypeID();
    v13 = CFDictionaryGetTypedValue();
    if (v13)
    {
      objc_storeStrong((id *)&self->_guestDeviceAddress, v13);
      id v14 = _Block_copy(v11);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = v14;

      if (gLogCategory_SFShareAudioService <= 30
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFProxCardSessionClient *)self->_proxCardSessionClient invalidate];
      int v16 = objc_alloc_init(SFProxCardSessionClient);
      objc_storeStrong((id *)&self->_proxCardSessionClient, v16);
      [(SFProxCardSessionClient *)v16 setDelegate:self];
      [(SFProxCardSessionClient *)v16 setDispatchQueue:self->_dispatchQueue];
      [(SFProxCardSessionClient *)v16 setViewControllerClassName:@"ShareAudioAcceptMainController"];
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFStringGetTypeID();
      [v17 setObject:CFDictionaryGetTypedValue() forKeyedSubscript:@"deviceName"];
      id v18 = v9;
      if (v18)
      {
        id v19 = [(Class)getCNContactFormatterClass_0[0]() stringFromContact:v18 style:0];
        [v17 setObject:v19 forKeyedSubscript:@"username"];
      }
      [(SFProxCardSessionClient *)v16 setUserInfo:v17];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_2;
      v25[3] = &unk_1E5BBCBD0;
      v25[4] = v16;
      v25[5] = self;
      [(SFProxCardSessionClient *)v16 setErrorHandler:v25];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_3;
      v24[3] = &unk_1E5BBBD18;
      v24[4] = v16;
      v24[5] = self;
      [(SFProxCardSessionClient *)v16 setInvalidationHandler:v24];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_4;
      v23[3] = &unk_1E5BBCBD0;
      v23[4] = v16;
      v23[5] = self;
      [(SFProxCardSessionClient *)v16 activateWithCompletion:v23];
    }
    else
    {
      uint64_t v22 = NSErrorF();
      int v16 = (SFProxCardSessionClient *)v31[5];
      v31[5] = v22;
    }
  }
  v12[2](v12);

  _Block_object_dispose(&v30, 8);
}

uint64_t __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFShareAudioService <= 90
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 40))
  {
    id v8 = v3;
    if (gLogCategory_SFShareAudioService <= 90)
    {
      if (gLogCategory_SFShareAudioService != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v8, v5))
      {
        LogPrintF();
        uint64_t v4 = v8;
      }
    }
    uint64_t v6 = *(void **)(a1 + 40);
    if (v4)
    {
      [v6 _handleShareAudioResponse:0 error:v8];
    }
    else
    {
      id v7 = SFErrorF();
      [v6 _handleShareAudioResponse:0 error:v7];
    }
    uint64_t v4 = v8;
  }
}

void __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 40))
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(a1 + 40);
    SFErrorF();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _handleShareAudioResponse:0 error:v3];
  }
}

uint64_t __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 40))
  {
    id v6 = v3;
    if (gLogCategory_SFShareAudioService <= 30)
    {
      if (gLogCategory_SFShareAudioService != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v6, v3))
      {
        id v3 = (id)LogPrintF();
        id v4 = v6;
      }
    }
    if (v4) {
      id v3 = (id)[*(id *)(a1 + 40) _handleShareAudioResponse:0 error:v6];
    }
  }

  return MEMORY[0x1F4181870](v3);
}

- (void)_handleShareAudioResponse:(int)a3 error:(id)a4
{
  id v6 = a4;
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a3 == 2)
  {
    id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    searchTimer = self->_searchTimer;
    self->_searchTimer = v7;

    id v9 = self->_searchTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_searchTimer);
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = (CUBluetoothClient *)objc_alloc_init(MEMORY[0x1E4F5E0E0]);
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = v13;
    id v10 = v13;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke_2;
    v15[3] = &unk_1E5BC1C20;
    v15[4] = v10;
    v15[5] = self;
    [(CUBluetoothClient *)v10 setDeviceConnectedHandler:v15];
    [(CUBluetoothClient *)v10 activate];
  }
  else
  {
    id v10 = (CUBluetoothClient *)_Block_copy(self->_responseHandler);
    if (v10)
    {
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = 0;

      if (v6)
      {
        (*((void (**)(CUBluetoothClient *, id, void, void))v10 + 2))(v10, v6, 0, 0);
      }
      else
      {
        v12 = SFErrorF();
        (*((void (**)(CUBluetoothClient *, void *, void, void))v10 + 2))(v10, v12, 0, 0);
      }
    }
  }
}

uint64_t __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleShareAudioSearchTimeout];
}

void __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 72))
  {
    id v6 = v3;
    char v5 = [v3 deviceFlags];
    id v4 = v6;
    if (v5)
    {
      [*(id *)(a1 + 40) _handleShareAudioFoundDevice:v6];
      id v4 = v6;
    }
  }
}

- (void)_handleShareAudioFoundDevice:(id)a3
{
  id v4 = a3;
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    id v6 = searchTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_searchTimer;
    self->_searchTimer = 0;
  }
  [(CUBluetoothClient *)self->_searchBTClient invalidate];
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  id v9 = [v4 addressString];
  objc_storeStrong((id *)&self->_headphonesAddress, v9);
  id v10 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"ShareAudio" keyLength:16];
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v11 = objc_alloc_init(SFBluetoothPairingSession);
  pairingSession = self->_pairingSession;
  self->_pairingSession = v11;
  v13 = v11;

  [(SFBluetoothPairingSession *)v13 setDeviceAddress:v9];
  [(SFBluetoothPairingSession *)v13 setGuestAddress:self->_guestDeviceAddress];
  [(SFBluetoothPairingSession *)v13 setGuestKey:v10];
  [(SFBluetoothPairingSession *)v13 setGuestMode:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__SFShareAudioService__handleShareAudioFoundDevice___block_invoke;
  v15[3] = &unk_1E5BC1C48;
  v15[4] = v13;
  v15[5] = self;
  id v16 = v4;
  id v14 = v4;
  [(SFBluetoothPairingSession *)v13 setCompletionHandler:v15];
  [(SFBluetoothPairingSession *)v13 activate];
}

uint64_t __52__SFShareAudioService__handleShareAudioFoundDevice___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 32)) {
    return [*(id *)(result + 40) _handleShareAudioPairingCompleted:*(void *)(result + 48) error:a2];
  }
  return result;
}

- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SFBluetoothPairingSession *)self->_pairingSession invalidate];
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

  id v9 = _Block_copy(self->_responseHandler);
  if (v9)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;

    if (v7)
    {
      if (gLogCategory_SFShareAudioService <= 90
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(void *, id, void, void))v9 + 2))(v9, v7, 0, 0);
    }
    else
    {
      id v11 = self->_sfSession;
      if (v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = [v6 colorCode];
        if (v13)
        {
          id v14 = [NSNumber numberWithInt:v13];
          [v12 setObject:v14 forKeyedSubscript:@"colorCode"];
        }
        uint64_t v15 = [v6 productIdentifier];
        if (v15)
        {
          id v16 = [NSNumber numberWithUnsignedInt:v15];
          [v12 setObject:v16 forKeyedSubscript:@"productID"];
        }
        dispatchQueue = self->_dispatchQueue;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __63__SFShareAudioService__handleShareAudioPairingCompleted_error___block_invoke;
        v19[3] = &unk_1E5BC1C70;
        v19[4] = v11;
        v19[5] = self;
        v19[6] = v12;
        v19[7] = v9;
        [(SFSession *)v11 appleIDAddProof:v12 dispatchQueue:dispatchQueue completion:v19];
      }
      else
      {
        id v18 = SFErrorF();
        if (gLogCategory_SFShareAudioService <= 90
          && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(void *, void *, void, void))v9 + 2))(v9, v18, 0, 0);
      }
    }
  }
}

void __63__SFShareAudioService__handleShareAudioPairingCompleted_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 64))
  {
    id v5 = v3;
    if (v3
      && gLogCategory_SFShareAudioService <= 90
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      id v4 = v5;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", *(void *)(*(void *)(a1 + 40) + 16), @"btAd", v4);
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
    id v3 = v5;
  }
}

- (void)_handleShareAudioSearchTimeout
{
  if (gLogCategory_SFShareAudioService <= 90
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    id v4 = searchTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_searchTimer;
    self->_searchTimer = 0;
  }
  [(CUBluetoothClient *)self->_searchBTClient invalidate];
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  id v7 = _Block_copy(self->_responseHandler);
  if (v7)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;
    id v10 = v7;

    id v9 = NSErrorF();
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v9, 0, 0);

    id v7 = v10;
  }
}

- (void)xpcPerformAction:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  dispatchQueue = self->_dispatchQueue;
  id v9 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(dispatchQueue);
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 3) {
      id v7 = "?";
    }
    else {
      id v7 = off_1E5BC1C90[(int)v4];
    }
    id v8 = v7;
    LogPrintF();
  }
  -[SFShareAudioService _handleShareAudioResponse:error:](self, "_handleShareAudioResponse:error:", v4, 0, v8);
  v9[2](v9, 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
  objc_storeStrong((id *)&self->_searchBTClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_proxCardSessionClient, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_headphonesAddress, 0);

  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
}

@end