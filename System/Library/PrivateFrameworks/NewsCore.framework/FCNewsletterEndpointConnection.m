@interface FCNewsletterEndpointConnection
- (FCAsyncSerialQueue)serialQueue;
- (FCCoreConfigurationManager)configurationManager;
- (FCEndpointConnection)endpointConnection;
- (FCNewsletterEndpointConnection)initWithConfigurationManager:(id)a3;
- (FCNewsletterEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4;
- (NSURL)baseURL;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)deletePersonalizationVectorWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)getNewsletterSubscriptionWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)getWebTokenWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)newsletterSubscribeTo:(id)a3 includeArray:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
- (void)setBaseURL:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setEndpointConnection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)submitPersonalizationVector:(id)a3 withCallbackQueue:(id)a4 completion:(id)a5;
- (void)updateBaseURL:(id)a3;
@end

@implementation FCNewsletterEndpointConnection

void __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v8 statusCode], *(void *)(a1 + 32));
    if (v7)
    {
      objc_opt_class();
      v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
    }
    v15 = [v14 objectForKeyedSubscript:@"newsletters"];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v15)
    {
      v17 = [MEMORY[0x1E4F1CA98] null];

      if (v15 != v17)
      {
        id v32 = v14;
        uint64_t v33 = a1;
        v34 = v10;
        id v35 = v9;
        id v36 = v8;
        id v37 = v7;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v31 = v15;
        id obj = v15;
        uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v40 != v20) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v23 = [FCNewsletter alloc];
              v24 = [v22 objectForKeyedSubscript:@"newsletterId"];
              v25 = [v22 objectForKeyedSubscript:@"newsletterStatus"];
              if ([v25 isEqualToString:@"UNSUBSCRIBED"])
              {
                uint64_t v26 = 1;
              }
              else if ([v25 isEqualToString:@"SUBSCRIBED"])
              {
                uint64_t v26 = 2;
              }
              else
              {
                uint64_t v26 = 0;
              }
              v27 = -[FCNewsletter initWithIdentifier:enrollment:](v23, "initWithIdentifier:enrollment:", v24, v26, v31, v32, v33, v34, v35, v36, v37);

              [v16 addObject:v27];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v19);
        }

        id v8 = v36;
        id v7 = v37;
        v10 = v34;
        id v9 = v35;
        id v14 = v32;
        a1 = v33;
        v15 = v31;
      }
    }
    uint64_t v28 = *(void *)(a1 + 40);
    if (v28)
    {
      v29 = [v14 objectForKeyedSubscript:@"enrolledTo"];
      v30 = [v14 objectForKeyedSubscript:@"include"];
      (*(void (**)(uint64_t, void *, void *, id, void *))(v28 + 16))(v28, v29, v30, v16, v10);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, void, void, id))(v13 + 16))(v13, 0, 0, 0, v9);
    }
  }
}

- (void)getNewsletterSubscriptionWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCNewsletterEndpointConnection *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E5B5ACF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v11];
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

void __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  v3 = [*(id *)(a1 + 32) baseURL];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) baseURL];
    v5 = [v4 URLByAppendingPathComponent:@"v1/subscriptions"];

    id v6 = [*(id *)(a1 + 32) endpointConnection];
    int v7 = *MEMORY[0x1E4F18CF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E5B53D30;
    id v14 = v5;
    uint64_t v8 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v9 = v5;
    LODWORD(v10) = v7;
    [v6 performAuthenticatedHTTPRequestWithURL:v9 valuesByHTTPHeaderField:0 method:@"Signed_GET" data:0 contentType:@"application/json" priority:1 reauthenticateIfNeeded:v10 callbackQueue:v8 completion:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void, void, id))(v11 + 16))(v11, 0, 0, 0, v12);
    }
  }
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

void __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) configurationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2;
  v6[3] = &unk_1E5B502D8;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 fetchConfigurationIfNeededWithCompletion:v6];
}

