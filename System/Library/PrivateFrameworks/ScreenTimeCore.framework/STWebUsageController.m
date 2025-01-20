@interface STWebUsageController
- (NSXPCConnection)xpcConnection;
- (STPrivateServiceClient)privateServiceClient;
- (STWebUsageController)init;
- (void)_asynchronousProxyWithHandler:(id)a3;
- (void)dealloc;
- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4;
- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setPrivateServiceClient:(id)a3;
@end

@implementation STWebUsageController

- (STWebUsageController)init
{
  v8.receiver = self;
  v8.super_class = (Class)STWebUsageController;
  v2 = [(STWebUsageController *)&v8 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STPrivateServiceClient);
      privateServiceClient = v2->_privateServiceClient;
      v2->_privateServiceClient = v3;
    }
    else
    {
      v5 = +[STScreenTimeAgentPrivateConnection newConnection];
      xpcConnection = v2->_xpcConnection;
      v2->_xpcConnection = v5;

      [(NSXPCConnection *)v2->_xpcConnection resume];
    }
  }
  return v2;
}

- (void)dealloc
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(NSXPCConnection *)self->_xpcConnection invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)STWebUsageController;
  [(STWebUsageController *)&v3 dealloc];
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STWebUsageController *)self privateServiceClient];
    [v11 deleteWebHistoryForURL:v8 application:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC82A0;
    id v13 = v8;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v12];
  }
}

void __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC6FB8;
    id v9 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v9;
    [v5 deleteWebHistoryForURL:v7 webApplication:v8 replyHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STWebUsageController *)self privateServiceClient];
    [v11 deleteWebHistoryForURLs:v8 application:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC82A0;
    id v13 = v8;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v12];
  }
}

void __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC6FB8;
    id v9 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v9;
    [v5 deleteWebHistoryForURLs:v7 webApplication:v8 replyHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STWebUsageController *)self privateServiceClient];
    [v11 deleteWebHistoryForDomain:v8 application:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC82A0;
    id v13 = v8;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v12];
  }
}

void __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC6FB8;
    id v9 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v9;
    [v5 deleteWebHistoryForDomain:v7 webApplication:v8 replyHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STWebUsageController *)self privateServiceClient];
    [v11 deleteWebHistoryDuringInterval:v8 application:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC82A0;
    id v13 = v8;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v12];
  }
}

void __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC6FB8;
    id v9 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v9;
    [v5 deleteWebHistoryDuringInterval:v7 webApplication:v8 replyHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = [(STWebUsageController *)self privateServiceClient];
    [v8 deleteAllWebHistoryForApplication:v6 completionHandler:v7];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke;
    v9[3] = &unk_1E6BC82C8;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v9];
  }
}

void __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6BC6FB8;
    uint64_t v7 = a1[4];
    uint64_t v8 = (void *)a1[6];
    v10[4] = a1[5];
    id v11 = v8;
    [v5 deleteAllWebApplicationHistory:v7 replyHandler:v10];
  }
  else
  {
    uint64_t v9 = a1[6];
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }
}

uint64_t __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    id v14 = [(STWebUsageController *)self privateServiceClient];
    [v14 deleteWebHistoryForURL:v10 application:v11 profileIdentifier:v12 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E6BC82F0;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = self;
    id v20 = v13;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v15];
  }
}

void __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    uint64_t v9 = a1[6];
    id v10 = (void *)a1[8];
    void v12[4] = a1[7];
    id v13 = v10;
    [v5 deleteWebHistoryForURL:v7 webApplication:v8 profileIdentifier:v9 replyHandler:v12];
  }
  else
  {
    uint64_t v11 = a1[8];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
  }
}

uint64_t __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    id v14 = [(STWebUsageController *)self privateServiceClient];
    [v14 deleteWebHistoryForURLs:v10 application:v11 profileIdentifier:v12 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E6BC82F0;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = self;
    id v20 = v13;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v15];
  }
}

void __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    uint64_t v9 = a1[6];
    id v10 = (void *)a1[8];
    void v12[4] = a1[7];
    id v13 = v10;
    [v5 deleteWebHistoryForURLs:v7 webApplication:v8 profileIdentifier:v9 replyHandler:v12];
  }
  else
  {
    uint64_t v11 = a1[8];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
  }
}

uint64_t __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    id v14 = [(STWebUsageController *)self privateServiceClient];
    [v14 deleteWebHistoryForDomain:v10 application:v11 profileIdentifier:v12 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E6BC82F0;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = self;
    id v20 = v13;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v15];
  }
}

void __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    uint64_t v9 = a1[6];
    id v10 = (void *)a1[8];
    void v12[4] = a1[7];
    id v13 = v10;
    [v5 deleteWebHistoryForDomain:v7 webApplication:v8 profileIdentifier:v9 replyHandler:v12];
  }
  else
  {
    uint64_t v11 = a1[8];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
  }
}

uint64_t __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    id v14 = [(STWebUsageController *)self privateServiceClient];
    [v14 deleteWebHistoryDuringInterval:v10 application:v11 profileIdentifier:v12 completionHandler:v13];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E6BC82F0;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = self;
    id v20 = v13;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v15];
  }
}

void __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    uint64_t v9 = a1[6];
    id v10 = (void *)a1[8];
    void v12[4] = a1[7];
    id v13 = v10;
    [v5 deleteWebHistoryDuringInterval:v7 webApplication:v8 profileIdentifier:v9 replyHandler:v12];
  }
  else
  {
    uint64_t v11 = a1[8];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
  }
}

uint64_t __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    uint64_t v11 = [(STWebUsageController *)self privateServiceClient];
    [v11 deleteAllWebHistoryForApplication:v8 profileIdentifier:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC82A0;
    id v13 = v8;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    [(STWebUsageController *)self _asynchronousProxyWithHandler:v12];
  }
}

void __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC6FB8;
    id v9 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v9;
    [v5 deleteAllWebApplicationHistory:v7 profileIdentifier:v8 replyHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_asynchronousProxyWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STWebUsageController *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = (void (**)(id, void *, void))v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  v6[2](v6, v7, 0);
}

void __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (STPrivateServiceClient)privateServiceClient
{
  return self->_privateServiceClient;
}

- (void)setPrivateServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateServiceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  id v3 = @"com.apple.ScreenTimeAgent.private";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Connection error from %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end