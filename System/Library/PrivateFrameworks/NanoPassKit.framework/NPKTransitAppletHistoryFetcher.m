@interface NPKTransitAppletHistoryFetcher
- (NFSession)pendingSessionHandle;
- (NPKTransitAppletHistoryFetcher)initWithCallbackQueue:(id)a3;
- (NPKTransitAppletHistoryFetcherDelegate)delegate;
- (NSString)aidToFetch;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)internalQueue;
- (void)_handleActiveSecureElementManagerSession:(id)a3;
- (void)_handleSecureElementSessionFailureWithError:(id)a3;
- (void)requestTransitHistoryFetch;
- (void)setAIDToFetch:(id)a3;
- (void)setAidToFetch:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPendingSessionHandle:(id)a3;
@end

@implementation NPKTransitAppletHistoryFetcher

- (NPKTransitAppletHistoryFetcher)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKTransitAppletHistoryFetcher;
  v6 = [(NPKTransitAppletHistoryFetcher *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("NPKTransitAppletHistoryFetcher", v8);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)setAIDToFetch:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__NPKTransitAppletHistoryFetcher_setAIDToFetch___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __48__NPKTransitAppletHistoryFetcher_setAIDToFetch___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher set AID to %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)requestTransitHistoryFetch
{
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher received fetch request", buf, 2u);
    }
  }
  int v6 = [(NPKTransitAppletHistoryFetcher *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(v6, block);
}

void __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingSessionHandle];

  if (v2)
  {
    BOOL v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v4) {
      return;
    }
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher already has an outstanding session handle; not creating a new session.",
        v7,
        2u);
    }
  }
  else
  {
    uint64_t v5 = [(id)PKGetClassNFHardwareManager() sharedHardwareManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_2;
    v8[3] = &unk_2644D46B8;
    v8[4] = *(void *)(a1 + 32);
    int v6 = [v5 startSecureElementManagerSession:v8];
    [*(id *)(a1 + 32) setPendingSessionHandle:v6];
  }
}

void __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_3;
  block[3] = &unk_2644D31B0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_handleActiveSecureElementManagerSession:");
    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    [v2 _handleSecureElementSessionFailureWithError:*(void *)(a1 + 48)];
  }
  BOOL v4 = *(void **)(a1 + 40);
  return [v4 setPendingSessionHandle:0];
}

- (void)_handleActiveSecureElementManagerSession:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  BOOL v4 = (NSString *)a3;
  id v5 = [(NPKTransitAppletHistoryFetcher *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      aidToFetch = self->_aidToFetch;
      *(_DWORD *)buf = 138412546;
      v35 = aidToFetch;
      __int16 v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher (AID %@) got secure element manager session: %@", buf, 0x16u);
    }
  }
  id v10 = self->_aidToFetch;
  v11 = [(NSString *)v4 appletWithIdentifier:v10];
  id v12 = v11;
  if (v11)
  {
    if ([v11 isTypeF] && objc_msgSend(v12, "supportedTypeFSystem") == 1)
    {
      uint64_t v33 = 0;
      uint64_t v13 = (id *)&v33;
      id v14 = [(NSString *)v4 felicaAppletState:v12 error:&v33];
      v15 = (Class *)0x263F5BE90;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v13 = (id *)&v32;
      id v14 = [(NSString *)v4 transitAppletState:v12 error:&v32];
      v15 = (Class *)0x263F5C2B8;
    }
    v16 = *v13;
    v17 = (NSString *)[objc_alloc(*v15) initWithDictionary:v14 source:1];

    if (v16)
    {
      v18 = pk_General_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        v20 = pk_General_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v35 = (NSString *)v12;
          __int16 v36 = 2112;
          v37 = v10;
          __int16 v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: Fail to creat Transit Applet history with Applet:%@ AID:%@ with error:%@", buf, 0x20u);
        }
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v21 = pk_General_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v10;
      __int16 v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Could not fetch Applet with ID:%@ from session:%@", buf, 0x16u);
    }
    v17 = 0;
    goto LABEL_19;
  }
  v17 = 0;
LABEL_20:
  v23 = pk_Payment_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    v25 = pk_Payment_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v17;
      __int16 v36 = 2112;
      v37 = (NSString *)v12;
      _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher got applet history: %@ for applet: %@", buf, 0x16u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__NPKTransitAppletHistoryFetcher__handleActiveSecureElementManagerSession___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  v30 = v17;
  v31 = v10;
  v27 = v10;
  v28 = v17;
  dispatch_async(callbackQueue, block);
}

void __75__NPKTransitAppletHistoryFetcher__handleActiveSecureElementManagerSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitAppletHistoryFetcher:*(void *)(a1 + 32) gotTransitAppletHistory:*(void *)(a1 + 40) forAppletWithAID:*(void *)(a1 + 48)];
}

- (void)_handleSecureElementSessionFailureWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NPKTransitAppletHistoryFetcher *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    uint64_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: History fetcher failed to start secure element manager session: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (NPKTransitAppletHistoryFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKTransitAppletHistoryFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)aidToFetch
{
  return self->_aidToFetch;
}

- (void)setAidToFetch:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (NFSession)pendingSessionHandle
{
  return self->_pendingSessionHandle;
}

- (void)setPendingSessionHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionHandle, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_aidToFetch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end