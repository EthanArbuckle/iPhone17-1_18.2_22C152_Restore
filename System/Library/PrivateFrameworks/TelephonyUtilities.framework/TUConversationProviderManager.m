@interface TUConversationProviderManager
- (TUConversationProviderManager)init;
- (TUConversationProviderManager)initWithDataSource:(id)a3;
- (TUConversationProviderManagerDataSource)dataSource;
- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6;
- (void)registerConversationProviderForConfiguration:(id)a3 completionHandler:(id)a4;
- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4;
- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5;
@end

@implementation TUConversationProviderManager

- (TUConversationProviderManager)init
{
  v3 = objc_alloc_init(TUConversationProviderManagerXPCClient);
  v4 = [(TUConversationProviderManager *)self initWithDataSource:v3];

  return v4;
}

- (TUConversationProviderManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUConversationProviderManager;
  v6 = [(TUConversationProviderManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(TUConversationProviderManager *)self dataSource];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TUConversationProviderManager;
  [(TUConversationProviderManager *)&v4 dealloc];
}

- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "providerIdentifier: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_super v9 = [(TUConversationProviderManager *)self dataSource];
  [v9 registerForCallbacksForProvider:v6 completionHandler:v7];
}

- (void)registerConversationProviderForConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "configuration: %@", buf, 0xCu);
  }

  objc_super v9 = [[TUConversationProvider alloc] initWithConfiguration:v6];
  int v10 = [(TUConversationProviderManager *)self dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__TUConversationProviderManager_registerConversationProviderForConfiguration_completionHandler___block_invoke;
  v13[3] = &unk_1E58E6788;
  v14 = v9;
  id v15 = v7;
  id v11 = v9;
  id v12 = v7;
  [v10 registerConversationProvider:v11 completionHandler:v13];
}

uint64_t __96__TUConversationProviderManager_registerConversationProviderForConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "identifier: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_super v9 = [(TUConversationProviderManager *)self dataSource];
  [v9 conversationProviderForIdentifier:v6 completionHandler:v7];
}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v10;
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "provider: %@ expiryDuration: %f uri: %@", (uint8_t *)&v15, 0x20u);
  }

  v14 = [(TUConversationProviderManager *)self dataSource];
  [v14 generatePseudonymHandleForConversationProvider:v10 expiryDuration:v11 URI:v12 completionHandler:a4];
}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = TUDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "pseudonymHandle: %@ provider: %@ expirationDate: %@", (uint8_t *)&v16, 0x20u);
  }

  int v15 = [(TUConversationProviderManager *)self dataSource];
  [v15 renewPseudonymHandle:v10 forConversationProvider:v11 expirationDate:v12 completionHandler:v13];
}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "pseudonymHandle: %@ provider: %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(TUConversationProviderManager *)self dataSource];
  [v12 revokePseudonymHandle:v8 forConversationProvider:v9 completionHandler:v10];
}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "handle: %@ provider: %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(TUConversationProviderManager *)self dataSource];
  [v12 doesHandle:v8 correspondToConversationProvider:v9 completionHandler:v10];
}

- (TUConversationProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end