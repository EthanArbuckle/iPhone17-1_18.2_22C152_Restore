@interface TRTransferServer
- (TRTransferServer)init;
- (TRTransferServerDelegate)delegate;
- (id)_onQueue_didReceiveEncryptedData:(id)a3;
- (id)transferDidReceiveData:(id)a3;
- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5;
- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5;
- (void)_beginAdvertisingIfPowered;
- (void)_onQueue_didFinishPairing;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)transferComplete;
- (void)transferDidFailToStartAdvertising:(id)a3;
- (void)transferDidFailWithError:(id)a3;
- (void)transferDidUpdateAdvertiserState:(id)a3;
@end

@implementation TRTransferServer

- (TRTransferServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)TRTransferServer;
  v2 = [(TRTransferServer *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TouchRemote.TRTransferServer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    responseSemaphore = v2->_responseSemaphore;
    v2->_responseSemaphore = (OS_dispatch_semaphore *)v5;

    id v7 = objc_alloc(MEMORY[0x263F864C8]);
    v8 = dispatch_get_global_queue(0, 0);
    uint64_t v9 = [v7 initWithDelegate:v2 queue:v8];
    transferSession = v2->_transferSession;
    v2->_transferSession = (WPTransfer *)v9;

    v2->_advertiserState = [(WPTransfer *)v2->_transferSession advertiserState];
  }
  return v2;
}

- (void)dealloc
{
  [(WPTransfer *)self->_transferSession invalidate];
  if (self->_waitingOnSemaphore) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_responseSemaphore);
  }
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    CFRelease(pairingSession);
  }
  if (self->_aesContext)
  {
    AES_CTR_Final();
    free(self->_aesContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRTransferServer;
  [(TRTransferServer *)&v4 dealloc];
}

- (void)transferDidUpdateAdvertiserState:(id)a3
{
  uint64_t v4 = [a3 advertiserState];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__TRTransferServer_transferDidUpdateAdvertiserState___block_invoke;
  v6[3] = &unk_2642207E0;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

unsigned char *__53__TRTransferServer_transferDidUpdateAdvertiserState___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Advertiser state: %ld", (uint8_t *)&v5, 0xCu);
    }
  }
  result = *(unsigned char **)(a1 + 32);
  if (result[56]) {
    return (unsigned char *)[result _beginAdvertisingIfPowered];
  }
  return result;
}

- (void)transferDidFailToStartAdvertising:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_TRLogEnabled == 1)
  {
    uint64_t v4 = TRLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Did fail to start advertising: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)transferDidReceiveData:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TRTransferServer_transferDidReceiveData___block_invoke;
  block[3] = &unk_264220830;
  id v10 = v4;
  v11 = self;
  objc_super v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __43__TRTransferServer_transferDidReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(NSObject **)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v3;
      __int16 v31 = 2048;
      uint64_t v32 = v4;
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Received a full packet: %@, state: %li", buf, 0x16u);
    }
  }
  int v5 = *(void **)(a1 + 40);
  switch(v5[4])
  {
    case 0:
      if (_TRLogEnabled == 1)
      {
        id v6 = TRLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Pairing started.", buf, 2u);
        }
      }
      int v7 = gQblcfSzZBQsYCCV();
      if (!v7)
      {
        *(void *)(*(void *)(a1 + 40) + 32) = 1;
        int v5 = *(void **)(a1 + 40);
        goto LABEL_24;
      }
      if (_TRLogEnabled == 1)
      {
        int v8 = v7;
        uint64_t v9 = TRLogHandle();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 134217984;
        v30 = v8;
        id v10 = "[TRTransferServer] Error: Unable to start pairing session: %li";
        goto LABEL_17;
      }
      return;
    case 1:
LABEL_24:
      uint64_t v20 = [*(id *)(a1 + 32) bytes];
      uint64_t v21 = [*(id *)(a1 + 32) length];
      id v28 = 0;
      int v22 = [v5 _runSetupStepWithInput:v20 inputLength:v21 outputData:&v28];
      id v15 = v28;
      uint64_t v9 = v28;
      if (v22)
      {
        if (_TRLogEnabled != 1) {
          goto LABEL_30;
        }
        v16 = TRLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v30 = v22;
          v17 = "[TRTransferServer] Setup failed: %li";
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      if (_TRLogEnabled != 1) {
        goto LABEL_41;
      }
      v25 = TRLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        v26 = "[TRTransferServer] Setup output data: %@";
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      uint64_t v12 = [*(id *)(a1 + 32) bytes];
      uint64_t v13 = [*(id *)(a1 + 32) length];
      id v27 = 0;
      int v14 = [v5 _runVerifyStepWithInput:v12 inputLength:v13 outputData:&v27];
      id v15 = v27;
      uint64_t v9 = v27;
      if (v14)
      {
        if (_TRLogEnabled == 1)
        {
          v16 = TRLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v30 = v14;
            v17 = "[TRTransferServer] Verify failed: %li";
LABEL_28:
            _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          }
LABEL_29:
        }
LABEL_30:
        uint64_t v23 = *(void *)(a1 + 40);
        v24 = *(const void **)(v23 + 24);
        if (v24)
        {
          CFRelease(v24);
          *(void *)(*(void *)(a1 + 40) + 24) = 0;
          uint64_t v23 = *(void *)(a1 + 40);
        }
        *(void *)(v23 + 32) = 0;
      }
      else
      {
        if (_TRLogEnabled == 1)
        {
          v25 = TRLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v9;
            v26 = "[TRTransferServer] Verify output data: %@";
LABEL_39:
            _os_log_impl(&dword_2149BE000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
          }
LABEL_40:
        }
LABEL_41:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15);
      }
      goto LABEL_42;
    case 3:
      uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_didReceiveEncryptedData:", *(void *)(a1 + 32));
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v9 = *(NSObject **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
      goto LABEL_42;
    default:
      if (_TRLogEnabled != 1) {
        return;
      }
      uint64_t v9 = TRLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(NSObject **)(*(void *)(a1 + 40) + 32);
        *(_DWORD *)buf = 134217984;
        v30 = v11;
        id v10 = "[TRTransferServer] Error: Invalid pairing state (%li)";
LABEL_17:
        _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      }
