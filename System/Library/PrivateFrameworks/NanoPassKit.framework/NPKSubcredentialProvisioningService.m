@interface NPKSubcredentialProvisioningService
- (BOOL)isPairedDeviceConnected;
- (IDSService)subcredentialService;
- (NPKSubcredentialProvisioningService)init;
- (NSMutableDictionary)outstandingRequests;
- (OS_dispatch_queue)subcredentialProvisioningQueue;
- (id)_sendOptions;
- (id)_sendProtobuf:(id)a3 responseExpected:(BOOL)a4 extraOptions:(id)a5;
- (id)sendProtobuf:(id)a3 responseExpected:(BOOL)a4;
- (void)_setUpSubcredentialProvisioningQueue;
- (void)_setUpSubcredentialProvisioningService;
- (void)_trackOutstandingRequestWithMessageIdentifier:(id)a3 completionHandler:(id)a4 errorHandler:(id)a5;
- (void)registerProtobufActionsForService:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setOutstandingRequests:(id)a3;
- (void)setSubcredentialService:(id)a3;
@end

@implementation NPKSubcredentialProvisioningService

- (NPKSubcredentialProvisioningService)init
{
  v13.receiver = self;
  v13.super_class = (Class)NPKSubcredentialProvisioningService;
  v2 = [(NPKSubcredentialProvisioningService *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoPassKit.NPKSubcredentialProvisioningService", 0);
    subcredentialProvisioningQueue = v2->_subcredentialProvisioningQueue;
    v2->_subcredentialProvisioningQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.passbook.maintenance"];
    subcredentialService = v2->_subcredentialService;
    v2->_subcredentialService = (IDSService *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = (NSMutableDictionary *)v7;

    v9 = v2->_subcredentialProvisioningQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__NPKSubcredentialProvisioningService_init__block_invoke;
    block[3] = &unk_2644D2910;
    v12 = v2;
    dispatch_sync(v9, block);
  }
  return v2;
}

uint64_t __43__NPKSubcredentialProvisioningService_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpSubcredentialProvisioningQueue];
  v2 = *(void **)(a1 + 32);
  return [v2 _setUpSubcredentialProvisioningService];
}

- (void)registerProtobufActionsForService:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      uint64_t v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        uint64_t v7 = "-[NPKSubcredentialProvisioningService registerProtobufActionsForService:]";
        __int16 v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKSubcredentialProvisioningService.m";
        __int16 v10 = 2048;
        uint64_t v11 = 47;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expected service to be non-nil!)", (uint8_t *)&v6, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
}

- (id)sendProtobuf:(id)a3 responseExpected:(BOOL)a4
{
  return [(NPKSubcredentialProvisioningService *)self _sendProtobuf:a3 responseExpected:a4 extraOptions:0];
}

- (BOOL)isPairedDeviceConnected
{
  v2 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
  char v3 = NPKIsConnectedToPairedOrPairingDeviceFromService(v2);

  return v3;
}

- (void)_setUpSubcredentialProvisioningQueue
{
  subcredentialProvisioningQueue = self->_subcredentialProvisioningQueue;
  char v3 = dispatch_get_global_queue(21, 0);
  dispatch_set_target_queue(subcredentialProvisioningQueue, v3);
}

- (void)_setUpSubcredentialProvisioningService
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
    [(NPKSubcredentialProvisioningService *)self registerProtobufActionsForService:v7];

    id v16 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
    __int16 v8 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
    [v16 addDelegate:self queue:v8];
  }
  else
  {
    v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      uint64_t v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        objc_super v13 = NSStringFromClass(v12);
        v14 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
        v15 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
        *(_DWORD *)buf = 138543874;
        v18 = v13;
        __int16 v19 = 2112;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected subcredentialProvisioningService and subcredentialProvisioningQueue to be non-nil! subcredentialProvisioningService: %@ subcredentialProvisioningQueue: %@", buf, 0x20u);
      }
    }
  }
}

- (id)_sendOptions
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F49F08];
  v5[0] = *MEMORY[0x263F49ED8];
  v5[1] = v2;
  v6[0] = MEMORY[0x263EFFA88];
  v6[1] = MEMORY[0x263EFFA88];
  char v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (id)_sendProtobuf:(id)a3 responseExpected:(BOOL)a4 extraOptions:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      uint64_t v15 = [v8 npkDescription];
      id v16 = (void *)v15;
      v17 = @"NO";
      *(_DWORD *)buf = 138544130;
      v29 = v14;
      if (v6) {
        v17 = @"YES";
      }
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      v33 = v17;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending protobuf: %@ with response expected: %@ extra options: %@", buf, 0x2Au);
    }
  }
  v18 = [(NPKSubcredentialProvisioningService *)self _sendOptions];
  __int16 v19 = (void *)[v18 mutableCopy];

  if (v6) {
    v20 = &unk_26D0439B0;
  }
  else {
    v20 = &unk_26D0439C0;
  }
  [v19 setObject:v20 forKey:*MEMORY[0x263F49F80]];
  if (v9) {
    [v19 addEntriesFromDictionary:v9];
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __83__NPKSubcredentialProvisioningService__sendProtobuf_responseExpected_extraOptions___block_invoke;
  v26[3] = &unk_2644D29D0;
  id v27 = v8;
  id v21 = v8;
  v22 = (void *)MEMORY[0x223C37380](v26);
  uint64_t v23 = [(NPKSubcredentialProvisioningService *)self subcredentialService];
  v24 = NPKProtoSendWithOptions(v23, v21, 200, 0, v6, v22, v19);

  return v24;
}

