@interface IMPushNotificationSettingsService
- (id)endpointURLForKey:(id)a3;
- (id)urlRequest;
- (void)performDataRequestWithCompletion:(id)a3;
@end

@implementation IMPushNotificationSettingsService

- (id)endpointURLForKey:(id)a3
{
  id v4 = a3;
  v5 = [(IMBaseStoreService *)self bag];
  v6 = [v5 dictionaryForKey:@"pushNotificationSettings"];

  v7 = [v6 asyncValuePromise];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__IMPushNotificationSettingsService_endpointURLForKey___block_invoke;
  v11[3] = &unk_1E5E638B8;
  id v12 = v4;
  id v8 = v4;
  v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __55__IMPushNotificationSettingsService_endpointURLForKey___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [a2 valueForKey:*(void *)(a1 + 32)];
    v5 = [v3 URLWithString:v4];

    if (v5)
    {
      v6 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
      v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bid" value:@"com.apple.Podcasts"];
      v18[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v6 setQueryItems:v8];

      v9 = [v6 URL];
    }
  }
  v10 = [NSString stringWithFormat:@"Unable to find an endpoint for the key '%@'", *(void *)(a1 + 32)];
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28568];
  v17 = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v13 = [v11 errorWithDomain:@"IMPushNotificationSettingsServiceErrorDomain" code:-1000 userInfo:v12];

  v14 = [MEMORY[0x1E4F4DDD0] promiseWithError:v13];

  return v14;
}

- (id)urlRequest
{
  return 0;
}

- (void)performDataRequestWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(IMPushNotificationSettingsService *)self urlRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__IMPushNotificationSettingsService_performDataRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E5E638E0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 addFinishBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__IMPushNotificationSettingsService_performDataRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70__IMPushNotificationSettingsService_performDataRequestWithCompletion___block_invoke_2;
      v9[3] = &unk_1E5E61310;
      id v8 = *(void **)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      [v8 performDataRequest:v5 callback:v9];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __70__IMPushNotificationSettingsService_performDataRequestWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a5);
  }
  return result;
}

@end