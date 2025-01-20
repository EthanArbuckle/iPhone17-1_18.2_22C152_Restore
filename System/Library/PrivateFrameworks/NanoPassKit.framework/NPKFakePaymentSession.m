@interface NPKFakePaymentSession
- (BOOL)deferAuthorization;
- (BOOL)inServiceMode;
- (BOOL)invalidated;
- (BOOL)ourConfirmed;
- (BOOL)ourInServiceMode;
- (BOOL)ourPerformedFirstActivation;
- (BOOL)sessionStarted;
- (BOOL)startSession;
- (NPKFakePaymentSession)initWithQueue:(id)a3;
- (NSDictionary)ourVasPasses;
- (OS_dispatch_queue)ourCallbackQueue;
- (OS_dispatch_queue)ourInternalQueue;
- (OS_dispatch_source)timeoutTimer;
- (PKFieldDetector)fieldDetector;
- (PKPass)ourCurrentPass;
- (id)currentPass;
- (id)vasPasses;
- (unint64_t)changeCardToken;
- (void)_handleSessionHasCredentialIfNecessaryWithCurrentPass:(id)a3;
- (void)_handleTimeoutTimer;
- (void)_handleTransactionCompleteDarwinNotification;
- (void)_scheduleDidActivateEventForPass:(id)a3;
- (void)_sendTransactionCompleteToDelegate;
- (void)_setTimeoutTimer;
- (void)confirmSessionExpectingCredential:(BOOL)a3;
- (void)deactivateSessionWithCompletion:(id)a3;
- (void)dealloc;
- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4;
- (void)setChangeCardToken:(unint64_t)a3;
- (void)setCredential:(id)a3;
- (void)setCurrentPass:(id)a3;
- (void)setFieldDetector:(id)a3;
- (void)setInServiceMode:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOurCallbackQueue:(id)a3;
- (void)setOurConfirmed:(BOOL)a3;
- (void)setOurCurrentPass:(id)a3;
- (void)setOurInServiceMode:(BOOL)a3;
- (void)setOurInternalQueue:(id)a3;
- (void)setOurPerformedFirstActivation:(BOOL)a3;
- (void)setOurVasPasses:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setVasPasses:(id)a3;
@end

@implementation NPKFakePaymentSession

- (NPKFakePaymentSession)initWithQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKFakePaymentSession;
  v5 = [(NPKFakePaymentSession *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FakePaymentSessionInternal", 0);
    ourInternalQueue = v5->_ourInternalQueue;
    v5->_ourInternalQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_ourInternalQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke;
    v10[3] = &unk_2644D2E08;
    v11 = v5;
    id v12 = v4;
    dispatch_sync(v8, v10);
  }
  return v5;
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = v2;
  if (!v2)
  {
    v3 = (void *)MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v3);
  if (!v2) {

  }
  if ((NPKIsRunningInStoreDemoMode() & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F5BE98]);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 184);
    *(void *)(v6 + 184) = v5;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "registerObserver:");
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 176);
  *(void *)(v10 + 176) = v9;

  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_2;
  handler[3] = &unk_2644D29A8;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v12, handler);
  [*(id *)(a1 + 32) _setTimeoutTimer];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 176));
  int out_token = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_4;
  v13[3] = &unk_2644D2870;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch("com.apple.NPKFakePaymentSession.TransactionComplete", &out_token, v8, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[21];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_3;
    block[3] = &unk_2644D2910;
    id v5 = WeakRetained;
    dispatch_sync(v3, block);
  }
}

uint64_t __39__NPKFakePaymentSession_initWithQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTimeoutTimer];
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke_4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[21];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_5;
    block[3] = &unk_2644D2910;
    id v5 = WeakRetained;
    dispatch_sync(v3, block);
  }
}

uint64_t __39__NPKFakePaymentSession_initWithQueue___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTransactionCompleteDarwinNotification];
}

- (BOOL)startSession
{
  return 1;
}

- (BOOL)sessionStarted
{
  return ![(NPKFakePaymentSession *)self invalidated];
}

