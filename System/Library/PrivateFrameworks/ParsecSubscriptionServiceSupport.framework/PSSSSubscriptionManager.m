@interface PSSSSubscriptionManager
- (PSSSSubscriptionManager)init;
- (VSSubscriptionRegistrationCenter)registrationCenter;
- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4;
- (void)setRegistrationCenter:(id)a3;
- (void)unregisterAllSubscriptions;
- (void)unregisterSubscriptionWithInfo:(id)a3;
@end

@implementation PSSSSubscriptionManager

- (PSSSSubscriptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSSSSubscriptionManager;
  v2 = [(PSSSSubscriptionManager *)&v6 init];
  if (v2)
  {
    v3 = (VSSubscriptionRegistrationCenter *)objc_alloc_init(MEMORY[0x263F1E2B0]);
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = v3;
  }
  return v2;
}

- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4
{
  objc_super v6 = (objc_class *)MEMORY[0x263F1E2A8];
  id v7 = a4;
  id v8 = a3;
  id v10 = objc_alloc_init(v6);
  [v10 setSubscriptionInfo:v8];

  [v10 setExpirationDate:v7];
  v9 = [(PSSSSubscriptionManager *)self registrationCenter];
  [v9 registerSubscription:v10];
}

- (void)unregisterSubscriptionWithInfo:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F1E490];
  v12[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  objc_super v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = [(PSSSSubscriptionManager *)self registrationCenter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__PSSSSubscriptionManager_unregisterSubscriptionWithInfo___block_invoke;
  v9[3] = &unk_2650998F8;
  id v10 = v7;
  id v8 = v7;
  [v8 fetchActiveSubscriptionsWithOptions:v6 completionHandler:v9];
}

void __58__PSSSSubscriptionManager_unregisterSubscriptionWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) removeSubscriptions:v3];
  }
}

- (void)unregisterAllSubscriptions
{
  id v2 = [(PSSSSubscriptionManager *)self registrationCenter];
  [v2 setCurrentSubscription:0];
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