@interface RMConfigurationSubscriberService
+ (id)newConfigurationSubscriberServiceWithXPCConnection:(id)a3;
- (BOOL)hasServiceEntitlement;
- (NSArray)configurationTypes;
- (NSArray)statusKeys;
- (RMConfigurationSubscriberService)initWithXPCConnection:(id)a3;
- (void)fetchThenApplyConfigurationsWithScope:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchThenUpdateConfigurationUIsWithScope:(int64_t)a3 completionHandler:(id)a4;
- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
@end

@implementation RMConfigurationSubscriberService

+ (id)newConfigurationSubscriberServiceWithXPCConnection:(id)a3
{
  id v3 = a3;
  v4 = [[RMConfigurationSubscriberService alloc] initWithXPCConnection:v3];

  return v4;
}

- (RMConfigurationSubscriberService)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RMConfigurationSubscriberService;
  v5 = [(RMConfigurationSubscriberService *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = [v6 infoDictionary];
    v8 = +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:v7];

    v9 = [v8 types];
    uint64_t v10 = [v9 copy];
    configurationTypes = v5->_configurationTypes;
    v5->_configurationTypes = (NSArray *)v10;

    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 infoDictionary];
    v14 = +[RMStatusPublisherDescription descriptionWithServiceDictionary:v13];

    v15 = [v14 statusKeys];
    uint64_t v16 = [v15 allObjects];
    statusKeys = v5->_statusKeys;
    v5->_statusKeys = (NSArray *)v16;

    v18 = [v4 valueForEntitlement:@"com.apple.private.remotemanagement.configuration-subscriber-service"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v19 = [v18 BOOLValue];
    }
    else {
      char v19 = 0;
    }
    v5->_hasServiceEntitlement = v19;
  }
  return v5;
}

- (void)fetchThenApplyConfigurationsWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(RMConfigurationSubscriberService *)self hasServiceEntitlement];
  v8 = [MEMORY[0x263F635B0] configurationSubscriberService];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:](a3, self);
    }

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v11 = [(RMConfigurationSubscriberService *)self configurationTypes];
    v12 = [v10 setWithArray:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke;
    v21[3] = &unk_26548F8D0;
    int64_t v23 = a3;
    v21[4] = self;
    id v22 = v6;
    [(RMConfigurationSubscriberClient *)self fetchConfigurationsWithTypes:v12 scope:a3 completionHandler:v21];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:](v9, v13, v14, v15, v16, v17, v18, v19);
    }

    v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v20);
  }
}

void __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] configurationSubscriberService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke_cold_1(a1);
  }

  if (v3)
  {
    v5 = (void *)MEMORY[0x263F63598];
    id v6 = [v3 debugDescription];
    BOOL v7 = [v5 createInternalErrorWithDescription:v6];
  }
  else
  {
    BOOL v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchThenUpdateConfigurationUIsWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(RMConfigurationSubscriberService *)self hasServiceEntitlement];
  v8 = [MEMORY[0x263F635B0] configurationSubscriberService];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RMConfigurationSubscriberService fetchThenUpdateConfigurationUIsWithScope:completionHandler:](a3, v9);
    }

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v11 = [(RMConfigurationSubscriberService *)self configurationTypes];
    v12 = [v10 setWithArray:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke;
    v21[3] = &unk_26548F8F8;
    int64_t v23 = a3;
    id v22 = v6;
    [(RMConfigurationSubscriberClient *)self fetchConfigurationUIsWithTypes:v12 scope:a3 completionHandler:v21];

    uint64_t v13 = v22;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:](v9, v14, v15, v16, v17, v18, v19, v20);
    }

    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v13);
  }
}

void __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] configurationSubscriberService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke_cold_1(a1, v4);
  }

  if (v3)
  {
    v5 = (void *)MEMORY[0x263F63598];
    id v6 = [v3 debugDescription];
    BOOL v7 = [v5 createInternalErrorWithDescription:v6];
  }
  else
  {
    BOOL v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [(RMConfigurationSubscriberService *)self hasServiceEntitlement];
  uint64_t v14 = [MEMORY[0x263F635B0] configurationSubscriberService];
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[RMConfigurationSubscriberService publishStatusKeys:storeIdentifier:scope:completionHandler:]((uint64_t)v10, v15, v16);
    }

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke;
    v25[3] = &unk_26548F578;
    id v26 = v10;
    id v27 = v12;
    [(RMConfigurationSubscriberClient *)self sendStatusKeys:v26 storeIdentifier:v11 scope:a5 completionHandler:v25];

    uint64_t v17 = v26;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:](v15, v18, v19, v20, v21, v22, v23, v24);
    }

    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }
}

void __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] configurationSubscriberService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(a1, v4, v5);
  }

  if (v3)
  {
    id v6 = (void *)MEMORY[0x263F63598];
    BOOL v7 = [v3 debugDescription];
    v8 = [v6 createInternalErrorWithDescription:v7];
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)configurationTypes
{
  return self->_configurationTypes;
}

- (NSArray)statusKeys
{
  return self->_statusKeys;
}

- (BOOL)hasServiceEntitlement
{
  return self->_hasServiceEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_configurationTypes, 0);
}

- (void)fetchThenApplyConfigurationsWithScope:(uint64_t)a1 completionHandler:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(NSString, "rms_stringWithScope:", a1);
  id v4 = [a2 configurationTypes];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_25B003000, v5, v6, "Fetch configurations for %{public}@ scope with types: %{public}@...", v7, v8, v9, v10, v11);
}

- (void)fetchThenApplyConfigurationsWithScope:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  v2 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) configurationTypes];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_25B003000, v4, v5, "Processed configurations for %{public}@ scope with types: %{public}@...", v6, v7, v8, v9, v10);
}

- (void)fetchThenUpdateConfigurationUIsWithScope:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSString, "rms_stringWithScope:", a1);
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_2_3(&dword_25B003000, a2, v4, "Fetching configuration UIs for %{public}@ scope...", (uint8_t *)&v5);
}

void __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 40));
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_2_3(&dword_25B003000, a2, v4, "Fetching missing configuration UIs for %{public}@ scope...", (uint8_t *)&v5);
}

- (void)publishStatusKeys:(uint64_t)a3 storeIdentifier:scope:completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2_3(&dword_25B003000, a2, a3, "Fetch status keys: %{public}@", (uint8_t *)&v3);
}

void __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_3(&dword_25B003000, a2, a3, "Processed status keys: %{public}@...", (uint8_t *)&v4);
}

@end