@interface TRTransferBrowser
- (TRTransferBrowser)init;
- (TRTransferBrowserDelegate)delegate;
- (id)_didReceiveEncryptedData:(id)a3;
- (id)transferDidReceiveData:(id)a3;
- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5;
- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5;
- (int64_t)state;
- (void)_beginScanningIfPowered;
- (void)_didFinishPairing;
- (void)dealloc;
- (void)defer;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)transferComplete;
- (void)transferDidFailWithError:(id)a3;
- (void)transferDidUpdateScannerState:(id)a3;
@end

@implementation TRTransferBrowser

- (TRTransferBrowser)init
{
  v8.receiver = self;
  v8.super_class = (Class)TRTransferBrowser;
  v2 = [(TRTransferBrowser *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TouchRemote.TRTransferBrowser", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    responseSemaphore = v2->_responseSemaphore;
    v2->_responseSemaphore = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

- (void)dealloc
{
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
  v4.super_class = (Class)TRTransferBrowser;
  [(TRTransferBrowser *)&v4 dealloc];
}

- (void)transferDidUpdateScannerState:(id)a3
{
  uint64_t v4 = [a3 scannerState];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TRTransferBrowser_transferDidUpdateScannerState___block_invoke;
  v6[3] = &unk_2642207E0;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

unsigned char *__51__TRTransferBrowser_transferDidUpdateScannerState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 40);
  result = *(unsigned char **)(a1 + 32);
  if (result[48]) {
    return (unsigned char *)[result _beginScanningIfPowered];
  }
  return result;
}

- (id)transferDidReceiveData:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TRTransferBrowser_transferDidReceiveData___block_invoke;
  block[3] = &unk_264220830;
  id v10 = v4;
  v11 = self;
  v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __44__TRTransferBrowser_transferDidReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Received a full packet: %@, state: %li", buf, 0x16u);
    }
  }
  dispatch_semaphore_t v5 = *(void **)(a1 + 40);
  switch(v5[3])
  {
    case 0:
      if (_TRLogEnabled == 1)
      {
        id v6 = TRLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Pairing started.", buf, 2u);
        }
      }
      int v7 = gQblcfSzZBQsYCCV();
      if (!v7)
      {
        v26 = *(void **)(a1 + 40);
        id v63 = 0;
        int v27 = [v26 _runSetupStepWithInput:0 inputLength:0 outputData:&v63];
        id v28 = v63;
        objc_super v8 = v63;
        if (v27)
        {
          if (_TRLogEnabled == 1)
          {
            v29 = TRLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v27;
              _os_log_impl(&dword_2149BE000, v29, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup failed: %li", buf, 0xCu);
            }
          }
          uint64_t v30 = *(void *)(a1 + 40);
          v31 = *(const void **)(v30 + 16);
          if (!v31)
          {
            uint64_t v32 = 0;
            goto LABEL_88;
          }
          CFRelease(v31);
          uint64_t v32 = 0;
          *(void *)(*(void *)(a1 + 40) + 16) = 0;
        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            v57 = TRLogHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v8;
              _os_log_impl(&dword_2149BE000, v57, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup output data: %@ (%p)", buf, 0x16u);
            }
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v28);
          uint64_t v32 = 1;
        }
        uint64_t v30 = *(void *)(a1 + 40);
LABEL_88:
        *(void *)(v30 + 24) = v32;
        goto LABEL_101;
      }
      if (_TRLogEnabled != 1) {
        return;
      }
      objc_super v8 = TRLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v7;
      v9 = "Error: [TRTransferBrowser] Unable to start pairing session: %li";
