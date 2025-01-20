@interface SMMMusicSubscriptionStatusController
+ (void)requestSubscriptionCapabilitiesWithCompletion:(id)a3;
@end

@implementation SMMMusicSubscriptionStatusController

+ (void)requestSubscriptionCapabilitiesWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F89208] sharedStatusController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__SMMMusicSubscriptionStatusController_requestSubscriptionCapabilitiesWithCompletion___block_invoke;
  v6[3] = &unk_264799678;
  id v7 = v3;
  id v5 = v3;
  [v4 getSubscriptionStatusWithCompletionHandler:v6];
}

uint64_t __86__SMMMusicSubscriptionStatusController_requestSubscriptionCapabilitiesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = a2;
    [v4 capabilities];
    [v4 capabilities];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

@end