LABEL_42:

      return;
  }
}

- (void)transferDidFailWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TRTransferServer_transferDidFailWithError___block_invoke;
  v7[3] = &unk_264220880;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__TRTransferServer_transferDidFailWithError___block_invoke(int8x16_t *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[2].i64[0];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v3;
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Transfer failed with error: %@", buf, 0xCu);
    }
  }
  uint64_t v4 = a1[2].i64[1];
  int v5 = *(const void **)(v4 + 24);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1[2].i64[1] + 24) = 0;
    uint64_t v4 = a1[2].i64[1];
  }
  *(void *)(v4 + 32) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[1] + 80));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__TRTransferServer_transferDidFailWithError___block_invoke_119;
  block[3] = &unk_2642209E8;
  id v11 = WeakRetained;
  int8x16_t v9 = a1[2];
  id v7 = (id)v9.i64[0];
  int8x16_t v12 = vextq_s8(v9, v9, 8uLL);
  id v8 = WeakRetained;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __45__TRTransferServer_transferDidFailWithError___block_invoke_119(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 server:v4 didFailToReceiveData:v5];
  }
  return result;
}

- (void)transferComplete
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__TRTransferServer_transferComplete__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __36__TRTransferServer_transferComplete__block_invoke(uint64_t a1)
{
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Transfer completed.", buf, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(const void **)(v3 + 24);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(void *)(v3 + 32) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 16))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 80));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__TRTransferServer_transferComplete__block_invoke_122;
    v9[3] = &unk_264220880;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = WeakRetained;
    uint64_t v11 = v7;
    id v8 = WeakRetained;
    dispatch_sync(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __36__TRTransferServer_transferComplete__block_invoke_122(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 server:v4 didFailToReceiveData:0];
  }
  return result;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__TRTransferServer_start__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__TRTransferServer_start__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    *(unsigned char *)(v1 + 56) = 1;
    return [*(id *)(result + 32) _beginAdvertisingIfPowered];
  }
  return result;
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__TRTransferServer_stop__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __24__TRTransferServer_stop__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 56) = 0;
    uint64_t v3 = *(void *)(result + 32);
    if (*(void *)(v3 + 64) == 3)
    {
      if (_TRLogEnabled == 1)
      {
        uint64_t v4 = TRLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Stopping advertising...", v5, 2u);
        }

        uint64_t v3 = *(void *)(v2 + 32);
      }
      return [*(id *)(v3 + 72) stopAdvertising];
    }
  }
  return result;
}

- (void)_beginAdvertisingIfPowered
{
  if (self->_advertiserState == 3)
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Starting advertising...", v4, 2u);
      }
    }
    [(WPTransfer *)self->_transferSession startAdvertising];
  }
}

- (void)_onQueue_didFinishPairing
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Pairing finished.", buf, 2u);
    }
  }
  uint64_t v4 = [@"TRBT-Key" dataUsingEncoding:4];
  uint64_t v5 = [@"TRBT-IV" dataUsingEncoding:4];
  id v6 = v4;
  [v6 bytes];
  [v6 length];
  id v7 = v5;
  [v7 bytes];
  [v7 length];
  int v8 = PCFdAVst();
  if (v8)
  {
    if (_TRLogEnabled != 1)
    {
LABEL_15:
      int v12 = 1;
      goto LABEL_16;
    }
    int v9 = v8;
    id v10 = TRLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v19 = 134217984;
      uint64_t v20 = v9;
      uint64_t v11 = "[TRTransferServer] Error: Unable to derive key: %li";
LABEL_13:
      _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, v11, v19, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  self->_aesContext = ($D2B14CE87E15B00C17B758FDEADD6073 *)malloc_type_calloc(1uLL, 0x30uLL, 0x1020040423EBB36uLL);
  int v12 = AES_CTR_Init();
  if (v12 && _TRLogEnabled == 1)
  {
    id v10 = TRLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v19 = 134217984;
      uint64_t v20 = v12;
      uint64_t v11 = "[TRTransferServer] Error: Unable to initialize context: %li";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  if (v12)
  {
    self->_pairingState = 0;
  }
  else
  {
    self->_pairingState = 3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__TRTransferServer__onQueue_didFinishPairing__block_invoke;
    v16[3] = &unk_264220880;
    id v17 = WeakRetained;
    uint64_t v18 = self;
    id v15 = WeakRetained;
    dispatch_sync(MEMORY[0x263EF83A0], v16);
  }
}

uint64_t __45__TRTransferServer__onQueue_didFinishPairing__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 serverWillReceiveData:v4];
  }
  return result;
}

