@interface PSSSSubscriptionManagerInternal
- (PSSSSubscriptionManagerInternal)init;
- (VSSubscriptionRegistrationCenter)registrationCenter;
- (void)getActiveSubscriptionServicesMatchingBundleIdentifiers:(id)a3 domainIdentifiers:(id)a4 maximumExpirationLimit:(double)a5 completionHandler:(id)a6;
- (void)registerSubscriptionServiceForURL:(id)a3 withSubscriptionInfo:(id)a4 expirationDate:(id)a5;
- (void)removeSubscriptionServiceForURL:(id)a3;
- (void)removeWebSubscriptionServicesCreatedAfterDate:(id)a3;
- (void)setRegistrationCenter:(id)a3;
@end

@implementation PSSSSubscriptionManagerInternal

- (PSSSSubscriptionManagerInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSSSSubscriptionManagerInternal;
  v2 = [(PSSSSubscriptionManagerInternal *)&v6 init];
  if (v2)
  {
    v3 = (VSSubscriptionRegistrationCenter *)objc_alloc_init(MEMORY[0x263F1E2B0]);
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = v3;
  }
  return v2;
}

- (void)getActiveSubscriptionServicesMatchingBundleIdentifiers:(id)a3 domainIdentifiers:(id)a4 maximumExpirationLimit:(double)a5 completionHandler:(id)a6
{
  id v8 = a6;
  if (v8)
  {
    v9 = VSSubscriptionFetchOptionsForBundleIdentifiersAndDomainNames();
    v10 = [MEMORY[0x263EFF910] date];
    v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a5];
    v12 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v11 endDate:v10];
    v13 = [(PSSSSubscriptionManagerInternal *)self registrationCenter];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __149__PSSSSubscriptionManagerInternal_getActiveSubscriptionServicesMatchingBundleIdentifiers_domainIdentifiers_maximumExpirationLimit_completionHandler___block_invoke;
    v15[3] = &unk_265099920;
    id v16 = v12;
    id v17 = v8;
    id v14 = v12;
    [v13 fetchActiveSubscriptionsWithOptions:v9 completionHandler:v15];
  }
}

void __149__PSSSSubscriptionManagerInternal_getActiveSubscriptionServicesMatchingBundleIdentifiers_domainIdentifiers_maximumExpirationLimit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  objc_super v6 = v5;
  if (v4)
  {
    id v23 = v5;
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          id v14 = objc_msgSend(v12, "modificationDate", v23);
          uint64_t v15 = [v13 containsDate:v14];

          id v16 = objc_opt_new();
          id v17 = [v12 source];
          v18 = [v17 identifier];
          v19 = (void *)[v18 copy];

          [v16 setObject:v19 forKey:@"provider"];
          v20 = [v12 subscriptionInfo];
          v21 = (void *)[v20 copy];
          [v16 setObject:v21 forKey:@"type"];

          v22 = [NSNumber numberWithBool:v15];
          [v16 setObject:v22 forKey:@"active"];

          [v7 setObject:v16 forKey:v19];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    objc_super v6 = v23;
    id v4 = v24;
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerSubscriptionServiceForURL:(id)a3 withSubscriptionInfo:(id)a4 expirationDate:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F1E2B8];
  id v9 = a5;
  id v10 = a4;
  id v13 = [v8 subscriptionSourceForWebsiteWithURL:a3];
  id v11 = objc_alloc_init(MEMORY[0x263F1E2A8]);
  [v11 setSource:v13];
  [v11 setExpirationDate:v9];

  [v11 setSubscriptionInfo:v10];
  v12 = [(PSSSSubscriptionManagerInternal *)self registrationCenter];
  [v12 registerSubscription:v11];
}

- (void)removeSubscriptionServiceForURL:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F1E2B8] subscriptionSourceForWebsiteWithURL:a3];
  uint64_t v5 = *MEMORY[0x263F1E488];
  v12 = v4;
  uint64_t v13 = v5;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v14[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  uint64_t v8 = [(PSSSSubscriptionManagerInternal *)self registrationCenter];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__PSSSSubscriptionManagerInternal_removeSubscriptionServiceForURL___block_invoke;
  v10[3] = &unk_2650998F8;
  id v11 = v8;
  id v9 = v8;
  [v9 fetchActiveSubscriptionsWithOptions:v7 completionHandler:v10];
}

void __67__PSSSSubscriptionManagerInternal_removeSubscriptionServiceForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) removeSubscriptions:v3];
  }
}

- (void)removeWebSubscriptionServicesCreatedAfterDate:(id)a3
{
  id v4 = VSSubscriptionFetchOptionsForWebSubscriptionsCreatedAfterDate();
  uint64_t v5 = [(PSSSSubscriptionManagerInternal *)self registrationCenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__PSSSSubscriptionManagerInternal_removeWebSubscriptionServicesCreatedAfterDate___block_invoke;
  v7[3] = &unk_2650998F8;
  id v8 = v5;
  id v6 = v5;
  [v6 fetchActiveSubscriptionsWithOptions:v4 completionHandler:v7];
}

void __81__PSSSSubscriptionManagerInternal_removeWebSubscriptionServicesCreatedAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) removeSubscriptions:v3];
  }
}

- (VSSubscriptionRegistrationCenter)registrationCenter
{
  return self->_registrationCenter;
}

- (void)setRegistrationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end