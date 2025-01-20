@interface TPSRegistrationRequestController
- (void)executeFetchForRequest:(id)a3;
- (void)executeRequest:(id)a3;
- (void)networkListAvailable:(id)a3 list:(id)a4;
- (void)respondWithSubscription:(id)a3 cellularNetworks:(id)a4 error:(id)a5;
@end

@implementation TPSRegistrationRequestController

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(TPSRegistrationRequestController *)self executeFetchForRequest:v4];
  }
}

- (void)executeFetchForRequest:(id)a3
{
  id v4 = [a3 subscriptionContext];
  v5 = [(TPSRequestController *)self telephonyClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TPSRegistrationRequestController_executeFetchForRequest___block_invoke;
  v7[3] = &unk_1E6EB24D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchNetworkList:v6 completion:v7];
}

uint64_t __59__TPSRegistrationRequestController_executeFetchForRequest___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) respondWithSubscription:*(void *)(result + 40) cellularNetworks:0 error:a2];
  }
  return result;
}

- (void)respondWithSubscription:(id)a3 cellularNetworks:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[TPSCellularNetworksResponse alloc] initWithSubscriptionContext:v10 error:v8 cellularNetworks:v9];

  [(TPSRequestController *)self postResponse:v11];
}

- (void)networkListAvailable:(id)a3 list:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a4 networks];
  id v8 = TPSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(TPSRequestController *)self pendingRequest];
    int v10 = 138412546;
    v11 = v9;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Cellular network fetch request succeeded for %@; value is %@.",
      (uint8_t *)&v10,
      0x16u);
  }
  [(TPSRegistrationRequestController *)self respondWithSubscription:v6 cellularNetworks:v7 error:0];
}

@end