- (void)dealloc
{
  [(PKFieldDetector *)self->_fieldDetector unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NPKFakePaymentSession;
  [(NPKQuickPaymentSession *)&v3 dealloc];
}

- (void)setCurrentPass:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting current pass %@", buf, 0xCu);
    }
  }
  v8 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__NPKFakePaymentSession_setCurrentPass___block_invoke;
  v10[3] = &unk_2644D2E08;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __40__NPKFakePaymentSession_setCurrentPass___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOurCurrentPass:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 32) invalidated] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) ourCallbackQueue];
    uint64_t v4 = MEMORY[0x263EF8330];
    uint64_t v5 = 3221225472;
    BOOL v6 = __40__NPKFakePaymentSession_setCurrentPass___block_invoke_2;
    v7 = &unk_2644D2E08;
    objc_super v3 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v2, &v4);

    objc_msgSend(*(id *)(a1 + 32), "_scheduleDidActivateEventForPass:", *(void *)(a1 + 40), v4, v5, v6, v7, v8);
  }
}

void __40__NPKFakePaymentSession_setCurrentPass___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) didMakePassCurrent:*(void *)(a1 + 40)];
  }
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 paymentSession:*(void *)(a1 + 32) willActivatePass:*(void *)(a1 + 40)];
  }
}

- (id)currentPass
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__9;
  id v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  char v3 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__NPKFakePaymentSession_currentPass__block_invoke;
  v6[3] = &unk_2644D2960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__NPKFakePaymentSession_currentPass__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ourCurrentPass];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setVasPasses:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting VAS passes %@", buf, 0xCu);
    }
  }
  uint64_t v8 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__NPKFakePaymentSession_setVasPasses___block_invoke;
  v10[3] = &unk_2644D2E08;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

uint64_t __38__NPKFakePaymentSession_setVasPasses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOurVasPasses:*(void *)(a1 + 40)];
}

- (void)setCredential:(id)a3
{
  id v4 = [(NPKFakePaymentSession *)self ourInternalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NPKFakePaymentSession_setCredential___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __39__NPKFakePaymentSession_setCredential___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 ourCurrentPass];
  [v2 _handleSessionHasCredentialIfNecessaryWithCurrentPass:v3];

  id v4 = [*(id *)(a1 + 32) ourCallbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NPKFakePaymentSession_setCredential___block_invoke_2;
  block[3] = &unk_2644D2910;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

void __39__NPKFakePaymentSession_setCredential___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidReceiveCredential:*(void *)(a1 + 32)];
  }
}

- (id)vasPasses
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__9;
  id v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  char v3 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__NPKFakePaymentSession_vasPasses__block_invoke;
  v6[3] = &unk_2644D2960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__NPKFakePaymentSession_vasPasses__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ourVasPasses];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)deferAuthorization
{
  return 0;
}

- (void)setInServiceMode:(BOOL)a3
{
  uint64_t v5 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__NPKFakePaymentSession_setInServiceMode___block_invoke;
  v6[3] = &unk_2644D2938;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

void __42__NPKFakePaymentSession_setInServiceMode___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) ourInServiceMode];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setOurInServiceMode:v3 != 0];
    if (([*(id *)(a1 + 32) invalidated] & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) ourCurrentPass];
      uint64_t v5 = [*(id *)(a1 + 32) ourCallbackQueue];
      uint64_t v7 = MEMORY[0x263EF8330];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __42__NPKFakePaymentSession_setInServiceMode___block_invoke_2;
      uint64_t v10 = &unk_2644D2E08;
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = v4;
      id v6 = v4;
      dispatch_async(v5, &v7);

      objc_msgSend(*(id *)(a1 + 32), "_scheduleDidActivateEventForPass:", v6, v7, v8, v9, v10, v11);
    }
  }
}

void __42__NPKFakePaymentSession_setInServiceMode___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) didMakePassCurrent:*(void *)(a1 + 40)];
  }
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 paymentSession:*(void *)(a1 + 32) willActivatePass:*(void *)(a1 + 40)];
  }
}

- (BOOL)inServiceMode
{
  int v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__NPKFakePaymentSession_inServiceMode__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__NPKFakePaymentSession_inServiceMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) ourInServiceMode];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4
{
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: detected field", buf, 2u);
    }
  }
  uint64_t v8 = [(NPKFakePaymentSession *)self ourInternalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NPKFakePaymentSession_fieldDetectorDidEnterField_withProperties___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_sync(v8, block);
}

uint64_t __67__NPKFakePaymentSession_fieldDetectorDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidated];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 _sendTransactionCompleteToDelegate];
  }
  return result;
}

