@interface SCUtils
+ (void)registerDarwinNotification:(id)a3;
+ (void)registerNeededNotificationsForManager:(id)a3 completionHandler:(id)a4;
+ (void)submitTaskRequest:(id)a3 completion:(id)a4;
+ (void)unregisterDarwinNotification:(id)a3;
@end

@implementation SCUtils

+ (void)registerDarwinNotification:(id)a3
{
  v3 = (const char *)[a3 cStringUsingEncoding:4];
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "Notification", v3);
  xpc_set_event();
}

+ (void)unregisterDarwinNotification:(id)a3
{
  [a3 cStringUsingEncoding:4];
  xpc_set_event();
}

+ (void)registerNeededNotificationsForManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke;
  v8[3] = &unk_2654970E0;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a3 getNeededNotificationsWithCompletion:v8];
}

void __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
    }

    v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 40) registerDarwinNotification:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
    v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

+ (void)submitTaskRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F29900] sharedScheduler];
  v8 = [v5 identifier];
  uint64_t v9 = [v7 taskRequestForIdentifier:v8];

  if (v9)
  {
    uint64_t v10 = SCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_25B654000, v10, OS_LOG_TYPE_DEFAULT, "\"Not submitting task request %@ because one already exists\"", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F29900] sharedScheduler];
    id v15 = 0;
    uint64_t v12 = [v11 submitTaskRequest:v5 error:&v15];
    long long v13 = (__CFString *)v15;

    if ((v12 & 1) == 0)
    {
      long long v14 = SCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[SCUtils submitTaskRequest:completion:](v13, v14);
      }
    }
    (*((void (**)(id, uint64_t, __CFString *))v6 + 2))(v6, v12, v13);
  }
}

void __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"Failed to get needed notifications for registering. Error: %@\"", (uint8_t *)&v2, 0xCu);
}

+ (void)submitTaskRequest:(__CFString *)a1 completion:(NSObject *)a2 .cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v2 = @"Unknown";
  if (a1) {
    int v2 = a1;
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "@\"SCUtils Failed to submit task. Error: %@\"", (uint8_t *)&v3, 0xCu);
}

@end