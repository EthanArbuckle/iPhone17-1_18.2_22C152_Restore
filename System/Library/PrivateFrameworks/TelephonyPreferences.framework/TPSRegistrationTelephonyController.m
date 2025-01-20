@interface TPSRegistrationTelephonyController
- (CTNetworkSelectionInfo)networkSelectionInfo;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSArray)networks;
- (TPSRegistrationTelephonyController)init;
- (TPSRegistrationTelephonyController)initWithSubscriptionContext:(id)a3;
- (id)copyNetworkSelectionInfo;
- (void)automaticallySelectNetwork;
- (void)automaticallySelectNetworkWithCompletion:(id)a3;
- (void)copyNetworkSelectionInfo;
- (void)fetchNetworkList;
- (void)fetchNetworkListWithCompletion:(id)a3;
- (void)networkListAvailable:(id)a3 list:(id)a4;
- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5;
- (void)performDelegateSelector:(SEL)a3;
- (void)selectNetwork:(id)a3;
- (void)selectNetwork:(id)a3 completion:(id)a4;
- (void)setNetworkSelectionInfo:(id)a3;
- (void)setNetworks:(id)a3;
@end

@implementation TPSRegistrationTelephonyController

- (TPSRegistrationTelephonyController)init
{
  return 0;
}

- (TPSRegistrationTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSRegistrationTelephonyController;
  v6 = [(TPSTelephonyController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
  }

  return v7;
}

- (NSArray)networks
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  objc_super v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__TPSRegistrationTelephonyController_networks__block_invoke;
  v4[3] = &unk_1E6EB2280;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __46__TPSRegistrationTelephonyController_networks__block_invoke(uint64_t a1)
{
}

- (void)setNetworks:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__TPSRegistrationTelephonyController_setNetworks___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void *__50__TPSRegistrationTelephonyController_setNetworks___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 72) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;

    id v7 = *(void **)(a1 + 32);
    return (void *)[v7 performDelegateSelector:sel_networksChangedForRegistrationController_];
  }
  return result;
}

- (CTNetworkSelectionInfo)networkSelectionInfo
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  objc_super v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__TPSRegistrationTelephonyController_networkSelectionInfo__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CTNetworkSelectionInfo *)v2;
}

void __58__TPSRegistrationTelephonyController_networkSelectionInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[10];
  if (!v3)
  {
    uint64_t v4 = [v2 copyNetworkSelectionInfo];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v7, v3);
}

- (void)setNetworkSelectionInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__TPSRegistrationTelephonyController_setNetworkSelectionInfo___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

id *__62__TPSRegistrationTelephonyController_setNetworkSelectionInfo___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  result = (id *)(*(void *)(a1 + 32) + 80);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    id v4 = *(void **)(a1 + 32);
    return (id *)[v4 performDelegateSelector:sel_networkSelectionInfoChangedForRegistrationController_];
  }
  return result;
}

- (void)automaticallySelectNetwork
{
}

void __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = TPSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)automaticallySelectNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v5 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  [v6 automaticallySelectNetwork:v5 completion:v4];
}

- (void)selectNetwork:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke;
  v6[3] = &unk_1E6EB2340;
  id v7 = v4;
  id v5 = v4;
  [(TPSRegistrationTelephonyController *)self selectNetwork:v5 completion:v6];
}

void __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)selectNetwork:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v8 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  [v9 selectNetwork:v8 network:v7 completion:v6];
}

- (id)copyNetworkSelectionInfo
{
  id v3 = [(TPSTelephonyController *)self telephonyClient];
  id v4 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  id v15 = 0;
  id v5 = (void *)[v3 copyNetworkSelectionInfo:v4 error:&v15];
  id v6 = v15;

  if (v6)
  {
    id v7 = TPSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(TPSRegistrationTelephonyController *)(uint64_t)v6 copyNetworkSelectionInfo];
    }
  }
  return v5;
}

- (void)fetchNetworkList
{
}

void __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 domain];

    if (v4)
    {
      id v5 = TPSLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
}

- (void)fetchNetworkListWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  id v5 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  [v6 fetchNetworkList:v5 completion:v4];
}

- (void)performDelegateSelector:(SEL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke;
  v3[3] = &unk_1E6EB2408;
  v3[4] = self;
  v3[5] = a3;
  [(TPSController *)self performAtomicDelegateBlock:v3];
}

void __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          uint64_t v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke_2;
          block[3] = &unk_1E6EB23E0;
          block[4] = v7;
          long long v11 = *(_OWORD *)(a1 + 32);
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)networkListAvailable:(id)a3 list:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    uint64_t v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "Network list is available %@", (uint8_t *)&v12, 0xCu);
    }

    long long v11 = [v6 networks];
    [(TPSRegistrationTelephonyController *)self setNetworks:v11];
  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  BOOL v5 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(TPSRegistrationTelephonyController *)self subscriptionContext];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    uint64_t v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = @"failed";
      if (v5) {
        long long v11 = @"succeeded";
      }
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "Manual network selection %@ for subscription %@.", (uint8_t *)&v13, 0x16u);
    }

    id v12 = [(TPSRegistrationTelephonyController *)self copyNetworkSelectionInfo];
    [(TPSRegistrationTelephonyController *)self setNetworkSelectionInfo:v12];
  }
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_networkSelectionInfo, 0);
  objc_storeStrong((id *)&self->_networks, 0);
}

void __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Manual selection of network %@ failed with error %@.", (uint8_t *)&v4, 0x16u);
}

- (void)copyNetworkSelectionInfo
{
}

void __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end