LABEL_34:
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_101:

      return;
    case 1:
      uint64_t v19 = [*(id *)(a1 + 32) bytes];
      uint64_t v20 = [*(id *)(a1 + 32) length];
      id v62 = 0;
      int v21 = [v5 _runSetupStepWithInput:v19 inputLength:v20 outputData:&v62];
      id v22 = v62;
      objc_super v8 = v62;
      if (!v21)
      {
        v50 = *(void **)(a1 + 40);
        if (v50[3] == 2)
        {
          if (_TRLogEnabled == 1)
          {
            v51 = TRLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2149BE000, v51, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify started.", buf, 2u);
            }

            v50 = *(void **)(a1 + 40);
          }
          v61 = v8;
          int v52 = [v50 _runVerifyStepWithInput:0 inputLength:0 outputData:&v61];
          v53 = v61;
          v54 = v61;

          if (!v52)
          {
            if (_TRLogEnabled == 1)
            {
              v55 = TRLogHandle();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v54;
                _os_log_impl(&dword_2149BE000, v55, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Initial verify output data: %@", buf, 0xCu);
              }
            }
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v53);
          }
          objc_super v8 = v54;
        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            v56 = TRLogHandle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v8;
              _os_log_impl(&dword_2149BE000, v56, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup output data: %@", buf, 0xCu);
            }
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v22);
        }
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        v23 = TRLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v21;
          _os_log_impl(&dword_2149BE000, v23, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup failed: %li", buf, 0xCu);
        }
      }
      uint64_t v15 = *(void *)(a1 + 40);
      v24 = *(const void **)(v15 + 16);
      if (v24)
      {
        CFRelease(v24);
        goto LABEL_29;
      }
      goto LABEL_30;
    case 2:
      uint64_t v10 = [*(id *)(a1 + 32) bytes];
      uint64_t v11 = [*(id *)(a1 + 32) length];
      id v60 = 0;
      int v12 = [v5 _runVerifyStepWithInput:v10 inputLength:v11 outputData:&v60];
      id v13 = v60;
      objc_super v8 = v60;
      if (v12)
      {
        if (_TRLogEnabled == 1)
        {
          v14 = TRLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v12;
            _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify failed: %li", buf, 0xCu);
          }
        }
        uint64_t v15 = *(void *)(a1 + 40);
        v16 = *(const void **)(v15 + 16);
        if (v16)
        {
          CFRelease(v16);
LABEL_29:
          *(void *)(*(void *)(a1 + 40) + 16) = 0;
          uint64_t v15 = *(void *)(a1 + 40);
        }
LABEL_30:
        *(void *)(v15 + 24) = 0;
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        v33 = TRLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v8;
          _os_log_impl(&dword_2149BE000, v33, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify output data: %@", buf, 0xCu);
        }
      }
      uint64_t v34 = *(void *)(a1 + 40);
      if (*(void *)(v34 + 24) != 3)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        v35 = TRLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = WeakRetained;
          _os_log_impl(&dword_2149BE000, v35, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Asking delegate %@ for data...", buf, 0xCu);
        }
        uint64_t v34 = *(void *)(a1 + 40);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v67 = __Block_byref_object_copy_;
      v68 = __Block_byref_object_dispose_;
      id v69 = 0;
      id v37 = objc_loadWeakRetained((id *)(v34 + 72));
      char v38 = objc_opt_respondsToSelector();

      if (v38)
      {
        id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        objc_msgSend(v39, "browser:didStartTransferWithSendDataHandler:", MEMORY[0x263EF8330], 3221225472, __44__TRTransferBrowser_transferDidReceiveData___block_invoke_121, &unk_264220808, *(void *)(a1 + 40), buf);

        *(unsigned char *)(*(void *)(a1 + 40) + 49) = 1;
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 40), 0xFFFFFFFFFFFFFFFFLL);
        *(unsigned char *)(*(void *)(a1 + 40) + 49) = 0;
      }
      if (_TRLogEnabled == 1)
      {
        v40 = TRLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v64 = 138412290;
          uint64_t v65 = v41;
          _os_log_impl(&dword_2149BE000, v40, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Got delegate data: %@", v64, 0xCu);
        }
      }
      if ([*(id *)(*(void *)&buf[8] + 40) length])
      {
        id v42 = objc_alloc(MEMORY[0x263EFF990]);
        v43 = objc_msgSend(v42, "initWithLength:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "length"));
        if (!*(void *)(*(void *)(a1 + 40) + 8))
        {
          if (_TRLogEnabled != 1)
          {
LABEL_98:
            v44 = v43;
            goto LABEL_99;
          }
          v46 = TRLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v64 = 0;
            v47 = "Error: [TRTransferBrowser] No context for sending.";
            v48 = v46;
            uint32_t v49 = 2;
            goto LABEL_95;
          }
LABEL_97:

          goto LABEL_98;
        }
        [*(id *)(*(void *)&buf[8] + 40) bytes];
        [*(id *)(*(void *)&buf[8] + 40) length];
        v44 = v43;
        [v44 mutableBytes];
        int v45 = AES_CTR_Update();
        if (!v45)
        {
          uint64_t v58 = *(void *)(*(void *)(a1 + 48) + 8);
          v59 = v44;
          v46 = *(NSObject **)(v58 + 40);
          *(void *)(v58 + 40) = v59;
          goto LABEL_97;
        }
        if (_TRLogEnabled == 1)
        {
          v46 = TRLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 134217984;
            uint64_t v65 = v45;
            v47 = "Error: [TRTransferBrowser] Context for sending failed: %ld";
            v48 = v46;
            uint32_t v49 = 12;
LABEL_95:
            _os_log_impl(&dword_2149BE000, v48, OS_LOG_TYPE_DEFAULT, v47, v64, v49);
            goto LABEL_97;
          }
          goto LABEL_97;
        }
      }
      else
      {
        if (_TRLogEnabled != 1)
        {
LABEL_100:
          _Block_object_dispose(buf, 8);

          goto LABEL_101;
        }
        v44 = TRLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v64 = 0;
          _os_log_impl(&dword_2149BE000, v44, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Sending no data back.", v64, 2u);
        }
      }