- (void)confirmSessionExpectingCredential:(BOOL)a3
{
  id v4 = [(NPKFakePaymentSession *)self ourInternalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NPKFakePaymentSession_confirmSessionExpectingCredential___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __59__NPKFakePaymentSession_confirmSessionExpectingCredential___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) ourCurrentPass];
  char v3 = [*(id *)(a1 + 32) ourConfirmed];
  [*(id *)(a1 + 32) setOurConfirmed:1];
  if ((v3 & 1) == 0)
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        uint64_t v8 = v2;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: confirming session for pass %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setOurConfirmed:1];
    [*(id *)(a1 + 32) _handleSessionHasCredentialIfNecessaryWithCurrentPass:v2];
  }
}

- (void)deactivateSessionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: deactivating session", buf, 2u);
    }
  }
  uint64_t v8 = [(NPKFakePaymentSession *)self ourInternalQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke;
  v10[3] = &unk_2644D2E58;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) invalidated];
  [*(id *)(a1 + 32) setInvalidated:1];
  char v3 = [*(id *)(a1 + 32) ourCallbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke_2;
  block[3] = &unk_2644D3680;
  char v7 = v2;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, block);
}

uint64_t __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    char v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      [v4 paymentSession:*(void *)(a1 + 32) didCompleteTransactionForReason:1 withTransactionContext:0 shouldCleanupSession:1];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_scheduleDidActivateEventForPass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKFakePaymentSession *)self ourInternalQueue];
  dispatch_assert_queue_V2(v5);

  [(NPKFakePaymentSession *)self setChangeCardToken:[(NPKFakePaymentSession *)self changeCardToken] + 1];
  unint64_t v6 = [(NPKFakePaymentSession *)self changeCardToken];
  dispatch_time_t v7 = dispatch_time(0, 500000000);
  uint64_t v8 = [(NPKFakePaymentSession *)self ourInternalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke;
  block[3] = &unk_2644D3288;
  id v11 = v4;
  unint64_t v12 = v6;
  void block[4] = self;
  id v9 = v4;
  dispatch_after(v7, v8, block);
}

void __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == [*(id *)(a1 + 32) changeCardToken])
  {
    char v3 = [*(id *)(a1 + 32) ourCallbackQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke_2;
    v5[3] = &unk_2644D2E08;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(v3, v5);
  }
}

void __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) didActivatePass:*(void *)(a1 + 40)];
  }
}

- (void)_setTimeoutTimer
{
  char v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting timer", v9, 2u);
    }
  }
  id v6 = [(NPKFakePaymentSession *)self ourInternalQueue];
  dispatch_assert_queue_V2(v6);

  dispatch_time_t v7 = [(NPKFakePaymentSession *)self timeoutTimer];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_handleTimeoutTimer
{
  char v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: handling timeout", buf, 2u);
    }
  }
  id v6 = [(NPKFakePaymentSession *)self ourInternalQueue];
  dispatch_assert_queue_V2(v6);

  if (![(NPKFakePaymentSession *)self invalidated])
  {
    dispatch_time_t v7 = [(NPKFakePaymentSession *)self ourCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__NPKFakePaymentSession__handleTimeoutTimer__block_invoke;
    block[3] = &unk_2644D2910;
    void block[4] = self;
    dispatch_async(v7, block);
  }
}

void __44__NPKFakePaymentSession__handleTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) didCompleteTransactionForReason:2 withTransactionContext:0 shouldCleanupSession:1];
  }
}

- (void)_handleTransactionCompleteDarwinNotification
{
  char v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: Got transaction complete Darwin notification", v7, 2u);
    }
  }
  id v6 = [(NPKFakePaymentSession *)self ourInternalQueue];
  dispatch_assert_queue_V2(v6);

  if (![(NPKFakePaymentSession *)self invalidated]) {
    [(NPKFakePaymentSession *)self _sendTransactionCompleteToDelegate];
  }
}