- (FCNewsletterEndpointConnection)initWithConfigurationManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FCEndpointConnection);
  id v6 = [(FCNewsletterEndpointConnection *)self initWithEndpointConnection:v5 configurationManager:v4];

  return v6;
}

- (FCNewsletterEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCNewsletterEndpointConnection;
  id v9 = [(FCNewsletterEndpointConnection *)&v18 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    uint64_t v11 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = v11;

    objc_storeStrong((id *)&v10->_configurationManager, a4);
    id v13 = [(FCNewsletterEndpointConnection *)v10 configurationManager];
    [v13 addObserver:v10];

    id v14 = [(FCNewsletterEndpointConnection *)v10 serialQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke;
    v16[3] = &unk_1E5B4CF38;
    v17 = v10;
    [v14 enqueueBlock:v16];
  }
  return v10;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

void __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  [*(id *)(a1 + 32) updateBaseURL:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateBaseURL:(id)a3
{
  id v4 = +[FCBaseURLConfiguration newsletterBaseURLForConfiguration:a3];
  [(FCNewsletterEndpointConnection *)self setBaseURL:v4];
}

- (void)setBaseURL:(id)a3
{
}

- (void)newsletterSubscribeTo:(id)a3 includeArray:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(FCNewsletterEndpointConnection *)self serialQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E5B57258;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 enqueueBlock:v19];
}

void __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = [*(id *)(a1 + 32) baseURL];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) baseURL];
    id v5 = [v4 URLByAppendingPathComponent:@"v1/subscriptions"];

    v19[0] = @"enrollment";
    v19[1] = @"include";
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
    }
    v20[0] = *(void *)(a1 + 40);
    v20[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    int v8 = [*(id *)(a1 + 32) endpointConnection];
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:0];
    int v10 = *MEMORY[0x1E4F18CF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E5B53D30;
    id v17 = v5;
    uint64_t v11 = *(void *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    id v12 = v5;
    LODWORD(v13) = v10;
    [v8 performAuthenticatedHTTPRequestWithURL:v12 valuesByHTTPHeaderField:0 method:@"POST" data:v9 contentType:@"application/json" priority:1 reauthenticateIfNeeded:v13 callbackQueue:v11 completion:v16];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      id v15 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void, void))(v14 + 16))(v14, 0, 0, 0);
    }
  }
}

void __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v7 statusCode], *(void *)(a1 + 32));
    int v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:0];
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      double v13 = [v10 objectForKeyedSubscript:@"enrolledTo"];
      uint64_t v14 = [v11 objectForKeyedSubscript:@"include"];
      id v15 = [v11 objectForKeyedSubscript:@"newsletters"];
      (*(void (**)(uint64_t, void *, void *, void *, void *))(v12 + 16))(v12, v13, v14, v15, v9);
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void, void, id))(v16 + 16))(v16, 0, 0, 0, v8);
    }
  }
}

- (void)submitPersonalizationVector:(id)a3 withCallbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = [(FCNewsletterEndpointConnection *)self serialQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_2;
    v15[3] = &unk_1E5B57230;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v11;
    [v12 enqueueBlock:v15];

    double v13 = v16;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke;
  id v22 = &unk_1E5B4CA88;
  id v14 = v10;
  id v23 = v14;
  if (v14)
  {
    (*((void (**)(id, void, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0, 0);
    double v13 = v23;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(result + 16))(result, 0, 0, 0, 0, 0);
  }
  return result;
}

void __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = [*(id *)(a1 + 32) baseURL];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) baseURL];
    id v5 = [v4 URLByAppendingPathComponent:@"v1/vectors"];

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v19 = @"vector";
    v20[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v8 = [*(id *)(a1 + 32) endpointConnection];
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:0];
    int v10 = *MEMORY[0x1E4F18CF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_3;
    v16[3] = &unk_1E5B53D30;
    id v17 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v12 = v5;
    LODWORD(v13) = v10;
    [v8 performAuthenticatedHTTPRequestWithURL:v12 valuesByHTTPHeaderField:0 method:@"POST" data:v9 contentType:@"application/json" priority:1 reauthenticateIfNeeded:v13 callbackQueue:v11 completion:v16];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14)
    {
      id v15 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void, void, void))(v14 + 16))(v14, 0, 0, 0, 0);
    }
  }
}