LABEL_99:

      goto LABEL_100;
    case 3:
      uint64_t v17 = [*(id *)(a1 + 40) _didReceiveEncryptedData:*(void *)(a1 + 32)];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      objc_super v8 = *(NSObject **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
      goto LABEL_101;
    default:
      if (_TRLogEnabled != 1) {
        return;
      }
      objc_super v8 = TRLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v25;
      v9 = "Error: [TRTransferBrowser] Invalid pairing state (%li)";
      goto LABEL_34;
  }
}

void __44__TRTransferBrowser_transferDidReceiveData___block_invoke_121(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 length];
  if (v3) {
    uint64_t v4 = (void *)[v5 copy];
  }
  else {
    uint64_t v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3) {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

- (void)transferDidFailWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Transfer failed with error: %@", buf, 0xCu);
    }
  }
  if (self->_waitingOnSemaphore) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_responseSemaphore);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 browserDidDisconnect:self];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TRTransferBrowser_transferDidFailWithError___block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __46__TRTransferBrowser_transferDidFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 24) = 0;
}

- (void)transferComplete
{
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Transfer completed.", buf, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 browserDidDisconnect:self];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TRTransferBrowser_transferComplete__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __37__TRTransferBrowser_transferComplete__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 24) = 0;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__TRTransferBrowser_start__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __26__TRTransferBrowser_start__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 1;
    uint64_t v10 = @"WPTimeAfterUnlock";
    v11[0] = &unk_26C58CC38;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v4 = objc_alloc(MEMORY[0x263F864C8]);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = dispatch_get_global_queue(0, 0);
    uint64_t v7 = [v4 initWithDelegate:v5 queue:v6 machName:@"com.apple.touchsetupd.wirelessproximity" options:v3];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = v7;

    *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(*(void *)(a1 + 32) + 64) scannerState];
    [*(id *)(a1 + 32) _beginScanningIfPowered];
  }
}

- (void)defer
{
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__TRTransferBrowser_stop__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __25__TRTransferBrowser_stop__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 0;
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = 0;

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 56) == 3)
    {
      id v6 = *(void **)(v5 + 64);
      [v6 stopScan];
    }
  }
}

- (void)_beginScanningIfPowered
{
  if (self->_scannerState == 3) {
    [(WPTransfer *)self->_transferSession startScan];
  }
}

- (void)_didFinishPairing
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Pairing finished.", buf, 2u);
    }
  }
  id v4 = [@"TRBT-Key" dataUsingEncoding:4];
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
    if (_TRLogEnabled != 1) {
      goto LABEL_15;
    }
    int v9 = v8;
    uint64_t v10 = TRLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v16 = 134217984;
    uint64_t v17 = v9;
    uint64_t v11 = "Error: [TRTransferBrowser] Unable to derive key: %li";
    goto LABEL_13;
  }
  self->_aesContext = ($D2B14CE87E15B00C17B758FDEADD6073 *)malloc_type_calloc(1uLL, 0x30uLL, 0x1020040423EBB36uLL);
  int v12 = AES_CTR_Init();
  if (!v12)
  {
    int64_t v15 = 3;
    goto LABEL_19;
  }
  if (_TRLogEnabled == 1)
  {
    int v13 = v12;
    uint64_t v10 = TRLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    int v16 = 134217984;
    uint64_t v17 = v13;
    uint64_t v11 = "Error: [TRTransferBrowser] Unable to intialize context: %li";
LABEL_13:
    _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    goto LABEL_14;
  }
