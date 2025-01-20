@interface FCClientEndpointConnection
- (FCAsyncSerialQueue)serialQueue;
- (FCClientEndpointConnection)initWithConfigurationManager:(id)a3;
- (FCClientEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4;
- (FCCoreConfigurationManager)configurationManager;
- (FCEndpointConnection)endpointConnection;
- (NSURL)baseURL;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)reportConcern:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)reportConcernV2:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)setBaseURL:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setEndpointConnection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 countryCode:(id)a7 languageCode:(id)a8 callbackQueue:(id)a9 completion:(id)a10;
- (void)updateBaseURLWith:(id)a3;
@end

@implementation FCClientEndpointConnection

void __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained configurationManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2;
  v8[3] = &unk_1E5B502D8;
  id v9 = WeakRetained;
  id v10 = v3;
  id v6 = v3;
  id v7 = WeakRetained;
  [v5 fetchConfigurationIfNeededWithCompletion:v8];
}

- (FCClientEndpointConnection)initWithConfigurationManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(FCEndpointConnection);
  id v6 = [(FCClientEndpointConnection *)self initWithEndpointConnection:v5 configurationManager:v4];

  return v6;
}

- (FCClientEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FCClientEndpointConnection;
  id v9 = [(FCClientEndpointConnection *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
    v11 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = v11;

    v13 = [(FCClientEndpointConnection *)v10 configurationManager];
    [v13 addObserver:v10];

    objc_initWeak(&location, v10);
    v14 = [(FCClientEndpointConnection *)v10 serialQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke;
    v16[3] = &unk_1E5B50DD0;
    objc_copyWeak(&v17, &location);
    [v14 enqueueBlock:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

void __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch endpoint configuration with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) updateBaseURLWith:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateBaseURLWith:(id)a3
{
  id v4 = +[FCBaseURLConfiguration CAPIBaseURLForConfiguration:a3];
  [(FCClientEndpointConnection *)self setBaseURL:v4];
}

- (void)setBaseURL:(id)a3
{
}

- (void)reportConcernV2:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(FCClientEndpointConnection *)self serialQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke;
  v15[3] = &unk_1E5B50E20;
  objc_copyWeak(&v19, &location);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v11 enqueueBlock:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained baseURL];

  if (v5)
  {
    id v6 = [WeakRetained baseURL];
    id v7 = [v6 URLByAppendingPathComponent:@"v2/userConcern"];

    id v8 = [WeakRetained endpointConnection];
    int v9 = *MEMORY[0x1E4F18CF0];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E5B50DF8;
    id v17 = v7;
    id v18 = v3;
    id v19 = *(id *)(a1 + 48);
    id v12 = v7;
    LODWORD(v13) = v9;
    [v8 performHTTPRequestWithURL:v12 method:@"POST" data:v10 contentType:@"application/json" priority:1 requiresMescalSigning:v11 callbackQueue:v13 completion:v16];
  }
  else
  {
    v3[2](v3);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      v15 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
}

void __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  if (a3)
  {
    id v6 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [a3 statusCode], a1[4]);
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v7 = a1[6];
    if (v7) {
      (*(void (**)(uint64_t, BOOL, void *))(v7 + 16))(v7, v6 == 0, v6);
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v8 = a1[6];
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
    }
  }
}

- (void)reportConcern:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(FCClientEndpointConnection *)self serialQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke;
  v15[3] = &unk_1E5B50E20;
  objc_copyWeak(&v19, &location);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v11 enqueueBlock:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained baseURL];

  if (v5)
  {
    id v6 = [WeakRetained baseURL];
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"reportConcern"];

    id v8 = [WeakRetained endpointConnection];
    id v9 = [*(id *)(a1 + 32) data];
    int v10 = *MEMORY[0x1E4F18CF0];
    uint64_t v11 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E5B50E48;
    id v17 = v7;
    id v18 = v3;
    id v19 = *(id *)(a1 + 48);
    id v12 = v7;
    LODWORD(v13) = v10;
    [v8 performHTTPRequestWithURL:v12 method:@"POST" data:v9 contentType:@"application/x-protobuf" priority:1 requiresMescalSigning:v11 callbackQueue:v13 completion:v16];
  }
  else
  {
    v3[2](v3);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      v15 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
}

void __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  (*(void (**)(void))(a1[5] + 16))();
  if (v10)
  {
    uint64_t v7 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v10 statusCode], a1[4]);
    uint64_t v8 = a1[6];
    if (v8) {
      (*(void (**)(uint64_t, BOOL, void *))(v8 + 16))(v8, v7 == 0, v7);
    }
  }
  else
  {
    uint64_t v9 = a1[6];
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
}

- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 countryCode:(id)a7 languageCode:(id)a8 callbackQueue:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = objc_alloc_init(MEMORY[0x1E4F82B58]);
  [v23 setChannelId:v15];
  [v23 setIapId:v16];
  [v23 setEmail:v17];
  [v23 setPurchaseReceipt:v18];
  [v23 setCountry:v19];
  [v23 setLanguage:v20];
  objc_initWeak(&location, self);
  v24 = [(FCClientEndpointConnection *)self serialQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke;
  v29[3] = &unk_1E5B50E20;
  objc_copyWeak(&v33, &location);
  id v25 = v23;
  id v30 = v25;
  id v26 = v21;
  id v31 = v26;
  id v27 = v22;
  id v32 = v27;
  [v24 enqueueBlock:v29];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained baseURL];

  if (v5)
  {
    id v6 = [WeakRetained baseURL];
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"publisherWebAccessOptIn"];

    uint64_t v8 = [WeakRetained endpointConnection];
    uint64_t v9 = [*(id *)(a1 + 32) data];
    int v10 = *MEMORY[0x1E4F18CF0];
    uint64_t v11 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E5B50DF8;
    id v17 = v7;
    id v18 = v3;
    id v19 = *(id *)(a1 + 48);
    id v12 = v7;
    LODWORD(v13) = v10;
    [v8 performHTTPRequestWithURL:v12 method:@"POST" data:v9 contentType:@"application/x-protobuf" priority:1 requiresMescalSigning:v11 callbackQueue:v13 completion:v16];
  }
  else
  {
    v3[2](v3);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      id v15 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
}

void __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  if (a3)
  {
    id v6 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [a3 statusCode], a1[4]);
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v7 = a1[6];
    if (v7) {
      (*(void (**)(uint64_t, BOOL, void *))(v7 + 16))(v7, v6 == 0, v6);
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v8 = a1[6];
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
    }
  }
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(FCClientEndpointConnection *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__FCClientEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E5B50E70;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 enqueueBlock:v8];
}

void __74__FCClientEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 updateBaseURLWith:v3];
  v4[2]();
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (void)setConfigurationManager:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end