void __83__NPKSubcredentialProvisioningService__sendProtobuf_responseExpected_extraOptions___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    uint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: IDS failed to send protobuf %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_trackOutstandingRequestWithMessageIdentifier:(id)a3 completionHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = objc_alloc_init(NPKProvisioningServiceOutstandingRequest);
  [(NPKProvisioningServiceOutstandingRequest *)v11 setCompletionHandler:v9];
  [(NPKProvisioningServiceOutstandingRequest *)v11 setErrorHandler:v10];
  [(NPKProvisioningServiceOutstandingRequest *)v11 setMessageIdentifier:v8];
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke;
  v18 = &unk_2644D33D8;
  objc_copyWeak(&v21, &location);
  id v12 = v8;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  [(NPKProvisioningServiceOutstandingRequest *)v11 setTimeoutHandler:&v15];
  -[NPKProvisioningServiceOutstandingRequest setTimeoutQueue:](v11, "setTimeoutQueue:", self->_subcredentialProvisioningQueue, v15, v16, v17, v18);
  v14 = [(NPKSubcredentialProvisioningService *)self outstandingRequests];
  [v14 setObject:v11 forKey:v12];

  [(NPKProvisioningServiceOutstandingRequest *)v11 setOrResetCleanupTimer];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    uint64_t v4 = [(dispatch_queue_t *)v3 outstandingRequests];
    uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    int v6 = [v5 errorHandler];
    uint64_t v7 = [(dispatch_queue_t *)v3 outstandingRequests];
    [v7 removeObjectForKey:*(void *)(a1 + 32)];

    if (*(void *)(a1 + 40))
    {
      id v8 = pk_Payment_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        id v10 = pk_Payment_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v11;
          _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Timed out waiting for response; invoking error handler for message %@",
            buf,
            0xCu);
        }
      }
      id v12 = NPKGetIDSCommunicationError();
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke_31;
      v14[3] = &unk_2644D3FF0;
      id v15 = v12;
      id v16 = v6;
      id v13 = v12;
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
  }
}

uint64_t __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service accounts changed: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service devices changed: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    uint64_t v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      __int16 v30 = v20;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v14;
      __int16 v37 = 1024;
      BOOL v38 = v8;
      __int16 v39 = 2112;
      id v40 = v15;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service did send with success: %@ %@ %@ %d %@", buf, 0x3Au);
    }
  }
  objc_initWeak((id *)buf, self);
  id v21 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke;
  v24[3] = &unk_2644D4BA0;
  objc_copyWeak(&v27, (id *)buf);
  BOOL v28 = v8;
  id v25 = v14;
  id v26 = v15;
  id v22 = v15;
  id v23 = v14;
  dispatch_async(v21, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = [WeakRetained outstandingRequests];
  id v4 = [v3 objectForKey:*(void *)(a1 + 32)];

  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [v4 errorHandler];
      id v12 = (void *)MEMORY[0x223C37380]();
      *(_DWORD *)buf = 138544130;
      id v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = v10;
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      BOOL v38 = v12;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: identifier: %@ request: %@ error handler: %@", buf, 0x2Au);
    }
  }
  if (v4 && !*(unsigned char *)(a1 + 56))
  {
    id v13 = NPKGetIDSCommunicationError();
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    id v15 = v14;
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      [v14 setObject:v16 forKey:*MEMORY[0x263F08608]];
    }
    BOOL v17 = [v13 localizedDescription];

    if (v17)
    {
      uint64_t v18 = [v13 localizedDescription];
      [v15 setObject:v18 forKey:*MEMORY[0x263F08320]];
    }
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    id v20 = [v13 domain];
    id v21 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v13, "code"), v15);

    id v22 = [v4 errorHandler];
    if (v22)
    {
      id v23 = dispatch_get_global_queue(0, 0);
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      id v27 = __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke_33;
      BOOL v28 = &unk_2644D3FF0;
      id v30 = v22;
      id v29 = v21;
      dispatch_async(v23, &v25);
    }
    v24 = objc_msgSend(WeakRetained, "outstandingRequests", v25, v26, v27, v28);
    [v24 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

uint64_t __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)subcredentialProvisioningQueue
{
  return self->_subcredentialProvisioningQueue;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
}

- (IDSService)subcredentialService
{
  return self->_subcredentialService;
}

- (void)setSubcredentialService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialService, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_subcredentialProvisioningQueue, 0);
}

@end