void __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v7 statusCode], *(void *)(a1 + 32));
    int v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:0];
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      double v13 = [v10 objectForKeyedSubscript:@"enrolledTo"];
      uint64_t v14 = [v11 objectForKeyedSubscript:@"include"];
      id v15 = [v11 objectForKeyedSubscript:@"newsletters"];
      (*(void (**)(uint64_t, BOOL, void *, void *, void *, void *))(v12 + 16))(v12, v9 == 0, v13, v14, v15, v9);
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void, void, void, id))(v16 + 16))(v16, 0, 0, 0, 0, v8);
    }
  }
}

- (void)deletePersonalizationVectorWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCNewsletterEndpointConnection *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E5B5ACF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v11];
}

void __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = [*(id *)(a1 + 32) baseURL];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) baseURL];
    id v5 = [v4 URLByAppendingPathComponent:@"v1/vectors"];

    id v6 = [*(id *)(a1 + 32) endpointConnection];
    int v7 = *MEMORY[0x1E4F18CF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E5B53D30;
    id v14 = v5;
    uint64_t v8 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v9 = v5;
    LODWORD(v10) = v7;
    [v6 performAuthenticatedHTTPRequestWithURL:v9 valuesByHTTPHeaderField:0 method:@"Signed_DELETE" data:0 contentType:@"application/json" priority:1 reauthenticateIfNeeded:v10 callbackQueue:v8 completion:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v12);
    }
  }
}

void __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v7 statusCode], *(void *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, BOOL, void *))(v10 + 16))(v10, v9 == 0, v9);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v8);
    }
  }
}

- (void)getWebTokenWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCNewsletterEndpointConnection *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E5B5ACF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v11];
}

void __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = [*(id *)(a1 + 32) baseURL];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) baseURL];
    id v5 = [v4 URLByAppendingPathComponent:@"v1/webToken"];

    id v6 = [*(id *)(a1 + 32) endpointConnection];
    int v7 = *MEMORY[0x1E4F18CF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E5B53D30;
    id v14 = v5;
    uint64_t v8 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v9 = v5;
    LODWORD(v10) = v7;
    [v6 performAuthenticatedHTTPRequestWithURL:v9 valuesByHTTPHeaderField:0 method:@"Signed_GET" data:0 contentType:@"application/json" priority:1 reauthenticateIfNeeded:v10 callbackQueue:v8 completion:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v12);
    }
  }
}

void __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    double v10 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v8 statusCode], *(void *)(a1 + 32));
    uint64_t v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    if (v10)
    {
      id v12 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543362;
        uint64_t v20 = v10;
        _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch web token with error: %{public}@", (uint8_t *)&v19, 0xCu);
      }
    }
    id v13 = [v11 objectForKeyedSubscript:@"diagnostics"];
    if (v13)
    {
      id v14 = [MEMORY[0x1E4F1CA98] null];

      if (v13 != v14)
      {
        id v15 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          int v19 = 138543362;
          uint64_t v20 = v13;
          _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "Fetch web token returned diagnostics: %{public}@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16)
    {
      id v17 = [v11 objectForKeyedSubscript:@"webToken"];
      (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v9);
    }
  }
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(FCNewsletterEndpointConnection *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__FCNewsletterEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E5B50E70;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 enqueueBlock:v8];
}

void __78__FCNewsletterEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 updateBaseURL:v3];
  v4[2]();
}

- (void)setEndpointConnection:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end