LABEL_15:
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    int64_t v15 = 0;
    self->_pairingSession = 0;
  }
  else
  {
    int64_t v15 = 0;
  }
LABEL_19:
  self->_pairingState = v15;
}

- (id)_didReceiveEncryptedData:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 length])
  {
    int v8 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", objc_msgSend(v4, "length"));
  if (self->_aesContext)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    id v7 = v5;
    [v7 mutableBytes];
    if (!AES_CTR_Update())
    {
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x3032000000;
      id v22 = __Block_byref_object_copy_;
      v23 = __Block_byref_object_dispose_;
      id v24 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        int v12 = (void *)[v7 copy];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __46__TRTransferBrowser__didReceiveEncryptedData___block_invoke;
        v18[3] = &unk_264220808;
        v18[4] = self;
        v18[5] = &v19;
        [v11 browser:self didReceiveData:v12 replyHandler:v18];

        self->_waitingOnSemaphore = 1;
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_responseSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        self->_waitingOnSemaphore = 0;
      }
      if (v20[5])
      {
        id v13 = objc_alloc(MEMORY[0x263EFF990]);
        v14 = objc_msgSend(v13, "initWithLength:", objc_msgSend((id)v20[5], "length"));
        [ (id) v20[5] bytes];
        [(id)v20[5] length];
        int64_t v15 = v14;
        [v15 mutableBytes];
        if (AES_CTR_Update())
        {
          int v8 = 0;
        }
        else
        {
          if (_TRLogEnabled != 1)
          {
            int v8 = v15;
            goto LABEL_17;
          }
          int v16 = TRLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing exchange data response: %@", buf, 0xCu);
          }
          int v8 = v15;
          int64_t v15 = v16;
        }
      }
      else
      {
        int v8 = 0;
      }
LABEL_17:
      _Block_object_dispose(&v19, 8);

      goto LABEL_18;
    }
  }
  int v8 = 0;
LABEL_18:

LABEL_19:
  return v8;
}

void __46__TRTransferBrowser__didReceiveEncryptedData___block_invoke(uint64_t a1, void *a2)
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
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(v21, 0, sizeof(v21));
  if (a4 == 1) {
    unint64_t v7 = *(unsigned char *)a3 != 0;
  }
  else {
    unint64_t v7 = a4;
  }
  if (_TRLogEnabled == 1)
  {
    int v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v7;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup input data length: %ld", buf, 0xCu);
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
          unint64_t v18 = v10;
          _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Unable to do session pairing setup exhange (%li)", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263EFF8F8] dataWithBytes:v21 length:0];
        if (_TRLogEnabled == 1)
        {
          v14 = TRLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = *a5;
            *(_DWORD *)buf = 138412546;
            unint64_t v18 = (unint64_t)v15;
            __int16 v19 = 2048;
            id v20 = v15;
            _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing setup exchange data: %@ (%p)", buf, 0x16u);
          }
        }
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
        unint64_t v18 = pairingState;
        _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] No session for pairing setup exhange (state: %ld)", buf, 0xCu);
      }
    }
    return 0;
  }
  return v10;
}

- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  if (a4 == 1) {
    unint64_t v7 = *(unsigned char *)a3 != 0;
  }
  else {
    unint64_t v7 = a4;
  }
  if (_TRLogEnabled == 1)
  {
    int v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v7;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify input data length: %ld", buf, 0xCu);
    }
  }
  if (self->_pairingSession)
  {
    int v9 = VBAEFt();
    if (v9)
    {
      int v10 = v9;
      if (_TRLogEnabled == 1)
      {
        id v11 = TRLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v18 = v10;
          _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Unable to do session pairing verify exhange (%li)", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263EFF8F8] dataWithBytes:v19 length:0];
        if (_TRLogEnabled == 1)
        {
          id v15 = TRLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = *a5;
            *(_DWORD *)buf = 138412290;
            unint64_t v18 = (unint64_t)v16;
            _os_log_impl(&dword_2149BE000, v15, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing verify exchange data: %@", buf, 0xCu);
          }
        }
      }
      int v10 = 0;
      self->_int64_t pairingState = 2;
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
        unint64_t v18 = pairingState;
        _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] No session for pairing verify exhange (state: %ld)", buf, 0xCu);
      }
    }
    return 0;
  }
  return v10;
}

- (TRTransferBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRTransferBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferSession, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end