- (void)_handleSessionHasCredentialIfNecessaryWithCurrentPass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKFakePaymentSession *)self ourInternalQueue];
  dispatch_assert_queue_V2(v5);

  if (![(NPKFakePaymentSession *)self ourPerformedFirstActivation])
  {
    [(NPKFakePaymentSession *)self setOurPerformedFirstActivation:1];
    if (![(NPKFakePaymentSession *)self invalidated])
    {
      [(NPKFakePaymentSession *)self _setTimeoutTimer];
      id v6 = [(NPKFakePaymentSession *)self ourCallbackQueue];
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      uint64_t v10 = __79__NPKFakePaymentSession__handleSessionHasCredentialIfNecessaryWithCurrentPass___block_invoke;
      id v11 = &unk_2644D2E08;
      unint64_t v12 = self;
      id v7 = v4;
      id v13 = v7;
      dispatch_async(v6, &v8);

      -[NPKFakePaymentSession _scheduleDidActivateEventForPass:](self, "_scheduleDidActivateEventForPass:", v7, v8, v9, v10, v11, v12);
    }
  }
}

void __79__NPKFakePaymentSession__handleSessionHasCredentialIfNecessaryWithCurrentPass___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) willActivatePass:*(void *)(a1 + 40)];
  }
}

- (void)_sendTransactionCompleteToDelegate
{
  v19[1] = *MEMORY[0x263EF8340];
  char v3 = [(NPKFakePaymentSession *)self ourCurrentPass];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 paymentPass];

    id v6 = objc_alloc(MEMORY[0x263F5BE18]);
    id v7 = v6;
    if (v5)
    {
      uint64_t v8 = [v4 paymentPass];
      uint64_t v9 = [v4 paymentPass];
      uint64_t v10 = [v9 npkPreferredContactlessPaymentApplications];
      id v11 = (void *)[v7 initWithPaymentPass:v8 activatedPaymentApplications:v10];

      unint64_t v12 = [v4 paymentPass];
      id v13 = [v12 npkPreferredContactlessPaymentApplications];
      uint64_t v14 = [v13 firstObject];
      [v11 setPaymentApplication:v14];
    }
    else
    {
      id v11 = (void *)[v6 initWithPaymentPass:0 activatedPaymentApplications:0];
      v19[0] = v4;
      unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      [v11 setValueAddedServicePasses:v12];
    }
  }
  else
  {
    id v11 = 0;
  }
  v15 = [(NPKFakePaymentSession *)self ourCallbackQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__NPKFakePaymentSession__sendTransactionCompleteToDelegate__block_invoke;
  v17[3] = &unk_2644D2E08;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  dispatch_async(v15, v17);
}

void __59__NPKFakePaymentSession__sendTransactionCompleteToDelegate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v4, "paymentSession:didCompleteTransactionForReason:withTransactionContext:shouldCleanupSession:", *(void *)(a1 + 32), 3, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));
  }
}

- (PKPass)ourCurrentPass
{
  return self->_ourCurrentPass;
}

- (void)setOurCurrentPass:(id)a3
{
}

- (NSDictionary)ourVasPasses
{
  return self->_ourVasPasses;
}

- (void)setOurVasPasses:(id)a3
{
}

- (OS_dispatch_queue)ourCallbackQueue
{
  return self->_ourCallbackQueue;
}

- (void)setOurCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)ourInternalQueue
{
  return self->_ourInternalQueue;
}

- (void)setOurInternalQueue:(id)a3
{
}

- (BOOL)ourConfirmed
{
  return self->_ourConfirmed;
}

- (void)setOurConfirmed:(BOOL)a3
{
  self->_ourConfirmed = a3;
}

- (BOOL)ourInServiceMode
{
  return self->_ourInServiceMode;
}

- (void)setOurInServiceMode:(BOOL)a3
{
  self->_ourInServiceMode = a3;
}

- (BOOL)ourPerformedFirstActivation
{
  return self->_ourPerformedFirstActivation;
}

- (void)setOurPerformedFirstActivation:(BOOL)a3
{
  self->_ourPerformedFirstActivation = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (PKFieldDetector)fieldDetector
{
  return self->_fieldDetector;
}

- (void)setFieldDetector:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)changeCardToken
{
  return self->_changeCardToken;
}

- (void)setChangeCardToken:(unint64_t)a3
{
  self->_changeCardToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetector, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_ourInternalQueue, 0);
  objc_storeStrong((id *)&self->_ourCallbackQueue, 0);
  objc_storeStrong((id *)&self->_ourVasPasses, 0);
  objc_storeStrong((id *)&self->_ourCurrentPass, 0);
}

@end