- (id)_onQueue_didReceiveEncryptedData:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 length])
  {
    aesContext = 0;
    goto LABEL_23;
  }
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", objc_msgSend(v4, "length"));
  aesContext = self->_aesContext;
  if (aesContext)
  {
    id v7 = v4;
    [v7 bytes];
    [v7 length];
    id v8 = v5;
    [v8 mutableBytes];
    if (AES_CTR_Update())
    {
      aesContext = 0;
      goto LABEL_22;
    }
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    __int16 v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    self->_didSendData = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke;
    block[3] = &unk_264220A10;
    id v10 = WeakRetained;
    uint64_t v21 = &v23;
    id v18 = v10;
    uint64_t v19 = self;
    id v20 = v8;
    uint64_t v22 = &v27;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    if (*((unsigned char *)v24 + 24))
    {
      self->_waitingOnSemaphore = 1;
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_responseSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      self->_waitingOnSemaphore = 0;
    }
    if (!v28[5])
    {
      int v14 = 1;
      goto LABEL_19;
    }
    id v11 = objc_alloc(MEMORY[0x263EFF990]);
    int v12 = (TRTransferServer *)objc_msgSend(v11, "initWithLength:", objc_msgSend((id)v28[5], "length"));
    uint64_t v13 = v12;
    if (self->_aesContext)
    {
      [ (id) v28[5] bytes];
      [(id)v28[5] length];
      self = v13;
      [(TRTransferServer *)self mutableBytes];
      if (AES_CTR_Update())
      {
        int v14 = 1;
      }
      else
      {
        if (_TRLogEnabled != 1)
        {
          int v14 = 0;
LABEL_19:

          _Block_object_dispose(&v23, 8);
          _Block_object_dispose(&v27, 8);

          if (v14) {
            aesContext = 0;
          }
          else {
            aesContext = self;
          }
          goto LABEL_22;
        }
        TRLogHandle();
        id v15 = (TRTransferServer *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_impl(&dword_2149BE000, &v15->super, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Writing exchange data response: %@", buf, 0xCu);
        }
        int v14 = 0;
        self = v15;
      }
    }
    else
    {
      int v14 = 1;
      self = v12;
    }

    self = v13;
    goto LABEL_19;
  }
LABEL_22:

LABEL_23:
  return aesContext;
}

void __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (void *)[*(id *)(a1 + 48) copy];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke_2;
    v6[3] = &unk_264220808;
    uint64_t v5 = *(void *)(a1 + 64);
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v5;
    [v2 server:v3 didReceiveData:v4 replyHandler:v6];
  }
}

void __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 length];
  if (v3) {
    id v4 = (void *)[v5 copy];
  }
  else {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3) {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48));
}

- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(v17, 0, sizeof(v17));
  if (_TRLogEnabled == 1)
  {
    id v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a4;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Setup input data length: %ld", buf, 0xCu);
    }
  }
  if (self->_pairingSession)
  {
    int v9 = h4BvW7X();
    if (v9)
    {
      int v10 = v9;
      if (_TRLogEnabled == 1)
      {
        id v11 = TRLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v16 = v10;
          _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Unable to do session pairing setup exhange (%li)", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:0];
      }
      int v10 = 0;
      self->_int64_t pairingState = 1;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      int v12 = TRLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int64_t pairingState = self->_pairingState;
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = pairingState;
        _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] No session for pairing setup exhange (state: %ld)", buf, 0xCu);
      }
    }
    return 0;
  }
  return v10;
}

- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  memset(v15, 0, sizeof(v15));
  if (self->_pairingSession)
  {
    int v7 = VBAEFt();
    if (v7)
    {
      int v8 = v7;
      if (_TRLogEnabled == 1)
      {
        int v9 = TRLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v14 = v8;
          _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Unable to do session pairing verify exhange (%li)", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263EFF8F8] dataWithBytes:v15 length:0];
      }
      int v8 = 0;
      self->_int64_t pairingState = 2;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      int v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int64_t pairingState = self->_pairingState;
        *(_DWORD *)buf = 134217984;
        int64_t v14 = pairingState;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] No session for pairing verify exhange (state: %ld)", buf, 0xCu);
      }
    }
    return 0;
  }
  return v8;
}

- (TRTransferServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRTransferServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferSession, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end